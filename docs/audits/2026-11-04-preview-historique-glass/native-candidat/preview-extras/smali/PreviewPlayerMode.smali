.class public final Lcom/melodix/music/PreviewPlayerMode;
.super Landroid/widget/ImageButton;
.source "PreviewPlayerMode.java"


# static fields
.field private static final CONFIRM_MS:J = 0x1b58L

.field private static final DIAGNOSTIC:Ljava/lang/String; = "(function(kind) {\n    \'use strict\';\n    // Passive, bounded, allowlisted observations only. No account, track or\n    // arbitrary page text is returned. This probe does not click or send data.\n    var specs={\n        repeat:{selector:\'button[data-testid=\"control-button-repeat\"], [role=\"button\"][data-testid=\"control-button-repeat\"], button[aria-label], [role=\"button\"][aria-label]\', ids:/^control-button-repeat$/i,\n            off:/^(enable repeat|turn repeat on|activer la r\u00e9p\u00e9tition|wiederholung aktivieren|activar repetici\u00f3n|ativar repeti\u00e7\u00e3o)$/i,\n            on:/^(disable repeat|turn repeat off|d\u00e9sactiver la r\u00e9p\u00e9tition|wiederholung deaktivieren|desactivar repetici\u00f3n|desativar repeti\u00e7\u00e3o)$/i},\n        shuffle:{selector:\'button[data-testid*=\"shuffle\" i], button[aria-label], [role=\"button\"][aria-label], [role=\"switch\"][aria-label]\', ids:/shuffle/i,\n            off:/^(enable shuffle|turn shuffle on|activate shuffle|activer (la lecture |le mode |l[\'\u2019])?al\u00e9atoire|zufallswiedergabe aktivieren|activar (el modo |la reproducci\u00f3n )?aleatori[oa]|ativar (a reprodu\u00e7\u00e3o )?aleat\u00f3ria)$/i,\n            on:/^(disable shuffle|turn shuffle off|deactivate shuffle|d\u00e9sactiver (la lecture |le mode |l[\'\u2019])?al\u00e9atoire|zufallswiedergabe deaktivieren|desactivar (el modo |la reproducci\u00f3n )?aleatori[oa]|desativar (a reprodu\u00e7\u00e3o )?aleat\u00f3ria)$/i},\n        like:{selector:\'[data-testid=\"now-playing-widget\"] button, [data-testid=\"now-playing-bar\"] button, [data-testid=\"now-playing-view\"] button, [data-testid=\"now-playing-panel\"] button, [data-testid=\"now-playing-view\"] [role=\"button\"], [data-testid=\"now-playing-bar\"] [role=\"button\"]\', ids:/^(add-button|remove-button|add-to-library-button|remove-from-library-button)$/i,\n            off:/^(save to your library|add to (your )?(liked songs|library)|ajouter (\u00e0|aux) (la biblioth\u00e8que|titres lik\u00e9s)|enregistrer dans (votre |la )?biblioth\u00e8que|in (deine |der )?bibliothek (aufnehmen|hinzuf\u00fcgen)|a\u00f1adir a (tu )?biblioteca|adicionar (\u00e0 biblioteca|aos t\u00edtulos curtidos))$/i,\n            on:/^(remove from (your )?(library|liked songs)|retirer (de la biblioth\u00e8que|des titres lik\u00e9s)|supprimer de (votre |la )?biblioth\u00e8que|aus (deiner |der )?bibliothek entfernen|quitar de (tu )?biblioteca|remover (da biblioteca|dos t\u00edtulos curtidos))$/i}\n    };\n    // Aggregate structure only: fixed testid/role and label categories, never\n    // arbitrary labels or identifiers that could contain a track or account.\n    function structure() {\n        var roots=Array.from(document.querySelectorAll(\'[data-testid=\"now-playing-bar\"], [data-testid=\"now-playing-widget\"], [data-testid=\"player-controls\"], [data-testid=\"now-playing-view\"], [data-testid=\"now-playing-panel\"]\'));\n        var nodes=[];roots.forEach(function(root){Array.from(root.querySelectorAll(\'button,[role=\"button\"],[role=\"switch\"],[role=\"slider\"],input[type=\"range\"]\')).forEach(function(n){if(nodes.indexOf(n)<0)nodes.push(n);});});\n        var st={bar:0,view:0,nodes:Math.min(nodes.length,99),playpause:0,repeat:0,shuffle:0,like:0,queue:0,volume:0,lyrics:0,connect:0,other:0,button:0,switch:0,slider:0,aria_shuffle:0,aria_like:0,aria_play:0,aria_pause:0,aria_other:0};\n        roots.forEach(function(r){if(/^(now-playing-view|now-playing-panel)$/.test(r.getAttribute(\'data-testid\')))st.view++;else st.bar++;});\n        nodes.forEach(function(n){\n            var id=String(n.getAttribute(\'data-testid\')||\'\').toLowerCase(), label=String(n.getAttribute(\'aria-label\')||\'\').trim(), role=String(n.getAttribute(\'role\')||\'\').toLowerCase();\n            var k=/^control-button-playpause$/.test(id)?\'playpause\':/repeat/.test(id)?\'repeat\':/shuffle/.test(id)?\'shuffle\':/^(add-button|remove-button|add-to-library-button|remove-from-library-button)$/.test(id)?\'like\':/^(queue-button|control-button-queue)$/.test(id)?\'queue\':/^(volume-bar|volume-slider)$/.test(id)?\'volume\':/^(lyrics-button|control-button-lyrics)$/.test(id)?\'lyrics\':/^(connect-button|control-button-connect|connect-device-picker|device-picker)$/.test(id)?\'connect\':\'other\';\n            st[k]=Math.min(st[k]+1,99);if(role===\'switch\')st.switch++;else if(role===\'slider\'||n.tagName===\'INPUT\')st.slider++;else st.button++;\n            if(specs.shuffle.off.test(label)||specs.shuffle.on.test(label))st.aria_shuffle++;else if(specs.like.off.test(label)||specs.like.on.test(label))st.aria_like++;else if(/^(play|resume|lire|reprendre)$/i.test(label))st.aria_play++;else if(/^(pause|mettre en pause)$/i.test(label))st.aria_pause++;else if(label)st.aria_other++;\n        });\n        Object.keys(st).forEach(function(k){st[k]=Math.min(st[k],99);});return JSON.stringify(st);\n    }\n    var spec=specs[kind], out={kind:kind===\'shuffle\'?\'shuffle\':kind===\'like\'?\'like\':kind===\'repeat\'?\'repeat\':\'unknown\',reason:\'control\',count:0,state:\'unknown\',label:\'unknown\',command:\'unknown\',disabled:false,smart:false,structure:structure()};\n    if(!spec)return JSON.stringify(out);\n    var nodes=Array.from(document.querySelectorAll(spec.selector)).filter(function(b){\n        return b.isConnected && (spec.ids.test(String(b.getAttribute(\'data-testid\')||\'\')) || spec.off.test(String(b.getAttribute(\'aria-label\')||\'\').trim()) || spec.on.test(String(b.getAttribute(\'aria-label\')||\'\').trim()));\n    });\n    out.count=Math.min(nodes.length,2);\n    if(nodes.length!==1){out.reason=nodes.length?\'ambiguous\':document.readyState===\'loading\'?\'page\':\'absent\';return JSON.stringify(out);}\n    var b=nodes[0], label=String(b.getAttribute(\'aria-label\')||\'\').trim();\n    out.label=spec.on.test(label)?\'on-action\':spec.off.test(label)?\'off-action\':label?\'unrecognized\':\'absent\';\n    out.disabled=!!b.disabled || b.getAttribute(\'aria-disabled\')===\'true\';\n    var raw=b.getAttribute(\'aria-checked\');if(raw===null)raw=b.getAttribute(\'aria-pressed\');\n    out.state=raw===\'true\'||raw===\'false\'||(kind!==\'like\'&&raw===\'mixed\')?raw:raw===null?(out.label===\'on-action\'?\'true\':out.label===\'off-action\'?\'false\':\'unknown\'):\'unknown\';\n    out.smart=kind===\'shuffle\' && out.state===\'mixed\';\n    var id=String(b.getAttribute(\'data-testid\')||\'\').toLowerCase();\n    var conflict=kind===\'like\' && ((out.state===\'false\' && (out.label===\'on-action\'||/^(remove-button|remove-from-library-button)$/.test(id))) || (out.state===\'true\' && out.label===\'off-action\'));\n    var unverified=kind===\'like\' && out.state===\'false\' && out.label!==\'off-action\' && id!==\'add-to-library-button\';\n    var popup=String(b.getAttribute(\'aria-haspopup\')||\'\').toLowerCase();\n    if(kind===\'like\')out.command=popup===\'true\'||popup===\'menu\'||popup===\'dialog\'?\'menu\':\'unspecified\';\n    else out.command=\'toggle\';\n    var description=String(b.getAttribute(\'aria-description\')||\'\').trim();\n    var restricted=kind===\'shuffle\' && out.disabled && /^(shuffle is not available (with|for) (this account|this playback)|l[\'\u2019]al\u00e9atoire n[\'\u2019]est pas disponible avec (ce compte|cette lecture))$/i.test(description);\n    out.reason=restricted?\'restriction\':out.disabled?\'disabled\':conflict?\'conflict\':unverified?\'unverified\':out.state===\'unknown\'?\'state\':\'observed\';\n    return JSON.stringify(out);\n})\n"

