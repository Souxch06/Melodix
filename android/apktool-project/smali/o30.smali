.class public final Lo30;
.super Le30;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# virtual methods
.method public final b(Ljava/lang/Object;Lkq;)Ljava/lang/Object;
    .locals 5

    .line 1
    instance-of v0, p2, Ln30;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p2

    .line 6
    check-cast v0, Ln30;

    .line 7
    .line 8
    iget v1, v0, Ln30;->q:I

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
    iput v1, v0, Ln30;->q:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, Ln30;

    .line 21
    .line 22
    invoke-direct {v0, p0, p2}, Ln30;-><init>(Lo30;Lkq;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p2, v0, Ln30;->o:Ljava/lang/Object;

    .line 26
    .line 27
    iget v1, v0, Ln30;->q:I

    .line 28
    .line 29
    sget-object v2, Lwe1;->a:Lwe1;

    .line 30
    .line 31
    const/4 v3, 0x1

    .line 32
    const/4 v4, 0x0

    .line 33
    if-eqz v1, :cond_2

    .line 34
    .line 35
    if-ne v1, v3, :cond_1

    .line 36
    .line 37
    iget-object p0, v0, Ln30;->n:Ljava/io/FileOutputStream;

    .line 38
    .line 39
    iget-object p1, v0, Ln30;->m:Ljava/io/FileOutputStream;

    .line 40
    .line 41
    :try_start_0
    invoke-static {p2}, Lk42;->n(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 42
    .line 43
    .line 44
    goto :goto_1

    .line 45
    :catchall_0
    move-exception p0

    .line 46
    goto :goto_2

    .line 47
    :cond_1
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 48
    .line 49
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    return-object v4

    .line 53
    :cond_2
    invoke-static {p2}, Lk42;->n(Ljava/lang/Object;)V

    .line 54
    .line 55
    .line 56
    iget-object p2, p0, Le30;->c:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 57
    .line 58
    invoke-virtual {p2}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 59
    .line 60
    .line 61
    move-result p2

    .line 62
    if-nez p2, :cond_4

    .line 63
    .line 64
    new-instance p2, Ljava/io/FileOutputStream;

    .line 65
    .line 66
    iget-object v1, p0, Le30;->a:Ljava/io/File;

    .line 67
    .line 68
    invoke-direct {p2, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 69
    .line 70
    .line 71
    :try_start_1
    iget-object p0, p0, Le30;->b:Lm41;

    .line 72
    .line 73
    new-instance v1, Lre1;

    .line 74
    .line 75
    invoke-direct {v1, p2}, Lre1;-><init>(Ljava/io/FileOutputStream;)V

    .line 76
    .line 77
    .line 78
    iput-object p2, v0, Ln30;->m:Ljava/io/FileOutputStream;

    .line 79
    .line 80
    iput-object p2, v0, Ln30;->n:Ljava/io/FileOutputStream;

    .line 81
    .line 82
    iput v3, v0, Ln30;->q:I

    .line 83
    .line 84
    invoke-interface {p0, p1, v1}, Lm41;->g(Ljava/lang/Object;Lre1;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 85
    .line 86
    .line 87
    sget-object p0, Lar;->j:Lar;

    .line 88
    .line 89
    if-ne v2, p0, :cond_3

    .line 90
    .line 91
    return-object p0

    .line 92
    :cond_3
    move-object p0, p2

    .line 93
    move-object p1, p0

    .line 94
    :goto_1
    :try_start_2
    invoke-virtual {p0}, Ljava/io/FileOutputStream;->getFD()Ljava/io/FileDescriptor;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    invoke-virtual {p0}, Ljava/io/FileDescriptor;->sync()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 99
    .line 100
    .line 101
    invoke-static {p1, v4}, Lkn1;->a(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 102
    .line 103
    .line 104
    return-object v2

    .line 105
    :catchall_1
    move-exception p0

    .line 106
    move-object p1, p2

    .line 107
    :goto_2
    :try_start_3
    throw p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 108
    :catchall_2
    move-exception p2

    .line 109
    invoke-static {p1, p0}, Lkn1;->a(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 110
    .line 111
    .line 112
    throw p2

    .line 113
    :cond_4
    const-string p0, "This scope has already been closed."

    .line 114
    .line 115
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    return-object v4
.end method
