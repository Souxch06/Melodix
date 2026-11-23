.class final Lcom/melodix/music/PreviewPlayerControllerPlayAll;
.super Ljava/lang/Object;
.source "PreviewPlayerControllerPlayAll.java"


# static fields
.field static final FOLLOW_JOB:Ljava/lang/String; = "(function(act){try{var bs=document.querySelectorAll(\'main button,[data-testid=\"action-bar-row\"] button\');var b=null;for(var i=0;i<bs.length;i++){var t=(bs[i].textContent||\'\').trim();if(/^(Suivre|Abonn\u00e9\u00b7?e?|Abonn\u00e9|Follow|Following|S\'abonner|Se d\u00e9sabonner)$/i.test(t)){b=bs[i];break}}if(!b)return \'absent\';var on=/^(Abonn|Following|Se d\u00e9sabonner)/i.test((b.textContent||\'\').trim());if(act===\'tap\'){b.click();return on?\'off\':\'on\'}return on?\'on\':\'off\'}catch(e){return \'error\'}})"

.field static final LINK_JOB:Ljava/lang/String; = "(function(id,kind){try{var a=document.querySelector(\'a[href*=\"/track/\'+id+\'\"]\');var row=a&&(a.closest(\'[data-testid=\"tracklist-row\"]\')||a.closest(\'[role=\"row\"]\'));var l=row&&row.querySelector(\'a[href*=\"/\'+kind+\'/\"]\');var m=l&&(l.getAttribute(\'href\')||\'\').match(/\\/(album|artist)\\/([A-Za-z0-9]+)/);return m?\'spotify:\'+m[1]+\':\'+m[2]+\'\\t\'+(l.textContent||\'\').trim():\'\'}catch(e){return \'\'}})"

.field static final MENU_JOB:Ljava/lang/String; = "(function(id,labels){try{var a=document.querySelector(\'a[href*=\"/track/\'+id+\'\"]\');var row=a&&(a.closest(\'[data-testid=\"tracklist-row\"]\')||a.closest(\'[role=\"row\"]\'));if(!row)return \'absent\';var r=row.getBoundingClientRect();row.dispatchEvent(new MouseEvent(\'contextmenu\',{bubbles:true,cancelable:true,clientX:r.left+20,clientY:r.top+10,button:2}));window.__sfMenuJob=\'open\';setTimeout(function(){var want=labels.split(\'|\');var items=document.querySelectorAll(\'[role=\"menu\"] button,[role=\"menu\"] [role=\"menuitem\"],#context-menu button\');for(var i=0;i<items.length;i++){var t=(items[i].textContent||\'\').trim();for(var j=0;j<want.length;j++)if(t===want[j]||t.indexOf(want[j])===0){items[i].click();window.__sfMenuJob=\'done\';return}}window.__sfMenuJob=\'missing\';document.dispatchEvent(new KeyboardEvent(\'keydown\',{key:\'Escape\',bubbles:true}))},350);return \'started\'}catch(e){return \'error\'}})"

.field static final PL_LIST:Ljava/lang/String; = "(function(id){try{var a=document.querySelector(\'a[href*=\"/track/\'+id+\'\"]\');var row=a&&(a.closest(\'[data-testid=\"tracklist-row\"]\')||a.closest(\'[role=\"row\"]\'));if(!row)return \'absent\';var r=row.getBoundingClientRect();window.__sfPlNames=null;row.dispatchEvent(new MouseEvent(\'contextmenu\',{bubbles:true,cancelable:true,clientX:r.left+20,clientY:r.top+10,button:2}));setTimeout(function(){var items=document.querySelectorAll(\'[role=\"menu\"] button,[role=\"menu\"] [role=\"menuitem\"]\');var hit=null;for(var i=0;i<items.length;i++){var t=(items[i].textContent||\'\').trim();if(/^(Ajouter (\u00e0|a) (la|une) playlist|Add to playlist)/i.test(t)){hit=items[i];break}}if(!hit){window.__sfPlNames=[];return}hit.dispatchEvent(new MouseEvent(\'mouseover\',{bubbles:true}));hit.click();setTimeout(function(){var menus=document.querySelectorAll(\'[role=\"menu\"]\');var m=menus[menus.length-1];var out=[];if(m&&menus.length>1){var b=m.querySelectorAll(\'button,[role=\"menuitem\"]\');for(var j=0;j<b.length&&out.length<80;j++){var n=(b[j].textContent||\'\').trim();if(n&&n.length<120&&out.indexOf(n)<0)out.push(n)}}window.__sfPlNames=out},450)},350);return \'started\'}catch(e){return \'error\'}})"

.field static final PL_PICK:Ljava/lang/String; = "(function(name){var menus=document.querySelectorAll(\'[role=\"menu\"]\');var m=menus[menus.length-1];var b=m?m.querySelectorAll(\'button,[role=\"menuitem\"]\'):[];window.__sfMenuJob=\'missing\';for(var j=0;j<b.length;j++)if((b[j].textContent||\'\').trim()===name){b[j].click();window.__sfMenuJob=\'done\';break}setTimeout(function(){document.dispatchEvent(new KeyboardEvent(\'keydown\',{key:\'Escape\',bubbles:true}))},300);return window.__sfMenuJob})"

.field static final TAG:Ljava/lang/String; = "melodixPlayAll"

.field static final closer:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/app/Dialog;",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private static lastAdd:J

