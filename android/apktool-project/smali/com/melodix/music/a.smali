.class public abstract Lcom/melodix/music/a;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# direct methods
.method public static a(Landroid/content/Context;Ljava/lang/String;)Landroid/app/PendingIntent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/melodix/music/WebService$MediaActionReceiver;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    const/high16 v1, 0xc000000

    .line 16
    .line 17
    invoke-static {p0, p1, v0, v1}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 22
    .line 23
    .line 24
    return-object p0
.end method

.method public static b(J)Ljava/lang/String;
    .locals 4

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p0, v0

    .line 4
    .line 5
    if-gtz v0, :cond_0

    .line 6
    .line 7
    const-string p0, "0:00"

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    const-wide/16 v0, 0x3e8

    .line 11
    .line 12
    div-long/2addr p0, v0

    .line 13
    const-wide/16 v0, 0x3c

    .line 14
    .line 15
    rem-long v2, p0, v0

    .line 16
    .line 17
    div-long/2addr p0, v0

    .line 18
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    filled-new-array {p0, p1}, [Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const/4 p1, 0x2

    .line 31
    invoke-static {p0, p1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    const-string p1, "%d:%02d"

    .line 36
    .line 37
    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0
.end method

.method public static c(Landroid/content/Context;)V
    .locals 5

    .line 1
    invoke-static {p0}, Landroid/appwidget/AppWidgetManager;->getInstance(Landroid/content/Context;)Landroid/appwidget/AppWidgetManager;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_1

    .line 8
    :cond_0
    new-instance v1, Landroid/content/ComponentName;

    .line 9
    .line 10
    const-class v2, Lcom/melodix/music/HomeWidget;

    .line 11
    .line 12
    invoke-direct {v1, p0, v2}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/appwidget/AppWidgetManager;->getAppWidgetIds(Landroid/content/ComponentName;)[I

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    array-length v2, v1

    .line 20
    const/4 v3, 0x0

    .line 21
    :goto_0
    if-ge v3, v2, :cond_1

    .line 22
    .line 23
    aget v4, v1, v3

    .line 24
    .line 25
    invoke-static {p0, v0, v4}, Lcom/melodix/music/a;->d(Landroid/content/Context;Landroid/appwidget/AppWidgetManager;I)V

    .line 26
    .line 27
    .line 28
    add-int/lit8 v3, v3, 0x1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    sget-boolean p0, Lcom/melodix/music/WebService;->r:Z

    .line 32
    .line 33
    if-eqz p0, :cond_2

    .line 34
    .line 35
    sget-boolean p0, Lcom/melodix/music/WebService;->s:Z

    .line 36
    .line 37
    if-eqz p0, :cond_2

    .line 38
    .line 39
    sget-boolean p0, Lcom/melodix/music/HomeWidget;->b:Z

    .line 40
    .line 41
    if-nez p0, :cond_2

    .line 42
    .line 43
    const/4 p0, 0x1

    .line 44
    sput-boolean p0, Lcom/melodix/music/HomeWidget;->b:Z

    .line 45
    .line 46
    sget-object p0, Lcom/melodix/music/HomeWidget;->a:Landroid/os/Handler;

    .line 47
    .line 48
    sget-object v0, Lcom/melodix/music/HomeWidget;->c:Lac0;

    .line 49
    .line 50
    invoke-virtual {p0, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 51
    .line 52
    .line 53
    :cond_2
    :goto_1
    return-void
.end method

.method public static d(Landroid/content/Context;Landroid/appwidget/AppWidgetManager;I)V
    .locals 32

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move/from16 v2, p2

    .line 6
    .line 7
    invoke-virtual/range {p1 .. p2}, Landroid/appwidget/AppWidgetManager;->getAppWidgetOptions(I)Landroid/os/Bundle;

    .line 8
    .line 9
    .line 10
    move-result-object v3

    .line 11
    const-string v4, "appWidgetMinHeight"

    .line 12
    .line 13
    invoke-virtual {v3, v4}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    const/16 v4, 0x80

    .line 18
    .line 19
    const/4 v6, 0x0

    .line 20
    if-lt v3, v4, :cond_0

    .line 21
    .line 22
    const/4 v3, 0x1

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    move v3, v6

    .line 25
    :goto_0
    if-eqz v3, :cond_1

    .line 26
    .line 27
    const v4, 0x7f0c0092

    .line 28
    .line 29
    .line 30
    goto :goto_1

    .line 31
    :cond_1
    const v4, 0x7f0c0035

    .line 32
    .line 33
    .line 34
    :goto_1
    new-instance v7, Landroid/widget/RemoteViews;

    .line 35
    .line 36
    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v8

    .line 40
    invoke-direct {v7, v8, v4}, Landroid/widget/RemoteViews;-><init>(Ljava/lang/String;I)V

    .line 41
    .line 42
    .line 43
    const/16 v4, 0x8

    .line 44
    .line 45
    const v13, 0x7f090219

    .line 46
    .line 47
    .line 48
    const v14, 0x7f090218

    .line 49
    .line 50
    .line 51
    if-eqz v3, :cond_2

    .line 52
    .line 53
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 54
    .line 55
    .line 56
    move-result-wide v9

    .line 57
    const/4 v11, 0x0

    .line 58
    const/4 v12, 0x0

    .line 59
    const v8, 0x7f090219

    .line 60
    .line 61
    .line 62
    invoke-virtual/range {v7 .. v12}, Landroid/widget/RemoteViews;->setChronometer(IJLjava/lang/String;Z)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v7, v14, v6}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v7, v13, v4}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    .line 69
    .line 70
    .line 71
    :cond_2
    sget-boolean v8, Lcom/melodix/music/WebService;->r:Z

    .line 72
    .line 73
    const v12, 0x7f090067

    .line 74
    .line 75
    .line 76
    const v5, 0x7f09006c

    .line 77
    .line 78
    .line 79
    const v15, 0x7f09006b

    .line 80
    .line 81
    .line 82
    const v9, 0x7f090215

    .line 83
    .line 84
    .line 85
    const v11, 0x7f09021a

    .line 86
    .line 87
    .line 88
    move/from16 v19, v8

    .line 89
    .line 90
    const v8, 0x7f090069

    .line 91
    .line 92
    .line 93
    if-eqz v19, :cond_f

    .line 94
    .line 95
    const v19, 0x7f0800a9

    .line 96
    .line 97
    .line 98
    const v24, 0x7f0800aa

    .line 99
    .line 100
    .line 101
    const v25, 0x7f080121

    .line 102
    .line 103
    .line 104
    if-eqz v3, :cond_8

    .line 105
    .line 106
    sget-object v10, Lcom/melodix/music/WebService;->v:Ljava/lang/String;

    .line 107
    .line 108
    invoke-virtual {v7, v11, v10}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    .line 109
    .line 110
    .line 111
    sget-object v10, Lcom/melodix/music/WebService;->u:Ljava/lang/String;

    .line 112
    .line 113
    invoke-virtual {v7, v9, v10}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    .line 114
    .line 115
    .line 116
    sget-boolean v9, Lcom/melodix/music/WebService;->s:Z

    .line 117
    .line 118
    if-eqz v9, :cond_3

    .line 119
    .line 120
    move/from16 v10, v25

    .line 121
    .line 122
    goto :goto_2

    .line 123
    :cond_3
    const v10, 0x7f080122

    .line 124
    .line 125
    .line 126
    :goto_2
    invoke-virtual {v7, v8, v10}, Landroid/widget/RemoteViews;->setImageViewResource(II)V

    .line 127
    .line 128
    .line 129
    sget v9, Lcom/melodix/music/WebService;->C:I

    .line 130
    .line 131
    invoke-virtual {v7, v15, v9}, Landroid/widget/RemoteViews;->setImageViewResource(II)V

    .line 132
    .line 133
    .line 134
    sget v9, Lcom/melodix/music/WebService;->D:I

    .line 135
    .line 136
    invoke-virtual {v7, v5, v9}, Landroid/widget/RemoteViews;->setImageViewResource(II)V

    .line 137
    .line 138
    .line 139
    sget-boolean v9, Lcom/melodix/music/WebService;->t:Z

    .line 140
    .line 141
    if-eqz v9, :cond_4

    .line 142
    .line 143
    move/from16 v9, v24

    .line 144
    .line 145
    goto :goto_3

    .line 146
    :cond_4
    move/from16 v9, v19

    .line 147
    .line 148
    :goto_3
    invoke-virtual {v7, v12, v9}, Landroid/widget/RemoteViews;->setImageViewResource(II)V

    .line 149
    .line 150
    .line 151
    sget-wide v24, Lcom/melodix/music/WebService;->y:J

    .line 152
    .line 153
    sget-wide v26, Lcom/melodix/music/WebService;->z:J

    .line 154
    .line 155
    sget-boolean v9, Lcom/melodix/music/WebService;->s:Z

    .line 156
    .line 157
    const-wide/16 v28, 0x0

    .line 158
    .line 159
    if-eqz v9, :cond_5

    .line 160
    .line 161
    sget-wide v9, Lcom/melodix/music/WebService;->A:J

    .line 162
    .line 163
    cmp-long v9, v9, v28

    .line 164
    .line 165
    if-lez v9, :cond_5

    .line 166
    .line 167
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 168
    .line 169
    .line 170
    move-result-wide v9

    .line 171
    sget-wide v30, Lcom/melodix/music/WebService;->A:J

    .line 172
    .line 173
    sub-long v9, v9, v30

    .line 174
    .line 175
    add-long v26, v9, v26

    .line 176
    .line 177
    invoke-virtual {v7, v14, v4}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    .line 178
    .line 179
    .line 180
    const/4 v4, 0x0

    .line 181
    invoke-virtual {v7, v13, v4}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    .line 182
    .line 183
    .line 184
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 185
    .line 186
    .line 187
    move-result-wide v9

    .line 188
    sub-long v9, v9, v26

    .line 189
    .line 190
    const/4 v11, 0x0

    .line 191
    move v13, v12

    .line 192
    const/4 v12, 0x1

    .line 193
    move v14, v8

    .line 194
    const v8, 0x7f090219

    .line 195
    .line 196
    .line 197
    const v17, 0x7f090071

    .line 198
    .line 199
    .line 200
    const v18, 0x7f090216

    .line 201
    .line 202
    .line 203
    const v20, 0x7f09006f

    .line 204
    .line 205
    .line 206
    const/16 v21, 0x3e8

    .line 207
    .line 208
    const v22, 0x7f090188

    .line 209
    .line 210
    .line 211
    invoke-virtual/range {v7 .. v12}, Landroid/widget/RemoteViews;->setChronometer(IJLjava/lang/String;Z)V

    .line 212
    .line 213
    .line 214
    move/from16 v4, v17

    .line 215
    .line 216
    move/from16 v13, v18

    .line 217
    .line 218
    move/from16 v5, v20

    .line 219
    .line 220
    move/from16 v15, v21

    .line 221
    .line 222
    move/from16 v6, v22

    .line 223
    .line 224
    goto :goto_4

    .line 225
    :cond_5
    move v9, v8

    .line 226
    move v8, v12

    .line 227
    const/4 v10, 0x0

    .line 228
    const v17, 0x7f090071

    .line 229
    .line 230
    .line 231
    const v18, 0x7f090216

    .line 232
    .line 233
    .line 234
    const v20, 0x7f09006f

    .line 235
    .line 236
    .line 237
    const/16 v21, 0x3e8

    .line 238
    .line 239
    const v22, 0x7f090188

    .line 240
    .line 241
    .line 242
    invoke-virtual {v7, v14, v10}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    .line 243
    .line 244
    .line 245
    invoke-virtual {v7, v13, v4}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    .line 246
    .line 247
    .line 248
    move v4, v9

    .line 249
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 250
    .line 251
    .line 252
    move-result-wide v9

    .line 253
    const/4 v11, 0x0

    .line 254
    const/4 v12, 0x0

    .line 255
    move v13, v8

    .line 256
    const v8, 0x7f090219

    .line 257
    .line 258
    .line 259
    move/from16 v4, v17

    .line 260
    .line 261
    move/from16 v13, v18

    .line 262
    .line 263
    move/from16 v5, v20

    .line 264
    .line 265
    move/from16 v15, v21

    .line 266
    .line 267
    move/from16 v6, v22

    .line 268
    .line 269
    invoke-virtual/range {v7 .. v12}, Landroid/widget/RemoteViews;->setChronometer(IJLjava/lang/String;Z)V

    .line 270
    .line 271
    .line 272
    invoke-static/range {v26 .. v27}, Lcom/melodix/music/a;->b(J)Ljava/lang/String;

    .line 273
    .line 274
    .line 275
    move-result-object v8

    .line 276
    invoke-virtual {v7, v14, v8}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    .line 277
    .line 278
    .line 279
    :goto_4
    cmp-long v8, v24, v28

    .line 280
    .line 281
    if-lez v8, :cond_6

    .line 282
    .line 283
    cmp-long v9, v26, v24

    .line 284
    .line 285
    if-lez v9, :cond_6

    .line 286
    .line 287
    move-wide/from16 v26, v24

    .line 288
    .line 289
    :cond_6
    invoke-static/range {v24 .. v25}, Lcom/melodix/music/a;->b(J)Ljava/lang/String;

    .line 290
    .line 291
    .line 292
    move-result-object v9

    .line 293
    invoke-virtual {v7, v13, v9}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    .line 294
    .line 295
    .line 296
    if-lez v8, :cond_7

    .line 297
    .line 298
    const-wide/16 v8, 0x3e8

    .line 299
    .line 300
    mul-long v26, v26, v8

    .line 301
    .line 302
    div-long v8, v26, v24

    .line 303
    .line 304
    long-to-int v8, v8

    .line 305
    const/4 v10, 0x0

    .line 306
    invoke-virtual {v7, v6, v15, v8, v10}, Landroid/widget/RemoteViews;->setProgressBar(IIIZ)V

    .line 307
    .line 308
    .line 309
    goto :goto_8

    .line 310
    :cond_7
    const/4 v10, 0x0

    .line 311
    invoke-virtual {v7, v6, v15, v10, v10}, Landroid/widget/RemoteViews;->setProgressBar(IIIZ)V

    .line 312
    .line 313
    .line 314
    goto :goto_8

    .line 315
    :cond_8
    const v4, 0x7f090071

    .line 316
    .line 317
    .line 318
    const v5, 0x7f09006f

    .line 319
    .line 320
    .line 321
    sget-object v6, Lcom/melodix/music/WebService;->u:Ljava/lang/String;

    .line 322
    .line 323
    sget-object v8, Lcom/melodix/music/WebService;->v:Ljava/lang/String;

    .line 324
    .line 325
    new-instance v9, Ljava/lang/StringBuilder;

    .line 326
    .line 327
    invoke-direct {v9, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 328
    .line 329
    .line 330
    const-string v6, " - "

    .line 331
    .line 332
    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 333
    .line 334
    .line 335
    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 336
    .line 337
    .line 338
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 339
    .line 340
    .line 341
    move-result-object v6

    .line 342
    const v8, 0x7f090217

    .line 343
    .line 344
    .line 345
    invoke-virtual {v7, v8, v6}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    .line 346
    .line 347
    .line 348
    sget-boolean v6, Lcom/melodix/music/WebService;->s:Z

    .line 349
    .line 350
    if-eqz v6, :cond_9

    .line 351
    .line 352
    move/from16 v10, v25

    .line 353
    .line 354
    goto :goto_5

    .line 355
    :cond_9
    const v10, 0x7f080122

    .line 356
    .line 357
    .line 358
    :goto_5
    invoke-virtual {v7, v5, v10}, Landroid/widget/RemoteViews;->setImageViewResource(II)V

    .line 359
    .line 360
    .line 361
    sget v6, Lcom/melodix/music/WebService;->C:I

    .line 362
    .line 363
    invoke-virtual {v7, v4, v6}, Landroid/widget/RemoteViews;->setImageViewResource(II)V

    .line 364
    .line 365
    .line 366
    sget-boolean v6, Lcom/melodix/music/WebService;->t:Z

    .line 367
    .line 368
    if-eqz v6, :cond_a

    .line 369
    .line 370
    move/from16 v6, v24

    .line 371
    .line 372
    :goto_6
    const v8, 0x7f09006d

    .line 373
    .line 374
    .line 375
    goto :goto_7

    .line 376
    :cond_a
    move/from16 v6, v19

    .line 377
    .line 378
    goto :goto_6

    .line 379
    :goto_7
    invoke-virtual {v7, v8, v6}, Landroid/widget/RemoteViews;->setImageViewResource(II)V

    .line 380
    .line 381
    .line 382
    :goto_8
    sget-object v6, Lcom/melodix/music/WebService;->B:Landroid/graphics/Bitmap;

    .line 383
    .line 384
    if-eqz v6, :cond_e

    .line 385
    .line 386
    :try_start_0
    invoke-virtual {v6}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 387
    .line 388
    .line 389
    move-result v8

    .line 390
    if-nez v8, :cond_d

    .line 391
    .line 392
    invoke-virtual {v6}, Landroid/graphics/Bitmap;->getWidth()I

    .line 393
    .line 394
    .line 395
    move-result v8

    .line 396
    const/16 v9, 0x180

    .line 397
    .line 398
    if-gt v8, v9, :cond_b

    .line 399
    .line 400
    invoke-virtual {v6}, Landroid/graphics/Bitmap;->getHeight()I

    .line 401
    .line 402
    .line 403
    move-result v8

    .line 404
    if-le v8, v9, :cond_c

    .line 405
    .line 406
    goto :goto_9

    .line 407
    :catchall_0
    const v6, 0x7f0800d6

    .line 408
    .line 409
    .line 410
    const v8, 0x7f0900fe

    .line 411
    .line 412
    .line 413
    goto :goto_a

    .line 414
    :cond_b
    :goto_9
    invoke-virtual {v6}, Landroid/graphics/Bitmap;->getWidth()I

    .line 415
    .line 416
    .line 417
    move-result v8

    .line 418
    int-to-float v8, v8

    .line 419
    const/high16 v9, 0x43c00000    # 384.0f

    .line 420
    .line 421
    div-float v8, v9, v8

    .line 422
    .line 423
    invoke-virtual {v6}, Landroid/graphics/Bitmap;->getHeight()I

    .line 424
    .line 425
    .line 426
    move-result v10

    .line 427
    int-to-float v10, v10

    .line 428
    div-float/2addr v9, v10

    .line 429
    invoke-static {v8, v9}, Ljava/lang/Math;->min(FF)F

    .line 430
    .line 431
    .line 432
    move-result v8

    .line 433
    invoke-virtual {v6}, Landroid/graphics/Bitmap;->getWidth()I

    .line 434
    .line 435
    .line 436
    move-result v9

    .line 437
    int-to-float v9, v9

    .line 438
    mul-float/2addr v9, v8

    .line 439
    float-to-int v9, v9

    .line 440
    invoke-virtual {v6}, Landroid/graphics/Bitmap;->getHeight()I

    .line 441
    .line 442
    .line 443
    move-result v10

    .line 444
    int-to-float v10, v10

    .line 445
    mul-float/2addr v10, v8

    .line 446
    float-to-int v8, v10

    .line 447
    const/4 v10, 0x1

    .line 448
    invoke-static {v6, v9, v8, v10}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    .line 449
    .line 450
    .line 451
    move-result-object v6

    .line 452
    :cond_c
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 453
    .line 454
    .line 455
    const v8, 0x7f0900fe

    .line 456
    .line 457
    .line 458
    :try_start_1
    invoke-virtual {v7, v8, v6}, Landroid/widget/RemoteViews;->setImageViewBitmap(ILandroid/graphics/Bitmap;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 459
    .line 460
    .line 461
    const v6, 0x7f0800d6

    .line 462
    .line 463
    .line 464
    const v8, 0x7f0900fe

    .line 465
    .line 466
    .line 467
    goto/16 :goto_d

    .line 468
    .line 469
    :catchall_1
    const v6, 0x7f0800d6

    .line 470
    .line 471
    .line 472
    goto :goto_a

    .line 473
    :cond_d
    const v6, 0x7f0800d6

    .line 474
    .line 475
    .line 476
    const v8, 0x7f0900fe

    .line 477
    .line 478
    .line 479
    :try_start_2
    invoke-virtual {v7, v8, v6}, Landroid/widget/RemoteViews;->setImageViewResource(II)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 480
    .line 481
    .line 482
    goto/16 :goto_d

    .line 483
    .line 484
    :catchall_2
    :goto_a
    invoke-virtual {v7, v8, v6}, Landroid/widget/RemoteViews;->setImageViewResource(II)V

    .line 485
    .line 486
    .line 487
    goto/16 :goto_d

    .line 488
    .line 489
    :cond_e
    const v6, 0x7f0800d6

    .line 490
    .line 491
    .line 492
    const v8, 0x7f0900fe

    .line 493
    .line 494
    .line 495
    invoke-virtual {v7, v8, v6}, Landroid/widget/RemoteViews;->setImageViewResource(II)V

    .line 496
    .line 497
    .line 498
    goto :goto_d

    .line 499
    :cond_f
    const v5, 0x7f09006f

    .line 500
    .line 501
    .line 502
    const v6, 0x7f090188

    .line 503
    .line 504
    .line 505
    const v8, 0x7f090071

    .line 506
    .line 507
    .line 508
    const v10, 0x7f090216

    .line 509
    .line 510
    .line 511
    const/16 v15, 0x3e8

    .line 512
    .line 513
    const v12, 0x7f11011b

    .line 514
    .line 515
    .line 516
    if-eqz v3, :cond_10

    .line 517
    .line 518
    invoke-virtual {v0, v12}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 519
    .line 520
    .line 521
    move-result-object v12

    .line 522
    invoke-virtual {v7, v11, v12}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    .line 523
    .line 524
    .line 525
    const v11, 0x7f110119

    .line 526
    .line 527
    .line 528
    invoke-virtual {v0, v11}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 529
    .line 530
    .line 531
    move-result-object v11

    .line 532
    invoke-virtual {v7, v9, v11}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    .line 533
    .line 534
    .line 535
    const v9, 0x7f090069

    .line 536
    .line 537
    .line 538
    const v11, 0x7f080122

    .line 539
    .line 540
    .line 541
    invoke-virtual {v7, v9, v11}, Landroid/widget/RemoteViews;->setImageViewResource(II)V

    .line 542
    .line 543
    .line 544
    const/4 v11, 0x0

    .line 545
    invoke-virtual {v7, v14, v11}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    .line 546
    .line 547
    .line 548
    invoke-virtual {v7, v13, v4}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    .line 549
    .line 550
    .line 551
    move v4, v9

    .line 552
    move v13, v10

    .line 553
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 554
    .line 555
    .line 556
    move-result-wide v9

    .line 557
    move/from16 v23, v11

    .line 558
    .line 559
    const/4 v11, 0x0

    .line 560
    const/4 v12, 0x0

    .line 561
    move/from16 v16, v8

    .line 562
    .line 563
    const v8, 0x7f090219

    .line 564
    .line 565
    .line 566
    move/from16 v4, v23

    .line 567
    .line 568
    invoke-virtual/range {v7 .. v12}, Landroid/widget/RemoteViews;->setChronometer(IJLjava/lang/String;Z)V

    .line 569
    .line 570
    .line 571
    const-string v8, "0:00"

    .line 572
    .line 573
    invoke-virtual {v7, v14, v8}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    .line 574
    .line 575
    .line 576
    invoke-virtual {v7, v13, v8}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    .line 577
    .line 578
    .line 579
    invoke-virtual {v7, v6, v15, v4, v4}, Landroid/widget/RemoteViews;->setProgressBar(IIIZ)V

    .line 580
    .line 581
    .line 582
    :goto_b
    const v6, 0x7f0800d6

    .line 583
    .line 584
    .line 585
    const v8, 0x7f0900fe

    .line 586
    .line 587
    .line 588
    goto :goto_c

    .line 589
    :cond_10
    invoke-virtual {v0, v12}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 590
    .line 591
    .line 592
    move-result-object v4

    .line 593
    const v8, 0x7f090217

    .line 594
    .line 595
    .line 596
    invoke-virtual {v7, v8, v4}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    .line 597
    .line 598
    .line 599
    const v11, 0x7f080122

    .line 600
    .line 601
    .line 602
    invoke-virtual {v7, v5, v11}, Landroid/widget/RemoteViews;->setImageViewResource(II)V

    .line 603
    .line 604
    .line 605
    goto :goto_b

    .line 606
    :goto_c
    invoke-virtual {v7, v8, v6}, Landroid/widget/RemoteViews;->setImageViewResource(II)V

    .line 607
    .line 608
    .line 609
    :goto_d
    new-instance v4, Landroid/content/Intent;

    .line 610
    .line 611
    const-class v6, Lcom/melodix/music/MainActivity;

    .line 612
    .line 613
    invoke-direct {v4, v0, v6}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 614
    .line 615
    .line 616
    const/high16 v6, 0xc000000

    .line 617
    .line 618
    invoke-static {v0, v2, v4, v6}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    .line 619
    .line 620
    .line 621
    move-result-object v4

    .line 622
    const v6, 0x7f090229

    .line 623
    .line 624
    .line 625
    invoke-virtual {v7, v6, v4}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    .line 626
    .line 627
    .line 628
    const-string v4, "ADDTOFAV_ACTION"

    .line 629
    .line 630
    const-string v6, "REPEAT_ACTION"

    .line 631
    .line 632
    const-string v8, "WIDGET_NEXT"

    .line 633
    .line 634
    const-string v9, "WIDGET_PREV"

    .line 635
    .line 636
    const-string v10, "WIDGET_PLAYPAUSE"

    .line 637
    .line 638
    if-eqz v3, :cond_11

    .line 639
    .line 640
    invoke-static {v0, v10}, Lcom/melodix/music/a;->a(Landroid/content/Context;Ljava/lang/String;)Landroid/app/PendingIntent;

    .line 641
    .line 642
    .line 643
    move-result-object v3

    .line 644
    const v14, 0x7f090069

    .line 645
    .line 646
    .line 647
    invoke-virtual {v7, v14, v3}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    .line 648
    .line 649
    .line 650
    const v3, 0x7f09006a

    .line 651
    .line 652
    .line 653
    invoke-static {v0, v9}, Lcom/melodix/music/a;->a(Landroid/content/Context;Ljava/lang/String;)Landroid/app/PendingIntent;

    .line 654
    .line 655
    .line 656
    move-result-object v5

    .line 657
    invoke-virtual {v7, v3, v5}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    .line 658
    .line 659
    .line 660
    const v3, 0x7f090068

    .line 661
    .line 662
    .line 663
    invoke-static {v0, v8}, Lcom/melodix/music/a;->a(Landroid/content/Context;Ljava/lang/String;)Landroid/app/PendingIntent;

    .line 664
    .line 665
    .line 666
    move-result-object v5

    .line 667
    invoke-virtual {v7, v3, v5}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    .line 668
    .line 669
    .line 670
    invoke-static {v0, v6}, Lcom/melodix/music/a;->a(Landroid/content/Context;Ljava/lang/String;)Landroid/app/PendingIntent;

    .line 671
    .line 672
    .line 673
    move-result-object v3

    .line 674
    const v5, 0x7f09006b

    .line 675
    .line 676
    .line 677
    invoke-virtual {v7, v5, v3}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    .line 678
    .line 679
    .line 680
    const-string v3, "SHUFFLE_ACTION"

    .line 681
    .line 682
    invoke-static {v0, v3}, Lcom/melodix/music/a;->a(Landroid/content/Context;Ljava/lang/String;)Landroid/app/PendingIntent;

    .line 683
    .line 684
    .line 685
    move-result-object v3

    .line 686
    const v5, 0x7f09006c

    .line 687
    .line 688
    .line 689
    invoke-virtual {v7, v5, v3}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    .line 690
    .line 691
    .line 692
    invoke-static {v0, v4}, Lcom/melodix/music/a;->a(Landroid/content/Context;Ljava/lang/String;)Landroid/app/PendingIntent;

    .line 693
    .line 694
    .line 695
    move-result-object v0

    .line 696
    const v13, 0x7f090067

    .line 697
    .line 698
    .line 699
    invoke-virtual {v7, v13, v0}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    .line 700
    .line 701
    .line 702
    goto :goto_e

    .line 703
    :cond_11
    invoke-static {v0, v10}, Lcom/melodix/music/a;->a(Landroid/content/Context;Ljava/lang/String;)Landroid/app/PendingIntent;

    .line 704
    .line 705
    .line 706
    move-result-object v3

    .line 707
    invoke-virtual {v7, v5, v3}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    .line 708
    .line 709
    .line 710
    const v3, 0x7f090070

    .line 711
    .line 712
    .line 713
    invoke-static {v0, v9}, Lcom/melodix/music/a;->a(Landroid/content/Context;Ljava/lang/String;)Landroid/app/PendingIntent;

    .line 714
    .line 715
    .line 716
    move-result-object v5

    .line 717
    invoke-virtual {v7, v3, v5}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    .line 718
    .line 719
    .line 720
    const v3, 0x7f09006e

    .line 721
    .line 722
    .line 723
    invoke-static {v0, v8}, Lcom/melodix/music/a;->a(Landroid/content/Context;Ljava/lang/String;)Landroid/app/PendingIntent;

    .line 724
    .line 725
    .line 726
    move-result-object v5

    .line 727
    invoke-virtual {v7, v3, v5}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    .line 728
    .line 729
    .line 730
    invoke-static {v0, v6}, Lcom/melodix/music/a;->a(Landroid/content/Context;Ljava/lang/String;)Landroid/app/PendingIntent;

    .line 731
    .line 732
    .line 733
    move-result-object v3

    .line 734
    const v8, 0x7f090071

    .line 735
    .line 736
    .line 737
    invoke-virtual {v7, v8, v3}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    .line 738
    .line 739
    .line 740
    invoke-static {v0, v4}, Lcom/melodix/music/a;->a(Landroid/content/Context;Ljava/lang/String;)Landroid/app/PendingIntent;

    .line 741
    .line 742
    .line 743
    move-result-object v0

    .line 744
    const v8, 0x7f09006d

    .line 745
    .line 746
    .line 747
    invoke-virtual {v7, v8, v0}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    .line 748
    .line 749
    .line 750
    :goto_e
    :try_start_3
    invoke-virtual {v1, v2, v7}, Landroid/appwidget/AppWidgetManager;->updateAppWidget(ILandroid/widget/RemoteViews;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    .line 751
    .line 752
    .line 753
    goto :goto_f

    .line 754
    :catchall_3
    const v6, 0x7f0800d6

    .line 755
    .line 756
    .line 757
    const v8, 0x7f0900fe

    .line 758
    .line 759
    .line 760
    :try_start_4
    invoke-virtual {v7, v8, v6}, Landroid/widget/RemoteViews;->setImageViewResource(II)V

    .line 761
    .line 762
    .line 763
    invoke-virtual {v1, v2, v7}, Landroid/appwidget/AppWidgetManager;->updateAppWidget(ILandroid/widget/RemoteViews;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_4

    .line 764
    .line 765
    .line 766
    :catchall_4
    :goto_f
    return-void
.end method
