package com.melodix.music;

import android.app.Activity;
import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.text.TextUtils;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import org.json.JSONArray;
import org.json.JSONObject;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.Locale;

/** Presentation only. Never starts playback or fabricates Spotify metadata. */
public final class GlassScreenStyler implements Runnable {
    private static final int WHITE=0xfff8f5ff, MUTED=0xffbdb4ca, LILAC=0xffcdb6ff;
    private static final WeakHashMap<Activity, Map<String,String>> artwork = new WeakHashMap<Activity, Map<String,String>>();
    private static int dp(Context c,float n) { return Math.round(n*c.getResources().getDisplayMetrics().density); }
    private static GradientDrawable glass(Context c, int start,int end,int radius,int stroke) {
        GradientDrawable d=new GradientDrawable(GradientDrawable.Orientation.TL_BR,new int[]{start,end});
        d.setCornerRadius(dp(c,radius)); if(stroke!=0)d.setStroke(dp(c,1),stroke); return d;
    }
    private static TextView text(Context c,String s,int sp,int color,boolean bold) {
        TextView t=new TextView(c);t.setText(s);t.setTextSize(sp);t.setTextColor(color);
        if(bold)t.setTypeface(Typeface.DEFAULT,Typeface.BOLD);return t;
    }
    private static LinearLayout vertical(Context c) { LinearLayout v=new LinearLayout(c);v.setOrientation(LinearLayout.VERTICAL);return v; }
    static boolean playlist(String uri) {
        return uri!=null && (uri.contains(":playlist:") || uri.contains("/playlist/"));
    }
    static boolean liked(String uri) {
        return uri != null && (uri.equalsIgnoreCase("spotify:collection:tracks") ||
            uri.matches("(?i)^https://open\\.spotify\\.com/(?:intl-[a-z]{2}(?:-[a-z]{2})?/)?collection/tracks/?(?:\\?[^#]*)?(?:#.*)?$"));
    }
    // Exact identity match only; never substitute artwork from a track or a
    // different playlist. A missing cover is a clearly decorative placeholder.
    public static void rememberSelection(Activity a,String uri,String rows) {
        if(a==null || !playlist(uri)) return;
        String cover="";
        try {
            JSONArray arr=new JSONArray(rows==null?"[]":rows);
            for(int i=0;i<arr.length();i++) {
                JSONObject row=arr.optJSONObject(i);if(row==null)continue;
                String id=row.optString("uri",row.optString("id",""));
                if(uri.equals(id)) { cover=row.optString("image",row.optString("cover",row.optString("artwork",""))); break; }
            }
        } catch(Exception ignored) { }
        Map<String,String> m=artwork.get(a);
        if(m==null){m=new LinkedHashMap<String,String>();artwork.put(a,m);}
        if(m.size()>=32 && !m.containsKey(uri))m.remove(m.keySet().iterator().next());
        m.put(uri,cover);
    }
    private static String selectedArtwork(Activity a,String uri){Map<String,String> m=artwork.get(a);return m==null?"":m.containsKey(uri)?m.get(uri):"";}
    public static void style(Activity a,LinearLayout content,String screen,String uri,String title) {
        if(a==null||content==null)return;
        if("settings".equals(screen))settings(a,content);
        else if("detail".equals(screen)&&playlist(uri))playlist(a,content,uri,title);
        else if("detail".equals(screen)&&liked(uri))playlist(a,content,uri,title);
        GlassLikedMotion.bind(a,content,screen,uri);
    }
    private static LinearLayout rowContainer(LinearLayout content) {
        if(content.getChildCount()==1 && content.getChildAt(0) instanceof LinearLayout)
            return (LinearLayout)content.getChildAt(0);
        // The existing empty/loading message must remain visible and intact.
        LinearLayout group=vertical(content.getContext());
        while(content.getChildCount()>0){View child=content.getChildAt(0);content.removeViewAt(0);group.addView(child);}
        content.addView(group,new LinearLayout.LayoutParams(-1,-2));return group;
    }
    private static void playlist(Activity a,LinearLayout content,String uri,String title) {
        LinearLayout rows=rowContainer(content);
        View old=rows.findViewWithTag("glass-old-playlist-heading");
        if(old!=null && old.getParent()==rows)rows.removeView(old);
        boolean isLiked=liked(uri);
        final LinearLayout hero=vertical(a); hero.setTag("glass-playlist-hero"); hero.setPadding(dp(a,14),dp(a,16),dp(a,14),dp(a,18));
        // Liner: soft glow of the cover colour behind the header, fading out.
        hero.setBackground(glow(a,0));
        // Liner album header: cover on the left, eyebrow and title beside it.
        LinearLayout artLine=new LinearLayout(a);artLine.setGravity(Gravity.CENTER);
        final ImageView image=new ImageView(a);image.setScaleType(ImageView.ScaleType.CENTER_CROP);
        image.setBackground(glass(a,0x1fffffff,0x0fffffff,10,0));
        image.setClipToOutline(true); image.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        String imageUrl=selectedArtwork(a,uri);
        LinearLayout artBox=vertical(a);artBox.setGravity(Gravity.CENTER);
        artBox.setBackground(isLiked ? glass(a,0xff2a2a2e,0xff111113,10,0x1fffffff) : glass(a,0x1fffffff,0x0fffffff,10,0x1fffffff));artBox.setClipToOutline(true);artBox.setElevation(dp(a,10));
        if(imageUrl!=null && !imageUrl.isEmpty()) {
            artBox.addView(image,new LinearLayout.LayoutParams(-1,-1));
            NativeImageLoader.load(image,imageUrl,dp(a,240));tint(hero,image,0);
        } else {
            // Force text presentation: the heart must not turn into a coloured
            // system emoji. The cover is decorative, not track artwork.
            TextView glyph=text(a,isLiked?"♥︎":"♫",isLiked?72:58,0xfff8f5ff,!isLiked);glyph.setGravity(Gravity.CENTER);
            glyph.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);artBox.addView(glyph);
            if(!isLiked) {
                TextView hint=text(a,"PLAYLIST",10,0x99ffffff,true);hint.setLetterSpacing(.16f);hint.setGravity(Gravity.CENTER);
                hint.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);artBox.addView(hint);
            }
        }
        artLine.addView(artBox,new LinearLayout.LayoutParams(dp(a,140),dp(a,140)));hero.addView(artLine);
        LinearLayout side=vertical(a);side.setPadding(dp(a,16),0,0,0);artLine.addView(side,new LinearLayout.LayoutParams(-1,-2));
        TextView eyebrow=text(a,isLiked?"VOTRE BIBLIOTHÈQUE":"PLAYLIST",11,0x99ffffff,false);eyebrow.setTypeface(Typeface.create("sans-serif-medium",Typeface.NORMAL),Typeface.NORMAL);eyebrow.setLetterSpacing(.12f);
        side.addView(eyebrow,new LinearLayout.LayoutParams(-1,-2));
        TextView name=text(a,title==null||title.trim().isEmpty()?(isLiked?"Titres likés":"Playlist"):title,26,0xfffafafa,false);
        name.setTypeface(Typeface.create("sans-serif-medium",Typeface.NORMAL),Typeface.NORMAL);name.setLetterSpacing(-.01f);name.setLineSpacing(0,1.05f);
        name.setMaxLines(3);name.setEllipsize(TextUtils.TruncateAt.END);
        LinearLayout.LayoutParams np=new LinearLayout.LayoutParams(-1,-2);np.topMargin=dp(a,6);side.addView(name,np);
        // Liner hero meta: how many tracks are already shown (grows as the list completes).
        int tracks=0;for(int i=0;i<rows.getChildCount();i++){View c=rows.getChildAt(i);if(c!=hero&&c.isClickable())tracks++;}
        if(tracks>0){TextView meta=text(a,tracks+(tracks>1?" titres":" titre"),13,0x99ffffff,false);meta.setTag("glass-playlist-count");
            LinearLayout.LayoutParams mp=new LinearLayout.LayoutParams(-1,-2);mp.topMargin=dp(a,8);side.addView(meta,mp);}
        // Liner: no section title, a hairline separates the header from the tracks.
        View line=new View(a);line.setBackgroundColor(0x14ffffff);
        LinearLayout.LayoutParams hp=new LinearLayout.LayoutParams(-1,Math.max(1,dp(a,.5f)));hp.topMargin=dp(a,20);hero.addView(line,hp);
        rows.addView(hero,0,new LinearLayout.LayoutParams(-1,-2));
        // Liner rows: rounded press highlight (row motion stays in GlassLikedMotion).
        for(int i=1;i<rows.getChildCount();i++){View c=rows.getChildAt(i);if(!c.isClickable())continue;
            GradientDrawable mask=glass(a,0xffffffff,0xffffffff,10,0);
            c.setForeground(new android.graphics.drawable.RippleDrawable(android.content.res.ColorStateList.valueOf(0x1fffffff),null,mask));}
    }
    // One pending cover-colour check (single helper file: no inner classes).
    private final LinearLayout waitHero;private final ImageView waitImage;private final int waitTries;
    private GlassScreenStyler(LinearLayout h,ImageView i,int t){waitHero=h;waitImage=i;waitTries=t;}
    @Override public void run(){if(waitImage.isAttachedToWindow()||waitTries<4)tint(waitHero,waitImage,waitTries);}
    private static GradientDrawable glow(Context c,int color) {
        int base=color==0?0xffffff:color&0xffffff;
        GradientDrawable g=new GradientDrawable(GradientDrawable.Orientation.TOP_BOTTOM,new int[]{(color==0?0x12:0x66)<<24|base,(color==0?0x05:0x1f)<<24|base,0});
        g.setCornerRadius(dp(c,20));return g;
    }
    /** Waits (bounded) for the cover already being loaded, then tints the header glow with its average colour. */
    private static void tint(final LinearLayout hero,final ImageView image,final int tries) {
        if(tries>30)return;
        android.graphics.drawable.Drawable d=image.getDrawable();
        if(!(d instanceof android.graphics.drawable.BitmapDrawable)||((android.graphics.drawable.BitmapDrawable)d).getBitmap()==null){
            image.postDelayed(new GlassScreenStyler(hero,image,tries+1),150);return;
        }
        android.graphics.Bitmap b=((android.graphics.drawable.BitmapDrawable)d).getBitmap();
        try{
            android.graphics.Bitmap s=android.graphics.Bitmap.createScaledBitmap(b,8,8,true);long r=0,g=0,bl=0,n=0;
            for(int y=0;y<8;y++)for(int x=0;x<8;x++){int c=s.getPixel(x,y);int w=1+(Math.max(Color.red(c),Math.max(Color.green(c),Color.blue(c)))-Math.min(Color.red(c),Math.min(Color.green(c),Color.blue(c))))/24;r+=Color.red(c)*w;g+=Color.green(c)*w;bl+=Color.blue(c)*w;n+=w;}
            float[] h=new float[3];Color.colorToHSV(Color.rgb((int)(r/n),(int)(g/n),(int)(bl/n)),h);h[1]=Math.min(1f,h[1]*1.3f);h[2]=Math.min(.8f,Math.max(.35f,h[2]));
            hero.setBackground(glow(hero.getContext(),Color.HSVToColor(h)));
        }catch(RuntimeException ignored){}
    }
    private static String glyph(String label) {
        String s=label.toLowerCase(Locale.ROOT);
        if(s.contains("compte")||s.contains("profil"))return "◉";
        if(s.contains("qualité")||s.contains("volume")||s.contains("audio"))return "♫";
        if(s.contains("lecture")||s.contains("shuffle")||s.contains("aléatoire")||s.contains("répét"))return "▶";
        if(s.contains("cache")||s.contains("stockage")||s.contains("bibliothèque"))return "▦";
        if(s.contains("déconnexion"))return "↗";
        if(s.contains("melodix"))return "M";
        return "✦";
    }
    private static void settings(Activity a,LinearLayout content) {
        LinearLayout rows=rowContainer(content);
        for(int i=0;i<rows.getChildCount();i++) {
            View child=rows.getChildAt(i);
            if(child instanceof TextView){
                TextView h=(TextView)child;h.setTextSize(14);h.setTextColor(LILAC);h.setTypeface(Typeface.DEFAULT,Typeface.BOLD);
                h.setPadding(dp(a,4),dp(a,22),dp(a,4),dp(a,10));
            } else if(child instanceof LinearLayout) styleSettingRow(a,(LinearLayout)child);
        }
        LinearLayout hero=vertical(a);
        hero.setPadding(dp(a,18),dp(a,18),dp(a,18),dp(a,18));
        hero.setBackground(glass(a,0xe85b3680,0xd6211a30,22,0x50ffffff));
        TextView top=text(a,"MELODIX  •  VOTRE ESPACE",10,0xffe5d5ff,true);top.setLetterSpacing(.12f);hero.addView(top);
        TextView title=text(a,"Votre musique,\nà votre façon.",22,WHITE,true);
        LinearLayout.LayoutParams tp=new LinearLayout.LayoutParams(-1,-2);tp.topMargin=dp(a,7);hero.addView(title,tp);
        TextView sub=text(a,"Personnalisez votre expérience.",12,0xffd9cce5,false);
        LinearLayout.LayoutParams sp=new LinearLayout.LayoutParams(-1,-2);sp.topMargin=dp(a,6);hero.addView(sub,sp);
        LinearLayout.LayoutParams hp=new LinearLayout.LayoutParams(-1,-2);hp.bottomMargin=dp(a,6);
        rows.addView(hero,0,hp);
    }
    private static void styleSettingRow(Activity a,LinearLayout row) {
        LinearLayout label=null;TextView badge=null;boolean hasImage=false;
        for(int i=0;i<row.getChildCount();i++) {
            View v=row.getChildAt(i);
            if(v instanceof ImageView)hasImage=true;
            else if(v instanceof LinearLayout)label=(LinearLayout)v;
            else if(v instanceof TextView)badge=(TextView)v;
        }
        if(label==null || label.getChildCount()==0 || !(label.getChildAt(0) instanceof TextView))return;
        TextView title=(TextView)label.getChildAt(0);title.setTextSize(15);title.setTextColor(WHITE);title.setMaxLines(2);
        for(int i=1;i<label.getChildCount();i++)if(label.getChildAt(i) instanceof TextView){
            TextView sub=(TextView)label.getChildAt(i);sub.setTextSize(12);sub.setTextColor(MUTED);sub.setMaxLines(3);
        }
        row.setPadding(dp(a,12),dp(a,13),dp(a,12),dp(a,13));row.setMinimumHeight(dp(a,72));
        GradientDrawable surface=glass(a,0xc8382c49,0xd51b1726,20,0x30ffffff);
        row.setBackground(row.isClickable()?new RippleDrawable(ColorStateList.valueOf(0x55c9a8ff),surface,null):surface);
        if(!hasImage){
            TextView icon=text(a,glyph(String.valueOf(title.getText())),19,0xffe3d2ff,true);icon.setGravity(Gravity.CENTER);
            icon.setBackground(glass(a,0xaa8057aa,0x88634382,12,0x30ffffff));
            icon.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
            LinearLayout.LayoutParams ip=new LinearLayout.LayoutParams(dp(a,40),dp(a,40));ip.rightMargin=dp(a,12);row.addView(icon,0,ip);
        }
        if(badge!=null){
            String value=String.valueOf(badge.getText()); boolean on="ON".equalsIgnoreCase(value);
            boolean unavailable="Indisponible".equalsIgnoreCase(value);
            int left=on?0xffa86df2:unavailable?0x664a4253:0x886d5d7c;
            int right=on?0xffd751a5:unavailable?0x66403a49:0x88604f72;
            badge.setBackground(glass(a,left,right,16,0x22ffffff));badge.setTextColor(unavailable?0xffc0b9c8:WHITE);
            badge.setTextSize(11);badge.setPadding(dp(a,10),dp(a,7),dp(a,10),dp(a,7));
            badge.setMaxWidth(dp(a,112));badge.setMaxLines(2);badge.setEllipsize(TextUtils.TruncateAt.END);
        }
        ViewGroup.LayoutParams params=row.getLayoutParams();
        if(params instanceof ViewGroup.MarginLayoutParams){ViewGroup.MarginLayoutParams m=(ViewGroup.MarginLayoutParams)params;m.bottomMargin=dp(a,8);row.setLayoutParams(m);}
    }
}
