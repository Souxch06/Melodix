(function(kind, action, expectedState, expectedTrack, expectedTitle) {
    'use strict';
    // Passive inspection of controls already in the page. A tap can only click
    // a uniquely identified real control, after state/identity revalidation.
    var labels = {
        like: {
            off: /^(save to your library|add to (your )?(liked songs|library)|ajouter (à|aux) (la bibliothèque|titres likés)|enregistrer dans (votre |la )?bibliothèque|in (deine |der )?bibliothek (aufnehmen|hinzufügen)|añadir a (tu )?biblioteca|adicionar (à biblioteca|aos títulos curtidos))$/i,
            on: /^(remove from (your )?(library|liked songs)|retirer (de la bibliothèque|des titres likés)|supprimer de (votre |la )?bibliothèque|aus (deiner |der )?bibliothek entfernen|quitar de (tu )?biblioteca|remover (da biblioteca|dos títulos curtidos))$/i
        },
        shuffle: {
            off: /^(enable shuffle|turn shuffle on|activate shuffle|activer (la lecture )?aléatoire|zufallswiedergabe aktivieren|activar (el modo |la reproducción )?aleatori[oa]|ativar (a reprodução )?aleatória)$/i,
            on: /^(disable shuffle|turn shuffle off|deactivate shuffle|désactiver (la lecture )?aléatoire|zufallswiedergabe deaktivieren|desactivar (el modo |la reproducción )?aleatori[oa]|desativar (a reprodução )?aleatória)$/i
        }
    };
    if (['like','shuffle','repeat'].indexOf(kind) < 0) return JSON.stringify({state:'unknown',reason:'control'});
    var selector = kind === 'like' ?
        '[data-testid="now-playing-widget"] button, [data-testid="now-playing-bar"] button' :
        kind === 'shuffle' ? 'button[data-testid*="shuffle" i], button[aria-label]' :
        'button[data-testid="control-button-repeat"]';
    var nodes = Array.from(document.querySelectorAll(selector)).filter(function(b) {
        if (!b.isConnected) return false;
        if (kind === 'repeat') return true;
        var id=String(b.getAttribute('data-testid')||'').toLowerCase();
        var label=String(b.getAttribute('aria-label')||'').trim();
        if (kind === 'like') return /^(add-button|remove-button|add-to-library-button|remove-from-library-button)$/.test(id) || labels.like.off.test(label) || labels.like.on.test(label);
        return /shuffle/.test(id) || labels.shuffle.off.test(label) || labels.shuffle.on.test(label);
    });
    var result={state:'unknown',track:'',title:'',reason:'control',sent:false};
    if (!nodes.length) {
        result.reason = document.readyState === 'loading' ? 'page' : 'control';
        return JSON.stringify(result);
    }
    if (nodes.length !== 1) {result.reason='ambiguous';return JSON.stringify(result);}
    var button=nodes[0];
    if (button.disabled || button.getAttribute('aria-disabled') === 'true') {result.reason='disabled';return JSON.stringify(result);}
    var raw=button.getAttribute('aria-checked');
    if (raw === null) raw=button.getAttribute('aria-pressed');
    var label=String(button.getAttribute('aria-label')||'').trim();
    if (raw === null) {
        raw=kind !== 'repeat' && labels[kind].on.test(label) ? 'true' :
            kind !== 'repeat' && labels[kind].off.test(label) ? 'false' : 'unknown';
    } else if (raw !== 'true' && raw !== 'false' && !(kind !== 'like' && raw === 'mixed')) raw='unknown';
    if (kind === 'like') {
        var bar=button.closest('[data-testid="now-playing-widget"], [data-testid="now-playing-bar"]');
        var link=bar && bar.querySelector('a[data-testid="context-item-link"], a[data-testid="nowplaying-track-link"]');
        result.title=link ? String(link.textContent||'').trim() : '';
        var href=link ? String(link.getAttribute('href')||'') : '';
        var match=/^\/(track|episode)\/([a-z0-9]+)(?:[?#].*)?$/i.exec(href);
        result.track=match ? match[1].toLowerCase()+':'+match[2] : '';
        if (!result.track || !result.title) {result.reason='identity';return JSON.stringify(result);}
    }
    if (raw === 'unknown') {result.reason='state';return JSON.stringify(result);}
    if (kind === 'repeat' && typeof window.actRepeat !== 'function') {result.reason='command';return JSON.stringify(result);}
    if (typeof button.click !== 'function') {result.reason='command';return JSON.stringify(result);}
    result.state=raw;result.reason='';
    if (action === 'query') return JSON.stringify(result);
    if (action !== 'invoke' || raw !== expectedState ||
        (kind === 'like' && (result.track !== expectedTrack || result.title !== expectedTitle))) return JSON.stringify({sent:false});
    try {
        // Keep legacy commands when their exact target is known. Other recognized
        // controls use the same explicit button click a user could make in Spotify.
        var legacyLike=document.querySelector('div[data-testid="now-playing-widget"]>div:last-child>button');
        if (kind === 'like' && legacyLike === button && typeof window.actAddToFav === 'function') window.actAddToFav();
        else if (kind === 'shuffle' && button.matches('button[data-testid="control-button-shuffle"]') && typeof window.actShuffle === 'function') window.actShuffle();
        else if (kind === 'repeat') window.actRepeat();
        else button.click();
        return JSON.stringify({sent:true});
    } catch (_) { return JSON.stringify({sent:false}); }
})
