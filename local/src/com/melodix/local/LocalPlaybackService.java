package com.melodix.local;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.app.Service;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.media.AudioAttributes;
import android.media.AudioFocusRequest;
import android.media.AudioManager;
import android.media.MediaMetadata;
import android.media.MediaMetadataRetriever;
import android.media.MediaPlayer;
import android.media.session.MediaSession;
import android.media.session.PlaybackState;
import android.net.Uri;
import android.os.Binder;
import android.os.Build;
import android.os.IBinder;
import android.provider.OpenableColumns;

/** A local-only playback service in the isolated preview process. */
public final class LocalPlaybackService extends Service {
    public static final String SELECT = "com.melodix.local.SELECT";
    private static final String TOGGLE = "com.melodix.local.TOGGLE";
    private static final String STOP = "com.melodix.local.STOP";
    private static final String CHANNEL = "melodix_local_playback";
    private static final int NOTIFICATION = 27181;
    private final IBinder binder = new LocalBinder();
    private MediaPlayer player;
    private MediaSession session;
    private AudioManager audio;
    private AudioFocusRequest focusRequest;
    private boolean hasFocus, preparing, playing, resumeOnGain, foreground;
    private int duration;
    private String title = "Aucun fichier choisi", artist = "Artiste inconnu", error = "";
    private Bitmap artwork;

    public final class LocalBinder extends Binder {
        public LocalPlaybackService service() { return LocalPlaybackService.this; }
    }
    public String title() { return title; }
    public String artist() { return artist; }
    public String error() { return error; }
    public Bitmap artwork() { return artwork; }
    public boolean playing() { return playing; }
    public boolean preparing() { return preparing; }
    public boolean hasTrack() { return player != null; }
    public int duration() { return duration; }
    public int position() {
        try { return player == null || preparing ? 0 : Math.max(0, player.getCurrentPosition()); }
        catch (IllegalStateException ex) { return 0; }
    }

    private final AudioManager.OnAudioFocusChangeListener focusListener = change -> {
        if (change == AudioManager.AUDIOFOCUS_GAIN) {
            hasFocus = true;
            if (resumeOnGain) { resumeOnGain = false; startPlayback(); }
        } else if (change == AudioManager.AUDIOFOCUS_LOSS_TRANSIENT ||
                   change == AudioManager.AUDIOFOCUS_LOSS_TRANSIENT_CAN_DUCK) {
            boolean wasPlaying = playing;
            pausePlayback(false);
            resumeOnGain = wasPlaying;
        } else if (change == AudioManager.AUDIOFOCUS_LOSS) {
            hasFocus = false; resumeOnGain = false; pausePlayback(false);
        }
    };
    private final BroadcastReceiver noisy = new BroadcastReceiver() {
        @Override public void onReceive(Context c, Intent intent) {
            if (AudioManager.ACTION_AUDIO_BECOMING_NOISY.equals(intent.getAction())) pausePlayback(true);
        }
    };

