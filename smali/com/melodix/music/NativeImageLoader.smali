.class public final Lcom/melodix/music/NativeImageLoader;
.super Ljava/lang/Object;

.method public static load(Landroid/widget/ImageView;Ljava/lang/String;I)V
    .locals 3

    if-eqz p0, :image_load_done

    :try_start_image_load
    invoke-static {}, Lcom/squareup/picasso/Picasso;->get()Lcom/squareup/picasso/Picasso;
    move-result-object v0
    invoke-virtual {v0, p0}, Lcom/squareup/picasso/Picasso;->cancelRequest(Landroid/widget/ImageView;)V

    if-eqz p1, :clear_native_image
    const-string v1, "https://"
    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :clear_native_image
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z
    move-result v1
    if-nez v1, :clear_native_image

    invoke-virtual {v0, p1}, Lcom/squareup/picasso/Picasso;->load(Ljava/lang/String;)Lcom/squareup/picasso/RequestCreator;
    move-result-object v1
    invoke-virtual {v1, p2, p2}, Lcom/squareup/picasso/RequestCreator;->resize(II)Lcom/squareup/picasso/RequestCreator;
    move-result-object v1
    invoke-virtual {v1}, Lcom/squareup/picasso/RequestCreator;->centerCrop()Lcom/squareup/picasso/RequestCreator;
    move-result-object v1
    invoke-virtual {v1, p0}, Lcom/squareup/picasso/RequestCreator;->into(Landroid/widget/ImageView;)V
    const/4 v1, 0x0
    invoke-virtual {p0, v1}, Landroid/view/View;->setClickable(Z)V
    invoke-virtual {p0, v1}, Landroid/view/View;->setFocusable(Z)V
    goto :image_load_end

    :clear_native_image
    const/4 v1, 0x0
    invoke-virtual {p0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    :image_load_end
    :try_end_image_load
    .catch Ljava/lang/RuntimeException; {:try_start_image_load .. :try_end_image_load} :image_load_error
    goto :image_load_done

    :image_load_error
    move-exception v0
    const/4 v1, 0x0
    invoke-virtual {p0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    :image_load_done
    return-void
.end method
