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

    .line 22
    :cond_1
    const-string v1, "PLAYLIST"

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->find(Landroid/view/View;Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v1

    if-nez v1, :cond_2

    const-string v1, "VOTRE BIBLIOTH\u00c8QUE"

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->find(Landroid/view/View;Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v1

    .line 23
    :cond_2
    if-eqz v1, :cond_b

    invoke-virtual {v1}, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    instance-of v2, v2, Landroid/view/ViewGroup;

    if-nez v2, :cond_3

    goto/16 :goto_4

    .line 24
    :cond_3
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->density:F

    .line 27
    new-instance v3, Landroid/widget/LinearLayout;

    invoke-direct {v3, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 28
    invoke-virtual {v3, p1}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    const/4 p1, 0x0

    invoke-virtual {v3, p1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 29
    new-instance v4, Landroid/view/ViewGroup$MarginLayoutParams;

    const/4 v5, -0x1

    const/4 v6, -0x2

    invoke-direct {v4, v5, v6}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(II)V

    .line 30
    const/high16 v5, 0x41600000    # 14.0f

    mul-float/2addr v5, v2

    float-to-int v5, v5

    iput v5, v4, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 31
    const/4 v4, 0x1

    invoke-static {p0, v4}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->icon(Landroid/app/Activity;Z)Landroid/view/View;

    move-result-object v5

    const-string v6, "Lire la playlist"

    invoke-virtual {v5, v6}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 32
    new-instance v6, Lcom/melodix/music/PreviewPlayerControllerPlayAll$1;

    invoke-direct {v6, v0}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$1;-><init>(Landroid/view/View;)V

    invoke-virtual {v5, v6}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 38
    invoke-static {p0, p1}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->icon(Landroid/app/Activity;Z)Landroid/view/View;

    move-result-object p0

    const-string v6, "Lecture al\u00e9atoire"

    invoke-virtual {p0, v6}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 41
    new-instance v6, Lcom/melodix/music/PreviewPlayerControllerPlayAll$2;

    invoke-direct {v6}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$2;-><init>()V

    invoke-virtual {p0, v6}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 45
    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v7, 0x42400000    # 48.0f

    mul-float/2addr v7, v2

    float-to-int v7, v7

    const/high16 v8, 0x3f800000    # 1.0f

    invoke-direct {v6, p1, v7, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    const/high16 v9, 0x40c00000    # 6.0f

    mul-float/2addr v9, v2

    float-to-int v9, v9

    iput v9, v6, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 46
    new-instance v10, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v10, p1, v7, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    iput v9, v10, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 47
    invoke-virtual {v3, v5, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v3, p0, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 50
    nop

    .line 51
    move-object p0, v1

    :goto_1
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v5

    instance-of v5, v5, Landroid/view/ViewGroup;

    if-eqz v5, :cond_6

    .line 52
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v5

    check-cast v5, Landroid/view/ViewGroup;

    .line 53
    instance-of v6, v5, Landroid/widget/LinearLayout;

    if-eqz v6, :cond_4

    move-object v6, v5

    check-cast v6, Landroid/widget/LinearLayout;

    invoke-virtual {v6}, Landroid/widget/LinearLayout;->getOrientation()I

    move-result v6

    if-ne v6, v4, :cond_4

    instance-of v6, p0, Landroid/widget/LinearLayout;

    if-eqz v6, :cond_4

    move-object v6, p0

    check-cast v6, Landroid/widget/LinearLayout;

    .line 54
    invoke-virtual {v6}, Landroid/widget/LinearLayout;->getOrientation()I

    move-result v6

    if-nez v6, :cond_4

    goto :goto_3

    .line 55
    :cond_4
    if-ne v5, v0, :cond_5

    goto :goto_2

    .line 51
    :cond_5
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    check-cast p0, Landroid/view/View;

    goto :goto_1

    .line 57
    :cond_6
    :goto_2
    const/4 v5, 0x0

    :goto_3
    if-nez v5, :cond_7

    invoke-virtual {v1}, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    move-object v5, p0

    check-cast v5, Landroid/view/ViewGroup;

    .line 59
    :cond_7
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    sget-wide v6, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->lastAdd:J

    sub-long v6, v0, v6

    const-wide/16 v9, 0xbb8

    cmp-long p0, v6, v9

    if-lez p0, :cond_8

    move p1, v4

    :cond_8
    sput-wide v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->lastAdd:J

    .line 60
    const/4 p0, 0x0

    if-eqz p1, :cond_9

    invoke-virtual {v3, p0}, Landroid/widget/LinearLayout;->setAlpha(F)V

    const/high16 v0, 0x41000000    # 8.0f

    mul-float/2addr v2, v0

    invoke-virtual {v3, v2}, Landroid/widget/LinearLayout;->setTranslationY(F)V

    .line 61
    :cond_9
    invoke-virtual {v5, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 62
    if-eqz p1, :cond_a

    invoke-virtual {v3}, Landroid/widget/LinearLayout;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1, v8}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    const-wide/16 v0, 0x104

    invoke-virtual {p0, v0, v1}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 63
    :cond_a
    return-void

    .line 23
    :cond_b
    :goto_4
    return-void
.end method

.method static addMenus(Landroid/app/Activity;Landroid/view/View;Lorg/json/JSONArray;)V
    .locals 8

    .line 110
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 111
    const/4 v1, 0x0

    move v2, v1

    :goto_0
    invoke-virtual {p2}, Lorg/json/JSONArray;->length()I

    move-result v3

    const-string v4, ""

    if-ge v2, v3, :cond_1

    invoke-virtual {p2, v2}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    if-eqz v3, :cond_0

    const-string v5, "uri"

    invoke-virtual {v3, v5, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "spotify:track:"

    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 112
    :cond_1
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p2

    iget p2, p2, Landroid/util/DisplayMetrics;->density:F

    .line 113
    nop

    :goto_1
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_7

    .line 114
    add-int/lit8 v2, v1, 0x1

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {p1, v3}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->find(Landroid/view/View;Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v3

    if-nez v3, :cond_2

    goto :goto_4

    .line 115
    :cond_2
    :goto_2
    if-eqz v3, :cond_4

    invoke-virtual {v3}, Landroid/view/View;->isClickable()Z

    move-result v5

    if-nez v5, :cond_4

    invoke-virtual {v3}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v5

    instance-of v5, v5, Landroid/view/View;

    if-eqz v5, :cond_3

    invoke-virtual {v3}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    goto :goto_2

    :cond_3
    const/4 v3, 0x0

    goto :goto_2

    .line 116
    :cond_4
    instance-of v5, v3, Landroid/view/ViewGroup;

    if-eqz v5, :cond_6

    const-string v5, "melodixDots"

    invoke-virtual {v3, v5}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v6

    if-eqz v6, :cond_5

    goto :goto_3

    .line 117
    :cond_5
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/json/JSONObject;

    .line 118
    new-instance v6, Lcom/melodix/music/PreviewPlayerControllerPlayAll$5;

    invoke-direct {v6, p0, p2}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$5;-><init>(Landroid/content/Context;F)V

    .line 123
    invoke-virtual {v6, v5}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Plus d\'options pour "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v7, "title"

    invoke-virtual {v1, v7, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v6, v5}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 124
    new-instance v5, Lcom/melodix/music/PreviewPlayerControllerPlayAll$6;

    invoke-direct {v5, p0, v1, v3}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$6;-><init>(Landroid/app/Activity;Lorg/json/JSONObject;Landroid/view/View;)V

    invoke-virtual {v6, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 125
    check-cast v3, Landroid/view/ViewGroup;

    new-instance v1, Landroid/view/ViewGroup$LayoutParams;

    const/high16 v5, 0x42100000    # 36.0f

    mul-float/2addr v5, p2

    float-to-int v5, v5

    const/high16 v7, 0x42400000    # 48.0f

    mul-float/2addr v7, p2

    float-to-int v7, v7

    invoke-direct {v1, v5, v7}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v3, v6, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 113
    :cond_6
    :goto_3
    move v1, v2

    goto :goto_1

    .line 127
    :cond_7
    :goto_4
    return-void
.end method

.method static find(Landroid/view/View;Ljava/lang/String;)Landroid/widget/TextView;
    .locals 2

    .line 189
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

    .line 190
    :cond_0
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_2

    check-cast p0, Landroid/view/ViewGroup;

    .line 191
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

    .line 192
    :cond_2
    const/4 p0, 0x0

    return-object p0
.end method

.method static icon(Landroid/app/Activity;Z)Landroid/view/View;
    .locals 2

    .line 66
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    .line 67
    new-instance v1, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;

    invoke-direct {v1, p0, p1, v0}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;-><init>(Landroid/content/Context;ZF)V

    .line 96
    const/4 p0, 0x1

    invoke-virtual {v1, p0}, Landroid/view/View;->setClickable(Z)V

    .line 98
    new-instance p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$4;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$4;-><init>()V

    invoke-virtual {v1, p0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 105
    return-object v1
.end method

.method static item(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;Landroid/app/Dialog;)Landroid/view/View;
    .locals 8

    .line 169
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    .line 170
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/16 v2, 0x10

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 171
    const/high16 v3, 0x41600000    # 14.0f

    mul-float/2addr v3, v0

    float-to-int v3, v3

    const/4 v4, 0x0

    invoke-virtual {v1, v4, v3, v4, v3}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->setClickable(Z)V

    .line 172
    const/16 v3, 0x14

    const v5, -0xa0a09

    invoke-static {p0, p1, v3, v5, v4}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->text(Landroid/app/Activity;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object p1

    const/16 v3, 0x11

    invoke-virtual {p1, v3}, Landroid/widget/TextView;->setGravity(I)V

    .line 173
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v6, 0x42000000    # 32.0f

    mul-float/2addr v6, v0

    float-to-int v6, v6

    const/4 v7, -0x2

    invoke-direct {v3, v6, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, p1, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 174
    invoke-static {p0, p2, v2, v5, v4}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->text(Landroid/app/Activity;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object p0

    const/high16 p1, 0x41900000    # 18.0f

    mul-float/2addr v0, p1

    float-to-int p1, v0

    invoke-virtual {p0, p1, v4, v4, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    invoke-virtual {v1, p0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 175
    new-instance p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$10;

    invoke-direct {p0, p4, p3}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$10;-><init>(Landroid/app/Dialog;Ljava/lang/Runnable;)V

    invoke-virtual {v1, p0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 176
    return-object v1
.end method

.method static random(Landroid/view/View;)V
    .locals 3

    .line 181
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

    .line 182
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

    .line 183
    :cond_1
    return-void
.end method

.method static sheet(Landroid/app/Activity;Lorg/json/JSONObject;Landroid/view/View;)V
    .locals 12

    .line 129
    const-string v0, ""

    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    .line 130
    new-instance v2, Landroid/app/Dialog;

    invoke-direct {v2, p0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    .line 131
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/app/Dialog;->requestWindowFeature(I)Z

    .line 132
    new-instance v4, Landroid/widget/LinearLayout;

    invoke-direct {v4, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v4, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 133
    new-instance v5, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v5}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const v6, -0xe0e0de

    invoke-virtual {v5, v6}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 134
    const/high16 v6, 0x41900000    # 18.0f

    mul-float/2addr v6, v1

    const/16 v7, 0x8

    new-array v7, v7, [F

    const/4 v8, 0x0

    aput v6, v7, v8

    aput v6, v7, v3

    const/4 v9, 0x2

    aput v6, v7, v9

    const/4 v9, 0x3

    aput v6, v7, v9

    const/4 v6, 0x4

    const/4 v9, 0x0

    aput v9, v7, v6

    const/4 v6, 0x5

    aput v9, v7, v6

    const/4 v6, 0x6

    aput v9, v7, v6

    const/4 v6, 0x7

    aput v9, v7, v6

    invoke-virtual {v5, v7}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadii([F)V

    invoke-virtual {v4, v5}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 135
    const/high16 v5, 0x41a00000    # 20.0f

    mul-float/2addr v5, v1

    float-to-int v5, v5

    const/high16 v6, 0x41200000    # 10.0f

    mul-float/2addr v6, v1

    float-to-int v6, v6

    const/high16 v7, 0x41c00000    # 24.0f

    mul-float/2addr v7, v1

    float-to-int v7, v7

    invoke-virtual {v4, v5, v6, v5, v7}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 136
    new-instance v5, Landroid/view/View;

    invoke-direct {v5, p0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    new-instance v6, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v6}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const v7, 0x66ffffff

    invoke-virtual {v6, v7}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    const/high16 v7, 0x40400000    # 3.0f

    mul-float/2addr v7, v1

    invoke-virtual {v6, v7}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    invoke-virtual {v5, v6}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 137
    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v7, 0x42200000    # 40.0f

    mul-float/2addr v7, v1

    float-to-int v7, v7

    const/high16 v9, 0x40a00000    # 5.0f

    mul-float/2addr v9, v1

    float-to-int v9, v9

    invoke-direct {v6, v7, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    iput v3, v6, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    const/high16 v7, 0x41600000    # 14.0f

    mul-float/2addr v7, v1

    float-to-int v7, v7

    iput v7, v6, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    invoke-virtual {v4, v5, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 138
    new-instance v5, Landroid/widget/LinearLayout;

    invoke-direct {v5, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/16 v6, 0x10

    invoke-virtual {v5, v6}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 139
    new-instance v6, Landroid/widget/ImageView;

    invoke-direct {v6, p0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    sget-object v9, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v6, v9}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 140
    const/high16 v9, 0x42600000    # 56.0f

    :try_start_0
    const-string v10, "image"

    invoke-virtual {p1, v10, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    mul-float v11, v1, v9

    float-to-int v11, v11

    invoke-static {v6, v10, v11}, Lcom/melodix/music/PreviewPlayerController;->cover(Landroid/widget/ImageView;Ljava/lang/String;I)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v10

    .line 141
    :goto_0
    new-instance v10, Landroid/widget/LinearLayout$LayoutParams;

    mul-float/2addr v9, v1

    float-to-int v9, v9

    invoke-direct {v10, v9, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v5, v6, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 142
    new-instance v6, Landroid/widget/LinearLayout;

    invoke-direct {v6, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v6, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    invoke-virtual {v6, v7, v8, v8, v8}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 143
    const-string v9, "title"

    invoke-virtual {p1, v9, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    const/16 v10, 0x11

    const v11, -0xa0a09

    invoke-static {p0, v9, v10, v11, v3}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->text(Landroid/app/Activity;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v9

    invoke-virtual {v6, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    const-string v9, "subtitle"

    invoke-virtual {p1, v9, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    const/16 v10, 0xe

    const v11, -0x5e5e56

    invoke-static {p0, v9, v10, v11, v8}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->text(Landroid/app/Activity;Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v9

    invoke-virtual {v6, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 144
    new-instance v9, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v10, 0x3f800000    # 1.0f

    const/4 v11, -0x2

    invoke-direct {v9, v8, v11, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v5, v6, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 145
    invoke-virtual {v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 146
    new-instance v5, Landroid/view/View;

    invoke-direct {v5, p0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    const v6, 0x22ffffff

    invoke-virtual {v5, v6}, Landroid/view/View;->setBackgroundColor(I)V

    .line 147
    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    float-to-int v1, v1

    invoke-static {v3, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    const/4 v3, -0x1

    invoke-direct {v6, v3, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    iput v7, v6, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    iput v7, v6, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    invoke-virtual {v4, v5, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 148
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "https://open.spotify.com/track/"

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v5, "uri"

    invoke-virtual {p1, v5, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "spotify:track:"

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 149
    new-instance v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$7;

    invoke-direct {v0, p2}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$7;-><init>(Landroid/view/View;)V

    const-string p2, "\u25b6"

    const-string v1, "Lire"

    invoke-static {p0, p2, v1, v0, v2}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->item(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;Landroid/app/Dialog;)Landroid/view/View;

    move-result-object p2

    invoke-virtual {v4, p2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 150
    new-instance p2, Lcom/melodix/music/PreviewPlayerControllerPlayAll$8;

    invoke-direct {p2, p1, p0}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$8;-><init>(Ljava/lang/String;Landroid/app/Activity;)V

    const-string v0, "\u2197"

    const-string v1, "Partager"

    invoke-static {p0, v0, v1, p2, v2}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->item(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;Landroid/app/Dialog;)Landroid/view/View;

    move-result-object p2

    invoke-virtual {v4, p2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 154
    new-instance p2, Lcom/melodix/music/PreviewPlayerControllerPlayAll$9;

    invoke-direct {p2, p0, p1}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$9;-><init>(Landroid/app/Activity;Ljava/lang/String;)V

    const-string p1, "\u29c9"

    const-string v0, "Copier le lien"

    invoke-static {p0, p1, v0, p2, v2}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->item(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;Landroid/app/Dialog;)Landroid/view/View;

    move-result-object p0

    invoke-virtual {v4, p0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 158
    invoke-virtual {v2, v4}, Landroid/app/Dialog;->setContentView(Landroid/view/View;)V

    .line 159
    invoke-virtual {v2}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object p0

    .line 160
    if-eqz p0, :cond_0

    new-instance p1, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {p1, v8}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {p0, p1}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    const/16 p1, 0x50

    invoke-virtual {p0, p1}, Landroid/view/Window;->setGravity(I)V

    .line 161
    invoke-virtual {p0, v3, v11}, Landroid/view/Window;->setLayout(II)V

    const p1, 0x1030056

    invoke-virtual {p0, p1}, Landroid/view/Window;->setWindowAnimations(I)V

    const p1, 0x3f0ccccd    # 0.55f

    invoke-virtual {p0, p1}, Landroid/view/Window;->setDimAmount(F)V

    .line 162
    :cond_0
    invoke-virtual {v2}, Landroid/app/Dialog;->show()V

    .line 163
    return-void
.end method

.method static tap(Landroid/view/View;Ljava/lang/String;)V
    .locals 0

    .line 185
    invoke-static {p0, p1}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->find(Landroid/view/View;Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object p0

    :goto_0
    if-eqz p0, :cond_2

    .line 186
    invoke-virtual {p0}, Landroid/view/View;->isClickable()Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Landroid/view/View;->performClick()Z

    return-void

    .line 185
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

    .line 187
    :cond_2
    return-void
.end method

.method static text(Landroid/app/Activity;Ljava/lang/String;IIZ)Landroid/widget/TextView;
    .locals 1

    .line 165
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    int-to-float p0, p2

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextSize(F)V

    invoke-virtual {v0, p3}, Landroid/widget/TextView;->setTextColor(I)V

    const/4 p0, 0x1

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 166
    sget-object p0, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    if-eqz p4, :cond_0

    sget-object p0, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    :cond_0
    return-object v0
.end method
