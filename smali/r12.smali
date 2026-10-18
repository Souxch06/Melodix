.class public final Lr12;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Ltu1;

.field public final synthetic k:Lbc2;

.field public final synthetic l:Lk22;


# direct methods
.method public constructor <init>(Lk22;Ltu1;Lbc2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lr12;->j:Ltu1;

    .line 5
    .line 6
    iput-object p3, p0, Lr12;->k:Lbc2;

    .line 7
    .line 8
    iput-object p1, p0, Lr12;->l:Lk22;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 11

    .line 1
    iget-object v0, p0, Lr12;->l:Lk22;

    .line 2
    .line 3
    iget-object v0, v0, Lk22;->b:Lsa2;

    .line 4
    .line 5
    const-string v1, "_cmp"

    .line 6
    .line 7
    iget-object v2, p0, Lr12;->j:Ltu1;

    .line 8
    .line 9
    iget-object v3, v2, Ltu1;->j:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_2

    .line 16
    .line 17
    iget-object v5, v2, Ltu1;->k:Lsu1;

    .line 18
    .line 19
    if-eqz v5, :cond_2

    .line 20
    .line 21
    iget-object v1, v5, Lsu1;->j:Landroid/os/Bundle;

    .line 22
    .line 23
    invoke-virtual {v1}, Landroid/os/BaseBundle;->size()I

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    if-nez v3, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const-string v3, "_cis"

    .line 31
    .line 32
    invoke-virtual {v1, v3}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    const-string v3, "referrer broadcast"

    .line 37
    .line 38
    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    if-nez v3, :cond_1

    .line 43
    .line 44
    const-string v3, "referrer API"

    .line 45
    .line 46
    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    if-eqz v1, :cond_2

    .line 51
    .line 52
    :cond_1
    invoke-virtual {v0}, Lsa2;->b()Lzy1;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    iget-object v1, v1, Lzy1;->u:Lso;

    .line 57
    .line 58
    invoke-virtual {v2}, Ltu1;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    const-string v4, "Event has been filtered "

    .line 63
    .line 64
    invoke-virtual {v1, v3, v4}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    new-instance v3, Ltu1;

    .line 68
    .line 69
    iget-object v6, v2, Ltu1;->l:Ljava/lang/String;

    .line 70
    .line 71
    iget-wide v7, v2, Ltu1;->m:J

    .line 72
    .line 73
    iget-wide v9, v2, Ltu1;->n:J

    .line 74
    .line 75
    const-string v4, "_cmpx"

    .line 76
    .line 77
    invoke-direct/range {v3 .. v10}, Ltu1;-><init>(Ljava/lang/String;Lsu1;Ljava/lang/String;JJ)V

    .line 78
    .line 79
    .line 80
    move-object v2, v3

    .line 81
    :cond_2
    :goto_0
    iget-object v1, v2, Ltu1;->j:Ljava/lang/String;

    .line 82
    .line 83
    iget-object v3, v0, Lsa2;->j:Lk02;

    .line 84
    .line 85
    iget-object v4, v0, Lsa2;->p:Lva2;

    .line 86
    .line 87
    invoke-static {v3}, Lsa2;->T(Laa2;)V

    .line 88
    .line 89
    .line 90
    iget-object p0, p0, Lr12;->k:Lbc2;

    .line 91
    .line 92
    iget-object v5, p0, Lbc2;->j:Ljava/lang/String;

    .line 93
    .line 94
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 95
    .line 96
    .line 97
    move-result v6

    .line 98
    if-eqz v6, :cond_3

    .line 99
    .line 100
    const/4 v3, 0x0

    .line 101
    goto :goto_1

    .line 102
    :cond_3
    iget-object v3, v3, Lk02;->t:Lc02;

    .line 103
    .line 104
    invoke-virtual {v3, v5}, Lvk0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object v3

    .line 108
    check-cast v3, Lfv1;

    .line 109
    .line 110
    :goto_1
    if-eqz v3, :cond_8

    .line 111
    .line 112
    :try_start_0
    iget-object v5, v3, Lfv1;->c:Lc9;

    .line 113
    .line 114
    invoke-static {v4}, Lsa2;->T(Laa2;)V

    .line 115
    .line 116
    .line 117
    iget-object v6, v2, Ltu1;->k:Lsu1;

    .line 118
    .line 119
    invoke-virtual {v6}, Lsu1;->e()Landroid/os/Bundle;

    .line 120
    .line 121
    .line 122
    move-result-object v6

    .line 123
    const/4 v7, 0x1

    .line 124
    invoke-static {v6, v7}, Lva2;->Z(Landroid/os/Bundle;Z)Ljava/util/HashMap;

    .line 125
    .line 126
    .line 127
    move-result-object v6

    .line 128
    sget-object v7, Lbv;->h:[Ljava/lang/String;

    .line 129
    .line 130
    sget-object v8, Lbv;->c:[Ljava/lang/String;

    .line 131
    .line 132
    invoke-static {v1, v7, v8}, Lst;->B(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object v7

    .line 136
    if-eqz v7, :cond_4

    .line 137
    .line 138
    goto :goto_2

    .line 139
    :cond_4
    move-object v7, v1

    .line 140
    :goto_2
    new-instance v8, Lcn1;

    .line 141
    .line 142
    iget-wide v9, v2, Ltu1;->m:J

    .line 143
    .line 144
    invoke-direct {v8, v7, v9, v10, v6}, Lcn1;-><init>(Ljava/lang/String;JLjava/util/HashMap;)V

    .line 145
    .line 146
    .line 147
    invoke-virtual {v3, v8}, Lfv1;->a(Lcn1;)Z

    .line 148
    .line 149
    .line 150
    move-result v3
    :try_end_0
    .catch Lew1; {:try_start_0 .. :try_end_0} :catch_0

    .line 151
    if-nez v3, :cond_5

    .line 152
    .line 153
    goto/16 :goto_5

    .line 154
    .line 155
    :cond_5
    iget-object v3, v5, Lc9;->l:Ljava/lang/Object;

    .line 156
    .line 157
    check-cast v3, Lcn1;

    .line 158
    .line 159
    iget-object v6, v5, Lc9;->k:Ljava/lang/Object;

    .line 160
    .line 161
    check-cast v6, Lcn1;

    .line 162
    .line 163
    invoke-virtual {v3, v6}, Lcn1;->equals(Ljava/lang/Object;)Z

    .line 164
    .line 165
    .line 166
    move-result v3

    .line 167
    if-nez v3, :cond_6

    .line 168
    .line 169
    invoke-virtual {v0}, Lsa2;->b()Lzy1;

    .line 170
    .line 171
    .line 172
    move-result-object v2

    .line 173
    iget-object v2, v2, Lzy1;->w:Lso;

    .line 174
    .line 175
    const-string v3, "EES edited event"

    .line 176
    .line 177
    invoke-virtual {v2, v1, v3}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 178
    .line 179
    .line 180
    invoke-static {v4}, Lsa2;->T(Laa2;)V

    .line 181
    .line 182
    .line 183
    iget-object v1, v5, Lc9;->l:Ljava/lang/Object;

    .line 184
    .line 185
    check-cast v1, Lcn1;

    .line 186
    .line 187
    invoke-static {v1}, Lva2;->p(Lcn1;)Ltu1;

    .line 188
    .line 189
    .line 190
    move-result-object v1

    .line 191
    invoke-virtual {v0}, Lsa2;->V()V

    .line 192
    .line 193
    .line 194
    invoke-virtual {v0, v1, p0}, Lsa2;->j(Ltu1;Lbc2;)V

    .line 195
    .line 196
    .line 197
    goto :goto_3

    .line 198
    :cond_6
    invoke-virtual {v0}, Lsa2;->V()V

    .line 199
    .line 200
    .line 201
    invoke-virtual {v0, v2, p0}, Lsa2;->j(Ltu1;Lbc2;)V

    .line 202
    .line 203
    .line 204
    :goto_3
    iget-object v1, v5, Lc9;->m:Ljava/lang/Object;

    .line 205
    .line 206
    check-cast v1, Ljava/util/ArrayList;

    .line 207
    .line 208
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 209
    .line 210
    .line 211
    move-result v1

    .line 212
    if-nez v1, :cond_7

    .line 213
    .line 214
    iget-object v1, v5, Lc9;->m:Ljava/lang/Object;

    .line 215
    .line 216
    check-cast v1, Ljava/util/ArrayList;

    .line 217
    .line 218
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 219
    .line 220
    .line 221
    move-result v2

    .line 222
    const/4 v3, 0x0

    .line 223
    :goto_4
    if-ge v3, v2, :cond_7

    .line 224
    .line 225
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 226
    .line 227
    .line 228
    move-result-object v5

    .line 229
    add-int/lit8 v3, v3, 0x1

    .line 230
    .line 231
    check-cast v5, Lcn1;

    .line 232
    .line 233
    invoke-virtual {v0}, Lsa2;->b()Lzy1;

    .line 234
    .line 235
    .line 236
    move-result-object v6

    .line 237
    iget-object v6, v6, Lzy1;->w:Lso;

    .line 238
    .line 239
    iget-object v7, v5, Lcn1;->a:Ljava/lang/String;

    .line 240
    .line 241
    const-string v8, "EES logging created event"

    .line 242
    .line 243
    invoke-virtual {v6, v7, v8}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 244
    .line 245
    .line 246
    invoke-static {v4}, Lsa2;->T(Laa2;)V

    .line 247
    .line 248
    .line 249
    invoke-static {v5}, Lva2;->p(Lcn1;)Ltu1;

    .line 250
    .line 251
    .line 252
    move-result-object v5

    .line 253
    invoke-virtual {v0}, Lsa2;->V()V

    .line 254
    .line 255
    .line 256
    invoke-virtual {v0, v5, p0}, Lsa2;->j(Ltu1;Lbc2;)V

    .line 257
    .line 258
    .line 259
    goto :goto_4

    .line 260
    :cond_7
    return-void

    .line 261
    :catch_0
    invoke-virtual {v0}, Lsa2;->b()Lzy1;

    .line 262
    .line 263
    .line 264
    move-result-object v3

    .line 265
    iget-object v3, v3, Lzy1;->o:Lso;

    .line 266
    .line 267
    iget-object v4, p0, Lbc2;->k:Ljava/lang/String;

    .line 268
    .line 269
    const-string v5, "EES error. appId, eventName"

    .line 270
    .line 271
    invoke-virtual {v3, v5, v4, v1}, Lso;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 272
    .line 273
    .line 274
    :goto_5
    invoke-virtual {v0}, Lsa2;->b()Lzy1;

    .line 275
    .line 276
    .line 277
    move-result-object v3

    .line 278
    iget-object v3, v3, Lzy1;->w:Lso;

    .line 279
    .line 280
    const-string v4, "EES was not applied to event"

    .line 281
    .line 282
    invoke-virtual {v3, v1, v4}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 283
    .line 284
    .line 285
    invoke-virtual {v0}, Lsa2;->V()V

    .line 286
    .line 287
    .line 288
    invoke-virtual {v0, v2, p0}, Lsa2;->j(Ltu1;Lbc2;)V

    .line 289
    .line 290
    .line 291
    return-void

    .line 292
    :cond_8
    invoke-virtual {v0}, Lsa2;->b()Lzy1;

    .line 293
    .line 294
    .line 295
    move-result-object v1

    .line 296
    iget-object v1, v1, Lzy1;->w:Lso;

    .line 297
    .line 298
    iget-object v3, p0, Lbc2;->j:Ljava/lang/String;

    .line 299
    .line 300
    const-string v4, "EES not loaded for"

    .line 301
    .line 302
    invoke-virtual {v1, v3, v4}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 303
    .line 304
    .line 305
    invoke-virtual {v0}, Lsa2;->V()V

    .line 306
    .line 307
    .line 308
    invoke-virtual {v0, v2, p0}, Lsa2;->j(Ltu1;Lbc2;)V

    .line 309
    .line 310
    .line 311
    return-void
.end method
