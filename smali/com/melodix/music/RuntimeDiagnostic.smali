.class public final Lcom/melodix/music/RuntimeDiagnostic;
.super Ljava/lang/Object;


.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static runIfPreview(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 4

    if-eqz p0, :return
    if-eqz p1, :return

    # The package guard keeps the diagnostic inert in the regular application.
    invoke-virtual {p0}, Landroid/webkit/WebView;->getContext()Landroid/content/Context;
    move-result-object v0
    if-eqz v0, :return
    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;
    move-result-object v1
    const-string v2, "com.melodix.music.preview"
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :return

    # Use the callback URL only to allowlist the exact HTTPS Spotify host.
    # The path/query is never returned, logged, displayed, or copied.
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;
    move-result-object v0
    invoke-virtual {v0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;
    move-result-object v1
    const-string v2, "https"
    invoke-virtual {v2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :return
    invoke-virtual {v0}, Landroid/net/Uri;->getHost()Ljava/lang/String;
    move-result-object v1
    const-string v2, "open.spotify.com"
    invoke-virtual {v2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :return
    invoke-virtual {v0}, Landroid/net/Uri;->getPort()I
    move-result v1
    const/4 v2, -0x1
    if-eq v1, v2, :origin_ok
    const/16 v2, 0x1bb
    if-eq v1, v2, :origin_ok
    goto :return

    :origin_ok
    sget-object v0, Lcom/melodix/music/AppSingleton;->t:Ljava/lang/ref/WeakReference;
    if-eqz v0, :return
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/melodix/music/MainActivity;
    if-eqz v0, :return
    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z
    move-result v1
    if-nez v1, :return

    const-string v1, "runtime_diagnostic.js"
    invoke-static {v1}, Lm9;->d(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    if-eqz v1, :return
    invoke-virtual {v1}, Ljava/lang/String;->length()I
    move-result v2
    if-lez v2, :return

    new-instance v2, Lcom/melodix/music/RuntimeDiagnostic$Callback;
    invoke-direct {v2, v0}, Lcom/melodix/music/RuntimeDiagnostic$Callback;-><init>(Landroid/app/Activity;)V
    invoke-virtual {p0, v1, v2}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    :return
    return-void
.end method

.method public static showResult(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 1

    if-eqz p0, :return
    if-eqz p1, :return
    new-instance v0, Lcom/melodix/music/RuntimeDiagnostic$ShowRunnable;
    invoke-direct {v0, p0, p1}, Lcom/melodix/music/RuntimeDiagnostic$ShowRunnable;-><init>(Landroid/app/Activity;Ljava/lang/String;)V
    invoke-virtual {p0, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    :return
    return-void
.end method

.method public static showDialog(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 6

    if-eqz p0, :return
    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z
    move-result v0
    if-nez v0, :return

    new-instance v0, Landroid/widget/ScrollView;
    invoke-direct {v0, p0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V
    const/4 v1, 0x1
    invoke-virtual {v0, v1}, Landroid/widget/ScrollView;->setFillViewport(Z)V

    new-instance v1, Landroid/widget/TextView;
    invoke-direct {v1, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    const/4 v2, 0x1
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextIsSelectable(Z)V
    const/high16 v2, 0x41400000    # 12.0f
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object v2
    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v2
    iget v2, v2, Landroid/util/DisplayMetrics;->density:F
    const/high16 v3, 0x41800000    # 16.0f
    mul-float/2addr v2, v3
    float-to-int v2, v2
    invoke-virtual {v1, v2, v2, v2, v2}, Landroid/widget/TextView;->setPadding(IIII)V
    invoke-virtual {v0, v1}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    new-instance v1, Landroid/app/AlertDialog$Builder;
    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V
    const-string v2, "Diagnostic runtime Melodix (Preview)"
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;
    move-result-object v1
    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;
    move-result-object v1

    new-instance v2, Lcom/melodix/music/RuntimeDiagnostic$CopyListener;
    invoke-direct {v2, p0, p1}, Lcom/melodix/music/RuntimeDiagnostic$CopyListener;-><init>(Landroid/app/Activity;Ljava/lang/String;)V
    const-string v3, "Copier"
    invoke-virtual {v1, v3, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;
    move-result-object v1
    const-string v3, "Fermer"
    const/4 v4, 0x0
    invoke-virtual {v1, v3, v4}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;
    move-result-object v1
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    :return
    return-void
.end method
