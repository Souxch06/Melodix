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
    const viewport = {
        content: 'width=980, initial-scale=1',
        setAttribute(name, value) {
            if (name === 'content') this.content = value;
        }
    };
    const context = {
        document: {
            querySelector(selector) {
                if (selector === 'meta[name="viewport"]') return viewport;
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

    assert.equal(viewport.content, 'width=device-width, initial-scale=1, viewport-fit=cover');
    assert.equal(createdLink.innerText, 'Email + Password Classic Login');
    assert.equal(createdLink.className, 'fuckd');
    assert.match(createdLink.style.cssText, /box-sizing:border-box;width:100%;max-width:100%;min-height:44px/);
    assert.match(createdLink.href, /allow_password=1/);
    assert.equal(inserted.element, createdLink);
    assert.equal(inserted.before, anchor);
});

test('login screen adds a device-width viewport when the provider page has none', () => {
    let viewport = null;
    const context = {
        document: {
            querySelector(selector) {
                if (selector === 'meta[name="viewport"]') return viewport;
                return null;
            },
            createElement(tagName) {
                assert.equal(tagName, 'meta');
                return {
                    setAttribute(name, value) {
                        if (name === 'content') this.content = value;
                    }
                };
            },
            head: {
                appendChild(element) {
                    viewport = element;
                }
            }
        },
        window: { location: { href: 'https://accounts.spotify.com/en/login' } }
    };

    const script = fs.readFileSync(path.join(root, 'assets/classic_login.js'), 'utf8');
    vm.runInNewContext(script, context);

    assert.ok(viewport);
    assert.equal(viewport.name, 'viewport');
    assert.equal(viewport.content, 'width=device-width, initial-scale=1, viewport-fit=cover');
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

test('native social-login shortcut is compact, right-aligned and keeps a subtle Spotify accent', () => {
    const activity = fs.readFileSync(path.join(root, 'smali/com/melodix/music/MainActivity.smali'), 'utf8');
    const socialButtonStart = activity.indexOf('const-string v5, "Google / Apple / OTP"');
    assert.notEqual(socialButtonStart, -1);
    const socialButtonEnd = activity.indexOf('sput-object v2, Lml;->i:Lg6;', socialButtonStart);
    const socialButtonSetup = activity.slice(socialButtonStart, socialButtonEnd);
    assert.match(
        socialButtonSetup,
        /const\/4 v9, -0x2\s+const\/4 v6, 0x0\s+invoke-direct \{v5, v9, v8, v6\}, Landroid\/widget\/LinearLayout\$LayoutParams;-><init>\(IIF\)V/
    );
    assert.match(socialButtonSetup, /TextView;->setMaxWidth\(I\)V/);
    assert.match(socialButtonSetup, /TextView;->setSingleLine\(Z\)V/);
    assert.match(socialButtonSetup, /TextUtils\$TruncateAt;->END/);

    const spacerStart = activity.indexOf('new-instance v5, Landroid/view/View;', socialButtonEnd);
    assert.notEqual(spacerStart, -1);
    const spacerEnd = activity.indexOf('sget-object v5, Lml;->i:Lg6;', spacerStart);
    const spacerSetup = activity.slice(spacerStart, spacerEnd);
    assert.match(spacerSetup, /const\/4 v8, 0x0[\s\S]*const\/4 v9, -0x1[\s\S]*const\/high16 v10, 0x3f800000[\s\S]*LinearLayout\$LayoutParams;-><init>\(IIF\)V/);

    const modeStyling = fs.readFileSync(path.join(root, 'smali/ml.smali'), 'utf8')
        .match(/\.method public static F\(\)V([\s\S]*?)\.end method/);
    assert.ok(modeStyling, 'native login mode styling should exist');
    assert.match(modeStyling[1], /const-string v3, "#1C1C1C"/);
    assert.match(modeStyling[1], /GradientDrawable;->setStroke\(II\)V/);
    assert.match(modeStyling[1], /move v4, v3/);
});
