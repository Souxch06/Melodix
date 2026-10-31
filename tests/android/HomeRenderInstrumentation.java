package com.melodix.test;

import android.app.Activity;
import android.app.Instrumentation;
import android.content.Context;
import android.content.Intent;
import android.graphics.Rect;
import android.os.Bundle;
import android.view.View;
import android.webkit.ValueCallback;
import android.webkit.WebView;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

/**
 * Android integration test for the exact Preview APK built by the same CI run.
 *
 * It verifies the unauthenticated WebView/login surface and then sends an empty
 * Home payload through the real AndBridge callbacks. No playlist, title, URI,
 * credentials, cookies, or account content are fabricated or substituted.
 */
public final class HomeRenderInstrumentation extends Instrumentation {
    private static final String TARGET_PACKAGE = "com.melodix.music.preview";
    private static final long WEBVIEW_SETTLE_TIMEOUT_MS = 60000L;
    private static final long REQUIRED_STABLE_MS = 1800L;
    private static final String LOGIN_DOM_PROBE =
            "(function(){try{" +
            "var body=String((document.body&&document.body.innerText)||'').toLowerCase();" +
            "var visible=function(e){return !!(e&&e.getClientRects().length&&getComputedStyle(e).visibility!=='hidden');};" +
            "var words=/\\b(log[\\s-]?in|sign[\\s-]?in|se connecter|s'inscrire|create an account|create account|connexion)\\b/.test(body);" +
            "var password=visible(document.querySelector('input[type=\"password\"]'));" +
            "var identity=visible(document.querySelector('input[type=\"email\"],input[name=\"username\"],input[autocomplete=\"username\"]'));" +
            "var accountHost=location.hostname==='accounts.spotify.com';" +
            "var playerLogin=visible(document.querySelector('[data-testid=\"web-player-link\"]'));" +
            "return !!(words||(accountHost&&(password||identity))||(playerLogin&&body));" +
            "}catch(e){return false;}})()";

    @Override
    public void onStart() {
        super.onStart();
        try {
            Activity activity = launchTarget();
            WebView webView = awaitStableWebView(activity);
            requireUnauthenticatedSession(activity);
            final boolean loginDomVisible = awaitLoginUiVisible(webView);

            final Bundle[] loginState = new Bundle[1];
            final Throwable[] loginFailure = new Throwable[1];
            runOnMainSync(new Runnable() {
                @Override
                public void run() {
                    try {
                        loginState[0] = inspectLoginSurface(activity, webView, loginDomVisible);
                    } catch (Throwable error) {
                        loginFailure[0] = error;
                    }
                }
            });
            if (loginFailure[0] != null) throw loginFailure[0];
            sendStatus(1, loginState[0]);

            final Throwable[] dispatchFailure = new Throwable[1];
            runOnMainSync(new Runnable() {
                @Override
                public void run() {
                    try {
                        dispatchEmptyHomeThroughAndBridge(activity);
                    } catch (Throwable error) {
                        dispatchFailure[0] = error;
                    }
                }
            });
            if (dispatchFailure[0] != null) throw dispatchFailure[0];
            waitForIdleSync();
            Thread.sleep(250L);

            final Bundle[] fallbackState = new Bundle[1];
            final Throwable[] fallbackFailure = new Throwable[1];
            runOnMainSync(new Runnable() {
                @Override
                public void run() {
                    try {
                        fallbackState[0] = inspectEmptyHomeFallback(activity, webView);
                    } catch (Throwable error) {
                        fallbackFailure[0] = error;
                    }
                }
            });
            if (fallbackFailure[0] != null) throw fallbackFailure[0];

            Bundle result = new Bundle(fallbackState[0]);
            result.putString("overall", "passed");
            sendStatus(1, result);
            finish(Activity.RESULT_OK, result);
        } catch (Throwable failure) {
            Bundle status = new Bundle();
            status.putString("overall", "failed");
            status.putString("failure_type", failure.getClass().getSimpleName());
            sendStatus(2, status);
            finish(Activity.RESULT_CANCELED, status);
        }
    }

