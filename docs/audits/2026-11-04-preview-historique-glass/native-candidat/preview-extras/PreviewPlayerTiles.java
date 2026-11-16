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
import android.os.SystemClock;
import android.text.SpannableString;
import android.text.Spanned;
import android.text.style.RelativeSizeSpan;
import android.util.AttributeSet;
import android.view.Gravity;
import android.view.HapticFeedbackConstants;
import android.view.MotionEvent;
import android.view.View;
import android.view.Window;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;

/** Native-only blocked panels. No WebView or Android audio operation. */
public final class PreviewPlayerTiles extends LinearLayout {
    private final String[] names={"File","Paroles","Appareils"};
    private Dialog panel;
    private long lastTap=-1000;
    private int dp(float x){return (int)(x*getResources().getDisplayMetrics().density+0.5f);}
    private Activity activity(){
        Context c=getContext();for(int i=0;i<8 && c instanceof ContextWrapper;i++){
            if(c instanceof Activity)return (Activity)c;
            Context n=((ContextWrapper)c).getBaseContext();if(n==c)break;c=n;
        }return c instanceof Activity?(Activity)c:null;
    }
    public PreviewPlayerTiles(Context c, AttributeSet attrs){
        super(c,attrs);setOrientation(HORIZONTAL);setGravity(Gravity.CENTER);
        String[] labels={"☰\nFile","♬\nParoles","▣\nAppareils","◖))\nVolume —"};
        for(int i=0;i<labels.length;i++){
            final int index=i;Button b=new Button(c);
            SpannableString label=new SpannableString(labels[i]);
            label.setSpan(new RelativeSizeSpan(2.2f),0,labels[i].indexOf('\n'),Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            b.setText(label);b.setTextSize(10);b.setTextColor(0xffb4aec5);b.setAllCaps(false);b.setSingleLine(false);b.setMaxLines(4);
            b.setPadding(dp(2),dp(4),dp(2),dp(4));b.setMinWidth(0);b.setMinimumWidth(0);b.setMinimumHeight(dp(56));
            GradientDrawable tile=new GradientDrawable();tile.setColor(0x14ffffff);tile.setCornerRadius(dp(18));tile.setStroke(dp(1),0x1fffffff);
            b.setBackgroundTintList(null);b.setStateListAnimator(null);b.setElevation(0f);b.setTranslationZ(0f);b.setForeground(null);
            b.setBackground(new RippleDrawable(ColorStateList.valueOf(0x447b3fe4),tile,null));
            b.setSelected(false);b.setActivated(false);b.setAlpha(0.45f);
            LinearLayout.LayoutParams lp=new LinearLayout.LayoutParams(0,getResources().getConfiguration().fontScale>1.3f?LayoutParams.WRAP_CONTENT:dp(56),1f);
            if(i>0)lp.leftMargin=dp(8);addView(b,lp);
            if(i<3){b.setContentDescription(names[i]+" : indisponible dans cette version");b.setOnClickListener(new View.OnClickListener(){public void onClick(View v){showPanel(index);}});}
            else {b.setContentDescription("Volume du lecteur indisponible ; volume du téléphone non modifié");b.setEnabled(false);}
        }
    }
    private void showPanel(int index){
        long now=SystemClock.elapsedRealtime();Activity a=activity();
        if(!isShown() || getWindowVisibility()!=View.VISIBLE || a==null || a.isFinishing() || a.isDestroyed() || panel!=null || now-lastTap<400)return;
        lastTap=now;performHapticFeedback(HapticFeedbackConstants.KEYBOARD_TAP);
        final Dialog dialog=new Dialog(a);panel=dialog;
        try {
            LinearLayout content=new LinearLayout(a);content.setOrientation(VERTICAL);content.setPadding(dp(20),dp(6),dp(20),dp(24));
            GradientDrawable glass=new GradientDrawable();glass.setColor(0xeb170b33);glass.setStroke(dp(1),0x1fffffff);
            float r=dp(28);glass.setCornerRadii(new float[]{r,r,r,r,0,0,0,0});content.setBackground(glass);
            TextView handle=new TextView(a);handle.setText("━");handle.setTextColor(0xffc9c0ea);handle.setGravity(Gravity.CENTER);handle.setMinimumHeight(dp(44));handle.setContentDescription("Glisser vers le bas pour fermer");
            handle.setOnTouchListener(new View.OnTouchListener(){float down;public boolean onTouch(View v,MotionEvent e){
                if(e.getActionMasked()==MotionEvent.ACTION_DOWN){down=e.getRawY();return true;}
                if(e.getActionMasked()==MotionEvent.ACTION_UP){if(e.getRawY()-down>dp(50))dialog.dismiss();return true;}
                return true;
            }});content.addView(handle,new LinearLayout.LayoutParams(-1,dp(44)));
            LinearLayout header=new LinearLayout(a);header.setGravity(Gravity.CENTER_VERTICAL);
            TextView title=new TextView(a);title.setText(names[index]);title.setTextSize(20);title.setTextColor(Color.WHITE);
            header.addView(title,new LinearLayout.LayoutParams(0,dp(48),1f));
            Button close=new Button(a);close.setText("Fermer");close.setAllCaps(false);close.setMinWidth(dp(48));close.setMinimumHeight(dp(48));close.setContentDescription("Fermer "+names[index]);
            close.setOnClickListener(new View.OnClickListener(){public void onClick(View v){dialog.dismiss();}});header.addView(close,new LinearLayout.LayoutParams(-2,dp(48)));
            content.addView(header,new LinearLayout.LayoutParams(-1,dp(48)));
            TextView unavailable=new TextView(a);unavailable.setText("Indisponible dans cette version");unavailable.setTextColor(Color.WHITE);unavailable.setTextSize(16);unavailable.setPadding(0,dp(24),0,dp(24));
            content.addView(unavailable,new LinearLayout.LayoutParams(-1,-2));dialog.setContentView(content);dialog.setCanceledOnTouchOutside(true);
            dialog.setOnDismissListener(new DialogInterface.OnDismissListener(){public void onDismiss(DialogInterface ignored){if(panel==dialog)panel=null;}});
            dialog.show();Window w=dialog.getWindow();if(w==null){dialog.dismiss();return;}
            w.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));w.setGravity(Gravity.BOTTOM);w.setLayout(-1,-2);
        }catch(RuntimeException ignored){panel=null;dialog.dismiss();}
    }
    private void closeIfHidden(){if(panel!=null && (!isShown() || getWindowVisibility()!=View.VISIBLE))panel.dismiss();}
    @Override protected void onDetachedFromWindow(){if(panel!=null)panel.dismiss();super.onDetachedFromWindow();}
    @Override protected void onVisibilityChanged(View v,int visibility){super.onVisibilityChanged(v,visibility);post(new Runnable(){public void run(){closeIfHidden();}});}
    @Override protected void onWindowVisibilityChanged(int visibility){super.onWindowVisibilityChanged(visibility);post(new Runnable(){public void run(){closeIfHidden();}});}
}
