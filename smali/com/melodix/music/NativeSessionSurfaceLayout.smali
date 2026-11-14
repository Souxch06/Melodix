.class public final Lcom/melodix/music/NativeSessionSurfaceLayout;
.super Ljava/lang/Object;
.implements Landroid/view/View$OnLayoutChangeListener;
.field private final activity:Ljava/lang/ref/WeakReference;
.method public constructor <init>(Lcom/melodix/music/MainActivity;)V
    .locals 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object v0, p0, Lcom/melodix/music/NativeSessionSurfaceLayout;->activity:Ljava/lang/ref/WeakReference;
    return-void
.end method
.method public final onLayoutChange(Landroid/view/View;IIIIIIII)V
    .locals 4
    sget-boolean v0, Lcom/melodix/music/NativeSessionGate;->loginActive:Z
    if-eqz v0, :done
    iget-object v0, p0, Lcom/melodix/music/NativeSessionSurfaceLayout;->activity:Ljava/lang/ref/WeakReference;
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/melodix/music/MainActivity;
    if-eqz v0, :done
    iget-object v1, v0, Lcom/melodix/music/MainActivity;->N:Landroid/widget/FrameLayout;
    if-eqz v1, :done
    sub-int v2, p5, p3
    invoke-virtual {v1}, Landroid/view/View;->getPaddingTop()I
    move-result v3
    if-nez v3, :update_padding
    invoke-virtual {v1}, Landroid/view/View;->getPaddingBottom()I
    move-result v3
    if-eq v2, v3, :done
    :update_padding
    const/4 v3, 0x0
    invoke-virtual {v1, v3, v3, v3, v2}, Landroid/view/View;->setPadding(IIII)V
    :done
    return-void
.end method
