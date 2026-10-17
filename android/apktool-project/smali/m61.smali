.class public final Lm61;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final a:Lkc1;

.field public final b:Lyt;

.field public final c:Ljava/util/concurrent/atomic/AtomicReference;


# direct methods
.method public constructor <init>(Lsq;Lkc1;Lyt;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object p2, p0, Lm61;->a:Lkc1;

    .line 14
    .line 15
    iput-object p3, p0, Lm61;->b:Lyt;

    .line 16
    .line 17
    new-instance p2, Ljava/util/concurrent/atomic/AtomicReference;

    .line 18
    .line 19
    invoke-direct {p2}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object p2, p0, Lm61;->c:Ljava/util/concurrent/atomic/AtomicReference;

    .line 23
    .line 24
    invoke-static {p1}, Lfe1;->b(Lsq;)Lgq;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    new-instance p2, Lk61;

    .line 29
    .line 30
    const/4 p3, 0x0

    .line 31
    const/4 v0, 0x0

    .line 32
    invoke-direct {p2, p0, p3, v0}, Lk61;-><init>(Lm61;Liq;I)V

    .line 33
    .line 34
    .line 35
    invoke-static {p1, p2}, Lju1;->p(Lzq;Lf90;)Ln91;

    .line 36
    .line 37
    .line 38
    return-void
.end method


# virtual methods
.method public final a()Lr41;
    .locals 4

    .line 1
    iget-object v0, p0, Lm61;->c:Ljava/util/concurrent/atomic/AtomicReference;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    if-nez v1, :cond_2

    .line 8
    .line 9
    new-instance v1, Lk61;

    .line 10
    .line 11
    const/4 v2, 0x1

    .line 12
    const/4 v3, 0x0

    .line 13
    invoke-direct {v1, p0, v3, v2}, Lk61;-><init>(Lm61;Liq;I)V

    .line 14
    .line 15
    .line 16
    invoke-static {v1}, Lkp1;->f(Lf90;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    :cond_0
    invoke-virtual {v0, v3, p0}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    if-eqz v1, :cond_0

    .line 32
    .line 33
    :cond_2
    :goto_0
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 38
    .line 39
    .line 40
    check-cast p0, Lr41;

    .line 41
    .line 42
    return-object p0
.end method

.method public final b()Z
    .locals 6

    .line 1
    invoke-virtual {p0}, Lm61;->a()Lr41;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Lr41;->e:Ljava/lang/Long;

    .line 6
    .line 7
    invoke-virtual {p0}, Lm61;->a()Lr41;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iget-object v1, v1, Lr41;->d:Ljava/lang/Integer;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Lm61;->a:Lkc1;

    .line 18
    .line 19
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    .line 21
    .line 22
    invoke-static {}, Lkc1;->a()Ljc1;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    iget-wide v2, p0, Ljc1;->c:J

    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 29
    .line 30
    .line 31
    move-result-wide v4

    .line 32
    sub-long/2addr v2, v4

    .line 33
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    int-to-long v0, p0

    .line 38
    cmp-long p0, v2, v0

    .line 39
    .line 40
    if-gez p0, :cond_0

    .line 41
    .line 42
    const/4 p0, 0x0

    .line 43
    return p0

    .line 44
    :cond_0
    const/4 p0, 0x1

    .line 45
    return p0
.end method

.method public final c(Lr41;Lkq;)Ljava/lang/Object;
    .locals 4

    .line 1
    instance-of v0, p2, Ll61;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p2

    .line 6
    check-cast v0, Ll61;

    .line 7
    .line 8
    iget v1, v0, Ll61;->o:I

    .line 9
    .line 10
    const/high16 v2, -0x80000000

    .line 11
    .line 12
    and-int v3, v1, v2

    .line 13
    .line 14
    if-eqz v3, :cond_0

    .line 15
    .line 16
    sub-int/2addr v1, v2

    .line 17
    iput v1, v0, Ll61;->o:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, Ll61;

    .line 21
    .line 22
    invoke-direct {v0, p0, p2}, Ll61;-><init>(Lm61;Lkq;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p2, v0, Ll61;->m:Ljava/lang/Object;

    .line 26
    .line 27
    iget v1, v0, Ll61;->o:I

    .line 28
    .line 29
    const/4 v2, 0x0

    .line 30
    const/4 v3, 0x1

    .line 31
    if-eqz v1, :cond_2

    .line 32
    .line 33
    if-ne v1, v3, :cond_1

    .line 34
    .line 35
    :try_start_0
    invoke-static {p2}, Lk42;->n(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 36
    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_1
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 40
    .line 41
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    return-object v2

    .line 45
    :cond_2
    invoke-static {p2}, Lk42;->n(Ljava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    :try_start_1
    iget-object p0, p0, Lm61;->b:Lyt;

    .line 49
    .line 50
    new-instance p2, Lfu;

    .line 51
    .line 52
    invoke-direct {p2, p1, v2}, Lfu;-><init>(Lr41;Liq;)V

    .line 53
    .line 54
    .line 55
    iput v3, v0, Ll61;->o:I

    .line 56
    .line 57
    invoke-interface {p0, p2, v0}, Lyt;->a(Lf90;Lkq;)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object p0
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 61
    sget-object p1, Lar;->j:Lar;

    .line 62
    .line 63
    if-ne p0, p1, :cond_3

    .line 64
    .line 65
    return-object p1

    .line 66
    :catch_0
    move-exception p0

    .line 67
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    :cond_3
    :goto_1
    sget-object p0, Lwe1;->a:Lwe1;

    .line 71
    .line 72
    return-object p0
.end method
