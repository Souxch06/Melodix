.class public final Lcom/melodix/music/NativeHomeFallback$Callback;
.super Ljava/lang/Object;
.implements Landroid/webkit/ValueCallback;

# The callback logs only bounded status, route flags and counts. It never copies
# card titles, resource URIs, image URLs or account/session data to diagnostics.

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public final onReceiveValue(Ljava/lang/Object;)V
    .locals 12

    check-cast p1, Ljava/lang/String;
    if-eqz p1, :result_null

    :try_start_0
    new-instance v0, Lorg/json/JSONObject;
    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v1, "mode"
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1

    const-string v2, "rows"
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;
    move-result-object v2
    const/4 v3, 0x0
    if-eqz v2, :rows_count_done
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I
    move-result v3
    :rows_count_done

    const-string v4, "bridge"
    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v4

    const-string v5, "root"
    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V
    const-string v7, "native-home-fallback mode="
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v7, " rows="
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v7, " bridge="
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v7, " root="
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, "anchors"
    const/4 v8, 0x0
    invoke-virtual {v0, v7, v8}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I
    move-result v8
    const-string v7, " anchors="
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v7, "validLinks"
    const/4 v8, 0x0
    invoke-virtual {v0, v7, v8}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I
    move-result v8
    const-string v7, " links="
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v7, "mainView"
    const/4 v8, 0x0
    invoke-virtual {v0, v7, v8}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z
    move-result v8
    const-string v7, " main="
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v7, "shellCompleted"
    const/4 v8, 0x0
    invoke-virtual {v0, v7, v8}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z
    move-result v8
    const-string v7, " shell="
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v7, "hostOK"
    const/4 v8, 0x0
    invoke-virtual {v0, v7, v8}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z
    move-result v7
    const-string v8, "homeRoute"
    const/4 v9, 0x0
    invoke-virtual {v0, v8, v9}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z
    move-result v8
    const-string v9, "nativeDataSent"
    const/4 v10, 0x0
    invoke-virtual {v0, v9, v10}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z
    move-result v9
    const-string v10, "shellRows"
    const/4 v11, 0x0
    invoke-virtual {v0, v10, v11}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I
    move-result v10

    const-string v11, " host="
    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;
    const-string v11, " home="
    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;
    const-string v11, " sent="
    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;
    const-string v11, " shellRows="
    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v6
    invoke-static {v6}, Lcom/melodix/music/NativeCrashGuard;->diagLine(Ljava/lang/String;)V
    invoke-static {v6}, Lcom/melodix/music/StartupDiagnosticOverlay;->appendDiagnosticLine(Ljava/lang/String;)V

    # Dispatch only verified Home rows on Spotify's Home route. JS saying that
    # it sent rows is not proof they reached the native view: only the renderer's
    # attached-card readiness gate can suppress this retry.
    if-eqz v7, :skip_not_host
    if-eqz v8, :skip_not_home
    if-lez v3, :skip_no_rows

    goto :fallback_dispatch

    :skip_not_host
    const-string v11, "native-home-fallback dispatch=skipped reason=host"
    goto :report_skipped

    :skip_not_home
    const-string v11, "native-home-fallback dispatch=skipped reason=route"
    goto :report_skipped

    :skip_no_rows
    const-string v11, "native-home-fallback dispatch=skipped reason=no-real-rows"

    :report_skipped
    invoke-static {v11}, Lcom/melodix/music/NativeCrashGuard;->diagLine(Ljava/lang/String;)V
    invoke-static {v11}, Lcom/melodix/music/StartupDiagnosticOverlay;->appendDiagnosticLine(Ljava/lang/String;)V
    goto :callback_done

    :fallback_dispatch
    sget-object v7, Lcom/melodix/music/AppSingleton;->t:Ljava/lang/ref/WeakReference;
    if-eqz v7, :skip_activity
    invoke-virtual {v7}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;
    move-result-object v7
    check-cast v7, Lcom/melodix/music/MainActivity;
    if-eqz v7, :skip_activity
    invoke-virtual {v7}, Landroid/app/Activity;->isFinishing()Z
    move-result v8
    if-nez v8, :skip_activity
    invoke-virtual {v7}, Lcom/melodix/music/MainActivity;->hasNativeHomeContent()Z
    move-result v8
    if-nez v8, :skip_native_ready

    new-instance v10, Ljava/lang/StringBuilder;
    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V
    const-string v11, "native-home-fallback dispatch=queued rows="
    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v11, " rendered=pending"
    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v10
    invoke-static {v10}, Lcom/melodix/music/NativeCrashGuard;->diagLine(Ljava/lang/String;)V
    invoke-static {v10}, Lcom/melodix/music/StartupDiagnosticOverlay;->appendDiagnosticLine(Ljava/lang/String;)V
    const-string v10, "native-home-fallback-data-queued"
    invoke-static {v10}, Lcom/melodix/music/NativeCrashGuard;->stage(Ljava/lang/String;)V

    invoke-virtual {v2}, Lorg/json/JSONArray;->toString()Ljava/lang/String;
    move-result-object v9
    invoke-virtual {v7, v9}, Lcom/melodix/music/MainActivity;->postNativeHomeFallbackData(Ljava/lang/String;)V
    goto :callback_done

    :skip_native_ready
    const-string v11, "native-home-fallback dispatch=skipped reason=native-home-rendered"
    invoke-static {v11}, Lcom/melodix/music/NativeCrashGuard;->diagLine(Ljava/lang/String;)V
    invoke-static {v11}, Lcom/melodix/music/StartupDiagnosticOverlay;->appendDiagnosticLine(Ljava/lang/String;)V
    goto :callback_done

    :skip_activity
    const-string v11, "native-home-fallback dispatch=skipped reason=no-activity"
    invoke-static {v11}, Lcom/melodix/music/NativeCrashGuard;->diagLine(Ljava/lang/String;)V
    invoke-static {v11}, Lcom/melodix/music/StartupDiagnosticOverlay;->appendDiagnosticLine(Ljava/lang/String;)V

    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :callback_done
    return-void

    :result_null
    const-string v0, "native-home-fallback result=null"
    invoke-static {v0}, Lcom/melodix/music/NativeCrashGuard;->diagLine(Ljava/lang/String;)V
    invoke-static {v0}, Lcom/melodix/music/StartupDiagnosticOverlay;->appendDiagnosticLine(Ljava/lang/String;)V
    return-void

    :catch_0
    move-exception v0
    const-string v1, "native-home-fallback result=invalid"
    invoke-static {v1}, Lcom/melodix/music/NativeCrashGuard;->diagLine(Ljava/lang/String;)V
    invoke-static {v1}, Lcom/melodix/music/StartupDiagnosticOverlay;->appendDiagnosticLine(Ljava/lang/String;)V
    return-void
.end method
