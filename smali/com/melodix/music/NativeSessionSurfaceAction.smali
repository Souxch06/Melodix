.class public final Lcom/melodix/music/NativeSessionSurfaceAction;
.super Ljava/lang/Object;
.implements Landroid/view/View$OnClickListener;
.implements Landroid/content/DialogInterface$OnClickListener;
.field private final activity:Ljava/lang/ref/WeakReference;
.field private final action:I
.field private final generation:I
.method public constructor <init>(Lcom/melodix/music/MainActivity;I)V
    .locals 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object v0, p0, Lcom/melodix/music/NativeSessionSurfaceAction;->activity:Ljava/lang/ref/WeakReference;
    iput p2, p0, Lcom/melodix/music/NativeSessionSurfaceAction;->action:I
    sget v1, Lcom/melodix/music/NativeSessionGate;->generation:I
    iput v1, p0, Lcom/melodix/music/NativeSessionSurfaceAction;->generation:I
    return-void
.end method
.method public final onClick(Landroid/view/View;)V
    .locals 4
    iget-object v0, p0, Lcom/melodix/music/NativeSessionSurfaceAction;->activity:Ljava/lang/ref/WeakReference;
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/melodix/music/MainActivity;
    if-eqz v0, :done
    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z
    move-result v1
    if-nez v1, :done
    iget-boolean v1, v0, Lcom/melodix/music/MainActivity;->nativeReconnectPending:Z
    if-nez v1, :done
    const/4 v1, 0x1
    invoke-virtual {p1, v1}, Landroid/view/View;->performHapticFeedback(I)Z
    iget v1, p0, Lcom/melodix/music/NativeSessionSurfaceAction;->action:I
    const/4 v2, 0x5
    if-eq v1, v2, :leave_login
    const/4 v2, 0x3
    if-eq v1, v2, :toggle
    const/4 v2, 0x4
    if-eq v1, v2, :copy
    const/4 v2, 0x2
    if-eq v1, v2, :reconnect
    const/4 v2, 0x1
    if-eq v1, v2, :login
    invoke-static {}, Lcom/melodix/music/NativeSessionRecovery;->hasCookie()Z
    move-result v1
    if-eqz v1, :login
    invoke-static {v0}, Lcom/melodix/music/NativeSessionRecovery;->verify(Lcom/melodix/music/MainActivity;)V
    goto :done
    :login
    invoke-virtual {v0}, Lcom/melodix/music/MainActivity;->openSpotifyLogin()V
    goto :done
    :leave_login
    iget v1, p0, Lcom/melodix/music/NativeSessionSurfaceAction;->generation:I
    sget v2, Lcom/melodix/music/NativeSessionGate;->generation:I
    if-ne v1, v2, :done
    invoke-static {v0}, Lcom/melodix/music/NativeSessionGate;->leaveLogin(Lcom/melodix/music/MainActivity;)V
    goto :done
    :reconnect
    # Reconnection clears WebView data. Request a second, informed confirmation
    # and never clear as a fallback if the dialog cannot be displayed.
    :confirm_try
    new-instance v1, Landroid/app/AlertDialog$Builder;
    invoke-direct {v1, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V
    const-string v2, "Se reconnecter ?"
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;
    const-string v2, "Cette action efface les cookies et données Web de Melodix. Elle ne garantit pas de résoudre le refus Spotify. Tu peux annuler et réessayer sans effacer."
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;
    # A distinct listener captures the generation for this exact dialog. An
    # older dialog cannot erase a later login if two dialogs were opened.
    new-instance v2, Lcom/melodix/music/NativeSessionSurfaceAction;
    const/4 v3, 0x2
    invoke-direct {v2, v0, v3}, Lcom/melodix/music/NativeSessionSurfaceAction;-><init>(Lcom/melodix/music/MainActivity;I)V
    const-string v3, "Effacer et se reconnecter"
    invoke-virtual {v1, v3, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;
    const-string v2, "Annuler"
    const/4 v0, 0x0
    invoke-virtual {v1, v2, v0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;
    :confirm_end
    .catch Ljava/lang/Throwable; {:confirm_try .. :confirm_end} :confirm_error
    goto :done
    :confirm_error
    move-exception v1
    goto :done
    :toggle
    invoke-static {v0, p1}, Lcom/melodix/music/NativeSessionSurfaceExtras;->toggle(Lcom/melodix/music/MainActivity;Landroid/view/View;)V
    goto :done
    :copy
    invoke-static {v0}, Lcom/melodix/music/NativeSessionSurfaceExtras;->copy(Landroid/content/Context;)V
    :done
    return-void
.end method

# Only the dialog's positive button may start the already guarded reconnect.
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    const/4 v0, -0x1
    if-ne p2, v0, :done
    iget v0, p0, Lcom/melodix/music/NativeSessionSurfaceAction;->action:I
    const/4 v1, 0x2
    if-ne v0, v1, :done
    iget v0, p0, Lcom/melodix/music/NativeSessionSurfaceAction;->generation:I
    sget v1, Lcom/melodix/music/NativeSessionGate;->generation:I
    if-ne v0, v1, :done
    iget-object v0, p0, Lcom/melodix/music/NativeSessionSurfaceAction;->activity:Ljava/lang/ref/WeakReference;
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/melodix/music/MainActivity;
    if-eqz v0, :done
    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z
    move-result v1
    if-nez v1, :done
    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z
    move-result v1
    if-nez v1, :done
    iget-boolean v1, v0, Lcom/melodix/music/MainActivity;->nativeReconnectPending:Z
    if-nez v1, :done
    invoke-static {v0}, Lcom/melodix/music/NativeSessionReconnect;->start(Lcom/melodix/music/MainActivity;)V
    :done
    return-void
.end method
