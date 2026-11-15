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
'android/view/Choreographer.java': '''package android.view; public class Choreographer { public interface FrameCallback { void doFrame(long n); } private static Choreographer c=new Choreographer(); public FrameCallback next; public static Choreographer getInstance(){return c;} public void postFrameCallback(FrameCallback f){next=f;} public static void frame(){FrameCallback f=c.next;c.next=null;if(f!=null)f.doFrame(0);} }''',
'android/view/View.java': '''package android.view; import java.util.*; public class View { public interface OnLongClickListener{ boolean onLongClick(View v); } public OnLongClickListener listener; public boolean shown=true; public boolean isShown(){return shown;} public Map<String,View> tags=new HashMap<String,View>(); public void setOnLongClickListener(OnLongClickListener l){listener=l;} public View findViewWithTag(Object tag){return tags.get(tag);} }''',
'android/widget/Toast.java': """package android.widget; import android.content.Context; public class Toast { public static int count; public static final int LENGTH_SHORT=0; public static Toast makeText(Context c,CharSequence s,int n){return new Toast();} public void show(){count++;} }""",
'org/json/JSONArray.java': """package org.json; public class JSONArray { private String[] rows; public JSONArray(String s){rows=s.isEmpty()?new String[0]:s.split(\"\\\\|\");} public int length(){return rows.length;} public JSONObject optJSONObject(int i){return new JSONObject(rows[i]);} }""",
'android/widget/TextView.java': '''package android.widget; public class TextView extends android.view.View { public String text=""; public CharSequence getText(){return text;} public void setText(CharSequence s){text=s.toString();} }''',
'android/widget/ImageView.java': '''package android.widget; public class ImageView extends android.view.View { public int image; public void setImageResource(int x){image=x;} }''',
'android/widget/ProgressBar.java': '''package android.widget; public class ProgressBar extends android.view.View { public int max,progress; public android.graphics.drawable.Drawable drawable=new android.graphics.drawable.LayerDrawable(); public android.graphics.drawable.Drawable getProgressDrawable(){return drawable;} public int getMax(){return max;} public int getProgress(){return progress;} public void setMax(int x){max=x;} public void setProgress(int x){progress=x;} }''',
'android/app/Activity.java': '''package android.app; import java.util.*;import android.view.View; public class Activity extends android.content.Context { public Map<Integer,View> views=new HashMap<Integer,View>(); public View findViewById(int i){return views.get(i);} }''',
'android/app/AlertDialog.java': '''package android.app;import android.content.DialogInterface; public class AlertDialog { public static DialogInterface.OnClickListener copy; public static String body; public static class Builder { public Builder(Activity a){} public Builder setTitle(CharSequence s){return this;} public Builder setMessage(CharSequence s){body=s.toString();return this;} public Builder setPositiveButton(CharSequence s,DialogInterface.OnClickListener l){copy=l;return this;} public Builder setNegativeButton(CharSequence s,DialogInterface.OnClickListener l){return this;} public AlertDialog show(){return new AlertDialog();} } }''',
# Flat fake data format is sufficient to exercise the controller, not JSON parsing.
'org/json/JSONObject.java': '''package org.json; import java.util.*;public class JSONObject { private Map<String,String> m=new HashMap<String,String>();public JSONObject(String s){for(String p:s.split(";")){int i=p.indexOf('=');if(i>0)m.put(p.substring(0,i),p.substring(i+1));}}public boolean has(String k){return m.containsKey(k);}public boolean optBoolean(String k,boolean d){String s=m.get(k);return s==null?d:Boolean.parseBoolean(s);}public String optString(String k,String d){String s=m.get(k);return s==null?d:s;}public long optLong(String k,long d){try{return Long.parseLong(m.get(k));}catch(Exception e){return d;}}}''',
'com/melodix/music/ControllerTest.java': r'''package com.melodix.music;
import android.app.*; import android.os.*; import android.view.*; import android.widget.*; import android.content.*;
public class ControllerTest {
 static void eq(long a,long b){if(a!=b)throw new AssertionError(a+" != "+b);} static void yes(boolean b){if(!b)throw new AssertionError();}
 static String sample(String track,long pos,long dur,boolean play,boolean advance,boolean valid){return "track=Song;artist=Artist;playing="+play+";previewTrackUri="+track+";previewPositionMs="+pos+";previewDurationMs="+dur+";previewAdvancing="+advance+";previewProgressValid="+valid;}
 public static void main(String[] ignored) throws Exception {
  Activity a=new Activity(); ProgressBar mini=new ProgressBar(), full=new ProgressBar(); TextView elapsed=new TextView(),duration=new TextView(),remain=new TextView(); ImageView b1=new ImageView(),b2=new ImageView(); View root=new View();root.tags.put("nativePlayerRemaining",remain);
  a.views.put(0x7f09024d,mini);a.views.put(0x7f09023d,full);a.views.put(0x7f09024a,elapsed);a.views.put(0x7f09024b,duration);a.views.put(0x7f090238,b1);a.views.put(0x7f09023e,b2);a.views.put(0x7f09023a,root);
  PreviewPlayerController c=new PreviewPlayerController(a);String t="spotify:track:secretTrack";SystemClock.time=0;
  // Glow only affects the clipped drawable, never progress. Paused/background,
  // invalid input, hidden bars and Android's disabled animations stop it.
  c.snapshot(sample(t,10000,120000,true,true,true));eq(mini.progress,83);eq(full.progress,83);
  eq(android.animation.ObjectAnimator.active(),0);c.activityResumed();eq(android.animation.ObjectAnimator.active(),2);
  // The legacy bridge feed contains milliseconds but no Preview fields. The
  // old native updater may have reset a view; same-track data must restore the
  // sample and keep the pulse instead of resetting progress to unknown.
  mini.progress=0;full.progress=0;c.snapshot("track=Song;artist=Artist;playing=true;position=10000;duration=120000");
  eq(mini.progress,83);eq(full.progress,83);eq(android.animation.ObjectAnimator.active(),2);
  c.snapshot("track=Other;artist=Artist;playing=true;position=0;duration=120000");
  yes(elapsed.text.equals("—"));eq(android.animation.ObjectAnimator.active(),0);
  c.snapshot(sample(t,10000,120000,true,true,true));eq(android.animation.ObjectAnimator.active(),2);
  c.snapshot("track=Song;artist=Artist;playing=false;position=10000;duration=120000");
  eq(android.animation.ObjectAnimator.active(),0);eq(mini.progress,83);
  c.snapshot(sample(t,10000,120000,true,true,true));eq(android.animation.ObjectAnimator.active(),2);
  mini.shown=false;c.snapshot(sample(t,10000,120000,true,true,true));eq(android.animation.ObjectAnimator.active(),1);
  mini.shown=true;c.snapshot(sample(t,10000,120000,true,true,true));eq(android.animation.ObjectAnimator.active(),2);
  c.activityStopped();eq(android.animation.ObjectAnimator.active(),0);
  c.snapshot(sample(t,10000,120000,true,true,true));eq(android.animation.ObjectAnimator.active(),0);
  android.animation.ValueAnimator.enabled=false;c.activityResumed();eq(android.animation.ObjectAnimator.active(),0);
  android.animation.ValueAnimator.enabled=true;c.snapshot(sample(t,10000,120000,true,true,true));eq(android.animation.ObjectAnimator.active(),2);
  c.snapshot(sample(t,10000,120000,false,false,true));eq(android.animation.ObjectAnimator.active(),0);eq(mini.progress,83);
  c.snapshot(sample(t,-1,-1,true,false,false));eq(android.animation.ObjectAnimator.active(),0);
  c.snapshot(sample(t,10000,120000,true,true,true));eq(android.animation.ObjectAnimator.active(),2);
  SystemClock.time=500;Choreographer.frame();eq(mini.progress,88);eq(full.progress,88);
  c.snapshot(sample(t,10800,120000,true,true,true));eq(mini.progress,88);SystemClock.time=1500;Choreographer.frame();eq(mini.progress,96);eq(full.progress,96);
  c.snapshot(sample(t,11000,120000,false,false,true));eq(mini.progress,92);SystemClock.time=6000;Choreographer.frame();eq(mini.progress,92);
  c.snapshot(sample(t,11000,120000,true,false,true));SystemClock.time=7000;Choreographer.frame();eq(mini.progress,92);
  c.snapshot(sample(t,119500,120000,true,true,true));SystemClock.time=9000;Choreographer.frame();eq(mini.progress,1000);eq(full.progress,1000);
  c.snapshot(sample("spotify:track:other",1000,120000,true,true,true));eq(mini.progress,8);
  c.snapshot(sample("spotify:track:other",-1,-1,true,false,false));eq(mini.progress,8);eq(full.progress,8);yes(elapsed.text.equals("0:01"));
  SystemClock.time=9500;Choreographer.frame();eq(mini.progress,8);
  c.snapshot(sample("",-1,-1,true,false,false));yes(elapsed.text.equals("—"));yes(remain.text.equals("Temps restant : —"));
  // Numeric, anonymous samples are displayed but never extrapolated as though
  // they belonged to the previously identified track.
  c.snapshot(sample("",23000,120000,true,true,true));eq(mini.progress,192);eq(full.progress,192);yes(elapsed.text.equals("0:23"));
  SystemClock.time=9900;Choreographer.frame();eq(mini.progress,192);
  c.snapshot(sample("",24000,120000,true,true,true));eq(mini.progress,200);
  c.snapshot(sample("",-1,-1,true,false,false));yes(elapsed.text.equals("—"));
  c.snapshot(sample(t,1000,120000,false,false,true));SystemClock.time=10000;eq(c.tapPlayPause(),1);eq(b1.image,0x7f080121);eq(b2.image,0x7f080121);
  SystemClock.time=10005;c.command();c.snapshot(sample(t,1000,120000,false,false,true));eq(b1.image,0x7f080121);
  SystemClock.time=10015;c.snapshot(sample(t,1100,120000,true,true,true));eq(b1.image,0x7f080121);
  java.lang.reflect.Method m=PreviewPlayerController.class.getDeclaredMethod("report");m.setAccessible(true);String report=(String)m.invoke(c);yes(report.contains("5 ms"));yes(report.contains("15 ms"));yes(report.contains("400 ms"));yes(!report.contains(t));yes(!report.contains("secretTrack"));
  c.loadState("waiting-token:no-token");report=(String)m.invoke(c);yes(report.contains("waiting-token:no-token"));
  c.loadState("https://example.com/secret?token=secret");report=(String)m.invoke(c);yes(!report.contains("secret"));yes(report.contains("waiting-token:no-token"));
  View about=new View();c.attachAbout(about);yes(about.listener.onLongClick(about));yes(AlertDialog.body.contains("Diagnostic Preview"));AlertDialog.copy.onClick(null,0);yes(ClipboardManager.copied.equals(AlertDialog.body));
  // A stale playing snapshot cannot restart an optimistically paused clock.
  SystemClock.time=11000; c.snapshot(sample(t,2000,120000,true,true,true));
  eq(c.tapPlayPause(),0); eq(android.animation.ObjectAnimator.active(),0); int frozen=mini.progress;
  SystemClock.time=11500; c.snapshot(sample(t,2500,120000,true,true,true)); eq(mini.progress,frozen);
  SystemClock.time=12000; Choreographer.frame(); eq(mini.progress,frozen);
  c.command(); c.snapshot(sample(t,2100,120000,false,false,true));
  // Existing player buttons have no lot-A quota or debounce.
  eq(c.tapPlayPause(),1);eq(c.tapPlayPause(),0);eq(c.tapPlayPause(),1);eq(c.tapPlayPause(),0);
  // Two minutes on a simulated clock: both bars use the same bounded position.
  c.activityStopped();
  PreviewPlayerController c2=new PreviewPlayerController(a); int previous=0;
  for(int second=0;second<120;second++){
   SystemClock.time=20000L+second*1000L;c2.snapshot(sample(t,second*1000L,120000,true,true,true));
   for(int frame=1;frame<=60;frame++){
    SystemClock.time=20000L+second*1000L+Math.round(frame*1000.0/60.0);c2.doFrame(0);
    yes(mini.progress>=previous);yes(mini.progress<=1000);eq(mini.progress,full.progress);previous=mini.progress;
   }
  }
  eq(mini.progress,1000);
  // The diagnostic reports why the clock is stopped without exposing IDs.
  PreviewPlayerController reason=new PreviewPlayerController(a);SystemClock.time=150000;
  report=(String)m.invoke(reason);yes(report.contains("état du lecteur indisponible"));
  reason.snapshot(sample("",1000,120000,true,false,true));report=(String)m.invoke(reason);yes(report.contains("identité du titre absente"));
  reason.snapshot(sample(t,1000,120000,false,false,true));report=(String)m.invoke(reason);yes(report.contains("lecture en pause"));
  reason.snapshot(sample(t,-1,-1,true,false,false));report=(String)m.invoke(reason);yes(report.contains("position ou durée indisponible"));
  reason.snapshot(sample(t,1000,120000,true,false,true));report=(String)m.invoke(reason);yes(report.contains("mouvement non confirmé"));
  reason.snapshot(sample(t,2000,120000,true,true,true));report=(String)m.invoke(reason);yes(report.contains("animation active"));
  SystemClock.time=152501;report=(String)m.invoke(reason);yes(report.contains("observation trop ancienne"));yes(!report.contains(t));
  reason.snapshot(sample("spotify:track:new",500,120000,true,false,true));eq(mini.progress,4);
  // Instrumentation uses frame preparation, not display presentation.
  SystemClock.time=200000;android.os.Process.start=199950;PreviewPlayerController metrics=new PreviewPlayerController(a);metrics.activityCreated();
  metrics.rowsPainted("home", "", "uri=spotify:track:One");SystemClock.time=200123;Choreographer.frame();
  metrics.playlistOpened("spotify:playlist:Visible");
  metrics.rowsPainted("detail", "spotify:playlist:Wrong", "uri=spotify:track:One");
  metrics.rowsPainted("detail", "spotify:playlist:Visible", "");
  SystemClock.time=200200;Choreographer.frame();
  report=(String)m.invoke(metrics);yes(report.contains("123 ms"));yes(report.contains("173 ms"));yes(report.contains("avec titres : —"));
  metrics.rowsPainted("detail", "spotify:playlist:Visible", "uri=spotify:track:One");
  SystemClock.time=200250;Choreographer.frame();report=(String)m.invoke(metrics);
  yes(report.contains("127 ms"));yes(!report.contains("Visible"));yes(!report.contains("track:One"));
  metrics.playlistOpened("spotify:collection:tracks");metrics.rowsPainted("detail", "spotify:collection:tracks", "uri=spotify:track:One");
  SystemClock.time=200300;Choreographer.frame();report=(String)m.invoke(metrics);yes(report.contains("avec titres : —"));
  // On Android below API 31, never call the process-start API and report unknown.
  for(String field:new String[]{"firstCreateAt","processStartAt","firstHomeFrameMs","processHomeFrameMs"}) {
   java.lang.reflect.Field fld=PreviewPlayerController.class.getDeclaredField(field);fld.setAccessible(true);fld.setLong(null,-1);
  }
  Build.VERSION.SDK_INT=30;int oldCalls=android.os.Process.calls;SystemClock.time=250000;
  PreviewPlayerController older=new PreviewPlayerController(a);older.activityCreated();older.rowsPainted("home","","");
  SystemClock.time=250050;Choreographer.frame();report=(String)m.invoke(older);
  eq(android.os.Process.calls,oldCalls);yes(report.contains("Android 12+) : —"));yes(report.contains("50 ms"));
  // Unconfirmed pause/play is reconciled and gets exactly one discreet message.
  SystemClock.time=300000;Handler.flush();PreviewPlayerController timeout=new PreviewPlayerController(a);timeout.snapshot(sample(t,1000,120000,false,false,true));
  int count=Toast.count;eq(timeout.tapPlayPause(),1);SystemClock.time+=8000;Handler.flush();eq(Toast.count,count+1);eq(b1.image,0x7f080122);
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