.field static loadingUntil:J


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 16
    const-wide/32 v0, -0x186a0

    sput-wide v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->lastAdd:J

    .line 285
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->closer:Ljava/util/WeakHashMap;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static add(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 11

    .line 18
    const v0, 0x7f09022f

    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 19
    if-nez v0, :cond_0

    return-void

    .line 20
    :cond_0
    :try_start_0
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1, p1}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    invoke-static {p0, v0, v1}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->addMenus(Landroid/app/Activity;Landroid/view/View;Lorg/json/JSONArray;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 21
    :goto_0
    const-string p1, "melodixPlayAll"

    invoke-virtual {v0, p1}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_1

    return-void

    .line 23
    :cond_1
    const-string v1, "glass-playlist-hero"

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v1

    .line 24
    instance-of v2, v1, Landroid/view/ViewGroup;

    if-nez v2, :cond_2

    return-void

    .line 25
    :cond_2
    check-cast v1, Landroid/view/ViewGroup;

    .line 26
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->density:F

    .line 28
    const-string v3, "melodix_playall"

    const/4 v4, 0x0

    invoke-virtual {p0, v3, v4}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    const-string v5, "shuffle"

    sget-boolean v6, Lcom/melodix/music/PreviewPlayerMode;->shuffleMode:Z

    invoke-interface {v3, v5, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    sput-boolean v3, Lcom/melodix/music/PreviewPlayerMode;->shuffleMode:Z

    .line 31
    new-instance v3, Landroid/widget/LinearLayout;

    invoke-direct {v3, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 32
    invoke-virtual {v3, p1}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 34
    const p1, 0x800015

    invoke-virtual {v3, p1}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 35
    new-instance p1, Landroid/view/ViewGroup$MarginLayoutParams;

    const/4 v5, -0x1

    const/4 v6, -0x2

    invoke-direct {p1, v5, v6}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(II)V

    .line 36
    const/high16 v5, 0x41600000    # 14.0f

    mul-float/2addr v5, v2

    float-to-int v5, v5

    iput v5, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    invoke-virtual {v3, p1}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 37
    const/4 p1, 0x1

    invoke-static {p0, p1}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->icon(Landroid/app/Activity;Z)Landroid/view/View;

    move-result-object v5

    const-string v7, "Lire la playlist"

    invoke-virtual {v5, v7}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 38
    new-instance v7, Lcom/melodix/music/PreviewPlayerControllerPlayAll$1;

    invoke-direct {v7, p0, v0}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$1;-><init>(Landroid/app/Activity;Landroid/view/View;)V

    invoke-virtual {v5, v7}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 47
    invoke-static {p0, v4}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->icon(Landroid/app/Activity;Z)Landroid/view/View;

    move-result-object v0

    const-string v7, "Lecture al\u00e9atoire"

    invoke-virtual {v0, v7}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 50
    new-instance v7, Lcom/melodix/music/PreviewPlayerControllerPlayAll$2;

    invoke-direct {v7, p0}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$2;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v0, v7}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 55
    new-instance p0, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v7, 0x42400000    # 48.0f

    mul-float/2addr v7, v2

    float-to-int v7, v7

    invoke-direct {p0, v7, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v7, 0x41800000    # 16.0f

    mul-float/2addr v7, v2

    float-to-int v7, v7

    iput v7, p0, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 56
    invoke-virtual {v3, v0, p0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance p0, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v0, 0x42700000    # 60.0f

    mul-float/2addr v0, v2

    float-to-int v0, v0

    invoke-direct {p0, v0, v0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v3, v5, p0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 58
    const-string p0, "glass-playlist-count"

    invoke-virtual {v1, p0}, Landroid/view/ViewGroup;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object p0

    .line 59
    const/high16 v0, 0x3f800000    # 1.0f

    if-eqz p0, :cond_3

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v5

    instance-of v5, v5, Landroid/view/ViewGroup;

    if-eqz v5, :cond_3

    .line 60
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    check-cast p1, Landroid/view/ViewGroup;

    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result v1

    .line 61
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    const/16 v5, 0x10

    invoke-virtual {v3, v5}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 62
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v5, v4, v6, v0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v3, p0, v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 63
    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p0

    check-cast p0, Landroid/view/ViewGroup$MarginLayoutParams;

    const/high16 v0, 0x40c00000    # 6.0f

    mul-float/2addr v2, v0

    float-to-int v0, v2

    iput v0, p0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 64
    invoke-virtual {p1, v3, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    .line 65
    return-void

    .line 67
    :cond_3
    nop

    .line 69
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v5

    sget-wide v7, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->lastAdd:J

    sub-long v7, v5, v7

    const-wide/16 v9, 0xbb8

    cmp-long p0, v7, v9

    if-lez p0, :cond_4

    move v4, p1

    :cond_4
    sput-wide v5, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->lastAdd:J

    .line 70
    const/4 p0, 0x0

    if-eqz v4, :cond_5

    invoke-virtual {v3, p0}, Landroid/widget/LinearLayout;->setAlpha(F)V

    const/high16 p1, 0x41000000    # 8.0f

    mul-float/2addr v2, p1

    invoke-virtual {v3, v2}, Landroid/widget/LinearLayout;->setTranslationY(F)V

    .line 71
    :cond_5
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 72
    if-eqz v4, :cond_6

    invoke-virtual {v3}, Landroid/widget/LinearLayout;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    const-wide/16 v0, 0x104

    invoke-virtual {p0, v0, v1}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 73
    :cond_6
    return-void
.end method

.method static addFollow(Landroid/app/Activity;)V
    .locals 9

    .line 370
    const v0, 0x7f09022f

    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_6

    const-string v1, "melodixFollow"

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v2

    if-eqz v2, :cond_0

    goto/16 :goto_3

    .line 372
    :cond_0
    const-string v2, "glass-playlist-hero"

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v2

    .line 373
    instance-of v3, v2, Landroid/view/ViewGroup;

    const/4 v4, 0x0

    if-nez v3, :cond_2

    instance-of v2, v0, Landroid/view/ViewGroup;

    if-eqz v2, :cond_1

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    if-lez v2, :cond_1

    invoke-virtual {v0, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    instance-of v2, v2, Landroid/widget/LinearLayout;

    if-eqz v2, :cond_1

    invoke-virtual {v0, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    move-object v2, v0

    move v0, v4

    goto :goto_1

    :cond_2
    const/4 v0, -0x1

    .line 374
    :goto_1
    instance-of v3, v2, Landroid/view/ViewGroup;

    if-nez v3, :cond_3

    return-void

    .line 375
    :cond_3
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    iget v3, v3, Landroid/util/DisplayMetrics;->density:F

    .line 376
    const/16 v5, 0xe

    const v6, -0xa0a09

    const-string v7, "Suivre"

    const/4 v8, 0x1

    invoke-static {p0, v7, v5, v6, v8}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->text(Landroid/app/Activity;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v5

    invoke-virtual {v5, v1}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    const/16 v1, 0x11

    invoke-virtual {v5, v1}, Landroid/widget/TextView;->setGravity(I)V

    .line 377
    const/high16 v1, 0x41900000    # 18.0f

    mul-float/2addr v1, v3

    float-to-int v1, v1

    const/high16 v6, 0x41000000    # 8.0f

    mul-float/2addr v6, v3

    float-to-int v6, v6

    invoke-virtual {v5, v1, v6, v1, v6}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 378
    new-instance v1, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v1}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const/high16 v7, 0x41a00000    # 20.0f

    mul-float/2addr v7, v3

    invoke-virtual {v1, v7}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    float-to-int v7, v3

    invoke-static {v8, v7}, Ljava/lang/Math;->max(II)I

    move-result v7

    const v8, -0x66000001

    invoke-virtual {v1, v7, v8}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    invoke-virtual {v5, v1}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 379
    new-instance v1, Landroid/view/ViewGroup$MarginLayoutParams;

    const/4 v7, -0x2

    invoke-direct {v1, v7, v7}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(II)V

    const/high16 v7, 0x41400000    # 12.0f

    mul-float/2addr v7, v3

    float-to-int v7, v7

    iput v7, v1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 380
    const/high16 v7, 0x41800000    # 16.0f

    mul-float/2addr v3, v7

    float-to-int v3, v3

    iput v3, v1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    iput v6, v1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 381
    instance-of v3, v2, Landroid/widget/LinearLayout;

    if-eqz v3, :cond_4

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    iget v6, v1, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    iget v7, v1, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    invoke-direct {v3, v6, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    iget v6, v1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    iget v7, v1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    iget v1, v1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    invoke-virtual {v3, v6, v7, v4, v1}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    const v1, 0x800003

    iput v1, v3, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    check-cast v2, Landroid/view/ViewGroup;

    invoke-virtual {v2, v5, v0, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    goto :goto_2

    .line 382
    :cond_4
    check-cast v2, Landroid/view/ViewGroup;

    invoke-virtual {v2, v5, v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 383
    :goto_2
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p0

    invoke-static {p0}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->webView(Landroid/view/View;)Landroid/webkit/WebView;

    move-result-object p0

    if-nez p0, :cond_5

    const/16 p0, 0x8

    invoke-virtual {v5, p0}, Landroid/widget/TextView;->setVisibility(I)V

    return-void

    .line 384
    :cond_5
    new-instance v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$27;

    invoke-direct {v0, v5}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$27;-><init>(Landroid/widget/TextView;)V

    .line 387
    new-instance v1, Lcom/melodix/music/PreviewPlayerControllerPlayAll$28;

    invoke-direct {v1, p0, v0}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$28;-><init>(Landroid/webkit/WebView;Landroid/webkit/ValueCallback;)V

    const-wide/16 v2, 0x4b0

    invoke-virtual {p0, v1, v2, v3}, Landroid/webkit/WebView;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 388
    new-instance v1, Lcom/melodix/music/PreviewPlayerControllerPlayAll$29;

    invoke-direct {v1, p0, v0}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$29;-><init>(Landroid/webkit/WebView;Landroid/webkit/ValueCallback;)V

    invoke-virtual {v5, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 391
    return-void

    .line 370
    :cond_6
    :goto_3
    return-void
.end method

.method static addMenus(Landroid/app/Activity;Landroid/view/View;Lorg/json/JSONArray;)V
    .locals 7

    .line 126
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 127
    const/4 v1, 0x0

    move v2, v1

    :goto_0
    invoke-virtual {p2}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-ge v2, v3, :cond_1

    invoke-virtual {p2, v2}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    if-eqz v3, :cond_0

    invoke-static {v3}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->trackUri(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "spotify:track:"

    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 128
    :cond_1
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p2

    iget p2, p2, Landroid/util/DisplayMetrics;->density:F

    .line 129
    nop

    :goto_1
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_7

    .line 130
    add-int/lit8 v2, v1, 0x1

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {p1, v3}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->find(Landroid/view/View;Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v3

    if-nez v3, :cond_2

    goto :goto_4

    .line 131
    :cond_2
    :goto_2
    if-eqz v3, :cond_4

    invoke-virtual {v3}, Landroid/view/View;->isClickable()Z

    move-result v4

    if-nez v4, :cond_4

    invoke-virtual {v3}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v4

    instance-of v4, v4, Landroid/view/View;

    if-eqz v4, :cond_3

    invoke-virtual {v3}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    goto :goto_2

    :cond_3
    const/4 v3, 0x0

    goto :goto_2

    .line 132
    :cond_4
    instance-of v4, v3, Landroid/view/ViewGroup;

    if-eqz v4, :cond_6

    const-string v4, "melodixDots"

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v5

    if-eqz v5, :cond_5

    goto :goto_3

    .line 133
    :cond_5
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/json/JSONObject;

    .line 134
    new-instance v5, Lcom/melodix/music/PreviewPlayerControllerPlayAll$5;

    invoke-direct {v5, p0, p2}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$5;-><init>(Landroid/content/Context;F)V

    .line 139
    invoke-virtual {v5, v4}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Plus d\'options pour "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->title(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v5, v4}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 140
    new-instance v4, Lcom/melodix/music/PreviewPlayerControllerPlayAll$6;

    invoke-direct {v4, p0, v1, v3}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$6;-><init>(Landroid/app/Activity;Lorg/json/JSONObject;Landroid/view/View;)V

    invoke-virtual {v5, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 141
    check-cast v3, Landroid/view/ViewGroup;

    new-instance v1, Landroid/view/ViewGroup$LayoutParams;

    const/high16 v4, 0x42100000    # 36.0f

    mul-float/2addr v4, p2

    float-to-int v4, v4

    const/high16 v6, 0x42400000    # 48.0f

    mul-float/2addr v6, p2

    float-to-int v6, v6

    invoke-direct {v1, v4, v6}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v3, v5, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 129
    :cond_6
    :goto_3
    move v1, v2

    goto :goto_1

    .line 143
    :cond_7
    :goto_4
    return-void
.end method

.method static addToPlaylist(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 3

    .line 320
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->webView(Landroid/view/View;)Landroid/webkit/WebView;

    move-result-object v0

    .line 321
    if-nez v0, :cond_0

    const-string p1, "Page Spotify indisponible"

    invoke-static {p0, p1}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->toast(Landroid/app/Activity;Ljava/lang/String;)V

    return-void

    .line 322
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "(function(id){try{var a=document.querySelector(\'a[href*=\"/track/\'+id+\'\"]\');var row=a&&(a.closest(\'[data-testid=\"tracklist-row\"]\')||a.closest(\'[role=\"row\"]\'));if(!row)return \'absent\';var r=row.getBoundingClientRect();window.__sfPlNames=null;row.dispatchEvent(new MouseEvent(\'contextmenu\',{bubbles:true,cancelable:true,clientX:r.left+20,clientY:r.top+10,button:2}));setTimeout(function(){var items=document.querySelectorAll(\'[role=\"menu\"] button,[role=\"menu\"] [role=\"menuitem\"]\');var hit=null;for(var i=0;i<items.length;i++){var t=(items[i].textContent||\'\').trim();if(/^(Ajouter (\u00e0|a) (la|une) playlist|Add to playlist)/i.test(t)){hit=items[i];break}}if(!hit){window.__sfPlNames=[];return}hit.dispatchEvent(new MouseEvent(\'mouseover\',{bubbles:true}));hit.click();setTimeout(function(){var menus=document.querySelectorAll(\'[role=\"menu\"]\');var m=menus[menus.length-1];var out=[];if(m&&menus.length>1){var b=m.querySelectorAll(\'button,[role=\"menuitem\"]\');for(var j=0;j<b.length&&out.length<80;j++){var n=(b[j].textContent||\'\').trim();if(n&&n.length<120&&out.indexOf(n)<0)out.push(n)}}window.__sfPlNames=out},450)},350);return \'started\'}catch(e){return \'error\'}})("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p1}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v1, ")"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance v1, Lcom/melodix/music/PreviewPlayerControllerPlayAll$24;

    invoke-direct {v1, p0, v0}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$24;-><init>(Landroid/app/Activity;Landroid/webkit/WebView;)V

    invoke-virtual {v0, p1, v1}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    .line 339
    return-void
.end method

.method static artist(Lorg/json/JSONObject;)Ljava/lang/String;
    .locals 5

    .line 273
    const-string v0, "subtitle"

    const-string v1, ""

    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    return-object v0

    .line 274
    :cond_0
    const-string v0, "artists"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 275
    const/4 v2, 0x0

    :goto_0
    if-eqz p0, :cond_4

    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-ge v2, v3, :cond_4

    invoke-virtual {p0, v2}, Lorg/json/JSONArray;->opt(I)Ljava/lang/Object;

    move-result-object v3

    instance-of v4, v3, Lorg/json/JSONObject;

    if-eqz v4, :cond_1

    check-cast v3, Lorg/json/JSONObject;

    const-string v4, "name"

    invoke-virtual {v3, v4, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    goto :goto_1

    :cond_1
    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 276
    :goto_1
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_3

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    if-nez v4, :cond_2

    move-object v4, v1

    goto :goto_2

    :cond_2
    const-string v4, ", "

    :goto_2
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 275
    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 277
    :cond_4
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static close(Landroid/app/Dialog;Ljava/lang/Runnable;)V
    .locals 6

    .line 294
    sget-object v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->closer:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 295
    if-nez v0, :cond_0

    return-void

    .line 296
    :cond_0
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v1

    if-nez v1, :cond_2

    invoke-virtual {p0}, Landroid/app/Dialog;->dismiss()V

    if-eqz p1, :cond_1

    :try_start_0
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    :cond_1
    :goto_0
    return-void

    .line 297
    :cond_2
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    const v2, 0x3f19999a    # 0.6f

    const/4 v3, 0x0

    const-wide/16 v4, 0xdc

    invoke-static {v1, v2, v3, v4, v5}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->dim(Landroid/view/Window;FFJ)V

    .line 299
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {v1, v0}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v4, v5}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    new-instance v1, Landroid/view/animation/AccelerateInterpolator;

    const/high16 v2, 0x40000000    # 2.0f

    invoke-direct {v1, v2}, Landroid/view/animation/AccelerateInterpolator;-><init>(F)V

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    new-instance v1, Lcom/melodix/music/PreviewPlayerControllerPlayAll$22;

    invoke-direct {v1, p0, p1}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$22;-><init>(Landroid/app/Dialog;Ljava/lang/Runnable;)V

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    .line 300
    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 301
    return-void
.end method

.method static dim(Landroid/view/Window;FFJ)V
    .locals 2

    .line 287
    if-nez p0, :cond_0

    return-void

    .line 288
    :cond_0
    const/4 v0, 0x2

    new-array v0, v0, [F

    const/4 v1, 0x0

    aput p1, v0, v1

    const/4 p1, 0x1

    aput p2, v0, p1

    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object p1

    invoke-virtual {p1, p3, p4}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 289
    new-instance p2, Lcom/melodix/music/PreviewPlayerControllerPlayAll$21;

    invoke-direct {p2, p0}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$21;-><init>(Landroid/view/Window;)V

    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 291
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    .line 292
    return-void
.end method

.method static find(Landroid/view/View;Ljava/lang/String;)Landroid/widget/TextView;
    .locals 2

    .line 418
    instance-of v0, p0, Landroid/widget/TextView;

    if-eqz v0, :cond_0

    move-object v0, p0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    return-object v0

    .line 419
    :cond_0
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_2

    check-cast p0, Landroid/view/ViewGroup;

    .line 420
    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_2

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-static {v1, p1}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->find(Landroid/view/View;Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v1

    if-eqz v1, :cond_1

    return-object v1

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 421
    :cond_2
    const/4 p0, 0x0

    return-object p0
.end method

.method static fresh0()Z
    .locals 6

    .line 284
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    sget-wide v2, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->lastAdd:J

    sub-long v2, v0, v2

    const-wide/16 v4, 0xbb8

    cmp-long v2, v2, v4

    if-lez v2, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    sput-wide v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->lastAdd:J

    return v2
.end method

.method static glyph(Landroid/app/Activity;I)Landroid/view/View;
    .locals 2

    .line 238
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    .line 239
    new-instance v1, Lcom/melodix/music/PreviewPlayerControllerPlayAll$19;

    invoke-direct {v1, p0, v0, p1}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$19;-><init>(Landroid/content/Context;FI)V

    return-object v1
.end method

.method static icon(Landroid/app/Activity;Z)Landroid/view/View;
    .locals 2

    .line 76
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    .line 77
    new-instance v1, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;

    invoke-direct {v1, p0, v0, p1}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;-><init>(Landroid/content/Context;FZ)V

    .line 112
    const/4 p0, 0x1

    invoke-virtual {v1, p0}, Landroid/view/View;->setClickable(Z)V

    .line 114
    new-instance p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$4;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$4;-><init>()V

    invoke-virtual {v1, p0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 121
    return-object v1
.end method

.method static item(Landroid/app/Activity;ILjava/lang/String;Ljava/lang/Runnable;Landroid/app/Dialog;)Landroid/view/View;
    .locals 8

    .line 258
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    .line 259
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/16 v2, 0x10

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 260
    const/high16 v2, 0x41a00000    # 20.0f

    mul-float/2addr v2, v0

    float-to-int v2, v2

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3, v2, v3}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    const/4 v4, 0x1

    invoke-virtual {v1, v4}, Landroid/widget/LinearLayout;->setClickable(Z)V

    const/high16 v5, 0x42800000    # 64.0f

    mul-float/2addr v5, v0

    float-to-int v5, v5

    invoke-virtual {v1, v5}, Landroid/widget/LinearLayout;->setMinimumHeight(I)V

    .line 261
    new-instance v5, Landroid/util/TypedValue;

    invoke-direct {v5}, Landroid/util/TypedValue;-><init>()V

    .line 262
    invoke-virtual {p0}, Landroid/app/Activity;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v6

    const v7, 0x101030e

    invoke-virtual {v6, v7, v5, v4}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    move-result v4

    if-eqz v4, :cond_0

    iget v4, v5, Landroid/util/TypedValue;->resourceId:I

    invoke-virtual {v1, v4}, Landroid/widget/LinearLayout;->setBackgroundResource(I)V

    .line 263
    :cond_0
    invoke-static {p0, p1}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->glyph(Landroid/app/Activity;I)Landroid/view/View;

    move-result-object p1

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v5, 0x41e00000    # 28.0f

    mul-float/2addr v0, v5

    float-to-int v0, v0

    invoke-direct {v4, v0, v0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, p1, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 264
    const/16 p1, 0x11

    const v0, -0xa0a09

    invoke-static {p0, p2, p1, v0, v3}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->text(Landroid/app/Activity;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object p0

    invoke-virtual {p0, v2, v3, v3, v3}, Landroid/widget/TextView;->setPadding(IIII)V

    invoke-virtual {v1, p0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 265
    new-instance p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$20;

    invoke-direct {p0, p4, p3}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$20;-><init>(Landroid/app/Dialog;Ljava/lang/Runnable;)V

    invoke-virtual {v1, p0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 266
    return-object v1
.end method

.method static openLink(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 346
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->webView(Landroid/view/View;)Landroid/webkit/WebView;

    move-result-object v0

    .line 347
    if-nez v0, :cond_1

    if-eqz p3, :cond_0

    invoke-virtual {p3}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_0

    invoke-static {p0, p3}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->search(Landroid/app/Activity;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    const-string p1, "Page Spotify indisponible"

    invoke-static {p0, p1}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->toast(Landroid/app/Activity;Ljava/lang/String;)V

    :goto_0
    return-void

    .line 348
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "(function(id,kind){try{var a=document.querySelector(\'a[href*=\"/track/\'+id+\'\"]\');var row=a&&(a.closest(\'[data-testid=\"tracklist-row\"]\')||a.closest(\'[role=\"row\"]\'));var l=row&&row.querySelector(\'a[href*=\"/\'+kind+\'/\"]\');var m=l&&(l.getAttribute(\'href\')||\'\').match(/\\/(album|artist)\\/([A-Za-z0-9]+)/);return m?\'spotify:\'+m[1]+\':\'+m[2]+\'\\t\'+(l.textContent||\'\').trim():\'\'}catch(e){return \'\'}})("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p1}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v1, ","

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-static {p2}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, ")"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance p2, Lcom/melodix/music/PreviewPlayerControllerPlayAll$25;

    invoke-direct {p2, p0, p3}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$25;-><init>(Landroid/app/Activity;Ljava/lang/String;)V

    invoke-virtual {v0, p1, p2}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    .line 355
    return-void
.end method

.method static openNative(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    .line 342
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "openNativeRow"

    const-class v2, Ljava/lang/String;

    const-class v3, Ljava/lang/String;

    filled-new-array {v2, v3}, [Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    filled-new-array {p1, p2}, [Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {v0, p0, p1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 343
    goto :goto_0

    :catch_0
    move-exception p1

    const-string p1, "Ouverture indisponible"

    invoke-static {p0, p1}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->toast(Landroid/app/Activity;Ljava/lang/String;)V

    .line 344
    :goto_0
    return-void
.end method

.method static pageMenu(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 306
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->webView(Landroid/view/View;)Landroid/webkit/WebView;

    move-result-object v0

    .line 307
    if-nez v0, :cond_0

    const-string p1, "Page Spotify indisponible"

    invoke-static {p0, p1}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->toast(Landroid/app/Activity;Ljava/lang/String;)V

    return-void

    .line 308
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "(function(id,labels){try{var a=document.querySelector(\'a[href*=\"/track/\'+id+\'\"]\');var row=a&&(a.closest(\'[data-testid=\"tracklist-row\"]\')||a.closest(\'[role=\"row\"]\'));if(!row)return \'absent\';var r=row.getBoundingClientRect();row.dispatchEvent(new MouseEvent(\'contextmenu\',{bubbles:true,cancelable:true,clientX:r.left+20,clientY:r.top+10,button:2}));window.__sfMenuJob=\'open\';setTimeout(function(){var want=labels.split(\'|\');var items=document.querySelectorAll(\'[role=\"menu\"] button,[role=\"menu\"] [role=\"menuitem\"],#context-menu button\');for(var i=0;i<items.length;i++){var t=(items[i].textContent||\'\').trim();for(var j=0;j<want.length;j++)if(t===want[j]||t.indexOf(want[j])===0){items[i].click();window.__sfMenuJob=\'done\';return}}window.__sfMenuJob=\'missing\';document.dispatchEvent(new KeyboardEvent(\'keydown\',{key:\'Escape\',bubbles:true}))},350);return \'started\'}catch(e){return \'error\'}})("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p1}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v1, ","

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-static {p2}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, ")"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance p2, Lcom/melodix/music/PreviewPlayerControllerPlayAll$23;

    invoke-direct {p2, p0, v0, p3}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$23;-><init>(Landroid/app/Activity;Landroid/webkit/WebView;Ljava/lang/String;)V

    invoke-virtual {v0, p1, p2}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    .line 313
    return-void
.end method

.method static radio(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 3

    .line 358
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->webView(Landroid/view/View;)Landroid/webkit/WebView;

    move-result-object v0

    .line 359
    if-nez v0, :cond_0

    const-string p1, "Page Spotify indisponible"

    invoke-static {p0, p1}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->toast(Landroid/app/Activity;Ljava/lang/String;)V

    return-void

    .line 360
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "(function(id,labels){try{var a=document.querySelector(\'a[href*=\"/track/\'+id+\'\"]\');var row=a&&(a.closest(\'[data-testid=\"tracklist-row\"]\')||a.closest(\'[role=\"row\"]\'));if(!row)return \'absent\';var r=row.getBoundingClientRect();row.dispatchEvent(new MouseEvent(\'contextmenu\',{bubbles:true,cancelable:true,clientX:r.left+20,clientY:r.top+10,button:2}));window.__sfMenuJob=\'open\';setTimeout(function(){var want=labels.split(\'|\');var items=document.querySelectorAll(\'[role=\"menu\"] button,[role=\"menu\"] [role=\"menuitem\"],#context-menu button\');for(var i=0;i<items.length;i++){var t=(items[i].textContent||\'\').trim();for(var j=0;j<want.length;j++)if(t===want[j]||t.indexOf(want[j])===0){items[i].click();window.__sfMenuJob=\'done\';return}}window.__sfMenuJob=\'missing\';document.dispatchEvent(new KeyboardEvent(\'keydown\',{key:\'Escape\',bubbles:true}))},350);return \'started\'}catch(e){return \'error\'}})("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p1}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v1, ","

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v1, "Acc\u00e9der \u00e0 la radio du titre|Go to song radio|Radio du titre"

    invoke-static {v1}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v1, ")"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance v1, Lcom/melodix/music/PreviewPlayerControllerPlayAll$26;

    invoke-direct {v1, p0, v0}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$26;-><init>(Landroid/app/Activity;Landroid/webkit/WebView;)V

    invoke-virtual {v0, p1, v1}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    .line 366
    return-void
.end method

.method static random(Landroid/view/View;)V
    .locals 3

    .line 410
    const/4 v0, 0x0

    :goto_0
    add-int/lit8 v1, v0, 0x1

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {p0, v2}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->find(Landroid/view/View;Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v2

    if-eqz v2, :cond_0

    const/16 v2, 0x1f4

    if-ge v0, v2, :cond_0

    move v0, v1

    goto :goto_0

    .line 411
    :cond_0
    if-lez v0, :cond_1

    new-instance v1, Ljava/util/Random;

    invoke-direct {v1}, Ljava/util/Random;-><init>()V

    invoke-virtual {v1, v0}, Ljava/util/Random;->nextInt(I)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->tap(Landroid/view/View;Ljava/lang/String;)V

    .line 412
    :cond_1
    return-void
.end method

.method static search(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 3

    .line 281
    :try_start_0
    new-instance v0, Landroid/view/View;

    invoke-direct {v0, p0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    const-string v1, "onNativeGenreClick"

    const-class v2, Landroid/view/View;

    filled-new-array {v2}, [Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p1

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, p0, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 282
    goto :goto_0

    :catch_0
    move-exception p1

    const-string p1, "Recherche indisponible"

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 283
    :goto_0
    return-void
.end method

.method static sheet(Landroid/app/Activity;Lorg/json/JSONObject;Landroid/view/View;)V
    .locals 17

    .line 147
    move-object/from16 v1, p0

    move-object/from16 v2, p1

    invoke-virtual/range {p0 .. p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v3, v0, Landroid/util/DisplayMetrics;->density:F

    .line 148
    new-instance v4, Lcom/melodix/music/PreviewPlayerControllerPlayAll$7;

    invoke-direct {v4, v1}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$7;-><init>(Landroid/content/Context;)V

    .line 153
    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Landroid/app/Dialog;->requestWindowFeature(I)Z

    .line 155
    new-instance v6, Lcom/melodix/music/PreviewPlayerControllerPlayAll$8;

    invoke-direct {v6, v1, v1, v4}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$8;-><init>(Landroid/content/Context;Landroid/app/Activity;Landroid/app/Dialog;)V

    .line 175
    invoke-virtual {v6, v5}, Landroid/widget/LinearLayout;->setClickable(Z)V

    invoke-virtual {v6, v5}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 176
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const v7, -0xe0e0de

    invoke-virtual {v0, v7}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 177
    const/high16 v7, 0x41b00000    # 22.0f

    mul-float/2addr v7, v3

    const/16 v8, 0x8

    new-array v8, v8, [F

    const/4 v9, 0x0

    aput v7, v8, v9

    aput v7, v8, v5

    const/4 v10, 0x2

    aput v7, v8, v10

    const/4 v11, 0x3

    aput v7, v8, v11

    const/4 v7, 0x4

    const/4 v12, 0x0

    aput v12, v8, v7

    const/4 v13, 0x5

    aput v12, v8, v13

    const/4 v14, 0x6

    aput v12, v8, v14

    const/4 v15, 0x7

    aput v12, v8, v15

    invoke-virtual {v0, v8}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadii([F)V

    invoke-virtual {v6, v0}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 178
    const/high16 v0, 0x41400000    # 12.0f

    mul-float/2addr v0, v3

    float-to-int v0, v0

    const/high16 v8, 0x41e00000    # 28.0f

    mul-float/2addr v8, v3

    float-to-int v8, v8

    invoke-virtual {v6, v9, v0, v9, v8}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 179
    new-instance v0, Landroid/view/View;

    invoke-direct {v0, v1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    new-instance v8, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v8}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const v12, 0x66ffffff

    invoke-virtual {v8, v12}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    const/high16 v12, 0x40400000    # 3.0f

    mul-float/2addr v12, v3

    invoke-virtual {v8, v12}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    invoke-virtual {v0, v8}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 180
    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v12, 0x42200000    # 40.0f

    mul-float/2addr v12, v3

    float-to-int v12, v12

    const/high16 v16, 0x40a00000    # 5.0f

    mul-float v11, v3, v16

    float-to-int v11, v11

    invoke-direct {v8, v12, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    iput v5, v8, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    const/high16 v11, 0x41a00000    # 20.0f

    mul-float/2addr v11, v3

    float-to-int v11, v11

    iput v11, v8, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    invoke-virtual {v6, v0, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 181
    new-instance v8, Landroid/widget/LinearLayout;

    invoke-direct {v8, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/16 v0, 0x10

    invoke-virtual {v8, v0}, Landroid/widget/LinearLayout;->setGravity(I)V

    invoke-virtual {v8, v11, v9, v11, v9}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 182
    new-instance v11, Landroid/widget/ImageView;

    invoke-direct {v11, v1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    sget-object v0, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v11, v0}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 183
    const/high16 v12, 0x42600000    # 56.0f

    :try_start_0
    const-string v0, "image"

    const-string v15, ""

    invoke-virtual {v2, v0, v15}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    mul-float v15, v3, v12

    float-to-int v15, v15

    invoke-static {v11, v0, v15}, Lcom/melodix/music/PreviewPlayerController;->cover(Landroid/widget/ImageView;Ljava/lang/String;I)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 184
    :goto_0
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    mul-float/2addr v12, v3

    float-to-int v12, v12

    invoke-direct {v0, v12, v12}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v8, v11, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 185
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v5}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/high16 v11, 0x41800000    # 16.0f

    mul-float/2addr v11, v3

    float-to-int v11, v11

    invoke-virtual {v0, v11, v9, v9, v9}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 186
    invoke-static/range {p1 .. p1}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->title(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v11

    const/16 v12, 0x11

    const v15, -0xa0a09

    invoke-static {v1, v11, v12, v15, v9}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->text(Landroid/app/Activity;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v11

    invoke-virtual {v0, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-static/range {p1 .. p1}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->artist(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v11

    const/16 v12, 0xe

    const v15, -0x5e5e56

    invoke-static {v1, v11, v12, v15, v9}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->text(Landroid/app/Activity;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v11

    const/high16 v12, 0x40800000    # 4.0f

    mul-float/2addr v12, v3

    float-to-int v12, v12

    invoke-virtual {v11, v9, v12, v9, v9}, Landroid/widget/TextView;->setPadding(IIII)V

    invoke-virtual {v0, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 187
    new-instance v11, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v12, 0x3f800000    # 1.0f

    const/4 v15, -0x2

    invoke-direct {v11, v9, v15, v12}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v8, v0, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 188
    invoke-virtual {v6, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 189
    new-instance v0, Landroid/view/View;

    invoke-direct {v0, v1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    const v8, 0x33ffffff

    invoke-virtual {v0, v8}, Landroid/view/View;->setBackgroundColor(I)V

    .line 190
    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    float-to-int v11, v3

    invoke-static {v5, v11}, Ljava/lang/Math;->max(II)I

    move-result v11

    const/4 v12, -0x1

    invoke-direct {v8, v12, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v11, 0x41900000    # 18.0f

    mul-float/2addr v11, v3

    float-to-int v11, v11

    iput v11, v8, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    const/high16 v11, 0x40c00000    # 6.0f

    mul-float/2addr v11, v3

    float-to-int v11, v11

    iput v11, v8, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    invoke-virtual {v6, v0, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 191
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "https://open.spotify.com/track/"

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static/range {p1 .. p1}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->trackUri(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v8

    const-string v11, "spotify:track:"

    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v12

    invoke-virtual {v8, v12}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 192
    new-instance v8, Lcom/melodix/music/PreviewPlayerControllerPlayAll$9;

    invoke-direct {v8, v0, v1}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$9;-><init>(Ljava/lang/String;Landroid/app/Activity;)V

    const-string v0, "Partager"

    invoke-static {v1, v9, v0, v8, v4}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->item(Landroid/app/Activity;ILjava/lang/String;Ljava/lang/Runnable;Landroid/app/Dialog;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v6, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 196
    invoke-static/range {p1 .. p1}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->trackUri(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v8

    invoke-virtual {v0, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 197
    new-instance v8, Lcom/melodix/music/PreviewPlayerControllerPlayAll$10;

    invoke-direct {v8, v2, v1, v0}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$10;-><init>(Lorg/json/JSONObject;Landroid/app/Activity;Ljava/lang/String;)V

    const-string v11, "Ajouter \u00e0 la file d\'attente"

    invoke-static {v1, v10, v11, v8, v4}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->item(Landroid/app/Activity;ILjava/lang/String;Ljava/lang/Runnable;Landroid/app/Dialog;)Landroid/view/View;

    move-result-object v8

    invoke-virtual {v6, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 202
    new-instance v8, Lcom/melodix/music/PreviewPlayerControllerPlayAll$11;

    invoke-direct {v8, v1, v0}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$11;-><init>(Landroid/app/Activity;Ljava/lang/String;)V

    const-string v11, "Ajouter aux Titres lik\u00e9s"

    invoke-static {v1, v7, v11, v8, v4}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->item(Landroid/app/Activity;ILjava/lang/String;Ljava/lang/Runnable;Landroid/app/Dialog;)Landroid/view/View;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 204
    new-instance v7, Lcom/melodix/music/PreviewPlayerControllerPlayAll$12;

    invoke-direct {v7, v1, v0}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$12;-><init>(Landroid/app/Activity;Ljava/lang/String;)V

    const-string v8, "Ajouter \u00e0 une playlist"

    invoke-static {v1, v10, v8, v7, v4}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->item(Landroid/app/Activity;ILjava/lang/String;Ljava/lang/Runnable;Landroid/app/Dialog;)Landroid/view/View;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 205
    new-instance v7, Lcom/melodix/music/PreviewPlayerControllerPlayAll$13;

    invoke-direct {v7, v1}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$13;-><init>(Landroid/app/Activity;)V

    const-string v8, "Minuterie de veille"

    invoke-static {v1, v13, v8, v7, v4}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->item(Landroid/app/Activity;ILjava/lang/String;Ljava/lang/Runnable;Landroid/app/Dialog;)Landroid/view/View;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 206
    invoke-static/range {p1 .. p1}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->artist(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v7

    const-string v8, ","

    invoke-virtual {v7, v8}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v7

    aget-object v7, v7, v9

    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    .line 208
    new-instance v8, Lcom/melodix/music/PreviewPlayerControllerPlayAll$14;

    invoke-direct {v8, v1, v0, v7}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$14;-><init>(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    const-string v7, "Acc\u00e9der \u00e0 l\'artiste"

    invoke-static {v1, v5, v7, v8, v4}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->item(Landroid/app/Activity;ILjava/lang/String;Ljava/lang/Runnable;Landroid/app/Dialog;)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v6, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 209
    new-instance v5, Lcom/melodix/music/PreviewPlayerControllerPlayAll$15;

    invoke-direct {v5, v1, v0}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$15;-><init>(Landroid/app/Activity;Ljava/lang/String;)V

    const-string v7, "Acc\u00e9der \u00e0 l\'album"

    invoke-static {v1, v14, v7, v5, v4}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->item(Landroid/app/Activity;ILjava/lang/String;Ljava/lang/Runnable;Landroid/app/Dialog;)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v6, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 210
    new-instance v5, Lcom/melodix/music/PreviewPlayerControllerPlayAll$16;

    invoke-direct {v5, v1, v0}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$16;-><init>(Landroid/app/Activity;Ljava/lang/String;)V

    const-string v7, "Acc\u00e9der \u00e0 la radio du titre"

    const/4 v8, 0x7

    invoke-static {v1, v8, v7, v5, v4}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->item(Landroid/app/Activity;ILjava/lang/String;Ljava/lang/Runnable;Landroid/app/Dialog;)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v6, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 211
    new-instance v5, Lcom/melodix/music/PreviewPlayerControllerPlayAll$17;

    invoke-direct {v5, v1, v2, v0}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$17;-><init>(Landroid/app/Activity;Lorg/json/JSONObject;Ljava/lang/String;)V

    const-string v0, "Supprimer de cette playlist"

    const/4 v2, 0x3

    invoke-static {v1, v2, v0, v5, v4}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->item(Landroid/app/Activity;ILjava/lang/String;Ljava/lang/Runnable;Landroid/app/Dialog;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v6, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 218
    invoke-virtual {v4, v9}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    invoke-virtual {v4, v6}, Landroid/app/Dialog;->setContentView(Landroid/view/View;)V

    .line 219
    invoke-virtual {v4}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    .line 220
    if-eqz v0, :cond_0

    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v1, v9}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v0, v1}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    const/16 v1, 0x50

    invoke-virtual {v0, v1}, Landroid/view/Window;->setGravity(I)V

    .line 221
    const/4 v1, -0x1

    invoke-virtual {v0, v1, v15}, Landroid/view/Window;->setLayout(II)V

    invoke-virtual {v0, v9}, Landroid/view/Window;->setWindowAnimations(I)V

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/Window;->setDimAmount(F)V

    .line 223
    :cond_0
    nop

    .line 224
    new-instance v1, Lcom/melodix/music/PreviewPlayerControllerPlayAll$18;

    invoke-direct {v1, v6, v3, v0}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$18;-><init>(Landroid/view/View;FLandroid/view/Window;)V

    invoke-virtual {v4, v1}, Landroid/app/Dialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 229
    sget-object v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->closer:Ljava/util/WeakHashMap;

    invoke-virtual {v0, v4, v6}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 230
    invoke-virtual {v4}, Landroid/app/Dialog;->show()V

    .line 231
    return-void
.end method

.method static sleepTimer(Landroid/app/Activity;)V
    .locals 7

    .line 399
    const-string v5, "Fin du titre"

    const-string v6, "D\u00e9sactiver la minuterie"

    const-string v0, "5 minutes"

    const-string v1, "15 minutes"

    const-string v2, "30 minutes"

    const-string v3, "45 minutes"

    const-string v4, "1 heure"

    filled-new-array/range {v0 .. v6}, [Ljava/lang/String;

    move-result-object v0

    .line 400
    const/4 v1, 0x7

    new-array v1, v1, [J

    fill-array-data v1, :array_0

    .line 401
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v3, "Minuterie de veille"

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    new-instance v3, Lcom/melodix/music/PreviewPlayerControllerPlayAll$30;

    invoke-direct {v3, p0, v1, v0}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$30;-><init>(Landroid/app/Activity;[J[Ljava/lang/String;)V

    invoke-virtual {v2, v0, v3}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    .line 405
    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 406
    return-void

    :array_0
    .array-data 8
        0x5
        0xf
        0x1e
        0x2d
        0x3c
        -0x1
        0x0
    .end array-data
.end method

.method static tap(Landroid/view/View;Ljava/lang/String;)V
    .locals 0

    .line 414
    invoke-static {p0, p1}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->find(Landroid/view/View;Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object p0

    :goto_0
    if-eqz p0, :cond_2

    .line 415
    invoke-virtual {p0}, Landroid/view/View;->isClickable()Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Landroid/view/View;->performClick()Z

    return-void

    .line 414
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    instance-of p1, p1, Landroid/view/View;

    if-eqz p1, :cond_1

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    check-cast p0, Landroid/view/View;

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    goto :goto_0

    .line 416
    :cond_2
    return-void
.end method

.method static text(Landroid/app/Activity;Ljava/lang/String;IIZ)Landroid/widget/TextView;
    .locals 1

    .line 233
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    int-to-float p0, p2

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextSize(F)V

    invoke-virtual {v0, p3}, Landroid/widget/TextView;->setTextColor(I)V

    const/4 p0, 0x1

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 234
    sget-object p0, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    if-eqz p4, :cond_0

    sget-object p0, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    :cond_0
    return-object v0
.end method

.method static title(Lorg/json/JSONObject;)Ljava/lang/String;
    .locals 3

    .line 271
    const-string v0, "title"

    const-string v1, ""

    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    const-string v0, "name"

    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method static toast(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 1

    .line 407
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method static trackUri(Lorg/json/JSONObject;)Ljava/lang/String;
    .locals 3

    .line 269
    const-string v0, "uri"

    const-string v1, ""

    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    const-string v0, "id"

    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method static webView(Landroid/view/View;)Landroid/webkit/WebView;
    .locals 2

    .line 393
    instance-of v0, p0, Landroid/webkit/WebView;

    if-eqz v0, :cond_0

    check-cast p0, Landroid/webkit/WebView;

    return-object p0

    .line 394
    :cond_0
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_2

    check-cast p0, Landroid/view/ViewGroup;

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_2

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->webView(Landroid/view/View;)Landroid/webkit/WebView;

    move-result-object v1

    if-eqz v1, :cond_1

    return-object v1

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 395
    :cond_2
    const/4 p0, 0x0

    return-object p0
.end method
