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
public final class PreviewUiRestyle extends View implements ViewTreeObserver.OnGlobalLayoutListener, ViewTreeObserver.OnPreDrawListener {
    // UI UX Pro Max base (after 1022338): secondary text >= 4.5:1 on the dark glass (60% white), 8dp rhythm (16dp insets).
    private static final int WHITE = 0xfffafafa, LILAC = 0x99ffffff, SECONDARY = 0xa6ffffff, SHADOW = 0xff000000;
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
    /** Glass surface: translucent fill, hairline border, top highlight, neutral ripple (Liner tokens). */
    static Drawable glass(float radius, int density) {
        // Liner dark glass: white 10%->6% fill, 12% hairline, faint top sheen.
        GradientDrawable fill = new GradientDrawable(GradientDrawable.Orientation.TOP_BOTTOM, new int[]{0x1affffff, 0x0fffffff});
        fill.setCornerRadius(radius); fill.setStroke(Math.max(1, density), 0x1fffffff);
        GradientDrawable shine = new GradientDrawable(GradientDrawable.Orientation.TOP_BOTTOM, new int[]{0x14ffffff, 0x00ffffff, 0x00ffffff}); shine.setCornerRadius(radius);
        GradientDrawable mask = new GradientDrawable(); mask.setCornerRadius(radius); mask.setColor(0xffffffff);
        LayerDrawable layers = new LayerDrawable(new Drawable[]{fill, shine});
        layers.setLayerInset(1, density, density, density, 0);
        return new RippleDrawable(ColorStateList.valueOf(0x1fffffff), layers, mask);
    }
    /** Liner liked tile, drawn in code (no new resource ids): dark gradient, white heart. */
    public static void likedTile(ImageView v) {
        v.setImageDrawable(new android.graphics.drawable.LayerDrawable(new Drawable[]{
            new GradientDrawable(GradientDrawable.Orientation.TOP_BOTTOM, new int[]{0xff2a2a2e, 0xff141416}),
            new Drawable() {
                private final android.graphics.Paint p = new android.graphics.Paint(android.graphics.Paint.ANTI_ALIAS_FLAG);
                @Override public void draw(android.graphics.Canvas c) {
                    android.graphics.Rect b = getBounds(); float s = Math.min(b.width(), b.height()) * 0.4f / 24f;
                    c.save(); c.translate(b.exactCenterX() - 12 * s, b.exactCenterY() - 12 * s); c.scale(s, s);
                    android.graphics.Path h = new android.graphics.Path(); h.moveTo(12, 21); h.cubicTo(10.5f, 19.7f, 3, 14.7f, 3, 9.4f);
                    h.cubicTo(3, 4.5f, 8.6f, 2.7f, 12, 7); h.cubicTo(15.4f, 2.7f, 21, 4.5f, 21, 9.4f); h.cubicTo(21, 14.7f, 13.5f, 19.7f, 12, 21); h.close();
                    p.setColor(0xfff5f5f7); c.drawPath(h, p); c.restore();
                }
                @Override public void setAlpha(int a) { }
                @Override public void setColorFilter(android.graphics.ColorFilter f) { }
                @Override public int getOpacity() { return android.graphics.PixelFormat.TRANSLUCENT; }
            }}));
    }
    /** Liner volume: thick rounded white bar with a small white knob. */
    static void volumeBar(android.widget.SeekBar slider) {
        float d = slider.getResources().getDisplayMetrics().density;
        GradientDrawable track = new GradientDrawable(); track.setColor(0x26ffffff); track.setCornerRadius(7 * d);
        GradientDrawable fill = new GradientDrawable(); fill.setColor(0xffffffff); fill.setCornerRadius(7 * d);
        android.graphics.drawable.LayerDrawable bar = new android.graphics.drawable.LayerDrawable(new Drawable[]{track,
            new android.graphics.drawable.ClipDrawable(fill, android.view.Gravity.LEFT, android.graphics.drawable.ClipDrawable.HORIZONTAL)});
        bar.setId(0, android.R.id.background); bar.setId(1, android.R.id.progress);
        slider.setProgressTintList(null); slider.setProgressBackgroundTintList(null); slider.setThumbTintList(null);
        slider.setProgressDrawable(bar);
        if (Build.VERSION.SDK_INT >= 29) { slider.setMinHeight(Math.round(14 * d)); slider.setMaxHeight(Math.round(14 * d)); }
        GradientDrawable knob = new GradientDrawable(); knob.setShape(GradientDrawable.OVAL); knob.setColor(0xffffffff); knob.setSize(Math.round(22 * d), Math.round(22 * d));
        slider.setThumb(knob); slider.setSplitTrack(false);
    }
    /** Liner list row: no card, only a soft press highlight. */
    static Drawable flat(float radius) {
        GradientDrawable mask = new GradientDrawable(); mask.setCornerRadius(radius); mask.setColor(0xffffffff);
        return new RippleDrawable(ColorStateList.valueOf(0x1affffff), null, mask);
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
            // Liner headings: semibold, tight tracking, no glow.
            t.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL)); t.setTextColor(WHITE);
            if (Build.VERSION.SDK_INT >= 21) t.setLetterSpacing(-0.01f);
            t.setShadowLayer(0, 0, 0, 0);
        } else if (bold && sp > 14.5f) {
            // Liner list titles: medium weight, not heavy bold.
            t.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
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
            if (v instanceof android.widget.EditText) field((android.widget.EditText) v);
            else if (v instanceof TextView && !(v instanceof android.widget.Button)) {
                styleText((TextView) v);
                // Liner pill tabs: small clickable labels (filters, chips) become glass pills.
                if (v.isClickable() && plainBackground(v) && v.getHeight() >= dp(28) && v.getHeight() <= dp(44) && v.getWidth() <= dp(180) && !insideGlass(v)) {
                    v.setBackground(glass(v.getHeight() / 2f, dp(1)));
                    v.setPadding(Math.max(v.getPaddingLeft(), dp(16)), v.getPaddingTop(), Math.max(v.getPaddingRight(), dp(16)), v.getPaddingBottom());
                    press(v);
                }
            }
            else if (!(v instanceof ViewGroup) && !(v instanceof ImageView) && v.getHeight() <= dp(2) && v.getWidth() >= dp(48) &&
                     v.getBackground() instanceof android.graphics.drawable.ColorDrawable) v.setBackgroundColor(0x14ffffff);
            else if (v instanceof ImageView && v.getWidth() >= dp(40) && v.getHeight() >= dp(40)) {
                float r = Math.min(dp(10), Math.min(v.getWidth(), v.getHeight()) * 0.1f); round(v, r);
                if (v.getWidth() >= dp(96) && Build.VERSION.SDK_INT >= 28) { v.setElevation(dp(10)); v.setOutlineSpotShadowColor(SHADOW); v.setOutlineAmbientShadowColor(SHADOW); }
                if (v.isClickable()) press(v);
            } else if (v instanceof ViewGroup && v.isClickable() && plainBackground(v) &&
                       v.getWidth() >= dp(120) && v.getHeight() >= dp(48) && v.getHeight() <= dp(140) && !insideGlass(v)) {
                int l = v.getPaddingLeft(), t = v.getPaddingTop(), r = v.getPaddingRight(), b = v.getPaddingBottom();
                v.setBackground(flat(dp(12))); v.setPadding(Math.max(l, dp(16)), t, Math.max(r, dp(16)), b);
                glassRows.put(v, Boolean.TRUE); press(v);
            }
        }
        if (v instanceof ViewGroup) { ViewGroup g = (ViewGroup) v; for (int i = 0; i < g.getChildCount(); i++) visit(g.getChildAt(i), depth + 1); }
    }
    /** Text fields: glass pill, soft white hint, white text. Keeps input type, text and listeners. */
    private void field(android.widget.EditText e) {
        e.setBackground(glass(dp(24), dp(1)));
        e.setPadding(Math.max(e.getPaddingLeft(), dp(16)), e.getPaddingTop(), Math.max(e.getPaddingRight(), dp(16)), e.getPaddingBottom());
        e.setTextColor(WHITE); e.setHintTextColor(0x99ffffff);
    }
    private int entered;
    /** Press feedback on any clickable surface: shrink while held, spring back. Leaves click handling untouched. */
    static void press(View v) {
        if (motionOff() || v.getStateListAnimator() != null) return;
        android.animation.StateListAnimator s = new android.animation.StateListAnimator();
        s.addState(new int[]{android.R.attr.state_pressed}, scale(v, 0.965f, 90, null));
        s.addState(new int[]{}, scale(v, 1f, 220, new android.view.animation.OvershootInterpolator(2.2f)));
        v.setStateListAnimator(s);
    }
    private static android.animation.Animator scale(View v, float to, long ms, android.animation.TimeInterpolator i) {
        android.animation.AnimatorSet set = new android.animation.AnimatorSet();
        set.playTogether(android.animation.ObjectAnimator.ofFloat(v, "scaleX", to), android.animation.ObjectAnimator.ofFloat(v, "scaleY", to));
        set.setDuration(ms); if (i != null) set.setInterpolator(i); return set;
    }
    private static boolean motionOff() {
        return Build.VERSION.SDK_INT < 21 || (Build.VERSION.SDK_INT >= 26 && !android.animation.ValueAnimator.areAnimatorsEnabled());
    }
    /** Fade/slide-in of one view, staggered by index; a detach restores it so recycled views never stay hidden. */
    static void rise(final View v, int index) {
        if (motionOff()) return;
        float d = v.getResources().getDisplayMetrics().density;
        v.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
            @Override public void onViewAttachedToWindow(View x) { }
            @Override public void onViewDetachedFromWindow(View x) { x.animate().cancel(); x.setAlpha(1f); x.setTranslationY(0f); }
        });
        v.setAlpha(0f); v.setTranslationY(14 * d);
        v.animate().alpha(1f).translationY(0f).setStartDelay(Math.min(index, 18) * 32L).setDuration(300)
            .setInterpolator(new android.view.animation.DecelerateInterpolator(1.6f)).start();
    }
    /** Bottom sheet entrance: slides up from below with a fade. */
    static void sheet(final View v) {
        if (motionOff()) return;
        float d = v.getResources().getDisplayMetrics().density;
        v.setAlpha(0f); v.setTranslationY(320 * d);
        v.animate().alpha(1f).translationY(0f).setDuration(340).setInterpolator(new android.view.animation.DecelerateInterpolator(2f)).start();
    }
    private View lastScreen;
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
            // Liner header: compact semibold title on one line (long playlist names no longer wrap).
            t.setTextSize(TypedValue.COMPLEX_UNIT_SP, 22); t.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL)); t.setTextColor(WHITE);
            if (Build.VERSION.SDK_INT >= 21) t.setLetterSpacing(-0.01f);
            t.setSingleLine(true); t.setEllipsize(android.text.TextUtils.TruncateAt.END); t.setShadowLayer(0, 0, 0, 0);
        }
        View mini = a.findViewById(0x7f09024c);
        if (mini != null && !done.containsKey(mini) && Build.VERSION.SDK_INT >= 28) {
            done.put(mini, Boolean.TRUE); mini.setElevation(dp(14)); mini.setOutlineSpotShadowColor(SHADOW); mini.setOutlineAmbientShadowColor(0xff000000);
            if (plainBackground(mini)) mini.setBackground(glass(dp(14), dp(1)));
            press(mini);
        }
        View content = a.findViewById(0x7f090235);
        if (content instanceof ViewGroup && ((ViewGroup) content).getChildCount() > 0) {
            View screen = ((ViewGroup) content).getChildAt(0);
            if (screen != lastScreen) {
                lastScreen = screen; entered = 0;
                // No entrance replay: the native shell rebuilds this view on every refresh
                // (taps, row repaints), so animating it here made the UI look like it restarted.
            }
        }
        if (content != null) visit(content, 0);
    }
    // Style new views before their first frame: a delayed pass showed each new screen unstyled, then restyled (flash).
    @Override public void onGlobalLayout() { scheduled = true; }
    @Override public boolean onPreDraw() { if (scheduled) pass.run(); return true; }
    @Override protected void onAttachedToWindow() { super.onAttachedToWindow(); observer = getViewTreeObserver(); observer.addOnGlobalLayoutListener(this); observer.addOnPreDrawListener(this); post(pass); }
    @Override protected void onDetachedFromWindow() {
        if (observer != null && observer.isAlive()) { observer.removeOnGlobalLayoutListener(this); observer.removeOnPreDrawListener(this); }
        observer = null; removeCallbacks(pass); scheduled = false; super.onDetachedFromWindow();
    }
}
