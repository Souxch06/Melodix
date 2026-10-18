.class public final Lfw1;
.super Lgx1;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final k:Lda;

.field public final l:Lda;

.field public m:J


# direct methods
.method public constructor <init>(Ly02;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Let;-><init>(Ly02;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Lda;

    .line 5
    .line 6
    invoke-direct {p1}, Lu71;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lfw1;->l:Lda;

    .line 10
    .line 11
    new-instance p1, Lda;

    .line 12
    .line 13
    invoke-direct {p1}, Lu71;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lfw1;->k:Lda;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public final m(Ljava/lang/String;J)V
    .locals 2

    .line 1
    iget-object v0, p0, Let;->j:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ly02;

    .line 4
    .line 5
    if-eqz p1, :cond_1

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object v0, v0, Ly02;->p:Ls02;

    .line 15
    .line 16
    invoke-static {v0}, Ly02;->l(Lm22;)V

    .line 17
    .line 18
    .line 19
    new-instance v1, Lan1;

    .line 20
    .line 21
    invoke-direct {v1, p0, p1, p2, p3}, Lan1;-><init>(Lfw1;Ljava/lang/String;J)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ls02;->u(Ljava/lang/Runnable;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_1
    :goto_0
    iget-object p0, v0, Ly02;->o:Lzy1;

    .line 29
    .line 30
    invoke-static {p0}, Ly02;->l(Lm22;)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Lzy1;->o:Lso;

    .line 34
    .line 35
    const-string p1, "Ad unit id must be a non-empty string"

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Lso;->b(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final n(Ljava/lang/String;J)V
    .locals 2

    .line 1
    iget-object v0, p0, Let;->j:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ly02;

    .line 4
    .line 5
    if-eqz p1, :cond_1

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object v0, v0, Ly02;->p:Ls02;

    .line 15
    .line 16
    invoke-static {v0}, Ly02;->l(Lm22;)V

    .line 17
    .line 18
    .line 19
    new-instance v1, Llu1;

    .line 20
    .line 21
    invoke-direct {v1, p0, p1, p2, p3}, Llu1;-><init>(Lfw1;Ljava/lang/String;J)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ls02;->u(Ljava/lang/Runnable;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_1
    :goto_0
    iget-object p0, v0, Ly02;->o:Lzy1;

    .line 29
    .line 30
    invoke-static {p0}, Ly02;->l(Lm22;)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Lzy1;->o:Lso;

    .line 34
    .line 35
    const-string p1, "Ad unit id must be a non-empty string"

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Lso;->b(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final o(J)V
    .locals 6

    .line 1
    iget-object v0, p0, Let;->j:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ly02;

    .line 4
    .line 5
    iget-object v0, v0, Ly02;->u:Lz52;

    .line 6
    .line 7
    invoke-static {v0}, Ly02;->k(Lay1;)V

    .line 8
    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {v0, v1}, Lz52;->p(Z)Lm52;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v1, p0, Lfw1;->k:Lda;

    .line 16
    .line 17
    invoke-virtual {v1}, Lda;->keySet()Ljava/util/Set;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    check-cast v2, Lhl0;

    .line 22
    .line 23
    invoke-virtual {v2}, Lhl0;->iterator()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    if-eqz v3, :cond_0

    .line 32
    .line 33
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    check-cast v3, Ljava/lang/String;

    .line 38
    .line 39
    const/4 v4, 0x0

    .line 40
    invoke-virtual {v1, v3, v4}, Lu71;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v4

    .line 44
    check-cast v4, Ljava/lang/Long;

    .line 45
    .line 46
    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    .line 47
    .line 48
    .line 49
    move-result-wide v4

    .line 50
    sub-long v4, p1, v4

    .line 51
    .line 52
    invoke-virtual {p0, v3, v4, v5, v0}, Lfw1;->q(Ljava/lang/String;JLm52;)V

    .line 53
    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_0
    invoke-virtual {v1}, Lu71;->isEmpty()Z

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    if-nez v1, :cond_1

    .line 61
    .line 62
    iget-wide v1, p0, Lfw1;->m:J

    .line 63
    .line 64
    sub-long v1, p1, v1

    .line 65
    .line 66
    invoke-virtual {p0, v1, v2, v0}, Lfw1;->p(JLm52;)V

    .line 67
    .line 68
    .line 69
    :cond_1
    invoke-virtual {p0, p1, p2}, Lfw1;->r(J)V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public final p(JLm52;)V
    .locals 2

    .line 1
    iget-object p0, p0, Let;->j:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Ly02;

    .line 4
    .line 5
    if-nez p3, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ly02;->o:Lzy1;

    .line 8
    .line 9
    invoke-static {p0}, Ly02;->l(Lm22;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lzy1;->w:Lso;

    .line 13
    .line 14
    const-string p1, "Not logging ad exposure. No active activity"

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Lso;->b(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    const-wide/16 v0, 0x3e8

    .line 21
    .line 22
    cmp-long v0, p1, v0

    .line 23
    .line 24
    if-gez v0, :cond_1

    .line 25
    .line 26
    iget-object p0, p0, Ly02;->o:Lzy1;

    .line 27
    .line 28
    invoke-static {p0}, Ly02;->l(Lm22;)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Lzy1;->w:Lso;

    .line 32
    .line 33
    const-string p3, "Not logging ad exposure. Less than 1000 ms. exposure"

    .line 34
    .line 35
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {p0, p1, p3}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_1
    new-instance v0, Landroid/os/Bundle;

    .line 44
    .line 45
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 46
    .line 47
    .line 48
    const-string v1, "_xt"

    .line 49
    .line 50
    invoke-virtual {v0, v1, p1, p2}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    .line 51
    .line 52
    .line 53
    const/4 p1, 0x1

    .line 54
    invoke-static {p3, v0, p1}, Lcb2;->h0(Lm52;Landroid/os/Bundle;Z)V

    .line 55
    .line 56
    .line 57
    iget-object p0, p0, Ly02;->v:Lc52;

    .line 58
    .line 59
    invoke-static {p0}, Ly02;->k(Lay1;)V

    .line 60
    .line 61
    .line 62
    const-string p1, "am"

    .line 63
    .line 64
    const-string p2, "_xa"

    .line 65
    .line 66
    invoke-virtual {p0, p1, p2, v0}, Lc52;->s(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public final q(Ljava/lang/String;JLm52;)V
    .locals 2

    .line 1
    iget-object p0, p0, Let;->j:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Ly02;

    .line 4
    .line 5
    if-nez p4, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ly02;->o:Lzy1;

    .line 8
    .line 9
    invoke-static {p0}, Ly02;->l(Lm22;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lzy1;->w:Lso;

    .line 13
    .line 14
    const-string p1, "Not logging ad unit exposure. No active activity"

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Lso;->b(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    const-wide/16 v0, 0x3e8

    .line 21
    .line 22
    cmp-long v0, p2, v0

    .line 23
    .line 24
    if-gez v0, :cond_1

    .line 25
    .line 26
    iget-object p0, p0, Ly02;->o:Lzy1;

    .line 27
    .line 28
    invoke-static {p0}, Ly02;->l(Lm22;)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Lzy1;->w:Lso;

    .line 32
    .line 33
    const-string p1, "Not logging ad unit exposure. Less than 1000 ms. exposure"

    .line 34
    .line 35
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    invoke-virtual {p0, p2, p1}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_1
    new-instance v0, Landroid/os/Bundle;

    .line 44
    .line 45
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 46
    .line 47
    .line 48
    const-string v1, "_ai"

    .line 49
    .line 50
    invoke-virtual {v0, v1, p1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    const-string p1, "_xt"

    .line 54
    .line 55
    invoke-virtual {v0, p1, p2, p3}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    .line 56
    .line 57
    .line 58
    const/4 p1, 0x1

    .line 59
    invoke-static {p4, v0, p1}, Lcb2;->h0(Lm52;Landroid/os/Bundle;Z)V

    .line 60
    .line 61
    .line 62
    iget-object p0, p0, Ly02;->v:Lc52;

    .line 63
    .line 64
    invoke-static {p0}, Ly02;->k(Lay1;)V

    .line 65
    .line 66
    .line 67
    const-string p1, "am"

    .line 68
    .line 69
    const-string p2, "_xu"

    .line 70
    .line 71
    invoke-virtual {p0, p1, p2, v0}, Lc52;->s(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public final r(J)V
    .locals 4

    .line 1
    iget-object v0, p0, Lfw1;->k:Lda;

    .line 2
    .line 3
    invoke-virtual {v0}, Lda;->keySet()Ljava/util/Set;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    check-cast v1, Lhl0;

    .line 8
    .line 9
    invoke-virtual {v1}, Lhl0;->iterator()Ljava/util/Iterator;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    if-eqz v2, :cond_0

    .line 18
    .line 19
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    check-cast v2, Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    invoke-virtual {v0, v2, v3}, Lu71;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    invoke-virtual {v0}, Lu71;->isEmpty()Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-nez v0, :cond_1

    .line 38
    .line 39
    iput-wide p1, p0, Lfw1;->m:J

    .line 40
    .line 41
    :cond_1
    return-void
.end method
