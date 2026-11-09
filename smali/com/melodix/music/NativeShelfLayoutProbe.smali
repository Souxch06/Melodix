.class public final Lcom/melodix/music/NativeShelfLayoutProbe;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;
.field private final root:Ljava/lang/ref/WeakReference;

.method public constructor <init>(Landroid/view/View;)V
    .locals 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object v0, p0, Lcom/melodix/music/NativeShelfLayoutProbe;->root:Ljava/lang/ref/WeakReference;
    return-void
.end method

.method public static schedule(Landroid/view/View;)V
    .locals 2
    new-instance v0, Lcom/melodix/music/NativeShelfLayoutProbe;
    invoke-direct {v0, p0}, Lcom/melodix/music/NativeShelfLayoutProbe;-><init>(Landroid/view/View;)V
    invoke-virtual {p0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;
    move-result-object v1
    invoke-virtual {v1, v0}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V
    return-void
.end method

.method public final run()V
    .locals 14
    :probe_try
    iget-object v0, p0, Lcom/melodix/music/NativeShelfLayoutProbe;->root:Ljava/lang/ref/WeakReference;
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroid/view/ViewGroup;
    if-eqz v0, :probe_done
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I
    move-result v1
    const/4 v2, 0x0
    :probe_outer
    if-ge v2, v1, :probe_done
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v3
    instance-of v4, v3, Landroid/widget/HorizontalScrollView;
    if-eqz v4, :probe_next
    check-cast v3, Landroid/widget/HorizontalScrollView;
    const/4 v4, 0x0
    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v4
    check-cast v4, Landroid/widget/LinearLayout;
    if-eqz v4, :probe_next
    invoke-virtual {v4}, Landroid/view/ViewGroup;->getChildCount()I
    move-result v5
    const/4 v6, 0x0
    const/4 v8, 0x0
    const/4 v9, 0x0
    const/4 v10, 0x0
    const/4 v12, 0x0
    :probe_card
    if-ge v6, v5, :probe_emit
    invoke-virtual {v4, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v7
    check-cast v7, Landroid/view/ViewGroup;
    invoke-virtual {v7}, Landroid/view/View;->getLeft()I
    move-result v11
    invoke-virtual {v7}, Landroid/view/View;->getTop()I
    move-result v13
    if-eqz v6, :probe_bounds
    if-ge v11, v8, :probe_bounds
    if-ne v13, v12, :probe_bounds
    add-int/lit8 v9, v9, 0x1
    :probe_bounds
    move v12, v13
    invoke-virtual {v7}, Landroid/view/View;->getRight()I
    move-result v8
    const/4 v11, 0x1
    invoke-virtual {v7, v11}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v11
    if-eqz v11, :probe_card_next
    invoke-virtual {v11}, Landroid/view/View;->getBottom()I
    move-result v11
    invoke-virtual {v7}, Landroid/view/View;->getHeight()I
    move-result v13
    if-le v11, v13, :probe_card_next
    add-int/lit8 v10, v10, 0x1
    :probe_card_next
    add-int/lit8 v6, v6, 0x1
    goto :probe_card
    :probe_emit
    invoke-static {v4, v9, v10}, Lcom/melodix/music/NativeShelfLayoutProbe;->record(Landroid/widget/LinearLayout;II)V
    :probe_next
    add-int/lit8 v2, v2, 0x1
    goto :probe_outer
    :probe_end
    .catch Ljava/lang/RuntimeException; {:probe_try .. :probe_end} :probe_error
    :probe_error
    move-exception v0
    :probe_done
    return-void
.end method

.method public static record(Landroid/widget/LinearLayout;II)V
    .locals 6
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I
    move-result v2
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getOrientation()I
    move-result v3
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I
    move-result v4
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I
    move-result v5
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V
    const-string v1, "shelf stage=layout cards="
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v1, " orientation="
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v1, " width="
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v1, " height="
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v1, " overlaps="
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v1, " overflow="
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-static {v0}, Lcom/melodix/music/NativeImageTrace;->log(Ljava/lang/String;)V
    return-void
.end method

.method public final onPreDraw()Z
    .locals 1
    iget-object v0, p0, Lcom/melodix/music/NativeShelfLayoutProbe;->root:Ljava/lang/ref/WeakReference;
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroid/view/View;
    if-eqz v0, :predraw_done
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;
    move-result-object v0
    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V
    invoke-virtual {p0}, Lcom/melodix/music/NativeShelfLayoutProbe;->run()V
    :predraw_done
    const/4 v0, 0x1
    return v0
.end method
