package com.melodix.demo;

import android.app.Activity;
import android.content.Intent;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.os.Bundle;
import android.view.Gravity;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.TextView;

/** A test-only settings entry point, so demo is reachable without Spotify. */
public final class DemoSettingsActivity extends Activity {
    private int dp(float n) { return (int)(n * getResources().getDisplayMetrics().density + .5f); }
    @Override public void onCreate(Bundle state) {
        super.onCreate(state);
        getWindow().setStatusBarColor(Color.rgb(11,11,20));
        getWindow().setNavigationBarColor(Color.rgb(11,11,20));
        LinearLayout root = new LinearLayout(this); root.setOrientation(LinearLayout.VERTICAL);
        root.setPadding(dp(24),dp(32),dp(24),dp(24)); root.setBackgroundResource(getResources().getIdentifier("native_shell_background","drawable",getPackageName()));
        setContentView(root);
        TextView title = new TextView(this); title.setText("Paramètres"); title.setTextColor(Color.WHITE);
        title.setTextSize(28); title.setTypeface(null,Typeface.BOLD); root.addView(title);
        TextView subtitle = new TextView(this); subtitle.setText("Melodix Preview · réglages de test");
        subtitle.setTextSize(14); subtitle.setTextColor(0xffbfc0cb); subtitle.setPadding(0,dp(8),0,dp(28)); root.addView(subtitle);
        TextView version = new TextView(this); version.setTextColor(Color.WHITE); version.setTextSize(16);
        String name = "?"; long code = 0;
        try { android.content.pm.PackageInfo pi = getPackageManager().getPackageInfo(getPackageName(), 0); name=pi.versionName; code=pi.versionCode; } catch (Exception ignored) {}
        version.setText("Version de Melodix\n" + name + " (" + code + ")");
        version.setContentDescription("Version de Melodix " + name + " " + code);
        version.setPadding(dp(18),dp(18),dp(18),dp(18)); version.setMinHeight(dp(64)); version.setGravity(Gravity.CENTER_VERTICAL);
        version.setBackgroundResource(getResources().getIdentifier("native_glass_surface","drawable",getPackageName()));
        version.setOnLongClickListener(v -> { startActivity(new Intent(this,DemoActivity.class)); return true; });
        root.addView(version, new LinearLayout.LayoutParams(-1,-2));
        TextView open = new TextView(this); open.setText("Ouvrir Melodix"); open.setTextColor(0xffa78bfa);
        open.setTextSize(16); open.setGravity(Gravity.CENTER); open.setPadding(dp(12),dp(16),dp(12),dp(16));
        open.setOnClickListener(v -> { try { Intent i = new Intent(); i.setClassName(getPackageName(),"com.melodix.music.MainActivity"); startActivity(i); } catch (Exception e) { open.setText("Ouverture indisponible"); } });
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(-1,-2); lp.topMargin=dp(20); root.addView(open,lp);
    }
}
