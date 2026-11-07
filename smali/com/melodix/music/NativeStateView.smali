.class public final Lcom/melodix/music/NativeStateView;
.super Ljava/lang/Object;

# One reusable state block for every surface: icon, title, description, and an
# action ONLY when a real dispatcher already handles it. Network failure is not a
# signed-out session, and an empty library is not an error: each kind keeps its own
# icon and wording so the three can never be confused.
#
# Kind codes are stable and documented in tests/native_state_view.test.js.

.method public static forKind(Lcom/melodix/music/MainActivity;I)Landroid/widget/LinearLayout;
    .locals 5

    const/4 v4, 0x0
    if-eq p1, v4, :kind_loading
    const/4 v4, 0x1
    if-eq p1, v4, :kind_slow
    const/4 v4, 0x2
    if-eq p1, v4, :kind_no_results
    const/4 v4, 0x3
    if-eq p1, v4, :kind_lib_empty
    const/4 v4, 0x4
    if-eq p1, v4, :kind_network
    const/4 v4, 0x5
    if-eq p1, v4, :kind_session
    const/4 v4, 0x6
    if-eq p1, v4, :kind_denied
    const/4 v4, 0x7
    if-eq p1, v4, :kind_unavailable
    const/16 v4, 0x8
    if-eq p1, v4, :kind_prompt
    const/16 v4, 0x9
    if-eq p1, v4, :kind_set_error
    const/16 v4, 0xa
    if-eq p1, v4, :kind_lib_error
    goto :kind_loading

    :kind_loading
    const-string v0, "Chargement…"
    const-string v1, "Cela ne devrait prendre qu’un instant."
    const-string v2, "native_state_loading"
    const-string v3, ""
    goto :kind_ready

    :kind_slow
    const-string v0, "Chargement en cours…"
    const-string v1, "Cela prend plus de temps que prévu. Vérifiez votre connexion."
    const-string v2, "native_state_loading"
    const-string v3, ""
    goto :kind_ready

    :kind_no_results
    const-string v0, "Aucun résultat"
    const-string v1, "Essayez un autre terme ou vérifiez l’orthographe."
    const-string v2, "native_state_search_empty"
    const-string v3, ""
    goto :kind_ready

    :kind_lib_empty
    const-string v0, "Votre bibliothèque est vide"
    const-string v1, "Vos playlists, albums et artistes apparaîtront ici."
    const-string v2, "native_nav_library"
    const-string v3, ""
    goto :kind_ready

    :kind_network
    const-string v0, "Problème de connexion réseau"
    const-string v1, "Impossible de joindre le service. Vérifiez votre réseau."
    const-string v2, "native_state_offline"
    const-string v3, ""
    goto :kind_ready

    :kind_session
    const-string v0, "Session Spotify non confirmée"
    const-string v1, "Reconnectez-vous pour retrouver votre musique."
    const-string v2, "native_state_session"
    const-string v3, "melodix:action:open-login"
    goto :kind_ready

    :kind_denied
    const-string v0, "Accès refusé"
    const-string v1, "Votre compte n’a pas accès à ce contenu."
    const-string v2, "native_state_denied"
    const-string v3, ""
    goto :kind_ready

    :kind_unavailable
    const-string v0, "Données indisponibles"
    const-string v1, "Ces données ne sont pas disponibles pour le moment."
    const-string v2, "native_state_alert"
    const-string v3, ""
    goto :kind_ready

    :kind_prompt
    const-string v0, "Recherchez votre musique"
    const-string v1, "Artiste, titre, album ou playlist."
    const-string v2, "native_nav_search"
    const-string v3, ""
    goto :kind_ready

    :kind_set_error
    const-string v0, "Paramètres indisponibles"
    const-string v1, "Le module de réglages n’a pas répondu."
    const-string v2, "native_state_alert"
    const-string v3, "melodix:action:retry-settings"
    goto :kind_ready

    :kind_lib_error
    const-string v0, "Bibliothèque indisponible"
    const-string v1, "Votre bibliothèque n’a pas pu être chargée."
    const-string v2, "native_state_alert"
    const-string v3, "melodix:action:retry-library"
    goto :kind_ready

    :kind_ready
    invoke-static {p0, v0, v1, v2, v3}, Lcom/melodix/music/NativeStateView;->create(Lcom/melodix/music/MainActivity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/widget/LinearLayout;
    move-result-object v0
    return-object v0
.end method

# Keeps the caller's own message as the title, so "Chargement de votre
# bibliothèque…" does not become a generic "Chargement…".
.method public static forMessage(Lcom/melodix/music/MainActivity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/widget/LinearLayout;
    .locals 0
    invoke-static {p0, p1, p2, p3, p4}, Lcom/melodix/music/NativeStateView;->create(Lcom/melodix/music/MainActivity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/widget/LinearLayout;
    move-result-object p0
    return-object p0
.end method

.method private static actionLabel(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    if-eqz p0, :al_none
    const-string v0, "melodix:action:open-login"
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :al_retry
    const-string v0, "Se connecter"
    return-object v0
    :al_retry
    const-string v0, "melodix:action:retry-library"
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    # if-eqz: branch to the NEXT case when it does not match. if-nez here made the
    # real retry action label-less and handed "Réessayer" to unknown URIs.
    if-eqz v1, :al_retry_settings
    const-string v0, "Réessayer"
    return-object v0
    :al_retry_settings
    const-string v0, "melodix:action:retry-settings"
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :al_settings
    const-string v0, "Réessayer"
    return-object v0
    :al_settings
    const-string v0, "melodix:action:open-settings"
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :al_none
    const-string v0, "Réglages"
    return-object v0
    :al_none
    # An unknown action gets NO button. Inventing a label would invent a capability.
    const/4 v0, 0x0
    return-object v0
.end method

.method private static resolveId(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)I
    .locals 4
    :try_start_r
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;
    move-result-object v1
    invoke-virtual {v0, p1, p2, v1}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    move-result v2
    :try_end_r
    .catch Ljava/lang/Throwable; {:try_start_r .. :try_end_r} :catch_r
    return v2
    :catch_r
    move-exception v0
    const/4 v2, 0x0
    return v2
.end method

.method public static create(Lcom/melodix/music/MainActivity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/widget/LinearLayout;
    .locals 8
    :try_start_sv
    invoke-static {p0, p1, p2, p3}, Lcom/melodix/music/NativeEmptyState;->create(Lcom/melodix/music/MainActivity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/widget/LinearLayout;
    move-result-object v0
    if-eqz v0, :sv_done
    if-eqz p4, :sv_done
    invoke-virtual {p4}, Ljava/lang/String;->isEmpty()Z
    move-result v3
    if-nez v3, :sv_done
    invoke-static {p4}, Lcom/melodix/music/NativeStateView;->actionLabel(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
    if-eqz v2, :sv_done
    new-instance v1, Landroid/widget/TextView;
    invoke-direct {v1, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    invoke-virtual {v1, v2}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V
    const/16 v3, 0x11
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setGravity(I)V
    const/4 v3, 0x0
    const/4 v4, 0x1
    invoke-virtual {v1, v3, v4}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V
    sget v3, Lcom/melodix/music/MelColors;->background:I
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setTextColor(I)V
    const-string v3, "mel_row_title"
    const/high16 v4, 0x41700000
    invoke-static {v1, p0, v3, v4}, Lcom/melodix/music/NativeUiRowFactory;->applyTextSize(Landroid/widget/TextView;Landroid/content/Context;Ljava/lang/String;F)V
    const-string v3, "native_button_green"
    const-string v4, "drawable"
    invoke-static {p0, v3, v4}, Lcom/melodix/music/NativeStateView;->resolveId(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)I
    move-result v3
    if-eqz v3, :sv_bg_done
    invoke-virtual {v1, v3}, Landroid/view/View;->setBackgroundResource(I)V
    :sv_bg_done
    const/4 v3, 0x1
    invoke-virtual {v1, v3}, Landroid/view/View;->setClickable(Z)V
    invoke-virtual {v1, v3}, Landroid/view/View;->setFocusable(Z)V
    new-instance v6, Lcom/melodix/music/NativeRowClickListener;
    invoke-direct {v6, p0, p4, v2}, Lcom/melodix/music/NativeRowClickListener;-><init>(Lcom/melodix/music/MainActivity;Ljava/lang/String;Ljava/lang/String;)V
    invoke-virtual {v1, v6}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V
    # Resolve both dimensions before allocating the params, so no scratch write
    # lands on a register holding an object.
    const-string v3, "mel_header_action"
    const/16 v4, 0x30
    invoke-static {p0, v3, v4}, Lcom/melodix/music/NativeUiRowFactory;->metric(Landroid/content/Context;Ljava/lang/String;I)I
    move-result v3
    const-string v4, "mel_gutter_half"
    const/16 v5, 0x8
    invoke-static {p0, v4, v5}, Lcom/melodix/music/NativeUiRowFactory;->metric(Landroid/content/Context;Ljava/lang/String;I)I
    move-result v4
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v6, -0x1
    const/4 v7, -0x2
    invoke-direct {v5, v6, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    iput v3, v5, Landroid/view/ViewGroup$LayoutParams;->height:I
    iput v4, v5, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I
    invoke-virtual {v0, v1, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    :sv_done
    :try_end_sv
    .catch Ljava/lang/Throwable; {:try_start_sv .. :try_end_sv} :sv_catch
    return-object v0
    :sv_catch
    move-exception v0
    invoke-virtual {v0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;
    move-result-object v0
    const-string v1, "MelState"
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    # Degrade to the plain block rather than returning null into addView.
    invoke-static {p0, p1, p2, p3}, Lcom/melodix/music/NativeEmptyState;->create(Lcom/melodix/music/MainActivity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/widget/LinearLayout;
    move-result-object v0
    return-object v0
.end method

# Maps the messages the app ACTUALLY emits onto kinds, keeping the real message as
# the title. A confirmed session problem outranks "loading": an unproven session
# must never be shown as an empty or merely loading library.
.method public static forSurfaceMessage(Lcom/melodix/music/MainActivity;Ljava/lang/String;)Landroid/widget/LinearLayout;
    .locals 5
    if-eqz p1, :m_lib
    const-string v3, "Recherchez un artiste, un titre, un album ou une playlist ci-dessus"
    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-nez v3, :m_prompt
    const-string v3, "Chargement de votre bibliothèque…"
    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-nez v3, :m_loading
    const-string v3, "Chargement de la playlist…"
    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-nez v3, :m_loading
    const-string v3, "Chargement de votre musique…"
    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-nez v3, :m_loading
    goto :m_lib

    :m_prompt
    const-string v0, "Artiste, titre, album ou playlist."
    const-string v1, "native_nav_search"
    const-string v2, ""
    goto :m_ready

    :m_loading
    # An unproven session is not a slow load: say so, and offer the real login.
    invoke-virtual {p0}, Lcom/melodix/music/MainActivity;->isNativeSessionUnproven()Z
    move-result v3
    if-nez v3, :m_session
    const-string v0, "Cela ne devrait prendre qu’un instant."
    const-string v1, "native_state_loading"
    const-string v2, ""
    goto :m_ready

    :m_session
    const-string v0, "Reconnectez-vous pour retrouver votre musique."
    const-string v1, "native_state_session"
    const-string v2, "melodix:action:open-login"
    goto :m_ready

    :m_lib
    const-string v0, "Vos playlists, albums et artistes apparaîtront ici."
    const-string v1, "native_nav_library"
    const-string v2, ""

    :m_ready
    invoke-static {p0, p1, v0, v1, v2}, Lcom/melodix/music/NativeStateView;->create(Lcom/melodix/music/MainActivity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/widget/LinearLayout;
    move-result-object v0
    return-object v0
.end method
