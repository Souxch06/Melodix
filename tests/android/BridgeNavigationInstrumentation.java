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
    private String jsOn(WebView w,String code)throws Exception{
        CountDownLatch done=new CountDownLatch(1);AtomicReference<String> result=new AtomicReference<>();
        ui(()->w.evaluateJavascript(code,v->{result.set(v);done.countDown();}));
        check(done.await(15,TimeUnit.SECONDS));return result.get();
    }
    // Isolated, network-disabled WebView and real AndBridge. Observe whether
    // the original Java object is actually collected after same-name
    // replacement, not just whether System.gc() was requested. A second case
    // keeps a strong reference as a positive control. Never records exceptions.
    private void replacementGcProbe(Bundle result, boolean hold)throws Exception{
        final WebView[] w=new WebView[1];final Object[] strong=new Object[1];
        final java.lang.ref.WeakReference<?>[] old=new java.lang.ref.WeakReference<?>[1];
        final CountDownLatch loaded=new CountDownLatch(1);
        final Class<?> bridge=getTargetContext().getClassLoader().loadClass("com.melodix.music.AndBridge");
        ui(()->{try{
            w[0]=new WebView(getTargetContext());w[0].getSettings().setJavaScriptEnabled(true);
            w[0].setWebViewClient(new WebViewClient(){@Override public void onPageFinished(WebView v,String url){loaded.countDown();}});
            Object first=bridge.getConstructor(android.content.Context.class).newInstance(getTargetContext());
            old[0]=new java.lang.ref.WeakReference<>(first);if(hold)strong[0]=first;
            w[0].addJavascriptInterface(first,"AndBridge");
            w[0].loadDataWithBaseURL("https://open.spotify.com/fixture","<!doctype html><title>fixture</title>","text/html","UTF-8",null);
        }catch(Exception e){throw new RuntimeException(e);}});
        try{
            check(loaded.await(15,TimeUnit.SECONDS));
            check("\"number\"".equals(jsOn(w[0],"typeof AndBridge.getSessionGeneration()")));
            ui(()->{try{Object next=bridge.getConstructor(android.content.Context.class).newInstance(getTargetContext());w[0].addJavascriptInterface(next,"AndBridge");}catch(Exception e){throw new RuntimeException(e);}});
            for(int i=0;i<15;i++){
                System.gc();System.runFinalization();Thread.sleep(100);
            }
            boolean collected=old[0].get()==null;
            String probe=jsOn(w[0],"(function(){try{var v=AndBridge.getSessionGeneration();return v===null?'null':typeof v}catch(e){return 'exception'}})()");
            String category=probe.replace("\"","");
            check(category.matches("number|null|undefined|exception|boolean|string|object"));
            String prefix=hold?"gc_retained":"gc_replaced";
            result.putString(prefix+"_collected",collected?"yes":"no");
            result.putString(prefix+"_result",category);
            if(hold){check(!collected);check("number".equals(category));}
        }finally{ui(()->w[0].destroy());strong[0]=null;}
    }

    private String asset(String name)throws Exception{
        try(java.io.InputStream in=getTargetContext().getAssets().open(name); java.io.ByteArrayOutputStream out=new java.io.ByteArrayOutputStream()){
            byte[] b=new byte[8192];for(int n;(n=in.read(b))!=-1;)out.write(b,0,n);return new String(out.toByteArray(),StandardCharsets.UTF_8);
        }
    }
    private void await(String url,Runnable navigate)throws Exception{
        CountDownLatch done=new CountDownLatch(1);expected.set(url);waiter.set(done);ui(navigate);
        check(done.await(20,TimeUnit.SECONDS));check(callbackError==null);
    }
    @Override public void onStart(){
        Bundle outcome=new Bundle();
        try{
            // Browser major only: compare the emulator engine with a reported
            // device without recording user-agent strings or package metadata.
            if(android.os.Build.VERSION.SDK_INT>=26){
                android.content.pm.PackageInfo provider=WebView.getCurrentWebViewPackage();
                String version=provider==null?null:provider.versionName;
                String major=version==null?"unknown":version.split("\\.")[0];
                outcome.putString("webview_major",major.matches("[0-9]{1,4}")?major:"unknown");
            }
            phase="installed_build_identity";
            android.content.pm.PackageInfo installed=getTargetContext().getPackageManager().getPackageInfo(getTargetContext().getPackageName(),0);
            long installedCode=android.os.Build.VERSION.SDK_INT>=28?installed.getLongVersionCode():installed.versionCode;
            Class<?> buildInfo=getTargetContext().getClassLoader().loadClass("com.melodix.music.NativeSessionBuildInfo");
            String identity=(String)buildInfo.getMethod("append",String.class,android.content.Context.class).invoke(null,"fixture",getTargetContext());
            check(identity.contains("VersionCode="+installedCode));
            check(identity.contains("build="+installed.versionName));
            phase="replacement_gc_probe";
            replacementGcProbe(outcome,false);
            phase="retained_gc_control";
            replacementGcProbe(outcome,true);
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
            String visible=js("(function(){try{if(!window.AndBridge)return 'missing';return typeof window.AndBridge.getSessionGeneration}catch(e){return 'exception'}})()").replace("\"","");
            if(!visible.matches("missing|function|undefined|null|object|string|number|boolean|exception"))visible="other";
            phase="player_bridge_visible_"+visible;
            check("function".equals(visible));
            // Exercise the actual retry poller and JavaScriptInterface after
            // changing generations on the UI thread without reloading the page.
            // Synthetic hook counts dispatches and makes no network requests.
            Class<?> gate=getTargetContext().getClassLoader().loadClass("com.melodix.music.NativeSessionGate");
            Class<?> launch=getTargetContext().getClassLoader().loadClass("com.melodix.music.NativeSessionRetryLaunch");
            phase="generation_before";
            ui(()->{try{gate.getField("state").setInt(null,0);gate.getField("loginActive").setBoolean(null,false);gate.getField("generation").setInt(null,9);}catch(Exception e){throw new RuntimeException(e);}});
            check("true".equals(js("typeof AndBridge.getSessionGeneration()==='number' && AndBridge.getSessionGeneration()===9")));
            check("true".equals(js("window.fixtureCount=0;window.__sfRequestSessionVerification=function(){window.fixtureCount++;return true};true")));
            phase="retry_first_generation";
            Runnable first=(Runnable)launch.getConstructor(WebView.class,int.class).newInstance(view[0],9);
            ui(first::run);
            check("1".equals(js("window.fixtureCount")));
            phase="generation_after";
            ui(()->{try{gate.getField("generation").setInt(null,10);}catch(Exception e){throw new RuntimeException(e);}});
            check("true".equals(js("typeof AndBridge.getSessionGeneration()==='number' && AndBridge.getSessionGeneration()===10")));
            phase="retry_next_generation";
            Runnable second=(Runnable)launch.getConstructor(WebView.class,int.class).newInstance(view[0],10);
            ui(second::run);
            check("2".equals(js("window.fixtureCount")));
            phase="retry_stale_generation";
            Runnable stale=(Runnable)launch.getConstructor(WebView.class,int.class).newInstance(view[0],9);
            ui(stale::run);
            check("2".equals(js("window.fixtureCount")));
            // The production onPageStarted attaches a new object even when
            // one is already visible in the active document. Exercise this
            // explicitly; the previous fixture only attached before load.
            phase="repeat_attach_active_document";
            ui(()->prepare(view[0],PLAYER));
            phase="repeat_attach_active_document_type";
            String bridgeType=js("(function(){try{var x=AndBridge.getSessionGeneration();return x===null?'null':typeof x}catch(e){return 'exception'}})()");
            outcome.putString("repeat_attach_type",bridgeType.replace("\"",""));
            phase="repeat_attach_active_document_generation";
            check("true".equals(js("AndBridge.getSessionGeneration()===10")));
            Runnable again=(Runnable)launch.getConstructor(WebView.class,int.class).newInstance(view[0],10);
            ui(again::run);
            check("3".equals(js("window.fixtureCount")));
            // Exercise stale-object collection after replacement as an
            // additional hypothesis, not proof that GC occurred.
            phase="repeat_attach_gc";
            System.gc();System.runFinalization();System.gc();
            String afterGc=js("(function(){try{var x=AndBridge.getSessionGeneration();return x===null?'null':typeof x}catch(e){return 'exception'}})()");
            outcome.putString("repeat_attach_after_gc_type",afterGc.replace("\"",""));
            check("true".equals(js("AndBridge.getSessionGeneration()===10")));
            // Real generated scripts plus the actual AndBridge and poller on a
            // synthetic document. All network is disabled on the disposable
            // emulator; no Spotify account or cookie is present in this test.
            phase="native_flight_guard";
            Class<?> flight=getTargetContext().getClassLoader().loadClass("com.melodix.music.NativeSessionVerificationFlight");
            ui(()->{try{flight.getMethod("start").invoke(null);}catch(Exception e){throw new RuntimeException(e);}});
            check("true".equals(js("AndBridge.isSessionRetryActive(10)===true && AndBridge.isSessionRetryActive(9)===false")));
            phase="native_flight_expired";
            java.lang.reflect.Field until=flight.getDeclaredField("until");until.setAccessible(true);
            ui(()->{try{until.setLong(null,0);}catch(Exception e){throw new RuntimeException(e);}});
            check("true".equals(js("AndBridge.isSessionRetryActive(10)===false")));
            ui(()->{try{flight.getMethod("start").invoke(null);}catch(Exception e){throw new RuntimeException(e);}});
            // Synthetic in-memory HTTP responses: hold the first token request
            // until a queued retry has been invalidated. Refused tokens must not cause a library request.
            phase="synthetic_refusal_fetch";
            check("true".equals(js("window.fixtureFetches=0;window.fixtureRoutes=[];window.fixtureHoldNext=true;window.fixtureTokenMode=false;window.fetch=function(url){var u=String(url),route=u.indexOf('/api/token')>=0?'api':u.indexOf('get_access_token')>=0?'fallback':'library';window.fixtureRoutes.push(route);++window.fixtureFetches;if(window.fixtureHoldNext){window.fixtureHoldNext=false;return new Promise(function(resolve){window.fixtureResolve=function(){resolve(new Response('{}',{status:400,headers:{'Content-Type':'application/json'}}))}})}if(route==='api'&&window.fixtureTokenMode)return Promise.resolve(new Response(JSON.stringify({accessToken:'SYNTHETIC_TEST_ONLY',accessTokenExpirationTimestampMs:Date.now()+3600000}),{status:200,headers:{'Content-Type':'application/json'}}));return Promise.resolve(new Response('{}',{status:route==='api'?400:route==='fallback'?403:401,headers:{'Content-Type':'application/json'}}))};true")));
            phase="bundled_runtime_injection";
            js(asset("runtime_state.js"));
            phase="bundled_shell_injection";
            js(asset("native_ui_shell.js"));
            check("true".equals(js("!!window.__sfNativeUiShellStarted")));
            phase="bundled_bridge_injection";
            js(asset("spotify_bridge.js"));
            check("true".equals(js("!!window.__sfMelodixBridgeCompleted")));
            phase="bundled_generation_immediate";
            check("true".equals(js("typeof AndBridge.getSessionGeneration()==='number' && AndBridge.getSessionGeneration()===10")));
            phase="queued_real_refusal_start";
            check("true".equals(js("window.checkMediaLib(true,'shell-update');true")));
            for(int i=0;i<50;i++){if("1".equals(js("window.fixtureFetches")))break;Thread.sleep(100);}
            check("true".equals(js("window.fixtureFetches===1 && typeof window.fixtureResolve==='function'")));
            phase="queued_real_retry_invalidation";
            check("true".equals(js("(function(){var p=window.__sfRequestSessionVerification(10);return !!p && typeof p.then==='function'})()")));
            ui(()->{try{gate.getField("generation").setInt(null,11);}catch(Exception e){throw new RuntimeException(e);}});
            check("true".equals(js("window.fixtureResolve();true")));
            for(int i=0;i<80;i++){if("true".equals(js("window.fixtureFetches===2 && window.fixtureRoutes.join(',')==='api,fallback' && window.__sfMediaLibStatus==='error'")))break;Thread.sleep(100);}
            Thread.sleep(300);
            check("true".equals(js("window.fixtureFetches===2 && window.fixtureRoutes.join(',')==='api,fallback' && window.__sfMediaLibStatus==='error'")));
            // Positive control: a still-current, active queued retry must run
            // exactly once once the preceding synthetic refusal completes.
            phase="queued_real_retry_current";
            ui(()->{try{gate.getField("generation").setInt(null,12);flight.getMethod("start").invoke(null);}catch(Exception e){throw new RuntimeException(e);}});
            check("true".equals(js("window.fixtureHoldNext=true;window.checkMediaLib(true,'shell-update');true")));
            for(int i=0;i<50;i++){if("3".equals(js("window.fixtureFetches")))break;Thread.sleep(100);}
            check("true".equals(js("window.fixtureFetches===3 && typeof window.fixtureResolve==='function'")));
            check("true".equals(js("(function(){var p=window.__sfRequestSessionVerification(12),q=window.__sfRequestSessionVerification(12);return !!p && p===q && typeof p.then==='function'})()")));
            check("true".equals(js("window.fixtureResolve();true")));
            for(int i=0;i<80;i++){if("true".equals(js("window.fixtureFetches===6 && window.fixtureRoutes.join(',')==='api,fallback,api,fallback,api,fallback' && window.__sfMediaLibStatus==='error'")))break;Thread.sleep(100);}
            Thread.sleep(300);
            check("true".equals(js("window.fixtureFetches===6 && window.fixtureRoutes.join(',')==='api,fallback,api,fallback,api,fallback' && window.__sfMediaLibStatus==='error'")));
            // Simulate the reported unusable primitive result while retaining the
            // real native bridge for the independent string getter, flight check
            // and callbacks. The HTTP replies remain synthetic and offline.
            phase="fallback_native_text_setup";
            ui(()->{try{gate.getField("generation").setInt(null,13);flight.getMethod("start").invoke(null);}catch(Exception e){throw new RuntimeException(e);}});
            check("true".equals(js("(function(){var n=window.AndBridge;window.fixtureNativeBridge=n;window.fixtureVerification=null;window.AndBridge=new Proxy(n,{get:function(t,k){if(k==='getSessionGeneration')return function(){return undefined};if(k==='onSessionVerification')return function(v){window.fixtureVerification=JSON.parse(v);return n.onSessionVerification(v)};var v=t[k];return typeof v==='function'?function(){return v.apply(n,arguments)}:v}});return AndBridge.getSessionGeneration()===undefined&&AndBridge.getSessionGenerationText()==='13'&&AndBridge.isSessionRetryActive(13)===true})()")));
            phase="fallback_stale_native_text";
            check("true".equals(js("window.__sfRequestSessionVerification(12)===false && window.fixtureFetches===6")));
            Runnable fallbackStale=(Runnable)launch.getConstructor(WebView.class,int.class).newInstance(view[0],12);
            ui(fallbackStale::run);
            check("6".equals(js("window.fixtureFetches")));
            phase="fallback_real_retry";
            Runnable fallback=(Runnable)launch.getConstructor(WebView.class,int.class).newInstance(view[0],13);
            ui(fallback::run);
            for(int i=0;i<80;i++){if("true".equals(js("window.fixtureFetches===8 && window.fixtureVerification!==null")))break;Thread.sleep(100);}
            check("true".equals(js("window.fixtureFetches===8 && window.fixtureRoutes.join(',')==='api,fallback,api,fallback,api,fallback,api,fallback' && window.fixtureVerification.generation===13 && window.fixtureVerification.tokenApiHttp===400 && window.fixtureVerification.tokenFallbackHttp===403 && window.fixtureVerification.libraryHttp===0 && window.fixtureVerification.token===false && window.fixtureVerification.libraryOk===false")));
            // Independent synthetic 401 control: library is called only after
            // the fixture returns a valid bearer. This is not a real account.
            phase="synthetic_valid_token_library_401";
            ui(()->{try{gate.getField("generation").setInt(null,14);flight.getMethod("start").invoke(null);}catch(Exception e){throw new RuntimeException(e);}});
            phase="synthetic_valid_start";
            check("true".equals(js("window.fixtureTokenMode=true;window.fixtureVerification=null;window.__sfRequestSessionVerification(14)!==false")));
            for(int i=0;i<80;i++){if("true".equals(js("window.fixtureFetches===10 && window.fixtureVerification!==null")))break;Thread.sleep(100);}
            phase="synthetic_valid_proof";
            check("true".equals(js("window.fixtureFetches===10 && window.fixtureRoutes.slice(-2).join(',')==='api,library' && window.fixtureVerification.generation===14 && window.fixtureVerification.tokenApiHttp===200 && window.fixtureVerification.tokenFallbackHttp===0 && window.fixtureVerification.libraryHttp===401 && window.fixtureVerification.token===true && window.fixtureVerification.libraryOk===false")));
            phase="synthetic_valid_restore_bridge";
            // Keep only closed type categories: no getter value or exception
            // text. Probe each native method separately after proxy removal.
            String restored=js("(function(){window.AndBridge=window.fixtureNativeBridge;function kind(f){try{var x=f();return x===null?'null':typeof x}catch(e){return 'exception'}}return kind(function(){return AndBridge.getSessionGeneration()})+'_'+kind(function(){return AndBridge.getSessionGenerationText()})})()");
            String restoreKind=restored.replace("\"", "");
            if(!restoreKind.matches("(number|null|undefined|string|boolean|object|exception)_(number|null|undefined|string|boolean|object|exception)"))restoreKind="other";
            phase="synthetic_valid_restore_"+restoreKind;
            check(restoreKind.startsWith("number_"));
            ui(()->{try{gate.getField("generation").setInt(null,10);}catch(Exception e){throw new RuntimeException(e);}});
            // Let the shell's scheduled updates run, as in the reported trace.
            Thread.sleep(3000);
            phase="bundled_generation_delayed";
            check("true".equals(js("typeof AndBridge.getSessionGeneration()==='number' && AndBridge.getSessionGeneration()===10")));
            phase="bundled_retry_dispatch";
            check("true".equals(js("window.fixtureCount=0;window.__sfRequestSessionVerification=function(){window.fixtureCount++;return true};true")));
            Runnable bundled=(Runnable)launch.getConstructor(WebView.class,int.class).newInstance(view[0],10);
            ui(bundled::run);
            check("1".equals(js("window.fixtureCount")));
            phase="return_login";
            await(LOGIN,()->view[0].evaluateJavascript("document.getElementById('next').click()",null));
            phase="return_login_bridge_absent";
            check("\"undefined\"".equals(js("typeof window.AndBridge")));
            // Reproduce the reported 3-track squeeze using an isolated local
            // grid and the existing full-viewport rule, not Spotify content.
            // No login, session storage or network is involved.
            phase="synthetic_grid_load";
            final String layoutUrl="https://layout-fixture.invalid/";
            byte[] cssBytes;
            try (java.io.InputStream input=getTargetContext().getAssets().open("css_hacks.css"); java.io.ByteArrayOutputStream out=new java.io.ByteArrayOutputStream()) {
                byte[] buffer=new byte[8192];for(int n;(n=input.read(buffer))!=-1;)out.write(buffer,0,n);cssBytes=out.toByteArray();
            }
            String css=new String(cssBytes,StandardCharsets.UTF_8);
            String html="<!doctype html><html><head><meta name='viewport' content='width=device-width, initial-scale=1'>"+
                "<style>html,body{margin:0}#fixture-grid{display:grid;grid-template-columns:0px minmax(0,1fr) auto;width:100%;height:500px}"+
                "#main-view{grid-column:2;min-width:0}#main-view+div{grid-column:3;overflow:hidden}</style><style>"+css+"</style></head>"+
                "<body class='sf-mobile-shell'><div id='fixture-grid'><div id='main-view'></div><div><div><div><div></div><div><div id='fixture-wide'></div></div></div></div></div></div></body></html>";
            await(layoutUrl,()->{
                view[0].measure(android.view.View.MeasureSpec.makeMeasureSpec(1080,android.view.View.MeasureSpec.EXACTLY),android.view.View.MeasureSpec.makeMeasureSpec(1800,android.view.View.MeasureSpec.EXACTLY));
                view[0].layout(0,0,1080,1800);
                view[0].loadDataWithBaseURL(layoutUrl,html,"text/html","UTF-8",null);
            });
            phase="synthetic_grid_baseline";
            check("true".equals(js("(function(){document.getElementById('fixture-wide').style.setProperty('width','100vw','important');return document.getElementById('main-view').getBoundingClientRect().width<innerWidth*0.1})()")));
            phase="synthetic_grid_scoped_width";
            check("true".equals(js("(function(){document.getElementById('fixture-wide').style.removeProperty('width');return document.getElementById('main-view').getBoundingClientRect().width>innerWidth*0.8})()")));
            phase="synthetic_grid_expanded_legacy";
            check("true".equals(js("(function(){document.body.classList.add('sf-expanded');return Math.abs(document.getElementById('fixture-wide').getBoundingClientRect().width-innerWidth)<2})()")));
            phase="synthetic_grid_fullscreen_legacy";
            check("true".equals(js("(function(){document.body.classList.remove('sf-expanded');document.body.classList.add('sf-fs-open');return Math.abs(document.getElementById('fixture-wide').getBoundingClientRect().width-innerWidth)<2})()")));
            phase="synthetic_grid_desktop_legacy";
            check("true".equals(js("(function(){document.body.classList.remove('sf-mobile-shell','sf-fs-open');return Math.abs(document.getElementById('fixture-wide').getBoundingClientRect().width-innerWidth)<2})()")));
            outcome.putString("overall","passed");
        }catch(Throwable t){outcome.putString("overall","failed");outcome.putString("phase",phase);outcome.putString("error_class",t.getClass().getSimpleName());}
        finally{if(view[0]!=null)ui(()->view[0].destroy());finish(Activity.RESULT_OK,outcome);}
    }
}
