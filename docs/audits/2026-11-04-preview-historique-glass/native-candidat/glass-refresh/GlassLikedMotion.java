package com.melodix.music;

import android.animation.ValueAnimator;
import android.app.Activity;
import android.graphics.Rect;
import android.os.Build;
import android.provider.Settings;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.animation.DecelerateInterpolator;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import java.lang.ref.WeakReference;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Set;
import java.util.WeakHashMap;

/** Presentation only: no touch interception, navigation, playback or metadata. */
public final class GlassLikedMotion implements ViewTreeObserver.OnScrollChangedListener,
        ViewTreeObserver.OnGlobalLayoutListener, View.OnAttachStateChangeListener, Runnable {
    private static final WeakHashMap<ScrollView,WeakReference<GlassLikedMotion>> INSTANCES = new WeakHashMap<ScrollView,WeakReference<GlassLikedMotion>>();
    private final ScrollView scroll;
    private ViewTreeObserver observer;
    private LinearLayout content;
    private ViewGroup rows;
    private String collection="";
    private final HashMap<View,Integer> visible = new HashMap<View,Integer>();
    private final Set<Integer> preserve = new HashSet<Integer>();
    private final HashMap<View,Integer> heroVisible = new HashMap<View,Integer>();
    private boolean scheduled, enabled, quiet;
    // Collection whose rows were torn down by a re-render (not by navigation): its next bind must not replay the entrance.
    private static String rerendered;
    private int lastY;
    private final Rect bounds = new Rect();

    private GlassLikedMotion(ScrollView view) {
        scroll=view; view.addOnAttachStateChangeListener(this); listen();
    }
    public static void bind(Activity a,LinearLayout content,String screen,String uri) {
        if(a==null)return;
        View v=a.findViewById(0x7f090239);
        if(!(v instanceof ScrollView))return;
        ScrollView s=(ScrollView)v;
        WeakReference<GlassLikedMotion> ref=INSTANCES.get(s);
        GlassLikedMotion m=ref==null?null:ref.get();
        boolean scope="detail".equals(screen) && (GlassScreenStyler.liked(uri) || GlassScreenStyler.playlist(uri));
        if(!scope || content==null || content.getChildCount()!=1 || !(content.getChildAt(0) instanceof ViewGroup)) {
            String keep=scope && m!=null && m.collection.equals(uri) ? uri : null;
            if(m!=null)m.dispose();
            rerendered=keep;return;
        }
        if(m==null){m=new GlassLikedMotion(s);INSTANCES.put(s,new WeakReference<GlassLikedMotion>(m));}
        m.setRows(content,(ViewGroup)content.getChildAt(0),uri);
    }
    private void listen() {
        if(!scroll.isAttachedToWindow())return;
        ViewTreeObserver next=scroll.getViewTreeObserver();
        if(observer==next && observer.isAlive())return;
        unlisten();observer=next;
        if(observer.isAlive()){observer.addOnScrollChangedListener(this);observer.addOnGlobalLayoutListener(this);}
    }
    private void unlisten() {
        if(observer!=null && observer.isAlive()){
            observer.removeOnScrollChangedListener(this);observer.removeOnGlobalLayoutListener(this);
        }
        observer=null;
    }
    private void setRows(LinearLayout parent,ViewGroup next,String uri) {
        if(rows!=next || !collection.equals(uri)){
            preserve.clear();
            if(enabled && content==parent && collection.equals(uri)){preserve.addAll(visible.values());preserve.addAll(heroVisible.values());}
            quiet=uri.equals(rerendered) || (enabled && collection.equals(uri));rerendered=null;
            resetAll();content=parent;rows=next;collection=uri;lastY=scroll.getScrollY();
        }
        enabled=true;listen();schedule();
    }
    private void schedule() {
        if(enabled && !scheduled){scheduled=true;scroll.postOnAnimation(this);}
    }
    private boolean motionOff() {
        if(Build.VERSION.SDK_INT>=26)return !ValueAnimator.areAnimatorsEnabled();
        try {return Settings.Global.getFloat(scroll.getContext().getContentResolver(), "animator_duration_scale", 1f)==0f;}
        catch (RuntimeException ignored) {return true;}
    }
    private static boolean parts(View row) {
        if(!(row instanceof ViewGroup) || "glass-playlist-hero".equals(row.getTag()))return false;
        ViewGroup g=(ViewGroup)row;
        return g.getChildCount()>=2 && g.getChildAt(0) instanceof ImageView && g.getChildAt(1) instanceof ViewGroup;
    }
    private void part(View v, int vertical, int delay) {
        if(v==null || v.getVisibility()!=View.VISIBLE)return;
        float density=v.getResources().getDisplayMetrics().density;
        v.animate().cancel();v.setAlpha(.35f);v.setTranslationY(vertical*8*density);v.setTranslationX(5*density);
        v.animate().alpha(1f).translationY(0f).translationX(0f).setStartDelay(delay).setDuration(240)
            .setInterpolator(new DecelerateInterpolator(1.5f)).start();
    }
    private void animateRow(View row,int direction) {
        if(!parts(row))return;
        ViewGroup g=(ViewGroup)row;part(g.getChildAt(0),direction,0);
        ViewGroup labels=(ViewGroup)g.getChildAt(1);
        for(int i=0;i<labels.getChildCount() && i<2;i++)if(labels.getChildAt(i) instanceof TextView)part(labels.getChildAt(i),direction,30+i*25);
    }
    private static void reset(View v) {v.animate().cancel();v.setAlpha(1f);v.setTranslationX(0f);v.setTranslationY(0f);}
    private static void resetRow(View row) {
        if(!parts(row))return;
        ViewGroup g=(ViewGroup)row;reset(g.getChildAt(0));ViewGroup labels=(ViewGroup)g.getChildAt(1);
        for(int i=0;i<labels.getChildCount() && i<2;i++)if(labels.getChildAt(i) instanceof TextView)reset(labels.getChildAt(i));
    }
    private void resetAll() {
        for(View row:visible.keySet())resetRow(row);visible.clear();
        for(View part:heroVisible.keySet())reset(part);heroVisible.clear();
    }
    private void hero(int direction) {
        HashMap<View,Integer> next=new HashMap<View,Integer>();
        if(rows.getChildCount()>0 && rows.getChildAt(0) instanceof ViewGroup &&
           "glass-playlist-hero".equals(rows.getChildAt(0).getTag())) {
            ViewGroup hero=(ViewGroup)rows.getChildAt(0);
            for(int i=0;i<hero.getChildCount() && i<4;i++) {
                View child=hero.getChildAt(i);Rect r=new Rect();int key=-1-i;
                if(child.getGlobalVisibleRect(r) && r.height()>0){
                    next.put(child,key);
                    if(!heroVisible.containsKey(child) && !preserve.contains(key))part(child,direction,i*30);
                }
            }
        }
        for(View child:heroVisible.keySet())if(!next.containsKey(child))reset(child);
        heroVisible.clear();heroVisible.putAll(next);
    }
    @Override public void run() {
        scheduled=false;
        if(!enabled || rows==null || content==null)return;
        if(rows.getParent()!=content || !scroll.isAttachedToWindow()){String keep=scroll.isAttachedToWindow()?collection:null;dispose();rerendered=keep;return;}
        if(motionOff()){resetAll();preserve.clear();return;}
        if(!rows.getLocalVisibleRect(bounds) || bounds.height()<=0){resetAll();preserve.clear();return;}
        int y=scroll.getScrollY(), direction=y<lastY?-1:1;lastY=y;
        if(quiet){quiet=false;markVisible();return;}
        hero(direction);
        int n=rows.getChildCount(),lo=0,hi=n;
        // Children are laid out vertically in order: logarithmic seek plus the
        // visible range, not a traversal of thousands of off-screen tracks.
        while(lo<hi){int mid=(lo+hi)>>>1;if(rows.getChildAt(mid).getBottom()<=bounds.top)lo=mid+1;else hi=mid;}
        HashMap<View,Integer> next=new HashMap<View,Integer>();
        for(int i=lo;i<n;i++){
            View row=rows.getChildAt(i);if(row.getTop()>=bounds.bottom)break;
            if(!parts(row))continue;next.put(row,i);
            if(!visible.containsKey(row) && !preserve.contains(i))animateRow(row,direction);
        }
        for(View row:visible.keySet())if(!next.containsKey(row))resetRow(row);
        visible.clear();visible.putAll(next);preserve.clear();
    }
    /** Same list repainted: take the visible rows as already shown. */
    private void markVisible() {
        visible.clear();heroVisible.clear();preserve.clear();
        if(rows.getChildCount()>0 && "glass-playlist-hero".equals(rows.getChildAt(0).getTag()) && rows.getChildAt(0) instanceof ViewGroup){
            ViewGroup hero=(ViewGroup)rows.getChildAt(0);for(int i=0;i<hero.getChildCount() && i<4;i++)heroVisible.put(hero.getChildAt(i),-1-i);
        }
        for(int i=0;i<rows.getChildCount();i++){View r=rows.getChildAt(i);if(r.getTop()>=bounds.bottom)break;if(r.getBottom()>bounds.top && parts(r))visible.put(r,i);}
    }
    private void dispose() {
        enabled=false;scroll.removeCallbacks(this);scheduled=false;resetAll();preserve.clear();unlisten();
        scroll.removeOnAttachStateChangeListener(this);INSTANCES.remove(scroll);content=null;rows=null;collection="";
    }
    @Override public void onScrollChanged(){schedule();}
    @Override public void onGlobalLayout(){schedule();}
    @Override public void onViewAttachedToWindow(View v){listen();schedule();}
    @Override public void onViewDetachedFromWindow(View v){dispose();}
}
