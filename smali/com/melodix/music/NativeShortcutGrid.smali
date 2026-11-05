.class public final Lcom/melodix/music/NativeShortcutGrid;
.super Ljava/lang/Object;

# Melodix visual rebuild, screen 1. Fills the dead space under the home status
# card with real navigation instead of leaving a blank screen. Phone stacks the
# icon above the label; tablet places it beside the label, a different
# composition rather than an enlarged phone tile.

.method public static render(Lcom/melodix/music/MainActivity;Landroid/widget/LinearLayout;)V
    .locals 7

    # Real navigation only. Every tile calls a handler already verified on
    # device; no playlist, album or playback data is invented. Nothing here
    # touches display ownership, the bridge, sessions or playback.
    :try_start_grid
    if-eqz p0, :grid_done
    if-eqz p1, :grid_done
    const-string v0, "Explorer Melodix"
    invoke-static {p0, v0}, Lcom/melodix/music/NativeUiRowFactory;->createSectionHeader(Lcom/melodix/music/MainActivity;Ljava/lang/String;)Landroid/widget/TextView;
    move-result-object v0
    if-eqz v0, :grid_header_done
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V
    :grid_header_done
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;
    move-result-object v0
    iget v0, v0, Landroid/content/res/Configuration;->smallestScreenWidthDp:I
    const/16 v1, 0x258
    const/4 v4, 0x0
    if-lt v0, v1, :grid_width_done
    const/4 v4, 0x1
    :grid_width_done
    new-instance v5, Landroid/widget/LinearLayout;
    invoke-direct {v5, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
    const/4 v0, 0x0
    invoke-virtual {v5, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V
    const-string v0, "mel_gutter"
    const/16 v1, 0x10
    invoke-static {p0, v0, v1}, Lcom/melodix/music/NativeUiRowFactory;->metric(Landroid/content/Context;Ljava/lang/String;I)I
    move-result v0
    const/4 v1, 0x0
    invoke-virtual {v5, v0, v1, v0, v1}, Landroid/view/View;->setPadding(IIII)V
    const-string v0, "mel_quick_gap"
    const/16 v1, 0x8
    invoke-static {p0, v0, v1}, Lcom/melodix/music/NativeUiRowFactory;->metric(Landroid/content/Context;Ljava/lang/String;I)I
    move-result v6
    const/4 v0, 0x0
    invoke-static {p0, v5, v0, v4, v6}, Lcom/melodix/music/NativeShortcutGrid;->addTile(Lcom/melodix/music/MainActivity;Landroid/widget/LinearLayout;IZI)V
    const/4 v0, 0x1
    invoke-static {p0, v5, v0, v4, v6}, Lcom/melodix/music/NativeShortcutGrid;->addTile(Lcom/melodix/music/MainActivity;Landroid/widget/LinearLayout;IZI)V
    const/4 v0, 0x2
    invoke-static {p0, v5, v0, v4, v6}, Lcom/melodix/music/NativeShortcutGrid;->addTile(Lcom/melodix/music/MainActivity;Landroid/widget/LinearLayout;IZI)V
    invoke-virtual {p1, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V
    :try_end_grid
    .catch Ljava/lang/Throwable; {:try_start_grid .. :try_end_grid} :grid_catch
    goto :grid_done
    :grid_catch
    move-exception v0
    :grid_done
    return-void
.end method

.method private static addTile(Lcom/melodix/music/MainActivity;Landroid/widget/LinearLayout;IZI)V
    .locals 4

    # Label and icon are derived from the action so the call stays within the
    # five-register invoke limit. Each action maps to a handler already
    # verified on device.
    const/4 v0, 0x0
    if-eq p2, v0, :add_kind_1
    const-string v0, "Rechercher"
    const-string v1, "native_nav_search"
    goto :add_kind_ready
    :add_kind_1
    const/4 v2, 0x1
    if-eq p2, v2, :add_kind_2
    const-string v0, "Bibliothèque"
    const-string v1, "native_nav_library"
    goto :add_kind_ready
    :add_kind_2
    const-string v0, "Paramètres"
    const-string v1, "native_nav_settings"
    :add_kind_ready
    invoke-static {p0, v0, v1, p2, p3}, Lcom/melodix/music/NativeShortcutGrid;->createTile(Lcom/melodix/music/MainActivity;Ljava/lang/String;Ljava/lang/String;IZ)Landroid/widget/TextView;
    move-result-object v0
    if-eqz v0, :add_done
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v2, 0x0
    const/4 v3, -0x2
    const/high16 v2, 0x3f800000
    invoke-direct {v1, v3, v3, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V
    const/4 v2, 0x0
    iput v2, v1, Landroid/view/ViewGroup$LayoutParams;->width:I
    div-int/lit8 v2, p4, 0x2
    iput v2, v1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I
    iput v2, v1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I
    invoke-virtual {p1, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    :add_done
    return-void
.end method

.method private static resolveId(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)I
    .locals 3
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

.method private static createTile(Lcom/melodix/music/MainActivity;Ljava/lang/String;Ljava/lang/String;IZ)Landroid/widget/TextView;
    .locals 6

    # One TextView carrying its icon, the pattern the tab bar already uses.
    # Phone stacks the icon above the label; tablet puts it beside the label,
    # so the tablet row is a different composition, not a scaled-up phone tile.
    new-instance v0, Landroid/widget/TextView;
    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V
    const/4 v1, 0x1
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setClickable(Z)V
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setFocusable(Z)V
    const/4 v1, 0x1
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMaxLines(I)V
    sget-object v1, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V
    const-string v2, "mel_row_title"
    const/high16 v1, 0x41700000
    invoke-static {v0, p0, v2, v1}, Lcom/melodix/music/NativeUiRowFactory;->applyTextSize(Landroid/widget/TextView;Landroid/content/Context;Ljava/lang/String;F)V
    const-string v2, "mel_text_primary"
    const-string v3, "color"
    invoke-static {p0, v2, v3}, Lcom/melodix/music/NativeShortcutGrid;->resolveId(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)I
    move-result v1
    if-eqz v1, :tile_color_done
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object v4
    invoke-virtual {v4, v1}, Landroid/content/res/Resources;->getColor(I)I
    move-result v1
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V
    :tile_color_done
    new-instance v4, Landroid/graphics/drawable/GradientDrawable;
    invoke-direct {v4}, Landroid/graphics/drawable/GradientDrawable;-><init>()V
    const-string v2, "mel_surface_btn"
    const-string v3, "color"
    invoke-static {p0, v2, v3}, Lcom/melodix/music/NativeShortcutGrid;->resolveId(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)I
    move-result v1
    if-eqz v1, :tile_bg_done
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object v2
    invoke-virtual {v2, v1}, Landroid/content/res/Resources;->getColor(I)I
    move-result v1
    invoke-virtual {v4, v1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V
    :tile_bg_done
    const-string v2, "mel_quick_radius"
    const/16 v3, 0x8
    invoke-static {p0, v2, v3}, Lcom/melodix/music/NativeUiRowFactory;->metric(Landroid/content/Context;Ljava/lang/String;I)I
    move-result v1
    int-to-float v1, v1
    invoke-virtual {v4, v1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V
    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V
    const-string v2, "mel_gutter_half"
    const/16 v3, 0x8
    invoke-static {p0, v2, v3}, Lcom/melodix/music/NativeUiRowFactory;->metric(Landroid/content/Context;Ljava/lang/String;I)I
    move-result v1
    invoke-virtual {v0, v1, v1, v1, v1}, Landroid/view/View;->setPadding(IIII)V
    if-eqz p4, :tile_gravity_phone
    const/16 v1, 0x13
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setGravity(I)V
    goto :tile_gravity_done
    :tile_gravity_phone
    const/16 v1, 0x11
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setGravity(I)V
    :tile_gravity_done
    const-string v3, "drawable"
    invoke-static {p0, p2, v3}, Lcom/melodix/music/NativeShortcutGrid;->resolveId(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)I
    move-result v1
    if-eqz v1, :tile_icon_done
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object v2
    invoke-virtual {v2, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;
    move-result-object v2
    if-eqz v2, :tile_icon_done
    if-eqz p4, :tile_icon_top
    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I
    move-result v1
    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I
    move-result v3
    invoke-virtual {v2, v1, v3}, Landroid/graphics/drawable/Drawable;->setBounds(II)V
    const/4 v1, 0x0
    invoke-virtual {v0, v2, v1, v1, v1}, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V
    goto :tile_icon_pad
    :tile_icon_top
    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I
    move-result v1
    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I
    move-result v3
    invoke-virtual {v2, v1, v3}, Landroid/graphics/drawable/Drawable;->setBounds(II)V
    const/4 v1, 0x0
    invoke-virtual {v0, v1, v2, v1, v1}, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V
    :tile_icon_pad
    const-string v2, "mel_gutter_half"
    const/16 v3, 0x8
    invoke-static {p0, v2, v3}, Lcom/melodix/music/NativeUiRowFactory;->metric(Landroid/content/Context;Ljava/lang/String;I)I
    move-result v1
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V
    const-string v2, "mel_accent"
    const-string v3, "color"
    invoke-static {p0, v2, v3}, Lcom/melodix/music/NativeShortcutGrid;->resolveId(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)I
    move-result v1
    if-eqz v1, :tile_icon_done
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object v2
    invoke-virtual {v2, v1}, Landroid/content/res/Resources;->getColor(I)I
    move-result v1
    invoke-static {v1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;
    move-result-object v2
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setCompoundDrawableTintList(Landroid/content/res/ColorStateList;)V
    :tile_icon_done
    new-instance v4, Lcom/melodix/music/NativeShortcutClickListener;
    invoke-direct {v4, p0, p3}, Lcom/melodix/music/NativeShortcutClickListener;-><init>(Lcom/melodix/music/MainActivity;I)V
    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V
    return-object v0
.end method
