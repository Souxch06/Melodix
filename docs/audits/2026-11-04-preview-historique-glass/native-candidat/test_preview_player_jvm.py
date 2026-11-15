#!/usr/bin/env python3
"""Run the actual Preview controller Java against deterministic Android stubs.

This is not ART, a real device, Spotify, audio, a frame-rate or latency test.
No Android session data or network is used. PREVIEW_TEST_ECJ may select an
Eclipse compiler jar when javac is unavailable locally; CI uses its JDK.
"""
import os
import subprocess
import tempfile
from pathlib import Path

HERE = Path(__file__).resolve().parent
SOURCE = HERE / 'preview-player/PreviewPlayerController.java'
STUBS = {
'android/R.java': """package android; public final class R { public static final class id { public static final int progress=0x0102000d; } }""",
'android/graphics/drawable/Drawable.java': """package android.graphics.drawable; public class Drawable { public int alpha=255; public Drawable mutate(){return this;} public void setAlpha(int a){alpha=a;} }""",
'android/graphics/drawable/LayerDrawable.java': """package android.graphics.drawable; public class LayerDrawable extends Drawable { public Drawable fill=new Drawable(); public Drawable findDrawableByLayerId(int id){return id==android.R.id.progress?fill:null;} }""",
'android/animation/ValueAnimator.java': """package android.animation; public class ValueAnimator { public static final int REVERSE=2, INFINITE=-1; public static boolean enabled=true; public static boolean areAnimatorsEnabled(){return enabled;} }""",
'android/animation/ObjectAnimator.java': """package android.animation; import android.graphics.drawable.Drawable; import java.util.*; public class ObjectAnimator extends ValueAnimator { public static List<ObjectAnimator> all=new ArrayList<ObjectAnimator>(); public Drawable target; public boolean started; public static ObjectAnimator ofInt(Object d,String p,int...v){if(!p.equals("alpha"))throw new AssertionError();ObjectAnimator a=new ObjectAnimator();a.target=(Drawable)d;all.add(a);return a;} public ObjectAnimator setDuration(long ms){if(ms!=1600)throw new AssertionError();return this;} public void setRepeatMode(int n){if(n!=REVERSE)throw new AssertionError();} public void setRepeatCount(int n){if(n!=INFINITE)throw new AssertionError();} public void start(){started=true;target.setAlpha(150);} public void cancel(){started=false;} public boolean isStarted(){return started;} public static int active(){int n=0;for(ObjectAnimator a:all)if(a.started)n++;return n;} }""",
'android/content/Context.java': '''package android.content; public class Context { public static final String CLIPBOARD_SERVICE="clipboard"; public Object getSystemService(String x){ return new ClipboardManager(); } }''',
'android/content/DialogInterface.java': '''package android.content; public interface DialogInterface { interface OnClickListener { void onClick(DialogInterface d,int i); } }''',
'android/content/ClipData.java': '''package android.content; public class ClipData { public final String text; private ClipData(String s){text=s;} public static ClipData newPlainText(CharSequence l,CharSequence s){return new ClipData(s.toString());} }''',
'android/content/ClipboardManager.java': '''package android.content; public class ClipboardManager { public static String copied; public void setPrimaryClip(ClipData d){copied=d.text;} }''',
'android/os/Looper.java': '''package android.os; public class Looper { public static Looper getMainLooper(){return new Looper();} }''',
'android/os/Build.java': """package android.os; public class Build { public static class VERSION { public static int SDK_INT=31; } }""",
'android/os/Process.java': """package android.os; public class Process { public static long start; public static int calls; public static long getStartElapsedRealtime(){calls++;return start;} }""",
'android/os/SystemClock.java': '''package android.os; public class SystemClock { public static long time; public static long elapsedRealtime(){return time;} }''',
'android/os/Handler.java': '''package android.os; import java.util.*; public class Handler { static class T { Runnable r;long at;T(Runnable x,long y){r=x;at=y;} } static List<T> tasks=new ArrayList<T>(); public Handler(Looper l){} public boolean postDelayed(Runnable r,long d){tasks.add(new T(r,SystemClock.time+d));return true;} public static void flush(){List<T> copy=new ArrayList<T>(tasks);for(T t:copy)if(t.at<=SystemClock.time){tasks.remove(t);t.r.run();}} }''',
'android/view/MotionEvent.java': """package android.view; public class MotionEvent { public static final int ACTION_CANCEL=3; public int getActionMasked(){return 3;} }""",
'android/view/Choreographer.java': '''package android.view; public class Choreographer { public interface FrameCallback { void doFrame(long n); } private static Choreographer c=new Choreographer(); public FrameCallback next; public static Choreographer getInstance(){return c;} public void postFrameCallback(FrameCallback f){next=f;} public static void frame(){FrameCallback f=c.next;c.next=null;if(f!=null)f.doFrame(0);} }''',
'android/view/View.java': '''package android.view; import java.util.*; public class View { public interface OnLongClickListener{ boolean onLongClick(View v); } public interface OnTouchListener{boolean onTouch(View v,MotionEvent e);} public void setOnTouchListener(OnTouchListener x){} public OnLongClickListener listener; public boolean shown=true; public boolean isShown(){return shown;} public Map<String,View> tags=new HashMap<String,View>(); public void setOnLongClickListener(OnLongClickListener l){listener=l;} public View findViewWithTag(Object tag){return tags.get(tag);} }''',
'android/widget/Toast.java': """package android.widget; import android.content.Context; public class Toast { public static int count; public static final int LENGTH_SHORT=0; public static Toast makeText(Context c,CharSequence s,int n){return new Toast();} public void show(){count++;} }""",
'org/json/JSONArray.java': """package org.json; public class JSONArray { private String[] rows; public JSONArray(String s){rows=s.isEmpty()?new String[0]:s.split(\"\\\\|\");} public int length(){return rows.length;} public JSONObject optJSONObject(int i){return new JSONObject(rows[i]);} }""",
'android/widget/TextView.java': '''package android.widget; public class TextView extends android.view.View { public String text=""; public CharSequence getText(){return text;} public void setText(CharSequence s){text=s.toString();} }''',
'android/widget/ImageView.java': '''package android.widget; public class ImageView extends android.view.View { public int image; public void setImageResource(int x){image=x;} }''',
'android/widget/ProgressBar.java': '''package android.widget; public class ProgressBar extends android.view.View { public int max,progress; public android.graphics.drawable.Drawable drawable=new android.graphics.drawable.LayerDrawable(); public android.graphics.drawable.Drawable getProgressDrawable(){return drawable;} public int getMax(){return max;} public int getProgress(){return progress;} public void setMax(int x){max=x;} public void setProgress(int x){progress=x;} }''',
'android/widget/SeekBar.java': """package android.widget; public class SeekBar extends ProgressBar { public interface OnSeekBarChangeListener { void onStartTrackingTouch(SeekBar b); void onProgressChanged(SeekBar b,int p,boolean u); void onStopTrackingTouch(SeekBar b); } public OnSeekBarChangeListener listener; public void setOnSeekBarChangeListener(OnSeekBarChangeListener x){listener=x;} }""",
'android/webkit/ValueCallback.java': """package android.webkit; public interface ValueCallback<T> { void onReceiveValue(T value); }""",
'android/webkit/WebView.java': """package android.webkit; public class WebView extends android.view.View { public int calls; public String js; public ValueCallback<String> callback; public void evaluateJavascript(String s,ValueCallback<String> c){calls++;js=s;callback=c;} public void reply(String s){if(callback!=null)callback.onReceiveValue(s);} }""",
'android/app/Activity.java': '''package android.app; import java.util.*;import android.view.View; public class Activity extends android.content.Context { public Map<Integer,View> views=new HashMap<Integer,View>(); public View findViewById(int i){return views.get(i);} }''',
'android/app/AlertDialog.java': '''package android.app;import android.content.DialogInterface; public class AlertDialog { public static DialogInterface.OnClickListener copy; public static String body; public static class Builder { public Builder(Activity a){} public Builder setTitle(CharSequence s){return this;} public Builder setMessage(CharSequence s){body=s.toString();return this;} public Builder setPositiveButton(CharSequence s,DialogInterface.OnClickListener l){copy=l;return this;} public Builder setNegativeButton(CharSequence s,DialogInterface.OnClickListener l){return this;} public AlertDialog show(){return new AlertDialog();} } }''',
# Flat fake data format is sufficient to exercise the controller, not JSON parsing.
'org/json/JSONObject.java': '''package org.json; import java.util.*;public class JSONObject { private Map<String,String> m=new HashMap<String,String>();public JSONObject(String s){for(String p:s.split(";")){int i=p.indexOf('=');if(i>0)m.put(p.substring(0,i),p.substring(i+1));}}public static String quote(String s){return (char)34+s+(char)34;}public boolean has(String k){return m.containsKey(k);}public boolean optBoolean(String k,boolean d){String s=m.get(k);return s==null?d:Boolean.parseBoolean(s);}public String optString(String k,String d){String s=m.get(k);return s==null?d:s;}public long optLong(String k,long d){try{return Long.parseLong(m.get(k));}catch(Exception e){return d;}}}''',
'com/melodix/music/ControllerTest.java': r'''package com.melodix.music;
import android.app.*; import android.os.*; import android.view.*; import android.widget.*; import android.content.*;
public class ControllerTest {
 static void yes(boolean b){if(!b)throw new AssertionError();} static void eq(long a,long b){if(a!=b)throw new AssertionError(a+" != "+b);}
 static String sample(String title,String artist,long pos,long dur,String state,String uri){return "track="+title+";artist="+artist+";playing="+state.equals("playing")+";previewPlaybackState="+state+";previewTrackUri="+uri+";previewPositionMs="+pos+";previewDurationMs="+dur+";previewProgressValid="+(pos>=0&&dur>0);}
 public static void main(String[] ignored) throws Exception {
  Activity a=new Activity(); ProgressBar mini=new ProgressBar(); SeekBar full=new SeekBar(); TextView elapsed=new TextView(),duration=new TextView(),remain=new TextView(); ImageView b1=new ImageView(),b2=new ImageView();View root=new View();root.tags.put("nativePlayerRemaining",remain);
  a.views.put(0x7f09024d,mini);a.views.put(0x7f09023d,full);a.views.put(0x7f09024a,elapsed);a.views.put(0x7f09024b,duration);a.views.put(0x7f090238,b1);a.views.put(0x7f09023e,b2);a.views.put(0x7f09023a,root);
  java.lang.reflect.Method reportMethod=PreviewPlayerController.class.getDeclaredMethod("report");reportMethod.setAccessible(true);
  SystemClock.time=1000;PreviewPlayerController c=new PreviewPlayerController(a);c.activityResumed();
  c.snapshot(sample("Song","Artist",10000,180000,"playing",""));
  eq(mini.progress,56);eq(android.animation.ObjectAnimator.active(),2);
  // Sparse measurements, no URI, 120 seconds of interpolation and diagnostics.
  for(int i=1;i<=120;i++) {SystemClock.time=1000L+i*1000L;Handler.flush();Choreographer.frame();if(i==56||i==112)c.snapshot(sample("Song","Artist",10000L+i*1000L,180000,"playing",""));eq(mini.progress,full.progress);}
  yes(mini.progress>700);String report=(String)reportMethod.invoke(c);yes(report.contains("identité de titre présente : oui"));yes(report.contains("animation active"));yes(report.contains("56000 ms"));eq(report.split("identité=",-1).length-1,120);yes(!report.contains("Song")&&!report.contains("Artist"));
  // Legacy callback must not impose a false pause, but changes invalidate.
  int before=mini.progress;c.snapshot("track=Song;artist=Artist;playing=false");SystemClock.time+=1000;Choreographer.frame();yes(mini.progress>before);
  c.snapshot("track=Other;artist=Artist;playing=true");yes(elapsed.text.equals("—"));
  c.snapshot(sample("Other","Artist",2000,180000,"playing",""));eq(mini.progress,11);
  c.snapshot(sample("Other","Artist",20000,200000,"playing",""));eq(mini.progress,100);
  c.snapshot(sample("Other","Artist",1000,200000,"playing",""));eq(mini.progress,5);
  // Unknown state is stopped unless a trustworthy native audio signal exists.
  c.snapshot(sample("Other","Artist",1000,200000,"unknown",""));before=mini.progress;SystemClock.time+=5000;Choreographer.frame();eq(mini.progress,before);report=(String)reportMethod.invoke(c);yes(report.contains("aucun signal audio fiable"));
  c.snapshot(sample("Other","Artist",1000,200000,"paused",""));SystemClock.time+=5000;Choreographer.frame();eq(mini.progress,before);
  c.snapshot(sample("Other","Artist",1000,200000,"playing",""));SystemClock.time+=1000;Choreographer.frame();yes(mini.progress>before);
  c.snapshot(sample("No Track","No Artist",1000,200000,"playing",""));before=mini.progress;SystemClock.time+=1000;Choreographer.frame();eq(mini.progress,before);report=(String)reportMethod.invoke(c);yes(report.contains("identité titre/artiste/durée absente"));
  c.activityStopped();eq(android.animation.ObjectAnimator.active(),0);
  // Real controller touch listener: one command on release, optimistic preview,
  // independent clock confirmation, bounds, pause, timeout and track change.
  android.webkit.WebView web=new android.webkit.WebView();PreviewPlayerController seek=new PreviewPlayerController(a);
  seek.attachSeek(web);yes(full.listener==seek);SystemClock.time=200000;
  seek.snapshot(sample("Seek","Artist",10000,120000,"playing",""));
  full.listener.onStartTrackingTouch(full);full.listener.onProgressChanged(full,500,true);
  yes(elapsed.text.equals("1:00"));eq(web.calls,0);
  seek.snapshot(sample("Seek","Artist",11000,120000,"playing","")+";previewConfirmPositionMs=11000");yes(elapsed.text.equals("1:00"));
  SystemClock.time+=250;
  full.listener.onStopTrackingTouch(full);full.listener.onStopTrackingTouch(full);eq(web.calls,1);yes(web.js.contains("60000"));
  SystemClock.time+=40;web.reply("true");
  SystemClock.time+=960;seek.snapshot(sample("Seek","Artist",60000,120000,"playing","")+";previewConfirmPositionMs=12000");yes(mini.progress>=500);
  SystemClock.time+=400;seek.snapshot(sample("Seek","Artist",60000,120000,"playing","")+";previewConfirmPositionMs=61000");
  report=(String)reportMethod.invoke(seek);yes(report.contains("envoi WebView : 0 ms ; fin JS : 40 ms (action invoquée)"));
  yes(report.contains("première position UI différente : 1000 ms ; position UI confirmée : 1400 ms"));
  yes(report.contains("âge dernière observation reçue au relâchement : 250 ms"));yes(report.contains("position UI ≠ son"));
  yes(!report.contains("Artist"));
  SystemClock.time+=5000;Handler.flush();eq(Toast.count,0);
  // Tap / release beyond the right edge is clamped, including while paused.
  seek.snapshot(sample("Seek","Artist",61000,120000,"paused",""));
  full.listener.onStartTrackingTouch(full);full.listener.onProgressChanged(full,1500,true);full.listener.onStopTrackingTouch(full);eq(web.calls,2);yes(web.js.contains("120000"));yes(elapsed.text.equals("2:00"));
  web.reply("false");
  seek.snapshot(sample("Seek","Artist",120000,120000,"paused","")+";previewConfirmPositionMs=70000");SystemClock.time+=5001;Handler.flush();yes(elapsed.text.equals("1:10"));eq(Toast.count,1);
  report=(String)reportMethod.invoke(seek);yes(report.contains("action refusée"));yes(report.contains("non confirmée après 5 s"));
  // Track change during drag cancels; track change after dispatch cancels timeout.
  full.listener.onStartTrackingTouch(full);full.listener.onProgressChanged(full,200,true);
  seek.snapshot(sample("Next","Artist",1000,120000,"playing",""));full.listener.onStopTrackingTouch(full);eq(web.calls,2);yes(elapsed.text.equals("0:01"));
  full.listener.onStartTrackingTouch(full);full.listener.onProgressChanged(full,400,true);full.listener.onStopTrackingTouch(full);eq(web.calls,3);
  seek.snapshot(sample("Next2","Artist",2000,120000,"playing",""));SystemClock.time+=5001;Handler.flush();eq(Toast.count,1);yes(!elapsed.text.equals("0:48"));
  report=(String)reportMethod.invoke(seek);yes(report.contains("annulé (identité changée ou invalide)"));
  // A cancelled gesture must not dispatch a seek.
  full.listener.onStartTrackingTouch(full);full.listener.onProgressChanged(full,600,true);
  seek.onTouch(full,new MotionEvent());full.listener.onStopTrackingTouch(full);eq(web.calls,3);
  // Hour formatting comes from the same real duration and clamped target.
  seek.snapshot(sample("Long","Artist",1000,7200000,"paused",""));full.listener.onStartTrackingTouch(full);full.listener.onProgressChanged(full,500,true);yes(elapsed.text.equals("1:00:00"));full.listener.onStopTrackingTouch(full);
  // No baseline: absence is not reported as an observed change. Missing WebView
  // is also explicit; neither case invents an acknowledgement.
  PreviewPlayerController absent=new PreviewPlayerController(a);absent.attachSeek(null);SystemClock.time+=100;
  absent.snapshot(sample("Unknown","Artist",1000,120000,"playing",""));
  full.listener.onStartTrackingTouch(full);full.listener.onProgressChanged(full,500,true);full.listener.onStopTrackingTouch(full);
  SystemClock.time+=800;absent.snapshot(sample("Unknown","Artist",60000,120000,"playing","")+";previewConfirmPositionMs=2000");
  report=(String)reportMethod.invoke(absent);yes(report.contains("envoi WebView : —"));yes(report.contains("WebView indisponible"));
  yes(report.contains("première position UI différente : —"));yes(report.contains("âge dernière observation reçue au relâchement : —"));
  // Only eight seeks retained; a late callback from an overwritten slot cannot
  // overwrite another gesture's diagnostics or issue extra commands.
  PreviewPlayerController ring=new PreviewPlayerController(a);android.webkit.WebView w2=new android.webkit.WebView();ring.attachSeek(w2);
  ring.snapshot(sample("PrivateTitle","PrivateArtist",10000,120000,"playing","")+";previewConfirmPositionMs=10000");
  android.webkit.ValueCallback<String> oldCallback=null;
  for(int i=0;i<9;i++){full.listener.onStartTrackingTouch(full);full.listener.onProgressChanged(full,300+i,true);full.listener.onStopTrackingTouch(full);if(i==0)oldCallback=w2.callback;}
  oldCallback.onReceiveValue("true");eq(w2.calls,9);
  report=(String)reportMethod.invoke(ring);yes(!report.contains("#1 relâchement"));yes(report.contains("#9 relâchement"));
  yes(!report.contains("action invoquée"));yes(!report.contains("PrivateTitle")&&!report.contains("PrivateArtist"));
  yes(report.contains("remplacé par un nouveau geste"));
  // Playlist timing is monotonic, anonymous, and only uses observed phases.
  PreviewPlayerController metrics=new PreviewPlayerController(a);SystemClock.time=300000;metrics.playlistOpened("spotify:playlist:Secret");metrics.loadState("waiting-bridge:unknown");
  SystemClock.time+=3000;metrics.phase("bridge-ready");SystemClock.time+=100;metrics.phase("navigation");SystemClock.time+=500;metrics.phase("page-ready|spotify:playlist:Wrong");
  report=(String)reportMethod.invoke(metrics);yes(report.contains("indéterminée (phases manquantes ou non séquentielles)"));
  metrics.phase("page-ready|spotify:playlist:Secret");SystemClock.time+=300;metrics.phase("rows-received");metrics.rowsPainted("detail","spotify:playlist:Secret","uri=spotify:track:Hidden");SystemClock.time+=20;Choreographer.frame();
  metrics.loadState("waiting-bridge:unknown");
  report=(String)reportMethod.invoke(metrics);yes(report.contains("attente pont : 3000 ms"));yes(report.contains("navigation → page prête : 500 ms"));yes(report.contains("Phase dominante : attente pont"));yes(report.contains("waiting-bridge avec lignes : oui"));yes(report.contains("data:unknown"));yes(!report.contains("Secret")&&!report.contains("Hidden"));
  View about=new View();metrics.attachAbout(about);yes(about.listener.onLongClick(about));AlertDialog.copy.onClick(null,0);yes(ClipboardManager.copied.equals(AlertDialog.body));
  System.out.println("Preview controller JVM simulation passed");
 }
}''',
}

def main():
    with tempfile.TemporaryDirectory(prefix='preview-player-jvm-') as tmp:
        root = Path(tmp); files = []
        for name, content in STUBS.items():
            p = root/name; p.parent.mkdir(parents=True, exist_ok=True); p.write_text(content, encoding='utf8'); files.append(str(p))
        files.append(str(SOURCE)); out = root/'classes'; out.mkdir()
        java = os.environ.get('PREVIEW_TEST_JAVA', 'java')
        ecj = os.environ.get('PREVIEW_TEST_ECJ')
        compile_command = ([java, '-cp', ecj, 'org.eclipse.jdt.internal.compiler.batch.Main'] if ecj else ['javac'])
        subprocess.run(compile_command + ['-encoding', 'UTF-8', '-source', '8', '-target', '8', '-d', str(out)] + files, check=True)
        subprocess.run([java, '-cp', str(out), 'com.melodix.music.ControllerTest'], check=True)

if __name__ == '__main__': main()