.field private static final JOB:Ljava/lang/String; = "(function(kind, action, shownState, expectedTitle) {\n    \'use strict\';\n    // One explicit tap = one job. Methods in order, state re-read after each:\n    // (a) control already in the page, (b) briefly open the now-playing view in\n    // the hidden page and close it again, (c) web-player keyboard shortcut\n    // (shuffle/repeat only: a like is never sent without a verified state).\n    // Never reads storage, cookies or tokens; never navigates; no network.\n    var W = window;\n    var jobs = W.__melodixModeJobs = W.__melodixModeJobs || {};\n    if ([\'like\', \'shuffle\', \'repeat\'].indexOf(kind) < 0) return JSON.stringify({status: \'done\', outcome: \'failed\', reason: \'kind\'});\n    if (action === \'poll\') return JSON.stringify(jobs[kind] || {status: \'none\'});\n    if (action !== \'run\') return JSON.stringify({status: \'none\'});\n    if (jobs[kind] && jobs[kind].status === \'running\' && Date.now() - jobs[kind].started < 8000) return JSON.stringify({status: \'busy\'});\n    var labels = {\n        like: {\n            off: /^(save to your library|add to (your )?(liked songs|library)|ajouter (\u00e0|aux) (la biblioth\u00e8que|titres lik\u00e9s|vos titres lik\u00e9s)|enregistrer dans (votre |la )?biblioth\u00e8que|in (deine |der )?bibliothek (aufnehmen|hinzuf\u00fcgen)|a\u00f1adir a (tu )?biblioteca|adicionar (\u00e0 biblioteca|aos t\u00edtulos curtidos))$/i,\n            on: /^(remove from (your )?(library|liked songs)|retirer (de la biblioth\u00e8que|des titres lik\u00e9s|de vos titres lik\u00e9s)|supprimer de (votre |la )?biblioth\u00e8que|aus (deiner |der )?bibliothek entfernen|quitar de (tu )?biblioteca|remover (da biblioteca|dos t\u00edtulos curtidos))$/i\n        },\n        repeat: {\n            off: /^(enable repeat|turn repeat on|activer la r\u00e9p\u00e9tition|wiederholung aktivieren|activar repetici\u00f3n|ativar repeti\u00e7\u00e3o)$/i,\n            on: /^(disable repeat|turn repeat off|enable repeat one|d\u00e9sactiver la r\u00e9p\u00e9tition|activer la r\u00e9p\u00e9tition d[\'\u2019]un titre|wiederholung deaktivieren|desactivar repetici\u00f3n|desativar repeti\u00e7\u00e3o)$/i\n        },\n        shuffle: {\n            off: /^(enable shuffle|turn shuffle on|activate shuffle|activer (la lecture |le mode |l[\'\u2019])?al\u00e9atoire|zufallswiedergabe aktivieren|activar (el modo |la reproducci\u00f3n )?aleatori[oa]|ativar (a reprodu\u00e7\u00e3o )?aleat\u00f3ria)$/i,\n            on: /^(disable shuffle|turn shuffle off|deactivate shuffle|enable smart shuffle|d\u00e9sactiver (la lecture |le mode |l[\'\u2019])?al\u00e9atoire|activer la lecture al\u00e9atoire intelligente|zufallswiedergabe deaktivieren|desactivar (el modo |la reproducci\u00f3n )?aleatori[oa]|desativar (a reprodu\u00e7\u00e3o )?aleat\u00f3ria)$/i\n        }\n    };\n    // Neutral names locate a control but never decide its state.\n    var neutral = /^(shuffle|lecture al\u00e9atoire|al\u00e9atoire|repeat|r\u00e9p\u00e9ter|r\u00e9p\u00e9tition)$/i;\n    var ids = {\n        like: /^(add-button|remove-button|add-to-library-button|remove-from-library-button)$/i,\n        repeat: /^control-button-repeat$/i,\n        shuffle: /^control-button-shuffle$|shuffle/i\n    };\n    var job = {status: \'running\', started: Date.now(), outcome: \'\', state: \'unknown\', method: \'\', journal: []};\n    jobs[kind] = job;\n    function log(code) { if (job.journal.length < 16) job.journal.push(code); }\n    function finish(outcome, state, method) { job.status = \'done\'; job.outcome = outcome; job.state = state || \'unknown\'; job.method = method || \'\'; }\n    function label(b) { return String(b.getAttribute(\'aria-label\') || \'\').trim(); }\n    function testid(b) { return String(b.getAttribute(\'data-testid\') || \'\'); }\n    function find() {\n        var list = Array.from(document.querySelectorAll(\'button, [role=\"button\"], [role=\"switch\"]\')).filter(function(b) {\n            if (!b.isConnected) return false;\n            var l = label(b);\n            return ids[kind].test(testid(b)) || labels[kind].off.test(l) || labels[kind].on.test(l) ||\n                (kind !== \'like\' && neutral.test(l) && (kind === \'shuffle\' ? /al[\u00e9e]atoire|shuffle/i : /r[\u00e9e]p[\u00e9e]t|repeat/i).test(l));\n        });\n        if (kind === \'like\') {\n            var scoped = list.filter(function(b) {\n                return b.closest(\'[data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-bar\"], [data-testid=\"now-playing-view\"], [data-testid=\"now-playing-panel\"], [data-testid=\"NPV\"], aside\');\n            });\n            list = scoped;\n        }\n        if (list.length > 1) {\n            var visible = list.filter(function(b) { var r = b.getBoundingClientRect(); return r.width > 0 && r.height > 0; });\n            if (visible.length === 1) list = visible;\n        }\n        if (!list.length) return {reason: \'absent\'};\n        if (list.length !== 1) return {reason: \'ambiguous\'};\n        var b = list[0];\n        if (b.disabled || b.getAttribute(\'aria-disabled\') === \'true\') return {reason: \'disabled\', node: b};\n        return {node: b, reason: \'\'};\n    }\n    function read(b) {\n        var raw = b.getAttribute(\'aria-checked\');\n        if (raw === null) raw = b.getAttribute(\'aria-pressed\');\n        var l = label(b), on = labels[kind].on.test(l), off = labels[kind].off.test(l);\n        if (raw === \'true\' || raw === \'false\' || (raw === \'mixed\' && kind !== \'like\')) {\n            if (kind === \'like\' && ((raw === \'false\' && on) || (raw === \'true\' && off))) return \'unknown\';\n            return raw;\n        }\n        return on ? \'true\' : off ? \'false\' : \'unknown\';\n    }\n    function nowTitle() {\n        var link = document.querySelector(\'[data-testid=\"now-playing-widget\"] a[data-testid=\"context-item-link\"], [data-testid=\"now-playing-bar\"] a[data-testid=\"context-item-link\"], a[data-testid=\"nowplaying-track-link\"], [data-testid=\"now-playing-view\"] a[href*=\"/track/\"]\');\n        return link ? String(link.textContent || \'\').replace(/\\s+/g, \' \').trim() : \'\';\n    }\n    function opener() {\n        var list = Array.from(document.querySelectorAll(\'button, [role=\"button\"]\')).filter(function(b) {\n            if (!b.isConnected) return false;\n            var id = testid(b), l = label(b);\n            return /^(control-button-npv|now-playing-view-button)$/i.test(id) ||\n                /^(now playing view|show now playing view|hide now playing view|vue \u00ab ?en cours de lecture ?\u00bb|afficher la vue en cours de lecture|masquer la vue en cours de lecture|en cours de lecture|ansicht \u201el\u00e4uft gerade\u201c|vista de reproducci\u00f3n|tela tocando agora)$/i.test(l);\n        });\n        return list.length === 1 ? list[0] : null;\n    }\n    function pressed(b) { return b.getAttribute(\'aria-pressed\') === \'true\' || b.getAttribute(\'aria-expanded\') === \'true\' || b.getAttribute(\'data-active\') === \'true\'; }\n    function wait(test, ms, done) {\n        var end = Date.now() + ms;\n        (function step() {\n            var v;\n            try { v = test(); } catch (_) { v = null; }\n            if (v || Date.now() >= end) { done(v || null); return; }\n            setTimeout(step, 120);\n        })();\n    }\n    // Decide and click on a readable control; verify the change afterwards.\n    function act(found, method, after) {\n        var b = found.node, before = read(b);\n        log(method + \':state-\' + before);\n        if (before === \'unknown\') { after(\'state\', before); return; }\n        if (kind === \'like\') {\n            var title = nowTitle();\n            if (expectedTitle && title && title !== expectedTitle) { log(method + \':identity\'); after(\'identity\', before); return; }\n            // A tap can only ADD a like: an existing like is never clicked,\n            // whatever the native button shows. Only a verified \'false\' is clicked.\n            if (before !== \'false\') { log(method + \':liked-read-only\'); after(\'read\', before); return; }\n            if (shownState === \'true\') { log(method + \':mismatch\'); after(\'read\', before); return; }\n        }\n        try { b.click(); log(method + \':click\'); } catch (_) { log(method + \':click-error\'); after(\'command\', before); return; }\n        wait(function() {\n            var again = find();\n            if (!again.node) return null;\n            var s = read(again.node);\n            return s !== before && s !== \'unknown\' ? s : null;\n        }, 2200, function(s) {\n            if (s) { log(method + \':verified\'); after(\'confirmed\', s); }\n            else { log(method + \':unverified\'); after(\'unconfirmed\', before); }\n        });\n    }\n    function viaKeyboard() {\n        if (kind === \'like\') { log(\'c:like-skipped\'); finish(\'failed\', \'unknown\', \'\'); return; }\n        var spec = kind === \'shuffle\' ? {key: \'s\', code: \'KeyS\', keyCode: 83} : {key: \'r\', code: \'KeyR\', keyCode: 82};\n        // Unverifiable when no control is readable, so only ONE combination per\n        // tap (two could cancel each other). Families alternate across taps.\n        var turns = W.__melodixKeyTurns = W.__melodixKeyTurns || {};\n        var ctrl = !(turns[kind] % 2); turns[kind] = (turns[kind] || 0) + 1;\n        try {\n            var target = document.activeElement && document.activeElement !== document.body ? document.activeElement : document.body;\n            [\'keydown\', \'keyup\'].forEach(function(type) {\n                target.dispatchEvent(new KeyboardEvent(type, {key: spec.key, code: spec.code, keyCode: spec.keyCode, which: spec.keyCode, ctrlKey: ctrl, altKey: !ctrl, bubbles: true, cancelable: true}));\n            });\n            log(\'c:\' + (ctrl ? \'ctrl-\' : \'alt-\') + spec.key);\n            finish(\'unverified\', \'unknown\', \'keyboard\');\n        } catch (_) { log(\'c:error\'); finish(\'failed\', \'unknown\', \'\'); }\n    }\n    function result(outcome, state, method) {\n        if (outcome === \'confirmed\' || outcome === \'unconfirmed\' || outcome === \'read\') finish(outcome, state, method);\n        else if (outcome === \'identity\') finish(\'identity\', \'unknown\', method);\n        else finish(\'failed\', state, method);\n    }\n    try {\n        var direct = find();\n        log(\'a:\' + (direct.node ? \'found\' : direct.reason));\n        if (direct.node && !direct.reason) { act(direct, \'a\', function(o, s) { result(o, s, \'direct\'); }); return JSON.stringify({status: \'started\'}); }\n        if (direct.reason === \'disabled\') { finish(\'disabled\', \'unknown\', \'direct\'); return JSON.stringify({status: \'started\'}); }\n        var view = opener();\n        if (!view) { log(\'b:no-opener\'); viaKeyboard(); return JSON.stringify({status: \'started\'}); }\n        var wasOpen = pressed(view);\n        if (!wasOpen) { try { view.click(); log(\'b:opened\'); } catch (_) { log(\'b:open-error\'); } }\n        else log(\'b:already-open\');\n        var closeView = function() {\n            if (!wasOpen) {\n                setTimeout(function() {\n                    var again = opener();\n                    try { if (again && pressed(again)) { again.click(); log(\'b:closed\'); } } catch (_) { log(\'b:close-error\'); }\n                }, 150);\n            }\n        };\n        wait(function() { var f = find(); return f.node && !f.reason ? f : null; }, 1800, function(found) {\n            if (!found) { log(\'b:absent\'); closeView(); viaKeyboard(); return; }\n            log(\'b:found\');\n            act(found, \'b\', function(o, s) { closeView(); result(o, s, \'now-playing-view\'); });\n        });\n        return JSON.stringify({status: \'started\'});\n    } catch (_) {\n        finish(\'failed\', \'unknown\', \'\');\n        return JSON.stringify({status: \'started\'});\n    }\n})\n"

