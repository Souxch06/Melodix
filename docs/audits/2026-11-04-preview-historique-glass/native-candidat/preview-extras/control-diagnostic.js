(function(kind) {
    'use strict';
    // Passive, bounded, allowlisted observations only. No account, track or
    // arbitrary page text is returned. This probe does not click or send data.
    var specs={
        repeat:{selector:'button[data-testid="control-button-repeat"], [role="button"][data-testid="control-button-repeat"], button[aria-label], [role="button"][aria-label]', ids:/^control-button-repeat$/i,
            off:/^(enable repeat|turn repeat on|activer la répétition|wiederholung aktivieren|activar repetición|ativar repetição)$/i,
            on:/^(disable repeat|turn repeat off|désactiver la répétition|wiederholung deaktivieren|desactivar repetición|desativar repetição)$/i},
        shuffle:{selector:'button[data-testid*="shuffle" i], button[aria-label], [role="button"][aria-label], [role="switch"][aria-label]', ids:/shuffle/i,
            off:/^(enable shuffle|turn shuffle on|activate shuffle|activer (la lecture |le mode |l['’])?aléatoire|zufallswiedergabe aktivieren|activar (el modo |la reproducción )?aleatori[oa]|ativar (a reprodução )?aleatória)$/i,
            on:/^(disable shuffle|turn shuffle off|deactivate shuffle|désactiver (la lecture |le mode |l['’])?aléatoire|zufallswiedergabe deaktivieren|desactivar (el modo |la reproducción )?aleatori[oa]|desativar (a reprodução )?aleatória)$/i},
        like:{selector:'[data-testid="now-playing-widget"] button, [data-testid="now-playing-bar"] button, [data-testid="now-playing-view"] button, [data-testid="now-playing-panel"] button, [data-testid="now-playing-widget"] [role="button"], [data-testid="now-playing-bar"] [role="button"], [data-testid="now-playing-view"] [role="button"], [data-testid="now-playing-panel"] [role="button"], [data-testid="now-playing-widget"] [role="switch"], [data-testid="now-playing-bar"] [role="switch"], [data-testid="now-playing-view"] [role="switch"], [data-testid="now-playing-panel"] [role="switch"]', ids:/^(add-button|remove-button|add-to-library-button|remove-from-library-button)$/i,
            off:/^(save to your library|add to (your )?(liked songs|library)|ajouter (à|aux) (la bibliothèque|titres likés)|enregistrer dans (votre |la )?bibliothèque|in (deine |der )?bibliothek (aufnehmen|hinzufügen)|añadir a (tu )?biblioteca|adicionar (à biblioteca|aos títulos curtidos))$/i,
            on:/^(remove from (your )?(library|liked songs)|retirer (de la bibliothèque|des titres likés)|supprimer de (votre |la )?bibliothèque|aus (deiner |der )?bibliothek entfernen|quitar de (tu )?biblioteca|remover (da biblioteca|dos títulos curtidos))$/i}
    };
    // Aggregate structure only: fixed testid/role and label categories, never
    // arbitrary labels or identifiers that could contain a track or account.
    function structure() {
        var roots=Array.from(document.querySelectorAll('[data-testid="now-playing-bar"], [data-testid="now-playing-widget"], [data-testid="player-controls"], [data-testid="now-playing-view"], [data-testid="now-playing-panel"]'));
        var nodes=[];roots.forEach(function(root){Array.from(root.querySelectorAll('button,[role="button"],[role="switch"],[role="slider"],input[type="range"]')).forEach(function(n){if(nodes.indexOf(n)<0)nodes.push(n);});});
        var st={bar:0,view:0,nodes:Math.min(nodes.length,99),playpause:0,repeat:0,shuffle:0,like:0,queue:0,volume:0,lyrics:0,connect:0,other:0,button:0,switch:0,slider:0,aria_shuffle:0,aria_like:0,aria_play:0,aria_pause:0,aria_other:0,track_links:0,track_named:0,track_generic:0,npv_opener:0};
        roots.forEach(function(r){if(/^(now-playing-view|now-playing-panel)$/.test(r.getAttribute('data-testid')))st.view++;else st.bar++;});
        nodes.forEach(function(n){
            var id=String(n.getAttribute('data-testid')||'').toLowerCase(), label=String(n.getAttribute('aria-label')||'').trim(), role=String(n.getAttribute('role')||'').toLowerCase();
            var k=/^control-button-playpause$/.test(id)?'playpause':/repeat/.test(id)?'repeat':/shuffle/.test(id)?'shuffle':/^(add-button|remove-button|add-to-library-button|remove-from-library-button)$/.test(id)?'like':/^(queue-button|control-button-queue)$/.test(id)?'queue':/^(volume-bar|volume-slider)$/.test(id)?'volume':/^(lyrics-button|control-button-lyrics)$/.test(id)?'lyrics':/^(connect-button|control-button-connect|connect-device-picker|device-picker)$/.test(id)?'connect':'other';
            st[k]=Math.min(st[k]+1,99);if(role==='switch')st.switch++;else if(role==='slider'||n.tagName==='INPUT')st.slider++;else st.button++;
            if(specs.shuffle.off.test(label)||specs.shuffle.on.test(label))st.aria_shuffle++;else if(specs.like.off.test(label)||specs.like.on.test(label))st.aria_like++;else if(/^(play|resume|lire|reprendre)$/i.test(label))st.aria_play++;else if(/^(pause|mettre en pause)$/i.test(label))st.aria_pause++;else if(label)st.aria_other++;
        });
        var links=Array.from(document.querySelectorAll('[data-testid="now-playing-widget"] a[href], [data-testid="now-playing-bar"] a[href]'));
        // Shapes only (no href, title or label text): where the bar points, and
        // what the checked (like-like) buttons' labels contain.
        ['href_album','href_album_hl','href_artist','href_other','chk_buttons','chk_likeword','chk_verb_add','chk_verb_on','chk_long'].forEach(function(k){st[k]=0;});
        links.forEach(function(a){
            var hh=String(a.getAttribute('href')||'');
            if(/\/album\//i.test(hh))st[/highlight=/i.test(hh)?'href_album_hl':'href_album']++;else if(/\/artist\//i.test(hh))st.href_artist++;else if(!/\/(track|episode)\//i.test(hh))st.href_other++;
        });
        Array.from(document.querySelectorAll('[data-testid="now-playing-widget"] button[aria-checked], [data-testid="now-playing-bar"] button[aria-checked]')).forEach(function(b){
            var l=String(b.getAttribute('aria-label')||'').trim();if(/repeat|r[ée]p[ée]t|shuffle|al[ée]atoire/i.test(l)||/repeat|shuffle/i.test(String(b.getAttribute('data-testid')||'')))return;
            st.chk_buttons++;if(/(liké|liked|bibliothèque|library|favori)/i.test(l))st.chk_likeword++;
            if(/^(ajouter|add|enregistrer|save)/i.test(l))st.chk_verb_add++;if(/^(ajouté|retirer|supprimer|remove|enregistré|saved|added)/i.test(l))st.chk_verb_on++;if(l.length>30)st.chk_long++;
        });
        links.forEach(function(a){
            var h=String(a.getAttribute('href')||'');
            if (!/^(?:https:\/\/open\.spotify\.com)?\/(?:intl-[a-z]{2}(?:-[a-z]{2})?\/)?(?:track|episode)\/[a-z0-9]+\/?(?:[?#].*)?$/i.test(h) && !/^(?:https:\/\/open\.spotify\.com)?\/(?:intl-[a-z]{2}(?:-[a-z]{2})?\/)?album\/[a-z0-9]+\/?\?(?:[^#]*&)?highlight=spotify(?::|%3a)track(?::|%3a)[a-z0-9]+/i.test(h)) return;
            st.track_links++;if(String(a.textContent||'').trim())st.track_named++;
            if(!/^(context-item-link|nowplaying-track-link)$/i.test(String(a.getAttribute('data-testid')||'')))st.track_generic++;
        });
        st.track_attr=0;
        Array.from(document.querySelectorAll('[data-testid="now-playing-widget"] [data-testid="context-item-link"], [data-testid="now-playing-widget"] [data-testid="nowplaying-track-link"], [data-testid="now-playing-widget"] [data-testid="context-item-info-title"], [data-testid="now-playing-bar"] [data-testid="context-item-link"], [data-testid="now-playing-bar"] [data-testid="nowplaying-track-link"], [data-testid="now-playing-bar"] [data-testid="context-item-info-title"]')).forEach(function(n){
            if(['data-uri','data-track-uri','data-spotify-uri'].some(function(k){return /^spotify:(track|episode):[a-z0-9]+$/i.test(String(n.getAttribute(k)||''));}))st.track_attr++;
        });
        Array.from(document.querySelectorAll('button, [role="button"]')).forEach(function(b){
            var id=String(b.getAttribute('data-testid')||''), l=String(b.getAttribute('aria-label')||'').trim();
            if(/^(control-button-npv|now-playing-view-button)$/i.test(id)||/^(now playing view|show now playing view|hide now playing view|vue « ?en cours de lecture ?»|afficher la vue en cours de lecture|masquer la vue en cours de lecture|en cours de lecture|ansicht „läuft gerade“|vista de reproducción|tela tocando agora)$/i.test(l))st.npv_opener++;
        });
        // Counts outside player scopes help locate candidates only. They may
        // belong to a playlist or another track and are NEVER actionable.
        st.outside_like_id=0;st.outside_like_label=0;st.outside_track_links=0;
        function inPlayer(n){return !!n.closest('[data-testid="now-playing-widget"], [data-testid="now-playing-bar"], [data-testid="now-playing-view"], [data-testid="now-playing-panel"], [data-testid="NPV"]');}
        Array.from(document.querySelectorAll('button, [role="button"], [role="switch"]')).forEach(function(n){
            if(!n.isConnected||inPlayer(n))return;
            var id=String(n.getAttribute('data-testid')||''),label=String(n.getAttribute('aria-label')||'').trim();
            if(specs.like.ids.test(id))st.outside_like_id++;
            if(specs.like.off.test(label)||specs.like.on.test(label))st.outside_like_label++;
        });
        Array.from(document.querySelectorAll('a[href]')).forEach(function(a){
            if(!a.isConnected||inPlayer(a))return;
            if(/^(?:https:\/\/open\.spotify\.com)?\/(?:intl-[a-z]{2}(?:-[a-z]{2})?\/)?(?:track|episode)\/[a-z0-9]+\/?(?:[?#].*)?$/i.test(String(a.getAttribute('href')||'')))st.outside_track_links++;
        });
        Object.keys(st).forEach(function(k){st[k]=Math.min(st[k],99);});return JSON.stringify(st);
    }
    var spec=specs[kind], out={kind:kind==='shuffle'?'shuffle':kind==='like'?'like':kind==='repeat'?'repeat':'unknown',reason:'control',count:0,state:'unknown',label:'unknown',command:'unknown',disabled:false,smart:false,structure:structure()};
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
    out.state=raw==='true'||raw==='false'||(kind!=='like'&&raw==='mixed')?raw:raw===null?(out.label==='on-action'?'true':out.label==='off-action'?'false':'unknown'):'unknown';
    out.smart=kind==='shuffle' && out.state==='mixed';
    var id=String(b.getAttribute('data-testid')||'').toLowerCase();
    var conflict=kind==='like' && ((out.state==='false' && (out.label==='on-action'||/^(remove-button|remove-from-library-button)$/.test(id))) || (out.state==='true' && out.label==='off-action'));
    var unverified=kind==='like' && out.label!=='off-action' && out.label!=='on-action';
    if(unverified)out.state='unknown';
    var popup=String(b.getAttribute('aria-haspopup')||'').toLowerCase();
    if(kind==='like')out.command=popup==='true'||popup==='menu'||popup==='dialog'||popup==='listbox'||popup==='tree'||popup==='grid'?'menu':'unspecified';
    else out.command='toggle';
    var description=String(b.getAttribute('aria-description')||'').trim();
    var restricted=kind==='shuffle' && out.disabled && /^(shuffle is not available (with|for) (this account|this playback)|l['’]aléatoire n['’]est pas disponible avec (ce compte|cette lecture))$/i.test(description);
    out.reason=restricted?'restriction':out.disabled?'disabled':conflict?'conflict':unverified?'unverified':out.state==='unknown'?'state':'observed';
    return JSON.stringify(out);
})
