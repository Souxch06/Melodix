#!/usr/bin/env python3
"""Real store source and file I/O under JVM Android stubs, not an Android test."""
import os
import subprocess
import tempfile
from pathlib import Path

HERE = Path(__file__).resolve().parent
STUBS = {
'android/content/Context.java': '''package android.content; public class Context { public java.io.File getNoBackupFilesDir(){return null;} }''',
'android/os/Looper.java': '''package android.os; public class Looper { public static Looper getMainLooper(){return new Looper();} }''',
'android/os/Handler.java': '''package android.os; public class Handler { public Handler(Looper l){} public boolean post(Runnable r){r.run();return true;} }''',
'android/graphics/Bitmap.java': '''package android.graphics; public class Bitmap { public enum CompressFormat { JPEG } public boolean isRecycled(){return false;} public int getWidth(){return 1;} public int getHeight(){return 1;} public static Bitmap createScaledBitmap(Bitmap b,int w,int h,boolean f){return b;} public boolean compress(CompressFormat f,int q,java.io.OutputStream o){return false;} public void recycle(){} }''',
'android/graphics/BitmapFactory.java': '''package android.graphics; public class BitmapFactory { public static class Options {public boolean inJustDecodeBounds;public int outWidth,outHeight;} public static Bitmap decodeByteArray(byte[] b,int a,int n){return null;} public static Bitmap decodeByteArray(byte[] b,int a,int n,Options o){return null;} }''',
'android/util/AtomicFile.java': '''package android.util; import java.io.*; public class AtomicFile { private File f; public AtomicFile(File f){this.f=f;} public FileInputStream openRead()throws IOException{return new FileInputStream(f);} public FileOutputStream startWrite()throws IOException{return new FileOutputStream(f);} public void finishWrite(FileOutputStream o)throws IOException{o.close();} public void failWrite(FileOutputStream o){try{o.close();}catch(IOException e){}} public void delete(){f.delete();} }''',
'com/melodix/music/StoreTest.java': r'''package com.melodix.music;
import java.io.*;
public class StoreTest {
 static void yes(boolean b){if(!b)throw new AssertionError();}
 public static void main(String[] a)throws Exception {
  File f=new File(a[1]); long now=System.currentTimeMillis();
  if(a[0].equals("write")){
   yes(PreviewLastTrackStore.read(f,now)==null);
   PreviewLastTrackStore.Record r=new PreviewLastTrackStore.Record();r.title="Fixture";r.artist="Artist";r.state="playing";r.duration=120000;r.position=30000;r.observed=now;r.image=new byte[]{1,2,3};
   yes(PreviewLastTrackStore.write(f,r));return;
  }
  PreviewLastTrackStore.Record r=PreviewLastTrackStore.read(f,now);yes(r!=null);yes(r.title.equals("Fixture")&&r.position==30000&&r.state.equals("playing")&&r.image.length==3);
  yes(PreviewLastTrackStore.read(f,now+PreviewLastTrackStore.MAX_AGE+1)==null);
  yes(PreviewLastTrackStore.read(f,r.observed-1)==null);
  r.artist="";yes(!PreviewLastTrackStore.write(f,r));
  r.artist="Artist";r.position=130000;yes(!PreviewLastTrackStore.write(f,r));
  yes(PreviewLastTrackStore.read(f,now)!=null);
  try(FileOutputStream out=new FileOutputStream(f)){out.write(new byte[]{1,2,3});}
  yes(PreviewLastTrackStore.read(f,now)==null);
  try(DataOutputStream out=new DataOutputStream(new FileOutputStream(f))){out.writeInt(0x4d445831);out.writeUTF("Fixture");}
  yes(PreviewLastTrackStore.read(f,now)==null);
  System.out.println("Store JVM cross-process file test passed (not Android)");
 }
}''',
}

def main():
    with tempfile.TemporaryDirectory(prefix='preview-store-jvm-') as tmp:
        root=Path(tmp); files=[]
        for name,content in STUBS.items():
            p=root/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(content,encoding='utf8');files.append(str(p))
        files.append(str(HERE/'preview-player/PreviewLastTrackStore.java'))
        out=root/'classes';out.mkdir();java=os.environ.get('PREVIEW_TEST_JAVA','java');ecj=os.environ.get('PREVIEW_TEST_ECJ')
        compiler=[java,'-cp',ecj,'org.eclipse.jdt.internal.compiler.batch.Main'] if ecj else ['javac']
        subprocess.run(compiler+['-encoding','UTF-8','-source','8','-target','8','-d',str(out)]+files,check=True)
        record=str(root/'record');runner=[java,'-cp',str(out),'com.melodix.music.StoreTest']
        subprocess.run(runner+['write',record],check=True)
        subprocess.run(runner+['read',record],check=True)
if __name__=='__main__': main()
