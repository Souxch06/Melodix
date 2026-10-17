.class public final Lje2;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Z

.field public final c:Lj12;

.field public final d:Ljava/util/BitSet;

.field public final e:Ljava/util/BitSet;

.field public final f:Lda;

.field public final g:Lda;

.field public final synthetic h:Ldp1;


# direct methods
.method public constructor <init>(Ldp1;Ljava/lang/String;)V
    .locals 0

    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lje2;->h:Ldp1;

    iput-object p2, p0, Lje2;->a:Ljava/lang/String;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lje2;->b:Z

    new-instance p1, Ljava/util/BitSet;

    .line 71
    invoke-direct {p1}, Ljava/util/BitSet;-><init>()V

    iput-object p1, p0, Lje2;->d:Ljava/util/BitSet;

    new-instance p1, Ljava/util/BitSet;

    .line 72
    invoke-direct {p1}, Ljava/util/BitSet;-><init>()V

    iput-object p1, p0, Lje2;->e:Ljava/util/BitSet;

    .line 73
    new-instance p1, Lda;

    .line 74
    invoke-direct {p1}, Lu71;-><init>()V

    .line 75
    iput-object p1, p0, Lje2;->f:Lda;

    new-instance p1, Lda;

    .line 76
    invoke-direct {p1}, Lu71;-><init>()V

    .line 77
    iput-object p1, p0, Lje2;->g:Lda;

    return-void
.end method

