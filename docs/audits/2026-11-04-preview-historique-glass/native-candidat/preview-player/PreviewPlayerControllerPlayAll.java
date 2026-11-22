package com.melodix.music;

import android.app.Activity;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

// User request (1022379): Spotify-like round play button in the playlist header (drawn in code, no resource).
// It taps the first track row, so playback takes the same path as touching that track.
// shortcut: the header is found by its "PLAYLIST" label and the first row by its "1" index; upgrade if the layout changes.
final class PreviewPlayerControllerPlayAll {
    static final String TAG = "melodixPlayAll";
    static void add(final Activity a) {
        final View root = a.findViewById(0x7f09022f);
        if (root == null || root.findViewWithTag(TAG) != null) return;
        TextView label = find(root, "PLAYLIST");
        if (label == null || !(label.getParent() instanceof ViewGroup)) return;
        float d = a.getResources().getDisplayMetrics().density;
        View play = new View(a) {
            final Paint p = new Paint(Paint.ANTI_ALIAS_FLAG);
            @Override protected void onDraw(Canvas c) {
                float r = Math.min(getWidth(), getHeight()) / 2f, cx = r, cy = getHeight() / 2f;
                p.setColor(0xff1ed760); c.drawCircle(cx, cy, r, p);
                Path t = new Path();
                t.moveTo(cx - r * 0.28f, cy - r * 0.38f); t.lineTo(cx + r * 0.42f, cy); t.lineTo(cx - r * 0.28f, cy + r * 0.38f); t.close();
                p.setColor(0xff000000); c.drawPath(t, p);
            }
        };
        play.setTag(TAG); play.setContentDescription("Lire la playlist"); play.setClickable(true);
        ViewGroup.MarginLayoutParams lp = new ViewGroup.MarginLayoutParams((int) (52 * d), (int) (52 * d));
        lp.topMargin = (int) (12 * d); play.setLayoutParams(lp);
        play.setOnClickListener(new View.OnClickListener() { public void onClick(View v) {
            TextView one = find(root, "1");
            for (View x = one; x != null; x = x.getParent() instanceof View ? (View) x.getParent() : null)
                if (x.isClickable()) { x.performClick(); return; }
        }});
        ((ViewGroup) label.getParent()).addView(play);
    }
    static TextView find(View v, String text) {
        if (v instanceof TextView && text.equals(String.valueOf(((TextView) v).getText()))) return (TextView) v;
        if (v instanceof ViewGroup) { ViewGroup g = (ViewGroup) v;
            for (int i = 0; i < g.getChildCount(); i++) { TextView f = find(g.getChildAt(i), text); if (f != null) return f; } }
        return null;
    }
}
