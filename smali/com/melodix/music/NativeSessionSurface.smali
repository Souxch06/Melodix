.class public final Lcom/melodix/music/NativeSessionSurface;
.super Ljava/lang/Object;
.field private static renderedState:I
.field private static renderedLogin:Z
.field private static renderedReason:Ljava/lang/String;
.method public static id(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)I
    .locals 2
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;
    move-result-object v1
    invoke-virtual {v0, p1, p2, v1}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    move-result v0
    return v0
.end method
.method public static text(Landroid/view/View;Ljava/lang/String;)Landroid/widget/TextView;
    .locals 2
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;
    move-result-object v0
    const-string v1, "id"
    invoke-static {v0, p1, v1}, Lcom/melodix/music/NativeSessionSurface;->id(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)I
    move-result v0
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
    check-cast v0, Landroid/widget/TextView;
    return-object v0
.end method
.method public static paint(Lcom/melodix/music/MainActivity;)V
    .locals 8
    invoke-static {p0}, Lcom/melodix/music/NativeSessionSurface;->protectUnderlyingViews(Lcom/melodix/music/MainActivity;)V
    sget-object v0, Lcom/melodix/music/NativeSessionGate;->overlay:Landroid/view/View;
    sget v1, Lcom/melodix/music/NativeSessionGate;->state:I
    sget-boolean v2, Lcom/melodix/music/NativeSessionGate;->loginActive:Z
    const/4 v3, 0x3
    if-eq v1, v3, :remove
    if-eqz v0, :inflate
    sget v3, Lcom/melodix/music/NativeSessionSurface;->renderedState:I
    if-ne v1, v3, :remove_old
    sget-boolean v3, Lcom/melodix/music/NativeSessionSurface;->renderedLogin:Z
    if-ne v2, v3, :remove_old
    sget-object v3, Lcom/melodix/music/NativeSessionSurface;->renderedReason:Ljava/lang/String;
    sget-object v4, Lcom/melodix/music/NativeSessionGate;->lastReason:Ljava/lang/String;
    invoke-static {v3, v4}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :remove_old
    const-string v3, "sessionDetails"
    invoke-static {v0, v3}, Lcom/melodix/music/NativeSessionSurface;->text(Landroid/view/View;Ljava/lang/String;)Landroid/widget/TextView;
    move-result-object v3
    invoke-static {}, Lcom/melodix/music/NativeSessionGate;->details()Ljava/lang/String;
    move-result-object v4
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    invoke-static {}, Lcom/melodix/music/NativeSessionSurfaceExtras;->retryState()V
    invoke-virtual {v0}, Landroid/view/View;->bringToFront()V
    return-void
    :remove_old
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v3
    check-cast v3, Landroid/view/ViewGroup;
    if-eqz v3, :inflate
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V
    :inflate
    sget-object v3, Lcom/melodix/music/NativeSessionGate;->lastReason:Ljava/lang/String;
    sput-object v3, Lcom/melodix/music/NativeSessionSurface;->renderedReason:Ljava/lang/String;
    sput v1, Lcom/melodix/music/NativeSessionSurface;->renderedState:I
    sput-boolean v2, Lcom/melodix/music/NativeSessionSurface;->renderedLogin:Z
    const-string v3, "native_session_surface"
    if-eqz v2, :layout_name
    const-string v3, "native_session_login_header"
    :layout_name
    const-string v4, "layout"
    invoke-static {p0, v3, v4}, Lcom/melodix/music/NativeSessionSurface;->id(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)I
    move-result v3
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;
    move-result-object v4
    const/4 v5, 0x0
    invoke-virtual {v4, v3, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;
    move-result-object v0
    sput-object v0, Lcom/melodix/music/NativeSessionGate;->overlay:Landroid/view/View;
    const-string v3, "sessionTitle"
    invoke-static {v0, v3}, Lcom/melodix/music/NativeSessionSurface;->text(Landroid/view/View;Ljava/lang/String;)Landroid/widget/TextView;
    move-result-object v3
    const-string v4, "sessionSubtitle"
    invoke-static {v0, v4}, Lcom/melodix/music/NativeSessionSurface;->text(Landroid/view/View;Ljava/lang/String;)Landroid/widget/TextView;
    move-result-object v4
    const-string v5, "Vérification de ta session…"
    const-string v6, "Tes playlists restent masquées jusqu’à la confirmation de Spotify."
    if-eqz v1, :labels
    const/4 v7, 0x1
    if-eq v1, v7, :login_labels
    const/4 v7, 0x2
    if-eq v1, v7, :expired_labels
    const-string v5, "Connexion Spotify indisponible"
    const-string v6, "La vérification n’a pas abouti. Réessaie sans effacer ta session."
    sget-object v7, Lcom/melodix/music/NativeSessionGate;->lastReason:Ljava/lang/String;
    const-string v5, "fresh-account-refused"
    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v7
    const-string v5, "Connexion Spotify indisponible"
    if-eqz v7, :labels
    const-string v5, "Spotify refuse l’accès avec ce compte"
    const-string v6, "Même après ta reconnexion, Spotify refuse l’accès. Consulte les détails ou réessaie plus tard."
    goto :labels
    :login_labels
    const-string v5, "Bienvenue sur Melodix"
    const-string v6, "Connecte-toi sur la page officielle Spotify pour retrouver tes playlists."
    goto :labels
    :expired_labels
    const-string v5, "Ta session Spotify semble expirée"
    const-string v6, "Spotify a refusé deux vérifications. Reconnecte-toi pour retrouver tes playlists."
    :labels
    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    const-string v3, "sessionAction"
    invoke-static {v0, v3}, Lcom/melodix/music/NativeSessionSurface;->text(Landroid/view/View;Ljava/lang/String;)Landroid/widget/TextView;
    move-result-object v3
    const/4 v4, 0x4
    if-eq v1, v4, :retry_action
    const/4 v4, 0x2
    if-eq v1, v4, :reconnect_action
    if-nez v2, :action_done
    const/4 v4, 0x1
    if-ne v1, v4, :action_done
    const-string v4, "Se connecter à Spotify"
    const/4 v5, 0x1
    goto :action
    :retry_action
    const-string v4, "Réessayer"
    const/4 v5, 0x0
    goto :action
    :reconnect_action
    const-string v4, "Se reconnecter"
    const/4 v5, 0x2
    :action
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    const/4 v4, 0x0
    invoke-virtual {v3, v4}, Landroid/view/View;->setVisibility(I)V
    new-instance v4, Lcom/melodix/music/NativeSessionSurfaceAction;
    invoke-direct {v4, p0, v5}, Lcom/melodix/music/NativeSessionSurfaceAction;-><init>(Lcom/melodix/music/MainActivity;I)V
    invoke-virtual {v3, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V
    :action_done
    invoke-static {p0, v0, v1}, Lcom/melodix/music/NativeSessionSurfaceExtras;->bind(Lcom/melodix/music/MainActivity;Landroid/view/View;I)V
    :attach
    const/4 v3, -0x1
    const/4 v4, -0x1
    if-eqz v2, :params
    # Login header is native only; reserve exactly its measured height above WebView.
    const/4 v4, -0x2
    move-object v5, v0
    check-cast v5, Landroid/widget/ScrollView;
    const/4 v6, 0x0
    invoke-virtual {v5, v6}, Landroid/widget/ScrollView;->setFillViewport(Z)V
    new-instance v5, Lcom/melodix/music/NativeSessionSurfaceLayout;
    invoke-direct {v5, p0}, Lcom/melodix/music/NativeSessionSurfaceLayout;-><init>(Lcom/melodix/music/MainActivity;)V
    invoke-virtual {v0, v5}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V
    :params
    new-instance v5, Landroid/widget/FrameLayout$LayoutParams;
    invoke-direct {v5, v3, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V
    const/16 v3, 0x30
    iput v3, v5, Landroid/widget/FrameLayout$LayoutParams;->gravity:I
    invoke-virtual {p0, v0, v5}, Landroid/app/Activity;->addContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    invoke-virtual {v0}, Landroid/view/View;->bringToFront()V
    if-nez v2, :done
    iget-object v3, p0, Lcom/melodix/music/MainActivity;->N:Landroid/widget/FrameLayout;
    if-eqz v3, :done
    const/4 v4, 0x0
    invoke-virtual {v3, v4, v4, v4, v4}, Landroid/view/View;->setPadding(IIII)V
    :done
    return-void
    :remove
    if-eqz v0, :padding
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v3
    check-cast v3, Landroid/view/ViewGroup;
    if-eqz v3, :padding
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V
    const/4 v0, 0x0
    sput-object v0, Lcom/melodix/music/NativeSessionGate;->overlay:Landroid/view/View;
    :padding
    iget-object v3, p0, Lcom/melodix/music/MainActivity;->N:Landroid/widget/FrameLayout;
    if-eqz v3, :done
    const/4 v4, 0x0
    invoke-virtual {v3, v4, v4, v4, v4}, Landroid/view/View;->setPadding(IIII)V
    return-void
.end method

.method public static protectUnderlyingViews(Lcom/melodix/music/MainActivity;)V
    .locals 5
    const-string v0, "nativeRoot"
    const-string v1, "id"
    invoke-static {p0, v0, v1}, Lcom/melodix/music/NativeSessionSurface;->id(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)I
    move-result v0
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
    sget v1, Lcom/melodix/music/NativeSessionGate;->state:I
    const/4 v2, 0x3
    if-eq v1, v2, :valid
    if-eqz v0, :web
    const/16 v1, 0x8
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V
    const/4 v1, 0x4
    invoke-virtual {v0, v1}, Landroid/view/View;->setImportantForAccessibility(I)V
    :web
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->N:Landroid/widget/FrameLayout;
    if-eqz v0, :done
    const/4 v1, 0x4
    sget-boolean v2, Lcom/melodix/music/NativeSessionGate;->loginActive:Z
    if-eqz v2, :set_web
    const/4 v1, 0x0
    :set_web
    invoke-virtual {v0, v1}, Landroid/view/View;->setImportantForAccessibility(I)V
    return-void
    :valid
    if-eqz v0, :restore_web
    const/4 v1, 0x0
    invoke-virtual {v0, v1}, Landroid/view/View;->setImportantForAccessibility(I)V
    :restore_web
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->N:Landroid/widget/FrameLayout;
    if-eqz v0, :done
    const/4 v1, 0x0
    invoke-virtual {v0, v1}, Landroid/view/View;->setImportantForAccessibility(I)V
    :done
    return-void
.end method
