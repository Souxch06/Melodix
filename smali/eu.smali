.class public final Leu;
.super Lcb1;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lf90;


# instance fields
.field public final synthetic n:I

.field public o:I

.field public final synthetic p:Lwu;


# direct methods
.method public synthetic constructor <init>(Lwu;Liq;I)V
    .locals 0

    .line 1
    iput p3, p0, Leu;->n:I

    .line 2
    .line 3
    iput-object p1, p0, Leu;->p:Lwu;

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
    iget v0, p0, Leu;->n:I

    .line 2
    .line 3
    sget-object v1, Lwe1;->a:Lwe1;

    .line 4
    .line 5
    packed-switch v0, :pswitch_data_0

    .line 6
    .line 7
    .line 8
    check-cast p1, Lzq;

    .line 9
    .line 10
    check-cast p2, Liq;

    .line 11
    .line 12
    invoke-virtual {p0, p2, p1}, Leu;->j(Liq;Ljava/lang/Object;)Liq;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Leu;

    .line 17
    .line 18
    invoke-virtual {p0, v1}, Leu;->m(Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0

    .line 23
    :pswitch_0
    check-cast p1, Lzq;

    .line 24
    .line 25
    check-cast p2, Liq;

    .line 26
    .line 27
    invoke-virtual {p0, p2, p1}, Leu;->j(Liq;Ljava/lang/Object;)Liq;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    check-cast p0, Leu;

    .line 32
    .line 33
    invoke-virtual {p0, v1}, Leu;->m(Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0

    .line 38
    :pswitch_1
    check-cast p1, Ls50;

    .line 39
    .line 40
    check-cast p2, Liq;

    .line 41
    .line 42
    invoke-virtual {p0, p2, p1}, Leu;->j(Liq;Ljava/lang/Object;)Liq;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    check-cast p0, Leu;

    .line 47
    .line 48
    invoke-virtual {p0, v1}, Leu;->m(Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    return-object p0

    .line 53
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final j(Liq;Ljava/lang/Object;)Liq;
    .locals 1

    .line 1
    iget p2, p0, Leu;->n:I

    .line 2
    .line 3
    iget-object p0, p0, Leu;->p:Lwu;

    .line 4
    .line 5
    packed-switch p2, :pswitch_data_0

    .line 6
    .line 7
    .line 8
    new-instance p2, Leu;

    .line 9
    .line 10
    const/4 v0, 0x2

    .line 11
    invoke-direct {p2, p0, p1, v0}, Leu;-><init>(Lwu;Liq;I)V

    .line 12
    .line 13
    .line 14
    return-object p2

    .line 15
    :pswitch_0
    new-instance p2, Leu;

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    invoke-direct {p2, p0, p1, v0}, Leu;-><init>(Lwu;Liq;I)V

    .line 19
    .line 20
    .line 21
    return-object p2

    .line 22
    :pswitch_1
    new-instance p2, Leu;

    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    invoke-direct {p2, p0, p1, v0}, Leu;-><init>(Lwu;Liq;I)V

    .line 26
    .line 27
    .line 28
    return-object p2

    .line 29
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final m(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 14

    .line 1
    iget v0, p0, Leu;->n:I

    .line 2
    .line 3
    sget-object v1, Lwe1;->a:Lwe1;

    .line 4
    .line 5
    const/4 v2, 0x2

    .line 6
    const/4 v3, 0x0

    .line 7
    const-string v4, "call to \'resume\' before \'invoke\' with coroutine"

    .line 8
    .line 9
    sget-object v5, Lar;->j:Lar;

    .line 10
    .line 11
    iget-object v6, p0, Leu;->p:Lwu;

    .line 12
    .line 13
    const/4 v7, 0x1

    .line 14
    packed-switch v0, :pswitch_data_0

    .line 15
    .line 16
    .line 17
    iget-object v0, v6, Lwu;->h:Lbv1;

    .line 18
    .line 19
    iget v1, p0, Leu;->o:I

    .line 20
    .line 21
    if-eqz v1, :cond_2

    .line 22
    .line 23
    if-eq v1, v7, :cond_1

    .line 24
    .line 25
    if-ne v1, v2, :cond_0

    .line 26
    .line 27
    invoke-static {p1}, Lk42;->n(Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    goto :goto_2

    .line 31
    :cond_0
    invoke-static {v4}, Lz0;->g(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    goto :goto_3

    .line 35
    :cond_1
    :try_start_0
    invoke-static {p1}, Lk42;->n(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_2
    invoke-static {p1}, Lk42;->n(Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0}, Lbv1;->n()Lr91;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    instance-of p1, p1, Lp30;

    .line 47
    .line 48
    if-eqz p1, :cond_3

    .line 49
    .line 50
    invoke-virtual {v0}, Lbv1;->n()Lr91;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    goto :goto_3

    .line 55
    :cond_3
    :try_start_1
    iput v7, p0, Leu;->o:I

    .line 56
    .line 57
    invoke-virtual {v6, p0}, Lwu;->f(Lkq;)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 61
    if-ne p1, v5, :cond_4

    .line 62
    .line 63
    goto :goto_1

    .line 64
    :cond_4
    :goto_0
    iput v2, p0, Leu;->o:I

    .line 65
    .line 66
    const/4 p1, 0x0

    .line 67
    invoke-virtual {v6, p1, p0}, Lwu;->g(ZLiq;)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    if-ne p1, v5, :cond_5

    .line 72
    .line 73
    :goto_1
    move-object v3, v5

    .line 74
    goto :goto_3

    .line 75
    :cond_5
    :goto_2
    move-object v3, p1

    .line 76
    check-cast v3, Lr91;

    .line 77
    .line 78
    goto :goto_3

    .line 79
    :catchall_0
    move-exception v0

    .line 80
    move-object p0, v0

    .line 81
    new-instance v3, Lqx0;

    .line 82
    .line 83
    const/4 p1, -0x1

    .line 84
    invoke-direct {v3, p0, p1}, Lqx0;-><init>(Ljava/lang/Throwable;I)V

    .line 85
    .line 86
    .line 87
    :goto_3
    return-object v3

    .line 88
    :pswitch_0
    iget v0, p0, Leu;->o:I

    .line 89
    .line 90
    if-eqz v0, :cond_8

    .line 91
    .line 92
    if-eq v0, v7, :cond_7

    .line 93
    .line 94
    if-ne v0, v2, :cond_6

    .line 95
    .line 96
    invoke-static {p1}, Lk42;->n(Ljava/lang/Object;)V

    .line 97
    .line 98
    .line 99
    goto :goto_8

    .line 100
    :cond_6
    invoke-static {v4}, Lz0;->g(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    move-object v1, v3

    .line 104
    goto :goto_8

    .line 105
    :cond_7
    invoke-static {p1}, Lk42;->n(Ljava/lang/Object;)V

    .line 106
    .line 107
    .line 108
    goto :goto_5

    .line 109
    :cond_8
    invoke-static {p1}, Lk42;->n(Ljava/lang/Object;)V

    .line 110
    .line 111
    .line 112
    iget-object p1, v6, Lwu;->i:Ler0;

    .line 113
    .line 114
    iput v7, p0, Leu;->o:I

    .line 115
    .line 116
    iget-object p1, p1, Ler0;->l:Ljava/lang/Object;

    .line 117
    .line 118
    check-cast p1, Lnl;

    .line 119
    .line 120
    invoke-virtual {p1, p0}, Lnl;->T(Lcb1;)Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    if-ne p1, v5, :cond_9

    .line 125
    .line 126
    goto :goto_4

    .line 127
    :cond_9
    move-object p1, v1

    .line 128
    :goto_4
    if-ne p1, v5, :cond_a

    .line 129
    .line 130
    goto :goto_7

    .line 131
    :cond_a
    :goto_5
    invoke-virtual {v6}, Lwu;->c()Lef0;

    .line 132
    .line 133
    .line 134
    move-result-object p1

    .line 135
    invoke-interface {p1}, Lef0;->e()Lr50;

    .line 136
    .line 137
    .line 138
    move-result-object v9

    .line 139
    instance-of p1, v9, Lq90;

    .line 140
    .line 141
    sget-object v10, Ls00;->j:Ls00;

    .line 142
    .line 143
    sget-object v12, Lfh;->k:Lfh;

    .line 144
    .line 145
    const/4 v11, 0x0

    .line 146
    if-eqz p1, :cond_b

    .line 147
    .line 148
    check-cast v9, Lq90;

    .line 149
    .line 150
    invoke-interface {v9, v10, v11, v12}, Lq90;->d(Lsq;ILfh;)Lr50;

    .line 151
    .line 152
    .line 153
    move-result-object p1

    .line 154
    goto :goto_6

    .line 155
    :cond_b
    new-instance v8, Lpj;

    .line 156
    .line 157
    const/4 v13, 0x1

    .line 158
    invoke-direct/range {v8 .. v13}, Lpj;-><init>(Ljava/lang/Object;Lsq;ILfh;I)V

    .line 159
    .line 160
    .line 161
    move-object p1, v8

    .line 162
    :goto_6
    new-instance v0, Lju;

    .line 163
    .line 164
    invoke-direct {v0, v7, v6}, Lju;-><init>(ILjava/lang/Object;)V

    .line 165
    .line 166
    .line 167
    iput v2, p0, Leu;->o:I

    .line 168
    .line 169
    invoke-interface {p1, v0, p0}, Lr50;->q(Ls50;Lkq;)Ljava/lang/Object;

    .line 170
    .line 171
    .line 172
    move-result-object p0

    .line 173
    if-ne p0, v5, :cond_c

    .line 174
    .line 175
    :goto_7
    move-object v1, v5

    .line 176
    :cond_c
    :goto_8
    return-object v1

    .line 177
    :pswitch_1
    iget v0, p0, Leu;->o:I

    .line 178
    .line 179
    if-eqz v0, :cond_e

    .line 180
    .line 181
    if-ne v0, v7, :cond_d

    .line 182
    .line 183
    invoke-static {p1}, Lk42;->n(Ljava/lang/Object;)V

    .line 184
    .line 185
    .line 186
    goto :goto_9

    .line 187
    :cond_d
    invoke-static {v4}, Lz0;->g(Ljava/lang/String;)V

    .line 188
    .line 189
    .line 190
    move-object v1, v3

    .line 191
    goto :goto_9

    .line 192
    :cond_e
    invoke-static {p1}, Lk42;->n(Ljava/lang/Object;)V

    .line 193
    .line 194
    .line 195
    iput v7, p0, Leu;->o:I

    .line 196
    .line 197
    invoke-virtual {v6, p0}, Lwu;->e(Lkq;)Ljava/lang/Object;

    .line 198
    .line 199
    .line 200
    move-result-object p0

    .line 201
    if-ne p0, v5, :cond_f

    .line 202
    .line 203
    move-object v1, v5

    .line 204
    :cond_f
    :goto_9
    return-object v1

    .line 205
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
