.class public final synthetic Lw82;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Lx82;


# direct methods
.method public synthetic constructor <init>(Lx82;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lw82;->j:Lx82;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 9

    .line 1
    iget-object p0, p0, Lw82;->j:Lx82;

    .line 2
    .line 3
    iget-object v0, p0, Lx82;->l:Lxn0;

    .line 4
    .line 5
    iget-object v0, v0, Lxn0;->l:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v0, Lh92;

    .line 8
    .line 9
    invoke-virtual {v0}, Lgx1;->l()V

    .line 10
    .line 11
    .line 12
    iget-object v1, v0, Let;->j:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast v1, Ly02;

    .line 15
    .line 16
    iget-object v2, v1, Ly02;->o:Lzy1;

    .line 17
    .line 18
    iget-object v3, v1, Ly02;->j:Landroid/content/Context;

    .line 19
    .line 20
    invoke-static {v2}, Ly02;->l(Lm22;)V

    .line 21
    .line 22
    .line 23
    iget-object v4, v2, Lzy1;->v:Lso;

    .line 24
    .line 25
    const-string v5, "Application going to the background"

    .line 26
    .line 27
    invoke-virtual {v4, v5}, Lso;->b(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iget-object v4, v1, Ly02;->n:Lvz1;

    .line 31
    .line 32
    invoke-static {v4}, Ly02;->j(Let;)V

    .line 33
    .line 34
    .line 35
    iget-object v4, v4, Lvz1;->B:Loz1;

    .line 36
    .line 37
    const/4 v5, 0x1

    .line 38
    invoke-virtual {v4, v5}, Loz1;->b(Z)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0}, Lgx1;->l()V

    .line 42
    .line 43
    .line 44
    iput-boolean v5, v0, Lh92;->m:Z

    .line 45
    .line 46
    iget-object v4, v1, Ly02;->m:Lmt1;

    .line 47
    .line 48
    invoke-virtual {v4}, Lmt1;->A()Z

    .line 49
    .line 50
    .line 51
    move-result v6

    .line 52
    if-nez v6, :cond_0

    .line 53
    .line 54
    iget-wide v6, p0, Lx82;->k:J

    .line 55
    .line 56
    iget-object v0, v0, Lh92;->o:Lf92;

    .line 57
    .line 58
    const/4 v8, 0x0

    .line 59
    invoke-virtual {v0, v8, v8, v6, v7}, Lf92;->a(ZZJ)Z

    .line 60
    .line 61
    .line 62
    iget-object v0, v0, Lf92;->c:Lz82;

    .line 63
    .line 64
    invoke-virtual {v0}, Lfu1;->c()V

    .line 65
    .line 66
    .line 67
    :cond_0
    iget-wide v6, p0, Lx82;->j:J

    .line 68
    .line 69
    invoke-static {v2}, Ly02;->l(Lm22;)V

    .line 70
    .line 71
    .line 72
    iget-object p0, v2, Lzy1;->u:Lso;

    .line 73
    .line 74
    const-string v0, "Application backgrounded at: timestamp_millis"

    .line 75
    .line 76
    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 77
    .line 78
    .line 79
    move-result-object v6

    .line 80
    invoke-virtual {p0, v6, v0}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    iget-object p0, v1, Ly02;->v:Lc52;

    .line 84
    .line 85
    invoke-static {p0}, Ly02;->k(Lay1;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p0}, Lgx1;->l()V

    .line 89
    .line 90
    .line 91
    iget-object v0, p0, Let;->j:Ljava/lang/Object;

    .line 92
    .line 93
    check-cast v0, Ly02;

    .line 94
    .line 95
    invoke-virtual {p0}, Lay1;->m()V

    .line 96
    .line 97
    .line 98
    invoke-virtual {v0}, Ly02;->n()Li82;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    invoke-virtual {p0}, Lgx1;->l()V

    .line 103
    .line 104
    .line 105
    invoke-virtual {p0}, Lay1;->m()V

    .line 106
    .line 107
    .line 108
    invoke-virtual {p0}, Li82;->s()Z

    .line 109
    .line 110
    .line 111
    move-result v6

    .line 112
    if-nez v6, :cond_1

    .line 113
    .line 114
    goto :goto_0

    .line 115
    :cond_1
    iget-object p0, p0, Let;->j:Ljava/lang/Object;

    .line 116
    .line 117
    check-cast p0, Ly02;

    .line 118
    .line 119
    iget-object p0, p0, Ly02;->r:Lcb2;

    .line 120
    .line 121
    invoke-static {p0}, Ly02;->j(Let;)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {p0}, Lcb2;->W()I

    .line 125
    .line 126
    .line 127
    move-result p0

    .line 128
    const v6, 0x3b3a8

    .line 129
    .line 130
    .line 131
    if-lt p0, v6, :cond_2

    .line 132
    .line 133
    :goto_0
    invoke-virtual {v0}, Ly02;->n()Li82;

    .line 134
    .line 135
    .line 136
    move-result-object p0

    .line 137
    invoke-virtual {p0}, Lgx1;->l()V

    .line 138
    .line 139
    .line 140
    invoke-virtual {p0}, Lay1;->m()V

    .line 141
    .line 142
    .line 143
    invoke-virtual {p0, v5}, Li82;->B(Z)Lbc2;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    new-instance v5, Lr62;

    .line 148
    .line 149
    invoke-direct {v5, p0, v0}, Lr62;-><init>(Li82;Lbc2;)V

    .line 150
    .line 151
    .line 152
    invoke-virtual {p0, v5}, Li82;->z(Ljava/lang/Runnable;)V

    .line 153
    .line 154
    .line 155
    :cond_2
    const/4 p0, 0x0

    .line 156
    sget-object v0, Lxx1;->N0:Lwx1;

    .line 157
    .line 158
    invoke-virtual {v4, p0, v0}, Lmt1;->w(Ljava/lang/String;Lwx1;)Z

    .line 159
    .line 160
    .line 161
    move-result p0

    .line 162
    if-eqz p0, :cond_4

    .line 163
    .line 164
    iget-object p0, v1, Ly02;->r:Lcb2;

    .line 165
    .line 166
    invoke-static {p0}, Ly02;->j(Let;)V

    .line 167
    .line 168
    .line 169
    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object v0

    .line 173
    iget-object v5, v4, Lmt1;->l:Ljava/lang/String;

    .line 174
    .line 175
    invoke-virtual {p0, v0, v5}, Lcb2;->Q(Ljava/lang/String;Ljava/lang/String;)Z

    .line 176
    .line 177
    .line 178
    move-result p0

    .line 179
    if-eqz p0, :cond_3

    .line 180
    .line 181
    const-wide/16 v3, 0x3e8

    .line 182
    .line 183
    goto :goto_1

    .line 184
    :cond_3
    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 185
    .line 186
    .line 187
    move-result-object p0

    .line 188
    sget-object v0, Lxx1;->E:Lwx1;

    .line 189
    .line 190
    invoke-virtual {v4, p0, v0}, Lmt1;->t(Ljava/lang/String;Lwx1;)J

    .line 191
    .line 192
    .line 193
    move-result-wide v3

    .line 194
    :goto_1
    invoke-static {v2}, Ly02;->l(Lm22;)V

    .line 195
    .line 196
    .line 197
    iget-object p0, v2, Lzy1;->w:Lso;

    .line 198
    .line 199
    const-string v0, "[sgtm] Scheduling batch upload with minimum latency in millis"

    .line 200
    .line 201
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 202
    .line 203
    .line 204
    move-result-object v2

    .line 205
    invoke-virtual {p0, v2, v0}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 206
    .line 207
    .line 208
    iget-object p0, v1, Ly02;->D:Lj52;

    .line 209
    .line 210
    invoke-static {p0}, Ly02;->i(Lgx1;)V

    .line 211
    .line 212
    .line 213
    iget-object p0, v1, Ly02;->D:Lj52;

    .line 214
    .line 215
    invoke-virtual {p0, v3, v4}, Lj52;->p(J)V

    .line 216
    .line 217
    .line 218
    :cond_4
    return-void
.end method
