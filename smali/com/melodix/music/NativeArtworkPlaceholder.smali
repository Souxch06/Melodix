.class public final Lcom/melodix/music/NativeArtworkPlaceholder;
.super Ljava/lang/Object;

.method public static get(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;
    .locals 4
    :placeholder_try
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;
    move-result-object v1
    const-string v2, "native_artwork_placeholder"
    const-string v3, "drawable"
    invoke-virtual {v0, v2, v3, v1}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    move-result v0
    if-eqz v0, :placeholder_fallback
    invoke-virtual {p0, v0}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;
    move-result-object v0
    return-object v0
    :placeholder_end
    .catch Ljava/lang/RuntimeException; {:placeholder_try .. :placeholder_end} :placeholder_error
    :placeholder_error
    move-exception v0
    :placeholder_fallback
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;
    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V
    sget v1, Lcom/melodix/music/MelColors;->surface:I
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V
    return-object v0
.end method
