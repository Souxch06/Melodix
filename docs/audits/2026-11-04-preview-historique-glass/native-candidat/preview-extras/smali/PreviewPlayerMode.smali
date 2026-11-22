.class public final Lcom/melodix/music/PreviewPlayerMode;
.super Landroid/widget/ImageButton;
.source "PreviewPlayerMode.java"


# static fields
.field private static final CONFIRM_MS:J = 0x1b58L

.field private static final DIAGNOSTIC:Ljava/lang/String; = "(function(kind) {\n    \'use strict\';\n    // Passive, bounded, allowlisted observations only. No account, track or\n    // arbitrary page text is returned. This probe does not click or send data.\n    var specs={\n        repeat:{selector:\'button[data-testid=\"control-button-repeat\"], [role=\"button\"][data-testid=\"control-button-repeat\"], button[aria-label], [role=\"button\"][aria-label]\', ids:/^control-button-repeat$/i,\n            off:/^(enable repeat|turn repeat on|activer la r\u00e9p\u00e9tition|wiederholung aktivieren|activar repetici\u00f3n|ativar repeti\u00e7\u00e3o)$/i,\n            on:/^(disable repeat|turn repeat off|d\u00e9sactiver la r\u00e9p\u00e9tition|wiederholung deaktivieren|desactivar repetici\u00f3n|desativar repeti\u00e7\u00e3o)$/i},\n        shuffle:{selector:\'button[data-testid*=\"shuffle\" i], button[aria-label], [role=\"button\"][aria-label], [role=\"switch\"][aria-label]\', ids:/shuffle/i,\n            off:/^(enable shuffle|turn shuffle on|activate shuffle|activer (la lecture |le mode |l[\'\u2019])?al\u00e9atoire|zufallswiedergabe aktivieren|activar (el modo |la reproducci\u00f3n )?aleatori[oa]|ativar (a reprodu\u00e7\u00e3o )?aleat\u00f3ria)$/i,\n            on:/^(disable shuffle|turn shuffle off|deactivate shuffle|d\u00e9sactiver (la lecture |le mode |l[\'\u2019])?al\u00e9atoire|zufallswiedergabe deaktivieren|desactivar (el modo |la reproducci\u00f3n )?aleatori[oa]|desativar (a reprodu\u00e7\u00e3o )?aleat\u00f3ria)$/i},\n        like:{selector:\':is([data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-widget-v2\"]) button, [data-testid=\"now-playing-bar\"] button, [data-testid=\"now-playing-view\"] button, [data-testid=\"now-playing-panel\"] button, :is([data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-widget-v2\"]) [role=\"button\"], [data-testid=\"now-playing-bar\"] [role=\"button\"], [data-testid=\"now-playing-view\"] [role=\"button\"], [data-testid=\"now-playing-panel\"] [role=\"button\"], :is([data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-widget-v2\"]) [role=\"switch\"], [data-testid=\"now-playing-bar\"] [role=\"switch\"], [data-testid=\"now-playing-view\"] [role=\"switch\"], [data-testid=\"now-playing-panel\"] [role=\"switch\"]\', ids:/^(add-button|remove-button|add-to-library-button|remove-from-library-button)$/i,\n            off:/^(save to your library|add to (your )?(liked songs|library)|ajouter (\u00e0|aux) (la biblioth\u00e8que|titres lik\u00e9s)|enregistrer dans (votre |la )?biblioth\u00e8que|in (deine |der )?bibliothek (aufnehmen|hinzuf\u00fcgen)|a\u00f1adir a (tu )?biblioteca|adicionar (\u00e0 biblioteca|aos t\u00edtulos curtidos))$/i,\n            on:/^(remove from (your )?(library|liked songs)|retirer (de la biblioth\u00e8que|des titres lik\u00e9s)|supprimer de (votre |la )?biblioth\u00e8que|aus (deiner |der )?bibliothek entfernen|quitar de (tu )?biblioteca|remover (da biblioteca|dos t\u00edtulos curtidos))$/i}\n    };\n    // Same liked-label widening as control.js, so the report matches what a tap can act on.\n    (function(){var w=/(titres lik\u00e9s|liked songs|lik\u00e9|liked|favori|biblioth\u00e8que|library|biblioteca|bibliothek)/i,o=specs.like.off,n=specs.like.on;specs.like.off={test:function(l){return o.test(l)||(w.test(l)&&/^(ajouter|add|enregistrer|save|a\u00f1adir|adicionar|hinzuf\u00fcgen|zu)\\b/i.test(l));}};specs.like.on={test:function(l){return n.test(l)||(w.test(l)&&/^(ajout\u00e9|retirer|supprimer|remove|enregistr\u00e9|saved|added|quitar|remover|entfernen)/i.test(l));}};})();\n    // Aggregate structure only: fixed testid/role and label categories, never\n    // arbitrary labels or identifiers that could contain a track or account.\n    function structure() {\n        var roots=Array.from(document.querySelectorAll(\'[data-testid=\"now-playing-bar\"], :is([data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-widget-v2\"]), [data-testid=\"player-controls\"], [data-testid=\"now-playing-view\"], [data-testid=\"now-playing-panel\"]\'));\n        var nodes=[];roots.forEach(function(root){Array.from(root.querySelectorAll(\'button,[role=\"button\"],[role=\"switch\"],[role=\"slider\"],input[type=\"range\"]\')).forEach(function(n){if(nodes.indexOf(n)<0)nodes.push(n);});});\n        var st={bar:0,view:0,nodes:Math.min(nodes.length,99),playpause:0,repeat:0,shuffle:0,like:0,queue:0,volume:0,lyrics:0,connect:0,other:0,button:0,switch:0,slider:0,aria_shuffle:0,aria_like:0,aria_play:0,aria_pause:0,aria_other:0,track_links:0,track_named:0,track_generic:0,npv_opener:0};\n        roots.forEach(function(r){if(/^(now-playing-view|now-playing-panel)$/.test(r.getAttribute(\'data-testid\')))st.view++;else st.bar++;});\n        nodes.forEach(function(n){\n            var id=String(n.getAttribute(\'data-testid\')||\'\').toLowerCase(), label=String(n.getAttribute(\'aria-label\')||\'\').trim(), role=String(n.getAttribute(\'role\')||\'\').toLowerCase();\n            var k=/^control-button-playpause$/.test(id)?\'playpause\':/repeat/.test(id)?\'repeat\':/shuffle/.test(id)?\'shuffle\':/^(add-button|remove-button|add-to-library-button|remove-from-library-button)$/.test(id)?\'like\':/^(queue-button|control-button-queue)$/.test(id)?\'queue\':/^(volume-bar|volume-slider)$/.test(id)?\'volume\':/^(lyrics-button|control-button-lyrics)$/.test(id)?\'lyrics\':/^(connect-button|control-button-connect|connect-device-picker|device-picker)$/.test(id)?\'connect\':\'other\';\n            st[k]=Math.min(st[k]+1,99);if(role===\'switch\')st.switch++;else if(role===\'slider\'||n.tagName===\'INPUT\')st.slider++;else st.button++;\n            if(specs.shuffle.off.test(label)||specs.shuffle.on.test(label))st.aria_shuffle++;else if(specs.like.off.test(label)||specs.like.on.test(label))st.aria_like++;else if(/^(play|resume|lire|reprendre)$/i.test(label))st.aria_play++;else if(/^(pause|mettre en pause)$/i.test(label))st.aria_pause++;else if(label)st.aria_other++;\n        });\n        var links=Array.from(document.querySelectorAll(\':is([data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-widget-v2\"]) a[href], [data-testid=\"now-playing-bar\"] a[href]\'));\n        // Shapes only (no href, title or label text): where the bar points, and\n        // what the checked (like-like) buttons\' labels contain.\n        [\'href_album\',\'href_album_hl\',\'href_hl_ambiguous\',\'href_artist\',\'href_uri\',\'href_other\',\'chk_buttons\',\'chk_likeword\',\'chk_verb_add\',\'chk_verb_on\',\'chk_long\',\'chk_favori\',\'chk_library\',\'chk_liked\',\'chk_add_false\',\'chk_add_true\',\'chk_popup\'].forEach(function(k){st[k]=0;});\n        links.forEach(function(a){\n            var hh=String(a.getAttribute(\'href\')||\'\');\n            if(/^spotify:(track|episode):[a-z0-9]+$/i.test(hh))st.href_uri++;else if(/\\/album\\//i.test(hh))st[/highlight=/i.test(hh)?\'href_album_hl\':\'href_album\']++;else if(/\\/artist\\//i.test(hh))st.href_artist++;else if(!/\\/(track|episode)\\//i.test(hh))st.href_other++;\n        });\n        Array.from(document.querySelectorAll(\':is([data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-widget-v2\"]) button[aria-checked], [data-testid=\"now-playing-bar\"] button[aria-checked]\')).forEach(function(b){\n            var l=String(b.getAttribute(\'aria-label\')||\'\').trim();if(/repeat|r[\u00e9e]p[\u00e9e]t|shuffle|al[\u00e9e]atoire/i.test(l)||/repeat|shuffle/i.test(String(b.getAttribute(\'data-testid\')||\'\')))return;\n            st.chk_buttons++;if(/(lik\u00e9|liked|biblioth\u00e8que|library|favori)/i.test(l))st.chk_likeword++;\n            if(/^(ajouter|add|enregistrer|save)/i.test(l))st.chk_verb_add++;if(/^(ajout\u00e9|retirer|supprimer|remove|enregistr\u00e9|saved|added)/i.test(l))st.chk_verb_on++;if(l.length>30)st.chk_long++;\n            if(/favori/i.test(l))st.chk_favori++;if(/biblioth\u00e8que|library/i.test(l))st.chk_library++;if(/lik\u00e9|liked/i.test(l))st.chk_liked++;\n            if(/^(ajouter|add|enregistrer|save)/i.test(l)) {if(b.getAttribute(\'aria-checked\')===\'false\')st.chk_add_false++;if(b.getAttribute(\'aria-checked\')===\'true\')st.chk_add_true++;}\n            if(/^(true|menu|dialog|listbox)$/i.test(String(b.getAttribute(\'aria-haspopup\')||\'\')))st.chk_popup++;\n\n        });\n        links.forEach(function(a){\n            var h=String(a.getAttribute(\'href\')||\'\');\n            if (!/^spotify:(track|episode):[a-z0-9]+$/i.test(h) && !/^(?:https:\\/\\/open\\.spotify\\.com)?\\/(?:intl-[a-z]{2}(?:-[a-z]{2})?\\/)?(?:track|episode)\\/[a-z0-9]+\\/?(?:[?#].*)?$/i.test(h) && !/^(?:https:\\/\\/open\\.spotify\\.com)?\\/(?:intl-[a-z]{2}(?:-[a-z]{2})?\\/)?album\\/[a-z0-9]+\\/?\\?(?:[^#]*&)?highlight=spotify(?::|%3a)track(?::|%3a)[a-z0-9]+/i.test(h)) return;\n            if (/\\/album\\//i.test(h)) {\n                try {\n                    var highlights=[];\n                    new URL(h, \'https://open.spotify.com\').searchParams.forEach(function(v,k){if(k.toLowerCase()===\'highlight\')highlights.push(v);});\n                    if(highlights.length!==1 || !/^spotify:track:[a-z0-9]+$/i.test(highlights[0])) {st.href_hl_ambiguous++;return;}\n                } catch (_) {st.href_hl_ambiguous++;return;}\n            }\n            st.track_links++;if(String(a.textContent||\'\').trim())st.track_named++;\n            if(!/^(context-item-link|nowplaying-track-link)$/i.test(String(a.getAttribute(\'data-testid\')||\'\')))st.track_generic++;\n        });\n        st.track_attr=0;\n        Array.from(document.querySelectorAll(\':is([data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-widget-v2\"]) [data-testid=\"context-item-link\"], :is([data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-widget-v2\"]) [data-testid=\"nowplaying-track-link\"], :is([data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-widget-v2\"]) [data-testid=\"context-item-info-title\"], [data-testid=\"now-playing-bar\"] [data-testid=\"context-item-link\"], [data-testid=\"now-playing-bar\"] [data-testid=\"nowplaying-track-link\"], [data-testid=\"now-playing-bar\"] [data-testid=\"context-item-info-title\"]\')).forEach(function(n){\n            if([\'data-uri\',\'data-track-uri\',\'data-spotify-uri\'].some(function(k){return /^spotify:(track|episode):[a-z0-9]+$/i.test(String(n.getAttribute(k)||\'\'));}))st.track_attr++;\n        });\n        Array.from(document.querySelectorAll(\'button, [role=\"button\"]\')).forEach(function(b){\n            var id=String(b.getAttribute(\'data-testid\')||\'\'), l=String(b.getAttribute(\'aria-label\')||\'\').trim();\n            if(/^(control-button-npv|now-playing-view-button)$/i.test(id)||/^(now playing view|show now playing view|hide now playing view|vue \u00ab ?en cours de lecture ?\u00bb|afficher la vue en cours de lecture|masquer la vue en cours de lecture|en cours de lecture|ansicht \u201el\u00e4uft gerade\u201c|vista de reproducci\u00f3n|tela tocando agora)$/i.test(l))st.npv_opener++;\n        });\n        // Counts outside player scopes help locate candidates only. They may\n        // belong to a playlist or another track and are NEVER actionable.\n        st.outside_like_id=0;st.outside_like_label=0;st.outside_track_links=0;\n        function inPlayer(n){return !!n.closest(\':is([data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-widget-v2\"]), [data-testid=\"now-playing-bar\"], [data-testid=\"now-playing-view\"], [data-testid=\"now-playing-panel\"], [data-testid=\"NPV\"]\');}\n        Array.from(document.querySelectorAll(\'button, [role=\"button\"], [role=\"switch\"]\')).forEach(function(n){\n            if(!n.isConnected||inPlayer(n))return;\n            var id=String(n.getAttribute(\'data-testid\')||\'\'),label=String(n.getAttribute(\'aria-label\')||\'\').trim();\n            if(specs.like.ids.test(id))st.outside_like_id++;\n            if(specs.like.off.test(label)||specs.like.on.test(label))st.outside_like_label++;\n        });\n        Array.from(document.querySelectorAll(\'a[href]\')).forEach(function(a){\n            if(!a.isConnected||inPlayer(a))return;\n            if(/^(?:https:\\/\\/open\\.spotify\\.com)?\\/(?:intl-[a-z]{2}(?:-[a-z]{2})?\\/)?(?:track|episode)\\/[a-z0-9]+\\/?(?:[?#].*)?$/i.test(String(a.getAttribute(\'href\')||\'\')))st.outside_track_links++;\n        });\n        // Capability counts only. Never invoke platform APIs or include their\n        // state, user, title, identifiers, labels, or session information.\n        st.api_player=st.api_state=st.api_library=st.api_contains=st.api_add=0;\n        try {\n            var platform=window.Melodix && window.Melodix.Platform;\n            var player=platform && platform.PlayerAPI, library=platform && platform.LibraryAPI;\n            if(player)st.api_player=1;if(player && typeof player.getState===\'function\')st.api_state=1;\n            if(library)st.api_library=1;if(library && typeof library.contains===\'function\')st.api_contains=1;\n            if(library && typeof library.add===\'function\')st.api_add=1;\n        } catch (_) {}\n        Object.keys(st).forEach(function(k){st[k]=Math.min(st[k],99);});return JSON.stringify(st);\n    }\n    var spec=specs[kind], out={kind:kind===\'shuffle\'?\'shuffle\':kind===\'like\'?\'like\':kind===\'repeat\'?\'repeat\':\'unknown\',reason:\'control\',count:0,state:\'unknown\',label:\'unknown\',command:\'unknown\',disabled:false,smart:false,structure:structure()};\n    if(!spec)return JSON.stringify(out);\n    var nodes=Array.from(document.querySelectorAll(spec.selector)).filter(function(b){\n        return b.isConnected && (spec.ids.test(String(b.getAttribute(\'data-testid\')||\'\')) || spec.off.test(String(b.getAttribute(\'aria-label\')||\'\').trim()) || spec.on.test(String(b.getAttribute(\'aria-label\')||\'\').trim()));\n    });\n    out.count=Math.min(nodes.length,2);\n    if(nodes.length!==1){out.reason=nodes.length?\'ambiguous\':document.readyState===\'loading\'?\'page\':\'absent\';return JSON.stringify(out);}\n    var b=nodes[0], label=String(b.getAttribute(\'aria-label\')||\'\').trim();\n    out.label=spec.on.test(label)?\'on-action\':spec.off.test(label)?\'off-action\':label?\'unrecognized\':\'absent\';\n    out.disabled=!!b.disabled || b.getAttribute(\'aria-disabled\')===\'true\';\n    var raw=b.getAttribute(\'aria-checked\');if(raw===null)raw=b.getAttribute(\'aria-pressed\');\n    out.state=raw===\'true\'||raw===\'false\'||(kind!==\'like\'&&raw===\'mixed\')?raw:raw===null?(out.label===\'on-action\'?\'true\':out.label===\'off-action\'?\'false\':\'unknown\'):\'unknown\';\n    out.smart=kind===\'shuffle\' && out.state===\'mixed\';\n    var id=String(b.getAttribute(\'data-testid\')||\'\').toLowerCase();\n    var conflict=kind===\'like\' && ((out.state===\'false\' && (out.label===\'on-action\'||/^(remove-button|remove-from-library-button)$/.test(id))) || (out.state===\'true\' && out.label===\'off-action\'));\n    var unverified=kind===\'like\' && out.label!==\'off-action\' && out.label!==\'on-action\';\n    if(unverified)out.state=\'unknown\';\n    var popup=String(b.getAttribute(\'aria-haspopup\')||\'\').toLowerCase();\n    if(kind===\'like\')out.command=popup===\'true\'||popup===\'menu\'||popup===\'dialog\'||popup===\'listbox\'||popup===\'tree\'||popup===\'grid\'?\'menu\':\'unspecified\';\n    else out.command=\'toggle\';\n    var description=String(b.getAttribute(\'aria-description\')||\'\').trim();\n    var restricted=kind===\'shuffle\' && out.disabled && /^(shuffle is not available (with|for) (this account|this playback)|l[\'\u2019]al\u00e9atoire n[\'\u2019]est pas disponible avec (ce compte|cette lecture))$/i.test(description);\n    out.reason=restricted?\'restriction\':out.disabled?\'disabled\':conflict?\'conflict\':unverified?\'unverified\':out.state===\'unknown\'?\'state\':\'observed\';\n    return JSON.stringify(out);\n})\n"

