.class public final Lj42;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Z

.field public final synthetic k:Landroid/net/Uri;

.field public final synthetic l:Ljava/lang/String;

.field public final synthetic m:Ljava/lang/String;

.field public final synthetic n:Lcx1;


# direct methods
.method public constructor <init>(Lcx1;ZLandroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-boolean p2, p0, Lj42;->j:Z

    .line 5
    .line 6
    iput-object p3, p0, Lj42;->k:Landroid/net/Uri;

    .line 7
    .line 8
    iput-object p4, p0, Lj42;->l:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p5, p0, Lj42;->m:Ljava/lang/String;

    .line 11
    .line 12
    iput-object p1, p0, Lj42;->n:Lcx1;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const-string v1, "gclid="

    .line 4
    .line 5
    iget-object v2, v0, Lj42;->n:Lcx1;

    .line 6
    .line 7
    iget-object v2, v2, Lcx1;->k:Ljava/lang/Object;

    .line 8
    .line 9
    move-object v3, v2

    .line 10
    check-cast v3, Lc52;

    .line 11
    .line 12
    iget-object v2, v3, Let;->j:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast v2, Ly02;

    .line 15
    .line 16
    invoke-virtual {v3}, Lgx1;->l()V

    .line 17
    .line 18
    .line 19
    iget-object v4, v3, Lc52;->z:Lvd2;

    .line 20
    .line 21
    iget-object v6, v0, Lj42;->m:Ljava/lang/String;

    .line 22
    .line 23
    iget-object v5, v0, Lj42;->k:Landroid/net/Uri;

    .line 24
    .line 25
    :try_start_0
    iget-object v7, v2, Ly02;->r:Lcb2;

    .line 26
    .line 27
    iget-object v8, v2, Ly02;->o:Lzy1;

    .line 28
    .line 29
    invoke-static {v7}, Ly02;->j(Let;)V

    .line 30
    .line 31
    .line 32
    const-string v9, "https://google.com/search?"

    .line 33
    .line 34
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 35
    .line 36
    .line 37
    move-result v10
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 38
    const-string v11, "_cis"

    .line 39
    .line 40
    const-string v12, "Activity created with data \'referrer\' without required params"

    .line 41
    .line 42
    const-string v13, "utm_medium"

    .line 43
    .line 44
    const-string v14, "utm_source"

    .line 45
    .line 46
    const-string v15, "utm_campaign"

    .line 47
    .line 48
    move/from16 v16, v10

    .line 49
    .line 50
    const-string v10, "gclid"

    .line 51
    .line 52
    if-eqz v16, :cond_0

    .line 53
    .line 54
    move-object/from16 v16, v8

    .line 55
    .line 56
    :goto_0
    const/4 v7, 0x0

    .line 57
    goto :goto_1

    .line 58
    :cond_0
    :try_start_1
    invoke-virtual {v6, v10}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 59
    .line 60
    .line 61
    move-result v16

    .line 62
    if-nez v16, :cond_1

    .line 63
    .line 64
    move-object/from16 v16, v8

    .line 65
    .line 66
    const-string v8, "gbraid"

    .line 67
    .line 68
    invoke-virtual {v6, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 69
    .line 70
    .line 71
    move-result v8

    .line 72
    if-nez v8, :cond_2

    .line 73
    .line 74
    invoke-virtual {v6, v15}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 75
    .line 76
    .line 77
    move-result v8

    .line 78
    if-nez v8, :cond_2

    .line 79
    .line 80
    invoke-virtual {v6, v14}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 81
    .line 82
    .line 83
    move-result v8

    .line 84
    if-nez v8, :cond_2

    .line 85
    .line 86
    invoke-virtual {v6, v13}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 87
    .line 88
    .line 89
    move-result v8

    .line 90
    if-nez v8, :cond_2

    .line 91
    .line 92
    const-string v8, "utm_id"

    .line 93
    .line 94
    invoke-virtual {v6, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 95
    .line 96
    .line 97
    move-result v8

    .line 98
    if-nez v8, :cond_2

    .line 99
    .line 100
    const-string v8, "dclid"

    .line 101
    .line 102
    invoke-virtual {v6, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 103
    .line 104
    .line 105
    move-result v8

    .line 106
    if-nez v8, :cond_2

    .line 107
    .line 108
    const-string v8, "srsltid"

    .line 109
    .line 110
    invoke-virtual {v6, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 111
    .line 112
    .line 113
    move-result v8

    .line 114
    if-nez v8, :cond_2

    .line 115
    .line 116
    const-string v8, "sfmc_id"

    .line 117
    .line 118
    invoke-virtual {v6, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 119
    .line 120
    .line 121
    move-result v8

    .line 122
    if-nez v8, :cond_2

    .line 123
    .line 124
    iget-object v7, v7, Let;->j:Ljava/lang/Object;

    .line 125
    .line 126
    check-cast v7, Ly02;

    .line 127
    .line 128
    iget-object v7, v7, Ly02;->o:Lzy1;

    .line 129
    .line 130
    invoke-static {v7}, Ly02;->l(Lm22;)V

    .line 131
    .line 132
    .line 133
    iget-object v7, v7, Lzy1;->v:Lso;

    .line 134
    .line 135
    invoke-virtual {v7, v12}, Lso;->b(Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    goto :goto_0

    .line 139
    :catch_0
    move-exception v0

    .line 140
    goto/16 :goto_5

    .line 141
    .line 142
    :cond_1
    move-object/from16 v16, v8

    .line 143
    .line 144
    :cond_2
    invoke-virtual {v9, v6}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object v8

    .line 148
    invoke-static {v8}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 149
    .line 150
    .line 151
    move-result-object v8

    .line 152
    invoke-virtual {v7, v8}, Lcb2;->m0(Landroid/net/Uri;)Landroid/os/Bundle;

    .line 153
    .line 154
    .line 155
    move-result-object v7

    .line 156
    if-eqz v7, :cond_3

    .line 157
    .line 158
    const-string v8, "referrer"

    .line 159
    .line 160
    invoke-virtual {v7, v11, v8}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_0

    .line 161
    .line 162
    .line 163
    :cond_3
    :goto_1
    iget-boolean v8, v0, Lj42;->j:Z

    .line 164
    .line 165
    const-string v9, "_cmp"

    .line 166
    .line 167
    iget-object v0, v0, Lj42;->l:Ljava/lang/String;

    .line 168
    .line 169
    if-eqz v8, :cond_5

    .line 170
    .line 171
    :try_start_2
    iget-object v8, v2, Ly02;->r:Lcb2;

    .line 172
    .line 173
    invoke-static {v8}, Ly02;->j(Let;)V

    .line 174
    .line 175
    .line 176
    invoke-virtual {v8, v5}, Lcb2;->m0(Landroid/net/Uri;)Landroid/os/Bundle;

    .line 177
    .line 178
    .line 179
    move-result-object v5

    .line 180
    if-eqz v5, :cond_5

    .line 181
    .line 182
    const-string v8, "intent"

    .line 183
    .line 184
    invoke-virtual {v5, v11, v8}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 185
    .line 186
    .line 187
    invoke-virtual {v5, v10}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 188
    .line 189
    .line 190
    move-result v8

    .line 191
    if-nez v8, :cond_4

    .line 192
    .line 193
    if-eqz v7, :cond_4

    .line 194
    .line 195
    invoke-virtual {v7, v10}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 196
    .line 197
    .line 198
    move-result v8

    .line 199
    if-eqz v8, :cond_4

    .line 200
    .line 201
    const-string v8, "_cer"

    .line 202
    .line 203
    invoke-virtual {v7, v10}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 204
    .line 205
    .line 206
    move-result-object v11

    .line 207
    move-object/from16 v17, v12

    .line 208
    .line 209
    new-instance v12, Ljava/lang/StringBuilder;

    .line 210
    .line 211
    invoke-direct {v12, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 212
    .line 213
    .line 214
    invoke-virtual {v12, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 215
    .line 216
    .line 217
    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 218
    .line 219
    .line 220
    move-result-object v1

    .line 221
    invoke-virtual {v5, v8, v1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 222
    .line 223
    .line 224
    goto :goto_2

    .line 225
    :cond_4
    move-object/from16 v17, v12

    .line 226
    .line 227
    :goto_2
    invoke-virtual {v3, v0, v9, v5}, Lc52;->s(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)V

    .line 228
    .line 229
    .line 230
    invoke-virtual {v4, v0, v5}, Lvd2;->a(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 231
    .line 232
    .line 233
    goto :goto_3

    .line 234
    :cond_5
    move-object/from16 v17, v12

    .line 235
    .line 236
    :goto_3
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 237
    .line 238
    .line 239
    move-result v1

    .line 240
    if-nez v1, :cond_a

    .line 241
    .line 242
    invoke-static/range {v16 .. v16}, Ly02;->l(Lm22;)V

    .line 243
    .line 244
    .line 245
    move-object/from16 v1, v16

    .line 246
    .line 247
    iget-object v5, v1, Lzy1;->v:Lso;

    .line 248
    .line 249
    const-string v8, "Activity created with referrer"

    .line 250
    .line 251
    invoke-virtual {v5, v6, v8}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 252
    .line 253
    .line 254
    iget-object v8, v2, Ly02;->m:Lmt1;

    .line 255
    .line 256
    sget-object v11, Lxx1;->G0:Lwx1;

    .line 257
    .line 258
    const/4 v12, 0x0

    .line 259
    invoke-virtual {v8, v12, v11}, Lmt1;->w(Ljava/lang/String;Lwx1;)Z

    .line 260
    .line 261
    .line 262
    move-result v8

    .line 263
    if-eqz v8, :cond_7

    .line 264
    .line 265
    if-eqz v7, :cond_6

    .line 266
    .line 267
    invoke-virtual {v3, v0, v9, v7}, Lc52;->s(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)V

    .line 268
    .line 269
    .line 270
    invoke-virtual {v4, v0, v7}, Lvd2;->a(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 271
    .line 272
    .line 273
    goto :goto_4

    .line 274
    :cond_6
    invoke-static {v1}, Ly02;->l(Lm22;)V

    .line 275
    .line 276
    .line 277
    const-string v0, "Referrer does not contain valid parameters"

    .line 278
    .line 279
    invoke-virtual {v5, v6, v0}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 280
    .line 281
    .line 282
    :goto_4
    iget-object v0, v2, Ly02;->t:Lmz;

    .line 283
    .line 284
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 285
    .line 286
    .line 287
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 288
    .line 289
    .line 290
    move-result-wide v8

    .line 291
    const-string v4, "auto"

    .line 292
    .line 293
    const-string v5, "_ldl"

    .line 294
    .line 295
    const/4 v7, 0x1

    .line 296
    move-object v6, v12

    .line 297
    invoke-virtual/range {v3 .. v9}, Lc52;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZJ)V

    .line 298
    .line 299
    .line 300
    return-void

    .line 301
    :cond_7
    invoke-virtual {v6, v10}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 302
    .line 303
    .line 304
    move-result v0

    .line 305
    if-eqz v0, :cond_9

    .line 306
    .line 307
    invoke-virtual {v6, v15}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 308
    .line 309
    .line 310
    move-result v0

    .line 311
    if-nez v0, :cond_8

    .line 312
    .line 313
    invoke-virtual {v6, v14}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 314
    .line 315
    .line 316
    move-result v0

    .line 317
    if-nez v0, :cond_8

    .line 318
    .line 319
    invoke-virtual {v6, v13}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 320
    .line 321
    .line 322
    move-result v0

    .line 323
    if-nez v0, :cond_8

    .line 324
    .line 325
    const-string v0, "utm_term"

    .line 326
    .line 327
    invoke-virtual {v6, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 328
    .line 329
    .line 330
    move-result v0

    .line 331
    if-nez v0, :cond_8

    .line 332
    .line 333
    const-string v0, "utm_content"

    .line 334
    .line 335
    invoke-virtual {v6, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 336
    .line 337
    .line 338
    move-result v0

    .line 339
    if-eqz v0, :cond_9

    .line 340
    .line 341
    :cond_8
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 342
    .line 343
    .line 344
    move-result v0

    .line 345
    if-nez v0, :cond_a

    .line 346
    .line 347
    iget-object v0, v2, Ly02;->t:Lmz;

    .line 348
    .line 349
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 350
    .line 351
    .line 352
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 353
    .line 354
    .line 355
    move-result-wide v8

    .line 356
    const-string v4, "auto"

    .line 357
    .line 358
    const-string v5, "_ldl"

    .line 359
    .line 360
    const/4 v7, 0x1

    .line 361
    invoke-virtual/range {v3 .. v9}, Lc52;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZJ)V

    .line 362
    .line 363
    .line 364
    return-void

    .line 365
    :cond_9
    invoke-static {v1}, Ly02;->l(Lm22;)V

    .line 366
    .line 367
    .line 368
    move-object/from16 v0, v17

    .line 369
    .line 370
    invoke-virtual {v5, v0}, Lso;->b(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_0

    .line 371
    .line 372
    .line 373
    :cond_a
    return-void

    .line 374
    :goto_5
    iget-object v1, v3, Let;->j:Ljava/lang/Object;

    .line 375
    .line 376
    check-cast v1, Ly02;

    .line 377
    .line 378
    iget-object v1, v1, Ly02;->o:Lzy1;

    .line 379
    .line 380
    invoke-static {v1}, Ly02;->l(Lm22;)V

    .line 381
    .line 382
    .line 383
    iget-object v1, v1, Lzy1;->o:Lso;

    .line 384
    .line 385
    const-string v2, "Throwable caught in handleReferrerForOnActivityCreated"

    .line 386
    .line 387
    invoke-virtual {v1, v0, v2}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 388
    .line 389
    .line 390
    return-void
.end method
