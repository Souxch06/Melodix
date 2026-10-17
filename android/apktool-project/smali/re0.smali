.class public final Lre0;
.super Ljava/io/InputStream;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final j:Ljava/io/InputStream;

.field public final k:Lpp0;

.field public final l:Loc1;

.field public m:J

.field public n:J

.field public o:J


# direct methods
.method public constructor <init>(Ljava/io/InputStream;Lpp0;Loc1;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, -0x1

    .line 5
    .line 6
    iput-wide v0, p0, Lre0;->m:J

    .line 7
    .line 8
    iput-wide v0, p0, Lre0;->o:J

    .line 9
    .line 10
    iput-object p3, p0, Lre0;->l:Loc1;

    .line 11
    .line 12
    iput-object p1, p0, Lre0;->j:Ljava/io/InputStream;

    .line 13
    .line 14
    iput-object p2, p0, Lre0;->k:Lpp0;

    .line 15
    .line 16
    iget-object p1, p2, Lpp0;->m:Lmp0;

    .line 17
    .line 18
    iget-object p1, p1, Lea0;->k:Lia0;

    .line 19
    .line 20
    check-cast p1, Lop0;

    .line 21
    .line 22
    invoke-virtual {p1}, Lop0;->C()J

    .line 23
    .line 24
    .line 25
    move-result-wide p1

    .line 26
    iput-wide p1, p0, Lre0;->n:J

    .line 27
    .line 28
    return-void
.end method


# virtual methods
.method public final a(J)V
    .locals 4

    .line 1
    iget-wide v0, p0, Lre0;->m:J

    .line 2
    .line 3
    const-wide/16 v2, -0x1

    .line 4
    .line 5
    cmp-long v2, v0, v2

    .line 6
    .line 7
    if-nez v2, :cond_0

    .line 8
    .line 9
    iput-wide p1, p0, Lre0;->m:J

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    add-long/2addr v0, p1

    .line 13
    iput-wide v0, p0, Lre0;->m:J

    .line 14
    .line 15
    return-void
.end method

.method public final available()I
    .locals 2

    .line 1
    :try_start_0
    iget-object v0, p0, Lre0;->j:Ljava/io/InputStream;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/io/InputStream;->available()I

    .line 4
    .line 5
    .line 6
    move-result p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 7
    return p0

    .line 8
    :catch_0
    move-exception v0

    .line 9
    iget-object v1, p0, Lre0;->l:Loc1;

    .line 10
    .line 11
    iget-object p0, p0, Lre0;->k:Lpp0;

    .line 12
    .line 13
    invoke-static {v1, p0, p0}, Loq;->p(Loc1;Lpp0;Lpp0;)V

    .line 14
    .line 15
    .line 16
    throw v0
.end method

.method public final close()V
    .locals 8

    .line 1
    iget-object v0, p0, Lre0;->k:Lpp0;

    .line 2
    .line 3
    iget-object v1, p0, Lre0;->l:Loc1;

    .line 4
    .line 5
    invoke-virtual {v1}, Loc1;->b()J

    .line 6
    .line 7
    .line 8
    move-result-wide v2

    .line 9
    iget-wide v4, p0, Lre0;->o:J

    .line 10
    .line 11
    const-wide/16 v6, -0x1

    .line 12
    .line 13
    cmp-long v4, v4, v6

    .line 14
    .line 15
    if-nez v4, :cond_0

    .line 16
    .line 17
    iput-wide v2, p0, Lre0;->o:J

    .line 18
    .line 19
    :cond_0
    :try_start_0
    iget-object v2, p0, Lre0;->j:Ljava/io/InputStream;

    .line 20
    .line 21
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    .line 22
    .line 23
    .line 24
    iget-wide v2, p0, Lre0;->m:J

    .line 25
    .line 26
    cmp-long v4, v2, v6

    .line 27
    .line 28
    if-eqz v4, :cond_1

    .line 29
    .line 30
    invoke-virtual {v0, v2, v3}, Lpp0;->h(J)V

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :catch_0
    move-exception p0

    .line 35
    goto :goto_1

    .line 36
    :cond_1
    :goto_0
    iget-wide v2, p0, Lre0;->n:J

    .line 37
    .line 38
    cmp-long v4, v2, v6

    .line 39
    .line 40
    if-eqz v4, :cond_2

    .line 41
    .line 42
    iget-object v4, v0, Lpp0;->m:Lmp0;

    .line 43
    .line 44
    invoke-virtual {v4}, Lea0;->i()V

    .line 45
    .line 46
    .line 47
    iget-object v4, v4, Lea0;->k:Lia0;

    .line 48
    .line 49
    check-cast v4, Lop0;

    .line 50
    .line 51
    invoke-virtual {v4, v2, v3}, Lop0;->W(J)V

    .line 52
    .line 53
    .line 54
    :cond_2
    iget-wide v2, p0, Lre0;->o:J

    .line 55
    .line 56
    invoke-virtual {v0, v2, v3}, Lpp0;->i(J)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0}, Lpp0;->b()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :goto_1
    invoke-static {v1, v0, v0}, Loq;->p(Loc1;Lpp0;Lpp0;)V

    .line 64
    .line 65
    .line 66
    throw p0
