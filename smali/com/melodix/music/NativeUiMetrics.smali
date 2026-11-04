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

.method public static rowPadH(Landroid/content/Context;)I
    .locals 2

    const-string v0, "mel_row_pad_h"

    const/16 v1, 0xc

    invoke-static {p0, v0, v1}, Lcom/melodix/music/NativeUiRowFactory;->metric(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static rowPadV(Landroid/content/Context;)I
    .locals 2

    const-string v0, "mel_row_pad_v"

    const/4 v1, 0x6

    invoke-static {p0, v0, v1}, Lcom/melodix/music/NativeUiRowFactory;->metric(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static rowHeight(Landroid/content/Context;)I
    .locals 2

    const-string v0, "mel_row_height"

    const/16 v1, 0x3c

    invoke-static {p0, v0, v1}, Lcom/melodix/music/NativeUiRowFactory;->metric(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static rowRadius(Landroid/content/Context;)I
    .locals 2

    const-string v0, "mel_row_radius"

    const/4 v1, 0x4

    invoke-static {p0, v0, v1}, Lcom/melodix/music/NativeUiRowFactory;->metric(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static rowArt(Landroid/content/Context;)I
    .locals 2

    const-string v0, "mel_row_art"

    const/16 v1, 0x30

    invoke-static {p0, v0, v1}, Lcom/melodix/music/NativeUiRowFactory;->metric(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static rowArtGap(Landroid/content/Context;)I
    .locals 2

    const-string v0, "mel_row_art_gap"

    const/16 v1, 0xc

    invoke-static {p0, v0, v1}, Lcom/melodix/music/NativeUiRowFactory;->metric(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static applyRowTitle(Landroid/widget/TextView;Landroid/content/Context;)V
    .locals 2

    const-string v0, "mel_row_title"

    const/high16 v1, 0x41700000

    invoke-static {p0, p1, v0, v1}, Lcom/melodix/music/NativeUiRowFactory;->applyTextSize(Landroid/widget/TextView;Landroid/content/Context;Ljava/lang/String;F)V

    return-void
.end method

.method public static applyRowSubtitle(Landroid/widget/TextView;Landroid/content/Context;)V
    .locals 2

    const-string v0, "mel_row_subtitle"

    const/high16 v1, 0x41500000

    invoke-static {p0, p1, v0, v1}, Lcom/melodix/music/NativeUiRowFactory;->applyTextSize(Landroid/widget/TextView;Landroid/content/Context;Ljava/lang/String;F)V

    return-void
.end method

.method public static settingsPadH(Landroid/content/Context;)I
    .locals 2

    const-string v0, "mel_settings_pad_h"

    const/16 v1, 0xe

    invoke-static {p0, v0, v1}, Lcom/melodix/music/NativeUiRowFactory;->metric(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static settingsPadV(Landroid/content/Context;)I
    .locals 2

    const-string v0, "mel_settings_pad_v"

    const/16 v1, 0xb

    invoke-static {p0, v0, v1}, Lcom/melodix/music/NativeUiRowFactory;->metric(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static settingsStroke(Landroid/content/Context;)I
    .locals 2

    const-string v0, "mel_settings_stroke"

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Lcom/melodix/music/NativeUiRowFactory;->metric(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static settingsRowHeight(Landroid/content/Context;)I
    .locals 2

    const-string v0, "mel_settings_row_height"

    const/16 v1, 0x40

    invoke-static {p0, v0, v1}, Lcom/melodix/music/NativeUiRowFactory;->metric(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static settingsIcon(Landroid/content/Context;)I
    .locals 2

    const-string v0, "mel_settings_icon"

    const/16 v1, 0x2c

    invoke-static {p0, v0, v1}, Lcom/melodix/music/NativeUiRowFactory;->metric(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static settingsIconGap(Landroid/content/Context;)I
    .locals 2

    const-string v0, "mel_settings_icon_gap"

    const/16 v1, 0xc

    invoke-static {p0, v0, v1}, Lcom/melodix/music/NativeUiRowFactory;->metric(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static settingsSubtitlePad(Landroid/content/Context;)I
    .locals 2

    const-string v0, "mel_settings_subtitle_pad"

    const/4 v1, 0x3

    invoke-static {p0, v0, v1}, Lcom/melodix/music/NativeUiRowFactory;->metric(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static settingsValuePadH(Landroid/content/Context;)I
    .locals 2

    const-string v0, "mel_settings_value_pad_h"

    const/16 v1, 0xd

    invoke-static {p0, v0, v1}, Lcom/melodix/music/NativeUiRowFactory;->metric(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static settingsValuePadV(Landroid/content/Context;)I
    .locals 2

    const-string v0, "mel_settings_value_pad_v"

    const/4 v1, 0x5

    invoke-static {p0, v0, v1}, Lcom/melodix/music/NativeUiRowFactory;->metric(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static settingsValueGap(Landroid/content/Context;)I
    .locals 2

    const-string v0, "mel_settings_value_gap"

    const/16 v1, 0xa

    invoke-static {p0, v0, v1}, Lcom/melodix/music/NativeUiRowFactory;->metric(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static settingsRowGap(Landroid/content/Context;)I
    .locals 2

    const-string v0, "mel_settings_row_gap"

    const/16 v1, 0x8

    invoke-static {p0, v0, v1}, Lcom/melodix/music/NativeUiRowFactory;->metric(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static settingsSectionPadV(Landroid/content/Context;)I
    .locals 2

    const-string v0, "mel_settings_section_pad_v"

    const/4 v1, 0x6

    invoke-static {p0, v0, v1}, Lcom/melodix/music/NativeUiRowFactory;->metric(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static applySettingsTitle(Landroid/widget/TextView;Landroid/content/Context;)V
    .locals 2

    const-string v0, "mel_settings_title"

    const/high16 v1, 0x41780000

    invoke-static {p0, p1, v0, v1}, Lcom/melodix/music/NativeUiRowFactory;->applyTextSize(Landroid/widget/TextView;Landroid/content/Context;Ljava/lang/String;F)V

    return-void
.end method

.method public static applySettingsSubtitle(Landroid/widget/TextView;Landroid/content/Context;)V
    .locals 2

    const-string v0, "mel_settings_subtitle"

    const/high16 v1, 0x41400000

    invoke-static {p0, p1, v0, v1}, Lcom/melodix/music/NativeUiRowFactory;->applyTextSize(Landroid/widget/TextView;Landroid/content/Context;Ljava/lang/String;F)V

    return-void
.end method

.method public static applySettingsValue(Landroid/widget/TextView;Landroid/content/Context;)V
    .locals 2

    const-string v0, "mel_settings_value_text"

    const/high16 v1, 0x41400000

    invoke-static {p0, p1, v0, v1}, Lcom/melodix/music/NativeUiRowFactory;->applyTextSize(Landroid/widget/TextView;Landroid/content/Context;Ljava/lang/String;F)V

    return-void
.end method

.method public static applySettingsSectionTitle(Landroid/widget/TextView;Landroid/content/Context;)V
    .locals 2

    const-string v0, "mel_settings_section_title"

    const/high16 v1, 0x41800000

    invoke-static {p0, p1, v0, v1}, Lcom/melodix/music/NativeUiRowFactory;->applyTextSize(Landroid/widget/TextView;Landroid/content/Context;Ljava/lang/String;F)V

    return-void
.end method

.method public static bannerPadTop(Landroid/content/Context;)I
    .locals 2

    const-string v0, "mel_banner_pad_top"

    const/16 v1, 0xc

    invoke-static {p0, v0, v1}, Lcom/melodix/music/NativeUiRowFactory;->metric(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static bannerPadBottom(Landroid/content/Context;)I
    .locals 2

    const-string v0, "mel_banner_pad_bottom"

    const/16 v1, 0x10

    invoke-static {p0, v0, v1}, Lcom/melodix/music/NativeUiRowFactory;->metric(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static bannerArt(Landroid/content/Context;)I
    .locals 2

    const-string v0, "mel_banner_art"

    const/16 v1, 0xc8

    invoke-static {p0, v0, v1}, Lcom/melodix/music/NativeUiRowFactory;->metric(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static bannerArtGap(Landroid/content/Context;)I
    .locals 2

    const-string v0, "mel_banner_art_gap"

    const/16 v1, 0xe

    invoke-static {p0, v0, v1}, Lcom/melodix/music/NativeUiRowFactory;->metric(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static bannerTitleGap(Landroid/content/Context;)I
    .locals 2

    const-string v0, "mel_banner_title_gap"

    const/16 v1, 0xe

    invoke-static {p0, v0, v1}, Lcom/melodix/music/NativeUiRowFactory;->metric(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static bannerSubtitlePad(Landroid/content/Context;)I
    .locals 2

    const-string v0, "mel_banner_subtitle_pad"

    const/16 v1, 0x8

    invoke-static {p0, v0, v1}, Lcom/melodix/music/NativeUiRowFactory;->metric(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static bannerActionPadH(Landroid/content/Context;)I
    .locals 2

    const-string v0, "mel_banner_action_pad_h"

    const/16 v1, 0x1a

    invoke-static {p0, v0, v1}, Lcom/melodix/music/NativeUiRowFactory;->metric(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static bannerActionPadV(Landroid/content/Context;)I
    .locals 2

    const-string v0, "mel_banner_action_pad_v"

    const/16 v1, 0xc

    invoke-static {p0, v0, v1}, Lcom/melodix/music/NativeUiRowFactory;->metric(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static bannerActionGap(Landroid/content/Context;)I
    .locals 2

    const-string v0, "mel_banner_action_gap"

    const/16 v1, 0x10

    invoke-static {p0, v0, v1}, Lcom/melodix/music/NativeUiRowFactory;->metric(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static applyBannerTitle(Landroid/widget/TextView;Landroid/content/Context;)V
    .locals 2

    const-string v0, "mel_banner_title"

    const/high16 v1, 0x41d00000

    invoke-static {p0, p1, v0, v1}, Lcom/melodix/music/NativeUiRowFactory;->applyTextSize(Landroid/widget/TextView;Landroid/content/Context;Ljava/lang/String;F)V

    return-void
.end method

.method public static applyBannerSubtitle(Landroid/widget/TextView;Landroid/content/Context;)V
    .locals 2

    const-string v0, "mel_banner_subtitle"

    const/high16 v1, 0x41580000

    invoke-static {p0, p1, v0, v1}, Lcom/melodix/music/NativeUiRowFactory;->applyTextSize(Landroid/widget/TextView;Landroid/content/Context;Ljava/lang/String;F)V

    return-void
.end method

.method public static applyBannerAction(Landroid/widget/TextView;Landroid/content/Context;)V
    .locals 2

    const-string v0, "mel_banner_action_text"

    const/high16 v1, 0x41600000

    invoke-static {p0, p1, v0, v1}, Lcom/melodix/music/NativeUiRowFactory;->applyTextSize(Landroid/widget/TextView;Landroid/content/Context;Ljava/lang/String;F)V

    return-void
.end method

.method public static statusPadH(Landroid/content/Context;)I
    .locals 2

    const-string v0, "mel_status_pad_h"

    const/16 v1, 0x14

    invoke-static {p0, v0, v1}, Lcom/melodix/music/NativeUiRowFactory;->metric(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static statusPadV(Landroid/content/Context;)I
    .locals 2

    const-string v0, "mel_status_pad_v"

    const/16 v1, 0x12

    invoke-static {p0, v0, v1}, Lcom/melodix/music/NativeUiRowFactory;->metric(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static statusMarginV(Landroid/content/Context;)I
    .locals 2

    const-string v0, "mel_status_margin_v"

    const/16 v1, 0x10

    invoke-static {p0, v0, v1}, Lcom/melodix/music/NativeUiRowFactory;->metric(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static statusIcon(Landroid/content/Context;)I
    .locals 2

    const-string v0, "mel_status_icon"

    const/16 v1, 0x2c

    invoke-static {p0, v0, v1}, Lcom/melodix/music/NativeUiRowFactory;->metric(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static statusIconPad(Landroid/content/Context;)I
    .locals 2

    const-string v0, "mel_status_icon_pad"

    const/16 v1, 0xa

    invoke-static {p0, v0, v1}, Lcom/melodix/music/NativeUiRowFactory;->metric(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static statusIconGap(Landroid/content/Context;)I
    .locals 2

    const-string v0, "mel_status_icon_gap"

    const/16 v1, 0xc

    invoke-static {p0, v0, v1}, Lcom/melodix/music/NativeUiRowFactory;->metric(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static statusLabelGap(Landroid/content/Context;)I
    .locals 2

    const-string v0, "mel_status_label_gap"

    const/4 v1, 0x4

    invoke-static {p0, v0, v1}, Lcom/melodix/music/NativeUiRowFactory;->metric(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static statusSublabelGap(Landroid/content/Context;)I
    .locals 2

    const-string v0, "mel_status_sublabel_gap"

    const/16 v1, 0xe

    invoke-static {p0, v0, v1}, Lcom/melodix/music/NativeUiRowFactory;->metric(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static statusActionHeight(Landroid/content/Context;)I
    .locals 2

    const-string v0, "mel_status_action_height"

    const/16 v1, 0x30

    invoke-static {p0, v0, v1}, Lcom/melodix/music/NativeUiRowFactory;->metric(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static statusActionPadH(Landroid/content/Context;)I
    .locals 2

    const-string v0, "mel_status_action_pad_h"

    const/16 v1, 0xc

    invoke-static {p0, v0, v1}, Lcom/melodix/music/NativeUiRowFactory;->metric(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static statusActionPadV(Landroid/content/Context;)I
    .locals 2

    const-string v0, "mel_status_action_pad_v"

    const/16 v1, 0xa

    invoke-static {p0, v0, v1}, Lcom/melodix/music/NativeUiRowFactory;->metric(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static statusActionGap(Landroid/content/Context;)I
    .locals 2

    const-string v0, "mel_status_action_gap"

    const/16 v1, 0x8

    invoke-static {p0, v0, v1}, Lcom/melodix/music/NativeUiRowFactory;->metric(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static statusActionsGap(Landroid/content/Context;)I
    .locals 2

    const-string v0, "mel_status_actions_gap"

    const/16 v1, 0x10

    invoke-static {p0, v0, v1}, Lcom/melodix/music/NativeUiRowFactory;->metric(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static quickArt(Landroid/content/Context;)I
    .locals 2

    const-string v0, "mel_quick_art"

    const/16 v1, 0x38

    invoke-static {p0, v0, v1}, Lcom/melodix/music/NativeUiRowFactory;->metric(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static quickRadius(Landroid/content/Context;)I
    .locals 2

    const-string v0, "mel_quick_radius"

    const/16 v1, 0x8

    invoke-static {p0, v0, v1}, Lcom/melodix/music/NativeUiRowFactory;->metric(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static quickGap(Landroid/content/Context;)I
    .locals 2

    const-string v0, "mel_quick_gap"

    const/16 v1, 0x8

    invoke-static {p0, v0, v1}, Lcom/melodix/music/NativeUiRowFactory;->metric(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method
