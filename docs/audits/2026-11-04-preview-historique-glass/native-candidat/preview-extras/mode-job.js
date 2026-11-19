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
        var word = /(titres likés|liked songs|liké|liked|favori|bibliothèque|library|biblioteca|bibliothek)/i, off = labels.like.off, on = labels.like.on;
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
        if (kind !== 'like') {
            // User report (1022300): a disabled shuffle toggle elsewhere in the page (e.g. a
            // playlist header) was taken for the player's and reported as "blocked by Spotify".
            list = list.filter(function(b) {
                return !b.closest('main, [role="main"], [data-testid="action-bar-row"], [data-testid="playlist-page"], [data-testid="album-page"]');
            });
        }
        if (kind === 'like') {
            var scoped = list.filter(function(b) {
                return b.closest(':is([data-testid="now-playing-widget"], [data-testid="now-playing-widget-v2"]), [data-testid="now-playing-bar"], [data-testid="now-playing-view"], [data-testid="now-playing-panel"], [data-testid="NPV"]');
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
            if (/^(true|menu|dialog|listbox|tree|grid)$/i.test(String(b.getAttribute('aria-haspopup') || '')) ||
                b.matches(':disabled') || b.closest('[aria-disabled="true"], fieldset:disabled') ||
                (checked !== null && pressed !== null && checked !== pressed)) return 'unknown';
            if (raw !== null && raw !== 'true' && raw !== 'false') return 'unknown';
            if (raw === null) raw = on ? 'true' : off ? 'false' : 'unknown';
            // Once liked, Spotify relabels the checked button generically (phone 1022229).
            if (raw === 'true' && checked === 'true' && !on && !off && genericAdd(l)) on = true;
            if ((raw === 'false' && (on || remove)) || (raw === 'true' && off)) return 'unknown';
            // An unlabelled generic add-button may open a playlist picker.
            if (!off && !on) return 'unknown';
            return raw;
        }
        if (raw === 'true' || raw === 'false' || raw === 'mixed') return raw;
        return on ? 'true' : off ? 'false' : 'unknown';
    }
    // Spotify's bar title links to the album with the track in ?highlight=spotify:track:ID.
    function trackHref(h) {
        h = String(h || '');
        // A Spotify URI is a complete identity, unlike an album or title.
        var uri = /^spotify:(track|episode):([a-z0-9]+)$/i.exec(h);
        if (uri) return uri;
        var m = /^(?:https:\/\/open\.spotify\.com)?\/(?:intl-[a-z]{2}(?:-[a-z]{2})?\/)?(track|episode)\/([a-z0-9]+)\/?(?:[?#].*)?$/i.exec(h);
        if (m) return m;
        var a = /^(?:https:\/\/open\.spotify\.com)?\/(?:intl-[a-z]{2}(?:-[a-z]{2})?\/)?album\/[a-z0-9]+\/?\?(?:[^#]*&)?highlight=spotify(?::|%3a)(track)(?::|%3a)([a-z0-9]+)(?:[&#].*)?$/i.exec(h);
        if (a) {
            // Duplicate highlight keys, including encoded/case variants,
            // have ambiguous semantics. Never choose one arbitrarily.
            try {
                var query = new URL(h, 'https://open.spotify.com').searchParams;
                var values = [];
                query.forEach(function(value, key) { if (key.toLowerCase() === 'highlight') values.push(value); });
                if (values.length !== 1 || !/^spotify:track:[a-z0-9]+$/i.test(values[0])) return null;
                var parts = /^spotify:(track):([a-z0-9]+)$/i.exec(values[0]);
                return [a[0], parts[1], parts[2]];
            } catch (_) { return null; }
        }
        return null; // an album and title cannot uniquely identify a track
    }
    // Explicit track URIs on the current-player title only; never infer a
    // track from an album, playlist, title alone, or an unrelated page row.
    function markedTrack(n) {
        if (!/^(context-item-link|nowplaying-track-link|context-item-info-title)$/i.test(String(n.getAttribute('data-testid') || ''))) return '';
        var result = '';
        for (var name of ['data-uri', 'data-track-uri', 'data-spotify-uri']) {
            if (!n.hasAttribute(name)) continue;
            var m = /^spotify:(track|episode):([a-z0-9]+)$/i.exec(String(n.getAttribute(name) || ''));
            if (!m) return '!';
            var value = m[1].toLowerCase()+':'+m[2];
            if (result && result !== value) return '!';
            result = value;
        }
        return result;
    }
    // If a title link itself carries a malformed track hint, an attribute
    // must not mask that ambiguity. Album-only links may use their explicit
    // current-title parent marker, but never one outside the player bar.
    function hasTrackHint(h) {
        h=String(h||'');
        if (/^spotify:(track|episode):/i.test(h) || /\/(track|episode)\//i.test(h)) return true;
        try {
            var found=false;
            new URL(h, 'https://open.spotify.com').searchParams.forEach(function(v,k){if(k.toLowerCase()==='highlight')found=true;});
            return found;
        } catch (_) { return true; }
    }
    function parentTrack(link) {
        var n=link.closest('[data-testid="context-item-info-title"]');
        if(!n || !n.closest(':is([data-testid="now-playing-widget"], [data-testid="now-playing-widget-v2"]), [data-testid="now-playing-bar"]')) return '';
        return markedTrack(n);
    }
    function markedTitleNodes() {
        return Array.from(document.querySelectorAll(':is([data-testid="now-playing-widget"], [data-testid="now-playing-widget-v2"]) [data-testid="context-item-link"], :is([data-testid="now-playing-widget"], [data-testid="now-playing-widget-v2"]) [data-testid="nowplaying-track-link"], :is([data-testid="now-playing-widget"], [data-testid="now-playing-widget-v2"]) [data-testid="context-item-info-title"], [data-testid="now-playing-bar"] [data-testid="context-item-link"], [data-testid="now-playing-bar"] [data-testid="nowplaying-track-link"], [data-testid="now-playing-bar"] [data-testid="context-item-info-title"]')).filter(function(n) { return n.isConnected; });
    }
    function identityMatches() {
        if (!expectedTitle || !expectedTrack) return false;
        if (expectedTrack === 'title:' + expectedTitle) {
            // Id-less bar: no track link may exist, the native title must appear in the bar text.
            if (document.querySelector(':is([data-testid="now-playing-widget"], [data-testid="now-playing-widget-v2"]) a[href*="/track/"], [data-testid="now-playing-bar"] a[href*="/track/"]')) return false;
            return Array.from(document.querySelectorAll(':is([data-testid="now-playing-widget"], [data-testid="now-playing-widget-v2"]), [data-testid="now-playing-bar"]')).some(function(r) {
                return String(r.textContent || '').replace(/\s+/g, ' ').toLowerCase().indexOf(String(expectedTitle).replace(/\s+/g, ' ').trim().toLowerCase()) >= 0;
            });
        }
        var links = Array.from(document.querySelectorAll(':is([data-testid="now-playing-widget"], [data-testid="now-playing-widget-v2"]) a[href], [data-testid="now-playing-bar"] a[href], a[data-testid="nowplaying-track-link"][href], [data-testid="now-playing-view"] a[href]'));
        var malformedIdentity = false;
        var identities = links.map(function(link) {
            var m = trackHref(String(link.getAttribute('href') || ''));
            if (!m && /^(context-item-link|nowplaying-track-link)$/i.test(String(link.getAttribute('data-testid') || '')) && (hasTrackHint(link.getAttribute('href')) || (!markedTrack(link) && !parentTrack(link)))) malformedIdentity = true;
            return m ? {track:m[1].toLowerCase()+':'+m[2],title:String(link.textContent || '').replace(/\s+/g, ' ').trim()} : null;
        }).filter(Boolean);
        markedTitleNodes().forEach(function(n) {
            var value=markedTrack(n);
            if (value === '!') { malformedIdentity = true; return; }
            if (value) identities.push({track:value, title:String(n.textContent || '').replace(/\s+/g, ' ').trim()});
        });
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
    function invalidateLikedRead() {
        try { if (typeof W.__sfLikedMutationAttempted === 'function') W.__sfLikedMutationAttempted(); } catch (_) {}
    }
    // Open only an explicitly announced add menu, then act only on a unique,
    // explicitly unchecked Liked Songs item. Never select another playlist.
    function viaLikeMenu(b, method, after) {
        var id = testid(b).toLowerCase(), l = label(b), popup = String(b.getAttribute('aria-haspopup') || '');
        // Some Spotify player bars omit aria-haspopup on the generic, unchecked
        // add-to-playlist trigger. Permit only the known add control in the
        // already identity-checked player scope; we still act solely on a
        // fresh, unique, explicitly named Liked Songs checkbox below.
        var implicitPicker = /^(add-button|add-to-library-button)$/.test(id) && genericAdd(l) && b.getAttribute('aria-checked') === 'false';
        if (!/^(true|menu|dialog|listbox)$/i.test(popup) && !implicitPicker) return false;
        if (!identityMatches()) { log(method + ':menu-identity'); after('identity', 'unknown'); return true; }
        if (!/^(add-button|add-to-library-button)$/.test(id) || labels.like.on.test(l) ||
            shownState === 'true' || ((b.getAttribute('aria-checked') === 'true' || b.getAttribute('aria-pressed') === 'true') && !genericAdd(l)) ||
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
            invalidateLikedRead();
            try { target.click(); log(method + ':menu-add'); }
            catch (_) { log(method + ':menu-add-error'); closeMenu(r); after('unconfirmed', 'unknown'); return; }
            wait(function() {
                if (!identityMatches()) return 'identity-changed';
                var current = targets();
                if (current.length !== 1 || current[0].matches(':disabled') || current[0].closest('[aria-disabled="true"], fieldset:disabled')) return null;
                // React may replace the checkbox after the click; only the
                // unique explicit Liked Songs item in the same menu is read.
                var observed = current[0];
                var a = observed.getAttribute('aria-checked');
                var c = observed.tagName === 'INPUT' && observed.type === 'checkbox' ? observed.checked : null;
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
    // Spotify removes a like either directly or through its playlist picker,
    // where only the unique checked Liked Songs item is unchecked, then Done.
    function unlike(b, method, after) {
        var selector = '[role="menu"], [role="dialog"], [role="listbox"]';
        var likedName = /^(liked songs|your liked songs|titres likés|vos titres likés|titres que j['’]aime|liked-titel|canciones que te gustan|músicas curtidas)$/i;
        function available(n) { return n && n.isConnected && !n.closest('[hidden], [aria-hidden="true"]'); }
        var before = Array.from(document.querySelectorAll(selector)).filter(available);
        var doneRe = /^(terminé|terminer|done|ok|valider|enregistrer|save)$/i;
        function doneButtons() { return Array.from(document.querySelectorAll('button, [role="button"]')).filter(function(n) { return available(n) && doneRe.test(String(n.getAttribute('aria-label') || n.textContent || '').replace(/\s+/g, ' ').trim()); }); }
        var doneBefore = doneButtons();
        // The picker can render empty first and fill later: wait for the fresh root that holds the target.
        function fresh() { var f = Array.from(document.querySelectorAll(selector)).filter(function(n) { return available(n) && before.indexOf(n) < 0; }); var withTarget = f.filter(function(n) { return targets(n).length; }); return withTarget.length === 1 ? withTarget[0] : null; }
        function anyFresh() { return Array.from(document.querySelectorAll(selector)).filter(function(n) { return available(n) && before.indexOf(n) < 0; })[0] || null; }
        function barState() { var a = find(); return a.node ? read(a.node) : 'unknown'; }
        var checkSel = '[role="menuitemcheckbox"], [role="checkbox"], [role="switch"], input[type="checkbox"], [aria-checked], [aria-pressed]';
        function targets(r) {
            // The Liked Songs name may sit beside its checkbox: climb from the exact
            // name to the nearest ancestor holding exactly one checkable control.
            var out = [];
            Array.from(r.querySelectorAll('*')).forEach(function(n) {
                if (!available(n) || n.children.length > 1) return;
                var name = String(n.getAttribute('aria-label') || n.textContent || '').replace(/\s+/g, ' ').trim();
                if (!likedName.test(name)) return;
                for (var p = n; p && p !== r.parentNode; p = p.parentElement) {
                    var c = (p.matches && p.matches(checkSel) ? [p] : []).concat(Array.from(p.querySelectorAll(checkSel))).filter(available);
                    if (c.length === 1) { if (out.indexOf(c[0]) < 0) out.push(c[0]); return; }
                    if (c.length > 1) return;
                }
            });
            return out;
        }
        function counts(r) { return '-c' + Math.min(r.querySelectorAll(checkSel).length, 99) + '-n' + Math.min(Array.from(r.querySelectorAll('*')).filter(function(n) { return n.children.length <= 1 && likedName.test(String(n.textContent || '').replace(/\s+/g, ' ').trim()); }).length, 99); }
        function close(r) { try { (available(r) ? r : b).dispatchEvent(new KeyboardEvent('keydown', {key:'Escape', code:'Escape', bubbles:true, cancelable:true})); } catch (_) {} }
        invalidateLikedRead();
        try { b.click(); log(method + ':unlike-open'); } catch (_) { after('command', 'true'); return; }
        wait(function() {
            if (!identityMatches()) return 'identity-changed';
            if (barState() === 'false') return 'direct';
            return fresh();
        }, 3500, function(r) {
            if (r === 'identity-changed') { after('identity', 'unknown'); return; }
            if (r === 'direct') { log(method + ':unlike-verified'); after('confirmed', 'false'); return; }
            if (!r) { var o = anyFresh(); log(method + (o ? ':unlike-target' + counts(o) : ':unlike-no-picker') + '-d' + Math.min(document.querySelectorAll(selector).length, 99)); close(o); after('menu-absent', 'true'); return; }
            var t = targets(r);
            if (t.length !== 1) { log(method + (t.length ? ':unlike-ambiguous' : ':unlike-target') + counts(r)); close(r); after(t.length ? 'menu-ambiguous' : 'menu-absent', 'true'); return; }
            var on = t[0].getAttribute('aria-checked') === 'true' || t[0].checked === true;
            if (!on) { log(method + ':unlike-not-checked'); close(r); after('menu-state', 'true'); return; }
            try { t[0].click(); log(method + ':unlike-uncheck'); } catch (_) { close(r); after('unconfirmed', 'true'); return; }
            // Spotify's picker keeps its Done button in a footer outside the list root, and
            // closing without it (Escape) discards the change: look for a Done button that
            // appeared with the picker, inside it first, then anywhere on the page.
            // Phone 1022277: no Done existed before the uncheck, so it can appear only after it.
            function findDone() {
                var d = Array.from(r.querySelectorAll('button, [role="button"]')).filter(function(n) { return available(n) && doneRe.test(String(n.getAttribute('aria-label') || n.textContent || '').replace(/\s+/g, ' ').trim()); });
                return d.length ? d : doneButtons().filter(function(n) { return doneBefore.indexOf(n) < 0; });
            }
            wait(function() {
                if (!identityMatches()) return 'identity-changed';
                var d = findDone(); return d.length === 1 ? d : null;
            }, 1500, function(found) {
            if (found === 'identity-changed') { if (available(r)) close(r); after('identity', 'unknown'); return; }
            var done = Array.isArray(found) ? found : [];
            if (done.length === 1) {
                try { done[0].click(); log(method + ':unlike-done'); } catch (_) {}
                wait(function() {
                    if (!identityMatches()) return 'identity-changed';
                    return barState() === 'false' ? 'false' : null;
                }, 2600, function(st) {
                    if (available(r)) close(r);
                    if (st === 'identity-changed') after('identity', 'unknown');
                    else if (st === 'false') { log(method + ':unlike-verified'); after('confirmed', 'false'); }
                    else { log(method + ':unlike-unverified'); after('unconfirmed', 'true'); }
                });
                return;
            }
            // Some current Spotify menus have no Done button and do not update
            // the generic player toggle. Confirm only if the exact Liked Songs
            // checkbox becomes unchecked, survives closing, and remains false
            // in a freshly reopened menu. Otherwise stay unconfirmed.
            wait(function() {
                if (!identityMatches()) return 'identity-changed';
                var current = targets(r);
                return current.length === 1 && current[0].getAttribute('aria-checked') === 'false' ? 'unchecked' : null;
            }, 1200, function(changed) {
                if (changed !== 'unchecked') { if (available(r)) close(r); after(changed === 'identity-changed' ? 'identity' : 'unconfirmed', 'true'); return; }
                close(r);
                wait(function() { return !available(r) ? 'closed' : null; }, 1000, function(closed) {
                    if (closed !== 'closed') { after('unconfirmed', 'true'); return; }
                    var beforeReopen = Array.from(document.querySelectorAll(selector)).filter(available);
                    try { b.click(); log(method + ':unlike-recheck-open'); }
                    catch (_) { after('unconfirmed', 'true'); return; }
                    wait(function() {
                        if (!identityMatches()) return 'identity-changed';
                        var freshMenus = Array.from(document.querySelectorAll(selector)).filter(function(n) { return available(n) && beforeReopen.indexOf(n) < 0; });
                        var matches = freshMenus.filter(function(n) { return targets(n).length > 0; });
                        if (matches.length !== 1) return null;
                        var current = targets(matches[0]);
                        if (current.length !== 1) return null;
                        return current[0].getAttribute('aria-checked') === 'false' ? 'false' : current[0].getAttribute('aria-checked') === 'true' ? 'true' : null;
                    }, 1800, function(state) {
                        var reopened = Array.from(document.querySelectorAll(selector)).filter(function(n) { return available(n) && beforeReopen.indexOf(n) < 0; });
                        if (reopened.length === 1) close(reopened[0]);
                        if (state === 'identity-changed') after('identity', 'unknown');
                        else if (state === 'false') { log(method + ':unlike-verified'); after('confirmed', 'false'); }
                        else { log(method + ':unlike-unverified'); after('unconfirmed', 'true'); }
                    });
                });
            });
            });
        });
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
            // Remove only when the user tapped a button shown as liked and the page agrees.
            if (before === 'true' && shownState === 'true') { unlike(b, method, after); return; }
            if (before !== 'false') { log(method + ':liked-read-only'); after('read', before); return; }
            if (shownState === 'true') { log(method + ':mismatch'); after('read', before); return; }
        }
        if (kind === 'like') invalidateLikedRead();
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
        // Blind Alt+R could switch on repeat-one unseen and block skipping (user report 1022295).
        if (kind === 'repeat') { log('c:repeat-skipped'); finish('failed', 'unknown', ''); return; }
        var spec = kind === 'shuffle' ? {key: 's', code: 'KeyS', keyCode: 83} : {key: 'r', code: 'KeyR', keyCode: 82};
        // Unverifiable when no control is readable, so only ONE combination per
        // tap (two could cancel each other). Spotify's web player uses Alt+S / Alt+R.
        var ctrl = false;
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
        try { log('vw:' + Math.round((W.innerWidth || 0) / 100) * 100); } catch (_) {}
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
