package com.melodix.music;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.DialogInterface;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.text.SpannableString;
import android.text.Spanned;
import android.text.style.RelativeSizeSpan;
import android.os.SystemClock;
import android.view.Window;
import android.util.AttributeSet;
import android.view.HapticFeedbackConstants;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.Toast;

/** Native fallback panels and a separate Spotify volume control. */
public final class PreviewPlayerTiles extends LinearLayout {
    private final String[] names={"File","Paroles","Appareils"};
    private final String[] icons={"☰","♬","▣"};
    private final Button[] controls=new Button[3];
    private Dialog webDialog;
    private long lastAction=-1000;
    private boolean volumeRunning;
    private Activity activity(){
        Context c=getContext();for(int i=0;i<8 && c instanceof ContextWrapper;i++){
            if(c instanceof Activity)return (Activity)c;
            Context n=((ContextWrapper)c).getBaseContext();if(n==c)break;c=n;
        }return c instanceof Activity?(Activity)c:null;
    }
    private void paintControls(){
        for(int i=0;i<3;i++){
            Button b=controls[i];if(b==null)continue;
            b.setEnabled(true);b.setAlpha(0.45f);
            String labelText=icons[i]+"\n"+names[i];
            SpannableString label=new SpannableString(labelText);label.setSpan(new RelativeSizeSpan(2.2f),0,labelText.indexOf('\n'),Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);b.setText(label);
            b.setContentDescription(names[i]+" : indisponible dans cette version");
        }
    }
    private void message(String text){if(volumeRunning && isShown())Toast.makeText(getContext(),text,Toast.LENGTH_SHORT).show();}
    private void activate(final int i){
        long now=SystemClock.elapsedRealtime();final Activity a=activity();
        if(!volumeRunning || !isShown() || getWindowVisibility()!=View.VISIBLE || a==null || a.isFinishing() || a.isDestroyed() || webDialog!=null || now-lastAction<400)return;
        lastAction=now;controls[i].performHapticFeedback(HapticFeedbackConstants.KEYBOARD_TAP);
        try {
            final Dialog dialog=new Dialog(a);Button close=new Button(a);
            close.setText("Indisponible dans cette version\nFermer");close.setContentDescription(names[i]+" : indisponible dans cette version. Fermer");close.setMinimumHeight(dp(48));
            GradientDrawable glass=new GradientDrawable();glass.setColor(0xeb170b33);glass.setStroke(dp(1),0x1fffffff);glass.setCornerRadius(dp(28));close.setBackground(glass);
            close.setOnClickListener(new View.OnClickListener(){public void onClick(View v){dialog.dismiss();}});
            dialog.setTitle(names[i]);dialog.setContentView(close);dialog.setCanceledOnTouchOutside(true);
            dialog.setOnDismissListener(new DialogInterface.OnDismissListener(){public void onDismiss(DialogInterface ignored){webDialog=null;}});
            webDialog=dialog;dialog.show();Window w=dialog.getWindow();if(w==null){dialog.dismiss();return;}
            w.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));w.setGravity(android.view.Gravity.BOTTOM);w.setLayout(-1,-2);
        }catch(RuntimeException ignored){if(webDialog!=null){webDialog.dismiss();webDialog=null;}message("Indisponible dans cette version");}
    }
    private void syncVolume() {
        boolean show=isAttachedToWindow() && isShown() && getWindowVisibility()==View.VISIBLE;
        volumeRunning=show;if(!show && webDialog!=null)webDialog.dismiss();paintControls();
    }
    @Override protected void onAttachedToWindow(){super.onAttachedToWindow();syncVolume();}
    @Override protected void onDetachedFromWindow(){volumeRunning=false;if(webDialog!=null)webDialog.dismiss();super.onDetachedFromWindow();}
    @Override protected void onVisibilityChanged(View v,int visibility){super.onVisibilityChanged(v,visibility);if(controls!=null)post(new Runnable(){public void run(){syncVolume();}});}
    @Override protected void onWindowVisibilityChanged(int visibility){super.onWindowVisibilityChanged(visibility);if(controls!=null)post(new Runnable(){public void run(){syncVolume();}});}
    public PreviewPlayerTiles(Context c, AttributeSet attrs) {
        super(c,attrs);setOrientation(HORIZONTAL);setGravity(android.view.Gravity.CENTER);
        String[] labels={"☰\nFile","♬\nParoles","▣\nAppareils","◖))\nVolume"};
        for(int i=0;i<labels.length;i++) {
            final int n=i;Button b=i==3?new PreviewPlayerVolume(c):new Button(c);
            SpannableString label=new SpannableString(labels[i]);
            label.setSpan(new RelativeSizeSpan(2.2f),0,labels[i].indexOf('\n'),Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            b.setText(label);b.setTextSize(10);b.setTextColor(0xffb4aec5);
            b.setAllCaps(false);b.setSingleLine(false);b.setMaxLines(4);b.setPadding(dp(2),dp(4),dp(2),dp(4));b.setMinWidth(0);b.setMinimumWidth(0);b.setMinimumHeight(dp(56));
            GradientDrawable tile=new GradientDrawable();tile.setColor(0x14ffffff);tile.setCornerRadius(dp(18));tile.setStroke(dp(1),0x1fffffff);
            b.setBackgroundTintList(null);b.setStateListAnimator(null);b.setElevation(0f);b.setTranslationZ(0f);b.setForeground(null);
            b.setBackground(new RippleDrawable(ColorStateList.valueOf(0x447b3fe4),tile,null));
            b.setContentDescription(i==3?"Volume du lecteur indisponible":names[i]+" : indisponible, page Spotify non accessible");
            if(i<3)b.setEnabled(true);b.setAlpha(i==3?1f:0.45f);b.setSelected(false);b.setActivated(false);
            LinearLayout.LayoutParams lp=new LinearLayout.LayoutParams(0,getResources().getConfiguration().fontScale>1.3f?LayoutParams.WRAP_CONTENT:dp(56),1f);if(i>0)lp.leftMargin=dp(8);addView(b,lp);
            if(n<3){controls[n]=b;b.setOnClickListener(new View.OnClickListener(){public void onClick(View v){activate(n);}});}

        }
    }
    private int dp(float x){return (int)(x*getResources().getDisplayMetrics().density+0.5f);}
}
