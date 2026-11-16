package com.melodix.music;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.drawable.Drawable;
import android.view.View;

/** Visualises only the existing accessible like description; no player access. */
public final class PreviewPlayerLikeArt extends Drawable {
    private final View control;
    private final Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG);
    public PreviewPlayerLikeArt(View control){this.control=control;}
    @Override public void draw(Canvas canvas){
        CharSequence value=control.getContentDescription();
        String label=value==null?"":value.toString();
        boolean active=label.startsWith("Retirer des titres likés");
        float d=control.getResources().getDisplayMetrics().density;
        float cx=getBounds().width()/2f,cy=getBounds().height()/2f;
        canvas.save();canvas.translate(cx-12*d,cy-12*d);canvas.scale(d,d);
        if(label.startsWith("Chargement :")) {
            paint.setColor(0xd9ffffff);paint.setStyle(Paint.Style.STROKE);paint.setStrokeWidth(2);paint.setStrokeCap(Paint.Cap.ROUND);
            canvas.drawCircle(12,12,7,paint);canvas.drawLine(12,8,12,12,paint);canvas.drawLine(12,12,15,14,paint);
        }else if(active){
            paint.setColor(0xffe0489e);paint.setStyle(Paint.Style.FILL);
            Path heart=new Path();heart.moveTo(12,21);heart.cubicTo(10.5f,19.7f,3,14.7f,3,9.4f);
            heart.cubicTo(3,4.5f,8.6f,2.7f,12,7);heart.cubicTo(15.4f,2.7f,21,4.5f,21,9.4f);
            heart.cubicTo(21,14.7f,13.5f,19.7f,12,21);heart.close();canvas.drawPath(heart,paint);
        }else{
            paint.setColor(0xd9ffffff);paint.setStyle(Paint.Style.STROKE);paint.setStrokeWidth(2);paint.setStrokeCap(Paint.Cap.ROUND);
            canvas.drawLine(12,5,12,19,paint);canvas.drawLine(5,12,19,12,paint);
        }
        canvas.restore();
    }
    @Override public void setAlpha(int alpha) { }
    @Override public void setColorFilter(ColorFilter filter) { }
    @Override public int getOpacity(){return PixelFormat.TRANSLUCENT;}
}
