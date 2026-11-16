package com.melodix.music;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.res.ColorStateList;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.os.Build;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.ViewTreeObserver;

/** Player-only layout and chrome. No player command, state or WebView access. */
public final class PreviewPlayerChrome extends View implements ViewTreeObserver.OnGlobalLayoutListener {
    private View header;
    private ViewTreeObserver observer;
    private int previousHeaderVisibility;
    private boolean headerHidden, playStyled;
    private final Runnable syncTask = new Runnable(){ public void run(){ sync(); } };
    public PreviewPlayerChrome(Context c, AttributeSet a){super(c,a);}
    private int dp(float x){return (int)(x*getResources().getDisplayMetrics().density+0.5f);}
    private Activity activity(){
        Context c=getContext();
        for(int i=0;i<8 && c instanceof ContextWrapper;i++){
            if(c instanceof Activity)return (Activity)c;
            Context next=((ContextWrapper)c).getBaseContext();if(next==c)break;c=next;
        }
        return c instanceof Activity?(Activity)c:null;
    }
    private boolean playerVisible(){return isAttachedToWindow() && isShown() && getWindowVisibility()==VISIBLE;}
    private void hideHeader(Activity a){
        if(headerHidden)return;
        View title=a.findViewById(0x7f090230), nativeRoot=a.findViewById(0x7f09022f);
        if(title==null || !(title.getParent() instanceof View))return;
        View candidate=(View)title.getParent();
        if(candidate.getParent()!=nativeRoot)return;
        header=candidate;previousHeaderVisibility=candidate.getVisibility();headerHidden=true;
        candidate.setVisibility(GONE);
    }
    private void restoreHeader(){
        if(headerHidden && header!=null)header.setVisibility(previousHeaderVisibility);
        header=null;headerHidden=false;
    }
    private void stylePlay(Activity a){
        if(playStyled)return;
        View button=a.findViewById(0x7f09023e); if(button==null)return;
        GradientDrawable shape=new GradientDrawable(GradientDrawable.Orientation.TL_BR,new int[]{0xff7b3fe4,0xffe0489e});
        shape.setShape(GradientDrawable.OVAL);
        button.setBackground(new RippleDrawable(ColorStateList.valueOf(0x44ffffff),shape,null));
        if(Build.VERSION.SDK_INT>=28){button.setOutlineSpotShadowColor(0xffe0489e);button.setOutlineAmbientShadowColor(0xff7b3fe4);}
        playStyled=true;
    }
    private void sizeArtwork(Activity a){
        View panel=a.findViewById(0x7f09023a);ViewParent parent=getParent();
        if(panel==null || !(parent instanceof ViewGroup))return;
        ViewGroup content=(ViewGroup)parent;
        View frame=content.findViewWithTag("previewPlayerArtFrame"),card=content.findViewWithTag("previewPlayerArtCard");
        if(frame==null || card==null || frame.getParent()!=content || panel.getHeight()<=0 || frame.getWidth()<=0)return;
        int used=0;
        for(int i=0;i<content.getChildCount();i++){
            View child=content.getChildAt(i);
            if(child==this || child==frame || child.getVisibility()==GONE || "previewPlayerSpacer".equals(child.getTag()))continue;
            ViewGroup.LayoutParams lp=child.getLayoutParams();used+=child.getMeasuredHeight();
            if(lp instanceof ViewGroup.MarginLayoutParams){ViewGroup.MarginLayoutParams m=(ViewGroup.MarginLayoutParams)lp;used+=m.topMargin+m.bottomMargin;}
        }
        ViewGroup.LayoutParams f=frame.getLayoutParams();
        if(f instanceof ViewGroup.MarginLayoutParams){ViewGroup.MarginLayoutParams m=(ViewGroup.MarginLayoutParams)f;used+=m.topMargin+m.bottomMargin;}
        int available=panel.getHeight()-panel.getPaddingTop()-panel.getPaddingBottom()-used;
        int limit=Math.min(dp(318),frame.getWidth());
        int side=getResources().getConfiguration().fontScale>1.3f?limit:Math.min(limit,Math.max(dp(80),available));
        if(side<=0)return;
        ViewGroup.LayoutParams c=card.getLayoutParams();
        if(f.height!=side){f.height=side;frame.setLayoutParams(f);}
        if(c.width!=side || c.height!=side){c.width=side;c.height=side;card.setLayoutParams(c);}
    }
    private void sync(){
        if(!playerVisible()){restoreHeader();return;}
        Activity a=activity();if(a==null)return;
        hideHeader(a);stylePlay(a);sizeArtwork(a);
    }
    @Override public void onGlobalLayout(){sync();}
    @Override protected void onAttachedToWindow(){super.onAttachedToWindow();observer=getViewTreeObserver();observer.addOnGlobalLayoutListener(this);post(syncTask);}
    @Override protected void onDetachedFromWindow(){if(observer!=null && observer.isAlive())observer.removeOnGlobalLayoutListener(this);observer=null;removeCallbacks(syncTask);restoreHeader();super.onDetachedFromWindow();}
    @Override protected void onVisibilityChanged(View changed,int visibility){super.onVisibilityChanged(changed,visibility);if(syncTask!=null)post(syncTask);}
    @Override protected void onWindowVisibilityChanged(int visibility){super.onWindowVisibilityChanged(visibility);if(syncTask!=null)post(syncTask);}
}
