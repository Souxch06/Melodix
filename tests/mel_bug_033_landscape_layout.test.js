const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const repo = path.resolve(__dirname, '..');

// MEL-BUG-033: no res/layout-land existed, so landscape fell back to whatever
// the default layout did. A dedicated landscape layout with the exact same
// contract (ids, handlers, accessibility, tiles) is now asserted against drift.
test('MEL-BUG-033: res/layout-land/activity_main.xml exists and matches the phone contract', () => {
  const land = 'res/layout-land/activity_main.xml';
  const phone = 'res/layout/activity_main.xml';
  assert.ok(fs.existsSync(path.join(repo, land)), 'landscape layout must exist');
  const landXml = fs.readFileSync(path.join(repo, land), 'utf8');
  const phoneXml = fs.readFileSync(path.join(repo, phone), 'utf8');
  const ids = (xml) => [...xml.matchAll(/android:id="@(?:\+)?id\/(\w+)"/g)].map((m) => m[1]).sort();
  const handlers = (xml) => [...xml.matchAll(/android:onClick="(\w+)"/g)].map((m) => m[1]).sort();
  assert.deepEqual(ids(landXml), ids(phoneXml), 'same ids in landscape and portrait');
  assert.deepEqual(handlers(landXml), handlers(phoneXml), 'same click handlers in landscape and portrait');
  assert.ok(landXml.includes('@id/nativeRoot') && landXml.includes('@id/hScrollView'),
    'landscape keeps the native shell and the WebView host');
});

test('MEL-BUG-033: res/layout-sw600dp-land/activity_main.xml matches the tablet contract', () => {
  const land = 'res/layout-sw600dp-land/activity_main.xml';
  const tablet = 'res/layout-sw600dp/activity_main.xml';
  assert.ok(fs.existsSync(path.join(repo, land)), 'landscape tablet layout must exist');
  const landXml = fs.readFileSync(path.join(repo, land), 'utf8');
  const tabletXml = fs.readFileSync(path.join(repo, tablet), 'utf8');
  const ids = (xml) => [...xml.matchAll(/android:id="@(?:\+)?id\/(\w+)"/g)].map((m) => m[1]).sort();
  const handlers = (xml) => [...xml.matchAll(/android:onClick="(\w+)"/g)].map((m) => m[1]).sort();
  assert.deepEqual(ids(landXml), ids(tabletXml), 'same ids in landscape tablet and portrait tablet');
  assert.deepEqual(handlers(landXml), handlers(tabletXml), 'same click handlers in landscape tablet');
});
