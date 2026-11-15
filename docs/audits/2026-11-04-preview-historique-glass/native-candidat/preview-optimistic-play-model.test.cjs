const {test}=require('node:test');
const assert=require('node:assert/strict');
const create=require('./preview-optimistic-play-model.js');
function harness(){let now=0,id=0;const timers=new Map(),ui=[],commands=[],fail=[];const h={
  now:()=>now,display:v=>ui.push([now,v]),command:v=>commands.push([now,v]),unconfirmed:()=>fail.push(now),
  setTimer:(f,d)=>{const n=++id;timers.set(n,{f,at:now+d});return n},clearTimer:n=>timers.delete(n)};
  return {model:create(h),h,ui,commands,fail,advance(ms){now+=ms;for(const [n,t] of [...timers])if(t.at<=now){timers.delete(n);t.f()}}};}
test('optimistic display precedes one simulated command at the same virtual instant',()=>{const x=harness();x.model.observe(false);assert.equal(x.model.tap(),'sent');assert.deepEqual(x.ui.at(-1),[0,true]);assert.deepEqual(x.commands,[[0,true]]);});
test('stale snapshot does not revert; matching snapshot confirms',()=>{const x=harness();x.model.observe(false);x.model.tap();x.advance(100);assert.equal(x.model.observe(false),false);assert.equal(x.ui.at(-1)[1],true);assert.equal(x.model.observe(true),true);x.advance(9000);assert.equal(x.fail.length,0);});
test('a rapid second gesture does not send another command',()=>{const x=harness();x.model.observe(true);x.model.tap();x.advance(200);assert.equal(x.model.tap(),'debounced');assert.equal(x.commands.length,1);});
test('timeout reconciles to observed state without a retry',()=>{const x=harness();x.model.observe(false);x.model.tap();x.advance(8000);assert.equal(x.ui.at(-1)[1],false);assert.equal(x.fail.length,1);assert.equal(x.commands.length,1);});
test('late state still reconciles after timeout',()=>{const x=harness();x.model.observe(false);x.model.tap();x.advance(8000);x.model.observe(true);assert.equal(x.ui.at(-1)[1],true);});
test('unknown state never invents a target',()=>{const x=harness();assert.equal(x.model.tap(),'unknown');assert.equal(x.commands.length,0);assert.equal(x.ui.length,0);});
