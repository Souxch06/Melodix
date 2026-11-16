#!/usr/bin/env python3
"""Native unavailable sheets and volume isolation simulation; no device validation."""
import ast, os, subprocess, tempfile
from pathlib import Path
here=Path(__file__).resolve().parent
module=ast.parse((here/'test_mode_jvm.py').read_text())
stubs=ast.literal_eval(next(n.value for n in module.body if isinstance(n,ast.Assign) and any(isinstance(t,ast.Name) and t.id=='stubs' for t in n.targets)))
stubs={k:v for k,v in stubs.items() if k in ('android/util/AttributeSet.java','android/util/DisplayMetrics.java','android/os/SystemClock.java','android/os/Handler.java','android/os/Looper.java','android/view/HapticFeedbackConstants.java','android/widget/Toast.java','android/webkit/ValueCallback.java','org/json/JSONTokener.java','org/json/JSONObject.java')}
stubs.update({
'android/content/ContextWrapper.java':'package android.content;public class ContextWrapper extends Context {public Context getBaseContext(){return this;}}',
'android/content/DialogInterface.java':'package android.content;public interface DialogInterface {public interface OnDismissListener {void onDismiss(DialogInterface d);}}',
'android/app/Activity.java':'package android.app;public class Activity extends android.content.ContextWrapper {public android.webkit.WebView G;public android.view.View root;public boolean isFinishing(){return false;}public boolean isDestroyed(){return false;}public android.view.View findViewById(int id){return root;}}',
'android/app/Dialog.java':'''package android.app;import android.content.*;import android.view.*;public class Dialog implements DialogInterface {public static Dialog last;public OnDismissListener listener;public boolean shown;public Dialog(Activity a){last=this;}public View content;public void setContentView(View v){content=v;}public void setCanceledOnTouchOutside(boolean b){}public void setOnDismissListener(OnDismissListener l){listener=l;}public void show(){shown=true;}public Window getWindow(){return new Window();}public void dismiss(){shown=false;if(listener!=null)listener.onDismiss(this);}}''',
'android/view/Window.java':'package android.view;public class Window {public void setBackgroundDrawable(Object x){}public void clearFlags(int f){}public void addFlags(int f){}public void setLayout(int a,int b){}public void setGravity(int g){}}',
'android/view/WindowManager.java':'package android.view;public class WindowManager {public static class LayoutParams {public static final int FLAG_DIM_BEHIND=2,FLAG_NOT_TOUCH_MODAL=32;}}',
'android/graphics/Color.java':'package android.graphics;public class Color {public static final int TRANSPARENT=0,WHITE=-1;}',
'android/graphics/drawable/ColorDrawable.java':'package android.graphics.drawable;public class ColorDrawable {public ColorDrawable(int c){}}',
'android/webkit/WebView.java':'''package android.webkit;public class WebView extends android.view.View {public int calls;public ValueCallback<String> cb;public String js;public WebView(android.content.Context c){super(c);}public void evaluateJavascript(String s,ValueCallback<String> c){calls++;js=s;cb=c;}public void reply(String s){cb.onReceiveValue(s);}}''',
'android/content/Context.java':'''package android.content; public class Context {public static final String AUDIO_SERVICE="audio";public Object audio;public Object getSystemService(String s){return audio;}public android.content.res.Resources getResources(){return new android.content.res.Resources();}}''',
'android/content/res/Resources.java':'''package android.content.res; public class Resources {public android.util.DisplayMetrics getDisplayMetrics(){return new android.util.DisplayMetrics();}public Configuration getConfiguration(){return new Configuration();}}''',
'android/content/res/Configuration.java':'package android.content.res;public class Configuration {public float fontScale=1;}',
'android/content/res/ColorStateList.java':'package android.content.res;public class ColorStateList {public static ColorStateList valueOf(int x){return new ColorStateList();}}',
'android/graphics/drawable/GradientDrawable.java':'package android.graphics.drawable;public class GradientDrawable {public void setColor(int x){}public void setCornerRadius(float x){}public void setCornerRadii(float[] x){}public void setStroke(int x,int y){}}',
'android/graphics/drawable/RippleDrawable.java':'package android.graphics.drawable;public class RippleDrawable {public RippleDrawable(android.content.res.ColorStateList c,Object a,Object b){}}',
'android/text/Spanned.java':'package android.text;public interface Spanned {int SPAN_EXCLUSIVE_EXCLUSIVE=0;}',
'android/text/SpannableString.java':'package android.text;public class SpannableString implements CharSequence {String s;public SpannableString(String t){s=t;}public void setSpan(Object o,int a,int b,int c){}public int length(){return s.length();}public char charAt(int i){return s.charAt(i);}public CharSequence subSequence(int a,int b){return s.subSequence(a,b);}public String toString(){return s;}}',
'android/text/style/RelativeSizeSpan.java':'package android.text.style;public class RelativeSizeSpan {public RelativeSizeSpan(float x){}}',
'android/view/Gravity.java':'package android.view;public class Gravity {public static int CENTER=1,TOP=2,RIGHT=4,BOTTOM=8,CENTER_VERTICAL=16;}',
'android/view/View.java':'''package android.view;import android.content.*;import android.os.*;public class View {public static final int VISIBLE=0,GONE=8;public int visibility=0;public int getVisibility(){return visibility;}public void setVisibility(int v){visibility=v;}public boolean enabled=true,shown=true,attached=true;public String description="";public Context c;public interface OnClickListener{void onClick(View v);}public interface OnTouchListener{boolean onTouch(View v,MotionEvent e);}public OnTouchListener touch;public void setOnTouchListener(OnTouchListener l){touch=l;}public void setMinimumHeight(int x){}public void setPadding(int a,int b,int c,int d){}public void setBackground(Object x){}public OnClickListener click;public View(Context c){this.c=c;}public Context getContext(){return c;}public android.content.res.Resources getResources(){return c.getResources();}public boolean isShown(){return shown;}public boolean isAttachedToWindow(){return attached;}public int getWindowVisibility(){return 0;}public void setEnabled(boolean x){enabled=x;}public void setAlpha(float x){}public void setContentDescription(CharSequence s){description=s.toString();}public void setOnClickListener(OnClickListener l){click=l;}public void performClick(){if(enabled&&click!=null)click.onClick(this);}public boolean performHapticFeedback(int x){return true;}public boolean post(Runnable r){r.run();return true;}public boolean postDelayed(Runnable r,long d){return new Handler(Looper.getMainLooper()).postDelayed(r,d);}public void removeCallbacks(Runnable r){new Handler(Looper.getMainLooper()).removeCallbacks(r);}protected void onAttachedToWindow(){}protected void onDetachedFromWindow(){}protected void onVisibilityChanged(View v,int i){}protected void onWindowVisibilityChanged(int i){} }''',
'android/widget/LinearLayout.java':'''package android.widget;import android.view.*;import android.content.*;import android.util.*;import java.util.*;public class LinearLayout extends View {public static int HORIZONTAL=0,VERTICAL=1;public java.util.List<View> children=new ArrayList<View>();public LinearLayout(Context c,AttributeSet a){super(c);}public LinearLayout(Context c){super(c);}public void setOrientation(int x){}public void setGravity(int x){}public void addView(View b,LayoutParams p){children.add(b);}public static class LayoutParams {public static int WRAP_CONTENT=-2;public int leftMargin;public LayoutParams(int w,int h,float weight){}public LayoutParams(int w,int h){}}}''',
'android/view/MotionEvent.java':'package android.view;public class MotionEvent {public static final int ACTION_DOWN=0,ACTION_UP=1;int action;float y;public MotionEvent(int a,float v){action=a;y=v;}public int getActionMasked(){return action;}public float getRawY(){return y;}}',
'android/widget/TextView.java':'package android.widget;import android.view.*;import android.content.*;public class TextView extends View {public String text;public TextView(Context c){super(c);}public void setText(CharSequence s){text=s.toString();}public void setTextColor(int x){}public void setGravity(int x){}public void setTextSize(float x){}}',
'android/widget/Button.java':'''package android.widget;import android.view.*;import android.content.*;public class Button extends View {public String text;public Button(Context c){super(c);}public void setText(CharSequence s){text=s.toString();}public void setTextSize(float x){}public void setTextColor(int x){}public void setAllCaps(boolean x){}public void setSingleLine(boolean x){}public void setMaxLines(int x){}public void setPadding(int a,int b,int c,int d){}public void setMinWidth(int x){}public void setMinimumWidth(int x){}public void setMinimumHeight(int x){}public void setBackgroundTintList(Object x){}public void setStateListAnimator(Object x){}public void setElevation(float x){}public void setTranslationZ(float x){}public void setForeground(Object x){}public void setBackground(Object x){}public void setSelected(boolean x){}public void setActivated(boolean x){}}''',
'android/media/AudioManager.java':'''package android.media;public class AudioManager {public static final int STREAM_MUSIC=3,ADJUST_SAME=0,FLAG_SHOW_UI=1;public int value=5,calls=0;public boolean fail;public int getStreamMaxVolume(int x){return 10;}public int getStreamVolume(int x){return value;}public void adjustStreamVolume(int a,int b,int c){calls++;if(fail)throw new RuntimeException();}}''',
'com/melodix/music/TilesTest.java':'''package com.melodix.music;import android.app.*;import android.view.*;import android.os.*;import android.media.*;import android.widget.*;public class TilesTest {
 static void ok(boolean b){if(!b)throw new AssertionError();}
 public static void main(String[] a){
  Handler.clear();Activity c=new Activity();AudioManager audio=new AudioManager();c.audio=audio;c.root=new View(c);c.G=new android.webkit.WebView(c);
  PreviewPlayerTiles t=new PreviewPlayerTiles(c,null);ok(c.G.calls==0);int original=c.root.getVisibility();
  for(int i=0;i<3;i++){
   Handler.advance(401);View b=t.children.get(i);ok(b.enabled&&b.description.contains("indisponible"));b.performClick();Dialog d=Dialog.last;ok(d.shown&&c.G.calls==0&&c.root.getVisibility()==original);
   LinearLayout content=(LinearLayout)d.content;LinearLayout header=(LinearLayout)content.children.get(1);TextView message=(TextView)content.children.get(2);ok(message.text.equals("Indisponible dans cette version"));
   b.performClick();ok(Dialog.last==d);
   if(i==0){Button close=(Button)header.children.get(1);close.performClick();ok(!d.shown);}
   if(i==1){View handle=content.children.get(0);handle.touch.onTouch(handle,new MotionEvent(0,0));handle.touch.onTouch(handle,new MotionEvent(1,100));ok(!d.shown);}
   if(i==2){d.dismiss();ok(!d.shown);}
  }
  Handler.advance(401);t.children.get(0).performClick();ok(Dialog.last.shown);t.shown=false;t.onVisibilityChanged(t,8);ok(!Dialog.last.shown);ok(c.root.getVisibility()==original);
  Button vol=(Button)t.children.get(3);ok(!vol.enabled&&vol.text.contains("Volume —"));vol.performClick();ok(audio.calls==0&&c.G.calls==0);t.onDetachedFromWindow();
  System.out.println("Native blocked panels and volume JVM simulation passed");
 }
}'''


})
with tempfile.TemporaryDirectory(prefix='player-tiles-jvm-') as tmp:
 r=Path(tmp);files=[]
 for name,text in stubs.items():
  p=r/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(text,encoding='utf8');files.append(str(p))
 out=r/'classes';out.mkdir();java=os.environ.get('PREVIEW_TEST_JAVA','java');ecj=os.environ.get('PREVIEW_TEST_ECJ');compiler=[java,'-cp',ecj,'org.eclipse.jdt.internal.compiler.batch.Main'] if ecj else ['javac']
 subprocess.run(compiler+['-encoding','UTF-8','-source','8','-target','8','-d',str(out)]+files+[str(here/'PreviewPlayerTiles.java')],check=True)
 subprocess.run([java,'-cp',str(out),'com.melodix.music.TilesTest'],check=True)
