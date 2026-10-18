.class public final Lt82;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:J

.field public final synthetic k:Lh92;


# direct methods
.method public constructor <init>(Lh92;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-wide p2, p0, Lt82;->j:J

    .line 5
    .line 6
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lt82;->k:Lh92;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 7

    .line 1
    iget-object v0, p0, Lt82;->k:Lh92;

    .line 2
    .line 3
    iget-object v1, v0, Lh92;->o:Lf92;

    .line 4
    .line 5
    invoke-virtual {v0}, Lgx1;->l()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0}, Lh92;->p()V

    .line 9
    .line 10
    .line 11
    iget-object v2, v0, Let;->j:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast v2, Ly02;

    .line 14
    .line 15
    iget-object v3, v2, Ly02;->o:Lzy1;

    .line 16
    .line 17
    invoke-static {v3}, Ly02;->l(Lm22;)V

    .line 18
    .line 19
    .line 20
    iget-object v3, v3, Lzy1;->w:Lso;

    .line 21
    .line 22
    const-string v4, "Activity resumed, time"

    .line 23
    .line 24
    iget-wide v5, p0, Lt82;->j:J

    .line 25
    .line 26
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {v3, p0, v4}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    iget-object p0, v2, Ly02;->m:Lmt1;

    .line 34
    .line 35
    sget-object v3, Lxx1;->S0:Lwx1;

    .line 36
    .line 37
    const/4 v4, 0x0

    .line 38
    invoke-virtual {p0, v4, v3}, Lmt1;->w(Ljava/lang/String;Lwx1;)Z

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    if-eqz v3, :cond_1

    .line 43
    .line 44
    invoke-virtual {p0}, Lmt1;->A()Z

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    if-nez p0, :cond_0

    .line 49
    .line 50
    iget-boolean p0, v0, Lh92;->m:Z

    .line 51
    .line 52
    if-eqz p0, :cond_3

    .line 53
    .line 54
    :cond_0
    iget-object p0, v1, Lf92;->d:Lh92;

    .line 55
    .line 56
    invoke-virtual {p0}, Lgx1;->l()V

    .line 57
    .line 58
    .line 59
    iget-object p0, v1, Lf92;->c:Lz82;

    .line 60
    .line 61
    invoke-virtual {p0}, Lfu1;->c()V

    .line 62
    .line 63
    .line 64
    iput-wide v5, v1, Lf92;->a:J

    .line 65
    .line 66
    iput-wide v5, v1, Lf92;->b:J

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_1
    invoke-virtual {p0}, Lmt1;->A()Z

    .line 70
    .line 71
    .line 72
    move-result p0

    .line 73
    if-nez p0, :cond_2

    .line 74
    .line 75
    iget-object p0, v2, Ly02;->n:Lvz1;

    .line 76
    .line 77
    invoke-static {p0}, Ly02;->j(Let;)V

    .line 78
    .line 79
    .line 80
    iget-object p0, p0, Lvz1;->B:Loz1;

    .line 81
    .line 82
    invoke-virtual {p0}, Loz1;->a()Z

    .line 83
    .line 84
    .line 85
    move-result p0

    .line 86
    if-eqz p0, :cond_3

    .line 87
    .line 88
    :cond_2
    iget-object p0, v1, Lf92;->d:Lh92;

    .line 89
    .line 90
    invoke-virtual {p0}, Lgx1;->l()V

    .line 91
    .line 92
    .line 93
    iget-object p0, v1, Lf92;->c:Lz82;

    .line 94
    .line 95
    invoke-virtual {p0}, Lfu1;->c()V

    .line 96
    .line 97
    .line 98
    iput-wide v5, v1, Lf92;->a:J

    .line 99
    .line 100
    iput-wide v5, v1, Lf92;->b:J

    .line 101
    .line 102
    :cond_3
    :goto_0
    iget-object p0, v0, Lh92;->p:Lxn0;

    .line 103
    .line 104
    iget-object v1, p0, Lxn0;->l:Ljava/lang/Object;

    .line 105
    .line 106
    check-cast v1, Lh92;

    .line 107
    .line 108
    invoke-virtual {v1}, Lgx1;->l()V

    .line 109
    .line 110
    .line 111
    iget-object p0, p0, Lxn0;->k:Ljava/lang/Object;

    .line 112
    .line 113
    check-cast p0, Lx82;

    .line 114
    .line 115
    if-eqz p0, :cond_4

    .line 116
    .line 117
    iget-object v2, v1, Lh92;->l:Lum1;

    .line 118
    .line 119
    invoke-virtual {v2, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 120
    .line 121
    .line 122
    :cond_4
    iget-object p0, v1, Let;->j:Ljava/lang/Object;

    .line 123
    .line 124
    check-cast p0, Ly02;

    .line 125
    .line 126
    iget-object p0, p0, Ly02;->n:Lvz1;

    .line 127
    .line 128
    invoke-static {p0}, Ly02;->j(Let;)V

    .line 129
    .line 130
    .line 131
    iget-object p0, p0, Lvz1;->B:Loz1;

    .line 132
    .line 133
    const/4 v2, 0x0

    .line 134
    invoke-virtual {p0, v2}, Loz1;->b(Z)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {v1}, Lgx1;->l()V

    .line 138
    .line 139
    .line 140
    iput-boolean v2, v1, Lh92;->m:Z

    .line 141
    .line 142
    iget-object p0, v0, Lh92;->n:Lny0;

    .line 143
    .line 144
    iget-object v0, p0, Lny0;->k:Ljava/lang/Object;

    .line 145
    .line 146
    check-cast v0, Lh92;

    .line 147
    .line 148
    invoke-virtual {v0}, Lgx1;->l()V

    .line 149
    .line 150
    .line 151
    iget-object v0, v0, Let;->j:Ljava/lang/Object;

    .line 152
    .line 153
    check-cast v0, Ly02;

    .line 154
    .line 155
    invoke-virtual {v0}, Ly02;->e()Z

    .line 156
    .line 157
    .line 158
    move-result v1

    .line 159
    iget-object v2, v0, Ly02;->t:Lmz;

    .line 160
    .line 161
    if-nez v1, :cond_5

    .line 162
    .line 163
    return-void

    .line 164
    :cond_5
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 165
    .line 166
    .line 167
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 168
    .line 169
    .line 170
    move-result-wide v1

    .line 171
    iget-object v0, v0, Ly02;->m:Lmt1;

    .line 172
    .line 173
    sget-object v3, Lxx1;->e1:Lwx1;

    .line 174
    .line 175
    invoke-virtual {v0, v4, v3}, Lmt1;->w(Ljava/lang/String;Lwx1;)Z

    .line 176
    .line 177
    .line 178
    move-result v0

    .line 179
    if-eqz v0, :cond_6

    .line 180
    .line 181
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 182
    .line 183
    .line 184
    move-result-wide v3

    .line 185
    goto :goto_1

    .line 186
    :cond_6
    const-wide/16 v3, 0x0

    .line 187
    .line 188
    :goto_1
    invoke-virtual {p0, v1, v2, v3, v4}, Lny0;->x(JJ)V

    .line 189
    .line 190
    .line 191
    return-void
.end method
