package com.melodix.music;

import android.app.Activity;
import android.animation.ValueAnimator;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.res.ColorStateList;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Rect;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.ColorDrawable;
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
import android.view.Window;
import android.view.WindowInsets;
import android.view.WindowManager;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.SeekBar;

/** Player-only layout and chrome. No player command, state or WebView access. */
public final class PreviewPlayerChrome extends View implements ViewTreeObserver.OnGlobalLayoutListener {
    private View header;
    private ViewTreeObserver observer;
    private int previousHeaderVisibility;
    private boolean headerHidden, playStyled, chromeApplied, setupDone, ticking, wasVisible;
    private View root, panel;
    private boolean closing, bypassClose;
    private Drawable rootBackground, panelBackground, appliedBackground, backdrop;
    private Bitmap previousScreen;
    private Window statusWindow;
    private Drawable statusOverlay;
    private View statusDecor;
    private int originalStatusColor, originalStatusFlags, originalStatusUi;
    private static final int PLAYER_STATUS_COLOR=0xff0a0614;
    private PreviewPlayerDecoration repeatArt, shuffleDot;
    private PreviewPlayerLikeArt likeArt;
    private View likeControl;
    private View repeatControl, shuffleControl;
    private final Runnable visualTick = new Runnable() { public void run() {
        if (!playerVisible()) { ticking=false; return; }
        Activity host=activity(); if (host!=null) { updateTint(host); breathe(host); }
        PreviewPlayerTiles.displayReport=report();
        if (repeatArt!=null && repeatControl!=null) {
            repeatArt.setBounds(0,0,repeatControl.getWidth(),repeatControl.getHeight()); repeatArt.invalidateSelf();
        }
        if (likeArt!=null && likeControl!=null) {
            likeArt.setBounds(0,0,likeControl.getWidth(),likeControl.getHeight());likeArt.invalidateSelf();
        }
        if (shuffleDot!=null && shuffleControl!=null) {
            CharSequence label=shuffleControl.getContentDescription();
            boolean active=label!=null && label.toString().startsWith("Lecture aléatoire activée");
            if(shuffleControl instanceof ImageView){
                ImageView icon=(ImageView)shuffleControl;icon.setColorFilter(active?0xffe0489e:0xffc9c0ea);icon.setImageAlpha(active?255:179);
            }
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
    /** Capture only the native shell before opening; never the hidden WebView. */
    public static void captureBeforeExpand(Activity a){
        View p=a.findViewById(0x7f09023a), r=a.findViewById(0x7f09022f);
        View v=p==null?null:p.findViewWithTag("previewPlayerChrome");
        if(!(v instanceof PreviewPlayerChrome)||r==null)return;
        PreviewPlayerChrome chrome=(PreviewPlayerChrome)v;
        chrome.previousScreen=null;
        if(Build.VERSION.SDK_INT>=26 && !ValueAnimator.areAnimatorsEnabled())return;
        int width=r.getWidth(),height=r.getHeight();
        if(width<=0||height<=0)return;
        try{
            // Limit memory; this is a temporary visual only and never persisted.
            float scale=Math.min(1f,(float)Math.sqrt(1200000.0/((double)width*height)));
            Bitmap bmp=Bitmap.createBitmap(Math.max(1,(int)(width*scale)),Math.max(1,(int)(height*scale)),Bitmap.Config.ARGB_8888);
            Canvas c=new Canvas(bmp);c.scale(scale,scale);r.draw(c);chrome.previousScreen=bmp;
        }catch(RuntimeException ignored){chrome.previousScreen=null;}catch(OutOfMemoryError ignored){chrome.previousScreen=null;}
    }
    /** Match the reader's dark top; restore only the window bits we touched. */
    private void applyStatusBar(Activity a){
        Window w=a.getWindow();if(w==null)return;
        View decor=w.getDecorView();if(decor==null)return;
        if(statusWindow==null){
            statusWindow=w;statusDecor=decor;originalStatusColor=w.getStatusBarColor();
            originalStatusFlags=w.getAttributes().flags;originalStatusUi=decor.getSystemUiVisibility();
            w.clearFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS);
            w.addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS);
            decor.setSystemUiVisibility(decor.getSystemUiVisibility() & ~View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR);
            w.setStatusBarColor(PLAYER_STATUS_COLOR);
        }
        // Android 15+ enforces a transparent status bar for target 35. Paint
        // only its inset in the decor overlay; system icons remain above it.
        if(Build.VERSION.SDK_INT>=35 && statusDecor==decor){
            WindowInsets insets=decor.getRootWindowInsets();int top=insets==null?0:insets.getSystemWindowInsetTop();
            if(top>0 && decor.getWidth()>0){
                if(statusOverlay==null){statusOverlay=new ColorDrawable(PLAYER_STATUS_COLOR);decor.getOverlay().add(statusOverlay);}
                statusOverlay.setBounds(0,0,decor.getWidth(),top);
            }
        }
    }
    private void restoreStatusBar(){
        if(statusDecor!=null && statusOverlay!=null)statusDecor.getOverlay().remove(statusOverlay);
        if(statusWindow!=null){
            if(statusWindow.getStatusBarColor()==PLAYER_STATUS_COLOR)statusWindow.setStatusBarColor(originalStatusColor);
            if((originalStatusFlags & WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS)!=0)statusWindow.addFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS);
            else statusWindow.clearFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS);
            if((originalStatusFlags & WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS)!=0)statusWindow.addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS);
            else statusWindow.clearFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS);
            if(statusDecor!=null){int ui=statusDecor.getSystemUiVisibility();statusDecor.setSystemUiVisibility((ui & ~View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR) | (originalStatusUi & View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR));}
        }
        statusWindow=null;statusDecor=null;statusOverlay=null;
    }
    private void applyBackground(Activity a) {
        if(chromeApplied)return;
        root=a.findViewById(0x7f09022f); panel=a.findViewById(0x7f09023a);
        if(root==null || panel==null || panel.getBackground()==null)return;
        rootBackground=root.getBackground();panelBackground=panel.getBackground();
        appliedBackground=getResources().getDrawable(0x7f08013c,getContext().getTheme());
        int left=root.getPaddingLeft(),top=root.getPaddingTop(),right=root.getPaddingRight(),bottom=root.getPaddingBottom();
        tintLayer=new GradientDrawable(GradientDrawable.Orientation.TOP_BOTTOM,new int[]{0,0});
        // Layers: violet base, blurred cover colours, dark scrim for contrast, light tint.
        scrim=new GradientDrawable(GradientDrawable.Orientation.TOP_BOTTOM,new int[]{0x400a0614,0xb30a0614,0xf20a0614});
        appliedBackground=new LayerDrawable(new Drawable[]{appliedBackground,new ColorDrawable(0),scrim,tintLayer});
        // Keep a still of the preceding native screen behind the moving player.
        // The player background must move with the panel, not stay on the root.
        backdrop=rootBackground;
        if(previousScreen!=null){BitmapDrawable image=new BitmapDrawable(getResources(),previousScreen);image.setGravity(android.view.Gravity.FILL);image.setFilterBitmap(true);backdrop=image;}
        root.setBackground(backdrop);root.setPadding(left,top,right,bottom);panel.setBackground(appliedBackground);tintSource=null;
        chromeApplied=true;
    }
    private void restoreBackground() {
        if(!chromeApplied){previousScreen=null;return;}
        if(root!=null && root.getBackground()==backdrop){
            int left=root.getPaddingLeft(),top=root.getPaddingTop(),right=root.getPaddingRight(),bottom=root.getPaddingBottom();
            root.setBackground(rootBackground);root.setPadding(left,top,right,bottom);
        }
        if(panel!=null && panel.getBackground()==appliedBackground)panel.setBackground(panelBackground);
        root=null;panel=null;rootBackground=null;panelBackground=null;appliedBackground=null;backdrop=null;previousScreen=null;tintLayer=null;scrim=null;tintSource=null;artPlaying=null;chromeApplied=false;
    }
    static String state="non affiché";
    private static String tintInfo="—", sizeInfo="—";
    public static String report(){return "\nAffichage lecteur : "+state+" ; fond : "+tintInfo+" ; pochette : "+sizeInfo;}
    private float artScale=1f;
    private GradientDrawable tintLayer, scrim;
    private Boolean artPlaying;
    private Drawable tintSource;
    /** Average colour of the artwork bitmap already on screen; no loading, no request. */
    static int dominant(Bitmap b){
        if(b==null||b.isRecycled()||b.getWidth()<=0||b.getHeight()<=0)return 0;
        long r=0,g=0,bl=0,n=0;int step=Math.max(1,Math.min(b.getWidth(),b.getHeight())/24);
        for(int y=0;y<b.getHeight();y+=step)for(int x=0;x<b.getWidth();x+=step){
            int c=b.getPixel(x,y);if(Color.alpha(c)<128)continue;
            int max=Math.max(Color.red(c),Math.max(Color.green(c),Color.blue(c))),min=Math.min(Color.red(c),Math.min(Color.green(c),Color.blue(c)));
            int w=1+(max-min)/32; // favour coloured pixels over greys
            r+=Color.red(c)*w;g+=Color.green(c)*w;bl+=Color.blue(c)*w;n+=w;
        }
        if(n==0)return 0;
        return Color.rgb((int)(r/n),(int)(g/n),(int)(bl/n));
    }
    /** Draws the drawable already shown into a tiny bitmap; null if impossible. */
    static Bitmap shrink(Drawable d,int size){
        if(d==null)return null;
        try{
            Bitmap out=Bitmap.createBitmap(size,size,Bitmap.Config.ARGB_8888);
            Rect old=new Rect(d.getBounds());d.setBounds(0,0,size,size);d.draw(new Canvas(out));d.setBounds(old);
            return out;
        }catch(RuntimeException e){return null;}
    }
    private void updateTint(Activity a){
        if(tintLayer==null){tintInfo="fond non appliqué";return;}
        View v=a.findViewById(0x7f090245);if(!(v instanceof ImageView))return;
        Drawable d=((ImageView)v).getDrawable();if(d==tintSource)return;tintSource=d;
        Bitmap small=shrink(d,12);
        int c=dominant(small);
        tintInfo=(d==null?"aucune image":d.getClass().getSimpleName())+(small==null?", échantillon impossible":c==0?", couleur nulle":String.format(", teinte #%06x",c&0xffffff));
        // Light tint: violet stays the base; the cover colour only washes the top.
        tintLayer.setColors(c==0?new int[]{0,0}:new int[]{(0x4d<<24)|(c&0xffffff),(0x14<<24)|(c&0xffffff),0});
        // Blurred backdrop: the cover reduced to a few pixels and smoothly scaled up.
        Drawable blob=new ColorDrawable(0);
        Bitmap tiny=shrink(d,5);
        if(tiny!=null){BitmapDrawable soft=new BitmapDrawable(getResources(),tiny);soft.setFilterBitmap(true);soft.setAlpha(165);blob=soft;}
        if(appliedBackground instanceof LayerDrawable&&((LayerDrawable)appliedBackground).getNumberOfLayers()==4)((LayerDrawable)appliedBackground).setDrawable(1,blob);
        View art=a.findViewById(0x7f09023a);art=art==null?null:art.findViewWithTag("previewPlayerArtCard");
        if(art!=null&&Build.VERSION.SDK_INT>=28){int glow=c==0?0xffe0489e:(0xff000000|c);art.setOutlineSpotShadowColor(glow);art.setOutlineAmbientShadowColor(glow);}
    }
    /** Cover slightly smaller while paused, full size while playing (display only). */
    private void breathe(Activity a){
        View play=a.findViewById(0x7f09023e),p=a.findViewById(0x7f09023a);
        View card=p==null?null:p.findViewWithTag("previewPlayerArtCard");
        if(play==null||card==null)return;
        CharSequence d=play.getContentDescription();String t=d==null?"":d.toString();
        boolean playing=t.startsWith("Mettre en pause")||t.startsWith("Lecture demandée");
        if(artPlaying!=null&&artPlaying==playing)return;
        boolean first=true;artPlaying=playing;float target=artScale; // no zoom on play/pause
        card.animate().cancel();
        if(first||(Build.VERSION.SDK_INT>=26&&!ValueAnimator.areAnimatorsEnabled())){card.setScaleX(target);card.setScaleY(target);}
        else card.animate().scaleX(target).scaleY(target).setDuration(420).setInterpolator(new android.view.animation.OvershootInterpolator(1.2f)).start();
    }
    /** ConstraintLayout max-size and ratio would distort an explicit square. */
    private static void clearConstraintLimits(View card){
        Object lp=card.getLayoutParams();
        for(String f:new String[]{"matchConstraintMaxWidth","matchConstraintMaxHeight"}){
            try{java.lang.reflect.Field x=lp.getClass().getField(f);if(x.getInt(lp)!=0)x.setInt(lp,0);}catch(Exception ignored){}
        }
        try{java.lang.reflect.Field x=lp.getClass().getField("dimensionRatio");if(x.get(lp)!=null)x.set(lp,null);}catch(Exception ignored){}
    }
    /** Keep skip icons a readable size whatever width their slot gets. */
    private void sizeSkips(Activity a){
        for(int id:new int[]{0x7f09023f,0x7f090240}){
            View v=a.findViewById(id);if(!(v instanceof ImageView)||v.getWidth()<=0)continue;
            int pad=Math.max(dp(4),(Math.min(v.getWidth(),v.getHeight())-dp(28))/2);
            if(v.getPaddingLeft()!=pad||v.getPaddingTop()!=pad){((ImageView)v).setScaleType(ImageView.ScaleType.FIT_CENTER);v.setPadding(pad,pad,pad,pad);}
        }
    }
    /** Landscape: centre the two columns vertically and let the cover use the height. */
    /** Height of a view's own content: weighted spacers (which stretch) are not counted. */
    private static int contentHeight(View v){
        if("previewPlayerSpacer".equals(v.getTag()))return 0;
        if(!(v instanceof LinearLayout)||((LinearLayout)v).getOrientation()!=LinearLayout.VERTICAL)return v.getMeasuredHeight();
        LinearLayout g=(LinearLayout)v;int sum=g.getPaddingTop()+g.getPaddingBottom();
        for(int i=0;i<g.getChildCount();i++){View c=g.getChildAt(i);if(c.getVisibility()==GONE)continue;sum+=contentHeight(c);
            ViewGroup.LayoutParams lp=c.getLayoutParams();if(lp instanceof ViewGroup.MarginLayoutParams)sum+=((ViewGroup.MarginLayoutParams)lp).topMargin+((ViewGroup.MarginLayoutParams)lp).bottomMargin;}
        return sum;
    }
    private void landscape(Activity a){
        View p=a.findViewById(0x7f09023a);if(!(p instanceof ScrollView))return;
        View frame=p.findViewWithTag("previewPlayerArtFrame"),card=p.findViewWithTag("previewPlayerArtCard");
        if(frame==null||card==null||!(frame.getParent() instanceof LinearLayout))return;
        LinearLayout row=(LinearLayout)frame.getParent();
        // Phone portrait layout (cover directly in the content column) is sized by sizeArtwork.
        if(row==getParent()||!(row.getParent() instanceof LinearLayout))return;
        boolean portrait=getResources().getConfiguration().orientation==1;
        ScrollView scroll=(ScrollView)p;if(!scroll.isFillViewport())scroll.setFillViewport(true);
        ViewGroup.LayoutParams lp=row.getLayoutParams();
        if(lp instanceof LinearLayout.LayoutParams&&((LinearLayout.LayoutParams)lp).weight!=1f){
            LinearLayout.LayoutParams l=(LinearLayout.LayoutParams)lp;l.height=0;l.weight=1f;row.setLayoutParams(l);
        }
        // Portrait: cover above the title, seek bar and buttons (one column).
        int wantOrientation=portrait?LinearLayout.VERTICAL:LinearLayout.HORIZONTAL;
        if(row.getOrientation()!=wantOrientation){
            row.setOrientation(wantOrientation);
            row.setGravity(portrait?android.view.Gravity.CENTER:android.view.Gravity.CENTER_VERTICAL);
            for(int i=0;i<row.getChildCount();i++){
                View child=row.getChildAt(i);ViewGroup.LayoutParams cl=child.getLayoutParams();
                if(!(cl instanceof LinearLayout.LayoutParams))continue;
                LinearLayout.LayoutParams l=(LinearLayout.LayoutParams)cl;
                if(portrait){l.width=ViewGroup.LayoutParams.MATCH_PARENT;l.weight=0;}
                child.setLayoutParams(l);
            }
        }else if(!portrait)row.setGravity(android.view.Gravity.CENTER_VERTICAL);
        int side_pad=portrait?dp(32):dp(56);
        if(p.getPaddingLeft()!=side_pad){p.setPadding(side_pad,p.getPaddingTop(),side_pad,p.getPaddingBottom());}
        ViewGroup.LayoutParams fm=frame.getLayoutParams();
        if(fm instanceof ViewGroup.MarginLayoutParams){
            ViewGroup.MarginLayoutParams m=(ViewGroup.MarginLayoutParams)fm;
            int right=portrait?0:dp(48),bottom=portrait?dp(32):dp(12);
            if(m.rightMargin!=right||m.bottomMargin!=bottom){m.rightMargin=right;m.bottomMargin=bottom;frame.setLayoutParams(m);}
        }
        // The seek bar uses negative side margins for its thumb: never clip it.
        for(ViewParent v=a.findViewById(0x7f09023d)==null?null:a.findViewById(0x7f09023d).getParent();v instanceof ViewGroup&&v!=p.getParent();v=v.getParent()){
            ((ViewGroup)v).setClipChildren(false);((ViewGroup)v).setClipToPadding(false);
        }
        // Portrait: the cover takes all the height the controls leave free.
        int controls=0;
        if(portrait)for(int i=0;i<row.getChildCount();i++){View child=row.getChildAt(i);if(child!=frame&&child.getVisibility()!=GONE)controls+=contentHeight(child);}
        int w=frame.getWidth(),h=portrait?row.getHeight()-controls-dp(56):row.getHeight()-dp(64);
        if(h<=0||w<=0)return;
        int side=Math.max(dp(120),Math.min(w,Math.min(h,dp(portrait?640:560))));
        ViewGroup.LayoutParams c=card.getLayoutParams(),f=frame.getLayoutParams();
        // The cover card keeps its layout limit (318dp) in minified builds; enlarge
        // it by scaling a square of that limit instead of changing its params.
        int base=Math.min(side,dp(318));
        if(c.width!=base||c.height!=base){c.width=base;c.height=base;card.setLayoutParams(c);}
        if(f.height!=side){f.height=side;frame.setLayoutParams(f);}
        float scale=(float)side/base;card.setTranslationY((side-base)/2f);
        if(Math.abs(scale-artScale)>0.01f){artScale=scale;artPlaying=null;}
        sizeInfo=(portrait?"portrait":"paysage")+", carré "+Math.round(side/getResources().getDisplayMetrics().density)+" dp, mesuré "+card.getWidth()+"×"+card.getHeight()+" px, échelle "+String.format("%.2f",artScale);
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
    /** Hooked into the existing native Back handler; no playback command is sent. */
    public static boolean interceptBack(Activity a) {
        View p=a.findViewById(0x7f09023a);
        if(p==null || !p.isShown())return false;
        View found=p.findViewWithTag("previewPlayerChrome");
        if(!(found instanceof PreviewPlayerChrome))return false;
        PreviewPlayerChrome chrome=(PreviewPlayerChrome)found;
        if(chrome.bypassClose)return false;
        if(chrome.closing)return true;
        if(Build.VERSION.SDK_INT>=26 && !ValueAnimator.areAnimatorsEnabled())return false;
        chrome.closeAnimated(a,p);
        return true;
    }
    private void closeAnimated(final Activity a,final View p){
        closing=true;
        p.animate().cancel();
        p.animate().translationY(Math.max(p.getHeight(),dp(300))).alpha(1f).setDuration(280)
            .setInterpolator(new android.view.animation.DecelerateInterpolator(1.3f)).withEndAction(new Runnable(){public void run(){
                if(!closing)return;
                closing=false; bypassClose=true;
                try { a.getClass().getMethod("onNativeBackClick",View.class).invoke(a,new Object[]{null}); }
                catch(Exception ignored) { p.setTranslationY(0f);p.setAlpha(1f); }
                finally {bypassClose=false;p.setTranslationY(0f);p.setAlpha(1f);}
            }}).start();
    }
    private void navigateBack(){
        Activity a=activity();if(a==null || closing)return;
        try { a.getClass().getMethod("onNativeBackClick",View.class).invoke(a,new Object[]{null}); }
        catch(Exception ignored) { }
        if(!closing){View p=a.findViewById(0x7f09023a);if(p!=null){p.setTranslationY(0f);p.setAlpha(1f);}}
    }
    /** Gesture is restricted to the header and artwork, never the seek bar or buttons. */
    private final class DismissGesture implements View.OnTouchListener {
        private float x,y; private boolean vertical, rejected;
        public boolean onTouch(View v,MotionEvent e){
            View p=activity()==null?null:activity().findViewById(0x7f09023a);
            if(p==null || closing)return false;
            int action=e.getActionMasked();
            if(action==MotionEvent.ACTION_DOWN){
                x=e.getRawX();y=e.getRawY();vertical=false;rejected=false;
                if(v.getParent()!=null)v.getParent().requestDisallowInterceptTouchEvent(true);p.animate().cancel();return true;
            }
            if(action==MotionEvent.ACTION_POINTER_DOWN){rejected=true;vertical=false;p.setTranslationY(0f);p.setAlpha(1f);return true;}
            float dx=e.getRawX()-x,dy=e.getRawY()-y;
            if(action==MotionEvent.ACTION_MOVE){
                if(!vertical && !rejected && (Math.abs(dx)>dp(12)||Math.abs(dy)>dp(12))){
                    if(dy>0 && dy>Math.abs(dx)*1.3f)vertical=true;else rejected=true;
                }
                if(vertical){float distance=Math.max(0f,dy);p.setTranslationY(distance);p.setAlpha(1f);}
                return true;
            }
            if(action==MotionEvent.ACTION_UP || action==MotionEvent.ACTION_CANCEL){
                if(v.getParent()!=null)v.getParent().requestDisallowInterceptTouchEvent(false);
                if(action==MotionEvent.ACTION_UP && vertical && dy>Math.max(dp(90),p.getHeight()*.16f))navigateBack();
                else if(Build.VERSION.SDK_INT>=26 && !ValueAnimator.areAnimatorsEnabled()){p.setTranslationY(0f);p.setAlpha(1f);}
                else p.animate().translationY(0f).alpha(1f).setDuration(200).setInterpolator(new android.view.animation.DecelerateInterpolator()).start();
                vertical=false;return true;
            }
            return true;
        }
    }
    private void setupCosmetics(Activity a){
        if(setupDone)return;
        View p=a.findViewById(0x7f09023a);if(!(p instanceof ViewGroup))return;
        View collapse=findCollapse(p);
        repeatControl=p.findViewWithTag("repeat");shuffleControl=p.findViewWithTag("shuffle");
        View like=p.findViewWithTag("like"),tiles=p.findViewWithTag("previewPlayerTiles");
        View prev=a.findViewById(0x7f09023f),next=a.findViewById(0x7f090240),play=a.findViewById(0x7f09023e);
        if(collapse==null || !(repeatControl instanceof ImageView) || shuffleControl==null || like==null || tiles==null || play==null || prev==null || next==null)return;
        ((ViewGroup)p).setClipChildren(false);((ViewGroup)p).setClipToPadding(false);
        ViewParent contentParent=getParent();
        if(contentParent instanceof ViewGroup){((ViewGroup)contentParent).setClipChildren(false);((ViewGroup)contentParent).setClipToPadding(false);}
        View art=p.findViewWithTag("previewPlayerArtCard"),frame=p.findViewWithTag("previewPlayerArtFrame");
        View handle=p.findViewWithTag("previewPlayerDragHandle");
        if(handle!=null)handle.setOnTouchListener(new DismissGesture());
        if(art!=null)art.setOnTouchListener(new DismissGesture());
        if(frame instanceof ViewGroup){((ViewGroup)frame).setClipChildren(false);((ViewGroup)frame).setClipToPadding(false);}
        if(art!=null && Build.VERSION.SDK_INT>=28){art.setOutlineSpotShadowColor(0xffe0489e);art.setOutlineAmbientShadowColor(0xffe0489e);}
        if(like instanceof ImageView){
            likeControl=like;
            GradientDrawable glass=new GradientDrawable();glass.setShape(GradientDrawable.OVAL);glass.setColor(0x17ffffff);glass.setStroke(dp(1),0x24ffffff);
            like.setBackgroundTintList(null);like.setBackground(new RippleDrawable(ColorStateList.valueOf(0x44ffffff),glass,null));
            ((ImageView)like).setImageAlpha(0);likeArt=new PreviewPlayerLikeArt(like);like.getOverlay().add(likeArt);
        }
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
            bar.setPadding(dp(12),bar.getPaddingTop(),dp(12),bar.getPaddingBottom());
            Drawable progress=bar.getProgressDrawable();
            if(progress instanceof LayerDrawable){
                LayerDrawable layers=(LayerDrawable)progress.mutate();
                Drawable track=layers.findDrawableByLayerId(android.R.id.background);
                if(track instanceof GradientDrawable)((GradientDrawable)track).setColor(0x55ffffff);
            }
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
        if(getResources().getConfiguration().fontScale<=1.3f && available>=limit)limit=Math.min(dp(342),frame.getWidth());
        int side=getResources().getConfiguration().fontScale>1.3f?limit:Math.min(limit,Math.max(dp(80),available));
        if(side<=0)return;
        ViewGroup.LayoutParams c=card.getLayoutParams();
        if(f.height!=side){f.height=side;frame.setLayoutParams(f);}
        if(c.width!=side || c.height!=side){c.width=side;c.height=side;card.setLayoutParams(c);}
    }
    private void sync(){
        if(!playerVisible()){state="non affiché";
            if(closing){closing=false;View p=activity()==null?null:activity().findViewById(0x7f09023a);if(p!=null){p.animate().cancel();p.setTranslationY(0f);p.setAlpha(1f);}}
            if(wasVisible && getParent() instanceof View){View content=(View)getParent();content.animate().cancel();content.setAlpha(1f);content.setTranslationY(0f);}
            wasVisible=false;
            if(ticking){removeCallbacks(visualTick);ticking=false;}restoreHeader();restoreBackground();restoreStatusBar();return;
        }
        Activity a=activity();if(a==null)return;
        boolean opening=!wasVisible;wasVisible=true;
        state="affiché, "+(getResources().getConfiguration().orientation==2?"paysage":"portrait");
        hideHeader(a);applyBackground(a);applyStatusBar(a);stylePlay(a);sizeArtwork(a);landscape(a);sizeSkips(a);setupCosmetics(a);updateTint(a);
        if(opening){
            View p=a.findViewById(0x7f09023a);
            if(p!=null && (Build.VERSION.SDK_INT<26 || ValueAnimator.areAnimatorsEnabled())){
                p.animate().cancel();p.setAlpha(1f);p.setTranslationY(Math.max(p.getHeight(),dp(300)));
                p.animate().translationY(0f).setDuration(340).setInterpolator(new android.view.animation.DecelerateInterpolator(1.6f)).start();
            }
        }
        if(setupDone && !ticking){ticking=true;post(visualTick);}
        PreviewPlayerTiles.displayReport=report();
    }
    @Override public void onGlobalLayout(){sync();}
    @Override protected void onAttachedToWindow(){super.onAttachedToWindow();observer=getViewTreeObserver();observer.addOnGlobalLayoutListener(this);post(syncTask);}
    @Override protected void onDetachedFromWindow(){closing=false;Activity a=activity();View p=a==null?null:a.findViewById(0x7f09023a);if(p!=null){p.animate().cancel();p.setAlpha(1f);p.setTranslationY(0f);}if(observer!=null && observer.isAlive())observer.removeOnGlobalLayoutListener(this);observer=null;removeCallbacks(syncTask);removeCallbacks(visualTick);ticking=false;restoreHeader();restoreBackground();restoreStatusBar();super.onDetachedFromWindow();}
    @Override protected void onVisibilityChanged(View changed,int visibility){super.onVisibilityChanged(changed,visibility);if(syncTask!=null)post(syncTask);}
    @Override protected void onWindowVisibilityChanged(int visibility){super.onWindowVisibilityChanged(visibility);if(syncTask!=null)post(syncTask);}
}
