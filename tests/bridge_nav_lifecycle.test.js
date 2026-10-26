// P0 bridge-startup — cause identifiee : cycle de vie de l'interface AndBridge
// lie aux navigations.
//
// BUG DEMONTRE : onPageStarted retirait AndBridge au DEBUT de toute navigation
// provisionnelle non-Spotify, y compris celles qui ne committent jamais
// (spotify: emis par la page, echecs reseau du token refresh). Le document
// Spotify EN COURS D'EXECUTION perdait alors window.AndBridge ; aucun chemin ne
// le reparait : onPageFinished ne re-attache qu'apres une page de confiance
// TERMINEE, onReceivedError ne faisait qu'un overlay. Consequence : lib-state
// calls=0, moteur muet, bibliotheque absente, apres js-shell begin/end.
//
// CORRECTION : (1) ne retirer l'interface que pour les URLs possedant une
// autorite (seuls documents web committables etrangers) ; (2) restaurer
// l'interface ("bridge-restored") quand une navigation de frame principale
// ECHOUE et que le document commis est toujours open.spotify.com — ERR_ABORTED
// exclude pour ne jamais re-exposer l'interface au document suivant.
const test = require('node:test');
const assert = require('node:assert');
const fs = require('node:fs');
const path = require('node:path');

const root = path.join(__dirname, '..');
const read = (p) => fs.readFileSync(path.join(root, p), 'utf8');

function methodBody(src, signature) {
    const at = src.indexOf(signature);
    assert.ok(at >= 0, 'methode presente: ' + signature);
    return src.slice(at, src.indexOf('.end method', at));
}

test('[cause] onPageStarted ne retire plus AndBridge pour les URLs sans autorite (spotify:, about:blank...)', () => {
    const c91 = read('smali/c91.smali');
    const ps = methodBody(c91, '.method public onPageStarted');
    const gateAt = ps.indexOf('Uri;->getAuthority()Ljava/lang/String;');
    const schemeAt = ps.indexOf('Uri;->getScheme()Ljava/lang/String;');
    assert.ok(gateAt >= 0 && schemeAt >= 0 && gateAt < schemeAt,
        'le garde getAuthority passe AVANT les checks web');
    const keepAt = ps.indexOf('if-nez v1, :cond_bridge_web');
    assert.ok(keepAt > gateAt, 'garde : autorite nulle -> chemin keep');
    const keepSlice = ps.slice(keepAt, ps.indexOf('\n    :cond_bridge_web', keepAt));
    assert.ok(!keepSlice.includes('removeJavascriptInterface'),
        'le chemin keep ne retire JAMAIS l\'interface');
    assert.ok(keepSlice.includes('bridge-kept opaque'), 'decision tracee dans le journal');
    assert.ok(keepSlice.includes('return-void'), 'keep = fin de la methode');
});

test('[cause] le retrait reste en place pour les documents web non-Spotify (isolation preservee)', () => {
    const c91 = read('smali/c91.smali');
    const ps = methodBody(c91, '.method public onPageStarted');
    const webAt = ps.indexOf(':cond_bridge_web');
    const web = ps.slice(webAt);
    assert.ok(web.includes('const-string v2, "https"'), 'check scheme https');
    assert.ok(web.includes('const-string v2, "open.spotify.com"'), 'check hote');
    assert.ok(web.includes('Uri;->getPort()I'), 'check port');
    assert.ok(web.includes(':cond_bridge_remove'), 'chemin remove toujours atteignable');
    const rm = web.slice(web.indexOf(':cond_bridge_remove'));
    assert.ok(rm.includes('removeJavascriptInterface'), 'retrait conserve pour les URLs avec autorite');
    assert.ok(rm.includes('bridge-removed'), 'trace conservee');
});

test('[cause] onReceivedError restaure l\'interface si le document commis est toujours Spotify', () => {
    const c91 = read('smali/c91.smali');
    const err = methodBody(c91,
        '.method public final onReceivedError(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;Landroid/webkit/WebResourceError;)V');
    const restoreAt = err.indexOf('const-string v0, "bridge-restored"');
    assert.ok(restoreAt >= 0, 'marqueur bridge-restored');
    const block = err.slice(0, restoreAt);
    assert.ok(block.includes('WebResourceRequest;->isForMainFrame()Z'), 'frame principale seulement');
    assert.ok(block.includes('WebView;->getUrl()Ljava/lang/String;'), 'URL COMMISE examinee (pas la cible)');
    assert.ok(block.includes('"open.spotify.com"'), 'restaure uniquement pour le Web Player');
    assert.ok(block.includes('addJavascriptInterface'), 're-attach reel');
    assert.ok(err.indexOf('bridge-restored') < err.indexOf('MainActivity;->D(Z)V'),
        'restauration AVANT la gestion overlay');
});

test('[cause] ERR_ABORTED exclu : jamais de restauration sur une navigation remplacee', () => {
    const c91 = read('smali/c91.smali');
    const err = methodBody(c91,
        '.method public final onReceivedError(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;Landroid/webkit/WebResourceError;)V');
    const block = err.slice(0, err.indexOf('const-string v0, "bridge-restored"'));
    assert.ok(block.includes('WebResourceError;->getErrorCode()I'), 'code d\'erreur lu');
    assert.ok(/const\/4 v1, -0x3\s*\n\s*if-eq v0, v1, :skip_bridge_restore/.test(block),
        'ERR_ABORTED (-3) saute la restauration');
});

test('[securite] fail-closed SSL conserve : aucun proceed, cancel toujours present', () => {
    const c91 = read('smali/c91.smali');
    assert.ok(c91.includes('SslErrorHandler;->cancel()V'), 'cancel() garde');
    assert.ok(!c91.includes('SslErrorHandler;->proceed'), 'jamais de proceed');
});

test('[securite] seuls des objets "AndBridge" sont ajoutes a la WebView', () => {
    const c91 = read('smali/c91.smali');
    const calls = [...c91.matchAll(/invoke-virtual \{[^}]+\}, Landroid\/webkit\/WebView;->addJavascriptInterface/g)];
    assert.ok(calls.length >= 3, 'addJavascriptInterface: navigation, page-finish, restauration');
    for (const call of calls) {
        const before = c91.slice(Math.max(0, call.index - 260), call.index);
        assert.ok(/const-string v\d, "AndBridge"/.test(before),
            'chaque addJavascriptInterface lie un objet AndBridge');
    }
    const names = [...c91.matchAll(/const-string v\d, "([A-Za-z]+)"\s*\n\s*invoke-virtual \{[^}]+\}, Landroid\/webkit\/WebView;->addJavascriptInterface/g)].map((m) => m[1]);
    assert.deepStrictEqual([...new Set(names)], ['AndBridge'], 'aucune autre interface exposee');
});

test('[securite] les sinks sensibles gardent @JavascriptInterface et la garde d\'epoque', () => {
    const bridge = read('smali/com/melodix/music/AndBridge.smali');
    for (const sig of ['onLibDiagState(Ljava/lang/String;)V', 'onNativeUiData(Ljava/lang/String;Ljava/lang/String;)V']) {
        const body = bridge.split('.method public final ' + sig)[1].split('.end method')[0];
        assert.ok(body.includes('.annotation runtime Landroid/webkit/JavascriptInterface;'), sig + ' reste annote');
    }
    const lib = bridge.split('.method public final onLibDiagState(Ljava/lang/String;)V')[1].split('.end method')[0];
    assert.ok(lib.indexOf('bridgeEpoch:I') < lib.indexOf('DiagCounters;->libState'), 'garde d\'epoque avant stockage');
});
