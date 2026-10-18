.class public final Ldi;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lp81;


# instance fields
.field public j:Z

.field public final synthetic k:Llh;

.field public final synthetic l:Lai;

.field public final synthetic m:Lrx0;


# direct methods
.method public constructor <init>(Llh;Lai;Lrx0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ldi;->k:Llh;

    .line 5
    .line 6
    iput-object p2, p0, Ldi;->l:Lai;

    .line 7
    .line 8
    iput-object p3, p0, Ldi;->m:Lrx0;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final b()Lnc1;
    .locals 0

    .line 1
    iget-object p0, p0, Ldi;->k:Llh;

    .line 2
    .line 3
    invoke-interface {p0}, Lp81;->b()Lnc1;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final c(JLeh;)J
    .locals 9

    .line 1
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    :try_start_0
    iget-object p2, p0, Ldi;->k:Llh;

    .line 6
    .line 7
    const-wide/16 v0, 0x2000

    .line 8
    .line 9
    invoke-interface {p2, v0, v1, p3}, Lp81;->c(JLeh;)J

    .line 10
    .line 11
    .line 12
    move-result-wide v6
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    const-wide/16 v0, -0x1

    .line 14
    .line 15
    cmp-long p2, v6, v0

    .line 16
    .line 17
    iget-object v8, p0, Ldi;->m:Lrx0;

    .line 18
    .line 19
    if-nez p2, :cond_1

    .line 20
    .line 21
    iget-boolean p2, p0, Ldi;->j:Z

    .line 22
    .line 23
    if-nez p2, :cond_0

    .line 24
    .line 25
    iput-boolean p1, p0, Ldi;->j:Z

    .line 26
    .line 27
    invoke-virtual {v8}, Lrx0;->close()V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-wide v0

    .line 31
    :cond_1
    iget-object v3, v8, Lrx0;->k:Leh;

    .line 32
    .line 33
    iget-wide p0, p3, Leh;->k:J

    .line 34
    .line 35
    sub-long v4, p0, v6

    .line 36
    .line 37
    move-object v2, p3

    .line 38
    invoke-virtual/range {v2 .. v7}, Leh;->a(Leh;JJ)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v8}, Lrx0;->a()Lkh;

    .line 42
    .line 43
    .line 44
    return-wide v6

    .line 45
    :catch_0
    move-exception v0

    .line 46
    move-object p2, v0

    .line 47
    iget-boolean p3, p0, Ldi;->j:Z

    .line 48
    .line 49
    if-nez p3, :cond_2

    .line 50
    .line 51
    iput-boolean p1, p0, Ldi;->j:Z

    .line 52
    .line 53
    iget-object p0, p0, Ldi;->l:Lai;

    .line 54
    .line 55
    invoke-virtual {p0}, Lai;->a()V

    .line 56
    .line 57
    .line 58
    :cond_2
    throw p2
.end method

.method public final close()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ldi;->j:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Ljg1;->a:[B

    .line 6
    .line 7
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    const/16 v0, 0x64

    .line 13
    .line 14
    :try_start_0
    invoke-static {p0, v0}, Ljg1;->n(Lp81;I)Z

    .line 15
    .line 16
    .line 17
    move-result v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 18
    goto :goto_0

    .line 19
    :catch_0
    const/4 v0, 0x0

    .line 20
    :goto_0
    if-nez v0, :cond_0

    .line 21
    .line 22
    const/4 v0, 0x1

    .line 23
    iput-boolean v0, p0, Ldi;->j:Z

    .line 24
    .line 25
    iget-object v0, p0, Ldi;->l:Lai;

    .line 26
    .line 27
    invoke-virtual {v0}, Lai;->a()V

    .line 28
    .line 29
    .line 30
    :cond_0
    iget-object p0, p0, Ldi;->k:Llh;

    .line 31
    .line 32
    invoke-interface {p0}, Ljava/io/Closeable;->close()V

    .line 33
    .line 34
    .line 35
    return-void
.end method
