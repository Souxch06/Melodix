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
    .locals 23

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    invoke-super/range {p0 .. p2}, Landroid/webkit/WebViewClient;->onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const-string v2, "about:blank"

    .line 15
    .line 16
    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    if-nez v2, :cond_14

    .line 21
    .line 22
    const-string v2, "chrome-error://"

    .line 23
    .line 24
    const/4 v3, 0x0

    .line 25
    invoke-static {v1, v2, v3}, Lla1;->x(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-eqz v2, :cond_0

    .line 30
    .line 31
    goto/16 :goto_5

    .line 32
    .line 33
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
    const/4 v8, 0x0
    goto/16 :cond_b

    :cond_auth_not_spotify
    goto/16 :goto_5

    :cond_b
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 244
    .line 245
    .line 246
    move-result-object v1

    .line 247
    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 248
    .line 249
    .line 250
    move-result-object v1

    .line 251
    iget v2, v1, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 252
    .line 253
    int-to-float v2, v2

    .line 254
    iget v5, v1, Landroid/util/DisplayMetrics;->density:F

    .line 255
    .line 256
    div-float/2addr v2, v5

    .line 257
    float-to-int v2, v2

    .line 258
    iget v1, v1, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 259
    .line 260
    int-to-float v1, v1

    .line 261
    div-float/2addr v1, v5

    .line 262
    float-to-int v1, v1

    .line 263
    sget-boolean v5, Lcom/melodix/music/AppSingleton;->F:Z

    .line 264
    .line 265
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 266
    .line 267
    .line 268
    move-result-object v9

    .line 269
    sget-object v10, Lcom/melodix/music/AppSingleton;->z:Ljava/lang/String;

    .line 270
    .line 271
    sget-boolean v5, Lcom/melodix/music/AppSingleton;->Q:Z

    .line 272
    .line 273
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 274
    .line 275
    .line 276
    move-result-object v11

    .line 277
    sget-boolean v5, Lcom/melodix/music/AppSingleton;->R:Z

    .line 278
    .line 279
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 280
    .line 281
    .line 282
    move-result-object v12

    .line 283
    sget-boolean v5, Lcom/melodix/music/AppSingleton;->E:Z

    .line 284
    .line 285
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 286
    .line 287
    .line 288
    move-result-object v13

    .line 289
    sget-object v14, Lcom/melodix/music/AppSingleton;->y:Ljava/lang/String;

    .line 290
    .line 291
    sget-boolean v5, Lcom/melodix/music/AppSingleton;->D:Z

    .line 292
    .line 293
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 294
    .line 295
    .line 296
    move-result-object v15

    .line 297
    sget-boolean v5, Lcom/melodix/music/AppSingleton;->C:Z

    .line 298
    .line 299
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 300
    .line 301
    .line 302
    move-result-object v16

    .line 303
    sget v5, Lcom/melodix/music/AppSingleton;->j:I

    .line 304
    .line 305
    invoke-static {}, Lm9;->c()Landroid/content/Context;

    .line 306
    .line 307
    .line 308
    move-result-object v5

    .line 309
    const v6, 0x7f110116

    .line 310
    .line 311
    .line 312
    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 313
    .line 314
    .line 315
    move-result-object v17

    .line 316
    sget-boolean v5, Lcom/melodix/music/AppSingleton;->T:Z

    .line 317
    .line 318
    const-string v6, "bigwindow"

    .line 319
    .line 320
    if-nez v5, :cond_c

    .line 321
    .line 322
    sget-object v5, Lcom/melodix/music/AppSingleton;->z:Ljava/lang/String;

    .line 323
    .line 324
    invoke-static {v5, v6}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 325
    .line 326
    .line 327
    move-result v5

    .line 328
    if-eqz v5, :cond_d

    .line 329
    .line 330
    :cond_c
    move v3, v7

    .line 331
    :cond_d
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 332
    .line 333
    .line 334
    move-result-object v18

    .line 335
    sget v3, Lcom/melodix/music/AppSingleton;->U:I

    .line 336
    .line 337
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 338
    .line 339
    .line 340
    move-result-object v19

    .line 341
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 342
    .line 343
    .line 344
    move-result-object v20

    .line 345
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 346
    .line 347
    .line 348
    move-result-object v21

    .line 349
    sget-boolean v1, Lcom/melodix/music/AppSingleton;->S:Z

    .line 350
    .line 351
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 352
    .line 353
    .line 354
    move-result-object v22

    .line 355
    filled-new-array/range {v9 .. v22}, [Ljava/lang/Object;

    .line 356
    .line 357
    .line 358
    move-result-object v1

    .line 359
    const/16 v2, 0xe

    .line 360
    .line 361
    invoke-static {v1, v2}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 362
    .line 363
    .line 364
    move-result-object v1

    .line 365
    const-string v2, "window.SF_CONFIG = { isAndAutoEnabled: %b, guiMode: \'%s\', isCanvasDisabled: %b, isFullScreenEnabled: %b, isAmoled: %b, autoPlayMode: \'%s\', closeNowPlay: %b, takeControl: %b, closeLibText: \'%s\', hideStatusBar: %b, statusBarHeight: %d, screenWidth: %d, screenHeight: %d, dockLeftSidebar: %b };"

    .line 366
    .line 367
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 368
    .line 369
    .line 370
    move-result-object v1

    .line 371
    const-string v2, "runtime_state.js"
    invoke-static {v2}, Lm9;->d(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2

    const-string v3, "spotify_bridge.js"
    invoke-static {v3}, Lm9;->d(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;
    invoke-direct {v4, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    invoke-virtual {v0, v1, v8}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    .line 408
    .line 409
    .line 410
    sget-object v1, Lcom/melodix/music/AppSingleton;->z:Ljava/lang/String;

    .line 411
    .line 412
    const-string v2, "csshack"

    .line 413
    .line 414
    invoke-static {v1, v2}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 415
    .line 416
    .line 417
    move-result v1

    .line 418
    const-string v2, "css_hacks.css"

    .line 419
    .line 420
    if-eqz v1, :cond_12

    .line 421
    .line 422
    invoke-static {v2}, Lm9;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 423
    .line 424
    .line 425
    move-result-object v1

    .line 426
    sget-boolean v2, Lcom/melodix/music/AppSingleton;->E:Z

    .line 427
    .line 428
    if-eqz v2, :cond_e

    .line 429
    .line 430
    const-string v4, ".encore-dark-theme{--background-base:#000;--background-highlight:#000;--background-elevated-base:#000;--background-elevated-highlight:#000;--background-elevated-press:#000;--background-tinted-base:#000} aside[data-testid=now-playing-bar]{background:#000!important;box-shadow:none;border-top:1px solid #666}"

    .line 431
    .line 432
    :cond_e
    new-instance v2, Ljava/lang/StringBuilder;

    .line 433
    .line 434
    const-string v3, "document.body.classList.remove(\'sf-canvas-blur\', \'sf-video-bg\', \'sf-fullscreen-enabled\', \'sf-fullscreen-disabled\', \'sf-hide-canvas\', \'sf-statusbar-hidden\');"

    .line 435
    .line 436
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 437
    .line 438
    .line 439
    sget-boolean v3, Lcom/melodix/music/AppSingleton;->Q:Z

    .line 440
    .line 441
    if-eqz v3, :cond_f

    .line 442
    .line 443
    const-string v3, "document.body.classList.add(\'sf-canvas-blur\', \'sf-hide-canvas\');"

    .line 444
    .line 445
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 446
    .line 447
    .line 448
    goto :goto_2

    .line 449
    :cond_f
    const-string v3, "document.body.classList.add(\'sf-video-bg\');"

    .line 450
    .line 451
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 452
    .line 453
    .line 454
    :goto_2
    sget-boolean v3, Lcom/melodix/music/AppSingleton;->R:Z

    .line 455
    .line 456
    if-eqz v3, :cond_10

    .line 457
    .line 458
    const-string v3, "document.body.classList.add(\'sf-fullscreen-enabled\');"

    .line 459
    .line 460
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 461
    .line 462
    .line 463
    goto :goto_3

    .line 464
    :cond_10
    const-string v3, "document.body.classList.add(\'sf-fullscreen-disabled\');"

    .line 465
    .line 466
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 467
    .line 468
    .line 469
    :goto_3
    sget-boolean v3, Lcom/melodix/music/AppSingleton;->T:Z

    .line 470
    .line 471
    if-eqz v3, :cond_11

    .line 472
    .line 473
    const-string v3, "document.body.classList.add(\'sf-statusbar-hidden\');"

    .line 474
    .line 475
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 476
    .line 477
    .line 478
    :cond_11
    invoke-static {v1}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    .line 479
    .line 480
    .line 481
    move-result-object v1

    .line 482
    invoke-static {v4}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    .line 483
    .line 484
    .line 485
    move-result-object v3

    .line 486
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 487
    .line 488
    .line 489
    move-result-object v2

    .line 490
    filled-new-array {v1, v3, v2}, [Ljava/lang/Object;

    .line 491
    .line 492
    .line 493
    move-result-object v1

    .line 494
    const/4 v2, 0x3

    .line 495
    invoke-static {v1, v2}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 496
    .line 497
    .line 498
    move-result-object v1

    .line 499
    const-string v2, "(function() {  let style = document.getElementById(\'sf-custom-style\');  if(!style) { style = document.createElement(\'style\'); style.id = \'sf-custom-style\'; document.head.appendChild(style); }  style.textContent = %s + %s;  %s})();"

    .line 500
    .line 501
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 502
    .line 503
    .line 504
    move-result-object v1

    .line 505
    invoke-virtual {v0, v1, v8}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    .line 506
    .line 507
    .line 508
    goto :goto_4

    .line 509
    :cond_12
    sget-object v1, Lcom/melodix/music/AppSingleton;->z:Ljava/lang/String;

    .line 510
    .line 511
    invoke-static {v1, v6}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 512
    .line 513
    .line 514
    move-result v1

    .line 515
    if-eqz v1, :cond_13

    .line 516
    .line 517
    invoke-static {v2}, Lm9;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 518
    .line 519
    .line 520
    move-result-object v1

    .line 521
    const-string v2, "/* SF_TV_FOCUS_START */"

    .line 522
    .line 523
    invoke-static {v1, v2, v4}, Lda1;->O(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 524
    .line 525
    .line 526
    move-result-object v1

    .line 527
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 528
    .line 529
    .line 530
    move-result v2

    .line 531
    if-lez v2, :cond_13

    .line 532
    .line 533
    invoke-static {v1}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    .line 534
    .line 535
    .line 536
    move-result-object v1

    .line 537
    new-instance v2, Ljava/lang/StringBuilder;

    .line 538
    .line 539
    const-string v3, "(function() {  var s = document.getElementById(\'sf-tv-focus\');  if (!s) { s = document.createElement(\'style\'); s.id = \'sf-tv-focus\'; document.head.appendChild(s); }  s.textContent = "

    .line 540
    .line 541
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 542
    .line 543
    .line 544
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 545
    .line 546
    .line 547
    const-string v1, ";})();"

    .line 548
    .line 549
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 550
    .line 551
    .line 552
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 553
    .line 554
    .line 555
    move-result-object v1

    .line 556
    invoke-virtual {v0, v1, v8}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    .line 557
    .line 558
    .line 559
    :cond_13
    :goto_4
    sget-object v0, Lcom/melodix/music/AppSingleton;->b0:Ljava/lang/String;

    .line 560
    .line 561
    invoke-static {v0}, Lm9;->h(Ljava/lang/String;)V

    .line 562
    .line 563
    .line 564
    :cond_14
    :goto_5
    return-void
.end method

.method public onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 6
    invoke-super/range {p0 .. p3}, Landroid/webkit/WebViewClient;->onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V

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
    .locals 2

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
    new-instance v0, Ljava/lang/StringBuilder;
    const-string v1, "WebView error code: "
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    sput-object v0, Lcom/melodix/music/AppSingleton;->g0:Ljava/lang/String;

    const/4 p0, 0x1
    sput-boolean p0, Lcom/melodix/music/AppSingleton;->m:Z
    sput p0, Lcom/melodix/music/AppSingleton;->n:I

    sget-object p1, Lcom/melodix/music/AppSingleton;->t:Ljava/lang/ref/WeakReference;
    if-eqz p1, :cond_webview_done
    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;
    move-result-object p1
    check-cast p1, Lcom/melodix/music/MainActivity;
    if-eqz p1, :cond_webview_done
    invoke-virtual {p1, p0}, Lcom/melodix/music/MainActivity;->D(Z)V

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
    .locals 0

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    invoke-static {p2}, Li1;->r(Landroid/webkit/RenderProcessGoneDetail;)V

    .line 4
    .line 5
    .line 6
    :cond_0
    sget p0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 7
    .line 8
    const/16 p1, 0x1d

    .line 9
    .line 10
    if-lt p0, p1, :cond_1

    .line 11
    .line 12
    if-eqz p2, :cond_1

    .line 13
    .line 14
    invoke-static {p2}, Li1;->B(Landroid/webkit/RenderProcessGoneDetail;)V

    .line 15
    .line 16
    .line 17
    :cond_1
    sget p0, Lcom/melodix/music/AppSingleton;->j:I

    .line 18
    .line 19
    invoke-static {}, Lm9;->b()V

    .line 20
    .line 21
    .line 22
    sget-object p0, Lcom/melodix/music/AppSingleton;->t:Ljava/lang/ref/WeakReference;

    .line 23
    .line 24
    if-eqz p0, :cond_2

    .line 25
    .line 26
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    check-cast p0, Lcom/melodix/music/MainActivity;

    .line 31
    .line 32
    if-eqz p0, :cond_2

    .line 33
    .line 34
    new-instance p1, Ls4;

    .line 35
    .line 36
    const/16 p2, 0xb

    .line 37
    .line 38
    invoke-direct {p1, p0, p2}, Ls4;-><init>(Lcom/melodix/music/MainActivity;I)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0, p1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 42
    .line 43
    .line 44
    :cond_2
    const/4 p0, 0x1

    .line 45
    return p0
.end method

.method public final shouldInterceptRequest(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Landroid/webkit/WebResourceResponse;
    .locals 1
    # Use WebView's standard request handling; no cookie/header proxy or CORS rewrite.
    invoke-super/range {p0 .. p2}, Landroid/webkit/WebViewClient;->shouldInterceptRequest(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Landroid/webkit/WebResourceResponse;
    move-result-object v0
    return-object v0
.end method

.method public final shouldOverrideUrlLoading(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Z
    .locals 0
    # Keep Spotify's official authentication and route handling unmodified.
    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->shouldOverrideUrlLoading(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Z
    move-result p0
    return p0
.end method
