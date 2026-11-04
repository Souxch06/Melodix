.class public final Lcom/melodix/music/NativeUiMetrics;
.super Ljava/lang/Object;

# Single entry point for every design token the native renderers need.
#
# One accessor per token, each carrying its own historical fallback, so a call
# site is a single invoke-static that reuses the Context register it already had.
# That keeps .locals - and therefore the parameter registers - untouched, which
# matters because non-range invokes can only address v0-v15.
#
# Values come from res/values/mel_dimens.xml, overridden per role by
# res/values-sw600dp/mel_dimens.xml. Android picks the qualified resource, so the
# tablet gets its own metrics from the same source of truth as the XML layout.

.method public static gutter(Landroid/content/Context;)I
    .locals 2

    const-string v0, "mel_gutter"

    const/16 v1, 0x10

    invoke-static {p0, v0, v1}, Lcom/melodix/music/NativeUiRowFactory;->metric(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static shelfCardWidth(Landroid/content/Context;)I
    .locals 2

    const-string v0, "mel_shelf_card_width"

    const/16 v1, 0x94

    invoke-static {p0, v0, v1}, Lcom/melodix/music/NativeUiRowFactory;->metric(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static shelfGap(Landroid/content/Context;)I
    .locals 2

    const-string v0, "mel_shelf_gap"

    const/16 v1, 0x8

    invoke-static {p0, v0, v1}, Lcom/melodix/music/NativeUiRowFactory;->metric(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static shelfRadius(Landroid/content/Context;)I
    .locals 2

    const-string v0, "mel_shelf_radius"

    const/16 v1, 0xc

    invoke-static {p0, v0, v1}, Lcom/melodix/music/NativeUiRowFactory;->metric(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static shelfArtHeight(Landroid/content/Context;)I
    .locals 2

    const-string v0, "mel_shelf_art_height"

    const/16 v1, 0x94

    invoke-static {p0, v0, v1}, Lcom/melodix/music/NativeUiRowFactory;->metric(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static sectionPadTop(Landroid/content/Context;)I
    .locals 2

    const-string v0, "mel_section_pad_top"

    const/16 v1, 0x18

    invoke-static {p0, v0, v1}, Lcom/melodix/music/NativeUiRowFactory;->metric(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static sectionPadBottom(Landroid/content/Context;)I
    .locals 2

    const-string v0, "mel_section_pad_bottom"

    const/16 v1, 0xa

    invoke-static {p0, v0, v1}, Lcom/melodix/music/NativeUiRowFactory;->metric(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static applySectionTitle(Landroid/widget/TextView;Landroid/content/Context;)V
    .locals 2

    const-string v0, "mel_section_title"

    const/high16 v1, 0x41a00000

    invoke-static {p0, p1, v0, v1}, Lcom/melodix/music/NativeUiRowFactory;->applyTextSize(Landroid/widget/TextView;Landroid/content/Context;Ljava/lang/String;F)V

    return-void
.end method
