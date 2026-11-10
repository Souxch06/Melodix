package com.melodix.demo;

import android.app.Activity;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.os.Bundle;
import android.view.Gravity;
import android.view.View;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.TextView;
import org.json.JSONObject;
import java.lang.reflect.Method;

/** Test-only isolated offline presentation. Never reads or writes real session state. */
public final class DemoActivity extends Activity {
    private String page="home";
    private boolean playing=true, autoplay=true, canvas=false;
    private final int accent=0xffb99aff, white=0xffffffff, secondary=0xffa1a1b5;
    private int dp(float n){return (int)(n*getResources().getDisplayMetrics().density+.5f);}
    private int id(String n){return getResources().getIdentifier(n,"id",getPackageName());}
    private View v(String n){return findViewById(id(n));}
    private TextView t(String n){return (TextView)v(n);}
    private int drawable(String n){return getResources().getIdentifier(n,"drawable",getPackageName());}
    private void show(String n,boolean visible){View x=v(n);if(x!=null)x.setVisibility(visible?View.VISIBLE:View.GONE);}
    private void text(String n,String value){TextView x=t(n);if(x!=null)x.setText(value);}
    private GradientDrawable shape(int color, int radius){GradientDrawable d=new GradientDrawable();d.setColor(color);d.setCornerRadius(dp(radius));return d;}
    private TextView label(String value,int sp,int color,boolean bold){TextView x=new TextView(this);x.setText(value);x.setTextSize(sp);x.setTextColor(color);if(bold)x.setTypeface(null,Typeface.BOLD);return x;}

