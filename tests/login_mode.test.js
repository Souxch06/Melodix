const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const test = require('node:test');
const vm = require('node:vm');

const root = path.resolve(__dirname, '..');

function makeElement(text, testId = '') {
    return {
        innerText: text,
        textContent: text,
        attrs: { 'data-testid': testId },
        style: {
            applied: null,
            setProperty(name, value, priority) {
                this.applied = [name, value, priority];
            }
        },
        getAttribute(name) {
            return this.attrs[name] || null;
        },
        setAttribute(name, value) {
            this.attrs[name] = value;
        }
    };
}

test('login page hides passwordless options but keeps the password form', () => {
    const passwordless = makeElement('Log in without password');
    const passwordForm = makeElement('Log in with a password');
    const elements = [passwordless, passwordForm];

    class FakeMutationObserver {
        constructor(callback) {
            this.callback = callback;
        }
        observe() {}
        disconnect() {}
    }

    const context = {
        document: {
            documentElement: {},
            querySelectorAll: () => elements
        },
        window: { addEventListener() {} },
        MutationObserver: FakeMutationObserver
    };

    const script = fs.readFileSync(path.join(root, 'assets/classic_login.js'), 'utf8');
    vm.runInNewContext(script, context);

    assert.deepEqual(passwordless.style.applied, ['display', 'none', 'important']);
    assert.equal(passwordless.attrs['aria-hidden'], 'true');
    assert.equal(passwordless.attrs.tabindex, '-1');
    assert.equal(passwordForm.style.applied, null);
});

test('native login router always loads Spotify password login and hides the social tab', () => {
    const mlSmali = fs.readFileSync(path.join(root, 'smali/ml.smali'), 'utf8');
    const loginStart = mlSmali.indexOf('.method public static final D(Ljava/lang/String;)V');
    assert.notEqual(loginStart, -1);
    const loginEnd = mlSmali.indexOf('.end method', loginStart);
    const loginMethod = mlSmali.slice(loginStart, loginEnd);
    const urls = [...loginMethod.matchAll(/const-string p0, "([^"]+)"/g)].map((match) => match[1]);

    assert.equal(urls.length, 1);
    assert.match(urls[0], /method=password/);

    const activity = fs.readFileSync(path.join(root, 'smali/com/melodix/music/MainActivity.smali'), 'utf8');
    assert.match(
        activity,
        /sput-object v2, Lml;->i:Lg6;\s+\.line 755\s+const\/16 v5, 0x8\s+\.line 756\s+invoke-virtual \{v2, v5\}, Landroid\/view\/View;->setVisibility\(I\)V/
    );
});
