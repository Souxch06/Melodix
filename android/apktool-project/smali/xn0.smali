.class public Lxn0;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lkw0;
.implements Lf91;
.implements Ltt0;
.implements Lvw0;
.implements Lpa1;
.implements Lwr0;
.implements Ljq;
.implements Lvz0;
.implements Lsa1;


# instance fields
.field public final synthetic j:I

.field public k:Ljava/lang/Object;

.field public l:Ljava/lang/Object;


# direct methods
.method public constructor <init>(I)V
    .locals 2

    .line 1
    iput p1, p0, Lxn0;->j:I

    .line 2
    .line 3
    packed-switch p1, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    :pswitch_0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    new-instance p1, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 10
    .line 11
    invoke-direct {p1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, Lxn0;->k:Ljava/lang/Object;

    .line 15
    .line 16
    new-instance p1, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 17
    .line 18
    invoke-direct {p1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object p1, p0, Lxn0;->l:Ljava/lang/Object;

    .line 22
    .line 23
    return-void

    .line 24
    :pswitch_1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    .line 26
    .line 27
    new-instance p1, Ljava/util/HashMap;

    .line 28
    .line 29
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 30
    .line 31
    .line 32
    iput-object p1, p0, Lxn0;->k:Ljava/lang/Object;

    .line 33
    .line 34
    new-instance p1, Lbu1;

    .line 35
    .line 36
    const/4 v0, 0x6

    .line 37
    invoke-direct {p1, v0}, Lbu1;-><init>(I)V

    .line 38
    .line 39
    .line 40
    iput-object p1, p0, Lxn0;->l:Ljava/lang/Object;

    .line 41
    .line 42
    new-instance p1, Lbu1;

    .line 43
    .line 44
    const/4 v0, 0x0

    .line 45
    invoke-direct {p1, v0}, Lbu1;-><init>(I)V

    .line 46
    .line 47
    .line 48
    sget-object v0, Luu1;->o:Luu1;

    .line 49
    .line 50
    iget-object v1, p1, Lbu1;->a:Ljava/util/ArrayList;

    .line 51
    .line 52
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    sget-object v0, Luu1;->p:Luu1;

    .line 56
    .line 57
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    sget-object v0, Luu1;->q:Luu1;

    .line 61
    .line 62
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    sget-object v0, Luu1;->r:Luu1;

    .line 66
    .line 67
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    sget-object v0, Luu1;->s:Luu1;

    .line 71
    .line 72
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    sget-object v0, Luu1;->t:Luu1;

    .line 76
    .line 77
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    sget-object v0, Luu1;->u:Luu1;

    .line 81
    .line 82
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    invoke-virtual {p0, p1}, Lxn0;->z(Lbu1;)V

    .line 86
    .line 87
    .line 88
    new-instance p1, Lbu1;

    .line 89
    .line 90
    const/4 v0, 0x1

    .line 91
    invoke-direct {p1, v0}, Lbu1;-><init>(I)V

    .line 92
    .line 93
    .line 94
    sget-object v0, Luu1;->F:Luu1;

    .line 95
    .line 96
    iget-object v1, p1, Lbu1;->a:Ljava/util/ArrayList;

    .line 97
    .line 98
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    sget-object v0, Luu1;->S:Luu1;

    .line 102
    .line 103
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    sget-object v0, Luu1;->T:Luu1;

    .line 107
    .line 108
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    sget-object v0, Luu1;->U:Luu1;

    .line 112
    .line 113
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 114
    .line 115
    .line 116
    sget-object v0, Luu1;->V:Luu1;

    .line 117
    .line 118
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 119
    .line 120
    .line 121
    sget-object v0, Luu1;->X:Luu1;

    .line 122
    .line 123
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 124
    .line 125
    .line 126
    sget-object v0, Luu1;->Y:Luu1;

    .line 127
    .line 128
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 129
    .line 130
    .line 131
    sget-object v0, Luu1;->d0:Luu1;

    .line 132
    .line 133
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 134
    .line 135
    .line 136
    invoke-virtual {p0, p1}, Lxn0;->z(Lbu1;)V

    .line 137
    .line 138
    .line 139
    new-instance p1, Lbu1;

    .line 140
    .line 141
    const/4 v0, 0x2

    .line 142
    invoke-direct {p1, v0}, Lbu1;-><init>(I)V

    .line 143
    .line 144
    .line 145
    sget-object v0, Luu1;->m:Luu1;

    .line 146
    .line 147
    iget-object v1, p1, Lbu1;->a:Ljava/util/ArrayList;

    .line 148
    .line 149
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 150
    .line 151
    .line 152
    sget-object v0, Luu1;->v:Luu1;

    .line 153
    .line 154
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 155
    .line 156
    .line 157
    sget-object v0, Luu1;->w:Luu1;

    .line 158
    .line 159
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 160
    .line 161
    .line 162
    sget-object v0, Luu1;->x:Luu1;

    .line 163
    .line 164
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 165
    .line 166
    .line 167
    sget-object v0, Luu1;->C:Luu1;

    .line 168
    .line 169
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 170
    .line 171
    .line 172
    sget-object v0, Luu1;->z:Luu1;

    .line 173
    .line 174
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 175
    .line 176
    .line 177
    sget-object v0, Luu1;->D:Luu1;

    .line 178
    .line 179
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 180
    .line 181
    .line 182
    sget-object v0, Luu1;->H:Luu1;

    .line 183
    .line 184
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 185
    .line 186
    .line 187
    sget-object v0, Luu1;->W:Luu1;

    .line 188
    .line 189
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 190
    .line 191
    .line 192
    sget-object v0, Luu1;->i0:Luu1;

    .line 193
    .line 194
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 195
    .line 196
    .line 197
    sget-object v0, Luu1;->l0:Luu1;

    .line 198
    .line 199
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 200
    .line 201
    .line 202
    sget-object v0, Luu1;->o0:Luu1;

    .line 203
    .line 204
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 205
    .line 206
    .line 207
    sget-object v0, Luu1;->p0:Luu1;

    .line 208
    .line 209
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 210
    .line 211
    .line 212
    invoke-virtual {p0, p1}, Lxn0;->z(Lbu1;)V

    .line 213
    .line 214
    .line 215
    new-instance p1, Lbu1;

    .line 216
    .line 217
    const/4 v0, 0x3

    .line 218
    invoke-direct {p1, v0}, Lbu1;-><init>(I)V

    .line 219
    .line 220
    .line 221
    sget-object v0, Luu1;->l:Luu1;

    .line 222
    .line 223
    iget-object v1, p1, Lbu1;->a:Ljava/util/ArrayList;

    .line 224
    .line 225
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 226
    .line 227
    .line 228
    sget-object v0, Luu1;->c0:Luu1;

    .line 229
    .line 230
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 231
    .line 232
    .line 233
    sget-object v0, Luu1;->f0:Luu1;

    .line 234
    .line 235
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 236
    .line 237
    .line 238
    invoke-virtual {p0, p1}, Lxn0;->z(Lbu1;)V

    .line 239
    .line 240
    .line 241
    new-instance p1, Lbu1;

    .line 242
    .line 243
    const/4 v0, 0x4

    .line 244
    invoke-direct {p1, v0}, Lbu1;-><init>(I)V

    .line 245
    .line 246
    .line 247
    sget-object v0, Luu1;->I:Luu1;

    .line 248
    .line 249
    iget-object v1, p1, Lbu1;->a:Ljava/util/ArrayList;

    .line 250
    .line 251
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 252
    .line 253
    .line 254
    sget-object v0, Luu1;->J:Luu1;

    .line 255
    .line 256
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 257
    .line 258
    .line 259
    sget-object v0, Luu1;->K:Luu1;

    .line 260
    .line 261
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 262
    .line 263
    .line 264
    sget-object v0, Luu1;->L:Luu1;

    .line 265
    .line 266
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 267
    .line 268
    .line 269
    sget-object v0, Luu1;->M:Luu1;

    .line 270
    .line 271
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 272
    .line 273
    .line 274
    sget-object v0, Luu1;->N:Luu1;

    .line 275
    .line 276
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 277
    .line 278
    .line 279
    sget-object v0, Luu1;->O:Luu1;

    .line 280
    .line 281
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 282
    .line 283
    .line 284
    sget-object v0, Luu1;->t0:Luu1;

    .line 285
    .line 286
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 287
    .line 288
    .line 289
    invoke-virtual {p0, p1}, Lxn0;->z(Lbu1;)V

    .line 290
    .line 291
    .line 292
    new-instance p1, Lbu1;

    .line 293
    .line 294
    const/4 v0, 0x5

    .line 295
    invoke-direct {p1, v0}, Lbu1;-><init>(I)V

    .line 296
    .line 297
    .line 298
    sget-object v0, Luu1;->k:Luu1;

    .line 299
    .line 300
    iget-object v1, p1, Lbu1;->a:Ljava/util/ArrayList;

    .line 301
    .line 302
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 303
    .line 304
    .line 305
    sget-object v0, Luu1;->E:Luu1;

    .line 306
    .line 307
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 308
    .line 309
    .line 310
    sget-object v0, Luu1;->Z:Luu1;

    .line 311
    .line 312
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 313
    .line 314
    .line 315
    sget-object v0, Luu1;->a0:Luu1;

    .line 316
    .line 317
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 318
    .line 319
    .line 320
    sget-object v0, Luu1;->b0:Luu1;

    .line 321
    .line 322
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 323
    .line 324
    .line 325
    sget-object v0, Luu1;->g0:Luu1;

    .line 326
    .line 327
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 328
    .line 329
    .line 330
    sget-object v0, Luu1;->h0:Luu1;

    .line 331
    .line 332
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 333
    .line 334
    .line 335
    sget-object v0, Luu1;->j0:Luu1;

    .line 336
    .line 337
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 338
    .line 339
    .line 340
    sget-object v0, Luu1;->k0:Luu1;

    .line 341
    .line 342
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 343
    .line 344
    .line 345
    sget-object v0, Luu1;->n0:Luu1;

    .line 346
    .line 347
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 348
    .line 349
    .line 350
    invoke-virtual {p0, p1}, Lxn0;->z(Lbu1;)V

    .line 351
    .line 352
    .line 353
    new-instance p1, Lbu1;

    .line 354
    .line 355
    const/4 v0, 0x7

    .line 356
    invoke-direct {p1, v0}, Lbu1;-><init>(I)V

    .line 357
    .line 358
    .line 359
    sget-object v0, Luu1;->n:Luu1;

    .line 360
    .line 361
    iget-object v1, p1, Lbu1;->a:Ljava/util/ArrayList;

    .line 362
    .line 363
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 364
    .line 365
    .line 366
    sget-object v0, Luu1;->y:Luu1;

    .line 367
    .line 368
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 369
    .line 370
    .line 371
    sget-object v0, Luu1;->A:Luu1;

    .line 372
    .line 373
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 374
    .line 375
    .line 376
    sget-object v0, Luu1;->B:Luu1;

    .line 377
    .line 378
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 379
    .line 380
    .line 381
    sget-object v0, Luu1;->G:Luu1;

    .line 382
    .line 383
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 384
    .line 385
    .line 386
    sget-object v0, Luu1;->P:Luu1;

    .line 387
    .line 388
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 389
    .line 390
    .line 391
    sget-object v0, Luu1;->Q:Luu1;

    .line 392
    .line 393
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 394
    .line 395
    .line 396
    sget-object v0, Luu1;->R:Luu1;

    .line 397
    .line 398
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 399
    .line 400
    .line 401
    sget-object v0, Luu1;->e0:Luu1;

    .line 402
    .line 403
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 404
    .line 405
    .line 406
    sget-object v0, Luu1;->m0:Luu1;

    .line 407
    .line 408
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 409
    .line 410
    .line 411
    sget-object v0, Luu1;->q0:Luu1;

    .line 412
    .line 413
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 414
    .line 415
    .line 416
    sget-object v0, Luu1;->r0:Luu1;

    .line 417
    .line 418
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 419
    .line 420
    .line 421
    sget-object v0, Luu1;->s0:Luu1;

    .line 422
    .line 423
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 424
    .line 425
    .line 426
    invoke-virtual {p0, p1}, Lxn0;->z(Lbu1;)V

    .line 427
    .line 428
    .line 429
    return-void

    .line 430
    :pswitch_2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 431
    .line 432
    .line 433
    new-instance p1, Ljava/util/WeakHashMap;

    .line 434
    .line 435
    invoke-direct {p1}, Ljava/util/WeakHashMap;-><init>()V

    .line 436
    .line 437
    .line 438
    invoke-static {p1}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    .line 439
    .line 440
    .line 441
    move-result-object p1

    .line 442
    iput-object p1, p0, Lxn0;->l:Ljava/lang/Object;

    .line 443
    .line 444
    new-instance p1, Ljava/util/WeakHashMap;

    .line 445
    .line 446
    invoke-direct {p1}, Ljava/util/WeakHashMap;-><init>()V

    .line 447
    .line 448
    .line 449
    invoke-static {p1}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    .line 450
    .line 451
    .line 452
    move-result-object p1

    .line 453
    iput-object p1, p0, Lxn0;->k:Ljava/lang/Object;

    .line 454
    .line 455
    return-void

    .line 456
    :pswitch_3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 457
    .line 458
    .line 459
    new-instance p1, Lu71;

    .line 460
    .line 461
    invoke-direct {p1}, Lu71;-><init>()V

    .line 462
    .line 463
    .line 464
    iput-object p1, p0, Lxn0;->k:Ljava/lang/Object;

    .line 465
    .line 466
    new-instance p1, Luk0;

    .line 467
    .line 468
    invoke-direct {p1}, Luk0;-><init>()V

    .line 469
    .line 470
    .line 471
    iput-object p1, p0, Lxn0;->l:Ljava/lang/Object;

    .line 472
    .line 473
    return-void

    .line 474
    nop

    .line 475
    :pswitch_data_0
    .packed-switch 0x11
        :pswitch_3
        :pswitch_0
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public synthetic constructor <init>(ILjava/lang/Object;)V
    .locals 0

    .line 483
    iput p1, p0, Lxn0;->j:I

    iput-object p2, p0, Lxn0;->l:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(IZ)V
    .locals 0

    .line 475
    iput p1, p0, Lxn0;->j:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;I)V
    .locals 0

    iput p2, p0, Lxn0;->j:I

    packed-switch p2, :pswitch_data_0

    .line 492
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p2, 0x0

    .line 493
    iput-object p2, p0, Lxn0;->l:Ljava/lang/Object;

    .line 494
    iput-object p1, p0, Lxn0;->k:Ljava/lang/Object;

    return-void

    .line 495
    :pswitch_0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Lbh;->h(Ljava/lang/Object;)V

    .line 496
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    iput-object p1, p0, Lxn0;->k:Ljava/lang/Object;

    const p2, 0x7f11003f

    .line 497
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getResourcePackageName(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lxn0;->l:Ljava/lang/Object;

    return-void

    :pswitch_data_0
    .packed-switch 0xf
        :pswitch_0
    .end packed-switch
.end method

.method public constructor <init>(Lcom/google/android/gms/measurement/api/AppMeasurementSdk;Ls7;)V
    .locals 1

    const/16 v0, 0x16

    iput v0, p0, Lxn0;->j:I

    .line 478
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lxn0;->l:Ljava/lang/Object;

    new-instance p2, Liw1;

    const/4 v0, 0x0

    invoke-direct {p2, v0, p0}, Liw1;-><init>(ILjava/lang/Object;)V

    .line 479
    invoke-virtual {p1, p2}, Lcom/google/android/gms/measurement/api/AppMeasurementSdk;->a(Liw1;)V

    new-instance p1, Ljava/util/HashSet;

    .line 480
    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    iput-object p1, p0, Lxn0;->k:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lih1;)V
    .locals 1

    const/16 v0, 0x10

    iput v0, p0, Lxn0;->j:I

    .line 498
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 499
    iput-object p1, p0, Lxn0;->k:Ljava/lang/Object;

    .line 500
    new-instance p1, Lhh1;

    .line 501
    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 502
    iput v0, p1, Lhh1;->a:I

    .line 503
    iput-object p1, p0, Lxn0;->l:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;)V
    .locals 1

    const/4 v0, 0x4

    iput v0, p0, Lxn0;->j:I

    .line 481
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lxn0;->l:Ljava/lang/Object;

    new-instance p1, Ljava/util/ArrayList;

    .line 482
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lxn0;->k:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;ILjava/lang/Object;)V
    .locals 0

    .line 476
    iput p2, p0, Lxn0;->j:I

    iput-object p1, p0, Lxn0;->k:Ljava/lang/Object;

    iput-object p3, p0, Lxn0;->l:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;IZ)V
    .locals 0

    .line 477
    iput p3, p0, Lxn0;->j:I

    iput-object p1, p0, Lxn0;->l:Ljava/lang/Object;

    iput-object p2, p0, Lxn0;->k:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Llw0;)V
    .locals 1

    const/4 v0, 0x7

    iput v0, p0, Lxn0;->j:I

    .line 489
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 490
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lxn0;->l:Ljava/lang/Object;

    .line 491
    iput-object p1, p0, Lxn0;->k:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>([Lf91;)V
    .locals 1

    const/4 v0, 0x2

    iput v0, p0, Lxn0;->j:I

    .line 484
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 485
    iput-object p1, p0, Lxn0;->k:Ljava/lang/Object;

    .line 486
    new-instance p1, Lt11;

    const/16 v0, 0x11

    .line 487
    invoke-direct {p1, v0}, Lt11;-><init>(I)V

    .line 488
    iput-object p1, p0, Lxn0;->l:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public A(Ler0;Lst1;)Lst1;
    .locals 3

    .line 1
    invoke-static {p1}, Lbe2;->W(Ler0;)V

    .line 2
    .line 3
    .line 4
    instance-of v0, p2, Ltt1;

    .line 5
    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    check-cast p2, Ltt1;

    .line 9
    .line 10
    iget-object v0, p2, Ltt1;->k:Ljava/util/ArrayList;

    .line 11
    .line 12
    iget-object p2, p2, Ltt1;->j:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v1, p0, Lxn0;->k:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast v1, Ljava/util/HashMap;

    .line 17
    .line 18
    invoke-virtual {v1, p2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-eqz v2, :cond_0

    .line 23
    .line 24
    invoke-virtual {v1, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    check-cast p0, Lbu1;

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    iget-object p0, p0, Lxn0;->l:Ljava/lang/Object;

    .line 32
    .line 33
    check-cast p0, Lbu1;

    .line 34
    .line 35
    :goto_0
    invoke-virtual {p0, p2, p1, v0}, Lbu1;->a(Ljava/lang/String;Ler0;Ljava/util/ArrayList;)Lst1;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0

    .line 40
    :cond_1
    return-object p2
.end method

.method public a(Luw0;I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lxn0;->l:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, [I

    .line 4
    .line 5
    :try_start_0
    iget-object p0, p0, Lxn0;->k:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p0, [B

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    aget v2, v0, v1

    .line 11
    .line 12
    invoke-virtual {p1, p0, v2, p2}, Luw0;->read([BII)I

    .line 13
    .line 14
    .line 15
    aget p0, v0, v1

    .line 16
    .line 17
    add-int/2addr p0, p2

    .line 18
    aput p0, v0, v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    .line 20
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :catchall_0
    move-exception p0

    .line 25
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V

    .line 26
    .line 27
    .line 28
    throw p0
.end method

.method public accept(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 2

    .line 1
    check-cast p2, Llb1;

    .line 2
    .line 3
    check-cast p1, Lf42;

    .line 4
    .line 5
    sget v0, Lu32;->j:I

    .line 6
    .line 7
    new-instance v0, Lg32;

    .line 8
    .line 9
    invoke-direct {v0, p2}, Lg32;-><init>(Llb1;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1}, Ljg;->s()Landroid/os/IInterface;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    check-cast p1, Ld42;

    .line 17
    .line 18
    iget-object p2, p0, Lxn0;->l:Ljava/lang/Object;

    .line 19
    .line 20
    check-cast p2, [Ljava/lang/String;

    .line 21
    .line 22
    iget-object p0, p0, Lxn0;->k:Ljava/lang/Object;

    .line 23
    .line 24
    check-cast p0, Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {p1}, Lfl1;->F()Landroid/os/Parcel;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-static {v1, v0}, Lwu1;->c(Landroid/os/Parcel;Landroid/os/IInterface;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v1, p0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    const/4 p0, 0x0

    .line 37
    invoke-virtual {v1, p0}, Landroid/os/Parcel;->writeInt(I)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v1, p2}, Landroid/os/Parcel;->writeStringArray([Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    const/4 p0, 0x0

    .line 44
    invoke-virtual {v1, p0}, Landroid/os/Parcel;->writeByteArray([B)V

    .line 45
    .line 46
    .line 47
    const/4 p0, 0x1

    .line 48
    invoke-virtual {p1, v1, p0}, Lfl1;->G(Landroid/os/Parcel;I)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public b(Landroidx/preference/Preference;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lxn0;->k:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p1, Landroidx/preference/PreferenceGroup;

    .line 4
    .line 5
    const v0, 0x7fffffff

    .line 6
    .line 7
    .line 8
    iput v0, p1, Landroidx/preference/PreferenceGroup;->b0:I

    .line 9
    .line 10
    iget-object p0, p0, Lxn0;->l:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast p0, Lhu0;

    .line 13
    .line 14
    iget-object p1, p0, Lhu0;->g:Landroid/os/Handler;

    .line 15
    .line 16
    iget-object p0, p0, Lhu0;->h:Lfu0;

    .line 17
    .line 18
    invoke-virtual {p1, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public c(Ljava/lang/Object;Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    new-instance v2, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    add-int/lit8 v0, v0, 0x1

    .line 16
    .line 17
    add-int/2addr v0, v1

    .line 18
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 19
    .line 20
    .line 21
    const-string v0, "="

    .line 22
    .line 23
    invoke-static {v2, p2, v0, p1}, Loq;->n(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    iget-object p0, p0, Lxn0;->k:Ljava/lang/Object;

    .line 28
    .line 29
    check-cast p0, Ljava/util/ArrayList;

    .line 30
    .line 31
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public d(Ljd2;)Ljava/lang/Object;
    .locals 3

    .line 1
    invoke-virtual {p1}, Ljd2;->g()Ljava/lang/Exception;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Lof1;

    .line 6
    .line 7
    iget-object v1, p0, Lxn0;->l:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v1, Lf62;

    .line 10
    .line 11
    iget-object p0, p0, Lxn0;->k:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast p0, Lu32;

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {v1}, Lf62;->r()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p0, p1}, Lu32;->c(Ljava/lang/String;)Ljd2;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0

    .line 26
    :cond_0
    invoke-virtual {p1}, Ljd2;->g()Ljava/lang/Exception;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    instance-of v0, v0, Lx5;

    .line 31
    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    invoke-virtual {p1}, Ljd2;->g()Ljava/lang/Exception;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    check-cast v0, Lx5;

    .line 39
    .line 40
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 41
    .line 42
    .line 43
    iget-object v0, v0, Lx5;->j:Lcom/google/android/gms/common/api/Status;

    .line 44
    .line 45
    iget v0, v0, Lcom/google/android/gms/common/api/Status;->j:I

    .line 46
    .line 47
    const/16 v2, 0x734a

    .line 48
    .line 49
    if-ne v0, v2, :cond_1

    .line 50
    .line 51
    invoke-virtual {v1}, Lf62;->r()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-virtual {p0, p1}, Lu32;->c(Ljava/lang/String;)Ljd2;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    return-object p0

    .line 60
    :cond_1
    return-object p1
.end method

.method public e([Ljava/lang/StackTraceElement;)[Ljava/lang/StackTraceElement;
    .locals 6

    .line 1
    array-length v0, p1

    .line 2
    const/16 v1, 0x400

    .line 3
    .line 4
    if-gt v0, v1, :cond_0

    .line 5
    .line 6
    return-object p1

    .line 7
    :cond_0
    iget-object v0, p0, Lxn0;->k:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v0, [Lf91;

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    move-object v3, p1

    .line 13
    :goto_0
    const/4 v4, 0x1

    .line 14
    if-ge v2, v4, :cond_2

    .line 15
    .line 16
    aget-object v4, v0, v2

    .line 17
    .line 18
    array-length v5, v3

    .line 19
    if-gt v5, v1, :cond_1

    .line 20
    .line 21
    goto :goto_1

    .line 22
    :cond_1
    invoke-interface {v4, p1}, Lf91;->e([Ljava/lang/StackTraceElement;)[Ljava/lang/StackTraceElement;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    add-int/lit8 v2, v2, 0x1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_2
    :goto_1
    array-length p1, v3

    .line 30
    if-le p1, v1, :cond_3

    .line 31
    .line 32
    iget-object p0, p0, Lxn0;->l:Ljava/lang/Object;

    .line 33
    .line 34
    check-cast p0, Lt11;

    .line 35
    .line 36
    invoke-virtual {p0, v3}, Lt11;->e([Ljava/lang/StackTraceElement;)[Ljava/lang/StackTraceElement;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    return-object p0

    .line 41
    :cond_3
    return-object v3
.end method

.method public f(Lmu0;Ltw0;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lxn0;->k:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Lu71;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, p1, v0}, Lu71;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lei1;

    .line 11
    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    invoke-static {}, Lei1;->a()Lei1;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p0, p1, v0}, Lu71;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    :cond_0
    iput-object p2, v0, Lei1;->c:Ltw0;

    .line 22
    .line 23
    iget p0, v0, Lei1;->a:I

    .line 24
    .line 25
    or-int/lit8 p0, p0, 0x8

    .line 26
    .line 27
    iput p0, v0, Lei1;->a:I

    .line 28
    .line 29
    return-void
.end method

.method public g(Lnk;Ljava/io/ByteArrayOutputStream;)V
    .locals 2

    .line 1
    new-instance v0, Lgw0;

    .line 2
    .line 3
    iget-object v1, p0, Lxn0;->k:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v1, Ljava/util/HashMap;

    .line 6
    .line 7
    iget-object p0, p0, Lxn0;->l:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast p0, Ljava/util/HashMap;

    .line 10
    .line 11
    invoke-direct {v0, p2, v1, p0}, Lgw0;-><init>(Ljava/io/ByteArrayOutputStream;Ljava/util/HashMap;Ljava/util/HashMap;)V

    .line 12
    .line 13
    .line 14
    const-class p0, Lnk;

    .line 15
    .line 16
    invoke-virtual {v1, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    check-cast p2, Lir0;

    .line 21
    .line 22
    if-eqz p2, :cond_0

    .line 23
    .line 24
    invoke-interface {p2, p1, v0}, Ly00;->a(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    new-instance p1, Lb10;

    .line 29
    .line 30
    new-instance p2, Ljava/lang/StringBuilder;

    .line 31
    .line 32
    const-string v0, "No encoder for "

    .line 33
    .line 34
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-direct {p1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    throw p1
.end method

.method public get()Ljava/lang/Object;
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget v1, v0, Lxn0;->j:I

    .line 4
    .line 5
    sparse-switch v1, :sswitch_data_0

    .line 6
    .line 7
    .line 8
    iget-object v1, v0, Lxn0;->k:Ljava/lang/Object;

    .line 9
    .line 10
    check-cast v1, Ll42;

    .line 11
    .line 12
    iget-object v0, v0, Lxn0;->l:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast v0, Lxo1;

    .line 15
    .line 16
    iget-object v1, v1, Ll42;->k:Ljava/lang/Object;

    .line 17
    .line 18
    check-cast v1, Leg;

    .line 19
    .line 20
    invoke-virtual {v0}, Lxo1;->p()[B

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v1, v0}, Lfg;->a([B)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    return-object v0

    .line 29
    :sswitch_0
    iget-object v1, v0, Lxn0;->k:Ljava/lang/Object;

    .line 30
    .line 31
    check-cast v1, Ll42;

    .line 32
    .line 33
    iget-object v0, v0, Lxn0;->l:Ljava/lang/Object;

    .line 34
    .line 35
    check-cast v0, Ljava/lang/String;

    .line 36
    .line 37
    sget v2, Lpb0;->a:I

    .line 38
    .line 39
    sget v2, Lvo0;->u:I

    .line 40
    .line 41
    new-instance v2, Luo0;

    .line 42
    .line 43
    invoke-direct {v2}, Luo0;-><init>()V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {v2, v0}, Luo0;->c([B)Luo0;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    iget-object v2, v0, Luo0;->a:Ljava/nio/ByteBuffer;

    .line 55
    .line 56
    const/4 v3, 0x0

    .line 57
    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v2}, Ljava/nio/Buffer;->remaining()I

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    const/16 v4, 0x8

    .line 65
    .line 66
    if-ge v2, v4, :cond_0

    .line 67
    .line 68
    invoke-virtual {v0}, Luo0;->a()V

    .line 69
    .line 70
    .line 71
    :cond_0
    const-string v2, ""

    .line 72
    .line 73
    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    invoke-virtual {v0, v2}, Luo0;->c([B)Luo0;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-virtual {v0}, Luo0;->a()V

    .line 82
    .line 83
    .line 84
    iget-object v2, v0, Luo0;->a:Ljava/nio/ByteBuffer;

    .line 85
    .line 86
    invoke-virtual {v2}, Ljava/nio/Buffer;->flip()Ljava/nio/Buffer;

    .line 87
    .line 88
    .line 89
    invoke-virtual {v2}, Ljava/nio/Buffer;->remaining()I

    .line 90
    .line 91
    .line 92
    move-result v5

    .line 93
    const/16 v6, 0x21

    .line 94
    .line 95
    const/16 v7, 0x10

    .line 96
    .line 97
    if-lez v5, :cond_1

    .line 98
    .line 99
    iget v5, v0, Luo0;->d:I

    .line 100
    .line 101
    invoke-virtual {v2}, Ljava/nio/Buffer;->remaining()I

    .line 102
    .line 103
    .line 104
    move-result v8

    .line 105
    add-int/2addr v8, v5

    .line 106
    iput v8, v0, Luo0;->d:I

    .line 107
    .line 108
    invoke-virtual {v2}, Ljava/nio/Buffer;->remaining()I

    .line 109
    .line 110
    .line 111
    move-result v5

    .line 112
    const/16 v8, 0x18

    .line 113
    .line 114
    const/16 v9, 0x20

    .line 115
    .line 116
    const/16 v10, 0x28

    .line 117
    .line 118
    const/16 v11, 0x30

    .line 119
    .line 120
    const-wide/16 v12, 0x0

    .line 121
    .line 122
    packed-switch v5, :pswitch_data_0

    .line 123
    .line 124
    .line 125
    new-instance v0, Ljava/lang/AssertionError;

    .line 126
    .line 127
    const-string v1, "Should never get here."

    .line 128
    .line 129
    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    .line 130
    .line 131
    .line 132
    throw v0

    .line 133
    :pswitch_0
    const/16 v3, 0xe

    .line 134
    .line 135
    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->get(I)B

    .line 136
    .line 137
    .line 138
    move-result v3

    .line 139
    and-int/lit16 v3, v3, 0xff

    .line 140
    .line 141
    int-to-long v12, v3

    .line 142
    shl-long/2addr v12, v11

    .line 143
    :pswitch_1
    const/16 v3, 0xd

    .line 144
    .line 145
    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->get(I)B

    .line 146
    .line 147
    .line 148
    move-result v3

    .line 149
    and-int/lit16 v3, v3, 0xff

    .line 150
    .line 151
    int-to-long v14, v3

    .line 152
    shl-long v10, v14, v10

    .line 153
    .line 154
    xor-long/2addr v12, v10

    .line 155
    :pswitch_2
    const/16 v3, 0xc

    .line 156
    .line 157
    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->get(I)B

    .line 158
    .line 159
    .line 160
    move-result v3

    .line 161
    and-int/lit16 v3, v3, 0xff

    .line 162
    .line 163
    int-to-long v10, v3

    .line 164
    shl-long v9, v10, v9

    .line 165
    .line 166
    xor-long/2addr v12, v9

    .line 167
    :pswitch_3
    const/16 v3, 0xb

    .line 168
    .line 169
    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->get(I)B

    .line 170
    .line 171
    .line 172
    move-result v3

    .line 173
    and-int/lit16 v3, v3, 0xff

    .line 174
    .line 175
    int-to-long v9, v3

    .line 176
    shl-long v8, v9, v8

    .line 177
    .line 178
    xor-long/2addr v12, v8

    .line 179
    :pswitch_4
    const/16 v3, 0xa

    .line 180
    .line 181
    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->get(I)B

    .line 182
    .line 183
    .line 184
    move-result v3

    .line 185
    and-int/lit16 v3, v3, 0xff

    .line 186
    .line 187
    int-to-long v8, v3

    .line 188
    shl-long/2addr v8, v7

    .line 189
    xor-long/2addr v12, v8

    .line 190
    :pswitch_5
    const/16 v3, 0x9

    .line 191
    .line 192
    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->get(I)B

    .line 193
    .line 194
    .line 195
    move-result v3

    .line 196
    and-int/lit16 v3, v3, 0xff

    .line 197
    .line 198
    int-to-long v8, v3

    .line 199
    shl-long/2addr v8, v4

    .line 200
    xor-long/2addr v12, v8

    .line 201
    :pswitch_6
    invoke-virtual {v2, v4}, Ljava/nio/ByteBuffer;->get(I)B

    .line 202
    .line 203
    .line 204
    move-result v3

    .line 205
    and-int/lit16 v3, v3, 0xff

    .line 206
    .line 207
    int-to-long v3, v3

    .line 208
    xor-long/2addr v12, v3

    .line 209
    :pswitch_7
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->getLong()J

    .line 210
    .line 211
    .line 212
    move-result-wide v3

    .line 213
    goto :goto_6

    .line 214
    :pswitch_8
    const/4 v5, 0x6

    .line 215
    invoke-virtual {v2, v5}, Ljava/nio/ByteBuffer;->get(I)B

    .line 216
    .line 217
    .line 218
    move-result v5

    .line 219
    and-int/lit16 v5, v5, 0xff

    .line 220
    .line 221
    int-to-long v14, v5

    .line 222
    shl-long/2addr v14, v11

    .line 223
    goto :goto_0

    .line 224
    :pswitch_9
    move-wide v14, v12

    .line 225
    :goto_0
    const/4 v5, 0x5

    .line 226
    invoke-virtual {v2, v5}, Ljava/nio/ByteBuffer;->get(I)B

    .line 227
    .line 228
    .line 229
    move-result v5

    .line 230
    and-int/lit16 v5, v5, 0xff

    .line 231
    .line 232
    move/from16 p0, v4

    .line 233
    .line 234
    int-to-long v4, v5

    .line 235
    shl-long/2addr v4, v10

    .line 236
    xor-long/2addr v4, v14

    .line 237
    goto :goto_1

    .line 238
    :pswitch_a
    move/from16 p0, v4

    .line 239
    .line 240
    move-wide v4, v12

    .line 241
    :goto_1
    const/4 v10, 0x4

    .line 242
    invoke-virtual {v2, v10}, Ljava/nio/ByteBuffer;->get(I)B

    .line 243
    .line 244
    .line 245
    move-result v10

    .line 246
    and-int/lit16 v10, v10, 0xff

    .line 247
    .line 248
    int-to-long v10, v10

    .line 249
    shl-long v9, v10, v9

    .line 250
    .line 251
    xor-long/2addr v4, v9

    .line 252
    goto :goto_2

    .line 253
    :pswitch_b
    move/from16 p0, v4

    .line 254
    .line 255
    move-wide v4, v12

    .line 256
    :goto_2
    const/4 v9, 0x3

    .line 257
    invoke-virtual {v2, v9}, Ljava/nio/ByteBuffer;->get(I)B

    .line 258
    .line 259
    .line 260
    move-result v9

    .line 261
    and-int/lit16 v9, v9, 0xff

    .line 262
    .line 263
    int-to-long v9, v9

    .line 264
    shl-long v8, v9, v8

    .line 265
    .line 266
    xor-long/2addr v4, v8

    .line 267
    goto :goto_3

    .line 268
    :pswitch_c
    move/from16 p0, v4

    .line 269
    .line 270
    move-wide v4, v12

    .line 271
    :goto_3
    const/4 v8, 0x2

    .line 272
    invoke-virtual {v2, v8}, Ljava/nio/ByteBuffer;->get(I)B

    .line 273
    .line 274
    .line 275
    move-result v8

    .line 276
    and-int/lit16 v8, v8, 0xff

    .line 277
    .line 278
    int-to-long v8, v8

    .line 279
    shl-long/2addr v8, v7

    .line 280
    xor-long/2addr v4, v8

    .line 281
    goto :goto_4

    .line 282
    :pswitch_d
    move/from16 p0, v4

    .line 283
    .line 284
    move-wide v4, v12

    .line 285
    :goto_4
    const/4 v8, 0x1

    .line 286
    invoke-virtual {v2, v8}, Ljava/nio/ByteBuffer;->get(I)B

    .line 287
    .line 288
    .line 289
    move-result v8

    .line 290
    and-int/lit16 v8, v8, 0xff

    .line 291
    .line 292
    int-to-long v8, v8

    .line 293
    shl-long v8, v8, p0

    .line 294
    .line 295
    xor-long/2addr v4, v8

    .line 296
    goto :goto_5

    .line 297
    :pswitch_e
    move-wide v4, v12

    .line 298
    :goto_5
    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->get(I)B

    .line 299
    .line 300
    .line 301
    move-result v3

    .line 302
    and-int/lit16 v3, v3, 0xff

    .line 303
    .line 304
    int-to-long v8, v3

    .line 305
    xor-long v3, v4, v8

    .line 306
    .line 307
    :goto_6
    iget-wide v8, v0, Luo0;->b:J

    .line 308
    .line 309
    const-wide v10, -0x783c846eeebdac2bL

    .line 310
    .line 311
    .line 312
    .line 313
    .line 314
    mul-long/2addr v3, v10

    .line 315
    const/16 v5, 0x1f

    .line 316
    .line 317
    invoke-static {v3, v4, v5}, Ljava/lang/Long;->rotateLeft(JI)J

    .line 318
    .line 319
    .line 320
    move-result-wide v3

    .line 321
    const-wide v14, 0x4cf5ad432745937fL    # 5.573325460219186E62

    .line 322
    .line 323
    .line 324
    .line 325
    .line 326
    mul-long/2addr v3, v14

    .line 327
    xor-long/2addr v3, v8

    .line 328
    iput-wide v3, v0, Luo0;->b:J

    .line 329
    .line 330
    iget-wide v3, v0, Luo0;->c:J

    .line 331
    .line 332
    mul-long/2addr v12, v14

    .line 333
    invoke-static {v12, v13, v6}, Ljava/lang/Long;->rotateLeft(JI)J

    .line 334
    .line 335
    .line 336
    move-result-wide v8

    .line 337
    mul-long/2addr v8, v10

    .line 338
    xor-long/2addr v3, v8

    .line 339
    iput-wide v3, v0, Luo0;->c:J

    .line 340
    .line 341
    invoke-virtual {v2}, Ljava/nio/Buffer;->limit()I

    .line 342
    .line 343
    .line 344
    move-result v3

    .line 345
    invoke-virtual {v2, v3}, Ljava/nio/Buffer;->position(I)Ljava/nio/Buffer;

    .line 346
    .line 347
    .line 348
    :cond_1
    iget-wide v2, v0, Luo0;->b:J

    .line 349
    .line 350
    iget v4, v0, Luo0;->d:I

    .line 351
    .line 352
    int-to-long v4, v4

    .line 353
    xor-long/2addr v2, v4

    .line 354
    iget-wide v8, v0, Luo0;->c:J

    .line 355
    .line 356
    xor-long/2addr v4, v8

    .line 357
    add-long/2addr v2, v4

    .line 358
    add-long/2addr v4, v2

    .line 359
    ushr-long v8, v2, v6

    .line 360
    .line 361
    xor-long/2addr v2, v8

    .line 362
    const-wide v8, -0xae502812aa7333L

    .line 363
    .line 364
    .line 365
    .line 366
    .line 367
    mul-long/2addr v2, v8

    .line 368
    ushr-long v10, v2, v6

    .line 369
    .line 370
    xor-long/2addr v2, v10

    .line 371
    const-wide v10, -0x3b314601e57a13adL    # -2.902039044684214E23

    .line 372
    .line 373
    .line 374
    .line 375
    .line 376
    mul-long/2addr v2, v10

    .line 377
    ushr-long v12, v2, v6

    .line 378
    .line 379
    xor-long/2addr v2, v12

    .line 380
    ushr-long v12, v4, v6

    .line 381
    .line 382
    xor-long/2addr v4, v12

    .line 383
    mul-long/2addr v4, v8

    .line 384
    ushr-long v8, v4, v6

    .line 385
    .line 386
    xor-long/2addr v4, v8

    .line 387
    mul-long/2addr v4, v10

    .line 388
    ushr-long v8, v4, v6

    .line 389
    .line 390
    xor-long/2addr v4, v8

    .line 391
    add-long/2addr v2, v4

    .line 392
    iput-wide v2, v0, Luo0;->b:J

    .line 393
    .line 394
    add-long/2addr v4, v2

    .line 395
    iput-wide v4, v0, Luo0;->c:J

    .line 396
    .line 397
    new-array v2, v7, [B

    .line 398
    .line 399
    invoke-static {v2}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 400
    .line 401
    .line 402
    move-result-object v2

    .line 403
    sget-object v3, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    .line 404
    .line 405
    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 406
    .line 407
    .line 408
    move-result-object v2

    .line 409
    iget-wide v3, v0, Luo0;->b:J

    .line 410
    .line 411
    invoke-virtual {v2, v3, v4}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 412
    .line 413
    .line 414
    move-result-object v2

    .line 415
    iget-wide v3, v0, Luo0;->c:J

    .line 416
    .line 417
    invoke-virtual {v2, v3, v4}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 418
    .line 419
    .line 420
    move-result-object v0

    .line 421
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    .line 422
    .line 423
    .line 424
    move-result-object v0

    .line 425
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 426
    .line 427
    .line 428
    invoke-virtual {v0}, [B->clone()Ljava/lang/Object;

    .line 429
    .line 430
    .line 431
    move-result-object v0

    .line 432
    check-cast v0, [B

    .line 433
    .line 434
    iget-object v1, v1, Ll42;->k:Ljava/lang/Object;

    .line 435
    .line 436
    check-cast v1, Leg;

    .line 437
    .line 438
    invoke-virtual {v1, v0}, Lfg;->a([B)Ljava/lang/String;

    .line 439
    .line 440
    .line 441
    move-result-object v0

    .line 442
    return-object v0

    .line 443
    :sswitch_1
    new-instance v2, Ltb0;

    .line 444
    .line 445
    const/16 v1, 0x17

    .line 446
    .line 447
    invoke-direct {v2, v1}, Ltb0;-><init>(I)V

    .line 448
    .line 449
    .line 450
    new-instance v3, Lt11;

    .line 451
    .line 452
    const/16 v1, 0x16

    .line 453
    .line 454
    invoke-direct {v3, v1}, Lt11;-><init>(I)V

    .line 455
    .line 456
    .line 457
    iget-object v1, v0, Lxn0;->k:Ljava/lang/Object;

    .line 458
    .line 459
    check-cast v1, Lkw0;

    .line 460
    .line 461
    invoke-interface {v1}, Lkw0;->get()Ljava/lang/Object;

    .line 462
    .line 463
    .line 464
    move-result-object v1

    .line 465
    iget-object v0, v0, Lxn0;->l:Ljava/lang/Object;

    .line 466
    .line 467
    move-object v6, v0

    .line 468
    check-cast v6, Lkw0;

    .line 469
    .line 470
    move-object v0, v1

    .line 471
    new-instance v1, Lh21;

    .line 472
    .line 473
    move-object v5, v0

    .line 474
    check-cast v5, Le31;

    .line 475
    .line 476
    sget-object v4, Lme;->f:Lme;

    .line 477
    .line 478
    invoke-direct/range {v1 .. v6}, Lh21;-><init>(Lok;Lok;Lme;Le31;Lkw0;)V

    .line 479
    .line 480
    .line 481
    return-object v1

    .line 482
    :sswitch_2
    iget-object v1, v0, Lxn0;->k:Ljava/lang/Object;

    .line 483
    .line 484
    check-cast v1, Lpa0;

    .line 485
    .line 486
    iget-object v1, v1, Lpa0;->k:Ljava/lang/Object;

    .line 487
    .line 488
    check-cast v1, Landroid/content/Context;

    .line 489
    .line 490
    iget-object v0, v0, Lxn0;->l:Ljava/lang/Object;

    .line 491
    .line 492
    check-cast v0, Lpa0;

    .line 493
    .line 494
    invoke-virtual {v0}, Lpa0;->get()Ljava/lang/Object;

    .line 495
    .line 496
    .line 497
    move-result-object v0

    .line 498
    new-instance v2, Lyn0;

    .line 499
    .line 500
    check-cast v0, Lc9;

    .line 501
    .line 502
    invoke-direct {v2, v1, v0}, Lyn0;-><init>(Landroid/content/Context;Lc9;)V

    .line 503
    .line 504
    .line 505
    return-object v2

    .line 506
    nop

    .line 507
    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_2
        0xc -> :sswitch_1
        0x1b -> :sswitch_0
    .end sparse-switch

    .line 508
    .line 509
    .line 510
    .line 511
    .line 512
    .line 513
    .line 514
    .line 515
    .line 516
    .line 517
    .line 518
    .line 519
    .line 520
    .line 521
    :pswitch_data_0
    .packed-switch 0x1
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

.method public h(I)V
    .locals 4

    .line 1
    iget-object v0, p0, Lxn0;->k:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, [I

    .line 4
    .line 5
    const/4 v1, -0x1

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    const/16 v0, 0xa

    .line 9
    .line 10
    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    add-int/lit8 p1, p1, 0x1

    .line 15
    .line 16
    new-array p1, p1, [I

    .line 17
    .line 18
    iput-object p1, p0, Lxn0;->k:Ljava/lang/Object;

    .line 19
    .line 20
    invoke-static {p1, v1}, Ljava/util/Arrays;->fill([II)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    array-length v2, v0

    .line 25
    if-lt p1, v2, :cond_2

    .line 26
    .line 27
    array-length v2, v0

    .line 28
    :goto_0
    if-gt v2, p1, :cond_1

    .line 29
    .line 30
    mul-int/lit8 v2, v2, 0x2

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    new-array p1, v2, [I

    .line 34
    .line 35
    iput-object p1, p0, Lxn0;->k:Ljava/lang/Object;

    .line 36
    .line 37
    array-length v2, v0

    .line 38
    const/4 v3, 0x0

    .line 39
    invoke-static {v0, v3, p1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Lxn0;->k:Ljava/lang/Object;

    .line 43
    .line 44
    check-cast p0, [I

    .line 45
    .line 46
    array-length p1, v0

    .line 47
    array-length v0, p0

    .line 48
    invoke-static {p0, p1, v0, v1}, Ljava/util/Arrays;->fill([IIII)V

    .line 49
    .line 50
    .line 51
    :cond_2
    return-void
.end method

.method public i(IIII)Landroid/view/View;
    .locals 8

    .line 1
    iget-object v0, p0, Lxn0;->l:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lhh1;

    .line 4
    .line 5
    iget-object p0, p0, Lxn0;->k:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p0, Lih1;

    .line 8
    .line 9
    invoke-interface {p0}, Lih1;->m()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    invoke-interface {p0}, Lih1;->a()I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    if-le p2, p1, :cond_0

    .line 18
    .line 19
    const/4 v3, 0x1

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const/4 v3, -0x1

    .line 22
    :goto_0
    const/4 v4, 0x0

    .line 23
    :goto_1
    if-eq p1, p2, :cond_3

    .line 24
    .line 25
    invoke-interface {p0, p1}, Lih1;->k(I)Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object v5

    .line 29
    invoke-interface {p0, v5}, Lih1;->f(Landroid/view/View;)I

    .line 30
    .line 31
    .line 32
    move-result v6

    .line 33
    invoke-interface {p0, v5}, Lih1;->n(Landroid/view/View;)I

    .line 34
    .line 35
    .line 36
    move-result v7

    .line 37
    iput v1, v0, Lhh1;->b:I

    .line 38
    .line 39
    iput v2, v0, Lhh1;->c:I

    .line 40
    .line 41
    iput v6, v0, Lhh1;->d:I

    .line 42
    .line 43
    iput v7, v0, Lhh1;->e:I

    .line 44
    .line 45
    if-eqz p3, :cond_1

    .line 46
    .line 47
    iput p3, v0, Lhh1;->a:I

    .line 48
    .line 49
    invoke-virtual {v0}, Lhh1;->a()Z

    .line 50
    .line 51
    .line 52
    move-result v6

    .line 53
    if-eqz v6, :cond_1

    .line 54
    .line 55
    return-object v5

    .line 56
    :cond_1
    if-eqz p4, :cond_2

    .line 57
    .line 58
    iput p4, v0, Lhh1;->a:I

    .line 59
    .line 60
    invoke-virtual {v0}, Lhh1;->a()Z

    .line 61
    .line 62
    .line 63
    move-result v6

    .line 64
    if-eqz v6, :cond_2

    .line 65
    .line 66
    move-object v4, v5

    .line 67
    :cond_2
    add-int/2addr p1, v3

    .line 68
    goto :goto_1

    .line 69
    :cond_3
    return-object v4
.end method

.method public j(Ljd2;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lxn0;->l:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p1, Lxn0;

    .line 4
    .line 5
    iget-object p1, p1, Lxn0;->k:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p1, Ljava/util/Map;

    .line 8
    .line 9
    iget-object p0, p0, Lxn0;->k:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast p0, Llb1;

    .line 12
    .line 13
    invoke-interface {p1, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public k(Ljava/lang/String;)Lcom/google/android/datatransport/cct/CctBackendFactory;
    .locals 12

    .line 1
    const-string v0, "."

    .line 2
    .line 3
    const-string v1, "Could not instantiate "

    .line 4
    .line 5
    iget-object v2, p0, Lxn0;->l:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v2, Ljava/util/Map;

    .line 8
    .line 9
    const/4 v3, 0x0

    .line 10
    if-nez v2, :cond_6

    .line 11
    .line 12
    iget-object v2, p0, Lxn0;->k:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast v2, Landroid/content/Context;

    .line 15
    .line 16
    :try_start_0
    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 17
    .line 18
    .line 19
    move-result-object v4

    .line 20
    if-nez v4, :cond_0

    .line 21
    .line 22
    :catch_0
    :goto_0
    move-object v2, v3

    .line 23
    goto :goto_1

    .line 24
    :cond_0
    new-instance v5, Landroid/content/ComponentName;

    .line 25
    .line 26
    const-class v6, Lcom/google/android/datatransport/runtime/backends/TransportBackendDiscovery;

    .line 27
    .line 28
    invoke-direct {v5, v2, v6}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 29
    .line 30
    .line 31
    const/16 v2, 0x80

    .line 32
    .line 33
    invoke-virtual {v4, v5, v2}, Landroid/content/pm/PackageManager;->getServiceInfo(Landroid/content/ComponentName;I)Landroid/content/pm/ServiceInfo;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    if-nez v2, :cond_1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    iget-object v2, v2, Landroid/content/pm/ServiceInfo;->metaData:Landroid/os/Bundle;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 41
    .line 42
    :goto_1
    if-nez v2, :cond_2

    .line 43
    .line 44
    sget-object v2, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    .line 45
    .line 46
    goto :goto_4

    .line 47
    :cond_2
    new-instance v4, Ljava/util/HashMap;

    .line 48
    .line 49
    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v2}, Landroid/os/BaseBundle;->keySet()Ljava/util/Set;

    .line 53
    .line 54
    .line 55
    move-result-object v5

    .line 56
    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 57
    .line 58
    .line 59
    move-result-object v5

    .line 60
    :cond_3
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 61
    .line 62
    .line 63
    move-result v6

    .line 64
    if-eqz v6, :cond_5

    .line 65
    .line 66
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v6

    .line 70
    check-cast v6, Ljava/lang/String;

    .line 71
    .line 72
    invoke-virtual {v2, v6}, Landroid/os/BaseBundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v7

    .line 76
    instance-of v8, v7, Ljava/lang/String;

    .line 77
    .line 78
    if-eqz v8, :cond_3

    .line 79
    .line 80
    const-string v8, "backend:"

    .line 81
    .line 82
    invoke-virtual {v6, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 83
    .line 84
    .line 85
    move-result v8

    .line 86
    if-eqz v8, :cond_3

    .line 87
    .line 88
    check-cast v7, Ljava/lang/String;

    .line 89
    .line 90
    const-string v8, ","

    .line 91
    .line 92
    const/4 v9, -0x1

    .line 93
    invoke-virtual {v7, v8, v9}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v7

    .line 97
    array-length v8, v7

    .line 98
    const/4 v9, 0x0

    .line 99
    :goto_2
    if-ge v9, v8, :cond_3

    .line 100
    .line 101
    aget-object v10, v7, v9

    .line 102
    .line 103
    invoke-virtual {v10}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v10

    .line 107
    invoke-virtual {v10}, Ljava/lang/String;->isEmpty()Z

    .line 108
    .line 109
    .line 110
    move-result v11

    .line 111
    if-eqz v11, :cond_4

    .line 112
    .line 113
    goto :goto_3

    .line 114
    :cond_4
    const/16 v11, 0x8

    .line 115
    .line 116
    invoke-virtual {v6, v11}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v11

    .line 120
    invoke-virtual {v4, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    :goto_3
    add-int/lit8 v9, v9, 0x1

    .line 124
    .line 125
    goto :goto_2

    .line 126
    :cond_5
    move-object v2, v4

    .line 127
    :goto_4
    iput-object v2, p0, Lxn0;->l:Ljava/lang/Object;

    .line 128
    .line 129
    :cond_6
    invoke-interface {v2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 130
    .line 131
    .line 132
    move-result-object p0

    .line 133
    check-cast p0, Ljava/lang/String;

    .line 134
    .line 135
    if-nez p0, :cond_7

    .line 136
    .line 137
    return-object v3

    .line 138
    :cond_7
    :try_start_1
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    const-class v2, Lcom/google/android/datatransport/cct/CctBackendFactory;

    .line 143
    .line 144
    invoke-virtual {p1, v2}, Ljava/lang/Class;->asSubclass(Ljava/lang/Class;)Ljava/lang/Class;

    .line 145
    .line 146
    .line 147
    move-result-object p1

    .line 148
    invoke-virtual {p1, v3}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    invoke-virtual {p1, v3}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    .line 153
    .line 154
    .line 155
    move-result-object p1

    .line 156
    check-cast p1, Lcom/google/android/datatransport/cct/CctBackendFactory;
    :try_end_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_5
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_4
    .catch Ljava/lang/InstantiationException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_1 .. :try_end_1} :catch_1

    .line 157
    .line 158
    return-object p1

    .line 159
    :catch_1
    invoke-virtual {v1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    goto :goto_5

    .line 163
    :catch_2
    invoke-virtual {v1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    goto :goto_5

    .line 167
    :catch_3
    new-instance p1, Ljava/lang/StringBuilder;

    .line 168
    .line 169
    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 170
    .line 171
    .line 172
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 173
    .line 174
    .line 175
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 176
    .line 177
    .line 178
    goto :goto_5

    .line 179
    :catch_4
    new-instance p1, Ljava/lang/StringBuilder;

    .line 180
    .line 181
    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 182
    .line 183
    .line 184
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 185
    .line 186
    .line 187
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 188
    .line 189
    .line 190
    goto :goto_5

    .line 191
    :catch_5
    new-instance p1, Ljava/lang/StringBuilder;

    .line 192
    .line 193
    const-string v0, "Class "

    .line 194
    .line 195
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 196
    .line 197
    .line 198
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 199
    .line 200
    .line 201
    const-string p0, " is not found."

    .line 202
    .line 203
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 204
    .line 205
    .line 206
    :goto_5
    return-object v3
.end method

.method public l(Lzm;)Lgf;
    .locals 12

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    iget-object v1, p1, Lzm;->g:Lorg/json/JSONArray;

    .line 4
    .line 5
    iget-wide v2, p1, Lzm;->f:J

    .line 6
    .line 7
    new-instance p1, Ljava/util/HashSet;

    .line 8
    .line 9
    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    .line 10
    .line 11
    .line 12
    const/4 v4, 0x0

    .line 13
    move v5, v4

    .line 14
    :goto_0
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    .line 15
    .line 16
    .line 17
    move-result v6

    .line 18
    if-ge v5, v6, :cond_8

    .line 19
    .line 20
    :try_start_0
    invoke-virtual {v1, v5}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    .line 21
    .line 22
    .line 23
    move-result-object v6

    .line 24
    const-string v7, "rolloutId"

    .line 25
    .line 26
    invoke-virtual {v6, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v7

    .line 30
    const-string v8, "affectedParameterKeys"

    .line 31
    .line 32
    invoke-virtual {v6, v8}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 33
    .line 34
    .line 35
    move-result-object v8

    .line 36
    invoke-virtual {v8}, Lorg/json/JSONArray;->length()I

    .line 37
    .line 38
    .line 39
    move-result v9

    .line 40
    const/4 v10, 0x1

    .line 41
    if-le v9, v10, :cond_0

    .line 42
    .line 43
    const-string v9, "Rollout has multiple affected parameter keys.Only the first key will be included in RolloutsState. rolloutId: %s, affectedParameterKeys: %s"

    .line 44
    .line 45
    filled-new-array {v7, v8}, [Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v11

    .line 49
    invoke-static {v9, v11}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    :cond_0
    invoke-virtual {v8, v4, v0}, Lorg/json/JSONArray;->optString(ILjava/lang/String;)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v8

    .line 56
    iget-object v9, p0, Lxn0;->k:Ljava/lang/Object;

    .line 57
    .line 58
    check-cast v9, Lxm;

    .line 59
    .line 60
    invoke-virtual {v9}, Lxm;->c()Lzm;

    .line 61
    .line 62
    .line 63
    move-result-object v9
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_2

    .line 64
    const/4 v11, 0x0

    .line 65
    if-nez v9, :cond_1

    .line 66
    .line 67
    :catch_0
    move-object v9, v11

    .line 68
    goto :goto_1

    .line 69
    :cond_1
    :try_start_1
    iget-object v9, v9, Lzm;->b:Lorg/json/JSONObject;

    .line 70
    .line 71
    invoke-virtual {v9, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v9
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    .line 75
    :goto_1
    if-eqz v9, :cond_2

    .line 76
    .line 77
    goto :goto_3

    .line 78
    :cond_2
    :try_start_2
    iget-object v9, p0, Lxn0;->l:Ljava/lang/Object;

    .line 79
    .line 80
    check-cast v9, Lxm;

    .line 81
    .line 82
    invoke-virtual {v9}, Lxm;->c()Lzm;

    .line 83
    .line 84
    .line 85
    move-result-object v9
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_2

    .line 86
    if-nez v9, :cond_3

    .line 87
    .line 88
    goto :goto_2

    .line 89
    :cond_3
    :try_start_3
    iget-object v9, v9, Lzm;->b:Lorg/json/JSONObject;

    .line 90
    .line 91
    invoke-virtual {v9, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v11
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_1

    .line 95
    :catch_1
    :goto_2
    if-eqz v11, :cond_4

    .line 96
    .line 97
    move-object v9, v11

    .line 98
    goto :goto_3

    .line 99
    :cond_4
    move-object v9, v0

    .line 100
    :goto_3
    :try_start_4
    sget v11, Lq11;->a:I

    .line 101
    .line 102
    new-instance v11, Ldf;

    .line 103
    .line 104
    invoke-direct {v11}, Ljava/lang/Object;-><init>()V

    .line 105
    .line 106
    .line 107
    if-eqz v7, :cond_7

    .line 108
    .line 109
    iput-object v7, v11, Ldf;->a:Ljava/lang/String;

    .line 110
    .line 111
    const-string v7, "variantId"

    .line 112
    .line 113
    invoke-virtual {v6, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v6

    .line 117
    if-eqz v6, :cond_6

    .line 118
    .line 119
    iput-object v6, v11, Ldf;->b:Ljava/lang/String;

    .line 120
    .line 121
    if-eqz v8, :cond_5

    .line 122
    .line 123
    iput-object v8, v11, Ldf;->c:Ljava/lang/String;

    .line 124
    .line 125
    iput-object v9, v11, Ldf;->d:Ljava/lang/String;

    .line 126
    .line 127
    iput-wide v2, v11, Ldf;->e:J

    .line 128
    .line 129
    iget-byte v6, v11, Ldf;->f:B

    .line 130
    .line 131
    or-int/2addr v6, v10

    .line 132
    int-to-byte v6, v6

    .line 133
    iput-byte v6, v11, Ldf;->f:B

    .line 134
    .line 135
    invoke-virtual {v11}, Ldf;->a()Lef;

    .line 136
    .line 137
    .line 138
    move-result-object v6

    .line 139
    invoke-virtual {p1, v6}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 140
    .line 141
    .line 142
    add-int/lit8 v5, v5, 0x1

    .line 143
    .line 144
    goto/16 :goto_0

    .line 145
    .line 146
    :cond_5
    new-instance p0, Ljava/lang/NullPointerException;

    .line 147
    .line 148
    const-string p1, "Null parameterKey"

    .line 149
    .line 150
    invoke-direct {p0, p1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 151
    .line 152
    .line 153
    throw p0

    .line 154
    :cond_6
    new-instance p0, Ljava/lang/NullPointerException;

    .line 155
    .line 156
    const-string p1, "Null variantId"

    .line 157
    .line 158
    invoke-direct {p0, p1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 159
    .line 160
    .line 161
    throw p0

    .line 162
    :cond_7
    new-instance p0, Ljava/lang/NullPointerException;

    .line 163
    .line 164
    const-string p1, "Null rolloutId"

    .line 165
    .line 166
    invoke-direct {p0, p1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 167
    .line 168
    .line 169
    throw p0
    :try_end_4
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_4} :catch_2

    .line 170
    :catch_2
    move-exception p0

    .line 171
    new-instance p1, Lw40;

    .line 172
    .line 173
    const-string v0, "Exception parsing rollouts metadata to create RolloutsState."

    .line 174
    .line 175
    invoke-direct {p1, v0, p0}, Lx30;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 176
    .line 177
    .line 178
    throw p1

    .line 179
    :cond_8
    new-instance p0, Lgf;

    .line 180
    .line 181
    invoke-direct {p0, p1}, Lgf;-><init>(Ljava/util/HashSet;)V

    .line 182
    .line 183
    .line 184
    return-object p0
.end method

.method public m()Ljava/io/File;
    .locals 3

    .line 1
    const-string v0, "PersistedInstallation."

    .line 2
    .line 3
    iget-object v1, p0, Lxn0;->k:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v1, Ljava/io/File;

    .line 6
    .line 7
    if-nez v1, :cond_2

    .line 8
    .line 9
    monitor-enter p0

    .line 10
    :try_start_0
    iget-object v1, p0, Lxn0;->k:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast v1, Ljava/io/File;

    .line 13
    .line 14
    if-nez v1, :cond_1

    .line 15
    .line 16
    new-instance v1, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lxn0;->l:Ljava/lang/Object;

    .line 22
    .line 23
    check-cast v0, Lu30;

    .line 24
    .line 25
    invoke-virtual {v0}, Lu30;->d()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    const-string v0, ".json"

    .line 33
    .line 34
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    new-instance v1, Ljava/io/File;

    .line 42
    .line 43
    iget-object v2, p0, Lxn0;->l:Ljava/lang/Object;

    .line 44
    .line 45
    check-cast v2, Lu30;

    .line 46
    .line 47
    invoke-virtual {v2}, Lu30;->a()V

    .line 48
    .line 49
    .line 50
    iget-object v2, v2, Lu30;->a:Landroid/content/Context;

    .line 51
    .line 52
    invoke-virtual {v2}, Landroid/content/Context;->getNoBackupFilesDir()Ljava/io/File;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    invoke-direct {v1, v2, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    iput-object v1, p0, Lxn0;->k:Ljava/lang/Object;

    .line 60
    .line 61
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    if-eqz v1, :cond_0

    .line 66
    .line 67
    iget-object v0, p0, Lxn0;->k:Ljava/lang/Object;

    .line 68
    .line 69
    check-cast v0, Ljava/io/File;

    .line 70
    .line 71
    monitor-exit p0

    .line 72
    return-object v0

    .line 73
    :catchall_0
    move-exception v0

    .line 74
    goto :goto_0

    .line 75
    :cond_0
    new-instance v1, Ljava/io/File;

    .line 76
    .line 77
    iget-object v2, p0, Lxn0;->l:Ljava/lang/Object;

    .line 78
    .line 79
    check-cast v2, Lu30;

    .line 80
    .line 81
    invoke-virtual {v2}, Lu30;->a()V

    .line 82
    .line 83
    .line 84
    iget-object v2, v2, Lu30;->a:Landroid/content/Context;

    .line 85
    .line 86
    invoke-virtual {v2}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 87
    .line 88
    .line 89
    move-result-object v2

    .line 90
    invoke-direct {v1, v2, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    if-eqz v0, :cond_1

    .line 98
    .line 99
    iget-object v0, p0, Lxn0;->k:Ljava/lang/Object;

    .line 100
    .line 101
    check-cast v0, Ljava/io/File;

    .line 102
    .line 103
    invoke-virtual {v1, v0}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    if-nez v0, :cond_1

    .line 108
    .line 109
    new-instance v0, Ljava/io/IOException;

    .line 110
    .line 111
    const-string v2, "Unable to move the file from back up to non back up directory"

    .line 112
    .line 113
    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    monitor-exit p0

    .line 117
    return-object v1

    .line 118
    :cond_1
    monitor-exit p0

    .line 119
    goto :goto_1

    .line 120
    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 121
    throw v0

    .line 122
    :cond_2
    :goto_1
    iget-object p0, p0, Lxn0;->k:Ljava/lang/Object;

    .line 123
    .line 124
    check-cast p0, Ljava/io/File;

    .line 125
    .line 126
    return-object p0
.end method

.method public n(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Lxn0;->l:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/lang/String;

    .line 4
    .line 5
    iget-object p0, p0, Lxn0;->k:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p0, Landroid/content/res/Resources;

    .line 8
    .line 9
    const-string v1, "string"

    .line 10
    .line 11
    invoke-virtual {p0, p1, v1, v0}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-nez p1, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x0

    .line 18
    return-object p0

    .line 19
    :cond_0
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public o(Ljava/lang/Object;)Ljd2;
    .locals 6

    .line 1
    check-cast p1, Ljava/lang/Void;

    .line 2
    .line 3
    iget-object p1, p0, Lxn0;->l:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast p1, Ldn;

    .line 6
    .line 7
    iget-object v0, p0, Lxn0;->k:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v0, Lc9;

    .line 10
    .line 11
    iget-object v0, v0, Lc9;->m:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast v0, Lzs;

    .line 14
    .line 15
    iget-object v0, v0, Lzs;->j:Ljava/util/concurrent/ExecutorService;

    .line 16
    .line 17
    new-instance v1, Lvm;

    .line 18
    .line 19
    const/4 v2, 0x3

    .line 20
    invoke-direct {v1, v2, p0}, Lvm;-><init>(ILjava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-interface {p0}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    check-cast p0, Lorg/json/JSONObject;

    .line 32
    .line 33
    const/4 v0, 0x0

    .line 34
    if-eqz p0, :cond_1

    .line 35
    .line 36
    iget-object v1, p1, Ldn;->c:Ljava/lang/Object;

    .line 37
    .line 38
    check-cast v1, Lny0;

    .line 39
    .line 40
    const-string v3, "settings_version"

    .line 41
    .line 42
    invoke-virtual {p0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    if-eq v3, v2, :cond_0

    .line 47
    .line 48
    new-instance v2, Lok0;

    .line 49
    .line 50
    const/16 v3, 0xc

    .line 51
    .line 52
    invoke-direct {v2, v3}, Lok0;-><init>(I)V

    .line 53
    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_0
    new-instance v2, Lok0;

    .line 57
    .line 58
    const/16 v3, 0x15

    .line 59
    .line 60
    invoke-direct {v2, v3}, Lok0;-><init>(I)V

    .line 61
    .line 62
    .line 63
    :goto_0
    iget-object v1, v1, Lny0;->k:Ljava/lang/Object;

    .line 64
    .line 65
    check-cast v1, Lmz;

    .line 66
    .line 67
    invoke-virtual {v2, v1, p0}, Lok0;->k(Lmz;Lorg/json/JSONObject;)Lp51;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    iget-object v2, p1, Ldn;->d:Ljava/lang/Object;

    .line 72
    .line 73
    check-cast v2, Lbv1;

    .line 74
    .line 75
    iget-wide v3, v1, Lp51;->c:J

    .line 76
    .line 77
    :try_start_0
    const-string v5, "expires_at"

    .line 78
    .line 79
    invoke-virtual {p0, v5, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 80
    .line 81
    .line 82
    new-instance v3, Ljava/io/FileWriter;

    .line 83
    .line 84
    iget-object v2, v2, Lbv1;->k:Ljava/lang/Object;

    .line 85
    .line 86
    check-cast v2, Ljava/io/File;

    .line 87
    .line 88
    invoke-direct {v3, v2}, Ljava/io/FileWriter;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 89
    .line 90
    .line 91
    :try_start_1
    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    invoke-virtual {v3, v2}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {v3}, Ljava/io/Writer;->flush()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 99
    .line 100
    .line 101
    :catch_0
    :goto_1
    invoke-static {v3}, Lml;->i(Ljava/io/Closeable;)V

    .line 102
    .line 103
    .line 104
    goto :goto_3

    .line 105
    :catchall_0
    move-exception p0

    .line 106
    move-object v0, v3

    .line 107
    goto :goto_2

    .line 108
    :catchall_1
    move-exception p0

    .line 109
    goto :goto_2

    .line 110
    :catch_1
    move-object v3, v0

    .line 111
    goto :goto_1

    .line 112
    :goto_2
    invoke-static {v0}, Lml;->i(Ljava/io/Closeable;)V

    .line 113
    .line 114
    .line 115
    throw p0

    .line 116
    :goto_3
    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    iget-object p0, p1, Ldn;->b:Ljava/lang/Object;

    .line 120
    .line 121
    check-cast p0, Lo61;

    .line 122
    .line 123
    iget-object p0, p0, Lo61;->f:Ljava/lang/String;

    .line 124
    .line 125
    iget-object v2, p1, Ldn;->a:Ljava/lang/Object;

    .line 126
    .line 127
    check-cast v2, Landroid/content/Context;

    .line 128
    .line 129
    const-string v3, "com.google.firebase.crashlytics"

    .line 130
    .line 131
    const/4 v4, 0x0

    .line 132
    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 133
    .line 134
    .line 135
    move-result-object v2

    .line 136
    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 137
    .line 138
    .line 139
    move-result-object v2

    .line 140
    const-string v3, "existing_instance_identifier"

    .line 141
    .line 142
    invoke-interface {v2, v3, p0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 143
    .line 144
    .line 145
    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 146
    .line 147
    .line 148
    iget-object p0, p1, Ldn;->g:Ljava/lang/Object;

    .line 149
    .line 150
    check-cast p0, Ljava/util/concurrent/atomic/AtomicReference;

    .line 151
    .line 152
    invoke-virtual {p0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 153
    .line 154
    .line 155
    iget-object p0, p1, Ldn;->h:Ljava/lang/Object;

    .line 156
    .line 157
    check-cast p0, Ljava/util/concurrent/atomic/AtomicReference;

    .line 158
    .line 159
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 160
    .line 161
    .line 162
    move-result-object p0

    .line 163
    check-cast p0, Llb1;

    .line 164
    .line 165
    invoke-virtual {p0, v1}, Llb1;->b(Ljava/lang/Object;)V

    .line 166
    .line 167
    .line 168
    :cond_1
    invoke-static {v0}, Lbe2;->l(Ljava/lang/Object;)Ljd2;

    .line 169
    .line 170
    .line 171
    move-result-object p0

    .line 172
    return-object p0
.end method

.method public p(Lcf;)V
    .locals 4

    .line 1
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "Fid"

    .line 7
    .line 8
    iget-object v2, p1, Lcf;->a:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 11
    .line 12
    .line 13
    const-string v1, "Status"

    .line 14
    .line 15
    iget v2, p1, Lcf;->b:I

    .line 16
    .line 17
    invoke-static {v2}, Loq;->t(I)I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 22
    .line 23
    .line 24
    const-string v1, "AuthToken"

    .line 25
    .line 26
    iget-object v2, p1, Lcf;->c:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 29
    .line 30
    .line 31
    const-string v1, "RefreshToken"

    .line 32
    .line 33
    iget-object v2, p1, Lcf;->d:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 36
    .line 37
    .line 38
    const-string v1, "TokenCreationEpochInSecs"

    .line 39
    .line 40
    iget-wide v2, p1, Lcf;->f:J

    .line 41
    .line 42
    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 43
    .line 44
    .line 45
    const-string v1, "ExpiresInSecs"

    .line 46
    .line 47
    iget-wide v2, p1, Lcf;->e:J

    .line 48
    .line 49
    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 50
    .line 51
    .line 52
    const-string v1, "FisError"

    .line 53
    .line 54
    iget-object p1, p1, Lcf;->g:Ljava/lang/String;

    .line 55
    .line 56
    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 57
    .line 58
    .line 59
    const-string p1, "PersistedInstallation"

    .line 60
    .line 61
    const-string v1, "tmp"

    .line 62
    .line 63
    iget-object v2, p0, Lxn0;->l:Ljava/lang/Object;

    .line 64
    .line 65
    check-cast v2, Lu30;

    .line 66
    .line 67
    invoke-virtual {v2}, Lu30;->a()V

    .line 68
    .line 69
    .line 70
    iget-object v2, v2, Lu30;->a:Landroid/content/Context;

    .line 71
    .line 72
    invoke-virtual {v2}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    invoke-static {p1, v1, v2}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    new-instance v1, Ljava/io/FileOutputStream;

    .line 81
    .line 82
    invoke-direct {v1, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    const-string v2, "UTF-8"

    .line 90
    .line 91
    invoke-virtual {v0, v2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    invoke-virtual {v1, v0}, Ljava/io/FileOutputStream;->write([B)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V

    .line 99
    .line 100
    .line 101
    invoke-virtual {p0}, Lxn0;->m()Ljava/io/File;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    invoke-virtual {p1, p0}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    .line 106
    .line 107
    .line 108
    move-result p0

    .line 109
    if-eqz p0, :cond_0

    .line 110
    .line 111
    goto :goto_0

    .line 112
    :cond_0
    new-instance p0, Ljava/io/IOException;

    .line 113
    .line 114
    const-string p1, "unable to rename the tmpfile to PersistedInstallation"

    .line 115
    .line 116
    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    throw p0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 120
    :catch_0
    :goto_0
    return-void
.end method

.method public q(Landroid/view/View;)Z
    .locals 4

    .line 1
    iget-object v0, p0, Lxn0;->l:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lhh1;

    .line 4
    .line 5
    iget-object p0, p0, Lxn0;->k:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p0, Lih1;

    .line 8
    .line 9
    invoke-interface {p0}, Lih1;->m()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    invoke-interface {p0}, Lih1;->a()I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    invoke-interface {p0, p1}, Lih1;->f(Landroid/view/View;)I

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    invoke-interface {p0, p1}, Lih1;->n(Landroid/view/View;)I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    iput v1, v0, Lhh1;->b:I

    .line 26
    .line 27
    iput v2, v0, Lhh1;->c:I

    .line 28
    .line 29
    iput v3, v0, Lhh1;->d:I

    .line 30
    .line 31
    iput p0, v0, Lhh1;->e:I

    .line 32
    .line 33
    const/16 p0, 0x6003

    .line 34
    .line 35
    iput p0, v0, Lhh1;->a:I

    .line 36
    .line 37
    invoke-virtual {v0}, Lhh1;->a()Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    return p0
.end method

.method public r(II)V
    .locals 3

    .line 1
    iget-object v0, p0, Lxn0;->k:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, [I

    .line 4
    .line 5
    if-eqz v0, :cond_3

    .line 6
    .line 7
    array-length v0, v0

    .line 8
    if-lt p1, v0, :cond_0

    .line 9
    .line 10
    goto :goto_2

    .line 11
    :cond_0
    add-int v0, p1, p2

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Lxn0;->h(I)V

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Lxn0;->k:Ljava/lang/Object;

    .line 17
    .line 18
    check-cast v1, [I

    .line 19
    .line 20
    array-length v2, v1

    .line 21
    sub-int/2addr v2, p1

    .line 22
    sub-int/2addr v2, p2

    .line 23
    invoke-static {v1, p1, v1, v0, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 24
    .line 25
    .line 26
    iget-object v1, p0, Lxn0;->k:Ljava/lang/Object;

    .line 27
    .line 28
    check-cast v1, [I

    .line 29
    .line 30
    const/4 v2, -0x1

    .line 31
    invoke-static {v1, p1, v0, v2}, Ljava/util/Arrays;->fill([IIII)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lxn0;->l:Ljava/lang/Object;

    .line 35
    .line 36
    check-cast v0, Ljava/util/ArrayList;

    .line 37
    .line 38
    if-nez v0, :cond_1

    .line 39
    .line 40
    goto :goto_2

    .line 41
    :cond_1
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    add-int/lit8 v0, v0, -0x1

    .line 46
    .line 47
    :goto_0
    if-ltz v0, :cond_3

    .line 48
    .line 49
    iget-object v1, p0, Lxn0;->l:Ljava/lang/Object;

    .line 50
    .line 51
    check-cast v1, Ljava/util/ArrayList;

    .line 52
    .line 53
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    check-cast v1, Lj91;

    .line 58
    .line 59
    iget v2, v1, Lj91;->j:I

    .line 60
    .line 61
    if-ge v2, p1, :cond_2

    .line 62
    .line 63
    goto :goto_1

    .line 64
    :cond_2
    add-int/2addr v2, p2

    .line 65
    iput v2, v1, Lj91;->j:I

    .line 66
    .line 67
    :goto_1
    add-int/lit8 v0, v0, -0x1

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_3
    :goto_2
    return-void
.end method

.method public s(II)V
    .locals 5

    .line 1
    iget-object v0, p0, Lxn0;->k:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, [I

    .line 4
    .line 5
    if-eqz v0, :cond_4

    .line 6
    .line 7
    array-length v0, v0

    .line 8
    if-lt p1, v0, :cond_0

    .line 9
    .line 10
    goto :goto_2

    .line 11
    :cond_0
    add-int v0, p1, p2

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Lxn0;->h(I)V

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Lxn0;->k:Ljava/lang/Object;

    .line 17
    .line 18
    check-cast v1, [I

    .line 19
    .line 20
    array-length v2, v1

    .line 21
    sub-int/2addr v2, p1

    .line 22
    sub-int/2addr v2, p2

    .line 23
    invoke-static {v1, v0, v1, p1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 24
    .line 25
    .line 26
    iget-object v1, p0, Lxn0;->k:Ljava/lang/Object;

    .line 27
    .line 28
    check-cast v1, [I

    .line 29
    .line 30
    array-length v2, v1

    .line 31
    sub-int/2addr v2, p2

    .line 32
    array-length v3, v1

    .line 33
    const/4 v4, -0x1

    .line 34
    invoke-static {v1, v2, v3, v4}, Ljava/util/Arrays;->fill([IIII)V

    .line 35
    .line 36
    .line 37
    iget-object v1, p0, Lxn0;->l:Ljava/lang/Object;

    .line 38
    .line 39
    check-cast v1, Ljava/util/ArrayList;

    .line 40
    .line 41
    if-nez v1, :cond_1

    .line 42
    .line 43
    goto :goto_2

    .line 44
    :cond_1
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    add-int/lit8 v1, v1, -0x1

    .line 49
    .line 50
    :goto_0
    if-ltz v1, :cond_4

    .line 51
    .line 52
    iget-object v2, p0, Lxn0;->l:Ljava/lang/Object;

    .line 53
    .line 54
    check-cast v2, Ljava/util/ArrayList;

    .line 55
    .line 56
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    check-cast v2, Lj91;

    .line 61
    .line 62
    iget v3, v2, Lj91;->j:I

    .line 63
    .line 64
    if-ge v3, p1, :cond_2

    .line 65
    .line 66
    goto :goto_1

    .line 67
    :cond_2
    if-ge v3, v0, :cond_3

    .line 68
    .line 69
    iget-object v2, p0, Lxn0;->l:Ljava/lang/Object;

    .line 70
    .line 71
    check-cast v2, Ljava/util/ArrayList;

    .line 72
    .line 73
    invoke-interface {v2, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    goto :goto_1

    .line 77
    :cond_3
    sub-int/2addr v3, p2

    .line 78
    iput v3, v2, Lj91;->j:I

    .line 79
    .line 80
    :goto_1
    add-int/lit8 v1, v1, -0x1

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_4
    :goto_2
    return-void
.end method

.method public t(Ljava/lang/Throwable;)V
    .locals 7

    .line 1
    iget-object v0, p0, Lxn0;->l:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lc52;

    .line 4
    .line 5
    invoke-virtual {v0}, Lgx1;->l()V

    .line 6
    .line 7
    .line 8
    iget-object v1, v0, Let;->j:Ljava/lang/Object;

    .line 9
    .line 10
    check-cast v1, Ly02;

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    iput-boolean v2, v0, Lc52;->r:Z

    .line 14
    .line 15
    invoke-virtual {v0}, Lc52;->J()Ljava/util/PriorityQueue;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    iget-object p0, p0, Lxn0;->k:Ljava/lang/Object;

    .line 20
    .line 21
    check-cast p0, Lo92;

    .line 22
    .line 23
    invoke-virtual {v3, p0}, Ljava/util/PriorityQueue;->add(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    sget-object p0, Lxx1;->v0:Lwx1;

    .line 27
    .line 28
    const/4 v3, 0x0

    .line 29
    invoke-virtual {p0, v3}, Lwx1;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    check-cast p0, Ljava/lang/Integer;

    .line 34
    .line 35
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    iget v3, v0, Lc52;->s:I

    .line 40
    .line 41
    const/4 v4, 0x1

    .line 42
    if-le v3, p0, :cond_0

    .line 43
    .line 44
    iput v4, v0, Lc52;->s:I

    .line 45
    .line 46
    iget-object p0, v1, Ly02;->o:Lzy1;

    .line 47
    .line 48
    invoke-static {p0}, Ly02;->l(Lm22;)V

    .line 49
    .line 50
    .line 51
    iget-object p0, p0, Lzy1;->r:Lso;

    .line 52
    .line 53
    invoke-virtual {v1}, Ly02;->p()Lky1;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {v0}, Lky1;->r()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-static {v0}, Lzy1;->p(Ljava/lang/String;)Lxy1;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {p1}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    invoke-static {p1}, Lzy1;->p(Ljava/lang/String;)Lxy1;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    const-string v1, "registerTriggerAsync failed. May try later. App ID, throwable"

    .line 74
    .line 75
    invoke-virtual {p0, v1, v0, p1}, Lso;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :cond_0
    iget-object p0, v1, Ly02;->o:Lzy1;

    .line 80
    .line 81
    invoke-static {p0}, Ly02;->l(Lm22;)V

    .line 82
    .line 83
    .line 84
    iget-object p0, p0, Lzy1;->r:Lso;

    .line 85
    .line 86
    invoke-virtual {v1}, Ly02;->p()Lky1;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    invoke-virtual {v3}, Lky1;->r()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v3

    .line 94
    invoke-static {v3}, Lzy1;->p(Ljava/lang/String;)Lxy1;

    .line 95
    .line 96
    .line 97
    move-result-object v3

    .line 98
    iget v5, v0, Lc52;->s:I

    .line 99
    .line 100
    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v5

    .line 104
    invoke-static {v5}, Lzy1;->p(Ljava/lang/String;)Lxy1;

    .line 105
    .line 106
    .line 107
    move-result-object v5

    .line 108
    invoke-virtual {p1}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    invoke-static {p1}, Lzy1;->p(Ljava/lang/String;)Lxy1;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    const-string v6, "registerTriggerAsync failed. App ID, delay in seconds, throwable"

    .line 117
    .line 118
    invoke-virtual {p0, v6, v3, v5, p1}, Lso;->e(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 119
    .line 120
    .line 121
    iget p0, v0, Lc52;->s:I

    .line 122
    .line 123
    iget-object p1, v0, Lc52;->t:Lc32;

    .line 124
    .line 125
    if-nez p1, :cond_1

    .line 126
    .line 127
    new-instance p1, Lc32;

    .line 128
    .line 129
    invoke-direct {p1, v0, v1, v4, v2}, Lc32;-><init>(Lc52;Lo22;IZ)V

    .line 130
    .line 131
    .line 132
    iput-object p1, v0, Lc52;->t:Lc32;

    .line 133
    .line 134
    :cond_1
    int-to-long v1, p0

    .line 135
    const-wide/16 v3, 0x3e8

    .line 136
    .line 137
    mul-long/2addr v1, v3

    .line 138
    invoke-virtual {p1, v1, v2}, Lfu1;->b(J)V

    .line 139
    .line 140
    .line 141
    iget p0, v0, Lc52;->s:I

    .line 142
    .line 143
    add-int/2addr p0, p0

    .line 144
    iput p0, v0, Lc52;->s:I

    .line 145
    .line 146
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 1
    iget v0, p0, Lxn0;->j:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0

    .line 11
    :pswitch_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    const/16 v1, 0x64

    .line 14
    .line 15
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lxn0;->l:Ljava/lang/Object;

    .line 19
    .line 20
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const/16 v1, 0x7b

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Lxn0;->k:Ljava/lang/Object;

    .line 37
    .line 38
    check-cast p0, Ljava/util/ArrayList;

    .line 39
    .line 40
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    const/4 v2, 0x0

    .line 45
    :goto_0
    if-ge v2, v1, :cond_1

    .line 46
    .line 47
    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    check-cast v3, Ljava/lang/String;

    .line 52
    .line 53
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    add-int/lit8 v3, v1, -0x1

    .line 57
    .line 58
    if-ge v2, v3, :cond_0

    .line 59
    .line 60
    const-string v3, ", "

    .line 61
    .line 62
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_1
    const/16 p0, 0x7d

    .line 69
    .line 70
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    return-object p0

    .line 78
    nop

    .line 79
    :pswitch_data_0
    .packed-switch 0x4
        :pswitch_0
    .end packed-switch
.end method

.method public u(Lmu0;I)Ltw0;
    .locals 4

    .line 1
    iget-object p0, p0, Lxn0;->k:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Lu71;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lu71;->d(Ljava/lang/Object;)I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    const/4 v0, 0x0

    .line 10
    if-gez p1, :cond_0

    .line 11
    .line 12
    goto :goto_1

    .line 13
    :cond_0
    invoke-virtual {p0, p1}, Lu71;->i(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lei1;

    .line 18
    .line 19
    if-eqz v1, :cond_4

    .line 20
    .line 21
    iget v2, v1, Lei1;->a:I

    .line 22
    .line 23
    and-int v3, v2, p2

    .line 24
    .line 25
    if-eqz v3, :cond_4

    .line 26
    .line 27
    not-int v3, p2

    .line 28
    and-int/2addr v2, v3

    .line 29
    iput v2, v1, Lei1;->a:I

    .line 30
    .line 31
    const/4 v3, 0x4

    .line 32
    if-ne p2, v3, :cond_1

    .line 33
    .line 34
    iget-object p2, v1, Lei1;->b:Ltw0;

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    const/16 v3, 0x8

    .line 38
    .line 39
    if-ne p2, v3, :cond_3

    .line 40
    .line 41
    iget-object p2, v1, Lei1;->c:Ltw0;

    .line 42
    .line 43
    :goto_0
    and-int/lit8 v2, v2, 0xc

    .line 44
    .line 45
    if-nez v2, :cond_2

    .line 46
    .line 47
    invoke-virtual {p0, p1}, Lu71;->h(I)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    const/4 p0, 0x0

    .line 51
    iput p0, v1, Lei1;->a:I

    .line 52
    .line 53
    iput-object v0, v1, Lei1;->b:Ltw0;

    .line 54
    .line 55
    iput-object v0, v1, Lei1;->c:Ltw0;

    .line 56
    .line 57
    sget-object p0, Lei1;->d:Lnt0;

    .line 58
    .line 59
    invoke-virtual {p0, v1}, Lnt0;->c(Ljava/lang/Object;)V

    .line 60
    .line 61
    .line 62
    :cond_2
    return-object p2

    .line 63
    :cond_3
    const-string p0, "Must provide flag PRE or POST"

    .line 64
    .line 65
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    :cond_4
    :goto_1
    return-object v0
.end method

.method public v()Lcf;
    .locals 14

    .line 1
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 4
    .line 5
    .line 6
    const/16 v1, 0x4000

    .line 7
    .line 8
    new-array v2, v1, [B

    .line 9
    .line 10
    const/4 v3, 0x0

    .line 11
    :try_start_0
    new-instance v4, Ljava/io/FileInputStream;

    .line 12
    .line 13
    invoke-virtual {p0}, Lxn0;->m()Ljava/io/File;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-direct {v4, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 18
    .line 19
    .line 20
    :goto_0
    :try_start_1
    invoke-virtual {v4, v2, v3, v1}, Ljava/io/FileInputStream;->read([BII)I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-gez p0, :cond_0

    .line 25
    .line 26
    new-instance p0, Lorg/json/JSONObject;

    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-direct {p0, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 33
    .line 34
    .line 35
    :try_start_2
    invoke-virtual {v4}, Ljava/io/FileInputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0

    .line 36
    .line 37
    .line 38
    goto :goto_3

    .line 39
    :catchall_0
    move-exception v0

    .line 40
    move-object p0, v0

    .line 41
    goto :goto_1

    .line 42
    :cond_0
    :try_start_3
    invoke-virtual {v0, v2, v3, p0}, Ljava/io/ByteArrayOutputStream;->write([BII)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :goto_1
    :try_start_4
    invoke-virtual {v4}, Ljava/io/FileInputStream;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 47
    .line 48
    .line 49
    goto :goto_2

    .line 50
    :catchall_1
    move-exception v0

    .line 51
    :try_start_5
    invoke-virtual {p0, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 52
    .line 53
    .line 54
    :goto_2
    throw p0
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_0
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_5} :catch_0

    .line 55
    :catch_0
    new-instance p0, Lorg/json/JSONObject;

    .line 56
    .line 57
    invoke-direct {p0}, Lorg/json/JSONObject;-><init>()V

    .line 58
    .line 59
    .line 60
    :goto_3
    const-string v0, "Fid"

    .line 61
    .line 62
    const/4 v1, 0x0

    .line 63
    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v5

    .line 67
    const-string v0, "Status"

    .line 68
    .line 69
    invoke-virtual {p0, v0, v3}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    const-string v2, "AuthToken"

    .line 74
    .line 75
    invoke-virtual {p0, v2, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v7

    .line 79
    const-string v2, "RefreshToken"

    .line 80
    .line 81
    invoke-virtual {p0, v2, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v8

    .line 85
    const-string v2, "TokenCreationEpochInSecs"

    .line 86
    .line 87
    const-wide/16 v3, 0x0

    .line 88
    .line 89
    invoke-virtual {p0, v2, v3, v4}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    .line 90
    .line 91
    .line 92
    move-result-wide v11

    .line 93
    const-string v2, "ExpiresInSecs"

    .line 94
    .line 95
    invoke-virtual {p0, v2, v3, v4}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    .line 96
    .line 97
    .line 98
    move-result-wide v9

    .line 99
    const-string v2, "FisError"

    .line 100
    .line 101
    invoke-virtual {p0, v2, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v13

    .line 105
    sget p0, Lcf;->h:I

    .line 106
    .line 107
    const/4 p0, 0x0

    .line 108
    or-int/lit8 p0, p0, 0x2

    .line 109
    .line 110
    int-to-byte p0, p0

    .line 111
    or-int/lit8 p0, p0, 0x1

    .line 112
    .line 113
    int-to-byte p0, p0

    .line 114
    const/4 v2, 0x5

    .line 115
    invoke-static {v2}, Loq;->u(I)[I

    .line 116
    .line 117
    .line 118
    move-result-object v2

    .line 119
    aget v6, v2, v0

    .line 120
    .line 121
    if-eqz v6, :cond_6

    .line 122
    .line 123
    or-int/lit8 p0, p0, 0x2

    .line 124
    .line 125
    int-to-byte p0, p0

    .line 126
    or-int/lit8 p0, p0, 0x1

    .line 127
    .line 128
    int-to-byte p0, p0

    .line 129
    const/4 v0, 0x3

    .line 130
    if-ne p0, v0, :cond_2

    .line 131
    .line 132
    if-nez v6, :cond_1

    .line 133
    .line 134
    goto :goto_4

    .line 135
    :cond_1
    new-instance v4, Lcf;

    .line 136
    .line 137
    invoke-direct/range {v4 .. v13}, Lcf;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;JJLjava/lang/String;)V

    .line 138
    .line 139
    .line 140
    return-object v4

    .line 141
    :cond_2
    :goto_4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 142
    .line 143
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 144
    .line 145
    .line 146
    if-nez v6, :cond_3

    .line 147
    .line 148
    const-string v2, " registrationStatus"

    .line 149
    .line 150
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    :cond_3
    and-int/lit8 v2, p0, 0x1

    .line 154
    .line 155
    if-nez v2, :cond_4

    .line 156
    .line 157
    const-string v2, " expiresInSecs"

    .line 158
    .line 159
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 160
    .line 161
    .line 162
    :cond_4
    and-int/lit8 p0, p0, 0x2

    .line 163
    .line 164
    if-nez p0, :cond_5

    .line 165
    .line 166
    const-string p0, " tokenCreationEpochInSecs"

    .line 167
    .line 168
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 169
    .line 170
    .line 171
    :cond_5
    const-string p0, "Missing required properties:"

    .line 172
    .line 173
    invoke-static {p0, v0}, Loq;->k(Ljava/lang/String;Ljava/lang/StringBuilder;)Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object p0

    .line 177
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 178
    .line 179
    .line 180
    return-object v1

    .line 181
    :cond_6
    const-string p0, "Null registrationStatus"

    .line 182
    .line 183
    invoke-static {p0}, Lwd1;->d(Ljava/lang/String;)V

    .line 184
    .line 185
    .line 186
    return-object v1
.end method

.method public w(Lmu0;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lxn0;->k:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Lu71;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, p1, v0}, Lu71;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Lei1;

    .line 11
    .line 12
    if-nez p0, :cond_0

    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget p1, p0, Lei1;->a:I

    .line 16
    .line 17
    and-int/lit8 p1, p1, -0x2

    .line 18
    .line 19
    iput p1, p0, Lei1;->a:I

    .line 20
    .line 21
    return-void
.end method

.method public x(Lmu0;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lxn0;->l:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Luk0;

    .line 4
    .line 5
    invoke-virtual {v0}, Luk0;->e()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x1

    .line 10
    sub-int/2addr v1, v2

    .line 11
    :goto_0
    if-ltz v1, :cond_1

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Luk0;->f(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    if-ne p1, v3, :cond_0

    .line 18
    .line 19
    iget-object v3, v0, Luk0;->l:[Ljava/lang/Object;

    .line 20
    .line 21
    aget-object v4, v3, v1

    .line 22
    .line 23
    sget-object v5, Luk0;->n:Ljava/lang/Object;

    .line 24
    .line 25
    if-eq v4, v5, :cond_1

    .line 26
    .line 27
    aput-object v5, v3, v1

    .line 28
    .line 29
    iput-boolean v2, v0, Luk0;->j:Z

    .line 30
    .line 31
    goto :goto_1

    .line 32
    :cond_0
    add-int/lit8 v1, v1, -0x1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    :goto_1
    iget-object p0, p0, Lxn0;->k:Ljava/lang/Object;

    .line 36
    .line 37
    check-cast p0, Lu71;

    .line 38
    .line 39
    invoke-virtual {p0, p1}, Lu71;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    check-cast p0, Lei1;

    .line 44
    .line 45
    if-eqz p0, :cond_2

    .line 46
    .line 47
    const/4 p1, 0x0

    .line 48
    iput p1, p0, Lei1;->a:I

    .line 49
    .line 50
    const/4 p1, 0x0

    .line 51
    iput-object p1, p0, Lei1;->b:Ltw0;

    .line 52
    .line 53
    iput-object p1, p0, Lei1;->c:Ltw0;

    .line 54
    .line 55
    sget-object p1, Lei1;->d:Lnt0;

    .line 56
    .line 57
    invoke-virtual {p1, p0}, Lnt0;->c(Ljava/lang/Object;)V

    .line 58
    .line 59
    .line 60
    :cond_2
    return-void
.end method

.method public y(ZLcom/google/android/gms/common/api/Status;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lxn0;->l:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/util/Map;

    .line 4
    .line 5
    monitor-enter v0

    .line 6
    :try_start_0
    new-instance v1, Ljava/util/HashMap;

    .line 7
    .line 8
    iget-object v2, p0, Lxn0;->l:Ljava/lang/Object;

    .line 9
    .line 10
    check-cast v2, Ljava/util/Map;

    .line 11
    .line 12
    invoke-direct {v1, v2}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 13
    .line 14
    .line 15
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 16
    iget-object v0, p0, Lxn0;->k:Ljava/lang/Object;

    .line 17
    .line 18
    move-object v2, v0

    .line 19
    check-cast v2, Ljava/util/Map;

    .line 20
    .line 21
    monitor-enter v2

    .line 22
    :try_start_1
    new-instance v0, Ljava/util/HashMap;

    .line 23
    .line 24
    iget-object p0, p0, Lxn0;->k:Ljava/lang/Object;

    .line 25
    .line 26
    check-cast p0, Ljava/util/Map;

    .line 27
    .line 28
    invoke-direct {v0, p0}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 29
    .line 30
    .line 31
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 32
    invoke-virtual {v1}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    if-eqz v1, :cond_1

    .line 45
    .line 46
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    check-cast v1, Ljava/util/Map$Entry;

    .line 51
    .line 52
    if-nez p1, :cond_0

    .line 53
    .line 54
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    check-cast v2, Ljava/lang/Boolean;

    .line 59
    .line 60
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    if-nez v2, :cond_0

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_0
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 72
    .line 73
    .line 74
    invoke-static {}, Lz0;->a()V

    .line 75
    .line 76
    .line 77
    return-void

    .line 78
    :cond_1
    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    :cond_2
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    if-eqz v0, :cond_4

    .line 91
    .line 92
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    check-cast v0, Ljava/util/Map$Entry;

    .line 97
    .line 98
    if-nez p1, :cond_3

    .line 99
    .line 100
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    check-cast v1, Ljava/lang/Boolean;

    .line 105
    .line 106
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 107
    .line 108
    .line 109
    move-result v1

    .line 110
    if-eqz v1, :cond_2

    .line 111
    .line 112
    :cond_3
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    check-cast v0, Llb1;

    .line 117
    .line 118
    new-instance v1, Lx5;

    .line 119
    .line 120
    invoke-direct {v1, p2}, Lx5;-><init>(Lcom/google/android/gms/common/api/Status;)V

    .line 121
    .line 122
    .line 123
    invoke-virtual {v0, v1}, Llb1;->a(Ljava/lang/Exception;)V

    .line 124
    .line 125
    .line 126
    goto :goto_1

    .line 127
    :cond_4
    return-void

    .line 128
    :catchall_0
    move-exception p0

    .line 129
    :try_start_2
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 130
    throw p0

    .line 131
    :catchall_1
    move-exception p0

    .line 132
    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 133
    throw p0
.end method

.method public z(Lbu1;)V
    .locals 5

    .line 1
    iget-object v0, p1, Lbu1;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const/4 v2, 0x0

    .line 8
    :goto_0
    if-ge v2, v1, :cond_0

    .line 9
    .line 10
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v3

    .line 14
    add-int/lit8 v2, v2, 0x1

    .line 15
    .line 16
    check-cast v3, Luu1;

    .line 17
    .line 18
    iget v3, v3, Luu1;->j:I

    .line 19
    .line 20
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    invoke-virtual {v3}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    iget-object v4, p0, Lxn0;->k:Ljava/lang/Object;

    .line 29
    .line 30
    check-cast v4, Ljava/util/HashMap;

    .line 31
    .line 32
    invoke-virtual {v4, v3, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    return-void
.end method
