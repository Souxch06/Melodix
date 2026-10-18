.class public final Ln10;
.super Lc70;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final k:J

.field public l:J

.field public m:Z

.field public n:Z

.field public o:Z

.field public final synthetic p:Lai;


# direct methods
.method public constructor <init>(Lai;Lp81;J)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ln10;->p:Lai;

    .line 5
    .line 6
    invoke-direct {p0, p2}, Lc70;-><init>(Lp81;)V

    .line 7
    .line 8
    .line 9
    iput-wide p3, p0, Ln10;->k:J

    .line 10
    .line 11
    const/4 p1, 0x1

    .line 12
    iput-boolean p1, p0, Ln10;->m:Z

    .line 13
    .line 14
    const-wide/16 p1, 0x0

    .line 15
    .line 16
    cmp-long p1, p3, p1

    .line 17
    .line 18
    if-nez p1, :cond_0

    .line 19
    .line 20
    const/4 p1, 0x0

    .line 21
    invoke-virtual {p0, p1}, Ln10;->a(Ljava/io/IOException;)Ljava/io/IOException;

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method


# virtual methods
.method public final a(Ljava/io/IOException;)Ljava/io/IOException;
    .locals 3

    .line 1
    iget-boolean v0, p0, Ln10;->n:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-object p1

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Ln10;->n:Z

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    if-nez p1, :cond_1

    .line 11
    .line 12
    iget-boolean v2, p0, Ln10;->m:Z

    .line 13
    .line 14
    if-eqz v2, :cond_1

    .line 15
    .line 16
    iput-boolean v1, p0, Ln10;->m:Z

    .line 17
    .line 18
    :cond_1
    iget-object p0, p0, Ln10;->p:Lai;

    .line 19
    .line 20
    iget-object v2, p0, Lai;->b:Ljava/lang/Object;

    .line 21
    .line 22
    check-cast v2, Lwx0;

    .line 23
    .line 24
    if-eqz p1, :cond_2

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Lai;->c(Ljava/io/IOException;)V

    .line 27
    .line 28
    .line 29
    :cond_2
    invoke-virtual {v2, p0, v1, v0, p1}, Lwx0;->g(Lai;ZZLjava/io/IOException;)Ljava/io/IOException;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0
.end method

.method public final c(JLeh;)J
    .locals 8

    .line 1
    const-string p1, "expected "

    .line 2
    .line 3
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    iget-boolean p2, p0, Ln10;->o:Z

    .line 7
    .line 8
    if-nez p2, :cond_5

    .line 9
    .line 10
    :try_start_0
    iget-object p2, p0, Lc70;->j:Lp81;

    .line 11
    .line 12
    const-wide/16 v0, 0x2000

    .line 13
    .line 14
    invoke-interface {p2, v0, v1, p3}, Lp81;->c(JLeh;)J

    .line 15
    .line 16
    .line 17
    move-result-wide p2

    .line 18
    iget-boolean v0, p0, Ln10;->m:Z

    .line 19
    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    iput-boolean v0, p0, Ln10;->m:Z

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :catch_0
    move-exception p1

    .line 27
    goto :goto_2

    .line 28
    :cond_0
    :goto_0
    const-wide/16 v0, -0x1

    .line 29
    .line 30
    cmp-long v2, p2, v0

    .line 31
    .line 32
    const/4 v3, 0x0

    .line 33
    if-nez v2, :cond_1

    .line 34
    .line 35
    invoke-virtual {p0, v3}, Ln10;->a(Ljava/io/IOException;)Ljava/io/IOException;

    .line 36
    .line 37
    .line 38
    return-wide v0

    .line 39
    :cond_1
    iget-wide v4, p0, Ln10;->l:J
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 40
    .line 41
    add-long/2addr v4, p2

    .line 42
    iget-wide v6, p0, Ln10;->k:J

    .line 43
    .line 44
    cmp-long v0, v6, v0

    .line 45
    .line 46
    if-eqz v0, :cond_3

    .line 47
    .line 48
    cmp-long v0, v4, v6

    .line 49
    .line 50
    if-gtz v0, :cond_2

    .line 51
    .line 52
    goto :goto_1

    .line 53
    :cond_2
    :try_start_1
    new-instance p2, Ljava/net/ProtocolException;

    .line 54
    .line 55
    new-instance p3, Ljava/lang/StringBuilder;

    .line 56
    .line 57
    invoke-direct {p3, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p3, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string p1, " bytes but received "

    .line 64
    .line 65
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {p3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-direct {p2, p1}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    throw p2

    .line 79
    :cond_3
    :goto_1
    iput-wide v4, p0, Ln10;->l:J

    .line 80
    .line 81
    cmp-long p1, v4, v6

    .line 82
    .line 83
    if-nez p1, :cond_4

    .line 84
    .line 85
    invoke-virtual {p0, v3}, Ln10;->a(Ljava/io/IOException;)Ljava/io/IOException;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 86
    .line 87
    .line 88
    :cond_4
    return-wide p2

    .line 89
    :goto_2
    invoke-virtual {p0, p1}, Ln10;->a(Ljava/io/IOException;)Ljava/io/IOException;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    throw p0

    .line 94
    :cond_5
    const-string p0, "closed"

    .line 95
    .line 96
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    const-wide/16 p0, 0x0

    .line 100
    .line 101
    return-wide p0
.end method

.method public final close()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ln10;->o:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Ln10;->o:Z

    .line 8
    .line 9
    :try_start_0
    invoke-super {p0}, Lc70;->close()V

    .line 10
    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-virtual {p0, v0}, Ln10;->a(Ljava/io/IOException;)Ljava/io/IOException;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :catch_0
    move-exception v0

    .line 18
    invoke-virtual {p0, v0}, Ln10;->a(Ljava/io/IOException;)Ljava/io/IOException;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    throw p0
.end method
