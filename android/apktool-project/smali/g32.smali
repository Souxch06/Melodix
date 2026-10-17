.class public final Lg32;
.super Lvu1;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final synthetic b:I

.field public final c:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Llb1;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput v0, p0, Lg32;->b:I

    .line 3
    .line 4
    const-string v0, "com.google.android.gms.phenotype.internal.IPhenotypeCallbacks"

    .line 5
    .line 6
    invoke-direct {p0, v0}, Lvu1;-><init>(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lg32;->c:Ljava/lang/Object;

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>(Lu32;Llb1;)V
    .locals 0

    const/4 p1, 0x0

    iput p1, p0, Lg32;->b:I

    .line 14
    iput-object p2, p0, Lg32;->c:Ljava/lang/Object;

    .line 15
    const-string p1, "com.google.android.gms.phenotype.internal.IGetStorageInfoCallbacks"

    invoke-direct {p0, p1}, Lvu1;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Lu32;Lm4;)V
    .locals 0

    const/4 p1, 0x2

    iput p1, p0, Lg32;->b:I

    .line 12
    iput-object p2, p0, Lg32;->c:Ljava/lang/Object;

    .line 13
    const-string p1, "com.google.android.gms.phenotype.internal.IFlagUpdateListener"

    invoke-direct {p0, p1}, Lvu1;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public final a(ILandroid/os/Parcel;Landroid/os/Parcel;)Z
    .locals 4

    .line 1
    iget p3, p0, Lg32;->b:I

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    const/4 v1, 0x2

    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x1

    .line 7
    packed-switch p3, :pswitch_data_0

    .line 8
    .line 9
    .line 10
    if-ne p1, v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {p2}, Landroid/os/Parcel;->createByteArray()[B

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-static {p2}, Lwu1;->d(Landroid/os/Parcel;)V

    .line 17
    .line 18
    .line 19
    new-instance p2, Lny0;

    .line 20
    .line 21
    invoke-direct {p2, p0, p1}, Lny0;-><init>(Lg32;[B)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lg32;->c:Ljava/lang/Object;

    .line 25
    .line 26
    check-cast p0, Lm4;

    .line 27
    .line 28
    new-instance p1, Lvl1;

    .line 29
    .line 30
    invoke-direct {p1, p0, p2}, Lvl1;-><init>(Lm4;Lny0;)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Lm4;->a:Ljava/lang/Object;

    .line 34
    .line 35
    check-cast p0, Lq10;

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Lq10;->execute(Ljava/lang/Runnable;)V

    .line 38
    .line 39
    .line 40
    move v2, v3

    .line 41
    :cond_0
    return v2

    .line 42
    :pswitch_0
    iget-object p0, p0, Lg32;->c:Ljava/lang/Object;

    .line 43
    .line 44
    check-cast p0, Llb1;

    .line 45
    .line 46
    packed-switch p1, :pswitch_data_1

    .line 47
    .line 48
    .line 49
    goto/16 :goto_1

    .line 50
    .line 51
    :pswitch_1
    sget-object p1, Lcom/google/android/gms/common/api/Status;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 52
    .line 53
    invoke-static {p2, p1}, Lwu1;->a(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    check-cast p1, Lcom/google/android/gms/common/api/Status;

    .line 58
    .line 59
    invoke-virtual {p2}, Landroid/os/Parcel;->readLong()J

    .line 60
    .line 61
    .line 62
    move-result-wide v0

    .line 63
    invoke-static {p2}, Lwu1;->d(Landroid/os/Parcel;)V

    .line 64
    .line 65
    .line 66
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 67
    .line 68
    .line 69
    move-result-object p2

    .line 70
    invoke-static {p1, p2, p0}, Lcg1;->x(Lcom/google/android/gms/common/api/Status;Ljava/lang/Object;Llb1;)V

    .line 71
    .line 72
    .line 73
    goto/16 :goto_0

    .line 74
    .line 75
    :pswitch_2
    sget-object p1, Lcom/google/android/gms/common/api/Status;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 76
    .line 77
    invoke-static {p2, p1}, Lwu1;->a(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    check-cast p1, Lcom/google/android/gms/common/api/Status;

    .line 82
    .line 83
    invoke-static {p2}, Lwu1;->d(Landroid/os/Parcel;)V

    .line 84
    .line 85
    .line 86
    invoke-static {p1, v0, p0}, Lcg1;->x(Lcom/google/android/gms/common/api/Status;Ljava/lang/Object;Llb1;)V

    .line 87
    .line 88
    .line 89
    goto/16 :goto_0

    .line 90
    .line 91
    :pswitch_3
    sget-object p1, Lcom/google/android/gms/common/api/Status;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 92
    .line 93
    invoke-static {p2, p1}, Lwu1;->a(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    check-cast p1, Lcom/google/android/gms/common/api/Status;

    .line 98
    .line 99
    invoke-static {p2}, Lwu1;->d(Landroid/os/Parcel;)V

    .line 100
    .line 101
    .line 102
    invoke-static {p1, v0, p0}, Lcg1;->x(Lcom/google/android/gms/common/api/Status;Ljava/lang/Object;Llb1;)V

    .line 103
    .line 104
    .line 105
    goto/16 :goto_0

    .line 106
    .line 107
    :pswitch_4
    sget-object p1, Lcom/google/android/gms/common/api/Status;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 108
    .line 109
    invoke-static {p2, p1}, Lwu1;->a(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    check-cast p1, Lcom/google/android/gms/common/api/Status;

    .line 114
    .line 115
    sget-object p3, La32;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 116
    .line 117
    invoke-static {p2, p3}, Lwu1;->a(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 118
    .line 119
    .line 120
    move-result-object p3

    .line 121
    check-cast p3, La32;

    .line 122
    .line 123
    invoke-static {p2}, Lwu1;->d(Landroid/os/Parcel;)V

    .line 124
    .line 125
    .line 126
    invoke-static {p1, p3, p0}, Lcg1;->x(Lcom/google/android/gms/common/api/Status;Ljava/lang/Object;Llb1;)V

    .line 127
    .line 128
    .line 129
    goto/16 :goto_0

    .line 130
    .line 131
    :pswitch_5
    sget-object p1, Lcom/google/android/gms/common/api/Status;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 132
    .line 133
    invoke-static {p2, p1}, Lwu1;->a(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    check-cast p1, Lcom/google/android/gms/common/api/Status;

    .line 138
    .line 139
    invoke-static {p2}, Lwu1;->d(Landroid/os/Parcel;)V

    .line 140
    .line 141
    .line 142
    invoke-static {p1, v0, p0}, Lcg1;->x(Lcom/google/android/gms/common/api/Status;Ljava/lang/Object;Llb1;)V

    .line 143
    .line 144
    .line 145
    goto/16 :goto_0

    .line 146
    .line 147
    :pswitch_6
    sget-object p1, Lcom/google/android/gms/common/api/Status;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 148
    .line 149
    invoke-static {p2, p1}, Lwu1;->a(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 150
    .line 151
    .line 152
    move-result-object p1

    .line 153
    check-cast p1, Lcom/google/android/gms/common/api/Status;

    .line 154
    .line 155
    invoke-virtual {p2}, Landroid/os/Parcel;->readLong()J

    .line 156
    .line 157
    .line 158
    invoke-static {p2}, Lwu1;->d(Landroid/os/Parcel;)V

    .line 159
    .line 160
    .line 161
    invoke-static {p1, v0, p0}, Lcg1;->x(Lcom/google/android/gms/common/api/Status;Ljava/lang/Object;Llb1;)V

    .line 162
    .line 163
    .line 164
    goto/16 :goto_0

    .line 165
    .line 166
    :pswitch_7
    sget-object p1, Lcom/google/android/gms/common/api/Status;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 167
    .line 168
    invoke-static {p2, p1}, Lwu1;->a(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 169
    .line 170
    .line 171
    move-result-object p1

    .line 172
    check-cast p1, Lcom/google/android/gms/common/api/Status;

    .line 173
    .line 174
    sget-object p3, Lp22;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 175
    .line 176
    invoke-static {p2, p3}, Lwu1;->a(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 177
    .line 178
    .line 179
    move-result-object p3

    .line 180
    check-cast p3, Lp22;

    .line 181
    .line 182
    invoke-static {p2}, Lwu1;->d(Landroid/os/Parcel;)V

    .line 183
    .line 184
    .line 185
    invoke-static {p1, p3, p0}, Lcg1;->x(Lcom/google/android/gms/common/api/Status;Ljava/lang/Object;Llb1;)V

    .line 186
    .line 187
    .line 188
    goto/16 :goto_0

    .line 189
    .line 190
    :pswitch_8
    sget-object p1, Lcom/google/android/gms/common/api/Status;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 191
    .line 192
    invoke-static {p2, p1}, Lwu1;->a(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 193
    .line 194
    .line 195
    move-result-object p1

    .line 196
    check-cast p1, Lcom/google/android/gms/common/api/Status;

    .line 197
    .line 198
    sget-object p3, Lw22;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 199
    .line 200
    invoke-static {p2, p3}, Lwu1;->a(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 201
    .line 202
    .line 203
    move-result-object p3

    .line 204
    check-cast p3, Lw22;

    .line 205
    .line 206
    invoke-static {p2}, Lwu1;->d(Landroid/os/Parcel;)V

    .line 207
    .line 208
    .line 209
    invoke-static {p1, p3, p0}, Lcg1;->x(Lcom/google/android/gms/common/api/Status;Ljava/lang/Object;Llb1;)V

    .line 210
    .line 211
    .line 212
    goto/16 :goto_0

    .line 213
    .line 214
    :pswitch_9
    sget-object p1, Lcom/google/android/gms/common/api/Status;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 215
    .line 216
    invoke-static {p2, p1}, Lwu1;->a(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 217
    .line 218
    .line 219
    move-result-object p1

    .line 220
    check-cast p1, Lcom/google/android/gms/common/api/Status;

    .line 221
    .line 222
    invoke-static {p2}, Lwu1;->d(Landroid/os/Parcel;)V

    .line 223
    .line 224
    .line 225
    invoke-static {p1, v0, p0}, Lcg1;->x(Lcom/google/android/gms/common/api/Status;Ljava/lang/Object;Llb1;)V

    .line 226
    .line 227
    .line 228
    goto/16 :goto_0

    .line 229
    .line 230
    :pswitch_a
    sget-object p1, Lcom/google/android/gms/common/api/Status;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 231
    .line 232
    invoke-static {p2, p1}, Lwu1;->a(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 233
    .line 234
    .line 235
    move-result-object p1

    .line 236
    check-cast p1, Lcom/google/android/gms/common/api/Status;

    .line 237
    .line 238
    sget-object p3, Ls22;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 239
    .line 240
    invoke-static {p2, p3}, Lwu1;->a(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 241
    .line 242
    .line 243
    move-result-object p3

    .line 244
    check-cast p3, Ls22;

    .line 245
    .line 246
    invoke-static {p2}, Lwu1;->d(Landroid/os/Parcel;)V

    .line 247
    .line 248
    .line 249
    invoke-static {p1, p3, p0}, Lcg1;->x(Lcom/google/android/gms/common/api/Status;Ljava/lang/Object;Llb1;)V

    .line 250
    .line 251
    .line 252
    goto :goto_0

    .line 253
    :pswitch_b
    sget-object p1, Lcom/google/android/gms/common/api/Status;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 254
    .line 255
    invoke-static {p2, p1}, Lwu1;->a(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 256
    .line 257
    .line 258
    move-result-object p1

    .line 259
    check-cast p1, Lcom/google/android/gms/common/api/Status;

    .line 260
    .line 261
    sget-object p3, Lv22;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 262
    .line 263
    invoke-static {p2, p3}, Lwu1;->a(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 264
    .line 265
    .line 266
    move-result-object p3

    .line 267
    check-cast p3, Lv22;

    .line 268
    .line 269
    invoke-static {p2}, Lwu1;->d(Landroid/os/Parcel;)V

    .line 270
    .line 271
    .line 272
    invoke-static {p1, p3, p0}, Lcg1;->x(Lcom/google/android/gms/common/api/Status;Ljava/lang/Object;Llb1;)V

    .line 273
    .line 274
    .line 275
    goto :goto_0

    .line 276
    :pswitch_c
    sget-object p1, Lcom/google/android/gms/common/api/Status;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 277
    .line 278
    invoke-static {p2, p1}, Lwu1;->a(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 279
    .line 280
    .line 281
    move-result-object p1

    .line 282
    check-cast p1, Lcom/google/android/gms/common/api/Status;

    .line 283
    .line 284
    invoke-static {p2}, Lwu1;->d(Landroid/os/Parcel;)V

    .line 285
    .line 286
    .line 287
    invoke-static {p1, v0, p0}, Lcg1;->x(Lcom/google/android/gms/common/api/Status;Ljava/lang/Object;Llb1;)V

    .line 288
    .line 289
    .line 290
    goto :goto_0

    .line 291
    :pswitch_d
    sget-object p1, Lcom/google/android/gms/common/api/Status;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 292
    .line 293
    invoke-static {p2, p1}, Lwu1;->a(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 294
    .line 295
    .line 296
    move-result-object p1

    .line 297
    check-cast p1, Lcom/google/android/gms/common/api/Status;

    .line 298
    .line 299
    sget-object p3, Lp22;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 300
    .line 301
    invoke-static {p2, p3}, Lwu1;->a(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 302
    .line 303
    .line 304
    move-result-object p3

    .line 305
    check-cast p3, Lp22;

    .line 306
    .line 307
    invoke-static {p2}, Lwu1;->d(Landroid/os/Parcel;)V

    .line 308
    .line 309
    .line 310
    invoke-static {p1, p3, p0}, Lcg1;->x(Lcom/google/android/gms/common/api/Status;Ljava/lang/Object;Llb1;)V

    .line 311
    .line 312
    .line 313
    goto :goto_0

    .line 314
    :pswitch_e
    sget-object p1, Lcom/google/android/gms/common/api/Status;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 315
    .line 316
    invoke-static {p2, p1}, Lwu1;->a(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 317
    .line 318
    .line 319
    move-result-object p1

    .line 320
    check-cast p1, Lcom/google/android/gms/common/api/Status;

    .line 321
    .line 322
    invoke-static {p2}, Lwu1;->d(Landroid/os/Parcel;)V

    .line 323
    .line 324
    .line 325
    invoke-static {p1, v0, p0}, Lcg1;->x(Lcom/google/android/gms/common/api/Status;Ljava/lang/Object;Llb1;)V

    .line 326
    .line 327
    .line 328
    goto :goto_0

    .line 329
    :pswitch_f
    sget-object p1, Lcom/google/android/gms/common/api/Status;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 330
    .line 331
    invoke-static {p2, p1}, Lwu1;->a(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 332
    .line 333
    .line 334
    move-result-object p1

    .line 335
    check-cast p1, Lcom/google/android/gms/common/api/Status;

    .line 336
    .line 337
    invoke-static {p2}, Lwu1;->d(Landroid/os/Parcel;)V

    .line 338
    .line 339
    .line 340
    invoke-static {p1, v0, p0}, Lcg1;->x(Lcom/google/android/gms/common/api/Status;Ljava/lang/Object;Llb1;)V

    .line 341
    .line 342
    .line 343
    goto :goto_0

    .line 344
    :pswitch_10
    sget-object p1, Lcom/google/android/gms/common/api/Status;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 345
    .line 346
    invoke-static {p2, p1}, Lwu1;->a(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 347
    .line 348
    .line 349
    move-result-object p1

    .line 350
    check-cast p1, Lcom/google/android/gms/common/api/Status;

    .line 351
    .line 352
    invoke-static {p2}, Lwu1;->d(Landroid/os/Parcel;)V

    .line 353
    .line 354
    .line 355
    invoke-static {p1, v0, p0}, Lcg1;->x(Lcom/google/android/gms/common/api/Status;Ljava/lang/Object;Llb1;)V

    .line 356
    .line 357
    .line 358
    :goto_0
    move v2, v3

    .line 359
    :goto_1
    return v2

    .line 360
    :pswitch_11
    if-ne p1, v1, :cond_2

    .line 361
    .line 362
    sget-object p1, Lcom/google/android/gms/common/api/Status;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 363
    .line 364
    invoke-static {p2, p1}, Lwu1;->a(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 365
    .line 366
    .line 367
    move-result-object p1

    .line 368
    check-cast p1, Lcom/google/android/gms/common/api/Status;

    .line 369
    .line 370
    invoke-virtual {p2}, Landroid/os/Parcel;->createByteArray()[B

    .line 371
    .line 372
    .line 373
    move-result-object p3

    .line 374
    invoke-static {p2}, Lwu1;->d(Landroid/os/Parcel;)V

    .line 375
    .line 376
    .line 377
    iget-object p0, p0, Lg32;->c:Ljava/lang/Object;

    .line 378
    .line 379
    check-cast p0, Llb1;

    .line 380
    .line 381
    iget p2, p1, Lcom/google/android/gms/common/api/Status;->j:I

    .line 382
    .line 383
    if-gtz p2, :cond_1

    .line 384
    .line 385
    :try_start_0
    sget-object p2, Lgp1;->a:Lgp1;

    .line 386
    .line 387
    sget p2, Lso1;->a:I

    .line 388
    .line 389
    sget-object p2, Lgp1;->b:Lgp1;

    .line 390
    .line 391
    invoke-static {p3, p2}, Lo82;->t([BLgp1;)Lo82;

    .line 392
    .line 393
    .line 394
    move-result-object p2
    :try_end_0
    .catch Laq1; {:try_start_0 .. :try_end_0} :catch_0

    .line 395
    invoke-static {p1, p2, p0}, Lcg1;->x(Lcom/google/android/gms/common/api/Status;Ljava/lang/Object;Llb1;)V

    .line 396
    .line 397
    .line 398
    goto :goto_2

    .line 399
    :catch_0
    move-exception p1

    .line 400
    iget-object p0, p0, Llb1;->a:Ljd2;

    .line 401
    .line 402
    invoke-virtual {p0, p1}, Ljd2;->n(Ljava/lang/Exception;)V

    .line 403
    .line 404
    .line 405
    goto :goto_2

    .line 406
    :cond_1
    invoke-static {p1, v0, p0}, Lcg1;->x(Lcom/google/android/gms/common/api/Status;Ljava/lang/Object;Llb1;)V

    .line 407
    .line 408
    .line 409
    :goto_2
    move v2, v3

    .line 410
    :cond_2
    return v2

    .line 411
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_11
        :pswitch_0
    .end packed-switch

    .line 412
    .line 413
    .line 414
    .line 415
    .line 416
    .line 417
    .line 418
    .line 419
    :pswitch_data_1
    .packed-switch 0x1
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
    .end packed-switch
.end method