.field private static final JOB:Ljava/lang/String; = "(function(kind, action, shownState, expectedTitle, expectedTrack) {\n    \'use strict\';\n    // One explicit tap = one job. Methods in order, state re-read after each:\n    // (a) control already in the page, (b) briefly open the now-playing view in\n    // the hidden page and close it again, (c) web-player keyboard shortcut\n    // (shuffle/repeat only: a like is never sent without a verified state).\n    // Never reads storage, cookies or tokens; never navigates; no network.\n    var W = window;\n    var jobs = W.__melodixModeJobs = W.__melodixModeJobs || {};\n    if ([\'like\', \'shuffle\', \'repeat\'].indexOf(kind) < 0) return JSON.stringify({status: \'done\', outcome: \'failed\', reason: \'kind\'});\n    if (action === \'poll\') {\n        var previous = jobs[kind] || {status: \'none\'};\n        // A result can become stale after it was recorded but before native polling.\n        if (kind === \'like\' && previous.status === \'done\' &&\n            (previous.outcome === \'confirmed\' || previous.outcome === \'read\') && !identityMatches()) {\n            previous.outcome = \'identity\'; previous.state = \'unknown\';\n            if (previous.journal && previous.journal.length < 16) previous.journal.push(\'poll:identity\');\n        }\n        return JSON.stringify(previous);\n    }\n    if (action !== \'run\') return JSON.stringify({status: \'none\'});\n    if (jobs[kind] && jobs[kind].status === \'running\' && Date.now() - jobs[kind].started < 8000) return JSON.stringify({status: \'busy\'});\n    var labels = {\n        like: {\n            off: /^(save to your library|add to (your )?(liked songs|library)|ajouter (\u00e0|aux) (la biblioth\u00e8que|titres lik\u00e9s|vos titres lik\u00e9s)|enregistrer dans (votre |la )?biblioth\u00e8que|in (deine |der )?bibliothek (aufnehmen|hinzuf\u00fcgen)|a\u00f1adir a (tu )?biblioteca|adicionar (\u00e0 biblioteca|aos t\u00edtulos curtidos))$/i,\n            on: /^(remove from (your )?(library|liked songs)|retirer (de la biblioth\u00e8que|des titres lik\u00e9s|de vos titres lik\u00e9s)|supprimer de (votre |la )?biblioth\u00e8que|aus (deiner |der )?bibliothek entfernen|quitar de (tu )?biblioteca|remover (da biblioteca|dos t\u00edtulos curtidos))$/i\n        },\n        repeat: {\n            off: /^(enable repeat|turn repeat on|activer la r\u00e9p\u00e9tition|wiederholung aktivieren|activar repetici\u00f3n|ativar repeti\u00e7\u00e3o)$/i,\n            on: /^(disable repeat|turn repeat off|enable repeat one|d\u00e9sactiver la r\u00e9p\u00e9tition|activer la r\u00e9p\u00e9tition d[\'\u2019]un titre|wiederholung deaktivieren|desactivar repetici\u00f3n|desativar repeti\u00e7\u00e3o)$/i\n        },\n        shuffle: {\n            off: /^(enable shuffle|turn shuffle on|activate shuffle|activer (la lecture |le mode |l[\'\u2019])?al\u00e9atoire|zufallswiedergabe aktivieren|activar (el modo |la reproducci\u00f3n )?aleatori[oa]|ativar (a reprodu\u00e7\u00e3o )?aleat\u00f3ria)$/i,\n            on: /^(disable shuffle|turn shuffle off|deactivate shuffle|enable smart shuffle|d\u00e9sactiver (la lecture |le mode |l[\'\u2019])?al\u00e9atoire|activer la lecture al\u00e9atoire intelligente|zufallswiedergabe deaktivieren|desactivar (el modo |la reproducci\u00f3n )?aleatori[oa]|desativar (a reprodu\u00e7\u00e3o )?aleat\u00f3ria)$/i\n        }\n    };\n    // Neutral names locate a control but never decide its state.\n    var neutral = /^(shuffle|lecture al\u00e9atoire|al\u00e9atoire|repeat|r\u00e9p\u00e9ter|r\u00e9p\u00e9tition)$/i;\n    var ids = {\n        like: /^(add-button|remove-button|add-to-library-button|remove-from-library-button)$/i,\n        repeat: /^control-button-repeat$/i,\n        shuffle: /^control-button-shuffle$|shuffle/i\n    };\n    var job = {status: \'running\', started: Date.now(), outcome: \'\', state: \'unknown\', method: \'\', journal: []};\n    jobs[kind] = job;\n    function log(code) { if (job.journal.length < 16) job.journal.push(code); }\n    function finish(outcome, state, method) { job.status = \'done\'; job.outcome = outcome; job.state = state || \'unknown\'; job.method = method || \'\'; }\n    function label(b) { return String(b.getAttribute(\'aria-label\') || \'\').trim(); }\n    function testid(b) { return String(b.getAttribute(\'data-testid\') || \'\'); }\n    // Current Spotify wording varies: a verb plus a liked-songs/library word.\n    (function() {\n        var word = /(titres lik\u00e9s|liked songs|lik\u00e9|liked|favori|biblioth\u00e8que|library|biblioteca|bibliothek)/i, off = labels.like.off, on = labels.like.on;\n        labels.like.off = {test: function(l) { return off.test(l) || (word.test(l) && /^(ajouter|add|enregistrer|save|a\u00f1adir|adicionar|hinzuf\u00fcgen|zu)\\b/i.test(l)); }};\n        labels.like.on = {test: function(l) { return on.test(l) || (word.test(l) && /^(ajout\u00e9|retirer|supprimer|remove|enregistr\u00e9|saved|added|quitar|remover|entfernen)/i.test(l)); }};\n    })();\n    // Spotify\'s \"+\" save button: generic \"Ajouter...\" label, state in aria-checked.\n    function genericAdd(l) { return /^(ajouter|add|enregistrer|save)\\b/i.test(l) && !/(titres lik\u00e9s|liked songs|biblioth\u00e8que|library|file d[\'\u2019]attente|queue)/i.test(l); }\n    function find() {\n        var list = Array.from(document.querySelectorAll(\'button, [role=\"button\"], [role=\"switch\"]\')).filter(function(b) {\n            if (!b.isConnected) return false;\n            var l = label(b);\n            return ids[kind].test(testid(b)) || labels[kind].off.test(l) || labels[kind].on.test(l) ||\n                (kind === \'like\' && b.hasAttribute(\'aria-checked\') && genericAdd(l)) ||\n                (kind !== \'like\' && neutral.test(l) && (kind === \'shuffle\' ? /al[\u00e9e]atoire|shuffle/i : /r[\u00e9e]p[\u00e9e]t|repeat/i).test(l));\n        });\n        if (kind !== \'like\') {\n            // User report (1022300): a disabled shuffle toggle elsewhere in the page (e.g. a\n            // playlist header) was taken for the player\'s and reported as \"blocked by Spotify\".\n            list = list.filter(function(b) {\n                return !b.closest(\'main, [role=\"main\"], [data-testid=\"action-bar-row\"], [data-testid=\"playlist-page\"], [data-testid=\"album-page\"]\');\n            });\n        }\n        if (kind === \'like\') {\n            var scoped = list.filter(function(b) {\n                return b.closest(\':is([data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-widget-v2\"]), [data-testid=\"now-playing-bar\"], [data-testid=\"now-playing-view\"], [data-testid=\"now-playing-panel\"], [data-testid=\"NPV\"]\');\n            });\n            list = scoped;\n        }\n        if (list.length > 1) {\n            var visible = list.filter(function(b) { var r = b.getBoundingClientRect(); return r.width > 0 && r.height > 0; });\n            if (visible.length === 1) list = visible;\n        }\n        if (!list.length) return {reason: \'absent\'};\n        if (list.length !== 1) return {reason: \'ambiguous\'};\n        var b = list[0];\n        if (b.disabled || b.getAttribute(\'aria-disabled\') === \'true\') return {reason: \'disabled\', node: b};\n        return {node: b, reason: \'\'};\n    }\n    function read(b) {\n        var checked = b.getAttribute(\'aria-checked\'), pressed = b.getAttribute(\'aria-pressed\');\n        var raw = checked === null ? pressed : checked;\n        var l = label(b), on = labels[kind].on.test(l), off = labels[kind].off.test(l);\n        if (kind === \'like\') {\n            var id = testid(b).toLowerCase();\n            var remove = /^(remove-button|remove-from-library-button)$/.test(id);\n            if (/^(true|menu|dialog|listbox|tree|grid)$/i.test(String(b.getAttribute(\'aria-haspopup\') || \'\')) ||\n                b.matches(\':disabled\') || b.closest(\'[aria-disabled=\"true\"], fieldset:disabled\') ||\n                (checked !== null && pressed !== null && checked !== pressed)) return \'unknown\';\n            if (raw !== null && raw !== \'true\' && raw !== \'false\') return \'unknown\';\n            if (raw === null) raw = on ? \'true\' : off ? \'false\' : \'unknown\';\n            // Once liked, Spotify relabels the checked button generically (phone 1022229).\n            if (raw === \'true\' && checked === \'true\' && !on && !off && genericAdd(l)) on = true;\n            if ((raw === \'false\' && (on || remove)) || (raw === \'true\' && off)) return \'unknown\';\n            // An unlabelled generic add-button may open a playlist picker.\n            if (!off && !on) return \'unknown\';\n            return raw;\n        }\n        if (raw === \'true\' || raw === \'false\' || raw === \'mixed\') return raw;\n        return on ? \'true\' : off ? \'false\' : \'unknown\';\n    }\n    // Spotify\'s bar title links to the album with the track in ?highlight=spotify:track:ID.\n    function trackHref(h) {\n        h = String(h || \'\');\n        // A Spotify URI is a complete identity, unlike an album or title.\n        var uri = /^spotify:(track|episode):([a-z0-9]+)$/i.exec(h);\n        if (uri) return uri;\n        var m = /^(?:https:\\/\\/open\\.spotify\\.com)?\\/(?:intl-[a-z]{2}(?:-[a-z]{2})?\\/)?(track|episode)\\/([a-z0-9]+)\\/?(?:[?#].*)?$/i.exec(h);\n        if (m) return m;\n        var a = /^(?:https:\\/\\/open\\.spotify\\.com)?\\/(?:intl-[a-z]{2}(?:-[a-z]{2})?\\/)?album\\/[a-z0-9]+\\/?\\?(?:[^#]*&)?highlight=spotify(?::|%3a)(track)(?::|%3a)([a-z0-9]+)(?:[&#].*)?$/i.exec(h);\n        if (a) {\n            // Duplicate highlight keys, including encoded/case variants,\n            // have ambiguous semantics. Never choose one arbitrarily.\n            try {\n                var query = new URL(h, \'https://open.spotify.com\').searchParams;\n                var values = [];\n                query.forEach(function(value, key) { if (key.toLowerCase() === \'highlight\') values.push(value); });\n                if (values.length !== 1 || !/^spotify:track:[a-z0-9]+$/i.test(values[0])) return null;\n                var parts = /^spotify:(track):([a-z0-9]+)$/i.exec(values[0]);\n                return [a[0], parts[1], parts[2]];\n            } catch (_) { return null; }\n        }\n        return null; // an album and title cannot uniquely identify a track\n    }\n    // Explicit track URIs on the current-player title only; never infer a\n    // track from an album, playlist, title alone, or an unrelated page row.\n    function markedTrack(n) {\n        if (!/^(context-item-link|nowplaying-track-link|context-item-info-title)$/i.test(String(n.getAttribute(\'data-testid\') || \'\'))) return \'\';\n        var result = \'\';\n        for (var name of [\'data-uri\', \'data-track-uri\', \'data-spotify-uri\']) {\n            if (!n.hasAttribute(name)) continue;\n            var m = /^spotify:(track|episode):([a-z0-9]+)$/i.exec(String(n.getAttribute(name) || \'\'));\n            if (!m) return \'!\';\n            var value = m[1].toLowerCase()+\':\'+m[2];\n            if (result && result !== value) return \'!\';\n            result = value;\n        }\n        return result;\n    }\n    // If a title link itself carries a malformed track hint, an attribute\n    // must not mask that ambiguity. Album-only links may use their explicit\n    // current-title parent marker, but never one outside the player bar.\n    function hasTrackHint(h) {\n        h=String(h||\'\');\n        if (/^spotify:(track|episode):/i.test(h) || /\\/(track|episode)\\//i.test(h)) return true;\n        try {\n            var found=false;\n            new URL(h, \'https://open.spotify.com\').searchParams.forEach(function(v,k){if(k.toLowerCase()===\'highlight\')found=true;});\n            return found;\n        } catch (_) { return true; }\n    }\n    function parentTrack(link) {\n        var n=link.closest(\'[data-testid=\"context-item-info-title\"]\');\n        if(!n || !n.closest(\':is([data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-widget-v2\"]), [data-testid=\"now-playing-bar\"]\')) return \'\';\n        return markedTrack(n);\n    }\n    function markedTitleNodes() {\n        return Array.from(document.querySelectorAll(\':is([data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-widget-v2\"]) [data-testid=\"context-item-link\"], :is([data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-widget-v2\"]) [data-testid=\"nowplaying-track-link\"], :is([data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-widget-v2\"]) [data-testid=\"context-item-info-title\"], [data-testid=\"now-playing-bar\"] [data-testid=\"context-item-link\"], [data-testid=\"now-playing-bar\"] [data-testid=\"nowplaying-track-link\"], [data-testid=\"now-playing-bar\"] [data-testid=\"context-item-info-title\"]\')).filter(function(n) { return n.isConnected; });\n    }\n    function identityMatches() {\n        if (!expectedTitle || !expectedTrack) return false;\n        if (expectedTrack === \'title:\' + expectedTitle) {\n            // Id-less bar: no track link may exist, the native title must appear in the bar text.\n            if (document.querySelector(\':is([data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-widget-v2\"]) a[href*=\"/track/\"], [data-testid=\"now-playing-bar\"] a[href*=\"/track/\"]\')) return false;\n            return Array.from(document.querySelectorAll(\':is([data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-widget-v2\"]), [data-testid=\"now-playing-bar\"]\')).some(function(r) {\n                return String(r.textContent || \'\').replace(/\\s+/g, \' \').toLowerCase().indexOf(String(expectedTitle).replace(/\\s+/g, \' \').trim().toLowerCase()) >= 0;\n            });\n        }\n        var links = Array.from(document.querySelectorAll(\':is([data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-widget-v2\"]) a[href], [data-testid=\"now-playing-bar\"] a[href], a[data-testid=\"nowplaying-track-link\"][href], [data-testid=\"now-playing-view\"] a[href]\'));\n        var malformedIdentity = false;\n        var identities = links.map(function(link) {\n            var m = trackHref(String(link.getAttribute(\'href\') || \'\'));\n            if (!m && /^(context-item-link|nowplaying-track-link)$/i.test(String(link.getAttribute(\'data-testid\') || \'\')) && (hasTrackHint(link.getAttribute(\'href\')) || (!markedTrack(link) && !parentTrack(link)))) malformedIdentity = true;\n            return m ? {track:m[1].toLowerCase()+\':\'+m[2],title:String(link.textContent || \'\').replace(/\\s+/g, \' \').trim()} : null;\n        }).filter(Boolean);\n        markedTitleNodes().forEach(function(n) {\n            var value=markedTrack(n);\n            if (value === \'!\') { malformedIdentity = true; return; }\n            if (value) identities.push({track:value, title:String(n.textContent || \'\').replace(/\\s+/g, \' \').trim()});\n        });\n        return !malformedIdentity && identities.some(function(x) { return x.title === expectedTitle; }) && identities.every(function(x) {\n            return x.track === expectedTrack && (!x.title || x.title === expectedTitle);\n        });\n    }\n    function opener() {\n        var list = Array.from(document.querySelectorAll(\'button, [role=\"button\"]\')).filter(function(b) {\n            if (!b.isConnected) return false;\n            var id = testid(b), l = label(b);\n            return /^(control-button-npv|now-playing-view-button)$/i.test(id) ||\n                /^(now playing view|show now playing view|hide now playing view|vue \u00ab ?en cours de lecture ?\u00bb|afficher la vue en cours de lecture|masquer la vue en cours de lecture|en cours de lecture|ansicht \u201el\u00e4uft gerade\u201c|vista de reproducci\u00f3n|tela tocando agora)$/i.test(l);\n        });\n        return list.length === 1 ? list[0] : null;\n    }\n    function pressed(b) { return b.getAttribute(\'aria-pressed\') === \'true\' || b.getAttribute(\'aria-expanded\') === \'true\' || b.getAttribute(\'data-active\') === \'true\'; }\n    function wait(test, ms, done) {\n        var end = Date.now() + ms;\n        (function step() {\n            var v;\n            try { v = test(); } catch (_) { v = null; }\n            if (v || Date.now() >= end) { done(v || null); return; }\n            setTimeout(step, 120);\n        })();\n    }\n    function invalidateLikedRead() {\n        try { if (typeof W.__sfLikedMutationAttempted === \'function\') W.__sfLikedMutationAttempted(); } catch (_) {}\n    }\n    // Open only an explicitly announced add menu, then act only on a unique,\n    // explicitly unchecked Liked Songs item. Never select another playlist.\n    function viaLikeMenu(b, method, after) {\n        var id = testid(b).toLowerCase(), l = label(b), popup = String(b.getAttribute(\'aria-haspopup\') || \'\');\n        // Some Spotify player bars omit aria-haspopup on the generic, unchecked\n        // add-to-playlist trigger. Permit only the known add control in the\n        // already identity-checked player scope; we still act solely on a\n        // fresh, unique, explicitly named Liked Songs checkbox below.\n        var implicitPicker = /^(add-button|add-to-library-button)$/.test(id) && genericAdd(l) && b.getAttribute(\'aria-checked\') === \'false\';\n        if (!/^(true|menu|dialog|listbox)$/i.test(popup) && !implicitPicker) return false;\n        if (!identityMatches()) { log(method + \':menu-identity\'); after(\'identity\', \'unknown\'); return true; }\n        if (!/^(add-button|add-to-library-button)$/.test(id) || labels.like.on.test(l) ||\n            shownState === \'true\' || ((b.getAttribute(\'aria-checked\') === \'true\' || b.getAttribute(\'aria-pressed\') === \'true\') && !genericAdd(l)) ||\n            b.matches(\':disabled\') || b.closest(\'[aria-disabled=\"true\"], fieldset:disabled\')) {\n            log(method + \':menu-unsafe\'); after(\'menu-state\', \'unknown\'); return true;\n        }\n        var selector = \'[role=\"menu\"], [role=\"dialog\"], [role=\"listbox\"]\';\n        function available(n) { return n && n.isConnected && !n.closest(\'[hidden], [aria-hidden=\"true\"]\'); }\n        var before = Array.from(document.querySelectorAll(selector)).filter(available);\n        var expanded = b.getAttribute(\'aria-expanded\') === \'true\', opened = false;\n        function root() {\n            var id = b.getAttribute(\'aria-controls\'), controlled = id && document.getElementById(id);\n            if (available(controlled) && controlled.matches(selector) &&\n                (expanded || before.indexOf(controlled) < 0 || b.getAttribute(\'aria-expanded\') === \'true\')) return controlled;\n            if (expanded) return null;\n            var fresh = Array.from(document.querySelectorAll(selector)).filter(function(n) { return available(n) && before.indexOf(n) < 0; });\n            return fresh.length === 1 ? fresh[0] : null;\n        }\n        function closeMenu(r) {\n            if (!opened) return;\n            try {\n                (available(r) ? r : b).dispatchEvent(new KeyboardEvent(\'keydown\', {key:\'Escape\', code:\'Escape\', bubbles:true, cancelable:true}));\n                log(available(r) && b.getAttribute(\'aria-expanded\') === \'true\' ? method + \':menu-close-unverified\' : method + \':menu-close-requested\');\n            } catch (_) { log(method + \':menu-close-error\'); }\n        }\n        if (!expanded) {\n            try { b.click(); opened = true; log(method + \':menu-open\'); }\n            catch (_) { log(method + \':menu-open-error\'); after(\'menu-absent\', \'unknown\'); return true; }\n        }\n        wait(function() {\n            if (!identityMatches()) return \'identity-changed\';\n            return root();\n        }, 1800, function(r) {\n            if (r === \'identity-changed\') { closeMenu(null); after(\'identity\', \'unknown\'); return; }\n            if (!r) { log(method + \':menu-root\'); closeMenu(null); after(\'menu-absent\', \'unknown\'); return; }\n            var likedName = /^(liked songs|your liked songs|titres lik\u00e9s|vos titres lik\u00e9s|titres que j[\'\u2019]aime|liked-titel|canciones que te gustan|m\u00fasicas curtidas)$/i;\n            function targets() {\n                if (!available(r)) return [];\n                return Array.from(r.querySelectorAll(\'[role=\"menuitemcheckbox\"], [role=\"checkbox\"], input[type=\"checkbox\"]\')).filter(function(n) {\n                    var labelNode = n.closest(\'label\');\n                    var name = String(n.getAttribute(\'aria-label\') || (labelNode && labelNode.textContent) || n.textContent || \'\').replace(/\\s+/g, \' \').trim();\n                    return available(n) && likedName.test(name);\n                });\n            }\n            var candidates = targets();\n            if (candidates.length !== 1) { log(method + (candidates.length ? \':menu-ambiguous\' : \':menu-target\')); closeMenu(r); after(candidates.length ? \'menu-ambiguous\' : \'menu-absent\', \'unknown\'); return; }\n            var target = candidates[0], raw = target.getAttribute(\'aria-checked\');\n            var checked = target.tagName === \'INPUT\' && target.type === \'checkbox\' ? (target.checked ? \'true\' : \'false\') : null;\n            if (checked !== null && raw !== null && raw !== checked) raw = \'unknown\';\n            else if (raw === null) raw = checked;\n            if (target.matches(\':disabled\') || target.closest(\'[aria-disabled=\"true\"], fieldset:disabled\') || (raw !== \'true\' && raw !== \'false\')) {\n                log(method + \':menu-state\'); closeMenu(r); after(\'menu-state\', \'unknown\'); return;\n            }\n            if (raw === \'true\') { log(method + \':menu-liked\'); closeMenu(r); after(\'read\', \'true\'); return; }\n            if (!identityMatches()) { closeMenu(r); after(\'identity\', \'unknown\'); return; }\n            invalidateLikedRead();\n            try { target.click(); log(method + \':menu-add\'); }\n            catch (_) { log(method + \':menu-add-error\'); closeMenu(r); after(\'unconfirmed\', \'unknown\'); return; }\n            wait(function() {\n                if (!identityMatches()) return \'identity-changed\';\n                var current = targets();\n                if (current.length !== 1 || current[0].matches(\':disabled\') || current[0].closest(\'[aria-disabled=\"true\"], fieldset:disabled\')) return null;\n                // React may replace the checkbox after the click; only the\n                // unique explicit Liked Songs item in the same menu is read.\n                var observed = current[0];\n                var a = observed.getAttribute(\'aria-checked\');\n                var c = observed.tagName === \'INPUT\' && observed.type === \'checkbox\' ? observed.checked : null;\n                return (a === \'true\' && c !== false) || (a === null && c === true) ? \'true\' : null;\n            }, 2200, function(state) {\n                closeMenu(r);\n                if (state === \'identity-changed\') { log(method + \':menu-identity\'); after(\'identity\', \'unknown\'); }\n                else if (state === \'true\') { log(method + \':menu-verified\'); after(\'confirmed\', \'true\'); }\n                else { log(method + \':menu-unverified\'); after(\'unconfirmed\', \'false\'); }\n            });\n        });\n        return true;\n    }\n    // Spotify removes a like either directly or through its playlist picker,\n    // where only the unique checked Liked Songs item is unchecked, then Done.\n    function unlike(b, method, after) {\n        var selector = \'[role=\"menu\"], [role=\"dialog\"], [role=\"listbox\"]\';\n        var likedName = /^(liked songs|your liked songs|titres lik\u00e9s|vos titres lik\u00e9s|titres que j[\'\u2019]aime|liked-titel|canciones que te gustan|m\u00fasicas curtidas)$/i;\n        function available(n) { return n && n.isConnected && !n.closest(\'[hidden], [aria-hidden=\"true\"]\'); }\n        var before = Array.from(document.querySelectorAll(selector)).filter(available);\n        var doneRe = /^(termin\u00e9|terminer|done|ok|valider|enregistrer|save)$/i;\n        function doneButtons() { return Array.from(document.querySelectorAll(\'button, [role=\"button\"]\')).filter(function(n) { return available(n) && doneRe.test(String(n.getAttribute(\'aria-label\') || n.textContent || \'\').replace(/\\s+/g, \' \').trim()); }); }\n        var doneBefore = doneButtons();\n        // The picker can render empty first and fill later: wait for the fresh root that holds the target.\n        function fresh() { var f = Array.from(document.querySelectorAll(selector)).filter(function(n) { return available(n) && before.indexOf(n) < 0; }); var withTarget = f.filter(function(n) { return targets(n).length; }); return withTarget.length === 1 ? withTarget[0] : null; }\n        function anyFresh() { return Array.from(document.querySelectorAll(selector)).filter(function(n) { return available(n) && before.indexOf(n) < 0; })[0] || null; }\n        function barState() { var a = find(); return a.node ? read(a.node) : \'unknown\'; }\n        var checkSel = \'[role=\"menuitemcheckbox\"], [role=\"checkbox\"], [role=\"switch\"], input[type=\"checkbox\"], [aria-checked], [aria-pressed]\';\n        function targets(r) {\n            // The Liked Songs name may sit beside its checkbox: climb from the exact\n            // name to the nearest ancestor holding exactly one checkable control.\n            var out = [];\n            Array.from(r.querySelectorAll(\'*\')).forEach(function(n) {\n                if (!available(n) || n.children.length > 1) return;\n                var name = String(n.getAttribute(\'aria-label\') || n.textContent || \'\').replace(/\\s+/g, \' \').trim();\n                if (!likedName.test(name)) return;\n                for (var p = n; p && p !== r.parentNode; p = p.parentElement) {\n                    var c = (p.matches && p.matches(checkSel) ? [p] : []).concat(Array.from(p.querySelectorAll(checkSel))).filter(available);\n                    if (c.length === 1) { if (out.indexOf(c[0]) < 0) out.push(c[0]); return; }\n                    if (c.length > 1) return;\n                }\n            });\n            return out;\n        }\n        function counts(r) { return \'-c\' + Math.min(r.querySelectorAll(checkSel).length, 99) + \'-n\' + Math.min(Array.from(r.querySelectorAll(\'*\')).filter(function(n) { return n.children.length <= 1 && likedName.test(String(n.textContent || \'\').replace(/\\s+/g, \' \').trim()); }).length, 99); }\n        function close(r) { try { (available(r) ? r : b).dispatchEvent(new KeyboardEvent(\'keydown\', {key:\'Escape\', code:\'Escape\', bubbles:true, cancelable:true})); } catch (_) {} }\n        invalidateLikedRead();\n        try { b.click(); log(method + \':unlike-open\'); } catch (_) { after(\'command\', \'true\'); return; }\n        wait(function() {\n            if (!identityMatches()) return \'identity-changed\';\n            if (barState() === \'false\') return \'direct\';\n            return fresh();\n        }, 3500, function(r) {\n            if (r === \'identity-changed\') { after(\'identity\', \'unknown\'); return; }\n            if (r === \'direct\') { log(method + \':unlike-verified\'); after(\'confirmed\', \'false\'); return; }\n            if (!r) { var o = anyFresh(); log(method + (o ? \':unlike-target\' + counts(o) : \':unlike-no-picker\') + \'-d\' + Math.min(document.querySelectorAll(selector).length, 99)); close(o); after(\'menu-absent\', \'true\'); return; }\n            var t = targets(r);\n            if (t.length !== 1) { log(method + (t.length ? \':unlike-ambiguous\' : \':unlike-target\') + counts(r)); close(r); after(t.length ? \'menu-ambiguous\' : \'menu-absent\', \'true\'); return; }\n            var on = t[0].getAttribute(\'aria-checked\') === \'true\' || t[0].checked === true;\n            if (!on) { log(method + \':unlike-not-checked\'); close(r); after(\'menu-state\', \'true\'); return; }\n            try { t[0].click(); log(method + \':unlike-uncheck\'); } catch (_) { close(r); after(\'unconfirmed\', \'true\'); return; }\n            // Spotify\'s picker keeps its Done button in a footer outside the list root, and\n            // closing without it (Escape) discards the change: look for a Done button that\n            // appeared with the picker, inside it first, then anywhere on the page.\n            // Phone 1022277: no Done existed before the uncheck, so it can appear only after it.\n            function findDone() {\n                var d = Array.from(r.querySelectorAll(\'button, [role=\"button\"]\')).filter(function(n) { return available(n) && doneRe.test(String(n.getAttribute(\'aria-label\') || n.textContent || \'\').replace(/\\s+/g, \' \').trim()); });\n                return d.length ? d : doneButtons().filter(function(n) { return doneBefore.indexOf(n) < 0; });\n            }\n            wait(function() {\n                if (!identityMatches()) return \'identity-changed\';\n                var d = findDone(); return d.length === 1 ? d : null;\n            }, 1500, function(found) {\n            if (found === \'identity-changed\') { if (available(r)) close(r); after(\'identity\', \'unknown\'); return; }\n            var done = Array.isArray(found) ? found : [];\n            if (done.length === 1) {\n                try { done[0].click(); log(method + \':unlike-done\'); } catch (_) {}\n                wait(function() {\n                    if (!identityMatches()) return \'identity-changed\';\n                    return barState() === \'false\' ? \'false\' : null;\n                }, 2600, function(st) {\n                    if (available(r)) close(r);\n                    if (st === \'identity-changed\') after(\'identity\', \'unknown\');\n                    else if (st === \'false\') { log(method + \':unlike-verified\'); after(\'confirmed\', \'false\'); }\n                    else { log(method + \':unlike-unverified\'); after(\'unconfirmed\', \'true\'); }\n                });\n                return;\n            }\n            // Some current Spotify menus have no Done button and do not update\n            // the generic player toggle. Confirm only if the exact Liked Songs\n            // checkbox becomes unchecked, survives closing, and remains false\n            // in a freshly reopened menu. Otherwise stay unconfirmed.\n            wait(function() {\n                if (!identityMatches()) return \'identity-changed\';\n                var current = targets(r);\n                return current.length === 1 && current[0].getAttribute(\'aria-checked\') === \'false\' ? \'unchecked\' : null;\n            }, 1200, function(changed) {\n                if (changed !== \'unchecked\') { if (available(r)) close(r); after(changed === \'identity-changed\' ? \'identity\' : \'unconfirmed\', \'true\'); return; }\n                close(r);\n                wait(function() { return !available(r) ? \'closed\' : null; }, 1000, function(closed) {\n                    if (closed !== \'closed\') { after(\'unconfirmed\', \'true\'); return; }\n                    var beforeReopen = Array.from(document.querySelectorAll(selector)).filter(available);\n                    try { b.click(); log(method + \':unlike-recheck-open\'); }\n                    catch (_) { after(\'unconfirmed\', \'true\'); return; }\n                    wait(function() {\n                        if (!identityMatches()) return \'identity-changed\';\n                        var freshMenus = Array.from(document.querySelectorAll(selector)).filter(function(n) { return available(n) && beforeReopen.indexOf(n) < 0; });\n                        var matches = freshMenus.filter(function(n) { return targets(n).length > 0; });\n                        if (matches.length !== 1) return null;\n                        var current = targets(matches[0]);\n                        if (current.length !== 1) return null;\n                        return current[0].getAttribute(\'aria-checked\') === \'false\' ? \'false\' : current[0].getAttribute(\'aria-checked\') === \'true\' ? \'true\' : null;\n                    }, 1800, function(state) {\n                        var reopened = Array.from(document.querySelectorAll(selector)).filter(function(n) { return available(n) && beforeReopen.indexOf(n) < 0; });\n                        if (reopened.length === 1) close(reopened[0]);\n                        if (state === \'identity-changed\') after(\'identity\', \'unknown\');\n                        else if (state === \'false\') { log(method + \':unlike-verified\'); after(\'confirmed\', \'false\'); }\n                        else { log(method + \':unlike-unverified\'); after(\'unconfirmed\', \'true\'); }\n                    });\n                });\n            });\n            });\n        });\n    }\n    // Decide and click on a readable control; verify the change afterwards.\n    function act(found, method, after) {\n        var b = found.node;\n        if (kind === \'like\' && viaLikeMenu(b, method, after)) return;\n        var before = read(b);\n        log(method + \':state-\' + before);\n        if (before === \'unknown\') { after(\'state\', before); return; }\n        if (kind === \'like\') {\n            if (!identityMatches()) { log(method + \':identity\'); after(\'identity\', before); return; }\n            // Remove only when the user tapped a button shown as liked and the page agrees.\n            if (before === \'true\' && shownState === \'true\') { unlike(b, method, after); return; }\n            if (before !== \'false\') { log(method + \':liked-read-only\'); after(\'read\', before); return; }\n            if (shownState === \'true\') { log(method + \':mismatch\'); after(\'read\', before); return; }\n        }\n        if (kind === \'like\') invalidateLikedRead();\n        try { b.click(); log(method + \':click\'); } catch (_) { log(method + \':click-error\'); after(\'command\', before); return; }\n        wait(function() {\n            if (kind === \'like\' && !identityMatches()) return \'identity-changed\';\n            var again = find();\n            if (!again.node) return null;\n            var s = read(again.node);\n            return s !== before && s !== \'unknown\' ? s : null;\n        }, 2200, function(s) {\n            if (s === \'identity-changed\') { log(method + \':identity\'); after(\'identity\', \'unknown\'); }\n            else if (s) { log(method + \':verified\'); after(\'confirmed\', s); }\n            else { log(method + \':unverified\'); after(\'unconfirmed\', before); }\n        });\n    }\n    // App-side repeat-one when Spotify\'s repeat is greyed: just before the end, seek back to 0.\n    function clockMs(sel) {\n        var e = document.querySelector(sel); var t = e ? String(e.textContent || \'\').trim() : \'\';\n        if (!/^\\d+(:\\d{2}){1,2}$/.test(t)) return -1;\n        return t.split(\':\').reduce(function(a, x) { return a * 60 + Number(x); }, 0) * 1000;\n    }\n    function appLoop() {\n        var on = !W.__melodixLoop; W.__melodixLoop = on;\n        if (W.__melodixLoopTimer) { W.clearInterval(W.__melodixLoopTimer); W.__melodixLoopTimer = 0; }\n        if (on) W.__melodixLoopTimer = W.setInterval(function() {\n            var pos = clockMs(\'[data-testid=\"playback-position\"]\'), dur = clockMs(\'[data-testid=\"playback-duration\"]\');\n            if (pos < 0 || dur < 10000 || pos < dur - 2000) return;\n            try { if (typeof W.actSeek === \'function\') W.actSeek(0); } catch (_) {}\n        }, 500);\n        log(\'c:app-loop-\' + (on ? \'on\' : \'off\')); finish(\'confirmed\', on ? \'true\' : \'false\', \'app-loop\');\n    }\n    function viaKeyboard() {\n        if (kind === \'like\') { log(\'c:like-skipped\'); finish(\'failed\', \'unknown\', \'\'); return; }\n        // Blind Alt+R could switch on repeat-one unseen and block skipping (user report 1022295).\n        if (kind === \'repeat\') { log(\'c:repeat-skipped\'); finish(\'failed\', \'unknown\', \'\'); return; }\n        var spec = kind === \'shuffle\' ? {key: \'s\', code: \'KeyS\', keyCode: 83} : {key: \'r\', code: \'KeyR\', keyCode: 82};\n        // Unverifiable when no control is readable, so only ONE combination per\n        // tap (two could cancel each other). Spotify\'s web player uses Alt+S / Alt+R.\n        var ctrl = false;\n        try {\n            var target = document.activeElement && document.activeElement !== document.body ? document.activeElement : document.body;\n            [\'keydown\', \'keyup\'].forEach(function(type) {\n                target.dispatchEvent(new KeyboardEvent(type, {key: spec.key, code: spec.code, keyCode: spec.keyCode, which: spec.keyCode, ctrlKey: ctrl, altKey: !ctrl, bubbles: true, cancelable: true}));\n            });\n            log(\'c:\' + (ctrl ? \'ctrl-\' : \'alt-\') + spec.key); log(\'c:single-unreadable\');\n            finish(\'unverified\', \'unknown\', \'keyboard\');\n        } catch (_) { log(\'c:error\'); finish(\'failed\', \'unknown\', \'\'); }\n    }\n    function result(outcome, state, method) {\n        if (outcome === \'confirmed\' || outcome === \'unconfirmed\' || outcome === \'read\') finish(outcome, state, method);\n        else if (outcome === \'identity\' || outcome === \'menu-absent\' || outcome === \'menu-ambiguous\' || outcome === \'menu-state\') finish(outcome, \'unknown\', method);\n        else finish(\'failed\', state, method);\n    }\n    try {\n        var direct = find();\n        try { log(\'vw:\' + Math.round((W.innerWidth || 0) / 100) * 100); } catch (_) {}\n        log(\'a:\' + (direct.node ? \'found\' : direct.reason));\n        if (direct.node && !direct.reason) { act(direct, \'a\', function(o, s) { result(o, s, \'direct\'); }); return JSON.stringify({status: \'started\'}); }\n        if (direct.reason === \'disabled\') {\n            // User request (1022301): Spotify greys these on this account; try another way.\n            if (kind === \'shuffle\') { log(\'a:disabled\'); viaKeyboard(); return JSON.stringify({status: \'started\'}); }\n            if (kind === \'repeat\') { log(\'a:disabled\'); appLoop(); return JSON.stringify({status: \'started\'}); }\n            finish(\'disabled\', \'unknown\', \'direct\'); return JSON.stringify({status: \'started\'});\n        }\n        var view = opener();\n        if (!view) { log(\'b:no-opener\'); viaKeyboard(); return JSON.stringify({status: \'started\'}); }\n        var wasOpen = pressed(view);\n        if (!wasOpen) { try { view.click(); log(\'b:opened\'); } catch (_) { log(\'b:open-error\'); } }\n        else log(\'b:already-open\');\n        var closeView = function() {\n            if (!wasOpen) {\n                setTimeout(function() {\n                    var again = opener();\n                    try { if (again && pressed(again)) { again.click(); log(\'b:closed\'); } } catch (_) { log(\'b:close-error\'); }\n                }, 150);\n            }\n        };\n        wait(function() { var f = find(); return f.node && !f.reason ? f : null; }, 1800, function(found) {\n            if (!found) { log(\'b:absent\'); closeView(); viaKeyboard(); return; }\n            log(\'b:found\');\n            act(found, \'b\', function(o, s) { closeView(); result(o, s, \'now-playing-view\'); });\n        });\n        return JSON.stringify({status: \'started\'});\n    } catch (_) {\n        finish(\'failed\', \'unknown\', \'\');\n        return JSON.stringify({status: \'started\'});\n    }\n})\n"

