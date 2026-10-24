.class public final Lcom/melodix/music/NativeSettingsRowFactory;
.super Ljava/lang/Object;

# Renders one row of the native Spotify settings screen: a title, an optional
# explanation, and a rounded value pill (ON / OFF / current quality / action).

.method public static create(Lcom/melodix/music/MainActivity;Lorg/json/JSONObject;)Landroid/widget/LinearLayout;
    .locals 12

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

    const/16 v0, 0xe
    invoke-static {p0, v0}, Lcom/melodix/music/NativeSettingsRowFactory;->dp(Landroid/content/Context;I)I
    move-result v0
    const/16 v1, 0xb
    invoke-static {p0, v1}, Lcom/melodix/music/NativeSettingsRowFactory;->dp(Landroid/content/Context;I)I
    move-result v1
    invoke-virtual {v2, v0, v1, v0, v1}, Landroid/view/View;->setPadding(IIII)V

    new-instance v3, Landroid/graphics/drawable/GradientDrawable;
    invoke-direct {v3}, Landroid/graphics/drawable/GradientDrawable;-><init>()V
    const v0, -0xe7e7e8
    invoke-virtual {v3, v0}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V
    const/high16 v0, 0x41600000
    invoke-virtual {v3, v0}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V
    const/4 v0, 0x1
    invoke-static {p0, v0}, Lcom/melodix/music/NativeSettingsRowFactory;->dp(Landroid/content/Context;I)I
    move-result v0
    const v1, -0xd5d5d6
    invoke-virtual {v3, v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V
    invoke-virtual {v2, v3}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V
    const/16 v0, 0x40
    invoke-static {p0, v0}, Lcom/melodix/music/NativeSettingsRowFactory;->dp(Landroid/content/Context;I)I
    move-result v0
    invoke-virtual {v2, v0}, Landroid/view/View;->setMinimumHeight(I)V

    const-string v0, "image"
    const-string v1, ""
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v9
    invoke-virtual {v9}, Ljava/lang/String;->isEmpty()Z
    move-result v0
    if-nez v0, :native_settings_no_avatar
    new-instance v0, Landroid/widget/ImageView;
    invoke-direct {v0, p0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V
    sget-object v1, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V
    new-instance v1, Landroid/graphics/drawable/GradientDrawable;
    invoke-direct {v1}, Landroid/graphics/drawable/GradientDrawable;-><init>()V
    const v3, -0xd5d5d6
    invoke-virtual {v1, v3}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V
    const/high16 v3, 0x41b00000
    invoke-virtual {v1, v3}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V
    const/4 v3, 0x1
    invoke-virtual {v0, v3}, Landroid/view/View;->setClipToOutline(Z)V
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;
    const/16 v3, 0x2c
    invoke-static {p0, v3}, Lcom/melodix/music/NativeSettingsRowFactory;->dp(Landroid/content/Context;I)I
    move-result v3
    invoke-direct {v1, v3, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    const/16 v3, 0xc
    invoke-static {p0, v3}, Lcom/melodix/music/NativeSettingsRowFactory;->dp(Landroid/content/Context;I)I
    move-result v3
    iput v3, v1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I
    invoke-virtual {v2, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    const/16 v3, 0xb0
    invoke-static {v0, v9, v3}, Lcom/melodix/music/NativeImageLoader;->load(Landroid/widget/ImageView;Ljava/lang/String;I)V

    :native_settings_no_avatar
    new-instance v8, Landroid/widget/LinearLayout;
    invoke-direct {v8, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
    const/4 v0, 0x1
    invoke-virtual {v8, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    new-instance v9, Landroid/widget/TextView;
    invoke-direct {v9, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
    invoke-virtual {v9, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    const/high16 v0, 0x41780000
    invoke-virtual {v9, v0}, Landroid/widget/TextView;->setTextSize(F)V
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
    const/high16 v0, 0x41400000
    invoke-virtual {v10, v0}, Landroid/widget/TextView;->setTextSize(F)V
    const v0, -0x4c4c4d
    invoke-virtual {v10, v0}, Landroid/widget/TextView;->setTextColor(I)V
    const/4 v0, 0x2
    invoke-virtual {v10, v0}, Landroid/widget/TextView;->setMaxLines(I)V
    sget-object v0, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;
    invoke-virtual {v10, v0}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V
    const/4 v0, 0x3
    invoke-static {p0, v0}, Lcom/melodix/music/NativeSettingsRowFactory;->dp(Landroid/content/Context;I)I
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

    new-instance v11, Landroid/widget/TextView;
    invoke-direct {v11, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
    invoke-virtual {v11, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    const/high16 v0, 0x41400000
    invoke-virtual {v11, v0}, Landroid/widget/TextView;->setTextSize(F)V
    const/4 v0, 0x0
    const/4 v1, 0x1
    invoke-virtual {v11, v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V
    const/16 v0, 0x11
    invoke-virtual {v11, v0}, Landroid/widget/TextView;->setGravity(I)V
    const/4 v0, 0x1
    invoke-virtual {v11, v0}, Landroid/widget/TextView;->setMaxLines(I)V
    const/16 v0, 0xd
    invoke-static {p0, v0}, Lcom/melodix/music/NativeSettingsRowFactory;->dp(Landroid/content/Context;I)I
    move-result v0
    const/4 v1, 0x5
    invoke-static {p0, v1}, Lcom/melodix/music/NativeSettingsRowFactory;->dp(Landroid/content/Context;I)I
    move-result v1
    invoke-virtual {v11, v0, v1, v0, v1}, Landroid/view/View;->setPadding(IIII)V

    const v0, -0xd0d0d1
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
    const v0, -0xd5d5d6
    const v1, -0x4c4c4d
    goto :native_settings_pill_build

    :native_settings_pill_not_off
    const-string v3, "Déconnexion"
    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :native_settings_pill_build
    const v1, -0xea194

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
    const/16 v3, 0xa
    invoke-static {p0, v3}, Lcom/melodix/music/NativeSettingsRowFactory;->dp(Landroid/content/Context;I)I
    move-result v3
    iput v3, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I
    invoke-virtual {v2, v11, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v1, -0x1
    const/4 v3, -0x2
    invoke-direct {v0, v1, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    const/16 v1, 0x8
    invoke-static {p0, v1}, Lcom/melodix/music/NativeSettingsRowFactory;->dp(Landroid/content/Context;I)I
    move-result v1
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I
    invoke-virtual {v2, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    const/4 v0, 0x1
    invoke-virtual {v2, v0}, Landroid/view/View;->setClickable(Z)V
    invoke-virtual {v2, v0}, Landroid/view/View;->setFocusable(Z)V
    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z
    move-result v0
    if-nez v0, :native_settings_return
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
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    const/high16 v1, 0x41800000
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V
    const v1, -0x1
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V
    const/4 v1, 0x0
    const/4 v2, 0x1
    invoke-virtual {v0, v1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V
    const/16 v2, 0x10
    invoke-static {p0, v2}, Lcom/melodix/music/NativeSettingsRowFactory;->dp(Landroid/content/Context;I)I
    move-result v2
    const/16 v3, 0x6
    invoke-static {p0, v3}, Lcom/melodix/music/NativeSettingsRowFactory;->dp(Landroid/content/Context;I)I
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
