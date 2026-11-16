package com.melodix.music;

import android.app.Activity;
import android.animation.ValueAnimator;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.res.ColorStateList;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.LayerDrawable;
import android.graphics.drawable.RippleDrawable;
import android.os.Build;
import android.util.AttributeSet;
import android.view.HapticFeedbackConstants;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.ViewTreeObserver;
import android.widget.ImageView;
import android.widget.SeekBar;

/** Player-only layout and chrome. No player command, state or WebView access. */
public final class PreviewPlayerChrome extends View implements ViewTreeObserver.OnGlobalLayoutListener {
    private View header;
    private ViewTreeObserver observer;
    private int previousHeaderVisibility;
    private boolean headerHidden, playStyled, chromeApplied, setupDone, ticking;
    private View root, panel;
    private Drawable rootBackground, panelBackground, appliedBackground;
    private PreviewPlayerDecoration repeatArt, shuffleDot;
    private View repeatControl, shuffleControl;
    private final Runnable visualTick = new Runnable() { public void run() {
        if (!playerVisible()) { ticking=false; return; }
        if (repeatArt!=null && repeatControl!=null) {
            repeatArt.setBounds(0,0,repeatControl.getWidth(),repeatControl.getHeight()); repeatArt.invalidateSelf();
        }
        if (shuffleDot!=null && shuffleControl!=null) {
            shuffleDot.setBounds(0,0,shuffleControl.getWidth(),shuffleControl.getHeight()); shuffleDot.invalidateSelf();
        }
        postDelayed(this,250);
    }};
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
    private void applyBackground(Activity a) {
        if(chromeApplied)return;
        root=a.findViewById(0x7f09022f); panel=a.findViewById(0x7f09023a);
        if(root==null || panel==null || panel.getBackground()==null)return;
        rootBackground=root.getBackground();panelBackground=panel.getBackground();
        appliedBackground=getResources().getDrawable(0x7f08013c,getContext().getTheme());
        int left=root.getPaddingLeft(),top=root.getPaddingTop(),right=root.getPaddingRight(),bottom=root.getPaddingBottom();
        root.setBackground(appliedBackground);root.setPadding(left,top,right,bottom);panel.setBackground(null);
        chromeApplied=true;
    }
    private void restoreBackground() {
        if(!chromeApplied)return;
        if(root!=null && root.getBackground()==appliedBackground){
            int left=root.getPaddingLeft(),top=root.getPaddingTop(),right=root.getPaddingRight(),bottom=root.getPaddingBottom();
            root.setBackground(rootBackground);root.setPadding(left,top,right,bottom);
        }
        if(panel!=null && panel.getBackground()==null)panel.setBackground(panelBackground);
        root=null;panel=null;rootBackground=null;panelBackground=null;appliedBackground=null;chromeApplied=false;
    }
    private static final class PressEffect implements View.OnTouchListener {
        private final boolean ownHaptic;
        PressEffect(boolean ownHaptic){this.ownHaptic=ownHaptic;}
        @Override public boolean onTouch(View v,MotionEvent e){
            if(!v.isEnabled())return false;
            int action=e.getActionMasked();
            if(action!=MotionEvent.ACTION_DOWN && action!=MotionEvent.ACTION_UP && action!=MotionEvent.ACTION_CANCEL)return false;
            if(action==MotionEvent.ACTION_DOWN && ownHaptic)v.performHapticFeedback(HapticFeedbackConstants.KEYBOARD_TAP);
            boolean down=action==MotionEvent.ACTION_DOWN;
            v.animate().cancel();
            if(Build.VERSION.SDK_INT>=26 && !ValueAnimator.areAnimatorsEnabled()){v.setScaleX(1);v.setScaleY(1);}
            else v.animate().scaleX(down?0.95f:1f).scaleY(down?0.95f:1f).setDuration(150).start();
            return false;
        }
    }
    private View findCollapse(View v) {
        if("Réduire le lecteur".contentEquals(v.getContentDescription()==null?"":v.getContentDescription()))return v;
        if(v instanceof ViewGroup){ViewGroup g=(ViewGroup)v;for(int i=0;i<g.getChildCount();i++){View found=findCollapse(g.getChildAt(i));if(found!=null)return found;}}
        return null;
    }
    private void setupCosmetics(Activity a){
        if(setupDone)return;
        View p=a.findViewById(0x7f09023a);if(!(p instanceof ViewGroup))return;
        View collapse=findCollapse(p);
        repeatControl=p.findViewWithTag("repeat");shuffleControl=p.findViewWithTag("shuffle");
        View like=p.findViewWithTag("like"),tiles=p.findViewWithTag("previewPlayerTiles");
        View prev=a.findViewById(0x7f09023f),next=a.findViewById(0x7f090240),play=a.findViewById(0x7f09023e);
        if(collapse==null || !(repeatControl instanceof ImageView) || shuffleControl==null || like==null || tiles==null || play==null || prev==null || next==null)return;
        ((ImageView)repeatControl).setImageAlpha(0);
        repeatArt=new PreviewPlayerDecoration(repeatControl,true);repeatControl.getOverlay().add(repeatArt);
        shuffleDot=new PreviewPlayerDecoration(shuffleControl,false);shuffleControl.getOverlay().add(shuffleDot);
        for(View v:new View[]{collapse,prev,next,play})v.setOnTouchListener(new PressEffect(true));
        for(View v:new View[]{repeatControl,shuffleControl,like})v.setOnTouchListener(new PressEffect(false));
        if(tiles instanceof ViewGroup){ViewGroup group=(ViewGroup)tiles;for(int i=0;i<group.getChildCount();i++)group.getChildAt(i).setOnTouchListener(new PressEffect(false));}
        View seek=a.findViewById(0x7f09023d);
        if(seek instanceof SeekBar){
            SeekBar bar=(SeekBar)seek;
            GradientDrawable halo=new GradientDrawable();halo.setShape(GradientDrawable.OVAL);halo.setColor(0x447b3fe4);halo.setSize(dp(24),dp(24));
            GradientDrawable center=new GradientDrawable();center.setShape(GradientDrawable.OVAL);center.setColor(0xffffffff);center.setSize(dp(16),dp(16));
            LayerDrawable thumb=new LayerDrawable(new Drawable[]{halo,center});thumb.setLayerInset(1,dp(4),dp(4),dp(4),dp(4));
            bar.setThumbTintList(null);bar.setThumb(thumb);bar.setThumbOffset(dp(12));
            bar.setPadding(0,bar.getPaddingTop(),0,bar.getPaddingBottom());
        }
        setupDone=true;
    }
    private void stylePlay(Activity a){
        if(playStyled)return;
        View button=a.findViewById(0x7f09023e); if(button==null)return;
        GradientDrawable shape=new GradientDrawable(GradientDrawable.Orientation.BR_TL,new int[]{0xff7b3fe4,0xffe0489e});
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
        if(!playerVisible()){if(ticking){removeCallbacks(visualTick);ticking=false;}restoreHeader();restoreBackground();return;}
        Activity a=activity();if(a==null)return;
        hideHeader(a);applyBackground(a);stylePlay(a);sizeArtwork(a);setupCosmetics(a);
        if(setupDone && !ticking){ticking=true;post(visualTick);}
    }
    @Override public void onGlobalLayout(){sync();}
    @Override protected void onAttachedToWindow(){super.onAttachedToWindow();observer=getViewTreeObserver();observer.addOnGlobalLayoutListener(this);post(syncTask);}
    @Override protected void onDetachedFromWindow(){if(observer!=null && observer.isAlive())observer.removeOnGlobalLayoutListener(this);observer=null;removeCallbacks(syncTask);removeCallbacks(visualTick);ticking=false;restoreHeader();restoreBackground();super.onDetachedFromWindow();}
    @Override protected void onVisibilityChanged(View changed,int visibility){super.onVisibilityChanged(changed,visibility);if(syncTask!=null)post(syncTask);}
    @Override protected void onWindowVisibilityChanged(int visibility){super.onWindowVisibilityChanged(visibility);if(syncTask!=null)post(syncTask);}
}
