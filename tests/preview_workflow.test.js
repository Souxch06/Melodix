const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const test = require('node:test');

const workflow = fs.readFileSync(
    path.resolve(__dirname, '..', '.github/workflows/preview-apk.yml'),
    'utf8'
);

test('Preview workflow requires an explicit full source SHA instead of defaulting to the old baseline', () => {
    const sourceInput = workflow.match(/      source_ref:\n([\s\S]*?)(?=\n\npermissions:)/);
    assert.ok(sourceInput, 'manual source_ref input should exist');
    assert.match(sourceInput[0], /description: Full source commit SHA to build/);
    assert.match(sourceInput[0], /required: true/);
    assert.doesNotMatch(sourceInput[0], /default:/);
    assert.match(workflow, /source_ref must be a full 40-character commit SHA/);
    assert.match(workflow, /if: github\.event_name == 'push' \|\| github\.event_name == 'workflow_dispatch'/);
    assert.match(workflow, /INPUT_SOURCE_REF: \$\{\{ inputs\.source_ref \|\| github\.sha \}\}/);
});

