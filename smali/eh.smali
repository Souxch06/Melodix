.class public final Leh;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Llh;
.implements Lkh;
.implements Ljava/lang/Cloneable;
.implements Ljava/nio/channels/ByteChannel;


# instance fields
.field public j:Lp31;

.field public k:J


# virtual methods
.method public final A(J)V
    .locals 11

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v2, p1, v0

    .line 4
    .line 5
    if-nez v2, :cond_0

    .line 6
    .line 7
    const/16 p1, 0x30

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Leh;->z(I)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    const/4 v3, 0x1

    .line 14
    if-gez v2, :cond_2

    .line 15
    .line 16
    neg-long p1, p1

    .line 17
    cmp-long v2, p1, v0

    .line 18
    .line 19
    if-gez v2, :cond_1

    .line 20
    .line 21
    const-string p1, "-9223372036854775808"

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Leh;->F(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    move v2, v3

    .line 28
    goto :goto_0

    .line 29
    :cond_2
    const/4 v2, 0x0

    .line 30
    :goto_0
    const-wide/32 v4, 0x5f5e100

    .line 31
    .line 32
    .line 33
    cmp-long v4, p1, v4

    .line 34
    .line 35
    const-wide/16 v5, 0xa

    .line 36
    .line 37
    if-gez v4, :cond_a

    .line 38
    .line 39
    const-wide/16 v7, 0x2710

    .line 40
    .line 41
    cmp-long v4, p1, v7

    .line 42
    .line 43
    if-gez v4, :cond_6

    .line 44
    .line 45
    const-wide/16 v7, 0x64

    .line 46
    .line 47
    cmp-long v4, p1, v7

    .line 48
    .line 49
    if-gez v4, :cond_4

    .line 50
    .line 51
    cmp-long v4, p1, v5

    .line 52
    .line 53
    if-gez v4, :cond_3

    .line 54
    .line 55
    goto/16 :goto_1

    .line 56
    .line 57
    :cond_3
    const/4 v3, 0x2

    .line 58
    goto/16 :goto_1

    .line 59
    .line 60
    :cond_4
    const-wide/16 v3, 0x3e8

    .line 61
    .line 62
    cmp-long v3, p1, v3

    .line 63
    .line 64
    if-gez v3, :cond_5

    .line 65
    .line 66
    const/4 v3, 0x3

    .line 67
    goto/16 :goto_1

    .line 68
    .line 69
    :cond_5
    const/4 v3, 0x4

    .line 70
    goto/16 :goto_1

    .line 71
    .line 72
    :cond_6
    const-wide/32 v3, 0xf4240

    .line 73
    .line 74
    .line 75
    cmp-long v3, p1, v3

    .line 76
    .line 77
    if-gez v3, :cond_8

    .line 78
    .line 79
    const-wide/32 v3, 0x186a0

    .line 80
    .line 81
    .line 82
    cmp-long v3, p1, v3

    .line 83
    .line 84
    if-gez v3, :cond_7

    .line 85
    .line 86
    const/4 v3, 0x5

    .line 87
    goto/16 :goto_1

    .line 88
    .line 89
    :cond_7
    const/4 v3, 0x6

    .line 90
    goto/16 :goto_1

    .line 91
    .line 92
    :cond_8
    const-wide/32 v3, 0x989680

    .line 93
    .line 94
    .line 95
    cmp-long v3, p1, v3

    .line 96
    .line 97
    if-gez v3, :cond_9

    .line 98
    .line 99
    const/4 v3, 0x7

    .line 100
    goto/16 :goto_1

    .line 101
    .line 102
    :cond_9
    const/16 v3, 0x8

    .line 103
    .line 104
    goto/16 :goto_1

    .line 105
    .line 106
    :cond_a
    const-wide v3, 0xe8d4a51000L

    .line 107
    .line 108
    .line 109
    .line 110
    .line 111
    cmp-long v3, p1, v3

    .line 112
    .line 113
    if-gez v3, :cond_e

    .line 114
    .line 115
    const-wide v3, 0x2540be400L

    .line 116
    .line 117
    .line 118
    .line 119
    .line 120
    cmp-long v3, p1, v3

    .line 121
    .line 122
    if-gez v3, :cond_c

    .line 123
    .line 124
    const-wide/32 v3, 0x3b9aca00

    .line 125
    .line 126
    .line 127
    cmp-long v3, p1, v3

    .line 128
    .line 129
    if-gez v3, :cond_b

    .line 130
    .line 131
    const/16 v3, 0x9

    .line 132
    .line 133
    goto :goto_1

    .line 134
    :cond_b
    const/16 v3, 0xa

    .line 135
    .line 136
    goto :goto_1

    .line 137
    :cond_c
    const-wide v3, 0x174876e800L

    .line 138
    .line 139
    .line 140
    .line 141
    .line 142
    cmp-long v3, p1, v3

    .line 143
    .line 144
    if-gez v3, :cond_d

    .line 145
    .line 146
    const/16 v3, 0xb

    .line 147
    .line 148
    goto :goto_1

    .line 149
    :cond_d
    const/16 v3, 0xc

    .line 150
    .line 151
    goto :goto_1

    .line 152
    :cond_e
    const-wide v3, 0x38d7ea4c68000L

    .line 153
    .line 154
    .line 155
    .line 156
    .line 157
    cmp-long v3, p1, v3

    .line 158
    .line 159
    if-gez v3, :cond_11

    .line 160
    .line 161
    const-wide v3, 0x9184e72a000L

    .line 162
    .line 163
    .line 164
    .line 165
    .line 166
    cmp-long v3, p1, v3

    .line 167
    .line 168
    if-gez v3, :cond_f

    .line 169
    .line 170
    const/16 v3, 0xd

    .line 171
    .line 172
    goto :goto_1

    .line 173
    :cond_f
    const-wide v3, 0x5af3107a4000L

    .line 174
    .line 175
    .line 176
    .line 177
    .line 178
    cmp-long v3, p1, v3

    .line 179
    .line 180
    if-gez v3, :cond_10

    .line 181
    .line 182
    const/16 v3, 0xe

    .line 183
    .line 184
    goto :goto_1

    .line 185
    :cond_10
    const/16 v3, 0xf

    .line 186
    .line 187
    goto :goto_1

    .line 188
    :cond_11
    const-wide v3, 0x16345785d8a0000L

    .line 189
    .line 190
    .line 191
    .line 192
    .line 193
    cmp-long v3, p1, v3

    .line 194
    .line 195
    if-gez v3, :cond_13

    .line 196
    .line 197
    const-wide v3, 0x2386f26fc10000L

    .line 198
    .line 199
    .line 200
    .line 201
    .line 202
    cmp-long v3, p1, v3

    .line 203
    .line 204
    if-gez v3, :cond_12

    .line 205
    .line 206
    const/16 v3, 0x10

    .line 207
    .line 208
    goto :goto_1

    .line 209
    :cond_12
    const/16 v3, 0x11

    .line 210
    .line 211
    goto :goto_1

    .line 212
    :cond_13
    const-wide v3, 0xde0b6b3a7640000L

    .line 213
    .line 214
    .line 215
    .line 216
    .line 217
    cmp-long v3, p1, v3

    .line 218
    .line 219
    if-gez v3, :cond_14

    .line 220
    .line 221
    const/16 v3, 0x12

    .line 222
    .line 223
    goto :goto_1

    .line 224
    :cond_14
    const/16 v3, 0x13

    .line 225
    .line 226
    :goto_1
    if-eqz v2, :cond_15

    .line 227
    .line 228
    add-int/lit8 v3, v3, 0x1

    .line 229
    .line 230
    :cond_15
    invoke-virtual {p0, v3}, Leh;->v(I)Lp31;

    .line 231
    .line 232
    .line 233
    move-result-object v4

    .line 234
    iget-object v7, v4, Lp31;->a:[B

    .line 235
    .line 236
    iget v8, v4, Lp31;->c:I

    .line 237
    .line 238
    add-int/2addr v8, v3

    .line 239
    :goto_2
    cmp-long v9, p1, v0

    .line 240
    .line 241
    if-eqz v9, :cond_16

    .line 242
    .line 243
    rem-long v9, p1, v5

    .line 244
    .line 245
    long-to-int v9, v9

    .line 246
    add-int/lit8 v8, v8, -0x1

    .line 247
    .line 248
    sget-object v10, Lb;->a:[B

    .line 249
    .line 250
    aget-byte v9, v10, v9

    .line 251
    .line 252
    aput-byte v9, v7, v8

    .line 253
    .line 254
    div-long/2addr p1, v5

    .line 255
    goto :goto_2

    .line 256
    :cond_16
    if-eqz v2, :cond_17

    .line 257
    .line 258
    add-int/lit8 v8, v8, -0x1

    .line 259
    .line 260
    const/16 p1, 0x2d

    .line 261
    .line 262
    aput-byte p1, v7, v8

    .line 263
    .line 264
    :cond_17
    iget p1, v4, Lp31;->c:I

    .line 265
    .line 266
    add-int/2addr p1, v3

    .line 267
    iput p1, v4, Lp31;->c:I

    .line 268
    .line 269
    iget-wide p1, p0, Leh;->k:J

    .line 270
    .line 271
    int-to-long v0, v3

    .line 272
    add-long/2addr p1, v0

    .line 273
    iput-wide p1, p0, Leh;->k:J

    .line 274
    .line 275
    return-void
.end method

.method public final B(J)V
    .locals 12

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/16 p1, 0x30

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Leh;->z(I)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    const/4 v0, 0x1

    .line 14
    ushr-long v1, p1, v0

    .line 15
    .line 16
    or-long/2addr v1, p1

    .line 17
    const/4 v3, 0x2

    .line 18
    ushr-long v4, v1, v3

    .line 19
    .line 20
    or-long/2addr v1, v4

    .line 21
    const/4 v4, 0x4

    .line 22
    ushr-long v5, v1, v4

    .line 23
    .line 24
    or-long/2addr v1, v5

    .line 25
    const/16 v5, 0x8

    .line 26
    .line 27
    ushr-long v6, v1, v5

    .line 28
    .line 29
    or-long/2addr v1, v6

    .line 30
    const/16 v6, 0x10

    .line 31
    .line 32
    ushr-long v7, v1, v6

    .line 33
    .line 34
    or-long/2addr v1, v7

    .line 35
    const/16 v7, 0x20

    .line 36
    .line 37
    ushr-long v8, v1, v7

    .line 38
    .line 39
    or-long/2addr v1, v8

    .line 40
    ushr-long v8, v1, v0

    .line 41
    .line 42
    const-wide v10, 0x5555555555555555L    # 1.1945305291614955E103

    .line 43
    .line 44
    .line 45
    .line 46
    .line 47
    and-long/2addr v8, v10

    .line 48
    sub-long/2addr v1, v8

    .line 49
    ushr-long v8, v1, v3

    .line 50
    .line 51
    const-wide v10, 0x3333333333333333L    # 4.667261458395856E-62

    .line 52
    .line 53
    .line 54
    .line 55
    .line 56
    and-long/2addr v8, v10

    .line 57
    and-long/2addr v1, v10

    .line 58
    add-long/2addr v8, v1

    .line 59
    ushr-long v1, v8, v4

    .line 60
    .line 61
    add-long/2addr v1, v8

    .line 62
    const-wide v8, 0xf0f0f0f0f0f0f0fL    # 3.815736827118017E-236

    .line 63
    .line 64
    .line 65
    .line 66
    .line 67
    and-long/2addr v1, v8

    .line 68
    ushr-long v8, v1, v5

    .line 69
    .line 70
    add-long/2addr v1, v8

    .line 71
    ushr-long v5, v1, v6

    .line 72
    .line 73
    add-long/2addr v1, v5

    .line 74
    const-wide/16 v5, 0x3f

    .line 75
    .line 76
    and-long v8, v1, v5

    .line 77
    .line 78
    ushr-long/2addr v1, v7

    .line 79
    and-long/2addr v1, v5

    .line 80
    add-long/2addr v8, v1

    .line 81
    const-wide/16 v1, 0x3

    .line 82
    .line 83
    add-long/2addr v8, v1

    .line 84
    const-wide/16 v1, 0x4

    .line 85
    .line 86
    div-long/2addr v8, v1

    .line 87
    long-to-int v1, v8

    .line 88
    invoke-virtual {p0, v1}, Leh;->v(I)Lp31;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    iget-object v3, v2, Lp31;->a:[B

    .line 93
    .line 94
    iget v5, v2, Lp31;->c:I

    .line 95
    .line 96
    add-int v6, v5, v1

    .line 97
    .line 98
    sub-int/2addr v6, v0

    .line 99
    :goto_0
    if-lt v6, v5, :cond_1

    .line 100
    .line 101
    sget-object v0, Lb;->a:[B

    .line 102
    .line 103
    const-wide/16 v7, 0xf

    .line 104
    .line 105
    and-long/2addr v7, p1

    .line 106
    long-to-int v7, v7

    .line 107
    aget-byte v0, v0, v7

    .line 108
    .line 109
    aput-byte v0, v3, v6

    .line 110
    .line 111
    ushr-long/2addr p1, v4

    .line 112
    add-int/lit8 v6, v6, -0x1

    .line 113
    .line 114
    goto :goto_0

    .line 115
    :cond_1
    iget p1, v2, Lp31;->c:I

    .line 116
    .line 117
    add-int/2addr p1, v1

    .line 118
    iput p1, v2, Lp31;->c:I

    .line 119
    .line 120
    iget-wide p1, p0, Leh;->k:J

    .line 121
    .line 122
    int-to-long v0, v1

    .line 123
    add-long/2addr p1, v0

    .line 124
    iput-wide p1, p0, Leh;->k:J

    .line 125
    .line 126
    return-void
.end method

.method public final C(I)V
    .locals 7

    .line 1
    const/4 v0, 0x4

    .line 2
    invoke-virtual {p0, v0}, Leh;->v(I)Lp31;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    iget-object v2, v1, Lp31;->a:[B

    .line 7
    .line 8
    iget v3, v1, Lp31;->c:I

    .line 9
    .line 10
    add-int/lit8 v4, v3, 0x1

    .line 11
    .line 12
    ushr-int/lit8 v5, p1, 0x18

    .line 13
    .line 14
    and-int/lit16 v5, v5, 0xff

    .line 15
    .line 16
    int-to-byte v5, v5

    .line 17
    aput-byte v5, v2, v3

    .line 18
    .line 19
    add-int/lit8 v5, v3, 0x2

    .line 20
    .line 21
    ushr-int/lit8 v6, p1, 0x10

    .line 22
    .line 23
    and-int/lit16 v6, v6, 0xff

    .line 24
    .line 25
    int-to-byte v6, v6

    .line 26
    aput-byte v6, v2, v4

    .line 27
    .line 28
    add-int/lit8 v4, v3, 0x3

    .line 29
    .line 30
    ushr-int/lit8 v6, p1, 0x8

    .line 31
    .line 32
    and-int/lit16 v6, v6, 0xff

    .line 33
    .line 34
    int-to-byte v6, v6

    .line 35
    aput-byte v6, v2, v5

    .line 36
    .line 37
    add-int/2addr v3, v0

    .line 38
    and-int/lit16 p1, p1, 0xff

    .line 39
    .line 40
    int-to-byte p1, p1

    .line 41
    aput-byte p1, v2, v4

    .line 42
    .line 43
    iput v3, v1, Lp31;->c:I

    .line 44
    .line 45
    iget-wide v0, p0, Leh;->k:J

    .line 46
    .line 47
    const-wide/16 v2, 0x4

    .line 48
    .line 49
    add-long/2addr v0, v2

    .line 50
    iput-wide v0, p0, Leh;->k:J

    .line 51
    .line 52
    return-void
.end method

.method public final D(I)V
    .locals 6

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-virtual {p0, v0}, Leh;->v(I)Lp31;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    iget-object v2, v1, Lp31;->a:[B

    .line 7
    .line 8
    iget v3, v1, Lp31;->c:I

    .line 9
    .line 10
    add-int/lit8 v4, v3, 0x1

    .line 11
    .line 12
    ushr-int/lit8 v5, p1, 0x8

    .line 13
    .line 14
    and-int/lit16 v5, v5, 0xff

    .line 15
    .line 16
    int-to-byte v5, v5

    .line 17
    aput-byte v5, v2, v3

    .line 18
    .line 19
    add-int/2addr v3, v0

    .line 20
    and-int/lit16 p1, p1, 0xff

    .line 21
    .line 22
    int-to-byte p1, p1

    .line 23
    aput-byte p1, v2, v4

    .line 24
    .line 25
    iput v3, v1, Lp31;->c:I

    .line 26
    .line 27
    iget-wide v0, p0, Leh;->k:J

    .line 28
    .line 29
    const-wide/16 v2, 0x2

    .line 30
    .line 31
    add-long/2addr v0, v2

    .line 32
    iput-wide v0, p0, Leh;->k:J

    .line 33
    .line 34
    return-void
.end method

.method public final E(IILjava/lang/String;)V
    .locals 9

    .line 1
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    if-ltz p1, :cond_a

    .line 5
    .line 6
    if-lt p2, p1, :cond_9

    .line 7
    .line 8
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-gt p2, v0, :cond_8

    .line 13
    .line 14
    :goto_0
    if-ge p1, p2, :cond_7

    .line 15
    .line 16
    invoke-virtual {p3, p1}, Ljava/lang/String;->charAt(I)C

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    const/16 v1, 0x80

    .line 21
    .line 22
    if-ge v0, v1, :cond_1

    .line 23
    .line 24
    const/4 v2, 0x1

    .line 25
    invoke-virtual {p0, v2}, Leh;->v(I)Lp31;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    iget-object v3, v2, Lp31;->a:[B

    .line 30
    .line 31
    iget v4, v2, Lp31;->c:I

    .line 32
    .line 33
    sub-int/2addr v4, p1

    .line 34
    rsub-int v5, v4, 0x2000

    .line 35
    .line 36
    invoke-static {p2, v5}, Ljava/lang/Math;->min(II)I

    .line 37
    .line 38
    .line 39
    move-result v5

    .line 40
    add-int/lit8 v6, p1, 0x1

    .line 41
    .line 42
    add-int/2addr p1, v4

    .line 43
    int-to-byte v0, v0

    .line 44
    aput-byte v0, v3, p1

    .line 45
    .line 46
    :goto_1
    move p1, v6

    .line 47
    if-ge p1, v5, :cond_0

    .line 48
    .line 49
    invoke-virtual {p3, p1}, Ljava/lang/String;->charAt(I)C

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-ge v0, v1, :cond_0

    .line 54
    .line 55
    add-int/lit8 v6, p1, 0x1

    .line 56
    .line 57
    add-int/2addr p1, v4

    .line 58
    int-to-byte v0, v0

    .line 59
    aput-byte v0, v3, p1

    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_0
    add-int/2addr v4, p1

    .line 63
    iget v0, v2, Lp31;->c:I

    .line 64
    .line 65
    sub-int/2addr v4, v0

    .line 66
    add-int/2addr v0, v4

    .line 67
    iput v0, v2, Lp31;->c:I

    .line 68
    .line 69
    iget-wide v0, p0, Leh;->k:J

    .line 70
    .line 71
    int-to-long v2, v4

    .line 72
    add-long/2addr v0, v2

    .line 73
    iput-wide v0, p0, Leh;->k:J

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_1
    const/16 v2, 0x800

    .line 77
    .line 78
    if-ge v0, v2, :cond_2

    .line 79
    .line 80
    const/4 v2, 0x2

    .line 81
    invoke-virtual {p0, v2}, Leh;->v(I)Lp31;

    .line 82
    .line 83
    .line 84
    move-result-object v3

    .line 85
    iget-object v4, v3, Lp31;->a:[B

    .line 86
    .line 87
    iget v5, v3, Lp31;->c:I

    .line 88
    .line 89
    shr-int/lit8 v6, v0, 0x6

    .line 90
    .line 91
    or-int/lit16 v6, v6, 0xc0

    .line 92
    .line 93
    int-to-byte v6, v6

    .line 94
    aput-byte v6, v4, v5

    .line 95
    .line 96
    add-int/lit8 v6, v5, 0x1

    .line 97
    .line 98
    and-int/lit8 v0, v0, 0x3f

    .line 99
    .line 100
    or-int/2addr v0, v1

    .line 101
    int-to-byte v0, v0

    .line 102
    aput-byte v0, v4, v6

    .line 103
    .line 104
    add-int/2addr v5, v2

    .line 105
    iput v5, v3, Lp31;->c:I

    .line 106
    .line 107
    iget-wide v0, p0, Leh;->k:J

    .line 108
    .line 109
    const-wide/16 v2, 0x2

    .line 110
    .line 111
    add-long/2addr v0, v2

    .line 112
    iput-wide v0, p0, Leh;->k:J

    .line 113
    .line 114
    :goto_2
    add-int/lit8 p1, p1, 0x1

    .line 115
    .line 116
    goto :goto_0

    .line 117
    :cond_2
    const v2, 0xd800

    .line 118
    .line 119
    .line 120
    const/16 v3, 0x3f

    .line 121
    .line 122
    if-lt v0, v2, :cond_6

    .line 123
    .line 124
    const v2, 0xdfff

    .line 125
    .line 126
    .line 127
    if-le v0, v2, :cond_3

    .line 128
    .line 129
    goto :goto_4

    .line 130
    :cond_3
    add-int/lit8 v2, p1, 0x1

    .line 131
    .line 132
    if-ge v2, p2, :cond_4

    .line 133
    .line 134
    invoke-virtual {p3, v2}, Ljava/lang/String;->charAt(I)C

    .line 135
    .line 136
    .line 137
    move-result v4

    .line 138
    goto :goto_3

    .line 139
    :cond_4
    const/4 v4, 0x0

    .line 140
    :goto_3
    const v5, 0xdbff

    .line 141
    .line 142
    .line 143
    if-gt v0, v5, :cond_5

    .line 144
    .line 145
    const v5, 0xdc00

    .line 146
    .line 147
    .line 148
    if-gt v5, v4, :cond_5

    .line 149
    .line 150
    const v5, 0xe000

    .line 151
    .line 152
    .line 153
    if-ge v4, v5, :cond_5

    .line 154
    .line 155
    and-int/lit16 v0, v0, 0x3ff

    .line 156
    .line 157
    shl-int/lit8 v0, v0, 0xa

    .line 158
    .line 159
    and-int/lit16 v2, v4, 0x3ff

    .line 160
    .line 161
    or-int/2addr v0, v2

    .line 162
    const/high16 v2, 0x10000

    .line 163
    .line 164
    add-int/2addr v0, v2

    .line 165
    const/4 v2, 0x4

    .line 166
    invoke-virtual {p0, v2}, Leh;->v(I)Lp31;

    .line 167
    .line 168
    .line 169
    move-result-object v4

    .line 170
    iget-object v5, v4, Lp31;->a:[B

    .line 171
    .line 172
    iget v6, v4, Lp31;->c:I

    .line 173
    .line 174
    shr-int/lit8 v7, v0, 0x12

    .line 175
    .line 176
    or-int/lit16 v7, v7, 0xf0

    .line 177
    .line 178
    int-to-byte v7, v7

    .line 179
    aput-byte v7, v5, v6

    .line 180
    .line 181
    add-int/lit8 v7, v6, 0x1

    .line 182
    .line 183
    shr-int/lit8 v8, v0, 0xc

    .line 184
    .line 185
    and-int/2addr v8, v3

    .line 186
    or-int/2addr v8, v1

    .line 187
    int-to-byte v8, v8

    .line 188
    aput-byte v8, v5, v7

    .line 189
    .line 190
    add-int/lit8 v7, v6, 0x2

    .line 191
    .line 192
    shr-int/lit8 v8, v0, 0x6

    .line 193
    .line 194
    and-int/2addr v8, v3

    .line 195
    or-int/2addr v8, v1

    .line 196
    int-to-byte v8, v8

    .line 197
    aput-byte v8, v5, v7

    .line 198
    .line 199
    add-int/lit8 v7, v6, 0x3

    .line 200
    .line 201
    and-int/2addr v0, v3

    .line 202
    or-int/2addr v0, v1

    .line 203
    int-to-byte v0, v0

    .line 204
    aput-byte v0, v5, v7

    .line 205
    .line 206
    add-int/2addr v6, v2

    .line 207
    iput v6, v4, Lp31;->c:I

    .line 208
    .line 209
    iget-wide v0, p0, Leh;->k:J

    .line 210
    .line 211
    const-wide/16 v2, 0x4

    .line 212
    .line 213
    add-long/2addr v0, v2

    .line 214
    iput-wide v0, p0, Leh;->k:J

    .line 215
    .line 216
    add-int/lit8 p1, p1, 0x2

    .line 217
    .line 218
    goto/16 :goto_0

    .line 219
    .line 220
    :cond_5
    invoke-virtual {p0, v3}, Leh;->z(I)V

    .line 221
    .line 222
    .line 223
    move p1, v2

    .line 224
    goto/16 :goto_0

    .line 225
    .line 226
    :cond_6
    :goto_4
    const/4 v2, 0x3

    .line 227
    invoke-virtual {p0, v2}, Leh;->v(I)Lp31;

    .line 228
    .line 229
    .line 230
    move-result-object v4

    .line 231
    iget-object v5, v4, Lp31;->a:[B

    .line 232
    .line 233
    iget v6, v4, Lp31;->c:I

    .line 234
    .line 235
    shr-int/lit8 v7, v0, 0xc

    .line 236
    .line 237
    or-int/lit16 v7, v7, 0xe0

    .line 238
    .line 239
    int-to-byte v7, v7

    .line 240
    aput-byte v7, v5, v6

    .line 241
    .line 242
    add-int/lit8 v7, v6, 0x1

    .line 243
    .line 244
    shr-int/lit8 v8, v0, 0x6

    .line 245
    .line 246
    and-int/2addr v3, v8

    .line 247
    or-int/2addr v3, v1

    .line 248
    int-to-byte v3, v3

    .line 249
    aput-byte v3, v5, v7

    .line 250
    .line 251
    add-int/lit8 v3, v6, 0x2

    .line 252
    .line 253
    and-int/lit8 v0, v0, 0x3f

    .line 254
    .line 255
    or-int/2addr v0, v1

    .line 256
    int-to-byte v0, v0

    .line 257
    aput-byte v0, v5, v3

    .line 258
    .line 259
    add-int/2addr v6, v2

    .line 260
    iput v6, v4, Lp31;->c:I

    .line 261
    .line 262
    iget-wide v0, p0, Leh;->k:J

    .line 263
    .line 264
    const-wide/16 v2, 0x3

    .line 265
    .line 266
    add-long/2addr v0, v2

    .line 267
    iput-wide v0, p0, Leh;->k:J

    .line 268
    .line 269
    goto/16 :goto_2

    .line 270
    .line 271
    :cond_7
    return-void

    .line 272
    :cond_8
    const-string p0, "endIndex > string.length: "

    .line 273
    .line 274
    const-string p1, " > "

    .line 275
    .line 276
    invoke-static {p0, p1, p2}, Loq;->o(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/StringBuilder;

    .line 277
    .line 278
    .line 279
    move-result-object p0

    .line 280
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    .line 281
    .line 282
    .line 283
    move-result p1

    .line 284
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 285
    .line 286
    .line 287
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 288
    .line 289
    .line 290
    move-result-object p0

    .line 291
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 292
    .line 293
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 294
    .line 295
    .line 296
    move-result-object p0

    .line 297
    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 298
    .line 299
    .line 300
    throw p1

    .line 301
    :cond_9
    const-string p0, "endIndex < beginIndex: "

    .line 302
    .line 303
    const-string p3, " < "

    .line 304
    .line 305
    invoke-static {p2, p1, p0, p3}, Loq;->e(IILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 306
    .line 307
    .line 308
    move-result-object p0

    .line 309
    invoke-static {p0}, Lz0;->b(Ljava/lang/Object;)V

    .line 310
    .line 311
    .line 312
    return-void

    .line 313
    :cond_a
    const-string p0, "beginIndex < 0: "

    .line 314
    .line 315
    invoke-static {p1, p0}, Loq;->f(ILjava/lang/String;)Ljava/lang/String;

    .line 316
    .line 317
    .line 318
    move-result-object p0

    .line 319
    invoke-static {p0}, Lz0;->b(Ljava/lang/Object;)V

    .line 320
    .line 321
    .line 322
    return-void
.end method

.method public final F(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {p0, v0, v1, p1}, Leh;->E(IILjava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final G(I)V
    .locals 14

    .line 1
    const/16 v0, 0x80

    .line 2
    .line 3
    if-ge p1, v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Leh;->z(I)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const/16 v1, 0x800

    .line 10
    .line 11
    const/4 v2, 0x2

    .line 12
    const/16 v3, 0x3f

    .line 13
    .line 14
    if-ge p1, v1, :cond_1

    .line 15
    .line 16
    invoke-virtual {p0, v2}, Leh;->v(I)Lp31;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    iget-object v4, v1, Lp31;->a:[B

    .line 21
    .line 22
    iget v5, v1, Lp31;->c:I

    .line 23
    .line 24
    shr-int/lit8 v6, p1, 0x6

    .line 25
    .line 26
    or-int/lit16 v6, v6, 0xc0

    .line 27
    .line 28
    int-to-byte v6, v6

    .line 29
    aput-byte v6, v4, v5

    .line 30
    .line 31
    add-int/lit8 v6, v5, 0x1

    .line 32
    .line 33
    and-int/2addr p1, v3

    .line 34
    or-int/2addr p1, v0

    .line 35
    int-to-byte p1, p1

    .line 36
    aput-byte p1, v4, v6

    .line 37
    .line 38
    add-int/2addr v5, v2

    .line 39
    iput v5, v1, Lp31;->c:I

    .line 40
    .line 41
    iget-wide v0, p0, Leh;->k:J

    .line 42
    .line 43
    const-wide/16 v2, 0x2

    .line 44
    .line 45
    add-long/2addr v0, v2

    .line 46
    iput-wide v0, p0, Leh;->k:J

    .line 47
    .line 48
    return-void

    .line 49
    :cond_1
    const v1, 0xd800

    .line 50
    .line 51
    .line 52
    if-gt v1, p1, :cond_2

    .line 53
    .line 54
    const v1, 0xe000

    .line 55
    .line 56
    .line 57
    if-ge p1, v1, :cond_2

    .line 58
    .line 59
    invoke-virtual {p0, v3}, Leh;->z(I)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_2
    const/high16 v1, 0x10000

    .line 64
    .line 65
    const/4 v4, 0x3

    .line 66
    if-ge p1, v1, :cond_3

    .line 67
    .line 68
    invoke-virtual {p0, v4}, Leh;->v(I)Lp31;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    iget-object v2, v1, Lp31;->a:[B

    .line 73
    .line 74
    iget v5, v1, Lp31;->c:I

    .line 75
    .line 76
    shr-int/lit8 v6, p1, 0xc

    .line 77
    .line 78
    or-int/lit16 v6, v6, 0xe0

    .line 79
    .line 80
    int-to-byte v6, v6

    .line 81
    aput-byte v6, v2, v5

    .line 82
    .line 83
    add-int/lit8 v6, v5, 0x1

    .line 84
    .line 85
    shr-int/lit8 v7, p1, 0x6

    .line 86
    .line 87
    and-int/2addr v7, v3

    .line 88
    or-int/2addr v7, v0

    .line 89
    int-to-byte v7, v7

    .line 90
    aput-byte v7, v2, v6

    .line 91
    .line 92
    add-int/lit8 v6, v5, 0x2

    .line 93
    .line 94
    and-int/2addr p1, v3

    .line 95
    or-int/2addr p1, v0

    .line 96
    int-to-byte p1, p1

    .line 97
    aput-byte p1, v2, v6

    .line 98
    .line 99
    add-int/2addr v5, v4

    .line 100
    iput v5, v1, Lp31;->c:I

    .line 101
    .line 102
    iget-wide v0, p0, Leh;->k:J

    .line 103
    .line 104
    const-wide/16 v2, 0x3

    .line 105
    .line 106
    add-long/2addr v0, v2

    .line 107
    iput-wide v0, p0, Leh;->k:J

    .line 108
    .line 109
    return-void

    .line 110
    :cond_3
    const v1, 0x10ffff

    .line 111
    .line 112
    .line 113
    const/4 v5, 0x4

    .line 114
    if-gt p1, v1, :cond_4

    .line 115
    .line 116
    invoke-virtual {p0, v5}, Leh;->v(I)Lp31;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    iget-object v2, v1, Lp31;->a:[B

    .line 121
    .line 122
    iget v4, v1, Lp31;->c:I

    .line 123
    .line 124
    shr-int/lit8 v6, p1, 0x12

    .line 125
    .line 126
    or-int/lit16 v6, v6, 0xf0

    .line 127
    .line 128
    int-to-byte v6, v6

    .line 129
    aput-byte v6, v2, v4

    .line 130
    .line 131
    add-int/lit8 v6, v4, 0x1

    .line 132
    .line 133
    shr-int/lit8 v7, p1, 0xc

    .line 134
    .line 135
    and-int/2addr v7, v3

    .line 136
    or-int/2addr v7, v0

    .line 137
    int-to-byte v7, v7

    .line 138
    aput-byte v7, v2, v6

    .line 139
    .line 140
    add-int/lit8 v6, v4, 0x2

    .line 141
    .line 142
    shr-int/lit8 v7, p1, 0x6

    .line 143
    .line 144
    and-int/2addr v7, v3

    .line 145
    or-int/2addr v7, v0

    .line 146
    int-to-byte v7, v7

    .line 147
    aput-byte v7, v2, v6

    .line 148
    .line 149
    add-int/lit8 v6, v4, 0x3

    .line 150
    .line 151
    and-int/2addr p1, v3

    .line 152
    or-int/2addr p1, v0

    .line 153
    int-to-byte p1, p1

    .line 154
    aput-byte p1, v2, v6

    .line 155
    .line 156
    add-int/2addr v4, v5

    .line 157
    iput v4, v1, Lp31;->c:I

    .line 158
    .line 159
    iget-wide v0, p0, Leh;->k:J

    .line 160
    .line 161
    const-wide/16 v2, 0x4

    .line 162
    .line 163
    add-long/2addr v0, v2

    .line 164
    iput-wide v0, p0, Leh;->k:J

    .line 165
    .line 166
    return-void

    .line 167
    :cond_4
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 168
    .line 169
    new-instance v0, Ljava/lang/StringBuilder;

    .line 170
    .line 171
    const-string v1, "Unexpected code point: 0x"

    .line 172
    .line 173
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 174
    .line 175
    .line 176
    if-eqz p1, :cond_6

    .line 177
    .line 178
    sget-object v1, Lml;->b:[C

    .line 179
    .line 180
    shr-int/lit8 v3, p1, 0x1c

    .line 181
    .line 182
    and-int/lit8 v3, v3, 0xf

    .line 183
    .line 184
    aget-char v3, v1, v3

    .line 185
    .line 186
    shr-int/lit8 v6, p1, 0x18

    .line 187
    .line 188
    and-int/lit8 v6, v6, 0xf

    .line 189
    .line 190
    aget-char v6, v1, v6

    .line 191
    .line 192
    shr-int/lit8 v7, p1, 0x14

    .line 193
    .line 194
    and-int/lit8 v7, v7, 0xf

    .line 195
    .line 196
    aget-char v7, v1, v7

    .line 197
    .line 198
    shr-int/lit8 v8, p1, 0x10

    .line 199
    .line 200
    and-int/lit8 v8, v8, 0xf

    .line 201
    .line 202
    aget-char v8, v1, v8

    .line 203
    .line 204
    shr-int/lit8 v9, p1, 0xc

    .line 205
    .line 206
    and-int/lit8 v9, v9, 0xf

    .line 207
    .line 208
    aget-char v9, v1, v9

    .line 209
    .line 210
    shr-int/lit8 v10, p1, 0x8

    .line 211
    .line 212
    and-int/lit8 v10, v10, 0xf

    .line 213
    .line 214
    aget-char v10, v1, v10

    .line 215
    .line 216
    shr-int/lit8 v11, p1, 0x4

    .line 217
    .line 218
    and-int/lit8 v11, v11, 0xf

    .line 219
    .line 220
    aget-char v11, v1, v11

    .line 221
    .line 222
    and-int/lit8 p1, p1, 0xf

    .line 223
    .line 224
    aget-char p1, v1, p1

    .line 225
    .line 226
    const/16 v1, 0x8

    .line 227
    .line 228
    new-array v12, v1, [C

    .line 229
    .line 230
    const/4 v13, 0x0

    .line 231
    aput-char v3, v12, v13

    .line 232
    .line 233
    const/4 v3, 0x1

    .line 234
    aput-char v6, v12, v3

    .line 235
    .line 236
    aput-char v7, v12, v2

    .line 237
    .line 238
    aput-char v8, v12, v4

    .line 239
    .line 240
    aput-char v9, v12, v5

    .line 241
    .line 242
    const/4 v2, 0x5

    .line 243
    aput-char v10, v12, v2

    .line 244
    .line 245
    const/4 v2, 0x6

    .line 246
    aput-char v11, v12, v2

    .line 247
    .line 248
    const/4 v2, 0x7

    .line 249
    aput-char p1, v12, v2

    .line 250
    .line 251
    :goto_0
    if-ge v13, v1, :cond_5

    .line 252
    .line 253
    aget-char p1, v12, v13

    .line 254
    .line 255
    const/16 v2, 0x30

    .line 256
    .line 257
    if-ne p1, v2, :cond_5

    .line 258
    .line 259
    add-int/lit8 v13, v13, 0x1

    .line 260
    .line 261
    goto :goto_0

    .line 262
    :cond_5
    invoke-static {v13, v1, v1}, Lbe2;->d(III)V

    .line 263
    .line 264
    .line 265
    new-instance p1, Ljava/lang/String;

    .line 266
    .line 267
    rsub-int/lit8 v1, v13, 0x8

    .line 268
    .line 269
    invoke-direct {p1, v12, v13, v1}, Ljava/lang/String;-><init>([CII)V

    .line 270
    .line 271
    .line 272
    goto :goto_1

    .line 273
    :cond_6
    const-string p1, "0"

    .line 274
    .line 275
    :goto_1
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 276
    .line 277
    .line 278
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 279
    .line 280
    .line 281
    move-result-object p1

    .line 282
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 283
    .line 284
    .line 285
    throw p0
.end method

.method public final a(Leh;JJ)V
    .locals 6

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-wide v0, p0, Leh;->k:J

    .line 5
    .line 6
    move-wide v2, p2

    .line 7
    move-wide v4, p4

    .line 8
    invoke-static/range {v0 .. v5}, Lkp1;->b(JJJ)V

    .line 9
    .line 10
    .line 11
    const-wide/16 p2, 0x0

    .line 12
    .line 13
    cmp-long p4, v4, p2

    .line 14
    .line 15
    if-nez p4, :cond_0

    .line 16
    .line 17
    goto :goto_3

    .line 18
    :cond_0
    iget-wide p4, p1, Leh;->k:J

    .line 19
    .line 20
    add-long/2addr p4, v4

    .line 21
    iput-wide p4, p1, Leh;->k:J

    .line 22
    .line 23
    iget-object p0, p0, Leh;->j:Lp31;

    .line 24
    .line 25
    :goto_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 26
    .line 27
    .line 28
    iget p4, p0, Lp31;->c:I

    .line 29
    .line 30
    iget p5, p0, Lp31;->b:I

    .line 31
    .line 32
    sub-int/2addr p4, p5

    .line 33
    int-to-long p4, p4

    .line 34
    cmp-long v0, v2, p4

    .line 35
    .line 36
    if-ltz v0, :cond_1

    .line 37
    .line 38
    sub-long/2addr v2, p4

    .line 39
    iget-object p0, p0, Lp31;->f:Lp31;

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    move-wide p4, v4

    .line 43
    :goto_1
    cmp-long v0, p4, p2

    .line 44
    .line 45
    if-lez v0, :cond_3

    .line 46
    .line 47
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0}, Lp31;->c()Lp31;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    iget v1, v0, Lp31;->b:I

    .line 55
    .line 56
    long-to-int v2, v2

    .line 57
    add-int/2addr v1, v2

    .line 58
    iput v1, v0, Lp31;->b:I

    .line 59
    .line 60
    long-to-int v2, p4

    .line 61
    add-int/2addr v1, v2

    .line 62
    iget v2, v0, Lp31;->c:I

    .line 63
    .line 64
    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    iput v1, v0, Lp31;->c:I

    .line 69
    .line 70
    iget-object v1, p1, Leh;->j:Lp31;

    .line 71
    .line 72
    if-nez v1, :cond_2

    .line 73
    .line 74
    iput-object v0, v0, Lp31;->g:Lp31;

    .line 75
    .line 76
    iput-object v0, v0, Lp31;->f:Lp31;

    .line 77
    .line 78
    iput-object v0, p1, Leh;->j:Lp31;

    .line 79
    .line 80
    goto :goto_2

    .line 81
    :cond_2
    iget-object v1, v1, Lp31;->g:Lp31;

    .line 82
    .line 83
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 84
    .line 85
    .line 86
    invoke-virtual {v1, v0}, Lp31;->b(Lp31;)V

    .line 87
    .line 88
    .line 89
    :goto_2
    iget v1, v0, Lp31;->c:I

    .line 90
    .line 91
    iget v0, v0, Lp31;->b:I

    .line 92
    .line 93
    sub-int/2addr v1, v0

    .line 94
    int-to-long v0, v1

    .line 95
    sub-long/2addr p4, v0

    .line 96
    iget-object p0, p0, Lp31;->f:Lp31;

    .line 97
    .line 98
    move-wide v2, p2

    .line 99
    goto :goto_1

    .line 100
    :cond_3
    :goto_3
    return-void
.end method

.method public final b()Lnc1;
    .locals 0

    .line 1
    sget-object p0, Lnc1;->d:Lmc1;

    .line 2
    .line 3
    return-object p0
.end method

.method public final c(JLeh;)J
    .locals 4

    .line 1
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    cmp-long v2, p1, v0

    .line 7
    .line 8
    if-ltz v2, :cond_2

    .line 9
    .line 10
    iget-wide v2, p0, Leh;->k:J

    .line 11
    .line 12
    cmp-long v0, v2, v0

    .line 13
    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    const-wide/16 p0, -0x1

    .line 17
    .line 18
    return-wide p0

    .line 19
    :cond_0
    cmp-long v0, p1, v2

    .line 20
    .line 21
    if-lez v0, :cond_1

    .line 22
    .line 23
    move-wide p1, v2

    .line 24
    :cond_1
    invoke-virtual {p3, p1, p2, p0}, Leh;->i(JLeh;)V

    .line 25
    .line 26
    .line 27
    return-wide p1

    .line 28
    :cond_2
    const-string p0, "byteCount < 0: "

    .line 29
    .line 30
    invoke-static {p0, p1, p2}, Lz0;->e(Ljava/lang/String;J)V

    .line 31
    .line 32
    .line 33
    return-wide v0
.end method

.method public final clone()Ljava/lang/Object;
    .locals 6

    .line 1
    new-instance v0, Leh;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-wide v1, p0, Leh;->k:J

    .line 7
    .line 8
    const-wide/16 v3, 0x0

    .line 9
    .line 10
    cmp-long v1, v1, v3

    .line 11
    .line 12
    if-nez v1, :cond_0

    .line 13
    .line 14
    return-object v0

    .line 15
    :cond_0
    iget-object v1, p0, Leh;->j:Lp31;

    .line 16
    .line 17
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1}, Lp31;->c()Lp31;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    iput-object v2, v0, Leh;->j:Lp31;

    .line 25
    .line 26
    iput-object v2, v2, Lp31;->g:Lp31;

    .line 27
    .line 28
    iput-object v2, v2, Lp31;->f:Lp31;

    .line 29
    .line 30
    iget-object v3, v1, Lp31;->f:Lp31;

    .line 31
    .line 32
    :goto_0
    if-eq v3, v1, :cond_1

    .line 33
    .line 34
    iget-object v4, v2, Lp31;->g:Lp31;

    .line 35
    .line 36
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v3}, Lp31;->c()Lp31;

    .line 43
    .line 44
    .line 45
    move-result-object v5

    .line 46
    invoke-virtual {v4, v5}, Lp31;->b(Lp31;)V

    .line 47
    .line 48
    .line 49
    iget-object v3, v3, Lp31;->f:Lp31;

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_1
    iget-wide v1, p0, Leh;->k:J

    .line 53
    .line 54
    iput-wide v1, v0, Leh;->k:J

    .line 55
    .line 56
    return-object v0
.end method

.method public final close()V
    .locals 0

    .line 1
    return-void
.end method

.method public final d(JLth;)Z
    .locals 7

    .line 1
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p3}, Lth;->c()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const-wide/16 v1, 0x0

    .line 9
    .line 10
    cmp-long v1, p1, v1

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    if-ltz v1, :cond_3

    .line 14
    .line 15
    if-ltz v0, :cond_3

    .line 16
    .line 17
    iget-wide v3, p0, Leh;->k:J

    .line 18
    .line 19
    sub-long/2addr v3, p1

    .line 20
    int-to-long v5, v0

    .line 21
    cmp-long v1, v3, v5

    .line 22
    .line 23
    if-ltz v1, :cond_3

    .line 24
    .line 25
    invoke-virtual {p3}, Lth;->c()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-ge v1, v0, :cond_0

    .line 30
    .line 31
    goto :goto_1

    .line 32
    :cond_0
    move v1, v2

    .line 33
    :goto_0
    if-ge v1, v0, :cond_2

    .line 34
    .line 35
    int-to-long v3, v1

    .line 36
    add-long/2addr v3, p1

    .line 37
    invoke-virtual {p0, v3, v4}, Leh;->h(J)B

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    invoke-virtual {p3, v1}, Lth;->f(I)B

    .line 42
    .line 43
    .line 44
    move-result v4

    .line 45
    if-eq v3, v4, :cond_1

    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_2
    const/4 p0, 0x1

    .line 52
    return p0

    .line 53
    :cond_3
    :goto_1
    return v2
.end method

.method public final e(J)Lth;
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    if-ltz v0, :cond_2

    .line 6
    .line 7
    const-wide/32 v0, 0x7fffffff

    .line 8
    .line 9
    .line 10
    cmp-long v0, p1, v0

    .line 11
    .line 12
    if-gtz v0, :cond_2

    .line 13
    .line 14
    iget-wide v0, p0, Leh;->k:J

    .line 15
    .line 16
    cmp-long v0, v0, p1

    .line 17
    .line 18
    if-ltz v0, :cond_1

    .line 19
    .line 20
    const-wide/16 v0, 0x1000

    .line 21
    .line 22
    cmp-long v0, p1, v0

    .line 23
    .line 24
    if-ltz v0, :cond_0

    .line 25
    .line 26
    long-to-int v0, p1

    .line 27
    invoke-virtual {p0, v0}, Leh;->u(I)Lth;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {p0, p1, p2}, Leh;->skip(J)V

    .line 32
    .line 33
    .line 34
    return-object v0

    .line 35
    :cond_0
    new-instance v0, Lth;

    .line 36
    .line 37
    invoke-virtual {p0, p1, p2}, Leh;->l(J)[B

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-direct {v0, p0}, Lth;-><init>([B)V

    .line 42
    .line 43
    .line 44
    return-object v0

    .line 45
    :cond_1
    new-instance p0, Ljava/io/EOFException;

    .line 46
    .line 47
    invoke-direct {p0}, Ljava/io/EOFException;-><init>()V

    .line 48
    .line 49
    .line 50
    throw p0

    .line 51
    :cond_2
    const-string p0, "byteCount: "

    .line 52
    .line 53
    invoke-static {p0, p1, p2}, Lz0;->e(Ljava/lang/String;J)V

    .line 54
    .line 55
    .line 56
    const/4 p0, 0x0

    .line 57
    return-object p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    return v2

    .line 9
    :cond_0
    instance-of v3, v1, Leh;

    .line 10
    .line 11
    const/4 v4, 0x0

    .line 12
    if-nez v3, :cond_1

    .line 13
    .line 14
    return v4

    .line 15
    :cond_1
    iget-wide v5, v0, Leh;->k:J

    .line 16
    .line 17
    check-cast v1, Leh;

    .line 18
    .line 19
    iget-wide v7, v1, Leh;->k:J

    .line 20
    .line 21
    cmp-long v3, v5, v7

    .line 22
    .line 23
    if-eqz v3, :cond_2

    .line 24
    .line 25
    return v4

    .line 26
    :cond_2
    const-wide/16 v7, 0x0

    .line 27
    .line 28
    cmp-long v3, v5, v7

    .line 29
    .line 30
    if-nez v3, :cond_3

    .line 31
    .line 32
    return v2

    .line 33
    :cond_3
    iget-object v3, v0, Leh;->j:Lp31;

    .line 34
    .line 35
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 36
    .line 37
    .line 38
    iget-object v1, v1, Leh;->j:Lp31;

    .line 39
    .line 40
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 41
    .line 42
    .line 43
    iget v5, v3, Lp31;->b:I

    .line 44
    .line 45
    iget v6, v1, Lp31;->b:I

    .line 46
    .line 47
    move-wide v9, v7

    .line 48
    :goto_0
    iget-wide v11, v0, Leh;->k:J

    .line 49
    .line 50
    cmp-long v11, v9, v11

    .line 51
    .line 52
    if-gez v11, :cond_8

    .line 53
    .line 54
    iget v11, v3, Lp31;->c:I

    .line 55
    .line 56
    sub-int/2addr v11, v5

    .line 57
    iget v12, v1, Lp31;->c:I

    .line 58
    .line 59
    sub-int/2addr v12, v6

    .line 60
    invoke-static {v11, v12}, Ljava/lang/Math;->min(II)I

    .line 61
    .line 62
    .line 63
    move-result v11

    .line 64
    int-to-long v11, v11

    .line 65
    move-wide v13, v7

    .line 66
    :goto_1
    cmp-long v15, v13, v11

    .line 67
    .line 68
    if-gez v15, :cond_5

    .line 69
    .line 70
    iget-object v15, v3, Lp31;->a:[B

    .line 71
    .line 72
    add-int/lit8 v16, v5, 0x1

    .line 73
    .line 74
    aget-byte v5, v15, v5

    .line 75
    .line 76
    iget-object v15, v1, Lp31;->a:[B

    .line 77
    .line 78
    add-int/lit8 v17, v6, 0x1

    .line 79
    .line 80
    aget-byte v6, v15, v6

    .line 81
    .line 82
    if-eq v5, v6, :cond_4

    .line 83
    .line 84
    return v4

    .line 85
    :cond_4
    const-wide/16 v5, 0x1

    .line 86
    .line 87
    add-long/2addr v13, v5

    .line 88
    move/from16 v5, v16

    .line 89
    .line 90
    move/from16 v6, v17

    .line 91
    .line 92
    goto :goto_1

    .line 93
    :cond_5
    iget v13, v3, Lp31;->c:I

    .line 94
    .line 95
    if-ne v5, v13, :cond_6

    .line 96
    .line 97
    iget-object v3, v3, Lp31;->f:Lp31;

    .line 98
    .line 99
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 100
    .line 101
    .line 102
    iget v5, v3, Lp31;->b:I

    .line 103
    .line 104
    :cond_6
    iget v13, v1, Lp31;->c:I

    .line 105
    .line 106
    if-ne v6, v13, :cond_7

    .line 107
    .line 108
    iget-object v1, v1, Lp31;->f:Lp31;

    .line 109
    .line 110
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 111
    .line 112
    .line 113
    iget v6, v1, Lp31;->b:I

    .line 114
    .line 115
    :cond_7
    add-long/2addr v9, v11

    .line 116
    goto :goto_0

    .line 117
    :cond_8
    return v2
.end method

.method public final f()Ljava/lang/String;
    .locals 2

    .line 1
    const-wide v0, 0x7fffffffffffffffL

    .line 2
    .line 3
    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0, v1}, Leh;->k(J)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public final flush()V
    .locals 0

    .line 1
    return-void
.end method

.method public final g()Z
    .locals 4

    .line 1
    iget-wide v0, p0, Leh;->k:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long p0, v0, v2

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public final h(J)B
    .locals 6

    .line 1
    iget-wide v0, p0, Leh;->k:J

    .line 2
    .line 3
    const-wide/16 v4, 0x1

    .line 4
    .line 5
    move-wide v2, p1

    .line 6
    invoke-static/range {v0 .. v5}, Lkp1;->b(JJJ)V

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Leh;->j:Lp31;

    .line 10
    .line 11
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    iget-wide v0, p0, Leh;->k:J

    .line 15
    .line 16
    sub-long v4, v0, v2

    .line 17
    .line 18
    cmp-long p0, v4, v2

    .line 19
    .line 20
    if-gez p0, :cond_1

    .line 21
    .line 22
    :goto_0
    cmp-long p0, v0, v2

    .line 23
    .line 24
    if-lez p0, :cond_0

    .line 25
    .line 26
    iget-object p1, p1, Lp31;->g:Lp31;

    .line 27
    .line 28
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 29
    .line 30
    .line 31
    iget p0, p1, Lp31;->c:I

    .line 32
    .line 33
    iget p2, p1, Lp31;->b:I

    .line 34
    .line 35
    sub-int/2addr p0, p2

    .line 36
    int-to-long v4, p0

    .line 37
    sub-long/2addr v0, v4

    .line 38
    goto :goto_0

    .line 39
    :cond_0
    iget-object p0, p1, Lp31;->a:[B

    .line 40
    .line 41
    iget p1, p1, Lp31;->b:I

    .line 42
    .line 43
    int-to-long p1, p1

    .line 44
    add-long/2addr p1, v2

    .line 45
    sub-long/2addr p1, v0

    .line 46
    long-to-int p1, p1

    .line 47
    aget-byte p0, p0, p1

    .line 48
    .line 49
    return p0

    .line 50
    :cond_1
    const-wide/16 v0, 0x0

    .line 51
    .line 52
    :goto_1
    iget p0, p1, Lp31;->c:I

    .line 53
    .line 54
    iget p2, p1, Lp31;->b:I

    .line 55
    .line 56
    sub-int/2addr p0, p2

    .line 57
    int-to-long v4, p0

    .line 58
    add-long/2addr v4, v0

    .line 59
    cmp-long p0, v4, v2

    .line 60
    .line 61
    if-gtz p0, :cond_2

    .line 62
    .line 63
    iget-object p1, p1, Lp31;->f:Lp31;

    .line 64
    .line 65
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 66
    .line 67
    .line 68
    move-wide v0, v4

    .line 69
    goto :goto_1

    .line 70
    :cond_2
    iget-object p0, p1, Lp31;->a:[B

    .line 71
    .line 72
    int-to-long p1, p2

    .line 73
    add-long/2addr p1, v2

    .line 74
    sub-long/2addr p1, v0

    .line 75
    long-to-int p1, p1

    .line 76
    aget-byte p0, p0, p1

    .line 77
    .line 78
    return p0
.end method

.method public final hashCode()I
    .locals 5

    .line 1
    iget-object v0, p0, Leh;->j:Lp31;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 v1, 0x1

    .line 8
    :cond_1
    iget v2, v0, Lp31;->b:I

    .line 9
    .line 10
    iget v3, v0, Lp31;->c:I

    .line 11
    .line 12
    :goto_0
    if-ge v2, v3, :cond_2

    .line 13
    .line 14
    mul-int/lit8 v1, v1, 0x1f

    .line 15
    .line 16
    iget-object v4, v0, Lp31;->a:[B

    .line 17
    .line 18
    aget-byte v4, v4, v2

    .line 19
    .line 20
    add-int/2addr v1, v4

    .line 21
    add-int/lit8 v2, v2, 0x1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_2
    iget-object v0, v0, Lp31;->f:Lp31;

    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 27
    .line 28
    .line 29
    iget-object v2, p0, Leh;->j:Lp31;

    .line 30
    .line 31
    if-ne v0, v2, :cond_1

    .line 32
    .line 33
    return v1
.end method

.method public final i(JLeh;)V
    .locals 8

    .line 1
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    if-eq p3, p0, :cond_c

    .line 5
    .line 6
    iget-wide v0, p3, Leh;->k:J

    .line 7
    .line 8
    const-wide/16 v2, 0x0

    .line 9
    .line 10
    move-wide v4, p1

    .line 11
    invoke-static/range {v0 .. v5}, Lkp1;->b(JJJ)V

    .line 12
    .line 13
    .line 14
    :goto_0
    const-wide/16 v0, 0x0

    .line 15
    .line 16
    cmp-long v0, p1, v0

    .line 17
    .line 18
    if-lez v0, :cond_b

    .line 19
    .line 20
    iget-object v0, p3, Leh;->j:Lp31;

    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 23
    .line 24
    .line 25
    iget v0, v0, Lp31;->c:I

    .line 26
    .line 27
    iget-object v1, p3, Leh;->j:Lp31;

    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 30
    .line 31
    .line 32
    iget v1, v1, Lp31;->b:I

    .line 33
    .line 34
    sub-int/2addr v0, v1

    .line 35
    int-to-long v0, v0

    .line 36
    cmp-long v0, p1, v0

    .line 37
    .line 38
    const/4 v1, 0x0

    .line 39
    if-gez v0, :cond_5

    .line 40
    .line 41
    iget-object v0, p0, Leh;->j:Lp31;

    .line 42
    .line 43
    if-eqz v0, :cond_0

    .line 44
    .line 45
    iget-object v0, v0, Lp31;->g:Lp31;

    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_0
    const/4 v0, 0x0

    .line 49
    :goto_1
    if-eqz v0, :cond_2

    .line 50
    .line 51
    iget-boolean v2, v0, Lp31;->e:Z

    .line 52
    .line 53
    if-eqz v2, :cond_2

    .line 54
    .line 55
    iget v2, v0, Lp31;->c:I

    .line 56
    .line 57
    int-to-long v2, v2

    .line 58
    add-long/2addr v2, p1

    .line 59
    iget-boolean v4, v0, Lp31;->d:Z

    .line 60
    .line 61
    if-eqz v4, :cond_1

    .line 62
    .line 63
    move v4, v1

    .line 64
    goto :goto_2

    .line 65
    :cond_1
    iget v4, v0, Lp31;->b:I

    .line 66
    .line 67
    :goto_2
    int-to-long v4, v4

    .line 68
    sub-long/2addr v2, v4

    .line 69
    const-wide/16 v4, 0x2000

    .line 70
    .line 71
    cmp-long v2, v2, v4

    .line 72
    .line 73
    if-gtz v2, :cond_2

    .line 74
    .line 75
    iget-object v1, p3, Leh;->j:Lp31;

    .line 76
    .line 77
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 78
    .line 79
    .line 80
    long-to-int v2, p1

    .line 81
    invoke-virtual {v1, v0, v2}, Lp31;->d(Lp31;I)V

    .line 82
    .line 83
    .line 84
    iget-wide v0, p3, Leh;->k:J

    .line 85
    .line 86
    sub-long/2addr v0, p1

    .line 87
    iput-wide v0, p3, Leh;->k:J

    .line 88
    .line 89
    iget-wide v0, p0, Leh;->k:J

    .line 90
    .line 91
    add-long/2addr v0, p1

    .line 92
    iput-wide v0, p0, Leh;->k:J

    .line 93
    .line 94
    return-void

    .line 95
    :cond_2
    iget-object v0, p3, Leh;->j:Lp31;

    .line 96
    .line 97
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 98
    .line 99
    .line 100
    long-to-int v2, p1

    .line 101
    if-lez v2, :cond_4

    .line 102
    .line 103
    iget v3, v0, Lp31;->c:I

    .line 104
    .line 105
    iget v4, v0, Lp31;->b:I

    .line 106
    .line 107
    sub-int/2addr v3, v4

    .line 108
    if-gt v2, v3, :cond_4

    .line 109
    .line 110
    const/16 v3, 0x400

    .line 111
    .line 112
    if-lt v2, v3, :cond_3

    .line 113
    .line 114
    invoke-virtual {v0}, Lp31;->c()Lp31;

    .line 115
    .line 116
    .line 117
    move-result-object v3

    .line 118
    goto :goto_3

    .line 119
    :cond_3
    invoke-static {}, Lr31;->b()Lp31;

    .line 120
    .line 121
    .line 122
    move-result-object v3

    .line 123
    iget-object v4, v0, Lp31;->a:[B

    .line 124
    .line 125
    iget-object v5, v3, Lp31;->a:[B

    .line 126
    .line 127
    iget v6, v0, Lp31;->b:I

    .line 128
    .line 129
    add-int v7, v6, v2

    .line 130
    .line 131
    invoke-static {v1, v6, v7, v4, v5}, Lia;->M(III[B[B)V

    .line 132
    .line 133
    .line 134
    :goto_3
    iget v4, v3, Lp31;->b:I

    .line 135
    .line 136
    add-int/2addr v4, v2

    .line 137
    iput v4, v3, Lp31;->c:I

    .line 138
    .line 139
    iget v4, v0, Lp31;->b:I

    .line 140
    .line 141
    add-int/2addr v4, v2

    .line 142
    iput v4, v0, Lp31;->b:I

    .line 143
    .line 144
    iget-object v0, v0, Lp31;->g:Lp31;

    .line 145
    .line 146
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 147
    .line 148
    .line 149
    invoke-virtual {v0, v3}, Lp31;->b(Lp31;)V

    .line 150
    .line 151
    .line 152
    iput-object v3, p3, Leh;->j:Lp31;

    .line 153
    .line 154
    goto :goto_4

    .line 155
    :cond_4
    const-string p0, "byteCount out of range"

    .line 156
    .line 157
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 158
    .line 159
    .line 160
    return-void

    .line 161
    :cond_5
    :goto_4
    iget-object v0, p3, Leh;->j:Lp31;

    .line 162
    .line 163
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 164
    .line 165
    .line 166
    iget v2, v0, Lp31;->c:I

    .line 167
    .line 168
    iget v3, v0, Lp31;->b:I

    .line 169
    .line 170
    sub-int/2addr v2, v3

    .line 171
    int-to-long v2, v2

    .line 172
    invoke-virtual {v0}, Lp31;->a()Lp31;

    .line 173
    .line 174
    .line 175
    move-result-object v4

    .line 176
    iput-object v4, p3, Leh;->j:Lp31;

    .line 177
    .line 178
    iget-object v4, p0, Leh;->j:Lp31;

    .line 179
    .line 180
    if-nez v4, :cond_6

    .line 181
    .line 182
    iput-object v0, p0, Leh;->j:Lp31;

    .line 183
    .line 184
    iput-object v0, v0, Lp31;->g:Lp31;

    .line 185
    .line 186
    iput-object v0, v0, Lp31;->f:Lp31;

    .line 187
    .line 188
    goto :goto_6

    .line 189
    :cond_6
    iget-object v4, v4, Lp31;->g:Lp31;

    .line 190
    .line 191
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 192
    .line 193
    .line 194
    invoke-virtual {v4, v0}, Lp31;->b(Lp31;)V

    .line 195
    .line 196
    .line 197
    iget-object v4, v0, Lp31;->g:Lp31;

    .line 198
    .line 199
    if-eq v4, v0, :cond_a

    .line 200
    .line 201
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 202
    .line 203
    .line 204
    iget-boolean v4, v4, Lp31;->e:Z

    .line 205
    .line 206
    if-nez v4, :cond_7

    .line 207
    .line 208
    goto :goto_6

    .line 209
    :cond_7
    iget v4, v0, Lp31;->c:I

    .line 210
    .line 211
    iget v5, v0, Lp31;->b:I

    .line 212
    .line 213
    sub-int/2addr v4, v5

    .line 214
    iget-object v5, v0, Lp31;->g:Lp31;

    .line 215
    .line 216
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 217
    .line 218
    .line 219
    iget v5, v5, Lp31;->c:I

    .line 220
    .line 221
    rsub-int v5, v5, 0x2000

    .line 222
    .line 223
    iget-object v6, v0, Lp31;->g:Lp31;

    .line 224
    .line 225
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 226
    .line 227
    .line 228
    iget-boolean v6, v6, Lp31;->d:Z

    .line 229
    .line 230
    if-eqz v6, :cond_8

    .line 231
    .line 232
    goto :goto_5

    .line 233
    :cond_8
    iget-object v1, v0, Lp31;->g:Lp31;

    .line 234
    .line 235
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 236
    .line 237
    .line 238
    iget v1, v1, Lp31;->b:I

    .line 239
    .line 240
    :goto_5
    add-int/2addr v5, v1

    .line 241
    if-le v4, v5, :cond_9

    .line 242
    .line 243
    goto :goto_6

    .line 244
    :cond_9
    iget-object v1, v0, Lp31;->g:Lp31;

    .line 245
    .line 246
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 247
    .line 248
    .line 249
    invoke-virtual {v0, v1, v4}, Lp31;->d(Lp31;I)V

    .line 250
    .line 251
    .line 252
    invoke-virtual {v0}, Lp31;->a()Lp31;

    .line 253
    .line 254
    .line 255
    invoke-static {v0}, Lr31;->a(Lp31;)V

    .line 256
    .line 257
    .line 258
    :goto_6
    iget-wide v0, p3, Leh;->k:J

    .line 259
    .line 260
    sub-long/2addr v0, v2

    .line 261
    iput-wide v0, p3, Leh;->k:J

    .line 262
    .line 263
    iget-wide v0, p0, Leh;->k:J

    .line 264
    .line 265
    add-long/2addr v0, v2

    .line 266
    iput-wide v0, p0, Leh;->k:J

    .line 267
    .line 268
    sub-long/2addr p1, v2

    .line 269
    goto/16 :goto_0

    .line 270
    .line 271
    :cond_a
    const-string p0, "cannot compact"

    .line 272
    .line 273
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 274
    .line 275
    .line 276
    :cond_b
    return-void

    .line 277
    :cond_c
    const-string p0, "source == this"

    .line 278
    .line 279
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 280
    .line 281
    .line 282
    return-void
.end method

.method public final isOpen()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public final j(BJJ)J
    .locals 8

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v2, v0, p2

    .line 4
    .line 5
    if-gtz v2, :cond_b

    .line 6
    .line 7
    cmp-long v2, p2, p4

    .line 8
    .line 9
    if-gtz v2, :cond_b

    .line 10
    .line 11
    iget-wide v2, p0, Leh;->k:J

    .line 12
    .line 13
    cmp-long v4, p4, v2

    .line 14
    .line 15
    if-lez v4, :cond_0

    .line 16
    .line 17
    move-wide p4, v2

    .line 18
    :cond_0
    cmp-long v4, p2, p4

    .line 19
    .line 20
    if-nez v4, :cond_1

    .line 21
    .line 22
    goto/16 :goto_6

    .line 23
    .line 24
    :cond_1
    iget-object p0, p0, Leh;->j:Lp31;

    .line 25
    .line 26
    if-nez p0, :cond_2

    .line 27
    .line 28
    goto/16 :goto_6

    .line 29
    .line 30
    :cond_2
    sub-long v4, v2, p2

    .line 31
    .line 32
    cmp-long v4, v4, p2

    .line 33
    .line 34
    if-gez v4, :cond_6

    .line 35
    .line 36
    :goto_0
    cmp-long v0, v2, p2

    .line 37
    .line 38
    if-lez v0, :cond_3

    .line 39
    .line 40
    iget-object p0, p0, Lp31;->g:Lp31;

    .line 41
    .line 42
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 43
    .line 44
    .line 45
    iget v0, p0, Lp31;->c:I

    .line 46
    .line 47
    iget v1, p0, Lp31;->b:I

    .line 48
    .line 49
    sub-int/2addr v0, v1

    .line 50
    int-to-long v0, v0

    .line 51
    sub-long/2addr v2, v0

    .line 52
    goto :goto_0

    .line 53
    :cond_3
    :goto_1
    cmp-long v0, v2, p4

    .line 54
    .line 55
    if-gez v0, :cond_a

    .line 56
    .line 57
    iget-object v0, p0, Lp31;->a:[B

    .line 58
    .line 59
    iget v1, p0, Lp31;->c:I

    .line 60
    .line 61
    int-to-long v4, v1

    .line 62
    iget v1, p0, Lp31;->b:I

    .line 63
    .line 64
    int-to-long v6, v1

    .line 65
    add-long/2addr v6, p4

    .line 66
    sub-long/2addr v6, v2

    .line 67
    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->min(JJ)J

    .line 68
    .line 69
    .line 70
    move-result-wide v4

    .line 71
    long-to-int v1, v4

    .line 72
    iget v4, p0, Lp31;->b:I

    .line 73
    .line 74
    int-to-long v4, v4

    .line 75
    add-long/2addr v4, p2

    .line 76
    sub-long/2addr v4, v2

    .line 77
    long-to-int p2, v4

    .line 78
    :goto_2
    if-ge p2, v1, :cond_5

    .line 79
    .line 80
    aget-byte p3, v0, p2

    .line 81
    .line 82
    if-ne p3, p1, :cond_4

    .line 83
    .line 84
    iget p0, p0, Lp31;->b:I

    .line 85
    .line 86
    sub-int/2addr p2, p0

    .line 87
    int-to-long p0, p2

    .line 88
    add-long/2addr p0, v2

    .line 89
    return-wide p0

    .line 90
    :cond_4
    add-int/lit8 p2, p2, 0x1

    .line 91
    .line 92
    goto :goto_2

    .line 93
    :cond_5
    iget p2, p0, Lp31;->c:I

    .line 94
    .line 95
    iget p3, p0, Lp31;->b:I

    .line 96
    .line 97
    sub-int/2addr p2, p3

    .line 98
    int-to-long p2, p2

    .line 99
    add-long/2addr v2, p2

    .line 100
    iget-object p0, p0, Lp31;->f:Lp31;

    .line 101
    .line 102
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 103
    .line 104
    .line 105
    move-wide p2, v2

    .line 106
    goto :goto_1

    .line 107
    :cond_6
    :goto_3
    iget v2, p0, Lp31;->c:I

    .line 108
    .line 109
    iget v3, p0, Lp31;->b:I

    .line 110
    .line 111
    sub-int/2addr v2, v3

    .line 112
    int-to-long v2, v2

    .line 113
    add-long/2addr v2, v0

    .line 114
    cmp-long v4, v2, p2

    .line 115
    .line 116
    if-gtz v4, :cond_7

    .line 117
    .line 118
    iget-object p0, p0, Lp31;->f:Lp31;

    .line 119
    .line 120
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 121
    .line 122
    .line 123
    move-wide v0, v2

    .line 124
    goto :goto_3

    .line 125
    :cond_7
    :goto_4
    cmp-long v2, v0, p4

    .line 126
    .line 127
    if-gez v2, :cond_a

    .line 128
    .line 129
    iget-object v2, p0, Lp31;->a:[B

    .line 130
    .line 131
    iget v3, p0, Lp31;->c:I

    .line 132
    .line 133
    int-to-long v3, v3

    .line 134
    iget v5, p0, Lp31;->b:I

    .line 135
    .line 136
    int-to-long v5, v5

    .line 137
    add-long/2addr v5, p4

    .line 138
    sub-long/2addr v5, v0

    .line 139
    invoke-static {v3, v4, v5, v6}, Ljava/lang/Math;->min(JJ)J

    .line 140
    .line 141
    .line 142
    move-result-wide v3

    .line 143
    long-to-int v3, v3

    .line 144
    iget v4, p0, Lp31;->b:I

    .line 145
    .line 146
    int-to-long v4, v4

    .line 147
    add-long/2addr v4, p2

    .line 148
    sub-long/2addr v4, v0

    .line 149
    long-to-int p2, v4

    .line 150
    :goto_5
    if-ge p2, v3, :cond_9

    .line 151
    .line 152
    aget-byte p3, v2, p2

    .line 153
    .line 154
    if-ne p3, p1, :cond_8

    .line 155
    .line 156
    iget p0, p0, Lp31;->b:I

    .line 157
    .line 158
    sub-int/2addr p2, p0

    .line 159
    int-to-long p0, p2

    .line 160
    add-long/2addr p0, v0

    .line 161
    return-wide p0

    .line 162
    :cond_8
    add-int/lit8 p2, p2, 0x1

    .line 163
    .line 164
    goto :goto_5

    .line 165
    :cond_9
    iget p2, p0, Lp31;->c:I

    .line 166
    .line 167
    iget p3, p0, Lp31;->b:I

    .line 168
    .line 169
    sub-int/2addr p2, p3

    .line 170
    int-to-long p2, p2

    .line 171
    add-long/2addr v0, p2

    .line 172
    iget-object p0, p0, Lp31;->f:Lp31;

    .line 173
    .line 174
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 175
    .line 176
    .line 177
    move-wide p2, v0

    .line 178
    goto :goto_4

    .line 179
    :cond_a
    :goto_6
    const-wide/16 p0, -0x1

    .line 180
    .line 181
    return-wide p0

    .line 182
    :cond_b
    iget-wide p0, p0, Leh;->k:J

    .line 183
    .line 184
    new-instance v0, Ljava/lang/StringBuilder;

    .line 185
    .line 186
    const-string v1, "size="

    .line 187
    .line 188
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 189
    .line 190
    .line 191
    invoke-virtual {v0, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 192
    .line 193
    .line 194
    const-string p0, " fromIndex="

    .line 195
    .line 196
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 197
    .line 198
    .line 199
    invoke-virtual {v0, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 200
    .line 201
    .line 202
    const-string p0, " toIndex="

    .line 203
    .line 204
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 205
    .line 206
    .line 207
    invoke-virtual {v0, p4, p5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 208
    .line 209
    .line 210
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 211
    .line 212
    .line 213
    move-result-object p0

    .line 214
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 215
    .line 216
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 217
    .line 218
    .line 219
    move-result-object p0

    .line 220
    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 221
    .line 222
    .line 223
    throw p1
.end method

.method public final k(J)Ljava/lang/String;
    .locals 11

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    if-ltz v0, :cond_3

    .line 6
    .line 7
    const-wide v0, 0x7fffffffffffffffL

    .line 8
    .line 9
    .line 10
    .line 11
    .line 12
    cmp-long v2, p1, v0

    .line 13
    .line 14
    const-wide/16 v7, 0x1

    .line 15
    .line 16
    if-nez v2, :cond_0

    .line 17
    .line 18
    :goto_0
    move-wide v4, v0

    .line 19
    goto :goto_1

    .line 20
    :cond_0
    add-long v0, p1, v7

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :goto_1
    const/16 v1, 0xa

    .line 24
    .line 25
    const-wide/16 v2, 0x0

    .line 26
    .line 27
    move-object v0, p0

    .line 28
    invoke-virtual/range {v0 .. v5}, Leh;->j(BJJ)J

    .line 29
    .line 30
    .line 31
    move-result-wide v1

    .line 32
    const-wide/16 v9, -0x1

    .line 33
    .line 34
    cmp-long v3, v1, v9

    .line 35
    .line 36
    if-eqz v3, :cond_1

    .line 37
    .line 38
    invoke-static {v1, v2, p0}, Lb;->a(JLeh;)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    return-object v0

    .line 43
    :cond_1
    iget-wide v1, p0, Leh;->k:J

    .line 44
    .line 45
    cmp-long v1, v4, v1

    .line 46
    .line 47
    if-gez v1, :cond_2

    .line 48
    .line 49
    sub-long v1, v4, v7

    .line 50
    .line 51
    invoke-virtual {p0, v1, v2}, Leh;->h(J)B

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    const/16 v2, 0xd

    .line 56
    .line 57
    if-ne v1, v2, :cond_2

    .line 58
    .line 59
    invoke-virtual {p0, v4, v5}, Leh;->h(J)B

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    const/16 v2, 0xa

    .line 64
    .line 65
    if-ne v1, v2, :cond_2

    .line 66
    .line 67
    invoke-static {v4, v5, p0}, Lb;->a(JLeh;)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    return-object v0

    .line 72
    :cond_2
    new-instance v1, Leh;

    .line 73
    .line 74
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 75
    .line 76
    .line 77
    iget-wide v2, p0, Leh;->k:J

    .line 78
    .line 79
    const-wide/16 v4, 0x20

    .line 80
    .line 81
    invoke-static {v4, v5, v2, v3}, Ljava/lang/Math;->min(JJ)J

    .line 82
    .line 83
    .line 84
    move-result-wide v4

    .line 85
    const-wide/16 v2, 0x0

    .line 86
    .line 87
    move-object v0, p0

    .line 88
    invoke-virtual/range {v0 .. v5}, Leh;->a(Leh;JJ)V

    .line 89
    .line 90
    .line 91
    new-instance v2, Ljava/io/EOFException;

    .line 92
    .line 93
    iget-wide v3, p0, Leh;->k:J

    .line 94
    .line 95
    invoke-static {v3, v4, p1, p2}, Ljava/lang/Math;->min(JJ)J

    .line 96
    .line 97
    .line 98
    move-result-wide v3

    .line 99
    iget-wide v5, v1, Leh;->k:J

    .line 100
    .line 101
    invoke-virtual {v1, v5, v6}, Leh;->e(J)Lth;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    invoke-virtual {v0}, Lth;->d()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    new-instance v1, Ljava/lang/StringBuilder;

    .line 110
    .line 111
    const-string v5, "\\n not found: limit="

    .line 112
    .line 113
    invoke-direct {v1, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {v1, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    const-string v3, " content="

    .line 120
    .line 121
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    const/16 v0, 0x2026

    .line 128
    .line 129
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    invoke-direct {v2, v0}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    throw v2

    .line 140
    :cond_3
    const-string v0, "limit < 0: "

    .line 141
    .line 142
    invoke-static {v0, p1, p2}, Lz0;->e(Ljava/lang/String;J)V

    .line 143
    .line 144
    .line 145
    const/4 v0, 0x0

    .line 146
    return-object v0
.end method

.method public final l(J)[B
    .locals 3

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    if-ltz v0, :cond_3

    .line 6
    .line 7
    const-wide/32 v0, 0x7fffffff

    .line 8
    .line 9
    .line 10
    cmp-long v0, p1, v0

    .line 11
    .line 12
    if-gtz v0, :cond_3

    .line 13
    .line 14
    iget-wide v0, p0, Leh;->k:J

    .line 15
    .line 16
    cmp-long v0, v0, p1

    .line 17
    .line 18
    if-ltz v0, :cond_2

    .line 19
    .line 20
    long-to-int p1, p1

    .line 21
    new-array p2, p1, [B

    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    :goto_0
    if-ge v0, p1, :cond_1

    .line 25
    .line 26
    sub-int v1, p1, v0

    .line 27
    .line 28
    invoke-virtual {p0, p2, v0, v1}, Leh;->read([BII)I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    const/4 v2, -0x1

    .line 33
    if-eq v1, v2, :cond_0

    .line 34
    .line 35
    add-int/2addr v0, v1

    .line 36
    goto :goto_0

    .line 37
    :cond_0
    new-instance p0, Ljava/io/EOFException;

    .line 38
    .line 39
    invoke-direct {p0}, Ljava/io/EOFException;-><init>()V

    .line 40
    .line 41
    .line 42
    throw p0

    .line 43
    :cond_1
    return-object p2

    .line 44
    :cond_2
    new-instance p0, Ljava/io/EOFException;

    .line 45
    .line 46
    invoke-direct {p0}, Ljava/io/EOFException;-><init>()V

    .line 47
    .line 48
    .line 49
    throw p0

    .line 50
    :cond_3
    const-string p0, "byteCount: "

    .line 51
    .line 52
    invoke-static {p0, p1, p2}, Lz0;->e(Ljava/lang/String;J)V

    .line 53
    .line 54
    .line 55
    const/4 p0, 0x0

    .line 56
    return-object p0
.end method

.method public final bridge synthetic m(Lth;)Lkh;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Leh;->x(Lth;)V

    .line 2
    .line 3
    .line 4
    return-object p0
.end method

.method public final n(J)V
    .locals 2

    .line 1
    iget-wide v0, p0, Leh;->k:J

    .line 2
    .line 3
    cmp-long p0, v0, p1

    .line 4
    .line 5
    if-ltz p0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    new-instance p0, Ljava/io/EOFException;

    .line 9
    .line 10
    invoke-direct {p0}, Ljava/io/EOFException;-><init>()V

    .line 11
    .line 12
    .line 13
    throw p0
.end method

.method public final bridge synthetic o(Ljava/lang/String;)Lkh;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Leh;->F(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-object p0
.end method

.method public final bridge synthetic p(J)Lkh;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Leh;->A(J)V

    .line 2
    .line 3
    .line 4
    return-object p0
.end method

.method public final q()J
    .locals 15

    .line 1
    iget-wide v0, p0, Leh;->k:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    if-eqz v0, :cond_9

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    move v1, v0

    .line 11
    move v6, v1

    .line 12
    move-wide v4, v2

    .line 13
    :cond_0
    iget-object v7, p0, Leh;->j:Lp31;

    .line 14
    .line 15
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 16
    .line 17
    .line 18
    iget-object v8, v7, Lp31;->a:[B

    .line 19
    .line 20
    iget v9, v7, Lp31;->b:I

    .line 21
    .line 22
    iget v10, v7, Lp31;->c:I

    .line 23
    .line 24
    :goto_0
    if-ge v9, v10, :cond_6

    .line 25
    .line 26
    aget-byte v11, v8, v9

    .line 27
    .line 28
    const/16 v12, 0x30

    .line 29
    .line 30
    if-lt v11, v12, :cond_1

    .line 31
    .line 32
    const/16 v12, 0x39

    .line 33
    .line 34
    if-gt v11, v12, :cond_1

    .line 35
    .line 36
    add-int/lit8 v12, v11, -0x30

    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_1
    const/16 v12, 0x61

    .line 40
    .line 41
    if-lt v11, v12, :cond_2

    .line 42
    .line 43
    const/16 v12, 0x66

    .line 44
    .line 45
    if-gt v11, v12, :cond_2

    .line 46
    .line 47
    add-int/lit8 v12, v11, -0x57

    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_2
    const/16 v12, 0x41

    .line 51
    .line 52
    if-lt v11, v12, :cond_4

    .line 53
    .line 54
    const/16 v12, 0x46

    .line 55
    .line 56
    if-gt v11, v12, :cond_4

    .line 57
    .line 58
    add-int/lit8 v12, v11, -0x37

    .line 59
    .line 60
    :goto_1
    const-wide/high16 v13, -0x1000000000000000L    # -3.105036184601418E231

    .line 61
    .line 62
    and-long/2addr v13, v4

    .line 63
    cmp-long v13, v13, v2

    .line 64
    .line 65
    if-nez v13, :cond_3

    .line 66
    .line 67
    const/4 v11, 0x4

    .line 68
    shl-long/2addr v4, v11

    .line 69
    int-to-long v11, v12

    .line 70
    or-long/2addr v4, v11

    .line 71
    add-int/lit8 v9, v9, 0x1

    .line 72
    .line 73
    add-int/lit8 v1, v1, 0x1

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_3
    new-instance p0, Leh;

    .line 77
    .line 78
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 79
    .line 80
    .line 81
    invoke-virtual {p0, v4, v5}, Leh;->B(J)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p0, v11}, Leh;->z(I)V

    .line 85
    .line 86
    .line 87
    new-instance v0, Ljava/lang/NumberFormatException;

    .line 88
    .line 89
    invoke-virtual {p0}, Leh;->t()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    const-string v1, "Number too large: "

    .line 94
    .line 95
    invoke-virtual {v1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    invoke-direct {v0, p0}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    throw v0

    .line 103
    :cond_4
    const/4 v6, 0x1

    .line 104
    if-eqz v1, :cond_5

    .line 105
    .line 106
    goto :goto_2

    .line 107
    :cond_5
    new-instance p0, Ljava/lang/NumberFormatException;

    .line 108
    .line 109
    sget-object v1, Lml;->b:[C

    .line 110
    .line 111
    shr-int/lit8 v2, v11, 0x4

    .line 112
    .line 113
    and-int/lit8 v2, v2, 0xf

    .line 114
    .line 115
    aget-char v2, v1, v2

    .line 116
    .line 117
    and-int/lit8 v3, v11, 0xf

    .line 118
    .line 119
    aget-char v1, v1, v3

    .line 120
    .line 121
    const/4 v3, 0x2

    .line 122
    new-array v3, v3, [C

    .line 123
    .line 124
    aput-char v2, v3, v0

    .line 125
    .line 126
    aput-char v1, v3, v6

    .line 127
    .line 128
    new-instance v0, Ljava/lang/String;

    .line 129
    .line 130
    invoke-direct {v0, v3}, Ljava/lang/String;-><init>([C)V

    .line 131
    .line 132
    .line 133
    const-string v1, "Expected leading [0-9a-fA-F] character but was 0x"

    .line 134
    .line 135
    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    invoke-direct {p0, v0}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    .line 140
    .line 141
    .line 142
    throw p0

    .line 143
    :cond_6
    :goto_2
    if-ne v9, v10, :cond_7

    .line 144
    .line 145
    invoke-virtual {v7}, Lp31;->a()Lp31;

    .line 146
    .line 147
    .line 148
    move-result-object v8

    .line 149
    iput-object v8, p0, Leh;->j:Lp31;

    .line 150
    .line 151
    invoke-static {v7}, Lr31;->a(Lp31;)V

    .line 152
    .line 153
    .line 154
    goto :goto_3

    .line 155
    :cond_7
    iput v9, v7, Lp31;->b:I

    .line 156
    .line 157
    :goto_3
    if-nez v6, :cond_8

    .line 158
    .line 159
    iget-object v7, p0, Leh;->j:Lp31;

    .line 160
    .line 161
    if-nez v7, :cond_0

    .line 162
    .line 163
    :cond_8
    iget-wide v2, p0, Leh;->k:J

    .line 164
    .line 165
    int-to-long v0, v1

    .line 166
    sub-long/2addr v2, v0

    .line 167
    iput-wide v2, p0, Leh;->k:J

    .line 168
    .line 169
    return-wide v4

    .line 170
    :cond_9
    new-instance p0, Ljava/io/EOFException;

    .line 171
    .line 172
    invoke-direct {p0}, Ljava/io/EOFException;-><init>()V

    .line 173
    .line 174
    .line 175
    throw p0
.end method

.method public final r()J
    .locals 20

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-wide v1, v0, Leh;->k:J

    .line 4
    .line 5
    const-wide/16 v3, 0x0

    .line 6
    .line 7
    cmp-long v1, v1, v3

    .line 8
    .line 9
    if-eqz v1, :cond_e

    .line 10
    .line 11
    const-wide/16 v5, -0x7

    .line 12
    .line 13
    move-wide v7, v3

    .line 14
    const/4 v2, 0x0

    .line 15
    const/4 v9, 0x0

    .line 16
    const/4 v10, 0x0

    .line 17
    :goto_0
    iget-object v11, v0, Leh;->j:Lp31;

    .line 18
    .line 19
    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    .line 21
    .line 22
    iget-object v12, v11, Lp31;->a:[B

    .line 23
    .line 24
    iget v13, v11, Lp31;->b:I

    .line 25
    .line 26
    iget v14, v11, Lp31;->c:I

    .line 27
    .line 28
    :goto_1
    if-ge v13, v14, :cond_5

    .line 29
    .line 30
    const/16 v16, 0x0

    .line 31
    .line 32
    aget-byte v1, v12, v13

    .line 33
    .line 34
    const/16 v17, 0x1

    .line 35
    .line 36
    const/16 v15, 0x30

    .line 37
    .line 38
    if-lt v1, v15, :cond_3

    .line 39
    .line 40
    const/16 v15, 0x39

    .line 41
    .line 42
    if-gt v1, v15, :cond_3

    .line 43
    .line 44
    rsub-int/lit8 v15, v1, 0x30

    .line 45
    .line 46
    const-wide v17, -0xcccccccccccccccL

    .line 47
    .line 48
    .line 49
    .line 50
    .line 51
    cmp-long v17, v7, v17

    .line 52
    .line 53
    if-ltz v17, :cond_1

    .line 54
    .line 55
    move-wide/from16 v18, v3

    .line 56
    .line 57
    if-nez v17, :cond_0

    .line 58
    .line 59
    int-to-long v3, v15

    .line 60
    cmp-long v3, v3, v5

    .line 61
    .line 62
    if-gez v3, :cond_0

    .line 63
    .line 64
    goto :goto_2

    .line 65
    :cond_0
    const-wide/16 v3, 0xa

    .line 66
    .line 67
    mul-long/2addr v7, v3

    .line 68
    int-to-long v3, v15

    .line 69
    add-long/2addr v7, v3

    .line 70
    goto :goto_3

    .line 71
    :cond_1
    :goto_2
    new-instance v0, Leh;

    .line 72
    .line 73
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v0, v7, v8}, Leh;->A(J)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {v0, v1}, Leh;->z(I)V

    .line 80
    .line 81
    .line 82
    if-nez v9, :cond_2

    .line 83
    .line 84
    invoke-virtual {v0}, Leh;->readByte()B

    .line 85
    .line 86
    .line 87
    :cond_2
    new-instance v1, Ljava/lang/NumberFormatException;

    .line 88
    .line 89
    invoke-virtual {v0}, Leh;->t()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    const-string v2, "Number too large: "

    .line 94
    .line 95
    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-direct {v1, v0}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    throw v1

    .line 103
    :cond_3
    move-wide/from16 v18, v3

    .line 104
    .line 105
    const/16 v3, 0x2d

    .line 106
    .line 107
    if-ne v1, v3, :cond_4

    .line 108
    .line 109
    if-nez v2, :cond_4

    .line 110
    .line 111
    const-wide/16 v3, 0x1

    .line 112
    .line 113
    sub-long/2addr v5, v3

    .line 114
    move/from16 v9, v17

    .line 115
    .line 116
    :goto_3
    add-int/lit8 v13, v13, 0x1

    .line 117
    .line 118
    add-int/lit8 v2, v2, 0x1

    .line 119
    .line 120
    move-wide/from16 v3, v18

    .line 121
    .line 122
    goto :goto_1

    .line 123
    :cond_4
    move/from16 v10, v17

    .line 124
    .line 125
    goto :goto_4

    .line 126
    :cond_5
    move-wide/from16 v18, v3

    .line 127
    .line 128
    const/16 v16, 0x0

    .line 129
    .line 130
    const/16 v17, 0x1

    .line 131
    .line 132
    :goto_4
    if-ne v13, v14, :cond_6

    .line 133
    .line 134
    invoke-virtual {v11}, Lp31;->a()Lp31;

    .line 135
    .line 136
    .line 137
    move-result-object v1

    .line 138
    iput-object v1, v0, Leh;->j:Lp31;

    .line 139
    .line 140
    invoke-static {v11}, Lr31;->a(Lp31;)V

    .line 141
    .line 142
    .line 143
    goto :goto_5

    .line 144
    :cond_6
    iput v13, v11, Lp31;->b:I

    .line 145
    .line 146
    :goto_5
    if-nez v10, :cond_8

    .line 147
    .line 148
    iget-object v1, v0, Leh;->j:Lp31;

    .line 149
    .line 150
    if-nez v1, :cond_7

    .line 151
    .line 152
    goto :goto_6

    .line 153
    :cond_7
    move-wide/from16 v3, v18

    .line 154
    .line 155
    goto/16 :goto_0

    .line 156
    .line 157
    :cond_8
    :goto_6
    iget-wide v3, v0, Leh;->k:J

    .line 158
    .line 159
    int-to-long v5, v2

    .line 160
    sub-long/2addr v3, v5

    .line 161
    iput-wide v3, v0, Leh;->k:J

    .line 162
    .line 163
    const/4 v1, 0x2

    .line 164
    if-eqz v9, :cond_9

    .line 165
    .line 166
    move v5, v1

    .line 167
    goto :goto_7

    .line 168
    :cond_9
    move/from16 v5, v17

    .line 169
    .line 170
    :goto_7
    if-ge v2, v5, :cond_c

    .line 171
    .line 172
    cmp-long v2, v3, v18

    .line 173
    .line 174
    if-eqz v2, :cond_b

    .line 175
    .line 176
    if-eqz v9, :cond_a

    .line 177
    .line 178
    const-string v2, "Expected a digit"

    .line 179
    .line 180
    goto :goto_8

    .line 181
    :cond_a
    const-string v2, "Expected a digit or \'-\'"

    .line 182
    .line 183
    :goto_8
    new-instance v3, Ljava/lang/NumberFormatException;

    .line 184
    .line 185
    move-wide/from16 v4, v18

    .line 186
    .line 187
    invoke-virtual {v0, v4, v5}, Leh;->h(J)B

    .line 188
    .line 189
    .line 190
    move-result v0

    .line 191
    sget-object v4, Lml;->b:[C

    .line 192
    .line 193
    shr-int/lit8 v5, v0, 0x4

    .line 194
    .line 195
    and-int/lit8 v5, v5, 0xf

    .line 196
    .line 197
    aget-char v5, v4, v5

    .line 198
    .line 199
    and-int/lit8 v0, v0, 0xf

    .line 200
    .line 201
    aget-char v0, v4, v0

    .line 202
    .line 203
    new-array v1, v1, [C

    .line 204
    .line 205
    aput-char v5, v1, v16

    .line 206
    .line 207
    aput-char v0, v1, v17

    .line 208
    .line 209
    new-instance v0, Ljava/lang/String;

    .line 210
    .line 211
    invoke-direct {v0, v1}, Ljava/lang/String;-><init>([C)V

    .line 212
    .line 213
    .line 214
    new-instance v1, Ljava/lang/StringBuilder;

    .line 215
    .line 216
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 217
    .line 218
    .line 219
    const-string v2, " but was 0x"

    .line 220
    .line 221
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 222
    .line 223
    .line 224
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 225
    .line 226
    .line 227
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 228
    .line 229
    .line 230
    move-result-object v0

    .line 231
    invoke-direct {v3, v0}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    .line 232
    .line 233
    .line 234
    throw v3

    .line 235
    :cond_b
    new-instance v0, Ljava/io/EOFException;

    .line 236
    .line 237
    invoke-direct {v0}, Ljava/io/EOFException;-><init>()V

    .line 238
    .line 239
    .line 240
    throw v0

    .line 241
    :cond_c
    if-eqz v9, :cond_d

    .line 242
    .line 243
    return-wide v7

    .line 244
    :cond_d
    neg-long v0, v7

    .line 245
    return-wide v0

    .line 246
    :cond_e
    new-instance v0, Ljava/io/EOFException;

    .line 247
    .line 248
    invoke-direct {v0}, Ljava/io/EOFException;-><init>()V

    .line 249
    .line 250
    .line 251
    throw v0
.end method

.method public final read(Ljava/nio/ByteBuffer;)I
    .locals 6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 57
    iget-object v0, p0, Leh;->j:Lp31;

    if-nez v0, :cond_0

    const/4 p0, -0x1

    return p0

    .line 58
    :cond_0
    invoke-virtual {p1}, Ljava/nio/Buffer;->remaining()I

    move-result v1

    iget v2, v0, Lp31;->c:I

    iget v3, v0, Lp31;->b:I

    sub-int/2addr v2, v3

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 59
    iget-object v2, v0, Lp31;->a:[B

    iget v3, v0, Lp31;->b:I

    invoke-virtual {p1, v2, v3, v1}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 60
    iget p1, v0, Lp31;->b:I

    add-int/2addr p1, v1

    iput p1, v0, Lp31;->b:I

    .line 61
    iget-wide v2, p0, Leh;->k:J

    int-to-long v4, v1

    sub-long/2addr v2, v4

    iput-wide v2, p0, Leh;->k:J

    .line 62
    iget v2, v0, Lp31;->c:I

    if-ne p1, v2, :cond_1

    .line 63
    invoke-virtual {v0}, Lp31;->a()Lp31;

    move-result-object p1

    iput-object p1, p0, Leh;->j:Lp31;

    .line 64
    invoke-static {v0}, Lr31;->a(Lp31;)V

    :cond_1
    return v1
.end method

.method public final read([BII)I
    .locals 7

    .line 1
    array-length v0, p1

    .line 2
    int-to-long v1, v0

    .line 3
    int-to-long v3, p2

    .line 4
    int-to-long v5, p3

    .line 5
    invoke-static/range {v1 .. v6}, Lkp1;->b(JJJ)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Leh;->j:Lp31;

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    const/4 p0, -0x1

    .line 13
    return p0

    .line 14
    :cond_0
    iget v1, v0, Lp31;->c:I

    .line 15
    .line 16
    iget v2, v0, Lp31;->b:I

    .line 17
    .line 18
    sub-int/2addr v1, v2

    .line 19
    invoke-static {p3, v1}, Ljava/lang/Math;->min(II)I

    .line 20
    .line 21
    .line 22
    move-result p3

    .line 23
    iget-object v1, v0, Lp31;->a:[B

    .line 24
    .line 25
    iget v2, v0, Lp31;->b:I

    .line 26
    .line 27
    add-int v3, v2, p3

    .line 28
    .line 29
    invoke-static {p2, v2, v3, v1, p1}, Lia;->M(III[B[B)V

    .line 30
    .line 31
    .line 32
    iget p1, v0, Lp31;->b:I

    .line 33
    .line 34
    add-int/2addr p1, p3

    .line 35
    iput p1, v0, Lp31;->b:I

    .line 36
    .line 37
    iget-wide v1, p0, Leh;->k:J

    .line 38
    .line 39
    int-to-long v3, p3

    .line 40
    sub-long/2addr v1, v3

    .line 41
    iput-wide v1, p0, Leh;->k:J

    .line 42
    .line 43
    iget p2, v0, Lp31;->c:I

    .line 44
    .line 45
    if-ne p1, p2, :cond_1

    .line 46
    .line 47
    invoke-virtual {v0}, Lp31;->a()Lp31;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    iput-object p1, p0, Leh;->j:Lp31;

    .line 52
    .line 53
    invoke-static {v0}, Lr31;->a(Lp31;)V

    .line 54
    .line 55
    .line 56
    :cond_1
    return p3
.end method

.method public final readByte()B
    .locals 9

    .line 1
    iget-wide v0, p0, Leh;->k:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Leh;->j:Lp31;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    iget v1, v0, Lp31;->b:I

    .line 15
    .line 16
    iget v2, v0, Lp31;->c:I

    .line 17
    .line 18
    iget-object v3, v0, Lp31;->a:[B

    .line 19
    .line 20
    add-int/lit8 v4, v1, 0x1

    .line 21
    .line 22
    aget-byte v1, v3, v1

    .line 23
    .line 24
    iget-wide v5, p0, Leh;->k:J

    .line 25
    .line 26
    const-wide/16 v7, 0x1

    .line 27
    .line 28
    sub-long/2addr v5, v7

    .line 29
    iput-wide v5, p0, Leh;->k:J

    .line 30
    .line 31
    if-ne v4, v2, :cond_0

    .line 32
    .line 33
    invoke-virtual {v0}, Lp31;->a()Lp31;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    iput-object v2, p0, Leh;->j:Lp31;

    .line 38
    .line 39
    invoke-static {v0}, Lr31;->a(Lp31;)V

    .line 40
    .line 41
    .line 42
    return v1

    .line 43
    :cond_0
    iput v4, v0, Lp31;->b:I

    .line 44
    .line 45
    return v1

    .line 46
    :cond_1
    new-instance p0, Ljava/io/EOFException;

    .line 47
    .line 48
    invoke-direct {p0}, Ljava/io/EOFException;-><init>()V

    .line 49
    .line 50
    .line 51
    throw p0
.end method

.method public final readInt()I
    .locals 9

    .line 1
    iget-wide v0, p0, Leh;->k:J

    .line 2
    .line 3
    const-wide/16 v2, 0x4

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    if-ltz v0, :cond_2

    .line 8
    .line 9
    iget-object v0, p0, Leh;->j:Lp31;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    iget v1, v0, Lp31;->b:I

    .line 15
    .line 16
    iget v4, v0, Lp31;->c:I

    .line 17
    .line 18
    sub-int v5, v4, v1

    .line 19
    .line 20
    int-to-long v5, v5

    .line 21
    cmp-long v5, v5, v2

    .line 22
    .line 23
    if-gez v5, :cond_0

    .line 24
    .line 25
    invoke-virtual {p0}, Leh;->readByte()B

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    and-int/lit16 v0, v0, 0xff

    .line 30
    .line 31
    shl-int/lit8 v0, v0, 0x18

    .line 32
    .line 33
    invoke-virtual {p0}, Leh;->readByte()B

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    and-int/lit16 v1, v1, 0xff

    .line 38
    .line 39
    shl-int/lit8 v1, v1, 0x10

    .line 40
    .line 41
    or-int/2addr v0, v1

    .line 42
    invoke-virtual {p0}, Leh;->readByte()B

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    and-int/lit16 v1, v1, 0xff

    .line 47
    .line 48
    shl-int/lit8 v1, v1, 0x8

    .line 49
    .line 50
    or-int/2addr v0, v1

    .line 51
    invoke-virtual {p0}, Leh;->readByte()B

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    and-int/lit16 p0, p0, 0xff

    .line 56
    .line 57
    or-int/2addr p0, v0

    .line 58
    return p0

    .line 59
    :cond_0
    iget-object v5, v0, Lp31;->a:[B

    .line 60
    .line 61
    add-int/lit8 v6, v1, 0x1

    .line 62
    .line 63
    aget-byte v7, v5, v1

    .line 64
    .line 65
    and-int/lit16 v7, v7, 0xff

    .line 66
    .line 67
    shl-int/lit8 v7, v7, 0x18

    .line 68
    .line 69
    add-int/lit8 v8, v1, 0x2

    .line 70
    .line 71
    aget-byte v6, v5, v6

    .line 72
    .line 73
    and-int/lit16 v6, v6, 0xff

    .line 74
    .line 75
    shl-int/lit8 v6, v6, 0x10

    .line 76
    .line 77
    or-int/2addr v6, v7

    .line 78
    add-int/lit8 v7, v1, 0x3

    .line 79
    .line 80
    aget-byte v8, v5, v8

    .line 81
    .line 82
    and-int/lit16 v8, v8, 0xff

    .line 83
    .line 84
    shl-int/lit8 v8, v8, 0x8

    .line 85
    .line 86
    or-int/2addr v6, v8

    .line 87
    add-int/lit8 v1, v1, 0x4

    .line 88
    .line 89
    aget-byte v5, v5, v7

    .line 90
    .line 91
    and-int/lit16 v5, v5, 0xff

    .line 92
    .line 93
    or-int/2addr v5, v6

    .line 94
    iget-wide v6, p0, Leh;->k:J

    .line 95
    .line 96
    sub-long/2addr v6, v2

    .line 97
    iput-wide v6, p0, Leh;->k:J

    .line 98
    .line 99
    if-ne v1, v4, :cond_1

    .line 100
    .line 101
    invoke-virtual {v0}, Lp31;->a()Lp31;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    iput-object v1, p0, Leh;->j:Lp31;

    .line 106
    .line 107
    invoke-static {v0}, Lr31;->a(Lp31;)V

    .line 108
    .line 109
    .line 110
    return v5

    .line 111
    :cond_1
    iput v1, v0, Lp31;->b:I

    .line 112
    .line 113
    return v5

    .line 114
    :cond_2
    new-instance p0, Ljava/io/EOFException;

    .line 115
    .line 116
    invoke-direct {p0}, Ljava/io/EOFException;-><init>()V

    .line 117
    .line 118
    .line 119
    throw p0
.end method

.method public final readShort()S
    .locals 9

    .line 1
    iget-wide v0, p0, Leh;->k:J

    .line 2
    .line 3
    const-wide/16 v2, 0x2

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    if-ltz v0, :cond_2

    .line 8
    .line 9
    iget-object v0, p0, Leh;->j:Lp31;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    iget v1, v0, Lp31;->b:I

    .line 15
    .line 16
    iget v4, v0, Lp31;->c:I

    .line 17
    .line 18
    sub-int v5, v4, v1

    .line 19
    .line 20
    const/4 v6, 0x2

    .line 21
    if-ge v5, v6, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0}, Leh;->readByte()B

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    and-int/lit16 v0, v0, 0xff

    .line 28
    .line 29
    shl-int/lit8 v0, v0, 0x8

    .line 30
    .line 31
    invoke-virtual {p0}, Leh;->readByte()B

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    and-int/lit16 p0, p0, 0xff

    .line 36
    .line 37
    or-int/2addr p0, v0

    .line 38
    int-to-short p0, p0

    .line 39
    return p0

    .line 40
    :cond_0
    iget-object v5, v0, Lp31;->a:[B

    .line 41
    .line 42
    add-int/lit8 v7, v1, 0x1

    .line 43
    .line 44
    aget-byte v8, v5, v1

    .line 45
    .line 46
    and-int/lit16 v8, v8, 0xff

    .line 47
    .line 48
    shl-int/lit8 v8, v8, 0x8

    .line 49
    .line 50
    add-int/2addr v1, v6

    .line 51
    aget-byte v5, v5, v7

    .line 52
    .line 53
    and-int/lit16 v5, v5, 0xff

    .line 54
    .line 55
    or-int/2addr v5, v8

    .line 56
    iget-wide v6, p0, Leh;->k:J

    .line 57
    .line 58
    sub-long/2addr v6, v2

    .line 59
    iput-wide v6, p0, Leh;->k:J

    .line 60
    .line 61
    if-ne v1, v4, :cond_1

    .line 62
    .line 63
    invoke-virtual {v0}, Lp31;->a()Lp31;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    iput-object v1, p0, Leh;->j:Lp31;

    .line 68
    .line 69
    invoke-static {v0}, Lr31;->a(Lp31;)V

    .line 70
    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_1
    iput v1, v0, Lp31;->b:I

    .line 74
    .line 75
    :goto_0
    int-to-short p0, v5

    .line 76
    return p0

    .line 77
    :cond_2
    new-instance p0, Ljava/io/EOFException;

    .line 78
    .line 79
    invoke-direct {p0}, Ljava/io/EOFException;-><init>()V

    .line 80
    .line 81
    .line 82
    throw p0
.end method

.method public final s(JLjava/nio/charset/Charset;)Ljava/lang/String;
    .locals 6

    .line 1
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    cmp-long v0, p1, v0

    .line 7
    .line 8
    if-ltz v0, :cond_4

    .line 9
    .line 10
    const-wide/32 v1, 0x7fffffff

    .line 11
    .line 12
    .line 13
    cmp-long v1, p1, v1

    .line 14
    .line 15
    if-gtz v1, :cond_4

    .line 16
    .line 17
    iget-wide v1, p0, Leh;->k:J

    .line 18
    .line 19
    cmp-long v1, v1, p1

    .line 20
    .line 21
    if-ltz v1, :cond_3

    .line 22
    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    const-string p0, ""

    .line 26
    .line 27
    return-object p0

    .line 28
    :cond_0
    iget-object v0, p0, Leh;->j:Lp31;

    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 31
    .line 32
    .line 33
    iget v1, v0, Lp31;->b:I

    .line 34
    .line 35
    int-to-long v2, v1

    .line 36
    add-long/2addr v2, p1

    .line 37
    iget v4, v0, Lp31;->c:I

    .line 38
    .line 39
    int-to-long v4, v4

    .line 40
    cmp-long v2, v2, v4

    .line 41
    .line 42
    if-lez v2, :cond_1

    .line 43
    .line 44
    new-instance v0, Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {p0, p1, p2}, Leh;->l(J)[B

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-direct {v0, p0, p3}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    .line 51
    .line 52
    .line 53
    return-object v0

    .line 54
    :cond_1
    new-instance v2, Ljava/lang/String;

    .line 55
    .line 56
    iget-object v3, v0, Lp31;->a:[B

    .line 57
    .line 58
    long-to-int v4, p1

    .line 59
    invoke-direct {v2, v3, v1, v4, p3}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    .line 60
    .line 61
    .line 62
    iget p3, v0, Lp31;->b:I

    .line 63
    .line 64
    add-int/2addr p3, v4

    .line 65
    iput p3, v0, Lp31;->b:I

    .line 66
    .line 67
    iget-wide v3, p0, Leh;->k:J

    .line 68
    .line 69
    sub-long/2addr v3, p1

    .line 70
    iput-wide v3, p0, Leh;->k:J

    .line 71
    .line 72
    iget p1, v0, Lp31;->c:I

    .line 73
    .line 74
    if-ne p3, p1, :cond_2

    .line 75
    .line 76
    invoke-virtual {v0}, Lp31;->a()Lp31;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    iput-object p1, p0, Leh;->j:Lp31;

    .line 81
    .line 82
    invoke-static {v0}, Lr31;->a(Lp31;)V

    .line 83
    .line 84
    .line 85
    :cond_2
    return-object v2

    .line 86
    :cond_3
    new-instance p0, Ljava/io/EOFException;

    .line 87
    .line 88
    invoke-direct {p0}, Ljava/io/EOFException;-><init>()V

    .line 89
    .line 90
    .line 91
    throw p0

    .line 92
    :cond_4
    const-string p0, "byteCount: "

    .line 93
    .line 94
    invoke-static {p0, p1, p2}, Lz0;->e(Ljava/lang/String;J)V

    .line 95
    .line 96
    .line 97
    const/4 p0, 0x0

    .line 98
    return-object p0
.end method

.method public final skip(J)V
    .locals 6

    .line 1
    :cond_0
    :goto_0
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    if-lez v0, :cond_2

    .line 6
    .line 7
    iget-object v0, p0, Leh;->j:Lp31;

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget v1, v0, Lp31;->c:I

    .line 12
    .line 13
    iget v2, v0, Lp31;->b:I

    .line 14
    .line 15
    sub-int/2addr v1, v2

    .line 16
    int-to-long v1, v1

    .line 17
    invoke-static {p1, p2, v1, v2}, Ljava/lang/Math;->min(JJ)J

    .line 18
    .line 19
    .line 20
    move-result-wide v1

    .line 21
    long-to-int v1, v1

    .line 22
    iget-wide v2, p0, Leh;->k:J

    .line 23
    .line 24
    int-to-long v4, v1

    .line 25
    sub-long/2addr v2, v4

    .line 26
    iput-wide v2, p0, Leh;->k:J

    .line 27
    .line 28
    sub-long/2addr p1, v4

    .line 29
    iget v2, v0, Lp31;->b:I

    .line 30
    .line 31
    add-int/2addr v2, v1

    .line 32
    iput v2, v0, Lp31;->b:I

    .line 33
    .line 34
    iget v1, v0, Lp31;->c:I

    .line 35
    .line 36
    if-ne v2, v1, :cond_0

    .line 37
    .line 38
    invoke-virtual {v0}, Lp31;->a()Lp31;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    iput-object v1, p0, Leh;->j:Lp31;

    .line 43
    .line 44
    invoke-static {v0}, Lr31;->a(Lp31;)V

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_1
    new-instance p0, Ljava/io/EOFException;

    .line 49
    .line 50
    invoke-direct {p0}, Ljava/io/EOFException;-><init>()V

    .line 51
    .line 52
    .line 53
    throw p0

    .line 54
    :cond_2
    return-void
.end method

.method public final t()Ljava/lang/String;
    .locals 3

    .line 1
    iget-wide v0, p0, Leh;->k:J

    .line 2
    .line 3
    sget-object v2, Lyj;->a:Ljava/nio/charset/Charset;

    .line 4
    .line 5
    invoke-virtual {p0, v0, v1, v2}, Leh;->s(JLjava/nio/charset/Charset;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final toString()Ljava/lang/String;
    .locals 4

    .line 1
    iget-wide v0, p0, Leh;->k:J

    .line 2
    .line 3
    const-wide/32 v2, 0x7fffffff

    .line 4
    .line 5
    .line 6
    cmp-long v2, v0, v2

    .line 7
    .line 8
    if-gtz v2, :cond_0

    .line 9
    .line 10
    long-to-int v0, v0

    .line 11
    invoke-virtual {p0, v0}, Leh;->u(I)Lth;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Lth;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0

    .line 20
    :cond_0
    iget-wide v0, p0, Leh;->k:J

    .line 21
    .line 22
    new-instance p0, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    const-string v2, "size > Int.MAX_VALUE: "

    .line 25
    .line 26
    invoke-direct {p0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 37
    .line 38
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-direct {v0, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    throw v0
.end method

.method public final u(I)Lth;
    .locals 7

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    sget-object p0, Lth;->m:Lth;

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    iget-wide v0, p0, Leh;->k:J

    .line 7
    .line 8
    const-wide/16 v2, 0x0

    .line 9
    .line 10
    int-to-long v4, p1

    .line 11
    invoke-static/range {v0 .. v5}, Lkp1;->b(JJJ)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Leh;->j:Lp31;

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    move v2, v1

    .line 18
    move v3, v2

    .line 19
    :goto_0
    if-ge v2, p1, :cond_2

    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 22
    .line 23
    .line 24
    iget v4, v0, Lp31;->c:I

    .line 25
    .line 26
    iget v5, v0, Lp31;->b:I

    .line 27
    .line 28
    if-eq v4, v5, :cond_1

    .line 29
    .line 30
    sub-int/2addr v4, v5

    .line 31
    add-int/2addr v2, v4

    .line 32
    add-int/lit8 v3, v3, 0x1

    .line 33
    .line 34
    iget-object v0, v0, Lp31;->f:Lp31;

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    new-instance p0, Ljava/lang/AssertionError;

    .line 38
    .line 39
    const-string p1, "s.limit == s.pos"

    .line 40
    .line 41
    invoke-direct {p0, p1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    throw p0

    .line 45
    :cond_2
    new-array v0, v3, [[B

    .line 46
    .line 47
    mul-int/lit8 v2, v3, 0x2

    .line 48
    .line 49
    new-array v2, v2, [I

    .line 50
    .line 51
    iget-object p0, p0, Leh;->j:Lp31;

    .line 52
    .line 53
    move v4, v1

    .line 54
    :goto_1
    if-ge v1, p1, :cond_3

    .line 55
    .line 56
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 57
    .line 58
    .line 59
    iget-object v5, p0, Lp31;->a:[B

    .line 60
    .line 61
    aput-object v5, v0, v4

    .line 62
    .line 63
    iget v5, p0, Lp31;->c:I

    .line 64
    .line 65
    iget v6, p0, Lp31;->b:I

    .line 66
    .line 67
    sub-int/2addr v5, v6

    .line 68
    add-int/2addr v1, v5

    .line 69
    invoke-static {v1, p1}, Ljava/lang/Math;->min(II)I

    .line 70
    .line 71
    .line 72
    move-result v5

    .line 73
    aput v5, v2, v4

    .line 74
    .line 75
    add-int v5, v4, v3

    .line 76
    .line 77
    iget v6, p0, Lp31;->b:I

    .line 78
    .line 79
    aput v6, v2, v5

    .line 80
    .line 81
    const/4 v5, 0x1

    .line 82
    iput-boolean v5, p0, Lp31;->d:Z

    .line 83
    .line 84
    add-int/2addr v4, v5

    .line 85
    iget-object p0, p0, Lp31;->f:Lp31;

    .line 86
    .line 87
    goto :goto_1

    .line 88
    :cond_3
    new-instance p0, Ls31;

    .line 89
    .line 90
    invoke-direct {p0, v0, v2}, Ls31;-><init>([[B[I)V

    .line 91
    .line 92
    .line 93
    return-object p0
.end method

.method public final v(I)Lp31;
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    if-lt p1, v0, :cond_3

    .line 3
    .line 4
    const/16 v0, 0x2000

    .line 5
    .line 6
    if-gt p1, v0, :cond_3

    .line 7
    .line 8
    iget-object v1, p0, Leh;->j:Lp31;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    invoke-static {}, Lr31;->b()Lp31;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iput-object p1, p0, Leh;->j:Lp31;

    .line 17
    .line 18
    iput-object p1, p1, Lp31;->g:Lp31;

    .line 19
    .line 20
    iput-object p1, p1, Lp31;->f:Lp31;

    .line 21
    .line 22
    return-object p1

    .line 23
    :cond_0
    iget-object p0, v1, Lp31;->g:Lp31;

    .line 24
    .line 25
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 26
    .line 27
    .line 28
    iget v1, p0, Lp31;->c:I

    .line 29
    .line 30
    add-int/2addr v1, p1

    .line 31
    if-gt v1, v0, :cond_2

    .line 32
    .line 33
    iget-boolean p1, p0, Lp31;->e:Z

    .line 34
    .line 35
    if-nez p1, :cond_1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    return-object p0

    .line 39
    :cond_2
    :goto_0
    invoke-static {}, Lr31;->b()Lp31;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p0, p1}, Lp31;->b(Lp31;)V

    .line 44
    .line 45
    .line 46
    return-object p1

    .line 47
    :cond_3
    const-string p0, "unexpected capacity"

    .line 48
    .line 49
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    const/4 p0, 0x0

    .line 53
    return-object p0
.end method

.method public final w(I[B)V
    .locals 8

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    array-length v0, p2

    .line 5
    int-to-long v1, v0

    .line 6
    int-to-long v5, p1

    .line 7
    const-wide/16 v3, 0x0

    .line 8
    .line 9
    invoke-static/range {v1 .. v6}, Lkp1;->b(JJJ)V

    .line 10
    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    :goto_0
    if-ge v0, p1, :cond_0

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    invoke-virtual {p0, v1}, Leh;->v(I)Lp31;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    sub-int v2, p1, v0

    .line 21
    .line 22
    iget v3, v1, Lp31;->c:I

    .line 23
    .line 24
    rsub-int v3, v3, 0x2000

    .line 25
    .line 26
    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    iget-object v3, v1, Lp31;->a:[B

    .line 31
    .line 32
    iget v4, v1, Lp31;->c:I

    .line 33
    .line 34
    add-int v7, v0, v2

    .line 35
    .line 36
    invoke-static {v4, v0, v7, p2, v3}, Lia;->M(III[B[B)V

    .line 37
    .line 38
    .line 39
    iget v0, v1, Lp31;->c:I

    .line 40
    .line 41
    add-int/2addr v0, v2

    .line 42
    iput v0, v1, Lp31;->c:I

    .line 43
    .line 44
    move v0, v7

    .line 45
    goto :goto_0

    .line 46
    :cond_0
    iget-wide p1, p0, Leh;->k:J

    .line 47
    .line 48
    add-long/2addr p1, v5

    .line 49
    iput-wide p1, p0, Leh;->k:J

    .line 50
    .line 51
    return-void
.end method

.method public final write(Ljava/nio/ByteBuffer;)I
    .locals 6

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/nio/Buffer;->remaining()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    move v1, v0

    .line 9
    :goto_0
    if-lez v1, :cond_0

    .line 10
    .line 11
    const/4 v2, 0x1

    .line 12
    invoke-virtual {p0, v2}, Leh;->v(I)Lp31;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    iget v3, v2, Lp31;->c:I

    .line 17
    .line 18
    rsub-int v3, v3, 0x2000

    .line 19
    .line 20
    invoke-static {v1, v3}, Ljava/lang/Math;->min(II)I

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    iget-object v4, v2, Lp31;->a:[B

    .line 25
    .line 26
    iget v5, v2, Lp31;->c:I

    .line 27
    .line 28
    invoke-virtual {p1, v4, v5, v3}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 29
    .line 30
    .line 31
    sub-int/2addr v1, v3

    .line 32
    iget v4, v2, Lp31;->c:I

    .line 33
    .line 34
    add-int/2addr v4, v3

    .line 35
    iput v4, v2, Lp31;->c:I

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    iget-wide v1, p0, Leh;->k:J

    .line 39
    .line 40
    int-to-long v3, v0

    .line 41
    add-long/2addr v1, v3

    .line 42
    iput-wide v1, p0, Leh;->k:J

    .line 43
    .line 44
    return v0
.end method

.method public final write([B)Lkh;
    .locals 1

    .line 45
    array-length v0, p1

    invoke-virtual {p0, v0, p1}, Leh;->w(I[B)V

    return-object p0
.end method

.method public final bridge synthetic writeByte(I)Lkh;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Leh;->z(I)V

    .line 2
    .line 3
    .line 4
    return-object p0
.end method

.method public final bridge synthetic writeInt(I)Lkh;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Leh;->C(I)V

    .line 2
    .line 3
    .line 4
    return-object p0
.end method

.method public final bridge synthetic writeShort(I)Lkh;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Leh;->D(I)V

    .line 2
    .line 3
    .line 4
    return-object p0
.end method

.method public final x(Lth;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lth;->c()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    invoke-virtual {p1, p0, v0}, Lth;->k(Leh;I)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final y(Lp81;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    :goto_0
    const-wide/16 v0, 0x2000

    .line 5
    .line 6
    invoke-interface {p1, v0, v1, p0}, Lp81;->c(JLeh;)J

    .line 7
    .line 8
    .line 9
    move-result-wide v0

    .line 10
    const-wide/16 v2, -0x1

    .line 11
    .line 12
    cmp-long v0, v0, v2

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    return-void
.end method

.method public final z(I)V
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Leh;->v(I)Lp31;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    iget-object v1, v0, Lp31;->a:[B

    .line 7
    .line 8
    iget v2, v0, Lp31;->c:I

    .line 9
    .line 10
    add-int/lit8 v3, v2, 0x1

    .line 11
    .line 12
    iput v3, v0, Lp31;->c:I

    .line 13
    .line 14
    int-to-byte p1, p1

    .line 15
    aput-byte p1, v1, v2

    .line 16
    .line 17
    iget-wide v0, p0, Leh;->k:J

    .line 18
    .line 19
    const-wide/16 v2, 0x1

    .line 20
    .line 21
    add-long/2addr v0, v2

    .line 22
    iput-wide v0, p0, Leh;->k:J

    .line 23
    .line 24
    return-void
.end method
