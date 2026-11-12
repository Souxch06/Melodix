.class public final Lcom/melodix/music/NativePrivateUiReset;
.super Ljava/lang/Object;

# UI-thread helper. Cancel Picasso targets recursively before removing rows,
# including covers owned by nested horizontal shelves. No disk/cache/cookie or
# preference deletion: this clears presentation, not the user's session store.
.method private static cancelImages(Landroid/view/View;)V
    .locals 4
    if-eqz p0, :done
    instance-of v0, p0, Landroid/widget/ImageView;
    if-eqz v0, :children
    :try_start_cancel
    invoke-static {}, Lcom/squareup/picasso/Picasso;->get()Lcom/squareup/picasso/Picasso;
    move-result-object v0
    move-object v1, p0
    check-cast v1, Landroid/widget/ImageView;
    invoke-virtual {v0, v1}, Lcom/squareup/picasso/Picasso;->cancelRequest(Landroid/widget/ImageView;)V
    :try_end_cancel
    .catch Ljava/lang/RuntimeException; {:try_start_cancel .. :try_end_cancel} :cancel_error
    goto :children
    :cancel_error
    move-exception v0
    :children
    instance-of v0, p0, Landroid/view/ViewGroup;
    if-eqz v0, :done
    check-cast p0, Landroid/view/ViewGroup;
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I
    move-result v1
    const/4 v2, 0x0
    :loop
    if-ge v2, v1, :done
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v3
    invoke-static {v3}, Lcom/melodix/music/NativePrivateUiReset;->cancelImages(Landroid/view/View;)V
    add-int/lit8 v2, v2, 0x1
    goto :loop
    :done
    return-void
.end method

.method private static text(Landroid/app/Activity;ILjava/lang/String;)V
    .locals 1
    invoke-virtual {p0, p1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
    instance-of p1, v0, Landroid/widget/TextView;
    if-eqz p1, :done
    check-cast v0, Landroid/widget/TextView;
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    :done
    return-void
.end method

.method private static image(Landroid/app/Activity;I)V
    .locals 2
    invoke-virtual {p0, p1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
    instance-of v1, v0, Landroid/widget/ImageView;
    if-eqz v1, :done
    check-cast v0, Landroid/widget/ImageView;
    const/4 v1, 0x0
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V
    invoke-static {v0}, Lcom/melodix/music/NativePlayerTint;->reset(Landroid/widget/ImageView;)V
    :done
    return-void
.end method

.method public static reset(Landroid/app/Activity;)V
    .locals 3
    if-eqz p0, :done
    const v0, 0x7f09022f    # nativeRoot
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
    invoke-static {v0}, Lcom/melodix/music/NativePrivateUiReset;->cancelImages(Landroid/view/View;)V
    const v0, 0x7f090235    # nativeContent
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
    instance-of v1, v0, Landroid/view/ViewGroup;
    if-eqz v1, :content_done
    check-cast v0, Landroid/view/ViewGroup;
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V
    :content_done
    const-string v2, ""
    const v0, 0x7f090233    # private search input; also cancels its pending watcher
    invoke-static {p0, v0, v2}, Lcom/melodix/music/NativePrivateUiReset;->text(Landroid/app/Activity;ILjava/lang/String;)V
    const v0, 0x7f090230
    const-string v1, "Accueil"
    invoke-static {p0, v0, v1}, Lcom/melodix/music/NativePrivateUiReset;->text(Landroid/app/Activity;ILjava/lang/String;)V
    const v0, 0x7f090236
    const-string v1, "Aucune lecture en cours"
    invoke-static {p0, v0, v1}, Lcom/melodix/music/NativePrivateUiReset;->text(Landroid/app/Activity;ILjava/lang/String;)V
    const v0, 0x7f09023b
    invoke-static {p0, v0, v1}, Lcom/melodix/music/NativePrivateUiReset;->text(Landroid/app/Activity;ILjava/lang/String;)V
    const v0, 0x7f090237
    invoke-static {p0, v0, v2}, Lcom/melodix/music/NativePrivateUiReset;->text(Landroid/app/Activity;ILjava/lang/String;)V
    const v0, 0x7f09023c
    invoke-static {p0, v0, v2}, Lcom/melodix/music/NativePrivateUiReset;->text(Landroid/app/Activity;ILjava/lang/String;)V
    const v0, 0x7f090249    # profile
    invoke-static {p0, v0}, Lcom/melodix/music/NativePrivateUiReset;->image(Landroid/app/Activity;I)V
    const v0, 0x7f090244    # mini artwork
    invoke-static {p0, v0}, Lcom/melodix/music/NativePrivateUiReset;->image(Landroid/app/Activity;I)V
    const v0, 0x7f090245    # player artwork
    invoke-static {p0, v0}, Lcom/melodix/music/NativePrivateUiReset;->image(Landroid/app/Activity;I)V
    const v0, 0x7f09024c    # mini player card
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
    if-eqz v0, :done
    const/16 v1, 0x8
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V
    :done
    return-void
.end method
