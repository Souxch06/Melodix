.class final Lcom/melodix/music/PreviewPlayerControllerPlayAll;
.super Ljava/lang/Object;
.source "PreviewPlayerControllerPlayAll.java"


# static fields
.field static final TAG:Ljava/lang/String; = "melodixPlayAll"

.field private static lastAdd:J


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

    .line 24
    new-instance v4, Landroid/widget/LinearLayout;

    invoke-direct {v4, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 25
    invoke-virtual {v4, v1}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    const/4 v1, 0x0

    invoke-virtual {v4, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const v5, 0x800015

    invoke-virtual {v4, v5}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 26
    new-instance v5, Landroid/view/ViewGroup$MarginLayoutParams;

    const/4 v6, -0x1

    const/4 v7, -0x2

    invoke-direct {v5, v6, v7}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(II)V

    .line 27
    const/high16 v6, 0x41400000    # 12.0f

    mul-float/2addr v6, v3

    float-to-int v6, v6

    iput v6, v5, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    invoke-virtual {v4, v5}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 28
    invoke-static {p0, v1}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->icon(Landroid/app/Activity;Z)Landroid/view/View;

    move-result-object v5

    const-string v6, "Lecture al\u00e9atoire"

    invoke-virtual {v5, v6}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 29
    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v7, 0x42380000    # 46.0f

    mul-float/2addr v7, v3

    float-to-int v7, v7

    invoke-direct {v6, v7, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v7, 0x41600000    # 14.0f

    mul-float/2addr v7, v3

    float-to-int v7, v7

    iput v7, v6, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 31
    new-instance v7, Lcom/melodix/music/PreviewPlayerControllerPlayAll$1;

    invoke-direct {v7, v0}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$1;-><init>(Landroid/view/View;)V

    invoke-virtual {v5, v7}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 35
    const/4 v7, 0x1

    invoke-static {p0, v7}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->icon(Landroid/app/Activity;Z)Landroid/view/View;

    move-result-object p0

    const-string v8, "Lire la playlist"

    invoke-virtual {p0, v8}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 36
    new-instance v8, Lcom/melodix/music/PreviewPlayerControllerPlayAll$2;

    invoke-direct {v8, v0}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$2;-><init>(Landroid/view/View;)V

    invoke-virtual {p0, v8}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 37
    invoke-virtual {v4, v5, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v6, 0x42600000    # 56.0f

    mul-float/2addr v6, v3

    float-to-int v6, v6

    invoke-direct {v5, v6, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v4, p0, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 40
    nop

    .line 41
    move-object p0, v2

    :goto_0
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v5

    instance-of v5, v5, Landroid/view/ViewGroup;

    if-eqz v5, :cond_5

    .line 42
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v5

    check-cast v5, Landroid/view/ViewGroup;

    .line 43
    instance-of v6, v5, Landroid/widget/LinearLayout;

    if-eqz v6, :cond_3

    move-object v6, v5

    check-cast v6, Landroid/widget/LinearLayout;

    invoke-virtual {v6}, Landroid/widget/LinearLayout;->getOrientation()I

    move-result v6

    if-ne v6, v7, :cond_3

    instance-of v6, p0, Landroid/widget/LinearLayout;

    if-eqz v6, :cond_3

    move-object v6, p0

    check-cast v6, Landroid/widget/LinearLayout;

    .line 44
    invoke-virtual {v6}, Landroid/widget/LinearLayout;->getOrientation()I

    move-result v6

    if-nez v6, :cond_3

    goto :goto_2

    .line 45
    :cond_3
    if-ne v5, v0, :cond_4

    goto :goto_1

    .line 41
    :cond_4
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    check-cast p0, Landroid/view/View;

    goto :goto_0

    .line 47
    :cond_5
    :goto_1
    const/4 v5, 0x0

    :goto_2
    if-nez v5, :cond_6

    invoke-virtual {v2}, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    move-object v5, p0

    check-cast v5, Landroid/view/ViewGroup;

    .line 49
    :cond_6
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v8

    sget-wide v10, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->lastAdd:J

    sub-long v10, v8, v10

    const-wide/16 v12, 0xbb8

    cmp-long p0, v10, v12

    if-lez p0, :cond_7

    move v1, v7

    :cond_7
    sput-wide v8, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->lastAdd:J

    .line 50
    const/4 p0, 0x0

    if-eqz v1, :cond_8

    invoke-virtual {v4, p0}, Landroid/widget/LinearLayout;->setAlpha(F)V

    const/high16 v0, 0x41000000    # 8.0f

    mul-float/2addr v3, v0

    invoke-virtual {v4, v3}, Landroid/widget/LinearLayout;->setTranslationY(F)V

    .line 51
    :cond_8
    invoke-virtual {v5, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 52
    if-eqz v1, :cond_9

    invoke-virtual {v4}, Landroid/widget/LinearLayout;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    const-wide/16 v0, 0x104

    invoke-virtual {p0, v0, v1}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 53
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

    .line 96
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

    .line 97
    :cond_0
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_2

    check-cast p0, Landroid/view/ViewGroup;

    .line 98
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

    .line 99
    :cond_2
    const/4 p0, 0x0

    return-object p0
.end method

.method static icon(Landroid/app/Activity;Z)Landroid/view/View;
    .locals 1

    .line 56
    new-instance v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;

    invoke-direct {v0, p0, p1}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;-><init>(Landroid/content/Context;Z)V

    .line 80
    const/4 p0, 0x1

    invoke-virtual {v0, p0}, Landroid/view/View;->setClickable(Z)V

    .line 82
    new-instance p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$4;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$4;-><init>()V

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 89
    return-object v0
.end method

.method static tap(Landroid/view/View;Ljava/lang/String;)V
    .locals 0

    .line 92
    invoke-static {p0, p1}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->find(Landroid/view/View;Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object p0

    :goto_0
    if-eqz p0, :cond_2

    .line 93
    invoke-virtual {p0}, Landroid/view/View;->isClickable()Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Landroid/view/View;->performClick()Z

    return-void

    .line 92
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

    .line 94
    :cond_2
    return-void
.end method
