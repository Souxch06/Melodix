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
        TextView label = find(root, "PLAYLIST"); if (label == null) label = find(root, "VOTRE BIBLIOTHÈQUE");
        if (label == null || !(label.getParent() instanceof ViewGroup)) return;
        float d = a.getResources().getDisplayMetrics().density;
        // Spotify layout (user screenshot 1022381): a right-aligned row under the header info, shuffle then a big play.
        android.widget.LinearLayout row = new android.widget.LinearLayout(a);
        row.setTag(TAG); row.setOrientation(android.widget.LinearLayout.HORIZONTAL); row.setGravity(android.view.Gravity.END | android.view.Gravity.CENTER_VERTICAL);
        ViewGroup.MarginLayoutParams rl = new ViewGroup.MarginLayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        rl.topMargin = (int) (12 * d); row.setLayoutParams(rl);
        View shuffle = icon(a, false); shuffle.setContentDescription("Lecture aléatoire");
        android.widget.LinearLayout.LayoutParams sl = new android.widget.LinearLayout.LayoutParams((int) (44 * d), (int) (44 * d)); sl.rightMargin = (int) (16 * d);
        // shortcut: plays a random row (Spotify's shuffle mode needs the hidden player control); upgrade with a page shuffle command.
        shuffle.setOnClickListener(new View.OnClickListener() { public void onClick(View v) {
            int n = 0; while (find(root, String.valueOf(n + 1)) != null && n < 500) n++;
            if (n > 0) tap(root, String.valueOf(1 + new java.util.Random().nextInt(n)));
        }});
        View play = icon(a, true); play.setContentDescription("Lire la playlist");
        play.setOnClickListener(new View.OnClickListener() { public void onClick(View v) { tap(root, "1"); } });
        row.addView(shuffle, sl); row.addView(play, new android.widget.LinearLayout.LayoutParams((int) (56 * d), (int) (56 * d)));
        // User screenshot (1022382): the row must close the header card. The card is the first vertical ancestor
        // whose child holding the label is a horizontal row (cover | texts); the row goes at its end.
        ViewGroup card = null;
        for (View x = label; x.getParent() instanceof ViewGroup; x = (View) x.getParent()) {
            ViewGroup g = (ViewGroup) x.getParent();
            if (g instanceof android.widget.LinearLayout && ((android.widget.LinearLayout) g).getOrientation() == android.widget.LinearLayout.VERTICAL
                && x instanceof android.widget.LinearLayout && ((android.widget.LinearLayout) x).getOrientation() == android.widget.LinearLayout.HORIZONTAL) { card = g; break; }
            if (g == root) break;
        }
        if (card == null) card = (ViewGroup) label.getParent(); // layout not recognised: keep the button reachable
        card.addView(row);
    }
    // Drawn in code (no new resource): green disc with a black triangle, or Spotify's crossed shuffle arrows.
    static View icon(Activity a, final boolean play) {
        View v = new View(a) {
            final Paint p = new Paint(Paint.ANTI_ALIAS_FLAG);
            @Override protected void onDraw(Canvas c) {
                float w = getWidth(), h = getHeight(), r = Math.min(w, h) / 2f, cx = w / 2f, cy = h / 2f;
                if (play) {
                    p.setStyle(Paint.Style.FILL); p.setColor(0xff1ed760); c.drawCircle(cx, cy, r, p);
                    Path t = new Path(); t.moveTo(cx - r * 0.26f, cy - r * 0.38f); t.lineTo(cx + r * 0.42f, cy); t.lineTo(cx - r * 0.26f, cy + r * 0.38f); t.close();
                    p.setColor(0xff000000); c.drawPath(t, p); return;
                }
                p.setStyle(Paint.Style.STROKE); p.setStrokeWidth(r * 0.09f); p.setStrokeCap(Paint.Cap.ROUND); p.setStrokeJoin(Paint.Join.ROUND); p.setColor(0xffb3b3b3);
                float l = cx - r * 0.62f, rr = cx + r * 0.55f, t = cy - r * 0.34f, b = cy + r * 0.34f, k = r * 0.2f;
                Path q = new Path();
                q.moveTo(l, b); q.cubicTo(cx - r * 0.1f, b, cx + r * 0.05f, t, rr, t);   // rising curve
                q.moveTo(l, t); q.cubicTo(cx - r * 0.1f, t, cx + r * 0.05f, b, rr, b);   // falling curve
                q.moveTo(rr - k, t - k); q.lineTo(rr, t); q.lineTo(rr - k, t + k);      // arrow heads
                q.moveTo(rr - k, b - k); q.lineTo(rr, b); q.lineTo(rr - k, b + k);
                c.drawPath(q, p);
            }
        };
        v.setClickable(true); return v;
    }
    static void tap(View root, String index) {
        for (View x = find(root, index); x != null; x = x.getParent() instanceof View ? (View) x.getParent() : null)
            if (x.isClickable()) { x.performClick(); return; }
    }
    static TextView find(View v, String text) {
        if (v instanceof TextView && text.equals(String.valueOf(((TextView) v).getText()))) return (TextView) v;
        if (v instanceof ViewGroup) { ViewGroup g = (ViewGroup) v;
            for (int i = 0; i < g.getChildCount(); i++) { TextView f = find(g.getChildAt(i), text); if (f != null) return f; } }
        return null;
    }
}
