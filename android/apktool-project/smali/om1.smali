.class public final Lom1;
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
    iput p1, p0, Lom1;->a:I

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static a(Lna0;Landroid/os/Parcel;I)V
    .locals 4

    .line 1
    const/16 v0, 0x4f45

    .line 2
    .line 3
    invoke-static {p1, v0}, Lbe2;->L(Landroid/os/Parcel;I)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget v1, p0, Lna0;->j:I

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    const/4 v3, 0x4

    .line 11
    invoke-static {p1, v2, v3}, Lbe2;->J(Landroid/os/Parcel;II)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 15
    .line 16
    .line 17
    iget v1, p0, Lna0;->k:I

    .line 18
    .line 19
    const/4 v2, 0x2

    .line 20
    invoke-static {p1, v2, v3}, Lbe2;->J(Landroid/os/Parcel;II)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 24
    .line 25
    .line 26
    iget v1, p0, Lna0;->l:I

    .line 27
    .line 28
    const/4 v2, 0x3

    .line 29
    invoke-static {p1, v2, v3}, Lbe2;->J(Landroid/os/Parcel;II)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 33
    .line 34
    .line 35
    iget-object v1, p0, Lna0;->m:Ljava/lang/String;

    .line 36
    .line 37
    invoke-static {p1, v3, v1}, Lbe2;->F(Landroid/os/Parcel;ILjava/lang/String;)V

    .line 38
    .line 39
    .line 40
    const/4 v1, 0x5

    .line 41
    iget-object v2, p0, Lna0;->n:Landroid/os/IBinder;

    .line 42
    .line 43
    invoke-static {p1, v1, v2}, Lbe2;->C(Landroid/os/Parcel;ILandroid/os/IBinder;)V

    .line 44
    .line 45
    .line 46
    const/4 v1, 0x6

    .line 47
    iget-object v2, p0, Lna0;->o:[Lcom/google/android/gms/common/api/Scope;

    .line 48
    .line 49
    invoke-static {p1, v1, v2, p2}, Lbe2;->G(Landroid/os/Parcel;I[Landroid/os/Parcelable;I)V

    .line 50
    .line 51
    .line 52
    const/4 v1, 0x7

    .line 53
    iget-object v2, p0, Lna0;->p:Landroid/os/Bundle;

    .line 54
    .line 55
    invoke-static {p1, v1, v2}, Lbe2;->z(Landroid/os/Parcel;ILandroid/os/Bundle;)V

    .line 56
    .line 57
    .line 58
    const/16 v1, 0x8

    .line 59
    .line 60
    iget-object v2, p0, Lna0;->q:Landroid/accounts/Account;

    .line 61
    .line 62
    invoke-static {p1, v1, v2, p2}, Lbe2;->E(Landroid/os/Parcel;ILandroid/os/Parcelable;I)V

    .line 63
    .line 64
    .line 65
    const/16 v1, 0xa

    .line 66
    .line 67
    iget-object v2, p0, Lna0;->r:[Lu20;

    .line 68
    .line 69
    invoke-static {p1, v1, v2, p2}, Lbe2;->G(Landroid/os/Parcel;I[Landroid/os/Parcelable;I)V

    .line 70
    .line 71
    .line 72
    const/16 v1, 0xb

    .line 73
    .line 74
    iget-object v2, p0, Lna0;->s:[Lu20;

    .line 75
    .line 76
    invoke-static {p1, v1, v2, p2}, Lbe2;->G(Landroid/os/Parcel;I[Landroid/os/Parcelable;I)V

    .line 77
    .line 78
    .line 79
    iget-boolean p2, p0, Lna0;->t:Z

    .line 80
    .line 81
    const/16 v1, 0xc

    .line 82
    .line 83
    invoke-static {p1, v1, v3}, Lbe2;->J(Landroid/os/Parcel;II)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 87
    .line 88
    .line 89
    iget p2, p0, Lna0;->u:I

    .line 90
    .line 91
    const/16 v1, 0xd

    .line 92
    .line 93
    invoke-static {p1, v1, v3}, Lbe2;->J(Landroid/os/Parcel;II)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 97
    .line 98
    .line 99
    iget-boolean p2, p0, Lna0;->v:Z

    .line 100
    .line 101
    const/16 v1, 0xe

    .line 102
    .line 103
    invoke-static {p1, v1, v3}, Lbe2;->J(Landroid/os/Parcel;II)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 107
    .line 108
    .line 109
    const/16 p2, 0xf

    .line 110
    .line 111
    iget-object p0, p0, Lna0;->w:Ljava/lang/String;

    .line 112
    .line 113
    invoke-static {p1, p2, p0}, Lbe2;->F(Landroid/os/Parcel;ILjava/lang/String;)V

    .line 114
    .line 115
    .line 116
    invoke-static {p1, v0}, Lbe2;->N(Landroid/os/Parcel;I)V

    .line 117
    .line 118
    .line 119
    return-void
.end method

.method public static b(Ltu1;Landroid/os/Parcel;I)V
    .locals 4

    .line 1
    iget-object v0, p0, Ltu1;->j:Ljava/lang/String;

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
    const/4 v2, 0x2

    .line 10
    invoke-static {p1, v2, v0}, Lbe2;->F(Landroid/os/Parcel;ILjava/lang/String;)V

    .line 11
    .line 12
    .line 13
    const/4 v0, 0x3

    .line 14
    iget-object v2, p0, Ltu1;->k:Lsu1;

    .line 15
    .line 16
    invoke-static {p1, v0, v2, p2}, Lbe2;->E(Landroid/os/Parcel;ILandroid/os/Parcelable;I)V

    .line 17
    .line 18
    .line 19
    const/4 p2, 0x4

    .line 20
    iget-object v0, p0, Ltu1;->l:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {p1, p2, v0}, Lbe2;->F(Landroid/os/Parcel;ILjava/lang/String;)V

    .line 23
    .line 24
    .line 25
    iget-wide v2, p0, Ltu1;->m:J

    .line 26
    .line 27
    const/4 p2, 0x5

    .line 28
    const/16 v0, 0x8

    .line 29
    .line 30
    invoke-static {p1, p2, v0}, Lbe2;->J(Landroid/os/Parcel;II)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1, v2, v3}, Landroid/os/Parcel;->writeLong(J)V

    .line 34
    .line 35
    .line 36
    iget-wide v2, p0, Ltu1;->n:J

    .line 37
    .line 38
    const/4 p0, 0x6

    .line 39
    invoke-static {p1, p0, v0}, Lbe2;->J(Landroid/os/Parcel;II)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p1, v2, v3}, Landroid/os/Parcel;->writeLong(J)V

    .line 43
    .line 44
    .line 45
    invoke-static {p1, v1}, Lbe2;->N(Landroid/os/Parcel;I)V

    .line 46
    .line 47
    .line 48
    return-void
.end method


# virtual methods
.method public final createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 27

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iget v0, v0, Lom1;->a:I

    .line 6
    .line 7
    const/16 v2, 0x8

    .line 8
    .line 9
    const/4 v3, 0x5

    .line 10
    const-wide/16 v4, 0x0

    .line 11
    .line 12
    const/4 v6, 0x4

    .line 13
    const/4 v7, 0x3

    .line 14
    const/4 v8, 0x1

    .line 15
    const/4 v9, 0x2

    .line 16
    const/4 v10, 0x0

    .line 17
    const/4 v11, 0x0

    .line 18
    packed-switch v0, :pswitch_data_0

    .line 19
    .line 20
    .line 21
    invoke-static {v1}, Lcg1;->B(Landroid/os/Parcel;)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    :goto_0
    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-ge v2, v0, :cond_1

    .line 30
    .line 31
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    int-to-char v3, v2

    .line 36
    if-eq v3, v8, :cond_0

    .line 37
    .line 38
    invoke-static {v1, v2}, Lcg1;->y(Landroid/os/Parcel;I)V

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    sget-object v3, Lt92;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 43
    .line 44
    invoke-static {v1, v2, v3}, Lcg1;->j(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Ljava/util/ArrayList;

    .line 45
    .line 46
    .line 47
    move-result-object v11

    .line 48
    goto :goto_0

    .line 49
    :cond_1
    invoke-static {v1, v0}, Lcg1;->l(Landroid/os/Parcel;I)V

    .line 50
    .line 51
    .line 52
    new-instance v0, Ly92;

    .line 53
    .line 54
    invoke-direct {v0, v11}, Ly92;-><init>(Ljava/util/ArrayList;)V

    .line 55
    .line 56
    .line 57
    return-object v0

    .line 58
    :pswitch_0
    invoke-static {v1}, Lcg1;->B(Landroid/os/Parcel;)I

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    :goto_1
    move-object v2, v11

    .line 63
    :goto_2
    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    .line 64
    .line 65
    .line 66
    move-result v3

    .line 67
    if-ge v3, v0, :cond_5

    .line 68
    .line 69
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 70
    .line 71
    .line 72
    move-result v3

    .line 73
    int-to-char v4, v3

    .line 74
    if-eq v4, v8, :cond_2

    .line 75
    .line 76
    invoke-static {v1, v3}, Lcg1;->y(Landroid/os/Parcel;I)V

    .line 77
    .line 78
    .line 79
    goto :goto_2

    .line 80
    :cond_2
    invoke-static {v1, v3}, Lcg1;->t(Landroid/os/Parcel;I)I

    .line 81
    .line 82
    .line 83
    move-result v2

    .line 84
    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    .line 85
    .line 86
    .line 87
    move-result v3

    .line 88
    if-nez v2, :cond_3

    .line 89
    .line 90
    goto :goto_1

    .line 91
    :cond_3
    new-instance v4, Ljava/util/ArrayList;

    .line 92
    .line 93
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 94
    .line 95
    .line 96
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 97
    .line 98
    .line 99
    move-result v5

    .line 100
    move v6, v10

    .line 101
    :goto_3
    if-ge v6, v5, :cond_4

    .line 102
    .line 103
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 104
    .line 105
    .line 106
    move-result v7

    .line 107
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 108
    .line 109
    .line 110
    move-result-object v7

    .line 111
    invoke-virtual {v4, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    add-int/lit8 v6, v6, 0x1

    .line 115
    .line 116
    goto :goto_3

    .line 117
    :cond_4
    add-int/2addr v3, v2

    .line 118
    invoke-virtual {v1, v3}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 119
    .line 120
    .line 121
    move-object v2, v4

    .line 122
    goto :goto_2

    .line 123
    :cond_5
    invoke-static {v1, v0}, Lcg1;->l(Landroid/os/Parcel;I)V

    .line 124
    .line 125
    .line 126
    new-instance v0, Lv92;

    .line 127
    .line 128
    invoke-direct {v0, v2}, Lv92;-><init>(Ljava/util/ArrayList;)V

    .line 129
    .line 130
    .line 131
    return-object v0

    .line 132
    :pswitch_1
    invoke-static {v1}, Lcg1;->B(Landroid/os/Parcel;)I

    .line 133
    .line 134
    .line 135
    move-result v0

    .line 136
    move-wide v13, v4

    .line 137
    move-wide/from16 v19, v13

    .line 138
    .line 139
    move/from16 v18, v10

    .line 140
    .line 141
    move-object v15, v11

    .line 142
    move-object/from16 v16, v15

    .line 143
    .line 144
    move-object/from16 v17, v16

    .line 145
    .line 146
    move-object/from16 v21, v17

    .line 147
    .line 148
    :goto_4
    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    .line 149
    .line 150
    .line 151
    move-result v2

    .line 152
    if-ge v2, v0, :cond_6

    .line 153
    .line 154
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 155
    .line 156
    .line 157
    move-result v2

    .line 158
    int-to-char v3, v2

    .line 159
    packed-switch v3, :pswitch_data_1

    .line 160
    .line 161
    .line 162
    invoke-static {v1, v2}, Lcg1;->y(Landroid/os/Parcel;I)V

    .line 163
    .line 164
    .line 165
    goto :goto_4

    .line 166
    :pswitch_2
    invoke-static {v1, v2}, Lcg1;->h(Landroid/os/Parcel;I)Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object v2

    .line 170
    move-object/from16 v21, v2

    .line 171
    .line 172
    goto :goto_4

    .line 173
    :pswitch_3
    invoke-static {v1, v2}, Lcg1;->s(Landroid/os/Parcel;I)J

    .line 174
    .line 175
    .line 176
    move-result-wide v2

    .line 177
    move-wide/from16 v19, v2

    .line 178
    .line 179
    goto :goto_4

    .line 180
    :pswitch_4
    invoke-static {v1, v2}, Lcg1;->r(Landroid/os/Parcel;I)I

    .line 181
    .line 182
    .line 183
    move-result v2

    .line 184
    move/from16 v18, v2

    .line 185
    .line 186
    goto :goto_4

    .line 187
    :pswitch_5
    invoke-static {v1, v2}, Lcg1;->c(Landroid/os/Parcel;I)Landroid/os/Bundle;

    .line 188
    .line 189
    .line 190
    move-result-object v2

    .line 191
    move-object/from16 v17, v2

    .line 192
    .line 193
    goto :goto_4

    .line 194
    :pswitch_6
    invoke-static {v1, v2}, Lcg1;->h(Landroid/os/Parcel;I)Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object v2

    .line 198
    move-object/from16 v16, v2

    .line 199
    .line 200
    goto :goto_4

    .line 201
    :pswitch_7
    invoke-static {v1, v2}, Lcg1;->d(Landroid/os/Parcel;I)[B

    .line 202
    .line 203
    .line 204
    move-result-object v2

    .line 205
    move-object v15, v2

    .line 206
    goto :goto_4

    .line 207
    :pswitch_8
    invoke-static {v1, v2}, Lcg1;->s(Landroid/os/Parcel;I)J

    .line 208
    .line 209
    .line 210
    move-result-wide v2

    .line 211
    move-wide v13, v2

    .line 212
    goto :goto_4

    .line 213
    :cond_6
    invoke-static {v1, v0}, Lcg1;->l(Landroid/os/Parcel;I)V

    .line 214
    .line 215
    .line 216
    new-instance v12, Lt92;

    .line 217
    .line 218
    invoke-direct/range {v12 .. v21}, Lt92;-><init>(J[BLjava/lang/String;Landroid/os/Bundle;IJLjava/lang/String;)V

    .line 219
    .line 220
    .line 221
    return-object v12

    .line 222
    :pswitch_9
    invoke-static {v1}, Lcg1;->B(Landroid/os/Parcel;)I

    .line 223
    .line 224
    .line 225
    move-result v0

    .line 226
    :goto_5
    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    .line 227
    .line 228
    .line 229
    move-result v2

    .line 230
    if-ge v2, v0, :cond_a

    .line 231
    .line 232
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 233
    .line 234
    .line 235
    move-result v2

    .line 236
    int-to-char v3, v2

    .line 237
    if-eq v3, v8, :cond_9

    .line 238
    .line 239
    if-eq v3, v9, :cond_8

    .line 240
    .line 241
    if-eq v3, v7, :cond_7

    .line 242
    .line 243
    invoke-static {v1, v2}, Lcg1;->y(Landroid/os/Parcel;I)V

    .line 244
    .line 245
    .line 246
    goto :goto_5

    .line 247
    :cond_7
    invoke-static {v1, v2}, Lcg1;->r(Landroid/os/Parcel;I)I

    .line 248
    .line 249
    .line 250
    move-result v2

    .line 251
    move v10, v2

    .line 252
    goto :goto_5

    .line 253
    :cond_8
    invoke-static {v1, v2}, Lcg1;->s(Landroid/os/Parcel;I)J

    .line 254
    .line 255
    .line 256
    move-result-wide v2

    .line 257
    move-wide v4, v2

    .line 258
    goto :goto_5

    .line 259
    :cond_9
    invoke-static {v1, v2}, Lcg1;->h(Landroid/os/Parcel;I)Ljava/lang/String;

    .line 260
    .line 261
    .line 262
    move-result-object v2

    .line 263
    move-object v11, v2

    .line 264
    goto :goto_5

    .line 265
    :cond_a
    invoke-static {v1, v0}, Lcg1;->l(Landroid/os/Parcel;I)V

    .line 266
    .line 267
    .line 268
    new-instance v0, Lo92;

    .line 269
    .line 270
    invoke-direct {v0, v10, v4, v5, v11}, Lo92;-><init>(IJLjava/lang/String;)V

    .line 271
    .line 272
    .line 273
    return-object v0

    .line 274
    :pswitch_a
    invoke-static {v1}, Lcg1;->B(Landroid/os/Parcel;)I

    .line 275
    .line 276
    .line 277
    move-result v0

    .line 278
    new-instance v2, Landroid/os/Bundle;

    .line 279
    .line 280
    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    .line 281
    .line 282
    .line 283
    sget-object v3, Lna0;->x:[Lcom/google/android/gms/common/api/Scope;

    .line 284
    .line 285
    sget-object v4, Lna0;->y:[Lu20;

    .line 286
    .line 287
    move-object/from16 v19, v2

    .line 288
    .line 289
    move-object/from16 v18, v3

    .line 290
    .line 291
    move-object/from16 v21, v4

    .line 292
    .line 293
    move-object/from16 v22, v21

    .line 294
    .line 295
    move v13, v10

    .line 296
    move v14, v13

    .line 297
    move v15, v14

    .line 298
    move/from16 v23, v15

    .line 299
    .line 300
    move/from16 v24, v23

    .line 301
    .line 302
    move/from16 v25, v24

    .line 303
    .line 304
    move-object/from16 v16, v11

    .line 305
    .line 306
    move-object/from16 v17, v16

    .line 307
    .line 308
    move-object/from16 v20, v17

    .line 309
    .line 310
    move-object/from16 v26, v20

    .line 311
    .line 312
    :goto_6
    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    .line 313
    .line 314
    .line 315
    move-result v2

    .line 316
    if-ge v2, v0, :cond_b

    .line 317
    .line 318
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 319
    .line 320
    .line 321
    move-result v2

    .line 322
    int-to-char v3, v2

    .line 323
    packed-switch v3, :pswitch_data_2

    .line 324
    .line 325
    .line 326
    :pswitch_b
    invoke-static {v1, v2}, Lcg1;->y(Landroid/os/Parcel;I)V

    .line 327
    .line 328
    .line 329
    goto :goto_6

    .line 330
    :pswitch_c
    invoke-static {v1, v2}, Lcg1;->h(Landroid/os/Parcel;I)Ljava/lang/String;

    .line 331
    .line 332
    .line 333
    move-result-object v26

    .line 334
    goto :goto_6

    .line 335
    :pswitch_d
    invoke-static {v1, v2}, Lcg1;->o(Landroid/os/Parcel;I)Z

    .line 336
    .line 337
    .line 338
    move-result v25

    .line 339
    goto :goto_6

    .line 340
    :pswitch_e
    invoke-static {v1, v2}, Lcg1;->r(Landroid/os/Parcel;I)I

    .line 341
    .line 342
    .line 343
    move-result v24

    .line 344
    goto :goto_6

    .line 345
    :pswitch_f
    invoke-static {v1, v2}, Lcg1;->o(Landroid/os/Parcel;I)Z

    .line 346
    .line 347
    .line 348
    move-result v23

    .line 349
    goto :goto_6

    .line 350
    :pswitch_10
    sget-object v3, Lu20;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 351
    .line 352
    invoke-static {v1, v2, v3}, Lcg1;->i(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)[Ljava/lang/Object;

    .line 353
    .line 354
    .line 355
    move-result-object v2

    .line 356
    move-object/from16 v22, v2

    .line 357
    .line 358
    check-cast v22, [Lu20;

    .line 359
    .line 360
    goto :goto_6

    .line 361
    :pswitch_11
    sget-object v3, Lu20;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 362
    .line 363
    invoke-static {v1, v2, v3}, Lcg1;->i(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)[Ljava/lang/Object;

    .line 364
    .line 365
    .line 366
    move-result-object v2

    .line 367
    move-object/from16 v21, v2

    .line 368
    .line 369
    check-cast v21, [Lu20;

    .line 370
    .line 371
    goto :goto_6

    .line 372
    :pswitch_12
    sget-object v3, Landroid/accounts/Account;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 373
    .line 374
    invoke-static {v1, v2, v3}, Lcg1;->g(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 375
    .line 376
    .line 377
    move-result-object v2

    .line 378
    move-object/from16 v20, v2

    .line 379
    .line 380
    check-cast v20, Landroid/accounts/Account;

    .line 381
    .line 382
    goto :goto_6

    .line 383
    :pswitch_13
    invoke-static {v1, v2}, Lcg1;->c(Landroid/os/Parcel;I)Landroid/os/Bundle;

    .line 384
    .line 385
    .line 386
    move-result-object v19

    .line 387
    goto :goto_6

    .line 388
    :pswitch_14
    sget-object v3, Lcom/google/android/gms/common/api/Scope;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 389
    .line 390
    invoke-static {v1, v2, v3}, Lcg1;->i(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)[Ljava/lang/Object;

    .line 391
    .line 392
    .line 393
    move-result-object v2

    .line 394
    move-object/from16 v18, v2

    .line 395
    .line 396
    check-cast v18, [Lcom/google/android/gms/common/api/Scope;

    .line 397
    .line 398
    goto :goto_6

    .line 399
    :pswitch_15
    invoke-static {v1, v2}, Lcg1;->q(Landroid/os/Parcel;I)Landroid/os/IBinder;

    .line 400
    .line 401
    .line 402
    move-result-object v17

    .line 403
    goto :goto_6

    .line 404
    :pswitch_16
    invoke-static {v1, v2}, Lcg1;->h(Landroid/os/Parcel;I)Ljava/lang/String;

    .line 405
    .line 406
    .line 407
    move-result-object v16

    .line 408
    goto :goto_6

    .line 409
    :pswitch_17
    invoke-static {v1, v2}, Lcg1;->r(Landroid/os/Parcel;I)I

    .line 410
    .line 411
    .line 412
    move-result v15

    .line 413
    goto :goto_6

    .line 414
    :pswitch_18
    invoke-static {v1, v2}, Lcg1;->r(Landroid/os/Parcel;I)I

    .line 415
    .line 416
    .line 417
    move-result v14

    .line 418
    goto :goto_6

    .line 419
    :pswitch_19
    invoke-static {v1, v2}, Lcg1;->r(Landroid/os/Parcel;I)I

    .line 420
    .line 421
    .line 422
    move-result v13

    .line 423
    goto :goto_6

    .line 424
    :cond_b
    invoke-static {v1, v0}, Lcg1;->l(Landroid/os/Parcel;I)V

    .line 425
    .line 426
    .line 427
    new-instance v12, Lna0;

    .line 428
    .line 429
    invoke-direct/range {v12 .. v26}, Lna0;-><init>(IIILjava/lang/String;Landroid/os/IBinder;[Lcom/google/android/gms/common/api/Scope;Landroid/os/Bundle;Landroid/accounts/Account;[Lu20;[Lu20;ZIZLjava/lang/String;)V

    .line 430
    .line 431
    .line 432
    return-object v12

    .line 433
    :pswitch_1a
    invoke-static {v1}, Lcg1;->B(Landroid/os/Parcel;)I

    .line 434
    .line 435
    .line 436
    move-result v0

    .line 437
    move v3, v10

    .line 438
    move v4, v3

    .line 439
    move v6, v4

    .line 440
    move-object v2, v11

    .line 441
    move-object v5, v2

    .line 442
    move-object v7, v5

    .line 443
    :goto_7
    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    .line 444
    .line 445
    .line 446
    move-result v8

    .line 447
    if-ge v8, v0, :cond_c

    .line 448
    .line 449
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 450
    .line 451
    .line 452
    move-result v8

    .line 453
    int-to-char v9, v8

    .line 454
    packed-switch v9, :pswitch_data_3

    .line 455
    .line 456
    .line 457
    invoke-static {v1, v8}, Lcg1;->y(Landroid/os/Parcel;I)V

    .line 458
    .line 459
    .line 460
    goto :goto_7

    .line 461
    :pswitch_1b
    invoke-static {v1, v8}, Lcg1;->f(Landroid/os/Parcel;I)[I

    .line 462
    .line 463
    .line 464
    move-result-object v7

    .line 465
    goto :goto_7

    .line 466
    :pswitch_1c
    invoke-static {v1, v8}, Lcg1;->r(Landroid/os/Parcel;I)I

    .line 467
    .line 468
    .line 469
    move-result v6

    .line 470
    goto :goto_7

    .line 471
    :pswitch_1d
    invoke-static {v1, v8}, Lcg1;->f(Landroid/os/Parcel;I)[I

    .line 472
    .line 473
    .line 474
    move-result-object v5

    .line 475
    goto :goto_7

    .line 476
    :pswitch_1e
    invoke-static {v1, v8}, Lcg1;->o(Landroid/os/Parcel;I)Z

    .line 477
    .line 478
    .line 479
    move-result v4

    .line 480
    goto :goto_7

    .line 481
    :pswitch_1f
    invoke-static {v1, v8}, Lcg1;->o(Landroid/os/Parcel;I)Z

    .line 482
    .line 483
    .line 484
    move-result v3

    .line 485
    goto :goto_7

    .line 486
    :pswitch_20
    sget-object v2, Lu11;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 487
    .line 488
    invoke-static {v1, v8, v2}, Lcg1;->g(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 489
    .line 490
    .line 491
    move-result-object v2

    .line 492
    check-cast v2, Lu11;

    .line 493
    .line 494
    goto :goto_7

    .line 495
    :cond_c
    invoke-static {v1, v0}, Lcg1;->l(Landroid/os/Parcel;I)V

    .line 496
    .line 497
    .line 498
    new-instance v1, Lto;

    .line 499
    .line 500
    invoke-direct/range {v1 .. v7}, Lto;-><init>(Lu11;ZZ[II[I)V

    .line 501
    .line 502
    .line 503
    return-object v1

    .line 504
    :pswitch_21
    invoke-static {v1}, Lcg1;->B(Landroid/os/Parcel;)I

    .line 505
    .line 506
    .line 507
    move-result v0

    .line 508
    move-object v2, v11

    .line 509
    move-object v3, v2

    .line 510
    :goto_8
    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    .line 511
    .line 512
    .line 513
    move-result v4

    .line 514
    if-ge v4, v0, :cond_11

    .line 515
    .line 516
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 517
    .line 518
    .line 519
    move-result v4

    .line 520
    int-to-char v5, v4

    .line 521
    if-eq v5, v8, :cond_10

    .line 522
    .line 523
    if-eq v5, v9, :cond_f

    .line 524
    .line 525
    if-eq v5, v7, :cond_e

    .line 526
    .line 527
    if-eq v5, v6, :cond_d

    .line 528
    .line 529
    invoke-static {v1, v4}, Lcg1;->y(Landroid/os/Parcel;I)V

    .line 530
    .line 531
    .line 532
    goto :goto_8

    .line 533
    :cond_d
    sget-object v3, Lto;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 534
    .line 535
    invoke-static {v1, v4, v3}, Lcg1;->g(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 536
    .line 537
    .line 538
    move-result-object v3

    .line 539
    check-cast v3, Lto;

    .line 540
    .line 541
    goto :goto_8

    .line 542
    :cond_e
    invoke-static {v1, v4}, Lcg1;->r(Landroid/os/Parcel;I)I

    .line 543
    .line 544
    .line 545
    move-result v10

    .line 546
    goto :goto_8

    .line 547
    :cond_f
    sget-object v2, Lu20;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 548
    .line 549
    invoke-static {v1, v4, v2}, Lcg1;->i(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)[Ljava/lang/Object;

    .line 550
    .line 551
    .line 552
    move-result-object v2

    .line 553
    check-cast v2, [Lu20;

    .line 554
    .line 555
    goto :goto_8

    .line 556
    :cond_10
    invoke-static {v1, v4}, Lcg1;->c(Landroid/os/Parcel;I)Landroid/os/Bundle;

    .line 557
    .line 558
    .line 559
    move-result-object v11

    .line 560
    goto :goto_8

    .line 561
    :cond_11
    invoke-static {v1, v0}, Lcg1;->l(Landroid/os/Parcel;I)V

    .line 562
    .line 563
    .line 564
    new-instance v0, Ld22;

    .line 565
    .line 566
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 567
    .line 568
    .line 569
    iput-object v11, v0, Ld22;->j:Landroid/os/Bundle;

    .line 570
    .line 571
    iput-object v2, v0, Ld22;->k:[Lu20;

    .line 572
    .line 573
    iput v10, v0, Ld22;->l:I

    .line 574
    .line 575
    iput-object v3, v0, Ld22;->m:Lto;

    .line 576
    .line 577
    return-object v0

    .line 578
    :pswitch_22
    invoke-static {v1}, Lcg1;->B(Landroid/os/Parcel;)I

    .line 579
    .line 580
    .line 581
    move-result v0

    .line 582
    move v2, v10

    .line 583
    :goto_9
    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    .line 584
    .line 585
    .line 586
    move-result v3

    .line 587
    if-ge v3, v0, :cond_14

    .line 588
    .line 589
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 590
    .line 591
    .line 592
    move-result v3

    .line 593
    int-to-char v4, v3

    .line 594
    if-eq v4, v8, :cond_13

    .line 595
    .line 596
    if-eq v4, v9, :cond_12

    .line 597
    .line 598
    invoke-static {v1, v3}, Lcg1;->y(Landroid/os/Parcel;I)V

    .line 599
    .line 600
    .line 601
    goto :goto_9

    .line 602
    :cond_12
    invoke-static {v1, v3}, Lcg1;->r(Landroid/os/Parcel;I)I

    .line 603
    .line 604
    .line 605
    move-result v2

    .line 606
    goto :goto_9

    .line 607
    :cond_13
    invoke-static {v1, v3}, Lcg1;->r(Landroid/os/Parcel;I)I

    .line 608
    .line 609
    .line 610
    move-result v10

    .line 611
    goto :goto_9

    .line 612
    :cond_14
    invoke-static {v1, v0}, Lcg1;->l(Landroid/os/Parcel;I)V

    .line 613
    .line 614
    .line 615
    new-instance v0, Ld32;

    .line 616
    .line 617
    invoke-direct {v0, v10, v2}, Ld32;-><init>(II)V

    .line 618
    .line 619
    .line 620
    return-object v0

    .line 621
    :pswitch_23
    invoke-static {v1}, Lcg1;->B(Landroid/os/Parcel;)I

    .line 622
    .line 623
    .line 624
    move-result v0

    .line 625
    :goto_a
    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    .line 626
    .line 627
    .line 628
    move-result v2

    .line 629
    if-ge v2, v0, :cond_16

    .line 630
    .line 631
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 632
    .line 633
    .line 634
    move-result v2

    .line 635
    int-to-char v3, v2

    .line 636
    if-eq v3, v9, :cond_15

    .line 637
    .line 638
    invoke-static {v1, v2}, Lcg1;->y(Landroid/os/Parcel;I)V

    .line 639
    .line 640
    .line 641
    goto :goto_a

    .line 642
    :cond_15
    sget-object v3, Ly22;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 643
    .line 644
    invoke-static {v1, v2, v3}, Lcg1;->j(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Ljava/util/ArrayList;

    .line 645
    .line 646
    .line 647
    move-result-object v11

    .line 648
    goto :goto_a

    .line 649
    :cond_16
    invoke-static {v1, v0}, Lcg1;->l(Landroid/os/Parcel;I)V

    .line 650
    .line 651
    .line 652
    new-instance v0, La32;

    .line 653
    .line 654
    invoke-direct {v0, v11}, La32;-><init>(Ljava/util/ArrayList;)V

    .line 655
    .line 656
    .line 657
    return-object v0

    .line 658
    :pswitch_24
    invoke-static {v1}, Lcg1;->B(Landroid/os/Parcel;)I

    .line 659
    .line 660
    .line 661
    move-result v0

    .line 662
    move-object v2, v11

    .line 663
    move-object v4, v2

    .line 664
    :goto_b
    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    .line 665
    .line 666
    .line 667
    move-result v5

    .line 668
    if-ge v5, v0, :cond_1b

    .line 669
    .line 670
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 671
    .line 672
    .line 673
    move-result v5

    .line 674
    int-to-char v8, v5

    .line 675
    if-eq v8, v9, :cond_1a

    .line 676
    .line 677
    if-eq v8, v7, :cond_19

    .line 678
    .line 679
    if-eq v8, v6, :cond_18

    .line 680
    .line 681
    if-eq v8, v3, :cond_17

    .line 682
    .line 683
    invoke-static {v1, v5}, Lcg1;->y(Landroid/os/Parcel;I)V

    .line 684
    .line 685
    .line 686
    goto :goto_b

    .line 687
    :cond_17
    invoke-static {v1, v5}, Lcg1;->o(Landroid/os/Parcel;I)Z

    .line 688
    .line 689
    .line 690
    move-result v10

    .line 691
    goto :goto_b

    .line 692
    :cond_18
    sget-object v4, Lw22;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 693
    .line 694
    invoke-static {v1, v5, v4}, Lcg1;->g(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 695
    .line 696
    .line 697
    move-result-object v4

    .line 698
    check-cast v4, Lw22;

    .line 699
    .line 700
    goto :goto_b

    .line 701
    :cond_19
    invoke-static {v1, v5}, Lcg1;->h(Landroid/os/Parcel;I)Ljava/lang/String;

    .line 702
    .line 703
    .line 704
    move-result-object v2

    .line 705
    goto :goto_b

    .line 706
    :cond_1a
    invoke-static {v1, v5}, Lcg1;->h(Landroid/os/Parcel;I)Ljava/lang/String;

    .line 707
    .line 708
    .line 709
    move-result-object v11

    .line 710
    goto :goto_b

    .line 711
    :cond_1b
    invoke-static {v1, v0}, Lcg1;->l(Landroid/os/Parcel;I)V

    .line 712
    .line 713
    .line 714
    new-instance v0, Ly22;

    .line 715
    .line 716
    invoke-direct {v0, v11, v2, v4, v10}, Ly22;-><init>(Ljava/lang/String;Ljava/lang/String;Lw22;Z)V

    .line 717
    .line 718
    .line 719
    return-object v0

    .line 720
    :pswitch_25
    invoke-static {v1}, Lcg1;->B(Landroid/os/Parcel;)I

    .line 721
    .line 722
    .line 723
    move-result v0

    .line 724
    const-wide/16 v6, 0x0

    .line 725
    .line 726
    move-wide v14, v4

    .line 727
    move-wide/from16 v17, v6

    .line 728
    .line 729
    move/from16 v16, v10

    .line 730
    .line 731
    move/from16 v21, v16

    .line 732
    .line 733
    move/from16 v22, v21

    .line 734
    .line 735
    move/from16 v23, v22

    .line 736
    .line 737
    move-object v13, v11

    .line 738
    move-object/from16 v19, v13

    .line 739
    .line 740
    move-object/from16 v20, v19

    .line 741
    .line 742
    :goto_c
    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    .line 743
    .line 744
    .line 745
    move-result v3

    .line 746
    if-ge v3, v0, :cond_1c

    .line 747
    .line 748
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 749
    .line 750
    .line 751
    move-result v3

    .line 752
    int-to-char v4, v3

    .line 753
    packed-switch v4, :pswitch_data_4

    .line 754
    .line 755
    .line 756
    invoke-static {v1, v3}, Lcg1;->y(Landroid/os/Parcel;I)V

    .line 757
    .line 758
    .line 759
    goto :goto_c

    .line 760
    :pswitch_26
    invoke-static {v1, v3}, Lcg1;->r(Landroid/os/Parcel;I)I

    .line 761
    .line 762
    .line 763
    move-result v3

    .line 764
    move/from16 v23, v3

    .line 765
    .line 766
    goto :goto_c

    .line 767
    :pswitch_27
    invoke-static {v1, v3}, Lcg1;->r(Landroid/os/Parcel;I)I

    .line 768
    .line 769
    .line 770
    move-result v3

    .line 771
    move/from16 v22, v3

    .line 772
    .line 773
    goto :goto_c

    .line 774
    :pswitch_28
    invoke-static {v1, v3}, Lcg1;->r(Landroid/os/Parcel;I)I

    .line 775
    .line 776
    .line 777
    move-result v3

    .line 778
    move/from16 v21, v3

    .line 779
    .line 780
    goto :goto_c

    .line 781
    :pswitch_29
    invoke-static {v1, v3}, Lcg1;->d(Landroid/os/Parcel;I)[B

    .line 782
    .line 783
    .line 784
    move-result-object v3

    .line 785
    move-object/from16 v20, v3

    .line 786
    .line 787
    goto :goto_c

    .line 788
    :pswitch_2a
    invoke-static {v1, v3}, Lcg1;->h(Landroid/os/Parcel;I)Ljava/lang/String;

    .line 789
    .line 790
    .line 791
    move-result-object v3

    .line 792
    move-object/from16 v19, v3

    .line 793
    .line 794
    goto :goto_c

    .line 795
    :pswitch_2b
    invoke-static {v1, v3, v2}, Lcg1;->E(Landroid/os/Parcel;II)V

    .line 796
    .line 797
    .line 798
    invoke-virtual {v1}, Landroid/os/Parcel;->readDouble()D

    .line 799
    .line 800
    .line 801
    move-result-wide v3

    .line 802
    move-wide/from16 v17, v3

    .line 803
    .line 804
    goto :goto_c

    .line 805
    :pswitch_2c
    invoke-static {v1, v3}, Lcg1;->o(Landroid/os/Parcel;I)Z

    .line 806
    .line 807
    .line 808
    move-result v3

    .line 809
    move/from16 v16, v3

    .line 810
    .line 811
    goto :goto_c

    .line 812
    :pswitch_2d
    invoke-static {v1, v3}, Lcg1;->s(Landroid/os/Parcel;I)J

    .line 813
    .line 814
    .line 815
    move-result-wide v3

    .line 816
    move-wide v14, v3

    .line 817
    goto :goto_c

    .line 818
    :pswitch_2e
    invoke-static {v1, v3}, Lcg1;->h(Landroid/os/Parcel;I)Ljava/lang/String;

    .line 819
    .line 820
    .line 821
    move-result-object v3

    .line 822
    move-object v13, v3

    .line 823
    goto :goto_c

    .line 824
    :cond_1c
    invoke-static {v1, v0}, Lcg1;->l(Landroid/os/Parcel;I)V

    .line 825
    .line 826
    .line 827
    new-instance v12, Lw22;

    .line 828
    .line 829
    invoke-direct/range {v12 .. v23}, Lw22;-><init>(Ljava/lang/String;JZDLjava/lang/String;[BIII)V

    .line 830
    .line 831
    .line 832
    return-object v12

    .line 833
    :pswitch_2f
    invoke-static {v1}, Lcg1;->B(Landroid/os/Parcel;)I

    .line 834
    .line 835
    .line 836
    move-result v0

    .line 837
    move-object v13, v11

    .line 838
    move-object v14, v13

    .line 839
    move-object v15, v14

    .line 840
    move-object/from16 v16, v15

    .line 841
    .line 842
    move-object/from16 v17, v16

    .line 843
    .line 844
    move-object/from16 v18, v17

    .line 845
    .line 846
    move-object/from16 v19, v18

    .line 847
    .line 848
    move-object/from16 v20, v19

    .line 849
    .line 850
    move-object/from16 v21, v20

    .line 851
    .line 852
    move-object/from16 v22, v21

    .line 853
    .line 854
    :goto_d
    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    .line 855
    .line 856
    .line 857
    move-result v2

    .line 858
    if-ge v2, v0, :cond_1d

    .line 859
    .line 860
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 861
    .line 862
    .line 863
    move-result v2

    .line 864
    int-to-char v3, v2

    .line 865
    packed-switch v3, :pswitch_data_5

    .line 866
    .line 867
    .line 868
    invoke-static {v1, v2}, Lcg1;->y(Landroid/os/Parcel;I)V

    .line 869
    .line 870
    .line 871
    goto :goto_d

    .line 872
    :pswitch_30
    invoke-static {v1, v2}, Lcg1;->e(Landroid/os/Parcel;I)[[B

    .line 873
    .line 874
    .line 875
    move-result-object v22

    .line 876
    goto :goto_d

    .line 877
    :pswitch_31
    invoke-static {v1, v2}, Lcg1;->f(Landroid/os/Parcel;I)[I

    .line 878
    .line 879
    .line 880
    move-result-object v21

    .line 881
    goto :goto_d

    .line 882
    :pswitch_32
    invoke-static {v1, v2}, Lcg1;->e(Landroid/os/Parcel;I)[[B

    .line 883
    .line 884
    .line 885
    move-result-object v20

    .line 886
    goto :goto_d

    .line 887
    :pswitch_33
    invoke-static {v1, v2}, Lcg1;->f(Landroid/os/Parcel;I)[I

    .line 888
    .line 889
    .line 890
    move-result-object v19

    .line 891
    goto :goto_d

    .line 892
    :pswitch_34
    invoke-static {v1, v2}, Lcg1;->e(Landroid/os/Parcel;I)[[B

    .line 893
    .line 894
    .line 895
    move-result-object v18

    .line 896
    goto :goto_d

    .line 897
    :pswitch_35
    invoke-static {v1, v2}, Lcg1;->e(Landroid/os/Parcel;I)[[B

    .line 898
    .line 899
    .line 900
    move-result-object v17

    .line 901
    goto :goto_d

    .line 902
    :pswitch_36
    invoke-static {v1, v2}, Lcg1;->e(Landroid/os/Parcel;I)[[B

    .line 903
    .line 904
    .line 905
    move-result-object v16

    .line 906
    goto :goto_d

    .line 907
    :pswitch_37
    invoke-static {v1, v2}, Lcg1;->e(Landroid/os/Parcel;I)[[B

    .line 908
    .line 909
    .line 910
    move-result-object v15

    .line 911
    goto :goto_d

    .line 912
    :pswitch_38
    invoke-static {v1, v2}, Lcg1;->d(Landroid/os/Parcel;I)[B

    .line 913
    .line 914
    .line 915
    move-result-object v14

    .line 916
    goto :goto_d

    .line 917
    :pswitch_39
    invoke-static {v1, v2}, Lcg1;->h(Landroid/os/Parcel;I)Ljava/lang/String;

    .line 918
    .line 919
    .line 920
    move-result-object v13

    .line 921
    goto :goto_d

    .line 922
    :cond_1d
    invoke-static {v1, v0}, Lcg1;->l(Landroid/os/Parcel;I)V

    .line 923
    .line 924
    .line 925
    new-instance v12, Lv22;

    .line 926
    .line 927
    invoke-direct/range {v12 .. v22}, Lv22;-><init>(Ljava/lang/String;[B[[B[[B[[B[[B[I[[B[I[[B)V

    .line 928
    .line 929
    .line 930
    return-object v12

    .line 931
    :pswitch_3a
    invoke-static {v1}, Lcg1;->B(Landroid/os/Parcel;)I

    .line 932
    .line 933
    .line 934
    move-result v0

    .line 935
    :goto_e
    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    .line 936
    .line 937
    .line 938
    move-result v2

    .line 939
    if-ge v2, v0, :cond_1f

    .line 940
    .line 941
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 942
    .line 943
    .line 944
    move-result v2

    .line 945
    int-to-char v3, v2

    .line 946
    if-eq v3, v9, :cond_1e

    .line 947
    .line 948
    invoke-static {v1, v2}, Lcg1;->y(Landroid/os/Parcel;I)V

    .line 949
    .line 950
    .line 951
    goto :goto_e

    .line 952
    :cond_1e
    invoke-static {v1, v2}, Lcg1;->d(Landroid/os/Parcel;I)[B

    .line 953
    .line 954
    .line 955
    move-result-object v11

    .line 956
    goto :goto_e

    .line 957
    :cond_1f
    invoke-static {v1, v0}, Lcg1;->l(Landroid/os/Parcel;I)V

    .line 958
    .line 959
    .line 960
    new-instance v0, Ls22;

    .line 961
    .line 962
    invoke-direct {v0, v11}, Ls22;-><init>([B)V

    .line 963
    .line 964
    .line 965
    return-object v0

    .line 966
    :pswitch_3b
    invoke-static {v1}, Lcg1;->B(Landroid/os/Parcel;)I

    .line 967
    .line 968
    .line 969
    move-result v0

    .line 970
    move-wide/from16 v18, v4

    .line 971
    .line 972
    move/from16 v16, v10

    .line 973
    .line 974
    move-object v13, v11

    .line 975
    move-object v14, v13

    .line 976
    move-object v15, v14

    .line 977
    move-object/from16 v17, v15

    .line 978
    .line 979
    :goto_f
    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    .line 980
    .line 981
    .line 982
    move-result v2

    .line 983
    if-ge v2, v0, :cond_20

    .line 984
    .line 985
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 986
    .line 987
    .line 988
    move-result v2

    .line 989
    int-to-char v3, v2

    .line 990
    packed-switch v3, :pswitch_data_6

    .line 991
    .line 992
    .line 993
    invoke-static {v1, v2}, Lcg1;->y(Landroid/os/Parcel;I)V

    .line 994
    .line 995
    .line 996
    goto :goto_f

    .line 997
    :pswitch_3c
    invoke-static {v1, v2}, Lcg1;->s(Landroid/os/Parcel;I)J

    .line 998
    .line 999
    .line 1000
    move-result-wide v2

    .line 1001
    move-wide/from16 v18, v2

    .line 1002
    .line 1003
    goto :goto_f

    .line 1004
    :pswitch_3d
    invoke-static {v1, v2}, Lcg1;->d(Landroid/os/Parcel;I)[B

    .line 1005
    .line 1006
    .line 1007
    move-result-object v2

    .line 1008
    move-object/from16 v17, v2

    .line 1009
    .line 1010
    goto :goto_f

    .line 1011
    :pswitch_3e
    invoke-static {v1, v2}, Lcg1;->o(Landroid/os/Parcel;I)Z

    .line 1012
    .line 1013
    .line 1014
    move-result v2

    .line 1015
    move/from16 v16, v2

    .line 1016
    .line 1017
    goto :goto_f

    .line 1018
    :pswitch_3f
    sget-object v3, Ln22;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 1019
    .line 1020
    invoke-static {v1, v2, v3}, Lcg1;->i(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)[Ljava/lang/Object;

    .line 1021
    .line 1022
    .line 1023
    move-result-object v2

    .line 1024
    check-cast v2, [Ln22;

    .line 1025
    .line 1026
    move-object v15, v2

    .line 1027
    goto :goto_f

    .line 1028
    :pswitch_40
    invoke-static {v1, v2}, Lcg1;->h(Landroid/os/Parcel;I)Ljava/lang/String;

    .line 1029
    .line 1030
    .line 1031
    move-result-object v2

    .line 1032
    move-object v14, v2

    .line 1033
    goto :goto_f

    .line 1034
    :pswitch_41
    invoke-static {v1, v2}, Lcg1;->h(Landroid/os/Parcel;I)Ljava/lang/String;

    .line 1035
    .line 1036
    .line 1037
    move-result-object v2

    .line 1038
    move-object v13, v2

    .line 1039
    goto :goto_f

    .line 1040
    :cond_20
    invoke-static {v1, v0}, Lcg1;->l(Landroid/os/Parcel;I)V

    .line 1041
    .line 1042
    .line 1043
    new-instance v12, Lp22;

    .line 1044
    .line 1045
    invoke-direct/range {v12 .. v19}, Lp22;-><init>(Ljava/lang/String;Ljava/lang/String;[Ln22;Z[BJ)V

    .line 1046
    .line 1047
    .line 1048
    return-object v12

    .line 1049
    :pswitch_42
    invoke-static {v1}, Lcg1;->B(Landroid/os/Parcel;)I

    .line 1050
    .line 1051
    .line 1052
    move-result v0

    .line 1053
    move-object v2, v11

    .line 1054
    move-object v3, v2

    .line 1055
    :goto_10
    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    .line 1056
    .line 1057
    .line 1058
    move-result v4

    .line 1059
    if-ge v4, v0, :cond_25

    .line 1060
    .line 1061
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 1062
    .line 1063
    .line 1064
    move-result v4

    .line 1065
    int-to-char v5, v4

    .line 1066
    if-eq v5, v9, :cond_24

    .line 1067
    .line 1068
    if-eq v5, v7, :cond_23

    .line 1069
    .line 1070
    if-eq v5, v6, :cond_21

    .line 1071
    .line 1072
    invoke-static {v1, v4}, Lcg1;->y(Landroid/os/Parcel;I)V

    .line 1073
    .line 1074
    .line 1075
    goto :goto_10

    .line 1076
    :cond_21
    invoke-static {v1, v4}, Lcg1;->t(Landroid/os/Parcel;I)I

    .line 1077
    .line 1078
    .line 1079
    move-result v3

    .line 1080
    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    .line 1081
    .line 1082
    .line 1083
    move-result v4

    .line 1084
    if-nez v3, :cond_22

    .line 1085
    .line 1086
    move-object v3, v11

    .line 1087
    goto :goto_10

    .line 1088
    :cond_22
    invoke-virtual {v1}, Landroid/os/Parcel;->createStringArray()[Ljava/lang/String;

    .line 1089
    .line 1090
    .line 1091
    move-result-object v5

    .line 1092
    add-int/2addr v4, v3

    .line 1093
    invoke-virtual {v1, v4}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 1094
    .line 1095
    .line 1096
    move-object v3, v5

    .line 1097
    goto :goto_10

    .line 1098
    :cond_23
    sget-object v2, Lw22;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 1099
    .line 1100
    invoke-static {v1, v4, v2}, Lcg1;->i(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)[Ljava/lang/Object;

    .line 1101
    .line 1102
    .line 1103
    move-result-object v2

    .line 1104
    check-cast v2, [Lw22;

    .line 1105
    .line 1106
    goto :goto_10

    .line 1107
    :cond_24
    invoke-static {v1, v4}, Lcg1;->r(Landroid/os/Parcel;I)I

    .line 1108
    .line 1109
    .line 1110
    move-result v10

    .line 1111
    goto :goto_10

    .line 1112
    :cond_25
    invoke-static {v1, v0}, Lcg1;->l(Landroid/os/Parcel;I)V

    .line 1113
    .line 1114
    .line 1115
    new-instance v0, Ln22;

    .line 1116
    .line 1117
    invoke-direct {v0, v10, v2, v3}, Ln22;-><init>(I[Lw22;[Ljava/lang/String;)V

    .line 1118
    .line 1119
    .line 1120
    return-object v0

    .line 1121
    :pswitch_43
    invoke-static {v1}, Lcg1;->B(Landroid/os/Parcel;)I

    .line 1122
    .line 1123
    .line 1124
    move-result v0

    .line 1125
    move-object v2, v11

    .line 1126
    move-object v3, v2

    .line 1127
    :goto_11
    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    .line 1128
    .line 1129
    .line 1130
    move-result v4

    .line 1131
    if-ge v4, v0, :cond_2a

    .line 1132
    .line 1133
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 1134
    .line 1135
    .line 1136
    move-result v4

    .line 1137
    int-to-char v5, v4

    .line 1138
    if-eq v5, v8, :cond_29

    .line 1139
    .line 1140
    if-eq v5, v9, :cond_28

    .line 1141
    .line 1142
    if-eq v5, v7, :cond_27

    .line 1143
    .line 1144
    if-eq v5, v6, :cond_26

    .line 1145
    .line 1146
    invoke-static {v1, v4}, Lcg1;->y(Landroid/os/Parcel;I)V

    .line 1147
    .line 1148
    .line 1149
    goto :goto_11

    .line 1150
    :cond_26
    sget-object v3, Loo;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 1151
    .line 1152
    invoke-static {v1, v4, v3}, Lcg1;->g(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 1153
    .line 1154
    .line 1155
    move-result-object v3

    .line 1156
    check-cast v3, Loo;

    .line 1157
    .line 1158
    goto :goto_11

    .line 1159
    :cond_27
    sget-object v2, Landroid/app/PendingIntent;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 1160
    .line 1161
    invoke-static {v1, v4, v2}, Lcg1;->g(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 1162
    .line 1163
    .line 1164
    move-result-object v2

    .line 1165
    check-cast v2, Landroid/app/PendingIntent;

    .line 1166
    .line 1167
    goto :goto_11

    .line 1168
    :cond_28
    invoke-static {v1, v4}, Lcg1;->h(Landroid/os/Parcel;I)Ljava/lang/String;

    .line 1169
    .line 1170
    .line 1171
    move-result-object v11

    .line 1172
    goto :goto_11

    .line 1173
    :cond_29
    invoke-static {v1, v4}, Lcg1;->r(Landroid/os/Parcel;I)I

    .line 1174
    .line 1175
    .line 1176
    move-result v10

    .line 1177
    goto :goto_11

    .line 1178
    :cond_2a
    invoke-static {v1, v0}, Lcg1;->l(Landroid/os/Parcel;I)V

    .line 1179
    .line 1180
    .line 1181
    new-instance v0, Lcom/google/android/gms/common/api/Status;

    .line 1182
    .line 1183
    invoke-direct {v0, v10, v11, v2, v3}, Lcom/google/android/gms/common/api/Status;-><init>(ILjava/lang/String;Landroid/app/PendingIntent;Loo;)V

    .line 1184
    .line 1185
    .line 1186
    return-object v0

    .line 1187
    :pswitch_44
    invoke-static {v1}, Lcg1;->B(Landroid/os/Parcel;)I

    .line 1188
    .line 1189
    .line 1190
    move-result v0

    .line 1191
    move-object v2, v11

    .line 1192
    :goto_12
    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    .line 1193
    .line 1194
    .line 1195
    move-result v3

    .line 1196
    if-ge v3, v0, :cond_2e

    .line 1197
    .line 1198
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 1199
    .line 1200
    .line 1201
    move-result v3

    .line 1202
    int-to-char v4, v3

    .line 1203
    if-eq v4, v8, :cond_2d

    .line 1204
    .line 1205
    if-eq v4, v9, :cond_2c

    .line 1206
    .line 1207
    if-eq v4, v7, :cond_2b

    .line 1208
    .line 1209
    invoke-static {v1, v3}, Lcg1;->y(Landroid/os/Parcel;I)V

    .line 1210
    .line 1211
    .line 1212
    goto :goto_12

    .line 1213
    :cond_2b
    sget-object v2, Landroid/content/Intent;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 1214
    .line 1215
    invoke-static {v1, v3, v2}, Lcg1;->g(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 1216
    .line 1217
    .line 1218
    move-result-object v2

    .line 1219
    check-cast v2, Landroid/content/Intent;

    .line 1220
    .line 1221
    goto :goto_12

    .line 1222
    :cond_2c
    invoke-static {v1, v3}, Lcg1;->h(Landroid/os/Parcel;I)Ljava/lang/String;

    .line 1223
    .line 1224
    .line 1225
    move-result-object v11

    .line 1226
    goto :goto_12

    .line 1227
    :cond_2d
    invoke-static {v1, v3}, Lcg1;->r(Landroid/os/Parcel;I)I

    .line 1228
    .line 1229
    .line 1230
    move-result v10

    .line 1231
    goto :goto_12

    .line 1232
    :cond_2e
    invoke-static {v1, v0}, Lcg1;->l(Landroid/os/Parcel;I)V

    .line 1233
    .line 1234
    .line 1235
    new-instance v0, Lmw1;

    .line 1236
    .line 1237
    invoke-direct {v0, v10, v11, v2}, Lmw1;-><init>(ILjava/lang/String;Landroid/content/Intent;)V

    .line 1238
    .line 1239
    .line 1240
    return-object v0

    .line 1241
    :pswitch_45
    invoke-static {v1}, Lcg1;->B(Landroid/os/Parcel;)I

    .line 1242
    .line 1243
    .line 1244
    move-result v0

    .line 1245
    move-wide v13, v4

    .line 1246
    move-wide v15, v13

    .line 1247
    move/from16 v17, v10

    .line 1248
    .line 1249
    move-object/from16 v18, v11

    .line 1250
    .line 1251
    move-object/from16 v19, v18

    .line 1252
    .line 1253
    :goto_13
    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    .line 1254
    .line 1255
    .line 1256
    move-result v3

    .line 1257
    if-ge v3, v0, :cond_34

    .line 1258
    .line 1259
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 1260
    .line 1261
    .line 1262
    move-result v3

    .line 1263
    int-to-char v4, v3

    .line 1264
    if-eq v4, v8, :cond_33

    .line 1265
    .line 1266
    if-eq v4, v9, :cond_32

    .line 1267
    .line 1268
    if-eq v4, v7, :cond_31

    .line 1269
    .line 1270
    const/4 v5, 0x7

    .line 1271
    if-eq v4, v5, :cond_30

    .line 1272
    .line 1273
    if-eq v4, v2, :cond_2f

    .line 1274
    .line 1275
    invoke-static {v1, v3}, Lcg1;->y(Landroid/os/Parcel;I)V

    .line 1276
    .line 1277
    .line 1278
    goto :goto_13

    .line 1279
    :cond_2f
    invoke-static {v1, v3}, Lcg1;->h(Landroid/os/Parcel;I)Ljava/lang/String;

    .line 1280
    .line 1281
    .line 1282
    move-result-object v3

    .line 1283
    move-object/from16 v19, v3

    .line 1284
    .line 1285
    goto :goto_13

    .line 1286
    :cond_30
    invoke-static {v1, v3}, Lcg1;->c(Landroid/os/Parcel;I)Landroid/os/Bundle;

    .line 1287
    .line 1288
    .line 1289
    move-result-object v3

    .line 1290
    move-object/from16 v18, v3

    .line 1291
    .line 1292
    goto :goto_13

    .line 1293
    :cond_31
    invoke-static {v1, v3}, Lcg1;->o(Landroid/os/Parcel;I)Z

    .line 1294
    .line 1295
    .line 1296
    move-result v3

    .line 1297
    move/from16 v17, v3

    .line 1298
    .line 1299
    goto :goto_13

    .line 1300
    :cond_32
    invoke-static {v1, v3}, Lcg1;->s(Landroid/os/Parcel;I)J

    .line 1301
    .line 1302
    .line 1303
    move-result-wide v3

    .line 1304
    move-wide v15, v3

    .line 1305
    goto :goto_13

    .line 1306
    :cond_33
    invoke-static {v1, v3}, Lcg1;->s(Landroid/os/Parcel;I)J

    .line 1307
    .line 1308
    .line 1309
    move-result-wide v3

    .line 1310
    move-wide v13, v3

    .line 1311
    goto :goto_13

    .line 1312
    :cond_34
    invoke-static {v1, v0}, Lcg1;->l(Landroid/os/Parcel;I)V

    .line 1313
    .line 1314
    .line 1315
    new-instance v12, Llw1;

    .line 1316
    .line 1317
    invoke-direct/range {v12 .. v19}, Llw1;-><init>(JJZLandroid/os/Bundle;Ljava/lang/String;)V

    .line 1318
    .line 1319
    .line 1320
    return-object v12

    .line 1321
    :pswitch_46
    invoke-static {v1}, Lcg1;->B(Landroid/os/Parcel;)I

    .line 1322
    .line 1323
    .line 1324
    move-result v0

    .line 1325
    :goto_14
    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    .line 1326
    .line 1327
    .line 1328
    move-result v2

    .line 1329
    if-ge v2, v0, :cond_37

    .line 1330
    .line 1331
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 1332
    .line 1333
    .line 1334
    move-result v2

    .line 1335
    int-to-char v3, v2

    .line 1336
    if-eq v3, v8, :cond_36

    .line 1337
    .line 1338
    if-eq v3, v9, :cond_35

    .line 1339
    .line 1340
    invoke-static {v1, v2}, Lcg1;->y(Landroid/os/Parcel;I)V

    .line 1341
    .line 1342
    .line 1343
    goto :goto_14

    .line 1344
    :cond_35
    invoke-static {v1, v2}, Lcg1;->h(Landroid/os/Parcel;I)Ljava/lang/String;

    .line 1345
    .line 1346
    .line 1347
    move-result-object v11

    .line 1348
    goto :goto_14

    .line 1349
    :cond_36
    invoke-static {v1, v2}, Lcg1;->r(Landroid/os/Parcel;I)I

    .line 1350
    .line 1351
    .line 1352
    move-result v10

    .line 1353
    goto :goto_14

    .line 1354
    :cond_37
    invoke-static {v1, v0}, Lcg1;->l(Landroid/os/Parcel;I)V

    .line 1355
    .line 1356
    .line 1357
    new-instance v0, Lcom/google/android/gms/common/api/Scope;

    .line 1358
    .line 1359
    invoke-direct {v0, v10, v11}, Lcom/google/android/gms/common/api/Scope;-><init>(ILjava/lang/String;)V

    .line 1360
    .line 1361
    .line 1362
    return-object v0

    .line 1363
    :pswitch_47
    invoke-static {v1}, Lcg1;->B(Landroid/os/Parcel;)I

    .line 1364
    .line 1365
    .line 1366
    move-result v0

    .line 1367
    move-wide/from16 v16, v4

    .line 1368
    .line 1369
    move-wide/from16 v18, v16

    .line 1370
    .line 1371
    move-object v13, v11

    .line 1372
    move-object v14, v13

    .line 1373
    move-object v15, v14

    .line 1374
    :goto_15
    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    .line 1375
    .line 1376
    .line 1377
    move-result v2

    .line 1378
    if-ge v2, v0, :cond_3d

    .line 1379
    .line 1380
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 1381
    .line 1382
    .line 1383
    move-result v2

    .line 1384
    int-to-char v4, v2

    .line 1385
    if-eq v4, v9, :cond_3c

    .line 1386
    .line 1387
    if-eq v4, v7, :cond_3b

    .line 1388
    .line 1389
    if-eq v4, v6, :cond_3a

    .line 1390
    .line 1391
    if-eq v4, v3, :cond_39

    .line 1392
    .line 1393
    const/4 v5, 0x6

    .line 1394
    if-eq v4, v5, :cond_38

    .line 1395
    .line 1396
    invoke-static {v1, v2}, Lcg1;->y(Landroid/os/Parcel;I)V

    .line 1397
    .line 1398
    .line 1399
    goto :goto_15

    .line 1400
    :cond_38
    invoke-static {v1, v2}, Lcg1;->s(Landroid/os/Parcel;I)J

    .line 1401
    .line 1402
    .line 1403
    move-result-wide v4

    .line 1404
    move-wide/from16 v18, v4

    .line 1405
    .line 1406
    goto :goto_15

    .line 1407
    :cond_39
    invoke-static {v1, v2}, Lcg1;->s(Landroid/os/Parcel;I)J

    .line 1408
    .line 1409
    .line 1410
    move-result-wide v4

    .line 1411
    move-wide/from16 v16, v4

    .line 1412
    .line 1413
    goto :goto_15

    .line 1414
    :cond_3a
    invoke-static {v1, v2}, Lcg1;->h(Landroid/os/Parcel;I)Ljava/lang/String;

    .line 1415
    .line 1416
    .line 1417
    move-result-object v2

    .line 1418
    move-object v15, v2

    .line 1419
    goto :goto_15

    .line 1420
    :cond_3b
    sget-object v4, Lsu1;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 1421
    .line 1422
    invoke-static {v1, v2, v4}, Lcg1;->g(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 1423
    .line 1424
    .line 1425
    move-result-object v2

    .line 1426
    check-cast v2, Lsu1;

    .line 1427
    .line 1428
    move-object v14, v2

    .line 1429
    goto :goto_15

    .line 1430
    :cond_3c
    invoke-static {v1, v2}, Lcg1;->h(Landroid/os/Parcel;I)Ljava/lang/String;

    .line 1431
    .line 1432
    .line 1433
    move-result-object v2

    .line 1434
    move-object v13, v2

    .line 1435
    goto :goto_15

    .line 1436
    :cond_3d
    invoke-static {v1, v0}, Lcg1;->l(Landroid/os/Parcel;I)V

    .line 1437
    .line 1438
    .line 1439
    new-instance v12, Ltu1;

    .line 1440
    .line 1441
    invoke-direct/range {v12 .. v19}, Ltu1;-><init>(Ljava/lang/String;Lsu1;Ljava/lang/String;JJ)V

    .line 1442
    .line 1443
    .line 1444
    return-object v12

    .line 1445
    :pswitch_48
    invoke-static {v1}, Lcg1;->B(Landroid/os/Parcel;)I

    .line 1446
    .line 1447
    .line 1448
    move-result v0

    .line 1449
    :goto_16
    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    .line 1450
    .line 1451
    .line 1452
    move-result v2

    .line 1453
    if-ge v2, v0, :cond_3f

    .line 1454
    .line 1455
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 1456
    .line 1457
    .line 1458
    move-result v2

    .line 1459
    int-to-char v3, v2

    .line 1460
    if-eq v3, v9, :cond_3e

    .line 1461
    .line 1462
    invoke-static {v1, v2}, Lcg1;->y(Landroid/os/Parcel;I)V

    .line 1463
    .line 1464
    .line 1465
    goto :goto_16

    .line 1466
    :cond_3e
    invoke-static {v1, v2}, Lcg1;->c(Landroid/os/Parcel;I)Landroid/os/Bundle;

    .line 1467
    .line 1468
    .line 1469
    move-result-object v11

    .line 1470
    goto :goto_16

    .line 1471
    :cond_3f
    invoke-static {v1, v0}, Lcg1;->l(Landroid/os/Parcel;I)V

    .line 1472
    .line 1473
    .line 1474
    new-instance v0, Lsu1;

    .line 1475
    .line 1476
    invoke-direct {v0, v11}, Lsu1;-><init>(Landroid/os/Bundle;)V

    .line 1477
    .line 1478
    .line 1479
    return-object v0

    .line 1480
    :pswitch_49
    invoke-static {v1}, Lcg1;->B(Landroid/os/Parcel;)I

    .line 1481
    .line 1482
    .line 1483
    move-result v0

    .line 1484
    const-wide/16 v2, -0x1

    .line 1485
    .line 1486
    move-wide v15, v2

    .line 1487
    move v14, v10

    .line 1488
    move/from16 v17, v14

    .line 1489
    .line 1490
    move-object v13, v11

    .line 1491
    :goto_17
    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    .line 1492
    .line 1493
    .line 1494
    move-result v2

    .line 1495
    if-ge v2, v0, :cond_44

    .line 1496
    .line 1497
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 1498
    .line 1499
    .line 1500
    move-result v2

    .line 1501
    int-to-char v3, v2

    .line 1502
    if-eq v3, v8, :cond_43

    .line 1503
    .line 1504
    if-eq v3, v9, :cond_42

    .line 1505
    .line 1506
    if-eq v3, v7, :cond_41

    .line 1507
    .line 1508
    if-eq v3, v6, :cond_40

    .line 1509
    .line 1510
    invoke-static {v1, v2}, Lcg1;->y(Landroid/os/Parcel;I)V

    .line 1511
    .line 1512
    .line 1513
    goto :goto_17

    .line 1514
    :cond_40
    invoke-static {v1, v2}, Lcg1;->o(Landroid/os/Parcel;I)Z

    .line 1515
    .line 1516
    .line 1517
    move-result v2

    .line 1518
    move/from16 v17, v2

    .line 1519
    .line 1520
    goto :goto_17

    .line 1521
    :cond_41
    invoke-static {v1, v2}, Lcg1;->s(Landroid/os/Parcel;I)J

    .line 1522
    .line 1523
    .line 1524
    move-result-wide v2

    .line 1525
    move-wide v15, v2

    .line 1526
    goto :goto_17

    .line 1527
    :cond_42
    invoke-static {v1, v2}, Lcg1;->r(Landroid/os/Parcel;I)I

    .line 1528
    .line 1529
    .line 1530
    move-result v2

    .line 1531
    move v14, v2

    .line 1532
    goto :goto_17

    .line 1533
    :cond_43
    invoke-static {v1, v2}, Lcg1;->h(Landroid/os/Parcel;I)Ljava/lang/String;

    .line 1534
    .line 1535
    .line 1536
    move-result-object v2

    .line 1537
    move-object v13, v2

    .line 1538
    goto :goto_17

    .line 1539
    :cond_44
    invoke-static {v1, v0}, Lcg1;->l(Landroid/os/Parcel;I)V

    .line 1540
    .line 1541
    .line 1542
    new-instance v12, Lu20;

    .line 1543
    .line 1544
    invoke-direct/range {v12 .. v17}, Lu20;-><init>(Ljava/lang/String;IJZ)V

    .line 1545
    .line 1546
    .line 1547
    return-object v12

    .line 1548
    :pswitch_4a
    invoke-static {v1}, Lcg1;->B(Landroid/os/Parcel;)I

    .line 1549
    .line 1550
    .line 1551
    move-result v0

    .line 1552
    :goto_18
    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    .line 1553
    .line 1554
    .line 1555
    move-result v2

    .line 1556
    if-ge v2, v0, :cond_46

    .line 1557
    .line 1558
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 1559
    .line 1560
    .line 1561
    move-result v2

    .line 1562
    int-to-char v3, v2

    .line 1563
    if-eq v3, v8, :cond_45

    .line 1564
    .line 1565
    invoke-static {v1, v2}, Lcg1;->y(Landroid/os/Parcel;I)V

    .line 1566
    .line 1567
    .line 1568
    goto :goto_18

    .line 1569
    :cond_45
    invoke-static {v1, v2}, Lcg1;->c(Landroid/os/Parcel;I)Landroid/os/Bundle;

    .line 1570
    .line 1571
    .line 1572
    move-result-object v11

    .line 1573
    goto :goto_18

    .line 1574
    :cond_46
    invoke-static {v1, v0}, Lcg1;->l(Landroid/os/Parcel;I)V

    .line 1575
    .line 1576
    .line 1577
    new-instance v0, Lrt1;

    .line 1578
    .line 1579
    invoke-direct {v0, v11}, Lrt1;-><init>(Landroid/os/Bundle;)V

    .line 1580
    .line 1581
    .line 1582
    return-object v0

    .line 1583
    :pswitch_4b
    invoke-static {v1}, Lcg1;->B(Landroid/os/Parcel;)I

    .line 1584
    .line 1585
    .line 1586
    move-result v0

    .line 1587
    move-wide/from16 v16, v4

    .line 1588
    .line 1589
    move-wide/from16 v21, v16

    .line 1590
    .line 1591
    move-wide/from16 v24, v21

    .line 1592
    .line 1593
    move/from16 v18, v10

    .line 1594
    .line 1595
    move-object v13, v11

    .line 1596
    move-object v14, v13

    .line 1597
    move-object v15, v14

    .line 1598
    move-object/from16 v19, v15

    .line 1599
    .line 1600
    move-object/from16 v20, v19

    .line 1601
    .line 1602
    move-object/from16 v23, v20

    .line 1603
    .line 1604
    move-object/from16 v26, v23

    .line 1605
    .line 1606
    :goto_19
    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    .line 1607
    .line 1608
    .line 1609
    move-result v2

    .line 1610
    if-ge v2, v0, :cond_47

    .line 1611
    .line 1612
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 1613
    .line 1614
    .line 1615
    move-result v2

    .line 1616
    int-to-char v3, v2

    .line 1617
    packed-switch v3, :pswitch_data_7

    .line 1618
    .line 1619
    .line 1620
    invoke-static {v1, v2}, Lcg1;->y(Landroid/os/Parcel;I)V

    .line 1621
    .line 1622
    .line 1623
    goto :goto_19

    .line 1624
    :pswitch_4c
    sget-object v3, Ltu1;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 1625
    .line 1626
    invoke-static {v1, v2, v3}, Lcg1;->g(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 1627
    .line 1628
    .line 1629
    move-result-object v2

    .line 1630
    check-cast v2, Ltu1;

    .line 1631
    .line 1632
    move-object/from16 v26, v2

    .line 1633
    .line 1634
    goto :goto_19

    .line 1635
    :pswitch_4d
    invoke-static {v1, v2}, Lcg1;->s(Landroid/os/Parcel;I)J

    .line 1636
    .line 1637
    .line 1638
    move-result-wide v2

    .line 1639
    move-wide/from16 v24, v2

    .line 1640
    .line 1641
    goto :goto_19

    .line 1642
    :pswitch_4e
    sget-object v3, Ltu1;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 1643
    .line 1644
    invoke-static {v1, v2, v3}, Lcg1;->g(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 1645
    .line 1646
    .line 1647
    move-result-object v2

    .line 1648
    check-cast v2, Ltu1;

    .line 1649
    .line 1650
    move-object/from16 v23, v2

    .line 1651
    .line 1652
    goto :goto_19

    .line 1653
    :pswitch_4f
    invoke-static {v1, v2}, Lcg1;->s(Landroid/os/Parcel;I)J

    .line 1654
    .line 1655
    .line 1656
    move-result-wide v2

    .line 1657
    move-wide/from16 v21, v2

    .line 1658
    .line 1659
    goto :goto_19

    .line 1660
    :pswitch_50
    sget-object v3, Ltu1;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 1661
    .line 1662
    invoke-static {v1, v2, v3}, Lcg1;->g(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 1663
    .line 1664
    .line 1665
    move-result-object v2

    .line 1666
    check-cast v2, Ltu1;

    .line 1667
    .line 1668
    move-object/from16 v20, v2

    .line 1669
    .line 1670
    goto :goto_19

    .line 1671
    :pswitch_51
    invoke-static {v1, v2}, Lcg1;->h(Landroid/os/Parcel;I)Ljava/lang/String;

    .line 1672
    .line 1673
    .line 1674
    move-result-object v2

    .line 1675
    move-object/from16 v19, v2

    .line 1676
    .line 1677
    goto :goto_19

    .line 1678
    :pswitch_52
    invoke-static {v1, v2}, Lcg1;->o(Landroid/os/Parcel;I)Z

    .line 1679
    .line 1680
    .line 1681
    move-result v2

    .line 1682
    move/from16 v18, v2

    .line 1683
    .line 1684
    goto :goto_19

    .line 1685
    :pswitch_53
    invoke-static {v1, v2}, Lcg1;->s(Landroid/os/Parcel;I)J

    .line 1686
    .line 1687
    .line 1688
    move-result-wide v2

    .line 1689
    move-wide/from16 v16, v2

    .line 1690
    .line 1691
    goto :goto_19

    .line 1692
    :pswitch_54
    sget-object v3, Lwa2;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 1693
    .line 1694
    invoke-static {v1, v2, v3}, Lcg1;->g(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 1695
    .line 1696
    .line 1697
    move-result-object v2

    .line 1698
    check-cast v2, Lwa2;

    .line 1699
    .line 1700
    move-object v15, v2

    .line 1701
    goto :goto_19

    .line 1702
    :pswitch_55
    invoke-static {v1, v2}, Lcg1;->h(Landroid/os/Parcel;I)Ljava/lang/String;

    .line 1703
    .line 1704
    .line 1705
    move-result-object v2

    .line 1706
    move-object v14, v2

    .line 1707
    goto :goto_19

    .line 1708
    :pswitch_56
    invoke-static {v1, v2}, Lcg1;->h(Landroid/os/Parcel;I)Ljava/lang/String;

    .line 1709
    .line 1710
    .line 1711
    move-result-object v2

    .line 1712
    move-object v13, v2

    .line 1713
    goto :goto_19

    .line 1714
    :cond_47
    invoke-static {v1, v0}, Lcg1;->l(Landroid/os/Parcel;I)V

    .line 1715
    .line 1716
    .line 1717
    new-instance v12, Lsr1;

    .line 1718
    .line 1719
    invoke-direct/range {v12 .. v26}, Lsr1;-><init>(Ljava/lang/String;Ljava/lang/String;Lwa2;JZLjava/lang/String;Ltu1;JLtu1;JLtu1;)V

    .line 1720
    .line 1721
    .line 1722
    return-object v12

    .line 1723
    :pswitch_57
    invoke-static {v1}, Lcg1;->B(Landroid/os/Parcel;)I

    .line 1724
    .line 1725
    .line 1726
    move-result v0

    .line 1727
    move v12, v10

    .line 1728
    move v13, v12

    .line 1729
    move v14, v13

    .line 1730
    move v15, v14

    .line 1731
    move/from16 v16, v15

    .line 1732
    .line 1733
    :goto_1a
    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    .line 1734
    .line 1735
    .line 1736
    move-result v2

    .line 1737
    if-ge v2, v0, :cond_4d

    .line 1738
    .line 1739
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 1740
    .line 1741
    .line 1742
    move-result v2

    .line 1743
    int-to-char v4, v2

    .line 1744
    if-eq v4, v8, :cond_4c

    .line 1745
    .line 1746
    if-eq v4, v9, :cond_4b

    .line 1747
    .line 1748
    if-eq v4, v7, :cond_4a

    .line 1749
    .line 1750
    if-eq v4, v6, :cond_49

    .line 1751
    .line 1752
    if-eq v4, v3, :cond_48

    .line 1753
    .line 1754
    invoke-static {v1, v2}, Lcg1;->y(Landroid/os/Parcel;I)V

    .line 1755
    .line 1756
    .line 1757
    goto :goto_1a

    .line 1758
    :cond_48
    invoke-static {v1, v2}, Lcg1;->r(Landroid/os/Parcel;I)I

    .line 1759
    .line 1760
    .line 1761
    move-result v16

    .line 1762
    goto :goto_1a

    .line 1763
    :cond_49
    invoke-static {v1, v2}, Lcg1;->r(Landroid/os/Parcel;I)I

    .line 1764
    .line 1765
    .line 1766
    move-result v15

    .line 1767
    goto :goto_1a

    .line 1768
    :cond_4a
    invoke-static {v1, v2}, Lcg1;->o(Landroid/os/Parcel;I)Z

    .line 1769
    .line 1770
    .line 1771
    move-result v14

    .line 1772
    goto :goto_1a

    .line 1773
    :cond_4b
    invoke-static {v1, v2}, Lcg1;->o(Landroid/os/Parcel;I)Z

    .line 1774
    .line 1775
    .line 1776
    move-result v13

    .line 1777
    goto :goto_1a

    .line 1778
    :cond_4c
    invoke-static {v1, v2}, Lcg1;->r(Landroid/os/Parcel;I)I

    .line 1779
    .line 1780
    .line 1781
    move-result v12

    .line 1782
    goto :goto_1a

    .line 1783
    :cond_4d
    invoke-static {v1, v0}, Lcg1;->l(Landroid/os/Parcel;I)V

    .line 1784
    .line 1785
    .line 1786
    new-instance v11, Lu11;

    .line 1787
    .line 1788
    invoke-direct/range {v11 .. v16}, Lu11;-><init>(IZZII)V

    .line 1789
    .line 1790
    .line 1791
    return-object v11

    .line 1792
    :pswitch_58
    invoke-static {v1}, Lcg1;->B(Landroid/os/Parcel;)I

    .line 1793
    .line 1794
    .line 1795
    move-result v0

    .line 1796
    move-wide v12, v4

    .line 1797
    move-wide v15, v12

    .line 1798
    move v14, v10

    .line 1799
    :goto_1b
    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    .line 1800
    .line 1801
    .line 1802
    move-result v2

    .line 1803
    if-ge v2, v0, :cond_51

    .line 1804
    .line 1805
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 1806
    .line 1807
    .line 1808
    move-result v2

    .line 1809
    int-to-char v3, v2

    .line 1810
    if-eq v3, v8, :cond_50

    .line 1811
    .line 1812
    if-eq v3, v9, :cond_4f

    .line 1813
    .line 1814
    if-eq v3, v7, :cond_4e

    .line 1815
    .line 1816
    invoke-static {v1, v2}, Lcg1;->y(Landroid/os/Parcel;I)V

    .line 1817
    .line 1818
    .line 1819
    goto :goto_1b

    .line 1820
    :cond_4e
    invoke-static {v1, v2}, Lcg1;->s(Landroid/os/Parcel;I)J

    .line 1821
    .line 1822
    .line 1823
    move-result-wide v2

    .line 1824
    move-wide v15, v2

    .line 1825
    goto :goto_1b

    .line 1826
    :cond_4f
    invoke-static {v1, v2}, Lcg1;->r(Landroid/os/Parcel;I)I

    .line 1827
    .line 1828
    .line 1829
    move-result v2

    .line 1830
    move v14, v2

    .line 1831
    goto :goto_1b

    .line 1832
    :cond_50
    invoke-static {v1, v2}, Lcg1;->s(Landroid/os/Parcel;I)J

    .line 1833
    .line 1834
    .line 1835
    move-result-wide v2

    .line 1836
    move-wide v12, v2

    .line 1837
    goto :goto_1b

    .line 1838
    :cond_51
    invoke-static {v1, v0}, Lcg1;->l(Landroid/os/Parcel;I)V

    .line 1839
    .line 1840
    .line 1841
    new-instance v11, Ljq1;

    .line 1842
    .line 1843
    invoke-direct/range {v11 .. v16}, Ljq1;-><init>(JIJ)V

    .line 1844
    .line 1845
    .line 1846
    return-object v11

    .line 1847
    :pswitch_59
    invoke-static {v1}, Lcg1;->B(Landroid/os/Parcel;)I

    .line 1848
    .line 1849
    .line 1850
    move-result v0

    .line 1851
    move v13, v10

    .line 1852
    move v14, v13

    .line 1853
    move-object v15, v11

    .line 1854
    move-object/from16 v16, v15

    .line 1855
    .line 1856
    move-object/from16 v17, v16

    .line 1857
    .line 1858
    :goto_1c
    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    .line 1859
    .line 1860
    .line 1861
    move-result v2

    .line 1862
    if-ge v2, v0, :cond_58

    .line 1863
    .line 1864
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 1865
    .line 1866
    .line 1867
    move-result v2

    .line 1868
    int-to-char v4, v2

    .line 1869
    if-eq v4, v8, :cond_57

    .line 1870
    .line 1871
    if-eq v4, v9, :cond_56

    .line 1872
    .line 1873
    if-eq v4, v7, :cond_55

    .line 1874
    .line 1875
    if-eq v4, v6, :cond_54

    .line 1876
    .line 1877
    if-eq v4, v3, :cond_52

    .line 1878
    .line 1879
    invoke-static {v1, v2}, Lcg1;->y(Landroid/os/Parcel;I)V

    .line 1880
    .line 1881
    .line 1882
    goto :goto_1c

    .line 1883
    :cond_52
    invoke-static {v1, v2}, Lcg1;->t(Landroid/os/Parcel;I)I

    .line 1884
    .line 1885
    .line 1886
    move-result v2

    .line 1887
    if-nez v2, :cond_53

    .line 1888
    .line 1889
    move-object/from16 v17, v11

    .line 1890
    .line 1891
    goto :goto_1c

    .line 1892
    :cond_53
    invoke-static {v1, v2, v6}, Lcg1;->F(Landroid/os/Parcel;II)V

    .line 1893
    .line 1894
    .line 1895
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 1896
    .line 1897
    .line 1898
    move-result v2

    .line 1899
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 1900
    .line 1901
    .line 1902
    move-result-object v2

    .line 1903
    move-object/from16 v17, v2

    .line 1904
    .line 1905
    goto :goto_1c

    .line 1906
    :cond_54
    invoke-static {v1, v2}, Lcg1;->h(Landroid/os/Parcel;I)Ljava/lang/String;

    .line 1907
    .line 1908
    .line 1909
    move-result-object v16

    .line 1910
    goto :goto_1c

    .line 1911
    :cond_55
    sget-object v4, Landroid/app/PendingIntent;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 1912
    .line 1913
    invoke-static {v1, v2, v4}, Lcg1;->g(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 1914
    .line 1915
    .line 1916
    move-result-object v2

    .line 1917
    move-object v15, v2

    .line 1918
    check-cast v15, Landroid/app/PendingIntent;

    .line 1919
    .line 1920
    goto :goto_1c

    .line 1921
    :cond_56
    invoke-static {v1, v2}, Lcg1;->r(Landroid/os/Parcel;I)I

    .line 1922
    .line 1923
    .line 1924
    move-result v14

    .line 1925
    goto :goto_1c

    .line 1926
    :cond_57
    invoke-static {v1, v2}, Lcg1;->r(Landroid/os/Parcel;I)I

    .line 1927
    .line 1928
    .line 1929
    move-result v13

    .line 1930
    goto :goto_1c

    .line 1931
    :cond_58
    invoke-static {v1, v0}, Lcg1;->l(Landroid/os/Parcel;I)V

    .line 1932
    .line 1933
    .line 1934
    new-instance v12, Loo;

    .line 1935
    .line 1936
    invoke-direct/range {v12 .. v17}, Loo;-><init>(IILandroid/app/PendingIntent;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1937
    .line 1938
    .line 1939
    return-object v12

    .line 1940
    :pswitch_5a
    invoke-static {v1}, Lcg1;->B(Landroid/os/Parcel;)I

    .line 1941
    .line 1942
    .line 1943
    move-result v0

    .line 1944
    move v13, v10

    .line 1945
    move/from16 v16, v13

    .line 1946
    .line 1947
    move/from16 v17, v16

    .line 1948
    .line 1949
    move-object v14, v11

    .line 1950
    move-object v15, v14

    .line 1951
    :goto_1d
    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    .line 1952
    .line 1953
    .line 1954
    move-result v2

    .line 1955
    if-ge v2, v0, :cond_5e

    .line 1956
    .line 1957
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 1958
    .line 1959
    .line 1960
    move-result v2

    .line 1961
    int-to-char v4, v2

    .line 1962
    if-eq v4, v8, :cond_5d

    .line 1963
    .line 1964
    if-eq v4, v9, :cond_5c

    .line 1965
    .line 1966
    if-eq v4, v7, :cond_5b

    .line 1967
    .line 1968
    if-eq v4, v6, :cond_5a

    .line 1969
    .line 1970
    if-eq v4, v3, :cond_59

    .line 1971
    .line 1972
    invoke-static {v1, v2}, Lcg1;->y(Landroid/os/Parcel;I)V

    .line 1973
    .line 1974
    .line 1975
    goto :goto_1d

    .line 1976
    :cond_59
    invoke-static {v1, v2}, Lcg1;->o(Landroid/os/Parcel;I)Z

    .line 1977
    .line 1978
    .line 1979
    move-result v17

    .line 1980
    goto :goto_1d

    .line 1981
    :cond_5a
    invoke-static {v1, v2}, Lcg1;->o(Landroid/os/Parcel;I)Z

    .line 1982
    .line 1983
    .line 1984
    move-result v16

    .line 1985
    goto :goto_1d

    .line 1986
    :cond_5b
    sget-object v4, Loo;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 1987
    .line 1988
    invoke-static {v1, v2, v4}, Lcg1;->g(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 1989
    .line 1990
    .line 1991
    move-result-object v2

    .line 1992
    move-object v15, v2

    .line 1993
    check-cast v15, Loo;

    .line 1994
    .line 1995
    goto :goto_1d

    .line 1996
    :cond_5c
    invoke-static {v1, v2}, Lcg1;->q(Landroid/os/Parcel;I)Landroid/os/IBinder;

    .line 1997
    .line 1998
    .line 1999
    move-result-object v14

    .line 2000
    goto :goto_1d

    .line 2001
    :cond_5d
    invoke-static {v1, v2}, Lcg1;->r(Landroid/os/Parcel;I)I

    .line 2002
    .line 2003
    .line 2004
    move-result v13

    .line 2005
    goto :goto_1d

    .line 2006
    :cond_5e
    invoke-static {v1, v0}, Lcg1;->l(Landroid/os/Parcel;I)V

    .line 2007
    .line 2008
    .line 2009
    new-instance v12, Lvm1;

    .line 2010
    .line 2011
    invoke-direct/range {v12 .. v17}, Lvm1;-><init>(ILandroid/os/IBinder;Loo;ZZ)V

    .line 2012
    .line 2013
    .line 2014
    return-object v12

    .line 2015
    :pswitch_5b
    invoke-static {v1}, Lcg1;->B(Landroid/os/Parcel;)I

    .line 2016
    .line 2017
    .line 2018
    move-result v0

    .line 2019
    move v2, v10

    .line 2020
    move-object v3, v11

    .line 2021
    :goto_1e
    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    .line 2022
    .line 2023
    .line 2024
    move-result v4

    .line 2025
    if-ge v4, v0, :cond_63

    .line 2026
    .line 2027
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 2028
    .line 2029
    .line 2030
    move-result v4

    .line 2031
    int-to-char v5, v4

    .line 2032
    if-eq v5, v8, :cond_62

    .line 2033
    .line 2034
    if-eq v5, v9, :cond_61

    .line 2035
    .line 2036
    if-eq v5, v7, :cond_60

    .line 2037
    .line 2038
    if-eq v5, v6, :cond_5f

    .line 2039
    .line 2040
    invoke-static {v1, v4}, Lcg1;->y(Landroid/os/Parcel;I)V

    .line 2041
    .line 2042
    .line 2043
    goto :goto_1e

    .line 2044
    :cond_5f
    sget-object v3, Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 2045
    .line 2046
    invoke-static {v1, v4, v3}, Lcg1;->g(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 2047
    .line 2048
    .line 2049
    move-result-object v3

    .line 2050
    check-cast v3, Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;

    .line 2051
    .line 2052
    goto :goto_1e

    .line 2053
    :cond_60
    invoke-static {v1, v4}, Lcg1;->r(Landroid/os/Parcel;I)I

    .line 2054
    .line 2055
    .line 2056
    move-result v2

    .line 2057
    goto :goto_1e

    .line 2058
    :cond_61
    sget-object v5, Landroid/accounts/Account;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 2059
    .line 2060
    invoke-static {v1, v4, v5}, Lcg1;->g(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 2061
    .line 2062
    .line 2063
    move-result-object v4

    .line 2064
    move-object v11, v4

    .line 2065
    check-cast v11, Landroid/accounts/Account;

    .line 2066
    .line 2067
    goto :goto_1e

    .line 2068
    :cond_62
    invoke-static {v1, v4}, Lcg1;->r(Landroid/os/Parcel;I)I

    .line 2069
    .line 2070
    .line 2071
    move-result v10

    .line 2072
    goto :goto_1e

    .line 2073
    :cond_63
    invoke-static {v1, v0}, Lcg1;->l(Landroid/os/Parcel;I)V

    .line 2074
    .line 2075
    .line 2076
    new-instance v0, Ltm1;

    .line 2077
    .line 2078
    invoke-direct {v0, v10, v11, v2, v3}, Ltm1;-><init>(ILandroid/accounts/Account;ILcom/google/android/gms/auth/api/signin/GoogleSignInAccount;)V

    .line 2079
    .line 2080
    .line 2081
    return-object v0

    .line 2082
    :pswitch_5c
    invoke-static {v1}, Lcg1;->B(Landroid/os/Parcel;)I

    .line 2083
    .line 2084
    .line 2085
    move-result v0

    .line 2086
    const/4 v2, -0x1

    .line 2087
    move/from16 v23, v2

    .line 2088
    .line 2089
    move-wide/from16 v16, v4

    .line 2090
    .line 2091
    move-wide/from16 v18, v16

    .line 2092
    .line 2093
    move v13, v10

    .line 2094
    move v14, v13

    .line 2095
    move v15, v14

    .line 2096
    move/from16 v22, v15

    .line 2097
    .line 2098
    move-object/from16 v20, v11

    .line 2099
    .line 2100
    move-object/from16 v21, v20

    .line 2101
    .line 2102
    :goto_1f
    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    .line 2103
    .line 2104
    .line 2105
    move-result v2

    .line 2106
    if-ge v2, v0, :cond_64

    .line 2107
    .line 2108
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 2109
    .line 2110
    .line 2111
    move-result v2

    .line 2112
    int-to-char v3, v2

    .line 2113
    packed-switch v3, :pswitch_data_8

    .line 2114
    .line 2115
    .line 2116
    invoke-static {v1, v2}, Lcg1;->y(Landroid/os/Parcel;I)V

    .line 2117
    .line 2118
    .line 2119
    goto :goto_1f

    .line 2120
    :pswitch_5d
    invoke-static {v1, v2}, Lcg1;->r(Landroid/os/Parcel;I)I

    .line 2121
    .line 2122
    .line 2123
    move-result v2

    .line 2124
    move/from16 v23, v2

    .line 2125
    .line 2126
    goto :goto_1f

    .line 2127
    :pswitch_5e
    invoke-static {v1, v2}, Lcg1;->r(Landroid/os/Parcel;I)I

    .line 2128
    .line 2129
    .line 2130
    move-result v2

    .line 2131
    move/from16 v22, v2

    .line 2132
    .line 2133
    goto :goto_1f

    .line 2134
    :pswitch_5f
    invoke-static {v1, v2}, Lcg1;->h(Landroid/os/Parcel;I)Ljava/lang/String;

    .line 2135
    .line 2136
    .line 2137
    move-result-object v2

    .line 2138
    move-object/from16 v21, v2

    .line 2139
    .line 2140
    goto :goto_1f

    .line 2141
    :pswitch_60
    invoke-static {v1, v2}, Lcg1;->h(Landroid/os/Parcel;I)Ljava/lang/String;

    .line 2142
    .line 2143
    .line 2144
    move-result-object v2

    .line 2145
    move-object/from16 v20, v2

    .line 2146
    .line 2147
    goto :goto_1f

    .line 2148
    :pswitch_61
    invoke-static {v1, v2}, Lcg1;->s(Landroid/os/Parcel;I)J

    .line 2149
    .line 2150
    .line 2151
    move-result-wide v2

    .line 2152
    move-wide/from16 v18, v2

    .line 2153
    .line 2154
    goto :goto_1f

    .line 2155
    :pswitch_62
    invoke-static {v1, v2}, Lcg1;->s(Landroid/os/Parcel;I)J

    .line 2156
    .line 2157
    .line 2158
    move-result-wide v2

    .line 2159
    move-wide/from16 v16, v2

    .line 2160
    .line 2161
    goto :goto_1f

    .line 2162
    :pswitch_63
    invoke-static {v1, v2}, Lcg1;->r(Landroid/os/Parcel;I)I

    .line 2163
    .line 2164
    .line 2165
    move-result v2

    .line 2166
    move v15, v2

    .line 2167
    goto :goto_1f

    .line 2168
    :pswitch_64
    invoke-static {v1, v2}, Lcg1;->r(Landroid/os/Parcel;I)I

    .line 2169
    .line 2170
    .line 2171
    move-result v2

    .line 2172
    move v14, v2

    .line 2173
    goto :goto_1f

    .line 2174
    :pswitch_65
    invoke-static {v1, v2}, Lcg1;->r(Landroid/os/Parcel;I)I

    .line 2175
    .line 2176
    .line 2177
    move-result v2

    .line 2178
    move v13, v2

    .line 2179
    goto :goto_1f

    .line 2180
    :cond_64
    invoke-static {v1, v0}, Lcg1;->l(Landroid/os/Parcel;I)V

    .line 2181
    .line 2182
    .line 2183
    new-instance v12, Lco0;

    .line 2184
    .line 2185
    invoke-direct/range {v12 .. v23}, Lco0;-><init>(IIIJJLjava/lang/String;Ljava/lang/String;II)V

    .line 2186
    .line 2187
    .line 2188
    return-object v12

    .line 2189
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5c
        :pswitch_5b
        :pswitch_5a
        :pswitch_59
        :pswitch_58
        :pswitch_57
        :pswitch_4b
        :pswitch_4a
        :pswitch_49
        :pswitch_48
        :pswitch_47
        :pswitch_46
        :pswitch_45
        :pswitch_44
        :pswitch_43
        :pswitch_42
        :pswitch_3b
        :pswitch_3a
        :pswitch_2f
        :pswitch_25
        :pswitch_24
        :pswitch_23
        :pswitch_22
        :pswitch_21
        :pswitch_1a
        :pswitch_a
        :pswitch_9
        :pswitch_1
        :pswitch_0
    .end packed-switch

    .line 2190
    .line 2191
    .line 2192
    .line 2193
    .line 2194
    .line 2195
    .line 2196
    .line 2197
    .line 2198
    .line 2199
    .line 2200
    .line 2201
    .line 2202
    .line 2203
    .line 2204
    .line 2205
    .line 2206
    .line 2207
    .line 2208
    .line 2209
    .line 2210
    .line 2211
    .line 2212
    .line 2213
    .line 2214
    .line 2215
    .line 2216
    .line 2217
    .line 2218
    .line 2219
    .line 2220
    .line 2221
    .line 2222
    .line 2223
    .line 2224
    .line 2225
    .line 2226
    .line 2227
    .line 2228
    .line 2229
    .line 2230
    .line 2231
    .line 2232
    .line 2233
    .line 2234
    .line 2235
    .line 2236
    .line 2237
    .line 2238
    .line 2239
    .line 2240
    .line 2241
    .line 2242
    .line 2243
    .line 2244
    .line 2245
    .line 2246
    .line 2247
    .line 2248
    .line 2249
    .line 2250
    .line 2251
    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
    .end packed-switch

    .line 2252
    .line 2253
    .line 2254
    .line 2255
    .line 2256
    .line 2257
    .line 2258
    .line 2259
    .line 2260
    .line 2261
    .line 2262
    .line 2263
    .line 2264
    .line 2265
    .line 2266
    .line 2267
    .line 2268
    .line 2269
    :pswitch_data_2
    .packed-switch 0x1
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_b
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
    .end packed-switch

    .line 2270
    .line 2271
    .line 2272
    .line 2273
    .line 2274
    .line 2275
    .line 2276
    .line 2277
    .line 2278
    .line 2279
    .line 2280
    .line 2281
    .line 2282
    .line 2283
    .line 2284
    .line 2285
    .line 2286
    .line 2287
    .line 2288
    .line 2289
    .line 2290
    .line 2291
    .line 2292
    .line 2293
    .line 2294
    .line 2295
    .line 2296
    .line 2297
    .line 2298
    .line 2299
    .line 2300
    .line 2301
    .line 2302
    .line 2303
    :pswitch_data_3
    .packed-switch 0x1
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
    .end packed-switch

    .line 2304
    .line 2305
    .line 2306
    .line 2307
    .line 2308
    .line 2309
    .line 2310
    .line 2311
    .line 2312
    .line 2313
    .line 2314
    .line 2315
    .line 2316
    .line 2317
    .line 2318
    .line 2319
    :pswitch_data_4
    .packed-switch 0x2
        :pswitch_2e
        :pswitch_2d
        :pswitch_2c
        :pswitch_2b
        :pswitch_2a
        :pswitch_29
        :pswitch_28
        :pswitch_27
        :pswitch_26
    .end packed-switch

    .line 2320
    .line 2321
    .line 2322
    .line 2323
    .line 2324
    .line 2325
    .line 2326
    .line 2327
    .line 2328
    .line 2329
    .line 2330
    .line 2331
    .line 2332
    .line 2333
    .line 2334
    .line 2335
    .line 2336
    .line 2337
    .line 2338
    .line 2339
    .line 2340
    .line 2341
    :pswitch_data_5
    .packed-switch 0x2
        :pswitch_39
        :pswitch_38
        :pswitch_37
        :pswitch_36
        :pswitch_35
        :pswitch_34
        :pswitch_33
        :pswitch_32
        :pswitch_31
        :pswitch_30
    .end packed-switch

    .line 2342
    .line 2343
    .line 2344
    .line 2345
    .line 2346
    .line 2347
    .line 2348
    .line 2349
    .line 2350
    .line 2351
    .line 2352
    .line 2353
    .line 2354
    .line 2355
    .line 2356
    .line 2357
    .line 2358
    .line 2359
    .line 2360
    .line 2361
    .line 2362
    .line 2363
    .line 2364
    .line 2365
    :pswitch_data_6
    .packed-switch 0x2
        :pswitch_41
        :pswitch_40
        :pswitch_3f
        :pswitch_3e
        :pswitch_3d
        :pswitch_3c
    .end packed-switch

    .line 2366
    .line 2367
    .line 2368
    .line 2369
    .line 2370
    .line 2371
    .line 2372
    .line 2373
    .line 2374
    .line 2375
    .line 2376
    .line 2377
    .line 2378
    .line 2379
    .line 2380
    .line 2381
    :pswitch_data_7
    .packed-switch 0x2
        :pswitch_56
        :pswitch_55
        :pswitch_54
        :pswitch_53
        :pswitch_52
        :pswitch_51
        :pswitch_50
        :pswitch_4f
        :pswitch_4e
        :pswitch_4d
        :pswitch_4c
    .end packed-switch

    .line 2382
    .line 2383
    .line 2384
    .line 2385
    .line 2386
    .line 2387
    .line 2388
    .line 2389
    .line 2390
    .line 2391
    .line 2392
    .line 2393
    .line 2394
    .line 2395
    .line 2396
    .line 2397
    .line 2398
    .line 2399
    .line 2400
    .line 2401
    .line 2402
    .line 2403
    .line 2404
    .line 2405
    .line 2406
    .line 2407
    :pswitch_data_8
    .packed-switch 0x1
        :pswitch_65
        :pswitch_64
        :pswitch_63
        :pswitch_62
        :pswitch_61
        :pswitch_60
        :pswitch_5f
        :pswitch_5e
        :pswitch_5d
    .end packed-switch
.end method

.method public final synthetic newArray(I)[Ljava/lang/Object;
    .locals 0

    .line 1
    iget p0, p0, Lom1;->a:I

    .line 2
    .line 3
    packed-switch p0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    new-array p0, p1, [Ly92;

    .line 7
    .line 8
    return-object p0

    .line 9
    :pswitch_0
    new-array p0, p1, [Lv92;

    .line 10
    .line 11
    return-object p0

    .line 12
    :pswitch_1
    new-array p0, p1, [Lt92;

    .line 13
    .line 14
    return-object p0

    .line 15
    :pswitch_2
    new-array p0, p1, [Lo92;

    .line 16
    .line 17
    return-object p0

    .line 18
    :pswitch_3
    new-array p0, p1, [Lna0;

    .line 19
    .line 20
    return-object p0

    .line 21
    :pswitch_4
    new-array p0, p1, [Lto;

    .line 22
    .line 23
    return-object p0

    .line 24
    :pswitch_5
    new-array p0, p1, [Ld22;

    .line 25
    .line 26
    return-object p0

    .line 27
    :pswitch_6
    new-array p0, p1, [Ld32;

    .line 28
    .line 29
    return-object p0

    .line 30
    :pswitch_7
    new-array p0, p1, [La32;

    .line 31
    .line 32
    return-object p0

    .line 33
    :pswitch_8
    new-array p0, p1, [Ly22;

    .line 34
    .line 35
    return-object p0

    .line 36
    :pswitch_9
    new-array p0, p1, [Lw22;

    .line 37
    .line 38
    return-object p0

    .line 39
    :pswitch_a
    new-array p0, p1, [Lv22;

    .line 40
    .line 41
    return-object p0

    .line 42
    :pswitch_b
    new-array p0, p1, [Ls22;

    .line 43
    .line 44
    return-object p0

    .line 45
    :pswitch_c
    new-array p0, p1, [Lp22;

    .line 46
    .line 47
    return-object p0

    .line 48
    :pswitch_d
    new-array p0, p1, [Ln22;

    .line 49
    .line 50
    return-object p0

    .line 51
    :pswitch_e
    new-array p0, p1, [Lcom/google/android/gms/common/api/Status;

    .line 52
    .line 53
    return-object p0

    .line 54
    :pswitch_f
    new-array p0, p1, [Lmw1;

    .line 55
    .line 56
    return-object p0

    .line 57
    :pswitch_10
    new-array p0, p1, [Llw1;

    .line 58
    .line 59
    return-object p0

    .line 60
    :pswitch_11
    new-array p0, p1, [Lcom/google/android/gms/common/api/Scope;

    .line 61
    .line 62
    return-object p0

    .line 63
    :pswitch_12
    new-array p0, p1, [Ltu1;

    .line 64
    .line 65
    return-object p0

    .line 66
    :pswitch_13
    new-array p0, p1, [Lsu1;

    .line 67
    .line 68
    return-object p0

    .line 69
    :pswitch_14
    new-array p0, p1, [Lu20;

    .line 70
    .line 71
    return-object p0

    .line 72
    :pswitch_15
    new-array p0, p1, [Lrt1;

    .line 73
    .line 74
    return-object p0

    .line 75
    :pswitch_16
    new-array p0, p1, [Lsr1;

    .line 76
    .line 77
    return-object p0

    .line 78
    :pswitch_17
    new-array p0, p1, [Lu11;

    .line 79
    .line 80
    return-object p0

    .line 81
    :pswitch_18
    new-array p0, p1, [Ljq1;

    .line 82
    .line 83
    return-object p0

    .line 84
    :pswitch_19
    new-array p0, p1, [Loo;

    .line 85
    .line 86
    return-object p0

    .line 87
    :pswitch_1a
    new-array p0, p1, [Lvm1;

    .line 88
    .line 89
    return-object p0

    .line 90
    :pswitch_1b
    new-array p0, p1, [Ltm1;

    .line 91
    .line 92
    return-object p0

    .line 93
    :pswitch_1c
    new-array p0, p1, [Lco0;

    .line 94
    .line 95
    return-object p0

    .line 96
    nop

    .line 97
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
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
