.class public final synthetic Lp41;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lka0;


# static fields
.field public static final a:Lp41;

.field private static final descriptor:Li41;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lp41;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lp41;->a:Lp41;

    .line 7
    .line 8
    new-instance v1, Llt0;

    .line 9
    .line 10
    const-string v2, "com.google.firebase.sessions.settings.SessionConfigs"

    .line 11
    .line 12
    const/4 v3, 0x5

    .line 13
    invoke-direct {v1, v2, v0, v3}, Llt0;-><init>(Ljava/lang/String;Lka0;I)V

    .line 14
    .line 15
    .line 16
    const-string v0, "sessionsEnabled"

    .line 17
    .line 18
    const/4 v2, 0x0

    .line 19
    invoke-virtual {v1, v0, v2}, Llt0;->k(Ljava/lang/String;Z)V

    .line 20
    .line 21
    .line 22
    const-string v0, "sessionSamplingRate"

    .line 23
    .line 24
    invoke-virtual {v1, v0, v2}, Llt0;->k(Ljava/lang/String;Z)V

    .line 25
    .line 26
    .line 27
    const-string v0, "sessionTimeoutSeconds"

    .line 28
    .line 29
    invoke-virtual {v1, v0, v2}, Llt0;->k(Ljava/lang/String;Z)V

    .line 30
    .line 31
    .line 32
    const-string v0, "cacheDurationSeconds"

    .line 33
    .line 34
    invoke-virtual {v1, v0, v2}, Llt0;->k(Ljava/lang/String;Z)V

    .line 35
    .line 36
    .line 37
    const-string v0, "cacheUpdatedTimeSeconds"

    .line 38
    .line 39
    invoke-virtual {v1, v0, v2}, Llt0;->k(Ljava/lang/String;Z)V

    .line 40
    .line 41
    .line 42
    sput-object v1, Lp41;->descriptor:Li41;

    .line 43
    .line 44
    return-void
.end method


