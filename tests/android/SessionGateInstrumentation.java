package com.melodix.test;

import android.app.Activity;
import android.app.Application;
import android.app.Instrumentation;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.os.Bundle;
import android.os.SystemClock;
import android.view.View;
import android.webkit.WebResourceRequest;
import android.webkit.WebResourceResponse;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.TextView;
import org.json.JSONObject;
import java.io.ByteArrayInputStream;
import java.lang.reflect.Field;
import java.util.concurrent.atomic.AtomicReference;

/** Test-only synthetic state observations. Never reads/sets/deletes any cookie or token.
 * Not evidence of Spotify accepting a real session; runs on a fresh CI emulator only. */
public final class SessionGateInstrumentation extends Instrumentation {
    private Class<?> gate;
    private final AtomicReference<Activity> current = new AtomicReference<>();
    private String phase = "launch";
    private static final String PACKAGE = "com.melodix.music.preview";
    @Override public void onCreate(Bundle args) { super.onCreate(args); start(); }
    private Object field(String name) throws Exception { return gate.getField(name).get(null); }
    private void set(String name, Object value) throws Exception { gate.getField(name).set(null, value); }
    private void call(String name, Class<?>[] types, Object... values) throws Exception {
        gate.getMethod(name, types).invoke(null, values);
    }
    private Activity activity() { return current.get(); }
    private void ui(final Checked action) {
        final Throwable[] failure = new Throwable[1];
        runOnMainSync(() -> { try { action.run(); } catch (Throwable t) { failure[0] = t; } });
        if (failure[0] != null) throw new AssertionError("synthetic state operation failed", failure[0]);
        waitForIdleSync();
    }
    private interface Checked { void run() throws Exception; }
    private void check(boolean condition) { if (!condition) throw new AssertionError("session gate invariant failed: " + phase); }
    private TextView view(String name) {
        Activity a = activity();
        return (TextView) a.findViewById(a.getResources().getIdentifier(name, "id", PACKAGE));
    }
    private void state(int value) throws Exception { check(((Integer) field("state")) == value); }
    private void freezeNetwork() throws Exception {
        // Block all fixture WebView requests without modifying session stores or production code.
        WebView web = (WebView) activity().getClass().getField("G").get(activity());
        if (web != null) {
            web.stopLoading();
            web.setWebViewClient(new WebViewClient() {
                @Override public WebResourceResponse shouldInterceptRequest(WebView w, WebResourceRequest request) {
                    return new WebResourceResponse("text/html", "UTF-8", new ByteArrayInputStream(new byte[0]));
                }
            });
        }
    }
    private void begin() throws Exception {
        call("begin", new Class<?>[]{activity().getClass()}, activity());
    }
    private void result(boolean token, boolean library, boolean refused, int http) throws Exception {
        JSONObject proof = new JSONObject().put("generation", field("generation"))
            .put("attempt", 1).put("completed", true).put("token", token)
            .put("libraryOk", library).put("tokenRefused", refused).put("libraryHttp", http)
            .put("tokenApiHttp", refused ? 400 : 200).put("tokenFallbackHttp", refused ? 403 : 0);
        call("result", new Class<?>[]{activity().getClass(), String.class}, activity(), proof.toString());
    }
    private void note() { Bundle b = new Bundle(); b.putString("phase", phase); b.putString("result", "passed"); sendStatus(1, b); }
    @Override public void onStart() {
        Application app = (Application) getTargetContext().getApplicationContext();
        Application.ActivityLifecycleCallbacks observer = new Application.ActivityLifecycleCallbacks() {
            @Override public void onActivityResumed(Activity a) { current.set(a); }
            @Override public void onActivityCreated(Activity a, Bundle b) { current.set(a); }
            @Override public void onActivityStarted(Activity a) {}
            @Override public void onActivityPaused(Activity a) {}
            @Override public void onActivityStopped(Activity a) {}
            @Override public void onActivitySaveInstanceState(Activity a, Bundle b) {}
            @Override public void onActivityDestroyed(Activity a) {}
        };
        app.registerActivityLifecycleCallbacks(observer);
        Bundle outcome = new Bundle();
        try {
            gate = getTargetContext().getClassLoader().loadClass("com.melodix.music.NativeSessionGate");
            Intent launch = getTargetContext().getPackageManager().getLaunchIntentForPackage(PACKAGE);
            check(launch != null);
            launch.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            current.set(startActivitySync(launch));
            ui(() -> { freezeNetwork(); check((Boolean) field("autoUsed")); check((Integer) field("state") != 3); });
            phase = "first_launch_login_before_home";
            ui(() -> check(view("sessionTitle") != null && view("sessionTitle").isShown())); note();

            phase = "verifying_deadline_not_expiry";
            ui(() -> { set("freshLogin", false); begin(); state(0); });
            SystemClock.sleep(3300);
            ui(() -> { state(4); check(!(Boolean) field("expiredEvidence")); check(view("sessionAction").isShown());
                check(view("sessionDetails").getVisibility() == View.GONE); }); note();

            phase = "valid_token_and_library";
            ui(() -> { begin(); result(true, true, false, 200); state(3); check(field("overlay") == null); }); note();

            phase = "network_and_isolated_401";
            ui(() -> { begin(); result(false, false, false, 401); state(4); check(!(Boolean) field("expiredEvidence")); }); note();

            phase = "completed_expiry_single_redirect";
            ui(() -> { set("autoUsed", false); begin(); result(false, false, true, 401); state(2);
                check((Boolean) field("autoUsed")); check((Boolean) field("loginActive"));
                check(!(Boolean) gate.getMethod("canReconnect").invoke(null)); }); note();

            phase = "fresh_login_refusal_no_loop";
            ui(() -> { set("freshLogin", true); begin(); result(false, false, true, 401); state(4);
                check(!(Boolean) field("loginActive")); check(!(Boolean) field("expiredEvidence")); }); note();

            phase = "stale_result_ignored";
            ui(() -> { begin(); int old = (Integer) field("generation"); begin();
                JSONObject stale = new JSONObject().put("generation", old).put("attempt", 1).put("completed", true)
                    .put("token", true).put("libraryOk", true);
                call("result", new Class<?>[]{activity().getClass(), String.class}, activity(), stale.toString()); state(0); }); note();

            phase = "rotation_preserves_budget_and_deadline";
            final Activity before = activity();
            ui(() -> { set("autoUsed", true); before.setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_LANDSCAPE); });
            SystemClock.sleep(3500);
            ui(() -> { freezeNetwork(); check((Boolean) field("autoUsed")); state(4);
                check(view("sessionTitle") != null && view("sessionTitle").isShown());
                check(view("sessionAction").getHeight() >= 44 * activity().getResources().getDisplayMetrics().density); }); note();

            phase = "activity_recreation_preserves_budget";
            ui(() -> activity().recreate());
            SystemClock.sleep(3500);
            ui(() -> { freezeNetwork(); check((Boolean) field("autoUsed")); state(4);
                check(view("sessionTitle") != null && view("sessionTitle").isShown()); }); note();

            phase = "background_resume_no_extra_redirect";
            ui(() -> { call("resume", new Class<?>[]{activity().getClass()}, activity()); check((Boolean) field("autoUsed")); state(4); }); note();

            phase = "back_exits_without_revealing_home";
            final Activity ending = activity();
            ui(() -> ending.onBackPressed()); check(ending.isFinishing()); note();
            outcome.putString("overall", "passed");
            finish(Activity.RESULT_OK, outcome);
        } catch (Throwable error) {
            outcome.putString("overall", "failed"); outcome.putString("phase", phase);
            // Fixed phase + exception class only; no raw throwable, URL or page data.
            outcome.putString("error_class", error.getClass().getSimpleName());
            finish(Activity.RESULT_CANCELED, outcome);
        } finally { app.unregisterActivityLifecycleCallbacks(observer); }
    }
}
