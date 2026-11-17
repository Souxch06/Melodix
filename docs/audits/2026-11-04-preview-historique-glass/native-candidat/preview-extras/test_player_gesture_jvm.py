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
        start=source.index('    private static void drawNativeSnapshot')
        end=source.index("    /** Sample only the native drawable",start)
        capture=source[start:end]
        harness="""
public class PreviewPlayerChrome extends PreviewPlayerChromeView {
 Bitmap previousScreen;
 static class Build {static class VERSION {static int SDK_INT=30;}}
 static class ValueAnimator {static boolean enabled=true;static boolean areAnimatorsEnabled(){return enabled;}}
 static class Bitmap {static class Config {static int ARGB_8888;} int w,h;static Bitmap createBitmap(int w,int h,int c){Bitmap b=new Bitmap();b.w=w;b.h=h;return b;}}
 static class Path {enum Direction {CW} static float radius,firstRadius;static int n;void addRoundRect(float a,float b,float w,float h,float rx,float ry,Direction dir){radius=rx;if(n++==0)firstRadius=rx;}}
 static class Canvas {static int clipped;static float tx,ty;Canvas(Bitmap b){}void scale(float x,float y){}int save(){return 1;}void translate(float x,float y){tx=x;ty=y;}void clipPath(Path p){clipped++;}void restoreToCount(int n){}}
 static class View extends PreviewPlayerChromeView { int width=2000,height=4000,draws,x,y; View tagged;ImageView child,child2;boolean fails,shown=true;float alpha=1;int getWidth(){return width;}int getHeight(){return height;}boolean isShown(){return shown;}float getAlpha(){return alpha;}void setAlpha(float f){alpha=f;}void getLocationOnScreen(int[] p){p[0]=x;p[1]=y;}View findViewWithTag(String s){return tagged;}void draw(Canvas c){draws++;if((child!=null&&child.alpha!=0)||(child2!=null&&child2.alpha!=0))throw new AssertionError("image not hidden from software root draw");if(fails)throw new RuntimeException();}}
 static class ImageView extends View {ImageView(){width=40;height=40;}}
 static class Activity {View root=new View(),panel=new View();ImageView avatar,mini;Resources getResources(){return new Resources();}View findViewById(int id){return id==0x7f09023a?panel:id==0x7f090249?avatar:id==0x7f090244?mini:root;}}
 static class Resources {Display getDisplayMetrics(){return new Display();}} static class Display {float density=1;}
 """+capture+"""
 static void ok(boolean b){if(!b)throw new AssertionError();}
 public static void main(String[] args){
  Activity a=new Activity();PreviewPlayerChrome chrome=new PreviewPlayerChrome();a.panel.tagged=chrome;
  a.root.x=50;a.root.y=80;a.avatar=new ImageView();a.avatar.x=65;a.avatar.y=110;a.root.child=a.avatar;a.mini=new ImageView();a.mini.width=52;a.mini.height=52;a.mini.x=70;a.mini.y=200;a.root.child2=a.mini;
  captureBeforeExpand(a);ok(chrome.previousScreen!=null&&a.root.draws==1);ok((long)chrome.previousScreen.w*chrome.previousScreen.h<=1200000);
  ok(a.avatar.alpha==1f&&a.avatar.draws==1&&a.mini.alpha==1f&&a.mini.draws==1&&Path.firstRadius==20&&Path.radius==10&&Canvas.clipped==2&&Canvas.tx==20&&Canvas.ty==120);
  ValueAnimator.enabled=false;captureBeforeExpand(a);ok(chrome.previousScreen==null&&a.root.draws==1);
  ValueAnimator.enabled=true;a.root.width=0;captureBeforeExpand(a);ok(chrome.previousScreen==null&&a.root.draws==1);
  a.root.width=100;a.root.fails=true;captureBeforeExpand(a);ok(chrome.previousScreen==null&&a.root.draws==2&&a.avatar.alpha==1f&&a.mini.alpha==1f);
 }
}
class PreviewPlayerChromeView {}
"""
        # The real Chrome is itself a View; model just that inheritance here.
        harness=harness.replace('extends PreviewPlayerChromeView {\n Bitmap', 'extends PreviewPlayerChrome.View {\n Bitmap')
        # Avoid cyclic Java nesting: use independent top-level fake View instead.
        harness=harness.replace('extends PreviewPlayerChrome.View {\n Bitmap','extends FakeView {\n Bitmap').replace('static class View extends PreviewPlayerChromeView {','static class View extends FakeView {').replace('class PreviewPlayerChromeView {}','class FakeView {}')
        # findViewWithTag needs to return the same common View type as Chrome.
        harness=harness.replace('View tagged;ImageView child,child2;', 'FakeView tagged;ImageView child,child2;').replace('View findViewWithTag(String s){return tagged;}', 'FakeView findViewWithTag(String s){return tagged;}').replace('View v=p==null?null:p.findViewWithTag("previewPlayerChrome");','FakeView v=p==null?null:p.findViewWithTag("previewPlayerChrome");')
        with tempfile.TemporaryDirectory(dir=os.environ.get('RUNNER_TEMP')) as d:
            src=Path(d)/'PreviewPlayerChrome.java';src.write_text(harness,encoding='utf8')
            cmd=['java','-cp',os.environ['ECJ_JAR'],'org.eclipse.jdt.internal.compiler.batch.Main','-encoding','UTF-8','-source','1.8','-target','1.8','-d',d,str(src)] if os.environ.get('ECJ_JAR') else ['javac','-encoding','UTF-8','-d',d,str(src)]
            subprocess.run(cmd,check=True,text=True)
            subprocess.run(['java','-cp',d,'PreviewPlayerChrome'],check=True,capture_output=True,text=True)
        self.assertIn('root.setBackground(backdrop)',source)
        self.assertIn('panel.setBackground(appliedBackground)',source)
        self.assertIn('previousScreen=null',source[source.index('private void restoreBackground'):])
        self.assertIn('p.setTranslationY(Math.max(p.getHeight(),dp(300)))',source)
        patch=(HERE.parent/'apply_preview_player_visual.py').read_text(encoding='utf8')
        self.assertIn('captureBeforeExpand(Landroid/app/Activity;)V',patch)

    def test_close_restores_backdrop_before_resetting_hidden_panel(self):
        source=(HERE/'PreviewPlayerChrome.java').read_text(encoding='utf8')
        part=source[source.index('    private void closeAnimated'):source.index('    private void navigateBack')].replace('new android.view.animation.DecelerateInterpolator(1.3f)','new Object()')
        harness="""
public class PreviewPlayerChrome {
 boolean closing,bypassClose,restored; int updates;View target;
 int dp(int x){return x;} Object followStatus(View p){return new Object();}
 void updateStatusForTranslation(float y){updates++;}
 void sync(){if(target.shown)throw new AssertionError("sync before back");restored=true;}
 static class Animator {View v;Runnable end;Animator(View v){this.v=v;}void cancel(){}Animator translationY(float y){v.y=y;return this;}Animator alpha(float x){return this;}Animator setDuration(long n){return this;}Animator setUpdateListener(Object l){return this;}Animator setInterpolator(Object l){return this;}Animator withEndAction(Runnable r){end=r;return this;}void start(){end.run();}}
 static class View {float y;boolean shown=true;PreviewPlayerChrome owner;Animator animation=new Animator(this);int getHeight(){return 600;}boolean isShown(){return shown;}Animator animate(){return animation;}void setTranslationY(float y){if(!shown&&!owner.restored)throw new AssertionError("reset before restoring live backdrop");this.y=y;}void setAlpha(float x){}}
 public static class Activity {View panel;boolean leave=true;public void onNativeBackClick(View v){if(leave)panel.shown=false;}}
 """+part+"""
 public static void main(String[] args){PreviewPlayerChrome c=new PreviewPlayerChrome();View p=new View();p.owner=c;c.target=p;Activity a=new Activity();a.panel=p;c.closeAnimated(a,p);if(!c.restored||p.y!=0||c.bypassClose)throw new AssertionError();
 PreviewPlayerChrome x=new PreviewPlayerChrome();View q=new View();q.owner=x;x.target=q;Activity b=new Activity();b.panel=q;b.leave=false;x.closeAnimated(b,q);if(x.restored||q.y!=0||x.updates!=1)throw new AssertionError();}
}
""".replace('new android.view.animation.DecelerateInterpolator(1.3f)','new Object()')
        with tempfile.TemporaryDirectory(dir=os.environ.get('RUNNER_TEMP')) as d:
            src=Path(d)/'PreviewPlayerChrome.java';src.write_text(harness,encoding='utf8')
            cmd=['java','-cp',os.environ['ECJ_JAR'],'org.eclipse.jdt.internal.compiler.batch.Main','-encoding','UTF-8','-source','1.8','-target','1.8','-d',d,str(src)] if os.environ.get('ECJ_JAR') else ['javac','-encoding','UTF-8','-d',d,str(src)]
            subprocess.run(cmd,check=True,text=True)
            subprocess.run(['java','-cp',d,'PreviewPlayerChrome'],check=True,text=True)

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
 static class WindowManager {static class LayoutParams {static final int FLAG_TRANSLUCENT_STATUS=4,FLAG_TRANSLUCENT_NAVIGATION=2,FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS=8;int flags;}}
 static class WindowInsets {int top,bottom;int getSystemWindowInsetTop(){return top;}int getSystemWindowInsetBottom(){return bottom;}}
 static class GradientDrawable {enum Orientation {LEFT_RIGHT} int bottom,top,alpha=255;int[] colors;GradientDrawable(Orientation o,int[] c){colors=c;}void setColors(int[] c){colors=c;}void setBounds(int a,int b,int c,int d){top=b;bottom=d;}void setAlpha(int a){alpha=a;}}
 static class Overlay {int count;void add(GradientDrawable x){count++;}void remove(GradientDrawable x){count--;}}
 static class View {static final int SYSTEM_UI_FLAG_LIGHT_STATUS_BAR=16,SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR=128;int ui,width=500,height=600;float y;WindowInsets insets=new WindowInsets();Overlay overlay=new Overlay();int getSystemUiVisibility(){return ui;}void setSystemUiVisibility(int x){ui=x;}int getWidth(){return width;}int getHeight(){return height;}float getTranslationY(){return y;}WindowInsets getRootWindowInsets(){return insets;}Overlay getOverlay(){return overlay;}}
 static class Window {int color=0xff202030,nav=0xff404050;boolean contrast=true;View decor=new View();WindowManager.LayoutParams attr=new WindowManager.LayoutParams();View getDecorView(){return decor;}int getStatusBarColor(){return color;}void setStatusBarColor(int x){color=x;}int getNavigationBarColor(){return nav;}void setNavigationBarColor(int x){nav=x;}boolean isNavigationBarContrastEnforced(){return contrast;}void setNavigationBarContrastEnforced(boolean b){contrast=b;}WindowManager.LayoutParams getAttributes(){return attr;}void clearFlags(int f){attr.flags &= ~f;}void addFlags(int f){attr.flags |= f;}}
 static class Activity {Window w=new Window();Window getWindow(){return w;}}
 Window statusWindow;GradientDrawable statusOverlay,navOverlay;View statusDecor,panel;int originalStatusColor,originalNavColor,originalStatusFlags,originalStatusUi,lastStatusColor,lastNavColor;boolean originalNavContrast;int[] topColors={0xff110011,0xff220022,0xff330033},bottomColors={0xff050505,0xff090909,0xff0c0c0c};int dp(float x){return (int)x;}
 void refreshSystemBarColors(){updateStatusForTranslation(panel==null?0:panel.getTranslationY());}
 """+methods+"""
 static void ok(boolean b){if(!b)throw new AssertionError();}
 public static void main(String[] args){
  PreviewPlayerChrome p=new PreviewPlayerChrome();p.panel=new View();Activity a=new Activity();a.w.attr.flags=4|2;a.w.decor.ui=16|128|32;a.w.decor.insets.top=28;a.w.decor.insets.bottom=24;
  p.applyStatusBar(a);ok(a.w.color==0xff220022 && a.w.nav==0xff090909 && a.w.attr.flags==8 && a.w.decor.ui==32&&!a.w.contrast);ok(a.w.decor.overlay.count==2 && p.statusOverlay.bottom==28 && p.navOverlay.top==576 && p.navOverlay.bottom==600);
  p.applyStatusBar(a);ok(a.w.decor.overlay.count==2);p.updateStatusForTranslation(36);ok(p.statusOverlay.alpha>=127&&p.statusOverlay.alpha<=128&&p.navOverlay.alpha==255);p.updateStatusForTranslation(72);ok(p.statusOverlay.alpha==0&&a.w.color==0xff202030&&p.navOverlay.alpha==255);p.updateStatusForTranslation(600);ok(p.navOverlay.alpha==0&&a.w.nav==0xff404050);p.updateStatusForTranslation(0);ok(p.statusOverlay.alpha==255&&p.navOverlay.alpha==255);a.w.decor.ui|=64;p.restoreStatusBar();ok(a.w.color==0xff202030 && a.w.nav==0xff404050 && a.w.attr.flags==(4|2) && a.w.decor.ui==(16|128|32|64)&&a.w.contrast);ok(a.w.decor.overlay.count==0);
  Build.VERSION.SDK_INT=34;p.applyStatusBar(a);ok(a.w.decor.overlay.count==0);p.restoreStatusBar();ok(a.w.color==0xff202030&&a.w.nav==0xff404050);
  Build.VERSION.SDK_INT=35;a.w.decor.insets.top=0;a.w.decor.insets.bottom=0;p.applyStatusBar(a);ok(a.w.decor.overlay.count==0);p.restoreStatusBar();
 }
}
"""
        with tempfile.TemporaryDirectory(dir=os.environ.get('RUNNER_TEMP')) as d:
            src=Path(d)/'PreviewPlayerChrome.java';src.write_text(harness,encoding='utf8')
            cmd=['java','-cp',os.environ['ECJ_JAR'],'org.eclipse.jdt.internal.compiler.batch.Main','-encoding','UTF-8','-source','1.8','-target','1.8','-d',d,str(src)] if os.environ.get('ECJ_JAR') else ['javac','-encoding','UTF-8','-d',d,str(src)]
            subprocess.run(cmd,check=True,text=True)
            subprocess.run(['java','-cp',d,'PreviewPlayerChrome'],check=True,capture_output=True,text=True)

if __name__=='__main__':unittest.main(verbosity=2)
