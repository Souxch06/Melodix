.class public final Lvd2;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final a:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lvd2;->a:Ljava/lang/Object;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 4

    .line 1
    iget-object p0, p0, Lvd2;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Ly02;

    .line 4
    .line 5
    iget-object v0, p0, Ly02;->p:Ls02;

    .line 6
    .line 7
    iget-object v1, p0, Ly02;->n:Lvz1;

    .line 8
    .line 9
    invoke-static {v0}, Ly02;->l(Lm22;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0}, Ls02;->l()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Ly02;->e()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_2

    .line 20
    .line 21
    invoke-virtual {p2}, Landroid/os/BaseBundle;->isEmpty()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    const/4 p1, 0x0

    .line 28
    goto :goto_1

    .line 29
    :cond_0
    new-instance v0, Landroid/net/Uri$Builder;

    .line 30
    .line 31
    invoke-direct {v0}, Landroid/net/Uri$Builder;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, p1}, Landroid/net/Uri$Builder;->path(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {p2}, Landroid/os/BaseBundle;->keySet()Ljava/util/Set;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    if-eqz v2, :cond_1

    .line 50
    .line 51
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    check-cast v2, Ljava/lang/String;

    .line 56
    .line 57
    invoke-virtual {p2, v2}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    invoke-virtual {v0, v2, v3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 62
    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_1
    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    :goto_1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 74
    .line 75
    .line 76
    move-result p2

    .line 77
    if-nez p2, :cond_2

    .line 78
    .line 79
    invoke-static {v1}, Ly02;->j(Let;)V

    .line 80
    .line 81
    .line 82
    iget-object p2, v1, Lvz1;->F:Lvx;

    .line 83
    .line 84
    invoke-virtual {p2, p1}, Lvx;->f(Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    iget-object p1, v1, Lvz1;->G:Lrz1;

    .line 88
    .line 89
    iget-object p0, p0, Ly02;->t:Lmz;

    .line 90
    .line 91
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 92
    .line 93
    .line 94
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 95
    .line 96
    .line 97
    move-result-wide v0

    .line 98
    invoke-virtual {p1, v0, v1}, Lrz1;->b(J)V

    .line 99
    .line 100
    .line 101
    :cond_2
    return-void
.end method

.method public b()Z
    .locals 4

    .line 1
    invoke-virtual {p0}, Lvd2;->c()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object p0, p0, Lvd2;->a:Ljava/lang/Object;

    .line 9
    .line 10
    check-cast p0, Ly02;

    .line 11
    .line 12
    iget-object v0, p0, Ly02;->t:Lmz;

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 15
    .line 16
    .line 17
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 18
    .line 19
    .line 20
    move-result-wide v0

    .line 21
    iget-object v2, p0, Ly02;->n:Lvz1;

    .line 22
    .line 23
    invoke-static {v2}, Ly02;->j(Let;)V

    .line 24
    .line 25
    .line 26
    iget-object v2, v2, Lvz1;->G:Lrz1;

    .line 27
    .line 28
    invoke-virtual {v2}, Lrz1;->a()J

    .line 29
    .line 30
    .line 31
    move-result-wide v2

    .line 32
    sub-long/2addr v0, v2

    .line 33
    iget-object p0, p0, Ly02;->m:Lmt1;

    .line 34
    .line 35
    const/4 v2, 0x0

    .line 36
    sget-object v3, Lxx1;->i0:Lwx1;

    .line 37
    .line 38
    invoke-virtual {p0, v2, v3}, Lmt1;->t(Ljava/lang/String;Lwx1;)J

    .line 39
    .line 40
    .line 41
    move-result-wide v2

    .line 42
    cmp-long p0, v0, v2

    .line 43
    .line 44
    if-lez p0, :cond_1

    .line 45
    .line 46
    const/4 p0, 0x1

    .line 47
    return p0

    .line 48
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 49
    return p0
.end method

.method public c()Z
    .locals 4

    .line 1
    iget-object p0, p0, Lvd2;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Ly02;

    .line 4
    .line 5
    iget-object p0, p0, Ly02;->n:Lvz1;

    .line 6
    .line 7
    invoke-static {p0}, Ly02;->j(Let;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lvz1;->G:Lrz1;

    .line 11
    .line 12
    invoke-virtual {p0}, Lrz1;->a()J

    .line 13
    .line 14
    .line 15
    move-result-wide v0

    .line 16
    const-wide/16 v2, 0x0

    .line 17
    .line 18
    cmp-long p0, v0, v2

    .line 19
    .line 20
    if-lez p0, :cond_0

    .line 21
    .line 22
    const/4 p0, 0x1

    .line 23
    return p0

    .line 24
    :cond_0
    const/4 p0, 0x0

    .line 25
    return p0
.end method
