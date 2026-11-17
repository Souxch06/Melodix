package com.melodix.music;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.graphics.Outline;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.LayerDrawable;
import android.graphics.drawable.RippleDrawable;
import android.os.Build;
import android.util.AttributeSet;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewOutlineProvider;
import android.view.ViewTreeObserver;
import android.widget.ImageView;
import android.widget.TextView;
import java.util.WeakHashMap;

/**
 * Preview only: visual restyle of the native screens (home, library, search,
 * playlists, mini player, titles). Presentation only: no command, data, text
 * content, click handler or WebView access. Each view is styled once.
 */
public final class PreviewUiRestyle extends View implements ViewTreeObserver.OnGlobalLayoutListener {
    private static final int WHITE = 0xfffbf8ff, LILAC = 0xffc4b5fd, SECONDARY = 0xffb9aed6, VIOLET = 0xff8b5cf6;
    private final WeakHashMap<View, Boolean> done = new WeakHashMap<View, Boolean>();
    private ViewTreeObserver observer;
    private boolean scheduled;
    private final Runnable pass = new Runnable() { public void run() { scheduled = false; restyle(); } };

    public PreviewUiRestyle(Context c, AttributeSet a) { super(c, a); }
    private int dp(float x) { return (int) (x * getResources().getDisplayMetrics().density + 0.5f); }
    private Activity activity() {
        Context c = getContext();
        for (int i = 0; i < 8 && c instanceof ContextWrapper; i++) {
            if (c instanceof Activity) return (Activity) c;
            Context n = ((ContextWrapper) c).getBaseContext(); if (n == c) break; c = n;
        }
        return c instanceof Activity ? (Activity) c : null;
    }

