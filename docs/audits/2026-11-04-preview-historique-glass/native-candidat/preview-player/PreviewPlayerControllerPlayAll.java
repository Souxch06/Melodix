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
        // One shuffle state with the player button (PreviewPlayerMode, user request 1022402).
        PreviewPlayerMode.shuffleMode = a.getSharedPreferences("melodix_playall", android.content.Context.MODE_PRIVATE).getBoolean("shuffle", PreviewPlayerMode.shuffleMode);
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
            // User report (1022401): while this playlist plays, the header button is pause/resume like Spotify.
            if (PreviewPlayerController.headerPlaying()) { PreviewPlayerController.togglePlayback(a); return; }
            PreviewPlayerController.expect();
            // User report (1022387): Spotify takes a moment to start; show it instead of looking frozen.
            loadingUntil = android.os.SystemClock.uptimeMillis() + 3000; v.invalidate();
            v.postDelayed(new Runnable() { public void run() { v.invalidate(); } }, 3050);
            if (PreviewPlayerMode.shuffleMode) random(root); else tap(root, "1");
        }});
        View shuffle = icon(a, false); shuffle.setContentDescription("Lecture aléatoire");
        // shortcut: plays a random row (Spotify's shuffle mode needs the hidden player control); upgrade with a page shuffle command.
        // User request (1022385): a visible on/off shuffle; when on, "Lecture" starts a random track.
        shuffle.setOnClickListener(new View.OnClickListener() { public void onClick(View v) {
            // User report (1022387): turning shuffle on started a track at once; it only toggles now.
            PreviewPlayerMode.shuffleMode = !PreviewPlayerMode.shuffleMode; v.invalidate();
            a.getSharedPreferences("melodix_playall", android.content.Context.MODE_PRIVATE).edit().putBoolean("shuffle", PreviewPlayerMode.shuffleMode).apply();
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
            return;
        }
        ViewGroup card = hero;
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
                float w = getWidth(), h = getHeight(), r = Math.min(w, h) / 2f - d, cx = w / 2f, cy = h / 2f;
                boolean pause = play && PreviewPlayerController.headerPlaying();
                boolean on = !play && PreviewPlayerMode.shuffleMode, loading = play && !pause && android.os.SystemClock.uptimeMillis() < loadingUntil;
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
                    p.setStyle(Paint.Style.FILL);
                    if (pause) { float bw = r * 0.17f, bh = r * 0.36f; c.drawRoundRect(new android.graphics.RectF(cx - r * 0.26f, cy - bh, cx - r * 0.26f + bw, cy + bh), bw / 3, bw / 3, p);
                        c.drawRoundRect(new android.graphics.RectF(cx + r * 0.26f - bw, cy - bh, cx + r * 0.26f, cy + bh), bw / 3, bw / 3, p); return; }
                    Path t = new Path();
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
            dots.setTag("melodixDots"); dots.setContentDescription("Plus d'options pour " + title(track));
            dots.setOnClickListener(new View.OnClickListener() { public void onClick(View v) { sheet(a, track, rowView); } });
            ((ViewGroup) row).addView(dots, new ViewGroup.LayoutParams((int) (36 * d), (int) (48 * d)));
        }
    }
    // User screenshot (1022396): Spotify's track sheet copied (grip, cover + title, full-width line, tall rows with
    // outline icons). Only actions that work are listed; the queue/playlist ones need a page job (next step).
    static void sheet(final Activity a, final org.json.JSONObject track, final View row) {
        final float d = a.getResources().getDisplayMetrics().density;
        final android.app.Dialog dlg = new android.app.Dialog(a) {
            // User request (1022401): Back and a tap outside also slide the panel away instead of cutting it.
            @Override public void onBackPressed() { close(this, null); }
            @Override public boolean onTouchEvent(android.view.MotionEvent e) { if (e.getActionMasked() == android.view.MotionEvent.ACTION_DOWN) { close(this, null); return true; } return super.onTouchEvent(e); }
        };
        dlg.requestWindowFeature(android.view.Window.FEATURE_NO_TITLE);
        // User request (1022401): drag the panel down to close it, like Spotify.
        android.widget.LinearLayout box = new android.widget.LinearLayout(a) {
            float y0, dy; boolean drag; final int slop = android.view.ViewConfiguration.get(a).getScaledTouchSlop();
            @Override public boolean onInterceptTouchEvent(android.view.MotionEvent e) {
                if (e.getActionMasked() == android.view.MotionEvent.ACTION_DOWN) { y0 = e.getRawY(); drag = false; }
                else if (e.getActionMasked() == android.view.MotionEvent.ACTION_MOVE && e.getRawY() - y0 > slop) drag = true;
                return drag;
            }
            @Override public boolean onTouchEvent(android.view.MotionEvent e) {
                int m = e.getActionMasked();
                if (m == android.view.MotionEvent.ACTION_DOWN) { y0 = e.getRawY(); return true; }
                dy = Math.max(0, e.getRawY() - y0);
                if (m == android.view.MotionEvent.ACTION_MOVE) { setTranslationY(dy); return true; }
                if (m == android.view.MotionEvent.ACTION_UP || m == android.view.MotionEvent.ACTION_CANCEL) {
                    if (dy > getHeight() * 0.25f) close(dlg, null);
                    else animate().translationY(0).setDuration(180).setInterpolator(new android.view.animation.DecelerateInterpolator()).start();
                    drag = false; return true;
                }
                return true;
            }
        };
        box.setClickable(true); box.setOrientation(android.widget.LinearLayout.VERTICAL);
        android.graphics.drawable.GradientDrawable bg = new android.graphics.drawable.GradientDrawable(); bg.setColor(0xff1f1f22);
        bg.setCornerRadii(new float[]{22 * d, 22 * d, 22 * d, 22 * d, 0, 0, 0, 0}); box.setBackground(bg);
        box.setPadding(0, (int) (12 * d), 0, (int) (28 * d));
        View grip = new View(a); android.graphics.drawable.GradientDrawable gb = new android.graphics.drawable.GradientDrawable(); gb.setColor(0x66ffffff); gb.setCornerRadius(3 * d); grip.setBackground(gb);
        android.widget.LinearLayout.LayoutParams gl = new android.widget.LinearLayout.LayoutParams((int) (40 * d), (int) (5 * d)); gl.gravity = android.view.Gravity.CENTER_HORIZONTAL; gl.bottomMargin = (int) (20 * d); box.addView(grip, gl);
        android.widget.LinearLayout head = new android.widget.LinearLayout(a); head.setGravity(android.view.Gravity.CENTER_VERTICAL); head.setPadding((int) (20 * d), 0, (int) (20 * d), 0);
        android.widget.ImageView art = new android.widget.ImageView(a); art.setScaleType(android.widget.ImageView.ScaleType.CENTER_CROP);
        try { PreviewPlayerController.cover(art, track.optString("image", ""), (int) (56 * d)); } catch (RuntimeException ignored) { }
        head.addView(art, new android.widget.LinearLayout.LayoutParams((int) (56 * d), (int) (56 * d)));
        android.widget.LinearLayout names = new android.widget.LinearLayout(a); names.setOrientation(android.widget.LinearLayout.VERTICAL); names.setPadding((int) (16 * d), 0, 0, 0);
        names.addView(text(a, title(track), 17, 0xfff5f5f7, false)); TextView sub = text(a, artist(track), 14, 0xffa1a1aa, false); sub.setPadding(0, (int) (4 * d), 0, 0); names.addView(sub);
        head.addView(names, new android.widget.LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        box.addView(head);
        View line = new View(a); line.setBackgroundColor(0x33ffffff);
        android.widget.LinearLayout.LayoutParams ll = new android.widget.LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, Math.max(1, (int) d)); ll.topMargin = (int) (18 * d); ll.bottomMargin = (int) (6 * d); box.addView(line, ll);
        final String link = "https://open.spotify.com/track/" + trackUri(track).substring("spotify:track:".length());
        box.addView(item(a, 0, "Partager", new Runnable() { public void run() {
            android.content.Intent i = new android.content.Intent(android.content.Intent.ACTION_SEND); i.setType("text/plain");
            i.putExtra(android.content.Intent.EXTRA_TEXT, link); a.startActivity(android.content.Intent.createChooser(i, "Partager"));
        } }, dlg));
        final String id = trackUri(track).substring("spotify:track:".length());
        box.addView(item(a, 2, "Ajouter à la file d'attente", new Runnable() { public void run() {
            // Melodix plays the order itself (1022402): add after the current track, like Spotify's queue.
            if (PreviewPlayerControllerQueue.addNext(trackUri(track), track)) { toast(a, "Ajouté à la file d'attente"); return; }
            pageMenu(a, id, "Ajouter à la file d'attente|Add to queue", "Ajouté à la file d'attente"); } }, dlg));
        // Spotify's track menu (user request 1022405): like through the page's own menu, on an explicit tap.
        box.addView(item(a, 4, "Ajouter aux Titres likés", new Runnable() { public void run() {
            pageMenu(a, id, "Ajouter aux Titres likés|Enregistrer dans vos Titres likés|Save to your Liked Songs|Ajouter à Titres likés", "Ajouté aux Titres likés"); } }, dlg));
        box.addView(item(a, 5, "Minuterie de veille", new Runnable() { public void run() { sleepTimer(a); } }, dlg));
        final String who = artist(track).split(",")[0].trim();
        if (!who.isEmpty()) box.addView(item(a, 1, "Accéder à l'artiste", new Runnable() { public void run() { search(a, who); } }, dlg));
        box.addView(item(a, 3, "Supprimer de cette playlist", new Runnable() { public void run() {
            // Account write: only after an explicit confirmation tap.
            new android.app.AlertDialog.Builder(a).setTitle("Supprimer de cette playlist ?").setMessage(title(track))
                .setNegativeButton("Annuler", null)
                .setPositiveButton("Supprimer", new android.content.DialogInterface.OnClickListener() { public void onClick(android.content.DialogInterface x, int k) {
                    pageMenu(a, id, "Supprimer de cette playlist|Remove from this playlist", "Supprimé de la playlist"); } }).show();
        } }, dlg));
        dlg.setCanceledOnTouchOutside(false); dlg.setContentView(box);
        final android.view.Window w = dlg.getWindow();
        if (w != null) { w.setBackgroundDrawable(new android.graphics.drawable.ColorDrawable(0)); w.setGravity(android.view.Gravity.BOTTOM);
            w.setLayout(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT); w.setWindowAnimations(0); w.setDimAmount(0f); }
        // User request (1022397): slide up with a fading dim on open, slide down on close.
        final View panel = box;
        dlg.setOnShowListener(new android.content.DialogInterface.OnShowListener() { public void onShow(android.content.DialogInterface x) {
            panel.setTranslationY(panel.getHeight() > 0 ? panel.getHeight() : 600 * d);
            panel.animate().translationY(0).setDuration(280).setInterpolator(new android.view.animation.DecelerateInterpolator(2f)).start();
            dim(w, 0f, 0.6f, 280);
        }});
        closer.put(dlg, panel);
        dlg.show();
    }
    static TextView text(Activity a, String s, int sp, int color, boolean bold) {
        TextView t = new TextView(a); t.setText(s); t.setTextSize(sp); t.setTextColor(color); t.setSingleLine(true);
        t.setEllipsize(android.text.TextUtils.TruncateAt.END); if (bold) t.setTypeface(android.graphics.Typeface.DEFAULT_BOLD); return t;
    }
    // Outline icons drawn like Spotify's (0 share, 1 artist).
    static View glyph(Activity a, final int kind) {
        final float d = a.getResources().getDisplayMetrics().density;
        return new View(a) {
            final Paint p = new Paint(Paint.ANTI_ALIAS_FLAG);
            @Override protected void onDraw(Canvas c) {
                p.setStyle(Paint.Style.STROKE); p.setStrokeWidth(1.8f * d); p.setColor(0xfff5f5f7); p.setStrokeCap(Paint.Cap.ROUND); p.setStrokeJoin(Paint.Join.ROUND);
                float w = getWidth(), h = getHeight(), u = Math.min(w, h) / 24f; c.save(); c.translate((w - 24 * u) / 2f, (h - 24 * u) / 2f); c.scale(u, u); p.setStrokeWidth(1.8f * d / u);
                if (kind == 0) { c.drawCircle(18, 5, 3, p); c.drawCircle(6, 12, 3, p); c.drawCircle(18, 19, 3, p); c.drawLine(8.6f, 10.5f, 15.4f, 6.5f, p); c.drawLine(8.6f, 13.5f, 15.4f, 17.5f, p); }
                else if (kind == 2) { c.drawLine(3, 6, 9, 6, p); c.drawLine(6, 3, 6, 9, p); c.drawLine(12, 6, 21, 6, p); c.drawLine(3, 12, 21, 12, p); c.drawLine(3, 18, 21, 18, p); }
                else if (kind == 3) { c.drawCircle(12, 12, 9, p); c.drawLine(8, 12, 16, 12, p); }
                else if (kind == 4) { Path q = new Path(); q.moveTo(12, 20); q.cubicTo(4, 14, 2, 10, 4.5f, 6.5f); q.cubicTo(7, 3.5f, 10.5f, 4.5f, 12, 7.5f); q.cubicTo(13.5f, 4.5f, 17, 3.5f, 19.5f, 6.5f); q.cubicTo(22, 10, 20, 14, 12, 20); c.drawPath(q, p); }
                else if (kind == 5) { Path q = new Path(); q.moveTo(19, 14.5f); q.cubicTo(14, 17, 7.5f, 13, 9.5f, 4); q.cubicTo(4, 6, 3, 13, 7, 17.5f); q.cubicTo(11, 21.5f, 17, 20, 19, 14.5f); c.drawPath(q, p); }
                else { c.drawCircle(10, 7, 4, p); Path q = new Path(); q.moveTo(3, 21); q.cubicTo(3, 15.5f, 6.5f, 13, 10, 13); q.cubicTo(11.5f, 13, 12.7f, 13.4f, 13.6f, 14); c.drawPath(q, p);
                    c.drawCircle(18, 19, 2, p); c.drawLine(20, 19, 20, 12, p); c.drawLine(20, 12, 22.5f, 13, p); }
                c.restore();
            }
        };
    }
    static View item(Activity a, int icon, String label, final Runnable action, final android.app.Dialog dlg) {
        float d = a.getResources().getDisplayMetrics().density;
        android.widget.LinearLayout row = new android.widget.LinearLayout(a); row.setGravity(android.view.Gravity.CENTER_VERTICAL);
        row.setPadding((int) (20 * d), 0, (int) (20 * d), 0); row.setClickable(true); row.setMinimumHeight((int) (64 * d));
        android.util.TypedValue tv = new android.util.TypedValue();
        if (a.getTheme().resolveAttribute(android.R.attr.selectableItemBackground, tv, true)) row.setBackgroundResource(tv.resourceId);
        row.addView(glyph(a, icon), new android.widget.LinearLayout.LayoutParams((int) (28 * d), (int) (28 * d)));
        TextView l = text(a, label, 17, 0xfff5f5f7, false); l.setPadding((int) (20 * d), 0, 0, 0); row.addView(l);
        row.setOnClickListener(new View.OnClickListener() { public void onClick(View v) { close(dlg, action); } });
        return row;
    }
    // User screenshot (1022391): rows from some paths carry the track link as "id", not "uri".
    static String trackUri(org.json.JSONObject o) { String u = o.optString("uri", ""); return u.isEmpty() ? o.optString("id", "") : u; }
    // User diagnostic (1022394): media rows carry name/artists instead of title/subtitle.
    static String title(org.json.JSONObject o) { String t = o.optString("title", ""); return t.isEmpty() ? o.optString("name", "") : t; }
    static String artist(org.json.JSONObject o) {
        String s = o.optString("subtitle", ""); if (!s.isEmpty()) return s;
        org.json.JSONArray a = o.optJSONArray("artists"); StringBuilder b = new StringBuilder();
        for (int i = 0; a != null && i < a.length(); i++) { Object x = a.opt(i); String n = x instanceof org.json.JSONObject ? ((org.json.JSONObject) x).optString("name", "") : String.valueOf(x);
            if (!n.isEmpty()) b.append(b.length() == 0 ? "" : ", ").append(n); }
        return b.toString();
    }
    // The app's own search entry (onNativeGenreClick: runs a live search with the view tag, then shows results).
    static void search(Activity a, String q) {
        try { View tag = new View(a); tag.setTag(q); a.getClass().getMethod("onNativeGenreClick", View.class).invoke(a, tag); }
        catch (Exception e) { android.widget.Toast.makeText(a, "Recherche indisponible", android.widget.Toast.LENGTH_SHORT).show(); }
    }
    static boolean fresh0() { long now = android.os.SystemClock.uptimeMillis(); boolean f = now - lastAdd > 3000; lastAdd = now; return f; }
    static final java.util.WeakHashMap<android.app.Dialog, View> closer = new java.util.WeakHashMap<android.app.Dialog, View>();
    static void dim(final android.view.Window w, float from, float to, long ms) {
        if (w == null) return;
        android.animation.ValueAnimator va = android.animation.ValueAnimator.ofFloat(from, to); va.setDuration(ms);
        va.addUpdateListener(new android.animation.ValueAnimator.AnimatorUpdateListener() { public void onAnimationUpdate(android.animation.ValueAnimator v) {
            w.setDimAmount((Float) v.getAnimatedValue()); w.addFlags(android.view.WindowManager.LayoutParams.FLAG_DIM_BEHIND); } });
        va.start();
    }
    static void close(final android.app.Dialog dlg, final Runnable then) {
        View panel = closer.remove(dlg);
        if (panel == null) return; // already closing (drag + tap); every sheet registers before show
        if (panel.getHeight() == 0) { dlg.dismiss(); if (then != null) try { then.run(); } catch (RuntimeException ignored) { } return; }
        dim(dlg.getWindow(), 0.6f, 0f, 220);
        // User request (1022401): fade out while sliding away.
        panel.animate().translationY(panel.getHeight()).alpha(0f).setDuration(220).setInterpolator(new android.view.animation.AccelerateInterpolator(2f)).withEndAction(new Runnable() { public void run() {
            dlg.dismiss(); if (then != null) try { then.run(); } catch (RuntimeException ignored) { } } }).start();
    }
    // Spotify's own track menu in the hidden page (no token): right-click the track row, then click the entry.
    // shortcut: works only if the track row is rendered in the page (Spotify draws only nearby rows); otherwise it says so.
    static final String MENU_JOB = "(function(id,labels){try{var a=document.querySelector('a[href*=\"/track/'+id+'\"]');var row=a&&(a.closest('[data-testid=\"tracklist-row\"]')||a.closest('[role=\"row\"]'));if(!row)return 'absent';var r=row.getBoundingClientRect();row.dispatchEvent(new MouseEvent('contextmenu',{bubbles:true,cancelable:true,clientX:r.left+20,clientY:r.top+10,button:2}));window.__sfMenuJob='open';setTimeout(function(){var want=labels.split('|');var items=document.querySelectorAll('[role=\"menu\"] button,[role=\"menu\"] [role=\"menuitem\"],#context-menu button');for(var i=0;i<items.length;i++){var t=(items[i].textContent||'').trim();for(var j=0;j<want.length;j++)if(t===want[j]||t.indexOf(want[j])===0){items[i].click();window.__sfMenuJob='done';return}}window.__sfMenuJob='missing';document.dispatchEvent(new KeyboardEvent('keydown',{key:'Escape',bubbles:true}))},350);return 'started'}catch(e){return 'error'}})";
    static void pageMenu(final Activity a, String id, String labels, final String ok) {
        final android.webkit.WebView w = webView(a.getWindow().getDecorView());
        if (w == null) { toast(a, "Page Spotify indisponible"); return; }
        w.evaluateJavascript(MENU_JOB + "(" + org.json.JSONObject.quote(id) + "," + org.json.JSONObject.quote(labels) + ")", new android.webkit.ValueCallback<String>() { public void onReceiveValue(String v) {
            if (!"\"started\"".equals(v)) { toast(a, "\"absent\"".equals(v) ? "Titre introuvable dans la page Spotify, réessaie" : "Action indisponible"); return; }
            w.postDelayed(new Runnable() { public void run() { w.evaluateJavascript("window.__sfMenuJob", new android.webkit.ValueCallback<String>() { public void onReceiveValue(String r) {
                toast(a, "\"done\"".equals(r) ? ok : "Action non trouvée dans le menu Spotify"); } }); } }, 700);
        } });
    }
    static android.webkit.WebView webView(View v) {
        if (v instanceof android.webkit.WebView) return (android.webkit.WebView) v;
        if (v instanceof ViewGroup) { ViewGroup g = (ViewGroup) v; for (int i = 0; i < g.getChildCount(); i++) { android.webkit.WebView f = webView(g.getChildAt(i)); if (f != null) return f; } }
        return null;
    }
    // Spotify's sleep timer: pause after a delay or at the end of the track.
    static void sleepTimer(final Activity a) {
        final String[] labels = {"5 minutes", "15 minutes", "30 minutes", "45 minutes", "1 heure", "Fin du titre", "Désactiver la minuterie"};
        final long[] mins = {5, 15, 30, 45, 60, -1, 0};
        new android.app.AlertDialog.Builder(a).setTitle("Minuterie de veille").setItems(labels, new android.content.DialogInterface.OnClickListener() {
            public void onClick(android.content.DialogInterface x, int i) {
                PreviewPlayerController.sleep(a, mins[i]);
                toast(a, mins[i] == 0 ? "Minuterie désactivée" : mins[i] < 0 ? "Pause à la fin du titre" : "Pause dans " + labels[i]);
            } }).show();
    }
    static void toast(Activity a, String m) { android.widget.Toast.makeText(a, m, android.widget.Toast.LENGTH_SHORT).show(); }
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
