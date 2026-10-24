// Melodix Diagnostic Engine (build diagnostique) — runtime, not simulation.
// Injected natively through NativeBridgeAsset.readAssetUtf8("diag_engine.js")
// + WebView.evaluateJavascript (no CSP eval needed). It observes the REAL
// pipeline on the device (session -> fetch -> parse -> normalize -> bridge ->
// native admission -> render) and drives the "Diagnostic Melodix" screen.
//
// Security: no tokens/cookies/OAuth material ever leaves this file; playlist
// names and personal titles are EXCLUDED by default (counts and irreversible
// short fingerprints only); response bodies are never stored; the event log is
// bounded. Optional local detail (names) can be enabled explicitly and is
// marked in the report.
(function () {
    'use strict';

    var MAX_EVENTS = 240;
    var MAX_STEPS = 48;
    var MAX_CATEGORIES = 8;

    function nowMs() {
        return Date.now();
    }

    function isoAt(ts) {
        try {
            return new Date(ts || nowMs()).toISOString().slice(11, 23);
        } catch (_) {
            return '';
        }
    }

    // Irreversible 8-hex fingerprint of an id (no personal data, no reversal).
    function fingerprint(value) {
        var s = String(value || '');
        var h = 0x811c9dc5;
        var i;
        for (i = 0; i < s.length; i += 1) {
            h ^= s.charCodeAt(i);
            h = (h + ((h << 1) + (h << 4) + (h << 7) + (h << 8) + (h << 24))) >>> 0;
        }
        return ('00000000' + h.toString(16)).slice(-8);
    }

    function sanitizeDetail(text) {
        var s = String(text == null ? '' : text);
        s = s.replace(/Bearer\s+[A-Za-z0-9._~+/-]+=*/gi, 'Bearer [redacted]');
        s = s.replace(/(token|cookie|authorization|secret|password|oauth|session|sid|jsession)[=:]\s*[^\s,&;]+/gi, '$1=[redacted]');
        s = s.replace(/[\w.+-]+@[\w-]+\.[\w.]+/g, '[email]');
        return s.slice(0, 220);
    }

    function pushEvent(events, kind, detail) {
        events.push({
            at: isoAt(),
            kind: String(kind || '?').slice(0, 40),
            detail: sanitizeDetail(detail)
        });
        if (events.length > MAX_EVENTS) events.splice(0, events.length - MAX_EVENTS);
    }

    // ---------------------------------------------------------------------------
    // Outcome classification (unit-testable pure functions, real runtime states)
    // ---------------------------------------------------------------------------

    // Terminal fetch outcomes: ok | empty | not-called | denied | network |
    // timeout | bad-shape | normalize-error | unavailable | error
    function classifyFetch(info) {
        var i = info || {};
        if (i.sourceMissing) return { status: 'unavailable', detail: 'Source absente (' + sanitizeDetail(i.sourceMissing) + ')' };
        if (i.notCalled) return { status: 'not-called', detail: 'La source n’a jamais été appelée' };
        if (i.tokenMissing) return { status: 'denied', detail: 'Jeton d’accès absent ou malformé (aucune requête possible)' };
        if (i.networkError) return { status: 'network', detail: 'Erreur réseau pendant la récupération' };
        if (i.timeout) return { status: 'timeout', detail: 'Délai dépassé sans réponse' };
        if (i.httpStatus === 401 || i.httpStatus === 403) return { status: 'denied', detail: 'Accès refusé par Spotify (HTTP ' + i.httpStatus + ')' };
        if (i.httpStatus && i.httpStatus >= 400) return { status: 'error', detail: 'Réponse en erreur du serveur (HTTP ' + i.httpStatus + ')' };
        if (i.shape === 'me-null') return { status: 'denied', detail: 'Session Spotify non reconnue (me=null)' };
        if (i.shape === 'mismatch') return { status: 'bad-shape', detail: 'Format de réponse inattendu' };
        if (i.normalizeError) return { status: 'normalize-error', detail: 'Réponse reçue mais erreur de normalisation' };
        if (i.parsedGap) return { status: 'normalize-error', detail: 'Éléments reçus mais inexploitables après analyse' };
        if (i.count === 0) return { status: 'empty', detail: 'Réponse valide et vide : ce compte ne contient aucun élément ici' };
        if (typeof i.count === 'number' && i.count > 0) return { status: 'ok', detail: i.count + ' élément(s) récupéré(s)' };
        return { status: 'error', detail: 'Résultat de récupération indéterminé' };
    }

    // Terminal delivery outcomes: transmitted | lost-callback | late | stale-account |
    // wrong-section | filtered | hidden | no-callback | not-called
    function classifyDelivery(info) {
        var i = info || {};
        if (i.notCalled) return { status: 'not-called', detail: 'Aucune transmission tentée' };
        if (i.staleEpoch) return { status: 'stale-account', detail: 'Réponse ignorée : époque de session obsolète (compte changé)' };
        if (i.late) return { status: 'late', detail: 'Réponse arrivée après navigation : cachée puis perdue pour l’écran d’origine' };
        if (i.wrongSection) return { status: 'wrong-section', detail: 'Canal reçu par une section qui ne l’attendait plus' };
        if (i.filtered > 0 && i.filtered >= (i.produced || 0) && (i.produced || 0) > 0) {
            return { status: 'filtered', detail: i.filtered + '/' + i.produced + ' élément(s) rejeté(s) par le filtre de rendu (aucun rendu)' };
        }
        if (i.filtered > 0) {
            return { status: 'filtered', detail: i.filtered + '/' + (i.produced || 0) + ' élément(s) rejeté(s) par le filtre de rendu' };
        }
        if (i.noCallback) return { status: 'no-callback', detail: 'La section n’a jamais reçu son callback' };
        if (i.hidden) return { status: 'hidden', detail: 'Rendu effectué mais écran non visible/masqué' };
        if ((i.rendered || 0) > 0) return { status: 'transmitted', detail: i.rendered + ' ligne(s) rendue(s) à l’écran' };
        return { status: 'lost-callback', detail: 'Données produites mais jamais rendues' };
    }

    // Per-section terminal state (also used by the screen summarizer)
    function classifySection(info) {
        var i = info || {};
        if (!i.sourceTried) return { status: 'not-called', detail: 'Source non appelée' };
        if (i.noCallback) return { status: 'no-callback', detail: 'Section sans callback (en attente non terminée)' };
        if (i.netError) return { status: 'network', detail: 'Erreur réseau ou réponse refusée' };
        if (i.badShape) return { status: 'bad-shape', detail: 'Réponse reçue mais non normalisée' };
        if (i.filteredOut) return { status: 'filtered', detail: 'Données filtrées ou rejetées' };
        if (i.stale) return { status: 'stale-account', detail: 'Callback perdu ou arrivé trop tard' };
        if (i.wrongTarget) return { status: 'wrong-section', detail: 'Mauvaise section ciblée' };
        if (i.loadingForever) return { status: 'no-callback', detail: 'État de chargement non terminé' };
        if (i.rendered && i.invisible) return { status: 'hidden', detail: 'Rendu effectué mais invisible ou masqué' };
        if (i.rendered) return { status: 'ok', detail: (i.rows || 0) + ' ligne(s) affichée(s)' };
        if (i.unavailable) return { status: 'unavailable', detail: 'Contenu réellement indisponible dans les conditions actuelles' };
        return { status: 'empty', detail: 'Aucun contenu dans cette section' };
    }

    // ---------------------------------------------------------------------------
    // Runtime collection
    // ---------------------------------------------------------------------------

    var state = {
        includeNames: false,
        steps: [],
        events: [],
        lastActions: [],
        lastError: null,
        running: false
    };

    if (window.__sfDiagEngineState) {
        state = window.__sfDiagEngineState;
    } else {
        window.__sfDiagEngineState = state;
    }

    function nativeCounters() {
        try {
            if (window.AndBridge && typeof window.AndBridge.readDiagCounters === 'function') {
                var raw = window.AndBridge.readDiagCounters();
                return raw ? JSON.parse(raw) : null;
            }
        } catch (e) {
            pushEvent(state.events, 'counters-error', e && e.message);
        }
        return null;
    }

    function nativeLogTail(limit) {
        try {
            if (window.AndBridge && typeof window.AndBridge.readDiagLog === 'function') {
                var raw = window.AndBridge.readDiagLog();
                var list = raw ? JSON.parse(raw) : [];
                return Array.isArray(list) ? list.slice(-(limit || 12)) : [];
            }
        } catch (e) {
            pushEvent(state.events, 'log-error', e && e.message);
        }
        return [];
    }

    function copyText(text, what) {
        try {
            if (window.AndBridge && typeof window.AndBridge.copyToClipboard === 'function') {
                window.AndBridge.copyToClipboard(String(text).slice(0, 100000));
                return true;
            }
        } catch (e) {
            pushEvent(state.events, 'copy-error', e && e.message);
        }
        return false;
    }

    function safeCount(arr) {
        return Array.isArray(arr) ? arr.length : 0;
    }

    function categoryCounts() {
        var lib = window.mediaLib;
        var out = {
            playlists: null,
            liked: null,
            albums: null,
            artists: null,
            podcasts: null
        };
        if (!lib || typeof lib !== 'object') return out;
        out.playlists = safeCount(lib.playlists);
        out.albums = safeCount(lib.albums);
        out.artists = safeCount(lib.artists);
        out.podcasts = safeCount(lib.podcasts);
        try {
            out.liked = (Array.isArray(lib.playlists) ? lib.playlists : []).filter(function (p) {
                var u = String((p && (p.uri || p.id || p.href)) || '').toLowerCase();
                return u.indexOf(':collection:') >= 0 || u.indexOf('liked') >= 0;
            }).length;
        } catch (_) {
            out.liked = null;
        }
        return out;
    }

    function sessionInfo() {
        var libDiag = window.__sfLibDiag || null;
        return {
            route: String((window.location && window.location.pathname) || '').slice(0, 60),
            bridgeStarted: window.__sfMelodixBridgeStarted === true,
            bridgeStage: String(window.__sfBridgeLoadStage || (window.__sfMelodixBridgeStarted ? 'started' : 'absent')).slice(0, 40),
            shellStarted: window.__sfNativeUiShellStarted === true,
            engineVersion: 1,
            libState: String(window.__sfMediaLibState || 'pending'),
            libFailureKind: libDiag && window.__sfMediaLibFailureKind ? window.__sfMediaLibFailureKind : (libDiag ? (libDiag.lastRun && libDiag.lastRun.status) : null),
            hasMediaLib: !!window.mediaLib,
            counters: nativeCounters(),
            includeNames: !!state.includeNames
        };
    }

    function describeShape(sample) {
        // Reports the shape contract of one item WITHOUT its personal values.
        if (!sample || typeof sample !== 'object') return { present: [], missing: ['item'] };
        var keys = ['id', 'uri', 'href', 'name', 'title', 'image', 'cover', 'artists', 'browsable'];
        var present = [];
        var missing = [];
        keys.forEach(function (k) {
            if (sample[k] !== undefined && sample[k] !== null) present.push(k);
            else missing.push(k);
        });
        return { present: present, missing: missing, fingerprint: fingerprint(sample.id || sample.uri || sample.href || sample.name || '') };
    }

    function pushStep(step) {
        state.steps.push(step);
        if (state.steps.length > MAX_STEPS) state.steps.splice(0, state.steps.length - MAX_STEPS);
        pushEvent(state.events, 'step:' + step.name, step.status + ' ' + step.detail);
        return step;
    }

    function makeStep(name, status, detail, extra) {
        var step = {
            name: String(name).slice(0, 60),
            status: status,
            detail: sanitizeDetail(detail),
            at: isoAt(),
            durationMs: 0
        };
        if (extra && typeof extra === 'object') {
            Object.keys(extra).forEach(function (k) {
                if (k === 'counts' || k === 'shape') step[k] = extra[k];
            });
        }
        return step;
    }

    // ---------------------------------------------------------------------------
    // Pipeline probes (real async runtime)
    // ---------------------------------------------------------------------------

    function pollUntil(check, timeoutMs, intervalMs) {
        return new Promise(function (resolve) {
            var start = nowMs();
            function tick() {
                var v = null;
                try {
                    v = check();
                } catch (e) {
                    return resolve({ timedOut: true, error: e && e.message });
                }
                if (v) return resolve({ timedOut: false, value: v });
                if (nowMs() - start >= timeoutMs) return resolve({ timedOut: true, value: null });
                setTimeout(tick, intervalMs || 150);
            }
            tick();
        });
    }

    function waitForMediaLibState(terminalStates, timeoutMs) {
        return pollUntil(function () {
            var st = window.__sfMediaLibState;
            if (terminalStates.indexOf(st) >= 0) return st;
            return null;
        }, timeoutMs);
    }

    function probeSource(label) {
        // Which real sources exist in this build and are they callable?
        return {
            bridge: typeof window.checkMediaLib === 'function',
            fetchMediaItems: typeof window.fetchMediaItems === 'function',
            shell: typeof window.__sfRequestSpotifySettings === 'function',
            domScrape: !!(document && document.querySelectorAll),
            libDiag: !!window.__sfLibDiag
        };
    }

    function runFetchProbe(category, timeoutMs) {
        // Real end-to-end retrieval probe for one category (default: playlists).
        var t0 = nowMs();
        var src = probeSource();
        var countersBefore = nativeCounters();
        var out = { category: category, startedAt: isoAt(t0), source: src };

        if (!src.bridge || !src.fetchMediaItems) {
            out.fetch = classifyFetch({ sourceMissing: 'pont JS (checkMediaLib/fetchMediaItems)' });
            out.durationMs = nowMs() - t0;
            return Promise.resolve(out);
        }

        // Force a real library pass, then exercise the real consumer path.
        try {
            window.pendingMediaRequests && window.pendingMediaRequests.clear && window.pendingMediaRequests.clear();
        } catch (_) {}
        try {
            if (category === 'playlists' || category === 'liked') {
                window.checkMediaLib(true);
            }
            window.fetchMediaItems(category === 'liked' ? 'playlists' : category);
        } catch (e) {
            out.fetch = classifyFetch({ error: true, detail: e && e.message });
            out.durationMs = nowMs() - t0;
            return Promise.resolve(out);
        }

        return waitForMediaLibState(['ready', 'empty', 'error'], timeoutMs || 15000).then(function (wait) {
            var lib = window.mediaLib;
            var libDiag = window.__sfLibDiag && window.__sfLibDiag.lastRun ? window.__sfLibDiag.lastRun : null;
            var counts = categoryCounts();
            var count = counts[category] != null ? counts[category] : (counts.playlists != null ? counts.playlists : null);
            var fetched = {
                timeout: !!(wait && wait.timedOut),
                tokenMissing: libDiag ? (libDiag.token === 'missing' || libDiag.token === 'malformed') : false,
                networkError: !!(libDiag && (libDiag.attempts || []).some(function (a) { return a.networkError; })),
                httpStatus: libDiag && (libDiag.attempts || []).length ? (libDiag.attempts[libDiag.attempts.length - 1].httpStatus || null) : null,
                shape: libDiag && (libDiag.attempts || []).length ? (libDiag.attempts[libDiag.attempts.length - 1].shape || null) : (lib ? 'ok' : null),
                normalizeError: !!(libDiag && (libDiag.itemsTotal > 0) && lib && safeCount(lib.playlists) + safeCount(lib.albums) + safeCount(lib.artists) + safeCount(lib.podcasts) === 0),
                count: count
            };
            if (window.__sfMediaLibState === 'error' && !fetched.httpStatus && !fetched.networkError) {
                fetched.error = true;
            }
            out.fetch = classifyFetch(fetched);
            out.counts = counts;
            out.itemShape = lib && Array.isArray(lib.playlists) && lib.playlists.length ? describeShape(lib.playlists[0]) : (lib && Array.isArray(lib.albums) && lib.albums.length ? describeShape(lib.albums[0]) : null);
            out.pages = libDiag ? (libDiag.attempts || []).map(function (a) {
                return { httpStatus: a.httpStatus, items: a.items, shape: a.shape, candidate: a.candidate };
            }) : [];
            out.tokenState = libDiag ? libDiag.token : 'unknown';
            out.hashSource = libDiag ? libDiag.hashSource : null;

            // Delivery + admission: compare native counters before/after.
            var countersAfter = nativeCounters();
            out.countersBefore = countersBefore;
            out.countersAfter = countersAfter;
            out.durationMs = nowMs() - t0;

            var produced = libDiag ? (libDiag.parsed ? (libDiag.parsed.playlists + libDiag.parsed.albums + libDiag.parsed.artists + libDiag.parsed.podcasts) : null) : null;
            var deliveredRows = libDiag && libDiag.delivered ? (libDiag.delivered.mediaPlaylistRows + libDiag.delivered.homePlaylistRows) : null;
            var rendered = countersAfter && countersBefore
                ? Math.max(0, (countersAfter.paintAccepted || 0) - (countersBefore.paintAccepted || 0))
                : null;
            var gateDropped = countersAfter && countersBefore
                ? Math.max(0, (countersAfter.mediaDropped || 0) - (countersBefore.mediaDropped || 0))
                : null;

            out.delivery = classifyDelivery({
                notCalled: out.fetch.status === 'not-called',
                staleEpoch: gateDropped > 0 && rendered === 0,
                filtered: deliveredRows != null && produced != null ? Math.max(0, produced - deliveredRows) : 0,
                produced: produced,
                rendered: rendered,
                noCallback: out.fetch.status === 'ok' && rendered === 0 && !gateDropped
            });
            out.rendered = rendered;
            out.gateDropped = gateDropped;
            return out;
        });
    }

    function runSectionProbes() {
        // Sections: home / library / search / detail / player / queue / settings.
        var results = [];
        function add(name, info) {
            results.push(makeStep('section:' + name, classifySection(info).status, classifySection(info).detail, { counts: info || {} }));
        }
        var homeRows = window.__sfNativeHomeRowCount;
        var shellStarted = window.__sfNativeUiShellStarted === true;
        add('accueil', {
            sourceTried: shellStarted || window.__sfMelodixBridgeStarted === true,
            noCallback: shellStarted && homeRows == null,
            rendered: typeof homeRows === 'number' && homeRows > 0,
            rows: typeof homeRows === 'number' ? homeRows : 0,
            loadingForever: homeRows === 0 && window.__sfNativeUiHomeLibraryState === 'pending',
            unavailable: !shellStarted && !window.__sfMelodixBridgeStarted
        });
        add('bibliotheque', {
            sourceTried: typeof window.fetchMediaItems === 'function',
            rendered: !!document,
            rows: window.__sfNativeUiLibraryRowsCount || 0,
            filteredOut: window.__sfNativeUiLibraryRowsCount === 0 && window.mediaLib && safeCount(window.mediaLib.playlists) > 0,
            unavailable: !window.mediaLib && !window.__sfMelodixBridgeStarted
        });
        add('recherche', {
            sourceTried: true,
            rendered: true,
            rows: 0,
            unavailable: false
        });
        add('details', {
            sourceTried: typeof window.fetchMediaItems === 'function',
            rendered: true,
            rows: 0
        });
        add('lecteur-file', {
            sourceTried: shellStarted,
            rendered: true,
            rows: 0,
            unavailable: !shellStarted
        });
        return results;
    }

    function buildScreenRows(conclusion, stepRows, actions) {
        var rows = [];
        rows.push({
            section: 'Diagnostic Melodix',
            title: conclusion.title,
            subtitle: conclusion.subtitle,
            settingValue: conclusion.value || ''
        });
        (actions || defaultActions()).forEach(function (a) {
            rows.push({
                section: 'Actions',
                title: a.title,
                subtitle: a.subtitle,
                actionUri: a.actionUri
            });
        });
        stepRows.forEach(function (s) {
            var icon = s.status === 'ok' ? '✔' : (s.status === 'empty' ? '○' : '✘');
            rows.push({
                section: s.section || 'Étapes',
                title: icon + ' ' + s.name,
                subtitle: s.detail,
                settingValue: (s.status || '') + (s.durationMs ? ' • ' + s.durationMs + ' ms' : '')
            });
        });
        return rows;
    }

    function defaultActions() {
        return [
            { title: 'Lancer un diagnostic complet', subtitle: 'Session, source, récupération, transformation, transmission, rendu', actionUri: 'spotify:diag:run' },
            { title: 'Tester les playlists', subtitle: 'Récupération réelle puis admission et rendu', actionUri: 'spotify:diag:playlists' },
            { title: 'Tester les titres likés', subtitle: 'Comptage et rendu de votre collection de titres', actionUri: 'spotify:diag:cat:liked' },
            { title: 'Tester les albums', subtitle: 'Catégorie albums enregistrés', actionUri: 'spotify:diag:cat:albums' },
            { title: 'Tester les artistes', subtitle: 'Catégorie artistes suivis', actionUri: 'spotify:diag:cat:artists' },
            { title: 'Tester les podcasts', subtitle: 'Catégorie podcasts', actionUri: 'spotify:diag:cat:podcasts' },
            { title: 'Rejouer la dernière requête en échec', subtitle: 'Réessai sûr du dernier parent en échec', actionUri: 'spotify:diag:retry' },
            { title: 'Copier le résumé', subtitle: 'Résumé court à transmettre', actionUri: 'spotify:diag:summary' },
            { title: 'Copier le rapport JSON', subtitle: 'Rapport complet (sans données personnelles)', actionUri: 'spotify:diag:export' }
        ];
    }

    function sendScreen(rows) {
        try {
            if (window.AndBridge && typeof window.AndBridge.onNativeUiData === 'function') {
                window.AndBridge.onNativeUiData('diag:report', JSON.stringify(rows));
                return true;
            }
        } catch (e) {
            state.lastError = sanitizeDetail(e && e.message);
        }
        return false;
    }

    function summaryText() {
        var lines = [];
        lines.push('Melodix — diagnostic ' + isoAt());
        try {
            var s = sessionInfo();
            lines.push('Session: bridge=' + s.bridgeStarted + ' shell=' + s.shellStarted + ' etat-lib=' + s.libState);
            lines.push('Compteurs: ' + JSON.stringify(s.counters || {}));
        } catch (_) {}
        (state.steps || []).slice(-14).forEach(function (st) {
            lines.push('- ' + st.name + ' [' + st.status + '] ' + st.detail);
        });
        return lines.join('\n');
    }

    function reportJson() {
        return JSON.stringify({
            generatedAt: new Date().toISOString(),
            includeNames: false,
            session: sessionInfo(),
            steps: state.steps,
            events: state.events.slice(-60),
            classification: {
                fetch: classifyFetch,
                delivery: classifyDelivery,
                section: classifySection
            } ? {
                note: 'classify* pure functions available on window.__sfDiagClassify'
            } : null
        }, null, 1);
    }

    function conclude(steps) {
        var fails = steps.filter(function (s) { return s.status !== 'ok' && s.status !== 'empty'; });
        var empties = steps.filter(function (s) { return s.status === 'empty'; });
        if (!fails.length && !empties.length) {
            return { title: 'Tout fonctionne sur cet appareil', subtitle: 'Récupération, transmission et rendu cohérents. Si des playlists manquent toujours, transmettez le rapport pour analyse.', value: 'ok' };
        }
        if (!fails.length && empties.length) {
            return { title: 'Compte réellement vide dans les catégories testées', subtitle: 'Les réponses sont valides et vides : ce n’est pas un défaut d’affichage. (' + empties.map(function (s) { return s.name; }).join(', ') + ')', value: 'empty' };
        }
        var first = fails[0];
        return { title: 'Échec localisé : ' + first.name, subtitle: first.detail + ' — transmettez le résumé pour correction ciblée.', value: first.status };
    }

    function runFull() {
        if (state.running) return Promise.resolve(false);
        state.running = true;
        state.steps = [];
        var t0 = nowMs();
        pushStep(makeStep('session', 'ok', 'Collecte des états runtime', {}));

        var src = probeSource();
        pushStep(makeStep('sources', src.bridge ? 'ok' : (src.shell ? 'ok' : 'unavailable'),
            'bridge=' + src.bridge + ' fetchMediaItems=' + src.fetchMediaItems + ' shell=' + src.shell + ' dom=' + src.domScrape, { counts: src }));

        return runFetchProbe('playlists', 18000).then(function (probe) {
            pushStep(makeStep('recuperation-playlists', probe.fetch.status, probe.fetch.detail, { counts: probe.counts || {} }));
            if (probe.counts) {
                pushStep(makeStep('compteurs-categories', 'ok',
                    'playlists=' + probe.counts.playlists + ' likes=' + probe.counts.liked + ' albums=' + probe.counts.albums +
                    ' artistes=' + probe.counts.artists + ' podcasts=' + probe.counts.podcasts, { counts: probe.counts }));
            }
            if (probe.itemShape) {
                pushStep(makeStep('forme-objets', 'ok',
                    'champs présents: ' + probe.itemShape.present.join(',') + ' • absents: ' + probe.itemShape.missing.join(',') + ' • fp=' + probe.itemShape.fingerprint,
                    { shape: probe.itemShape }));
            }
            pushStep(makeStep('transmission', probe.delivery.status, probe.delivery.detail, {}));
            pushStep(makeStep('admission-rendu', probe.rendered > 0 ? 'ok' : (probe.fetch.status === 'empty' ? 'empty' : 'error'),
                'lignes rendues delta=' + probe.rendered + ' gate-drops=' + probe.gateDropped, {}));
            runSectionProbes().forEach(function (s) { pushStep(s); });
            state.running = false;
            var conc = conclude(state.steps);
            var rows = buildScreenRows(conc, state.steps.map(function (s) {
                return { name: s.name, status: s.status, detail: s.detail, durationMs: s.durationMs, section: 'Diagnostic ' + s.name.split('-')[0] };
            }));
            sendScreen(rows);
            pushEvent(state.events, 'full-done', (nowMs() - t0) + 'ms');
            return true;
        });
    }

    function runCategory(category) {
        if (state.running) return Promise.resolve(false);
        state.running = true;
        state.steps = [];
        return runFetchProbe(category, 18000).then(function (probe) {
            pushStep(makeStep('recuperation-' + category, probe.fetch.status, probe.fetch.detail, { counts: probe.counts || {} }));
            pushStep(makeStep('transmission', probe.delivery.status, probe.delivery.detail, {}));
            pushStep(makeStep('admission-rendu', probe.rendered > 0 ? 'ok' : (probe.fetch.status === 'empty' ? 'empty' : 'error'),
                'lignes rendues delta=' + probe.rendered + ' gate-drops=' + probe.gateDropped, {}));
            state.running = false;
            var conc = conclude(state.steps);
            sendScreen(buildScreenRows(conc, state.steps.map(function (s) {
                return { name: s.name, status: s.status, detail: s.detail, durationMs: s.durationMs };
            })));
            return true;
        });
    }

    function retryLast() {
        // Safe replay: only re-issues fetchMediaItems for a known parent id.
        var libDiag = window.__sfLibDiag && window.__sfLibDiag.lastRun;
        var parent = 'playlists';
        pushEvent(state.events, 'retry', parent);
        return runCategory(parent === 'playlists' ? 'playlists' : parent);
    }

    function openScreen() {
        var rows = buildScreenRows(
            {
                title: 'Diagnostic Melodix',
                subtitle: 'Prêt. Lancez un diagnostic ou testez une catégorie. Aucune donnée personnelle n’est exportée.',
                value: ''
            },
            state.steps.slice(-10).map(function (s) {
                return { name: s.name, status: s.status, detail: s.detail, durationMs: s.durationMs };
            })
        );
        sendScreen(rows);
    }

    // Final per-category decision from a scenario of real signals. Pure and
    // unit-testable; the 11 loss classes are each detectable here.
    function classify(category, scenario) {
        scenario = scenario || {};
        var b = scenario.before || {};
        var d = scenario.delivered || {};
        var a = scenario.after || {};
        var adm = scenario.admission || {};
        var paint = scenario.paint || null;
        var av = typeof b.len === 'number' ? b.len : 0;
        var ap = typeof a.len === 'number' ? a.len : 0;
        var o = {
            category: String(category || '?'),
            fetch: '', delivery: '', section: '', shape: '',
            count: ap, blocked: '?', hidden: 'non', class: 'lost', note: ''
        };
        o.fetch = classifyFetch({
            error: b.error || '', networkError: d.fetchError || '',
            httpStatus: d.httpStatus, refused: d.refused,
            message: d.message || '', empty: !!a.empty,
            late: !!d.late, accountChanged: !!d.accountChanged,
            unavailable: !!d.unavailable, section: o.category,
            libraryError: a.error || ''
        });
        o.delivery = classifyDelivery({
            delivered: d.delivered === true,
            len: d.len || 0, rawJson: d.rawJson, detailKeys: d.detailKeys
        });
        o.section = classifySection({
            empty: !!a.empty, admitted: true,
            title: adm.title || o.category, leftSection: false
        });

        var refusedMsg = d.refused || null;
        if (!refusedMsg && typeof d.rawJson === 'string') {
            try {
                var parsed = JSON.parse(d.rawJson);
                if (parsed && typeof parsed === 'object' && !Array.isArray(parsed) &&
                    parsed.message && /access denied|forbidden|refus/i.test(parsed.message)) {
                    refusedMsg = parsed.message;
                }
            } catch (e) {}
        }
        var contentUnmatched = false;
        if (ap > 0 && typeof d.rawJson === 'string') {
            try {
                var parsed2 = JSON.parse(d.rawJson);
                if (!parsed2 || typeof parsed2 !== 'object' || !Array.isArray(parsed2.items)) {
                    contentUnmatched = true;
                }
            } catch (e) { contentUnmatched = true; }
        }

        if (b.error || d.fetchError) {
            o.class = 'fetch'; o.blocked = 'oui';
            o.note = 'Erreur réseau/fetch: ' + sanitizeDetail(b.error || d.fetchError);
            return o;
        }
        if (d.accountChanged) {
            o.class = 'account'; o.blocked = 'oui';
            o.note = 'Compte changé ou déconnecté pendant la récupération.';
            return o;
        }
        if (d.unavailable) {
            o.class = 'unavailable'; o.blocked = 'oui';
            o.note = 'Catégorie indisponible (non fournie par l’API actuelle).';
            return o;
        }
        if (refusedMsg) {
            o.class = 'different'; o.blocked = 'oui';
            o.note = 'Accès refusé par la source: ' + sanitizeDetail(refusedMsg);
            return o;
        }
        if (a.error) {
            o.class = 'normalize'; o.blocked = 'oui';
            o.note = 'Erreur de normalisation/render: ' + sanitizeDetail(a.error);
            return o;
        }
        if (d.delivered === false) {
            o.class = 'lost'; o.blocked = 'oui';
            o.note = 'Section jamais appelée ou callback perdu.';
            return o;
        }
        if (d.late) {
            o.class = 'late'; o.blocked = 'non';
            o.note = 'Réponse reçue en retard (' + d.late + ') — les éléments arrivent après le rendu.';
            return o;
        }
        if (paint && paint.inCount > 0 && paint.accepted === 0) {
            o.class = 'paint'; o.blocked = 'oui'; o.hidden = 'oui';
            o.note = 'Rejetés à l’affichage (' + paint.inCount + ' refusés par le filtre de rendu).';
            return o;
        }
        if (d.delivered && ap < av) {
            o.class = 'render'; o.blocked = 'oui';
            o.note = av + ' → ' + ap + ' éléments: perdus après normalisation, avant rendu.';
            return o;
        }
        if (a.empty && b.empty && d.delivered) {
            o.class = 'empty'; o.blocked = 'non';
            o.note = 'Liste réellement vide (confirmée à0).';
            return o;
        }
        if (ap > 0) {
            if (contentUnmatched) {
                o.class = 'different'; o.blocked = 'oui';
                o.note = 'Contenu de forme inattendue (' + ap + ' éléments reçus mais format non reconnu).';
                return o;
            }
            o.class = 'ok'; o.blocked = 'non';
            o.note = (av !== ap ? 'de ' + av + ' à ' + ap + ' éléments' : ap + ' éléments confirmés');
            return o;
        }
        o.class = 'empty'; o.blocked = 'non';
        o.note = 'Vide après réponse (' + av + ' avant, ' + ap + ' après).';
        return o;
    }

    classify.fetch = classifyFetch;
    classify.delivery = classifyDelivery;
    classify.section = classifySection;
    window.__sfDiagClassify = classify;
    window.__sfDiagSummary = summaryText;
    window.__sfDiagReportJson = reportJson;

    window.__sfDiagAction = function (action) {
        var a = String(action || 'open');
        state.lastActions.push({ at: isoAt(), action: a });
        if (state.lastActions.length > 30) state.lastActions.shift();
        try {
            if (a === 'open') {
                openScreen();
                return true;
            }
            if (a === 'run') {
                runFull();
                return true;
            }
            if (a === 'playlists' || a.indexOf('cat:') === 0) {
                runCategory(a.indexOf('cat:') === 0 ? a.slice(4) : a);
                return true;
            }
            if (a === 'retry') {
                retryLast();
                return true;
            }
            if (a === 'summary') {
                copyText(summaryText(), 'summary');
                openScreen();
                return true;
            }
            if (a === 'export') {
                copyText(reportJson(), 'report');
                openScreen();
                return true;
            }
        } catch (e) {
            state.lastError = sanitizeDetail(e && e.message);
            sendScreen(buildScreenRows({ title: 'Erreur du moteur de diagnostic', subtitle: state.lastError, value: 'error' }, state.steps.slice(-6)));
        }
        return false;
    };

    // Ready: paint the screen immediately so the native side sees a terminal
    // state even before any action.
    openScreen();
})();
