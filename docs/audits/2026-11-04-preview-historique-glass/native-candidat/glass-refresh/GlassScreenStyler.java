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
public final class GlassScreenStyler implements Runnable, android.view.ViewTreeObserver.OnGlobalLayoutListener {
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
        keepScroll(content,"detail".equals(screen)?"detail:"+uri:String.valueOf(screen));
        if("settings".equals(screen))settings(a,content);
        else if("home".equals(screen))home(a,content);
        else if("library".equals(screen))library(a,content);
        else if("search".equals(screen))search(a,content);
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
        final LinearLayout hero=vertical(a); hero.setTag("glass-playlist-hero"); hero.setPadding(dp(a,16),dp(a,16),dp(a,16),dp(a,24));
        // Liner: soft glow of the cover colour behind the header, fading out.
        hero.setBackground(glow(a,0));
        // Liner album header: cover on the left, eyebrow and title beside it.
        // User request (1022388): Spotify playlist layout, big centred cover then the title and one meta line.
        LinearLayout artLine=vertical(a);artLine.setGravity(Gravity.CENTER);
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
                TextView hint=text(a,"PLAYLIST",12,0x99ffffff,true);hint.setLetterSpacing(.16f);hint.setGravity(Gravity.CENTER);
                hint.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);artBox.addView(hint);
            }
        }
        artLine.addView(artBox,new LinearLayout.LayoutParams(dp(a,240),dp(a,240)));hero.addView(artLine);
        LinearLayout side=vertical(a);LinearLayout.LayoutParams sdp=new LinearLayout.LayoutParams(-1,-2);sdp.topMargin=dp(a,20);artLine.addView(side,sdp);
        TextView name=text(a,title==null||title.trim().isEmpty()?(isLiked?"Titres likés":"Playlist"):title,28,0xfffafafa,true);name.setLetterSpacing(-.01f);name.setLineSpacing(0,1.05f);
        name.setMaxLines(3);name.setEllipsize(TextUtils.TruncateAt.END);
        LinearLayout.LayoutParams np=new LinearLayout.LayoutParams(-1,-2);np.topMargin=dp(a,6);side.addView(name,np);
        // Liner hero meta: how many tracks are already shown (grows as the list completes).
        int tracks=0,secs=0,timed=0;java.util.LinkedHashSet<String> artists=new java.util.LinkedHashSet<String>();java.util.LinkedHashMap<String,Integer> seen=new java.util.LinkedHashMap<String,Integer>();
        for(int i=0;i<rows.getChildCount();i++){View c=rows.getChildAt(i);if(c==hero||!c.isClickable())continue;tracks++;
            java.util.List<String> t=new java.util.ArrayList<String>();texts(c,t);
            for(String x:t){java.util.regex.Matcher m=java.util.regex.Pattern.compile("(?:^|• )(?:(\\d+):)?(\\d{1,2}):(\\d{2})$").matcher(x.trim());
                if(m.find()){timed++;secs+=(m.group(1)==null?0:Integer.parseInt(m.group(1))*3600)+Integer.parseInt(m.group(2))*60+Integer.parseInt(m.group(3));}}
            // Second text of a row is the artist line (first is the title).
            if(t.size()>1)for(String n:t.get(1).replaceAll("\\s*•\\s*[\\d:]+$","").split(",")){n=n.trim();if(!n.isEmpty()&&!n.matches(".*\\d:\\d\\d.*"))seen.put(n,seen.containsKey(n)?seen.get(n)+1:1);if(!n.isEmpty()&&!n.matches(".*\\d:\\d\\d.*")&&artists.size()<3)artists.add(n);}}
        // The bridge appends an "Aperçu Spotify" row while the list may be incomplete: say "N+".
        boolean partial=false;for(int i=0;i<rows.getChildCount();i++){java.util.List<String> t=new java.util.ArrayList<String>();texts(rows.getChildAt(i),t);if(t.contains("Aperçu Spotify")){partial=true;if(rows.getChildAt(i).isClickable())tracks--;}}
        if(tracks>0){String info=tracks+(partial?"+":"")+(tracks>1?" titres":" titre");
            if(secs>=60)info+=" · "+(secs>=3600?secs/3600+" h "+(secs%3600)/60+" min":secs/60+" min");
            TextView meta=text(a,info,13,0x99ffffff,false);meta.setTag("glass-playlist-count");
            LinearLayout.LayoutParams mp=new LinearLayout.LayoutParams(-1,-2);mp.topMargin=dp(a,8);side.addView(meta,mp);
        }
        // User request (1022388): no artist list, stats chips or "most present" line (Spotify shows none).
        View line=new View(a);line.setBackgroundColor(0x14ffffff);
        LinearLayout.LayoutParams hp=new LinearLayout.LayoutParams(-1,Math.max(1,dp(a,.5f)));hp.topMargin=dp(a,20);hero.addView(line,hp);
        rows.addView(hero,0,new LinearLayout.LayoutParams(-1,-2));
        // Liner rows: rounded press highlight (row motion stays in GlassLikedMotion).
        int n=0;for(int i=1;i<rows.getChildCount();i++){View c=rows.getChildAt(i);if(!c.isClickable())continue;
            GradientDrawable mask=glass(a,0xffffffff,0xffffffff,10,0);
            c.setForeground(new android.graphics.drawable.RippleDrawable(android.content.res.ColorStateList.valueOf(0x1fffffff),null,mask));
            track(a,c,++n);}
    }
    /** Spotify-like track row: medium title, softer artist, length moved to the right edge. */
    private static void track(Context a,View row){track(a,row,0);}
    private static void track(Context a,View row,int number){
        if(!(row instanceof LinearLayout))return;LinearLayout g=(LinearLayout)row;
        // User request (1022338): track number before the cover, like Spotify.
        View num=g.findViewWithTag("glass-row-number");
        if(number>0&&num instanceof TextView)((TextView)num).setText(String.valueOf(number));
        else if(number>0&&g.getChildCount()>=2&&g.getChildAt(0) instanceof ImageView){TextView t=text(a,String.valueOf(number),14,0x99ffffff,false);t.setTag("glass-row-number");
            t.setGravity(Gravity.CENTER);t.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);g.addView(t,0,new LinearLayout.LayoutParams(dp(a,32),-1));}
        int base=g.findViewWithTag("glass-row-number")!=null?1:0;
        if(g.getChildCount()<base+2||!(g.getChildAt(base) instanceof ImageView)||!(g.getChildAt(base+1) instanceof android.view.ViewGroup))return;
        android.view.ViewGroup labels=(android.view.ViewGroup)g.getChildAt(base+1);
        if(labels.getChildCount()<2||!(labels.getChildAt(0) instanceof TextView)||!(labels.getChildAt(1) instanceof TextView))return;
        TextView title=(TextView)labels.getChildAt(0),sub=(TextView)labels.getChildAt(1);
        title.setTypeface(Typeface.create("sans-serif-medium",Typeface.NORMAL),Typeface.NORMAL);sub.setTextColor(0x99ffffff);
        // Liked mark from the page ("♥ " before the artists): a heart before the length, not in the text.
        String st=String.valueOf(sub.getText());boolean liked=st.startsWith("♥ ");if(liked){st=st.substring(2);sub.setText(st);}
        if(liked&&g.findViewWithTag("glass-row-heart")==null){TextView h=text(a,"♥︎",15,0xe6ffffff,false);h.setTag("glass-row-heart");h.setContentDescription("Titre liké");
            h.setGravity(Gravity.CENTER);h.setPadding(dp(a,8),0,0,0);g.addView(h,g.findViewWithTag("glass-row-duration")==null?g.getChildCount():g.getChildCount()-1,new LinearLayout.LayoutParams(-2,-1));}
        if(g.findViewWithTag("glass-row-duration")!=null)return;
        java.util.regex.Matcher m=java.util.regex.Pattern.compile("^(.*?)\\s*•\\s*(\\d+(?::\\d{2}){1,2})$").matcher(st);
        if(!m.find())return;
        sub.setText(m.group(1));
        TextView d=text(a,m.group(2),13,0x99ffffff,false);d.setTag("glass-row-duration");d.setPadding(dp(a,12),0,dp(a,4),0);
        d.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        d.setGravity(Gravity.CENTER);g.addView(d,new LinearLayout.LayoutParams(-2,-1));
    }
    private static TextView chip(Context c,String s){
        TextView t=text(c,s,12,0xe6ffffff,false);t.setPadding(dp(c,12),dp(c,6),dp(c,12),dp(c,6));t.setBackground(glass(c,0x1affffff,0x0dffffff,14,0x1fffffff));
        LinearLayout.LayoutParams p=new LinearLayout.LayoutParams(-2,-2);p.rightMargin=dp(c,8);t.setLayoutParams(p);return t;
    }
    private static void texts(View v,java.util.List<String> out){
        if(v instanceof TextView){CharSequence c=((TextView)v).getText();if(c!=null&&c.toString().trim().length()>0)out.add(c.toString());}
        else if(v instanceof android.view.ViewGroup){android.view.ViewGroup g=(android.view.ViewGroup)v;for(int i=0;i<g.getChildCount();i++)texts(g.getChildAt(i),out);}
    }
    // One pending cover-colour check (single helper file: no inner classes).
    private final LinearLayout waitHero;private final ImageView waitImage;private final int waitTries;
    private GlassScreenStyler(LinearLayout h,ImageView i,int t){waitHero=h;waitImage=i;waitTries=t;scroller=null;scrollTo=0;}
    @Override public void run(){
        if(scroller!=null){if(scrollTo>=0)scroller.scrollTo(0,scrollTo);return;}
        if(waitImage.isAttachedToWindow()||waitTries<4)tint(waitHero,waitImage,waitTries);}

    // Layout watcher (scrollTo == -1): the screen changed without a restyle, e.g. Home shown again unchanged.
    @Override public void onGlobalLayout(){
        if(scroller==null||scrollTo!=-1)return;String now=null;android.content.Context c=scroller.getContext();
        try{java.lang.reflect.Field f=c.getClass().getDeclaredField("nativeCurrentScreen");f.setAccessible(true);now=(String)f.get(c);}catch(Throwable ignored){}
        if(now!=null&&!now.equals("detail")&&!now.equals(lastScreen))keepScroll(scroller,now);
    }
    // ---- Scroll position per screen (user report 1022315: back from a playlist landed at the bottom of Home) ----
    private final android.widget.ScrollView scroller;private final int scrollTo;
    private GlassScreenStyler(android.widget.ScrollView s,int y){waitHero=null;waitImage=null;waitTries=0;scroller=s;scrollTo=y;}
    private static final java.util.WeakHashMap<View,Boolean> watched=new java.util.WeakHashMap<View,Boolean>();private static String lastScreen;private static final Map<String,Integer> scrolls=new LinkedHashMap<String,Integer>();
    private static void keepScroll(View content,String key){
        View v=content;while(v!=null&&!(v instanceof android.widget.ScrollView))v=v.getParent() instanceof View?(View)v.getParent():null;
        if(v==null||key.equals(lastScreen))return;android.widget.ScrollView sv=(android.widget.ScrollView)v;
        // User report (1022333): back to Home from Settings kept the Settings scroll. Home may come back
        // without being restyled, so also watch the current screen on every layout.
        if(watched.put(sv,Boolean.TRUE)==null)sv.getViewTreeObserver().addOnGlobalLayoutListener(new GlassScreenStyler(sv,-1));
        if(lastScreen!=null){if(scrolls.size()>=32&&!scrolls.containsKey(lastScreen))scrolls.remove(scrolls.keySet().iterator().next());scrolls.put(lastScreen,sv.getScrollY());}
        lastScreen=key;
        // A playlist always opens at its top; Home / Library come back where they were left.
        int y=key.startsWith("detail:")||!scrolls.containsKey(key)?0:scrolls.get(key);
        sv.scrollTo(0,0);if(y>0)sv.post(new GlassScreenStyler(sv,y));
    }

    /** Shared Spotify-like list row (Library, Search). Returns true for a clickable row. */
    private static boolean listRow(Activity a,View c){
        if(c instanceof TextView){heading((TextView)c);((TextView)c).setTextSize(18);return false;}
        if(!c.isClickable())return false;
        GradientDrawable mask=glass(a,0xffffffff,0xffffffff,10,0);
        c.setForeground(new RippleDrawable(ColorStateList.valueOf(0x1fffffff),null,mask));
        ImageView cover=c instanceof ViewGroup&&((ViewGroup)c).getChildCount()>0&&((ViewGroup)c).getChildAt(0) instanceof ImageView?(ImageView)((ViewGroup)c).getChildAt(0):null;
        if(cover!=null){if(cover.getBackground()==null)cover.setBackground(glass(a,0xff2a2a2e,0xff18181b,6,0));cover.setClipToOutline(true);}
        track(a,c);return true;
    }
    /** User report (1022316): the "Pop" chip searched the word, so it listed titles starting with "pop".
     *  Real genres use Spotify's genre filter; moods and other chips keep their plain search. */
    public static String genreQuery(String tag){
        if(tag==null)return "";String t=tag.trim().toLowerCase(Locale.ROOT);
        if(t.equals("pop")||t.equals("rock")||t.equals("latino")||t.equals("hip-hop"))return "genre:\""+(t.equals("latino")?"latin":t)+"\"";
        return tag;
    }
    // ---- Search: results styled like Library rows ----
    private static void search(Activity a,LinearLayout content){
        LinearLayout rows=rowContainer(content);for(int i=0;i<rows.getChildCount();i++)listRow(a,rows.getChildAt(i));
    }
    // ---- Library (Spotify-style): big title, what it holds, list rows with rounded covers ----
    private static void library(Activity a,LinearLayout content){
        LinearLayout rows=rowContainer(content);
        if(rows.findViewWithTag("glass-library-head")!=null)return;
        int items=0;java.util.LinkedHashMap<String,Integer> kinds=new java.util.LinkedHashMap<String,Integer>();
        for(int i=0;i<rows.getChildCount();i++){View c=rows.getChildAt(i);
            if(!listRow(a,c))continue;items++;
            // Kind = first word of the subtitle ("Playlist • Moi", "Album • Artiste").
            java.util.List<String> t=new java.util.ArrayList<String>();texts(c,t);
            if(t.size()>1){String k=t.get(1).split("[•·]")[0].trim();if(k.matches("(?i)playlists?|albums?|artistes?|podcasts?|titres?"))kinds.put(k,kinds.containsKey(k)?kinds.get(k)+1:1);}}
        LinearLayout head=vertical(a);head.setTag("glass-library-head");head.setPadding(dp(a,16),dp(a,8),dp(a,16),dp(a,12));
        head.addView(text(a,"Ta bibliothèque",28,0xfffafafa,true));
        StringBuilder b=new StringBuilder(items+(items>1?" éléments":" élément"));
        for(java.util.Map.Entry<String,Integer> e:kinds.entrySet()){String k=e.getKey().toLowerCase(Locale.FRENCH).replaceAll("s$","");b.append(" · ").append(e.getValue()).append(' ').append(k).append(e.getValue()>1?"s":"");}
        if(items>0){TextView meta=text(a,b.toString(),13,0x99ffffff,false);LinearLayout.LayoutParams mp=new LinearLayout.LayoutParams(-1,-2);mp.topMargin=dp(a,4);head.addView(meta,mp);}
        rows.addView(head,0,new LinearLayout.LayoutParams(-1,-2));
    }

    // ---- Home local copy: shown at launch before Spotify answers (private app file, display data only) ----
    private static final String HOME_FILE="preview_home_cache.json";private static String savedHome;
    private static String homeJson(Activity a){
        try{java.lang.reflect.Field f=a.getClass().getDeclaredField("nativeHomeJson");f.setAccessible(true);Object v=f.get(a);return v instanceof String?(String)v:null;}
        catch(Throwable e){return null;}
    }
    /** Called from home(): keeps the last live Home rows. shortcut: synchronous small write on the UI thread, move to a worker if Home grows past ~100 KB. */
    private static void saveHome(Activity a){
        String json=homeJson(a);if(json==null||json.length()<8||!json.startsWith("[")||json.equals(savedHome))return;
        try{java.io.FileOutputStream o=new java.io.FileOutputStream(new java.io.File(a.getFilesDir(),HOME_FILE));try{o.write(json.getBytes("UTF-8"));}finally{o.close();}savedHome=json;}
        catch(Throwable ignored){}
    }
    public static void restoreHome(Activity a){
        if(a==null||homeJson(a)!=null)return;
        try{java.io.File f=new java.io.File(a.getFilesDir(),HOME_FILE);if(!f.isFile()||f.length()>2000000)return;
            byte[] b=new byte[(int)f.length()];java.io.FileInputStream in=new java.io.FileInputStream(f);try{int n=0;while(n<b.length){int r=in.read(b,n,b.length-n);if(r<0)break;n+=r;}}finally{in.close();}
            String json=new String(b,"UTF-8");new JSONArray(json);savedHome=json;
            a.getClass().getMethod("applyNativeUiData",String.class,String.class).invoke(a,"home",json);}
        catch(Throwable ignored){}
    }
    public static void forgetHome(Activity a){savedHome=null;try{new java.io.File(a.getFilesDir(),HOME_FILE).delete();}catch(Throwable ignored){}}

    // ---- Home (Spotify-style): greeting, quick-access grid of the real library cards ----
    private static final String LIB="Votre bibliothèque",DISCOVER="À découvrir sur Spotify";
    private static void home(Activity a,LinearLayout content){
        saveHome(a);
        LinearLayout feed=content.getChildCount()==1&&content.getChildAt(0) instanceof LinearLayout?(LinearLayout)content.getChildAt(0):content;
        if(feed.findViewWithTag("glass-home-head")!=null)return;
        java.util.List<View> libShelf=new java.util.ArrayList<View>();LinearLayout libCards=null;String group="";
        for(int i=0;i<feed.getChildCount();i++){View c=feed.getChildAt(i);
            if(c instanceof TextView){String t=String.valueOf(((TextView)c).getText());
                if(LIB.equals(t)||DISCOVER.equals(t)){group=t;eyebrow((TextView)c);}else heading((TextView)c);
                if(LIB.equals(group)&&libCards==null)libShelf.add(c);continue;}
            if(LIB.equals(group)&&libCards==null){libCards=cards(c);if(libCards!=null)libShelf.add(c);}}
        LinearLayout head=vertical(a);head.setTag("glass-home-head");head.setPadding(dp(a,16),dp(a,4),dp(a,16),dp(a,8));
        int h=java.util.Calendar.getInstance().get(java.util.Calendar.HOUR_OF_DAY);
        head.addView(text(a,h>=5&&h<12?"Bonjour":h>=12&&h<18?"Bon après-midi":"Bonsoir",26,0xfffafafa,true));
        // The real cards move into the grid: their own click routes stay untouched.
        java.util.List<View> quick=new java.util.ArrayList<View>();
        if(libCards!=null)for(int k=0;k<libCards.getChildCount()&&quick.size()<8;k++)if(libCards.getChildAt(k).isClickable())quick.add(libCards.getChildAt(k));
        if(quick.size()>=2){LinearLayout grid=vertical(a);grid.setTag("glass-home-quick");LinearLayout line=null;
            for(int i=0;i<quick.size();i++){View card=quick.get(i);libCards.removeView(card);
                if(i%2==0){line=new LinearLayout(a);LinearLayout.LayoutParams lp=new LinearLayout.LayoutParams(-1,-2);lp.topMargin=dp(a,8);grid.addView(line,lp);}
                compact(a,card);LinearLayout.LayoutParams tp=new LinearLayout.LayoutParams(0,dp(a,56),1f);if(i%2==0)tp.rightMargin=dp(a,8);line.addView(card,tp);}
            if(quick.size()%2==1)line.addView(new View(a),new LinearLayout.LayoutParams(0,dp(a,56),1f));
            LinearLayout.LayoutParams gp=new LinearLayout.LayoutParams(-1,-2);gp.topMargin=dp(a,16);head.addView(grid,gp);
            if(libCards.getChildCount()==0)for(View v:libShelf)v.setVisibility(View.GONE);}
        feed.addView(head,0,new LinearLayout.LayoutParams(-1,-2));
    }
    /** Shelf = a scroller whose only child is the row of cards. */
    private static LinearLayout cards(View v){
        if(!(v instanceof ViewGroup)||v instanceof LinearLayout)return null;ViewGroup g=(ViewGroup)v;
        return g.getChildCount()==1&&g.getChildAt(0) instanceof LinearLayout?(LinearLayout)g.getChildAt(0):null;
    }
    /** Card -> compact Spotify quick tile: small square cover left, bold name right. */
    private static void compact(Context a,View card){
        if(!(card instanceof LinearLayout))return;LinearLayout t=(LinearLayout)card;
        t.setOrientation(LinearLayout.HORIZONTAL);t.setGravity(Gravity.CENTER_VERTICAL);t.setPadding(0,0,0,0);
        t.setBackground(glass(a,0x1fffffff,0x14ffffff,6,0));t.setClipToOutline(true);
        for(int i=0;i<t.getChildCount();i++){View c=t.getChildAt(i);
            if(i==0)c.setLayoutParams(new LinearLayout.LayoutParams(dp(a,56),dp(a,56)));
            else{LinearLayout.LayoutParams p=new LinearLayout.LayoutParams(0,-2,1f);c.setLayoutParams(p);c.setPadding(dp(a,10),0,dp(a,8),0);
                java.util.List<TextView> tv=new java.util.ArrayList<TextView>();textViews(c,tv);
                for(int k=0;k<tv.size();k++){TextView x=tv.get(k);if(k==0){x.setTextSize(13);x.setMaxLines(2);x.setEllipsize(TextUtils.TruncateAt.END);x.setTypeface(Typeface.create("sans-serif-medium",Typeface.NORMAL),Typeface.BOLD);}else x.setVisibility(View.GONE);}}}
    }
    private static void textViews(View v,java.util.List<TextView> out){
        if(v instanceof TextView){out.add((TextView)v);return;}
        if(v instanceof ViewGroup){ViewGroup g=(ViewGroup)v;for(int i=0;i<g.getChildCount();i++)textViews(g.getChildAt(i),out);}
    }
    // UI UX Pro Max (after 1022340): 8dp rhythm (16/24 insets) and no text under 12sp.
    private static void eyebrow(TextView t){t.setBackground(null);t.setTextSize(12);t.setTextColor(0x8cffffff);t.setLetterSpacing(.14f);t.setText(String.valueOf(t.getText()).toUpperCase(Locale.FRENCH));}
    private static void heading(TextView t){t.setTextSize(22);t.setTextColor(0xfffafafa);t.setTypeface(Typeface.create("sans-serif-medium",Typeface.NORMAL),Typeface.BOLD);}
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
                TextView h=(TextView)child;eyebrow(h);h.setTypeface(Typeface.create("sans-serif-medium",Typeface.NORMAL),Typeface.NORMAL);
                h.setPadding(dp(a,4),dp(a,24),dp(a,4),dp(a,8));
            } else if(child instanceof LinearLayout) styleSettingRow(a,(LinearLayout)child);
        }
        LinearLayout hero=vertical(a);
        hero.setPadding(dp(a,16),dp(a,16),dp(a,16),dp(a,16));
        hero.setBackground(glow(a,0));
        TextView top=text(a,"MELODIX  •  PARAMÈTRES",12,0x8cffffff,false);top.setLetterSpacing(.14f);hero.addView(top);
        TextView title=text(a,"Votre musique,\nà votre façon.",26,0xfffafafa,true);
        LinearLayout.LayoutParams tp=new LinearLayout.LayoutParams(-1,-2);tp.topMargin=dp(a,8);hero.addView(title,tp);
        TextView sub=text(a,"Personnalisez votre expérience.",13,0x99ffffff,false);
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
        TextView title=(TextView)label.getChildAt(0);title.setTextSize(15);title.setTextColor(0xfffafafa);title.setTypeface(Typeface.create("sans-serif-medium",Typeface.NORMAL),Typeface.NORMAL);title.setMaxLines(2);
        for(int i=1;i<label.getChildCount();i++)if(label.getChildAt(i) instanceof TextView){
            TextView sub=(TextView)label.getChildAt(i);sub.setTextSize(12);sub.setTextColor(0x8cffffff);sub.setMaxLines(3);
        }
        row.setPadding(dp(a,16),dp(a,12),dp(a,16),dp(a,12));row.setMinimumHeight(dp(a,72));
        GradientDrawable surface=glass(a,0x0fffffff,0x0affffff,14,0x14ffffff);
        row.setBackground(row.isClickable()?new RippleDrawable(ColorStateList.valueOf(0x1fffffff),surface,null):surface);
        if(!hasImage){
            TextView icon=text(a,glyph(String.valueOf(title.getText())),18,0xfffafafa,true);icon.setGravity(Gravity.CENTER);
            icon.setBackground(glass(a,0x1fffffff,0x14ffffff,20,0));
            icon.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
            LinearLayout.LayoutParams ip=new LinearLayout.LayoutParams(dp(a,40),dp(a,40));ip.rightMargin=dp(a,12);row.addView(icon,0,ip);
        }
        if(badge!=null){
            String value=String.valueOf(badge.getText()); boolean on="ON".equalsIgnoreCase(value);
            boolean unavailable="Indisponible".equalsIgnoreCase(value);
            // Neutral pills: ON is a white pill with dark text (Spotify/Liner), others stay quiet.
            int fill=on?0xfffafafa:unavailable?0x0dffffff:0x1affffff;
            badge.setBackground(glass(a,fill,fill,16,on?0:0x1fffffff));badge.setTextColor(on?0xff0a0a0a:unavailable?0x66ffffff:0xe6ffffff);
            badge.setTextSize(12);badge.setPadding(dp(a,12),dp(a,8),dp(a,12),dp(a,8));
            badge.setMaxWidth(dp(a,112));badge.setMaxLines(2);badge.setEllipsize(TextUtils.TruncateAt.END);
        }
        ViewGroup.LayoutParams params=row.getLayoutParams();
        if(params instanceof ViewGroup.MarginLayoutParams){ViewGroup.MarginLayoutParams m=(ViewGroup.MarginLayoutParams)params;m.bottomMargin=dp(a,8);row.setLayoutParams(m);}
    }
}
