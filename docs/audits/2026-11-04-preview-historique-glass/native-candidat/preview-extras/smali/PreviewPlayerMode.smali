.class public final Lcom/melodix/music/PreviewPlayerMode;
.super Landroid/widget/ImageButton;
.source "PreviewPlayerMode.java"


# static fields
.field private static final CONFIRM_MS:J = 0x1b58L

.field private static final DIAGNOSTIC:Ljava/lang/String; = "(function(kind) {\n    \'use strict\';\n    // Passive, bounded, allowlisted observations only. No account, track or\n    // arbitrary page text is returned. This probe does not click or send data.\n    var specs={\n        repeat:{selector:\'button[data-testid=\"control-button-repeat\"], [role=\"button\"][data-testid=\"control-button-repeat\"], button[aria-label], [role=\"button\"][aria-label]\', ids:/^control-button-repeat$/i,\n            off:/^(enable repeat|turn repeat on|activer la r\u00e9p\u00e9tition|wiederholung aktivieren|activar repetici\u00f3n|ativar repeti\u00e7\u00e3o)$/i,\n            on:/^(disable repeat|turn repeat off|d\u00e9sactiver la r\u00e9p\u00e9tition|wiederholung deaktivieren|desactivar repetici\u00f3n|desativar repeti\u00e7\u00e3o)$/i},\n        shuffle:{selector:\'button[data-testid*=\"shuffle\" i], button[aria-label], [role=\"button\"][aria-label], [role=\"switch\"][aria-label]\', ids:/shuffle/i,\n            off:/^(enable shuffle|turn shuffle on|activate shuffle|activer (la lecture |le mode |l[\'\u2019])?al\u00e9atoire|zufallswiedergabe aktivieren|activar (el modo |la reproducci\u00f3n )?aleatori[oa]|ativar (a reprodu\u00e7\u00e3o )?aleat\u00f3ria)$/i,\n            on:/^(disable shuffle|turn shuffle off|deactivate shuffle|d\u00e9sactiver (la lecture |le mode |l[\'\u2019])?al\u00e9atoire|zufallswiedergabe deaktivieren|desactivar (el modo |la reproducci\u00f3n )?aleatori[oa]|desativar (a reprodu\u00e7\u00e3o )?aleat\u00f3ria)$/i},\n        like:{selector:\'[data-testid=\"now-playing-widget\"] button, [data-testid=\"now-playing-bar\"] button, [data-testid=\"now-playing-view\"] button, [data-testid=\"now-playing-panel\"] button, [data-testid=\"now-playing-widget\"] [role=\"button\"], [data-testid=\"now-playing-bar\"] [role=\"button\"], [data-testid=\"now-playing-view\"] [role=\"button\"], [data-testid=\"now-playing-panel\"] [role=\"button\"], [data-testid=\"now-playing-widget\"] [role=\"switch\"], [data-testid=\"now-playing-bar\"] [role=\"switch\"], [data-testid=\"now-playing-view\"] [role=\"switch\"], [data-testid=\"now-playing-panel\"] [role=\"switch\"]\', ids:/^(add-button|remove-button|add-to-library-button|remove-from-library-button)$/i,\n            off:/^(save to your library|add to (your )?(liked songs|library)|ajouter (\u00e0|aux) (la biblioth\u00e8que|titres lik\u00e9s)|enregistrer dans (votre |la )?biblioth\u00e8que|in (deine |der )?bibliothek (aufnehmen|hinzuf\u00fcgen)|a\u00f1adir a (tu )?biblioteca|adicionar (\u00e0 biblioteca|aos t\u00edtulos curtidos))$/i,\n            on:/^(remove from (your )?(library|liked songs)|retirer (de la biblioth\u00e8que|des titres lik\u00e9s)|supprimer de (votre |la )?biblioth\u00e8que|aus (deiner |der )?bibliothek entfernen|quitar de (tu )?biblioteca|remover (da biblioteca|dos t\u00edtulos curtidos))$/i}\n    };\n    // Aggregate structure only: fixed testid/role and label categories, never\n    // arbitrary labels or identifiers that could contain a track or account.\n    function structure() {\n        var roots=Array.from(document.querySelectorAll(\'[data-testid=\"now-playing-bar\"], [data-testid=\"now-playing-widget\"], [data-testid=\"player-controls\"], [data-testid=\"now-playing-view\"], [data-testid=\"now-playing-panel\"]\'));\n        var nodes=[];roots.forEach(function(root){Array.from(root.querySelectorAll(\'button,[role=\"button\"],[role=\"switch\"],[role=\"slider\"],input[type=\"range\"]\')).forEach(function(n){if(nodes.indexOf(n)<0)nodes.push(n);});});\n        var st={bar:0,view:0,nodes:Math.min(nodes.length,99),playpause:0,repeat:0,shuffle:0,like:0,queue:0,volume:0,lyrics:0,connect:0,other:0,button:0,switch:0,slider:0,aria_shuffle:0,aria_like:0,aria_play:0,aria_pause:0,aria_other:0,track_links:0,track_named:0,track_generic:0,npv_opener:0};\n        roots.forEach(function(r){if(/^(now-playing-view|now-playing-panel)$/.test(r.getAttribute(\'data-testid\')))st.view++;else st.bar++;});\n        nodes.forEach(function(n){\n            var id=String(n.getAttribute(\'data-testid\')||\'\').toLowerCase(), label=String(n.getAttribute(\'aria-label\')||\'\').trim(), role=String(n.getAttribute(\'role\')||\'\').toLowerCase();\n            var k=/^control-button-playpause$/.test(id)?\'playpause\':/repeat/.test(id)?\'repeat\':/shuffle/.test(id)?\'shuffle\':/^(add-button|remove-button|add-to-library-button|remove-from-library-button)$/.test(id)?\'like\':/^(queue-button|control-button-queue)$/.test(id)?\'queue\':/^(volume-bar|volume-slider)$/.test(id)?\'volume\':/^(lyrics-button|control-button-lyrics)$/.test(id)?\'lyrics\':/^(connect-button|control-button-connect|connect-device-picker|device-picker)$/.test(id)?\'connect\':\'other\';\n            st[k]=Math.min(st[k]+1,99);if(role===\'switch\')st.switch++;else if(role===\'slider\'||n.tagName===\'INPUT\')st.slider++;else st.button++;\n            if(specs.shuffle.off.test(label)||specs.shuffle.on.test(label))st.aria_shuffle++;else if(specs.like.off.test(label)||specs.like.on.test(label))st.aria_like++;else if(/^(play|resume|lire|reprendre)$/i.test(label))st.aria_play++;else if(/^(pause|mettre en pause)$/i.test(label))st.aria_pause++;else if(label)st.aria_other++;\n        });\n        var links=Array.from(document.querySelectorAll(\'[data-testid=\"now-playing-widget\"] a[href], [data-testid=\"now-playing-bar\"] a[href]\'));\n        // Shapes only (no href, title or label text): where the bar points, and\n        // what the checked (like-like) buttons\' labels contain.\n        [\'href_album\',\'href_album_hl\',\'href_hl_ambiguous\',\'href_artist\',\'href_uri\',\'href_other\',\'chk_buttons\',\'chk_likeword\',\'chk_verb_add\',\'chk_verb_on\',\'chk_long\',\'chk_favori\',\'chk_library\',\'chk_liked\',\'chk_add_false\',\'chk_add_true\',\'chk_popup\'].forEach(function(k){st[k]=0;});\n        links.forEach(function(a){\n            var hh=String(a.getAttribute(\'href\')||\'\');\n            if(/^spotify:(track|episode):[a-z0-9]+$/i.test(hh))st.href_uri++;else if(/\\/album\\//i.test(hh))st[/highlight=/i.test(hh)?\'href_album_hl\':\'href_album\']++;else if(/\\/artist\\//i.test(hh))st.href_artist++;else if(!/\\/(track|episode)\\//i.test(hh))st.href_other++;\n        });\n        Array.from(document.querySelectorAll(\'[data-testid=\"now-playing-widget\"] button[aria-checked], [data-testid=\"now-playing-bar\"] button[aria-checked]\')).forEach(function(b){\n            var l=String(b.getAttribute(\'aria-label\')||\'\').trim();if(/repeat|r[\u00e9e]p[\u00e9e]t|shuffle|al[\u00e9e]atoire/i.test(l)||/repeat|shuffle/i.test(String(b.getAttribute(\'data-testid\')||\'\')))return;\n            st.chk_buttons++;if(/(lik\u00e9|liked|biblioth\u00e8que|library|favori)/i.test(l))st.chk_likeword++;\n            if(/^(ajouter|add|enregistrer|save)/i.test(l))st.chk_verb_add++;if(/^(ajout\u00e9|retirer|supprimer|remove|enregistr\u00e9|saved|added)/i.test(l))st.chk_verb_on++;if(l.length>30)st.chk_long++;\n            if(/favori/i.test(l))st.chk_favori++;if(/biblioth\u00e8que|library/i.test(l))st.chk_library++;if(/lik\u00e9|liked/i.test(l))st.chk_liked++;\n            if(/^(ajouter|add|enregistrer|save)/i.test(l)) {if(b.getAttribute(\'aria-checked\')===\'false\')st.chk_add_false++;if(b.getAttribute(\'aria-checked\')===\'true\')st.chk_add_true++;}\n            if(/^(true|menu|dialog|listbox)$/i.test(String(b.getAttribute(\'aria-haspopup\')||\'\')))st.chk_popup++;\n\n        });\n        links.forEach(function(a){\n            var h=String(a.getAttribute(\'href\')||\'\');\n            if (!/^spotify:(track|episode):[a-z0-9]+$/i.test(h) && !/^(?:https:\\/\\/open\\.spotify\\.com)?\\/(?:intl-[a-z]{2}(?:-[a-z]{2})?\\/)?(?:track|episode)\\/[a-z0-9]+\\/?(?:[?#].*)?$/i.test(h) && !/^(?:https:\\/\\/open\\.spotify\\.com)?\\/(?:intl-[a-z]{2}(?:-[a-z]{2})?\\/)?album\\/[a-z0-9]+\\/?\\?(?:[^#]*&)?highlight=spotify(?::|%3a)track(?::|%3a)[a-z0-9]+/i.test(h)) return;\n            if (/\\/album\\//i.test(h)) {\n                try {\n                    var highlights=[];\n                    new URL(h, \'https://open.spotify.com\').searchParams.forEach(function(v,k){if(k.toLowerCase()===\'highlight\')highlights.push(v);});\n                    if(highlights.length!==1 || !/^spotify:track:[a-z0-9]+$/i.test(highlights[0])) {st.href_hl_ambiguous++;return;}\n                } catch (_) {st.href_hl_ambiguous++;return;}\n            }\n            st.track_links++;if(String(a.textContent||\'\').trim())st.track_named++;\n            if(!/^(context-item-link|nowplaying-track-link)$/i.test(String(a.getAttribute(\'data-testid\')||\'\')))st.track_generic++;\n        });\n        st.track_attr=0;\n        Array.from(document.querySelectorAll(\'[data-testid=\"now-playing-widget\"] [data-testid=\"context-item-link\"], [data-testid=\"now-playing-widget\"] [data-testid=\"nowplaying-track-link\"], [data-testid=\"now-playing-widget\"] [data-testid=\"context-item-info-title\"], [data-testid=\"now-playing-bar\"] [data-testid=\"context-item-link\"], [data-testid=\"now-playing-bar\"] [data-testid=\"nowplaying-track-link\"], [data-testid=\"now-playing-bar\"] [data-testid=\"context-item-info-title\"]\')).forEach(function(n){\n            if([\'data-uri\',\'data-track-uri\',\'data-spotify-uri\'].some(function(k){return /^spotify:(track|episode):[a-z0-9]+$/i.test(String(n.getAttribute(k)||\'\'));}))st.track_attr++;\n        });\n        Array.from(document.querySelectorAll(\'button, [role=\"button\"]\')).forEach(function(b){\n            var id=String(b.getAttribute(\'data-testid\')||\'\'), l=String(b.getAttribute(\'aria-label\')||\'\').trim();\n            if(/^(control-button-npv|now-playing-view-button)$/i.test(id)||/^(now playing view|show now playing view|hide now playing view|vue \u00ab ?en cours de lecture ?\u00bb|afficher la vue en cours de lecture|masquer la vue en cours de lecture|en cours de lecture|ansicht \u201el\u00e4uft gerade\u201c|vista de reproducci\u00f3n|tela tocando agora)$/i.test(l))st.npv_opener++;\n        });\n        // Counts outside player scopes help locate candidates only. They may\n        // belong to a playlist or another track and are NEVER actionable.\n        st.outside_like_id=0;st.outside_like_label=0;st.outside_track_links=0;\n        function inPlayer(n){return !!n.closest(\'[data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-bar\"], [data-testid=\"now-playing-view\"], [data-testid=\"now-playing-panel\"], [data-testid=\"NPV\"]\');}\n        Array.from(document.querySelectorAll(\'button, [role=\"button\"], [role=\"switch\"]\')).forEach(function(n){\n            if(!n.isConnected||inPlayer(n))return;\n            var id=String(n.getAttribute(\'data-testid\')||\'\'),label=String(n.getAttribute(\'aria-label\')||\'\').trim();\n            if(specs.like.ids.test(id))st.outside_like_id++;\n            if(specs.like.off.test(label)||specs.like.on.test(label))st.outside_like_label++;\n        });\n        Array.from(document.querySelectorAll(\'a[href]\')).forEach(function(a){\n            if(!a.isConnected||inPlayer(a))return;\n            if(/^(?:https:\\/\\/open\\.spotify\\.com)?\\/(?:intl-[a-z]{2}(?:-[a-z]{2})?\\/)?(?:track|episode)\\/[a-z0-9]+\\/?(?:[?#].*)?$/i.test(String(a.getAttribute(\'href\')||\'\')))st.outside_track_links++;\n        });\n        // Capability counts only. Never invoke platform APIs or include their\n        // state, user, title, identifiers, labels, or session information.\n        st.api_player=st.api_state=st.api_library=st.api_contains=st.api_add=0;\n        try {\n            var platform=window.Melodix && window.Melodix.Platform;\n            var player=platform && platform.PlayerAPI, library=platform && platform.LibraryAPI;\n            if(player)st.api_player=1;if(player && typeof player.getState===\'function\')st.api_state=1;\n            if(library)st.api_library=1;if(library && typeof library.contains===\'function\')st.api_contains=1;\n            if(library && typeof library.add===\'function\')st.api_add=1;\n        } catch (_) {}\n        Object.keys(st).forEach(function(k){st[k]=Math.min(st[k],99);});return JSON.stringify(st);\n    }\n    var spec=specs[kind], out={kind:kind===\'shuffle\'?\'shuffle\':kind===\'like\'?\'like\':kind===\'repeat\'?\'repeat\':\'unknown\',reason:\'control\',count:0,state:\'unknown\',label:\'unknown\',command:\'unknown\',disabled:false,smart:false,structure:structure()};\n    if(!spec)return JSON.stringify(out);\n    var nodes=Array.from(document.querySelectorAll(spec.selector)).filter(function(b){\n        return b.isConnected && (spec.ids.test(String(b.getAttribute(\'data-testid\')||\'\')) || spec.off.test(String(b.getAttribute(\'aria-label\')||\'\').trim()) || spec.on.test(String(b.getAttribute(\'aria-label\')||\'\').trim()));\n    });\n    out.count=Math.min(nodes.length,2);\n    if(nodes.length!==1){out.reason=nodes.length?\'ambiguous\':document.readyState===\'loading\'?\'page\':\'absent\';return JSON.stringify(out);}\n    var b=nodes[0], label=String(b.getAttribute(\'aria-label\')||\'\').trim();\n    out.label=spec.on.test(label)?\'on-action\':spec.off.test(label)?\'off-action\':label?\'unrecognized\':\'absent\';\n    out.disabled=!!b.disabled || b.getAttribute(\'aria-disabled\')===\'true\';\n    var raw=b.getAttribute(\'aria-checked\');if(raw===null)raw=b.getAttribute(\'aria-pressed\');\n    out.state=raw===\'true\'||raw===\'false\'||(kind!==\'like\'&&raw===\'mixed\')?raw:raw===null?(out.label===\'on-action\'?\'true\':out.label===\'off-action\'?\'false\':\'unknown\'):\'unknown\';\n    out.smart=kind===\'shuffle\' && out.state===\'mixed\';\n    var id=String(b.getAttribute(\'data-testid\')||\'\').toLowerCase();\n    var conflict=kind===\'like\' && ((out.state===\'false\' && (out.label===\'on-action\'||/^(remove-button|remove-from-library-button)$/.test(id))) || (out.state===\'true\' && out.label===\'off-action\'));\n    var unverified=kind===\'like\' && out.label!==\'off-action\' && out.label!==\'on-action\';\n    if(unverified)out.state=\'unknown\';\n    var popup=String(b.getAttribute(\'aria-haspopup\')||\'\').toLowerCase();\n    if(kind===\'like\')out.command=popup===\'true\'||popup===\'menu\'||popup===\'dialog\'||popup===\'listbox\'||popup===\'tree\'||popup===\'grid\'?\'menu\':\'unspecified\';\n    else out.command=\'toggle\';\n    var description=String(b.getAttribute(\'aria-description\')||\'\').trim();\n    var restricted=kind===\'shuffle\' && out.disabled && /^(shuffle is not available (with|for) (this account|this playback)|l[\'\u2019]al\u00e9atoire n[\'\u2019]est pas disponible avec (ce compte|cette lecture))$/i.test(description);\n    out.reason=restricted?\'restriction\':out.disabled?\'disabled\':conflict?\'conflict\':unverified?\'unverified\':out.state===\'unknown\'?\'state\':\'observed\';\n    return JSON.stringify(out);\n})\n"

