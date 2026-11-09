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
            boolean seed = "seed".equals(arguments.getString("mode"));
            check(seed || "verify".equals(arguments.getString("mode")));
            CookieManager cookies = CookieManager.getInstance();
            if (seed) {
                phase = "seed_cookie";
                CountDownLatch cookieSet = new CountDownLatch(1);
                AtomicReference<Boolean> accepted = new AtomicReference<>(false);
                runOnMainSync(() -> {
                    cookies.setAcceptCookie(true);
                    cookies.setCookie(ORIGIN, COOKIE + "; Path=/; Max-Age=86400; Secure; SameSite=None", value -> {
                        accepted.set(value); cookieSet.countDown();
                    });
                });
                check(cookieSet.await(10, TimeUnit.SECONDS));
                check(Boolean.TRUE.equals(accepted.get()));
                cookies.flush();
            } else {
                phase = "verify_cookie";
                String found = cookies.getCookie(ORIGIN);
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
                view[0].loadDataWithBaseURL(ORIGIN, "<html><body>synthetic local test</body></html>", "text/html", "UTF-8", null);
            });
            check(loaded.await(15, TimeUnit.SECONDS));
            phase = seed ? "seed_storage" : "verify_storage";
            CountDownLatch evaluated = new CountDownLatch(1);
            AtomicReference<String> value = new AtomicReference<>();
            String script = seed
                ? "(function(){localStorage.setItem('melodix_update_fixture','synthetic_only');return localStorage.getItem('melodix_update_fixture');})()"
                : "localStorage.getItem('melodix_update_fixture')";
            runOnMainSync(() -> view[0].evaluateJavascript(script, v -> { value.set(v); evaluated.countDown(); }));
            check(evaluated.await(10, TimeUnit.SECONDS));
            check("\"synthetic_only\"".equals(value.get()));
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
