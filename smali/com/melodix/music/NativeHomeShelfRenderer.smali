.class public final Lcom/melodix/music/NativeHomeShelfRenderer;
.super Ljava/lang/Object;

# Spotify-mobile style Home: one horizontal shelf per section, each shelf
# holding square cover cards (artwork, title, subtitle). The previous flat
# list of full-width rows read like a settings table, not like the Spotify app.


# direct methods
.method public static render(Lcom/melodix/music/MainActivity;Ljava/lang/String;)V
    .locals 14

    const v13, 0x7f090235

    invoke-virtual {p0, v13}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v13

    # The container is a LinearLayout inside a ScrollView; explicit cast keeps
    # the verifier happy before the addView calls below.
    check-cast v13, Landroid/widget/LinearLayout;

    if-eqz v13, :shelf_done

    :try_start_0
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0, p1}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v1

    # MDXTRACE: how many Home rows actually reached the renderer.
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "home-render rows="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "MDXTRACE"

    invoke-static {v3, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    if-lez v1, :shelf_empty

    invoke-static {p0, v13, v0}, Lcom/melodix/music/NativeHomeShelfRenderer;->renderQuickGrid(Lcom/melodix/music/MainActivity;Landroid/widget/LinearLayout;Lorg/json/JSONArray;)V

    const-string v2, ""

    const/4 v3, 0x0

    const/4 v4, 0x0

    :shelf_loop
    if-ge v4, v1, :shelf_finish

    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v5

    if-eqz v5, :shelf_next

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

    if-eqz v7, :shelf_header_done

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

    const/16 v9, 0x10

    invoke-static {p0, v9}, Lcom/melodix/music/NativeHomeShelfRenderer;->dp(Landroid/content/Context;I)I

    move-result v9

    const/4 v10, 0x0

    invoke-virtual {v8, v9, v10, v9, v10}, Landroid/view/View;->setPadding(IIII)V

    new-instance v9, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v10, -0x2

    invoke-direct {v9, v10, v10}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v8, v7, v9}, Landroid/widget/HorizontalScrollView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v13, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    move-object v3, v7

    :shelf_have_container
    if-eqz v3, :shelf_next

    # Card container: square cover, title, subtitle.
    new-instance v7, Landroid/widget/LinearLayout;

    invoke-direct {v7, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v8, 0x1

    invoke-virtual {v7, v8}, Landroid/widget/LinearLayout;->setOrientation(I)V

    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v9, 0x94

    invoke-static {p0, v9}, Lcom/melodix/music/NativeHomeShelfRenderer;->dp(Landroid/content/Context;I)I

    move-result v9

    const/4 v10, -0x2

    invoke-direct {v8, v9, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/16 v9, 0x8

    invoke-static {p0, v9}, Lcom/melodix/music/NativeHomeShelfRenderer;->dp(Landroid/content/Context;I)I

    move-result v9

    iput v9, v8, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    invoke-virtual {v7, v8}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    const-string v8, "title"

    const-string v9, ""

    invoke-virtual {v5, v8, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-nez v8, :shelf_cover_drawable

    const-string v8, "Spotify"

    move-object v9, v8

    :shelf_cover_drawable
    new-instance v8, Landroid/widget/ImageView;

    invoke-direct {v8, p0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    sget-object v10, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v8, v10}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    new-instance v10, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v10}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const v11, -0xe2e2e3

    invoke-virtual {v10, v11}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    const/16 v11, 0xc

    invoke-static {p0, v11}, Lcom/melodix/music/NativeHomeShelfRenderer;->dp(Landroid/content/Context;I)I

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

    const/16 v11, 0x94

    invoke-static {p0, v11}, Lcom/melodix/music/NativeHomeShelfRenderer;->dp(Landroid/content/Context;I)I

    move-result v11

    invoke-direct {v10, v11, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v7, v8, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const-string v10, "image"

    const-string v11, ""

    invoke-virtual {v5, v10, v11}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/String;->isEmpty()Z

    move-result v11

    if-eqz v11, :shelf_title

    const/16 v11, 0xb0

    invoke-static {v8, v10, v11}, Lcom/melodix/music/NativeImageLoader;->load(Landroid/widget/ImageView;Ljava/lang/String;I)V

    :shelf_title
    new-instance v10, Landroid/widget/TextView;

    invoke-direct {v10, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v10, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v11, 0x41700000

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setTextSize(F)V

    const v11, 0xff1ed760

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setTextColor(I)V

    const/4 v11, 0x0

    const/4 v12, 0x1

    invoke-virtual {v10, v11, v12}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    const/4 v11, 0x2

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setMaxLines(I)V

    sget-object v11, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    new-instance v11, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v12, -0x1

    const/4 v6, -0x2

    invoke-direct {v11, v12, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/16 v12, 0x8

    invoke-static {p0, v12}, Lcom/melodix/music/NativeHomeShelfRenderer;->dp(Landroid/content/Context;I)I

    move-result v12

    iput v12, v11, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    invoke-virtual {v7, v10, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const-string v10, "subtitle"

    const-string v11, ""

    invoke-virtual {v5, v10, v11}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/String;->isEmpty()Z

    move-result v11

    if-eqz v11, :shelf_click

    new-instance v11, Landroid/widget/TextView;

    invoke-direct {v11, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v11, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v12, 0x41300000

    invoke-virtual {v11, v12}, Landroid/widget/TextView;->setTextSize(F)V

    const v12, 0xffbfc0cb

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

    const/4 v6, 0x2

    invoke-static {p0, v6}, Lcom/melodix/music/NativeHomeShelfRenderer;->dp(Landroid/content/Context;I)I

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

    if-eqz v11, :shelf_add

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
    invoke-virtual {v3, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    :shelf_next
    add-int/lit8 v4, v4, 0x1

    goto :shelf_loop

    :shelf_finish
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v6, -0x1

    const/16 v7, 0x10

    invoke-static {p0, v7}, Lcom/melodix/music/NativeHomeShelfRenderer;->dp(Landroid/content/Context;I)I

    move-result v7

    invoke-direct {v5, v6, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    new-instance v6, Landroid/view/View;

    invoke-direct {v6, p0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    invoke-virtual {v13, v6, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    goto :shelf_done

    :shelf_empty
    # MDXTRACE: explicit reason for the empty state (never silent).
    const-string v2, "MDXTRACE"

    const-string v3, "home-render empty reason=rows-0 (waiting for library/merge)"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    # Empty payload: keep a friendly loading line instead of a blank screen.
    new-instance v0, Landroid/widget/TextView;
    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
    const-string v1, "Chargement de votre accueil…"
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    const/high16 v1, 0x41800000
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V
    const v1, 0xffbfc0cb
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V
    const/16 v1, 0x11
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setGravity(I)V
    const/16 v1, 0x18
    invoke-virtual {v0, v1, v1, v1, v1}, Landroid/view/View;->setPadding(IIII)V
    invoke-virtual {v13, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    :shelf_done
    return-void

    :catch_0
    move-exception v0

    return-void
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

    const/16 v6, 0x38

    invoke-static {p0, v6}, Lcom/melodix/music/NativeHomeShelfRenderer;->dp(Landroid/content/Context;I)I

    move-result v6

    invoke-direct {v5, v6, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v3, v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-eqz v5, :quick_tile_title

    const/16 v5, 0x38

    invoke-static {p0, v5}, Lcom/melodix/music/NativeHomeShelfRenderer;->dp(Landroid/content/Context;I)I

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

    const/16 v6, 0x8

    invoke-static {p0, v6}, Lcom/melodix/music/NativeHomeShelfRenderer;->dp(Landroid/content/Context;I)I

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

    if-eqz v6, :quick_tile_return

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

    if-ge v0, v1, :quick_grid_done

    const/4 v1, 0x6

    if-le v0, v1, :quick_grid_cap

    goto :quick_grid_begin

    :quick_grid_cap
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

    const/16 v4, 0x8

    invoke-static {p0, v4}, Lcom/melodix/music/NativeHomeShelfRenderer;->dp(Landroid/content/Context;I)I

    move-result v4

    iput v4, v3, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    invoke-virtual {v2, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    # Same 16 dp side gutters as the editorial shelves.
    const/16 v3, 0x10

    invoke-static {p0, v3}, Lcom/melodix/music/NativeHomeShelfRenderer;->dp(Landroid/content/Context;I)I

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

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v4, 0x0
    const/4 v7, -0x2
    const/high16 v8, 0x3f800000

    invoke-direct {v6, v4, v7, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    if-nez v3, :quick_grid_tile_add

    const/16 v4, 0x8

    invoke-static {p0, v4}, Lcom/melodix/music/NativeHomeShelfRenderer;->dp(Landroid/content/Context;I)I

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
