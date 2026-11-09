#!/usr/bin/env python3
"""Turn the app's own diagnostic journal into a startup timeline.

The app already records two independent, privacy-redacted trails:

  * `NativeCrashGuard.stage(...)`  -> `last_stage`, a single SharedPreferences
    string overwritten on every transition (so it only ever shows the LAST one);
  * `NativeCrashGuard.diagLine(...)` / `AppSingleton.noteDiag(...)` -> an
    append-only, bounded journal that survives the whole launch.

This script reads that journal (as copied out of the device by the emulator
workflow, or pasted from the in-app "Copier le diagnostic" button) and prints a
startup table expressed in milliseconds since `activity-create`, plus the
request/render counters the reviewer asked for (how many payloads, how many
renders).

It measures only what the app logged. Anything the app does not log is printed
as NOT MEASURED — never estimated — so a missing number is visible instead of
silently invented.

Usage:
    startup_timing_journal.py JOURNAL_FILE [--json OUT.json]

`JOURNAL_FILE` may be:
  * the raw `last_diag` value (one line, `|`-separated entries),
  * a full diagnostic block (`ecran=... cookie=... | route ... | ...`),
  * the output of `adb shell run-as ... cat shared_prefs/melodix_native.xml`
    (the XML is scanned for the `last_diag` string; no other preference is read).

Exit status is 0 when a timeline could be produced, 2 when no `activity-create`
marker is present (nothing to anchor on).
"""

import json
import html
import re
import sys
from pathlib import Path

# Ordered startup milestones, as the native side and the JS shell emit them.
# `required` milestones are the ones the optimisation must move; the rest are
# recorded for correlation only.
MILESTONES = [
    ('activity-create', 'activité créée (onCreate)', True),
    ('activity-resume', 'activité reprise (hors premier resume)', False),
    ('content-view', 'arbre de vues posé', True),
    ('signature-ok', 'signature vérifiée', False),
    ('webview-created', 'WebView créée', True),
    ('webview-load-start', 'chargement de la page demandé', True),
    ('page-loaded', 'page chargée (onPageFinished)', True),
    ('js-shell-ready', 'shell JS installé', True),
    ('bridge-js-started', 'bridge JS démarré', False),
    ('bridge-bootstrap-ready', 'bridge prêt', False),
    ('home-data stage=web-to-android result=sent', 'payload Home envoyé au natif', True),
    ('home-data stage=android-received result=received', 'payload Home reçu par le natif', True),
    ('home-data stage=android-render-start', 'rendu natif commencé', True),
    ('home-first-paint', 'premières cartes attachées (avant draw)', True),
    ('home-first-image', 'première pochette chargée (Picasso)', True),
    ('token-request', 'tentative de jeton commencée', True),
    ('token-ready', 'tentative de jeton terminée', True),
    ('library.request.started', 'requête bibliothèque envoyée', True),
    ('library.request.response', 'réponse bibliothèque reçue', True),
]

# Durations the app itself records (already in ms) — used as a cross-check of
# wall-clock deltas when both are available.
DURATION_FIELDS = {
    'library.request.response': 'duration',
    'home-trace': 'duration',
}


def load_text(path):
    raw = open(path, encoding='utf-8', errors='replace').read()
    # A SharedPreferences dump: keep only the journal values.
    if raw.lstrip().startswith('<'):
        parts = re.findall(r'<string name="(?:last_diag|diag_native)">([^<]*)</string>', raw)
        return html.unescape('\n'.join(parts))
    return raw


