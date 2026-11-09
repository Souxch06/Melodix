package com.melodix.test;

import android.app.Activity;
import android.app.Instrumentation;
import android.os.Bundle;
import android.webkit.CookieManager;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicReference;

/** Synthetic-only local WebView state, no Spotify account, network or credentials. */
public final class UpdatePersistenceInstrumentation extends Instrumentation {
    private Bundle arguments;
    private static final String ORIGIN = "https://melodix-update-fixture.invalid/";
    private static final String COOKIE = "melodix_update_fixture=synthetic_only";

    @Override public void onCreate(Bundle args) { super.onCreate(args); arguments=args; start(); }
    private static void check(boolean ok) { if (!ok) throw new AssertionError(); }
    @Override public void onStart() {
        Bundle result = new Bundle();
        WebView[] view = new WebView[1];
        String phase = "setup";
        try {
            String originCase = arguments.getString("origin_case", "upgrade");
            final String origin;
            switch (originCase) {
                case "upgrade": origin = ORIGIN; break;
                case "restart": origin = "https://melodix-restart-fixture.invalid/"; break;
                case "force_stop": origin = "https://melodix-force-stop-fixture.invalid/"; break;
                case "same_process": origin = "https://melodix-same-process-fixture.invalid/"; break;
                case "settled": origin = "https://melodix-settled-fixture.invalid/"; break;
                default: throw new AssertionError();
            }
            String mode = arguments.getString("mode");
            boolean roundtrip = "roundtrip".equals(mode);
            boolean settled = "seed_settled".equals(mode);
            boolean seed = "seed".equals(mode) || roundtrip || settled;
            check(seed || "verify".equals(arguments.getString("mode")));
            CookieManager cookies = CookieManager.getInstance();
            if (seed) {
                phase = "seed_cookie";
                CountDownLatch cookieSet = new CountDownLatch(1);
                AtomicReference<Boolean> accepted = new AtomicReference<>(false);
                runOnMainSync(() -> {
                    cookies.setAcceptCookie(true);
                    cookies.setCookie(origin, COOKIE + "; Path=/; Max-Age=86400; Secure; SameSite=None", value -> {
                        accepted.set(value); cookieSet.countDown();
                    });
                });
                check(cookieSet.await(10, TimeUnit.SECONDS));
                check(Boolean.TRUE.equals(accepted.get()));
                cookies.flush();
            } else {
                phase = "verify_cookie";
                String found = cookies.getCookie(origin);
                check(found != null && found.contains(COOKIE));
            }
            phase = "load_local_fixture";
            CountDownLatch loaded = new CountDownLatch(1);
            runOnMainSync(() -> {
                view[0] = new WebView(getTargetContext());
                view[0].getSettings().setJavaScriptEnabled(true);
                view[0].getSettings().setDomStorageEnabled(true);
                view[0].getSettings().setBlockNetworkLoads(true);
                view[0].setWebViewClient(new WebViewClient() {
                    @Override public void onPageFinished(WebView v, String url) { loaded.countDown(); }
                });
                view[0].loadDataWithBaseURL(origin, "<html><body>synthetic local test</body></html>", "text/html", "UTF-8", null);
            });
            check(loaded.await(15, TimeUnit.SECONDS));
            phase = seed ? "seed_storage_callback" : "verify_storage_callback";
            CountDownLatch evaluated = new CountDownLatch(1);
            AtomicReference<String> value = new AtomicReference<>();
            String script = seed
                ? "(function(){localStorage.setItem('melodix_update_fixture','synthetic_only');return localStorage.getItem('melodix_update_fixture');})()"
                : "localStorage.getItem('melodix_update_fixture')";
            runOnMainSync(() -> view[0].evaluateJavascript(script, v -> { value.set(v); evaluated.countDown(); }));
            check(evaluated.await(10, TimeUnit.SECONDS));
            phase = seed ? "seed_storage_value" : "verify_storage_value";
            result.putString("value_kind", "null".equals(value.get()) ? "null" : "\"synthetic_only\"".equals(value.get()) ? "expected" : "other");
            check("\"synthetic_only\"".equals(value.get()));
            if (roundtrip) {
                phase = "roundtrip_load";
                CountDownLatch reloaded = new CountDownLatch(1);
                runOnMainSync(() -> {
                    view[0].destroy();
                    view[0] = new WebView(getTargetContext());
                    view[0].getSettings().setJavaScriptEnabled(true);
                    view[0].getSettings().setDomStorageEnabled(true);
                    view[0].getSettings().setBlockNetworkLoads(true);
                    view[0].setWebViewClient(new WebViewClient() {
                        @Override public void onPageFinished(WebView v, String url) { reloaded.countDown(); }
                    });
                    view[0].loadDataWithBaseURL(origin, "<html><body>synthetic local test</body></html>", "text/html", "UTF-8", null);
                });
                check(reloaded.await(15, TimeUnit.SECONDS));
                phase = "roundtrip_storage_callback";
                CountDownLatch readAgain = new CountDownLatch(1);
                AtomicReference<String> next = new AtomicReference<>();
                runOnMainSync(() -> view[0].evaluateJavascript("localStorage.getItem('melodix_update_fixture')", v -> { next.set(v); readAgain.countDown(); }));
                check(readAgain.await(10, TimeUnit.SECONDS));
                phase = "roundtrip_storage_value";
                result.putString("value_kind", "null".equals(next.get()) ? "null" : "\"synthetic_only\"".equals(next.get()) ? "expected" : "other");
                check("\"synthetic_only\"".equals(next.get()));
            }
            if (settled) android.os.SystemClock.sleep(5000);
            result.putString("overall", "passed");
        } catch (Throwable error) {
            result.putString("overall", "failed");
            result.putString("phase", phase);
            result.putString("error_class", error.getClass().getSimpleName());
        } finally {
            if (view[0] != null) runOnMainSync(() -> view[0].destroy());
            finish(Activity.RESULT_OK, result);
        }
    }
}
