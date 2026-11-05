const test = require('node:test');
const assert = require('node:assert');
const fs = require('node:fs');
const os = require('node:os');
const path = require('node:path');
const { execFileSync } = require('node:child_process');
const root = path.join(__dirname, '..');
const script = path.join(root, 'scripts/ui_selected_check.py');
const RID = 'com.melodix.music:id/nativeGenreScroll';
const node = (attrs) => `<node class="android.widget.FrameLayout" ${attrs} />`;
const run = (inner) => {
  const dir = fs.mkdtempSync(path.join(os.tmpdir(), 'mel-sel-'));
  const f = path.join(dir, 'dump.xml');
  fs.writeFileSync(f, `<?xml version="1.0"?><hierarchy><node resource-id="${RID}">${inner}</node></hierarchy>`);
  let out = ''; let status = 0;
  try { out = execFileSync('python3', [script, f, 'nativeGenreScroll'], { encoding: 'utf8' }); }
  catch (e) { status = e.status; out = e.stdout || ''; }
  fs.rmSync(dir, { recursive: true, force: true });
  return { out, status };
};

test('one selected tile is reported, and an unselected grid is not', () => {
  const hit = run(node('selected="true" clickable="true" content-desc="Pop" bounds="[0,0][10,10]"') + node('selected="false" clickable="true" bounds="[10,0][20,10]"'));
  assert.equal(hit.status, 0);
  assert.match(hit.out, /^selected=1/m);
  assert.match(hit.out, /clickable_descendants=2/);
  const miss = run(node('selected="false" clickable="true" bounds="[0,0][10,10]"'));
  assert.match(miss.out, /^selected=0/m, 'a delivered tap that selected nothing must read as zero');
});

test('an absent container is an error, never a silent pass', () => {
  const dir = fs.mkdtempSync(path.join(os.tmpdir(), 'mel-sel-'));
  const f = path.join(dir, 'dump.xml');
  fs.writeFileSync(f, '<?xml version="1.0"?><hierarchy><node resource-id="other" /></hierarchy>');
  let status = 0; let out = '';
  try { out = execFileSync('python3', [script, f, 'nativeGenreScroll'], { encoding: 'utf8' }); }
  catch (e) { status = e.status; out = e.stdout || ''; }
  fs.rmSync(dir, { recursive: true, force: true });
  assert.notEqual(status, 0);
  assert.match(out, /container absent/);
});

test('the walk asserts the selection and publishes the evidence', () => {
  const walk = fs.readFileSync(path.join(root, 'scripts/ui_qa_walk.sh'), 'utf8');
  assert.match(walk, /ui_selected_check\.py/, 'the check must run in the walk');
  assert.match(walk, /genre-selection\.txt/);
  const at = walk.indexOf('ui_selected_check.py');
  const around = walk.slice(at, at + 500);
  assert.match(around, /failures=\$\(\(failures \+ 1\)\)/, 'a grid where nothing gets selected is a failure');
  const wf = fs.readFileSync(path.join(root, '.github/workflows/ui-qa.yml'), 'utf8');
  for (const f of ['genre-selection.txt', 'state-diag.txt', 'genre-diag.txt', 'crash.txt']) {
    assert.ok(wf.includes(f), `${f} must be published`);
  }
});

test('the styler logs its work and keeps every logged register defined', () => {
  const s = fs.readFileSync(path.join(root, 'smali/com/melodix/music/NativeGenreTileStyler.smali'), 'utf8');
  assert.match(s, /"MelGenre"/);
  assert.match(s, /styler rows=/, 'the log must say how much of the grid was walked');
  // :g_done is reached by early exits too, so v3 must be set before any branch.
  const entry = s.slice(s.indexOf('.locals'), s.indexOf(':try_start_g'));
  assert.match(entry, /const\/4 v3, 0x0/, 'v3 is logged at :g_done and must be defined on every path');
});