def parse_entries(text):
    """Split the journal into ordered entries, keeping the payload verbatim."""
    text = html.unescape(text)
    if 'MDXPERF-BEGIN' in text:
        match = re.search(r'MDXPERF-BEGIN[^\n]*\n(.*?)MDXPERF-END', text, re.S)
        if not match:
            return []
        text = match.group(1)
    # Full logcat includes Android prefixes and older, unstamped duplicate JS
    # lines. Keep only the new complete trail written centrally by diagLine.
    if re.search(r'MDXTRACE(?:\(\s*\d+\s*\))?\s*:', text):
        return [m.group(1).strip() for line in text.splitlines()
                if (m := re.search(r'MDXTRACE(?:\(\s*\d+\s*\))?\s*:\s*(sid=\S+ t=\d+ .*)$', line))]
    return [e.strip() for e in re.split(r'\s\|\s|[\r\n]+', text) if e.strip()]



def stamp(entry):
    match = re.match(r'^(?:sid=\S+\s+)?t=(\d+)\s+(.*)$', entry)
    if match:
        return int(match.group(1)), match.group(2)
    return None, entry


def first_hits(entries):
    hits = {}
    counts = {}
    t0 = None
    for index, entry in enumerate(entries):
        ts, body = stamp(entry)
        for marker, label, required in MILESTONES:
            if marker in body and marker not in hits:
                hits[marker] = {'index': index, 't': ts, 'body': body[:120], 'label': label,
                                'required': required}
            if marker in body:
                counts[marker] = counts.get(marker, 0) + 1
        if t0 is None and 'activity-create' in body and ts is not None:
            t0 = ts
    return hits, counts, t0


def build_report(entries):
    # Select the latest launch, never combine clocks/counters across sessions.
    anchors = [i for i, e in enumerate(entries)
               if stamp(e)[0] is not None and stamp(e)[1] in ('perf activity-create', 'perf activity-resume')]
    if not anchors:
        return None
    entries = entries[anchors[-1]:]
    session = re.match(r'^sid=(\S+) ', entries[0])
    if session:
        entries = [e for e in entries if e.startswith('sid=' + session.group(1) + ' ')]
    hits, counts, _ = first_hits(entries)
    t0, anchor_body = stamp(entries[0])
    anchor = anchor_body.removeprefix('perf ')
    rows = []
    for marker, label, required in MILESTONES:
        hit = hits.get(marker)
        if not hit:
            rows.append({'marker': marker, 'label': label, 'status': 'NOT MEASURED',
                         'required': required})
            continue
        offset = None
        if t0 is not None and hit['t'] is not None:
            offset = hit['t'] - t0
        rows.append({
            'marker': marker,
            'label': label,
            'status': 'measured' if offset is not None else 'NOT MEASURED',
            'required': required,
            'offset_ms': offset,
            'since_previous_ms': (hit['t'] - max([h['t'] for h in hits.values()
                if h['t'] is not None and t0 <= h['t'] < hit['t']], default=t0)
                if offset is not None else None),
            'entry_index': hit['index'],
            'count': counts.get(marker, 1),
        })
    # Render-cycles: how many payloads versus how many renders. More renders
    # than payloads is the "repeated render" symptom, in numbers.
    payloads = counts.get('home-data stage=web-to-android result=sent', 0)
    renders = counts.get('home-data stage=android-render-start', 0)
    return {
        'anchored': t0 is not None,
        'anchor': anchor,
        'time_source': 'journal t= stamps' if t0 is not None else 'entry order only',
        'milestones': rows,
        'counters': {
            'home_payloads': payloads,
            'home_renders': renders,
            'renders_per_payload': (round(renders / payloads, 2) if payloads else None),
            'library_requests': counts.get('library.request.started', 0),
            'native_payloads_all_screens': sum(stamp(e)[1] == 'perf native-payload' for e in entries),
            'native_rows_all_screens': sum(stamp(e)[1] == 'perf native-rows' for e in entries),
        },
        'entries': len(entries),
        'observed_until_ms': max([stamp(e)[0] for e in entries if stamp(e)[0] is not None], default=t0) - t0,
        'durations': [dict(event='token-attempt', duration_ms=int(m.group(1)))
            for e in entries if (m := re.fullmatch(r'perf token-ready=([0-9]{1,6})', stamp(e)[1]))]
            + [dict(event='library-response', duration_ms=int(m.group(1)))
               for e in entries if (m := re.search(r'^library\.request\.response .* duration=([0-9]{1,6})$', stamp(e)[1]))],
    }


