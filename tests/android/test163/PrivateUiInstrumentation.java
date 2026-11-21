package com.melodix.test163;

import android.app.Activity;
import android.app.Instrumentation;
import android.content.Intent;
import android.graphics.drawable.ColorDrawable;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;

/** Synthetic Android fixture; copied production Smali is exercised, not Spotify. */
public final class PrivateUiInstrumentation extends Instrumentation {
  @Override public void onCreate(Bundle b) { super.onCreate(b); start(); }
  private static void check(boolean value, String message) { if (!value) throw new AssertionError(message); }
  private static Field field(Class<?> type, String name) throws Exception { Field f=type.getDeclaredField(name); f.setAccessible(true); return f; }
  @Override public void onStart() {
    final Bundle result = new Bundle();
    try {
      Intent intent=new Intent(); intent.setClassName(getTargetContext(), "com.melodix.music.MainActivity"); intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
      final Activity a=startActivitySync(intent);
      final Throwable[] error={null};
      runOnMainSync(() -> {
        try {
          Class<?> c=a.getClass();
          LinearLayout root=new LinearLayout(a); root.setOrientation(LinearLayout.VERTICAL); root.setId(0x7f09022f);
          LinearLayout rows=new LinearLayout(a); rows.setId(0x7f090235); root.addView(rows);
          ImageView child=new ImageView(a); child.setImageDrawable(new ColorDrawable(0xff123456)); rows.addView(child);
          LinearLayout nested=new LinearLayout(a); rows.addView(nested);
          ImageView nestedImage=new ImageView(a); nested.addView(nestedImage);
          for (int id : new int[]{0x7f090249,0x7f090244,0x7f090245}) {
            ImageView image=new ImageView(a); image.setId(id); image.setImageDrawable(new ColorDrawable(0xff123456)); root.addView(image);
          }
          EditText search=new EditText(a); search.setId(0x7f090233); search.setText("synthetic private query"); root.addView(search);
          for(int id:new int[]{0x7f090230,0x7f090236,0x7f09023b,0x7f090237,0x7f09023c}) {
            TextView label=new TextView(a);label.setId(id);label.setText("synthetic private sentinel");root.addView(label);
          }
          FrameLayout mini=new FrameLayout(a);mini.setId(0x7f09024c);root.addView(mini);a.setContentView(root);
          for(String name:new String[]{"nativeCurrentScreen","nativeCurrentTitle","nativeCurrentJson","nativeExpectedId","nativeExpectedSearch","nativeReturnScreen","nativeReturnTitle","nativeReturnJson","nativeReturnExpectedId","nativeReturnSearch"}) field(c,name).set(a,"synthetic private sentinel");
          field(c,"nativeHasTrack").setBoolean(a,true);field(c,"nativeSettingsGeneration").setInt(a,7);
          c.getMethod("invalidateNativePrivateUi").invoke(a);
          for(String name:new String[]{"nativeCurrentScreen","nativeCurrentTitle","nativeCurrentJson","nativeExpectedId","nativeExpectedSearch","nativeReturnScreen","nativeReturnTitle","nativeReturnJson","nativeReturnExpectedId","nativeReturnSearch"}) check(field(c,name).get(a)==null,name);
          check(!field(c,"nativeHasTrack").getBoolean(a),"track invalidation");
          check(field(c,"nativeSettingsGeneration").getInt(a)==8,"settings generation invalidation");
          check(field(c,"nativeSessionUnproven").getBoolean(a),"unproven marker");
          check(rows.getChildCount()==0,"private rows removed");
          check(search.getText().length()==0,"search cleared");
          check(mini.getVisibility()==View.GONE,"old player hidden");
          for(int id:new int[]{0x7f090249,0x7f090244,0x7f090245}) check(((ImageView)a.findViewById(id)).getDrawable()==null,"old image removed");
          for(int id:new int[]{0x7f090237,0x7f09023c}) check(((TextView)a.findViewById(id)).getText().length()==0,"old artist removed");
          Class<?> picasso=getTargetContext().getClassLoader().loadClass("com.squareup.picasso.Picasso");
          check(picasso.getField("canceled").getInt(null)>=5,"image requests canceled including nested views");
          // The copied runnable and synthetic gate run the actual bytecode; no
          // mock result is fed to Melodix or claimed as an authenticated user.
          ClassLoader loader=getTargetContext().getClassLoader();
          Class<?> gate=loader.loadClass("com.melodix.music.NativeSessionGate");
          Class<?> task=loader.loadClass("com.melodix.music.NativeUiUpdateRunnable");
          Constructor<?> ctor=task.getDeclaredConstructor(c,String.class,String.class,int.class);ctor.setAccessible(true);
          gate.getField("state").setInt(null,3);gate.getField("generation").setInt(null,11);gate.getField("privateUiEpoch").setInt(null,20);
          Runnable current=(Runnable)ctor.newInstance(a,"home","synthetic payload",1);
          current.run();check(c.getField("received").getInt(null)==1,"current authorized payload");
          Runnable stale=(Runnable)ctor.newInstance(a,"home","synthetic private payload",1);
          gate.getField("privateUiEpoch").setInt(null,21);stale.run();
          check(c.getField("received").getInt(null)==1,"old epoch dropped");
          gate.getField("state").setInt(null,0);
          Runnable unproven=(Runnable)ctor.newInstance(a,"home","synthetic private payload",1);
          gate.getField("state").setInt(null,3);unproven.run();
          check(c.getField("received").getInt(null)==1,"unproven receipt dropped");
        } catch(Throwable t) { error[0]=t; }
      });
      if(error[0]!=null) throw error[0];
      result.putString("status","PASS synthetic Android fixture: copied production reset and payload runnable");
      finish(Activity.RESULT_OK,result);
    } catch(Throwable t) {
      result.putString("status","FAIL synthetic Android fixture: "+t.toString());
      finish(Activity.RESULT_CANCELED,result);
    }
  }
}
