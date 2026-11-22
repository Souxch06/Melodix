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
// shortcut: the first row is found by its "1" index; upgrade if the row layout changes.
final class PreviewPlayerControllerPlayAll {
    static final String TAG = "melodixPlayAll";
    private static long lastAdd = -100000;
    static void add(final Activity a, String rows) {
        final View root = a.findViewById(0x7f09022f);
        if (root == null) return;
        try { addMenus(a, root, new org.json.JSONArray(rows)); } catch (Exception ignored) { }
        if (root.findViewWithTag(TAG) != null) return;
        // User request (1022388): the header is the styled hero (tag set by GlassScreenStyler).
        View heroView = root.findViewWithTag("glass-playlist-hero");
        if (!(heroView instanceof ViewGroup)) return;
        final ViewGroup hero = (ViewGroup) heroView;
        float d = a.getResources().getDisplayMetrics().density;
        // Spotify layout (user screenshot 1022381): a right-aligned row under the header info, shuffle then a big play.
        // User feedback (1022384): clearer labelled pills across the width: white "Lecture", glass "Aléatoire".
        android.widget.LinearLayout row = new android.widget.LinearLayout(a);
        row.setTag(TAG); row.setOrientation(android.widget.LinearLayout.HORIZONTAL);
        // User request (1022389): icons only, right-aligned like Spotify, Melodix colours (no green).
        row.setGravity(android.view.Gravity.END | android.view.Gravity.CENTER_VERTICAL);
        ViewGroup.MarginLayoutParams rl = new ViewGroup.MarginLayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        rl.topMargin = (int) (14 * d); row.setLayoutParams(rl);
        View play = icon(a, true); play.setContentDescription("Lire la playlist");
        play.setOnClickListener(new View.OnClickListener() { public void onClick(final View v) {
            // User report (1022387): Spotify takes a moment to start; show it instead of looking frozen.
            loadingUntil = android.os.SystemClock.uptimeMillis() + 3000; v.invalidate();
            v.postDelayed(new Runnable() { public void run() { v.invalidate(); } }, 3050);
            if (shuffleOn) random(root); else tap(root, "1");
        }});
        View shuffle = icon(a, false); shuffle.setContentDescription("Lecture aléatoire");
        // shortcut: plays a random row (Spotify's shuffle mode needs the hidden player control); upgrade with a page shuffle command.
        // User request (1022385): a visible on/off shuffle; when on, "Lecture" starts a random track.
        shuffle.setOnClickListener(new View.OnClickListener() { public void onClick(View v) {
            // User report (1022387): turning shuffle on started a track at once; it only toggles now.
            shuffleOn = !shuffleOn; v.invalidate();
        }});
        android.widget.LinearLayout.LayoutParams sl = new android.widget.LinearLayout.LayoutParams((int) (48 * d), (int) (48 * d)); sl.rightMargin = (int) (16 * d);
        row.addView(shuffle, sl); row.addView(play, new android.widget.LinearLayout.LayoutParams((int) (60 * d), (int) (60 * d)));
        // User screenshot (1022390): like Spotify, the meta line and the buttons share one row.
        View meta = hero.findViewWithTag("glass-playlist-count");
        if (meta != null && meta.getParent() instanceof ViewGroup) {
            ViewGroup side = (ViewGroup) meta.getParent(); int at = side.indexOfChild(meta);
            side.removeView(meta); row.setGravity(android.view.Gravity.CENTER_VERTICAL);
            row.addView(meta, 0, new android.widget.LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
            ((ViewGroup.MarginLayoutParams) row.getLayoutParams()).topMargin = (int) (6 * d);
            side.addView(row, at);
            if (fresh0()) { row.setAlpha(0f); row.animate().alpha(1f).setDuration(260).start(); }
            return;
        }
        ViewGroup card = hero;
        // Fade in only on a fresh open: a list redraw rebuilds the header, and replaying it would flicker.
        long now = android.os.SystemClock.uptimeMillis(); boolean fresh = now - lastAdd > 3000; lastAdd = now;
        if (fresh) { row.setAlpha(0f); row.setTranslationY(8 * d); }
        card.addView(row, Math.max(0, card.getChildCount() - 1)); // above the hairline
        if (fresh) row.animate().alpha(1f).translationY(0).setDuration(260).start();
    }
    // Drawn in code (no new resource): a rounded pill with an icon and a label.
    static View icon(Activity a, final boolean play) {
        final float d = a.getResources().getDisplayMetrics().density;
        View v = new View(a) {
            final Paint p = new Paint(Paint.ANTI_ALIAS_FLAG);
            @Override protected void onDraw(Canvas c) {
                float w = getWidth(), h = getHeight(), r = Math.min(w, h) / 2f - d, cx = w / 2f, cy = h / 2f;
                boolean on = !play && shuffleOn, loading = play && android.os.SystemClock.uptimeMillis() < loadingUntil;
                p.setStyle(Paint.Style.FILL);
                if (play || on) {
                    // Soft white halo, then the white disc (same look as the mini player's play button).
                    p.setColor(0x22ffffff); c.drawCircle(cx, cy, r + d, p);
                    p.setColor(0xfff5f5f7); c.drawCircle(cx, cy, r - 2 * d, p);
                } else {
                    p.setColor(0x26ffffff); c.drawCircle(cx, cy, r, p);
                    p.setStyle(Paint.Style.STROKE); p.setStrokeWidth(d); p.setColor(0x40ffffff); c.drawCircle(cx, cy, r, p);
                }
                int ink = play || on ? 0xff111114 : 0xfff5f5f7; p.setColor(ink);
                if (play) {
                    if (loading) { p.setStyle(Paint.Style.STROKE); p.setStrokeWidth(2.5f * d); p.setStrokeCap(Paint.Cap.ROUND);
                        float a0 = (android.os.SystemClock.uptimeMillis() % 1000) * 0.36f;
                        c.drawArc(new android.graphics.RectF(cx - r * 0.38f, cy - r * 0.38f, cx + r * 0.38f, cy + r * 0.38f), a0, 270, false, p); postInvalidateOnAnimation(); return; }
                    p.setStyle(Paint.Style.FILL); Path t = new Path();
                    t.moveTo(cx - r * 0.26f, cy - r * 0.36f); t.lineTo(cx + r * 0.40f, cy); t.lineTo(cx - r * 0.26f, cy + r * 0.36f); t.close(); c.drawPath(t, p); return;
                }
                p.setStyle(Paint.Style.STROKE); p.setStrokeWidth(1.8f * d); p.setStrokeCap(Paint.Cap.ROUND); p.setStrokeJoin(Paint.Join.ROUND);
                float iw = r * 0.9f, l = cx - iw / 2f, rr = cx + iw / 2f, t = cy - r * 0.28f, b = cy + r * 0.28f, k = r * 0.16f; Path q = new Path();
                q.moveTo(l, b); q.cubicTo(l + iw * 0.45f, b, l + iw * 0.55f, t, rr, t);
                q.moveTo(l, t); q.cubicTo(l + iw * 0.45f, t, l + iw * 0.55f, b, rr, b);
                q.moveTo(rr - k, t - k); q.lineTo(rr, t); q.lineTo(rr - k, t + k);
                q.moveTo(rr - k, b - k); q.lineTo(rr, b); q.lineTo(rr - k, b + k);
                c.drawPath(q, p);
            }
        };
        v.setClickable(true);
        // Press feedback like the player buttons: shrink while held, spring back on release.
        v.setOnTouchListener(new View.OnTouchListener() { public boolean onTouch(View x, android.view.MotionEvent e) {
            int m = e.getActionMasked();
            if (m == android.view.MotionEvent.ACTION_DOWN) { x.performHapticFeedback(android.view.HapticFeedbackConstants.KEYBOARD_TAP); x.animate().scaleX(0.86f).scaleY(0.86f).alpha(0.85f).setDuration(90).start(); }
            else if (m == android.view.MotionEvent.ACTION_UP || m == android.view.MotionEvent.ACTION_CANCEL)
                x.animate().scaleX(1f).scaleY(1f).alpha(1f).setDuration(260).setInterpolator(new android.view.animation.OvershootInterpolator(2f)).start();
            return false;
        }});
        return v;
    }
    // User request (1022386): Spotify-like "⋮" on each track row opening a bottom panel. Only actions that surely
    // work are listed (rows carry title, artist, cover and track link; no album/artist link, no queue command).
    static void addMenus(final Activity a, View root, org.json.JSONArray rows) {
        java.util.List<org.json.JSONObject> tracks = new java.util.ArrayList<org.json.JSONObject>();
        for (int i = 0; i < rows.length(); i++) { org.json.JSONObject o = rows.optJSONObject(i); if (o != null && trackUri(o).startsWith("spotify:track:")) tracks.add(o); }
        final float d = a.getResources().getDisplayMetrics().density;
        for (int i = 0; i < tracks.size(); i++) {
            TextView idx = find(root, String.valueOf(i + 1)); if (idx == null) break;
            View row = idx; while (row != null && !row.isClickable()) row = row.getParent() instanceof View ? (View) row.getParent() : null;
            if (!(row instanceof ViewGroup) || row.findViewWithTag("melodixDots") != null) continue;
            final org.json.JSONObject track = tracks.get(i); final View rowView = row;
            View dots = new View(a) {
                final Paint p = new Paint(Paint.ANTI_ALIAS_FLAG);
                @Override protected void onDraw(Canvas c) { p.setColor(0xffb3b3b3); float cx = getWidth() / 2f, cy = getHeight() / 2f;
                    for (int k = -1; k <= 1; k++) c.drawCircle(cx, cy + k * 6 * d, 1.8f * d, p); }
            };
            dots.setTag("melodixDots"); dots.setContentDescription("Plus d'options pour " + track.optString("title", ""));
            dots.setOnClickListener(new View.OnClickListener() { public void onClick(View v) { sheet(a, track, rowView); } });
            ((ViewGroup) row).addView(dots, new ViewGroup.LayoutParams((int) (36 * d), (int) (48 * d)));
        }
    }
    static void sheet(final Activity a, final org.json.JSONObject track, final View row) {
        final float d = a.getResources().getDisplayMetrics().density;
        final android.app.Dialog dlg = new android.app.Dialog(a);
        dlg.requestWindowFeature(android.view.Window.FEATURE_NO_TITLE);
        android.widget.LinearLayout box = new android.widget.LinearLayout(a); box.setOrientation(android.widget.LinearLayout.VERTICAL);
        android.graphics.drawable.GradientDrawable bg = new android.graphics.drawable.GradientDrawable(); bg.setColor(0xff1f1f22);
        bg.setCornerRadii(new float[]{18 * d, 18 * d, 18 * d, 18 * d, 0, 0, 0, 0}); box.setBackground(bg);
        box.setPadding((int) (20 * d), (int) (10 * d), (int) (20 * d), (int) (24 * d));
        View grip = new View(a); android.graphics.drawable.GradientDrawable gb = new android.graphics.drawable.GradientDrawable(); gb.setColor(0x66ffffff); gb.setCornerRadius(3 * d); grip.setBackground(gb);
        android.widget.LinearLayout.LayoutParams gl = new android.widget.LinearLayout.LayoutParams((int) (40 * d), (int) (5 * d)); gl.gravity = android.view.Gravity.CENTER_HORIZONTAL; gl.bottomMargin = (int) (14 * d); box.addView(grip, gl);
        android.widget.LinearLayout head = new android.widget.LinearLayout(a); head.setGravity(android.view.Gravity.CENTER_VERTICAL);
        android.widget.ImageView art = new android.widget.ImageView(a); art.setScaleType(android.widget.ImageView.ScaleType.CENTER_CROP);
        try { PreviewPlayerController.cover(art, track.optString("image", ""), (int) (56 * d)); } catch (RuntimeException ignored) { }
        head.addView(art, new android.widget.LinearLayout.LayoutParams((int) (56 * d), (int) (56 * d)));
        android.widget.LinearLayout names = new android.widget.LinearLayout(a); names.setOrientation(android.widget.LinearLayout.VERTICAL); names.setPadding((int) (14 * d), 0, 0, 0);
        names.addView(text(a, track.optString("title", ""), 17, 0xfff5f5f7, true)); names.addView(text(a, track.optString("subtitle", ""), 14, 0xffa1a1aa, false));
        head.addView(names, new android.widget.LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        box.addView(head);
        View line = new View(a); line.setBackgroundColor(0x22ffffff);
        android.widget.LinearLayout.LayoutParams ll = new android.widget.LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, Math.max(1, (int) d)); ll.topMargin = ll.bottomMargin = (int) (14 * d); box.addView(line, ll);
        final String link = "https://open.spotify.com/track/" + trackUri(track).substring("spotify:track:".length());
        box.addView(item(a, "▶", "Lire", new Runnable() { public void run() { row.performClick(); } }, dlg));
        box.addView(item(a, "↗", "Partager", new Runnable() { public void run() {
            android.content.Intent i = new android.content.Intent(android.content.Intent.ACTION_SEND); i.setType("text/plain");
            i.putExtra(android.content.Intent.EXTRA_TEXT, link); a.startActivity(android.content.Intent.createChooser(i, "Partager"));
        } }, dlg));
        box.addView(item(a, "⧉", "Copier le lien", new Runnable() { public void run() {
            ((android.content.ClipboardManager) a.getSystemService(android.content.Context.CLIPBOARD_SERVICE)).setPrimaryClip(android.content.ClipData.newPlainText("Lien", link));
            android.widget.Toast.makeText(a, "Lien copié", android.widget.Toast.LENGTH_SHORT).show();
        } }, dlg));
        dlg.setContentView(box);
        android.view.Window w = dlg.getWindow();
        if (w != null) { w.setBackgroundDrawable(new android.graphics.drawable.ColorDrawable(0)); w.setGravity(android.view.Gravity.BOTTOM);
            w.setLayout(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT); w.setWindowAnimations(android.R.style.Animation_InputMethod); w.setDimAmount(0.55f); }
        dlg.show();
    }
    static TextView text(Activity a, String s, int sp, int color, boolean bold) {
        TextView t = new TextView(a); t.setText(s); t.setTextSize(sp); t.setTextColor(color); t.setSingleLine(true);
        t.setEllipsize(android.text.TextUtils.TruncateAt.END); if (bold) t.setTypeface(android.graphics.Typeface.DEFAULT_BOLD); return t;
    }
    static View item(Activity a, String glyph, String label, final Runnable action, final android.app.Dialog dlg) {
        float d = a.getResources().getDisplayMetrics().density;
        android.widget.LinearLayout row = new android.widget.LinearLayout(a); row.setGravity(android.view.Gravity.CENTER_VERTICAL);
        row.setPadding(0, (int) (14 * d), 0, (int) (14 * d)); row.setClickable(true);
        TextView g = text(a, glyph, 20, 0xfff5f5f7, false); g.setGravity(android.view.Gravity.CENTER);
        row.addView(g, new android.widget.LinearLayout.LayoutParams((int) (32 * d), ViewGroup.LayoutParams.WRAP_CONTENT));
        TextView l = text(a, label, 16, 0xfff5f5f7, false); l.setPadding((int) (18 * d), 0, 0, 0); row.addView(l);
        row.setOnClickListener(new View.OnClickListener() { public void onClick(View v) { dlg.dismiss(); try { action.run(); } catch (RuntimeException ignored) { } } });
        return row;
    }
    // User screenshot (1022391): rows from some paths carry the track link as "id", not "uri".
    static String trackUri(org.json.JSONObject o) { String u = o.optString("uri", ""); return u.isEmpty() ? o.optString("id", "") : u; }
    static boolean fresh0() { long now = android.os.SystemClock.uptimeMillis(); boolean f = now - lastAdd > 3000; lastAdd = now; return f; }
    static boolean shuffleOn;
    static long loadingUntil;
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
