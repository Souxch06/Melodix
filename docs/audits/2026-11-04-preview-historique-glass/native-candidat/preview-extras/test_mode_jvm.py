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
 static PreviewPlayerMode boot(Activity a,String kind){Handler.clear();Toast.count=0;PreviewPlayerMode m=new PreviewPlayerMode(a,null);m.setTag(kind);m.onAttachedToWindow();return m;}
 static Activity page(){Activity a=new Activity();a.G=new WebView(a);TextView title=new TextView(a);title.text="Titre";a.title=title;return a;}
 public static void main(String[] z) throws Exception {
 for(String kind:new String[]{"like","shuffle","repeat"}){
  Activity a=page();PreviewPlayerMode m=boot(a,kind);ok(!m.enabled);ok(m.description.startsWith("Chargement :"));
  // Control absent in the narrow bar: the button stays usable but neutral, never a fake state.
  Handler.step();a.G.reply(data("unknown")+";reason=control");Handler.advance(2500);ok(m.enabled);ok(m.description.startsWith("État inconnu"));
  // Known state: one tap starts one page job with the shown state and native title; second tap blocked.
  a.G.reply(data("false"));ok(m.enabled);int n=a.G.calls;m.performClick();ok(a.G.calls==n+1);ok(a.G.js.contains("\\"run\\"")&&a.G.js.contains("\\"false\\"")&&a.G.js.contains("\\"Titre\\""));ok(!m.enabled);m.performClick();ok(a.G.calls==n+1);
  a.G.reply("status=started");Handler.advance(250);ok(a.G.js.contains("\\"poll\\""));a.G.reply("status=running");Handler.advance(250);
  a.G.reply("status=done;outcome=confirmed;state=true;method=now-playing-view;journal=a:absent>b:found>b:click>b:verified");ok(m.enabled);
  ok(PreviewPlayerMode.diagnosticReport().contains("méthode=now-playing-view"));ok(!PreviewPlayerMode.diagnosticReport().contains("Titre"));
  // The narrow bar hides the control again: the last state actually read is kept.
  java.lang.reflect.Method observe=PreviewPlayerMode.class.getDeclaredMethod("observe");observe.setAccessible(true);observe.invoke(m);a.G.reply(data("unknown")+";reason=control");ok(m.enabled);ok(!m.description.startsWith("État inconnu"));
  // Unverifiable command: shown as unknown with an explicit message, never as on/off.
  SystemClock.t+=401;m.performClick();a.G.reply("status=started");Handler.advance(250);a.G.reply("status=done;outcome=unverified;state=unknown;method=keyboard");ok(m.description.startsWith("État inconnu"));ok(Toast.message.contains("non vérifiable"));
  // Unconfirmed action: French message with Réessayer.
  SystemClock.t+=401;m.performClick();a.G.reply("status=started");Handler.advance(250);a.G.reply("status=done;outcome=unconfirmed;state=false;method=direct");ok(Toast.message.contains("Réessayer"));
  // A lost job is bounded by the deadline and a late reply cannot re-enable a stale job.
  SystemClock.t+=401;observe.invoke(m);a.G.reply(data("false"));m.performClick();ValueCallback<String> late=a.G.cb;Handler.advance(7001);ok(Toast.message.contains("Réessayer")||Toast.message.contains("indisponible"));int toasts=Toast.count;late.onReceiveValue("status=started");ok(Toast.count==toasts);
  m.shown=false;m.onVisibilityChanged(m,8);ok(!m.enabled);m.onDetachedFromWindow();ok(!m.enabled);
 }
 // Nothing playing: disabled reason, the tap sends nothing.
 Activity t=page();PreviewPlayerMode sh=boot(t,"shuffle");Handler.step();t.G.reply("state=unknown;reason=bar");Handler.advance(2500);int before=t.G.calls;ok(!sh.enabled);ok(sh.description.contains("barre du lecteur Spotify absente"));sh.performClick();ok(t.G.calls==before);sh.onDetachedFromWindow();
 // Restricted shuffle stays disabled with its reason.
 t=page();sh=boot(t,"shuffle");Handler.step();t.G.reply("state=unknown;reason=restriction");Handler.advance(2500);ok(!sh.enabled);ok(sh.description.contains("pas disponible"));sh.onDetachedFromWindow();
 // Like read-only outcome updates the state without claiming an action.
 t=page();PreviewPlayerMode like=boot(t,"like");Handler.step();t.G.reply(data("unknown")+";reason=control");Handler.advance(2500);like.performClick();ok(t.G.js.contains("\\"unknown\\""));t.G.reply("status=started");Handler.advance(250);t.G.reply("status=done;outcome=read;state=true;method=now-playing-view");ok(like.description.startsWith("Titre aimé"));ok(Toast.message.contains("Déjà"));like.onDetachedFromWindow();
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
