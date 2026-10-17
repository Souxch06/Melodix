.class public final synthetic Ls41;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lka0;


# static fields
.field public static final a:Ls41;

.field private static final descriptor:Li41;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Ls41;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ls41;->a:Ls41;

    .line 7
    .line 8
    new-instance v1, Llt0;

    .line 9
    .line 10
    const-string v2, "com.google.firebase.sessions.SessionData"

    .line 11
    .line 12
    const/4 v3, 0x3

    .line 13
    invoke-direct {v1, v2, v0, v3}, Llt0;-><init>(Ljava/lang/String;Lka0;I)V

    .line 14
    .line 15
    .line 16
    const-string v0, "sessionDetails"

    .line 17
    .line 18
    const/4 v2, 0x0

    .line 19
    invoke-virtual {v1, v0, v2}, Llt0;->k(Ljava/lang/String;Z)V

    .line 20
    .line 21
    .line 22
    const-string v0, "backgroundTime"

    .line 23
    .line 24
    const/4 v2, 0x1

    .line 25
    invoke-virtual {v1, v0, v2}, Llt0;->k(Ljava/lang/String;Z)V

    .line 26
    .line 27
    .line 28
    const-string v0, "processDataMap"

    .line 29
    .line 30
    invoke-virtual {v1, v0, v2}, Llt0;->k(Ljava/lang/String;Z)V

    .line 31
    .line 32
    .line 33
    sput-object v1, Ls41;->descriptor:Li41;

    .line 34
    .line 35
    return-void
.end method


# virtual methods
.method public final a()[Ldh0;
    .locals 5

    .line 1
    sget-object p0, Lu41;->d:[Ldh0;

    .line 2
    .line 3
    sget-object v0, Lhc1;->a:Lhc1;

    .line 4
    .line 5
    invoke-static {v0}, Lk42;->h(Ldh0;)Ldh0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x2

    .line 10
    aget-object p0, p0, v1

    .line 11
    .line 12
    invoke-static {p0}, Lk42;->h(Ldh0;)Ldh0;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const/4 v2, 0x3

    .line 17
    new-array v2, v2, [Ldh0;

    .line 18
    .line 19
    sget-object v3, Lw41;->a:Lw41;

    .line 20
    .line 21
    const/4 v4, 0x0

    .line 22
    aput-object v3, v2, v4

    .line 23
    .line 24
    const/4 v3, 0x1

    .line 25
    aput-object v0, v2, v3

    .line 26
    .line 27
    aput-object p0, v2, v1

    .line 28
    .line 29
    return-object v2
.end method

.method public final b(Ll80;)Ljava/lang/Object;
    .locals 10

    .line 1
    sget-object p0, Ls41;->descriptor:Li41;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Ll80;->a(Li41;)Ll80;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    sget-object v0, Lu41;->d:[Ldh0;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    const/4 v2, 0x0

    .line 11
    const/4 v3, 0x0

    .line 12
    move v6, v1

    .line 13
    move v7, v2

    .line 14
    move-object v4, v3

    .line 15
    move-object v5, v4

    .line 16
    :goto_0
    if-eqz v6, :cond_4

    .line 17
    .line 18
    invoke-virtual {p1, p0}, Ll80;->b(Li41;)I

    .line 19
    .line 20
    .line 21
    move-result v8

    .line 22
    const/4 v9, -0x1

    .line 23
    if-eq v8, v9, :cond_3

    .line 24
    .line 25
    if-eqz v8, :cond_2

    .line 26
    .line 27
    if-eq v8, v1, :cond_1

    .line 28
    .line 29
    const/4 v9, 0x2

    .line 30
    if-ne v8, v9, :cond_0

    .line 31
    .line 32
    aget-object v8, v0, v9

    .line 33
    .line 34
    invoke-virtual {p1, p0, v9, v8, v5}, Ll80;->h(Li41;ILdh0;Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v5

    .line 38
    check-cast v5, Ljava/util/Map;

    .line 39
    .line 40
    or-int/lit8 v7, v7, 0x4

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    new-instance p0, Lxg0;

    .line 44
    .line 45
    invoke-direct {p0, v8}, Lxg0;-><init>(I)V

    .line 46
    .line 47
    .line 48
    throw p0

    .line 49
    :cond_1
    sget-object v8, Lhc1;->a:Lhc1;

    .line 50
    .line 51
    invoke-virtual {p1, p0, v1, v8, v4}, Ll80;->h(Li41;ILdh0;Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v4

    .line 55
    check-cast v4, Ljc1;

    .line 56
    .line 57
    or-int/lit8 v7, v7, 0x2

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_2
    sget-object v8, Lw41;->a:Lw41;

    .line 61
    .line 62
    invoke-virtual {p1, p0, v2, v8, v3}, Ll80;->i(Li41;ILdh0;Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    check-cast v3, Ly41;

    .line 67
    .line 68
    or-int/lit8 v7, v7, 0x1

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_3
    move v6, v2

    .line 72
    goto :goto_0

    .line 73
    :cond_4
    invoke-virtual {p1, p0}, Ll80;->m(Li41;)V

    .line 74
    .line 75
    .line 76
    new-instance p0, Lu41;

    .line 77
    .line 78
    invoke-direct {p0, v7, v3, v4, v5}, Lu41;-><init>(ILy41;Ljc1;Ljava/util/Map;)V

    .line 79
    .line 80
    .line 81
    return-object p0
.end method

.method public final c(Lqt;Ljava/lang/Object;)V
    .locals 5

    .line 1
    check-cast p2, Lu41;

    .line 2
    .line 3
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    sget-object p0, Ls41;->descriptor:Li41;

    .line 7
    .line 8
    invoke-virtual {p1, p0}, Lqt;->a(Li41;)Lqt;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    sget-object v0, Lu41;->d:[Ldh0;

    .line 13
    .line 14
    sget-object v1, Lw41;->a:Lw41;

    .line 15
    .line 16
    iget-object v2, p2, Lu41;->a:Ly41;

    .line 17
    .line 18
    iget-object v3, p2, Lu41;->c:Ljava/util/Map;

    .line 19
    .line 20
    iget-object p2, p2, Lu41;->b:Ljc1;

    .line 21
    .line 22
    const/4 v4, 0x0

    .line 23
    invoke-virtual {p1, p0, v4, v1, v2}, Lqt;->h(Li41;ILdh0;Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1, p0}, Lqt;->m(Li41;)Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-eqz v1, :cond_0

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    if-eqz p2, :cond_1

    .line 34
    .line 35
    :goto_0
    sget-object v1, Lhc1;->a:Lhc1;

    .line 36
    .line 37
    const/4 v2, 0x1

    .line 38
    invoke-virtual {p1, p0, v2, v1, p2}, Lqt;->g(Li41;ILdh0;Ljava/lang/Object;)V

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
    if-eqz v3, :cond_3

    .line 49
    .line 50
    :goto_1
    const/4 p2, 0x2

    .line 51
    aget-object v0, v0, p2

    .line 52
    .line 53
    invoke-virtual {p1, p0, p2, v0, v3}, Lqt;->g(Li41;ILdh0;Ljava/lang/Object;)V

    .line 54
    .line 55
    .line 56
    :cond_3
    invoke-virtual {p1, p0}, Lqt;->k(Li41;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public final d()Li41;
    .locals 0

    .line 1
    sget-object p0, Ls41;->descriptor:Li41;

    .line 2
    .line 3
    return-object p0
.end method
