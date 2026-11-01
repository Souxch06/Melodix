package com.melodix.test;

import android.accessibilityservice.AccessibilityServiceInfo;
import android.app.Activity;
import android.app.Instrumentation;
import android.app.UiAutomation;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.Rect;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import android.webkit.ValueCallback;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.io.FileOutputStream;
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
    private static final String HARNESS_TAG = "MelodixHarness";
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
    private static final String BROWSER_COMPATIBILITY_PROBE =
            "(function(){try{" +
            "var body=String((document.body&&document.body.innerText)||'').toLowerCase();" +
            "var english=/\\bbrowser\\b.{0,80}\\b(?:not supported|unsupported|not compatible|incompatible|does not support|doesn't support)\\b|\\bunsupported browser\\b|\\bplease (?:update|upgrade) (?:your )?browser\\b/.test(body);" +
            "var french=/\\bnavigateur\\b.{0,80}\\b(?:pas compatible|non compatible|pas pris en charge|non pris en charge|n'est pas pris en charge|n’est pas pris en charge|obsol[eè]te)\\b|\\bmettre à jour (?:votre )?navigateur\\b/.test(body);" +
            "return !!(english||french);" +
            "}catch(e){return null;}})()";
    private static final String USER_AGENT_PROFILE_PROBE =
            "(function(){try{" +
            "var match=String(navigator.userAgent||'').match(/Chrome\\/(\\d+)/);" +
            "if(!match)return false;" +
            "var data=navigator.userAgentData;" +
            "if(!data||!data.brands)return true;" +
            "var brand=null;for(var i=0;i<data.brands.length;i++){var item=data.brands[i];if(item&&(item.brand==='Chromium'||item.brand==='Google Chrome')){brand=item;break;}}" +
            "var full=String(data.uaFullVersion||'');" +
            "return !!(brand&&String(brand.version)===match[1]&&(!full||full.split('.')[0]===match[1]));" +
            "}catch(e){return false;}})()";

    @Override
    public void onCreate(Bundle arguments) {
        // Android can attach instrumentation to the already-running app
        // without restarting it. This custom Instrumentation must start its
        // own callback thread after onCreate or onStart() never executes.
        Log.i(HARNESS_TAG, "instrumentation_onCreate_entered");
        super.onCreate(arguments);
        Log.i(HARNESS_TAG, "instrumentation_onCreate_returned");
        start();
        Log.i(HARNESS_TAG, "instrumentation_runner_thread_started");
    }

    @Override
    public void onStart() {
        String failurePhase = "instrumentation_start";
        Log.i(HARNESS_TAG, "instrumentation_onStart_entered");
        try {
            super.onStart();
            Log.i(HARNESS_TAG, "instrumentation_onStart_super_returned");
            failurePhase = "launch_target";
            Log.i(HARNESS_TAG, "started");
            notePhase(failurePhase);
            Activity activity = launchTarget();
            failurePhase = "await_webview";
            notePhase(failurePhase);
            WebView webView = awaitStableWebView(activity);
            failurePhase = "verify_runtime_webview_profile";
            notePhase(failurePhase);
            final Bundle[] runtimeProfile = new Bundle[1];
            runOnMainSync(new Runnable() {
                @Override
                public void run() {
                    runtimeProfile[0] = inspectRuntimeUserAgent(activity, webView);
                }
            });
            if (runtimeProfile[0] == null) throw new AssertionError("Could not inspect the runtime WebView profile");
            sendStatus(1, runtimeProfile[0]);
            if (!runtimeProfile[0].getBoolean("configured_ua_chrome_major_matches_runtime")) {
                throw new AssertionError("Configured desktop UA does not match the installed WebView Chrome version");
            }

            failurePhase = "browser_compatibility_probe";
            notePhase(failurePhase);
            boolean browserCompatibilityWarning = awaitBooleanProbe(
                    webView, BROWSER_COMPATIBILITY_PROBE, "browser_compatibility_warning_visible");
            if (browserCompatibilityWarning) {
                throw new AssertionError("Spotify displayed a browser compatibility warning on launch");
            }

            failurePhase = "verify_unauthenticated_session";
            notePhase(failurePhase);
            requireUnauthenticatedSession(activity);
            failurePhase = "login_dom_probe";
            notePhase(failurePhase);
            final boolean loginDomVisible = awaitLoginUiVisible(webView);
            failurePhase = "user_agent_profile_probe";
            notePhase(failurePhase);
            if (!awaitBooleanProbe(webView, USER_AGENT_PROFILE_PROBE, "javascript_ua_profile_coherent")) {
                throw new AssertionError("JavaScript User-Agent client hints do not match the WebView Chrome version");
            }

            failurePhase = "login_surface_visibility";
            notePhase(failurePhase);
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

            failurePhase = "empty_home_bridge_dispatch";
            notePhase(failurePhase);
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
            failurePhase = "empty_home_fallback_visibility";
            notePhase(failurePhase);
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

            failurePhase = "capture_empty_home_evidence";
            notePhase(failurePhase);
            captureEmptyHomeUiEvidence();
            Log.i(HARNESS_TAG, "empty_home_evidence_captured");

            Bundle result = new Bundle(fallbackState[0]);
            result.putBoolean("empty_home_evidence_captured", true);
            result.putString("overall", "passed");
            sendStatus(1, result);
            Log.i(HARNESS_TAG, "completed");
            finish(Activity.RESULT_OK, result);
        } catch (Throwable failure) {
            Log.e(HARNESS_TAG, "failure phase=" + failurePhase + " type=" + failure.getClass().getSimpleName());
            Bundle status = new Bundle();
            status.putString("overall", "failed");
            status.putString("failure_phase", failurePhase);
            status.putString("failure_type", failure.getClass().getSimpleName());
            sendStatus(2, status);
            finish(Activity.RESULT_CANCELED, status);
        }
    }

    private void notePhase(String phase) {
        Log.i(HARNESS_TAG, "phase=" + phase);
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

    private Bundle inspectRuntimeUserAgent(Activity activity, WebView webView) {
        String platformUserAgent = WebSettings.getDefaultUserAgent(activity);
        String configuredUserAgent = webView.getSettings().getUserAgentString();
        String platformMajor = chromeMajor(platformUserAgent);
        String configuredMajor = chromeMajor(configuredUserAgent);
        boolean matches = platformMajor != null && platformMajor.equals(configuredMajor);
        Bundle state = new Bundle();
        state.putString("phase", "runtime_webview_profile");
        state.putString("installed_webview_chrome_major", platformMajor == null ? "unavailable" : platformMajor);
        state.putString("configured_ua_chrome_major", configuredMajor == null ? "unavailable" : configuredMajor);
        state.putBoolean("configured_ua_chrome_major_matches_runtime", matches);
        return state;
    }

    private String chromeMajor(String userAgent) {
        if (userAgent == null) return null;
        int marker = userAgent.indexOf("Chrome/");
        if (marker < 0) return null;
        int start = marker + "Chrome/".length();
        int end = userAgent.indexOf('.', start);
        if (end < 0) end = userAgent.indexOf(' ', start);
        if (end < 0) end = userAgent.length();
        if (end <= start) return null;
        String major = userAgent.substring(start, end);
        for (int index = 0; index < major.length(); index++) {
            if (!Character.isDigit(major.charAt(index))) return null;
        }
        return major;
    }

    private boolean awaitBooleanProbe(
            final WebView webView, final String script, final String statusKey) throws InterruptedException {
        final CountDownLatch received = new CountDownLatch(1);
        final String[] result = new String[1];
        runOnMainSync(new Runnable() {
            @Override
            public void run() {
                webView.evaluateJavascript(script, new ValueCallback<String>() {
                    @Override
                    public void onReceiveValue(String value) {
                        result[0] = value;
                        received.countDown();
                    }
                });
            }
        });
        if (!received.await(10L, TimeUnit.SECONDS)) {
            throw new AssertionError("WebView probe timed out: " + statusKey);
        }
        if (!"true".equals(result[0]) && !"false".equals(result[0])) {
            throw new AssertionError("WebView probe returned no boolean result: " + statusKey);
        }
        boolean probeResult = "true".equals(result[0]);
        Bundle status = new Bundle();
        status.putString("phase", statusKey);
        status.putBoolean(statusKey, probeResult);
        sendStatus(1, status);
        return probeResult;
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
        boolean loginVisible = "true".equals(result[0]);
        Bundle probeState = new Bundle();
        probeState.putString("phase", "login_dom_probe");
        probeState.putBoolean("authenticated_session", false);
        probeState.putBoolean("login_dom_probe_completed", true);
        probeState.putBoolean("login_ui_visible_in_webview_dom", loginVisible);
        sendStatus(1, probeState);
        if (!loginVisible) {
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

    private void captureEmptyHomeUiEvidence() throws Exception {
        UiAutomation automation = getUiAutomation();
        AccessibilityServiceInfo serviceInfo = new AccessibilityServiceInfo();
        serviceInfo.eventTypes = AccessibilityEvent.TYPES_ALL_MASK;
        serviceInfo.feedbackType = AccessibilityServiceInfo.FEEDBACK_GENERIC;
        serviceInfo.flags = AccessibilityServiceInfo.FLAG_INCLUDE_NOT_IMPORTANT_VIEWS
                | AccessibilityServiceInfo.FLAG_REPORT_VIEW_IDS
                | AccessibilityServiceInfo.FLAG_RETRIEVE_INTERACTIVE_WINDOWS;
        automation.setServiceInfo(serviceInfo);
        AccessibilityNodeInfo root = automation.getRootInActiveWindow();
        if (root == null) {
            throw new AssertionError("Android UI hierarchy was unavailable during the empty-Home phase");
        }
        StringBuilder hierarchy = new StringBuilder("<?xml version=\"1.0\" encoding=\"UTF-8\"?><hierarchy>");
        try {
            appendAccessibilityNodeXml(hierarchy, root);
        } finally {
            root.recycle();
        }
        hierarchy.append("</hierarchy>");
        try (FileOutputStream output = getTargetContext().openFileOutput(
                "melodix-preview-home-fallback.xml", Context.MODE_PRIVATE)) {
            output.write(hierarchy.toString().getBytes("UTF-8"));
        }

        Bitmap screenshot = automation.takeScreenshot();
        if (screenshot == null) {
            throw new AssertionError("Android screenshot was unavailable during the empty-Home phase");
        }
        try {
            try (FileOutputStream output = getTargetContext().openFileOutput(
                    "melodix-preview-home-empty.png", Context.MODE_PRIVATE)) {
                if (!screenshot.compress(Bitmap.CompressFormat.PNG, 100, output)) {
                    throw new AssertionError("Could not encode the empty-Home screenshot");
                }
            }
        } finally {
            screenshot.recycle();
        }
    }

    private void appendAccessibilityNodeXml(StringBuilder xml, AccessibilityNodeInfo node) {
        Rect bounds = new Rect();
        node.getBoundsInScreen(bounds);
        xml.append("<node");
        appendXmlAttribute(xml, "class", node.getClassName());
        appendXmlAttribute(xml, "package", node.getPackageName());
        appendXmlAttribute(xml, "resource-id", node.getViewIdResourceName());
        appendXmlAttribute(xml, "text", node.getText());
        appendXmlAttribute(xml, "content-desc", node.getContentDescription());
        appendXmlAttribute(xml, "bounds", bounds.toShortString());
        appendXmlAttribute(xml, "visible-to-user", String.valueOf(node.isVisibleToUser()));
        xml.append(">");
        for (int index = 0; index < node.getChildCount(); index++) {
            AccessibilityNodeInfo child = node.getChild(index);
            if (child == null) continue;
            try {
                appendAccessibilityNodeXml(xml, child);
            } finally {
                child.recycle();
            }
        }
        xml.append("</node>");
    }

    private void appendXmlAttribute(StringBuilder xml, String name, CharSequence value) {
        xml.append(' ').append(name).append("=\"")
                .append(escapeXml(value == null ? "" : value.toString()))
                .append('"');
    }

    private String escapeXml(String value) {
        return value.replace("&", "&amp;")
                .replace("\"", "&quot;")
                .replace("<", "&lt;")
                .replace(">", "&gt;")
                .replace("'", "&apos;");
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
