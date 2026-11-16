(function(action, kind) {
    'use strict';
    // Probe only existing controls. A click is issued only on an explicit tap.
    var specs={
        queue:{ids:/^(control-button-queue|queue-button)$/i, label:/^(queue|play queue|file d'attente|file de lecture|warteschlange|cola de reproducción|fila de reprodução)$/i},
        lyrics:{ids:/^(lyrics-button|control-button-lyrics)$/i, label:/^(lyrics|show lyrics|paroles|afficher les paroles|songtext|letras|letra)$/i},
        connect:{ids:/^(connect-button|control-button-connect|connect-device-picker|device-picker)$/i, label:/^(connect to a device|connect to a device\.\.\.|connecter à un appareil|se connecter à un appareil|mit einem gerät verbinden|conectar a un dispositivo|conectar a um dispositivo)$/i}
    };
    function status(k) {
        var spec=specs[k], result={state:'unavailable',reason:'control'};
        if(!spec)return result;
        var nodes=Array.from(document.querySelectorAll('button[data-testid], button[aria-label]')).filter(function(b){
            return b.isConnected && (spec.ids.test(String(b.getAttribute('data-testid')||'')) || spec.label.test(String(b.getAttribute('aria-label')||'').trim()));
        });
        if(!nodes.length){result.reason=document.readyState==='loading'?'page':document.querySelector('[data-testid="now-playing-bar"], [data-testid="now-playing-widget"], [data-testid="player-controls"]')?'control':'bar';return result;}
        if(nodes.length!==1){result.reason='ambiguous';return result;}
        var b=nodes[0];
        if(b.disabled || b.getAttribute('aria-disabled')==='true'){result.reason='disabled';return result;}
        result.state='available';result.reason='';result.button=b;return result;
    }
    if(action==='query'){
        var all={};Object.keys(specs).forEach(function(k){var x=status(k);all[k]=x.state;all[k+'Reason']=x.reason;});return JSON.stringify(all);
    }
    if(action!=='invoke')return JSON.stringify({sent:false});
    var found=status(kind);
    if(found.state!=='available')return JSON.stringify({sent:false,reason:found.reason});
    try {
        var b=found.button;
        // An already-open panel is shown, not toggled closed again.
        if(b.getAttribute('aria-expanded')!=='true' && b.getAttribute('aria-pressed')!=='true')b.click();
        return JSON.stringify({sent:true});
    } catch (_) {return JSON.stringify({sent:false,reason:'command'});}
})
