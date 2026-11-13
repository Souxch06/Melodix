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

# Measured limited content, not session proof. A missing, hidden or unlaid-out
# root/content must not silence a genuine content watchdog report.
.method public static contentVisible(Lcom/melodix/music/MainActivity;)Z
    .locals 4
    if-eqz p0, :no
    invoke-static {}, Lcom/melodix/music/NativeLimitedGlass;->available()Z
    move-result v0
    if-eqz v0, :no
    const v0, 0x7f09022f
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
    if-eqz v0, :no
    invoke-virtual {v0}, Landroid/view/View;->isShown()Z
    move-result v1
    if-eqz v1, :no
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I
    move-result v1
    if-lez v1, :no
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I
    move-result v1
    if-lez v1, :no
    const v2, 0x7f090235
    invoke-virtual {p0, v2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v2
    instance-of v3, v2, Landroid/widget/LinearLayout;
    if-eqz v3, :no
    check-cast v2, Landroid/widget/LinearLayout;
    invoke-virtual {v2}, Landroid/view/View;->isShown()Z
    move-result v1
    if-eqz v1, :no
    invoke-virtual {v2}, Landroid/view/View;->getWidth()I
    move-result v1
    if-lez v1, :no
    invoke-virtual {v2}, Landroid/view/View;->getHeight()I
    move-result v1
    if-lez v1, :no
    invoke-virtual {v2}, Landroid/widget/LinearLayout;->getChildCount()I
    move-result v1
    if-lez v1, :no
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
    # TextView is an accessibility node with the same safe fixed label.
    invoke-virtual {v0, p2}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V
    invoke-virtual {v0, p3}, Landroid/widget/TextView;->setTextSize(F)V
    sget v1, Lcom/melodix/music/MelColors;->textPrimary:I
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object v1
    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v1
    iget v1, v1, Landroid/util/DisplayMetrics;->density:F
    const/high16 v2, 0x41800000    # 16dp
    mul-float/2addr v1, v2
    float-to-int v1, v1
    invoke-virtual {v0, v1, v1, v1, v1}, Landroid/view/View;->setPadding(IIII)V
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V
    return-void
.end method

# Group the truthful status and actions in a centered glass card. Its maximum
# width uses the current window configuration, not the physical display.
.method private static card(Lcom/melodix/music/MainActivity;Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;
    .locals 6
    new-instance v0, Landroid/widget/LinearLayout;
    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
    const/4 v1, 0x1
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V
    const-string v1, "native_glass_surface"
    const-string v2, "drawable"
    invoke-static {p0, v1, v2}, Lcom/melodix/music/NativeSessionSurface;->id(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)I
    move-result v1
    if-eqz v1, :background_done
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V
    :background_done
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object v1
    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v2
    iget v2, v2, Landroid/util/DisplayMetrics;->density:F
    const/high16 v3, 0x41800000    # 16dp
    mul-float/2addr v3, v2
    float-to-int v3, v3
    invoke-virtual {v0, v3, v3, v3, v3}, Landroid/view/View;->setPadding(IIII)V
    const/4 v4, -0x1
    invoke-virtual {v1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;
    move-result-object v1
    iget v1, v1, Landroid/content/res/Configuration;->screenWidthDp:I
    const/16 v5, 0x2a0    # 672dp includes outer margins
    if-le v1, v5, :width_ready
    const/high16 v4, 0x44200000    # 640dp
    mul-float/2addr v2, v4
    float-to-int v4, v2
    :width_ready
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v2, -0x2
    invoke-direct {v1, v4, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual {v1, v3, v3, v3, v3}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V
    const/4 v2, 0x1
    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->gravity:I
    invoke-virtual {p1, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    return-object v0
.end method

.method private static action(Lcom/melodix/music/MainActivity;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    new-instance v0, Landroid/widget/Button;
    invoke-direct {v0, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    invoke-virtual {v0, p2}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V
    const/4 v1, 0x0
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setAllCaps(Z)V
    const/4 v1, -0x1
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V
    const-string v1, "native_button_dark"
    const-string v2, "melodix:action:retry-library"
    invoke-virtual {v2, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :button_style
    const-string v1, "native_button_green"
    :button_style
    const-string v2, "drawable"
    invoke-static {p0, v1, v2}, Lcom/melodix/music/NativeSessionSurface;->id(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)I
    move-result v1
    if-eqz v1, :style_done
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V
    :style_done
    # Do not let the platform Button theme tint the custom Glass drawable grey.
    const/4 v1, 0x0
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object v1
    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v1
    iget v1, v1, Landroid/util/DisplayMetrics;->density:F
    const/high16 v2, 0x42400000    # 48dp minimum touch target
    mul-float/2addr v2, v1
    float-to-int v2, v2
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setMinHeight(I)V
    const/high16 v2, 0x41000000    # 8dp
    mul-float/2addr v1, v2
    float-to-int v1, v1
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v3, -0x1
    const/4 v4, -0x2
    invoke-direct {v2, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual {v2, v1, v1, v1, v1}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V
    new-instance v1, Lcom/melodix/music/NativeRowClickListener;
    const-string v3, ""
    invoke-direct {v1, p0, p3, v3}, Lcom/melodix/music/NativeRowClickListener;-><init>(Lcom/melodix/music/MainActivity;Ljava/lang/String;Ljava/lang/String;)V
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V
    invoke-virtual {p1, v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    return-void
.end method

# A caller may choose only one of four fixed native routes. No WebView payload
# contributes text, artwork, URIs or a session assertion to this presentation.
.method public static show(Lcom/melodix/music/MainActivity;Ljava/lang/String;)V
    .locals 7
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
    move-object v6, v3
    invoke-static {p0, v3}, Lcom/melodix/music/NativeLimitedGlass;->card(Lcom/melodix/music/MainActivity;Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;
    move-result-object v3
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
    if-eqz v2, :restore_content
    const-string v4, "Notifications Android"
    const-string v5, "melodix:action:open-notifications"
    invoke-static {p0, v3, v4, v5}, Lcom/melodix/music/NativeLimitedGlass;->action(Lcom/melodix/music/MainActivity;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;)V
    :restore_content
    move-object v3, v6
    :show_root
    # bind() can run before MainActivity.H is assigned. Resolve the actual
    # inflated splash by resource id, not the not-yet-initialized field.
    const v0, 0x7f0901c6
    const/16 v1, 0x8
    invoke-static {p0, v0, v1}, Lcom/melodix/music/NativeLimitedGlass;->visibility(Landroid/app/Activity;II)V
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

# Back from a limited root tab returns to limited Home, without page data.
.method public static back(Lcom/melodix/music/MainActivity;)Z
    .locals 2
    sget-object v0, Lcom/melodix/music/NativeLimitedGlass;->route:Ljava/lang/String;
    if-eqz v0, :no
    const-string v1, "home"
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :no
    invoke-static {p0, v1}, Lcom/melodix/music/NativeLimitedGlass;->show(Lcom/melodix/music/MainActivity;Ljava/lang/String;)V
    const/4 v0, 0x1
    return v0
    :no
    const/4 v0, 0x0
    return v0
.end method
