.class public final Lcom/melodix/music/NativeSettingsRowFactory;
.super Ljava/lang/Object;

# Renders one row of the native Spotify settings screen: a title, an optional
# explanation, and a rounded value pill (ON / OFF / current quality / action).

.method public static create(Lcom/melodix/music/MainActivity;Lorg/json/JSONObject;)Landroid/widget/LinearLayout;
    .locals 14

    const-string v0, "title"
    const-string v1, ""
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v4

    const-string v0, "subtitle"
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v5

    const-string v0, "settingValue"
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v6

    const-string v0, "uri"
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v7

    new-instance v2, Landroid/widget/LinearLayout;
    invoke-direct {v2, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
    const/4 v0, 0x0
    invoke-virtual {v2, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V
    const/16 v0, 0x10
    invoke-virtual {v2, v0}, Landroid/widget/LinearLayout;->setGravity(I)V

    invoke-static {p0}, Lcom/melodix/music/NativeUiMetrics;->settingsPadH(Landroid/content/Context;)I
    move-result v0
    invoke-static {p0}, Lcom/melodix/music/NativeUiMetrics;->settingsPadV(Landroid/content/Context;)I
    move-result v1
    invoke-virtual {v2, v0, v1, v0, v1}, Landroid/view/View;->setPadding(IIII)V

    new-instance v3, Landroid/graphics/drawable/GradientDrawable;
    invoke-direct {v3}, Landroid/graphics/drawable/GradientDrawable;-><init>()V
    # MEL-BUG-045: glass card (translucent fill + light stroke) like the rest of
    # the Apple-glass UI (MEL-BUG-039) instead of the flat opaque gray.
    sget v0, Lcom/melodix/music/MelColors;->glassCard:I
    invoke-virtual {v3, v0}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V
    # Resolve dp to pixels for both the card and its matching ripple mask.
    invoke-static {p0}, Lcom/melodix/music/NativeUiMetrics;->settingsCardRadius(Landroid/content/Context;)I
    move-result v0
    int-to-float v0, v0
    invoke-virtual {v3, v0}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V
    invoke-static {p0}, Lcom/melodix/music/NativeUiMetrics;->settingsStroke(Landroid/content/Context;)I
    move-result v0
    # MEL-BUG-056: accent-tinted border (strokeAccent) for a livelier glass card.
    sget v1, Lcom/melodix/music/MelColors;->strokeAccent:I
    invoke-virtual {v3, v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V
    # MEL-BUG-064: press feedback on the row — accent ripple masked to the card,
    # the original card gradient stays as the ripple content.
    sget v12, Lcom/melodix/music/MelColors;->glow:I
    invoke-static {v12}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;
    move-result-object v12
    new-instance v13, Landroid/graphics/drawable/GradientDrawable;
    invoke-direct {v13}, Landroid/graphics/drawable/GradientDrawable;-><init>()V
    const/4 v0, -0x1
    invoke-virtual {v13, v0}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V
    invoke-static {p0}, Lcom/melodix/music/NativeUiMetrics;->settingsCardRadius(Landroid/content/Context;)I
    move-result v0
    int-to-float v0, v0
    invoke-virtual {v13, v0}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V
    new-instance v0, Landroid/graphics/drawable/RippleDrawable;
    invoke-direct {v0, v12, v3, v13}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V
    invoke-virtual {v2, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V
    invoke-static {p0}, Lcom/melodix/music/NativeUiMetrics;->settingsRowHeight(Landroid/content/Context;)I
    move-result v0
    invoke-virtual {v2, v0}, Landroid/view/View;->setMinimumHeight(I)V

    const-string v0, "image"
    const-string v1, ""
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v9
    # MEL-BUG-051: always show the icon slot; empty image gets the muted glyph.
    new-instance v0, Landroid/widget/ImageView;
    invoke-direct {v0, p0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V
    sget-object v1, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V
    new-instance v1, Landroid/graphics/drawable/GradientDrawable;
    invoke-direct {v1}, Landroid/graphics/drawable/GradientDrawable;-><init>()V
    # MEL-BUG-066: soft accent-glow circle (like the home status icon) instead
    # of a loud solid square — finished-app look.
    const/4 v3, 0x1
    invoke-virtual {v1, v3}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V
    sget v3, Lcom/melodix/music/MelColors;->glow:I
    invoke-virtual {v1, v3}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V
    const/high16 v3, 0x41b00000
    invoke-virtual {v1, v3}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V
    # MEL-BUG-057: thin accent ring around the icon slot (glass vibe).
    const/4 v3, 0x2
    sget v11, Lcom/melodix/music/MelColors;->strokeAccent:I
    invoke-virtual {v1, v3, v11}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V
    const/4 v3, 0x1
    invoke-virtual {v0, v3}, Landroid/view/View;->setClipToOutline(Z)V
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;
    invoke-static {p0}, Lcom/melodix/music/NativeUiMetrics;->settingsIcon(Landroid/content/Context;)I
    move-result v3
    invoke-direct {v1, v3, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-static {p0}, Lcom/melodix/music/NativeUiMetrics;->settingsIconGap(Landroid/content/Context;)I
    move-result v3
    iput v3, v1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I
    invoke-virtual {v2, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    invoke-virtual {v9}, Ljava/lang/String;->isEmpty()Z
    move-result v3
    if-nez v3, :native_settings_icon_placeholder
    const/16 v3, 0xb0
    invoke-static {v0, v9, v3}, Lcom/melodix/music/NativeImageLoader;->load(Landroid/widget/ImageView;Ljava/lang/String;I)V
    goto :native_settings_no_avatar

    :native_settings_icon_placeholder
    const-string v3, "native_cover_placeholder"
    invoke-static {p0, v0, v3}, Lcom/melodix/music/NativeUiRowFactory;->applyDrawableImage(Landroid/content/Context;Landroid/widget/ImageView;Ljava/lang/String;)V
    # MEL-BUG-054: accent-colored glyph on the accent-tinted slot.
    sget v3, Lcom/melodix/music/MelColors;->accent:I
    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setColorFilter(I)V

    :native_settings_no_avatar
    new-instance v8, Landroid/widget/LinearLayout;
    invoke-direct {v8, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
    const/4 v0, 0x1
    invoke-virtual {v8, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    new-instance v9, Landroid/widget/TextView;
    invoke-direct {v9, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
    invoke-virtual {v9, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    invoke-static {v9, p0}, Lcom/melodix/music/NativeUiMetrics;->applySettingsTitle(Landroid/widget/TextView;Landroid/content/Context;)V
    const/4 v0, 0x0
    const/4 v1, 0x1
    invoke-virtual {v9, v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V
    const/4 v0, -0x1
    invoke-virtual {v9, v0}, Landroid/widget/TextView;->setTextColor(I)V
    const/4 v0, 0x2
    invoke-virtual {v9, v0}, Landroid/widget/TextView;->setMaxLines(I)V
    sget-object v0, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;
    invoke-virtual {v9, v0}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V
    invoke-virtual {v8, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z
    move-result v0
    if-nez v0, :native_settings_pill

    new-instance v10, Landroid/widget/TextView;
    invoke-direct {v10, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
    invoke-virtual {v10, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    invoke-static {v10, p0}, Lcom/melodix/music/NativeUiMetrics;->applySettingsSubtitle(Landroid/widget/TextView;Landroid/content/Context;)V
    sget v0, Lcom/melodix/music/MelColors;->textSecondary:I
    invoke-virtual {v10, v0}, Landroid/widget/TextView;->setTextColor(I)V
    const/4 v0, 0x2
    invoke-virtual {v10, v0}, Landroid/widget/TextView;->setMaxLines(I)V
    sget-object v0, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;
    invoke-virtual {v10, v0}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V
    invoke-static {p0}, Lcom/melodix/music/NativeUiMetrics;->settingsSubtitlePad(Landroid/content/Context;)I
    move-result v0
    const/4 v1, 0x0
    invoke-virtual {v10, v1, v0, v1, v1}, Landroid/view/View;->setPadding(IIII)V
    invoke-virtual {v8, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    :native_settings_pill
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v1, 0x0
    const/4 v3, -0x2
    const/high16 v9, 0x3f800000
    invoke-direct {v0, v1, v3, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V
    invoke-virtual {v2, v8, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    # MEL-BUG-062: ON/OFF values render as a real styled Switch (mobile-app
    # toggle) instead of a text pill. The switch itself is not clickable: the
    # whole row keeps dispatching the toggle uri.
    const-string v3, "ON"
    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :native_settings_switch_check_off
    const/4 v3, 0x1
    goto :native_settings_switch_build

    :native_settings_switch_check_off
    const-string v3, "OFF"
    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :native_settings_pill_text
    const/4 v3, 0x0

    :native_settings_switch_build
    new-instance v11, Landroid/widget/Switch;
    invoke-direct {v11, p0}, Landroid/widget/Switch;-><init>(Landroid/content/Context;)V
    invoke-virtual {v11, v3}, Landroid/widget/Switch;->setChecked(Z)V
    # Do not rely on the host theme's Switch drawables: some themes have no
    # track at all. Give the tint list a real, density-scaled pill to tint.
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;
    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V
    const/4 v1, -0x1
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V
    invoke-static {p0}, Lcom/melodix/music/NativeUiMetrics;->settingsSwitchTrackWidth(Landroid/content/Context;)I
    move-result v1
    invoke-static {p0}, Lcom/melodix/music/NativeUiMetrics;->settingsSwitchTrackHeight(Landroid/content/Context;)I
    move-result v3
    invoke-virtual {v0, v1, v3}, Landroid/graphics/drawable/GradientDrawable;->setSize(II)V
    int-to-float v3, v3
    invoke-virtual {v0, v3}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V
    invoke-virtual {v11, v0}, Landroid/widget/Switch;->setTrackDrawable(Landroid/graphics/drawable/Drawable;)V
    const/4 v0, 0x0
    invoke-virtual {v11, v0}, Landroid/widget/Switch;->setSplitTrack(Z)V
    # MEL-BUG-066: readable switch — white thumb, track solid accent when ON,
    # neutral surface when OFF (a state list, not one flat translucent tint).
    sget v0, Lcom/melodix/music/MelColors;->textPrimary:I
    invoke-static {v0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;
    move-result-object v0
    invoke-virtual {v11, v0}, Landroid/widget/Switch;->setThumbTintList(Landroid/content/res/ColorStateList;)V
    # MEL-BUG-069 fix: the track state list was built as `new-array v12, v12, [I`
    # (an int[]) and then filled with `aput v0, v12, v1` where v0 was itself an
    # int[] — storing a reference into an int[] is a VerifyError thrown the first
    # time a settings row is created, i.e. the Settings screen crashed on open.
    # The states array must be [[I and its elements stored with aput-object.
    # v12 = states, v13 = colors, v0/v1/v3 = scalar scratch (v2 is the row).
    const/4 v12, 0x2
    new-array v12, v12, [[I
    const/4 v13, 0x2
    new-array v13, v13, [I
    # states[0] = { android.R.attr.state_checked }
    const/4 v1, 0x1
    new-array v0, v1, [I
    const v1, 0x101009c
    const/4 v3, 0x0
    aput v1, v0, v3
    aput-object v0, v12, v3
    # states[1] = {} (default)
    const/4 v1, 0x0
    new-array v0, v1, [I
    const/4 v3, 0x1
    aput-object v0, v12, v3
    # colors = { accent, surfaceBtn }
    sget v0, Lcom/melodix/music/MelColors;->accent:I
    const/4 v3, 0x0
    aput v0, v13, v3
    sget v0, Lcom/melodix/music/MelColors;->surfaceBtn:I
    const/4 v3, 0x1
    aput v0, v13, v3
    new-instance v0, Landroid/content/res/ColorStateList;
    invoke-direct {v0, v12, v13}, Landroid/content/res/ColorStateList;-><init>([[I[I)V
    invoke-virtual {v11, v0}, Landroid/widget/Switch;->setTrackTintList(Landroid/content/res/ColorStateList;)V
    const/4 v0, 0x0
    invoke-virtual {v11, v0}, Landroid/view/View;->setClickable(Z)V
    invoke-virtual {v11, v0}, Landroid/view/View;->setFocusable(Z)V
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v1, -0x2
    invoke-direct {v0, v1, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-static {p0}, Lcom/melodix/music/NativeUiMetrics;->settingsValueGap(Landroid/content/Context;)I
    move-result v3
    iput v3, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I
    invoke-virtual {v2, v11, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    goto :native_settings_row_tail

    :native_settings_pill_text
    new-instance v11, Landroid/widget/TextView;
    invoke-direct {v11, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
    invoke-virtual {v11, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    invoke-static {v11, p0}, Lcom/melodix/music/NativeUiMetrics;->applySettingsValue(Landroid/widget/TextView;Landroid/content/Context;)V
    const/4 v0, 0x0
    const/4 v1, 0x1
    invoke-virtual {v11, v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V
    const/16 v0, 0x11
    invoke-virtual {v11, v0}, Landroid/widget/TextView;->setGravity(I)V
    const/4 v0, 0x1
    invoke-virtual {v11, v0}, Landroid/widget/TextView;->setMaxLines(I)V
    invoke-static {p0}, Lcom/melodix/music/NativeUiMetrics;->settingsValuePadH(Landroid/content/Context;)I
    move-result v0
    invoke-static {p0}, Lcom/melodix/music/NativeUiMetrics;->settingsValuePadV(Landroid/content/Context;)I
    move-result v1
    invoke-virtual {v11, v0, v1, v0, v1}, Landroid/view/View;->setPadding(IIII)V

    sget v0, Lcom/melodix/music/MelColors;->glassFill:I
    const/4 v1, -0x1
    const-string v3, "ON"
    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :native_settings_pill_not_on
    const v0, -0xe128a0
    const v1, -0xededee
    goto :native_settings_pill_build

    :native_settings_pill_not_on
    const-string v3, "OFF"
    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :native_settings_pill_not_off
    sget v0, Lcom/melodix/music/MelColors;->glassFill:I
    sget v1, Lcom/melodix/music/MelColors;->textSecondary:I
    goto :native_settings_pill_build

    :native_settings_pill_not_off
    const-string v3, "Déconnexion"
    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :native_settings_pill_accent
    const v1, -0xea194
    goto :native_settings_pill_build

    # MEL-BUG-056: actionable/positive values get a filled accent badge.
    :native_settings_pill_accent
    const-string v3, "Ouvrir"
    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-nez v3, :native_settings_pill_accent_fill
    const-string v3, "Actualiser"
    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-nez v3, :native_settings_pill_accent_fill
    const-string v3, "Se connecter"
    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-nez v3, :native_settings_pill_accent_fill
    const-string v3, "Renouveler la session"
    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-nez v3, :native_settings_pill_accent_fill
    const-string v3, "Connecté"
    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :native_settings_pill_build
    :native_settings_pill_accent_fill
    sget v0, Lcom/melodix/music/MelColors;->accent:I
    sget v1, Lcom/melodix/music/MelColors;->background:I

    :native_settings_pill_build
    new-instance v3, Landroid/graphics/drawable/GradientDrawable;
    invoke-direct {v3}, Landroid/graphics/drawable/GradientDrawable;-><init>()V
    invoke-virtual {v3, v0}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V
    const/high16 v0, 0x41800000
    invoke-virtual {v3, v0}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V
    invoke-virtual {v11, v3}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V
    invoke-virtual {v11, v1}, Landroid/widget/TextView;->setTextColor(I)V

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v1, -0x2
    invoke-direct {v0, v1, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-static {p0}, Lcom/melodix/music/NativeUiMetrics;->settingsValueGap(Landroid/content/Context;)I
    move-result v3
    iput v3, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I
    invoke-virtual {v2, v11, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :native_settings_row_tail
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v1, -0x1
    const/4 v3, -0x2
    invoke-direct {v0, v1, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-static {p0}, Lcom/melodix/music/NativeUiMetrics;->settingsRowGap(Landroid/content/Context;)I
    move-result v1
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I
    const-string v1, "mel_settings_outer_inset"
    const/16 v3, 0x14
    invoke-static {p0, v1, v3}, Lcom/melodix/music/NativeUiRowFactory;->metric(Landroid/content/Context;Ljava/lang/String;I)I
    move-result v1
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I
    invoke-virtual {v2, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z
    move-result v0
    if-eqz v0, :native_settings_action_enabled
    # Diagnostics and unsupported features have no action URI: remove them
    # from the focus/click path instead of leaving a dead button on the screen.
    const/4 v0, 0x0
    invoke-virtual {v2, v0}, Landroid/view/View;->setClickable(Z)V
    invoke-virtual {v2, v0}, Landroid/view/View;->setFocusable(Z)V
    goto :native_settings_return

    :native_settings_action_enabled
    const/4 v0, 0x1
    invoke-virtual {v2, v0}, Landroid/view/View;->setClickable(Z)V
    invoke-virtual {v2, v0}, Landroid/view/View;->setFocusable(Z)V
    new-instance v0, Lcom/melodix/music/NativeRowClickListener;
    invoke-direct {v0, p0, v7, v4}, Lcom/melodix/music/NativeRowClickListener;-><init>(Lcom/melodix/music/MainActivity;Ljava/lang/String;Ljava/lang/String;)V
    invoke-virtual {v2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :native_settings_return
    return-object v2
.end method

.method public static createSectionHeader(Lcom/melodix/music/MainActivity;Ljava/lang/String;)Landroid/widget/TextView;
    .locals 4

    new-instance v0, Landroid/widget/TextView;
    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
    # MEL-BUG-064: modern section header — uppercase, 12sp, accent, tracked out.
    invoke-virtual {p1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;
    move-result-object v1
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    invoke-static {v0, p0}, Lcom/melodix/music/NativeUiMetrics;->applySettingsSectionTitle(Landroid/widget/TextView;Landroid/content/Context;)V
    const/high16 v1, 0x41400000
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V
    sget v1, Lcom/melodix/music/MelColors;->accent:I
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V
    const v1, 0x3d23d70a
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setLetterSpacing(F)V
    const/4 v1, 0x0
    const/4 v2, 0x1
    invoke-virtual {v0, v1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V
    invoke-static {p0}, Lcom/melodix/music/NativeUiMetrics;->gutter(Landroid/content/Context;)I
    move-result v2
    invoke-static {p0}, Lcom/melodix/music/NativeUiMetrics;->settingsSectionPadV(Landroid/content/Context;)I
    move-result v3
    invoke-virtual {v0, v1, v3, v2, v3}, Landroid/view/View;->setPadding(IIII)V
    return-object v0
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
    if-gtz v2, :native_settings_dp_ready
    move v2, p1

    :native_settings_dp_ready
    return v2
.end method
