package com.melodix.music;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.text.SpannableString;
import android.text.Spanned;
import android.text.style.ImageSpan;

/** Small, consistently weighted vector icons; no icon font or network assets. */
public final class PreviewPanelIcon extends Drawable {
    public static final int MUTED=0,SPEAKER=1,REFRESH=2,CLOSE=3,QUEUE=4,LYRICS=5,DEVICES=6;
    private final int size,kind,color;
    private int alpha=255;
    private final Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG);
    private PreviewPanelIcon(int size,int kind,int color){this.size=size;this.kind=kind;this.color=color;}
    @Override public int getIntrinsicWidth(){return size;}
    @Override public int getIntrinsicHeight(){return size;}
    @Override public void draw(Canvas c){
        c.save();c.translate(getBounds().left,getBounds().top);c.scale(getBounds().width()/24f,getBounds().height()/24f);
        paint.setColor(color);paint.setAlpha(alpha);paint.setStyle(Paint.Style.STROKE);paint.setStrokeWidth(1.8f);paint.setStrokeCap(Paint.Cap.ROUND);paint.setStrokeJoin(Paint.Join.ROUND);
        Path p=new Path();
        if(kind==MUTED || kind==SPEAKER){
            p.moveTo(3.5f,9);p.lineTo(7.5f,9);p.lineTo(12.5f,5.5f);p.lineTo(12.5f,18.5f);p.lineTo(7.5f,15);p.lineTo(3.5f,15);p.close();c.drawPath(p,paint);
            if(kind==MUTED){c.drawLine(16,10,20,14,paint);c.drawLine(20,10,16,14,paint);}
            else{p=new Path();p.moveTo(15.5f,9);p.cubicTo(17,10.5f,17,13.5f,15.5f,15);p.moveTo(18,6.5f);p.cubicTo(21,9.5f,21,14.5f,18,17.5f);c.drawPath(p,paint);}
        }else if(kind==REFRESH){
            c.drawArc(4,4,20,20,-45,290,false,paint);c.drawLine(19.5f,4.5f,19.5f,8.5f,paint);c.drawLine(19.5f,8.5f,15.5f,8.5f,paint);
        }else if(kind==CLOSE){c.drawLine(7,7,17,17,paint);c.drawLine(17,7,7,17,paint);}
        else if(kind==QUEUE){c.drawLine(4,6,20,6,paint);c.drawLine(4,11,17,11,paint);c.drawLine(4,16,13,16,paint);p.moveTo(16,15);p.lineTo(20,17.5f);p.lineTo(16,20);p.close();c.drawPath(p,paint);}
        else if(kind==LYRICS){p.moveTo(14,5);p.lineTo(19,4);p.lineTo(19,15);p.moveTo(14,5);p.lineTo(14,17);c.drawPath(p,paint);c.drawOval(8,15,14,19,paint);c.drawOval(13,13,19,17,paint);}
        else if(kind==DEVICES){c.drawRoundRect(3,5,16,15,2,2,paint);c.drawLine(6,18,13,18,paint);c.drawLine(9.5f,15,9.5f,18,paint);c.drawRoundRect(17,9,21,19,1,1,paint);}
        c.restore();
    }
    @Override public void setAlpha(int a){alpha=a;invalidateSelf();}
    @Override public void setColorFilter(ColorFilter f){paint.setColorFilter(f);invalidateSelf();}
    @Override public int getOpacity(){return PixelFormat.TRANSLUCENT;}
    private static CharSequence text(Context c,String text,int kind,int color,int dp,boolean multiline){
        int size=(int)(dp*c.getResources().getDisplayMetrics().density+0.5f);
        PreviewPanelIcon icon=new PreviewPanelIcon(size,kind,color);icon.setBounds(0,0,size,size);
        SpannableString label=new SpannableString("\ufffc"+(multiline?"\n":"  ")+text);
        label.setSpan(new ImageSpan(icon,Build.VERSION.SDK_INT>=29?2:ImageSpan.ALIGN_BASELINE),0,1,Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);return label;
    }
    public static CharSequence label(Context c,String text,int kind,int color){return text(c,text,kind,color,19,false);}
    public static CharSequence tile(Context c,String text,int kind,int color){return text(c,text,kind,color,25,true);}
}