.end method

.method public final mark(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lre0;->j:Ljava/io/InputStream;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/io/InputStream;->mark(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final markSupported()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lre0;->j:Ljava/io/InputStream;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/io/InputStream;->markSupported()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final read()I
    .locals 9

    .line 1
    iget-object v0, p0, Lre0;->l:Loc1;

    .line 2
    .line 3
    iget-object v1, p0, Lre0;->k:Lpp0;

    .line 4
    .line 5
    :try_start_0
    iget-object v2, p0, Lre0;->j:Ljava/io/InputStream;

    .line 6
    .line 7
    invoke-virtual {v2}, Ljava/io/InputStream;->read()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    invoke-virtual {v0}, Loc1;->b()J

    .line 12
    .line 13
    .line 14
    move-result-wide v3

    .line 15
    iget-wide v5, p0, Lre0;->n:J

    .line 16
    .line 17
    const-wide/16 v7, -0x1

    .line 18
    .line 19
    cmp-long v5, v5, v7

    .line 20
    .line 21
    if-nez v5, :cond_0

    .line 22
    .line 23
    iput-wide v3, p0, Lre0;->n:J

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :catch_0
    move-exception p0

    .line 27
    goto :goto_1

    .line 28
    :cond_0
    :goto_0
    const/4 v5, -0x1

    .line 29
    if-ne v2, v5, :cond_1

    .line 30
    .line 31
    iget-wide v5, p0, Lre0;->o:J

    .line 32
    .line 33
    cmp-long v5, v5, v7

    .line 34
    .line 35
    if-nez v5, :cond_1

    .line 36
    .line 37
    iput-wide v3, p0, Lre0;->o:J

    .line 38
    .line 39
    invoke-virtual {v1, v3, v4}, Lpp0;->i(J)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v1}, Lpp0;->b()V

    .line 43
    .line 44
    .line 45
    return v2

    .line 46
    :cond_1
    const-wide/16 v3, 0x1

    .line 47
    .line 48
    invoke-virtual {p0, v3, v4}, Lre0;->a(J)V

    .line 49
    .line 50
    .line 51
    iget-wide v3, p0, Lre0;->m:J

    .line 52
    .line 53
    invoke-virtual {v1, v3, v4}, Lpp0;->h(J)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 54
    .line 55
    .line 56
    return v2

    .line 57
    :goto_1
    invoke-static {v0, v1, v1}, Loq;->p(Loc1;Lpp0;Lpp0;)V

    .line 58
    .line 59
    .line 60
    throw p0
.end method

.method public final read([B)I
    .locals 8

    .line 73
    iget-object v0, p0, Lre0;->l:Loc1;

    iget-object v1, p0, Lre0;->k:Lpp0;

    :try_start_0
    iget-object v2, p0, Lre0;->j:Ljava/io/InputStream;

    invoke-virtual {v2, p1}, Ljava/io/InputStream;->read([B)I

    move-result p1

    .line 74
    invoke-virtual {v0}, Loc1;->b()J

    move-result-wide v2

    .line 75
    iget-wide v4, p0, Lre0;->n:J

    const-wide/16 v6, -0x1

    cmp-long v4, v4, v6

    if-nez v4, :cond_0

    .line 76
    iput-wide v2, p0, Lre0;->n:J

    goto :goto_0

    :catch_0
    move-exception p0

    goto :goto_1

    :cond_0
    :goto_0
    const/4 v4, -0x1

    if-ne p1, v4, :cond_1

    .line 77
    iget-wide v4, p0, Lre0;->o:J

    cmp-long v4, v4, v6

    if-nez v4, :cond_1

    .line 78
    iput-wide v2, p0, Lre0;->o:J

    .line 79
    invoke-virtual {v1, v2, v3}, Lpp0;->i(J)V

    .line 80
    invoke-virtual {v1}, Lpp0;->b()V

    return p1

    :cond_1
    int-to-long v2, p1

    .line 81
    invoke-virtual {p0, v2, v3}, Lre0;->a(J)V

    .line 82
    iget-wide v2, p0, Lre0;->m:J

    invoke-virtual {v1, v2, v3}, Lpp0;->h(J)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    .line 83
    :goto_1
    invoke-static {v0, v1, v1}, Loq;->p(Loc1;Lpp0;Lpp0;)V

    .line 84
    throw p0
.end method

.method public final read([BII)I
    .locals 6

    .line 61
    iget-object v0, p0, Lre0;->l:Loc1;

    iget-object v1, p0, Lre0;->k:Lpp0;

    :try_start_0
    iget-object v2, p0, Lre0;->j:Ljava/io/InputStream;

    invoke-virtual {v2, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I

    move-result p1

    .line 62
    invoke-virtual {v0}, Loc1;->b()J

    move-result-wide p2

    .line 63
    iget-wide v2, p0, Lre0;->n:J

    const-wide/16 v4, -0x1

    cmp-long v2, v2, v4

    if-nez v2, :cond_0

    .line 64
    iput-wide p2, p0, Lre0;->n:J

    goto :goto_0

    :catch_0
    move-exception p0

    goto :goto_1

    :cond_0
    :goto_0
    const/4 v2, -0x1

    if-ne p1, v2, :cond_1

    .line 65
    iget-wide v2, p0, Lre0;->o:J

    cmp-long v2, v2, v4

    if-nez v2, :cond_1

    .line 66
    iput-wide p2, p0, Lre0;->o:J

    .line 67
    invoke-virtual {v1, p2, p3}, Lpp0;->i(J)V

    .line 68
    invoke-virtual {v1}, Lpp0;->b()V

    return p1

    :cond_1
    int-to-long p2, p1

    .line 69
    invoke-virtual {p0, p2, p3}, Lre0;->a(J)V

    .line 70
    iget-wide p2, p0, Lre0;->m:J

    invoke-virtual {v1, p2, p3}, Lpp0;->h(J)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    .line 71
    :goto_1
    invoke-static {v0, v1, v1}, Loq;->p(Loc1;Lpp0;Lpp0;)V

    .line 72
    throw p0
.end method

.method public final reset()V
    .locals 2

    .line 1
    :try_start_0
    iget-object v0, p0, Lre0;->j:Ljava/io/InputStream;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/io/InputStream;->reset()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :catch_0
    move-exception v0

    .line 8
    iget-object v1, p0, Lre0;->l:Loc1;

    .line 9
    .line 10
    iget-object p0, p0, Lre0;->k:Lpp0;

    .line 11
    .line 12
    invoke-static {v1, p0, p0}, Loq;->p(Loc1;Lpp0;Lpp0;)V

    .line 13
    .line 14
    .line 15
    throw v0
.end method

.method public final skip(J)J
    .locals 11

    .line 1
    iget-object v0, p0, Lre0;->l:Loc1;

    .line 2
    .line 3
    iget-object v1, p0, Lre0;->k:Lpp0;

    .line 4
    .line 5
    :try_start_0
    iget-object v2, p0, Lre0;->j:Ljava/io/InputStream;

    .line 6
    .line 7
    invoke-virtual {v2, p1, p2}, Ljava/io/InputStream;->skip(J)J

    .line 8
    .line 9
    .line 10
    move-result-wide v2

    .line 11
    invoke-virtual {v0}, Loc1;->b()J

    .line 12
    .line 13
    .line 14
    move-result-wide v4

    .line 15
    iget-wide v6, p0, Lre0;->n:J

    .line 16
    .line 17
    const-wide/16 v8, -0x1

    .line 18
    .line 19
    cmp-long v6, v6, v8

    .line 20
    .line 21
    if-nez v6, :cond_0

    .line 22
    .line 23
    iput-wide v4, p0, Lre0;->n:J

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :catch_0
    move-exception p0

    .line 27
    goto :goto_1

    .line 28
    :cond_0
    :goto_0
    const-wide/16 v6, 0x0

    .line 29
    .line 30
    cmp-long v10, v2, v6

    .line 31
    .line 32
    if-nez v10, :cond_1

    .line 33
    .line 34
    cmp-long p1, p1, v6

    .line 35
    .line 36
    if-eqz p1, :cond_1

    .line 37
    .line 38
    iget-wide p1, p0, Lre0;->o:J

    .line 39
    .line 40
    cmp-long p1, p1, v8

    .line 41
    .line 42
    if-nez p1, :cond_1

    .line 43
    .line 44
    iput-wide v4, p0, Lre0;->o:J

    .line 45
    .line 46
    invoke-virtual {v1, v4, v5}, Lpp0;->i(J)V

    .line 47
    .line 48
    .line 49
    return-wide v2

    .line 50
    :cond_1
    invoke-virtual {p0, v2, v3}, Lre0;->a(J)V

    .line 51
    .line 52
    .line 53
    iget-wide p0, p0, Lre0;->m:J

    .line 54
    .line 55
    invoke-virtual {v1, p0, p1}, Lpp0;->h(J)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 56
    .line 57
    .line 58
    return-wide v2

    .line 59
    :goto_1
    invoke-static {v0, v1, v1}, Loq;->p(Loc1;Lpp0;Lpp0;)V

    .line 60
    .line 61
    .line 62
    throw p0
.end method
