.class public final Lcom/melodix/music/NativeEmptyState;
.super Ljava/lang/Object;

# Melodix visual rebuild: a reusable empty / loading state. Icon, bold title and
# optional subtitle, all sized and spaced from tokens so the tablet gets its own
# type scale. It states nothing about data it does not have.

.method public static forMessage(Lcom/melodix/music/MainActivity;Ljava/lang/String;)Landroid/widget/LinearLayout;
    .locals 3

    # Keeps the choice of icon and subtitle out of renderNativeRows, whose
    # registers are already busy: the call site stays a single invoke. The
    # subtitles describe the interface, never data the app does not have.
    const-string v0, "native_nav_library"
    const-string v1, "Vos playlists, albums et artistes apparaîtront ici."

    const-string v2, "Recherchez un artiste, un titre, un album ou une playlist ci-dessus"
    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :for_message_search
    goto :for_message_ready

    :for_message_search
    const-string v0, "native_nav_search"
    const-string v1, ""

    :for_message_ready
    invoke-static {p0, p1, v1, v0}, Lcom/melodix/music/NativeEmptyState;->create(Lcom/melodix/music/MainActivity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/widget/LinearLayout;
    move-result-object v0
    return-object v0
.end method

.method public static create(Lcom/melodix/music/MainActivity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/widget/LinearLayout;
    .locals 6

    # A real empty state instead of a bare grey line. The previous block used a
    # raw 24 PIXEL padding (9dp on phone, 12dp on tablet), a hardcoded 16sp and a
    # hardcoded colour, so it ignored both the density and the tablet type scale.
    :try_start_empty
    new-instance v0, Landroid/widget/LinearLayout;
    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
    const/4 v1, 0x1
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V
    const/16 v1, 0x11
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setGravity(I)V
    const-string v2, "mel_gutter"
    const/16 v4, 0x10
    invoke-static {p0, v2, v4}, Lcom/melodix/music/NativeUiRowFactory;->metric(Landroid/content/Context;Ljava/lang/String;I)I
    move-result v1
    mul-int/lit8 v3, v1, 0x2
    invoke-virtual {v0, v1, v3, v1, v3}, Landroid/view/View;->setPadding(IIII)V
    new-instance v5, Landroid/widget/TextView;
    invoke-direct {v5, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
    invoke-virtual {v5, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    const/16 v1, 0x11
    invoke-virtual {v5, v1}, Landroid/widget/TextView;->setGravity(I)V
    const/4 v1, 0x0
    const/4 v3, 0x1
    invoke-virtual {v5, v1, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V
    const-string v2, "mel_section_title"
    const/high16 v1, 0x41a00000
    invoke-static {v5, p0, v2, v1}, Lcom/melodix/music/NativeUiRowFactory;->applyTextSize(Landroid/widget/TextView;Landroid/content/Context;Ljava/lang/String;F)V
    const-string v2, "mel_text_primary"
    const-string v3, "color"
    invoke-static {p0, v2, v3}, Lcom/melodix/music/NativeEmptyState;->resolveId(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)I
    move-result v1
    if-eqz v1, :empty_title_color
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object v2
    invoke-virtual {v2, v1}, Landroid/content/res/Resources;->getColor(I)I
    move-result v1
    invoke-virtual {v5, v1}, Landroid/widget/TextView;->setTextColor(I)V
    :empty_title_color
    const-string v3, "drawable"
    invoke-static {p0, p3, v3}, Lcom/melodix/music/NativeEmptyState;->resolveId(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)I
    move-result v1
    if-eqz v1, :empty_icon_done
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object v2
    invoke-virtual {v2, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;
    move-result-object v2
    if-eqz v2, :empty_icon_done
    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I
    move-result v1
    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I
    move-result v3
    # setBounds takes FOUR ints (left, top, right, bottom). The two-argument
    # reference did not resolve, so ART rejected the class and the app died on
    # the library screen before any catch could run.
    const/4 v4, 0x0
    invoke-virtual {v2, v4, v4, v1, v3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V
    const/4 v1, 0x0
    invoke-virtual {v5, v1, v2, v1, v1}, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V
    const-string v2, "mel_gutter_half"
    const/16 v4, 0x8
    invoke-static {p0, v2, v4}, Lcom/melodix/music/NativeUiRowFactory;->metric(Landroid/content/Context;Ljava/lang/String;I)I
    move-result v1
    invoke-virtual {v5, v1}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V
    const-string v2, "mel_accent"
    const-string v3, "color"
    invoke-static {p0, v2, v3}, Lcom/melodix/music/NativeEmptyState;->resolveId(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)I
    move-result v1
    if-eqz v1, :empty_icon_done
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object v2
    invoke-virtual {v2, v1}, Landroid/content/res/Resources;->getColor(I)I
    move-result v1
    invoke-static {v1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;
    move-result-object v2
    invoke-virtual {v5, v2}, Landroid/widget/TextView;->setCompoundDrawableTintList(Landroid/content/res/ColorStateList;)V
    :empty_icon_done
    invoke-virtual {v0, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V
    if-eqz p2, :empty_done
    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z
    move-result v1
    if-nez v1, :empty_done
    new-instance v5, Landroid/widget/TextView;
    invoke-direct {v5, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
    invoke-virtual {v5, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    const/16 v1, 0x11
    invoke-virtual {v5, v1}, Landroid/widget/TextView;->setGravity(I)V
    const-string v2, "mel_row_subtitle"
    const/high16 v1, 0x41600000
    invoke-static {v5, p0, v2, v1}, Lcom/melodix/music/NativeUiRowFactory;->applyTextSize(Landroid/widget/TextView;Landroid/content/Context;Ljava/lang/String;F)V
    const-string v2, "mel_text_tertiary"
    const-string v3, "color"
    invoke-static {p0, v2, v3}, Lcom/melodix/music/NativeEmptyState;->resolveId(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)I
    move-result v1
    if-eqz v1, :empty_sub_color
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object v2
    invoke-virtual {v2, v1}, Landroid/content/res/Resources;->getColor(I)I
    move-result v1
    invoke-virtual {v5, v1}, Landroid/widget/TextView;->setTextColor(I)V
    :empty_sub_color
    # Resolve the margin FIRST. The metric helper uses v2 as a string scratch,
    # so calling it while v2 held the LayoutParams destroyed the object and the
    # next iput failed verification, killing the app on the library screen.
    const-string v2, "mel_gutter_half"
    const/16 v4, 0x8
    invoke-static {p0, v2, v4}, Lcom/melodix/music/NativeUiRowFactory;->metric(Landroid/content/Context;Ljava/lang/String;I)I
    move-result v1
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v3, -0x2
    invoke-direct {v2, v3, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    iput v1, v2, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I
    invoke-virtual {v0, v5, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    :empty_done
    :try_end_empty
    .catch Ljava/lang/Throwable; {:try_start_empty .. :try_end_empty} :empty_catch
    return-object v0
    :empty_catch
    move-exception v1
    invoke-virtual {v1}, Ljava/lang/Throwable;->toString()Ljava/lang/String;
    move-result-object v1
    const-string v2, "MelEmpty"
    invoke-static {v2, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    return-object v0
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
