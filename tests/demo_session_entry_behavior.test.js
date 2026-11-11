'use strict';
const {test} = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const os = require('node:os');
const path = require('node:path');
const cp = require('node:child_process');
const which = name => { const r = cp.spawnSync('which', [name], {encoding:'utf8'}); return r.status === 0 ? r.stdout.trim() : null; };

test('session entry behavior: existing view, fallback placement, click and repeated paints', t => {
  const java = which('java');
  const javac = which('javac');
  const ecj = process.env.MELODIX_ECJ_JAR;
  if (!java || (!javac && !ecj)) { t.skip('no Java compiler/runtime available'); return; }
  const temp = fs.mkdtempSync(path.join(os.tmpdir(), 'melodix-demo-entry-java-'));
  const sources = {
    'android/content/res/Resources.java': `package android.content.res;
      public class Resources {
        public static class DisplayMetrics { public float density=1; }
        public DisplayMetrics getDisplayMetrics(){return new DisplayMetrics();}
        public int getIdentifier(String n,String t,String p){return n.equals("sessionCard")?100:n.equals("sessionAction")?101:0;}
      }`,
    'android/content/Intent.java': `package android.content;
      import android.app.Activity;
      public class Intent { public static final int FLAG_ACTIVITY_CLEAR_TOP=1,FLAG_ACTIVITY_SINGLE_TOP=2;
        public Class<?> target; public Intent(){} public Intent(Activity a,Class<?> c){target=c;}
        public void setClassName(String p,String c){} public void addFlags(int f){} }`,
    'android/app/Activity.java': `package android.app;
      import android.content.Intent; import android.content.res.Resources;
      public class Activity { public Intent started; public Resources getResources(){return new Resources();}
        public String getPackageName(){return "com.melodix.music.preview";}
        public void startActivity(Intent i){started=i;} public void finish(){} }`,
    'android/graphics/Color.java': 'package android.graphics; public class Color { public static final int WHITE=-1; }',
    'android/graphics/Typeface.java': 'package android.graphics; public class Typeface { public static final int BOLD=1; }',
    'android/view/Gravity.java': 'package android.view; public class Gravity { public static final int CENTER=17; }',
    'android/view/View.java': `package android.view;
      public class View { public int id; public Object tag; public OnClickListener listener;
        public interface OnClickListener { void onClick(View v); }
        public void setTag(Object t){tag=t;} public void setBackgroundResource(int r){}
        public void setOnClickListener(OnClickListener l){listener=l;} public void click(){listener.onClick(this);}
        public View findViewById(int i){return id==i?this:null;}
        public View findViewWithTag(Object t){return t.equals(tag)?this:null;} }`,
    'android/widget/LinearLayout.java': `package android.widget;
      import java.util.*; import android.view.View;
      public class LinearLayout extends View { public final List<View> children=new ArrayList<View>();
        public static class LayoutParams { public int topMargin; public LayoutParams(int w,int h){} public void setMargins(int a,int b,int c,int d){} }
        public void addView(View v,LayoutParams p){children.add(v);} public void addView(View v,int i,LayoutParams p){children.add(i,v);}
        public int indexOfChild(View v){return children.indexOf(v);} public View getChildAt(int i){return children.get(i);}
        public View findViewById(int i){View x=super.findViewById(i); if(x!=null)return x; for(View c:children){x=c.findViewById(i);if(x!=null)return x;}return null;}
        public View findViewWithTag(Object t){View x=super.findViewWithTag(t);if(x!=null)return x;for(View c:children){x=c.findViewWithTag(t);if(x!=null)return x;}return null;} }`,
    'android/widget/ScrollView.java': 'package android.widget; public class ScrollView extends LinearLayout {}',
    'android/widget/TextView.java': `package android.widget;
      import android.app.Activity; import android.view.View;
      public class TextView extends View { public String text; public TextView(Activity a){}
        public void setText(String t){text=t;} public void setContentDescription(String t){} public void setTextColor(int c){}
        public void setTextSize(int s){} public void setTypeface(Object t,int s){} public void setGravity(int g){}
        public void setPadding(int a,int b,int c,int d){} public void setMinHeight(int v){} }`,
    'com/melodix/demo/DemoActivity.java': 'package com.melodix.demo; public class DemoActivity extends android.app.Activity {}',
    'Driver.java': `import android.app.Activity; import android.view.View; import android.widget.*; import com.melodix.demo.*;
      public class Driver { static void check(boolean b){if(!b)throw new AssertionError();}
        static LinearLayout card(){LinearLayout c=new LinearLayout();c.id=100;View action=new View();action.id=101;
          c.addView(action,new LinearLayout.LayoutParams(0,0));c.addView(new View(),new LinearLayout.LayoutParams(0,0));return c;}
        public static void main(String[] args){Activity a=new Activity();
          LinearLayout c=card(); DemoEntry.bindSession(a,c,4,false); View b=c.findViewWithTag("preview-demo-entry");
          check(b!=null && c.indexOfChild(b)==1); check(((TextView)b).text.equals("Essayer le mode démo"));
          b.click();check(a.started.target==DemoActivity.class); int size=c.children.size();
          DemoEntry.bindSession(a,c,4,false); DemoEntry.bindSessionOtherStates(a,c,4,false); check(c.children.size()==size);
          LinearLayout fixed=card();View declared=new View();declared.tag="preview-demo-entry";
          fixed.addView(declared,1,new LinearLayout.LayoutParams(0,0));size=fixed.children.size();
          DemoEntry.bindSession(a,fixed,4,false);check(fixed.children.size()==size);
          DemoEntry.bindSessionOtherStates(a,fixed,0,false);check(fixed.children.size()==size);
          ScrollView header=new ScrollView();LinearLayout content=new LinearLayout();header.addView(content,new LinearLayout.LayoutParams(0,0));
          DemoEntry.bindSessionOtherStates(a,header,1,true);check(content.children.size()==1 && content.getChildAt(0).tag.equals("preview-demo-entry"));
          DemoEntry.bindSessionOtherStates(a,header,1,true);check(content.children.size()==1);
          LinearLayout valid=card();DemoEntry.bindSession(a,valid,3,false);DemoEntry.bindSessionOtherStates(a,valid,3,false);check(valid.children.size()==2);
          a.started=null;DemoEntry.open(a);check(a.started.target==DemoActivity.class);
          System.out.println("all session entry behavior checks passed");
        }} `,
  };
  try {
    const files = [];
    for (const [name, content] of Object.entries(sources)) {
      const f = path.join(temp, name); fs.mkdirSync(path.dirname(f), {recursive:true}); fs.writeFileSync(f, content); files.push(f);
    }
    files.push(path.resolve('demo/src/com/melodix/demo/DemoEntry.java'));
    const opts = javac ? ['-d', temp, ...files] : ['-cp', ecj, 'org.eclipse.jdt.internal.compiler.batch.Main', '-source', '1.8', '-target', '1.8', '-d', temp, ...files];
    const compile = cp.spawnSync(javac || java, opts, {encoding:'utf8'});
    assert.equal(compile.status, 0, compile.stderr || compile.stdout);
    const run = cp.spawnSync(java, ['-cp', temp, 'Driver'], {encoding:'utf8'});
    assert.equal(run.status, 0, run.stderr || run.stdout);
    assert.match(run.stdout, /all session entry behavior checks passed/);
  } finally { fs.rmSync(temp, {recursive:true, force:true}); }
});
