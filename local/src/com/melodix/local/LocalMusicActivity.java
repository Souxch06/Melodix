package com.melodix.local;

import android.app.Activity;
import android.graphics.Color;
import android.graphics.Typeface;
import android.os.Bundle;
import android.view.Gravity;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;

/** Build-chain tracer only: no file access, playback, or networking. */
public final class LocalMusicActivity extends Activity {
    private int dp(int value) {
        return (int) (value * getResources().getDisplayMetrics().density + 0.5f);
    }

    @Override public void onCreate(Bundle state) {
        super.onCreate(state);
        getWindow().setStatusBarColor(0xff0b0b14);
        getWindow().setNavigationBarColor(0xff0b0b14);
        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setPadding(dp(24), dp(32), dp(24), dp(24));
        root.setBackgroundColor(0xff0b0b14);
        setContentView(root);
        TextView title = new TextView(this);
        title.setText("Ma musique");
        title.setTextColor(Color.WHITE);
        title.setTextSize(28);
        title.setTypeface(null, Typeface.BOLD);
        root.addView(title);
        TextView note = new TextView(this);
        note.setText("Étape 0 · Écran de test, aucune lecture pour le moment");
        note.setTextColor(0xffbfc0cb);
        note.setTextSize(15);
        note.setPadding(0, dp(16), 0, dp(24));
        root.addView(note);
        Button back = new Button(this);
        back.setText("Retour");
        back.setMinHeight(dp(48));
        back.setGravity(Gravity.CENTER);
        back.setOnClickListener(view -> finish());
        root.addView(back, new LinearLayout.LayoutParams(-1, -2));
    }
}
