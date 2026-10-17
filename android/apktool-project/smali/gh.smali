.class public final Lgh;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lui1;


# instance fields
.field public j:Ljava/lang/Object;

.field public k:Lvi;

.field public final synthetic l:Lhh;


# direct methods
.method public constructor <init>(Lhh;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lgh;->l:Lhh;

    .line 5
    .line 6
    sget-object p1, Ljh;->p:Log0;

    .line 7
    .line 8
    iput-object p1, p0, Lgh;->j:Ljava/lang/Object;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final a(Lq31;I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lgh;->k:Lvi;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lvi;->a(Lq31;I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final b(Lt50;)Ljava/lang/Object;
    .locals 12

    .line 1
    iget-object v0, p0, Lgh;->j:Ljava/lang/Object;

    .line 2
    .line 3
    sget-object v1, Ljh;->p:Log0;

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    if-eq v0, v1, :cond_0

    .line 7
    .line 8
    sget-object v1, Ljh;->l:Log0;

    .line 9
    .line 10
    if-eq v0, v1, :cond_0

    .line 11
    .line 12
    goto/16 :goto_8

    .line 13
    .line 14
    :cond_0
    sget-object v0, Lhh;->o:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 15
    .line 16
    iget-object v3, p0, Lgh;->l:Lhh;

    .line 17
    .line 18
    invoke-virtual {v0, v3}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Ltj;

    .line 23
    .line 24
    :goto_0
    invoke-virtual {v3}, Lhh;->t()Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-eqz v1, :cond_2

    .line 29
    .line 30
    sget-object p1, Ljh;->l:Log0;

    .line 31
    .line 32
    iput-object p1, p0, Lgh;->j:Ljava/lang/Object;

    .line 33
    .line 34
    invoke-virtual {v3}, Lhh;->l()Ljava/lang/Throwable;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    if-nez p0, :cond_1

    .line 39
    .line 40
    const/4 v2, 0x0

    .line 41
    goto/16 :goto_8

    .line 42
    .line 43
    :cond_1
    sget p1, Le91;->a:I

    .line 44
    .line 45
    throw p0

    .line 46
    :cond_2
    sget-object v1, Lhh;->l:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 47
    .line 48
    invoke-virtual {v1, v3}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->getAndIncrement(Ljava/lang/Object;)J

    .line 49
    .line 50
    .line 51
    move-result-wide v6

    .line 52
    sget v1, Ljh;->b:I

    .line 53
    .line 54
    int-to-long v4, v1

    .line 55
    div-long v8, v6, v4

    .line 56
    .line 57
    rem-long v4, v6, v4

    .line 58
    .line 59
    long-to-int v5, v4

    .line 60
    iget-wide v10, v0, Lq31;->d:J

    .line 61
    .line 62
    cmp-long v1, v10, v8

    .line 63
    .line 64
    if-eqz v1, :cond_4

    .line 65
    .line 66
    invoke-virtual {v3, v8, v9, v0}, Lhh;->i(JLtj;)Ltj;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    if-nez v1, :cond_3

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_3
    move-object v4, v1

    .line 74
    goto :goto_1

    .line 75
    :cond_4
    move-object v4, v0

    .line 76
    :goto_1
    const/4 v8, 0x0

    .line 77
    invoke-virtual/range {v3 .. v8}, Lhh;->D(Ltj;IJLjava/lang/Object;)Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    sget-object v1, Ljh;->m:Log0;

    .line 82
    .line 83
    const/4 v9, 0x0

    .line 84
    if-eq v0, v1, :cond_13

    .line 85
    .line 86
    sget-object v10, Ljh;->o:Log0;

    .line 87
    .line 88
    if-ne v0, v10, :cond_6

    .line 89
    .line 90
    invoke-virtual {v3}, Lhh;->p()J

    .line 91
    .line 92
    .line 93
    move-result-wide v0

    .line 94
    cmp-long v0, v6, v0

    .line 95
    .line 96
    if-gez v0, :cond_5

    .line 97
    .line 98
    invoke-virtual {v4}, Lsm;->a()V

    .line 99
    .line 100
    .line 101
    :cond_5
    move-object v0, v4

    .line 102
    goto :goto_0

    .line 103
    :cond_6
    sget-object v8, Ljh;->n:Log0;

    .line 104
    .line 105
    if-ne v0, v8, :cond_12

    .line 106
    .line 107
    invoke-static {p1}, Lqe0;->i(Liq;)Liq;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    invoke-static {p1}, Las;->m(Liq;)Lvi;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    :try_start_0
    iput-object p1, p0, Lgh;->k:Lvi;

    .line 116
    .line 117
    move-object v8, p0

    .line 118
    invoke-virtual/range {v3 .. v8}, Lhh;->D(Ltj;IJLjava/lang/Object;)Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    if-ne p0, v1, :cond_7

    .line 123
    .line 124
    invoke-virtual {v8, v4, v5}, Lgh;->a(Lq31;I)V

    .line 125
    .line 126
    .line 127
    goto/16 :goto_6

    .line 128
    .line 129
    :catchall_0
    move-exception v0

    .line 130
    move-object p0, v0

    .line 131
    goto/16 :goto_7

    .line 132
    .line 133
    :cond_7
    if-ne p0, v10, :cond_11

    .line 134
    .line 135
    invoke-virtual {v3}, Lhh;->p()J

    .line 136
    .line 137
    .line 138
    move-result-wide v0

    .line 139
    cmp-long p0, v6, v0

    .line 140
    .line 141
    if-gez p0, :cond_8

    .line 142
    .line 143
    invoke-virtual {v4}, Lsm;->a()V

    .line 144
    .line 145
    .line 146
    :cond_8
    sget-object p0, Lhh;->o:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 147
    .line 148
    invoke-virtual {p0, v3}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 149
    .line 150
    .line 151
    move-result-object p0

    .line 152
    check-cast p0, Ltj;

    .line 153
    .line 154
    :goto_2
    invoke-virtual {v3}, Lhh;->t()Z

    .line 155
    .line 156
    .line 157
    move-result v0

    .line 158
    if-eqz v0, :cond_a

    .line 159
    .line 160
    iget-object p0, v8, Lgh;->k:Lvi;

    .line 161
    .line 162
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 163
    .line 164
    .line 165
    iput-object v9, v8, Lgh;->k:Lvi;

    .line 166
    .line 167
    sget-object v0, Ljh;->l:Log0;

    .line 168
    .line 169
    iput-object v0, v8, Lgh;->j:Ljava/lang/Object;

    .line 170
    .line 171
    invoke-virtual {v3}, Lhh;->l()Ljava/lang/Throwable;

    .line 172
    .line 173
    .line 174
    move-result-object v0

    .line 175
    if-nez v0, :cond_9

    .line 176
    .line 177
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 178
    .line 179
    invoke-virtual {p0, v0}, Lvi;->d(Ljava/lang/Object;)V

    .line 180
    .line 181
    .line 182
    goto/16 :goto_6

    .line 183
    .line 184
    :cond_9
    new-instance v1, Lj11;

    .line 185
    .line 186
    invoke-direct {v1, v0}, Lj11;-><init>(Ljava/lang/Throwable;)V

    .line 187
    .line 188
    .line 189
    invoke-virtual {p0, v1}, Lvi;->d(Ljava/lang/Object;)V

    .line 190
    .line 191
    .line 192
    goto/16 :goto_6

    .line 193
    .line 194
    :cond_a
    sget-object v0, Lhh;->l:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 195
    .line 196
    invoke-virtual {v0, v3}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->getAndIncrement(Ljava/lang/Object;)J

    .line 197
    .line 198
    .line 199
    move-result-wide v6

    .line 200
    sget v0, Ljh;->b:I

    .line 201
    .line 202
    int-to-long v0, v0

    .line 203
    div-long v4, v6, v0

    .line 204
    .line 205
    rem-long v0, v6, v0

    .line 206
    .line 207
    long-to-int v0, v0

    .line 208
    iget-wide v1, p0, Lq31;->d:J

    .line 209
    .line 210
    cmp-long v1, v1, v4

    .line 211
    .line 212
    if-eqz v1, :cond_c

    .line 213
    .line 214
    invoke-virtual {v3, v4, v5, p0}, Lhh;->i(JLtj;)Ltj;

    .line 215
    .line 216
    .line 217
    move-result-object v1

    .line 218
    if-nez v1, :cond_b

    .line 219
    .line 220
    goto :goto_2

    .line 221
    :cond_b
    move-object v4, v1

    .line 222
    :goto_3
    move v5, v0

    .line 223
    goto :goto_4

    .line 224
    :cond_c
    move-object v4, p0

    .line 225
    goto :goto_3

    .line 226
    :goto_4
    invoke-virtual/range {v3 .. v8}, Lhh;->D(Ltj;IJLjava/lang/Object;)Ljava/lang/Object;

    .line 227
    .line 228
    .line 229
    move-result-object p0

    .line 230
    move-object v1, v4

    .line 231
    sget-object v0, Ljh;->m:Log0;

    .line 232
    .line 233
    if-ne p0, v0, :cond_d

    .line 234
    .line 235
    invoke-virtual {v8, v1, v5}, Lgh;->a(Lq31;I)V

    .line 236
    .line 237
    .line 238
    goto :goto_6

    .line 239
    :cond_d
    sget-object v0, Ljh;->o:Log0;

    .line 240
    .line 241
    if-ne p0, v0, :cond_f

    .line 242
    .line 243
    invoke-virtual {v3}, Lhh;->p()J

    .line 244
    .line 245
    .line 246
    move-result-wide v4

    .line 247
    cmp-long p0, v6, v4

    .line 248
    .line 249
    if-gez p0, :cond_e

    .line 250
    .line 251
    invoke-virtual {v1}, Lsm;->a()V

    .line 252
    .line 253
    .line 254
    :cond_e
    move-object p0, v1

    .line 255
    goto :goto_2

    .line 256
    :cond_f
    sget-object v0, Ljh;->n:Log0;

    .line 257
    .line 258
    if-eq p0, v0, :cond_10

    .line 259
    .line 260
    invoke-virtual {v1}, Lsm;->a()V

    .line 261
    .line 262
    .line 263
    iput-object p0, v8, Lgh;->j:Ljava/lang/Object;

    .line 264
    .line 265
    iput-object v9, v8, Lgh;->k:Lvi;

    .line 266
    .line 267
    :goto_5
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 268
    .line 269
    invoke-virtual {p1, p0, v9}, Lvi;->A(Ljava/lang/Object;Lg90;)V

    .line 270
    .line 271
    .line 272
    goto :goto_6

    .line 273
    :cond_10
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 274
    .line 275
    const-string v0, "unexpected"

    .line 276
    .line 277
    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 278
    .line 279
    .line 280
    throw p0

    .line 281
    :cond_11
    invoke-virtual {v4}, Lsm;->a()V

    .line 282
    .line 283
    .line 284
    iput-object p0, v8, Lgh;->j:Ljava/lang/Object;

    .line 285
    .line 286
    iput-object v9, v8, Lgh;->k:Lvi;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 287
    .line 288
    goto :goto_5

    .line 289
    :goto_6
    invoke-virtual {p1}, Lvi;->s()Ljava/lang/Object;

    .line 290
    .line 291
    .line 292
    move-result-object p0

    .line 293
    return-object p0

    .line 294
    :goto_7
    invoke-virtual {p1}, Lvi;->z()V

    .line 295
    .line 296
    .line 297
    throw p0

    .line 298
    :cond_12
    move-object v8, p0

    .line 299
    invoke-virtual {v4}, Lsm;->a()V

    .line 300
    .line 301
    .line 302
    iput-object v0, v8, Lgh;->j:Ljava/lang/Object;

    .line 303
    .line 304
    :goto_8
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 305
    .line 306
    .line 307
    move-result-object p0

    .line 308
    return-object p0

    .line 309
    :cond_13
    const-string p0, "unreachable"

    .line 310
    .line 311
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 312
    .line 313
    .line 314
    return-object v9
.end method
