package com.melodix.visualfixture;

import android.app.Activity;
import android.app.Instrumentation;
import android.content.Intent;
import android.graphics.Bitmap;
import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import java.io.File;
import java.io.FileOutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;

/** Synthetic content on a fresh offline emulator. Never used in the delivered APK. */
public final class VisualFixture extends Instrumentation {
    private Activity activity;
    private Throwable failure;
    @Override public void onCreate(Bundle args) { super.onCreate(args); start(); }
    private View find(View view,String text) {
        if (view instanceof TextView && text.contentEquals(((TextView)view).getText())) return view;
        if (view instanceof ViewGroup) {
            ViewGroup group=(ViewGroup)view;
            for(int i=0;i<group.getChildCount();i++){ View result=find(group.getChildAt(i),text);if(result!=null)return result; }
        }
        return null;
    }
    private void call(String method,Class<?>[] types,Object... args) throws Exception {
        Method m=activity.getClass().getMethod(method,types); m.invoke(activity,args);
    }
    private void require(boolean condition,String message) { if(!condition)throw new AssertionError(message); }
    private void screen(final String kind) throws Exception {
        failure=null;
        runOnMainSync(new Runnable(){public void run(){try {
            call("showNativeUi",new Class<?>[0]);
            Field id=activity.getClass().getDeclaredField("nativeExpectedId");id.setAccessible(true);
            if(kind.equals("settings")) {
                id.set(activity,null);call("setNativeScreen",new Class<?>[]{String.class},"settings");
                call("renderNativeRows",new Class<?>[]{String.class,String.class},"Paramètres",
                    "[{\"section\":\"Lecture\",\"title\":\"Qualité audio\",\"subtitle\":\"Géré par Spotify\",\"uri\":\"\",\"settingValue\":\"Indisponible\"},{\"section\":\"Stockage\",\"title\":\"Synchroniser\",\"subtitle\":\"Actualiser la bibliothèque\",\"uri\":\"spotify:settings:resync\",\"settingValue\":\"Actualiser\"}]");
                View root=activity.getWindow().getDecorView();
                require(find(root,"Votre musique,\nà votre façon.")!=null,"settings hero missing");
                require(find(root,"Indisponible")!=null,"unavailable status missing");
                View action=find(root,"Synchroniser"); require(action!=null,"action missing");
                View parent=(View)action.getParent().getParent();require(parent.isClickable(),"action lost listener");
            } else {
                id.set(activity,"spotify:playlist:fixture");call("setNativeScreen",new Class<?>[]{String.class},"detail");
                call("renderNativeRows",new Class<?>[]{String.class,String.class},"Playlist exemple",
                    "[{\"title\":\"Premier titre fictif\",\"subtitle\":\"Artiste fictif\",\"uri\":\"spotify:track:fixture1\"},{\"title\":\"Deuxième titre fictif\",\"subtitle\":\"Artiste fictif\",\"uri\":\"spotify:track:fixture2\"}]");
                View root=activity.getWindow().getDecorView();
                require(find(root,"PLAYLIST")!=null,"playlist hero missing");
                require(find(root,"Titres")!=null,"playlist heading missing");
                require(find(root,"Premier titre fictif")!=null,"track missing");
                View track=find(root,"Premier titre fictif");
                require(((View)track.getParent().getParent()).isClickable(),"track lost listener");
            }
        } catch(Throwable t){failure=t;}}});
        if(failure!=null)throw new Exception("visual fixture " + kind,failure);
        waitForIdleSync();
        try{Thread.sleep(700);}catch(InterruptedException e){Thread.currentThread().interrupt();}
        Bitmap shot=getUiAutomation().takeScreenshot();require(shot!=null,"screenshot unavailable");
        File directory=activity.getExternalFilesDir(null);require(directory!=null,"external fixture directory unavailable");
        FileOutputStream out=new FileOutputStream(new File(directory,"glass-fixture-"+kind+".png"));
        try{require(shot.compress(Bitmap.CompressFormat.PNG,100,out),"screenshot write failed");}finally{out.close();shot.recycle();}
    }
    @Override public void onStart() {
        Bundle result=new Bundle();
        try {
            Intent intent=new Intent().setClassName("com.melodix.music.preview","com.melodix.music.MainActivity");
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);activity=startActivitySync(intent);waitForIdleSync();
            screen("settings");screen("playlist");result.putString("result","GLASS_FIXTURE_OK");finish(Activity.RESULT_OK,result);
        } catch(Throwable e) {result.putString("result","GLASS_FIXTURE_FAIL: "+e.toString()+" cause="+String.valueOf(e.getCause()));finish(Activity.RESULT_CANCELED,result);}
    }
}
