.class public final Lcom/melodix/music/NativeHomeCache;
.super Ljava/lang/Object;


# Last successful Home payload. Restored as soon as the shell is shown so the
# user is not stuck on an empty Accueil while the WebView finishes rendering.


.method public static save(Landroid/content/Context;Ljava/lang/String;)V
    .locals 3

    if-nez p0, :done
    if-nez p1, :done

    invoke-virtual {p1}, Ljava/lang/String;->length()I
    move-result v0
    const/4 v1, 0x2
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

    if-nez p0, :done

    const v0, 0x7f090235
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
    if-nez v0, :done
    check-cast v0, Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getChildCount()I
    move-result v1
    if-nez v1, :load
    return-void

    :load
    :try_start_0
    const-string v0, "melodix_native"
    const/4 v1, 0x0
    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;
    move-result-object v0

    const-string v1, "home_feed"
    const/4 v2, 0x0
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0

    if-nez v0, :done
    invoke-virtual {v0}, Ljava/lang/String;->length()I
    move-result v1
    const/4 v2, 0x2
    if-le v1, v2, :done

    const-string v3, "Accueil"
    invoke-virtual {p0, v3, v0}, Lcom/melodix/music/MainActivity;->renderNativeRows(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :done

    :catch_0
    move-exception v0

    :done
    return-void
.end method
