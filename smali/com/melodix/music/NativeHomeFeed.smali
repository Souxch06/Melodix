.class public final Lcom/melodix/music/NativeHomeFeed;
.super Ljava/lang/Object;

.field public static useGrid:Z

.method public static paint(Lcom/melodix/music/MainActivity;Landroid/view/ViewGroup;Ljava/lang/String;)I
    .locals 13

    const/4 v0, 0x0
    if-eqz p0, :done
    if-eqz p1, :done

    # Valid empty payloads (a JSON array such as "[]") still clear stale rows
    # (for example "Chargement des playlists…") so each tab shows only its own
    # state — see :try_empty. Unparseable payloads reach the catch handlers and
    # keep the previous content untouched instead of flashing a false empty.
    if-eqz p2, :done
    invoke-virtual {p2}, Ljava/lang/String;->length()I
    move-result v1
    const/4 v2, 0x1
    if-le v1, v2, :done

    :try_start_0
    new-instance v1, Lorg/json/JSONArray;
    invoke-direct {v1, p2}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I
    move-result v2
    invoke-static {v2}, Lcom/melodix/music/DiagCounters;->paintIn(I)V
    if-lez v2, :try_empty

    new-instance v12, Landroid/widget/LinearLayout;
    invoke-direct {v12, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
    const/4 v11, 0x1
    invoke-virtual {v12, v11}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const-string v3, ""
    const/4 v4, 0x0
    const/4 v5, 0x0

    :loop
    if-ge v4, v2, :commit
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

    # Bridge rows arrive as {id,name,image} (see parseLibrary/toIdNameImage and
    # AndBridge.onMediaItemsLoaded): apply the SAME fallbacks as
    # NativeUiRowFactory.create BEFORE the emptiness test so real playlists and
    # tracks are never dropped by the admission check.
    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z
    move-result v10
    if-eqz v10, :home_feed_title_ready
    const-string v10, "name"
    invoke-virtual {v6, v10, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v7
    :home_feed_title_ready
    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z
    move-result v10
    if-eqz v10, :home_feed_title_done
    const-string v10, "label"
    invoke-virtual {v6, v10, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v7
    :home_feed_title_done
    invoke-virtual {v9}, Ljava/lang/String;->isEmpty()Z
    move-result v10
    if-eqz v10, :home_feed_uri_ready
    const-string v10, "id"
    invoke-virtual {v6, v10, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v9
    :home_feed_uri_ready
    invoke-virtual {v9}, Ljava/lang/String;->isEmpty()Z
    move-result v10
    if-eqz v10, :home_feed_uri_done
    const-string v10, "href"
    invoke-virtual {v6, v10, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v9
    :home_feed_uri_done

    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z
    move-result v10
    if-eqz v10, :has_row
    invoke-virtual {v9}, Ljava/lang/String;->isEmpty()Z
    move-result v10
    if-nez v10, :next

    :has_row
    const-string v10, "section"
    invoke-virtual {v6, v10, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v10
    invoke-virtual {v10}, Ljava/lang/String;->isEmpty()Z
    move-result v11
    if-nez v11, :card
    invoke-virtual {v10, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v11
    if-nez v11, :card
    move-object v3, v10
    invoke-static {p0, v10}, Lcom/melodix/music/NativeUiRowFactory;->createSectionHeader(Lcom/melodix/music/MainActivity;Ljava/lang/String;)Landroid/widget/TextView;
    move-result-object v11
    if-eqz v11, :card
    invoke-virtual {v12, v11}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V
    const/4 v0, 0x0

    :card
    const-string v10, "settingValue"
    invoke-virtual {v6, v10, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v10
    invoke-virtual {v10}, Ljava/lang/String;->isEmpty()Z
    move-result v11
    if-nez v11, :content_row
    invoke-static {p0, v6}, Lcom/melodix/music/NativeSettingsRowFactory;->create(Lcom/melodix/music/MainActivity;Lorg/json/JSONObject;)Landroid/widget/LinearLayout;
    move-result-object v11
    goto :add_settings

    :content_row
    invoke-static {p0, v6}, Lcom/melodix/music/NativeUiRowFactory;->create(Lcom/melodix/music/MainActivity;Lorg/json/JSONObject;)Landroid/widget/LinearLayout;
    move-result-object v11
    goto :add_content

    :add_settings
    if-eqz v11, :next
    const/4 v0, 0x0
    invoke-virtual {v12, v11}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V
    add-int/lit8 v5, v5, 0x1
    goto :next

    :add_content
    if-eqz v11, :next
    sget-boolean v8, Lcom/melodix/music/NativeHomeFeed;->useGrid:Z
    if-eqz v8, :add_list
    if-eqz v0, :make_pair
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I
    move-result v10
    const/4 v8, 0x2
    if-ge v10, v8, :put_tile
    :make_pair
    new-instance v0, Landroid/widget/LinearLayout;
    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
    const/4 v8, 0x0
    invoke-virtual {v0, v8}, Landroid/widget/LinearLayout;->setOrientation(I)V
    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v10, -0x1
    const/4 v9, -0x2
    invoke-direct {v8, v10, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual {v12, v0, v8}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    :put_tile
    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v10, 0x0
    const/4 v9, -0x2
    invoke-direct {v8, v10, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    const/high16 v10, 0x3f800000
    iput v10, v8, Landroid/widget/LinearLayout$LayoutParams;->weight:F
    # Even gutters around each grid card so tiles never touch.
    const/4 v10, 0x4
    invoke-static {p0, v10}, Lcom/melodix/music/NativeUiRowFactory;->dp(Landroid/content/Context;I)I
    move-result v10
    iput v10, v8, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I
    iput v10, v8, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I
    const/4 v9, 0x6
    invoke-static {p0, v9}, Lcom/melodix/music/NativeUiRowFactory;->dp(Landroid/content/Context;I)I
    move-result v9
    iput v9, v8, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I
    invoke-virtual {v0, v11, v8}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    goto :counted

    :add_list
    const/4 v0, 0x0
    invoke-virtual {v12, v11}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    :counted
    add-int/lit8 v5, v5, 0x1

    :next
    add-int/lit8 v4, v4, 0x1
    goto :loop

    :commit
    if-lez v5, :try_empty
    invoke-virtual {p1, v12}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    :strip
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I
    move-result v2
    const/4 v4, 0x1
    if-le v2, v4, :finish
    const/4 v4, 0x0
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->removeViewAt(I)V
    goto :strip

    :finish
    move v0, v5
    goto :try_ok

    :try_empty
    # Valid, empty payload: drop every stale child (removeViewAt loop keeps the
    # same "attach then strip" contract) so the caller's empty state is alone.
    :clear_stale
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I
    move-result v1
    if-gtz v1, :stale_cleared
    const/4 v2, 0x0
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->removeViewAt(I)V
    goto :clear_stale
    :stale_cleared
    const/4 v0, 0x0

    :try_ok
    nop
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_json
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_all
    goto :done

    :catch_json
    move-exception v1
    const-string v2, "home-feed-json"
    invoke-static {v2}, Lcom/melodix/music/NativeCrashGuard;->stage(Ljava/lang/String;)V
    invoke-static {v1}, Lcom/melodix/music/NativeCrashGuard;->record(Ljava/lang/Throwable;)V
    const/4 v0, 0x0
    goto :done

    :catch_all
    move-exception v1
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    move-result-object v2
    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;
    move-result-object v2
    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V
    const-string v4, "home-feed:"
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v2
    invoke-static {v2}, Lcom/melodix/music/NativeCrashGuard;->stage(Ljava/lang/String;)V
    invoke-static {v1}, Lcom/melodix/music/NativeCrashGuard;->record(Ljava/lang/Throwable;)V
    const/4 v0, 0x0

    :done
    invoke-static {v0}, Lcom/melodix/music/DiagCounters;->paintAccepted(I)V
    return v0
.end method