.field private static final LOCKED:Ljava/lang/String; = "Lecture al\u00e9atoire activ\u00e9e (impos\u00e9e par Spotify)"

.field private static final SCRIPT:Ljava/lang/String; = "(function(kind, action, expectedState, expectedTrack, expectedTitle) {\n    \'use strict\';\n    // Passive inspection of controls already in the page. A tap can only click\n    // a uniquely identified real control, after state/identity revalidation.\n    var labels = {\n        like: {\n            off: /^(save to your library|add to (your )?(liked songs|library)|ajouter (\u00e0|aux) (la biblioth\u00e8que|titres lik\u00e9s)|enregistrer dans (votre |la )?biblioth\u00e8que|in (deine |der )?bibliothek (aufnehmen|hinzuf\u00fcgen)|a\u00f1adir a (tu )?biblioteca|adicionar (\u00e0 biblioteca|aos t\u00edtulos curtidos))$/i,\n            on: /^(remove from (your )?(library|liked songs)|retirer (de la biblioth\u00e8que|des titres lik\u00e9s)|supprimer de (votre |la )?biblioth\u00e8que|aus (deiner |der )?bibliothek entfernen|quitar de (tu )?biblioteca|remover (da biblioteca|dos t\u00edtulos curtidos))$/i\n        },\n        repeat: {\n            // A label can safely distinguish off from enabled, but not list\n            // from one-track unless the page supplies an explicit mixed state.\n            off: /^(enable repeat|turn repeat on|activer la r\u00e9p\u00e9tition|wiederholung aktivieren|activar repetici\u00f3n|ativar repeti\u00e7\u00e3o)$/i,\n            on: /^(disable repeat|turn repeat off|d\u00e9sactiver la r\u00e9p\u00e9tition|wiederholung deaktivieren|desactivar repetici\u00f3n|desativar repeti\u00e7\u00e3o)$/i\n        },\n        shuffle: {\n            off: /^(enable shuffle|turn shuffle on|activate shuffle|activer (la lecture |le mode |l[\'\u2019])?al\u00e9atoire|zufallswiedergabe aktivieren|activar (el modo |la reproducci\u00f3n )?aleatori[oa]|ativar (a reprodu\u00e7\u00e3o )?aleat\u00f3ria)$/i,\n            on: /^(disable shuffle|turn shuffle off|deactivate shuffle|d\u00e9sactiver (la lecture |le mode |l[\'\u2019])?al\u00e9atoire|zufallswiedergabe deaktivieren|desactivar (el modo |la reproducci\u00f3n )?aleatori[oa]|desativar (a reprodu\u00e7\u00e3o )?aleat\u00f3ria)$/i\n        }\n    };\n    if ([\'like\',\'shuffle\',\'repeat\'].indexOf(kind) < 0) return JSON.stringify({state:\'unknown\',reason:\'control\'});\n    (function() {\n        var word = /(titres lik\u00e9s|liked songs|lik\u00e9|liked|favori|biblioth\u00e8que|library|biblioteca|bibliothek)/i, off = labels.like.off, on = labels.like.on;\n        labels.like.off = {test: function(l) { return off.test(l) || (word.test(l) && /^(ajouter|add|enregistrer|save|a\u00f1adir|adicionar|hinzuf\u00fcgen|zu)\\b/i.test(l)); }};\n        labels.like.on = {test: function(l) { return on.test(l) || (word.test(l) && /^(ajout\u00e9|retirer|supprimer|remove|enregistr\u00e9|saved|added|quitar|remover|entfernen)/i.test(l)); }};\n    })();\n    // Spotify\'s \"+\" save button: generic \"Ajouter...\" label, state in aria-checked.\n    function genericAdd(l) { return /^(ajouter|add|enregistrer|save)\\b/i.test(l) && !/(titres lik\u00e9s|liked songs|biblioth\u00e8que|library|file d[\'\u2019]attente|queue)/i.test(l); }\n    var selector = kind === \'like\' ?\n        \':is([data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-widget-v2\"]) button, [data-testid=\"now-playing-bar\"] button, [data-testid=\"now-playing-view\"] button, [data-testid=\"now-playing-panel\"] button, :is([data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-widget-v2\"]) [role=\"button\"], [data-testid=\"now-playing-bar\"] [role=\"button\"], [data-testid=\"now-playing-view\"] [role=\"button\"], [data-testid=\"now-playing-panel\"] [role=\"button\"], :is([data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-widget-v2\"]) [role=\"switch\"], [data-testid=\"now-playing-bar\"] [role=\"switch\"], [data-testid=\"now-playing-view\"] [role=\"switch\"], [data-testid=\"now-playing-panel\"] [role=\"switch\"]\' :\n        kind === \'shuffle\' ? \'button[data-testid*=\"shuffle\" i], button[aria-label], [role=\"button\"][aria-label], [role=\"switch\"][aria-label]\' :\n        \'button[data-testid=\"control-button-repeat\"], [role=\"button\"][data-testid=\"control-button-repeat\"], button[aria-label], [role=\"button\"][aria-label]\';\n    var nodes = Array.from(document.querySelectorAll(selector)).filter(function(b) {\n        if (!b.isConnected) return false;\n        var id=String(b.getAttribute(\'data-testid\')||\'\').toLowerCase();\n        var label=String(b.getAttribute(\'aria-label\')||\'\').trim();\n        if (kind === \'like\') return /^(add-button|remove-button|add-to-library-button|remove-from-library-button)$/.test(id) || labels.like.off.test(label) || labels.like.on.test(label) || (b.hasAttribute(\'aria-checked\') && genericAdd(label));\n        if (kind === \'repeat\') return id===\'control-button-repeat\' || labels.repeat.off.test(label) || labels.repeat.on.test(label);\n        return /shuffle/.test(id) || labels.shuffle.off.test(label) || labels.shuffle.on.test(label);\n    });\n    var result={state:\'unknown\',track:\'\',title:\'\',reason:\'control\',sent:false};\n    // Current player links only, including Spotify\'s unmarked track links.\n    // Every track href must agree; a non-empty title must also agree. Never\n    // take an identity from a playlist, search result or unrelated page node.\n    // Spotify\'s bar title links to the album with the track in ?highlight=spotify:track:ID.\n    function trackHref(h) {\n        h = String(h || \'\');\n        // A Spotify URI is a complete identity, unlike an album or title.\n        var uri = /^spotify:(track|episode):([a-z0-9]+)$/i.exec(h);\n        if (uri) return uri;\n        var m = /^(?:https:\\/\\/open\\.spotify\\.com)?\\/(?:intl-[a-z]{2}(?:-[a-z]{2})?\\/)?(track|episode)\\/([a-z0-9]+)\\/?(?:[?#].*)?$/i.exec(h);\n        if (m) return m;\n        var a = /^(?:https:\\/\\/open\\.spotify\\.com)?\\/(?:intl-[a-z]{2}(?:-[a-z]{2})?\\/)?album\\/[a-z0-9]+\\/?\\?(?:[^#]*&)?highlight=spotify(?::|%3a)(track)(?::|%3a)([a-z0-9]+)(?:[&#].*)?$/i.exec(h);\n        if (a) {\n            // Duplicate highlight keys, including encoded/case variants,\n            // have ambiguous semantics. Never choose one arbitrarily.\n            try {\n                var query = new URL(h, \'https://open.spotify.com\').searchParams;\n                var values = [];\n                query.forEach(function(value, key) { if (key.toLowerCase() === \'highlight\') values.push(value); });\n                if (values.length !== 1 || !/^spotify:track:[a-z0-9]+$/i.test(values[0])) return null;\n                var parts = /^spotify:(track):([a-z0-9]+)$/i.exec(values[0]);\n                return [a[0], parts[1], parts[2]];\n            } catch (_) { return null; }\n        }\n        return null; // album + title does not uniquely identify a track\n    }\n    // Explicit track URIs on the current-player title only; never infer a\n    // track from an album, playlist, title alone, or an unrelated page row.\n    function markedTrack(n) {\n        if (!/^(context-item-link|nowplaying-track-link|context-item-info-title)$/i.test(String(n.getAttribute(\'data-testid\') || \'\'))) return \'\';\n        var result = \'\';\n        for (var name of [\'data-uri\', \'data-track-uri\', \'data-spotify-uri\']) {\n            if (!n.hasAttribute(name)) continue;\n            var m = /^spotify:(track|episode):([a-z0-9]+)$/i.exec(String(n.getAttribute(name) || \'\'));\n            if (!m) return \'!\';\n            var value = m[1].toLowerCase()+\':\'+m[2];\n            if (result && result !== value) return \'!\';\n            result = value;\n        }\n        return result;\n    }\n    // If a title link itself carries a malformed track hint, an attribute\n    // must not mask that ambiguity. Album-only links may use their explicit\n    // current-title parent marker, but never one outside the player bar.\n    function hasTrackHint(h) {\n        h=String(h||\'\');\n        if (/^spotify:(track|episode):/i.test(h) || /\\/(track|episode)\\//i.test(h)) return true;\n        try {\n            var found=false;\n            new URL(h, \'https://open.spotify.com\').searchParams.forEach(function(v,k){if(k.toLowerCase()===\'highlight\')found=true;});\n            return found;\n        } catch (_) { return true; }\n    }\n    function parentTrack(link) {\n        var n=link.closest(\'[data-testid=\"context-item-info-title\"]\');\n        if(!n || !n.closest(\':is([data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-widget-v2\"]), [data-testid=\"now-playing-bar\"]\')) return \'\';\n        return markedTrack(n);\n    }\n    function markedTitleNodes() {\n        return Array.from(document.querySelectorAll(\':is([data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-widget-v2\"]) [data-testid=\"context-item-link\"], :is([data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-widget-v2\"]) [data-testid=\"nowplaying-track-link\"], :is([data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-widget-v2\"]) [data-testid=\"context-item-info-title\"], [data-testid=\"now-playing-bar\"] [data-testid=\"context-item-link\"], [data-testid=\"now-playing-bar\"] [data-testid=\"nowplaying-track-link\"], [data-testid=\"now-playing-bar\"] [data-testid=\"context-item-info-title\"]\')).filter(function(n) { return n.isConnected; });\n    }\n    if (kind === \'like\') {\n        var anchors = Array.from(document.querySelectorAll(\':is([data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-widget-v2\"]) a[href], [data-testid=\"now-playing-bar\"] a[href]\'));\n        var malformedIdentity = false, conflictIdentity = false;\n        var identities = anchors.map(function(link) {\n            var match = trackHref(String(link.getAttribute(\'href\') || \'\'));\n            if (!match && /^(context-item-link|nowplaying-track-link)$/i.test(String(link.getAttribute(\'data-testid\') || \'\')) && (hasTrackHint(link.getAttribute(\'href\')) || (!markedTrack(link) && !parentTrack(link)))) malformedIdentity = true;\n            return match ? {track:match[1].toLowerCase()+\':\'+match[2],title:String(link.textContent || \'\').replace(/\\s+/g, \' \').trim()} : null;\n        }).filter(Boolean);\n        markedTitleNodes().forEach(function(n) {\n            var value=markedTrack(n);\n            if (value === \'!\') { malformedIdentity = conflictIdentity = true; return; }\n            if (value) identities.push({track:value, title:String(n.textContent || \'\').replace(/\\s+/g, \' \').trim()});\n        });\n        var named = identities.filter(function(x) { return !!x.title; });\n        if (!malformedIdentity && named.length && identities.every(function(x) { return x.track === named[0].track && (!x.title || x.title === named[0].title); })) {\n            result.track=named[0].track; result.title=named[0].title;\n        }\n        // Spotify\'s newer bar carries no track id. The exact native title shown\n        // as a leaf in the bar identifies the current track (add-only like).\n        if (!result.track && !conflictIdentity && !identities.length && expectedTitle && !anchors.some(function(l) { return hasTrackHint(l.getAttribute(\'href\')); }) && Array.from(document.querySelectorAll(\':is([data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-widget-v2\"]), [data-testid=\"now-playing-bar\"]\')).some(function(r) {\n            return String(r.textContent || \'\').replace(/\\s+/g, \' \').toLowerCase().indexOf(String(expectedTitle).replace(/\\s+/g, \' \').trim().toLowerCase()) >= 0;\n        })) { result.track=\'title:\'+expectedTitle; result.title=expectedTitle; }\n    }\n\n    if (!nodes.length) {\n        var hasBar = !!document.querySelector(\'[data-testid=\"now-playing-bar\"], :is([data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-widget-v2\"]), [data-testid=\"player-controls\"]\');\n        // With the player bar present and no such control anywhere in the page,\n        // say so (\'absent\'); without the bar the control may simply not be shown yet.\n        result.reason = document.readyState === \'loading\' ? \'page\' : (kind === \'shuffle\' && !hasBar ? \'bar\' : hasBar ? \'absent\' : \'control\');\n        return JSON.stringify(result);\n    }\n    if (nodes.length !== 1) {result.reason=\'ambiguous\';return JSON.stringify(result);}\n    var button=nodes[0];\n    if (button.disabled || button.matches(\':disabled\') || button.closest(\'[aria-disabled=\"true\"]\')) {\n        var description=String(button.getAttribute(\'aria-description\')||\'\').trim();\n        result.reason=kind===\'shuffle\' && /^(shuffle is not available (with|for) (this account|this playback)|l[\'\u2019]al\u00e9atoire n[\'\u2019]est pas disponible avec (ce compte|cette lecture))$/i.test(description)?\'restriction\':\'disabled\';\n        return JSON.stringify(result);\n    }\n    if (kind === \'like\' && /^(true|menu|dialog|listbox|tree|grid)$/i.test(String(button.getAttribute(\'aria-haspopup\')||\'\'))) {result.reason=\'menu\';return JSON.stringify(result);}\n    var raw=button.getAttribute(\'aria-checked\');\n    var pressed=button.getAttribute(\'aria-pressed\');\n    if (kind === \'like\' && raw !== null && pressed !== null && raw !== pressed) {result.reason=\'conflict\';return JSON.stringify(result);}\n    if (raw === null) raw=pressed;\n    var label=String(button.getAttribute(\'aria-label\')||\'\').trim();\n    if (raw === null) {\n        raw=labels[kind].on.test(label) ? \'true\' :\n            labels[kind].off.test(label) ? \'false\' : \'unknown\';\n    } else if (raw !== \'true\' && raw !== \'false\' && !(kind !== \'like\' && raw === \'mixed\')) raw=\'unknown\';\n    if (kind === \'like\') {\n        // A false ARIA value must never override a removal action. An\n        // unlabeled generic add-button can be a playlist menu, not a like.\n        var testId=String(button.getAttribute(\'data-testid\')||\'\').toLowerCase();\n        var removeId=/^(remove-button|remove-from-library-button)$/.test(testId);\n        var offLabel=labels.like.off.test(label), onLabel=labels.like.on.test(label);\n        // Once liked, Spotify relabels the checked button to a generic \"Ajouter \u00e0 une playlist\" (phone 1022229).\n        if (!offLabel && !onLabel && raw===\'true\' && button.getAttribute(\'aria-checked\')===\'true\' && genericAdd(label)) onLabel=true;\n        if ((raw===\'false\' && (onLabel||removeId)) || (raw===\'true\' && offLabel)) {\n            result.reason=\'conflict\';return JSON.stringify(result);\n        }\n        if (!offLabel && !onLabel) {result.reason=\'unverified\';return JSON.stringify(result);}\n        // Display-only reads need no identity; a click (invoke) still does.\n        if ((!result.track || !result.title) && action !== \'query\') {result.reason=\'identity\';return JSON.stringify(result);}\n    }\n    if (raw === \'unknown\') {result.reason=\'state\';return JSON.stringify(result);}\n    if (typeof button.click !== \'function\') {result.reason=\'command\';return JSON.stringify(result);}\n    result.state=raw;result.reason=\'\';\n    if (action === \'query\') return JSON.stringify(result);\n    if (action !== \'invoke\' || raw !== expectedState ||\n        (kind === \'like\' && (raw !== \'false\' || result.track !== expectedTrack || result.title !== expectedTitle))) return JSON.stringify({sent:false});\n    try {\n        // Use the exact revalidated button; never call a legacy helper that\n        // schedules playback-related work. Never click an already-liked item.\n        button.click();\n        return JSON.stringify({sent:true});\n    } catch (_) { return JSON.stringify({sent:false}); }\n})\n"

.field private static final TAP_GUARD_MS:J = 0x190L

