.class public final Lcom/melodix/music/NativeSkeleton;
.super Ljava/lang/Object;

# Decorative rows are attached only to a genuine loading state. Their moving
# glint is owned by the view and disappears when the loading tree is removed.
.method public static attach(Landroid/content/Context;Landroid/widget/LinearLayout;)V
    .locals 9
    if-eqz p0, :done
    if-eqz p1, :done
    :try_start
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v1
    iget v1, v1, Landroid/util/DisplayMetrics;->density:F
    const/high16 v2, 0x42800000
    mul-float/2addr v2, v1
    float-to-int v2, v2
    const/high16 v3, 0x42000000
    mul-float/2addr v3, v1
    float-to-int v3, v3
    const/high16 v4, 0x41000000
    mul-float/2addr v4, v1
    float-to-int v4, v4
    const-string v5, "native_skeleton_shimmer"
    const-string v6, "anim"
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;
    move-result-object v7
    invoke-virtual {v0, v5, v6, v7}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    move-result v5
    const/4 v6, 0x0
    :loop
    const/4 v7, 0x3
    if-ge v6, v7, :done
    new-instance v7, Landroid/widget/FrameLayout;
    invoke-direct {v7, p0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V
    const-string v8, "native_skeleton_row"
    invoke-static {p0, v7, v8}, Lcom/melodix/music/NativeUiRowFactory;->applyDrawableBackground(Landroid/content/Context;Landroid/view/View;Ljava/lang/String;)V
    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v0, -0x1
    invoke-direct {v8, v0, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    iput v4, v8, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I
    invoke-virtual {p1, v7, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    new-instance v8, Landroid/view/View;
    invoke-direct {v8, p0}, Landroid/view/View;-><init>(Landroid/content/Context;)V
    const-string v0, "native_skeleton_glint"
    invoke-static {p0, v8, v0}, Lcom/melodix/music/NativeUiRowFactory;->applyDrawableBackground(Landroid/content/Context;Landroid/view/View;Ljava/lang/String;)V
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;
    const/4 v1, -0x1
    invoke-direct {v0, v3, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V
    invoke-virtual {v7, v8, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    if-eqz v5, :next
    invoke-static {p0, v5}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;
    move-result-object v0
    invoke-virtual {v8, v0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V
    :next
    add-int/lit8 v6, v6, 0x1
    goto :loop
    :try_end
    .catch Ljava/lang/Throwable; {:try_start .. :try_end} :caught
    :done
    return-void
    :caught
    move-exception v0
    return-void
.end method

.method public static reveal(Landroid/view/View;I)V
    .locals 4
    if-eqz p0, :reveal_done
    const/high16 v0, 0x3f600000
    invoke-virtual {p0, v0}, Landroid/view/View;->setAlpha(F)V
    invoke-virtual {p0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    const/high16 v1, 0x3f800000
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;
    const/4 v1, 0x4
    invoke-static {p1, v1}, Ljava/lang/Math;->min(II)I
    move-result v1
    mul-int/lit8 v1, v1, 0x28
    int-to-long v1, v1
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setStartDelay(J)Landroid/view/ViewPropertyAnimator;
    const-wide/16 v1, 0xb4
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V
    :reveal_done
    return-void
.end method
