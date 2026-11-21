// Shared helper: resolve Melodix design tokens the way Android would.
//
// The native shell no longer hardcodes dimensions. Every metric lives in
// res/values/mel_dimens.xml, and res/values-sw600dp/mel_dimens.xml overrides a
// subset for tablets. A test that greps for "48.0dip" would now silently stop
// checking anything, so tests resolve the token instead - and can assert the
// phone AND the tablet value, which is strictly stronger than before.
//
// Nothing here mocks Android: it reads the same resource files aapt compiles.

const fs = require('node:fs');
const path = require('node:path');

const root = path.join(__dirname, '..', '..');

const PHONE = 'values';
const TABLET = 'values-sw600dp';

function parseDimenFile(file) {
  if (!fs.existsSync(file)) return {};
  const xml = fs.readFileSync(file, 'utf8');
  const out = {};
  const re = /<dimen name="([A-Za-z0-9_.]+)">([^<]+)<\/dimen>/g;
  let match;
  while ((match = re.exec(xml)) !== null) out[match[1]] = match[2].trim();
  return out;
}

// Android resource resolution: the qualified file wins, the default fills the
// rest. A tablet therefore inherits every token it does not override.
function loadDimens(qualifier = PHONE) {
  const base = parseDimenFile(path.join(root, 'res', 'values', 'mel_dimens.xml'));
  if (qualifier === PHONE) return base;
  const overlay = parseDimenFile(path.join(root, 'res', qualifier, 'mel_dimens.xml'));
  return { ...base, ...overlay };
}

// "48.0dip" -> 48 ; "@dimen/mel_mini_play" -> the token value ; else null.
// null means "not a fixed size" (0.0dip with a weight, fill_parent, ...), which
// callers must skip rather than treat as a zero-sized target.
function resolveSize(raw, dimens) {
  if (typeof raw !== 'string') return null;
  const value = raw.trim();
  const ref = value.match(/^@dimen\/([A-Za-z0-9_.]+)$/);
  if (ref) {
    const token = dimens[ref[1]];
    if (token === undefined) {
      throw new Error(`unresolved design token @dimen/${ref[1]}`);
    }
    return resolveSize(token, dimens);
  }
  const literal = value.match(/^([0-9]+(?:\.[0-9]+)?)(dip|dp|sp)$/);
  return literal ? Number(literal[1]) : null;
}

// Read one attribute out of an element block and resolve it.
function size(block, attr, dimens = loadDimens()) {
  const re = new RegExp(`android:${attr}="([^"]+)"`);
  const match = block.match(re);
  return match ? resolveSize(match[1], dimens) : null;
}

function attr(block, name) {
  const match = block.match(new RegExp(`${name}="([^"]+)"`));
  return match ? match[1] : null;
}

// Same as size() but for an app: namespace attribute (CardView radius, ...).
function appSize(block, name, dimens = loadDimens()) {
  const value = attr(block, `app:${name}`);
  return value === null ? null : resolveSize(value, dimens);
}

module.exports = { PHONE, TABLET, loadDimens, resolveSize, size, appSize, attr, root };
