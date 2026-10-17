.class public final Lc52;
.super Lay1;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public A:Z

.field public B:Lc32;

.field public C:Lv42;

.field public D:Lc32;

.field public final E:Lmd1;

.field public l:Lcx1;

.field public m:Lka2;

.field public final n:Ljava/util/concurrent/CopyOnWriteArraySet;

.field public o:Z

.field public final p:Ljava/util/concurrent/atomic/AtomicReference;

.field public final q:Ljava/lang/Object;

.field public r:Z

.field public s:I

.field public t:Lc32;

.field public u:Lc32;

.field public v:Ljava/util/PriorityQueue;

.field public w:Lu22;

.field public final x:Ljava/util/concurrent/atomic/AtomicLong;

.field public y:J

.field public final z:Lvd2;


# direct methods
.method public constructor <init>(Ly02;)V
    .locals 3

    .line 1
    invoke-direct {p0, p1}, Lay1;-><init>(Ly02;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArraySet;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArraySet;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lc52;->n:Ljava/util/concurrent/CopyOnWriteArraySet;

    .line 10
    .line 11
    new-instance v0, Ljava/lang/Object;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lc52;->q:Ljava/lang/Object;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput-boolean v0, p0, Lc52;->r:Z

    .line 20
    .line 21
    const/4 v0, 0x1

    .line 22
    iput v0, p0, Lc52;->s:I

    .line 23
    .line 24
    iput-boolean v0, p0, Lc52;->A:Z

    .line 25
    .line 26
    new-instance v0, Lmd1;

    .line 27
    .line 28
    const/16 v1, 0xb

    .line 29
    .line 30
    invoke-direct {v0, v1, p0}, Lmd1;-><init>(ILjava/lang/Object;)V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, Lc52;->E:Lmd1;

    .line 34
    .line 35
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    .line 36
    .line 37
    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 38
    .line 39
    .line 40
    iput-object v0, p0, Lc52;->p:Ljava/util/concurrent/atomic/AtomicReference;

    .line 41
    .line 42
    sget-object v0, Lu22;->c:Lu22;

    .line 43
    .line 44
    iput-object v0, p0, Lc52;->w:Lu22;

    .line 45
    .line 46
    const-wide/16 v0, -0x1

    .line 47
    .line 48
    iput-wide v0, p0, Lc52;->y:J

    .line 49
    .line 50
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    .line 51
    .line 52
    const-wide/16 v1, 0x0

    .line 53
    .line 54
    invoke-direct {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicLong;-><init>(J)V

    .line 55
    .line 56
    .line 57
    iput-object v0, p0, Lc52;->x:Ljava/util/concurrent/atomic/AtomicLong;

    .line 58
    .line 59
    new-instance v0, Lvd2;

    .line 60
    .line 61
    invoke-direct {v0, p1}, Lvd2;-><init>(Ljava/lang/Object;)V

    .line 62
    .line 63
    .line 64
    iput-object v0, p0, Lc52;->z:Lvd2;

    .line 65
    .line 66
    return-void
.end method


# virtual methods
.method public final A()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object p0, p0, Let;->j:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Ly02;

    .line 4
    .line 5
    :try_start_0
    iget-object v0, p0, Ly02;->j:Landroid/content/Context;

    .line 6
    .line 7
    iget-object v1, p0, Ly02;->y:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0, v1}, Lst;->A(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    return-object p0

    .line 14
    :catch_0
    move-exception v0

    .line 15
    iget-object p0, p0, Ly02;->o:Lzy1;

    .line 16
    .line 17
    invoke-static {p0}, Ly02;->l(Lm22;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lzy1;->o:Lso;

    .line 21
    .line 22
    const-string v1, "getGoogleAppId failed with exception"

    .line 23
    .line 24
    invoke-virtual {p0, v0, v1}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    const/4 p0, 0x0

    .line 28
    return-object p0
.end method

.method public final B(Lu22;JZ)V
    .locals 7

    .line 1
    iget v0, p1, Lu22;->b:I

    .line 2
    .line 3
    invoke-virtual {p0}, Lgx1;->l()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lay1;->m()V

    .line 7
    .line 8
    .line 9
    iget-object v1, p0, Let;->j:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast v1, Ly02;

    .line 12
    .line 13
    iget-object v2, v1, Ly02;->n:Lvz1;

    .line 14
    .line 15
    iget-object v3, v1, Ly02;->o:Lzy1;

    .line 16
    .line 17
    invoke-static {v2}, Ly02;->j(Let;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v2}, Lvz1;->s()Lu22;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    iget-wide v4, p0, Lc52;->y:J

    .line 25
    .line 26
    cmp-long v4, p2, v4

    .line 27
    .line 28
    if-gtz v4, :cond_0

    .line 29
    .line 30
    iget v2, v2, Lu22;->b:I

    .line 31
    .line 32
    invoke-static {v2, v0}, Lu22;->l(II)Z

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    if-eqz v2, :cond_0

    .line 37
    .line 38
    invoke-static {v3}, Ly02;->l(Lm22;)V

    .line 39
    .line 40
    .line 41
    iget-object p0, v3, Lzy1;->u:Lso;

    .line 42
    .line 43
    const-string p2, "Dropped out-of-date consent setting, proposed settings"

    .line 44
    .line 45
    invoke-virtual {p0, p1, p2}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_0
    iget-object v2, v1, Ly02;->n:Lvz1;

    .line 50
    .line 51
    invoke-static {v2}, Ly02;->j(Let;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v2}, Let;->l()V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v2}, Lvz1;->p()Landroid/content/SharedPreferences;

    .line 58
    .line 59
    .line 60
    move-result-object v4

    .line 61
    const/16 v5, 0x64

    .line 62
    .line 63
    const-string v6, "consent_source"

    .line 64
    .line 65
    invoke-interface {v4, v6, v5}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 66
    .line 67
    .line 68
    move-result v4

    .line 69
    invoke-static {v0, v4}, Lu22;->l(II)Z

    .line 70
    .line 71
    .line 72
    move-result v4

    .line 73
    if-eqz v4, :cond_4

    .line 74
    .line 75
    invoke-virtual {v2}, Lvz1;->p()Landroid/content/SharedPreferences;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    invoke-virtual {p1}, Lu22;->g()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v4

    .line 87
    const-string v5, "consent_settings"

    .line 88
    .line 89
    invoke-interface {v2, v5, v4}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 90
    .line 91
    .line 92
    invoke-interface {v2, v6, v0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 93
    .line 94
    .line 95
    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 96
    .line 97
    .line 98
    invoke-static {v3}, Ly02;->l(Lm22;)V

    .line 99
    .line 100
    .line 101
    iget-object v0, v3, Lzy1;->w:Lso;

    .line 102
    .line 103
    const-string v2, "Setting storage consent(FE)"

    .line 104
    .line 105
    invoke-virtual {v0, p1, v2}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    iput-wide p2, p0, Lc52;->y:J

    .line 109
    .line 110
    invoke-virtual {v1}, Ly02;->n()Li82;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    invoke-virtual {p0}, Li82;->v()Z

    .line 115
    .line 116
    .line 117
    move-result p0

    .line 118
    if-eqz p0, :cond_1

    .line 119
    .line 120
    invoke-virtual {v1}, Ly02;->n()Li82;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    invoke-virtual {p0}, Lgx1;->l()V

    .line 125
    .line 126
    .line 127
    invoke-virtual {p0}, Lay1;->m()V

    .line 128
    .line 129
    .line 130
    new-instance p1, Lg82;

    .line 131
    .line 132
    invoke-direct {p1, p0}, Lg82;-><init>(Li82;)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {p0, p1}, Li82;->z(Ljava/lang/Runnable;)V

    .line 136
    .line 137
    .line 138
    goto :goto_0

    .line 139
    :cond_1
    invoke-virtual {v1}, Ly02;->n()Li82;

    .line 140
    .line 141
    .line 142
    move-result-object p0

    .line 143
    invoke-virtual {p0}, Lgx1;->l()V

    .line 144
    .line 145
    .line 146
    invoke-virtual {p0}, Lay1;->m()V

    .line 147
    .line 148
    .line 149
    invoke-virtual {p0}, Li82;->u()Z

    .line 150
    .line 151
    .line 152
    move-result p1

    .line 153
    if-eqz p1, :cond_2

    .line 154
    .line 155
    const/4 p1, 0x0

    .line 156
    invoke-virtual {p0, p1}, Li82;->B(Z)Lbc2;

    .line 157
    .line 158
    .line 159
    move-result-object p1

    .line 160
    new-instance p2, Lb72;

    .line 161
    .line 162
    invoke-direct {p2, p0, p1}, Lb72;-><init>(Li82;Lbc2;)V

    .line 163
    .line 164
    .line 165
    invoke-virtual {p0, p2}, Li82;->z(Ljava/lang/Runnable;)V

    .line 166
    .line 167
    .line 168
    :cond_2
    :goto_0
    if-eqz p4, :cond_3

    .line 169
    .line 170
    invoke-virtual {v1}, Ly02;->n()Li82;

    .line 171
    .line 172
    .line 173
    move-result-object p0

    .line 174
    new-instance p1, Ljava/util/concurrent/atomic/AtomicReference;

    .line 175
    .line 176
    invoke-direct {p1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 177
    .line 178
    .line 179
    invoke-virtual {p0, p1}, Li82;->p(Ljava/util/concurrent/atomic/AtomicReference;)V

    .line 180
    .line 181
    .line 182
    :cond_3
    return-void

    .line 183
    :cond_4
    invoke-static {v3}, Ly02;->l(Lm22;)V

    .line 184
    .line 185
    .line 186
    iget-object p0, v3, Lzy1;->u:Lso;

    .line 187
    .line 188
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 189
    .line 190
    .line 191
    move-result-object p1

    .line 192
    const-string p2, "Lower precedence consent source ignored, proposed source"

    .line 193
    .line 194
    invoke-virtual {p0, p1, p2}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 195
    .line 196
    .line 197
    return-void
.end method

.method public final C(Ljava/lang/Boolean;Z)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Lgx1;->l()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lay1;->m()V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Let;->j:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v0, Ly02;

    .line 10
    .line 11
    iget-object v1, v0, Ly02;->o:Lzy1;

    .line 12
    .line 13
    invoke-static {v1}, Ly02;->l(Lm22;)V

    .line 14
    .line 15
    .line 16
    iget-object v1, v1, Lzy1;->v:Lso;

    .line 17
    .line 18
    const-string v2, "Setting app measurement enabled (FE)"

    .line 19
    .line 20
    invoke-virtual {v1, p1, v2}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iget-object v1, v0, Ly02;->n:Lvz1;

    .line 24
    .line 25
    invoke-static {v1}, Ly02;->j(Let;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1}, Let;->l()V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v1}, Lvz1;->p()Landroid/content/SharedPreferences;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    const-string v3, "measurement_enabled"

    .line 40
    .line 41
    if-eqz p1, :cond_0

    .line 42
    .line 43
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 44
    .line 45
    .line 46
    move-result v4

    .line 47
    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_0
    invoke-interface {v2, v3}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 52
    .line 53
    .line 54
    :goto_0
    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 55
    .line 56
    .line 57
    if-eqz p2, :cond_2

    .line 58
    .line 59
    invoke-virtual {v1}, Let;->l()V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v1}, Lvz1;->p()Landroid/content/SharedPreferences;

    .line 63
    .line 64
    .line 65
    move-result-object p2

    .line 66
    invoke-interface {p2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 67
    .line 68
    .line 69
    move-result-object p2

    .line 70
    const-string v1, "measurement_enabled_from_api"

    .line 71
    .line 72
    if-eqz p1, :cond_1

    .line 73
    .line 74
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 75
    .line 76
    .line 77
    move-result v2

    .line 78
    invoke-interface {p2, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 79
    .line 80
    .line 81
    goto :goto_1

    .line 82
    :cond_1
    invoke-interface {p2, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 83
    .line 84
    .line 85
    :goto_1
    invoke-interface {p2}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 86
    .line 87
    .line 88
    :cond_2
    iget-object p2, v0, Ly02;->p:Ls02;

    .line 89
    .line 90
    invoke-static {p2}, Ly02;->l(Lm22;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {p2}, Ls02;->l()V

    .line 94
    .line 95
    .line 96
    iget-boolean p2, v0, Ly02;->I:Z

    .line 97
    .line 98
    if-nez p2, :cond_4

    .line 99
    .line 100
    if-eqz p1, :cond_3

    .line 101
    .line 102
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 103
    .line 104
    .line 105
    move-result p1

    .line 106
    if-nez p1, :cond_3

    .line 107
    .line 108
    goto :goto_2

    .line 109
    :cond_3
    return-void

    .line 110
    :cond_4
    :goto_2
    invoke-virtual {p0}, Lc52;->D()V

    .line 111
    .line 112
    .line 113
    return-void
.end method

.method public final D()V
    .locals 9

    .line 1
    invoke-virtual {p0}, Lgx1;->l()V

    .line 2
    .line 3
    .line 4
    iget-object v1, p0, Let;->j:Ljava/lang/Object;

    .line 5
    .line 6
    move-object v6, v1

    .line 7
    check-cast v6, Ly02;

    .line 8
    .line 9
    iget-object v1, v6, Ly02;->n:Lvz1;

    .line 10
    .line 11
    iget-object v7, v6, Ly02;->o:Lzy1;

    .line 12
    .line 13
    iget-object v2, v6, Ly02;->t:Lmz;

    .line 14
    .line 15
    invoke-static {v1}, Ly02;->j(Let;)V

    .line 16
    .line 17
    .line 18
    iget-object v1, v1, Lvz1;->v:Lvx;

    .line 19
    .line 20
    invoke-virtual {v1}, Lvx;->e()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    const/4 v8, 0x1

    .line 25
    if-eqz v1, :cond_2

    .line 26
    .line 27
    const-string v3, "unset"

    .line 28
    .line 29
    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    if-eqz v3, :cond_0

    .line 34
    .line 35
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 36
    .line 37
    .line 38
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 39
    .line 40
    .line 41
    move-result-wide v1

    .line 42
    const-string v5, "_npa"

    .line 43
    .line 44
    const/4 v3, 0x0

    .line 45
    const-string v4, "app"

    .line 46
    .line 47
    move-object v0, p0

    .line 48
    invoke-virtual/range {v0 .. v5}, Lc52;->w(JLjava/lang/Object;Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    goto :goto_1

    .line 52
    :cond_0
    const-string v0, "true"

    .line 53
    .line 54
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-eq v8, v0, :cond_1

    .line 59
    .line 60
    const-wide/16 v0, 0x0

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_1
    const-wide/16 v0, 0x1

    .line 64
    .line 65
    :goto_0
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 66
    .line 67
    .line 68
    move-result-object v3

    .line 69
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 70
    .line 71
    .line 72
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 73
    .line 74
    .line 75
    move-result-wide v1

    .line 76
    const-string v4, "app"

    .line 77
    .line 78
    const-string v5, "_npa"

    .line 79
    .line 80
    move-object v0, p0

    .line 81
    invoke-virtual/range {v0 .. v5}, Lc52;->w(JLjava/lang/Object;Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    :cond_2
    :goto_1
    invoke-virtual {v6}, Ly02;->e()Z

    .line 85
    .line 86
    .line 87
    move-result v1

    .line 88
    if-eqz v1, :cond_3

    .line 89
    .line 90
    iget-boolean v1, p0, Lc52;->A:Z

    .line 91
    .line 92
    if-eqz v1, :cond_3

    .line 93
    .line 94
    invoke-static {v7}, Ly02;->l(Lm22;)V

    .line 95
    .line 96
    .line 97
    iget-object v1, v7, Lzy1;->v:Lso;

    .line 98
    .line 99
    const-string v2, "Recording app launch after enabling measurement for the first time (FE)"

    .line 100
    .line 101
    invoke-virtual {v1, v2}, Lso;->b(Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {p0}, Lc52;->x()V

    .line 105
    .line 106
    .line 107
    iget-object v1, v6, Ly02;->q:Lh92;

    .line 108
    .line 109
    invoke-static {v1}, Ly02;->k(Lay1;)V

    .line 110
    .line 111
    .line 112
    iget-object v1, v1, Lh92;->n:Lny0;

    .line 113
    .line 114
    invoke-virtual {v1}, Lny0;->v()V

    .line 115
    .line 116
    .line 117
    iget-object v1, v6, Ly02;->p:Ls02;

    .line 118
    .line 119
    invoke-static {v1}, Ly02;->l(Lm22;)V

    .line 120
    .line 121
    .line 122
    new-instance v2, Lh32;

    .line 123
    .line 124
    invoke-direct {v2, p0}, Lh32;-><init>(Lc52;)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {v1, v2}, Ls02;->u(Ljava/lang/Runnable;)V

    .line 128
    .line 129
    .line 130
    return-void

    .line 131
    :cond_3
    invoke-static {v7}, Ly02;->l(Lm22;)V

    .line 132
    .line 133
    .line 134
    iget-object v0, v7, Lzy1;->v:Lso;

    .line 135
    .line 136
    const-string v1, "Updating Scion state (FE)"

    .line 137
    .line 138
    invoke-virtual {v0, v1}, Lso;->b(Ljava/lang/String;)V

    .line 139
    .line 140
    .line 141
    invoke-virtual {v6}, Ly02;->n()Li82;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    invoke-virtual {v0}, Lgx1;->l()V

    .line 146
    .line 147
    .line 148
    invoke-virtual {v0}, Lay1;->m()V

    .line 149
    .line 150
    .line 151
    invoke-virtual {v0, v8}, Li82;->B(Z)Lbc2;

    .line 152
    .line 153
    .line 154
    move-result-object v1

    .line 155
    new-instance v2, La72;

    .line 156
    .line 157
    invoke-direct {v2, v0, v1}, La72;-><init>(Li82;Lbc2;)V

    .line 158
    .line 159
    .line 160
    invoke-virtual {v0, v2}, Li82;->z(Ljava/lang/Runnable;)V

    .line 161
    .line 162
    .line 163
    return-void
.end method

.method public final E()V
    .locals 2

    .line 1
    iget-object v0, p0, Let;->j:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ly02;

    .line 4
    .line 5
    iget-object v1, v0, Ly02;->j:Landroid/content/Context;

    .line 6
    .line 7
    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    instance-of v1, v1, Landroid/app/Application;

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    iget-object v1, p0, Lc52;->l:Lcx1;

    .line 16
    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    iget-object v0, v0, Ly02;->j:Landroid/content/Context;

    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Landroid/app/Application;

    .line 26
    .line 27
    iget-object p0, p0, Lc52;->l:Lcx1;

    .line 28
    .line 29
    invoke-virtual {v0, p0}, Landroid/app/Application;->unregisterActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public final F(Landroid/os/Bundle;IJ)V
    .locals 10

    .line 1
    iget-object v3, p0, Let;->j:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v3, Ly02;

    .line 4
    .line 5
    invoke-virtual {p0}, Lay1;->m()V

    .line 6
    .line 7
    .line 8
    sget-object v4, Lu22;->c:Lu22;

    .line 9
    .line 10
    sget-object v4, Lr22;->k:Lr22;

    .line 11
    .line 12
    iget-object v4, v4, Lr22;->j:[Lt22;

    .line 13
    .line 14
    array-length v5, v4

    .line 15
    const/4 v6, 0x0

    .line 16
    :goto_0
    const/4 v7, 0x0

    .line 17
    if-ge v6, v5, :cond_3

    .line 18
    .line 19
    aget-object v8, v4, v6

    .line 20
    .line 21
    iget-object v8, v8, Lt22;->j:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {p1, v8}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 24
    .line 25
    .line 26
    move-result v9

    .line 27
    if-eqz v9, :cond_2

    .line 28
    .line 29
    invoke-virtual {p1, v8}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v8

    .line 33
    if-eqz v8, :cond_2

    .line 34
    .line 35
    const-string v9, "granted"

    .line 36
    .line 37
    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v9

    .line 41
    if-eqz v9, :cond_0

    .line 42
    .line 43
    sget-object v9, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 44
    .line 45
    goto :goto_1

    .line 46
    :cond_0
    const-string v9, "denied"

    .line 47
    .line 48
    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v9

    .line 52
    if-eqz v9, :cond_1

    .line 53
    .line 54
    sget-object v9, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 55
    .line 56
    goto :goto_1

    .line 57
    :cond_1
    move-object v9, v7

    .line 58
    :goto_1
    if-nez v9, :cond_2

    .line 59
    .line 60
    goto :goto_2

    .line 61
    :cond_2
    add-int/lit8 v6, v6, 0x1

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_3
    move-object v8, v7

    .line 65
    :goto_2
    if-eqz v8, :cond_4

    .line 66
    .line 67
    iget-object v4, v3, Ly02;->o:Lzy1;

    .line 68
    .line 69
    invoke-static {v4}, Ly02;->l(Lm22;)V

    .line 70
    .line 71
    .line 72
    iget-object v4, v4, Lzy1;->t:Lso;

    .line 73
    .line 74
    const-string v5, "Ignoring invalid consent setting"

    .line 75
    .line 76
    invoke-virtual {v4, v8, v5}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    iget-object v4, v3, Ly02;->o:Lzy1;

    .line 80
    .line 81
    invoke-static {v4}, Ly02;->l(Lm22;)V

    .line 82
    .line 83
    .line 84
    iget-object v4, v4, Lzy1;->t:Lso;

    .line 85
    .line 86
    const-string v5, "Valid consent values are \'granted\', \'denied\'"

    .line 87
    .line 88
    invoke-virtual {v4, v5}, Lso;->b(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    :cond_4
    iget-object v3, v3, Ly02;->p:Ls02;

    .line 92
    .line 93
    invoke-static {v3}, Ly02;->l(Lm22;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {v3}, Ls02;->r()Z

    .line 97
    .line 98
    .line 99
    move-result v3

    .line 100
    invoke-static {p2, p1}, Lu22;->b(ILandroid/os/Bundle;)Lu22;

    .line 101
    .line 102
    .line 103
    move-result-object v4

    .line 104
    iget-object v5, v4, Lu22;->a:Ljava/util/EnumMap;

    .line 105
    .line 106
    invoke-virtual {v5}, Ljava/util/EnumMap;->values()Ljava/util/Collection;

    .line 107
    .line 108
    .line 109
    move-result-object v5

    .line 110
    invoke-interface {v5}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 111
    .line 112
    .line 113
    move-result-object v5

    .line 114
    :cond_5
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 115
    .line 116
    .line 117
    move-result v6

    .line 118
    sget-object v8, Lq22;->k:Lq22;

    .line 119
    .line 120
    if-eqz v6, :cond_6

    .line 121
    .line 122
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 123
    .line 124
    .line 125
    move-result-object v6

    .line 126
    check-cast v6, Lq22;

    .line 127
    .line 128
    if-eq v6, v8, :cond_5

    .line 129
    .line 130
    invoke-virtual {p0, v4, v3}, Lc52;->H(Lu22;Z)V

    .line 131
    .line 132
    .line 133
    :cond_6
    invoke-static {p2, p1}, Lnu1;->c(ILandroid/os/Bundle;)Lnu1;

    .line 134
    .line 135
    .line 136
    move-result-object v4

    .line 137
    iget-object v5, v4, Lnu1;->e:Ljava/util/EnumMap;

    .line 138
    .line 139
    invoke-virtual {v5}, Ljava/util/EnumMap;->values()Ljava/util/Collection;

    .line 140
    .line 141
    .line 142
    move-result-object v5

    .line 143
    invoke-interface {v5}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 144
    .line 145
    .line 146
    move-result-object v5

    .line 147
    :cond_7
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 148
    .line 149
    .line 150
    move-result v6

    .line 151
    if-eqz v6, :cond_8

    .line 152
    .line 153
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 154
    .line 155
    .line 156
    move-result-object v6

    .line 157
    check-cast v6, Lq22;

    .line 158
    .line 159
    if-eq v6, v8, :cond_7

    .line 160
    .line 161
    invoke-virtual {p0, v4, v3}, Lc52;->G(Lnu1;Z)V

    .line 162
    .line 163
    .line 164
    :cond_8
    if-nez p1, :cond_9

    .line 165
    .line 166
    goto :goto_3

    .line 167
    :cond_9
    const-string v4, "ad_personalization"

    .line 168
    .line 169
    invoke-virtual {p1, v4}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object v1

    .line 173
    invoke-static {v1}, Lu22;->d(Ljava/lang/String;)Lq22;

    .line 174
    .line 175
    .line 176
    move-result-object v1

    .line 177
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 178
    .line 179
    .line 180
    move-result v1

    .line 181
    const/4 v4, 0x2

    .line 182
    if-eq v1, v4, :cond_b

    .line 183
    .line 184
    const/4 v4, 0x3

    .line 185
    if-eq v1, v4, :cond_a

    .line 186
    .line 187
    goto :goto_3

    .line 188
    :cond_a
    sget-object v7, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 189
    .line 190
    goto :goto_3

    .line 191
    :cond_b
    sget-object v7, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 192
    .line 193
    :goto_3
    if-eqz v7, :cond_e

    .line 194
    .line 195
    const/16 v1, -0x1e

    .line 196
    .line 197
    if-ne p2, v1, :cond_c

    .line 198
    .line 199
    const-string v1, "tcf"

    .line 200
    .line 201
    goto :goto_4

    .line 202
    :cond_c
    const-string v1, "app"

    .line 203
    .line 204
    :goto_4
    if-eqz v3, :cond_d

    .line 205
    .line 206
    invoke-virtual {v7}, Ljava/lang/Boolean;->toString()Ljava/lang/String;

    .line 207
    .line 208
    .line 209
    move-result-object v3

    .line 210
    const-string v5, "allow_personalized_ads"

    .line 211
    .line 212
    move-object v0, p0

    .line 213
    move-object v4, v1

    .line 214
    move-wide v1, p3

    .line 215
    invoke-virtual/range {v0 .. v5}, Lc52;->w(JLjava/lang/Object;Ljava/lang/String;Ljava/lang/String;)V

    .line 216
    .line 217
    .line 218
    return-void

    .line 219
    :cond_d
    invoke-virtual {v7}, Ljava/lang/Boolean;->toString()Ljava/lang/String;

    .line 220
    .line 221
    .line 222
    move-result-object v3

    .line 223
    const-string v2, "allow_personalized_ads"

    .line 224
    .line 225
    const/4 v4, 0x0

    .line 226
    move-object v0, p0

    .line 227
    move-wide v5, p3

    .line 228
    invoke-virtual/range {v0 .. v6}, Lc52;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZJ)V

    .line 229
    .line 230
    .line 231
    :cond_e
    return-void
.end method

.method public final G(Lnu1;Z)V
    .locals 1

    .line 1
    new-instance v0, Lc42;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lc42;-><init>(Lc52;Lnu1;)V

    .line 4
    .line 5
    .line 6
    if-eqz p2, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lgx1;->l()V

    .line 9
    .line 10
    .line 11
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object p0, p0, Let;->j:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast p0, Ly02;

    .line 18
    .line 19
    iget-object p0, p0, Ly02;->p:Ls02;

    .line 20
    .line 21
    invoke-static {p0}, Ly02;->l(Lm22;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, v0}, Ls02;->u(Ljava/lang/Runnable;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final H(Lu22;Z)V
    .locals 13

    .line 1
    invoke-virtual {p0}, Lay1;->m()V

    .line 2
    .line 3
    .line 4
    iget v0, p1, Lu22;->b:I

    .line 5
    .line 6
    const/16 v1, -0xa

    .line 7
    .line 8
    if-eq v0, v1, :cond_2

    .line 9
    .line 10
    iget-object v2, p1, Lu22;->a:Ljava/util/EnumMap;

    .line 11
    .line 12
    sget-object v3, Lt22;->k:Lt22;

    .line 13
    .line 14
    invoke-virtual {v2, v3}, Ljava/util/EnumMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    check-cast v2, Lq22;

    .line 19
    .line 20
    if-nez v2, :cond_0

    .line 21
    .line 22
    sget-object v2, Lq22;->k:Lq22;

    .line 23
    .line 24
    :cond_0
    sget-object v3, Lq22;->k:Lq22;

    .line 25
    .line 26
    if-ne v2, v3, :cond_2

    .line 27
    .line 28
    iget-object v2, p1, Lu22;->a:Ljava/util/EnumMap;

    .line 29
    .line 30
    sget-object v4, Lt22;->l:Lt22;

    .line 31
    .line 32
    invoke-virtual {v2, v4}, Ljava/util/EnumMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    check-cast v2, Lq22;

    .line 37
    .line 38
    if-nez v2, :cond_1

    .line 39
    .line 40
    move-object v2, v3

    .line 41
    :cond_1
    if-ne v2, v3, :cond_2

    .line 42
    .line 43
    iget-object p0, p0, Let;->j:Ljava/lang/Object;

    .line 44
    .line 45
    check-cast p0, Ly02;

    .line 46
    .line 47
    iget-object p0, p0, Ly02;->o:Lzy1;

    .line 48
    .line 49
    invoke-static {p0}, Ly02;->l(Lm22;)V

    .line 50
    .line 51
    .line 52
    iget-object p0, p0, Lzy1;->t:Lso;

    .line 53
    .line 54
    const-string p1, "Ignoring empty consent settings"

    .line 55
    .line 56
    invoke-virtual {p0, p1}, Lso;->b(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_2
    iget-object v2, p0, Lc52;->q:Ljava/lang/Object;

    .line 61
    .line 62
    monitor-enter v2

    .line 63
    :try_start_0
    iget-object v3, p0, Lc52;->w:Lu22;

    .line 64
    .line 65
    iget v3, v3, Lu22;->b:I

    .line 66
    .line 67
    invoke-static {v0, v3}, Lu22;->l(II)Z

    .line 68
    .line 69
    .line 70
    move-result v3

    .line 71
    const/4 v4, 0x0

    .line 72
    if-eqz v3, :cond_6

    .line 73
    .line 74
    iget-object v3, p0, Lc52;->w:Lu22;

    .line 75
    .line 76
    iget-object v5, p1, Lu22;->a:Ljava/util/EnumMap;

    .line 77
    .line 78
    invoke-virtual {v5}, Ljava/util/EnumMap;->keySet()Ljava/util/Set;

    .line 79
    .line 80
    .line 81
    move-result-object v6

    .line 82
    new-array v7, v4, [Lt22;

    .line 83
    .line 84
    invoke-interface {v6, v7}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v6

    .line 88
    check-cast v6, [Lt22;

    .line 89
    .line 90
    array-length v7, v6

    .line 91
    move v8, v4

    .line 92
    :goto_0
    const/4 v9, 0x1

    .line 93
    if-ge v8, v7, :cond_4

    .line 94
    .line 95
    aget-object v10, v6, v8

    .line 96
    .line 97
    invoke-virtual {v5, v10}, Ljava/util/EnumMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    move-result-object v11

    .line 101
    check-cast v11, Lq22;

    .line 102
    .line 103
    iget-object v12, v3, Lu22;->a:Ljava/util/EnumMap;

    .line 104
    .line 105
    invoke-virtual {v12, v10}, Ljava/util/EnumMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object v10

    .line 109
    check-cast v10, Lq22;

    .line 110
    .line 111
    sget-object v12, Lq22;->m:Lq22;

    .line 112
    .line 113
    if-ne v11, v12, :cond_3

    .line 114
    .line 115
    if-eq v10, v12, :cond_3

    .line 116
    .line 117
    move v3, v9

    .line 118
    goto :goto_1

    .line 119
    :cond_3
    add-int/lit8 v8, v8, 0x1

    .line 120
    .line 121
    goto :goto_0

    .line 122
    :cond_4
    move v3, v4

    .line 123
    :goto_1
    sget-object v5, Lt22;->l:Lt22;

    .line 124
    .line 125
    invoke-virtual {p1, v5}, Lu22;->i(Lt22;)Z

    .line 126
    .line 127
    .line 128
    move-result v6

    .line 129
    if-eqz v6, :cond_5

    .line 130
    .line 131
    iget-object v6, p0, Lc52;->w:Lu22;

    .line 132
    .line 133
    invoke-virtual {v6, v5}, Lu22;->i(Lt22;)Z

    .line 134
    .line 135
    .line 136
    move-result v5

    .line 137
    if-nez v5, :cond_5

    .line 138
    .line 139
    move v4, v9

    .line 140
    goto :goto_2

    .line 141
    :catchall_0
    move-exception v0

    .line 142
    move-object p0, v0

    .line 143
    goto/16 :goto_6

    .line 144
    .line 145
    :cond_5
    :goto_2
    iget-object v5, p0, Lc52;->w:Lu22;

    .line 146
    .line 147
    invoke-virtual {p1, v5}, Lu22;->k(Lu22;)Lu22;

    .line 148
    .line 149
    .line 150
    move-result-object p1

    .line 151
    iput-object p1, p0, Lc52;->w:Lu22;

    .line 152
    .line 153
    move v8, v4

    .line 154
    move v4, v9

    .line 155
    :goto_3
    move-object v5, p1

    .line 156
    goto :goto_4

    .line 157
    :cond_6
    move v3, v4

    .line 158
    move v8, v3

    .line 159
    goto :goto_3

    .line 160
    :goto_4
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 161
    if-nez v4, :cond_7

    .line 162
    .line 163
    iget-object p0, p0, Let;->j:Ljava/lang/Object;

    .line 164
    .line 165
    check-cast p0, Ly02;

    .line 166
    .line 167
    iget-object p0, p0, Ly02;->o:Lzy1;

    .line 168
    .line 169
    invoke-static {p0}, Ly02;->l(Lm22;)V

    .line 170
    .line 171
    .line 172
    iget-object p0, p0, Lzy1;->u:Lso;

    .line 173
    .line 174
    const-string p1, "Ignoring lower-priority consent settings, proposed settings"

    .line 175
    .line 176
    invoke-virtual {p0, v5, p1}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 177
    .line 178
    .line 179
    return-void

    .line 180
    :cond_7
    iget-object p1, p0, Lc52;->x:Ljava/util/concurrent/atomic/AtomicLong;

    .line 181
    .line 182
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicLong;->getAndIncrement()J

    .line 183
    .line 184
    .line 185
    move-result-wide v6

    .line 186
    if-eqz v3, :cond_9

    .line 187
    .line 188
    iget-object p1, p0, Lc52;->p:Ljava/util/concurrent/atomic/AtomicReference;

    .line 189
    .line 190
    const/4 v0, 0x0

    .line 191
    invoke-virtual {p1, v0}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 192
    .line 193
    .line 194
    new-instance v3, Le42;

    .line 195
    .line 196
    move-object v4, p0

    .line 197
    invoke-direct/range {v3 .. v8}, Le42;-><init>(Lc52;Lu22;JZ)V

    .line 198
    .line 199
    .line 200
    if-eqz p2, :cond_8

    .line 201
    .line 202
    invoke-virtual {v4}, Lgx1;->l()V

    .line 203
    .line 204
    .line 205
    invoke-interface {v3}, Ljava/lang/Runnable;->run()V

    .line 206
    .line 207
    .line 208
    return-void

    .line 209
    :cond_8
    iget-object p0, v4, Let;->j:Ljava/lang/Object;

    .line 210
    .line 211
    check-cast p0, Ly02;

    .line 212
    .line 213
    iget-object p0, p0, Ly02;->p:Ls02;

    .line 214
    .line 215
    invoke-static {p0}, Ly02;->l(Lm22;)V

    .line 216
    .line 217
    .line 218
    invoke-virtual {p0, v3}, Ls02;->w(Ljava/lang/Runnable;)V

    .line 219
    .line 220
    .line 221
    return-void

    .line 222
    :cond_9
    move-object v4, p0

    .line 223
    new-instance v3, Lg42;

    .line 224
    .line 225
    invoke-direct/range {v3 .. v8}, Lg42;-><init>(Lc52;Lu22;JZ)V

    .line 226
    .line 227
    .line 228
    if-eqz p2, :cond_a

    .line 229
    .line 230
    invoke-virtual {v4}, Lgx1;->l()V

    .line 231
    .line 232
    .line 233
    invoke-interface {v3}, Ljava/lang/Runnable;->run()V

    .line 234
    .line 235
    .line 236
    return-void

    .line 237
    :cond_a
    const/16 p0, 0x1e

    .line 238
    .line 239
    if-eq v0, p0, :cond_c

    .line 240
    .line 241
    if-ne v0, v1, :cond_b

    .line 242
    .line 243
    goto :goto_5

    .line 244
    :cond_b
    iget-object p0, v4, Let;->j:Ljava/lang/Object;

    .line 245
    .line 246
    check-cast p0, Ly02;

    .line 247
    .line 248
    iget-object p0, p0, Ly02;->p:Ls02;

    .line 249
    .line 250
    invoke-static {p0}, Ly02;->l(Lm22;)V

    .line 251
    .line 252
    .line 253
    invoke-virtual {p0, v3}, Ls02;->u(Ljava/lang/Runnable;)V

    .line 254
    .line 255
    .line 256
    return-void

    .line 257
    :cond_c
    :goto_5
    iget-object p0, v4, Let;->j:Ljava/lang/Object;

    .line 258
    .line 259
    check-cast p0, Ly02;

    .line 260
    .line 261
    iget-object p0, p0, Ly02;->p:Ls02;

    .line 262
    .line 263
    invoke-static {p0}, Ly02;->l(Lm22;)V

    .line 264
    .line 265
    .line 266
    invoke-virtual {p0, v3}, Ls02;->w(Ljava/lang/Runnable;)V

    .line 267
    .line 268
    .line 269
    return-void

    .line 270
    :goto_6
    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 271
    throw p0
.end method

.method public final I()V
    .locals 8

    .line 1
    invoke-static {}, Lqs1;->a()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Let;->j:Ljava/lang/Object;

    .line 5
    .line 6
    check-cast v0, Ly02;

    .line 7
    .line 8
    iget-object v1, v0, Ly02;->m:Lmt1;

    .line 9
    .line 10
    iget-object v2, v0, Ly02;->p:Ls02;

    .line 11
    .line 12
    iget-object v0, v0, Ly02;->o:Lzy1;

    .line 13
    .line 14
    const/4 v3, 0x0

    .line 15
    sget-object v4, Lxx1;->P0:Lwx1;

    .line 16
    .line 17
    invoke-virtual {v1, v3, v4}, Lmt1;->w(Ljava/lang/String;Lwx1;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_3

    .line 22
    .line 23
    invoke-static {v2}, Ly02;->l(Lm22;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v2}, Ls02;->r()Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-nez v1, :cond_2

    .line 31
    .line 32
    invoke-static {}, Ltb0;->m()Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-nez v1, :cond_1

    .line 37
    .line 38
    invoke-virtual {p0}, Lay1;->m()V

    .line 39
    .line 40
    .line 41
    invoke-static {v0}, Ly02;->l(Lm22;)V

    .line 42
    .line 43
    .line 44
    iget-object v1, v0, Lzy1;->w:Lso;

    .line 45
    .line 46
    const-string v3, "Getting trigger URIs (FE)"

    .line 47
    .line 48
    invoke-virtual {v1, v3}, Lso;->b(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    new-instance v3, Ljava/util/concurrent/atomic/AtomicReference;

    .line 52
    .line 53
    invoke-direct {v3}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 54
    .line 55
    .line 56
    invoke-static {v2}, Ly02;->l(Lm22;)V

    .line 57
    .line 58
    .line 59
    new-instance v7, Lq42;

    .line 60
    .line 61
    invoke-direct {v7, p0, v3}, Lq42;-><init>(Lc52;Ljava/util/concurrent/atomic/AtomicReference;)V

    .line 62
    .line 63
    .line 64
    const-wide/16 v4, 0x2710

    .line 65
    .line 66
    const-string v6, "get trigger URIs"

    .line 67
    .line 68
    invoke-virtual/range {v2 .. v7}, Ls02;->v(Ljava/util/concurrent/atomic/AtomicReference;JLjava/lang/String;Ljava/lang/Runnable;)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    check-cast v1, Ljava/util/List;

    .line 76
    .line 77
    if-nez v1, :cond_0

    .line 78
    .line 79
    invoke-static {v0}, Ly02;->l(Lm22;)V

    .line 80
    .line 81
    .line 82
    iget-object p0, v0, Lzy1;->q:Lso;

    .line 83
    .line 84
    const-string v0, "Timed out waiting for get trigger URIs"

    .line 85
    .line 86
    invoke-virtual {p0, v0}, Lso;->b(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    return-void

    .line 90
    :cond_0
    invoke-static {v2}, Ly02;->l(Lm22;)V

    .line 91
    .line 92
    .line 93
    new-instance v0, Lr42;

    .line 94
    .line 95
    invoke-direct {v0, p0, v1}, Lr42;-><init>(Lc52;Ljava/util/List;)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {v2, v0}, Ls02;->u(Ljava/lang/Runnable;)V

    .line 99
    .line 100
    .line 101
    return-void

    .line 102
    :cond_1
    invoke-static {v0}, Ly02;->l(Lm22;)V

    .line 103
    .line 104
    .line 105
    iget-object p0, v0, Lzy1;->o:Lso;

    .line 106
    .line 107
    const-string v0, "Cannot get trigger URIs from main thread"

    .line 108
    .line 109
    invoke-virtual {p0, v0}, Lso;->b(Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    return-void

    .line 113
    :cond_2
    invoke-static {v0}, Ly02;->l(Lm22;)V

    .line 114
    .line 115
    .line 116
    iget-object p0, v0, Lzy1;->o:Lso;

    .line 117
    .line 118
    const-string v0, "Cannot get trigger URIs from analytics worker thread"

    .line 119
    .line 120
    invoke-virtual {p0, v0}, Lso;->b(Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    :cond_3
    return-void
.end method

.method public final J()Ljava/util/PriorityQueue;
    .locals 3

    .line 1
    iget-object v0, p0, Lc52;->v:Ljava/util/PriorityQueue;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/util/PriorityQueue;

    .line 6
    .line 7
    sget-object v1, Ls42;->a:Ls42;

    .line 8
    .line 9
    sget-object v2, Ld2;->k:Ld2;

    .line 10
    .line 11
    invoke-static {v1, v2}, Ljava/util/Comparator;->comparing(Ljava/util/function/Function;Ljava/util/Comparator;)Ljava/util/Comparator;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-direct {v0, v1}, Ljava/util/PriorityQueue;-><init>(Ljava/util/Comparator;)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lc52;->v:Ljava/util/PriorityQueue;

    .line 19
    .line 20
    :cond_0
    return-object v0
.end method

.method public final K()V
    .locals 6

    .line 1
    invoke-virtual {p0}, Lgx1;->l()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lc52;->J()Ljava/util/PriorityQueue;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ljava/util/AbstractCollection;->isEmpty()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_2

    .line 13
    .line 14
    iget-boolean v0, p0, Lc52;->r:Z

    .line 15
    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    invoke-virtual {p0}, Lc52;->J()Ljava/util/PriorityQueue;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Ljava/util/PriorityQueue;->poll()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Lo92;

    .line 28
    .line 29
    if-eqz v0, :cond_2

    .line 30
    .line 31
    iget-object v1, p0, Let;->j:Ljava/lang/Object;

    .line 32
    .line 33
    check-cast v1, Ly02;

    .line 34
    .line 35
    iget-object v2, v1, Ly02;->r:Lcb2;

    .line 36
    .line 37
    invoke-static {v2}, Ly02;->j(Let;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v2}, Lcb2;->H()Lim0;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    if-eqz v2, :cond_2

    .line 45
    .line 46
    const/4 v3, 0x1

    .line 47
    iput-boolean v3, p0, Lc52;->r:Z

    .line 48
    .line 49
    iget-object v1, v1, Ly02;->o:Lzy1;

    .line 50
    .line 51
    invoke-static {v1}, Ly02;->l(Lm22;)V

    .line 52
    .line 53
    .line 54
    iget-object v1, v1, Lzy1;->w:Lso;

    .line 55
    .line 56
    iget-object v3, v0, Lo92;->j:Ljava/lang/String;

    .line 57
    .line 58
    const-string v4, "Registering trigger URI"

    .line 59
    .line 60
    invoke-virtual {v1, v3, v4}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    invoke-virtual {v2, v1}, Lim0;->e(Landroid/net/Uri;)Lqj0;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    const/4 v2, 0x0

    .line 72
    if-nez v1, :cond_1

    .line 73
    .line 74
    iput-boolean v2, p0, Lc52;->r:Z

    .line 75
    .line 76
    invoke-virtual {p0}, Lc52;->J()Ljava/util/PriorityQueue;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-virtual {p0, v0}, Ljava/util/PriorityQueue;->add(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    :cond_1
    new-instance v3, Lq10;

    .line 85
    .line 86
    const/4 v4, 0x3

    .line 87
    invoke-direct {v3, v4, p0}, Lq10;-><init>(ILjava/lang/Object;)V

    .line 88
    .line 89
    .line 90
    new-instance v4, Lxn0;

    .line 91
    .line 92
    const/16 v5, 0x18

    .line 93
    .line 94
    invoke-direct {v4, p0, v0, v5, v2}, Lxn0;-><init>(Ljava/lang/Object;Ljava/lang/Object;IZ)V

    .line 95
    .line 96
    .line 97
    new-instance p0, Lr90;

    .line 98
    .line 99
    invoke-direct {p0, v1, v4}, Lr90;-><init>(Lqj0;Lxn0;)V

    .line 100
    .line 101
    .line 102
    invoke-interface {v1, p0, v3}, Lqj0;->a(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    .line 103
    .line 104
    .line 105
    :cond_2
    :goto_0
    return-void
.end method

.method public final L(Lu22;)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Lgx1;->l()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lt22;->l:Lt22;

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Lu22;->i(Lt22;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x0

    .line 11
    const/4 v2, 0x1

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    sget-object v0, Lt22;->k:Lt22;

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Lu22;->i(Lt22;)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-nez p1, :cond_0

    .line 21
    .line 22
    goto :goto_1

    .line 23
    :cond_0
    :goto_0
    move p1, v2

    .line 24
    goto :goto_2

    .line 25
    :cond_1
    :goto_1
    iget-object p1, p0, Let;->j:Ljava/lang/Object;

    .line 26
    .line 27
    check-cast p1, Ly02;

    .line 28
    .line 29
    invoke-virtual {p1}, Ly02;->n()Li82;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p1}, Li82;->u()Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-eqz p1, :cond_2

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_2
    move p1, v1

    .line 41
    :goto_2
    iget-object v0, p0, Let;->j:Ljava/lang/Object;

    .line 42
    .line 43
    check-cast v0, Ly02;

    .line 44
    .line 45
    iget-object v3, v0, Ly02;->p:Ls02;

    .line 46
    .line 47
    invoke-static {v3}, Ly02;->l(Lm22;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v3}, Ls02;->l()V

    .line 51
    .line 52
    .line 53
    iget-boolean v3, v0, Ly02;->I:Z

    .line 54
    .line 55
    if-eq p1, v3, :cond_5

    .line 56
    .line 57
    iget-object v3, v0, Ly02;->p:Ls02;

    .line 58
    .line 59
    invoke-static {v3}, Ly02;->l(Lm22;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v3}, Ls02;->l()V

    .line 63
    .line 64
    .line 65
    iput-boolean p1, v0, Ly02;->I:Z

    .line 66
    .line 67
    iget-object v0, p0, Let;->j:Ljava/lang/Object;

    .line 68
    .line 69
    check-cast v0, Ly02;

    .line 70
    .line 71
    iget-object v0, v0, Ly02;->n:Lvz1;

    .line 72
    .line 73
    invoke-static {v0}, Ly02;->j(Let;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v0}, Let;->l()V

    .line 77
    .line 78
    .line 79
    invoke-virtual {v0}, Lvz1;->p()Landroid/content/SharedPreferences;

    .line 80
    .line 81
    .line 82
    move-result-object v3

    .line 83
    const-string v4, "measurement_enabled_from_api"

    .line 84
    .line 85
    invoke-interface {v3, v4}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    .line 86
    .line 87
    .line 88
    move-result v3

    .line 89
    if-eqz v3, :cond_3

    .line 90
    .line 91
    invoke-virtual {v0}, Lvz1;->p()Landroid/content/SharedPreferences;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    invoke-interface {v0, v4, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    goto :goto_3

    .line 104
    :cond_3
    const/4 v0, 0x0

    .line 105
    :goto_3
    if-eqz p1, :cond_4

    .line 106
    .line 107
    if-eqz v0, :cond_4

    .line 108
    .line 109
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    if-eqz v0, :cond_5

    .line 114
    .line 115
    :cond_4
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    invoke-virtual {p0, p1, v1}, Lc52;->C(Ljava/lang/Boolean;Z)V

    .line 120
    .line 121
    .line 122
    :cond_5
    return-void
.end method

.method public final o()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public final p(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 12

    .line 1
    iget-object v0, p0, Let;->j:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ly02;

    .line 4
    .line 5
    iget-object v1, v0, Ly02;->t:Lmz;

    .line 6
    .line 7
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 11
    .line 12
    .line 13
    move-result-wide v8

    .line 14
    iget-object v1, v0, Ly02;->m:Lmt1;

    .line 15
    .line 16
    const/4 v2, 0x0

    .line 17
    sget-object v3, Lxx1;->e1:Lwx1;

    .line 18
    .line 19
    invoke-virtual {v1, v2, v3}, Lmt1;->w(Ljava/lang/String;Lwx1;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    iget-object v0, v0, Ly02;->t:Lmz;

    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 28
    .line 29
    .line 30
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 31
    .line 32
    .line 33
    move-result-wide v0

    .line 34
    :goto_0
    move-wide v10, v0

    .line 35
    goto :goto_1

    .line 36
    :cond_0
    const-wide/16 v0, 0x0

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :goto_1
    const/4 v6, 0x1

    .line 40
    const/4 v7, 0x1

    .line 41
    move-object v2, p0

    .line 42
    move-object v3, p1

    .line 43
    move-object v4, p2

    .line 44
    move-object v5, p3

    .line 45
    invoke-virtual/range {v2 .. v11}, Lc52;->q(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;ZZJJ)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public final q(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;ZZJJ)V
    .locals 19

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    if-nez p3, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroid/os/Bundle;

    .line 6
    .line 7
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 8
    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    move-object/from16 v0, p3

    .line 12
    .line 13
    :goto_0
    const-string v2, "screen_view"

    .line 14
    .line 15
    move-object/from16 v3, p2

    .line 16
    .line 17
    invoke-static {v3, v2}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    const/4 v4, 0x0

    .line 22
    const-wide/16 v5, 0x0

    .line 23
    .line 24
    const/4 v7, 0x0

    .line 25
    const/4 v8, 0x1

    .line 26
    if-eqz v2, :cond_c

    .line 27
    .line 28
    iget-object v1, v1, Let;->j:Ljava/lang/Object;

    .line 29
    .line 30
    check-cast v1, Ly02;

    .line 31
    .line 32
    iget-object v2, v1, Ly02;->u:Lz52;

    .line 33
    .line 34
    invoke-static {v2}, Ly02;->k(Lay1;)V

    .line 35
    .line 36
    .line 37
    iget-object v1, v1, Ly02;->m:Lmt1;

    .line 38
    .line 39
    sget-object v3, Lxx1;->e1:Lwx1;

    .line 40
    .line 41
    invoke-virtual {v1, v7, v3}, Lmt1;->w(Ljava/lang/String;Lwx1;)Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-eq v8, v1, :cond_1

    .line 46
    .line 47
    move-wide/from16 v17, v5

    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_1
    move-wide/from16 v17, p8

    .line 51
    .line 52
    :goto_1
    iget-object v9, v2, Lz52;->u:Ljava/lang/Object;

    .line 53
    .line 54
    monitor-enter v9

    .line 55
    :try_start_0
    iget-boolean v1, v2, Lz52;->t:Z

    .line 56
    .line 57
    if-nez v1, :cond_2

    .line 58
    .line 59
    iget-object v0, v2, Let;->j:Ljava/lang/Object;

    .line 60
    .line 61
    check-cast v0, Ly02;

    .line 62
    .line 63
    iget-object v0, v0, Ly02;->o:Lzy1;

    .line 64
    .line 65
    invoke-static {v0}, Ly02;->l(Lm22;)V

    .line 66
    .line 67
    .line 68
    iget-object v0, v0, Lzy1;->t:Lso;

    .line 69
    .line 70
    const-string v1, "Cannot log screen view event when the app is in the background."

    .line 71
    .line 72
    invoke-virtual {v0, v1}, Lso;->b(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    monitor-exit v9

    .line 76
    return-void

    .line 77
    :catchall_0
    move-exception v0

    .line 78
    goto/16 :goto_6

    .line 79
    .line 80
    :cond_2
    const-string v1, "screen_name"

    .line 81
    .line 82
    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v10

    .line 86
    const/16 v1, 0x1f4

    .line 87
    .line 88
    if-eqz v10, :cond_4

    .line 89
    .line 90
    invoke-virtual {v10}, Ljava/lang/String;->length()I

    .line 91
    .line 92
    .line 93
    move-result v3

    .line 94
    if-lez v3, :cond_3

    .line 95
    .line 96
    invoke-virtual {v10}, Ljava/lang/String;->length()I

    .line 97
    .line 98
    .line 99
    move-result v3

    .line 100
    iget-object v5, v2, Let;->j:Ljava/lang/Object;

    .line 101
    .line 102
    check-cast v5, Ly02;

    .line 103
    .line 104
    iget-object v5, v5, Ly02;->m:Lmt1;

    .line 105
    .line 106
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 107
    .line 108
    .line 109
    if-le v3, v1, :cond_4

    .line 110
    .line 111
    :cond_3
    iget-object v0, v2, Let;->j:Ljava/lang/Object;

    .line 112
    .line 113
    check-cast v0, Ly02;

    .line 114
    .line 115
    iget-object v0, v0, Ly02;->o:Lzy1;

    .line 116
    .line 117
    invoke-static {v0}, Ly02;->l(Lm22;)V

    .line 118
    .line 119
    .line 120
    iget-object v0, v0, Lzy1;->t:Lso;

    .line 121
    .line 122
    const-string v1, "Invalid screen name length for screen view. Length"

    .line 123
    .line 124
    invoke-virtual {v10}, Ljava/lang/String;->length()I

    .line 125
    .line 126
    .line 127
    move-result v2

    .line 128
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 129
    .line 130
    .line 131
    move-result-object v2

    .line 132
    invoke-virtual {v0, v2, v1}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 133
    .line 134
    .line 135
    monitor-exit v9

    .line 136
    return-void

    .line 137
    :cond_4
    const-string v3, "screen_class"

    .line 138
    .line 139
    invoke-virtual {v0, v3}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v3

    .line 143
    if-eqz v3, :cond_6

    .line 144
    .line 145
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    .line 146
    .line 147
    .line 148
    move-result v5

    .line 149
    if-lez v5, :cond_5

    .line 150
    .line 151
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    .line 152
    .line 153
    .line 154
    move-result v5

    .line 155
    iget-object v6, v2, Let;->j:Ljava/lang/Object;

    .line 156
    .line 157
    check-cast v6, Ly02;

    .line 158
    .line 159
    iget-object v6, v6, Ly02;->m:Lmt1;

    .line 160
    .line 161
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 162
    .line 163
    .line 164
    if-le v5, v1, :cond_6

    .line 165
    .line 166
    :cond_5
    iget-object v0, v2, Let;->j:Ljava/lang/Object;

    .line 167
    .line 168
    check-cast v0, Ly02;

    .line 169
    .line 170
    iget-object v0, v0, Ly02;->o:Lzy1;

    .line 171
    .line 172
    invoke-static {v0}, Ly02;->l(Lm22;)V

    .line 173
    .line 174
    .line 175
    iget-object v0, v0, Lzy1;->t:Lso;

    .line 176
    .line 177
    const-string v1, "Invalid screen class length for screen view. Length"

    .line 178
    .line 179
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    .line 180
    .line 181
    .line 182
    move-result v2

    .line 183
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 184
    .line 185
    .line 186
    move-result-object v2

    .line 187
    invoke-virtual {v0, v2, v1}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 188
    .line 189
    .line 190
    monitor-exit v9

    .line 191
    return-void

    .line 192
    :cond_6
    if-nez v3, :cond_7

    .line 193
    .line 194
    iget-object v1, v2, Lz52;->p:Lmw1;

    .line 195
    .line 196
    if-eqz v1, :cond_8

    .line 197
    .line 198
    iget-object v1, v1, Lmw1;->k:Ljava/lang/String;

    .line 199
    .line 200
    invoke-virtual {v2, v1}, Lz52;->q(Ljava/lang/String;)Ljava/lang/String;

    .line 201
    .line 202
    .line 203
    move-result-object v3

    .line 204
    :cond_7
    :goto_2
    move-object v11, v3

    .line 205
    goto :goto_3

    .line 206
    :cond_8
    const-string v3, "Activity"

    .line 207
    .line 208
    goto :goto_2

    .line 209
    :goto_3
    iget-object v1, v2, Lz52;->l:Lm52;

    .line 210
    .line 211
    iget-boolean v3, v2, Lz52;->q:Z

    .line 212
    .line 213
    if-eqz v3, :cond_9

    .line 214
    .line 215
    if-eqz v1, :cond_9

    .line 216
    .line 217
    iput-boolean v4, v2, Lz52;->q:Z

    .line 218
    .line 219
    iget-object v3, v1, Lm52;->b:Ljava/lang/String;

    .line 220
    .line 221
    invoke-static {v3, v11}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 222
    .line 223
    .line 224
    move-result v3

    .line 225
    iget-object v1, v1, Lm52;->a:Ljava/lang/String;

    .line 226
    .line 227
    invoke-static {v1, v10}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 228
    .line 229
    .line 230
    move-result v1

    .line 231
    if-eqz v3, :cond_9

    .line 232
    .line 233
    if-eqz v1, :cond_9

    .line 234
    .line 235
    iget-object v0, v2, Let;->j:Ljava/lang/Object;

    .line 236
    .line 237
    check-cast v0, Ly02;

    .line 238
    .line 239
    iget-object v0, v0, Ly02;->o:Lzy1;

    .line 240
    .line 241
    invoke-static {v0}, Ly02;->l(Lm22;)V

    .line 242
    .line 243
    .line 244
    iget-object v0, v0, Lzy1;->t:Lso;

    .line 245
    .line 246
    const-string v1, "Ignoring call to log screen view event with duplicate parameters."

    .line 247
    .line 248
    invoke-virtual {v0, v1}, Lso;->b(Ljava/lang/String;)V

    .line 249
    .line 250
    .line 251
    monitor-exit v9

    .line 252
    return-void

    .line 253
    :cond_9
    monitor-exit v9
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 254
    iget-object v1, v2, Let;->j:Ljava/lang/Object;

    .line 255
    .line 256
    check-cast v1, Ly02;

    .line 257
    .line 258
    iget-object v3, v1, Ly02;->o:Lzy1;

    .line 259
    .line 260
    invoke-static {v3}, Ly02;->l(Lm22;)V

    .line 261
    .line 262
    .line 263
    iget-object v3, v3, Lzy1;->w:Lso;

    .line 264
    .line 265
    if-nez v10, :cond_a

    .line 266
    .line 267
    const-string v4, "null"

    .line 268
    .line 269
    goto :goto_4

    .line 270
    :cond_a
    move-object v4, v10

    .line 271
    :goto_4
    const-string v5, "Logging screen view with name, class"

    .line 272
    .line 273
    invoke-virtual {v3, v5, v4, v11}, Lso;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 274
    .line 275
    .line 276
    iget-object v3, v2, Lz52;->l:Lm52;

    .line 277
    .line 278
    if-nez v3, :cond_b

    .line 279
    .line 280
    iget-object v3, v2, Lz52;->m:Lm52;

    .line 281
    .line 282
    goto :goto_5

    .line 283
    :cond_b
    iget-object v3, v2, Lz52;->l:Lm52;

    .line 284
    .line 285
    :goto_5
    new-instance v9, Lm52;

    .line 286
    .line 287
    iget-object v4, v1, Ly02;->r:Lcb2;

    .line 288
    .line 289
    invoke-static {v4}, Ly02;->j(Let;)V

    .line 290
    .line 291
    .line 292
    invoke-virtual {v4}, Lcb2;->j0()J

    .line 293
    .line 294
    .line 295
    move-result-wide v12

    .line 296
    const/4 v14, 0x1

    .line 297
    move-wide/from16 v15, p6

    .line 298
    .line 299
    invoke-direct/range {v9 .. v18}, Lm52;-><init>(Ljava/lang/String;Ljava/lang/String;JZJJ)V

    .line 300
    .line 301
    .line 302
    iput-object v9, v2, Lz52;->l:Lm52;

    .line 303
    .line 304
    iput-object v3, v2, Lz52;->m:Lm52;

    .line 305
    .line 306
    iput-object v9, v2, Lz52;->r:Lm52;

    .line 307
    .line 308
    iget-object v4, v1, Ly02;->t:Lmz;

    .line 309
    .line 310
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 311
    .line 312
    .line 313
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 314
    .line 315
    .line 316
    move-result-wide v4

    .line 317
    iget-object v1, v1, Ly02;->p:Ls02;

    .line 318
    .line 319
    invoke-static {v1}, Ly02;->l(Lm22;)V

    .line 320
    .line 321
    .line 322
    new-instance v6, Ln52;

    .line 323
    .line 324
    move-object/from16 p2, v0

    .line 325
    .line 326
    move-object/from16 p1, v2

    .line 327
    .line 328
    move-object/from16 p4, v3

    .line 329
    .line 330
    move-wide/from16 p5, v4

    .line 331
    .line 332
    move-object/from16 p0, v6

    .line 333
    .line 334
    move-object/from16 p3, v9

    .line 335
    .line 336
    invoke-direct/range {p0 .. p6}, Ln52;-><init>(Lz52;Landroid/os/Bundle;Lm52;Lm52;J)V

    .line 337
    .line 338
    .line 339
    move-object/from16 v0, p0

    .line 340
    .line 341
    invoke-virtual {v1, v0}, Ls02;->u(Ljava/lang/Runnable;)V

    .line 342
    .line 343
    .line 344
    return-void

    .line 345
    :goto_6
    :try_start_1
    monitor-exit v9
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 346
    throw v0

    .line 347
    :cond_c
    if-eqz p5, :cond_d

    .line 348
    .line 349
    iget-object v2, v1, Lc52;->m:Lka2;

    .line 350
    .line 351
    if-eqz v2, :cond_d

    .line 352
    .line 353
    invoke-static {v3}, Lcb2;->P(Ljava/lang/String;)Z

    .line 354
    .line 355
    .line 356
    move-result v2

    .line 357
    if-eqz v2, :cond_e

    .line 358
    .line 359
    :cond_d
    move v10, v8

    .line 360
    goto :goto_7

    .line 361
    :cond_e
    move v10, v4

    .line 362
    :goto_7
    if-nez p1, :cond_f

    .line 363
    .line 364
    const-string v2, "app"

    .line 365
    .line 366
    goto :goto_8

    .line 367
    :cond_f
    move-object/from16 v2, p1

    .line 368
    .line 369
    :goto_8
    iget-object v9, v1, Let;->j:Ljava/lang/Object;

    .line 370
    .line 371
    check-cast v9, Ly02;

    .line 372
    .line 373
    iget-object v9, v9, Ly02;->m:Lmt1;

    .line 374
    .line 375
    sget-object v11, Lxx1;->e1:Lwx1;

    .line 376
    .line 377
    invoke-virtual {v9, v7, v11}, Lmt1;->w(Ljava/lang/String;Lwx1;)Z

    .line 378
    .line 379
    .line 380
    move-result v7

    .line 381
    if-eq v8, v7, :cond_10

    .line 382
    .line 383
    move-wide v6, v5

    .line 384
    goto :goto_9

    .line 385
    :cond_10
    move-wide/from16 v6, p8

    .line 386
    .line 387
    :goto_9
    new-instance v8, Landroid/os/Bundle;

    .line 388
    .line 389
    invoke-direct {v8, v0}, Landroid/os/Bundle;-><init>(Landroid/os/Bundle;)V

    .line 390
    .line 391
    .line 392
    invoke-virtual {v8}, Landroid/os/BaseBundle;->keySet()Ljava/util/Set;

    .line 393
    .line 394
    .line 395
    move-result-object v0

    .line 396
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 397
    .line 398
    .line 399
    move-result-object v0

    .line 400
    :cond_11
    :goto_a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 401
    .line 402
    .line 403
    move-result v5

    .line 404
    if-eqz v5, :cond_16

    .line 405
    .line 406
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 407
    .line 408
    .line 409
    move-result-object v5

    .line 410
    check-cast v5, Ljava/lang/String;

    .line 411
    .line 412
    invoke-virtual {v8, v5}, Landroid/os/BaseBundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 413
    .line 414
    .line 415
    move-result-object v9

    .line 416
    instance-of v11, v9, Landroid/os/Bundle;

    .line 417
    .line 418
    if-eqz v11, :cond_12

    .line 419
    .line 420
    new-instance v11, Landroid/os/Bundle;

    .line 421
    .line 422
    check-cast v9, Landroid/os/Bundle;

    .line 423
    .line 424
    invoke-direct {v11, v9}, Landroid/os/Bundle;-><init>(Landroid/os/Bundle;)V

    .line 425
    .line 426
    .line 427
    invoke-virtual {v8, v5, v11}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 428
    .line 429
    .line 430
    goto :goto_a

    .line 431
    :cond_12
    instance-of v5, v9, [Landroid/os/Parcelable;

    .line 432
    .line 433
    if-eqz v5, :cond_14

    .line 434
    .line 435
    check-cast v9, [Landroid/os/Parcelable;

    .line 436
    .line 437
    move v5, v4

    .line 438
    :goto_b
    array-length v11, v9

    .line 439
    if-ge v5, v11, :cond_11

    .line 440
    .line 441
    aget-object v11, v9, v5

    .line 442
    .line 443
    instance-of v12, v11, Landroid/os/Bundle;

    .line 444
    .line 445
    if-eqz v12, :cond_13

    .line 446
    .line 447
    new-instance v12, Landroid/os/Bundle;

    .line 448
    .line 449
    check-cast v11, Landroid/os/Bundle;

    .line 450
    .line 451
    invoke-direct {v12, v11}, Landroid/os/Bundle;-><init>(Landroid/os/Bundle;)V

    .line 452
    .line 453
    .line 454
    aput-object v12, v9, v5

    .line 455
    .line 456
    :cond_13
    add-int/lit8 v5, v5, 0x1

    .line 457
    .line 458
    goto :goto_b

    .line 459
    :cond_14
    instance-of v5, v9, Ljava/util/List;

    .line 460
    .line 461
    if-eqz v5, :cond_11

    .line 462
    .line 463
    check-cast v9, Ljava/util/List;

    .line 464
    .line 465
    move v5, v4

    .line 466
    :goto_c
    invoke-interface {v9}, Ljava/util/List;->size()I

    .line 467
    .line 468
    .line 469
    move-result v11

    .line 470
    if-ge v5, v11, :cond_11

    .line 471
    .line 472
    invoke-interface {v9, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 473
    .line 474
    .line 475
    move-result-object v11

    .line 476
    instance-of v12, v11, Landroid/os/Bundle;

    .line 477
    .line 478
    if-eqz v12, :cond_15

    .line 479
    .line 480
    new-instance v12, Landroid/os/Bundle;

    .line 481
    .line 482
    check-cast v11, Landroid/os/Bundle;

    .line 483
    .line 484
    invoke-direct {v12, v11}, Landroid/os/Bundle;-><init>(Landroid/os/Bundle;)V

    .line 485
    .line 486
    .line 487
    invoke-interface {v9, v5, v12}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 488
    .line 489
    .line 490
    :cond_15
    add-int/lit8 v5, v5, 0x1

    .line 491
    .line 492
    goto :goto_c

    .line 493
    :cond_16
    iget-object v0, v1, Let;->j:Ljava/lang/Object;

    .line 494
    .line 495
    check-cast v0, Ly02;

    .line 496
    .line 497
    iget-object v12, v0, Ly02;->p:Ls02;

    .line 498
    .line 499
    invoke-static {v12}, Ly02;->l(Lm22;)V

    .line 500
    .line 501
    .line 502
    new-instance v0, Ln32;

    .line 503
    .line 504
    move/from16 v11, p4

    .line 505
    .line 506
    move/from16 v9, p5

    .line 507
    .line 508
    move-wide/from16 v4, p6

    .line 509
    .line 510
    invoke-direct/range {v0 .. v11}, Ln32;-><init>(Lc52;Ljava/lang/String;Ljava/lang/String;JJLandroid/os/Bundle;ZZZ)V

    .line 511
    .line 512
    .line 513
    invoke-virtual {v12, v0}, Ls02;->u(Ljava/lang/Runnable;)V

    .line 514
    .line 515
    .line 516
    return-void
.end method

.method public final r()V
    .locals 51

    move-object/from16 v0, p0

    .line 1
    invoke-virtual {v0}, Lgx1;->l()V

    iget-object v1, v0, Let;->j:Ljava/lang/Object;

    check-cast v1, Ly02;

    .line 2
    iget-object v2, v1, Ly02;->o:Lzy1;

    iget-object v3, v1, Ly02;->o:Lzy1;

    .line 3
    invoke-static {v2}, Ly02;->l(Lm22;)V

    .line 4
    iget-object v2, v2, Lzy1;->v:Lso;

    .line 5
    const-string v4, "Handle tcf update."

    invoke-virtual {v2, v4}, Lso;->b(Ljava/lang/String;)V

    .line 6
    iget-object v2, v1, Ly02;->n:Lvz1;

    invoke-static {v2}, Ly02;->j(Let;)V

    .line 7
    invoke-virtual {v2}, Lvz1;->q()Landroid/content/SharedPreferences;

    move-result-object v4

    .line 8
    sget-object v5, Ll92;->a:Lmz0;

    .line 9
    sget-object v6, Ljo1;->k:Ljo1;

    sget-object v7, Lk92;->j:Lk92;

    sget-object v8, Ljo1;->l:Ljo1;

    sget-object v9, Lk92;->k:Lk92;

    sget-object v10, Ljo1;->m:Ljo1;

    sget-object v11, Ljo1;->n:Ljo1;

    sget-object v12, Ljo1;->o:Ljo1;

    sget-object v16, Ljo1;->p:Ljo1;

    sget-object v18, Ljo1;->q:Ljo1;

    move-object v14, v12

    move-object v12, v11

    move-object v11, v7

    move-object v13, v7

    move-object v15, v9

    move-object/from16 v17, v9

    move-object/from16 v19, v9

    filled-new-array/range {v6 .. v19}, [Ljava/lang/Object;

    move-result-object v5

    move-object v7, v10

    move-object v8, v12

    move-object v9, v14

    const/4 v10, 0x7

    const/4 v11, 0x0

    .line 10
    invoke-static {v10, v5, v11}, Lrz0;->a(I[Ljava/lang/Object;Lo7;)Lrz0;

    move-result-object v12

    .line 11
    sget v5, Lbe0;->l:I

    .line 12
    new-instance v15, Lz71;

    const-string v5, "CH"

    invoke-direct {v15, v5}, Lz71;-><init>(Ljava/lang/Object;)V

    const/4 v5, 0x5

    .line 13
    new-array v10, v5, [C

    const-string v13, "IABTCF_TCString"

    .line 14
    invoke-interface {v4, v13}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v13

    const-string v14, "IABTCF_CmpSdkID"

    const/4 v5, -0x1

    .line 15
    :try_start_0
    invoke-interface {v4, v14, v5}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v14
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move v14, v5

    .line 16
    :goto_0
    const-string v11, "IABTCF_PolicyVersion"

    .line 17
    :try_start_1
    invoke-interface {v4, v11, v5}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v11
    :try_end_1
    .catch Ljava/lang/ClassCastException; {:try_start_1 .. :try_end_1} :catch_1

    :goto_1
    move-object/from16 v25, v2

    goto :goto_2

    :catch_1
    move v11, v5

    goto :goto_1

    .line 18
    :goto_2
    const-string v2, "IABTCF_gdprApplies"

    .line 19
    :try_start_2
    invoke-interface {v4, v2, v5}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2
    :try_end_2
    .catch Ljava/lang/ClassCastException; {:try_start_2 .. :try_end_2} :catch_2

    :goto_3
    move-object/from16 v17, v10

    goto :goto_4

    :catch_2
    move v2, v5

    goto :goto_3

    .line 20
    :goto_4
    const-string v10, "IABTCF_PurposeOneTreatment"

    .line 21
    :try_start_3
    invoke-interface {v4, v10, v5}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v10
    :try_end_3
    .catch Ljava/lang/ClassCastException; {:try_start_3 .. :try_end_3} :catch_3

    :goto_5
    move/from16 v18, v11

    goto :goto_6

    :catch_3
    move v10, v5

    goto :goto_5

    .line 22
    :goto_6
    const-string v11, "IABTCF_EnableAdvertiserConsentMode"

    .line 23
    :try_start_4
    invoke-interface {v4, v11, v5}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v11
    :try_end_4
    .catch Ljava/lang/ClassCastException; {:try_start_4 .. :try_end_4} :catch_4

    goto :goto_7

    :catch_4
    move v11, v5

    .line 24
    :goto_7
    const-string v5, "IABTCF_PublisherCC"

    .line 25
    invoke-static {v4, v5}, Ll92;->a(Landroid/content/SharedPreferences;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    move/from16 v19, v13

    .line 26
    new-instance v13, Lo7;

    move/from16 v20, v14

    const/4 v14, 0x4

    .line 27
    invoke-direct {v13, v14}, Lo7;-><init>(I)V

    .line 28
    iget-object v14, v12, Lrz0;->k:Lpz0;

    const/4 v0, 0x0

    if-nez v14, :cond_0

    .line 29
    new-instance v14, Lqz0;

    move-object/from16 v22, v15

    iget-object v15, v12, Lrz0;->n:[Ljava/lang/Object;

    move-object/from16 v26, v1

    iget v1, v12, Lrz0;->o:I

    invoke-direct {v14, v15, v0, v1}, Lqz0;-><init>([Ljava/lang/Object;II)V

    .line 30
    new-instance v1, Lpz0;

    invoke-direct {v1, v12, v14}, Lpz0;-><init>(Lrz0;Lqz0;)V

    .line 31
    iput-object v1, v12, Lrz0;->k:Lpz0;

    move-object v14, v1

    goto :goto_8

    :cond_0
    move-object/from16 v26, v1

    move-object/from16 v22, v15

    .line 32
    :goto_8
    invoke-virtual {v14}, Lpz0;->j()Lcf1;

    move-result-object v1

    :goto_9
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    sget-object v15, Lko1;->n:Lko1;

    move/from16 v27, v0

    if-eqz v14, :cond_7

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljo1;

    .line 33
    invoke-virtual {v14}, Ljo1;->a()I

    move-result v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v29

    invoke-virtual/range {v29 .. v29}, Ljava/lang/String;->length()I

    move-result v29

    move-object/from16 v30, v1

    new-instance v1, Ljava/lang/StringBuilder;

    move-object/from16 v31, v12

    add-int/lit8 v12, v29, 0x1c

    invoke-direct {v1, v12}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v12, "IABTCF_PublisherRestrictions"

    invoke-virtual {v1, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v4, v0}, Ll92;->a(Landroid/content/SharedPreferences;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 34
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_6

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    const/16 v12, 0x2f3

    if-ge v1, v12, :cond_1

    goto :goto_b

    :cond_1
    const/16 v1, 0x2f2

    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0xa

    invoke-static {v0, v1}, Ljava/lang/Character;->digit(CI)I

    move-result v0

    sget-object v1, Lko1;->k:Lko1;

    if-ltz v0, :cond_5

    .line 36
    invoke-static {}, Lko1;->values()[Lko1;

    move-result-object v12

    array-length v12, v12

    if-le v0, v12, :cond_2

    goto :goto_a

    :cond_2
    if-eqz v0, :cond_5

    const/4 v12, 0x1

    if-eq v0, v12, :cond_4

    const/4 v1, 0x2

    if-eq v0, v1, :cond_3

    goto :goto_b

    :cond_3
    sget-object v15, Lko1;->m:Lko1;

    goto :goto_b

    :cond_4
    sget-object v15, Lko1;->l:Lko1;

    goto :goto_b

    :cond_5
    :goto_a
    move-object v15, v1

    .line 37
    :cond_6
    :goto_b
    invoke-virtual {v13, v14, v15}, Lo7;->g(Ljava/lang/Object;Ljava/lang/Object;)V

    move/from16 v0, v27

    move-object/from16 v1, v30

    move-object/from16 v12, v31

    goto :goto_9

    :cond_7
    move-object/from16 v31, v12

    const/4 v12, 0x1

    .line 38
    invoke-virtual {v13, v12}, Lo7;->b(Z)Lrz0;

    move-result-object v13

    .line 39
    const-string v0, "IABTCF_PurposeConsents"

    .line 40
    invoke-static {v4, v0}, Ll92;->a(Landroid/content/SharedPreferences;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "IABTCF_VendorConsents"

    .line 41
    invoke-static {v4, v1}, Ll92;->a(Landroid/content/SharedPreferences;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 42
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v12

    if-nez v12, :cond_8

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v12

    const/16 v14, 0x2f3

    if-lt v12, v14, :cond_8

    const/16 v12, 0x2f2

    .line 43
    invoke-virtual {v1, v12}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v12, 0x31

    if-ne v1, v12, :cond_8

    const/4 v1, 0x1

    goto :goto_c

    :cond_8
    move/from16 v1, v27

    :goto_c
    const-string v12, "IABTCF_PurposeLegitimateInterests"

    .line 44
    invoke-static {v4, v12}, Ll92;->a(Landroid/content/SharedPreferences;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    const-string v14, "IABTCF_VendorLegitimateInterests"

    .line 45
    invoke-static {v4, v14}, Ll92;->a(Landroid/content/SharedPreferences;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 46
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v14

    if-nez v14, :cond_a

    .line 47
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v14

    move-object/from16 v30, v15

    const/16 v15, 0x2f3

    if-lt v14, v15, :cond_9

    const/16 v14, 0x2f2

    .line 48
    invoke-virtual {v4, v14}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v14, 0x31

    if-ne v4, v14, :cond_9

    const/4 v4, 0x1

    goto :goto_e

    :cond_9
    :goto_d
    move/from16 v4, v27

    goto :goto_e

    :cond_a
    move-object/from16 v30, v15

    goto :goto_d

    :goto_e
    const/16 v14, 0x32

    aput-char v14, v17, v27

    .line 49
    new-instance v14, Li92;

    .line 50
    const-string v15, "CmpSdkID"

    move-object/from16 v29, v3

    const-string v3, "EnableAdvertiserConsentMode"

    move-object/from16 v23, v14

    const-string v14, "gdprApplies"

    move-object/from16 v24, v0

    const-string v0, "Version"

    move-object/from16 v32, v12

    const-string v12, "0"

    move-object/from16 v33, v12

    const-string v12, "1"

    if-nez v19, :cond_b

    sget-object v1, Lrz0;->p:Lrz0;

    move-object/from16 v30, v3

    move-object v3, v12

    move-object/from16 v31, v14

    move-object v5, v15

    move-object/from16 v2, v23

    goto/16 :goto_21

    .line 51
    :cond_b
    invoke-virtual {v13, v6}, Lrz0;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Lko1;

    .line 52
    invoke-virtual {v13, v7}, Lrz0;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v34

    check-cast v34, Lko1;

    .line 53
    invoke-virtual {v13, v8}, Lrz0;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v35

    check-cast v35, Lko1;

    .line 54
    invoke-virtual {v13, v9}, Lrz0;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v36

    check-cast v36, Lko1;

    move-object/from16 v37, v12

    .line 55
    new-instance v12, Lo7;

    move-object/from16 v38, v13

    const/4 v13, 0x4

    .line 56
    invoke-direct {v12, v13}, Lo7;-><init>(I)V

    .line 57
    const-string v13, "2"

    .line 58
    invoke-virtual {v12, v0, v13}, Lo7;->g(Ljava/lang/Object;Ljava/lang/Object;)V

    const/4 v13, 0x1

    if-eq v13, v1, :cond_c

    move-object/from16 v13, v33

    :goto_f
    move/from16 v39, v1

    goto :goto_10

    :cond_c
    move-object/from16 v13, v37

    goto :goto_f

    :goto_10
    const-string v1, "VendorConsent"

    .line 59
    invoke-virtual {v12, v1, v13}, Lo7;->g(Ljava/lang/Object;Ljava/lang/Object;)V

    const/4 v13, 0x1

    if-eq v13, v4, :cond_d

    move-object/from16 v1, v33

    :goto_11
    move/from16 v40, v4

    goto :goto_12

    :cond_d
    move-object/from16 v1, v37

    goto :goto_11

    :goto_12
    const-string v4, "VendorLegitimateInterest"

    .line 60
    invoke-virtual {v12, v4, v1}, Lo7;->g(Ljava/lang/Object;Ljava/lang/Object;)V

    if-eq v2, v13, :cond_e

    move-object/from16 v1, v33

    goto :goto_13

    :cond_e
    move-object/from16 v1, v37

    .line 61
    :goto_13
    invoke-virtual {v12, v14, v1}, Lo7;->g(Ljava/lang/Object;Ljava/lang/Object;)V

    if-eq v11, v13, :cond_f

    move-object/from16 v1, v33

    goto :goto_14

    :cond_f
    move-object/from16 v1, v37

    .line 62
    :goto_14
    invoke-virtual {v12, v3, v1}, Lo7;->g(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 63
    invoke-static/range {v18 .. v18}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    const-string v4, "PolicyVersion"

    invoke-virtual {v12, v4, v1}, Lo7;->g(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 64
    invoke-static/range {v20 .. v20}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v12, v15, v1}, Lo7;->g(Ljava/lang/Object;Ljava/lang/Object;)V

    if-eq v10, v13, :cond_10

    move-object/from16 v1, v33

    goto :goto_15

    :cond_10
    move-object/from16 v1, v37

    :goto_15
    const-string v4, "PurposeOneTreatment"

    .line 65
    invoke-virtual {v12, v4, v1}, Lo7;->g(Ljava/lang/Object;Ljava/lang/Object;)V

    const-string v1, "PublisherCC"

    .line 66
    invoke-virtual {v12, v1, v5}, Lo7;->g(Ljava/lang/Object;Ljava/lang/Object;)V

    if-eqz v19, :cond_11

    .line 67
    invoke-virtual/range {v19 .. v19}, Lko1;->a()I

    move-result v1

    goto :goto_16

    .line 68
    :cond_11
    invoke-virtual/range {v30 .. v30}, Lko1;->a()I

    move-result v1

    .line 69
    :goto_16
    const-string v4, "PublisherRestrictions1"

    .line 70
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    .line 71
    invoke-virtual {v12, v4, v1}, Lo7;->g(Ljava/lang/Object;Ljava/lang/Object;)V

    if-eqz v34, :cond_12

    .line 72
    invoke-virtual/range {v34 .. v34}, Lko1;->a()I

    move-result v1

    goto :goto_17

    .line 73
    :cond_12
    invoke-virtual/range {v30 .. v30}, Lko1;->a()I

    move-result v1

    .line 74
    :goto_17
    const-string v4, "PublisherRestrictions3"

    .line 75
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    .line 76
    invoke-virtual {v12, v4, v1}, Lo7;->g(Ljava/lang/Object;Ljava/lang/Object;)V

    if-eqz v35, :cond_13

    .line 77
    invoke-virtual/range {v35 .. v35}, Lko1;->a()I

    move-result v1

    goto :goto_18

    .line 78
    :cond_13
    invoke-virtual/range {v30 .. v30}, Lko1;->a()I

    move-result v1

    .line 79
    :goto_18
    const-string v4, "PublisherRestrictions4"

    .line 80
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    .line 81
    invoke-virtual {v12, v4, v1}, Lo7;->g(Ljava/lang/Object;Ljava/lang/Object;)V

    if-eqz v36, :cond_14

    .line 82
    invoke-virtual/range {v36 .. v36}, Lko1;->a()I

    move-result v1

    goto :goto_19

    .line 83
    :cond_14
    invoke-virtual/range {v30 .. v30}, Lko1;->a()I

    move-result v1

    .line 84
    :goto_19
    const-string v4, "PublisherRestrictions7"

    .line 85
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    .line 86
    invoke-virtual {v12, v4, v1}, Lo7;->g(Ljava/lang/Object;Ljava/lang/Object;)V

    move-object/from16 v1, v24

    move-object/from16 v4, v32

    .line 87
    invoke-static {v6, v1, v4}, Ll92;->d(Ljo1;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v42

    .line 88
    invoke-static {v7, v1, v4}, Ll92;->d(Ljo1;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v44

    .line 89
    invoke-static {v8, v1, v4}, Ll92;->d(Ljo1;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v46

    .line 90
    invoke-static {v9, v1, v4}, Ll92;->d(Ljo1;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v48

    const-string v43, "Purpose3"

    const-string v41, "Purpose1"

    .line 91
    const-string v45, "Purpose4"

    const-string v47, "Purpose7"

    filled-new-array/range {v41 .. v48}, [Ljava/lang/Object;

    move-result-object v13

    move/from16 v16, v2

    const/4 v1, 0x4

    const/4 v2, 0x0

    .line 92
    invoke-static {v1, v13, v2}, Lrz0;->a(I[Ljava/lang/Object;Lo7;)Lrz0;

    move-result-object v1

    .line 93
    invoke-virtual {v12, v1}, Lo7;->h(Lrz0;)V

    move/from16 v1, v16

    move-object/from16 v16, v4

    move-object v4, v12

    move v12, v1

    move-object v1, v2

    move-object/from16 v30, v3

    move-object/from16 v19, v7

    move v13, v10

    move-object/from16 v10, v17

    move-object/from16 v2, v23

    move-object/from16 v7, v31

    move-object/from16 v3, v37

    move/from16 v17, v39

    move/from16 v18, v40

    move-object/from16 v23, v8

    move-object/from16 v31, v14

    move-object/from16 v8, v38

    move-object v14, v5

    move-object v5, v15

    move-object/from16 v15, v24

    move-object/from16 v24, v9

    move-object/from16 v9, v22

    .line 94
    invoke-static/range {v6 .. v18}, Ll92;->b(Ljo1;Lrz0;Lrz0;Lz71;[CIIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZ)Z

    move-result v6

    move-object/from16 v20, v14

    move-object/from16 v21, v15

    move-object/from16 v32, v16

    move/from16 v22, v17

    move-object v15, v9

    move-object/from16 v16, v10

    move/from16 v17, v12

    move/from16 v18, v13

    const/4 v9, 0x1

    if-eq v9, v6, :cond_15

    move-object/from16 v42, v33

    :goto_1a
    move-object v12, v8

    move-object v13, v15

    move-object/from16 v14, v16

    move/from16 v16, v17

    move/from16 v17, v18

    move-object/from16 v10, v19

    move-object/from16 v18, v20

    move-object/from16 v19, v21

    move/from16 v21, v22

    move-object/from16 v20, v32

    move/from16 v22, v40

    move v15, v11

    move-object v11, v7

    goto :goto_1b

    :cond_15
    move-object/from16 v42, v3

    goto :goto_1a

    .line 95
    :goto_1b
    invoke-static/range {v10 .. v22}, Ll92;->b(Ljo1;Lrz0;Lrz0;Lz71;[CIIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZ)Z

    move-result v6

    move-object v7, v11

    move-object v8, v12

    move v11, v15

    move-object/from16 v32, v20

    move/from16 v40, v22

    move-object v15, v13

    move-object/from16 v20, v18

    move/from16 v22, v21

    move/from16 v18, v17

    move-object/from16 v21, v19

    move/from16 v17, v16

    move-object/from16 v16, v14

    if-eq v9, v6, :cond_16

    move-object/from16 v44, v33

    :goto_1c
    move-object v12, v7

    move-object v13, v8

    move-object v14, v15

    move-object/from16 v15, v16

    move-object/from16 v19, v20

    move-object/from16 v20, v21

    move-object/from16 v21, v32

    move/from16 v16, v11

    move-object/from16 v11, v23

    move/from16 v23, v40

    goto :goto_1d

    :cond_16
    move-object/from16 v44, v3

    goto :goto_1c

    .line 96
    :goto_1d
    invoke-static/range {v11 .. v23}, Ll92;->b(Ljo1;Lrz0;Lrz0;Lz71;[CIIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZ)Z

    move-result v6

    move-object v7, v12

    move-object v8, v13

    move/from16 v11, v16

    move-object/from16 v32, v21

    move/from16 v40, v23

    move-object/from16 v16, v15

    move-object/from16 v21, v20

    move-object v15, v14

    move-object/from16 v20, v19

    if-eq v9, v6, :cond_17

    move-object/from16 v46, v33

    :goto_1e
    move-object v13, v7

    move-object v14, v8

    move/from16 v19, v18

    move/from16 v23, v22

    move-object/from16 v12, v24

    move-object/from16 v22, v32

    move/from16 v24, v40

    move/from16 v18, v17

    move/from16 v17, v11

    goto :goto_1f

    :cond_17
    move-object/from16 v46, v3

    goto :goto_1e

    .line 97
    :goto_1f
    invoke-static/range {v12 .. v24}, Ll92;->b(Ljo1;Lrz0;Lrz0;Lz71;[CIIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZ)Z

    move-result v6

    move-object/from16 v15, v16

    if-eq v9, v6, :cond_18

    move-object/from16 v48, v33

    goto :goto_20

    :cond_18
    move-object/from16 v48, v3

    :goto_20
    new-instance v6, Ljava/lang/String;

    invoke-direct {v6, v15}, Ljava/lang/String;-><init>([C)V

    const-string v43, "AuthorizePurpose3"

    const-string v41, "AuthorizePurpose1"

    .line 98
    const-string v45, "AuthorizePurpose4"

    const-string v47, "AuthorizePurpose7"

    const-string v49, "PurposeDiagnostics"

    move-object/from16 v50, v6

    filled-new-array/range {v41 .. v50}, [Ljava/lang/Object;

    move-result-object v6

    const/4 v7, 0x5

    .line 99
    invoke-static {v7, v6, v1}, Lrz0;->a(I[Ljava/lang/Object;Lo7;)Lrz0;

    move-result-object v1

    .line 100
    invoke-virtual {v4, v1}, Lo7;->h(Lrz0;)V

    const/4 v12, 0x1

    .line 101
    invoke-virtual {v4, v12}, Lo7;->b(Z)Lrz0;

    move-result-object v1

    .line 102
    :goto_21
    invoke-direct {v2, v1}, Li92;-><init>(Ljava/util/Map;)V

    .line 103
    invoke-static/range {v29 .. v29}, Ly02;->l(Lm22;)V

    move-object/from16 v1, v29

    .line 104
    iget-object v4, v1, Lzy1;->w:Lso;

    .line 105
    const-string v6, "Tcf preferences read"

    invoke-virtual {v4, v2, v6}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 106
    invoke-virtual/range {v25 .. v25}, Let;->l()V

    .line 107
    invoke-virtual/range {v25 .. v25}, Lvz1;->p()Landroid/content/SharedPreferences;

    move-result-object v4

    const-string v6, "stored_tcf_param"

    const-string v7, ""

    invoke-interface {v4, v6, v7}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    new-instance v8, Ljava/util/HashMap;

    .line 108
    invoke-direct {v8}, Ljava/util/HashMap;-><init>()V

    .line 109
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_19

    new-instance v4, Li92;

    .line 110
    invoke-direct {v4, v8}, Li92;-><init>(Ljava/util/Map;)V

    const/4 v13, 0x2

    goto :goto_23

    .line 111
    :cond_19
    const-string v9, ";"

    .line 112
    invoke-virtual {v4, v9}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 113
    array-length v9, v4

    move/from16 v10, v27

    :goto_22
    if-ge v10, v9, :cond_1b

    aget-object v11, v4, v10

    const-string v12, "="

    .line 114
    invoke-virtual {v11, v12}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v11

    .line 115
    array-length v12, v11

    const/4 v13, 0x2

    if-lt v12, v13, :cond_1a

    sget-object v12, Ll92;->a:Lmz0;

    aget-object v14, v11, v27

    invoke-virtual {v12, v14}, Lzd0;->contains(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_1a

    .line 116
    aget-object v12, v11, v27

    const/16 v28, 0x1

    aget-object v11, v11, v28

    invoke-virtual {v8, v12, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1a
    add-int/lit8 v10, v10, 0x1

    goto :goto_22

    :cond_1b
    const/4 v13, 0x2

    new-instance v4, Li92;

    .line 117
    invoke-direct {v4, v8}, Li92;-><init>(Ljava/util/Map;)V

    .line 118
    :goto_23
    invoke-virtual/range {v25 .. v25}, Let;->l()V

    .line 119
    invoke-virtual/range {v25 .. v25}, Lvz1;->p()Landroid/content/SharedPreferences;

    move-result-object v8

    invoke-interface {v8, v6, v7}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 120
    invoke-virtual {v2}, Li92;->a()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_28

    .line 121
    invoke-virtual/range {v25 .. v25}, Lvz1;->p()Landroid/content/SharedPreferences;

    move-result-object v7

    invoke-interface {v7}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    .line 122
    invoke-interface {v7, v6, v8}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 123
    invoke-interface {v7}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 124
    invoke-virtual {v2}, Li92;->b()Landroid/os/Bundle;

    move-result-object v6

    .line 125
    invoke-static {v1}, Ly02;->l(Lm22;)V

    .line 126
    iget-object v1, v1, Lzy1;->w:Lso;

    .line 127
    const-string v7, "Consent generated from Tcf"

    invoke-virtual {v1, v6, v7}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object v1, Landroid/os/Bundle;->EMPTY:Landroid/os/Bundle;

    if-eq v6, v1, :cond_1c

    move-object/from16 v1, v26

    .line 128
    iget-object v1, v1, Ly02;->t:Lmz;

    .line 129
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 130
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    const/16 v1, -0x1e

    move-object/from16 v9, p0

    .line 131
    invoke-virtual {v9, v6, v1, v7, v8}, Lc52;->F(Landroid/os/Bundle;IJ)V

    goto :goto_24

    :cond_1c
    move-object/from16 v9, p0

    :goto_24
    new-instance v1, Landroid/os/Bundle;

    .line 132
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 133
    iget-object v6, v4, Li92;->a:Ljava/util/HashMap;

    invoke-virtual {v6}, Ljava/util/HashMap;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_1d

    .line 134
    invoke-virtual {v6, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-nez v0, :cond_1d

    move-object v12, v3

    goto :goto_25

    :cond_1d
    move-object/from16 v12, v33

    .line 135
    :goto_25
    invoke-virtual {v2}, Li92;->b()Landroid/os/Bundle;

    move-result-object v0

    invoke-virtual {v4}, Li92;->b()Landroid/os/Bundle;

    move-result-object v4

    .line 136
    invoke-virtual {v0}, Landroid/os/BaseBundle;->size()I

    move-result v6

    invoke-virtual {v4}, Landroid/os/BaseBundle;->size()I

    move-result v7

    if-eq v6, v7, :cond_1e

    goto :goto_26

    .line 137
    :cond_1e
    const-string v6, "ad_storage"

    invoke-virtual {v0, v6}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v6}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 138
    invoke-static {v7, v6}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_1f

    goto :goto_26

    .line 139
    :cond_1f
    const-string v6, "ad_personalization"

    invoke-virtual {v0, v6}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 140
    invoke-virtual {v4, v6}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 141
    invoke-static {v7, v6}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_20

    goto :goto_26

    .line 142
    :cond_20
    const-string v6, "ad_user_data"

    invoke-virtual {v0, v6}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 143
    invoke-virtual {v4, v6}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 144
    invoke-static {v0, v4}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_21

    :goto_26
    move-object v0, v3

    goto :goto_27

    :cond_21
    move-object/from16 v0, v33

    .line 145
    :goto_27
    invoke-virtual {v12, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 146
    const-string v4, "_tcfm"

    .line 147
    invoke-virtual {v1, v4, v0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 148
    const-string v0, "PurposeDiagnostics"

    iget-object v4, v2, Li92;->a:Ljava/util/HashMap;

    invoke-virtual {v4, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 149
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_22

    const-string v0, "200000"

    .line 150
    :cond_22
    const-string v6, "_tcfd2"

    .line 151
    invoke-virtual {v1, v6, v0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 152
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 153
    :try_start_5
    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 154
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_23

    .line 155
    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5
    :try_end_5
    .catch Ljava/lang/NumberFormatException; {:try_start_5 .. :try_end_5} :catch_5

    goto :goto_28

    :catch_5
    :cond_23
    const/4 v5, -0x1

    :goto_28
    const/16 v6, 0x3f

    const-string v7, "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ-_"

    if-ltz v5, :cond_24

    const/16 v8, 0xfff

    if-gt v5, v8, :cond_24

    shr-int/lit8 v8, v5, 0x6

    .line 156
    invoke-virtual {v7, v8}, Ljava/lang/String;->charAt(I)C

    move-result v8

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    and-int/2addr v5, v6

    .line 157
    invoke-virtual {v7, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_29

    .line 158
    :cond_24
    const-string v5, "00"

    .line 159
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 160
    :goto_29
    invoke-virtual {v2}, Li92;->c()I

    move-result v2

    if-ltz v2, :cond_25

    if-gt v2, v6, :cond_25

    .line 161
    invoke-virtual {v7, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :goto_2a
    move-object/from16 v2, v31

    goto :goto_2b

    :cond_25
    move-object/from16 v2, v33

    .line 162
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2a

    .line 163
    :goto_2b
    invoke-virtual {v4, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    const/4 v12, 0x1

    if-eq v12, v2, :cond_26

    :goto_2c
    move-object/from16 v2, v30

    goto :goto_2d

    :cond_26
    move/from16 v27, v13

    goto :goto_2c

    .line 164
    :goto_2d
    invoke-virtual {v4, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    or-int/lit8 v3, v27, 0x4

    if-eqz v2, :cond_27

    or-int/lit8 v3, v27, 0xc

    .line 165
    :cond_27
    invoke-virtual {v7, v3}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 166
    const-string v2, "_tcfd"

    invoke-virtual {v1, v2, v0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "auto"

    const-string v2, "_tcf"

    .line 167
    invoke-virtual {v9, v0, v2, v1}, Lc52;->s(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)V

    :cond_28
    return-void
.end method

.method public final s(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 10

    .line 1
    invoke-virtual {p0}, Lgx1;->l()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Let;->j:Ljava/lang/Object;

    .line 5
    .line 6
    check-cast v0, Ly02;

    .line 7
    .line 8
    iget-object v1, v0, Ly02;->t:Lmz;

    .line 9
    .line 10
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 14
    .line 15
    .line 16
    move-result-wide v3

    .line 17
    iget-object v1, v0, Ly02;->m:Lmt1;

    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    sget-object v5, Lxx1;->e1:Lwx1;

    .line 21
    .line 22
    invoke-virtual {v1, v2, v5}, Lmt1;->w(Ljava/lang/String;Lwx1;)Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-eqz v1, :cond_0

    .line 27
    .line 28
    iget-object v0, v0, Ly02;->t:Lmz;

    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 31
    .line 32
    .line 33
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 34
    .line 35
    .line 36
    move-result-wide v0

    .line 37
    :goto_0
    move-object v2, p0

    .line 38
    move-object v8, p1

    .line 39
    move-object v9, p2

    .line 40
    move-object v7, p3

    .line 41
    move-wide v5, v0

    .line 42
    goto :goto_1

    .line 43
    :cond_0
    const-wide/16 v0, 0x0

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :goto_1
    invoke-virtual/range {v2 .. v9}, Lc52;->t(JJLandroid/os/Bundle;Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public final t(JJLandroid/os/Bundle;Ljava/lang/String;Ljava/lang/String;)V
    .locals 11

    .line 1
    invoke-virtual {p0}, Lgx1;->l()V

    .line 2
    .line 3
    .line 4
    iget-object v1, p0, Lc52;->m:Lka2;

    .line 5
    .line 6
    const/4 v2, 0x1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-static/range {p7 .. p7}, Lcb2;->P(Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_1

    .line 14
    .line 15
    :cond_0
    :goto_0
    move v9, v2

    .line 16
    goto :goto_1

    .line 17
    :cond_1
    const/4 v2, 0x0

    .line 18
    goto :goto_0

    .line 19
    :goto_1
    const/4 v8, 0x1

    .line 20
    const/4 v10, 0x1

    .line 21
    move-object v0, p0

    .line 22
    move-wide v3, p1

    .line 23
    move-wide v5, p3

    .line 24
    move-object/from16 v7, p5

    .line 25
    .line 26
    move-object/from16 v1, p6

    .line 27
    .line 28
    move-object/from16 v2, p7

    .line 29
    .line 30
    invoke-virtual/range {v0 .. v10}, Lc52;->u(Ljava/lang/String;Ljava/lang/String;JJLandroid/os/Bundle;ZZZ)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final u(Ljava/lang/String;Ljava/lang/String;JJLandroid/os/Bundle;ZZZ)V
    .locals 28

    move-object/from16 v1, p0

    move-object/from16 v7, p1

    move-object/from16 v8, p2

    move-object/from16 v9, p7

    move/from16 v10, p10

    .line 1
    invoke-static {v7}, Lbh;->e(Ljava/lang/String;)V

    .line 2
    invoke-static {v9}, Lbh;->h(Ljava/lang/Object;)V

    .line 3
    invoke-virtual {v1}, Lgx1;->l()V

    .line 4
    invoke-virtual {v1}, Lay1;->m()V

    iget-object v0, v1, Let;->j:Ljava/lang/Object;

    move-object v11, v0

    check-cast v11, Ly02;

    .line 5
    invoke-virtual {v11}, Ly02;->e()Z

    move-result v0

    iget-object v12, v11, Ly02;->q:Lh92;

    iget-object v13, v11, Ly02;->m:Lmt1;

    iget-object v2, v11, Ly02;->j:Landroid/content/Context;

    iget-object v14, v11, Ly02;->r:Lcb2;

    iget-object v15, v11, Ly02;->o:Lzy1;

    if-eqz v0, :cond_2b

    .line 6
    invoke-virtual {v11}, Ly02;->p()Lky1;

    move-result-object v0

    .line 7
    iget-object v0, v0, Lky1;->t:Ljava/util/List;

    if-eqz v0, :cond_0

    .line 8
    invoke-interface {v0, v8}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 9
    invoke-static {v15}, Ly02;->l(Lm22;)V

    .line 10
    iget-object v0, v15, Lzy1;->v:Lso;

    .line 11
    const-string v1, "Dropping non-safelisted event. event name, origin"

    invoke-virtual {v0, v1, v8, v7}, Lso;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void

    :cond_0
    iget-boolean v0, v1, Lc52;->o:Z

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-nez v0, :cond_2

    iput-boolean v4, v1, Lc52;->o:Z

    .line 12
    :try_start_0
    iget-boolean v0, v11, Ly02;->k:Z
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_1

    .line 13
    const-string v5, "com.google.android.gms.tagmanager.TagManagerService"

    if-nez v0, :cond_1

    .line 14
    :try_start_1
    invoke-virtual {v2}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-static {v5, v4, v0}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v0

    goto :goto_0

    .line 15
    :cond_1
    invoke-static {v5}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0
    :try_end_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    .line 16
    :goto_0
    :try_start_2
    const-string v5, "initialize"

    const-class v6, Landroid/content/Context;

    filled-new-array {v6}, [Ljava/lang/Class;

    move-result-object v6

    .line 17
    invoke-virtual {v0, v5, v6}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 18
    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    .line 19
    invoke-virtual {v0, v3, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    .line 20
    :try_start_3
    invoke-static {v15}, Ly02;->l(Lm22;)V

    .line 21
    iget-object v2, v15, Lzy1;->r:Lso;

    .line 22
    const-string v5, "Failed to invoke Tag Manager\'s initialize() method"

    invoke-virtual {v2, v0, v5}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/ClassNotFoundException; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_1

    .line 23
    :catch_1
    invoke-static {v15}, Ly02;->l(Lm22;)V

    .line 24
    iget-object v0, v15, Lzy1;->u:Lso;

    .line 25
    const-string v2, "Tag Manager is not found and thus will not be used"

    invoke-virtual {v0, v2}, Lso;->b(Ljava/lang/String;)V

    .line 26
    :cond_2
    :goto_1
    iget-object v0, v11, Ly02;->s:Lry1;

    iget-object v2, v11, Ly02;->n:Lvz1;

    iget-object v5, v11, Ly02;->t:Lmz;

    .line 27
    sget-object v6, Lxx1;->Z0:Lwx1;

    .line 28
    invoke-virtual {v13, v3, v6}, Lmt1;->w(Ljava/lang/String;Lwx1;)Z

    move-result v6

    if-nez v6, :cond_3

    const-string v6, "_cmp"

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 29
    const-string v6, "gclid"

    invoke-virtual {v9, v6}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    move-result v16

    if-eqz v16, :cond_3

    .line 30
    invoke-virtual {v9, v6}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 31
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-object/from16 v16, v2

    move-object/from16 v17, v3

    .line 32
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    move-object/from16 v18, v5

    .line 33
    const-string v5, "auto"

    move/from16 v19, v4

    move-object v4, v6

    const-string v6, "_lgclid"

    move-object/from16 v20, v13

    move-object/from16 v13, v17

    .line 34
    invoke-virtual/range {v1 .. v6}, Lc52;->w(JLjava/lang/Object;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    :cond_3
    move-object/from16 v16, v2

    move-object/from16 v18, v5

    move-object/from16 v20, v13

    move-object v13, v3

    :goto_2
    const/4 v2, 0x0

    if-eqz p8, :cond_4

    .line 35
    sget-object v3, Lcb2;->s:[Ljava/lang/String;

    aget-object v3, v3, v2

    .line 36
    invoke-virtual {v3, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    .line 37
    invoke-static {v14}, Ly02;->j(Let;)V

    .line 38
    invoke-static/range {v16 .. v16}, Ly02;->j(Let;)V

    move-object/from16 v3, v16

    .line 39
    iget-object v4, v3, Lvz1;->H:Ler0;

    invoke-virtual {v4}, Ler0;->t()Landroid/os/Bundle;

    move-result-object v4

    invoke-virtual {v14, v9, v4}, Lcb2;->y(Landroid/os/Bundle;Landroid/os/Bundle;)V

    goto :goto_3

    :cond_4
    move-object/from16 v3, v16

    :goto_3
    iget-object v4, v1, Lc52;->E:Lmd1;

    if-nez v10, :cond_b

    .line 40
    const-string v6, "_iap"

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_b

    .line 41
    invoke-static {v14}, Ly02;->j(Let;)V

    .line 42
    const-string v6, "event"

    invoke-virtual {v14, v6, v8}, Lcb2;->o0(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v16

    const/16 v17, 0x2

    if-nez v16, :cond_5

    move-object/from16 v22, v4

    :goto_4
    const/16 v2, 0x28

    goto :goto_6

    .line 43
    :cond_5
    iget-object v2, v14, Let;->j:Ljava/lang/Object;

    check-cast v2, Ly02;

    .line 44
    sget-object v5, Lbv;->c:[Ljava/lang/String;

    .line 45
    iget-object v2, v2, Ly02;->m:Lmt1;

    move-object/from16 v22, v4

    .line 46
    sget-object v4, Lxx1;->f1:Lwx1;

    .line 47
    invoke-virtual {v2, v13, v4}, Lmt1;->w(Ljava/lang/String;Lwx1;)Z

    move-result v2

    if-eqz v2, :cond_6

    sget-object v2, Lbv;->e:[Ljava/lang/String;

    goto :goto_5

    .line 48
    :cond_6
    sget-object v2, Lbv;->d:[Ljava/lang/String;

    .line 49
    :goto_5
    invoke-virtual {v14, v6, v5, v2, v8}, Lcb2;->q0(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_7

    const/16 v17, 0xd

    goto :goto_4

    :cond_7
    const/16 v2, 0x28

    .line 50
    invoke-virtual {v14, v6, v8, v2}, Lcb2;->r0(Ljava/lang/String;Ljava/lang/String;I)Z

    move-result v4

    if-nez v4, :cond_8

    goto :goto_6

    :cond_8
    const/16 v17, 0x0

    :goto_6
    if-eqz v17, :cond_a

    .line 51
    invoke-static {v15}, Ly02;->l(Lm22;)V

    .line 52
    iget-object v1, v15, Lzy1;->q:Lso;

    .line 53
    invoke-virtual {v0, v8}, Lry1;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v3, "Invalid public event name. Event will not be logged (FE)"

    .line 54
    invoke-virtual {v1, v0, v3}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 55
    invoke-static {v14}, Ly02;->j(Let;)V

    const/4 v4, 0x1

    .line 56
    invoke-static {v2, v8, v4}, Lcb2;->s(ILjava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    if-eqz v8, :cond_9

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v2

    goto :goto_7

    :cond_9
    const/4 v2, 0x0

    :goto_7
    const/4 v1, 0x0

    .line 57
    const-string v3, "_ev"

    move-object/from16 p4, v0

    move-object/from16 p1, v1

    move/from16 p5, v2

    move-object/from16 p3, v3

    move/from16 p2, v17

    move-object/from16 p0, v22

    .line 58
    invoke-static/range {p0 .. p5}, Lcb2;->D(Lbb2;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;I)V

    return-void

    :cond_a
    :goto_8
    const/4 v4, 0x1

    goto :goto_9

    :cond_b
    move-object/from16 v22, v4

    goto :goto_8

    .line 59
    :goto_9
    iget-object v2, v11, Ly02;->u:Lz52;

    .line 60
    invoke-static {v2}, Ly02;->k(Lay1;)V

    const/4 v5, 0x0

    .line 61
    invoke-virtual {v2, v5}, Lz52;->p(Z)Lm52;

    move-result-object v6

    const-string v5, "_sc"

    if-eqz v6, :cond_c

    .line 62
    invoke-virtual {v9, v5}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    move-result v17

    if-nez v17, :cond_c

    iput-boolean v4, v6, Lm52;->d:Z

    :cond_c
    if-eqz p8, :cond_d

    if-nez v10, :cond_d

    move v13, v4

    goto :goto_a

    :cond_d
    const/4 v13, 0x0

    .line 63
    :goto_a
    invoke-static {v6, v9, v13}, Lcb2;->h0(Lm52;Landroid/os/Bundle;Z)V

    const-string v6, "am"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    .line 64
    invoke-static {v8}, Lcb2;->P(Ljava/lang/String;)Z

    move-result v13

    if-eqz p8, :cond_f

    iget-object v4, v1, Lc52;->m:Lka2;

    if-eqz v4, :cond_f

    if-nez v13, :cond_f

    if-eqz v6, :cond_e

    const/4 v13, 0x1

    goto :goto_b

    .line 65
    :cond_e
    invoke-static {v15}, Ly02;->l(Lm22;)V

    .line 66
    iget-object v2, v15, Lzy1;->v:Lso;

    .line 67
    invoke-virtual {v0, v8}, Lry1;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 68
    invoke-virtual {v0, v9}, Lry1;->e(Landroid/os/Bundle;)Ljava/lang/String;

    move-result-object v0

    const-string v4, "Passing event to registered event handler (FE)"

    .line 69
    invoke-virtual {v2, v4, v3, v0}, Lso;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object v0, v1, Lc52;->m:Lka2;

    .line 70
    invoke-static {v0}, Lbh;->h(Ljava/lang/Object;)V

    iget-object v6, v1, Lc52;->m:Lka2;

    .line 71
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 72
    :try_start_4
    iget-object v0, v6, Lka2;->a:Ljava/lang/Object;

    check-cast v0, Lzv1;

    move-wide/from16 v4, p3

    move-object v1, v7

    move-object v2, v8

    move-object v3, v9

    invoke-interface/range {v0 .. v5}, Lzv1;->h(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;J)V
    :try_end_4
    .catch Landroid/os/RemoteException; {:try_start_4 .. :try_end_4} :catch_2

    goto/16 :goto_1d

    :catch_2
    move-exception v0

    iget-object v1, v6, Lka2;->b:Ljava/lang/Object;

    check-cast v1, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;

    iget-object v1, v1, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b:Ly02;

    if-eqz v1, :cond_2a

    .line 73
    iget-object v1, v1, Ly02;->o:Lzy1;

    invoke-static {v1}, Ly02;->l(Lm22;)V

    .line 74
    iget-object v1, v1, Lzy1;->r:Lso;

    .line 75
    const-string v2, "Event interceptor threw exception"

    invoke-virtual {v1, v0, v2}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    goto/16 :goto_1d

    :cond_f
    move v13, v6

    .line 76
    :goto_b
    invoke-virtual {v11}, Ly02;->h()Z

    move-result v4

    if-nez v4, :cond_10

    goto/16 :goto_1d

    .line 77
    :cond_10
    invoke-static {v14}, Ly02;->j(Let;)V

    iget-object v4, v14, Let;->j:Ljava/lang/Object;

    check-cast v4, Ly02;

    .line 78
    invoke-virtual {v14, v8}, Lcb2;->s0(Ljava/lang/String;)I

    move-result v6

    if-eqz v6, :cond_12

    .line 79
    invoke-static {v15}, Ly02;->l(Lm22;)V

    .line 80
    iget-object v1, v15, Lzy1;->q:Lso;

    .line 81
    invoke-virtual {v0, v8}, Lry1;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "Invalid event name. Event will not be logged (FE)"

    .line 82
    invoke-virtual {v1, v0, v2}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v1, 0x1

    const/16 v2, 0x28

    .line 83
    invoke-static {v2, v8, v1}, Lcb2;->s(ILjava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    if-eqz v8, :cond_11

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v2

    goto :goto_c

    :cond_11
    const/4 v2, 0x0

    .line 84
    :goto_c
    invoke-static {v14}, Ly02;->j(Let;)V

    .line 85
    const-string v1, "_ev"

    const/4 v3, 0x0

    move-object/from16 p4, v0

    move-object/from16 p3, v1

    move/from16 p5, v2

    move-object/from16 p1, v3

    move/from16 p2, v6

    move-object/from16 p0, v22

    .line 86
    invoke-static/range {p0 .. p5}, Lcb2;->D(Lbb2;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;I)V

    return-void

    :cond_12
    const/16 v21, 0x1

    const-string v0, "_sn"

    const-string v6, "_si"

    move-object/from16 v19, v11

    const-string v11, "_o"

    filled-new-array {v11, v0, v5, v6}, [Ljava/lang/String;

    move-result-object v0

    .line 87
    invoke-static {v0}, Lju1;->q([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    .line 88
    invoke-virtual {v14, v8, v9, v0, v10}, Lcb2;->v(Ljava/lang/String;Landroid/os/Bundle;Ljava/util/List;Z)Landroid/os/Bundle;

    move-result-object v0

    .line 89
    invoke-static {v0}, Lbh;->h(Ljava/lang/Object;)V

    .line 90
    invoke-static {v2}, Ly02;->k(Lay1;)V

    const/4 v5, 0x0

    .line 91
    invoke-virtual {v2, v5}, Lz52;->p(Z)Lm52;

    move-result-object v6

    const-string v9, "_ae"

    move-object/from16 p8, v11

    if-eqz v6, :cond_13

    invoke-virtual {v9, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_13

    .line 92
    invoke-static {v12}, Ly02;->k(Lay1;)V

    .line 93
    iget-object v6, v12, Lh92;->o:Lf92;

    iget-object v5, v6, Lf92;->d:Lh92;

    iget-object v5, v5, Let;->j:Ljava/lang/Object;

    check-cast v5, Ly02;

    .line 94
    iget-object v5, v5, Ly02;->t:Lmz;

    .line 95
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-wide/16 v22, 0x0

    .line 96
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v10

    move-object v5, v2

    .line 97
    iget-wide v1, v6, Lf92;->b:J

    sub-long v1, v10, v1

    iput-wide v10, v6, Lf92;->b:J

    cmp-long v6, v1, v22

    if-lez v6, :cond_14

    .line 98
    invoke-virtual {v14, v0, v1, v2}, Lcb2;->X(Landroid/os/Bundle;J)V

    goto :goto_d

    :cond_13
    move-object v5, v2

    const-wide/16 v22, 0x0

    :cond_14
    :goto_d
    const-string v1, "auto"

    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const-string v2, "_ffr"

    if-nez v1, :cond_19

    const-string v1, "_ssr"

    invoke-virtual {v1, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_19

    .line 99
    invoke-virtual {v0, v2}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 100
    sget v2, Lca1;->a:I

    if-eqz v1, :cond_16

    .line 101
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_15

    goto :goto_e

    :cond_15
    if-eqz v1, :cond_17

    .line 102
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    goto :goto_f

    :cond_16
    :goto_e
    const/4 v1, 0x0

    .line 103
    :cond_17
    :goto_f
    iget-object v2, v4, Ly02;->n:Lvz1;

    .line 104
    invoke-static {v2}, Ly02;->j(Let;)V

    .line 105
    iget-object v2, v2, Lvz1;->E:Lvx;

    invoke-virtual {v2}, Lvx;->e()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_18

    .line 106
    iget-object v2, v4, Ly02;->n:Lvz1;

    invoke-static {v2}, Ly02;->j(Let;)V

    .line 107
    iget-object v2, v2, Lvz1;->E:Lvx;

    invoke-virtual {v2, v1}, Lvx;->f(Ljava/lang/String;)V

    goto :goto_10

    .line 108
    :cond_18
    iget-object v0, v4, Ly02;->o:Lzy1;

    invoke-static {v0}, Ly02;->l(Lm22;)V

    .line 109
    iget-object v0, v0, Lzy1;->v:Lso;

    .line 110
    const-string v1, "Not logging duplicate session_start_with_rollout event"

    invoke-virtual {v0, v1}, Lso;->b(Ljava/lang/String;)V

    return-void

    .line 111
    :cond_19
    invoke-virtual {v9, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1a

    .line 112
    iget-object v1, v4, Ly02;->n:Lvz1;

    .line 113
    invoke-static {v1}, Ly02;->j(Let;)V

    .line 114
    iget-object v1, v1, Lvz1;->E:Lvx;

    invoke-virtual {v1}, Lvx;->e()Ljava/lang/String;

    move-result-object v1

    .line 115
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_1a

    .line 116
    invoke-virtual {v0, v2, v1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 117
    :cond_1a
    :goto_10
    new-instance v10, Ljava/util/ArrayList;

    .line 118
    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 119
    invoke-virtual {v10, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 120
    sget-object v1, Lxx1;->S0:Lwx1;

    move-object/from16 v2, v20

    const/4 v11, 0x0

    .line 121
    invoke-virtual {v2, v11, v1}, Lmt1;->w(Ljava/lang/String;Lwx1;)Z

    move-result v1

    if-eqz v1, :cond_1b

    .line 122
    invoke-static {v12}, Ly02;->k(Lay1;)V

    .line 123
    invoke-virtual {v12}, Lgx1;->l()V

    iget-boolean v1, v12, Lh92;->m:Z

    goto :goto_11

    .line 124
    :cond_1b
    invoke-static {v3}, Ly02;->j(Let;)V

    .line 125
    iget-object v1, v3, Lvz1;->B:Loz1;

    invoke-virtual {v1}, Loz1;->a()Z

    move-result v1

    .line 126
    :goto_11
    invoke-static {v3}, Ly02;->j(Let;)V

    .line 127
    iget-object v2, v3, Lvz1;->y:Lrz1;

    invoke-virtual {v2}, Lrz1;->a()J

    move-result-wide v24

    cmp-long v2, v24, v22

    if-lez v2, :cond_1d

    move-object/from16 v17, v12

    move-wide/from16 v11, p3

    .line 128
    invoke-virtual {v3, v11, v12}, Lvz1;->u(J)Z

    move-result v2

    if-eqz v2, :cond_1c

    if-eqz v1, :cond_1c

    .line 129
    invoke-static {v15}, Ly02;->l(Lm22;)V

    .line 130
    iget-object v1, v15, Lzy1;->w:Lso;

    .line 131
    const-string v2, "Current session is expired, remove the session number, ID, and engagement time"

    .line 132
    invoke-virtual {v1, v2}, Lso;->b(Ljava/lang/String;)V

    .line 133
    invoke-virtual/range {v18 .. v18}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-object v1, v3

    .line 134
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 135
    const-string v6, "_sid"

    const/4 v4, 0x0

    move-object/from16 v24, v5

    .line 136
    const-string v5, "auto"

    move/from16 v8, v21

    move/from16 v21, v13

    move v13, v8

    move-object v8, v1

    const/16 v16, 0x0

    move-object/from16 v1, p0

    invoke-virtual/range {v1 .. v6}, Lc52;->w(JLjava/lang/Object;Ljava/lang/String;Ljava/lang/String;)V

    .line 137
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 138
    const-string v6, "_sno"

    .line 139
    const-string v5, "auto"

    invoke-virtual/range {v1 .. v6}, Lc52;->w(JLjava/lang/Object;Ljava/lang/String;Ljava/lang/String;)V

    .line 140
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 141
    const-string v6, "_se"

    .line 142
    const-string v5, "auto"

    invoke-virtual/range {v1 .. v6}, Lc52;->w(JLjava/lang/Object;Ljava/lang/String;Ljava/lang/String;)V

    .line 143
    iget-object v1, v8, Lvz1;->z:Lrz1;

    move-wide/from16 v2, v22

    invoke-virtual {v1, v2, v3}, Lrz1;->b(J)V

    goto :goto_12

    :cond_1c
    move/from16 v2, v21

    move/from16 v21, v13

    move v13, v2

    move-object/from16 v24, v5

    move-wide/from16 v2, v22

    const/16 v16, 0x0

    goto :goto_12

    :cond_1d
    move/from16 v2, v21

    move/from16 v21, v13

    move v13, v2

    move-object/from16 v24, v5

    move-object/from16 v17, v12

    move-wide/from16 v2, v22

    const/16 v16, 0x0

    move-wide/from16 v11, p3

    :goto_12
    const-string v1, "extend_session"

    .line 144
    invoke-virtual {v0, v1, v2, v3}, Landroid/os/BaseBundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v1

    const-wide/16 v3, 0x1

    cmp-long v1, v1, v3

    if-nez v1, :cond_1e

    .line 145
    invoke-static {v15}, Ly02;->l(Lm22;)V

    .line 146
    iget-object v1, v15, Lzy1;->w:Lso;

    .line 147
    const-string v2, "EXTEND_SESSION param attached: initiate a new session or extend the current active session"

    .line 148
    invoke-virtual {v1, v2}, Lso;->b(Ljava/lang/String;)V

    .line 149
    invoke-static/range {v17 .. v17}, Ly02;->k(Lay1;)V

    move-object/from16 v8, v17

    .line 150
    iget-object v1, v8, Lh92;->n:Lny0;

    move-wide/from16 v2, p5

    .line 151
    invoke-virtual {v1, v11, v12, v2, v3}, Lny0;->x(JJ)V

    goto :goto_13

    :cond_1e
    move-wide/from16 v2, p5

    move-object/from16 v8, v17

    :goto_13
    new-instance v1, Ljava/util/ArrayList;

    .line 152
    invoke-virtual {v0}, Landroid/os/BaseBundle;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-direct {v1, v4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 153
    invoke-static {v1}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v4

    move/from16 v5, v16

    :goto_14
    if-ge v5, v4, :cond_24

    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    .line 154
    check-cast v6, Ljava/lang/String;

    if-eqz v6, :cond_22

    .line 155
    invoke-static {v14}, Ly02;->j(Let;)V

    .line 156
    invoke-virtual {v0, v6}, Landroid/os/BaseBundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v15

    move-object/from16 p7, v1

    .line 157
    instance-of v1, v15, Landroid/os/Bundle;

    if-eqz v1, :cond_1f

    new-array v1, v13, [Landroid/os/Bundle;

    .line 158
    check-cast v15, Landroid/os/Bundle;

    aput-object v15, v1, v16

    goto :goto_15

    .line 159
    :cond_1f
    instance-of v1, v15, [Landroid/os/Parcelable;

    if-eqz v1, :cond_20

    .line 160
    check-cast v15, [Landroid/os/Parcelable;

    array-length v1, v15

    const-class v13, [Landroid/os/Bundle;

    .line 161
    invoke-static {v15, v1, v13}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;ILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Landroid/os/Bundle;

    goto :goto_15

    .line 162
    :cond_20
    instance-of v1, v15, Ljava/util/ArrayList;

    if-eqz v1, :cond_21

    .line 163
    check-cast v15, Ljava/util/ArrayList;

    .line 164
    invoke-virtual {v15}, Ljava/util/ArrayList;->size()I

    move-result v1

    new-array v1, v1, [Landroid/os/Bundle;

    invoke-virtual {v15, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Landroid/os/Bundle;

    goto :goto_15

    :cond_21
    const/4 v1, 0x0

    :goto_15
    if-eqz v1, :cond_23

    .line 165
    invoke-virtual {v0, v6, v1}, Landroid/os/Bundle;->putParcelableArray(Ljava/lang/String;[Landroid/os/Parcelable;)V

    goto :goto_16

    :cond_22
    move-object/from16 p7, v1

    :cond_23
    :goto_16
    add-int/lit8 v5, v5, 0x1

    move-object/from16 v1, p7

    const/4 v13, 0x1

    goto :goto_14

    :cond_24
    move/from16 v13, v16

    .line 166
    :goto_17
    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v13, v0, :cond_29

    .line 167
    invoke-virtual {v10, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Bundle;

    if-eqz v13, :cond_25

    const-string v1, "_ep"

    :goto_18
    move-object/from16 v15, p8

    goto :goto_19

    :cond_25
    move-object/from16 v1, p2

    goto :goto_18

    .line 168
    :goto_19
    invoke-virtual {v0, v15, v7}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p9, :cond_26

    .line 169
    invoke-virtual {v14, v0}, Lcb2;->R(Landroid/os/Bundle;)Landroid/os/Bundle;

    move-result-object v0

    .line 170
    :cond_26
    new-instance v4, Ltu1;

    new-instance v2, Lsu1;

    invoke-direct {v2, v0}, Lsu1;-><init>(Landroid/os/Bundle;)V

    move-wide/from16 v26, v11

    move-object v12, v0

    move-object v0, v4

    move-wide/from16 v4, v26

    move-object/from16 v11, p0

    move-object v3, v7

    move-wide/from16 v6, p5

    invoke-direct/range {v0 .. v7}, Ltu1;-><init>(Ljava/lang/String;Lsu1;Ljava/lang/String;JJ)V

    .line 171
    invoke-virtual/range {v19 .. v19}, Ly02;->n()Li82;

    move-result-object v1

    .line 172
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 173
    invoke-virtual {v1}, Lgx1;->l()V

    .line 174
    invoke-virtual {v1}, Lay1;->m()V

    .line 175
    invoke-virtual {v1}, Li82;->x()V

    iget-object v2, v1, Let;->j:Ljava/lang/Object;

    check-cast v2, Ly02;

    .line 176
    invoke-virtual {v2}, Ly02;->m()Lpy1;

    move-result-object v2

    .line 177
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 178
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v3

    move/from16 v5, v16

    .line 179
    invoke-static {v0, v3, v5}, Lom1;->b(Ltu1;Landroid/os/Parcel;I)V

    .line 180
    invoke-virtual {v3}, Landroid/os/Parcel;->marshall()[B

    move-result-object v4

    .line 181
    invoke-virtual {v3}, Landroid/os/Parcel;->recycle()V

    .line 182
    array-length v3, v4

    const/high16 v5, 0x20000

    if-le v3, v5, :cond_27

    iget-object v2, v2, Let;->j:Ljava/lang/Object;

    check-cast v2, Ly02;

    .line 183
    iget-object v2, v2, Ly02;->o:Lzy1;

    .line 184
    invoke-static {v2}, Ly02;->l(Lm22;)V

    .line 185
    iget-object v2, v2, Lzy1;->p:Lso;

    .line 186
    const-string v3, "Event is too long for local database. Sending event directly to service"

    .line 187
    invoke-virtual {v2, v3}, Lso;->b(Ljava/lang/String;)V

    const/4 v2, 0x0

    :goto_1a
    const/4 v4, 0x1

    goto :goto_1b

    :cond_27
    const/4 v5, 0x0

    .line 188
    invoke-virtual {v2, v5, v4}, Lpy1;->s(I[B)Z

    move-result v2

    goto :goto_1a

    .line 189
    :goto_1b
    invoke-virtual {v1, v4}, Li82;->B(Z)Lbc2;

    move-result-object v3

    new-instance v4, Lc72;

    .line 190
    invoke-direct {v4, v1, v3, v2, v0}, Lc72;-><init>(Li82;Lbc2;ZLtu1;)V

    invoke-virtual {v1, v4}, Li82;->z(Ljava/lang/Runnable;)V

    if-nez v21, :cond_28

    .line 191
    iget-object v0, v11, Lc52;->n:Ljava/util/concurrent/CopyOnWriteArraySet;

    .line 192
    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArraySet;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_1c
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_28

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lx22;

    new-instance v3, Landroid/os/Bundle;

    .line 193
    invoke-direct {v3, v12}, Landroid/os/Bundle;-><init>(Landroid/os/Bundle;)V

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-wide/from16 v4, p3

    .line 194
    invoke-interface/range {v0 .. v5}, Lx22;->a(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;J)V

    goto :goto_1c

    :cond_28
    move-object/from16 v2, p2

    add-int/lit8 v13, v13, 0x1

    move-object/from16 v7, p1

    move-wide/from16 v11, p3

    move-wide/from16 v2, p5

    move-object/from16 p8, v15

    const/16 v16, 0x0

    goto/16 :goto_17

    :cond_29
    move-object/from16 v2, p2

    .line 195
    invoke-static/range {v24 .. v24}, Ly02;->k(Lay1;)V

    move-object/from16 v5, v24

    const/4 v0, 0x0

    .line 196
    invoke-virtual {v5, v0}, Lz52;->p(Z)Lm52;

    move-result-object v0

    if-eqz v0, :cond_2a

    invoke-virtual {v9, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2a

    .line 197
    invoke-static {v8}, Ly02;->k(Lay1;)V

    .line 198
    invoke-virtual/range {v18 .. v18}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 199
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    .line 200
    iget-object v2, v8, Lh92;->o:Lf92;

    const/4 v4, 0x1

    .line 201
    invoke-virtual {v2, v4, v4, v0, v1}, Lf92;->a(ZZJ)Z

    :cond_2a
    :goto_1d
    return-void

    .line 202
    :cond_2b
    invoke-static {v15}, Ly02;->l(Lm22;)V

    .line 203
    iget-object v0, v15, Lzy1;->v:Lso;

    .line 204
    const-string v1, "Event not sent since app measurement is disabled"

    invoke-virtual {v0, v1}, Lso;->b(Ljava/lang/String;)V

    return-void
.end method

.method public final v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZJ)V
    .locals 11

    .line 1
    iget-object v2, p0, Let;->j:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v2, Ly02;

    .line 4
    .line 5
    const/4 v4, 0x0

    .line 6
    const/16 v5, 0x18

    .line 7
    .line 8
    if-eqz p4, :cond_0

    .line 9
    .line 10
    iget-object v6, v2, Ly02;->r:Lcb2;

    .line 11
    .line 12
    invoke-static {v6}, Ly02;->j(Let;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v6, p2}, Lcb2;->u0(Ljava/lang/String;)I

    .line 16
    .line 17
    .line 18
    move-result v6

    .line 19
    goto :goto_1

    .line 20
    :cond_0
    iget-object v6, v2, Ly02;->r:Lcb2;

    .line 21
    .line 22
    invoke-static {v6}, Ly02;->j(Let;)V

    .line 23
    .line 24
    .line 25
    const-string v7, "user property"

    .line 26
    .line 27
    invoke-virtual {v6, v7, p2}, Lcb2;->o0(Ljava/lang/String;Ljava/lang/String;)Z

    .line 28
    .line 29
    .line 30
    move-result v8

    .line 31
    const/4 v9, 0x6

    .line 32
    if-nez v8, :cond_1

    .line 33
    .line 34
    :goto_0
    move v6, v9

    .line 35
    goto :goto_1

    .line 36
    :cond_1
    sget-object v8, Les0;->c:[Ljava/lang/String;

    .line 37
    .line 38
    const/4 v10, 0x0

    .line 39
    invoke-virtual {v6, v7, v8, v10, p2}, Lcb2;->q0(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Z

    .line 40
    .line 41
    .line 42
    move-result v8

    .line 43
    if-nez v8, :cond_2

    .line 44
    .line 45
    const/16 v6, 0xf

    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_2
    iget-object v8, v6, Let;->j:Ljava/lang/Object;

    .line 49
    .line 50
    check-cast v8, Ly02;

    .line 51
    .line 52
    iget-object v8, v8, Ly02;->m:Lmt1;

    .line 53
    .line 54
    invoke-virtual {v6, v7, p2, v5}, Lcb2;->r0(Ljava/lang/String;Ljava/lang/String;I)Z

    .line 55
    .line 56
    .line 57
    move-result v6

    .line 58
    if-nez v6, :cond_3

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_3
    move v6, v4

    .line 62
    :goto_1
    iget-object v7, p0, Lc52;->E:Lmd1;

    .line 63
    .line 64
    const/4 v8, 0x1

    .line 65
    if-eqz v6, :cond_5

    .line 66
    .line 67
    iget-object v0, v2, Ly02;->r:Lcb2;

    .line 68
    .line 69
    invoke-static {v0}, Ly02;->j(Let;)V

    .line 70
    .line 71
    .line 72
    invoke-static {v5, p2, v8}, Lcb2;->s(ILjava/lang/String;Z)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    if-eqz p2, :cond_4

    .line 77
    .line 78
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 79
    .line 80
    .line 81
    move-result v4

    .line 82
    :cond_4
    iget-object v1, v2, Ly02;->r:Lcb2;

    .line 83
    .line 84
    invoke-static {v1}, Ly02;->j(Let;)V

    .line 85
    .line 86
    .line 87
    const/4 v1, 0x0

    .line 88
    const-string v2, "_ev"

    .line 89
    .line 90
    move-object p4, v0

    .line 91
    move-object p1, v1

    .line 92
    move-object p3, v2

    .line 93
    move/from16 p5, v4

    .line 94
    .line 95
    move p2, v6

    .line 96
    move-object p0, v7

    .line 97
    invoke-static/range {p0 .. p5}, Lcb2;->D(Lbb2;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;I)V

    .line 98
    .line 99
    .line 100
    return-void

    .line 101
    :cond_5
    move-object v6, v7

    .line 102
    if-nez p1, :cond_6

    .line 103
    .line 104
    const-string v7, "app"

    .line 105
    .line 106
    goto :goto_2

    .line 107
    :cond_6
    move-object v7, p1

    .line 108
    :goto_2
    if-eqz p3, :cond_b

    .line 109
    .line 110
    iget-object v9, v2, Ly02;->r:Lcb2;

    .line 111
    .line 112
    iget-object v10, v2, Ly02;->r:Lcb2;

    .line 113
    .line 114
    invoke-static {v9}, Ly02;->j(Let;)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {v9, p3, p2}, Lcb2;->A(Ljava/lang/Object;Ljava/lang/String;)I

    .line 118
    .line 119
    .line 120
    move-result v9

    .line 121
    if-eqz v9, :cond_9

    .line 122
    .line 123
    invoke-static {v10}, Ly02;->j(Let;)V

    .line 124
    .line 125
    .line 126
    invoke-static {v5, p2, v8}, Lcb2;->s(ILjava/lang/String;Z)Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v1

    .line 130
    instance-of v2, p3, Ljava/lang/String;

    .line 131
    .line 132
    if-nez v2, :cond_7

    .line 133
    .line 134
    instance-of v2, p3, Ljava/lang/CharSequence;

    .line 135
    .line 136
    if-eqz v2, :cond_8

    .line 137
    .line 138
    :cond_7
    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 143
    .line 144
    .line 145
    move-result v4

    .line 146
    :cond_8
    invoke-static {v10}, Ly02;->j(Let;)V

    .line 147
    .line 148
    .line 149
    const/4 v0, 0x0

    .line 150
    const-string v2, "_ev"

    .line 151
    .line 152
    move-object p1, v0

    .line 153
    move-object p4, v1

    .line 154
    move-object p3, v2

    .line 155
    move/from16 p5, v4

    .line 156
    .line 157
    move-object p0, v6

    .line 158
    move p2, v9

    .line 159
    invoke-static/range {p0 .. p5}, Lcb2;->D(Lbb2;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;I)V

    .line 160
    .line 161
    .line 162
    return-void

    .line 163
    :cond_9
    invoke-static {v10}, Ly02;->j(Let;)V

    .line 164
    .line 165
    .line 166
    invoke-virtual {v10, p3, p2}, Lcb2;->B(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 167
    .line 168
    .line 169
    move-result-object v4

    .line 170
    if-eqz v4, :cond_a

    .line 171
    .line 172
    iget-object v8, v2, Ly02;->p:Ls02;

    .line 173
    .line 174
    invoke-static {v8}, Ly02;->l(Lm22;)V

    .line 175
    .line 176
    .line 177
    new-instance v0, Lo32;

    .line 178
    .line 179
    move-object v1, p0

    .line 180
    move-object v3, p2

    .line 181
    move-wide/from16 v5, p5

    .line 182
    .line 183
    move-object v2, v7

    .line 184
    invoke-direct/range {v0 .. v6}, Lo32;-><init>(Lc52;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;J)V

    .line 185
    .line 186
    .line 187
    invoke-virtual {v8, v0}, Ls02;->u(Ljava/lang/Runnable;)V

    .line 188
    .line 189
    .line 190
    :cond_a
    return-void

    .line 191
    :cond_b
    iget-object v8, v2, Ly02;->p:Ls02;

    .line 192
    .line 193
    invoke-static {v8}, Ly02;->l(Lm22;)V

    .line 194
    .line 195
    .line 196
    new-instance v0, Lo32;

    .line 197
    .line 198
    const/4 v4, 0x0

    .line 199
    move-object v1, p0

    .line 200
    move-object v3, p2

    .line 201
    move-wide/from16 v5, p5

    .line 202
    .line 203
    move-object v2, v7

    .line 204
    invoke-direct/range {v0 .. v6}, Lo32;-><init>(Lc52;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;J)V

    .line 205
    .line 206
    .line 207
    invoke-virtual {v8, v0}, Ls02;->u(Ljava/lang/Runnable;)V

    .line 208
    .line 209
    .line 210
    return-void
.end method

.method public final w(JLjava/lang/Object;Ljava/lang/String;Ljava/lang/String;)V
    .locals 10

    .line 1
    iget-object v0, p0, Let;->j:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ly02;

    .line 4
    .line 5
    invoke-static {p4}, Lbh;->e(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p5}, Lbh;->e(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lgx1;->l()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Lay1;->m()V

    .line 15
    .line 16
    .line 17
    const-string p0, "allow_personalized_ads"

    .line 18
    .line 19
    invoke-virtual {p0, p5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    const/4 v1, 0x1

    .line 24
    if-eqz p0, :cond_4

    .line 25
    .line 26
    instance-of p0, p3, Ljava/lang/String;

    .line 27
    .line 28
    const-string v2, "_npa"

    .line 29
    .line 30
    if-eqz p0, :cond_2

    .line 31
    .line 32
    move-object p0, p3

    .line 33
    check-cast p0, Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    if-nez v3, :cond_2

    .line 40
    .line 41
    sget-object p3, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 42
    .line 43
    invoke-virtual {p0, p3}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    const-string p3, "false"

    .line 48
    .line 49
    invoke-virtual {p3, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    const-wide/16 v3, 0x1

    .line 54
    .line 55
    if-eq v1, p0, :cond_0

    .line 56
    .line 57
    const-wide/16 v5, 0x0

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_0
    move-wide v5, v3

    .line 61
    :goto_0
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    iget-object p5, v0, Ly02;->n:Lvz1;

    .line 66
    .line 67
    invoke-static {p5}, Ly02;->j(Let;)V

    .line 68
    .line 69
    .line 70
    iget-object p5, p5, Lvz1;->v:Lvx;

    .line 71
    .line 72
    cmp-long v3, v5, v3

    .line 73
    .line 74
    if-nez v3, :cond_1

    .line 75
    .line 76
    const-string p3, "true"

    .line 77
    .line 78
    :cond_1
    invoke-virtual {p5, p3}, Lvx;->f(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    move-object p3, p0

    .line 82
    :goto_1
    move-object p5, v2

    .line 83
    goto :goto_2

    .line 84
    :cond_2
    if-nez p3, :cond_3

    .line 85
    .line 86
    iget-object p0, v0, Ly02;->n:Lvz1;

    .line 87
    .line 88
    invoke-static {p0}, Ly02;->j(Let;)V

    .line 89
    .line 90
    .line 91
    iget-object p0, p0, Lvz1;->v:Lvx;

    .line 92
    .line 93
    const-string p5, "unset"

    .line 94
    .line 95
    invoke-virtual {p0, p5}, Lvx;->f(Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    goto :goto_1

    .line 99
    :cond_3
    :goto_2
    iget-object p0, v0, Ly02;->o:Lzy1;

    .line 100
    .line 101
    invoke-static {p0}, Ly02;->l(Lm22;)V

    .line 102
    .line 103
    .line 104
    iget-object p0, p0, Lzy1;->w:Lso;

    .line 105
    .line 106
    const-string v2, "Setting user property(FE)"

    .line 107
    .line 108
    const-string v3, "non_personalized_ads(_npa)"

    .line 109
    .line 110
    invoke-virtual {p0, v2, v3, p3}, Lso;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 111
    .line 112
    .line 113
    :cond_4
    move-object v7, p3

    .line 114
    move-object v8, p5

    .line 115
    invoke-virtual {v0}, Ly02;->e()Z

    .line 116
    .line 117
    .line 118
    move-result p0

    .line 119
    if-nez p0, :cond_5

    .line 120
    .line 121
    iget-object p0, v0, Ly02;->o:Lzy1;

    .line 122
    .line 123
    invoke-static {p0}, Ly02;->l(Lm22;)V

    .line 124
    .line 125
    .line 126
    iget-object p0, p0, Lzy1;->w:Lso;

    .line 127
    .line 128
    const-string p1, "User property not set since app measurement is disabled"

    .line 129
    .line 130
    invoke-virtual {p0, p1}, Lso;->b(Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    return-void

    .line 134
    :cond_5
    invoke-virtual {v0}, Ly02;->h()Z

    .line 135
    .line 136
    .line 137
    move-result p0

    .line 138
    if-nez p0, :cond_6

    .line 139
    .line 140
    return-void

    .line 141
    :cond_6
    new-instance v4, Lwa2;

    .line 142
    .line 143
    move-wide v5, p1

    .line 144
    move-object v9, p4

    .line 145
    invoke-direct/range {v4 .. v9}, Lwa2;-><init>(JLjava/lang/Object;Ljava/lang/String;Ljava/lang/String;)V

    .line 146
    .line 147
    .line 148
    invoke-virtual {v0}, Ly02;->n()Li82;

    .line 149
    .line 150
    .line 151
    move-result-object p0

    .line 152
    invoke-virtual {p0}, Lgx1;->l()V

    .line 153
    .line 154
    .line 155
    invoke-virtual {p0}, Lay1;->m()V

    .line 156
    .line 157
    .line 158
    invoke-virtual {p0}, Li82;->x()V

    .line 159
    .line 160
    .line 161
    iget-object p1, p0, Let;->j:Ljava/lang/Object;

    .line 162
    .line 163
    check-cast p1, Ly02;

    .line 164
    .line 165
    invoke-virtual {p1}, Ly02;->m()Lpy1;

    .line 166
    .line 167
    .line 168
    move-result-object p1

    .line 169
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 170
    .line 171
    .line 172
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    .line 173
    .line 174
    .line 175
    move-result-object p2

    .line 176
    invoke-static {v4, p2}, Lya2;->a(Lwa2;Landroid/os/Parcel;)V

    .line 177
    .line 178
    .line 179
    invoke-virtual {p2}, Landroid/os/Parcel;->marshall()[B

    .line 180
    .line 181
    .line 182
    move-result-object p3

    .line 183
    invoke-virtual {p2}, Landroid/os/Parcel;->recycle()V

    .line 184
    .line 185
    .line 186
    array-length p2, p3

    .line 187
    const/high16 p4, 0x20000

    .line 188
    .line 189
    if-le p2, p4, :cond_7

    .line 190
    .line 191
    iget-object p1, p1, Let;->j:Ljava/lang/Object;

    .line 192
    .line 193
    check-cast p1, Ly02;

    .line 194
    .line 195
    iget-object p1, p1, Ly02;->o:Lzy1;

    .line 196
    .line 197
    invoke-static {p1}, Ly02;->l(Lm22;)V

    .line 198
    .line 199
    .line 200
    iget-object p1, p1, Lzy1;->p:Lso;

    .line 201
    .line 202
    const-string p2, "User property too long for local database. Sending directly to service"

    .line 203
    .line 204
    invoke-virtual {p1, p2}, Lso;->b(Ljava/lang/String;)V

    .line 205
    .line 206
    .line 207
    const/4 p1, 0x0

    .line 208
    goto :goto_3

    .line 209
    :cond_7
    invoke-virtual {p1, v1, p3}, Lpy1;->s(I[B)Z

    .line 210
    .line 211
    .line 212
    move-result p1

    .line 213
    :goto_3
    invoke-virtual {p0, v1}, Li82;->B(Z)Lbc2;

    .line 214
    .line 215
    .line 216
    move-result-object p2

    .line 217
    new-instance p3, Li62;

    .line 218
    .line 219
    invoke-direct {p3, p0, p2, p1, v4}, Li62;-><init>(Li82;Lbc2;ZLwa2;)V

    .line 220
    .line 221
    .line 222
    invoke-virtual {p0, p3}, Li82;->z(Ljava/lang/Runnable;)V

    .line 223
    .line 224
    .line 225
    return-void
.end method

.method public final x()V
    .locals 8

    .line 1
    invoke-virtual {p0}, Lgx1;->l()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lay1;->m()V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Let;->j:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v0, Ly02;

    .line 10
    .line 11
    invoke-virtual {v0}, Ly02;->h()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    goto/16 :goto_0

    .line 18
    .line 19
    :cond_0
    iget-object v1, v0, Ly02;->m:Lmt1;

    .line 20
    .line 21
    iget-object v2, v1, Let;->j:Ljava/lang/Object;

    .line 22
    .line 23
    check-cast v2, Ly02;

    .line 24
    .line 25
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 26
    .line 27
    .line 28
    const-string v2, "google_analytics_deferred_deep_link_enabled"

    .line 29
    .line 30
    invoke-virtual {v1, v2}, Lmt1;->y(Ljava/lang/String;)Ljava/lang/Boolean;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    if-eqz v1, :cond_1

    .line 35
    .line 36
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-eqz v1, :cond_1

    .line 41
    .line 42
    iget-object v1, v0, Ly02;->o:Lzy1;

    .line 43
    .line 44
    invoke-static {v1}, Ly02;->l(Lm22;)V

    .line 45
    .line 46
    .line 47
    iget-object v1, v1, Lzy1;->v:Lso;

    .line 48
    .line 49
    const-string v2, "Deferred Deep Link feature enabled."

    .line 50
    .line 51
    invoke-virtual {v1, v2}, Lso;->b(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    iget-object v1, v0, Ly02;->p:Ls02;

    .line 55
    .line 56
    invoke-static {v1}, Ly02;->l(Lm22;)V

    .line 57
    .line 58
    .line 59
    new-instance v2, La52;

    .line 60
    .line 61
    invoke-direct {v2, p0}, La52;-><init>(Lc52;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v1, v2}, Ls02;->u(Ljava/lang/Runnable;)V

    .line 65
    .line 66
    .line 67
    :cond_1
    invoke-virtual {v0}, Ly02;->n()Li82;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    invoke-virtual {v1}, Lgx1;->l()V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v1}, Lay1;->m()V

    .line 75
    .line 76
    .line 77
    const/4 v2, 0x1

    .line 78
    invoke-virtual {v1, v2}, Li82;->B(Z)Lbc2;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    invoke-virtual {v1}, Li82;->x()V

    .line 83
    .line 84
    .line 85
    iget-object v3, v1, Let;->j:Ljava/lang/Object;

    .line 86
    .line 87
    check-cast v3, Ly02;

    .line 88
    .line 89
    iget-object v4, v3, Ly02;->m:Lmt1;

    .line 90
    .line 91
    sget-object v5, Lxx1;->W0:Lwx1;

    .line 92
    .line 93
    const/4 v6, 0x0

    .line 94
    invoke-virtual {v4, v6, v5}, Lmt1;->w(Ljava/lang/String;Lwx1;)Z

    .line 95
    .line 96
    .line 97
    invoke-virtual {v3}, Ly02;->m()Lpy1;

    .line 98
    .line 99
    .line 100
    move-result-object v3

    .line 101
    const/4 v4, 0x3

    .line 102
    const/4 v5, 0x0

    .line 103
    new-array v7, v5, [B

    .line 104
    .line 105
    invoke-virtual {v3, v4, v7}, Lpy1;->s(I[B)Z

    .line 106
    .line 107
    .line 108
    new-instance v3, Lp62;

    .line 109
    .line 110
    invoke-direct {v3, v1, v2}, Lp62;-><init>(Li82;Lbc2;)V

    .line 111
    .line 112
    .line 113
    invoke-virtual {v1, v3}, Li82;->z(Ljava/lang/Runnable;)V

    .line 114
    .line 115
    .line 116
    iput-boolean v5, p0, Lc52;->A:Z

    .line 117
    .line 118
    iget-object v1, v0, Ly02;->n:Lvz1;

    .line 119
    .line 120
    invoke-static {v1}, Ly02;->j(Let;)V

    .line 121
    .line 122
    .line 123
    invoke-virtual {v1}, Let;->l()V

    .line 124
    .line 125
    .line 126
    invoke-virtual {v1}, Lvz1;->p()Landroid/content/SharedPreferences;

    .line 127
    .line 128
    .line 129
    move-result-object v2

    .line 130
    const-string v3, "previous_os_version"

    .line 131
    .line 132
    invoke-interface {v2, v3, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object v2

    .line 136
    iget-object v4, v1, Let;->j:Ljava/lang/Object;

    .line 137
    .line 138
    check-cast v4, Ly02;

    .line 139
    .line 140
    invoke-virtual {v4}, Ly02;->o()Lou1;

    .line 141
    .line 142
    .line 143
    move-result-object v4

    .line 144
    invoke-virtual {v4}, Lm22;->n()V

    .line 145
    .line 146
    .line 147
    sget-object v4, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    .line 148
    .line 149
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 150
    .line 151
    .line 152
    move-result v5

    .line 153
    if-nez v5, :cond_2

    .line 154
    .line 155
    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 156
    .line 157
    .line 158
    move-result v5

    .line 159
    if-nez v5, :cond_2

    .line 160
    .line 161
    invoke-virtual {v1}, Lvz1;->p()Landroid/content/SharedPreferences;

    .line 162
    .line 163
    .line 164
    move-result-object v1

    .line 165
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 166
    .line 167
    .line 168
    move-result-object v1

    .line 169
    invoke-interface {v1, v3, v4}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 170
    .line 171
    .line 172
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 173
    .line 174
    .line 175
    :cond_2
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 176
    .line 177
    .line 178
    move-result v1

    .line 179
    if-nez v1, :cond_3

    .line 180
    .line 181
    invoke-virtual {v0}, Ly02;->o()Lou1;

    .line 182
    .line 183
    .line 184
    move-result-object v0

    .line 185
    invoke-virtual {v0}, Lm22;->n()V

    .line 186
    .line 187
    .line 188
    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 189
    .line 190
    .line 191
    move-result v0

    .line 192
    if-nez v0, :cond_3

    .line 193
    .line 194
    new-instance v0, Landroid/os/Bundle;

    .line 195
    .line 196
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 197
    .line 198
    .line 199
    const-string v1, "_po"

    .line 200
    .line 201
    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 202
    .line 203
    .line 204
    const-string v1, "auto"

    .line 205
    .line 206
    const-string v2, "_ou"

    .line 207
    .line 208
    invoke-virtual {p0, v1, v2, v0}, Lc52;->s(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)V

    .line 209
    .line 210
    .line 211
    :cond_3
    :goto_0
    return-void
.end method

.method public final y(Landroid/os/Bundle;J)V
    .locals 12

    .line 1
    iget-object v0, p0, Let;->j:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ly02;

    .line 4
    .line 5
    invoke-static {p1}, Lbh;->h(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    new-instance v1, Landroid/os/Bundle;

    .line 9
    .line 10
    invoke-direct {v1, p1}, Landroid/os/Bundle;-><init>(Landroid/os/Bundle;)V

    .line 11
    .line 12
    .line 13
    const-string p1, "app_id"

    .line 14
    .line 15
    invoke-virtual {v1, p1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-nez v2, :cond_0

    .line 24
    .line 25
    iget-object v2, v0, Ly02;->o:Lzy1;

    .line 26
    .line 27
    invoke-static {v2}, Ly02;->l(Lm22;)V

    .line 28
    .line 29
    .line 30
    iget-object v2, v2, Lzy1;->r:Lso;

    .line 31
    .line 32
    const-string v3, "Package name should be null when calling setConditionalUserProperty"

    .line 33
    .line 34
    invoke-virtual {v2, v3}, Lso;->b(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    :cond_0
    invoke-virtual {v1, p1}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    const-class v2, Ljava/lang/String;

    .line 41
    .line 42
    const/4 v3, 0x0

    .line 43
    invoke-static {v1, p1, v2, v3}, Lbh;->G(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    const-string p1, "origin"

    .line 47
    .line 48
    invoke-static {v1, p1, v2, v3}, Lbh;->G(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    const-string v4, "name"

    .line 52
    .line 53
    invoke-static {v1, v4, v2, v3}, Lbh;->G(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    const-class v5, Ljava/lang/Object;

    .line 57
    .line 58
    const-string v6, "value"

    .line 59
    .line 60
    invoke-static {v1, v6, v5, v3}, Lbh;->G(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    const-string v5, "trigger_event_name"

    .line 64
    .line 65
    invoke-static {v1, v5, v2, v3}, Lbh;->G(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    const-wide/16 v7, 0x0

    .line 69
    .line 70
    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 71
    .line 72
    .line 73
    move-result-object v7

    .line 74
    const-string v8, "trigger_timeout"

    .line 75
    .line 76
    const-class v9, Ljava/lang/Long;

    .line 77
    .line 78
    invoke-static {v1, v8, v9, v7}, Lbh;->G(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    const-string v10, "timed_out_event_name"

    .line 82
    .line 83
    invoke-static {v1, v10, v2, v3}, Lbh;->G(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    const-string v10, "timed_out_event_params"

    .line 87
    .line 88
    const-class v11, Landroid/os/Bundle;

    .line 89
    .line 90
    invoke-static {v1, v10, v11, v3}, Lbh;->G(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    const-string v10, "triggered_event_name"

    .line 94
    .line 95
    invoke-static {v1, v10, v2, v3}, Lbh;->G(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    const-string v10, "triggered_event_params"

    .line 99
    .line 100
    invoke-static {v1, v10, v11, v3}, Lbh;->G(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    const-string v10, "time_to_live"

    .line 104
    .line 105
    invoke-static {v1, v10, v9, v7}, Lbh;->G(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    const-string v7, "expired_event_name"

    .line 109
    .line 110
    invoke-static {v1, v7, v2, v3}, Lbh;->G(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    const-string v2, "expired_event_params"

    .line 114
    .line 115
    invoke-static {v1, v2, v11, v3}, Lbh;->G(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    invoke-virtual {v1, v4}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v2

    .line 122
    invoke-static {v2}, Lbh;->e(Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {v1, p1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    invoke-static {p1}, Lbh;->e(Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {v1, v6}, Landroid/os/BaseBundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 133
    .line 134
    .line 135
    move-result-object p1

    .line 136
    invoke-static {p1}, Lbh;->h(Ljava/lang/Object;)V

    .line 137
    .line 138
    .line 139
    const-string p1, "creation_timestamp"

    .line 140
    .line 141
    invoke-virtual {v1, p1, p2, p3}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    .line 142
    .line 143
    .line 144
    invoke-virtual {v1, v4}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object p1

    .line 148
    invoke-virtual {v1, v6}, Landroid/os/BaseBundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 149
    .line 150
    .line 151
    move-result-object p2

    .line 152
    iget-object p3, v0, Ly02;->r:Lcb2;

    .line 153
    .line 154
    iget-object v2, v0, Ly02;->s:Lry1;

    .line 155
    .line 156
    iget-object v3, v0, Ly02;->o:Lzy1;

    .line 157
    .line 158
    invoke-static {p3}, Ly02;->j(Let;)V

    .line 159
    .line 160
    .line 161
    invoke-virtual {p3, p1}, Lcb2;->u0(Ljava/lang/String;)I

    .line 162
    .line 163
    .line 164
    move-result v4

    .line 165
    if-nez v4, :cond_7

    .line 166
    .line 167
    invoke-static {p3}, Ly02;->j(Let;)V

    .line 168
    .line 169
    .line 170
    invoke-virtual {p3, p2, p1}, Lcb2;->A(Ljava/lang/Object;Ljava/lang/String;)I

    .line 171
    .line 172
    .line 173
    move-result v4

    .line 174
    if-nez v4, :cond_6

    .line 175
    .line 176
    invoke-virtual {p3, p2, p1}, Lcb2;->B(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 177
    .line 178
    .line 179
    move-result-object p3

    .line 180
    if-nez p3, :cond_1

    .line 181
    .line 182
    invoke-static {v3}, Ly02;->l(Lm22;)V

    .line 183
    .line 184
    .line 185
    iget-object p0, v3, Lzy1;->o:Lso;

    .line 186
    .line 187
    invoke-virtual {v2, p1}, Lry1;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 188
    .line 189
    .line 190
    move-result-object p1

    .line 191
    const-string p3, "Unable to normalize conditional user property value"

    .line 192
    .line 193
    invoke-virtual {p0, p3, p1, p2}, Lso;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 194
    .line 195
    .line 196
    return-void

    .line 197
    :cond_1
    invoke-static {v1, p3}, Lbh;->F(Landroid/os/Bundle;Ljava/lang/Object;)V

    .line 198
    .line 199
    .line 200
    invoke-virtual {v1, v8}, Landroid/os/BaseBundle;->getLong(Ljava/lang/String;)J

    .line 201
    .line 202
    .line 203
    move-result-wide p2

    .line 204
    invoke-virtual {v1, v5}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 205
    .line 206
    .line 207
    move-result-object v4

    .line 208
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 209
    .line 210
    .line 211
    move-result v4

    .line 212
    const-wide/16 v5, 0x1

    .line 213
    .line 214
    const-wide v7, 0x39ef8b000L

    .line 215
    .line 216
    .line 217
    .line 218
    .line 219
    if-nez v4, :cond_3

    .line 220
    .line 221
    cmp-long v4, p2, v7

    .line 222
    .line 223
    if-gtz v4, :cond_2

    .line 224
    .line 225
    cmp-long v4, p2, v5

    .line 226
    .line 227
    if-gez v4, :cond_3

    .line 228
    .line 229
    :cond_2
    invoke-static {v3}, Ly02;->l(Lm22;)V

    .line 230
    .line 231
    .line 232
    iget-object p0, v3, Lzy1;->o:Lso;

    .line 233
    .line 234
    invoke-virtual {v2, p1}, Lry1;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 235
    .line 236
    .line 237
    move-result-object p1

    .line 238
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 239
    .line 240
    .line 241
    move-result-object p2

    .line 242
    const-string p3, "Invalid conditional user property timeout"

    .line 243
    .line 244
    invoke-virtual {p0, p3, p1, p2}, Lso;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 245
    .line 246
    .line 247
    return-void

    .line 248
    :cond_3
    invoke-virtual {v1, v10}, Landroid/os/BaseBundle;->getLong(Ljava/lang/String;)J

    .line 249
    .line 250
    .line 251
    move-result-wide p2

    .line 252
    cmp-long v4, p2, v7

    .line 253
    .line 254
    if-gtz v4, :cond_5

    .line 255
    .line 256
    cmp-long v4, p2, v5

    .line 257
    .line 258
    if-gez v4, :cond_4

    .line 259
    .line 260
    goto :goto_0

    .line 261
    :cond_4
    iget-object p1, v0, Ly02;->p:Ls02;

    .line 262
    .line 263
    invoke-static {p1}, Ly02;->l(Lm22;)V

    .line 264
    .line 265
    .line 266
    new-instance p2, Lr32;

    .line 267
    .line 268
    invoke-direct {p2, p0, v1}, Lr32;-><init>(Lc52;Landroid/os/Bundle;)V

    .line 269
    .line 270
    .line 271
    invoke-virtual {p1, p2}, Ls02;->u(Ljava/lang/Runnable;)V

    .line 272
    .line 273
    .line 274
    return-void

    .line 275
    :cond_5
    :goto_0
    invoke-static {v3}, Ly02;->l(Lm22;)V

    .line 276
    .line 277
    .line 278
    iget-object p0, v3, Lzy1;->o:Lso;

    .line 279
    .line 280
    invoke-virtual {v2, p1}, Lry1;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 281
    .line 282
    .line 283
    move-result-object p1

    .line 284
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 285
    .line 286
    .line 287
    move-result-object p2

    .line 288
    const-string p3, "Invalid conditional user property time to live"

    .line 289
    .line 290
    invoke-virtual {p0, p3, p1, p2}, Lso;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 291
    .line 292
    .line 293
    return-void

    .line 294
    :cond_6
    invoke-static {v3}, Ly02;->l(Lm22;)V

    .line 295
    .line 296
    .line 297
    iget-object p0, v3, Lzy1;->o:Lso;

    .line 298
    .line 299
    invoke-virtual {v2, p1}, Lry1;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 300
    .line 301
    .line 302
    move-result-object p1

    .line 303
    const-string p3, "Invalid conditional user property value"

    .line 304
    .line 305
    invoke-virtual {p0, p3, p1, p2}, Lso;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 306
    .line 307
    .line 308
    return-void

    .line 309
    :cond_7
    invoke-static {v3}, Ly02;->l(Lm22;)V

    .line 310
    .line 311
    .line 312
    iget-object p0, v3, Lzy1;->o:Lso;

    .line 313
    .line 314
    invoke-virtual {v2, p1}, Lry1;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 315
    .line 316
    .line 317
    move-result-object p1

    .line 318
    const-string p2, "Invalid conditional user property name"

    .line 319
    .line 320
    invoke-virtual {p0, p1, p2}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 321
    .line 322
    .line 323
    return-void
.end method

.method public final z(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 5

    .line 1
    iget-object v0, p0, Let;->j:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ly02;

    .line 4
    .line 5
    iget-object v1, v0, Ly02;->t:Lmz;

    .line 6
    .line 7
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 11
    .line 12
    .line 13
    move-result-wide v1

    .line 14
    invoke-static {p1}, Lbh;->e(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    new-instance v3, Landroid/os/Bundle;

    .line 18
    .line 19
    invoke-direct {v3}, Landroid/os/Bundle;-><init>()V

    .line 20
    .line 21
    .line 22
    const-string v4, "name"

    .line 23
    .line 24
    invoke-virtual {v3, v4, p1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    const-string p1, "creation_timestamp"

    .line 28
    .line 29
    invoke-virtual {v3, p1, v1, v2}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    .line 30
    .line 31
    .line 32
    if-eqz p2, :cond_0

    .line 33
    .line 34
    const-string p1, "expired_event_name"

    .line 35
    .line 36
    invoke-virtual {v3, p1, p2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    const-string p1, "expired_event_params"

    .line 40
    .line 41
    invoke-virtual {v3, p1, p3}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 42
    .line 43
    .line 44
    :cond_0
    iget-object p1, v0, Ly02;->p:Ls02;

    .line 45
    .line 46
    invoke-static {p1}, Ly02;->l(Lm22;)V

    .line 47
    .line 48
    .line 49
    new-instance p2, Ls32;

    .line 50
    .line 51
    invoke-direct {p2, p0, v3}, Ls32;-><init>(Lc52;Landroid/os/Bundle;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p1, p2}, Ls02;->u(Ljava/lang/Runnable;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method
