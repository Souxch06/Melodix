const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const test = require('node:test');
const vm = require('node:vm');

const root = path.resolve(__dirname, '..');

test('default Spotify login page keeps the password option available', () => {
    let inserted;
    const anchor = {
        parentNode: {
            insertBefore(element, before) {
                inserted = { element, before };
            }
        }
    };
    const createdLink = { style: {} };
    const context = {
        document: {
            querySelector(selector) {
                return selector.startsWith('section>') ? anchor : null;
            },
            createElement(tagName) {
                assert.equal(tagName, 'a');
                return createdLink;
            }
        },
        window: { location: { href: 'https://accounts.spotify.com/en/login?continue=home' } }
    };

    const script = fs.readFileSync(path.join(root, 'assets/classic_login.js'), 'utf8');
    vm.runInNewContext(script, context);

    assert.equal(createdLink.innerText, 'Email + Password Classic Login');
    assert.equal(createdLink.className, 'fuckd');
    assert.match(createdLink.href, /allow_password=1/);
    assert.equal(inserted.element, createdLink);
    assert.equal(inserted.before, anchor);
});

test('Google / Apple / OTP mode is the only visible default and password remains a selectable route', () => {
    const mlSmali = fs.readFileSync(path.join(root, 'smali/ml.smali'), 'utf8');
    assert.match(mlSmali, /\.field public static m:Ljava\/lang\/String; = "social"/);
    const loginStart = mlSmali.indexOf('.method public static final D(Ljava/lang/String;)V');
    assert.notEqual(loginStart, -1);
    const loginEnd = mlSmali.indexOf('.end method', loginStart);
    const loginMethod = mlSmali.slice(loginStart, loginEnd);
    assert.match(loginMethod, /method=password&allow_password=1/);
    assert.match(loginMethod, /&allow_signup=1/);
    assert.match(loginMethod, /invoke-virtual \{p0, v0\}, Ljava\/lang\/Object;->equals/);

    const activity = fs.readFileSync(path.join(root, 'smali/com/melodix/music/MainActivity.smali'), 'utf8');
    assert.match(
        activity,
        /sput-object v5, Lml;->h:Lg6;\s+\.line 598\s+const\/16 v15, 0x8\s+\.line 599\s+invoke-virtual \{v5, v15\}, Landroid\/view\/View;->setVisibility\(I\)V/
    );
    const socialTabStart = activity.indexOf('sput-object v2, Lml;->i:Lg6;');
    assert.notEqual(socialTabStart, -1);
    const nextAdd = activity.indexOf('sget-object v2, Lml;->g:Landroid/widget/LinearLayout;', socialTabStart);
    assert.notEqual(nextAdd, -1);
    assert.doesNotMatch(activity.slice(socialTabStart, nextAdd), /setVisibility\(I\)V/);

    for (const file of ['smali/m9.smali', 'smali/c2.smali']) {
        const source = fs.readFileSync(path.join(root, file), 'utf8');
        assert.match(source, /accounts\.spotify\.com\/en\/login[^"\n]*&allow_signup=1/);
        assert.doesNotMatch(source, /accounts\.spotify\.com\/en\/login[^"\n]*method=password/);
    }
});
