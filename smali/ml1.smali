.class public final Lml1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lxa0;
.implements Lya0;


# instance fields
.field public final b:Ljava/util/LinkedList;

.field public final c:Lu5;

.field public final d:Lb6;

.field public final e:Lxn0;

.field public final f:Ljava/util/HashSet;

.field public final g:Ljava/util/HashMap;

.field public final h:I

.field public final i:Lcm1;

.field public j:Z

.field public final k:Ljava/util/ArrayList;

.field public l:Loo;

.field public final synthetic m:Lza0;


# direct methods
.method public constructor <init>(Lza0;Lua0;)V
    .locals 9

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lml1;->m:Lza0;

    .line 5
    .line 6
    new-instance v0, Ljava/util/LinkedList;

    .line 7
    .line 8
    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lml1;->b:Ljava/util/LinkedList;

    .line 12
    .line 13
    new-instance v0, Ljava/util/HashSet;

    .line 14
    .line 15
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lml1;->f:Ljava/util/HashSet;

    .line 19
    .line 20
    new-instance v0, Ljava/util/HashMap;

    .line 21
    .line 22
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Lml1;->g:Ljava/util/HashMap;

    .line 26
    .line 27
    new-instance v0, Ljava/util/ArrayList;

    .line 28
    .line 29
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 30
    .line 31
    .line 32
    iput-object v0, p0, Lml1;->k:Ljava/util/ArrayList;

    .line 33
    .line 34
    const/4 v0, 0x0

    .line 35
    iput-object v0, p0, Lml1;->l:Loo;

    .line 36
    .line 37
    iget-object v1, p1, Lza0;->m:Lum1;

    .line 38
    .line 39
    invoke-virtual {v1}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 40
    .line 41
    .line 42
    move-result-object v4

    .line 43
    invoke-virtual {p2}, Lua0;->a()Lc9;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    new-instance v5, Li7;

    .line 48
    .line 49
    iget-object v2, v1, Lc9;->k:Ljava/lang/Object;

    .line 50
    .line 51
    check-cast v2, Lha;

    .line 52
    .line 53
    iget-object v3, v1, Lc9;->l:Ljava/lang/Object;

    .line 54
    .line 55
    check-cast v3, Ljava/lang/String;

    .line 56
    .line 57
    iget-object v1, v1, Lc9;->m:Ljava/lang/Object;

    .line 58
    .line 59
    check-cast v1, Ljava/lang/String;

    .line 60
    .line 61
    invoke-direct {v5, v2, v3, v1}, Li7;-><init>(Ljava/util/Set;Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    iget-object v1, p2, Lua0;->c:Ls7;

    .line 65
    .line 66
    iget-object v1, v1, Ls7;->k:Ljava/lang/Object;

    .line 67
    .line 68
    move-object v2, v1

    .line 69
    check-cast v2, Ldl1;

    .line 70
    .line 71
    iget-object v6, p2, Lua0;->d:Lt5;

    .line 72
    .line 73
    iget-object v3, p2, Lua0;->a:Landroid/content/Context;

    .line 74
    .line 75
    move-object v8, p0

    .line 76
    move-object v7, p0

    .line 77
    invoke-virtual/range {v2 .. v8}, Ldl1;->d(Landroid/content/Context;Landroid/os/Looper;Li7;Ljava/lang/Object;Lxa0;Lya0;)Lu5;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    iget-object v1, p2, Lua0;->b:Ljava/lang/String;

    .line 82
    .line 83
    if-eqz v1, :cond_0

    .line 84
    .line 85
    instance-of v2, p0, Ljg;

    .line 86
    .line 87
    if-eqz v2, :cond_0

    .line 88
    .line 89
    move-object v2, p0

    .line 90
    check-cast v2, Ljg;

    .line 91
    .line 92
    iput-object v1, v2, Ljg;->B:Ljava/lang/String;

    .line 93
    .line 94
    :cond_0
    if-eqz v1, :cond_2

    .line 95
    .line 96
    instance-of v1, p0, Lxp0;

    .line 97
    .line 98
    if-nez v1, :cond_1

    .line 99
    .line 100
    goto :goto_0

    .line 101
    :cond_1
    invoke-static {p0}, Loq;->q(Ljava/lang/Object;)V

    .line 102
    .line 103
    .line 104
    throw v0

    .line 105
    :cond_2
    :goto_0
    iput-object p0, v7, Lml1;->c:Lu5;

    .line 106
    .line 107
    iget-object v1, p2, Lua0;->e:Lb6;

    .line 108
    .line 109
    iput-object v1, v7, Lml1;->d:Lb6;

    .line 110
    .line 111
    new-instance v1, Lxn0;

    .line 112
    .line 113
    const/16 v2, 0x13

    .line 114
    .line 115
    invoke-direct {v1, v2}, Lxn0;-><init>(I)V

    .line 116
    .line 117
    .line 118
    iput-object v1, v7, Lml1;->e:Lxn0;

    .line 119
    .line 120
    iget v1, p2, Lua0;->g:I

    .line 121
    .line 122
    iput v1, v7, Lml1;->h:I

    .line 123
    .line 124
    invoke-interface {p0}, Lu5;->j()Z

    .line 125
    .line 126
    .line 127
    move-result p0

    .line 128
    if-eqz p0, :cond_3

    .line 129
    .line 130
    iget-object p0, p1, Lza0;->e:Landroid/content/Context;

    .line 131
    .line 132
    iget-object p1, p1, Lza0;->m:Lum1;

    .line 133
    .line 134
    new-instance v0, Lcm1;

    .line 135
    .line 136
    invoke-virtual {p2}, Lua0;->a()Lc9;

    .line 137
    .line 138
    .line 139
    move-result-object p2

    .line 140
    new-instance v1, Li7;

    .line 141
    .line 142
    iget-object v2, p2, Lc9;->k:Ljava/lang/Object;

    .line 143
    .line 144
    check-cast v2, Lha;

    .line 145
    .line 146
    iget-object v3, p2, Lc9;->l:Ljava/lang/Object;

    .line 147
    .line 148
    check-cast v3, Ljava/lang/String;

    .line 149
    .line 150
    iget-object p2, p2, Lc9;->m:Ljava/lang/Object;

    .line 151
    .line 152
    check-cast p2, Ljava/lang/String;

    .line 153
    .line 154
    invoke-direct {v1, v2, v3, p2}, Li7;-><init>(Ljava/util/Set;Ljava/lang/String;Ljava/lang/String;)V

    .line 155
    .line 156
    .line 157
    invoke-direct {v0, p0, p1, v1}, Lcm1;-><init>(Landroid/content/Context;Lum1;Li7;)V

    .line 158
    .line 159
    .line 160
    iput-object v0, v7, Lml1;->i:Lcm1;

    .line 161
    .line 162
    return-void

    .line 163
    :cond_3
    iput-object v0, v7, Lml1;->i:Lcm1;

    .line 164
    .line 165
    return-void
.end method


# virtual methods
.method public final a(I)V
    .locals 3

    .line 1
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lml1;->m:Lza0;

    .line 6
    .line 7
    iget-object v1, v1, Lza0;->m:Lum1;

    .line 8
    .line 9
    invoke-virtual {v1}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    if-ne v0, v2, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Lml1;->i(I)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    new-instance v0, Lkl1;

    .line 20
    .line 21
    invoke-direct {v0, p0, p1}, Lkl1;-><init>(Lml1;I)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final b(Loo;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Lml1;->o(Loo;Ljava/lang/RuntimeException;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final c([Lu20;)Lu20;
    .locals 8

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_5

    .line 3
    .line 4
    array-length v1, p1

    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    goto :goto_3

    .line 8
    :cond_0
    iget-object p0, p0, Lml1;->c:Lu5;

    .line 9
    .line 10
    invoke-interface {p0}, Lu5;->e()[Lu20;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    const/4 v1, 0x0

    .line 15
    if-nez p0, :cond_1

    .line 16
    .line 17
    new-array p0, v1, [Lu20;

    .line 18
    .line 19
    :cond_1
    new-instance v2, Lda;

    .line 20
    .line 21
    array-length v3, p0

    .line 22
    invoke-direct {v2, v3}, Lu71;-><init>(I)V

    .line 23
    .line 24
    .line 25
    move v3, v1

    .line 26
    :goto_0
    array-length v4, p0

    .line 27
    if-ge v3, v4, :cond_2

    .line 28
    .line 29
    aget-object v4, p0, v3

    .line 30
    .line 31
    iget-object v5, v4, Lu20;->j:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {v4}, Lu20;->b()J

    .line 34
    .line 35
    .line 36
    move-result-wide v6

    .line 37
    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    invoke-virtual {v2, v5, v4}, Lu71;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    add-int/lit8 v3, v3, 0x1

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_2
    array-length p0, p1

    .line 48
    :goto_1
    if-ge v1, p0, :cond_5

    .line 49
    .line 50
    aget-object v3, p1, v1

    .line 51
    .line 52
    iget-object v4, v3, Lu20;->j:Ljava/lang/String;

    .line 53
    .line 54
    invoke-virtual {v2, v4, v0}, Lu71;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v4

    .line 58
    check-cast v4, Ljava/lang/Long;

    .line 59
    .line 60
    if-eqz v4, :cond_4

    .line 61
    .line 62
    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    .line 63
    .line 64
    .line 65
    move-result-wide v4

    .line 66
    invoke-virtual {v3}, Lu20;->b()J

    .line 67
    .line 68
    .line 69
    move-result-wide v6

    .line 70
    cmp-long v4, v4, v6

    .line 71
    .line 72
    if-gez v4, :cond_3

    .line 73
    .line 74
    goto :goto_2

    .line 75
    :cond_3
    add-int/lit8 v1, v1, 0x1

    .line 76
    .line 77
    goto :goto_1

    .line 78
    :cond_4
    :goto_2
    return-object v3

    .line 79
    :cond_5
    :goto_3
    return-object v0
.end method

.method public final d(Loo;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lml1;->f:Ljava/util/HashSet;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    if-eqz v2, :cond_2

    .line 12
    .line 13
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    sget-object v0, Loo;->o:Loo;

    .line 20
    .line 21
    invoke-static {p1, v0}, Lkp1;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    iget-object p0, p0, Lml1;->c:Lu5;

    .line 28
    .line 29
    invoke-interface {p0}, Lu5;->f()V

    .line 30
    .line 31
    .line 32
    :cond_0
    const/4 p0, 0x0

    .line 33
    throw p0

    .line 34
    :cond_1
    invoke-static {}, Lz0;->a()V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_2
    invoke-virtual {v0}, Ljava/util/HashSet;->clear()V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public final e(Lcom/google/android/gms/common/api/Status;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lml1;->m:Lza0;

    .line 2
    .line 3
    iget-object v0, v0, Lza0;->m:Lum1;

    .line 4
    .line 5
    invoke-static {v0}, Lbh;->d(Landroid/os/Handler;)V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {p0, p1, v0, v1}, Lml1;->f(Lcom/google/android/gms/common/api/Status;Ljava/lang/Exception;Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final f(Lcom/google/android/gms/common/api/Status;Ljava/lang/Exception;Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Lml1;->m:Lza0;

    .line 2
    .line 3
    iget-object v0, v0, Lza0;->m:Lum1;

    .line 4
    .line 5
    invoke-static {v0}, Lbh;->d(Landroid/os/Handler;)V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    const/4 v1, 0x0

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    move v2, v1

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    move v2, v0

    .line 15
    :goto_0
    if-eqz p2, :cond_1

    .line 16
    .line 17
    move v0, v1

    .line 18
    :cond_1
    if-eq v2, v0, :cond_6

    .line 19
    .line 20
    iget-object p0, p0, Lml1;->b:Ljava/util/LinkedList;

    .line 21
    .line 22
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    :cond_2
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_5

    .line 31
    .line 32
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    check-cast v0, Lul1;

    .line 37
    .line 38
    if-eqz p3, :cond_3

    .line 39
    .line 40
    iget v1, v0, Lul1;->a:I

    .line 41
    .line 42
    const/4 v2, 0x2

    .line 43
    if-ne v1, v2, :cond_2

    .line 44
    .line 45
    :cond_3
    if-eqz p1, :cond_4

    .line 46
    .line 47
    invoke-virtual {v0, p1}, Lul1;->c(Lcom/google/android/gms/common/api/Status;)V

    .line 48
    .line 49
    .line 50
    goto :goto_2

    .line 51
    :cond_4
    invoke-virtual {v0, p2}, Lul1;->d(Ljava/lang/Exception;)V

    .line 52
    .line 53
    .line 54
    :goto_2
    invoke-interface {p0}, Ljava/util/Iterator;->remove()V

    .line 55
    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_5
    return-void

    .line 59
    :cond_6
    const-string p0, "Status XOR exception should be null"

    .line 60
    .line 61
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public final g()V
    .locals 6

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    iget-object v1, p0, Lml1;->b:Ljava/util/LinkedList;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    const/4 v3, 0x0

    .line 13
    :goto_0
    if-ge v3, v2, :cond_2

    .line 14
    .line 15
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v4

    .line 19
    check-cast v4, Lul1;

    .line 20
    .line 21
    iget-object v5, p0, Lml1;->c:Lu5;

    .line 22
    .line 23
    invoke-interface {v5}, Lu5;->isConnected()Z

    .line 24
    .line 25
    .line 26
    move-result v5

    .line 27
    if-nez v5, :cond_0

    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_0
    invoke-virtual {p0, v4}, Lml1;->k(Lul1;)Z

    .line 31
    .line 32
    .line 33
    move-result v5

    .line 34
    if-eqz v5, :cond_1

    .line 35
    .line 36
    invoke-virtual {v1, v4}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    :cond_1
    add-int/lit8 v3, v3, 0x1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_2
    :goto_1
    return-void
.end method

.method public final h()V
    .locals 7

    .line 1
    iget-object v0, p0, Lml1;->c:Lu5;

    .line 2
    .line 3
    iget-object v1, p0, Lml1;->m:Lza0;

    .line 4
    .line 5
    iget-object v2, v1, Lza0;->m:Lum1;

    .line 6
    .line 7
    invoke-static {v2}, Lbh;->d(Landroid/os/Handler;)V

    .line 8
    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    iput-object v2, p0, Lml1;->l:Loo;

    .line 12
    .line 13
    sget-object v2, Loo;->o:Loo;

    .line 14
    .line 15
    invoke-virtual {p0, v2}, Lml1;->d(Loo;)V

    .line 16
    .line 17
    .line 18
    iget-object v1, v1, Lza0;->m:Lum1;

    .line 19
    .line 20
    iget-boolean v2, p0, Lml1;->j:Z

    .line 21
    .line 22
    if-eqz v2, :cond_0

    .line 23
    .line 24
    const/16 v2, 0xb

    .line 25
    .line 26
    iget-object v3, p0, Lml1;->d:Lb6;

    .line 27
    .line 28
    invoke-virtual {v1, v2, v3}, Landroid/os/Handler;->removeMessages(ILjava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    const/16 v2, 0x9

    .line 32
    .line 33
    invoke-virtual {v1, v2, v3}, Landroid/os/Handler;->removeMessages(ILjava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    const/4 v1, 0x0

    .line 37
    iput-boolean v1, p0, Lml1;->j:Z

    .line 38
    .line 39
    :cond_0
    iget-object v1, p0, Lml1;->g:Ljava/util/HashMap;

    .line 40
    .line 41
    invoke-virtual {v1}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    if-eqz v2, :cond_2

    .line 54
    .line 55
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    check-cast v2, Lyl1;

    .line 60
    .line 61
    iget-object v3, v2, Lyl1;->a:Lvx;

    .line 62
    .line 63
    iget-object v3, v3, Lvx;->c:Ljava/io/Serializable;

    .line 64
    .line 65
    check-cast v3, [Lu20;

    .line 66
    .line 67
    invoke-virtual {p0, v3}, Lml1;->c([Lu20;)Lu20;

    .line 68
    .line 69
    .line 70
    move-result-object v3

    .line 71
    if-eqz v3, :cond_1

    .line 72
    .line 73
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    .line 74
    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_1
    :try_start_0
    iget-object v2, v2, Lyl1;->a:Lvx;

    .line 78
    .line 79
    new-instance v3, Ljd2;

    .line 80
    .line 81
    invoke-direct {v3}, Ljd2;-><init>()V

    .line 82
    .line 83
    .line 84
    iget-object v2, v2, Lvx;->d:Ljava/lang/Object;

    .line 85
    .line 86
    check-cast v2, Lai;

    .line 87
    .line 88
    iget-object v2, v2, Lai;->b:Ljava/lang/Object;

    .line 89
    .line 90
    check-cast v2, Lc9;

    .line 91
    .line 92
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 93
    .line 94
    .line 95
    move-object v3, v0

    .line 96
    check-cast v3, Lf42;

    .line 97
    .line 98
    invoke-virtual {v3}, Ljg;->s()Landroid/os/IInterface;

    .line 99
    .line 100
    .line 101
    move-result-object v3

    .line 102
    check-cast v3, Ld42;

    .line 103
    .line 104
    new-instance v4, Lg32;

    .line 105
    .line 106
    iget-object v5, v2, Lc9;->k:Ljava/lang/Object;

    .line 107
    .line 108
    check-cast v5, Lu32;

    .line 109
    .line 110
    iget-object v6, v2, Lc9;->m:Ljava/lang/Object;

    .line 111
    .line 112
    check-cast v6, Lm4;

    .line 113
    .line 114
    invoke-direct {v4, v5, v6}, Lg32;-><init>(Lu32;Lm4;)V

    .line 115
    .line 116
    .line 117
    iget-object v2, v2, Lc9;->l:Ljava/lang/Object;

    .line 118
    .line 119
    check-cast v2, Ljava/lang/String;

    .line 120
    .line 121
    invoke-virtual {v3}, Lfl1;->F()Landroid/os/Parcel;

    .line 122
    .line 123
    .line 124
    move-result-object v5

    .line 125
    invoke-virtual {v5, v2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    invoke-static {v5, v4}, Lwu1;->c(Landroid/os/Parcel;Landroid/os/IInterface;)V

    .line 129
    .line 130
    .line 131
    const/16 v2, 0x1c

    .line 132
    .line 133
    invoke-virtual {v3, v5, v2}, Lfl1;->G(Landroid/os/Parcel;I)V
    :try_end_0
    .catch Landroid/os/DeadObjectException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 134
    .line 135
    .line 136
    goto :goto_0

    .line 137
    :catch_0
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    .line 138
    .line 139
    .line 140
    goto :goto_0

    .line 141
    :catch_1
    const/4 v1, 0x3

    .line 142
    invoke-virtual {p0, v1}, Lml1;->a(I)V

    .line 143
    .line 144
    .line 145
    const-string v1, "DeadObjectException thrown while calling register listener method."

    .line 146
    .line 147
    invoke-interface {v0, v1}, Lu5;->b(Ljava/lang/String;)V

    .line 148
    .line 149
    .line 150
    :cond_2
    invoke-virtual {p0}, Lml1;->g()V

    .line 151
    .line 152
    .line 153
    invoke-virtual {p0}, Lml1;->j()V

    .line 154
    .line 155
    .line 156
    return-void
.end method

.method public final i(I)V
    .locals 8

    .line 1
    iget-object v0, p0, Lml1;->m:Lza0;

    .line 2
    .line 3
    iget-object v1, v0, Lza0;->m:Lum1;

    .line 4
    .line 5
    iget-object v2, v0, Lza0;->m:Lum1;

    .line 6
    .line 7
    invoke-static {v2}, Lbh;->d(Landroid/os/Handler;)V

    .line 8
    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    iput-object v2, p0, Lml1;->l:Loo;

    .line 12
    .line 13
    const/4 v3, 0x1

    .line 14
    iput-boolean v3, p0, Lml1;->j:Z

    .line 15
    .line 16
    iget-object v4, p0, Lml1;->c:Lu5;

    .line 17
    .line 18
    invoke-interface {v4}, Lu5;->h()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v4

    .line 22
    iget-object v5, p0, Lml1;->e:Lxn0;

    .line 23
    .line 24
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 25
    .line 26
    .line 27
    new-instance v6, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    const-string v7, "The connection to Google Play services was lost"

    .line 30
    .line 31
    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    if-ne p1, v3, :cond_0

    .line 35
    .line 36
    const-string p1, " due to service disconnection."

    .line 37
    .line 38
    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    const/4 v7, 0x3

    .line 43
    if-ne p1, v7, :cond_1

    .line 44
    .line 45
    const-string p1, " due to dead object exception."

    .line 46
    .line 47
    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    :cond_1
    :goto_0
    if-eqz v4, :cond_2

    .line 51
    .line 52
    const-string p1, " Last reason for disconnect: "

    .line 53
    .line 54
    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    :cond_2
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    new-instance v4, Lcom/google/android/gms/common/api/Status;

    .line 65
    .line 66
    const/16 v6, 0x14

    .line 67
    .line 68
    invoke-direct {v4, v6, p1, v2, v2}, Lcom/google/android/gms/common/api/Status;-><init>(ILjava/lang/String;Landroid/app/PendingIntent;Loo;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {v5, v3, v4}, Lxn0;->y(ZLcom/google/android/gms/common/api/Status;)V

    .line 72
    .line 73
    .line 74
    const/16 p1, 0x9

    .line 75
    .line 76
    iget-object v2, p0, Lml1;->d:Lb6;

    .line 77
    .line 78
    invoke-static {v1, p1, v2}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    const-wide/16 v3, 0x1388

    .line 83
    .line 84
    invoke-virtual {v1, p1, v3, v4}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 85
    .line 86
    .line 87
    const/16 p1, 0xb

    .line 88
    .line 89
    invoke-static {v1, p1, v2}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    const-wide/32 v2, 0x1d4c0

    .line 94
    .line 95
    .line 96
    invoke-virtual {v1, p1, v2, v3}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 97
    .line 98
    .line 99
    iget-object p1, v0, Lza0;->g:Lmd1;

    .line 100
    .line 101
    iget-object p1, p1, Lmd1;->k:Ljava/lang/Object;

    .line 102
    .line 103
    check-cast p1, Landroid/util/SparseIntArray;

    .line 104
    .line 105
    invoke-virtual {p1}, Landroid/util/SparseIntArray;->clear()V

    .line 106
    .line 107
    .line 108
    iget-object p0, p0, Lml1;->g:Ljava/util/HashMap;

    .line 109
    .line 110
    invoke-virtual {p0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 119
    .line 120
    .line 121
    move-result p1

    .line 122
    if-eqz p1, :cond_3

    .line 123
    .line 124
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    check-cast p1, Lyl1;

    .line 129
    .line 130
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 131
    .line 132
    .line 133
    sget-object p1, Lzl1;->j:Lzl1;

    .line 134
    .line 135
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 136
    .line 137
    .line 138
    goto :goto_1

    .line 139
    :cond_3
    return-void
.end method

.method public final j()V
    .locals 4

    .line 1
    iget-object v0, p0, Lml1;->m:Lza0;

    .line 2
    .line 3
    iget-object v1, v0, Lza0;->m:Lum1;

    .line 4
    .line 5
    const/16 v2, 0xc

    .line 6
    .line 7
    iget-object p0, p0, Lml1;->d:Lb6;

    .line 8
    .line 9
    invoke-virtual {v1, v2, p0}, Landroid/os/Handler;->removeMessages(ILjava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v1, v2, p0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    iget-wide v2, v0, Lza0;->a:J

    .line 17
    .line 18
    invoke-virtual {v1, p0, v2, v3}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final k(Lul1;)Z
    .locals 5

    .line 1
    const-string v0, "DeadObjectException thrown while running ApiCallRunner."

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    iget-object v2, p0, Lml1;->e:Lxn0;

    .line 7
    .line 8
    iget-object v3, p0, Lml1;->c:Lu5;

    .line 9
    .line 10
    invoke-interface {v3}, Lu5;->j()Z

    .line 11
    .line 12
    .line 13
    move-result v4

    .line 14
    invoke-virtual {p1, v2, v4}, Lul1;->f(Lxn0;Z)V

    .line 15
    .line 16
    .line 17
    :try_start_0
    invoke-virtual {p1, p0}, Lul1;->e(Lml1;)V
    :try_end_0
    .catch Landroid/os/DeadObjectException; {:try_start_0 .. :try_end_0} :catch_0

    .line 18
    .line 19
    .line 20
    return v1

    .line 21
    :catch_0
    invoke-virtual {p0, v1}, Lml1;->a(I)V

    .line 22
    .line 23
    .line 24
    invoke-interface {v3, v0}, Lu5;->b(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return v1

    .line 28
    :cond_0
    invoke-virtual {p1, p0}, Lul1;->b(Lml1;)[Lu20;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    invoke-virtual {p0, v2}, Lml1;->c([Lu20;)Lu20;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    if-nez v2, :cond_1

    .line 37
    .line 38
    iget-object v2, p0, Lml1;->e:Lxn0;

    .line 39
    .line 40
    iget-object v3, p0, Lml1;->c:Lu5;

    .line 41
    .line 42
    invoke-interface {v3}, Lu5;->j()Z

    .line 43
    .line 44
    .line 45
    move-result v4

    .line 46
    invoke-virtual {p1, v2, v4}, Lul1;->f(Lxn0;Z)V

    .line 47
    .line 48
    .line 49
    :try_start_1
    invoke-virtual {p1, p0}, Lul1;->e(Lml1;)V
    :try_end_1
    .catch Landroid/os/DeadObjectException; {:try_start_1 .. :try_end_1} :catch_1

    .line 50
    .line 51
    .line 52
    return v1

    .line 53
    :catch_1
    invoke-virtual {p0, v1}, Lml1;->a(I)V

    .line 54
    .line 55
    .line 56
    invoke-interface {v3, v0}, Lu5;->b(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    return v1

    .line 60
    :cond_1
    iget-object v0, p0, Lml1;->c:Lu5;

    .line 61
    .line 62
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Lml1;->m:Lza0;

    .line 66
    .line 67
    iget-boolean v0, v0, Lza0;->n:Z

    .line 68
    .line 69
    if-eqz v0, :cond_4

    .line 70
    .line 71
    invoke-virtual {p1, p0}, Lul1;->a(Lml1;)Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-eqz v0, :cond_4

    .line 76
    .line 77
    iget-object p1, p0, Lml1;->d:Lb6;

    .line 78
    .line 79
    new-instance v0, Lnl1;

    .line 80
    .line 81
    invoke-direct {v0, p1, v2}, Lnl1;-><init>(Lb6;Lu20;)V

    .line 82
    .line 83
    .line 84
    iget-object p1, p0, Lml1;->k:Ljava/util/ArrayList;

    .line 85
    .line 86
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    .line 87
    .line 88
    .line 89
    move-result p1

    .line 90
    iget-object v1, p0, Lml1;->k:Ljava/util/ArrayList;

    .line 91
    .line 92
    const-wide/16 v2, 0x1388

    .line 93
    .line 94
    const/16 v4, 0xf

    .line 95
    .line 96
    if-ltz p1, :cond_2

    .line 97
    .line 98
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    check-cast p1, Lnl1;

    .line 103
    .line 104
    iget-object v0, p0, Lml1;->m:Lza0;

    .line 105
    .line 106
    iget-object v0, v0, Lza0;->m:Lum1;

    .line 107
    .line 108
    invoke-virtual {v0, v4, p1}, Landroid/os/Handler;->removeMessages(ILjava/lang/Object;)V

    .line 109
    .line 110
    .line 111
    iget-object p0, p0, Lml1;->m:Lza0;

    .line 112
    .line 113
    iget-object p0, p0, Lza0;->m:Lum1;

    .line 114
    .line 115
    invoke-static {p0, v4, p1}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    invoke-virtual {p0, p1, v2, v3}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 120
    .line 121
    .line 122
    goto :goto_0

    .line 123
    :cond_2
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 124
    .line 125
    .line 126
    iget-object p1, p0, Lml1;->m:Lza0;

    .line 127
    .line 128
    iget-object p1, p1, Lza0;->m:Lum1;

    .line 129
    .line 130
    invoke-static {p1, v4, v0}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    invoke-virtual {p1, v1, v2, v3}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 135
    .line 136
    .line 137
    iget-object p1, p0, Lml1;->m:Lza0;

    .line 138
    .line 139
    iget-object p1, p1, Lza0;->m:Lum1;

    .line 140
    .line 141
    const/16 v1, 0x10

    .line 142
    .line 143
    invoke-static {p1, v1, v0}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    const-wide/32 v1, 0x1d4c0

    .line 148
    .line 149
    .line 150
    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 151
    .line 152
    .line 153
    new-instance p1, Loo;

    .line 154
    .line 155
    const/4 v0, 0x2

    .line 156
    const/4 v1, 0x0

    .line 157
    invoke-direct {p1, v0, v1, v1}, Loo;-><init>(ILandroid/app/PendingIntent;Ljava/lang/String;)V

    .line 158
    .line 159
    .line 160
    invoke-virtual {p0, p1}, Lml1;->l(Loo;)Z

    .line 161
    .line 162
    .line 163
    move-result v0

    .line 164
    if-nez v0, :cond_3

    .line 165
    .line 166
    iget-object v0, p0, Lml1;->m:Lza0;

    .line 167
    .line 168
    iget p0, p0, Lml1;->h:I

    .line 169
    .line 170
    invoke-virtual {v0, p1, p0}, Lza0;->b(Loo;I)Z

    .line 171
    .line 172
    .line 173
    :cond_3
    :goto_0
    const/4 p0, 0x0

    .line 174
    return p0

    .line 175
    :cond_4
    new-instance p0, Lof1;

    .line 176
    .line 177
    invoke-direct {p0, v2}, Lof1;-><init>(Lu20;)V

    .line 178
    .line 179
    .line 180
    invoke-virtual {p1, p0}, Lul1;->d(Ljava/lang/Exception;)V

    .line 181
    .line 182
    .line 183
    return v1
.end method

.method public final l(Loo;)Z
    .locals 0

    .line 1
    sget-object p0, Lza0;->q:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    monitor-exit p0

    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :catchall_0
    move-exception p1

    .line 8
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 9
    throw p1
.end method

.method public final m()V
    .locals 12

    .line 1
    iget-object v0, p0, Lml1;->m:Lza0;

    .line 2
    .line 3
    iget-object v1, v0, Lza0;->m:Lum1;

    .line 4
    .line 5
    invoke-static {v1}, Lbh;->d(Landroid/os/Handler;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lml1;->c:Lu5;

    .line 9
    .line 10
    invoke-interface {v1}, Lu5;->isConnected()Z

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    if-nez v2, :cond_a

    .line 15
    .line 16
    invoke-interface {v1}, Lu5;->d()Z

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    if-eqz v2, :cond_0

    .line 21
    .line 22
    goto/16 :goto_6

    .line 23
    .line 24
    :cond_0
    const/16 v2, 0xa

    .line 25
    .line 26
    const/4 v3, 0x0

    .line 27
    :try_start_0
    iget-object v4, v0, Lza0;->g:Lmd1;

    .line 28
    .line 29
    iget-object v5, v0, Lza0;->e:Landroid/content/Context;

    .line 30
    .line 31
    iget-object v6, v4, Lmd1;->k:Ljava/lang/Object;

    .line 32
    .line 33
    check-cast v6, Landroid/util/SparseIntArray;

    .line 34
    .line 35
    invoke-static {v5}, Lbh;->h(Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    invoke-interface {v1}, Lu5;->c()I

    .line 39
    .line 40
    .line 41
    move-result v7

    .line 42
    iget-object v4, v4, Lmd1;->k:Ljava/lang/Object;

    .line 43
    .line 44
    check-cast v4, Landroid/util/SparseIntArray;

    .line 45
    .line 46
    const/4 v8, -0x1

    .line 47
    invoke-virtual {v4, v7, v8}, Landroid/util/SparseIntArray;->get(II)I

    .line 48
    .line 49
    .line 50
    move-result v4

    .line 51
    if-eq v4, v8, :cond_1

    .line 52
    .line 53
    goto :goto_2

    .line 54
    :cond_1
    const/4 v4, 0x0

    .line 55
    move v9, v4

    .line 56
    :goto_0
    invoke-virtual {v6}, Landroid/util/SparseIntArray;->size()I

    .line 57
    .line 58
    .line 59
    move-result v10

    .line 60
    if-ge v9, v10, :cond_3

    .line 61
    .line 62
    invoke-virtual {v6, v9}, Landroid/util/SparseIntArray;->keyAt(I)I

    .line 63
    .line 64
    .line 65
    move-result v10

    .line 66
    if-le v10, v7, :cond_2

    .line 67
    .line 68
    invoke-virtual {v6, v10}, Landroid/util/SparseIntArray;->get(I)I

    .line 69
    .line 70
    .line 71
    move-result v10

    .line 72
    if-nez v10, :cond_2

    .line 73
    .line 74
    goto :goto_1

    .line 75
    :cond_2
    add-int/lit8 v9, v9, 0x1

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_3
    move v4, v8

    .line 79
    :goto_1
    if-ne v4, v8, :cond_4

    .line 80
    .line 81
    sget-object v4, Lva0;->d:Lva0;

    .line 82
    .line 83
    invoke-virtual {v4, v5, v7}, Lwa0;->b(Landroid/content/Context;I)I

    .line 84
    .line 85
    .line 86
    move-result v4

    .line 87
    :cond_4
    invoke-virtual {v6, v7, v4}, Landroid/util/SparseIntArray;->put(II)V

    .line 88
    .line 89
    .line 90
    :goto_2
    if-eqz v4, :cond_5

    .line 91
    .line 92
    new-instance v0, Loo;

    .line 93
    .line 94
    invoke-direct {v0, v4, v3, v3}, Loo;-><init>(ILandroid/app/PendingIntent;Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {v0}, Loo;->toString()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    invoke-virtual {p0, v0, v3}, Lml1;->o(Loo;Ljava/lang/RuntimeException;)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 101
    .line 102
    .line 103
    return-void

    .line 104
    :catch_0
    move-exception v0

    .line 105
    goto :goto_5

    .line 106
    :cond_5
    new-instance v4, Lpl1;

    .line 107
    .line 108
    iget-object v5, p0, Lml1;->d:Lb6;

    .line 109
    .line 110
    invoke-direct {v4, v0, v1, v5}, Lpl1;-><init>(Lza0;Lu5;Lb6;)V

    .line 111
    .line 112
    .line 113
    invoke-interface {v1}, Lu5;->j()Z

    .line 114
    .line 115
    .line 116
    move-result v0

    .line 117
    if-eqz v0, :cond_9

    .line 118
    .line 119
    iget-object v10, p0, Lml1;->i:Lcm1;

    .line 120
    .line 121
    invoke-static {v10}, Lbh;->h(Ljava/lang/Object;)V

    .line 122
    .line 123
    .line 124
    iget-object v0, v10, Lcm1;->d:Landroid/os/Handler;

    .line 125
    .line 126
    iget-object v8, v10, Lcm1;->g:Li7;

    .line 127
    .line 128
    iget-object v5, v10, Lcm1;->h:Ls71;

    .line 129
    .line 130
    if-eqz v5, :cond_6

    .line 131
    .line 132
    invoke-virtual {v5}, Ljg;->n()V

    .line 133
    .line 134
    .line 135
    :cond_6
    invoke-static {v10}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 136
    .line 137
    .line 138
    move-result v5

    .line 139
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 140
    .line 141
    .line 142
    move-result-object v5

    .line 143
    iput-object v5, v8, Li7;->o:Ljava/lang/Object;

    .line 144
    .line 145
    iget-object v5, v10, Lcm1;->e:Ldl1;

    .line 146
    .line 147
    iget-object v6, v10, Lcm1;->c:Landroid/content/Context;

    .line 148
    .line 149
    invoke-virtual {v0}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 150
    .line 151
    .line 152
    move-result-object v7

    .line 153
    iget-object v9, v8, Li7;->n:Ljava/lang/Object;

    .line 154
    .line 155
    check-cast v9, Lt71;

    .line 156
    .line 157
    move-object v11, v10

    .line 158
    invoke-virtual/range {v5 .. v11}, Ldl1;->d(Landroid/content/Context;Landroid/os/Looper;Li7;Ljava/lang/Object;Lxa0;Lya0;)Lu5;

    .line 159
    .line 160
    .line 161
    move-result-object v5

    .line 162
    check-cast v5, Ls71;

    .line 163
    .line 164
    iput-object v5, v10, Lcm1;->h:Ls71;

    .line 165
    .line 166
    iput-object v4, v10, Lcm1;->i:Lpl1;

    .line 167
    .line 168
    iget-object v5, v10, Lcm1;->f:Ljava/util/Set;

    .line 169
    .line 170
    if-eqz v5, :cond_8

    .line 171
    .line 172
    invoke-interface {v5}, Ljava/util/Set;->isEmpty()Z

    .line 173
    .line 174
    .line 175
    move-result v5

    .line 176
    if-eqz v5, :cond_7

    .line 177
    .line 178
    goto :goto_3

    .line 179
    :cond_7
    iget-object v0, v10, Lcm1;->h:Ls71;

    .line 180
    .line 181
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 182
    .line 183
    .line 184
    new-instance v5, Lpa0;

    .line 185
    .line 186
    invoke-direct {v5, v0}, Lpa0;-><init>(Ljg;)V

    .line 187
    .line 188
    .line 189
    invoke-virtual {v0, v5}, Ljg;->g(Lig;)V

    .line 190
    .line 191
    .line 192
    goto :goto_4

    .line 193
    :cond_8
    :goto_3
    new-instance v5, Lam1;

    .line 194
    .line 195
    invoke-direct {v5, v10}, Lam1;-><init>(Lcm1;)V

    .line 196
    .line 197
    .line 198
    invoke-virtual {v0, v5}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 199
    .line 200
    .line 201
    :cond_9
    :goto_4
    :try_start_1
    invoke-interface {v1, v4}, Lu5;->g(Lig;)V
    :try_end_1
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_1} :catch_1

    .line 202
    .line 203
    .line 204
    return-void

    .line 205
    :catch_1
    move-exception v0

    .line 206
    new-instance v1, Loo;

    .line 207
    .line 208
    invoke-direct {v1, v2, v3, v3}, Loo;-><init>(ILandroid/app/PendingIntent;Ljava/lang/String;)V

    .line 209
    .line 210
    .line 211
    invoke-virtual {p0, v1, v0}, Lml1;->o(Loo;Ljava/lang/RuntimeException;)V

    .line 212
    .line 213
    .line 214
    return-void

    .line 215
    :goto_5
    new-instance v1, Loo;

    .line 216
    .line 217
    invoke-direct {v1, v2, v3, v3}, Loo;-><init>(ILandroid/app/PendingIntent;Ljava/lang/String;)V

    .line 218
    .line 219
    .line 220
    invoke-virtual {p0, v1, v0}, Lml1;->o(Loo;Ljava/lang/RuntimeException;)V

    .line 221
    .line 222
    .line 223
    :cond_a
    :goto_6
    return-void
.end method

.method public final n(Lul1;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lml1;->m:Lza0;

    .line 2
    .line 3
    iget-object v0, v0, Lza0;->m:Lum1;

    .line 4
    .line 5
    invoke-static {v0}, Lbh;->d(Landroid/os/Handler;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lml1;->c:Lu5;

    .line 9
    .line 10
    invoke-interface {v0}, Lu5;->isConnected()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iget-object v1, p0, Lml1;->b:Ljava/util/LinkedList;

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Lml1;->k(Lul1;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    invoke-virtual {p0}, Lml1;->j()V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    invoke-virtual {v1, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    invoke-virtual {v1, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Lml1;->l:Loo;

    .line 36
    .line 37
    if-eqz p1, :cond_2

    .line 38
    .line 39
    iget v0, p1, Loo;->k:I

    .line 40
    .line 41
    if-eqz v0, :cond_2

    .line 42
    .line 43
    iget-object v0, p1, Loo;->l:Landroid/app/PendingIntent;

    .line 44
    .line 45
    if-eqz v0, :cond_2

    .line 46
    .line 47
    const/4 v0, 0x0

    .line 48
    invoke-virtual {p0, p1, v0}, Lml1;->o(Loo;Ljava/lang/RuntimeException;)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_2
    invoke-virtual {p0}, Lml1;->m()V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public final o(Loo;Ljava/lang/RuntimeException;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lml1;->m:Lza0;

    .line 2
    .line 3
    iget-object v0, v0, Lza0;->m:Lum1;

    .line 4
    .line 5
    invoke-static {v0}, Lbh;->d(Landroid/os/Handler;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lml1;->i:Lcm1;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, v0, Lcm1;->h:Ls71;

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {v0}, Ljg;->n()V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Lml1;->m:Lza0;

    .line 20
    .line 21
    iget-object v0, v0, Lza0;->m:Lum1;

    .line 22
    .line 23
    invoke-static {v0}, Lbh;->d(Landroid/os/Handler;)V

    .line 24
    .line 25
    .line 26
    const/4 v0, 0x0

    .line 27
    iput-object v0, p0, Lml1;->l:Loo;

    .line 28
    .line 29
    iget-object v1, p0, Lml1;->m:Lza0;

    .line 30
    .line 31
    iget-object v1, v1, Lza0;->g:Lmd1;

    .line 32
    .line 33
    iget-object v1, v1, Lmd1;->k:Ljava/lang/Object;

    .line 34
    .line 35
    check-cast v1, Landroid/util/SparseIntArray;

    .line 36
    .line 37
    invoke-virtual {v1}, Landroid/util/SparseIntArray;->clear()V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0, p1}, Lml1;->d(Loo;)V

    .line 41
    .line 42
    .line 43
    iget-object v1, p0, Lml1;->c:Lu5;

    .line 44
    .line 45
    instance-of v1, v1, Lsm1;

    .line 46
    .line 47
    const/4 v2, 0x1

    .line 48
    if-eqz v1, :cond_1

    .line 49
    .line 50
    iget v1, p1, Loo;->k:I

    .line 51
    .line 52
    const/16 v3, 0x18

    .line 53
    .line 54
    if-eq v1, v3, :cond_1

    .line 55
    .line 56
    iget-object v1, p0, Lml1;->m:Lza0;

    .line 57
    .line 58
    iput-boolean v2, v1, Lza0;->b:Z

    .line 59
    .line 60
    iget-object v1, v1, Lza0;->m:Lum1;

    .line 61
    .line 62
    const/16 v3, 0x13

    .line 63
    .line 64
    invoke-virtual {v1, v3}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    const-wide/32 v4, 0x493e0

    .line 69
    .line 70
    .line 71
    invoke-virtual {v1, v3, v4, v5}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 72
    .line 73
    .line 74
    :cond_1
    iget v1, p1, Loo;->k:I

    .line 75
    .line 76
    const/4 v3, 0x4

    .line 77
    if-ne v1, v3, :cond_2

    .line 78
    .line 79
    sget-object p1, Lza0;->p:Lcom/google/android/gms/common/api/Status;

    .line 80
    .line 81
    invoke-virtual {p0, p1}, Lml1;->e(Lcom/google/android/gms/common/api/Status;)V

    .line 82
    .line 83
    .line 84
    return-void

    .line 85
    :cond_2
    iget-object v1, p0, Lml1;->b:Ljava/util/LinkedList;

    .line 86
    .line 87
    invoke-interface {v1}, Ljava/util/Collection;->isEmpty()Z

    .line 88
    .line 89
    .line 90
    move-result v1

    .line 91
    if-eqz v1, :cond_3

    .line 92
    .line 93
    iput-object p1, p0, Lml1;->l:Loo;

    .line 94
    .line 95
    return-void

    .line 96
    :cond_3
    iget-object v1, p0, Lml1;->m:Lza0;

    .line 97
    .line 98
    if-eqz p2, :cond_4

    .line 99
    .line 100
    iget-object p1, v1, Lza0;->m:Lum1;

    .line 101
    .line 102
    invoke-static {p1}, Lbh;->d(Landroid/os/Handler;)V

    .line 103
    .line 104
    .line 105
    const/4 p1, 0x0

    .line 106
    invoke-virtual {p0, v0, p2, p1}, Lml1;->f(Lcom/google/android/gms/common/api/Status;Ljava/lang/Exception;Z)V

    .line 107
    .line 108
    .line 109
    return-void

    .line 110
    :cond_4
    iget-boolean p2, v1, Lza0;->n:Z

    .line 111
    .line 112
    iget-object v1, p0, Lml1;->d:Lb6;

    .line 113
    .line 114
    if-eqz p2, :cond_9

    .line 115
    .line 116
    invoke-static {v1, p1}, Lza0;->c(Lb6;Loo;)Lcom/google/android/gms/common/api/Status;

    .line 117
    .line 118
    .line 119
    move-result-object p2

    .line 120
    invoke-virtual {p0, p2, v0, v2}, Lml1;->f(Lcom/google/android/gms/common/api/Status;Ljava/lang/Exception;Z)V

    .line 121
    .line 122
    .line 123
    iget-object p2, p0, Lml1;->b:Ljava/util/LinkedList;

    .line 124
    .line 125
    invoke-interface {p2}, Ljava/util/Collection;->isEmpty()Z

    .line 126
    .line 127
    .line 128
    move-result p2

    .line 129
    if-eqz p2, :cond_5

    .line 130
    .line 131
    goto :goto_0

    .line 132
    :cond_5
    invoke-virtual {p0, p1}, Lml1;->l(Loo;)Z

    .line 133
    .line 134
    .line 135
    move-result p2

    .line 136
    if-nez p2, :cond_8

    .line 137
    .line 138
    iget-object p2, p0, Lml1;->m:Lza0;

    .line 139
    .line 140
    iget v0, p0, Lml1;->h:I

    .line 141
    .line 142
    invoke-virtual {p2, p1, v0}, Lza0;->b(Loo;I)Z

    .line 143
    .line 144
    .line 145
    move-result p2

    .line 146
    if-nez p2, :cond_8

    .line 147
    .line 148
    iget p2, p1, Loo;->k:I

    .line 149
    .line 150
    const/16 v0, 0x12

    .line 151
    .line 152
    if-ne p2, v0, :cond_6

    .line 153
    .line 154
    iput-boolean v2, p0, Lml1;->j:Z

    .line 155
    .line 156
    :cond_6
    iget-boolean p2, p0, Lml1;->j:Z

    .line 157
    .line 158
    if-eqz p2, :cond_7

    .line 159
    .line 160
    iget-object p1, p0, Lml1;->m:Lza0;

    .line 161
    .line 162
    iget-object p0, p0, Lml1;->d:Lb6;

    .line 163
    .line 164
    iget-object p1, p1, Lza0;->m:Lum1;

    .line 165
    .line 166
    const/16 p2, 0x9

    .line 167
    .line 168
    invoke-static {p1, p2, p0}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    .line 169
    .line 170
    .line 171
    move-result-object p0

    .line 172
    const-wide/16 v0, 0x1388

    .line 173
    .line 174
    invoke-virtual {p1, p0, v0, v1}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 175
    .line 176
    .line 177
    return-void

    .line 178
    :cond_7
    iget-object p2, p0, Lml1;->d:Lb6;

    .line 179
    .line 180
    invoke-static {p2, p1}, Lza0;->c(Lb6;Loo;)Lcom/google/android/gms/common/api/Status;

    .line 181
    .line 182
    .line 183
    move-result-object p1

    .line 184
    invoke-virtual {p0, p1}, Lml1;->e(Lcom/google/android/gms/common/api/Status;)V

    .line 185
    .line 186
    .line 187
    :cond_8
    :goto_0
    return-void

    .line 188
    :cond_9
    invoke-static {v1, p1}, Lza0;->c(Lb6;Loo;)Lcom/google/android/gms/common/api/Status;

    .line 189
    .line 190
    .line 191
    move-result-object p1

    .line 192
    invoke-virtual {p0, p1}, Lml1;->e(Lcom/google/android/gms/common/api/Status;)V

    .line 193
    .line 194
    .line 195
    return-void
.end method

.method public final onConnected()V
    .locals 3

    .line 1
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lml1;->m:Lza0;

    .line 6
    .line 7
    iget-object v1, v1, Lza0;->m:Lum1;

    .line 8
    .line 9
    invoke-virtual {v1}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    if-ne v0, v2, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Lml1;->h()V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    new-instance v0, Ljl1;

    .line 20
    .line 21
    invoke-direct {v0, p0}, Ljl1;-><init>(Lml1;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final p(Loo;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lml1;->m:Lza0;

    .line 2
    .line 3
    iget-object v0, v0, Lza0;->m:Lum1;

    .line 4
    .line 5
    invoke-static {v0}, Lbh;->d(Landroid/os/Handler;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lml1;->c:Lu5;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    new-instance v3, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    const-string v4, "onSignInFailed for "

    .line 25
    .line 26
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    const-string v1, " with "

    .line 33
    .line 34
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-interface {v0, v1}, Lu5;->b(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    const/4 v0, 0x0

    .line 48
    invoke-virtual {p0, p1, v0}, Lml1;->o(Loo;Ljava/lang/RuntimeException;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public final q()V
    .locals 6

    .line 1
    iget-object v0, p0, Lml1;->m:Lza0;

    .line 2
    .line 3
    iget-object v0, v0, Lza0;->m:Lum1;

    .line 4
    .line 5
    invoke-static {v0}, Lbh;->d(Landroid/os/Handler;)V

    .line 6
    .line 7
    .line 8
    sget-object v0, Lza0;->o:Lcom/google/android/gms/common/api/Status;

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Lml1;->e(Lcom/google/android/gms/common/api/Status;)V

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Lml1;->e:Lxn0;

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    invoke-virtual {v1, v2, v0}, Lxn0;->y(ZLcom/google/android/gms/common/api/Status;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lml1;->g:Ljava/util/HashMap;

    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    new-array v1, v2, [Lrj0;

    .line 26
    .line 27
    invoke-interface {v0, v1}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, [Lrj0;

    .line 32
    .line 33
    array-length v1, v0

    .line 34
    :goto_0
    if-ge v2, v1, :cond_0

    .line 35
    .line 36
    aget-object v3, v0, v2

    .line 37
    .line 38
    new-instance v4, Lim1;

    .line 39
    .line 40
    new-instance v5, Llb1;

    .line 41
    .line 42
    invoke-direct {v5}, Llb1;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-direct {v4, v3, v5}, Lim1;-><init>(Lrj0;Llb1;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0, v4}, Lml1;->n(Lul1;)V

    .line 49
    .line 50
    .line 51
    add-int/lit8 v2, v2, 0x1

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_0
    new-instance v0, Loo;

    .line 55
    .line 56
    const/4 v1, 0x4

    .line 57
    const/4 v2, 0x0

    .line 58
    invoke-direct {v0, v1, v2, v2}, Loo;-><init>(ILandroid/app/PendingIntent;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0, v0}, Lml1;->d(Loo;)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Lml1;->c:Lu5;

    .line 65
    .line 66
    invoke-interface {v0}, Lu5;->isConnected()Z

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    if-eqz v1, :cond_1

    .line 71
    .line 72
    new-instance v1, Lmd1;

    .line 73
    .line 74
    const/4 v2, 0x3

    .line 75
    invoke-direct {v1, v2, p0}, Lmd1;-><init>(ILjava/lang/Object;)V

    .line 76
    .line 77
    .line 78
    invoke-interface {v0, v1}, Lu5;->i(Lmd1;)V

    .line 79
    .line 80
    .line 81
    :cond_1
    return-void
.end method
