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
    private static final String SCRIPT = "(function(kind, action, expectedState, expectedTrack, expectedTitle) {\n    'use strict';\n    // Only inspect the same controls used by the existing protected commands.\n    // No network access, credentials, navigation or playback clock.\n    var selectors = {\n        like:'div[data-testid=\"now-playing-widget\"]>div:last-child>button',\n        shuffle:'button[data-testid=\"control-button-shuffle\"]',\n        repeat:'button[data-testid=\"control-button-repeat\"]'\n    };\n    var functions = {like:'actAddToFav', shuffle:'actShuffle', repeat:'actRepeat'};\n    if (!Object.prototype.hasOwnProperty.call(selectors, kind)) return JSON.stringify({state:'unknown'});\n    var button = document.querySelector(selectors[kind]);\n    var raw = button && (button.getAttribute('aria-checked') || (kind === 'shuffle' ? button.getAttribute('aria-pressed') : null));\n    var enabled = !!(button && button.isConnected && !button.disabled && button.getAttribute('aria-disabled') !== 'true' && typeof window[functions[kind]] === 'function');\n    var valid = raw === 'true' || raw === 'false' || (kind !== 'like' && raw === 'mixed');\n    var title = '', track = '';\n    if (kind === 'like') {\n        // The legacy selector is positional. Require a recognizable save control\n        // as well, so a different checked button can never be toggled as a like.\n        var testid = button ? String(button.getAttribute('data-testid') || '').toLowerCase() : '';\n        var label = button ? String(button.getAttribute('aria-label') || '').trim().toLowerCase() : '';\n        var saveControl = /^(add-button|remove-button|add-to-library-button|remove-from-library-button)$/.test(testid) ||\n            /^(save to your library|remove from your library|add to liked songs|remove from liked songs|ajouter (\u00e0|aux) (la biblioth\u00e8que|titres lik\u00e9s)|retirer (de la biblioth\u00e8que|des titres lik\u00e9s))$/.test(label);\n        enabled = enabled && saveControl;\n        var bar = document.querySelector('[data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-bar\"]');\n        var link = bar && bar.querySelector('a[data-testid=\"context-item-link\"], a[data-testid=\"nowplaying-track-link\"]');\n        title = link ? String(link.textContent || '').trim() : '';\n        var href = link ? String(link.getAttribute('href') || '') : '';\n        var match = /^\\/(track|episode)\\/([a-z0-9]+)(?:[?#].*)?$/i.exec(href);\n        track = match ? match[1].toLowerCase()+':'+match[2] : '';\n        enabled = enabled && !!track && !!title;\n    }\n    var state = enabled && valid ? raw : 'unknown';\n    if (action === 'query') return JSON.stringify({state:state,track:track,title:title});\n    if (action !== 'invoke' || state === 'unknown' || state !== expectedState ||\n        (kind === 'like' && (track !== expectedTrack || title !== expectedTitle)))\n        return JSON.stringify({sent:false});\n    try { window[functions[kind]](); return JSON.stringify({sent:true}); }\n    catch (_) { return JSON.stringify({sent:false}); }\n})\n";
    private final Handler handler = new Handler(Looper.getMainLooper());
    private String kind="", state="unknown", track="", title="", pendingState="", pendingTrack="";
    private boolean pending, running;
    private long generation, querySerial, lastTap = -1000;
    private static final long TAP_GUARD_MS = 400, CONFIRM_MS = 5000;
    private void notConfirmed() {
        pending = false; state = "unknown"; generation++; querySerial++; paint();
        if (running && isShown()) Toast.makeText(getContext(), "Action non confirmée. Réessayer", Toast.LENGTH_SHORT).show();
    }
    private final Runnable tick = new Runnable() { public void run() {
        if (!running || !isShown() || getWindowVisibility()!=View.VISIBLE) return;
        observe(); handler.postDelayed(this, 800);
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
        final WebView w=web(); if(w==null){state="unknown";paint();return;}
        final long g=generation, serial=++querySerial;
        try { w.evaluateJavascript(call("query","","",""),new ValueCallback<String>() {
            public void onReceiveValue(String value) {
                if(g!=generation || serial!=querySerial || !running || !isShown())return;
                JSONObject o=parse(value); String next=o==null?"unknown":o.optString("state","unknown");
                String nextTrack=o==null?"":o.optString("track",""); String nextTitle=o==null?"":o.optString("title","");
                if(!next.equals("true")&&!next.equals("false")&&!next.equals("mixed"))next="unknown";
                if(kind.equals("like") && (!sameNativeTitle(nextTitle) || nextTrack.isEmpty() || next.equals("mixed")))next="unknown";
                if(pending && ((!next.equals("unknown") && !next.equals(pendingState)) ||
                   (kind.equals("like") && !nextTrack.isEmpty() && !nextTrack.equals(pendingTrack)))) pending=false;
                state=next;track=nextTrack;title=nextTitle;paint();
            }
        }); } catch(RuntimeException e) {state="unknown";paint();}
    }
    private void invoke() {
        long t=SystemClock.elapsedRealtime();
        if(!running || !isShown() || getWindowVisibility()!=View.VISIBLE || pending || t-lastTap<TAP_GUARD_MS ||
           state.equals("unknown") || (kind.equals("like") && !sameNativeTitle(title)))return;
        final WebView w=web();if(w==null){state="unknown";paint();return;}
        lastTap=t; final String old=state,id=track,name=title; pending=true;
        pendingState=old;pendingTrack=id;final long g=++generation;querySerial++;paint();performHapticFeedback(HapticFeedbackConstants.KEYBOARD_TAP);
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
    private void paint() {
        boolean known=!state.equals("unknown"); boolean active=state.equals("true")||state.equals("mixed");
        String icon,desc;
        if(kind.equals("like")){icon=active?"favon":"favoff";desc=!known?"Like indisponible":active?"Retirer des titres likés":"Ajouter aux titres likés";}
        else if(kind.equals("shuffle")){icon=state.equals("mixed")?"smart_shuffle":"shuffle";desc=!known?"Aléatoire indisponible":active?"Lecture aléatoire activée":"Lecture aléatoire désactivée";}
        else {icon=state.equals("mixed")?"repone":active?"repon":"repoff";desc=!known?"Répétition indisponible":state.equals("mixed")?"Répéter le titre":active?"Répéter la liste":"Répétition désactivée";}
        int id=drawable(icon);if(id!=0)setImageResource(id);
        setColorFilter(active?0xffe0489e:0xffc9c0ea);setContentDescription(pending?desc+", en attente":desc);
        setEnabled(known&&!pending); setAlpha(!known?0.35f:pending?0.65f:1.0f);
    }
    private void sync() {
        boolean visible=isAttachedToWindow() && isShown() && getWindowVisibility()==View.VISIBLE;
        if(visible && !running){running=true;handler.post(tick);}
        else if(!visible && running){running=false;handler.removeCallbacks(tick);generation++;querySerial++;pending=false;state="unknown";paint();}
    }
    @Override protected void onAttachedToWindow(){super.onAttachedToWindow();Object t=getTag();kind=t==null?"":t.toString();paint();sync();}
    @Override protected void onDetachedFromWindow(){running=false;handler.removeCallbacks(tick);generation++;querySerial++;pending=false;state="unknown";paint();super.onDetachedFromWindow();}
    @Override protected void onVisibilityChanged(View changed,int visibility){super.onVisibilityChanged(changed,visibility);if(handler!=null)post(new Runnable(){public void run(){sync();}});}
    @Override protected void onWindowVisibilityChanged(int visibility){super.onWindowVisibilityChanged(visibility);if(handler!=null)post(new Runnable(){public void run(){sync();}});}
}
