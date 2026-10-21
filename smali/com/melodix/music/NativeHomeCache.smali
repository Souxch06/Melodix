.class public final Lcom/melodix/music/NativeHomeCache;
.super Ljava/lang/Object;


.method public static save(Landroid/content/Context;Ljava/lang/String;)V
    .locals 3

    if-eqz p0, :done
    if-eqz p1, :done

    invoke-virtual {p1}, Ljava/lang/String;->length()I
    move-result v0
    const/16 v1, 0x8
    if-le v0, v1, :done

    :try_start_0
    const-string v0, "melodix_native"
    const/4 v1, 0x0
    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;
    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;
    move-result-object v0

    const-string v1, "home_feed"
    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :done

    :catch_0
    move-exception v0

    :done
    return-void
.end method


.method public static restore(Lcom/melodix/music/MainActivity;)V
    .locals 4

    if-eqz p0, :done

    const/4 v0, 0x0

    :try_start_load
    const-string v1, "melodix_native"
    const/4 v2, 0x0
    invoke-virtual {p0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;
    move-result-object v1

    const-string v2, "home_feed"
    const/4 v3, 0x0
    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    :try_end_load
    .catch Ljava/lang/Throwable; {:try_start_load .. :try_end_load} :catch_load

    goto :have

    :catch_load
    move-exception v1

    :have
    if-eqz v0, :seed
    invoke-virtual {v0}, Ljava/lang/String;->length()I
    move-result v1
    const/16 v2, 0x8
    if-le v1, v2, :seed
    goto :paint

    :seed
    const-string v0, "[{\"title\":\"Titres likes\",\"subtitle\":\"Playlist\",\"section\":\"Vos playlists\",\"image\":\"https://misc.scdn.co/liked-songs/liked-songs-640.png\",\"uri\":\"spotify:collection:tracks\"},{\"title\":\"Ecoutes recentes\",\"subtitle\":\"Activite\",\"section\":\"Vos playlists\",\"image\":\"\",\"uri\":\"spotify:collection:tracks\"},{\"title\":\"Radios\",\"subtitle\":\"Pour toi\",\"section\":\"Radios\",\"image\":\"\",\"uri\":\"spotify:collection:tracks\"}]"

    :paint
    :try_start_paint
    const-string v1, "Accueil"
    invoke-virtual {p0, v1, v0}, Lcom/melodix/music/MainActivity;->renderNativeRows(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_paint
    .catch Ljava/lang/Throwable; {:try_start_paint .. :try_end_paint} :catch_paint

    goto :done

    :catch_paint
    move-exception v0
    invoke-static {p0}, Lcom/melodix/music/NativeHomePaint;->seed(Lcom/melodix/music/MainActivity;)V

    :done
    return-void
.end method
