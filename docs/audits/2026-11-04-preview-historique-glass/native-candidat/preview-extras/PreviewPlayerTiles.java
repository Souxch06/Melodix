package com.melodix.music;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.DialogInterface;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.text.SpannableString;
import android.text.Spanned;
import android.text.style.RelativeSizeSpan;
import android.os.SystemClock;
import android.view.Window;
import android.util.AttributeSet;
import android.view.HapticFeedbackConstants;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.Toast;
import android.widget.TextView;
import android.widget.ScrollView;
import android.webkit.WebView;
import android.webkit.ValueCallback;
import org.json.JSONObject;
import org.json.JSONTokener;

/** Native fallback panels and a separate Spotify volume control. */
public final class PreviewPlayerTiles extends LinearLayout {
    private static final String PANEL_PROBE = "(function(kind) {\n    'use strict';\n    // Observation only. Never open a panel, navigate, click, or read its text.\n    // Fixed categories and bounded counts only; no arbitrary testids or labels.\n    var selectors={\n        queue:'[data-testid=\"queue-page\"], [data-testid=\"queue-view\"]',\n        lyrics:'[data-testid=\"lyrics-page\"], [data-testid=\"lyrics-lyricsContent\"], [data-testid=\"lyrics-container\"]',\n        devices:'[data-testid=\"device-picker\"], [data-testid=\"connect-device-list\"]'\n    };\n    if(!Object.prototype.hasOwnProperty.call(selectors,kind))return JSON.stringify({reason:'kind',roots:0,rows:0,buttons:0,roles:0,testids:0});\n    var roots=Array.from(document.querySelectorAll(selectors[kind])).filter(function(n){return n.isConnected;});\n    var nodes=[];roots.forEach(function(r){Array.from(r.querySelectorAll('[role], [data-testid], button')).forEach(function(n){if(nodes.indexOf(n)<0)nodes.push(n);});});\n    function count(test){return Math.min(99,nodes.filter(test).length);}\n    return JSON.stringify({reason:roots.length?'observed':'absent',roots:Math.min(roots.length,99),\n        rows:count(function(n){return n.getAttribute('role')==='listitem'||/^(queue-tracklist-row|device-list-item|lyrics-line)$/.test(n.getAttribute('data-testid')||'');}),\n        buttons:count(function(n){return n.tagName==='BUTTON'||n.getAttribute('role')==='button';}),\n        roles:count(function(n){return n.hasAttribute('role');}),testids:count(function(n){return n.hasAttribute('data-testid');})});\n})\n";
    private static final String PANEL_READ = "(function(kind) {\n    'use strict';\n    // Read only a uniquely recognised panel already present in the page.\n    // Never open a panel, issue a command, access session data or navigate.\n    var selectors={\n        queue:'[data-testid=\"queue-page\"], [data-testid=\"queue-view\"]',\n        lyrics:'[data-testid=\"lyrics-lyricsContent\"]',\n        devices:'[data-testid=\"device-picker\"], [data-testid=\"connect-device-list\"]'\n    };\n    if(!Object.prototype.hasOwnProperty.call(selectors,kind))return JSON.stringify({ok:false,reason:'unsupported'});\n    var roots=Array.from(document.querySelectorAll(selectors[kind])).filter(function(n){return n.isConnected;});\n    if(roots.length!==1)return JSON.stringify({ok:false,reason:roots.length?'ambiguous':'absent'});\n    var root=roots[0], lines=[];\n    function text(n){return String(n&&n.textContent||'').replace(/\\s+/g,' ').trim().slice(0,300);}\n    if(kind==='lyrics'){\n        Array.from(root.querySelectorAll('p, [data-testid=\"lyrics-line\"]')).slice(0,100).forEach(function(n){var t=text(n);if(t)lines.push(t);});\n    }else if(kind==='queue'){\n        Array.from(root.querySelectorAll('[data-testid=\"queue-tracklist-row\"]')).slice(0,60).forEach(function(n){\n            var title=text(n.querySelector('[data-testid=\"track-title\"], [data-testid=\"context-item-info-title\"]'));\n            var artist=text(n.querySelector('[data-testid=\"track-artist\"], [data-testid=\"context-item-info-artist\"]'));\n            if(title)lines.push(title+(artist?' \u2014 '+artist:''));\n        });\n    }else{\n        Array.from(root.querySelectorAll('[data-testid=\"device-list-item\"]')).slice(0,30).forEach(function(n){\n            var name=text(n.querySelector('[data-testid=\"device-name\"]'));if(name)lines.push(name+(n.getAttribute('aria-selected')==='true'?' \u00b7 Actif':''));\n        });\n    }\n    if(!lines.length)return JSON.stringify({ok:false,reason:'unreadable'});\n    return JSON.stringify({ok:true,body:lines.join('\\n').slice(0,8000)});\n})\n";
    private static final String QUEUE_JOB = "(function(action) {\n    'use strict';\n    // Queue drawer source. One explicit tap = open the page's queue panel in the\n    // hidden page, read visible rows, then close it if it was closed before.\n    // No scrolling, navigation, storage, cookies, tokens or network.\n    var W = window;\n    if (action === 'poll') return JSON.stringify(W.__melodixQueueJob || {status: 'none'});\n    if (action !== 'run') return JSON.stringify({status: 'none'});\n    if (W.__melodixQueueJob && W.__melodixQueueJob.status === 'running' && Date.now() - W.__melodixQueueJob.started < 8000) return JSON.stringify({status: 'busy'});\n    var job = W.__melodixQueueJob = {status: 'running', started: Date.now(), ok: false, reason: '', now: '', next: '', journal: []};\n    function log(code) { if (job.journal.length < 12) job.journal.push(code); }\n    function text(n) { return String(n && n.textContent || '').replace(/\\s+/g, ' ').trim().slice(0, 200); }\n    function button() {\n        var list = Array.from(document.querySelectorAll('button, [role=\"button\"]')).filter(function(b) {\n            return b.isConnected && (/^(control-button-queue|queue-button)$/i.test(String(b.getAttribute('data-testid') || '')) ||\n                /^(queue|play queue|file d['\u2019]attente|file de lecture|warteschlange|cola de reproducci\u00f3n|cola|fila de reprodu\u00e7\u00e3o|fila)$/i.test(String(b.getAttribute('aria-label') || '').trim()));\n        });\n        return list.length === 1 ? list[0] : null;\n    }\n    function isOpen(b) { return b.getAttribute('aria-pressed') === 'true' || b.getAttribute('aria-expanded') === 'true' || b.getAttribute('data-active') === 'true'; }\n    function root(b) {\n        var selectors = '[data-testid=\"queue-page\"], [data-testid=\"queue-view\"], [data-testid=\"queue-panel\"], [data-testid=\"NPV-queue\"], aside[aria-label=\"Queue\"], aside[aria-label=\"File d\u2019attente\"], aside[aria-label=\"File d\\'attente\"], section[aria-label=\"Queue\"], section[aria-label=\"File d\u2019attente\"], [role=\"region\"][aria-label=\"Queue\"], [role=\"region\"][aria-label=\"File d\u2019attente\"]';\n        var found = Array.from(document.querySelectorAll(selectors)).filter(function(n) { return n.isConnected; });\n        if (found.length === 1) return found[0];\n        var id = b && b.getAttribute('aria-controls');\n        var controlled = id ? document.getElementById(id) : null;\n        return controlled && controlled.isConnected ? controlled : null;\n    }\n    function rows(r) {\n        var list = Array.from(r.querySelectorAll('[data-testid=\"queue-tracklist-row\"], [data-testid=\"tracklist-row\"], [role=\"row\"]')).filter(function(n) {\n            return !n.querySelector('[data-testid=\"queue-tracklist-row\"], [data-testid=\"tracklist-row\"], [role=\"row\"]');\n        });\n        return list.slice(0, 40).map(function(n) {\n            var t = n.querySelector('[data-testid=\"internal-track-link\"], a[href*=\"/track/\"], a[href*=\"/episode/\"], [data-testid=\"track-title\"], [data-testid=\"context-item-info-title\"]');\n            var artists = Array.from(n.querySelectorAll('a[href*=\"/artist/\"], a[href*=\"/show/\"]')).map(text).filter(Boolean);\n            if (!artists.length) { var a = n.querySelector('[data-testid=\"track-artist\"], [data-testid=\"context-item-info-artist\"]'); if (a) artists.push(text(a)); }\n            var duration = '';\n            Array.from(n.querySelectorAll('div, span')).some(function(x) {\n                if (x.children.length) return false;\n                var v = text(x);\n                if (/^\\d{1,2}:\\d{2}(:\\d{2})?$/.test(v)) { duration = v; return true; }\n                return false;\n            });\n            return {title: text(t), artist: artists.join(', ').slice(0, 200), duration: duration};\n        }).filter(function(x) { return x.title; });\n    }\n    function finish(ok, reason) { job.status = 'done'; job.ok = ok; job.reason = reason || ''; }\n    try {\n        var b = button();\n        var already = root(b);\n        if (!b && !already) { log('button:absent'); finish(false, 'absent'); return JSON.stringify({status: 'started'}); }\n        var wasOpen = !!already || (b && isOpen(b));\n        if (!wasOpen) { try { b.click(); log('opened'); } catch (_) { log('open-error'); finish(false, 'command'); return JSON.stringify({status: 'started'}); } }\n        else log('already-open');\n        var end = Date.now() + 2500;\n        (function step() {\n            var r = null, list = [];\n            try { r = root(button() || b); list = r ? rows(r) : []; } catch (_) { list = []; }\n            if (!list.length && Date.now() < end) { setTimeout(step, 150); return; }\n            if (list.length) {\n                var line = function(x) { return [x.title, x.artist, x.duration].join('\\t').replace(/\\n/g, ' '); };\n                job.now = line(list[0]); job.next = list.slice(1).map(line).join('\\n');\n                log('rows:' + Math.min(list.length, 40));\n                finish(true, '');\n            } else { log(r ? 'rows:0' : 'panel:absent'); finish(false, r ? 'empty' : 'panel'); }\n            if (!wasOpen) {\n                setTimeout(function() {\n                    try { var again = button() || b; if (again && isOpen(again)) { again.click(); log('closed'); } } catch (_) { log('close-error'); }\n                }, 100);\n            }\n        })();\n        return JSON.stringify({status: 'started'});\n    } catch (_) {\n        finish(false, 'error');\n        return JSON.stringify({status: 'started'});\n    }\n})\n";
    private static String queueJournal="aucune";
    private static String clean(String x){StringBuilder b=new StringBuilder();for(char c:x.toCharArray()){if((c>='a'&&c<='z')||(c>='0'&&c<='9')||c==':'||c=='-'||c==','||c=='>')b.append(c);if(b.length()>120)break;}return b.length()==0?"aucune":b.toString();}
    private static final String[] observations={"non observée","non observée","non observée"};
    private static final long[] probeSerial={0,0,0};
    public static String diagnosticReport(){return "\nStructure File : "+observations[0]+"\nStructure Paroles : "+observations[1]+"\nStructure Appareils : "+observations[2]+"\nFile (tiroir) : "+queueJournal;}
    private static int count(JSONObject o,String key){return Math.max(0,Math.min(99,o.optInt(key,0)));}
    private void probe(final int i,Activity a){
        String kind=i==0?"queue":i==1?"lyrics":"devices";final long serial=++probeSerial[i];
        try {
            Object view=a.getClass().getField("G").get(a);
            if(!(view instanceof WebView)){observations[i]="page inaccessible";return;}
            ((WebView)view).evaluateJavascript("("+PANEL_PROBE+")("+JSONObject.quote(kind)+");",new ValueCallback<String>(){
                public void onReceiveValue(String value){
                    if(serial!=probeSerial[i])return;
                    try {
                        Object decoded=new JSONTokener(value).nextValue();
                        if(!(decoded instanceof String)){observations[i]="réponse illisible";return;}
                        JSONObject data=new JSONObject((String)decoded);String reason=data.optString("reason","unknown");
                        if(!reason.equals("observed")&&!reason.equals("absent"))reason="unknown";
                        observations[i]="motif="+reason+", racines="+count(data,"roots")+", lignes="+count(data,"rows")+
                            ", boutons="+count(data,"buttons")+", rôles="+count(data,"roles")+", testids="+count(data,"testids");
                    } catch(Exception ignored){observations[i]="réponse illisible";}
                }
            });
        }catch(Exception ignored){observations[i]="page inaccessible";}
    }
    private long readSerial;
    private void readPanel(final int i,Activity a,final Dialog dialog,final TextView body){
        final long serial=++readSerial;String kind=i==0?"queue":i==1?"lyrics":"devices";
        body.setText("Chargement…");
        try {
            Object view=a.getClass().getField("G").get(a);
            if(!(view instanceof WebView)){body.setText("Indisponible dans cette version");return;}
            ((WebView)view).evaluateJavascript("("+PANEL_READ+")("+JSONObject.quote(kind)+");",new ValueCallback<String>(){
                public void onReceiveValue(String value){
                    if(serial!=readSerial||webDialog!=dialog)return;
                    readSerial++;
                    try {
                        Object decoded=new JSONTokener(value).nextValue();
                        if(!(decoded instanceof String)){body.setText("Indisponible dans cette version");return;}
                        JSONObject data=new JSONObject((String)decoded);
                        String text=data.optBoolean("ok",false)?data.optString("body",""):"";
                        body.setText(text.isEmpty()?"Indisponible dans cette version":text.substring(0,Math.min(8000,text.length())));
                    }catch(Exception ignored){body.setText("Indisponible dans cette version");}
                }
            });
            postDelayed(new Runnable(){public void run(){if(serial==readSerial&&webDialog==dialog){readSerial++;body.setText("Indisponible dans cette version");}}},3500);
        }catch(Exception ignored){body.setText("Indisponible dans cette version");}
    }
    private final String[] names={"File","Paroles","Appareils"};
    private final String[] icons={"☰","♬","▣"};
    private final Button[] controls=new Button[3];
    private Dialog webDialog;
    private long lastAction=-1000;
    private boolean volumeRunning;
    private Activity activity(){
        Context c=getContext();for(int i=0;i<8 && c instanceof ContextWrapper;i++){
            if(c instanceof Activity)return (Activity)c;
            Context n=((ContextWrapper)c).getBaseContext();if(n==c)break;c=n;
        }return c instanceof Activity?(Activity)c:null;
    }
    private void paintControls(){
        for(int i=0;i<3;i++){
            Button b=controls[i];if(b==null)continue;
            b.setEnabled(true);b.setAlpha(0.8f);
            String labelText=icons[i]+"\n"+names[i];
            SpannableString label=new SpannableString(labelText);label.setSpan(new RelativeSizeSpan(2.2f),0,labelText.indexOf('\n'),Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);b.setText(label);
            b.setContentDescription(names[i]+" : consulter si disponible");
        }
    }
    private void message(String text){if(volumeRunning && isShown())Toast.makeText(getContext(),text,Toast.LENGTH_SHORT).show();}
    private WebView web(Activity a){try{Object v=a.getClass().getField("G").get(a);return v instanceof WebView?(WebView)v:null;}catch(Exception ignored){return null;}}
    private TextView line(Activity a,String text,int color,float size){TextView t=new TextView(a);t.setText(text);t.setTextColor(color);t.setTextSize(size);return t;}
    private void skeleton(Activity a,LinearLayout list){
        list.removeAllViews();
        for(int k=0;k<4;k++){TextView t=line(a,"▬▬▬▬▬▬▬▬▬▬▬▬\n▬▬▬▬▬▬",0x40ffffff,14);t.setContentDescription("Chargement de la file");list.addView(t,new LinearLayout.LayoutParams(-1,dp(56)));}
    }
    private void queueFailed(Activity a,LinearLayout list,Button retry){
        settledSerial=queueSerial;
        list.removeAllViews();list.addView(line(a,"File indisponible",Color.WHITE,18),new LinearLayout.LayoutParams(-1,dp(40)));
        list.addView(line(a,"Touchez Réessayer pour relire la file.",0xffc7bbdc,14),new LinearLayout.LayoutParams(-1,-2));retry.setEnabled(true);
    }
    private void addRow(Activity a,LinearLayout list,String raw){
        String[] f=raw.split("\t",-1);if(f.length==0||f[0].trim().isEmpty())return;
        String artist=f.length>1?f[1]:"", time=f.length>2?f[2]:"";
        String sub=artist+(!time.isEmpty()?(artist.isEmpty()?"":" · ")+time:"");
        TextView t=line(a,f[0]+(sub.isEmpty()?"":"\n"+sub),Color.WHITE,15);t.setMaxLines(3);t.setPadding(0,dp(6),0,dp(6));list.addView(t,new LinearLayout.LayoutParams(-1,-2));
    }
    private void renderQueue(Activity a,LinearLayout list,Button retry,JSONObject o){
        queueJournal=clean(o.optString("journal",""));
        if(!o.optBoolean("ok",false)){queueFailed(a,list,retry);return;}
        settledSerial=queueSerial;list.removeAllViews();list.addView(line(a,"En cours de lecture",0xffa78bfa,13),new LinearLayout.LayoutParams(-1,dp(32)));addRow(a,list,o.optString("now",""));
        list.addView(line(a,"À suivre",0xffa78bfa,13),new LinearLayout.LayoutParams(-1,dp(40)));
        String next=o.optString("next","");
        if(next.isEmpty())list.addView(line(a,"Aucun titre à suivre",0xffc7bbdc,14),new LinearLayout.LayoutParams(-1,-2));
        else for(String r:next.split("\n"))addRow(a,list,r);
        retry.setEnabled(true);
    }
    private long queueSerial, settledSerial=-1;
    private JSONObject parseObject(String value){try{Object d=new JSONTokener(value).nextValue();return d instanceof String?new JSONObject((String)d):null;}catch(Exception ignored){return null;}}
    private void loadQueue(final Activity a,final Dialog dialog,final LinearLayout list,final Button retry){
        final long serial=++queueSerial;skeleton(a,list);retry.setEnabled(false);
        postDelayed(new Runnable(){public void run(){if(serial==queueSerial&&webDialog==dialog&&settledSerial!=serial){queueJournal="delai";queueFailed(a,list,retry);}}},6000);
        WebView w=web(a);if(w==null){queueJournal="page:inaccessible";queueFailed(a,list,retry);return;}
        try{w.evaluateJavascript("("+QUEUE_JOB+")(\"run\");",new ValueCallback<String>(){public void onReceiveValue(String value){
            if(serial!=queueSerial||webDialog!=dialog)return;JSONObject o=parseObject(value);String st=o==null?"":o.optString("status","");
            if(st.equals("started")||st.equals("busy"))pollQueue(a,dialog,list,retry,serial,0);else{queueJournal="demarrage:refuse";queueFailed(a,list,retry);}
        }});}catch(RuntimeException e){queueJournal="demarrage:erreur";queueFailed(a,list,retry);}
    }
    private void pollQueue(final Activity a,final Dialog dialog,final LinearLayout list,final Button retry,final long serial,final int n){
        if(n>20){if(serial==queueSerial&&webDialog==dialog){queueJournal="delai";queueFailed(a,list,retry);}return;}
        postDelayed(new Runnable(){public void run(){
            if(serial!=queueSerial||webDialog!=dialog)return;WebView w=web(a);if(w==null){queueFailed(a,list,retry);return;}
            try{w.evaluateJavascript("("+QUEUE_JOB+")(\"poll\");",new ValueCallback<String>(){public void onReceiveValue(String value){
                if(serial!=queueSerial||webDialog!=dialog)return;JSONObject o=parseObject(value);
                if(o==null||!o.optString("status","").equals("done")){pollQueue(a,dialog,list,retry,serial,n+1);return;}
                renderQueue(a,list,retry,o);
            }});}catch(RuntimeException e){queueFailed(a,list,retry);}
        }},250);
    }
    private void activate(final int i){
        long now=SystemClock.elapsedRealtime();final Activity a=activity();
        if(!volumeRunning || !isShown() || getWindowVisibility()!=View.VISIBLE || a==null || a.isFinishing() || a.isDestroyed() || webDialog!=null || now-lastAction<400)return;
        lastAction=now;controls[i].performHapticFeedback(HapticFeedbackConstants.KEYBOARD_TAP);probe(i,a);
        try {
            final Dialog dialog=new Dialog(a);
            LinearLayout panel=new LinearLayout(a);panel.setOrientation(VERTICAL);panel.setPadding(dp(20),dp(8),dp(20),dp(24));
            GradientDrawable glass=new GradientDrawable();glass.setColor(0xeb170b33);glass.setStroke(dp(1),0x1fffffff);float r=dp(28);glass.setCornerRadii(new float[]{r,r,r,r,0,0,0,0});panel.setBackground(glass);
            View.OnTouchListener swipe=new View.OnTouchListener(){float startY;public boolean onTouch(View v,MotionEvent e){
                if(e.getActionMasked()==MotionEvent.ACTION_DOWN){startY=e.getRawY();return true;}
                if(e.getActionMasked()==MotionEvent.ACTION_UP&&e.getRawY()-startY>dp(64))dialog.dismiss();
                return true;}};
            TextView handle=new TextView(a);handle.setText("━━━━");handle.setGravity(Gravity.CENTER);handle.setTextColor(0x99ffffff);handle.setContentDescription("Glisser vers le bas pour fermer");handle.setOnTouchListener(swipe);panel.addView(handle,new LinearLayout.LayoutParams(-1,dp(32)));
            TextView title=line(a,i==0?"File d’attente":names[i],Color.WHITE,20);title.setOnTouchListener(swipe);panel.addView(title,new LinearLayout.LayoutParams(-1,dp(48)));
            final LinearLayout list=new LinearLayout(a);list.setOrientation(VERTICAL);
            ScrollView scroll=new ScrollView(a);scroll.addView(list);panel.addView(scroll,new LinearLayout.LayoutParams(-1,dp(i==0?340:160)));
            final Button retry=new Button(a);retry.setText("Réessayer");retry.setMinimumHeight(dp(48));
            Button close=new Button(a);close.setText("Fermer");close.setContentDescription("Fermer "+names[i]);close.setMinimumHeight(dp(48));
            close.setOnClickListener(new View.OnClickListener(){public void onClick(View v){dialog.dismiss();}});
            dialog.setTitle(names[i]);dialog.setContentView(panel);dialog.setCanceledOnTouchOutside(true);
            dialog.setOnDismissListener(new DialogInterface.OnDismissListener(){public void onDismiss(DialogInterface ignored){webDialog=null;queueSerial++;}});
            webDialog=dialog;
            if(i==0){
                retry.setOnClickListener(new View.OnClickListener(){public void onClick(View v){loadQueue(a,dialog,list,retry);}});
                panel.addView(retry,new LinearLayout.LayoutParams(-1,dp(48)));
            } else {
                list.addView(line(a,"Bientôt disponible",Color.WHITE,18),new LinearLayout.LayoutParams(-1,dp(40)));
                list.addView(line(a,i==1?"Les paroles s’afficheront ici dans une prochaine version.":"La liste des appareils s’affichera ici dans une prochaine version.",0xffc7bbdc,14),new LinearLayout.LayoutParams(-1,-2));
            }
            panel.addView(close,new LinearLayout.LayoutParams(-1,dp(48)));
            dialog.show();Window w=dialog.getWindow();if(w==null){dialog.dismiss();return;}
            w.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));w.setGravity(Gravity.BOTTOM);w.setLayout(-1,-2);
            if(i==0)loadQueue(a,dialog,list,retry);
        }catch(RuntimeException ignored){if(webDialog!=null){webDialog.dismiss();webDialog=null;}message("Indisponible dans cette version");}
    }
    private void syncVolume() {
        boolean show=isAttachedToWindow() && isShown() && getWindowVisibility()==View.VISIBLE;
        volumeRunning=show;if(!show && webDialog!=null)webDialog.dismiss();paintControls();
    }
    @Override protected void onAttachedToWindow(){super.onAttachedToWindow();syncVolume();}
    @Override protected void onDetachedFromWindow(){volumeRunning=false;if(webDialog!=null)webDialog.dismiss();super.onDetachedFromWindow();}
    @Override protected void onVisibilityChanged(View v,int visibility){super.onVisibilityChanged(v,visibility);if(controls!=null)post(new Runnable(){public void run(){syncVolume();}});}
    @Override protected void onWindowVisibilityChanged(int visibility){super.onWindowVisibilityChanged(visibility);if(controls!=null)post(new Runnable(){public void run(){syncVolume();}});}
    public PreviewPlayerTiles(Context c, AttributeSet attrs) {
        super(c,attrs);setOrientation(HORIZONTAL);setGravity(android.view.Gravity.CENTER);
        String[] labels={"☰\nFile","♬\nParoles","▣\nAppareils","◖))\nVolume"};
        for(int i=0;i<labels.length;i++) {
            final int n=i;Button b=i==3?new PreviewPlayerVolume(c):new Button(c);
            SpannableString label=new SpannableString(labels[i]);
            label.setSpan(new RelativeSizeSpan(2.2f),0,labels[i].indexOf('\n'),Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            b.setText(label);b.setTextSize(10);b.setTextColor(0xffb4aec5);
            b.setAllCaps(false);b.setSingleLine(false);b.setMaxLines(4);b.setPadding(dp(2),dp(4),dp(2),dp(4));b.setMinWidth(0);b.setMinimumWidth(0);b.setMinimumHeight(dp(56));
            GradientDrawable tile=new GradientDrawable();tile.setColor(0x14ffffff);tile.setCornerRadius(dp(18));tile.setStroke(dp(1),0x1fffffff);
            b.setBackgroundTintList(null);b.setStateListAnimator(null);b.setElevation(0f);b.setTranslationZ(0f);b.setForeground(null);
            b.setBackground(new RippleDrawable(ColorStateList.valueOf(0x447b3fe4),tile,null));
            b.setContentDescription(i==3?"Volume du lecteur indisponible":names[i]+" : indisponible, page Spotify non accessible");
            if(i<3)b.setEnabled(true);b.setAlpha(i==3?1f:0.8f);b.setSelected(false);b.setActivated(false);
            LinearLayout.LayoutParams lp=new LinearLayout.LayoutParams(0,getResources().getConfiguration().fontScale>1.3f?LayoutParams.WRAP_CONTENT:dp(56),1f);if(i>0)lp.leftMargin=dp(8);addView(b,lp);
            if(n<3){controls[n]=b;b.setOnClickListener(new View.OnClickListener(){public void onClick(View v){activate(n);}});}

        }
    }
    private int dp(float x){return (int)(x*getResources().getDisplayMetrics().density+0.5f);}
}
