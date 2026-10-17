.class public final Lya2;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# instance fields
.field public final synthetic a:I


# direct methods
.method public synthetic constructor <init>(I)V
    .locals 0

    .line 1
    iput p1, p0, Lya2;->a:I

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static a(Lwa2;Landroid/os/Parcel;)V
    .locals 6

    .line 1
    iget v0, p0, Lwa2;->j:I

    .line 2
    .line 3
    const/16 v1, 0x4f45

    .line 4
    .line 5
    invoke-static {p1, v1}, Lbe2;->L(Landroid/os/Parcel;I)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x1

    .line 10
    const/4 v3, 0x4

    .line 11
    invoke-static {p1, v2, v3}, Lbe2;->J(Landroid/os/Parcel;II)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 15
    .line 16
    .line 17
    const/4 v0, 0x2

    .line 18
    iget-object v2, p0, Lwa2;->k:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {p1, v0, v2}, Lbe2;->F(Landroid/os/Parcel;ILjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iget-wide v4, p0, Lwa2;->l:J

    .line 24
    .line 25
    const/4 v0, 0x3

    .line 26
    const/16 v2, 0x8

    .line 27
    .line 28
    invoke-static {p1, v0, v2}, Lbe2;->J(Landroid/os/Parcel;II)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p1, v4, v5}, Landroid/os/Parcel;->writeLong(J)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lwa2;->m:Ljava/lang/Long;

    .line 35
    .line 36
    if-nez v0, :cond_0

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    invoke-static {p1, v3, v2}, Lbe2;->J(Landroid/os/Parcel;II)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 43
    .line 44
    .line 45
    move-result-wide v3

    .line 46
    invoke-virtual {p1, v3, v4}, Landroid/os/Parcel;->writeLong(J)V

    .line 47
    .line 48
    .line 49
    :goto_0
    const/4 v0, 0x6

    .line 50
    iget-object v3, p0, Lwa2;->n:Ljava/lang/String;

    .line 51
    .line 52
    invoke-static {p1, v0, v3}, Lbe2;->F(Landroid/os/Parcel;ILjava/lang/String;)V

    .line 53
    .line 54
    .line 55
    const/4 v0, 0x7

    .line 56
    iget-object v3, p0, Lwa2;->o:Ljava/lang/String;

    .line 57
    .line 58
    invoke-static {p1, v0, v3}, Lbe2;->F(Landroid/os/Parcel;ILjava/lang/String;)V

    .line 59
    .line 60
    .line 61
    iget-object p0, p0, Lwa2;->p:Ljava/lang/Double;

    .line 62
    .line 63
    if-nez p0, :cond_1

    .line 64
    .line 65
    goto :goto_1

    .line 66
    :cond_1
    invoke-static {p1, v2, v2}, Lbe2;->J(Landroid/os/Parcel;II)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    .line 70
    .line 71
    .line 72
    move-result-wide v2

    .line 73
    invoke-virtual {p1, v2, v3}, Landroid/os/Parcel;->writeDouble(D)V

    .line 74
    .line 75
    .line 76
    :goto_1
    invoke-static {p1, v1}, Lbe2;->N(Landroid/os/Parcel;I)V

    .line 77
    .line 78
    .line 79
    return-void
.end method


