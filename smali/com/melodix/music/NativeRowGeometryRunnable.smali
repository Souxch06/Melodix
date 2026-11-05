.class final Lcom/melodix/music/NativeRowGeometryRunnable;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;

# MEL-BUG-001. Diagnostic only: reads geometry, never sets it. Logs the token in
# pixels, the requested minimum, the measured height, the final laid-out height,
# the LayoutParams actually applied and the parent constraints, so the gap
# between a resolved token and the final view can be demonstrated, not guessed.
.field private final view:Landroid/view/View;
.field private final tag:Ljava/lang/String;
.field private final tokenPx:I

.method public constructor <init>(Landroid/view/View;Ljava/lang/String;I)V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/melodix/music/NativeRowGeometryRunnable;->view:Landroid/view/View;
    iput-object p2, p0, Lcom/melodix/music/NativeRowGeometryRunnable;->tag:Ljava/lang/String;
    iput p3, p0, Lcom/melodix/music/NativeRowGeometryRunnable;->tokenPx:I
    return-void
.end method

.method public final run()V
    .locals 8

    :try_start_geom
    iget-object v1, p0, Lcom/melodix/music/NativeRowGeometryRunnable;->view:Landroid/view/View;
    if-eqz v1, :geom_done
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V
    const-string v2, "row-geom tag="
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    iget-object v2, p0, Lcom/melodix/music/NativeRowGeometryRunnable;->tag:Ljava/lang/String;
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v2, " token_px="
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    iget v3, p0, Lcom/melodix/music/NativeRowGeometryRunnable;->tokenPx:I
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v2, " min_h="
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v1}, Landroid/view/View;->getMinimumHeight()I
    move-result v3
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v2, " measured_h="
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredHeight()I
    move-result v3
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v2, " final_h="
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I
    move-result v3
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v2, " final_w="
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v1}, Landroid/view/View;->getWidth()I
    move-result v3
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v2, " pad_v="
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v1}, Landroid/view/View;->getPaddingTop()I
    move-result v3
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v2, "/"
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v1}, Landroid/view/View;->getPaddingBottom()I
    move-result v3
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v2, " density_x100="
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;
    move-result-object v6
    invoke-virtual {v6}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v6
    iget v6, v6, Landroid/util/DisplayMetrics;->density:F
    const/high16 v7, 0x42c80000
    mul-float/2addr v6, v7
    float-to-int v3, v6
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v2, " lp="
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v4
    if-eqz v4, :geom_lp_null
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    move-result-object v6
    invoke-virtual {v6}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;
    move-result-object v2
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    iget v3, v4, Landroid/view/ViewGroup$LayoutParams;->width:I
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v2, "x"
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    iget v3, v4, Landroid/view/ViewGroup$LayoutParams;->height:I
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    instance-of v6, v4, Landroid/view/ViewGroup$MarginLayoutParams;
    if-eqz v6, :geom_lp_ready
    check-cast v4, Landroid/view/ViewGroup$MarginLayoutParams;
    const-string v2, " margins="
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    iget v3, v4, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v2, "/"
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    iget v3, v4, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    goto :geom_lp_ready
    :geom_lp_null
    const-string v2, "null"
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :geom_lp_ready
    const-string v2, " parent="
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v5
    instance-of v6, v5, Landroid/view/View;
    if-eqz v6, :geom_parent_none
    check-cast v5, Landroid/view/View;
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    move-result-object v6
    invoke-virtual {v6}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;
    move-result-object v2
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v2, " h="
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v5}, Landroid/view/View;->getHeight()I
    move-result v3
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v2, " pad_lr="
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v5}, Landroid/view/View;->getPaddingLeft()I
    move-result v3
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v2, "/"
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v5}, Landroid/view/View;->getPaddingRight()I
    move-result v3
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    goto :geom_parent_ready
    :geom_parent_none
    const-string v2, "none"
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :geom_parent_ready
    const-string v2, " children="
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    instance-of v6, v1, Landroid/view/ViewGroup;
    if-eqz v6, :geom_children_none
    check-cast v1, Landroid/view/ViewGroup;
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I
    move-result v3
    goto :geom_children_ready
    :geom_children_none
    const/4 v3, -0x1
    :geom_children_ready
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;
    move-result-object v2
    const-string v3, "MelRowGeom"
    invoke-static {v3, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_geom
    .catch Ljava/lang/Throwable; {:try_start_geom .. :try_end_geom} :geom_catch
    goto :geom_done
    :geom_catch
    move-exception v0
    const-string v0, "MelRowGeom"
    const-string v1, "probe failed"
    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :geom_done
    return-void
.end method
