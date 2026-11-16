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
    private static final String[] observations={"non observée","non observée","non observée"};
    private static final long[] probeSerial={0,0,0};
    public static String diagnosticReport(){return "\nStructure File : "+observations[0]+"\nStructure Paroles : "+observations[1]+"\nStructure Appareils : "+observations[2];}
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
    private void activate(final int i){
        long now=SystemClock.elapsedRealtime();final Activity a=activity();
        if(!volumeRunning || !isShown() || getWindowVisibility()!=View.VISIBLE || a==null || a.isFinishing() || a.isDestroyed() || webDialog!=null || now-lastAction<400)return;
        lastAction=now;controls[i].performHapticFeedback(HapticFeedbackConstants.KEYBOARD_TAP);probe(i,a);
        try {
            final Dialog dialog=new Dialog(a);
            LinearLayout panel=new LinearLayout(a);panel.setOrientation(VERTICAL);panel.setPadding(dp(20),dp(12),dp(20),dp(24));
            GradientDrawable glass=new GradientDrawable();glass.setColor(0xeb170b33);glass.setStroke(dp(1),0x1fffffff);glass.setCornerRadius(dp(28));panel.setBackground(glass);
            TextView handle=new TextView(a);handle.setText("━━━━");handle.setTextColor(0x99ffffff);panel.addView(handle,new LinearLayout.LayoutParams(-1,dp(24)));
            TextView title=new TextView(a);title.setText(names[i]);title.setTextColor(Color.WHITE);title.setTextSize(20);panel.addView(title,new LinearLayout.LayoutParams(-1,dp(48)));
            ScrollView scroll=new ScrollView(a);final TextView body=new TextView(a);body.setText("Chargement…");body.setTextColor(0xffd8d0e8);body.setTextSize(16);scroll.addView(body);panel.addView(scroll,new LinearLayout.LayoutParams(-1,dp(200)));
            Button retry=new Button(a);retry.setText("Réessayer");retry.setMinimumHeight(dp(48));retry.setOnClickListener(new View.OnClickListener(){public void onClick(View v){probe(i,a);readPanel(i,a,dialog,body);}});panel.addView(retry,new LinearLayout.LayoutParams(-1,dp(48)));
            Button close=new Button(a);close.setText("Fermer");close.setContentDescription("Fermer "+names[i]);close.setMinimumHeight(dp(48));
            close.setOnClickListener(new View.OnClickListener(){public void onClick(View v){dialog.dismiss();}});panel.addView(close,new LinearLayout.LayoutParams(-1,dp(48)));
            dialog.setTitle(names[i]);dialog.setContentView(panel);dialog.setCanceledOnTouchOutside(true);
            dialog.setOnDismissListener(new DialogInterface.OnDismissListener(){public void onDismiss(DialogInterface ignored){webDialog=null;}});
            webDialog=dialog;dialog.show();Window w=dialog.getWindow();if(w==null){dialog.dismiss();return;}
            w.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));w.setGravity(android.view.Gravity.BOTTOM);w.setLayout(-1,-2);readPanel(i,a,dialog,body);
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
