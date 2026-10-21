.class public final Lcom/melodix/music/NativeEmptyState;
.super Ljava/lang/Object;


# Fills a screen that has nothing to show yet. It only ever writes into an
# empty container, so a message can never be mixed with real rows, and the whole
# block is tappable: that is the only way to retry from the phone when the page
# sent nothing.
.method public static fill(Lcom/melodix/music/MainActivity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 10

    if-nez p0, :done

    const v0, 0x7f090235

    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    if-nez v1, :done

    check-cast v1, Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v2

    if-nez v2, :fill

    return-void

    :fill
    :try_start_0
    const/16 v3, 0x18

    invoke-static {p0, v3}, Lcom/melodix/music/NativeEmptyState;->dp(Landroid/content/Context;I)I

    move-result v4

    const/16 v3, 0x8

    invoke-static {p0, v3}, Lcom/melodix/music/NativeEmptyState;->dp(Landroid/content/Context;I)I

    move-result v5

    new-instance v6, Lcom/melodix/music/NativeRecheckClickListener;

    invoke-direct {v6, p0}, Lcom/melodix/music/NativeRecheckClickListener;-><init>(Lcom/melodix/music/MainActivity;)V

    new-instance v7, Landroid/widget/TextView;

    invoke-direct {v7, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v7, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v3, 0x41900000

    invoke-virtual {v7, v3}, Landroid/widget/TextView;->setTextSize(F)V

    const/4 v3, -0x1

    invoke-virtual {v7, v3}, Landroid/widget/TextView;->setTextColor(I)V

    const/4 v3, 0x0

    const/4 v8, 0x1

    invoke-virtual {v7, v3, v8}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    invoke-virtual {v7, v4, v5, v4, v5}, Landroid/view/View;->setPadding(IIII)V

    invoke-virtual {v7, v6}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v1, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    if-nez p2, :hint

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :hint

    new-instance v9, Landroid/widget/TextView;

    invoke-direct {v9, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v9, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v3, 0x41400000

    invoke-virtual {v9, v3}, Landroid/widget/TextView;->setTextSize(F)V

    const v3, -0x4c4c4d

    invoke-virtual {v9, v3}, Landroid/widget/TextView;->setTextColor(I)V

    const/16 v3, 0xc

    invoke-virtual {v9, v3}, Landroid/widget/TextView;->setMaxLines(I)V

    invoke-virtual {v9, v4, v5, v4, v5}, Landroid/view/View;->setPadding(IIII)V

    invoke-virtual {v9, v6}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v1, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    :hint
    new-instance v9, Landroid/widget/TextView;

    invoke-direct {v9, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const-string v3, "Toucher pour réessayer"

    invoke-virtual {v9, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v3, 0x41400000

    invoke-virtual {v9, v3}, Landroid/widget/TextView;->setTextSize(F)V

    const v3, -0x4c4c4d

    invoke-virtual {v9, v3}, Landroid/widget/TextView;->setTextColor(I)V

    const/4 v3, 0x0

    invoke-virtual {v9, v3, v8}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    invoke-virtual {v9, v4, v5, v4, v5}, Landroid/view/View;->setPadding(IIII)V

    invoke-virtual {v9, v6}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v1, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :done

    :catch_0
    move-exception v3

    :done
    return-void
.end method


.method private static dp(Landroid/content/Context;I)I
    .locals 3

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    int-to-float v1, p1

    mul-float/2addr v1, v0

    const/high16 v2, 0x3f000000

    add-float/2addr v1, v2

    float-to-int v1, v1

    return v1
.end method
