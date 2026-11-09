.class public final Lcom/melodix/music/NativeSessionCard;
.super Landroid/widget/LinearLayout;
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    return-void
.end method
.method protected onMeasure(II)V
    .locals 3
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v0
    iget v0, v0, Landroid/util/DisplayMetrics;->density:F
    const/high16 v1, 0x43f00000    # 480dp maximum, never a fixed minimum width
    mul-float/2addr v0, v1
    float-to-int v0, v0
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I
    move-result v1
    if-le v1, v0, :measure
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I
    move-result v2
    invoke-static {v0, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I
    move-result p1
    :measure
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V
    return-void
.end method
