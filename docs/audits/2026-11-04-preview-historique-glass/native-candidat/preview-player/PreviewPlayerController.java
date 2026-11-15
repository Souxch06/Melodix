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
import android.view.MotionEvent;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.SeekBar;
import android.webkit.WebView;
import android.webkit.ValueCallback;
import android.widget.TextView;
import android.widget.Toast;
import org.json.JSONArray;
import org.json.JSONObject;
import java.lang.ref.WeakReference;
import java.util.Locale;

/** Preview-only display controller. No network access and no persistent data. */
public final class PreviewPlayerController implements Choreographer.FrameCallback, Runnable, SeekBar.OnSeekBarChangeListener, View.OnTouchListener {
    private static final int MINI = 0x7f09024d, FULL = 0x7f09023d;
    private static final int ELAPSED = 0x7f09024a, DURATION = 0x7f09024b;
    private static final int MINI_BUTTON = 0x7f090238, FULL_BUTTON = 0x7f09023e;
    private static final int PAUSE_ICON = 0x7f080121, PLAY_ICON = 0x7f080122;
    private static final long CORRECTION_MS = 4000;
    private static final long RECONCILE_MS = 8000;
    private final WeakReference<Activity> activity;
    private final Handler handler = new Handler(Looper.getMainLooper());
    private boolean valid, moving, frameScheduled, haveReal, realPlaying, shownPlaying, pending;
    private boolean pendingTarget;
    private WeakReference<WebView> seekWeb = new WeakReference<WebView>(null);
    private boolean dragging, seekPending;
    private long seekTarget, seekAt, seekSerial, seekFallbackAt, seekFallbackPosition;
    // Last eight gestures, in memory only. Times use Android's monotonic clock.
    // The baseline is a UI observation, not audio and not a Spotify ack.
    private final long[] seekDiagSeq = new long[8], seekDiagRelease = new long[8], seekDiagSubmit = new long[8],
        seekDiagCallback = new long[8], seekDiagDifferent = new long[8], seekDiagConfirm = new long[8],
        seekDiagAge = new long[8], seekDiagBaseline = new long[8];
    private final String[] seekDiagResult = new String[8], seekDiagOutcome = new String[8];
    private int seekDiagIndex = -1, seekDiagCount;
    private long seekDiagSequence, independentObservationAt = -1, independentObservation = -1;
    private void seekDiagFinish(String outcome) {
        if (seekDiagIndex >= 0 && seekDiagRelease[seekDiagIndex] >= 0 && seekDiagConfirm[seekDiagIndex] < 0)
            seekDiagOutcome[seekDiagIndex] = outcome;
    }
    public void attachSeek(WebView web) {
        seekWeb = new WeakReference<WebView>(web);
        Activity a = activity.get(); View v = a == null ? null : a.findViewById(FULL);
        if (v instanceof SeekBar) {
            ((SeekBar) v).setOnSeekBarChangeListener(this);
            v.setOnTouchListener(this);
        }
    }
    @Override public boolean onTouch(View v, MotionEvent event) {
        if (event.getActionMasked() == MotionEvent.ACTION_CANCEL && dragging) { dragging = false; renderProgress(); }
        return false; // SeekBar retains native tap, drag and out-of-bounds release handling.
    }
    private void cancelSeek() {
        if (seekPending) seekDiagFinish("annulé (identité changée ou invalide)");
        dragging = false; seekPending = false; seekSerial++;
    }
    @Override public void onStartTrackingTouch(SeekBar bar) {
        if (valid && tupleIdentity && duration > 0) {
            long t = now(); long shown = (long) positionUnderlying(t);
            if (seekPending) {
                seekDiagFinish("remplacé par un nouveau geste");
                seekPending = false; seekSerial++;
                base = Math.max(0, Math.min(duration, seekFallbackPosition + (playbackState.equals("playing") ? Math.max(0, t - seekFallbackAt) : 0)));
                anchor = t; correction = 0;
            }
            dragging = true; seekTarget = shown;
        }
    }
    @Override public void onProgressChanged(SeekBar bar, int progress, boolean fromUser) {
        if (!fromUser || !dragging || !valid) return;
        seekTarget = Math.max(0, Math.min(duration, Math.round(duration * Math.max(0, Math.min(1000, progress)) / 1000.0)));
        renderProgress();
    }
    @Override public void onStopTrackingTouch(SeekBar bar) {
        if (!dragging) { renderProgress(); return; }
        dragging = false;
        if (!valid || !tupleIdentity) { renderProgress(); return; }
        long t = now();
        seekDiagIndex = (seekDiagIndex + 1) % seekDiagSeq.length;
        if (seekDiagCount < seekDiagSeq.length) seekDiagCount++;
        final int diag = seekDiagIndex; final long diagId = ++seekDiagSequence;
        seekDiagSeq[diag] = diagId; seekDiagRelease[diag] = t;
        seekDiagSubmit[diag] = seekDiagCallback[diag] = seekDiagDifferent[diag] = seekDiagConfirm[diag] = -1;
        seekDiagAge[diag] = independentObservationAt < 0 ? -1 : Math.max(0, t - independentObservationAt);
        seekDiagBaseline[diag] = independentObservation;
        seekDiagResult[diag] = "en attente"; seekDiagOutcome[diag] = "en attente";
        seekFallbackPosition = (long) positionUnderlying(t); seekFallbackAt = t;
        seekAt = t; seekPending = true; final long id = ++seekSerial;
        base = seekTarget; anchor = t; correction = 0;
        moving = playbackState.equals("playing");
        renderProgress(); scheduleFrame();
        WebView w = seekWeb.get();
        if (w != null) {
            String js = "window.__sfPreviewSeek&&window.__sfPreviewSeek(" + seekTarget + "," +
                JSONObject.quote(identityTitle) + "," + JSONObject.quote(identityArtist) + "," + duration + "," + JSONObject.quote(track) + ");";
            seekDiagSubmit[diag] = now();
            w.evaluateJavascript(js, new ValueCallback<String>() {
                public void onReceiveValue(String result) {
                    if (seekDiagSeq[diag] != diagId) return;
                    seekDiagCallback[diag] = now();
                    seekDiagResult[diag] = "true".equals(result) ? "action invoquée" :
                        ("false".equals(result) ? "action refusée" : "résultat indisponible");
                }
            });
        } else seekDiagResult[diag] = "WebView indisponible";
        handler.postDelayed(new Runnable() { public void run() {
            if (!seekPending || id != seekSerial) return;
            long at = now(); seekPending = false;
            seekDiagFinish("non confirmée après 5 s");
            base = Math.max(0, Math.min(duration, seekFallbackPosition + (playbackState.equals("playing") ? Math.max(0, at - seekFallbackAt) : 0)));
            anchor = at; correction = 0; moving = playbackState.equals("playing") && tupleIdentity;
            renderProgress(); scheduleFrame();
            Activity a = activity.get(); if (a != null) Toast.makeText(a, "Réessayer", Toast.LENGTH_SHORT).show();
        }}, 5000);
    }
    private long serial, anchor, duration;
    private long cachedElapsed = -1, cachedDuration = -1, cachedRemaining = -1;
    private String elapsedText = "—", durationText = "—", remainingText = "Temps restant : —";
    private double base, correction;
    private String track = "";
    private String progressSource = "none";
    // Private, process-local metadata used solely to avoid retaining a clock
    // when the legacy player feed reports a different visible title.
    private boolean tupleIdentity, traceScheduled;
    private String identityTitle = "", identityArtist = "", playbackState = "unknown";
    private long identityDuration = -1, measurementAt = -1, measurementPosition = -1;
    private final String[] trace = new String[120];
    private int traceCount, traceIndex;
    private long traceStart = -1;
    // Cosmetic only: animate the clipped fill, never the position or track.
    private boolean foreground, glowSampleValid;
    private final ObjectAnimator[] glow = new ObjectAnimator[2];
    private final Drawable[] glowFill = new Drawable[2];
    // Diagnostic measurements contain only monotonic time differences.
    private long tapAt = -1, commandAt = -1, stateAt = -1, optimisticAt = -1, uiAt = -1;
    private final long[] intervals = new long[60];
    private int intervalCount, intervalIndex;
    private int operation; // 1 play/pause, 2 previous, 3 next
    private String trackBefore = "";
    // Durations only; process-local, no Spotify identifiers in the report.
    private static long firstCreateAt = -1, processStartAt = -1, firstHomeFrameMs = -1, processHomeFrameMs = -1;
    // Only a small allowlist; no token, title, playlist ID or URL is retained.
    private String loadStage = "—", stageAtRows = "—";
    private boolean staleWaitingObserved, likedCollection;
    public void loadState(String state) {
        if (state == null || !state.matches("(waiting-bridge|waiting-token|pending|failed|no-data|data|timeout|unavailable):(token|no-token|unknown)")) return;
        if (rowsAt >= 0) {
            if (state.startsWith("waiting-bridge")) staleWaitingObserved = true;
            loadStage = "data:unknown"; return;
        }
        loadStage = state;
    }
    private boolean measureHomeFrame, measurePlaylistFrame;
    private long playlistStart = -1, playlistFrameMs = -1;
    private long bridgeAt = -1, navigationAt = -1, pageReadyAt = -1, receivedAt = -1, rowsAt = -1, frameAt = -1;
    private String likedObservation = "non observée";
    public void phase(String event) {
        if (playlistStart < 0 || event == null) return;
        long t = now();
        if (event.equals("rows-received") && receivedAt < 0) receivedAt = t;
        else if (event.equals("liked-route-other")) likedObservation = "page différente";
        else if (event.equals("liked-dom-empty")) likedObservation = "page likés vue, aucune ligne DOM observée";
        else if (event.equals("liked-dom-rows")) likedObservation = "page likés vue, lignes DOM présentes";
        else if (event.equals("bridge-ready") && bridgeAt < 0) bridgeAt = t;
        else if (event.equals("navigation") && navigationAt < 0) navigationAt = t;
        else if (event.startsWith("page-ready|") && navigationAt >= 0 && pageReadyAt < 0 &&
                 event.substring("page-ready|".length()).equals(pendingPlaylist)) pageReadyAt = t;
    }
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
        playlistStart = -1; playlistFrameMs = -1; pendingPlaylist = ""; measurePlaylistFrame = false; loadStage = "—";
        bridgeAt = navigationAt = pageReadyAt = receivedAt = rowsAt = frameAt = -1; stageAtRows = "—"; likedObservation = "non observée"; staleWaitingObserved = false;
        likedCollection = "spotify:collection:tracks".equals(uri);
        if (uri != null && (uri.matches("(?i)^spotify:playlist:[a-z0-9]+$") || uri.equals("spotify:collection:tracks"))) {
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
                        if (rowsAt < 0) { rowsAt = now(); stageAtRows = loadStage; }
                        loadStage = "data:unknown";
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
        return dragging && valid ? seekTarget : positionUnderlying(t);
    }
    private double positionUnderlying(long t) {
        if (!valid) return Double.NaN;
        long elapsed = Math.max(0, t - anchor);
        long motion = moving ? elapsed : 0;
        // A large negative correction must not make the visible clock run
        // backwards while playing. Spread it over a sufficiently long period.
        double window = Math.max((double) CORRECTION_MS, Math.max(0, -correction) * 1.25);
        double adjust = correction * Math.min(1.0, (double) elapsed / window);
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
    public void activityResumed() { foreground = true; syncGlow(); scheduleTrace(); }
    private void scheduleTrace() {
        if (foreground && !traceScheduled) { traceScheduled = true; handler.postDelayed(this, 1000); }
    }
    @Override public void run() {
        traceScheduled = false;
        if (!foreground || activity.get() == null) return;
        long t = now();
        if (traceStart < 0) traceStart = t;
        String age = measurementAt < 0 ? "—" : Long.toString(Math.max(0, t - measurementAt)) + " ms";
        trace[traceIndex] = "+" + ((t - traceStart) / 1000) + " s : identité=" +
            (tupleIdentity ? "oui" : "non") + ", état=" + playbackState +
            ", mesure=" + age + ", " + progressStopReason();
        traceIndex = (traceIndex + 1) % trace.length;
        if (traceCount < trace.length) traceCount++;
        scheduleTrace();
    }
    public void activityStopped() { dragging = false; foreground = false; stopGlow(0); stopGlow(1); }
    private void stopGlow(int index) {
        if (glow[index] != null) { glow[index].cancel(); glow[index] = null; }
        if (glowFill[index] != null) { glowFill[index].setAlpha(255); glowFill[index] = null; }
    }
    private void syncGlow() {
        Activity a = activity.get();
        boolean enabled = android.os.Build.VERSION.SDK_INT < 26 || ValueAnimator.areAnimatorsEnabled();
        double current = position(now());
        boolean show = a != null && foreground && enabled && valid && glowSampleValid &&
            haveReal && realPlaying && shownPlaying && moving && !Double.isNaN(current) && current > 0 && current < duration;
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
            ObjectAnimator pulse = ObjectAnimator.ofInt(fill, "alpha", 150, 255);
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
    private boolean correctionInProgress(long t) {
        double window = Math.max((double) CORRECTION_MS, Math.max(0, -correction) * 1.25);
        return correction != 0 && t - anchor < window;
    }
    private void scheduleFrame() {
        if (((valid && (moving || correctionInProgress(now()))) || measureHomeFrame || measurePlaylistFrame) && !frameScheduled) { frameScheduled = true; Choreographer.getInstance().postFrameCallback(this); }
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
            playlistFrameMs = Math.max(0, t - playlistStart); if (frameAt < 0) frameAt = t;
        }
        measureHomeFrame = measurePlaylistFrame = false;
        if (!valid) return;
        renderProgress();
        if ((moving && position(now()) < duration) || correctionInProgress(now())) scheduleFrame();
    }
    private static boolean realMetadata(String s) {
        return s != null && !s.trim().isEmpty() && !s.equalsIgnoreCase("No Track") &&
            !s.equalsIgnoreCase("No Artist") && !s.equalsIgnoreCase("Aucun titre") &&
            !s.equalsIgnoreCase("Lecture arrêtée") && !s.equalsIgnoreCase("Aucune lecture en cours");
    }
    public void snapshot(String json) {
        try {
            JSONObject o = new JSONObject(json);
            long t = now();
            if (!o.has("previewProgressValid")) {
                // Legacy callbacks can overwrite native views and report a
                // misleading false state. They may invalidate an identity,
                // but cannot assert pause over the explicit tri-state feed.
                String title = o.optString("track", ""), artist = o.optString("artist", "");
                if (tupleIdentity && (!identityTitle.equals(title) || !identityArtist.equals(artist))) {
                    cancelSeek(); valid = false; moving = false; tupleIdentity = false; glowSampleValid = false;
                    measurementAt = measurementPosition = -1;
                }
                renderProgress(); renderButtons(); syncGlow();
                return;
            }
            String title = o.optString("track", ""), artist = o.optString("artist", "");
            String uri = o.optString("previewTrackUri", "");
            long pos = o.optLong("previewPositionMs", -1), dur = o.optLong("previewDurationMs", -1);
            String state = o.optString("previewPlaybackState", o.optBoolean("playing", false) ? "playing" : "paused");
            if (!state.equals("playing") && !state.equals("paused")) state = "unknown";
            boolean real = state.equals("playing");
            boolean snapshotValid = o.optBoolean("previewProgressValid", false) && dur > 0 && pos >= 0 && pos <= dur;
            boolean identified = realMetadata(title) && realMetadata(artist) && dur > 0;
            boolean changed = !identified || !tupleIdentity || !identityTitle.equals(title) ||
                !identityArtist.equals(artist) || identityDuration != dur ||
                (!track.isEmpty() && !uri.isEmpty() && !track.equals(uri));
            double previous = positionUnderlying(t);
            boolean backward = !changed && snapshotValid && measurementPosition >= 0 && pos < measurementPosition - 2000;
            boolean changedMeasure = snapshotValid && (changed || backward || measurementPosition < 0 || pos != measurementPosition);
            boolean freezePendingPause = pending && !pendingTarget && real && valid && !changed;
            boolean wasMoving = moving;
            progressSource = o.optString("previewProgressSource", "none");
            if (!progressSource.equals("range") && !progressSource.equals("media") && !progressSource.equals("clock")) progressSource = "none";
            glowSampleValid = snapshotValid;
            tupleIdentity = identified;
            if (changed) {
                cancelSeek(); independentObservationAt = independentObservation = -1;
                valid = false; moving = false; previous = Double.NaN;
                measurementAt = measurementPosition = -1;
            }
            identityTitle = identified ? title : ""; identityArtist = identified ? artist : "";
            identityDuration = identified ? dur : -1;
            if (!uri.isEmpty() || changed) track = uri;
            // Do not use previewPositionMs: actSeek itself writes its range property.
            // These are received UI samples, which may already be stale in Spotify.
            long observed = o.optLong("previewConfirmPositionMs", -1);
            if (identified && observed >= 0 && observed <= dur) {
                if (seekPending && !changed && seekDiagIndex >= 0 && seekDiagBaseline[seekDiagIndex] >= 0 &&
                    seekDiagDifferent[seekDiagIndex] < 0 && observed != seekDiagBaseline[seekDiagIndex])
                    seekDiagDifferent[seekDiagIndex] = t;
                independentObservation = observed; independentObservationAt = t;
            }
            boolean seekConfirmed = false;
            if (seekPending && !changed) {
                long confirm = observed;
                long elapsed = real ? Math.max(0, t - seekAt) : 0;
                long expected = Math.min(dur, seekTarget + elapsed);
                if (confirm >= 0 && confirm <= dur) {
                    seekFallbackPosition = confirm; seekFallbackAt = t;
                }
                if (confirm < 0 || Math.abs(confirm - expected) > 2500) {
                    if (moving && !real) { base = positionUnderlying(t); anchor = t; correction = 0; }
                    moving = real; playbackState = state; haveReal = true;
                    if (!state.equals("unknown")) { realPlaying = real; if (!pending) shownPlaying = real; }
                    renderProgress(); renderButtons(); syncGlow(); scheduleFrame(); return;
                }
                // A clock separate from the written range has reached the
                // target. Smoothly reconcile from the optimistic display.
                if (seekDiagIndex >= 0) { seekDiagConfirm[seekDiagIndex] = t; seekDiagOutcome[seekDiagIndex] = "position UI proche de la cible"; }
                seekPending = false; seekSerial++; seekConfirmed = true; pos = confirm;
                snapshotValid = true; backward = false; changedMeasure = true;
                measurementPosition = measurementAt = -1;
            }
            if (snapshotValid) {
                duration = dur;
                if (!valid || changed || backward || Double.isNaN(previous)) {
                    base = pos; anchor = t; correction = 0;
                } else if (seekConfirmed && !real) {
                    base = Math.max(0, Math.min(dur, previous)); anchor = t; correction = pos - previous;
                } else if (changedMeasure && !real && !freezePendingPause) {
                    base = pos; anchor = t; correction = 0;
                } else if (changedMeasure && !freezePendingPause) {
                    base = Math.max(0, Math.min(dur, previous)); anchor = t; correction = pos - previous;
                } else if ((wasMoving && (!real || freezePendingPause)) || (!wasMoving && real)) {
                    base = Math.max(0, Math.min(dur, previous)); anchor = t; correction = 0;
                }
                if (changedMeasure) {
                    if (measurementAt >= 0 && measurementPosition >= 0 && real) {
                        intervals[intervalIndex] = t - measurementAt;
                        intervalIndex = (intervalIndex + 1) % intervals.length;
                        if (intervalCount < intervals.length) intervalCount++;
                    }
                    measurementAt = t; measurementPosition = pos;
                }
                valid = true;
                moving = identified && real && !freezePendingPause;
            } else if (valid && !changed && identified && !Double.isNaN(previous)) {
                if (!real || freezePendingPause) { base = previous; anchor = t; correction = 0; }
                moving = real && !freezePendingPause;
            } else { valid = false; moving = false; }
            playbackState = state; haveReal = true;
            if (!state.equals("unknown")) {
                realPlaying = real;
                if (pending && real == pendingTarget) { pending = false; serial++; }
                if (!pending) shownPlaying = real;
            }
            renderProgress(); renderButtons(); syncGlow(); scheduleFrame();
            if (tapAt >= 0 && commandAt >= 0 && stateAt < 0 &&
                ((operation == 1 && !state.equals("unknown") && real == pendingTarget) ||
                 (operation != 1 && !uri.isEmpty() && !uri.equals(trackBefore)))) {
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
    private String progressStopReason() {
        if (!haveReal) return "état du lecteur indisponible";
        if (pending && !pendingTarget) return "pause demandée";
        if (playbackState.equals("unknown")) return "état indéterminé, aucun signal audio fiable";
        if (playbackState.equals("paused")) return "lecture en pause";
        if (!tupleIdentity) return "identité titre/artiste/durée absente";
        if (!valid) return "position ou durée indisponible";
        if (!moving) return "mouvement arrêté";
        if (position(now()) >= duration) return "fin du titre";
        return "animation active";
    }
    private String phaseDuration(long from, long to) {
        return from < 0 || to < from ? "—" : Long.toString(to - from) + " ms";
    }
    private String dominantPhase() {
        // Missing branches are not zero duration and cannot be compared.
        if (playlistStart < 0 || bridgeAt < 0 || receivedAt < 0 || rowsAt < 0 || frameAt < 0 ||
            bridgeAt > receivedAt || (navigationAt >= 0 && (pageReadyAt < 0 || pageReadyAt > receivedAt))) return "indéterminée (phases manquantes ou non séquentielles)";
        long[] spans = {bridgeAt - playlistStart, navigationAt >= 0 ? pageReadyAt - navigationAt : -1,
            receivedAt - (pageReadyAt >= 0 ? pageReadyAt : bridgeAt), rowsAt - receivedAt, frameAt - rowsAt};
        String[] labels = {"attente pont", "navigation → page prête", "page/pont → lignes reçues", "réception → rendu natif", "rendu → frame"};
        long max = -1; String result = "indéterminée";
        for (int i=0; i<spans.length; i++) if (spans[i] >= 0 && spans[i] > max) { max=spans[i]; result=labels[i]; }
        return result + " (phases observées uniquement)";
    }
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
        out.append("\nChargement playlist (état local, sans identifiant) : ").append(loadStage);
        out.append("\nSource position : ").append(progressSource);
        out.append(" ; identité de titre présente : ").append(tupleIdentity ? "oui" : "non");
        out.append("\nAnimation barre : ").append(progressStopReason());
        out.append("\nIdentité titre/artiste/durée : ").append(tupleIdentity ? "oui" : "non");
        out.append(" ; état : ").append(playbackState);
        out.append(" ; âge de la mesure : ").append(measurementAt < 0 ? "—" : Long.toString(Math.max(0, now() - measurementAt)) + " ms");
        out.append("\nPlaylist — attente pont : ").append(phaseDuration(playlistStart, bridgeAt));
        out.append(" ; navigation → page prête : ").append(phaseDuration(navigationAt, pageReadyAt));
        out.append(" ; page prête/pont → lignes reçues : ").append(phaseDuration(pageReadyAt >= 0 ? pageReadyAt : bridgeAt, receivedAt));
        out.append(" ; réception → rendu natif : ").append(phaseDuration(receivedAt, rowsAt));
        out.append(" ; rendu → frame préparée : ").append(phaseDuration(rowsAt, frameAt));
        if (likedCollection) out.append("\nLikés : ").append(likedObservation)
            .append(" ; rendu natif : ").append(rowsAt < 0 ? "non observé" : "lignes visibles");
        out.append("\nPhase dominante : ").append(dominantPhase());
        out.append(" ; waiting-bridge avec lignes : ").append(rowsAt < 0 ? "indéterminé" : ((stageAtRows.startsWith("waiting-bridge") || staleWaitingObserved) ? "oui (corrigé à la réception)" : "non"));
        out.append("\nSeek — 8 derniers gestes (durées depuis le relâchement) :");
        if (seekDiagCount == 0) out.append(" aucun");
        for (int i = 0; i < seekDiagCount; i++) {
            int n = (seekDiagIndex - seekDiagCount + 1 + i + seekDiagSeq.length) % seekDiagSeq.length;
            out.append("\n#").append(seekDiagSeq[n]).append(" relâchement : 0 ms ; envoi WebView : ")
                .append(phaseDuration(seekDiagRelease[n], seekDiagSubmit[n]));
            out.append(" ; fin JS : ").append(phaseDuration(seekDiagRelease[n], seekDiagCallback[n]))
                .append(" (").append(seekDiagResult[n]).append(")");
            out.append(" ; première position UI différente : ").append(phaseDuration(seekDiagRelease[n], seekDiagDifferent[n]));
            out.append(" ; position UI confirmée : ").append(phaseDuration(seekDiagRelease[n], seekDiagConfirm[n]))
                .append(" (").append(seekDiagOutcome[n]).append(")");
            out.append(" ; âge dernière observation reçue au relâchement : ")
                .append(seekDiagAge[n] < 0 ? "—" : Long.toString(seekDiagAge[n]) + " ms");
        }
        out.append("\nSeek : observation UI périodique (~1 s), potentiellement déjà périmée ; un changement peut être la progression normale. Fin JS ≠ accusé Spotify ; position UI ≠ son. Délai Spotify/audio non isolable ici.");
        out.append("\nIntervalles position : ");
        if (intervalCount == 0) out.append("—");
        for (int i = 0; i < intervalCount; i++) {
            if (i > 0) out.append(", ");
            int index = (intervalIndex - intervalCount + i + intervals.length) % intervals.length;
            out.append(intervals[index]).append(" ms");
        }
        out.append("\nHistorique (120 dernières secondes au premier plan) :");
        for (int i = 0; i < traceCount; i++) {
            int index = (traceIndex - traceCount + i + trace.length) % trace.length;
            out.append("\n").append(trace[index]);
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
