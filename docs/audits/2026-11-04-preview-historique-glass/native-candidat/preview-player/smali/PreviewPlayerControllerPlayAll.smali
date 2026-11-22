.class final Lcom/melodix/music/PreviewPlayerControllerPlayAll;
.super Ljava/lang/Object;
.source "PreviewPlayerControllerPlayAll.java"


# static fields
.field static final TAG:Ljava/lang/String; = "melodixPlayAll"

.field private static lastAdd:J

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

.method static add(Landroid/app/Activity;)V
    .locals 14

    .line 18
    const v0, 0x7f09022f

    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 19
    if-eqz v0, :cond_b

    const-string v1, "melodixPlayAll"

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v2

    if-eqz v2, :cond_0

    goto/16 :goto_4

    .line 20
    :cond_0
    const-string v2, "PLAYLIST"

    invoke-static {v0, v2}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->find(Landroid/view/View;Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v2

    if-nez v2, :cond_1

    const-string v2, "VOTRE BIBLIOTH\u00c8QUE"

    invoke-static {v0, v2}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->find(Landroid/view/View;Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v2

    .line 21
    :cond_1
    if-eqz v2, :cond_a

    invoke-virtual {v2}, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    instance-of v3, v3, Landroid/view/ViewGroup;

    if-nez v3, :cond_2

    goto/16 :goto_3

    .line 22
    :cond_2
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    iget v3, v3, Landroid/util/DisplayMetrics;->density:F

    .line 25
    new-instance v4, Landroid/widget/LinearLayout;

    invoke-direct {v4, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 26
    invoke-virtual {v4, v1}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    const/4 v1, 0x0

    invoke-virtual {v4, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 27
    new-instance v5, Landroid/view/ViewGroup$MarginLayoutParams;

    const/4 v6, -0x1

    const/4 v7, -0x2

    invoke-direct {v5, v6, v7}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(II)V

    .line 28
    const/high16 v6, 0x41600000    # 14.0f

    mul-float/2addr v6, v3

    float-to-int v6, v6

    iput v6, v5, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    invoke-virtual {v4, v5}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 29
    const/4 v5, 0x1

    invoke-static {p0, v5}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->icon(Landroid/app/Activity;Z)Landroid/view/View;

    move-result-object v6

    const-string v7, "Lire la playlist"

    invoke-virtual {v6, v7}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 30
    new-instance v7, Lcom/melodix/music/PreviewPlayerControllerPlayAll$1;

    invoke-direct {v7, v0}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$1;-><init>(Landroid/view/View;)V

    invoke-virtual {v6, v7}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 31
    invoke-static {p0, v1}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->icon(Landroid/app/Activity;Z)Landroid/view/View;

    move-result-object p0

    const-string v7, "Lecture al\u00e9atoire"

    invoke-virtual {p0, v7}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 34
    new-instance v7, Lcom/melodix/music/PreviewPlayerControllerPlayAll$2;

    invoke-direct {v7, v0}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$2;-><init>(Landroid/view/View;)V

    invoke-virtual {p0, v7}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 38
    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v8, 0x42400000    # 48.0f

    mul-float/2addr v8, v3

    float-to-int v8, v8

    const/high16 v9, 0x3f800000    # 1.0f

    invoke-direct {v7, v1, v8, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    const/high16 v10, 0x40c00000    # 6.0f

    mul-float/2addr v10, v3

    float-to-int v10, v10

    iput v10, v7, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 39
    new-instance v11, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v11, v1, v8, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    iput v10, v11, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 40
    invoke-virtual {v4, v6, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v4, p0, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 43
    nop

    .line 44
    move-object p0, v2

    :goto_0
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v6

    instance-of v6, v6, Landroid/view/ViewGroup;

    if-eqz v6, :cond_5

    .line 45
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    .line 46
    instance-of v7, v6, Landroid/widget/LinearLayout;

    if-eqz v7, :cond_3

    move-object v7, v6

    check-cast v7, Landroid/widget/LinearLayout;

    invoke-virtual {v7}, Landroid/widget/LinearLayout;->getOrientation()I

    move-result v7

    if-ne v7, v5, :cond_3

    instance-of v7, p0, Landroid/widget/LinearLayout;

    if-eqz v7, :cond_3

    move-object v7, p0

    check-cast v7, Landroid/widget/LinearLayout;

    .line 47
    invoke-virtual {v7}, Landroid/widget/LinearLayout;->getOrientation()I

    move-result v7

    if-nez v7, :cond_3

    goto :goto_2

    .line 48
    :cond_3
    if-ne v6, v0, :cond_4

    goto :goto_1

    .line 44
    :cond_4
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    check-cast p0, Landroid/view/View;

    goto :goto_0

    .line 50
    :cond_5
    :goto_1
    const/4 v6, 0x0

    :goto_2
    if-nez v6, :cond_6

    invoke-virtual {v2}, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    move-object v6, p0

    check-cast v6, Landroid/view/ViewGroup;

    .line 52
    :cond_6
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v7

    sget-wide v10, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->lastAdd:J

    sub-long v10, v7, v10

    const-wide/16 v12, 0xbb8

    cmp-long p0, v10, v12

    if-lez p0, :cond_7

    move v1, v5

    :cond_7
    sput-wide v7, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->lastAdd:J

    .line 53
    const/4 p0, 0x0

    if-eqz v1, :cond_8

    invoke-virtual {v4, p0}, Landroid/widget/LinearLayout;->setAlpha(F)V

    const/high16 v0, 0x41000000    # 8.0f

    mul-float/2addr v3, v0

    invoke-virtual {v4, v3}, Landroid/widget/LinearLayout;->setTranslationY(F)V

    .line 54
    :cond_8
    invoke-virtual {v6, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 55
    if-eqz v1, :cond_9

    invoke-virtual {v4}, Landroid/widget/LinearLayout;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v9}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    const-wide/16 v0, 0x104

    invoke-virtual {p0, v0, v1}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 56
    :cond_9
    return-void

    .line 21
    :cond_a
    :goto_3
    return-void

    .line 19
    :cond_b
    :goto_4
    return-void
.end method

.method static find(Landroid/view/View;Ljava/lang/String;)Landroid/widget/TextView;
    .locals 2

    .line 109
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

    .line 110
    :cond_0
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_2

    check-cast p0, Landroid/view/ViewGroup;

    .line 111
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

    .line 112
    :cond_2
    const/4 p0, 0x0

    return-object p0
.end method

.method static icon(Landroid/app/Activity;Z)Landroid/view/View;
    .locals 2

    .line 59
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    .line 60
    new-instance v1, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;

    invoke-direct {v1, p0, p1, v0}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;-><init>(Landroid/content/Context;ZF)V

    .line 88
    const/4 p0, 0x1

    invoke-virtual {v1, p0}, Landroid/view/View;->setClickable(Z)V

    .line 90
    new-instance p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$4;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$4;-><init>()V

    invoke-virtual {v1, p0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 97
    return-object v1
.end method

.method static random(Landroid/view/View;)V
    .locals 3

    .line 101
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

    .line 102
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

    .line 103
    :cond_1
    return-void
.end method

.method static tap(Landroid/view/View;Ljava/lang/String;)V
    .locals 0

    .line 105
    invoke-static {p0, p1}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->find(Landroid/view/View;Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object p0

    :goto_0
    if-eqz p0, :cond_2

    .line 106
    invoke-virtual {p0}, Landroid/view/View;->isClickable()Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Landroid/view/View;->performClick()Z

    return-void

    .line 105
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

    .line 107
    :cond_2
    return-void
.end method
