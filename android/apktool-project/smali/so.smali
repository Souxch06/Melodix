.class public final Lso;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public a:I

.field public b:Z

.field public c:Z

.field public final d:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/util/List;)V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    iput-object p1, p0, Lso;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lzy1;IZZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lso;->d:Ljava/lang/Object;

    .line 5
    .line 6
    iput p2, p0, Lso;->a:I

    .line 7
    .line 8
    iput-boolean p3, p0, Lso;->b:Z

    .line 9
    .line 10
    iput-boolean p4, p0, Lso;->c:Z

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public a(Ljavax/net/ssl/SSLSocket;)Lro;
    .locals 13

    .line 1
    iget v0, p0, Lso;->a:I

    .line 2
    .line 3
    iget-object v1, p0, Lso;->d:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v1, Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    :goto_0
    const/4 v3, 0x1

    .line 12
    if-ge v0, v2, :cond_1

    .line 13
    .line 14
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v4

    .line 18
    check-cast v4, Lro;

    .line 19
    .line 20
    invoke-virtual {v4, p1}, Lro;->b(Ljavax/net/ssl/SSLSocket;)Z

    .line 21
    .line 22
    .line 23
    move-result v5

    .line 24
    if-eqz v5, :cond_0

    .line 25
    .line 26
    add-int/2addr v0, v3

    .line 27
    iput v0, p0, Lso;->a:I

    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    const/4 v4, 0x0

    .line 34
    :goto_1
    if-eqz v4, :cond_b

    .line 35
    .line 36
    iget v0, p0, Lso;->a:I

    .line 37
    .line 38
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    :goto_2
    const/4 v5, 0x0

    .line 43
    if-ge v0, v2, :cond_3

    .line 44
    .line 45
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v6

    .line 49
    check-cast v6, Lro;

    .line 50
    .line 51
    invoke-virtual {v6, p1}, Lro;->b(Ljavax/net/ssl/SSLSocket;)Z

    .line 52
    .line 53
    .line 54
    move-result v6

    .line 55
    if-eqz v6, :cond_2

    .line 56
    .line 57
    move v0, v3

    .line 58
    goto :goto_3

    .line 59
    :cond_2
    add-int/lit8 v0, v0, 0x1

    .line 60
    .line 61
    goto :goto_2

    .line 62
    :cond_3
    move v0, v5

    .line 63
    :goto_3
    iput-boolean v0, p0, Lso;->b:Z

    .line 64
    .line 65
    iget-boolean p0, p0, Lso;->c:Z

    .line 66
    .line 67
    iget-object v0, v4, Lro;->d:[Ljava/lang/String;

    .line 68
    .line 69
    iget-object v1, v4, Lro;->c:[Ljava/lang/String;

    .line 70
    .line 71
    if-eqz v1, :cond_4

    .line 72
    .line 73
    invoke-virtual {p1}, Ljavax/net/ssl/SSLSocket;->getEnabledCipherSuites()[Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 78
    .line 79
    .line 80
    sget-object v6, Lek;->c:Ld2;

    .line 81
    .line 82
    invoke-static {v2, v1, v6}, Ljg1;->j([Ljava/lang/String;[Ljava/lang/String;Ljava/util/Comparator;)[Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    goto :goto_4

    .line 87
    :cond_4
    invoke-virtual {p1}, Ljavax/net/ssl/SSLSocket;->getEnabledCipherSuites()[Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v2

    .line 91
    :goto_4
    if-eqz v0, :cond_5

    .line 92
    .line 93
    invoke-virtual {p1}, Ljavax/net/ssl/SSLSocket;->getEnabledProtocols()[Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v6

    .line 97
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 98
    .line 99
    .line 100
    sget-object v7, Lap0;->k:Lap0;

    .line 101
    .line 102
    invoke-static {v6, v0, v7}, Ljg1;->j([Ljava/lang/String;[Ljava/lang/String;Ljava/util/Comparator;)[Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v6

    .line 106
    goto :goto_5

    .line 107
    :cond_5
    invoke-virtual {p1}, Ljavax/net/ssl/SSLSocket;->getEnabledProtocols()[Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v6

    .line 111
    :goto_5
    invoke-virtual {p1}, Ljavax/net/ssl/SSLSocket;->getSupportedCipherSuites()[Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v7

    .line 115
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 116
    .line 117
    .line 118
    sget-object v8, Lek;->c:Ld2;

    .line 119
    .line 120
    sget-object v9, Ljg1;->a:[B

    .line 121
    .line 122
    array-length v9, v7

    .line 123
    :goto_6
    const/4 v10, -0x1

    .line 124
    if-ge v5, v9, :cond_7

    .line 125
    .line 126
    aget-object v11, v7, v5

    .line 127
    .line 128
    const-string v12, "TLS_FALLBACK_SCSV"

    .line 129
    .line 130
    invoke-virtual {v8, v11, v12}, Ld2;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    .line 131
    .line 132
    .line 133
    move-result v11

    .line 134
    if-nez v11, :cond_6

    .line 135
    .line 136
    goto :goto_7

    .line 137
    :cond_6
    add-int/lit8 v5, v5, 0x1

    .line 138
    .line 139
    goto :goto_6

    .line 140
    :cond_7
    move v5, v10

    .line 141
    :goto_7
    if-eqz p0, :cond_8

    .line 142
    .line 143
    if-eq v5, v10, :cond_8

    .line 144
    .line 145
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 146
    .line 147
    .line 148
    aget-object p0, v7, v5

    .line 149
    .line 150
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 151
    .line 152
    .line 153
    array-length v5, v2

    .line 154
    add-int/2addr v5, v3

    .line 155
    invoke-static {v2, v5}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 156
    .line 157
    .line 158
    move-result-object v2

    .line 159
    check-cast v2, [Ljava/lang/String;

    .line 160
    .line 161
    array-length v5, v2

    .line 162
    sub-int/2addr v5, v3

    .line 163
    aput-object p0, v2, v5

    .line 164
    .line 165
    :cond_8
    new-instance p0, Lqo;

    .line 166
    .line 167
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 168
    .line 169
    .line 170
    iget-boolean v3, v4, Lro;->a:Z

    .line 171
    .line 172
    iput-boolean v3, p0, Lqo;->a:Z

    .line 173
    .line 174
    iput-object v1, p0, Lqo;->c:Ljava/lang/Object;

    .line 175
    .line 176
    iput-object v0, p0, Lqo;->d:Ljava/io/Serializable;

    .line 177
    .line 178
    iget-boolean v0, v4, Lro;->b:Z

    .line 179
    .line 180
    iput-boolean v0, p0, Lqo;->b:Z

    .line 181
    .line 182
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 183
    .line 184
    .line 185
    array-length v0, v2

    .line 186
    invoke-static {v2, v0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 187
    .line 188
    .line 189
    move-result-object v0

    .line 190
    check-cast v0, [Ljava/lang/String;

    .line 191
    .line 192
    invoke-virtual {p0, v0}, Lqo;->c([Ljava/lang/String;)V

    .line 193
    .line 194
    .line 195
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 196
    .line 197
    .line 198
    array-length v0, v6

    .line 199
    invoke-static {v6, v0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 200
    .line 201
    .line 202
    move-result-object v0

    .line 203
    check-cast v0, [Ljava/lang/String;

    .line 204
    .line 205
    invoke-virtual {p0, v0}, Lqo;->e([Ljava/lang/String;)V

    .line 206
    .line 207
    .line 208
    invoke-virtual {p0}, Lqo;->a()Lro;

    .line 209
    .line 210
    .line 211
    move-result-object p0

    .line 212
    invoke-virtual {p0}, Lro;->c()Ljava/util/List;

    .line 213
    .line 214
    .line 215
    move-result-object v0

    .line 216
    if-eqz v0, :cond_9

    .line 217
    .line 218
    iget-object v0, p0, Lro;->d:[Ljava/lang/String;

    .line 219
    .line 220
    invoke-virtual {p1, v0}, Ljavax/net/ssl/SSLSocket;->setEnabledProtocols([Ljava/lang/String;)V

    .line 221
    .line 222
    .line 223
    :cond_9
    invoke-virtual {p0}, Lro;->a()Ljava/util/List;

    .line 224
    .line 225
    .line 226
    move-result-object v0

    .line 227
    if-eqz v0, :cond_a

    .line 228
    .line 229
    iget-object p0, p0, Lro;->c:[Ljava/lang/String;

    .line 230
    .line 231
    invoke-virtual {p1, p0}, Ljavax/net/ssl/SSLSocket;->setEnabledCipherSuites([Ljava/lang/String;)V

    .line 232
    .line 233
    .line 234
    :cond_a
    return-object v4

    .line 235
    :cond_b
    new-instance v0, Ljava/net/UnknownServiceException;

    .line 236
    .line 237
    new-instance v2, Ljava/lang/StringBuilder;

    .line 238
    .line 239
    const-string v3, "Unable to find acceptable protocols. isFallback="

    .line 240
    .line 241
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 242
    .line 243
    .line 244
    iget-boolean p0, p0, Lso;->c:Z

    .line 245
    .line 246
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 247
    .line 248
    .line 249
    const-string p0, ", modes="

    .line 250
    .line 251
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 252
    .line 253
    .line 254
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 255
    .line 256
    .line 257
    invoke-virtual {p1}, Ljavax/net/ssl/SSLSocket;->getEnabledProtocols()[Ljava/lang/String;

    .line 258
    .line 259
    .line 260
    move-result-object p0

    .line 261
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 262
    .line 263
    .line 264
    invoke-static {p0}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    .line 265
    .line 266
    .line 267
    move-result-object p0

    .line 268
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 269
    .line 270
    .line 271
    const-string p1, ", supported protocols="

    .line 272
    .line 273
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 274
    .line 275
    .line 276
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 277
    .line 278
    .line 279
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 280
    .line 281
    .line 282
    move-result-object p0

    .line 283
    invoke-direct {v0, p0}, Ljava/net/UnknownServiceException;-><init>(Ljava/lang/String;)V

    .line 284
    .line 285
    .line 286
    throw v0
.end method

.method public b(Ljava/lang/String;)V
    .locals 9

    .line 1
    iget-object v0, p0, Lso;->d:Ljava/lang/Object;

    .line 2
    .line 3
    move-object v1, v0

    .line 4
    check-cast v1, Lzy1;

    .line 5
    .line 6
    iget v2, p0, Lso;->a:I

    .line 7
    .line 8
    iget-boolean v3, p0, Lso;->b:Z

    .line 9
    .line 10
    iget-boolean v4, p0, Lso;->c:Z

    .line 11
    .line 12
    const/4 v7, 0x0

    .line 13
    const/4 v8, 0x0

    .line 14
    const/4 v6, 0x0

    .line 15
    move-object v5, p1

    .line 16
    invoke-virtual/range {v1 .. v8}, Lzy1;->q(IZZLjava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public c(Ljava/lang/Object;Ljava/lang/String;)V
    .locals 9

    .line 1
    iget-object v0, p0, Lso;->d:Ljava/lang/Object;

    .line 2
    .line 3
    move-object v1, v0

    .line 4
    check-cast v1, Lzy1;

    .line 5
    .line 6
    iget v2, p0, Lso;->a:I

    .line 7
    .line 8
    iget-boolean v3, p0, Lso;->b:Z

    .line 9
    .line 10
    iget-boolean v4, p0, Lso;->c:Z

    .line 11
    .line 12
    const/4 v7, 0x0

    .line 13
    const/4 v8, 0x0

    .line 14
    move-object v6, p1

    .line 15
    move-object v5, p2

    .line 16
    invoke-virtual/range {v1 .. v8}, Lzy1;->q(IZZLjava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 9

    .line 1
    iget-object v0, p0, Lso;->d:Ljava/lang/Object;

    .line 2
    .line 3
    move-object v1, v0

    .line 4
    check-cast v1, Lzy1;

    .line 5
    .line 6
    iget v2, p0, Lso;->a:I

    .line 7
    .line 8
    iget-boolean v3, p0, Lso;->b:Z

    .line 9
    .line 10
    iget-boolean v4, p0, Lso;->c:Z

    .line 11
    .line 12
    const/4 v8, 0x0

    .line 13
    move-object v5, p1

    .line 14
    move-object v6, p2

    .line 15
    move-object v7, p3

    .line 16
    invoke-virtual/range {v1 .. v8}, Lzy1;->q(IZZLjava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public e(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 9

    .line 1
    iget-object v0, p0, Lso;->d:Ljava/lang/Object;

    .line 2
    .line 3
    move-object v1, v0

    .line 4
    check-cast v1, Lzy1;

    .line 5
    .line 6
    iget v2, p0, Lso;->a:I

    .line 7
    .line 8
    iget-boolean v3, p0, Lso;->b:Z

    .line 9
    .line 10
    iget-boolean v4, p0, Lso;->c:Z

    .line 11
    .line 12
    move-object v5, p1

    .line 13
    move-object v6, p2

    .line 14
    move-object v7, p3

    .line 15
    move-object v8, p4

    .line 16
    invoke-virtual/range {v1 .. v8}, Lzy1;->q(IZZLjava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method
