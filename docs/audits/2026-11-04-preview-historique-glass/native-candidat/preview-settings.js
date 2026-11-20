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
    function previewSettingsRows() {
        var base = buildSpotifySettingsRows().filter(function(r) { return r.settingValue !== 'Indisponible'; });
        var mine = (previewSettings.list || [{title: 'Chargement des réglages Spotify…', section: 'Réglages Spotify', value: '', locked: true}]).map(function(s, i) {
            return {section: s.section || 'Réglages Spotify', title: s.title, image: '', settingValue: s.value,
                subtitle: s.locked ? (s.value ? 'À changer dans Spotify' : '') : s.kind === 'select' ? 'Appuie pour changer' : 'Réglage de ton compte Spotify',
                uri: s.locked ? '' : 'spotify:settings:sp' + i};
        });
        return base.slice(0, 2).concat(mine, base.slice(2));
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
            previewSettingsVisit(function(ok, done) { if (ok) previewSettingsSend(previewSettingRead()); done(); });
            return sent;
        };
        window.__sfToggleSpotifySetting = function(uri) {
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
