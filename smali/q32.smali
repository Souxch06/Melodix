.class public final Lq32;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:J

.field public final synthetic k:Lc52;


# direct methods
.method public constructor <init>(Lc52;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-wide p2, p0, Lq32;->j:J

    .line 5
    .line 6
    iput-object p1, p0, Lq32;->k:Lc52;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 9

    .line 1
    iget-object v0, p0, Lq32;->k:Lc52;

    .line 2
    .line 3
    invoke-virtual {v0}, Lgx1;->l()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lay1;->m()V

    .line 7
    .line 8
    .line 9
    iget-object v1, v0, Let;->j:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast v1, Ly02;

    .line 12
    .line 13
    iget-object v2, v1, Ly02;->o:Lzy1;

    .line 14
    .line 15
    invoke-static {v2}, Ly02;->l(Lm22;)V

    .line 16
    .line 17
    .line 18
    iget-object v2, v2, Lzy1;->v:Lso;

    .line 19
    .line 20
    const-string v3, "Resetting analytics data (FE)"

    .line 21
    .line 22
    invoke-virtual {v2, v3}, Lso;->b(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    iget-object v2, v1, Ly02;->q:Lh92;

    .line 26
    .line 27
    invoke-static {v2}, Ly02;->k(Lay1;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v2}, Lgx1;->l()V

    .line 31
    .line 32
    .line 33
    iget-object v3, v2, Lh92;->o:Lf92;

    .line 34
    .line 35
    iget-object v4, v3, Lf92;->c:Lz82;

    .line 36
    .line 37
    invoke-virtual {v4}, Lfu1;->c()V

    .line 38
    .line 39
    .line 40
    iget-object v4, v3, Lf92;->d:Lh92;

    .line 41
    .line 42
    iget-object v4, v4, Let;->j:Ljava/lang/Object;

    .line 43
    .line 44
    check-cast v4, Ly02;

    .line 45
    .line 46
    iget-object v4, v4, Ly02;->t:Lmz;

    .line 47
    .line 48
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 49
    .line 50
    .line 51
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 52
    .line 53
    .line 54
    move-result-wide v4

    .line 55
    iput-wide v4, v3, Lf92;->a:J

    .line 56
    .line 57
    iput-wide v4, v3, Lf92;->b:J

    .line 58
    .line 59
    invoke-virtual {v1}, Ly02;->p()Lky1;

    .line 60
    .line 61
    .line 62
    move-result-object v3

    .line 63
    invoke-virtual {v3}, Lky1;->q()V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v1}, Ly02;->e()Z

    .line 67
    .line 68
    .line 69
    move-result v3

    .line 70
    xor-int/lit8 v3, v3, 0x1

    .line 71
    .line 72
    iget-object v4, v1, Ly02;->n:Lvz1;

    .line 73
    .line 74
    invoke-static {v4}, Ly02;->j(Let;)V

    .line 75
    .line 76
    .line 77
    iget-object v5, v4, Lvz1;->o:Lrz1;

    .line 78
    .line 79
    iget-wide v6, p0, Lq32;->j:J

    .line 80
    .line 81
    invoke-virtual {v5, v6, v7}, Lrz1;->b(J)V

    .line 82
    .line 83
    .line 84
    iget-object p0, v4, Let;->j:Ljava/lang/Object;

    .line 85
    .line 86
    check-cast p0, Ly02;

    .line 87
    .line 88
    iget-object v5, p0, Ly02;->n:Lvz1;

    .line 89
    .line 90
    invoke-static {v5}, Ly02;->j(Let;)V

    .line 91
    .line 92
    .line 93
    iget-object v5, v5, Lvz1;->E:Lvx;

    .line 94
    .line 95
    invoke-virtual {v5}, Lvx;->e()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v5

    .line 99
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 100
    .line 101
    .line 102
    move-result v5

    .line 103
    const/4 v6, 0x0

    .line 104
    if-nez v5, :cond_0

    .line 105
    .line 106
    iget-object v5, v4, Lvz1;->E:Lvx;

    .line 107
    .line 108
    invoke-virtual {v5, v6}, Lvx;->f(Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    :cond_0
    iget-object v5, v4, Lvz1;->y:Lrz1;

    .line 112
    .line 113
    const-wide/16 v7, 0x0

    .line 114
    .line 115
    invoke-virtual {v5, v7, v8}, Lrz1;->b(J)V

    .line 116
    .line 117
    .line 118
    iget-object v5, v4, Lvz1;->z:Lrz1;

    .line 119
    .line 120
    invoke-virtual {v5, v7, v8}, Lrz1;->b(J)V

    .line 121
    .line 122
    .line 123
    iget-object p0, p0, Ly02;->m:Lmt1;

    .line 124
    .line 125
    invoke-virtual {p0}, Lmt1;->z()Z

    .line 126
    .line 127
    .line 128
    move-result p0

    .line 129
    if-nez p0, :cond_1

    .line 130
    .line 131
    invoke-virtual {v4, v3}, Lvz1;->t(Z)V

    .line 132
    .line 133
    .line 134
    :cond_1
    iget-object p0, v4, Lvz1;->F:Lvx;

    .line 135
    .line 136
    invoke-virtual {p0, v6}, Lvx;->f(Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    iget-object p0, v4, Lvz1;->G:Lrz1;

    .line 140
    .line 141
    invoke-virtual {p0, v7, v8}, Lrz1;->b(J)V

    .line 142
    .line 143
    .line 144
    iget-object p0, v4, Lvz1;->H:Ler0;

    .line 145
    .line 146
    invoke-virtual {p0, v6}, Ler0;->x(Landroid/os/Bundle;)V

    .line 147
    .line 148
    .line 149
    invoke-virtual {v1}, Ly02;->n()Li82;

    .line 150
    .line 151
    .line 152
    move-result-object p0

    .line 153
    invoke-virtual {p0}, Lgx1;->l()V

    .line 154
    .line 155
    .line 156
    invoke-virtual {p0}, Lay1;->m()V

    .line 157
    .line 158
    .line 159
    const/4 v4, 0x0

    .line 160
    invoke-virtual {p0, v4}, Li82;->B(Z)Lbc2;

    .line 161
    .line 162
    .line 163
    move-result-object v4

    .line 164
    invoke-virtual {p0}, Li82;->x()V

    .line 165
    .line 166
    .line 167
    iget-object v5, p0, Let;->j:Ljava/lang/Object;

    .line 168
    .line 169
    check-cast v5, Ly02;

    .line 170
    .line 171
    invoke-virtual {v5}, Ly02;->m()Lpy1;

    .line 172
    .line 173
    .line 174
    move-result-object v5

    .line 175
    invoke-virtual {v5}, Lpy1;->p()V

    .line 176
    .line 177
    .line 178
    new-instance v5, Lk62;

    .line 179
    .line 180
    invoke-direct {v5, p0, v4}, Lk62;-><init>(Li82;Lbc2;)V

    .line 181
    .line 182
    .line 183
    invoke-virtual {p0, v5}, Li82;->z(Ljava/lang/Runnable;)V

    .line 184
    .line 185
    .line 186
    invoke-static {v2}, Ly02;->k(Lay1;)V

    .line 187
    .line 188
    .line 189
    iget-object p0, v2, Lh92;->n:Lny0;

    .line 190
    .line 191
    invoke-virtual {p0}, Lny0;->v()V

    .line 192
    .line 193
    .line 194
    iput-boolean v3, v0, Lc52;->A:Z

    .line 195
    .line 196
    invoke-virtual {v1}, Ly02;->n()Li82;

    .line 197
    .line 198
    .line 199
    move-result-object p0

    .line 200
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    .line 201
    .line 202
    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 203
    .line 204
    .line 205
    invoke-virtual {p0, v0}, Li82;->p(Ljava/util/concurrent/atomic/AtomicReference;)V

    .line 206
    .line 207
    .line 208
    return-void
.end method