.field private static final JOB:Ljava/lang/String; = "(function(kind, action, shownState, expectedTitle, expectedTrack) {\n    \'use strict\';\n    // One explicit tap = one job. Methods in order, state re-read after each:\n    // (a) control already in the page, (b) briefly open the now-playing view in\n    // the hidden page and close it again, (c) web-player keyboard shortcut\n    // (shuffle/repeat only: a like is never sent without a verified state).\n    // Never reads storage, cookies or tokens; never navigates; no network.\n    var W = window;\n    var jobs = W.__melodixModeJobs = W.__melodixModeJobs || {};\n    if ([\'like\', \'shuffle\', \'repeat\'].indexOf(kind) < 0) return JSON.stringify({status: \'done\', outcome: \'failed\', reason: \'kind\'});\n    if (action === \'poll\') {\n        var previous = jobs[kind] || {status: \'none\'};\n        // A result can become stale after it was recorded but before native polling.\n        if (kind === \'like\' && previous.status === \'done\' &&\n            (previous.outcome === \'confirmed\' || previous.outcome === \'read\') && !identityMatches()) {\n            previous.outcome = \'identity\'; previous.state = \'unknown\';\n            if (previous.journal && previous.journal.length < 16) previous.journal.push(\'poll:identity\');\n        }\n        return JSON.stringify(previous);\n    }\n    if (action !== \'run\') return JSON.stringify({status: \'none\'});\n    if (jobs[kind] && jobs[kind].status === \'running\' && Date.now() - jobs[kind].started < 8000) return JSON.stringify({status: \'busy\'});\n    var labels = {\n        like: {\n            off: /^(save to your library|add to (your )?(liked songs|library)|ajouter (\u00e0|aux) (la biblioth\u00e8que|titres lik\u00e9s|vos titres lik\u00e9s)|enregistrer dans (votre |la )?biblioth\u00e8que|in (deine |der )?bibliothek (aufnehmen|hinzuf\u00fcgen)|a\u00f1adir a (tu )?biblioteca|adicionar (\u00e0 biblioteca|aos t\u00edtulos curtidos))$/i,\n            on: /^(remove from (your )?(library|liked songs)|retirer (de la biblioth\u00e8que|des titres lik\u00e9s|de vos titres lik\u00e9s)|supprimer de (votre |la )?biblioth\u00e8que|aus (deiner |der )?bibliothek entfernen|quitar de (tu )?biblioteca|remover (da biblioteca|dos t\u00edtulos curtidos))$/i\n        },\n        repeat: {\n            off: /^(enable repeat|turn repeat on|activer la r\u00e9p\u00e9tition|wiederholung aktivieren|activar repetici\u00f3n|ativar repeti\u00e7\u00e3o)$/i,\n            on: /^(disable repeat|turn repeat off|enable repeat one|d\u00e9sactiver la r\u00e9p\u00e9tition|activer la r\u00e9p\u00e9tition d[\'\u2019]un titre|wiederholung deaktivieren|desactivar repetici\u00f3n|desativar repeti\u00e7\u00e3o)$/i\n        },\n        shuffle: {\n            off: /^(enable shuffle|turn shuffle on|activate shuffle|activer (la lecture |le mode |l[\'\u2019])?al\u00e9atoire|zufallswiedergabe aktivieren|activar (el modo |la reproducci\u00f3n )?aleatori[oa]|ativar (a reprodu\u00e7\u00e3o )?aleat\u00f3ria)$/i,\n            on: /^(disable shuffle|turn shuffle off|deactivate shuffle|enable smart shuffle|d\u00e9sactiver (la lecture |le mode |l[\'\u2019])?al\u00e9atoire|activer la lecture al\u00e9atoire intelligente|zufallswiedergabe deaktivieren|desactivar (el modo |la reproducci\u00f3n )?aleatori[oa]|desativar (a reprodu\u00e7\u00e3o )?aleat\u00f3ria)$/i\n        }\n    };\n    // Neutral names locate a control but never decide its state.\n    var neutral = /^(shuffle|lecture al\u00e9atoire|al\u00e9atoire|repeat|r\u00e9p\u00e9ter|r\u00e9p\u00e9tition)$/i;\n    var ids = {\n        like: /^(add-button|remove-button|add-to-library-button|remove-from-library-button)$/i,\n        repeat: /^control-button-repeat$/i,\n        shuffle: /^control-button-shuffle$|shuffle/i\n    };\n    var job = {status: \'running\', started: Date.now(), outcome: \'\', state: \'unknown\', method: \'\', journal: []};\n    jobs[kind] = job;\n    function log(code) { if (job.journal.length < 16) job.journal.push(code); }\n    function finish(outcome, state, method) { job.status = \'done\'; job.outcome = outcome; job.state = state || \'unknown\'; job.method = method || \'\'; }\n    function label(b) { return String(b.getAttribute(\'aria-label\') || \'\').trim(); }\n    function testid(b) { return String(b.getAttribute(\'data-testid\') || \'\'); }\n    // Current Spotify wording varies: a verb plus a liked-songs/library word.\n    (function() {\n        var word = /(titres lik\u00e9s|liked songs|biblioth\u00e8que|library|biblioteca|bibliothek)/i, off = labels.like.off, on = labels.like.on;\n        labels.like.off = {test: function(l) { return off.test(l) || (word.test(l) && /^(ajouter|add|enregistrer|save|a\u00f1adir|adicionar|hinzuf\u00fcgen|zu)\\b/i.test(l)); }};\n        labels.like.on = {test: function(l) { return on.test(l) || (word.test(l) && /^(ajout\u00e9|retirer|supprimer|remove|enregistr\u00e9|saved|added|quitar|remover|entfernen)/i.test(l)); }};\n    })();\n    // Spotify\'s \"+\" save button: generic \"Ajouter...\" label, state in aria-checked.\n    function genericAdd(l) { return /^(ajouter|add|enregistrer|save)\\b/i.test(l) && !/(titres lik\u00e9s|liked songs|biblioth\u00e8que|library|file d[\'\u2019]attente|queue)/i.test(l); }\n    function find() {\n        var list = Array.from(document.querySelectorAll(\'button, [role=\"button\"], [role=\"switch\"]\')).filter(function(b) {\n            if (!b.isConnected) return false;\n            var l = label(b);\n            return ids[kind].test(testid(b)) || labels[kind].off.test(l) || labels[kind].on.test(l) ||\n                (kind === \'like\' && b.hasAttribute(\'aria-checked\') && genericAdd(l)) ||\n                (kind !== \'like\' && neutral.test(l) && (kind === \'shuffle\' ? /al[\u00e9e]atoire|shuffle/i : /r[\u00e9e]p[\u00e9e]t|repeat/i).test(l));\n        });\n        if (kind === \'like\') {\n            var scoped = list.filter(function(b) {\n                return b.closest(\'[data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-bar\"], [data-testid=\"now-playing-view\"], [data-testid=\"now-playing-panel\"], [data-testid=\"NPV\"]\');\n            });\n            list = scoped;\n        }\n        if (list.length > 1) {\n            var visible = list.filter(function(b) { var r = b.getBoundingClientRect(); return r.width > 0 && r.height > 0; });\n            if (visible.length === 1) list = visible;\n        }\n        if (!list.length) return {reason: \'absent\'};\n        if (list.length !== 1) return {reason: \'ambiguous\'};\n        var b = list[0];\n        if (b.disabled || b.getAttribute(\'aria-disabled\') === \'true\') return {reason: \'disabled\', node: b};\n        return {node: b, reason: \'\'};\n    }\n    function read(b) {\n        var checked = b.getAttribute(\'aria-checked\'), pressed = b.getAttribute(\'aria-pressed\');\n        var raw = checked === null ? pressed : checked;\n        var l = label(b), on = labels[kind].on.test(l), off = labels[kind].off.test(l);\n        if (kind === \'like\') {\n            var id = testid(b).toLowerCase();\n            var remove = /^(remove-button|remove-from-library-button)$/.test(id);\n            if (/^(true|menu|dialog|listbox|tree|grid)$/i.test(String(b.getAttribute(\'aria-haspopup\') || \'\')) ||\n                b.matches(\':disabled\') || b.closest(\'[aria-disabled=\"true\"], fieldset:disabled\') ||\n                (checked !== null && pressed !== null && checked !== pressed)) return \'unknown\';\n            if (raw !== null && raw !== \'true\' && raw !== \'false\') return \'unknown\';\n            if (raw === null) raw = on ? \'true\' : off ? \'false\' : \'unknown\';\n            if ((raw === \'false\' && (on || remove)) || (raw === \'true\' && off)) return \'unknown\';\n            // An unlabelled generic add-button may open a playlist picker.\n            if (!off && !on) return \'unknown\';\n            return raw;\n        }\n        if (raw === \'true\' || raw === \'false\' || raw === \'mixed\') return raw;\n        return on ? \'true\' : off ? \'false\' : \'unknown\';\n    }\n    // Spotify\'s bar title links to the album with the track in ?highlight=spotify:track:ID.\n    function trackHref(h) {\n        h = String(h || \'\');\n        // A Spotify URI is a complete identity, unlike an album or title.\n        var uri = /^spotify:(track|episode):([a-z0-9]+)$/i.exec(h);\n        if (uri) return uri;\n        var m = /^(?:https:\\/\\/open\\.spotify\\.com)?\\/(?:intl-[a-z]{2}(?:-[a-z]{2})?\\/)?(track|episode)\\/([a-z0-9]+)\\/?(?:[?#].*)?$/i.exec(h);\n        if (m) return m;\n        var a = /^(?:https:\\/\\/open\\.spotify\\.com)?\\/(?:intl-[a-z]{2}(?:-[a-z]{2})?\\/)?album\\/[a-z0-9]+\\/?\\?(?:[^#]*&)?highlight=spotify(?::|%3a)(track)(?::|%3a)([a-z0-9]+)(?:[&#].*)?$/i.exec(h);\n        if (a) {\n            // Duplicate highlight keys, including encoded/case variants,\n            // have ambiguous semantics. Never choose one arbitrarily.\n            try {\n                var query = new URL(h, \'https://open.spotify.com\').searchParams;\n                var values = [];\n                query.forEach(function(value, key) { if (key.toLowerCase() === \'highlight\') values.push(value); });\n                if (values.length !== 1 || !/^spotify:track:[a-z0-9]+$/i.test(values[0])) return null;\n                var parts = /^spotify:(track):([a-z0-9]+)$/i.exec(values[0]);\n                return [a[0], parts[1], parts[2]];\n            } catch (_) { return null; }\n        }\n        return null; // an album and title cannot uniquely identify a track\n    }\n    // Explicit track URIs on the current-player title only; never infer a\n    // track from an album, playlist, title alone, or an unrelated page row.\n    function markedTrack(n) {\n        if (!/^(context-item-link|nowplaying-track-link|context-item-info-title)$/i.test(String(n.getAttribute(\'data-testid\') || \'\'))) return \'\';\n        var result = \'\';\n        for (var name of [\'data-uri\', \'data-track-uri\', \'data-spotify-uri\']) {\n            if (!n.hasAttribute(name)) continue;\n            var m = /^spotify:(track|episode):([a-z0-9]+)$/i.exec(String(n.getAttribute(name) || \'\'));\n            if (!m) return \'!\';\n            var value = m[1].toLowerCase()+\':\'+m[2];\n            if (result && result !== value) return \'!\';\n            result = value;\n        }\n        return result;\n    }\n    // If a title link itself carries a malformed track hint, an attribute\n    // must not mask that ambiguity. Album-only links may use their explicit\n    // current-title parent marker, but never one outside the player bar.\n    function hasTrackHint(h) {\n        h=String(h||\'\');\n        if (/^spotify:(track|episode):/i.test(h) || /\\/(track|episode)\\//i.test(h)) return true;\n        try {\n            var found=false;\n            new URL(h, \'https://open.spotify.com\').searchParams.forEach(function(v,k){if(k.toLowerCase()===\'highlight\')found=true;});\n            return found;\n        } catch (_) { return true; }\n    }\n    function parentTrack(link) {\n        var n=link.closest(\'[data-testid=\"context-item-info-title\"]\');\n        if(!n || !n.closest(\'[data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-bar\"]\')) return \'\';\n        return markedTrack(n);\n    }\n    function markedTitleNodes() {\n        return Array.from(document.querySelectorAll(\'[data-testid=\"now-playing-widget\"] [data-testid=\"context-item-link\"], [data-testid=\"now-playing-widget\"] [data-testid=\"nowplaying-track-link\"], [data-testid=\"now-playing-widget\"] [data-testid=\"context-item-info-title\"], [data-testid=\"now-playing-bar\"] [data-testid=\"context-item-link\"], [data-testid=\"now-playing-bar\"] [data-testid=\"nowplaying-track-link\"], [data-testid=\"now-playing-bar\"] [data-testid=\"context-item-info-title\"]\')).filter(function(n) { return n.isConnected; });\n    }\n    function identityMatches() {\n        if (!expectedTitle || !expectedTrack) return false;\n        var links = Array.from(document.querySelectorAll(\'[data-testid=\"now-playing-widget\"] a[href], [data-testid=\"now-playing-bar\"] a[href], a[data-testid=\"nowplaying-track-link\"][href], [data-testid=\"now-playing-view\"] a[href]\'));\n        var malformedIdentity = false;\n        var identities = links.map(function(link) {\n            var m = trackHref(String(link.getAttribute(\'href\') || \'\'));\n            if (!m && /^(context-item-link|nowplaying-track-link)$/i.test(String(link.getAttribute(\'data-testid\') || \'\')) && (hasTrackHint(link.getAttribute(\'href\')) || (!markedTrack(link) && !parentTrack(link)))) malformedIdentity = true;\n            return m ? {track:m[1].toLowerCase()+\':\'+m[2],title:String(link.textContent || \'\').replace(/\\s+/g, \' \').trim()} : null;\n        }).filter(Boolean);\n        markedTitleNodes().forEach(function(n) {\n            var value=markedTrack(n);\n            if (value === \'!\') { malformedIdentity = true; return; }\n            if (value) identities.push({track:value, title:String(n.textContent || \'\').replace(/\\s+/g, \' \').trim()});\n        });\n        return !malformedIdentity && identities.some(function(x) { return x.title === expectedTitle; }) && identities.every(function(x) {\n            return x.track === expectedTrack && (!x.title || x.title === expectedTitle);\n        });\n    }\n    function opener() {\n        var list = Array.from(document.querySelectorAll(\'button, [role=\"button\"]\')).filter(function(b) {\n            if (!b.isConnected) return false;\n            var id = testid(b), l = label(b);\n            return /^(control-button-npv|now-playing-view-button)$/i.test(id) ||\n                /^(now playing view|show now playing view|hide now playing view|vue \u00ab ?en cours de lecture ?\u00bb|afficher la vue en cours de lecture|masquer la vue en cours de lecture|en cours de lecture|ansicht \u201el\u00e4uft gerade\u201c|vista de reproducci\u00f3n|tela tocando agora)$/i.test(l);\n        });\n        return list.length === 1 ? list[0] : null;\n    }\n    function pressed(b) { return b.getAttribute(\'aria-pressed\') === \'true\' || b.getAttribute(\'aria-expanded\') === \'true\' || b.getAttribute(\'data-active\') === \'true\'; }\n    function wait(test, ms, done) {\n        var end = Date.now() + ms;\n        (function step() {\n            var v;\n            try { v = test(); } catch (_) { v = null; }\n            if (v || Date.now() >= end) { done(v || null); return; }\n            setTimeout(step, 120);\n        })();\n    }\n    function invalidateLikedRead() {\n        try { if (typeof W.__sfLikedMutationAttempted === \'function\') W.__sfLikedMutationAttempted(); } catch (_) {}\n    }\n    // Open only an explicitly announced add menu, then act only on a unique,\n    // explicitly unchecked Liked Songs item. Never select another playlist.\n    function viaLikeMenu(b, method, after) {\n        var id = testid(b).toLowerCase(), l = label(b), popup = String(b.getAttribute(\'aria-haspopup\') || \'\');\n        if (!/^(true|menu|dialog|listbox)$/i.test(popup)) return false;\n        if (!identityMatches()) { log(method + \':menu-identity\'); after(\'identity\', \'unknown\'); return true; }\n        if (!/^(add-button|add-to-library-button)$/.test(id) || labels.like.on.test(l) ||\n            shownState === \'true\' || ((b.getAttribute(\'aria-checked\') === \'true\' || b.getAttribute(\'aria-pressed\') === \'true\') && !genericAdd(l)) ||\n            b.matches(\':disabled\') || b.closest(\'[aria-disabled=\"true\"], fieldset:disabled\')) {\n            log(method + \':menu-unsafe\'); after(\'menu-state\', \'unknown\'); return true;\n        }\n        var selector = \'[role=\"menu\"], [role=\"dialog\"], [role=\"listbox\"]\';\n        function available(n) { return n && n.isConnected && !n.closest(\'[hidden], [aria-hidden=\"true\"]\'); }\n        var before = Array.from(document.querySelectorAll(selector)).filter(available);\n        var expanded = b.getAttribute(\'aria-expanded\') === \'true\', opened = false;\n        function root() {\n            var id = b.getAttribute(\'aria-controls\'), controlled = id && document.getElementById(id);\n            if (available(controlled) && controlled.matches(selector) &&\n                (expanded || before.indexOf(controlled) < 0 || b.getAttribute(\'aria-expanded\') === \'true\')) return controlled;\n            if (expanded) return null;\n            var fresh = Array.from(document.querySelectorAll(selector)).filter(function(n) { return available(n) && before.indexOf(n) < 0; });\n            return fresh.length === 1 ? fresh[0] : null;\n        }\n        function closeMenu(r) {\n            if (!opened) return;\n            try {\n                (available(r) ? r : b).dispatchEvent(new KeyboardEvent(\'keydown\', {key:\'Escape\', code:\'Escape\', bubbles:true, cancelable:true}));\n                log(available(r) && b.getAttribute(\'aria-expanded\') === \'true\' ? method + \':menu-close-unverified\' : method + \':menu-close-requested\');\n            } catch (_) { log(method + \':menu-close-error\'); }\n        }\n        if (!expanded) {\n            try { b.click(); opened = true; log(method + \':menu-open\'); }\n            catch (_) { log(method + \':menu-open-error\'); after(\'menu-absent\', \'unknown\'); return true; }\n        }\n        wait(function() {\n            if (!identityMatches()) return \'identity-changed\';\n            return root();\n        }, 1800, function(r) {\n            if (r === \'identity-changed\') { closeMenu(null); after(\'identity\', \'unknown\'); return; }\n            if (!r) { log(method + \':menu-root\'); closeMenu(null); after(\'menu-absent\', \'unknown\'); return; }\n            var likedName = /^(liked songs|your liked songs|titres lik\u00e9s|vos titres lik\u00e9s|titres que j[\'\u2019]aime|liked-titel|canciones que te gustan|m\u00fasicas curtidas)$/i;\n            function targets() {\n                if (!available(r)) return [];\n                return Array.from(r.querySelectorAll(\'[role=\"menuitemcheckbox\"], [role=\"checkbox\"], input[type=\"checkbox\"]\')).filter(function(n) {\n                    var labelNode = n.closest(\'label\');\n                    var name = String(n.getAttribute(\'aria-label\') || (labelNode && labelNode.textContent) || n.textContent || \'\').replace(/\\s+/g, \' \').trim();\n                    return available(n) && likedName.test(name);\n                });\n            }\n            var candidates = targets();\n            if (candidates.length !== 1) { log(method + (candidates.length ? \':menu-ambiguous\' : \':menu-target\')); closeMenu(r); after(candidates.length ? \'menu-ambiguous\' : \'menu-absent\', \'unknown\'); return; }\n            var target = candidates[0], raw = target.getAttribute(\'aria-checked\');\n            var checked = target.tagName === \'INPUT\' && target.type === \'checkbox\' ? (target.checked ? \'true\' : \'false\') : null;\n            if (checked !== null && raw !== null && raw !== checked) raw = \'unknown\';\n            else if (raw === null) raw = checked;\n            if (target.matches(\':disabled\') || target.closest(\'[aria-disabled=\"true\"], fieldset:disabled\') || (raw !== \'true\' && raw !== \'false\')) {\n                log(method + \':menu-state\'); closeMenu(r); after(\'menu-state\', \'unknown\'); return;\n            }\n            if (raw === \'true\') { log(method + \':menu-liked\'); closeMenu(r); after(\'read\', \'true\'); return; }\n            if (!identityMatches()) { closeMenu(r); after(\'identity\', \'unknown\'); return; }\n            invalidateLikedRead();\n            try { target.click(); log(method + \':menu-add\'); }\n            catch (_) { log(method + \':menu-add-error\'); closeMenu(r); after(\'unconfirmed\', \'unknown\'); return; }\n            wait(function() {\n                if (!identityMatches()) return \'identity-changed\';\n                var current = targets();\n                if (current.length !== 1 || current[0].matches(\':disabled\') || current[0].closest(\'[aria-disabled=\"true\"], fieldset:disabled\')) return null;\n                // React may replace the checkbox after the click; only the\n                // unique explicit Liked Songs item in the same menu is read.\n                var observed = current[0];\n                var a = observed.getAttribute(\'aria-checked\');\n                var c = observed.tagName === \'INPUT\' && observed.type === \'checkbox\' ? observed.checked : null;\n                return (a === \'true\' && c !== false) || (a === null && c === true) ? \'true\' : null;\n            }, 2200, function(state) {\n                closeMenu(r);\n                if (state === \'identity-changed\') { log(method + \':menu-identity\'); after(\'identity\', \'unknown\'); }\n                else if (state === \'true\') { log(method + \':menu-verified\'); after(\'confirmed\', \'true\'); }\n                else { log(method + \':menu-unverified\'); after(\'unconfirmed\', \'false\'); }\n            });\n        });\n        return true;\n    }\n    // Decide and click on a readable control; verify the change afterwards.\n    function act(found, method, after) {\n        var b = found.node;\n        if (kind === \'like\' && viaLikeMenu(b, method, after)) return;\n        var before = read(b);\n        log(method + \':state-\' + before);\n        if (before === \'unknown\') { after(\'state\', before); return; }\n        if (kind === \'like\') {\n            if (!identityMatches()) { log(method + \':identity\'); after(\'identity\', before); return; }\n            // A tap can only ADD a like: an existing like is never clicked,\n            // whatever the native button shows. Only a verified \'false\' is clicked.\n            if (before !== \'false\') { log(method + \':liked-read-only\'); after(\'read\', before); return; }\n            if (shownState === \'true\') { log(method + \':mismatch\'); after(\'read\', before); return; }\n        }\n        if (kind === \'like\') invalidateLikedRead();\n        try { b.click(); log(method + \':click\'); } catch (_) { log(method + \':click-error\'); after(\'command\', before); return; }\n        wait(function() {\n            if (kind === \'like\' && !identityMatches()) return \'identity-changed\';\n            var again = find();\n            if (!again.node) return null;\n            var s = read(again.node);\n            return s !== before && s !== \'unknown\' ? s : null;\n        }, 2200, function(s) {\n            if (s === \'identity-changed\') { log(method + \':identity\'); after(\'identity\', \'unknown\'); }\n            else if (s) { log(method + \':verified\'); after(\'confirmed\', s); }\n            else { log(method + \':unverified\'); after(\'unconfirmed\', before); }\n        });\n    }\n    function viaKeyboard() {\n        if (kind === \'like\') { log(\'c:like-skipped\'); finish(\'failed\', \'unknown\', \'\'); return; }\n        var spec = kind === \'shuffle\' ? {key: \'s\', code: \'KeyS\', keyCode: 83} : {key: \'r\', code: \'KeyR\', keyCode: 82};\n        // Unverifiable when no control is readable, so only ONE combination per\n        // tap (two could cancel each other). Families alternate across taps.\n        var turns = W.__melodixKeyTurns = W.__melodixKeyTurns || {};\n        var ctrl = !(turns[kind] % 2); turns[kind] = (turns[kind] || 0) + 1;\n        try {\n            var target = document.activeElement && document.activeElement !== document.body ? document.activeElement : document.body;\n            [\'keydown\', \'keyup\'].forEach(function(type) {\n                target.dispatchEvent(new KeyboardEvent(type, {key: spec.key, code: spec.code, keyCode: spec.keyCode, which: spec.keyCode, ctrlKey: ctrl, altKey: !ctrl, bubbles: true, cancelable: true}));\n            });\n            log(\'c:\' + (ctrl ? \'ctrl-\' : \'alt-\') + spec.key); log(\'c:single-unreadable\');\n            finish(\'unverified\', \'unknown\', \'keyboard\');\n        } catch (_) { log(\'c:error\'); finish(\'failed\', \'unknown\', \'\'); }\n    }\n    function result(outcome, state, method) {\n        if (outcome === \'confirmed\' || outcome === \'unconfirmed\' || outcome === \'read\') finish(outcome, state, method);\n        else if (outcome === \'identity\' || outcome === \'menu-absent\' || outcome === \'menu-ambiguous\' || outcome === \'menu-state\') finish(outcome, \'unknown\', method);\n        else finish(\'failed\', state, method);\n    }\n    try {\n        var direct = find();\n        log(\'a:\' + (direct.node ? \'found\' : direct.reason));\n        if (direct.node && !direct.reason) { act(direct, \'a\', function(o, s) { result(o, s, \'direct\'); }); return JSON.stringify({status: \'started\'}); }\n        if (direct.reason === \'disabled\') { finish(\'disabled\', \'unknown\', \'direct\'); return JSON.stringify({status: \'started\'}); }\n        var view = opener();\n        if (!view) { log(\'b:no-opener\'); viaKeyboard(); return JSON.stringify({status: \'started\'}); }\n        var wasOpen = pressed(view);\n        if (!wasOpen) { try { view.click(); log(\'b:opened\'); } catch (_) { log(\'b:open-error\'); } }\n        else log(\'b:already-open\');\n        var closeView = function() {\n            if (!wasOpen) {\n                setTimeout(function() {\n                    var again = opener();\n                    try { if (again && pressed(again)) { again.click(); log(\'b:closed\'); } } catch (_) { log(\'b:close-error\'); }\n                }, 150);\n            }\n        };\n        wait(function() { var f = find(); return f.node && !f.reason ? f : null; }, 1800, function(found) {\n            if (!found) { log(\'b:absent\'); closeView(); viaKeyboard(); return; }\n            log(\'b:found\');\n            act(found, \'b\', function(o, s) { closeView(); result(o, s, \'now-playing-view\'); });\n        });\n        return JSON.stringify({status: \'started\'});\n    } catch (_) {\n        finish(\'failed\', \'unknown\', \'\');\n        return JSON.stringify({status: \'started\'});\n    }\n})\n"

