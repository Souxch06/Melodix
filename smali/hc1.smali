.class public final synthetic Lhc1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lka0;


# static fields
.field public static final a:Lhc1;

.field private static final descriptor:Li41;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lhc1;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lhc1;->a:Lhc1;

    .line 7
    .line 8
    new-instance v1, Llt0;

    .line 9
    .line 10
    const-string v2, "com.google.firebase.sessions.Time"

    .line 11
    .line 12
    const/4 v3, 0x3

    .line 13
    invoke-direct {v1, v2, v0, v3}, Llt0;-><init>(Ljava/lang/String;Lka0;I)V

    .line 14
    .line 15
    .line 16
    const-string v0, "ms"

    .line 17
    .line 18
    const/4 v2, 0x0

    .line 19
    invoke-virtual {v1, v0, v2}, Llt0;->k(Ljava/lang/String;Z)V

    .line 20
    .line 21
    .line 22
    const-string v0, "us"

    .line 23
    .line 24
    const/4 v2, 0x1

    .line 25
    invoke-virtual {v1, v0, v2}, Llt0;->k(Ljava/lang/String;Z)V

    .line 26
    .line 27
    .line 28
    const-string v0, "seconds"

    .line 29
    .line 30
    invoke-virtual {v1, v0, v2}, Llt0;->k(Ljava/lang/String;Z)V

    .line 31
    .line 32
    .line 33
    sput-object v1, Lhc1;->descriptor:Li41;

    .line 34
    .line 35
    return-void
.end method


# virtual methods
.method public final a()[Ldh0;
    .locals 2

    .line 1
    const/4 p0, 0x3

    .line 2
    new-array p0, p0, [Ldh0;

    .line 3
    .line 4
    sget-object v0, Ltk0;->a:Ltk0;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    aput-object v0, p0, v1

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    aput-object v0, p0, v1

    .line 11
    .line 12
    const/4 v1, 0x2

    .line 13
    aput-object v0, p0, v1

    .line 14
    .line 15
    return-object p0
.end method

.method public final b(Ll80;)Ljava/lang/Object;
    .locals 12

    .line 1
    sget-object p0, Lhc1;->descriptor:Li41;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Ll80;->a(Li41;)Ll80;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const/4 v0, 0x1

    .line 8
    const/4 v1, 0x0

    .line 9
    const-wide/16 v2, 0x0

    .line 10
    .line 11
    move v5, v1

    .line 12
    move-wide v6, v2

    .line 13
    move-wide v8, v6

    .line 14
    move-wide v10, v8

    .line 15
    move v2, v0

    .line 16
    :goto_0
    if-eqz v2, :cond_4

    .line 17
    .line 18
    invoke-virtual {p1, p0}, Ll80;->b(Li41;)I

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    const/4 v4, -0x1

    .line 23
    if-eq v3, v4, :cond_3

    .line 24
    .line 25
    if-eqz v3, :cond_2

    .line 26
    .line 27
    if-eq v3, v0, :cond_1

    .line 28
    .line 29
    const/4 v4, 0x2

    .line 30
    if-ne v3, v4, :cond_0

    .line 31
    .line 32
    invoke-virtual {p1, p0, v4}, Ll80;->f(Li41;I)J

    .line 33
    .line 34
    .line 35
    move-result-wide v10

    .line 36
    or-int/lit8 v5, v5, 0x4

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    new-instance p0, Lxg0;

    .line 40
    .line 41
    invoke-direct {p0, v3}, Lxg0;-><init>(I)V

    .line 42
    .line 43
    .line 44
    throw p0

    .line 45
    :cond_1
    invoke-virtual {p1, p0, v0}, Ll80;->f(Li41;I)J

    .line 46
    .line 47
    .line 48
    move-result-wide v8

    .line 49
    or-int/lit8 v5, v5, 0x2

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_2
    invoke-virtual {p1, p0, v1}, Ll80;->f(Li41;I)J

    .line 53
    .line 54
    .line 55
    move-result-wide v6

    .line 56
    or-int/lit8 v5, v5, 0x1

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_3
    move v2, v1

    .line 60
    goto :goto_0

    .line 61
    :cond_4
    invoke-virtual {p1, p0}, Ll80;->m(Li41;)V

    .line 62
    .line 63
    .line 64
    new-instance v4, Ljc1;

    .line 65
    .line 66
    invoke-direct/range {v4 .. v11}, Ljc1;-><init>(IJJJ)V

    .line 67
    .line 68
    .line 69
    return-object v4
.end method

.method public final c(Lqt;Ljava/lang/Object;)V
    .locals 10

    .line 1
    check-cast p2, Ljc1;

    .line 2
    .line 3
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    sget-object p0, Lhc1;->descriptor:Li41;

    .line 7
    .line 8
    invoke-virtual {p1, p0}, Lqt;->a(Li41;)Lqt;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iget-wide v0, p2, Ljc1;->a:J

    .line 13
    .line 14
    iget-wide v2, p2, Ljc1;->c:J

    .line 15
    .line 16
    iget-wide v4, p2, Ljc1;->b:J

    .line 17
    .line 18
    const/4 p2, 0x0

    .line 19
    invoke-virtual {p1, p0, p2, v0, v1}, Lqt;->e(Li41;IJ)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1, p0}, Lqt;->m(Li41;)Z

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    const-wide/16 v6, 0x3e8

    .line 27
    .line 28
    if-eqz p2, :cond_0

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    mul-long v8, v0, v6

    .line 32
    .line 33
    cmp-long p2, v4, v8

    .line 34
    .line 35
    if-eqz p2, :cond_1

    .line 36
    .line 37
    :goto_0
    const/4 p2, 0x1

    .line 38
    invoke-virtual {p1, p0, p2, v4, v5}, Lqt;->e(Li41;IJ)V

    .line 39
    .line 40
    .line 41
    :cond_1
    invoke-virtual {p1, p0}, Lqt;->m(Li41;)Z

    .line 42
    .line 43
    .line 44
    move-result p2

    .line 45
    if-eqz p2, :cond_2

    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_2
    div-long/2addr v0, v6

    .line 49
    cmp-long p2, v2, v0

    .line 50
    .line 51
    if-eqz p2, :cond_3

    .line 52
    .line 53
    :goto_1
    const/4 p2, 0x2

    .line 54
    invoke-virtual {p1, p0, p2, v2, v3}, Lqt;->e(Li41;IJ)V

    .line 55
    .line 56
    .line 57
    :cond_3
    invoke-virtual {p1, p0}, Lqt;->k(Li41;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public final d()Li41;
    .locals 0

    .line 1
    sget-object p0, Lhc1;->descriptor:Li41;

    .line 2
    .line 3
    return-object p0
.end method
