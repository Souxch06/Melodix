.class public final Lsu;
.super Lcb1;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lr80;


# instance fields
.field public final synthetic n:I

.field public o:I

.field public final synthetic p:Lwu;

.field public q:Ljava/lang/Object;

.field public final synthetic r:Ljava/lang/Object;

.field public final synthetic s:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lhz0;Lwu;Lfz0;Liq;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lsu;->n:I

    .line 3
    .line 4
    iput-object p1, p0, Lsu;->r:Ljava/lang/Object;

    .line 5
    .line 6
    iput-object p2, p0, Lsu;->p:Lwu;

    .line 7
    .line 8
    iput-object p3, p0, Lsu;->s:Ljava/lang/Object;

    .line 9
    .line 10
    const/4 p1, 0x1

    .line 11
    invoke-direct {p0, p1, p4}, Lcb1;-><init>(ILiq;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public constructor <init>(Lwu;Lsq;Lf90;Liq;)V
    .locals 1

    const/4 v0, 0x1

    iput v0, p0, Lsu;->n:I

    .line 15
    iput-object p1, p0, Lsu;->p:Lwu;

    iput-object p2, p0, Lsu;->r:Ljava/lang/Object;

    iput-object p3, p0, Lsu;->s:Ljava/lang/Object;

    invoke-direct {p0, v0, p4}, Lcb1;-><init>(ILiq;)V

    return-void
.end method


# virtual methods
.method public final g(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    .line 1
    iget v0, p0, Lsu;->n:I

    .line 2
    .line 3
    sget-object v1, Lwe1;->a:Lwe1;

    .line 4
    .line 5
    iget-object v2, p0, Lsu;->s:Ljava/lang/Object;

    .line 6
    .line 7
    iget-object v3, p0, Lsu;->r:Ljava/lang/Object;

    .line 8
    .line 9
    iget-object p0, p0, Lsu;->p:Lwu;

    .line 10
    .line 11
    check-cast p1, Liq;

    .line 12
    .line 13
    packed-switch v0, :pswitch_data_0

    .line 14
    .line 15
    .line 16
    new-instance v0, Lsu;

    .line 17
    .line 18
    check-cast v3, Lsq;

    .line 19
    .line 20
    check-cast v2, Lf90;

    .line 21
    .line 22
    invoke-direct {v0, p0, v3, v2, p1}, Lsu;-><init>(Lwu;Lsq;Lf90;Liq;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lsu;->m(Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0

    .line 30
    :pswitch_0
    new-instance v0, Lsu;

    .line 31
    .line 32
    check-cast v3, Lhz0;

    .line 33
    .line 34
    check-cast v2, Lfz0;

    .line 35
    .line 36
    invoke-direct {v0, v3, p0, v2, p1}, Lsu;-><init>(Lhz0;Lwu;Lfz0;Liq;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, v1}, Lsu;->m(Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0

    .line 44
    nop

    .line 45
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final m(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 10

    .line 1
    iget v0, p0, Lsu;->n:I

    .line 2
    .line 3
    iget-object v1, p0, Lsu;->s:Ljava/lang/Object;

    .line 4
    .line 5
    iget-object v2, p0, Lsu;->r:Ljava/lang/Object;

    .line 6
    .line 7
    const-string v3, "call to \'resume\' before \'invoke\' with coroutine"

    .line 8
    .line 9
    sget-object v4, Lar;->j:Lar;

    .line 10
    .line 11
    const/4 v5, 0x1

    .line 12
    const/4 v6, 0x2

    .line 13
    const/4 v7, 0x3

    .line 14
    iget-object v8, p0, Lsu;->p:Lwu;

    .line 15
    .line 16
    const/4 v9, 0x0

    .line 17
    packed-switch v0, :pswitch_data_0

    .line 18
    .line 19
    .line 20
    iget v0, p0, Lsu;->o:I

    .line 21
    .line 22
    if-eqz v0, :cond_3

    .line 23
    .line 24
    if-eq v0, v5, :cond_2

    .line 25
    .line 26
    if-eq v0, v6, :cond_1

    .line 27
    .line 28
    if-ne v0, v7, :cond_0

    .line 29
    .line 30
    iget-object v4, p0, Lsu;->q:Ljava/lang/Object;

    .line 31
    .line 32
    invoke-static {p1}, Lk42;->n(Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    goto :goto_4

    .line 36
    :cond_0
    invoke-static {v3}, Lz0;->g(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    :goto_0
    move-object v4, v9

    .line 40
    goto :goto_4

    .line 41
    :cond_1
    iget-object v0, p0, Lsu;->q:Ljava/lang/Object;

    .line 42
    .line 43
    check-cast v0, Lpt;

    .line 44
    .line 45
    invoke-static {p1}, Lk42;->n(Ljava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    goto :goto_2

    .line 49
    :cond_2
    invoke-static {p1}, Lk42;->n(Ljava/lang/Object;)V

    .line 50
    .line 51
    .line 52
    goto :goto_1

    .line 53
    :cond_3
    invoke-static {p1}, Lk42;->n(Ljava/lang/Object;)V

    .line 54
    .line 55
    .line 56
    iput v5, p0, Lsu;->o:I

    .line 57
    .line 58
    invoke-virtual {v8, v5, p0}, Lwu;->h(ZLkq;)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    if-ne p1, v4, :cond_4

    .line 63
    .line 64
    goto :goto_4

    .line 65
    :cond_4
    :goto_1
    move-object v0, p1

    .line 66
    check-cast v0, Lpt;

    .line 67
    .line 68
    check-cast v2, Lsq;

    .line 69
    .line 70
    new-instance p1, Loj;

    .line 71
    .line 72
    check-cast v1, Lf90;

    .line 73
    .line 74
    const/4 v3, 0x4

    .line 75
    invoke-direct {p1, v1, v0, v9, v3}, Loj;-><init>(Ljava/lang/Object;Ljava/lang/Object;Liq;I)V

    .line 76
    .line 77
    .line 78
    iput-object v0, p0, Lsu;->q:Ljava/lang/Object;

    .line 79
    .line 80
    iput v6, p0, Lsu;->o:I

    .line 81
    .line 82
    invoke-static {v2, p1, p0}, Lju1;->x(Lsq;Lf90;Lkq;)Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    if-ne p1, v4, :cond_5

    .line 87
    .line 88
    goto :goto_4

    .line 89
    :cond_5
    :goto_2
    iget-object v1, v0, Lpt;->b:Ljava/lang/Object;

    .line 90
    .line 91
    if-eqz v1, :cond_6

    .line 92
    .line 93
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    goto :goto_3

    .line 98
    :cond_6
    const/4 v1, 0x0

    .line 99
    :goto_3
    iget v2, v0, Lpt;->c:I

    .line 100
    .line 101
    if-ne v1, v2, :cond_8

    .line 102
    .line 103
    iget-object v0, v0, Lpt;->b:Ljava/lang/Object;

    .line 104
    .line 105
    invoke-static {v0, p1}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    if-nez v0, :cond_7

    .line 110
    .line 111
    iput-object p1, p0, Lsu;->q:Ljava/lang/Object;

    .line 112
    .line 113
    iput v7, p0, Lsu;->o:I

    .line 114
    .line 115
    invoke-virtual {v8, p1, v5, p0}, Lwu;->i(Ljava/lang/Object;ZLkq;)Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    if-ne p0, v4, :cond_7

    .line 120
    .line 121
    goto :goto_4

    .line 122
    :cond_7
    move-object v4, p1

    .line 123
    goto :goto_4

    .line 124
    :cond_8
    const-string p0, "Data in DataStore was mutated but DataStore is only compatible with Immutable types."

    .line 125
    .line 126
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    goto :goto_0

    .line 130
    :goto_4
    return-object v4

    .line 131
    :pswitch_0
    check-cast v1, Lfz0;

    .line 132
    .line 133
    check-cast v2, Lhz0;

    .line 134
    .line 135
    iget v0, p0, Lsu;->o:I

    .line 136
    .line 137
    if-eqz v0, :cond_c

    .line 138
    .line 139
    if-eq v0, v5, :cond_b

    .line 140
    .line 141
    if-eq v0, v6, :cond_a

    .line 142
    .line 143
    if-ne v0, v7, :cond_9

    .line 144
    .line 145
    iget-object p0, p0, Lsu;->q:Ljava/lang/Object;

    .line 146
    .line 147
    check-cast p0, Ljava/io/Serializable;

    .line 148
    .line 149
    move-object v1, p0

    .line 150
    check-cast v1, Lfz0;

    .line 151
    .line 152
    invoke-static {p1}, Lk42;->n(Ljava/lang/Object;)V

    .line 153
    .line 154
    .line 155
    goto :goto_7

    .line 156
    :cond_9
    invoke-static {v3}, Lz0;->g(Ljava/lang/String;)V

    .line 157
    .line 158
    .line 159
    move-object v4, v9

    .line 160
    goto :goto_9

    .line 161
    :cond_a
    iget-object v0, p0, Lsu;->q:Ljava/lang/Object;

    .line 162
    .line 163
    check-cast v0, Ljava/io/Serializable;

    .line 164
    .line 165
    check-cast v0, Lfz0;

    .line 166
    .line 167
    :try_start_0
    invoke-static {p1}, Lk42;->n(Ljava/lang/Object;)V
    :try_end_0
    .catch Ler; {:try_start_0 .. :try_end_0} :catch_0

    .line 168
    .line 169
    .line 170
    goto :goto_6

    .line 171
    :cond_b
    iget-object v0, p0, Lsu;->q:Ljava/lang/Object;

    .line 172
    .line 173
    check-cast v0, Ljava/io/Serializable;

    .line 174
    .line 175
    check-cast v0, Lhz0;

    .line 176
    .line 177
    :try_start_1
    invoke-static {p1}, Lk42;->n(Ljava/lang/Object;)V
    :try_end_1
    .catch Ler; {:try_start_1 .. :try_end_1} :catch_0

    .line 178
    .line 179
    .line 180
    goto :goto_5

    .line 181
    :cond_c
    invoke-static {p1}, Lk42;->n(Ljava/lang/Object;)V

    .line 182
    .line 183
    .line 184
    :try_start_2
    iput-object v2, p0, Lsu;->q:Ljava/lang/Object;

    .line 185
    .line 186
    iput v5, p0, Lsu;->o:I

    .line 187
    .line 188
    iget-object p1, v8, Lwu;->j:Lgb1;

    .line 189
    .line 190
    invoke-virtual {p1}, Lgb1;->getValue()Ljava/lang/Object;

    .line 191
    .line 192
    .line 193
    move-result-object p1

    .line 194
    check-cast p1, Lk30;

    .line 195
    .line 196
    new-instance v0, Lhu;

    .line 197
    .line 198
    invoke-direct {v0, v7, v9}, Lhu;-><init>(ILiq;)V

    .line 199
    .line 200
    .line 201
    invoke-virtual {p1, v0, p0}, Lk30;->a(Lhu;Lkq;)Ljava/lang/Object;

    .line 202
    .line 203
    .line 204
    move-result-object p1

    .line 205
    if-ne p1, v4, :cond_d

    .line 206
    .line 207
    goto :goto_9

    .line 208
    :cond_d
    move-object v0, v2

    .line 209
    :goto_5
    iput-object p1, v0, Lhz0;->j:Ljava/lang/Object;

    .line 210
    .line 211
    invoke-virtual {v8}, Lwu;->c()Lef0;

    .line 212
    .line 213
    .line 214
    move-result-object p1

    .line 215
    iput-object v1, p0, Lsu;->q:Ljava/lang/Object;

    .line 216
    .line 217
    iput v6, p0, Lsu;->o:I

    .line 218
    .line 219
    invoke-interface {p1, p0}, Lef0;->b(Lkq;)Ljava/lang/Object;

    .line 220
    .line 221
    .line 222
    move-result-object p1

    .line 223
    if-ne p1, v4, :cond_e

    .line 224
    .line 225
    goto :goto_9

    .line 226
    :cond_e
    move-object v0, v1

    .line 227
    :goto_6
    check-cast p1, Ljava/lang/Number;

    .line 228
    .line 229
    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    .line 230
    .line 231
    .line 232
    move-result p1

    .line 233
    iput p1, v0, Lfz0;->j:I
    :try_end_2
    .catch Ler; {:try_start_2 .. :try_end_2} :catch_0

    .line 234
    .line 235
    goto :goto_8

    .line 236
    :catch_0
    iget-object p1, v2, Lhz0;->j:Ljava/lang/Object;

    .line 237
    .line 238
    iput-object v1, p0, Lsu;->q:Ljava/lang/Object;

    .line 239
    .line 240
    iput v7, p0, Lsu;->o:I

    .line 241
    .line 242
    invoke-virtual {v8, p1, v5, p0}, Lwu;->i(Ljava/lang/Object;ZLkq;)Ljava/lang/Object;

    .line 243
    .line 244
    .line 245
    move-result-object p1

    .line 246
    if-ne p1, v4, :cond_f

    .line 247
    .line 248
    goto :goto_9

    .line 249
    :cond_f
    :goto_7
    check-cast p1, Ljava/lang/Number;

    .line 250
    .line 251
    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    .line 252
    .line 253
    .line 254
    move-result p0

    .line 255
    iput p0, v1, Lfz0;->j:I

    .line 256
    .line 257
    :goto_8
    sget-object v4, Lwe1;->a:Lwe1;

    .line 258
    .line 259
    :goto_9
    return-object v4

    .line 260
    nop

    .line 261
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
