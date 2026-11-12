package com.melodix.local;

import android.Manifest;
import android.app.Activity;
import android.content.ComponentName;
import android.content.Intent;
import android.content.ServiceConnection;
import android.content.pm.PackageManager;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.graphics.Typeface;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.view.Gravity;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.TextView;

/** One chosen audio file, using the same native shell and player as the demo. */
public final class LocalMusicActivity extends Activity {
    private static final int PICK_AUDIO = 408, NOTIFICATIONS = 409;
    private final Handler handler = new Handler();
    private LocalPlaybackService service;
    private boolean bound, expanded, askedNotifications;
    private TextView state;
    private String uiError = "";
    private int dp(int n) { return (int)(n * getResources().getDisplayMetrics().density + .5f); }
    private int resource(String name, String kind) { return getResources().getIdentifier(name, kind, getPackageName()); }
    private View v(String name) { return findViewById(resource(name, "id")); }
    private void show(String name, boolean visible) { View view=v(name); if (view != null) view.setVisibility(visible ? View.VISIBLE : View.GONE); }
    private void text(String name, String value) { View view=v(name); if (view instanceof TextView) ((TextView)view).setText(value); }
    private final ServiceConnection connection = new ServiceConnection() {
        @Override public void onServiceConnected(ComponentName n, IBinder binder) {
            service = ((LocalPlaybackService.LocalBinder)binder).service(); refresh();
        }
        @Override public void onServiceDisconnected(ComponentName n) { service = null; refresh(); }
    };
    private final Runnable tick = new Runnable() {
        @Override public void run() { refresh(); handler.postDelayed(this, 500); }
    };

