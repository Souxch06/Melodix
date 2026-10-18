.class public final Lhc0;
.super Lfc0;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public m:J

.field public final synthetic n:Ljc0;


# direct methods
.method public constructor <init>(Ljc0;J)V
    .locals 2

    .line 1
    iput-object p1, p0, Lhc0;->n:Ljc0;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lfc0;-><init>(Ljc0;)V

    .line 4
    .line 5
    .line 6
    iput-wide p2, p0, Lhc0;->m:J

    .line 7
    .line 8
    const-wide/16 v0, 0x0

    .line 9
    .line 10
    cmp-long p1, p2, v0

    .line 11
    .line 12
    if-nez p1, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Lfc0;->a()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method


# virtual methods
.method public final c(JLeh;)J
    .locals 7

    .line 1
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-boolean p1, p0, Lfc0;->k:Z

    .line 5
    .line 6
    const-wide/16 v0, 0x0

    .line 7
    .line 8
    if-nez p1, :cond_3

    .line 9
    .line 10
    iget-wide p1, p0, Lhc0;->m:J

    .line 11
    .line 12
    cmp-long v2, p1, v0

    .line 13
    .line 14
    const-wide/16 v3, -0x1

    .line 15
    .line 16
    if-nez v2, :cond_0

    .line 17
    .line 18
    return-wide v3

    .line 19
    :cond_0
    const-wide/16 v5, 0x2000

    .line 20
    .line 21
    invoke-static {p1, p2, v5, v6}, Ljava/lang/Math;->min(JJ)J

    .line 22
    .line 23
    .line 24
    move-result-wide p1

    .line 25
    invoke-super {p0, p1, p2, p3}, Lfc0;->c(JLeh;)J

    .line 26
    .line 27
    .line 28
    move-result-wide p1

    .line 29
    cmp-long p3, p1, v3

    .line 30
    .line 31
    if-eqz p3, :cond_2

    .line 32
    .line 33
    iget-wide v2, p0, Lhc0;->m:J

    .line 34
    .line 35
    sub-long/2addr v2, p1

    .line 36
    iput-wide v2, p0, Lhc0;->m:J

    .line 37
    .line 38
    cmp-long p3, v2, v0

    .line 39
    .line 40
    if-nez p3, :cond_1

    .line 41
    .line 42
    invoke-virtual {p0}, Lfc0;->a()V

    .line 43
    .line 44
    .line 45
    :cond_1
    return-wide p1

    .line 46
    :cond_2
    iget-object p1, p0, Lhc0;->n:Ljc0;

    .line 47
    .line 48
    iget-object p1, p1, Ljc0;->b:Lzx0;

    .line 49
    .line 50
    invoke-virtual {p1}, Lzx0;->k()V

    .line 51
    .line 52
    .line 53
    new-instance p1, Ljava/net/ProtocolException;

    .line 54
    .line 55
    const-string p2, "unexpected end of stream"

    .line 56
    .line 57
    invoke-direct {p1, p2}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0}, Lfc0;->a()V

    .line 61
    .line 62
    .line 63
    throw p1

    .line 64
    :cond_3
    const-string p0, "closed"

    .line 65
    .line 66
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    return-wide v0
.end method

.method public final close()V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lfc0;->k:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-wide v0, p0, Lhc0;->m:J

    .line 7
    .line 8
    const-wide/16 v2, 0x0

    .line 9
    .line 10
    cmp-long v0, v0, v2

    .line 11
    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    sget-object v0, Ljg1;->a:[B

    .line 15
    .line 16
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 19
    .line 20
    .line 21
    const/16 v0, 0x64

    .line 22
    .line 23
    :try_start_0
    invoke-static {p0, v0}, Ljg1;->n(Lp81;I)Z

    .line 24
    .line 25
    .line 26
    move-result v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 27
    goto :goto_0

    .line 28
    :catch_0
    const/4 v0, 0x0

    .line 29
    :goto_0
    if-nez v0, :cond_1

    .line 30
    .line 31
    iget-object v0, p0, Lhc0;->n:Ljc0;

    .line 32
    .line 33
    iget-object v0, v0, Ljc0;->b:Lzx0;

    .line 34
    .line 35
    invoke-virtual {v0}, Lzx0;->k()V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0}, Lfc0;->a()V

    .line 39
    .line 40
    .line 41
    :cond_1
    const/4 v0, 0x1

    .line 42
    iput-boolean v0, p0, Lfc0;->k:Z

    .line 43
    .line 44
    return-void
.end method
