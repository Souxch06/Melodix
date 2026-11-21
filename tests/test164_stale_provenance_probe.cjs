'use strict';
// Deliberately failing diagnostic, not part of the green unit-suite count.
// It executes the real Smali dispatcher through TEST163's strict interpreter.
// Both examples are synthetic: the dispatcher receives identical metadata at
// receipt time, but one payload was produced in a different session. A safe
// design must distinguish them using provenance established at the producer.
const fs = require('node:fs');
const vm = require('node:vm');
const source = fs.readFileSync('tests/test163_private_ui_invalidation.test.js', 'utf8');
const stop = source.indexOf("\ntest('native invalidation");
if (stop < 0) throw new Error('TEST163 interpreter boundary missing');
const context = {require, console};
vm.runInNewContext(source.slice(0, stop) + '\nglobalThis.deliver=executeDelivery;', context);
const current = {action:1, receiptState:3, receiptEpoch:21, receiptGeneration:12, state:3, epoch:21, generation:12};
const fresh = context.deliver(current);
// A late response produced before invalidation but arriving after the next
// proof passes the same metadata: old producer identity is not an input.
const stale = context.deliver(current);
if (!fresh.includes('applyNativeUiData')) throw new Error('current synthetic payload unexpectedly rejected');
if (stale.includes('applyNativeUiData')) {
  console.error('FAIL: a pre-invalidation producer can deliver after a new proof; dispatcher has no producer epoch. Synthetic interpreter only.');
  process.exitCode = 1;
} else {
  console.log('PASS: old synthetic producer payload rejected');
}
