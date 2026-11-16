package com.melodix.music;

import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.text.SpannableString;
import android.text.Spanned;
import android.text.style.RelativeSizeSpan;
import android.media.AudioManager;
import android.os.SystemClock;
import android.util.AttributeSet;
import android.view.HapticFeedbackConstants;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.Toast;

/** Local volume and truthful disabled placeholders; no Spotify navigation. */
public final class PreviewPlayerTiles extends LinearLayout {
    private Button volumeButton;
    private boolean volumeRunning;
    private long lastVolumeTap = -1000;
    private final Runnable volumeTick = new Runnable() { public void run() {
        if (!volumeRunning || !isShown() || getWindowVisibility()!=View.VISIBLE) { volumeRunning=false; return; }
        updateVolume(); postDelayed(this, 1000);
    }};
    private void updateVolume() {
        if (volumeButton==null) return;
        try {
            Object svc=getContext().getSystemService(Context.AUDIO_SERVICE);
            if (!(svc instanceof AudioManager)) { volumeButton.setEnabled(false); volumeButton.setAlpha(0.45f); volumeButton.setContentDescription("Volume du téléphone indisponible"); return; }
            AudioManager audio=(AudioManager)svc;
            int max=audio.getStreamMaxVolume(AudioManager.STREAM_MUSIC), value=audio.getStreamVolume(AudioManager.STREAM_MUSIC);
            if (max<=0) { volumeButton.setEnabled(false); volumeButton.setAlpha(0.45f); volumeButton.setContentDescription("Volume du téléphone indisponible"); return; }
            int percent=Math.max(0,Math.min(100,Math.round(value*100f/max)));
            String text="◖))\nVolume "+percent+" %";
            SpannableString label=new SpannableString(text);
            label.setSpan(new RelativeSizeSpan(2.2f),0,text.indexOf('\n'),Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            volumeButton.setText(label); volumeButton.setContentDescription("Volume du téléphone : "+percent+" pour cent");
            volumeButton.setEnabled(true);volumeButton.setAlpha(1f);
        } catch (RuntimeException ignored) { volumeButton.setEnabled(false); volumeButton.setAlpha(0.45f); volumeButton.setContentDescription("Volume du téléphone indisponible"); }
    }
    private void syncVolume() {
        boolean show=isAttachedToWindow() && isShown() && getWindowVisibility()==View.VISIBLE;
        if(show && !volumeRunning){volumeRunning=true;updateVolume();postDelayed(volumeTick,1000);}
        else if(!show && volumeRunning){volumeRunning=false;removeCallbacks(volumeTick);}
    }
    @Override protected void onAttachedToWindow(){super.onAttachedToWindow();syncVolume();}
    @Override protected void onDetachedFromWindow(){volumeRunning=false;removeCallbacks(volumeTick);super.onDetachedFromWindow();}
    @Override protected void onVisibilityChanged(View v,int visibility){super.onVisibilityChanged(v,visibility);if(volumeTick!=null)post(new Runnable(){public void run(){syncVolume();}});}
    @Override protected void onWindowVisibilityChanged(int visibility){super.onWindowVisibilityChanged(visibility);if(volumeTick!=null)post(new Runnable(){public void run(){syncVolume();}});}
    public PreviewPlayerTiles(Context c, AttributeSet attrs) {
        super(c,attrs);setOrientation(HORIZONTAL);setGravity(android.view.Gravity.CENTER);
        String[] labels={"☰\nFile","♬\nParoles","▣\nAppareils","◖))\nVolume"};
        for(int i=0;i<labels.length;i++) {
            final int n=i;Button b=new Button(c);
            SpannableString label=new SpannableString(labels[i]);
            label.setSpan(new RelativeSizeSpan(2.2f),0,labels[i].indexOf('\n'),Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            b.setText(label);b.setTextSize(10);b.setTextColor(0xffb4aec5);
            b.setAllCaps(false);b.setSingleLine(false);b.setMaxLines(4);b.setPadding(dp(2),dp(4),dp(2),dp(4));b.setMinWidth(0);b.setMinimumWidth(0);b.setMinimumHeight(dp(56));
            GradientDrawable tile=new GradientDrawable();tile.setColor(0x14ffffff);tile.setCornerRadius(dp(18));tile.setStroke(dp(1),0x1fffffff);
            b.setBackgroundTintList(null);b.setStateListAnimator(null);b.setElevation(0f);b.setTranslationZ(0f);b.setForeground(null);
            b.setBackground(new RippleDrawable(ColorStateList.valueOf(0x447b3fe4),tile,null));
            String[] unavailable={"Indisponible : file Spotify non intégrée à cet écran", "Indisponible : paroles non intégrées à cet écran", "Indisponible : appareils Spotify non intégrés à cet écran"};
            b.setContentDescription(i==3?"Volume du téléphone":unavailable[i]);
            b.setEnabled(i==3);b.setAlpha(i==3?1f:0.45f);b.setSelected(false);b.setActivated(false);
            LinearLayout.LayoutParams lp=new LinearLayout.LayoutParams(0,getResources().getConfiguration().fontScale>1.3f?LayoutParams.WRAP_CONTENT:dp(56),1f);if(i>0)lp.leftMargin=dp(8);addView(b,lp);
            if(n==3){volumeButton=b;b.setOnClickListener(new View.OnClickListener(){public void onClick(View v){
                long now=SystemClock.elapsedRealtime();
                if(!volumeRunning || !isShown() || now-lastVolumeTap<400)return;
                lastVolumeTap=now;v.performHapticFeedback(HapticFeedbackConstants.KEYBOARD_TAP);
                try {
                    Object svc=getContext().getSystemService(Context.AUDIO_SERVICE);
                    if(!(svc instanceof AudioManager)) throw new IllegalStateException();
                    ((AudioManager)svc).adjustStreamVolume(AudioManager.STREAM_MUSIC,AudioManager.ADJUST_SAME,AudioManager.FLAG_SHOW_UI);
                } catch(RuntimeException ignored){updateVolume();Toast.makeText(getContext(),"Volume indisponible. Réessayer",Toast.LENGTH_SHORT).show();}
            }});}

        }
    }
    private int dp(float x){return (int)(x*getResources().getDisplayMetrics().density+0.5f);}
}
