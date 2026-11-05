.class public final Lcom/melodix/music/NativeRowGeometryProbe;
.super Ljava/lang/Object;

# MEL-BUG-001. Diagnostic only. Resolves the token independently of the factory
# (fallback -1 makes an unresolved name visible) and posts a post-layout read of
# the real geometry. Never modifies a view, never throws into the caller.
.method public static attach(Landroid/content/Context;Landroid/view/View;Ljava/lang/String;)V
    .locals 4

    :try_start_attach
    if-eqz p0, :attach_done
    if-eqz p1, :attach_done
    const/4 v0, -0x1
    invoke-static {p0, p2, v0}, Lcom/melodix/music/NativeUiRowFactory;->metric(Landroid/content/Context;Ljava/lang/String;I)I
    move-result v0
    new-instance v1, Lcom/melodix/music/NativeRowGeometryRunnable;
    invoke-direct {v1, p1, p2, v0}, Lcom/melodix/music/NativeRowGeometryRunnable;-><init>(Landroid/view/View;Ljava/lang/String;I)V
    const-wide/16 v2, 0x190
    invoke-virtual {p1, v1, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_attach
    .catch Ljava/lang/Throwable; {:try_start_attach .. :try_end_attach} :attach_catch
    goto :attach_done
    :attach_catch
    move-exception v0
    :attach_done
    return-void
.end method
