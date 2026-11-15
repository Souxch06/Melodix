package com.melodix.music;

import android.content.Context;
import android.media.AudioManager;
import android.util.AttributeSet;
import android.view.HapticFeedbackConstants;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.Toast;

/** Local volume and truthful disabled placeholders; no Spotify navigation. */
public final class PreviewPlayerTiles extends LinearLayout {
    public PreviewPlayerTiles(Context c, AttributeSet attrs) {
        super(c,attrs);setOrientation(HORIZONTAL);
        String[] labels={"☰\nFile","♬\nParoles","▣\nAppareils","◖))\nVolume"};
        for(int i=0;i<labels.length;i++) {
            final int n=i;Button b=new Button(c);b.setText(labels[i]);b.setTextSize(10);b.setTextColor(0xffdcd5f5);
            b.setAllCaps(false);b.setPadding(0,0,0,0);b.setMinWidth(0);b.setMinimumWidth(0);b.setMinimumHeight(dp(48));
            int bg=getResources().getIdentifier("native_button_dark","drawable",c.getPackageName());if(bg!=0)b.setBackgroundResource(bg);
            b.setContentDescription(i==3?"Volume du téléphone":labels[i].replace('\n',' ')+" indisponible");
            b.setEnabled(i==3);b.setAlpha(i==3?1f:0.38f);
            LinearLayout.LayoutParams lp=new LinearLayout.LayoutParams(0,dp(56),1f);if(i>0)lp.leftMargin=dp(8);addView(b,lp);
            if(n==3)b.setOnClickListener(new View.OnClickListener(){public void onClick(View v){
                Object svc=getContext().getSystemService(Context.AUDIO_SERVICE);
                if(svc instanceof AudioManager){v.performHapticFeedback(HapticFeedbackConstants.KEYBOARD_TAP);((AudioManager)svc).adjustStreamVolume(AudioManager.STREAM_MUSIC,AudioManager.ADJUST_SAME,AudioManager.FLAG_SHOW_UI);}
                else Toast.makeText(getContext(),"Volume indisponible",Toast.LENGTH_SHORT).show();
            }});
        }
    }
    private int dp(float x){return (int)(x*getResources().getDisplayMetrics().density+0.5f);}
}
