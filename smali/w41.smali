.class public final synthetic Lw41;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lka0;


# static fields
.field public static final a:Lw41;

.field private static final descriptor:Li41;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lw41;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lw41;->a:Lw41;

    .line 7
    .line 8
    new-instance v1, Llt0;

    .line 9
    .line 10
    const-string v2, "com.google.firebase.sessions.SessionDetails"

    .line 11
    .line 12
    const/4 v3, 0x4

    .line 13
    invoke-direct {v1, v2, v0, v3}, Llt0;-><init>(Ljava/lang/String;Lka0;I)V

    .line 14
    .line 15
    .line 16
    const-string v0, "sessionId"

    .line 17
    .line 18
    const/4 v2, 0x0

    .line 19
    invoke-virtual {v1, v0, v2}, Llt0;->k(Ljava/lang/String;Z)V

    .line 20
    .line 21
    .line 22
    const-string v0, "firstSessionId"

    .line 23
    .line 24
    invoke-virtual {v1, v0, v2}, Llt0;->k(Ljava/lang/String;Z)V

    .line 25
    .line 26
    .line 27
    const-string v0, "sessionIndex"

    .line 28
    .line 29
    invoke-virtual {v1, v0, v2}, Llt0;->k(Ljava/lang/String;Z)V

    .line 30
    .line 31
    .line 32
    const-string v0, "sessionStartTimestampUs"

    .line 33
    .line 34
    invoke-virtual {v1, v0, v2}, Llt0;->k(Ljava/lang/String;Z)V

    .line 35
    .line 36
    .line 37
    sput-object v1, Lw41;->descriptor:Li41;

    .line 38
    .line 39
    return-void
.end method


# virtual methods
.method public final a()[Ldh0;
    .locals 2

    .line 1
    const/4 p0, 0x4

    .line 2
    new-array p0, p0, [Ldh0;

    .line 3
    .line 4
    sget-object v0, Lba1;->a:Lba1;

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
    sget-object v0, Ldf0;->a:Ldf0;

    .line 13
    .line 14
    const/4 v1, 0x2

    .line 15
    aput-object v0, p0, v1

    .line 16
    .line 17
    sget-object v0, Ltk0;->a:Ltk0;

    .line 18
    .line 19
    const/4 v1, 0x3

    .line 20
    aput-object v0, p0, v1

    .line 21
    .line 22
    return-object p0
.end method

.method public final b(Ll80;)Ljava/lang/Object;
    .locals 12

    .line 1
    sget-object p0, Lw41;->descriptor:Li41;

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
    const-wide/16 v3, 0x0

    .line 11
    .line 12
    move v6, v1

    .line 13
    move v9, v6

    .line 14
    move-object v7, v2

    .line 15
    move-object v8, v7

    .line 16
    move-wide v10, v3

    .line 17
    move v2, v0

    .line 18
    :goto_0
    if-eqz v2, :cond_5

    .line 19
    .line 20
    invoke-virtual {p1, p0}, Ll80;->b(Li41;)I

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    const/4 v4, -0x1

    .line 25
    if-eq v3, v4, :cond_4

    .line 26
    .line 27
    if-eqz v3, :cond_3

    .line 28
    .line 29
    if-eq v3, v0, :cond_2

    .line 30
    .line 31
    const/4 v4, 0x2

    .line 32
    if-eq v3, v4, :cond_1

    .line 33
    .line 34
    const/4 v4, 0x3

    .line 35
    if-ne v3, v4, :cond_0

    .line 36
    .line 37
    invoke-virtual {p1, p0, v4}, Ll80;->f(Li41;I)J

    .line 38
    .line 39
    .line 40
    move-result-wide v10

    .line 41
    or-int/lit8 v6, v6, 0x8

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    new-instance p0, Lxg0;

    .line 45
    .line 46
    invoke-direct {p0, v3}, Lxg0;-><init>(I)V

    .line 47
    .line 48
    .line 49
    throw p0

    .line 50
    :cond_1
    invoke-virtual {p1, p0, v4}, Ll80;->d(Li41;I)I

    .line 51
    .line 52
    .line 53
    move-result v9

    .line 54
    or-int/lit8 v6, v6, 0x4

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_2
    invoke-virtual {p1, p0, v0}, Ll80;->l(Li41;I)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v8

    .line 61
    or-int/lit8 v6, v6, 0x2

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_3
    invoke-virtual {p1, p0, v1}, Ll80;->l(Li41;I)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v7

    .line 68
    or-int/lit8 v6, v6, 0x1

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_4
    move v2, v1

    .line 72
    goto :goto_0

    .line 73
    :cond_5
    invoke-virtual {p1, p0}, Ll80;->m(Li41;)V

    .line 74
    .line 75
    .line 76
    new-instance v5, Ly41;

    .line 77
    .line 78
    invoke-direct/range {v5 .. v11}, Ly41;-><init>(ILjava/lang/String;Ljava/lang/String;IJ)V

    .line 79
    .line 80
    .line 81
    return-object v5
.end method

.method public final c(Lqt;Ljava/lang/Object;)V
    .locals 3

    .line 1
    check-cast p2, Ly41;

    .line 2
    .line 3
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    sget-object p0, Lw41;->descriptor:Li41;

    .line 7
    .line 8
    invoke-virtual {p1, p0}, Lqt;->a(Li41;)Lqt;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iget-object v0, p2, Ly41;->a:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 15
    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    invoke-virtual {p1, p0, v1}, Lqt;->b(Li41;I)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1, v0}, Lqt;->j(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p2, Ly41;->b:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 27
    .line 28
    .line 29
    const/4 v1, 0x1

    .line 30
    invoke-virtual {p1, p0, v1}, Lqt;->b(Li41;I)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1, v0}, Lqt;->j(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    iget v0, p2, Ly41;->c:I

    .line 37
    .line 38
    const/4 v1, 0x2

    .line 39
    invoke-virtual {p1, p0, v1}, Lqt;->b(Li41;I)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p1, v0}, Lqt;->c(I)V

    .line 43
    .line 44
    .line 45
    const/4 v0, 0x3

    .line 46
    iget-wide v1, p2, Ly41;->d:J

    .line 47
    .line 48
    invoke-virtual {p1, p0, v0, v1, v2}, Lqt;->e(Li41;IJ)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p1, p0}, Lqt;->k(Li41;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public final d()Li41;
    .locals 0

    .line 1
    sget-object p0, Lw41;->descriptor:Li41;

    .line 2
    .line 3
    return-object p0
.end method
