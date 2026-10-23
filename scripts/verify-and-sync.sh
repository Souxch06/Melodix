#!/usr/bin/env bash
# Melodix verification, safe synchronization, and CI check script.
# Never embeds credentials, never modifies `main`, never force-pushes,
# and never creates or overwrites GitHub Releases.

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$REPO_ROOT"

COMMIT_MSG=""
DO_PUSH=0
WAIT_CI=0
declare -a EXTRA_PATHS=()

usage() {
  cat <<'EOF'
Usage:
  ./scripts/verify-and-sync.sh [options] [-- <paths...>]

Options:
  -m, --commit <message>  Stage tracked updates (plus explicit <paths...>) and create a descriptive commit
  -p, --push              Fast-forward push current development branch to origin
  -w, --wait-ci           Poll GitHub Actions runs on exact 40-char HEAD SHA until completion
  -h, --help              Show this help message

Safety guarantees:
  - Refuses to commit or push on `main` or detached HEAD
  - Never runs `git push --force` or rewrites Git history
  - Refuses forbidden untracked/signing files (*.jks, *.keystore, *.p12, docs/previews/melodix-phone-ui-concept.png)
  - Runs the full Node + static Dalvik CFG verifier + E2E Smali patch verification before any commit/push
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    -m|--commit)
      COMMIT_MSG="${2:-}"
      if [[ -z "$COMMIT_MSG" ]]; then
        echo "ERROR: --commit requires a non-empty message." >&2
        exit 1
      fi
      shift 2
      ;;
    -p|--push)
      DO_PUSH=1
      shift
      ;;
    -w|--wait-ci)
      WAIT_CI=1
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    --)
      shift
      while [[ $# -gt 0 ]]; do
        EXTRA_PATHS+=("$1")
        shift
      done
      ;;
    *)
      EXTRA_PATHS+=("$1")
      shift
      ;;
  esac
done

CURRENT_BRANCH="$(git branch --show-current)"
if [[ -z "$CURRENT_BRANCH" ]]; then
  echo "ERROR: Detached HEAD detected; switch to the active working branch first." >&2
  exit 1
fi

if [[ "$CURRENT_BRANCH" == "main" && ( -n "$COMMIT_MSG" || "$DO_PUSH" -eq 1 ) ]]; then
  echo "ERROR: Direct commits or pushes to 'main' are strictly forbidden." >&2
  exit 1
fi

echo "==> [1/4] Running full Melodix test suite (Node + JS syntax + SSRF + Dalvik CFG verifier)..."
node --test tests/*.test.js
rm -rf build/served_spotify_bridge.js

echo "==> [2/4] Verifying E2E instrumentation Smali patch against Dalvik CFG verifier..."
python3 - <<'PY'
import shutil, subprocess, tempfile

with tempfile.TemporaryDirectory() as tmp:
    target = f"{tmp}/MainActivity.smali"
    shutil.copy("smali/com/melodix/music/MainActivity.smali", target)
    wf = open(".github/workflows/test-preview-emulator.yml", encoding="utf-8").read()
    s = wf.index("python3 - \"$work_dir/smali/com/melodix/music/MainActivity.smali\" <<'PY'\n")
    body_start = wf.index("\n", s) + 1
    body_end = wf.index("\n          PY", body_start)
    py_code = "\n".join(line[10:] if line.startswith("          ") else line for line in wf[body_start:body_end].splitlines())
    subprocess.run(["python3", "-", target], input=py_code, text=True, check=True)
    js_check = f"""
    const fs = require('node:fs');
    const src = fs.readFileSync('tests/audit_remediation.test.js', 'utf8');
    const start = src.indexOf('function verifySmaliSource(');
    const end = src.indexOf("\\ntest('[D7]");
    const fn = eval('(' + src.slice(start, end) + ')');
    const bugs = fn('e2e/MainActivity.smali', fs.readFileSync({target!r}, 'utf8'));
    if (bugs.length) {{ console.error(bugs); process.exit(1); }}
    """
    subprocess.run(["node", "-e", js_check], check=True)
PY

if [[ -n "$COMMIT_MSG" ]]; then
  echo "==> [3/4] Staging validated changes safely on branch '$CURRENT_BRANCH'..."
  git add -u
  for p in "${EXTRA_PATHS[@]}"; do
    git add -- "$p"
  done

  STAGED="$(git diff --cached --name-only)"
  if [[ -z "$STAGED" ]]; then
    echo "INFO: Working tree has no staged changes to commit (skipping empty commit)."
  else
    while IFS= read -r f; do
      case "$f" in
        *.jks|*.keystore|*.p12|*.apk|*.apk.idsig|docs/previews/melodix-phone-ui-concept.png)
          echo "ERROR: Refusing to commit forbidden file: $f" >&2
          git reset HEAD -- "$f"
          exit 1
          ;;
      esac
    done <<< "$STAGED"

    if git diff --cached | grep -E '^\+.*(ghp_[A-Za-z0-9]{20,}|github_pat_[A-Za-z0-9_]{20,}|BEGIN (RSA |EC |OPENSSH )?PRIVATE KEY)' >/dev/null; then
      echo "ERROR: Potential credential or private key detected in staged diff." >&2
      exit 1
    fi

    git commit -m "$COMMIT_MSG"
  fi
fi

HEAD_SHA="$(git rev-parse HEAD)"
echo "==> Local HEAD on '$CURRENT_BRANCH': $HEAD_SHA"

if [[ "$DO_PUSH" -eq 1 ]]; then
  echo "==> [4/4] Pushing fast-forward update to origin/$CURRENT_BRANCH..."
  git push origin "$CURRENT_BRANCH"
fi

if [[ "$WAIT_CI" -eq 1 ]]; then
  echo "==> Polling GitHub Actions workflows for commit $HEAD_SHA..."
  sleep 8
  for attempt in $(seq 1 45); do
    OUT="$(gh run list --branch "$CURRENT_BRANCH" --json databaseId,name,status,conclusion,headSha \
      --jq ".[] | select(.headSha == \"$HEAD_SHA\") | \"\(.databaseId)\t\(.status)\t\(.conclusion // \"-\")\t\(.name)\"")"
    echo "[$attempt] $(date -u +%H:%M:%SZ)"
    echo "$OUT"
    COUNT="$(printf '%s\n' "$OUT" | grep -c . || true)"
    DONE="$(printf '%s\n' "$OUT" | awk -F'\t' '$2=="completed"{c++} END{print c+0}')"
    if [[ "$COUNT" -ge 1 && "$DONE" -eq "$COUNT" ]]; then
      FAILED="$(printf '%s\n' "$OUT" | awk -F'\t' '$3!="success"{c++} END{print c+0}')"
      if [[ "$FAILED" -gt 0 ]]; then
        echo "ERROR: $FAILED workflow run(s) failed for commit $HEAD_SHA." >&2
        exit 1
      fi
      echo "SUCCESS: All $COUNT workflows succeeded for commit $HEAD_SHA."
      exit 0
    fi
    sleep 15
  done
  echo "ERROR: Timed out waiting for workflows on $HEAD_SHA." >&2
  exit 1
fi
