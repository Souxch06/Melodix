#!/usr/bin/env python3
"""Exercise player geometry with simulated narrow, wide and resized windows."""
import os, subprocess, tempfile
from pathlib import Path
here=Path(__file__).resolve().parent
stubs={
'android/util/DisplayMetrics.java':'package android.util; public class DisplayMetrics {public float density=1;}',
'android/content/res/Resources.java':'package android.content.res;public class Resources {public android.util.DisplayMetrics getDisplayMetrics(){return new android.util.DisplayMetrics();}}',
'android/view/View.java':'''package android.view; public class View {public int width,padding;public Object parent;public String tag;public ViewGroup.LayoutParams params;public int updates;public View(int w){width=w;}public int getWidth(){return width;}public int getPaddingLeft(){return padding;}public int getPaddingRight(){return padding;}public android.content.res.Resources getResources(){return new android.content.res.Resources();}public Object getParent(){return parent;}public ViewGroup.LayoutParams getLayoutParams(){return params;}public void setLayoutParams(ViewGroup.LayoutParams p){params=p;updates++;}}''',
'android/view/ViewGroup.java':'''package android.view;import java.util.*;public class ViewGroup extends View{public java.util.List<View> children=new ArrayList<View>();public ViewGroup(int w){super(w);}public void add(View v){children.add(v);v.parent=this;}public View findViewWithTag(String t){for(View v:children){if(t.equals(v.tag))return v;if(v instanceof ViewGroup){View x=((ViewGroup)v).findViewWithTag(t);if(x!=null)return x;}}return null;}public static class LayoutParams {public static final int MATCH_PARENT=-1,WRAP_CONTENT=-2;public int width,height;public LayoutParams(int w,int h){width=w;height=h;}}}''',
'android/widget/LinearLayout.java':'''package android.widget;import android.view.*;public class LinearLayout extends ViewGroup {public static final int HORIZONTAL=0,VERTICAL=1;int orientation;public LinearLayout(int w){super(w);}public int getOrientation(){return orientation;}public void setOrientation(int o){orientation=o;}public static class LayoutParams extends ViewGroup.LayoutParams {public float weight;public int rightMargin;public LayoutParams(int w,int h,float a){super(w,h);weight=a;}}}''',
'com/melodix/music/ResponsiveTest.java':'''package com.melodix.music;import android.view.*;import android.widget.*;
public class ResponsiveTest {
static void ok(boolean b){if(!b)throw new AssertionError();}
public static void main(String[] args){
 ViewGroup panel=new ViewGroup(400);panel.padding=24;LinearLayout row=new LinearLayout(352);row.tag="previewPlayerLandscapeRow";panel.add(row);
 ViewGroup frame=new ViewGroup(0);frame.tag="previewPlayerArtFrame";frame.params=new LinearLayout.LayoutParams(0,-2,.44f);((LinearLayout.LayoutParams)frame.params).rightMargin=18;row.add(frame);
 View card=new View(0);card.tag="previewPlayerArtCard";card.params=new ViewGroup.LayoutParams(0,0);frame.add(card);
 LinearLayout details=new LinearLayout(0);details.tag="previewPlayerLandscapeDetails";details.params=new LinearLayout.LayoutParams(0,-2,.56f);row.add(details);
 PreviewPlayerResponsive.apply(panel);ok(row.getOrientation()==LinearLayout.VERTICAL);ok(frame.params.width==-1&&frame.params.height==318);ok(card.params.width==318&&card.params.height==318);ok(details.params.width==-1);ok(((LinearLayout.LayoutParams)details.params).weight==0);
 int n=frame.updates;PreviewPlayerResponsive.apply(panel);ok(frame.updates==n);
 panel.width=320;PreviewPlayerResponsive.apply(panel);ok(frame.params.height==272&&card.params.width==272);
 panel.width=800;PreviewPlayerResponsive.apply(panel);ok(row.getOrientation()==LinearLayout.HORIZONTAL);ok(frame.params.width==0&&frame.params.height==-2&&((LinearLayout.LayoutParams)frame.params).weight==.44f);ok(card.params.width==0&&details.params.width==0);
 panel.width=550;PreviewPlayerResponsive.apply(panel);ok(row.getOrientation()==LinearLayout.VERTICAL&&card.params.width==318);
 panel.width=0;int changes=frame.updates;PreviewPlayerResponsive.apply(panel);ok(changes==frame.updates);
 View unrelated=new View(200);PreviewPlayerResponsive.apply(unrelated);
 System.out.println("Responsive player JVM geometry simulation passed"); }}'''
}
with tempfile.TemporaryDirectory(prefix='player-responsive-jvm-') as tmp:
 root=Path(tmp);files=[]
 for name,content in stubs.items():
  p=root/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(content,encoding='utf8');files.append(str(p))
 files.append(str(here/'PreviewPlayerResponsive.java'));out=root/'classes';out.mkdir();java=os.environ.get('PREVIEW_TEST_JAVA','java');ecj=os.environ.get('PREVIEW_TEST_ECJ');compiler=[java,'-cp',ecj,'org.eclipse.jdt.internal.compiler.batch.Main'] if ecj else ['javac']
 subprocess.run(compiler+['-encoding','UTF-8','-source','8','-target','8','-d',str(out)]+files,check=True)
 subprocess.run([java,'-cp',str(out),'com.melodix.music.ResponsiveTest'],check=True)
