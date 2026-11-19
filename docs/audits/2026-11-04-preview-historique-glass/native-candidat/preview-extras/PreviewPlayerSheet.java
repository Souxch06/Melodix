package com.melodix.music;

import android.animation.ValueAnimator;
import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.os.Build;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.Window;
import android.view.animation.AccelerateInterpolator;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.OvershootInterpolator;

/** Bottom sheets use the same vertical motion as the native player. */
public final class PreviewPlayerSheet extends Dialog {
    private final Activity activity;
    private View panel;
    private boolean closing;

    private static int pixels(Context c,float n){return (int)(n*c.getResources().getDisplayMetrics().density+0.5f);}
    public static GradientDrawable surface(Context c,int color,int border,float radius){
        GradientDrawable d=new GradientDrawable();d.setColor(color);d.setStroke(pixels(c,1),border);d.setCornerRadius(pixels(c,radius));return d;
    }
    public static GradientDrawable background(Context c){
        GradientDrawable d=new GradientDrawable();float r=pixels(c,28);d.setCornerRadii(new float[]{r,r,r,r,0,0,0,0});d.setColors(new int[]{0xff20172f,0xff110e19});d.setStroke(pixels(c,1),0x24ffffff);return d;
    }
    public static GradientDrawable actionBackground(Context c,boolean primary){
        GradientDrawable d=surface(c,primary?0xff57417c:0x0cffffff,primary?0x45bca2ed:0x20ffffff,999);return d;
    }
    public PreviewPlayerSheet(Activity activity){super(activity);this.activity=activity;}
    private int dp(float x){return (int)(x*activity.getResources().getDisplayMetrics().density+0.5f);}
    private boolean motionOff(){return Build.VERSION.SDK_INT>=26 && !ValueAnimator.areAnimatorsEnabled();}
    private float travel(){return Math.max(panel==null?0:panel.getHeight(),dp(300));}

    public void showSheet(final View content){
        panel=content;closing=false;setContentView(content);
        Window w=getWindow();if(w!=null)w.setWindowAnimations(0);
        content.setAlpha(1f);
        if(!motionOff())content.setTranslationY(Math.max(dp(300),activity.getResources().getDisplayMetrics().heightPixels));
        super.show();
        w=getWindow();if(w==null){dismissImmediately();return;}
        w.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));w.setGravity(Gravity.BOTTOM);w.setLayout(-1,-2);
        if(!motionOff())content.post(new Runnable(){public void run(){
            if(closing || !isShowing() || panel!=content)return;
            content.setTranslationY(content.getHeight()>0?travel():Math.max(dp(300),activity.getResources().getDisplayMetrics().heightPixels));
            content.setAlpha(0.4f);
            content.animate().translationY(0f).alpha(1f).setDuration(380).setInterpolator(new OvershootInterpolator(0.7f)).start();
        }});
        else content.setTranslationY(0f);
    }
    @Override public void dismiss(){
        if(closing)return;
        if(panel==null || !isShowing() || activity.isFinishing() || activity.isDestroyed() || motionOff()){
            dismissImmediately();return;
        }
        closing=true;panel.animate().cancel();
        panel.animate().translationY(travel()).alpha(0.5f).setDuration(240).setInterpolator(new AccelerateInterpolator(1.4f)).withEndAction(new Runnable(){public void run(){
            if(closing)dismissImmediately();
        }}).start();
    }
    /** Lifecycle cleanup is immediate and invalidates any pending entrance. */
    public void dismissImmediately(){
        closing=true;
        if(panel!=null)panel.animate().cancel();
        super.dismiss();panel=null;
    }
    /** Restrict the drag to a handle or title; sliders and lists remain usable. */
    public View.OnTouchListener dragListener(){
        return new View.OnTouchListener(){float x,y,lastDy;long lastAt;float speed;int moves;boolean vertical,rejected;
            public boolean onTouch(View v,MotionEvent e){
                if(closing || panel==null)return true;
                int action=e.getActionMasked();
                if(action==MotionEvent.ACTION_DOWN){x=e.getRawX();y=e.getRawY();vertical=false;rejected=false;lastDy=0;speed=0;moves=0;lastAt=System.nanoTime();panel.animate().cancel();return true;}
                if(action==MotionEvent.ACTION_POINTER_DOWN){rejected=true;vertical=false;panel.setTranslationY(0f);return true;}
                float dx=e.getRawX()-x,dy=e.getRawY()-y;
                if(action==MotionEvent.ACTION_MOVE){
                    if(!vertical && !rejected && (Math.abs(dx)>dp(12)||Math.abs(dy)>dp(12))){
                        if(dy>0 && dy>Math.abs(dx)*1.3f)vertical=true;else rejected=true;
                    }
                    if(vertical){
                        long now=System.nanoTime();float ms=Math.max(1f,(now-lastAt)/1e6f);speed=(dy-lastDy)/ms;lastDy=dy;lastAt=now;moves++;
                        panel.setTranslationY(Math.max(0f,dy));
                        float h=Math.max(1,panel.getHeight());panel.setAlpha(1f-Math.min(.35f,Math.max(0f,dy)/h*.5f));
                    }
                    return true;
                }
                if(action==MotionEvent.ACTION_UP || action==MotionEvent.ACTION_CANCEL){
                    // A quick downward flick closes too, not only a long drag.
                    if(action==MotionEvent.ACTION_UP && vertical && (dy>Math.max(dp(90),panel.getHeight()*.16f) || (moves>=3 && dy>dp(24) && speed>dp(1))))dismiss();
                    else if(motionOff()){panel.setTranslationY(0f);panel.setAlpha(1f);}
                    else panel.animate().translationY(0f).alpha(1f).setDuration(260).setInterpolator(new OvershootInterpolator(1.1f)).start();
                    vertical=false;return true;
                }
                return true;
            }
        };
    }
}
