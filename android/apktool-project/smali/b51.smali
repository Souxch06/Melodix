.class public final Lb51;
.super Lcb1;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lf90;


# instance fields
.field public n:Lpe0;

.field public o:Ld51;

.field public p:La51;

.field public q:Lu30;

.field public r:Ly41;

.field public s:Ll51;

.field public t:I

.field public final synthetic u:Ld51;

.field public final synthetic v:Ly41;


# direct methods
.method public constructor <init>(Ld51;Ly41;Liq;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lb51;->u:Ld51;

    .line 2
    .line 3
    iput-object p2, p0, Lb51;->v:Ly41;

    .line 4
    .line 5
    const/4 p1, 0x2

    .line 6
    invoke-direct {p0, p1, p3}, Lcb1;-><init>(ILiq;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lzq;

    .line 2
    .line 3
    check-cast p2, Liq;

    .line 4
    .line 5
    invoke-virtual {p0, p2, p1}, Lb51;->j(Liq;Ljava/lang/Object;)Liq;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lb51;

    .line 10
    .line 11
    sget-object p1, Lwe1;->a:Lwe1;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lb51;->m(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public final j(Liq;Ljava/lang/Object;)Liq;
    .locals 1

    .line 1
    new-instance p2, Lb51;

    .line 2
    .line 3
    iget-object v0, p0, Lb51;->u:Ld51;

    .line 4
    .line 5
    iget-object p0, p0, Lb51;->v:Ly41;

    .line 6
    .line 7
    invoke-direct {p2, v0, p0, p1}, Lb51;-><init>(Ld51;Ly41;Liq;)V

    .line 8
    .line 9
    .line 10
    return-object p2
.end method

.method public final m(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget v1, v0, Lb51;->t:I

    .line 4
    .line 5
    const/4 v2, 0x3

    .line 6
    const/4 v3, 0x2

    .line 7
    const/4 v4, 0x1

    .line 8
    iget-object v5, v0, Lb51;->u:Ld51;

    .line 9
    .line 10
    sget-object v6, Lar;->j:Lar;

    .line 11
    .line 12
    if-eqz v1, :cond_3

    .line 13
    .line 14
    if-eq v1, v4, :cond_2

    .line 15
    .line 16
    if-eq v1, v3, :cond_1

    .line 17
    .line 18
    if-ne v1, v2, :cond_0

    .line 19
    .line 20
    iget-object v1, v0, Lb51;->s:Ll51;

    .line 21
    .line 22
    iget-object v2, v0, Lb51;->r:Ly41;

    .line 23
    .line 24
    iget-object v3, v0, Lb51;->q:Lu30;

    .line 25
    .line 26
    iget-object v4, v0, Lb51;->p:La51;

    .line 27
    .line 28
    iget-object v5, v0, Lb51;->o:Ld51;

    .line 29
    .line 30
    iget-object v0, v0, Lb51;->n:Lpe0;

    .line 31
    .line 32
    invoke-static/range {p1 .. p1}, Lk42;->n(Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    move-object v7, v1

    .line 36
    move-object v1, v0

    .line 37
    move-object/from16 v0, p1

    .line 38
    .line 39
    goto :goto_3

    .line 40
    :cond_0
    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 41
    .line 42
    invoke-static {v0}, Lz0;->g(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    const/4 v0, 0x0

    .line 46
    return-object v0

    .line 47
    :cond_1
    invoke-static/range {p1 .. p1}, Lk42;->n(Ljava/lang/Object;)V

    .line 48
    .line 49
    .line 50
    move-object/from16 v1, p1

    .line 51
    .line 52
    goto :goto_1

    .line 53
    :cond_2
    invoke-static/range {p1 .. p1}, Lk42;->n(Ljava/lang/Object;)V

    .line 54
    .line 55
    .line 56
    move-object/from16 v1, p1

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_3
    invoke-static/range {p1 .. p1}, Lk42;->n(Ljava/lang/Object;)V

    .line 60
    .line 61
    .line 62
    iput v4, v0, Lb51;->t:I

    .line 63
    .line 64
    sget v1, Ld51;->g:I

    .line 65
    .line 66
    invoke-virtual {v5, v0}, Ld51;->a(Lkq;)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    if-ne v1, v6, :cond_4

    .line 71
    .line 72
    goto :goto_2

    .line 73
    :cond_4
    :goto_0
    check-cast v1, Ljava/lang/Boolean;

    .line 74
    .line 75
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    if-eqz v1, :cond_b

    .line 80
    .line 81
    iget-object v1, v5, Ld51;->b:Lh40;

    .line 82
    .line 83
    iput v3, v0, Lb51;->t:I

    .line 84
    .line 85
    sget-object v3, Lpe0;->c:Lt11;

    .line 86
    .line 87
    invoke-virtual {v3, v1, v0}, Lt11;->g(Lh40;Lkq;)Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    if-ne v1, v6, :cond_5

    .line 92
    .line 93
    goto :goto_2

    .line 94
    :cond_5
    :goto_1
    check-cast v1, Lpe0;

    .line 95
    .line 96
    sget-object v4, La51;->a:La51;

    .line 97
    .line 98
    iget-object v3, v5, Ld51;->a:Lu30;

    .line 99
    .line 100
    iget-object v7, v5, Ld51;->c:Ll51;

    .line 101
    .line 102
    sget-object v8, Ll50;->a:Ll50;

    .line 103
    .line 104
    iput-object v1, v0, Lb51;->n:Lpe0;

    .line 105
    .line 106
    iput-object v5, v0, Lb51;->o:Ld51;

    .line 107
    .line 108
    iput-object v4, v0, Lb51;->p:La51;

    .line 109
    .line 110
    iput-object v3, v0, Lb51;->q:Lu30;

    .line 111
    .line 112
    iget-object v9, v0, Lb51;->v:Ly41;

    .line 113
    .line 114
    iput-object v9, v0, Lb51;->r:Ly41;

    .line 115
    .line 116
    iput-object v7, v0, Lb51;->s:Ll51;

    .line 117
    .line 118
    iput v2, v0, Lb51;->t:I

    .line 119
    .line 120
    invoke-virtual {v8, v0}, Ll50;->b(Lkq;)Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    if-ne v0, v6, :cond_6

    .line 125
    .line 126
    :goto_2
    return-object v6

    .line 127
    :cond_6
    move-object v2, v9

    .line 128
    :goto_3
    check-cast v0, Ljava/util/Map;

    .line 129
    .line 130
    iget-object v15, v1, Lpe0;->a:Ljava/lang/String;

    .line 131
    .line 132
    iget-object v1, v1, Lpe0;->b:Ljava/lang/String;

    .line 133
    .line 134
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 135
    .line 136
    .line 137
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 138
    .line 139
    .line 140
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 141
    .line 142
    .line 143
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 144
    .line 145
    .line 146
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 147
    .line 148
    .line 149
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 150
    .line 151
    .line 152
    new-instance v4, Lz41;

    .line 153
    .line 154
    new-instance v8, Lg51;

    .line 155
    .line 156
    iget-object v9, v2, Ly41;->a:Ljava/lang/String;

    .line 157
    .line 158
    iget-object v10, v2, Ly41;->b:Ljava/lang/String;

    .line 159
    .line 160
    iget v11, v2, Ly41;->c:I

    .line 161
    .line 162
    iget-wide v12, v2, Ly41;->d:J

    .line 163
    .line 164
    new-instance v14, Lut;

    .line 165
    .line 166
    sget-object v2, Lh51;->k:Lh51;

    .line 167
    .line 168
    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 169
    .line 170
    .line 171
    move-result-object v2

    .line 172
    check-cast v2, Llr;

    .line 173
    .line 174
    sget-object v6, Ltt;->m:Ltt;

    .line 175
    .line 176
    sget-object v16, Ltt;->l:Ltt;

    .line 177
    .line 178
    sget-object v17, Ltt;->k:Ltt;

    .line 179
    .line 180
    if-nez v2, :cond_7

    .line 181
    .line 182
    move-object/from16 p0, v1

    .line 183
    .line 184
    move-object/from16 v2, v17

    .line 185
    .line 186
    goto :goto_4

    .line 187
    :cond_7
    iget-object v2, v2, Llr;->a:Lqt;

    .line 188
    .line 189
    invoke-virtual {v2}, Lqt;->l()Z

    .line 190
    .line 191
    .line 192
    move-result v2

    .line 193
    if-eqz v2, :cond_8

    .line 194
    .line 195
    move-object/from16 p0, v1

    .line 196
    .line 197
    move-object/from16 v2, v16

    .line 198
    .line 199
    goto :goto_4

    .line 200
    :cond_8
    move-object/from16 p0, v1

    .line 201
    .line 202
    move-object v2, v6

    .line 203
    :goto_4
    sget-object v1, Lh51;->j:Lh51;

    .line 204
    .line 205
    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 206
    .line 207
    .line 208
    move-result-object v0

    .line 209
    check-cast v0, Llr;

    .line 210
    .line 211
    if-nez v0, :cond_9

    .line 212
    .line 213
    move-object/from16 v6, v17

    .line 214
    .line 215
    goto :goto_5

    .line 216
    :cond_9
    iget-object v0, v0, Llr;->a:Lqt;

    .line 217
    .line 218
    invoke-virtual {v0}, Lqt;->l()Z

    .line 219
    .line 220
    .line 221
    move-result v0

    .line 222
    if-eqz v0, :cond_a

    .line 223
    .line 224
    move-object/from16 v6, v16

    .line 225
    .line 226
    :cond_a
    :goto_5
    invoke-virtual {v7}, Ll51;->a()D

    .line 227
    .line 228
    .line 229
    move-result-wide v0

    .line 230
    invoke-direct {v14, v2, v6, v0, v1}, Lut;-><init>(Ltt;Ltt;D)V

    .line 231
    .line 232
    .line 233
    move-object/from16 v16, p0

    .line 234
    .line 235
    invoke-direct/range {v8 .. v16}, Lg51;-><init>(Ljava/lang/String;Ljava/lang/String;IJLut;Ljava/lang/String;Ljava/lang/String;)V

    .line 236
    .line 237
    .line 238
    invoke-static {v3}, La51;->a(Lu30;)Lv9;

    .line 239
    .line 240
    .line 241
    move-result-object v0

    .line 242
    invoke-direct {v4, v8, v0}, Lz41;-><init>(Lg51;Lv9;)V

    .line 243
    .line 244
    .line 245
    sget v0, Ld51;->g:I

    .line 246
    .line 247
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 248
    .line 249
    .line 250
    :try_start_0
    iget-object v0, v5, Ld51;->d:Lf10;

    .line 251
    .line 252
    invoke-virtual {v0, v4}, Lf10;->a(Lz41;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 253
    .line 254
    .line 255
    :catch_0
    :cond_b
    sget-object v0, Lwe1;->a:Lwe1;

    .line 256
    .line 257
    return-object v0
.end method
