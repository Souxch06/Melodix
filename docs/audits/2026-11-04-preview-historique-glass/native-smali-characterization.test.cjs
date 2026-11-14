// Characterizes the *historical* candidate, not desired future behavior.
// It follows actual isEmpty()/branch instructions with synthetic strings.
// No Android runtime, device, user session or network is involved.
const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const root = process.env.MELODIX_SMALI_ROOT || process.env.MELODIX_HISTORICAL_ROOT;
if (!root) throw new Error('MELODIX_SMALI_ROOT or MELODIX_HISTORICAL_ROOT required');
const read = p=>fs.readFileSync(path.join(root,'smali/com/melodix/music',p),'utf8');
const activity=read('MainActivity.smali'), row=read('NativeUiRowFactory.smali');
const feed=read('NativeHomeFeed.smali'), listener=read('NativeRowClickListener.smali');
function method(text, prefix) {
    const start=text.indexOf(prefix), end=text.indexOf('.end method',start);
    assert.ok(start>=0&&end>start,`Missing method ${prefix}`);
    return text.slice(start,end);
}

// The actual Smali guard computes String.isEmpty() as 1 for empty and 0
// for non-empty. Verify its destination jumps past the action, then execute
// that branch for the provided fixture string.
function guardAllowsAction(body, receiver, start, action, value) {
    const at=body.indexOf(start);
    assert.ok(at>=0,`Missing start ${start}`);
    const after=body.slice(at);
    const pattern=new RegExp('invoke-virtual \\{'+receiver+'\\}, Ljava/lang/String;->isEmpty\\(\\)Z\\s+move-result (v\\d+)\\s+if-(eqz|nez) \\1, :(\\w+)');
    const match=after.match(pattern);
    assert.ok(match,`Missing String.isEmpty branch for ${receiver}`);
    const branchPos=at+match.index;
    const actionPos=body.indexOf(action,branchPos);
    const labelMatch=[...body.matchAll(new RegExp('^\\s*:'+match[3]+'\\s*$','gm'))].find(x=>x.index>branchPos);
    assert.ok(labelMatch && actionPos>branchPos && labelMatch.index>actionPos,'branch must skip the action');
    const zero=value.length!==0; // non-empty => isEmpty() returns 0
    const jump=match[2]==='eqz' ? zero : !zero;
    return !jump;
}

module.exports = {method, guardAllowsAction, row};
if (require.main === module) {
test('historical Home data goes through the native feed and row factory in source',()=>{
    const apply=method(activity,'.method public final applyNativeUiData(');
    const render=method(activity,'.method public final renderNativeRows(');
    const paint=method(feed,'.method public static paint(');
    assert.match(apply, /"home"[\s\S]*?renderNativeRows/);
    assert.match(render, /NativeHomeFeed;->paint/);
    assert.match(paint, /NativeUiRowFactory;->create\(/);
    assert.match(listener,/MainActivity;->openNativeRow/);
});

test('valid playlist URI skips native row listener; empty string reaches listener block',()=>{
    const body=method(row,'.method public static create(');
    const marker='invoke-virtual {v8}, Ljava/lang/String;->isEmpty()Z';
    const start=body.lastIndexOf(marker);
    assert.ok(start>=0);
    const chunk=body.slice(start);
    assert.equal(guardAllowsAction(chunk,'v8',marker,'->setOnClickListener(', 'spotify:playlist:fake123'),false);
    assert.equal(guardAllowsAction(chunk,'v8',marker,'->setOnClickListener(', ''),true);
});

test('direct native openNativeRow with a valid URI returns before the collection route',()=>{
    const body=method(activity,'.method public final openNativeRow(');
    const marker='invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z';
    assert.equal(guardAllowsAction(body,'p1',marker,'window.__sfOpenCollection','spotify:playlist:fake123'),false);
    assert.equal(guardAllowsAction(body,'p1',marker,'window.__sfOpenCollection',''),true);
});

test('valid image URL skips loader in native row, while empty string reaches it',()=>{
    const body=method(row,'.method public static create(');
    const start=body.indexOf('Landroid/widget/LinearLayout;->addView');
    const chunk=body.slice(start);
    const marker='invoke-virtual {v9}, Ljava/lang/String;->isEmpty()Z';
    assert.equal(guardAllowsAction(chunk,'v9',marker,'NativeImageLoader;->load','https://i.scdn.co/image/fake'),false);
    assert.equal(guardAllowsAction(chunk,'v9',marker,'NativeImageLoader;->load',''),true);
});

test('non-empty list text returns before fallback NativeTextWalker',()=>{
    const body=method(activity,'.method public final applyNativeListText(');
    const marker='invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z';
    assert.equal(guardAllowsAction(body,'p1',marker,'NativeTextWalker;->apply','Fictive playlist'),false);
    assert.equal(guardAllowsAction(body,'p1',marker,'NativeTextWalker;->apply',''),true);
});

test('historical JS-era tests assert these same inverted branch opcodes',()=>{
    const tests=fs.readFileSync(path.join(process.env.MELODIX_HISTORICAL_ROOT,'tests/native_ui.test.js'),'utf8');
    assert.match(tests,/assert\.match\(factory, \/if-eqz v10, :native_row_return\//);
    assert.match(tests,/assert\.match\(openRow, \/if-eqz v0, :native_row_click_done\//);
});

test('non-empty artist string in native row skips appending; empty string reaches append block',()=>{
    const body=method(row,'.method public static create(');
    const marker='invoke-virtual {v10}, Ljava/lang/String;->isEmpty()Z';
    const chunk=body.slice(body.indexOf(':native_artists_loop')>=0 ? body.indexOf(':native_artists_loop') : body.indexOf('Ljava/lang/StringBuilder;-><init>()V'));
    // Locate by optString(ILjava/lang/String;) so labels may change after dex decoding.
    const loop=chunk.slice(chunk.indexOf('Lorg/json/JSONArray;->optString(ILjava/lang/String;)Ljava/lang/String;'));
    assert.equal(guardAllowsAction(loop,'v10',marker,'invoke-virtual {v4, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)', 'Fictive Artist'),false);
    assert.equal(guardAllowsAction(loop,'v10',marker,'invoke-virtual {v4, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)', ''),true);
});

}
