package com.melodix.music;

import android.animation.ObjectAnimator;
import android.animation.ValueAnimator;
import android.app.Activity;
import android.app.AlertDialog;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.DialogInterface;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.view.Choreographer;
import android.view.View;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.Toast;
import org.json.JSONArray;
import org.json.JSONObject;
import java.lang.ref.WeakReference;
import java.util.Locale;

/** Preview-only display controller. No network access and no persistent data. */
public final class PreviewPlayerController implements Choreographer.FrameCallback {
    private static final int MINI = 0x7f09024d, FULL = 0x7f09023d;
    private static final int ELAPSED = 0x7f09024a, DURATION = 0x7f09024b;
    private static final int MINI_BUTTON = 0x7f090238, FULL_BUTTON = 0x7f09023e;
    private static final int PAUSE_ICON = 0x7f080121, PLAY_ICON = 0x7f080122;
    private static final long MAX_STALE_MS = 1500, CORRECTION_MS = 4000;
    private static final long RECONCILE_MS = 8000;
    private final WeakReference<Activity> activity;
    private final Handler handler = new Handler(Looper.getMainLooper());
    private boolean valid, moving, frameScheduled, haveReal, realPlaying, shownPlaying, pending;
    private boolean pendingTarget;
    private long serial, anchor, duration;
    private long cachedElapsed = -1, cachedDuration = -1, cachedRemaining = -1;
    private String elapsedText = "—", durationText = "—", remainingText = "Temps restant : —";
    private double base, correction;
    private String track = "";
    private String progressSource = "none";
    private boolean progressHasUri;
    // Cosmetic only: animate the clipped fill, never the position or track.
    private boolean foreground, glowSampleValid;
    private final ObjectAnimator[] glow = new ObjectAnimator[2];
    private final Drawable[] glowFill = new Drawable[2];
    // Diagnostic measurements contain only monotonic time differences.
    private long tapAt = -1, commandAt = -1, stateAt = -1, optimisticAt = -1, uiAt = -1;
    private long previousProgressAt = -1, previousPosition = -1;
    private final long[] intervals = new long[60];
    private int intervalCount, intervalIndex;
    private int operation; // 1 play/pause, 2 previous, 3 next
    private String trackBefore = "";
    // Durations only; process-local, no Spotify identifiers in the report.
    private static long firstCreateAt = -1, processStartAt = -1, firstHomeFrameMs = -1, processHomeFrameMs = -1;
    private boolean measureHomeFrame, measurePlaylistFrame;
    private long playlistStart = -1, playlistFrameMs = -1;
    private String pendingPlaylist = "";
    public void activityCreated() {
        if (firstCreateAt >= 0) return;
        firstCreateAt = now();
        // Public API starting in Android 12. On older versions, explicitly
        // report unavailable instead of using hidden APIs or guessing.
        if (android.os.Build.VERSION.SDK_INT >= 31) {
            try {
                long start = android.os.Process.getStartElapsedRealtime();
                if (start >= 0 && start <= firstCreateAt) processStartAt = start;
            } catch (LinkageError ignored) { } catch (RuntimeException ignored) { }
        }
    }
    public void playlistOpened(String uri) {
        playlistStart = -1; playlistFrameMs = -1; pendingPlaylist = ""; measurePlaylistFrame = false;
        if (uri != null && uri.matches("(?i)^spotify:playlist:[a-z0-9]+$")) {
            pendingPlaylist = uri; playlistStart = now();
        }
    }
    public void rowsPainted(String screen, String context, String rows) {
        if ("home".equals(screen) && firstCreateAt >= 0 && firstHomeFrameMs < 0) measureHomeFrame = true;
        if ("detail".equals(screen) && playlistStart >= 0 && pendingPlaylist.equals(context)) {
            try {
                JSONArray data = new JSONArray(rows);
                for (int i = 0; i < data.length(); i++) {
                    JSONObject row = data.optJSONObject(i);
                    if (row != null && row.optString("uri", row.optString("id", "")).matches("(?i)^spotify:track:[a-z0-9]+$")) {
                        measurePlaylistFrame = true; break;
                    }
                }
            } catch (Exception ignored) { }
        }
        scheduleFrame();
    }

