#!/usr/bin/env python3
"""Run the actual visual Java against deterministic view stubs; not Android rendering."""
import os,subprocess,tempfile
from pathlib import Path
HERE=Path(__file__).resolve().parent
STUBS={
'android/content/Context.java':'''package android.content; public class Context { public static java.io.File files; public android.content.res.Resources getResources(){return new android.content.res.Resources();} public java.io.File getFilesDir(){if(files==null)try{files=java.nio.file.Files.createTempDirectory("home").toFile();}catch(Exception e){throw new RuntimeException(e);}return files;} }''',
'android/app/Activity.java':'''package android.app; public class Activity extends android.content.Context {}''',
'android/util/DisplayMetrics.java':'''package android.util; public class DisplayMetrics {public float density=1;}''',
'android/content/res/Resources.java':'''package android.content.res; public class Resources {public android.util.DisplayMetrics getDisplayMetrics(){return new android.util.DisplayMetrics();}}''',
'android/content/res/ColorStateList.java':'''package android.content.res;public class ColorStateList{public static ColorStateList valueOf(int i){return new ColorStateList();}}''',
'android/graphics/Typeface.java':'''package android.graphics;public class Typeface{public static final Typeface DEFAULT=new Typeface();public static final int BOLD=1,NORMAL=0;public static Typeface create(String f,int s){return DEFAULT;}}''',
'android/graphics/Color.java':'''package android.graphics;public class Color{public static int red(int c){return c>>16&255;}public static int green(int c){return c>>8&255;}public static int blue(int c){return c&255;}public static int rgb(int r,int g,int b){return 0xff000000|r<<16|g<<8|b;}public static void colorToHSV(int c,float[] h){}public static int HSVToColor(float[] h){return 0xff808080;}}''',
'android/graphics/Bitmap.java':'''package android.graphics;public class Bitmap{public static Bitmap createScaledBitmap(Bitmap b,int w,int h,boolean f){return b;}public int getPixel(int x,int y){return 0;}}''',
'android/graphics/drawable/BitmapDrawable.java':'''package android.graphics.drawable;public class BitmapDrawable extends Drawable{public android.graphics.Bitmap getBitmap(){return null;}}''',
'android/graphics/drawable/Drawable.java':'''package android.graphics.drawable;public class Drawable{public static class ConstantState{public Drawable newDrawable(){return new Drawable();}}public ConstantState getConstantState(){return new ConstantState();}}''',
'android/graphics/drawable/GradientDrawable.java':'''package android.graphics.drawable;public class GradientDrawable extends Drawable{public enum Orientation{TL_BR,TOP_BOTTOM}public GradientDrawable(Orientation o,int[] c){}public void setCornerRadius(float f){}public void setStroke(int w,int c){}}''',
'android/graphics/drawable/RippleDrawable.java':'''package android.graphics.drawable;public class RippleDrawable extends Drawable{public RippleDrawable(android.content.res.ColorStateList c,Drawable d,Drawable m){}}''',
'android/text/TextUtils.java':'''package android.text;public class TextUtils{public enum TruncateAt{END}}''',
'android/view/Gravity.java':'''package android.view;public class Gravity{public static final int CENTER=17,CENTER_VERTICAL=16;}''',
'android/view/View.java':'''package android.view;import android.content.Context;import android.graphics.drawable.Drawable;public class View{public ViewTreeObserver observer=new ViewTreeObserver();public ViewTreeObserver getViewTreeObserver(){return observer;}public static final int IMPORTANT_FOR_ACCESSIBILITY_NO=2;public boolean postDelayed(Runnable r,long d){return true;}public boolean post(Runnable r){r.run();return true;}public boolean isAttachedToWindow(){return false;}public void setBackgroundColor(int c){}public void setElevation(float e){}protected Context ctx;private Object tag;private ViewGroup parent;private ViewGroup.LayoutParams params;public boolean clickable;public Drawable background;public View(Context c){ctx=c;}public Context getContext(){return ctx;}public void setPadding(int a,int b,int c,int d){}public void setBackground(Drawable d){background=d;}public Drawable getBackground(){return background;}public void setForeground(Drawable d){}public boolean isClickable(){return clickable;}public void setClickable(boolean c){clickable=c;}public void setMinimumHeight(int v){}public void setImportantForAccessibility(int i){}public void setClipToOutline(boolean b){}public ViewGroup getParent(){return parent;}public void parent(ViewGroup p){parent=p;}public ViewGroup.LayoutParams getLayoutParams(){return params;}public void setLayoutParams(ViewGroup.LayoutParams p){params=p;}public void setTag(Object o){tag=o;}public View findViewWithTag(Object t){return t.equals(tag)?this:null;}public interface OnClickListener{void onClick(View v);}public OnClickListener click;public void setOnClickListener(OnClickListener l){click=l;clickable=true;}public boolean performClick(){if(click!=null)click.onClick(this);return click!=null;}public void setContentDescription(CharSequence c){}public Object getTag(){return tag;}public int visibility;public void setVisibility(int x){visibility=x;}public int getVisibility(){return visibility;}public static final int GONE=8;public static final int VISIBLE=0;}''',
'android/view/ViewGroup.java':'''package android.view;import android.content.Context;import java.util.*;public class ViewGroup extends View{public static class LayoutParams{public int width,height;public LayoutParams(int w,int h){width=w;height=h;}}public static class MarginLayoutParams extends LayoutParams{public int bottomMargin,topMargin,rightMargin;public MarginLayoutParams(int w,int h){super(w,h);}}protected List<View> children=new ArrayList<View>();public ViewGroup(Context c){super(c);}public int getChildCount(){return children.size();}public View getChildAt(int i){return children.get(i);}public void removeViewAt(int i){View v=children.remove(i);v.parent(null);}public void removeView(View v){children.remove(v);v.parent(null);}public void addView(View v){addView(v,children.size(),new LayoutParams(-1,-2));}public void addView(View v,int i){addView(v,i,new LayoutParams(-1,-2));}public void addView(View v,LayoutParams p){addView(v,children.size(),p);}public void addView(View v,int i,LayoutParams p){children.add(i,v);v.parent(this);v.setLayoutParams(p);}public View findViewWithTag(Object t){View v=super.findViewWithTag(t);if(v!=null)return v;for(View c:children){v=c.findViewWithTag(t);if(v!=null)return v;}return null;}}''',
'android/view/ViewTreeObserver.java':'''package android.view;public class ViewTreeObserver{public interface OnGlobalLayoutListener{void onGlobalLayout();}public java.util.List<OnGlobalLayoutListener> all=new java.util.ArrayList<OnGlobalLayoutListener>();public void addOnGlobalLayoutListener(OnGlobalLayoutListener l){all.add(l);}public void layout(){for(OnGlobalLayoutListener l:new java.util.ArrayList<OnGlobalLayoutListener>(all))l.onGlobalLayout();}}''',
'android/widget/ScrollView.java':'''package android.widget;import android.content.Context;import android.view.ViewGroup;public class ScrollView extends ViewGroup{public int y;public ScrollView(Context c){super(c);}public int getScrollY(){return y;}public void scrollTo(int x,int v){y=v;}}''',
'android/widget/LinearLayout.java':'''package android.widget;import android.content.Context;import android.view.ViewGroup;public class LinearLayout extends ViewGroup{public static class LayoutParams extends ViewGroup.MarginLayoutParams{public LayoutParams(int w,int h){super(w,h);}public LayoutParams(int w,int h,float g){super(w,h);}}public static final int VERTICAL=1,HORIZONTAL=0;public LinearLayout(Context c){super(c);}public void setOrientation(int i){}public void setGravity(int i){}}''',
'android/widget/TextView.java':'''package android.widget;import android.content.Context;import android.graphics.Typeface;import android.text.TextUtils;import android.view.View;public class TextView extends View{private CharSequence text="";public TextView(Context c){super(c);}public void setLineSpacing(float a,float m){}public void setText(CharSequence s){text=s;}public CharSequence getText(){return text;}public void setTextSize(float n){}public void setTextColor(int n){}public void setTypeface(Typeface t,int i){}public void setMaxLines(int i){}public void setEllipsize(TextUtils.TruncateAt t){}public void setLetterSpacing(float f){}public void setGravity(int g){}public void setMaxWidth(int n){}}''',
'android/widget/ImageView.java':'''package android.widget;import android.content.Context;import android.view.View;public class ImageView extends View{public enum ScaleType{CENTER_CROP}public ImageView(Context c){super(c);}public void setScaleType(ScaleType t){}public android.graphics.drawable.Drawable drawable;public android.graphics.drawable.Drawable getDrawable(){return drawable;}public void setImageDrawable(android.graphics.drawable.Drawable d){drawable=d;}}''',
'org/json/JSONArray.java':'''package org.json;public class JSONArray{String[] a;public JSONArray(String s){a=s.equals("[]")?new String[0]:s.split("\\\\|");}public int length(){return a.length;}public JSONObject optJSONObject(int i){return new JSONObject(a[i]);}}''',
'org/json/JSONObject.java':'''package org.json;import java.util.*;public class JSONObject{Map<String,String> m=new HashMap<String,String>();public JSONObject(String s){for(String x:s.split(";")){int i=x.indexOf('=');if(i>0)m.put(x.substring(0,i),x.substring(i+1));}}public String optString(String k,String d){return m.containsKey(k)?m.get(k):d;}}''',
'com/melodix/music/GlassLikedMotion.java':'''package com.melodix.music;public class GlassLikedMotion{public static int entrances;public static void bind(android.app.Activity a,android.widget.LinearLayout v,String s,String u){}public static void entrance(android.widget.LinearLayout c){entrances++;}public static void pressable(android.view.View v,int d){}}''',
'com/melodix/music/NativeImageLoader.java':'''package com.melodix.music;public class NativeImageLoader{public static String url="";public static int calls=0;public static void load(android.widget.ImageView v,String u,int size){url=u;calls++;}}''',
'com/melodix/music/RefreshTest.java':r'''package com.melodix.music;
import android.app.Activity;import android.view.*;import android.widget.*;
public class RefreshTest{
 static void yes(boolean b){if(!b)throw new AssertionError();}
 static boolean hasText(View v,String s){if(v instanceof TextView&&((TextView)v).getText().toString().equals(s))return true;if(v instanceof ViewGroup){ViewGroup g=(ViewGroup)v;for(int i=0;i<g.getChildCount();i++)if(hasText(g.getChildAt(i),s))return true;}return false;}
 static LinearLayout group(Activity a){return new LinearLayout(a);}
 static class ScreenAct extends Activity{String nativeCurrentScreen;}
 static class HomeAct extends Activity{private String nativeHomeJson;String applied;public void applyNativeUiData(String k,String j){if("home".equals(k)){applied=j;nativeHomeJson=j;}}}
 public static void main(String[] args){
  Activity a=new Activity(); LinearLayout root=group(a), rows=group(a), setting=group(a),label=group(a);root.addView(rows);rows.addView(setting);
  TextView title=new TextView(a);title.setText("Vider le cache");label.addView(title);TextView sub=new TextView(a);sub.setText("Effacer le cache");label.addView(sub);setting.addView(label);TextView value=new TextView(a);value.setText("Vider");setting.addView(value);setting.setClickable(true);
  GlassScreenStyler.style(a,root,"settings","","Paramètres");
  yes(setting.isClickable());yes(hasText(root,"Vider le cache"));yes(hasText(root,"Vider"));yes(hasText(root,"Votre musique,\nà votre façon."));yes(setting.getChildCount()==3);
  LinearLayout empty=group(a);TextView info=new TextView(a);info.setText("Chargement en attente");empty.addView(info);
  GlassScreenStyler.rememberSelection(a,"spotify:playlist:A","uri=spotify:playlist:A;image=https://i.scdn.co/image/real|uri=spotify:playlist:B;image=https://i.scdn.co/image/other");
  GlassScreenStyler.style(a,empty,"detail","spotify:playlist:A","Ma playlist");
  yes(hasText(empty,"Ma playlist"));yes(hasText(empty,"Chargement en attente"));yes(NativeImageLoader.calls==1);yes(NativeImageLoader.url.endsWith("/real"));
  LinearLayout missing=group(a);GlassScreenStyler.rememberSelection(a,"spotify:playlist:B","uri=spotify:playlist:A;image=https://i.scdn.co/image/real");
  GlassScreenStyler.style(a,missing,"detail","spotify:playlist:B","Autre");yes(NativeImageLoader.calls==1);yes(hasText(missing,"PLAYLIST"));yes(hasText(missing,"Autre"));
  LinearLayout counted=new LinearLayout(a);for(int i=0;i<3;i++){LinearLayout row=new LinearLayout(a);row.setClickable(true);counted.addView(row);}GlassScreenStyler.style(a,counted,"detail","spotify:playlist:C","Compte");yes(hasText(counted,"3 titres"));
  LinearLayout rich=new LinearLayout(a);String[][] d={{"A","Nek, Zed","3:30"},{"B","Ola • 4:00"},{"C","Nek","1:02:30"}};for(String[] r:d){LinearLayout row=new LinearLayout(a);row.setClickable(true);for(String x:r){TextView t=new TextView(a);t.setText(x);row.addView(t);}rich.addView(row);}
  GlassScreenStyler.style(a,rich,"detail","spotify:playlist:D","Riche");yes(hasText(rich,"3 titres · 1 h 10 min"));/* user request 1022388: Spotify-like header without these details */yes(!hasText(rich,"Avec Nek, Zed, Ola"));yes(!hasText(rich,"3 artistes"));yes(!hasText(rich,"moy. 23:20"));yes(!hasText(rich,"★  Le plus présent : Nek · 2 titres"));
  LinearLayout tr=new LinearLayout(a),trow=new LinearLayout(a),lab=new LinearLayout(a);trow.setClickable(true);trow.addView(new ImageView(a));TextView tt=new TextView(a);tt.setText("Love Sosa");TextView ts=new TextView(a);ts.setText("Chief Keef • 4:06");lab.addView(tt);lab.addView(ts);trow.addView(lab);tr.addView(trow);tr.addView(new TextView(a));
  GlassScreenStyler.style(a,tr,"detail","spotify:playlist:F","Lignes");yes(hasText(trow,"Chief Keef"));yes(hasText(trow,"4:06"));yes(trow.getChildCount()==4);yes(hasText(trow,"1"));// number column (1022338)
  GlassScreenStyler.style(a,tr,"detail","spotify:playlist:F","Lignes");yes(trow.getChildCount()==4);
  LinearLayout part=new LinearLayout(a);for(String x:new String[]{"A","B","Aperçu Spotify"}){LinearLayout row=new LinearLayout(a);row.setClickable(true);TextView t=new TextView(a);t.setText(x);row.addView(t);part.addView(row);}
  GlassScreenStyler.style(a,part,"detail","spotify:playlist:E","Partielle");yes(hasText(part,"2+ titres"));
  LinearLayout restored=group(a),content=group(a);restored.addView(content);TextView old=new TextView(a);old.setTag("glass-old-playlist-heading");content.addView(old);TextView existing=new TextView(a);existing.setText("Titre réel");content.addView(existing);
  GlassScreenStyler.style(a,restored,"detail","spotify:playlist:A","Ma playlist");yes(old.getParent()==null);yes(hasText(restored,"Titre réel"));yes(NativeImageLoader.calls==2);
  {LinearLayout hl=new LinearLayout(a),hrow=new LinearLayout(a),hlab=new LinearLayout(a);hrow.setClickable(true);hrow.addView(new ImageView(a));TextView h1=new TextView(a);h1.setText("Song");TextView h2=new TextView(a);h2.setText("♥ Artist • 3:00");hlab.addView(h1);hlab.addView(h2);hrow.addView(hlab);hl.addView(hrow);hl.addView(new TextView(a));
   GlassScreenStyler.style(a,hl,"detail","spotify:playlist:H","Coeurs");yes("Artist".equals(String.valueOf(h2.getText())));yes(hasText(hrow,"♥︎"));yes(hasText(hrow,"3:00"));}// liked heart (1022338)
  LinearLayout liked=group(a);TextView loading=new TextView(a);loading.setText("Chargement en attente");liked.addView(loading);
  GlassScreenStyler.style(a,liked,"detail","spotify:collection:tracks","Titres likés");
  yes(hasText(liked,"Titres likés"));yes(hasText(liked,"♥︎"));yes(hasText(liked,"Chargement en attente"));yes(NativeImageLoader.calls==2);
  yes(GlassScreenStyler.liked("spotify:collection:tracks"));yes(GlassScreenStyler.liked("https://open.spotify.com/collection/tracks?x=1"));
  yes(!GlassScreenStyler.liked("spotify:collection:tracks:other"));yes(!GlassScreenStyler.liked("https://evil.com/collection/tracks"));
  LinearLayout artist=group(a);GlassScreenStyler.style(a,artist,"detail","spotify:artist:A","Artiste");yes(artist.getChildCount()==0);
  // Home: greeting, the real library cards (own click routes) moved into a quick grid, no duplicate on re-style.
  LinearLayout hroot=group(a),feed=group(a);hroot.addView(feed);
  TextView lib=new TextView(a);lib.setText("Votre bibliothèque");feed.addView(lib);TextView vp=new TextView(a);vp.setText("Vos playlists");feed.addView(vp);
  ViewGroup sc=new ViewGroup(a);LinearLayout cs=group(a);sc.addView(cs);feed.addView(sc);LinearLayout first=null;
  for(int i=0;i<3;i++){LinearLayout card=group(a);card.addView(new ImageView(a));LinearLayout col=group(a);TextView n=new TextView(a);n.setText("P"+i);col.addView(n);TextView hs=new TextView(a);hs.setText("Playlist");col.addView(hs);card.addView(col);card.setClickable(true);cs.addView(card);if(first==null)first=card;}
  TextView dis=new TextView(a);dis.setText("À découvrir sur Spotify");feed.addView(dis);ViewGroup sc2=new ViewGroup(a);sc2.addView(group(a));feed.addView(sc2);
  GlassScreenStyler.style(a,hroot,"home","","Accueil");GlassScreenStyler.style(a,hroot,"home","","Accueil");
  View head=feed.findViewWithTag("glass-home-head");yes(head!=null&&feed.getChildAt(0)==head);int heads=0;for(int i=0;i<feed.getChildCount();i++)if("glass-home-head".equals(feed.getChildAt(i).getTag()))heads++;yes(heads==1);
  yes(hasText(head,"Bonjour")||hasText(head,"Bon après-midi")||hasText(head,"Bonsoir"));yes(hasText(head,"P2"));yes(cs.getChildCount()==0);yes(first.isClickable());
  yes(lib.getVisibility()==View.GONE&&sc.getVisibility()==View.GONE&&vp.getVisibility()==View.GONE);yes(dis.getVisibility()==View.VISIBLE&&hasText(feed,"À DÉCOUVRIR SUR SPOTIFY"));
  // Library: big title, counts by kind, rows keep their click route.
  LinearLayout lroot=group(a),lrows=group(a);lroot.addView(lrows);TextView lh=new TextView(a);lh.setText("Vos playlists");lrows.addView(lh);
  String[][] li={{"Titres likés","Playlist • 48 titres"},{"Flex and chill","Playlist • Moi"},{"Utopia","Album • Travis Scott"}};
  for(String[] r:li){LinearLayout row=group(a);row.setClickable(true);row.addView(new ImageView(a));LinearLayout col=group(a);for(String x:r){TextView q=new TextView(a);q.setText(x);col.addView(q);}row.addView(col);lrows.addView(row);}
  GlassScreenStyler.style(a,lroot,"library","","Bibliothèque");GlassScreenStyler.style(a,lroot,"library","","Bibliothèque");
  yes(hasText(lroot,"Ta bibliothèque"));yes(hasText(lroot,"3 éléments · 2 playlists · 1 album"));int lh2=0;for(int i=0;i<lrows.getChildCount();i++)if("glass-library-head".equals(lrows.getChildAt(i).getTag()))lh2++;yes(lh2==1);
  // Scroll kept per screen: Home comes back where it was left, a playlist opens at the top.
  ScrollView sv=new ScrollView(a);LinearLayout sh=group(a);sv.addView(sh);sh.addView(group(a));
  GlassScreenStyler.style(a,sh,"home","","Accueil");sv.y=900;GlassScreenStyler.style(a,sh,"detail","spotify:playlist:Z","P");yes(sv.y==0);
  sv.y=4000;GlassScreenStyler.style(a,sh,"home","","Accueil");yes(sv.y==900);GlassScreenStyler.style(a,sh,"home","","Accueil");yes(sv.y==900);
  // User report (1022333): Home shown again without a restyle after Settings must not keep the Settings scroll.
  {ScreenAct sa=new ScreenAct();ScrollView sv2=new ScrollView(sa);LinearLayout sh2=group(sa);sv2.addView(sh2);sh2.addView(group(sa));
   sa.nativeCurrentScreen="home";GlassScreenStyler.style(sa,sh2,"home","","Accueil");sv2.y=300;
   sa.nativeCurrentScreen="settings";GlassScreenStyler.style(sa,sh2,"settings","","Paramètres");sv2.y=2500;
   sa.nativeCurrentScreen="home";sv2.observer.layout();yes(sv2.y==300);}
  LinearLayout sroot=group(a),srows=group(a);sroot.addView(srows);TextView sth=new TextView(a);sth.setText("Titres");srows.addView(sth);LinearLayout srow=group(a);srow.setClickable(true);srow.addView(new ImageView(a));LinearLayout scol=group(a);TextView s1=new TextView(a);s1.setText("Love Sosa");scol.addView(s1);TextView s2=new TextView(a);s2.setText("Chief Keef • 4:06");scol.addView(s2);srow.addView(scol);srows.addView(srow);
  GlassScreenStyler.style(a,sroot,"search","","Rechercher");yes(hasText(srow,"4:06"));yes(hasText(srow,"Chief Keef"));yes(srow.isClickable());
  yes(GlassScreenStyler.genreQuery("Pop").equals("genre:\"pop\""));yes(GlassScreenStyler.genreQuery("Latino").equals("genre:\"latin\""));yes(GlassScreenStyler.genreQuery("Détente").equals("Détente"));
  // Home local copy: saved from the live Home, shown at the next launch, forgotten on logout.
  HomeAct live=new HomeAct();live.nativeHomeJson="[{\"title\":\"Flex\"}]";LinearLayout hc=group(a);hc.addView(group(a));GlassScreenStyler.style(live,hc,"home","","Accueil");
  HomeAct next=new HomeAct();GlassScreenStyler.restoreHome(next);yes("[{\"title\":\"Flex\"}]".equals(next.applied));
  HomeAct ready=new HomeAct();ready.nativeHomeJson="[]";GlassScreenStyler.restoreHome(ready);yes(ready.applied==null);
  GlassScreenStyler.forgetHome(next);HomeAct after=new HomeAct();GlassScreenStyler.restoreHome(after);yes(after.applied==null);
  { // User request (1022424): one entrance per screen change, never on a redraw of the same screen; playlists excluded.
    GlassScreenStyler.style(a,new LinearLayout(a),"detail","spotify:playlist:Y","P");int e0=GlassLikedMotion.entrances;LinearLayout h=new LinearLayout(a);
    GlassScreenStyler.style(a,h,"home","","Accueil");GlassScreenStyler.style(a,h,"home","","Accueil");yes(GlassLikedMotion.entrances==e0+1);
    GlassScreenStyler.style(a,h,"search","","Recherche");yes(GlassLikedMotion.entrances==e0+2);
    GlassScreenStyler.style(a,new LinearLayout(a),"detail","spotify:playlist:Z","P");yes(GlassLikedMotion.entrances==e0+2); }
  System.out.println("Glass screen JVM simulation passed");
 }
}'''
}
def main():
 with tempfile.TemporaryDirectory(prefix='glass-refresh-jvm-') as tmp:
  root=Path(tmp);files=[]
  for name,content in STUBS.items():
   p=root/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(content,encoding='utf8');files.append(str(p))
  files.append(str(HERE/'glass-refresh/GlassScreenStyler.java'));out=root/'classes';out.mkdir()
  java=os.environ.get('PREVIEW_TEST_JAVA','java');ecj=os.environ.get('PREVIEW_TEST_ECJ')
  compiler=[java,'-cp',ecj,'org.eclipse.jdt.internal.compiler.batch.Main'] if ecj else ['javac']
  subprocess.run(compiler+['-encoding','UTF-8','-source','8','-target','8','-d',str(out)]+files,check=True)
  subprocess.run([java,'-cp',str(out),'com.melodix.music.RefreshTest'],check=True)
if __name__=='__main__':main()
