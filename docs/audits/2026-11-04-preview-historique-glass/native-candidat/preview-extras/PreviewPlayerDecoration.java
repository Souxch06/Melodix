package com.melodix.music;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.drawable.Drawable;
import android.view.View;

/** Draws only from the mode control's existing accessible description. */
public final class PreviewPlayerDecoration extends Drawable {
    private final View control;
    private final boolean repeat;
    private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
    public PreviewPlayerDecoration(View control, boolean repeat) { this.control=control; this.repeat=repeat; }
    @Override public void draw(Canvas canvas) {
        CharSequence text=control.getContentDescription();
        String label=text==null?"":text.toString();
        boolean single=label.startsWith("Répéter le titre");
        boolean active=single || label.startsWith("Répéter la liste") || label.startsWith("Lecture aléatoire activée");
        paint.setColor(active?0xffe0489e:0xb3c9c0ea);
        float density=control.getResources().getDisplayMetrics().density;
        float cx=getBounds().width()/2f, cy=getBounds().height()/2f;
        if (!repeat) {
            if(active){paint.setStyle(Paint.Style.FILL);canvas.drawCircle(cx,cy+15*density,2*density,paint);}
            return;
        }
        if(active){paint.setStyle(Paint.Style.FILL);canvas.drawCircle(cx,cy+15*density,2*density,paint);}
        canvas.save();canvas.translate(cx-12*density,cy-12*density);canvas.scale(density,density);
        paint.setStyle(Paint.Style.STROKE);paint.setStrokeWidth(1.8f);paint.setStrokeCap(Paint.Cap.ROUND);paint.setStrokeJoin(Paint.Join.ROUND);
        Path path=new Path();
        path.moveTo(4,9);path.cubicTo(4,5.5f,6,4,9,4);path.lineTo(19,4);path.moveTo(16,1.5f);path.lineTo(19,4);path.lineTo(16,6.5f);
        path.moveTo(20,15);path.cubicTo(20,18.5f,18,20,15,20);path.lineTo(5,20);path.moveTo(8,17.5f);path.lineTo(5,20);path.lineTo(8,22.5f);
        canvas.drawPath(path,paint);
        if(single){paint.setStyle(Paint.Style.FILL);paint.setTextAlign(Paint.Align.CENTER);paint.setTypeface(android.graphics.Typeface.DEFAULT_BOLD);paint.setTextSize(9);canvas.drawText("1",12,15.2f,paint);}
        canvas.restore();
    }
    @Override public void setAlpha(int alpha) { }
    @Override public void setColorFilter(ColorFilter filter) { }
    @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
}
