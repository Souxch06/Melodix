const {test} = require('node:test');
const assert = require('node:assert/strict');
const create = require('./preview-player-clock-model.js');
function snap(overrides = {}) { return {track:'track-A', position:10000, duration:120000, playing:true, advancing:true, ...overrides}; }
test('frame cadence uses monotonic time and is shared by consumers', () => {
  const c=create(); c.update(snap(),0);
  const samples=Array.from({length:61},(_,i)=>c.valueAt(i*1000/60));
  assert.equal(samples[0],10000); assert.equal(samples[60],11000);
  assert.ok(samples.every((v,i)=>i===0 || v>=samples[i-1]));
  assert.equal(c.valueAt(1000),samples[60]);
});
test('small resync corrects smoothly, large seek is immediate', () => {
  const c=create(); c.update(snap(),0);
  assert.equal(c.valueAt(1000),11000);
  c.update(snap({position:11500}),1000);
  assert.equal(c.valueAt(1000),11000);
  assert.equal(c.valueAt(2000),12125);
  c.update(snap({position:30000,seek:true}),2000);
  assert.equal(c.valueAt(2000),30000);
});
test('pause and buffering freeze on the latest reliable sample', () => {
  const c=create(); c.update(snap(),0);
  c.update(snap({position:10500, playing:false, advancing:false}),500);
  assert.equal(c.valueAt(10000),10500);
  c.update(snap({position:10500, playing:true, advancing:false}),10000);
  assert.equal(c.valueAt(20000),10500);
  c.update(snap({position:10500, playing:true, advancing:true}),20000);
  assert.equal(c.valueAt(21000),11500);
});
test('duration is bounded and track changes reset interpolation', () => {
  const c=create(); c.update(snap({position:119000}),0);
  assert.equal(c.valueAt(10000),120000);
  c.update(snap({track:'track-B',position:1000}),10000);
  assert.equal(c.valueAt(10000),1000);
});
test('invalid input or backwards clock never invents a position', () => {
  const c=create(); c.update(snap(),10);
  assert.equal(c.valueAt(9),null);
  assert.equal(c.update(snap({duration:0}),20),false);
  assert.equal(c.valueAt(21),null);
  assert.equal(c.update(snap({position:-1}),22),false);
  assert.equal(c.update(snap({track:''}),23),false);
  assert.equal(c.update(snap({advancing:undefined}),24),false);
});