.field private static final SCRIPT:Ljava/lang/String; = "(function(kind, action, expectedState, expectedTrack, expectedTitle) {\n    \'use strict\';\n    // Passive inspection of controls already in the page. A tap can only click\n    // a uniquely identified real control, after state/identity revalidation.\n    var labels = {\n        like: {\n            off: /^(save to your library|add to (your )?(liked songs|library)|ajouter (\u00e0|aux) (la biblioth\u00e8que|titres lik\u00e9s)|enregistrer dans (votre |la )?biblioth\u00e8que|in (deine |der )?bibliothek (aufnehmen|hinzuf\u00fcgen)|a\u00f1adir a (tu )?biblioteca|adicionar (\u00e0 biblioteca|aos t\u00edtulos curtidos))$/i,\n            on: /^(remove from (your )?(library|liked songs)|retirer (de la biblioth\u00e8que|des titres lik\u00e9s)|supprimer de (votre |la )?biblioth\u00e8que|aus (deiner |der )?bibliothek entfernen|quitar de (tu )?biblioteca|remover (da biblioteca|dos t\u00edtulos curtidos))$/i\n        },\n        repeat: {\n            // A label can safely distinguish off from enabled, but not list\n            // from one-track unless the page supplies an explicit mixed state.\n            off: /^(enable repeat|turn repeat on|activer la r\u00e9p\u00e9tition|wiederholung aktivieren|activar repetici\u00f3n|ativar repeti\u00e7\u00e3o)$/i,\n            on: /^(disable repeat|turn repeat off|d\u00e9sactiver la r\u00e9p\u00e9tition|wiederholung deaktivieren|desactivar repetici\u00f3n|desativar repeti\u00e7\u00e3o)$/i\n        },\n        shuffle: {\n            off: /^(enable shuffle|turn shuffle on|activate shuffle|activer (la lecture |le mode |l[\'\u2019])?al\u00e9atoire|zufallswiedergabe aktivieren|activar (el modo |la reproducci\u00f3n )?aleatori[oa]|ativar (a reprodu\u00e7\u00e3o )?aleat\u00f3ria)$/i,\n            on: /^(disable shuffle|turn shuffle off|deactivate shuffle|d\u00e9sactiver (la lecture |le mode |l[\'\u2019])?al\u00e9atoire|zufallswiedergabe deaktivieren|desactivar (el modo |la reproducci\u00f3n )?aleatori[oa]|desativar (a reprodu\u00e7\u00e3o )?aleat\u00f3ria)$/i\n        }\n    };\n    if ([\'like\',\'shuffle\',\'repeat\'].indexOf(kind) < 0) return JSON.stringify({state:\'unknown\',reason:\'control\'});\n    var selector = kind === \'like\' ?\n        \'[data-testid=\"now-playing-widget\"] button, [data-testid=\"now-playing-bar\"] button, [data-testid=\"now-playing-view\"] button, [data-testid=\"now-playing-panel\"] button, [data-testid=\"now-playing-view\"] [role=\"button\"], [data-testid=\"now-playing-bar\"] [role=\"button\"]\' :\n        kind === \'shuffle\' ? \'button[data-testid*=\"shuffle\" i], button[aria-label], [role=\"button\"][aria-label], [role=\"switch\"][aria-label]\' :\n        \'button[data-testid=\"control-button-repeat\"], [role=\"button\"][data-testid=\"control-button-repeat\"], button[aria-label], [role=\"button\"][aria-label]\';\n    var nodes = Array.from(document.querySelectorAll(selector)).filter(function(b) {\n        if (!b.isConnected) return false;\n        var id=String(b.getAttribute(\'data-testid\')||\'\').toLowerCase();\n        var label=String(b.getAttribute(\'aria-label\')||\'\').trim();\n        if (kind === \'like\') return /^(add-button|remove-button|add-to-library-button|remove-from-library-button)$/.test(id) || labels.like.off.test(label) || labels.like.on.test(label);\n        if (kind === \'repeat\') return id===\'control-button-repeat\' || labels.repeat.off.test(label) || labels.repeat.on.test(label);\n        return /shuffle/.test(id) || labels.shuffle.off.test(label) || labels.shuffle.on.test(label);\n    });\n    var result={state:\'unknown\',track:\'\',title:\'\',reason:\'control\',sent:false};\n    if (!nodes.length) {\n        result.reason = document.readyState === \'loading\' ? \'page\' : (kind === \'shuffle\' && !document.querySelector(\'[data-testid=\"now-playing-bar\"], [data-testid=\"now-playing-widget\"], [data-testid=\"player-controls\"]\') ? \'bar\' : \'control\');\n        return JSON.stringify(result);\n    }\n    if (nodes.length !== 1) {result.reason=\'ambiguous\';return JSON.stringify(result);}\n    var button=nodes[0];\n    if (button.disabled || button.getAttribute(\'aria-disabled\') === \'true\') {\n        var description=String(button.getAttribute(\'aria-description\')||\'\').trim();\n        result.reason=kind===\'shuffle\' && /^(shuffle is not available (with|for) (this account|this playback)|l[\'\u2019]al\u00e9atoire n[\'\u2019]est pas disponible avec (ce compte|cette lecture))$/i.test(description)?\'restriction\':\'disabled\';\n        return JSON.stringify(result);\n    }\n    if (kind === \'like\' && /^(true|menu|dialog)$/i.test(String(button.getAttribute(\'aria-haspopup\')||\'\'))) {result.reason=\'menu\';return JSON.stringify(result);}\n    var raw=button.getAttribute(\'aria-checked\');\n    if (raw === null) raw=button.getAttribute(\'aria-pressed\');\n    var label=String(button.getAttribute(\'aria-label\')||\'\').trim();\n    if (raw === null) {\n        raw=labels[kind].on.test(label) ? \'true\' :\n            labels[kind].off.test(label) ? \'false\' : \'unknown\';\n    } else if (raw !== \'true\' && raw !== \'false\' && !(kind !== \'like\' && raw === \'mixed\')) raw=\'unknown\';\n    if (kind === \'like\') {\n        // A false ARIA value must never override a removal action. An\n        // unlabeled generic add-button can be a playlist menu, not a like.\n        var testId=String(button.getAttribute(\'data-testid\')||\'\').toLowerCase();\n        var removeId=/^(remove-button|remove-from-library-button)$/.test(testId);\n        var addId=testId===\'add-to-library-button\';\n        var offLabel=labels.like.off.test(label), onLabel=labels.like.on.test(label);\n        if ((raw===\'false\' && (onLabel||removeId)) || (raw===\'true\' && offLabel)) {\n            result.reason=\'conflict\';return JSON.stringify(result);\n        }\n        if (raw===\'false\' && !offLabel && !addId) {result.reason=\'unverified\';return JSON.stringify(result);}\n        var bar=button.closest(\'[data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-bar\"]\');\n        if (!bar) bar=document.querySelector(\'[data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-bar\"]\');\n        var link=bar && bar.querySelector(\'a[data-testid=\"context-item-link\"], a[data-testid=\"nowplaying-track-link\"]\');\n        result.title=link ? String(link.textContent||\'\').trim() : \'\';\n        var href=link ? String(link.getAttribute(\'href\')||\'\') : \'\';\n        var match=/^\\/(track|episode)\\/([a-z0-9]+)(?:[?#].*)?$/i.exec(href);\n        result.track=match ? match[1].toLowerCase()+\':\'+match[2] : \'\';\n        if (!result.track || !result.title) {result.reason=\'identity\';return JSON.stringify(result);}\n    }\n    if (raw === \'unknown\') {result.reason=\'state\';return JSON.stringify(result);}\n    if (typeof button.click !== \'function\') {result.reason=\'command\';return JSON.stringify(result);}\n    result.state=raw;result.reason=\'\';\n    if (action === \'query\') return JSON.stringify(result);\n    if (action !== \'invoke\' || raw !== expectedState ||\n        (kind === \'like\' && (raw !== \'false\' || result.track !== expectedTrack || result.title !== expectedTitle))) return JSON.stringify({sent:false});\n    try {\n        // Use the exact revalidated button; never call a legacy helper that\n        // schedules playback-related work. Never click an already-liked item.\n        button.click();\n        return JSON.stringify({sent:true});\n    } catch (_) { return JSON.stringify({sent:false}); }\n})\n"

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

    .line 73
    invoke-direct {p0, p1, p2}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 55
    new-instance p1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object p2

    invoke-direct {p1, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerMode;->handler:Landroid/os/Handler;

    .line 56
    const-string p1, ""

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string p2, "unknown"

    iput-object p2, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerMode;->track:Ljava/lang/String;

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerMode;->title:Ljava/lang/String;

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerMode;->pendingState:Ljava/lang/String;

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerMode;->pendingTrack:Ljava/lang/String;

    const-string p2, "web"

    iput-object p2, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    .line 58
    const-wide/16 v0, -0x3e8

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode;->lastTap:J

    .line 60
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerMode;->remembered:Ljava/lang/String;

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerMode;->rememberedTitle:Ljava/lang/String;

    .line 67
    new-instance p1, Lcom/melodix/music/PreviewPlayerMode$1;

    invoke-direct {p1, p0}, Lcom/melodix/music/PreviewPlayerMode$1;-><init>(Lcom/melodix/music/PreviewPlayerMode;)V

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerMode;->tick:Ljava/lang/Runnable;

    .line 73
    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/melodix/music/PreviewPlayerMode;->setEnabled(Z)V

    .line 74
    new-instance p1, Lcom/melodix/music/PreviewPlayerMode$2;

    invoke-direct {p1, p0}, Lcom/melodix/music/PreviewPlayerMode$2;-><init>(Lcom/melodix/music/PreviewPlayerMode;)V

    invoke-virtual {p0, p1}, Lcom/melodix/music/PreviewPlayerMode;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 75
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

.method static synthetic access$1500(Lcom/melodix/music/PreviewPlayerMode;)Ljava/lang/String;
    .locals 0

    .line 23
    iget-object p0, p0, Lcom/melodix/music/PreviewPlayerMode;->pendingTrack:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$1600(Lcom/melodix/music/PreviewPlayerMode;)I
    .locals 0

    .line 23
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->diagnosticIndex()I

    move-result p0

    return p0
.end method

.method static synthetic access$1700()[Ljava/lang/String;
    .locals 1

    .line 23
    sget-object v0, Lcom/melodix/music/PreviewPlayerMode;->outcome:[Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1800(Lcom/melodix/music/PreviewPlayerMode;)Ljava/lang/String;
    .locals 0

    .line 23
    iget-object p0, p0, Lcom/melodix/music/PreviewPlayerMode;->remembered:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$1802(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 23
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerMode;->remembered:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$1900(Lcom/melodix/music/PreviewPlayerMode;)Ljava/lang/String;
    .locals 0

    .line 23
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->nativeTitle()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$200(Lcom/melodix/music/PreviewPlayerMode;)V
    .locals 0

    .line 23
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->observe()V

    return-void
.end method

.method static synthetic access$2000(Lcom/melodix/music/PreviewPlayerMode;)Ljava/lang/String;
    .locals 0

    .line 23
    iget-object p0, p0, Lcom/melodix/music/PreviewPlayerMode;->rememberedTitle:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$2002(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 23
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerMode;->rememberedTitle:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$2102(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 23
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$2202(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 23
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerMode;->track:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$2302(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 23
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerMode;->title:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$2402(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 23
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$2500(Lcom/melodix/music/PreviewPlayerMode;)V
    .locals 0

    .line 23
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->notConfirmed()V

    return-void
.end method

.method static synthetic access$2600(Lcom/melodix/music/PreviewPlayerMode;JI)V
    .locals 0

    .line 23
    invoke-direct {p0, p1, p2, p3}, Lcom/melodix/music/PreviewPlayerMode;->poll(JI)V

    return-void
.end method

.method static synthetic access$2700(Lcom/melodix/music/PreviewPlayerMode;)Landroid/webkit/WebView;
    .locals 0

    .line 23
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->web()Landroid/webkit/WebView;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$2800(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 23
    invoke-direct {p0, p1, p2}, Lcom/melodix/music/PreviewPlayerMode;->job(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$2900(Lcom/melodix/music/PreviewPlayerMode;Lorg/json/JSONObject;)V
    .locals 0

    .line 23
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerMode;->finishJob(Lorg/json/JSONObject;)V

    return-void
.end method

.method static synthetic access$300(Lcom/melodix/music/PreviewPlayerMode;)Landroid/os/Handler;
    .locals 0

    .line 23
    iget-object p0, p0, Lcom/melodix/music/PreviewPlayerMode;->handler:Landroid/os/Handler;

    return-object p0
.end method

.method static synthetic access$3000(Lcom/melodix/music/PreviewPlayerMode;)V
    .locals 0

    .line 23
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->sync()V

    return-void
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

    .line 77
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 78
    const/4 v1, 0x0

    :goto_0
    const/16 v2, 0x8

    if-ge v1, v2, :cond_2

    instance-of v2, v0, Landroid/content/ContextWrapper;

    if-eqz v2, :cond_2

    .line 79
    instance-of v2, v0, Landroid/app/Activity;

    if-eqz v2, :cond_0

    check-cast v0, Landroid/app/Activity;

    return-object v0

    .line 80
    :cond_0
    move-object v2, v0

    check-cast v2, Landroid/content/ContextWrapper;

    invoke-virtual {v2}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object v2

    if-ne v2, v0, :cond_1

    goto :goto_1

    .line 78
    :cond_1
    add-int/lit8 v1, v1, 0x1

    move-object v0, v2

    goto :goto_0

    .line 82
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

    .line 50
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

    .line 90
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "(function(){var r=JSON.parse(((function(kind, action, expectedState, expectedTrack, expectedTitle) {\n    \'use strict\';\n    // Passive inspection of controls already in the page. A tap can only click\n    // a uniquely identified real control, after state/identity revalidation.\n    var labels = {\n        like: {\n            off: /^(save to your library|add to (your )?(liked songs|library)|ajouter (\u00e0|aux) (la biblioth\u00e8que|titres lik\u00e9s)|enregistrer dans (votre |la )?biblioth\u00e8que|in (deine |der )?bibliothek (aufnehmen|hinzuf\u00fcgen)|a\u00f1adir a (tu )?biblioteca|adicionar (\u00e0 biblioteca|aos t\u00edtulos curtidos))$/i,\n            on: /^(remove from (your )?(library|liked songs)|retirer (de la biblioth\u00e8que|des titres lik\u00e9s)|supprimer de (votre |la )?biblioth\u00e8que|aus (deiner |der )?bibliothek entfernen|quitar de (tu )?biblioteca|remover (da biblioteca|dos t\u00edtulos curtidos))$/i\n        },\n        repeat: {\n            // A label can safely distinguish off from enabled, but not list\n            // from one-track unless the page supplies an explicit mixed state.\n            off: /^(enable repeat|turn repeat on|activer la r\u00e9p\u00e9tition|wiederholung aktivieren|activar repetici\u00f3n|ativar repeti\u00e7\u00e3o)$/i,\n            on: /^(disable repeat|turn repeat off|d\u00e9sactiver la r\u00e9p\u00e9tition|wiederholung deaktivieren|desactivar repetici\u00f3n|desativar repeti\u00e7\u00e3o)$/i\n        },\n        shuffle: {\n            off: /^(enable shuffle|turn shuffle on|activate shuffle|activer (la lecture |le mode |l[\'\u2019])?al\u00e9atoire|zufallswiedergabe aktivieren|activar (el modo |la reproducci\u00f3n )?aleatori[oa]|ativar (a reprodu\u00e7\u00e3o )?aleat\u00f3ria)$/i,\n            on: /^(disable shuffle|turn shuffle off|deactivate shuffle|d\u00e9sactiver (la lecture |le mode |l[\'\u2019])?al\u00e9atoire|zufallswiedergabe deaktivieren|desactivar (el modo |la reproducci\u00f3n )?aleatori[oa]|desativar (a reprodu\u00e7\u00e3o )?aleat\u00f3ria)$/i\n        }\n    };\n    if ([\'like\',\'shuffle\',\'repeat\'].indexOf(kind) < 0) return JSON.stringify({state:\'unknown\',reason:\'control\'});\n    var selector = kind === \'like\' ?\n        \'[data-testid=\"now-playing-widget\"] button, [data-testid=\"now-playing-bar\"] button, [data-testid=\"now-playing-view\"] button, [data-testid=\"now-playing-panel\"] button, [data-testid=\"now-playing-view\"] [role=\"button\"], [data-testid=\"now-playing-bar\"] [role=\"button\"]\' :\n        kind === \'shuffle\' ? \'button[data-testid*=\"shuffle\" i], button[aria-label], [role=\"button\"][aria-label], [role=\"switch\"][aria-label]\' :\n        \'button[data-testid=\"control-button-repeat\"], [role=\"button\"][data-testid=\"control-button-repeat\"], button[aria-label], [role=\"button\"][aria-label]\';\n    var nodes = Array.from(document.querySelectorAll(selector)).filter(function(b) {\n        if (!b.isConnected) return false;\n        var id=String(b.getAttribute(\'data-testid\')||\'\').toLowerCase();\n        var label=String(b.getAttribute(\'aria-label\')||\'\').trim();\n        if (kind === \'like\') return /^(add-button|remove-button|add-to-library-button|remove-from-library-button)$/.test(id) || labels.like.off.test(label) || labels.like.on.test(label);\n        if (kind === \'repeat\') return id===\'control-button-repeat\' || labels.repeat.off.test(label) || labels.repeat.on.test(label);\n        return /shuffle/.test(id) || labels.shuffle.off.test(label) || labels.shuffle.on.test(label);\n    });\n    var result={state:\'unknown\',track:\'\',title:\'\',reason:\'control\',sent:false};\n    if (!nodes.length) {\n        result.reason = document.readyState === \'loading\' ? \'page\' : (kind === \'shuffle\' && !document.querySelector(\'[data-testid=\"now-playing-bar\"], [data-testid=\"now-playing-widget\"], [data-testid=\"player-controls\"]\') ? \'bar\' : \'control\');\n        return JSON.stringify(result);\n    }\n    if (nodes.length !== 1) {result.reason=\'ambiguous\';return JSON.stringify(result);}\n    var button=nodes[0];\n    if (button.disabled || button.getAttribute(\'aria-disabled\') === \'true\') {\n        var description=String(button.getAttribute(\'aria-description\')||\'\').trim();\n        result.reason=kind===\'shuffle\' && /^(shuffle is not available (with|for) (this account|this playback)|l[\'\u2019]al\u00e9atoire n[\'\u2019]est pas disponible avec (ce compte|cette lecture))$/i.test(description)?\'restriction\':\'disabled\';\n        return JSON.stringify(result);\n    }\n    if (kind === \'like\' && /^(true|menu|dialog)$/i.test(String(button.getAttribute(\'aria-haspopup\')||\'\'))) {result.reason=\'menu\';return JSON.stringify(result);}\n    var raw=button.getAttribute(\'aria-checked\');\n    if (raw === null) raw=button.getAttribute(\'aria-pressed\');\n    var label=String(button.getAttribute(\'aria-label\')||\'\').trim();\n    if (raw === null) {\n        raw=labels[kind].on.test(label) ? \'true\' :\n            labels[kind].off.test(label) ? \'false\' : \'unknown\';\n    } else if (raw !== \'true\' && raw !== \'false\' && !(kind !== \'like\' && raw === \'mixed\')) raw=\'unknown\';\n    if (kind === \'like\') {\n        // A false ARIA value must never override a removal action. An\n        // unlabeled generic add-button can be a playlist menu, not a like.\n        var testId=String(button.getAttribute(\'data-testid\')||\'\').toLowerCase();\n        var removeId=/^(remove-button|remove-from-library-button)$/.test(testId);\n        var addId=testId===\'add-to-library-button\';\n        var offLabel=labels.like.off.test(label), onLabel=labels.like.on.test(label);\n        if ((raw===\'false\' && (onLabel||removeId)) || (raw===\'true\' && offLabel)) {\n            result.reason=\'conflict\';return JSON.stringify(result);\n        }\n        if (raw===\'false\' && !offLabel && !addId) {result.reason=\'unverified\';return JSON.stringify(result);}\n        var bar=button.closest(\'[data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-bar\"]\');\n        if (!bar) bar=document.querySelector(\'[data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-bar\"]\');\n        var link=bar && bar.querySelector(\'a[data-testid=\"context-item-link\"], a[data-testid=\"nowplaying-track-link\"]\');\n        result.title=link ? String(link.textContent||\'\').trim() : \'\';\n        var href=link ? String(link.getAttribute(\'href\')||\'\') : \'\';\n        var match=/^\\/(track|episode)\\/([a-z0-9]+)(?:[?#].*)?$/i.exec(href);\n        result.track=match ? match[1].toLowerCase()+\':\'+match[2] : \'\';\n        if (!result.track || !result.title) {result.reason=\'identity\';return JSON.stringify(result);}\n    }\n    if (raw === \'unknown\') {result.reason=\'state\';return JSON.stringify(result);}\n    if (typeof button.click !== \'function\') {result.reason=\'command\';return JSON.stringify(result);}\n    result.state=raw;result.reason=\'\';\n    if (action === \'query\') return JSON.stringify(result);\n    if (action !== \'invoke\' || raw !== expectedState ||\n        (kind === \'like\' && (raw !== \'false\' || result.track !== expectedTrack || result.title !== expectedTitle))) return JSON.stringify({sent:false});\n    try {\n        // Use the exact revalidated button; never call a legacy helper that\n        // schedules playback-related work. Never click an already-liked item.\n        button.click();\n        return JSON.stringify({sent:true});\n    } catch (_) { return JSON.stringify({sent:false}); }\n})\n)("

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

    const-string p2, "(function(kind) {\n    \'use strict\';\n    // Passive, bounded, allowlisted observations only. No account, track or\n    // arbitrary page text is returned. This probe does not click or send data.\n    var specs={\n        repeat:{selector:\'button[data-testid=\"control-button-repeat\"], [role=\"button\"][data-testid=\"control-button-repeat\"], button[aria-label], [role=\"button\"][aria-label]\', ids:/^control-button-repeat$/i,\n            off:/^(enable repeat|turn repeat on|activer la r\u00e9p\u00e9tition|wiederholung aktivieren|activar repetici\u00f3n|ativar repeti\u00e7\u00e3o)$/i,\n            on:/^(disable repeat|turn repeat off|d\u00e9sactiver la r\u00e9p\u00e9tition|wiederholung deaktivieren|desactivar repetici\u00f3n|desativar repeti\u00e7\u00e3o)$/i},\n        shuffle:{selector:\'button[data-testid*=\"shuffle\" i], button[aria-label], [role=\"button\"][aria-label], [role=\"switch\"][aria-label]\', ids:/shuffle/i,\n            off:/^(enable shuffle|turn shuffle on|activate shuffle|activer (la lecture |le mode |l[\'\u2019])?al\u00e9atoire|zufallswiedergabe aktivieren|activar (el modo |la reproducci\u00f3n )?aleatori[oa]|ativar (a reprodu\u00e7\u00e3o )?aleat\u00f3ria)$/i,\n            on:/^(disable shuffle|turn shuffle off|deactivate shuffle|d\u00e9sactiver (la lecture |le mode |l[\'\u2019])?al\u00e9atoire|zufallswiedergabe deaktivieren|desactivar (el modo |la reproducci\u00f3n )?aleatori[oa]|desativar (a reprodu\u00e7\u00e3o )?aleat\u00f3ria)$/i},\n        like:{selector:\'[data-testid=\"now-playing-widget\"] button, [data-testid=\"now-playing-bar\"] button, [data-testid=\"now-playing-view\"] button, [data-testid=\"now-playing-panel\"] button, [data-testid=\"now-playing-view\"] [role=\"button\"], [data-testid=\"now-playing-bar\"] [role=\"button\"]\', ids:/^(add-button|remove-button|add-to-library-button|remove-from-library-button)$/i,\n            off:/^(save to your library|add to (your )?(liked songs|library)|ajouter (\u00e0|aux) (la biblioth\u00e8que|titres lik\u00e9s)|enregistrer dans (votre |la )?biblioth\u00e8que|in (deine |der )?bibliothek (aufnehmen|hinzuf\u00fcgen)|a\u00f1adir a (tu )?biblioteca|adicionar (\u00e0 biblioteca|aos t\u00edtulos curtidos))$/i,\n            on:/^(remove from (your )?(library|liked songs)|retirer (de la biblioth\u00e8que|des titres lik\u00e9s)|supprimer de (votre |la )?biblioth\u00e8que|aus (deiner |der )?bibliothek entfernen|quitar de (tu )?biblioteca|remover (da biblioteca|dos t\u00edtulos curtidos))$/i}\n    };\n    // Aggregate structure only: fixed testid/role and label categories, never\n    // arbitrary labels or identifiers that could contain a track or account.\n    function structure() {\n        var roots=Array.from(document.querySelectorAll(\'[data-testid=\"now-playing-bar\"], [data-testid=\"now-playing-widget\"], [data-testid=\"player-controls\"], [data-testid=\"now-playing-view\"], [data-testid=\"now-playing-panel\"]\'));\n        var nodes=[];roots.forEach(function(root){Array.from(root.querySelectorAll(\'button,[role=\"button\"],[role=\"switch\"],[role=\"slider\"],input[type=\"range\"]\')).forEach(function(n){if(nodes.indexOf(n)<0)nodes.push(n);});});\n        var st={bar:0,view:0,nodes:Math.min(nodes.length,99),playpause:0,repeat:0,shuffle:0,like:0,queue:0,volume:0,lyrics:0,connect:0,other:0,button:0,switch:0,slider:0,aria_shuffle:0,aria_like:0,aria_play:0,aria_pause:0,aria_other:0};\n        roots.forEach(function(r){if(/^(now-playing-view|now-playing-panel)$/.test(r.getAttribute(\'data-testid\')))st.view++;else st.bar++;});\n        nodes.forEach(function(n){\n            var id=String(n.getAttribute(\'data-testid\')||\'\').toLowerCase(), label=String(n.getAttribute(\'aria-label\')||\'\').trim(), role=String(n.getAttribute(\'role\')||\'\').toLowerCase();\n            var k=/^control-button-playpause$/.test(id)?\'playpause\':/repeat/.test(id)?\'repeat\':/shuffle/.test(id)?\'shuffle\':/^(add-button|remove-button|add-to-library-button|remove-from-library-button)$/.test(id)?\'like\':/^(queue-button|control-button-queue)$/.test(id)?\'queue\':/^(volume-bar|volume-slider)$/.test(id)?\'volume\':/^(lyrics-button|control-button-lyrics)$/.test(id)?\'lyrics\':/^(connect-button|control-button-connect|connect-device-picker|device-picker)$/.test(id)?\'connect\':\'other\';\n            st[k]=Math.min(st[k]+1,99);if(role===\'switch\')st.switch++;else if(role===\'slider\'||n.tagName===\'INPUT\')st.slider++;else st.button++;\n            if(specs.shuffle.off.test(label)||specs.shuffle.on.test(label))st.aria_shuffle++;else if(specs.like.off.test(label)||specs.like.on.test(label))st.aria_like++;else if(/^(play|resume|lire|reprendre)$/i.test(label))st.aria_play++;else if(/^(pause|mettre en pause)$/i.test(label))st.aria_pause++;else if(label)st.aria_other++;\n        });\n        Object.keys(st).forEach(function(k){st[k]=Math.min(st[k],99);});return JSON.stringify(st);\n    }\n    var spec=specs[kind], out={kind:kind===\'shuffle\'?\'shuffle\':kind===\'like\'?\'like\':kind===\'repeat\'?\'repeat\':\'unknown\',reason:\'control\',count:0,state:\'unknown\',label:\'unknown\',command:\'unknown\',disabled:false,smart:false,structure:structure()};\n    if(!spec)return JSON.stringify(out);\n    var nodes=Array.from(document.querySelectorAll(spec.selector)).filter(function(b){\n        return b.isConnected && (spec.ids.test(String(b.getAttribute(\'data-testid\')||\'\')) || spec.off.test(String(b.getAttribute(\'aria-label\')||\'\').trim()) || spec.on.test(String(b.getAttribute(\'aria-label\')||\'\').trim()));\n    });\n    out.count=Math.min(nodes.length,2);\n    if(nodes.length!==1){out.reason=nodes.length?\'ambiguous\':document.readyState===\'loading\'?\'page\':\'absent\';return JSON.stringify(out);}\n    var b=nodes[0], label=String(b.getAttribute(\'aria-label\')||\'\').trim();\n    out.label=spec.on.test(label)?\'on-action\':spec.off.test(label)?\'off-action\':label?\'unrecognized\':\'absent\';\n    out.disabled=!!b.disabled || b.getAttribute(\'aria-disabled\')===\'true\';\n    var raw=b.getAttribute(\'aria-checked\');if(raw===null)raw=b.getAttribute(\'aria-pressed\');\n    out.state=raw===\'true\'||raw===\'false\'||(kind!==\'like\'&&raw===\'mixed\')?raw:raw===null?(out.label===\'on-action\'?\'true\':out.label===\'off-action\'?\'false\':\'unknown\'):\'unknown\';\n    out.smart=kind===\'shuffle\' && out.state===\'mixed\';\n    var id=String(b.getAttribute(\'data-testid\')||\'\').toLowerCase();\n    var conflict=kind===\'like\' && ((out.state===\'false\' && (out.label===\'on-action\'||/^(remove-button|remove-from-library-button)$/.test(id))) || (out.state===\'true\' && out.label===\'off-action\'));\n    var unverified=kind===\'like\' && out.state===\'false\' && out.label!==\'off-action\' && id!==\'add-to-library-button\';\n    var popup=String(b.getAttribute(\'aria-haspopup\')||\'\').toLowerCase();\n    if(kind===\'like\')out.command=popup===\'true\'||popup===\'menu\'||popup===\'dialog\'?\'menu\':\'unspecified\';\n    else out.command=\'toggle\';\n    var description=String(b.getAttribute(\'aria-description\')||\'\').trim();\n    var restricted=kind===\'shuffle\' && out.disabled && /^(shuffle is not available (with|for) (this account|this playback)|l[\'\u2019]al\u00e9atoire n[\'\u2019]est pas disponible avec (ce compte|cette lecture))$/i.test(description);\n    out.reason=restricted?\'restriction\':out.disabled?\'disabled\':conflict?\'conflict\':unverified?\'unverified\':out.state===\'unknown\'?\'state\':\'observed\';\n    return JSON.stringify(out);\n})\n"

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

    .line 51
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

    .line 203
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
    .locals 9

    .line 184
    const-string v0, "outcome"

    const-string v1, "failed"

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "confirmed|unconfirmed|unverified|read|identity|disabled|failed"

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewPlayerMode;->allowed(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 185
    const-string v1, "state"

    const-string v2, "unknown"

    invoke-virtual {p1, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v3, "true|false|mixed|unknown"

    invoke-static {v1, v3}, Lcom/melodix/music/PreviewPlayerMode;->allowed(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 186
    const-string v3, "method"

    const-string v4, ""

    invoke-virtual {p1, v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v5, "direct|now-playing-view|keyboard|unknown"

    invoke-static {v3, v5}, Lcom/melodix/music/PreviewPlayerMode;->allowed(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 187
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->diagnosticIndex()I

    move-result v5

    .line 188
    if-ltz v5, :cond_1

    sget-object v6, Lcom/melodix/music/PreviewPlayerMode;->methods:[Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "m\u00e9thode="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-eqz v8, :cond_0

    const-string v3, "aucune"

    :cond_0
    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v7, ", r\u00e9sultat="

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v7, ", \u00e9tapes="

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v7, "journal"

    invoke-virtual {p1, v7, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerMode;->clean(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    aput-object p1, v6, v5

    sget-object p1, Lcom/melodix/music/PreviewPlayerMode;->outcome:[Ljava/lang/String;

    aput-object v0, p1, v5

    .line 189
    :cond_1
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    iget-wide v5, p0, Lcom/melodix/music/PreviewPlayerMode;->generation:J

    const-wide/16 v7, 0x1

    add-long/2addr v5, v7

    iput-wide v5, p0, Lcom/melodix/music/PreviewPlayerMode;->generation:J

    iget-wide v5, p0, Lcom/melodix/music/PreviewPlayerMode;->querySerial:J

    add-long/2addr v5, v7

    iput-wide v5, p0, Lcom/melodix/music/PreviewPlayerMode;->querySerial:J

    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerMode;->queryInFlight:Z

    .line 190
    const-string v3, "confirmed"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    const-string v5, "read"

    const-string v6, "like"

    if-nez v3, :cond_2

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6

    :cond_2
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_6

    .line 191
    iput-object v1, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    const-string v2, "observed"

    iput-object v2, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    iput-object v1, p0, Lcom/melodix/music/PreviewPlayerMode;->remembered:Ljava/lang/String;

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->nativeTitle()Ljava/lang/String;

    move-result-object v4

    :cond_3
    iput-object v4, p0, Lcom/melodix/music/PreviewPlayerMode;->rememberedTitle:Ljava/lang/String;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->paint()V

    .line 192
    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v2, "true"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    const-string v1, "D\u00e9j\u00e0 dans vos titres lik\u00e9s"

    goto :goto_0

    :cond_4
    const-string v1, "Pas encore dans vos titres lik\u00e9s"

    :goto_0
    invoke-static {v0, v1, p1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 193
    :cond_5
    return-void

    .line 195
    :cond_6
    iput-object v2, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    .line 196
    const-string v1, "unverified"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    iput-object v1, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->paint()V

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "Commande envoy\u00e9e, \u00e9tat non v\u00e9rifiable"

    invoke-static {v0, v1, p1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void

    .line 197
    :cond_7
    const-string v1, "identity"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8

    iput-object v1, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->paint()V

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "Titre en cours diff\u00e9rent, R\u00e9essayer"

    invoke-static {v0, v1, p1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void

    .line 198
    :cond_8
    const-string v1, "disabled"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

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

    .line 199
    :cond_9
    const-string v1, "unconfirmed"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a

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

    .line 200
    :cond_a
    const-string v0, "control"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->paint()V

    .line 201
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v2, "shuffle"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_b

    const-string v1, "Al\u00e9atoire indisponible, R\u00e9essayer"

    goto :goto_1

    :cond_b
    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    invoke-virtual {v1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_c

    const-string v1, "Like indisponible, R\u00e9essayer"

    goto :goto_1

    :cond_c
    const-string v1, "R\u00e9p\u00e9tition indisponible, R\u00e9essayer"

    :goto_1
    invoke-static {v0, v1, p1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 202
    return-void
.end method

.method private invoke()V
    .locals 12

    .line 147
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    .line 148
    iget-boolean v2, p0, Lcom/melodix/music/PreviewPlayerMode;->running:Z

    if-eqz v2, :cond_5

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->isShown()Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->getWindowVisibility()I

    move-result v2

    if-nez v2, :cond_5

    iget-boolean v2, p0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    if-nez v2, :cond_5

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerMode;->lastTap:J

    sub-long v2, v0, v2

    const-wide/16 v4, 0x190

    cmp-long v2, v2, v4

    if-gez v2, :cond_0

    goto/16 :goto_2

    .line 149
    :cond_0
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    const-string v3, "unknown"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    const/4 v4, 0x3

    const/4 v5, 0x0

    if-eqz v2, :cond_3

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->tappable()Z

    move-result v2

    if-nez v2, :cond_3

    .line 150
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->beginDiagnostic()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->diagnosticIndex()I

    move-result v2

    if-ltz v2, :cond_1

    sget-object v3, Lcom/melodix/music/PreviewPlayerMode;->outcome:[Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "non envoy\u00e9 : "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v3, v2

    .line 151
    :cond_1
    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode;->lastTap:J

    invoke-virtual {p0, v4}, Lcom/melodix/music/PreviewPlayerMode;->performHapticFeedback(I)Z

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->shake()V

    .line 152
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v2, "bar"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    const-string v1, "Lance un titre pour utiliser ce bouton"

    goto :goto_0

    :cond_2
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->reasonText()Ljava/lang/String;

    move-result-object v1

    :goto_0
    invoke-static {v0, v1, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 153
    return-void

    .line 155
    :cond_3
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->web()Landroid/webkit/WebView;

    move-result-object v2

    if-nez v2, :cond_4

    iput-object v3, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    const-string v0, "web"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->paint()V

    return-void

    .line 156
    :cond_4
    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode;->lastTap:J

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->beginDiagnostic()V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    iput-boolean v5, p0, Lcom/melodix/music/PreviewPlayerMode;->observedPending:Z

    .line 157
    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->pendingState:Ljava/lang/String;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerMode;->track:Ljava/lang/String;

    iput-object v1, p0, Lcom/melodix/music/PreviewPlayerMode;->pendingTrack:Ljava/lang/String;

    iget-wide v6, p0, Lcom/melodix/music/PreviewPlayerMode;->generation:J

    const-wide/16 v8, 0x1

    add-long/2addr v6, v8

    iput-wide v6, p0, Lcom/melodix/music/PreviewPlayerMode;->generation:J

    iget-wide v10, p0, Lcom/melodix/music/PreviewPlayerMode;->querySerial:J

    add-long/2addr v10, v8

    iput-wide v10, p0, Lcom/melodix/music/PreviewPlayerMode;->querySerial:J

    iput-boolean v5, p0, Lcom/melodix/music/PreviewPlayerMode;->queryInFlight:Z

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->paint()V

    invoke-virtual {p0, v4}, Lcom/melodix/music/PreviewPlayerMode;->performHapticFeedback(I)Z

    .line 158
    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerMode;->handler:Landroid/os/Handler;

    new-instance v3, Lcom/melodix/music/PreviewPlayerMode$5;

    invoke-direct {v3, p0, v6, v7}, Lcom/melodix/music/PreviewPlayerMode$5;-><init>(Lcom/melodix/music/PreviewPlayerMode;J)V

    const-wide/16 v4, 0x1b58

    invoke-virtual {v1, v3, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 161
    :try_start_0
    const-string v1, "run"

    invoke-direct {p0, v1, v0}, Lcom/melodix/music/PreviewPlayerMode;->job(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lcom/melodix/music/PreviewPlayerMode$6;

    invoke-direct {v1, p0, v6, v7}, Lcom/melodix/music/PreviewPlayerMode$6;-><init>(Lcom/melodix/music/PreviewPlayerMode;J)V

    invoke-virtual {v2, v0, v1}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 167
    goto :goto_1

    :catch_0
    move-exception v0

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->notConfirmed()V

    .line 168
    :goto_1
    return-void

    .line 148
    :cond_5
    :goto_2
    return-void
.end method

.method private job(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 140
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "((function(kind, action, shownState, expectedTitle) {\n    \'use strict\';\n    // One explicit tap = one job. Methods in order, state re-read after each:\n    // (a) control already in the page, (b) briefly open the now-playing view in\n    // the hidden page and close it again, (c) web-player keyboard shortcut\n    // (shuffle/repeat only: a like is never sent without a verified state).\n    // Never reads storage, cookies or tokens; never navigates; no network.\n    var W = window;\n    var jobs = W.__melodixModeJobs = W.__melodixModeJobs || {};\n    if ([\'like\', \'shuffle\', \'repeat\'].indexOf(kind) < 0) return JSON.stringify({status: \'done\', outcome: \'failed\', reason: \'kind\'});\n    if (action === \'poll\') return JSON.stringify(jobs[kind] || {status: \'none\'});\n    if (action !== \'run\') return JSON.stringify({status: \'none\'});\n    if (jobs[kind] && jobs[kind].status === \'running\' && Date.now() - jobs[kind].started < 8000) return JSON.stringify({status: \'busy\'});\n    var labels = {\n        like: {\n            off: /^(save to your library|add to (your )?(liked songs|library)|ajouter (\u00e0|aux) (la biblioth\u00e8que|titres lik\u00e9s|vos titres lik\u00e9s)|enregistrer dans (votre |la )?biblioth\u00e8que|in (deine |der )?bibliothek (aufnehmen|hinzuf\u00fcgen)|a\u00f1adir a (tu )?biblioteca|adicionar (\u00e0 biblioteca|aos t\u00edtulos curtidos))$/i,\n            on: /^(remove from (your )?(library|liked songs)|retirer (de la biblioth\u00e8que|des titres lik\u00e9s|de vos titres lik\u00e9s)|supprimer de (votre |la )?biblioth\u00e8que|aus (deiner |der )?bibliothek entfernen|quitar de (tu )?biblioteca|remover (da biblioteca|dos t\u00edtulos curtidos))$/i\n        },\n        repeat: {\n            off: /^(enable repeat|turn repeat on|activer la r\u00e9p\u00e9tition|wiederholung aktivieren|activar repetici\u00f3n|ativar repeti\u00e7\u00e3o)$/i,\n            on: /^(disable repeat|turn repeat off|enable repeat one|d\u00e9sactiver la r\u00e9p\u00e9tition|activer la r\u00e9p\u00e9tition d[\'\u2019]un titre|wiederholung deaktivieren|desactivar repetici\u00f3n|desativar repeti\u00e7\u00e3o)$/i\n        },\n        shuffle: {\n            off: /^(enable shuffle|turn shuffle on|activate shuffle|activer (la lecture |le mode |l[\'\u2019])?al\u00e9atoire|zufallswiedergabe aktivieren|activar (el modo |la reproducci\u00f3n )?aleatori[oa]|ativar (a reprodu\u00e7\u00e3o )?aleat\u00f3ria)$/i,\n            on: /^(disable shuffle|turn shuffle off|deactivate shuffle|enable smart shuffle|d\u00e9sactiver (la lecture |le mode |l[\'\u2019])?al\u00e9atoire|activer la lecture al\u00e9atoire intelligente|zufallswiedergabe deaktivieren|desactivar (el modo |la reproducci\u00f3n )?aleatori[oa]|desativar (a reprodu\u00e7\u00e3o )?aleat\u00f3ria)$/i\n        }\n    };\n    // Neutral names locate a control but never decide its state.\n    var neutral = /^(shuffle|lecture al\u00e9atoire|al\u00e9atoire|repeat|r\u00e9p\u00e9ter|r\u00e9p\u00e9tition)$/i;\n    var ids = {\n        like: /^(add-button|remove-button|add-to-library-button|remove-from-library-button)$/i,\n        repeat: /^control-button-repeat$/i,\n        shuffle: /^control-button-shuffle$|shuffle/i\n    };\n    var job = {status: \'running\', started: Date.now(), outcome: \'\', state: \'unknown\', method: \'\', journal: []};\n    jobs[kind] = job;\n    function log(code) { if (job.journal.length < 16) job.journal.push(code); }\n    function finish(outcome, state, method) { job.status = \'done\'; job.outcome = outcome; job.state = state || \'unknown\'; job.method = method || \'\'; }\n    function label(b) { return String(b.getAttribute(\'aria-label\') || \'\').trim(); }\n    function testid(b) { return String(b.getAttribute(\'data-testid\') || \'\'); }\n    function find() {\n        var list = Array.from(document.querySelectorAll(\'button, [role=\"button\"], [role=\"switch\"]\')).filter(function(b) {\n            if (!b.isConnected) return false;\n            var l = label(b);\n            return ids[kind].test(testid(b)) || labels[kind].off.test(l) || labels[kind].on.test(l) ||\n                (kind !== \'like\' && neutral.test(l) && (kind === \'shuffle\' ? /al[\u00e9e]atoire|shuffle/i : /r[\u00e9e]p[\u00e9e]t|repeat/i).test(l));\n        });\n        if (kind === \'like\') {\n            var scoped = list.filter(function(b) {\n                return b.closest(\'[data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-bar\"], [data-testid=\"now-playing-view\"], [data-testid=\"now-playing-panel\"], [data-testid=\"NPV\"], aside\');\n            });\n            list = scoped;\n        }\n        if (list.length > 1) {\n            var visible = list.filter(function(b) { var r = b.getBoundingClientRect(); return r.width > 0 && r.height > 0; });\n            if (visible.length === 1) list = visible;\n        }\n        if (!list.length) return {reason: \'absent\'};\n        if (list.length !== 1) return {reason: \'ambiguous\'};\n        var b = list[0];\n        if (b.disabled || b.getAttribute(\'aria-disabled\') === \'true\') return {reason: \'disabled\', node: b};\n        return {node: b, reason: \'\'};\n    }\n    function read(b) {\n        var raw = b.getAttribute(\'aria-checked\');\n        if (raw === null) raw = b.getAttribute(\'aria-pressed\');\n        var l = label(b), on = labels[kind].on.test(l), off = labels[kind].off.test(l);\n        if (raw === \'true\' || raw === \'false\' || (raw === \'mixed\' && kind !== \'like\')) {\n            if (kind === \'like\' && ((raw === \'false\' && on) || (raw === \'true\' && off))) return \'unknown\';\n            return raw;\n        }\n        return on ? \'true\' : off ? \'false\' : \'unknown\';\n    }\n    function nowTitle() {\n        var link = document.querySelector(\'[data-testid=\"now-playing-widget\"] a[data-testid=\"context-item-link\"], [data-testid=\"now-playing-bar\"] a[data-testid=\"context-item-link\"], a[data-testid=\"nowplaying-track-link\"], [data-testid=\"now-playing-view\"] a[href*=\"/track/\"]\');\n        return link ? String(link.textContent || \'\').replace(/\\s+/g, \' \').trim() : \'\';\n    }\n    function opener() {\n        var list = Array.from(document.querySelectorAll(\'button, [role=\"button\"]\')).filter(function(b) {\n            if (!b.isConnected) return false;\n            var id = testid(b), l = label(b);\n            return /^(control-button-npv|now-playing-view-button)$/i.test(id) ||\n                /^(now playing view|show now playing view|hide now playing view|vue \u00ab ?en cours de lecture ?\u00bb|afficher la vue en cours de lecture|masquer la vue en cours de lecture|en cours de lecture|ansicht \u201el\u00e4uft gerade\u201c|vista de reproducci\u00f3n|tela tocando agora)$/i.test(l);\n        });\n        return list.length === 1 ? list[0] : null;\n    }\n    function pressed(b) { return b.getAttribute(\'aria-pressed\') === \'true\' || b.getAttribute(\'aria-expanded\') === \'true\' || b.getAttribute(\'data-active\') === \'true\'; }\n    function wait(test, ms, done) {\n        var end = Date.now() + ms;\n        (function step() {\n            var v;\n            try { v = test(); } catch (_) { v = null; }\n            if (v || Date.now() >= end) { done(v || null); return; }\n            setTimeout(step, 120);\n        })();\n    }\n    // Decide and click on a readable control; verify the change afterwards.\n    function act(found, method, after) {\n        var b = found.node, before = read(b);\n        log(method + \':state-\' + before);\n        if (before === \'unknown\') { after(\'state\', before); return; }\n        if (kind === \'like\') {\n            var title = nowTitle();\n            if (expectedTitle && title && title !== expectedTitle) { log(method + \':identity\'); after(\'identity\', before); return; }\n            // A tap can only ADD a like: an existing like is never clicked,\n            // whatever the native button shows. Only a verified \'false\' is clicked.\n            if (before !== \'false\') { log(method + \':liked-read-only\'); after(\'read\', before); return; }\n            if (shownState === \'true\') { log(method + \':mismatch\'); after(\'read\', before); return; }\n        }\n        try { b.click(); log(method + \':click\'); } catch (_) { log(method + \':click-error\'); after(\'command\', before); return; }\n        wait(function() {\n            var again = find();\n            if (!again.node) return null;\n            var s = read(again.node);\n            return s !== before && s !== \'unknown\' ? s : null;\n        }, 2200, function(s) {\n            if (s) { log(method + \':verified\'); after(\'confirmed\', s); }\n            else { log(method + \':unverified\'); after(\'unconfirmed\', before); }\n        });\n    }\n    function viaKeyboard() {\n        if (kind === \'like\') { log(\'c:like-skipped\'); finish(\'failed\', \'unknown\', \'\'); return; }\n        var spec = kind === \'shuffle\' ? {key: \'s\', code: \'KeyS\', keyCode: 83} : {key: \'r\', code: \'KeyR\', keyCode: 82};\n        // Unverifiable when no control is readable, so only ONE combination per\n        // tap (two could cancel each other). Families alternate across taps.\n        var turns = W.__melodixKeyTurns = W.__melodixKeyTurns || {};\n        var ctrl = !(turns[kind] % 2); turns[kind] = (turns[kind] || 0) + 1;\n        try {\n            var target = document.activeElement && document.activeElement !== document.body ? document.activeElement : document.body;\n            [\'keydown\', \'keyup\'].forEach(function(type) {\n                target.dispatchEvent(new KeyboardEvent(type, {key: spec.key, code: spec.code, keyCode: spec.keyCode, which: spec.keyCode, ctrlKey: ctrl, altKey: !ctrl, bubbles: true, cancelable: true}));\n            });\n            log(\'c:\' + (ctrl ? \'ctrl-\' : \'alt-\') + spec.key);\n            finish(\'unverified\', \'unknown\', \'keyboard\');\n        } catch (_) { log(\'c:error\'); finish(\'failed\', \'unknown\', \'\'); }\n    }\n    function result(outcome, state, method) {\n        if (outcome === \'confirmed\' || outcome === \'unconfirmed\' || outcome === \'read\') finish(outcome, state, method);\n        else if (outcome === \'identity\') finish(\'identity\', \'unknown\', method);\n        else finish(\'failed\', state, method);\n    }\n    try {\n        var direct = find();\n        log(\'a:\' + (direct.node ? \'found\' : direct.reason));\n        if (direct.node && !direct.reason) { act(direct, \'a\', function(o, s) { result(o, s, \'direct\'); }); return JSON.stringify({status: \'started\'}); }\n        if (direct.reason === \'disabled\') { finish(\'disabled\', \'unknown\', \'direct\'); return JSON.stringify({status: \'started\'}); }\n        var view = opener();\n        if (!view) { log(\'b:no-opener\'); viaKeyboard(); return JSON.stringify({status: \'started\'}); }\n        var wasOpen = pressed(view);\n        if (!wasOpen) { try { view.click(); log(\'b:opened\'); } catch (_) { log(\'b:open-error\'); } }\n        else log(\'b:already-open\');\n        var closeView = function() {\n            if (!wasOpen) {\n                setTimeout(function() {\n                    var again = opener();\n                    try { if (again && pressed(again)) { again.click(); log(\'b:closed\'); } } catch (_) { log(\'b:close-error\'); }\n                }, 150);\n            }\n        };\n        wait(function() { var f = find(); return f.node && !f.reason ? f : null; }, 1800, function(found) {\n            if (!found) { log(\'b:absent\'); closeView(); viaKeyboard(); return; }\n            log(\'b:found\');\n            act(found, \'b\', function(o, s) { closeView(); result(o, s, \'now-playing-view\'); });\n        });\n        return JSON.stringify({status: \'started\'});\n    } catch (_) {\n        finish(\'failed\', \'unknown\', \'\');\n        return JSON.stringify({status: \'started\'});\n    }\n})\n)("

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

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->nativeTitle()Ljava/lang/String;

    move-result-object p2

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

.method private nativeTitle()Ljava/lang/String;
    .locals 3

    .line 135
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->activity()Landroid/app/Activity;

    move-result-object v0

    const-string v1, ""

    if-nez v0, :cond_0

    return-object v1

    .line 136
    :cond_0
    const v2, 0x7f09023b

    invoke-virtual {v0, v2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 137
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

    .line 62
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->diagnosticIndex()I

    move-result v0

    if-ltz v0, :cond_0

    sget-object v1, Lcom/melodix/music/PreviewPlayerMode;->outcome:[Ljava/lang/String;

    const-string v2, "non confirm\u00e9"

    aput-object v2, v1, v0

    .line 63
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

    .line 64
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

    .line 65
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

    const-string v1, "Impossible d\u2019ajouter aux titres lik\u00e9s, R\u00e9essayer"

    goto :goto_1

    :cond_4
    const-string v1, "Action non confirm\u00e9e. R\u00e9essayer"

    :goto_1
    invoke-static {v0, v1, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 66
    :cond_5
    return-void
.end method

.method private observe()V
    .locals 13

    .line 102
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

    .line 103
    :cond_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v4

    .line 104
    iget-boolean v6, p0, Lcom/melodix/music/PreviewPlayerMode;->queryInFlight:Z

    if-eqz v6, :cond_1

    iget-wide v6, p0, Lcom/melodix/music/PreviewPlayerMode;->queryStarted:J

    sub-long v6, v4, v6

    const-wide/16 v8, 0x960

    cmp-long v6, v6, v8

    if-gez v6, :cond_1

    return-void

    .line 105
    :cond_1
    const/4 v6, 0x1

    iput-boolean v6, p0, Lcom/melodix/music/PreviewPlayerMode;->queryInFlight:Z

    iput-wide v4, p0, Lcom/melodix/music/PreviewPlayerMode;->queryStarted:J

    .line 106
    iget-wide v9, p0, Lcom/melodix/music/PreviewPlayerMode;->generation:J

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerMode;->querySerial:J

    const-wide/16 v6, 0x1

    add-long v11, v4, v6

    iput-wide v11, p0, Lcom/melodix/music/PreviewPlayerMode;->querySerial:J

    .line 107
    :try_start_0
    const-string v4, "query"

    invoke-direct {p0, v4, v0, v0, v0}, Lcom/melodix/music/PreviewPlayerMode;->call(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v4, Lcom/melodix/music/PreviewPlayerMode$3;

    move-object v7, v4

    move-object v8, p0

    invoke-direct/range {v7 .. v12}, Lcom/melodix/music/PreviewPlayerMode$3;-><init>(Lcom/melodix/music/PreviewPlayerMode;JJ)V

    invoke-virtual {v1, v0, v4}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 124
    goto :goto_0

    :catch_0
    move-exception v0

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerMode;->queryInFlight:Z

    iput-object v3, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    iput-object v2, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->paint()V

    .line 125
    :goto_0
    return-void
.end method

.method private paint()V
    .locals 14

    .line 223
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    const-string v1, "unknown"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 224
    const/4 v2, 0x1

    xor-int/2addr v0, v2

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    .line 225
    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v5, "shuffle"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    const-string v6, "true"

    if-eqz v4, :cond_2

    iget-boolean v4, p0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    if-eqz v4, :cond_2

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerMode;->pendingState:Ljava/lang/String;

    const-string v4, "false"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    move-object v3, v6

    goto :goto_0

    :cond_0
    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerMode;->pendingState:Ljava/lang/String;

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    move-object v3, v4

    goto :goto_0

    :cond_1
    move-object v3, v1

    .line 226
    :cond_2
    :goto_0
    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    const/4 v6, 0x0

    const-string v7, "mixed"

    if-nez v4, :cond_4

    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    goto :goto_1

    :cond_3
    move v4, v6

    goto :goto_2

    :cond_4
    :goto_1
    move v4, v2

    .line 228
    :goto_2
    iget-object v8, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v9, "like"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_8

    if-eqz v4, :cond_5

    const-string v1, "favon"

    goto :goto_3

    :cond_5
    const-string v1, "favoff"

    :goto_3
    if-nez v0, :cond_6

    const-string v3, "Like indisponible"

    goto/16 :goto_8

    :cond_6
    if-eqz v4, :cond_7

    const-string v3, "Titre aim\u00e9"

    goto :goto_8

    :cond_7
    const-string v3, "Ajouter aux titres lik\u00e9s"

    goto :goto_8

    .line 229
    :cond_8
    iget-object v8, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    invoke-virtual {v8, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_c

    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_9

    const-string v7, "smart_shuffle"

    goto :goto_4

    :cond_9
    move-object v7, v5

    :goto_4
    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_a

    const-string v1, "Al\u00e9atoire : \u00e9tat inconnu"

    :goto_5
    move-object v3, v1

    goto :goto_6

    :cond_a
    if-eqz v4, :cond_b

    const-string v1, "Lecture al\u00e9atoire activ\u00e9e"

    goto :goto_5

    :cond_b
    const-string v1, "Lecture al\u00e9atoire d\u00e9sactiv\u00e9e"

    goto :goto_5

    :goto_6
    move-object v1, v7

    goto :goto_8

    .line 230
    :cond_c
    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_d

    const-string v1, "repone"

    goto :goto_7

    :cond_d
    if-eqz v4, :cond_e

    const-string v1, "repon"

    goto :goto_7

    :cond_e
    const-string v1, "repoff"

    :goto_7
    if-nez v0, :cond_f

    const-string v3, "R\u00e9p\u00e9tition indisponible"

    goto :goto_8

    :cond_f
    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_10

    const-string v3, "R\u00e9p\u00e9ter le titre"

    goto :goto_8

    :cond_10
    if-eqz v4, :cond_11

    const-string v3, "R\u00e9p\u00e9ter la liste"

    goto :goto_8

    :cond_11
    const-string v3, "R\u00e9p\u00e9tition d\u00e9sactiv\u00e9e"

    .line 231
    :goto_8
    iget-boolean v7, p0, Lcom/melodix/music/PreviewPlayerMode;->running:Z

    if-eqz v7, :cond_12

    if-nez v0, :cond_12

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v7

    iget-wide v10, p0, Lcom/melodix/music/PreviewPlayerMode;->visibleSince:J

    sub-long/2addr v7, v10

    const-wide/16 v10, 0x960

    cmp-long v7, v7, v10

    if-gez v7, :cond_12

    move v7, v2

    goto :goto_9

    :cond_12
    move v7, v6

    .line 232
    :goto_9
    if-eqz v7, :cond_13

    const v1, 0x108005f

    goto :goto_a

    :cond_13
    invoke-direct {p0, v1}, Lcom/melodix/music/PreviewPlayerMode;->drawable(Ljava/lang/String;)I

    move-result v1

    :goto_a
    if-eqz v1, :cond_14

    invoke-virtual {p0, v1}, Lcom/melodix/music/PreviewPlayerMode;->setImageResource(I)V

    .line 233
    :cond_14
    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerMode;->running:Z

    if-eqz v1, :cond_15

    if-nez v0, :cond_15

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->tappable()Z

    move-result v1

    if-eqz v1, :cond_15

    if-nez v7, :cond_15

    move v1, v2

    goto :goto_b

    :cond_15
    move v1, v6

    .line 234
    :goto_b
    const-string v8, ")"

    const-string v10, "Al\u00e9atoire"

    const-string v11, "R\u00e9p\u00e9tition"

    const-string v12, "Like"

    if-nez v0, :cond_18

    if-eqz v1, :cond_18

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "\u00c9tat inconnu : touchez pour essayer ("

    invoke-virtual {v3, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v13, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    invoke-virtual {v13, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_16

    move-object v10, v12

    goto :goto_c

    :cond_16
    iget-object v12, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    invoke-virtual {v12, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_17

    goto :goto_c

    :cond_17
    move-object v10, v11

    :goto_c
    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_10

    .line 235
    :cond_18
    if-nez v0, :cond_1d

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    if-eqz v7, :cond_19

    const-string v13, "Chargement : "

    goto :goto_d

    :cond_19
    const-string v13, "Indisponible : "

    :goto_d
    invoke-virtual {v3, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->reasonText()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v3, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v13, " ("

    invoke-virtual {v3, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v13, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    invoke-virtual {v13, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_1a

    move-object v10, v12

    goto :goto_e

    :cond_1a
    iget-object v12, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    invoke-virtual {v12, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_1b

    goto :goto_e

    :cond_1b
    move-object v10, v11

    :goto_e
    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v8, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    invoke-virtual {v8, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1c

    const-string v5, " ; n\u00e9cessite un contr\u00f4le et un \u00e9tat Spotify reconnus"

    goto :goto_f

    :cond_1c
    const-string v5, ""

    :goto_f
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 236
    :cond_1d
    :goto_10
    if-eqz v4, :cond_1e

    const v4, -0x1fb762

    goto :goto_11

    :cond_1e
    const v4, -0x363f16

    :goto_11
    invoke-virtual {p0, v4}, Lcom/melodix/music/PreviewPlayerMode;->setColorFilter(I)V

    iget-boolean v4, p0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    if-eqz v4, :cond_1f

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", en attente"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    :cond_1f
    invoke-virtual {p0, v3}, Lcom/melodix/music/PreviewPlayerMode;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 237
    if-nez v0, :cond_20

    if-eqz v1, :cond_21

    :cond_20
    iget-boolean v3, p0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    if-nez v3, :cond_21

    goto :goto_12

    :cond_21
    move v2, v6

    :goto_12
    invoke-virtual {p0, v2}, Lcom/melodix/music/PreviewPlayerMode;->setEnabled(Z)V

    if-eqz v1, :cond_22

    const v0, 0x3f4ccccd    # 0.8f

    goto :goto_15

    :cond_22
    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    invoke-virtual {v1, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const v2, 0x3eb33333    # 0.35f

    const/high16 v3, 0x3f800000    # 1.0f

    const v4, 0x3f266666    # 0.65f

    if-eqz v1, :cond_24

    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    if-eqz v1, :cond_23

    :goto_13
    move v0, v4

    goto :goto_15

    :cond_23
    if-eqz v0, :cond_25

    goto :goto_14

    :cond_24
    if-nez v0, :cond_26

    if-eqz v7, :cond_25

    goto :goto_13

    :cond_25
    move v0, v2

    goto :goto_15

    :cond_26
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    if-eqz v0, :cond_27

    goto :goto_13

    :cond_27
    :goto_14
    move v0, v3

    :goto_15
    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerMode;->setAlpha(F)V

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->invalidate()V

    .line 238
    return-void
.end method

.method private parse(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 2

    .line 93
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

    .line 94
    :catch_0
    move-exception p1

    return-object v0
.end method

.method private poll(JI)V
    .locals 2

    .line 170
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

    .line 171
    :cond_1
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->handler:Landroid/os/Handler;

    new-instance v1, Lcom/melodix/music/PreviewPlayerMode$7;

    invoke-direct {v1, p0, p1, p2, p3}, Lcom/melodix/music/PreviewPlayerMode$7;-><init>(Lcom/melodix/music/PreviewPlayerMode;JI)V

    const-wide/16 p1, 0xfa

    invoke-virtual {v0, v1, p1, p2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 182
    return-void
.end method

.method private reasonText()Ljava/lang/String;
    .locals 3

    .line 205
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "page"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "page Spotify en cours de chargement"

    return-object v0

    .line 206
    :cond_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "bar"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "barre du lecteur Spotify absente ; lancer un titre"

    return-object v0

    .line 207
    :cond_1
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "control"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, "contr\u00f4le Spotify non reconnu ou absent"

    return-object v0

    .line 208
    :cond_2
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "ambiguous"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    const-string v0, "plusieurs contr\u00f4les possibles"

    return-object v0

    .line 209
    :cond_3
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "restriction"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    const-string v0, "L\u2019al\u00e9atoire n\u2019est pas disponible avec ce compte ou cette lecture"

    return-object v0

    .line 210
    :cond_4
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "disabled"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    const-string v0, "contr\u00f4le Spotify d\u00e9sactiv\u00e9"

    return-object v0

    .line 211
    :cond_5
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "menu"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    const-string v0, "menu de biblioth\u00e8que non v\u00e9rifi\u00e9"

    return-object v0

    .line 212
    :cond_6
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "conflict"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    const-string v0, "\u00e9tat et action du contr\u00f4le contradictoires"

    return-object v0

    .line 213
    :cond_7
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "unverified"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    const-string v0, "action d\u2019ajout non v\u00e9rifi\u00e9e"

    return-object v0

    .line 214
    :cond_8
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v2, "identity"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    const-string v0, "titre ou identit\u00e9 non confirm\u00e9"

    return-object v0

    .line 215
    :cond_9
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v2, "remembered"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a

    const-string v0, "dernier \u00e9tat lu"

    return-object v0

    .line 216
    :cond_a
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    const-string v0, "commande envoy\u00e9e, \u00e9tat non v\u00e9rifiable"

    return-object v0

    .line 217
    :cond_b
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "command"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c

    const-string v0, "commande indisponible"

    return-object v0

    .line 218
    :cond_c
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "confirmation"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d

    const-string v0, "action non confirm\u00e9e"

    return-object v0

    .line 219
    :cond_d
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "web"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_e

    const-string v0, "page Spotify ou r\u00e9ponse non accessible"

    return-object v0

    .line 220
    :cond_e
    const-string v0, "\u00e9tat ou langue non reconnu"

    return-object v0
.end method

.method private remember(Lorg/json/JSONObject;)V
    .locals 26

    .line 36
    move-object/from16 v1, p0

    const-string v0, "{}"

    const-string v2, "unknown"

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerMode;->diagnosticIndex()I

    move-result v3

    if-gez v3, :cond_0

    return-void

    .line 38
    :cond_0
    :try_start_0
    new-instance v4, Lorg/json/JSONObject;

    const-string v5, "diagnostic"

    move-object/from16 v6, p1

    invoke-virtual {v6, v5, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 39
    new-instance v5, Lorg/json/JSONObject;

    const-string v6, "structure"

    invoke-virtual {v4, v6, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v5, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 40
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "bar"

    const-string v7, "view"

    const-string v8, "nodes"

    const-string v9, "playpause"

    const-string v10, "repeat"

    const-string v11, "shuffle"

    const-string v12, "like"

    const-string v13, "queue"

    const-string v14, "volume"

    const-string v15, "lyrics"

    const-string v16, "connect"

    const-string v17, "other"

    const-string v18, "button"

    const-string v19, "switch"

    const-string v20, "slider"

    const-string v21, "aria_shuffle"

    const-string v22, "aria_like"

    const-string v23, "aria_play"

    const-string v24, "aria_pause"

    const-string v25, "aria_other"

    filled-new-array/range {v6 .. v25}, [Ljava/lang/String;

    move-result-object v6

    .line 41
    const/4 v7, 0x0

    :goto_0
    const/16 v8, 0x14

    if-ge v7, v8, :cond_2

    aget-object v8, v6, v7

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v9

    if-lez v9, :cond_1

    const-string v9, ", "

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_1
    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-static {v5, v8}, Lcom/melodix/music/PreviewPlayerMode;->count(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 42
    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/melodix/music/PreviewPlayerMode;->structure:Ljava/lang/String;

    .line 43
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "\u00e9tat="

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v5, "state"

    invoke-virtual {v4, v5, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v6, "true|false|mixed|unknown"

    invoke-static {v5, v6}, Lcom/melodix/music/PreviewPlayerMode;->allowed(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v5, ", motif="

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v5, "reason"

    .line 44
    invoke-virtual {v4, v5, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v6, "control|page|absent|ambiguous|disabled|restriction|state|conflict|unverified|observed|unknown"

    invoke-static {v5, v6}, Lcom/melodix/music/PreviewPlayerMode;->allowed(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v5, ", commande="

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v5, "command"

    .line 45
    invoke-virtual {v4, v5, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v6, "menu|unspecified|toggle|unknown"

    invoke-static {v5, v6}, Lcom/melodix/music/PreviewPlayerMode;->allowed(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v5, ", libell\u00e9="

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v5, "label"

    .line 46
    invoke-virtual {v4, v5, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v4, "on-action|off-action|unrecognized|absent|unknown"

    invoke-static {v2, v4}, Lcom/melodix/music/PreviewPlayerMode;->allowed(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 47
    sget-object v2, Lcom/melodix/music/PreviewPlayerMode;->last:[Ljava/lang/String;

    aput-object v0, v2, v3

    iget-boolean v2, v1, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    if-eqz v2, :cond_3

    sget-object v2, Lcom/melodix/music/PreviewPlayerMode;->after:[Ljava/lang/String;

    aput-object v0, v2, v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 48
    :catch_0
    move-exception v0

    sget-object v0, Lcom/melodix/music/PreviewPlayerMode;->last:[Ljava/lang/String;

    const-string v2, "observation indisponible"

    aput-object v2, v0, v3

    iget-boolean v0, v1, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    if-eqz v0, :cond_3

    sget-object v0, Lcom/melodix/music/PreviewPlayerMode;->after:[Ljava/lang/String;

    sget-object v2, Lcom/melodix/music/PreviewPlayerMode;->last:[Ljava/lang/String;

    aget-object v2, v2, v3

    aput-object v2, v0, v3

    goto :goto_2

    :cond_3
    :goto_1
    nop

    .line 49
    :goto_2
    return-void
.end method

.method private sameNativeTitle(Ljava/lang/String;)Z
    .locals 3

    .line 97
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->activity()Landroid/app/Activity;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    if-eqz p1, :cond_2

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_0

    .line 98
    :cond_0
    const v2, 0x7f09023b

    invoke-virtual {v0, v2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 99
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

    .line 97
    :cond_2
    :goto_0
    return v1
.end method

.method private shake()V
    .locals 3

    .line 127
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-lt v0, v1, :cond_0

    invoke-static {}, Landroid/animation/ValueAnimator;->areAnimatorsEnabled()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 128
    :cond_0
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    const/high16 v1, 0x40800000    # 4.0f

    mul-float/2addr v0, v1

    .line 129
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 130
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

    .line 132
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 133
    return-void
.end method

.method private sync()V
    .locals 5

    .line 240
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

    .line 241
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

    .line 242
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

    .line 243
    :cond_2
    :goto_1
    return-void
.end method

.method private tappable()Z
    .locals 2

    .line 143
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "control"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "absent"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "ambiguous"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "state"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "confirmation"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    .line 144
    const-string v1, "unverified"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "identity"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "remembered"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "observed"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "conflict"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "menu"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 143
    :goto_1
    return v0
.end method

.method private web()Landroid/webkit/WebView;
    .locals 4

    .line 85
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->activity()Landroid/app/Activity;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    .line 86
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

    .line 87
    :catch_0
    move-exception v0

    return-object v1
.end method


# virtual methods
.method protected onAttachedToWindow()V
    .locals 1

    .line 244
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

    .line 245
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

    .line 246
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

    .line 247
    invoke-super {p0, p1}, Landroid/widget/ImageButton;->onWindowVisibilityChanged(I)V

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerMode;->handler:Landroid/os/Handler;

    if-eqz p1, :cond_0

    new-instance p1, Lcom/melodix/music/PreviewPlayerMode$9;

    invoke-direct {p1, p0}, Lcom/melodix/music/PreviewPlayerMode$9;-><init>(Lcom/melodix/music/PreviewPlayerMode;)V

    invoke-virtual {p0, p1}, Lcom/melodix/music/PreviewPlayerMode;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method
