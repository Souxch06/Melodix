(function(kind) {
    'use strict';
    // Passive, bounded, allowlisted observations only. No account, track or
    // arbitrary page text is returned. This probe does not click or send data.
    var specs={
        shuffle:{selector:'button[data-testid*="shuffle" i], button[aria-label], [role="button"][aria-label], [role="switch"][aria-label]', ids:/shuffle/i,
            off:/^(enable shuffle|turn shuffle on|activate shuffle|activer (la lecture |le mode |l['’])?aléatoire|zufallswiedergabe aktivieren|activar (el modo |la reproducción )?aleatori[oa]|ativar (a reprodução )?aleatória)$/i,
            on:/^(disable shuffle|turn shuffle off|deactivate shuffle|désactiver (la lecture |le mode |l['’])?aléatoire|zufallswiedergabe deaktivieren|desactivar (el modo |la reproducción )?aleatori[oa]|desativar (a reprodução )?aleatória)$/i},
        like:{selector:'[data-testid="now-playing-widget"] button, [data-testid="now-playing-bar"] button, [data-testid="now-playing-view"] button, [data-testid="now-playing-panel"] button, [data-testid="now-playing-view"] [role="button"], [data-testid="now-playing-bar"] [role="button"]', ids:/^(add-button|remove-button|add-to-library-button|remove-from-library-button)$/i,
            off:/^(save to your library|add to (your )?(liked songs|library)|ajouter (à|aux) (la bibliothèque|titres likés)|enregistrer dans (votre |la )?bibliothèque|in (deine |der )?bibliothek (aufnehmen|hinzufügen)|añadir a (tu )?biblioteca|adicionar (à biblioteca|aos títulos curtidos))$/i,
            on:/^(remove from (your )?(library|liked songs)|retirer (de la bibliothèque|des titres likés)|supprimer de (votre |la )?bibliothèque|aus (deiner |der )?bibliothek entfernen|quitar de (tu )?biblioteca|remover (da biblioteca|dos títulos curtidos))$/i}
    };
    // Aggregate structure only: fixed testid/role and label categories, never
    // arbitrary labels or identifiers that could contain a track or account.
    function structure() {
        var roots=Array.from(document.querySelectorAll('[data-testid="now-playing-bar"], [data-testid="now-playing-widget"], [data-testid="player-controls"], [data-testid="now-playing-view"], [data-testid="now-playing-panel"]'));
        var nodes=[];roots.forEach(function(root){Array.from(root.querySelectorAll('button,[role="button"],[role="switch"],[role="slider"],input[type="range"]')).forEach(function(n){if(nodes.indexOf(n)<0)nodes.push(n);});});
        var st={bar:0,view:0,nodes:Math.min(nodes.length,99),playpause:0,repeat:0,shuffle:0,like:0,queue:0,volume:0,lyrics:0,connect:0,other:0,button:0,switch:0,slider:0,aria_shuffle:0,aria_like:0,aria_play:0,aria_pause:0,aria_other:0};
        roots.forEach(function(r){if(/^(now-playing-view|now-playing-panel)$/.test(r.getAttribute('data-testid')))st.view++;else st.bar++;});
        nodes.forEach(function(n){
            var id=String(n.getAttribute('data-testid')||'').toLowerCase(), label=String(n.getAttribute('aria-label')||'').trim(), role=String(n.getAttribute('role')||'').toLowerCase();
            var k=/^control-button-playpause$/.test(id)?'playpause':/repeat/.test(id)?'repeat':/shuffle/.test(id)?'shuffle':/^(add-button|remove-button|add-to-library-button|remove-from-library-button)$/.test(id)?'like':/^(queue-button|control-button-queue)$/.test(id)?'queue':/^(volume-bar|volume-slider)$/.test(id)?'volume':/^(lyrics-button|control-button-lyrics)$/.test(id)?'lyrics':/^(connect-button|control-button-connect|connect-device-picker|device-picker)$/.test(id)?'connect':'other';
            st[k]=Math.min(st[k]+1,99);if(role==='switch')st.switch++;else if(role==='slider'||n.tagName==='INPUT')st.slider++;else st.button++;
            if(specs.shuffle.off.test(label)||specs.shuffle.on.test(label))st.aria_shuffle++;else if(specs.like.off.test(label)||specs.like.on.test(label))st.aria_like++;else if(/^(play|resume|lire|reprendre)$/i.test(label))st.aria_play++;else if(/^(pause|mettre en pause)$/i.test(label))st.aria_pause++;else if(label)st.aria_other++;
        });
        Object.keys(st).forEach(function(k){st[k]=Math.min(st[k],99);});return JSON.stringify(st);
    }
    var spec=specs[kind], out={kind:kind==='shuffle'?'shuffle':kind==='like'?'like':'unknown',reason:'control',count:0,state:'unknown',label:'unknown',command:'unknown',disabled:false,smart:false,structure:structure()};
    if(!spec)return JSON.stringify(out);
    var nodes=Array.from(document.querySelectorAll(spec.selector)).filter(function(b){
        return b.isConnected && (spec.ids.test(String(b.getAttribute('data-testid')||'')) || spec.off.test(String(b.getAttribute('aria-label')||'').trim()) || spec.on.test(String(b.getAttribute('aria-label')||'').trim()));
    });
    out.count=Math.min(nodes.length,2);
    if(nodes.length!==1){out.reason=nodes.length?'ambiguous':document.readyState==='loading'?'page':'absent';return JSON.stringify(out);}
    var b=nodes[0], label=String(b.getAttribute('aria-label')||'').trim();
    out.label=spec.on.test(label)?'on-action':spec.off.test(label)?'off-action':label?'unrecognized':'absent';
    out.disabled=!!b.disabled || b.getAttribute('aria-disabled')==='true';
    var raw=b.getAttribute('aria-checked');if(raw===null)raw=b.getAttribute('aria-pressed');
    out.state=raw==='true'||raw==='false'||(kind==='shuffle'&&raw==='mixed')?raw:raw===null?(out.label==='on-action'?'true':out.label==='off-action'?'false':'unknown'):'unknown';
    out.smart=kind==='shuffle' && out.state==='mixed';
    var popup=String(b.getAttribute('aria-haspopup')||'').toLowerCase();
    if(kind==='like')out.command=popup==='true'||popup==='menu'||popup==='dialog'?'menu':'unspecified';
    else out.command='toggle';
    var description=String(b.getAttribute('aria-description')||'').trim();
    var restricted=kind==='shuffle' && out.disabled && /^(shuffle is not available (with|for) (this account|this playback)|l['’]aléatoire n['’]est pas disponible avec (ce compte|cette lecture))$/i.test(description);
    out.reason=restricted?'restriction':out.disabled?'disabled':out.state==='unknown'?'state':'observed';
    return JSON.stringify(out);
})