    @Override public void onCreate(Bundle stateBundle) {
        super.onCreate(stateBundle);
        getWindow().setStatusBarColor(0xff0b0b14); getWindow().setNavigationBarColor(0xff0b0b14);
        int layout=resource("activity_main", "layout");
        if (layout == 0) throw new IllegalStateException("Missing native shell layout");
        setContentView(layout);
        show("hScrollView",false); show("splashOverlay",false); show("nativeRoot",true);
        for (String name : new String[]{"nativeSearchPanel","nativeGenreScroll","nativeLibraryCategories",
                "nativeTabBar","nativeSettingsButton","nativeDiagButton", "nativePlayerShuffleButton",
                "nativePlayerPreviousButton", "nativePlayerNextButton", "nativePlayerRepeatButton"}) show(name,false);
        show("nativeBackButton",true);
        text("nativeScreenTitle","Ma musique");
        LinearLayout content=(LinearLayout)v("nativeContent");
        content.removeAllViews();
        TextView heading=new TextView(this); heading.setText("Votre musique locale");
        heading.setTextColor(Color.WHITE); heading.setTextSize(22); heading.setTypeface(null, Typeface.BOLD);
        heading.setPadding(dp(16),dp(20),dp(16),dp(8)); content.addView(heading);
        TextView detail=new TextView(this); detail.setText("Choisissez un fichier audio sur votre appareil.");
        detail.setTextColor(0xffbfc0cb); detail.setTextSize(15); detail.setPadding(dp(16),0,dp(16),dp(16)); content.addView(detail);
        Button choose=new Button(this); choose.setText("Choisir un fichier audio"); choose.setAllCaps(false);
        choose.setTextColor(Color.WHITE); choose.setTextSize(15); choose.setMinHeight(dp(48)); choose.setGravity(Gravity.CENTER);
        int background=resource("native_button_green","drawable"); if (background != 0) choose.setBackgroundResource(background);
        choose.setOnClickListener(view -> requestPicker());
        LinearLayout.LayoutParams buttonParams=new LinearLayout.LayoutParams(-1,dp(52)); buttonParams.setMargins(dp(16),0,dp(16),dp(16));
        content.addView(choose,buttonParams);
        state=new TextView(this); state.setTextColor(0xffbfc0cb); state.setTextSize(14);
        state.setPadding(dp(16),dp(8),dp(16),dp(16)); content.addView(state);
        Button back=new Button(this); back.setText("Retour"); back.setAllCaps(false);
        back.setOnClickListener(view -> finish());
        LinearLayout.LayoutParams backParams=new LinearLayout.LayoutParams(-1,dp(48)); backParams.setMargins(dp(16),0,dp(16),dp(16));
        content.addView(back,backParams);
        render(); refresh();
    }
    @Override protected void onStart() {
        super.onStart();
        bound=bindService(new Intent(this,LocalPlaybackService.class),connection,ContextFlags.bindAutoCreate());
        handler.post(tick);
    }
    @Override protected void onStop() {
        handler.removeCallbacks(tick);
        if (bound) { unbindService(connection); bound=false; service=null; }
        super.onStop();
    }
    // Separate helper avoids accidentally confusing BIND_AUTO_CREATE with Intent flags.
    private static final class ContextFlags { static int bindAutoCreate() { return android.content.Context.BIND_AUTO_CREATE; } }
    private void requestPicker() {
        if (Build.VERSION.SDK_INT >= 33 && !askedNotifications &&
                checkSelfPermission(Manifest.permission.POST_NOTIFICATIONS) != PackageManager.PERMISSION_GRANTED) {
            askedNotifications=true; requestPermissions(new String[]{Manifest.permission.POST_NOTIFICATIONS},NOTIFICATIONS);
        } else openPicker();
    }
    @Override public void onRequestPermissionsResult(int requestCode, String[] permissions, int[] results) {
        super.onRequestPermissionsResult(requestCode,permissions,results);
        if (requestCode == NOTIFICATIONS) openPicker(); // playback remains available if notification permission is denied
    }
    private void openPicker() {
        Intent pick=new Intent(Intent.ACTION_OPEN_DOCUMENT); pick.addCategory(Intent.CATEGORY_OPENABLE); pick.setType("audio/*");
        pick.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION | Intent.FLAG_GRANT_PERSISTABLE_URI_PERMISSION);
        try { startActivityForResult(pick,PICK_AUDIO); }
        catch (android.content.ActivityNotFoundException ex) { uiError="Sélecteur de fichiers indisponible sur cet appareil."; refresh(); }
    }
    @Override protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode,resultCode,data);
        if (requestCode != PICK_AUDIO || resultCode != RESULT_OK || data == null) return;
        Uri uri=data.getData();
        if (uri == null || !"content".equals(uri.getScheme())) { uiError="Fichier sélectionné inaccessible."; refresh(); return; }
        if ((data.getFlags() & Intent.FLAG_GRANT_PERSISTABLE_URI_PERMISSION) != 0) {
            try { getContentResolver().takePersistableUriPermission(uri,Intent.FLAG_GRANT_READ_URI_PERMISSION); }
            catch (SecurityException ignored) { /* transient provider grant still works for this run */ }
        }
        uiError="";
        Intent play=new Intent(this,LocalPlaybackService.class).setAction(LocalPlaybackService.SELECT).setData(uri);
        play.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);
        try {
            if (Build.VERSION.SDK_INT >= 26) startForegroundService(play); else startService(play);
            state.setText("Préparation du fichier…");
        } catch (RuntimeException ex) { uiError="Impossible de démarrer la lecture locale."; refresh(); }
    }
    private static String time(int ms) { int seconds=Math.max(0,ms)/1000; return (seconds/60)+":"+String.format(java.util.Locale.ROOT,"%02d",seconds%60); }
    private void render() {
        show("nativeRowsScroll",!expanded); show("nativePlayerPanel",expanded);
        show("nativeMiniPlayerContainer",!expanded && service != null && service.hasTrack());
        View root=v("nativeRoot"); int background=resource(expanded?"native_player_background":"native_shell_background","drawable");
        if (root != null && background != 0) root.setBackgroundResource(background);
        text("nativeScreenTitle",expanded?"Lecture en cours":"Ma musique");
    }
    private void artwork(String name, Bitmap bitmap) {
        View view=v(name); if (!(view instanceof ImageView)) return;
        ImageView image=(ImageView)view;
        if (bitmap != null) image.setImageBitmap(bitmap);
        else { int fallback=resource("native_artwork_placeholder","drawable"); if (fallback != 0) image.setImageResource(fallback); }
    }
    private void refresh() {
        if (state == null) return;
        boolean track=service != null && service.hasTrack();
        String title=track?service.title():"Aucun fichier choisi", artist=track?service.artist():"Choisissez un fichier audio";
        text("nativePlayerTitle",title); text("nativePlayerLargeTitle",title);
        text("nativePlayerArtist",artist); text("nativePlayerLargeArtist",artist);
        Bitmap art=track?service.artwork():null; artwork("nativePlayerArtwork",art); artwork("nativePlayerLargeArtwork",art);
        int position=track?service.position():0, duration=track?service.duration():0;
        text("nativePlayerPositionText",time(position)); text("nativePlayerDurationText",time(duration));
        int progress=duration>0?(int)Math.min(1000L,Math.max(0L,(long)position*1000L/duration)):0;
        for (String n:new String[]{"nativeMiniProgress","nativePlayerProgress"}) { View view=v(n); if(view instanceof ProgressBar) ((ProgressBar)view).setProgress(progress); }
        boolean playing=track && service.playing();
        for(String n:new String[]{"nativePlayPauseButton","nativePlayerLargePlayPauseButton"}) {
            View view=v(n); if(view instanceof ImageView) {
                int icon=resource(playing?"pause":"play","drawable"); if(icon!=0)((ImageView)view).setImageResource(icon);
                view.setContentDescription(playing?"Pause":"Lecture");
            }
        }
        if (!uiError.isEmpty()) state.setText(uiError);
        else if (service != null && !service.error().isEmpty()) state.setText(service.error());
        else if (track) state.setText(service.preparing()?"Préparation du fichier…":"Fichier sélectionné : " + title);
        else state.setText("Aucun fichier choisi.");
        if (!expanded) show("nativeMiniPlayerContainer",track);
    }
    public void onNativePlayerExpandClick(View view) { if(service != null && service.hasTrack()) { expanded=true; render(); refresh(); } }
    public void onNativePlayPauseClick(View view) { if(service != null) { service.toggle(); refresh(); } }
    public void onNativeBackClick(View view) { if(expanded) { expanded=false; render(); refresh(); } else finish(); }
    @Override public void onBackPressed() { if(expanded) { expanded=false; render(); refresh(); } else super.onBackPressed(); }
}
