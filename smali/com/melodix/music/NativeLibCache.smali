.class public final Lcom/melodix/music/NativeLibCache;
.super Ljava/lang/Object;

# Persistent library cache next to the home feed (SharedPreferences
# "melodix_native"). The PAGE pushes the normalized library over the JS->native
# channel in bounded batches (AndBridge.onMediaLibBatch): a category's cache is
# written only when its batches are complete — an error NEVER empties it. At
# startup the native Library screen paints this cache first (marked
# "à jour il y a X"), then a fresh push replaces it. No secrets ever cross
# this boundary: only title/subtitle/uri/image/section of the account's own
# library items.

.field private static appContext:Landroid/content/Context;
.field private static frags:Ljava/util/HashMap;
.field private static counts:Ljava/util/HashMap;
.field private static epochs:Ljava/util/HashMap;

.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/util/HashMap;
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V
    sput-object v0, Lcom/melodix/music/NativeLibCache;->frags:Ljava/util/HashMap;

    new-instance v0, Ljava/util/HashMap;
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V
    sput-object v0, Lcom/melodix/music/NativeLibCache;->counts:Ljava/util/HashMap;

    new-instance v0, Ljava/util/HashMap;
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V
    sput-object v0, Lcom/melodix/music/NativeLibCache;->epochs:Ljava/util/HashMap;

    return-void
.end method

.method public static install(Landroid/content/Context;)V
    .locals 1

    if-eqz p0, :done

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;
    move-result-object v0
    if-nez v0, :store
    move-object v0, p0

    :store
    sput-object v0, Lcom/melodix/music/NativeLibCache;->appContext:Landroid/content/Context;

    :done
    return-void
.end method

.method private static catIndex(Ljava/lang/String;)I
    .locals 2

    if-eqz p0, :bad

    const-string v0, "playlists"
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :c1
    const/4 v0, 0x0
    return v0

    :c1
    const-string v0, "albums"
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :c2
    const/4 v0, 0x1
    return v0

    :c2
    const-string v0, "artists"
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :c3
    const/4 v0, 0x2
    return v0

    :c3
    const-string v0, "podcasts"
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :bad
    const/4 v0, 0x3
    return v0

    :bad
    const/4 v0, -0x1
    return v0
.end method

