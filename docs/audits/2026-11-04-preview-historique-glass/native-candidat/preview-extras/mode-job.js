(function(kind, action, shownState, expectedTitle, expectedTrack) {
    'use strict';
    // One explicit tap = one job. Methods in order, state re-read after each:
    // (a) control already in the page, (b) briefly open the now-playing view in
    // the hidden page and close it again, (c) web-player keyboard shortcut
    // (shuffle/repeat only: a like is never sent without a verified state).
    // Never reads storage, cookies or tokens; never navigates; no network.
    var W = window;
    var jobs = W.__melodixModeJobs = W.__melodixModeJobs || {};
    if (['like', 'shuffle', 'repeat'].indexOf(kind) < 0) return JSON.stringify({status: 'done', outcome: 'failed', reason: 'kind'});
    if (action === 'poll') {
        var previous = jobs[kind] || {status: 'none'};
        // A result can become stale after it was recorded but before native polling.
        if (kind === 'like' && previous.status === 'done' &&
            (previous.outcome === 'confirmed' || previous.outcome === 'read') && !identityMatches()) {
            previous.outcome = 'identity'; previous.state = 'unknown';
            if (previous.journal && previous.journal.length < 16) previous.journal.push('poll:identity');
        }
        return JSON.stringify(previous);
    }
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
    // Current Spotify wording varies: a verb plus a liked-songs/library word.
    (function() {
        var word = /(titres likés|liked songs|bibliothèque|library|biblioteca|bibliothek)/i, off = labels.like.off, on = labels.like.on;
        labels.like.off = {test: function(l) { return off.test(l) || (word.test(l) && /^(ajouter|add|enregistrer|save|añadir|adicionar|hinzufügen|zu)\b/i.test(l)); }};
        labels.like.on = {test: function(l) { return on.test(l) || (word.test(l) && /^(ajouté|retirer|supprimer|remove|enregistré|saved|added|quitar|remover|entfernen)/i.test(l)); }};
    })();
    // Spotify's "+" save button: generic "Ajouter..." label, state in aria-checked.
    function genericAdd(l) { return /^(ajouter|add|enregistrer|save)\b/i.test(l) && !/(titres likés|liked songs|bibliothèque|library|file d['’]attente|queue)/i.test(l); }
    function find() {
        var list = Array.from(document.querySelectorAll('button, [role="button"], [role="switch"]')).filter(function(b) {
            if (!b.isConnected) return false;
            var l = label(b);
            return ids[kind].test(testid(b)) || labels[kind].off.test(l) || labels[kind].on.test(l) ||
                (kind === 'like' && b.hasAttribute('aria-checked') && genericAdd(l)) ||
                (kind !== 'like' && neutral.test(l) && (kind === 'shuffle' ? /al[ée]atoire|shuffle/i : /r[ée]p[ée]t|repeat/i).test(l));
        });
        if (kind === 'like') {
            var scoped = list.filter(function(b) {
                return b.closest('[data-testid="now-playing-widget"], [data-testid="now-playing-bar"], [data-testid="now-playing-view"], [data-testid="now-playing-panel"], [data-testid="NPV"]');
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
        var checked = b.getAttribute('aria-checked'), pressed = b.getAttribute('aria-pressed');
        var raw = checked === null ? pressed : checked;
        var l = label(b), on = labels[kind].on.test(l), off = labels[kind].off.test(l);
        if (kind === 'like') {
            var id = testid(b).toLowerCase();
            var remove = /^(remove-button|remove-from-library-button)$/.test(id);
            var add = id === 'add-to-library-button';
            if (/^(true|menu|dialog|listbox|tree|grid)$/i.test(String(b.getAttribute('aria-haspopup') || '')) ||
                b.matches(':disabled') || b.closest('[aria-disabled="true"], fieldset:disabled') ||
                (checked !== null && pressed !== null && checked !== pressed)) return 'unknown';
            if (raw !== null && raw !== 'true' && raw !== 'false') return 'unknown';
            if (checked !== null && genericAdd(l)) return raw;
            if (raw === null) raw = on ? 'true' : off ? 'false' : 'unknown';
            if ((raw === 'false' && (on || remove)) || (raw === 'true' && off)) return 'unknown';
            // An unlabelled generic add-button may open a playlist picker.
            if (raw === 'false' && !off && !add) return 'unknown';
            return raw;
        }
        if (raw === 'true' || raw === 'false' || raw === 'mixed') return raw;
        return on ? 'true' : off ? 'false' : 'unknown';
    }
    // Spotify's bar title links to the album with the track in ?highlight=spotify:track:ID.
    function trackHref(h) {
        h = String(h || '');
        var m = /^(?:https:\/\/open\.spotify\.com)?\/(?:intl-[a-z]{2}(?:-[a-z]{2})?\/)?(track|episode)\/([a-z0-9]+)\/?(?:[?#].*)?$/i.exec(h);
        if (m) return m;
        var a = /^(?:https:\/\/open\.spotify\.com)?\/(?:intl-[a-z]{2}(?:-[a-z]{2})?\/)?album\/[a-z0-9]+\/?\?(?:[^#]*&)?highlight=spotify(?::|%3a)(track)(?::|%3a)([a-z0-9]+)(?:[&#].*)?$/i.exec(h);
        if (a) return [a[0], a[1], a[2]];
        var al = /^(?:https:\/\/open\.spotify\.com)?\/(?:intl-[a-z]{2}(?:-[a-z]{2})?\/)?(album)\/([a-z0-9]+)\/?(?:[?#].*)?$/i.exec(h);
        return al ? [al[0], al[1], al[2]] : null;
    }
    function identityMatches() {
        if (!expectedTitle || !expectedTrack) return false;
        var links = Array.from(document.querySelectorAll('[data-testid="now-playing-widget"] a[href], [data-testid="now-playing-bar"] a[href], a[data-testid="nowplaying-track-link"][href], [data-testid="now-playing-view"] a[href]'));
        var malformedIdentity = false;
        var identities = links.map(function(link) {
            var m = trackHref(String(link.getAttribute('href') || ''));
            if (!m && /^(context-item-link|nowplaying-track-link)$/i.test(String(link.getAttribute('data-testid') || ''))) malformedIdentity = true;
            return m ? {track:m[1].toLowerCase()+':'+m[2],title:String(link.textContent || '').replace(/\s+/g, ' ').trim()} : null;
        }).filter(Boolean);
        return !malformedIdentity && identities.some(function(x) { return x.title === expectedTitle; }) && identities.every(function(x) {
            return x.track === expectedTrack && (!x.title || x.title === expectedTitle);
        });
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
    // Open only an explicitly announced add menu, then act only on a unique,
    // explicitly unchecked Liked Songs item. Never select another playlist.
    function viaLikeMenu(b, method, after) {
        var id = testid(b).toLowerCase(), l = label(b), popup = String(b.getAttribute('aria-haspopup') || '');
        if (!/^(true|menu|dialog|listbox)$/i.test(popup)) return false;
        if (!identityMatches()) { log(method + ':menu-identity'); after('identity', 'unknown'); return true; }
        if (!/^(add-button|add-to-library-button)$/.test(id) || labels.like.on.test(l) ||
            shownState === 'true' || b.getAttribute('aria-checked') === 'true' || b.getAttribute('aria-pressed') === 'true' ||
            b.matches(':disabled') || b.closest('[aria-disabled="true"], fieldset:disabled')) {
            log(method + ':menu-unsafe'); after('menu-state', 'unknown'); return true;
        }
        var selector = '[role="menu"], [role="dialog"], [role="listbox"]';
        function available(n) { return n && n.isConnected && !n.closest('[hidden], [aria-hidden="true"]'); }
        var before = Array.from(document.querySelectorAll(selector)).filter(available);
        var expanded = b.getAttribute('aria-expanded') === 'true', opened = false;
        function root() {
            var id = b.getAttribute('aria-controls'), controlled = id && document.getElementById(id);
            if (available(controlled) && controlled.matches(selector) &&
                (expanded || before.indexOf(controlled) < 0 || b.getAttribute('aria-expanded') === 'true')) return controlled;
            if (expanded) return null;
            var fresh = Array.from(document.querySelectorAll(selector)).filter(function(n) { return available(n) && before.indexOf(n) < 0; });
            return fresh.length === 1 ? fresh[0] : null;
        }
        function closeMenu(r) {
            if (!opened) return;
            try {
                (available(r) ? r : b).dispatchEvent(new KeyboardEvent('keydown', {key:'Escape', code:'Escape', bubbles:true, cancelable:true}));
                log(available(r) && b.getAttribute('aria-expanded') === 'true' ? method + ':menu-close-unverified' : method + ':menu-close-requested');
            } catch (_) { log(method + ':menu-close-error'); }
        }
        if (!expanded) {
            try { b.click(); opened = true; log(method + ':menu-open'); }
            catch (_) { log(method + ':menu-open-error'); after('menu-absent', 'unknown'); return true; }
        }
        wait(function() {
            if (!identityMatches()) return 'identity-changed';
            return root();
        }, 1800, function(r) {
            if (r === 'identity-changed') { closeMenu(null); after('identity', 'unknown'); return; }
            if (!r) { log(method + ':menu-root'); closeMenu(null); after('menu-absent', 'unknown'); return; }
            var likedName = /^(liked songs|your liked songs|titres likés|vos titres likés|titres que j['’]aime|liked-titel|canciones que te gustan|músicas curtidas)$/i;
            function targets() {
                if (!available(r)) return [];
                return Array.from(r.querySelectorAll('[role="menuitemcheckbox"], [role="checkbox"], input[type="checkbox"]')).filter(function(n) {
                    var labelNode = n.closest('label');
                    var name = String(n.getAttribute('aria-label') || (labelNode && labelNode.textContent) || n.textContent || '').replace(/\s+/g, ' ').trim();
                    return available(n) && likedName.test(name);
                });
            }
            var candidates = targets();
            if (candidates.length !== 1) { log(method + (candidates.length ? ':menu-ambiguous' : ':menu-target')); closeMenu(r); after(candidates.length ? 'menu-ambiguous' : 'menu-absent', 'unknown'); return; }
            var target = candidates[0], raw = target.getAttribute('aria-checked');
            var checked = target.tagName === 'INPUT' && target.type === 'checkbox' ? (target.checked ? 'true' : 'false') : null;
            if (checked !== null && raw !== null && raw !== checked) raw = 'unknown';
            else if (raw === null) raw = checked;
            if (target.matches(':disabled') || target.closest('[aria-disabled="true"], fieldset:disabled') || (raw !== 'true' && raw !== 'false')) {
                log(method + ':menu-state'); closeMenu(r); after('menu-state', 'unknown'); return;
            }
            if (raw === 'true') { log(method + ':menu-liked'); closeMenu(r); after('read', 'true'); return; }
            if (!identityMatches()) { closeMenu(r); after('identity', 'unknown'); return; }
            try { target.click(); log(method + ':menu-add'); }
            catch (_) { log(method + ':menu-add-error'); closeMenu(r); after('unconfirmed', 'unknown'); return; }
            wait(function() {
                if (!identityMatches()) return 'identity-changed';
                var current = targets();
                if (current.length !== 1 || current[0] !== target || target.matches(':disabled') || target.closest('[aria-disabled="true"], fieldset:disabled')) return null;
                var a = target.getAttribute('aria-checked');
                var c = target.tagName === 'INPUT' && target.type === 'checkbox' ? target.checked : null;
                return (a === 'true' && c !== false) || (a === null && c === true) ? 'true' : null;
            }, 2200, function(state) {
                closeMenu(r);
                if (state === 'identity-changed') { log(method + ':menu-identity'); after('identity', 'unknown'); }
                else if (state === 'true') { log(method + ':menu-verified'); after('confirmed', 'true'); }
                else { log(method + ':menu-unverified'); after('unconfirmed', 'false'); }
            });
        });
        return true;
    }
    // Decide and click on a readable control; verify the change afterwards.
    function act(found, method, after) {
        var b = found.node;
        if (kind === 'like' && viaLikeMenu(b, method, after)) return;
        var before = read(b);
        log(method + ':state-' + before);
        if (before === 'unknown') { after('state', before); return; }
        if (kind === 'like') {
            if (!identityMatches()) { log(method + ':identity'); after('identity', before); return; }
            // A tap can only ADD a like: an existing like is never clicked,
            // whatever the native button shows. Only a verified 'false' is clicked.
            if (before !== 'false') { log(method + ':liked-read-only'); after('read', before); return; }
            if (shownState === 'true') { log(method + ':mismatch'); after('read', before); return; }
        }
        try { b.click(); log(method + ':click'); } catch (_) { log(method + ':click-error'); after('command', before); return; }
        wait(function() {
            if (kind === 'like' && !identityMatches()) return 'identity-changed';
            var again = find();
            if (!again.node) return null;
            var s = read(again.node);
            return s !== before && s !== 'unknown' ? s : null;
        }, 2200, function(s) {
            if (s === 'identity-changed') { log(method + ':identity'); after('identity', 'unknown'); }
            else if (s) { log(method + ':verified'); after('confirmed', s); }
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
            log('c:' + (ctrl ? 'ctrl-' : 'alt-') + spec.key); log('c:single-unreadable');
            finish('unverified', 'unknown', 'keyboard');
        } catch (_) { log('c:error'); finish('failed', 'unknown', ''); }
    }
    function result(outcome, state, method) {
        if (outcome === 'confirmed' || outcome === 'unconfirmed' || outcome === 'read') finish(outcome, state, method);
        else if (outcome === 'identity' || outcome === 'menu-absent' || outcome === 'menu-ambiguous' || outcome === 'menu-state') finish(outcome, 'unknown', method);
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