    private Activity launchTarget() {
        Intent launch = getTargetContext().getPackageManager()
                .getLaunchIntentForPackage(TARGET_PACKAGE);
        if (launch == null) throw new AssertionError("Preview launcher activity missing");
        launch.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);
        Activity activity = startActivitySync(launch);
        if (activity == null) throw new AssertionError("Preview activity did not start");
        return activity;
    }

    private WebView awaitStableWebView(final Activity activity) throws InterruptedException {
        long deadline = System.currentTimeMillis() + WEBVIEW_SETTLE_TIMEOUT_MS;
        long stableSince = 0L;
        String previousUrl = "";
        WebView lastWebView = null;

        while (System.currentTimeMillis() < deadline) {
            final WebView[] current = new WebView[1];
            final int[] progress = new int[] { -1 };
            final String[] url = new String[] { "" };
            runOnMainSync(new Runnable() {
                @Override
                public void run() {
                    current[0] = findWebView(activity);
                    if (current[0] != null) {
                        progress[0] = current[0].getProgress();
                        String currentUrl = current[0].getUrl();
                        url[0] = currentUrl == null ? "" : currentUrl;
                    }
                }
            });

            if (current[0] != null && progress[0] == 100 && !url[0].isEmpty()) {
                if (url[0].equals(previousUrl)) {
                    if (stableSince == 0L) stableSince = System.currentTimeMillis();
                    if (System.currentTimeMillis() - stableSince >= REQUIRED_STABLE_MS) {
                        return current[0];
                    }
                } else {
                    previousUrl = url[0];
                    stableSince = 0L;
                }
                lastWebView = current[0];
            } else {
                previousUrl = "";
                stableSince = 0L;
                if (current[0] != null) lastWebView = current[0];
            }
            Thread.sleep(250L);
        }
        if (lastWebView == null) {
            throw new AssertionError("WebView did not become available on the clean login launch");
        }
        throw new AssertionError("WebView page did not reach a stable completed state");
    }

    private void requireUnauthenticatedSession(Activity activity) {
        try {
            Class<?> singleton = activity.getClassLoader()
                    .loadClass("com.melodix.music.AppSingleton");
            Field loggedIn = singleton.getDeclaredField("B");
            loggedIn.setAccessible(true);
            if (loggedIn.getBoolean(null)) {
                throw new AssertionError("Clean-emulator login phase unexpectedly reports an authenticated session");
            }
        } catch (AssertionError error) {
            throw error;
        } catch (Throwable error) {
            throw new AssertionError("Could not verify the clean unauthenticated session state");
        }
    }

    private boolean awaitLoginUiVisible(final WebView webView) throws InterruptedException {
        final CountDownLatch received = new CountDownLatch(1);
        final String[] result = new String[1];
        runOnMainSync(new Runnable() {
            @Override
            public void run() {
                webView.evaluateJavascript(LOGIN_DOM_PROBE, new ValueCallback<String>() {
                    @Override
                    public void onReceiveValue(String value) {
                        result[0] = value;
                        received.countDown();
                    }
                });
            }
        });
        if (!received.await(10L, TimeUnit.SECONDS)) {
            throw new AssertionError("Spotify login DOM probe timed out");
        }
        if (!"true".equals(result[0])) {
            throw new AssertionError("The clean unauthenticated WebView has no visible login UI");
        }
        return true;
    }

    private Bundle inspectLoginSurface(Activity activity, WebView webView, boolean loginDomVisible) throws Exception {
        View nativeRoot = requiredView(activity, "nativeRoot");
        View splash = requiredView(activity, "splashOverlay");
        View webContainer = requiredView(activity, "webViewContainer");

        // Reproduce the prior recovery transition: an error can mark the WebView
        // container INVISIBLE. revealWebUi must restore the same loaded WebView.
        Method showNetworkError = activity.getClass().getMethod("D", Boolean.TYPE);
        Method revealWebUi = activity.getClass().getMethod("revealWebUi");
        String originalUrl = webView.getUrl();
        showNetworkError.invoke(activity, Boolean.TRUE);
        if (webContainer.getVisibility() != View.INVISIBLE) {
            throw new AssertionError("Network-error transition did not hide the WebView container as expected");
        }
        revealWebUi.invoke(activity);
        if (webContainer.getVisibility() != View.VISIBLE) {
            throw new AssertionError("WebView container remained hidden after revealWebUi recovery");
        }

        Rect webBounds = visibleBounds(webView);
        boolean splashHidden = splash.getVisibility() == View.GONE;
        boolean nativeHomeHidden = nativeRoot.getVisibility() == View.GONE;
        boolean samePage = equalsNullable(originalUrl, webView.getUrl());
        if (webBounds == null || !splashHidden || !nativeHomeHidden || !samePage || !loginDomVisible) {
            throw new AssertionError("Unauthenticated login surface is not visibly backed by the original WebView");
        }

        Bundle state = new Bundle();
        state.putString("phase", "login_without_session");
        state.putBoolean("authenticated_session", false);
        state.putBoolean("login_ui_visible_in_webview_dom", true);
        state.putBoolean("webview_visible_and_measured", true);
        state.putBoolean("network_error_transition_recovered", true);
        state.putBoolean("original_webview_url_preserved", true);
        state.putBoolean("splash_hidden", true);
        state.putBoolean("native_home_hidden", true);
        state.putBoolean("page_load_complete", webView.getProgress() == 100);
        putBounds(state, "webview_visible", webBounds);
        return state;
    }

    private void dispatchEmptyHomeThroughAndBridge(Activity activity) throws Exception {
        ClassLoader loader = activity.getClassLoader();
        Class<?> bridgeClass = loader.loadClass("com.melodix.music.AndBridge");
        Object bridge = bridgeClass.getConstructor(Context.class).newInstance(activity);
        Method route = bridgeClass.getMethod("onNativeUiRoute", String.class);
        Method data = bridgeClass.getMethod("onNativeUiData", String.class, String.class);
        Method ready = bridgeClass.getMethod("onNativeUiReady");

        // This is an empty control payload, not a synthetic playlist/card. It
        // exercises the exact native no-content path without changing session.
        route.invoke(bridge, "home");
        data.invoke(bridge, "home", "[]");
        ready.invoke(bridge);
    }

    private Bundle inspectEmptyHomeFallback(Activity activity, WebView webView) throws Exception {
        View nativeRoot = requiredView(activity, "nativeRoot");
        View splash = requiredView(activity, "splashOverlay");
        View webContainer = requiredView(activity, "webViewContainer");
        View nativeHomeTab = requiredView(activity, "nativeHomeTab");
        View nativeContent = requiredView(activity, "nativeContent");

        Rect webBounds = visibleBounds(webView);
        boolean rootHidden = nativeRoot.getVisibility() == View.GONE;
        boolean homeTabNotShown = !nativeHomeTab.isShown();
        boolean splashHidden = splash.getVisibility() == View.GONE;
        boolean webContainerVisible = webContainer.getVisibility() == View.VISIBLE;
        boolean noHomeCardsAttached = !readBooleanField(activity, "nativeHomeCardsAttached");
        boolean noVisibleHomeContent = !readBooleanField(activity, "nativeHomeContentReady");
        boolean noNativeChildren = nativeContent instanceof LinearLayout
                && ((LinearLayout) nativeContent).getChildCount() == 0;
        String currentScreen = readStringField(activity, "nativeCurrentScreen");
        if (webBounds == null || !rootHidden || !homeTabNotShown || !splashHidden
                || !webContainerVisible || !noHomeCardsAttached || !noVisibleHomeContent
                || !noNativeChildren || !"home".equals(currentScreen)) {
            throw new AssertionError("Empty Home did not fail safely back to the visible WebView");
        }

        requireUnauthenticatedSession(activity);
        Bundle state = new Bundle();
        state.putString("phase", "empty_home_fallback");
        state.putBoolean("authenticated_session", false);
        state.putBoolean("home_payload_empty", true);
        state.putBoolean("playlist_or_card_injected", false);
        state.putBoolean("native_home_cards_attached", false);
        state.putBoolean("native_home_content_ready", false);
        state.putBoolean("native_content_container_empty", true);
        state.putBoolean("native_root_hidden", true);
        state.putBoolean("native_home_tab_not_shown", true);
        state.putBoolean("splash_hidden", true);
        state.putBoolean("webview_container_visible", true);
        state.putBoolean("webview_visible_and_measured", true);
        state.putBoolean("page_load_complete", webView.getProgress() == 100);
        putBounds(state, "webview_visible", webBounds);
        return state;
    }

    private Rect visibleBounds(View view) {
        if (view == null || view.getVisibility() != View.VISIBLE || !view.isShown()
                || view.getWidth() <= 0 || view.getHeight() <= 0) {
            return null;
        }
        Rect bounds = new Rect();
        if (!view.getGlobalVisibleRect(bounds) || bounds.width() <= 0 || bounds.height() <= 0) {
            return null;
        }
        return bounds;
    }

    private void putBounds(Bundle state, String prefix, Rect bounds) {
        state.putInt(prefix + "_left_px", bounds.left);
        state.putInt(prefix + "_top_px", bounds.top);
        state.putInt(prefix + "_right_px", bounds.right);
        state.putInt(prefix + "_bottom_px", bounds.bottom);
        state.putInt(prefix + "_width_px", bounds.width());
        state.putInt(prefix + "_height_px", bounds.height());
    }

    private boolean equalsNullable(String left, String right) {
        return left == null ? right == null : left.equals(right);
    }

    private WebView findWebView(Activity activity) {
        try {
            Field field = activity.getClass().getDeclaredField("G");
            field.setAccessible(true);
            Object value = field.get(activity);
            return value instanceof WebView ? (WebView) value : null;
        } catch (Throwable error) {
            return null;
        }
    }

    private View requiredView(Activity activity, String name) {
        int id = activity.getResources().getIdentifier(name, "id", TARGET_PACKAGE);
        if (id == 0) throw new AssertionError("Required view id missing: " + name);
        View view = activity.findViewById(id);
        if (view == null) throw new AssertionError("Required view missing: " + name);
        return view;
    }

    private boolean readBooleanField(Activity activity, String name) throws Exception {
        Field field = activity.getClass().getDeclaredField(name);
        field.setAccessible(true);
        return field.getBoolean(activity);
    }

    private String readStringField(Activity activity, String name) throws Exception {
        Field field = activity.getClass().getDeclaredField(name);
        field.setAccessible(true);
        Object value = field.get(activity);
        return value == null ? "" : String.valueOf(value);
    }
}
