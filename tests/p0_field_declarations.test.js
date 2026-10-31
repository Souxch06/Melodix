const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');

const repo = path.resolve(__dirname, '..');
const smaliRoot = path.join(repo, 'smali');

function smaliFiles(dir) {
    const out = [];
    for (const entry of fs.readdirSync(dir, { withFileTypes: true })) {
        const full = path.join(dir, entry.name);
        if (entry.isDirectory()) out.push(...smaliFiles(full));
        else if (entry.name.endsWith('.smali')) out.push(full);
    }
    return out;
}

// Field name -> class descriptor, for every class we ship as smali source.
function declaredFields() {
    const map = new Map();
    for (const file of smaliFiles(smaliRoot)) {
        const descriptor = 'L' + path.relative(smaliRoot, file).replace(/\\/g, '/').slice(0, -'.smali'.length) + ';';
        const names = new Set();
        for (const line of fs.readFileSync(file, 'utf8').split('\n')) {
            const match = /^\.field[^\n]*?(\w+):[^\n]*$/.exec(line);
            if (match) names.add(match[1]);
        }
        map.set(descriptor, names);
    }
    return map;
}

function referencedFields() {
    const refs = [];
    for (const file of smaliFiles(smaliRoot)) {
        const text = fs.readFileSync(file, 'utf8');
        const re = /(L[\w/$]+;)->(\w+):/g;
        let match;
        while ((match = re.exec(text)) !== null) {
            refs.push({ file, owner: match[1], name: match[2] });
        }
    }
    return refs;
}

test('every referenced smali field is declared on its class (no NoSuchFieldError at runtime)', () => {
    const declared = declaredFields();
    const missing = referencedFields()
        .filter((ref) => declared.has(ref.owner) && !declared.get(ref.owner).has(ref.name))
        .map((ref) => `${ref.owner}->${ref.name}: referenced in ${path.relative(repo, ref.file)}`);
    assert.deepEqual(missing, [], `undeclared field references: ${missing.join(', ')}`);
});

test('AppSingleton declares the diagnostic source field g0 used by the WebView factory', () => {
    // A sput-object to an undeclared field compiles fine but throws
    // NoSuchFieldError on the first launch (crash in MainActivity.onCreate).
    const appSingleton = fs.readFileSync(path.join(smaliRoot, 'com/melodix/music/AppSingleton.smali'), 'utf8');
    assert.match(appSingleton, /^\.field public static g0:Ljava\/lang\/String; = null$/m);
    const m9 = fs.readFileSync(path.join(smaliRoot, 'm9.smali'), 'utf8');
    assert.match(m9, /sput-object v1, Lcom\/melodix\/music\/AppSingleton;->g0:Ljava\/lang\/String;/);
});
