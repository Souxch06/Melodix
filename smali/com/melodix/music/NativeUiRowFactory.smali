.class public final Lcom/melodix/music/NativeUiRowFactory;
.super Ljava/lang/Object;

.method public static create(Lcom/melodix/music/MainActivity;Lorg/json/JSONObject;)Landroid/widget/LinearLayout;
    .locals 12

    const-string v0, "title"
    const-string v1, ""
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v6
    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z
    move-result v0
    if-eqz v0, :native_row_title_ready
    const-string v0, "name"
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v6
    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z
    move-result v0
    if-eqz v0, :native_row_title_ready
    const-string v0, "label"
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v6

    :native_row_title_ready
    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z
    move-result v0
    if-nez v0, :native_row_default_title
    goto :native_row_read_subtitle
    :native_row_default_title
    const-string v6, "Untitled"

    :native_row_read_subtitle
    const-string v0, "subtitle"
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v7
    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z
    move-result v0
    if-eqz v0, :native_row_read_section
    const-string v0, "artist"
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v7
    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z
    move-result v0
    if-eqz v0, :native_row_read_section
    const-string v0, "description"
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v7
    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z
    move-result v0
    if-eqz v0, :native_row_read_section
    const-string v0, "type"
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v7

    :native_row_read_section
    const-string v0, "section"
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v10
    invoke-virtual {v10}, Ljava/lang/String;->isEmpty()Z
    move-result v0
    if-nez v0, :native_row_section_done
    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z
    move-result v0
    if-eqz v0, :native_row_join_section
    move-object v7, v10
    goto :native_row_section_done
    :native_row_join_section
    new-instance v11, Ljava/lang/StringBuilder;
    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v0, " · "
    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v7

    :native_row_section_done
    const-string v0, "uri"
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v8
    invoke-virtual {v8}, Ljava/lang/String;->isEmpty()Z
    move-result v0
    if-eqz v0, :native_row_uri_done
    const-string v0, "id"
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v8
    invoke-virtual {v8}, Ljava/lang/String;->isEmpty()Z
    move-result v0
    if-eqz v0, :native_row_uri_done
    const-string v0, "href"
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v8

    :native_row_uri_done
    const-string v0, "image"
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v9
    invoke-virtual {v9}, Ljava/lang/String;->isEmpty()Z
    move-result v0
    if-eqz v0, :native_row_image_done
    const-string v0, "cover"
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v9
    invoke-virtual {v9}, Ljava/lang/String;->isEmpty()Z
    move-result v0
    if-eqz v0, :native_row_image_done
    const-string v0, "artwork"
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v9

    :native_row_image_done
    new-instance v0, Landroid/widget/LinearLayout;
    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
    const/4 v1, 0x0
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V
    const/16 v1, 0x10
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    const/16 v1, 0xc
    invoke-static {p0, v1}, Lcom/melodix/music/NativeUiRowFactory;->dp(Landroid/content/Context;I)I
    move-result v1
    const/16 v2, 0x8
    invoke-static {p0, v2}, Lcom/melodix/music/NativeUiRowFactory;->dp(Landroid/content/Context;I)I
    move-result v2
    invoke-virtual {v0, v1, v2, v1, v2}, Landroid/view/View;->setPadding(IIII)V

    new-instance v10, Landroid/graphics/drawable/GradientDrawable;
    invoke-direct {v10}, Landroid/graphics/drawable/GradientDrawable;-><init>()V
    const v11, -0xeae2e8
    invoke-virtual {v10, v11}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V
    const/high16 v11, 0x41400000
    const/high16 v11, 0x41800000
    invoke-virtual {v10, v11}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V
    const/4 v11, 0x1
    invoke-static {p0, v11}, Lcom/melodix/music/NativeUiRowFactory;->dp(Landroid/content/Context;I)I
    move-result v11
    const v5, 0xff2a372f
    invoke-virtual {v10, v11, v5}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V
    invoke-virtual {v0, v10}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V
    const/16 v10, 0x50
    invoke-static {p0, v10}, Lcom/melodix/music/NativeUiRowFactory;->dp(Landroid/content/Context;I)I
    move-result v10
    invoke-virtual {v0, v10}, Landroid/view/View;->setMinimumHeight(I)V

    new-instance v1, Landroid/widget/ImageView;
    invoke-direct {v1, p0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V
    sget-object v10, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;
    invoke-virtual {v1, v10}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V
    const v10, -0xdfd8de
    invoke-virtual {v1, v10}, Landroid/view/View;->setBackgroundColor(I)V
    invoke-virtual {v1, v6}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;
    const/16 v10, 0x40
    invoke-static {p0, v10}, Lcom/melodix/music/NativeUiRowFactory;->dp(Landroid/content/Context;I)I
    move-result v10
    invoke-direct {v5, v10, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    const/16 v10, 0xa
    invoke-static {p0, v10}, Lcom/melodix/music/NativeUiRowFactory;->dp(Landroid/content/Context;I)I
    move-result v10
    iput v10, v5, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I
    invoke-virtual {v0, v1, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    invoke-virtual {v9}, Ljava/lang/String;->isEmpty()Z
    move-result v10
    if-nez v10, :native_row_text_column
    const/16 v10, 0xa8
    invoke-static {v1, v9, v10}, Lcom/melodix/music/NativeImageLoader;->load(Landroid/widget/ImageView;Ljava/lang/String;I)V

    :native_row_text_column
    new-instance v2, Landroid/widget/LinearLayout;
    invoke-direct {v2, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
    const/4 v10, 0x1
    invoke-virtual {v2, v10}, Landroid/widget/LinearLayout;->setOrientation(I)V
    const/16 v10, 0x10
    invoke-virtual {v2, v10}, Landroid/widget/LinearLayout;->setGravity(I)V

    new-instance v3, Landroid/widget/TextView;
    invoke-direct {v3, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
    invoke-virtual {v3, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    const/high16 v10, 0x41800000
    invoke-virtual {v3, v10}, Landroid/widget/TextView;->setTextSize(F)V
    const v10, -0x1
    invoke-virtual {v3, v10}, Landroid/widget/TextView;->setTextColor(I)V
    const/4 v10, 0x1
    invoke-virtual {v3, v10}, Landroid/widget/TextView;->setMaxLines(I)V
    const/4 v10, 0x0
    const/4 v11, 0x1
    invoke-virtual {v3, v10, v11}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V
    sget-object v10, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;
    invoke-virtual {v3, v10}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v10, -0x1
    const/4 v11, -0x2
    invoke-direct {v5, v10, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual {v2, v3, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v4, Landroid/widget/TextView;
    invoke-direct {v4, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
    invoke-virtual {v4, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    const/high16 v10, 0x41500000
    invoke-virtual {v4, v10}, Landroid/widget/TextView;->setTextSize(F)V
    const v10, -0x4a3f48
    invoke-virtual {v4, v10}, Landroid/widget/TextView;->setTextColor(I)V
    const/4 v10, 0x1
    invoke-virtual {v4, v10}, Landroid/widget/TextView;->setMaxLines(I)V
    sget-object v10, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;
    invoke-virtual {v4, v10}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v10, -0x1
    const/4 v11, -0x2
    invoke-direct {v5, v10, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual {v2, v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v10, 0x0
    const/4 v11, -0x2
    const/high16 v1, 0x3f800000
    invoke-direct {v5, v10, v11, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V
    invoke-virtual {v0, v2, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v11, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v10, -0x1
    const/4 v5, -0x2
    invoke-direct {v11, v10, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    const/16 v10, 0xa
    invoke-static {p0, v10}, Lcom/melodix/music/NativeUiRowFactory;->dp(Landroid/content/Context;I)I
    move-result v10
    iput v10, v11, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I
    invoke-virtual {v0, v11}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    const/4 v10, 0x1
    invoke-virtual {v0, v10}, Landroid/view/View;->setClickable(Z)V
    invoke-virtual {v0, v10}, Landroid/view/View;->setFocusable(Z)V
    new-instance v11, Ljava/lang/StringBuilder;
    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual {v11, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z
    move-result v10
    if-nez v10, :native_row_accessibility_ready
    const-string v10, ", "
    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :native_row_accessibility_ready
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v11
    invoke-virtual {v0, v11}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V
    invoke-virtual {v8}, Ljava/lang/String;->isEmpty()Z
    move-result v10
    if-nez v10, :native_row_return
    new-instance v10, Lcom/melodix/music/NativeRowClickListener;
    invoke-direct {v10, p0, v8, v6}, Lcom/melodix/music/NativeRowClickListener;-><init>(Lcom/melodix/music/MainActivity;Ljava/lang/String;Ljava/lang/String;)V
    invoke-virtual {v0, v10}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :native_row_return
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
    mul-float v1, v1, v2
    float-to-int v0, v1
    return v0
.end method
