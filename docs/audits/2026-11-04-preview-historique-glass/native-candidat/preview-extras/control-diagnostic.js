(function(kind) {
    'use strict';
    // Passive, bounded, allowlisted observations only. No account, track or
    // arbitrary page text is returned. This probe does not click or send data.
    var specs={
        shuffle:{selector:'button[data-testid*="shuffle" i], button[aria-label]', ids:/shuffle/i,
            off:/^(enable shuffle|turn shuffle on|activate shuffle|activer (la lecture |le mode |l['’])?aléatoire|zufallswiedergabe aktivieren|activar (el modo |la reproducción )?aleatori[oa]|ativar (a reprodução )?aleatória)$/i,
            on:/^(disable shuffle|turn shuffle off|deactivate shuffle|désactiver (la lecture |le mode |l['’])?aléatoire|zufallswiedergabe deaktivieren|desactivar (el modo |la reproducción )?aleatori[oa]|desativar (a reprodução )?aleatória)$/i},
        like:{selector:'[data-testid="now-playing-widget"] button, [data-testid="now-playing-bar"] button', ids:/^(add-button|remove-button|add-to-library-button|remove-from-library-button)$/i,
            off:/^(save to your library|add to (your )?(liked songs|library)|ajouter (à|aux) (la bibliothèque|titres likés)|enregistrer dans (votre |la )?bibliothèque|in (deine |der )?bibliothek (aufnehmen|hinzufügen)|añadir a (tu )?biblioteca|adicionar (à biblioteca|aos títulos curtidos))$/i,
            on:/^(remove from (your )?(library|liked songs)|retirer (de la bibliothèque|des titres likés)|supprimer de (votre |la )?bibliothèque|aus (deiner |der )?bibliothek entfernen|quitar de (tu )?biblioteca|remover (da biblioteca|dos títulos curtidos))$/i}
    };
    var spec=specs[kind], out={kind:kind==='shuffle'?'shuffle':kind==='like'?'like':'unknown',reason:'control',count:0,state:'unknown',label:'unknown',command:'unknown',disabled:false,smart:false};
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
    out.reason=out.disabled?'disabled':out.state==='unknown'?'state':'observed';
    return JSON.stringify(out);
})
