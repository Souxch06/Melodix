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
    private static long lastAdd = -100000;
    static void add(final Activity a) {
        final View root = a.findViewById(0x7f09022f);
        if (root == null || root.findViewWithTag(TAG) != null) return;
        TextView label = find(root, "PLAYLIST"); if (label == null) label = find(root, "VOTRE BIBLIOTHÈQUE");
        if (label == null || !(label.getParent() instanceof ViewGroup)) return;
        float d = a.getResources().getDisplayMetrics().density;
        // Spotify layout (user screenshot 1022381): a right-aligned row under the header info, shuffle then a big play.
        // User feedback (1022384): clearer labelled pills across the width: white "Lecture", glass "Aléatoire".
        android.widget.LinearLayout row = new android.widget.LinearLayout(a);
        row.setTag(TAG); row.setOrientation(android.widget.LinearLayout.HORIZONTAL);
        ViewGroup.MarginLayoutParams rl = new ViewGroup.MarginLayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        rl.topMargin = (int) (14 * d); row.setLayoutParams(rl);
        View play = icon(a, true); play.setContentDescription("Lire la playlist");
        play.setOnClickListener(new View.OnClickListener() { public void onClick(View v) { if (shuffleOn) random(root); else tap(root, "1"); } });
        View shuffle = icon(a, false); shuffle.setContentDescription("Lecture aléatoire");
        // shortcut: plays a random row (Spotify's shuffle mode needs the hidden player control); upgrade with a page shuffle command.
        // User request (1022385): a visible on/off shuffle; when on, "Lecture" starts a random track.
        shuffle.setOnClickListener(new View.OnClickListener() { public void onClick(View v) {
            shuffleOn = !shuffleOn; v.invalidate();
            if (shuffleOn) random(root);
        }});
        android.widget.LinearLayout.LayoutParams pl = new android.widget.LinearLayout.LayoutParams(0, (int) (48 * d), 1f); pl.rightMargin = (int) (6 * d);
        android.widget.LinearLayout.LayoutParams sl = new android.widget.LinearLayout.LayoutParams(0, (int) (48 * d), 1f); sl.leftMargin = (int) (6 * d);
        row.addView(play, pl); row.addView(shuffle, sl);
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
        // Fade in only on a fresh open: a list redraw rebuilds the header, and replaying it would flicker.
        long now = android.os.SystemClock.uptimeMillis(); boolean fresh = now - lastAdd > 3000; lastAdd = now;
        if (fresh) { row.setAlpha(0f); row.setTranslationY(8 * d); }
        card.addView(row);
        if (fresh) row.animate().alpha(1f).translationY(0).setDuration(260).start();
    }
    // Drawn in code (no new resource): a rounded pill with an icon and a label.
    static View icon(Activity a, final boolean play) {
        final float d = a.getResources().getDisplayMetrics().density;
        View v = new View(a) {
            final Paint p = new Paint(Paint.ANTI_ALIAS_FLAG);
            @Override protected void onDraw(Canvas c) {
                float w = getWidth(), h = getHeight(), r = h / 2f, cy = h / 2f;
                android.graphics.RectF box = new android.graphics.RectF(1, 1, w - 1, h - 1);
                boolean on = !play && shuffleOn;
                p.setStyle(Paint.Style.FILL); p.setColor(play ? 0xfff5f5f7 : on ? 0x331ed760 : 0x26ffffff); c.drawRoundRect(box, r, r, p);
                if (!play) { p.setStyle(Paint.Style.STROKE); p.setStrokeWidth(d); p.setColor(on ? 0xff1ed760 : 0x40ffffff); c.drawRoundRect(box, r, r, p); }
                int ink = play ? 0xff111114 : on ? 0xff1ed760 : 0xfff5f5f7;
                if (on) { p.setStyle(Paint.Style.FILL); p.setColor(0xff1ed760); c.drawCircle(w / 2f, h - 6 * d, 2 * d, p); }
                String label = play ? "Lecture" : "Aléatoire";
                p.setStyle(Paint.Style.FILL); p.setTextSize(15 * d); p.setTypeface(android.graphics.Typeface.DEFAULT_BOLD);
                float tw = p.measureText(label), iw = 14 * d, gap = 8 * d, x = (w - iw - gap - tw) / 2f;
                p.setColor(ink);
                if (play) { Path t = new Path(); t.moveTo(x, cy - 7 * d); t.lineTo(x + iw, cy); t.lineTo(x, cy + 7 * d); t.close(); c.drawPath(t, p); }
                else {
                    p.setStyle(Paint.Style.STROKE); p.setStrokeWidth(1.8f * d); p.setStrokeCap(Paint.Cap.ROUND); p.setStrokeJoin(Paint.Join.ROUND);
                    float l = x, rr = x + iw, t = cy - 5 * d, b = cy + 5 * d, k = 3 * d; Path q = new Path();
                    q.moveTo(l, b); q.cubicTo(l + iw * 0.45f, b, l + iw * 0.55f, t, rr, t);
                    q.moveTo(l, t); q.cubicTo(l + iw * 0.45f, t, l + iw * 0.55f, b, rr, b);
                    q.moveTo(rr - k, t - k); q.lineTo(rr, t); q.lineTo(rr - k, t + k);
                    q.moveTo(rr - k, b - k); q.lineTo(rr, b); q.lineTo(rr - k, b + k);
                    c.drawPath(q, p); p.setStyle(Paint.Style.FILL);
                }
                Paint.FontMetrics fm = p.getFontMetrics();
                c.drawText(label, x + iw + gap, cy - (fm.ascent + fm.descent) / 2f, p);
            }
        };
        v.setClickable(true);
        // Press feedback like the player buttons: shrink while held, spring back on release.
        v.setOnTouchListener(new View.OnTouchListener() { public boolean onTouch(View x, android.view.MotionEvent e) {
            int m = e.getActionMasked();
            if (m == android.view.MotionEvent.ACTION_DOWN) x.animate().scaleX(0.88f).scaleY(0.88f).setDuration(90).start();
            else if (m == android.view.MotionEvent.ACTION_UP || m == android.view.MotionEvent.ACTION_CANCEL)
                x.animate().scaleX(1f).scaleY(1f).setDuration(220).setInterpolator(new android.view.animation.OvershootInterpolator(2f)).start();
            return false;
        }});
        return v;
    }
    static boolean shuffleOn;
    static void random(View root) {
        int n = 0; while (find(root, String.valueOf(n + 1)) != null && n < 500) n++;
        if (n > 0) tap(root, String.valueOf(1 + new java.util.Random().nextInt(n)));
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