# virtual methods
.method public final a()[Ldh0;
    .locals 6

    .line 1
    sget-object p0, Lug;->a:Lug;

    .line 2
    .line 3
    invoke-static {p0}, Lk42;->h(Ldh0;)Ldh0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget-object v0, Lmy;->a:Lmy;

    .line 8
    .line 9
    invoke-static {v0}, Lk42;->h(Ldh0;)Ldh0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sget-object v1, Ldf0;->a:Ldf0;

    .line 14
    .line 15
    invoke-static {v1}, Lk42;->h(Ldh0;)Ldh0;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-static {v1}, Lk42;->h(Ldh0;)Ldh0;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    sget-object v3, Ltk0;->a:Ltk0;

    .line 24
    .line 25
    invoke-static {v3}, Lk42;->h(Ldh0;)Ldh0;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    const/4 v4, 0x5

    .line 30
    new-array v4, v4, [Ldh0;

    .line 31
    .line 32
    const/4 v5, 0x0

    .line 33
    aput-object p0, v4, v5

    .line 34
    .line 35
    const/4 p0, 0x1

    .line 36
    aput-object v0, v4, p0

    .line 37
    .line 38
    const/4 p0, 0x2

    .line 39
    aput-object v2, v4, p0

    .line 40
    .line 41
    const/4 p0, 0x3

    .line 42
    aput-object v1, v4, p0

    .line 43
    .line 44
    const/4 p0, 0x4

    .line 45
    aput-object v3, v4, p0

    .line 46
    .line 47
    return-object v4
.end method

.method public final b(Ll80;)Ljava/lang/Object;
    .locals 11

    .line 1
    sget-object p0, Lp41;->descriptor:Li41;

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
    const/4 v2, 0x0

    .line 10
    move v4, v1

    .line 11
    move-object v5, v2

    .line 12
    move-object v6, v5

    .line 13
    move-object v7, v6

    .line 14
    move-object v8, v7

    .line 15
    move-object v9, v8

    .line 16
    move v2, v0

    .line 17
    :goto_0
    if-eqz v2, :cond_6

    .line 18
    .line 19
    invoke-virtual {p1, p0}, Ll80;->b(Li41;)I

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    const/4 v10, -0x1

    .line 24
    if-eq v3, v10, :cond_5

    .line 25
    .line 26
    if-eqz v3, :cond_4

    .line 27
    .line 28
    if-eq v3, v0, :cond_3

    .line 29
    .line 30
    const/4 v10, 0x2

    .line 31
    if-eq v3, v10, :cond_2

    .line 32
    .line 33
    const/4 v10, 0x3

    .line 34
    if-eq v3, v10, :cond_1

    .line 35
    .line 36
    const/4 v10, 0x4

    .line 37
    if-ne v3, v10, :cond_0

    .line 38
    .line 39
    sget-object v3, Ltk0;->a:Ltk0;

    .line 40
    .line 41
    invoke-virtual {p1, p0, v10, v3, v9}, Ll80;->h(Li41;ILdh0;Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    move-object v9, v3

    .line 46
    check-cast v9, Ljava/lang/Long;

    .line 47
    .line 48
    or-int/lit8 v4, v4, 0x10

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_0
    new-instance p0, Lxg0;

    .line 52
    .line 53
    invoke-direct {p0, v3}, Lxg0;-><init>(I)V

    .line 54
    .line 55
    .line 56
    throw p0

    .line 57
    :cond_1
    sget-object v3, Ldf0;->a:Ldf0;

    .line 58
    .line 59
    invoke-virtual {p1, p0, v10, v3, v8}, Ll80;->h(Li41;ILdh0;Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v3

    .line 63
    move-object v8, v3

    .line 64
    check-cast v8, Ljava/lang/Integer;

    .line 65
    .line 66
    or-int/lit8 v4, v4, 0x8

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_2
    sget-object v3, Ldf0;->a:Ldf0;

    .line 70
    .line 71
    invoke-virtual {p1, p0, v10, v3, v7}, Ll80;->h(Li41;ILdh0;Ljava/lang/Object;)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v3

    .line 75
    move-object v7, v3

    .line 76
    check-cast v7, Ljava/lang/Integer;

    .line 77
    .line 78
    or-int/lit8 v4, v4, 0x4

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_3
    sget-object v3, Lmy;->a:Lmy;

    .line 82
    .line 83
    invoke-virtual {p1, p0, v0, v3, v6}, Ll80;->h(Li41;ILdh0;Ljava/lang/Object;)Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object v3

    .line 87
    move-object v6, v3

    .line 88
    check-cast v6, Ljava/lang/Double;

    .line 89
    .line 90
    or-int/lit8 v4, v4, 0x2

    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_4
    sget-object v3, Lug;->a:Lug;

    .line 94
    .line 95
    invoke-virtual {p1, p0, v1, v3, v5}, Ll80;->h(Li41;ILdh0;Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object v3

    .line 99
    move-object v5, v3

    .line 100
    check-cast v5, Ljava/lang/Boolean;

    .line 101
    .line 102
    or-int/lit8 v4, v4, 0x1

    .line 103
    .line 104
    goto :goto_0

    .line 105
    :cond_5
    move v2, v1

    .line 106
    goto :goto_0

    .line 107
    :cond_6
    invoke-virtual {p1, p0}, Ll80;->m(Li41;)V

    .line 108
    .line 109
    .line 110
    new-instance v3, Lr41;

    .line 111
    .line 112
    invoke-direct/range {v3 .. v9}, Lr41;-><init>(ILjava/lang/Boolean;Ljava/lang/Double;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Long;)V

    .line 113
    .line 114
    .line 115
    return-object v3
.end method

.method public final c(Lqt;Ljava/lang/Object;)V
    .locals 3

    .line 1
    check-cast p2, Lr41;

    .line 2
    .line 3
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    sget-object p0, Lp41;->descriptor:Li41;

    .line 7
    .line 8
    invoke-virtual {p1, p0}, Lqt;->a(Li41;)Lqt;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    sget-object v0, Lug;->a:Lug;

    .line 13
    .line 14
    iget-object v1, p2, Lr41;->a:Ljava/lang/Boolean;

    .line 15
    .line 16
    const/4 v2, 0x0

    .line 17
    invoke-virtual {p1, p0, v2, v0, v1}, Lqt;->g(Li41;ILdh0;Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    sget-object v0, Lmy;->a:Lmy;

    .line 21
    .line 22
    iget-object v1, p2, Lr41;->b:Ljava/lang/Double;

    .line 23
    .line 24
    const/4 v2, 0x1

    .line 25
    invoke-virtual {p1, p0, v2, v0, v1}, Lqt;->g(Li41;ILdh0;Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    sget-object v0, Ldf0;->a:Ldf0;

    .line 29
    .line 30
    iget-object v1, p2, Lr41;->c:Ljava/lang/Integer;

    .line 31
    .line 32
    const/4 v2, 0x2

    .line 33
    invoke-virtual {p1, p0, v2, v0, v1}, Lqt;->g(Li41;ILdh0;Ljava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    const/4 v1, 0x3

    .line 37
    iget-object v2, p2, Lr41;->d:Ljava/lang/Integer;

    .line 38
    .line 39
    invoke-virtual {p1, p0, v1, v0, v2}, Lqt;->g(Li41;ILdh0;Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    sget-object v0, Ltk0;->a:Ltk0;

    .line 43
    .line 44
    iget-object p2, p2, Lr41;->e:Ljava/lang/Long;

    .line 45
    .line 46
    const/4 v1, 0x4

    .line 47
    invoke-virtual {p1, p0, v1, v0, p2}, Lqt;->g(Li41;ILdh0;Ljava/lang/Object;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p1, p0}, Lqt;->k(Li41;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public final d()Li41;
    .locals 0

    .line 1
    sget-object p0, Lp41;->descriptor:Li41;

    .line 2
    .line 3
    return-object p0
.end method
