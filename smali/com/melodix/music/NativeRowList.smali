.class public final Lcom/melodix/music/NativeRowList;
.super Ljava/lang/Object;

# Turns a JSON array (or a blob that still contains "title":"...") into
# visible TextViews. Keep this out of MainActivity so a parse failure
# cannot wipe the home list and leave it blank.

.method public static fill(Landroid/content/Context;Landroid/view/ViewGroup;Ljava/lang/String;)V
    .locals 12

    if-eqz p1, :done

    if-eqz p2, :empty
    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object p2
    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z
    move-result v0
    if-nez v0, :empty

    :try_start_0
    new-instance v0, Lorg/json/JSONTokener;
    invoke-direct {v0, p2}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V
    invoke-virtual {v0}, Lorg/json/JSONTokener;->nextValue()Ljava/lang/Object;
    move-result-object v0

    instance-of v1, v0, Lorg/json/JSONArray;
    if-eqz v1, :try_object
    check-cast v0, Lorg/json/JSONArray;
    goto :have_array

    :try_object
    instance-of v1, v0, Lorg/json/JSONObject;
    if-eqz v1, :scan
    check-cast v0, Lorg/json/JSONObject;
    const-string v1, "items"
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;
    move-result-object v1
    if-eqz v1, :try_rows
    move-object v0, v1
    goto :have_array
    :try_rows
    const-string v1, "rows"
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;
    move-result-object v1
    if-eqz v1, :scan
    move-object v0, v1

    :have_array
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I
    move-result v1
    if-lez v1, :empty

    invoke-virtual {p1}, Landroid/view/ViewGroup;->removeAllViews()V

    const-string v8, ""
    const/4 v2, 0x0
    :loop
    if-ge v2, v1, :after_array
    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;
    move-result-object v3
    if-eqz v3, :as_string

    const-string v4, "section"
    const-string v5, ""
    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v6
    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z
    move-result v4
    if-nez v4, :plain
    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v4
    if-nez v4, :plain
    move-object v8, v6
    const v4, -0x4a3f48
    invoke-static {p0, p1, v6, v4}, Lcom/melodix/music/NativeRowList;->addLine(Landroid/content/Context;Landroid/view/ViewGroup;Ljava/lang/String;I)V

    :plain
    const-string v4, "title"
    const-string v5, ""
    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v7
    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z
    move-result v4
    if-eqz v4, :got_title
    const-string v4, "name"
    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v7
    :got_title
    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z
    move-result v4
    if-eqz v4, :title_ok
    move-object v7, v6
    :title_ok
    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z
    move-result v4
    if-nez v4, :next
    const/4 v4, -0x1
    invoke-static {p0, p1, v7, v4}, Lcom/melodix/music/NativeRowList;->addLine(Landroid/content/Context;Landroid/view/ViewGroup;Ljava/lang/String;I)V
    goto :next

    :as_string
    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->optString(I)Ljava/lang/String;
    move-result-object v7
    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z
    move-result v4
    if-nez v4, :next
    const/4 v4, -0x1
    invoke-static {p0, p1, v7, v4}, Lcom/melodix/music/NativeRowList;->addLine(Landroid/content/Context;Landroid/view/ViewGroup;Ljava/lang/String;I)V

    :next
    add-int/lit8 v2, v2, 0x1
    goto :loop

    :after_array
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I
    move-result v0
    if-lez v0, :done
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_ex

    :catch_ex
    :scan
    const-string v0, "\"title\":\""
    const/4 v1, 0x0
    const/4 v9, 0x0
    :scan_loop
    invoke-virtual {p2, v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I
    move-result v2
    const/4 v3, -0x1
    if-eq v2, v3, :scan_done
    add-int/lit8 v2, v2, 0x9
    const-string v4, "\""
    invoke-virtual {p2, v4, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I
    move-result v5
    if-eq v5, v3, :scan_done
    invoke-virtual {p2, v2, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v6
    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z
    move-result v7
    if-nez v7, :scan_advance
    if-eqz v9, :scan_clear
    invoke-virtual {p1}, Landroid/view/ViewGroup;->removeAllViews()V
    const/4 v9, 0x1
    :scan_clear
    const/4 v7, -0x1
    invoke-static {p0, p1, v6, v7}, Lcom/melodix/music/NativeRowList;->addLine(Landroid/content/Context;Landroid/view/ViewGroup;Ljava/lang/String;I)V
    :scan_advance
    add-int/lit8 v1, v5, 0x1
    goto :scan_loop

    :scan_done
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I
    move-result v0
    if-lez v0, :done

    :empty
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I
    move-result v0
    if-lez v0, :done
    invoke-virtual {p1}, Landroid/view/ViewGroup;->removeAllViews()V
    const-string v0, "Chargement de votre accueil…"
    const v1, -0x4c4c4d
    invoke-static {p0, p1, v0, v1}, Lcom/melodix/music/NativeRowList;->addLine(Landroid/content/Context;Landroid/view/ViewGroup;Ljava/lang/String;I)V

    :done
    return-void
.end method

.method private static addLine(Landroid/content/Context;Landroid/view/ViewGroup;Ljava/lang/String;I)V
    .locals 3

    new-instance v0, Landroid/widget/TextView;
    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    const/high16 v1, 0x41800000
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V
    invoke-virtual {v0, p3}, Landroid/widget/TextView;->setTextColor(I)V
    const/16 v1, 0x10
    invoke-virtual {v0, v1, v1, v1, v1}, Landroid/view/View;->setPadding(IIII)V
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v2, -0x1
    const/4 p0, -0x2
    invoke-direct {v1, v2, p0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual {p1, v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    return-void
.end method
