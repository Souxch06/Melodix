package com.melodix.music;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.res.ColorStateList;
import android.content.DialogInterface;
import android.graphics.Color;
import android.graphics.Typeface;
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
    private static final String SCRIPT = "(function(action, requested) {\n    'use strict';\n    // Spotify player volume only; never Android audio, session data or network.\n    // Methods in order, each verified by reading the value again:\n    // (a) native range setter + input/change, (b) pointer on the volume track,\n    // (c) volume of the page's own media element.\n    var journal = [];\n    function ranges() {\n        return Array.from(document.querySelectorAll('[data-testid=\"volume-bar\"] input[type=\"range\"], input[data-testid=\"volume-bar\"][type=\"range\"]')).filter(function(n) { return n.isConnected; });\n    }\n    function readRange(input) {\n        if (!input) return null;\n        var min = input.hasAttribute('min') ? Number(input.min) : 0, max = input.hasAttribute('max') ? Number(input.max) : 100, current = Number(input.value);\n        if (!isFinite(min) || !isFinite(max) || max <= min || !isFinite(current) || current < min || current > max) return null;\n        return {percent: Math.round(100 * (current - min) / (max - min)), min: min, max: max};\n    }\n    function media() {\n        return Array.from(document.querySelectorAll('audio, video')).filter(function(m) { return typeof m.volume === 'number' && isFinite(m.volume); });\n    }\n    var list = ranges(), input = list.length === 1 ? list[0] : null;\n    var disabled = input && (input.disabled || input.matches(':disabled') || input.closest('[aria-disabled=\"true\"]'));\n    var current = disabled ? null : readRange(input);\n    if (action === 'query') {\n        if (current) return JSON.stringify({ok: true, percent: current.percent, method: 'range'});\n        var players = media();\n        if (players.length === 1) return JSON.stringify({ok: true, percent: Math.round(players[0].volume * 100), method: 'media'});\n        return JSON.stringify({ok: false, reason: disabled ? 'disabled' : list.length > 1 ? 'ambiguous' : input ? 'range' : 'absent'});\n    }\n    var target = Number(requested);\n    if (action !== 'set' || !isFinite(target) || target < 0 || target > 100) return JSON.stringify({ok: false, reason: 'request'});\n    // Never act on a disabled, duplicated or out-of-range Spotify control.\n    if (disabled) return JSON.stringify({ok: false, reason: 'disabled'});\n    if (list.length > 1) return JSON.stringify({ok: false, reason: 'ambiguous'});\n    if (input && !current) return JSON.stringify({ok: false, reason: 'range'});\n    var bar0 = document.querySelector('[data-testid=\"volume-bar\"]');\n    if (bar0 && (bar0.getAttribute('aria-disabled') === 'true' || bar0.closest('[aria-disabled=\"true\"], fieldset:disabled'))) return JSON.stringify({ok: false, reason: 'disabled'});\n    function near(p) { return p !== null && Math.abs(p - target) <= 2; }\n    function done(method) { return JSON.stringify({ok: true, sent: true, method: method, journal: journal.join('>')}); }\n    // (a) native setter on the unique range.\n    if (current) {\n        try {\n            var value = current.min + (current.max - current.min) * target / 100;\n            var setter = Object.getOwnPropertyDescriptor(HTMLInputElement.prototype, 'value').set;\n            setter.call(input, String(value));\n            input.dispatchEvent(new Event('input', {bubbles: true}));\n            input.dispatchEvent(new Event('change', {bubbles: true}));\n            var after = readRange(input);\n            if (near(after ? after.percent : null)) { journal.push('a:ok'); return done('range'); }\n            journal.push('a:unchanged');\n        } catch (_) { journal.push('a:error'); }\n    } else journal.push(disabled ? 'a:disabled' : 'a:absent');\n    // (b) pointer press at the target position on the visible track.\n    try {\n        var bar = document.querySelector('[data-testid=\"volume-bar\"]');\n        var track = bar && (bar.querySelector('[data-testid=\"progress-bar\"]') || bar.querySelector('[role=\"slider\"]') || bar);\n        var box = track ? track.getBoundingClientRect() : null;\n        if (box && box.width > 4) {\n            var x = box.left + box.width * target / 100, y = box.top + box.height / 2;\n            var base = {bubbles: true, cancelable: true, clientX: x, clientY: y, button: 0, buttons: 1, pointerId: 1, pointerType: 'mouse', isPrimary: true};\n            var Pointer = typeof PointerEvent === 'function' ? PointerEvent : MouseEvent;\n            track.dispatchEvent(new Pointer('pointerdown', base));\n            track.dispatchEvent(new MouseEvent('mousedown', base));\n            document.dispatchEvent(new Pointer('pointerup', base));\n            document.dispatchEvent(new MouseEvent('mouseup', base));\n            var again = readRange(input || (ranges()[0] || null));\n            if (near(again ? again.percent : null)) { journal.push('b:ok'); return done('pointer'); }\n            journal.push('b:unchanged');\n        } else journal.push('b:no-track');\n    } catch (_) { journal.push('b:error'); }\n    // (c) the page's own media element(s).\n    try {\n        var players = media();\n        if (players.length) {\n            players.forEach(function(m) { m.volume = target / 100; });\n            if (players.every(function(m) { return Math.abs(m.volume * 100 - target) <= 1; })) { journal.push('c:ok'); return done('media'); }\n            journal.push('c:unchanged');\n        } else journal.push('c:absent');\n    } catch (_) { journal.push('c:error'); }\n    // (d) web-player keyboard volume (Ctrl+Up/Down, mute Ctrl+Shift+Down):\n    // unverifiable, so reported as sent only, never as a confirmed value.\n    try {\n        var from = Number(arguments[2]);\n        var target2 = document.body;\n        var send = function(code, shift) {\n            ['keydown', 'keyup'].forEach(function(type) {\n                target2.dispatchEvent(new KeyboardEvent(type, {key: code, code: code, ctrlKey: true, shiftKey: !!shift, bubbles: true, cancelable: true}));\n            });\n        };\n        if (target === 0) { send('ArrowDown', true); journal.push('d:ctrl-shift-down'); return JSON.stringify({ok: true, sent: true, unverified: true, method: 'keyboard', journal: journal.join('>')}); }\n        if (isFinite(from) && from >= 0) {\n            var steps = Math.min(10, Math.round(Math.abs(target - from) / 10));\n            for (var k = 0; k < steps; k++) send(target > from ? 'ArrowUp' : 'ArrowDown', false);\n            journal.push('d:ctrl-' + (target > from ? 'up' : 'down') + 'x' + steps);\n            if (steps) return JSON.stringify({ok: true, sent: true, unverified: true, method: 'keyboard', journal: journal.join('>')});\n        } else journal.push('d:no-start');\n    } catch (_) { journal.push('d:error'); }\n    return JSON.stringify({ok: false, reason: 'command', journal: journal.join('>')});\n})\n";
    private final Handler handler=new Handler(Looper.getMainLooper());
    private boolean running,readBusy,dragging,sendScheduled;
    private long readAt,serial,lastSent=-1000;
    private int percent=-1,queued=-1,lastNonZero=-1;
    private String reason="page non accessible";
    private static String lastPage="non observée", lastAction="aucune";
    public static String diagnosticReport(){return "\nVolume lecteur — page : "+lastPage+" ; action : "+lastAction+" ; son non vérifié";}
    private static String method(String m){return m.equals("range")?"curseur":m.equals("pointer")?"pointeur sur la barre":m.equals("media")?"élément audio":m.equals("keyboard")?"clavier Ctrl (non vérifié)":"inconnue";}
    private static String clean(String x){StringBuilder b=new StringBuilder();for(char c:x.toCharArray()){if((c>='a'&&c<='z')||c==':'||c=='>'||c=='-')b.append(c);if(b.length()>80)break;}return b.length()==0?"aucune":b.toString();}
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
        // Same layout as the other tiles: enlarged icon line, then one short line.
        String label=(percent==0?"◖×":"◖))")+"\n"+(percent<0?"Volume":percent+" %");
        android.text.SpannableString styled=new android.text.SpannableString(label);
        styled.setSpan(new android.text.style.RelativeSizeSpan(2.2f),0,label.indexOf('\n'),android.text.Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        setText(styled);setContentDescription(percent<0?"Volume du lecteur indisponible : "+reason:"Volume du lecteur : "+percent+" pour cent");
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
            else {lastPage=percent+" % observé via "+method(o.optString("method",""));if(percent>0)lastNonZero=percent;}
            paint();
        }});}catch(RuntimeException ignored){readBusy=false;percent=-1;reason=reasonText("web");lastPage=reason;paint();}
    }
    private void showValue(int n){
        if(valueLabel!=null)valueLabel.setText(n+" %");
        if(mute!=null){
            mute.setText(n==0?"◖))  Réactiver":"◖×  Silence");
            mute.setContentDescription(n==0?"Réactiver le volume du lecteur":"Mettre le lecteur en silence");
        }
    }
    private void enqueue(int n){queued=Math.max(0,Math.min(100,n));if(!sendScheduled){sendScheduled=true;long delay=Math.max(0,100-(SystemClock.elapsedRealtime()-lastSent));handler.postDelayed(sendTask,delay);}}
    private void send(){
        if(!running||queued<0)return;final int n=queued;queued=-1;lastSent=SystemClock.elapsedRealtime();final long sentId=++serial;readBusy=false;
        WebView w=web();if(w==null){percent=-1;reason=reasonText("web");lastAction="échec";paint();return;}
        lastAction="en attente";
        try{w.evaluateJavascript(SCRIPT+"(\"set\","+n+","+percent+");",new ValueCallback<String>(){public void onReceiveValue(String value){
            if(!running||sentId!=serial)return;JSONObject o=parse(value);
            if(o==null||!o.optBoolean("sent",false)){percent=-1;reason=reasonText(o==null?"web":o.optString("reason","command"));lastAction="échec : "+reason+(o==null?"":" ; étapes "+clean(o.optString("journal","")));paint();Toast.makeText(getContext(),"Volume lecteur indisponible",Toast.LENGTH_SHORT).show();}
            else lastAction="réglé par la méthode "+method(o.optString("method",""))+" ; étapes "+clean(o.optString("journal",""));
        }});}
        catch(RuntimeException ignored){percent=-1;reason=reasonText("command");lastAction="échec : "+reason;paint();}
        if(!dragging)handler.postDelayed(new Runnable(){public void run(){if(running)read();}},350);
    }
    private GradientDrawable surface(int color,int stroke,float radius){
        GradientDrawable d=new GradientDrawable();d.setColor(color);d.setStroke(dp(1),stroke);d.setCornerRadius(dp(radius));return d;
    }
    // Same look as the rest of the app: violet-to-magenta pill or glass pill.
    private GradientDrawable pill(boolean primary){
        GradientDrawable d=new GradientDrawable();d.setCornerRadius(dp(999));
        if(primary)d.setColors(new int[]{0xff8b4bf0,0xffe0489e});else{d.setColor(0x1cffffff);d.setStroke(dp(1),0x33ffffff);}
        return d;
    }
    private Button action(Activity a,String text,boolean primary){
        Button b=new Button(a);b.setText(text);b.setTextColor(Color.WHITE);b.setTextSize(15);b.setAllCaps(false);b.setMinHeight(dp(48));
        b.setBackgroundTintList(null);b.setBackground(pill(primary));return b;
    }
    private void open(){
        final Activity a=activity();if(a==null||a.isFinishing()||a.isDestroyed()||dialog!=null)return;
        try{
            final Dialog d=new Dialog(a);dialog=d;
            LinearLayout content=new LinearLayout(a);content.setOrientation(LinearLayout.VERTICAL);content.setPadding(dp(20),dp(10),dp(20),dp(24));
            // Aurora glass sheet: deep violet gradient, rounded top, hairline border.
            GradientDrawable sheet=new GradientDrawable();float r=dp(28);sheet.setCornerRadii(new float[]{r,r,r,r,0,0,0,0});
            sheet.setColors(new int[]{0xf73a1d6e,0xf7170b33,0xf70a0614});sheet.setStroke(dp(1),0x2affffff);content.setBackground(sheet);
            content.setPadding(dp(24),dp(10),dp(24),dp(28));
            TextView handle=new TextView(a);handle.setText("");handle.setContentDescription("Glisser vers le bas pour fermer");handle.setBackground(surface(0x55ffffff,0x00ffffff,999));
            LinearLayout.LayoutParams handleLayout=new LinearLayout.LayoutParams(dp(44),dp(5));handleLayout.gravity=Gravity.CENTER_HORIZONTAL;handleLayout.bottomMargin=dp(18);content.addView(handle,handleLayout);
            TextView title=new TextView(a);title.setText("Volume du lecteur");title.setTextSize(24);title.setTextColor(Color.WHITE);title.setTypeface(Typeface.DEFAULT_BOLD);content.addView(title,new LinearLayout.LayoutParams(-1,dp(36)));
            TextView subtitle=new TextView(a);subtitle.setText("Le volume du téléphone reste inchangé");subtitle.setTextColor(0xffb9aed6);subtitle.setTextSize(13);content.addView(subtitle,new LinearLayout.LayoutParams(-1,dp(32)));
            LinearLayout card=new LinearLayout(a);card.setOrientation(LinearLayout.VERTICAL);card.setPadding(dp(20),dp(16),dp(20),dp(14));GradientDrawable cardGlass=new GradientDrawable(GradientDrawable.Orientation.TOP_BOTTOM,new int[]{0x30ffffff,0x10ffffff});cardGlass.setCornerRadius(dp(24));cardGlass.setStroke(dp(1),0x32ffffff);card.setBackground(cardGlass);
            valueLabel=new TextView(a);valueLabel.setTextColor(Color.WHITE);valueLabel.setTextSize(44);valueLabel.setTypeface(Typeface.DEFAULT_BOLD);valueLabel.setGravity(Gravity.CENTER);card.addView(valueLabel,new LinearLayout.LayoutParams(-1,dp(64)));
            slider=new SeekBar(a);slider.setMax(100);slider.setProgress(Math.max(0,percent));slider.setContentDescription("Volume du lecteur, de zéro à cent pour cent");
            slider.setProgressTintList(ColorStateList.valueOf(0xffb46cf5));slider.setProgressBackgroundTintList(ColorStateList.valueOf(0x40ffffff));slider.setThumbTintList(ColorStateList.valueOf(0xffffffff));card.addView(slider,new LinearLayout.LayoutParams(-1,dp(48)));
            LinearLayout bounds=new LinearLayout(a);bounds.setOrientation(LinearLayout.HORIZONTAL);
            TextView low=new TextView(a);low.setText("◖×  Silence");low.setTextColor(0xffb9aed6);low.setTextSize(12);bounds.addView(low,new LinearLayout.LayoutParams(0,dp(24),1));
            TextView high=new TextView(a);high.setText("100 %  ◖))");high.setTextColor(0xffb9aed6);high.setTextSize(12);high.setGravity(Gravity.RIGHT);bounds.addView(high,new LinearLayout.LayoutParams(0,dp(24),1));card.addView(bounds,new LinearLayout.LayoutParams(-1,dp(24)));
            content.addView(card,new LinearLayout.LayoutParams(-1,-2));
            LinearLayout actions=new LinearLayout(a);actions.setOrientation(LinearLayout.HORIZONTAL);actions.setPadding(0,dp(12),0,dp(8));
            mute=action(a,"Silence",true);actions.addView(mute,new LinearLayout.LayoutParams(0,dp(48),1));
            Button retry=action(a,"↻  Actualiser",false);retry.setContentDescription("Actualiser le volume du lecteur");LinearLayout.LayoutParams retryLayout=new LinearLayout.LayoutParams(0,dp(48),1);retryLayout.leftMargin=dp(8);actions.addView(retry,retryLayout);content.addView(actions,new LinearLayout.LayoutParams(-1,-2));
            showValue(percent);
            mute.setOnClickListener(new View.OnClickListener(){public void onClick(View v){int p=slider.getProgress();if(p>0)lastNonZero=p;int target=p>0?0:lastNonZero;if(target<0){Toast.makeText(getContext(),"Utilisez le curseur pour réactiver",Toast.LENGTH_SHORT).show();return;}slider.setProgress(target);showValue(target);enqueue(target);}});
            slider.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener(){public void onStartTrackingTouch(SeekBar b){dragging=true;}public void onProgressChanged(SeekBar b,int p,boolean user){if(user){if(p>0)lastNonZero=p;showValue(p);enqueue(p);}}public void onStopTrackingTouch(SeekBar b){dragging=false;enqueue(b.getProgress());}});
            retry.setOnClickListener(new View.OnClickListener(){public void onClick(View v){read();}});
            Button close=action(a,"Fermer",false);close.setBackground(null);close.setTextColor(0xffc4b5fd);close.setOnClickListener(new View.OnClickListener(){public void onClick(View v){d.dismiss();}});content.addView(close,new LinearLayout.LayoutParams(-1,dp(48)));
            d.setContentView(content);d.setCanceledOnTouchOutside(true);d.setOnDismissListener(new DialogInterface.OnDismissListener(){public void onDismiss(DialogInterface x){dialog=null;dragging=false;slider=null;valueLabel=null;mute=null;if(running)handler.postDelayed(new Runnable(){public void run(){read();}},350);}});
            d.show();PreviewUiRestyle.sheet(content);Window w=d.getWindow();if(w==null){d.dismiss();return;}w.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));w.setGravity(Gravity.BOTTOM);w.setLayout(-1,-2);paint();if(percent<0)read();
        }catch(RuntimeException e){if(dialog!=null){dialog.dismiss();dialog=null;}Toast.makeText(getContext(),"Volume lecteur indisponible",Toast.LENGTH_SHORT).show();}
    }
    private void sync(){boolean show=isAttachedToWindow()&&isShown()&&getWindowVisibility()==View.VISIBLE;if(show&&!running){running=true;paint();handler.post(tick);}else if(!show&&running){running=false;serial++;readBusy=false;queued=-1;handler.removeCallbacks(tick);handler.removeCallbacks(sendTask);sendScheduled=false;percent=-1;if(dialog!=null)dialog.dismiss();paint();}}
    @Override protected void onAttachedToWindow(){super.onAttachedToWindow();sync();}
    @Override protected void onDetachedFromWindow(){running=false;serial++;handler.removeCallbacks(tick);handler.removeCallbacks(sendTask);queued=-1;sendScheduled=false;if(dialog!=null)dialog.dismiss();super.onDetachedFromWindow();}
    @Override protected void onVisibilityChanged(View v,int visibility){super.onVisibilityChanged(v,visibility);if(handler!=null)post(new Runnable(){public void run(){sync();}});}
    @Override protected void onWindowVisibilityChanged(int visibility){super.onWindowVisibilityChanged(visibility);if(handler!=null)post(new Runnable(){public void run(){sync();}});}
}
