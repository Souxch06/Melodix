.class public final Lc91;
.super Landroid/webkit/WebViewClient;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public a:Ljava/lang/String;


# direct methods
.method public static a(Landroid/webkit/WebView;Ljava/util/Map;)Landroid/webkit/WebResourceResponse;
    .locals 1
    # Legacy silent-media/ad response disabled; WebView handles Spotify content normally.
    const/4 v0, 0x0
    return-object v0
.end method

.method public static b(Landroid/webkit/WebResourceRequest;)Landroid/webkit/WebResourceResponse;
    .locals 1
    # Legacy remote request proxy disabled.
    const/4 v0, 0x0
    return-object v0
.end method


# virtual methods
.method public final onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 24

    move-object/from16 v0, p1
    move-object/from16 v1, p2

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-super/range {p0 .. p2}, Landroid/webkit/WebViewClient;->onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V

    const-string v2, "about:blank"
    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-nez v2, :cond_14

    const-string v2, "chrome-error://"
    const/4 v3, 0x0
    invoke-static {v1, v2, v3}, Lla1;->x(Ljava/lang/String;Ljava/lang/String;Z)Z
    move-result v2
    if-eqz v2, :cond_0
    goto/16 :goto_5

    :cond_0
    # The official account host confirms a sign-in/reauthentication flow. Reset
    # only Melodix's stale in-memory/UI flag; do not inspect or clear WebView data.
    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;
    move-result-object v3
    invoke-virtual {v3}, Landroid/net/Uri;->getHost()Ljava/lang/String;
    move-result-object v3
    const-string v2, "accounts.spotify.com"
    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
    move-result v2
    if-eqz v2, :cond_auth_not_accounts

    const/4 v2, 0x0
    sput-boolean v2, Lcom/melodix/music/AppSingleton;->B:Z
    invoke-static {}, Lm9;->f()Landroid/content/SharedPreferences$Editor;
    move-result-object v3
    const-string v4, "LoggedIn"
    invoke-interface {v3, v4, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;
    move-result-object v3
    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->apply()V

    # Dismiss splash on accounts.spotify.com so the user can sign in cleanly.
    const/4 v8, 0x0
    sput-boolean v8, Lcom/melodix/music/AppSingleton;->m:Z
    const/4 v8, -0x1
    sput v8, Lcom/melodix/music/AppSingleton;->n:I
    sget-object v2, Lcom/melodix/music/AppSingleton;->t:Ljava/lang/ref/WeakReference;
    if-eqz v2, :cond_accounts_after_splash
    invoke-virtual {v2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Lcom/melodix/music/MainActivity;
    if-eqz v2, :cond_accounts_after_splash
    iget-object v9, v2, Lcom/melodix/music/MainActivity;->R:Landroid/widget/ProgressBar;
    if-eqz v9, :cond_accounts_hide_pb_done
    const/16 v10, 0x8
    invoke-virtual {v9, v10}, Landroid/view/View;->setVisibility(I)V
    :cond_accounts_hide_pb_done
    const/4 v7, 0x1
    new-instance v8, Lzk0;
    invoke-direct {v8, v2, v7, v7}, Lzk0;-><init>(Lcom/melodix/music/MainActivity;ZI)V
    invoke-virtual {v2, v8}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    :cond_accounts_after_splash
    const-string v5, "/login"
    const/4 v3, 0x0
    invoke-static {v1, v5, v3}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z
    move-result v2
    if-eqz v2, :cond_auth_not_spotify
    const/4 v8, 0x0
    const-string v2, "classic_login.js"
    invoke-static {v2}, Lm9;->d(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
    invoke-virtual {v0, v2, v8}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    goto/16 :goto_5

    :cond_auth_not_accounts
    # Inject Melodix assets only into the exact HTTPS Spotify Web Player origin.
    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;
    move-result-object v3
    invoke-virtual {v3}, Landroid/net/Uri;->getScheme()Ljava/lang/String;
    move-result-object v4
    const-string v5, "https"
    invoke-virtual {v5, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
    move-result v4
    if-eqz v4, :cond_auth_not_spotify
    invoke-virtual {v3}, Landroid/net/Uri;->getPort()I
    move-result v4
    const/4 v5, -0x1
    if-eq v4, v5, :cond_auth_port_ok
    const/16 v5, 0x1bb
    if-ne v4, v5, :cond_auth_not_spotify
    :cond_auth_port_ok
    invoke-virtual {v3}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;
    move-result-object v4
    const-string v5, "open.spotify.com"
    invoke-virtual {v5, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
    move-result v5
    if-eqz v5, :cond_auth_authority_port
    goto :cond_auth_authority_ok
    :cond_auth_authority_port
    const-string v5, "open.spotify.com:443"
    invoke-virtual {v5, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
    move-result v5
    if-eqz v5, :cond_auth_not_spotify
    :cond_auth_authority_ok
    invoke-virtual {v3}, Landroid/net/Uri;->getHost()Ljava/lang/String;
    move-result-object v3
    const-string v2, "open.spotify.com"
    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
    move-result v2
    if-eqz v2, :cond_auth_not_spotify

    const/4 v3, 0x0
    sget-boolean v2, Lcom/melodix/music/AppSingleton;->B:Z
    if-eqz v2, :cond_15
    const-string v2, "open.spotify.com"
    invoke-static {v1, v2, v3}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z
    move-result v2
    if-eqz v2, :cond_7
    goto :cond_5

    :cond_15
    :cond_5
    # A completed Spotify login/home document supersedes any stale splash error from startup or a failed redirect.
    const/4 v8, 0x0
    sput-boolean v8, Lcom/melodix/music/AppSingleton;->m:Z
    const/4 v8, -0x1
    sput v8, Lcom/melodix/music/AppSingleton;->n:I
    const/4 v7, 0x1
    sget-object v2, Lcom/melodix/music/AppSingleton;->t:Ljava/lang/ref/WeakReference;
    if-eqz v2, :cond_7
    invoke-virtual {v2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Lcom/melodix/music/MainActivity;
    if-eqz v2, :cond_7
    iget-object v9, v2, Lcom/melodix/music/MainActivity;->R:Landroid/widget/ProgressBar;
    if-eqz v9, :cond_16
    const/16 v10, 0x8
    invoke-virtual {v9, v10}, Landroid/view/View;->setVisibility(I)V
    :cond_16
    sget-boolean v8, Lcom/melodix/music/AppSingleton;->m:Z
    if-eqz v8, :cond_6
    goto :goto_0
    :cond_6
    new-instance v8, Lzk0;
    invoke-direct {v8, v2, v7, v7}, Lzk0;-><init>(Lcom/melodix/music/MainActivity;ZI)V
    invoke-virtual {v2, v8}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    :cond_7
    :goto_0
    const/4 v3, 0x0
    const/4 v7, 0x1
    const/4 v8, 0x0
    goto :cond_b

    :cond_auth_not_spotify
    goto/16 :goto_5

    :cond_b
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;
    move-result-object v1
    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v1
    iget v2, v1, Landroid/util/DisplayMetrics;->widthPixels:I
    int-to-float v2, v2
    iget v5, v1, Landroid/util/DisplayMetrics;->density:F
    div-float/2addr v2, v5
    float-to-int v2, v2
    iget v1, v1, Landroid/util/DisplayMetrics;->heightPixels:I
    int-to-float v1, v1
    div-float/2addr v1, v5
    float-to-int v1, v1

    sget-boolean v5, Lcom/melodix/music/AppSingleton;->F:Z
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
    move-result-object v9

    sget-object v10, Lcom/melodix/music/AppSingleton;->z:Ljava/lang/String;

    sget-boolean v5, Lcom/melodix/music/AppSingleton;->Q:Z
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
    move-result-object v11

    sget-boolean v5, Lcom/melodix/music/AppSingleton;->R:Z
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
    move-result-object v12

    sget-boolean v5, Lcom/melodix/music/AppSingleton;->E:Z
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
    move-result-object v13

    sget-object v14, Lcom/melodix/music/AppSingleton;->y:Ljava/lang/String;

    sget-boolean v5, Lcom/melodix/music/AppSingleton;->D:Z
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
    move-result-object v15

    sget-boolean v5, Lcom/melodix/music/AppSingleton;->C:Z
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
    move-result-object v16

    sget v5, Lcom/melodix/music/AppSingleton;->j:I
    invoke-static {}, Lm9;->c()Landroid/content/Context;
    move-result-object v5
    const v6, 0x7f110116
    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object v17

    # Report native touchscreen capability so desktop UA spoofing cannot hide tablet touch input.
    invoke-virtual {v5}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;
    move-result-object v5
    const-string v6, "android.hardware.touchscreen"
    invoke-virtual {v5, v6}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z
    move-result v6
    const-string v3, "android.software.leanback"
    invoke-virtual {v5, v3}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z
    move-result v3
    if-eqz v3, :sf_touch_configured
    const/4 v6, 0x0
    :sf_touch_configured
    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
    move-result-object v23

    const/4 v3, 0x0
    sget-boolean v5, Lcom/melodix/music/AppSingleton;->T:Z
    const-string v6, "bigwindow"
    if-nez v5, :cond_c
    sget-object v5, Lcom/melodix/music/AppSingleton;->z:Ljava/lang/String;
    invoke-static {v5, v6}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z
    move-result v5
    if-eqz v5, :cond_d
    :cond_c
    move v3, v7
    :cond_d
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
    move-result-object v18

    sget v3, Lcom/melodix/music/AppSingleton;->U:I
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v19

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v20

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v21

    sget-boolean v1, Lcom/melodix/music/AppSingleton;->S:Z
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
    move-result-object v22

    filled-new-array/range {v9 .. v23}, [Ljava/lang/Object;
    move-result-object v1
    const/16 v2, 0xf
    invoke-static {v1, v2}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;
    move-result-object v1
    const-string v2, "window.SF_CONFIG = { isAndAutoEnabled: %b, guiMode: \'%s\', isCanvasDisabled: %b, isFullScreenEnabled: %b, isAmoled: %b, autoPlayMode: \'%s\', closeNowPlay: %b, takeControl: %b, closeLibText: \'%s\', hideStatusBar: %b, statusBarHeight: %d, screenWidth: %d, screenHeight: %d, dockLeftSidebar: %b, touchInput: %b };"
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    move-result-object v1

    const-string v2, "desktop_spoof.js"
    invoke-static {v2}, Lm9;->d(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2

    const-string v6, "runtime_state.js"
    invoke-static {v6}, Lm9;->d(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v6

    new-instance v5, Ljava/lang/StringBuilder;
    invoke-direct {v5, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    invoke-virtual {v0, v1, v8}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    const-string v6, "bigwindow"

    # Keep the native shell entry point separate from remotely hotfixed Spotify behavior.
    const-string v5, "native_ui_shell.js"
    invoke-static {v5}, Lm9;->d(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v5
    invoke-virtual {v0, v5, v8}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    # Warm the bridge asset cache and execute via the shell's chunked/same-origin loader.
    const-string v3, "spotify_bridge.js"
    invoke-static {v3}, Lm9;->d(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v3
    const-string v5, "(window.__sfLoadBundledBridge||function(){})(\'spotify_bridge.js\');"
    invoke-virtual {v0, v5, v8}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    const-string v1, "playlist_sort.js"
    invoke-static {v1}, Lm9;->d(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    invoke-virtual {v0, v1, v8}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    const-string v4, ""
    sget-object v1, Lcom/melodix/music/AppSingleton;->z:Ljava/lang/String;
    const-string v2, "csshack"
    invoke-static {v1, v2}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z
    move-result v1
    const-string v2, "css_hacks.css"
    if-nez v1, :inject_full_css
    sget-object v1, Lcom/melodix/music/AppSingleton;->z:Ljava/lang/String;
    const-string v3, "bigwindow"
    invoke-static {v1, v3}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :cond_12

    :inject_full_css
    invoke-static {v2}, Lm9;->d(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    sget-boolean v2, Lcom/melodix/music/AppSingleton;->E:Z
    if-eqz v2, :cond_e
    const-string v4, ".encore-dark-theme{--background-base:#000;--background-highlight:#000;--background-elevated-base:#000;--background-elevated-highlight:#000;--background-elevated-press:#000;--background-tinted-base:#000} aside[data-testid=now-playing-bar]{background:#000!important;box-shadow:none;border-top:1px solid #666}"
    :cond_e
    new-instance v2, Ljava/lang/StringBuilder;
    const-string v3, "document.body.classList.remove(\'sf-canvas-blur\', \'sf-video-bg\', \'sf-fullscreen-enabled\', \'sf-fullscreen-disabled\', \'sf-hide-canvas\', \'sf-statusbar-hidden\');"
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    sget-boolean v3, Lcom/melodix/music/AppSingleton;->Q:Z
    if-eqz v3, :cond_f
    const-string v3, "document.body.classList.add(\'sf-canvas-blur\', \'sf-hide-canvas\');"
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    goto :goto_2
    :cond_f
    const-string v3, "document.body.classList.add(\'sf-video-bg\');"
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :goto_2
    sget-boolean v3, Lcom/melodix/music/AppSingleton;->R:Z
    if-eqz v3, :cond_10
    const-string v3, "document.body.classList.add(\'sf-fullscreen-enabled\');"
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    goto :goto_3
    :cond_10
    const-string v3, "document.body.classList.add(\'sf-fullscreen-disabled\');"
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :goto_3
    sget-boolean v3, Lcom/melodix/music/AppSingleton;->T:Z
    if-eqz v3, :cond_11
    const-string v3, "document.body.classList.add(\'sf-statusbar-hidden\');"
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :cond_11
    invoke-static {v1}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    invoke-static {v4}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v3
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v2
    filled-new-array {v1, v3, v2}, [Ljava/lang/Object;
    move-result-object v1
    const/4 v2, 0x3
    invoke-static {v1, v2}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;
    move-result-object v1
    const-string v2, "(function() {  let style = document.getElementById(\'sf-custom-style\');  if(!style) { style = document.createElement(\'style\'); style.id = \'sf-custom-style\'; document.head.appendChild(style); }  style.textContent = %s + %s;  %s})();"
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    move-result-object v1
    invoke-virtual {v0, v1, v8}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    const-string v2, "css_hacks.css"
    goto :cond_12

    :cond_12
    sget-object v1, Lcom/melodix/music/AppSingleton;->z:Ljava/lang/String;
    invoke-static {v1, v6}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :cond_13
    invoke-static {v2}, Lm9;->d(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    const-string v2, "/* SF_TV_FOCUS_START */"
    invoke-static {v1, v2, v4}, Lda1;->O(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    invoke-virtual {v1}, Ljava/lang/String;->length()I
    move-result v2
    if-lez v2, :cond_13
    invoke-static {v1}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    new-instance v2, Ljava/lang/StringBuilder;
    const-string v3, "(function() {  var s = document.getElementById(\'sf-tv-focus\');  if (!s) { s = document.createElement(\'style\'); s.id = \'sf-tv-focus\'; document.head.appendChild(s); }  s.textContent = "
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v1, ";})();"
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    invoke-virtual {v0, v1, v8}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    :cond_13
    sget-boolean v1, Lcom/melodix/music/WebService;->resumePlaybackOnRecovery:Z
    if-eqz v1, :goto_4
    const/4 v1, 0x0
    sput-boolean v1, Lcom/melodix/music/WebService;->resumePlaybackOnRecovery:Z
    const-string v1, "(function(){var n=0,t=setInterval(function(){n++;if(window.__sfUserRequestedPause||n>30){clearInterval(t);return;}var b=document.querySelector(\'button[data-testid=\"control-button-playpause\"]\')||window.pBtn;if(b){var l=String(b.getAttribute(\'aria-label\')||\'\');if(/play|lecture|lire/i.test(l)){b.click();clearInterval(t);}else if(/paus/i.test(l)){clearInterval(t);}}},500);})();"
    invoke-virtual {v0, v1, v8}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    :goto_4
    invoke-static/range {p1 .. p2}, Lcom/melodix/music/RuntimeDiagnostic;->runIfPreview(Landroid/webkit/WebView;Ljava/lang/String;)V
    sget-object v0, Lcom/melodix/music/AppSingleton;->b0:Ljava/lang/String;
    invoke-static {v0}, Lm9;->h(Ljava/lang/String;)V

    :cond_14
    :goto_5
    return-void
.end method

.method public onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 6

    invoke-super/range {p0 .. p3}, Landroid/webkit/WebViewClient;->onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V

    if-eqz p1, :watchdog_skipped
    invoke-static {p1}, Lcom/melodix/music/StartupLoadWatchdog;->arm(Landroid/webkit/WebView;)V
    :watchdog_skipped

    # JavascriptInterface is exposed to every frame: this top-level URL check is
    # NOT frame isolation. m9.g also installs the legacy bridge before first load.
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;
    move-result-object v0
    invoke-virtual {v0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;
    move-result-object v1
    const-string v2, "https"
    invoke-virtual {v2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :cond_bridge_remove

    invoke-virtual {v0}, Landroid/net/Uri;->getHost()Ljava/lang/String;
    move-result-object v1
    const-string v2, "open.spotify.com"
    invoke-virtual {v2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :cond_bridge_remove

    invoke-virtual {v0}, Landroid/net/Uri;->getPort()I
    move-result v1
    const/4 v2, -0x1
    if-eq v1, v2, :cond_bridge_authority
    const/16 v2, 0x1bb
    if-ne v1, v2, :cond_bridge_remove

    :cond_bridge_authority
    invoke-virtual {v0}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;
    move-result-object v1
    const-string v2, "open.spotify.com"
    invoke-virtual {v2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
    move-result v2
    if-nez v2, :cond_bridge_add
    const-string v2, "open.spotify.com:443"
    invoke-virtual {v2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
    move-result v2
    if-eqz v2, :cond_bridge_remove

    :cond_bridge_add
    # Reset diagnostics only after confirming a new top-level Spotify Web Player navigation.
    const/4 v0, 0x0
    sput-object v0, Lcom/melodix/music/AppSingleton;->g0:Ljava/lang/String;
    new-instance v0, Lcom/melodix/music/AndBridge;
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;
    move-result-object v1
    invoke-direct {v0, v1}, Lcom/melodix/music/AndBridge;-><init>(Landroid/content/Context;)V
    const-string v1, "AndBridge"
    invoke-virtual {p1, v0, v1}, Landroid/webkit/WebView;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V
    return-void

    :cond_bridge_remove
    const-string v0, "AndBridge"
    invoke-virtual {p1, v0}, Landroid/webkit/WebView;->removeJavascriptInterface(Ljava/lang/String;)V
    return-void
.end method

.method public final onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V
    .locals 0

    # Legacy callback has no isForMainFrame flag and can report subresource failures.
    # Decoded APK metadata sets minSdkVersion 24; the request overload handles main-frame errors.
    invoke-super {p0, p1, p2, p3, p4}, Landroid/webkit/WebViewClient;->onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V
    return-void
.end method

.method public final onReceivedError(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;Landroid/webkit/WebResourceError;)V
    .locals 3

    invoke-super {p0, p1, p2, p3}, Landroid/webkit/WebViewClient;->onReceivedError(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;Landroid/webkit/WebResourceError;)V

    const/4 p0, 0x0
    if-eqz p2, :cond_webview_no_request
    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->isForMainFrame()Z
    move-result p1
    goto :goto_webview_mainframe

    :cond_webview_no_request
    move p1, p0

    :goto_webview_mainframe
    if-eqz p3, :cond_webview_no_error
    invoke-virtual {p3}, Landroid/webkit/WebResourceError;->getErrorCode()I
    move-result p0

    :cond_webview_no_error
    # ERR_ABORTED is expected during redirects/reloads and is not an offline state.
    const/4 p2, -0x3
    if-ne p0, p2, :cond_webview_not_aborted
    return-void

    :cond_webview_not_aborted
    if-eqz p1, :cond_webview_done

    # Preserve only the numeric WebView error code for diagnosis; never retain or
    # display the request URL, query, headers, or Spotify account data.
    move v2, p0
    new-instance v0, Ljava/lang/StringBuilder;
    const-string v1, "WebView error code: "
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    sput-object v0, Lcom/melodix/music/AppSingleton;->g0:Ljava/lang/String;

    # Let MainActivity own the offline-state transition. Pre-setting m/n here
    # would make D() treat this as an unchanged state and skip its text update.
    sget-object p1, Lcom/melodix/music/AppSingleton;->t:Ljava/lang/ref/WeakReference;
    if-eqz p1, :cond_webview_done
    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;
    move-result-object p1
    check-cast p1, Lcom/melodix/music/MainActivity;
    if-eqz p1, :cond_webview_done

    iget-object p2, p1, Lcom/melodix/music/MainActivity;->R:Landroid/widget/ProgressBar;
    if-eqz p2, :skip_progressbar_hide
    const/16 p3, 0x8
    invoke-virtual {p2, p3}, Landroid/view/View;->setVisibility(I)V
    :skip_progressbar_hide

    const/4 p0, 0x1
    invoke-virtual {p1, p0}, Lcom/melodix/music/MainActivity;->D(Z)V

    # Also refresh the visible text if the offline overlay was already active.
    new-instance v0, Ljava/lang/StringBuilder;
    const-string v1, "Network Error\nTap to retry\n"
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    const-string v1, "WebView error code: "
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    iget-object p0, p1, Lcom/melodix/music/MainActivity;->K:Landroid/widget/TextView;
    if-eqz p0, :cond_webview_done
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_webview_done
    return-void
.end method

.method public final onReceivedHttpError(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;Landroid/webkit/WebResourceResponse;)V
    .locals 0

    # An HTTP status (including 4xx/5xx) is a server response, not loss of network.
    # Let WebView render Spotify's response; only transport errors show the offline UI.
    invoke-super {p0, p1, p2, p3}, Landroid/webkit/WebViewClient;->onReceivedHttpError(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;Landroid/webkit/WebResourceResponse;)V
    return-void
.end method

.method public final onReceivedSslError(Landroid/webkit/WebView;Landroid/webkit/SslErrorHandler;Landroid/net/http/SslError;)V
    .locals 0
    # Fail closed for certificate errors in every build type.
    invoke-virtual {p2}, Landroid/webkit/SslErrorHandler;->cancel()V
    return-void
.end method

.method public onRenderProcessGone(Landroid/webkit/WebView;Landroid/webkit/RenderProcessGoneDetail;)Z
    .locals 3

    if-eqz p2, :cond_0
    invoke-static {p2}, Li1;->r(Landroid/webkit/RenderProcessGoneDetail;)V
    :cond_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I
    const/16 v1, 0x1d
    if-lt v0, v1, :cond_1
    if-eqz p2, :cond_1
    invoke-static {p2}, Li1;->B(Landroid/webkit/RenderProcessGoneDetail;)V
    :cond_1
    if-eqz p1, :cond_2
    sget-object v0, Lcom/melodix/music/AppSingleton;->w:Ll9;
    if-ne p1, v0, :cond_2
    sget-boolean v0, Lcom/melodix/music/WebService;->r:Z
    sput-boolean v0, Lcom/melodix/music/WebService;->resumePlaybackOnRecovery:Z
    const/4 v0, 0x0
    sput-boolean v0, Lcom/melodix/music/WebService;->r:Z
    sget v0, Lcom/melodix/music/AppSingleton;->j:I
    invoke-static {}, Lm9;->b()V
    sget-object v0, Lcom/melodix/music/AppSingleton;->t:Ljava/lang/ref/WeakReference;
    if-eqz v0, :recover_bg_service
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/melodix/music/MainActivity;
    if-eqz v0, :recover_bg_service
    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z
    move-result v1
    if-nez v1, :recover_bg_service
    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z
    move-result v1
    if-nez v1, :recover_bg_service
    new-instance v1, Ls4;
    const/16 p2, 0xb
    invoke-direct {v1, v0, p2}, Ls4;-><init>(Lcom/melodix/music/MainActivity;I)V
    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
    goto :cond_2

    :recover_bg_service
    sget-object v0, Lcom/melodix/music/WebService;->G:Lcom/melodix/music/WebService;
    if-eqz v0, :cond_2
    new-instance v1, Landroid/os/Handler;
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
    move-result-object v2
    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
    new-instance v2, Lyi1;
    const/4 p2, 0x1
    invoke-direct {v2, v0, p2}, Lyi1;-><init>(Lcom/melodix/music/WebService;I)V
    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_2
    const/4 v0, 0x1
    return v0
.end method

.method public final shouldInterceptRequest(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Landroid/webkit/WebResourceResponse;
    .locals 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;
    move-result-object v0
    if-eqz v0, :delegate_super
    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;
    move-result-object v0
    if-eqz v0, :delegate_super
    invoke-static {v0}, Lcom/melodix/music/NativeBridgeAsset;->responseForUrl(Ljava/lang/String;)Landroid/webkit/WebResourceResponse;
    move-result-object v1
    if-eqz v1, :delegate_super
    return-object v1

    :delegate_super
    # Use WebView's standard request handling; no cookie/header proxy or CORS rewrite.
    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->shouldInterceptRequest(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Landroid/webkit/WebResourceResponse;
    move-result-object v0
    return-object v0
.end method

.method public final shouldOverrideUrlLoading(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Z
    .locals 4

    const/4 v0, 0x0
    if-eqz p2, :cond_allow_default
    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;
    move-result-object v1
    if-eqz v1, :cond_allow_default

    invoke-virtual {v1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;
    move-result-object v2
    if-eqz v2, :scheme_ok
    const-string v3, "javascript"
    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
    move-result v3
    if-nez v3, :block_nav_scheme
    const-string v3, "file"
    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
    move-result v3
    if-nez v3, :block_nav_scheme
    const-string v3, "data"
    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
    move-result v3
    if-nez v3, :block_nav_scheme
    const-string v3, "intent"
    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
    move-result v3
    if-nez v3, :block_nav_scheme

    :scheme_ok
    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;
    move-result-object v1
    if-eqz v1, :cond_allow_default
    invoke-static {v1}, Ldl1;->l(Ljava/lang/String;)Z
    move-result v2

    :cond_allow_default
    # Keep Spotify's official authentication and route handling unmodified.
    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->shouldOverrideUrlLoading(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Z
    move-result p0
    return p0

    :block_nav_scheme
    const/4 p0, 0x1
    return p0
.end method
