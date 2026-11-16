package com.melodix.music;

import android.app.Activity;
import android.animation.ValueAnimator;
import android.os.Build;
import android.content.Context;
import android.content.ContextWrapper;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.AttributeSet;
import android.view.HapticFeedbackConstants;
import android.view.View;
import android.webkit.ValueCallback;
import android.webkit.WebView;
import android.widget.ImageButton;
import android.widget.TextView;
import android.widget.Toast;
import org.json.JSONObject;
import org.json.JSONTokener;

/** Passive DOM observations; one guarded existing action per explicit tap. */
public final class PreviewPlayerMode extends ImageButton {
    private static final String SCRIPT = "(function(kind, action, expectedState, expectedTrack, expectedTitle) {\n    'use strict';\n    // Passive inspection of controls already in the page. A tap can only click\n    // a uniquely identified real control, after state/identity revalidation.\n    var labels = {\n        like: {\n            off: /^(save to your library|add to (your )?(liked songs|library)|ajouter (\u00e0|aux) (la biblioth\u00e8que|titres lik\u00e9s)|enregistrer dans (votre |la )?biblioth\u00e8que|in (deine |der )?bibliothek (aufnehmen|hinzuf\u00fcgen)|a\u00f1adir a (tu )?biblioteca|adicionar (\u00e0 biblioteca|aos t\u00edtulos curtidos))$/i,\n            on: /^(remove from (your )?(library|liked songs)|retirer (de la biblioth\u00e8que|des titres lik\u00e9s)|supprimer de (votre |la )?biblioth\u00e8que|aus (deiner |der )?bibliothek entfernen|quitar de (tu )?biblioteca|remover (da biblioteca|dos t\u00edtulos curtidos))$/i\n        },\n        repeat: {\n            // A label can safely distinguish off from enabled, but not list\n            // from one-track unless the page supplies an explicit mixed state.\n            off: /^(enable repeat|turn repeat on|activer la r\u00e9p\u00e9tition|wiederholung aktivieren|activar repetici\u00f3n|ativar repeti\u00e7\u00e3o)$/i,\n            on: /^(disable repeat|turn repeat off|d\u00e9sactiver la r\u00e9p\u00e9tition|wiederholung deaktivieren|desactivar repetici\u00f3n|desativar repeti\u00e7\u00e3o)$/i\n        },\n        shuffle: {\n            off: /^(enable shuffle|turn shuffle on|activate shuffle|activer (la lecture |le mode |l['\u2019])?al\u00e9atoire|zufallswiedergabe aktivieren|activar (el modo |la reproducci\u00f3n )?aleatori[oa]|ativar (a reprodu\u00e7\u00e3o )?aleat\u00f3ria)$/i,\n            on: /^(disable shuffle|turn shuffle off|deactivate shuffle|d\u00e9sactiver (la lecture |le mode |l['\u2019])?al\u00e9atoire|zufallswiedergabe deaktivieren|desactivar (el modo |la reproducci\u00f3n )?aleatori[oa]|desativar (a reprodu\u00e7\u00e3o )?aleat\u00f3ria)$/i\n        }\n    };\n    if (['like','shuffle','repeat'].indexOf(kind) < 0) return JSON.stringify({state:'unknown',reason:'control'});\n    var selector = kind === 'like' ?\n        '[data-testid=\"now-playing-widget\"] button, [data-testid=\"now-playing-bar\"] button, [data-testid=\"now-playing-view\"] button, [data-testid=\"now-playing-panel\"] button, [data-testid=\"now-playing-view\"] [role=\"button\"], [data-testid=\"now-playing-bar\"] [role=\"button\"]' :\n        kind === 'shuffle' ? 'button[data-testid*=\"shuffle\" i], button[aria-label], [role=\"button\"][aria-label], [role=\"switch\"][aria-label]' :\n        'button[data-testid=\"control-button-repeat\"], [role=\"button\"][data-testid=\"control-button-repeat\"], button[aria-label], [role=\"button\"][aria-label]';\n    var nodes = Array.from(document.querySelectorAll(selector)).filter(function(b) {\n        if (!b.isConnected) return false;\n        var id=String(b.getAttribute('data-testid')||'').toLowerCase();\n        var label=String(b.getAttribute('aria-label')||'').trim();\n        if (kind === 'like') return /^(add-button|remove-button|add-to-library-button|remove-from-library-button)$/.test(id) || labels.like.off.test(label) || labels.like.on.test(label);\n        if (kind === 'repeat') return id==='control-button-repeat' || labels.repeat.off.test(label) || labels.repeat.on.test(label);\n        return /shuffle/.test(id) || labels.shuffle.off.test(label) || labels.shuffle.on.test(label);\n    });\n    var result={state:'unknown',track:'',title:'',reason:'control',sent:false};\n    if (!nodes.length) {\n        result.reason = document.readyState === 'loading' ? 'page' : (kind === 'shuffle' && !document.querySelector('[data-testid=\"now-playing-bar\"], [data-testid=\"now-playing-widget\"], [data-testid=\"player-controls\"]') ? 'bar' : 'control');\n        return JSON.stringify(result);\n    }\n    if (nodes.length !== 1) {result.reason='ambiguous';return JSON.stringify(result);}\n    var button=nodes[0];\n    if (button.disabled || button.getAttribute('aria-disabled') === 'true') {\n        var description=String(button.getAttribute('aria-description')||'').trim();\n        result.reason=kind==='shuffle' && /^(shuffle is not available (with|for) (this account|this playback)|l['\u2019]al\u00e9atoire n['\u2019]est pas disponible avec (ce compte|cette lecture))$/i.test(description)?'restriction':'disabled';\n        return JSON.stringify(result);\n    }\n    if (kind === 'like' && /^(true|menu|dialog)$/i.test(String(button.getAttribute('aria-haspopup')||''))) {result.reason='menu';return JSON.stringify(result);}\n    var raw=button.getAttribute('aria-checked');\n    if (raw === null) raw=button.getAttribute('aria-pressed');\n    var label=String(button.getAttribute('aria-label')||'').trim();\n    if (raw === null) {\n        raw=labels[kind].on.test(label) ? 'true' :\n            labels[kind].off.test(label) ? 'false' : 'unknown';\n    } else if (raw !== 'true' && raw !== 'false' && !(kind !== 'like' && raw === 'mixed')) raw='unknown';\n    if (kind === 'like') {\n        // A false ARIA value must never override a removal action. An\n        // unlabeled generic add-button can be a playlist menu, not a like.\n        var testId=String(button.getAttribute('data-testid')||'').toLowerCase();\n        var removeId=/^(remove-button|remove-from-library-button)$/.test(testId);\n        var addId=testId==='add-to-library-button';\n        var offLabel=labels.like.off.test(label), onLabel=labels.like.on.test(label);\n        if ((raw==='false' && (onLabel||removeId)) || (raw==='true' && offLabel)) {\n            result.reason='conflict';return JSON.stringify(result);\n        }\n        if (raw==='false' && !offLabel && !addId) {result.reason='unverified';return JSON.stringify(result);}\n        var bar=button.closest('[data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-bar\"]');\n        if (!bar) bar=document.querySelector('[data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-bar\"]');\n        var link=bar && bar.querySelector('a[data-testid=\"context-item-link\"], a[data-testid=\"nowplaying-track-link\"]');\n        result.title=link ? String(link.textContent||'').trim() : '';\n        var href=link ? String(link.getAttribute('href')||'') : '';\n        var match=/^\\/(track|episode)\\/([a-z0-9]+)(?:[?#].*)?$/i.exec(href);\n        result.track=match ? match[1].toLowerCase()+':'+match[2] : '';\n        if (!result.track || !result.title) {result.reason='identity';return JSON.stringify(result);}\n    }\n    if (raw === 'unknown') {result.reason='state';return JSON.stringify(result);}\n    if (typeof button.click !== 'function') {result.reason='command';return JSON.stringify(result);}\n    result.state=raw;result.reason='';\n    if (action === 'query') return JSON.stringify(result);\n    if (action !== 'invoke' || raw !== expectedState ||\n        (kind === 'like' && (raw !== 'false' || result.track !== expectedTrack || result.title !== expectedTitle))) return JSON.stringify({sent:false});\n    try {\n        // Use the exact revalidated button; never call a legacy helper that\n        // schedules playback-related work. Never click an already-liked item.\n        button.click();\n        return JSON.stringify({sent:true});\n    } catch (_) { return JSON.stringify({sent:false}); }\n})\n";
    private static final String DIAGNOSTIC = "(function(kind) {\n    'use strict';\n    // Passive, bounded, allowlisted observations only. No account, track or\n    // arbitrary page text is returned. This probe does not click or send data.\n    var specs={\n        repeat:{selector:'button[data-testid=\"control-button-repeat\"], [role=\"button\"][data-testid=\"control-button-repeat\"], button[aria-label], [role=\"button\"][aria-label]', ids:/^control-button-repeat$/i,\n            off:/^(enable repeat|turn repeat on|activer la r\u00e9p\u00e9tition|wiederholung aktivieren|activar repetici\u00f3n|ativar repeti\u00e7\u00e3o)$/i,\n            on:/^(disable repeat|turn repeat off|d\u00e9sactiver la r\u00e9p\u00e9tition|wiederholung deaktivieren|desactivar repetici\u00f3n|desativar repeti\u00e7\u00e3o)$/i},\n        shuffle:{selector:'button[data-testid*=\"shuffle\" i], button[aria-label], [role=\"button\"][aria-label], [role=\"switch\"][aria-label]', ids:/shuffle/i,\n            off:/^(enable shuffle|turn shuffle on|activate shuffle|activer (la lecture |le mode |l['\u2019])?al\u00e9atoire|zufallswiedergabe aktivieren|activar (el modo |la reproducci\u00f3n )?aleatori[oa]|ativar (a reprodu\u00e7\u00e3o )?aleat\u00f3ria)$/i,\n            on:/^(disable shuffle|turn shuffle off|deactivate shuffle|d\u00e9sactiver (la lecture |le mode |l['\u2019])?al\u00e9atoire|zufallswiedergabe deaktivieren|desactivar (el modo |la reproducci\u00f3n )?aleatori[oa]|desativar (a reprodu\u00e7\u00e3o )?aleat\u00f3ria)$/i},\n        like:{selector:'[data-testid=\"now-playing-widget\"] button, [data-testid=\"now-playing-bar\"] button, [data-testid=\"now-playing-view\"] button, [data-testid=\"now-playing-panel\"] button, [data-testid=\"now-playing-view\"] [role=\"button\"], [data-testid=\"now-playing-bar\"] [role=\"button\"]', ids:/^(add-button|remove-button|add-to-library-button|remove-from-library-button)$/i,\n            off:/^(save to your library|add to (your )?(liked songs|library)|ajouter (\u00e0|aux) (la biblioth\u00e8que|titres lik\u00e9s)|enregistrer dans (votre |la )?biblioth\u00e8que|in (deine |der )?bibliothek (aufnehmen|hinzuf\u00fcgen)|a\u00f1adir a (tu )?biblioteca|adicionar (\u00e0 biblioteca|aos t\u00edtulos curtidos))$/i,\n            on:/^(remove from (your )?(library|liked songs)|retirer (de la biblioth\u00e8que|des titres lik\u00e9s)|supprimer de (votre |la )?biblioth\u00e8que|aus (deiner |der )?bibliothek entfernen|quitar de (tu )?biblioteca|remover (da biblioteca|dos t\u00edtulos curtidos))$/i}\n    };\n    // Aggregate structure only: fixed testid/role and label categories, never\n    // arbitrary labels or identifiers that could contain a track or account.\n    function structure() {\n        var roots=Array.from(document.querySelectorAll('[data-testid=\"now-playing-bar\"], [data-testid=\"now-playing-widget\"], [data-testid=\"player-controls\"], [data-testid=\"now-playing-view\"], [data-testid=\"now-playing-panel\"]'));\n        var nodes=[];roots.forEach(function(root){Array.from(root.querySelectorAll('button,[role=\"button\"],[role=\"switch\"],[role=\"slider\"],input[type=\"range\"]')).forEach(function(n){if(nodes.indexOf(n)<0)nodes.push(n);});});\n        var st={bar:0,view:0,nodes:Math.min(nodes.length,99),playpause:0,repeat:0,shuffle:0,like:0,queue:0,volume:0,lyrics:0,connect:0,other:0,button:0,switch:0,slider:0,aria_shuffle:0,aria_like:0,aria_play:0,aria_pause:0,aria_other:0};\n        roots.forEach(function(r){if(/^(now-playing-view|now-playing-panel)$/.test(r.getAttribute('data-testid')))st.view++;else st.bar++;});\n        nodes.forEach(function(n){\n            var id=String(n.getAttribute('data-testid')||'').toLowerCase(), label=String(n.getAttribute('aria-label')||'').trim(), role=String(n.getAttribute('role')||'').toLowerCase();\n            var k=/^control-button-playpause$/.test(id)?'playpause':/repeat/.test(id)?'repeat':/shuffle/.test(id)?'shuffle':/^(add-button|remove-button|add-to-library-button|remove-from-library-button)$/.test(id)?'like':/^(queue-button|control-button-queue)$/.test(id)?'queue':/^(volume-bar|volume-slider)$/.test(id)?'volume':/^(lyrics-button|control-button-lyrics)$/.test(id)?'lyrics':/^(connect-button|control-button-connect|connect-device-picker|device-picker)$/.test(id)?'connect':'other';\n            st[k]=Math.min(st[k]+1,99);if(role==='switch')st.switch++;else if(role==='slider'||n.tagName==='INPUT')st.slider++;else st.button++;\n            if(specs.shuffle.off.test(label)||specs.shuffle.on.test(label))st.aria_shuffle++;else if(specs.like.off.test(label)||specs.like.on.test(label))st.aria_like++;else if(/^(play|resume|lire|reprendre)$/i.test(label))st.aria_play++;else if(/^(pause|mettre en pause)$/i.test(label))st.aria_pause++;else if(label)st.aria_other++;\n        });\n        Object.keys(st).forEach(function(k){st[k]=Math.min(st[k],99);});return JSON.stringify(st);\n    }\n    var spec=specs[kind], out={kind:kind==='shuffle'?'shuffle':kind==='like'?'like':kind==='repeat'?'repeat':'unknown',reason:'control',count:0,state:'unknown',label:'unknown',command:'unknown',disabled:false,smart:false,structure:structure()};\n    if(!spec)return JSON.stringify(out);\n    var nodes=Array.from(document.querySelectorAll(spec.selector)).filter(function(b){\n        return b.isConnected && (spec.ids.test(String(b.getAttribute('data-testid')||'')) || spec.off.test(String(b.getAttribute('aria-label')||'').trim()) || spec.on.test(String(b.getAttribute('aria-label')||'').trim()));\n    });\n    out.count=Math.min(nodes.length,2);\n    if(nodes.length!==1){out.reason=nodes.length?'ambiguous':document.readyState==='loading'?'page':'absent';return JSON.stringify(out);}\n    var b=nodes[0], label=String(b.getAttribute('aria-label')||'').trim();\n    out.label=spec.on.test(label)?'on-action':spec.off.test(label)?'off-action':label?'unrecognized':'absent';\n    out.disabled=!!b.disabled || b.getAttribute('aria-disabled')==='true';\n    var raw=b.getAttribute('aria-checked');if(raw===null)raw=b.getAttribute('aria-pressed');\n    out.state=raw==='true'||raw==='false'||(kind!=='like'&&raw==='mixed')?raw:raw===null?(out.label==='on-action'?'true':out.label==='off-action'?'false':'unknown'):'unknown';\n    out.smart=kind==='shuffle' && out.state==='mixed';\n    var id=String(b.getAttribute('data-testid')||'').toLowerCase();\n    var conflict=kind==='like' && ((out.state==='false' && (out.label==='on-action'||/^(remove-button|remove-from-library-button)$/.test(id))) || (out.state==='true' && out.label==='off-action'));\n    var unverified=kind==='like' && out.state==='false' && out.label!=='off-action' && id!=='add-to-library-button';\n    var popup=String(b.getAttribute('aria-haspopup')||'').toLowerCase();\n    if(kind==='like')out.command=popup==='true'||popup==='menu'||popup==='dialog'?'menu':'unspecified';\n    else out.command='toggle';\n    var description=String(b.getAttribute('aria-description')||'').trim();\n    var restricted=kind==='shuffle' && out.disabled && /^(shuffle is not available (with|for) (this account|this playback)|l['\u2019]al\u00e9atoire n['\u2019]est pas disponible avec (ce compte|cette lecture))$/i.test(description);\n    out.reason=restricted?'restriction':out.disabled?'disabled':conflict?'conflict':unverified?'unverified':out.state==='unknown'?'state':'observed';\n    return JSON.stringify(out);\n})\n";
    private static final String JOB = "(function(kind, action, shownState, expectedTitle) {\n    'use strict';\n    // One explicit tap = one job. Methods in order, state re-read after each:\n    // (a) control already in the page, (b) briefly open the now-playing view in\n    // the hidden page and close it again, (c) web-player keyboard shortcut\n    // (shuffle/repeat only: a like is never sent without a verified state).\n    // Never reads storage, cookies or tokens; never navigates; no network.\n    var W = window;\n    var jobs = W.__melodixModeJobs = W.__melodixModeJobs || {};\n    if (['like', 'shuffle', 'repeat'].indexOf(kind) < 0) return JSON.stringify({status: 'done', outcome: 'failed', reason: 'kind'});\n    if (action === 'poll') return JSON.stringify(jobs[kind] || {status: 'none'});\n    if (action !== 'run') return JSON.stringify({status: 'none'});\n    if (jobs[kind] && jobs[kind].status === 'running' && Date.now() - jobs[kind].started < 8000) return JSON.stringify({status: 'busy'});\n    var labels = {\n        like: {\n            off: /^(save to your library|add to (your )?(liked songs|library)|ajouter (\u00e0|aux) (la biblioth\u00e8que|titres lik\u00e9s|vos titres lik\u00e9s)|enregistrer dans (votre |la )?biblioth\u00e8que|in (deine |der )?bibliothek (aufnehmen|hinzuf\u00fcgen)|a\u00f1adir a (tu )?biblioteca|adicionar (\u00e0 biblioteca|aos t\u00edtulos curtidos))$/i,\n            on: /^(remove from (your )?(library|liked songs)|retirer (de la biblioth\u00e8que|des titres lik\u00e9s|de vos titres lik\u00e9s)|supprimer de (votre |la )?biblioth\u00e8que|aus (deiner |der )?bibliothek entfernen|quitar de (tu )?biblioteca|remover (da biblioteca|dos t\u00edtulos curtidos))$/i\n        },\n        repeat: {\n            off: /^(enable repeat|turn repeat on|activer la r\u00e9p\u00e9tition|wiederholung aktivieren|activar repetici\u00f3n|ativar repeti\u00e7\u00e3o)$/i,\n            on: /^(disable repeat|turn repeat off|enable repeat one|d\u00e9sactiver la r\u00e9p\u00e9tition|activer la r\u00e9p\u00e9tition d['\u2019]un titre|wiederholung deaktivieren|desactivar repetici\u00f3n|desativar repeti\u00e7\u00e3o)$/i\n        },\n        shuffle: {\n            off: /^(enable shuffle|turn shuffle on|activate shuffle|activer (la lecture |le mode |l['\u2019])?al\u00e9atoire|zufallswiedergabe aktivieren|activar (el modo |la reproducci\u00f3n )?aleatori[oa]|ativar (a reprodu\u00e7\u00e3o )?aleat\u00f3ria)$/i,\n            on: /^(disable shuffle|turn shuffle off|deactivate shuffle|enable smart shuffle|d\u00e9sactiver (la lecture |le mode |l['\u2019])?al\u00e9atoire|activer la lecture al\u00e9atoire intelligente|zufallswiedergabe deaktivieren|desactivar (el modo |la reproducci\u00f3n )?aleatori[oa]|desativar (a reprodu\u00e7\u00e3o )?aleat\u00f3ria)$/i\n        }\n    };\n    // Neutral names locate a control but never decide its state.\n    var neutral = /^(shuffle|lecture al\u00e9atoire|al\u00e9atoire|repeat|r\u00e9p\u00e9ter|r\u00e9p\u00e9tition)$/i;\n    var ids = {\n        like: /^(add-button|remove-button|add-to-library-button|remove-from-library-button)$/i,\n        repeat: /^control-button-repeat$/i,\n        shuffle: /^control-button-shuffle$|shuffle/i\n    };\n    var job = {status: 'running', started: Date.now(), outcome: '', state: 'unknown', method: '', journal: []};\n    jobs[kind] = job;\n    function log(code) { if (job.journal.length < 16) job.journal.push(code); }\n    function finish(outcome, state, method) { job.status = 'done'; job.outcome = outcome; job.state = state || 'unknown'; job.method = method || ''; }\n    function label(b) { return String(b.getAttribute('aria-label') || '').trim(); }\n    function testid(b) { return String(b.getAttribute('data-testid') || ''); }\n    function find() {\n        var list = Array.from(document.querySelectorAll('button, [role=\"button\"], [role=\"switch\"]')).filter(function(b) {\n            if (!b.isConnected) return false;\n            var l = label(b);\n            return ids[kind].test(testid(b)) || labels[kind].off.test(l) || labels[kind].on.test(l) ||\n                (kind !== 'like' && neutral.test(l) && (kind === 'shuffle' ? /al[\u00e9e]atoire|shuffle/i : /r[\u00e9e]p[\u00e9e]t|repeat/i).test(l));\n        });\n        if (kind === 'like') {\n            var scoped = list.filter(function(b) {\n                return b.closest('[data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-bar\"], [data-testid=\"now-playing-view\"], [data-testid=\"now-playing-panel\"], [data-testid=\"NPV\"], aside');\n            });\n            list = scoped;\n        }\n        if (list.length > 1) {\n            var visible = list.filter(function(b) { var r = b.getBoundingClientRect(); return r.width > 0 && r.height > 0; });\n            if (visible.length === 1) list = visible;\n        }\n        if (!list.length) return {reason: 'absent'};\n        if (list.length !== 1) return {reason: 'ambiguous'};\n        var b = list[0];\n        if (b.disabled || b.getAttribute('aria-disabled') === 'true') return {reason: 'disabled', node: b};\n        return {node: b, reason: ''};\n    }\n    function read(b) {\n        var raw = b.getAttribute('aria-checked');\n        if (raw === null) raw = b.getAttribute('aria-pressed');\n        var l = label(b), on = labels[kind].on.test(l), off = labels[kind].off.test(l);\n        if (raw === 'true' || raw === 'false' || (raw === 'mixed' && kind !== 'like')) {\n            if (kind === 'like' && ((raw === 'false' && on) || (raw === 'true' && off))) return 'unknown';\n            return raw;\n        }\n        return on ? 'true' : off ? 'false' : 'unknown';\n    }\n    function nowTitle() {\n        var link = document.querySelector('[data-testid=\"now-playing-widget\"] a[data-testid=\"context-item-link\"], [data-testid=\"now-playing-bar\"] a[data-testid=\"context-item-link\"], a[data-testid=\"nowplaying-track-link\"], [data-testid=\"now-playing-view\"] a[href*=\"/track/\"]');\n        return link ? String(link.textContent || '').replace(/\\s+/g, ' ').trim() : '';\n    }\n    function opener() {\n        var list = Array.from(document.querySelectorAll('button, [role=\"button\"]')).filter(function(b) {\n            if (!b.isConnected) return false;\n            var id = testid(b), l = label(b);\n            return /^(control-button-npv|now-playing-view-button)$/i.test(id) ||\n                /^(now playing view|show now playing view|hide now playing view|vue \u00ab ?en cours de lecture ?\u00bb|afficher la vue en cours de lecture|masquer la vue en cours de lecture|en cours de lecture|ansicht \u201el\u00e4uft gerade\u201c|vista de reproducci\u00f3n|tela tocando agora)$/i.test(l);\n        });\n        return list.length === 1 ? list[0] : null;\n    }\n    function pressed(b) { return b.getAttribute('aria-pressed') === 'true' || b.getAttribute('aria-expanded') === 'true' || b.getAttribute('data-active') === 'true'; }\n    function wait(test, ms, done) {\n        var end = Date.now() + ms;\n        (function step() {\n            var v;\n            try { v = test(); } catch (_) { v = null; }\n            if (v || Date.now() >= end) { done(v || null); return; }\n            setTimeout(step, 120);\n        })();\n    }\n    // Decide and click on a readable control; verify the change afterwards.\n    function act(found, method, after) {\n        var b = found.node, before = read(b);\n        log(method + ':state-' + before);\n        if (before === 'unknown') { after('state', before); return; }\n        if (kind === 'like') {\n            var title = nowTitle();\n            if (expectedTitle && title && title !== expectedTitle) { log(method + ':identity'); after('identity', before); return; }\n            // A tap can only ADD a like: an existing like is never clicked,\n            // whatever the native button shows. Only a verified 'false' is clicked.\n            if (before !== 'false') { log(method + ':liked-read-only'); after('read', before); return; }\n            if (shownState === 'true') { log(method + ':mismatch'); after('read', before); return; }\n        }\n        try { b.click(); log(method + ':click'); } catch (_) { log(method + ':click-error'); after('command', before); return; }\n        wait(function() {\n            var again = find();\n            if (!again.node) return null;\n            var s = read(again.node);\n            return s !== before && s !== 'unknown' ? s : null;\n        }, 2200, function(s) {\n            if (s) { log(method + ':verified'); after('confirmed', s); }\n            else { log(method + ':unverified'); after('unconfirmed', before); }\n        });\n    }\n    function viaKeyboard() {\n        if (kind === 'like') { log('c:like-skipped'); finish('failed', 'unknown', ''); return; }\n        var spec = kind === 'shuffle' ? {key: 's', code: 'KeyS', keyCode: 83} : {key: 'r', code: 'KeyR', keyCode: 82};\n        // Unverifiable when no control is readable, so only ONE combination per\n        // tap (two could cancel each other). Families alternate across taps.\n        var turns = W.__melodixKeyTurns = W.__melodixKeyTurns || {};\n        var ctrl = !(turns[kind] % 2); turns[kind] = (turns[kind] || 0) + 1;\n        try {\n            var target = document.activeElement && document.activeElement !== document.body ? document.activeElement : document.body;\n            ['keydown', 'keyup'].forEach(function(type) {\n                target.dispatchEvent(new KeyboardEvent(type, {key: spec.key, code: spec.code, keyCode: spec.keyCode, which: spec.keyCode, ctrlKey: ctrl, altKey: !ctrl, bubbles: true, cancelable: true}));\n            });\n            log('c:' + (ctrl ? 'ctrl-' : 'alt-') + spec.key); log('c:single-unreadable');\n            finish('unverified', 'unknown', 'keyboard');\n        } catch (_) { log('c:error'); finish('failed', 'unknown', ''); }\n    }\n    function result(outcome, state, method) {\n        if (outcome === 'confirmed' || outcome === 'unconfirmed' || outcome === 'read') finish(outcome, state, method);\n        else if (outcome === 'identity') finish('identity', 'unknown', method);\n        else finish('failed', state, method);\n    }\n    try {\n        var direct = find();\n        log('a:' + (direct.node ? 'found' : direct.reason));\n        if (direct.node && !direct.reason) { act(direct, 'a', function(o, s) { result(o, s, 'direct'); }); return JSON.stringify({status: 'started'}); }\n        if (direct.reason === 'disabled') { finish('disabled', 'unknown', 'direct'); return JSON.stringify({status: 'started'}); }\n        var view = opener();\n        if (!view) { log('b:no-opener'); viaKeyboard(); return JSON.stringify({status: 'started'}); }\n        var wasOpen = pressed(view);\n        if (!wasOpen) { try { view.click(); log('b:opened'); } catch (_) { log('b:open-error'); } }\n        else log('b:already-open');\n        var closeView = function() {\n            if (!wasOpen) {\n                setTimeout(function() {\n                    var again = opener();\n                    try { if (again && pressed(again)) { again.click(); log('b:closed'); } } catch (_) { log('b:close-error'); }\n                }, 150);\n            }\n        };\n        wait(function() { var f = find(); return f.node && !f.reason ? f : null; }, 1800, function(found) {\n            if (!found) { log('b:absent'); closeView(); viaKeyboard(); return; }\n            log('b:found');\n            act(found, 'b', function(o, s) { closeView(); result(o, s, 'now-playing-view'); });\n        });\n        return JSON.stringify({status: 'started'});\n    } catch (_) {\n        finish('failed', 'unknown', '');\n        return JSON.stringify({status: 'started'});\n    }\n})\n";
    // Only categorical, allowlisted values are ever retained or copied.
    private static final String[] last={"non observé","non observé","non observé"}, before={"aucun appui","aucun appui","aucun appui"}, after={"aucun appui","aucun appui","aucun appui"}, outcome={"aucun appui","aucun appui","aucun appui"};
    private static String structure="non observée";
    private static final String[] methods={"aucune","aucune","aucune"};
    private static String clean(String x){StringBuilder b=new StringBuilder();for(char c:x.toCharArray()){if((c>='a'&&c<='z')||(c>='0'&&c<='9')||c==':'||c=='-'||c==','||c=='>')b.append(c);if(b.length()>160)break;}return b.length()==0?"aucune":b.toString();}
    private static String count(JSONObject o,String k){try{return Integer.toString(Math.max(0,Math.min(99,Integer.parseInt(o.optString(k,"0")))));}catch(Exception ignored){return "0";}}
    private int diagnosticIndex(){return kind.equals("shuffle")?0:kind.equals("like")?1:kind.equals("repeat")?2:-1;}
    private static String allowed(String x,String values){return ("|"+values+"|").contains("|"+x+"|")?x:"unknown";}
    private void remember(JSONObject o){
        int i=diagnosticIndex();if(i<0)return;
        try {
            JSONObject d=new JSONObject(o.optString("diagnostic","{}"));
            JSONObject st=new JSONObject(d.optString("structure","{}"));
            StringBuilder sb=new StringBuilder();String[] keys={"bar","view","nodes","playpause","repeat","shuffle","like","queue","volume","lyrics","connect","other","button","switch","slider","aria_shuffle","aria_like","aria_play","aria_pause","aria_other"};
            for(String key:keys){if(sb.length()>0)sb.append(", ");sb.append(key).append("=").append(count(st,key));}
            structure=sb.toString();
            String value="état="+allowed(d.optString("state","unknown"),"true|false|mixed|unknown")+
                ", motif="+allowed(d.optString("reason","unknown"),"control|page|absent|ambiguous|disabled|restriction|state|conflict|unverified|observed|unknown")+
                ", commande="+allowed(d.optString("command","unknown"),"menu|unspecified|toggle|unknown")+
                ", libellé="+allowed(d.optString("label","unknown"),"on-action|off-action|unrecognized|absent|unknown");
            last[i]=value;if(pending)after[i]=value;
        }catch(Exception ignored){last[i]="observation indisponible";if(pending)after[i]=last[i];}
    }
    private void beginDiagnostic(){int i=diagnosticIndex();if(i>=0){before[i]=last[i];after[i]="en attente d'observation";outcome[i]="en attente";}}
    public static String diagnosticReport(){return "\nAléatoire — actuel : "+last[0]+" ; avant : "+before[0]+" ; après : "+after[0]+" ; résultat : "+outcome[0]+
        "\nLike — actuel : "+last[1]+" ; avant : "+before[1]+" ; après : "+after[1]+" ; résultat : "+outcome[1]+
        "\nRépétition — actuel : "+last[2]+" ; avant : "+before[2]+" ; après : "+after[2]+" ; résultat : "+outcome[2]+
        "\nMéthodes (aléatoire | like | répétition) : "+methods[0]+" | "+methods[1]+" | "+methods[2]+"\nStructure lecteur (comptes seulement ; autres libellés masqués) : "+structure;}
    private final Handler handler = new Handler(Looper.getMainLooper());
    private String kind="", state="unknown", track="", title="", pendingState="", pendingTrack="", reason="web";
    private boolean pending, running, queryInFlight, observedPending;
    private long generation, querySerial, lastTap = -1000, visibleSince, queryStarted;
    private static final long TAP_GUARD_MS = 400, CONFIRM_MS = 7000;
    private String remembered="", rememberedTitle="";
    private void notConfirmed() {
        int i=diagnosticIndex();if(i>=0)outcome[i]="non confirmé";
        boolean keepObserved=kind.equals("shuffle") && observedPending && !state.equals("unknown");
        pending = false; if(!keepObserved)state = "unknown"; reason="confirmation"; generation++; querySerial++; queryInFlight=false; paint();
        if (running && isShown()) Toast.makeText(getContext(), kind.equals("shuffle")?"Aléatoire indisponible, Réessayer":kind.equals("like")?"Impossible d’ajouter aux titres likés, Réessayer":"Action non confirmée. Réessayer", Toast.LENGTH_SHORT).show();
    }
    private final Runnable tick = new Runnable() { public void run() {
        if (!running || !isShown() || getWindowVisibility()!=View.VISIBLE) return;
        paint(); observe(); handler.postDelayed(this, 800);
    }};

