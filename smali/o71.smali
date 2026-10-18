.class public final Lo71;
.super Lcb1;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lf90;


# instance fields
.field public final synthetic n:I

.field public synthetic o:Ljava/lang/Object;

.field public final synthetic p:Lq71;


# direct methods
.method public synthetic constructor <init>(Lq71;Liq;I)V
    .locals 0

    .line 1
    iput p3, p0, Lo71;->n:I

    .line 2
    .line 3
    iput-object p1, p0, Lo71;->p:Lq71;

    .line 4
    .line 5
    const/4 p1, 0x2

    .line 6
    invoke-direct {p0, p1, p2}, Lcb1;-><init>(ILiq;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget v0, p0, Lo71;->n:I

    .line 2
    .line 3
    sget-object v1, Lwe1;->a:Lwe1;

    .line 4
    .line 5
    check-cast p1, Lu41;

    .line 6
    .line 7
    check-cast p2, Liq;

    .line 8
    .line 9
    packed-switch v0, :pswitch_data_0

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, p2, p1}, Lo71;->j(Liq;Ljava/lang/Object;)Liq;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Lo71;

    .line 17
    .line 18
    invoke-virtual {p0, v1}, Lo71;->m(Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0

    .line 23
    :pswitch_0
    invoke-virtual {p0, p2, p1}, Lo71;->j(Liq;Ljava/lang/Object;)Liq;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    check-cast p0, Lo71;

    .line 28
    .line 29
    invoke-virtual {p0, v1}, Lo71;->m(Ljava/lang/Object;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0

    .line 34
    nop

    .line 35
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final j(Liq;Ljava/lang/Object;)Liq;
    .locals 2

    .line 1
    iget v0, p0, Lo71;->n:I

    .line 2
    .line 3
    iget-object p0, p0, Lo71;->p:Lq71;

    .line 4
    .line 5
    packed-switch v0, :pswitch_data_0

    .line 6
    .line 7
    .line 8
    new-instance v0, Lo71;

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    invoke-direct {v0, p0, p1, v1}, Lo71;-><init>(Lq71;Liq;I)V

    .line 12
    .line 13
    .line 14
    iput-object p2, v0, Lo71;->o:Ljava/lang/Object;

    .line 15
    .line 16
    return-object v0

    .line 17
    :pswitch_0
    new-instance v0, Lo71;

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    invoke-direct {v0, p0, p1, v1}, Lo71;-><init>(Lq71;Liq;I)V

    .line 21
    .line 22
    .line 23
    iput-object p2, v0, Lo71;->o:Ljava/lang/Object;

    .line 24
    .line 25
    return-object v0

    .line 26
    nop

    .line 27
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final m(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 13

    .line 1
    iget v0, p0, Lo71;->n:I

    .line 2
    .line 3
    iget-object v1, p0, Lo71;->p:Lq71;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    packed-switch v0, :pswitch_data_0

    .line 7
    .line 8
    .line 9
    invoke-static {p1}, Lk42;->n(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lo71;->o:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast p0, Lu41;

    .line 15
    .line 16
    iget-object p1, v1, Lq71;->f:Liv0;

    .line 17
    .line 18
    invoke-virtual {v1, p0}, Lq71;->d(Lu41;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iget-object v3, p0, Lu41;->c:Ljava/util/Map;

    .line 23
    .line 24
    const/4 v4, 0x1

    .line 25
    if-eqz v3, :cond_7

    .line 26
    .line 27
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 28
    .line 29
    .line 30
    iget-boolean v5, p1, Liv0;->f:Z

    .line 31
    .line 32
    const/4 v6, 0x0

    .line 33
    if-eqz v5, :cond_0

    .line 34
    .line 35
    goto/16 :goto_4

    .line 36
    .line 37
    :cond_0
    iget-object v5, p1, Liv0;->a:Landroid/content/Context;

    .line 38
    .line 39
    invoke-static {v5}, Ldl1;->h(Landroid/content/Context;)Ljava/util/ArrayList;

    .line 40
    .line 41
    .line 42
    move-result-object v5

    .line 43
    new-instance v7, Ljava/util/ArrayList;

    .line 44
    .line 45
    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    .line 49
    .line 50
    .line 51
    move-result v8

    .line 52
    move v9, v6

    .line 53
    :cond_1
    :goto_0
    if-ge v9, v8, :cond_3

    .line 54
    .line 55
    invoke-virtual {v5, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v10

    .line 59
    add-int/lit8 v9, v9, 0x1

    .line 60
    .line 61
    check-cast v10, Ljv0;

    .line 62
    .line 63
    iget-object v11, v10, Ljv0;->a:Ljava/lang/String;

    .line 64
    .line 65
    invoke-interface {v3, v11}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v11

    .line 69
    check-cast v11, Lgv0;

    .line 70
    .line 71
    if-eqz v11, :cond_2

    .line 72
    .line 73
    new-instance v12, Lps0;

    .line 74
    .line 75
    invoke-direct {v12, v10, v11}, Lps0;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 76
    .line 77
    .line 78
    goto :goto_1

    .line 79
    :cond_2
    move-object v12, v2

    .line 80
    :goto_1
    if-eqz v12, :cond_1

    .line 81
    .line 82
    invoke-virtual {v7, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_3
    invoke-virtual {v7}, Ljava/util/ArrayList;->isEmpty()Z

    .line 87
    .line 88
    .line 89
    move-result v5

    .line 90
    if-eqz v5, :cond_4

    .line 91
    .line 92
    goto :goto_3

    .line 93
    :cond_4
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    .line 94
    .line 95
    .line 96
    move-result v5

    .line 97
    move v8, v6

    .line 98
    :cond_5
    :goto_2
    if-ge v8, v5, :cond_7

    .line 99
    .line 100
    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object v9

    .line 104
    add-int/lit8 v8, v8, 0x1

    .line 105
    .line 106
    check-cast v9, Lps0;

    .line 107
    .line 108
    iget-object v10, v9, Lps0;->j:Ljava/lang/Object;

    .line 109
    .line 110
    check-cast v10, Ljv0;

    .line 111
    .line 112
    iget-object v9, v9, Lps0;->k:Ljava/lang/Object;

    .line 113
    .line 114
    check-cast v9, Lgv0;

    .line 115
    .line 116
    invoke-virtual {p1}, Liv0;->a()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v11

    .line 120
    iget-object v12, v10, Ljv0;->a:Ljava/lang/String;

    .line 121
    .line 122
    invoke-static {v11, v12}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 123
    .line 124
    .line 125
    move-result v11

    .line 126
    iget v10, v10, Ljv0;->b:I

    .line 127
    .line 128
    if-eqz v11, :cond_6

    .line 129
    .line 130
    iget v11, v9, Lgv0;->a:I

    .line 131
    .line 132
    if-ne v10, v11, :cond_5

    .line 133
    .line 134
    iget-object v10, p1, Liv0;->d:Lgb1;

    .line 135
    .line 136
    invoke-virtual {v10}, Lgb1;->getValue()Ljava/lang/Object;

    .line 137
    .line 138
    .line 139
    move-result-object v10

    .line 140
    check-cast v10, Ljava/lang/String;

    .line 141
    .line 142
    iget-object v9, v9, Lgv0;->b:Ljava/lang/String;

    .line 143
    .line 144
    invoke-static {v10, v9}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 145
    .line 146
    .line 147
    move-result v9

    .line 148
    if-nez v9, :cond_8

    .line 149
    .line 150
    goto :goto_2

    .line 151
    :cond_6
    iget v9, v9, Lgv0;->a:I

    .line 152
    .line 153
    if-eq v10, v9, :cond_8

    .line 154
    .line 155
    goto :goto_2

    .line 156
    :cond_7
    :goto_3
    move v6, v4

    .line 157
    :cond_8
    :goto_4
    invoke-virtual {v1, p0}, Lq71;->c(Lu41;)Z

    .line 158
    .line 159
    .line 160
    move-result v5

    .line 161
    if-eqz v6, :cond_9

    .line 162
    .line 163
    sget-object v3, Lv00;->j:Lv00;

    .line 164
    .line 165
    invoke-virtual {p1, v3}, Liv0;->b(Ljava/util/Map;)Ljava/util/Map;

    .line 166
    .line 167
    .line 168
    move-result-object v3

    .line 169
    goto :goto_5

    .line 170
    :cond_9
    if-eqz v5, :cond_a

    .line 171
    .line 172
    invoke-virtual {p1, v3}, Liv0;->b(Ljava/util/Map;)Ljava/util/Map;

    .line 173
    .line 174
    .line 175
    move-result-object v3

    .line 176
    :cond_a
    :goto_5
    if-eqz v6, :cond_b

    .line 177
    .line 178
    move-object v7, v2

    .line 179
    goto :goto_6

    .line 180
    :cond_b
    iget-object v7, p0, Lu41;->a:Ly41;

    .line 181
    .line 182
    :goto_6
    if-nez v0, :cond_d

    .line 183
    .line 184
    if-eqz v6, :cond_c

    .line 185
    .line 186
    goto :goto_7

    .line 187
    :cond_c
    if-eqz v5, :cond_e

    .line 188
    .line 189
    invoke-virtual {p1, v3}, Liv0;->b(Ljava/util/Map;)Ljava/util/Map;

    .line 190
    .line 191
    .line 192
    move-result-object p1

    .line 193
    const/4 v0, 0x3

    .line 194
    invoke-static {p0, v2, v2, p1, v0}, Lu41;->a(Lu41;Ly41;Ljc1;Ljava/util/Map;I)Lu41;

    .line 195
    .line 196
    .line 197
    move-result-object p0

    .line 198
    goto :goto_8

    .line 199
    :cond_d
    :goto_7
    iget-object p0, v1, Lq71;->b:Le51;

    .line 200
    .line 201
    invoke-virtual {p0, v7}, Le51;->a(Ly41;)Ly41;

    .line 202
    .line 203
    .line 204
    move-result-object p0

    .line 205
    iget-object v0, v1, Lq71;->c:Ld51;

    .line 206
    .line 207
    iget-object v1, v0, Ld51;->e:Lsq;

    .line 208
    .line 209
    invoke-static {v1}, Lfe1;->b(Lsq;)Lgq;

    .line 210
    .line 211
    .line 212
    move-result-object v1

    .line 213
    new-instance v5, Lb51;

    .line 214
    .line 215
    invoke-direct {v5, v0, p0, v2}, Lb51;-><init>(Ld51;Ly41;Liq;)V

    .line 216
    .line 217
    .line 218
    invoke-static {v1, v5}, Lju1;->p(Lzq;Lf90;)Ln91;

    .line 219
    .line 220
    .line 221
    iput-boolean v4, p1, Liv0;->f:Z

    .line 222
    .line 223
    new-instance p1, Lu41;

    .line 224
    .line 225
    invoke-direct {p1, p0, v2, v3}, Lu41;-><init>(Ly41;Ljc1;Ljava/util/Map;)V

    .line 226
    .line 227
    .line 228
    move-object p0, p1

    .line 229
    :cond_e
    :goto_8
    return-object p0

    .line 230
    :pswitch_0
    invoke-static {p1}, Lk42;->n(Ljava/lang/Object;)V

    .line 231
    .line 232
    .line 233
    iget-object p0, p0, Lo71;->o:Ljava/lang/Object;

    .line 234
    .line 235
    check-cast p0, Lu41;

    .line 236
    .line 237
    iget-object p1, v1, Lq71;->d:Lkc1;

    .line 238
    .line 239
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 240
    .line 241
    .line 242
    invoke-static {}, Lkc1;->a()Ljc1;

    .line 243
    .line 244
    .line 245
    move-result-object p1

    .line 246
    const/4 v0, 0x5

    .line 247
    invoke-static {p0, v2, p1, v2, v0}, Lu41;->a(Lu41;Ly41;Ljc1;Ljava/util/Map;I)Lu41;

    .line 248
    .line 249
    .line 250
    move-result-object p0

    .line 251
    return-object p0

    .line 252
    nop

    .line 253
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
