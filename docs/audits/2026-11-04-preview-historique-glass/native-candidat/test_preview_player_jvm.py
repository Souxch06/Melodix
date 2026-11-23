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
'android/graphics/Bitmap.java': 'package android.graphics; public class Bitmap {}',
'android/graphics/drawable/BitmapDrawable.java': 'package android.graphics.drawable; public class BitmapDrawable extends Drawable { public android.graphics.Bitmap getBitmap(){return new android.graphics.Bitmap();} }',
'com/melodix/music/PreviewLastTrackStore.java': """package com.melodix.music; import android.app.Activity; import android.graphics.Bitmap; public class PreviewLastTrackStore { static class Record {String title,artist,state; long duration,position,observed; byte[] image;} interface Callback {void loaded(Record r,Bitmap b,String status);} static Record stored; static Callback callback; static int saves; static boolean valid(Record r,long now){return true;} static void load(Activity a,Callback c){callback=c;} static void deliver(){callback.loaded(stored,null,stored==null?"absent":"valide");} static String writeStatus(){return "simulation";} static void save(Activity a,Record r,Bitmap b){stored=r;saves++;} static void clear(Activity a){stored=null;} }""",

'com/squareup/picasso/Picasso.java': 'package com.squareup.picasso; public class Picasso { public static Picasso get(){return new Picasso();} public RequestCreator load(String u){return new RequestCreator();} }',
'com/squareup/picasso/RequestCreator.java': 'package com.squareup.picasso; public class RequestCreator { public RequestCreator noPlaceholder(){return this;} public RequestCreator resize(int a,int b){return this;} public RequestCreator centerCrop(){return this;} public void into(android.widget.ImageView v){} }',
'com/melodix/music/NativeImageLoader.java': 'package com.melodix.music; public class NativeImageLoader { static int loads; public static void load(android.widget.ImageView v,String u,int s){loads++;} }',
'com/melodix/music/PreviewPlayerMode.java': 'package com.melodix.music; public class PreviewPlayerMode { static int repeatMode; static boolean shuffleMode; public static String diagnosticReport(){return "\\nControl diagnostic";} }',
'com/melodix/music/PreviewPlayerVolume.java': 'package com.melodix.music; public class PreviewPlayerVolume { public static String diagnosticReport(){return "\\nVolume diagnostic";} }',
'com/melodix/music/PreviewPlayerTiles.java': 'package com.melodix.music; public class PreviewPlayerTiles { public static String diagnosticReport(){return "\\nPanels diagnostic";} }',
'android/R.java': """package android; public final class R { public static final class id { public static final int progress=0x0102000d; } }""",
'android/graphics/drawable/Drawable.java': """package android.graphics.drawable; public class Drawable { public int alpha=255; public Drawable mutate(){return this;} public void setAlpha(int a){alpha=a;} }""",
'android/graphics/drawable/LayerDrawable.java': """package android.graphics.drawable; public class LayerDrawable extends Drawable { public Drawable fill=new Drawable(); public Drawable findDrawableByLayerId(int id){return id==android.R.id.progress?fill:null;} }""",
'android/animation/ValueAnimator.java': """package android.animation; public class ValueAnimator { public static final int REVERSE=2, INFINITE=-1; public static boolean enabled=true; public static boolean areAnimatorsEnabled(){return enabled;} }""",
'android/animation/ObjectAnimator.java': """package android.animation; import android.graphics.drawable.Drawable; import java.util.*; public class ObjectAnimator extends ValueAnimator { public static List<ObjectAnimator> all=new ArrayList<ObjectAnimator>(); public Drawable target; public boolean started; public static ObjectAnimator ofInt(Object d,String p,int...v){if(!p.equals("alpha"))throw new AssertionError();ObjectAnimator a=new ObjectAnimator();a.target=(Drawable)d;all.add(a);return a;} public ObjectAnimator setDuration(long ms){if(ms!=1600)throw new AssertionError();return this;} public void setRepeatMode(int n){if(n!=REVERSE)throw new AssertionError();} public void setRepeatCount(int n){if(n!=INFINITE)throw new AssertionError();} public void start(){started=true;target.setAlpha(150);} public void cancel(){started=false;} public boolean isStarted(){return started;} public static int active(){int n=0;for(ObjectAnimator a:all)if(a.started)n++;return n;} }""",
'android/content/Context.java': '''package android.content; public class Context { public static final String CLIPBOARD_SERVICE="clipboard"; public static final int MODE_PRIVATE=0; public Object getSystemService(String x){ return new ClipboardManager(); } public SharedPreferences prefs=new SharedPreferences(); public SharedPreferences getSharedPreferences(String n,int m){ return prefs; } }''',
'android/content/SharedPreferences.java': '''package android.content; import java.util.*; public class SharedPreferences { public Map<String,Object> m=new HashMap<String,Object>(); public String getString(String k,String d){Object v=m.get(k);return v==null?d:(String)v;} public long getLong(String k,long d){Object v=m.get(k);return v==null?d:(Long)v;} public Map<String,?> getAll(){return new HashMap<String,Object>(m);} public Editor edit(){return new Editor();} public class Editor { Map<String,Object> p=new HashMap<String,Object>(); List<String> r=new ArrayList<String>(); public Editor putString(String k,String v){p.put(k,v);return this;} public Editor putLong(String k,long v){p.put(k,v);return this;} public Editor remove(String k){r.add(k);return this;} public void apply(){for(String k:r)m.remove(k);m.putAll(p);} public boolean commit(){apply();return true;} } }''',
'android/content/DialogInterface.java': '''package android.content; public interface DialogInterface { interface OnClickListener { void onClick(DialogInterface d,int i); } }''',
'android/content/ClipData.java': '''package android.content; public class ClipData { public final String text; private ClipData(String s){text=s;} public static ClipData newPlainText(CharSequence l,CharSequence s){return new ClipData(s.toString());} }''',
'android/content/ClipboardManager.java': '''package android.content; public class ClipboardManager { public static String copied; public void setPrimaryClip(ClipData d){copied=d.text;} }''',
'android/os/Looper.java': '''package android.os; public class Looper { public static Looper getMainLooper(){return new Looper();} }''',
'android/os/Build.java': """package android.os; public class Build { public static class VERSION { public static int SDK_INT=31; } }""",
'android/os/Process.java': """package android.os; public class Process { public static long start; public static int calls; public static long getStartElapsedRealtime(){calls++;return start;} }""",
'android/os/SystemClock.java': '''package android.os; public class SystemClock { public static long time; public static long elapsedRealtime(){return time;} }''',
'android/os/Handler.java': '''package android.os; import java.util.*; public class Handler { static class T { Runnable r;long at;T(Runnable x,long y){r=x;at=y;} } static List<T> tasks=new ArrayList<T>(); public Handler(Looper l){} public boolean postDelayed(Runnable r,long d){tasks.add(new T(r,SystemClock.time+d));return true;} public boolean post(Runnable r){return postDelayed(r,0);} public void removeCallbacks(Runnable r){for(Iterator<T> i=tasks.iterator();i.hasNext();)if(i.next().r==r)i.remove();} public static void flush(){List<T> copy=new ArrayList<T>(tasks);for(T t:copy)if(t.at<=SystemClock.time){tasks.remove(t);t.r.run();}} }''',
'android/view/MotionEvent.java': """package android.view; public class MotionEvent { public static final int ACTION_CANCEL=3; public int getActionMasked(){return 3;} }""",
'android/view/Choreographer.java': '''package android.view; public class Choreographer { public interface FrameCallback { void doFrame(long n); } private static Choreographer c=new Choreographer(); public FrameCallback next; public static Choreographer getInstance(){return c;} public void postFrameCallback(FrameCallback f){next=f;} public static void frame(){FrameCallback f=c.next;c.next=null;if(f!=null)f.doFrame(0);} }''',
'android/view/View.java': '''package android.view; import java.util.*; public class View { public int id=-1; public int getId(){return id;} public float viewAlpha=1f; public void setAlpha(float f){viewAlpha=f;} public interface OnLongClickListener{ boolean onLongClick(View v); } public interface OnTouchListener{boolean onTouch(View v,MotionEvent e);} public void setOnTouchListener(OnTouchListener x){} public OnLongClickListener listener; public String description=""; public void setContentDescription(CharSequence s){description=s.toString();} public boolean shown=true; public static final int VISIBLE=0,GONE=8; public int visibility=VISIBLE; public int getVisibility(){return visibility;} public void setVisibility(int x){visibility=x;} public boolean isShown(){return shown && visibility==VISIBLE;} public Map<String,View> tags=new HashMap<String,View>(); public void setOnLongClickListener(OnLongClickListener l){listener=l;} public View findViewWithTag(Object tag){return tags.get(tag);} public boolean performClick(){return false;} public void invalidate(){} }''',
'android/widget/Toast.java': """package android.widget; import android.content.Context; public class Toast { public static int count; public static final int LENGTH_SHORT=0; public static final int LENGTH_LONG=1; public static Toast makeText(Context c,CharSequence s,int n){return new Toast();} public void show(){count++;} }""",
'org/json/JSONArray.java': """package org.json; public class JSONArray { private String[] rows; public JSONArray(String s){rows=s.isEmpty()?new String[0]:s.split(\"\\\\|\");} public JSONArray(){rows=new String[0];} public JSONArray put(Object o){String[] n=java.util.Arrays.copyOf(rows,rows.length+1);n[rows.length]=String.valueOf(o);rows=n;return this;} public String toString(){return String.join(\"|\",rows);} public int length(){return rows.length;} public JSONObject optJSONObject(int i){return new JSONObject(rows[i]);} }""",
'com/melodix/music/PreviewPlayerControllerPlayAll.java': 'package com.melodix.music; final class PreviewPlayerControllerPlayAll { static final String TAG="melodixPlayAll"; static int adds; static String title(org.json.JSONObject o){return o.optString("title","");} static String artist(org.json.JSONObject o){return o.optString("subtitle","");} static void add(android.app.Activity a,String rows){adds++;} }',
'android/view/ViewGroup.java': '''package android.view; public class ViewGroup extends View { public java.util.List<View> kids=new java.util.ArrayList<View>(); public int getChildCount(){return kids.size();} public View getChildAt(int i){return kids.get(i);} }''',
'android/widget/TextView.java': '''package android.widget; public class TextView extends android.view.View { public String text=""; public CharSequence getText(){return text;} public void setText(CharSequence s){text=s.toString();} public int color=0xffffffff; public int getCurrentTextColor(){return color;} public void setTextColor(int c){color=c;} }''',
'android/widget/ImageView.java': '''package android.widget; public class ImageView extends android.view.View { public int image; public void setImageResource(int x){image=x;} public void setImageBitmap(android.graphics.Bitmap b){} public android.graphics.drawable.Drawable getDrawable(){return null;} }''',
'android/widget/ProgressBar.java': '''package android.widget; public class ProgressBar extends android.view.View { public int max,progress; public android.graphics.drawable.Drawable drawable=new android.graphics.drawable.LayerDrawable(); public android.graphics.drawable.Drawable getProgressDrawable(){return drawable;} public int getMax(){return max;} public int getProgress(){return progress;} public void setMax(int x){max=x;} public void setProgress(int x){progress=x;} }''',
'android/widget/SeekBar.java': """package android.widget; public class SeekBar extends ProgressBar { public interface OnSeekBarChangeListener { void onStartTrackingTouch(SeekBar b); void onProgressChanged(SeekBar b,int p,boolean u); void onStopTrackingTouch(SeekBar b); } public OnSeekBarChangeListener listener; public void setOnSeekBarChangeListener(OnSeekBarChangeListener x){listener=x;} }""",
'android/webkit/ValueCallback.java': """package android.webkit; public interface ValueCallback<T> { void onReceiveValue(T value); }""",
'android/webkit/WebView.java': """package android.webkit; public class WebView extends android.view.View { public int calls; public String js; public ValueCallback<String> callback; public int probes; public void evaluateJavascript(String s,ValueCallback<String> c){if(s.contains("__sfMelodixBridgeStarted")){probes++;c.onReceiveValue("true ; true ; script ; - ; 0 ; 1");return;}if(s.contains("/album/")){probes++;c.onReceiveValue("");return;}if(s.contains("__sfPrbPing")){probes++;return;}if(s.contains("Object.keys(window)")){probes++;c.onReceiveValue("x");return;}if(s.contains("__spotiduck_bridge_applied===true&&")){probes++;c.onReceiveValue("1");return;}calls++;js=s;callback=c;} public void reply(String s){if(callback!=null)callback.onReceiveValue(s);} public String getUrl(){return null;} public int getProgress(){return 0;} }""",
'android/content/res/AssetManager.java': '''package android.content.res; public class AssetManager { public java.io.InputStream open(String n) throws java.io.IOException { throw new java.io.FileNotFoundException(n); } }''',
'android/app/Activity.java': '''package android.app; import java.util.*;import android.view.View; public class Activity extends android.content.Context { public Map<Integer,View> views=new HashMap<Integer,View>(); public View findViewById(int i){return views.get(i);} public boolean isFinishing(){return false;} public android.content.res.AssetManager getAssets(){return new android.content.res.AssetManager();} public java.io.File getFilesDir(){return new java.io.File("/nonexistent-melodix");} }''',
'android/app/AlertDialog.java': '''package android.app;import android.content.DialogInterface; public class AlertDialog { public static DialogInterface.OnClickListener copy; public static String body; public static class Builder { public Builder(Activity a){} public Builder setTitle(CharSequence s){return this;} public Builder setMessage(CharSequence s){body=s.toString();return this;} public Builder setPositiveButton(CharSequence s,DialogInterface.OnClickListener l){copy=l;return this;} public Builder setNegativeButton(CharSequence s,DialogInterface.OnClickListener l){return this;} public AlertDialog show(){return new AlertDialog();} } }''',
# Flat fake data format is sufficient to exercise the controller, not JSON parsing.
'org/json/JSONObject.java': '''package org.json; import java.util.*;public class JSONObject { private Map<String,String> m=new HashMap<String,String>();public JSONObject(String s){for(String p:s.split(";")){int i=p.indexOf('=');if(i>0)m.put(p.substring(0,i),p.substring(i+1));}}public JSONObject(){} public JSONObject put(String k,Object v){m.put(k,String.valueOf(v));return this;} public String toString(){StringBuilder b=new StringBuilder();for(Map.Entry<String,String> e:m.entrySet()){if(b.length()>0)b.append(';');b.append(e.getKey()).append('=').append(e.getValue());}return b.toString();}public static String quote(String s){return (char)34+s+(char)34;}public boolean has(String k){return m.containsKey(k);}public Iterator<String> keys(){return new TreeSet<String>(m.keySet()).iterator();}public boolean optBoolean(String k,boolean d){String s=m.get(k);return s==null?d:Boolean.parseBoolean(s);}public String optString(String k,String d){String s=m.get(k);return s==null?d:s;}public long optLong(String k,long d){try{return Long.parseLong(m.get(k));}catch(Exception e){return d;}}}''',
'com/melodix/music/ControllerTest.java': r'''package com.melodix.music;
import android.app.*; import android.os.*; import android.view.*; import android.widget.*; import android.content.*;
public class ControllerTest {
 static void yes(boolean b){if(!b)throw new AssertionError();} static void eq(long a,long b){if(a!=b)throw new AssertionError(a+" != "+b);}
 static String sample(String title,String artist,long pos,long dur,String state,String uri){return "track="+title+";artist="+artist+";playing="+state.equals("playing")+";previewPlaybackState="+state+";previewTrackUri="+uri+";previewPositionMs="+pos+";previewDurationMs="+dur+";previewProgressValid="+(pos>=0&&dur>0)+";previewObservedAtMs="+System.currentTimeMillis();}
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
  c.snapshot("track=Other;artist=Artist;playing=true");yes(elapsed.text.equals("-:--"));
  c.snapshot(sample("Other","Artist",2000,180000,"playing",""));eq(mini.progress,11);
  c.snapshot(sample("Other","Artist",20000,200000,"playing",""));eq(mini.progress,100);
  c.snapshot(sample("Other","Artist",1000,200000,"playing",""));eq(mini.progress,100);
  // Unknown state is stopped unless a trustworthy native audio signal exists.
  c.snapshot(sample("Other2","Artist",1000,200000,"unknown",""));before=mini.progress;SystemClock.time+=5000;Choreographer.frame();eq(mini.progress,before);report=(String)reportMethod.invoke(c);yes(report.contains("aucun signal audio fiable"));
  c.snapshot(sample("Other2","Artist",1000,200000,"paused",""));SystemClock.time+=5000;Choreographer.frame();eq(mini.progress,before);
  c.snapshot(sample("Other2","Artist",1000,200000,"playing",""));SystemClock.time+=1000;Choreographer.frame();yes(mini.progress>before);
  c.snapshot(sample("No Track","No Artist",1000,200000,"playing",""));before=mini.progress;SystemClock.time+=1000;Choreographer.frame();yes(mini.progress>before);report=(String)reportMethod.invoke(c);yes(report.contains("identité incomplète"));
  c.activityStopped();eq(android.animation.ObjectAnimator.active(),0);
  // Real controller touch listener: one command on release, optimistic preview,
  // independent clock confirmation, bounds, pause, timeout and track change.
  android.webkit.WebView web=new android.webkit.WebView();PreviewPlayerController seek=new PreviewPlayerController(a);
  seek.activityResumed();seek.attachSeek(web);yes(full.listener==seek);SystemClock.time=200000;
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
  PreviewPlayerController absent=new PreviewPlayerController(a);absent.activityResumed();absent.attachSeek(null);SystemClock.time+=1000;
  absent.snapshot(sample("Unknown","Artist",1000,120000,"playing",""));
  full.listener.onStartTrackingTouch(full);full.listener.onProgressChanged(full,500,true);full.listener.onStopTrackingTouch(full);
  SystemClock.time+=800;absent.snapshot(sample("Unknown","Artist",60000,120000,"playing","")+";previewConfirmPositionMs=2000");
  report=(String)reportMethod.invoke(absent);yes(report.contains("envoi WebView : —"));yes(report.contains("WebView indisponible"));
  yes(report.contains("première position UI différente : —"));yes(report.contains("âge dernière observation reçue au relâchement : —"));
  // Only eight seeks retained; a late callback from an overwritten slot cannot
  // overwrite another gesture's diagnostics or issue extra commands.
  PreviewPlayerController ring=new PreviewPlayerController(a);ring.activityResumed();android.webkit.WebView w2=new android.webkit.WebView();ring.attachSeek(w2);SystemClock.time+=1000;
  ring.snapshot(sample("PrivateTitle","PrivateArtist",10000,120000,"playing","")+";previewConfirmPositionMs=10000");
  android.webkit.ValueCallback<String> oldCallback=null;
  for(int i=0;i<9;i++){full.listener.onStartTrackingTouch(full);full.listener.onProgressChanged(full,300+i,true);full.listener.onStopTrackingTouch(full);if(i==0)oldCallback=w2.callback;}
  oldCallback.onReceiveValue("true");eq(w2.calls,9);
  report=(String)reportMethod.invoke(ring);yes(!report.contains("#1 relâchement"));yes(report.contains("#9 relâchement"));
  yes(!report.contains("action invoquée"));yes(!report.contains("PrivateTitle")&&!report.contains("PrivateArtist"));
  yes(report.contains("remplacé par un nouveau geste"));
  // Playlist timing is monotonic, anonymous, and only uses observed phases.
  if(!"https://image-cdn-ak.spotifycdn.com/image/ab67".equals(PreviewPlayerController.coverFromOembed("{\"title\":\"x\",\"thumbnail_url\":\"https://image-cdn-ak.spotifycdn.com/image/ab67\",\"type\":\"rich\"}")))throw new AssertionError("oEmbed cover");
  if(PreviewPlayerController.coverFromOembed("{\"thumbnail_url\":\"https://evil.example/x.jpg\"}")!=null)throw new AssertionError("foreign host must be refused");
  {PreviewPlayerController cv=new PreviewPlayerController(a);a.views.put(0x7f090244,new ImageView());int cb=NativeImageLoader.loads;
   cv.rememberCover(a,"T\nA","https://i.scdn.co/image/x");cv.restoreCover(a,"Other\nB");if(NativeImageLoader.loads!=cb)throw new AssertionError("cover of another track must not load");
   cv.restoreCover(a,"T\nA");if(NativeImageLoader.loads!=cb+1)throw new AssertionError("remembered cover must load at launch");}
  {PreviewPlayerController h=new PreviewPlayerController(a);String hf="section=A;title=x|section=B;title=y",hp="section=A;title=x";
   if(!hf.equals(h.keepRows("home","",hf))||!hf.equals(h.keepRows("home","",hp)))throw new AssertionError("launch Home with fewer shelves must keep the full one");
   SystemClock.time+=16000;if(!hp.equals(h.keepRows("home","",hp)))throw new AssertionError("after 15 s a shorter Home is shown");}
  PreviewPlayerController metrics=new PreviewPlayerController(a);SystemClock.time=300000;metrics.playlistOpened("spotify:playlist:Secret");metrics.loadState("waiting-bridge:unknown");
  SystemClock.time+=3000;metrics.phase("bridge-ready");SystemClock.time+=100;metrics.phase("navigation");SystemClock.time+=500;metrics.phase("page-ready|spotify:playlist:Wrong");
  report=(String)reportMethod.invoke(metrics);yes(report.contains("indéterminée (phases manquantes ou non séquentielles)"));
  metrics.phase("page-ready|spotify:playlist:Secret");SystemClock.time+=300;metrics.phase("rows-received");metrics.rowsPainted("detail","spotify:playlist:Secret","uri=spotify:track:Hidden");SystemClock.time+=20;Choreographer.frame();
  metrics.loadState("waiting-bridge:unknown");
  report=(String)reportMethod.invoke(metrics);yes(report.contains("attente pont : 3000 ms"));yes(report.contains("navigation → page prête : 500 ms"));yes(report.contains("Phase dominante : attente pont"));yes(report.contains("waiting-bridge avec lignes : oui"));yes(report.contains("data:unknown"));yes(!report.contains("Secret")&&!report.contains("Hidden"));
  View about=new View();metrics.attachAbout(about);yes(about.listener.onLongClick(about));for(int k=0;k<40&&AlertDialog.copy==null;k++){SystemClock.time+=200;Handler.flush();}AlertDialog.copy.onClick(null,0);yes(ClipboardManager.copied.equals(AlertDialog.body));
  // Background audio isn't observed here: lifecycle and input data are simulated.
  // Isolate the views from delayed tasks of earlier seek-controller tests.
  a=new Activity();mini=new ProgressBar();full=new SeekBar();elapsed=new TextView();duration=new TextView();remain=new TextView();b1=new ImageView();b2=new ImageView();root=new View();root.tags.put("nativePlayerRemaining",remain);
  a.views.put(0x7f09024d,mini);a.views.put(0x7f09023d,full);a.views.put(0x7f09024a,elapsed);a.views.put(0x7f09024b,duration);a.views.put(0x7f090238,b1);a.views.put(0x7f09023e,b2);a.views.put(0x7f09023a,root);
  java.lang.reflect.Field saved=PreviewPlayerController.class.getDeclaredField("savedValid");saved.setAccessible(true);saved.setBoolean(null,false);
  // User report 1022317: the same track seen playing in the background just before return shows Pause at once, at the right position.
  {saved.setBoolean(null,false);SystemClock.time+=1000000;PreviewPlayerController back=new PreviewPlayerController(a);back.activityStarted();back.activityResumed();
   back.snapshot(sample("Back","Artist",100000,1000000,"playing","")+";previewProgressSource=range");back.activityPaused();back.activityStopped();
   SystemClock.time+=6000;back.snapshot(sample("Back","Artist",106000,1000000,"playing",""));SystemClock.time+=500;back.activityStarted();back.activityResumed();
   yes(elapsed.text.equals("1:46"));yes(b2.image!=0x7f080122);}
  // User report 1022318: the track changed in the background; on return the new one is shown at once (no old-title frame).
  {saved.setBoolean(null,false);SystemClock.time+=1000000;PreviewPlayerController back=new PreviewPlayerController(a);back.activityStarted();back.activityResumed();
   back.snapshot(sample("Old","Artist",100000,1000000,"playing","")+";previewProgressSource=range");back.activityPaused();back.activityStopped();
   SystemClock.time+=6000;back.snapshot(sample("New","Artist",5000,200000,"playing",""));SystemClock.time+=500;back.activityStarted();back.activityResumed();
   yes(elapsed.text.equals("0:05"));yes(b2.image!=0x7f080122);}
  // User report 1022319: that background reading is also what the next launch shows first.
  yes(PreviewLastTrackStore.stored!=null&&PreviewLastTrackStore.stored.title.equals("New"));
  // Paused in the background: still Play after return.
  {saved.setBoolean(null,false);SystemClock.time+=1000000;PreviewPlayerController back=new PreviewPlayerController(a);back.activityStarted();back.activityResumed();
   back.snapshot(sample("Back2","Artist",100000,1000000,"playing","")+";previewProgressSource=range");back.activityPaused();back.activityStopped();
   SystemClock.time+=6000;back.snapshot(sample("Back2","Artist",100000,1000000,"paused",""));SystemClock.time+=500;back.activityStarted();back.activityResumed();eq(b2.image,0x7f080122);}
  for (long gap : new long[]{10000,60000,600000}) {
   saved.setBoolean(null,false);SystemClock.time+=1000000;PreviewPlayerController life=new PreviewPlayerController(a);life.activityStarted();life.activityResumed();
   life.snapshot(sample("Return","Artist",100000,1000000,"playing","")+";previewProgressSource=range");yes(elapsed.text.equals("1:40"));
   life.activityPaused();life.activityStopped();int frozen=mini.progress;
   SystemClock.time+=gap;life.snapshot(sample("Return","Artist",100000+gap,1000000,"playing",""));eq(mini.progress,frozen);
   // That background reading is over 2.5 s old at return: it cannot restart the display.
   SystemClock.time+=3000;life.activityStarted();life.activityResumed();yes(elapsed.text.equals("1:40"));eq(mini.progress,frozen);eq(b2.image,0x7f080122);
   report=(String)reportMethod.invoke(life);yes(report.contains("avant=playing ; après=interrupted"));yes(report.contains("absence="+(gap+3000)+" ms"));yes(report.contains("signal audio natif=non lu"));
   // Incoherent player state cannot restart the clock or show pause.
   life.snapshot(sample("Return","Artist",200000,1000000,"playing",""));SystemClock.time+=1000;life.doFrame(0);eq(mini.progress,frozen);eq(b2.image,0x7f080122);
   // An old observation cannot confirm playback even if numerically coherent.
   String old=sample("Return","Artist",100000,1000000,"playing","").replaceAll("previewObservedAtMs=[0-9]+", "previewObservedAtMs="+(System.currentTimeMillis()-4000));
   life.snapshot(old);eq(b2.image,0x7f080122);eq(mini.progress,frozen);
   report=(String)reportMethod.invoke(life);yes(report.contains("observation ancienne"));yes(report.contains("état page=playing"));yes(report.contains("état natif=interrupted"));
   life.snapshot(sample("Return","Artist",100000,1000000,"unknown","").replace(";previewPlaybackState=unknown", ""));
   report=(String)reportMethod.invoke(life);yes(report.contains("état page=unknown"));
   // Fresh and coherent observation restarts from the frozen local position.
   life.snapshot(sample("Return","Artist",100000,1000000,"playing",""));eq(b2.image,0x7f080121);SystemClock.time+=1000;life.doFrame(0);yes(mini.progress>frozen);
  }
  saved.setBoolean(null,false);SystemClock.time+=10000;PreviewPlayerController life=new PreviewPlayerController(a);life.activityResumed();
  life.snapshot(sample("Pause","Artist",100000,1000000,"paused",""));life.activityPaused();life.activityStopped();SystemClock.time+=60000;life.activityResumed();yes(elapsed.text.equals("1:40"));eq(b2.image,0x7f080122);
  life.snapshot(sample("Pause","Artist",100000,1000000,"paused",""));SystemClock.time+=10000;life.doFrame(0);yes(elapsed.text.equals("1:40"));
  // Same process rotation retains the frozen state, process death does not.
  life.activityPaused();life.activityStopped();SystemClock.time+=60000;PreviewPlayerController rotated=new PreviewPlayerController(a);rotated.activityResumed();yes(elapsed.text.equals("1:40"));
  saved.setBoolean(null,false);PreviewPlayerController recreated=new PreviewPlayerController(a);recreated.activityResumed();yes(elapsed.text.equals("-:--"));eq(mini.progress,0);
  recreated.snapshot(sample("New","Artist",3000,229000,"paused",""));yes(elapsed.text.equals("0:03"));
  recreated.activityPaused();recreated.activityStopped();SystemClock.time+=60000;recreated.activityResumed();SystemClock.time+=1000;recreated.snapshot(sample("Next","Artist",1000,229000,"playing",""));yes(elapsed.text.equals("0:01"));
  // Seek gesture before leaving: confirmed target freezes during absence.
  recreated.attachSeek(web);full.listener.onStartTrackingTouch(full);full.listener.onProgressChanged(full,500,true);full.listener.onStopTrackingTouch(full);
  recreated.snapshot(sample("Next","Artist",114500,229000,"playing","")+";previewConfirmPositionMs=114500");
  recreated.activityPaused();recreated.activityStopped();SystemClock.time+=60000;recreated.activityResumed();yes(elapsed.text.equals("1:54"));
  // A fresh new identity after background is not confused with old position.
  SystemClock.time+=1000;recreated.snapshot(sample("Next3","Artist",1000,229000,"playing",""));yes(elapsed.text.equals("0:01"));
  // A fresh same-track sample is accepted at 1 s; small forward correction
  // never exceeds 1.25x, while a large gap jumps. Audio is not inferred.
  recreated.snapshot(sample("Next3","Artist",1000,229000,"playing",""));recreated.activityPaused();recreated.activityStopped();SystemClock.time+=60000;recreated.activityResumed();
  recreated.snapshot(sample("Next3","Artist",2000,229000,"playing",""));yes(elapsed.text.equals("0:01"));
  SystemClock.time+=1000;recreated.snapshot(sample("Next3","Artist",3000,229000,"playing",""));
  java.lang.reflect.Method posMethod=PreviewPlayerController.class.getDeclaredMethod("positionUnderlying",long.class);posMethod.setAccessible(true);
  double p0=(Double)posMethod.invoke(recreated,SystemClock.time);SystemClock.time+=1000;double p1=(Double)posMethod.invoke(recreated,SystemClock.time);yes(p1-p0<=1250.001);yes(p1-p0>=1000);
  recreated.activityPaused();recreated.activityStopped();SystemClock.time+=60000;recreated.activityResumed();SystemClock.time+=1000;
  recreated.snapshot(sample("Next3","Artist",61000,229000,"playing",""));yes(elapsed.text.equals("1:01"));
  report=(String)reportMethod.invoke(recreated);yes(report.contains("retour : saut"));yes(report.contains("son non vérifié"));
  for(int i=0;i<10;i++){SystemClock.time+=1000;Handler.flush();recreated.doFrame(0);}
  report=(String)reportMethod.invoke(recreated);yes(report.contains("retour +"));yes(report.contains("pas fraîcheur garantie"));
  saved.setBoolean(null,false);PreviewPlayerController edges=new PreviewPlayerController(a);edges.activityResumed();
  edges.snapshot(sample("End","Artist",227000,229000,"playing",""));edges.activityPaused();edges.activityStopped();SystemClock.time+=600000;edges.activityResumed();yes(elapsed.text.equals("3:47"));
  for(int i=0;i<10;i++){SystemClock.time+=1000;Handler.flush();edges.doFrame(0);}
  report=(String)reportMethod.invoke(edges);String post=report.substring(report.indexOf("Retour — relevés pendant 10 secondes :"),report.indexOf("Historique (120"));
  eq(post.split("retour [+]",-1).length-1,10);yes(report.contains("pas fraîcheur garantie"));
  edges.snapshot(sample("Zero","Artist",0,229000,"paused",""));yes(elapsed.text.equals("0:00"));
  // An observed end-to-start wrap for the SAME item immediately reanchors
  // the display without a seek command. A mid-track jump remains rejected.
  saved.setBoolean(null,false);SystemClock.time+=10000;PreviewPlayerController loop=new PreviewPlayerController(a);loop.activityResumed();
  loop.snapshot(sample("Loop","Artist",98000,100000,"playing","")+";previewProgressSource=clock");SystemClock.time+=2000;loop.doFrame(0);yes(elapsed.text.equals("1:40"));
  int webBefore=web.calls;loop.snapshot(sample("Loop","Artist",1000,100000,"playing","")+";previewProgressSource=clock");yes(elapsed.text.equals("0:01"));eq(web.calls,webBefore);SystemClock.time+=1000;loop.doFrame(0);yes(elapsed.text.equals("0:02"));
  report=(String)reportMethod.invoke(loop);yes(report.contains("retour début observé"));
  saved.setBoolean(null,false);PreviewPlayerController middle=new PreviewPlayerController(a);middle.activityResumed();middle.snapshot(sample("Mid","Artist",50000,100000,"playing","")+";previewProgressSource=clock");middle.snapshot(sample("Mid","Artist",1000,100000,"playing","")+";previewProgressSource=clock");yes(elapsed.text.equals("0:50"));
  // Pending intent must not change the confirmed icon or dispatch another toggle.
  saved.setBoolean(null,false);SystemClock.time+=10000;PreviewPlayerController visual=new PreviewPlayerController(a);visual.activityResumed();
  visual.snapshot(sample("Visual","Artist",1000,229000,"paused",""));eq(b2.image,0x7f080122);eq(visual.tapPlayPause(),1);eq(b2.image,0x7f080121);yes(b2.description.contains("en attente"));// icon flips at the tap (user request 1022283)eq(visual.tapPlayPause(),-1);
  visual.snapshot(sample("Visual","Artist",1000,229000,"playing",""));eq(b2.image,0x7f080121);eq(visual.tapPlayPause(),0);eq(b2.image,0x7f080122);yes(b2.description.contains("en attente"));eq(visual.tapPlayPause(),-1);
  visual.snapshot(sample("Visual","Artist",1000,229000,"paused","").replaceAll("previewObservedAtMs=[0-9]+", "previewObservedAtMs="+(System.currentTimeMillis()-4000)));eq(visual.tapPlayPause(),-1);eq(b2.image,0x7f080122);
  visual.snapshot(sample("Visual","Artist",1000,229000,"paused",""));eq(b2.image,0x7f080122);eq(visual.tapPlayPause(),1);
  SystemClock.time+=8000;Handler.flush();eq(b2.image,0x7f080122);eq(visual.tapPlayPause(),1);SystemClock.time+=8000;Handler.flush();// stale but in the foreground: the page command decides (user-approved 1022280)
  visual.snapshot(sample("Visual","Artist",1000,229000,"paused",""));eq(visual.tapPlayPause(),1);
  visual.activityPaused();eq(visual.tapPlayPause(),-1);visual.activityResumed();eq(visual.tapPlayPause(),1);eq(visual.tapPlayPause(),-1);Handler.flush();yes(b2.viewAlpha==0.5f);visual.snapshot(sample("Visual","Artist",1000,229000,"playing",""));SystemClock.time+=500;Handler.flush();yes(b2.viewAlpha==1f);// pulses until Spotify confirms// phone 1022280: first tap after return plays; repeat taps wait
  saved.setBoolean(null,false);PreviewPlayerController unknown=new PreviewPlayerController(a);unknown.activityResumed();
  unknown.snapshot(sample("Unknown","Artist",1000,229000,"playing",""));eq(b2.image,0x7f080121);
  unknown.snapshot(sample("Unknown","Artist",1000,229000,"unknown",""));eq(b2.image,0x7f080122);yes(b2.description.contains("inconnu"));eq(unknown.tapPlayPause(),1);// unknown: the play icon is shown, so a tap asks to play
  { // Display only: a brief gap after a pause keeps the last time and bar; a long gap or a new track blanks them.
   Activity h=new Activity(); ProgressBar hm=new ProgressBar(); SeekBar hf=new SeekBar(); TextView he=new TextView(),hd=new TextView(); View hr=new View();
   h.views.put(0x7f09024d,hm);h.views.put(0x7f09023d,hf);h.views.put(0x7f09024a,he);h.views.put(0x7f09024b,hd);h.views.put(0x7f090238,new ImageView());h.views.put(0x7f09023e,new ImageView());h.views.put(0x7f09023a,hr);
   PreviewPlayerController g=new PreviewPlayerController(h);g.activityResumed();
   g.snapshot(sample("Hold","Artist",60000,180000,"paused",""));Choreographer.frame();String shown=he.text;int bar=hm.progress;yes(!shown.equals("-:--")&&bar>0);
   g.snapshot(sample("Hold","Artist",-1,181000,"paused",""));SystemClock.time+=2000;Handler.flush();Choreographer.frame();yes(he.text.equals(shown));eq(hm.progress,bar);
   SystemClock.time+=PreviewPlayerController.HOLD_DISPLAY_MS;g.snapshot(sample("Hold","Artist",-1,181000,"paused",""));Choreographer.frame();yes(he.text.equals("-:--"));
   g.snapshot(sample("Hold","Artist",61000,181000,"paused",""));Choreographer.frame();yes(!he.text.equals("-:--"));
   g.snapshot(sample("Autre","Artist",-1,90000,"paused",""));Choreographer.frame();yes(he.text.equals("-:--"));
  }
  { // Pause bug: the legacy callback lists all artists; same track, the time must stay.
   Activity h=new Activity(); ProgressBar hm=new ProgressBar(); SeekBar hf=new SeekBar(); TextView he=new TextView(),hd=new TextView();
   h.views.put(0x7f09024d,hm);h.views.put(0x7f09023d,hf);h.views.put(0x7f09024a,he);h.views.put(0x7f09024b,hd);h.views.put(0x7f090238,new ImageView());h.views.put(0x7f09023e,new ImageView());h.views.put(0x7f09023a,new View());TextView ma=new TextView(),fa=new TextView();h.views.put(0x7f090237,ma);h.views.put(0x7f09023c,fa);
   PreviewPlayerController g=new PreviewPlayerController(h);g.activityResumed();
   g.snapshot(sample("Song","Main",60000,180000,"paused",""));Choreographer.frame();String shown=he.text;yes(!shown.equals("-:--"));
   SystemClock.time+=7000;g.snapshot("track=Song;artist=Main, Guest;playing=false");Choreographer.frame();yes(he.text.equals(shown));yes(hm.progress>0);
   // 1022324: the tuple feed ("Main") must not wipe the second artist again.
   ma.text="Main";fa.text="Main";g.snapshot(sample("Song","Main",61000,180000,"paused",""));Choreographer.frame();yes(ma.text.equals("Main, Guest"));yes(fa.text.equals("Main, Guest"));
   // 1022325: the tuple feed itself alternating "Main, Guest" / "Main" is the same track, no reset.
   g.snapshot(sample("Song","Main, Guest",62000,180000,"paused",""));Choreographer.frame();yes(!he.text.equals("-:--"));
   ma.text="Main";g.snapshot(sample("Song","Main",63000,180000,"paused",""));Choreographer.frame();yes(!he.text.equals("-:--"));yes(ma.text.equals("Main, Guest"));
   g.snapshot("track=Other;artist=Main, Guest;playing=false");Choreographer.frame();yes(he.text.equals("-:--"));
   yes(PreviewPlayerController.sameArtists("A","A, B"));yes(!PreviewPlayerController.sameArtists("A","AB"));yes(!PreviewPlayerController.sameArtists("A","C, A"));
  }
  { // A cached observation renders without a bridge and never invokes the WebView.
   saved.setBoolean(null,false);Activity h=new Activity();TextView title=new TextView(),artist=new TextView();
   View rootView=new View(),splash=new View();h.views.put(0x7f09022f,rootView);h.views.put(0x7f0901c6,splash);
   h.views.put(0x7f090236,title);h.views.put(0x7f090237,artist);h.views.put(0x7f09024d,new ProgressBar());h.views.put(0x7f09023d,new SeekBar());h.views.put(0x7f09024a,new TextView());h.views.put(0x7f09024b,new TextView());h.views.put(0x7f090238,new ImageView());h.views.put(0x7f09023e,new ImageView());
   PreviewLastTrackStore.Record r=new PreviewLastTrackStore.Record();r.title="Local";r.artist="Artist";r.position=30000;r.duration=120000;r.state="playing";r.observed=System.currentTimeMillis();PreviewLastTrackStore.stored=r;
   PreviewPlayerController local=new PreviewPlayerController(h);local.layoutReady();local.activityResumed();PreviewLastTrackStore.deliver();
   yes(title.text.equals("Local"));yes(artist.text.equals("Artist"));eq(splash.getVisibility(),View.GONE);eq(local.tapPlayPause(),-1);
   report=(String)reportMethod.invoke(local);yes(report.contains("lecture : valide"));yes(report.contains("écran de chargement masqué"));
   yes(!local.acceptPlayerPayload("track=No Track;artist=No Artist"));yes(title.text.equals("Local"));
   yes(!local.acceptPlayerPayload(sample("Different","Artist",5000,120000,"paused","")));yes(title.text.equals("Local"));SystemClock.time+=1500;// stale launch title waits 1.5 s (1022328)
    yes(local.acceptPlayerPayload(sample("Different","Artist",5000,120000,"paused","")));local.snapshot(sample("Different","Artist",5000,120000,"paused",""));yes(PreviewLastTrackStore.stored.title.equals("Different"));
   PreviewPlayerController stuck=new PreviewPlayerController(h);stuck.layoutReady();stuck.activityResumed();PreviewLastTrackStore.deliver();eq(stuck.tapPlayPause(),-1);SystemClock.time+=5001;eq(stuck.tapPlayPause(),1);// stuck page: remembered track, after 5 s in the foreground the tap is sent (user-approved 1022293)
   stuck.snapshot(sample("Local","Artist",50000,120000,"playing",""));stuck.begin(3);yes(title.viewAlpha==0.45f);// skip: instant fade (user request 1022298)
   stuck.snapshot(sample("Local","Artist",51000,120000,"playing",""));yes(title.viewAlpha==0.45f);stuck.snapshot(sample("Next","Artist",0,150000,"playing",""));yes(title.viewAlpha==1f);artist.setText("");stuck.snapshot(sample("Next","Artist",1000,150000,"playing",""));yes(artist.text.toString().equals("Artist"));// a blanked artist is restored (user report 1022298)
   {int n=NativeImageLoader.loads;PreviewPlayerController.cover(new ImageView(),"",192);eq(NativeImageLoader.loads,n);PreviewPlayerController.cover(new ImageView(),"https://i/x",192);eq(NativeImageLoader.loads,n+1);}// empty cover keeps the image
    local.clearLastTrack();yes(PreviewLastTrackStore.stored==null);
   splash.setVisibility(View.VISIBLE);
   saved.setBoolean(null,false);PreviewPlayerController empty=new PreviewPlayerController(h);empty.layoutReady();empty.activityResumed();PreviewLastTrackStore.deliver();eq(splash.getVisibility(),View.VISIBLE);
   yes(empty.acceptPlayerPayload(sample("First","Artist",0,120000,"paused","")));empty.snapshot(sample("First","Artist",0,120000,"paused",""));yes(PreviewLastTrackStore.stored.title.equals("First"));
   saved.setBoolean(null,false);PreviewPlayerController racing=new PreviewPlayerController(h);racing.layoutReady();racing.activityResumed();
   yes(racing.acceptPlayerPayload(sample("Newer","Artist",5000,120000,"playing","")));racing.snapshot(sample("Newer","Artist",5000,120000,"playing",""));
   title.setText("live");PreviewLastTrackStore.deliver();yes(title.text.equals("live"));
   rootView.setVisibility(View.GONE);splash.setVisibility(View.VISIBLE);saved.setBoolean(null,false);
   PreviewPlayerController login=new PreviewPlayerController(h);login.layoutReady();login.activityResumed();PreviewLastTrackStore.deliver();
   eq(rootView.getVisibility(),View.GONE);eq(splash.getVisibility(),View.VISIBLE);
   report=(String)reportMethod.invoke(login);yes(report.contains("interface non visible"));
  }
  {android.content.Context cx=new android.content.Context();
   yes(PreviewPlayerController.cachedRows(cx,"spotify:playlist:Ab1","SK").equals("SK"));
   yes(PreviewPlayerController.playlistKey("https://open.spotify.com/playlist/Ab1?si=x").equals("spotify:playlist:Ab1"));yes(PreviewPlayerController.playlistKey("spotify:collection:tracks").equals("spotify:collection:tracks"));yes(PreviewPlayerController.playlistKey("spotify:album:X").isEmpty());
   org.json.JSONArray kept=PreviewPlayerController.storableRows(new org.json.JSONArray("uri=spotify:track:T1;title=A|title=Info|uri=spotify:track:T2;title=B"));eq(kept.length(),2);
   eq(PreviewPlayerController.storableRows(new org.json.JSONArray("uri=spotify:track:T1|title=Copie enregistrée")).length(),0);
   cx.prefs.m.put("spotify:playlist:Ab1",kept.toString());String shown=PreviewPlayerController.cachedRows(cx,"/playlist/Ab1","SK");
   yes(shown.contains("T2")&&shown.contains("Copie enregistrée"));}
  {/* user report 1022377: a playlist opened by link must be kept and shown at once next time */
   PreviewPlayerController lk=new PreviewPlayerController(a);lk.playlistOpened("https://open.spotify.com/playlist/Lk1?si=q");
   lk.rowsPainted("detail","https://open.spotify.com/playlist/Lk1?si=q","uri=spotify:track:Z9;title=Z");
   yes(PreviewPlayerController.cachedRows(a,"spotify:playlist:Lk1","SK").contains("Z9"));}
  {String ct=PreviewPlayerController.crashTrace(new RuntimeException("secret-token", new IllegalStateException("page data")));
   if(ct.contains("secret")||ct.contains("page data")||!ct.contains("java.lang.RuntimeException")||!ct.contains("Cause : java.lang.IllegalStateException")||!ct.contains("  at "))throw new AssertionError("crash trace: classes and frames only");}
  if(!"__sfA,__sfB".equals(PreviewPlayerController.flagsSetTrue("window.__sfB=!0;window.__sfA = true;window.__sfC=false;window.__sfD=1;window.__sfB=true")))throw new AssertionError("flags set to true");
  if(!"aucun".equals(PreviewPlayerController.flagsSetTrue("var x=1")))throw new AssertionError("no flags");
  {/* user request 1022379: the playing row is green; player titles untouched; restored on change */
   Activity hx=new Activity();android.view.ViewGroup hroot=new android.view.ViewGroup();hroot.id=0x7f09022f;hx.views.put(0x7f09022f,hroot);
   TextView row=new TextView();row.text="HiSong";TextView other=new TextView();other.text="Else";TextView hmini=new TextView();hmini.id=0x7f090236;hmini.text="HiSong";
   hroot.kids.add(row);hroot.kids.add(other);hroot.kids.add(hmini);
   PreviewPlayerController hc=new PreviewPlayerController(hx);hc.activityResumed();hc.snapshot(sample("HiSong","Artist",10000,180000,"playing",""));
   hc.rowsPainted("detail","spotify:playlist:Hx","uri=spotify:track:H1;title=HiSong");
   eq(row.color,PreviewPlayerController.PLAYING_COLOR);eq(other.color,0xffffffff);eq(hmini.color,0xffffffff);
   hc.snapshot(sample("NextSong","Artist",1000,180000,"playing",""));eq(row.color,0xffffffff);}
  {/* user request 1022379: the header play button is added with the playlist rows (same pass, 1022393), not on Home */
   PreviewPlayerController pc=new PreviewPlayerController(new Activity());Handler.flush();int pb=PreviewPlayerControllerPlayAll.adds;
   pc.rowsPainted("home",null,"title=x");Handler.flush();eq(PreviewPlayerControllerPlayAll.adds,pb);
   pc.rowsPainted("detail","spotify:playlist:Pa","uri=spotify:track:P1;title=P");Handler.flush();eq(PreviewPlayerControllerPlayAll.adds,pb+1);/* 1022401: header pause only while a row of this playlist is lit and playing; expect() is safe without a track */PreviewPlayerController.expect();Handler.flush();yes(!PreviewPlayerController.headerPlaying());}
   { // User request (1022402, free account): Melodix plays the playlist order like Spotify.
     PreviewPlayerMode.shuffleMode=false;PreviewPlayerMode.repeatMode=0;
     org.json.JSONArray q=new org.json.JSONArray("uri=spotify:track:A;title=A|uri=spotify:track:B;title=B|uri=spotify:track:C;title=C");
     yes(PreviewPlayerControllerQueue.start(q,"spotify:track:B"));yes(PreviewPlayerControllerQueue.current().equals("spotify:track:B"));
     yes("spotify:track:C".equals(PreviewPlayerControllerQueue.step(true,false)));yes(PreviewPlayerControllerQueue.step(true,false)==null);
     yes("spotify:track:A".equals(PreviewPlayerControllerQueue.step(true,true)));yes(PreviewPlayerControllerQueue.step(false,false)==null);
     yes("spotify:track:C".equals(PreviewPlayerControllerQueue.step(false,true)));
     PreviewPlayerMode.shuffleMode=true;yes(PreviewPlayerControllerQueue.start(q,"spotify:track:C"));yes(PreviewPlayerControllerQueue.current().equals("spotify:track:C"));
     java.util.HashSet<String> rest=new java.util.HashSet<String>();rest.add(PreviewPlayerControllerQueue.step(true,false));rest.add(PreviewPlayerControllerQueue.step(true,false));
     yes(rest.contains("spotify:track:A")&&rest.contains("spotify:track:B"));yes(PreviewPlayerControllerQueue.step(true,false)==null);
     PreviewPlayerMode.shuffleMode=false;yes(PreviewPlayerControllerQueue.moveTo("spotify:track:C"));yes(PreviewPlayerControllerQueue.step(true,false)==null);// unshuffled: C is last
     yes(!PreviewPlayerControllerQueue.start(q,"spotify:track:Z"));yes(PreviewPlayerControllerQueue.isEmpty());
     yes(PreviewPlayerControllerQueue.start(q,"spotify:track:A"));yes("B".equals(PreviewPlayerControllerQueue.row("spotify:track:B").optString("title","")));yes(PreviewPlayerControllerQueue.row("spotify:track:Z")==null);
     // "Ajouter à la file d'attente": right after the current track, in the order added (Spotify).
     PreviewPlayerMode.shuffleMode=false;yes(PreviewPlayerControllerQueue.start(q,"spotify:track:A"));
     yes(PreviewPlayerControllerQueue.addNext("spotify:track:X",new org.json.JSONObject("uri=spotify:track:X;title=X")));yes(PreviewPlayerControllerQueue.addNext("spotify:track:Y",new org.json.JSONObject("uri=spotify:track:Y;title=Y")));
     yes("spotify:track:X".equals(PreviewPlayerControllerQueue.step(true,false)));yes("spotify:track:Y".equals(PreviewPlayerControllerQueue.step(true,false)));yes("spotify:track:B".equals(PreviewPlayerControllerQueue.step(true,false)));
     yes(PreviewPlayerControllerQueue.addNext("spotify:track:Z",new org.json.JSONObject("uri=spotify:track:Z;title=Z")));yes("spotify:track:Z".equals(PreviewPlayerControllerQueue.step(true,false)));yes("spotify:track:C".equals(PreviewPlayerControllerQueue.step(true,false)));
     yes(PreviewPlayerControllerQueue.snapshot()!=null);PreviewPlayerControllerQueue.clear();yes(PreviewPlayerControllerQueue.snapshot()==null);
     PreviewPlayerControllerQueue.clear(); }
  System.out.println("Preview controller JVM simulation passed");
 }
}''',
}

def main():
    with tempfile.TemporaryDirectory(prefix='preview-player-jvm-') as tmp:
        root = Path(tmp); files = []
        for name, content in STUBS.items():
            p = root/name; p.parent.mkdir(parents=True, exist_ok=True); p.write_text(content, encoding='utf8'); files.append(str(p))
        files.append(str(HERE / 'preview-player/PreviewPlayerControllerQueue.java'));
        files.append(str(SOURCE)); out = root/'classes'; out.mkdir()
        java = os.environ.get('PREVIEW_TEST_JAVA', 'java')
        ecj = os.environ.get('PREVIEW_TEST_ECJ')
        compile_command = ([java, '-cp', ecj, 'org.eclipse.jdt.internal.compiler.batch.Main'] if ecj else ['javac'])
        subprocess.run(compile_command + ['-encoding', 'UTF-8', '-source', '8', '-target', '8', '-d', str(out)] + files, check=True)
        subprocess.run([java, '-cp', str(out), 'com.melodix.music.ControllerTest'], check=True)

if __name__ == '__main__': main()
