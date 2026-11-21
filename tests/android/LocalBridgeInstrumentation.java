package com.melodix.test;

import android.app.Instrumentation;
import android.os.Bundle;
import android.webkit.JavascriptInterface;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.lang.reflect.Method;
import java.nio.charset.StandardCharsets;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicReference;
import org.json.JSONObject;

/** B only: disposable local HTML under a synthetic base URL, all network blocked.
 * Fake proof and data live only in this WebView; nothing authenticates Spotify. */
public final class LocalBridgeInstrumentation extends Instrumentation {
    private final WebView[] view = new WebView[1];
    private String phase = "setup";
    private Method prepare;
    private final AtomicReference<String> received = new AtomicReference<>("");
    public final class FixtureReceiver {
        @JavascriptInterface public void receive(String value) {
            if ("fixture-message".equals(value)) received.set(value);
        }
    }
    @Override public void onCreate(Bundle args) { super.onCreate(args); start(); }
    private void check(boolean value) { if (!value) throw new AssertionError(phase); }
    private void ui(Runnable r) { runOnMainSync(r); waitForIdleSync(); }
    private String js(String code) throws Exception {
        CountDownLatch done = new CountDownLatch(1); AtomicReference<String> result = new AtomicReference<>();
        ui(() -> view[0].evaluateJavascript(code, v -> { result.set(v); done.countDown(); }));
        check(done.await(20, TimeUnit.SECONDS)); return result.get();
    }
    private String asset(String name) throws Exception {
        try (InputStream in = getTargetContext().getAssets().open(name); ByteArrayOutputStream out = new ByteArrayOutputStream()) {
            byte[] b = new byte[8192]; for (int n; (n=in.read(b))!=-1;) out.write(b,0,n);
            return new String(out.toByteArray(),StandardCharsets.UTF_8);
        }
    }
    private void load(String url, boolean fixtureReceiver) throws Exception {
        CountDownLatch done = new CountDownLatch(1);
        ui(() -> {
            try {
                prepare.invoke(null, view[0], url);
                if (fixtureReceiver) view[0].addJavascriptInterface(new FixtureReceiver(), "FixtureReceiver");
                else view[0].removeJavascriptInterface("FixtureReceiver");
                view[0].setWebViewClient(new WebViewClient() {
                    @Override public void onPageFinished(WebView w,String u) { done.countDown(); }
                });
                view[0].loadDataWithBaseURL(url,
                    "<!doctype html><html lang='fr'><head><meta name='viewport' content='width=device-width'></head>"+
                    "<body><main id='main-view'></main><div id='fixture'>SYNTHETIC TEST ONLY</div></body></html>",
                    "text/html", "UTF-8", null);
            } catch (Exception e) { throw new RuntimeException(e); }
        });
        check(done.await(20, TimeUnit.SECONDS));
    }
    @Override public void onStart() {
        Bundle result = new Bundle();
        try {
            prepare = getTargetContext().getClassLoader().loadClass("com.melodix.music.NativeBridgeNavigation").getMethod("prepare",WebView.class,String.class);
            ui(() -> {
                view[0] = new WebView(getTargetContext());
                view[0].getSettings().setJavaScriptEnabled(true);
                view[0].getSettings().setBlockNetworkLoads(true);
                view[0].measure(android.view.View.MeasureSpec.makeMeasureSpec(1080,android.view.View.MeasureSpec.EXACTLY),android.view.View.MeasureSpec.makeMeasureSpec(1800,android.view.View.MeasureSpec.EXACTLY));
                view[0].layout(0,0,1080,1800);
            });
            phase = "allowed_fixture"; load("https://open.spotify.com/", true);
            phase = "native_interface";
            check("true".equals(js("typeof AndBridge.getSessionGenerationText==='function' && typeof AndBridge.getSessionGenerationText()==='string'")));
            phase = "native_to_js_dom";
            check("true".equals(js("document.getElementById('fixture').textContent='fixture-native-data';document.getElementById('fixture').textContent==='fixture-native-data'")));
            phase = "js_to_fixture_native";
            js("FixtureReceiver.receive('fixture-message')");
            for (int i=0;i<30 && !"fixture-message".equals(received.get());i++) Thread.sleep(100);
            check("fixture-message".equals(received.get()));
            phase = "runtime_injection"; js(asset("runtime_state.js"));
            phase = "shell_injection"; js(asset("native_ui_shell.js"));
            check("true".equals(js("window.__sfNativeUiShellStarted===true")));
            phase = "bridge_bootstrap";
            js("window.fetch=function(){return Promise.resolve(new Response('{}',{status:403,headers:{'Content-Type':'application/json'}}))};true");
            js(asset("spotify_bridge.js"));
            check("true".equals(js("window.__sfMelodixBridgeStarted===true && window.__sfMelodixBridgeBootstrapReady===true && window.__sfMelodixBridgeCompleted===true")));
            phase = "home_css";
            js("window.SF_CONFIG={guiMode:'csshack'};window.__sfMelodixHomeTestMode=true;var s=document.createElement('style');s.id='sf-custom-style';s.textContent="+JSONObject.quote(asset("css_hacks.css"))+";document.head.appendChild(s);true");
            phase = "home_unproven_guard"; js(asset("melodix_home.js"));
            check("true".equals(js("!document.getElementById('sf-melodix-home') && window.__sfMelodixHomeDecision==='renderer-inactive'")));
            phase = "home_synthetic_error";
            // Deliberate fake proof only inside this isolated test WebView.
            check("true".equals(js("window.__sfMediaLibSessionProofKnown=true;window.__sfMediaLibSessionProven=true;window.__sfMediaLibStatus='error';window.__sfMediaLibError='token-missing';window.__sfHomeTest.updateMelodixHome();!!document.querySelector('#sf-melodix-home .sf-melodix-home__status--error')")));
            phase = "home_synthetic_empty";
            check("true".equals(js("window.__sfMediaLibStatus='ready';window.__sfMediaLibError='';window.__sfHomeTest.updateMelodixHome();!!document.querySelector('#sf-melodix-home .sf-melodix-home__status--empty')")));
            phase = "home_navigation";
            check("true".equals(js("history.pushState({},'', '/search');window.__sfHomeTest.updateMelodixHome();!document.body.classList.contains('sf-melodix-home-active')")));
            phase = "external_origin_denied"; load("https://external.invalid/", false);
            check("true".equals(js("typeof window.AndBridge==='undefined' && typeof window.FixtureReceiver==='undefined'")));
            phase = "accounts_origin_denied"; load("https://accounts.spotify.com/", false);
            check("true".equals(js("typeof window.AndBridge==='undefined' && typeof window.FixtureReceiver==='undefined'")));
            result.putString("overall", "passed");
        } catch (Throwable t) {
            result.putString("overall", "failed"); result.putString("phase", phase); result.putString("error_class", t.getClass().getSimpleName());
        } finally {
            if (view[0] != null) ui(() -> view[0].destroy());
            finish(android.app.Activity.RESULT_OK, result);
        }
    }
}