    static boolean grey(int c) {
        int r = Color.red(c), g = Color.green(c), b = Color.blue(c);
        return Math.max(r, Math.max(g, b)) - Math.min(r, Math.min(g, b)) < 28 && Math.max(r, Math.max(g, b)) < 0xe0;
    }
    /** Glass surface: translucent fill, hairline border, top highlight, violet ripple. */
    static Drawable glass(float radius, int density) {
        GradientDrawable fill = new GradientDrawable(); fill.setCornerRadius(radius); fill.setColor(0x16ffffff); fill.setStroke(Math.max(1, density), 0x26ffffff);
        GradientDrawable shine = new GradientDrawable(GradientDrawable.Orientation.TOP_BOTTOM, new int[]{0x24ffffff, 0x00ffffff, 0x00ffffff}); shine.setCornerRadius(radius);
        GradientDrawable mask = new GradientDrawable(); mask.setCornerRadius(radius); mask.setColor(0xffffffff);
        return new RippleDrawable(ColorStateList.valueOf(0x558b5cf6), new LayerDrawable(new Drawable[]{fill, shine}), mask);
    }
    private static boolean plainBackground(View v) {
        Drawable d = v.getBackground();
        if (d == null) return true;
        // A ripple with only its mask draws nothing at rest.
        return d instanceof RippleDrawable && ((RippleDrawable) d).getNumberOfLayers() <= 1;
    }
    private void round(final View v, final float radius) {
        v.setOutlineProvider(new ViewOutlineProvider() {
            @Override public void getOutline(View view, Outline o) { o.setRoundRect(0, 0, view.getWidth(), view.getHeight(), radius); }
        });
        v.setClipToOutline(true);
    }
    private void styleText(TextView t) {
        float sp = t.getTextSize() / getResources().getDisplayMetrics().scaledDensity;
        int color = t.getCurrentTextColor();
        boolean bold = t.getTypeface() != null && t.getTypeface().isBold();
        if (sp >= 19) {
            t.setTypeface(Typeface.create("sans-serif", Typeface.BOLD)); t.setTextColor(WHITE);
            if (Build.VERSION.SDK_INT >= 21) t.setLetterSpacing(-0.015f);
            t.setShadowLayer(dp(10), 0, dp(1), 0x668b5cf6);
        } else if (bold && sp <= 14.5f && grey(color)) {
            t.setTextColor(LILAC); if (Build.VERSION.SDK_INT >= 21) t.setLetterSpacing(0.04f);
        } else if (!bold && grey(color)) {
            t.setTextColor(SECONDARY);
        }
    }
    private void visit(View v, int depth) {
        if (depth > 40 || v.getVisibility() != VISIBLE) return;
        if (!done.containsKey(v) && v.getWidth() > 0 && v.getHeight() > 0) {
            done.put(v, Boolean.TRUE);
            if (v instanceof TextView && !(v instanceof android.widget.Button)) styleText((TextView) v);
            else if (v instanceof ImageView && v.getWidth() >= dp(40) && v.getHeight() >= dp(40)) {
                float r = Math.min(dp(18), Math.min(v.getWidth(), v.getHeight()) * 0.14f); round(v, r);
                if (v.getWidth() >= dp(96) && Build.VERSION.SDK_INT >= 28) { v.setElevation(dp(8)); v.setOutlineSpotShadowColor(VIOLET); v.setOutlineAmbientShadowColor(VIOLET); }
            } else if (v instanceof ViewGroup && v.isClickable() && plainBackground(v) &&
                       v.getWidth() >= dp(120) && v.getHeight() >= dp(48) && v.getHeight() <= dp(140) && !insideGlass(v)) {
                int l = v.getPaddingLeft(), t = v.getPaddingTop(), r = v.getPaddingRight(), b = v.getPaddingBottom();
                v.setBackground(glass(dp(18), dp(1))); v.setPadding(Math.max(l, dp(12)), t, Math.max(r, dp(12)), b);
                glassRows.put(v, Boolean.TRUE);
            }
        }
        if (v instanceof ViewGroup) { ViewGroup g = (ViewGroup) v; for (int i = 0; i < g.getChildCount(); i++) visit(g.getChildAt(i), depth + 1); }
    }
    private final WeakHashMap<View, Boolean> glassRows = new WeakHashMap<View, Boolean>();
    private boolean insideGlass(View v) {
        for (android.view.ViewParent p = v.getParent(); p instanceof View; p = p.getParent()) if (glassRows.containsKey(p)) return true;
        return false;
    }
    private void restyle() {
        Activity a = activity(); if (a == null || !isShown()) return;
        View title = a.findViewById(0x7f090230);
        if (title instanceof TextView && !done.containsKey(title)) {
            done.put(title, Boolean.TRUE); TextView t = (TextView) title;
            t.setTextSize(TypedValue.COMPLEX_UNIT_SP, 30); t.setTypeface(Typeface.create("sans-serif", Typeface.BOLD)); t.setTextColor(WHITE);
            if (Build.VERSION.SDK_INT >= 21) t.setLetterSpacing(-0.02f);
            t.setShadowLayer(dp(14), 0, dp(2), 0x808b5cf6);
        }
        View mini = a.findViewById(0x7f09024c);
        if (mini != null && !done.containsKey(mini) && Build.VERSION.SDK_INT >= 28) {
            done.put(mini, Boolean.TRUE); mini.setElevation(dp(14)); mini.setOutlineSpotShadowColor(VIOLET); mini.setOutlineAmbientShadowColor(0xffe0489e);
        }
        View content = a.findViewById(0x7f090235);
        if (content != null) visit(content, 0);
    }
    @Override public void onGlobalLayout() { if (!scheduled) { scheduled = true; postDelayed(pass, 120); } }
    @Override protected void onAttachedToWindow() { super.onAttachedToWindow(); observer = getViewTreeObserver(); observer.addOnGlobalLayoutListener(this); post(pass); }
    @Override protected void onDetachedFromWindow() {
        if (observer != null && observer.isAlive()) observer.removeOnGlobalLayoutListener(this);
        observer = null; removeCallbacks(pass); scheduled = false; super.onDetachedFromWindow();
    }
}
