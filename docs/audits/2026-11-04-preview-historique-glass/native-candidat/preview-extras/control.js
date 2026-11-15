(function(kind, action, expectedState, expectedTrack, expectedTitle) {
    'use strict';
    // Only inspect the same controls used by the existing protected commands.
    // No network access, credentials, navigation or playback clock.
    var selectors = {
        like:'div[data-testid="now-playing-widget"]>div:last-child>button',
        shuffle:'button[data-testid="control-button-shuffle"]',
        repeat:'button[data-testid="control-button-repeat"]'
    };
    var functions = {like:'actAddToFav', shuffle:'actShuffle', repeat:'actRepeat'};
    if (!Object.prototype.hasOwnProperty.call(selectors, kind)) return JSON.stringify({state:'unknown'});
    var button = document.querySelector(selectors[kind]);
    var raw = button && (button.getAttribute('aria-checked') || (kind === 'shuffle' ? button.getAttribute('aria-pressed') : null));
    var enabled = !!(button && button.isConnected && !button.disabled && button.getAttribute('aria-disabled') !== 'true' && typeof window[functions[kind]] === 'function');
    var valid = raw === 'true' || raw === 'false' || (kind !== 'like' && raw === 'mixed');
    var title = '', track = '';
    if (kind === 'like') {
        // The legacy selector is positional. Require a recognizable save control
        // as well, so a different checked button can never be toggled as a like.
        var testid = button ? String(button.getAttribute('data-testid') || '').toLowerCase() : '';
        var label = button ? String(button.getAttribute('aria-label') || '').trim().toLowerCase() : '';
        var saveControl = /^(add-button|remove-button|add-to-library-button|remove-from-library-button)$/.test(testid) ||
            /^(save to your library|remove from your library|add to liked songs|remove from liked songs|ajouter (à|aux) (la bibliothèque|titres likés)|retirer (de la bibliothèque|des titres likés))$/.test(label);
        enabled = enabled && saveControl;
        var bar = document.querySelector('[data-testid="now-playing-widget"], [data-testid="now-playing-bar"]');
        var link = bar && bar.querySelector('a[data-testid="context-item-link"], a[data-testid="nowplaying-track-link"]');
        title = link ? String(link.textContent || '').trim() : '';
        var href = link ? String(link.getAttribute('href') || '') : '';
        var match = /^\/(track|episode)\/([a-z0-9]+)(?:[?#].*)?$/i.exec(href);
        track = match ? match[1].toLowerCase()+':'+match[2] : '';
        enabled = enabled && !!track && !!title;
    }
    var state = enabled && valid ? raw : 'unknown';
    if (action === 'query') return JSON.stringify({state:state,track:track,title:title});
    if (action !== 'invoke' || state === 'unknown' || state !== expectedState ||
        (kind === 'like' && (track !== expectedTrack || title !== expectedTitle)))
        return JSON.stringify({sent:false});
    try { window[functions[kind]](); return JSON.stringify({sent:true}); }
    catch (_) { return JSON.stringify({sent:false}); }
})
