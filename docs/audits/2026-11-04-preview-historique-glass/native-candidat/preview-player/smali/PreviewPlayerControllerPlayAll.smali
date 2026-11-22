.class final Lcom/melodix/music/PreviewPlayerControllerPlayAll;
.super Ljava/lang/Object;
.source "PreviewPlayerControllerPlayAll.java"


# static fields
.field static final TAG:Ljava/lang/String; = "melodixPlayAll"


# direct methods
.method constructor <init>()V
    .locals 0

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static add(Landroid/app/Activity;)V
    .locals 5

    .line 17
    const v0, 0x7f09022f

    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 18
    if-eqz v0, :cond_3

    const-string v1, "melodixPlayAll"

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v2

    if-eqz v2, :cond_0

    goto :goto_1

    .line 19
    :cond_0
    const-string v2, "PLAYLIST"

    invoke-static {v0, v2}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->find(Landroid/view/View;Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v2

    .line 20
    if-eqz v2, :cond_2

    invoke-virtual {v2}, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    instance-of v3, v3, Landroid/view/ViewGroup;

    if-nez v3, :cond_1

    goto :goto_0

    .line 21
    :cond_1
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    iget v3, v3, Landroid/util/DisplayMetrics;->density:F

    .line 22
    new-instance v4, Lcom/melodix/music/PreviewPlayerControllerPlayAll$1;

    invoke-direct {v4, p0}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$1;-><init>(Landroid/content/Context;)V

    .line 32
    invoke-virtual {v4, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    const-string p0, "Lire la playlist"

    invoke-virtual {v4, p0}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    const/4 p0, 0x1

    invoke-virtual {v4, p0}, Landroid/view/View;->setClickable(Z)V

    .line 33
    new-instance p0, Landroid/view/ViewGroup$MarginLayoutParams;

    const/high16 v1, 0x42500000    # 52.0f

    mul-float/2addr v1, v3

    float-to-int v1, v1

    invoke-direct {p0, v1, v1}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(II)V

    .line 34
    const/high16 v1, 0x41400000    # 12.0f

    mul-float/2addr v3, v1

    float-to-int v1, v3

    iput v1, p0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    invoke-virtual {v4, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 35
    new-instance p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$2;

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$2;-><init>(Landroid/view/View;)V

    invoke-virtual {v4, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 40
    invoke-virtual {v2}, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    check-cast p0, Landroid/view/ViewGroup;

    invoke-virtual {p0, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 41
    return-void

    .line 20
    :cond_2
    :goto_0
    return-void

    .line 18
    :cond_3
    :goto_1
    return-void
.end method

.method static find(Landroid/view/View;Ljava/lang/String;)Landroid/widget/TextView;
    .locals 2

    .line 43
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

    .line 44
    :cond_0
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_2

    check-cast p0, Landroid/view/ViewGroup;

    .line 45
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

    .line 46
    :cond_2
    const/4 p0, 0x0

    return-object p0
.end method