    @Override public void onCreate(Bundle state){
        super.onCreate(state);
        getWindow().setStatusBarColor(0xff0b0b14);getWindow().setNavigationBarColor(0xff0b0b14);
        int layout=getResources().getIdentifier("activity_main","layout",getPackageName());
        if(layout==0)throw new IllegalStateException("Missing native shell layout");
        setContentView(layout);
        show("hScrollView",false);show("splashOverlay",false);show("nativeRoot",true);
        text("nativePlayerTitle","Lueurs du soir");text("nativePlayerArtist","Les Ondes Fictives");
        text("nativePlayerLargeTitle","Lueurs du soir");text("nativePlayerLargeArtist","Les Ondes Fictives · Album imaginaire");
        text("nativePlayerPositionText","1:24");text("nativePlayerDurationText","3:42");
        ProgressBar mini=(ProgressBar)v("nativeMiniProgress"),large=(ProgressBar)v("nativePlayerProgress");
        if(mini!=null)mini.setProgress(380);if(large!=null)large.setProgress(380);
        android.widget.ScrollView player=(android.widget.ScrollView)v("nativePlayerPanel");
        if(player!=null){
            LinearLayout body=(LinearLayout)player.getChildAt(0);
            LinearLayout actions=new LinearLayout(this);actions.setGravity(Gravity.CENTER);actions.setPadding(0,dp(18),0,dp(8));
            for(String name:new String[]{"Paroles","File d’attente","Minuterie"}){
                TextView pill=label(name,12,white,true);pill.setGravity(Gravity.CENTER);pill.setPadding(dp(10),dp(8),dp(10),dp(8));pill.setBackgroundResource(drawable("native_glass_pill"));
                LinearLayout.LayoutParams lp=new LinearLayout.LayoutParams(0,-2,1);lp.setMargins(dp(3),0,dp(3),0);actions.addView(pill,lp);
                pill.setOnClickListener(view->android.widget.Toast.makeText(this,"Action fictive en mode démo",android.widget.Toast.LENGTH_SHORT).show());
            }
            body.addView(actions);
        }
        render("home");
    }
    private void tab(String name,boolean selected){TextView x=t(name);if(x==null)return;x.setSelected(selected);x.setTextColor(selected?white:secondary);x.setBackgroundResource(drawable(selected?"native_tab_active":"native_tab_ripple"));}
    private void render(String p){
        page=p; boolean player=p.equals("player");
        show("nativeRowsScroll",!player);show("nativePlayerPanel",player);show("nativeMiniPlayerContainer",!player);
        show("nativeSearchPanel",p.equals("search"));show("nativeGenreScroll",false);show("nativeLibraryCategories",p.equals("library"));
        boolean back=p.equals("playlist")||p.equals("settings")||player;
        show("nativeBackButton",back);
        View avatar=v("nativeHeaderAvatar");if(avatar!=null && avatar.getParent() instanceof View)((View)avatar.getParent()).setVisibility(back?View.GONE:View.VISIBLE);
        show("nativeTabBar",true);
        View settings=v("nativeSettingsButton");if(settings!=null)settings.setSelected(p.equals("settings"));
        tab("nativeHomeTab",p.equals("home"));tab("nativeSearchTab",p.equals("search"));tab("nativeLibraryTab",p.equals("library")||p.equals("playlist"));
        String title=p.equals("home")?"Accueil":p.equals("search")?"Rechercher":p.equals("library")?"Votre bibliothèque":p.equals("playlist")?"Playlist":p.equals("settings")?"Paramètres":"Lecture en cours · démo";
        text("nativeScreenTitle",title);
        LinearLayout content=(LinearLayout)v("nativeContent");content.removeAllViews();
        TextView badge=label("MODE DÉMO · HORS LIGNE",11,white,true);badge.setPadding(dp(12),dp(6),dp(12),dp(6));badge.setBackgroundResource(drawable("native_glass_pill"));
        LinearLayout.LayoutParams badgeParams=new LinearLayout.LayoutParams(-2,-2);badgeParams.setMargins(dp(20),dp(8),0,dp(4));content.addView(badge,badgeParams);
        if(p.equals("home")){section(content,"Bonjour !");cards(content,new String[]{"Escale imaginaire","Horizons violets","Rythmes du matin"},new String[]{"Playlist · 12 titres","Sélection fictive","Mix fictif"});section(content,"À écouter");row(content,"Lueurs du soir","Les Ondes Fictives · 3:42",0xff6a4391,()->render("player"));row(content,"Pluie d’étoiles","L’Atelier des Nuages · 4:08",0xff375f77,()->render("player"));}
        else if(p.equals("search")){section(content,"Découvrir");cards(content,new String[]{"Électronique","Découvertes","Au calme"},new String[]{"Genre fictif","Sélection fictive","Mix fictif"});row(content,"Lueurs du soir","Les Ondes Fictives",0xff6a4391,()->render("player"));}
        else if(p.equals("library")){section(content,"Vos playlists de démonstration");row(content,"Escale imaginaire","Playlist · 12 titres fictifs",0xff713b81,()->render("playlist"));row(content,"Horizons violets","Playlist · 8 titres fictifs",0xff355e89,()->render("playlist"));row(content,"Matin tranquille","Playlist · 10 titres fictifs",0xff5b678a,()->render("playlist"));}
        else if(p.equals("playlist")){section(content,"Escale imaginaire");TextView info=label("Playlist fictive · 12 titres · 43 min",14,secondary,false);info.setPadding(dp(16),0,dp(16),dp(16));content.addView(info);row(content,"Lueurs du soir","Les Ondes Fictives · 3:42",0xff713b81,()->render("player"));row(content,"Pluie d’étoiles","L’Atelier des Nuages · 4:08",0xff355e89,()->render("player"));row(content,"Rêve en couleur","La Station Imaginaire · 3:16",0xff67609c,()->render("player"));}
        else if(p.equals("settings")){section(content,"Préférences fictives");setting(content,"Lecture automatique après un titre","Réglage de démonstration uniquement",autoplay,()->{autoplay=!autoplay;render("settings");});setting(content,"Visuels Canvas","Aucune donnée réelle n’est modifiée",canvas,()->{canvas=!canvas;render("settings");});section(content,"Informations");settingInfo(content,"Version de Melodix","Mode démo local, sans session ni réseau","Démo");}
        if(player){
            for(String n:new String[]{"nativePlayerArtwork","nativePlayerLargeArtwork"}){View art=v(n);if(art instanceof ImageView)((ImageView)art).setImageResource(drawable("native_demo_art"));}
        }
        updatePlay();
    }
    private void section(LinearLayout parent,String title){TextView x=label(title,20,white,true);x.setPadding(dp(16),dp(14),dp(16),dp(14));parent.addView(x);}
    private void cards(LinearLayout parent,String[] titles,String[] details){
        android.widget.HorizontalScrollView scroll=new android.widget.HorizontalScrollView(this);scroll.setHorizontalScrollBarEnabled(false);
        LinearLayout strip=new LinearLayout(this);strip.setPadding(dp(16),0,dp(16),dp(4));scroll.addView(strip);parent.addView(scroll);
        int[] colors={0xff704a9a,0xff335b82,0xff77436e};
        for(int i=0;i<titles.length;i++){final String title=titles[i];LinearLayout c=new LinearLayout(this);c.setOrientation(LinearLayout.VERTICAL);c.setPadding(dp(10),dp(10),dp(10),dp(10));c.setBackgroundResource(drawable("native_glass_surface"));LinearLayout.LayoutParams cp=new LinearLayout.LayoutParams(dp(148),-2);cp.rightMargin=dp(10);strip.addView(c,cp);
            TextView art=label("♪",50,white,true);art.setGravity(Gravity.CENTER);art.setBackgroundResource(drawable("native_demo_art"));c.addView(art,new LinearLayout.LayoutParams(-1,dp(105)));
            TextView a=label(title,14,white,true);a.setPadding(0,dp(8),0,0);c.addView(a);c.addView(label(details[i],12,secondary,false));c.setContentDescription(title);c.setOnClickListener(v->render("playlist"));}
    }
    private void row(LinearLayout parent,String title,String subtitle,int color,Runnable action){
        LinearLayout row=new LinearLayout(this);row.setGravity(Gravity.CENTER_VERTICAL);row.setPadding(dp(12),dp(9),dp(12),dp(9));row.setBackgroundResource(drawable("native_glass_surface"));
        LinearLayout.LayoutParams rp=new LinearLayout.LayoutParams(-1,-2);rp.setMargins(dp(16),0,dp(16),dp(8));parent.addView(row,rp);
        TextView art=label("♪",23,white,true);art.setGravity(Gravity.CENTER);art.setBackgroundResource(drawable("native_demo_art"));row.addView(art,new LinearLayout.LayoutParams(dp(52),dp(52)));
        LinearLayout copy=new LinearLayout(this);copy.setOrientation(LinearLayout.VERTICAL);copy.setPadding(dp(12),0,0,0);row.addView(copy,new LinearLayout.LayoutParams(0,-2,1));copy.addView(label(title,15,white,true));copy.addView(label(subtitle,12,secondary,false));
        row.setContentDescription(title);row.setOnClickListener(v->action.run());
    }
    private View settingRow(String title,String subtitle,String value){
        try{JSONObject j=new JSONObject();j.put("title",title);j.put("subtitle",subtitle);j.put("settingValue",value);j.put("uri","");j.put("image","");
            Class<?> c=getClassLoader().loadClass("com.melodix.music.DemoSettingsRowFactory");Method m=c.getMethod("create",Activity.class,JSONObject.class);return (View)m.invoke(null,this,j);
        }catch(Exception e){throw new IllegalStateException("Demo settings renderer unavailable",e);}
    }
    private void setting(LinearLayout p,String title,String subtitle,boolean enabled,Runnable action){View r=settingRow(title,subtitle,enabled?"ON":"OFF");r.setOnClickListener(v->action.run());p.addView(r);}
    private void settingInfo(LinearLayout p,String title,String subtitle,String value){View r=settingRow(title,subtitle,value);r.setOnLongClickListener(v->{finish();return true;});p.addView(r);}
    private void updatePlay(){int image=drawable(playing?"pause":"play");for(String n:new String[]{"nativePlayPauseButton","nativePlayerLargePlayPauseButton"}){View x=v(n);if(x instanceof ImageView && image!=0)((ImageView)x).setImageResource(image);}}
    public void onNativeHomeClick(View v){render("home");} public void onNativeSearchClick(View v){render("search");}
    public void onNativeLibraryClick(View v){render("library");} public void onNativeSettingsClick(View v){render("settings");}
    public void onNativePlayerExpandClick(View v){render("player");} public void onNativeBackClick(View v){render("home");}
    public void onNativePlayPauseClick(View v){playing=!playing;updatePlay();} public void onNativePlayerNextClick(View v){render("player");}
    public void onNativePlayerPreviousClick(View v){render("player");} public void onNativePlayerShuffleClick(View v){} public void onNativePlayerRepeatClick(View v){}
    public void onNativeLibraryCategoryClick(View v){render("library");} public void onNativeGenreClick(View v){render("search");}
    public void onNativeSearchSubmit(View v){EditText input=(EditText)v("nativeSearchInput");String q=input==null?"":input.getText().toString().trim();LinearLayout c=(LinearLayout)v("nativeContent");c.removeAllViews();section(c,"Démo · hors ligne");section(c,"Résultats fictifs");if(q.isEmpty()||"lueurs du soir les ondes fictives".contains(q.toLowerCase(java.util.Locale.ROOT)))row(c,"Lueurs du soir","Les Ondes Fictives",0xff6a4391,()->render("player"));else row(c,"Aucun résultat fictif","Essaie « Lueurs »",0xff4a4155,()->{});}
    public void onNativeDiagCopyClick(View v){ClipboardManager c=(ClipboardManager)getSystemService(CLIPBOARD_SERVICE);c.setPrimaryClip(ClipData.newPlainText("Démo","Mode démo local — aucune donnée de session"));}
    @Override public void onBackPressed(){if(page.equals("home"))finish();else render("home");}
}
