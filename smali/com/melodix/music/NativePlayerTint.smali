.class public final Lcom/melodix/music/NativePlayerTint;
.super Ljava/lang/Object;

# Uses only the already displayed bitmap: bounded 16x16 samples and a small
# quantized histogram, with no loading, URL or network operation of its own.
.method public static apply(Landroid/widget/ImageView;)V
    .locals 14
    if-eqz p0, :done
    :try_start
    invoke-virtual {p0}, Landroid/view/View;->getId()I
    move-result v0
    const v1, 0x7f090245
    if-ne v0, v1, :done
    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;
    move-result-object v1
    instance-of v0, v1, Landroid/graphics/drawable/BitmapDrawable;
    if-eqz v0, :fallback
    check-cast v1, Landroid/graphics/drawable/BitmapDrawable;
    invoke-virtual {v1}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;
    move-result-object v1
    if-eqz v1, :fallback
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I
    move-result v2
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I
    move-result v3
    if-lez v2, :fallback
    if-lez v3, :fallback
    const/16 v0, 0x1000
    new-array v4, v0, [I
    const/4 v6, 0x0
    const/4 v10, 0x0
    const/4 v11, 0x0
    :sample_y
    const/16 v0, 0x10
    if-ge v6, v0, :samples_done
    const/4 v5, 0x0
    :sample_x
    const/16 v0, 0x10
    if-ge v5, v0, :sample_next_y
    mul-int v8, v5, v2
    div-int/lit8 v8, v8, 0x10
    mul-int v9, v6, v3
    div-int/lit8 v9, v9, 0x10
    invoke-virtual {v1, v8, v9}, Landroid/graphics/Bitmap;->getPixel(II)I
    move-result v7
    ushr-int/lit8 v8, v7, 0x18
    const/16 v9, 0x80
    if-lt v8, v9, :sample_next_x
    ushr-int/lit8 v8, v7, 0x14
    and-int/lit8 v8, v8, 0xf
    shl-int/lit8 v8, v8, 0x8
    ushr-int/lit8 v9, v7, 0xc
    and-int/lit8 v9, v9, 0xf
    shl-int/lit8 v9, v9, 0x4
    or-int/2addr v8, v9
    ushr-int/lit8 v9, v7, 0x4
    and-int/lit8 v9, v9, 0xf
    or-int/2addr v8, v9
    aget v9, v4, v8
    add-int/lit8 v9, v9, 0x1
    aput v9, v4, v8
    if-le v9, v10, :sample_next_x
    move v10, v9
    move v11, v8
    :sample_next_x
    add-int/lit8 v5, v5, 0x1
    goto :sample_x
    :sample_next_y
    add-int/lit8 v6, v6, 0x1
    goto :sample_y
    :samples_done
    if-eqz v10, :fallback
    # Darken to 40% so white player labels remain readable on bright covers.
    ushr-int/lit8 v7, v11, 0x8
    and-int/lit8 v7, v7, 0xf
    mul-int/lit8 v7, v7, 0x22
    div-int/lit8 v7, v7, 0x5
    shl-int/lit8 v7, v7, 0x10
    ushr-int/lit8 v8, v11, 0x4
    and-int/lit8 v8, v8, 0xf
    mul-int/lit8 v8, v8, 0x22
    div-int/lit8 v8, v8, 0x5
    shl-int/lit8 v8, v8, 0x8
    or-int/2addr v7, v8
    and-int/lit8 v8, v11, 0xf
    mul-int/lit8 v8, v8, 0x22
    div-int/lit8 v8, v8, 0x5
    or-int/2addr v7, v8
    const/high16 v8, -0x1000000
    or-int/2addr v7, v8
    const/4 v0, 0x2
    new-array v4, v0, [I
    const/4 v0, 0x0
    aput v7, v4, v0
    const/4 v0, 0x1
    sget v7, Lcom/melodix/music/MelColors;->background:I
    aput v7, v4, v0
    new-instance v1, Landroid/graphics/drawable/GradientDrawable;
    sget-object v2, Landroid/graphics/drawable/GradientDrawable$Orientation;->TOP_BOTTOM:Landroid/graphics/drawable/GradientDrawable$Orientation;
    invoke-direct {v1, v2, v4}, Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable$Orientation;[I)V
    invoke-virtual {p0}, Landroid/view/View;->getRootView()Landroid/view/View;
    move-result-object v0
    const v2, 0x7f09023a
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
    if-eqz v0, :done
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V
    :try_end
    .catch Ljava/lang/Throwable; {:try_start .. :try_end} :catch_error
    return-void
    :catch_error
    move-exception v0
    :fallback
    invoke-static {p0}, Lcom/melodix/music/NativePlayerTint;->reset(Landroid/widget/ImageView;)V
    :done
    return-void
.end method

.method public static reset(Landroid/widget/ImageView;)V
    .locals 3
    if-eqz p0, :reset_done
    :reset_try
    invoke-virtual {p0}, Landroid/view/View;->getId()I
    move-result v0
    const v1, 0x7f090245
    if-ne v0, v1, :reset_done
    invoke-virtual {p0}, Landroid/view/View;->getRootView()Landroid/view/View;
    move-result-object v0
    const v1, 0x7f09023a
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
    if-eqz v0, :reset_done
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;
    move-result-object v1
    const-string v2, "native_player_background"
    invoke-static {v1, v0, v2}, Lcom/melodix/music/NativeUiRowFactory;->applyDrawableBackground(Landroid/content/Context;Landroid/view/View;Ljava/lang/String;)V
    :reset_end
    .catch Ljava/lang/Throwable; {:reset_try .. :reset_end} :reset_catch
    :reset_done
    return-void
    :reset_catch
    move-exception v0
    return-void
.end method
