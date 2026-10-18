.class public final Lzm1;
.super Lgv1;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final a:Ly02;

.field public final b:Lc52;


# direct methods
.method public constructor <init>(Ly02;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lbh;->h(Ljava/lang/Object;)V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Lzm1;->a:Ly02;

    .line 8
    .line 9
    iget-object p1, p1, Ly02;->v:Lc52;

    .line 10
    .line 11
    invoke-static {p1}, Ly02;->k(Lay1;)V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, Lzm1;->b:Lc52;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final b(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lzm1;->b:Lc52;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Lc52;->p(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final c()J
    .locals 2

    .line 1
    iget-object p0, p0, Lzm1;->a:Ly02;

    .line 2
    .line 3
    iget-object p0, p0, Ly02;->r:Lcb2;

    .line 4
    .line 5
    invoke-static {p0}, Ly02;->j(Let;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcb2;->j0()J

    .line 9
    .line 10
    .line 11
    move-result-wide v0

    .line 12
    return-wide v0
.end method

.method public final d(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lzm1;->a:Ly02;

    .line 2
    .line 3
    iget-object p0, p0, Ly02;->v:Lc52;

    .line 4
    .line 5
    invoke-static {p0}, Ly02;->k(Lay1;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1, p2, p3}, Lc52;->z(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final e()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lzm1;->b:Lc52;

    .line 2
    .line 3
    iget-object p0, p0, Let;->j:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast p0, Ly02;

    .line 6
    .line 7
    iget-object p0, p0, Ly02;->u:Lz52;

    .line 8
    .line 9
    invoke-static {p0}, Ly02;->k(Lay1;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lz52;->l:Lm52;

    .line 13
    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Lm52;->a:Ljava/lang/String;

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return-object p0
.end method

.method public final f()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lzm1;->b:Lc52;

    .line 2
    .line 3
    iget-object p0, p0, Let;->j:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast p0, Ly02;

    .line 6
    .line 7
    iget-object p0, p0, Ly02;->u:Lz52;

    .line 8
    .line 9
    invoke-static {p0}, Ly02;->k(Lay1;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lz52;->l:Lm52;

    .line 13
    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Lm52;->b:Ljava/lang/String;

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return-object p0
.end method

.method public final g(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;
    .locals 10

    .line 1
    iget-object p0, p0, Lzm1;->b:Lc52;

    .line 2
    .line 3
    iget-object v0, p0, Let;->j:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v0, Ly02;

    .line 6
    .line 7
    iget-object v1, v0, Ly02;->p:Ls02;

    .line 8
    .line 9
    iget-object v2, v0, Ly02;->o:Lzy1;

    .line 10
    .line 11
    invoke-static {v1}, Ly02;->l(Lm22;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v1}, Ls02;->r()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    const/4 v3, 0x0

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    invoke-static {v2}, Ly02;->l(Lm22;)V

    .line 22
    .line 23
    .line 24
    iget-object p0, v2, Lzy1;->o:Lso;

    .line 25
    .line 26
    const-string p1, "Cannot get conditional user properties from analytics worker thread"

    .line 27
    .line 28
    invoke-virtual {p0, p1}, Lso;->b(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    new-instance p0, Ljava/util/ArrayList;

    .line 32
    .line 33
    invoke-direct {p0, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 34
    .line 35
    .line 36
    return-object p0

    .line 37
    :cond_0
    invoke-static {}, Ltb0;->m()Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-eqz v1, :cond_1

    .line 42
    .line 43
    invoke-static {v2}, Ly02;->l(Lm22;)V

    .line 44
    .line 45
    .line 46
    iget-object p0, v2, Lzy1;->o:Lso;

    .line 47
    .line 48
    const-string p1, "Cannot get conditional user properties from main thread"

    .line 49
    .line 50
    invoke-virtual {p0, p1}, Lso;->b(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    new-instance p0, Ljava/util/ArrayList;

    .line 54
    .line 55
    invoke-direct {p0, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 56
    .line 57
    .line 58
    return-object p0

    .line 59
    :cond_1
    new-instance v5, Ljava/util/concurrent/atomic/AtomicReference;

    .line 60
    .line 61
    invoke-direct {v5}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 62
    .line 63
    .line 64
    iget-object v4, v0, Ly02;->p:Ls02;

    .line 65
    .line 66
    invoke-static {v4}, Ly02;->l(Lm22;)V

    .line 67
    .line 68
    .line 69
    new-instance v9, Lt32;

    .line 70
    .line 71
    invoke-direct {v9, p0, v5, p1, p2}, Lt32;-><init>(Lc52;Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/String;Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    const-wide/16 v6, 0x1388

    .line 75
    .line 76
    const-string v8, "get conditional user properties"

    .line 77
    .line 78
    invoke-virtual/range {v4 .. v9}, Ls02;->v(Ljava/util/concurrent/atomic/AtomicReference;JLjava/lang/String;Ljava/lang/Runnable;)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    check-cast p0, Ljava/util/List;

    .line 86
    .line 87
    if-nez p0, :cond_2

    .line 88
    .line 89
    invoke-static {v2}, Ly02;->l(Lm22;)V

    .line 90
    .line 91
    .line 92
    iget-object p0, v2, Lzy1;->o:Lso;

    .line 93
    .line 94
    const-string p1, "Timed out waiting for get conditional user properties"

    .line 95
    .line 96
    const/4 p2, 0x0

    .line 97
    invoke-virtual {p0, p2, p1}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    new-instance p0, Ljava/util/ArrayList;

    .line 101
    .line 102
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 103
    .line 104
    .line 105
    return-object p0

    .line 106
    :cond_2
    invoke-static {p0}, Lcb2;->f0(Ljava/util/List;)Ljava/util/ArrayList;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    return-object p0
.end method

.method public final h(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    iget-object p0, p0, Lzm1;->b:Lc52;

    .line 2
    .line 3
    iget-object v0, p0, Let;->j:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v0, Ly02;

    .line 6
    .line 7
    iget-object v0, v0, Ly02;->t:Lmz;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 13
    .line 14
    .line 15
    move-result-wide v0

    .line 16
    invoke-virtual {p0, p1, v0, v1}, Lc52;->y(Landroid/os/Bundle;J)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final i(Ljava/lang/String;)I
    .locals 0

    .line 1
    iget-object p0, p0, Lzm1;->b:Lc52;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Lbh;->e(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Let;->j:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast p0, Ly02;

    .line 12
    .line 13
    iget-object p0, p0, Ly02;->m:Lmt1;

    .line 14
    .line 15
    const/16 p0, 0x19

    .line 16
    .line 17
    return p0
.end method

.method public final j()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lzm1;->b:Lc52;

    .line 2
    .line 3
    iget-object p0, p0, Lc52;->p:Ljava/util/concurrent/atomic/AtomicReference;

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Ljava/lang/String;

    .line 10
    .line 11
    return-object p0
.end method

.method public final k(Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object p0, p0, Lzm1;->a:Ly02;

    .line 2
    .line 3
    iget-object v0, p0, Ly02;->w:Lfw1;

    .line 4
    .line 5
    invoke-static {v0}, Ly02;->i(Lgx1;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ly02;->t:Lmz;

    .line 9
    .line 10
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 14
    .line 15
    .line 16
    move-result-wide v1

    .line 17
    invoke-virtual {v0, p1, v1, v2}, Lfw1;->n(Ljava/lang/String;J)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final l()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lzm1;->b:Lc52;

    .line 2
    .line 3
    invoke-virtual {p0}, Lc52;->A()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final m(Ljava/lang/String;Ljava/lang/String;Z)Ljava/util/Map;
    .locals 7

    .line 1
    iget-object v1, p0, Lzm1;->b:Lc52;

    .line 2
    .line 3
    iget-object p0, v1, Let;->j:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast p0, Ly02;

    .line 6
    .line 7
    iget-object v0, p0, Ly02;->p:Ls02;

    .line 8
    .line 9
    iget-object v6, p0, Ly02;->o:Lzy1;

    .line 10
    .line 11
    invoke-static {v0}, Ly02;->l(Lm22;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ls02;->r()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    invoke-static {v6}, Ly02;->l(Lm22;)V

    .line 21
    .line 22
    .line 23
    iget-object p0, v6, Lzy1;->o:Lso;

    .line 24
    .line 25
    const-string p1, "Cannot get user properties from analytics worker thread"

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Lso;->b(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    sget-object p0, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    .line 31
    .line 32
    return-object p0

    .line 33
    :cond_0
    invoke-static {}, Ltb0;->m()Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    invoke-static {v6}, Ly02;->l(Lm22;)V

    .line 40
    .line 41
    .line 42
    iget-object p0, v6, Lzy1;->o:Lso;

    .line 43
    .line 44
    const-string p1, "Cannot get user properties from main thread"

    .line 45
    .line 46
    invoke-virtual {p0, p1}, Lso;->b(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    sget-object p0, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    .line 50
    .line 51
    return-object p0

    .line 52
    :cond_1
    new-instance v2, Ljava/util/concurrent/atomic/AtomicReference;

    .line 53
    .line 54
    invoke-direct {v2}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 55
    .line 56
    .line 57
    iget-object p0, p0, Ly02;->p:Ls02;

    .line 58
    .line 59
    invoke-static {p0}, Ly02;->l(Lm22;)V

    .line 60
    .line 61
    .line 62
    new-instance v0, Lv32;

    .line 63
    .line 64
    move-object v3, p1

    .line 65
    move-object v4, p2

    .line 66
    move v5, p3

    .line 67
    invoke-direct/range {v0 .. v5}, Lv32;-><init>(Lc52;Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 68
    .line 69
    .line 70
    move-object v1, v2

    .line 71
    move p1, v5

    .line 72
    const-wide/16 v2, 0x1388

    .line 73
    .line 74
    const-string v4, "get user properties"

    .line 75
    .line 76
    move-object v5, v0

    .line 77
    move-object v0, p0

    .line 78
    invoke-virtual/range {v0 .. v5}, Ls02;->v(Ljava/util/concurrent/atomic/AtomicReference;JLjava/lang/String;Ljava/lang/Runnable;)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    check-cast p0, Ljava/util/List;

    .line 86
    .line 87
    if-nez p0, :cond_2

    .line 88
    .line 89
    invoke-static {v6}, Ly02;->l(Lm22;)V

    .line 90
    .line 91
    .line 92
    iget-object p0, v6, Lzy1;->o:Lso;

    .line 93
    .line 94
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    const-string p2, "Timed out waiting for handle get user properties, includeInternal"

    .line 99
    .line 100
    invoke-virtual {p0, p1, p2}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    sget-object p0, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    .line 104
    .line 105
    return-object p0

    .line 106
    :cond_2
    new-instance p1, Lda;

    .line 107
    .line 108
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 109
    .line 110
    .line 111
    move-result p2

    .line 112
    invoke-direct {p1, p2}, Lu71;-><init>(I)V

    .line 113
    .line 114
    .line 115
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    :cond_3
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 120
    .line 121
    .line 122
    move-result p2

    .line 123
    if-eqz p2, :cond_4

    .line 124
    .line 125
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    move-result-object p2

    .line 129
    check-cast p2, Lwa2;

    .line 130
    .line 131
    invoke-virtual {p2}, Lwa2;->b()Ljava/lang/Object;

    .line 132
    .line 133
    .line 134
    move-result-object p3

    .line 135
    if-eqz p3, :cond_3

    .line 136
    .line 137
    iget-object p2, p2, Lwa2;->k:Ljava/lang/String;

    .line 138
    .line 139
    invoke-virtual {p1, p2, p3}, Lu71;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 140
    .line 141
    .line 142
    goto :goto_0

    .line 143
    :cond_4
    return-object p1
.end method

.method public final n(Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object p0, p0, Lzm1;->a:Ly02;

    .line 2
    .line 3
    iget-object v0, p0, Ly02;->w:Lfw1;

    .line 4
    .line 5
    invoke-static {v0}, Ly02;->i(Lgx1;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ly02;->t:Lmz;

    .line 9
    .line 10
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 14
    .line 15
    .line 16
    move-result-wide v1

    .line 17
    invoke-virtual {v0, p1, v1, v2}, Lfw1;->m(Ljava/lang/String;J)V

    .line 18
    .line 19
    .line 20
    return-void
.end method
