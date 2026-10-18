.class public final synthetic Le61;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ltt0;


# instance fields
.field public final synthetic j:I

.field public final synthetic k:Lcom/melodix/music/SettingsActivity$a;

.field public final synthetic l:Landroidx/preference/Preference;


# direct methods
.method public synthetic constructor <init>(Lcom/melodix/music/SettingsActivity$a;Landroidx/preference/Preference;I)V
    .locals 0

    .line 1
    iput p3, p0, Le61;->j:I

    .line 2
    .line 3
    iput-object p1, p0, Le61;->k:Lcom/melodix/music/SettingsActivity$a;

    .line 4
    .line 5
    iput-object p2, p0, Le61;->l:Landroidx/preference/Preference;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final b(Landroidx/preference/Preference;)V
    .locals 38

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget v1, v0, Le61;->j:I

    .line 4
    .line 5
    const-string v8, ""

    .line 6
    .line 7
    const-string v9, "#181818"

    .line 8
    .line 9
    const-string v10, "#00C8F0"

    .line 10
    .line 11
    const-string v12, "#282828"

    .line 12
    .line 13
    const/16 v14, 0x10

    .line 14
    .line 15
    const-string v13, "Save"

    .line 16
    .line 17
    const-string v2, "Cancel"

    .line 18
    .line 19
    const/4 v11, 0x0

    .line 20
    const/4 v3, 0x1

    .line 21
    packed-switch v1, :pswitch_data_0

    .line 22
    .line 23
    .line 24
    const-string v1, "PROXY_OVERRIDE"

    .line 25
    .line 26
    invoke-static {v1}, Ljj1;->b(Ljava/lang/String;)Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    iget-object v4, v0, Le61;->k:Lcom/melodix/music/SettingsActivity$a;

    .line 31
    .line 32
    if-nez v1, :cond_0

    .line 33
    .line 34
    invoke-virtual {v4}, Lh70;->H()Landroid/content/Context;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    const v1, 0x7f110104

    .line 39
    .line 40
    .line 41
    invoke-virtual {v4, v1}, Lh70;->m(I)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-static {v0, v1, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 50
    .line 51
    .line 52
    goto/16 :goto_3

    .line 53
    .line 54
    :cond_0
    invoke-virtual {v4}, Lh70;->H()Landroid/content/Context;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    const v5, 0x7f0c0033

    .line 63
    .line 64
    .line 65
    invoke-virtual {v3, v5, v11}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 66
    .line 67
    .line 68
    move-result-object v3

    .line 69
    const v5, 0x7f0900ae

    .line 70
    .line 71
    .line 72
    invoke-virtual {v3, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 73
    .line 74
    .line 75
    move-result-object v5

    .line 76
    check-cast v5, Landroid/widget/Spinner;

    .line 77
    .line 78
    const v9, 0x7f09018d

    .line 79
    .line 80
    .line 81
    invoke-virtual {v3, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 82
    .line 83
    .line 84
    move-result-object v9

    .line 85
    const v10, 0x7f0900ac

    .line 86
    .line 87
    .line 88
    invoke-virtual {v3, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 89
    .line 90
    .line 91
    move-result-object v10

    .line 92
    check-cast v10, Landroid/widget/EditText;

    .line 93
    .line 94
    const v12, 0x7f0900ad

    .line 95
    .line 96
    .line 97
    invoke-virtual {v3, v12}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 98
    .line 99
    .line 100
    move-result-object v12

    .line 101
    check-cast v12, Landroid/widget/EditText;

    .line 102
    .line 103
    const-string v14, "https"

    .line 104
    .line 105
    const-string v15, "socks5"

    .line 106
    .line 107
    const-string v11, "none"

    .line 108
    .line 109
    const-string v6, "http"

    .line 110
    .line 111
    filled-new-array {v11, v6, v14, v15}, [Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v6

    .line 115
    const v14, 0x7f110108

    .line 116
    .line 117
    .line 118
    invoke-virtual {v4, v14}, Lh70;->m(I)Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v14

    .line 122
    const v15, 0x7f110106

    .line 123
    .line 124
    .line 125
    invoke-virtual {v4, v15}, Lh70;->m(I)Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v15

    .line 129
    const v7, 0x7f110107

    .line 130
    .line 131
    .line 132
    invoke-virtual {v4, v7}, Lh70;->m(I)Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object v7

    .line 136
    move-object/from16 v25, v13

    .line 137
    .line 138
    const v13, 0x7f110109

    .line 139
    .line 140
    .line 141
    invoke-virtual {v4, v13}, Lh70;->m(I)Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object v13

    .line 145
    filled-new-array {v14, v15, v7, v13}, [Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object v7

    .line 149
    new-instance v13, Landroid/widget/ArrayAdapter;

    .line 150
    .line 151
    const v14, 0x1090008

    .line 152
    .line 153
    .line 154
    invoke-direct {v13, v1, v14, v7}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    .line 155
    .line 156
    .line 157
    const v7, 0x1090009

    .line 158
    .line 159
    .line 160
    invoke-virtual {v13, v7}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    .line 161
    .line 162
    .line 163
    invoke-virtual {v5, v13}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 164
    .line 165
    .line 166
    sget v7, Lcom/melodix/music/AppSingleton;->j:I

    .line 167
    .line 168
    invoke-static {}, Lm9;->e()Landroid/content/SharedPreferences;

    .line 169
    .line 170
    .line 171
    move-result-object v7

    .line 172
    const-string v13, "ProxyType"

    .line 173
    .line 174
    invoke-interface {v7, v13, v11}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object v7

    .line 178
    if-nez v7, :cond_1

    .line 179
    .line 180
    move-object v7, v11

    .line 181
    :cond_1
    invoke-static {v6, v7}, Lia;->R([Ljava/lang/Object;Ljava/lang/Object;)I

    .line 182
    .line 183
    .line 184
    move-result v13

    .line 185
    if-ltz v13, :cond_2

    .line 186
    .line 187
    goto :goto_0

    .line 188
    :cond_2
    const/4 v13, 0x0

    .line 189
    :goto_0
    invoke-virtual {v5, v13}, Landroid/widget/AdapterView;->setSelection(I)V

    .line 190
    .line 191
    .line 192
    invoke-static {}, Lm9;->e()Landroid/content/SharedPreferences;

    .line 193
    .line 194
    .line 195
    move-result-object v13

    .line 196
    const-string v14, "ProxyHost"

    .line 197
    .line 198
    invoke-interface {v13, v14, v8}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 199
    .line 200
    .line 201
    move-result-object v13

    .line 202
    invoke-virtual {v10, v13}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 203
    .line 204
    .line 205
    invoke-static {}, Lm9;->e()Landroid/content/SharedPreferences;

    .line 206
    .line 207
    .line 208
    move-result-object v13

    .line 209
    const-string v14, "ProxyPort"

    .line 210
    .line 211
    invoke-interface {v13, v14, v8}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 212
    .line 213
    .line 214
    move-result-object v8

    .line 215
    if-eqz v8, :cond_4

    .line 216
    .line 217
    invoke-static {v8}, Lda1;->F(Ljava/lang/CharSequence;)Z

    .line 218
    .line 219
    .line 220
    move-result v13

    .line 221
    if-eqz v13, :cond_3

    .line 222
    .line 223
    goto :goto_1

    .line 224
    :cond_3
    const-string v13, "0"

    .line 225
    .line 226
    invoke-virtual {v8, v13}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 227
    .line 228
    .line 229
    move-result v13

    .line 230
    if-nez v13, :cond_4

    .line 231
    .line 232
    invoke-virtual {v12, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 233
    .line 234
    .line 235
    :cond_4
    :goto_1
    invoke-virtual {v7, v11}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 236
    .line 237
    .line 238
    move-result v7

    .line 239
    if-eqz v7, :cond_5

    .line 240
    .line 241
    const/16 v13, 0x8

    .line 242
    .line 243
    goto :goto_2

    .line 244
    :cond_5
    const/4 v13, 0x0

    .line 245
    :goto_2
    invoke-virtual {v9, v13}, Landroid/view/View;->setVisibility(I)V

    .line 246
    .line 247
    .line 248
    new-instance v7, Lcom/melodix/music/b;

    .line 249
    .line 250
    invoke-direct {v7, v9}, Lcom/melodix/music/b;-><init>(Landroid/view/View;)V

    .line 251
    .line 252
    .line 253
    invoke-virtual {v5, v7}, Landroid/widget/AdapterView;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 254
    .line 255
    .line 256
    new-instance v7, Lf4;

    .line 257
    .line 258
    invoke-direct {v7, v1}, Lf4;-><init>(Landroid/content/Context;)V

    .line 259
    .line 260
    .line 261
    const v8, 0x7f1100b7

    .line 262
    .line 263
    .line 264
    invoke-virtual {v4, v8}, Lh70;->m(I)Ljava/lang/String;

    .line 265
    .line 266
    .line 267
    move-result-object v8

    .line 268
    iget-object v9, v7, Lf4;->c:Ljava/lang/Object;

    .line 269
    .line 270
    check-cast v9, Lb4;

    .line 271
    .line 272
    iput-object v8, v9, Lb4;->d:Ljava/lang/CharSequence;

    .line 273
    .line 274
    iput-object v3, v9, Lb4;->r:Landroid/view/View;

    .line 275
    .line 276
    const/4 v3, 0x0

    .line 277
    invoke-virtual {v7, v2, v3}, Lf4;->e(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 278
    .line 279
    .line 280
    new-instance v17, Lz51;

    .line 281
    .line 282
    iget-object v0, v0, Le61;->l:Landroidx/preference/Preference;

    .line 283
    .line 284
    move-object/from16 v24, v0

    .line 285
    .line 286
    move-object/from16 v22, v1

    .line 287
    .line 288
    move-object/from16 v23, v4

    .line 289
    .line 290
    move-object/from16 v19, v5

    .line 291
    .line 292
    move-object/from16 v18, v6

    .line 293
    .line 294
    move-object/from16 v20, v10

    .line 295
    .line 296
    move-object/from16 v21, v12

    .line 297
    .line 298
    invoke-direct/range {v17 .. v24}, Lz51;-><init>([Ljava/lang/String;Landroid/widget/Spinner;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/content/Context;Lcom/melodix/music/SettingsActivity$a;Landroidx/preference/Preference;)V

    .line 299
    .line 300
    .line 301
    move-object/from16 v0, v17

    .line 302
    .line 303
    move-object/from16 v1, v25

    .line 304
    .line 305
    invoke-virtual {v7, v1, v0}, Lf4;->f(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 306
    .line 307
    .line 308
    invoke-virtual {v7}, Lf4;->g()V

    .line 309
    .line 310
    .line 311
    :goto_3
    return-void

    .line 312
    :pswitch_0
    move-object v1, v13

    .line 313
    iget-object v12, v0, Le61;->k:Lcom/melodix/music/SettingsActivity$a;

    .line 314
    .line 315
    invoke-virtual {v12}, Lh70;->H()Landroid/content/Context;

    .line 316
    .line 317
    .line 318
    move-result-object v6

    .line 319
    invoke-static {v6}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 320
    .line 321
    .line 322
    move-result-object v7

    .line 323
    const v8, 0x7f0c0030

    .line 324
    .line 325
    .line 326
    const/4 v9, 0x0

    .line 327
    invoke-virtual {v7, v8, v9}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 328
    .line 329
    .line 330
    move-result-object v7

    .line 331
    const v8, 0x7f0900a7

    .line 332
    .line 333
    .line 334
    invoke-virtual {v7, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 335
    .line 336
    .line 337
    move-result-object v8

    .line 338
    move-object v9, v8

    .line 339
    check-cast v9, Landroid/widget/Spinner;

    .line 340
    .line 341
    const v8, 0x7f0900ab

    .line 342
    .line 343
    .line 344
    invoke-virtual {v7, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 345
    .line 346
    .line 347
    move-result-object v8

    .line 348
    const v10, 0x7f0900af

    .line 349
    .line 350
    .line 351
    invoke-virtual {v7, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 352
    .line 353
    .line 354
    move-result-object v10

    .line 355
    move-object v11, v10

    .line 356
    check-cast v11, Landroid/widget/LinearLayout;

    .line 357
    .line 358
    const v10, 0x7f0900a9

    .line 359
    .line 360
    .line 361
    invoke-virtual {v7, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 362
    .line 363
    .line 364
    move-result-object v10

    .line 365
    move-object v13, v10

    .line 366
    check-cast v13, Landroid/widget/Button;

    .line 367
    .line 368
    const v10, 0x7f0900a8

    .line 369
    .line 370
    .line 371
    invoke-virtual {v7, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 372
    .line 373
    .line 374
    move-result-object v10

    .line 375
    move-object v15, v10

    .line 376
    check-cast v15, Landroid/widget/Button;

    .line 377
    .line 378
    new-instance v10, Landroid/widget/ArrayAdapter;

    .line 379
    .line 380
    invoke-virtual {v12}, Lh70;->l()Landroid/content/res/Resources;

    .line 381
    .line 382
    .line 383
    move-result-object v14

    .line 384
    const/high16 v4, 0x7f030000

    .line 385
    .line 386
    invoke-virtual {v14, v4}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    .line 387
    .line 388
    .line 389
    move-result-object v4

    .line 390
    const v14, 0x1090008

    .line 391
    .line 392
    .line 393
    invoke-direct {v10, v6, v14, v4}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    .line 394
    .line 395
    .line 396
    const v4, 0x1090009

    .line 397
    .line 398
    .line 399
    invoke-virtual {v10, v4}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    .line 400
    .line 401
    .line 402
    invoke-virtual {v9, v10}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 403
    .line 404
    .line 405
    invoke-virtual {v12}, Lh70;->l()Landroid/content/res/Resources;

    .line 406
    .line 407
    .line 408
    move-result-object v4

    .line 409
    const v10, 0x7f030001

    .line 410
    .line 411
    .line 412
    invoke-virtual {v4, v10}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    .line 413
    .line 414
    .line 415
    move-result-object v10

    .line 416
    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 417
    .line 418
    .line 419
    sget v4, Lcom/melodix/music/AppSingleton;->j:I

    .line 420
    .line 421
    invoke-static {}, Lm9;->e()Landroid/content/SharedPreferences;

    .line 422
    .line 423
    .line 424
    move-result-object v4

    .line 425
    const-string v14, "AdBlockMode"

    .line 426
    .line 427
    const-string v3, "legacy"

    .line 428
    .line 429
    invoke-interface {v4, v14, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 430
    .line 431
    .line 432
    move-result-object v3

    .line 433
    invoke-static {v10, v3}, Lia;->R([Ljava/lang/Object;Ljava/lang/Object;)I

    .line 434
    .line 435
    .line 436
    move-result v3

    .line 437
    if-ltz v3, :cond_6

    .line 438
    .line 439
    goto :goto_4

    .line 440
    :cond_6
    const/4 v3, 0x0

    .line 441
    :goto_4
    invoke-virtual {v9, v3}, Landroid/widget/AdapterView;->setSelection(I)V

    .line 442
    .line 443
    .line 444
    new-instance v3, Ljava/util/ArrayList;

    .line 445
    .line 446
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 447
    .line 448
    .line 449
    invoke-static {}, Lm9;->e()Landroid/content/SharedPreferences;

    .line 450
    .line 451
    .line 452
    move-result-object v4

    .line 453
    const-string v14, "AdBlockListUrl"

    .line 454
    .line 455
    const-string v5, "https://raw.githubusercontent.com/Souxch06/Melodix/main/Melodix-v1.2.2-3d2c473/assets/adblock_hosts.txt"

    .line 456
    .line 457
    invoke-interface {v4, v14, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 458
    .line 459
    .line 460
    move-result-object v4

    .line 461
    if-nez v4, :cond_7

    .line 462
    .line 463
    move-object v4, v5

    .line 464
    :cond_7
    const-string v14, "[,;\\n]+"

    .line 465
    .line 466
    invoke-static {v14}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 467
    .line 468
    .line 469
    move-result-object v14

    .line 470
    invoke-virtual {v14}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 471
    .line 472
    .line 473
    invoke-virtual {v14, v4}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 474
    .line 475
    .line 476
    move-result-object v26

    .line 477
    invoke-virtual/range {v26 .. v26}, Ljava/util/regex/Matcher;->find()Z

    .line 478
    .line 479
    .line 480
    move-result v14

    .line 481
    if-nez v14, :cond_8

    .line 482
    .line 483
    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 484
    .line 485
    .line 486
    move-result-object v4

    .line 487
    invoke-static {v4}, Lk42;->k(Ljava/lang/Object;)Ljava/util/List;

    .line 488
    .line 489
    .line 490
    move-result-object v4

    .line 491
    move-object/from16 v27, v1

    .line 492
    .line 493
    goto :goto_6

    .line 494
    :cond_8
    new-instance v14, Ljava/util/ArrayList;

    .line 495
    .line 496
    move-object/from16 v27, v1

    .line 497
    .line 498
    const/16 v1, 0xa

    .line 499
    .line 500
    invoke-direct {v14, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 501
    .line 502
    .line 503
    const/4 v1, 0x0

    .line 504
    :goto_5
    invoke-virtual/range {v26 .. v26}, Ljava/util/regex/Matcher;->start()I

    .line 505
    .line 506
    .line 507
    move-result v0

    .line 508
    invoke-virtual {v4, v1, v0}, Ljava/lang/String;->subSequence(II)Ljava/lang/CharSequence;

    .line 509
    .line 510
    .line 511
    move-result-object v0

    .line 512
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 513
    .line 514
    .line 515
    move-result-object v0

    .line 516
    invoke-virtual {v14, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 517
    .line 518
    .line 519
    invoke-virtual/range {v26 .. v26}, Ljava/util/regex/Matcher;->end()I

    .line 520
    .line 521
    .line 522
    move-result v1

    .line 523
    invoke-virtual/range {v26 .. v26}, Ljava/util/regex/Matcher;->find()Z

    .line 524
    .line 525
    .line 526
    move-result v0

    .line 527
    if-nez v0, :cond_f

    .line 528
    .line 529
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    .line 530
    .line 531
    .line 532
    move-result v0

    .line 533
    invoke-virtual {v4, v1, v0}, Ljava/lang/String;->subSequence(II)Ljava/lang/CharSequence;

    .line 534
    .line 535
    .line 536
    move-result-object v0

    .line 537
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 538
    .line 539
    .line 540
    move-result-object v0

    .line 541
    invoke-virtual {v14, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 542
    .line 543
    .line 544
    move-object v4, v14

    .line 545
    :goto_6
    new-instance v0, Ljava/util/ArrayList;

    .line 546
    .line 547
    const/16 v1, 0xa

    .line 548
    .line 549
    invoke-static {v4, v1}, Ldl;->w(Ljava/lang/Iterable;I)I

    .line 550
    .line 551
    .line 552
    move-result v1

    .line 553
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 554
    .line 555
    .line 556
    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 557
    .line 558
    .line 559
    move-result-object v1

    .line 560
    :goto_7
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 561
    .line 562
    .line 563
    move-result v4

    .line 564
    if-eqz v4, :cond_9

    .line 565
    .line 566
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 567
    .line 568
    .line 569
    move-result-object v4

    .line 570
    check-cast v4, Ljava/lang/String;

    .line 571
    .line 572
    invoke-static {v4}, Lda1;->Q(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 573
    .line 574
    .line 575
    move-result-object v4

    .line 576
    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 577
    .line 578
    .line 579
    move-result-object v4

    .line 580
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 581
    .line 582
    .line 583
    goto :goto_7

    .line 584
    :cond_9
    new-instance v1, Ljava/util/ArrayList;

    .line 585
    .line 586
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 587
    .line 588
    .line 589
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 590
    .line 591
    .line 592
    move-result v4

    .line 593
    const/4 v14, 0x0

    .line 594
    :goto_8
    if-ge v14, v4, :cond_b

    .line 595
    .line 596
    move/from16 p1, v4

    .line 597
    .line 598
    invoke-virtual {v0, v14}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 599
    .line 600
    .line 601
    move-result-object v4

    .line 602
    add-int/lit8 v14, v14, 0x1

    .line 603
    .line 604
    move-object/from16 v16, v4

    .line 605
    .line 606
    check-cast v16, Ljava/lang/String;

    .line 607
    .line 608
    invoke-virtual/range {v16 .. v16}, Ljava/lang/String;->length()I

    .line 609
    .line 610
    .line 611
    move-result v16

    .line 612
    if-lez v16, :cond_a

    .line 613
    .line 614
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 615
    .line 616
    .line 617
    :cond_a
    move/from16 v4, p1

    .line 618
    .line 619
    goto :goto_8

    .line 620
    :cond_b
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 621
    .line 622
    .line 623
    move-result v0

    .line 624
    if-nez v0, :cond_c

    .line 625
    .line 626
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 627
    .line 628
    .line 629
    move-result v0

    .line 630
    const/4 v4, 0x0

    .line 631
    :goto_9
    if-ge v4, v0, :cond_d

    .line 632
    .line 633
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 634
    .line 635
    .line 636
    move-result-object v5

    .line 637
    add-int/lit8 v4, v4, 0x1

    .line 638
    .line 639
    check-cast v5, Ljava/lang/String;

    .line 640
    .line 641
    invoke-static {v6, v3, v11, v5}, Lcom/melodix/music/SettingsActivity$a;->P(Landroid/content/Context;Ljava/util/ArrayList;Landroid/widget/LinearLayout;Ljava/lang/String;)V

    .line 642
    .line 643
    .line 644
    goto :goto_9

    .line 645
    :cond_c
    invoke-static {v6, v3, v11, v5}, Lcom/melodix/music/SettingsActivity$a;->P(Landroid/content/Context;Ljava/util/ArrayList;Landroid/widget/LinearLayout;Ljava/lang/String;)V

    .line 646
    .line 647
    .line 648
    :cond_d
    if-eqz v13, :cond_e

    .line 649
    .line 650
    new-instance v0, Lw51;

    .line 651
    .line 652
    const/4 v1, 0x1

    .line 653
    invoke-direct {v0, v6, v3, v11, v1}, Lw51;-><init>(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/Object;I)V

    .line 654
    .line 655
    .line 656
    invoke-virtual {v13, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 657
    .line 658
    .line 659
    :cond_e
    new-instance v0, Lcom/melodix/music/c;

    .line 660
    .line 661
    invoke-direct {v0, v8, v10}, Lcom/melodix/music/c;-><init>(Landroid/view/View;[Ljava/lang/String;)V

    .line 662
    .line 663
    .line 664
    invoke-virtual {v9, v0}, Landroid/widget/AdapterView;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 665
    .line 666
    .line 667
    new-instance v0, Lw51;

    .line 668
    .line 669
    const/4 v1, 0x2

    .line 670
    invoke-direct {v0, v6, v3, v12, v1}, Lw51;-><init>(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/Object;I)V

    .line 671
    .line 672
    .line 673
    invoke-virtual {v15, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 674
    .line 675
    .line 676
    new-instance v0, Lf4;

    .line 677
    .line 678
    invoke-direct {v0, v6}, Lf4;-><init>(Landroid/content/Context;)V

    .line 679
    .line 680
    .line 681
    iget-object v1, v0, Lf4;->c:Ljava/lang/Object;

    .line 682
    .line 683
    check-cast v1, Lb4;

    .line 684
    .line 685
    const-string v4, "Ad Blocker Settings"

    .line 686
    .line 687
    iput-object v4, v1, Lb4;->d:Ljava/lang/CharSequence;

    .line 688
    .line 689
    iput-object v7, v1, Lb4;->r:Landroid/view/View;

    .line 690
    .line 691
    const/4 v1, 0x0

    .line 692
    invoke-virtual {v0, v2, v1}, Lf4;->e(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 693
    .line 694
    .line 695
    new-instance v8, La61;

    .line 696
    .line 697
    const/4 v14, 0x0

    .line 698
    move-object/from16 v1, p0

    .line 699
    .line 700
    iget-object v13, v1, Le61;->l:Landroidx/preference/Preference;

    .line 701
    .line 702
    move-object v11, v3

    .line 703
    invoke-direct/range {v8 .. v14}, La61;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/io/Serializable;Lcom/melodix/music/SettingsActivity$a;Landroidx/preference/Preference;I)V

    .line 704
    .line 705
    .line 706
    move-object/from16 v3, v27

    .line 707
    .line 708
    invoke-virtual {v0, v3, v8}, Lf4;->f(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 709
    .line 710
    .line 711
    invoke-virtual {v0}, Lf4;->g()V

    .line 712
    .line 713
    .line 714
    return-void

    .line 715
    :cond_f
    move-object/from16 v0, p0

    .line 716
    .line 717
    move-object/from16 v29, v3

    .line 718
    .line 719
    move-object/from16 v3, v27

    .line 720
    .line 721
    move-object/from16 v3, v29

    .line 722
    .line 723
    goto/16 :goto_5

    .line 724
    .line 725
    :pswitch_1
    iget-object v1, v0, Le61;->k:Lcom/melodix/music/SettingsActivity$a;

    .line 726
    .line 727
    invoke-virtual {v1}, Lh70;->H()Landroid/content/Context;

    .line 728
    .line 729
    .line 730
    move-result-object v2

    .line 731
    invoke-static {v10}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 732
    .line 733
    .line 734
    move-result v3

    .line 735
    invoke-static {v2}, Lbh;->s(Landroid/content/Context;)Ljava/util/List;

    .line 736
    .line 737
    .line 738
    move-result-object v4

    .line 739
    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    .line 740
    .line 741
    .line 742
    move-result v5

    .line 743
    if-eqz v5, :cond_10

    .line 744
    .line 745
    const-string v0, "No saved profiles to manage."

    .line 746
    .line 747
    const/4 v1, 0x0

    .line 748
    invoke-static {v2, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    .line 749
    .line 750
    .line 751
    move-result-object v0

    .line 752
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 753
    .line 754
    .line 755
    goto/16 :goto_c

    .line 756
    .line 757
    :cond_10
    new-instance v5, Landroid/widget/ScrollView;

    .line 758
    .line 759
    invoke-direct {v5, v2}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    .line 760
    .line 761
    .line 762
    new-instance v6, Landroid/widget/LinearLayout;

    .line 763
    .line 764
    invoke-direct {v6, v2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 765
    .line 766
    .line 767
    const/4 v7, 0x1

    .line 768
    invoke-virtual {v6, v7}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 769
    .line 770
    .line 771
    const/16 v7, 0x20

    .line 772
    .line 773
    invoke-virtual {v6, v7, v14, v7, v14}, Landroid/view/View;->setPadding(IIII)V

    .line 774
    .line 775
    .line 776
    invoke-virtual {v5, v6}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    .line 777
    .line 778
    .line 779
    new-instance v35, Lhz0;

    .line 780
    .line 781
    invoke-direct/range {v35 .. v35}, Ljava/lang/Object;-><init>()V

    .line 782
    .line 783
    .line 784
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 785
    .line 786
    .line 787
    move-result-object v4

    .line 788
    :goto_a
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 789
    .line 790
    .line 791
    move-result v7

    .line 792
    if-eqz v7, :cond_12

    .line 793
    .line 794
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 795
    .line 796
    .line 797
    move-result-object v7

    .line 798
    check-cast v7, Le2;

    .line 799
    .line 800
    new-instance v8, Landroid/widget/LinearLayout;

    .line 801
    .line 802
    invoke-direct {v8, v2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 803
    .line 804
    .line 805
    const/4 v10, 0x0

    .line 806
    invoke-virtual {v8, v10}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 807
    .line 808
    .line 809
    invoke-virtual {v8, v14}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 810
    .line 811
    .line 812
    new-instance v10, Landroid/graphics/drawable/GradientDrawable;

    .line 813
    .line 814
    invoke-direct {v10}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 815
    .line 816
    .line 817
    invoke-static {v9}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 818
    .line 819
    .line 820
    move-result v11

    .line 821
    invoke-virtual {v10, v11}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 822
    .line 823
    .line 824
    const/high16 v11, 0x41c00000    # 24.0f

    .line 825
    .line 826
    invoke-virtual {v10, v11}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 827
    .line 828
    .line 829
    invoke-virtual {v8, v10}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 830
    .line 831
    .line 832
    const/16 v10, 0x18

    .line 833
    .line 834
    const/16 v11, 0x20

    .line 835
    .line 836
    invoke-virtual {v8, v11, v10, v10, v10}, Landroid/view/View;->setPadding(IIII)V

    .line 837
    .line 838
    .line 839
    new-instance v10, Landroid/widget/LinearLayout$LayoutParams;

    .line 840
    .line 841
    const/4 v11, -0x2

    .line 842
    const/4 v13, -0x1

    .line 843
    invoke-direct {v10, v13, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 844
    .line 845
    .line 846
    const/16 v11, 0x8

    .line 847
    .line 848
    const/4 v13, 0x0

    .line 849
    invoke-virtual {v10, v13, v11, v13, v14}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 850
    .line 851
    .line 852
    invoke-virtual {v8, v10}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 853
    .line 854
    .line 855
    new-instance v10, Landroid/widget/ImageView;

    .line 856
    .line 857
    invoke-direct {v10, v2}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 858
    .line 859
    .line 860
    const v11, 0x7f0800b3

    .line 861
    .line 862
    .line 863
    invoke-virtual {v10, v11}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 864
    .line 865
    .line 866
    const-string v11, "#B3FFFFFF"

    .line 867
    .line 868
    invoke-static {v11}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 869
    .line 870
    .line 871
    move-result v15

    .line 872
    invoke-virtual {v10, v15}, Landroid/widget/ImageView;->setColorFilter(I)V

    .line 873
    .line 874
    .line 875
    new-instance v15, Landroid/widget/LinearLayout$LayoutParams;

    .line 876
    .line 877
    const/16 v14, 0x48

    .line 878
    .line 879
    invoke-direct {v15, v14, v14}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 880
    .line 881
    .line 882
    const/16 v14, 0x18

    .line 883
    .line 884
    invoke-virtual {v15, v13, v13, v14, v13}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 885
    .line 886
    .line 887
    invoke-virtual {v10, v15}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 888
    .line 889
    .line 890
    invoke-virtual {v8, v10}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 891
    .line 892
    .line 893
    new-instance v10, Landroid/widget/LinearLayout;

    .line 894
    .line 895
    invoke-direct {v10, v2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 896
    .line 897
    .line 898
    const/4 v14, 0x1

    .line 899
    invoke-virtual {v10, v14}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 900
    .line 901
    .line 902
    new-instance v15, Landroid/widget/LinearLayout$LayoutParams;

    .line 903
    .line 904
    const/high16 v14, 0x3f800000    # 1.0f

    .line 905
    .line 906
    move-object/from16 v36, v1

    .line 907
    .line 908
    const/4 v1, -0x2

    .line 909
    invoke-direct {v15, v13, v1, v14}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 910
    .line 911
    .line 912
    invoke-virtual {v10, v15}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 913
    .line 914
    .line 915
    new-instance v1, Landroid/widget/TextView;

    .line 916
    .line 917
    invoke-direct {v1, v2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 918
    .line 919
    .line 920
    iget-object v13, v7, Le2;->b:Ljava/lang/String;

    .line 921
    .line 922
    invoke-virtual {v1, v13}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 923
    .line 924
    .line 925
    const/4 v13, -0x1

    .line 926
    invoke-virtual {v1, v13}, Landroid/widget/TextView;->setTextColor(I)V

    .line 927
    .line 928
    .line 929
    const/high16 v13, 0x41800000    # 16.0f

    .line 930
    .line 931
    invoke-virtual {v1, v13}, Landroid/widget/TextView;->setTextSize(F)V

    .line 932
    .line 933
    .line 934
    const/4 v13, 0x0

    .line 935
    const/4 v14, 0x1

    .line 936
    invoke-virtual {v1, v13, v14}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 937
    .line 938
    .line 939
    invoke-virtual {v10, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 940
    .line 941
    .line 942
    new-instance v1, Landroid/widget/TextView;

    .line 943
    .line 944
    invoke-direct {v1, v2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 945
    .line 946
    .line 947
    iget-object v13, v7, Le2;->c:Ljava/lang/String;

    .line 948
    .line 949
    invoke-static {v13}, Lda1;->F(Ljava/lang/CharSequence;)Z

    .line 950
    .line 951
    .line 952
    move-result v13

    .line 953
    if-nez v13, :cond_11

    .line 954
    .line 955
    iget-object v13, v7, Le2;->c:Ljava/lang/String;

    .line 956
    .line 957
    const-string v14, "@"

    .line 958
    .line 959
    invoke-virtual {v14, v13}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 960
    .line 961
    .line 962
    move-result-object v13

    .line 963
    goto :goto_b

    .line 964
    :cond_11
    const-string v13, "Saved Profile"

    .line 965
    .line 966
    :goto_b
    invoke-virtual {v1, v13}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 967
    .line 968
    .line 969
    invoke-static {v11}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 970
    .line 971
    .line 972
    move-result v11

    .line 973
    invoke-virtual {v1, v11}, Landroid/widget/TextView;->setTextColor(I)V

    .line 974
    .line 975
    .line 976
    const/high16 v11, 0x41500000    # 13.0f

    .line 977
    .line 978
    invoke-virtual {v1, v11}, Landroid/widget/TextView;->setTextSize(F)V

    .line 979
    .line 980
    .line 981
    invoke-virtual {v10, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 982
    .line 983
    .line 984
    invoke-virtual {v8, v10}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 985
    .line 986
    .line 987
    new-instance v1, Landroid/widget/TextView;

    .line 988
    .line 989
    invoke-direct {v1, v2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 990
    .line 991
    .line 992
    const-string v10, "Rename"

    .line 993
    .line 994
    invoke-virtual {v1, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 995
    .line 996
    .line 997
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 998
    .line 999
    .line 1000
    const/high16 v10, 0x41600000    # 14.0f

    .line 1001
    .line 1002
    invoke-virtual {v1, v10}, Landroid/widget/TextView;->setTextSize(F)V

    .line 1003
    .line 1004
    .line 1005
    const/4 v13, 0x0

    .line 1006
    const/4 v14, 0x1

    .line 1007
    invoke-virtual {v1, v13, v14}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 1008
    .line 1009
    .line 1010
    const/16 v10, 0x10

    .line 1011
    .line 1012
    const/16 v14, 0x18

    .line 1013
    .line 1014
    invoke-virtual {v1, v14, v10, v14, v10}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 1015
    .line 1016
    .line 1017
    new-instance v11, Landroid/graphics/drawable/GradientDrawable;

    .line 1018
    .line 1019
    invoke-direct {v11}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 1020
    .line 1021
    .line 1022
    invoke-static {v12}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 1023
    .line 1024
    .line 1025
    move-result v13

    .line 1026
    invoke-virtual {v11, v13}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 1027
    .line 1028
    .line 1029
    const/high16 v13, 0x41800000    # 16.0f

    .line 1030
    .line 1031
    invoke-virtual {v11, v13}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 1032
    .line 1033
    .line 1034
    invoke-virtual {v1, v11}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 1035
    .line 1036
    .line 1037
    new-instance v11, Landroid/widget/LinearLayout$LayoutParams;

    .line 1038
    .line 1039
    const/4 v13, -0x2

    .line 1040
    invoke-direct {v11, v13, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 1041
    .line 1042
    .line 1043
    const/4 v13, 0x0

    .line 1044
    invoke-virtual {v11, v13, v13, v10, v13}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 1045
    .line 1046
    .line 1047
    invoke-virtual {v1, v11}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1048
    .line 1049
    .line 1050
    new-instance v31, Lt51;

    .line 1051
    .line 1052
    iget-object v10, v0, Le61;->l:Landroidx/preference/Preference;

    .line 1053
    .line 1054
    move-object/from16 v32, v2

    .line 1055
    .line 1056
    move/from16 v33, v3

    .line 1057
    .line 1058
    move-object/from16 v34, v7

    .line 1059
    .line 1060
    move-object/from16 v37, v10

    .line 1061
    .line 1062
    invoke-direct/range {v31 .. v37}, Lt51;-><init>(Landroid/content/Context;ILe2;Lhz0;Lcom/melodix/music/SettingsActivity$a;Landroidx/preference/Preference;)V

    .line 1063
    .line 1064
    .line 1065
    move-object/from16 v3, v31

    .line 1066
    .line 1067
    invoke-virtual {v1, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1068
    .line 1069
    .line 1070
    invoke-virtual {v8, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 1071
    .line 1072
    .line 1073
    new-instance v1, Landroid/widget/TextView;

    .line 1074
    .line 1075
    invoke-direct {v1, v2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 1076
    .line 1077
    .line 1078
    const-string v3, "Delete"

    .line 1079
    .line 1080
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1081
    .line 1082
    .line 1083
    const-string v3, "#E91E63"

    .line 1084
    .line 1085
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 1086
    .line 1087
    .line 1088
    move-result v3

    .line 1089
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 1090
    .line 1091
    .line 1092
    const/high16 v10, 0x41600000    # 14.0f

    .line 1093
    .line 1094
    invoke-virtual {v1, v10}, Landroid/widget/TextView;->setTextSize(F)V

    .line 1095
    .line 1096
    .line 1097
    const/4 v13, 0x0

    .line 1098
    const/4 v14, 0x1

    .line 1099
    invoke-virtual {v1, v13, v14}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 1100
    .line 1101
    .line 1102
    const/16 v10, 0x10

    .line 1103
    .line 1104
    const/16 v14, 0x18

    .line 1105
    .line 1106
    invoke-virtual {v1, v14, v10, v14, v10}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 1107
    .line 1108
    .line 1109
    new-instance v3, Landroid/graphics/drawable/GradientDrawable;

    .line 1110
    .line 1111
    invoke-direct {v3}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 1112
    .line 1113
    .line 1114
    invoke-static {v12}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 1115
    .line 1116
    .line 1117
    move-result v7

    .line 1118
    invoke-virtual {v3, v7}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 1119
    .line 1120
    .line 1121
    const/high16 v13, 0x41800000    # 16.0f

    .line 1122
    .line 1123
    invoke-virtual {v3, v13}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 1124
    .line 1125
    .line 1126
    invoke-virtual {v1, v3}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 1127
    .line 1128
    .line 1129
    new-instance v31, Lt51;

    .line 1130
    .line 1131
    move-object/from16 v32, v34

    .line 1132
    .line 1133
    move/from16 v34, v33

    .line 1134
    .line 1135
    move-object/from16 v33, v32

    .line 1136
    .line 1137
    move-object/from16 v32, v2

    .line 1138
    .line 1139
    invoke-direct/range {v31 .. v37}, Lt51;-><init>(Landroid/content/Context;Le2;ILhz0;Lcom/melodix/music/SettingsActivity$a;Landroidx/preference/Preference;)V

    .line 1140
    .line 1141
    .line 1142
    move-object/from16 v10, v31

    .line 1143
    .line 1144
    move/from16 v3, v34

    .line 1145
    .line 1146
    move-object/from16 v7, v35

    .line 1147
    .line 1148
    invoke-virtual {v1, v10}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1149
    .line 1150
    .line 1151
    invoke-virtual {v8, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 1152
    .line 1153
    .line 1154
    invoke-virtual {v6, v8}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 1155
    .line 1156
    .line 1157
    move-object/from16 v1, v36

    .line 1158
    .line 1159
    const/16 v14, 0x10

    .line 1160
    .line 1161
    goto/16 :goto_a

    .line 1162
    .line 1163
    :cond_12
    move-object/from16 v7, v35

    .line 1164
    .line 1165
    new-instance v0, Lf4;

    .line 1166
    .line 1167
    invoke-direct {v0, v2}, Lf4;-><init>(Landroid/content/Context;)V

    .line 1168
    .line 1169
    .line 1170
    iget-object v1, v0, Lf4;->c:Ljava/lang/Object;

    .line 1171
    .line 1172
    check-cast v1, Lb4;

    .line 1173
    .line 1174
    const-string v2, "Manage Profiles"

    .line 1175
    .line 1176
    iput-object v2, v1, Lb4;->d:Ljava/lang/CharSequence;

    .line 1177
    .line 1178
    iput-object v5, v1, Lb4;->r:Landroid/view/View;

    .line 1179
    .line 1180
    const-string v1, "Close"

    .line 1181
    .line 1182
    const/4 v13, 0x0

    .line 1183
    invoke-virtual {v0, v1, v13}, Lf4;->e(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 1184
    .line 1185
    .line 1186
    invoke-virtual {v0}, Lf4;->a()Lg4;

    .line 1187
    .line 1188
    .line 1189
    move-result-object v0

    .line 1190
    iput-object v0, v7, Lhz0;->j:Ljava/lang/Object;

    .line 1191
    .line 1192
    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    .line 1193
    .line 1194
    .line 1195
    iget-object v0, v7, Lhz0;->j:Ljava/lang/Object;

    .line 1196
    .line 1197
    check-cast v0, Lg4;

    .line 1198
    .line 1199
    const/4 v1, -0x2

    .line 1200
    invoke-virtual {v0, v1}, Lg4;->d(I)Landroid/widget/Button;

    .line 1201
    .line 1202
    .line 1203
    move-result-object v0

    .line 1204
    if-eqz v0, :cond_13

    .line 1205
    .line 1206
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 1207
    .line 1208
    .line 1209
    :cond_13
    :goto_c
    return-void

    .line 1210
    :pswitch_2
    iget-object v1, v0, Le61;->k:Lcom/melodix/music/SettingsActivity$a;

    .line 1211
    .line 1212
    invoke-virtual {v1}, Lh70;->H()Landroid/content/Context;

    .line 1213
    .line 1214
    .line 1215
    move-result-object v3

    .line 1216
    invoke-static {v10}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 1217
    .line 1218
    .line 1219
    move-result v4

    .line 1220
    invoke-static {v3}, Lbh;->s(Landroid/content/Context;)Ljava/util/List;

    .line 1221
    .line 1222
    .line 1223
    move-result-object v5

    .line 1224
    invoke-static {v3}, Lbh;->o(Landroid/content/Context;)Ljava/lang/String;

    .line 1225
    .line 1226
    .line 1227
    move-result-object v6

    .line 1228
    new-instance v7, Landroid/widget/ScrollView;

    .line 1229
    .line 1230
    invoke-direct {v7, v3}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    .line 1231
    .line 1232
    .line 1233
    new-instance v8, Landroid/widget/LinearLayout;

    .line 1234
    .line 1235
    invoke-direct {v8, v3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 1236
    .line 1237
    .line 1238
    const/4 v14, 0x1

    .line 1239
    invoke-virtual {v8, v14}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 1240
    .line 1241
    .line 1242
    const/16 v10, 0x10

    .line 1243
    .line 1244
    const/16 v11, 0x20

    .line 1245
    .line 1246
    invoke-virtual {v8, v11, v10, v11, v10}, Landroid/view/View;->setPadding(IIII)V

    .line 1247
    .line 1248
    .line 1249
    invoke-virtual {v7, v8}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    .line 1250
    .line 1251
    .line 1252
    new-instance v28, Lhz0;

    .line 1253
    .line 1254
    invoke-direct/range {v28 .. v28}, Ljava/lang/Object;-><init>()V

    .line 1255
    .line 1256
    .line 1257
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 1258
    .line 1259
    .line 1260
    move-result-object v5

    .line 1261
    :goto_d
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 1262
    .line 1263
    .line 1264
    move-result v10

    .line 1265
    const/high16 v11, 0x41c00000    # 24.0f

    .line 1266
    .line 1267
    if-eqz v10, :cond_1b

    .line 1268
    .line 1269
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 1270
    .line 1271
    .line 1272
    move-result-object v10

    .line 1273
    check-cast v10, Le2;

    .line 1274
    .line 1275
    iget-object v14, v10, Le2;->a:Ljava/lang/String;

    .line 1276
    .line 1277
    invoke-virtual {v14, v6}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 1278
    .line 1279
    .line 1280
    move-result v14

    .line 1281
    new-instance v15, Landroid/widget/LinearLayout;

    .line 1282
    .line 1283
    invoke-direct {v15, v3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 1284
    .line 1285
    .line 1286
    const/4 v13, 0x0

    .line 1287
    invoke-virtual {v15, v13}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 1288
    .line 1289
    .line 1290
    const/16 v13, 0x10

    .line 1291
    .line 1292
    invoke-virtual {v15, v13}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 1293
    .line 1294
    .line 1295
    new-instance v13, Landroid/graphics/drawable/GradientDrawable;

    .line 1296
    .line 1297
    invoke-direct {v13}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 1298
    .line 1299
    .line 1300
    if-eqz v14, :cond_14

    .line 1301
    .line 1302
    invoke-static {v12}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 1303
    .line 1304
    .line 1305
    move-result v24

    .line 1306
    :goto_e
    move-object/from16 v30, v1

    .line 1307
    .line 1308
    move/from16 v1, v24

    .line 1309
    .line 1310
    goto :goto_f

    .line 1311
    :cond_14
    invoke-static {v9}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 1312
    .line 1313
    .line 1314
    move-result v24

    .line 1315
    goto :goto_e

    .line 1316
    :goto_f
    invoke-virtual {v13, v1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 1317
    .line 1318
    .line 1319
    invoke-virtual {v13, v11}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 1320
    .line 1321
    .line 1322
    if-eqz v14, :cond_15

    .line 1323
    .line 1324
    const/4 v1, 0x3

    .line 1325
    invoke-virtual {v13, v1, v4}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 1326
    .line 1327
    .line 1328
    :cond_15
    invoke-virtual {v15, v13}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 1329
    .line 1330
    .line 1331
    const/16 v1, 0x1c

    .line 1332
    .line 1333
    const/16 v11, 0x20

    .line 1334
    .line 1335
    invoke-virtual {v15, v11, v1, v11, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 1336
    .line 1337
    .line 1338
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 1339
    .line 1340
    const/4 v11, -0x2

    .line 1341
    const/4 v13, -0x1

    .line 1342
    invoke-direct {v1, v13, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 1343
    .line 1344
    .line 1345
    move-object/from16 v29, v3

    .line 1346
    .line 1347
    const/4 v3, 0x0

    .line 1348
    const/16 v11, 0x8

    .line 1349
    .line 1350
    const/16 v13, 0x10

    .line 1351
    .line 1352
    invoke-virtual {v1, v3, v11, v3, v13}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 1353
    .line 1354
    .line 1355
    invoke-virtual {v15, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1356
    .line 1357
    .line 1358
    const/4 v1, 0x1

    .line 1359
    invoke-virtual {v15, v1}, Landroid/view/View;->setClickable(Z)V

    .line 1360
    .line 1361
    .line 1362
    invoke-virtual {v15, v1}, Landroid/view/View;->setFocusable(Z)V

    .line 1363
    .line 1364
    .line 1365
    new-instance v27, Lv51;

    .line 1366
    .line 1367
    iget-object v1, v0, Le61;->l:Landroidx/preference/Preference;

    .line 1368
    .line 1369
    move-object/from16 v32, v1

    .line 1370
    .line 1371
    move-object/from16 v31, v10

    .line 1372
    .line 1373
    invoke-direct/range {v27 .. v32}, Lv51;-><init>(Lhz0;Landroid/content/Context;Lcom/melodix/music/SettingsActivity$a;Le2;Landroidx/preference/Preference;)V

    .line 1374
    .line 1375
    .line 1376
    move-object/from16 v11, v27

    .line 1377
    .line 1378
    move-object/from16 v3, v28

    .line 1379
    .line 1380
    move-object/from16 v1, v29

    .line 1381
    .line 1382
    move-object/from16 v13, v30

    .line 1383
    .line 1384
    invoke-virtual {v15, v11}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1385
    .line 1386
    .line 1387
    new-instance v11, Landroid/widget/ImageView;

    .line 1388
    .line 1389
    invoke-direct {v11, v1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 1390
    .line 1391
    .line 1392
    move-object/from16 v24, v5

    .line 1393
    .line 1394
    const v5, 0x7f0800b1

    .line 1395
    .line 1396
    .line 1397
    invoke-virtual {v11, v5}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 1398
    .line 1399
    .line 1400
    const-string v5, "#B3FFFFFF"

    .line 1401
    .line 1402
    if-eqz v14, :cond_16

    .line 1403
    .line 1404
    move-object/from16 p1, v5

    .line 1405
    .line 1406
    move v5, v4

    .line 1407
    goto :goto_10

    .line 1408
    :cond_16
    invoke-static {v5}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 1409
    .line 1410
    .line 1411
    move-result v25

    .line 1412
    move-object/from16 p1, v5

    .line 1413
    .line 1414
    move/from16 v5, v25

    .line 1415
    .line 1416
    :goto_10
    invoke-virtual {v11, v5}, Landroid/widget/ImageView;->setColorFilter(I)V

    .line 1417
    .line 1418
    .line 1419
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    .line 1420
    .line 1421
    move-object/from16 v25, v6

    .line 1422
    .line 1423
    const/16 v6, 0x48

    .line 1424
    .line 1425
    invoke-direct {v5, v6, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 1426
    .line 1427
    .line 1428
    move-object/from16 v27, v9

    .line 1429
    .line 1430
    const/16 v6, 0x18

    .line 1431
    .line 1432
    const/4 v9, 0x0

    .line 1433
    invoke-virtual {v5, v9, v9, v6, v9}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 1434
    .line 1435
    .line 1436
    invoke-virtual {v11, v5}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1437
    .line 1438
    .line 1439
    invoke-virtual {v15, v11}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 1440
    .line 1441
    .line 1442
    new-instance v5, Landroid/widget/LinearLayout;

    .line 1443
    .line 1444
    invoke-direct {v5, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 1445
    .line 1446
    .line 1447
    const/4 v6, 0x1

    .line 1448
    invoke-virtual {v5, v6}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 1449
    .line 1450
    .line 1451
    new-instance v11, Landroid/widget/LinearLayout$LayoutParams;

    .line 1452
    .line 1453
    const/high16 v6, 0x3f800000    # 1.0f

    .line 1454
    .line 1455
    move-object/from16 v28, v12

    .line 1456
    .line 1457
    const/4 v12, -0x2

    .line 1458
    invoke-direct {v11, v9, v12, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 1459
    .line 1460
    .line 1461
    invoke-virtual {v5, v11}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1462
    .line 1463
    .line 1464
    new-instance v6, Landroid/widget/TextView;

    .line 1465
    .line 1466
    invoke-direct {v6, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 1467
    .line 1468
    .line 1469
    iget-object v9, v10, Le2;->b:Ljava/lang/String;

    .line 1470
    .line 1471
    invoke-virtual {v6, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1472
    .line 1473
    .line 1474
    const/4 v9, -0x1

    .line 1475
    invoke-virtual {v6, v9}, Landroid/widget/TextView;->setTextColor(I)V

    .line 1476
    .line 1477
    .line 1478
    const/high16 v9, 0x41800000    # 16.0f

    .line 1479
    .line 1480
    invoke-virtual {v6, v9}, Landroid/widget/TextView;->setTextSize(F)V

    .line 1481
    .line 1482
    .line 1483
    const/4 v9, 0x0

    .line 1484
    const/4 v11, 0x1

    .line 1485
    invoke-virtual {v6, v9, v11}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 1486
    .line 1487
    .line 1488
    invoke-virtual {v5, v6}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 1489
    .line 1490
    .line 1491
    new-instance v6, Landroid/widget/TextView;

    .line 1492
    .line 1493
    invoke-direct {v6, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 1494
    .line 1495
    .line 1496
    iget-object v9, v10, Le2;->c:Ljava/lang/String;

    .line 1497
    .line 1498
    invoke-static {v9}, Lda1;->F(Ljava/lang/CharSequence;)Z

    .line 1499
    .line 1500
    .line 1501
    move-result v9

    .line 1502
    if-nez v9, :cond_17

    .line 1503
    .line 1504
    iget-object v9, v10, Le2;->c:Ljava/lang/String;

    .line 1505
    .line 1506
    const-string v10, "@"

    .line 1507
    .line 1508
    invoke-virtual {v10, v9}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 1509
    .line 1510
    .line 1511
    move-result-object v9

    .line 1512
    goto :goto_11

    .line 1513
    :cond_17
    if-eqz v14, :cond_18

    .line 1514
    .line 1515
    const-string v9, "Active Profile"

    .line 1516
    .line 1517
    goto :goto_11

    .line 1518
    :cond_18
    const-string v9, "Saved Session"

    .line 1519
    .line 1520
    :goto_11
    invoke-virtual {v6, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1521
    .line 1522
    .line 1523
    if-eqz v14, :cond_19

    .line 1524
    .line 1525
    move v9, v4

    .line 1526
    goto :goto_12

    .line 1527
    :cond_19
    invoke-static/range {p1 .. p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 1528
    .line 1529
    .line 1530
    move-result v9

    .line 1531
    :goto_12
    invoke-virtual {v6, v9}, Landroid/widget/TextView;->setTextColor(I)V

    .line 1532
    .line 1533
    .line 1534
    const/high16 v9, 0x41500000    # 13.0f

    .line 1535
    .line 1536
    invoke-virtual {v6, v9}, Landroid/widget/TextView;->setTextSize(F)V

    .line 1537
    .line 1538
    .line 1539
    invoke-virtual {v5, v6}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 1540
    .line 1541
    .line 1542
    invoke-virtual {v15, v5}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 1543
    .line 1544
    .line 1545
    if-eqz v14, :cond_1a

    .line 1546
    .line 1547
    new-instance v5, Landroid/widget/TextView;

    .line 1548
    .line 1549
    invoke-direct {v5, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 1550
    .line 1551
    .line 1552
    const-string v6, "\u2713"

    .line 1553
    .line 1554
    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1555
    .line 1556
    .line 1557
    invoke-virtual {v5, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 1558
    .line 1559
    .line 1560
    const/high16 v6, 0x41900000    # 18.0f

    .line 1561
    .line 1562
    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextSize(F)V

    .line 1563
    .line 1564
    .line 1565
    const/4 v9, 0x0

    .line 1566
    const/4 v14, 0x1

    .line 1567
    invoke-virtual {v5, v9, v14}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 1568
    .line 1569
    .line 1570
    invoke-virtual {v15, v5}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 1571
    .line 1572
    .line 1573
    :cond_1a
    invoke-virtual {v8, v15}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 1574
    .line 1575
    .line 1576
    move-object/from16 v5, v24

    .line 1577
    .line 1578
    move-object/from16 v6, v25

    .line 1579
    .line 1580
    move-object/from16 v9, v27

    .line 1581
    .line 1582
    move-object/from16 v12, v28

    .line 1583
    .line 1584
    move-object/from16 v28, v3

    .line 1585
    .line 1586
    move-object v3, v1

    .line 1587
    move-object v1, v13

    .line 1588
    goto/16 :goto_d

    .line 1589
    .line 1590
    :cond_1b
    move-object v13, v1

    .line 1591
    move-object v1, v3

    .line 1592
    move-object/from16 v3, v28

    .line 1593
    .line 1594
    new-instance v0, Landroid/widget/LinearLayout;

    .line 1595
    .line 1596
    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 1597
    .line 1598
    .line 1599
    const/4 v9, 0x0

    .line 1600
    invoke-virtual {v0, v9}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 1601
    .line 1602
    .line 1603
    const/16 v5, 0x11

    .line 1604
    .line 1605
    invoke-virtual {v0, v5}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 1606
    .line 1607
    .line 1608
    new-instance v5, Landroid/graphics/drawable/GradientDrawable;

    .line 1609
    .line 1610
    invoke-direct {v5}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 1611
    .line 1612
    .line 1613
    invoke-virtual {v5, v4}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 1614
    .line 1615
    .line 1616
    invoke-virtual {v5, v11}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 1617
    .line 1618
    .line 1619
    invoke-virtual {v0, v5}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 1620
    .line 1621
    .line 1622
    const/16 v5, 0x1c

    .line 1623
    .line 1624
    const/16 v11, 0x20

    .line 1625
    .line 1626
    invoke-virtual {v0, v11, v5, v11, v5}, Landroid/view/View;->setPadding(IIII)V

    .line 1627
    .line 1628
    .line 1629
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    .line 1630
    .line 1631
    const/4 v6, -0x1

    .line 1632
    const/4 v11, -0x2

    .line 1633
    invoke-direct {v5, v6, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 1634
    .line 1635
    .line 1636
    const/16 v10, 0x10

    .line 1637
    .line 1638
    const/16 v11, 0x8

    .line 1639
    .line 1640
    invoke-virtual {v5, v9, v10, v9, v11}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 1641
    .line 1642
    .line 1643
    invoke-virtual {v0, v5}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1644
    .line 1645
    .line 1646
    new-instance v5, Lw51;

    .line 1647
    .line 1648
    invoke-direct {v5, v3, v1, v13, v9}, Lw51;-><init>(Ljava/io/Serializable;Ljava/lang/Object;Ljava/lang/Object;I)V

    .line 1649
    .line 1650
    .line 1651
    invoke-virtual {v0, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1652
    .line 1653
    .line 1654
    new-instance v5, Landroid/widget/TextView;

    .line 1655
    .line 1656
    invoke-direct {v5, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 1657
    .line 1658
    .line 1659
    const-string v6, "\u2795 Log in to New Account"

    .line 1660
    .line 1661
    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1662
    .line 1663
    .line 1664
    const/high16 v6, -0x1000000

    .line 1665
    .line 1666
    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextColor(I)V

    .line 1667
    .line 1668
    .line 1669
    const/high16 v6, 0x41700000    # 15.0f

    .line 1670
    .line 1671
    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextSize(F)V

    .line 1672
    .line 1673
    .line 1674
    const/4 v13, 0x0

    .line 1675
    const/4 v14, 0x1

    .line 1676
    invoke-virtual {v5, v13, v14}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 1677
    .line 1678
    .line 1679
    invoke-virtual {v0, v5}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 1680
    .line 1681
    .line 1682
    invoke-virtual {v8, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 1683
    .line 1684
    .line 1685
    new-instance v0, Lf4;

    .line 1686
    .line 1687
    invoke-direct {v0, v1}, Lf4;-><init>(Landroid/content/Context;)V

    .line 1688
    .line 1689
    .line 1690
    iget-object v1, v0, Lf4;->c:Ljava/lang/Object;

    .line 1691
    .line 1692
    check-cast v1, Lb4;

    .line 1693
    .line 1694
    const-string v5, "Switch Account Profile"

    .line 1695
    .line 1696
    iput-object v5, v1, Lb4;->d:Ljava/lang/CharSequence;

    .line 1697
    .line 1698
    iput-object v7, v1, Lb4;->r:Landroid/view/View;

    .line 1699
    .line 1700
    invoke-virtual {v0, v2, v13}, Lf4;->e(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 1701
    .line 1702
    .line 1703
    invoke-virtual {v0}, Lf4;->a()Lg4;

    .line 1704
    .line 1705
    .line 1706
    move-result-object v0

    .line 1707
    iput-object v0, v3, Lhz0;->j:Ljava/lang/Object;

    .line 1708
    .line 1709
    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    .line 1710
    .line 1711
    .line 1712
    iget-object v0, v3, Lhz0;->j:Ljava/lang/Object;

    .line 1713
    .line 1714
    check-cast v0, Lg4;

    .line 1715
    .line 1716
    const/4 v11, -0x2

    .line 1717
    invoke-virtual {v0, v11}, Lg4;->d(I)Landroid/widget/Button;

    .line 1718
    .line 1719
    .line 1720
    move-result-object v0

    .line 1721
    if-eqz v0, :cond_1c

    .line 1722
    .line 1723
    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 1724
    .line 1725
    .line 1726
    :cond_1c
    return-void

    .line 1727
    :pswitch_3
    move-object/from16 v28, v12

    .line 1728
    .line 1729
    move-object v3, v13

    .line 1730
    iget-object v1, v0, Le61;->k:Lcom/melodix/music/SettingsActivity$a;

    .line 1731
    .line 1732
    invoke-virtual {v1}, Lh70;->H()Landroid/content/Context;

    .line 1733
    .line 1734
    .line 1735
    move-result-object v4

    .line 1736
    invoke-static {v10}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 1737
    .line 1738
    .line 1739
    move-result v5

    .line 1740
    new-instance v6, Landroid/widget/LinearLayout;

    .line 1741
    .line 1742
    invoke-direct {v6, v4}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 1743
    .line 1744
    .line 1745
    const/4 v14, 0x1

    .line 1746
    invoke-virtual {v6, v14}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 1747
    .line 1748
    .line 1749
    const/16 v7, 0x30

    .line 1750
    .line 1751
    const/16 v10, 0x10

    .line 1752
    .line 1753
    const/16 v14, 0x18

    .line 1754
    .line 1755
    invoke-virtual {v6, v7, v14, v7, v10}, Landroid/view/View;->setPadding(IIII)V

    .line 1756
    .line 1757
    .line 1758
    new-instance v7, Landroid/widget/EditText;

    .line 1759
    .line 1760
    invoke-direct {v7, v4}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 1761
    .line 1762
    .line 1763
    const-string v9, "Account Name (e.g., Personal, Work)"

    .line 1764
    .line 1765
    invoke-virtual {v7, v9}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 1766
    .line 1767
    .line 1768
    const-string v9, "#80FFFFFF"

    .line 1769
    .line 1770
    invoke-static {v9}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 1771
    .line 1772
    .line 1773
    move-result v9

    .line 1774
    invoke-virtual {v7, v9}, Landroid/widget/TextView;->setHintTextColor(I)V

    .line 1775
    .line 1776
    .line 1777
    const/4 v13, -0x1

    .line 1778
    invoke-virtual {v7, v13}, Landroid/widget/TextView;->setTextColor(I)V

    .line 1779
    .line 1780
    .line 1781
    const/high16 v9, 0x41700000    # 15.0f

    .line 1782
    .line 1783
    invoke-virtual {v7, v9}, Landroid/widget/TextView;->setTextSize(F)V

    .line 1784
    .line 1785
    .line 1786
    new-instance v9, Landroid/graphics/drawable/GradientDrawable;

    .line 1787
    .line 1788
    invoke-direct {v9}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 1789
    .line 1790
    .line 1791
    invoke-static/range {v28 .. v28}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 1792
    .line 1793
    .line 1794
    move-result v10

    .line 1795
    invoke-virtual {v9, v10}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 1796
    .line 1797
    .line 1798
    const/high16 v13, 0x41800000    # 16.0f

    .line 1799
    .line 1800
    invoke-virtual {v9, v13}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 1801
    .line 1802
    .line 1803
    invoke-virtual {v7, v9}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 1804
    .line 1805
    .line 1806
    const/16 v11, 0x20

    .line 1807
    .line 1808
    const/16 v14, 0x18

    .line 1809
    .line 1810
    invoke-virtual {v7, v11, v14, v11, v14}, Landroid/view/View;->setPadding(IIII)V

    .line 1811
    .line 1812
    .line 1813
    sget-object v9, Lbh;->h:Ljava/lang/String;

    .line 1814
    .line 1815
    invoke-static {v9}, Lda1;->F(Ljava/lang/CharSequence;)Z

    .line 1816
    .line 1817
    .line 1818
    move-result v9

    .line 1819
    if-nez v9, :cond_1d

    .line 1820
    .line 1821
    sget-object v8, Lbh;->h:Ljava/lang/String;

    .line 1822
    .line 1823
    :cond_1d
    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1824
    .line 1825
    .line 1826
    invoke-virtual {v6, v7}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 1827
    .line 1828
    .line 1829
    new-instance v8, Lf4;

    .line 1830
    .line 1831
    invoke-direct {v8, v4}, Lf4;-><init>(Landroid/content/Context;)V

    .line 1832
    .line 1833
    .line 1834
    iget-object v9, v8, Lf4;->c:Ljava/lang/Object;

    .line 1835
    .line 1836
    check-cast v9, Lb4;

    .line 1837
    .line 1838
    const-string v10, "Save Current Account"

    .line 1839
    .line 1840
    iput-object v10, v9, Lb4;->d:Ljava/lang/CharSequence;

    .line 1841
    .line 1842
    const-string v10, "Save active Spotify session as a quick-switch profile:"

    .line 1843
    .line 1844
    iput-object v10, v9, Lb4;->f:Ljava/lang/CharSequence;

    .line 1845
    .line 1846
    iput-object v6, v9, Lb4;->r:Landroid/view/View;

    .line 1847
    .line 1848
    new-instance v6, Lu51;

    .line 1849
    .line 1850
    iget-object v0, v0, Le61;->l:Landroidx/preference/Preference;

    .line 1851
    .line 1852
    invoke-direct {v6, v7, v4, v1, v0}, Lu51;-><init>(Landroid/widget/EditText;Landroid/content/Context;Lcom/melodix/music/SettingsActivity$a;Landroidx/preference/Preference;)V

    .line 1853
    .line 1854
    .line 1855
    invoke-virtual {v8, v3, v6}, Lf4;->f(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 1856
    .line 1857
    .line 1858
    const/4 v13, 0x0

    .line 1859
    invoke-virtual {v8, v2, v13}, Lf4;->e(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 1860
    .line 1861
    .line 1862
    invoke-virtual {v8}, Lf4;->a()Lg4;

    .line 1863
    .line 1864
    .line 1865
    move-result-object v0

    .line 1866
    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    .line 1867
    .line 1868
    .line 1869
    const/4 v13, -0x1

    .line 1870
    invoke-virtual {v0, v13}, Lg4;->d(I)Landroid/widget/Button;

    .line 1871
    .line 1872
    .line 1873
    move-result-object v1

    .line 1874
    if-eqz v1, :cond_1e

    .line 1875
    .line 1876
    invoke-virtual {v1, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 1877
    .line 1878
    .line 1879
    :cond_1e
    const/4 v11, -0x2

    .line 1880
    invoke-virtual {v0, v11}, Lg4;->d(I)Landroid/widget/Button;

    .line 1881
    .line 1882
    .line 1883
    move-result-object v0

    .line 1884
    if-eqz v0, :cond_1f

    .line 1885
    .line 1886
    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 1887
    .line 1888
    .line 1889
    :cond_1f
    return-void

    .line 1890
    :pswitch_4
    move-object/from16 v27, v9

    .line 1891
    .line 1892
    move-object v3, v13

    .line 1893
    iget-object v1, v0, Le61;->k:Lcom/melodix/music/SettingsActivity$a;

    .line 1894
    .line 1895
    invoke-virtual {v1}, Lh70;->H()Landroid/content/Context;

    .line 1896
    .line 1897
    .line 1898
    move-result-object v1

    .line 1899
    new-instance v4, Landroid/widget/LinearLayout;

    .line 1900
    .line 1901
    invoke-direct {v4, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 1902
    .line 1903
    .line 1904
    const/4 v14, 0x1

    .line 1905
    invoke-virtual {v4, v14}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 1906
    .line 1907
    .line 1908
    const/16 v5, 0x30

    .line 1909
    .line 1910
    const/16 v10, 0x10

    .line 1911
    .line 1912
    const/16 v14, 0x18

    .line 1913
    .line 1914
    invoke-virtual {v4, v5, v14, v5, v10}, Landroid/view/View;->setPadding(IIII)V

    .line 1915
    .line 1916
    .line 1917
    new-instance v6, Landroid/widget/EditText;

    .line 1918
    .line 1919
    invoke-direct {v6, v1}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 1920
    .line 1921
    .line 1922
    const-string v7, "/* Type or paste custom CSS rules here */\nbody {\n  /* example */\n}"

    .line 1923
    .line 1924
    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 1925
    .line 1926
    .line 1927
    const-string v7, "#80FFFFFF"

    .line 1928
    .line 1929
    invoke-static {v7}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 1930
    .line 1931
    .line 1932
    move-result v7

    .line 1933
    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setHintTextColor(I)V

    .line 1934
    .line 1935
    .line 1936
    const/4 v13, -0x1

    .line 1937
    invoke-virtual {v6, v13}, Landroid/widget/TextView;->setTextColor(I)V

    .line 1938
    .line 1939
    .line 1940
    const/high16 v10, 0x41600000    # 14.0f

    .line 1941
    .line 1942
    invoke-virtual {v6, v10}, Landroid/widget/TextView;->setTextSize(F)V

    .line 1943
    .line 1944
    .line 1945
    sget-object v7, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;

    .line 1946
    .line 1947
    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 1948
    .line 1949
    .line 1950
    new-instance v7, Landroid/graphics/drawable/GradientDrawable;

    .line 1951
    .line 1952
    invoke-direct {v7}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 1953
    .line 1954
    .line 1955
    invoke-static/range {v27 .. v27}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 1956
    .line 1957
    .line 1958
    move-result v8

    .line 1959
    invoke-virtual {v7, v8}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 1960
    .line 1961
    .line 1962
    const/high16 v13, 0x41800000    # 16.0f

    .line 1963
    .line 1964
    invoke-virtual {v7, v13}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 1965
    .line 1966
    .line 1967
    const-string v8, "#33FFFFFF"

    .line 1968
    .line 1969
    invoke-static {v8}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 1970
    .line 1971
    .line 1972
    move-result v8

    .line 1973
    const/4 v9, 0x2

    .line 1974
    invoke-virtual {v7, v9, v8}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 1975
    .line 1976
    .line 1977
    invoke-virtual {v6, v7}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 1978
    .line 1979
    .line 1980
    const/16 v11, 0x20

    .line 1981
    .line 1982
    const/16 v14, 0x18

    .line 1983
    .line 1984
    invoke-virtual {v6, v11, v14, v11, v14}, Landroid/view/View;->setPadding(IIII)V

    .line 1985
    .line 1986
    .line 1987
    const/16 v7, 0xa

    .line 1988
    .line 1989
    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setLines(I)V

    .line 1990
    .line 1991
    .line 1992
    invoke-virtual {v6, v5}, Landroid/widget/TextView;->setGravity(I)V

    .line 1993
    .line 1994
    .line 1995
    sget-object v5, Lcom/melodix/music/AppSingleton;->b0:Ljava/lang/String;

    .line 1996
    .line 1997
    invoke-virtual {v6, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1998
    .line 1999
    .line 2000
    invoke-virtual {v4, v6}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 2001
    .line 2002
    .line 2003
    new-instance v5, Lf4;

    .line 2004
    .line 2005
    invoke-direct {v5, v1}, Lf4;-><init>(Landroid/content/Context;)V

    .line 2006
    .line 2007
    .line 2008
    iget-object v7, v5, Lf4;->c:Ljava/lang/Object;

    .line 2009
    .line 2010
    check-cast v7, Lb4;

    .line 2011
    .line 2012
    const-string v8, "Custom CSS Injector"

    .line 2013
    .line 2014
    iput-object v8, v7, Lb4;->d:Ljava/lang/CharSequence;

    .line 2015
    .line 2016
    const-string v8, "Add custom CSS rules to customize the Spotify Web Player UI:"

    .line 2017
    .line 2018
    iput-object v8, v7, Lb4;->f:Ljava/lang/CharSequence;

    .line 2019
    .line 2020
    iput-object v4, v7, Lb4;->r:Landroid/view/View;

    .line 2021
    .line 2022
    new-instance v4, Lq51;

    .line 2023
    .line 2024
    iget-object v0, v0, Le61;->l:Landroidx/preference/Preference;

    .line 2025
    .line 2026
    invoke-direct {v4, v6, v1, v0}, Lq51;-><init>(Landroid/widget/EditText;Landroid/content/Context;Landroidx/preference/Preference;)V

    .line 2027
    .line 2028
    .line 2029
    invoke-virtual {v5, v3, v4}, Lf4;->f(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 2030
    .line 2031
    .line 2032
    new-instance v3, Lr51;

    .line 2033
    .line 2034
    const/4 v13, 0x0

    .line 2035
    invoke-direct {v3, v1, v0, v13}, Lr51;-><init>(Landroid/content/Context;Ljava/lang/Comparable;I)V

    .line 2036
    .line 2037
    .line 2038
    const-string v0, "Clear"

    .line 2039
    .line 2040
    iput-object v0, v7, Lb4;->k:Ljava/lang/String;

    .line 2041
    .line 2042
    iput-object v3, v7, Lb4;->l:Landroid/content/DialogInterface$OnClickListener;

    .line 2043
    .line 2044
    const/4 v13, 0x0

    .line 2045
    invoke-virtual {v5, v2, v13}, Lf4;->e(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 2046
    .line 2047
    .line 2048
    invoke-virtual {v5}, Lf4;->g()V

    .line 2049
    .line 2050
    .line 2051
    return-void

    .line 2052
    nop

    .line 2053
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
