.class public final synthetic Ln9;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:I

.field public final synthetic k:Lcom/google/firebase/perf/metrics/AppStartTrace;


# direct methods
.method public synthetic constructor <init>(Lcom/google/firebase/perf/metrics/AppStartTrace;I)V
    .locals 0

    .line 1
    iput p2, p0, Ln9;->j:I

    .line 2
    .line 3
    iput-object p1, p0, Ln9;->k:Lcom/google/firebase/perf/metrics/AppStartTrace;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 5

    .line 1
    iget v0, p0, Ln9;->j:I

    .line 2
    .line 3
    iget-object p0, p0, Ln9;->k:Lcom/google/firebase/perf/metrics/AppStartTrace;

    .line 4
    .line 5
    packed-switch v0, :pswitch_data_0

    .line 6
    .line 7
    .line 8
    sget-object v0, Lcom/google/firebase/perf/metrics/AppStartTrace;->F:Loc1;

    .line 9
    .line 10
    invoke-static {}, Lld1;->H()Lid1;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const-string v1, "_as"

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lid1;->n(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/google/firebase/perf/metrics/AppStartTrace;->a()Loc1;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    iget-wide v1, v1, Loc1;->j:J

    .line 24
    .line 25
    invoke-virtual {v0, v1, v2}, Lid1;->l(J)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/google/firebase/perf/metrics/AppStartTrace;->a()Loc1;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    iget-object v2, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->u:Loc1;

    .line 33
    .line 34
    invoke-virtual {v1, v2}, Loc1;->c(Loc1;)J

    .line 35
    .line 36
    .line 37
    move-result-wide v1

    .line 38
    invoke-virtual {v0, v1, v2}, Lid1;->m(J)V

    .line 39
    .line 40
    .line 41
    new-instance v1, Ljava/util/ArrayList;

    .line 42
    .line 43
    const/4 v2, 0x3

    .line 44
    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 45
    .line 46
    .line 47
    invoke-static {}, Lld1;->H()Lid1;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    const-string v3, "_astui"

    .line 52
    .line 53
    invoke-virtual {v2, v3}, Lid1;->n(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0}, Lcom/google/firebase/perf/metrics/AppStartTrace;->a()Loc1;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    iget-wide v3, v3, Loc1;->j:J

    .line 61
    .line 62
    invoke-virtual {v2, v3, v4}, Lid1;->l(J)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0}, Lcom/google/firebase/perf/metrics/AppStartTrace;->a()Loc1;

    .line 66
    .line 67
    .line 68
    move-result-object v3

    .line 69
    iget-object v4, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->r:Loc1;

    .line 70
    .line 71
    invoke-virtual {v3, v4}, Loc1;->c(Loc1;)J

    .line 72
    .line 73
    .line 74
    move-result-wide v3

    .line 75
    invoke-virtual {v2, v3, v4}, Lid1;->m(J)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v2}, Lea0;->h()Lia0;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    check-cast v2, Lld1;

    .line 83
    .line 84
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    iget-object v2, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->t:Loc1;

    .line 88
    .line 89
    if-eqz v2, :cond_0

    .line 90
    .line 91
    invoke-static {}, Lld1;->H()Lid1;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    const-string v3, "_astfd"

    .line 96
    .line 97
    invoke-virtual {v2, v3}, Lid1;->n(Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    iget-object v3, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->r:Loc1;

    .line 101
    .line 102
    iget-wide v3, v3, Loc1;->j:J

    .line 103
    .line 104
    invoke-virtual {v2, v3, v4}, Lid1;->l(J)V

    .line 105
    .line 106
    .line 107
    iget-object v3, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->r:Loc1;

    .line 108
    .line 109
    iget-object v4, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->t:Loc1;

    .line 110
    .line 111
    invoke-virtual {v3, v4}, Loc1;->c(Loc1;)J

    .line 112
    .line 113
    .line 114
    move-result-wide v3

    .line 115
    invoke-virtual {v2, v3, v4}, Lid1;->m(J)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {v2}, Lea0;->h()Lia0;

    .line 119
    .line 120
    .line 121
    move-result-object v2

    .line 122
    check-cast v2, Lld1;

    .line 123
    .line 124
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 125
    .line 126
    .line 127
    invoke-static {}, Lld1;->H()Lid1;

    .line 128
    .line 129
    .line 130
    move-result-object v2

    .line 131
    const-string v3, "_asti"

    .line 132
    .line 133
    invoke-virtual {v2, v3}, Lid1;->n(Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    iget-object v3, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->t:Loc1;

    .line 137
    .line 138
    iget-wide v3, v3, Loc1;->j:J

    .line 139
    .line 140
    invoke-virtual {v2, v3, v4}, Lid1;->l(J)V

    .line 141
    .line 142
    .line 143
    iget-object v3, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->t:Loc1;

    .line 144
    .line 145
    iget-object v4, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->u:Loc1;

    .line 146
    .line 147
    invoke-virtual {v3, v4}, Loc1;->c(Loc1;)J

    .line 148
    .line 149
    .line 150
    move-result-wide v3

    .line 151
    invoke-virtual {v2, v3, v4}, Lid1;->m(J)V

    .line 152
    .line 153
    .line 154
    invoke-virtual {v2}, Lea0;->h()Lia0;

    .line 155
    .line 156
    .line 157
    move-result-object v2

    .line 158
    check-cast v2, Lld1;

    .line 159
    .line 160
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 161
    .line 162
    .line 163
    :cond_0
    invoke-virtual {v0}, Lea0;->i()V

    .line 164
    .line 165
    .line 166
    iget-object v2, v0, Lea0;->k:Lia0;

    .line 167
    .line 168
    check-cast v2, Lld1;

    .line 169
    .line 170
    invoke-virtual {v2, v1}, Lld1;->s(Ljava/util/ArrayList;)V

    .line 171
    .line 172
    .line 173
    iget-object v1, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->A:Lct0;

    .line 174
    .line 175
    invoke-virtual {v1}, Lct0;->a()Lbt0;

    .line 176
    .line 177
    .line 178
    move-result-object v1

    .line 179
    invoke-virtual {v0}, Lea0;->i()V

    .line 180
    .line 181
    .line 182
    iget-object v2, v0, Lea0;->k:Lia0;

    .line 183
    .line 184
    check-cast v2, Lld1;

    .line 185
    .line 186
    invoke-virtual {v2, v1}, Lld1;->t(Lbt0;)V

    .line 187
    .line 188
    .line 189
    iget-object p0, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->k:Lvd1;

    .line 190
    .line 191
    invoke-virtual {v0}, Lea0;->h()Lia0;

    .line 192
    .line 193
    .line 194
    move-result-object v0

    .line 195
    check-cast v0, Lld1;

    .line 196
    .line 197
    sget-object v1, Lx9;->n:Lx9;

    .line 198
    .line 199
    invoke-virtual {p0, v0, v1}, Lvd1;->c(Lld1;Lx9;)V

    .line 200
    .line 201
    .line 202
    return-void

    .line 203
    :pswitch_0
    sget-object v0, Lcom/google/firebase/perf/metrics/AppStartTrace;->F:Loc1;

    .line 204
    .line 205
    iget-object v0, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->m:Lid1;

    .line 206
    .line 207
    iget-object v1, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->y:Loc1;

    .line 208
    .line 209
    if-eqz v1, :cond_1

    .line 210
    .line 211
    goto :goto_0

    .line 212
    :cond_1
    new-instance v1, Loc1;

    .line 213
    .line 214
    invoke-direct {v1}, Loc1;-><init>()V

    .line 215
    .line 216
    .line 217
    iput-object v1, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->y:Loc1;

    .line 218
    .line 219
    invoke-static {}, Lld1;->H()Lid1;

    .line 220
    .line 221
    .line 222
    move-result-object v1

    .line 223
    const-string v2, "_experiment_preDrawFoQ"

    .line 224
    .line 225
    invoke-virtual {v1, v2}, Lid1;->n(Ljava/lang/String;)V

    .line 226
    .line 227
    .line 228
    invoke-virtual {p0}, Lcom/google/firebase/perf/metrics/AppStartTrace;->d()Loc1;

    .line 229
    .line 230
    .line 231
    move-result-object v2

    .line 232
    iget-wide v2, v2, Loc1;->j:J

    .line 233
    .line 234
    invoke-virtual {v1, v2, v3}, Lid1;->l(J)V

    .line 235
    .line 236
    .line 237
    invoke-virtual {p0}, Lcom/google/firebase/perf/metrics/AppStartTrace;->d()Loc1;

    .line 238
    .line 239
    .line 240
    move-result-object v2

    .line 241
    iget-object v3, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->y:Loc1;

    .line 242
    .line 243
    invoke-virtual {v2, v3}, Loc1;->c(Loc1;)J

    .line 244
    .line 245
    .line 246
    move-result-wide v2

    .line 247
    invoke-virtual {v1, v2, v3}, Lid1;->m(J)V

    .line 248
    .line 249
    .line 250
    invoke-virtual {v1}, Lea0;->h()Lia0;

    .line 251
    .line 252
    .line 253
    move-result-object v1

    .line 254
    check-cast v1, Lld1;

    .line 255
    .line 256
    invoke-virtual {v0, v1}, Lid1;->j(Lld1;)V

    .line 257
    .line 258
    .line 259
    invoke-virtual {p0, v0}, Lcom/google/firebase/perf/metrics/AppStartTrace;->f(Lid1;)V

    .line 260
    .line 261
    .line 262
    :goto_0
    return-void

    .line 263
    :pswitch_1
    sget-object v0, Lcom/google/firebase/perf/metrics/AppStartTrace;->F:Loc1;

    .line 264
    .line 265
    iget-object v0, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->m:Lid1;

    .line 266
    .line 267
    iget-object v1, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->x:Loc1;

    .line 268
    .line 269
    if-eqz v1, :cond_2

    .line 270
    .line 271
    goto :goto_1

    .line 272
    :cond_2
    new-instance v1, Loc1;

    .line 273
    .line 274
    invoke-direct {v1}, Loc1;-><init>()V

    .line 275
    .line 276
    .line 277
    iput-object v1, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->x:Loc1;

    .line 278
    .line 279
    invoke-virtual {p0}, Lcom/google/firebase/perf/metrics/AppStartTrace;->d()Loc1;

    .line 280
    .line 281
    .line 282
    move-result-object v1

    .line 283
    iget-wide v1, v1, Loc1;->j:J

    .line 284
    .line 285
    invoke-virtual {v0, v1, v2}, Lid1;->l(J)V

    .line 286
    .line 287
    .line 288
    invoke-virtual {p0}, Lcom/google/firebase/perf/metrics/AppStartTrace;->d()Loc1;

    .line 289
    .line 290
    .line 291
    move-result-object v1

    .line 292
    iget-object v2, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->x:Loc1;

    .line 293
    .line 294
    invoke-virtual {v1, v2}, Loc1;->c(Loc1;)J

    .line 295
    .line 296
    .line 297
    move-result-wide v1

    .line 298
    invoke-virtual {v0, v1, v2}, Lid1;->m(J)V

    .line 299
    .line 300
    .line 301
    invoke-virtual {p0, v0}, Lcom/google/firebase/perf/metrics/AppStartTrace;->f(Lid1;)V

    .line 302
    .line 303
    .line 304
    :goto_1
    return-void

    .line 305
    :pswitch_2
    sget-object v0, Lcom/google/firebase/perf/metrics/AppStartTrace;->F:Loc1;

    .line 306
    .line 307
    iget-object v0, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->m:Lid1;

    .line 308
    .line 309
    iget-object v1, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->z:Loc1;

    .line 310
    .line 311
    if-eqz v1, :cond_3

    .line 312
    .line 313
    goto/16 :goto_3

    .line 314
    .line 315
    :cond_3
    new-instance v1, Loc1;

    .line 316
    .line 317
    invoke-direct {v1}, Loc1;-><init>()V

    .line 318
    .line 319
    .line 320
    iput-object v1, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->z:Loc1;

    .line 321
    .line 322
    invoke-static {}, Lld1;->H()Lid1;

    .line 323
    .line 324
    .line 325
    move-result-object v1

    .line 326
    const-string v2, "_experiment_onDrawFoQ"

    .line 327
    .line 328
    invoke-virtual {v1, v2}, Lid1;->n(Ljava/lang/String;)V

    .line 329
    .line 330
    .line 331
    invoke-virtual {p0}, Lcom/google/firebase/perf/metrics/AppStartTrace;->d()Loc1;

    .line 332
    .line 333
    .line 334
    move-result-object v2

    .line 335
    iget-wide v2, v2, Loc1;->j:J

    .line 336
    .line 337
    invoke-virtual {v1, v2, v3}, Lid1;->l(J)V

    .line 338
    .line 339
    .line 340
    invoke-virtual {p0}, Lcom/google/firebase/perf/metrics/AppStartTrace;->d()Loc1;

    .line 341
    .line 342
    .line 343
    move-result-object v2

    .line 344
    iget-object v3, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->z:Loc1;

    .line 345
    .line 346
    invoke-virtual {v2, v3}, Loc1;->c(Loc1;)J

    .line 347
    .line 348
    .line 349
    move-result-wide v2

    .line 350
    invoke-virtual {v1, v2, v3}, Lid1;->m(J)V

    .line 351
    .line 352
    .line 353
    invoke-virtual {v1}, Lea0;->h()Lia0;

    .line 354
    .line 355
    .line 356
    move-result-object v1

    .line 357
    check-cast v1, Lld1;

    .line 358
    .line 359
    invoke-virtual {v0, v1}, Lid1;->j(Lld1;)V

    .line 360
    .line 361
    .line 362
    iget-object v1, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->p:Loc1;

    .line 363
    .line 364
    if-eqz v1, :cond_4

    .line 365
    .line 366
    invoke-static {}, Lld1;->H()Lid1;

    .line 367
    .line 368
    .line 369
    move-result-object v1

    .line 370
    const-string v2, "_experiment_procStart_to_classLoad"

    .line 371
    .line 372
    invoke-virtual {v1, v2}, Lid1;->n(Ljava/lang/String;)V

    .line 373
    .line 374
    .line 375
    invoke-virtual {p0}, Lcom/google/firebase/perf/metrics/AppStartTrace;->d()Loc1;

    .line 376
    .line 377
    .line 378
    move-result-object v2

    .line 379
    iget-wide v2, v2, Loc1;->j:J

    .line 380
    .line 381
    invoke-virtual {v1, v2, v3}, Lid1;->l(J)V

    .line 382
    .line 383
    .line 384
    invoke-virtual {p0}, Lcom/google/firebase/perf/metrics/AppStartTrace;->d()Loc1;

    .line 385
    .line 386
    .line 387
    move-result-object v2

    .line 388
    invoke-virtual {p0}, Lcom/google/firebase/perf/metrics/AppStartTrace;->a()Loc1;

    .line 389
    .line 390
    .line 391
    move-result-object v3

    .line 392
    invoke-virtual {v2, v3}, Loc1;->c(Loc1;)J

    .line 393
    .line 394
    .line 395
    move-result-wide v2

    .line 396
    invoke-virtual {v1, v2, v3}, Lid1;->m(J)V

    .line 397
    .line 398
    .line 399
    invoke-virtual {v1}, Lea0;->h()Lia0;

    .line 400
    .line 401
    .line 402
    move-result-object v1

    .line 403
    check-cast v1, Lld1;

    .line 404
    .line 405
    invoke-virtual {v0, v1}, Lid1;->j(Lld1;)V

    .line 406
    .line 407
    .line 408
    :cond_4
    iget-boolean v1, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->E:Z

    .line 409
    .line 410
    if-eqz v1, :cond_5

    .line 411
    .line 412
    const-string v1, "true"

    .line 413
    .line 414
    goto :goto_2

    .line 415
    :cond_5
    const-string v1, "false"

    .line 416
    .line 417
    :goto_2
    invoke-virtual {v0}, Lea0;->i()V

    .line 418
    .line 419
    .line 420
    iget-object v2, v0, Lea0;->k:Lia0;

    .line 421
    .line 422
    check-cast v2, Lld1;

    .line 423
    .line 424
    invoke-virtual {v2}, Lld1;->G()Lml0;

    .line 425
    .line 426
    .line 427
    move-result-object v2

    .line 428
    const-string v3, "systemDeterminedForeground"

    .line 429
    .line 430
    invoke-virtual {v2, v3, v1}, Lml0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 431
    .line 432
    .line 433
    iget v1, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->C:I

    .line 434
    .line 435
    int-to-long v1, v1

    .line 436
    const-string v3, "onDrawCount"

    .line 437
    .line 438
    invoke-virtual {v0, v3, v1, v2}, Lid1;->k(Ljava/lang/String;J)V

    .line 439
    .line 440
    .line 441
    iget-object v1, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->A:Lct0;

    .line 442
    .line 443
    invoke-virtual {v1}, Lct0;->a()Lbt0;

    .line 444
    .line 445
    .line 446
    move-result-object v1

    .line 447
    invoke-virtual {v0}, Lea0;->i()V

    .line 448
    .line 449
    .line 450
    iget-object v2, v0, Lea0;->k:Lia0;

    .line 451
    .line 452
    check-cast v2, Lld1;

    .line 453
    .line 454
    invoke-virtual {v2, v1}, Lld1;->t(Lbt0;)V

    .line 455
    .line 456
    .line 457
    invoke-virtual {p0, v0}, Lcom/google/firebase/perf/metrics/AppStartTrace;->f(Lid1;)V

    .line 458
    .line 459
    .line 460
    :goto_3
    return-void

    .line 461
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
