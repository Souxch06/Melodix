.class public final Lcom/melodix/music/NativeHomeShelfPreview;
.super Ljava/lang/Object;

# A detached Home-only view tree. The existing feed remains the fallback on
# empty, invalid or unsupported data, and every other screen still uses it.
.method public static paint(Lcom/melodix/music/MainActivity;Landroid/view/ViewGroup;Ljava/lang/String;)I
    .locals 11

    if-eqz p0, :empty
    if-eqz p1, :empty
    if-eqz p2, :empty
    :try_start
    new-instance v0, Lorg/json/JSONArray;
    invoke-direct {v0, p2}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I
    move-result v1
    if-lez v1, :empty

    new-instance v8, Landroid/widget/LinearLayout;
    invoke-direct {v8, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
    const/4 v6, 0x1
    invoke-virtual {v8, v6}, Landroid/widget/LinearLayout;->setOrientation(I)V
    const/4 v2, 0x0
    const/4 v4, 0x0
    const/4 v9, 0x0
    const-string v3, ""

    :loop
    if-ge v2, v1, :commit
    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;
    move-result-object v5
    if-eqz v5, :next

    # Preserve the historical feed's filtering for untitled/URI-only rows.
    const-string v6, "title"
    const-string v7, ""
    invoke-virtual {v5, v6, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v6
    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z
    move-result v6
    if-eqz v6, :has_row
    const-string v6, "uri"
    invoke-virtual {v5, v6, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v6
    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z
    move-result v6
    if-eqz v6, :next
    :has_row

    # Settings rows have a different factory. Never silently convert them.
    const-string v6, "settingValue"
    const-string v7, ""
    invoke-virtual {v5, v6, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v6
    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z
    move-result v6
    if-eqz v6, :empty

    # Keep the original factory's name, URI, image, subtitles and listeners.
    const-string v6, "section"
    const-string v7, ""
    invoke-virtual {v5, v6, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v6
    if-eqz v4, :new_section
    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v7
    if-nez v7, :have_section

    :new_section
    move-object v3, v6
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z
    move-result v7
    if-nez v7, :no_header
    invoke-static {p0, v3}, Lcom/melodix/music/NativeUiRowFactory;->createSectionHeader(Lcom/melodix/music/MainActivity;Ljava/lang/String;)Landroid/widget/TextView;
    move-result-object v7
    if-eqz v7, :no_header
    invoke-virtual {v8, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V
    :no_header
    new-instance v4, Landroid/widget/LinearLayout;
    invoke-direct {v4, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
    const/4 v7, 0x0
    invoke-virtual {v4, v7}, Landroid/widget/LinearLayout;->setOrientation(I)V
    new-instance v6, Landroid/widget/HorizontalScrollView;
    invoke-direct {v6, p0}, Landroid/widget/HorizontalScrollView;-><init>(Landroid/content/Context;)V
    invoke-virtual {v6, v7}, Landroid/widget/HorizontalScrollView;->setHorizontalScrollBarEnabled(Z)V
    invoke-virtual {v6, v7}, Landroid/view/ViewGroup;->setClipToPadding(Z)V
    const/16 v7, 0x10
    invoke-static {p0, v7}, Lcom/melodix/music/NativeHomeShelfPreview;->dp(Landroid/content/Context;I)I
    move-result v7
    const/4 v10, 0x0
    invoke-virtual {v6, v7, v10, v7, v10}, Landroid/view/View;->setPadding(IIII)V
    new-instance v7, Landroid/widget/FrameLayout$LayoutParams;
    const/4 v10, -0x2
    invoke-direct {v7, v10, v10}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V
    invoke-virtual {v6, v4, v7}, Landroid/widget/HorizontalScrollView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    invoke-virtual {v8, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    :have_section
    invoke-static {p0, v5}, Lcom/melodix/music/NativeUiRowFactory;->create(Lcom/melodix/music/MainActivity;Lorg/json/JSONObject;)Landroid/widget/LinearLayout;
    move-result-object v6
    if-eqz v6, :next
    invoke-static {p0, v6}, Lcom/melodix/music/NativeHomeShelfPreview;->asCard(Landroid/content/Context;Landroid/widget/LinearLayout;)V
    invoke-virtual {v4, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V
    add-int/lit8 v9, v9, 0x1
    :next
    add-int/lit8 v2, v2, 0x1
    goto :loop

    :commit
    if-lez v9, :empty
    # Add first, then strip older views, as in the historical feed.
    invoke-virtual {p1, v8}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V
    :strip
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I
    move-result v6
    const/4 v7, 0x1
    if-le v6, v7, :done
    const/4 v6, 0x0
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->removeViewAt(I)V
    goto :strip
    :done
    return v9
    :try_end
    .catch Ljava/lang/Throwable; {:try_start .. :try_end} :failed

    :failed
    move-exception v0
    invoke-static {v0}, Lcom/melodix/music/NativeCrashGuard;->record(Ljava/lang/Throwable;)V
    :empty
    const/4 v0, 0x0
    return v0
.end method

# The factory's two children are the artwork and the text column. Restyle the
# existing row rather than reconstructing data, images or listener logic.
.method private static asCard(Landroid/content/Context;Landroid/widget/LinearLayout;)V
    .locals 6
    const/4 v0, 0x1
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V
    const/4 v0, 0x3
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setGravity(I)V
    const/16 v0, 0xa
    invoke-static {p0, v0}, Lcom/melodix/music/NativeHomeShelfPreview;->dp(Landroid/content/Context;I)I
    move-result v0
    invoke-virtual {p1, v0, v0, v0, v0}, Landroid/view/View;->setPadding(IIII)V

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;
    const/16 v2, 0x9c
    invoke-static {p0, v2}, Lcom/melodix/music/NativeHomeShelfPreview;->dp(Landroid/content/Context;I)I
    move-result v2
    const/4 v3, -0x2
    invoke-direct {v1, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    iput v0, v1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I
    iput v0, v1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I
    invoke-virtual {p1, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    const/4 v1, 0x0
    invoke-virtual {p1, v1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;
    move-result-object v2
    if-eqz v2, :card_done
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v4, -0x1
    const/16 v5, 0x88
    invoke-static {p0, v5}, Lcom/melodix/music/NativeHomeShelfPreview;->dp(Landroid/content/Context;I)I
    move-result v5
    invoke-direct {v3, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual {v2, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    const/4 v1, 0x1
    invoke-virtual {p1, v1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;
    move-result-object v2
    if-eqz v2, :card_done
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v5, -0x2
    invoke-direct {v3, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    const/16 v5, 0x8
    invoke-static {p0, v5}, Lcom/melodix/music/NativeHomeShelfPreview;->dp(Landroid/content/Context;I)I
    move-result v5
    iput v5, v3, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I
    invoke-virtual {v2, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
    :card_done
    return-void
.end method

.method private static dp(Landroid/content/Context;I)I
    .locals 2
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v0
    iget v0, v0, Landroid/util/DisplayMetrics;->density:F
    int-to-float v1, p1
    mul-float/2addr v1, v0
    const/high16 v0, 0x3f000000
    add-float/2addr v1, v0
    float-to-int v1, v1
    return v1
.end method
