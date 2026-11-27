package com.melodix.diag;

import android.app.Activity;
import android.content.ComponentName;
import android.content.Intent;
import android.media.MediaMetadata;
import android.media.session.MediaController;
import android.media.session.MediaSessionManager;
import android.media.session.PlaybackState;
import android.os.Bundle;
import android.provider.Settings;
import android.view.Gravity;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.util.List;

/**
 * Lists the media sessions Android exposes to this app. Results are shown on screen only:
 * nothing is logged, stored, or sent (the app has no INTERNET permission).
 */
public class DiagActivity extends Activity {
    private TextView out;
    private Button openSettings;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setPadding(32, 48, 32, 32);

        TextView title = new TextView(this);
        title.setText("Diagnostic des sessions média");
        title.setTextSize(20);
        root.addView(title);

        Button refresh = new Button(this);
        refresh.setText("Actualiser");
        refresh.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View v) { refresh(); }
        });
        root.addView(refresh);

        out = new TextView(this);
        out.setTextSize(14);
        root.addView(out);
        openSettings = new Button(this);
        openSettings.setText("Ouvrir les réglages d'accès");
        openSettings.setVisibility(View.GONE);
        openSettings.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View v) {
                startActivity(new Intent(Settings.ACTION_NOTIFICATION_LISTENER_SETTINGS));
            }
        });
        root.addView(openSettings);
        setContentView(root);
        refresh();
    }

    private boolean listenerEnabled() {
        String enabled = Settings.Secure.getString(getContentResolver(), "enabled_notification_listeners");
        return enabled != null && enabled.contains(getPackageName() + "/");
    }

    private void refresh() {
        if (!listenerEnabled()) {
            out.setText("Autorisation manquante.\n\nActive « Melodix Diag » dans Paramètres › Notifications › Accès aux notifications, puis reviens ici et appuie sur Actualiser.");
            openSettings.setVisibility(View.VISIBLE);
            return;
        }
        MediaSessionManager msm = (MediaSessionManager) getSystemService(MEDIA_SESSION_SERVICE);
        List<MediaController> sessions;
        try {
            sessions = msm.getActiveSessions(new ComponentName(this, DiagListenerService.class));
        } catch (SecurityException e) {
            out.setText("Accès refusé par Android : " + e.getClass().getSimpleName());
            return;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("Sessions actives : ").append(sessions.size()).append("\n");
        int index = 0;
        for (MediaController c : sessions) {
            index++;
            PlaybackState ps = c.getPlaybackState();
            int state = ps == null ? -1 : ps.getState();
            MediaMetadata md = c.getMetadata();
            sb.append("\n#").append(index).append("\n");
            sb.append("Package : ").append(c.getPackageName()).append("\n");
            sb.append("État : ").append(stateName(state)).append("\n");
            sb.append("Titre : ").append(md == null ? "—" : nz(md.getString(MediaMetadata.METADATA_KEY_TITLE))).append("\n");
            sb.append("Artiste : ").append(md == null ? "—" : nz(md.getString(MediaMetadata.METADATA_KEY_ARTIST))).append("\n");
        }
        openSettings.setVisibility(View.GONE);
        if (sessions.isEmpty()) sb.append("\nAucune session média visible. Lance une lecture puis appuie sur Actualiser.");
        out.setText(sb.toString());
    }

    private static String nz(String s) { return s == null || s.isEmpty() ? "(vide)" : s; }

    private static String stateName(int s) {
        switch (s) {
            case PlaybackState.STATE_PLAYING: return "lecture";
            case PlaybackState.STATE_PAUSED: return "pause";
            case PlaybackState.STATE_STOPPED: return "arrêtée";
            case PlaybackState.STATE_BUFFERING: return "mise en mémoire tampon";
            case PlaybackState.STATE_NONE: return "aucune";
            default: return "inconnue (" + s + ")";
        }
    }
}
