.class public final Lcom/melodix/music/NativePlayerScroll;
.super Landroid/widget/ScrollView;

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    invoke-direct {p0, p1, p2}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    return-void
.end method

# First measure everything except the artwork, including text at the active
# font scale and any optional action pills. Then spend only the remaining height
# on a square cover; a 72dp minimum allows normal scrolling on tiny screens.
.method protected final onMeasure(II)V
    .locals 11
    invoke-virtual {p0}, Landroid/widget/ScrollView;->getChildCount()I
    move-result v0
    if-eqz v0, :ordinary
    const/4 v0, 0x0
    invoke-virtual {p0, v0}, Landroid/widget/ScrollView;->getChildAt(I)Landroid/view/View;
    move-result-object v0
    instance-of v1, v0, Landroid/widget/LinearLayout;
    if-eqz v1, :ordinary
    check-cast v0, Landroid/widget/LinearLayout;
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getOrientation()I
    move-result v1
    const/4 v2, 0x1
    if-ne v1, v2, :ordinary
    const v1, 0x7f090245
    invoke-virtual {p0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v1
    if-eqz v1, :ordinary
    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v1
    instance-of v2, v1, Landroid/view/View;
    if-eqz v2, :ordinary
    check-cast v1, Landroid/view/View;
    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v2
    instance-of v3, v2, Landroid/view/View;
    if-eqz v3, :ordinary
    check-cast v2, Landroid/view/View;
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v3
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v4
    if-eqz v3, :ordinary
    if-eqz v4, :ordinary
    const/4 v5, 0x0
    iput v5, v3, Landroid/view/ViewGroup$LayoutParams;->width:I
    iput v5, v3, Landroid/view/ViewGroup$LayoutParams;->height:I
    iput v5, v4, Landroid/view/ViewGroup$LayoutParams;->width:I
    iput v5, v4, Landroid/view/ViewGroup$LayoutParams;->height:I
    invoke-virtual {v1}, Landroid/view/View;->forceLayout()V
    invoke-virtual {v2}, Landroid/view/View;->forceLayout()V
    invoke-virtual {v0}, Landroid/view/View;->forceLayout()V
    invoke-super {p0, p1, p2}, Landroid/widget/ScrollView;->onMeasure(II)V
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;
    move-result-object v5
    invoke-virtual {v5}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v5
    iget v5, v5, Landroid/util/DisplayMetrics;->density:F
    # Total halo inset: 32dp.
    const/high16 v6, 0x42000000
    mul-float/2addr v6, v5
    float-to-int v6, v6
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I
    move-result v7
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I
    move-result v8
    sub-int/2addr v7, v8
    const-string v8, "mel_player_pad_bottom"
    const/16 v9, 0x12
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;
    move-result-object v10
    invoke-static {v10, v8, v9}, Lcom/melodix/music/NativeUiRowFactory;->metric(Landroid/content/Context;Ljava/lang/String;I)I
    move-result v8
    sub-int/2addr v7, v8
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I
    move-result v8
    sub-int/2addr v7, v8
    sub-int/2addr v7, v6
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I
    move-result v8
    mul-int/lit8 v8, v8, 0x55
    div-int/lit8 v8, v8, 0x64
    invoke-static {v7, v8}, Ljava/lang/Math;->min(II)I
    move-result v7
    # The outer halo must also fit the padded width.
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I
    move-result v8
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I
    move-result v9
    sub-int/2addr v8, v9
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I
    move-result v9
    sub-int/2addr v8, v9
    sub-int/2addr v8, v6
    invoke-static {v7, v8}, Ljava/lang/Math;->min(II)I
    move-result v7
    const/high16 v8, 0x42900000
    mul-float/2addr v8, v5
    float-to-int v8, v8
    if-lt v7, v8, :scroll_padding
    const-string v9, "mel_player_pad_bottom"
    goto :padding_resolve
    :scroll_padding
    const-string v9, "mel_tab_bar_height"
    :padding_resolve
    const/16 v5, 0x40
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;
    move-result-object v10
    invoke-static {v10, v9, v5}, Lcom/melodix/music/NativeUiRowFactory;->metric(Landroid/content/Context;Ljava/lang/String;I)I
    move-result v9
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I
    move-result v5
    if-eq v5, v9, :padding_done
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I
    move-result v5
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I
    move-result v10
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I
    move-result v6
    invoke-virtual {p0, v5, v10, v6, v9}, Landroid/view/View;->setPadding(IIII)V
    # Recover the 32dp halo inset after using the scratch registers.
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;
    move-result-object v5
    invoke-virtual {v5}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v5
    iget v5, v5, Landroid/util/DisplayMetrics;->density:F
    const/high16 v6, 0x42000000
    mul-float/2addr v6, v5
    float-to-int v6, v6
    :padding_done
    invoke-static {v7, v8}, Ljava/lang/Math;->max(II)I
    move-result v7
    iput v7, v3, Landroid/view/ViewGroup$LayoutParams;->width:I
    iput v7, v3, Landroid/view/ViewGroup$LayoutParams;->height:I
    add-int/2addr v7, v6
    iput v7, v4, Landroid/view/ViewGroup$LayoutParams;->width:I
    iput v7, v4, Landroid/view/ViewGroup$LayoutParams;->height:I
    invoke-virtual {v1}, Landroid/view/View;->forceLayout()V
    invoke-virtual {v2}, Landroid/view/View;->forceLayout()V
    invoke-virtual {v0}, Landroid/view/View;->forceLayout()V
    invoke-super {p0, p1, p2}, Landroid/widget/ScrollView;->onMeasure(II)V
    return-void
    :ordinary
    invoke-super {p0, p1, p2}, Landroid/widget/ScrollView;->onMeasure(II)V
    return-void
.end method