.method public static catSection(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    invoke-static {p0}, Lcom/melodix/music/NativeLibCache;->catIndex(Ljava/lang/String;)I
    move-result v0

    if-eqz v0, :s1
    const-string v1, "Vos playlists"
    return-object v1

    :s1
    const/4 v1, 0x1
    if-eq v0, v1, :s2
    const-string v1, "Vos albums"
    return-object v1

    :s2
    const/4 v1, 0x2
    if-eq v0, v1, :s3
    const-string v1, "Vos artistes"
    return-object v1

    :s3
    const/4 v1, 0x3
    if-eq v0, v1, :s4
    const-string v1, "Vos podcasts"
    return-object v1

    :s4
    const-string v1, "Votre bibliothèque"
    return-object v1
.end method

.method public static catEmptyTitle(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    invoke-static {p0}, Lcom/melodix/music/NativeLibCache;->catIndex(Ljava/lang/String;)I
    move-result v0

    if-eqz v0, :e1
    const-string v1, "Aucune playlist"
    return-object v1

    :e1
    const/4 v1, 0x1
    if-eq v0, v1, :e2
    const-string v1, "Aucun album"
    return-object v1

    :e2
    const/4 v1, 0x2
    if-eq v0, v1, :e3
    const-string v1, "Aucun artiste"
    return-object v1

    :e3
    const-string v1, "Aucun podcast"
    return-object v1
.end method

.method private static clip(Ljava/lang/String;I)Ljava/lang/String;
    .locals 1

    if-nez p0, :ok
    const-string v0, ""
    return-object v0

    :ok
    invoke-virtual {p0}, Ljava/lang/String;->length()I
    move-result v0
    if-le v0, p1, :keep
    const/4 v0, 0x0
    invoke-virtual {p0, v0, p1}, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v0
    return-object v0

    :keep
    return-object p0
.end method

.method public static validUri(Ljava/lang/String;)Z
    .locals 2

    if-eqz p0, :no

    const-string v0, "spotify:collection:tracks"
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :try_pattern
    :yes
    const/4 v0, 0x1
    return v0

    :try_pattern
    const-string v0, "spotify:(playlist|album|artist|show):[A-Za-z0-9]{22}"
    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :no
    goto :yes

    :no
    const/4 v0, 0x0
    return v0
.end method

.method public static declared-synchronized accept(Ljava/lang/String;)V
    .locals 8

    if-eqz p0, :done

    :try_start_a
    new-instance v0, Lorg/json/JSONObject;
    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v1, "cat"
    const-string v2, ""
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1

    invoke-static {v1}, Lcom/melodix/music/NativeLibCache;->catIndex(Ljava/lang/String;)I
    move-result v2
    if-gez v2, :done

    const-string v3, "epoch"
    const/4 v4, 0x0
    invoke-virtual {v0, v3, v4}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I
    move-result v3

    # A new push epoch replaces any partial buffer of the previous one.
    sget-object v4, Lcom/melodix/music/NativeLibCache;->epochs:Ljava/util/HashMap;
    invoke-virtual {v4, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Ljava/lang/Integer;
    if-eqz v4, :reset_buf
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I
    move-result v5
    if-eq v5, v3, :buf_ready

    :reset_buf
    sget-object v4, Lcom/melodix/music/NativeLibCache;->frags:Ljava/util/HashMap;
    new-instance v5, Ljava/lang/StringBuilder;
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual {v4, v1, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v4, Lcom/melodix/music/NativeLibCache;->counts:Ljava/util/HashMap;
    const/4 v5, 0x0
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v5
    invoke-virtual {v4, v1, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v4, Lcom/melodix/music/NativeLibCache;->epochs:Ljava/util/HashMap;
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v5
    invoke-virtual {v4, v1, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :buf_ready
    const-string v4, "items"
    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;
    move-result-object v4
    if-eqz v4, :items_done
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I
    move-result v5
    const/4 v6, 0x0

    :item_loop
    if-ge v6, v5, :items_done
    invoke-virtual {v4, v6}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;
    move-result-object v7
    if-eqz v7, :item_next
    invoke-static {v1, v7}, Lcom/melodix/music/NativeLibCache;->appendItem(Ljava/lang/String;Lorg/json/JSONObject;)V

    :item_next
    add-int/lit8 v6, v6, 0x1
    goto :item_loop

    :items_done
    const-string v4, "last"
    const/4 v5, 0x0
    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z
    move-result v4
    if-nez v4, :do_finish

    const-string v4, "i"
    const/4 v5, -0x1
    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I
    move-result v4
    const-string v5, "n"
    const/4 v6, 0x0
    invoke-virtual {v0, v5, v6}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I
    move-result v5
    const/4 v6, 0x1
    sub-int/2addr v5, v6
    if-eq v4, v5, :do_finish
    goto :done

    :do_finish
    invoke-static {v1, v2}, Lcom/melodix/music/NativeLibCache;->finish(Ljava/lang/String;I)V

    :done
    :try_end_a
    .catch Ljava/lang/Throwable; {:try_start_a .. :try_end_a} :catch_a

    return-void

    :catch_a
    move-exception v0
    return-void
.end method

.method private static declared-synchronized appendItem(Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 7

    if-eqz p0, :done
    if-eqz p1, :done

    sget-object v0, Lcom/melodix/music/NativeLibCache;->counts:Ljava/util/HashMap;
    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Ljava/lang/Integer;
    if-eqz v0, :done
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I
    move-result v0

    # Bounded store: 600 items per category max.
    const/16 v1, 0x258
    if-ge v0, v1, :done

    const-string v1, "uri"
    const-string v2, ""
    invoke-virtual {p1, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    invoke-static {v1}, Lcom/melodix/music/NativeLibCache;->validUri(Ljava/lang/String;)Z
    move-result v2
    if-eqz v2, :done

    const-string v2, "title"
    const-string v3, ""
    invoke-virtual {p1, v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
    const/16 v3, 0x78
    invoke-static {v2, v3}, Lcom/melodix/music/NativeLibCache;->clip(Ljava/lang/String;I)Ljava/lang/String;
    move-result-object v2

    const-string v3, "subtitle"
    const-string v4, ""
    invoke-virtual {p1, v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v3
    const/16 v4, 0x78
    invoke-static {v3, v4}, Lcom/melodix/music/NativeLibCache;->clip(Ljava/lang/String;I)Ljava/lang/String;
    move-result-object v3

    const-string v4, "image"
    const-string v5, ""
    invoke-virtual {p1, v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v4
    const/16 v5, 0x190
    invoke-static {v4, v5}, Lcom/melodix/music/NativeLibCache;->clip(Ljava/lang/String;I)Ljava/lang/String;
    move-result-object v4

    # Only https artwork is kept; anything else is dropped entirely.
    invoke-virtual {v4}, Ljava/lang/String;->length()I
    move-result v5
    if-eqz v5, :img_ready
    const-string v5, "https://"
    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v5
    if-nez v5, :img_ready
    const-string v4, ""

    :img_ready
    sget-object v5, Lcom/melodix/music/NativeLibCache;->frags:Ljava/util/HashMap;
    invoke-virtual {v5, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Ljava/lang/StringBuilder;
    if-eqz v5, :done

    if-eqz v0, :frag_first
    const-string v6, ","
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :frag_first
    const-string v6, "{\"title\":"
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-static {v2}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v6
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, ",\"subtitle\":"
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-static {v3}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v6
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, ",\"uri\":"
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-static {v1}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v6
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/String;->length()I
    move-result v6
    if-eqz v6, :img_skip
    const-string v6, ",\"image\":"
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-static {v4}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v6
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :img_skip
    const-string v6, ",\"section\":"
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-static {p0}, Lcom/melodix/music/NativeLibCache;->catSection(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v6
    invoke-static {v6}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v6
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "}"
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v0, v0, 0x1
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v5
    sget-object v6, Lcom/melodix/music/NativeLibCache;->counts:Ljava/util/HashMap;
    invoke-virtual {v6, p0, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :done
    return-void
.end method

.method private static declared-synchronized finish(Ljava/lang/String;I)V
    .locals 7

    if-eqz p0, :done

    sget-object v0, Lcom/melodix/music/NativeLibCache;->counts:Ljava/util/HashMap;
    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Ljava/lang/Integer;
    if-eqz v0, :done
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I
    move-result v0

    sget-object v1, Lcom/melodix/music/NativeLibCache;->frags:Ljava/util/HashMap;
    invoke-virtual {v1, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Ljava/lang/StringBuilder;

    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V
    const-string v3, "["
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz v0, :empty_row
    if-eqz v1, :rows_close
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v3
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :rows_close
    const-string v3, "]"
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    goto :rows_built

    # Confirmed-empty category (the page sent its terminal batch with no
    # items): say so honestly — never an error, never a blank screen.
    :empty_row
    const-string v3, "{\"title\":"
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-static {p0}, Lcom/melodix/music/NativeLibCache;->catEmptyTitle(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v3
    invoke-static {v3}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v3
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v3, ",\"subtitle\":\"Ce compte ne contient aucun élément de ce type\",\"section\":"
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-static {p0}, Lcom/melodix/music/NativeLibCache;->catSection(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v3
    invoke-static {v3}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v3
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v3, ",\"kind\":\"empty\"}]"
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :rows_built
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v2

    invoke-static {p0, v2}, Lcom/melodix/music/NativeLibCache;->save(Ljava/lang/String;Ljava/lang/String;)V

    # Reset the accumulator for the next push.
    sget-object v3, Lcom/melodix/music/NativeLibCache;->counts:Ljava/util/HashMap;
    const/4 v4, 0x0
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v4
    invoke-virtual {v3, p0, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    sget-object v3, Lcom/melodix/music/NativeLibCache;->frags:Ljava/util/HashMap;
    new-instance v4, Ljava/lang/StringBuilder;
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual {v3, p0, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    # Paint right away when the Library screen is showing this category.
    sget-object v3, Lcom/melodix/music/AppSingleton;->t:Ljava/lang/ref/WeakReference;
    if-eqz v3, :done
    invoke-virtual {v3}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Lcom/melodix/music/MainActivity;
    if-eqz v3, :done

    new-instance v4, Ljava/lang/StringBuilder;
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V
    const-string v5, "media:"
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v4

    invoke-virtual {v3, v4, v2}, Lcom/melodix/music/MainActivity;->postNativeUiData(Ljava/lang/String;Ljava/lang/String;)V

    :done
    return-void
.end method

.method public static save(Ljava/lang/String;Ljava/lang/String;)V
    .locals 5

    sget-object v0, Lcom/melodix/music/NativeLibCache;->appContext:Landroid/content/Context;
    if-eqz v0, :done
    if-eqz p0, :done

    :try_start_s
    const-string v1, "melodix_native"
    const/4 v2, 0x0
    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;
    move-result-object v0
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;
    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V
    const-string v2, "lib_cache_"
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V
    const-string v2, "lib_cache_at_"
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J
    move-result-wide v2
    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V
    :try_end_s
    .catch Ljava/lang/Throwable; {:try_start_s .. :try_end_s} :catch_s

    :done
    return-void

    :catch_s
    move-exception v0
    return-void
.end method

.method public static load(Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    const/4 v0, 0x0

    sget-object v1, Lcom/melodix/music/NativeLibCache;->appContext:Landroid/content/Context;
    if-eqz v1, :done
    if-eqz p0, :done

    :try_start_l
    const-string v2, "melodix_native"
    const/4 v3, 0x0
    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;
    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V
    const-string v3, "lib_cache_"
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v2

    const/4 v3, 0x0
    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    :try_end_l
    .catch Ljava/lang/Throwable; {:try_start_l .. :try_end_l} :catch_l

    goto :done

    :catch_l
    move-exception v1
    const/4 v0, 0x0

    :done
    return-object v0
.end method

.method public static ageLabel(Ljava/lang/String;)Ljava/lang/String;
    .locals 7

    const-string v0, "\u00e0 l'instant"

    sget-object v1, Lcom/melodix/music/NativeLibCache;->appContext:Landroid/content/Context;
    if-eqz v1, :done
    if-eqz p0, :done

    :try_start_g
    const-string v2, "melodix_native"
    const/4 v3, 0x0
    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;
    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V
    const-string v3, "lib_cache_at_"
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v2

    const-wide/16 v3, 0x0
    invoke-interface {v1, v2, v3, v4}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J
    move-result-wide v1

    const-wide/16 v3, 0x0
    cmp-long v5, v1, v3
    if-eqz v5, :done

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J
    move-result-wide v3
    sub-long/2addr v3, v1

    const-wide/16 v1, 0x3e8
    div-long/2addr v3, v1

    const-wide/16 v1, 0x3c
    cmp-long v5, v3, v1
    if-ltz v5, :done

    div-long v5, v3, v1

    const-wide/16 v1, 0x3c
    cmp-long v3, v5, v1
    if-ltz v3, :by_min

    const-wide/16 v1, 0x3c
    div-long v3, v5, v1

    const-wide/16 v1, 0x18
    cmp-long v5, v3, v1
    if-ltz v5, :by_hour

    div-long v5, v3, v1

    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual {v0, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    const-string v1, " j"
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    goto :done

    :by_hour
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual {v0, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    const-string v1, " h"
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    goto :done

    :by_min
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual {v0, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    const-string v1, " min"
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    :try_end_g
    .catch Ljava/lang/Throwable; {:try_start_g .. :try_end_g} :catch_g

    goto :done

    :catch_g
    move-exception v1

    # v0 est tantot String tantot StringBuilder dans le try : le handler doit le
    # reinitialiser a une String, sinon la fusion a :done rend le return invalide
    # (VerifyError "returning register with conflict").
    const-string v0, "\u00e0 l'instant"

    :done
    return-object v0
.end method

.method public static composeStamped(Ljava/lang/String;)Ljava/lang/String;
    .locals 6

    const/4 v0, 0x0

    invoke-static {p0}, Lcom/melodix/music/NativeLibCache;->load(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    if-eqz v1, :done
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z
    move-result v2
    if-eqz v2, :have_rows
    goto :done

    :have_rows
    invoke-static {p0}, Lcom/melodix/music/NativeLibCache;->ageLabel(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V
    const-string v4, "[{\"title\":\"Bibliothèque en cache\",\"subtitle\":\"à jour il y a "
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v4, "\",\"section\":\"Votre bibliothèque\",\"kind\":\"cache\"},"
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v4, 0x1
    invoke-virtual {v1}, Ljava/lang/String;->length()I
    move-result v5
    invoke-virtual {v1, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v1
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0

    :done
    return-object v0
.end method
