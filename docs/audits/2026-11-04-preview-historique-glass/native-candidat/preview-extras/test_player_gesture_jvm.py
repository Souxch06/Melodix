#!/usr/bin/env python3
"""Execute the real gesture listener with minimal fake views; no Android device."""
import os, subprocess, tempfile, unittest
from pathlib import Path
HERE=Path(__file__).resolve().parent

class GestureTest(unittest.TestCase):
    def test_real_listener(self):
        source=(HERE/'PreviewPlayerChrome.java').read_text(encoding='utf8')
        start=source.index('    private final class DismissGesture')
        end=source.index('    private void setupCosmetics', start)
        listener=source[start:end].replace('new android.view.animation.DecelerateInterpolator()', 'new Object()')
        harness='''
public class GestureHarness {
 static final class Build { static final class VERSION { static int SDK_INT=30; } }
 static final class ValueAnimator { static boolean enabled=true; static boolean areAnimatorsEnabled(){return enabled;} }
 static final class MotionEvent { static final int ACTION_DOWN=0,ACTION_UP=1,ACTION_MOVE=2,ACTION_CANCEL=3,ACTION_POINTER_DOWN=5; int a;float x,y;MotionEvent(int a,float x,float y){this.a=a;this.x=x;this.y=y;} int getActionMasked(){return a;} float getRawX(){return x;} float getRawY(){return y;} }
 static final class Parent { boolean disallow; void requestDisallowInterceptTouchEvent(boolean b){disallow=b;} }
 static final class Animator { View v;Animator(View v){this.v=v;} void cancel(){} Animator translationY(float x){v.y=x;return this;} Animator alpha(float x){v.alpha=x;return this;} Animator setDuration(int x){return this;} Animator setInterpolator(Object x){return this;} void start(){} }
 static class View { interface OnTouchListener {boolean onTouch(View v,MotionEvent e);} float y,alpha=1;Parent parent=new Parent();int height=600;void setTranslationY(float x){y=x;}void setAlpha(float x){alpha=x;} int getHeight(){return height;} Parent getParent(){return parent;} Animator animate(){return new Animator(this);} }
 static final class Activity { View panel=new View(); View findViewById(int id){return panel;} }
 Activity a=new Activity(); boolean closing; int backs; Activity activity(){return a;} int dp(float x){return (int)x;} void navigateBack(){backs++;}
 '''+listener+'''
 static void ok(boolean x){if(!x)throw new AssertionError();}
 void event(DismissGesture g,View v,int act,float x,float y){ok(g.onTouch(v,new MotionEvent(act,x,y)));}
 void run(){
   View v=new View(),p=a.panel; DismissGesture g=new DismissGesture();
   event(g,v,0,0,0);event(g,v,2,0,60);ok(p.y==60);event(g,v,1,0,60);ok(backs==0&&p.y==0&&p.alpha==1&&!v.parent.disallow);
   event(g,v,0,0,0);event(g,v,2,0,130);ok(p.y==130);event(g,v,1,0,130);ok(backs==1&&!v.parent.disallow);
   p.y=0;event(g,v,0,0,0);event(g,v,2,120,10);event(g,v,1,120,200);ok(backs==1&&p.y==0);
   event(g,v,0,0,0);event(g,v,2,0,-50);event(g,v,1,0,200);ok(backs==1);
   event(g,v,0,0,0);event(g,v,2,0,140);event(g,v,3,0,140);ok(backs==1&&p.y==0);
   event(g,v,0,0,0);event(g,v,2,0,140);event(g,v,5,0,140);event(g,v,1,0,200);ok(backs==1&&p.y==0);
   ValueAnimator.enabled=false;event(g,v,0,0,0);event(g,v,2,0,40);event(g,v,1,0,40);ok(backs==1&&p.y==0);
 }
 public static void main(String[] a){new GestureHarness().run();System.out.println("gesture cases passed");}
}
'''
        with tempfile.TemporaryDirectory(dir=os.environ.get('RUNNER_TEMP')) as d:
            src=Path(d)/'GestureHarness.java';src.write_text(harness,encoding='utf8')
            if os.environ.get('ECJ_JAR'):
                cmd=['java','-cp',os.environ['ECJ_JAR'],'org.eclipse.jdt.internal.compiler.batch.Main','-encoding','UTF-8','-source','1.8','-target','1.8','-d',d,str(src)]
            else:cmd=['javac','-encoding','UTF-8','-d',d,str(src)]
            subprocess.run(cmd,check=True,capture_output=True,text=True)
            run=subprocess.run(['java','-cp',d,'GestureHarness'],check=True,capture_output=True,text=True)
            self.assertIn('gesture cases passed',run.stdout)

if __name__=='__main__':unittest.main(verbosity=2)
