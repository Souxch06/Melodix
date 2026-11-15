#!/usr/bin/env python3
"""JVM control state machine against stubs, not a real Android/Spotify test."""
import os,subprocess,tempfile
from pathlib import Path
here=Path(__file__).resolve().parent
stubs={
'android/util/AttributeSet.java':'package android.util; public interface AttributeSet {}',
'android/util/DisplayMetrics.java':'package android.util; public class DisplayMetrics { public float density=1; }',
'android/content/res/Resources.java':'package android.content.res; public class Resources { public int getIdentifier(String n,String t,String p){return 1;} public android.util.DisplayMetrics getDisplayMetrics(){return new android.util.DisplayMetrics();} }',
'android/content/Context.java':'package android.content; public class Context { public String getPackageName(){return "preview";} public android.content.res.Resources getResources(){return new android.content.res.Resources();} }',
'android/content/ContextWrapper.java':'package android.content; public class ContextWrapper extends Context { public Context getBaseContext(){return this;} }',
'android/app/Activity.java':'package android.app; public class Activity extends android.content.ContextWrapper { public android.webkit.WebView G; public android.view.View title; public android.view.View findViewById(int id){return title;} }',
'android/os/Looper.java':'package android.os; public class Looper { public static Looper getMainLooper(){return new Looper();} }',
'android/os/SystemClock.java':'package android.os; public class SystemClock { public static long t; public static long elapsedRealtime(){return t;} }',
'android/os/Handler.java':'''package android.os;import java.util.*;public class Handler { public static List<Runnable> todo=new ArrayList<Runnable>(); public Handler(Looper l){} public boolean post(Runnable r){todo.add(r);return true;} public boolean postDelayed(Runnable r,long d){todo.add(r);return true;} public void removeCallbacks(Runnable r){todo.removeIf(x->x==r);} public static void step(){Runnable r=todo.remove(0);r.run();} }''',
'android/view/HapticFeedbackConstants.java':'package android.view; public class HapticFeedbackConstants { public static final int KEYBOARD_TAP=3; }',
'android/view/View.java':'''package android.view;import android.content.*;public class View { public static final int VISIBLE=0; public interface OnClickListener{void onClick(View v);} public Context c;public Object tag;public boolean enabled=true,shown=true,attached=true;public OnClickListener click;public String description=""; public View(Context c){this.c=c;} public Context getContext(){return c;} public android.content.res.Resources getResources(){return c.getResources();} public Object getTag(){return tag;} public void setTag(Object x){tag=x;} public void setEnabled(boolean b){enabled=b;} public void setAlpha(float a){} public void setContentDescription(CharSequence s){description=s.toString();} public void setOnClickListener(OnClickListener l){click=l;} public void performClick(){if(enabled)click.onClick(this);} public boolean performHapticFeedback(int n){return true;} public boolean isAttachedToWindow(){return attached;} public boolean isShown(){return shown;} public int getWindowVisibility(){return 0;} public boolean post(Runnable r){r.run();return true;} protected void onAttachedToWindow(){} protected void onDetachedFromWindow(){} protected void onVisibilityChanged(View v,int n){} protected void onWindowVisibilityChanged(int n){} }''',
'android/widget/ImageButton.java':'package android.widget; public class ImageButton extends android.view.View { public ImageButton(android.content.Context c,android.util.AttributeSet a){super(c);} public void setImageResource(int x){} public void setColorFilter(int c){} }',
'android/widget/TextView.java':'package android.widget; public class TextView extends android.view.View { public String text=""; public TextView(android.content.Context c){super(c);} public CharSequence getText(){return text;} }',
'android/webkit/ValueCallback.java':'package android.webkit;public interface ValueCallback<T>{void onReceiveValue(T value);}',
'android/webkit/WebView.java':'''package android.webkit; public class WebView extends android.view.View { public int calls; public String js; public ValueCallback<String> cb; public WebView(android.content.Context c){super(c);} public void evaluateJavascript(String s,ValueCallback<String> c){calls++;js=s;cb=c;} public void reply(String s){cb.onReceiveValue(s);} }''',
'org/json/JSONTokener.java':'''package org.json;public class JSONTokener {String s;public JSONTokener(String s){this.s=s;}public Object nextValue(){return s;} }''',
'org/json/JSONObject.java':'''package org.json; import java.util.*;public class JSONObject {Map<String,String> m=new HashMap<String,String>();public JSONObject(String s){for(String p:s.split(";")){int i=p.indexOf('=');if(i>0)m.put(p.substring(0,i),p.substring(i+1));}}public static String quote(String s){return (char)34+s+(char)34;}public String optString(String k,String d){return m.containsKey(k)?m.get(k):d;}public boolean optBoolean(String k,boolean d){return m.containsKey(k)?Boolean.parseBoolean(m.get(k)):d;} }''',
'com/melodix/music/ModeTest.java':'''package com.melodix.music;import android.app.*;import android.os.*;import android.webkit.*;import android.widget.*;public class ModeTest {
 static void ok(boolean b){if(!b)throw new AssertionError();}
 public static void main(String[] z){Activity a=new Activity();a.G=new WebView(a);TextView title=new TextView(a);title.text="Titre";a.title=title;
 PreviewPlayerMode m=new PreviewPlayerMode(a,null);m.setTag("like");m.onAttachedToWindow();ok(!m.enabled);Handler.step();ok(a.G.calls==1);a.G.reply("state=false;track=track:abc;title=Titre");ok(m.enabled);ok(m.description.contains("Ajouter"));
 m.performClick();ok(a.G.calls==2);ok(!m.enabled);m.performClick();ok(a.G.calls==2);a.G.reply("sent=true");ok(!m.enabled);
 Handler.step();a.G.reply("state=false;track=track:abc;title=Titre");ok(!m.enabled);Handler.step();a.G.reply("state=true;track=track:abc;title=Titre");ok(m.enabled);ok(m.description.contains("Retirer"));
 title.text="Titre suivant";Handler.step();a.G.reply("state=true;track=track:abc;title=Titre");ok(!m.enabled);ok(m.description.contains("indisponible"));
 title.text="Titre";Handler.step();a.G.reply("state=false;track=track:abc;title=Titre");m.performClick();a.G.reply("sent=false");ok(!m.enabled);
 Handler.step();a.G.reply("state=false;track=track:abc;title=Titre");m.performClick();a.G.reply("sent=true");SystemClock.t+=5001;Handler.step();a.G.reply("state=false;track=track:abc;title=Titre");ok(m.enabled);
 m.shown=false;m.onVisibilityChanged(m,8);ok(!m.enabled);m.onDetachedFromWindow();System.out.println("Player mode JVM simulation passed"); }
}'''
}
with tempfile.TemporaryDirectory(prefix='player-mode-jvm-') as tmp:
 r=Path(tmp); files=[]
 for name,content in stubs.items():
  p=r/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(content,encoding='utf8');files.append(str(p))
 files.append(str(here/'PreviewPlayerMode.java'));out=r/'classes';out.mkdir();java=os.environ.get('PREVIEW_TEST_JAVA','java');ecj=os.environ.get('PREVIEW_TEST_ECJ');compiler=[java,'-cp',ecj,'org.eclipse.jdt.internal.compiler.batch.Main'] if ecj else ['javac']
 subprocess.run(compiler+['-encoding','UTF-8','-source','8','-target','8','-d',str(out)]+files,check=True)
 subprocess.run([java,'-cp',str(out),'com.melodix.music.ModeTest'],check=True)
