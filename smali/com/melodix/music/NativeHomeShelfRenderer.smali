.class public final Lcom/melodix/music/NativeHomeShelfRenderer;
.super Ljava/lang/Object;

# Spotify-mobile style Home: one horizontal shelf per section, each shelf
# holding square cover cards (artwork, title, subtitle). The previous flat
# list of full-width rows read like a settings table, not like the Spotify app.


# direct methods
.method public static render(Lcom/melodix/music/MainActivity;Ljava/lang/String;)V
    .locals 14

    # The Activity owns these private state fields. Reset through its public
    # API so the renderer never issues illegal cross-class private-field writes.
    invoke-virtual {p0}, Lcom/melodix/music/MainActivity;->beginNativeHomeRender()V

    # Renderer entry follows the Activity bridge receipt; content remains private.
    const-string v0, "home-data stage=android-render-start result=started"
    invoke-static {v0}, Lcom/melodix/music/NativeCrashGuard;->diagLine(Ljava/lang/String;)V
    invoke-static {v0}, Lcom/melodix/music/StartupDiagnosticOverlay;->appendDiagnosticLine(Ljava/lang/String;)V
    const-string v0, "home-json"

    invoke-static {v0}, Lcom/melodix/music/NativeCrashGuard;->stage(Ljava/lang/String;)V

    const v13, 0x7f090235

    invoke-virtual {p0, v13}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v13

    # The container is a LinearLayout inside a ScrollView; explicit cast keeps
    # the verifier happy before the addView calls below.
    check-cast v13, Landroid/widget/LinearLayout;

    if-eqz v13, :shelf_container_missing

    # Every payload replaces the previous view tree before attaching cards or a
    # safe status. This is also the private-row purge when libraryV3 proof is
    # withdrawn or a late empty/error payload arrives.
    invoke-virtual {v13}, Landroid/widget/LinearLayout;->removeAllViews()V

    :try_start_0
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0, p1}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V
    # The source payload is no longer needed after parsing; reuse its register
    # as a small counter so all non-range invokes remain within v0-v15.
    const/4 p1, 0x0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v1
    invoke-static {v0}, Lcom/melodix/music/NativeImageTrace;->payload(Lorg/json/JSONArray;)V
    invoke-static {v1}, Lcom/melodix/music/NativeHomeShelfRenderer;->traceHomeParsed(I)V

    if-lez v1, :shelf_no_cards

    # An explicit kind=state payload is not a Spotify card. It is accepted only
    # as its own visible status panel; arbitrary empty/diagnostic rows still fall
    # through to the WebView-safe no-card path. Mixed payloads render real rows.
    const/4 v2, 0x1
    if-ne v1, v2, :shelf_render_spotify_rows
    const/4 v2, 0x0
    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;
    move-result-object v2
    if-eqz v2, :shelf_render_spotify_rows
    const-string v3, "kind"
    const-string v4, ""
    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v3
    const-string v4, "state"
    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :shelf_render_spotify_rows
    invoke-static {p0, v13, v2}, Lcom/melodix/music/NativeHomeShelfRenderer;->renderHomeStatus(Lcom/melodix/music/MainActivity;Landroid/widget/LinearLayout;Lorg/json/JSONObject;)Z
    move-result v3
    if-eqz v3, :shelf_no_cards
    # MEL-BUG-038: the "Explorer Melodix" shortcut grid under the status card was
    # removed on user request — the signed-out Home now shows only the status
    # card. Real navigation stays available via the bottom tab bar.
    const-string v4, "status"
    invoke-static {v4}, Lcom/melodix/music/NativeHomeShelfRenderer;->traceHomeModel(Ljava/lang/String;)V
    invoke-static {v1, p1, v4}, Lcom/melodix/music/NativeHomeShelfRenderer;->traceHomeRendered(IILjava/lang/String;)V
    const-string v1, "native-home-status-attached"
    invoke-static {v1}, Lcom/melodix/music/NativeCrashGuard;->diagLine(Ljava/lang/String;)V
    invoke-static {v1}, Lcom/melodix/music/StartupDiagnosticOverlay;->appendDiagnosticLine(Ljava/lang/String;)V
    const-string v1, "native-home-render status-attached=true"
    invoke-static {v1}, Lcom/melodix/music/NativeCrashGuard;->diagLine(Ljava/lang/String;)V
    invoke-static {v1}, Lcom/melodix/music/StartupDiagnosticOverlay;->appendDiagnosticLine(Ljava/lang/String;)V
    const-string v1, "home-status-attached"
    invoke-static {v1}, Lcom/melodix/music/NativeCrashGuard;->stage(Ljava/lang/String;)V
    invoke-virtual {p0}, Lcom/melodix/music/MainActivity;->showNativeUi()V
    return-void

    :shelf_render_spotify_rows
    invoke-static {p0, v0}, Lcom/melodix/music/NativeImageLoader;->prefetch(Landroid/content/Context;Lorg/json/JSONArray;)V
    # Home uses shelves only: no duplicate two-column quick grid above them.

    const-string v2, ""

    const/4 v3, 0x0

    const/4 v4, 0x0

    :shelf_loop
    if-ge v4, v1, :shelf_finish

    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v5

    if-eqz v5, :shelf_next

    # Only real title text creates a card; never replace an empty source title
    # with a fabricated "Spotify" label.
    const-string v6, "title"
    const-string v7, ""
    invoke-virtual {v5, v6, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v6
    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z
    move-result v7
    if-eqz v7, :shelf_row_title_present
    goto :shelf_next
    :shelf_row_title_present

    # Home replacements accept only real Spotify resource URIs. Status/action
    # rows may describe errors, but they are never playable Home cards.
    const-string v6, "uri"
    const-string v7, ""
    invoke-virtual {v5, v6, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v6
    const-string v7, "spotify:"
    invoke-virtual {v6, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v7
    if-eqz v7, :shelf_next

    const-string v6, "section"

    invoke-virtual {v5, v6, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    # A brand-new shelf is needed when there is no container yet, or when the
    # section label changed. Rows without a heading share the first shelf.
    if-eqz v3, :shelf_new_section

    invoke-virtual {v6, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :shelf_have_container

    :shelf_new_section
    # New section: its own header and its own horizontal shelf.
    move-object v2, v6

    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-nez v7, :shelf_header_done

    invoke-static {p0, v6}, Lcom/melodix/music/NativeUiRowFactory;->createSectionHeader(Lcom/melodix/music/MainActivity;Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v7

    if-eqz v7, :shelf_header_done

    invoke-virtual {v13, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    :shelf_header_done
    new-instance v7, Landroid/widget/LinearLayout;

    invoke-direct {v7, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v8, 0x0

    invoke-virtual {v7, v8}, Landroid/widget/LinearLayout;->setOrientation(I)V

    new-instance v8, Landroid/widget/HorizontalScrollView;

    invoke-direct {v8, p0}, Landroid/widget/HorizontalScrollView;-><init>(Landroid/content/Context;)V

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Landroid/widget/HorizontalScrollView;->setHorizontalScrollBarEnabled(Z)V

    invoke-virtual {v8, v9}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    invoke-static {p0}, Lcom/melodix/music/NativeUiMetrics;->gutter(Landroid/content/Context;)I

    move-result v9

    const/4 v10, 0x0

    invoke-virtual {v8, v9, v10, v9, v10}, Landroid/view/View;->setPadding(IIII)V

    new-instance v9, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v10, -0x2

    invoke-direct {v9, v10, v10}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v8, v7, v9}, Landroid/widget/HorizontalScrollView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v9, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v10, -0x1
    const/4 v11, -0x2
    invoke-direct {v9, v10, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual {v13, v8, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    move-object v3, v7

    :shelf_have_container
    if-eqz v3, :shelf_next

    # Card container: square cover, title, subtitle.
    new-instance v7, Landroid/widget/LinearLayout;

    invoke-direct {v7, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v8, 0x1

    invoke-virtual {v7, v8}, Landroid/widget/LinearLayout;->setOrientation(I)V

    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    invoke-static {p0}, Lcom/melodix/music/NativeUiMetrics;->shelfCardWidth(Landroid/content/Context;)I

    move-result v9

    const/4 v10, -0x2

    invoke-direct {v8, v9, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-static {p0}, Lcom/melodix/music/NativeUiMetrics;->shelfGap(Landroid/content/Context;)I

    move-result v9

    iput v9, v8, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    invoke-virtual {v7, v8}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    const-string v8, "title"

    const-string v9, ""

    invoke-virtual {v5, v8, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-eqz v8, :shelf_cover_drawable

    goto :shelf_next

    :shelf_cover_drawable
    new-instance v8, Landroid/widget/ImageView;

    invoke-direct {v8, p0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    sget-object v10, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v8, v10}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    new-instance v10, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v10}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const v11, -0xe2e2e3

    invoke-virtual {v10, v11}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    invoke-static {p0}, Lcom/melodix/music/NativeUiMetrics;->shelfRadius(Landroid/content/Context;)I

    move-result v11

    int-to-float v11, v11

    invoke-virtual {v10, v11}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    invoke-virtual {v8, v10}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    const/4 v10, 0x1

    invoke-virtual {v8, v10}, Landroid/view/View;->setClipToOutline(Z)V

    const v10, 0x7f0800d6

    invoke-virtual {v8, v10}, Landroid/widget/ImageView;->setImageResource(I)V

    invoke-virtual {v8, v9}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    new-instance v10, Landroid/widget/LinearLayout$LayoutParams;

    invoke-static {p0}, Lcom/melodix/music/NativeUiMetrics;->shelfArtHeight(Landroid/content/Context;)I

    move-result v11

    invoke-direct {v10, v11, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v7, v8, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const-string v10, "image"

    const-string v11, ""

    invoke-virtual {v5, v10, v11}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-static {p0}, Lcom/melodix/music/NativeUiMetrics;->shelfArtHeight(Landroid/content/Context;)I
    move-result v11
    invoke-static {v8, v10, v11}, Lcom/melodix/music/NativeImageLoader;->load(Landroid/widget/ImageView;Ljava/lang/String;I)V

    :shelf_title
    new-instance v10, Landroid/widget/TextView;

    invoke-direct {v10, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v10, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v11, 0x41700000

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setTextSize(F)V

    sget v11, Lcom/melodix/music/MelColors;->accent:I

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setTextColor(I)V

    const/4 v11, 0x0

    const/4 v12, 0x1

    invoke-virtual {v10, v11, v12}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    const/4 v11, 0x2

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setMaxLines(I)V
    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setMinLines(I)V

    sget-object v11, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    new-instance v11, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v12, -0x1

    const/4 v6, -0x2

    invoke-direct {v11, v12, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-static {p0}, Lcom/melodix/music/NativeUiMetrics;->shelfSubtitleGap(Landroid/content/Context;)I

    move-result v12

    iput v12, v11, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    invoke-virtual {v7, v10, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const-string v10, "subtitle"

    const-string v11, ""

    invoke-virtual {v5, v10, v11}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/String;->isEmpty()Z

    move-result v11

    if-nez v11, :shelf_click

    new-instance v11, Landroid/widget/TextView;

    invoke-direct {v11, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v11, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v12, 0x41300000

    invoke-virtual {v11, v12}, Landroid/widget/TextView;->setTextSize(F)V

    sget v12, Lcom/melodix/music/MelColors;->textSecondary:I

    invoke-virtual {v11, v12}, Landroid/widget/TextView;->setTextColor(I)V

    const/4 v12, 0x2

    invoke-virtual {v11, v12}, Landroid/widget/TextView;->setMaxLines(I)V

    sget-object v12, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v11, v12}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    new-instance v12, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v6, -0x2

    invoke-direct {v12, v6, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/4 v6, -0x1

    iput v6, v12, Landroid/view/ViewGroup$LayoutParams;->width:I

    invoke-static {p0}, Lcom/melodix/music/NativeUiMetrics;->shelfTitleGap(Landroid/content/Context;)I

    move-result v6

    iput v6, v12, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    invoke-virtual {v7, v11, v12}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :shelf_click
    const-string v10, "uri"

    const-string v11, ""

    invoke-virtual {v5, v10, v11}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/String;->isEmpty()Z

    move-result v11

    if-nez v11, :shelf_add

    # Rounded ripple so a cover card reacts to the touch like the Spotify app.
    const-string v11, "native_card_ripple"

    invoke-static {p0, v7, v11}, Lcom/melodix/music/NativeUiRowFactory;->applyDrawableBackground(Landroid/content/Context;Landroid/view/View;Ljava/lang/String;)V

    const/4 v11, 0x1

    invoke-virtual {v7, v11}, Landroid/view/View;->setClickable(Z)V

    invoke-virtual {v7, v11}, Landroid/view/View;->setFocusable(Z)V

    new-instance v11, Lcom/melodix/music/NativeRowClickListener;

    invoke-direct {v11, p0, v10, v9}, Lcom/melodix/music/NativeRowClickListener;-><init>(Lcom/melodix/music/MainActivity;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v7, v11}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :shelf_add
    invoke-static {v7, v4}, Lcom/melodix/music/NativeSkeleton;->reveal(Landroid/view/View;I)V
    invoke-virtual {v3, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V
    invoke-virtual {p0, v7}, Lcom/melodix/music/MainActivity;->noteNativeHomeCardAttached(Landroid/view/View;)V
    add-int/lit8 p1, p1, 0x1

    :shelf_next
    add-int/lit8 v4, v4, 0x1

    goto :shelf_loop

    :shelf_finish
    invoke-virtual {p0}, Lcom/melodix/music/MainActivity;->hasNativeHomeCardsAttached()Z
    move-result v5
    if-eqz v5, :shelf_no_cards
    const-string v5, "cards"
    invoke-static {v5}, Lcom/melodix/music/NativeHomeShelfRenderer;->traceHomeModel(Ljava/lang/String;)V

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v6, -0x1

    invoke-static {p0}, Lcom/melodix/music/NativeUiMetrics;->shelfSpacer(Landroid/content/Context;)I

    move-result v7

    invoke-direct {v5, v6, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    new-instance v6, Landroid/view/View;

    invoke-direct {v6, p0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    invoke-virtual {v13, v6, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    goto :shelf_done

    :shelf_no_cards
    if-lez v1, :shelf_model_empty
    const-string v0, "invalid"
    goto :shelf_model_result_ready
    :shelf_model_empty
    const-string v0, "empty"
    :shelf_model_result_ready
    invoke-static {v0}, Lcom/melodix/music/NativeHomeShelfRenderer;->traceHomeModel(Ljava/lang/String;)V
    const-string v0, "failed"
    invoke-static {v1, p1, v0}, Lcom/melodix/music/NativeHomeShelfRenderer;->traceHomeRendered(IILjava/lang/String;)V
    # Empty payloads, diagnostic rows and malformed cards do not make playable
    # cards. Replace them with a native error/retry panel, never a Web takeover.
    const-string v1, "MDXTRACE"
    const-string v2, "home-render failed reason=no-real-spotify-cards; native retry state requested"
    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    const-string v1, "native-render-failed step=home-render reason=no-real-cards"
    invoke-static {v1}, Lcom/melodix/music/NativeCrashGuard;->diagLine(Ljava/lang/String;)V
    invoke-static {v1}, Lcom/melodix/music/StartupDiagnosticOverlay;->appendDiagnosticLine(Ljava/lang/String;)V
    const-string v1, "native-home-render rendered=false reason=no-real-cards"
    invoke-static {v1}, Lcom/melodix/music/NativeCrashGuard;->diagLine(Ljava/lang/String;)V
    invoke-static {v1}, Lcom/melodix/music/StartupDiagnosticOverlay;->appendDiagnosticLine(Ljava/lang/String;)V
    const-string v0, "home-render-failed"
    invoke-static {v0}, Lcom/melodix/music/NativeCrashGuard;->stage(Ljava/lang/String;)V
    # A missing/invalid Home payload becomes a native state, not an automatic
    # Spotify-Web takeover. This contains no account resources. When the session
    # was explicitly marked unproven, the card must offer authentication first:
    # a bare "Réessayer" hides the real cause (incident: reconnexion sans données).
    invoke-virtual {p0}, Lcom/melodix/music/MainActivity;->isNativeSessionUnproven()Z
    move-result v3
    if-eqz v3, :shelf_no_cards_retry
    const-string v2, "[{\"kind\":\"state\",\"state\":\"error\",\"sessionUnproven\":true,\"title\":\"Connexion Spotify requise\",\"subtitle\":\"Aucune session Spotify n’est confirmée sur cet appareil. Connectez-vous pour retrouver vos données ; vous pouvez aussi réessayer.\",\"section\":\"Accueil\",\"image\":\"\",\"uri\":\"melodix:action:open-login\",\"secondaryUri\":\"melodix:action:retry-library\"}]"
    goto :shelf_no_cards_render
    :shelf_no_cards_retry
    const-string v2, "[{\"kind\":\"state\",\"state\":\"error\",\"title\":\"Votre accueil n’a pas pu être chargé\",\"subtitle\":\"Les données Spotify ne sont pas disponibles. Touchez pour réessayer.\",\"section\":\"Accueil\",\"image\":\"\",\"uri\":\"melodix:action:retry-library\"}]"
    :shelf_no_cards_render
    invoke-static {p0, v2}, Lcom/melodix/music/NativeHomeShelfRenderer;->render(Lcom/melodix/music/MainActivity;Ljava/lang/String;)V
    return-void

    :shelf_done
    invoke-static {v13}, Lcom/melodix/music/NativeShelfLayoutProbe;->schedule(Landroid/view/View;)V
    const-string v0, "rendered"
    invoke-static {v1, p1, v0}, Lcom/melodix/music/NativeHomeShelfRenderer;->traceHomeRendered(IILjava/lang/String;)V
    # Startup timing: the cards exist in the view tree and are attached. This is
    # "first paint" in the only sense the renderer can attest to; the measured
    # visible rect is recorded later by completeNativeUiVisibility().
    const-string v0, "home-first-paint"
    invoke-static {v0}, Lcom/melodix/music/NativeCrashGuard;->perfMark(Ljava/lang/String;)V
    # This is attached-view evidence only. Pixel-visible readiness is recorded
    # later by completeNativeUiVisibility() after a measured global rect.
    const-string v0, "native-home-cards-attached"
    invoke-static {v0}, Lcom/melodix/music/NativeCrashGuard;->diagLine(Ljava/lang/String;)V
    invoke-static {v0}, Lcom/melodix/music/StartupDiagnosticOverlay;->appendDiagnosticLine(Ljava/lang/String;)V
    const-string v0, "native-home-render cards-attached=true"
    invoke-static {v0}, Lcom/melodix/music/NativeCrashGuard;->diagLine(Ljava/lang/String;)V
    invoke-static {v0}, Lcom/melodix/music/StartupDiagnosticOverlay;->appendDiagnosticLine(Ljava/lang/String;)V
    const-string v0, "home-cards-attached"
    invoke-static {v0}, Lcom/melodix/music/NativeCrashGuard;->stage(Ljava/lang/String;)V
    # Data may arrive again after a route return even when the ready callback
    # was already sent. The visible-root trace performs the final takeover gate.
    invoke-virtual {p0}, Lcom/melodix/music/MainActivity;->showNativeUi()V
    return-void

    :shelf_container_missing
    const-string v0, "unavailable"
    invoke-static {v0}, Lcom/melodix/music/NativeHomeShelfRenderer;->traceHomeModel(Ljava/lang/String;)V
    const-string v0, "MDXTRACE"
    const-string v1, "home-render failed reason=native-content-missing"
    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    const-string v1, "native-render-failed step=home-render reason=content-container"
    invoke-static {v1}, Lcom/melodix/music/NativeCrashGuard;->diagLine(Ljava/lang/String;)V
    invoke-static {v1}, Lcom/melodix/music/StartupDiagnosticOverlay;->appendDiagnosticLine(Ljava/lang/String;)V
    const-string v1, "native-home-render rendered=false reason=content-container"
    invoke-static {v1}, Lcom/melodix/music/NativeCrashGuard;->diagLine(Ljava/lang/String;)V
    invoke-static {v1}, Lcom/melodix/music/StartupDiagnosticOverlay;->appendDiagnosticLine(Ljava/lang/String;)V
    const-string v0, "home-render-failed"
    invoke-static {v0}, Lcom/melodix/music/NativeCrashGuard;->stage(Ljava/lang/String;)V
    return-void

    :catch_0
    move-exception v0
    const-string v1, "home-data stage=android-parsed result=invalid"
    invoke-static {v1}, Lcom/melodix/music/NativeCrashGuard;->diagLine(Ljava/lang/String;)V
    invoke-static {v1}, Lcom/melodix/music/StartupDiagnosticOverlay;->appendDiagnosticLine(Ljava/lang/String;)V
    const-string v1, "invalid"
    invoke-static {v1}, Lcom/melodix/music/NativeHomeShelfRenderer;->traceHomeModel(Ljava/lang/String;)V
    const-string v1, "native-render-failed step=home-render exception=JSONException reason=invalid-json"
    invoke-static {v1}, Lcom/melodix/music/NativeCrashGuard;->diagLine(Ljava/lang/String;)V
    invoke-static {v1}, Lcom/melodix/music/StartupDiagnosticOverlay;->appendDiagnosticLine(Ljava/lang/String;)V
    const-string v1, "MDXTRACE"
    const-string v2, "home-render failed reason=invalid-json"
    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    const-string v1, "native-home-render rendered=false reason=invalid-json"
    invoke-static {v1}, Lcom/melodix/music/NativeCrashGuard;->diagLine(Ljava/lang/String;)V
    invoke-static {v1}, Lcom/melodix/music/StartupDiagnosticOverlay;->appendDiagnosticLine(Ljava/lang/String;)V
    const-string v1, "home-render-failed"
    invoke-static {v1}, Lcom/melodix/music/NativeCrashGuard;->stage(Ljava/lang/String;)V
    const-string v2, "[{\"kind\":\"state\",\"state\":\"error\",\"title\":\"Les données n’ont pas pu être lues\",\"subtitle\":\"Touchez pour réessayer le chargement de la bibliothèque.\",\"section\":\"Accueil\",\"image\":\"\",\"uri\":\"melodix:action:retry-library\"}]"
    invoke-static {p0, v2}, Lcom/melodix/music/NativeHomeShelfRenderer;->render(Lcom/melodix/music/MainActivity;Ljava/lang/String;)V
    return-void
.end method

.method private static renderHomeStatus(Lcom/melodix/music/MainActivity;Landroid/widget/LinearLayout;Lorg/json/JSONObject;)Z
    .locals 13

    invoke-static {p0, p2}, Lcom/melodix/music/NativeSessionStatus;->prepare(Lcom/melodix/music/MainActivity;Lorg/json/JSONObject;)V


    const-string v1, "title"
    const-string v2, ""
    invoke-virtual {p2, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z
    move-result v1
    if-eqz v1, :home_status_title_ready
    const/4 v1, 0x0
    return v1

    :home_status_title_ready
    const-string v1, "subtitle"
    const-string v2, ""
    invoke-virtual {p2, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1

    const-string v2, "section"
    const-string v3, "Spotify"
    invoke-virtual {p2, v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z
    move-result v3
    if-nez v3, :home_status_section_ready
    const-string v2, "Spotify"

    :home_status_section_ready
    # A compact, responsive card replaces the old unframed centre text. It is
    # status-only: the background/icon are app chrome, never Spotify content.
    new-instance v3, Landroid/widget/LinearLayout;
    invoke-direct {v3, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
    const/4 v4, 0x1
    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setOrientation(I)V
    const v4, 0x800003
    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setGravity(I)V
    invoke-static {p0}, Lcom/melodix/music/NativeHomeShelfRenderer;->createHomeStatusBackground(Landroid/content/Context;)Landroid/graphics/drawable/GradientDrawable;
    move-result-object v4
    invoke-virtual {v3, v4}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    invoke-static {p0}, Lcom/melodix/music/NativeUiMetrics;->statusPadH(Landroid/content/Context;)I
    move-result v4
    invoke-static {p0}, Lcom/melodix/music/NativeUiMetrics;->statusPadV(Landroid/content/Context;)I
    move-result v5
    invoke-virtual {v3, v4, v5, v4, v5}, Landroid/view/View;->setPadding(IIII)V

    invoke-static {p0, p1}, Lcom/melodix/music/NativeHomeShelfRenderer;->homeStatusCardWidth(Landroid/content/Context;Landroid/view/View;)I
    move-result v4
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v6, -0x2
    invoke-direct {v5, v4, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    const/4 v6, 0x1
    iput v6, v5, Landroid/widget/LinearLayout$LayoutParams;->gravity:I
    invoke-static {p0}, Lcom/melodix/music/NativeUiMetrics;->statusMarginV(Landroid/content/Context;)I
    move-result v6
    iput v6, v5, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I
    iput v6, v5, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I
    invoke-virtual {p1, v3, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    # A real loading indicator for state=loading: text alone gave no feedback
    # that verification was in progress (incident P0, accueil).
    const-string v6, "state"
    const-string v7, ""
    invoke-virtual {p2, v6, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v6
    const-string v7, "loading"
    invoke-virtual {v7, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v7
    if-eqz v7, :home_status_no_spinner
    invoke-static {p0, v3}, Lcom/melodix/music/NativeSkeleton;->attach(Landroid/content/Context;Landroid/widget/LinearLayout;)V
    new-instance v6, Landroid/widget/ProgressBar;
    invoke-direct {v6, p0}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;)V
    const/4 v7, 0x1
    invoke-virtual {v6, v7}, Landroid/widget/ProgressBar;->setIndeterminate(Z)V
    const-string v7, "mel_splash_spinner"
    const/16 v8, 0x1e
    invoke-static {p0, v7, v8}, Lcom/melodix/music/NativeUiRowFactory;->metric(Landroid/content/Context;Ljava/lang/String;I)I
    move-result v7
    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct {v8, v7, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    const/4 v9, 0x0
    iput v9, v8, Landroid/widget/LinearLayout$LayoutParams;->gravity:I
    invoke-static {p0}, Lcom/melodix/music/NativeUiMetrics;->statusMarginV(Landroid/content/Context;)I
    move-result v9
    iput v9, v8, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I
    invoke-virtual {v3, v6, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    :home_status_no_spinner

    # Brand-neutral music glyph in a soft accent circle, beside the state label.
    new-instance v5, Landroid/widget/LinearLayout;
    invoke-direct {v5, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
    const/4 v6, 0x0
    invoke-virtual {v5, v6}, Landroid/widget/LinearLayout;->setOrientation(I)V
    const/16 v6, 0x10
    invoke-virtual {v5, v6}, Landroid/widget/LinearLayout;->setGravity(I)V
    invoke-static {p0}, Lcom/melodix/music/NativeHomeShelfRenderer;->createHomeStatusIcon(Landroid/content/Context;)Landroid/widget/ImageView;
    move-result-object v6
    invoke-static {p0}, Lcom/melodix/music/NativeUiMetrics;->statusIcon(Landroid/content/Context;)I
    move-result v7
    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct {v8, v7, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-static {p0}, Lcom/melodix/music/NativeUiMetrics;->statusIconGap(Landroid/content/Context;)I
    move-result v7
    iput v7, v8, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I
    invoke-virtual {v5, v6, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v4, Landroid/widget/LinearLayout;
    invoke-direct {v4, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
    const/4 v6, 0x1
    invoke-virtual {v4, v6}, Landroid/widget/LinearLayout;->setOrientation(I)V
    const/16 v6, 0x10
    invoke-virtual {v4, v6}, Landroid/widget/LinearLayout;->setGravity(I)V

    sget v7, Lcom/melodix/music/MelColors;->accent:I
    const/4 v8, 0x1
    const/high16 v9, 0x41300000
    invoke-static {p0, v2, v7, v8, v9}, Lcom/melodix/music/NativeHomeShelfRenderer;->createHomeStatusText(Landroid/content/Context;Ljava/lang/String;IZF)Landroid/widget/TextView;
    move-result-object v6
    const/4 v7, 0x1
    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setMaxLines(I)V
    invoke-virtual {v4, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    sget v7, Lcom/melodix/music/MelColors;->textPrimary:I
    const/4 v8, 0x1
    const/high16 v9, 0x41900000
    invoke-static {p0, v0, v7, v8, v9}, Lcom/melodix/music/NativeHomeShelfRenderer;->createHomeStatusText(Landroid/content/Context;Ljava/lang/String;IZF)Landroid/widget/TextView;
    move-result-object v6
    const/4 v7, 0x2
    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setMaxLines(I)V
    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v8, -0x1
    const/4 v9, -0x2
    invoke-direct {v7, v8, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-static {p0}, Lcom/melodix/music/NativeUiMetrics;->statusLabelGap(Landroid/content/Context;)I
    move-result v8
    iput v8, v7, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I
    invoke-virtual {v4, v6, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v8, 0x0
    const/4 v9, -0x2
    const/high16 v10, 0x3f800000
    invoke-direct {v7, v8, v9, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V
    invoke-virtual {v5, v4, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    invoke-virtual {v3, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    # MEL-BUG-063: the trailing " [auth=...]" self-diagnostic is split out of
    # the subtitle and rendered as its own larger bold-monospace warning line,
    # so the real error is readable at a glance from one screenshot.
    const-string v4, " [auth="
    invoke-virtual {v1, v4}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I
    move-result v4
    const/4 v5, 0x0
    if-ltz v4, :home_status_subtitle_ready
    add-int/lit8 v6, v4, 0x1
    invoke-virtual {v1, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object v5
    const/4 v6, 0x0
    invoke-virtual {v1, v6, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v1
    :home_status_subtitle_ready
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z
    move-result v4
    if-nez v4, :home_status_diag
    sget v7, Lcom/melodix/music/MelColors;->textSecondary:I
    const/4 v8, 0x0
    const/high16 v9, 0x41600000
    invoke-static {p0, v1, v7, v8, v9}, Lcom/melodix/music/NativeHomeShelfRenderer;->createHomeStatusText(Landroid/content/Context;Ljava/lang/String;IZF)Landroid/widget/TextView;
    move-result-object v6
    const/4 v7, 0x5
    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setMaxLines(I)V
    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v8, -0x1
    const/4 v9, -0x2
    invoke-direct {v7, v8, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-static {p0}, Lcom/melodix/music/NativeUiMetrics;->statusSublabelGap(Landroid/content/Context;)I
    move-result v8
    iput v8, v7, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I
    invoke-virtual {v3, v6, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :home_status_diag
    # MEL-BUG-083: the raw " [auth=...]" string used to be painted full size in
    # red monospace under the message, which reads as a crash to anyone who is
    # not debugging. It now lives in a collapsed "Détails techniques" row:
    # 12sp, secondary colour, closed by default. No red is left in the card.
    if-eqz v5, :home_status_actions
    invoke-static {p0, v3, v5}, Lcom/melodix/music/NativeHomeShelfRenderer;->addHomeStatusDetails(Lcom/melodix/music/MainActivity;Landroid/widget/LinearLayout;Ljava/lang/String;)V

    :home_status_actions
    const-string v7, "uri"
    const-string v8, ""
    invoke-virtual {p2, v7, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v10
    const-string v7, "secondaryUri"
    const-string v8, ""
    invoke-virtual {p2, v7, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v11
    invoke-static {p0, v3, v10, v11, v0}, Lcom/melodix/music/NativeHomeShelfRenderer;->addHomeStatusActions(Lcom/melodix/music/MainActivity;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, v3}, Lcom/melodix/music/MainActivity;->noteNativeHomeStatusAttached(Landroid/view/View;)V
    const-string v7, "sessionUnproven"
    invoke-virtual {p2, v7}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z
    move-result v7
    if-eqz v7, :home_status_session_state_marked
    invoke-virtual {p0, v3}, Lcom/melodix/music/MainActivity;->noteNativeHomeSessionUnprovenStatusAttached(Landroid/view/View;)V
    :home_status_session_state_marked
    const/4 v7, 0x1
    return v7
.end method

.method private static addHomeStatusDetails(Lcom/melodix/music/MainActivity;Landroid/widget/LinearLayout;Ljava/lang/String;)V
    .locals 9

    # A disclosure, not a banner. The card shows one readable sentence; the
    # machine string is one tap away, and the same string can be copied with
    # the existing header-chip handler (one copy path in the whole app).

    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const-string v1, "D\u00e9tails techniques"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    sget v1, Lcom/melodix/music/MelColors;->textSecondary:I

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    const/high16 v1, 0x41300000

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setClickable(Z)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setFocusable(Z)V

    invoke-static {p0}, Lcom/melodix/music/NativeUiMetrics;->statusActionHeight(Landroid/content/Context;)I

    move-result v3

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setMinimumHeight(I)V

    const/16 v3, 0x10

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setGravity(I)V

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v4, -0x2

    const/4 v5, -0x2

    invoke-direct {v3, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-static {p0}, Lcom/melodix/music/NativeUiMetrics;->statusDisclosureGap(Landroid/content/Context;)I

    move-result v4

    iput v4, v3, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    invoke-virtual {p1, v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v3, Landroid/widget/TextView;

    invoke-direct {v3, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    sget v4, Lcom/melodix/music/MelColors;->textSecondary:I

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(I)V

    const/high16 v4, 0x41400000

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextSize(F)V

    sget-object v4, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;

    invoke-virtual {v3, v4, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    invoke-virtual {v3, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/16 v4, 0x8

    invoke-virtual {v3, v4}, Landroid/view/View;->setVisibility(I)V

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v5, -0x1

    const/4 v6, -0x2

    invoke-direct {v4, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-static {p0}, Lcom/melodix/music/NativeUiMetrics;->statusDisclosureGap(Landroid/content/Context;)I

    move-result v5

    iput v5, v4, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    invoke-virtual {p1, v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    # Toggle: flips visibility and keeps its own announced state in sync.
    new-instance v4, Lcom/melodix/music/NativeHomeShelfRenderer$DetailsToggle;

    invoke-direct {v4, v0, v3}, Lcom/melodix/music/NativeHomeShelfRenderer$DetailsToggle;-><init>(Landroid/widget/TextView;Landroid/widget/TextView;)V

    invoke-virtual {v0, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    # Copy: reuses MainActivity.onNativeDiagCopyClick, the single existing path.
    new-instance v4, Landroid/widget/TextView;

    invoke-direct {v4, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const-string v5, "Copier le diagnostic"

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v4, v5}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    sget v5, Lcom/melodix/music/MelColors;->textPrimary:I

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextColor(I)V

    const/high16 v5, 0x41300000

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextSize(F)V

    invoke-virtual {v4, v1}, Landroid/view/View;->setClickable(Z)V

    invoke-virtual {v4, v1}, Landroid/view/View;->setFocusable(Z)V

    const/16 v5, 0x11

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setGravity(I)V

    invoke-static {p0}, Lcom/melodix/music/NativeUiMetrics;->statusActionHeight(Landroid/content/Context;)I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setMinimumHeight(I)V

    const-string v5, "native_button_dark"

    invoke-static {p0, v4, v5}, Lcom/melodix/music/NativeUiRowFactory;->applyDrawableBackground(Landroid/content/Context;Landroid/view/View;Ljava/lang/String;)V

    new-instance v5, Lcom/melodix/music/NativeHomeShelfRenderer$CopyDiagnosticAction;

    invoke-direct {v5, p0}, Lcom/melodix/music/NativeHomeShelfRenderer$CopyDiagnosticAction;-><init>(Lcom/melodix/music/MainActivity;)V

    invoke-virtual {v4, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v6, -0x2

    invoke-static {p0}, Lcom/melodix/music/NativeUiMetrics;->statusActionHeight(Landroid/content/Context;)I

    move-result v7

    # Fill the available card width and let scaled text wrap; the view already
    # has a 48dp minimum height. A fixed height clips at large font scales.
    const/4 v6, -0x1
    const/4 v7, -0x2
    invoke-direct {v5, v6, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-static {p0}, Lcom/melodix/music/NativeUiMetrics;->statusDisclosureGap(Landroid/content/Context;)I

    move-result v6

    iput v6, v5, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    invoke-virtual {p1, v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method private static createHomeStatusBackground(Landroid/content/Context;)Landroid/graphics/drawable/GradientDrawable;
    .locals 7

    const/4 v0, 0x2
    new-array v0, v0, [I
    sget v1, Lcom/melodix/music/MelColors;->surfaceHigh:I
    const/4 v2, 0x0
    aput v1, v0, v2
    sget v1, Lcom/melodix/music/MelColors;->surface:I
    const/4 v2, 0x1
    aput v1, v0, v2
    sget-object v1, Landroid/graphics/drawable/GradientDrawable$Orientation;->TOP_BOTTOM:Landroid/graphics/drawable/GradientDrawable$Orientation;
    new-instance v2, Landroid/graphics/drawable/GradientDrawable;
    invoke-direct {v2, v1, v0}, Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable$Orientation;[I)V
    invoke-static {p0}, Lcom/melodix/music/NativeUiMetrics;->statusRadius(Landroid/content/Context;)I

    move-result v3
    int-to-float v3, v3
    invoke-virtual {v2, v3}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V
    invoke-static {p0}, Lcom/melodix/music/NativeUiMetrics;->statusStroke(Landroid/content/Context;)I

    move-result v3
    # MEL-BUG-058: hairline ACCENT stroke on the status card (glass vibe).
    sget v4, Lcom/melodix/music/MelColors;->strokeAccent:I
    invoke-virtual {v2, v3, v4}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V
    return-object v2
.end method

.method private static createHomeStatusIcon(Landroid/content/Context;)Landroid/widget/ImageView;
    .locals 7

    new-instance v0, Landroid/widget/ImageView;
    invoke-direct {v0, p0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V
    sget-object v1, Landroid/widget/ImageView$ScaleType;->CENTER_INSIDE:Landroid/widget/ImageView$ScaleType;
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V
    new-instance v1, Landroid/graphics/drawable/GradientDrawable;
    invoke-direct {v1}, Landroid/graphics/drawable/GradientDrawable;-><init>()V
    const/4 v2, 0x1
    invoke-virtual {v1, v2}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V
    # MEL-BUG-039: glass icon disc — translucent white fill + hairline light
    # stroke, Apple-style, instead of the solid accent glow.
    sget v2, Lcom/melodix/music/MelColors;->glassFill:I
    invoke-virtual {v1, v2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V
    const/4 v2, 0x1
    sget v3, Lcom/melodix/music/MelColors;->glassStroke:I
    invoke-virtual {v1, v2, v3}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V
    invoke-static {p0}, Lcom/melodix/music/NativeUiMetrics;->statusIconPad(Landroid/content/Context;)I
    move-result v2
    invoke-virtual {v0, v2, v2, v2, v2}, Landroid/view/View;->setPadding(IIII)V
    const-string v2, "native_cover_placeholder"
    invoke-static {p0, v0, v2}, Lcom/melodix/music/NativeUiRowFactory;->applyDrawableImage(Landroid/content/Context;Landroid/widget/ImageView;Ljava/lang/String;)V
    sget v2, Lcom/melodix/music/MelColors;->accent:I
    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setColorFilter(I)V
    const-string v2, "État de connexion"
    invoke-virtual {v0, v2}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V
    return-object v0
.end method

.method private static createHomeStatusText(Landroid/content/Context;Ljava/lang/String;IZF)Landroid/widget/TextView;
    .locals 5

    new-instance v0, Landroid/widget/TextView;
    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setTextColor(I)V
    invoke-virtual {v0, p4}, Landroid/widget/TextView;->setTextSize(F)V
    const v1, 0x800003
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setGravity(I)V
    const/4 v1, 0x5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMaxLines(I)V
    sget-object v1, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V
    if-eqz p3, :home_status_text_ready
    const/4 v1, 0x0
    const/4 v2, 0x1
    invoke-virtual {v0, v1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V
    :home_status_text_ready
    const/4 v1, 0x0
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setIncludeFontPadding(Z)V
    return-object v0
.end method

.method private static addHomeStatusActions(Lcom/melodix/music/MainActivity;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 10

    if-eqz p2, :home_status_no_actions
    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z
    move-result v1
    if-nez v1, :home_status_no_actions

    new-instance v0, Landroid/widget/LinearLayout;
    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
    const/4 v1, 0x0
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V
    const/16 v1, 0x10
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    const/4 v1, 0x1
    invoke-static {p0, p2, p4, v1}, Lcom/melodix/music/NativeHomeShelfRenderer;->createHomeStatusAction(Lcom/melodix/music/MainActivity;Ljava/lang/String;Ljava/lang/String;Z)Landroid/widget/TextView;
    move-result-object v2
    if-eqz v2, :home_status_no_actions

    const/4 v4, 0x0
    invoke-static {p0}, Lcom/melodix/music/NativeUiMetrics;->statusActionHeight(Landroid/content/Context;)I
    move-result v5
    const/high16 v6, 0x3f800000
    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct {v7, v4, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V
    if-eqz p3, :home_status_add_primary
    invoke-virtual {p3}, Ljava/lang/String;->isEmpty()Z
    move-result v8
    if-nez v8, :home_status_add_primary
    invoke-static {p0}, Lcom/melodix/music/NativeUiMetrics;->statusActionGap(Landroid/content/Context;)I
    move-result v8
    iput v8, v7, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    :home_status_add_primary
    invoke-virtual {v0, v2, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    if-eqz p3, :home_status_action_row_attach
    invoke-virtual {p3}, Ljava/lang/String;->isEmpty()Z
    move-result v8
    if-nez v8, :home_status_action_row_attach
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v8
    if-nez v8, :home_status_action_row_attach
    const/4 v1, 0x0
    invoke-static {p0, p3, p4, v1}, Lcom/melodix/music/NativeHomeShelfRenderer;->createHomeStatusAction(Lcom/melodix/music/MainActivity;Ljava/lang/String;Ljava/lang/String;Z)Landroid/widget/TextView;
    move-result-object v3
    if-eqz v3, :home_status_action_row_attach
    const/4 v4, 0x0
    invoke-static {p0}, Lcom/melodix/music/NativeUiMetrics;->statusActionHeight(Landroid/content/Context;)I
    move-result v5
    const/high16 v6, 0x3f800000
    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct {v7, v4, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V
    invoke-virtual {v0, v3, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :home_status_action_row_attach
    new-instance v9, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v4, -0x1
    const/4 v5, -0x2
    invoke-direct {v9, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-static {p0}, Lcom/melodix/music/NativeUiMetrics;->statusActionsGap(Landroid/content/Context;)I
    move-result v4
    iput v4, v9, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I
    invoke-virtual {p1, v0, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :home_status_no_actions
    return-void
.end method

.method private static createHomeStatusAction(Lcom/melodix/music/MainActivity;Ljava/lang/String;Ljava/lang/String;Z)Landroid/widget/TextView;
    .locals 6

    const-string v0, "melodix:action:reconnect"
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :home_status_action_login
    const-string v1, "Se reconnecter"
    goto :home_status_action_label_ready
    :home_status_action_login
    const-string v0, "melodix:action:open-login"
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :home_status_action_retry
    const-string v1, "Se connecter"
    goto :home_status_action_label_ready

    :home_status_action_retry
    const-string v0, "melodix:action:retry-library"
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :home_status_action_settings
    const-string v1, "Réessayer"
    goto :home_status_action_label_ready

    :home_status_action_settings
    const-string v0, "melodix:action:open-settings"
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :home_status_action_invalid
    const-string v1, "Réglages"
    goto :home_status_action_label_ready

    :home_status_action_invalid
    const/4 v0, 0x0
    return-object v0

    :home_status_action_label_ready
    new-instance v0, Landroid/widget/TextView;
    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    invoke-virtual {v0, v1}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V
    const/high16 v2, 0x41700000
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextSize(F)V
    if-eqz p3, :home_status_action_secondary
    sget v3, Lcom/melodix/music/MelColors;->textPrimary:I
    const-string v2, "native_button_green"
    goto :home_status_action_color_ready
    :home_status_action_secondary
    sget v3, Lcom/melodix/music/MelColors;->textSecondary:I
    const-string v2, "native_button_dark"
    :home_status_action_color_ready
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextColor(I)V
    const/16 v3, 0x11
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setGravity(I)V
    const/4 v3, 0x0
    const/4 v4, 0x1
    invoke-virtual {v0, v3, v4}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V
    const/4 v3, 0x1
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setMaxLines(I)V
    sget-object v3, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V
    invoke-static {p0}, Lcom/melodix/music/NativeUiMetrics;->statusActionHeight(Landroid/content/Context;)I
    move-result v3
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setMinimumHeight(I)V
    invoke-static {p0}, Lcom/melodix/music/NativeUiMetrics;->statusActionPadH(Landroid/content/Context;)I
    move-result v3
    invoke-static {p0}, Lcom/melodix/music/NativeUiMetrics;->statusActionPadV(Landroid/content/Context;)I
    move-result v4
    invoke-virtual {v0, v3, v4, v3, v4}, Landroid/view/View;->setPadding(IIII)V
    invoke-static {p0, v0, v2}, Lcom/melodix/music/NativeUiRowFactory;->applyDrawableBackground(Landroid/content/Context;Landroid/view/View;Ljava/lang/String;)V
    const/4 v3, 0x1
    invoke-virtual {v0, v3}, Landroid/view/View;->setClickable(Z)V
    invoke-virtual {v0, v3}, Landroid/view/View;->setFocusable(Z)V
    new-instance v3, Lcom/melodix/music/NativeRowClickListener;
    invoke-direct {v3, p0, p1, p2}, Lcom/melodix/music/NativeRowClickListener;-><init>(Lcom/melodix/music/MainActivity;Ljava/lang/String;Ljava/lang/String;)V
    invoke-virtual {v0, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V
    return-object v0
.end method

.method private static homeStatusCardWidth(Landroid/content/Context;Landroid/view/View;)I
    .locals 4

    # Prefer the measured native content width so display cutouts and
    # multi-window bounds are honored; use display metrics only before layout.
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I
    move-result v1
    if-lez v1, :home_status_width_fallback
    goto :home_status_width_cap

    :home_status_width_fallback
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v0
    iget v1, v0, Landroid/util/DisplayMetrics;->widthPixels:I
    invoke-static {p0}, Lcom/melodix/music/NativeUiMetrics;->statusWidthInset(Landroid/content/Context;)I

    move-result v2
    sub-int/2addr v1, v2

    :home_status_width_cap
    invoke-static {p0}, Lcom/melodix/music/NativeUiMetrics;->statusMaxWidth(Landroid/content/Context;)I

    move-result v2
    if-le v1, v2, :home_status_width_ready
    move v1, v2
    :home_status_width_ready
    return v1
.end method

.method private static createQuickTile(Lcom/melodix/music/MainActivity;Lorg/json/JSONObject;)Landroid/widget/LinearLayout;
    .locals 10

    # One compact "recent item" tile: 56 dp cover on the left, bold two-line
    # title on the right. Spotify's home tab opens on the same grid.
    const-string v0, "title"
    const-string v1, ""

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "image"
    const-string v2, ""

    invoke-virtual {p1, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "uri"
    const-string v3, ""

    invoke-virtual {p1, v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    # Empty titles or missing Spotify URIs are not real playable cards. Return
    # null so the caller skips them; do not invent display text or navigation.
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z
    move-result v3
    if-eqz v3, :quick_tile_title_valid
    const/4 v3, 0x0
    return-object v3
    :quick_tile_title_valid
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z
    move-result v3
    if-nez v3, :quick_tile_invalid
    const-string v3, "spotify:"
    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v3
    if-eqz v3, :quick_tile_invalid
    goto :quick_tile_uri_valid
    :quick_tile_invalid
    const/4 v3, 0x0
    return-object v3
    :quick_tile_uri_valid

    new-instance v3, Landroid/widget/LinearLayout;

    invoke-direct {v3, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 v4, 0x10

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setGravity(I)V

    const-string v4, "native_quick_tile"

    invoke-static {p0, v3, v4}, Lcom/melodix/music/NativeUiRowFactory;->applyDrawableBackground(Landroid/content/Context;Landroid/view/View;Ljava/lang/String;)V

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Landroid/view/View;->setClickable(Z)V

    invoke-virtual {v3, v4}, Landroid/view/View;->setFocusable(Z)V

    new-instance v4, Landroid/widget/ImageView;

    invoke-direct {v4, p0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    sget-object v5, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    invoke-static {p0}, Lcom/melodix/music/NativeUiMetrics;->quickArt(Landroid/content/Context;)I
    move-result v6

    invoke-direct {v5, v6, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v3, v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-static {p0}, Lcom/melodix/music/NativeUiMetrics;->quickArt(Landroid/content/Context;)I

    move-result v5

    invoke-static {v4, v1, v5}, Lcom/melodix/music/NativeImageLoader;->load(Landroid/widget/ImageView;Ljava/lang/String;I)V

    :quick_tile_title
    new-instance v5, Landroid/widget/TextView;

    invoke-direct {v5, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v5, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v6, 0x41600000

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextSize(F)V

    const/4 v6, -0x1

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextColor(I)V

    const/4 v6, 0x0

    const/4 v7, 0x1

    invoke-virtual {v5, v6, v7}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    const/4 v6, 0x2

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setMaxLines(I)V

    sget-object v6, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    invoke-static {p0}, Lcom/melodix/music/NativeUiMetrics;->quickRadius(Landroid/content/Context;)I
    move-result v6

    const/4 v7, 0x0

    invoke-virtual {v5, v6, v7, v6, v7}, Landroid/view/View;->setPadding(IIII)V

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v7, -0x2
    const/4 v8, 0x0
    const/high16 v9, 0x3f800000

    invoke-direct {v6, v8, v7, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v3, v5, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-nez v6, :quick_tile_return

    new-instance v6, Lcom/melodix/music/NativeRowClickListener;

    invoke-direct {v6, p0, v2, v0}, Lcom/melodix/music/NativeRowClickListener;-><init>(Lcom/melodix/music/MainActivity;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v3, v6}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :quick_tile_return
    return-object v3
.end method

.method private static renderQuickGrid(Lcom/melodix/music/MainActivity;Landroid/widget/LinearLayout;Lorg/json/JSONArray;)V
    .locals 9

    # Two-column grid of the most recent items, capped at six tiles so the
    # first editorial shelf still lands above the fold.
    invoke-virtual {p2}, Lorg/json/JSONArray;->length()I

    move-result v0

    const/4 v1, 0x2

    if-lt v0, v1, :quick_grid_done

    const/4 v1, 0x6

    if-le v0, v1, :quick_grid_begin

    const/4 v0, 0x6

    :quick_grid_begin
    const/4 v1, 0x0

    :quick_grid_row
    if-ge v1, v0, :quick_grid_done

    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v4, -0x1
    const/4 v5, -0x2

    invoke-direct {v3, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-static {p0}, Lcom/melodix/music/NativeUiMetrics;->quickGap(Landroid/content/Context;)I
    move-result v4

    iput v4, v3, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    invoke-virtual {v2, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    # Same 16 dp side gutters as the editorial shelves.
    invoke-static {p0}, Lcom/melodix/music/NativeUiMetrics;->gutter(Landroid/content/Context;)I
    move-result v3

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4, v3, v4}, Landroid/view/View;->setPadding(IIII)V

    const/4 v3, 0x0

    :quick_grid_col
    const/4 v4, 0x2

    if-ge v3, v4, :quick_grid_row_add

    if-ge v1, v0, :quick_grid_spacer

    invoke-virtual {p2, v1}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    if-eqz v4, :quick_grid_inc

    invoke-static {p0, v4}, Lcom/melodix/music/NativeHomeShelfRenderer;->createQuickTile(Lcom/melodix/music/MainActivity;Lorg/json/JSONObject;)Landroid/widget/LinearLayout;

    move-result-object v5

    if-eqz v5, :quick_grid_inc

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v4, 0x0
    const/4 v7, -0x2
    const/high16 v8, 0x3f800000

    invoke-direct {v6, v4, v7, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    if-nez v3, :quick_grid_tile_add

    invoke-static {p0}, Lcom/melodix/music/NativeUiMetrics;->quickGap(Landroid/content/Context;)I
    move-result v4

    iput v4, v6, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    :quick_grid_tile_add
    invoke-virtual {v2, v5, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto :quick_grid_inc

    :quick_grid_spacer
    new-instance v5, Landroid/view/View;

    invoke-direct {v5, p0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v4, 0x0
    const/4 v7, 0x1
    const/high16 v8, 0x3f800000

    invoke-direct {v6, v4, v7, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v2, v5, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto :quick_grid_col_next

    :quick_grid_inc
    add-int/lit8 v1, v1, 0x1

    :quick_grid_col_next
    add-int/lit8 v3, v3, 0x1

    goto :quick_grid_col

    :quick_grid_row_add
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I
    move-result v4
    if-lez v4, :quick_grid_row
    invoke-virtual {p1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    goto :quick_grid_row

    :quick_grid_done
    return-void
.end method

.method private static dp(Landroid/content/Context;I)I
    .locals 3

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v1, v0, Landroid/util/DisplayMetrics;->density:F

    int-to-float v2, p1

    mul-float/2addr v2, v1

    float-to-int v2, v2

    if-gtz v2, :dp_ready

    move v2, p1

    :dp_ready
    return v2
.end method

.method private static traceHomeParsed(I)V
    .locals 1

    if-lez p0, :home_parsed_empty
    const-string v0, "home-data stage=android-parsed result=valid"
    goto :home_parsed_emit
    :home_parsed_empty
    const-string v0, "home-data stage=android-parsed result=empty"
    :home_parsed_emit
    invoke-static {v0}, Lcom/melodix/music/NativeCrashGuard;->diagLine(Ljava/lang/String;)V
    invoke-static {v0}, Lcom/melodix/music/StartupDiagnosticOverlay;->appendDiagnosticLine(Ljava/lang/String;)V
    return-void
.end method

.method private static traceHomeModel(Ljava/lang/String;)V
    .locals 3

    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V
    const-string v1, "home-data stage=android-model result="
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-static {v0}, Lcom/melodix/music/NativeCrashGuard;->diagLine(Ljava/lang/String;)V
    invoke-static {v0}, Lcom/melodix/music/StartupDiagnosticOverlay;->appendDiagnosticLine(Ljava/lang/String;)V
    return-void
.end method

.method private static traceHomeRendered(IILjava/lang/String;)V
    .locals 3

    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V
    const-string v1, "home-data stage=android-rendered result="
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-static {v0}, Lcom/melodix/music/NativeCrashGuard;->diagLine(Ljava/lang/String;)V
    invoke-static {v0}, Lcom/melodix/music/StartupDiagnosticOverlay;->appendDiagnosticLine(Ljava/lang/String;)V
    return-void
.end method
