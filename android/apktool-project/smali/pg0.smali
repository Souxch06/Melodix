.class public final Lpg0;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final d:Lpg0;


# instance fields
.field public final a:Lc9;

.field public final b:Ltb0;

.field public final c:Luo;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lpg0;

    .line 2
    .line 3
    invoke-direct {v0}, Lpg0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lpg0;->d:Lpg0;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    new-instance v0, Lc9;

    .line 2
    .line 3
    const/16 v1, 0xf

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lc9;-><init>(I)V

    .line 6
    .line 7
    .line 8
    sget-object v1, Lcg1;->d:Ltb0;

    .line 9
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lpg0;->a:Lc9;

    .line 14
    .line 15
    iput-object v1, p0, Lpg0;->b:Ltb0;

    .line 16
    .line 17
    new-instance v0, Luo;

    .line 18
    .line 19
    const/4 v1, 0x1

    .line 20
    invoke-direct {v0, v1}, Luo;-><init>(I)V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lpg0;->c:Luo;

    .line 24
    .line 25
    return-void
.end method


# virtual methods
.method public final a(Ldh0;Ljava/lang/String;)Ljava/lang/Object;
    .locals 4

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    new-instance v0, Lz91;

    .line 5
    .line 6
    invoke-direct {v0, p2}, Lz91;-><init>(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    new-instance v1, Ll80;

    .line 10
    .line 11
    sget-object v2, Lcl1;->l:Lcl1;

    .line 12
    .line 13
    invoke-interface {p1}, Ldh0;->d()Li41;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    invoke-direct {v1, p0, v2, v0, v3}, Ll80;-><init>(Lpg0;Lcl1;Lz91;Li41;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1, p1}, Ll80;->j(Ldh0;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    iget p1, v0, Lz91;->a:I

    .line 25
    .line 26
    :goto_0
    const/4 v1, -0x1

    .line 27
    const/16 v2, 0xa

    .line 28
    .line 29
    iget-object v3, v0, Lz91;->e:Ljava/lang/String;

    .line 30
    .line 31
    if-eq p1, v1, :cond_2

    .line 32
    .line 33
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-ge p1, v1, :cond_2

    .line 38
    .line 39
    add-int/lit8 v1, p1, 0x1

    .line 40
    .line 41
    invoke-virtual {v3, p1}, Ljava/lang/String;->charAt(I)C

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    const/16 v3, 0x20

    .line 46
    .line 47
    if-eq p1, v3, :cond_1

    .line 48
    .line 49
    if-eq p1, v2, :cond_1

    .line 50
    .line 51
    const/16 v3, 0xd

    .line 52
    .line 53
    if-eq p1, v3, :cond_1

    .line 54
    .line 55
    const/16 v3, 0x9

    .line 56
    .line 57
    if-ne p1, v3, :cond_0

    .line 58
    .line 59
    goto :goto_1

    .line 60
    :cond_0
    iput v1, v0, Lz91;->a:I

    .line 61
    .line 62
    invoke-static {p1}, Lcg1;->a(C)B

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    goto :goto_2

    .line 67
    :cond_1
    :goto_1
    move p1, v1

    .line 68
    goto :goto_0

    .line 69
    :cond_2
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    iput p1, v0, Lz91;->a:I

    .line 74
    .line 75
    move p1, v2

    .line 76
    :goto_2
    if-ne p1, v2, :cond_3

    .line 77
    .line 78
    return-object p0

    .line 79
    :cond_3
    new-instance p0, Ljava/lang/StringBuilder;

    .line 80
    .line 81
    const-string p1, "Expected EOF after parsing, but had "

    .line 82
    .line 83
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    iget p1, v0, Lz91;->a:I

    .line 87
    .line 88
    add-int/lit8 p1, p1, -0x1

    .line 89
    .line 90
    invoke-virtual {p2, p1}, Ljava/lang/String;->charAt(I)C

    .line 91
    .line 92
    .line 93
    move-result p1

    .line 94
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    const-string p1, " instead"

    .line 98
    .line 99
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    const/4 p1, 0x0

    .line 107
    const/4 p2, 0x6

    .line 108
    invoke-static {v0, p0, p1, p2}, Lz91;->j(Lz91;Ljava/lang/String;II)V

    .line 109
    .line 110
    .line 111
    const/4 p0, 0x0

    .line 112
    throw p0
.end method

.method public final b(Ldh0;Ljava/lang/Object;)Ljava/lang/String;
    .locals 5

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    new-instance v0, Lf4;

    .line 5
    .line 6
    invoke-direct {v0}, Lf4;-><init>()V

    .line 7
    .line 8
    .line 9
    sget-object v1, Luj;->c:Luj;

    .line 10
    .line 11
    monitor-enter v1

    .line 12
    :try_start_0
    iget-object v2, v1, Luj;->a:Laa;

    .line 13
    .line 14
    invoke-virtual {v2}, Laa;->isEmpty()Z

    .line 15
    .line 16
    .line 17
    move-result v3

    .line 18
    const/4 v4, 0x0

    .line 19
    if-eqz v3, :cond_0

    .line 20
    .line 21
    move-object v2, v4

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    invoke-virtual {v2}, Laa;->removeLast()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    :goto_0
    check-cast v2, [C

    .line 28
    .line 29
    if-eqz v2, :cond_1

    .line 30
    .line 31
    iget v3, v1, Luj;->b:I

    .line 32
    .line 33
    array-length v4, v2

    .line 34
    sub-int/2addr v3, v4

    .line 35
    iput v3, v1, Luj;->b:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 36
    .line 37
    move-object v4, v2

    .line 38
    goto :goto_1

    .line 39
    :catchall_0
    move-exception p0

    .line 40
    goto :goto_2

    .line 41
    :cond_1
    :goto_1
    monitor-exit v1

    .line 42
    if-nez v4, :cond_2

    .line 43
    .line 44
    const/16 v1, 0x80

    .line 45
    .line 46
    new-array v4, v1, [C

    .line 47
    .line 48
    :cond_2
    iput-object v4, v0, Lf4;->c:Ljava/lang/Object;

    .line 49
    .line 50
    :try_start_1
    new-instance v1, Lqt;

    .line 51
    .line 52
    sget-object v2, Lcl1;->l:Lcl1;

    .line 53
    .line 54
    sget-object v3, Lcl1;->q:Lc10;

    .line 55
    .line 56
    iget-object v3, v3, Lc10;->j:[Ljava/lang/Enum;

    .line 57
    .line 58
    array-length v3, v3

    .line 59
    new-array v3, v3, [Lqt;

    .line 60
    .line 61
    new-instance v4, Lke2;

    .line 62
    .line 63
    invoke-direct {v4, v0}, Lke2;-><init>(Ljava/lang/Object;)V

    .line 64
    .line 65
    .line 66
    invoke-direct {v1, v4, p0, v2, v3}, Lqt;-><init>(Lke2;Lpg0;Lcl1;[Lqt;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v1, p1, p2}, Lqt;->i(Ldh0;Ljava/lang/Object;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v0}, Lf4;->toString()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 76
    invoke-virtual {v0}, Lf4;->d()V

    .line 77
    .line 78
    .line 79
    return-object p0

    .line 80
    :catchall_1
    move-exception p0

    .line 81
    invoke-virtual {v0}, Lf4;->d()V

    .line 82
    .line 83
    .line 84
    throw p0

    .line 85
    :goto_2
    monitor-exit v1

    .line 86
    throw p0
.end method
