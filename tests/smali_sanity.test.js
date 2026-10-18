const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');

const repo = path.resolve(__dirname, '..');
const smaliFiles = [
    'smali/c91.smali',
    'smali/m9.smali',
    'smali/com/melodix/music/AndBridge.smali',
    'smali/com/melodix/music/AppSingleton.smali',
    'smali/com/melodix/music/MainActivity.smali',
    'smali/bh.smali',
    'smali/u51.smali',
    'smali/v51.smali',
    'smali/a61.smali',
    'smali/z1.smali',
    'smali/e61.smali'
];

function checkSmaliStructure(relativePath) {
    const lines = fs.readFileSync(path.join(repo, relativePath), 'utf8').split(/\r?\n/);
    const errors = [];
    let methodStart = null;
    let labels = new Set();
    let branchTargets = [];
    let inSwitchTable = false;

    const finishMethod = () => {
        if (methodStart === null) return;
        for (const [target, lineNumber] of branchTargets) {
            if (!labels.has(target)) errors.push(`line ${lineNumber}: unresolved :${target}`);
        }
        methodStart = null;
        labels = new Set();
        branchTargets = [];
        inSwitchTable = false;
    };

    for (let index = 0; index < lines.length; index += 1) {
        const line = lines[index];
        const lineNumber = index + 1;

        if (/^\.method\b/.test(line)) {
            if (methodStart !== null) errors.push(`line ${lineNumber}: nested .method`);
            finishMethod();
            methodStart = lineNumber;
            continue;
        }
        if (/^\.end method\b/.test(line)) {
            if (methodStart === null) errors.push(`line ${lineNumber}: unmatched .end method`);
            finishMethod();
            continue;
        }
        if (methodStart === null || /^\s*#/.test(line)) continue;

        if (/^\s*\.(?:packed-switch|sparse-switch)\b/.test(line)) {
            inSwitchTable = true;
            continue;
        }
        if (/^\s*\.end (?:packed-switch|sparse-switch)\b/.test(line)) {
            inSwitchTable = false;
            continue;
        }

        const label = line.match(/^\s*:([\w.$-]+)\s*$/);
        if (inSwitchTable && label) {
            branchTargets.push([label[1], lineNumber]);
            continue;
        }
        if (label) {
            if (labels.has(label[1])) errors.push(`line ${lineNumber}: duplicate :${label[1]}`);
            labels.add(label[1]);
        }

        const instruction = line.trim();
        if (/^(?:if-[\w-]+|goto(?:\/\d+)?|packed-switch|sparse-switch)\b/.test(instruction)) {
            for (const match of instruction.matchAll(/:([\w.$-]+)/g)) {
                branchTargets.push([match[1], lineNumber]);
            }
        }
    }

    if (methodStart !== null) errors.push(`line ${methodStart}: unterminated method`);
    return errors;
}

test('modified Smali files have balanced methods and resolvable direct branch labels', () => {
    for (const file of smaliFiles) {
        assert.deepEqual(checkSmaliStructure(file), [], `${file} has a structural Smali error`);
    }
});
