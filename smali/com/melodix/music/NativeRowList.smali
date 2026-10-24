.class public final Lcom/melodix/music/NativeRowList;
.super Ljava/lang/Object;

# JSONArray/JSONObject already ship in the APK. They decode escaped quotes,
# backslashes and unicode. Do not scan raw quotes here.

.method public static titlesFromJson(Ljava/lang/String;)Ljava/lang/String;
    .locals 8

    if-eqz p0, :empty

    :try_start_0
    new-instance v0, Lorg/json/JSONArray;
    invoke-direct {v0, p0}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I
    move-result v1
    if-lez v1, :empty

    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V
    const/4 v3, 0x0

    :loop
    if-ge v3, v1, :done_loop
    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;
    move-result-object v4
    if-eqz v4, :next
    const-string v5, "title"
    const-string v6, ""
    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v5
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z
    move-result v6
    if-nez v6, :next
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->length()I
    move-result v6
    if-eqz v6, :append
    const/16 v6, 0xa
    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    :append
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :next
    add-int/lit8 v3, v3, 0x1
    goto :loop

    :done_loop
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->length()I
    move-result v1
    if-eqz v1, :empty
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    :empty
    const/4 v0, 0x0
    return-object v0
.end method

.method public static countRows(Ljava/lang/String;)I
    .locals 5

    const/4 v0, 0x0
    if-eqz p0, :done

    :try_start_0
    new-instance v1, Lorg/json/JSONArray;
    invoke-direct {v1, p0}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I
    move-result v2
    const/4 v3, 0x0

    :loop
    if-ge v3, v2, :done
    invoke-virtual {v1, v3}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;
    move-result-object v4
    if-eqz v4, :next
    add-int/lit8 v0, v0, 0x1
    :next
    add-int/lit8 v3, v3, 0x1
    goto :loop
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    :done
    return v0

    :catch_0
    move-exception v1
    return v0
.end method
