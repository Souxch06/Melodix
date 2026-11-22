.class final Lcom/melodix/music/PreviewPlayerControllerPlayAll;
.super Ljava/lang/Object;
.source "PreviewPlayerControllerPlayAll.java"


# static fields
.field static final TAG:Ljava/lang/String; = "melodixPlayAll"

.field private static lastAdd:J

.field static loadingUntil:J

.field static shuffleOn:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 16
    const-wide/32 v0, -0x186a0

    sput-wide v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->lastAdd:J

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

    .line 27
    const-string v3, "melodix_playall"

    const/4 v4, 0x0

    invoke-virtual {p0, v3, v4}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    const-string v5, "shuffle"

    invoke-interface {v3, v5, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    sput-boolean v3, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->shuffleOn:Z

    .line 30
    new-instance v3, Landroid/widget/LinearLayout;

    invoke-direct {v3, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 31
    invoke-virtual {v3, p1}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 33
    const p1, 0x800015

    invoke-virtual {v3, p1}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 34
    new-instance p1, Landroid/view/ViewGroup$MarginLayoutParams;

    const/4 v5, -0x1

    const/4 v6, -0x2

    invoke-direct {p1, v5, v6}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(II)V

    .line 35
    const/high16 v5, 0x41600000    # 14.0f

    mul-float/2addr v5, v2

    float-to-int v5, v5

    iput v5, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    invoke-virtual {v3, p1}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 36
    const/4 p1, 0x1

    invoke-static {p0, p1}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->icon(Landroid/app/Activity;Z)Landroid/view/View;

    move-result-object v5

    const-string v7, "Lire la playlist"

    invoke-virtual {v5, v7}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 37
    new-instance v7, Lcom/melodix/music/PreviewPlayerControllerPlayAll$1;

    invoke-direct {v7, v0}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$1;-><init>(Landroid/view/View;)V

    invoke-virtual {v5, v7}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 43
    invoke-static {p0, v4}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->icon(Landroid/app/Activity;Z)Landroid/view/View;

    move-result-object v0

    const-string v7, "Lecture al\u00e9atoire"

    invoke-virtual {v0, v7}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 46
    new-instance v7, Lcom/melodix/music/PreviewPlayerControllerPlayAll$2;

    invoke-direct {v7, p0}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$2;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v0, v7}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 51
    new-instance p0, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v7, 0x42400000    # 48.0f

    mul-float/2addr v7, v2

    float-to-int v7, v7

    invoke-direct {p0, v7, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v7, 0x41800000    # 16.0f

    mul-float/2addr v7, v2

    float-to-int v7, v7

    iput v7, p0, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 52
    invoke-virtual {v3, v0, p0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance p0, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v0, 0x42700000    # 60.0f

    mul-float/2addr v0, v2

    float-to-int v0, v0

    invoke-direct {p0, v0, v0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v3, v5, p0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 54
    const-string p0, "glass-playlist-count"

    invoke-virtual {v1, p0}, Landroid/view/ViewGroup;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object p0

    .line 55
    const/high16 v0, 0x3f800000    # 1.0f

    if-eqz p0, :cond_3

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v5

    instance-of v5, v5, Landroid/view/ViewGroup;

    if-eqz v5, :cond_3

    .line 56
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    check-cast p1, Landroid/view/ViewGroup;

    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result v1

    .line 57
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    const/16 v5, 0x10

    invoke-virtual {v3, v5}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 58
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v5, v4, v6, v0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v3, p0, v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 59
    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p0

    check-cast p0, Landroid/view/ViewGroup$MarginLayoutParams;

    const/high16 v0, 0x40c00000    # 6.0f

    mul-float/2addr v2, v0

    float-to-int v0, v2

    iput v0, p0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 60
    invoke-virtual {p1, v3, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    .line 61
    return-void

    .line 63
    :cond_3
    nop

    .line 65
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

    .line 66
    const/4 p0, 0x0

    if-eqz v4, :cond_5

    invoke-virtual {v3, p0}, Landroid/widget/LinearLayout;->setAlpha(F)V

    const/high16 p1, 0x41000000    # 8.0f

    mul-float/2addr v2, p1

    invoke-virtual {v3, v2}, Landroid/widget/LinearLayout;->setTranslationY(F)V

    .line 67
    :cond_5
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 68
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

    .line 69
    :cond_6
    return-void
.end method

.method static addMenus(Landroid/app/Activity;Landroid/view/View;Lorg/json/JSONArray;)V
    .locals 7

    .line 118
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 119
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

    .line 120
    :cond_1
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p2

    iget p2, p2, Landroid/util/DisplayMetrics;->density:F

    .line 121
    nop

    :goto_1
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_7

    .line 122
    add-int/lit8 v2, v1, 0x1

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {p1, v3}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->find(Landroid/view/View;Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v3

    if-nez v3, :cond_2

    goto :goto_4

    .line 123
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

    .line 124
    :cond_4
    instance-of v4, v3, Landroid/view/ViewGroup;

    if-eqz v4, :cond_6

    const-string v4, "melodixDots"

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v5

    if-eqz v5, :cond_5

    goto :goto_3

    .line 125
    :cond_5
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/json/JSONObject;

    .line 126
    new-instance v5, Lcom/melodix/music/PreviewPlayerControllerPlayAll$5;

    invoke-direct {v5, p0, p2}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$5;-><init>(Landroid/content/Context;F)V

    .line 131
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

    .line 132
    new-instance v4, Lcom/melodix/music/PreviewPlayerControllerPlayAll$6;

    invoke-direct {v4, p0, v1, v3}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$6;-><init>(Landroid/app/Activity;Lorg/json/JSONObject;Landroid/view/View;)V

    invoke-virtual {v5, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 133
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

    .line 121
    :cond_6
    :goto_3
    move v1, v2

    goto :goto_1

    .line 135
    :cond_7
    :goto_4
    return-void
.end method

.method static artist(Lorg/json/JSONObject;)Ljava/lang/String;
    .locals 5

    .line 206
    const-string v0, "subtitle"

    const-string v1, ""

    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    return-object v0

    .line 207
    :cond_0
    const-string v0, "artists"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 208
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

    .line 209
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

    .line 208
    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 210
    :cond_4
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static find(Landroid/view/View;Ljava/lang/String;)Landroid/widget/TextView;
    .locals 2

    .line 229
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

    .line 230
    :cond_0
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_2

    check-cast p0, Landroid/view/ViewGroup;

    .line 231
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

    .line 232
    :cond_2
    const/4 p0, 0x0

    return-object p0
.end method

.method static fresh0()Z
    .locals 6

    .line 217
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

    .line 177
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    .line 178
    new-instance v1, Lcom/melodix/music/PreviewPlayerControllerPlayAll$9;

    invoke-direct {v1, p0, v0, p1}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$9;-><init>(Landroid/content/Context;FI)V

    return-object v1
.end method

.method static icon(Landroid/app/Activity;Z)Landroid/view/View;
    .locals 2

    .line 72
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    .line 73
    new-instance v1, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;

    invoke-direct {v1, p0, v0, p1}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;-><init>(Landroid/content/Context;FZ)V

    .line 104
    const/4 p0, 0x1

    invoke-virtual {v1, p0}, Landroid/view/View;->setClickable(Z)V

    .line 106
    new-instance p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$4;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$4;-><init>()V

    invoke-virtual {v1, p0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 113
    return-object v1
.end method

.method static item(Landroid/app/Activity;ILjava/lang/String;Ljava/lang/Runnable;Landroid/app/Dialog;)Landroid/view/View;
    .locals 8

    .line 191
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    .line 192
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/16 v2, 0x10

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 193
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

    .line 194
    new-instance v5, Landroid/util/TypedValue;

    invoke-direct {v5}, Landroid/util/TypedValue;-><init>()V

    .line 195
    invoke-virtual {p0}, Landroid/app/Activity;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v6

    const v7, 0x101030e

    invoke-virtual {v6, v7, v5, v4}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    move-result v4

    if-eqz v4, :cond_0

    iget v4, v5, Landroid/util/TypedValue;->resourceId:I

    invoke-virtual {v1, v4}, Landroid/widget/LinearLayout;->setBackgroundResource(I)V

    .line 196
    :cond_0
    invoke-static {p0, p1}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->glyph(Landroid/app/Activity;I)Landroid/view/View;

    move-result-object p1

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v5, 0x41e00000    # 28.0f

    mul-float/2addr v0, v5

    float-to-int v0, v0

    invoke-direct {v4, v0, v0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, p1, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 197
    const/16 p1, 0x11

    const v0, -0xa0a09

    invoke-static {p0, p2, p1, v0, v3}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->text(Landroid/app/Activity;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object p0

    invoke-virtual {p0, v2, v3, v3, v3}, Landroid/widget/TextView;->setPadding(IIII)V

    invoke-virtual {v1, p0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 198
    new-instance p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$10;

    invoke-direct {p0, p4, p3}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$10;-><init>(Landroid/app/Dialog;Ljava/lang/Runnable;)V

    invoke-virtual {v1, p0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 199
    return-object v1
.end method

.method static random(Landroid/view/View;)V
    .locals 3

    .line 221
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

    .line 222
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

    .line 223
    :cond_1
    return-void
.end method

.method static search(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 3

    .line 214
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

    .line 215
    goto :goto_0

    :catch_0
    move-exception p1

    const-string p1, "Recherche indisponible"

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 216
    :goto_0
    return-void
.end method

.method static sheet(Landroid/app/Activity;Lorg/json/JSONObject;Landroid/view/View;)V
    .locals 9

    .line 139
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p2

    iget p2, p2, Landroid/util/DisplayMetrics;->density:F

    .line 140
    new-instance v0, Landroid/app/Dialog;

    invoke-direct {v0, p0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    .line 141
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/Dialog;->requestWindowFeature(I)Z

    .line 142
    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 143
    new-instance v3, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v3}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const v4, -0xe0e0de

    invoke-virtual {v3, v4}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 144
    const/high16 v4, 0x41b00000    # 22.0f

    mul-float/2addr v4, p2

    const/16 v5, 0x8

    new-array v5, v5, [F

    const/4 v6, 0x0

    aput v4, v5, v6

    aput v4, v5, v1

    const/4 v7, 0x2

    aput v4, v5, v7

    const/4 v7, 0x3

    aput v4, v5, v7

    const/4 v4, 0x4

    const/4 v7, 0x0

    aput v7, v5, v4

    const/4 v4, 0x5

    aput v7, v5, v4

    const/4 v4, 0x6

    aput v7, v5, v4

    const/4 v4, 0x7

    aput v7, v5, v4

    invoke-virtual {v3, v5}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadii([F)V

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 145
    const/high16 v3, 0x41400000    # 12.0f

    mul-float/2addr v3, p2

    float-to-int v3, v3

    const/high16 v4, 0x41e00000    # 28.0f

    mul-float/2addr v4, p2

    float-to-int v4, v4

    invoke-virtual {v2, v6, v3, v6, v4}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 146
    new-instance v3, Landroid/view/View;

    invoke-direct {v3, p0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    new-instance v4, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v4}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const v5, 0x66ffffff

    invoke-virtual {v4, v5}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    const/high16 v5, 0x40400000    # 3.0f

    mul-float/2addr v5, p2

    invoke-virtual {v4, v5}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    invoke-virtual {v3, v4}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 147
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v5, 0x42200000    # 40.0f

    mul-float/2addr v5, p2

    float-to-int v5, v5

    const/high16 v7, 0x40a00000    # 5.0f

    mul-float/2addr v7, p2

    float-to-int v7, v7

    invoke-direct {v4, v5, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    iput v1, v4, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    const/high16 v5, 0x41a00000    # 20.0f

    mul-float/2addr v5, p2

    float-to-int v5, v5

    iput v5, v4, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    invoke-virtual {v2, v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 148
    new-instance v3, Landroid/widget/LinearLayout;

    invoke-direct {v3, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/16 v4, 0x10

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setGravity(I)V

    invoke-virtual {v3, v5, v6, v5, v6}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 149
    new-instance v4, Landroid/widget/ImageView;

    invoke-direct {v4, p0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    sget-object v5, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 150
    const/high16 v5, 0x42600000    # 56.0f

    :try_start_0
    const-string v7, "image"

    const-string v8, ""

    invoke-virtual {p1, v7, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    mul-float v8, p2, v5

    float-to-int v8, v8

    invoke-static {v4, v7, v8}, Lcom/melodix/music/PreviewPlayerController;->cover(Landroid/widget/ImageView;Ljava/lang/String;I)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v7

    .line 151
    :goto_0
    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    mul-float/2addr v5, p2

    float-to-int v5, v5

    invoke-direct {v7, v5, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v3, v4, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 152
    new-instance v4, Landroid/widget/LinearLayout;

    invoke-direct {v4, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v4, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/high16 v5, 0x41800000    # 16.0f

    mul-float/2addr v5, p2

    float-to-int v5, v5

    invoke-virtual {v4, v5, v6, v6, v6}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 153
    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->title(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v5

    const/16 v7, 0x11

    const v8, -0xa0a09

    invoke-static {p0, v5, v7, v8, v6}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->text(Landroid/app/Activity;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->artist(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v5

    const/16 v7, 0xe

    const v8, -0x5e5e56

    invoke-static {p0, v5, v7, v8, v6}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->text(Landroid/app/Activity;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v5

    const/high16 v7, 0x40800000    # 4.0f

    mul-float/2addr v7, p2

    float-to-int v7, v7

    invoke-virtual {v5, v6, v7, v6, v6}, Landroid/widget/TextView;->setPadding(IIII)V

    invoke-virtual {v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 154
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v7, 0x3f800000    # 1.0f

    const/4 v8, -0x2

    invoke-direct {v5, v6, v8, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v3, v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 155
    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 156
    new-instance v3, Landroid/view/View;

    invoke-direct {v3, p0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    const v4, 0x33ffffff

    invoke-virtual {v3, v4}, Landroid/view/View;->setBackgroundColor(I)V

    .line 157
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    float-to-int v5, p2

    invoke-static {v1, v5}, Ljava/lang/Math;->max(II)I

    move-result v5

    const/4 v7, -0x1

    invoke-direct {v4, v7, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v5, 0x41900000    # 18.0f

    mul-float/2addr v5, p2

    float-to-int v5, v5

    iput v5, v4, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    const/high16 v5, 0x40c00000    # 6.0f

    mul-float/2addr p2, v5

    float-to-int p2, p2

    iput p2, v4, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    invoke-virtual {v2, v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 158
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "https://open.spotify.com/track/"

    invoke-virtual {p2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->trackUri(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "spotify:track:"

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 159
    new-instance v3, Lcom/melodix/music/PreviewPlayerControllerPlayAll$7;

    invoke-direct {v3, p2, p0}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$7;-><init>(Ljava/lang/String;Landroid/app/Activity;)V

    const-string p2, "Partager"

    invoke-static {p0, v6, p2, v3, v0}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->item(Landroid/app/Activity;ILjava/lang/String;Ljava/lang/Runnable;Landroid/app/Dialog;)Landroid/view/View;

    move-result-object p2

    invoke-virtual {v2, p2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 163
    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->artist(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object p1

    const-string p2, ","

    invoke-virtual {p1, p2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    aget-object p1, p1, v6

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 164
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p2

    if-nez p2, :cond_0

    new-instance p2, Lcom/melodix/music/PreviewPlayerControllerPlayAll$8;

    invoke-direct {p2, p0, p1}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$8;-><init>(Landroid/app/Activity;Ljava/lang/String;)V

    const-string p1, "Acc\u00e9der \u00e0 l\'artiste"

    invoke-static {p0, v1, p1, p2, v0}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->item(Landroid/app/Activity;ILjava/lang/String;Ljava/lang/Runnable;Landroid/app/Dialog;)Landroid/view/View;

    move-result-object p0

    invoke-virtual {v2, p0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 165
    :cond_0
    invoke-virtual {v0, v2}, Landroid/app/Dialog;->setContentView(Landroid/view/View;)V

    .line 166
    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object p0

    .line 167
    if-eqz p0, :cond_1

    new-instance p1, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {p1, v6}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {p0, p1}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    const/16 p1, 0x50

    invoke-virtual {p0, p1}, Landroid/view/Window;->setGravity(I)V

    .line 168
    invoke-virtual {p0, v7, v8}, Landroid/view/Window;->setLayout(II)V

    const p1, 0x1030056

    invoke-virtual {p0, p1}, Landroid/view/Window;->setWindowAnimations(I)V

    const p1, 0x3f19999a    # 0.6f

    invoke-virtual {p0, p1}, Landroid/view/Window;->setDimAmount(F)V

    .line 169
    :cond_1
    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    .line 170
    return-void
.end method

.method static tap(Landroid/view/View;Ljava/lang/String;)V
    .locals 0

    .line 225
    invoke-static {p0, p1}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->find(Landroid/view/View;Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object p0

    :goto_0
    if-eqz p0, :cond_2

    .line 226
    invoke-virtual {p0}, Landroid/view/View;->isClickable()Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Landroid/view/View;->performClick()Z

    return-void

    .line 225
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

    .line 227
    :cond_2
    return-void
.end method

.method static text(Landroid/app/Activity;Ljava/lang/String;IIZ)Landroid/widget/TextView;
    .locals 1

    .line 172
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    int-to-float p0, p2

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextSize(F)V

    invoke-virtual {v0, p3}, Landroid/widget/TextView;->setTextColor(I)V

    const/4 p0, 0x1

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 173
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

    .line 204
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

.method static trackUri(Lorg/json/JSONObject;)Ljava/lang/String;
    .locals 3

    .line 202
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