.field private static final SCRIPT:Ljava/lang/String; = "(function(kind, action, expectedState, expectedTrack, expectedTitle) {\n    \'use strict\';\n    // Passive inspection of controls already in the page. A tap can only click\n    // a uniquely identified real control, after state/identity revalidation.\n    var labels = {\n        like: {\n            off: /^(save to your library|add to (your )?(liked songs|library)|ajouter (\u00e0|aux) (la biblioth\u00e8que|titres lik\u00e9s)|enregistrer dans (votre |la )?biblioth\u00e8que|in (deine |der )?bibliothek (aufnehmen|hinzuf\u00fcgen)|a\u00f1adir a (tu )?biblioteca|adicionar (\u00e0 biblioteca|aos t\u00edtulos curtidos))$/i,\n            on: /^(remove from (your )?(library|liked songs)|retirer (de la biblioth\u00e8que|des titres lik\u00e9s)|supprimer de (votre |la )?biblioth\u00e8que|aus (deiner |der )?bibliothek entfernen|quitar de (tu )?biblioteca|remover (da biblioteca|dos t\u00edtulos curtidos))$/i\n        },\n        repeat: {\n            // A label can safely distinguish off from enabled, but not list\n            // from one-track unless the page supplies an explicit mixed state.\n            off: /^(enable repeat|turn repeat on|activer la r\u00e9p\u00e9tition|wiederholung aktivieren|activar repetici\u00f3n|ativar repeti\u00e7\u00e3o)$/i,\n            on: /^(disable repeat|turn repeat off|d\u00e9sactiver la r\u00e9p\u00e9tition|wiederholung deaktivieren|desactivar repetici\u00f3n|desativar repeti\u00e7\u00e3o)$/i\n        },\n        shuffle: {\n            off: /^(enable shuffle|turn shuffle on|activate shuffle|activer (la lecture |le mode |l[\'\u2019])?al\u00e9atoire|zufallswiedergabe aktivieren|activar (el modo |la reproducci\u00f3n )?aleatori[oa]|ativar (a reprodu\u00e7\u00e3o )?aleat\u00f3ria)$/i,\n            on: /^(disable shuffle|turn shuffle off|deactivate shuffle|d\u00e9sactiver (la lecture |le mode |l[\'\u2019])?al\u00e9atoire|zufallswiedergabe deaktivieren|desactivar (el modo |la reproducci\u00f3n )?aleatori[oa]|desativar (a reprodu\u00e7\u00e3o )?aleat\u00f3ria)$/i\n        }\n    };\n    if ([\'like\',\'shuffle\',\'repeat\'].indexOf(kind) < 0) return JSON.stringify({state:\'unknown\',reason:\'control\'});\n    (function() {\n        var word = /(titres lik\u00e9s|liked songs|biblioth\u00e8que|library|biblioteca|bibliothek)/i, off = labels.like.off, on = labels.like.on;\n        labels.like.off = {test: function(l) { return off.test(l) || (word.test(l) && /^(ajouter|add|enregistrer|save|a\u00f1adir|adicionar|hinzuf\u00fcgen|zu)\\b/i.test(l)); }};\n        labels.like.on = {test: function(l) { return on.test(l) || (word.test(l) && /^(ajout\u00e9|retirer|supprimer|remove|enregistr\u00e9|saved|added|quitar|remover|entfernen)/i.test(l)); }};\n    })();\n    // Spotify\'s \"+\" save button: generic \"Ajouter...\" label, state in aria-checked.\n    function genericAdd(l) { return /^(ajouter|add|enregistrer|save)\\b/i.test(l) && !/(titres lik\u00e9s|liked songs|biblioth\u00e8que|library|file d[\'\u2019]attente|queue)/i.test(l); }\n    var selector = kind === \'like\' ?\n        \'[data-testid=\"now-playing-widget\"] button, [data-testid=\"now-playing-bar\"] button, [data-testid=\"now-playing-view\"] button, [data-testid=\"now-playing-panel\"] button, [data-testid=\"now-playing-widget\"] [role=\"button\"], [data-testid=\"now-playing-bar\"] [role=\"button\"], [data-testid=\"now-playing-view\"] [role=\"button\"], [data-testid=\"now-playing-panel\"] [role=\"button\"], [data-testid=\"now-playing-widget\"] [role=\"switch\"], [data-testid=\"now-playing-bar\"] [role=\"switch\"], [data-testid=\"now-playing-view\"] [role=\"switch\"], [data-testid=\"now-playing-panel\"] [role=\"switch\"]\' :\n        kind === \'shuffle\' ? \'button[data-testid*=\"shuffle\" i], button[aria-label], [role=\"button\"][aria-label], [role=\"switch\"][aria-label]\' :\n        \'button[data-testid=\"control-button-repeat\"], [role=\"button\"][data-testid=\"control-button-repeat\"], button[aria-label], [role=\"button\"][aria-label]\';\n    var nodes = Array.from(document.querySelectorAll(selector)).filter(function(b) {\n        if (!b.isConnected) return false;\n        var id=String(b.getAttribute(\'data-testid\')||\'\').toLowerCase();\n        var label=String(b.getAttribute(\'aria-label\')||\'\').trim();\n        if (kind === \'like\') return /^(add-button|remove-button|add-to-library-button|remove-from-library-button)$/.test(id) || labels.like.off.test(label) || labels.like.on.test(label) || (b.hasAttribute(\'aria-checked\') && genericAdd(label));\n        if (kind === \'repeat\') return id===\'control-button-repeat\' || labels.repeat.off.test(label) || labels.repeat.on.test(label);\n        return /shuffle/.test(id) || labels.shuffle.off.test(label) || labels.shuffle.on.test(label);\n    });\n    var result={state:\'unknown\',track:\'\',title:\'\',reason:\'control\',sent:false};\n    // Current player links only, including Spotify\'s unmarked track links.\n    // Every track href must agree; a non-empty title must also agree. Never\n    // take an identity from a playlist, search result or unrelated page node.\n    // Spotify\'s bar title links to the album with the track in ?highlight=spotify:track:ID.\n    function trackHref(h) {\n        h = String(h || \'\');\n        // A Spotify URI is a complete identity, unlike an album or title.\n        var uri = /^spotify:(track|episode):([a-z0-9]+)$/i.exec(h);\n        if (uri) return uri;\n        var m = /^(?:https:\\/\\/open\\.spotify\\.com)?\\/(?:intl-[a-z]{2}(?:-[a-z]{2})?\\/)?(track|episode)\\/([a-z0-9]+)\\/?(?:[?#].*)?$/i.exec(h);\n        if (m) return m;\n        var a = /^(?:https:\\/\\/open\\.spotify\\.com)?\\/(?:intl-[a-z]{2}(?:-[a-z]{2})?\\/)?album\\/[a-z0-9]+\\/?\\?(?:[^#]*&)?highlight=spotify(?::|%3a)(track)(?::|%3a)([a-z0-9]+)(?:[&#].*)?$/i.exec(h);\n        if (a) {\n            // Duplicate highlight keys, including encoded/case variants,\n            // have ambiguous semantics. Never choose one arbitrarily.\n            try {\n                var query = new URL(h, \'https://open.spotify.com\').searchParams;\n                var values = [];\n                query.forEach(function(value, key) { if (key.toLowerCase() === \'highlight\') values.push(value); });\n                if (values.length !== 1 || !/^spotify:track:[a-z0-9]+$/i.test(values[0])) return null;\n                var parts = /^spotify:(track):([a-z0-9]+)$/i.exec(values[0]);\n                return [a[0], parts[1], parts[2]];\n            } catch (_) { return null; }\n        }\n        return null; // album + title does not uniquely identify a track\n    }\n    // Explicit track URIs on the current-player title only; never infer a\n    // track from an album, playlist, title alone, or an unrelated page row.\n    function markedTrack(n) {\n        if (!/^(context-item-link|nowplaying-track-link|context-item-info-title)$/i.test(String(n.getAttribute(\'data-testid\') || \'\'))) return \'\';\n        var result = \'\';\n        for (var name of [\'data-uri\', \'data-track-uri\', \'data-spotify-uri\']) {\n            if (!n.hasAttribute(name)) continue;\n            var m = /^spotify:(track|episode):([a-z0-9]+)$/i.exec(String(n.getAttribute(name) || \'\'));\n            if (!m) return \'!\';\n            var value = m[1].toLowerCase()+\':\'+m[2];\n            if (result && result !== value) return \'!\';\n            result = value;\n        }\n        return result;\n    }\n    // If a title link itself carries a malformed track hint, an attribute\n    // must not mask that ambiguity. Album-only links may use their explicit\n    // current-title parent marker, but never one outside the player bar.\n    function hasTrackHint(h) {\n        h=String(h||\'\');\n        if (/^spotify:(track|episode):/i.test(h) || /\\/(track|episode)\\//i.test(h)) return true;\n        try {\n            var found=false;\n            new URL(h, \'https://open.spotify.com\').searchParams.forEach(function(v,k){if(k.toLowerCase()===\'highlight\')found=true;});\n            return found;\n        } catch (_) { return true; }\n    }\n    function parentTrack(link) {\n        var n=link.closest(\'[data-testid=\"context-item-info-title\"]\');\n        if(!n || !n.closest(\'[data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-bar\"]\')) return \'\';\n        return markedTrack(n);\n    }\n    function markedTitleNodes() {\n        return Array.from(document.querySelectorAll(\'[data-testid=\"now-playing-widget\"] [data-testid=\"context-item-link\"], [data-testid=\"now-playing-widget\"] [data-testid=\"nowplaying-track-link\"], [data-testid=\"now-playing-widget\"] [data-testid=\"context-item-info-title\"], [data-testid=\"now-playing-bar\"] [data-testid=\"context-item-link\"], [data-testid=\"now-playing-bar\"] [data-testid=\"nowplaying-track-link\"], [data-testid=\"now-playing-bar\"] [data-testid=\"context-item-info-title\"]\')).filter(function(n) { return n.isConnected; });\n    }\n    if (kind === \'like\') {\n        var anchors = Array.from(document.querySelectorAll(\'[data-testid=\"now-playing-widget\"] a[href], [data-testid=\"now-playing-bar\"] a[href]\'));\n        var malformedIdentity = false;\n        var identities = anchors.map(function(link) {\n            var match = trackHref(String(link.getAttribute(\'href\') || \'\'));\n            if (!match && /^(context-item-link|nowplaying-track-link)$/i.test(String(link.getAttribute(\'data-testid\') || \'\')) && (hasTrackHint(link.getAttribute(\'href\')) || (!markedTrack(link) && !parentTrack(link)))) malformedIdentity = true;\n            return match ? {track:match[1].toLowerCase()+\':\'+match[2],title:String(link.textContent || \'\').replace(/\\s+/g, \' \').trim()} : null;\n        }).filter(Boolean);\n        markedTitleNodes().forEach(function(n) {\n            var value=markedTrack(n);\n            if (value === \'!\') { malformedIdentity = true; return; }\n            if (value) identities.push({track:value, title:String(n.textContent || \'\').replace(/\\s+/g, \' \').trim()});\n        });\n        var named = identities.filter(function(x) { return !!x.title; });\n        if (!malformedIdentity && named.length && identities.every(function(x) { return x.track === named[0].track && (!x.title || x.title === named[0].title); })) {\n            result.track=named[0].track; result.title=named[0].title;\n        }\n    }\n\n    if (!nodes.length) {\n        var hasBar = !!document.querySelector(\'[data-testid=\"now-playing-bar\"], [data-testid=\"now-playing-widget\"], [data-testid=\"player-controls\"]\');\n        // With the player bar present and no such control anywhere in the page,\n        // say so (\'absent\'); without the bar the control may simply not be shown yet.\n        result.reason = document.readyState === \'loading\' ? \'page\' : (kind === \'shuffle\' && !hasBar ? \'bar\' : hasBar ? \'absent\' : \'control\');\n        return JSON.stringify(result);\n    }\n    if (nodes.length !== 1) {result.reason=\'ambiguous\';return JSON.stringify(result);}\n    var button=nodes[0];\n    if (button.disabled || button.matches(\':disabled\') || button.closest(\'[aria-disabled=\"true\"]\')) {\n        var description=String(button.getAttribute(\'aria-description\')||\'\').trim();\n        result.reason=kind===\'shuffle\' && /^(shuffle is not available (with|for) (this account|this playback)|l[\'\u2019]al\u00e9atoire n[\'\u2019]est pas disponible avec (ce compte|cette lecture))$/i.test(description)?\'restriction\':\'disabled\';\n        return JSON.stringify(result);\n    }\n    if (kind === \'like\' && /^(true|menu|dialog|listbox|tree|grid)$/i.test(String(button.getAttribute(\'aria-haspopup\')||\'\'))) {result.reason=\'menu\';return JSON.stringify(result);}\n    var raw=button.getAttribute(\'aria-checked\');\n    var pressed=button.getAttribute(\'aria-pressed\');\n    if (kind === \'like\' && raw !== null && pressed !== null && raw !== pressed) {result.reason=\'conflict\';return JSON.stringify(result);}\n    if (raw === null) raw=pressed;\n    var label=String(button.getAttribute(\'aria-label\')||\'\').trim();\n    if (raw === null) {\n        raw=labels[kind].on.test(label) ? \'true\' :\n            labels[kind].off.test(label) ? \'false\' : \'unknown\';\n    } else if (raw !== \'true\' && raw !== \'false\' && !(kind !== \'like\' && raw === \'mixed\')) raw=\'unknown\';\n    if (kind === \'like\') {\n        // A false ARIA value must never override a removal action. An\n        // unlabeled generic add-button can be a playlist menu, not a like.\n        var testId=String(button.getAttribute(\'data-testid\')||\'\').toLowerCase();\n        var removeId=/^(remove-button|remove-from-library-button)$/.test(testId);\n        var offLabel=labels.like.off.test(label), onLabel=labels.like.on.test(label);\n        if ((raw===\'false\' && (onLabel||removeId)) || (raw===\'true\' && offLabel)) {\n            result.reason=\'conflict\';return JSON.stringify(result);\n        }\n        if (!offLabel && !onLabel) {result.reason=\'unverified\';return JSON.stringify(result);}\n        // Display-only reads need no identity; a click (invoke) still does.\n        if ((!result.track || !result.title) && action !== \'query\') {result.reason=\'identity\';return JSON.stringify(result);}\n    }\n    if (raw === \'unknown\') {result.reason=\'state\';return JSON.stringify(result);}\n    if (typeof button.click !== \'function\') {result.reason=\'command\';return JSON.stringify(result);}\n    result.state=raw;result.reason=\'\';\n    if (action === \'query\') return JSON.stringify(result);\n    if (action !== \'invoke\' || raw !== expectedState ||\n        (kind === \'like\' && (raw !== \'false\' || result.track !== expectedTrack || result.title !== expectedTitle))) return JSON.stringify({sent:false});\n    try {\n        // Use the exact revalidated button; never call a legacy helper that\n        // schedules playback-related work. Never click an already-liked item.\n        button.click();\n        return JSON.stringify({sent:true});\n    } catch (_) { return JSON.stringify({sent:false}); }\n})\n"

.field private static final TAP_GUARD_MS:J = 0x190L

