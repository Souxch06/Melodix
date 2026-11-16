package com.melodix.music;

import android.app.Activity;
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
    private static final String SCRIPT = "(function(kind, action, expectedState, expectedTrack, expectedTitle) {\n    'use strict';\n    // Passive inspection of controls already in the page. A tap can only click\n    // a uniquely identified real control, after state/identity revalidation.\n    var labels = {\n        like: {\n            off: /^(save to your library|add to (your )?(liked songs|library)|ajouter (\u00e0|aux) (la biblioth\u00e8que|titres lik\u00e9s)|enregistrer dans (votre |la )?biblioth\u00e8que|in (deine |der )?bibliothek (aufnehmen|hinzuf\u00fcgen)|a\u00f1adir a (tu )?biblioteca|adicionar (\u00e0 biblioteca|aos t\u00edtulos curtidos))$/i,\n            on: /^(remove from (your )?(library|liked songs)|retirer (de la biblioth\u00e8que|des titres lik\u00e9s)|supprimer de (votre |la )?biblioth\u00e8que|aus (deiner |der )?bibliothek entfernen|quitar de (tu )?biblioteca|remover (da biblioteca|dos t\u00edtulos curtidos))$/i\n        },\n        shuffle: {\n            off: /^(enable shuffle|turn shuffle on|activate shuffle|activer (la lecture )?al\u00e9atoire|zufallswiedergabe aktivieren|activar (el modo |la reproducci\u00f3n )?aleatori[oa]|ativar (a reprodu\u00e7\u00e3o )?aleat\u00f3ria)$/i,\n            on: /^(disable shuffle|turn shuffle off|deactivate shuffle|d\u00e9sactiver (la lecture )?al\u00e9atoire|zufallswiedergabe deaktivieren|desactivar (el modo |la reproducci\u00f3n )?aleatori[oa]|desativar (a reprodu\u00e7\u00e3o )?aleat\u00f3ria)$/i\n        }\n    };\n    if (['like','shuffle','repeat'].indexOf(kind) < 0) return JSON.stringify({state:'unknown',reason:'control'});\n    var selector = kind === 'like' ?\n        '[data-testid=\"now-playing-widget\"] button, [data-testid=\"now-playing-bar\"] button' :\n        kind === 'shuffle' ? 'button[data-testid*=\"shuffle\" i], button[aria-label]' :\n        'button[data-testid=\"control-button-repeat\"]';\n    var nodes = Array.from(document.querySelectorAll(selector)).filter(function(b) {\n        if (!b.isConnected) return false;\n        if (kind === 'repeat') return true;\n        var id=String(b.getAttribute('data-testid')||'').toLowerCase();\n        var label=String(b.getAttribute('aria-label')||'').trim();\n        if (kind === 'like') return /^(add-button|remove-button|add-to-library-button|remove-from-library-button)$/.test(id) || labels.like.off.test(label) || labels.like.on.test(label);\n        return /shuffle/.test(id) || labels.shuffle.off.test(label) || labels.shuffle.on.test(label);\n    });\n    var result={state:'unknown',track:'',title:'',reason:'control',sent:false};\n    if (!nodes.length) {\n        result.reason = document.readyState === 'loading' ? 'page' : 'control';\n        return JSON.stringify(result);\n    }\n    if (nodes.length !== 1) {result.reason='ambiguous';return JSON.stringify(result);}\n    var button=nodes[0];\n    if (button.disabled || button.getAttribute('aria-disabled') === 'true') {result.reason='disabled';return JSON.stringify(result);}\n    var raw=button.getAttribute('aria-checked');\n    if (raw === null) raw=button.getAttribute('aria-pressed');\n    var label=String(button.getAttribute('aria-label')||'').trim();\n    if (raw === null) {\n        raw=kind !== 'repeat' && labels[kind].on.test(label) ? 'true' :\n            kind !== 'repeat' && labels[kind].off.test(label) ? 'false' : 'unknown';\n    } else if (raw !== 'true' && raw !== 'false' && !(kind !== 'like' && raw === 'mixed')) raw='unknown';\n    if (kind === 'like') {\n        var bar=button.closest('[data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-bar\"]');\n        var link=bar && bar.querySelector('a[data-testid=\"context-item-link\"], a[data-testid=\"nowplaying-track-link\"]');\n        result.title=link ? String(link.textContent||'').trim() : '';\n        var href=link ? String(link.getAttribute('href')||'') : '';\n        var match=/^\\/(track|episode)\\/([a-z0-9]+)(?:[?#].*)?$/i.exec(href);\n        result.track=match ? match[1].toLowerCase()+':'+match[2] : '';\n        if (!result.track || !result.title) {result.reason='identity';return JSON.stringify(result);}\n    }\n    if (raw === 'unknown') {result.reason='state';return JSON.stringify(result);}\n    if (kind === 'repeat' && typeof window.actRepeat !== 'function') {result.reason='command';return JSON.stringify(result);}\n    if (typeof button.click !== 'function') {result.reason='command';return JSON.stringify(result);}\n    result.state=raw;result.reason='';\n    if (action === 'query') return JSON.stringify(result);\n    if (action !== 'invoke' || raw !== expectedState ||\n        (kind === 'like' && (result.track !== expectedTrack || result.title !== expectedTitle))) return JSON.stringify({sent:false});\n    try {\n        // Keep legacy commands when their exact target is known. Other recognized\n        // controls use the same explicit button click a user could make in Spotify.\n        var legacyLike=document.querySelector('div[data-testid=\"now-playing-widget\"]>div:last-child>button');\n        if (kind === 'like' && legacyLike === button && typeof window.actAddToFav === 'function') window.actAddToFav();\n        else if (kind === 'shuffle' && button.matches('button[data-testid=\"control-button-shuffle\"]') && typeof window.actShuffle === 'function') window.actShuffle();\n        else if (kind === 'repeat') window.actRepeat();\n        else button.click();\n        return JSON.stringify({sent:true});\n    } catch (_) { return JSON.stringify({sent:false}); }\n})\n";
    private final Handler handler = new Handler(Looper.getMainLooper());
    private String kind="", state="unknown", track="", title="", pendingState="", pendingTrack="", reason="web";
    private boolean pending, running, queryInFlight;
    private long generation, querySerial, lastTap = -1000, visibleSince, queryStarted;
    private static final long TAP_GUARD_MS = 400, CONFIRM_MS = 5000;
    private void notConfirmed() {
        pending = false; state = "unknown"; reason="confirmation"; generation++; querySerial++; queryInFlight=false; paint();
        if (running && isShown()) Toast.makeText(getContext(), "Action non confirmée. Réessayer", Toast.LENGTH_SHORT).show();
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
        return SCRIPT+"("+JSONObject.quote(kind)+","+JSONObject.quote(action)+","+JSONObject.quote(old)+","+JSONObject.quote(id)+","+JSONObject.quote(name)+");";
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
                JSONObject o=parse(value); String next=o==null?"unknown":o.optString("state","unknown");
                String nextTrack=o==null?"":o.optString("track",""); String nextTitle=o==null?"":o.optString("title","");
                String nextReason=o==null?"web":o.optString("reason","state");
                if(!next.equals("true")&&!next.equals("false")&&!next.equals("mixed"))next="unknown";
                if(kind.equals("like") && !next.equals("unknown") && (!sameNativeTitle(nextTitle) || nextTrack.isEmpty() || next.equals("mixed"))){next="unknown";nextReason="identity";}
                if(pending && ((!next.equals("unknown") && !next.equals(pendingState)) ||
                   (kind.equals("like") && !nextTrack.isEmpty() && !nextTrack.equals(pendingTrack)))) pending=false;
                state=next;track=nextTrack;title=nextTitle;reason=nextReason;paint();
            }
        }); } catch(RuntimeException e) {queryInFlight=false;state="unknown";reason="web";paint();}
    }
    private void invoke() {
        long t=SystemClock.elapsedRealtime();
        if(!running || !isShown() || getWindowVisibility()!=View.VISIBLE || pending || t-lastTap<TAP_GUARD_MS ||
           state.equals("unknown") || (kind.equals("like") && !sameNativeTitle(title)))return;
        final WebView w=web();if(w==null){state="unknown";reason="web";paint();return;}
        lastTap=t; final String old=state,id=track,name=title; pending=true;
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
        if(reason.equals("control"))return "contrôle Spotify non reconnu ou absent";
        if(reason.equals("ambiguous"))return "plusieurs contrôles possibles";
        if(reason.equals("disabled"))return "contrôle Spotify désactivé";
        if(reason.equals("identity"))return "titre ou identité non confirmé";
        if(reason.equals("command"))return "commande indisponible";
        if(reason.equals("confirmation"))return "action non confirmée";
        if(reason.equals("web"))return "page Spotify ou réponse non accessible";
        return "état ou langue non reconnu";
    }
    private void paint() {
        boolean known=!state.equals("unknown"); boolean active=state.equals("true")||state.equals("mixed");
        String icon,desc;
        if(kind.equals("like")){icon=active?"favon":"favoff";desc=!known?"Like indisponible":active?"Retirer des titres likés":"Ajouter aux titres likés";}
        else if(kind.equals("shuffle")){icon=state.equals("mixed")?"smart_shuffle":"shuffle";desc=!known?"Aléatoire indisponible":active?"Lecture aléatoire activée":"Lecture aléatoire désactivée";}
        else {icon=state.equals("mixed")?"repone":active?"repon":"repoff";desc=!known?"Répétition indisponible":state.equals("mixed")?"Répéter le titre":active?"Répéter la liste":"Répétition désactivée";}
        boolean loading=running && !known && SystemClock.elapsedRealtime()-visibleSince<2400;
        int id=loading?android.R.drawable.ic_popup_sync:drawable(icon);if(id!=0)setImageResource(id);
        if(!known)desc=(loading?"Chargement : ":"Indisponible : ")+reasonText()+" ("+(kind.equals("like")?"Like":kind.equals("shuffle")?"Aléatoire":"Répétition")+")";
        setColorFilter(active?0xffe0489e:0xffc9c0ea);setContentDescription(pending?desc+", en attente":desc);
        setEnabled(known&&!pending); setAlpha(kind.equals("like")?(pending?0.65f:1f):!known?(loading?0.65f:0.35f):pending?0.65f:1.0f);
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
