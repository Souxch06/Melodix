#!/usr/bin/env python3
"""JVM control state machine against stubs, not a real Android/Spotify test."""
import os,subprocess,tempfile
from pathlib import Path
here=Path(__file__).resolve().parent
stubs={
'android/os/Build.java':'package android.os;public class Build {public static class VERSION {public static int SDK_INT=35;}}',
'android/animation/ValueAnimator.java':'package android.animation;public class ValueAnimator {public static boolean areAnimatorsEnabled(){return true;}}',
'android/view/ViewPropertyAnimator.java':'package android.view;public class ViewPropertyAnimator {public void cancel(){}public ViewPropertyAnimator translationX(float x){return this;}public ViewPropertyAnimator setDuration(long d){return this;}public ViewPropertyAnimator withEndAction(Runnable r){return this;}public void start(){}}',
'android/R.java':'package android;public class R {public static class drawable {public static final int ic_popup_sync=1;}}',
'android/util/AttributeSet.java':'package android.util; public interface AttributeSet {}',
'android/util/DisplayMetrics.java':'package android.util; public class DisplayMetrics { public float density=1; }',
'android/content/res/Resources.java':'package android.content.res; public class Resources { public int getIdentifier(String n,String t,String p){return 1;} public android.util.DisplayMetrics getDisplayMetrics(){return new android.util.DisplayMetrics();} }',
'android/content/Context.java':'package android.content; public class Context { public String getPackageName(){return "preview";} public android.content.res.Resources getResources(){return new android.content.res.Resources();} }',
'android/content/ContextWrapper.java':'package android.content; public class ContextWrapper extends Context { public Context getBaseContext(){return this;} }',
'android/app/Activity.java':'package android.app; public class Activity extends android.content.ContextWrapper { public android.webkit.WebView G; public android.view.View title; public android.view.View findViewById(int id){return title;} }',
'android/os/Looper.java':'package android.os; public class Looper { public static Looper getMainLooper(){return new Looper();} }',
'android/os/SystemClock.java':'package android.os; public class SystemClock { public static long t; public static long elapsedRealtime(){return t;} }',
'android/os/Handler.java':'''package android.os;import java.util.*;public class Handler { static class Task { Runnable r;long at;Task(Runnable x,long t){r=x;at=t;} } public static List<Task> todo=new ArrayList<Task>(); public Handler(Looper l){} public boolean post(Runnable r){return postDelayed(r,0);} public boolean postDelayed(Runnable r,long d){todo.add(new Task(r,SystemClock.t+d));return true;} public void removeCallbacks(Runnable r){todo.removeIf(x->x.r==r);} public static void clear(){todo.clear();SystemClock.t=0;} public static void step(){int n=0;for(int i=1;i<todo.size();i++)if(todo.get(i).at<todo.get(n).at)n=i;Task t=todo.remove(n);SystemClock.t=Math.max(SystemClock.t,t.at);t.r.run();} public static void advance(long d){long end=SystemClock.t+d;int guard=100;while(!todo.isEmpty() && guard-->0){long earliest=Long.MAX_VALUE;for(Task t:todo)earliest=Math.min(earliest,t.at);if(earliest>end)break;step();}SystemClock.t=end;} }''',
'android/widget/Toast.java':'''package android.widget;public class Toast { public static int count;public static String message;public static final int LENGTH_SHORT=0;public static Toast makeText(android.content.Context c,CharSequence s,int n){message=s.toString();return new Toast();}public void show(){count++;} }''',
'android/view/HapticFeedbackConstants.java':'package android.view; public class HapticFeedbackConstants { public static final int KEYBOARD_TAP=3; }',
'android/view/View.java':'''package android.view;import android.content.*;public class View { public static final int VISIBLE=0; public interface OnClickListener{void onClick(View v);} public Context c;public Object tag;public boolean enabled=true,shown=true,attached=true;public OnClickListener click;public String description=""; public View(Context c){this.c=c;} public Context getContext(){return c;} public android.content.res.Resources getResources(){return c.getResources();} public Object getTag(){return tag;} public void setTag(Object x){tag=x;} public void setEnabled(boolean b){enabled=b;} public void setAlpha(float a){} public void setContentDescription(CharSequence s){description=s.toString();} public void setOnClickListener(OnClickListener l){click=l;} public void performClick(){if(enabled)click.onClick(this);} public void invalidate(){} public android.view.ViewPropertyAnimator animate(){return new android.view.ViewPropertyAnimator();} public boolean performHapticFeedback(int n){return true;} public boolean isAttachedToWindow(){return attached;} public boolean isShown(){return shown;} public int getWindowVisibility(){return 0;} public boolean post(Runnable r){r.run();return true;} protected void onAttachedToWindow(){} protected void onDetachedFromWindow(){} protected void onVisibilityChanged(View v,int n){} protected void onWindowVisibilityChanged(int n){} }''',
'android/widget/ImageButton.java':'package android.widget; public class ImageButton extends android.view.View { public ImageButton(android.content.Context c,android.util.AttributeSet a){super(c);} public void setImageResource(int x){} public void setColorFilter(int c){} }',
'android/widget/TextView.java':'package android.widget; public class TextView extends android.view.View { public String text=""; public TextView(android.content.Context c){super(c);} public CharSequence getText(){return text;} }',
'android/webkit/ValueCallback.java':'package android.webkit;public interface ValueCallback<T>{void onReceiveValue(T value);}',
'android/webkit/WebView.java':'''package android.webkit; public class WebView extends android.view.View { public int calls; public String js; public ValueCallback<String> cb; public WebView(android.content.Context c){super(c);} public void evaluateJavascript(String s,ValueCallback<String> c){calls++;js=s;cb=c;} public void reply(String s){cb.onReceiveValue(s);} }''',
'org/json/JSONTokener.java':'''package org.json;public class JSONTokener {String s;public JSONTokener(String s){this.s=s;}public Object nextValue(){return s;} }''',
'org/json/JSONObject.java':'''package org.json; import java.util.*;public class JSONObject {Map<String,String> m=new HashMap<String,String>();public JSONObject(String s){if(s.startsWith("diag:")){for(String p:s.substring(5).split(",")){int i=p.indexOf(':');if(i>0)m.put(p.substring(0,i),p.substring(i+1));}}else for(String p:s.split(";")){int i=p.indexOf('=');if(i>0)m.put(p.substring(0,i),p.substring(i+1));}}public static String quote(String s){return (char)34+s+(char)34;}public String optString(String k,String d){return m.containsKey(k)?m.get(k):d;}public boolean optBoolean(String k,boolean d){return m.containsKey(k)?Boolean.parseBoolean(m.get(k)):d;} }''',
'com/melodix/music/ModeTest.java':'''package com.melodix.music;import android.app.*;import android.os.*;import android.webkit.*;import android.widget.*;public class ModeTest {
 static void ok(boolean b){if(!b)throw new AssertionError();}
 static String data(String state){return "state="+state+";track=track:abc;title=Titre";}
 public static void main(String[] z) throws Exception {
 for(String kind:new String[]{"like","shuffle","repeat"}){
  Handler.clear();Toast.count=0;Activity a=new Activity();a.G=new WebView(a);TextView title=new TextView(a);title.text="Titre";a.title=title;
  PreviewPlayerMode m=new PreviewPlayerMode(a,null);m.setTag(kind);m.onAttachedToWindow();ok(!m.enabled);ok(m.description.startsWith("Chargement :"));Handler.step();ok(a.G.calls==1);a.G.reply(data("unknown")+";reason=control");ok(!m.enabled);
  Handler.step();a.G.reply(data("false"));ok(m.enabled);int n=a.G.calls;m.performClick();ok(a.G.calls==n+1);if(kind.equals("shuffle"))ok(m.description.startsWith("Lecture aléatoire activée"));m.performClick();ok(a.G.calls==n+1);a.G.reply("sent=true");
  // Confirmation may arrive instantly; second tap within 400 ms is blocked.
  java.lang.reflect.Method observe=PreviewPlayerMode.class.getDeclaredMethod("observe");observe.setAccessible(true);observe.invoke(m);a.G.reply(data("true"));ok(m.enabled);n=a.G.calls;m.performClick();ok(a.G.calls==n);
  SystemClock.t+=401;if(kind.equals("like")){m.performClick();ok(a.G.calls==n);observe.invoke(m);a.G.reply(data("false"));n=a.G.calls;}m.performClick();ok(a.G.calls==n+1);if(kind.equals("shuffle"))ok(m.description.startsWith("Lecture aléatoire désactivée"));a.G.reply("sent=false");ok(!m.enabled);ok(Toast.count==1);ok(Toast.message.contains("Réessayer"));
  Handler.step();a.G.reply(data(kind.equals("like")?"false":"true"));ok(m.enabled);SystemClock.t+=401;m.performClick();ok(!m.enabled);android.webkit.ValueCallback<String> late=a.G.cb;
  // Lost JS callback: independent deadline unlocks without inventing success.
  Handler.advance(5001);ok(!m.enabled);ok(m.description.startsWith("Indisponible :"));ok(Toast.count==2);late.onReceiveValue("sent=false");ok(Toast.count==2);
  m.shown=false;m.onVisibilityChanged(m,8);ok(!m.enabled);m.performClick();
  m.shown=true;m.onVisibilityChanged(m,0);Handler.step();a.G.reply(data("false"));ok(m.enabled);m.onDetachedFromWindow();ok(!m.enabled);
 }
 // A response slower than the 800 ms polling interval remains usable.
 Handler.clear();Activity slow=new Activity();slow.G=new WebView(slow);TextView title=new TextView(slow);title.text="Titre";slow.title=title;
 PreviewPlayerMode mode=new PreviewPlayerMode(slow,null);mode.setTag("shuffle");mode.onAttachedToWindow();Handler.step();android.webkit.ValueCallback<String> first=slow.G.cb;Handler.advance(1600);ok(slow.G.calls==1);first.onReceiveValue(data("false"));ok(mode.enabled);mode.onDetachedFromWindow();
 // A missing response is bounded and an expired callback cannot re-enable it.
 Handler.clear();mode=new PreviewPlayerMode(slow,null);mode.setTag("shuffle");mode.onAttachedToWindow();Handler.step();first=slow.G.cb;Handler.advance(2500);ok(mode.description.startsWith("Indisponible :"));first.onReceiveValue(data("true"));ok(!mode.enabled && mode.description.startsWith("Indisponible :"));slow.G.reply(data("false"));ok(mode.enabled);mode.onDetachedFromWindow();
 // Unavailable shuffle is disabled with an accessible reason; no action is sent.
 Handler.clear();Toast.count=0;Activity t=new Activity();t.G=new WebView(t);PreviewPlayerMode sh=new PreviewPlayerMode(t,null);sh.setTag("shuffle");sh.onAttachedToWindow();Handler.step();t.G.reply("state=unknown;reason=bar");int before=t.G.calls;ok(!sh.enabled);ok(sh.description.contains("barre du lecteur Spotify absente"));sh.performClick();ok(t.G.calls==before);sh.onDetachedFromWindow();
 // Optimistic on/off, smart mode neutral while pending, and timeout reconciles only observed state.
 Handler.clear();t=new Activity();t.G=new WebView(t);sh=new PreviewPlayerMode(t,null);sh.setTag("shuffle");sh.onAttachedToWindow();Handler.step();t.G.reply(data("false"));sh.performClick();ok(sh.description.startsWith("Lecture aléatoire activée"));ok(sh.description.contains("en attente"));t.G.reply("sent=true");
 java.lang.reflect.Method obs=PreviewPlayerMode.class.getDeclaredMethod("observe");obs.setAccessible(true);obs.invoke(sh);t.G.reply(data("false"));Handler.advance(5001);ok(sh.description.startsWith("Lecture aléatoire désactivée"));ok(Toast.message.contains("Aléatoire indisponible"));
 SystemClock.t+=401;obs.invoke(sh);t.G.reply(data("mixed"));sh.performClick();ok(sh.description.startsWith("Aléatoire : état inconnu"));t.G.reply("sent=true");obs.invoke(sh);t.G.reply(data("false"));ok(sh.description.startsWith("Lecture aléatoire désactivée"));sh.onDetachedFromWindow();
 // Diagnostic snapshots retain categories only, not track or title.
 Handler.clear();t=new Activity();t.G=new WebView(t);sh=new PreviewPlayerMode(t,null);sh.setTag("shuffle");sh.onAttachedToWindow();Handler.step();
 t.G.reply(data("false")+";diagnostic=diag:state:false,reason:observed,command:toggle,label:off-action");sh.performClick();t.G.reply("sent=true");obs.invoke(sh);
 t.G.reply(data("true")+";diagnostic=diag:state:true,reason:observed,command:toggle,label:on-action");
 String report=PreviewPlayerMode.diagnosticReport();ok(report.contains("Répétition — actuel"));ok(report.contains("avant : état=false"));ok(report.contains("après : état=true"));ok(report.contains("changement observé"));ok(!report.contains("Titre")&&!report.contains("track:abc"));sh.onDetachedFromWindow();
 System.out.println("Player mode JVM simulation passed"); }
}'''

}
with tempfile.TemporaryDirectory(prefix='player-mode-jvm-') as tmp:
 r=Path(tmp); files=[]
 for name,content in stubs.items():
  p=r/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(content,encoding='utf8');files.append(str(p))
 files.append(str(here/'PreviewPlayerMode.java'));out=r/'classes';out.mkdir();java=os.environ.get('PREVIEW_TEST_JAVA','java');ecj=os.environ.get('PREVIEW_TEST_ECJ');compiler=[java,'-cp',ecj,'org.eclipse.jdt.internal.compiler.batch.Main'] if ecj else ['javac']
 subprocess.run(compiler+['-encoding','UTF-8','-source','8','-target','8','-d',str(out)]+files,check=True)
 subprocess.run([java,'-cp',str(out),'com.melodix.music.ModeTest'],check=True)
