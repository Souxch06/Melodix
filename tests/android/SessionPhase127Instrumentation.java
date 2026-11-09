package com.melodix.test;

import android.app.Activity;
import android.app.Instrumentation;
import android.content.Intent;
import android.os.Bundle;
import android.os.SystemClock;
import android.webkit.CookieManager;
import android.webkit.WebResourceRequest;
import android.webkit.WebResourceResponse;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.TextView;
import java.io.ByteArrayInputStream;
import org.json.JSONObject;

/** Fresh, isolated emulator ONLY. Fake sp_dc values and HTTP observations, never real Spotify auth.
 * This harness is prepared but must not be described as executed unless a run actually passes. */
public final class SessionPhase127Instrumentation extends Instrumentation {
    private static final String PKG="com.melodix.music.preview";
    private Activity activity;
    private Class<?> gate,evidence;
    private String phase="launch";
    interface Checked { void run() throws Exception; }
    @Override public void onCreate(Bundle args) {super.onCreate(args);start();}
    private void ui(Checked task) {
        final Throwable[] failure={null};runOnMainSync(()->{try{task.run();}catch(Throwable t){failure[0]=t;}});
        waitForIdleSync();if(failure[0]!=null)throw new AssertionError("synthetic operation failed",failure[0]);
    }
    private void check(boolean ok) {if(!ok)throw new AssertionError("synthetic invariant failed");}
    private void set(String name,Object value)throws Exception{gate.getField(name).set(null,value);}
    private int count()throws Exception{return (Integer)evidence.getMethod("count").invoke(null);}
    private int state()throws Exception{return gate.getField("state").getInt(null);}
    private void begin()throws Exception{gate.getMethod("begin",activity.getClass()).invoke(null,activity);}
    private void refusal(int attempt)throws Exception{
        JSONObject o=new JSONObject().put("generation",gate.getField("generation").getInt(null)).put("attempt",attempt)
            .put("completed",true).put("token",false).put("tokenApiHttp",400).put("tokenFallbackHttp",403)
            .put("libraryHttp",401).put("libraryOk",false);
        gate.getMethod("result",activity.getClass(),String.class).invoke(null,activity,o.toString());
    }
    private void cookie(String value)throws Exception{
        final java.util.concurrent.CountDownLatch latch=new java.util.concurrent.CountDownLatch(1);
        ui(()->CookieManager.getInstance().setCookie("https://open.spotify.com/",
            "sp_dc="+value+"; Path=/; Secure; SameSite=Lax",ok->latch.countDown()));
        check(latch.await(5,java.util.concurrent.TimeUnit.SECONDS));
    }
    private void note(){Bundle b=new Bundle();b.putString("phase",phase);b.putString("result","passed");sendStatus(1,b);}
    @Override public void onStart(){Bundle result=new Bundle();try{
        gate=getTargetContext().getClassLoader().loadClass("com.melodix.music.NativeSessionGate");
        evidence=getTargetContext().getClassLoader().loadClass("com.melodix.music.NativeSessionEvidence");
        Intent launch=getTargetContext().getPackageManager().getLaunchIntentForPackage(PKG);check(launch!=null);
        launch.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);activity=startActivitySync(launch);
        ui(()->{WebView web=(WebView)activity.getClass().getField("G").get(activity);web.stopLoading();
            web.setWebViewClient(new WebViewClient(){@Override public WebResourceResponse shouldInterceptRequest(WebView w,WebResourceRequest r){return new WebResourceResponse("text/html","UTF-8",new ByteArrayInputStream(new byte[0]));}});
            set("loginActive",false);set("freshLogin",false);set("autoUsed",true);evidence.getMethod("reset").invoke(null);
        });
        cookie("synthetic-phase127-A");
        // A separate local-only WebView exercises the actual evaluateJavascript
        // callback and the fallback merger, without a Spotify request or bridge.
        phase="diagnostic_pull_real_webview";
        final WebView[] local={null};
        final java.util.concurrent.CountDownLatch loaded=new java.util.concurrent.CountDownLatch(1);
        final int[] observedGeneration={0},beforeCount={0};
        ui(()->{begin();observedGeneration[0]=gate.getField("generation").getInt(null);beforeCount[0]=count();
            local[0]=new WebView(activity);local[0].getSettings().setJavaScriptEnabled(true);
            local[0].setWebViewClient(new WebViewClient(){@Override public void onPageFinished(WebView v,String u){loaded.countDown();}});
            String snapshot="{generation:"+observedGeneration[0]+",attempt:2,source:'native-retry',apiHttp:400,fallbackHttp:403,libraryHttp:401,completed:true,tokenResult:'refused',reason:''}";
            local[0].loadDataWithBaseURL(null,"<html><script>window.__sfSessionRetrySnapshot="+snapshot+";</script></html>","text/html","UTF-8",null);
        });
        check(loaded.await(10,java.util.concurrent.TimeUnit.SECONDS));
        ui(()->{Class<?> pull=getTargetContext().getClassLoader().loadClass("com.melodix.music.NativeSessionDiagnosticPull");
            Runnable task=(Runnable)pull.getConstructor(WebView.class,int.class).newInstance(local[0],observedGeneration[0]);task.run();});
        // evaluateJavascript is asynchronous; no sleeping on the main thread.
        SystemClock.sleep(1500);
        ui(()->{String details=(String)gate.getMethod("details").invoke(null);
            check(details.contains("Tentative "+observedGeneration[0]+"/2"));check(details.contains("bibliothèque=401"));
            check(details.contains("terminée=oui"));check(count()==beforeCount[0]);
            local[0].destroy();});note();
        phase="one_complete_refusal";ui(()->{begin();refusal(1);check(count()==1&&state()==4);});note();
        // Start the same native begin used by Retry, without real network work.
        phase="slow_retry_deadline_retains_one";ui(()->begin());SystemClock.sleep(3400);
        ui(()->check(count()==1&&state()==4));note();
        phase="second_distinct_refusal_same_cookie";ui(()->{refusal(2);check(count()==2&&state()==2);
            TextView title=(TextView)activity.findViewById(activity.getResources().getIdentifier("sessionTitle","id",PKG));
            check(title.getText().toString().equals("Ta session Spotify semble expirée"));refusal(2);check(count()==2);
        });note();
        phase="replaced_cookie_deadline_clears";cookie("synthetic-phase127-B");ui(()->begin());SystemClock.sleep(3400);
        ui(()->check(count()==0&&state()==4));note();
        result.putString("overall","passed");finish(Activity.RESULT_OK,result);
    }catch(Throwable t){result.putString("overall","failed");result.putString("phase",phase);result.putString("error_class",t.getClass().getSimpleName());finish(Activity.RESULT_CANCELED,result);}}
}
