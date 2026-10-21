.class public final Lcom/melodix/music/NativeHomePaint;
.super Ljava/lang/Object;


# Dead-simple rows: no JSON, no Picasso, no shelves. If this does not show,
# the content container itself is missing.


.method public static seed(Lcom/melodix/music/MainActivity;)V
    .locals 2

    if-eqz p0, :done

    const v0, 0x7f090235
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
    if-eqz v0, :done
    check-cast v0, Landroid/widget/LinearLayout;
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    :try_start_0
    const-string v0, "Titres likés"
    const-string v1, "spotify:collection:tracks"
    invoke-static {p0, v0, v1}, Lcom/melodix/music/NativeHomePaint;->row(Lcom/melodix/music/MainActivity;Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "Écoutés récemment"
    const-string v1, "spotify:collection:tracks"
    invoke-static {p0, v0, v1}, Lcom/melodix/music/NativeHomePaint;->row(Lcom/melodix/music/MainActivity;Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "Radios"
    const-string v1, "spotify:collection:tracks"
    invoke-static {p0, v0, v1}, Lcom/melodix/music/NativeHomePaint;->row(Lcom/melodix/music/MainActivity;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :done

    :catch_0
    move-exception v0

    :done
    return-void
.end method


.method public static row(Lcom/melodix/music/MainActivity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 9

    if-eqz p0, :done

    const v0, 0x7f090235
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
    if-eqz v0, :done
    check-cast v0, Landroid/widget/LinearLayout;

    new-instance v1, Landroid/widget/TextView;
    invoke-direct {v1, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    const/high16 v2, 0x41800000
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextSize(F)V
    const/4 v2, -0x1
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V
    const/4 v2, 0x0
    const/4 v3, 0x1
    invoke-virtual {v1, v2, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V
    const/16 v2, 0x10
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setGravity(I)V

    const/16 v4, 0x14
    invoke-static {p0, v4}, Lcom/melodix/music/NativeHomePaint;->dp(Landroid/content/Context;I)I
    move-result v4
    const/16 v5, 0x10
    invoke-static {p0, v5}, Lcom/melodix/music/NativeHomePaint;->dp(Landroid/content/Context;I)I
    move-result v5
    invoke-virtual {v1, v4, v5, v4, v5}, Landroid/view/View;->setPadding(IIII)V

    const v2, -0xe7e7e8
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundColor(I)V

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v2, -0x1
    const/4 v3, -0x2
    invoke-direct {v6, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    const/16 v2, 0x8
    invoke-static {p0, v2}, Lcom/melodix/music/NativeHomePaint;->dp(Landroid/content/Context;I)I
    move-result v2
    iput v2, v6, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I
    invoke-virtual {v1, v6}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    if-eqz p2, :add
    new-instance v7, Lcom/melodix/music/NativeRowClickListener;
    invoke-direct {v7, p0, p2, p1}, Lcom/melodix/music/NativeRowClickListener;-><init>(Lcom/melodix/music/MainActivity;Ljava/lang/String;Ljava/lang/String;)V
    invoke-virtual {v1, v7}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :add
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

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
