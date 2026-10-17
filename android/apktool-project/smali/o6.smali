.class public final synthetic Lo6;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:I

.field public final synthetic k:Ljava/lang/Object;

.field public final synthetic l:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;ILjava/lang/Object;)V
    .locals 0

    .line 1
    iput p2, p0, Lo6;->j:I

    .line 2
    .line 3
    iput-object p1, p0, Lo6;->k:Ljava/lang/Object;

    .line 4
    .line 5
    iput-object p3, p0, Lo6;->l:Ljava/lang/Object;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 12

    .line 1
    iget v0, p0, Lo6;->j:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    const/4 v3, 0x0

    .line 6
    packed-switch v0, :pswitch_data_0

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lo6;->k:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast v0, Lcom/melodix/music/WebService;

    .line 12
    .line 13
    iget-object p0, p0, Lo6;->l:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast p0, Ljava/lang/String;

    .line 16
    .line 17
    sget-boolean v2, Lcom/melodix/music/WebService;->r:Z

    .line 18
    .line 19
    sget-object v2, Lcom/melodix/music/AppSingleton;->w:Ll9;

    .line 20
    .line 21
    if-nez v2, :cond_0

    .line 22
    .line 23
    sget v2, Lcom/melodix/music/AppSingleton;->j:I

    .line 24
    .line 25
    invoke-static {v0}, Lm9;->g(Landroid/content/Context;)Landroid/webkit/WebView;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    if-nez v2, :cond_0

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    :try_start_0
    invoke-virtual {v2}, Landroid/webkit/WebView;->resumeTimers()V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v2}, Landroid/webkit/WebView;->onResume()V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v2, v3}, Landroid/view/View;->dispatchWindowVisibilityChanged(I)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v2, p0, v1}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 42
    .line 43
    .line 44
    :catch_0
    :goto_0
    return-void

    .line 45
    :pswitch_0
    iget-object v0, p0, Lo6;->k:Ljava/lang/Object;

    .line 46
    .line 47
    check-cast v0, Lnm;

    .line 48
    .line 49
    iget-object p0, p0, Lo6;->l:Ljava/lang/Object;

    .line 50
    .line 51
    check-cast p0, Ljava/util/List;

    .line 52
    .line 53
    iget-object v1, v0, Lnm;->j:Ljava/lang/Object;

    .line 54
    .line 55
    check-cast v1, Lwn0;

    .line 56
    .line 57
    iget-object v0, v0, Lnm;->l:Ljava/lang/Object;

    .line 58
    .line 59
    check-cast v0, Ljava/lang/String;

    .line 60
    .line 61
    invoke-virtual {v1, v0, p0}, Lwn0;->i(Ljava/lang/String;Ljava/util/List;)V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :pswitch_1
    iget-object v0, p0, Lo6;->k:Ljava/lang/Object;

    .line 66
    .line 67
    check-cast v0, Lvd1;

    .line 68
    .line 69
    iget-object p0, p0, Lo6;->l:Ljava/lang/Object;

    .line 70
    .line 71
    check-cast p0, Lvs0;

    .line 72
    .line 73
    iget-object v1, p0, Lvs0;->a:Lws0;

    .line 74
    .line 75
    iget-object p0, p0, Lvs0;->b:Lx9;

    .line 76
    .line 77
    invoke-virtual {v0, v1, p0}, Lvd1;->d(Lws0;Lx9;)V

    .line 78
    .line 79
    .line 80
    return-void

    .line 81
    :pswitch_2
    iget-object v0, p0, Lo6;->k:Ljava/lang/Object;

    .line 82
    .line 83
    check-cast v0, Landroid/content/Context;

    .line 84
    .line 85
    iget-object p0, p0, Lo6;->l:Ljava/lang/Object;

    .line 86
    .line 87
    check-cast p0, Lcom/melodix/music/SettingsActivity$a;

    .line 88
    .line 89
    const-string v1, "Ready to log into new account"

    .line 90
    .line 91
    invoke-static {v0, v1, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 96
    .line 97
    .line 98
    invoke-virtual {p0}, Lh70;->g()Le6;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    if-eqz p0, :cond_1

    .line 103
    .line 104
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    .line 105
    .line 106
    .line 107
    :cond_1
    return-void

    .line 108
    :pswitch_3
    iget-object v0, p0, Lo6;->k:Ljava/lang/Object;

    .line 109
    .line 110
    check-cast v0, Lk8;

    .line 111
    .line 112
    iget-object p0, p0, Lo6;->l:Ljava/lang/Object;

    .line 113
    .line 114
    check-cast p0, Landroid/graphics/Typeface;

    .line 115
    .line 116
    invoke-virtual {v0, p0}, Lk8;->b(Landroid/graphics/Typeface;)V

    .line 117
    .line 118
    .line 119
    return-void

    .line 120
    :pswitch_4
    iget-object v0, p0, Lo6;->k:Ljava/lang/Object;

    .line 121
    .line 122
    check-cast v0, Ll01;

    .line 123
    .line 124
    iget-object p0, p0, Lo6;->l:Ljava/lang/Object;

    .line 125
    .line 126
    check-cast p0, Ljava/util/concurrent/CountDownLatch;

    .line 127
    .line 128
    :try_start_1
    iget-object v0, v0, Ll01;->h:Law;

    .line 129
    .line 130
    sget-object v1, Lav0;->l:Lav0;

    .line 131
    .line 132
    iget-object v0, v0, Law;->k:Ljava/lang/Object;

    .line 133
    .line 134
    check-cast v0, Lqf;

    .line 135
    .line 136
    invoke-virtual {v0, v1}, Lqf;->b(Lav0;)Lqf;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    invoke-static {}, Lxd1;->a()Lxd1;

    .line 141
    .line 142
    .line 143
    move-result-object v1

    .line 144
    iget-object v1, v1, Lxd1;->d:Lve;

    .line 145
    .line 146
    invoke-virtual {v1, v0, v2}, Lve;->a(Lqf;I)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 147
    .line 148
    .line 149
    :catch_1
    invoke-virtual {p0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 150
    .line 151
    .line 152
    return-void

    .line 153
    :pswitch_5
    iget-object v0, p0, Lo6;->k:Ljava/lang/Object;

    .line 154
    .line 155
    check-cast v0, Lcom/melodix/music/MainActivity;

    .line 156
    .line 157
    iget-object p0, p0, Lo6;->l:Ljava/lang/Object;

    .line 158
    .line 159
    check-cast p0, Landroid/graphics/Bitmap;

    .line 160
    .line 161
    iget-object v1, v0, Lcom/melodix/music/MainActivity;->X:Landroid/widget/ImageView;

    .line 162
    .line 163
    if-eqz v1, :cond_2

    .line 164
    .line 165
    invoke-virtual {v1, p0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 166
    .line 167
    .line 168
    :cond_2
    invoke-virtual {v0}, Lcom/melodix/music/MainActivity;->H()V

    .line 169
    .line 170
    .line 171
    return-void

    .line 172
    :pswitch_6
    iget-object v0, p0, Lo6;->k:Ljava/lang/Object;

    .line 173
    .line 174
    check-cast v0, Landroid/view/View;

    .line 175
    .line 176
    iget-object p0, p0, Lo6;->l:Ljava/lang/Object;

    .line 177
    .line 178
    check-cast p0, Lcom/melodix/music/MainActivity;

    .line 179
    .line 180
    sget v1, Lcom/melodix/music/MainActivity;->h0:I

    .line 181
    .line 182
    invoke-virtual {v0, v3}, Landroid/view/View;->performHapticFeedback(I)Z

    .line 183
    .line 184
    .line 185
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 186
    .line 187
    .line 188
    move-result-object v0

    .line 189
    const/high16 v1, 0x3f800000    # 1.0f

    .line 190
    .line 191
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    .line 192
    .line 193
    .line 194
    move-result-object v0

    .line 195
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    .line 196
    .line 197
    .line 198
    move-result-object v0

    .line 199
    const-wide/16 v1, 0x96

    .line 200
    .line 201
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 202
    .line 203
    .line 204
    move-result-object v0

    .line 205
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 206
    .line 207
    .line 208
    new-instance v0, Landroid/content/Intent;

    .line 209
    .line 210
    const-class v1, Lcom/melodix/music/SettingsActivity;

    .line 211
    .line 212
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 213
    .line 214
    .line 215
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 216
    .line 217
    .line 218
    return-void

    .line 219
    :pswitch_7
    iget-object v0, p0, Lo6;->k:Ljava/lang/Object;

    .line 220
    .line 221
    check-cast v0, Landroid/webkit/WebView;

    .line 222
    .line 223
    iget-object p0, p0, Lo6;->l:Ljava/lang/Object;

    .line 224
    .line 225
    check-cast p0, Lcom/melodix/music/MainActivity;

    .line 226
    .line 227
    sget v1, Lcom/melodix/music/MainActivity;->h0:I

    .line 228
    .line 229
    const-string v1, "window.pipFillVideo&&window.pipFillVideo(true)"

    .line 230
    .line 231
    new-instance v3, Lal0;

    .line 232
    .line 233
    invoke-direct {v3, v2, p0}, Lal0;-><init>(ILjava/lang/Object;)V

    .line 234
    .line 235
    .line 236
    invoke-virtual {v0, v1, v3}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    .line 237
    .line 238
    .line 239
    return-void

    .line 240
    :pswitch_8
    iget-object v0, p0, Lo6;->k:Ljava/lang/Object;

    .line 241
    .line 242
    check-cast v0, Lcom/google/android/datatransport/runtime/scheduling/jobscheduling/JobInfoSchedulerService;

    .line 243
    .line 244
    iget-object p0, p0, Lo6;->l:Ljava/lang/Object;

    .line 245
    .line 246
    check-cast p0, Landroid/app/job/JobParameters;

    .line 247
    .line 248
    sget v1, Lcom/google/android/datatransport/runtime/scheduling/jobscheduling/JobInfoSchedulerService;->j:I

    .line 249
    .line 250
    invoke-virtual {v0, p0, v3}, Landroid/app/job/JobService;->jobFinished(Landroid/app/job/JobParameters;Z)V

    .line 251
    .line 252
    .line 253
    return-void

    .line 254
    :pswitch_9
    iget-object v0, p0, Lo6;->k:Ljava/lang/Object;

    .line 255
    .line 256
    check-cast v0, Lez0;

    .line 257
    .line 258
    iget-object p0, p0, Lo6;->l:Ljava/lang/Object;

    .line 259
    .line 260
    check-cast p0, Lez0;

    .line 261
    .line 262
    sget-object v2, Lcom/melodix/music/AppSingleton;->w:Ll9;

    .line 263
    .line 264
    if-nez v2, :cond_3

    .line 265
    .line 266
    goto/16 :goto_4

    .line 267
    .line 268
    :cond_3
    iget-boolean v0, v0, Lez0;->j:Z

    .line 269
    .line 270
    if-eqz v0, :cond_7

    .line 271
    .line 272
    sget-object v0, Lcom/melodix/music/AppSingleton;->z:Ljava/lang/String;

    .line 273
    .line 274
    const-string v3, "csshack"

    .line 275
    .line 276
    invoke-static {v0, v3}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 277
    .line 278
    .line 279
    move-result v0

    .line 280
    if-eqz v0, :cond_7

    .line 281
    .line 282
    sget v0, Lcom/melodix/music/AppSingleton;->j:I

    .line 283
    .line 284
    const-string v0, "css_hacks.css"

    .line 285
    .line 286
    invoke-static {v0}, Lm9;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 287
    .line 288
    .line 289
    move-result-object v0

    .line 290
    sget-boolean v3, Lcom/melodix/music/AppSingleton;->E:Z

    .line 291
    .line 292
    if-eqz v3, :cond_4

    .line 293
    .line 294
    const-string v3, ".encore-dark-theme{--background-base:#000;--background-highlight:#000;--background-elevated-base:#000;--background-elevated-highlight:#000;--background-elevated-press:#000;--background-tinted-base:#000} aside[data-testid=now-playing-bar]{background:#000!important;box-shadow:none;border-top:1px solid #666}"

    .line 295
    .line 296
    goto :goto_1

    .line 297
    :cond_4
    const-string v3, ""

    .line 298
    .line 299
    :goto_1
    new-instance v4, Ljava/lang/StringBuilder;

    .line 300
    .line 301
    const-string v5, "document.body.classList.remove(\'sf-canvas-blur\', \'sf-video-bg\', \'sf-fullscreen-enabled\', \'sf-fullscreen-disabled\', \'sf-hide-canvas\');"

    .line 302
    .line 303
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 304
    .line 305
    .line 306
    sget-boolean v5, Lcom/melodix/music/AppSingleton;->Q:Z

    .line 307
    .line 308
    if-eqz v5, :cond_5

    .line 309
    .line 310
    const-string v5, "document.body.classList.add(\'sf-canvas-blur\', \'sf-hide-canvas\');"

    .line 311
    .line 312
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 313
    .line 314
    .line 315
    goto :goto_2

    .line 316
    :cond_5
    const-string v5, "document.body.classList.add(\'sf-video-bg\');"

    .line 317
    .line 318
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 319
    .line 320
    .line 321
    :goto_2
    sget-boolean v5, Lcom/melodix/music/AppSingleton;->R:Z

    .line 322
    .line 323
    if-eqz v5, :cond_6

    .line 324
    .line 325
    const-string v5, "document.body.classList.add(\'sf-fullscreen-enabled\');"

    .line 326
    .line 327
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 328
    .line 329
    .line 330
    goto :goto_3

    .line 331
    :cond_6
    const-string v5, "document.body.classList.add(\'sf-fullscreen-disabled\');"

    .line 332
    .line 333
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 334
    .line 335
    .line 336
    :goto_3
    const-string v5, "(function() {  let style = document.getElementById(\'sf-custom-style\');  if(!style) { style = document.createElement(\'style\'); style.id = \'sf-custom-style\'; document.head.appendChild(style); }  style.textContent = %s + %s;  %s})();"

    .line 337
    .line 338
    invoke-static {v0}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    .line 339
    .line 340
    .line 341
    move-result-object v0

    .line 342
    invoke-static {v3}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    .line 343
    .line 344
    .line 345
    move-result-object v3

    .line 346
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 347
    .line 348
    .line 349
    move-result-object v4

    .line 350
    filled-new-array {v0, v3, v4}, [Ljava/lang/Object;

    .line 351
    .line 352
    .line 353
    move-result-object v0

    .line 354
    const/4 v3, 0x3

    .line 355
    invoke-static {v0, v3}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 356
    .line 357
    .line 358
    move-result-object v0

    .line 359
    invoke-static {v5, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 360
    .line 361
    .line 362
    move-result-object v0

    .line 363
    invoke-virtual {v2, v0, v1}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    .line 364
    .line 365
    .line 366
    sget v0, Lcom/melodix/music/MainActivity;->h0:I

    .line 367
    .line 368
    const-string v0, "Styles updated!"

    .line 369
    .line 370
    invoke-static {v0}, Lxg;->p(Ljava/lang/String;)V

    .line 371
    .line 372
    .line 373
    :cond_7
    iget-boolean p0, p0, Lez0;->j:Z

    .line 374
    .line 375
    if-eqz p0, :cond_9

    .line 376
    .line 377
    sget-boolean p0, Lcom/melodix/music/WebService;->s:Z

    .line 378
    .line 379
    if-nez p0, :cond_8

    .line 380
    .line 381
    sget p0, Lcom/melodix/music/MainActivity;->h0:I

    .line 382
    .line 383
    const-string p0, "Updating web player..."

    .line 384
    .line 385
    invoke-static {p0}, Lxg;->p(Ljava/lang/String;)V

    .line 386
    .line 387
    .line 388
    invoke-virtual {v2}, Landroid/webkit/WebView;->reload()V

    .line 389
    .line 390
    .line 391
    goto :goto_4

    .line 392
    :cond_8
    sget p0, Lcom/melodix/music/MainActivity;->h0:I

    .line 393
    .line 394
    const-string p0, "Updates will apply on next launch."

    .line 395
    .line 396
    invoke-static {p0}, Lxg;->p(Ljava/lang/String;)V

    .line 397
    .line 398
    .line 399
    :cond_9
    :goto_4
    return-void

    .line 400
    :pswitch_a
    iget-object v0, p0, Lo6;->k:Ljava/lang/Object;

    .line 401
    .line 402
    check-cast v0, Lgx;

    .line 403
    .line 404
    iget-object p0, p0, Lo6;->l:Ljava/lang/Object;

    .line 405
    .line 406
    check-cast p0, Landroid/content/Context;

    .line 407
    .line 408
    iget-object v1, v0, Lgx;->a:Landroid/content/SharedPreferences;

    .line 409
    .line 410
    if-nez v1, :cond_a

    .line 411
    .line 412
    if-eqz p0, :cond_a

    .line 413
    .line 414
    const-string v1, "FirebasePerfSharedPrefs"

    .line 415
    .line 416
    invoke-virtual {p0, v1, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 417
    .line 418
    .line 419
    move-result-object p0

    .line 420
    iput-object p0, v0, Lgx;->a:Landroid/content/SharedPreferences;

    .line 421
    .line 422
    :cond_a
    return-void

    .line 423
    :pswitch_b
    iget-object v0, p0, Lo6;->k:Ljava/lang/Object;

    .line 424
    .line 425
    check-cast v0, Ljava/util/concurrent/Callable;

    .line 426
    .line 427
    iget-object p0, p0, Lo6;->l:Ljava/lang/Object;

    .line 428
    .line 429
    check-cast p0, Lbv1;

    .line 430
    .line 431
    iget-object p0, p0, Lbv1;->k:Ljava/lang/Object;

    .line 432
    .line 433
    check-cast p0, Lxw;

    .line 434
    .line 435
    :try_start_2
    invoke-interface {v0}, Ljava/util/concurrent/Callable;->call()Ljava/lang/Object;

    .line 436
    .line 437
    .line 438
    move-result-object v0

    .line 439
    invoke-virtual {p0, v0}, Lr0;->j(Ljava/lang/Object;)Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 440
    .line 441
    .line 442
    goto :goto_5

    .line 443
    :catch_2
    move-exception v0

    .line 444
    invoke-virtual {p0, v0}, Lr0;->k(Ljava/lang/Throwable;)Z

    .line 445
    .line 446
    .line 447
    :goto_5
    return-void

    .line 448
    :pswitch_c
    iget-object v0, p0, Lo6;->k:Ljava/lang/Object;

    .line 449
    .line 450
    check-cast v0, Lht;

    .line 451
    .line 452
    iget-object p0, p0, Lo6;->l:Ljava/lang/Object;

    .line 453
    .line 454
    check-cast p0, Ljava/lang/Runnable;

    .line 455
    .line 456
    iget v1, v0, Lht;->c:I

    .line 457
    .line 458
    invoke-static {v1}, Landroid/os/Process;->setThreadPriority(I)V

    .line 459
    .line 460
    .line 461
    iget-object v0, v0, Lht;->d:Landroid/os/StrictMode$ThreadPolicy;

    .line 462
    .line 463
    if-eqz v0, :cond_b

    .line 464
    .line 465
    invoke-static {v0}, Landroid/os/StrictMode;->setThreadPolicy(Landroid/os/StrictMode$ThreadPolicy;)V

    .line 466
    .line 467
    .line 468
    :cond_b
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 469
    .line 470
    .line 471
    return-void

    .line 472
    :pswitch_d
    iget-object v0, p0, Lo6;->k:Ljava/lang/Object;

    .line 473
    .line 474
    check-cast v0, Lor;

    .line 475
    .line 476
    iget-object p0, p0, Lo6;->l:Ljava/lang/Object;

    .line 477
    .line 478
    check-cast p0, Ljava/lang/String;

    .line 479
    .line 480
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 481
    .line 482
    invoke-virtual {v0, p0, v1}, Lor;->b(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 483
    .line 484
    .line 485
    return-void

    .line 486
    :pswitch_e
    iget-object v0, p0, Lo6;->k:Ljava/lang/Object;

    .line 487
    .line 488
    move-object v2, v0

    .line 489
    check-cast v2, Lmh0;

    .line 490
    .line 491
    iget-object p0, p0, Lo6;->l:Ljava/lang/Object;

    .line 492
    .line 493
    check-cast p0, Llw0;

    .line 494
    .line 495
    monitor-enter v2

    .line 496
    :try_start_3
    iget-object v0, v2, Lmh0;->b:Ljava/util/Set;

    .line 497
    .line 498
    if-nez v0, :cond_c

    .line 499
    .line 500
    iget-object v0, v2, Lmh0;->a:Ljava/util/Set;

    .line 501
    .line 502
    invoke-interface {v0, p0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 503
    .line 504
    .line 505
    goto :goto_6

    .line 506
    :catchall_0
    move-exception v0

    .line 507
    move-object p0, v0

    .line 508
    goto :goto_7

    .line 509
    :cond_c
    iget-object v0, v2, Lmh0;->b:Ljava/util/Set;

    .line 510
    .line 511
    invoke-interface {p0}, Llw0;->get()Ljava/lang/Object;

    .line 512
    .line 513
    .line 514
    move-result-object p0

    .line 515
    invoke-interface {v0, p0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 516
    .line 517
    .line 518
    :goto_6
    monitor-exit v2

    .line 519
    return-void

    .line 520
    :goto_7
    :try_start_4
    monitor-exit v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 521
    throw p0

    .line 522
    :pswitch_f
    iget-object v0, p0, Lo6;->k:Ljava/lang/Object;

    .line 523
    .line 524
    move-object v2, v0

    .line 525
    check-cast v2, Lis0;

    .line 526
    .line 527
    iget-object p0, p0, Lo6;->l:Ljava/lang/Object;

    .line 528
    .line 529
    check-cast p0, Llw0;

    .line 530
    .line 531
    iget-object v0, v2, Lis0;->b:Llw0;

    .line 532
    .line 533
    sget-object v3, Lis0;->d:Llm;

    .line 534
    .line 535
    if-ne v0, v3, :cond_d

    .line 536
    .line 537
    monitor-enter v2

    .line 538
    :try_start_5
    iget-object v0, v2, Lis0;->a:Llw;

    .line 539
    .line 540
    iput-object v1, v2, Lis0;->a:Llw;

    .line 541
    .line 542
    iput-object p0, v2, Lis0;->b:Llw0;

    .line 543
    .line 544
    monitor-exit v2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 545
    invoke-interface {v0, p0}, Llw;->a(Llw0;)V

    .line 546
    .line 547
    .line 548
    goto :goto_8

    .line 549
    :catchall_1
    move-exception v0

    .line 550
    move-object p0, v0

    .line 551
    :try_start_6
    monitor-exit v2
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 552
    throw p0

    .line 553
    :cond_d
    const-string p0, "provide() can be called only once."

    .line 554
    .line 555
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 556
    .line 557
    .line 558
    :goto_8
    return-void

    .line 559
    :pswitch_10
    iget-object v0, p0, Lo6;->k:Ljava/lang/Object;

    .line 560
    .line 561
    check-cast v0, Lcom/google/firebase/perf/metrics/AppStartTrace;

    .line 562
    .line 563
    iget-object p0, p0, Lo6;->l:Ljava/lang/Object;

    .line 564
    .line 565
    check-cast p0, Lid1;

    .line 566
    .line 567
    sget-object v1, Lcom/google/firebase/perf/metrics/AppStartTrace;->F:Loc1;

    .line 568
    .line 569
    iget-object v0, v0, Lcom/google/firebase/perf/metrics/AppStartTrace;->k:Lvd1;

    .line 570
    .line 571
    invoke-virtual {p0}, Lea0;->h()Lia0;

    .line 572
    .line 573
    .line 574
    move-result-object p0

    .line 575
    check-cast p0, Lld1;

    .line 576
    .line 577
    sget-object v1, Lx9;->n:Lx9;

    .line 578
    .line 579
    invoke-virtual {v0, p0, v1}, Lvd1;->c(Lld1;Lx9;)V

    .line 580
    .line 581
    .line 582
    return-void

    .line 583
    :pswitch_11
    iget-object v0, p0, Lo6;->k:Ljava/lang/Object;

    .line 584
    .line 585
    move-object v1, v0

    .line 586
    check-cast v1, Lr80;

    .line 587
    .line 588
    iget-object p0, p0, Lo6;->l:Ljava/lang/Object;

    .line 589
    .line 590
    check-cast p0, Landroid/content/Context;

    .line 591
    .line 592
    :try_start_7
    sget-object v0, Lcom/melodix/music/AppSingleton;->a0:Ljava/lang/String;

    .line 593
    .line 594
    const-string v4, "[,;\\n]+"

    .line 595
    .line 596
    invoke-static {v4}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 597
    .line 598
    .line 599
    move-result-object v4

    .line 600
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 601
    .line 602
    .line 603
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 604
    .line 605
    .line 606
    invoke-virtual {v4, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 607
    .line 608
    .line 609
    move-result-object v4

    .line 610
    invoke-virtual {v4}, Ljava/util/regex/Matcher;->find()Z

    .line 611
    .line 612
    .line 613
    move-result v5

    .line 614
    const/16 v6, 0xa

    .line 615
    .line 616
    if-nez v5, :cond_e

    .line 617
    .line 618
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 619
    .line 620
    .line 621
    move-result-object v0

    .line 622
    invoke-static {v0}, Lk42;->k(Ljava/lang/Object;)Ljava/util/List;

    .line 623
    .line 624
    .line 625
    move-result-object v0

    .line 626
    goto :goto_9

    .line 627
    :cond_e
    new-instance v5, Ljava/util/ArrayList;

    .line 628
    .line 629
    invoke-direct {v5, v6}, Ljava/util/ArrayList;-><init>(I)V

    .line 630
    .line 631
    .line 632
    move v7, v3

    .line 633
    :cond_f
    invoke-virtual {v4}, Ljava/util/regex/Matcher;->start()I

    .line 634
    .line 635
    .line 636
    move-result v8

    .line 637
    invoke-virtual {v0, v7, v8}, Ljava/lang/String;->subSequence(II)Ljava/lang/CharSequence;

    .line 638
    .line 639
    .line 640
    move-result-object v7

    .line 641
    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 642
    .line 643
    .line 644
    move-result-object v7

    .line 645
    invoke-virtual {v5, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 646
    .line 647
    .line 648
    invoke-virtual {v4}, Ljava/util/regex/Matcher;->end()I

    .line 649
    .line 650
    .line 651
    move-result v7

    .line 652
    invoke-virtual {v4}, Ljava/util/regex/Matcher;->find()Z

    .line 653
    .line 654
    .line 655
    move-result v8

    .line 656
    if-nez v8, :cond_f

    .line 657
    .line 658
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 659
    .line 660
    .line 661
    move-result v4

    .line 662
    invoke-virtual {v0, v7, v4}, Ljava/lang/String;->subSequence(II)Ljava/lang/CharSequence;

    .line 663
    .line 664
    .line 665
    move-result-object v0

    .line 666
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 667
    .line 668
    .line 669
    move-result-object v0

    .line 670
    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 671
    .line 672
    .line 673
    move-object v0, v5

    .line 674
    :goto_9
    new-instance v4, Ljava/util/ArrayList;

    .line 675
    .line 676
    invoke-static {v0, v6}, Ldl;->w(Ljava/lang/Iterable;I)I

    .line 677
    .line 678
    .line 679
    move-result v5

    .line 680
    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 681
    .line 682
    .line 683
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 684
    .line 685
    .line 686
    move-result-object v0

    .line 687
    :goto_a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 688
    .line 689
    .line 690
    move-result v5

    .line 691
    if-eqz v5, :cond_10

    .line 692
    .line 693
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 694
    .line 695
    .line 696
    move-result-object v5

    .line 697
    check-cast v5, Ljava/lang/String;

    .line 698
    .line 699
    invoke-static {v5}, Lda1;->Q(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 700
    .line 701
    .line 702
    move-result-object v5

    .line 703
    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 704
    .line 705
    .line 706
    move-result-object v5

    .line 707
    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 708
    .line 709
    .line 710
    goto :goto_a

    .line 711
    :cond_10
    new-instance v5, Ljava/util/ArrayList;

    .line 712
    .line 713
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 714
    .line 715
    .line 716
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    .line 717
    .line 718
    .line 719
    move-result v0

    .line 720
    move v6, v3

    .line 721
    :cond_11
    :goto_b
    if-ge v6, v0, :cond_13

    .line 722
    .line 723
    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 724
    .line 725
    .line 726
    move-result-object v7

    .line 727
    add-int/lit8 v6, v6, 0x1

    .line 728
    .line 729
    move-object v8, v7

    .line 730
    check-cast v8, Ljava/lang/String;

    .line 731
    .line 732
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    .line 733
    .line 734
    .line 735
    move-result v9

    .line 736
    if-lez v9, :cond_11

    .line 737
    .line 738
    const-string v9, "http://"

    .line 739
    .line 740
    invoke-static {v8, v9, v3}, Lla1;->x(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 741
    .line 742
    .line 743
    move-result v9

    .line 744
    if-nez v9, :cond_12

    .line 745
    .line 746
    const-string v9, "https://"

    .line 747
    .line 748
    invoke-static {v8, v9, v3}, Lla1;->x(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 749
    .line 750
    .line 751
    move-result v8

    .line 752
    if-eqz v8, :cond_11

    .line 753
    .line 754
    :cond_12
    invoke-virtual {v5, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 755
    .line 756
    .line 757
    goto :goto_b

    .line 758
    :cond_13
    invoke-virtual {v5}, Ljava/util/ArrayList;->isEmpty()Z

    .line 759
    .line 760
    .line 761
    move-result v0

    .line 762
    if-eqz v0, :cond_14

    .line 763
    .line 764
    if-eqz v1, :cond_1f

    .line 765
    .line 766
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 767
    .line 768
    invoke-interface {v1, p0}, Lr80;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 769
    .line 770
    .line 771
    goto/16 :goto_15

    .line 772
    .line 773
    :cond_14
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    .line 774
    .line 775
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 776
    .line 777
    .line 778
    invoke-static {v0}, Ljava/util/Collections;->newSetFromMap(Ljava/util/Map;)Ljava/util/Set;

    .line 779
    .line 780
    .line 781
    move-result-object v6

    .line 782
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    .line 783
    .line 784
    .line 785
    move-result v4

    .line 786
    move v0, v3

    .line 787
    :goto_c
    if-ge v0, v4, :cond_1d

    .line 788
    .line 789
    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 790
    .line 791
    .line 792
    move-result-object v7

    .line 793
    add-int/lit8 v8, v0, 0x1

    .line 794
    .line 795
    check-cast v7, Ljava/lang/String;
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_4

    .line 796
    .line 797
    :try_start_8
    new-instance v0, Ljava/net/URL;

    .line 798
    .line 799
    invoke-direct {v0, v7}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 800
    .line 801
    .line 802
    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    .line 803
    .line 804
    .line 805
    move-result-object v0

    .line 806
    invoke-static {v0}, Lcom/google/firebase/perf/network/FirebasePerfUrlConnection;->instrument(Ljava/lang/Object;)Ljava/lang/Object;

    .line 807
    .line 808
    .line 809
    move-result-object v0

    .line 810
    check-cast v0, Ljava/net/URLConnection;

    .line 811
    .line 812
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 813
    .line 814
    .line 815
    check-cast v0, Ljava/net/HttpURLConnection;

    .line 816
    .line 817
    const/16 v7, 0x2710

    .line 818
    .line 819
    invoke-virtual {v0, v7}, Ljava/net/URLConnection;->setConnectTimeout(I)V

    .line 820
    .line 821
    .line 822
    invoke-virtual {v0, v7}, Ljava/net/URLConnection;->setReadTimeout(I)V

    .line 823
    .line 824
    .line 825
    invoke-virtual {v0}, Ljava/net/URLConnection;->connect()V

    .line 826
    .line 827
    .line 828
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    .line 829
    .line 830
    .line 831
    move-result v7

    .line 832
    const/16 v9, 0xc8

    .line 833
    .line 834
    if-ne v7, v9, :cond_1c

    .line 835
    .line 836
    invoke-virtual {v0}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    .line 837
    .line 838
    .line 839
    move-result-object v7

    .line 840
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 841
    .line 842
    .line 843
    sget-object v9, Lyj;->a:Ljava/nio/charset/Charset;

    .line 844
    .line 845
    new-instance v10, Ljava/io/InputStreamReader;

    .line 846
    .line 847
    invoke-direct {v10, v7, v9}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    .line 848
    .line 849
    .line 850
    new-instance v7, Ljava/io/BufferedReader;

    .line 851
    .line 852
    const/16 v9, 0x2000

    .line 853
    .line 854
    invoke-direct {v7, v10, v9}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_3

    .line 855
    .line 856
    .line 857
    :try_start_9
    invoke-virtual {v7}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    .line 858
    .line 859
    .line 860
    move-result-object v9

    .line 861
    :goto_d
    if-eqz v9, :cond_1b

    .line 862
    .line 863
    invoke-static {v9}, Lda1;->Q(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 864
    .line 865
    .line 866
    move-result-object v9

    .line 867
    invoke-virtual {v9}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 868
    .line 869
    .line 870
    move-result-object v9

    .line 871
    invoke-virtual {v9}, Ljava/lang/String;->length()I

    .line 872
    .line 873
    .line 874
    move-result v10

    .line 875
    if-lez v10, :cond_1a

    .line 876
    .line 877
    const-string v10, "#"

    .line 878
    .line 879
    invoke-static {v9, v10, v3}, Lla1;->x(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 880
    .line 881
    .line 882
    move-result v10

    .line 883
    if-nez v10, :cond_1a

    .line 884
    .line 885
    const-string v10, "!"

    .line 886
    .line 887
    invoke-static {v9, v10, v3}, Lla1;->x(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 888
    .line 889
    .line 890
    move-result v10

    .line 891
    if-nez v10, :cond_1a

    .line 892
    .line 893
    const-string v10, "||"

    .line 894
    .line 895
    invoke-static {v9, v10, v3}, Lla1;->x(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 896
    .line 897
    .line 898
    move-result v10

    .line 899
    if-eqz v10, :cond_15

    .line 900
    .line 901
    const/4 v10, 0x2

    .line 902
    invoke-virtual {v9, v10}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 903
    .line 904
    .line 905
    move-result-object v9

    .line 906
    goto :goto_e

    .line 907
    :catchall_2
    move-exception v0

    .line 908
    move-object v9, v0

    .line 909
    goto/16 :goto_10

    .line 910
    .line 911
    :cond_15
    :goto_e
    const-string v10, "^"

    .line 912
    .line 913
    invoke-virtual {v9, v10}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 914
    .line 915
    .line 916
    move-result v10

    .line 917
    if-eqz v10, :cond_16

    .line 918
    .line 919
    invoke-virtual {v9}, Ljava/lang/String;->length()I

    .line 920
    .line 921
    .line 922
    move-result v10

    .line 923
    sub-int/2addr v10, v2

    .line 924
    invoke-virtual {v9, v3, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 925
    .line 926
    .line 927
    move-result-object v9

    .line 928
    :cond_16
    const-string v10, "0.0.0.0"

    .line 929
    .line 930
    invoke-static {v9, v10, v3}, Lla1;->x(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 931
    .line 932
    .line 933
    move-result v10

    .line 934
    if-eqz v10, :cond_17

    .line 935
    .line 936
    const/4 v10, 0x7

    .line 937
    invoke-virtual {v9, v10}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 938
    .line 939
    .line 940
    move-result-object v9

    .line 941
    invoke-static {v9}, Lda1;->Q(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 942
    .line 943
    .line 944
    move-result-object v9

    .line 945
    invoke-virtual {v9}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 946
    .line 947
    .line 948
    move-result-object v9

    .line 949
    goto :goto_f

    .line 950
    :cond_17
    const-string v10, "127.0.0.1"

    .line 951
    .line 952
    invoke-static {v9, v10, v3}, Lla1;->x(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 953
    .line 954
    .line 955
    move-result v10

    .line 956
    if-eqz v10, :cond_18

    .line 957
    .line 958
    const/16 v10, 0x9

    .line 959
    .line 960
    invoke-virtual {v9, v10}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 961
    .line 962
    .line 963
    move-result-object v9

    .line 964
    invoke-static {v9}, Lda1;->Q(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 965
    .line 966
    .line 967
    move-result-object v9

    .line 968
    invoke-virtual {v9}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 969
    .line 970
    .line 971
    move-result-object v9

    .line 972
    :cond_18
    :goto_f
    const/16 v10, 0x23

    .line 973
    .line 974
    const/4 v11, 0x6

    .line 975
    invoke-static {v9, v10, v3, v11}, Lda1;->C(Ljava/lang/CharSequence;CII)I

    .line 976
    .line 977
    .line 978
    move-result v10

    .line 979
    const/4 v11, -0x1

    .line 980
    if-eq v10, v11, :cond_19

    .line 981
    .line 982
    invoke-virtual {v9, v3, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 983
    .line 984
    .line 985
    move-result-object v9

    .line 986
    invoke-static {v9}, Lda1;->Q(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 987
    .line 988
    .line 989
    move-result-object v9

    .line 990
    invoke-virtual {v9}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 991
    .line 992
    .line 993
    move-result-object v9

    .line 994
    :cond_19
    invoke-virtual {v9}, Ljava/lang/String;->length()I

    .line 995
    .line 996
    .line 997
    move-result v10

    .line 998
    if-lez v10, :cond_1a

    .line 999
    .line 1000
    sget-object v10, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    .line 1001
    .line 1002
    invoke-virtual {v9, v10}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 1003
    .line 1004
    .line 1005
    move-result-object v9

    .line 1006
    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1007
    .line 1008
    .line 1009
    invoke-interface {v6, v9}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1010
    .line 1011
    .line 1012
    :cond_1a
    invoke-virtual {v7}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    .line 1013
    .line 1014
    .line 1015
    move-result-object v9
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    .line 1016
    goto/16 :goto_d

    .line 1017
    .line 1018
    :cond_1b
    :try_start_a
    invoke-interface {v7}, Ljava/io/Closeable;->close()V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_3

    .line 1019
    .line 1020
    .line 1021
    goto :goto_11

    .line 1022
    :catch_3
    move-exception v0

    .line 1023
    goto :goto_13

    .line 1024
    :goto_10
    :try_start_b
    throw v9
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_3

    .line 1025
    :catchall_3
    move-exception v0

    .line 1026
    :try_start_c
    invoke-static {v7, v9}, Lkn1;->a(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 1027
    .line 1028
    .line 1029
    throw v0

    .line 1030
    :cond_1c
    :goto_11
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_3

    .line 1031
    .line 1032
    .line 1033
    :goto_12
    move v0, v8

    .line 1034
    goto/16 :goto_c

    .line 1035
    .line 1036
    :goto_13
    :try_start_d
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 1037
    .line 1038
    .line 1039
    goto :goto_12

    .line 1040
    :cond_1d
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1041
    .line 1042
    .line 1043
    invoke-interface {v6}, Ljava/util/Collection;->isEmpty()Z

    .line 1044
    .line 1045
    .line 1046
    move-result v0

    .line 1047
    if-nez v0, :cond_1e

    .line 1048
    .line 1049
    new-instance v0, Ljava/io/File;

    .line 1050
    .line 1051
    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 1052
    .line 1053
    .line 1054
    move-result-object p0

    .line 1055
    const-string v4, "adblock_hosts.txt"

    .line 1056
    .line 1057
    invoke-direct {v0, p0, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 1058
    .line 1059
    .line 1060
    const-string v7, "\n"

    .line 1061
    .line 1062
    new-instance v10, Lq4;

    .line 1063
    .line 1064
    invoke-direct {v10, v2}, Lq4;-><init>(I)V

    .line 1065
    .line 1066
    .line 1067
    const/16 v11, 0x1e

    .line 1068
    .line 1069
    const/4 v8, 0x0

    .line 1070
    const/4 v9, 0x0

    .line 1071
    invoke-static/range {v6 .. v11}, Lbl;->B(Ljava/lang/Iterable;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lr80;I)Ljava/lang/String;

    .line 1072
    .line 1073
    .line 1074
    move-result-object p0

    .line 1075
    sget-object v4, Lyj;->a:Ljava/nio/charset/Charset;

    .line 1076
    .line 1077
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1078
    .line 1079
    .line 1080
    new-instance v5, Ljava/io/FileOutputStream;

    .line 1081
    .line 1082
    invoke-direct {v5, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_4

    .line 1083
    .line 1084
    .line 1085
    :try_start_e
    invoke-static {v5, p0, v4}, Ldl1;->s(Ljava/io/FileOutputStream;Ljava/lang/String;Ljava/nio/charset/Charset;)V
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_4

    .line 1086
    .line 1087
    .line 1088
    :try_start_f
    invoke-virtual {v5}, Ljava/io/FileOutputStream;->close()V

    .line 1089
    .line 1090
    .line 1091
    sget p0, Lcom/melodix/music/AppSingleton;->j:I

    .line 1092
    .line 1093
    invoke-static {}, Lm9;->j()V
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_f} :catch_4

    .line 1094
    .line 1095
    .line 1096
    goto :goto_14

    .line 1097
    :catchall_4
    move-exception v0

    .line 1098
    move-object p0, v0

    .line 1099
    :try_start_10
    throw p0
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_5

    .line 1100
    :catchall_5
    move-exception v0

    .line 1101
    :try_start_11
    invoke-static {v5, p0}, Lkn1;->a(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 1102
    .line 1103
    .line 1104
    throw v0
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_11} :catch_4

    .line 1105
    :catch_4
    :cond_1e
    move v2, v3

    .line 1106
    :goto_14
    if-eqz v1, :cond_1f

    .line 1107
    .line 1108
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 1109
    .line 1110
    .line 1111
    move-result-object p0

    .line 1112
    invoke-interface {v1, p0}, Lr80;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1113
    .line 1114
    .line 1115
    :cond_1f
    :goto_15
    return-void

    .line 1116
    :pswitch_12
    iget-object v0, p0, Lo6;->k:Ljava/lang/Object;

    .line 1117
    .line 1118
    move-object v1, v0

    .line 1119
    check-cast v1, Lp6;

    .line 1120
    .line 1121
    iget-object p0, p0, Lo6;->l:Ljava/lang/Object;

    .line 1122
    .line 1123
    check-cast p0, Ljava/lang/Runnable;

    .line 1124
    .line 1125
    :try_start_12
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_6

    .line 1126
    .line 1127
    .line 1128
    invoke-virtual {v1}, Lp6;->a()V

    .line 1129
    .line 1130
    .line 1131
    return-void

    .line 1132
    :catchall_6
    move-exception v0

    .line 1133
    move-object p0, v0

    .line 1134
    invoke-virtual {v1}, Lp6;->a()V

    .line 1135
    .line 1136
    .line 1137
    throw p0

    .line 1138
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
