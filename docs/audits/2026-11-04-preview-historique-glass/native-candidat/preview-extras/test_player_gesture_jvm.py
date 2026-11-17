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
 static final class Animator { View v;Animator(View v){this.v=v;} void cancel(){} Animator translationY(float x){v.y=x;return this;} Animator alpha(float x){v.alpha=x;return this;} Animator setDuration(int x){return this;} Animator setUpdateListener(Object x){return this;} Animator setInterpolator(Object x){return this;} Animator withEndAction(Runnable r){return this;} void start(){} }
 static class View { interface OnTouchListener {boolean onTouch(View v,MotionEvent e);} float y,alpha=1;Parent parent=new Parent();int height=600;void setTranslationY(float x){y=x;}void setAlpha(float x){alpha=x;} int getHeight(){return height;} Parent getParent(){return parent;} Animator animate(){return new Animator(this);} }
 static final class Activity { View panel=new View(); View findViewById(int id){return panel;} }
 Activity a=new Activity(); boolean closing; int backs; float status; Activity activity(){return a;} int dp(float x){return (int)x;} void navigateBack(){backs++;} void updateStatusForTranslation(float x){status=x;} Object followStatus(View v){return new Object();}
 '''+listener+'''
 static void ok(boolean x){if(!x)throw new AssertionError();}
 void event(DismissGesture g,View v,int act,float x,float y){ok(g.onTouch(v,new MotionEvent(act,x,y)));}
 void run(){
   View v=new View(),p=a.panel; DismissGesture g=new DismissGesture();
   event(g,v,0,0,0);event(g,v,2,0,60);ok(p.y==60&&p.alpha==1&&status==60);event(g,v,1,0,60);ok(backs==0&&p.y==0&&p.alpha==1&&!v.parent.disallow);
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

    def test_native_backdrop_capture_and_bounds(self):
        source=(HERE/'PreviewPlayerChrome.java').read_text(encoding='utf8')
        start=source.index('    public static void captureBeforeExpand')
        end=source.index("    /** Match the reader's dark top",start)
        capture=source[start:end]
        harness="""
public class PreviewPlayerChrome extends PreviewPlayerChromeView {
 Bitmap previousScreen;
 static class Build {static class VERSION {static int SDK_INT=30;}}
 static class ValueAnimator {static boolean enabled=true;static boolean areAnimatorsEnabled(){return enabled;}}
 static class Bitmap {static class Config {static int ARGB_8888;} int w,h;static Bitmap createBitmap(int w,int h,int c){Bitmap b=new Bitmap();b.w=w;b.h=h;return b;}}
 static class Canvas {Canvas(Bitmap b){}void scale(float x,float y){}}
 static class View extends PreviewPlayerChromeView { int width=2000,height=4000,draws; View tagged;boolean fails;int getWidth(){return width;}int getHeight(){return height;}View findViewWithTag(String s){return tagged;}void draw(Canvas c){draws++;if(fails)throw new RuntimeException();}}
 static class Activity {View root=new View(),panel=new View();View findViewById(int id){return id==0x7f09023a?panel:root;}}
 """+capture+"""
 static void ok(boolean b){if(!b)throw new AssertionError();}
 public static void main(String[] args){
  Activity a=new Activity();PreviewPlayerChrome chrome=new PreviewPlayerChrome();a.panel.tagged=chrome;
  captureBeforeExpand(a);ok(chrome.previousScreen!=null&&a.root.draws==1);ok((long)chrome.previousScreen.w*chrome.previousScreen.h<=1200000);
  ValueAnimator.enabled=false;captureBeforeExpand(a);ok(chrome.previousScreen==null&&a.root.draws==1);
  ValueAnimator.enabled=true;a.root.width=0;captureBeforeExpand(a);ok(chrome.previousScreen==null&&a.root.draws==1);
  a.root.width=100;a.root.fails=true;captureBeforeExpand(a);ok(chrome.previousScreen==null&&a.root.draws==2);
 }
}
class PreviewPlayerChromeView {}
"""
        # The real Chrome is itself a View; model just that inheritance here.
        harness=harness.replace('extends PreviewPlayerChromeView {\n Bitmap', 'extends PreviewPlayerChrome.View {\n Bitmap')
        # Avoid cyclic Java nesting: use independent top-level fake View instead.
        harness=harness.replace('extends PreviewPlayerChrome.View {\n Bitmap','extends FakeView {\n Bitmap').replace('static class View extends PreviewPlayerChromeView {','static class View extends FakeView {').replace('class PreviewPlayerChromeView {}','class FakeView {}')
        # findViewWithTag needs to return the same common View type as Chrome.
        harness=harness.replace('View tagged;boolean fails;', 'FakeView tagged;boolean fails;').replace('View findViewWithTag(String s){return tagged;}', 'FakeView findViewWithTag(String s){return tagged;}').replace('View v=p==null?null:p.findViewWithTag("previewPlayerChrome");','FakeView v=p==null?null:p.findViewWithTag("previewPlayerChrome");')
        with tempfile.TemporaryDirectory(dir=os.environ.get('RUNNER_TEMP')) as d:
            src=Path(d)/'PreviewPlayerChrome.java';src.write_text(harness,encoding='utf8')
            cmd=['java','-cp',os.environ['ECJ_JAR'],'org.eclipse.jdt.internal.compiler.batch.Main','-encoding','UTF-8','-source','1.8','-target','1.8','-d',d,str(src)] if os.environ.get('ECJ_JAR') else ['javac','-encoding','UTF-8','-d',d,str(src)]
            subprocess.run(cmd,check=True,capture_output=True,text=True)
            subprocess.run(['java','-cp',d,'PreviewPlayerChrome'],check=True,capture_output=True,text=True)
        self.assertIn('root.setBackground(backdrop)',source)
        self.assertIn('panel.setBackground(appliedBackground)',source)
        self.assertIn('previousScreen=null',source[source.index('private void restoreBackground'):])
        self.assertIn('p.setTranslationY(Math.max(p.getHeight(),dp(300)))',source)
        patch=(HERE.parent/'apply_preview_player_visual.py').read_text(encoding='utf8')
        self.assertIn('captureBeforeExpand(Landroid/app/Activity;)V',patch)

    def test_statusbar_restore_and_edge_inset(self):
        source=(HERE/'PreviewPlayerChrome.java').read_text(encoding='utf8')
        start=source.index('    private void applyStatusBar')
        end=source.index('    private void applyBackground',start)
        methods=source[start:end]
        harness="""
public class PreviewPlayerChrome {
 static class Build {static class VERSION {static int SDK_INT=35;}}
 static class ValueAnimator {interface AnimatorUpdateListener {void onAnimationUpdate(ValueAnimator v);}}
 static class Color {static int alpha(int c){return (c>>>24)&255;}static int red(int c){return (c>>>16)&255;}static int green(int c){return (c>>>8)&255;}static int blue(int c){return c&255;}static int argb(int a,int r,int g,int b){return (a<<24)|(r<<16)|(g<<8)|b;}}
 static class WindowManager {static class LayoutParams {static final int FLAG_TRANSLUCENT_STATUS=4,FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS=8;int flags;}}
 static class WindowInsets {int top;int getSystemWindowInsetTop(){return top;}}
 static class Drawable {int bottom,alpha=255;void setBounds(int a,int b,int c,int d){bottom=d;}void setAlpha(int a){alpha=a;}}
 static class ColorDrawable extends Drawable {ColorDrawable(int color){}}
 static class Overlay {int count;void add(Drawable x){count++;}void remove(Drawable x){count--;}}
 static class View {static final int SYSTEM_UI_FLAG_LIGHT_STATUS_BAR=16;int ui,width=500,top,bottom,color;WindowInsets insets=new WindowInsets();Overlay overlay=new Overlay();View(){} View(Activity a){} int getSystemUiVisibility(){return ui;}void setSystemUiVisibility(int x){ui=x;}void setBackgroundColor(int x){color=x;}int getWidth(){return width;}float getTranslationY(){return 0;}WindowInsets getRootWindowInsets(){return insets;}Overlay getOverlay(){return overlay;}void layout(int a,int b,int c,int d){top=b;bottom=d;}}
 static class Window {int color=123;View decor=new View();WindowManager.LayoutParams attr=new WindowManager.LayoutParams();View getDecorView(){return decor;}int getStatusBarColor(){return color;}void setStatusBarColor(int x){color=x;}WindowManager.LayoutParams getAttributes(){return attr;}void clearFlags(int f){attr.flags &= ~f;}void addFlags(int f){attr.flags |= f;}}
 static class Activity {Window w=new Window();Window getWindow(){return w;}}
 Window statusWindow;Drawable statusOverlay;View statusDecor,panel;int originalStatusColor,originalStatusFlags,originalStatusUi,lastStatusColor;static final int PLAYER_STATUS_COLOR=0xff0a0614;int dp(float x){return (int)x;}
 """+methods+"""
 static void ok(boolean b){if(!b)throw new AssertionError();}
 public static void main(String[] args){
  PreviewPlayerChrome p=new PreviewPlayerChrome();Activity a=new Activity();a.w.attr.flags=4;a.w.decor.ui=16|32;a.w.decor.insets.top=28;
  p.applyStatusBar(a);ok(a.w.color==PLAYER_STATUS_COLOR && a.w.attr.flags==8 && a.w.decor.ui==32);ok(a.w.decor.overlay.count==1 && p.statusOverlay.bottom==28);
  p.applyStatusBar(a);ok(a.w.decor.overlay.count==1);p.updateStatusForTranslation(36);ok(p.statusOverlay.alpha>=127&&p.statusOverlay.alpha<=128);p.updateStatusForTranslation(72);ok(p.statusOverlay.alpha==0&&a.w.color==123);p.updateStatusForTranslation(0);ok(p.statusOverlay.alpha==255&&a.w.color==PLAYER_STATUS_COLOR);a.w.decor.ui|=64;p.restoreStatusBar();ok(a.w.color==123 && a.w.attr.flags==4 && a.w.decor.ui==(16|32|64));ok(a.w.decor.overlay.count==0);
  Build.VERSION.SDK_INT=34;p.applyStatusBar(a);ok(a.w.decor.overlay.count==0);p.restoreStatusBar();ok(a.w.color==123);
  Build.VERSION.SDK_INT=35;a.w.decor.insets.top=0;p.applyStatusBar(a);ok(a.w.decor.overlay.count==0);p.restoreStatusBar();
 }
}
"""
        with tempfile.TemporaryDirectory(dir=os.environ.get('RUNNER_TEMP')) as d:
            src=Path(d)/'PreviewPlayerChrome.java';src.write_text(harness,encoding='utf8')
            cmd=['java','-cp',os.environ['ECJ_JAR'],'org.eclipse.jdt.internal.compiler.batch.Main','-encoding','UTF-8','-source','1.8','-target','1.8','-d',d,str(src)] if os.environ.get('ECJ_JAR') else ['javac','-encoding','UTF-8','-d',d,str(src)]
            subprocess.run(cmd,check=True,text=True)
            subprocess.run(['java','-cp',d,'PreviewPlayerChrome'],check=True,capture_output=True,text=True)

if __name__=='__main__':unittest.main(verbosity=2)
