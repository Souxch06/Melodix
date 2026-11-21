(function(kind) {
    'use strict';
    // Read only a uniquely recognised panel already present in the page.
    // Never open a panel, issue a command, access session data or navigate.
    var selectors={
        queue:'[data-testid="queue-page"], [data-testid="queue-view"]',
        lyrics:'[data-testid="lyrics-lyricsContent"]',
        devices:'[data-testid="device-picker"], [data-testid="connect-device-list"]'
    };
    if(!Object.prototype.hasOwnProperty.call(selectors,kind))return JSON.stringify({ok:false,reason:'unsupported'});
    var roots=Array.from(document.querySelectorAll(selectors[kind])).filter(function(n){return n.isConnected;});
    if(roots.length!==1)return JSON.stringify({ok:false,reason:roots.length?'ambiguous':'absent'});
    var root=roots[0], lines=[];
    function text(n){return String(n&&n.textContent||'').replace(/\s+/g,' ').trim().slice(0,300);}
    if(kind==='lyrics'){
        Array.from(root.querySelectorAll('p, [data-testid="lyrics-line"]')).slice(0,100).forEach(function(n){var t=text(n);if(t)lines.push(t);});
    }else if(kind==='queue'){
        Array.from(root.querySelectorAll('[data-testid="queue-tracklist-row"]')).slice(0,60).forEach(function(n){
            var title=text(n.querySelector('[data-testid="track-title"], [data-testid="context-item-info-title"]'));
            var artist=text(n.querySelector('[data-testid="track-artist"], [data-testid="context-item-info-artist"]'));
            if(title)lines.push(title+(artist?' — '+artist:''));
        });
    }else{
        Array.from(root.querySelectorAll('[data-testid="device-list-item"]')).slice(0,30).forEach(function(n){
            var name=text(n.querySelector('[data-testid="device-name"]'));if(name)lines.push(name+(n.getAttribute('aria-selected')==='true'?' · Actif':''));
        });
    }
    if(!lines.length)return JSON.stringify({ok:false,reason:'unreadable'});
    return JSON.stringify({ok:true,body:lines.join('\n').slice(0,8000)});
})
