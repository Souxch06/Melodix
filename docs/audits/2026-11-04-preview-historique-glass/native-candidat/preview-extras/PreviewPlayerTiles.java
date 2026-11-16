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
import android.media.AudioManager;
import android.os.SystemClock;
import android.webkit.WebView;
import android.webkit.ValueCallback;
import org.json.JSONObject;
import org.json.JSONTokener;
import android.view.Window;
import android.view.WindowManager;
import android.util.AttributeSet;
import android.view.HapticFeedbackConstants;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.Toast;

/** Existing WebView controls, reversible native overlay, and local Android volume. */
public final class PreviewPlayerTiles extends LinearLayout {
    private static final String SCRIPT = "(function(action, kind) {\n    'use strict';\n    // Probe only existing controls. A click is issued only on an explicit tap.\n    var specs={\n        queue:{ids:/^(control-button-queue|queue-button)$/i, label:/^(queue|play queue|file d'attente|file de lecture|warteschlange|cola de reproducci\u00f3n|fila de reprodu\u00e7\u00e3o)$/i},\n        lyrics:{ids:/^(lyrics-button|control-button-lyrics)$/i, label:/^(lyrics|show lyrics|paroles|afficher les paroles|songtext|letras|letra)$/i},\n        connect:{ids:/^(connect-button|control-button-connect|connect-device-picker|device-picker)$/i, label:/^(connect to a device|connect to a device\\.\\.\\.|connecter \u00e0 un appareil|se connecter \u00e0 un appareil|mit einem ger\u00e4t verbinden|conectar a un dispositivo|conectar a um dispositivo)$/i}\n    };\n    function status(k) {\n        var spec=specs[k], result={state:'unavailable',reason:'control'};\n        if(!spec)return result;\n        var nodes=Array.from(document.querySelectorAll('button[data-testid], button[aria-label]')).filter(function(b){\n            return b.isConnected && (spec.ids.test(String(b.getAttribute('data-testid')||'')) || spec.label.test(String(b.getAttribute('aria-label')||'').trim()));\n        });\n        if(!nodes.length){result.reason=document.readyState==='loading'?'page':document.querySelector('[data-testid=\"now-playing-bar\"], [data-testid=\"now-playing-widget\"], [data-testid=\"player-controls\"]')?'control':'bar';return result;}\n        if(nodes.length!==1){result.reason='ambiguous';return result;}\n        var b=nodes[0];\n        if(b.disabled || b.getAttribute('aria-disabled')==='true'){result.reason='disabled';return result;}\n        result.state='available';result.reason='';result.button=b;return result;\n    }\n    if(action==='query'){\n        var all={};Object.keys(specs).forEach(function(k){var x=status(k);all[k]=x.state;all[k+'Reason']=x.reason;});return JSON.stringify(all);\n    }\n    if(action!=='invoke')return JSON.stringify({sent:false});\n    var found=status(kind);\n    if(found.state!=='available')return JSON.stringify({sent:false,reason:found.reason});\n    try {\n        var b=found.button;\n        // An already-open panel is shown, not toggled closed again.\n        if(b.getAttribute('aria-expanded')!=='true' && b.getAttribute('aria-pressed')!=='true')b.click();\n        return JSON.stringify({sent:true});\n    } catch (_) {return JSON.stringify({sent:false,reason:'command'});}\n})\n";
    private final String[] kinds={"queue","lyrics","connect"};
    private final String[] names={"File","Paroles","Appareils"};
    private final String[] icons={"☰","♬","▣"};
    private final String[] status={"unknown","unknown","unknown"};
    private final String[] reasons={"web","web","web"};
    private final Button[] controls=new Button[3];
    private Button volumeButton;
    private Dialog webDialog;
    private long visibleSince, generation, serial, queryStarted, lastAction=-1000;
    private boolean opening, queryInFlight;
    private boolean volumeRunning;
    private long lastVolumeTap = -1000;
    private final Runnable volumeTick = new Runnable() { public void run() {
        if (!volumeRunning || !isShown() || getWindowVisibility()!=View.VISIBLE) { volumeRunning=false; return; }
        updateVolume();paintControls();probe();postDelayed(this, 800);
    }};
    private Activity activity(){
        Context c=getContext();for(int i=0;i<8 && c instanceof ContextWrapper;i++){
            if(c instanceof Activity)return (Activity)c;
            Context n=((ContextWrapper)c).getBaseContext();if(n==c)break;c=n;
        }return c instanceof Activity?(Activity)c:null;
    }
    private WebView web(){
        Activity a=activity();if(a==null)return null;
        try {Object w=a.getClass().getField("G").get(a);return w instanceof WebView?(WebView)w:null;}
        catch(Exception ignored){return null;}
    }
    private JSONObject parse(String value){
        try {Object x=new JSONTokener(value).nextValue();return x instanceof String?new JSONObject((String)x):null;}
        catch(Exception ignored){return null;}
    }
    private String reasonText(String why){
        if(why.equals("page"))return "page Spotify en chargement";
        if(why.equals("bar"))return "barre du lecteur Spotify absente ; lancer un titre";
        if(why.equals("control"))return "contrôle Spotify absent ou libellé non reconnu";
        if(why.equals("ambiguous"))return "plusieurs contrôles Spotify possibles";
        if(why.equals("disabled"))return "contrôle Spotify désactivé";
        if(why.equals("command"))return "ouverture non confirmée";
        return "page Spotify ou réponse non accessible";
    }
    private void paintControls(){
        for(int i=0;i<3;i++){
            Button b=controls[i];if(b==null)continue;
            boolean available=status[i].equals("available");
            boolean loading=volumeRunning && !available && SystemClock.elapsedRealtime()-visibleSince<1600;
            b.setEnabled(true);b.setAlpha(available?1f:loading?0.7f:0.45f);
            String labelText=icons[i]+"\n"+names[i]+(loading?"…":"");
            SpannableString label=new SpannableString(labelText);label.setSpan(new RelativeSizeSpan(2.2f),0,labelText.indexOf('\n'),Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);b.setText(label);
            b.setContentDescription(names[i]+(available?" : disponible":loading?" : chargement, "+reasonText(reasons[i]):" : indisponible, "+reasonText(reasons[i])+" ; disponible quand le contrôle Spotify est présent"));
        }
    }
    private void probe(){
        final WebView w=web();if(w==null){for(int i=0;i<3;i++){status[i]="unknown";reasons[i]="web";}paintControls();return;}
        long now=SystemClock.elapsedRealtime();if(opening || (queryInFlight && now-queryStarted<1600))return;
        queryInFlight=true;queryStarted=now;final long g=generation, seq=++serial;
        try{w.evaluateJavascript(SCRIPT+"(\"query\",\"\");",new ValueCallback<String>(){public void onReceiveValue(String value){
            if(g!=generation || seq!=serial || !volumeRunning || !isShown())return;
            queryInFlight=false;JSONObject o=parse(value);
            for(int i=0;i<3;i++){status[i]=o==null?"unknown":o.optString(kinds[i],"unknown");reasons[i]=o==null?"web":o.optString(kinds[i]+"Reason","control");}
            paintControls();
        }});}catch(RuntimeException ignored){queryInFlight=false;for(int i=0;i<3;i++){status[i]="unknown";reasons[i]="web";}paintControls();}
    }
    private void message(String text){if(volumeRunning && isShown())Toast.makeText(getContext(),text,Toast.LENGTH_SHORT).show();}
    private void showWebPanel(){
        final Activity a=activity();if(a==null || a.isFinishing() || a.isDestroyed() || webDialog!=null || !volumeRunning || !isShown() || getWindowVisibility()!=View.VISIBLE)return;
        final View root=a.findViewById(0x7f09022f);if(root==null || root.getVisibility()!=View.VISIBLE){message("Ouverture indisponible. Réessayer");return;}
        final int previous=root.getVisibility();
        try {
            final Dialog dialog=new Dialog(a);Button back=new Button(a);back.setText("Retour au lecteur");back.setContentDescription("Retour au lecteur");
            back.setOnClickListener(new View.OnClickListener(){public void onClick(View v){dialog.dismiss();}});
            dialog.setContentView(back);dialog.setCanceledOnTouchOutside(false);
            dialog.setOnDismissListener(new DialogInterface.OnDismissListener(){public void onDismiss(DialogInterface ignored){webDialog=null;root.setVisibility(previous);}});
            webDialog=dialog;dialog.show();Window window=dialog.getWindow();if(window==null){dialog.dismiss();message("Ouverture indisponible. Réessayer");return;}
            window.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));window.clearFlags(WindowManager.LayoutParams.FLAG_DIM_BEHIND);
            window.addFlags(WindowManager.LayoutParams.FLAG_NOT_TOUCH_MODAL);window.setLayout(-2,-2);window.setGravity(android.view.Gravity.TOP|android.view.Gravity.RIGHT);
            root.setVisibility(View.GONE);
        } catch(RuntimeException ignored){root.setVisibility(previous);if(webDialog!=null){webDialog.dismiss();webDialog=null;}message("Ouverture indisponible. Réessayer");}
    }
    private void activate(final int i){
        long now=SystemClock.elapsedRealtime();if(!volumeRunning || !isShown() || getWindowVisibility()!=View.VISIBLE || opening || now-lastAction<400)return;
        lastAction=now;controls[i].performHapticFeedback(HapticFeedbackConstants.KEYBOARD_TAP);
        if(!status[i].equals("available")){
            message(reasons[i].equals("bar") || reasons[i].equals("control")?"Disponible pendant la lecture":"Indisponible : "+reasonText(reasons[i]));return;
        }
        WebView w=web();if(w==null){status[i]="unknown";reasons[i]="web";paintControls();message("Page Spotify indisponible. Réessayer");return;}
        opening=true;queryInFlight=false;serial++;final long g=++generation;
        postDelayed(new Runnable(){public void run(){if(g==generation && opening){opening=false;generation++;status[i]="unknown";reasons[i]="command";paintControls();message("Ouverture non confirmée. Réessayer");}}},3000);
        try {w.evaluateJavascript(SCRIPT+"(\"invoke\","+JSONObject.quote(kinds[i])+");",new ValueCallback<String>(){public void onReceiveValue(String value){
            if(g!=generation || !opening || !volumeRunning || !isShown() || getWindowVisibility()!=View.VISIBLE)return;
            opening=false;JSONObject result=parse(value);
            if(result!=null && result.optBoolean("sent",false))showWebPanel();
            else {status[i]="unknown";reasons[i]=result==null?"command":result.optString("reason","command");paintControls();message("Ouverture indisponible. Réessayer");}
        }});}catch(RuntimeException ignored){opening=false;generation++;status[i]="unknown";reasons[i]="command";paintControls();message("Ouverture indisponible. Réessayer");}
    }
    private void updateVolume() {
        if (volumeButton==null) return;
        try {
            Object svc=getContext().getSystemService(Context.AUDIO_SERVICE);
            if (!(svc instanceof AudioManager)) { volumeButton.setEnabled(false); volumeButton.setAlpha(0.45f); volumeButton.setContentDescription("Volume du téléphone indisponible"); return; }
            AudioManager audio=(AudioManager)svc;
            int max=audio.getStreamMaxVolume(AudioManager.STREAM_MUSIC), value=audio.getStreamVolume(AudioManager.STREAM_MUSIC);
            if (max<=0) { volumeButton.setEnabled(false); volumeButton.setAlpha(0.45f); volumeButton.setContentDescription("Volume du téléphone indisponible"); return; }
            int percent=Math.max(0,Math.min(100,Math.round(value*100f/max)));
            String text="◖))\nVolume "+percent+" %";
            SpannableString label=new SpannableString(text);
            label.setSpan(new RelativeSizeSpan(2.2f),0,text.indexOf('\n'),Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            volumeButton.setText(label); volumeButton.setContentDescription("Volume du téléphone : "+percent+" pour cent");
            volumeButton.setEnabled(true);volumeButton.setAlpha(1f);
        } catch (RuntimeException ignored) { volumeButton.setEnabled(false); volumeButton.setAlpha(0.45f); volumeButton.setContentDescription("Volume du téléphone indisponible"); }
    }
    private void syncVolume() {
        boolean show=isAttachedToWindow() && isShown() && getWindowVisibility()==View.VISIBLE;
        if(show && !volumeRunning){volumeRunning=true;visibleSince=SystemClock.elapsedRealtime();updateVolume();paintControls();post(volumeTick);}
        else if(!show && volumeRunning){volumeRunning=false;removeCallbacks(volumeTick);generation++;serial++;queryInFlight=false;opening=false;for(int i=0;i<3;i++){status[i]="unknown";reasons[i]="web";}paintControls();}
    }
    @Override protected void onAttachedToWindow(){super.onAttachedToWindow();syncVolume();}
    @Override protected void onDetachedFromWindow(){volumeRunning=false;removeCallbacks(volumeTick);generation++;serial++;queryInFlight=false;opening=false;if(webDialog!=null)webDialog.dismiss();super.onDetachedFromWindow();}
    @Override protected void onVisibilityChanged(View v,int visibility){super.onVisibilityChanged(v,visibility);if(volumeTick!=null)post(new Runnable(){public void run(){syncVolume();}});}
    @Override protected void onWindowVisibilityChanged(int visibility){super.onWindowVisibilityChanged(visibility);if(volumeTick!=null)post(new Runnable(){public void run(){syncVolume();}});}
    public PreviewPlayerTiles(Context c, AttributeSet attrs) {
        super(c,attrs);setOrientation(HORIZONTAL);setGravity(android.view.Gravity.CENTER);
        String[] labels={"☰\nFile","♬\nParoles","▣\nAppareils","◖))\nVolume"};
        for(int i=0;i<labels.length;i++) {
            final int n=i;Button b=new Button(c);
            SpannableString label=new SpannableString(labels[i]);
            label.setSpan(new RelativeSizeSpan(2.2f),0,labels[i].indexOf('\n'),Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            b.setText(label);b.setTextSize(10);b.setTextColor(0xffb4aec5);
            b.setAllCaps(false);b.setSingleLine(false);b.setMaxLines(4);b.setPadding(dp(2),dp(4),dp(2),dp(4));b.setMinWidth(0);b.setMinimumWidth(0);b.setMinimumHeight(dp(56));
            GradientDrawable tile=new GradientDrawable();tile.setColor(0x14ffffff);tile.setCornerRadius(dp(18));tile.setStroke(dp(1),0x1fffffff);
            b.setBackgroundTintList(null);b.setStateListAnimator(null);b.setElevation(0f);b.setTranslationZ(0f);b.setForeground(null);
            b.setBackground(new RippleDrawable(ColorStateList.valueOf(0x447b3fe4),tile,null));
            b.setContentDescription(i==3?"Volume du téléphone":names[i]+" : indisponible, page Spotify non accessible");
            b.setEnabled(true);b.setAlpha(i==3?1f:0.45f);b.setSelected(false);b.setActivated(false);
            LinearLayout.LayoutParams lp=new LinearLayout.LayoutParams(0,getResources().getConfiguration().fontScale>1.3f?LayoutParams.WRAP_CONTENT:dp(56),1f);if(i>0)lp.leftMargin=dp(8);addView(b,lp);
            if(n<3){controls[n]=b;b.setOnClickListener(new View.OnClickListener(){public void onClick(View v){activate(n);}});}
            if(n==3){volumeButton=b;b.setOnClickListener(new View.OnClickListener(){public void onClick(View v){
                long now=SystemClock.elapsedRealtime();
                if(!volumeRunning || !isShown() || now-lastVolumeTap<400)return;
                lastVolumeTap=now;v.performHapticFeedback(HapticFeedbackConstants.KEYBOARD_TAP);
                try {
                    Object svc=getContext().getSystemService(Context.AUDIO_SERVICE);
                    if(!(svc instanceof AudioManager)) throw new IllegalStateException();
                    ((AudioManager)svc).adjustStreamVolume(AudioManager.STREAM_MUSIC,AudioManager.ADJUST_SAME,AudioManager.FLAG_SHOW_UI);
                } catch(RuntimeException ignored){updateVolume();Toast.makeText(getContext(),"Volume indisponible. Réessayer",Toast.LENGTH_SHORT).show();}
            }});}

        }
    }
    private int dp(float x){return (int)(x*getResources().getDisplayMetrics().density+0.5f);}
}
