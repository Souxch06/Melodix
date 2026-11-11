package com.melodix.demo;

import android.app.Activity;
import android.content.Intent;
import android.graphics.Color;
import android.graphics.Typeface;
import android.view.Gravity;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

/** Installed only in the opt-in preview build. Never reads or clears session data. */
public final class DemoEntry {
    private DemoEntry() {}
    private static int dp(Activity a, int n) {
        return (int)(n * a.getResources().getDisplayMetrics().density + .5f);
    }
    private static TextView button(final Activity a, String text) {
        TextView button = new TextView(a);
        button.setText(text);
        button.setContentDescription(text);
        button.setTextColor(Color.WHITE);
        button.setTextSize(15);
        button.setTypeface(null, Typeface.BOLD);
        button.setGravity(Gravity.CENTER);
        button.setPadding(dp(a,12),dp(a,12),dp(a,12),dp(a,12));
        button.setMinHeight(dp(a,48));
        int background = a.getResources().getIdentifier("native_glass_surface", "drawable", a.getPackageName());
        if (background != 0) button.setBackgroundResource(background);
        button.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View view) { a.startActivity(new Intent(a, DemoActivity.class)); }
        });
        return button;
    }
    /** Called by the preview-only native session layouts' onClick attribute. */
    public static void open(Activity a) {
        a.startActivity(new Intent(a, DemoActivity.class));
    }
    public static void bindSession(Activity a, View overlay, int state, boolean loginActive) {
        // A real login WebView and its controls are never covered. No proof is altered.
        if (loginActive || state == 0 || state == 3 || overlay == null) return;
        int id = a.getResources().getIdentifier("sessionCard", "id", a.getPackageName());
        View card = overlay.findViewById(id);
        if (!(card instanceof LinearLayout)) return;
        LinearLayout parent = (LinearLayout)card;
        if (parent.findViewWithTag("preview-demo-entry") != null) return;
        TextView demo = button(a, "Essayer le mode démo");
        demo.setTag("preview-demo-entry");
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(-1,-2);
        lp.topMargin = dp(a,12);
        int actionId = a.getResources().getIdentifier("sessionAction", "id", a.getPackageName());
        View primary = overlay.findViewById(actionId);
        int actionIndex = primary == null ? -1 : parent.indexOfChild(primary);
        // Place the fallback before diagnostics and any potentially lengthy details.
        parent.addView(demo, actionIndex < 0 ? 0 : actionIndex + 1, lp);
    }
    /** Complete the existing session entry for verification and active login.
     * The login control stays inside its measured native header, not over the WebView.
     * State 3 has no session overlay: authenticated users use real settings.
     */
    public static void bindSessionOtherStates(Activity a, View overlay, int state, boolean loginActive) {
        if (overlay == null || state == 3 || (!loginActive && state != 0)) return;
        LinearLayout parent = null;
        if (loginActive && overlay instanceof ScrollView) {
            View child = ((ScrollView) overlay).getChildAt(0);
            if (child instanceof LinearLayout) parent = (LinearLayout) child;
        } else {
            int id = a.getResources().getIdentifier("sessionCard", "id", a.getPackageName());
            View card = overlay.findViewById(id);
            if (card instanceof LinearLayout) parent = (LinearLayout) card;
        }
        if (parent == null || parent.findViewWithTag("preview-demo-entry") != null) return;
        TextView demo = button(a, "Essayer le mode démo");
        demo.setTag("preview-demo-entry");
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(-1, -2);
        lp.topMargin = dp(a, 8);
        // Keep the login option visible before the WebView, while allowing the
        // existing header-layout listener to reserve space for the WebView.
        if (loginActive) parent.addView(demo, 0, lp);
        else parent.addView(demo, lp);
    }
    public static void bindSettings(Activity a, LinearLayout content, String screen) {
        if (!"settings".equals(screen) || content == null) return;
        TextView demo = button(a, "Mode démo");
        demo.setTag("preview-demo-settings-entry");
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(-1,-2);
        lp.setMargins(dp(a,16),dp(a,8),dp(a,16),dp(a,8));
        content.addView(demo, lp);
    }
    public static void returnToApp(Activity a) {
        Intent intent = new Intent();
        intent.setClassName(a.getPackageName(), "com.melodix.music.MainActivity");
        intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP | Intent.FLAG_ACTIVITY_SINGLE_TOP);
        a.startActivity(intent);
        a.finish();
    }
}
