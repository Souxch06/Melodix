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
    private static final String SCRIPT = "(function(kind, action, expectedState, expectedTrack, expectedTitle) {\n    'use strict';\n    // Passive inspection of controls already in the page. A tap can only click\n    // a uniquely identified real control, after state/identity revalidation.\n    var labels = {\n        like: {\n            off: /^(save to your library|add to (your )?(liked songs|library)|ajouter (\u00e0|aux) (la biblioth\u00e8que|titres lik\u00e9s)|enregistrer dans (votre |la )?biblioth\u00e8que|in (deine |der )?bibliothek (aufnehmen|hinzuf\u00fcgen)|a\u00f1adir a (tu )?biblioteca|adicionar (\u00e0 biblioteca|aos t\u00edtulos curtidos))$/i,\n            on: /^(remove from (your )?(library|liked songs)|retirer (de la biblioth\u00e8que|des titres lik\u00e9s)|supprimer de (votre |la )?biblioth\u00e8que|aus (deiner |der )?bibliothek entfernen|quitar de (tu )?biblioteca|remover (da biblioteca|dos t\u00edtulos curtidos))$/i\n        },\n        shuffle: {\n            off: /^(enable shuffle|turn shuffle on|activate shuffle|activer (la lecture |le mode |l['\u2019])?al\u00e9atoire|zufallswiedergabe aktivieren|activar (el modo |la reproducci\u00f3n )?aleatori[oa]|ativar (a reprodu\u00e7\u00e3o )?aleat\u00f3ria)$/i,\n            on: /^(disable shuffle|turn shuffle off|deactivate shuffle|d\u00e9sactiver (la lecture |le mode |l['\u2019])?al\u00e9atoire|zufallswiedergabe deaktivieren|desactivar (el modo |la reproducci\u00f3n )?aleatori[oa]|desativar (a reprodu\u00e7\u00e3o )?aleat\u00f3ria)$/i\n        }\n    };\n    if (['like','shuffle','repeat'].indexOf(kind) < 0) return JSON.stringify({state:'unknown',reason:'control'});\n    var selector = kind === 'like' ?\n        '[data-testid=\"now-playing-widget\"] button, [data-testid=\"now-playing-bar\"] button, [data-testid=\"now-playing-view\"] button, [data-testid=\"now-playing-panel\"] button, [data-testid=\"now-playing-view\"] [role=\"button\"], [data-testid=\"now-playing-bar\"] [role=\"button\"]' :\n        kind === 'shuffle' ? 'button[data-testid*=\"shuffle\" i], button[aria-label], [role=\"button\"][aria-label], [role=\"switch\"][aria-label]' :\n        'button[data-testid=\"control-button-repeat\"]';\n    var nodes = Array.from(document.querySelectorAll(selector)).filter(function(b) {\n        if (!b.isConnected) return false;\n        if (kind === 'repeat') return true;\n        var id=String(b.getAttribute('data-testid')||'').toLowerCase();\n        var label=String(b.getAttribute('aria-label')||'').trim();\n        if (kind === 'like') return /^(add-button|remove-button|add-to-library-button|remove-from-library-button)$/.test(id) || labels.like.off.test(label) || labels.like.on.test(label);\n        return /shuffle/.test(id) || labels.shuffle.off.test(label) || labels.shuffle.on.test(label);\n    });\n    var result={state:'unknown',track:'',title:'',reason:'control',sent:false};\n    if (!nodes.length) {\n        result.reason = document.readyState === 'loading' ? 'page' : (kind === 'shuffle' && !document.querySelector('[data-testid=\"now-playing-bar\"], [data-testid=\"now-playing-widget\"], [data-testid=\"player-controls\"]') ? 'bar' : 'control');\n        return JSON.stringify(result);\n    }\n    if (nodes.length !== 1) {result.reason='ambiguous';return JSON.stringify(result);}\n    var button=nodes[0];\n    if (button.disabled || button.getAttribute('aria-disabled') === 'true') {\n        var description=String(button.getAttribute('aria-description')||'').trim();\n        result.reason=kind==='shuffle' && /^(shuffle is not available (with|for) (this account|this playback)|l['\u2019]al\u00e9atoire n['\u2019]est pas disponible avec (ce compte|cette lecture))$/i.test(description)?'restriction':'disabled';\n        return JSON.stringify(result);\n    }\n    if (kind === 'like' && /^(true|menu|dialog)$/i.test(String(button.getAttribute('aria-haspopup')||''))) {result.reason='menu';return JSON.stringify(result);}\n    var raw=button.getAttribute('aria-checked');\n    if (raw === null) raw=button.getAttribute('aria-pressed');\n    var label=String(button.getAttribute('aria-label')||'').trim();\n    if (raw === null) {\n        raw=kind !== 'repeat' && labels[kind].on.test(label) ? 'true' :\n            kind !== 'repeat' && labels[kind].off.test(label) ? 'false' : 'unknown';\n    } else if (raw !== 'true' && raw !== 'false' && !(kind !== 'like' && raw === 'mixed')) raw='unknown';\n    if (kind === 'like') {\n        var bar=button.closest('[data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-bar\"]');\n        if (!bar) bar=document.querySelector('[data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-bar\"]');\n        var link=bar && bar.querySelector('a[data-testid=\"context-item-link\"], a[data-testid=\"nowplaying-track-link\"]');\n        result.title=link ? String(link.textContent||'').trim() : '';\n        var href=link ? String(link.getAttribute('href')||'') : '';\n        var match=/^\\/(track|episode)\\/([a-z0-9]+)(?:[?#].*)?$/i.exec(href);\n        result.track=match ? match[1].toLowerCase()+':'+match[2] : '';\n        if (!result.track || !result.title) {result.reason='identity';return JSON.stringify(result);}\n    }\n    if (raw === 'unknown') {result.reason='state';return JSON.stringify(result);}\n    if (kind === 'repeat' && typeof window.actRepeat !== 'function') {result.reason='command';return JSON.stringify(result);}\n    if (typeof button.click !== 'function') {result.reason='command';return JSON.stringify(result);}\n    result.state=raw;result.reason='';\n    if (action === 'query') return JSON.stringify(result);\n    if (action !== 'invoke' || raw !== expectedState ||\n        (kind === 'like' && (raw !== 'false' || result.track !== expectedTrack || result.title !== expectedTitle))) return JSON.stringify({sent:false});\n    try {\n        // Use the exact revalidated button; never call a legacy helper that\n        // schedules playback-related work. Never click an already-liked item.\n        if (kind === 'repeat') window.actRepeat();\n        else button.click();\n        return JSON.stringify({sent:true});\n    } catch (_) { return JSON.stringify({sent:false}); }\n})\n";
    private static final String DIAGNOSTIC = "(function(kind) {\n    'use strict';\n    // Passive, bounded, allowlisted observations only. No account, track or\n    // arbitrary page text is returned. This probe does not click or send data.\n    var specs={\n        shuffle:{selector:'button[data-testid*=\"shuffle\" i], button[aria-label], [role=\"button\"][aria-label], [role=\"switch\"][aria-label]', ids:/shuffle/i,\n            off:/^(enable shuffle|turn shuffle on|activate shuffle|activer (la lecture |le mode |l['\u2019])?al\u00e9atoire|zufallswiedergabe aktivieren|activar (el modo |la reproducci\u00f3n )?aleatori[oa]|ativar (a reprodu\u00e7\u00e3o )?aleat\u00f3ria)$/i,\n            on:/^(disable shuffle|turn shuffle off|deactivate shuffle|d\u00e9sactiver (la lecture |le mode |l['\u2019])?al\u00e9atoire|zufallswiedergabe deaktivieren|desactivar (el modo |la reproducci\u00f3n )?aleatori[oa]|desativar (a reprodu\u00e7\u00e3o )?aleat\u00f3ria)$/i},\n        like:{selector:'[data-testid=\"now-playing-widget\"] button, [data-testid=\"now-playing-bar\"] button, [data-testid=\"now-playing-view\"] button, [data-testid=\"now-playing-panel\"] button, [data-testid=\"now-playing-view\"] [role=\"button\"], [data-testid=\"now-playing-bar\"] [role=\"button\"]', ids:/^(add-button|remove-button|add-to-library-button|remove-from-library-button)$/i,\n            off:/^(save to your library|add to (your )?(liked songs|library)|ajouter (\u00e0|aux) (la biblioth\u00e8que|titres lik\u00e9s)|enregistrer dans (votre |la )?biblioth\u00e8que|in (deine |der )?bibliothek (aufnehmen|hinzuf\u00fcgen)|a\u00f1adir a (tu )?biblioteca|adicionar (\u00e0 biblioteca|aos t\u00edtulos curtidos))$/i,\n            on:/^(remove from (your )?(library|liked songs)|retirer (de la biblioth\u00e8que|des titres lik\u00e9s)|supprimer de (votre |la )?biblioth\u00e8que|aus (deiner |der )?bibliothek entfernen|quitar de (tu )?biblioteca|remover (da biblioteca|dos t\u00edtulos curtidos))$/i}\n    };\n    // Aggregate structure only: fixed testid/role and label categories, never\n    // arbitrary labels or identifiers that could contain a track or account.\n    function structure() {\n        var roots=Array.from(document.querySelectorAll('[data-testid=\"now-playing-bar\"], [data-testid=\"now-playing-widget\"], [data-testid=\"player-controls\"], [data-testid=\"now-playing-view\"], [data-testid=\"now-playing-panel\"]'));\n        var nodes=[];roots.forEach(function(root){Array.from(root.querySelectorAll('button,[role=\"button\"],[role=\"switch\"],[role=\"slider\"],input[type=\"range\"]')).forEach(function(n){if(nodes.indexOf(n)<0)nodes.push(n);});});\n        var st={bar:0,view:0,nodes:Math.min(nodes.length,99),playpause:0,repeat:0,shuffle:0,like:0,queue:0,volume:0,lyrics:0,connect:0,other:0,button:0,switch:0,slider:0,aria_shuffle:0,aria_like:0,aria_play:0,aria_pause:0,aria_other:0};\n        roots.forEach(function(r){if(/^(now-playing-view|now-playing-panel)$/.test(r.getAttribute('data-testid')))st.view++;else st.bar++;});\n        nodes.forEach(function(n){\n            var id=String(n.getAttribute('data-testid')||'').toLowerCase(), label=String(n.getAttribute('aria-label')||'').trim(), role=String(n.getAttribute('role')||'').toLowerCase();\n            var k=/^control-button-playpause$/.test(id)?'playpause':/repeat/.test(id)?'repeat':/shuffle/.test(id)?'shuffle':/^(add-button|remove-button|add-to-library-button|remove-from-library-button)$/.test(id)?'like':/^(queue-button|control-button-queue)$/.test(id)?'queue':/^(volume-bar|volume-slider)$/.test(id)?'volume':/^(lyrics-button|control-button-lyrics)$/.test(id)?'lyrics':/^(connect-button|control-button-connect|connect-device-picker|device-picker)$/.test(id)?'connect':'other';\n            st[k]=Math.min(st[k]+1,99);if(role==='switch')st.switch++;else if(role==='slider'||n.tagName==='INPUT')st.slider++;else st.button++;\n            if(specs.shuffle.off.test(label)||specs.shuffle.on.test(label))st.aria_shuffle++;else if(specs.like.off.test(label)||specs.like.on.test(label))st.aria_like++;else if(/^(play|resume|lire|reprendre)$/i.test(label))st.aria_play++;else if(/^(pause|mettre en pause)$/i.test(label))st.aria_pause++;else if(label)st.aria_other++;\n        });\n        Object.keys(st).forEach(function(k){st[k]=Math.min(st[k],99);});return JSON.stringify(st);\n    }\n    var spec=specs[kind], out={kind:kind==='shuffle'?'shuffle':kind==='like'?'like':'unknown',reason:'control',count:0,state:'unknown',label:'unknown',command:'unknown',disabled:false,smart:false,structure:structure()};\n    if(!spec)return JSON.stringify(out);\n    var nodes=Array.from(document.querySelectorAll(spec.selector)).filter(function(b){\n        return b.isConnected && (spec.ids.test(String(b.getAttribute('data-testid')||'')) || spec.off.test(String(b.getAttribute('aria-label')||'').trim()) || spec.on.test(String(b.getAttribute('aria-label')||'').trim()));\n    });\n    out.count=Math.min(nodes.length,2);\n    if(nodes.length!==1){out.reason=nodes.length?'ambiguous':document.readyState==='loading'?'page':'absent';return JSON.stringify(out);}\n    var b=nodes[0], label=String(b.getAttribute('aria-label')||'').trim();\n    out.label=spec.on.test(label)?'on-action':spec.off.test(label)?'off-action':label?'unrecognized':'absent';\n    out.disabled=!!b.disabled || b.getAttribute('aria-disabled')==='true';\n    var raw=b.getAttribute('aria-checked');if(raw===null)raw=b.getAttribute('aria-pressed');\n    out.state=raw==='true'||raw==='false'||(kind==='shuffle'&&raw==='mixed')?raw:raw===null?(out.label==='on-action'?'true':out.label==='off-action'?'false':'unknown'):'unknown';\n    out.smart=kind==='shuffle' && out.state==='mixed';\n    var popup=String(b.getAttribute('aria-haspopup')||'').toLowerCase();\n    if(kind==='like')out.command=popup==='true'||popup==='menu'||popup==='dialog'?'menu':'unspecified';\n    else out.command='toggle';\n    var description=String(b.getAttribute('aria-description')||'').trim();\n    var restricted=kind==='shuffle' && out.disabled && /^(shuffle is not available (with|for) (this account|this playback)|l['\u2019]al\u00e9atoire n['\u2019]est pas disponible avec (ce compte|cette lecture))$/i.test(description);\n    out.reason=restricted?'restriction':out.disabled?'disabled':out.state==='unknown'?'state':'observed';\n    return JSON.stringify(out);\n})\n";
    // Only categorical, allowlisted values are ever retained or copied.
    private static final String[] last={"non observé","non observé"}, before={"aucun appui","aucun appui"}, after={"aucun appui","aucun appui"}, outcome={"aucun appui","aucun appui"};
    private static String structure="non observée";
    private static String count(JSONObject o,String k){try{return Integer.toString(Math.max(0,Math.min(99,Integer.parseInt(o.optString(k,"0")))));}catch(Exception ignored){return "0";}}
    private int diagnosticIndex(){return kind.equals("shuffle")?0:kind.equals("like")?1:-1;}
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
                ", motif="+allowed(d.optString("reason","unknown"),"control|page|absent|ambiguous|disabled|restriction|state|observed|unknown")+
                ", commande="+allowed(d.optString("command","unknown"),"menu|unspecified|toggle|unknown")+
                ", libellé="+allowed(d.optString("label","unknown"),"on-action|off-action|unrecognized|absent|unknown");
            last[i]=value;if(pending)after[i]=value;
        }catch(Exception ignored){last[i]="observation indisponible";if(pending)after[i]=last[i];}
    }
    private void beginDiagnostic(){int i=diagnosticIndex();if(i>=0){before[i]=last[i];after[i]="en attente d'observation";outcome[i]="en attente";}}
    public static String diagnosticReport(){return "\nAléatoire — actuel : "+last[0]+" ; avant : "+before[0]+" ; après : "+after[0]+" ; résultat : "+outcome[0]+
        "\nLike — actuel : "+last[1]+" ; avant : "+before[1]+" ; après : "+after[1]+" ; résultat : "+outcome[1]+"\nStructure lecteur (comptes seulement ; autres libellés masqués) : "+structure;}
    private final Handler handler = new Handler(Looper.getMainLooper());
    private String kind="", state="unknown", track="", title="", pendingState="", pendingTrack="", reason="web";
    private boolean pending, running, queryInFlight, observedPending;
    private long generation, querySerial, lastTap = -1000, visibleSince, queryStarted;
    private static final long TAP_GUARD_MS = 400, CONFIRM_MS = 5000;
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
    private void invoke() {
        long t=SystemClock.elapsedRealtime();
        if(!running || !isShown() || getWindowVisibility()!=View.VISIBLE || pending || t-lastTap<TAP_GUARD_MS)return;
        if(state.equals("unknown")) {
            beginDiagnostic();int i=diagnosticIndex();if(i>=0)outcome[i]="non envoyé";
            if(kind.equals("shuffle")) {lastTap=t;performHapticFeedback(HapticFeedbackConstants.KEYBOARD_TAP);shake();
                Toast.makeText(getContext(),reason.equals("bar")?"Lance un titre pour activer l’aléatoire":"Aléatoire indisponible, Réessayer",Toast.LENGTH_SHORT).show();}
            return;
        }
        if(kind.equals("like") && (state.equals("true") || !sameNativeTitle(title)))return;
        final WebView w=web();if(w==null){state="unknown";reason="web";paint();return;}
        lastTap=t; beginDiagnostic(); final String old=state,id=track,name=title; pending=true;observedPending=false;
        pendingState=old;pendingTrack=id;final long g=++generation;querySerial++;queryInFlight=false;paint();performHapticFeedback(HapticFeedbackConstants.KEYBOARD_TAP);
        handler.postDelayed(new Runnable(){public void run(){
            if(g==generation && pending) notConfirmed();
        }},CONFIRM_MS);
        try {w.evaluateJavascript(call("invoke",old,id,name),new ValueCallback<String>() {
            public void onReceiveValue(String value){
                if(g!=generation || !pending)return; JSONObject o=parse(value);
                if(o==null || !o.optBoolean("sent",false)) notConfirmed();
            }
        });} catch(RuntimeException e){notConfirmed();}
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
        if(reason.equals("identity"))return "titre ou identité non confirmé";
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
        if(!known)desc=(loading?"Chargement : ":"Indisponible : ")+reasonText()+" ("+(kind.equals("like")?"Like":kind.equals("shuffle")?"Aléatoire":"Répétition")+")"+(kind.equals("shuffle")?" ; nécessite un contrôle et un état Spotify reconnus":"");
        setColorFilter(active?0xffe0489e:0xffc9c0ea);setContentDescription(pending?desc+", en attente":desc);
        setEnabled((known || (kind.equals("shuffle") && running && !reason.equals("restriction")))&&!pending); setAlpha(kind.equals("like")?(pending?0.65f:known?1f:0.35f):!known?(loading?0.65f:0.35f):pending?0.65f:1.0f);invalidate();
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