    public PreviewPlayerMode(Context c, AttributeSet a) {
        super(c,a); setEnabled(false);
        setOnClickListener(new View.OnClickListener() { public void onClick(View v) { invoke(); }});
    }
    private Activity activity() {
        Context c=getContext();
        for(int i=0;i<8 && c instanceof ContextWrapper;i++) {
            if(c instanceof Activity)return (Activity)c;
            Context next=((ContextWrapper)c).getBaseContext(); if(next==c)break; c=next;
        }
        return c instanceof Activity ? (Activity)c : null;
    }
    private WebView web() {
        Activity a=activity(); if(a==null)return null;
        try { Object w=a.getClass().getField("G").get(a); return w instanceof WebView ? (WebView)w : null; }
        catch(Exception ignored){return null;}
    }
    private String call(String action,String old,String id,String name) {
        return "(function(){var r=JSON.parse(("+SCRIPT+")("+JSONObject.quote(kind)+","+JSONObject.quote(action)+","+JSONObject.quote(old)+","+JSONObject.quote(id)+","+JSONObject.quote(name)+"));r.diagnostic=("+DIAGNOSTIC+")("+JSONObject.quote(kind)+");return JSON.stringify(r);})()";
    }
    private JSONObject parse(String value) {
        try { Object x=new JSONTokener(value).nextValue(); return x instanceof String ? new JSONObject((String)x) : null; }
        catch(Exception ignored){return null;}
    }
    private boolean sameNativeTitle(String candidate) {
        Activity a=activity(); if(a==null || candidate==null || candidate.isEmpty())return false;
        View v=a.findViewById(0x7f09023b);
        return v instanceof TextView && candidate.equals(((TextView)v).getText().toString().trim());
    }
    private void observe() {
        final WebView w=web(); if(w==null){state="unknown";reason="web";paint();return;}
        long now=SystemClock.elapsedRealtime();
        if(queryInFlight && now-queryStarted<2400)return;
        queryInFlight=true;queryStarted=now;
        final long g=generation, serial=++querySerial;
        try { w.evaluateJavascript(call("query","","",""),new ValueCallback<String>() {
            public void onReceiveValue(String value) {
                if(g!=generation || serial!=querySerial || !running || !isShown())return;
                queryInFlight=false;
                JSONObject o=parse(value); if(o!=null)remember(o); String next=o==null?"unknown":o.optString("state","unknown");
                String nextTrack=o==null?"":o.optString("track",""); String nextTitle=o==null?"":o.optString("title","");
                String nextReason=o==null?"web":o.optString("reason","state");
                if(!next.equals("true")&&!next.equals("false")&&!next.equals("mixed"))next="unknown";
                if(kind.equals("like") && !next.equals("unknown") && (!sameNativeTitle(nextTitle) || nextTrack.isEmpty() || next.equals("mixed"))){next="unknown";nextReason="identity";}
                if(pending)observedPending=true;
                if(pending && ((!next.equals("unknown") && !next.equals(pendingState)) ||
                   (kind.equals("like") && !nextTrack.isEmpty() && !nextTrack.equals(pendingTrack)))) { int i=diagnosticIndex();if(i>=0)outcome[i]=kind.equals("like")&&!nextTrack.equals(pendingTrack)?"piste changée":"changement observé";pending=false; }
                if(next.equals("unknown") && !remembered.isEmpty() && (nextReason.equals("control")||nextReason.equals("absent")||nextReason.equals("ambiguous")||nextReason.equals("state")) &&
                   (!kind.equals("like") || rememberedTitle.equals(nativeTitle()))) {next=remembered;nextReason="remembered";}
                else if(kind.equals("like") && !rememberedTitle.equals(nativeTitle())){remembered="";rememberedTitle="";}
                state=next;track=nextTrack;title=nextTitle;reason=nextReason;paint();
            }
        }); } catch(RuntimeException e) {queryInFlight=false;state="unknown";reason="web";paint();}
    }
    private void shake() {
        if(Build.VERSION.SDK_INT>=26 && !ValueAnimator.areAnimatorsEnabled())return;
        final float shift=4*getResources().getDisplayMetrics().density;
        animate().cancel();
        animate().translationX(shift).setDuration(70).withEndAction(new Runnable(){public void run(){
            animate().translationX(0).setDuration(70).start();
        }}).start();
    }
    private String nativeTitle() {
        Activity a=activity(); if(a==null)return "";
        View v=a.findViewById(0x7f09023b);
        return v instanceof TextView ? ((TextView)v).getText().toString().trim() : "";
    }
    private String job(String action,String shown) {
        return "("+JOB+")("+JSONObject.quote(kind)+","+JSONObject.quote(action)+","+JSONObject.quote(shown)+","+JSONObject.quote(nativeTitle())+");";
    }
    private boolean tappable() {
        return reason.equals("control")||reason.equals("absent")||reason.equals("ambiguous")||reason.equals("state")||reason.equals("confirmation")||
            reason.equals("unverified")||reason.equals("identity")||reason.equals("remembered")||reason.equals("observed")||reason.equals("conflict")||reason.equals("menu");
    }
    private void invoke() {
        long t=SystemClock.elapsedRealtime();
        if(!running || !isShown() || getWindowVisibility()!=View.VISIBLE || pending || t-lastTap<TAP_GUARD_MS)return;
        if(state.equals("unknown") && !tappable()) {
            beginDiagnostic();int i=diagnosticIndex();if(i>=0)outcome[i]="non envoyé : "+reason;
            lastTap=t;performHapticFeedback(HapticFeedbackConstants.KEYBOARD_TAP);shake();
            Toast.makeText(getContext(),reason.equals("bar")?"Lance un titre pour utiliser ce bouton":reasonText(),Toast.LENGTH_SHORT).show();
            return;
        }
        final WebView w=web();if(w==null){state="unknown";reason="web";paint();return;}
        lastTap=t; beginDiagnostic(); final String shown=state; pending=true;observedPending=false;
        pendingState=shown;pendingTrack=track;final long g=++generation;querySerial++;queryInFlight=false;paint();performHapticFeedback(HapticFeedbackConstants.KEYBOARD_TAP);
        handler.postDelayed(new Runnable(){public void run(){
            if(g==generation && pending) notConfirmed();
        }},CONFIRM_MS);
        try {w.evaluateJavascript(job("run",shown),new ValueCallback<String>() {
            public void onReceiveValue(String value){
                if(g!=generation || !pending)return; JSONObject o=parse(value);
                String status=o==null?"":o.optString("status","");
                if(status.equals("started")||status.equals("busy"))poll(g,0); else notConfirmed();
            }
        });} catch(RuntimeException e){notConfirmed();}
    }
    private void poll(final long g,final int n) {
        if(n>26){if(g==generation && pending)notConfirmed();return;}
        handler.postDelayed(new Runnable(){public void run(){
            if(g!=generation || !pending)return;
            WebView w=web(); if(w==null){notConfirmed();return;}
            try {w.evaluateJavascript(job("poll",pendingState),new ValueCallback<String>(){
                public void onReceiveValue(String value){
                    if(g!=generation || !pending)return; JSONObject o=parse(value);
                    if(o==null || !o.optString("status","").equals("done")){poll(g,n+1);return;}
                    finishJob(o);
                }
            });} catch(RuntimeException e){notConfirmed();}
        }},250);
    }
    private void finishJob(JSONObject o) {
        String result=allowed(o.optString("outcome","failed"),"confirmed|unconfirmed|unverified|read|identity|disabled|failed");
        String next=allowed(o.optString("state","unknown"),"true|false|mixed|unknown");
        String method=allowed(o.optString("method",""),"direct|now-playing-view|keyboard|unknown");
        int i=diagnosticIndex();
        if(i>=0){methods[i]="méthode="+(method.isEmpty()?"aucune":method)+", résultat="+result+", étapes="+clean(o.optString("journal",""));outcome[i]=result;}
        pending=false;generation++;querySerial++;queryInFlight=false;
        if((result.equals("confirmed")||result.equals("read")) && !next.equals("unknown")) {
            state=next;reason="observed";remembered=next;rememberedTitle=kind.equals("like")?nativeTitle():"";paint();
            if(result.equals("read") && kind.equals("like"))Toast.makeText(getContext(),next.equals("true")?"Déjà dans vos titres likés":"Pas encore dans vos titres likés",Toast.LENGTH_SHORT).show();
            return;
        }
        state="unknown";
        if(result.equals("unverified")){reason="unverified";paint();Toast.makeText(getContext(),"Commande envoyée, état non vérifiable",Toast.LENGTH_SHORT).show();return;}
        if(result.equals("identity")){reason="identity";paint();Toast.makeText(getContext(),"Titre en cours différent, Réessayer",Toast.LENGTH_SHORT).show();return;}
        if(result.equals("disabled")){reason="disabled";paint();Toast.makeText(getContext(),reasonText(),Toast.LENGTH_SHORT).show();return;}
        if(result.equals("unconfirmed")){reason="confirmation";paint();Toast.makeText(getContext(),"Action non confirmée. Réessayer",Toast.LENGTH_SHORT).show();return;}
        reason="control";paint();
        Toast.makeText(getContext(),kind.equals("shuffle")?"Aléatoire indisponible, Réessayer":kind.equals("like")?"Like indisponible, Réessayer":"Répétition indisponible, Réessayer",Toast.LENGTH_SHORT).show();
    }
    private int drawable(String name){return getResources().getIdentifier(name,"drawable",getContext().getPackageName());}
    private String reasonText() {
        if(reason.equals("page"))return "page Spotify en cours de chargement";
        if(reason.equals("bar"))return "barre du lecteur Spotify absente ; lancer un titre";
        if(reason.equals("control"))return "contrôle Spotify non reconnu ou absent";
        if(reason.equals("ambiguous"))return "plusieurs contrôles possibles";
        if(reason.equals("restriction"))return "L’aléatoire n’est pas disponible avec ce compte ou cette lecture";
        if(reason.equals("disabled"))return "contrôle Spotify désactivé";
        if(reason.equals("menu"))return "menu de bibliothèque non vérifié";
        if(reason.equals("conflict"))return "état et action du contrôle contradictoires";
        if(reason.equals("unverified"))return "action d’ajout non vérifiée";
        if(reason.equals("identity"))return "titre ou identité non confirmé";
        if(reason.equals("remembered"))return "dernier état lu";
        if(reason.equals("unverified"))return "commande envoyée, état non vérifiable";
        if(reason.equals("command"))return "commande indisponible";
        if(reason.equals("confirmation"))return "action non confirmée";
        if(reason.equals("web"))return "page Spotify ou réponse non accessible";
        return "état ou langue non reconnu";
    }
    private void paint() {
        boolean known=!state.equals("unknown");
        String shown=state;
        if(kind.equals("shuffle") && pending)shown=pendingState.equals("false")?"true":pendingState.equals("true")?"false":"unknown";
        boolean active=shown.equals("true")||shown.equals("mixed");
        String icon,desc;
        if(kind.equals("like")){icon=active?"favon":"favoff";desc=!known?"Like indisponible":active?"Titre aimé":"Ajouter aux titres likés";}
        else if(kind.equals("shuffle")){icon=shown.equals("mixed")?"smart_shuffle":"shuffle";desc=shown.equals("unknown")?"Aléatoire : état inconnu":active?"Lecture aléatoire activée":"Lecture aléatoire désactivée";}
        else {icon=state.equals("mixed")?"repone":active?"repon":"repoff";desc=!known?"Répétition indisponible":state.equals("mixed")?"Répéter le titre":active?"Répéter la liste":"Répétition désactivée";}
        boolean loading=running && !known && SystemClock.elapsedRealtime()-visibleSince<2400;
        int id=loading?android.R.drawable.ic_popup_sync:drawable(icon);if(id!=0)setImageResource(id);
        boolean tap=running && !known && tappable() && !loading;
        if(!known && tap)desc="État inconnu : touchez pour essayer ("+(kind.equals("like")?"Like":kind.equals("shuffle")?"Aléatoire":"Répétition")+")";
        else if(!known)desc=(loading?"Chargement : ":"Indisponible : ")+reasonText()+" ("+(kind.equals("like")?"Like":kind.equals("shuffle")?"Aléatoire":"Répétition")+")"+(kind.equals("shuffle")?" ; nécessite un contrôle et un état Spotify reconnus":"");
        setColorFilter(active?0xffe0489e:0xffc9c0ea);setContentDescription(pending?desc+", en attente":desc);
        setEnabled((known||tap)&&!pending); setAlpha(tap?0.8f:kind.equals("like")?(pending?0.65f:known?1f:0.35f):!known?(loading?0.65f:0.35f):pending?0.65f:1.0f);invalidate();
    }
    private void sync() {
        boolean visible=isAttachedToWindow() && isShown() && getWindowVisibility()==View.VISIBLE;
        if(visible && !running){running=true;visibleSince=SystemClock.elapsedRealtime();reason="web";paint();handler.post(tick);}
        else if(!visible && running){running=false;handler.removeCallbacks(tick);generation++;querySerial++;queryInFlight=false;pending=false;state="unknown";paint();}
    }
    @Override protected void onAttachedToWindow(){super.onAttachedToWindow();Object t=getTag();kind=t==null?"":t.toString();paint();sync();}
    @Override protected void onDetachedFromWindow(){running=false;handler.removeCallbacks(tick);generation++;querySerial++;queryInFlight=false;pending=false;state="unknown";paint();super.onDetachedFromWindow();}
    @Override protected void onVisibilityChanged(View changed,int visibility){super.onVisibilityChanged(changed,visibility);if(handler!=null)post(new Runnable(){public void run(){sync();}});}
    @Override protected void onWindowVisibilityChanged(int visibility){super.onWindowVisibilityChanged(visibility);if(handler!=null)post(new Runnable(){public void run(){sync();}});}
}
