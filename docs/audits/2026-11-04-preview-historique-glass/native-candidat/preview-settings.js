    // User request (after 1022327): every real Spotify setting, read from Spotify's own preferences
    // page in the hidden WebView. A setting changes only when the user taps its row, never by itself.
    var previewSettings = {list: null, busy: false, queue: []};
    try { var cached = JSON.parse(window.localStorage.getItem('melodix_spotify_prefs_v1') || 'null'); if (Array.isArray(cached)) previewSettings.list = cached; } catch (_) {}
    function previewSettingText(node) { return String(node && node.textContent || '').replace(/\s+/g, ' ').trim().slice(0, 90); }
    function previewSettingControls() {
        var root = document.querySelector('main') || document.body;
        return root ? Array.prototype.slice.call(root.querySelectorAll('input[type="checkbox"], button[role="switch"], select')) : [];
    }
    function previewSettingLabel(el) {
        var t = '', by = el.getAttribute('aria-labelledby');
        if (el.id) try { t = previewSettingText(document.querySelector('label[for="' + window.CSS.escape(el.id) + '"]')); } catch (_) {}
        if (!t && by) t = previewSettingText(document.getElementById(by.split(' ')[0]));
        if (!t) t = String(el.getAttribute('aria-label') || '').trim();
        // Last resort: the row's own text (a select's options excluded).
        for (var p = el.parentNode, n = 0; !t && p && n < 4; p = p.parentNode, n++) {
            var own = previewSettingText(p), opts = el.tagName === 'SELECT' ? previewSettingText(el) : '';
            t = opts ? own.replace(opts, '').trim() : own;
        }
        return t;
    }
    function previewSettingSection(el, heads) {
        var s = '';
        heads.forEach(function(h) { if (h.compareDocumentPosition(el) & 4) s = previewSettingText(h); });
        return s;
    }
    function previewSettingRead(controls) {
        var root = document.querySelector('main') || document.body, heads = root ? Array.prototype.slice.call(root.querySelectorAll('h1, h2, h3')) : [];
        return (controls || previewSettingControls()).map(function(el) {
            var kind = el.tagName === 'SELECT' ? 'select' : 'switch', title = previewSettingLabel(el), section = previewSettingSection(el, heads);
            var value = kind === 'select' ? previewSettingText(el.options[el.selectedIndex]) :
                ((el.tagName === 'INPUT' ? el.checked : el.getAttribute('aria-checked') === 'true') ? 'ON' : 'OFF');
            // A long select is the language list: changing it reloads Spotify, which would stop playback.
            var locked = !!el.disabled || (kind === 'select' && el.options.length > 12);
            return {key: section + '|' + title, kind: kind, title: title, section: section, value: value, locked: locked};
        }).filter(function(s) { return s.title; });
    }
    var previewSleep = {until: 0, timer: 0, steps: [0, 15, 30, 45, 60, 90]};
    function previewSleepLabel() {
        var left = previewSleep.until - Date.now();
        return left > 0 ? Math.ceil(left / 60000) + ' min' : 'OFF';
    }
    // User request (after 1022328): a clean screen, grouped like Spotify's own settings.
    function previewSettingsRows() {
        var base = buildSpotifySettingsRows(), by = {};
        base.forEach(function(r) { by[r.uri && r.uri.indexOf('melodix:action:retry') !== 0 ? r.uri : r.title] = r; });
        function row(section, r, subtitle) { return r ? {section: section, title: r.title, subtitle: subtitle || r.subtitle, image: '', uri: r.uri, settingValue: r.settingValue} : null; }
        var account = base[1], logout = by['spotify:settings:logout'] || by['melodix:action:open-login'];
        var rows = [
            row('Compte', account, 'Nom affiché par Spotify'),
            row('Compte', logout, ''),
            row('Compte', by['melodix:action:open-account'], 'Abonnement, confidentialité et données du compte'),
            row('Lecture', by['melodix:setting:autoplay'], 'Continue avec des titres similaires à la fin'),
            row('Lecture', by['Lecture aléatoire'], ''),
            row('Lecture', by['Répétition'], ''),
            {section: 'Lecture', title: 'Minuteur de veille', subtitle: 'Met en pause après ce délai. Appuie pour changer', image: '', uri: 'melodix:setting:sleep', settingValue: previewSleepLabel()},
            row('Lecture', by['melodix:setting:bg_audio'], 'Garde la musique quand l’écran est éteint'),
            row('Affichage', by['melodix:setting:canvas'], 'Vidéos courtes derrière certains titres'),
            row('Bibliothèque', by['Actualiser la bibliothèque'], 'Recharge tes playlists et titres likés'),
            row('Bibliothèque', by['melodix:action:open-search'], ''),
            row('Notifications', by['melodix:action:open-notifications'], 'Autorisation gérée par Android')
        ].filter(function(r) { return r && r.title && r.settingValue !== 'Indisponible'; });
        var mine = (previewSettings.list && previewSettings.list.length ? previewSettings.list :
            [{title: previewSettings.failed ? 'Réglages Spotify indisponibles pour le moment' : 'Chargement des réglages Spotify…', section: 'Réglages Spotify', value: '', locked: true}]).map(function(s, i) {
            return {section: s.section || 'Réglages Spotify', title: s.title, image: '', settingValue: s.value,
                subtitle: s.locked ? (s.value ? 'À changer dans Spotify' : '') : s.kind === 'select' ? 'Appuie pour changer' : 'Réglage de ton compte Spotify',
                uri: s.locked ? '' : 'spotify:settings:sp' + i};
        });
        var about = {section: 'À propos', title: 'Melodix', subtitle: 'Lecteur Spotify', image: '', uri: '', settingValue: ''};
        return rows.concat(mine, [about]);
    }
    function previewSettingsSend(list) {
        if (list) { previewSettings.list = list; try { window.localStorage.setItem('melodix_spotify_prefs_v1', JSON.stringify(list)); } catch (_) {} }
        return sendNativeUiData('settings', previewSettingsRows());
    }
    // Opens Spotify's preferences page in the hidden WebView, runs work, then goes back where it was.
    function previewSettingsVisit(work) {
        if (previewSettings.busy) { previewSettings.queue.push(work); return; }
        previewSettings.busy = true;
        var back = window.location.pathname !== '/preferences', tries = 0, seen = -1;
        if (back) try { window.history.pushState(window.history.state, '', '/preferences'); window.dispatchEvent(new window.PopStateEvent('popstate', {state: window.history.state})); } catch (_) {}
        function done() {
            if (back && window.location.pathname === '/preferences') try { window.history.back(); } catch (_) {}
            previewSettings.busy = false; var next = previewSettings.queue.shift(); if (next) previewSettingsVisit(next);
        }
        (function wait() {
            var n = window.location.pathname === '/preferences' ? previewSettingControls().length : 0;
            // Wait until the list stops growing (the page renders its sections in steps).
            if ((n < 2 || n !== seen) && ++tries < 40) { seen = n; window.setTimeout(wait, 250); return; }
            try { work(n >= 2, done); } catch (_) { done(); }
        })();
    }
    window.setTimeout(function() {
        var origToggle = window.__sfToggleSpotifySetting;
        window.__sfRequestSpotifySettings = function() {
            var sent = previewSettingsSend();
            // Refreshes call this often: read Spotify's page at most once a minute.
            if (Date.now() - (previewSettings.at || 0) > 60000) {
                previewSettings.at = Date.now();
                previewSettingsVisit(function(ok, done) { if (ok) previewSettingsSend(previewSettingRead()); else { previewSettings.failed = true; previewSettingsSend(); } done(); });
            }
            return sent;
        };
        window.__sfToggleSpotifySetting = function(uri) {
            if (String(uri || '').trim() === 'melodix:setting:sleep') {
                var k = previewSleep.steps.indexOf(Math.ceil(Math.max(0, previewSleep.until - Date.now()) / 900000) * 15);
                var mins = previewSleep.steps[(k < 0 ? 0 : k + 1) % previewSleep.steps.length];
                window.clearTimeout(previewSleep.timer); previewSleep.until = mins ? Date.now() + mins * 60000 : 0;
                if (mins) previewSleep.timer = window.setTimeout(function() { previewSleep.until = 0; try { if (typeof window.actPlayPause === 'function') window.actPlayPause(false); } catch (_) {} }, mins * 60000);
                return previewSettingsSend();
            }
            var m = /^spotify:settings:sp(\d+)$/.exec(String(uri || '').trim());
            if (!m) return typeof origToggle === 'function' ? origToggle.apply(this, arguments) : undefined;
            var want = previewSettings.list && previewSettings.list[Number(m[1])];
            if (!want || want.locked) return;
            previewSettingsVisit(function(ok, done) {
                if (!ok) { done(); return; }
                var controls = previewSettingControls(), now = previewSettingRead(controls), i = -1;
                now.forEach(function(s, k) { if (i < 0 && s.key === want.key && s.kind === want.kind && !s.locked) i = k; });
                // Only the exact setting the user tapped, found again by its name: never a guess by position.
                if (i >= 0) {
                    var el = controls.filter(function(c) { return previewSettingLabel(c); })[i];
                    if (el.tagName === 'SELECT') {
                        var next = el.options[(el.selectedIndex + 1) % el.options.length].value;
                        Object.getOwnPropertyDescriptor(window.HTMLSelectElement.prototype, 'value').set.call(el, next);
                        el.dispatchEvent(new window.Event('change', {bubbles: true}));
                    } else el.click();
                }
                window.setTimeout(function() { previewSettingsSend(previewSettingRead()); done(); }, 700);
            });
        };
    }, 0);
