    // User request (after 1022327): every real Spotify setting, read from Spotify's own preferences
    // page in the hidden WebView. A setting changes only when the user taps its row, never by itself.
    var msSet = {list: null, busy: false, queue: []};
    try { var cached = JSON.parse(window.localStorage.getItem('melodix_spotify_prefs_v1') || 'null'); if (Array.isArray(cached)) msSet.list = cached; } catch (_) {}
    function msTxt(node) { return String(node && node.textContent || '').replace(/\s+/g, ' ').trim().slice(0, 90); }
    function msCtl() {
        var root = document.querySelector('main') || document.body;
        return root ? Array.prototype.slice.call(root.querySelectorAll('input[type="checkbox"], button[role="switch"], select')) : [];
    }
    function msLab(el) {
        var t = '', by = el.getAttribute('aria-labelledby');
        if (el.id) try { t = msTxt(document.querySelector('label[for="' + window.CSS.escape(el.id) + '"]')); } catch (_) {}
        if (!t && by) t = msTxt(document.getElementById(by.split(' ')[0]));
        if (!t) t = String(el.getAttribute('aria-label') || '').trim();
        // Last resort: the row's own text (a select's options excluded).
        for (var p = el.parentNode, n = 0; !t && p && n < 4; p = p.parentNode, n++) {
            var own = msTxt(p), opts = el.tagName === 'SELECT' ? msTxt(el) : '';
            t = opts ? own.replace(opts, '').trim() : own;
        }
        return t;
    }
    function msSec(el, heads) {
        var s = '';
        heads.forEach(function(h) { if (h.compareDocumentPosition(el) & 4) s = msTxt(h); });
        return s;
    }
    function msRead(controls) {
        var root = document.querySelector('main') || document.body, heads = root ? Array.prototype.slice.call(root.querySelectorAll('h1, h2, h3')) : [];
        return (controls || msCtl()).map(function(el) {
            var kind = el.tagName === 'SELECT' ? 'select' : 'switch', title = msLab(el), section = msSec(el, heads);
            var value = kind === 'select' ? msTxt(el.options[el.selectedIndex]) :
                ((el.tagName === 'INPUT' ? el.checked : el.getAttribute('aria-checked') === 'true') ? 'ON' : 'OFF');
            // A long select is the language list: changing it reloads Spotify, which would stop playback.
            var locked = !!el.disabled || (kind === 'select' && el.options.length > 12);
            return {key: section + '|' + title, kind: kind, title: title, section: section, value: value, locked: locked};
        }).filter(function(s) { return s.title; });
    }
    var msSleep = {until: 0, timer: 0, steps: [0, 15, 30, 45, 60, 90]};
    function msSleepTxt() {
        var left = msSleep.until - Date.now();
        return left > 0 ? Math.ceil(left / 60000) + ' min' : 'OFF';
    }
    // User request (after 1022328): a clean screen, grouped like Spotify's own settings.
    function msRows() {
        var base = buildSpotifySettingsRows(), by = {};
        base.forEach(function(r) { by[r.uri && r.uri.indexOf('melodix:action:retry') !== 0 ? r.uri : r.title] = r; });
        function row(section, r) { return r ? {section: section, title: r.title, subtitle: '', image: '', uri: r.uri, settingValue: r.settingValue} : null; }
        var account = base[1], logout = by['spotify:settings:logout'] || by['melodix:action:open-login'];
        var rows = [
            row('Compte', account),
            row('Compte', logout),
            row('Compte', by['melodix:action:open-account']),
            row('Lecture', by['melodix:setting:autoplay']),
            row('Lecture', by['Lecture aléatoire']),
            row('Lecture', by['Répétition']),
            {section: 'Lecture', title: 'Minuteur de veille', subtitle: '', image: '', uri: 'melodix:setting:sleep', settingValue: msSleepTxt()},
            row('Lecture', by['melodix:setting:bg_audio']),
            row('Affichage', by['melodix:setting:canvas']),
            row('Bibliothèque', by['Actualiser la bibliothèque']),
            row('Bibliothèque', by['melodix:action:open-search']),
            row('Notifications', by['melodix:action:open-notifications'])
        ].filter(function(r) { return r && r.title && r.settingValue !== 'Indisponible'; });
        var mine = (msSet.list && msSet.list.length ? msSet.list :
            [{title: msSet.failed ? 'Réglages Spotify indisponibles pour le moment' : 'Chargement des réglages Spotify…', section: 'Réglages Spotify', value: '', locked: true}]).map(function(s, i) {
            return {section: s.section || 'Réglages Spotify', title: s.title, image: '', settingValue: s.value,
                subtitle: s.locked ? (s.value ? 'À changer dans Spotify' : '') : s.kind === 'select' ? 'Appuie pour changer' : 'Réglage de ton compte Spotify',
                uri: s.locked ? '' : 'spotify:settings:sp' + i};
        });
        var about = {section: 'À propos', title: 'Melodix', subtitle: '', image: '', uri: '', settingValue: ''};
        return rows.concat(mine, [about]);
    }
    function msSend(list) {
        if (list) { msSet.list = list; try { window.localStorage.setItem('melodix_spotify_prefs_v1', JSON.stringify(list)); } catch (_) {} }
        return sendNativeUiData('settings', msRows());
    }
    // Opens Spotify's preferences page in the hidden WebView, runs work, then goes back where it was.
    function msVisit(work) {
        if (msSet.busy) { msSet.queue.push(work); return; }
        msSet.busy = true;
        var back = window.location.pathname !== '/preferences', tries = 0, seen = -1;
        if (back) try { window.history.pushState(window.history.state, '', '/preferences'); window.dispatchEvent(new window.PopStateEvent('popstate', {state: window.history.state})); } catch (_) {}
        function done() {
            if (back && window.location.pathname === '/preferences') try { window.history.back(); } catch (_) {}
            msSet.busy = false; var next = msSet.queue.shift(); if (next) msVisit(next);
        }
        (function wait() {
            var n = window.location.pathname === '/preferences' ? msCtl().length : 0;
            // Wait until the list stops growing (the page renders its sections in steps).
            if ((n < 2 || n !== seen) && ++tries < 40) { seen = n; window.setTimeout(wait, 250); return; }
            try { work(n >= 2, done); } catch (_) { done(); }
        })();
    }
    window.setTimeout(function() {
        var origToggle = window.__sfToggleSpotifySetting;
        window.__sfRequestSpotifySettings = function() {
            var sent = msSend();
            // Refreshes call this often: read Spotify's page at most once a minute.
            if (Date.now() - (msSet.at || 0) > 60000) {
                msSet.at = Date.now();
                msVisit(function(ok, done) { if (ok) msSend(msRead()); else { msSet.failed = true; msSend(); } done(); });
            }
            return sent;
        };
        window.__sfToggleSpotifySetting = function(uri) {
            if (String(uri || '').trim() === 'melodix:setting:sleep') {
                var k = msSleep.steps.indexOf(Math.ceil(Math.max(0, msSleep.until - Date.now()) / 900000) * 15);
                var mins = msSleep.steps[(k < 0 ? 0 : k + 1) % msSleep.steps.length];
                window.clearTimeout(msSleep.timer); msSleep.until = mins ? Date.now() + mins * 60000 : 0;
                if (mins) msSleep.timer = window.setTimeout(function() { msSleep.until = 0; try { if (typeof window.actPlayPause === 'function') window.actPlayPause(false); } catch (_) {} }, mins * 60000);
                return msSend();
            }
            var m = /^spotify:settings:sp(\d+)$/.exec(String(uri || '').trim());
            if (!m) return typeof origToggle === 'function' ? origToggle.apply(this, arguments) : undefined;
            var want = msSet.list && msSet.list[Number(m[1])];
            if (!want || want.locked) return;
            msVisit(function(ok, done) {
                if (!ok) { done(); return; }
                var controls = msCtl(), now = msRead(controls), i = -1;
                now.forEach(function(s, k) { if (i < 0 && s.key === want.key && s.kind === want.kind && !s.locked) i = k; });
                // Only the exact setting the user tapped, found again by its name: never a guess by position.
                if (i >= 0) {
                    var el = controls.filter(function(c) { return msLab(c); })[i];
                    if (el.tagName === 'SELECT') {
                        var next = el.options[(el.selectedIndex + 1) % el.options.length].value;
                        Object.getOwnPropertyDescriptor(window.HTMLSelectElement.prototype, 'value').set.call(el, next);
                        el.dispatchEvent(new window.Event('change', {bubbles: true}));
                    } else el.click();
                }
                window.setTimeout(function() { msSend(msRead()); done(); }, 700);
            });
        };
    }, 0);