# virtual methods
.method public final createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 54

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iget v0, v0, Lya2;->a:I

    .line 6
    .line 7
    const-wide/16 v2, 0x0

    .line 8
    .line 9
    const/4 v4, 0x1

    .line 10
    const/4 v5, 0x4

    .line 11
    const/4 v6, 0x0

    .line 12
    const/4 v7, 0x0

    .line 13
    packed-switch v0, :pswitch_data_0

    .line 14
    .line 15
    .line 16
    invoke-static {v1}, Lcg1;->B(Landroid/os/Parcel;)I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    const-wide/16 v2, -0x1

    .line 21
    .line 22
    move-wide v13, v2

    .line 23
    move-object v10, v6

    .line 24
    move v9, v7

    .line 25
    move v11, v9

    .line 26
    move v12, v11

    .line 27
    :goto_0
    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-ge v2, v0, :cond_5

    .line 32
    .line 33
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    int-to-char v3, v2

    .line 38
    if-eq v3, v4, :cond_4

    .line 39
    .line 40
    const/4 v6, 0x2

    .line 41
    if-eq v3, v6, :cond_3

    .line 42
    .line 43
    const/4 v6, 0x3

    .line 44
    if-eq v3, v6, :cond_2

    .line 45
    .line 46
    if-eq v3, v5, :cond_1

    .line 47
    .line 48
    const/4 v6, 0x5

    .line 49
    if-eq v3, v6, :cond_0

    .line 50
    .line 51
    invoke-static {v1, v2}, Lcg1;->y(Landroid/os/Parcel;I)V

    .line 52
    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_0
    invoke-static {v1, v2}, Lcg1;->s(Landroid/os/Parcel;I)J

    .line 56
    .line 57
    .line 58
    move-result-wide v2

    .line 59
    move-wide v13, v2

    .line 60
    goto :goto_0

    .line 61
    :cond_1
    invoke-static {v1, v2}, Lcg1;->r(Landroid/os/Parcel;I)I

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    move v12, v2

    .line 66
    goto :goto_0

    .line 67
    :cond_2
    invoke-static {v1, v2}, Lcg1;->r(Landroid/os/Parcel;I)I

    .line 68
    .line 69
    .line 70
    move-result v2

    .line 71
    move v11, v2

    .line 72
    goto :goto_0

    .line 73
    :cond_3
    invoke-static {v1, v2}, Lcg1;->h(Landroid/os/Parcel;I)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    move-object v10, v2

    .line 78
    goto :goto_0

    .line 79
    :cond_4
    invoke-static {v1, v2}, Lcg1;->o(Landroid/os/Parcel;I)Z

    .line 80
    .line 81
    .line 82
    move-result v2

    .line 83
    move v9, v2

    .line 84
    goto :goto_0

    .line 85
    :cond_5
    invoke-static {v1, v0}, Lcg1;->l(Landroid/os/Parcel;I)V

    .line 86
    .line 87
    .line 88
    new-instance v8, Lcc2;

    .line 89
    .line 90
    invoke-direct/range {v8 .. v14}, Lcc2;-><init>(ZLjava/lang/String;IIJ)V

    .line 91
    .line 92
    .line 93
    return-object v8

    .line 94
    :pswitch_0
    invoke-static {v1}, Lcg1;->B(Landroid/os/Parcel;)I

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    const-string v8, ""

    .line 99
    .line 100
    const/16 v9, 0x64

    .line 101
    .line 102
    const-wide/32 v10, -0x80000000

    .line 103
    .line 104
    .line 105
    move-wide/from16 v17, v2

    .line 106
    .line 107
    move-wide/from16 v19, v17

    .line 108
    .line 109
    move-wide/from16 v27, v19

    .line 110
    .line 111
    move-wide/from16 v33, v27

    .line 112
    .line 113
    move-wide/from16 v40, v33

    .line 114
    .line 115
    move-wide/from16 v45, v40

    .line 116
    .line 117
    move-wide/from16 v49, v45

    .line 118
    .line 119
    move-wide/from16 v52, v49

    .line 120
    .line 121
    move/from16 v22, v4

    .line 122
    .line 123
    move/from16 v30, v22

    .line 124
    .line 125
    move-object v13, v6

    .line 126
    move-object v14, v13

    .line 127
    move-object v15, v14

    .line 128
    move-object/from16 v16, v15

    .line 129
    .line 130
    move-object/from16 v21, v16

    .line 131
    .line 132
    move-object/from16 v26, v21

    .line 133
    .line 134
    move-object/from16 v32, v26

    .line 135
    .line 136
    move-object/from16 v35, v32

    .line 137
    .line 138
    move-object/from16 v38, v35

    .line 139
    .line 140
    move-object/from16 v47, v38

    .line 141
    .line 142
    move/from16 v23, v7

    .line 143
    .line 144
    move/from16 v29, v23

    .line 145
    .line 146
    move/from16 v31, v29

    .line 147
    .line 148
    move/from16 v39, v31

    .line 149
    .line 150
    move/from16 v44, v39

    .line 151
    .line 152
    move/from16 v51, v44

    .line 153
    .line 154
    move-object/from16 v36, v8

    .line 155
    .line 156
    move-object/from16 v37, v36

    .line 157
    .line 158
    move-object/from16 v43, v37

    .line 159
    .line 160
    move-object/from16 v48, v43

    .line 161
    .line 162
    move/from16 v42, v9

    .line 163
    .line 164
    move-wide/from16 v24, v10

    .line 165
    .line 166
    :goto_1
    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    .line 167
    .line 168
    .line 169
    move-result v2

    .line 170
    if-ge v2, v0, :cond_9

    .line 171
    .line 172
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 173
    .line 174
    .line 175
    move-result v2

    .line 176
    int-to-char v3, v2

    .line 177
    packed-switch v3, :pswitch_data_1

    .line 178
    .line 179
    .line 180
    :pswitch_1
    invoke-static {v1, v2}, Lcg1;->y(Landroid/os/Parcel;I)V

    .line 181
    .line 182
    .line 183
    goto :goto_1

    .line 184
    :pswitch_2
    invoke-static {v1, v2}, Lcg1;->s(Landroid/os/Parcel;I)J

    .line 185
    .line 186
    .line 187
    move-result-wide v2

    .line 188
    move-wide/from16 v52, v2

    .line 189
    .line 190
    goto :goto_1

    .line 191
    :pswitch_3
    invoke-static {v1, v2}, Lcg1;->r(Landroid/os/Parcel;I)I

    .line 192
    .line 193
    .line 194
    move-result v51

    .line 195
    goto :goto_1

    .line 196
    :pswitch_4
    invoke-static {v1, v2}, Lcg1;->s(Landroid/os/Parcel;I)J

    .line 197
    .line 198
    .line 199
    move-result-wide v2

    .line 200
    move-wide/from16 v49, v2

    .line 201
    .line 202
    goto :goto_1

    .line 203
    :pswitch_5
    invoke-static {v1, v2}, Lcg1;->h(Landroid/os/Parcel;I)Ljava/lang/String;

    .line 204
    .line 205
    .line 206
    move-result-object v2

    .line 207
    move-object/from16 v48, v2

    .line 208
    .line 209
    goto :goto_1

    .line 210
    :pswitch_6
    invoke-static {v1, v2}, Lcg1;->h(Landroid/os/Parcel;I)Ljava/lang/String;

    .line 211
    .line 212
    .line 213
    move-result-object v47

    .line 214
    goto :goto_1

    .line 215
    :pswitch_7
    invoke-static {v1, v2}, Lcg1;->s(Landroid/os/Parcel;I)J

    .line 216
    .line 217
    .line 218
    move-result-wide v2

    .line 219
    move-wide/from16 v45, v2

    .line 220
    .line 221
    goto :goto_1

    .line 222
    :pswitch_8
    invoke-static {v1, v2}, Lcg1;->r(Landroid/os/Parcel;I)I

    .line 223
    .line 224
    .line 225
    move-result v44

    .line 226
    goto :goto_1

    .line 227
    :pswitch_9
    invoke-static {v1, v2}, Lcg1;->h(Landroid/os/Parcel;I)Ljava/lang/String;

    .line 228
    .line 229
    .line 230
    move-result-object v2

    .line 231
    move-object/from16 v43, v2

    .line 232
    .line 233
    goto :goto_1

    .line 234
    :pswitch_a
    invoke-static {v1, v2}, Lcg1;->r(Landroid/os/Parcel;I)I

    .line 235
    .line 236
    .line 237
    move-result v2

    .line 238
    move/from16 v42, v2

    .line 239
    .line 240
    goto :goto_1

    .line 241
    :pswitch_b
    invoke-static {v1, v2}, Lcg1;->s(Landroid/os/Parcel;I)J

    .line 242
    .line 243
    .line 244
    move-result-wide v2

    .line 245
    move-wide/from16 v40, v2

    .line 246
    .line 247
    goto :goto_1

    .line 248
    :pswitch_c
    invoke-static {v1, v2}, Lcg1;->o(Landroid/os/Parcel;I)Z

    .line 249
    .line 250
    .line 251
    move-result v39

    .line 252
    goto :goto_1

    .line 253
    :pswitch_d
    invoke-static {v1, v2}, Lcg1;->h(Landroid/os/Parcel;I)Ljava/lang/String;

    .line 254
    .line 255
    .line 256
    move-result-object v38

    .line 257
    goto :goto_1

    .line 258
    :pswitch_e
    invoke-static {v1, v2}, Lcg1;->h(Landroid/os/Parcel;I)Ljava/lang/String;

    .line 259
    .line 260
    .line 261
    move-result-object v2

    .line 262
    move-object/from16 v37, v2

    .line 263
    .line 264
    goto :goto_1

    .line 265
    :pswitch_f
    invoke-static {v1, v2}, Lcg1;->h(Landroid/os/Parcel;I)Ljava/lang/String;

    .line 266
    .line 267
    .line 268
    move-result-object v2

    .line 269
    move-object/from16 v36, v2

    .line 270
    .line 271
    goto :goto_1

    .line 272
    :pswitch_10
    invoke-static {v1, v2}, Lcg1;->t(Landroid/os/Parcel;I)I

    .line 273
    .line 274
    .line 275
    move-result v2

    .line 276
    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    .line 277
    .line 278
    .line 279
    move-result v3

    .line 280
    if-nez v2, :cond_6

    .line 281
    .line 282
    move-object/from16 v35, v6

    .line 283
    .line 284
    goto :goto_1

    .line 285
    :cond_6
    invoke-virtual {v1}, Landroid/os/Parcel;->createStringArrayList()Ljava/util/ArrayList;

    .line 286
    .line 287
    .line 288
    move-result-object v8

    .line 289
    add-int/2addr v3, v2

    .line 290
    invoke-virtual {v1, v3}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 291
    .line 292
    .line 293
    move-object/from16 v35, v8

    .line 294
    .line 295
    goto/16 :goto_1

    .line 296
    .line 297
    :pswitch_11
    invoke-static {v1, v2}, Lcg1;->s(Landroid/os/Parcel;I)J

    .line 298
    .line 299
    .line 300
    move-result-wide v2

    .line 301
    move-wide/from16 v33, v2

    .line 302
    .line 303
    goto/16 :goto_1

    .line 304
    .line 305
    :pswitch_12
    invoke-static {v1, v2}, Lcg1;->t(Landroid/os/Parcel;I)I

    .line 306
    .line 307
    .line 308
    move-result v2

    .line 309
    if-nez v2, :cond_7

    .line 310
    .line 311
    move-object/from16 v32, v6

    .line 312
    .line 313
    goto/16 :goto_1

    .line 314
    .line 315
    :cond_7
    invoke-static {v1, v2, v5}, Lcg1;->F(Landroid/os/Parcel;II)V

    .line 316
    .line 317
    .line 318
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 319
    .line 320
    .line 321
    move-result v2

    .line 322
    if-eqz v2, :cond_8

    .line 323
    .line 324
    move v2, v4

    .line 325
    goto :goto_2

    .line 326
    :cond_8
    move v2, v7

    .line 327
    :goto_2
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 328
    .line 329
    .line 330
    move-result-object v2

    .line 331
    move-object/from16 v32, v2

    .line 332
    .line 333
    goto/16 :goto_1

    .line 334
    .line 335
    :pswitch_13
    invoke-static {v1, v2}, Lcg1;->o(Landroid/os/Parcel;I)Z

    .line 336
    .line 337
    .line 338
    move-result v31

    .line 339
    goto/16 :goto_1

    .line 340
    .line 341
    :pswitch_14
    invoke-static {v1, v2}, Lcg1;->o(Landroid/os/Parcel;I)Z

    .line 342
    .line 343
    .line 344
    move-result v30

    .line 345
    goto/16 :goto_1

    .line 346
    .line 347
    :pswitch_15
    invoke-static {v1, v2}, Lcg1;->r(Landroid/os/Parcel;I)I

    .line 348
    .line 349
    .line 350
    move-result v29

    .line 351
    goto/16 :goto_1

    .line 352
    .line 353
    :pswitch_16
    invoke-static {v1, v2}, Lcg1;->s(Landroid/os/Parcel;I)J

    .line 354
    .line 355
    .line 356
    move-result-wide v2

    .line 357
    move-wide/from16 v27, v2

    .line 358
    .line 359
    goto/16 :goto_1

    .line 360
    .line 361
    :pswitch_17
    invoke-static {v1, v2}, Lcg1;->h(Landroid/os/Parcel;I)Ljava/lang/String;

    .line 362
    .line 363
    .line 364
    move-result-object v26

    .line 365
    goto/16 :goto_1

    .line 366
    .line 367
    :pswitch_18
    invoke-static {v1, v2}, Lcg1;->s(Landroid/os/Parcel;I)J

    .line 368
    .line 369
    .line 370
    move-result-wide v2

    .line 371
    move-wide/from16 v24, v2

    .line 372
    .line 373
    goto/16 :goto_1

    .line 374
    .line 375
    :pswitch_19
    invoke-static {v1, v2}, Lcg1;->o(Landroid/os/Parcel;I)Z

    .line 376
    .line 377
    .line 378
    move-result v23

    .line 379
    goto/16 :goto_1

    .line 380
    .line 381
    :pswitch_1a
    invoke-static {v1, v2}, Lcg1;->o(Landroid/os/Parcel;I)Z

    .line 382
    .line 383
    .line 384
    move-result v22

    .line 385
    goto/16 :goto_1

    .line 386
    .line 387
    :pswitch_1b
    invoke-static {v1, v2}, Lcg1;->h(Landroid/os/Parcel;I)Ljava/lang/String;

    .line 388
    .line 389
    .line 390
    move-result-object v21

    .line 391
    goto/16 :goto_1

    .line 392
    .line 393
    :pswitch_1c
    invoke-static {v1, v2}, Lcg1;->s(Landroid/os/Parcel;I)J

    .line 394
    .line 395
    .line 396
    move-result-wide v2

    .line 397
    move-wide/from16 v19, v2

    .line 398
    .line 399
    goto/16 :goto_1

    .line 400
    .line 401
    :pswitch_1d
    invoke-static {v1, v2}, Lcg1;->s(Landroid/os/Parcel;I)J

    .line 402
    .line 403
    .line 404
    move-result-wide v2

    .line 405
    move-wide/from16 v17, v2

    .line 406
    .line 407
    goto/16 :goto_1

    .line 408
    .line 409
    :pswitch_1e
    invoke-static {v1, v2}, Lcg1;->h(Landroid/os/Parcel;I)Ljava/lang/String;

    .line 410
    .line 411
    .line 412
    move-result-object v16

    .line 413
    goto/16 :goto_1

    .line 414
    .line 415
    :pswitch_1f
    invoke-static {v1, v2}, Lcg1;->h(Landroid/os/Parcel;I)Ljava/lang/String;

    .line 416
    .line 417
    .line 418
    move-result-object v15

    .line 419
    goto/16 :goto_1

    .line 420
    .line 421
    :pswitch_20
    invoke-static {v1, v2}, Lcg1;->h(Landroid/os/Parcel;I)Ljava/lang/String;

    .line 422
    .line 423
    .line 424
    move-result-object v14

    .line 425
    goto/16 :goto_1

    .line 426
    .line 427
    :pswitch_21
    invoke-static {v1, v2}, Lcg1;->h(Landroid/os/Parcel;I)Ljava/lang/String;

    .line 428
    .line 429
    .line 430
    move-result-object v13

    .line 431
    goto/16 :goto_1

    .line 432
    .line 433
    :cond_9
    invoke-static {v1, v0}, Lcg1;->l(Landroid/os/Parcel;I)V

    .line 434
    .line 435
    .line 436
    new-instance v12, Lbc2;

    .line 437
    .line 438
    invoke-direct/range {v12 .. v53}, Lbc2;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JJLjava/lang/String;ZZJLjava/lang/String;JIZZLjava/lang/Boolean;JLjava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZJILjava/lang/String;IJLjava/lang/String;Ljava/lang/String;JIJ)V

    .line 439
    .line 440
    .line 441
    return-object v12

    .line 442
    :pswitch_22
    invoke-static {v1}, Lcg1;->B(Landroid/os/Parcel;)I

    .line 443
    .line 444
    .line 445
    move-result v0

    .line 446
    move-wide v11, v2

    .line 447
    move-object v10, v6

    .line 448
    move-object v13, v10

    .line 449
    move-object v14, v13

    .line 450
    move-object v15, v14

    .line 451
    move-object/from16 v16, v15

    .line 452
    .line 453
    move-object/from16 v17, v16

    .line 454
    .line 455
    move v9, v7

    .line 456
    :goto_3
    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    .line 457
    .line 458
    .line 459
    move-result v2

    .line 460
    if-ge v2, v0, :cond_d

    .line 461
    .line 462
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 463
    .line 464
    .line 465
    move-result v2

    .line 466
    int-to-char v3, v2

    .line 467
    const/16 v4, 0x8

    .line 468
    .line 469
    packed-switch v3, :pswitch_data_2

    .line 470
    .line 471
    .line 472
    invoke-static {v1, v2}, Lcg1;->y(Landroid/os/Parcel;I)V

    .line 473
    .line 474
    .line 475
    goto :goto_3

    .line 476
    :pswitch_23
    invoke-static {v1, v2}, Lcg1;->t(Landroid/os/Parcel;I)I

    .line 477
    .line 478
    .line 479
    move-result v2

    .line 480
    if-nez v2, :cond_a

    .line 481
    .line 482
    move-object/from16 v17, v6

    .line 483
    .line 484
    goto :goto_3

    .line 485
    :cond_a
    invoke-static {v1, v2, v4}, Lcg1;->F(Landroid/os/Parcel;II)V

    .line 486
    .line 487
    .line 488
    invoke-virtual {v1}, Landroid/os/Parcel;->readDouble()D

    .line 489
    .line 490
    .line 491
    move-result-wide v2

    .line 492
    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 493
    .line 494
    .line 495
    move-result-object v2

    .line 496
    move-object/from16 v17, v2

    .line 497
    .line 498
    goto :goto_3

    .line 499
    :pswitch_24
    invoke-static {v1, v2}, Lcg1;->h(Landroid/os/Parcel;I)Ljava/lang/String;

    .line 500
    .line 501
    .line 502
    move-result-object v16

    .line 503
    goto :goto_3

    .line 504
    :pswitch_25
    invoke-static {v1, v2}, Lcg1;->h(Landroid/os/Parcel;I)Ljava/lang/String;

    .line 505
    .line 506
    .line 507
    move-result-object v15

    .line 508
    goto :goto_3

    .line 509
    :pswitch_26
    invoke-static {v1, v2}, Lcg1;->t(Landroid/os/Parcel;I)I

    .line 510
    .line 511
    .line 512
    move-result v2

    .line 513
    if-nez v2, :cond_b

    .line 514
    .line 515
    move-object v14, v6

    .line 516
    goto :goto_3

    .line 517
    :cond_b
    invoke-static {v1, v2, v5}, Lcg1;->F(Landroid/os/Parcel;II)V

    .line 518
    .line 519
    .line 520
    invoke-virtual {v1}, Landroid/os/Parcel;->readFloat()F

    .line 521
    .line 522
    .line 523
    move-result v2

    .line 524
    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 525
    .line 526
    .line 527
    move-result-object v2

    .line 528
    move-object v14, v2

    .line 529
    goto :goto_3

    .line 530
    :pswitch_27
    invoke-static {v1, v2}, Lcg1;->t(Landroid/os/Parcel;I)I

    .line 531
    .line 532
    .line 533
    move-result v2

    .line 534
    if-nez v2, :cond_c

    .line 535
    .line 536
    move-object v13, v6

    .line 537
    goto :goto_3

    .line 538
    :cond_c
    invoke-static {v1, v2, v4}, Lcg1;->F(Landroid/os/Parcel;II)V

    .line 539
    .line 540
    .line 541
    invoke-virtual {v1}, Landroid/os/Parcel;->readLong()J

    .line 542
    .line 543
    .line 544
    move-result-wide v2

    .line 545
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 546
    .line 547
    .line 548
    move-result-object v2

    .line 549
    move-object v13, v2

    .line 550
    goto :goto_3

    .line 551
    :pswitch_28
    invoke-static {v1, v2}, Lcg1;->s(Landroid/os/Parcel;I)J

    .line 552
    .line 553
    .line 554
    move-result-wide v2

    .line 555
    move-wide v11, v2

    .line 556
    goto :goto_3

    .line 557
    :pswitch_29
    invoke-static {v1, v2}, Lcg1;->h(Landroid/os/Parcel;I)Ljava/lang/String;

    .line 558
    .line 559
    .line 560
    move-result-object v10

    .line 561
    goto :goto_3

    .line 562
    :pswitch_2a
    invoke-static {v1, v2}, Lcg1;->r(Landroid/os/Parcel;I)I

    .line 563
    .line 564
    .line 565
    move-result v2

    .line 566
    move v9, v2

    .line 567
    goto :goto_3

    .line 568
    :cond_d
    invoke-static {v1, v0}, Lcg1;->l(Landroid/os/Parcel;I)V

    .line 569
    .line 570
    .line 571
    new-instance v8, Lwa2;

    .line 572
    .line 573
    invoke-direct/range {v8 .. v17}, Lwa2;-><init>(ILjava/lang/String;JLjava/lang/Long;Ljava/lang/Float;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Double;)V

    .line 574
    .line 575
    .line 576
    return-object v8

    .line 577
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_22
        :pswitch_0
    .end packed-switch

    .line 578
    .line 579
    .line 580
    .line 581
    .line 582
    .line 583
    .line 584
    .line 585
    :pswitch_data_1
    .packed-switch 0x2
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_1
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_1
        :pswitch_13
        :pswitch_1
        :pswitch_1
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_1
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_1
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
    .end packed-switch

    .line 586
    .line 587
    .line 588
    .line 589
    .line 590
    .line 591
    .line 592
    .line 593
    .line 594
    .line 595
    .line 596
    .line 597
    .line 598
    .line 599
    .line 600
    .line 601
    .line 602
    .line 603
    .line 604
    .line 605
    .line 606
    .line 607
    .line 608
    .line 609
    .line 610
    .line 611
    .line 612
    .line 613
    .line 614
    .line 615
    .line 616
    .line 617
    .line 618
    .line 619
    .line 620
    .line 621
    .line 622
    .line 623
    .line 624
    .line 625
    .line 626
    .line 627
    .line 628
    .line 629
    .line 630
    .line 631
    .line 632
    .line 633
    .line 634
    .line 635
    .line 636
    .line 637
    .line 638
    .line 639
    .line 640
    .line 641
    .line 642
    .line 643
    .line 644
    .line 645
    .line 646
    .line 647
    .line 648
    .line 649
    .line 650
    .line 651
    .line 652
    .line 653
    .line 654
    .line 655
    .line 656
    .line 657
    .line 658
    .line 659
    .line 660
    .line 661
    .line 662
    .line 663
    .line 664
    .line 665
    :pswitch_data_2
    .packed-switch 0x1
        :pswitch_2a
        :pswitch_29
        :pswitch_28
        :pswitch_27
        :pswitch_26
        :pswitch_25
        :pswitch_24
        :pswitch_23
    .end packed-switch
.end method

.method public final synthetic newArray(I)[Ljava/lang/Object;
    .locals 0

    .line 1
    iget p0, p0, Lya2;->a:I

    .line 2
    .line 3
    packed-switch p0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    new-array p0, p1, [Lcc2;

    .line 7
    .line 8
    return-object p0

    .line 9
    :pswitch_0
    new-array p0, p1, [Lbc2;

    .line 10
    .line 11
    return-object p0

    .line 12
    :pswitch_1
    new-array p0, p1, [Lwa2;

    .line 13
    .line 14
    return-object p0

    .line 15
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