.method public constructor <init>(Ldp1;Ljava/lang/String;Lj12;Ljava/util/BitSet;Ljava/util/BitSet;Lda;Lda;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lje2;->h:Ldp1;

    .line 5
    .line 6
    iput-object p2, p0, Lje2;->a:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p4, p0, Lje2;->d:Ljava/util/BitSet;

    .line 9
    .line 10
    iput-object p5, p0, Lje2;->e:Ljava/util/BitSet;

    .line 11
    .line 12
    iput-object p6, p0, Lje2;->f:Lda;

    .line 13
    .line 14
    new-instance p1, Lda;

    .line 15
    .line 16
    invoke-direct {p1}, Lu71;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object p1, p0, Lje2;->g:Lda;

    .line 20
    .line 21
    invoke-virtual {p7}, Lda;->keySet()Ljava/util/Set;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    check-cast p1, Lhl0;

    .line 26
    .line 27
    invoke-virtual {p1}, Lhl0;->iterator()Ljava/util/Iterator;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 32
    .line 33
    .line 34
    move-result p2

    .line 35
    if-eqz p2, :cond_0

    .line 36
    .line 37
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    check-cast p2, Ljava/lang/Integer;

    .line 42
    .line 43
    new-instance p4, Ljava/util/ArrayList;

    .line 44
    .line 45
    invoke-direct {p4}, Ljava/util/ArrayList;-><init>()V

    .line 46
    .line 47
    .line 48
    const/4 p5, 0x0

    .line 49
    invoke-virtual {p7, p2, p5}, Lu71;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object p5

    .line 53
    check-cast p5, Ljava/lang/Long;

    .line 54
    .line 55
    invoke-virtual {p4, p5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    iget-object p5, p0, Lje2;->g:Lda;

    .line 59
    .line 60
    invoke-virtual {p5, p2, p4}, Lu71;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_0
    const/4 p1, 0x0

    .line 65
    iput-boolean p1, p0, Lje2;->b:Z

    .line 66
    .line 67
    iput-object p3, p0, Lje2;->c:Lj12;

    .line 68
    .line 69
    return-void
.end method


# virtual methods
.method public final a(Ldn1;)V
    .locals 12

    .line 1
    iget v0, p1, Ldn1;->g:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object v0, p1, Ldn1;->i:Lnp1;

    .line 7
    .line 8
    check-cast v0, Lsx1;

    .line 9
    .line 10
    invoke-virtual {v0}, Lsx1;->s()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    goto :goto_0

    .line 15
    :pswitch_0
    iget-object v0, p1, Ldn1;->i:Lnp1;

    .line 16
    .line 17
    check-cast v0, Lmx1;

    .line 18
    .line 19
    invoke-virtual {v0}, Lmx1;->s()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    :goto_0
    iget-object v1, p1, Ldn1;->c:Ljava/lang/Boolean;

    .line 24
    .line 25
    const/4 v2, 0x1

    .line 26
    if-eqz v1, :cond_0

    .line 27
    .line 28
    iget-object v1, p0, Lje2;->e:Ljava/util/BitSet;

    .line 29
    .line 30
    invoke-virtual {v1, v0, v2}, Ljava/util/BitSet;->set(IZ)V

    .line 31
    .line 32
    .line 33
    :cond_0
    iget-object v1, p1, Ldn1;->d:Ljava/lang/Boolean;

    .line 34
    .line 35
    if-eqz v1, :cond_1

    .line 36
    .line 37
    iget-object v3, p0, Lje2;->d:Ljava/util/BitSet;

    .line 38
    .line 39
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    invoke-virtual {v3, v0, v1}, Ljava/util/BitSet;->set(IZ)V

    .line 44
    .line 45
    .line 46
    :cond_1
    iget-object v1, p1, Ldn1;->e:Ljava/lang/Long;

    .line 47
    .line 48
    const/4 v3, 0x0

    .line 49
    const-wide/16 v4, 0x3e8

    .line 50
    .line 51
    if-eqz v1, :cond_3

    .line 52
    .line 53
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    iget-object v6, p0, Lje2;->f:Lda;

    .line 58
    .line 59
    invoke-virtual {v6, v1, v3}, Lu71;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v7

    .line 63
    check-cast v7, Ljava/lang/Long;

    .line 64
    .line 65
    iget-object v8, p1, Ldn1;->e:Ljava/lang/Long;

    .line 66
    .line 67
    invoke-virtual {v8}, Ljava/lang/Long;->longValue()J

    .line 68
    .line 69
    .line 70
    move-result-wide v8

    .line 71
    div-long/2addr v8, v4

    .line 72
    if-eqz v7, :cond_2

    .line 73
    .line 74
    invoke-virtual {v7}, Ljava/lang/Long;->longValue()J

    .line 75
    .line 76
    .line 77
    move-result-wide v10

    .line 78
    cmp-long v7, v8, v10

    .line 79
    .line 80
    if-lez v7, :cond_3

    .line 81
    .line 82
    :cond_2
    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 83
    .line 84
    .line 85
    move-result-object v7

    .line 86
    invoke-virtual {v6, v1, v7}, Lu71;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    :cond_3
    iget-object v1, p1, Ldn1;->f:Ljava/lang/Long;

    .line 90
    .line 91
    if-eqz v1, :cond_8

    .line 92
    .line 93
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    iget-object v1, p0, Lje2;->g:Lda;

    .line 98
    .line 99
    invoke-virtual {v1, v0, v3}, Lu71;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    move-result-object v3

    .line 103
    check-cast v3, Ljava/util/List;

    .line 104
    .line 105
    if-nez v3, :cond_4

    .line 106
    .line 107
    new-instance v3, Ljava/util/ArrayList;

    .line 108
    .line 109
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 110
    .line 111
    .line 112
    invoke-virtual {v1, v0, v3}, Lu71;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    :cond_4
    iget v0, p1, Ldn1;->g:I

    .line 116
    .line 117
    const/4 v1, 0x0

    .line 118
    packed-switch v0, :pswitch_data_1

    .line 119
    .line 120
    .line 121
    goto :goto_1

    .line 122
    :pswitch_1
    move v2, v1

    .line 123
    :goto_1
    if-eqz v2, :cond_5

    .line 124
    .line 125
    invoke-interface {v3}, Ljava/util/List;->clear()V

    .line 126
    .line 127
    .line 128
    :cond_5
    invoke-static {}, Lds1;->a()V

    .line 129
    .line 130
    .line 131
    iget-object v0, p0, Lje2;->h:Ldp1;

    .line 132
    .line 133
    iget-object v0, v0, Let;->j:Ljava/lang/Object;

    .line 134
    .line 135
    check-cast v0, Ly02;

    .line 136
    .line 137
    iget-object v2, v0, Ly02;->m:Lmt1;

    .line 138
    .line 139
    sget-object v6, Lxx1;->F0:Lwx1;

    .line 140
    .line 141
    iget-object p0, p0, Lje2;->a:Ljava/lang/String;

    .line 142
    .line 143
    invoke-virtual {v2, p0, v6}, Lmt1;->w(Ljava/lang/String;Lwx1;)Z

    .line 144
    .line 145
    .line 146
    move-result v2

    .line 147
    if-eqz v2, :cond_6

    .line 148
    .line 149
    iget v2, p1, Ldn1;->g:I

    .line 150
    .line 151
    packed-switch v2, :pswitch_data_2

    .line 152
    .line 153
    .line 154
    goto :goto_2

    .line 155
    :pswitch_2
    iget-object v1, p1, Ldn1;->i:Lnp1;

    .line 156
    .line 157
    check-cast v1, Lmx1;

    .line 158
    .line 159
    invoke-virtual {v1}, Lmx1;->x()Z

    .line 160
    .line 161
    .line 162
    move-result v1

    .line 163
    :goto_2
    if-eqz v1, :cond_6

    .line 164
    .line 165
    invoke-interface {v3}, Ljava/util/List;->clear()V

    .line 166
    .line 167
    .line 168
    :cond_6
    invoke-static {}, Lds1;->a()V

    .line 169
    .line 170
    .line 171
    iget-object v0, v0, Ly02;->m:Lmt1;

    .line 172
    .line 173
    invoke-virtual {v0, p0, v6}, Lmt1;->w(Ljava/lang/String;Lwx1;)Z

    .line 174
    .line 175
    .line 176
    move-result p0

    .line 177
    iget-object p1, p1, Ldn1;->f:Ljava/lang/Long;

    .line 178
    .line 179
    if-eqz p0, :cond_7

    .line 180
    .line 181
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 182
    .line 183
    .line 184
    move-result-wide p0

    .line 185
    div-long/2addr p0, v4

    .line 186
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 187
    .line 188
    .line 189
    move-result-object p0

    .line 190
    invoke-interface {v3, p0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 191
    .line 192
    .line 193
    move-result p1

    .line 194
    if-nez p1, :cond_8

    .line 195
    .line 196
    invoke-interface {v3, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 197
    .line 198
    .line 199
    return-void

    .line 200
    :cond_7
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 201
    .line 202
    .line 203
    move-result-wide p0

    .line 204
    div-long/2addr p0, v4

    .line 205
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 206
    .line 207
    .line 208
    move-result-object p0

    .line 209
    invoke-interface {v3, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 210
    .line 211
    .line 212
    :cond_8
    return-void

    .line 213
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch

    .line 214
    .line 215
    .line 216
    .line 217
    .line 218
    .line 219
    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_1
    .end packed-switch

    .line 220
    .line 221
    .line 222
    .line 223
    .line 224
    .line 225
    :pswitch_data_2
    .packed-switch 0x0
        :pswitch_2
    .end packed-switch
.end method

.method public final b(I)Luz1;
    .locals 8

    .line 1
    invoke-static {}, Luz1;->y()Ltz1;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Llp1;->c()V

    .line 6
    .line 7
    .line 8
    iget-object v1, v0, Llp1;->k:Lnp1;

    .line 9
    .line 10
    check-cast v1, Luz1;

    .line 11
    .line 12
    invoke-virtual {v1, p1}, Luz1;->z(I)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Llp1;->c()V

    .line 16
    .line 17
    .line 18
    iget-object p1, v0, Llp1;->k:Lnp1;

    .line 19
    .line 20
    check-cast p1, Luz1;

    .line 21
    .line 22
    iget-boolean v1, p0, Lje2;->b:Z

    .line 23
    .line 24
    invoke-virtual {p1, v1}, Luz1;->C(Z)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Lje2;->c:Lj12;

    .line 28
    .line 29
    if-eqz p1, :cond_0

    .line 30
    .line 31
    invoke-virtual {v0}, Llp1;->c()V

    .line 32
    .line 33
    .line 34
    iget-object v1, v0, Llp1;->k:Lnp1;

    .line 35
    .line 36
    check-cast v1, Luz1;

    .line 37
    .line 38
    invoke-virtual {v1, p1}, Luz1;->B(Lj12;)V

    .line 39
    .line 40
    .line 41
    :cond_0
    invoke-static {}, Lj12;->z()Lh12;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    iget-object v1, p0, Lje2;->d:Ljava/util/BitSet;

    .line 46
    .line 47
    invoke-static {v1}, Lva2;->R(Ljava/util/BitSet;)Ljava/util/ArrayList;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {p1}, Llp1;->c()V

    .line 52
    .line 53
    .line 54
    iget-object v2, p1, Llp1;->k:Lnp1;

    .line 55
    .line 56
    check-cast v2, Lj12;

    .line 57
    .line 58
    invoke-virtual {v2, v1}, Lj12;->D(Ljava/util/List;)V

    .line 59
    .line 60
    .line 61
    iget-object v1, p0, Lje2;->e:Ljava/util/BitSet;

    .line 62
    .line 63
    invoke-static {v1}, Lva2;->R(Ljava/util/BitSet;)Ljava/util/ArrayList;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    invoke-virtual {p1}, Llp1;->c()V

    .line 68
    .line 69
    .line 70
    iget-object v2, p1, Llp1;->k:Lnp1;

    .line 71
    .line 72
    check-cast v2, Lj12;

    .line 73
    .line 74
    invoke-virtual {v2, v1}, Lj12;->B(Ljava/lang/Iterable;)V

    .line 75
    .line 76
    .line 77
    new-instance v1, Ljava/util/ArrayList;

    .line 78
    .line 79
    iget-object v2, p0, Lje2;->f:Lda;

    .line 80
    .line 81
    iget v3, v2, Lu71;->l:I

    .line 82
    .line 83
    invoke-direct {v1, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v2}, Lda;->keySet()Ljava/util/Set;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    check-cast v3, Lhl0;

    .line 91
    .line 92
    invoke-virtual {v3}, Lhl0;->iterator()Ljava/util/Iterator;

    .line 93
    .line 94
    .line 95
    move-result-object v3

    .line 96
    :cond_1
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 97
    .line 98
    .line 99
    move-result v4

    .line 100
    const/4 v5, 0x0

    .line 101
    if-eqz v4, :cond_2

    .line 102
    .line 103
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    move-result-object v4

    .line 107
    check-cast v4, Ljava/lang/Integer;

    .line 108
    .line 109
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 110
    .line 111
    .line 112
    move-result v6

    .line 113
    invoke-virtual {v2, v4, v5}, Lu71;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object v4

    .line 117
    check-cast v4, Ljava/lang/Long;

    .line 118
    .line 119
    if-eqz v4, :cond_1

    .line 120
    .line 121
    invoke-static {}, Lh02;->v()Lf02;

    .line 122
    .line 123
    .line 124
    move-result-object v5

    .line 125
    invoke-virtual {v5}, Llp1;->c()V

    .line 126
    .line 127
    .line 128
    iget-object v7, v5, Llp1;->k:Lnp1;

    .line 129
    .line 130
    check-cast v7, Lh02;

    .line 131
    .line 132
    invoke-virtual {v7, v6}, Lh02;->w(I)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    .line 136
    .line 137
    .line 138
    move-result-wide v6

    .line 139
    invoke-virtual {v5}, Llp1;->c()V

    .line 140
    .line 141
    .line 142
    iget-object v4, v5, Llp1;->k:Lnp1;

    .line 143
    .line 144
    check-cast v4, Lh02;

    .line 145
    .line 146
    invoke-virtual {v4, v6, v7}, Lh02;->x(J)V

    .line 147
    .line 148
    .line 149
    invoke-virtual {v5}, Llp1;->e()Lnp1;

    .line 150
    .line 151
    .line 152
    move-result-object v4

    .line 153
    check-cast v4, Lh02;

    .line 154
    .line 155
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 156
    .line 157
    .line 158
    goto :goto_0

    .line 159
    :cond_2
    invoke-virtual {p1}, Llp1;->c()V

    .line 160
    .line 161
    .line 162
    iget-object v2, p1, Llp1;->k:Lnp1;

    .line 163
    .line 164
    check-cast v2, Lj12;

    .line 165
    .line 166
    invoke-virtual {v2, v1}, Lj12;->F(Ljava/util/ArrayList;)V

    .line 167
    .line 168
    .line 169
    iget-object p0, p0, Lje2;->g:Lda;

    .line 170
    .line 171
    if-nez p0, :cond_3

    .line 172
    .line 173
    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 174
    .line 175
    goto :goto_2

    .line 176
    :cond_3
    new-instance v1, Ljava/util/ArrayList;

    .line 177
    .line 178
    iget v2, p0, Lu71;->l:I

    .line 179
    .line 180
    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 181
    .line 182
    .line 183
    invoke-virtual {p0}, Lda;->keySet()Ljava/util/Set;

    .line 184
    .line 185
    .line 186
    move-result-object v2

    .line 187
    check-cast v2, Lhl0;

    .line 188
    .line 189
    invoke-virtual {v2}, Lhl0;->iterator()Ljava/util/Iterator;

    .line 190
    .line 191
    .line 192
    move-result-object v2

    .line 193
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 194
    .line 195
    .line 196
    move-result v3

    .line 197
    if-eqz v3, :cond_5

    .line 198
    .line 199
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 200
    .line 201
    .line 202
    move-result-object v3

    .line 203
    check-cast v3, Ljava/lang/Integer;

    .line 204
    .line 205
    invoke-static {}, Lm12;->w()Ll12;

    .line 206
    .line 207
    .line 208
    move-result-object v4

    .line 209
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 210
    .line 211
    .line 212
    move-result v6

    .line 213
    invoke-virtual {v4}, Llp1;->c()V

    .line 214
    .line 215
    .line 216
    iget-object v7, v4, Llp1;->k:Lnp1;

    .line 217
    .line 218
    check-cast v7, Lm12;

    .line 219
    .line 220
    invoke-virtual {v7, v6}, Lm12;->x(I)V

    .line 221
    .line 222
    .line 223
    invoke-virtual {p0, v3, v5}, Lu71;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 224
    .line 225
    .line 226
    move-result-object v3

    .line 227
    check-cast v3, Ljava/util/List;

    .line 228
    .line 229
    if-eqz v3, :cond_4

    .line 230
    .line 231
    invoke-static {v3}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 232
    .line 233
    .line 234
    invoke-virtual {v4}, Llp1;->c()V

    .line 235
    .line 236
    .line 237
    iget-object v6, v4, Llp1;->k:Lnp1;

    .line 238
    .line 239
    check-cast v6, Lm12;

    .line 240
    .line 241
    invoke-virtual {v6, v3}, Lm12;->y(Ljava/util/List;)V

    .line 242
    .line 243
    .line 244
    :cond_4
    invoke-virtual {v4}, Llp1;->e()Lnp1;

    .line 245
    .line 246
    .line 247
    move-result-object v3

    .line 248
    check-cast v3, Lm12;

    .line 249
    .line 250
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 251
    .line 252
    .line 253
    goto :goto_1

    .line 254
    :cond_5
    move-object p0, v1

    .line 255
    :goto_2
    invoke-virtual {p1}, Llp1;->c()V

    .line 256
    .line 257
    .line 258
    iget-object v1, p1, Llp1;->k:Lnp1;

    .line 259
    .line 260
    check-cast v1, Lj12;

    .line 261
    .line 262
    invoke-virtual {v1, p0}, Lj12;->H(Ljava/lang/Iterable;)V

    .line 263
    .line 264
    .line 265
    invoke-virtual {v0}, Llp1;->c()V

    .line 266
    .line 267
    .line 268
    iget-object p0, v0, Llp1;->k:Lnp1;

    .line 269
    .line 270
    check-cast p0, Luz1;

    .line 271
    .line 272
    invoke-virtual {p1}, Llp1;->e()Lnp1;

    .line 273
    .line 274
    .line 275
    move-result-object p1

    .line 276
    check-cast p1, Lj12;

    .line 277
    .line 278
    invoke-virtual {p0, p1}, Luz1;->A(Lj12;)V

    .line 279
    .line 280
    .line 281
    invoke-virtual {v0}, Llp1;->e()Lnp1;

    .line 282
    .line 283
    .line 284
    move-result-object p0

    .line 285
    check-cast p0, Luz1;

    .line 286
    .line 287
    return-object p0
.end method
