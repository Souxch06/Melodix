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
    var selector = kind === 'like' ?
        '[data-testid="now-playing-widget"] button, [data-testid="now-playing-bar"] button, [data-testid="now-playing-view"] button, [data-testid="now-playing-panel"] button, [data-testid="now-playing-view"] [role="button"], [data-testid="now-playing-bar"] [role="button"]' :
        kind === 'shuffle' ? 'button[data-testid*="shuffle" i], button[aria-label], [role="button"][aria-label], [role="switch"][aria-label]' :
        'button[data-testid="control-button-repeat"], [role="button"][data-testid="control-button-repeat"], button[aria-label], [role="button"][aria-label]';
    var nodes = Array.from(document.querySelectorAll(selector)).filter(function(b) {
        if (!b.isConnected) return false;
        var id=String(b.getAttribute('data-testid')||'').toLowerCase();
        var label=String(b.getAttribute('aria-label')||'').trim();
        if (kind === 'like') return /^(add-button|remove-button|add-to-library-button|remove-from-library-button)$/.test(id) || labels.like.off.test(label) || labels.like.on.test(label);
        if (kind === 'repeat') return id==='control-button-repeat' || labels.repeat.off.test(label) || labels.repeat.on.test(label);
        return /shuffle/.test(id) || labels.shuffle.off.test(label) || labels.shuffle.on.test(label);
    });
    var result={state:'unknown',track:'',title:'',reason:'control',sent:false};
    if (!nodes.length) {
        result.reason = document.readyState === 'loading' ? 'page' : (kind === 'shuffle' && !document.querySelector('[data-testid="now-playing-bar"], [data-testid="now-playing-widget"], [data-testid="player-controls"]') ? 'bar' : 'control');
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
        if ((raw==='false' && (onLabel||removeId)) || (raw==='true' && offLabel)) {
            result.reason='conflict';return JSON.stringify(result);
        }
        if (raw==='false' && !offLabel && !addId) {result.reason='unverified';return JSON.stringify(result);}
        var bar=button.closest('[data-testid="now-playing-widget"], [data-testid="now-playing-bar"]');
        if (!bar) bar=document.querySelector('[data-testid="now-playing-widget"], [data-testid="now-playing-bar"]');
        var link=bar && bar.querySelector('a[data-testid="context-item-link"], a[data-testid="nowplaying-track-link"]');
        result.title=link ? String(link.textContent||'').trim() : '';
        var href=link ? String(link.getAttribute('href')||'') : '';
        var match=/^\/(track|episode)\/([a-z0-9]+)(?:[?#].*)?$/i.exec(href);
        result.track=match ? match[1].toLowerCase()+':'+match[2] : '';
        if (!result.track || !result.title) {result.reason='identity';return JSON.stringify(result);}
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
