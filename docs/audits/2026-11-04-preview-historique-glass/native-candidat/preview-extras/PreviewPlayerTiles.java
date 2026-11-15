package com.melodix.music;

import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.text.SpannableString;
import android.text.Spanned;
import android.text.style.RelativeSizeSpan;
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
            final int n=i;Button b=new Button(c);
            SpannableString label=new SpannableString(labels[i]);
            label.setSpan(new RelativeSizeSpan(1.65f),0,labels[i].indexOf('\n'),Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            b.setText(label);b.setTextSize(12);b.setTextColor(0xffeee9ff);
            b.setAllCaps(false);b.setSingleLine(false);b.setMaxLines(4);b.setPadding(dp(2),dp(8),dp(2),dp(8));b.setMinWidth(0);b.setMinimumWidth(0);b.setMinimumHeight(dp(76));
            GradientDrawable tile=new GradientDrawable();tile.setColor(0x22ffffff);tile.setCornerRadius(dp(18));tile.setStroke(dp(1),0x33ffffff);
            b.setBackground(new RippleDrawable(ColorStateList.valueOf(0x447b3fe4),tile,null));
            b.setContentDescription(i==3?"Volume du téléphone":labels[i].replace('\n',' ')+" indisponible");
            b.setEnabled(i==3);b.setAlpha(i==3?1f:0.65f);
            LinearLayout.LayoutParams lp=new LinearLayout.LayoutParams(0,LayoutParams.WRAP_CONTENT,1f);if(i>0)lp.leftMargin=dp(6);addView(b,lp);
            if(n==3)b.setOnClickListener(new View.OnClickListener(){public void onClick(View v){
                Object svc=getContext().getSystemService(Context.AUDIO_SERVICE);
                if(svc instanceof AudioManager){v.performHapticFeedback(HapticFeedbackConstants.KEYBOARD_TAP);((AudioManager)svc).adjustStreamVolume(AudioManager.STREAM_MUSIC,AudioManager.ADJUST_SAME,AudioManager.FLAG_SHOW_UI);}
                else Toast.makeText(getContext(),"Volume indisponible",Toast.LENGTH_SHORT).show();
            }});
        }
    }
    private int dp(float x){return (int)(x*getResources().getDisplayMetrics().density+0.5f);}
}
