.class public final Lcom/melodix/music/NativeGenreTileStyler;
.super Ljava/lang/Object;

# Presentation only. Mirrors styleNativeLibraryChips: the chosen browse tile gets
# the selected state, every other tile loses it. The accent ring lives in
# native_genre_foreground, so this never repaints the tile's own hue and never
# touches the search itself.

.method public static apply(Lcom/melodix/music/MainActivity;Ljava/lang/String;)V
    .locals 8

    :try_start_g
    const v0, 0x7f09024f
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
    if-eqz v0, :g_done
    check-cast v0, Landroid/view/ViewGroup;
    const/4 v1, 0x0
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v0
    if-eqz v0, :g_done
    instance-of v1, v0, Landroid/view/ViewGroup;
    if-eqz v1, :g_done
    move-object v2, v0
    check-cast v2, Landroid/view/ViewGroup;
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I
    move-result v3
    const/4 v4, 0x0

    :g_row
    if-ge v4, v3, :g_done
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v0
    instance-of v1, v0, Landroid/view/ViewGroup;
    if-eqz v1, :g_row_next
    check-cast v0, Landroid/view/ViewGroup;
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I
    move-result v5
    const/4 v6, 0x0

    :g_tile
    if-ge v6, v5, :g_row_next
    invoke-virtual {v0, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v1
    if-eqz v1, :g_tile_next
    invoke-virtual {v1}, Landroid/view/View;->getTag()Ljava/lang/Object;
    move-result-object v7
    if-eqz v7, :g_tile_next
    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;
    move-result-object v7
    if-eqz p1, :g_clear
    invoke-virtual {v7, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v7
    goto :g_set
    :g_clear
    const/4 v7, 0x0
    :g_set
    invoke-virtual {v1, v7}, Landroid/view/View;->setSelected(Z)V

    :g_tile_next
    add-int/lit8 v6, v6, 0x1
    goto :g_tile

    :g_row_next
    add-int/lit8 v4, v4, 0x1
    goto :g_row

    :g_done
    :try_end_g
    .catch Ljava/lang/Throwable; {:try_start_g .. :try_end_g} :g_catch
    return-void

    :g_catch
    move-exception v0
    invoke-virtual {v0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;
    move-result-object v0
    const-string v1, "MelGenre"
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    return-void
.end method