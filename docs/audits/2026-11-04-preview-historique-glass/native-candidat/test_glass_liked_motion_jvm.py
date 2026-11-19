#!/usr/bin/env python3
"""Actual animation helper on deterministic JVM stubs, not Android rendering."""
import os, subprocess, tempfile
from pathlib import Path
from test_glass_screen_refresh_jvm import STUBS
HERE=Path(__file__).resolve().parent
S=dict(STUBS)
S.pop('com/melodix/music/RefreshTest.java'); S.pop('com/melodix/music/GlassLikedMotion.java')
S.update({
'android/app/Activity.java':'''package android.app; public class Activity extends android.content.Context {public android.view.View scroll; public android.view.View findViewById(int id){return scroll;}}''',
'android/content/Context.java':'''package android.content; public class Context { public android.content.res.Resources getResources(){return new android.content.res.Resources();}public ContentResolver getContentResolver(){return new ContentResolver();} }''',
'android/content/ContentResolver.java':'''package android.content; public class ContentResolver {}''',
'android/provider/Settings.java':'''package android.provider;public class Settings {public static class Global{public static float scale=1; public static float getFloat(android.content.ContentResolver r,String key,float d){return scale;}}}''',
'android/animation/ValueAnimator.java':'''package android.animation; public class ValueAnimator {public static boolean enabled=true;public static boolean areAnimatorsEnabled(){return enabled;}}''',
'android/os/Build.java':'''package android.os;public class Build {public static class VERSION {public static int SDK_INT=35;}}''',
'android/graphics/Rect.java':'''package android.graphics;public class Rect {public int top,bottom;public int height(){return bottom-top;}}''',
'android/view/animation/DecelerateInterpolator.java':'''package android.view.animation; public class DecelerateInterpolator {public DecelerateInterpolator(float f){}}''',
'android/view/ViewTreeObserver.java':'''package android.view;import java.util.*;public class ViewTreeObserver {public interface OnScrollChangedListener{void onScrollChanged();}public interface OnGlobalLayoutListener{void onGlobalLayout();}public int sc,gl;public boolean isAlive(){return true;}public void addOnScrollChangedListener(OnScrollChangedListener l){sc++;}public void addOnGlobalLayoutListener(OnGlobalLayoutListener l){gl++;}public void removeOnScrollChangedListener(OnScrollChangedListener l){sc--;}public void removeOnGlobalLayoutListener(OnGlobalLayoutListener l){gl--;}}''',
'android/view/ViewPropertyAnimator.java':'''package android.view;import android.view.animation.DecelerateInterpolator; public class ViewPropertyAnimator {View v;ViewPropertyAnimator(View x){v=x;}public void cancel(){} public ViewPropertyAnimator alpha(float f){v.alpha=f;return this;}public ViewPropertyAnimator translationY(float f){v.ty=f;return this;}public ViewPropertyAnimator translationX(float f){v.tx=f;return this;}public ViewPropertyAnimator setStartDelay(long n){return this;}public ViewPropertyAnimator setDuration(long n){return this;}public ViewPropertyAnimator setInterpolator(DecelerateInterpolator i){return this;}public void start(){v.starts++;}}''',
'android/view/View.java':'''package android.view;import android.content.Context;import android.graphics.Rect;import android.graphics.drawable.Drawable;import android.content.res.Resources; public class View {public interface OnAttachStateChangeListener{void onViewAttachedToWindow(View v);void onViewDetachedFromWindow(View v);}public static final int IMPORTANT_FOR_ACCESSIBILITY_NO=2,VISIBLE=0;public static int clipTop=0,clipBottom=100;protected Context ctx;private Object tag;private ViewGroup parent;private ViewGroup.LayoutParams params;public boolean clickable,attached=true;public Drawable background;public int top,bottom=10,starts,visibility=0;public float alpha=1,tx,ty,lastInitialY; public View(Context c){ctx=c;}public Context getContext(){return ctx;}public Resources getResources(){return ctx.getResources();}public void setPadding(int a,int b,int c,int d){}public void setBackground(Drawable d){background=d;}public boolean isClickable(){return clickable;}public void setClickable(boolean c){clickable=c;}public void setMinimumHeight(int v){}public void setImportantForAccessibility(int i){}public void setClipToOutline(boolean b){}public ViewGroup getParent(){return parent;}public void parent(ViewGroup p){parent=p;}public ViewGroup.LayoutParams getLayoutParams(){return params;}public void setLayoutParams(ViewGroup.LayoutParams p){params=p;}public void setTag(Object o){tag=o;}public Object getTag(){return tag;}public View findViewWithTag(Object t){return t.equals(tag)?this:null;}public int getTop(){return top;}public int getBottom(){return bottom;}public int getVisibility(){return visibility;}public void setAlpha(float f){alpha=f;}public void setTranslationY(float f){ty=f;if(f!=0)lastInitialY=f;}public void setTranslationX(float f){tx=f;}public ViewPropertyAnimator animate(){return new ViewPropertyAnimator(this);}public boolean isAttachedToWindow(){return attached;}public boolean getLocalVisibleRect(Rect r){r.top=clipTop;r.bottom=clipBottom;return clipBottom>clipTop;}public boolean getGlobalVisibleRect(Rect r){r.top=Math.max(top,clipTop);r.bottom=Math.min(bottom,clipBottom);return r.bottom>r.top;} public void setElevation(float e){}public void setBackgroundColor(int c){}public boolean postDelayed(Runnable r,long d){return true;}}''',
'android/view/ViewGroup.java':'''package android.view;import android.content.Context;import java.util.*;public class ViewGroup extends View{public static int gets;public static class LayoutParams{public int width,height;public LayoutParams(int w,int h){width=w;height=h;}}public static class MarginLayoutParams extends LayoutParams{public int bottomMargin,topMargin,rightMargin;public MarginLayoutParams(int w,int h){super(w,h);}}protected List<View> children=new ArrayList<View>();public ViewGroup(Context c){super(c);}public int getChildCount(){return children.size();}public View getChildAt(int i){gets++;return children.get(i);}public void removeViewAt(int i){View v=children.remove(i);v.parent(null);}public void removeView(View v){children.remove(v);v.parent(null);}public void addView(View v){addView(v,children.size(),new LayoutParams(-1,-2));}public void addView(View v,int i){addView(v,i,new LayoutParams(-1,-2));}public void addView(View v,LayoutParams p){addView(v,children.size(),p);}public void addView(View v,int i,LayoutParams p){children.add(i,v);v.parent(this);v.setLayoutParams(p);}public View findViewWithTag(Object t){View v=super.findViewWithTag(t);if(v!=null)return v;for(View c:children){v=c.findViewWithTag(t);if(v!=null)return v;}return null;}}''',
'android/widget/ScrollView.java':'''package android.widget;import android.content.Context;import android.view.*;public class ScrollView extends ViewGroup{public int y,attachListeners;public ViewTreeObserver obs=new ViewTreeObserver();public Runnable pending;public OnAttachStateChangeListener listener;public ScrollView(Context c){super(c);}public int getScrollY(){return y;}public ViewTreeObserver getViewTreeObserver(){return obs;}public void addOnAttachStateChangeListener(OnAttachStateChangeListener l){listener=l;attachListeners++;}public void removeOnAttachStateChangeListener(OnAttachStateChangeListener l){attachListeners--;listener=null;}public void postOnAnimation(Runnable r){pending=r;}public void removeCallbacks(Runnable r){if(pending==r)pending=null;}public void flush(){Runnable r=pending;pending=null;if(r!=null)r.run();}}''',
'com/melodix/music/MotionTest.java':r'''package com.melodix.music;
import android.app.Activity;import android.widget.*;import android.view.*;import android.animation.ValueAnimator;
public class MotionTest {
 static void yes(boolean v,String m){if(!v)throw new AssertionError(m);}
 static LinearLayout row(Activity a,int i){LinearLayout r=new LinearLayout(a);r.top=i*10;r.bottom=r.top+10;ImageView im=new ImageView(a);r.addView(im);LinearLayout labels=new LinearLayout(a);labels.addView(new TextView(a));labels.addView(new TextView(a));r.addView(labels);return r;}
 static ImageView image(ViewGroup rows,int i){return (ImageView)((ViewGroup)rows.getChildAt(i)).getChildAt(0);}
 static void move(ScrollView s,int y,GlassLikedMotion m){s.y=y;View.clipTop=y;View.clipBottom=y+40;m.onScrollChanged();s.flush();}
 public static void main(String[] args){
  Activity a=new Activity();ScrollView s=new ScrollView(a);a.scroll=s;LinearLayout content=new LinearLayout(a),rows=new LinearLayout(a);content.addView(rows);
  for(int i=0;i<10000;i++)rows.addView(row(a,i)); View.clipTop=0;View.clipBottom=40;ViewGroup.gets=0;
  GlassLikedMotion.bind(a,content,"detail","spotify:collection:tracks");s.flush();
  yes(s.obs.sc==1&&s.obs.gl==1&&s.attachListeners==1,"single listener");yes(image(rows,0).starts==1,"initial entrance");yes(ViewGroup.gets<120,"bounded first render");
  GlassLikedMotion.bind(a,content,"detail","spotify:collection:tracks");s.flush();yes(s.obs.sc==1&&image(rows,0).starts==1,"no duplicate listener/animation");
  GlassLikedMotion m=(GlassLikedMotion)s.listener;ViewGroup.gets=0;move(s,80,m);yes(image(rows,8).starts==1&&image(rows,8).lastInitialY>0,"down entrance");yes(ViewGroup.gets<150,"bounded scroll");
  move(s,0,m);yes(image(rows,0).starts==2&&image(rows,0).lastInitialY<0,"up entrance");yes(image(rows,8).alpha==1&&image(rows,8).ty==0,"exited row reset");
  ValueAnimator.enabled=false;move(s,80,m);yes(image(rows,8).starts==1,"animation disabled");yes(image(rows,0).alpha==1,"disabled reset");ValueAnimator.enabled=true;android.os.Build.VERSION.SDK_INT=24;android.provider.Settings.Global.scale=0;move(s,0,m);yes(image(rows,0).starts==2,"API 24 disabled");android.os.Build.VERSION.SDK_INT=35;
  GlassLikedMotion.bind(a,content,"other","spotify:collection:tracks");yes(s.obs.sc==0&&s.obs.gl==0&&s.attachListeners==0,"dispose on navigation");
  View.clipTop=0;View.clipBottom=40;s.y=0;
  LinearLayout heroRows=new LinearLayout(a),hero=new LinearLayout(a);hero.setTag("glass-playlist-hero");hero.top=0;hero.bottom=40;
  for(int i=0;i<4;i++){TextView child=new TextView(a);child.top=i*10;child.bottom=child.top+10;hero.addView(child);}heroRows.addView(hero);
  for(int i=4;i<12;i++)heroRows.addView(row(a,i));content.removeView(rows);content.addView(heroRows);
  GlassLikedMotion.bind(a,content,"detail","spotify:collection:tracks");s.flush();m=(GlassLikedMotion)s.listener;
  yes(hero.getChildAt(0).starts==1&&hero.getChildAt(2).starts==1,"art and title entrance");
  move(s,40,m);move(s,0,m);yes(hero.getChildAt(0).starts==2&&hero.getChildAt(0).lastInitialY<0,"hero return upward");
  LinearLayout replacement=new LinearLayout(a),hero2=new LinearLayout(a);hero2.setTag("glass-playlist-hero");hero2.top=0;hero2.bottom=40;
  for(int i=0;i<4;i++){TextView child=new TextView(a);child.top=i*10;child.bottom=child.top+10;hero2.addView(child);}replacement.addView(hero2);replacement.addView(row(a,4));
  content.removeView(heroRows);content.addView(replacement);GlassLikedMotion.bind(a,content,"detail","spotify:collection:tracks");s.flush();
  yes(hero2.getChildAt(0).starts==0,"partial refresh preserves visible hero");
  GlassLikedMotion.bind(a,content,"detail","spotify:playlist:Other");s.flush();yes(hero2.getChildAt(0).starts==1,"another playlist animates instead of inheriting old cache");
  move(s,40,m);yes(image(replacement,1).starts==1 && image(replacement,1).lastInitialY>0,"ordinary playlist row downward");
  move(s,80,m);move(s,40,m);yes(image(replacement,1).starts==2 && image(replacement,1).lastInitialY<0,"ordinary playlist row upward");
  move(s,0,m);yes(hero2.getChildAt(0).starts==2,"ordinary playlist hero scroll");
  GlassLikedMotion.bind(a,content,"detail","spotify:album:NotAPlaylist");yes(s.obs.sc==0,"album is not in playlist animation scope");
  GlassLikedMotion.bind(a,content,"detail","spotify:playlist:Other");s.flush();m=(GlassLikedMotion)s.listener;
  m.onViewDetachedFromWindow(s);yes(s.obs.sc==0&&s.obs.gl==0&&s.attachListeners==0&&s.pending==null,"detach cleanup");
  // Liked Songs repaints (copy, bridge, pages) briefly change the content shape: no entrance replay after that.
  LinearLayout again=new LinearLayout(a);again.addView(row(a,0));content.removeView(replacement);content.addView(again);s.attached=true;
  GlassLikedMotion.bind(a,content,"detail","spotify:collection:tracks");s.flush();int first=image(again,0).starts;
  content.addView(new TextView(a));GlassLikedMotion.bind(a,content,"detail","spotify:collection:tracks");content.removeViewAt(1);
  LinearLayout repaint=new LinearLayout(a);repaint.addView(row(a,0));content.removeView(again);content.addView(repaint);
  GlassLikedMotion.bind(a,content,"detail","spotify:collection:tracks");s.flush();yes(first==1&&image(repaint,0).starts==0,"same list repaint keeps rows still");
  System.out.println("Glass liked motion JVM simulation passed (10,000 rows)");
 }
}'''
})
def main():
 with tempfile.TemporaryDirectory(prefix='glass-motion-jvm-') as tmp:
  root=Path(tmp);files=[]
  for name,text in S.items():
   p=root/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(text,encoding='utf8');files.append(str(p))
  files.extend(str(HERE/'glass-refresh'/n) for n in ('GlassScreenStyler.java','GlassLikedMotion.java'));out=root/'classes';out.mkdir()
  ecj=os.environ.get('PREVIEW_TEST_ECJ');java=os.environ.get('PREVIEW_TEST_JAVA','java');compiler=[java,'-cp',ecj,'org.eclipse.jdt.internal.compiler.batch.Main'] if ecj else ['javac']
  subprocess.run(compiler+['-encoding','UTF-8','-source','8','-target','8','-d',str(out)]+files,check=True)
  subprocess.run([java,'-cp',str(out),'com.melodix.music.MotionTest'],check=True)
if __name__=='__main__':main()
