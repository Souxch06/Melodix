.class public final Lcom/melodix/music/NativeSessionBuildInfo;
.super Ljava/lang/Object;

# Only locally installed package metadata, never session state or page data.
.method public static append(Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;
    .locals 6
    if-eqz p0, :missing_input
    if-eqz p1, :missing_input
    :try_start
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;
    move-result-object v0
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;
    move-result-object v1
    const/4 v2, 0x0
    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    move-result-object v0
    iget-object v1, v0, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;
    if-eqz v1, :unknown_name
    const-string v2, "^[A-Za-z0-9._-]{1,48}$"
    invoke-virtual {v1, v2}, Ljava/lang/String;->matches(Ljava/lang/String;)Z
    move-result v2
    if-nez v2, :name_ok
    :unknown_name
    const-string v1, "inconnu"
    :name_ok
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I
    const/16 v3, 0x1c
    if-lt v2, v3, :legacy
    invoke-virtual {v0}, Landroid/content/pm/PackageInfo;->getLongVersionCode()J
    move-result-wide v2
    goto :build
    :legacy
    iget v2, v0, Landroid/content/pm/PackageInfo;->versionCode:I
    int-to-long v2, v2
    :build
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v4, "\nVersionCode="
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    const-string v4, " · build="
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    return-object v0
    :try_end
    .catch Ljava/lang/Exception; {:try_start .. :try_end} :missing
    :missing
    move-exception v0
    :missing_input
    if-nez p0, :return_input
    const-string p0, ""
    :return_input
    return-object p0
.end method
