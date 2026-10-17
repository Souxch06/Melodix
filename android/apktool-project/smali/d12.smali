.class public final Ld12;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Lbc2;

.field public final synthetic k:Lk22;


# direct methods
.method public constructor <init>(Lk22;Lbc2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ld12;->j:Lbc2;

    .line 5
    .line 6
    iput-object p1, p0, Ld12;->k:Lk22;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 9

    .line 1
    iget-object v0, p0, Ld12;->k:Lk22;

    .line 2
    .line 3
    iget-object v0, v0, Lk22;->b:Lsa2;

    .line 4
    .line 5
    invoke-virtual {v0}, Lsa2;->V()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0}, Lsa2;->c()Ls02;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1}, Ls02;->l()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Lsa2;->l0()V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Ld12;->j:Lbc2;

    .line 19
    .line 20
    invoke-static {p0}, Lbh;->h(Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    iget-object v1, p0, Lbc2;->j:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {v1}, Lbh;->e(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Lsa2;->e0()Lmt1;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    sget-object v3, Lxx1;->y0:Lwx1;

    .line 33
    .line 34
    const/4 v4, 0x0

    .line 35
    invoke-virtual {v2, v4, v3}, Lmt1;->w(Ljava/lang/String;Lwx1;)Z

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    const/4 v3, 0x0

    .line 40
    if-eqz v2, :cond_0

    .line 41
    .line 42
    invoke-virtual {v0}, Lsa2;->f()Lmz;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 47
    .line 48
    .line 49
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 50
    .line 51
    .line 52
    move-result-wide v5

    .line 53
    invoke-virtual {v0}, Lsa2;->e0()Lmt1;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    sget-object v7, Lxx1;->h0:Lwx1;

    .line 58
    .line 59
    invoke-virtual {v2, v4, v7}, Lmt1;->u(Ljava/lang/String;Lwx1;)I

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    invoke-virtual {v0}, Lsa2;->e0()Lmt1;

    .line 64
    .line 65
    .line 66
    sget-object v7, Lxx1;->e:Lwx1;

    .line 67
    .line 68
    invoke-virtual {v7, v4}, Lwx1;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v7

    .line 72
    check-cast v7, Ljava/lang/Long;

    .line 73
    .line 74
    invoke-virtual {v7}, Ljava/lang/Long;->longValue()J

    .line 75
    .line 76
    .line 77
    move-result-wide v7

    .line 78
    sub-long/2addr v5, v7

    .line 79
    :goto_0
    if-ge v3, v2, :cond_1

    .line 80
    .line 81
    invoke-virtual {v0, v4, v5, v6}, Lsa2;->I(Ljava/lang/String;J)Z

    .line 82
    .line 83
    .line 84
    move-result v7

    .line 85
    if-eqz v7, :cond_1

    .line 86
    .line 87
    add-int/lit8 v3, v3, 0x1

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_0
    invoke-virtual {v0}, Lsa2;->e0()Lmt1;

    .line 91
    .line 92
    .line 93
    sget-object v2, Lxx1;->l:Lwx1;

    .line 94
    .line 95
    invoke-virtual {v2, v4}, Lwx1;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    check-cast v2, Ljava/lang/Integer;

    .line 100
    .line 101
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 102
    .line 103
    .line 104
    move-result v2

    .line 105
    int-to-long v5, v2

    .line 106
    :goto_1
    int-to-long v7, v3

    .line 107
    cmp-long v2, v7, v5

    .line 108
    .line 109
    if-gez v2, :cond_1

    .line 110
    .line 111
    const-wide/16 v7, 0x0

    .line 112
    .line 113
    invoke-virtual {v0, v1, v7, v8}, Lsa2;->I(Ljava/lang/String;J)Z

    .line 114
    .line 115
    .line 116
    move-result v2

    .line 117
    if-eqz v2, :cond_1

    .line 118
    .line 119
    add-int/lit8 v3, v3, 0x1

    .line 120
    .line 121
    goto :goto_1

    .line 122
    :cond_1
    invoke-virtual {v0}, Lsa2;->e0()Lmt1;

    .line 123
    .line 124
    .line 125
    move-result-object v2

    .line 126
    sget-object v3, Lxx1;->z0:Lwx1;

    .line 127
    .line 128
    invoke-virtual {v2, v4, v3}, Lmt1;->w(Ljava/lang/String;Lwx1;)Z

    .line 129
    .line 130
    .line 131
    move-result v2

    .line 132
    if-eqz v2, :cond_2

    .line 133
    .line 134
    invoke-virtual {v0}, Lsa2;->c()Ls02;

    .line 135
    .line 136
    .line 137
    move-result-object v2

    .line 138
    invoke-virtual {v2}, Ls02;->l()V

    .line 139
    .line 140
    .line 141
    invoke-virtual {v0}, Lsa2;->H()V

    .line 142
    .line 143
    .line 144
    :cond_2
    iget-object v2, v0, Lsa2;->s:Lda2;

    .line 145
    .line 146
    iget p0, p0, Lbc2;->N:I

    .line 147
    .line 148
    invoke-static {p0}, Lx81;->e(I)I

    .line 149
    .line 150
    .line 151
    move-result p0

    .line 152
    invoke-virtual {v2}, Let;->l()V

    .line 153
    .line 154
    .line 155
    const/4 v3, 0x2

    .line 156
    if-ne p0, v3, :cond_3

    .line 157
    .line 158
    invoke-static {v1}, Lda2;->o(Ljava/lang/String;)Z

    .line 159
    .line 160
    .line 161
    move-result p0

    .line 162
    if-nez p0, :cond_3

    .line 163
    .line 164
    iget-object p0, v2, Ls92;->k:Lsa2;

    .line 165
    .line 166
    iget-object p0, p0, Lsa2;->j:Lk02;

    .line 167
    .line 168
    invoke-static {p0}, Lsa2;->T(Laa2;)V

    .line 169
    .line 170
    .line 171
    invoke-virtual {p0, v1}, Lk02;->x(Ljava/lang/String;)Lqy1;

    .line 172
    .line 173
    .line 174
    move-result-object p0

    .line 175
    if-eqz p0, :cond_3

    .line 176
    .line 177
    invoke-virtual {p0}, Lqy1;->F()Z

    .line 178
    .line 179
    .line 180
    move-result v2

    .line 181
    if-eqz v2, :cond_3

    .line 182
    .line 183
    invoke-virtual {p0}, Lqy1;->G()Lbz1;

    .line 184
    .line 185
    .line 186
    move-result-object p0

    .line 187
    invoke-virtual {p0}, Lbz1;->s()Ljava/lang/String;

    .line 188
    .line 189
    .line 190
    move-result-object p0

    .line 191
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    .line 192
    .line 193
    .line 194
    move-result p0

    .line 195
    if-nez p0, :cond_3

    .line 196
    .line 197
    invoke-virtual {v0}, Lsa2;->b()Lzy1;

    .line 198
    .line 199
    .line 200
    move-result-object p0

    .line 201
    iget-object p0, p0, Lzy1;->w:Lso;

    .line 202
    .line 203
    const-string v2, "[sgtm] Going background, trigger client side upload. appId"

    .line 204
    .line 205
    invoke-virtual {p0, v1, v2}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 206
    .line 207
    .line 208
    invoke-virtual {v0}, Lsa2;->f()Lmz;

    .line 209
    .line 210
    .line 211
    move-result-object p0

    .line 212
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 213
    .line 214
    .line 215
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 216
    .line 217
    .line 218
    move-result-wide v2

    .line 219
    invoke-virtual {v0, v1, v2, v3}, Lsa2;->r(Ljava/lang/String;J)V

    .line 220
    .line 221
    .line 222
    :cond_3
    return-void
.end method