.field private static final after:[Ljava/lang/String;

.field private static appLoop:Z

.field private static appLoopSeen:Z

.field private static final before:[Ljava/lang/String;

.field private static final last:[Ljava/lang/String;

.field private static final methods:[Ljava/lang/String;

.field private static final outcome:[Ljava/lang/String;

.field private static shuffleLocked:Z

.field private static structure:Ljava/lang/String;


# instance fields
.field private generation:J

.field private final handler:Landroid/os/Handler;

.field private kind:Ljava/lang/String;

.field private lastIcon:I

.field private lastTap:J

.field private observedPending:Z

.field private pending:Z

.field private pendingState:Ljava/lang/String;

.field private pendingTitle:Ljava/lang/String;

.field private pendingTrack:Ljava/lang/String;

.field private queryInFlight:Z

.field private querySerial:J

.field private queryStarted:J

.field private reason:Ljava/lang/String;

.field private remembered:Ljava/lang/String;

.field private rememberedTitle:Ljava/lang/String;

.field private running:Z

.field private state:Ljava/lang/String;

.field private final tick:Ljava/lang/Runnable;

.field private title:Ljava/lang/String;

.field private track:Ljava/lang/String;

.field private visibleSince:J


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 28
    const-string v0, "non observ\u00e9"

    filled-new-array {v0, v0, v0}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/melodix/music/PreviewPlayerMode;->last:[Ljava/lang/String;

    const-string v0, "aucun appui"

    filled-new-array {v0, v0, v0}, [Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/melodix/music/PreviewPlayerMode;->before:[Ljava/lang/String;

    filled-new-array {v0, v0, v0}, [Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/melodix/music/PreviewPlayerMode;->after:[Ljava/lang/String;

    filled-new-array {v0, v0, v0}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/melodix/music/PreviewPlayerMode;->outcome:[Ljava/lang/String;

    .line 29
    const-string v0, "non observ\u00e9e"

    sput-object v0, Lcom/melodix/music/PreviewPlayerMode;->structure:Ljava/lang/String;

    .line 30
    const-string v0, "aucune"

    filled-new-array {v0, v0, v0}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/melodix/music/PreviewPlayerMode;->methods:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    .line 84
    invoke-direct {p0, p1, p2}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 60
    new-instance p1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object p2

    invoke-direct {p1, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerMode;->handler:Landroid/os/Handler;

    .line 61
    const-string p1, ""

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string p2, "unknown"

    iput-object p2, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerMode;->track:Ljava/lang/String;

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerMode;->title:Ljava/lang/String;

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerMode;->pendingState:Ljava/lang/String;

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerMode;->pendingTrack:Ljava/lang/String;

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerMode;->pendingTitle:Ljava/lang/String;

    const-string p2, "web"

    iput-object p2, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    .line 69
    const-wide/16 v0, -0x3e8

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode;->lastTap:J

    .line 71
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerMode;->remembered:Ljava/lang/String;

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerMode;->rememberedTitle:Ljava/lang/String;

    .line 78
    new-instance p1, Lcom/melodix/music/PreviewPlayerMode$1;

    invoke-direct {p1, p0}, Lcom/melodix/music/PreviewPlayerMode$1;-><init>(Lcom/melodix/music/PreviewPlayerMode;)V

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerMode;->tick:Ljava/lang/Runnable;

    .line 264
    const/4 p1, 0x0

    iput p1, p0, Lcom/melodix/music/PreviewPlayerMode;->lastIcon:I

    .line 84
    invoke-virtual {p0, p1}, Lcom/melodix/music/PreviewPlayerMode;->setEnabled(Z)V

    .line 85
    new-instance p1, Lcom/melodix/music/PreviewPlayerMode$2;

    invoke-direct {p1, p0}, Lcom/melodix/music/PreviewPlayerMode$2;-><init>(Lcom/melodix/music/PreviewPlayerMode;)V

    invoke-virtual {p0, p1}, Lcom/melodix/music/PreviewPlayerMode;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 86
    return-void
.end method

.method static synthetic access$000(Lcom/melodix/music/PreviewPlayerMode;)Z
    .locals 0

    .line 23
    iget-boolean p0, p0, Lcom/melodix/music/PreviewPlayerMode;->running:Z

    return p0
.end method

.method static synthetic access$100(Lcom/melodix/music/PreviewPlayerMode;)V
    .locals 0

    .line 23
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->paint()V

    return-void
.end method

.method static synthetic access$1000(Lcom/melodix/music/PreviewPlayerMode;)Ljava/lang/String;
    .locals 0

    .line 23
    iget-object p0, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$1100(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)Z
    .locals 0

    .line 23
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerMode;->sameNativeTitle(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$1200(Lcom/melodix/music/PreviewPlayerMode;)Z
    .locals 0

    .line 23
    iget-boolean p0, p0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    return p0
.end method

.method static synthetic access$1202(Lcom/melodix/music/PreviewPlayerMode;Z)Z
    .locals 0

    .line 23
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    return p1
.end method

.method static synthetic access$1302(Lcom/melodix/music/PreviewPlayerMode;Z)Z
    .locals 0

    .line 23
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerMode;->observedPending:Z

    return p1
.end method

.method static synthetic access$1400(Lcom/melodix/music/PreviewPlayerMode;)Ljava/lang/String;
    .locals 0

    .line 23
    iget-object p0, p0, Lcom/melodix/music/PreviewPlayerMode;->pendingState:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$1500(Lcom/melodix/music/PreviewPlayerMode;)I
    .locals 0

    .line 23
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->diagnosticIndex()I

    move-result p0

    return p0
.end method

.method static synthetic access$1600()[Ljava/lang/String;
    .locals 1

    .line 23
    sget-object v0, Lcom/melodix/music/PreviewPlayerMode;->outcome:[Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1700(Lcom/melodix/music/PreviewPlayerMode;)Ljava/lang/String;
    .locals 0

    .line 23
    iget-object p0, p0, Lcom/melodix/music/PreviewPlayerMode;->remembered:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$1702(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 23
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerMode;->remembered:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$1800(Lcom/melodix/music/PreviewPlayerMode;)Ljava/lang/String;
    .locals 0

    .line 23
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->nativeTitle()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1900(Lcom/melodix/music/PreviewPlayerMode;)Ljava/lang/String;
    .locals 0

    .line 23
    iget-object p0, p0, Lcom/melodix/music/PreviewPlayerMode;->rememberedTitle:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$1902(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 23
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerMode;->rememberedTitle:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$200(Lcom/melodix/music/PreviewPlayerMode;)V
    .locals 0

    .line 23
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->observe()V

    return-void
.end method

.method static synthetic access$2002(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 23
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$2102(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 23
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerMode;->track:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$2202(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 23
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerMode;->title:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$2302(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 23
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$2400(Lcom/melodix/music/PreviewPlayerMode;)V
    .locals 0

    .line 23
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->notConfirmed()V

    return-void
.end method

.method static synthetic access$2500(Lcom/melodix/music/PreviewPlayerMode;JI)V
    .locals 0

    .line 23
    invoke-direct {p0, p1, p2, p3}, Lcom/melodix/music/PreviewPlayerMode;->poll(JI)V

    return-void
.end method

.method static synthetic access$2600(Lcom/melodix/music/PreviewPlayerMode;)Landroid/webkit/WebView;
    .locals 0

    .line 23
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->web()Landroid/webkit/WebView;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$2700(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 23
    invoke-direct {p0, p1, p2}, Lcom/melodix/music/PreviewPlayerMode;->job(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$2800(Lcom/melodix/music/PreviewPlayerMode;Lorg/json/JSONObject;)V
    .locals 0

    .line 23
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerMode;->finishJob(Lorg/json/JSONObject;)V

    return-void
.end method

.method static synthetic access$2900(Lcom/melodix/music/PreviewPlayerMode;)V
    .locals 0

    .line 23
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->sync()V

    return-void
.end method

.method static synthetic access$300(Lcom/melodix/music/PreviewPlayerMode;)Landroid/os/Handler;
    .locals 0

    .line 23
    iget-object p0, p0, Lcom/melodix/music/PreviewPlayerMode;->handler:Landroid/os/Handler;

    return-object p0
.end method

.method static synthetic access$400(Lcom/melodix/music/PreviewPlayerMode;)V
    .locals 0

    .line 23
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->invoke()V

    return-void
.end method

.method static synthetic access$500(Lcom/melodix/music/PreviewPlayerMode;)J
    .locals 2

    .line 23
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode;->generation:J

    return-wide v0
.end method

.method static synthetic access$600(Lcom/melodix/music/PreviewPlayerMode;)J
    .locals 2

    .line 23
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode;->querySerial:J

    return-wide v0
.end method

.method static synthetic access$702(Lcom/melodix/music/PreviewPlayerMode;Z)Z
    .locals 0

    .line 23
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerMode;->queryInFlight:Z

    return p1
.end method

.method static synthetic access$800(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 0

    .line 23
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerMode;->parse(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$900(Lcom/melodix/music/PreviewPlayerMode;Lorg/json/JSONObject;)V
    .locals 0

    .line 23
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerMode;->remember(Lorg/json/JSONObject;)V

    return-void
.end method

.method private activity()Landroid/app/Activity;
    .locals 3

    .line 88
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 89
    const/4 v1, 0x0

    :goto_0
    const/16 v2, 0x8

    if-ge v1, v2, :cond_2

    instance-of v2, v0, Landroid/content/ContextWrapper;

    if-eqz v2, :cond_2

    .line 90
    instance-of v2, v0, Landroid/app/Activity;

    if-eqz v2, :cond_0

    check-cast v0, Landroid/app/Activity;

    return-object v0

    .line 91
    :cond_0
    move-object v2, v0

    check-cast v2, Landroid/content/ContextWrapper;

    invoke-virtual {v2}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object v2

    if-ne v2, v0, :cond_1

    goto :goto_1

    .line 89
    :cond_1
    add-int/lit8 v1, v1, 0x1

    move-object v0, v2

    goto :goto_0

    .line 93
    :cond_2
    :goto_1
    instance-of v1, v0, Landroid/app/Activity;

    if-eqz v1, :cond_3

    check-cast v0, Landroid/app/Activity;

    goto :goto_2

    :cond_3
    const/4 v0, 0x0

    :goto_2
    return-object v0
.end method

.method private static allowed(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 34
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "|"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const-string p0, "unknown"

    :goto_0
    return-object p0
.end method

.method private beginDiagnostic()V
    .locals 3

    .line 55
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->diagnosticIndex()I

    move-result v0

    if-ltz v0, :cond_0

    sget-object v1, Lcom/melodix/music/PreviewPlayerMode;->before:[Ljava/lang/String;

    sget-object v2, Lcom/melodix/music/PreviewPlayerMode;->last:[Ljava/lang/String;

    aget-object v2, v2, v0

    aput-object v2, v1, v0

    sget-object v1, Lcom/melodix/music/PreviewPlayerMode;->after:[Ljava/lang/String;

    const-string v2, "en attente d\'observation"

    aput-object v2, v1, v0

    sget-object v1, Lcom/melodix/music/PreviewPlayerMode;->outcome:[Ljava/lang/String;

    const-string v2, "en attente"

    aput-object v2, v1, v0

    :cond_0
    return-void
.end method

.method private call(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 101
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "(function(){var r=JSON.parse(((function(kind, action, expectedState, expectedTrack, expectedTitle) {\n    \'use strict\';\n    // Passive inspection of controls already in the page. A tap can only click\n    // a uniquely identified real control, after state/identity revalidation.\n    var labels = {\n        like: {\n            off: /^(save to your library|add to (your )?(liked songs|library)|ajouter (\u00e0|aux) (la biblioth\u00e8que|titres lik\u00e9s)|enregistrer dans (votre |la )?biblioth\u00e8que|in (deine |der )?bibliothek (aufnehmen|hinzuf\u00fcgen)|a\u00f1adir a (tu )?biblioteca|adicionar (\u00e0 biblioteca|aos t\u00edtulos curtidos))$/i,\n            on: /^(remove from (your )?(library|liked songs)|retirer (de la biblioth\u00e8que|des titres lik\u00e9s)|supprimer de (votre |la )?biblioth\u00e8que|aus (deiner |der )?bibliothek entfernen|quitar de (tu )?biblioteca|remover (da biblioteca|dos t\u00edtulos curtidos))$/i\n        },\n        repeat: {\n            // A label can safely distinguish off from enabled, but not list\n            // from one-track unless the page supplies an explicit mixed state.\n            off: /^(enable repeat|turn repeat on|activer la r\u00e9p\u00e9tition|wiederholung aktivieren|activar repetici\u00f3n|ativar repeti\u00e7\u00e3o)$/i,\n            on: /^(disable repeat|turn repeat off|d\u00e9sactiver la r\u00e9p\u00e9tition|wiederholung deaktivieren|desactivar repetici\u00f3n|desativar repeti\u00e7\u00e3o)$/i\n        },\n        shuffle: {\n            off: /^(enable shuffle|turn shuffle on|activate shuffle|activer (la lecture |le mode |l[\'\u2019])?al\u00e9atoire|zufallswiedergabe aktivieren|activar (el modo |la reproducci\u00f3n )?aleatori[oa]|ativar (a reprodu\u00e7\u00e3o )?aleat\u00f3ria)$/i,\n            on: /^(disable shuffle|turn shuffle off|deactivate shuffle|d\u00e9sactiver (la lecture |le mode |l[\'\u2019])?al\u00e9atoire|zufallswiedergabe deaktivieren|desactivar (el modo |la reproducci\u00f3n )?aleatori[oa]|desativar (a reprodu\u00e7\u00e3o )?aleat\u00f3ria)$/i\n        }\n    };\n    if ([\'like\',\'shuffle\',\'repeat\'].indexOf(kind) < 0) return JSON.stringify({state:\'unknown\',reason:\'control\'});\n    (function() {\n        var word = /(titres lik\u00e9s|liked songs|lik\u00e9|liked|favori|biblioth\u00e8que|library|biblioteca|bibliothek)/i, off = labels.like.off, on = labels.like.on;\n        labels.like.off = {test: function(l) { return off.test(l) || (word.test(l) && /^(ajouter|add|enregistrer|save|a\u00f1adir|adicionar|hinzuf\u00fcgen|zu)\\b/i.test(l)); }};\n        labels.like.on = {test: function(l) { return on.test(l) || (word.test(l) && /^(ajout\u00e9|retirer|supprimer|remove|enregistr\u00e9|saved|added|quitar|remover|entfernen)/i.test(l)); }};\n    })();\n    // Spotify\'s \"+\" save button: generic \"Ajouter...\" label, state in aria-checked.\n    function genericAdd(l) { return /^(ajouter|add|enregistrer|save)\\b/i.test(l) && !/(titres lik\u00e9s|liked songs|biblioth\u00e8que|library|file d[\'\u2019]attente|queue)/i.test(l); }\n    var selector = kind === \'like\' ?\n        \':is([data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-widget-v2\"]) button, [data-testid=\"now-playing-bar\"] button, [data-testid=\"now-playing-view\"] button, [data-testid=\"now-playing-panel\"] button, :is([data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-widget-v2\"]) [role=\"button\"], [data-testid=\"now-playing-bar\"] [role=\"button\"], [data-testid=\"now-playing-view\"] [role=\"button\"], [data-testid=\"now-playing-panel\"] [role=\"button\"], :is([data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-widget-v2\"]) [role=\"switch\"], [data-testid=\"now-playing-bar\"] [role=\"switch\"], [data-testid=\"now-playing-view\"] [role=\"switch\"], [data-testid=\"now-playing-panel\"] [role=\"switch\"]\' :\n        kind === \'shuffle\' ? \'button[data-testid*=\"shuffle\" i], button[aria-label], [role=\"button\"][aria-label], [role=\"switch\"][aria-label]\' :\n        \'button[data-testid=\"control-button-repeat\"], [role=\"button\"][data-testid=\"control-button-repeat\"], button[aria-label], [role=\"button\"][aria-label]\';\n    var nodes = Array.from(document.querySelectorAll(selector)).filter(function(b) {\n        if (!b.isConnected) return false;\n        var id=String(b.getAttribute(\'data-testid\')||\'\').toLowerCase();\n        var label=String(b.getAttribute(\'aria-label\')||\'\').trim();\n        if (kind === \'like\') return /^(add-button|remove-button|add-to-library-button|remove-from-library-button)$/.test(id) || labels.like.off.test(label) || labels.like.on.test(label) || (b.hasAttribute(\'aria-checked\') && genericAdd(label));\n        if (kind === \'repeat\') return id===\'control-button-repeat\' || labels.repeat.off.test(label) || labels.repeat.on.test(label);\n        return /shuffle/.test(id) || labels.shuffle.off.test(label) || labels.shuffle.on.test(label);\n    });\n    var result={state:\'unknown\',track:\'\',title:\'\',reason:\'control\',sent:false};\n    // Current player links only, including Spotify\'s unmarked track links.\n    // Every track href must agree; a non-empty title must also agree. Never\n    // take an identity from a playlist, search result or unrelated page node.\n    // Spotify\'s bar title links to the album with the track in ?highlight=spotify:track:ID.\n    function trackHref(h) {\n        h = String(h || \'\');\n        // A Spotify URI is a complete identity, unlike an album or title.\n        var uri = /^spotify:(track|episode):([a-z0-9]+)$/i.exec(h);\n        if (uri) return uri;\n        var m = /^(?:https:\\/\\/open\\.spotify\\.com)?\\/(?:intl-[a-z]{2}(?:-[a-z]{2})?\\/)?(track|episode)\\/([a-z0-9]+)\\/?(?:[?#].*)?$/i.exec(h);\n        if (m) return m;\n        var a = /^(?:https:\\/\\/open\\.spotify\\.com)?\\/(?:intl-[a-z]{2}(?:-[a-z]{2})?\\/)?album\\/[a-z0-9]+\\/?\\?(?:[^#]*&)?highlight=spotify(?::|%3a)(track)(?::|%3a)([a-z0-9]+)(?:[&#].*)?$/i.exec(h);\n        if (a) {\n            // Duplicate highlight keys, including encoded/case variants,\n            // have ambiguous semantics. Never choose one arbitrarily.\n            try {\n                var query = new URL(h, \'https://open.spotify.com\').searchParams;\n                var values = [];\n                query.forEach(function(value, key) { if (key.toLowerCase() === \'highlight\') values.push(value); });\n                if (values.length !== 1 || !/^spotify:track:[a-z0-9]+$/i.test(values[0])) return null;\n                var parts = /^spotify:(track):([a-z0-9]+)$/i.exec(values[0]);\n                return [a[0], parts[1], parts[2]];\n            } catch (_) { return null; }\n        }\n        return null; // album + title does not uniquely identify a track\n    }\n    // Explicit track URIs on the current-player title only; never infer a\n    // track from an album, playlist, title alone, or an unrelated page row.\n    function markedTrack(n) {\n        if (!/^(context-item-link|nowplaying-track-link|context-item-info-title)$/i.test(String(n.getAttribute(\'data-testid\') || \'\'))) return \'\';\n        var result = \'\';\n        for (var name of [\'data-uri\', \'data-track-uri\', \'data-spotify-uri\']) {\n            if (!n.hasAttribute(name)) continue;\n            var m = /^spotify:(track|episode):([a-z0-9]+)$/i.exec(String(n.getAttribute(name) || \'\'));\n            if (!m) return \'!\';\n            var value = m[1].toLowerCase()+\':\'+m[2];\n            if (result && result !== value) return \'!\';\n            result = value;\n        }\n        return result;\n    }\n    // If a title link itself carries a malformed track hint, an attribute\n    // must not mask that ambiguity. Album-only links may use their explicit\n    // current-title parent marker, but never one outside the player bar.\n    function hasTrackHint(h) {\n        h=String(h||\'\');\n        if (/^spotify:(track|episode):/i.test(h) || /\\/(track|episode)\\//i.test(h)) return true;\n        try {\n            var found=false;\n            new URL(h, \'https://open.spotify.com\').searchParams.forEach(function(v,k){if(k.toLowerCase()===\'highlight\')found=true;});\n            return found;\n        } catch (_) { return true; }\n    }\n    function parentTrack(link) {\n        var n=link.closest(\'[data-testid=\"context-item-info-title\"]\');\n        if(!n || !n.closest(\':is([data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-widget-v2\"]), [data-testid=\"now-playing-bar\"]\')) return \'\';\n        return markedTrack(n);\n    }\n    function markedTitleNodes() {\n        return Array.from(document.querySelectorAll(\':is([data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-widget-v2\"]) [data-testid=\"context-item-link\"], :is([data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-widget-v2\"]) [data-testid=\"nowplaying-track-link\"], :is([data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-widget-v2\"]) [data-testid=\"context-item-info-title\"], [data-testid=\"now-playing-bar\"] [data-testid=\"context-item-link\"], [data-testid=\"now-playing-bar\"] [data-testid=\"nowplaying-track-link\"], [data-testid=\"now-playing-bar\"] [data-testid=\"context-item-info-title\"]\')).filter(function(n) { return n.isConnected; });\n    }\n    if (kind === \'like\') {\n        var anchors = Array.from(document.querySelectorAll(\':is([data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-widget-v2\"]) a[href], [data-testid=\"now-playing-bar\"] a[href]\'));\n        var malformedIdentity = false, conflictIdentity = false;\n        var identities = anchors.map(function(link) {\n            var match = trackHref(String(link.getAttribute(\'href\') || \'\'));\n            if (!match && /^(context-item-link|nowplaying-track-link)$/i.test(String(link.getAttribute(\'data-testid\') || \'\')) && (hasTrackHint(link.getAttribute(\'href\')) || (!markedTrack(link) && !parentTrack(link)))) malformedIdentity = true;\n            return match ? {track:match[1].toLowerCase()+\':\'+match[2],title:String(link.textContent || \'\').replace(/\\s+/g, \' \').trim()} : null;\n        }).filter(Boolean);\n        markedTitleNodes().forEach(function(n) {\n            var value=markedTrack(n);\n            if (value === \'!\') { malformedIdentity = conflictIdentity = true; return; }\n            if (value) identities.push({track:value, title:String(n.textContent || \'\').replace(/\\s+/g, \' \').trim()});\n        });\n        var named = identities.filter(function(x) { return !!x.title; });\n        if (!malformedIdentity && named.length && identities.every(function(x) { return x.track === named[0].track && (!x.title || x.title === named[0].title); })) {\n            result.track=named[0].track; result.title=named[0].title;\n        }\n        // Spotify\'s newer bar carries no track id. The exact native title shown\n        // as a leaf in the bar identifies the current track (add-only like).\n        if (!result.track && !conflictIdentity && !identities.length && expectedTitle && !anchors.some(function(l) { return hasTrackHint(l.getAttribute(\'href\')); }) && Array.from(document.querySelectorAll(\':is([data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-widget-v2\"]), [data-testid=\"now-playing-bar\"]\')).some(function(r) {\n            return String(r.textContent || \'\').replace(/\\s+/g, \' \').toLowerCase().indexOf(String(expectedTitle).replace(/\\s+/g, \' \').trim().toLowerCase()) >= 0;\n        })) { result.track=\'title:\'+expectedTitle; result.title=expectedTitle; }\n    }\n\n    if (!nodes.length) {\n        var hasBar = !!document.querySelector(\'[data-testid=\"now-playing-bar\"], :is([data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-widget-v2\"]), [data-testid=\"player-controls\"]\');\n        // With the player bar present and no such control anywhere in the page,\n        // say so (\'absent\'); without the bar the control may simply not be shown yet.\n        result.reason = document.readyState === \'loading\' ? \'page\' : (kind === \'shuffle\' && !hasBar ? \'bar\' : hasBar ? \'absent\' : \'control\');\n        return JSON.stringify(result);\n    }\n    if (nodes.length !== 1) {result.reason=\'ambiguous\';return JSON.stringify(result);}\n    var button=nodes[0];\n    if (button.disabled || button.matches(\':disabled\') || button.closest(\'[aria-disabled=\"true\"]\')) {\n        var description=String(button.getAttribute(\'aria-description\')||\'\').trim();\n        result.reason=kind===\'shuffle\' && /^(shuffle is not available (with|for) (this account|this playback)|l[\'\u2019]al\u00e9atoire n[\'\u2019]est pas disponible avec (ce compte|cette lecture))$/i.test(description)?\'restriction\':\'disabled\';\n        return JSON.stringify(result);\n    }\n    if (kind === \'like\' && /^(true|menu|dialog|listbox|tree|grid)$/i.test(String(button.getAttribute(\'aria-haspopup\')||\'\'))) {result.reason=\'menu\';return JSON.stringify(result);}\n    var raw=button.getAttribute(\'aria-checked\');\n    var pressed=button.getAttribute(\'aria-pressed\');\n    if (kind === \'like\' && raw !== null && pressed !== null && raw !== pressed) {result.reason=\'conflict\';return JSON.stringify(result);}\n    if (raw === null) raw=pressed;\n    var label=String(button.getAttribute(\'aria-label\')||\'\').trim();\n    if (raw === null) {\n        raw=labels[kind].on.test(label) ? \'true\' :\n            labels[kind].off.test(label) ? \'false\' : \'unknown\';\n    } else if (raw !== \'true\' && raw !== \'false\' && !(kind !== \'like\' && raw === \'mixed\')) raw=\'unknown\';\n    if (kind === \'like\') {\n        // A false ARIA value must never override a removal action. An\n        // unlabeled generic add-button can be a playlist menu, not a like.\n        var testId=String(button.getAttribute(\'data-testid\')||\'\').toLowerCase();\n        var removeId=/^(remove-button|remove-from-library-button)$/.test(testId);\n        var offLabel=labels.like.off.test(label), onLabel=labels.like.on.test(label);\n        // Once liked, Spotify relabels the checked button to a generic \"Ajouter \u00e0 une playlist\" (phone 1022229).\n        if (!offLabel && !onLabel && raw===\'true\' && button.getAttribute(\'aria-checked\')===\'true\' && genericAdd(label)) onLabel=true;\n        if ((raw===\'false\' && (onLabel||removeId)) || (raw===\'true\' && offLabel)) {\n            result.reason=\'conflict\';return JSON.stringify(result);\n        }\n        if (!offLabel && !onLabel) {result.reason=\'unverified\';return JSON.stringify(result);}\n        // Display-only reads need no identity; a click (invoke) still does.\n        if ((!result.track || !result.title) && action !== \'query\') {result.reason=\'identity\';return JSON.stringify(result);}\n    }\n    if (raw === \'unknown\') {result.reason=\'state\';return JSON.stringify(result);}\n    if (typeof button.click !== \'function\') {result.reason=\'command\';return JSON.stringify(result);}\n    result.state=raw;result.reason=\'\';\n    if (action === \'query\') return JSON.stringify(result);\n    if (action !== \'invoke\' || raw !== expectedState ||\n        (kind === \'like\' && (raw !== \'false\' || result.track !== expectedTrack || result.title !== expectedTitle))) return JSON.stringify({sent:false});\n    try {\n        // Use the exact revalidated button; never call a legacy helper that\n        // schedules playback-related work. Never click an already-liked item.\n        button.click();\n        return JSON.stringify({sent:true});\n    } catch (_) { return JSON.stringify({sent:false}); }\n})\n)("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    invoke-static {v1}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p1}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-static {p2}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-static {p3}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-static {p4}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, "));r.diagnostic=("

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, "(function(kind) {\n    \'use strict\';\n    // Passive, bounded, allowlisted observations only. No account, track or\n    // arbitrary page text is returned. This probe does not click or send data.\n    var specs={\n        repeat:{selector:\'button[data-testid=\"control-button-repeat\"], [role=\"button\"][data-testid=\"control-button-repeat\"], button[aria-label], [role=\"button\"][aria-label]\', ids:/^control-button-repeat$/i,\n            off:/^(enable repeat|turn repeat on|activer la r\u00e9p\u00e9tition|wiederholung aktivieren|activar repetici\u00f3n|ativar repeti\u00e7\u00e3o)$/i,\n            on:/^(disable repeat|turn repeat off|d\u00e9sactiver la r\u00e9p\u00e9tition|wiederholung deaktivieren|desactivar repetici\u00f3n|desativar repeti\u00e7\u00e3o)$/i},\n        shuffle:{selector:\'button[data-testid*=\"shuffle\" i], button[aria-label], [role=\"button\"][aria-label], [role=\"switch\"][aria-label]\', ids:/shuffle/i,\n            off:/^(enable shuffle|turn shuffle on|activate shuffle|activer (la lecture |le mode |l[\'\u2019])?al\u00e9atoire|zufallswiedergabe aktivieren|activar (el modo |la reproducci\u00f3n )?aleatori[oa]|ativar (a reprodu\u00e7\u00e3o )?aleat\u00f3ria)$/i,\n            on:/^(disable shuffle|turn shuffle off|deactivate shuffle|d\u00e9sactiver (la lecture |le mode |l[\'\u2019])?al\u00e9atoire|zufallswiedergabe deaktivieren|desactivar (el modo |la reproducci\u00f3n )?aleatori[oa]|desativar (a reprodu\u00e7\u00e3o )?aleat\u00f3ria)$/i},\n        like:{selector:\':is([data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-widget-v2\"]) button, [data-testid=\"now-playing-bar\"] button, [data-testid=\"now-playing-view\"] button, [data-testid=\"now-playing-panel\"] button, :is([data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-widget-v2\"]) [role=\"button\"], [data-testid=\"now-playing-bar\"] [role=\"button\"], [data-testid=\"now-playing-view\"] [role=\"button\"], [data-testid=\"now-playing-panel\"] [role=\"button\"], :is([data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-widget-v2\"]) [role=\"switch\"], [data-testid=\"now-playing-bar\"] [role=\"switch\"], [data-testid=\"now-playing-view\"] [role=\"switch\"], [data-testid=\"now-playing-panel\"] [role=\"switch\"]\', ids:/^(add-button|remove-button|add-to-library-button|remove-from-library-button)$/i,\n            off:/^(save to your library|add to (your )?(liked songs|library)|ajouter (\u00e0|aux) (la biblioth\u00e8que|titres lik\u00e9s)|enregistrer dans (votre |la )?biblioth\u00e8que|in (deine |der )?bibliothek (aufnehmen|hinzuf\u00fcgen)|a\u00f1adir a (tu )?biblioteca|adicionar (\u00e0 biblioteca|aos t\u00edtulos curtidos))$/i,\n            on:/^(remove from (your )?(library|liked songs)|retirer (de la biblioth\u00e8que|des titres lik\u00e9s)|supprimer de (votre |la )?biblioth\u00e8que|aus (deiner |der )?bibliothek entfernen|quitar de (tu )?biblioteca|remover (da biblioteca|dos t\u00edtulos curtidos))$/i}\n    };\n    // Same liked-label widening as control.js, so the report matches what a tap can act on.\n    (function(){var w=/(titres lik\u00e9s|liked songs|lik\u00e9|liked|favori|biblioth\u00e8que|library|biblioteca|bibliothek)/i,o=specs.like.off,n=specs.like.on;specs.like.off={test:function(l){return o.test(l)||(w.test(l)&&/^(ajouter|add|enregistrer|save|a\u00f1adir|adicionar|hinzuf\u00fcgen|zu)\\b/i.test(l));}};specs.like.on={test:function(l){return n.test(l)||(w.test(l)&&/^(ajout\u00e9|retirer|supprimer|remove|enregistr\u00e9|saved|added|quitar|remover|entfernen)/i.test(l));}};})();\n    // Aggregate structure only: fixed testid/role and label categories, never\n    // arbitrary labels or identifiers that could contain a track or account.\n    function structure() {\n        var roots=Array.from(document.querySelectorAll(\'[data-testid=\"now-playing-bar\"], :is([data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-widget-v2\"]), [data-testid=\"player-controls\"], [data-testid=\"now-playing-view\"], [data-testid=\"now-playing-panel\"]\'));\n        var nodes=[];roots.forEach(function(root){Array.from(root.querySelectorAll(\'button,[role=\"button\"],[role=\"switch\"],[role=\"slider\"],input[type=\"range\"]\')).forEach(function(n){if(nodes.indexOf(n)<0)nodes.push(n);});});\n        var st={bar:0,view:0,nodes:Math.min(nodes.length,99),playpause:0,repeat:0,shuffle:0,like:0,queue:0,volume:0,lyrics:0,connect:0,other:0,button:0,switch:0,slider:0,aria_shuffle:0,aria_like:0,aria_play:0,aria_pause:0,aria_other:0,track_links:0,track_named:0,track_generic:0,npv_opener:0};\n        roots.forEach(function(r){if(/^(now-playing-view|now-playing-panel)$/.test(r.getAttribute(\'data-testid\')))st.view++;else st.bar++;});\n        nodes.forEach(function(n){\n            var id=String(n.getAttribute(\'data-testid\')||\'\').toLowerCase(), label=String(n.getAttribute(\'aria-label\')||\'\').trim(), role=String(n.getAttribute(\'role\')||\'\').toLowerCase();\n            var k=/^control-button-playpause$/.test(id)?\'playpause\':/repeat/.test(id)?\'repeat\':/shuffle/.test(id)?\'shuffle\':/^(add-button|remove-button|add-to-library-button|remove-from-library-button)$/.test(id)?\'like\':/^(queue-button|control-button-queue)$/.test(id)?\'queue\':/^(volume-bar|volume-slider)$/.test(id)?\'volume\':/^(lyrics-button|control-button-lyrics)$/.test(id)?\'lyrics\':/^(connect-button|control-button-connect|connect-device-picker|device-picker)$/.test(id)?\'connect\':\'other\';\n            st[k]=Math.min(st[k]+1,99);if(role===\'switch\')st.switch++;else if(role===\'slider\'||n.tagName===\'INPUT\')st.slider++;else st.button++;\n            if(specs.shuffle.off.test(label)||specs.shuffle.on.test(label))st.aria_shuffle++;else if(specs.like.off.test(label)||specs.like.on.test(label))st.aria_like++;else if(/^(play|resume|lire|reprendre)$/i.test(label))st.aria_play++;else if(/^(pause|mettre en pause)$/i.test(label))st.aria_pause++;else if(label)st.aria_other++;\n        });\n        var links=Array.from(document.querySelectorAll(\':is([data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-widget-v2\"]) a[href], [data-testid=\"now-playing-bar\"] a[href]\'));\n        // Shapes only (no href, title or label text): where the bar points, and\n        // what the checked (like-like) buttons\' labels contain.\n        [\'href_album\',\'href_album_hl\',\'href_hl_ambiguous\',\'href_artist\',\'href_uri\',\'href_other\',\'chk_buttons\',\'chk_likeword\',\'chk_verb_add\',\'chk_verb_on\',\'chk_long\',\'chk_favori\',\'chk_library\',\'chk_liked\',\'chk_add_false\',\'chk_add_true\',\'chk_popup\'].forEach(function(k){st[k]=0;});\n        links.forEach(function(a){\n            var hh=String(a.getAttribute(\'href\')||\'\');\n            if(/^spotify:(track|episode):[a-z0-9]+$/i.test(hh))st.href_uri++;else if(/\\/album\\//i.test(hh))st[/highlight=/i.test(hh)?\'href_album_hl\':\'href_album\']++;else if(/\\/artist\\//i.test(hh))st.href_artist++;else if(!/\\/(track|episode)\\//i.test(hh))st.href_other++;\n        });\n        Array.from(document.querySelectorAll(\':is([data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-widget-v2\"]) button[aria-checked], [data-testid=\"now-playing-bar\"] button[aria-checked]\')).forEach(function(b){\n            var l=String(b.getAttribute(\'aria-label\')||\'\').trim();if(/repeat|r[\u00e9e]p[\u00e9e]t|shuffle|al[\u00e9e]atoire/i.test(l)||/repeat|shuffle/i.test(String(b.getAttribute(\'data-testid\')||\'\')))return;\n            st.chk_buttons++;if(/(lik\u00e9|liked|biblioth\u00e8que|library|favori)/i.test(l))st.chk_likeword++;\n            if(/^(ajouter|add|enregistrer|save)/i.test(l))st.chk_verb_add++;if(/^(ajout\u00e9|retirer|supprimer|remove|enregistr\u00e9|saved|added)/i.test(l))st.chk_verb_on++;if(l.length>30)st.chk_long++;\n            if(/favori/i.test(l))st.chk_favori++;if(/biblioth\u00e8que|library/i.test(l))st.chk_library++;if(/lik\u00e9|liked/i.test(l))st.chk_liked++;\n            if(/^(ajouter|add|enregistrer|save)/i.test(l)) {if(b.getAttribute(\'aria-checked\')===\'false\')st.chk_add_false++;if(b.getAttribute(\'aria-checked\')===\'true\')st.chk_add_true++;}\n            if(/^(true|menu|dialog|listbox)$/i.test(String(b.getAttribute(\'aria-haspopup\')||\'\')))st.chk_popup++;\n\n        });\n        links.forEach(function(a){\n            var h=String(a.getAttribute(\'href\')||\'\');\n            if (!/^spotify:(track|episode):[a-z0-9]+$/i.test(h) && !/^(?:https:\\/\\/open\\.spotify\\.com)?\\/(?:intl-[a-z]{2}(?:-[a-z]{2})?\\/)?(?:track|episode)\\/[a-z0-9]+\\/?(?:[?#].*)?$/i.test(h) && !/^(?:https:\\/\\/open\\.spotify\\.com)?\\/(?:intl-[a-z]{2}(?:-[a-z]{2})?\\/)?album\\/[a-z0-9]+\\/?\\?(?:[^#]*&)?highlight=spotify(?::|%3a)track(?::|%3a)[a-z0-9]+/i.test(h)) return;\n            if (/\\/album\\//i.test(h)) {\n                try {\n                    var highlights=[];\n                    new URL(h, \'https://open.spotify.com\').searchParams.forEach(function(v,k){if(k.toLowerCase()===\'highlight\')highlights.push(v);});\n                    if(highlights.length!==1 || !/^spotify:track:[a-z0-9]+$/i.test(highlights[0])) {st.href_hl_ambiguous++;return;}\n                } catch (_) {st.href_hl_ambiguous++;return;}\n            }\n            st.track_links++;if(String(a.textContent||\'\').trim())st.track_named++;\n            if(!/^(context-item-link|nowplaying-track-link)$/i.test(String(a.getAttribute(\'data-testid\')||\'\')))st.track_generic++;\n        });\n        st.track_attr=0;\n        Array.from(document.querySelectorAll(\':is([data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-widget-v2\"]) [data-testid=\"context-item-link\"], :is([data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-widget-v2\"]) [data-testid=\"nowplaying-track-link\"], :is([data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-widget-v2\"]) [data-testid=\"context-item-info-title\"], [data-testid=\"now-playing-bar\"] [data-testid=\"context-item-link\"], [data-testid=\"now-playing-bar\"] [data-testid=\"nowplaying-track-link\"], [data-testid=\"now-playing-bar\"] [data-testid=\"context-item-info-title\"]\')).forEach(function(n){\n            if([\'data-uri\',\'data-track-uri\',\'data-spotify-uri\'].some(function(k){return /^spotify:(track|episode):[a-z0-9]+$/i.test(String(n.getAttribute(k)||\'\'));}))st.track_attr++;\n        });\n        Array.from(document.querySelectorAll(\'button, [role=\"button\"]\')).forEach(function(b){\n            var id=String(b.getAttribute(\'data-testid\')||\'\'), l=String(b.getAttribute(\'aria-label\')||\'\').trim();\n            if(/^(control-button-npv|now-playing-view-button)$/i.test(id)||/^(now playing view|show now playing view|hide now playing view|vue \u00ab ?en cours de lecture ?\u00bb|afficher la vue en cours de lecture|masquer la vue en cours de lecture|en cours de lecture|ansicht \u201el\u00e4uft gerade\u201c|vista de reproducci\u00f3n|tela tocando agora)$/i.test(l))st.npv_opener++;\n        });\n        // Counts outside player scopes help locate candidates only. They may\n        // belong to a playlist or another track and are NEVER actionable.\n        st.outside_like_id=0;st.outside_like_label=0;st.outside_track_links=0;\n        function inPlayer(n){return !!n.closest(\':is([data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-widget-v2\"]), [data-testid=\"now-playing-bar\"], [data-testid=\"now-playing-view\"], [data-testid=\"now-playing-panel\"], [data-testid=\"NPV\"]\');}\n        Array.from(document.querySelectorAll(\'button, [role=\"button\"], [role=\"switch\"]\')).forEach(function(n){\n            if(!n.isConnected||inPlayer(n))return;\n            var id=String(n.getAttribute(\'data-testid\')||\'\'),label=String(n.getAttribute(\'aria-label\')||\'\').trim();\n            if(specs.like.ids.test(id))st.outside_like_id++;\n            if(specs.like.off.test(label)||specs.like.on.test(label))st.outside_like_label++;\n        });\n        Array.from(document.querySelectorAll(\'a[href]\')).forEach(function(a){\n            if(!a.isConnected||inPlayer(a))return;\n            if(/^(?:https:\\/\\/open\\.spotify\\.com)?\\/(?:intl-[a-z]{2}(?:-[a-z]{2})?\\/)?(?:track|episode)\\/[a-z0-9]+\\/?(?:[?#].*)?$/i.test(String(a.getAttribute(\'href\')||\'\')))st.outside_track_links++;\n        });\n        // Capability counts only. Never invoke platform APIs or include their\n        // state, user, title, identifiers, labels, or session information.\n        st.api_player=st.api_state=st.api_library=st.api_contains=st.api_add=0;\n        try {\n            var platform=window.Melodix && window.Melodix.Platform;\n            var player=platform && platform.PlayerAPI, library=platform && platform.LibraryAPI;\n            if(player)st.api_player=1;if(player && typeof player.getState===\'function\')st.api_state=1;\n            if(library)st.api_library=1;if(library && typeof library.contains===\'function\')st.api_contains=1;\n            if(library && typeof library.add===\'function\')st.api_add=1;\n        } catch (_) {}\n        Object.keys(st).forEach(function(k){st[k]=Math.min(st[k],99);});return JSON.stringify(st);\n    }\n    var spec=specs[kind], out={kind:kind===\'shuffle\'?\'shuffle\':kind===\'like\'?\'like\':kind===\'repeat\'?\'repeat\':\'unknown\',reason:\'control\',count:0,state:\'unknown\',label:\'unknown\',command:\'unknown\',disabled:false,smart:false,structure:structure()};\n    if(!spec)return JSON.stringify(out);\n    var nodes=Array.from(document.querySelectorAll(spec.selector)).filter(function(b){\n        return b.isConnected && (spec.ids.test(String(b.getAttribute(\'data-testid\')||\'\')) || spec.off.test(String(b.getAttribute(\'aria-label\')||\'\').trim()) || spec.on.test(String(b.getAttribute(\'aria-label\')||\'\').trim()));\n    });\n    out.count=Math.min(nodes.length,2);\n    if(nodes.length!==1){out.reason=nodes.length?\'ambiguous\':document.readyState===\'loading\'?\'page\':\'absent\';return JSON.stringify(out);}\n    var b=nodes[0], label=String(b.getAttribute(\'aria-label\')||\'\').trim();\n    out.label=spec.on.test(label)?\'on-action\':spec.off.test(label)?\'off-action\':label?\'unrecognized\':\'absent\';\n    out.disabled=!!b.disabled || b.getAttribute(\'aria-disabled\')===\'true\';\n    var raw=b.getAttribute(\'aria-checked\');if(raw===null)raw=b.getAttribute(\'aria-pressed\');\n    out.state=raw===\'true\'||raw===\'false\'||(kind!==\'like\'&&raw===\'mixed\')?raw:raw===null?(out.label===\'on-action\'?\'true\':out.label===\'off-action\'?\'false\':\'unknown\'):\'unknown\';\n    out.smart=kind===\'shuffle\' && out.state===\'mixed\';\n    var id=String(b.getAttribute(\'data-testid\')||\'\').toLowerCase();\n    var conflict=kind===\'like\' && ((out.state===\'false\' && (out.label===\'on-action\'||/^(remove-button|remove-from-library-button)$/.test(id))) || (out.state===\'true\' && out.label===\'off-action\'));\n    var unverified=kind===\'like\' && out.label!==\'off-action\' && out.label!==\'on-action\';\n    if(unverified)out.state=\'unknown\';\n    var popup=String(b.getAttribute(\'aria-haspopup\')||\'\').toLowerCase();\n    if(kind===\'like\')out.command=popup===\'true\'||popup===\'menu\'||popup===\'dialog\'||popup===\'listbox\'||popup===\'tree\'||popup===\'grid\'?\'menu\':\'unspecified\';\n    else out.command=\'toggle\';\n    var description=String(b.getAttribute(\'aria-description\')||\'\').trim();\n    var restricted=kind===\'shuffle\' && out.disabled && /^(shuffle is not available (with|for) (this account|this playback)|l[\'\u2019]al\u00e9atoire n[\'\u2019]est pas disponible avec (ce compte|cette lecture))$/i.test(description);\n    out.reason=restricted?\'restriction\':out.disabled?\'disabled\':conflict?\'conflict\':unverified?\'unverified\':out.state===\'unknown\'?\'state\':\'observed\';\n    return JSON.stringify(out);\n})\n"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, ")("

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget-object p2, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    invoke-static {p2}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, ");return JSON.stringify(r);})()"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private static clean(Ljava/lang/String;)Ljava/lang/String;
    .locals 5

    .line 31
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object p0

    array-length v1, p0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_5

    aget-char v3, p0, v2

    const/16 v4, 0x61

    if-lt v3, v4, :cond_0

    const/16 v4, 0x7a

    if-le v3, v4, :cond_2

    :cond_0
    const/16 v4, 0x30

    if-lt v3, v4, :cond_1

    const/16 v4, 0x39

    if-le v3, v4, :cond_2

    :cond_1
    const/16 v4, 0x3a

    if-eq v3, v4, :cond_2

    const/16 v4, 0x2d

    if-eq v3, v4, :cond_2

    const/16 v4, 0x2c

    if-eq v3, v4, :cond_2

    const/16 v4, 0x3e

    if-ne v3, v4, :cond_3

    :cond_2
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_3
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    const/16 v4, 0xa0

    if-le v3, v4, :cond_4

    goto :goto_1

    :cond_4
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_5
    :goto_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result p0

    if-nez p0, :cond_6

    const-string p0, "aucune"

    goto :goto_2

    :cond_6
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    :goto_2
    return-object p0
.end method

.method private static count(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 32
    const-string v0, "0"

    :try_start_0
    invoke-virtual {p0, p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p0

    const/16 p1, 0x63

    invoke-static {p1, p0}, Ljava/lang/Math;->min(II)I

    move-result p0

    const/4 p1, 0x0

    invoke-static {p1, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    return-object v0
.end method

.method private diagnosticIndex()I
    .locals 2

    .line 33
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v1, "shuffle"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v1, "like"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v1, "repeat"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v0, 0x2

    goto :goto_0

    :cond_2
    const/4 v0, -0x1

    :goto_0
    return v0
.end method

.method public static diagnosticReport()Ljava/lang/String;
    .locals 8

    .line 56
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\nAl\u00e9atoire \u2014 actuel : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/melodix/music/PreviewPlayerMode;->last:[Ljava/lang/String;

    const/4 v2, 0x0

    aget-object v1, v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " ; avant : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v3, Lcom/melodix/music/PreviewPlayerMode;->before:[Ljava/lang/String;

    aget-object v3, v3, v2

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, " ; apr\u00e8s : "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v4, Lcom/melodix/music/PreviewPlayerMode;->after:[Ljava/lang/String;

    aget-object v4, v4, v2

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, " ; r\u00e9sultat : "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v5, Lcom/melodix/music/PreviewPlayerMode;->outcome:[Ljava/lang/String;

    aget-object v5, v5, v2

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v5, "\nLike \u2014 actuel : "

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v5, Lcom/melodix/music/PreviewPlayerMode;->last:[Ljava/lang/String;

    const/4 v6, 0x1

    aget-object v5, v5, v6

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v5, Lcom/melodix/music/PreviewPlayerMode;->before:[Ljava/lang/String;

    aget-object v5, v5, v6

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v5, Lcom/melodix/music/PreviewPlayerMode;->after:[Ljava/lang/String;

    aget-object v5, v5, v6

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v5, Lcom/melodix/music/PreviewPlayerMode;->outcome:[Ljava/lang/String;

    aget-object v5, v5, v6

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v5, "\nR\u00e9p\u00e9tition \u2014 actuel : "

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v5, Lcom/melodix/music/PreviewPlayerMode;->last:[Ljava/lang/String;

    const/4 v7, 0x2

    aget-object v5, v5, v7

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/melodix/music/PreviewPlayerMode;->before:[Ljava/lang/String;

    aget-object v1, v1, v7

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/melodix/music/PreviewPlayerMode;->after:[Ljava/lang/String;

    aget-object v1, v1, v7

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/melodix/music/PreviewPlayerMode;->outcome:[Ljava/lang/String;

    aget-object v1, v1, v7

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nM\u00e9thodes (al\u00e9atoire | like | r\u00e9p\u00e9tition) : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/melodix/music/PreviewPlayerMode;->methods:[Ljava/lang/String;

    aget-object v1, v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " | "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v2, Lcom/melodix/music/PreviewPlayerMode;->methods:[Ljava/lang/String;

    aget-object v2, v2, v6

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/melodix/music/PreviewPlayerMode;->methods:[Ljava/lang/String;

    aget-object v1, v1, v7

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nStructure lecteur (comptes seulement ; autres libell\u00e9s masqu\u00e9s) : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/melodix/music/PreviewPlayerMode;->structure:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private drawable(Ljava/lang/String;)I
    .locals 3

    .line 244
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "drawable"

    invoke-virtual {v0, p1, v2, v1}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result p1

    return p1
.end method

.method private finishJob(Lorg/json/JSONObject;)V
    .locals 11

    .line 218
    const-string v0, "outcome"

    const-string v1, "failed"

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "confirmed|unconfirmed|unverified|read|identity|disabled|failed|menu-absent|menu-ambiguous|menu-state"

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewPlayerMode;->allowed(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 219
    const-string v1, "state"

    const-string v2, "unknown"

    invoke-virtual {p1, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v3, "true|false|mixed|unknown"

    invoke-static {v1, v3}, Lcom/melodix/music/PreviewPlayerMode;->allowed(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 220
    const-string v3, "method"

    const-string v4, ""

    invoke-virtual {p1, v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v5, "direct|now-playing-view|keyboard|app-loop|unknown"

    invoke-static {v3, v5}, Lcom/melodix/music/PreviewPlayerMode;->allowed(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 221
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->diagnosticIndex()I

    move-result v5

    .line 222
    iget-object v6, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v7, "like"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    const-string v8, "identity"

    if-eqz v6, :cond_1

    iget-object v6, p0, Lcom/melodix/music/PreviewPlayerMode;->pendingTrack:Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_0

    iget-object v6, p0, Lcom/melodix/music/PreviewPlayerMode;->pendingTitle:Ljava/lang/String;

    invoke-direct {p0, v6}, Lcom/melodix/music/PreviewPlayerMode;->sameNativeTitle(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_1

    :cond_0
    move-object v1, v2

    move-object v0, v8

    .line 223
    :cond_1
    if-ltz v5, :cond_3

    sget-object v6, Lcom/melodix/music/PreviewPlayerMode;->methods:[Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "m\u00e9thode="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v10

    if-eqz v10, :cond_2

    const-string v10, "aucune"

    goto :goto_0

    :cond_2
    move-object v10, v3

    :goto_0
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ", r\u00e9sultat="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ", \u00e9tapes="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "journal"

    invoke-virtual {p1, v10, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerMode;->clean(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v9, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    aput-object p1, v6, v5

    sget-object p1, Lcom/melodix/music/PreviewPlayerMode;->outcome:[Ljava/lang/String;

    aput-object v0, p1, v5

    .line 224
    :cond_3
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    iget-wide v5, p0, Lcom/melodix/music/PreviewPlayerMode;->generation:J

    const-wide/16 v9, 0x1

    add-long/2addr v5, v9

    iput-wide v5, p0, Lcom/melodix/music/PreviewPlayerMode;->generation:J

    iget-wide v5, p0, Lcom/melodix/music/PreviewPlayerMode;->querySerial:J

    add-long/2addr v5, v9

    iput-wide v5, p0, Lcom/melodix/music/PreviewPlayerMode;->querySerial:J

    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerMode;->queryInFlight:Z

    .line 225
    const-string v5, "app-loop"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    const-string v5, "observed"

    const/4 v6, 0x1

    if-eqz v3, :cond_5

    .line 226
    const-string v0, "true"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/melodix/music/PreviewPlayerMode;->appLoop:Z

    sput-boolean v6, Lcom/melodix/music/PreviewPlayerMode;->appLoopSeen:Z

    iput-object v5, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->paint()V

    .line 227
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->getContext()Landroid/content/Context;

    move-result-object v0

    sget-boolean v1, Lcom/melodix/music/PreviewPlayerMode;->appLoop:Z

    if-eqz v1, :cond_4

    const-string v1, "Boucle du titre activ\u00e9e"

    goto :goto_1

    :cond_4
    const-string v1, "Boucle d\u00e9sactiv\u00e9e"

    :goto_1
    invoke-static {v0, v1, p1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void

    .line 229
    :cond_5
    const-string v3, "confirmed"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_6

    const-string v3, "read"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_8

    :cond_6
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_8

    .line 230
    iput-object v1, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    iput-object v5, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    iput-object v1, p0, Lcom/melodix/music/PreviewPlayerMode;->remembered:Ljava/lang/String;

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    invoke-virtual {p1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_7

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->nativeTitle()Ljava/lang/String;

    move-result-object v4

    :cond_7
    iput-object v4, p0, Lcom/melodix/music/PreviewPlayerMode;->rememberedTitle:Ljava/lang/String;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->paint()V

    .line 232
    return-void

    .line 234
    :cond_8
    iput-object v2, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    .line 235
    const-string v1, "unverified"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    iput-object v1, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->paint()V

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "Commande envoy\u00e9e, \u00e9tat non v\u00e9rifiable"

    invoke-static {v0, v1, p1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void

    .line 236
    :cond_9
    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_a

    iput-object v8, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->paint()V

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "Titre en cours diff\u00e9rent, R\u00e9essayer"

    invoke-static {v0, v1, p1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void

    .line 237
    :cond_a
    const-string v1, "menu-"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_d

    const-string p1, "menu"

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->paint()V

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->getContext()Landroid/content/Context;

    move-result-object p1

    const-string v1, "menu-ambiguous"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_b

    const-string v0, "Plusieurs choix Like possibles, aucune modification"

    goto :goto_2

    :cond_b
    const-string v1, "menu-state"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c

    const-string v0, "\u00c9tat Like non v\u00e9rifiable, aucune modification"

    goto :goto_2

    :cond_c
    const-string v0, "Titres lik\u00e9s introuvables dans le menu"

    :goto_2
    invoke-static {p1, v0, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void

    .line 238
    :cond_d
    const-string v1, "disabled"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    const-string v3, "shuffle"

    if-eqz v2, :cond_e

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_e

    sput-boolean v6, Lcom/melodix/music/PreviewPlayerMode;->shuffleLocked:Z

    iput-object v1, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->paint()V

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "Al\u00e9atoire impos\u00e9 par Spotify"

    invoke-static {v0, v1, p1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void

    .line 239
    :cond_e
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_f

    iput-object v1, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->paint()V

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->reasonText()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, p1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void

    .line 240
    :cond_f
    const-string v1, "unconfirmed"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_10

    const-string v0, "confirmation"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->paint()V

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "Action non confirm\u00e9e. R\u00e9essayer"

    invoke-static {v0, v1, p1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void

    .line 241
    :cond_10
    const-string v0, "control"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->paint()V

    .line 242
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_11

    const-string v1, "Al\u00e9atoire indisponible, R\u00e9essayer"

    goto :goto_3

    :cond_11
    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_12

    const-string v1, "Like indisponible, R\u00e9essayer"

    goto :goto_3

    :cond_12
    const-string v1, "R\u00e9p\u00e9tition indisponible, R\u00e9essayer"

    :goto_3
    invoke-static {v0, v1, p1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 243
    return-void
.end method

.method private invoke()V
    .locals 11

    .line 170
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    .line 171
    iget-boolean v2, p0, Lcom/melodix/music/PreviewPlayerMode;->running:Z

    if-eqz v2, :cond_f

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->isShown()Z

    move-result v2

    if-eqz v2, :cond_f

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->getWindowVisibility()I

    move-result v2

    if-nez v2, :cond_f

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerMode;->lastTap:J

    sub-long v2, v0, v2

    const-wide/16 v4, 0x190

    cmp-long v2, v2, v4

    if-gez v2, :cond_0

    goto/16 :goto_4

    .line 174
    :cond_0
    iget-boolean v2, p0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    const/4 v3, 0x3

    if-eqz v2, :cond_1

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerMode;->lastTap:J

    sub-long v4, v0, v4

    const-wide/16 v6, 0x4b0

    cmp-long v2, v4, v6

    if-gez v2, :cond_1

    invoke-virtual {p0, v3}, Lcom/melodix/music/PreviewPlayerMode;->performHapticFeedback(I)Z

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->shake()V

    return-void

    .line 175
    :cond_1
    iget-boolean v2, p0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    const-wide/16 v4, 0x1

    const/4 v6, 0x0

    if-eqz v2, :cond_2

    iput-boolean v6, p0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    iget-wide v7, p0, Lcom/melodix/music/PreviewPlayerMode;->generation:J

    add-long/2addr v7, v4

    iput-wide v7, p0, Lcom/melodix/music/PreviewPlayerMode;->generation:J

    iget-wide v7, p0, Lcom/melodix/music/PreviewPlayerMode;->querySerial:J

    add-long/2addr v7, v4

    iput-wide v7, p0, Lcom/melodix/music/PreviewPlayerMode;->querySerial:J

    iput-boolean v6, p0, Lcom/melodix/music/PreviewPlayerMode;->queryInFlight:Z

    .line 177
    :cond_2
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v7, "shuffle"

    invoke-virtual {v2, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    sput-boolean v6, Lcom/melodix/music/PreviewPlayerMode;->shuffleLocked:Z

    .line 178
    :cond_3
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    const-string v7, "unknown"

    invoke-virtual {v2, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->tappable()Z

    move-result v2

    if-nez v2, :cond_6

    .line 179
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->beginDiagnostic()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->diagnosticIndex()I

    move-result v2

    if-ltz v2, :cond_4

    sget-object v4, Lcom/melodix/music/PreviewPlayerMode;->outcome:[Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "non envoy\u00e9 : "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v7, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v2

    .line 180
    :cond_4
    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode;->lastTap:J

    invoke-virtual {p0, v3}, Lcom/melodix/music/PreviewPlayerMode;->performHapticFeedback(I)Z

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->shake()V

    .line 181
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v2, "bar"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    const-string v1, "Lance un titre pour utiliser ce bouton"

    goto :goto_0

    :cond_5
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->reasonText()Ljava/lang/String;

    move-result-object v1

    :goto_0
    invoke-static {v0, v1, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 182
    return-void

    .line 184
    :cond_6
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v8, "like"

    invoke-virtual {v2, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    const/4 v9, 0x1

    if-eqz v2, :cond_9

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerMode;->track:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_7

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerMode;->title:Ljava/lang/String;

    invoke-direct {p0, v2}, Lcom/melodix/music/PreviewPlayerMode;->sameNativeTitle(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_9

    .line 185
    :cond_7
    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode;->lastTap:J

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->beginDiagnostic()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->diagnosticIndex()I

    move-result v0

    if-ltz v0, :cond_8

    sget-object v1, Lcom/melodix/music/PreviewPlayerMode;->outcome:[Ljava/lang/String;

    const-string v2, "non envoy\u00e9 : identit\u00e9"

    aput-object v2, v1, v0

    .line 186
    :cond_8
    const-string v0, "identity"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->paint()V

    invoke-virtual {p0, v3}, Lcom/melodix/music/PreviewPlayerMode;->performHapticFeedback(I)Z

    .line 187
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "Titre non identifi\u00e9, aucune modification. R\u00e9essayer"

    invoke-static {v0, v1, v9}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    return-void

    .line 189
    :cond_9
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->web()Landroid/webkit/WebView;

    move-result-object v2

    if-nez v2, :cond_b

    iput-object v7, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    const-string v0, "web"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->paint()V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "Page Spotify indisponible, R\u00e9essayer"

    invoke-static {v0, v1, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    :cond_a
    return-void

    .line 190
    :cond_b
    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode;->lastTap:J

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->beginDiagnostic()V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    iput-boolean v9, p0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    iput-boolean v6, p0, Lcom/melodix/music/PreviewPlayerMode;->observedPending:Z

    .line 191
    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->pendingState:Ljava/lang/String;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    invoke-virtual {v1, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const-string v7, ""

    if-eqz v1, :cond_d

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerMode;->title:Ljava/lang/String;

    invoke-direct {p0, v1}, Lcom/melodix/music/PreviewPlayerMode;->sameNativeTitle(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_c

    goto :goto_1

    :cond_c
    move-object v1, v7

    goto :goto_2

    :cond_d
    :goto_1
    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerMode;->track:Ljava/lang/String;

    :goto_2
    iput-object v1, p0, Lcom/melodix/music/PreviewPlayerMode;->pendingTrack:Ljava/lang/String;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    invoke-virtual {v1, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_e

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerMode;->title:Ljava/lang/String;

    invoke-direct {p0, v1}, Lcom/melodix/music/PreviewPlayerMode;->sameNativeTitle(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_e

    iget-object v7, p0, Lcom/melodix/music/PreviewPlayerMode;->title:Ljava/lang/String;

    :cond_e
    iput-object v7, p0, Lcom/melodix/music/PreviewPlayerMode;->pendingTitle:Ljava/lang/String;

    iget-wide v7, p0, Lcom/melodix/music/PreviewPlayerMode;->generation:J

    add-long/2addr v7, v4

    iput-wide v7, p0, Lcom/melodix/music/PreviewPlayerMode;->generation:J

    iget-wide v9, p0, Lcom/melodix/music/PreviewPlayerMode;->querySerial:J

    add-long/2addr v9, v4

    iput-wide v9, p0, Lcom/melodix/music/PreviewPlayerMode;->querySerial:J

    iput-boolean v6, p0, Lcom/melodix/music/PreviewPlayerMode;->queryInFlight:Z

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->paint()V

    invoke-virtual {p0, v3}, Lcom/melodix/music/PreviewPlayerMode;->performHapticFeedback(I)Z

    .line 192
    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerMode;->handler:Landroid/os/Handler;

    new-instance v3, Lcom/melodix/music/PreviewPlayerMode$5;

    invoke-direct {v3, p0, v7, v8}, Lcom/melodix/music/PreviewPlayerMode$5;-><init>(Lcom/melodix/music/PreviewPlayerMode;J)V

    const-wide/16 v4, 0x1b58

    invoke-virtual {v1, v3, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 195
    :try_start_0
    const-string v1, "run"

    invoke-direct {p0, v1, v0}, Lcom/melodix/music/PreviewPlayerMode;->job(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lcom/melodix/music/PreviewPlayerMode$6;

    invoke-direct {v1, p0, v7, v8}, Lcom/melodix/music/PreviewPlayerMode$6;-><init>(Lcom/melodix/music/PreviewPlayerMode;J)V

    invoke-virtual {v2, v0, v1}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 201
    goto :goto_3

    :catch_0
    move-exception v0

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->notConfirmed()V

    .line 202
    :goto_3
    return-void

    .line 171
    :cond_f
    :goto_4
    return-void
.end method

.method private job(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 153
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "((function(kind, action, shownState, expectedTitle, expectedTrack) {\n    \'use strict\';\n    // One explicit tap = one job. Methods in order, state re-read after each:\n    // (a) control already in the page, (b) briefly open the now-playing view in\n    // the hidden page and close it again, (c) web-player keyboard shortcut\n    // (shuffle/repeat only: a like is never sent without a verified state).\n    // Never reads storage, cookies or tokens; never navigates; no network.\n    var W = window;\n    var jobs = W.__melodixModeJobs = W.__melodixModeJobs || {};\n    if ([\'like\', \'shuffle\', \'repeat\'].indexOf(kind) < 0) return JSON.stringify({status: \'done\', outcome: \'failed\', reason: \'kind\'});\n    if (action === \'poll\') {\n        var previous = jobs[kind] || {status: \'none\'};\n        // A result can become stale after it was recorded but before native polling.\n        if (kind === \'like\' && previous.status === \'done\' &&\n            (previous.outcome === \'confirmed\' || previous.outcome === \'read\') && !identityMatches()) {\n            previous.outcome = \'identity\'; previous.state = \'unknown\';\n            if (previous.journal && previous.journal.length < 16) previous.journal.push(\'poll:identity\');\n        }\n        return JSON.stringify(previous);\n    }\n    if (action !== \'run\') return JSON.stringify({status: \'none\'});\n    if (jobs[kind] && jobs[kind].status === \'running\' && Date.now() - jobs[kind].started < 8000) return JSON.stringify({status: \'busy\'});\n    var labels = {\n        like: {\n            off: /^(save to your library|add to (your )?(liked songs|library)|ajouter (\u00e0|aux) (la biblioth\u00e8que|titres lik\u00e9s|vos titres lik\u00e9s)|enregistrer dans (votre |la )?biblioth\u00e8que|in (deine |der )?bibliothek (aufnehmen|hinzuf\u00fcgen)|a\u00f1adir a (tu )?biblioteca|adicionar (\u00e0 biblioteca|aos t\u00edtulos curtidos))$/i,\n            on: /^(remove from (your )?(library|liked songs)|retirer (de la biblioth\u00e8que|des titres lik\u00e9s|de vos titres lik\u00e9s)|supprimer de (votre |la )?biblioth\u00e8que|aus (deiner |der )?bibliothek entfernen|quitar de (tu )?biblioteca|remover (da biblioteca|dos t\u00edtulos curtidos))$/i\n        },\n        repeat: {\n            off: /^(enable repeat|turn repeat on|activer la r\u00e9p\u00e9tition|wiederholung aktivieren|activar repetici\u00f3n|ativar repeti\u00e7\u00e3o)$/i,\n            on: /^(disable repeat|turn repeat off|enable repeat one|d\u00e9sactiver la r\u00e9p\u00e9tition|activer la r\u00e9p\u00e9tition d[\'\u2019]un titre|wiederholung deaktivieren|desactivar repetici\u00f3n|desativar repeti\u00e7\u00e3o)$/i\n        },\n        shuffle: {\n            off: /^(enable shuffle|turn shuffle on|activate shuffle|activer (la lecture |le mode |l[\'\u2019])?al\u00e9atoire|zufallswiedergabe aktivieren|activar (el modo |la reproducci\u00f3n )?aleatori[oa]|ativar (a reprodu\u00e7\u00e3o )?aleat\u00f3ria)$/i,\n            on: /^(disable shuffle|turn shuffle off|deactivate shuffle|enable smart shuffle|d\u00e9sactiver (la lecture |le mode |l[\'\u2019])?al\u00e9atoire|activer la lecture al\u00e9atoire intelligente|zufallswiedergabe deaktivieren|desactivar (el modo |la reproducci\u00f3n )?aleatori[oa]|desativar (a reprodu\u00e7\u00e3o )?aleat\u00f3ria)$/i\n        }\n    };\n    // Neutral names locate a control but never decide its state.\n    var neutral = /^(shuffle|lecture al\u00e9atoire|al\u00e9atoire|repeat|r\u00e9p\u00e9ter|r\u00e9p\u00e9tition)$/i;\n    var ids = {\n        like: /^(add-button|remove-button|add-to-library-button|remove-from-library-button)$/i,\n        repeat: /^control-button-repeat$/i,\n        shuffle: /^control-button-shuffle$|shuffle/i\n    };\n    var job = {status: \'running\', started: Date.now(), outcome: \'\', state: \'unknown\', method: \'\', journal: []};\n    jobs[kind] = job;\n    function log(code) { if (job.journal.length < 16) job.journal.push(code); }\n    function finish(outcome, state, method) { job.status = \'done\'; job.outcome = outcome; job.state = state || \'unknown\'; job.method = method || \'\'; }\n    function label(b) { return String(b.getAttribute(\'aria-label\') || \'\').trim(); }\n    function testid(b) { return String(b.getAttribute(\'data-testid\') || \'\'); }\n    // Current Spotify wording varies: a verb plus a liked-songs/library word.\n    (function() {\n        var word = /(titres lik\u00e9s|liked songs|lik\u00e9|liked|favori|biblioth\u00e8que|library|biblioteca|bibliothek)/i, off = labels.like.off, on = labels.like.on;\n        labels.like.off = {test: function(l) { return off.test(l) || (word.test(l) && /^(ajouter|add|enregistrer|save|a\u00f1adir|adicionar|hinzuf\u00fcgen|zu)\\b/i.test(l)); }};\n        labels.like.on = {test: function(l) { return on.test(l) || (word.test(l) && /^(ajout\u00e9|retirer|supprimer|remove|enregistr\u00e9|saved|added|quitar|remover|entfernen)/i.test(l)); }};\n    })();\n    // Spotify\'s \"+\" save button: generic \"Ajouter...\" label, state in aria-checked.\n    function genericAdd(l) { return /^(ajouter|add|enregistrer|save)\\b/i.test(l) && !/(titres lik\u00e9s|liked songs|biblioth\u00e8que|library|file d[\'\u2019]attente|queue)/i.test(l); }\n    function find() {\n        var list = Array.from(document.querySelectorAll(\'button, [role=\"button\"], [role=\"switch\"]\')).filter(function(b) {\n            if (!b.isConnected) return false;\n            var l = label(b);\n            return ids[kind].test(testid(b)) || labels[kind].off.test(l) || labels[kind].on.test(l) ||\n                (kind === \'like\' && b.hasAttribute(\'aria-checked\') && genericAdd(l)) ||\n                (kind !== \'like\' && neutral.test(l) && (kind === \'shuffle\' ? /al[\u00e9e]atoire|shuffle/i : /r[\u00e9e]p[\u00e9e]t|repeat/i).test(l));\n        });\n        if (kind !== \'like\') {\n            // User report (1022300): a disabled shuffle toggle elsewhere in the page (e.g. a\n            // playlist header) was taken for the player\'s and reported as \"blocked by Spotify\".\n            list = list.filter(function(b) {\n                return !b.closest(\'main, [role=\"main\"], [data-testid=\"action-bar-row\"], [data-testid=\"playlist-page\"], [data-testid=\"album-page\"]\');\n            });\n        }\n        if (kind === \'like\') {\n            var scoped = list.filter(function(b) {\n                return b.closest(\':is([data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-widget-v2\"]), [data-testid=\"now-playing-bar\"], [data-testid=\"now-playing-view\"], [data-testid=\"now-playing-panel\"], [data-testid=\"NPV\"]\');\n            });\n            list = scoped;\n        }\n        if (list.length > 1) {\n            var visible = list.filter(function(b) { var r = b.getBoundingClientRect(); return r.width > 0 && r.height > 0; });\n            if (visible.length === 1) list = visible;\n        }\n        if (!list.length) return {reason: \'absent\'};\n        if (list.length !== 1) return {reason: \'ambiguous\'};\n        var b = list[0];\n        if (b.disabled || b.getAttribute(\'aria-disabled\') === \'true\') return {reason: \'disabled\', node: b};\n        return {node: b, reason: \'\'};\n    }\n    function read(b) {\n        var checked = b.getAttribute(\'aria-checked\'), pressed = b.getAttribute(\'aria-pressed\');\n        var raw = checked === null ? pressed : checked;\n        var l = label(b), on = labels[kind].on.test(l), off = labels[kind].off.test(l);\n        if (kind === \'like\') {\n            var id = testid(b).toLowerCase();\n            var remove = /^(remove-button|remove-from-library-button)$/.test(id);\n            if (/^(true|menu|dialog|listbox|tree|grid)$/i.test(String(b.getAttribute(\'aria-haspopup\') || \'\')) ||\n                b.matches(\':disabled\') || b.closest(\'[aria-disabled=\"true\"], fieldset:disabled\') ||\n                (checked !== null && pressed !== null && checked !== pressed)) return \'unknown\';\n            if (raw !== null && raw !== \'true\' && raw !== \'false\') return \'unknown\';\n            if (raw === null) raw = on ? \'true\' : off ? \'false\' : \'unknown\';\n            // Once liked, Spotify relabels the checked button generically (phone 1022229).\n            if (raw === \'true\' && checked === \'true\' && !on && !off && genericAdd(l)) on = true;\n            if ((raw === \'false\' && (on || remove)) || (raw === \'true\' && off)) return \'unknown\';\n            // An unlabelled generic add-button may open a playlist picker.\n            if (!off && !on) return \'unknown\';\n            return raw;\n        }\n        if (raw === \'true\' || raw === \'false\' || raw === \'mixed\') return raw;\n        return on ? \'true\' : off ? \'false\' : \'unknown\';\n    }\n    // Spotify\'s bar title links to the album with the track in ?highlight=spotify:track:ID.\n    function trackHref(h) {\n        h = String(h || \'\');\n        // A Spotify URI is a complete identity, unlike an album or title.\n        var uri = /^spotify:(track|episode):([a-z0-9]+)$/i.exec(h);\n        if (uri) return uri;\n        var m = /^(?:https:\\/\\/open\\.spotify\\.com)?\\/(?:intl-[a-z]{2}(?:-[a-z]{2})?\\/)?(track|episode)\\/([a-z0-9]+)\\/?(?:[?#].*)?$/i.exec(h);\n        if (m) return m;\n        var a = /^(?:https:\\/\\/open\\.spotify\\.com)?\\/(?:intl-[a-z]{2}(?:-[a-z]{2})?\\/)?album\\/[a-z0-9]+\\/?\\?(?:[^#]*&)?highlight=spotify(?::|%3a)(track)(?::|%3a)([a-z0-9]+)(?:[&#].*)?$/i.exec(h);\n        if (a) {\n            // Duplicate highlight keys, including encoded/case variants,\n            // have ambiguous semantics. Never choose one arbitrarily.\n            try {\n                var query = new URL(h, \'https://open.spotify.com\').searchParams;\n                var values = [];\n                query.forEach(function(value, key) { if (key.toLowerCase() === \'highlight\') values.push(value); });\n                if (values.length !== 1 || !/^spotify:track:[a-z0-9]+$/i.test(values[0])) return null;\n                var parts = /^spotify:(track):([a-z0-9]+)$/i.exec(values[0]);\n                return [a[0], parts[1], parts[2]];\n            } catch (_) { return null; }\n        }\n        return null; // an album and title cannot uniquely identify a track\n    }\n    // Explicit track URIs on the current-player title only; never infer a\n    // track from an album, playlist, title alone, or an unrelated page row.\n    function markedTrack(n) {\n        if (!/^(context-item-link|nowplaying-track-link|context-item-info-title)$/i.test(String(n.getAttribute(\'data-testid\') || \'\'))) return \'\';\n        var result = \'\';\n        for (var name of [\'data-uri\', \'data-track-uri\', \'data-spotify-uri\']) {\n            if (!n.hasAttribute(name)) continue;\n            var m = /^spotify:(track|episode):([a-z0-9]+)$/i.exec(String(n.getAttribute(name) || \'\'));\n            if (!m) return \'!\';\n            var value = m[1].toLowerCase()+\':\'+m[2];\n            if (result && result !== value) return \'!\';\n            result = value;\n        }\n        return result;\n    }\n    // If a title link itself carries a malformed track hint, an attribute\n    // must not mask that ambiguity. Album-only links may use their explicit\n    // current-title parent marker, but never one outside the player bar.\n    function hasTrackHint(h) {\n        h=String(h||\'\');\n        if (/^spotify:(track|episode):/i.test(h) || /\\/(track|episode)\\//i.test(h)) return true;\n        try {\n            var found=false;\n            new URL(h, \'https://open.spotify.com\').searchParams.forEach(function(v,k){if(k.toLowerCase()===\'highlight\')found=true;});\n            return found;\n        } catch (_) { return true; }\n    }\n    function parentTrack(link) {\n        var n=link.closest(\'[data-testid=\"context-item-info-title\"]\');\n        if(!n || !n.closest(\':is([data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-widget-v2\"]), [data-testid=\"now-playing-bar\"]\')) return \'\';\n        return markedTrack(n);\n    }\n    function markedTitleNodes() {\n        return Array.from(document.querySelectorAll(\':is([data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-widget-v2\"]) [data-testid=\"context-item-link\"], :is([data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-widget-v2\"]) [data-testid=\"nowplaying-track-link\"], :is([data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-widget-v2\"]) [data-testid=\"context-item-info-title\"], [data-testid=\"now-playing-bar\"] [data-testid=\"context-item-link\"], [data-testid=\"now-playing-bar\"] [data-testid=\"nowplaying-track-link\"], [data-testid=\"now-playing-bar\"] [data-testid=\"context-item-info-title\"]\')).filter(function(n) { return n.isConnected; });\n    }\n    function identityMatches() {\n        if (!expectedTitle || !expectedTrack) return false;\n        if (expectedTrack === \'title:\' + expectedTitle) {\n            // Id-less bar: no track link may exist, the native title must appear in the bar text.\n            if (document.querySelector(\':is([data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-widget-v2\"]) a[href*=\"/track/\"], [data-testid=\"now-playing-bar\"] a[href*=\"/track/\"]\')) return false;\n            return Array.from(document.querySelectorAll(\':is([data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-widget-v2\"]), [data-testid=\"now-playing-bar\"]\')).some(function(r) {\n                return String(r.textContent || \'\').replace(/\\s+/g, \' \').toLowerCase().indexOf(String(expectedTitle).replace(/\\s+/g, \' \').trim().toLowerCase()) >= 0;\n            });\n        }\n        var links = Array.from(document.querySelectorAll(\':is([data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-widget-v2\"]) a[href], [data-testid=\"now-playing-bar\"] a[href], a[data-testid=\"nowplaying-track-link\"][href], [data-testid=\"now-playing-view\"] a[href]\'));\n        var malformedIdentity = false;\n        var identities = links.map(function(link) {\n            var m = trackHref(String(link.getAttribute(\'href\') || \'\'));\n            if (!m && /^(context-item-link|nowplaying-track-link)$/i.test(String(link.getAttribute(\'data-testid\') || \'\')) && (hasTrackHint(link.getAttribute(\'href\')) || (!markedTrack(link) && !parentTrack(link)))) malformedIdentity = true;\n            return m ? {track:m[1].toLowerCase()+\':\'+m[2],title:String(link.textContent || \'\').replace(/\\s+/g, \' \').trim()} : null;\n        }).filter(Boolean);\n        markedTitleNodes().forEach(function(n) {\n            var value=markedTrack(n);\n            if (value === \'!\') { malformedIdentity = true; return; }\n            if (value) identities.push({track:value, title:String(n.textContent || \'\').replace(/\\s+/g, \' \').trim()});\n        });\n        return !malformedIdentity && identities.some(function(x) { return x.title === expectedTitle; }) && identities.every(function(x) {\n            return x.track === expectedTrack && (!x.title || x.title === expectedTitle);\n        });\n    }\n    function opener() {\n        var list = Array.from(document.querySelectorAll(\'button, [role=\"button\"]\')).filter(function(b) {\n            if (!b.isConnected) return false;\n            var id = testid(b), l = label(b);\n            return /^(control-button-npv|now-playing-view-button)$/i.test(id) ||\n                /^(now playing view|show now playing view|hide now playing view|vue \u00ab ?en cours de lecture ?\u00bb|afficher la vue en cours de lecture|masquer la vue en cours de lecture|en cours de lecture|ansicht \u201el\u00e4uft gerade\u201c|vista de reproducci\u00f3n|tela tocando agora)$/i.test(l);\n        });\n        return list.length === 1 ? list[0] : null;\n    }\n    function pressed(b) { return b.getAttribute(\'aria-pressed\') === \'true\' || b.getAttribute(\'aria-expanded\') === \'true\' || b.getAttribute(\'data-active\') === \'true\'; }\n    function wait(test, ms, done) {\n        var end = Date.now() + ms;\n        (function step() {\n            var v;\n            try { v = test(); } catch (_) { v = null; }\n            if (v || Date.now() >= end) { done(v || null); return; }\n            setTimeout(step, 120);\n        })();\n    }\n    function invalidateLikedRead() {\n        try { if (typeof W.__sfLikedMutationAttempted === \'function\') W.__sfLikedMutationAttempted(); } catch (_) {}\n    }\n    // Open only an explicitly announced add menu, then act only on a unique,\n    // explicitly unchecked Liked Songs item. Never select another playlist.\n    function viaLikeMenu(b, method, after) {\n        var id = testid(b).toLowerCase(), l = label(b), popup = String(b.getAttribute(\'aria-haspopup\') || \'\');\n        // Some Spotify player bars omit aria-haspopup on the generic, unchecked\n        // add-to-playlist trigger. Permit only the known add control in the\n        // already identity-checked player scope; we still act solely on a\n        // fresh, unique, explicitly named Liked Songs checkbox below.\n        var implicitPicker = /^(add-button|add-to-library-button)$/.test(id) && genericAdd(l) && b.getAttribute(\'aria-checked\') === \'false\';\n        if (!/^(true|menu|dialog|listbox)$/i.test(popup) && !implicitPicker) return false;\n        if (!identityMatches()) { log(method + \':menu-identity\'); after(\'identity\', \'unknown\'); return true; }\n        if (!/^(add-button|add-to-library-button)$/.test(id) || labels.like.on.test(l) ||\n            shownState === \'true\' || ((b.getAttribute(\'aria-checked\') === \'true\' || b.getAttribute(\'aria-pressed\') === \'true\') && !genericAdd(l)) ||\n            b.matches(\':disabled\') || b.closest(\'[aria-disabled=\"true\"], fieldset:disabled\')) {\n            log(method + \':menu-unsafe\'); after(\'menu-state\', \'unknown\'); return true;\n        }\n        var selector = \'[role=\"menu\"], [role=\"dialog\"], [role=\"listbox\"]\';\n        function available(n) { return n && n.isConnected && !n.closest(\'[hidden], [aria-hidden=\"true\"]\'); }\n        var before = Array.from(document.querySelectorAll(selector)).filter(available);\n        var expanded = b.getAttribute(\'aria-expanded\') === \'true\', opened = false;\n        function root() {\n            var id = b.getAttribute(\'aria-controls\'), controlled = id && document.getElementById(id);\n            if (available(controlled) && controlled.matches(selector) &&\n                (expanded || before.indexOf(controlled) < 0 || b.getAttribute(\'aria-expanded\') === \'true\')) return controlled;\n            if (expanded) return null;\n            var fresh = Array.from(document.querySelectorAll(selector)).filter(function(n) { return available(n) && before.indexOf(n) < 0; });\n            return fresh.length === 1 ? fresh[0] : null;\n        }\n        function closeMenu(r) {\n            if (!opened) return;\n            try {\n                (available(r) ? r : b).dispatchEvent(new KeyboardEvent(\'keydown\', {key:\'Escape\', code:\'Escape\', bubbles:true, cancelable:true}));\n                log(available(r) && b.getAttribute(\'aria-expanded\') === \'true\' ? method + \':menu-close-unverified\' : method + \':menu-close-requested\');\n            } catch (_) { log(method + \':menu-close-error\'); }\n        }\n        if (!expanded) {\n            try { b.click(); opened = true; log(method + \':menu-open\'); }\n            catch (_) { log(method + \':menu-open-error\'); after(\'menu-absent\', \'unknown\'); return true; }\n        }\n        wait(function() {\n            if (!identityMatches()) return \'identity-changed\';\n            return root();\n        }, 1800, function(r) {\n            if (r === \'identity-changed\') { closeMenu(null); after(\'identity\', \'unknown\'); return; }\n            if (!r) { log(method + \':menu-root\'); closeMenu(null); after(\'menu-absent\', \'unknown\'); return; }\n            var likedName = /^(liked songs|your liked songs|titres lik\u00e9s|vos titres lik\u00e9s|titres que j[\'\u2019]aime|liked-titel|canciones que te gustan|m\u00fasicas curtidas)$/i;\n            function targets() {\n                if (!available(r)) return [];\n                return Array.from(r.querySelectorAll(\'[role=\"menuitemcheckbox\"], [role=\"checkbox\"], input[type=\"checkbox\"]\')).filter(function(n) {\n                    var labelNode = n.closest(\'label\');\n                    var name = String(n.getAttribute(\'aria-label\') || (labelNode && labelNode.textContent) || n.textContent || \'\').replace(/\\s+/g, \' \').trim();\n                    return available(n) && likedName.test(name);\n                });\n            }\n            var candidates = targets();\n            if (candidates.length !== 1) { log(method + (candidates.length ? \':menu-ambiguous\' : \':menu-target\')); closeMenu(r); after(candidates.length ? \'menu-ambiguous\' : \'menu-absent\', \'unknown\'); return; }\n            var target = candidates[0], raw = target.getAttribute(\'aria-checked\');\n            var checked = target.tagName === \'INPUT\' && target.type === \'checkbox\' ? (target.checked ? \'true\' : \'false\') : null;\n            if (checked !== null && raw !== null && raw !== checked) raw = \'unknown\';\n            else if (raw === null) raw = checked;\n            if (target.matches(\':disabled\') || target.closest(\'[aria-disabled=\"true\"], fieldset:disabled\') || (raw !== \'true\' && raw !== \'false\')) {\n                log(method + \':menu-state\'); closeMenu(r); after(\'menu-state\', \'unknown\'); return;\n            }\n            if (raw === \'true\') { log(method + \':menu-liked\'); closeMenu(r); after(\'read\', \'true\'); return; }\n            if (!identityMatches()) { closeMenu(r); after(\'identity\', \'unknown\'); return; }\n            invalidateLikedRead();\n            try { target.click(); log(method + \':menu-add\'); }\n            catch (_) { log(method + \':menu-add-error\'); closeMenu(r); after(\'unconfirmed\', \'unknown\'); return; }\n            wait(function() {\n                if (!identityMatches()) return \'identity-changed\';\n                var current = targets();\n                if (current.length !== 1 || current[0].matches(\':disabled\') || current[0].closest(\'[aria-disabled=\"true\"], fieldset:disabled\')) return null;\n                // React may replace the checkbox after the click; only the\n                // unique explicit Liked Songs item in the same menu is read.\n                var observed = current[0];\n                var a = observed.getAttribute(\'aria-checked\');\n                var c = observed.tagName === \'INPUT\' && observed.type === \'checkbox\' ? observed.checked : null;\n                return (a === \'true\' && c !== false) || (a === null && c === true) ? \'true\' : null;\n            }, 2200, function(state) {\n                closeMenu(r);\n                if (state === \'identity-changed\') { log(method + \':menu-identity\'); after(\'identity\', \'unknown\'); }\n                else if (state === \'true\') { log(method + \':menu-verified\'); after(\'confirmed\', \'true\'); }\n                else { log(method + \':menu-unverified\'); after(\'unconfirmed\', \'false\'); }\n            });\n        });\n        return true;\n    }\n    // Spotify removes a like either directly or through its playlist picker,\n    // where only the unique checked Liked Songs item is unchecked, then Done.\n    function unlike(b, method, after) {\n        var selector = \'[role=\"menu\"], [role=\"dialog\"], [role=\"listbox\"]\';\n        var likedName = /^(liked songs|your liked songs|titres lik\u00e9s|vos titres lik\u00e9s|titres que j[\'\u2019]aime|liked-titel|canciones que te gustan|m\u00fasicas curtidas)$/i;\n        function available(n) { return n && n.isConnected && !n.closest(\'[hidden], [aria-hidden=\"true\"]\'); }\n        var before = Array.from(document.querySelectorAll(selector)).filter(available);\n        var doneRe = /^(termin\u00e9|terminer|done|ok|valider|enregistrer|save)$/i;\n        function doneButtons() { return Array.from(document.querySelectorAll(\'button, [role=\"button\"]\')).filter(function(n) { return available(n) && doneRe.test(String(n.getAttribute(\'aria-label\') || n.textContent || \'\').replace(/\\s+/g, \' \').trim()); }); }\n        var doneBefore = doneButtons();\n        // The picker can render empty first and fill later: wait for the fresh root that holds the target.\n        function fresh() { var f = Array.from(document.querySelectorAll(selector)).filter(function(n) { return available(n) && before.indexOf(n) < 0; }); var withTarget = f.filter(function(n) { return targets(n).length; }); return withTarget.length === 1 ? withTarget[0] : null; }\n        function anyFresh() { return Array.from(document.querySelectorAll(selector)).filter(function(n) { return available(n) && before.indexOf(n) < 0; })[0] || null; }\n        function barState() { var a = find(); return a.node ? read(a.node) : \'unknown\'; }\n        var checkSel = \'[role=\"menuitemcheckbox\"], [role=\"checkbox\"], [role=\"switch\"], input[type=\"checkbox\"], [aria-checked], [aria-pressed]\';\n        function targets(r) {\n            // The Liked Songs name may sit beside its checkbox: climb from the exact\n            // name to the nearest ancestor holding exactly one checkable control.\n            var out = [];\n            Array.from(r.querySelectorAll(\'*\')).forEach(function(n) {\n                if (!available(n) || n.children.length > 1) return;\n                var name = String(n.getAttribute(\'aria-label\') || n.textContent || \'\').replace(/\\s+/g, \' \').trim();\n                if (!likedName.test(name)) return;\n                for (var p = n; p && p !== r.parentNode; p = p.parentElement) {\n                    var c = (p.matches && p.matches(checkSel) ? [p] : []).concat(Array.from(p.querySelectorAll(checkSel))).filter(available);\n                    if (c.length === 1) { if (out.indexOf(c[0]) < 0) out.push(c[0]); return; }\n                    if (c.length > 1) return;\n                }\n            });\n            return out;\n        }\n        function counts(r) { return \'-c\' + Math.min(r.querySelectorAll(checkSel).length, 99) + \'-n\' + Math.min(Array.from(r.querySelectorAll(\'*\')).filter(function(n) { return n.children.length <= 1 && likedName.test(String(n.textContent || \'\').replace(/\\s+/g, \' \').trim()); }).length, 99); }\n        function close(r) { try { (available(r) ? r : b).dispatchEvent(new KeyboardEvent(\'keydown\', {key:\'Escape\', code:\'Escape\', bubbles:true, cancelable:true})); } catch (_) {} }\n        invalidateLikedRead();\n        try { b.click(); log(method + \':unlike-open\'); } catch (_) { after(\'command\', \'true\'); return; }\n        wait(function() {\n            if (!identityMatches()) return \'identity-changed\';\n            if (barState() === \'false\') return \'direct\';\n            return fresh();\n        }, 3500, function(r) {\n            if (r === \'identity-changed\') { after(\'identity\', \'unknown\'); return; }\n            if (r === \'direct\') { log(method + \':unlike-verified\'); after(\'confirmed\', \'false\'); return; }\n            if (!r) { var o = anyFresh(); log(method + (o ? \':unlike-target\' + counts(o) : \':unlike-no-picker\') + \'-d\' + Math.min(document.querySelectorAll(selector).length, 99)); close(o); after(\'menu-absent\', \'true\'); return; }\n            var t = targets(r);\n            if (t.length !== 1) { log(method + (t.length ? \':unlike-ambiguous\' : \':unlike-target\') + counts(r)); close(r); after(t.length ? \'menu-ambiguous\' : \'menu-absent\', \'true\'); return; }\n            var on = t[0].getAttribute(\'aria-checked\') === \'true\' || t[0].checked === true;\n            if (!on) { log(method + \':unlike-not-checked\'); close(r); after(\'menu-state\', \'true\'); return; }\n            try { t[0].click(); log(method + \':unlike-uncheck\'); } catch (_) { close(r); after(\'unconfirmed\', \'true\'); return; }\n            // Spotify\'s picker keeps its Done button in a footer outside the list root, and\n            // closing without it (Escape) discards the change: look for a Done button that\n            // appeared with the picker, inside it first, then anywhere on the page.\n            // Phone 1022277: no Done existed before the uncheck, so it can appear only after it.\n            function findDone() {\n                var d = Array.from(r.querySelectorAll(\'button, [role=\"button\"]\')).filter(function(n) { return available(n) && doneRe.test(String(n.getAttribute(\'aria-label\') || n.textContent || \'\').replace(/\\s+/g, \' \').trim()); });\n                return d.length ? d : doneButtons().filter(function(n) { return doneBefore.indexOf(n) < 0; });\n            }\n            wait(function() {\n                if (!identityMatches()) return \'identity-changed\';\n                var d = findDone(); return d.length === 1 ? d : null;\n            }, 1500, function(found) {\n            if (found === \'identity-changed\') { if (available(r)) close(r); after(\'identity\', \'unknown\'); return; }\n            var done = Array.isArray(found) ? found : [];\n            if (done.length === 1) {\n                try { done[0].click(); log(method + \':unlike-done\'); } catch (_) {}\n                wait(function() {\n                    if (!identityMatches()) return \'identity-changed\';\n                    return barState() === \'false\' ? \'false\' : null;\n                }, 2600, function(st) {\n                    if (available(r)) close(r);\n                    if (st === \'identity-changed\') after(\'identity\', \'unknown\');\n                    else if (st === \'false\') { log(method + \':unlike-verified\'); after(\'confirmed\', \'false\'); }\n                    else { log(method + \':unlike-unverified\'); after(\'unconfirmed\', \'true\'); }\n                });\n                return;\n            }\n            // Some current Spotify menus have no Done button and do not update\n            // the generic player toggle. Confirm only if the exact Liked Songs\n            // checkbox becomes unchecked, survives closing, and remains false\n            // in a freshly reopened menu. Otherwise stay unconfirmed.\n            wait(function() {\n                if (!identityMatches()) return \'identity-changed\';\n                var current = targets(r);\n                return current.length === 1 && current[0].getAttribute(\'aria-checked\') === \'false\' ? \'unchecked\' : null;\n            }, 1200, function(changed) {\n                if (changed !== \'unchecked\') { if (available(r)) close(r); after(changed === \'identity-changed\' ? \'identity\' : \'unconfirmed\', \'true\'); return; }\n                close(r);\n                wait(function() { return !available(r) ? \'closed\' : null; }, 1000, function(closed) {\n                    if (closed !== \'closed\') { after(\'unconfirmed\', \'true\'); return; }\n                    var beforeReopen = Array.from(document.querySelectorAll(selector)).filter(available);\n                    try { b.click(); log(method + \':unlike-recheck-open\'); }\n                    catch (_) { after(\'unconfirmed\', \'true\'); return; }\n                    wait(function() {\n                        if (!identityMatches()) return \'identity-changed\';\n                        var freshMenus = Array.from(document.querySelectorAll(selector)).filter(function(n) { return available(n) && beforeReopen.indexOf(n) < 0; });\n                        var matches = freshMenus.filter(function(n) { return targets(n).length > 0; });\n                        if (matches.length !== 1) return null;\n                        var current = targets(matches[0]);\n                        if (current.length !== 1) return null;\n                        return current[0].getAttribute(\'aria-checked\') === \'false\' ? \'false\' : current[0].getAttribute(\'aria-checked\') === \'true\' ? \'true\' : null;\n                    }, 1800, function(state) {\n                        var reopened = Array.from(document.querySelectorAll(selector)).filter(function(n) { return available(n) && beforeReopen.indexOf(n) < 0; });\n                        if (reopened.length === 1) close(reopened[0]);\n                        if (state === \'identity-changed\') after(\'identity\', \'unknown\');\n                        else if (state === \'false\') { log(method + \':unlike-verified\'); after(\'confirmed\', \'false\'); }\n                        else { log(method + \':unlike-unverified\'); after(\'unconfirmed\', \'true\'); }\n                    });\n                });\n            });\n            });\n        });\n    }\n    // Decide and click on a readable control; verify the change afterwards.\n    function act(found, method, after) {\n        var b = found.node;\n        if (kind === \'like\' && viaLikeMenu(b, method, after)) return;\n        var before = read(b);\n        log(method + \':state-\' + before);\n        if (before === \'unknown\') { after(\'state\', before); return; }\n        if (kind === \'like\') {\n            if (!identityMatches()) { log(method + \':identity\'); after(\'identity\', before); return; }\n            // Remove only when the user tapped a button shown as liked and the page agrees.\n            if (before === \'true\' && shownState === \'true\') { unlike(b, method, after); return; }\n            if (before !== \'false\') { log(method + \':liked-read-only\'); after(\'read\', before); return; }\n            if (shownState === \'true\') { log(method + \':mismatch\'); after(\'read\', before); return; }\n        }\n        if (kind === \'like\') invalidateLikedRead();\n        try { b.click(); log(method + \':click\'); } catch (_) { log(method + \':click-error\'); after(\'command\', before); return; }\n        wait(function() {\n            if (kind === \'like\' && !identityMatches()) return \'identity-changed\';\n            var again = find();\n            if (!again.node) return null;\n            var s = read(again.node);\n            return s !== before && s !== \'unknown\' ? s : null;\n        }, 2200, function(s) {\n            if (s === \'identity-changed\') { log(method + \':identity\'); after(\'identity\', \'unknown\'); }\n            else if (s) { log(method + \':verified\'); after(\'confirmed\', s); }\n            else { log(method + \':unverified\'); after(\'unconfirmed\', before); }\n        });\n    }\n    // App-side repeat-one when Spotify\'s repeat is greyed: just before the end, seek back to 0.\n    function clockMs(sel) {\n        var e = document.querySelector(sel); var t = e ? String(e.textContent || \'\').trim() : \'\';\n        if (!/^\\d+(:\\d{2}){1,2}$/.test(t)) return -1;\n        return t.split(\':\').reduce(function(a, x) { return a * 60 + Number(x); }, 0) * 1000;\n    }\n    function appLoop() {\n        var on = !W.__melodixLoop; W.__melodixLoop = on;\n        if (W.__melodixLoopTimer) { W.clearInterval(W.__melodixLoopTimer); W.__melodixLoopTimer = 0; }\n        if (on) W.__melodixLoopTimer = W.setInterval(function() {\n            var pos = clockMs(\'[data-testid=\"playback-position\"]\'), dur = clockMs(\'[data-testid=\"playback-duration\"]\');\n            if (pos < 0 || dur < 10000 || pos < dur - 2000) return;\n            try { if (typeof W.actSeek === \'function\') W.actSeek(0); } catch (_) {}\n        }, 500);\n        log(\'c:app-loop-\' + (on ? \'on\' : \'off\')); finish(\'confirmed\', on ? \'true\' : \'false\', \'app-loop\');\n    }\n    function viaKeyboard() {\n        if (kind === \'like\') { log(\'c:like-skipped\'); finish(\'failed\', \'unknown\', \'\'); return; }\n        // Blind Alt+R could switch on repeat-one unseen and block skipping (user report 1022295).\n        if (kind === \'repeat\') { log(\'c:repeat-skipped\'); finish(\'failed\', \'unknown\', \'\'); return; }\n        var spec = kind === \'shuffle\' ? {key: \'s\', code: \'KeyS\', keyCode: 83} : {key: \'r\', code: \'KeyR\', keyCode: 82};\n        // Unverifiable when no control is readable, so only ONE combination per\n        // tap (two could cancel each other). Spotify\'s web player uses Alt+S / Alt+R.\n        var ctrl = false;\n        try {\n            var target = document.activeElement && document.activeElement !== document.body ? document.activeElement : document.body;\n            [\'keydown\', \'keyup\'].forEach(function(type) {\n                target.dispatchEvent(new KeyboardEvent(type, {key: spec.key, code: spec.code, keyCode: spec.keyCode, which: spec.keyCode, ctrlKey: ctrl, altKey: !ctrl, bubbles: true, cancelable: true}));\n            });\n            log(\'c:\' + (ctrl ? \'ctrl-\' : \'alt-\') + spec.key); log(\'c:single-unreadable\');\n            finish(\'unverified\', \'unknown\', \'keyboard\');\n        } catch (_) { log(\'c:error\'); finish(\'failed\', \'unknown\', \'\'); }\n    }\n    function result(outcome, state, method) {\n        if (outcome === \'confirmed\' || outcome === \'unconfirmed\' || outcome === \'read\') finish(outcome, state, method);\n        else if (outcome === \'identity\' || outcome === \'menu-absent\' || outcome === \'menu-ambiguous\' || outcome === \'menu-state\') finish(outcome, \'unknown\', method);\n        else finish(\'failed\', state, method);\n    }\n    try {\n        var direct = find();\n        try { log(\'vw:\' + Math.round((W.innerWidth || 0) / 100) * 100); } catch (_) {}\n        log(\'a:\' + (direct.node ? \'found\' : direct.reason));\n        if (direct.node && !direct.reason) { act(direct, \'a\', function(o, s) { result(o, s, \'direct\'); }); return JSON.stringify({status: \'started\'}); }\n        if (direct.reason === \'disabled\') {\n            // User request (1022301): Spotify greys these on this account; try another way.\n            if (kind === \'shuffle\') { log(\'a:disabled\'); viaKeyboard(); return JSON.stringify({status: \'started\'}); }\n            if (kind === \'repeat\') { log(\'a:disabled\'); appLoop(); return JSON.stringify({status: \'started\'}); }\n            finish(\'disabled\', \'unknown\', \'direct\'); return JSON.stringify({status: \'started\'});\n        }\n        var view = opener();\n        if (!view) { log(\'b:no-opener\'); viaKeyboard(); return JSON.stringify({status: \'started\'}); }\n        var wasOpen = pressed(view);\n        if (!wasOpen) { try { view.click(); log(\'b:opened\'); } catch (_) { log(\'b:open-error\'); } }\n        else log(\'b:already-open\');\n        var closeView = function() {\n            if (!wasOpen) {\n                setTimeout(function() {\n                    var again = opener();\n                    try { if (again && pressed(again)) { again.click(); log(\'b:closed\'); } } catch (_) { log(\'b:close-error\'); }\n                }, 150);\n            }\n        };\n        wait(function() { var f = find(); return f.node && !f.reason ? f : null; }, 1800, function(found) {\n            if (!found) { log(\'b:absent\'); closeView(); viaKeyboard(); return; }\n            log(\'b:found\');\n            act(found, \'b\', function(o, s) { closeView(); result(o, s, \'now-playing-view\'); });\n        });\n        return JSON.stringify({status: \'started\'});\n    } catch (_) {\n        finish(\'failed\', \'unknown\', \'\');\n        return JSON.stringify({status: \'started\'});\n    }\n})\n)("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    invoke-static {v1}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p1}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-static {p2}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget-object p2, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v0, "like"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_0

    iget-object p2, p0, Lcom/melodix/music/PreviewPlayerMode;->pendingTitle:Ljava/lang/String;

    goto :goto_0

    :cond_0
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->nativeTitle()Ljava/lang/String;

    move-result-object p2

    :goto_0
    invoke-static {p2}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget-object p2, p0, Lcom/melodix/music/PreviewPlayerMode;->pendingTrack:Ljava/lang/String;

    invoke-static {p2}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, ");"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private likeMissing()Z
    .locals 2

    .line 158
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v1, "like"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "absent"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->track:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->title:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerMode;->sameNativeTitle(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private nativeTitle()Ljava/lang/String;
    .locals 3

    .line 148
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->activity()Landroid/app/Activity;

    move-result-object v0

    const-string v1, ""

    if-nez v0, :cond_0

    return-object v1

    .line 149
    :cond_0
    const v2, 0x7f09023b

    invoke-virtual {v0, v2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 150
    instance-of v2, v0, Landroid/widget/TextView;

    if-eqz v2, :cond_1

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    :cond_1
    return-object v1
.end method

.method private notConfirmed()V
    .locals 8

    .line 73
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->diagnosticIndex()I

    move-result v0

    if-ltz v0, :cond_0

    sget-object v1, Lcom/melodix/music/PreviewPlayerMode;->outcome:[Ljava/lang/String;

    const-string v2, "non confirm\u00e9"

    aput-object v2, v1, v0

    .line 74
    :cond_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v1, "shuffle"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const-string v2, "unknown"

    const/4 v3, 0x0

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerMode;->observedPending:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    move v0, v3

    .line 75
    :goto_0
    iput-boolean v3, p0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    if-nez v0, :cond_2

    iput-object v2, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    :cond_2
    const-string v0, "confirmation"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerMode;->generation:J

    const-wide/16 v6, 0x1

    add-long/2addr v4, v6

    iput-wide v4, p0, Lcom/melodix/music/PreviewPlayerMode;->generation:J

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerMode;->querySerial:J

    add-long/2addr v4, v6

    iput-wide v4, p0, Lcom/melodix/music/PreviewPlayerMode;->querySerial:J

    iput-boolean v3, p0, Lcom/melodix/music/PreviewPlayerMode;->queryInFlight:Z

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->paint()V

    .line 76
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerMode;->running:Z

    if-eqz v0, :cond_5

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->isShown()Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    const-string v1, "Al\u00e9atoire indisponible, R\u00e9essayer"

    goto :goto_1

    :cond_3
    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v2, "like"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    const-string v1, "Like non confirm\u00e9, R\u00e9essayer"

    goto :goto_1

    :cond_4
    const-string v1, "Action non confirm\u00e9e. R\u00e9essayer"

    :goto_1
    invoke-static {v0, v1, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 77
    :cond_5
    return-void
.end method

.method private observe()V
    .locals 13

    .line 113
    const-string v0, ""

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->web()Landroid/webkit/WebView;

    move-result-object v1

    const-string v2, "web"

    const-string v3, "unknown"

    if-nez v1, :cond_0

    iput-object v3, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    iput-object v2, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->paint()V

    return-void

    .line 114
    :cond_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v4

    .line 115
    iget-boolean v6, p0, Lcom/melodix/music/PreviewPlayerMode;->queryInFlight:Z

    if-eqz v6, :cond_1

    iget-wide v6, p0, Lcom/melodix/music/PreviewPlayerMode;->queryStarted:J

    sub-long v6, v4, v6

    const-wide/16 v8, 0x960

    cmp-long v6, v6, v8

    if-gez v6, :cond_1

    return-void

    .line 116
    :cond_1
    const/4 v6, 0x1

    iput-boolean v6, p0, Lcom/melodix/music/PreviewPlayerMode;->queryInFlight:Z

    iput-wide v4, p0, Lcom/melodix/music/PreviewPlayerMode;->queryStarted:J

    .line 117
    iget-wide v9, p0, Lcom/melodix/music/PreviewPlayerMode;->generation:J

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerMode;->querySerial:J

    const-wide/16 v6, 0x1

    add-long v11, v4, v6

    iput-wide v11, p0, Lcom/melodix/music/PreviewPlayerMode;->querySerial:J

    .line 118
    :try_start_0
    const-string v4, "query"

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->nativeTitle()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v4, v0, v0, v5}, Lcom/melodix/music/PreviewPlayerMode;->call(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v4, Lcom/melodix/music/PreviewPlayerMode$3;

    move-object v7, v4

    move-object v8, p0

    invoke-direct/range {v7 .. v12}, Lcom/melodix/music/PreviewPlayerMode$3;-><init>(Lcom/melodix/music/PreviewPlayerMode;JJ)V

    invoke-virtual {v1, v0, v4}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 137
    goto :goto_0

    :catch_0
    move-exception v0

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerMode;->queryInFlight:Z

    iput-object v3, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    iput-object v2, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->paint()V

    .line 138
    :goto_0
    return-void
.end method

.method private paint()V
    .locals 17

    .line 272
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    const-string v2, "unknown"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    .line 273
    const/4 v3, 0x1

    xor-int/2addr v1, v3

    iget-object v4, v0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    .line 274
    iget-object v5, v0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v6, "shuffle"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    const-string v7, "true"

    const-string v8, "like"

    if-nez v5, :cond_0

    iget-object v5, v0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    invoke-virtual {v5, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    :cond_0
    iget-boolean v5, v0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    if-eqz v5, :cond_3

    iget-object v4, v0, Lcom/melodix/music/PreviewPlayerMode;->pendingState:Ljava/lang/String;

    const-string v5, "false"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    move-object v4, v7

    goto :goto_0

    :cond_1
    iget-object v4, v0, Lcom/melodix/music/PreviewPlayerMode;->pendingState:Ljava/lang/String;

    invoke-virtual {v4, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    move-object v4, v5

    goto :goto_0

    :cond_2
    move-object v4, v2

    .line 275
    :cond_3
    :goto_0
    invoke-virtual {v4, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    const-string v7, "mixed"

    const/4 v9, 0x0

    if-nez v5, :cond_5

    invoke-virtual {v4, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    goto :goto_1

    :cond_4
    move v5, v9

    goto :goto_2

    :cond_5
    :goto_1
    move v5, v3

    .line 277
    :goto_2
    iget-object v10, v0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    invoke-virtual {v10, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    const-string v11, "R\u00e9p\u00e9tition d\u00e9sactiv\u00e9e"

    const-string v12, "repoff"

    const-string v13, "repone"

    if-eqz v10, :cond_9

    if-eqz v5, :cond_6

    const-string v2, "favon"

    goto :goto_3

    :cond_6
    const-string v2, "favoff"

    :goto_3
    if-nez v1, :cond_7

    const-string v4, "Like indisponible"

    goto/16 :goto_8

    :cond_7
    if-eqz v5, :cond_8

    const-string v4, "Titre aim\u00e9"

    goto :goto_8

    :cond_8
    const-string v4, "Ajouter aux titres lik\u00e9s"

    goto :goto_8

    .line 278
    :cond_9
    iget-object v10, v0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    invoke-virtual {v10, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_d

    invoke-virtual {v4, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_a

    const-string v7, "smart_shuffle"

    goto :goto_4

    :cond_a
    move-object v7, v6

    :goto_4
    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_b

    const-string v2, "Al\u00e9atoire : \u00e9tat inconnu"

    :goto_5
    move-object v4, v2

    goto :goto_6

    :cond_b
    if-eqz v5, :cond_c

    const-string v2, "Lecture al\u00e9atoire activ\u00e9e"

    goto :goto_5

    :cond_c
    const-string v2, "Lecture al\u00e9atoire d\u00e9sactiv\u00e9e"

    goto :goto_5

    :goto_6
    move-object v2, v7

    goto :goto_8

    .line 279
    :cond_d
    iget-object v2, v0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    invoke-virtual {v2, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_e

    move-object v2, v13

    goto :goto_7

    :cond_e
    if-eqz v5, :cond_f

    const-string v2, "repon"

    goto :goto_7

    :cond_f
    move-object v2, v12

    :goto_7
    if-nez v1, :cond_10

    const-string v4, "R\u00e9p\u00e9tition indisponible"

    goto :goto_8

    :cond_10
    iget-object v4, v0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    invoke-virtual {v4, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_11

    const-string v4, "R\u00e9p\u00e9ter le titre"

    goto :goto_8

    :cond_11
    if-eqz v5, :cond_12

    const-string v4, "R\u00e9p\u00e9ter la liste"

    goto :goto_8

    :cond_12
    move-object v4, v11

    .line 280
    :goto_8
    iget-boolean v7, v0, Lcom/melodix/music/PreviewPlayerMode;->running:Z

    if-eqz v7, :cond_13

    if-nez v1, :cond_13

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v14

    move-object v10, v4

    iget-wide v3, v0, Lcom/melodix/music/PreviewPlayerMode;->visibleSince:J

    sub-long/2addr v14, v3

    const-wide/16 v3, 0x960

    cmp-long v3, v14, v3

    if-gez v3, :cond_14

    const/4 v3, 0x1

    goto :goto_9

    :cond_13
    move-object v10, v4

    :cond_14
    move v3, v9

    .line 281
    :goto_9
    if-eqz v3, :cond_15

    const v2, 0x108005f

    goto :goto_a

    :cond_15
    invoke-direct {v0, v2}, Lcom/melodix/music/PreviewPlayerMode;->drawable(Ljava/lang/String;)I

    move-result v2

    :goto_a
    if-eqz v2, :cond_16

    invoke-virtual {v0, v2}, Lcom/melodix/music/PreviewPlayerMode;->setImageResource(I)V

    .line 283
    :cond_16
    const/high16 v4, 0x3f800000    # 1.0f

    if-eqz v2, :cond_19

    iget v14, v0, Lcom/melodix/music/PreviewPlayerMode;->lastIcon:I

    if-eqz v14, :cond_19

    iget v14, v0, Lcom/melodix/music/PreviewPlayerMode;->lastIcon:I

    if-eq v2, v14, :cond_19

    if-nez v3, :cond_19

    sget v14, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v15, 0x1a

    if-lt v14, v15, :cond_18

    invoke-static {}, Landroid/animation/ValueAnimator;->areAnimatorsEnabled()Z

    move-result v14

    if-eqz v14, :cond_17

    goto :goto_b

    :cond_17
    move v15, v5

    goto :goto_c

    :cond_18
    :goto_b
    const v14, 0x3f19999a    # 0.6f

    invoke-virtual {v0, v14}, Lcom/melodix/music/PreviewPlayerMode;->setScaleX(F)V

    invoke-virtual {v0, v14}, Lcom/melodix/music/PreviewPlayerMode;->setScaleY(F)V

    invoke-virtual/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerMode;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v14

    invoke-virtual {v14, v4}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v14

    invoke-virtual {v14, v4}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v14

    move v15, v5

    const-wide/16 v4, 0x104

    invoke-virtual {v14, v4, v5}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v4

    new-instance v5, Landroid/view/animation/OvershootInterpolator;

    const/high16 v14, 0x40200000    # 2.5f

    invoke-direct {v5, v14}, Landroid/view/animation/OvershootInterpolator;-><init>(F)V

    invoke-virtual {v4, v5}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/ViewPropertyAnimator;->start()V

    goto :goto_c

    :cond_19
    move v15, v5

    .line 284
    :goto_c
    iput v2, v0, Lcom/melodix/music/PreviewPlayerMode;->lastIcon:I

    .line 285
    iget-boolean v2, v0, Lcom/melodix/music/PreviewPlayerMode;->running:Z

    if-eqz v2, :cond_1a

    if-nez v1, :cond_1a

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerMode;->tappable()Z

    move-result v2

    if-eqz v2, :cond_1a

    if-nez v3, :cond_1a

    const/4 v2, 0x1

    goto :goto_d

    :cond_1a
    move v2, v9

    .line 286
    :goto_d
    if-nez v1, :cond_1b

    if-eqz v2, :cond_1b

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerMode;->shuffleMissing()Z

    move-result v4

    if-eqz v4, :cond_1b

    const-string v4, "Lecture al\u00e9atoire"

    goto/16 :goto_12

    .line 287
    :cond_1b
    if-nez v1, :cond_1c

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerMode;->likeMissing()Z

    move-result v4

    if-eqz v4, :cond_1c

    const-string v4, "Like indisponible : bouton absent de la page Spotify"

    goto/16 :goto_12

    .line 288
    :cond_1c
    const-string v4, ")"

    const-string v5, "Al\u00e9atoire"

    const-string v14, "R\u00e9p\u00e9tition"

    const-string v16, "Like"

    if-nez v1, :cond_1f

    if-eqz v2, :cond_1f

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "\u00c9tat inconnu : touchez pour essayer ("

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v10, v0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    invoke-virtual {v10, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_1d

    move-object/from16 v5, v16

    goto :goto_e

    :cond_1d
    iget-object v10, v0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    invoke-virtual {v10, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_1e

    goto :goto_e

    :cond_1e
    move-object v5, v14

    :goto_e
    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_12

    .line 289
    :cond_1f
    if-nez v1, :cond_24

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    if-eqz v3, :cond_20

    const-string v10, "Chargement : "

    goto :goto_f

    :cond_20
    const-string v10, "Indisponible : "

    :goto_f
    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerMode;->reasonText()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v10, " ("

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v10, v0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    invoke-virtual {v10, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_21

    move-object/from16 v5, v16

    goto :goto_10

    :cond_21
    iget-object v10, v0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    invoke-virtual {v10, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_22

    goto :goto_10

    :cond_22
    move-object v5, v14

    :goto_10
    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, v0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_23

    const-string v5, " ; n\u00e9cessite un contr\u00f4le et un \u00e9tat Spotify reconnus"

    goto :goto_11

    :cond_23
    const-string v5, ""

    :goto_11
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_12

    :cond_24
    move-object v4, v10

    .line 290
    :goto_12
    iget-object v5, v0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_25

    if-eqz v1, :cond_25

    sput-boolean v9, Lcom/melodix/music/PreviewPlayerMode;->shuffleLocked:Z

    .line 291
    :cond_25
    iget-object v5, v0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_26

    sget-boolean v5, Lcom/melodix/music/PreviewPlayerMode;->shuffleLocked:Z

    if-eqz v5, :cond_26

    if-nez v1, :cond_26

    iget-boolean v5, v0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    if-nez v5, :cond_26

    const/4 v5, 0x1

    goto :goto_13

    :cond_26
    move v5, v9

    .line 292
    :goto_13
    iget-object v7, v0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v10, "repeat"

    invoke-virtual {v7, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_27

    sget-boolean v7, Lcom/melodix/music/PreviewPlayerMode;->appLoop:Z

    if-eqz v7, :cond_27

    iget-boolean v7, v0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    if-nez v7, :cond_27

    const/4 v7, 0x1

    goto :goto_14

    :cond_27
    move v7, v9

    .line 293
    :goto_14
    iget-object v14, v0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    invoke-virtual {v14, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_28

    sget-boolean v10, Lcom/melodix/music/PreviewPlayerMode;->appLoopSeen:Z

    if-eqz v10, :cond_28

    sget-boolean v10, Lcom/melodix/music/PreviewPlayerMode;->appLoop:Z

    if-nez v10, :cond_28

    if-nez v1, :cond_28

    iget-boolean v10, v0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    if-nez v10, :cond_28

    const/4 v10, 0x1

    goto :goto_15

    :cond_28
    move v10, v9

    .line 294
    :goto_15
    if-eqz v10, :cond_29

    invoke-direct {v0, v12}, Lcom/melodix/music/PreviewPlayerMode;->drawable(Ljava/lang/String;)I

    move-result v4

    if-eqz v4, :cond_2a

    invoke-direct {v0, v12}, Lcom/melodix/music/PreviewPlayerMode;->drawable(Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v0, v4}, Lcom/melodix/music/PreviewPlayerMode;->setImageResource(I)V

    goto :goto_16

    :cond_29
    move-object v11, v4

    .line 295
    :cond_2a
    :goto_16
    if-eqz v7, :cond_2c

    invoke-direct {v0, v13}, Lcom/melodix/music/PreviewPlayerMode;->drawable(Ljava/lang/String;)I

    move-result v4

    if-eqz v4, :cond_2b

    invoke-direct {v0, v13}, Lcom/melodix/music/PreviewPlayerMode;->drawable(Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v0, v4}, Lcom/melodix/music/PreviewPlayerMode;->setImageResource(I)V

    .line 296
    :cond_2b
    const-string v11, "R\u00e9p\u00e9ter le titre (boucle Melodix)"

    const/4 v15, 0x1

    :cond_2c
    if-eqz v5, :cond_2e

    invoke-direct {v0, v6}, Lcom/melodix/music/PreviewPlayerMode;->drawable(Ljava/lang/String;)I

    move-result v4

    if-eqz v4, :cond_2d

    invoke-direct {v0, v6}, Lcom/melodix/music/PreviewPlayerMode;->drawable(Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v0, v4}, Lcom/melodix/music/PreviewPlayerMode;->setImageResource(I)V

    .line 297
    :cond_2d
    const-string v11, "Lecture al\u00e9atoire activ\u00e9e (impos\u00e9e par Spotify)"

    const/4 v15, 0x1

    :cond_2e
    if-eqz v15, :cond_2f

    const/4 v4, -0x1

    goto :goto_17

    :cond_2f
    const v4, -0x5e5e56

    :goto_17
    invoke-virtual {v0, v4}, Lcom/melodix/music/PreviewPlayerMode;->setColorFilter(I)V

    iget-boolean v4, v0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    if-eqz v4, :cond_30

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, ", en attente"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    :cond_30
    invoke-virtual {v0, v11}, Lcom/melodix/music/PreviewPlayerMode;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 298
    if-nez v5, :cond_3b

    if-nez v7, :cond_3b

    if-eqz v10, :cond_31

    goto :goto_1b

    .line 299
    :cond_31
    if-nez v1, :cond_32

    if-nez v2, :cond_32

    iget-object v4, v0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    invoke-virtual {v4, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_33

    iget-boolean v4, v0, Lcom/melodix/music/PreviewPlayerMode;->running:Z

    if-eqz v4, :cond_33

    :cond_32
    const/4 v9, 0x1

    :cond_33
    invoke-virtual {v0, v9}, Lcom/melodix/music/PreviewPlayerMode;->setEnabled(Z)V

    if-eqz v2, :cond_35

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerMode;->shuffleMissing()Z

    move-result v1

    if-eqz v1, :cond_34

    const/high16 v4, 0x3f000000    # 0.5f

    goto :goto_1a

    :cond_34
    const v4, 0x3f4ccccd    # 0.8f

    goto :goto_1a

    :cond_35
    iget-object v2, v0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    invoke-virtual {v2, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    const v4, 0x3eb33333    # 0.35f

    const v5, 0x3f266666    # 0.65f

    if-eqz v2, :cond_37

    iget-boolean v2, v0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    if-eqz v2, :cond_36

    :goto_18
    move v4, v5

    goto :goto_1a

    :cond_36
    if-eqz v1, :cond_3a

    goto :goto_19

    :cond_37
    if-nez v1, :cond_38

    if-eqz v3, :cond_3a

    goto :goto_18

    :cond_38
    iget-boolean v1, v0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    if-eqz v1, :cond_39

    goto :goto_18

    :cond_39
    :goto_19
    const/high16 v4, 0x3f800000    # 1.0f

    :cond_3a
    :goto_1a
    invoke-virtual {v0, v4}, Lcom/melodix/music/PreviewPlayerMode;->setAlpha(F)V

    invoke-virtual/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerMode;->invalidate()V

    .line 300
    return-void

    .line 298
    :cond_3b
    :goto_1b
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/melodix/music/PreviewPlayerMode;->setEnabled(Z)V

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Lcom/melodix/music/PreviewPlayerMode;->setAlpha(F)V

    invoke-virtual/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerMode;->invalidate()V

    return-void
.end method

.method private parse(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 2

    .line 104
    const/4 v0, 0x0

    :try_start_0
    new-instance v1, Lorg/json/JSONTokener;

    invoke-direct {v1, p1}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Lorg/json/JSONTokener;->nextValue()Ljava/lang/Object;

    move-result-object p1

    instance-of v1, p1, Ljava/lang/String;

    if-eqz v1, :cond_0

    new-instance v1, Lorg/json/JSONObject;

    check-cast p1, Ljava/lang/String;

    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v1

    :cond_0
    return-object v0

    .line 105
    :catch_0
    move-exception p1

    return-object v0
.end method

.method private poll(JI)V
    .locals 2

    .line 204
    const/16 v0, 0x1a

    if-le p3, v0, :cond_1

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode;->generation:J

    cmp-long p1, p1, v0

    if-nez p1, :cond_0

    iget-boolean p1, p0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    if-eqz p1, :cond_0

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->notConfirmed()V

    :cond_0
    return-void

    .line 205
    :cond_1
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->handler:Landroid/os/Handler;

    new-instance v1, Lcom/melodix/music/PreviewPlayerMode$7;

    invoke-direct {v1, p0, p1, p2, p3}, Lcom/melodix/music/PreviewPlayerMode$7;-><init>(Lcom/melodix/music/PreviewPlayerMode;JI)V

    const-wide/16 p1, 0xfa

    invoke-virtual {v0, v1, p1, p2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 216
    return-void
.end method

.method private reasonText()Ljava/lang/String;
    .locals 3

    .line 246
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "page"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "page Spotify en cours de chargement"

    return-object v0

    .line 247
    :cond_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "bar"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "barre du lecteur Spotify absente ; lancer un titre"

    return-object v0

    .line 248
    :cond_1
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "control"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, "contr\u00f4le Spotify non reconnu ou absent"

    return-object v0

    .line 249
    :cond_2
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "absent"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    const-string v0, "bouton Like absent de la page Spotify"

    return-object v0

    .line 250
    :cond_3
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "ambiguous"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    const-string v0, "plusieurs contr\u00f4les possibles"

    return-object v0

    .line 251
    :cond_4
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "restriction"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    const-string v0, "L\u2019al\u00e9atoire n\u2019est pas disponible avec ce compte ou cette lecture"

    return-object v0

    .line 252
    :cond_5
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "disabled"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    const-string v0, "contr\u00f4le Spotify d\u00e9sactiv\u00e9"

    return-object v0

    .line 253
    :cond_6
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "menu"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    const-string v0, "menu de biblioth\u00e8que non v\u00e9rifi\u00e9"

    return-object v0

    .line 254
    :cond_7
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "conflict"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    const-string v0, "\u00e9tat et action du contr\u00f4le contradictoires"

    return-object v0

    .line 255
    :cond_8
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "unverified"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    const-string v0, "action d\u2019ajout non v\u00e9rifi\u00e9e"

    return-object v0

    .line 256
    :cond_9
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v2, "identity"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a

    const-string v0, "titre ou identit\u00e9 non confirm\u00e9"

    return-object v0

    .line 257
    :cond_a
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v2, "remembered"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    const-string v0, "dernier \u00e9tat lu"

    return-object v0

    .line 258
    :cond_b
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c

    const-string v0, "commande envoy\u00e9e, \u00e9tat non v\u00e9rifiable"

    return-object v0

    .line 259
    :cond_c
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "command"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d

    const-string v0, "commande indisponible"

    return-object v0

    .line 260
    :cond_d
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "confirmation"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_e

    const-string v0, "action non confirm\u00e9e"

    return-object v0

    .line 261
    :cond_e
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "web"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_f

    const-string v0, "page Spotify ou r\u00e9ponse non accessible"

    return-object v0

    .line 262
    :cond_f
    const-string v0, "\u00e9tat ou langue non reconnu"

    return-object v0
.end method

.method private remember(Lorg/json/JSONObject;)V
    .locals 58

    .line 36
    move-object/from16 v1, p0

    move-object/from16 v0, p1

    const-string v2, ""

    const-string v3, "{}"

    const-string v4, "unknown"

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerMode;->diagnosticIndex()I

    move-result v5

    if-gez v5, :cond_0

    return-void

    .line 38
    :cond_0
    :try_start_0
    new-instance v6, Lorg/json/JSONObject;

    const-string v7, "diagnostic"

    invoke-virtual {v0, v7, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 39
    new-instance v7, Lorg/json/JSONObject;

    const-string v8, "structure"

    invoke-virtual {v6, v8, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v7, v3}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 40
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "bar"

    const-string v9, "view"

    const-string v10, "nodes"

    const-string v11, "playpause"

    const-string v12, "repeat"

    const-string v13, "shuffle"

    const-string v14, "like"

    const-string v15, "queue"

    const-string v16, "volume"

    const-string v17, "lyrics"

    const-string v18, "connect"

    const-string v19, "other"

    const-string v20, "button"

    const-string v21, "switch"

    const-string v22, "slider"

    const-string v23, "aria_shuffle"

    const-string v24, "aria_like"

    const-string v25, "aria_play"

    const-string v26, "aria_pause"

    const-string v27, "aria_other"

    const-string v28, "track_links"

    const-string v29, "track_named"

    const-string v30, "track_generic"

    const-string v31, "track_attr"

    const-string v32, "npv_opener"

    const-string v33, "outside_like_id"

    const-string v34, "outside_like_label"

    const-string v35, "outside_track_links"

    const-string v36, "href_album"

    const-string v37, "href_album_hl"

    const-string v38, "href_hl_ambiguous"

    const-string v39, "href_artist"

    const-string v40, "href_uri"

    const-string v41, "href_other"

    const-string v42, "chk_buttons"

    const-string v43, "chk_likeword"

    const-string v44, "chk_verb_add"

    const-string v45, "chk_verb_on"

    const-string v46, "chk_long"

    const-string v47, "chk_favori"

    const-string v48, "chk_library"

    const-string v49, "chk_liked"

    const-string v50, "chk_add_false"

    const-string v51, "chk_add_true"

    const-string v52, "chk_popup"

    const-string v53, "api_player"

    const-string v54, "api_state"

    const-string v55, "api_library"

    const-string v56, "api_contains"

    const-string v57, "api_add"

    filled-new-array/range {v8 .. v57}, [Ljava/lang/String;

    move-result-object v8

    .line 41
    const/4 v9, 0x0

    :goto_0
    const/16 v10, 0x32

    if-ge v9, v10, :cond_2

    aget-object v10, v8, v9

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v11

    if-lez v11, :cond_1

    const-string v11, ", "

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_1
    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "="

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-static {v7, v10}, Lcom/melodix/music/PreviewPlayerMode;->count(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    .line 42
    :cond_2
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    sput-object v3, Lcom/melodix/music/PreviewPlayerMode;->structure:Ljava/lang/String;

    .line 43
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "\u00e9tat="

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v7, "state"

    invoke-virtual {v6, v7, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "true|false|mixed|unknown"

    invoke-static {v7, v8}, Lcom/melodix/music/PreviewPlayerMode;->allowed(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v7, ", motif="

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v7, "reason"

    .line 44
    invoke-virtual {v6, v7, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "control|page|absent|ambiguous|disabled|restriction|state|conflict|unverified|observed|unknown"

    invoke-static {v7, v8}, Lcom/melodix/music/PreviewPlayerMode;->allowed(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v7, ", commande="

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v7, "command"

    .line 45
    invoke-virtual {v6, v7, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "menu|unspecified|toggle|unknown"

    invoke-static {v7, v8}, Lcom/melodix/music/PreviewPlayerMode;->allowed(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v7, ", libell\u00e9="

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v7, "label"

    .line 46
    invoke-virtual {v6, v7, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v6, "on-action|off-action|unrecognized|absent|unknown"

    invoke-static {v4, v6}, Lcom/melodix/music/PreviewPlayerMode;->allowed(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 47
    iget-object v4, v1, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v6, "like"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 48
    const-string v4, "track"

    invoke-virtual {v0, v4, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v6, "title"

    invoke-virtual {v0, v6, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 49
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", piste_page="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_3

    const-string v3, "absente"

    goto :goto_1

    :cond_3
    const-string v3, "pr\u00e9sente"

    :goto_1
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", titre_page="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 50
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_4

    const-string v0, "absent"

    goto :goto_2

    :cond_4
    invoke-direct {v1, v0}, Lcom/melodix/music/PreviewPlayerMode;->sameNativeTitle(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5

    const-string v0, "coh\u00e9rent"

    goto :goto_2

    :cond_5
    const-string v0, "diff\u00e9rent"

    :goto_2
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 52
    :cond_6
    sget-object v0, Lcom/melodix/music/PreviewPlayerMode;->last:[Ljava/lang/String;

    aput-object v3, v0, v5

    iget-boolean v0, v1, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    if-eqz v0, :cond_7

    sget-object v0, Lcom/melodix/music/PreviewPlayerMode;->after:[Ljava/lang/String;

    aput-object v3, v0, v5
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_3

    .line 53
    :catch_0
    move-exception v0

    sget-object v0, Lcom/melodix/music/PreviewPlayerMode;->last:[Ljava/lang/String;

    const-string v2, "observation indisponible"

    aput-object v2, v0, v5

    iget-boolean v0, v1, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    if-eqz v0, :cond_7

    sget-object v0, Lcom/melodix/music/PreviewPlayerMode;->after:[Ljava/lang/String;

    sget-object v2, Lcom/melodix/music/PreviewPlayerMode;->last:[Ljava/lang/String;

    aget-object v2, v2, v5

    aput-object v2, v0, v5

    goto :goto_4

    :cond_7
    :goto_3
    nop

    .line 54
    :goto_4
    return-void
.end method

.method private sameNativeTitle(Ljava/lang/String;)Z
    .locals 3

    .line 108
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->activity()Landroid/app/Activity;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    if-eqz p1, :cond_2

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_0

    .line 109
    :cond_0
    const v2, 0x7f09023b

    invoke-virtual {v0, v2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 110
    instance-of v2, v0, Landroid/widget/TextView;

    if-eqz v2, :cond_1

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    const/4 v1, 0x1

    :cond_1
    return v1

    .line 108
    :cond_2
    :goto_0
    return v1
.end method

.method private shake()V
    .locals 3

    .line 140
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-lt v0, v1, :cond_0

    invoke-static {}, Landroid/animation/ValueAnimator;->areAnimatorsEnabled()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 141
    :cond_0
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    const/high16 v1, 0x40800000    # 4.0f

    mul-float/2addr v0, v1

    .line 142
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 143
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/ViewPropertyAnimator;->translationX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const-wide/16 v1, 0x46

    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    new-instance v1, Lcom/melodix/music/PreviewPlayerMode$4;

    invoke-direct {v1, p0}, Lcom/melodix/music/PreviewPlayerMode$4;-><init>(Lcom/melodix/music/PreviewPlayerMode;)V

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    .line 145
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 146
    return-void
.end method

.method private shuffleMissing()Z
    .locals 2

    .line 161
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v1, "shuffle"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "absent"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private sync()V
    .locals 5

    .line 302
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->isAttachedToWindow()Z

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->isShown()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->getWindowVisibility()I

    move-result v0

    if-nez v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    move v0, v2

    .line 303
    :goto_0
    if-eqz v0, :cond_1

    iget-boolean v3, p0, Lcom/melodix/music/PreviewPlayerMode;->running:Z

    if-nez v3, :cond_1

    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerMode;->running:Z

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode;->visibleSince:J

    const-string v0, "web"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->paint()V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerMode;->tick:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_1

    .line 304
    :cond_1
    if-nez v0, :cond_2

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerMode;->running:Z

    if-eqz v0, :cond_2

    iput-boolean v2, p0, Lcom/melodix/music/PreviewPlayerMode;->running:Z

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerMode;->tick:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode;->generation:J

    const-wide/16 v3, 0x1

    add-long/2addr v0, v3

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode;->generation:J

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode;->querySerial:J

    add-long/2addr v0, v3

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode;->querySerial:J

    iput-boolean v2, p0, Lcom/melodix/music/PreviewPlayerMode;->queryInFlight:Z

    iput-boolean v2, p0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    const-string v0, "unknown"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->paint()V

    .line 305
    :cond_2
    :goto_1
    return-void
.end method

.method private tappable()Z
    .locals 4

    .line 164
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->likeMissing()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    .line 165
    :cond_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v2, "shuffle"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v2, 0x1

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v3, "repeat"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_1
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v3, "disabled"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    return v2

    .line 166
    :cond_2
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v3, "control"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v3, "absent"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v3, "ambiguous"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v3, "state"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v3, "confirmation"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    .line 167
    const-string v3, "unverified"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v3, "identity"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v3, "remembered"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v3, "observed"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v3, "conflict"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v3, "menu"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    :cond_3
    move v1, v2

    .line 166
    :cond_4
    return v1
.end method

.method private web()Landroid/webkit/WebView;
    .locals 4

    .line 96
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->activity()Landroid/app/Activity;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    .line 97
    :cond_0
    :try_start_0
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v3, "G"

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    instance-of v2, v0, Landroid/webkit/WebView;

    if-eqz v2, :cond_1

    check-cast v0, Landroid/webkit/WebView;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-object v1, v0

    :cond_1
    return-object v1

    .line 98
    :catch_0
    move-exception v0

    return-object v1
.end method


# virtual methods
.method protected onAttachedToWindow()V
    .locals 1

    .line 306
    invoke-super {p0}, Landroid/widget/ImageButton;->onAttachedToWindow()V

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->getTag()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    const-string v0, ""

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->paint()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->sync()V

    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 5

    .line 307
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerMode;->running:Z

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerMode;->handler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerMode;->tick:Ljava/lang/Runnable;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-wide v1, p0, Lcom/melodix/music/PreviewPlayerMode;->generation:J

    const-wide/16 v3, 0x1

    add-long/2addr v1, v3

    iput-wide v1, p0, Lcom/melodix/music/PreviewPlayerMode;->generation:J

    iget-wide v1, p0, Lcom/melodix/music/PreviewPlayerMode;->querySerial:J

    add-long/2addr v1, v3

    iput-wide v1, p0, Lcom/melodix/music/PreviewPlayerMode;->querySerial:J

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerMode;->queryInFlight:Z

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    const-string v0, "unknown"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->paint()V

    invoke-super {p0}, Landroid/widget/ImageButton;->onDetachedFromWindow()V

    return-void
.end method

.method protected onVisibilityChanged(Landroid/view/View;I)V
    .locals 0

    .line 308
    invoke-super {p0, p1, p2}, Landroid/widget/ImageButton;->onVisibilityChanged(Landroid/view/View;I)V

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerMode;->handler:Landroid/os/Handler;

    if-eqz p1, :cond_0

    new-instance p1, Lcom/melodix/music/PreviewPlayerMode$8;

    invoke-direct {p1, p0}, Lcom/melodix/music/PreviewPlayerMode$8;-><init>(Lcom/melodix/music/PreviewPlayerMode;)V

    invoke-virtual {p0, p1}, Lcom/melodix/music/PreviewPlayerMode;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method

.method protected onWindowVisibilityChanged(I)V
    .locals 0

    .line 309
    invoke-super {p0, p1}, Landroid/widget/ImageButton;->onWindowVisibilityChanged(I)V

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerMode;->handler:Landroid/os/Handler;

    if-eqz p1, :cond_0

    new-instance p1, Lcom/melodix/music/PreviewPlayerMode$9;

    invoke-direct {p1, p0}, Lcom/melodix/music/PreviewPlayerMode$9;-><init>(Lcom/melodix/music/PreviewPlayerMode;)V

    invoke-virtual {p0, p1}, Lcom/melodix/music/PreviewPlayerMode;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method

.method public setPressed(Z)V
    .locals 4

    .line 267
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->isPressed()Z

    move-result v0

    invoke-super {p0, p1}, Landroid/widget/ImageButton;->setPressed(Z)V

    .line 268
    if-eq v0, p1, :cond_5

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-lt v0, v1, :cond_0

    invoke-static {}, Landroid/animation/ValueAnimator;->areAnimatorsEnabled()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_4

    .line 269
    :cond_0
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const v1, 0x3f5c28f6    # 0.86f

    const/high16 v2, 0x3f800000    # 1.0f

    if-eqz p1, :cond_1

    move v3, v1

    goto :goto_0

    :cond_1
    move v3, v2

    :goto_0
    invoke-virtual {v0, v3}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    if-eqz p1, :cond_2

    goto :goto_1

    :cond_2
    move v1, v2

    :goto_1
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    if-eqz p1, :cond_3

    const-wide/16 v1, 0x5a

    goto :goto_2

    :cond_3
    const-wide/16 v1, 0xdc

    :goto_2
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    if-eqz p1, :cond_4

    const/4 p1, 0x0

    goto :goto_3

    :cond_4
    new-instance p1, Landroid/view/animation/OvershootInterpolator;

    const/high16 v1, 0x40000000    # 2.0f

    invoke-direct {p1, v1}, Landroid/view/animation/OvershootInterpolator;-><init>(F)V

    :goto_3
    invoke-virtual {v0, p1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 270
    return-void

    .line 268
    :cond_5
    :goto_4
    return-void
.end method
