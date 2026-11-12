.class public final Lcom/melodix/music/NativeLimitedGlass;
.super Ljava/lang/Object;

# This renderer accepts only fixed native labels and actions, never page data.
# The regular private-data gate and its generation/epoch checks stay closed.
.field private static route:Ljava/lang/String;

.method public static available()Z
    .locals 2
    sget v0, Lcom/melodix/music/NativeSessionGate;->state:I
    const/4 v1, 0x3
    if-eq v0, v1, :no
    sget-boolean v0, Lcom/melodix/music/NativeSessionGate;->loginActive:Z
    if-nez v0, :no
    const/4 v0, 0x1
    return v0
    :no
    const/4 v0, 0x0
    return v0
.end method

.method private static visibility(Landroid/app/Activity;II)V
    .locals 1
    invoke-virtual {p0, p1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
    if-eqz v0, :done
    invoke-virtual {v0, p2}, Landroid/view/View;->setVisibility(I)V
    :done
    return-void
.end method

.method private static label(Lcom/melodix/music/MainActivity;Landroid/widget/LinearLayout;Ljava/lang/String;F)V
    .locals 3
    new-instance v0, Landroid/widget/TextView;
    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    invoke-virtual {v0, p3}, Landroid/widget/TextView;->setTextSize(F)V
    sget v1, Lcom/melodix/music/MelColors;->textPrimary:I
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object v1
    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v1
    iget v1, v1, Landroid/util/DisplayMetrics;->density:F
    const/high16 v2, 0x41c00000    # 24dp
    mul-float/2addr v1, v2
    float-to-int v1, v1
    invoke-virtual {v0, v1, v1, v1, v1}, Landroid/view/View;->setPadding(IIII)V
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V
    return-void
.end method

.method private static action(Lcom/melodix/music/MainActivity;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    new-instance v0, Landroid/widget/Button;
    invoke-direct {v0, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    invoke-virtual {v0, p2}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V
    new-instance v1, Lcom/melodix/music/NativeRowClickListener;
    const-string v2, ""
    invoke-direct {v1, p0, p3, v2}, Lcom/melodix/music/NativeRowClickListener;-><init>(Lcom/melodix/music/MainActivity;Ljava/lang/String;Ljava/lang/String;)V
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V
    return-void
.end method

# A caller may choose only one of four fixed native routes. No WebView payload
# contributes text, artwork, URIs or a session assertion to this presentation.
.method public static show(Lcom/melodix/music/MainActivity;Ljava/lang/String;)V
    .locals 6
    invoke-static {}, Lcom/melodix/music/NativeLimitedGlass;->available()Z
    move-result v0
    if-eqz v0, :done
    const-string v0, "home"
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-nez v1, :route_ok
    const-string v0, "search"
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-nez v1, :route_ok
    const-string v0, "library"
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-nez v1, :route_ok
    const-string v0, "settings"
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-nez v1, :route_ok
    const-string v0, "home"
    :route_ok
    sput-object v0, Lcom/melodix/music/NativeLimitedGlass;->route:Ljava/lang/String;
    const-string v1, "home"
    const v3, 0x7f090246
    invoke-virtual {p0, v0, v1, v3}, Lcom/melodix/music/MainActivity;->styleNativeTab(Ljava/lang/String;Ljava/lang/String;I)V
    const-string v1, "search"
    const v3, 0x7f090247
    invoke-virtual {p0, v0, v1, v3}, Lcom/melodix/music/MainActivity;->styleNativeTab(Ljava/lang/String;Ljava/lang/String;I)V
    const-string v1, "library"
    const v3, 0x7f090248
    invoke-virtual {p0, v0, v1, v3}, Lcom/melodix/music/MainActivity;->styleNativeTab(Ljava/lang/String;Ljava/lang/String;I)V
    const-string v1, "Accueil"
    const-string v2, "search"
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :check_library
    const-string v1, "Rechercher"
    :check_library
    const-string v2, "library"
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :check_settings
    const-string v1, "Bibliothèque"
    :check_settings
    const-string v2, "settings"
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :title_ready
    const-string v1, "Paramètres"
    :title_ready
    const v3, 0x7f090230
    invoke-virtual {p0, v3}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v3
    instance-of v4, v3, Landroid/widget/TextView;
    if-eqz v4, :hide_panels
    check-cast v3, Landroid/widget/TextView;
    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    :hide_panels
    const/16 v1, 0x8
    const v3, 0x7f090232
    invoke-static {p0, v3, v1}, Lcom/melodix/music/NativeLimitedGlass;->visibility(Landroid/app/Activity;II)V
    const v3, 0x7f090234
    invoke-static {p0, v3, v1}, Lcom/melodix/music/NativeLimitedGlass;->visibility(Landroid/app/Activity;II)V
    const v3, 0x7f09023a
    invoke-static {p0, v3, v1}, Lcom/melodix/music/NativeLimitedGlass;->visibility(Landroid/app/Activity;II)V
    const v3, 0x7f09024c
    invoke-static {p0, v3, v1}, Lcom/melodix/music/NativeLimitedGlass;->visibility(Landroid/app/Activity;II)V
    const v3, 0x7f09024f
    invoke-static {p0, v3, v1}, Lcom/melodix/music/NativeLimitedGlass;->visibility(Landroid/app/Activity;II)V
    const v3, 0x7f090231
    invoke-static {p0, v3, v1}, Lcom/melodix/music/NativeLimitedGlass;->visibility(Landroid/app/Activity;II)V
    const/4 v1, 0x0
    const v3, 0x7f090239
    invoke-static {p0, v3, v1}, Lcom/melodix/music/NativeLimitedGlass;->visibility(Landroid/app/Activity;II)V
    const v3, 0x7f09024e
    invoke-static {p0, v3, v1}, Lcom/melodix/music/NativeLimitedGlass;->visibility(Landroid/app/Activity;II)V
    const v3, 0x7f090235
    invoke-virtual {p0, v3}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v3
    instance-of v4, v3, Landroid/widget/LinearLayout;
    if-eqz v4, :done
    check-cast v3, Landroid/widget/LinearLayout;
    invoke-virtual {v3}, Landroid/widget/LinearLayout;->removeAllViews()V
    const-string v4, "Bibliothèque Spotify indisponible"
    const-string v5, "Spotify n’a pas confirmé l’accès à la bibliothèque. Les playlists restent masquées. La cause n’est pas établie."
    sget v1, Lcom/melodix/music/NativeSessionGate;->state:I
    if-nez v1, :not_loading
    const-string v4, "Vérification de la bibliothèque…"
    const-string v5, "Les playlists restent masquées pendant la vérification."
    :not_loading
    const-string v1, "search"
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :not_search
    const-string v4, "Recherche indisponible"
    const-string v5, "La recherche Spotify nécessite un accès confirmé."
    :not_search
    if-eqz v2, :description
    const-string v4, "Paramètres de Melodix"
    const-string v5, "Vous pouvez gérer les notifications Android et choisir de vérifier ou de connecter Spotify."
    :description
    const/high16 v1, 0x41b00000    # 22sp
    invoke-static {p0, v3, v4, v1}, Lcom/melodix/music/NativeLimitedGlass;->label(Lcom/melodix/music/MainActivity;Landroid/widget/LinearLayout;Ljava/lang/String;F)V
    const/high16 v1, 0x41800000    # 16sp
    invoke-static {p0, v3, v5, v1}, Lcom/melodix/music/NativeLimitedGlass;->label(Lcom/melodix/music/MainActivity;Landroid/widget/LinearLayout;Ljava/lang/String;F)V
    const-string v4, "Réessayer la bibliothèque"
    const-string v5, "melodix:action:retry-library"
    invoke-static {p0, v3, v4, v5}, Lcom/melodix/music/NativeLimitedGlass;->action(Lcom/melodix/music/MainActivity;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;)V
    const-string v4, "Se connecter à Spotify"
    const-string v5, "melodix:action:open-login"
    invoke-static {p0, v3, v4, v5}, Lcom/melodix/music/NativeLimitedGlass;->action(Lcom/melodix/music/MainActivity;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;)V
    if-eqz v2, :show_root
    const-string v4, "Notifications Android"
    const-string v5, "melodix:action:open-notifications"
    invoke-static {p0, v3, v4, v5}, Lcom/melodix/music/NativeLimitedGlass;->action(Lcom/melodix/music/MainActivity;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;)V
    :show_root
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->H:Landroidx/constraintlayout/widget/ConstraintLayout;
    if-eqz v0, :hide_progress
    const/16 v1, 0x8
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V
    :hide_progress
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->R:Landroid/widget/ProgressBar;
    if-eqz v0, :root
    const/16 v1, 0x8
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V
    :root
    const v0, 0x7f09022f
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
    if-eqz v0, :done
    const/4 v1, 0x0
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V
    invoke-virtual {v0, v1}, Landroid/view/View;->setImportantForAccessibility(I)V
    invoke-virtual {v0}, Landroid/view/View;->bringToFront()V
    const-string v0, "native-limited-glass-attached"
    invoke-static {v0}, Lcom/melodix/music/NativeCrashGuard;->diagLine(Ljava/lang/String;)V
    :done
    return-void
.end method

.method public static repaint(Lcom/melodix/music/MainActivity;)V
    .locals 1
    sget-object v0, Lcom/melodix/music/NativeLimitedGlass;->route:Ljava/lang/String;
    invoke-static {p0, v0}, Lcom/melodix/music/NativeLimitedGlass;->show(Lcom/melodix/music/MainActivity;Ljava/lang/String;)V
    return-void
.end method
