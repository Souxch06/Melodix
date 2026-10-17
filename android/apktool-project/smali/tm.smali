.class public final synthetic Ltm;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljq;


# instance fields
.field public final synthetic j:Ldn;

.field public final synthetic k:Ljd2;

.field public final synthetic l:Ljd2;

.field public final synthetic m:J

.field public final synthetic n:I


# direct methods
.method public synthetic constructor <init>(Ldn;Ljd2;Ljd2;JI)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ltm;->j:Ldn;

    .line 5
    .line 6
    iput-object p2, p0, Ltm;->k:Ljd2;

    .line 7
    .line 8
    iput-object p3, p0, Ltm;->l:Ljd2;

    .line 9
    .line 10
    iput-wide p4, p0, Ltm;->m:J

    .line 11
    .line 12
    iput p6, p0, Ltm;->n:I

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final d(Ljd2;)Ljava/lang/Object;
    .locals 14

    .line 1
    iget-object p1, p0, Ltm;->j:Ldn;

    .line 2
    .line 3
    iget-object v0, p0, Ltm;->k:Ljd2;

    .line 4
    .line 5
    iget-object v1, p0, Ltm;->l:Ljd2;

    .line 6
    .line 7
    iget-wide v2, p0, Ltm;->m:J

    .line 8
    .line 9
    iget p0, p0, Ltm;->n:I

    .line 10
    .line 11
    invoke-virtual {v0}, Ljd2;->j()Z

    .line 12
    .line 13
    .line 14
    move-result v4

    .line 15
    if-nez v4, :cond_0

    .line 16
    .line 17
    new-instance p0, Lw40;

    .line 18
    .line 19
    const-string p1, "Failed to auto-fetch config update."

    .line 20
    .line 21
    invoke-virtual {v0}, Ljd2;->g()Ljava/lang/Exception;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-direct {p0, p1, v0}, Lx30;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 26
    .line 27
    .line 28
    invoke-static {p0}, Lbe2;->k(Lx40;)Ljd2;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0

    .line 33
    :cond_0
    invoke-virtual {v1}, Ljd2;->j()Z

    .line 34
    .line 35
    .line 36
    move-result v4

    .line 37
    if-nez v4, :cond_1

    .line 38
    .line 39
    new-instance p0, Lw40;

    .line 40
    .line 41
    const-string p1, "Failed to get activated config for auto-fetch"

    .line 42
    .line 43
    invoke-virtual {v1}, Ljd2;->g()Ljava/lang/Exception;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-direct {p0, p1, v0}, Lx30;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 48
    .line 49
    .line 50
    invoke-static {p0}, Lbe2;->k(Lx40;)Ljd2;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    return-object p0

    .line 55
    :cond_1
    invoke-virtual {v0}, Ljd2;->h()Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    check-cast v0, Lcn;

    .line 60
    .line 61
    invoke-virtual {v1}, Ljd2;->h()Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    check-cast v1, Lzm;

    .line 66
    .line 67
    iget-object v4, v0, Lcn;->b:Lzm;

    .line 68
    .line 69
    const/4 v5, 0x0

    .line 70
    const/4 v6, 0x1

    .line 71
    if-eqz v4, :cond_3

    .line 72
    .line 73
    iget-wide v7, v4, Lzm;->f:J

    .line 74
    .line 75
    cmp-long v4, v7, v2

    .line 76
    .line 77
    if-ltz v4, :cond_2

    .line 78
    .line 79
    move v5, v6

    .line 80
    :cond_2
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 81
    .line 82
    .line 83
    move-result-object v4

    .line 84
    goto :goto_0

    .line 85
    :cond_3
    iget v4, v0, Lcn;->a:I

    .line 86
    .line 87
    if-ne v4, v6, :cond_4

    .line 88
    .line 89
    move v5, v6

    .line 90
    :cond_4
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 91
    .line 92
    .line 93
    move-result-object v4

    .line 94
    :goto_0
    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    .line 95
    .line 96
    .line 97
    move-result v4

    .line 98
    const/4 v5, 0x0

    .line 99
    if-nez v4, :cond_5

    .line 100
    .line 101
    invoke-virtual {p1, p0, v2, v3}, Ldn;->a(IJ)V

    .line 102
    .line 103
    .line 104
    invoke-static {v5}, Lbe2;->l(Ljava/lang/Object;)Ljd2;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    return-object p0

    .line 109
    :cond_5
    iget-object p0, v0, Lcn;->b:Lzm;

    .line 110
    .line 111
    if-nez p0, :cond_6

    .line 112
    .line 113
    invoke-static {v5}, Lbe2;->l(Ljava/lang/Object;)Ljd2;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    return-object p0

    .line 118
    :cond_6
    if-nez v1, :cond_7

    .line 119
    .line 120
    invoke-static {}, Lzm;->c()Lym;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    new-instance v6, Lzm;

    .line 125
    .line 126
    iget-object v7, p0, Lym;->a:Lorg/json/JSONObject;

    .line 127
    .line 128
    iget-object v8, p0, Lym;->b:Ljava/util/Date;

    .line 129
    .line 130
    iget-object v9, p0, Lym;->c:Lorg/json/JSONArray;

    .line 131
    .line 132
    iget-object v10, p0, Lym;->d:Lorg/json/JSONObject;

    .line 133
    .line 134
    iget-wide v11, p0, Lym;->e:J

    .line 135
    .line 136
    iget-object v13, p0, Lym;->f:Lorg/json/JSONArray;

    .line 137
    .line 138
    invoke-direct/range {v6 .. v13}, Lzm;-><init>(Lorg/json/JSONObject;Ljava/util/Date;Lorg/json/JSONArray;Lorg/json/JSONObject;JLorg/json/JSONArray;)V

    .line 139
    .line 140
    .line 141
    move-object v1, v6

    .line 142
    :cond_7
    iget-object p0, v0, Lcn;->b:Lzm;

    .line 143
    .line 144
    iget-object v0, v1, Lzm;->e:Lorg/json/JSONObject;

    .line 145
    .line 146
    iget-object v2, p0, Lzm;->a:Lorg/json/JSONObject;

    .line 147
    .line 148
    iget-object v3, p0, Lzm;->b:Lorg/json/JSONObject;

    .line 149
    .line 150
    iget-object v4, p0, Lzm;->e:Lorg/json/JSONObject;

    .line 151
    .line 152
    new-instance v6, Lorg/json/JSONObject;

    .line 153
    .line 154
    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object v2

    .line 158
    invoke-direct {v6, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 159
    .line 160
    .line 161
    invoke-static {v6}, Lzm;->a(Lorg/json/JSONObject;)Lzm;

    .line 162
    .line 163
    .line 164
    move-result-object v2

    .line 165
    iget-object v2, v2, Lzm;->b:Lorg/json/JSONObject;

    .line 166
    .line 167
    invoke-virtual {v1}, Lzm;->b()Ljava/util/HashMap;

    .line 168
    .line 169
    .line 170
    move-result-object v6

    .line 171
    invoke-virtual {p0}, Lzm;->b()Ljava/util/HashMap;

    .line 172
    .line 173
    .line 174
    move-result-object p0

    .line 175
    new-instance v7, Ljava/util/HashSet;

    .line 176
    .line 177
    invoke-direct {v7}, Ljava/util/HashSet;-><init>()V

    .line 178
    .line 179
    .line 180
    iget-object v1, v1, Lzm;->b:Lorg/json/JSONObject;

    .line 181
    .line 182
    invoke-virtual {v1}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    .line 183
    .line 184
    .line 185
    move-result-object v8

    .line 186
    :goto_1
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    .line 187
    .line 188
    .line 189
    move-result v9

    .line 190
    if-eqz v9, :cond_10

    .line 191
    .line 192
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 193
    .line 194
    .line 195
    move-result-object v9

    .line 196
    check-cast v9, Ljava/lang/String;

    .line 197
    .line 198
    invoke-virtual {v3, v9}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 199
    .line 200
    .line 201
    move-result v10

    .line 202
    if-nez v10, :cond_8

    .line 203
    .line 204
    invoke-virtual {v7, v9}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 205
    .line 206
    .line 207
    goto :goto_1

    .line 208
    :cond_8
    invoke-virtual {v1, v9}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 209
    .line 210
    .line 211
    move-result-object v10

    .line 212
    invoke-virtual {v3, v9}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 213
    .line 214
    .line 215
    move-result-object v11

    .line 216
    invoke-virtual {v10, v11}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 217
    .line 218
    .line 219
    move-result v10

    .line 220
    if-nez v10, :cond_9

    .line 221
    .line 222
    invoke-virtual {v7, v9}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 223
    .line 224
    .line 225
    goto :goto_1

    .line 226
    :cond_9
    invoke-virtual {v0, v9}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 227
    .line 228
    .line 229
    move-result v10

    .line 230
    if-eqz v10, :cond_a

    .line 231
    .line 232
    invoke-virtual {v4, v9}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 233
    .line 234
    .line 235
    move-result v10

    .line 236
    if-eqz v10, :cond_b

    .line 237
    .line 238
    :cond_a
    invoke-virtual {v0, v9}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 239
    .line 240
    .line 241
    move-result v10

    .line 242
    if-nez v10, :cond_c

    .line 243
    .line 244
    invoke-virtual {v4, v9}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 245
    .line 246
    .line 247
    move-result v10

    .line 248
    if-eqz v10, :cond_c

    .line 249
    .line 250
    :cond_b
    invoke-virtual {v7, v9}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 251
    .line 252
    .line 253
    goto :goto_1

    .line 254
    :cond_c
    invoke-virtual {v0, v9}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 255
    .line 256
    .line 257
    move-result v10

    .line 258
    if-eqz v10, :cond_d

    .line 259
    .line 260
    invoke-virtual {v4, v9}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 261
    .line 262
    .line 263
    move-result v10

    .line 264
    if-eqz v10, :cond_d

    .line 265
    .line 266
    invoke-virtual {v0, v9}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 267
    .line 268
    .line 269
    move-result-object v10

    .line 270
    invoke-virtual {v10}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 271
    .line 272
    .line 273
    move-result-object v10

    .line 274
    invoke-virtual {v4, v9}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 275
    .line 276
    .line 277
    move-result-object v11

    .line 278
    invoke-virtual {v11}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 279
    .line 280
    .line 281
    move-result-object v11

    .line 282
    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 283
    .line 284
    .line 285
    move-result v10

    .line 286
    if-nez v10, :cond_d

    .line 287
    .line 288
    invoke-virtual {v7, v9}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 289
    .line 290
    .line 291
    goto :goto_1

    .line 292
    :cond_d
    invoke-virtual {v6, v9}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 293
    .line 294
    .line 295
    move-result v10

    .line 296
    invoke-virtual {p0, v9}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 297
    .line 298
    .line 299
    move-result v11

    .line 300
    if-eq v10, v11, :cond_e

    .line 301
    .line 302
    invoke-virtual {v7, v9}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 303
    .line 304
    .line 305
    goto :goto_1

    .line 306
    :cond_e
    invoke-virtual {v6, v9}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 307
    .line 308
    .line 309
    move-result v10

    .line 310
    if-eqz v10, :cond_f

    .line 311
    .line 312
    invoke-virtual {p0, v9}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 313
    .line 314
    .line 315
    move-result v10

    .line 316
    if-eqz v10, :cond_f

    .line 317
    .line 318
    invoke-virtual {v6, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 319
    .line 320
    .line 321
    move-result-object v10

    .line 322
    check-cast v10, Ljava/util/Map;

    .line 323
    .line 324
    invoke-virtual {p0, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 325
    .line 326
    .line 327
    move-result-object v11

    .line 328
    invoke-interface {v10, v11}, Ljava/util/Map;->equals(Ljava/lang/Object;)Z

    .line 329
    .line 330
    .line 331
    move-result v10

    .line 332
    if-nez v10, :cond_f

    .line 333
    .line 334
    invoke-virtual {v7, v9}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 335
    .line 336
    .line 337
    goto/16 :goto_1

    .line 338
    .line 339
    :cond_f
    invoke-virtual {v2, v9}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    .line 340
    .line 341
    .line 342
    goto/16 :goto_1

    .line 343
    .line 344
    :cond_10
    invoke-virtual {v2}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    .line 345
    .line 346
    .line 347
    move-result-object p0

    .line 348
    :goto_2
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 349
    .line 350
    .line 351
    move-result v0

    .line 352
    if-eqz v0, :cond_11

    .line 353
    .line 354
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 355
    .line 356
    .line 357
    move-result-object v0

    .line 358
    check-cast v0, Ljava/lang/String;

    .line 359
    .line 360
    invoke-virtual {v7, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 361
    .line 362
    .line 363
    goto :goto_2

    .line 364
    :cond_11
    invoke-virtual {v7}, Ljava/util/HashSet;->isEmpty()Z

    .line 365
    .line 366
    .line 367
    move-result p0

    .line 368
    if-eqz p0, :cond_12

    .line 369
    .line 370
    invoke-static {v5}, Lbe2;->l(Ljava/lang/Object;)Ljd2;

    .line 371
    .line 372
    .line 373
    move-result-object p0

    .line 374
    return-object p0

    .line 375
    :cond_12
    new-instance p0, Lwc;

    .line 376
    .line 377
    invoke-direct {p0, v7}, Lwc;-><init>(Ljava/util/HashSet;)V

    .line 378
    .line 379
    .line 380
    monitor-enter p1

    .line 381
    :try_start_0
    iget-object v0, p1, Ldn;->a:Ljava/lang/Object;

    .line 382
    .line 383
    check-cast v0, Ljava/util/LinkedHashSet;

    .line 384
    .line 385
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 386
    .line 387
    .line 388
    move-result-object v0

    .line 389
    :goto_3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 390
    .line 391
    .line 392
    move-result v1

    .line 393
    if-eqz v1, :cond_13

    .line 394
    .line 395
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 396
    .line 397
    .line 398
    move-result-object v1

    .line 399
    check-cast v1, Lon;

    .line 400
    .line 401
    invoke-interface {v1, p0}, Lon;->a(Lwc;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 402
    .line 403
    .line 404
    goto :goto_3

    .line 405
    :catchall_0
    move-exception v0

    .line 406
    move-object p0, v0

    .line 407
    goto :goto_4

    .line 408
    :cond_13
    monitor-exit p1

    .line 409
    invoke-static {v5}, Lbe2;->l(Ljava/lang/Object;)Ljd2;

    .line 410
    .line 411
    .line 412
    move-result-object p0

    .line 413
    return-object p0

    .line 414
    :goto_4
    :try_start_1
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 415
    throw p0
.end method
