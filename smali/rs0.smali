.class public abstract Lrs0;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final a:Lmz;

.field public static final b:Lmz;

.field public static final c:Ljava/lang/Object;

.field public static volatile d:Lab0;

.field public static volatile e:Lab0;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lmz;

    .line 2
    .line 3
    const/16 v1, 0xc

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lmz;-><init>(I)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lrs0;->a:Lmz;

    .line 9
    .line 10
    new-instance v0, Lmz;

    .line 11
    .line 12
    const/16 v1, 0x13

    .line 13
    .line 14
    invoke-direct {v0, v1}, Lmz;-><init>(I)V

    .line 15
    .line 16
    .line 17
    sput-object v0, Lrs0;->b:Lmz;

    .line 18
    .line 19
    new-instance v0, Ljava/lang/Object;

    .line 20
    .line 21
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 22
    .line 23
    .line 24
    sput-object v0, Lrs0;->c:Ljava/lang/Object;

    .line 25
    .line 26
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance p0, Ljava/util/concurrent/ConcurrentHashMap;

    .line 5
    .line 6
    invoke-direct {p0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static final a(Lpv0;Lg30;Lkq;)Ljava/lang/Object;
    .locals 4

    .line 1
    instance-of v0, p2, Lnv0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p2

    .line 6
    check-cast v0, Lnv0;

    .line 7
    .line 8
    iget v1, v0, Lnv0;->o:I

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
    iput v1, v0, Lnv0;->o:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, Lnv0;

    .line 21
    .line 22
    invoke-direct {v0, p2}, Lkq;-><init>(Liq;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p2, v0, Lnv0;->n:Ljava/lang/Object;

    .line 26
    .line 27
    iget v1, v0, Lnv0;->o:I

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
    iget-object p1, v0, Lnv0;->m:Lg30;

    .line 36
    .line 37
    :try_start_0
    invoke-static {p2}, Lk42;->n(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 38
    .line 39
    .line 40
    goto :goto_1

    .line 41
    :catchall_0
    move-exception p0

    .line 42
    goto :goto_2

    .line 43
    :cond_1
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 44
    .line 45
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    return-object v2

    .line 49
    :cond_2
    invoke-static {p2}, Lk42;->n(Ljava/lang/Object;)V

    .line 50
    .line 51
    .line 52
    iget-object p2, v0, Lkq;->k:Lsq;

    .line 53
    .line 54
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 55
    .line 56
    .line 57
    sget-object v1, Ltb0;->n:Ltb0;

    .line 58
    .line 59
    invoke-interface {p2, v1}, Lsq;->j(Lrq;)Lqq;

    .line 60
    .line 61
    .line 62
    move-result-object p2

    .line 63
    if-ne p2, p0, :cond_4

    .line 64
    .line 65
    :try_start_1
    iput-object p1, v0, Lnv0;->m:Lg30;

    .line 66
    .line 67
    iput v3, v0, Lnv0;->o:I

    .line 68
    .line 69
    new-instance p2, Lvi;

    .line 70
    .line 71
    invoke-static {v0}, Lqe0;->i(Liq;)Liq;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-direct {p2, v3, v0}, Lvi;-><init>(ILiq;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {p2}, Lvi;->t()V

    .line 79
    .line 80
    .line 81
    new-instance v0, Lov0;

    .line 82
    .line 83
    invoke-direct {v0, p2}, Lov0;-><init>(Lvi;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p0, v0}, Lpv0;->W(Lov0;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {p2}, Lvi;->s()Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 93
    sget-object p2, Lar;->j:Lar;

    .line 94
    .line 95
    if-ne p0, p2, :cond_3

    .line 96
    .line 97
    return-object p2

    .line 98
    :cond_3
    :goto_1
    invoke-interface {p1}, Lp80;->a()Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    sget-object p0, Lwe1;->a:Lwe1;

    .line 102
    .line 103
    return-object p0

    .line 104
    :goto_2
    invoke-interface {p1}, Lp80;->a()Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    throw p0

    .line 108
    :cond_4
    const-string p0, "awaitClose() can only be invoked from the producer context"

    .line 109
    .line 110
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    return-object v2
.end method

.method public static final b(Lsq;Ljava/util/concurrent/CancellationException;)V
    .locals 1

    .line 1
    sget-object v0, Ltb0;->n:Ltb0;

    .line 2
    .line 3
    invoke-interface {p0, v0}, Lsq;->j(Lrq;)Lqq;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lng0;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lng0;->f(Ljava/util/concurrent/CancellationException;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public static f([Lw60;I)Lw60;
    .locals 10

    .line 1
    and-int/lit8 v0, p1, 0x1

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/16 v0, 0x190

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/16 v0, 0x2bc

    .line 9
    .line 10
    :goto_0
    and-int/lit8 p1, p1, 0x2

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    const/4 v2, 0x1

    .line 14
    if-eqz p1, :cond_1

    .line 15
    .line 16
    move p1, v2

    .line 17
    goto :goto_1

    .line 18
    :cond_1
    move p1, v1

    .line 19
    :goto_1
    array-length v3, p0

    .line 20
    const/4 v4, 0x0

    .line 21
    const v5, 0x7fffffff

    .line 22
    .line 23
    .line 24
    move v6, v1

    .line 25
    :goto_2
    if-ge v6, v3, :cond_5

    .line 26
    .line 27
    aget-object v7, p0, v6

    .line 28
    .line 29
    iget v8, v7, Lw60;->c:I

    .line 30
    .line 31
    sub-int/2addr v8, v0

    .line 32
    invoke-static {v8}, Ljava/lang/Math;->abs(I)I

    .line 33
    .line 34
    .line 35
    move-result v8

    .line 36
    mul-int/lit8 v8, v8, 0x2

    .line 37
    .line 38
    iget-boolean v9, v7, Lw60;->d:Z

    .line 39
    .line 40
    if-ne v9, p1, :cond_2

    .line 41
    .line 42
    move v9, v1

    .line 43
    goto :goto_3

    .line 44
    :cond_2
    move v9, v2

    .line 45
    :goto_3
    add-int/2addr v8, v9

    .line 46
    if-eqz v4, :cond_3

    .line 47
    .line 48
    if-le v5, v8, :cond_4

    .line 49
    .line 50
    :cond_3
    move-object v4, v7

    .line 51
    move v5, v8

    .line 52
    :cond_4
    add-int/lit8 v6, v6, 0x1

    .line 53
    .line 54
    goto :goto_2

    .line 55
    :cond_5
    return-object v4
.end method

.method public static g(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;
    .locals 1

    .line 1
    invoke-static {}, Lw01;->c()Lw01;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0, p1}, Lw01;->d(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static h(Landroid/os/Bundle;)Lfh1;
    .locals 1

    .line 1
    const-string v0, "android.support.v4.media.session.SESSION_TOKEN2"

    .line 2
    .line 3
    :try_start_0
    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroid/os/Bundle;

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const-class v0, Lrs0;

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p0, v0}, Landroid/os/Bundle;->setClassLoader(Ljava/lang/ClassLoader;)V

    .line 19
    .line 20
    .line 21
    const-string v0, "a"

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    instance-of v0, p0, Landroidx/versionedparcelable/ParcelImpl;

    .line 28
    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    check-cast p0, Landroidx/versionedparcelable/ParcelImpl;

    .line 32
    .line 33
    iget-object p0, p0, Landroidx/versionedparcelable/ParcelImpl;->j:Lfh1;

    .line 34
    .line 35
    return-object p0

    .line 36
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 37
    .line 38
    const-string v0, "Invalid parcel"

    .line 39
    .line 40
    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    throw p0
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 44
    :catch_0
    :goto_0
    const/4 p0, 0x0

    .line 45
    return-object p0
.end method

.method public static final i(Lsq;Ljava/lang/Throwable;)V
    .locals 3

    .line 1
    :try_start_0
    sget-object v0, Lt11;->l:Lt11;

    .line 2
    .line 3
    invoke-interface {p0, v0}, Lsq;->j(Lrq;)Lqq;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ld5;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ld5;->r(Ljava/lang/Throwable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :catchall_0
    move-exception v0

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    invoke-static {p0, p1}, Les0;->h(Lsq;Ljava/lang/Throwable;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :goto_0
    if-ne p1, v0, :cond_1

    .line 22
    .line 23
    goto :goto_1

    .line 24
    :cond_1
    new-instance v1, Ljava/lang/RuntimeException;

    .line 25
    .line 26
    const-string v2, "Exception while trying to handle coroutine exception"

    .line 27
    .line 28
    invoke-direct {v1, v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 29
    .line 30
    .line 31
    invoke-static {v1, p1}, Lbv;->b(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    .line 32
    .line 33
    .line 34
    move-object p1, v1

    .line 35
    :goto_1
    invoke-static {p0, p1}, Les0;->h(Lsq;Ljava/lang/Throwable;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public static final j(Lng0;ZLjg0;)Liy;
    .locals 8

    .line 1
    instance-of v0, p0, Lng0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lng0;->E(ZLjg0;)Liy;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    invoke-virtual {p2}, Ljg0;->l()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    new-instance v1, Lig0;

    .line 15
    .line 16
    const-string v6, "invoke(Ljava/lang/Throwable;)V"

    .line 17
    .line 18
    const/4 v7, 0x0

    .line 19
    const/4 v2, 0x1

    .line 20
    const-class v4, Ljg0;

    .line 21
    .line 22
    const-string v5, "invoke"

    .line 23
    .line 24
    move-object v3, p2

    .line 25
    invoke-direct/range {v1 .. v7}, Lp90;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    .line 26
    .line 27
    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    new-instance p2, Luf0;

    .line 31
    .line 32
    invoke-direct {p2, v1}, Luf0;-><init>(Lig0;)V

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    new-instance p2, Lvf0;

    .line 37
    .line 38
    invoke-direct {p2, v1}, Lvf0;-><init>(Lr80;)V

    .line 39
    .line 40
    .line 41
    :goto_0
    invoke-virtual {p0, p1, p2}, Lng0;->E(ZLjg0;)Liy;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0
.end method

.method public static final k(Lgc1;Lhu;Ljava/lang/Throwable;Lkq;)Ljava/lang/Object;
    .locals 4

    .line 1
    instance-of v0, p3, Lu50;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p3

    .line 6
    check-cast v0, Lu50;

    .line 7
    .line 8
    iget v1, v0, Lu50;->o:I

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
    iput v1, v0, Lu50;->o:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, Lu50;

    .line 21
    .line 22
    invoke-direct {v0, p3}, Lkq;-><init>(Liq;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p3, v0, Lu50;->n:Ljava/lang/Object;

    .line 26
    .line 27
    iget v1, v0, Lu50;->o:I

    .line 28
    .line 29
    const/4 v2, 0x1

    .line 30
    if-eqz v1, :cond_2

    .line 31
    .line 32
    if-ne v1, v2, :cond_1

    .line 33
    .line 34
    iget-object p2, v0, Lu50;->m:Ljava/lang/Throwable;

    .line 35
    .line 36
    :try_start_0
    invoke-static {p3}, Lk42;->n(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 37
    .line 38
    .line 39
    goto :goto_1

    .line 40
    :catchall_0
    move-exception p0

    .line 41
    goto :goto_2

    .line 42
    :cond_1
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 43
    .line 44
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    const/4 p0, 0x0

    .line 48
    return-object p0

    .line 49
    :cond_2
    invoke-static {p3}, Lk42;->n(Ljava/lang/Object;)V

    .line 50
    .line 51
    .line 52
    :try_start_1
    iput-object p2, v0, Lu50;->m:Ljava/lang/Throwable;

    .line 53
    .line 54
    iput v2, v0, Lu50;->o:I

    .line 55
    .line 56
    invoke-virtual {p1, p0, p2, v0}, Lhu;->e(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 60
    sget-object p1, Lar;->j:Lar;

    .line 61
    .line 62
    if-ne p0, p1, :cond_3

    .line 63
    .line 64
    return-object p1

    .line 65
    :cond_3
    :goto_1
    sget-object p0, Lwe1;->a:Lwe1;

    .line 66
    .line 67
    return-object p0

    .line 68
    :goto_2
    if-eqz p2, :cond_4

    .line 69
    .line 70
    if-eq p2, p0, :cond_4

    .line 71
    .line 72
    invoke-static {p0, p2}, Lbv;->b(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    .line 73
    .line 74
    .line 75
    :cond_4
    throw p0
.end method

.method public static m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    sub-int/2addr v0, v1

    .line 10
    if-ltz v0, :cond_2

    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    if-gt v0, v1, :cond_2

    .line 14
    .line 15
    new-instance v0, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    add-int/2addr v2, v1

    .line 26
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 27
    .line 28
    .line 29
    const/4 v1, 0x0

    .line 30
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    if-ge v1, v2, :cond_1

    .line 35
    .line 36
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    if-le v2, v1, :cond_0

    .line 48
    .line 49
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    return-object p0

    .line 64
    :cond_2
    const-string p0, "Invalid input received"

    .line 65
    .line 66
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    const/4 p0, 0x0

    .line 70
    return-object p0
.end method

.method public static n(Landroid/content/pm/PackageInfo;Ljava/io/File;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/io/File;

    .line 2
    .line 3
    const-string v1, "profileinstaller_profileWrittenFor_lastUpdateTime.dat"

    .line 4
    .line 5
    invoke-direct {v0, p1, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :try_start_0
    new-instance p1, Ljava/io/DataOutputStream;

    .line 9
    .line 10
    new-instance v1, Ljava/io/FileOutputStream;

    .line 11
    .line 12
    invoke-direct {v1, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 13
    .line 14
    .line 15
    invoke-direct {p1, v1}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 16
    .line 17
    .line 18
    :try_start_1
    iget-wide v0, p0, Landroid/content/pm/PackageInfo;->lastUpdateTime:J

    .line 19
    .line 20
    invoke-virtual {p1, v0, v1}, Ljava/io/DataOutputStream;->writeLong(J)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 21
    .line 22
    .line 23
    :try_start_2
    invoke-virtual {p1}, Ljava/io/OutputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :catchall_0
    move-exception p0

    .line 28
    :try_start_3
    invoke-virtual {p1}, Ljava/io/OutputStream;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :catchall_1
    move-exception p1

    .line 33
    :try_start_4
    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 34
    .line 35
    .line 36
    :goto_0
    throw p0
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    .line 37
    :catch_0
    return-void
.end method

.method public static o(Ljava/util/concurrent/Executor;Lj60;)Ljava/util/concurrent/Executor;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget-object v0, Ltx;->j:Ltx;

    .line 5
    .line 6
    if-ne p0, v0, :cond_0

    .line 7
    .line 8
    return-object p0

    .line 9
    :cond_0
    new-instance v0, Leo0;

    .line 10
    .line 11
    invoke-direct {v0, p0, p1}, Leo0;-><init>(Ljava/util/concurrent/Executor;Lj60;)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method public static p(Landroid/content/Context;Ljava/util/concurrent/Executor;Lqv0;Z)V
    .locals 18

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v5, p2

    .line 4
    .line 5
    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-virtual {v0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    invoke-virtual {v0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    .line 18
    .line 19
    .line 20
    move-result-object v4

    .line 21
    new-instance v0, Ljava/io/File;

    .line 22
    .line 23
    iget-object v3, v3, Landroid/content/pm/ApplicationInfo;->sourceDir:Ljava/lang/String;

    .line 24
    .line 25
    invoke-direct {v0, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v6

    .line 32
    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    const/4 v8, 0x7

    .line 37
    const/4 v9, 0x0

    .line 38
    :try_start_0
    invoke-virtual {v0, v2, v9}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    .line 39
    .line 40
    .line 41
    move-result-object v10
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_12

    .line 42
    invoke-virtual {v1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 43
    .line 44
    .line 45
    move-result-object v11

    .line 46
    const/4 v12, 0x0

    .line 47
    if-nez p3, :cond_4

    .line 48
    .line 49
    new-instance v0, Ljava/io/File;

    .line 50
    .line 51
    const-string v3, "profileinstaller_profileWrittenFor_lastUpdateTime.dat"

    .line 52
    .line 53
    invoke-direct {v0, v11, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 57
    .line 58
    .line 59
    move-result v3

    .line 60
    if-nez v3, :cond_0

    .line 61
    .line 62
    :catch_0
    move v0, v9

    .line 63
    goto :goto_2

    .line 64
    :cond_0
    :try_start_1
    new-instance v3, Ljava/io/DataInputStream;

    .line 65
    .line 66
    new-instance v7, Ljava/io/FileInputStream;

    .line 67
    .line 68
    invoke-direct {v7, v0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 69
    .line 70
    .line 71
    invoke-direct {v3, v7}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 72
    .line 73
    .line 74
    :try_start_2
    invoke-virtual {v3}, Ljava/io/DataInputStream;->readLong()J

    .line 75
    .line 76
    .line 77
    move-result-wide v14
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 78
    :try_start_3
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    .line 79
    .line 80
    .line 81
    move-wide/from16 v16, v14

    .line 82
    .line 83
    iget-wide v13, v10, Landroid/content/pm/PackageInfo;->lastUpdateTime:J

    .line 84
    .line 85
    cmp-long v0, v16, v13

    .line 86
    .line 87
    if-nez v0, :cond_1

    .line 88
    .line 89
    const/4 v0, 0x1

    .line 90
    goto :goto_0

    .line 91
    :cond_1
    move v0, v9

    .line 92
    :goto_0
    if-eqz v0, :cond_2

    .line 93
    .line 94
    const/4 v3, 0x2

    .line 95
    invoke-interface {v5, v3, v12}, Lqv0;->j(ILjava/lang/Object;)V

    .line 96
    .line 97
    .line 98
    goto :goto_2

    .line 99
    :catchall_0
    move-exception v0

    .line 100
    move-object v7, v0

    .line 101
    :try_start_4
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 102
    .line 103
    .line 104
    goto :goto_1

    .line 105
    :catchall_1
    move-exception v0

    .line 106
    :try_start_5
    invoke-virtual {v7, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 107
    .line 108
    .line 109
    :goto_1
    throw v7
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_0

    .line 110
    :cond_2
    :goto_2
    if-nez v0, :cond_3

    .line 111
    .line 112
    goto :goto_3

    .line 113
    :cond_3
    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    invoke-static {v1, v9}, Lwv0;->c(Landroid/content/Context;Z)V

    .line 117
    .line 118
    .line 119
    goto/16 :goto_30

    .line 120
    .line 121
    :cond_4
    :goto_3
    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    sget-object v13, Lfe1;->c:[B

    .line 125
    .line 126
    new-instance v7, Ljava/io/File;

    .line 127
    .line 128
    new-instance v0, Ljava/io/File;

    .line 129
    .line 130
    const-string v3, "/data/misc/profiles/cur/0"

    .line 131
    .line 132
    invoke-direct {v0, v3, v2}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 133
    .line 134
    .line 135
    const-string v2, "primary.prof"

    .line 136
    .line 137
    invoke-direct {v7, v0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    new-instance v2, Lix;

    .line 141
    .line 142
    const-string v0, "dexopt/baseline.prof"

    .line 143
    .line 144
    move-object v3, v4

    .line 145
    move-object/from16 v4, p1

    .line 146
    .line 147
    invoke-direct/range {v2 .. v7}, Lix;-><init>(Landroid/content/res/AssetManager;Ljava/util/concurrent/Executor;Lqv0;Ljava/lang/String;Ljava/io/File;)V

    .line 148
    .line 149
    .line 150
    iget-object v4, v2, Lix;->c:[B

    .line 151
    .line 152
    if-nez v4, :cond_5

    .line 153
    .line 154
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 155
    .line 156
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    const/4 v3, 0x3

    .line 161
    invoke-virtual {v2, v3, v0}, Lix;->b(ILjava/io/Serializable;)V

    .line 162
    .line 163
    .line 164
    :goto_4
    const/4 v6, 0x1

    .line 165
    goto/16 :goto_2d

    .line 166
    .line 167
    :cond_5
    invoke-virtual {v7}, Ljava/io/File;->exists()Z

    .line 168
    .line 169
    .line 170
    move-result v6

    .line 171
    const/4 v14, 0x4

    .line 172
    if-eqz v6, :cond_7

    .line 173
    .line 174
    invoke-virtual {v7}, Ljava/io/File;->canWrite()Z

    .line 175
    .line 176
    .line 177
    move-result v6

    .line 178
    if-nez v6, :cond_6

    .line 179
    .line 180
    invoke-virtual {v2, v14, v12}, Lix;->b(ILjava/io/Serializable;)V

    .line 181
    .line 182
    .line 183
    goto :goto_4

    .line 184
    :cond_6
    :goto_5
    const/4 v6, 0x1

    .line 185
    goto :goto_6

    .line 186
    :cond_7
    :try_start_6
    invoke-virtual {v7}, Ljava/io/File;->createNewFile()Z
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_11

    .line 187
    .line 188
    .line 189
    goto :goto_5

    .line 190
    :goto_6
    iput-boolean v6, v2, Lix;->f:Z

    .line 191
    .line 192
    const/4 v6, 0x6

    .line 193
    :try_start_7
    invoke-virtual {v2, v3, v0}, Lix;->a(Landroid/content/res/AssetManager;Ljava/lang/String;)Ljava/io/FileInputStream;

    .line 194
    .line 195
    .line 196
    move-result-object v0
    :try_end_7
    .catch Ljava/io/FileNotFoundException; {:try_start_7 .. :try_end_7} :catch_2
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_1

    .line 197
    move-object v7, v0

    .line 198
    goto :goto_8

    .line 199
    :catch_1
    move-exception v0

    .line 200
    invoke-interface {v5, v8, v0}, Lqv0;->j(ILjava/lang/Object;)V

    .line 201
    .line 202
    .line 203
    goto :goto_7

    .line 204
    :catch_2
    move-exception v0

    .line 205
    invoke-interface {v5, v6, v0}, Lqv0;->j(ILjava/lang/Object;)V

    .line 206
    .line 207
    .line 208
    :goto_7
    move-object v7, v12

    .line 209
    :goto_8
    const-string v15, "Invalid magic"

    .line 210
    .line 211
    const/16 v6, 0x8

    .line 212
    .line 213
    if-eqz v7, :cond_9

    .line 214
    .line 215
    :try_start_8
    invoke-static {v7, v14}, Lst;->l(Ljava/io/InputStream;I)[B

    .line 216
    .line 217
    .line 218
    move-result-object v0

    .line 219
    invoke-static {v13, v0}, Ljava/util/Arrays;->equals([B[B)Z

    .line 220
    .line 221
    .line 222
    move-result v0

    .line 223
    if-eqz v0, :cond_8

    .line 224
    .line 225
    invoke-static {v7, v14}, Lst;->l(Ljava/io/InputStream;I)[B

    .line 226
    .line 227
    .line 228
    move-result-object v0

    .line 229
    iget-object v9, v2, Lix;->e:Ljava/lang/String;

    .line 230
    .line 231
    invoke-static {v7, v0, v9}, Lfe1;->A(Ljava/io/FileInputStream;[BLjava/lang/String;)[Ljx;

    .line 232
    .line 233
    .line 234
    move-result-object v9
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_5
    .catch Ljava/lang/IllegalStateException; {:try_start_8 .. :try_end_8} :catch_4
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    .line 235
    :try_start_9
    invoke-virtual {v7}, Ljava/io/InputStream;->close()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_3

    .line 236
    .line 237
    .line 238
    goto :goto_d

    .line 239
    :catch_3
    move-exception v0

    .line 240
    invoke-interface {v5, v8, v0}, Lqv0;->j(ILjava/lang/Object;)V

    .line 241
    .line 242
    .line 243
    goto :goto_d

    .line 244
    :catchall_2
    move-exception v0

    .line 245
    move-object v1, v0

    .line 246
    goto :goto_e

    .line 247
    :catch_4
    move-exception v0

    .line 248
    goto :goto_9

    .line 249
    :catch_5
    move-exception v0

    .line 250
    goto :goto_b

    .line 251
    :cond_8
    :try_start_a
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 252
    .line 253
    invoke-direct {v0, v15}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 254
    .line 255
    .line 256
    throw v0
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_5
    .catch Ljava/lang/IllegalStateException; {:try_start_a .. :try_end_a} :catch_4
    .catchall {:try_start_a .. :try_end_a} :catchall_2

    .line 257
    :goto_9
    :try_start_b
    invoke-interface {v5, v6, v0}, Lqv0;->j(ILjava/lang/Object;)V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_2

    .line 258
    .line 259
    .line 260
    :goto_a
    :try_start_c
    invoke-virtual {v7}, Ljava/io/InputStream;->close()V
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_c} :catch_6

    .line 261
    .line 262
    .line 263
    goto :goto_c

    .line 264
    :catch_6
    move-exception v0

    .line 265
    invoke-interface {v5, v8, v0}, Lqv0;->j(ILjava/lang/Object;)V

    .line 266
    .line 267
    .line 268
    goto :goto_c

    .line 269
    :goto_b
    :try_start_d
    invoke-interface {v5, v8, v0}, Lqv0;->j(ILjava/lang/Object;)V
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_2

    .line 270
    .line 271
    .line 272
    goto :goto_a

    .line 273
    :goto_c
    move-object v9, v12

    .line 274
    :goto_d
    iput-object v9, v2, Lix;->g:[Ljx;

    .line 275
    .line 276
    goto :goto_10

    .line 277
    :goto_e
    :try_start_e
    invoke-virtual {v7}, Ljava/io/InputStream;->close()V
    :try_end_e
    .catch Ljava/io/IOException; {:try_start_e .. :try_end_e} :catch_7

    .line 278
    .line 279
    .line 280
    goto :goto_f

    .line 281
    :catch_7
    move-exception v0

    .line 282
    invoke-interface {v5, v8, v0}, Lqv0;->j(ILjava/lang/Object;)V

    .line 283
    .line 284
    .line 285
    :goto_f
    throw v1

    .line 286
    :cond_9
    :goto_10
    iget-object v0, v2, Lix;->g:[Ljx;

    .line 287
    .line 288
    if-eqz v0, :cond_f

    .line 289
    .line 290
    sget v7, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 291
    .line 292
    const/16 v9, 0x22

    .line 293
    .line 294
    if-le v7, v9, :cond_a

    .line 295
    .line 296
    goto/16 :goto_18

    .line 297
    .line 298
    :cond_a
    const/16 v9, 0x18

    .line 299
    .line 300
    if-eq v7, v9, :cond_b

    .line 301
    .line 302
    const/16 v9, 0x19

    .line 303
    .line 304
    if-eq v7, v9, :cond_b

    .line 305
    .line 306
    packed-switch v7, :pswitch_data_0

    .line 307
    .line 308
    .line 309
    goto :goto_18

    .line 310
    :cond_b
    :pswitch_0
    :try_start_f
    const-string v7, "dexopt/baseline.profm"

    .line 311
    .line 312
    invoke-virtual {v2, v3, v7}, Lix;->a(Landroid/content/res/AssetManager;Ljava/lang/String;)Ljava/io/FileInputStream;

    .line 313
    .line 314
    .line 315
    move-result-object v3
    :try_end_f
    .catch Ljava/io/FileNotFoundException; {:try_start_f .. :try_end_f} :catch_a
    .catch Ljava/io/IOException; {:try_start_f .. :try_end_f} :catch_9
    .catch Ljava/lang/IllegalStateException; {:try_start_f .. :try_end_f} :catch_8

    .line 316
    if-eqz v3, :cond_d

    .line 317
    .line 318
    :try_start_10
    sget-object v7, Lfe1;->d:[B

    .line 319
    .line 320
    invoke-static {v3, v14}, Lst;->l(Ljava/io/InputStream;I)[B

    .line 321
    .line 322
    .line 323
    move-result-object v9

    .line 324
    invoke-static {v7, v9}, Ljava/util/Arrays;->equals([B[B)Z

    .line 325
    .line 326
    .line 327
    move-result v7

    .line 328
    if-eqz v7, :cond_c

    .line 329
    .line 330
    invoke-static {v3, v14}, Lst;->l(Ljava/io/InputStream;I)[B

    .line 331
    .line 332
    .line 333
    move-result-object v7

    .line 334
    invoke-static {v3, v7, v4, v0}, Lfe1;->x(Ljava/io/FileInputStream;[B[B[Ljx;)[Ljx;

    .line 335
    .line 336
    .line 337
    move-result-object v0

    .line 338
    iput-object v0, v2, Lix;->g:[Ljx;
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_3

    .line 339
    .line 340
    :try_start_11
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_11
    .catch Ljava/io/FileNotFoundException; {:try_start_11 .. :try_end_11} :catch_a
    .catch Ljava/io/IOException; {:try_start_11 .. :try_end_11} :catch_9
    .catch Ljava/lang/IllegalStateException; {:try_start_11 .. :try_end_11} :catch_8

    .line 341
    .line 342
    .line 343
    move-object v0, v2

    .line 344
    goto :goto_17

    .line 345
    :catch_8
    move-exception v0

    .line 346
    goto :goto_13

    .line 347
    :catch_9
    move-exception v0

    .line 348
    goto :goto_14

    .line 349
    :catch_a
    move-exception v0

    .line 350
    goto :goto_15

    .line 351
    :catchall_3
    move-exception v0

    .line 352
    move-object v4, v0

    .line 353
    goto :goto_11

    .line 354
    :cond_c
    :try_start_12
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 355
    .line 356
    invoke-direct {v0, v15}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 357
    .line 358
    .line 359
    throw v0
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_3

    .line 360
    :goto_11
    :try_start_13
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_4

    .line 361
    .line 362
    .line 363
    goto :goto_12

    .line 364
    :catchall_4
    move-exception v0

    .line 365
    :try_start_14
    invoke-virtual {v4, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 366
    .line 367
    .line 368
    :goto_12
    throw v4

    .line 369
    :cond_d
    if-eqz v3, :cond_e

    .line 370
    .line 371
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_14
    .catch Ljava/io/FileNotFoundException; {:try_start_14 .. :try_end_14} :catch_a
    .catch Ljava/io/IOException; {:try_start_14 .. :try_end_14} :catch_9
    .catch Ljava/lang/IllegalStateException; {:try_start_14 .. :try_end_14} :catch_8

    .line 372
    .line 373
    .line 374
    goto :goto_16

    .line 375
    :goto_13
    iput-object v12, v2, Lix;->g:[Ljx;

    .line 376
    .line 377
    invoke-interface {v5, v6, v0}, Lqv0;->j(ILjava/lang/Object;)V

    .line 378
    .line 379
    .line 380
    goto :goto_16

    .line 381
    :goto_14
    invoke-interface {v5, v8, v0}, Lqv0;->j(ILjava/lang/Object;)V

    .line 382
    .line 383
    .line 384
    goto :goto_16

    .line 385
    :goto_15
    const/16 v3, 0x9

    .line 386
    .line 387
    invoke-interface {v5, v3, v0}, Lqv0;->j(ILjava/lang/Object;)V

    .line 388
    .line 389
    .line 390
    :cond_e
    :goto_16
    move-object v0, v12

    .line 391
    :goto_17
    if-eqz v0, :cond_f

    .line 392
    .line 393
    move-object v2, v0

    .line 394
    :cond_f
    :goto_18
    iget-object v3, v2, Lix;->b:Lqv0;

    .line 395
    .line 396
    iget-object v0, v2, Lix;->g:[Ljx;

    .line 397
    .line 398
    iget-object v4, v2, Lix;->c:[B

    .line 399
    .line 400
    const-string v5, "This device doesn\'t support aot. Did you call deviceSupportsAotProfile()?"

    .line 401
    .line 402
    if-eqz v0, :cond_13

    .line 403
    .line 404
    if-nez v4, :cond_10

    .line 405
    .line 406
    goto :goto_1e

    .line 407
    :cond_10
    iget-boolean v7, v2, Lix;->f:Z

    .line 408
    .line 409
    if-eqz v7, :cond_12

    .line 410
    .line 411
    :try_start_15
    new-instance v7, Ljava/io/ByteArrayOutputStream;

    .line 412
    .line 413
    invoke-direct {v7}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_15
    .catch Ljava/io/IOException; {:try_start_15 .. :try_end_15} :catch_c
    .catch Ljava/lang/IllegalStateException; {:try_start_15 .. :try_end_15} :catch_b

    .line 414
    .line 415
    .line 416
    :try_start_16
    invoke-virtual {v7, v13}, Ljava/io/OutputStream;->write([B)V

    .line 417
    .line 418
    .line 419
    invoke-virtual {v7, v4}, Ljava/io/OutputStream;->write([B)V

    .line 420
    .line 421
    .line 422
    invoke-static {v7, v4, v0}, Lfe1;->E(Ljava/io/ByteArrayOutputStream;[B[Ljx;)Z

    .line 423
    .line 424
    .line 425
    move-result v0

    .line 426
    if-nez v0, :cond_11

    .line 427
    .line 428
    const/4 v0, 0x5

    .line 429
    invoke-interface {v3, v0, v12}, Lqv0;->j(ILjava/lang/Object;)V

    .line 430
    .line 431
    .line 432
    iput-object v12, v2, Lix;->g:[Ljx;
    :try_end_16
    .catchall {:try_start_16 .. :try_end_16} :catchall_5

    .line 433
    .line 434
    :try_start_17
    invoke-virtual {v7}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_17
    .catch Ljava/io/IOException; {:try_start_17 .. :try_end_17} :catch_c
    .catch Ljava/lang/IllegalStateException; {:try_start_17 .. :try_end_17} :catch_b

    .line 435
    .line 436
    .line 437
    goto :goto_1e

    .line 438
    :catch_b
    move-exception v0

    .line 439
    goto :goto_1b

    .line 440
    :catch_c
    move-exception v0

    .line 441
    goto :goto_1c

    .line 442
    :catchall_5
    move-exception v0

    .line 443
    move-object v4, v0

    .line 444
    goto :goto_19

    .line 445
    :cond_11
    :try_start_18
    invoke-virtual {v7}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    .line 446
    .line 447
    .line 448
    move-result-object v0

    .line 449
    iput-object v0, v2, Lix;->h:[B
    :try_end_18
    .catchall {:try_start_18 .. :try_end_18} :catchall_5

    .line 450
    .line 451
    :try_start_19
    invoke-virtual {v7}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_19
    .catch Ljava/io/IOException; {:try_start_19 .. :try_end_19} :catch_c
    .catch Ljava/lang/IllegalStateException; {:try_start_19 .. :try_end_19} :catch_b

    .line 452
    .line 453
    .line 454
    goto :goto_1d

    .line 455
    :goto_19
    :try_start_1a
    invoke-virtual {v7}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_1a
    .catchall {:try_start_1a .. :try_end_1a} :catchall_6

    .line 456
    .line 457
    .line 458
    goto :goto_1a

    .line 459
    :catchall_6
    move-exception v0

    .line 460
    :try_start_1b
    invoke-virtual {v4, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 461
    .line 462
    .line 463
    :goto_1a
    throw v4
    :try_end_1b
    .catch Ljava/io/IOException; {:try_start_1b .. :try_end_1b} :catch_c
    .catch Ljava/lang/IllegalStateException; {:try_start_1b .. :try_end_1b} :catch_b

    .line 464
    :goto_1b
    invoke-interface {v3, v6, v0}, Lqv0;->j(ILjava/lang/Object;)V

    .line 465
    .line 466
    .line 467
    goto :goto_1d

    .line 468
    :goto_1c
    invoke-interface {v3, v8, v0}, Lqv0;->j(ILjava/lang/Object;)V

    .line 469
    .line 470
    .line 471
    :goto_1d
    iput-object v12, v2, Lix;->g:[Ljx;

    .line 472
    .line 473
    goto :goto_1e

    .line 474
    :cond_12
    invoke-static {v5}, Lz0;->g(Ljava/lang/String;)V

    .line 475
    .line 476
    .line 477
    return-void

    .line 478
    :cond_13
    :goto_1e
    iget-object v0, v2, Lix;->h:[B

    .line 479
    .line 480
    if-nez v0, :cond_14

    .line 481
    .line 482
    const/4 v0, 0x0

    .line 483
    const/4 v6, 0x1

    .line 484
    goto/16 :goto_2b

    .line 485
    .line 486
    :cond_14
    iget-boolean v3, v2, Lix;->f:Z

    .line 487
    .line 488
    if-eqz v3, :cond_16

    .line 489
    .line 490
    :try_start_1c
    new-instance v3, Ljava/io/ByteArrayInputStream;

    .line 491
    .line 492
    invoke-direct {v3, v0}, Ljava/io/ByteArrayInputStream;-><init>([B)V
    :try_end_1c
    .catch Ljava/io/FileNotFoundException; {:try_start_1c .. :try_end_1c} :catch_10
    .catch Ljava/io/IOException; {:try_start_1c .. :try_end_1c} :catch_f
    .catchall {:try_start_1c .. :try_end_1c} :catchall_7

    .line 493
    .line 494
    .line 495
    :try_start_1d
    new-instance v4, Ljava/io/FileOutputStream;

    .line 496
    .line 497
    iget-object v0, v2, Lix;->d:Ljava/io/File;

    .line 498
    .line 499
    invoke-direct {v4, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_1d
    .catchall {:try_start_1d .. :try_end_1d} :catchall_c

    .line 500
    .line 501
    .line 502
    const/16 v0, 0x200

    .line 503
    .line 504
    :try_start_1e
    new-array v0, v0, [B

    .line 505
    .line 506
    :goto_1f
    invoke-virtual {v3, v0}, Ljava/io/InputStream;->read([B)I

    .line 507
    .line 508
    .line 509
    move-result v5

    .line 510
    if-lez v5, :cond_15

    .line 511
    .line 512
    const/4 v6, 0x0

    .line 513
    invoke-virtual {v4, v0, v6, v5}, Ljava/io/OutputStream;->write([BII)V
    :try_end_1e
    .catchall {:try_start_1e .. :try_end_1e} :catchall_a

    .line 514
    .line 515
    .line 516
    goto :goto_1f

    .line 517
    :cond_15
    const/4 v6, 0x1

    .line 518
    :try_start_1f
    invoke-virtual {v2, v6, v12}, Lix;->b(ILjava/io/Serializable;)V
    :try_end_1f
    .catchall {:try_start_1f .. :try_end_1f} :catchall_9

    .line 519
    .line 520
    .line 521
    :try_start_20
    invoke-virtual {v4}, Ljava/io/OutputStream;->close()V
    :try_end_20
    .catchall {:try_start_20 .. :try_end_20} :catchall_8

    .line 522
    .line 523
    .line 524
    :try_start_21
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_21
    .catch Ljava/io/FileNotFoundException; {:try_start_21 .. :try_end_21} :catch_e
    .catch Ljava/io/IOException; {:try_start_21 .. :try_end_21} :catch_d
    .catchall {:try_start_21 .. :try_end_21} :catchall_7

    .line 525
    .line 526
    .line 527
    iput-object v12, v2, Lix;->h:[B

    .line 528
    .line 529
    iput-object v12, v2, Lix;->g:[Ljx;

    .line 530
    .line 531
    move v0, v6

    .line 532
    goto :goto_2b

    .line 533
    :catchall_7
    move-exception v0

    .line 534
    goto :goto_2c

    .line 535
    :catch_d
    move-exception v0

    .line 536
    goto :goto_27

    .line 537
    :catch_e
    move-exception v0

    .line 538
    :goto_20
    const/4 v3, 0x6

    .line 539
    goto :goto_29

    .line 540
    :catchall_8
    move-exception v0

    .line 541
    :goto_21
    move-object v4, v0

    .line 542
    goto :goto_25

    .line 543
    :catchall_9
    move-exception v0

    .line 544
    :goto_22
    move-object v5, v0

    .line 545
    goto :goto_23

    .line 546
    :catchall_a
    move-exception v0

    .line 547
    const/4 v6, 0x1

    .line 548
    goto :goto_22

    .line 549
    :goto_23
    :try_start_22
    invoke-virtual {v4}, Ljava/io/OutputStream;->close()V
    :try_end_22
    .catchall {:try_start_22 .. :try_end_22} :catchall_b

    .line 550
    .line 551
    .line 552
    goto :goto_24

    .line 553
    :catchall_b
    move-exception v0

    .line 554
    :try_start_23
    invoke-virtual {v5, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 555
    .line 556
    .line 557
    :goto_24
    throw v5
    :try_end_23
    .catchall {:try_start_23 .. :try_end_23} :catchall_8

    .line 558
    :catchall_c
    move-exception v0

    .line 559
    const/4 v6, 0x1

    .line 560
    goto :goto_21

    .line 561
    :goto_25
    :try_start_24
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_24
    .catchall {:try_start_24 .. :try_end_24} :catchall_d

    .line 562
    .line 563
    .line 564
    goto :goto_26

    .line 565
    :catchall_d
    move-exception v0

    .line 566
    :try_start_25
    invoke-virtual {v4, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 567
    .line 568
    .line 569
    :goto_26
    throw v4
    :try_end_25
    .catch Ljava/io/FileNotFoundException; {:try_start_25 .. :try_end_25} :catch_e
    .catch Ljava/io/IOException; {:try_start_25 .. :try_end_25} :catch_d
    .catchall {:try_start_25 .. :try_end_25} :catchall_7

    .line 570
    :catch_f
    move-exception v0

    .line 571
    const/4 v6, 0x1

    .line 572
    goto :goto_27

    .line 573
    :catch_10
    move-exception v0

    .line 574
    const/4 v6, 0x1

    .line 575
    goto :goto_20

    .line 576
    :goto_27
    :try_start_26
    invoke-virtual {v2, v8, v0}, Lix;->b(ILjava/io/Serializable;)V
    :try_end_26
    .catchall {:try_start_26 .. :try_end_26} :catchall_7

    .line 577
    .line 578
    .line 579
    :goto_28
    iput-object v12, v2, Lix;->h:[B

    .line 580
    .line 581
    iput-object v12, v2, Lix;->g:[Ljx;

    .line 582
    .line 583
    goto :goto_2a

    .line 584
    :goto_29
    :try_start_27
    invoke-virtual {v2, v3, v0}, Lix;->b(ILjava/io/Serializable;)V
    :try_end_27
    .catchall {:try_start_27 .. :try_end_27} :catchall_7

    .line 585
    .line 586
    .line 587
    goto :goto_28

    .line 588
    :goto_2a
    const/4 v0, 0x0

    .line 589
    :goto_2b
    if-eqz v0, :cond_17

    .line 590
    .line 591
    invoke-static {v10, v11}, Lrs0;->n(Landroid/content/pm/PackageInfo;Ljava/io/File;)V

    .line 592
    .line 593
    .line 594
    goto :goto_2e

    .line 595
    :goto_2c
    iput-object v12, v2, Lix;->h:[B

    .line 596
    .line 597
    iput-object v12, v2, Lix;->g:[Ljx;

    .line 598
    .line 599
    throw v0

    .line 600
    :cond_16
    invoke-static {v5}, Lz0;->g(Ljava/lang/String;)V

    .line 601
    .line 602
    .line 603
    return-void

    .line 604
    :catch_11
    const/4 v6, 0x1

    .line 605
    invoke-virtual {v2, v14, v12}, Lix;->b(ILjava/io/Serializable;)V

    .line 606
    .line 607
    .line 608
    :goto_2d
    const/4 v0, 0x0

    .line 609
    :cond_17
    :goto_2e
    if-eqz v0, :cond_18

    .line 610
    .line 611
    if-eqz p3, :cond_18

    .line 612
    .line 613
    move v9, v6

    .line 614
    goto :goto_2f

    .line 615
    :cond_18
    const/4 v9, 0x0

    .line 616
    :goto_2f
    invoke-static {v1, v9}, Lwv0;->c(Landroid/content/Context;Z)V

    .line 617
    .line 618
    .line 619
    :goto_30
    return-void

    .line 620
    :catch_12
    move-exception v0

    .line 621
    invoke-interface {v5, v8, v0}, Lqv0;->j(ILjava/lang/Object;)V

    .line 622
    .line 623
    .line 624
    const/4 v6, 0x0

    .line 625
    invoke-static {v1, v6}, Lwv0;->c(Landroid/content/Context;Z)V

    .line 626
    .line 627
    .line 628
    return-void

    .line 629
    :pswitch_data_0
    .packed-switch 0x1f
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public static q([B)Ljava/lang/String;
    .locals 5

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    array-length v1, p0

    .line 4
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 5
    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    :goto_0
    array-length v2, p0

    .line 9
    if-ge v1, v2, :cond_4

    .line 10
    .line 11
    aget-byte v2, p0, v1

    .line 12
    .line 13
    const/16 v3, 0x22

    .line 14
    .line 15
    if-eq v2, v3, :cond_3

    .line 16
    .line 17
    const/16 v3, 0x27

    .line 18
    .line 19
    if-eq v2, v3, :cond_2

    .line 20
    .line 21
    const/16 v3, 0x5c

    .line 22
    .line 23
    if-eq v2, v3, :cond_1

    .line 24
    .line 25
    packed-switch v2, :pswitch_data_0

    .line 26
    .line 27
    .line 28
    const/16 v4, 0x20

    .line 29
    .line 30
    if-lt v2, v4, :cond_0

    .line 31
    .line 32
    const/16 v4, 0x7e

    .line 33
    .line 34
    if-gt v2, v4, :cond_0

    .line 35
    .line 36
    int-to-char v2, v2

    .line 37
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    goto :goto_1

    .line 41
    :cond_0
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    ushr-int/lit8 v3, v2, 0x6

    .line 45
    .line 46
    and-int/lit8 v3, v3, 0x3

    .line 47
    .line 48
    add-int/lit8 v3, v3, 0x30

    .line 49
    .line 50
    int-to-char v3, v3

    .line 51
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    ushr-int/lit8 v3, v2, 0x3

    .line 55
    .line 56
    and-int/lit8 v3, v3, 0x7

    .line 57
    .line 58
    add-int/lit8 v3, v3, 0x30

    .line 59
    .line 60
    int-to-char v3, v3

    .line 61
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    and-int/lit8 v2, v2, 0x7

    .line 65
    .line 66
    add-int/lit8 v2, v2, 0x30

    .line 67
    .line 68
    int-to-char v2, v2

    .line 69
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    goto :goto_1

    .line 73
    :pswitch_0
    const-string v2, "\\r"

    .line 74
    .line 75
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    goto :goto_1

    .line 79
    :pswitch_1
    const-string v2, "\\f"

    .line 80
    .line 81
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    goto :goto_1

    .line 85
    :pswitch_2
    const-string v2, "\\v"

    .line 86
    .line 87
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    goto :goto_1

    .line 91
    :pswitch_3
    const-string v2, "\\n"

    .line 92
    .line 93
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    goto :goto_1

    .line 97
    :pswitch_4
    const-string v2, "\\t"

    .line 98
    .line 99
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    goto :goto_1

    .line 103
    :pswitch_5
    const-string v2, "\\b"

    .line 104
    .line 105
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    goto :goto_1

    .line 109
    :pswitch_6
    const-string v2, "\\a"

    .line 110
    .line 111
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    goto :goto_1

    .line 115
    :cond_1
    const-string v2, "\\\\"

    .line 116
    .line 117
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    goto :goto_1

    .line 121
    :cond_2
    const-string v2, "\\\'"

    .line 122
    .line 123
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    goto :goto_1

    .line 127
    :cond_3
    const-string v2, "\\\""

    .line 128
    .line 129
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 133
    .line 134
    goto :goto_0

    .line 135
    :cond_4
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object p0

    .line 139
    return-object p0

    .line 140
    nop

    .line 141
    :pswitch_data_0
    .packed-switch 0x7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static varargs r(ZLjava/lang/String;[Ljava/lang/Object;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 5
    .line 6
    invoke-static {p1, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    throw p0
.end method


# virtual methods
.method public abstract c(Landroid/content/Context;Lt60;Landroid/content/res/Resources;I)Landroid/graphics/Typeface;
.end method

.method public abstract d(Landroid/content/Context;[Lw60;I)Landroid/graphics/Typeface;
.end method

.method public e(Landroid/content/Context;Landroid/content/res/Resources;ILjava/lang/String;I)Landroid/graphics/Typeface;
    .locals 0

    .line 1
    invoke-static {p1}, Lfe1;->q(Landroid/content/Context;)Ljava/io/File;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 p1, 0x0

    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    return-object p1

    .line 9
    :cond_0
    :try_start_0
    invoke-static {p0, p2, p3}, Lfe1;->h(Ljava/io/File;Landroid/content/res/Resources;I)Z

    .line 10
    .line 11
    .line 12
    move-result p2
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    if-nez p2, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    .line 16
    .line 17
    .line 18
    return-object p1

    .line 19
    :cond_1
    :try_start_1
    invoke-virtual {p0}, Ljava/io/File;->getPath()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    invoke-static {p2}, Landroid/graphics/Typeface;->createFromFile(Ljava/lang/String;)Landroid/graphics/Typeface;

    .line 24
    .line 25
    .line 26
    move-result-object p1
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 27
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    .line 28
    .line 29
    .line 30
    return-object p1

    .line 31
    :catchall_0
    move-exception p1

    .line 32
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    .line 33
    .line 34
    .line 35
    throw p1

    .line 36
    :catch_0
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    .line 37
    .line 38
    .line 39
    return-object p1
.end method

.method public abstract l(C)Z
.end method
