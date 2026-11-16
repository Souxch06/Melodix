(function(kind) {
    'use strict';
    // Observation only. Never open a panel, navigate, click, or read its text.
    // Fixed categories and bounded counts only; no arbitrary testids or labels.
    var selectors={
        queue:'[data-testid="queue-page"], [data-testid="queue-view"]',
        lyrics:'[data-testid="lyrics-page"], [data-testid="lyrics-lyricsContent"], [data-testid="lyrics-container"]',
        devices:'[data-testid="device-picker"], [data-testid="connect-device-list"]'
    };
    if(!Object.prototype.hasOwnProperty.call(selectors,kind))return JSON.stringify({reason:'kind',roots:0,rows:0,buttons:0,roles:0,testids:0});
    var roots=Array.from(document.querySelectorAll(selectors[kind])).filter(function(n){return n.isConnected;});
    var nodes=[];roots.forEach(function(r){Array.from(r.querySelectorAll('[role], [data-testid], button')).forEach(function(n){if(nodes.indexOf(n)<0)nodes.push(n);});});
    function count(test){return Math.min(99,nodes.filter(test).length);}
    return JSON.stringify({reason:roots.length?'observed':'absent',roots:Math.min(roots.length,99),
        rows:count(function(n){return n.getAttribute('role')==='listitem'||/^(queue-tracklist-row|device-list-item|lyrics-line)$/.test(n.getAttribute('data-testid')||'');}),
        buttons:count(function(n){return n.tagName==='BUTTON'||n.getAttribute('role')==='button';}),
        roles:count(function(n){return n.hasAttribute('role');}),testids:count(function(n){return n.hasAttribute('data-testid');})});
})
