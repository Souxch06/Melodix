package com.melodix.diagnostic;

import android.app.Activity;
import android.app.Application;
import android.app.Instrumentation;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.net.Uri;
import android.webkit.WebView;
import org.json.JSONTokener;

/** CI-only, same-signature instrumentation. Read-only, offline, no credentials. */
public final class DemoReturnProbe extends Instrumentation {
    private final Handler handler = new Handler(Looper.getMainLooper());
    private volatile boolean resumed;
    private static final String JS = "(function(){try{" +
      "var h=location.hostname==='accounts.spotify.com'?'accounts':location.hostname==='open.spotify.com'?'player':location.protocol==='chrome-error:'?'chrome-error':location.protocol==='about:'?'about':'other';" +
      "var s=function(x){return typeof x==='undefined'?'undefined':x===true?'true':x===false?'false':'other'};" +
      "var d=['loading','interactive','complete'].indexOf(document.readyState)>=0?document.readyState:'other';" +
      "return 'host='+h+' ready='+d+' started='+s(window.__sfMelodixBridgeStarted)+' bootstrap='+s(window.__sfMelodixBridgeBootstrapReady)+' home='+(document.getElementById('sf-melodix-home')?'true':'false')+' interface='+(typeof window.AndBridge==='object'?'true':'false');" +
      "}catch(e){return 'probe-error';}})()";
    private static WebView web(Activity a) {
        try {
            Object value=a.getClass().getField("G").get(a);
            return value instanceof WebView ? (WebView)value : null;
        } catch (ReflectiveOperationException e) { return null; }
    }
    private static String nativeHost(WebView w) {
        String url=w.getUrl();
        if (url==null) return "none";
        String host=Uri.parse(url).getHost();
        if ("accounts.spotify.com".equalsIgnoreCase(host)) return "accounts";
        if ("open.spotify.com".equalsIgnoreCase(host)) return "player";
        return "other";
    }
    private void sample(Activity a) {
        if (!resumed || a.isFinishing() || a.isDestroyed()) return;
        try {
            WebView w=web(a);
            if (w==null) Log.i("MDXDOM", "web=absent");
            else {
                int progress=w.getProgress();
                String nativeHost=nativeHost(w);
                w.evaluateJavascript(JS, raw -> {
                    try {
                        Object value=new JSONTokener(raw).nextValue();
                        String result=String.valueOf(value);
                        if (result.matches("host=(accounts|player|chrome-error|about|other) ready=(loading|interactive|complete|other) started=(undefined|true|false|other) bootstrap=(undefined|true|false|other) home=(true|false) interface=(true|false)"))
                            Log.i("MDXDOM", "progress="+progress+" nativehost="+nativeHost+" "+result);
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
