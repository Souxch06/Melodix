.class public final Lfa2;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Lsa2;


# direct methods
.method public constructor <init>(Lsa2;Lnt;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lfa2;->j:Lsa2;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 8

    .line 1
    iget-object p0, p0, Lfa2;->j:Lsa2;

    .line 2
    .line 3
    invoke-virtual {p0}, Lsa2;->c()Ls02;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ls02;->l()V

    .line 8
    .line 9
    .line 10
    new-instance v0, Lzz1;

    .line 11
    .line 12
    invoke-direct {v0, p0}, Lzz1;-><init>(Lsa2;)V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Lsa2;->t:Lzz1;

    .line 16
    .line 17
    new-instance v0, Ldu1;

    .line 18
    .line 19
    invoke-direct {v0, p0}, Ldu1;-><init>(Lsa2;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Laa2;->n()V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Lsa2;->l:Ldu1;

    .line 26
    .line 27
    iget-object v0, p0, Lsa2;->j:Lk02;

    .line 28
    .line 29
    invoke-virtual {p0}, Lsa2;->e0()Lmt1;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-static {v0}, Lbh;->h(Ljava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    iput-object v0, v1, Lmt1;->m:Llt1;

    .line 37
    .line 38
    new-instance v0, Ll82;

    .line 39
    .line 40
    invoke-direct {v0, p0}, Ll82;-><init>(Lsa2;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0}, Laa2;->n()V

    .line 44
    .line 45
    .line 46
    iput-object v0, p0, Lsa2;->r:Ll82;

    .line 47
    .line 48
    new-instance v0, Ldp1;

    .line 49
    .line 50
    invoke-direct {v0, p0}, Laa2;-><init>(Lsa2;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0}, Laa2;->n()V

    .line 54
    .line 55
    .line 56
    iput-object v0, p0, Lsa2;->o:Ldp1;

    .line 57
    .line 58
    new-instance v0, Lhz1;

    .line 59
    .line 60
    const/4 v1, 0x1

    .line 61
    invoke-direct {v0, p0, v1}, Lhz1;-><init>(Lsa2;I)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0}, Laa2;->n()V

    .line 65
    .line 66
    .line 67
    iput-object v0, p0, Lsa2;->q:Lhz1;

    .line 68
    .line 69
    new-instance v0, Lq92;

    .line 70
    .line 71
    invoke-direct {v0, p0}, Lq92;-><init>(Lsa2;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v0}, Laa2;->n()V

    .line 75
    .line 76
    .line 77
    iput-object v0, p0, Lsa2;->n:Lq92;

    .line 78
    .line 79
    new-instance v0, Lnz1;

    .line 80
    .line 81
    invoke-direct {v0, p0}, Lnz1;-><init>(Lsa2;)V

    .line 82
    .line 83
    .line 84
    iput-object v0, p0, Lsa2;->m:Lnz1;

    .line 85
    .line 86
    iget v0, p0, Lsa2;->A:I

    .line 87
    .line 88
    iget v2, p0, Lsa2;->B:I

    .line 89
    .line 90
    if-eq v0, v2, :cond_0

    .line 91
    .line 92
    invoke-virtual {p0}, Lsa2;->b()Lzy1;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    iget-object v0, v0, Lzy1;->o:Lso;

    .line 97
    .line 98
    iget v2, p0, Lsa2;->A:I

    .line 99
    .line 100
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 101
    .line 102
    .line 103
    move-result-object v2

    .line 104
    iget v3, p0, Lsa2;->B:I

    .line 105
    .line 106
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 107
    .line 108
    .line 109
    move-result-object v3

    .line 110
    const-string v4, "Not all upload components initialized"

    .line 111
    .line 112
    invoke-virtual {v0, v4, v2, v3}, Lso;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 113
    .line 114
    .line 115
    :cond_0
    iget-object v0, p0, Lsa2;->v:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 116
    .line 117
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {p0}, Lsa2;->b()Lzy1;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    iget-object v0, v0, Lzy1;->w:Lso;

    .line 125
    .line 126
    const-string v1, "UploadController is now fully initialized"

    .line 127
    .line 128
    invoke-virtual {v0, v1}, Lso;->b(Ljava/lang/String;)V

    .line 129
    .line 130
    .line 131
    invoke-virtual {p0}, Lsa2;->c()Ls02;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    invoke-virtual {v0}, Ls02;->l()V

    .line 136
    .line 137
    .line 138
    iget-object v0, p0, Lsa2;->l:Ldu1;

    .line 139
    .line 140
    invoke-static {v0}, Lsa2;->T(Laa2;)V

    .line 141
    .line 142
    .line 143
    invoke-virtual {v0}, Ldu1;->v()V

    .line 144
    .line 145
    .line 146
    iget-object v0, p0, Lsa2;->l:Ldu1;

    .line 147
    .line 148
    invoke-static {v0}, Lsa2;->T(Laa2;)V

    .line 149
    .line 150
    .line 151
    invoke-virtual {v0}, Let;->l()V

    .line 152
    .line 153
    .line 154
    invoke-virtual {v0}, Laa2;->m()V

    .line 155
    .line 156
    .line 157
    invoke-virtual {v0}, Ldu1;->W()Z

    .line 158
    .line 159
    .line 160
    move-result v1

    .line 161
    const-wide/16 v2, 0x0

    .line 162
    .line 163
    if-eqz v1, :cond_2

    .line 164
    .line 165
    sget-object v1, Lxx1;->u0:Lwx1;

    .line 166
    .line 167
    const/4 v4, 0x0

    .line 168
    invoke-virtual {v1, v4}, Lwx1;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 169
    .line 170
    .line 171
    move-result-object v5

    .line 172
    check-cast v5, Ljava/lang/Long;

    .line 173
    .line 174
    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    .line 175
    .line 176
    .line 177
    move-result-wide v5

    .line 178
    cmp-long v5, v5, v2

    .line 179
    .line 180
    if-nez v5, :cond_1

    .line 181
    .line 182
    goto :goto_0

    .line 183
    :cond_1
    invoke-virtual {v0}, Ldu1;->c0()Landroid/database/sqlite/SQLiteDatabase;

    .line 184
    .line 185
    .line 186
    move-result-object v5

    .line 187
    iget-object v0, v0, Let;->j:Ljava/lang/Object;

    .line 188
    .line 189
    check-cast v0, Ly02;

    .line 190
    .line 191
    iget-object v6, v0, Ly02;->t:Lmz;

    .line 192
    .line 193
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 194
    .line 195
    .line 196
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 197
    .line 198
    .line 199
    move-result-wide v6

    .line 200
    invoke-static {v6, v7}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 201
    .line 202
    .line 203
    move-result-object v6

    .line 204
    invoke-virtual {v1, v4}, Lwx1;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 205
    .line 206
    .line 207
    move-result-object v1

    .line 208
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object v1

    .line 212
    filled-new-array {v6, v1}, [Ljava/lang/String;

    .line 213
    .line 214
    .line 215
    move-result-object v1

    .line 216
    const-string v4, "trigger_uris"

    .line 217
    .line 218
    const-string v6, "abs(timestamp_millis - ?) > cast(? as integer)"

    .line 219
    .line 220
    invoke-virtual {v5, v4, v6, v1}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 221
    .line 222
    .line 223
    move-result v1

    .line 224
    if-lez v1, :cond_2

    .line 225
    .line 226
    iget-object v0, v0, Ly02;->o:Lzy1;

    .line 227
    .line 228
    invoke-static {v0}, Ly02;->l(Lm22;)V

    .line 229
    .line 230
    .line 231
    iget-object v0, v0, Lzy1;->w:Lso;

    .line 232
    .line 233
    const-string v4, "Deleted stale trigger uris. rowsDeleted"

    .line 234
    .line 235
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 236
    .line 237
    .line 238
    move-result-object v1

    .line 239
    invoke-virtual {v0, v1, v4}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 240
    .line 241
    .line 242
    :cond_2
    :goto_0
    iget-object v0, p0, Lsa2;->r:Ll82;

    .line 243
    .line 244
    iget-object v0, v0, Ll82;->q:Lrz1;

    .line 245
    .line 246
    invoke-virtual {v0}, Lrz1;->a()J

    .line 247
    .line 248
    .line 249
    move-result-wide v0

    .line 250
    cmp-long v0, v0, v2

    .line 251
    .line 252
    if-nez v0, :cond_3

    .line 253
    .line 254
    iget-object v0, p0, Lsa2;->r:Ll82;

    .line 255
    .line 256
    iget-object v0, v0, Ll82;->q:Lrz1;

    .line 257
    .line 258
    invoke-virtual {p0}, Lsa2;->f()Lmz;

    .line 259
    .line 260
    .line 261
    move-result-object v1

    .line 262
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 263
    .line 264
    .line 265
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 266
    .line 267
    .line 268
    move-result-wide v1

    .line 269
    invoke-virtual {v0, v1, v2}, Lrz1;->b(J)V

    .line 270
    .line 271
    .line 272
    :cond_3
    invoke-virtual {p0}, Lsa2;->N()V

    .line 273
    .line 274
    .line 275
    return-void
.end method
