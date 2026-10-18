.class public final Lcu;
.super Lcb1;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lr80;


# instance fields
.field public n:Ljava/lang/Object;

.field public o:Ljava/io/Serializable;

.field public p:Ljava/lang/Object;

.field public q:Ljava/lang/Object;

.field public r:Ljava/util/Iterator;

.field public s:I

.field public t:I

.field public final synthetic u:Lwu;

.field public final synthetic v:Ler0;


# direct methods
.method public constructor <init>(Lwu;Ler0;Liq;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcu;->u:Lwu;

    .line 2
    .line 3
    iput-object p2, p0, Lcu;->v:Ler0;

    .line 4
    .line 5
    const/4 p1, 0x1

    .line 6
    invoke-direct {p0, p1, p3}, Lcb1;-><init>(ILiq;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final g(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    check-cast p1, Liq;

    .line 2
    .line 3
    new-instance v0, Lcu;

    .line 4
    .line 5
    iget-object v1, p0, Lcu;->u:Lwu;

    .line 6
    .line 7
    iget-object p0, p0, Lcu;->v:Ler0;

    .line 8
    .line 9
    invoke-direct {v0, v1, p0, p1}, Lcu;-><init>(Lwu;Ler0;Liq;)V

    .line 10
    .line 11
    .line 12
    sget-object p0, Lwe1;->a:Lwe1;

    .line 13
    .line 14
    invoke-virtual {v0, p0}, Lcu;->m(Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public final m(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 14

    .line 1
    iget v0, p0, Lcu;->t:I

    .line 2
    .line 3
    iget-object v1, p0, Lcu;->v:Ler0;

    .line 4
    .line 5
    const/4 v2, 0x4

    .line 6
    const/4 v3, 0x3

    .line 7
    const/4 v4, 0x2

    .line 8
    iget-object v5, p0, Lcu;->u:Lwu;

    .line 9
    .line 10
    const/4 v6, 0x1

    .line 11
    const/4 v7, 0x0

    .line 12
    sget-object v8, Lar;->j:Lar;

    .line 13
    .line 14
    if-eqz v0, :cond_4

    .line 15
    .line 16
    if-eq v0, v6, :cond_3

    .line 17
    .line 18
    if-eq v0, v4, :cond_2

    .line 19
    .line 20
    if-eq v0, v3, :cond_1

    .line 21
    .line 22
    if-ne v0, v2, :cond_0

    .line 23
    .line 24
    iget v0, p0, Lcu;->s:I

    .line 25
    .line 26
    iget-object p0, p0, Lcu;->n:Ljava/lang/Object;

    .line 27
    .line 28
    invoke-static {p1}, Lk42;->n(Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    goto/16 :goto_6

    .line 32
    .line 33
    :cond_0
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 34
    .line 35
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    return-object v7

    .line 39
    :cond_1
    iget-object v0, p0, Lcu;->p:Ljava/lang/Object;

    .line 40
    .line 41
    check-cast v0, Lzo0;

    .line 42
    .line 43
    iget-object v1, p0, Lcu;->o:Ljava/io/Serializable;

    .line 44
    .line 45
    check-cast v1, Lhz0;

    .line 46
    .line 47
    iget-object v3, p0, Lcu;->n:Ljava/lang/Object;

    .line 48
    .line 49
    check-cast v3, Lez0;

    .line 50
    .line 51
    invoke-static {p1}, Lk42;->n(Ljava/lang/Object;)V

    .line 52
    .line 53
    .line 54
    goto/16 :goto_3

    .line 55
    .line 56
    :cond_2
    iget-object v0, p0, Lcu;->r:Ljava/util/Iterator;

    .line 57
    .line 58
    iget-object v9, p0, Lcu;->q:Ljava/lang/Object;

    .line 59
    .line 60
    check-cast v9, Lbu;

    .line 61
    .line 62
    iget-object v10, p0, Lcu;->p:Ljava/lang/Object;

    .line 63
    .line 64
    check-cast v10, Lhz0;

    .line 65
    .line 66
    iget-object v11, p0, Lcu;->o:Ljava/io/Serializable;

    .line 67
    .line 68
    check-cast v11, Lez0;

    .line 69
    .line 70
    iget-object v12, p0, Lcu;->n:Ljava/lang/Object;

    .line 71
    .line 72
    check-cast v12, Lzo0;

    .line 73
    .line 74
    invoke-static {p1}, Lk42;->n(Ljava/lang/Object;)V

    .line 75
    .line 76
    .line 77
    goto :goto_1

    .line 78
    :cond_3
    iget-object v0, p0, Lcu;->q:Ljava/lang/Object;

    .line 79
    .line 80
    check-cast v0, Lhz0;

    .line 81
    .line 82
    iget-object v9, p0, Lcu;->p:Ljava/lang/Object;

    .line 83
    .line 84
    check-cast v9, Lhz0;

    .line 85
    .line 86
    iget-object v10, p0, Lcu;->o:Ljava/io/Serializable;

    .line 87
    .line 88
    check-cast v10, Lez0;

    .line 89
    .line 90
    iget-object v11, p0, Lcu;->n:Ljava/lang/Object;

    .line 91
    .line 92
    check-cast v11, Lzo0;

    .line 93
    .line 94
    invoke-static {p1}, Lk42;->n(Ljava/lang/Object;)V

    .line 95
    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_4
    invoke-static {p1}, Lk42;->n(Ljava/lang/Object;)V

    .line 99
    .line 100
    .line 101
    invoke-static {}, Lbv;->a()Lzo0;

    .line 102
    .line 103
    .line 104
    move-result-object v11

    .line 105
    new-instance v10, Lez0;

    .line 106
    .line 107
    invoke-direct {v10}, Ljava/lang/Object;-><init>()V

    .line 108
    .line 109
    .line 110
    new-instance v0, Lhz0;

    .line 111
    .line 112
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 113
    .line 114
    .line 115
    iput-object v11, p0, Lcu;->n:Ljava/lang/Object;

    .line 116
    .line 117
    iput-object v10, p0, Lcu;->o:Ljava/io/Serializable;

    .line 118
    .line 119
    iput-object v0, p0, Lcu;->p:Ljava/lang/Object;

    .line 120
    .line 121
    iput-object v0, p0, Lcu;->q:Ljava/lang/Object;

    .line 122
    .line 123
    iput v6, p0, Lcu;->t:I

    .line 124
    .line 125
    invoke-virtual {v5, v6, p0}, Lwu;->h(ZLkq;)Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    if-ne p1, v8, :cond_5

    .line 130
    .line 131
    goto/16 :goto_5

    .line 132
    .line 133
    :cond_5
    move-object v9, v0

    .line 134
    :goto_0
    check-cast p1, Lpt;

    .line 135
    .line 136
    iget-object p1, p1, Lpt;->b:Ljava/lang/Object;

    .line 137
    .line 138
    iput-object p1, v0, Lhz0;->j:Ljava/lang/Object;

    .line 139
    .line 140
    new-instance p1, Lbu;

    .line 141
    .line 142
    invoke-direct {p1, v11, v10, v9, v5}, Lbu;-><init>(Lzo0;Lez0;Lhz0;Lwu;)V

    .line 143
    .line 144
    .line 145
    iget-object v0, v1, Ler0;->m:Ljava/lang/Object;

    .line 146
    .line 147
    check-cast v0, Ljava/util/List;

    .line 148
    .line 149
    if-eqz v0, :cond_8

    .line 150
    .line 151
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 152
    .line 153
    .line 154
    move-result-object v0

    .line 155
    move-object v12, v11

    .line 156
    move-object v11, v10

    .line 157
    move-object v10, v9

    .line 158
    move-object v9, p1

    .line 159
    :cond_6
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 160
    .line 161
    .line 162
    move-result p1

    .line 163
    if-eqz p1, :cond_7

    .line 164
    .line 165
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 166
    .line 167
    .line 168
    move-result-object p1

    .line 169
    check-cast p1, Lf90;

    .line 170
    .line 171
    iput-object v12, p0, Lcu;->n:Ljava/lang/Object;

    .line 172
    .line 173
    iput-object v11, p0, Lcu;->o:Ljava/io/Serializable;

    .line 174
    .line 175
    iput-object v10, p0, Lcu;->p:Ljava/lang/Object;

    .line 176
    .line 177
    iput-object v9, p0, Lcu;->q:Ljava/lang/Object;

    .line 178
    .line 179
    iput-object v0, p0, Lcu;->r:Ljava/util/Iterator;

    .line 180
    .line 181
    iput v4, p0, Lcu;->t:I

    .line 182
    .line 183
    invoke-interface {p1, v9, p0}, Lf90;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 184
    .line 185
    .line 186
    move-result-object p1

    .line 187
    if-ne p1, v8, :cond_6

    .line 188
    .line 189
    goto :goto_5

    .line 190
    :cond_7
    move-object v9, v10

    .line 191
    move-object v10, v11

    .line 192
    move-object v0, v12

    .line 193
    goto :goto_2

    .line 194
    :cond_8
    move-object v0, v11

    .line 195
    :goto_2
    iput-object v7, v1, Ler0;->m:Ljava/lang/Object;

    .line 196
    .line 197
    iput-object v10, p0, Lcu;->n:Ljava/lang/Object;

    .line 198
    .line 199
    iput-object v9, p0, Lcu;->o:Ljava/io/Serializable;

    .line 200
    .line 201
    iput-object v0, p0, Lcu;->p:Ljava/lang/Object;

    .line 202
    .line 203
    iput-object v7, p0, Lcu;->q:Ljava/lang/Object;

    .line 204
    .line 205
    iput-object v7, p0, Lcu;->r:Ljava/util/Iterator;

    .line 206
    .line 207
    iput v3, p0, Lcu;->t:I

    .line 208
    .line 209
    invoke-virtual {v0, p0}, Lzo0;->d(Lkq;)Ljava/lang/Object;

    .line 210
    .line 211
    .line 212
    move-result-object p1

    .line 213
    if-ne p1, v8, :cond_9

    .line 214
    .line 215
    goto :goto_5

    .line 216
    :cond_9
    move-object v1, v9

    .line 217
    move-object v3, v10

    .line 218
    :goto_3
    :try_start_0
    iput-boolean v6, v3, Lez0;->j:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 219
    .line 220
    invoke-virtual {v0, v7}, Lzo0;->f(Ljava/lang/Object;)V

    .line 221
    .line 222
    .line 223
    iget-object p1, v1, Lhz0;->j:Ljava/lang/Object;

    .line 224
    .line 225
    if-eqz p1, :cond_a

    .line 226
    .line 227
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    .line 228
    .line 229
    .line 230
    move-result v0

    .line 231
    goto :goto_4

    .line 232
    :cond_a
    const/4 v0, 0x0

    .line 233
    :goto_4
    invoke-virtual {v5}, Lwu;->c()Lef0;

    .line 234
    .line 235
    .line 236
    move-result-object v1

    .line 237
    iput-object p1, p0, Lcu;->n:Ljava/lang/Object;

    .line 238
    .line 239
    iput-object v7, p0, Lcu;->o:Ljava/io/Serializable;

    .line 240
    .line 241
    iput-object v7, p0, Lcu;->p:Ljava/lang/Object;

    .line 242
    .line 243
    iput v0, p0, Lcu;->s:I

    .line 244
    .line 245
    iput v2, p0, Lcu;->t:I

    .line 246
    .line 247
    invoke-interface {v1, p0}, Lef0;->b(Lkq;)Ljava/lang/Object;

    .line 248
    .line 249
    .line 250
    move-result-object p0

    .line 251
    if-ne p0, v8, :cond_b

    .line 252
    .line 253
    :goto_5
    return-object v8

    .line 254
    :cond_b
    move-object v13, p1

    .line 255
    move-object p1, p0

    .line 256
    move-object p0, v13

    .line 257
    :goto_6
    check-cast p1, Ljava/lang/Number;

    .line 258
    .line 259
    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    .line 260
    .line 261
    .line 262
    move-result p1

    .line 263
    new-instance v1, Lpt;

    .line 264
    .line 265
    invoke-direct {v1, v0, p0, p1}, Lpt;-><init>(ILjava/lang/Object;I)V

    .line 266
    .line 267
    .line 268
    return-object v1

    .line 269
    :catchall_0
    move-exception p0

    .line 270
    invoke-virtual {v0, v7}, Lzo0;->f(Ljava/lang/Object;)V

    .line 271
    .line 272
    .line 273
    throw p0
.end method
