package com.melodix.music;

import android.animation.ValueAnimator;
import android.content.Context;
import android.os.Build;
import android.util.AttributeSet;
import android.view.View;
import android.widget.ImageView;

/** Cosmetic response to the already rendered native play/pause icon. */
public final class PreviewPlayerPlayButton extends ImageView {
    private float lastScale = -1f;
    public PreviewPlayerPlayButton(Context context, AttributeSet attrs) { super(context, attrs); }
    @Override public void setImageResource(final int id) {
        super.setImageResource(id);
        if (id != 0x7f080121 && id != 0x7f080122) return;
        post(new Runnable() { public void run() {
            if (!isAttachedToWindow()) return;
            View art = getRootView().findViewWithTag("previewPlayerArtCard");
            if (art == null) return;
            float scale = id == 0x7f080122 ? 0.92f : 1f;
            if (lastScale == scale) return;
            lastScale = scale;
            art.animate().cancel();
            if (Build.VERSION.SDK_INT >= 26 && !ValueAnimator.areAnimatorsEnabled()) {
                art.setScaleX(scale); art.setScaleY(scale);
            } else art.animate().scaleX(scale).scaleY(scale).setDuration(200).start();
        }});
    }
}
