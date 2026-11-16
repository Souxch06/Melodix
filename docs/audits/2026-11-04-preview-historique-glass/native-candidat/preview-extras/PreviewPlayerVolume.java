package com.melodix.music;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.res.ColorStateList;
import android.content.DialogInterface;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.view.Gravity;
import android.view.View;
import android.view.Window;
import android.webkit.ValueCallback;
import android.webkit.WebView;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.SeekBar;
import android.widget.TextView;
import android.widget.Toast;
import org.json.JSONObject;
import org.json.JSONTokener;

/** Spotify DOM range only; never modifies Android AudioManager. */
public final class PreviewPlayerVolume extends Button {
    private static final String SCRIPT = "(function(action, requested) {\n    'use strict';\n    // Only a uniquely identified native range inside Spotify's volume-bar.\n    // No session data, network, Android audio or synthetic playback command.\n    var nodes=Array.from(document.querySelectorAll('[data-testid=\"volume-bar\"] input[type=\"range\"], input[data-testid=\"volume-bar\"][type=\"range\"]')).filter(function(n){return n.isConnected;});\n    if(nodes.length!==1)return JSON.stringify({ok:false,reason:nodes.length?'ambiguous':'absent'});\n    var input=nodes[0];if(input.disabled||input.matches(':disabled')||input.closest('[aria-disabled=\"true\"]'))return JSON.stringify({ok:false,reason:'disabled'});\n    var min=input.hasAttribute('min')?Number(input.min):0, max=input.hasAttribute('max')?Number(input.max):100, current=Number(input.value);\n    if(!isFinite(min)||!isFinite(max)||max<=min||!isFinite(current)||current<min||current>max)return JSON.stringify({ok:false,reason:'range'});\n    if(action==='query')return JSON.stringify({ok:true,percent:Math.round(100*(current-min)/(max-min))});\n    if(action!=='set'||!isFinite(Number(requested))||Number(requested)<0||Number(requested)>100)return JSON.stringify({ok:false,reason:'request'});\n    try{\n        var value=min+(max-min)*Number(requested)/100;\n        var setter=Object.getOwnPropertyDescriptor(HTMLInputElement.prototype,'value').set;\n        setter.call(input,String(value));input.dispatchEvent(new Event('input',{bubbles:true}));input.dispatchEvent(new Event('change',{bubbles:true}));\n        return JSON.stringify({ok:true,sent:true});\n    }catch(_){return JSON.stringify({ok:false,reason:'command'});}\n})\n";
    private final Handler handler=new Handler(Looper.getMainLooper());
    private boolean running,readBusy,dragging,sendScheduled;
    private long readAt,serial,lastSent=-1000;
    private int percent=-1,queued=-1,lastNonZero=-1;
    private String reason="page non accessible";
    private static String lastPage="non observée", lastAction="aucune";
    public static String diagnosticReport(){return "\nVolume lecteur — page : "+lastPage+" ; action : "+lastAction+" ; son non vérifié";}
    private static String reasonText(String code){
        if(code.equals("absent"))return "curseur Spotify absent";
        if(code.equals("ambiguous"))return "plusieurs curseurs possibles";
        if(code.equals("disabled"))return "curseur Spotify désactivé";
        if(code.equals("range"))return "valeur du curseur invalide";
        if(code.equals("command"))return "commande non confirmée";
        return "page ou réponse inaccessible";
    }
    private Dialog dialog;private TextView valueLabel;private SeekBar slider;private Button mute;
    private final Runnable tick=new Runnable(){public void run(){if(!running || !isShown() || getWindowVisibility()!=View.VISIBLE)return;read();handler.postDelayed(this,800);}};
    private final Runnable sendTask=new Runnable(){public void run(){sendScheduled=false;send();}};
    public PreviewPlayerVolume(Context c){super(c);setEnabled(false);setOnClickListener(new View.OnClickListener(){public void onClick(View v){open();}});}
    private int dp(float x){return (int)(x*getResources().getDisplayMetrics().density+0.5f);}
    private Activity activity(){Context c=getContext();for(int i=0;i<8&&c instanceof ContextWrapper;i++){if(c instanceof Activity)return (Activity)c;Context n=((ContextWrapper)c).getBaseContext();if(n==c)break;c=n;}return c instanceof Activity?(Activity)c:null;}
    private WebView web(){Activity a=activity();if(a==null)return null;try{Object w=a.getClass().getField("G").get(a);return w instanceof WebView?(WebView)w:null;}catch(Exception ignored){return null;}}
    private JSONObject parse(String s){try{Object v=new JSONTokener(s).nextValue();return v instanceof String?new JSONObject((String)v):null;}catch(Exception ignored){return null;}}
    private void paint(){
        // Keep the tile to two lines; the precise percentage is available in
        // its accessibility label and in the volume sheet, never clipped.
        String label=(percent==0?"◖×":"◖))")+"\nVolume";
        setText(label);setContentDescription(percent<0?"Volume du lecteur indisponible : "+reason:"Volume du lecteur : "+percent+" pour cent");
        setEnabled(running);setAlpha(percent<0?0.60f:1f);
        if(dialog!=null&&slider!=null&&mute!=null&&valueLabel!=null){
            slider.setEnabled(percent>=0);mute.setEnabled(percent>=0);
            if(percent<0)valueLabel.setText("Indisponible : "+reason);
            else if(!dragging&&queued<0){slider.setProgress(percent);showValue(percent);}
        }
    }
    private void read(){
        final WebView w=web();if(w==null){percent=-1;reason=reasonText("web");lastPage=reason;paint();return;}
        long now=SystemClock.elapsedRealtime();if(dragging||queued>=0||(readBusy&&now-readAt<2400))return;
        readBusy=true;readAt=now;final long id=++serial;
        try{w.evaluateJavascript(SCRIPT+"(\"query\",0);",new ValueCallback<String>(){public void onReceiveValue(String value){
            if(id!=serial||!running||!isShown())return;readBusy=false;JSONObject o=parse(value);
            int p=o==null?-1:o.optInt("percent",-1);percent=o!=null&&o.optBoolean("ok",false)&&p>=0&&p<=100?p:-1;
            if(percent<0){reason=reasonText(o==null?"web":o.optString("reason","web"));lastPage=reason;}
            else {lastPage=percent+" % observé";if(percent>0)lastNonZero=percent;}
            paint();
        }});}catch(RuntimeException ignored){readBusy=false;percent=-1;reason=reasonText("web");lastPage=reason;paint();}
    }
    private void showValue(int n){if(valueLabel!=null)valueLabel.setText(n+" %");if(mute!=null)mute.setText(n==0?"Réactiver":"Silence");}
    private void enqueue(int n){queued=Math.max(0,Math.min(100,n));if(!sendScheduled){sendScheduled=true;long delay=Math.max(0,100-(SystemClock.elapsedRealtime()-lastSent));handler.postDelayed(sendTask,delay);}}
    private void send(){
        if(!running||queued<0)return;final int n=queued;queued=-1;lastSent=SystemClock.elapsedRealtime();final long sentId=++serial;readBusy=false;
        WebView w=web();if(w==null){percent=-1;reason=reasonText("web");lastAction="échec";paint();return;}
        lastAction="en attente";
        try{w.evaluateJavascript(SCRIPT+"(\"set\","+n+");",new ValueCallback<String>(){public void onReceiveValue(String value){
            if(!running||sentId!=serial)return;JSONObject o=parse(value);
            if(o==null||!o.optBoolean("sent",false)){percent=-1;reason=reasonText(o==null?"web":o.optString("reason","command"));lastAction="échec : "+reason;paint();Toast.makeText(getContext(),"Volume lecteur indisponible",Toast.LENGTH_SHORT).show();}
            else lastAction="événements envoyés (effet sonore inconnu)";
        }});}
        catch(RuntimeException ignored){percent=-1;reason=reasonText("command");lastAction="échec : "+reason;paint();}
        if(!dragging)handler.postDelayed(new Runnable(){public void run(){if(running)read();}},350);
    }
    private GradientDrawable surface(int color,int stroke,float radius){
        GradientDrawable d=new GradientDrawable();d.setColor(color);d.setStroke(dp(1),stroke);d.setCornerRadius(dp(radius));return d;
    }
    private GradientDrawable glassGradient(){
        GradientDrawable d=new GradientDrawable(GradientDrawable.Orientation.TL_BR,new int[]{0xf21b0d40,0xf236105a,0xf2711b68});
        d.setStroke(dp(1),0x40f0a4ff);d.setCornerRadius(dp(28));return d;
    }
    private Button action(Activity a,String text,boolean primary){
        Button b=new Button(a);b.setText(text);b.setTextColor(Color.WHITE);b.setTextSize(14);b.setAllCaps(false);b.setMinHeight(dp(48));
        b.setBackgroundTintList(null);b.setBackground(surface(primary?0xff6335a2:0x21ffffff,0x33ffffff,16));return b;
    }
    private void open(){
        final Activity a=activity();if(a==null||a.isFinishing()||a.isDestroyed()||dialog!=null)return;
        try{
            final Dialog d=new Dialog(a);dialog=d;
            LinearLayout content=new LinearLayout(a);content.setOrientation(LinearLayout.VERTICAL);content.setPadding(dp(20),dp(10),dp(20),dp(24));
            content.setBackground(glassGradient());
            TextView handle=new TextView(a);handle.setText("━━━━");handle.setTextSize(14);handle.setGravity(Gravity.CENTER);handle.setTextColor(0x88ffffff);content.addView(handle,new LinearLayout.LayoutParams(-1,dp(24)));
            TextView title=new TextView(a);title.setText("Volume du lecteur");title.setTextSize(22);title.setTextColor(Color.WHITE);content.addView(title,new LinearLayout.LayoutParams(-1,dp(40)));
            TextView subtitle=new TextView(a);subtitle.setText("Le volume du téléphone reste inchangé");subtitle.setTextColor(0xffc7bbdc);subtitle.setTextSize(13);content.addView(subtitle,new LinearLayout.LayoutParams(-1,dp(36)));
            LinearLayout card=new LinearLayout(a);card.setOrientation(LinearLayout.VERTICAL);card.setPadding(dp(16),dp(12),dp(16),dp(12));card.setBackground(surface(0x1affffff,0x20ffffff,20));
            valueLabel=new TextView(a);valueLabel.setTextColor(Color.WHITE);valueLabel.setTextSize(28);card.addView(valueLabel,new LinearLayout.LayoutParams(-1,dp(48)));
            slider=new SeekBar(a);slider.setMax(100);slider.setProgress(Math.max(0,percent));slider.setContentDescription("Volume du lecteur, de zéro à cent pour cent");
            slider.setProgressTintList(ColorStateList.valueOf(0xffc97af7));slider.setProgressBackgroundTintList(ColorStateList.valueOf(0x55ffffff));slider.setThumbTintList(ColorStateList.valueOf(0xffffefff));card.addView(slider,new LinearLayout.LayoutParams(-1,dp(48)));
            LinearLayout bounds=new LinearLayout(a);bounds.setOrientation(LinearLayout.HORIZONTAL);
            TextView low=new TextView(a);low.setText("0 %");low.setTextColor(0xffc7bbdc);low.setTextSize(12);bounds.addView(low,new LinearLayout.LayoutParams(0,dp(24),1));
            TextView high=new TextView(a);high.setText("100 %");high.setTextColor(0xffc7bbdc);high.setTextSize(12);high.setGravity(Gravity.RIGHT);bounds.addView(high,new LinearLayout.LayoutParams(0,dp(24),1));card.addView(bounds,new LinearLayout.LayoutParams(-1,dp(24)));
            content.addView(card,new LinearLayout.LayoutParams(-1,-2));
            LinearLayout actions=new LinearLayout(a);actions.setOrientation(LinearLayout.HORIZONTAL);actions.setPadding(0,dp(12),0,dp(8));
            mute=action(a,"Silence",true);actions.addView(mute,new LinearLayout.LayoutParams(0,dp(48),1));
            Button retry=action(a,"Actualiser",false);LinearLayout.LayoutParams retryLayout=new LinearLayout.LayoutParams(0,dp(48),1);retryLayout.leftMargin=dp(8);actions.addView(retry,retryLayout);content.addView(actions,new LinearLayout.LayoutParams(-1,-2));
            showValue(percent);
            mute.setOnClickListener(new View.OnClickListener(){public void onClick(View v){int p=slider.getProgress();if(p>0)lastNonZero=p;int target=p>0?0:lastNonZero;if(target<0){Toast.makeText(getContext(),"Utilisez le curseur pour réactiver",Toast.LENGTH_SHORT).show();return;}slider.setProgress(target);showValue(target);enqueue(target);}});
            slider.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener(){public void onStartTrackingTouch(SeekBar b){dragging=true;}public void onProgressChanged(SeekBar b,int p,boolean user){if(user){if(p>0)lastNonZero=p;showValue(p);enqueue(p);}}public void onStopTrackingTouch(SeekBar b){dragging=false;enqueue(b.getProgress());}});
            retry.setOnClickListener(new View.OnClickListener(){public void onClick(View v){read();}});
            Button close=action(a,"Fermer",false);close.setOnClickListener(new View.OnClickListener(){public void onClick(View v){d.dismiss();}});content.addView(close,new LinearLayout.LayoutParams(-1,dp(48)));
            d.setContentView(content);d.setCanceledOnTouchOutside(true);d.setOnDismissListener(new DialogInterface.OnDismissListener(){public void onDismiss(DialogInterface x){dialog=null;dragging=false;slider=null;valueLabel=null;mute=null;if(running)handler.postDelayed(new Runnable(){public void run(){read();}},350);}});
            d.show();Window w=d.getWindow();if(w==null){d.dismiss();return;}w.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));w.setGravity(Gravity.BOTTOM);w.setLayout(-1,-2);paint();if(percent<0)read();
        }catch(RuntimeException e){if(dialog!=null){dialog.dismiss();dialog=null;}Toast.makeText(getContext(),"Volume lecteur indisponible",Toast.LENGTH_SHORT).show();}
    }
    private void sync(){boolean show=isAttachedToWindow()&&isShown()&&getWindowVisibility()==View.VISIBLE;if(show&&!running){running=true;paint();handler.post(tick);}else if(!show&&running){running=false;serial++;readBusy=false;queued=-1;handler.removeCallbacks(tick);handler.removeCallbacks(sendTask);sendScheduled=false;percent=-1;if(dialog!=null)dialog.dismiss();paint();}}
    @Override protected void onAttachedToWindow(){super.onAttachedToWindow();sync();}
    @Override protected void onDetachedFromWindow(){running=false;serial++;handler.removeCallbacks(tick);handler.removeCallbacks(sendTask);queued=-1;sendScheduled=false;if(dialog!=null)dialog.dismiss();super.onDetachedFromWindow();}
    @Override protected void onVisibilityChanged(View v,int visibility){super.onVisibilityChanged(v,visibility);if(handler!=null)post(new Runnable(){public void run(){sync();}});}
    @Override protected void onWindowVisibilityChanged(int visibility){super.onWindowVisibilityChanged(visibility);if(handler!=null)post(new Runnable(){public void run(){sync();}});}
}
