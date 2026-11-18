#!/usr/bin/env python3
"""Synthetic JS -> WebView-encoded JSON -> native JVM view integration.

Requires ORG_JSON_SOURCE_ROOT containing src/main/java/org/json with either
Android libcore JSON or JSON-java, and NODE_PATH with jsdom. Android view and
annotation stubs are used. Not an Android or Spotify session test.
"""
import os, subprocess, tempfile
from pathlib import Path
here=Path(__file__).resolve().parent
root=Path(os.environ['ORG_JSON_SOURCE_ROOT'])
java=os.environ.get('PREVIEW_TEST_JAVA','java');ecj=os.environ.get('PREVIEW_TEST_ECJ')
# Reuse the existing Android view stubs, not its synthetic JSON parser or test.
source=(here/'test_tiles_jvm.py').read_text(encoding='utf8').split("with tempfile.TemporaryDirectory(prefix='player-tiles-jvm-') as tmp:")[0]
ns={'__file__':str(here/'test_tiles_jvm.py')};exec(compile(source,str(here/'test_tiles_jvm.py'),'exec'),ns)
stubs=ns['stubs'];stubs.pop('org/json/JSONObject.java');stubs.pop('org/json/JSONTokener.java');stubs.pop('com/melodix/music/TilesTest.java')
stubs.update({
 'android/compat/annotation/UnsupportedAppUsage.java': 'package android.compat.annotation; public @interface UnsupportedAppUsage {}',
 'android/annotation/SystemApi.java': 'package android.annotation; public @interface SystemApi { public enum Client { MODULE_LIBRARIES } Client client(); }',
 'libcore/util/NonNull.java': 'package libcore.util; import java.lang.annotation.*; @Target({ElementType.TYPE_USE,ElementType.PARAMETER,ElementType.FIELD,ElementType.METHOD}) public @interface NonNull {}',
 'libcore/util/Nullable.java': 'package libcore.util; import java.lang.annotation.*; @Target({ElementType.TYPE_USE,ElementType.PARAMETER,ElementType.FIELD,ElementType.METHOD}) public @interface Nullable {}',
})
stubs['com/melodix/music/BridgeIntegration.java']=r'''package com.melodix.music;
import android.app.*;import android.os.*;import android.view.*;import android.widget.*;import java.nio.file.*;import java.nio.charset.*;
public class BridgeIntegration {
 static void ok(boolean b,String why){if(!b)throw new AssertionError(why);}
 static String file(String n)throws Exception{return new String(Files.readAllBytes(Paths.get(System.getenv("BRIDGE_FIXTURE_DIR"),n+".json")),StandardCharsets.UTF_8);}
 static PreviewPlayerTiles tiles(Activity a){Handler.clear();a.G=new android.webkit.WebView(a);a.root=new View(a);PreviewPlayerTiles t=new PreviewPlayerTiles(a,null);t.onAttachedToWindow();Handler.advance(401);return t;}
 static LinearLayout contents(Dialog d){return (LinearLayout)((ScrollView)((LinearLayout)d.content).children.get(2)).child;}
 static void poll(Activity a,int start,String name)throws Exception{a.G.replyCall(start,file(name+"-start"));Handler.advance(250);a.G.reply(file(name+"-result"));}
 public static void main(String[] args)throws Exception{
  Activity q=new Activity();PreviewPlayerTiles tq=tiles(q);int before=q.G.calls;tq.children.get(0).performClick();Dialog qd=Dialog.last;ok(qd.shown,"queue dialog");LinearLayout ql=contents(qd);poll(q,before+1,"queue");
  ok(((TextView)ql.children.get(0)).text.equals("En cours de lecture"),"queue header");
  ok(((TextView)ql.children.get(1)).text.equals("Cœur \"Bleu\" 🎵\nArtiste É"),"queue current, encoding and artist");
  ok(((TextView)ql.children.get(3)).text.equals("Suivant\nGroupe · 3:21"),"queue next and duration");
  ok(!PreviewPlayerTiles.diagnosticReport().contains("Cœur"),"queue diagnostics privacy");qd.dismiss();tq.onDetachedFromWindow();
  Activity l=new Activity();PreviewPlayerTiles tl=tiles(l);before=l.G.calls;tl.children.get(1).performClick();Dialog ld=Dialog.last;LinearLayout ll=contents(ld);poll(l,before+1,"lyrics");
  ok(((TextView)ll.children.get(0)).text.equals("Première \"ligne\" 🎵"),"lyrics first line unicode");ok(((TextView)ll.children.get(1)).text.equals("Deuxième ligne"),"lyrics second line");ok(!PreviewPlayerTiles.diagnosticReport().contains("Première"),"lyrics diagnostics privacy");ld.dismiss();tl.onDetachedFromWindow();
  Activity c=new Activity();PreviewPlayerTiles td=tiles(c);before=c.G.calls;td.children.get(2).performClick();Dialog dd=Dialog.last;LinearLayout dl=contents(dd);poll(c,before+1,"devices");
  ok(((Button)dl.children.get(0)).text.equals("Écran \"B\"\nEnceinte"),"device name and type");ok(((Button)dl.children.get(1)).text.contains("Actif"),"device active state");ok(!PreviewPlayerTiles.diagnosticReport().contains("Écran"),"devices diagnostics privacy");
  // Characterize an uncertain transfer response: refresh is automatic, not a transfer.
  int dc=c.G.calls;((Button)dl.children.get(0)).performClick();Dialog confirmation=Dialog.last;ok(c.G.calls==dc,"transfer requires confirmation");((Button)((LinearLayout)confirmation.content).children.get(2)).performClick();ok(c.G.calls==dc+1&&c.G.js.contains("\"transfer\""),"one transfer after confirmation");
  c.G.reply(file("devices-start"));Handler.advance(250);org.json.JSONObject started=new org.json.JSONObject((String)new org.json.JSONTokener(file("devices-start")).nextValue());org.json.JSONObject uncertain=new org.json.JSONObject();uncertain.put("status","done");uncertain.put("id",started.optString("id"));uncertain.put("ok",false);uncertain.put("transferred",false);uncertain.put("reason","unverified");
  int beforeRefresh=c.G.calls;c.G.reply(org.json.JSONObject.quote(uncertain.toString()));ok(Toast.message.contains("Transfert non vérifié, Réessayer"),"uncertain-transfer message characterization");ok(c.G.calls==beforeRefresh+1&&c.G.js.contains("\"run\"")&&!c.G.js.contains("\"transfer\""),"uncertain transfer triggers list read, not another transfer");dd.dismiss();td.onDetachedFromWindow();
  // Android-style null and non-string results are not accepted as an initial job.
  Activity bad=new Activity();PreviewPlayerTiles tb=tiles(bad);before=bad.G.calls;tb.children.get(0).performClick();Dialog bd=Dialog.last;LinearLayout bl=contents(bd);bad.G.replyCall(before+1,"null");
  ok(((TextView)bl.children.get(0)).text.equals("File indisponible"),"null startup must not render data");ok(((Button)((LinearLayout)bd.content).children.get(3)).enabled,"retry after null startup");bd.dismiss();tb.onDetachedFromWindow();
  // Even a valid JSON result from another job must not reach the native view.
  Activity wrong=new Activity();PreviewPlayerTiles tw=tiles(wrong);before=wrong.G.calls;tw.children.get(0).performClick();Dialog wd=Dialog.last;LinearLayout wl=contents(wd);wrong.G.replyCall(before+1,file("queue-start"));Handler.advance(250);
  org.json.JSONObject result=new org.json.JSONObject((String)new org.json.JSONTokener(file("queue-result")).nextValue());result.put("id","999:9");wrong.G.reply(org.json.JSONObject.quote(result.toString()));
  ok(((TextView)wl.children.get(0)).text.equals("File indisponible"),"mismatched job must fail closed");ok(!PreviewPlayerTiles.diagnosticReport().contains("Cœur"),"mismatched result must stay private");wd.dismiss();tw.onDetachedFromWindow();
  Activity v=new Activity();PreviewPlayerTiles tv=tiles(v);Handler.clear();PreviewPlayerVolume vol=(PreviewPlayerVolume)tv.children.get(3);vol.onAttachedToWindow();Handler.step();v.G.reply(file("volume-query"));ok(vol.text.contains("37 %"),"volume query");vol.performClick();Dialog vd=Dialog.last;LinearLayout body=(LinearLayout)vd.content;SeekBar bar=(SeekBar)((LinearLayout)body.children.get(3)).children.get(0);bar.listener.onStartTrackingTouch(bar);bar.simulate(65);Handler.advance(0);v.G.reply(file("volume-set"));ok(PreviewPlayerVolume.diagnosticReport().contains("commande envoyée"),"volume sent not audio-confirmed");ok(PreviewPlayerVolume.diagnosticReport().contains("son non vérifié"),"audio not verified");vd.dismiss();vol.onDetachedFromWindow();tv.onDetachedFromWindow();
  System.out.println("Synthetic JS to encoded JSON to JVM view: queue, lyrics, devices and volume passed");
 }
}'''
with tempfile.TemporaryDirectory(prefix='melodix-bridge-') as tmp:
 p=Path(tmp);fixtures=p/'fixtures';fixtures.mkdir();env=dict(os.environ,BRIDGE_FIXTURE_DIR=str(fixtures));subprocess.run(['node',str(here/'bridge-fixtures.cjs')],env=env,check=True)
 files=[]
 for name,content in stubs.items():
  f=p/name;f.parent.mkdir(parents=True,exist_ok=True);f.write_text(content,encoding='utf8');files.append(str(f))
 files.extend(str(f) for f in sorted((root/'src/main/java/org/json').glob('*.java')))
 for name in ['PreviewPlayerTiles.java','PreviewPlayerVolume.java','PreviewPlayerSheet.java','PreviewPanelIcon.java']:files.append(str(here/name))
 classes=p/'classes';classes.mkdir();compiler=[java,'-cp',ecj,'org.eclipse.jdt.internal.compiler.batch.Main'] if ecj else ['javac']
 subprocess.run(compiler+['-encoding','UTF-8','-source','8','-target','8','-d',str(classes)]+files,check=True)
 subprocess.run([java,'-cp',str(classes),'com.melodix.music.BridgeIntegration'],env=env,check=True)