    public PreviewPlayerController(Activity a) { activity = new WeakReference<Activity>(a); }
    private long now() { return SystemClock.elapsedRealtime(); }
    private double position(long t) {
        if (!valid) return Double.NaN;
        long elapsed = Math.max(0, t - anchor);
        long motion = moving ? Math.min(elapsed, MAX_STALE_MS) : 0;
        double adjust = moving ? correction * Math.min(1.0, (double) motion / CORRECTION_MS) : 0;
        return Math.max(0, Math.min(duration, base + motion + adjust));
    }
    private static String clock(long ms) {
        long seconds = Math.max(0, ms / 1000), s = seconds % 60, m = (seconds / 60) % 60, h = seconds / 3600;
        return h > 0 ? String.format(Locale.ROOT, "%d:%02d:%02d", h, m, s) : String.format(Locale.ROOT, "%d:%02d", m, s);
    }
    private void text(Activity a, int id, String value) {
        View v = a.findViewById(id);
        if (v instanceof TextView && !value.contentEquals(((TextView) v).getText())) ((TextView) v).setText(value);
    }
    private void renderProgress() {
        Activity a = activity.get(); if (a == null) return;
        double pos = position(now());
        if (Double.isNaN(pos)) {
            text(a, ELAPSED, "—"); text(a, DURATION, "—");
            setProgress(a, MINI, 0); setProgress(a, FULL, 0);
            View root = a.findViewById(0x7f09023a);
            View remaining = root == null ? null : root.findViewWithTag("nativePlayerRemaining");
            if (remaining instanceof TextView && !"Temps restant : —".contentEquals(((TextView) remaining).getText()))
                ((TextView) remaining).setText("Temps restant : —");
            return;
        }
        long value = (long) Math.floor(pos), left = Math.max(0, duration - value);
        if (cachedElapsed != value / 1000) { cachedElapsed = value / 1000; elapsedText = clock(value); }
        if (cachedDuration != duration / 1000) { cachedDuration = duration / 1000; durationText = clock(duration); }
        if (cachedRemaining != left / 1000) { cachedRemaining = left / 1000; remainingText = "Temps restant : " + clock(left); }
        int progress = (int) Math.max(0, Math.min(1000, Math.round(pos * 1000.0 / duration)));
        setProgress(a, MINI, progress); setProgress(a, FULL, progress);
        text(a, ELAPSED, elapsedText); text(a, DURATION, durationText);
        View root = a.findViewById(0x7f09023a);
        View remaining = root == null ? null : root.findViewWithTag("nativePlayerRemaining");
        if (remaining instanceof TextView && !remainingText.contentEquals(((TextView) remaining).getText()))
            ((TextView) remaining).setText(remainingText);
    }
    private void setProgress(Activity a, int id, int p) {
        View v = a.findViewById(id);
        if (v instanceof ProgressBar) {
            ProgressBar bar = (ProgressBar) v;
            if (bar.getMax() != 1000) bar.setMax(1000);
            if (bar.getProgress() != p) bar.setProgress(p);
        }
    }
    public void activityResumed() { foreground = true; syncGlow(); }
    public void activityStopped() { foreground = false; stopGlow(0); stopGlow(1); }
    private void stopGlow(int index) {
        if (glow[index] != null) { glow[index].cancel(); glow[index] = null; }
        if (glowFill[index] != null) { glowFill[index].setAlpha(255); glowFill[index] = null; }
    }
    private void syncGlow() {
        Activity a = activity.get();
        boolean enabled = android.os.Build.VERSION.SDK_INT < 26 || ValueAnimator.areAnimatorsEnabled();
        double current = position(now());
        boolean show = a != null && foreground && enabled && valid && glowSampleValid &&
            haveReal && realPlaying && shownPlaying && !Double.isNaN(current) && current > 0 && current < duration;
        int[] ids = {MINI, FULL};
        for (int i = 0; i < ids.length; i++) {
            View view = a == null ? null : a.findViewById(ids[i]);
            Drawable fill = null;
            if (show && view instanceof ProgressBar && view.isShown()) {
                Drawable root = ((ProgressBar) view).getProgressDrawable();
                if (root instanceof LayerDrawable) {
                    root.mutate();
                    fill = ((LayerDrawable) root).findDrawableByLayerId(android.R.id.progress);
                }
            }
            if (fill == null) { stopGlow(i); continue; }
            if (fill == glowFill[i] && glow[i] != null && glow[i].isStarted()) continue;
            stopGlow(i);
            glowFill[i] = fill;
            ObjectAnimator pulse = ObjectAnimator.ofInt(fill, "alpha", 208, 255);
            pulse.setDuration(1600);
            pulse.setRepeatMode(ValueAnimator.REVERSE);
            pulse.setRepeatCount(ValueAnimator.INFINITE);
            glow[i] = pulse;
            pulse.start();
        }
    }
    private void renderButtons() {
        Activity a = activity.get(); if (a == null || !haveReal) return;
        int icon = shownPlaying ? PAUSE_ICON : PLAY_ICON;
        View mini = a.findViewById(MINI_BUTTON), full = a.findViewById(FULL_BUTTON);
        if (mini instanceof ImageView) ((ImageView) mini).setImageResource(icon);
        if (full instanceof ImageView) ((ImageView) full).setImageResource(icon);
    }
    private void scheduleFrame() {
        if (((valid && moving) || measureHomeFrame || measurePlaylistFrame) && !frameScheduled) { frameScheduled = true; Choreographer.getInstance().postFrameCallback(this); }
    }
    @Override public void doFrame(long frameTimeNanos) {
        frameScheduled = false;
        if (activity.get() == null) return;
        long t = now();
        if (measureHomeFrame && firstHomeFrameMs < 0 && firstCreateAt >= 0) {
            firstHomeFrameMs = Math.max(0, t - firstCreateAt);
            if (processStartAt >= 0 && processStartAt <= t) processHomeFrameMs = t - processStartAt;
        }
        if (measurePlaylistFrame && playlistStart >= 0) {
            playlistFrameMs = Math.max(0, t - playlistStart); playlistStart = -1; pendingPlaylist = "";
        }
        measureHomeFrame = measurePlaylistFrame = false;
        if (!valid) return;
        renderProgress();
        // Stop requesting frames once the last reliable sample is stale.
        if (moving && now() - anchor < MAX_STALE_MS && position(now()) < duration) scheduleFrame();
    }
    public void snapshot(String json) {
        try {
            JSONObject o = new JSONObject(json);
            long t = now();
            boolean real = o.optBoolean("playing", false);
            String uri = o.optString("previewTrackUri", "");
            long pos = o.optLong("previewPositionMs", -1), dur = o.optLong("previewDurationMs", -1);
            boolean snapshotValid = o.optBoolean("previewProgressValid", false) && dur > 0 && pos >= 0 && pos <= dur;
            glowSampleValid = snapshotValid;
            String source = o.optString("previewProgressSource", "none");
            String oldSource = progressSource;
            progressSource = source.equals("range") || source.equals("media") || source.equals("clock") ? source : "none";
            progressHasUri = !uri.isEmpty();
            double previous = position(t);
            // An anonymous sample can be shown but cannot establish track
            // continuity: never extrapolate it or inherit a previous track.
            String previousTrack = track;
            boolean changedTrack = uri.isEmpty() || !uri.equals(track);
            boolean freezePendingPause = pending && !pendingTarget && real && valid && !changedTrack && !Double.isNaN(previous);
            boolean advances = snapshotValid && !uri.isEmpty() && real && !freezePendingPause && o.optBoolean("previewAdvancing", false);
            boolean reset = !valid || !snapshotValid || changedTrack || !progressSource.equals(oldSource) || Double.isNaN(previous) ||
                Math.abs(previous - pos) > 2000 || !moving || !advances;
            if (snapshotValid) {
                duration = dur; anchor = t; track = uri;
                base = freezePendingPause ? Math.max(0, Math.min(dur, previous)) : (reset ? pos : Math.max(0, Math.min(dur, previous)));
                correction = reset || freezePendingPause ? 0 : pos - previous;
                moving = advances; valid = true;
                if (!uri.equals(previousTrack) || (uri.isEmpty() && previousPosition >= 0 && pos < previousPosition)) {
                    previousProgressAt = -1; previousPosition = -1;
                }
                if (real && previousPosition >= 0 && pos != previousPosition && previousProgressAt >= 0) {
                    intervals[intervalIndex] = t - previousProgressAt;
                    intervalIndex = (intervalIndex + 1) % intervals.length;
                    if (intervalCount < intervals.length) intervalCount++;
                }
                if (pos != previousPosition) { previousPosition = pos; previousProgressAt = t; }
            } else {
                // Keep a frozen last reliable value only when the same track is
                // positively identified. Unknown or different track must not
                // inherit another track's position.
                if (valid && !uri.isEmpty() && uri.equals(track) && !Double.isNaN(previous)) {
                    base = previous; anchor = t; correction = 0; moving = false;
                } else { valid = false; moving = false; track = uri; }
                previousProgressAt = -1; previousPosition = -1;
            }
            haveReal = true; realPlaying = real;
            if (pending && real == pendingTarget) { pending = false; serial++; }
            if (!pending) shownPlaying = real;
            renderProgress(); renderButtons(); syncGlow(); scheduleFrame();
            if (tapAt >= 0 && commandAt >= 0 && stateAt < 0 &&
                ((operation == 1 && real == pendingTarget) || (operation != 1 && !uri.isEmpty() && !uri.equals(trackBefore)))) {
                stateAt = t; uiAt = now();
            }
        } catch (Exception ignored) { valid = false; moving = false; glowSampleValid = false; renderProgress(); syncGlow(); }
    }
    public int tapPlayPause() {
        begin(1);
        if (!haveReal) return -1;
        long t = now();
        if (valid && shownPlaying) { base = position(t); anchor = t; moving = false; correction = 0; renderProgress(); }
        pendingTarget = !shownPlaying; pending = true; shownPlaying = pendingTarget;
        final long id = ++serial;
        renderButtons(); syncGlow(); optimisticAt = now();
        handler.postDelayed(new Runnable() { public void run() {
            if (pending && serial == id) {
                pending = false; shownPlaying = realPlaying; renderButtons(); syncGlow();
                Activity a = activity.get();
                if (a != null) Toast.makeText(a, "Commande non confirmée", Toast.LENGTH_SHORT).show();
            }
        }}, RECONCILE_MS);
        return pendingTarget ? 1 : 0;
    }
    public void begin(int kind) {
        tapAt = now(); commandAt = stateAt = optimisticAt = uiAt = -1;
        operation = kind; trackBefore = track;
    }
    public void command() { if (tapAt >= 0 && commandAt < 0) commandAt = now(); }
    public void attachAbout(View view) {
        view.setOnLongClickListener(new View.OnLongClickListener() {
            public boolean onLongClick(View v) { showDiagnostics(); return true; }
        });
    }
    private String delta(long value) { return value < 0 || tapAt < 0 ? "—" : Long.toString(value - tapAt) + " ms"; }
    private String report() {
        StringBuilder out = new StringBuilder("Diagnostic Preview (mesures locales)\n");
        out.append(tapAt < 0 ? "Appui : —\nCommande reçue du pont : " : "Appui : 0 ms\nCommande reçue du pont : ").append(delta(commandAt));
        out.append("\nInterface optimiste : ").append(delta(optimisticAt));
        out.append("\nÉtat du lecteur observé : ").append(delta(stateAt));
        out.append("\nInterface confirmée : ").append(delta(uiAt));
        out.append("\nDémarrage : processus → prochaine frame accueil avec données (Android 12+) : ")
            .append(processHomeFrameMs < 0 ? "—" : Long.toString(processHomeFrameMs) + " ms");
        out.append("\nDémarrage : activité → prochaine frame accueil avec données : ")
            .append(firstHomeFrameMs < 0 ? "—" : Long.toString(firstHomeFrameMs) + " ms");
        out.append("\nPlaylist : appui → prochaine frame avec titres : ")
            .append(playlistFrameMs < 0 ? "—" : Long.toString(playlistFrameMs) + " ms");
        out.append("\nSource position : ").append(progressSource);
        out.append(" ; identité de titre présente : ").append(progressHasUri ? "oui" : "non");
        out.append("\nIntervalles position : ");
        if (intervalCount == 0) out.append("—");
        for (int i = 0; i < intervalCount; i++) {
            if (i > 0) out.append(", ");
            int index = (intervalIndex - intervalCount + i + intervals.length) % intervals.length;
            out.append(intervals[index]).append(" ms");
        }
        out.append("\nMesures de préparation de frame, pas présentation écran. Démarrage hors lanceur ; premier son non mesuré. La réception du pont n'est pas un accusé Spotify.");
        return out.toString();
    }
    public void showDiagnostics() {
        final Activity a = activity.get(); if (a == null) return;
        final String report = report();
        new AlertDialog.Builder(a).setTitle("Diagnostic Preview").setMessage(report)
            .setPositiveButton("Copier", new DialogInterface.OnClickListener() {
                public void onClick(DialogInterface dialog, int which) {
                    Object service = a.getSystemService(Context.CLIPBOARD_SERVICE);
                    if (service instanceof ClipboardManager) ((ClipboardManager) service).setPrimaryClip(ClipData.newPlainText("Diagnostic Preview", report));
                }
            }).setNegativeButton("Fermer", null).show();
    }
}
