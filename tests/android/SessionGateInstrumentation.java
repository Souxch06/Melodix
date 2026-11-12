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
import android.graphics.Bitmap;
import android.graphics.Rect;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.view.inputmethod.InputMethodManager;
import android.content.Context;
import java.io.File;
import java.io.FileOutputStream;
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
    private Bundle arguments;
    private int attempt;
    private Class<?> evidence;
    private static final String PACKAGE = "com.melodix.music.preview";
    @Override public void onCreate(Bundle args) { super.onCreate(args); arguments = args; start(); }
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
            .put("attempt", ++attempt).put("completed", true).put("token", token)
            .put("libraryOk", library).put("tokenRefused", refused).put("libraryHttp", http)
            .put("tokenApiHttp", refused ? 400 : 200).put("tokenFallbackHttp", refused ? 403 : 0);
        call("result", new Class<?>[]{activity().getClass(), String.class}, activity(), proof.toString());
    }
    private void note() { Bundle b = new Bundle(); b.putString("phase", phase); b.putString("result", "passed"); sendStatus(1, b); }
    /** Separate network-blocked WebView; synthetic observations only, never Spotify. */
    private void diagnosticReadback(boolean stale) throws Exception {
        final String outerPhase=phase;
        final String detail=stale ? "stale_" : "current_";
        final WebView[] local={null};final int[] gen={0},evidenceBefore={0};
        final java.util.concurrent.CountDownLatch loaded=new java.util.concurrent.CountDownLatch(1);
        ui(() -> {
            phase=detail+"begin";
            begin();gen[0]=(Integer)field("generation");
            if(stale) check(gen[0]>1);
            evidence.getMethod("reset").invoke(null);
            phase=detail+"initial_evidence";
            check((Integer)evidence.getMethod("record",String.class).invoke(null,"synthetic-A")==1);
            evidenceBefore[0]=(Integer)evidence.getMethod("count").invoke(null);
            local[0]=new WebView(activity());
            local[0].getSettings().setJavaScriptEnabled(true);
            local[0].getSettings().setBlockNetworkLoads(true);
            local[0].setWebViewClient(new WebViewClient(){@Override public void onPageFinished(WebView v,String url){loaded.countDown();}});
            int observed=stale?gen[0]-1:gen[0];
            String fixture="{nativeGeneration:"+observed+",attempt:71,source:'native-retry',phase:'response',requests:1,http:401}";
            local[0].loadDataWithBaseURL(null,"<html><script>window.__sfMediaLibLastDiagnostic="+fixture+";</script></html>","text/html","UTF-8",null);
        });
        phase=detail+"fixture_load";
        check(loaded.await(10,java.util.concurrent.TimeUnit.SECONDS));
        phase=detail+"pull_start";
        ui(() -> {Class<?> pull=getTargetContext().getClassLoader().loadClass("com.melodix.music.NativeSessionDiagnosticPull");
            ((Runnable)pull.getConstructor(WebView.class,int.class).newInstance(local[0],gen[0])).run();});
        final String key="Tentative "+gen[0]+"/71";
        final String[] details={""};
        for(int i=0;i<(stale?15:80);i++){
            SystemClock.sleep(100);
            ui(() -> details[0]=(String)gate.getMethod("details").invoke(null));
            if(!stale&&details[0].contains(key))break;
        }
        ui(() -> {
            if(stale) {
                phase=detail+"no_current_row";
                check(!details[0].contains(key));
            } else {
                phase=detail+"current_row";
                check(details[0].contains(key));
                phase=detail+"observation_values";
                check(details[0].contains("token API=inconnu · repli=inconnu · bibliothèque=401 · terminée=inconnu · cookie=inconnu"));
                phase=detail+"observation_source";
                check(details[0].contains("source=native-retry · token=inconnu"));
            }
            phase=detail+"evidence_unchanged";
            check((Integer)evidence.getMethod("count").invoke(null)==evidenceBefore[0]);
            phase=detail+"not_expired";
            check(!(Boolean)field("expiredEvidence"));
            evidence.getMethod("reset").invoke(null);
            local[0].destroy();
        });
        phase=outerPhase;
    }
    private void paintFixture(boolean baseline) throws Exception {
        set("loginActive", false);set("freshLogin",false);set("expiredEvidence",!baseline);
        set("tokenApiHttp",400);set("tokenFallbackHttp",403);set("libraryHttp",401);
        if(evidence!=null) { evidence.getMethod("reset").invoke(null);
            evidence.getMethod("record",String.class).invoke(null,"synthetic-A");
            evidence.getMethod("record",String.class).invoke(null,"synthetic-A"); }
        call("transition",new Class<?>[]{int.class,String.class},baseline?4:2,
            baseline?"verification-failed-no-logout":"repeated-refusal-cookie-present");
        call("paint",new Class<?>[]{activity().getClass()},activity());
    }
    private void capture(String name) throws Exception {
        Bitmap bitmap=getUiAutomation().takeScreenshot();check(bitmap!=null);
        File dir=new File(getTargetContext().getFilesDir(),"session-captures");check(dir.exists()||dir.mkdirs());
        try(FileOutputStream out=new FileOutputStream(new File(dir,name+".png"))) { bitmap.compress(Bitmap.CompressFormat.PNG,100,out); }
        String journal=(String)getTargetContext().getClassLoader().loadClass("com.melodix.music.NativeStartupTiming").getMethod("appendTo",String.class).invoke(null,"");
        try(FileOutputStream out=new FileOutputStream(new File(dir,"mdxperf.txt"))) { out.write(journal.getBytes("UTF-8")); }
        bitmap.recycle();
        ui(() -> {
            View root=(View)field("overlay");int[] xy=new int[2];root.getLocationOnScreen(xy);
            View card=activity().findViewById(activity().getResources().getIdentifier("sessionCard","id",PACKAGE));
            Bundle metric=new Bundle();metric.putString("phase","geometry");
            metric.putInt("viewport_height",root.getHeight());metric.putInt("viewport_width",root.getWidth());
            metric.putInt("action_height",view("sessionAction").getHeight());
            if(card!=null) {
                int[] c=new int[2];card.getLocationOnScreen(c);metric.putInt("card_height",card.getHeight());metric.putInt("card_width",card.getWidth());
                metric.putInt("center_delta",Math.abs((2*c[1]+card.getHeight())-(2*xy[1]+root.getHeight())));
                // When the card fits, centering must be real, not inferred from XML.
                if(card.getHeight()+40*activity().getResources().getDisplayMetrics().density<root.getHeight())
                    check(Math.abs((2*c[1]+card.getHeight())-(2*xy[1]+root.getHeight()))<=4);
                check(card.getWidth()<=481*activity().getResources().getDisplayMetrics().density);
            }
            sendStatus(1,metric);
        });
    }
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
            try { evidence=getTargetContext().getClassLoader().loadClass("com.melodix.music.NativeSessionEvidence"); }
            catch(ClassNotFoundException beforePhase1) { /* baseline capture only */ }
            Intent launch = getTargetContext().getPackageManager().getLaunchIntentForPackage(PACKAGE);
            check(launch != null);
            launch.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            current.set(startActivitySync(launch));
            ui(() -> { freezeNetwork(); check((Boolean) field("autoUsed")); check((Integer) field("state") != 3); });
            if ("true".equals(arguments.getString("capture_only"))) {
                phase="capture_synthetic";
                boolean baseline="true".equals(arguments.getString("baseline"));
                ui(() -> paintFixture(baseline));
                SystemClock.sleep(350);
                if ("true".equals(arguments.getString("keyboard"))) {
                    ui(() -> {
                        EditText input=new EditText(activity());
                        input.setSingleLine(true);
                        FrameLayout.LayoutParams lp=new FrameLayout.LayoutParams(1,1);
                        activity().addContentView(input,lp);input.requestFocus();
                        ((InputMethodManager)activity().getSystemService(Context.INPUT_METHOD_SERVICE)).showSoftInput(input,InputMethodManager.SHOW_IMPLICIT);
                    });
                    SystemClock.sleep(1000);
                }
                capture("status");
                if (!baseline) {
                    ui(() -> view("sessionDisclosure").performClick());
                    SystemClock.sleep(350);capture("details");
                }
                note();outcome.putString("overall","passed");finish(Activity.RESULT_OK,outcome);return;
            }
            phase = "first_launch_login_before_home";
            ui(() -> check(view("sessionTitle") != null && view("sessionTitle").isShown())); note();

            phase = "diagnostic_real_webview_fallback";
            diagnosticReadback(false); note();
            phase = "diagnostic_real_webview_rejects_stale";
            diagnosticReadback(true); note();

            phase = "verifying_deadline_not_expiry";
            ui(() -> { set("freshLogin", false); begin(); state(0); });
            SystemClock.sleep(3300);
            ui(() -> { state(4); check(!(Boolean) field("expiredEvidence")); check(view("sessionAction").isShown());
                check(view("sessionSecondary").isShown());
                check(view("sessionSecondary").getText().toString().equals("Se reconnecter"));
                check(view("sessionNotice").isShown());
                check(view("sessionNotice").getText().toString().contains("uniquement après ton appui"));
                check(!view("sessionDetails").isShown()); }); note();

            phase = "valid_token_and_library";
            ui(() -> { begin(); result(true, true, false, 200); state(3); check(field("overlay") == null); }); note();

            phase = "network_and_isolated_401";
            ui(() -> { begin(); result(false, false, false, 401); state(4); check(!(Boolean) field("expiredEvidence")); }); note();

            phase = "missing_cookie_is_not_expiry";
            ui(() -> { set("autoUsed", true); begin(); result(false, false, true, 401); state(4);
                check(!(Boolean) field("expiredEvidence")); check(!(Boolean) field("loginActive")); }); note();

            phase = "same_digest_bounded_accumulator";
            ui(() -> {
                evidence.getMethod("reset").invoke(null);
                check((Integer)evidence.getMethod("record", String.class).invoke(null, "synthetic-A") == 1);
                check((Integer)evidence.getMethod("record", String.class).invoke(null, "synthetic-A") == 2);
                check((Integer)evidence.getMethod("record", String.class).invoke(null, "synthetic-B") == 1);
                check(!(Boolean)evidence.getMethod("canClear").invoke(null));
                evidence.getMethod("reset").invoke(null);
            }); note();

            phase = "probable_expiry_surface_synthetic";
            ui(() -> { paintFixture(false);
                check(view("sessionTitle").getText().toString().equals("Spotify refuse l’accès avec ta session actuelle"));
                check(view("sessionAction").isShown()); check(view("sessionSecondary").isShown());
                check(view("sessionSecondary").getText().toString().equals("Se reconnecter"));
                check(view("sessionNotice").isShown());
                check(!view("sessionDetails").isShown()); view("sessionDisclosure").performClick();
                check(view("sessionDetails").isShown());
                phase="probable_expiry_clipboard_synthetic";
                view("sessionCopy").performClick();
                android.content.ClipboardManager cb=(android.content.ClipboardManager)activity().getSystemService(Context.CLIPBOARD_SERVICE);
                String copied=cb.getPrimaryClip().getItemAt(0).getText().toString();
                String details=(String)gate.getMethod("details").invoke(null);
                check(copied.startsWith(details+"\nMDXPERF-BEGIN v=1 dropped="));
                check(copied.endsWith("MDXPERF-END"));
                view("sessionDisclosure").performClick(); check(!view("sessionDetails").isShown());
                // The legacy evidence-based gate remains blocked without a real cookie.
                check(!(Boolean)gate.getMethod("canReconnect").invoke(null));
            }); note();

            phase = "fresh_login_refusal_no_loop";
            ui(() -> { set("freshLogin", true); begin(); result(false, false, true, 401); state(4);
                check(!(Boolean) field("loginActive")); check(!(Boolean) field("expiredEvidence"));
                call("transition",new Class<?>[]{int.class,String.class},4,"fresh-account-refused");
                call("paint",new Class<?>[]{activity().getClass()},activity());
                check(view("sessionTitle").getText().toString().equals("Spotify refuse l’accès avec ce compte"));
            }); note();

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
            ui(() -> check(activity().moveTaskToBack(true)));
            SystemClock.sleep(700);
            Intent foreground = getTargetContext().getPackageManager().getLaunchIntentForPackage(PACKAGE);
            check(foreground != null);
            foreground.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_REORDER_TO_FRONT);
            getTargetContext().startActivity(foreground);
            SystemClock.sleep(1200);
            ui(() -> { check((Boolean) field("autoUsed")); state(4);
                check(view("sessionTitle") != null && view("sessionTitle").isShown()); }); note();

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
