.class public final Lcom/melodix/music/NativeHomeFeed;
.super Ljava/lang/Object;

# Paints home/search/library rows from a JSON array. Returns the number of
# content cards added. An empty or invalid payload returns 0 and does not
# touch the container, so a valid home is never replaced by "Chargement…".

.method public static paint(Lcom/melodix/music/MainActivity;Landroid/view/ViewGroup;Ljava/lang/String;)I
    .locals 12

    const/4 v0, 0x0
    if-eqz p0, :done
    if-eqz p1, :done
    if-eqz p2, :done
    invoke-virtual {p2}, Ljava/lang/String;->length()I
    move-result v1
    const/4 v2, 0x2
    if-le v1, v2, :done

    :try_start_0
    new-instance v1, Lorg/json/JSONArray;
    invoke-direct {v1, p2}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I
    move-result v2
    if-lez v2, :done

    invoke-virtual {p1}, Landroid/view/ViewGroup;->removeAllViews()V

    const-string v3, ""
    const/4 v4, 0x0
    const/4 v5, 0x0

    :loop
    if-ge v4, v2, :finish
    invoke-virtual {v1, v4}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;
    move-result-object v6
    if-eqz v6, :next

    const-string v7, "title"
    const-string v8, ""
    invoke-virtual {v6, v7, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v7
    const-string v9, "uri"
    invoke-virtual {v6, v9, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v9
    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z
    move-result v10
    if-eqz v10, :has_row
    invoke-virtual {v9}, Ljava/lang/String;->isEmpty()Z
    move-result v10
    if-eqz v10, :next

    :has_row
    const-string v10, "section"
    invoke-virtual {v6, v10, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v10
    invoke-virtual {v10}, Ljava/lang/String;->isEmpty()Z
    move-result v11
    if-eqz v11, :card
    invoke-virtual {v10, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v11
    if-eqz v11, :card
    move-object v3, v10
    invoke-static {p0, v10}, Lcom/melodix/music/NativeUiRowFactory;->createSectionHeader(Lcom/melodix/music/MainActivity;Ljava/lang/String;)Landroid/widget/TextView;
    move-result-object v11
    if-eqz v11, :card
    invoke-virtual {p1, v11}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    :card
    const-string v10, "settingValue"
    invoke-virtual {v6, v10, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v10
    invoke-virtual {v10}, Ljava/lang/String;->isEmpty()Z
    move-result v11
    if-eqz v11, :content_row
    invoke-static {p0, v6}, Lcom/melodix/music/NativeSettingsRowFactory;->create(Lcom/melodix/music/MainActivity;Lorg/json/JSONObject;)Landroid/widget/LinearLayout;
    move-result-object v11
    goto :add_row

    :content_row
    invoke-static {p0, v6}, Lcom/melodix/music/NativeUiRowFactory;->create(Lcom/melodix/music/MainActivity;Lorg/json/JSONObject;)Landroid/widget/LinearLayout;
    move-result-object v11

    :add_row
    if-eqz v11, :next
    invoke-virtual {p1, v11}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V
    add-int/lit8 v5, v5, 0x1

    :next
    add-int/lit8 v4, v4, 0x1
    goto :loop

    :finish
    move v0, v5
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :done
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :done

    :done
    return v0
.end method
