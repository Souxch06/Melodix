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
        var word = /(titres likés|liked songs|bibliothèque|library|biblioteca|bibliothek)/i, off = labels.like.off, on = labels.like.on;
        labels.like.off = {test: function(l) { return off.test(l) || (word.test(l) && /^(ajouter|add|enregistrer|save|añadir|adicionar|hinzufügen|zu)\b/i.test(l)); }};
        labels.like.on = {test: function(l) { return on.test(l) || (word.test(l) && /^(ajouté|retirer|supprimer|remove|enregistré|saved|added|quitar|remover|entfernen)/i.test(l)); }};
    })();
    // Spotify's "+" save button: generic "Ajouter..." label, state in aria-checked.
    function genericAdd(l) { return /^(ajouter|add|enregistrer|save)\b/i.test(l) && !/(titres likés|liked songs|bibliothèque|library|file d['’]attente|queue)/i.test(l); }
    var selector = kind === 'like' ?
        '[data-testid="now-playing-widget"] button, [data-testid="now-playing-bar"] button, [data-testid="now-playing-view"] button, [data-testid="now-playing-panel"] button, [data-testid="now-playing-widget"] [role="button"], [data-testid="now-playing-bar"] [role="button"], [data-testid="now-playing-view"] [role="button"], [data-testid="now-playing-panel"] [role="button"], [data-testid="now-playing-widget"] [role="switch"], [data-testid="now-playing-bar"] [role="switch"], [data-testid="now-playing-view"] [role="switch"], [data-testid="now-playing-panel"] [role="switch"]' :
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
        var m = /^(?:https:\/\/open\.spotify\.com)?\/(?:intl-[a-z]{2}(?:-[a-z]{2})?\/)?(track|episode)\/([a-z0-9]+)\/?(?:[?#].*)?$/i.exec(h);
        if (m) return m;
        var a = /^(?:https:\/\/open\.spotify\.com)?\/(?:intl-[a-z]{2}(?:-[a-z]{2})?\/)?album\/[a-z0-9]+\/?\?(?:[^#]*&)?highlight=spotify(?::|%3a)(track)(?::|%3a)([a-z0-9]+)(?:[&#].*)?$/i.exec(h);
        if (a) return [a[0], a[1], a[2]];
        // No track link at all: the album link plus the exact title is the identity.
        var al = /^(?:https:\/\/open\.spotify\.com)?\/(?:intl-[a-z]{2}(?:-[a-z]{2})?\/)?(album)\/([a-z0-9]+)\/?(?:[?#].*)?$/i.exec(h);
        return al ? [al[0], al[1], al[2]] : null;
    }
    if (kind === 'like') {
        var anchors = Array.from(document.querySelectorAll('[data-testid="now-playing-widget"] a[href], [data-testid="now-playing-bar"] a[href]'));
        var malformedIdentity = false;
        var identities = anchors.map(function(link) {
            var match = trackHref(String(link.getAttribute('href') || ''));
            if (!match && /^(context-item-link|nowplaying-track-link)$/i.test(String(link.getAttribute('data-testid') || ''))) malformedIdentity = true;
            return match ? {track:match[1].toLowerCase()+':'+match[2],title:String(link.textContent || '').replace(/\s+/g, ' ').trim()} : null;
        }).filter(Boolean);
        var named = identities.filter(function(x) { return !!x.title; });
        if (!malformedIdentity && named.length && identities.every(function(x) { return x.track === named[0].track && (!x.title || x.title === named[0].title); })) {
            result.track=named[0].track; result.title=named[0].title;
        }
    }

    if (!nodes.length) {
        var hasBar = !!document.querySelector('[data-testid="now-playing-bar"], [data-testid="now-playing-widget"], [data-testid="player-controls"]');
        // With the player bar present and no such control anywhere in the page,
        // say so ('absent'); without the bar the control may simply not be shown yet.
        result.reason = document.readyState === 'loading' ? 'page' : (kind === 'shuffle' && !hasBar ? 'bar' : hasBar ? 'absent' : 'control');
        return JSON.stringify(result);
    }
    if (nodes.length !== 1) {result.reason='ambiguous';return JSON.stringify(result);}
    var button=nodes[0];
    if (button.disabled || button.getAttribute('aria-disabled') === 'true') {
        var description=String(button.getAttribute('aria-description')||'').trim();
        result.reason=kind==='shuffle' && /^(shuffle is not available (with|for) (this account|this playback)|l['’]aléatoire n['’]est pas disponible avec (ce compte|cette lecture))$/i.test(description)?'restriction':'disabled';
        return JSON.stringify(result);
    }
    if (kind === 'like' && /^(true|menu|dialog)$/i.test(String(button.getAttribute('aria-haspopup')||''))) {result.reason='menu';return JSON.stringify(result);}
    var raw=button.getAttribute('aria-checked');
    if (raw === null) raw=button.getAttribute('aria-pressed');
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
        var addId=testId==='add-to-library-button';
        var offLabel=labels.like.off.test(label), onLabel=labels.like.on.test(label);
        var generic=genericAdd(label) && (raw==='true'||raw==='false');
        if (generic) offLabel=raw==='false', onLabel=raw==='true';
        if ((raw==='false' && (onLabel||removeId)) || (raw==='true' && offLabel)) {
            result.reason='conflict';return JSON.stringify(result);
        }
        if (raw==='false' && !offLabel && !addId) {result.reason='unverified';return JSON.stringify(result);}
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
