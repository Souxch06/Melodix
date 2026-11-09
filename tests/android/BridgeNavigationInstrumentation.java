package com.melodix.test;

import android.app.Activity;
import android.app.Instrumentation;
import android.net.Uri;
import android.os.Bundle;
import android.webkit.WebResourceRequest;
import android.webkit.WebResourceResponse;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import java.io.ByteArrayInputStream;
import java.lang.reflect.Method;
import java.nio.charset.StandardCharsets;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicReference;

/** Offline synthetic pages; no real Spotify requests, login, tokens or cookies. */
public final class BridgeNavigationInstrumentation extends Instrumentation {
    private static final String LOGIN="https://accounts.spotify.com/fixture";
    private static final String PLAYER="https://open.spotify.com/fixture";
    private final AtomicReference<CountDownLatch> waiter=new AtomicReference<>();
    private final AtomicReference<String> expected=new AtomicReference<>();
    private final WebView[] view=new WebView[1];
    private Method prepare, policy;
    private volatile Throwable callbackError;
    private String phase="setup";
    @Override public void onCreate(Bundle b){super.onCreate(b);start();}
    private void check(boolean value){if(!value)throw new AssertionError();}
    private void ui(Runnable task){runOnMainSync(task);waitForIdleSync();}
    private void prepare(WebView w,String url){try{prepare.invoke(null,w,url);}catch(Throwable t){callbackError=t;}}
    private String js(String code)throws Exception{
        CountDownLatch done=new CountDownLatch(1);AtomicReference<String> result=new AtomicReference<>();
        ui(()->view[0].evaluateJavascript(code,v->{result.set(v);done.countDown();}));
        check(done.await(15,TimeUnit.SECONDS));check(callbackError==null);return result.get();
    }
    private void await(String url,Runnable navigate)throws Exception{
        CountDownLatch done=new CountDownLatch(1);expected.set(url);waiter.set(done);ui(navigate);
        check(done.await(20,TimeUnit.SECONDS));check(callbackError==null);
    }
    @Override public void onStart(){
        Bundle outcome=new Bundle();
        try{
            prepare=getTargetContext().getClassLoader().loadClass("com.melodix.music.NativeBridgeNavigation").getMethod("prepare",WebView.class,String.class);
            policy=getTargetContext().getClassLoader().loadClass("com.melodix.music.SpotifyNavigationPolicy").getMethod("handle",WebView.class,Uri.class,boolean.class);
            ui(()->{
                view[0]=new WebView(getTargetContext());view[0].getSettings().setJavaScriptEnabled(true);
                view[0].setWebViewClient(new WebViewClient(){
                    @Override public WebResourceResponse shouldInterceptRequest(WebView w,WebResourceRequest request){
                        String url=request.getUrl().toString();String next=url.equals(LOGIN)?PLAYER:LOGIN;
                        String html="<!doctype html><a id='next' href='"+next+"'>next</a>";
                        return new WebResourceResponse("text/html","UTF-8",new ByteArrayInputStream(html.getBytes(StandardCharsets.UTF_8)));
                    }
                    @Override public boolean shouldOverrideUrlLoading(WebView w,WebResourceRequest r){
                        if(r.isForMainFrame())prepare(w,r.getUrl().toString());
                        try{return (Boolean)policy.invoke(null,w,r.getUrl(),r.isForMainFrame());}
                        catch(Throwable t){callbackError=t;return true;}
                    }
                    @Override public void onPageStarted(WebView w,String url,android.graphics.Bitmap icon){prepare(w,url);}
                    @Override public void onPageFinished(WebView w,String url){CountDownLatch l=waiter.get();if(l!=null&&url.equals(expected.get()))l.countDown();}
                });
            });
            phase="login_load";
            await(LOGIN,()->{prepare(view[0],LOGIN);view[0].loadUrl(LOGIN);});
            phase="login_bridge_absent";
            check("\"undefined\"".equals(js("typeof window.AndBridge")));
            phase="player_navigation";
            await(PLAYER,()->view[0].evaluateJavascript("document.getElementById('next').click()",null));
            phase="player_bridge_visible";
            check("\"function\"".equals(js("typeof window.AndBridge.getSessionGeneration")));
            phase="return_login";
            await(LOGIN,()->view[0].evaluateJavascript("document.getElementById('next').click()",null));
            phase="return_login_bridge_absent";
            check("\"undefined\"".equals(js("typeof window.AndBridge")));
            outcome.putString("overall","passed");
        }catch(Throwable t){outcome.putString("overall","failed");outcome.putString("phase",phase);outcome.putString("error_class",t.getClass().getSimpleName());}
        finally{if(view[0]!=null)ui(()->view[0].destroy());finish(Activity.RESULT_OK,outcome);}
    }
}