.field private static final after:[Ljava/lang/String;

.field private static final before:[Ljava/lang/String;

.field private static final last:[Ljava/lang/String;

.field private static final methods:[Ljava/lang/String;

.field private static final outcome:[Ljava/lang/String;

.field private static structure:Ljava/lang/String;


# instance fields
.field private generation:J

.field private final handler:Landroid/os/Handler;

.field private kind:Ljava/lang/String;

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
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 28
    new-array v0, v5, [Ljava/lang/String;

    const-string v1, "non observ\u00e9"

    aput-object v1, v0, v2

    const-string v1, "non observ\u00e9"

    aput-object v1, v0, v3

    const-string v1, "non observ\u00e9"

    aput-object v1, v0, v4

    sput-object v0, Lcom/melodix/music/PreviewPlayerMode;->last:[Ljava/lang/String;

    new-array v0, v5, [Ljava/lang/String;

    const-string v1, "aucun appui"

    aput-object v1, v0, v2

    const-string v1, "aucun appui"

    aput-object v1, v0, v3

    const-string v1, "aucun appui"

    aput-object v1, v0, v4

    sput-object v0, Lcom/melodix/music/PreviewPlayerMode;->before:[Ljava/lang/String;

    new-array v0, v5, [Ljava/lang/String;

    const-string v1, "aucun appui"

    aput-object v1, v0, v2

    const-string v1, "aucun appui"

    aput-object v1, v0, v3

    const-string v1, "aucun appui"

    aput-object v1, v0, v4

    sput-object v0, Lcom/melodix/music/PreviewPlayerMode;->after:[Ljava/lang/String;

    new-array v0, v5, [Ljava/lang/String;

    const-string v1, "aucun appui"

    aput-object v1, v0, v2

    const-string v1, "aucun appui"

    aput-object v1, v0, v3

    const-string v1, "aucun appui"

    aput-object v1, v0, v4

    sput-object v0, Lcom/melodix/music/PreviewPlayerMode;->outcome:[Ljava/lang/String;

    .line 29
    const-string v0, "non observ\u00e9e"

    sput-object v0, Lcom/melodix/music/PreviewPlayerMode;->structure:Ljava/lang/String;

    .line 30
    new-array v0, v5, [Ljava/lang/String;

    const-string v1, "aucune"

    aput-object v1, v0, v2

    const-string v1, "aucune"

    aput-object v1, v0, v3

    const-string v1, "aucune"

    aput-object v1, v0, v4

    sput-object v0, Lcom/melodix/music/PreviewPlayerMode;->methods:[Ljava/lang/String;

    .line 64
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    .prologue
    .line 78
    invoke-direct {p0, p1, p2}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 60
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->handler:Landroid/os/Handler;

    .line 61
    const-string v0, ""

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v0, "unknown"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->track:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->title:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->pendingState:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->pendingTrack:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->pendingTitle:Ljava/lang/String;

    const-string v0, "web"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    .line 63
    const-wide/16 v0, -0x3e8

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode;->lastTap:J

    .line 65
    const-string v0, ""

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->remembered:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->rememberedTitle:Ljava/lang/String;

    .line 72
    new-instance v0, Lcom/melodix/music/PreviewPlayerMode$1;

    invoke-direct {v0, p0}, Lcom/melodix/music/PreviewPlayerMode$1;-><init>(Lcom/melodix/music/PreviewPlayerMode;)V

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->tick:Ljava/lang/Runnable;

    .line 78
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerMode;->setEnabled(Z)V

    .line 79
    new-instance v0, Lcom/melodix/music/PreviewPlayerMode$2;

    invoke-direct {v0, p0}, Lcom/melodix/music/PreviewPlayerMode$2;-><init>(Lcom/melodix/music/PreviewPlayerMode;)V

    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerMode;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 80
    return-void
.end method

.method static synthetic access$0(Lcom/melodix/music/PreviewPlayerMode;)Z
    .locals 1

    .prologue
    .line 62
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerMode;->running:Z

    return v0
.end method

.method static synthetic access$1(Lcom/melodix/music/PreviewPlayerMode;)V
    .locals 0

    .prologue
    .line 246
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->paint()V

    return-void
.end method

.method static synthetic access$10(Lcom/melodix/music/PreviewPlayerMode;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 61
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$11(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)Z
    .locals 1

    .prologue
    .line 101
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerMode;->sameNativeTitle(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$12(Lcom/melodix/music/PreviewPlayerMode;)Z
    .locals 1

    .prologue
    .line 62
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    return v0
.end method

.method static synthetic access$13(Lcom/melodix/music/PreviewPlayerMode;Z)V
    .locals 0

    .prologue
    .line 62
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerMode;->observedPending:Z

    return-void
.end method

.method static synthetic access$14(Lcom/melodix/music/PreviewPlayerMode;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 61
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->pendingState:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$15(Lcom/melodix/music/PreviewPlayerMode;)I
    .locals 1

    .prologue
    .line 33
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->diagnosticIndex()I

    move-result v0

    return v0
.end method

.method static synthetic access$16()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 28
    sget-object v0, Lcom/melodix/music/PreviewPlayerMode;->outcome:[Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$17(Lcom/melodix/music/PreviewPlayerMode;Z)V
    .locals 0

    .prologue
    .line 62
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    return-void
.end method

.method static synthetic access$18(Lcom/melodix/music/PreviewPlayerMode;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 65
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->remembered:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$19(Lcom/melodix/music/PreviewPlayerMode;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 65
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->rememberedTitle:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$2(Lcom/melodix/music/PreviewPlayerMode;)V
    .locals 0

    .prologue
    .line 106
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->observe()V

    return-void
.end method

.method static synthetic access$20(Lcom/melodix/music/PreviewPlayerMode;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 141
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->nativeTitle()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$21(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 65
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerMode;->remembered:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$22(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 65
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerMode;->rememberedTitle:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$23(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 61
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$24(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 61
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerMode;->track:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$25(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 61
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerMode;->title:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$26(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 61
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$27(Lcom/melodix/music/PreviewPlayerMode;)V
    .locals 0

    .prologue
    .line 66
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->notConfirmed()V

    return-void
.end method

.method static synthetic access$28(Lcom/melodix/music/PreviewPlayerMode;JI)V
    .locals 1

    .prologue
    .line 190
    invoke-direct {p0, p1, p2, p3}, Lcom/melodix/music/PreviewPlayerMode;->poll(JI)V

    return-void
.end method

.method static synthetic access$29(Lcom/melodix/music/PreviewPlayerMode;)Landroid/webkit/WebView;
    .locals 1

    .prologue
    .line 89
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->web()Landroid/webkit/WebView;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$3(Lcom/melodix/music/PreviewPlayerMode;)Landroid/os/Handler;
    .locals 1

    .prologue
    .line 60
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->handler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$30(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 146
    invoke-direct {p0, p1, p2}, Lcom/melodix/music/PreviewPlayerMode;->job(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$31(Lcom/melodix/music/PreviewPlayerMode;Lorg/json/JSONObject;)V
    .locals 0

    .prologue
    .line 204
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerMode;->finishJob(Lorg/json/JSONObject;)V

    return-void
.end method

.method static synthetic access$32(Lcom/melodix/music/PreviewPlayerMode;)V
    .locals 0

    .prologue
    .line 265
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->sync()V

    return-void
.end method

.method static synthetic access$4(Lcom/melodix/music/PreviewPlayerMode;)V
    .locals 0

    .prologue
    .line 162
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->invoke()V

    return-void
.end method

.method static synthetic access$5(Lcom/melodix/music/PreviewPlayerMode;)J
    .locals 2

    .prologue
    .line 63
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode;->generation:J

    return-wide v0
.end method

.method static synthetic access$6(Lcom/melodix/music/PreviewPlayerMode;)J
    .locals 2

    .prologue
    .line 63
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode;->querySerial:J

    return-wide v0
.end method

.method static synthetic access$7(Lcom/melodix/music/PreviewPlayerMode;Z)V
    .locals 0

    .prologue
    .line 62
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerMode;->queryInFlight:Z

    return-void
.end method

.method static synthetic access$8(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 1

    .prologue
    .line 97
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerMode;->parse(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$9(Lcom/melodix/music/PreviewPlayerMode;Lorg/json/JSONObject;)V
    .locals 0

    .prologue
    .line 35
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerMode;->remember(Lorg/json/JSONObject;)V

    return-void
.end method

.method private activity()Landroid/app/Activity;
    .locals 4

    .prologue
    .line 82
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 83
    const/4 v1, 0x0

    move v2, v1

    :goto_0
    const/16 v1, 0x8

    if-ge v2, v1, :cond_0

    instance-of v1, v0, Landroid/content/ContextWrapper;

    if-nez v1, :cond_1

    .line 87
    :cond_0
    instance-of v1, v0, Landroid/app/Activity;

    if-eqz v1, :cond_3

    check-cast v0, Landroid/app/Activity;

    :goto_1
    return-object v0

    .line 84
    :cond_1
    instance-of v1, v0, Landroid/app/Activity;

    if-eqz v1, :cond_2

    check-cast v0, Landroid/app/Activity;

    goto :goto_1

    :cond_2
    move-object v1, v0

    .line 85
    check-cast v1, Landroid/content/ContextWrapper;

    invoke-virtual {v1}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object v3

    if-eq v3, v0, :cond_0

    .line 83
    add-int/lit8 v1, v2, 0x1

    move v2, v1

    move-object v0, v3

    goto :goto_0

    .line 87
    :cond_3
    const/4 v0, 0x0

    goto :goto_1
.end method

.method private static allowed(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .prologue
    .line 34
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "|"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "|"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "|"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "|"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    :goto_0
    return-object p0

    :cond_0
    const-string p0, "unknown"

    goto :goto_0
.end method

.method private beginDiagnostic()V
    .locals 3

    .prologue
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

    .prologue
    .line 95
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "(function(){var r=JSON.parse(((function(kind, action, expectedState, expectedTrack, expectedTitle) {\n    \'use strict\';\n    // Passive inspection of controls already in the page. A tap can only click\n    // a uniquely identified real control, after state/identity revalidation.\n    var labels = {\n        like: {\n            off: /^(save to your library|add to (your )?(liked songs|library)|ajouter (\u00e0|aux) (la biblioth\u00e8que|titres lik\u00e9s)|enregistrer dans (votre |la )?biblioth\u00e8que|in (deine |der )?bibliothek (aufnehmen|hinzuf\u00fcgen)|a\u00f1adir a (tu )?biblioteca|adicionar (\u00e0 biblioteca|aos t\u00edtulos curtidos))$/i,\n            on: /^(remove from (your )?(library|liked songs)|retirer (de la biblioth\u00e8que|des titres lik\u00e9s)|supprimer de (votre |la )?biblioth\u00e8que|aus (deiner |der )?bibliothek entfernen|quitar de (tu )?biblioteca|remover (da biblioteca|dos t\u00edtulos curtidos))$/i\n        },\n        repeat: {\n            // A label can safely distinguish off from enabled, but not list\n            // from one-track unless the page supplies an explicit mixed state.\n            off: /^(enable repeat|turn repeat on|activer la r\u00e9p\u00e9tition|wiederholung aktivieren|activar repetici\u00f3n|ativar repeti\u00e7\u00e3o)$/i,\n            on: /^(disable repeat|turn repeat off|d\u00e9sactiver la r\u00e9p\u00e9tition|wiederholung deaktivieren|desactivar repetici\u00f3n|desativar repeti\u00e7\u00e3o)$/i\n        },\n        shuffle: {\n            off: /^(enable shuffle|turn shuffle on|activate shuffle|activer (la lecture |le mode |l[\'\u2019])?al\u00e9atoire|zufallswiedergabe aktivieren|activar (el modo |la reproducci\u00f3n )?aleatori[oa]|ativar (a reprodu\u00e7\u00e3o )?aleat\u00f3ria)$/i,\n            on: /^(disable shuffle|turn shuffle off|deactivate shuffle|d\u00e9sactiver (la lecture |le mode |l[\'\u2019])?al\u00e9atoire|zufallswiedergabe deaktivieren|desactivar (el modo |la reproducci\u00f3n )?aleatori[oa]|desativar (a reprodu\u00e7\u00e3o )?aleat\u00f3ria)$/i\n        }\n    };\n    if ([\'like\',\'shuffle\',\'repeat\'].indexOf(kind) < 0) return JSON.stringify({state:\'unknown\',reason:\'control\'});\n    (function() {\n        var word = /(titres lik\u00e9s|liked songs|biblioth\u00e8que|library|biblioteca|bibliothek)/i, off = labels.like.off, on = labels.like.on;\n        labels.like.off = {test: function(l) { return off.test(l) || (word.test(l) && /^(ajouter|add|enregistrer|save|a\u00f1adir|adicionar|hinzuf\u00fcgen|zu)\\b/i.test(l)); }};\n        labels.like.on = {test: function(l) { return on.test(l) || (word.test(l) && /^(ajout\u00e9|retirer|supprimer|remove|enregistr\u00e9|saved|added|quitar|remover|entfernen)/i.test(l)); }};\n    })();\n    // Spotify\'s \"+\" save button: generic \"Ajouter...\" label, state in aria-checked.\n    function genericAdd(l) { return /^(ajouter|add|enregistrer|save)\\b/i.test(l) && !/(titres lik\u00e9s|liked songs|biblioth\u00e8que|library|file d[\'\u2019]attente|queue)/i.test(l); }\n    var selector = kind === \'like\' ?\n        \'[data-testid=\"now-playing-widget\"] button, [data-testid=\"now-playing-bar\"] button, [data-testid=\"now-playing-view\"] button, [data-testid=\"now-playing-panel\"] button, [data-testid=\"now-playing-widget\"] [role=\"button\"], [data-testid=\"now-playing-bar\"] [role=\"button\"], [data-testid=\"now-playing-view\"] [role=\"button\"], [data-testid=\"now-playing-panel\"] [role=\"button\"], [data-testid=\"now-playing-widget\"] [role=\"switch\"], [data-testid=\"now-playing-bar\"] [role=\"switch\"], [data-testid=\"now-playing-view\"] [role=\"switch\"], [data-testid=\"now-playing-panel\"] [role=\"switch\"]\' :\n        kind === \'shuffle\' ? \'button[data-testid*=\"shuffle\" i], button[aria-label], [role=\"button\"][aria-label], [role=\"switch\"][aria-label]\' :\n        \'button[data-testid=\"control-button-repeat\"], [role=\"button\"][data-testid=\"control-button-repeat\"], button[aria-label], [role=\"button\"][aria-label]\';\n    var nodes = Array.from(document.querySelectorAll(selector)).filter(function(b) {\n        if (!b.isConnected) return false;\n        var id=String(b.getAttribute(\'data-testid\')||\'\').toLowerCase();\n        var label=String(b.getAttribute(\'aria-label\')||\'\').trim();\n        if (kind === \'like\') return /^(add-button|remove-button|add-to-library-button|remove-from-library-button)$/.test(id) || labels.like.off.test(label) || labels.like.on.test(label) || (b.hasAttribute(\'aria-checked\') && genericAdd(label));\n        if (kind === \'repeat\') return id===\'control-button-repeat\' || labels.repeat.off.test(label) || labels.repeat.on.test(label);\n        return /shuffle/.test(id) || labels.shuffle.off.test(label) || labels.shuffle.on.test(label);\n    });\n    var result={state:\'unknown\',track:\'\',title:\'\',reason:\'control\',sent:false};\n    // Current player links only, including Spotify\'s unmarked track links.\n    // Every track href must agree; a non-empty title must also agree. Never\n    // take an identity from a playlist, search result or unrelated page node.\n    // Spotify\'s bar title links to the album with the track in ?highlight=spotify:track:ID.\n    function trackHref(h) {\n        h = String(h || \'\');\n        // A Spotify URI is a complete identity, unlike an album or title.\n        var uri = /^spotify:(track|episode):([a-z0-9]+)$/i.exec(h);\n        if (uri) return uri;\n        var m = /^(?:https:\\/\\/open\\.spotify\\.com)?\\/(?:intl-[a-z]{2}(?:-[a-z]{2})?\\/)?(track|episode)\\/([a-z0-9]+)\\/?(?:[?#].*)?$/i.exec(h);\n        if (m) return m;\n        var a = /^(?:https:\\/\\/open\\.spotify\\.com)?\\/(?:intl-[a-z]{2}(?:-[a-z]{2})?\\/)?album\\/[a-z0-9]+\\/?\\?(?:[^#]*&)?highlight=spotify(?::|%3a)(track)(?::|%3a)([a-z0-9]+)(?:[&#].*)?$/i.exec(h);\n        if (a) {\n            // Duplicate highlight keys, including encoded/case variants,\n            // have ambiguous semantics. Never choose one arbitrarily.\n            try {\n                var query = new URL(h, \'https://open.spotify.com\').searchParams;\n                var values = [];\n                query.forEach(function(value, key) { if (key.toLowerCase() === \'highlight\') values.push(value); });\n                if (values.length !== 1 || !/^spotify:track:[a-z0-9]+$/i.test(values[0])) return null;\n                var parts = /^spotify:(track):([a-z0-9]+)$/i.exec(values[0]);\n                return [a[0], parts[1], parts[2]];\n            } catch (_) { return null; }\n        }\n        return null; // album + title does not uniquely identify a track\n    }\n    // Explicit track URIs on the current-player title only; never infer a\n    // track from an album, playlist, title alone, or an unrelated page row.\n    function markedTrack(n) {\n        if (!/^(context-item-link|nowplaying-track-link|context-item-info-title)$/i.test(String(n.getAttribute(\'data-testid\') || \'\'))) return \'\';\n        var result = \'\';\n        for (var name of [\'data-uri\', \'data-track-uri\', \'data-spotify-uri\']) {\n            if (!n.hasAttribute(name)) continue;\n            var m = /^spotify:(track|episode):([a-z0-9]+)$/i.exec(String(n.getAttribute(name) || \'\'));\n            if (!m) return \'!\';\n            var value = m[1].toLowerCase()+\':\'+m[2];\n            if (result && result !== value) return \'!\';\n            result = value;\n        }\n        return result;\n    }\n    // If a title link itself carries a malformed track hint, an attribute\n    // must not mask that ambiguity. Album-only links may use their explicit\n    // current-title parent marker, but never one outside the player bar.\n    function hasTrackHint(h) {\n        h=String(h||\'\');\n        if (/^spotify:(track|episode):/i.test(h) || /\\/(track|episode)\\//i.test(h)) return true;\n        try {\n            var found=false;\n            new URL(h, \'https://open.spotify.com\').searchParams.forEach(function(v,k){if(k.toLowerCase()===\'highlight\')found=true;});\n            return found;\n        } catch (_) { return true; }\n    }\n    function parentTrack(link) {\n        var n=link.closest(\'[data-testid=\"context-item-info-title\"]\');\n        if(!n || !n.closest(\'[data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-bar\"]\')) return \'\';\n        return markedTrack(n);\n    }\n    function markedTitleNodes() {\n        return Array.from(document.querySelectorAll(\'[data-testid=\"now-playing-widget\"] [data-testid=\"context-item-link\"], [data-testid=\"now-playing-widget\"] [data-testid=\"nowplaying-track-link\"], [data-testid=\"now-playing-widget\"] [data-testid=\"context-item-info-title\"], [data-testid=\"now-playing-bar\"] [data-testid=\"context-item-link\"], [data-testid=\"now-playing-bar\"] [data-testid=\"nowplaying-track-link\"], [data-testid=\"now-playing-bar\"] [data-testid=\"context-item-info-title\"]\')).filter(function(n) { return n.isConnected; });\n    }\n    if (kind === \'like\') {\n        var anchors = Array.from(document.querySelectorAll(\'[data-testid=\"now-playing-widget\"] a[href], [data-testid=\"now-playing-bar\"] a[href]\'));\n        var malformedIdentity = false;\n        var identities = anchors.map(function(link) {\n            var match = trackHref(String(link.getAttribute(\'href\') || \'\'));\n            if (!match && /^(context-item-link|nowplaying-track-link)$/i.test(String(link.getAttribute(\'data-testid\') || \'\')) && (hasTrackHint(link.getAttribute(\'href\')) || (!markedTrack(link) && !parentTrack(link)))) malformedIdentity = true;\n            return match ? {track:match[1].toLowerCase()+\':\'+match[2],title:String(link.textContent || \'\').replace(/\\s+/g, \' \').trim()} : null;\n        }).filter(Boolean);\n        markedTitleNodes().forEach(function(n) {\n            var value=markedTrack(n);\n            if (value === \'!\') { malformedIdentity = true; return; }\n            if (value) identities.push({track:value, title:String(n.textContent || \'\').replace(/\\s+/g, \' \').trim()});\n        });\n        var named = identities.filter(function(x) { return !!x.title; });\n        if (!malformedIdentity && named.length && identities.every(function(x) { return x.track === named[0].track && (!x.title || x.title === named[0].title); })) {\n            result.track=named[0].track; result.title=named[0].title;\n        }\n    }\n\n    if (!nodes.length) {\n        var hasBar = !!document.querySelector(\'[data-testid=\"now-playing-bar\"], [data-testid=\"now-playing-widget\"], [data-testid=\"player-controls\"]\');\n        // With the player bar present and no such control anywhere in the page,\n        // say so (\'absent\'); without the bar the control may simply not be shown yet.\n        result.reason = document.readyState === \'loading\' ? \'page\' : (kind === \'shuffle\' && !hasBar ? \'bar\' : hasBar ? \'absent\' : \'control\');\n        return JSON.stringify(result);\n    }\n    if (nodes.length !== 1) {result.reason=\'ambiguous\';return JSON.stringify(result);}\n    var button=nodes[0];\n    if (button.disabled || button.matches(\':disabled\') || button.closest(\'[aria-disabled=\"true\"]\')) {\n        var description=String(button.getAttribute(\'aria-description\')||\'\').trim();\n        result.reason=kind===\'shuffle\' && /^(shuffle is not available (with|for) (this account|this playback)|l[\'\u2019]al\u00e9atoire n[\'\u2019]est pas disponible avec (ce compte|cette lecture))$/i.test(description)?\'restriction\':\'disabled\';\n        return JSON.stringify(result);\n    }\n    if (kind === \'like\' && /^(true|menu|dialog|listbox|tree|grid)$/i.test(String(button.getAttribute(\'aria-haspopup\')||\'\'))) {result.reason=\'menu\';return JSON.stringify(result);}\n    var raw=button.getAttribute(\'aria-checked\');\n    var pressed=button.getAttribute(\'aria-pressed\');\n    if (kind === \'like\' && raw !== null && pressed !== null && raw !== pressed) {result.reason=\'conflict\';return JSON.stringify(result);}\n    if (raw === null) raw=pressed;\n    var label=String(button.getAttribute(\'aria-label\')||\'\').trim();\n    if (raw === null) {\n        raw=labels[kind].on.test(label) ? \'true\' :\n            labels[kind].off.test(label) ? \'false\' : \'unknown\';\n    } else if (raw !== \'true\' && raw !== \'false\' && !(kind !== \'like\' && raw === \'mixed\')) raw=\'unknown\';\n    if (kind === \'like\') {\n        // A false ARIA value must never override a removal action. An\n        // unlabeled generic add-button can be a playlist menu, not a like.\n        var testId=String(button.getAttribute(\'data-testid\')||\'\').toLowerCase();\n        var removeId=/^(remove-button|remove-from-library-button)$/.test(testId);\n        var offLabel=labels.like.off.test(label), onLabel=labels.like.on.test(label);\n        if ((raw===\'false\' && (onLabel||removeId)) || (raw===\'true\' && offLabel)) {\n            result.reason=\'conflict\';return JSON.stringify(result);\n        }\n        if (!offLabel && !onLabel) {result.reason=\'unverified\';return JSON.stringify(result);}\n        // Display-only reads need no identity; a click (invoke) still does.\n        if ((!result.track || !result.title) && action !== \'query\') {result.reason=\'identity\';return JSON.stringify(result);}\n    }\n    if (raw === \'unknown\') {result.reason=\'state\';return JSON.stringify(result);}\n    if (typeof button.click !== \'function\') {result.reason=\'command\';return JSON.stringify(result);}\n    result.state=raw;result.reason=\'\';\n    if (action === \'query\') return JSON.stringify(result);\n    if (action !== \'invoke\' || raw !== expectedState ||\n        (kind === \'like\' && (raw !== \'false\' || result.track !== expectedTrack || result.title !== expectedTitle))) return JSON.stringify({sent:false});\n    try {\n        // Use the exact revalidated button; never call a legacy helper that\n        // schedules playback-related work. Never click an already-liked item.\n        button.click();\n        return JSON.stringify({sent:true});\n    } catch (_) { return JSON.stringify({sent:false}); }\n})\n)("

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    invoke-static {v1}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p1}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p2}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p3}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p4}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "));r.diagnostic=("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "(function(kind) {\n    \'use strict\';\n    // Passive, bounded, allowlisted observations only. No account, track or\n    // arbitrary page text is returned. This probe does not click or send data.\n    var specs={\n        repeat:{selector:\'button[data-testid=\"control-button-repeat\"], [role=\"button\"][data-testid=\"control-button-repeat\"], button[aria-label], [role=\"button\"][aria-label]\', ids:/^control-button-repeat$/i,\n            off:/^(enable repeat|turn repeat on|activer la r\u00e9p\u00e9tition|wiederholung aktivieren|activar repetici\u00f3n|ativar repeti\u00e7\u00e3o)$/i,\n            on:/^(disable repeat|turn repeat off|d\u00e9sactiver la r\u00e9p\u00e9tition|wiederholung deaktivieren|desactivar repetici\u00f3n|desativar repeti\u00e7\u00e3o)$/i},\n        shuffle:{selector:\'button[data-testid*=\"shuffle\" i], button[aria-label], [role=\"button\"][aria-label], [role=\"switch\"][aria-label]\', ids:/shuffle/i,\n            off:/^(enable shuffle|turn shuffle on|activate shuffle|activer (la lecture |le mode |l[\'\u2019])?al\u00e9atoire|zufallswiedergabe aktivieren|activar (el modo |la reproducci\u00f3n )?aleatori[oa]|ativar (a reprodu\u00e7\u00e3o )?aleat\u00f3ria)$/i,\n            on:/^(disable shuffle|turn shuffle off|deactivate shuffle|d\u00e9sactiver (la lecture |le mode |l[\'\u2019])?al\u00e9atoire|zufallswiedergabe deaktivieren|desactivar (el modo |la reproducci\u00f3n )?aleatori[oa]|desativar (a reprodu\u00e7\u00e3o )?aleat\u00f3ria)$/i},\n        like:{selector:\'[data-testid=\"now-playing-widget\"] button, [data-testid=\"now-playing-bar\"] button, [data-testid=\"now-playing-view\"] button, [data-testid=\"now-playing-panel\"] button, [data-testid=\"now-playing-widget\"] [role=\"button\"], [data-testid=\"now-playing-bar\"] [role=\"button\"], [data-testid=\"now-playing-view\"] [role=\"button\"], [data-testid=\"now-playing-panel\"] [role=\"button\"], [data-testid=\"now-playing-widget\"] [role=\"switch\"], [data-testid=\"now-playing-bar\"] [role=\"switch\"], [data-testid=\"now-playing-view\"] [role=\"switch\"], [data-testid=\"now-playing-panel\"] [role=\"switch\"]\', ids:/^(add-button|remove-button|add-to-library-button|remove-from-library-button)$/i,\n            off:/^(save to your library|add to (your )?(liked songs|library)|ajouter (\u00e0|aux) (la biblioth\u00e8que|titres lik\u00e9s)|enregistrer dans (votre |la )?biblioth\u00e8que|in (deine |der )?bibliothek (aufnehmen|hinzuf\u00fcgen)|a\u00f1adir a (tu )?biblioteca|adicionar (\u00e0 biblioteca|aos t\u00edtulos curtidos))$/i,\n            on:/^(remove from (your )?(library|liked songs)|retirer (de la biblioth\u00e8que|des titres lik\u00e9s)|supprimer de (votre |la )?biblioth\u00e8que|aus (deiner |der )?bibliothek entfernen|quitar de (tu )?biblioteca|remover (da biblioteca|dos t\u00edtulos curtidos))$/i}\n    };\n    // Aggregate structure only: fixed testid/role and label categories, never\n    // arbitrary labels or identifiers that could contain a track or account.\n    function structure() {\n        var roots=Array.from(document.querySelectorAll(\'[data-testid=\"now-playing-bar\"], [data-testid=\"now-playing-widget\"], [data-testid=\"player-controls\"], [data-testid=\"now-playing-view\"], [data-testid=\"now-playing-panel\"]\'));\n        var nodes=[];roots.forEach(function(root){Array.from(root.querySelectorAll(\'button,[role=\"button\"],[role=\"switch\"],[role=\"slider\"],input[type=\"range\"]\')).forEach(function(n){if(nodes.indexOf(n)<0)nodes.push(n);});});\n        var st={bar:0,view:0,nodes:Math.min(nodes.length,99),playpause:0,repeat:0,shuffle:0,like:0,queue:0,volume:0,lyrics:0,connect:0,other:0,button:0,switch:0,slider:0,aria_shuffle:0,aria_like:0,aria_play:0,aria_pause:0,aria_other:0,track_links:0,track_named:0,track_generic:0,npv_opener:0};\n        roots.forEach(function(r){if(/^(now-playing-view|now-playing-panel)$/.test(r.getAttribute(\'data-testid\')))st.view++;else st.bar++;});\n        nodes.forEach(function(n){\n            var id=String(n.getAttribute(\'data-testid\')||\'\').toLowerCase(), label=String(n.getAttribute(\'aria-label\')||\'\').trim(), role=String(n.getAttribute(\'role\')||\'\').toLowerCase();\n            var k=/^control-button-playpause$/.test(id)?\'playpause\':/repeat/.test(id)?\'repeat\':/shuffle/.test(id)?\'shuffle\':/^(add-button|remove-button|add-to-library-button|remove-from-library-button)$/.test(id)?\'like\':/^(queue-button|control-button-queue)$/.test(id)?\'queue\':/^(volume-bar|volume-slider)$/.test(id)?\'volume\':/^(lyrics-button|control-button-lyrics)$/.test(id)?\'lyrics\':/^(connect-button|control-button-connect|connect-device-picker|device-picker)$/.test(id)?\'connect\':\'other\';\n            st[k]=Math.min(st[k]+1,99);if(role===\'switch\')st.switch++;else if(role===\'slider\'||n.tagName===\'INPUT\')st.slider++;else st.button++;\n            if(specs.shuffle.off.test(label)||specs.shuffle.on.test(label))st.aria_shuffle++;else if(specs.like.off.test(label)||specs.like.on.test(label))st.aria_like++;else if(/^(play|resume|lire|reprendre)$/i.test(label))st.aria_play++;else if(/^(pause|mettre en pause)$/i.test(label))st.aria_pause++;else if(label)st.aria_other++;\n        });\n        var links=Array.from(document.querySelectorAll(\'[data-testid=\"now-playing-widget\"] a[href], [data-testid=\"now-playing-bar\"] a[href]\'));\n        // Shapes only (no href, title or label text): where the bar points, and\n        // what the checked (like-like) buttons\' labels contain.\n        [\'href_album\',\'href_album_hl\',\'href_hl_ambiguous\',\'href_artist\',\'href_uri\',\'href_other\',\'chk_buttons\',\'chk_likeword\',\'chk_verb_add\',\'chk_verb_on\',\'chk_long\',\'chk_favori\',\'chk_library\',\'chk_liked\',\'chk_add_false\',\'chk_add_true\',\'chk_popup\'].forEach(function(k){st[k]=0;});\n        links.forEach(function(a){\n            var hh=String(a.getAttribute(\'href\')||\'\');\n            if(/^spotify:(track|episode):[a-z0-9]+$/i.test(hh))st.href_uri++;else if(/\\/album\\//i.test(hh))st[/highlight=/i.test(hh)?\'href_album_hl\':\'href_album\']++;else if(/\\/artist\\//i.test(hh))st.href_artist++;else if(!/\\/(track|episode)\\//i.test(hh))st.href_other++;\n        });\n        Array.from(document.querySelectorAll(\'[data-testid=\"now-playing-widget\"] button[aria-checked], [data-testid=\"now-playing-bar\"] button[aria-checked]\')).forEach(function(b){\n            var l=String(b.getAttribute(\'aria-label\')||\'\').trim();if(/repeat|r[\u00e9e]p[\u00e9e]t|shuffle|al[\u00e9e]atoire/i.test(l)||/repeat|shuffle/i.test(String(b.getAttribute(\'data-testid\')||\'\')))return;\n            st.chk_buttons++;if(/(lik\u00e9|liked|biblioth\u00e8que|library|favori)/i.test(l))st.chk_likeword++;\n            if(/^(ajouter|add|enregistrer|save)/i.test(l))st.chk_verb_add++;if(/^(ajout\u00e9|retirer|supprimer|remove|enregistr\u00e9|saved|added)/i.test(l))st.chk_verb_on++;if(l.length>30)st.chk_long++;\n            if(/favori/i.test(l))st.chk_favori++;if(/biblioth\u00e8que|library/i.test(l))st.chk_library++;if(/lik\u00e9|liked/i.test(l))st.chk_liked++;\n            if(/^(ajouter|add|enregistrer|save)/i.test(l)) {if(b.getAttribute(\'aria-checked\')===\'false\')st.chk_add_false++;if(b.getAttribute(\'aria-checked\')===\'true\')st.chk_add_true++;}\n            if(/^(true|menu|dialog|listbox)$/i.test(String(b.getAttribute(\'aria-haspopup\')||\'\')))st.chk_popup++;\n\n        });\n        links.forEach(function(a){\n            var h=String(a.getAttribute(\'href\')||\'\');\n            if (!/^spotify:(track|episode):[a-z0-9]+$/i.test(h) && !/^(?:https:\\/\\/open\\.spotify\\.com)?\\/(?:intl-[a-z]{2}(?:-[a-z]{2})?\\/)?(?:track|episode)\\/[a-z0-9]+\\/?(?:[?#].*)?$/i.test(h) && !/^(?:https:\\/\\/open\\.spotify\\.com)?\\/(?:intl-[a-z]{2}(?:-[a-z]{2})?\\/)?album\\/[a-z0-9]+\\/?\\?(?:[^#]*&)?highlight=spotify(?::|%3a)track(?::|%3a)[a-z0-9]+/i.test(h)) return;\n            if (/\\/album\\//i.test(h)) {\n                try {\n                    var highlights=[];\n                    new URL(h, \'https://open.spotify.com\').searchParams.forEach(function(v,k){if(k.toLowerCase()===\'highlight\')highlights.push(v);});\n                    if(highlights.length!==1 || !/^spotify:track:[a-z0-9]+$/i.test(highlights[0])) {st.href_hl_ambiguous++;return;}\n                } catch (_) {st.href_hl_ambiguous++;return;}\n            }\n            st.track_links++;if(String(a.textContent||\'\').trim())st.track_named++;\n            if(!/^(context-item-link|nowplaying-track-link)$/i.test(String(a.getAttribute(\'data-testid\')||\'\')))st.track_generic++;\n        });\n        st.track_attr=0;\n        Array.from(document.querySelectorAll(\'[data-testid=\"now-playing-widget\"] [data-testid=\"context-item-link\"], [data-testid=\"now-playing-widget\"] [data-testid=\"nowplaying-track-link\"], [data-testid=\"now-playing-widget\"] [data-testid=\"context-item-info-title\"], [data-testid=\"now-playing-bar\"] [data-testid=\"context-item-link\"], [data-testid=\"now-playing-bar\"] [data-testid=\"nowplaying-track-link\"], [data-testid=\"now-playing-bar\"] [data-testid=\"context-item-info-title\"]\')).forEach(function(n){\n            if([\'data-uri\',\'data-track-uri\',\'data-spotify-uri\'].some(function(k){return /^spotify:(track|episode):[a-z0-9]+$/i.test(String(n.getAttribute(k)||\'\'));}))st.track_attr++;\n        });\n        Array.from(document.querySelectorAll(\'button, [role=\"button\"]\')).forEach(function(b){\n            var id=String(b.getAttribute(\'data-testid\')||\'\'), l=String(b.getAttribute(\'aria-label\')||\'\').trim();\n            if(/^(control-button-npv|now-playing-view-button)$/i.test(id)||/^(now playing view|show now playing view|hide now playing view|vue \u00ab ?en cours de lecture ?\u00bb|afficher la vue en cours de lecture|masquer la vue en cours de lecture|en cours de lecture|ansicht \u201el\u00e4uft gerade\u201c|vista de reproducci\u00f3n|tela tocando agora)$/i.test(l))st.npv_opener++;\n        });\n        // Counts outside player scopes help locate candidates only. They may\n        // belong to a playlist or another track and are NEVER actionable.\n        st.outside_like_id=0;st.outside_like_label=0;st.outside_track_links=0;\n        function inPlayer(n){return !!n.closest(\'[data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-bar\"], [data-testid=\"now-playing-view\"], [data-testid=\"now-playing-panel\"], [data-testid=\"NPV\"]\');}\n        Array.from(document.querySelectorAll(\'button, [role=\"button\"], [role=\"switch\"]\')).forEach(function(n){\n            if(!n.isConnected||inPlayer(n))return;\n            var id=String(n.getAttribute(\'data-testid\')||\'\'),label=String(n.getAttribute(\'aria-label\')||\'\').trim();\n            if(specs.like.ids.test(id))st.outside_like_id++;\n            if(specs.like.off.test(label)||specs.like.on.test(label))st.outside_like_label++;\n        });\n        Array.from(document.querySelectorAll(\'a[href]\')).forEach(function(a){\n            if(!a.isConnected||inPlayer(a))return;\n            if(/^(?:https:\\/\\/open\\.spotify\\.com)?\\/(?:intl-[a-z]{2}(?:-[a-z]{2})?\\/)?(?:track|episode)\\/[a-z0-9]+\\/?(?:[?#].*)?$/i.test(String(a.getAttribute(\'href\')||\'\')))st.outside_track_links++;\n        });\n        // Capability counts only. Never invoke platform APIs or include their\n        // state, user, title, identifiers, labels, or session information.\n        st.api_player=st.api_state=st.api_library=st.api_contains=st.api_add=0;\n        try {\n            var platform=window.Melodix && window.Melodix.Platform;\n            var player=platform && platform.PlayerAPI, library=platform && platform.LibraryAPI;\n            if(player)st.api_player=1;if(player && typeof player.getState===\'function\')st.api_state=1;\n            if(library)st.api_library=1;if(library && typeof library.contains===\'function\')st.api_contains=1;\n            if(library && typeof library.add===\'function\')st.api_add=1;\n        } catch (_) {}\n        Object.keys(st).forEach(function(k){st[k]=Math.min(st[k],99);});return JSON.stringify(st);\n    }\n    var spec=specs[kind], out={kind:kind===\'shuffle\'?\'shuffle\':kind===\'like\'?\'like\':kind===\'repeat\'?\'repeat\':\'unknown\',reason:\'control\',count:0,state:\'unknown\',label:\'unknown\',command:\'unknown\',disabled:false,smart:false,structure:structure()};\n    if(!spec)return JSON.stringify(out);\n    var nodes=Array.from(document.querySelectorAll(spec.selector)).filter(function(b){\n        return b.isConnected && (spec.ids.test(String(b.getAttribute(\'data-testid\')||\'\')) || spec.off.test(String(b.getAttribute(\'aria-label\')||\'\').trim()) || spec.on.test(String(b.getAttribute(\'aria-label\')||\'\').trim()));\n    });\n    out.count=Math.min(nodes.length,2);\n    if(nodes.length!==1){out.reason=nodes.length?\'ambiguous\':document.readyState===\'loading\'?\'page\':\'absent\';return JSON.stringify(out);}\n    var b=nodes[0], label=String(b.getAttribute(\'aria-label\')||\'\').trim();\n    out.label=spec.on.test(label)?\'on-action\':spec.off.test(label)?\'off-action\':label?\'unrecognized\':\'absent\';\n    out.disabled=!!b.disabled || b.getAttribute(\'aria-disabled\')===\'true\';\n    var raw=b.getAttribute(\'aria-checked\');if(raw===null)raw=b.getAttribute(\'aria-pressed\');\n    out.state=raw===\'true\'||raw===\'false\'||(kind!==\'like\'&&raw===\'mixed\')?raw:raw===null?(out.label===\'on-action\'?\'true\':out.label===\'off-action\'?\'false\':\'unknown\'):\'unknown\';\n    out.smart=kind===\'shuffle\' && out.state===\'mixed\';\n    var id=String(b.getAttribute(\'data-testid\')||\'\').toLowerCase();\n    var conflict=kind===\'like\' && ((out.state===\'false\' && (out.label===\'on-action\'||/^(remove-button|remove-from-library-button)$/.test(id))) || (out.state===\'true\' && out.label===\'off-action\'));\n    var unverified=kind===\'like\' && out.label!==\'off-action\' && out.label!==\'on-action\';\n    if(unverified)out.state=\'unknown\';\n    var popup=String(b.getAttribute(\'aria-haspopup\')||\'\').toLowerCase();\n    if(kind===\'like\')out.command=popup===\'true\'||popup===\'menu\'||popup===\'dialog\'||popup===\'listbox\'||popup===\'tree\'||popup===\'grid\'?\'menu\':\'unspecified\';\n    else out.command=\'toggle\';\n    var description=String(b.getAttribute(\'aria-description\')||\'\').trim();\n    var restricted=kind===\'shuffle\' && out.disabled && /^(shuffle is not available (with|for) (this account|this playback)|l[\'\u2019]al\u00e9atoire n[\'\u2019]est pas disponible avec (ce compte|cette lecture))$/i.test(description);\n    out.reason=restricted?\'restriction\':out.disabled?\'disabled\':conflict?\'conflict\':unverified?\'unverified\':out.state===\'unknown\'?\'state\':\'observed\';\n    return JSON.stringify(out);\n})\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    invoke-static {v1}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ");return JSON.stringify(r);})()"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static clean(Ljava/lang/String;)Ljava/lang/String;
    .locals 6

    .prologue
    .line 31
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v2

    array-length v3, v2

    const/4 v0, 0x0

    :goto_0
    if-lt v0, v3, :cond_1

    :cond_0
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    if-nez v0, :cond_6

    const-string v0, "aucune"

    :goto_1
    return-object v0

    :cond_1
    aget-char v4, v2, v0

    const/16 v5, 0x61

    if-lt v4, v5, :cond_2

    const/16 v5, 0x7a

    if-le v4, v5, :cond_4

    :cond_2
    const/16 v5, 0x30

    if-lt v4, v5, :cond_3

    const/16 v5, 0x39

    if-le v4, v5, :cond_4

    :cond_3
    const/16 v5, 0x3a

    if-eq v4, v5, :cond_4

    const/16 v5, 0x2d

    if-eq v4, v5, :cond_4

    const/16 v5, 0x2c

    if-eq v4, v5, :cond_4

    const/16 v5, 0x3e

    if-ne v4, v5, :cond_5

    :cond_4
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_5
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    const/16 v5, 0xa0

    if-gt v4, v5, :cond_0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_6
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1
.end method

.method private static count(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .prologue
    .line 32
    const/4 v0, 0x0

    const/16 v1, 0x63

    :try_start_0
    const-string v2, "0"

    invoke-virtual {p0, p1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    :goto_0
    return-object v0

    :catch_0
    move-exception v0

    const-string v0, "0"

    goto :goto_0
.end method

.method private diagnosticIndex()I
    .locals 2

    .prologue
    .line 33
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v1, "shuffle"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

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

    goto :goto_0
.end method

.method public static diagnosticReport()Ljava/lang/String;
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 56
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "\nAl\u00e9atoire \u2014 actuel : "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v1, Lcom/melodix/music/PreviewPlayerMode;->last:[Ljava/lang/String;

    aget-object v1, v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " ; avant : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/melodix/music/PreviewPlayerMode;->before:[Ljava/lang/String;

    aget-object v1, v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " ; apr\u00e8s : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/melodix/music/PreviewPlayerMode;->after:[Ljava/lang/String;

    aget-object v1, v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " ; r\u00e9sultat : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/melodix/music/PreviewPlayerMode;->outcome:[Ljava/lang/String;

    aget-object v1, v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 57
    const-string v1, "\nLike \u2014 actuel : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/melodix/music/PreviewPlayerMode;->last:[Ljava/lang/String;

    aget-object v1, v1, v3

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " ; avant : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/melodix/music/PreviewPlayerMode;->before:[Ljava/lang/String;

    aget-object v1, v1, v3

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " ; apr\u00e8s : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/melodix/music/PreviewPlayerMode;->after:[Ljava/lang/String;

    aget-object v1, v1, v3

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " ; r\u00e9sultat : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/melodix/music/PreviewPlayerMode;->outcome:[Ljava/lang/String;

    aget-object v1, v1, v3

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 58
    const-string v1, "\nR\u00e9p\u00e9tition \u2014 actuel : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/melodix/music/PreviewPlayerMode;->last:[Ljava/lang/String;

    aget-object v1, v1, v4

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " ; avant : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/melodix/music/PreviewPlayerMode;->before:[Ljava/lang/String;

    aget-object v1, v1, v4

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " ; apr\u00e8s : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/melodix/music/PreviewPlayerMode;->after:[Ljava/lang/String;

    aget-object v1, v1, v4

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " ; r\u00e9sultat : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/melodix/music/PreviewPlayerMode;->outcome:[Ljava/lang/String;

    aget-object v1, v1, v4

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 59
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

    sget-object v1, Lcom/melodix/music/PreviewPlayerMode;->methods:[Ljava/lang/String;

    aget-object v1, v1, v3

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " | "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/melodix/music/PreviewPlayerMode;->methods:[Ljava/lang/String;

    aget-object v1, v1, v4

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nStructure lecteur (comptes seulement ; autres libell\u00e9s masqu\u00e9s) : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/melodix/music/PreviewPlayerMode;->structure:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 56
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private drawable(Ljava/lang/String;)I
    .locals 3

    .prologue
    .line 226
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const-string v1, "drawable"

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method private finishJob(Lorg/json/JSONObject;)V
    .locals 10

    .prologue
    const-wide/16 v8, 0x1

    const/4 v7, 0x0

    .line 205
    const-string v0, "outcome"

    const-string v1, "failed"

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "confirmed|unconfirmed|unverified|read|identity|disabled|failed|menu-absent|menu-ambiguous|menu-state"

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewPlayerMode;->allowed(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 206
    const-string v0, "state"

    const-string v1, "unknown"

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "true|false|mixed|unknown"

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewPlayerMode;->allowed(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 207
    const-string v0, "method"

    const-string v3, ""

    invoke-virtual {p1, v0, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v3, "direct|now-playing-view|keyboard|unknown"

    invoke-static {v0, v3}, Lcom/melodix/music/PreviewPlayerMode;->allowed(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 208
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->diagnosticIndex()I

    move-result v3

    .line 209
    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v5, "like"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerMode;->pendingTrack:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_0

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerMode;->pendingTitle:Ljava/lang/String;

    invoke-direct {p0, v4}, Lcom/melodix/music/PreviewPlayerMode;->sameNativeTitle(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_1

    :cond_0
    const-string v2, "identity"

    const-string v1, "unknown"

    .line 210
    :cond_1
    if-ltz v3, :cond_3

    sget-object v4, Lcom/melodix/music/PreviewPlayerMode;->methods:[Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "m\u00e9thode="

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_2

    const-string v0, "aucune"

    :cond_2
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v5, ", r\u00e9sultat="

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v5, ", \u00e9tapes="

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v5, "journal"

    const-string v6, ""

    invoke-virtual {p1, v5, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/melodix/music/PreviewPlayerMode;->clean(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v4, v3

    sget-object v0, Lcom/melodix/music/PreviewPlayerMode;->outcome:[Ljava/lang/String;

    aput-object v2, v0, v3

    .line 211
    :cond_3
    iput-boolean v7, p0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerMode;->generation:J

    add-long/2addr v4, v8

    iput-wide v4, p0, Lcom/melodix/music/PreviewPlayerMode;->generation:J

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerMode;->querySerial:J

    add-long/2addr v4, v8

    iput-wide v4, p0, Lcom/melodix/music/PreviewPlayerMode;->querySerial:J

    iput-boolean v7, p0, Lcom/melodix/music/PreviewPlayerMode;->queryInFlight:Z

    .line 212
    const-string v0, "confirmed"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    const-string v0, "read"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    :cond_4
    const-string v0, "unknown"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_9

    .line 213
    iput-object v1, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    const-string v0, "observed"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    iput-object v1, p0, Lcom/melodix/music/PreviewPlayerMode;->remembered:Ljava/lang/String;

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v3, "like"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->nativeTitle()Ljava/lang/String;

    move-result-object v0

    :goto_0
    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->rememberedTitle:Ljava/lang/String;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->paint()V

    .line 214
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v3, "like"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->getContext()Landroid/content/Context;

    move-result-object v3

    const-string v0, "confirmed"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    const-string v0, "Ajout\u00e9 aux titres lik\u00e9s"

    :goto_1
    invoke-static {v3, v0, v7}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 225
    :cond_5
    :goto_2
    return-void

    .line 213
    :cond_6
    const-string v0, ""

    goto :goto_0

    .line 214
    :cond_7
    const-string v0, "true"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    const-string v0, "D\u00e9j\u00e0 dans vos titres lik\u00e9s"

    goto :goto_1

    :cond_8
    const-string v0, "Pas encore dans vos titres lik\u00e9s"

    goto :goto_1

    .line 217
    :cond_9
    const-string v0, "unknown"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    .line 218
    const-string v0, "unverified"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a

    const-string v0, "unverified"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->paint()V

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "Commande envoy\u00e9e, \u00e9tat non v\u00e9rifiable"

    invoke-static {v0, v1, v7}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_2

    .line 219
    :cond_a
    const-string v0, "identity"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    const-string v0, "identity"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->paint()V

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "Titre en cours diff\u00e9rent, R\u00e9essayer"

    invoke-static {v0, v1, v7}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_2

    .line 220
    :cond_b
    const-string v0, "menu-"

    invoke-virtual {v2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_e

    const-string v0, "menu"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->paint()V

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v0, "menu-ambiguous"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c

    const-string v0, "Plusieurs choix Like possibles, aucun ajout"

    :goto_3
    const/4 v2, 0x1

    invoke-static {v1, v0, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_2

    :cond_c
    const-string v0, "menu-state"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d

    const-string v0, "\u00c9tat Like non v\u00e9rifiable, aucun ajout"

    goto :goto_3

    :cond_d
    const-string v0, "Titres lik\u00e9s introuvables dans le menu"

    goto :goto_3

    .line 221
    :cond_e
    const-string v0, "disabled"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_f

    const-string v0, "disabled"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->paint()V

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->reasonText()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v7}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto/16 :goto_2

    .line 222
    :cond_f
    const-string v0, "unconfirmed"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_10

    const-string v0, "confirmation"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->paint()V

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "Action non confirm\u00e9e. R\u00e9essayer"

    invoke-static {v0, v1, v7}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto/16 :goto_2

    .line 223
    :cond_10
    const-string v0, "control"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->paint()V

    .line 224
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v2, "shuffle"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_11

    const-string v0, "Al\u00e9atoire indisponible, R\u00e9essayer"

    :goto_4
    invoke-static {v1, v0, v7}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto/16 :goto_2

    :cond_11
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v2, "like"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_12

    const-string v0, "Like indisponible, R\u00e9essayer"

    goto :goto_4

    :cond_12
    const-string v0, "R\u00e9p\u00e9tition indisponible, R\u00e9essayer"

    goto :goto_4
.end method

.method private invoke()V
    .locals 12

    .prologue
    const-wide/16 v10, 0x1

    const/4 v6, 0x1

    const/4 v9, 0x3

    const/4 v8, 0x0

    .line 163
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    .line 164
    iget-boolean v2, p0, Lcom/melodix/music/PreviewPlayerMode;->running:Z

    if-eqz v2, :cond_0

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->isShown()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->getWindowVisibility()I

    move-result v2

    if-nez v2, :cond_0

    iget-boolean v2, p0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    if-nez v2, :cond_0

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerMode;->lastTap:J

    sub-long v2, v0, v2

    const-wide/16 v4, 0x190

    cmp-long v2, v2, v4

    if-gez v2, :cond_1

    .line 189
    :cond_0
    :goto_0
    return-void

    .line 165
    :cond_1
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    const-string v3, "unknown"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->tappable()Z

    move-result v2

    if-nez v2, :cond_4

    .line 166
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->beginDiagnostic()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->diagnosticIndex()I

    move-result v2

    if-ltz v2, :cond_2

    sget-object v3, Lcom/melodix/music/PreviewPlayerMode;->outcome:[Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "non envoy\u00e9 : "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v2

    .line 167
    :cond_2
    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode;->lastTap:J

    invoke-virtual {p0, v9}, Lcom/melodix/music/PreviewPlayerMode;->performHapticFeedback(I)Z

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->shake()V

    .line 168
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v2, "bar"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    const-string v0, "Lance un titre pour utiliser ce bouton"

    :goto_1
    invoke-static {v1, v0, v8}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0

    :cond_3
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->reasonText()Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    .line 171
    :cond_4
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v3, "like"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerMode;->track:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_5

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerMode;->title:Ljava/lang/String;

    invoke-direct {p0, v2}, Lcom/melodix/music/PreviewPlayerMode;->sameNativeTitle(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_7

    .line 172
    :cond_5
    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode;->lastTap:J

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->beginDiagnostic()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->diagnosticIndex()I

    move-result v0

    if-ltz v0, :cond_6

    sget-object v1, Lcom/melodix/music/PreviewPlayerMode;->outcome:[Ljava/lang/String;

    const-string v2, "non envoy\u00e9 : identit\u00e9"

    aput-object v2, v1, v0

    .line 173
    :cond_6
    const-string v0, "identity"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->paint()V

    invoke-virtual {p0, v9}, Lcom/melodix/music/PreviewPlayerMode;->performHapticFeedback(I)Z

    .line 174
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "Titre non identifi\u00e9, aucun ajout. R\u00e9essayer"

    invoke-static {v0, v1, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto/16 :goto_0

    .line 176
    :cond_7
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->web()Landroid/webkit/WebView;

    move-result-object v2

    if-nez v2, :cond_8

    const-string v0, "unknown"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    const-string v0, "web"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->paint()V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v1, "like"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "Page Spotify indisponible, R\u00e9essayer"

    invoke-static {v0, v1, v8}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto/16 :goto_0

    .line 177
    :cond_8
    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode;->lastTap:J

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->beginDiagnostic()V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v1, "like"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "V\u00e9rification des titres lik\u00e9s\u2026"

    invoke-static {v0, v1, v8}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    :cond_9
    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    iput-boolean v6, p0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    iput-boolean v8, p0, Lcom/melodix/music/PreviewPlayerMode;->observedPending:Z

    .line 178
    iput-object v1, p0, Lcom/melodix/music/PreviewPlayerMode;->pendingState:Ljava/lang/String;

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v3, "like"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->title:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerMode;->sameNativeTitle(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_a

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->track:Ljava/lang/String;

    :goto_2
    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->pendingTrack:Ljava/lang/String;

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v3, "like"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->title:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerMode;->sameNativeTitle(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_c

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->title:Ljava/lang/String;

    :goto_3
    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->pendingTitle:Ljava/lang/String;

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerMode;->generation:J

    add-long/2addr v4, v10

    iput-wide v4, p0, Lcom/melodix/music/PreviewPlayerMode;->generation:J

    iget-wide v6, p0, Lcom/melodix/music/PreviewPlayerMode;->querySerial:J

    add-long/2addr v6, v10

    iput-wide v6, p0, Lcom/melodix/music/PreviewPlayerMode;->querySerial:J

    iput-boolean v8, p0, Lcom/melodix/music/PreviewPlayerMode;->queryInFlight:Z

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->paint()V

    invoke-virtual {p0, v9}, Lcom/melodix/music/PreviewPlayerMode;->performHapticFeedback(I)Z

    .line 179
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->handler:Landroid/os/Handler;

    new-instance v3, Lcom/melodix/music/PreviewPlayerMode$5;

    invoke-direct {v3, p0, v4, v5}, Lcom/melodix/music/PreviewPlayerMode$5;-><init>(Lcom/melodix/music/PreviewPlayerMode;J)V

    .line 181
    const-wide/16 v6, 0x1b58

    .line 179
    invoke-virtual {v0, v3, v6, v7}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 182
    :try_start_0
    const-string v0, "run"

    invoke-direct {p0, v0, v1}, Lcom/melodix/music/PreviewPlayerMode;->job(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lcom/melodix/music/PreviewPlayerMode$6;

    invoke-direct {v1, p0, v4, v5}, Lcom/melodix/music/PreviewPlayerMode$6;-><init>(Lcom/melodix/music/PreviewPlayerMode;J)V

    invoke-virtual {v2, v0, v1}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 188
    :catch_0
    move-exception v0

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->notConfirmed()V

    goto/16 :goto_0

    .line 178
    :cond_a
    const-string v0, ""

    goto :goto_2

    :cond_b
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->track:Ljava/lang/String;

    goto :goto_2

    :cond_c
    const-string v0, ""

    goto :goto_3
.end method

.method private job(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .prologue
    .line 147
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "((function(kind, action, shownState, expectedTitle, expectedTrack) {\n    \'use strict\';\n    // One explicit tap = one job. Methods in order, state re-read after each:\n    // (a) control already in the page, (b) briefly open the now-playing view in\n    // the hidden page and close it again, (c) web-player keyboard shortcut\n    // (shuffle/repeat only: a like is never sent without a verified state).\n    // Never reads storage, cookies or tokens; never navigates; no network.\n    var W = window;\n    var jobs = W.__melodixModeJobs = W.__melodixModeJobs || {};\n    if ([\'like\', \'shuffle\', \'repeat\'].indexOf(kind) < 0) return JSON.stringify({status: \'done\', outcome: \'failed\', reason: \'kind\'});\n    if (action === \'poll\') {\n        var previous = jobs[kind] || {status: \'none\'};\n        // A result can become stale after it was recorded but before native polling.\n        if (kind === \'like\' && previous.status === \'done\' &&\n            (previous.outcome === \'confirmed\' || previous.outcome === \'read\') && !identityMatches()) {\n            previous.outcome = \'identity\'; previous.state = \'unknown\';\n            if (previous.journal && previous.journal.length < 16) previous.journal.push(\'poll:identity\');\n        }\n        return JSON.stringify(previous);\n    }\n    if (action !== \'run\') return JSON.stringify({status: \'none\'});\n    if (jobs[kind] && jobs[kind].status === \'running\' && Date.now() - jobs[kind].started < 8000) return JSON.stringify({status: \'busy\'});\n    var labels = {\n        like: {\n            off: /^(save to your library|add to (your )?(liked songs|library)|ajouter (\u00e0|aux) (la biblioth\u00e8que|titres lik\u00e9s|vos titres lik\u00e9s)|enregistrer dans (votre |la )?biblioth\u00e8que|in (deine |der )?bibliothek (aufnehmen|hinzuf\u00fcgen)|a\u00f1adir a (tu )?biblioteca|adicionar (\u00e0 biblioteca|aos t\u00edtulos curtidos))$/i,\n            on: /^(remove from (your )?(library|liked songs)|retirer (de la biblioth\u00e8que|des titres lik\u00e9s|de vos titres lik\u00e9s)|supprimer de (votre |la )?biblioth\u00e8que|aus (deiner |der )?bibliothek entfernen|quitar de (tu )?biblioteca|remover (da biblioteca|dos t\u00edtulos curtidos))$/i\n        },\n        repeat: {\n            off: /^(enable repeat|turn repeat on|activer la r\u00e9p\u00e9tition|wiederholung aktivieren|activar repetici\u00f3n|ativar repeti\u00e7\u00e3o)$/i,\n            on: /^(disable repeat|turn repeat off|enable repeat one|d\u00e9sactiver la r\u00e9p\u00e9tition|activer la r\u00e9p\u00e9tition d[\'\u2019]un titre|wiederholung deaktivieren|desactivar repetici\u00f3n|desativar repeti\u00e7\u00e3o)$/i\n        },\n        shuffle: {\n            off: /^(enable shuffle|turn shuffle on|activate shuffle|activer (la lecture |le mode |l[\'\u2019])?al\u00e9atoire|zufallswiedergabe aktivieren|activar (el modo |la reproducci\u00f3n )?aleatori[oa]|ativar (a reprodu\u00e7\u00e3o )?aleat\u00f3ria)$/i,\n            on: /^(disable shuffle|turn shuffle off|deactivate shuffle|enable smart shuffle|d\u00e9sactiver (la lecture |le mode |l[\'\u2019])?al\u00e9atoire|activer la lecture al\u00e9atoire intelligente|zufallswiedergabe deaktivieren|desactivar (el modo |la reproducci\u00f3n )?aleatori[oa]|desativar (a reprodu\u00e7\u00e3o )?aleat\u00f3ria)$/i\n        }\n    };\n    // Neutral names locate a control but never decide its state.\n    var neutral = /^(shuffle|lecture al\u00e9atoire|al\u00e9atoire|repeat|r\u00e9p\u00e9ter|r\u00e9p\u00e9tition)$/i;\n    var ids = {\n        like: /^(add-button|remove-button|add-to-library-button|remove-from-library-button)$/i,\n        repeat: /^control-button-repeat$/i,\n        shuffle: /^control-button-shuffle$|shuffle/i\n    };\n    var job = {status: \'running\', started: Date.now(), outcome: \'\', state: \'unknown\', method: \'\', journal: []};\n    jobs[kind] = job;\n    function log(code) { if (job.journal.length < 16) job.journal.push(code); }\n    function finish(outcome, state, method) { job.status = \'done\'; job.outcome = outcome; job.state = state || \'unknown\'; job.method = method || \'\'; }\n    function label(b) { return String(b.getAttribute(\'aria-label\') || \'\').trim(); }\n    function testid(b) { return String(b.getAttribute(\'data-testid\') || \'\'); }\n    // Current Spotify wording varies: a verb plus a liked-songs/library word.\n    (function() {\n        var word = /(titres lik\u00e9s|liked songs|biblioth\u00e8que|library|biblioteca|bibliothek)/i, off = labels.like.off, on = labels.like.on;\n        labels.like.off = {test: function(l) { return off.test(l) || (word.test(l) && /^(ajouter|add|enregistrer|save|a\u00f1adir|adicionar|hinzuf\u00fcgen|zu)\\b/i.test(l)); }};\n        labels.like.on = {test: function(l) { return on.test(l) || (word.test(l) && /^(ajout\u00e9|retirer|supprimer|remove|enregistr\u00e9|saved|added|quitar|remover|entfernen)/i.test(l)); }};\n    })();\n    // Spotify\'s \"+\" save button: generic \"Ajouter...\" label, state in aria-checked.\n    function genericAdd(l) { return /^(ajouter|add|enregistrer|save)\\b/i.test(l) && !/(titres lik\u00e9s|liked songs|biblioth\u00e8que|library|file d[\'\u2019]attente|queue)/i.test(l); }\n    function find() {\n        var list = Array.from(document.querySelectorAll(\'button, [role=\"button\"], [role=\"switch\"]\')).filter(function(b) {\n            if (!b.isConnected) return false;\n            var l = label(b);\n            return ids[kind].test(testid(b)) || labels[kind].off.test(l) || labels[kind].on.test(l) ||\n                (kind === \'like\' && b.hasAttribute(\'aria-checked\') && genericAdd(l)) ||\n                (kind !== \'like\' && neutral.test(l) && (kind === \'shuffle\' ? /al[\u00e9e]atoire|shuffle/i : /r[\u00e9e]p[\u00e9e]t|repeat/i).test(l));\n        });\n        if (kind === \'like\') {\n            var scoped = list.filter(function(b) {\n                return b.closest(\'[data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-bar\"], [data-testid=\"now-playing-view\"], [data-testid=\"now-playing-panel\"], [data-testid=\"NPV\"]\');\n            });\n            list = scoped;\n        }\n        if (list.length > 1) {\n            var visible = list.filter(function(b) { var r = b.getBoundingClientRect(); return r.width > 0 && r.height > 0; });\n            if (visible.length === 1) list = visible;\n        }\n        if (!list.length) return {reason: \'absent\'};\n        if (list.length !== 1) return {reason: \'ambiguous\'};\n        var b = list[0];\n        if (b.disabled || b.getAttribute(\'aria-disabled\') === \'true\') return {reason: \'disabled\', node: b};\n        return {node: b, reason: \'\'};\n    }\n    function read(b) {\n        var checked = b.getAttribute(\'aria-checked\'), pressed = b.getAttribute(\'aria-pressed\');\n        var raw = checked === null ? pressed : checked;\n        var l = label(b), on = labels[kind].on.test(l), off = labels[kind].off.test(l);\n        if (kind === \'like\') {\n            var id = testid(b).toLowerCase();\n            var remove = /^(remove-button|remove-from-library-button)$/.test(id);\n            if (/^(true|menu|dialog|listbox|tree|grid)$/i.test(String(b.getAttribute(\'aria-haspopup\') || \'\')) ||\n                b.matches(\':disabled\') || b.closest(\'[aria-disabled=\"true\"], fieldset:disabled\') ||\n                (checked !== null && pressed !== null && checked !== pressed)) return \'unknown\';\n            if (raw !== null && raw !== \'true\' && raw !== \'false\') return \'unknown\';\n            if (raw === null) raw = on ? \'true\' : off ? \'false\' : \'unknown\';\n            if ((raw === \'false\' && (on || remove)) || (raw === \'true\' && off)) return \'unknown\';\n            // An unlabelled generic add-button may open a playlist picker.\n            if (!off && !on) return \'unknown\';\n            return raw;\n        }\n        if (raw === \'true\' || raw === \'false\' || raw === \'mixed\') return raw;\n        return on ? \'true\' : off ? \'false\' : \'unknown\';\n    }\n    // Spotify\'s bar title links to the album with the track in ?highlight=spotify:track:ID.\n    function trackHref(h) {\n        h = String(h || \'\');\n        // A Spotify URI is a complete identity, unlike an album or title.\n        var uri = /^spotify:(track|episode):([a-z0-9]+)$/i.exec(h);\n        if (uri) return uri;\n        var m = /^(?:https:\\/\\/open\\.spotify\\.com)?\\/(?:intl-[a-z]{2}(?:-[a-z]{2})?\\/)?(track|episode)\\/([a-z0-9]+)\\/?(?:[?#].*)?$/i.exec(h);\n        if (m) return m;\n        var a = /^(?:https:\\/\\/open\\.spotify\\.com)?\\/(?:intl-[a-z]{2}(?:-[a-z]{2})?\\/)?album\\/[a-z0-9]+\\/?\\?(?:[^#]*&)?highlight=spotify(?::|%3a)(track)(?::|%3a)([a-z0-9]+)(?:[&#].*)?$/i.exec(h);\n        if (a) {\n            // Duplicate highlight keys, including encoded/case variants,\n            // have ambiguous semantics. Never choose one arbitrarily.\n            try {\n                var query = new URL(h, \'https://open.spotify.com\').searchParams;\n                var values = [];\n                query.forEach(function(value, key) { if (key.toLowerCase() === \'highlight\') values.push(value); });\n                if (values.length !== 1 || !/^spotify:track:[a-z0-9]+$/i.test(values[0])) return null;\n                var parts = /^spotify:(track):([a-z0-9]+)$/i.exec(values[0]);\n                return [a[0], parts[1], parts[2]];\n            } catch (_) { return null; }\n        }\n        return null; // an album and title cannot uniquely identify a track\n    }\n    // Explicit track URIs on the current-player title only; never infer a\n    // track from an album, playlist, title alone, or an unrelated page row.\n    function markedTrack(n) {\n        if (!/^(context-item-link|nowplaying-track-link|context-item-info-title)$/i.test(String(n.getAttribute(\'data-testid\') || \'\'))) return \'\';\n        var result = \'\';\n        for (var name of [\'data-uri\', \'data-track-uri\', \'data-spotify-uri\']) {\n            if (!n.hasAttribute(name)) continue;\n            var m = /^spotify:(track|episode):([a-z0-9]+)$/i.exec(String(n.getAttribute(name) || \'\'));\n            if (!m) return \'!\';\n            var value = m[1].toLowerCase()+\':\'+m[2];\n            if (result && result !== value) return \'!\';\n            result = value;\n        }\n        return result;\n    }\n    // If a title link itself carries a malformed track hint, an attribute\n    // must not mask that ambiguity. Album-only links may use their explicit\n    // current-title parent marker, but never one outside the player bar.\n    function hasTrackHint(h) {\n        h=String(h||\'\');\n        if (/^spotify:(track|episode):/i.test(h) || /\\/(track|episode)\\//i.test(h)) return true;\n        try {\n            var found=false;\n            new URL(h, \'https://open.spotify.com\').searchParams.forEach(function(v,k){if(k.toLowerCase()===\'highlight\')found=true;});\n            return found;\n        } catch (_) { return true; }\n    }\n    function parentTrack(link) {\n        var n=link.closest(\'[data-testid=\"context-item-info-title\"]\');\n        if(!n || !n.closest(\'[data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-bar\"]\')) return \'\';\n        return markedTrack(n);\n    }\n    function markedTitleNodes() {\n        return Array.from(document.querySelectorAll(\'[data-testid=\"now-playing-widget\"] [data-testid=\"context-item-link\"], [data-testid=\"now-playing-widget\"] [data-testid=\"nowplaying-track-link\"], [data-testid=\"now-playing-widget\"] [data-testid=\"context-item-info-title\"], [data-testid=\"now-playing-bar\"] [data-testid=\"context-item-link\"], [data-testid=\"now-playing-bar\"] [data-testid=\"nowplaying-track-link\"], [data-testid=\"now-playing-bar\"] [data-testid=\"context-item-info-title\"]\')).filter(function(n) { return n.isConnected; });\n    }\n    function identityMatches() {\n        if (!expectedTitle || !expectedTrack) return false;\n        var links = Array.from(document.querySelectorAll(\'[data-testid=\"now-playing-widget\"] a[href], [data-testid=\"now-playing-bar\"] a[href], a[data-testid=\"nowplaying-track-link\"][href], [data-testid=\"now-playing-view\"] a[href]\'));\n        var malformedIdentity = false;\n        var identities = links.map(function(link) {\n            var m = trackHref(String(link.getAttribute(\'href\') || \'\'));\n            if (!m && /^(context-item-link|nowplaying-track-link)$/i.test(String(link.getAttribute(\'data-testid\') || \'\')) && (hasTrackHint(link.getAttribute(\'href\')) || (!markedTrack(link) && !parentTrack(link)))) malformedIdentity = true;\n            return m ? {track:m[1].toLowerCase()+\':\'+m[2],title:String(link.textContent || \'\').replace(/\\s+/g, \' \').trim()} : null;\n        }).filter(Boolean);\n        markedTitleNodes().forEach(function(n) {\n            var value=markedTrack(n);\n            if (value === \'!\') { malformedIdentity = true; return; }\n            if (value) identities.push({track:value, title:String(n.textContent || \'\').replace(/\\s+/g, \' \').trim()});\n        });\n        return !malformedIdentity && identities.some(function(x) { return x.title === expectedTitle; }) && identities.every(function(x) {\n            return x.track === expectedTrack && (!x.title || x.title === expectedTitle);\n        });\n    }\n    function opener() {\n        var list = Array.from(document.querySelectorAll(\'button, [role=\"button\"]\')).filter(function(b) {\n            if (!b.isConnected) return false;\n            var id = testid(b), l = label(b);\n            return /^(control-button-npv|now-playing-view-button)$/i.test(id) ||\n                /^(now playing view|show now playing view|hide now playing view|vue \u00ab ?en cours de lecture ?\u00bb|afficher la vue en cours de lecture|masquer la vue en cours de lecture|en cours de lecture|ansicht \u201el\u00e4uft gerade\u201c|vista de reproducci\u00f3n|tela tocando agora)$/i.test(l);\n        });\n        return list.length === 1 ? list[0] : null;\n    }\n    function pressed(b) { return b.getAttribute(\'aria-pressed\') === \'true\' || b.getAttribute(\'aria-expanded\') === \'true\' || b.getAttribute(\'data-active\') === \'true\'; }\n    function wait(test, ms, done) {\n        var end = Date.now() + ms;\n        (function step() {\n            var v;\n            try { v = test(); } catch (_) { v = null; }\n            if (v || Date.now() >= end) { done(v || null); return; }\n            setTimeout(step, 120);\n        })();\n    }\n    function invalidateLikedRead() {\n        try { if (typeof W.__sfLikedMutationAttempted === \'function\') W.__sfLikedMutationAttempted(); } catch (_) {}\n    }\n    // Open only an explicitly announced add menu, then act only on a unique,\n    // explicitly unchecked Liked Songs item. Never select another playlist.\n    function viaLikeMenu(b, method, after) {\n        var id = testid(b).toLowerCase(), l = label(b), popup = String(b.getAttribute(\'aria-haspopup\') || \'\');\n        if (!/^(true|menu|dialog|listbox)$/i.test(popup)) return false;\n        if (!identityMatches()) { log(method + \':menu-identity\'); after(\'identity\', \'unknown\'); return true; }\n        if (!/^(add-button|add-to-library-button)$/.test(id) || labels.like.on.test(l) ||\n            shownState === \'true\' || ((b.getAttribute(\'aria-checked\') === \'true\' || b.getAttribute(\'aria-pressed\') === \'true\') && !genericAdd(l)) ||\n            b.matches(\':disabled\') || b.closest(\'[aria-disabled=\"true\"], fieldset:disabled\')) {\n            log(method + \':menu-unsafe\'); after(\'menu-state\', \'unknown\'); return true;\n        }\n        var selector = \'[role=\"menu\"], [role=\"dialog\"], [role=\"listbox\"]\';\n        function available(n) { return n && n.isConnected && !n.closest(\'[hidden], [aria-hidden=\"true\"]\'); }\n        var before = Array.from(document.querySelectorAll(selector)).filter(available);\n        var expanded = b.getAttribute(\'aria-expanded\') === \'true\', opened = false;\n        function root() {\n            var id = b.getAttribute(\'aria-controls\'), controlled = id && document.getElementById(id);\n            if (available(controlled) && controlled.matches(selector) &&\n                (expanded || before.indexOf(controlled) < 0 || b.getAttribute(\'aria-expanded\') === \'true\')) return controlled;\n            if (expanded) return null;\n            var fresh = Array.from(document.querySelectorAll(selector)).filter(function(n) { return available(n) && before.indexOf(n) < 0; });\n            return fresh.length === 1 ? fresh[0] : null;\n        }\n        function closeMenu(r) {\n            if (!opened) return;\n            try {\n                (available(r) ? r : b).dispatchEvent(new KeyboardEvent(\'keydown\', {key:\'Escape\', code:\'Escape\', bubbles:true, cancelable:true}));\n                log(available(r) && b.getAttribute(\'aria-expanded\') === \'true\' ? method + \':menu-close-unverified\' : method + \':menu-close-requested\');\n            } catch (_) { log(method + \':menu-close-error\'); }\n        }\n        if (!expanded) {\n            try { b.click(); opened = true; log(method + \':menu-open\'); }\n            catch (_) { log(method + \':menu-open-error\'); after(\'menu-absent\', \'unknown\'); return true; }\n        }\n        wait(function() {\n            if (!identityMatches()) return \'identity-changed\';\n            return root();\n        }, 1800, function(r) {\n            if (r === \'identity-changed\') { closeMenu(null); after(\'identity\', \'unknown\'); return; }\n            if (!r) { log(method + \':menu-root\'); closeMenu(null); after(\'menu-absent\', \'unknown\'); return; }\n            var likedName = /^(liked songs|your liked songs|titres lik\u00e9s|vos titres lik\u00e9s|titres que j[\'\u2019]aime|liked-titel|canciones que te gustan|m\u00fasicas curtidas)$/i;\n            function targets() {\n                if (!available(r)) return [];\n                return Array.from(r.querySelectorAll(\'[role=\"menuitemcheckbox\"], [role=\"checkbox\"], input[type=\"checkbox\"]\')).filter(function(n) {\n                    var labelNode = n.closest(\'label\');\n                    var name = String(n.getAttribute(\'aria-label\') || (labelNode && labelNode.textContent) || n.textContent || \'\').replace(/\\s+/g, \' \').trim();\n                    return available(n) && likedName.test(name);\n                });\n            }\n            var candidates = targets();\n            if (candidates.length !== 1) { log(method + (candidates.length ? \':menu-ambiguous\' : \':menu-target\')); closeMenu(r); after(candidates.length ? \'menu-ambiguous\' : \'menu-absent\', \'unknown\'); return; }\n            var target = candidates[0], raw = target.getAttribute(\'aria-checked\');\n            var checked = target.tagName === \'INPUT\' && target.type === \'checkbox\' ? (target.checked ? \'true\' : \'false\') : null;\n            if (checked !== null && raw !== null && raw !== checked) raw = \'unknown\';\n            else if (raw === null) raw = checked;\n            if (target.matches(\':disabled\') || target.closest(\'[aria-disabled=\"true\"], fieldset:disabled\') || (raw !== \'true\' && raw !== \'false\')) {\n                log(method + \':menu-state\'); closeMenu(r); after(\'menu-state\', \'unknown\'); return;\n            }\n            if (raw === \'true\') { log(method + \':menu-liked\'); closeMenu(r); after(\'read\', \'true\'); return; }\n            if (!identityMatches()) { closeMenu(r); after(\'identity\', \'unknown\'); return; }\n            invalidateLikedRead();\n            try { target.click(); log(method + \':menu-add\'); }\n            catch (_) { log(method + \':menu-add-error\'); closeMenu(r); after(\'unconfirmed\', \'unknown\'); return; }\n            wait(function() {\n                if (!identityMatches()) return \'identity-changed\';\n                var current = targets();\n                if (current.length !== 1 || current[0].matches(\':disabled\') || current[0].closest(\'[aria-disabled=\"true\"], fieldset:disabled\')) return null;\n                // React may replace the checkbox after the click; only the\n                // unique explicit Liked Songs item in the same menu is read.\n                var observed = current[0];\n                var a = observed.getAttribute(\'aria-checked\');\n                var c = observed.tagName === \'INPUT\' && observed.type === \'checkbox\' ? observed.checked : null;\n                return (a === \'true\' && c !== false) || (a === null && c === true) ? \'true\' : null;\n            }, 2200, function(state) {\n                closeMenu(r);\n                if (state === \'identity-changed\') { log(method + \':menu-identity\'); after(\'identity\', \'unknown\'); }\n                else if (state === \'true\') { log(method + \':menu-verified\'); after(\'confirmed\', \'true\'); }\n                else { log(method + \':menu-unverified\'); after(\'unconfirmed\', \'false\'); }\n            });\n        });\n        return true;\n    }\n    // Decide and click on a readable control; verify the change afterwards.\n    function act(found, method, after) {\n        var b = found.node;\n        if (kind === \'like\' && viaLikeMenu(b, method, after)) return;\n        var before = read(b);\n        log(method + \':state-\' + before);\n        if (before === \'unknown\') { after(\'state\', before); return; }\n        if (kind === \'like\') {\n            if (!identityMatches()) { log(method + \':identity\'); after(\'identity\', before); return; }\n            // A tap can only ADD a like: an existing like is never clicked,\n            // whatever the native button shows. Only a verified \'false\' is clicked.\n            if (before !== \'false\') { log(method + \':liked-read-only\'); after(\'read\', before); return; }\n            if (shownState === \'true\') { log(method + \':mismatch\'); after(\'read\', before); return; }\n        }\n        if (kind === \'like\') invalidateLikedRead();\n        try { b.click(); log(method + \':click\'); } catch (_) { log(method + \':click-error\'); after(\'command\', before); return; }\n        wait(function() {\n            if (kind === \'like\' && !identityMatches()) return \'identity-changed\';\n            var again = find();\n            if (!again.node) return null;\n            var s = read(again.node);\n            return s !== before && s !== \'unknown\' ? s : null;\n        }, 2200, function(s) {\n            if (s === \'identity-changed\') { log(method + \':identity\'); after(\'identity\', \'unknown\'); }\n            else if (s) { log(method + \':verified\'); after(\'confirmed\', s); }\n            else { log(method + \':unverified\'); after(\'unconfirmed\', before); }\n        });\n    }\n    function viaKeyboard() {\n        if (kind === \'like\') { log(\'c:like-skipped\'); finish(\'failed\', \'unknown\', \'\'); return; }\n        var spec = kind === \'shuffle\' ? {key: \'s\', code: \'KeyS\', keyCode: 83} : {key: \'r\', code: \'KeyR\', keyCode: 82};\n        // Unverifiable when no control is readable, so only ONE combination per\n        // tap (two could cancel each other). Families alternate across taps.\n        var turns = W.__melodixKeyTurns = W.__melodixKeyTurns || {};\n        var ctrl = !(turns[kind] % 2); turns[kind] = (turns[kind] || 0) + 1;\n        try {\n            var target = document.activeElement && document.activeElement !== document.body ? document.activeElement : document.body;\n            [\'keydown\', \'keyup\'].forEach(function(type) {\n                target.dispatchEvent(new KeyboardEvent(type, {key: spec.key, code: spec.code, keyCode: spec.keyCode, which: spec.keyCode, ctrlKey: ctrl, altKey: !ctrl, bubbles: true, cancelable: true}));\n            });\n            log(\'c:\' + (ctrl ? \'ctrl-\' : \'alt-\') + spec.key); log(\'c:single-unreadable\');\n            finish(\'unverified\', \'unknown\', \'keyboard\');\n        } catch (_) { log(\'c:error\'); finish(\'failed\', \'unknown\', \'\'); }\n    }\n    function result(outcome, state, method) {\n        if (outcome === \'confirmed\' || outcome === \'unconfirmed\' || outcome === \'read\') finish(outcome, state, method);\n        else if (outcome === \'identity\' || outcome === \'menu-absent\' || outcome === \'menu-ambiguous\' || outcome === \'menu-state\') finish(outcome, \'unknown\', method);\n        else finish(\'failed\', state, method);\n    }\n    try {\n        var direct = find();\n        log(\'a:\' + (direct.node ? \'found\' : direct.reason));\n        if (direct.node && !direct.reason) { act(direct, \'a\', function(o, s) { result(o, s, \'direct\'); }); return JSON.stringify({status: \'started\'}); }\n        if (direct.reason === \'disabled\') { finish(\'disabled\', \'unknown\', \'direct\'); return JSON.stringify({status: \'started\'}); }\n        var view = opener();\n        if (!view) { log(\'b:no-opener\'); viaKeyboard(); return JSON.stringify({status: \'started\'}); }\n        var wasOpen = pressed(view);\n        if (!wasOpen) { try { view.click(); log(\'b:opened\'); } catch (_) { log(\'b:open-error\'); } }\n        else log(\'b:already-open\');\n        var closeView = function() {\n            if (!wasOpen) {\n                setTimeout(function() {\n                    var again = opener();\n                    try { if (again && pressed(again)) { again.click(); log(\'b:closed\'); } } catch (_) { log(\'b:close-error\'); }\n                }, 150);\n            }\n        };\n        wait(function() { var f = find(); return f.node && !f.reason ? f : null; }, 1800, function(found) {\n            if (!found) { log(\'b:absent\'); closeView(); viaKeyboard(); return; }\n            log(\'b:found\');\n            act(found, \'b\', function(o, s) { closeView(); result(o, s, \'now-playing-view\'); });\n        });\n        return JSON.stringify({status: \'started\'});\n    } catch (_) {\n        finish(\'failed\', \'unknown\', \'\');\n        return JSON.stringify({status: \'started\'});\n    }\n})\n)("

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    invoke-static {v1}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p1}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p2}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v2, "like"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->pendingTitle:Ljava/lang/String;

    :goto_0
    invoke-static {v0}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerMode;->pendingTrack:Ljava/lang/String;

    invoke-static {v1}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ");"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->nativeTitle()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private likeMissing()Z
    .locals 2

    .prologue
    .line 152
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

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private nativeTitle()Ljava/lang/String;
    .locals 2

    .prologue
    .line 142
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->activity()Landroid/app/Activity;

    move-result-object v0

    if-nez v0, :cond_0

    const-string v0, ""

    .line 144
    :goto_0
    return-object v0

    .line 143
    :cond_0
    const v1, 0x7f09023b

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 144
    instance-of v1, v0, Landroid/widget/TextView;

    if-eqz v1, :cond_1

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_1
    const-string v0, ""

    goto :goto_0
.end method

.method private notConfirmed()V
    .locals 6

    .prologue
    const-wide/16 v4, 0x1

    const/4 v1, 0x0

    .line 67
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->diagnosticIndex()I

    move-result v0

    if-ltz v0, :cond_0

    sget-object v2, Lcom/melodix/music/PreviewPlayerMode;->outcome:[Ljava/lang/String;

    const-string v3, "non confirm\u00e9"

    aput-object v3, v2, v0

    .line 68
    :cond_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v2, "shuffle"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerMode;->observedPending:Z

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    const-string v2, "unknown"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    const/4 v0, 0x1

    .line 69
    :goto_0
    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    if-nez v0, :cond_1

    const-string v0, "unknown"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    :cond_1
    const-string v0, "confirmation"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerMode;->generation:J

    add-long/2addr v2, v4

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerMode;->generation:J

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerMode;->querySerial:J

    add-long/2addr v2, v4

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerMode;->querySerial:J

    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerMode;->queryInFlight:Z

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->paint()V

    .line 70
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerMode;->running:Z

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->isShown()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v3, "shuffle"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    const-string v0, "Al\u00e9atoire indisponible, R\u00e9essayer"

    :goto_1
    invoke-static {v2, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 71
    :cond_2
    return-void

    :cond_3
    move v0, v1

    .line 68
    goto :goto_0

    .line 70
    :cond_4
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v3, "like"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    const-string v0, "Impossible d\u2019ajouter aux titres lik\u00e9s, R\u00e9essayer"

    goto :goto_1

    :cond_5
    const-string v0, "Action non confirm\u00e9e. R\u00e9essayer"

    goto :goto_1
.end method

.method private observe()V
    .locals 9

    .prologue
    .line 107
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->web()Landroid/webkit/WebView;

    move-result-object v6

    if-nez v6, :cond_1

    const-string v0, "unknown"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    const-string v0, "web"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->paint()V

    .line 132
    :cond_0
    :goto_0
    return-void

    .line 108
    :cond_1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    .line 109
    iget-boolean v2, p0, Lcom/melodix/music/PreviewPlayerMode;->queryInFlight:Z

    if-eqz v2, :cond_2

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerMode;->queryStarted:J

    sub-long v2, v0, v2

    const-wide/16 v4, 0x960

    cmp-long v2, v2, v4

    if-ltz v2, :cond_0

    .line 110
    :cond_2
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/melodix/music/PreviewPlayerMode;->queryInFlight:Z

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode;->queryStarted:J

    .line 111
    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerMode;->generation:J

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode;->querySerial:J

    const-wide/16 v4, 0x1

    add-long/2addr v4, v0

    iput-wide v4, p0, Lcom/melodix/music/PreviewPlayerMode;->querySerial:J

    .line 112
    :try_start_0
    const-string v0, "query"

    const-string v1, ""

    const-string v7, ""

    const-string v8, ""

    invoke-direct {p0, v0, v1, v7, v8}, Lcom/melodix/music/PreviewPlayerMode;->call(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    new-instance v0, Lcom/melodix/music/PreviewPlayerMode$3;

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/melodix/music/PreviewPlayerMode$3;-><init>(Lcom/melodix/music/PreviewPlayerMode;JJ)V

    invoke-virtual {v6, v7, v0}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 131
    :catch_0
    move-exception v0

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerMode;->queryInFlight:Z

    const-string v0, "unknown"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    const-string v0, "web"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->paint()V

    goto :goto_0
.end method

.method private paint()V
    .locals 14

    .prologue
    const/high16 v7, 0x3f800000    # 1.0f

    const v8, 0x3eb33333    # 0.35f

    const v6, 0x3f266666    # 0.65f

    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 247
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    const-string v3, "unknown"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    move v0, v1

    .line 248
    :goto_0
    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    .line 249
    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v5, "shuffle"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    iget-boolean v4, p0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    if-eqz v4, :cond_0

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerMode;->pendingState:Ljava/lang/String;

    const-string v4, "false"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    const-string v3, "true"

    .line 250
    :cond_0
    :goto_1
    const-string v4, "true"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_6

    const-string v4, "mixed"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_6

    move v4, v1

    .line 252
    :goto_2
    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v9, "like"

    invoke-virtual {v5, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_a

    if-eqz v4, :cond_7

    const-string v5, "favon"

    :goto_3
    if-nez v0, :cond_8

    const-string v3, "Like indisponible"

    .line 255
    :goto_4
    iget-boolean v9, p0, Lcom/melodix/music/PreviewPlayerMode;->running:Z

    if-eqz v9, :cond_14

    if-nez v0, :cond_14

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v10

    iget-wide v12, p0, Lcom/melodix/music/PreviewPlayerMode;->visibleSince:J

    sub-long/2addr v10, v12

    const-wide/16 v12, 0x960

    cmp-long v9, v10, v12

    if-gez v9, :cond_14

    move v10, v2

    .line 256
    :goto_5
    if-eqz v10, :cond_15

    const v5, 0x108005f

    :goto_6
    if-eqz v5, :cond_1

    invoke-virtual {p0, v5}, Lcom/melodix/music/PreviewPlayerMode;->setImageResource(I)V

    .line 257
    :cond_1
    iget-boolean v5, p0, Lcom/melodix/music/PreviewPlayerMode;->running:Z

    if-eqz v5, :cond_16

    if-nez v0, :cond_16

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->tappable()Z

    move-result v5

    if-eqz v5, :cond_16

    if-nez v10, :cond_16

    move v9, v2

    .line 258
    :goto_7
    if-nez v0, :cond_17

    if-eqz v9, :cond_17

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->shuffleMissing()Z

    move-result v5

    if-eqz v5, :cond_17

    const-string v5, "Al\u00e9atoire : bouton absent de la page Spotify ; touchez pour envoyer le raccourci clavier (effet non v\u00e9rifiable)"

    .line 262
    :goto_8
    if-eqz v4, :cond_20

    const v3, -0x1fb762

    :goto_9
    invoke-virtual {p0, v3}, Lcom/melodix/music/PreviewPlayerMode;->setColorFilter(I)V

    iget-boolean v3, p0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    if-eqz v3, :cond_21

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, ", en attente"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    :goto_a
    invoke-virtual {p0, v3}, Lcom/melodix/music/PreviewPlayerMode;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 263
    if-nez v0, :cond_2

    if-nez v9, :cond_2

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v4, "like"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_22

    iget-boolean v3, p0, Lcom/melodix/music/PreviewPlayerMode;->running:Z

    if-eqz v3, :cond_22

    :cond_2
    iget-boolean v3, p0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    if-nez v3, :cond_22

    :goto_b
    invoke-virtual {p0, v2}, Lcom/melodix/music/PreviewPlayerMode;->setEnabled(Z)V

    if-eqz v9, :cond_24

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->shuffleMissing()Z

    move-result v0

    if-eqz v0, :cond_23

    const/high16 v0, 0x3f000000    # 0.5f

    :goto_c
    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerMode;->setAlpha(F)V

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->invalidate()V

    .line 264
    return-void

    :cond_3
    move v0, v2

    .line 247
    goto/16 :goto_0

    .line 249
    :cond_4
    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerMode;->pendingState:Ljava/lang/String;

    const-string v4, "true"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    const-string v3, "false"

    goto/16 :goto_1

    :cond_5
    const-string v3, "unknown"

    goto/16 :goto_1

    :cond_6
    move v4, v2

    .line 250
    goto/16 :goto_2

    .line 252
    :cond_7
    const-string v5, "favoff"

    goto/16 :goto_3

    :cond_8
    if-eqz v4, :cond_9

    const-string v3, "Titre aim\u00e9"

    goto/16 :goto_4

    :cond_9
    const-string v3, "Ajouter aux titres lik\u00e9s"

    goto/16 :goto_4

    .line 253
    :cond_a
    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v9, "shuffle"

    invoke-virtual {v5, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_e

    const-string v5, "mixed"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_b

    const-string v5, "smart_shuffle"

    :goto_d
    const-string v9, "unknown"

    invoke-virtual {v3, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_c

    const-string v3, "Al\u00e9atoire : \u00e9tat inconnu"

    goto/16 :goto_4

    :cond_b
    const-string v5, "shuffle"

    goto :goto_d

    :cond_c
    if-eqz v4, :cond_d

    const-string v3, "Lecture al\u00e9atoire activ\u00e9e"

    goto/16 :goto_4

    :cond_d
    const-string v3, "Lecture al\u00e9atoire d\u00e9sactiv\u00e9e"

    goto/16 :goto_4

    .line 254
    :cond_e
    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    const-string v5, "mixed"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_f

    const-string v5, "repone"

    :goto_e
    if-nez v0, :cond_11

    const-string v3, "R\u00e9p\u00e9tition indisponible"

    goto/16 :goto_4

    :cond_f
    if-eqz v4, :cond_10

    const-string v5, "repon"

    goto :goto_e

    :cond_10
    const-string v5, "repoff"

    goto :goto_e

    :cond_11
    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    const-string v9, "mixed"

    invoke-virtual {v3, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_12

    const-string v3, "R\u00e9p\u00e9ter le titre"

    goto/16 :goto_4

    :cond_12
    if-eqz v4, :cond_13

    const-string v3, "R\u00e9p\u00e9ter la liste"

    goto/16 :goto_4

    :cond_13
    const-string v3, "R\u00e9p\u00e9tition d\u00e9sactiv\u00e9e"

    goto/16 :goto_4

    :cond_14
    move v10, v1

    .line 255
    goto/16 :goto_5

    .line 256
    :cond_15
    invoke-direct {p0, v5}, Lcom/melodix/music/PreviewPlayerMode;->drawable(Ljava/lang/String;)I

    move-result v5

    goto/16 :goto_6

    :cond_16
    move v9, v1

    .line 257
    goto/16 :goto_7

    .line 259
    :cond_17
    if-nez v0, :cond_18

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->likeMissing()Z

    move-result v5

    if-eqz v5, :cond_18

    const-string v5, "Like indisponible : bouton absent de la page Spotify"

    goto/16 :goto_8

    .line 260
    :cond_18
    if-nez v0, :cond_1b

    if-eqz v9, :cond_1b

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v3, "\u00c9tat inconnu : touchez pour essayer ("

    invoke-direct {v5, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v11, "like"

    invoke-virtual {v3, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_19

    const-string v3, "Like"

    :goto_f
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, ")"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto/16 :goto_8

    :cond_19
    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v11, "shuffle"

    invoke-virtual {v3, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1a

    const-string v3, "Al\u00e9atoire"

    goto :goto_f

    :cond_1a
    const-string v3, "R\u00e9p\u00e9tition"

    goto :goto_f

    .line 261
    :cond_1b
    if-nez v0, :cond_2b

    new-instance v5, Ljava/lang/StringBuilder;

    if-eqz v10, :cond_1c

    const-string v3, "Chargement : "

    :goto_10
    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v5, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->reasonText()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, " ("

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v11, "like"

    invoke-virtual {v3, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1d

    const-string v3, "Like"

    :goto_11
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, ")"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v11, "shuffle"

    invoke-virtual {v3, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1f

    const-string v3, " ; n\u00e9cessite un contr\u00f4le et un \u00e9tat Spotify reconnus"

    :goto_12
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto/16 :goto_8

    :cond_1c
    const-string v3, "Indisponible : "

    goto :goto_10

    :cond_1d
    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v11, "shuffle"

    invoke-virtual {v3, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1e

    const-string v3, "Al\u00e9atoire"

    goto :goto_11

    :cond_1e
    const-string v3, "R\u00e9p\u00e9tition"

    goto :goto_11

    :cond_1f
    const-string v3, ""

    goto :goto_12

    .line 262
    :cond_20
    const v3, -0x363f16

    goto/16 :goto_9

    :cond_21
    move-object v3, v5

    goto/16 :goto_a

    :cond_22
    move v2, v1

    .line 263
    goto/16 :goto_b

    :cond_23
    const v0, 0x3f4ccccd    # 0.8f

    goto/16 :goto_c

    :cond_24
    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v2, "like"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_27

    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    if-eqz v1, :cond_25

    move v0, v6

    goto/16 :goto_c

    :cond_25
    if-eqz v0, :cond_26

    move v0, v7

    goto/16 :goto_c

    :cond_26
    move v0, v8

    goto/16 :goto_c

    :cond_27
    if-nez v0, :cond_29

    if-eqz v10, :cond_28

    move v0, v6

    goto/16 :goto_c

    :cond_28
    move v0, v8

    goto/16 :goto_c

    :cond_29
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    if-eqz v0, :cond_2a

    move v0, v6

    goto/16 :goto_c

    :cond_2a
    move v0, v7

    goto/16 :goto_c

    :cond_2b
    move-object v5, v3

    goto/16 :goto_8
.end method

.method private parse(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 98
    :try_start_0
    new-instance v0, Lorg/json/JSONTokener;

    invoke-direct {v0, p1}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lorg/json/JSONTokener;->nextValue()Ljava/lang/Object;

    move-result-object v0

    instance-of v1, v0, Ljava/lang/String;

    if-eqz v1, :cond_0

    new-instance v1, Lorg/json/JSONObject;

    check-cast v0, Ljava/lang/String;

    invoke-direct {v1, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v1

    .line 99
    :goto_0
    return-object v0

    :cond_0
    move-object v0, v2

    .line 98
    goto :goto_0

    .line 99
    :catch_0
    move-exception v0

    move-object v0, v2

    goto :goto_0
.end method

.method private poll(JI)V
    .locals 5

    .prologue
    .line 191
    const/16 v0, 0x1a

    if-le p3, v0, :cond_1

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode;->generation:J

    cmp-long v0, p1, v0

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->notConfirmed()V

    .line 203
    :cond_0
    :goto_0
    return-void

    .line 192
    :cond_1
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->handler:Landroid/os/Handler;

    new-instance v1, Lcom/melodix/music/PreviewPlayerMode$7;

    invoke-direct {v1, p0, p1, p2, p3}, Lcom/melodix/music/PreviewPlayerMode$7;-><init>(Lcom/melodix/music/PreviewPlayerMode;JI)V

    .line 202
    const-wide/16 v2, 0xfa

    .line 192
    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0
.end method

.method private reasonText()Ljava/lang/String;
    .locals 2

    .prologue
    .line 228
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "page"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "page Spotify en cours de chargement"

    .line 244
    :goto_0
    return-object v0

    .line 229
    :cond_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "bar"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "barre du lecteur Spotify absente ; lancer un titre"

    goto :goto_0

    .line 230
    :cond_1
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "control"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, "contr\u00f4le Spotify non reconnu ou absent"

    goto :goto_0

    .line 231
    :cond_2
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "absent"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    const-string v0, "bouton Like absent de la page Spotify"

    goto :goto_0

    .line 232
    :cond_3
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "ambiguous"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    const-string v0, "plusieurs contr\u00f4les possibles"

    goto :goto_0

    .line 233
    :cond_4
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "restriction"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    const-string v0, "L\u2019al\u00e9atoire n\u2019est pas disponible avec ce compte ou cette lecture"

    goto :goto_0

    .line 234
    :cond_5
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "disabled"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    const-string v0, "contr\u00f4le Spotify d\u00e9sactiv\u00e9"

    goto :goto_0

    .line 235
    :cond_6
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "menu"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    const-string v0, "menu de biblioth\u00e8que non v\u00e9rifi\u00e9"

    goto :goto_0

    .line 236
    :cond_7
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "conflict"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    const-string v0, "\u00e9tat et action du contr\u00f4le contradictoires"

    goto :goto_0

    .line 237
    :cond_8
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "unverified"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    const-string v0, "action d\u2019ajout non v\u00e9rifi\u00e9e"

    goto :goto_0

    .line 238
    :cond_9
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "identity"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a

    const-string v0, "titre ou identit\u00e9 non confirm\u00e9"

    goto/16 :goto_0

    .line 239
    :cond_a
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "remembered"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    const-string v0, "dernier \u00e9tat lu"

    goto/16 :goto_0

    .line 240
    :cond_b
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "unverified"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c

    const-string v0, "commande envoy\u00e9e, \u00e9tat non v\u00e9rifiable"

    goto/16 :goto_0

    .line 241
    :cond_c
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "command"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d

    const-string v0, "commande indisponible"

    goto/16 :goto_0

    .line 242
    :cond_d
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "confirmation"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_e

    const-string v0, "action non confirm\u00e9e"

    goto/16 :goto_0

    .line 243
    :cond_e
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "web"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_f

    const-string v0, "page Spotify ou r\u00e9ponse non accessible"

    goto/16 :goto_0

    .line 244
    :cond_f
    const-string v0, "\u00e9tat ou langue non reconnu"

    goto/16 :goto_0
.end method

.method private remember(Lorg/json/JSONObject;)V
    .locals 10

    .prologue
    const/4 v0, 0x0

    .line 36
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->diagnosticIndex()I

    move-result v1

    if-gez v1, :cond_1

    .line 54
    :cond_0
    :goto_0
    return-void

    .line 38
    :cond_1
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    const-string v3, "diagnostic"

    const-string v4, "{}"

    invoke-virtual {p1, v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 39
    new-instance v3, Lorg/json/JSONObject;

    const-string v4, "structure"

    const-string v5, "{}"

    invoke-virtual {v2, v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 40
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v5, 0x32

    new-array v5, v5, [Ljava/lang/String;

    const/4 v6, 0x0

    const-string v7, "bar"

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const-string v7, "view"

    aput-object v7, v5, v6

    const/4 v6, 0x2

    const-string v7, "nodes"

    aput-object v7, v5, v6

    const/4 v6, 0x3

    const-string v7, "playpause"

    aput-object v7, v5, v6

    const/4 v6, 0x4

    const-string v7, "repeat"

    aput-object v7, v5, v6

    const/4 v6, 0x5

    const-string v7, "shuffle"

    aput-object v7, v5, v6

    const/4 v6, 0x6

    const-string v7, "like"

    aput-object v7, v5, v6

    const/4 v6, 0x7

    const-string v7, "queue"

    aput-object v7, v5, v6

    const/16 v6, 0x8

    const-string v7, "volume"

    aput-object v7, v5, v6

    const/16 v6, 0x9

    const-string v7, "lyrics"

    aput-object v7, v5, v6

    const/16 v6, 0xa

    const-string v7, "connect"

    aput-object v7, v5, v6

    const/16 v6, 0xb

    const-string v7, "other"

    aput-object v7, v5, v6

    const/16 v6, 0xc

    const-string v7, "button"

    aput-object v7, v5, v6

    const/16 v6, 0xd

    const-string v7, "switch"

    aput-object v7, v5, v6

    const/16 v6, 0xe

    const-string v7, "slider"

    aput-object v7, v5, v6

    const/16 v6, 0xf

    const-string v7, "aria_shuffle"

    aput-object v7, v5, v6

    const/16 v6, 0x10

    const-string v7, "aria_like"

    aput-object v7, v5, v6

    const/16 v6, 0x11

    const-string v7, "aria_play"

    aput-object v7, v5, v6

    const/16 v6, 0x12

    const-string v7, "aria_pause"

    aput-object v7, v5, v6

    const/16 v6, 0x13

    const-string v7, "aria_other"

    aput-object v7, v5, v6

    const/16 v6, 0x14

    const-string v7, "track_links"

    aput-object v7, v5, v6

    const/16 v6, 0x15

    const-string v7, "track_named"

    aput-object v7, v5, v6

    const/16 v6, 0x16

    const-string v7, "track_generic"

    aput-object v7, v5, v6

    const/16 v6, 0x17

    const-string v7, "track_attr"

    aput-object v7, v5, v6

    const/16 v6, 0x18

    const-string v7, "npv_opener"

    aput-object v7, v5, v6

    const/16 v6, 0x19

    const-string v7, "outside_like_id"

    aput-object v7, v5, v6

    const/16 v6, 0x1a

    const-string v7, "outside_like_label"

    aput-object v7, v5, v6

    const/16 v6, 0x1b

    const-string v7, "outside_track_links"

    aput-object v7, v5, v6

    const/16 v6, 0x1c

    const-string v7, "href_album"

    aput-object v7, v5, v6

    const/16 v6, 0x1d

    const-string v7, "href_album_hl"

    aput-object v7, v5, v6

    const/16 v6, 0x1e

    const-string v7, "href_hl_ambiguous"

    aput-object v7, v5, v6

    const/16 v6, 0x1f

    const-string v7, "href_artist"

    aput-object v7, v5, v6

    const/16 v6, 0x20

    const-string v7, "href_uri"

    aput-object v7, v5, v6

    const/16 v6, 0x21

    const-string v7, "href_other"

    aput-object v7, v5, v6

    const/16 v6, 0x22

    const-string v7, "chk_buttons"

    aput-object v7, v5, v6

    const/16 v6, 0x23

    const-string v7, "chk_likeword"

    aput-object v7, v5, v6

    const/16 v6, 0x24

    const-string v7, "chk_verb_add"

    aput-object v7, v5, v6

    const/16 v6, 0x25

    const-string v7, "chk_verb_on"

    aput-object v7, v5, v6

    const/16 v6, 0x26

    const-string v7, "chk_long"

    aput-object v7, v5, v6

    const/16 v6, 0x27

    const-string v7, "chk_favori"

    aput-object v7, v5, v6

    const/16 v6, 0x28

    const-string v7, "chk_library"

    aput-object v7, v5, v6

    const/16 v6, 0x29

    const-string v7, "chk_liked"

    aput-object v7, v5, v6

    const/16 v6, 0x2a

    const-string v7, "chk_add_false"

    aput-object v7, v5, v6

    const/16 v6, 0x2b

    const-string v7, "chk_add_true"

    aput-object v7, v5, v6

    const/16 v6, 0x2c

    const-string v7, "chk_popup"

    aput-object v7, v5, v6

    const/16 v6, 0x2d

    const-string v7, "api_player"

    aput-object v7, v5, v6

    const/16 v6, 0x2e

    const-string v7, "api_state"

    aput-object v7, v5, v6

    const/16 v6, 0x2f

    const-string v7, "api_library"

    aput-object v7, v5, v6

    const/16 v6, 0x30

    const-string v7, "api_contains"

    aput-object v7, v5, v6

    const/16 v6, 0x31

    const-string v7, "api_add"

    aput-object v7, v5, v6

    .line 41
    array-length v6, v5

    :goto_1
    if-lt v0, v6, :cond_3

    .line 42
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/melodix/music/PreviewPlayerMode;->structure:Ljava/lang/String;

    .line 43
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v3, "\u00e9tat="

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, "state"

    const-string v4, "unknown"

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "true|false|mixed|unknown"

    invoke-static {v3, v4}, Lcom/melodix/music/PreviewPlayerMode;->allowed(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 44
    const-string v3, ", motif="

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, "reason"

    const-string v4, "unknown"

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "control|page|absent|ambiguous|disabled|restriction|state|conflict|unverified|observed|unknown"

    invoke-static {v3, v4}, Lcom/melodix/music/PreviewPlayerMode;->allowed(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 45
    const-string v3, ", commande="

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, "command"

    const-string v4, "unknown"

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "menu|unspecified|toggle|unknown"

    invoke-static {v3, v4}, Lcom/melodix/music/PreviewPlayerMode;->allowed(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 46
    const-string v3, ", libell\u00e9="

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, "label"

    const-string v4, "unknown"

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "on-action|off-action|unrecognized|absent|unknown"

    invoke-static {v2, v3}, Lcom/melodix/music/PreviewPlayerMode;->allowed(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 43
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 47
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v3, "like"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 48
    const-string v2, "track"

    const-string v3, ""

    invoke-virtual {p1, v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "title"

    const-string v4, ""

    invoke-virtual {p1, v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 49
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v0, ", piste_page="

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_5

    const-string v0, "absente"

    :goto_2
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 50
    const-string v2, ", titre_page="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_6

    const-string v0, "absent"

    :goto_3
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 49
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 52
    :cond_2
    sget-object v2, Lcom/melodix/music/PreviewPlayerMode;->last:[Ljava/lang/String;

    aput-object v0, v2, v1

    iget-boolean v2, p0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    if-eqz v2, :cond_0

    sget-object v2, Lcom/melodix/music/PreviewPlayerMode;->after:[Ljava/lang/String;

    aput-object v0, v2, v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 53
    :catch_0
    move-exception v0

    sget-object v0, Lcom/melodix/music/PreviewPlayerMode;->last:[Ljava/lang/String;

    const-string v2, "observation indisponible"

    aput-object v2, v0, v1

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    if-eqz v0, :cond_0

    sget-object v0, Lcom/melodix/music/PreviewPlayerMode;->after:[Ljava/lang/String;

    sget-object v2, Lcom/melodix/music/PreviewPlayerMode;->last:[Ljava/lang/String;

    aget-object v2, v2, v1

    aput-object v2, v0, v1

    goto/16 :goto_0

    .line 41
    :cond_3
    :try_start_1
    aget-object v7, v5, v0

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v8

    if-lez v8, :cond_4

    const-string v8, ", "

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_4
    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-static {v3, v7}, Lcom/melodix/music/PreviewPlayerMode;->count(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_1

    .line 49
    :cond_5
    const-string v0, "pr\u00e9sente"

    goto :goto_2

    .line 50
    :cond_6
    invoke-direct {p0, v3}, Lcom/melodix/music/PreviewPlayerMode;->sameNativeTitle(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_7

    const-string v0, "coh\u00e9rent"

    goto :goto_3

    :cond_7
    const-string v0, "diff\u00e9rent"
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_3
.end method

.method private sameNativeTitle(Ljava/lang/String;)Z
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 102
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->activity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_0

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_1

    :cond_0
    move v0, v1

    .line 104
    :goto_0
    return v0

    .line 103
    :cond_1
    const v2, 0x7f09023b

    invoke-virtual {v0, v2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 104
    instance-of v2, v0, Landroid/widget/TextView;

    if-eqz v2, :cond_2

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v0, 0x1

    goto :goto_0

    :cond_2
    move v0, v1

    goto :goto_0
.end method

.method private shake()V
    .locals 4

    .prologue
    .line 134
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-lt v0, v1, :cond_0

    invoke-static {}, Landroid/animation/ValueAnimator;->areAnimatorsEnabled()Z

    move-result v0

    if-nez v0, :cond_0

    .line 140
    :goto_0
    return-void

    .line 135
    :cond_0
    const/high16 v0, 0x40800000    # 4.0f

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr v0, v1

    .line 136
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 137
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/ViewPropertyAnimator;->translationX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const-wide/16 v2, 0x46

    invoke-virtual {v0, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    new-instance v1, Lcom/melodix/music/PreviewPlayerMode$4;

    invoke-direct {v1, p0}, Lcom/melodix/music/PreviewPlayerMode$4;-><init>(Lcom/melodix/music/PreviewPlayerMode;)V

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    .line 139
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    goto :goto_0
.end method

.method private shuffleMissing()Z
    .locals 2

    .prologue
    .line 155
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

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private sync()V
    .locals 6

    .prologue
    const-wide/16 v4, 0x1

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 266
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->isAttachedToWindow()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->isShown()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->getWindowVisibility()I

    move-result v0

    if-nez v0, :cond_1

    move v0, v1

    .line 267
    :goto_0
    if-eqz v0, :cond_2

    iget-boolean v3, p0, Lcom/melodix/music/PreviewPlayerMode;->running:Z

    if-nez v3, :cond_2

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

    .line 269
    :cond_0
    :goto_1
    return-void

    :cond_1
    move v0, v2

    .line 266
    goto :goto_0

    .line 268
    :cond_2
    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerMode;->running:Z

    if-eqz v0, :cond_0

    iput-boolean v2, p0, Lcom/melodix/music/PreviewPlayerMode;->running:Z

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerMode;->tick:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode;->generation:J

    add-long/2addr v0, v4

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode;->generation:J

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode;->querySerial:J

    add-long/2addr v0, v4

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode;->querySerial:J

    iput-boolean v2, p0, Lcom/melodix/music/PreviewPlayerMode;->queryInFlight:Z

    iput-boolean v2, p0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    const-string v0, "unknown"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->paint()V

    goto :goto_1
.end method

.method private tappable()Z
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 158
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->likeMissing()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 159
    :cond_0
    :goto_0
    return v0

    :cond_1
    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v2, "control"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v2, "absent"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v2, "ambiguous"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v2, "state"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v2, "confirmation"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 160
    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v2, "unverified"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v2, "identity"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v2, "remembered"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v2, "observed"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v2, "conflict"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v2, "menu"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 159
    :cond_2
    const/4 v0, 0x1

    goto :goto_0
.end method

.method private web()Landroid/webkit/WebView;
    .locals 4

    .prologue
    const/4 v1, 0x0

    .line 90
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->activity()Landroid/app/Activity;

    move-result-object v0

    if-nez v0, :cond_0

    .line 92
    :goto_0
    return-object v1

    .line 91
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

    :goto_1
    move-object v1, v0

    goto :goto_0

    :cond_1
    move-object v0, v1

    goto :goto_1

    .line 92
    :catch_0
    move-exception v0

    goto :goto_0
.end method


# virtual methods
.method protected onAttachedToWindow()V
    .locals 1

    .prologue
    .line 270
    invoke-super {p0}, Landroid/widget/ImageButton;->onAttachedToWindow()V

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->getTag()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    const-string v0, ""

    :goto_0
    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->paint()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->sync()V

    return-void

    :cond_0
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method protected onDetachedFromWindow()V
    .locals 6

    .prologue
    const-wide/16 v4, 0x1

    const/4 v2, 0x0

    .line 271
    iput-boolean v2, p0, Lcom/melodix/music/PreviewPlayerMode;->running:Z

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerMode;->tick:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode;->generation:J

    add-long/2addr v0, v4

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode;->generation:J

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode;->querySerial:J

    add-long/2addr v0, v4

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode;->querySerial:J

    iput-boolean v2, p0, Lcom/melodix/music/PreviewPlayerMode;->queryInFlight:Z

    iput-boolean v2, p0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    const-string v0, "unknown"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->paint()V

    invoke-super {p0}, Landroid/widget/ImageButton;->onDetachedFromWindow()V

    return-void
.end method

.method protected onVisibilityChanged(Landroid/view/View;I)V
    .locals 1

    .prologue
    .line 272
    invoke-super {p0, p1, p2}, Landroid/widget/ImageButton;->onVisibilityChanged(Landroid/view/View;I)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->handler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    new-instance v0, Lcom/melodix/music/PreviewPlayerMode$8;

    invoke-direct {v0, p0}, Lcom/melodix/music/PreviewPlayerMode$8;-><init>(Lcom/melodix/music/PreviewPlayerMode;)V

    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerMode;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method

.method protected onWindowVisibilityChanged(I)V
    .locals 1

    .prologue
    .line 273
    invoke-super {p0, p1}, Landroid/widget/ImageButton;->onWindowVisibilityChanged(I)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->handler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    new-instance v0, Lcom/melodix/music/PreviewPlayerMode$9;

    invoke-direct {v0, p0}, Lcom/melodix/music/PreviewPlayerMode$9;-><init>(Lcom/melodix/music/PreviewPlayerMode;)V

    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerMode;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method
