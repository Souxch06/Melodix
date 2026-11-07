.class public final Lcom/melodix/music/NativeRowGeometryProbe;
.super Ljava/lang/Object;

# MEL-BUG-001. Diagnostic only. Resolves the token independently of the factory
# (fallback -1 makes an unresolved name visible) and posts a post-layout read of
# the real geometry. Never modifies a view, never throws into the caller.
.method public static logIdentity(Landroid/content/Context;Ljava/lang/String;)V
    .locals 5

    :try_start_id
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V
    const-string v4, "row-id name="
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object v1
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;
    move-result-object v2
    const-string v4, " pkg="
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v3, "dimen"
    invoke-virtual {v1, p1, v3, v2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    move-result v2
    const-string v4, " id="
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;
    move-result-object v2
    const-string v4, "mel_settings_pad_h"
    invoke-virtual {v1, v4, v3, v2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    move-result v2
    const-string v4, " sibling_id="
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const/4 v2, 0x0
    invoke-virtual {v1, p1, v3, v2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    move-result v2
    const-string v4, " nopkg_id="
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v4, "android"
    const-string v2, "status_bar_height"
    invoke-virtual {v1, v2, v3, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    move-result v2
    const-string v4, " framework_id="
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;
    move-result-object v0
    const-string v1, "MelRowId"
    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_id
    .catch Ljava/lang/Throwable; {:try_start_id .. :try_end_id} :id_catch
    goto :id_done
    :id_catch
    move-exception v0
    :id_done
    return-void
.end method

.method public static attach(Landroid/content/Context;Landroid/view/View;Ljava/lang/String;)V
    .locals 4

    :try_start_attach
    if-eqz p0, :attach_done
    if-eqz p1, :attach_done
    invoke-static {p0, p2}, Lcom/melodix/music/NativeRowGeometryProbe;->logIdentity(Landroid/content/Context;Ljava/lang/String;)V
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
