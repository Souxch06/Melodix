package com.melodix.diagnostic;

import android.app.Activity;
import android.app.Application;
import android.app.Instrumentation;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.webkit.WebView;
import org.json.JSONTokener;

/** CI-only, same-signature instrumentation. Read-only, offline, no credentials. */
public final class DemoReturnProbe extends Instrumentation {
    private final Handler handler = new Handler(Looper.getMainLooper());
    private volatile boolean resumed;
    private static final String JS = "(function(){try{" +
      "var h=location.hostname==='accounts.spotify.com'?'accounts':location.hostname==='open.spotify.com'?'player':'other';" +
      "var s=function(x){return typeof x==='undefined'?'undefined':x===true?'true':x===false?'false':'other'};" +
      "var d=['loading','interactive','complete'].indexOf(document.readyState)>=0?document.readyState:'other';" +
      "return 'host='+h+' ready='+d+' started='+s(window.__sfMelodixBridgeStarted)+' bootstrap='+s(window.__sfMelodixBridgeBootstrapReady)+' home='+(document.getElementById('sf-melodix-home')?'true':'false')+' interface='+(typeof window.AndBridge==='object'?'true':'false');" +
      "}catch(e){return 'probe-error';}})()";
    private static WebView web(View v) {
        if (v instanceof WebView) return (WebView)v;
        if (v instanceof ViewGroup) {
            ViewGroup group=(ViewGroup)v;
            for (int i=0;i<group.getChildCount();i++) { WebView found=web(group.getChildAt(i)); if(found!=null)return found; }
        }
        return null;
    }
    private void sample(Activity a) {
        if (!resumed || a.isFinishing() || a.isDestroyed()) return;
        try {
            WebView w=web(a.getWindow().getDecorView());
            if (w==null) Log.i("MDXDOM", "web=absent");
            else {
                int progress=w.getProgress();
                w.evaluateJavascript(JS, raw -> {
                    try {
                        Object value=new JSONTokener(raw).nextValue();
                        String result=String.valueOf(value);
                        if (result.matches("host=(accounts|player|other) ready=(loading|interactive|complete|other) started=(undefined|true|false|other) bootstrap=(undefined|true|false|other) home=(true|false) interface=(true|false)"))
                            Log.i("MDXDOM", "progress="+progress+" "+result);
                        else Log.i("MDXDOM", "probe=unavailable");
                    } catch (Exception e) { Log.i("MDXDOM", "probe=unavailable"); }
                });
            }
        } catch (RuntimeException e) { Log.i("MDXDOM", "probe=unavailable"); }
        handler.postDelayed(() -> sample(a), 5000);
    }
    @Override public void onCreate(Bundle args) {
        super.onCreate(args);
        Application app=(Application)getTargetContext().getApplicationContext();
        app.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
            public void onActivityCreated(Activity a,Bundle b) {}
            public void onActivityStarted(Activity a) {}
            public void onActivityResumed(Activity a) {
                if (a.getClass().getName().equals("com.melodix.music.MainActivity")) {
                    resumed=true; Log.i("MDXDOM", "activity=resumed"); handler.post(() -> sample(a));
                }
            }
            public void onActivityPaused(Activity a) { if(a.getClass().getName().equals("com.melodix.music.MainActivity")) { resumed=false; Log.i("MDXDOM", "activity=paused"); } }
            public void onActivityStopped(Activity a) {}
            public void onActivitySaveInstanceState(Activity a,Bundle b) {}
            public void onActivityDestroyed(Activity a) {}
        });
        start();
    }
    @Override public void onStart() {
        Log.i("MDXDOM", "probe=ready");
        try { Thread.sleep(480000); } catch (InterruptedException ignored) { Thread.currentThread().interrupt(); }
        finish(0,new Bundle());
    }
}
