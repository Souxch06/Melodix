package com.melodix.music;

import android.app.Activity;
import android.graphics.Canvas;
import android.graphics.Outline;
import android.graphics.Path;
import android.graphics.Rect;
import android.graphics.drawable.GradientDrawable;
import android.os.Build;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import java.util.ArrayList;

/** Software snapshot only: preserve outline clips lost by View.draw(Canvas). */
final class PreviewSnapshotRenderer {
    private static void collect(View v, ArrayList<View> out, int depth, int[] visited) {
        if (v == null || depth > 32 || visited[0]++ >= 2500 || out.size() >= 128 || !v.isShown()) return;
        if (v instanceof ImageView && v.getAlpha() == 1f && v.getWidth() > 0 && v.getHeight() > 0 &&
            v.getClipToOutline() && (v.getBackground() instanceof GradientDrawable || outlineRadius(v) > 0) && !out.contains(v)) out.add(v);
        if (v instanceof ViewGroup) {
            ViewGroup group=(ViewGroup)v;
            for (int i=0;i<group.getChildCount() && visited[0]<2500 && out.size()<128;i++) collect(group.getChildAt(i),out,depth+1,visited);
        }
    }
    /** Covers rounded by an outline provider (Liner restyle), not by their background. */
    private static float outlineRadius(View v) {
        if (Build.VERSION.SDK_INT < 24 || v.getOutlineProvider() == null || v.getBackground() instanceof GradientDrawable) return 0f;
        try { Outline o = new Outline(); v.getOutlineProvider().getOutline(v, o); return Math.max(0f, o.getRadius()); }
        catch (RuntimeException e) { return 0f; }
    }
    static void draw(Activity activity, View root, Canvas canvas) {
        ArrayList<View> images=new ArrayList<View>();
        View avatar=activity.findViewById(0x7f090249), mini=activity.findViewById(0x7f090244);
        for(View v:new View[]{avatar,mini}) if(v instanceof ImageView && v.isShown() && v.getAlpha()==1f && v.getWidth()>0 && v.getHeight()>0 && !images.contains(v)) images.add(v);
        collect(root,images,0,new int[]{0});
        boolean drawn=false;
        try {
            for(View v:images)v.setAlpha(0f);
            root.draw(canvas); drawn=true;
        } finally {
            for(View v:images)v.setAlpha(1f);
        }
        if (!drawn) return;
        int[] rootAt=new int[2], at=new int[2]; root.getLocationOnScreen(rootAt);
        for(View v:images) {
            Rect visible=new Rect(); if(!v.getGlobalVisibleRect(visible))continue;
            v.getLocationOnScreen(at); int x=at[0]-rootAt[0], y=at[1]-rootAt[1];
            float radius;
            if(v==avatar)radius=Math.min(v.getWidth(),v.getHeight())/2f;
            else if(v==mini)radius=Math.min(10f*activity.getResources().getDisplayMetrics().density,Math.min(v.getWidth(),v.getHeight())/2f);
            else if(outlineRadius(v)>0)radius=outlineRadius(v);
            else if(Build.VERSION.SDK_INT>=24 && v.getBackground() instanceof GradientDrawable)radius=((GradientDrawable)v.getBackground()).getCornerRadius();
            else radius=12f*activity.getResources().getDisplayMetrics().density;
            int saved=canvas.save();
            canvas.clipRect(visible.left-rootAt[0],visible.top-rootAt[1],visible.right-rootAt[0],visible.bottom-rootAt[1]);
            canvas.translate(x,y);Path path=new Path();path.addRoundRect(0,0,v.getWidth(),v.getHeight(),radius,radius,Path.Direction.CW);
            canvas.clipPath(path);v.draw(canvas);canvas.restoreToCount(saved);
        }
    }
}