def print_table(report):
    print('startup timeline, anchored on %s (%s)' % (report['anchor'], report['time_source']))
    print()
    print('%-46s %10s %10s %8s  %s' % ('milestone', 'offset', 'delta', 'count', 'status'))
    print('-' * 88)
    for row in report['milestones']:
        offset = 'n/a' if row.get('offset_ms') is None else '%d ms' % row['offset_ms']
        flag = '' if row['status'] == 'measured' else '  <- '
        delta = 'n/a' if row.get('since_previous_ms') is None else '%d ms' % row['since_previous_ms']
        print('%-46s %10s %10s %8s  %s%s' % (row['label'][:46], offset, delta, row.get('count', '-'),
                                        row['status'], flag))
    print()
    counters = report['counters']
    print('payloads Home envoyés : %s' % counters['home_payloads'])
    print('rendus natifs         : %s' % counters['home_renders'])
    print('rendus par payload    : %s' % (counters['renders_per_payload']
                                          if counters['renders_per_payload'] is not None
                                          else 'NOT MEASURED'))
    print('requêtes bibliothèque : %s' % counters['library_requests'])
    print('native-payload / native-rows (tous écrans) : %s / %s' % (
        counters['native_payloads_all_screens'], counters['native_rows_all_screens']))
    print('fenêtre observée : %s ms' % report['observed_until_ms'])
    for duration in report['durations']:
        print('%s : %s ms' % (duration['event'], duration['duration_ms']))


def allowed_entry(entry):
    # Reuse the exact closed clipboard grammar; never export arbitrary logcat.
    source = (Path(__file__).resolve().parents[1] / 'smali/com/melodix/music/NativeStartupTiming.smali').read_text()
    literal = re.search(r'const-string v0, "(\^sid=[^"\n]+)"', source).group(1)
    grammar = json.loads('"' + literal + '"')
    return re.fullmatch(grammar, entry) is not None


def main(argv):
    if len(argv) == 4 and argv[1] == '--filter-log':
        text = sys.stdin.read() if argv[2] == '-' else load_text(argv[2])
        entries = [e for e in parse_entries(text) if allowed_entry(e)]
        Path(argv[3]).write_text('\n'.join(entries) + '\n')
        return 0
    if len(argv) < 2:
        print(__doc__)
        return 2
    text = load_text(argv[1])
    if re.search(r'MDXPERF-BEGIN[^\n]*dropped=[1-9]', text):
        print('NOT MEASURED: timing capture overflowed; repeat a shorter scenario.', file=sys.stderr)
        return 2
    entries = parse_entries(text)
    report = build_report(entries)
    if report is None:
        print('NOT MEASURED: no "activity-create" or "activity-resume" marker in this journal, so no '
              'startup timeline can be anchored. Paste a journal captured from a '
              'launch that reached onCreate.', file=sys.stderr)
        return 2
    print_table(report)
    if '--github-notice' in argv:
        # GitHub-hosted annotation: readable even when artifact downloads are
        # blocked by the caller's network. No raw event bodies are included.
        compact = json.dumps(report, ensure_ascii=False, separators=(',', ':'))
        compact = compact.replace('%', '%25').replace('\r', '%0D').replace('\n', '%0A')
        print('::notice title=Startup measurement ' + Path(argv[1]).stem + '::' + compact)
    if '--json' in argv:
        out = argv[argv.index('--json') + 1]
        with open(out, 'w', encoding='utf-8') as handle:
            json.dump(report, handle, indent=2, ensure_ascii=False)
        print('\nJSON: %s' % out)
    return 0


if __name__ == '__main__':
    sys.exit(main(sys.argv))
