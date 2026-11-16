(function(kind, action, shownState, expectedTitle) {
    'use strict';
    // One explicit tap = one job. Methods in order, state re-read after each:
    // (a) control already in the page, (b) briefly open the now-playing view in
    // the hidden page and close it again, (c) web-player keyboard shortcut
    // (shuffle/repeat only: a like is never sent without a verified state).
    // Never reads storage, cookies or tokens; never navigates; no network.
    var W = window;
    var jobs = W.__melodixModeJobs = W.__melodixModeJobs || {};
    if (['like', 'shuffle', 'repeat'].indexOf(kind) < 0) return JSON.stringify({status: 'done', outcome: 'failed', reason: 'kind'});
    if (action === 'poll') return JSON.stringify(jobs[kind] || {status: 'none'});
    if (action !== 'run') return JSON.stringify({status: 'none'});
    if (jobs[kind] && jobs[kind].status === 'running' && Date.now() - jobs[kind].started < 8000) return JSON.stringify({status: 'busy'});
    var labels = {
        like: {
            off: /^(save to your library|add to (your )?(liked songs|library)|ajouter (à|aux) (la bibliothèque|titres likés|vos titres likés)|enregistrer dans (votre |la )?bibliothèque|in (deine |der )?bibliothek (aufnehmen|hinzufügen)|añadir a (tu )?biblioteca|adicionar (à biblioteca|aos títulos curtidos))$/i,
            on: /^(remove from (your )?(library|liked songs)|retirer (de la bibliothèque|des titres likés|de vos titres likés)|supprimer de (votre |la )?bibliothèque|aus (deiner |der )?bibliothek entfernen|quitar de (tu )?biblioteca|remover (da biblioteca|dos títulos curtidos))$/i
        },
        repeat: {
            off: /^(enable repeat|turn repeat on|activer la répétition|wiederholung aktivieren|activar repetición|ativar repetição)$/i,
            on: /^(disable repeat|turn repeat off|enable repeat one|désactiver la répétition|activer la répétition d['’]un titre|wiederholung deaktivieren|desactivar repetición|desativar repetição)$/i
        },
        shuffle: {
            off: /^(enable shuffle|turn shuffle on|activate shuffle|activer (la lecture |le mode |l['’])?aléatoire|zufallswiedergabe aktivieren|activar (el modo |la reproducción )?aleatori[oa]|ativar (a reprodução )?aleatória)$/i,
            on: /^(disable shuffle|turn shuffle off|deactivate shuffle|enable smart shuffle|désactiver (la lecture |le mode |l['’])?aléatoire|activer la lecture aléatoire intelligente|zufallswiedergabe deaktivieren|desactivar (el modo |la reproducción )?aleatori[oa]|desativar (a reprodução )?aleatória)$/i
        }
    };
    // Neutral names locate a control but never decide its state.
    var neutral = /^(shuffle|lecture aléatoire|aléatoire|repeat|répéter|répétition)$/i;
    var ids = {
        like: /^(add-button|remove-button|add-to-library-button|remove-from-library-button)$/i,
        repeat: /^control-button-repeat$/i,
        shuffle: /^control-button-shuffle$|shuffle/i
    };
    var job = {status: 'running', started: Date.now(), outcome: '', state: 'unknown', method: '', journal: []};
    jobs[kind] = job;
    function log(code) { if (job.journal.length < 16) job.journal.push(code); }
    function finish(outcome, state, method) { job.status = 'done'; job.outcome = outcome; job.state = state || 'unknown'; job.method = method || ''; }
    function label(b) { return String(b.getAttribute('aria-label') || '').trim(); }
    function testid(b) { return String(b.getAttribute('data-testid') || ''); }
    function find() {
        var list = Array.from(document.querySelectorAll('button, [role="button"], [role="switch"]')).filter(function(b) {
            if (!b.isConnected) return false;
            var l = label(b);
            return ids[kind].test(testid(b)) || labels[kind].off.test(l) || labels[kind].on.test(l) ||
                (kind !== 'like' && neutral.test(l) && (kind === 'shuffle' ? /al[ée]atoire|shuffle/i : /r[ée]p[ée]t|repeat/i).test(l));
        });
        if (kind === 'like') {
            var scoped = list.filter(function(b) {
                return b.closest('[data-testid="now-playing-widget"], [data-testid="now-playing-bar"], [data-testid="now-playing-view"], [data-testid="now-playing-panel"], [data-testid="NPV"], aside');
            });
            list = scoped;
        }
        if (list.length > 1) {
            var visible = list.filter(function(b) { var r = b.getBoundingClientRect(); return r.width > 0 && r.height > 0; });
            if (visible.length === 1) list = visible;
        }
        if (!list.length) return {reason: 'absent'};
        if (list.length !== 1) return {reason: 'ambiguous'};
        var b = list[0];
        if (b.disabled || b.getAttribute('aria-disabled') === 'true') return {reason: 'disabled', node: b};
        return {node: b, reason: ''};
    }
    function read(b) {
        var raw = b.getAttribute('aria-checked');
        if (raw === null) raw = b.getAttribute('aria-pressed');
        var l = label(b), on = labels[kind].on.test(l), off = labels[kind].off.test(l);
        if (raw === 'true' || raw === 'false' || (raw === 'mixed' && kind !== 'like')) {
            if (kind === 'like' && ((raw === 'false' && on) || (raw === 'true' && off))) return 'unknown';
            return raw;
        }
        return on ? 'true' : off ? 'false' : 'unknown';
    }
    function nowTitle() {
        var link = document.querySelector('[data-testid="now-playing-widget"] a[data-testid="context-item-link"], [data-testid="now-playing-bar"] a[data-testid="context-item-link"], a[data-testid="nowplaying-track-link"], [data-testid="now-playing-view"] a[href*="/track/"]');
        return link ? String(link.textContent || '').replace(/\s+/g, ' ').trim() : '';
    }
    function opener() {
        var list = Array.from(document.querySelectorAll('button, [role="button"]')).filter(function(b) {
            if (!b.isConnected) return false;
            var id = testid(b), l = label(b);
            return /^(control-button-npv|now-playing-view-button)$/i.test(id) ||
                /^(now playing view|show now playing view|hide now playing view|vue « ?en cours de lecture ?»|afficher la vue en cours de lecture|masquer la vue en cours de lecture|en cours de lecture|ansicht „läuft gerade“|vista de reproducción|tela tocando agora)$/i.test(l);
        });
        return list.length === 1 ? list[0] : null;
    }
    function pressed(b) { return b.getAttribute('aria-pressed') === 'true' || b.getAttribute('aria-expanded') === 'true' || b.getAttribute('data-active') === 'true'; }
    function wait(test, ms, done) {
        var end = Date.now() + ms;
        (function step() {
            var v;
            try { v = test(); } catch (_) { v = null; }
            if (v || Date.now() >= end) { done(v || null); return; }
            setTimeout(step, 120);
        })();
    }
    // Decide and click on a readable control; verify the change afterwards.
    function act(found, method, after) {
        var b = found.node, before = read(b);
        log(method + ':state-' + before);
        if (before === 'unknown') { after('state', before); return; }
        if (kind === 'like') {
            var title = nowTitle();
            if (expectedTitle && title && title !== expectedTitle) { log(method + ':identity'); after('identity', before); return; }
            // A tap can only ADD a like: an existing like is never clicked,
            // whatever the native button shows. Only a verified 'false' is clicked.
            if (before !== 'false') { log(method + ':liked-read-only'); after('read', before); return; }
            if (shownState === 'true') { log(method + ':mismatch'); after('read', before); return; }
        }
        try { b.click(); log(method + ':click'); } catch (_) { log(method + ':click-error'); after('command', before); return; }
        wait(function() {
            var again = find();
            if (!again.node) return null;
            var s = read(again.node);
            return s !== before && s !== 'unknown' ? s : null;
        }, 2200, function(s) {
            if (s) { log(method + ':verified'); after('confirmed', s); }
            else { log(method + ':unverified'); after('unconfirmed', before); }
        });
    }
    function viaKeyboard() {
        if (kind === 'like') { log('c:like-skipped'); finish('failed', 'unknown', ''); return; }
        var spec = kind === 'shuffle' ? {key: 's', code: 'KeyS', keyCode: 83} : {key: 'r', code: 'KeyR', keyCode: 82};
        // Unverifiable when no control is readable, so only ONE combination per
        // tap (two could cancel each other). Families alternate across taps.
        var turns = W.__melodixKeyTurns = W.__melodixKeyTurns || {};
        var ctrl = !(turns[kind] % 2); turns[kind] = (turns[kind] || 0) + 1;
        try {
            var target = document.activeElement && document.activeElement !== document.body ? document.activeElement : document.body;
            ['keydown', 'keyup'].forEach(function(type) {
                target.dispatchEvent(new KeyboardEvent(type, {key: spec.key, code: spec.code, keyCode: spec.keyCode, which: spec.keyCode, ctrlKey: ctrl, altKey: !ctrl, bubbles: true, cancelable: true}));
            });
            log('c:' + (ctrl ? 'ctrl-' : 'alt-') + spec.key);
            finish('unverified', 'unknown', 'keyboard');
        } catch (_) { log('c:error'); finish('failed', 'unknown', ''); }
    }
    function result(outcome, state, method) {
        if (outcome === 'confirmed' || outcome === 'unconfirmed' || outcome === 'read') finish(outcome, state, method);
        else if (outcome === 'identity') finish('identity', 'unknown', method);
        else finish('failed', state, method);
    }
    try {
        var direct = find();
        log('a:' + (direct.node ? 'found' : direct.reason));
        if (direct.node && !direct.reason) { act(direct, 'a', function(o, s) { result(o, s, 'direct'); }); return JSON.stringify({status: 'started'}); }
        if (direct.reason === 'disabled') { finish('disabled', 'unknown', 'direct'); return JSON.stringify({status: 'started'}); }
        var view = opener();
        if (!view) { log('b:no-opener'); viaKeyboard(); return JSON.stringify({status: 'started'}); }
        var wasOpen = pressed(view);
        if (!wasOpen) { try { view.click(); log('b:opened'); } catch (_) { log('b:open-error'); } }
        else log('b:already-open');
        var closeView = function() {
            if (!wasOpen) {
                setTimeout(function() {
                    var again = opener();
                    try { if (again && pressed(again)) { again.click(); log('b:closed'); } } catch (_) { log('b:close-error'); }
                }, 150);
            }
        };
        wait(function() { var f = find(); return f.node && !f.reason ? f : null; }, 1800, function(found) {
            if (!found) { log('b:absent'); closeView(); viaKeyboard(); return; }
            log('b:found');
            act(found, 'b', function(o, s) { closeView(); result(o, s, 'now-playing-view'); });
        });
        return JSON.stringify({status: 'started'});
    } catch (_) {
        finish('failed', 'unknown', '');
        return JSON.stringify({status: 'started'});
    }
})
