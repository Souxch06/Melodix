(function(kind, action, expectedState, expectedTrack, expectedTitle) {
    'use strict';
    // Passive inspection of controls already in the page. A tap can only click
    // a uniquely identified real control, after state/identity revalidation.
    var labels = {
        like: {
            off: /^(save to your library|add to (your )?(liked songs|library)|ajouter (à|aux) (la bibliothèque|titres likés)|enregistrer dans (votre |la )?bibliothèque|in (deine |der )?bibliothek (aufnehmen|hinzufügen)|añadir a (tu )?biblioteca|adicionar (à biblioteca|aos títulos curtidos))$/i,
            on: /^(remove from (your )?(library|liked songs)|retirer (de la bibliothèque|des titres likés)|supprimer de (votre |la )?bibliothèque|aus (deiner |der )?bibliothek entfernen|quitar de (tu )?biblioteca|remover (da biblioteca|dos títulos curtidos))$/i
        },
        repeat: {
            // A label can safely distinguish off from enabled, but not list
            // from one-track unless the page supplies an explicit mixed state.
            off: /^(enable repeat|turn repeat on|activer la répétition|wiederholung aktivieren|activar repetición|ativar repetição)$/i,
            on: /^(disable repeat|turn repeat off|désactiver la répétition|wiederholung deaktivieren|desactivar repetición|desativar repetição)$/i
        },
        shuffle: {
            off: /^(enable shuffle|turn shuffle on|activate shuffle|activer (la lecture |le mode |l['’])?aléatoire|zufallswiedergabe aktivieren|activar (el modo |la reproducción )?aleatori[oa]|ativar (a reprodução )?aleatória)$/i,
            on: /^(disable shuffle|turn shuffle off|deactivate shuffle|désactiver (la lecture |le mode |l['’])?aléatoire|zufallswiedergabe deaktivieren|desactivar (el modo |la reproducción )?aleatori[oa]|desativar (a reprodução )?aleatória)$/i
        }
    };
    if (['like','shuffle','repeat'].indexOf(kind) < 0) return JSON.stringify({state:'unknown',reason:'control'});
    (function() {
        var word = /(titres likés|liked songs|liké|liked|favori|bibliothèque|library|biblioteca|bibliothek)/i, off = labels.like.off, on = labels.like.on;
        labels.like.off = {test: function(l) { return off.test(l) || (word.test(l) && /^(ajouter|add|enregistrer|save|añadir|adicionar|hinzufügen|zu)\b/i.test(l)); }};
        labels.like.on = {test: function(l) { return on.test(l) || (word.test(l) && /^(ajouté|retirer|supprimer|remove|enregistré|saved|added|quitar|remover|entfernen)/i.test(l)); }};
    })();
    // Spotify's "+" save button: generic "Ajouter..." label, state in aria-checked.
    function genericAdd(l) { return /^(ajouter|add|enregistrer|save)\b/i.test(l) && !/(titres likés|liked songs|bibliothèque|library|file d['’]attente|queue)/i.test(l); }
    var selector = kind === 'like' ?
        ':is([data-testid="now-playing-widget"], [data-testid="now-playing-widget-v2"]) button, [data-testid="now-playing-bar"] button, [data-testid="now-playing-view"] button, [data-testid="now-playing-panel"] button, :is([data-testid="now-playing-widget"], [data-testid="now-playing-widget-v2"]) [role="button"], [data-testid="now-playing-bar"] [role="button"], [data-testid="now-playing-view"] [role="button"], [data-testid="now-playing-panel"] [role="button"], :is([data-testid="now-playing-widget"], [data-testid="now-playing-widget-v2"]) [role="switch"], [data-testid="now-playing-bar"] [role="switch"], [data-testid="now-playing-view"] [role="switch"], [data-testid="now-playing-panel"] [role="switch"]' :
        kind === 'shuffle' ? 'button[data-testid*="shuffle" i], button[aria-label], [role="button"][aria-label], [role="switch"][aria-label]' :
        'button[data-testid="control-button-repeat"], [role="button"][data-testid="control-button-repeat"], button[aria-label], [role="button"][aria-label]';
    var nodes = Array.from(document.querySelectorAll(selector)).filter(function(b) {
        if (!b.isConnected) return false;
        var id=String(b.getAttribute('data-testid')||'').toLowerCase();
        var label=String(b.getAttribute('aria-label')||'').trim();
        if (kind === 'like') return /^(add-button|remove-button|add-to-library-button|remove-from-library-button)$/.test(id) || labels.like.off.test(label) || labels.like.on.test(label) || (b.hasAttribute('aria-checked') && genericAdd(label));
        if (kind === 'repeat') return id==='control-button-repeat' || labels.repeat.off.test(label) || labels.repeat.on.test(label);
        return /shuffle/.test(id) || labels.shuffle.off.test(label) || labels.shuffle.on.test(label);
    });
    var result={state:'unknown',track:'',title:'',reason:'control',sent:false};
    // Current player links only, including Spotify's unmarked track links.
    // Every track href must agree; a non-empty title must also agree. Never
    // take an identity from a playlist, search result or unrelated page node.
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
        return null; // album + title does not uniquely identify a track
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
    if (kind === 'like') {
        var anchors = Array.from(document.querySelectorAll(':is([data-testid="now-playing-widget"], [data-testid="now-playing-widget-v2"]) a[href], [data-testid="now-playing-bar"] a[href]'));
        var malformedIdentity = false, conflictIdentity = false;
        var identities = anchors.map(function(link) {
            var match = trackHref(String(link.getAttribute('href') || ''));
            if (!match && /^(context-item-link|nowplaying-track-link)$/i.test(String(link.getAttribute('data-testid') || '')) && (hasTrackHint(link.getAttribute('href')) || (!markedTrack(link) && !parentTrack(link)))) malformedIdentity = true;
            return match ? {track:match[1].toLowerCase()+':'+match[2],title:String(link.textContent || '').replace(/\s+/g, ' ').trim()} : null;
        }).filter(Boolean);
        markedTitleNodes().forEach(function(n) {
            var value=markedTrack(n);
            if (value === '!') { malformedIdentity = conflictIdentity = true; return; }
            if (value) identities.push({track:value, title:String(n.textContent || '').replace(/\s+/g, ' ').trim()});
        });
        var named = identities.filter(function(x) { return !!x.title; });
        if (!malformedIdentity && named.length && identities.every(function(x) { return x.track === named[0].track && (!x.title || x.title === named[0].title); })) {
            result.track=named[0].track; result.title=named[0].title;
        }
        // Spotify's newer bar carries no track id. The exact native title shown
        // as a leaf in the bar identifies the current track (add-only like).
        if (!result.track && !conflictIdentity && !identities.length && expectedTitle && !anchors.some(function(l) { return hasTrackHint(l.getAttribute('href')); }) && Array.from(document.querySelectorAll(':is([data-testid="now-playing-widget"], [data-testid="now-playing-widget-v2"]), [data-testid="now-playing-bar"]')).some(function(r) {
            return String(r.textContent || '').replace(/\s+/g, ' ').toLowerCase().indexOf(String(expectedTitle).replace(/\s+/g, ' ').trim().toLowerCase()) >= 0;
        })) { result.track='title:'+expectedTitle; result.title=expectedTitle; }
    }

    if (!nodes.length) {
        var hasBar = !!document.querySelector('[data-testid="now-playing-bar"], :is([data-testid="now-playing-widget"], [data-testid="now-playing-widget-v2"]), [data-testid="player-controls"]');
        // With the player bar present and no such control anywhere in the page,
        // say so ('absent'); without the bar the control may simply not be shown yet.
        result.reason = document.readyState === 'loading' ? 'page' : (kind === 'shuffle' && !hasBar ? 'bar' : hasBar ? 'absent' : 'control');
        return JSON.stringify(result);
    }
    if (nodes.length !== 1) {result.reason='ambiguous';return JSON.stringify(result);}
    var button=nodes[0];
    if (button.disabled || button.matches(':disabled') || button.closest('[aria-disabled="true"]')) {
        var description=String(button.getAttribute('aria-description')||'').trim();
        result.reason=kind==='shuffle' && /^(shuffle is not available (with|for) (this account|this playback)|l['’]aléatoire n['’]est pas disponible avec (ce compte|cette lecture))$/i.test(description)?'restriction':'disabled';
        return JSON.stringify(result);
    }
    if (kind === 'like' && /^(true|menu|dialog|listbox|tree|grid)$/i.test(String(button.getAttribute('aria-haspopup')||''))) {result.reason='menu';return JSON.stringify(result);}
    var raw=button.getAttribute('aria-checked');
    var pressed=button.getAttribute('aria-pressed');
    if (kind === 'like' && raw !== null && pressed !== null && raw !== pressed) {result.reason='conflict';return JSON.stringify(result);}
    if (raw === null) raw=pressed;
    var label=String(button.getAttribute('aria-label')||'').trim();
    if (raw === null) {
        raw=labels[kind].on.test(label) ? 'true' :
            labels[kind].off.test(label) ? 'false' : 'unknown';
    } else if (raw !== 'true' && raw !== 'false' && !(kind !== 'like' && raw === 'mixed')) raw='unknown';
    if (kind === 'like') {
        // A false ARIA value must never override a removal action. An
        // unlabeled generic add-button can be a playlist menu, not a like.
        var testId=String(button.getAttribute('data-testid')||'').toLowerCase();
        var removeId=/^(remove-button|remove-from-library-button)$/.test(testId);
        var offLabel=labels.like.off.test(label), onLabel=labels.like.on.test(label);
        // Once liked, Spotify relabels the checked button to a generic "Ajouter à une playlist" (phone 1022229).
        if (!offLabel && !onLabel && raw==='true' && button.getAttribute('aria-checked')==='true' && genericAdd(label)) onLabel=true;
        if ((raw==='false' && (onLabel||removeId)) || (raw==='true' && offLabel)) {
            result.reason='conflict';return JSON.stringify(result);
        }
        if (!offLabel && !onLabel) {result.reason='unverified';return JSON.stringify(result);}
        // Display-only reads need no identity; a click (invoke) still does.
        if ((!result.track || !result.title) && action !== 'query') {result.reason='identity';return JSON.stringify(result);}
    }
    if (raw === 'unknown') {result.reason='state';return JSON.stringify(result);}
    if (typeof button.click !== 'function') {result.reason='command';return JSON.stringify(result);}
    result.state=raw;result.reason='';
    if (action === 'query') return JSON.stringify(result);
    if (action !== 'invoke' || raw !== expectedState ||
        (kind === 'like' && (raw !== 'false' || result.track !== expectedTrack || result.title !== expectedTitle))) return JSON.stringify({sent:false});
    try {
        // Use the exact revalidated button; never call a legacy helper that
        // schedules playback-related work. Never click an already-liked item.
        button.click();
        return JSON.stringify({sent:true});
    } catch (_) { return JSON.stringify({sent:false}); }
})