    @Override public void onCreate() {
        super.onCreate();
        audio = (AudioManager) getSystemService(AUDIO_SERVICE);
        if (Build.VERSION.SDK_INT >= 26) {
            AudioAttributes attrs = new AudioAttributes.Builder().setUsage(AudioAttributes.USAGE_MEDIA)
                    .setContentType(AudioAttributes.CONTENT_TYPE_MUSIC).build();
            focusRequest = new AudioFocusRequest.Builder(AudioManager.AUDIOFOCUS_GAIN)
                    .setAudioAttributes(attrs).setOnAudioFocusChangeListener(focusListener)
                    .setWillPauseWhenDucked(true).build();
            NotificationChannel channel = new NotificationChannel(CHANNEL, "Lecture locale", NotificationManager.IMPORTANCE_LOW);
            ((NotificationManager)getSystemService(NOTIFICATION_SERVICE)).createNotificationChannel(channel);
        }
        session = new MediaSession(this, "Melodix local");
        session.setCallback(new MediaSession.Callback() {
            @Override public void onPlay() { startPlayback(); }
            @Override public void onPause() { pausePlayback(true); }
            @Override public void onStop() { stopPlayback(); }
        });
        session.setActive(false);
        IntentFilter filter = new IntentFilter(AudioManager.ACTION_AUDIO_BECOMING_NOISY);
        if (Build.VERSION.SDK_INT >= 33) registerReceiver(noisy, filter, Context.RECEIVER_NOT_EXPORTED);
        else registerReceiver(noisy, filter);
        updateSession();
    }
    @Override public IBinder onBind(Intent intent) { return binder; }
    @Override public int onStartCommand(Intent intent, int flags, int startId) {
        if (intent == null) { stopSelf(); return START_NOT_STICKY; }
        String action = intent.getAction();
        if (SELECT.equals(action)) {
            // Promote immediately, before metadata or asynchronous preparation.
            startForeground(NOTIFICATION, notification()); foreground = true;
            select(intent.getData());
        } else if (TOGGLE.equals(action)) {
            if (playing) pausePlayback(true); else startPlayback();
        } else if (STOP.equals(action)) stopPlayback();
        return START_NOT_STICKY;
    }
    private void select(Uri uri) {
        releasePlayer(); abandonFocus(); resumeOnGain = false; error = "";
        title = "Fichier audio"; artist = "Artiste inconnu"; duration = 0; artwork = null;
        if (uri == null || !"content".equals(uri.getScheme())) { fail("Fichier inaccessible. Choisissez un fichier audio."); return; }
        try (Cursor c = getContentResolver().query(uri, new String[]{OpenableColumns.DISPLAY_NAME}, null, null, null)) {
            if (c != null && c.moveToFirst() && !c.isNull(0)) title = c.getString(0);
        } catch (Exception ignored) { /* a provider need not expose a display name */ }
        MediaMetadataRetriever metadata = new MediaMetadataRetriever();
        try {
            metadata.setDataSource(this, uri);
            String t = metadata.extractMetadata(MediaMetadataRetriever.METADATA_KEY_TITLE);
            String a = metadata.extractMetadata(MediaMetadataRetriever.METADATA_KEY_ARTIST);
            if (t != null && !t.trim().isEmpty()) title = t;
            if (a != null && !a.trim().isEmpty()) artist = a;
            byte[] bytes = metadata.getEmbeddedPicture();
            if (bytes != null && bytes.length <= 4 * 1024 * 1024) {
                BitmapFactory.Options bounds = new BitmapFactory.Options(); bounds.inJustDecodeBounds = true;
                BitmapFactory.decodeByteArray(bytes, 0, bytes.length, bounds);
                int sample = 1; while (bounds.outWidth / sample > 512 || bounds.outHeight / sample > 512) sample *= 2;
                BitmapFactory.Options options = new BitmapFactory.Options(); options.inSampleSize = sample;
                artwork = BitmapFactory.decodeByteArray(bytes, 0, bytes.length, options);
            }
        } catch (Exception ignored) { /* metadata is optional */ }
        finally { try { metadata.release(); } catch (Exception ignored) {} }
        try {
            player = new MediaPlayer();
            player.setAudioAttributes(new AudioAttributes.Builder().setUsage(AudioAttributes.USAGE_MEDIA)
                    .setContentType(AudioAttributes.CONTENT_TYPE_MUSIC).build());
            player.setDataSource(this, uri);
            preparing = true;
            player.setOnPreparedListener(mp -> {
                if (mp != player) return;
                preparing = false; duration = Math.max(0, mp.getDuration()); startPlayback();
            });
            player.setOnCompletionListener(mp -> { playing = false; resumeOnGain = false; abandonFocus(); update(); });
            player.setOnErrorListener((mp, what, extra) -> { fail("Lecture impossible pour ce fichier audio."); return true; });
            player.prepareAsync(); update();
        } catch (Exception ex) { fail("Fichier audio inaccessible ou format non pris en charge."); }
    }
    private boolean requestFocus() {
        if (hasFocus) return true;
        int result;
        if (Build.VERSION.SDK_INT >= 26) result = audio.requestAudioFocus(focusRequest);
        else result = audio.requestAudioFocus(focusListener, AudioManager.STREAM_MUSIC, AudioManager.AUDIOFOCUS_GAIN);
        hasFocus = result == AudioManager.AUDIOFOCUS_REQUEST_GRANTED;
        return hasFocus;
    }
    private void abandonFocus() {
        if (!hasFocus) return;
        if (Build.VERSION.SDK_INT >= 26) audio.abandonAudioFocusRequest(focusRequest);
        else audio.abandonAudioFocus(focusListener);
        hasFocus = false;
    }
    public void toggle() { if (playing) pausePlayback(true); else startPlayback(); }
    private void startPlayback() {
        if (player == null || preparing || playing) return;
        resumeOnGain = false;
        if (!requestFocus()) { error = "Lecture en attente : une autre application utilise le son."; update(); return; }
        try { player.start(); playing = true; error = ""; update(); }
        catch (IllegalStateException ex) { fail("Lecture impossible pour ce fichier audio."); }
    }
    private void pausePlayback(boolean user) {
        if (user) resumeOnGain = false;
        if (playing && player != null) {
            try { player.pause(); } catch (IllegalStateException ignored) {}
            playing = false;
        }
        if (user) abandonFocus();
        update();
    }
    private void releasePlayer() {
        playing = false; preparing = false;
        if (player != null) { player.reset(); player.release(); player = null; }
    }
    private void fail(String message) {
        releasePlayer(); abandonFocus(); resumeOnGain = false; error = message;
        update();
        if (foreground) { stopForeground(true); foreground = false; }
        stopSelf();
    }
    public void stopPlayback() {
        releasePlayer(); abandonFocus(); resumeOnGain = false; duration = 0; artwork = null;
        title = "Aucun fichier choisi"; artist = "Artiste inconnu"; error = "";
        updateSession();
        if (foreground) { stopForeground(true); foreground = false; }
        stopSelf();
    }
    private void update() {
        updateSession();
        if (foreground) ((NotificationManager)getSystemService(NOTIFICATION_SERVICE)).notify(NOTIFICATION, notification());
    }
    private void updateSession() {
        if (session == null) return;
        MediaMetadata.Builder meta = new MediaMetadata.Builder().putString(MediaMetadata.METADATA_KEY_TITLE, title)
                .putString(MediaMetadata.METADATA_KEY_ARTIST, artist).putLong(MediaMetadata.METADATA_KEY_DURATION, duration);
        if (artwork != null) meta.putBitmap(MediaMetadata.METADATA_KEY_ALBUM_ART, artwork);
        session.setActive(player != null);
        session.setMetadata(meta.build());
        long actions = PlaybackState.ACTION_PLAY | PlaybackState.ACTION_PAUSE | PlaybackState.ACTION_PLAY_PAUSE | PlaybackState.ACTION_STOP;
        int state = playing ? PlaybackState.STATE_PLAYING : player == null ? PlaybackState.STATE_STOPPED : PlaybackState.STATE_PAUSED;
        session.setPlaybackState(new PlaybackState.Builder().setActions(actions).setState(state, position(), playing ? 1f : 0f).build());
    }
    private PendingIntent serviceAction(String action, int request) {
        return PendingIntent.getService(this, request, new Intent(this, LocalPlaybackService.class).setAction(action),
                PendingIntent.FLAG_UPDATE_CURRENT | PendingIntent.FLAG_IMMUTABLE);
    }
    private Notification notification() {
        Intent open = new Intent(this, LocalMusicActivity.class);
        PendingIntent content = PendingIntent.getActivity(this, 0, open, PendingIntent.FLAG_UPDATE_CURRENT | PendingIntent.FLAG_IMMUTABLE);
        Notification.Builder b = Build.VERSION.SDK_INT >= 26 ? new Notification.Builder(this, CHANNEL) : new Notification.Builder(this);
        int icon = getResources().getIdentifier("logo_melodix", "drawable", getPackageName());
        if (icon == 0) icon = android.R.drawable.ic_media_play;
        b.setSmallIcon(icon).setContentTitle(title).setContentText(artist).setContentIntent(content)
                .setOnlyAlertOnce(true).setOngoing(playing || preparing)
                .setVisibility(Notification.VISIBILITY_PRIVATE)
                .addAction(playing ? android.R.drawable.ic_media_pause : android.R.drawable.ic_media_play,
                        playing ? "Pause" : "Lecture", serviceAction(TOGGLE, 1))
                .addAction(android.R.drawable.ic_menu_close_clear_cancel, "Arrêter", serviceAction(STOP, 2));
        if (artwork != null) b.setLargeIcon(artwork);
        b.setStyle(new Notification.MediaStyle().setMediaSession(session.getSessionToken()).setShowActionsInCompactView(0, 1));
        return b.build();
    }
    @Override public void onDestroy() {
        releasePlayer(); abandonFocus(); unregisterReceiver(noisy);
        if (session != null) { session.setActive(false); session.release(); }
        super.onDestroy();
    }
}
