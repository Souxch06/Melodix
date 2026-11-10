.class public final Lcom/melodix/music/NativeImageLoader;
.super Ljava/lang/Object;

.method public static load(Landroid/widget/ImageView;Ljava/lang/String;I)V
    .locals 6

    invoke-static {p1, p2}, Lcom/melodix/music/NativeImageTrace;->start(Ljava/lang/String;I)V
    if-eqz p0, :image_load_done

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J
    move-result-wide v3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;
    move-result-object v5
    invoke-static {v5}, Lcom/melodix/music/NativeArtworkPlaceholder;->get(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;
    move-result-object v5
    :try_start_image_load
    invoke-static {}, Lcom/squareup/picasso/Picasso;->get()Lcom/squareup/picasso/Picasso;
    move-result-object v0
    invoke-virtual {v0, p0}, Lcom/squareup/picasso/Picasso;->cancelRequest(Landroid/widget/ImageView;)V
    # Until this request succeeds, never retain the previous track's tint.
    invoke-static {p0}, Lcom/melodix/music/NativePlayerTint;->reset(Landroid/widget/ImageView;)V

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
    invoke-virtual {v1, v5}, Lcom/squareup/picasso/RequestCreator;->placeholder(Landroid/graphics/drawable/Drawable;)Lcom/squareup/picasso/RequestCreator;
    invoke-virtual {v1, v5}, Lcom/squareup/picasso/RequestCreator;->error(Landroid/graphics/drawable/Drawable;)Lcom/squareup/picasso/RequestCreator;
    # Picasso already owns an LRU memory cache, OkHttp disk cache and its 200ms fade.
    # Timing: the first cover that actually reaches an ImageView ends the
    # "empty grey squares" period. The listener reports once per process.
    new-instance v2, Lcom/melodix/music/NativeImageLoader$FirstImageMark;
    invoke-direct {v2}, Lcom/melodix/music/NativeImageLoader$FirstImageMark;-><init>()V
    invoke-virtual {v2, p0, p1}, Lcom/melodix/music/NativeImageLoader$FirstImageMark;->bind(Landroid/widget/ImageView;Ljava/lang/String;)V
    # receiver + ImageView (p0) + callback: three registers, not two.
    invoke-virtual {v1, p0, v2}, Lcom/squareup/picasso/RequestCreator;->into(Landroid/widget/ImageView;Lcom/squareup/picasso/Callback;)V
    goto :image_load_end

    :clear_native_image
    invoke-static {p1}, Lcom/melodix/music/NativeImageTrace;->identity(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    const-string v2, "skipped"
    invoke-static {v1, v2, v3, v4}, Lcom/melodix/music/NativeImageTrace;->result(Ljava/lang/String;Ljava/lang/String;J)V
    invoke-virtual {p0, v5}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V
    invoke-static {p0}, Lcom/melodix/music/NativePlayerTint;->reset(Landroid/widget/ImageView;)V

    :image_load_end
    :try_end_image_load
    .catch Ljava/lang/RuntimeException; {:try_start_image_load .. :try_end_image_load} :image_load_error
    goto :image_load_done

    :image_load_error
    move-exception v0
    invoke-virtual {p0, v5}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V
    invoke-static {p0}, Lcom/melodix/music/NativePlayerTint;->reset(Landroid/widget/ImageView;)V

    :image_load_done
    return-void
.end method

# Warm the same resized cache keys used by into(), bounded to 12 distinct URLs.
.method public static prefetch(Landroid/content/Context;Lorg/json/JSONArray;)V
    .locals 8
    :prefetch_try
    invoke-static {p0}, Lcom/melodix/music/NativeUiMetrics;->shelfArtHeight(Landroid/content/Context;)I
    move-result v0
    invoke-static {}, Lcom/squareup/picasso/Picasso;->get()Lcom/squareup/picasso/Picasso;
    move-result-object v1
    new-instance v2, Ljava/util/HashSet;
    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V
    const/4 v3, 0x0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I
    move-result v4
    :prefetch_loop
    if-ge v3, v4, :prefetch_done
    invoke-virtual {v2}, Ljava/util/HashSet;->size()I
    move-result v5
    const/16 v6, 0xc
    if-ge v5, v6, :prefetch_done
    invoke-virtual {p1, v3}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;
    move-result-object v5
    if-eqz v5, :prefetch_next
    const-string v6, "image"
    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v5
    invoke-static {v5}, Lcom/melodix/music/NativeImageTrace;->form(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v6
    const-string v7, "https"
    invoke-virtual {v7, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v6
    if-eqz v6, :prefetch_next
    invoke-virtual {v2, v5}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
    move-result v6
    if-eqz v6, :prefetch_next
    invoke-static {v5, v0}, Lcom/melodix/music/NativeImageTrace;->start(Ljava/lang/String;I)V
    invoke-virtual {v1, v5}, Lcom/squareup/picasso/Picasso;->load(Ljava/lang/String;)Lcom/squareup/picasso/RequestCreator;
    move-result-object v5
    invoke-virtual {v5, v0, v0}, Lcom/squareup/picasso/RequestCreator;->resize(II)Lcom/squareup/picasso/RequestCreator;
    invoke-virtual {v5}, Lcom/squareup/picasso/RequestCreator;->centerCrop()Lcom/squareup/picasso/RequestCreator;
    invoke-virtual {v5}, Lcom/squareup/picasso/RequestCreator;->fetch()V
    :prefetch_next
    add-int/lit8 v3, v3, 0x1
    goto :prefetch_loop
    :prefetch_end
    .catch Ljava/lang/RuntimeException; {:prefetch_try .. :prefetch_end} :prefetch_error
    :prefetch_error
    move-exception v0
    :prefetch_done
    return-void
.end method
