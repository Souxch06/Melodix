.class public final Lmt1;
.super Let;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public k:Ljava/lang/Boolean;

.field public l:Ljava/lang/String;

.field public m:Llt1;

.field public n:Ljava/lang/Boolean;


# virtual methods
.method public final A()Z
    .locals 1

    .line 1
    const-string v0, "google_analytics_automatic_screen_reporting_enabled"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lmt1;->y(Ljava/lang/String;)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0

    .line 18
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 19
    return p0
.end method

.method public final B(Ljava/lang/String;Z)Lq22;
    .locals 3

    .line 1
    invoke-static {p1}, Lbh;->e(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Let;->j:Ljava/lang/Object;

    .line 5
    .line 6
    check-cast v0, Ly02;

    .line 7
    .line 8
    invoke-virtual {p0}, Lmt1;->x()Landroid/os/Bundle;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    if-nez p0, :cond_0

    .line 13
    .line 14
    iget-object p0, v0, Ly02;->o:Lzy1;

    .line 15
    .line 16
    invoke-static {p0}, Ly02;->l(Lm22;)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lzy1;->o:Lso;

    .line 20
    .line 21
    const-string v1, "Failed to load metadata: Metadata bundle is null"

    .line 22
    .line 23
    invoke-virtual {p0, v1}, Lso;->b(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    const/4 p0, 0x0

    .line 27
    goto :goto_0

    .line 28
    :cond_0
    invoke-virtual {p0, p1}, Landroid/os/BaseBundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    :goto_0
    sget-object v1, Lq22;->k:Lq22;

    .line 33
    .line 34
    if-nez p0, :cond_1

    .line 35
    .line 36
    return-object v1

    .line 37
    :cond_1
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 38
    .line 39
    invoke-virtual {v2, p0}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    if-eqz v2, :cond_2

    .line 44
    .line 45
    sget-object p0, Lq22;->n:Lq22;

    .line 46
    .line 47
    return-object p0

    .line 48
    :cond_2
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 49
    .line 50
    invoke-virtual {v2, p0}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    if-eqz v2, :cond_3

    .line 55
    .line 56
    sget-object p0, Lq22;->m:Lq22;

    .line 57
    .line 58
    return-object p0

    .line 59
    :cond_3
    if-eqz p2, :cond_4

    .line 60
    .line 61
    const-string p2, "eu_consent_policy"

    .line 62
    .line 63
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result p0

    .line 67
    if-eqz p0, :cond_4

    .line 68
    .line 69
    sget-object p0, Lq22;->l:Lq22;

    .line 70
    .line 71
    return-object p0

    .line 72
    :cond_4
    iget-object p0, v0, Ly02;->o:Lzy1;

    .line 73
    .line 74
    invoke-static {p0}, Ly02;->l(Lm22;)V

    .line 75
    .line 76
    .line 77
    iget-object p0, p0, Lzy1;->r:Lso;

    .line 78
    .line 79
    const-string p2, "Invalid manifest metadata for"

    .line 80
    .line 81
    invoke-virtual {p0, p1, p2}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    return-object v1
.end method

.method public final m(Ljava/lang/String;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Let;->j:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ly02;

    .line 4
    .line 5
    iget-object v0, v0, Ly02;->r:Lcb2;

    .line 6
    .line 7
    invoke-static {v0}, Ly02;->j(Let;)V

    .line 8
    .line 9
    .line 10
    sget-object v0, Lxx1;->g1:Lwx1;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-virtual {v0, v1}, Lwx1;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {v0, p1}, Lcb2;->N(Ljava/lang/String;Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    sget-object v0, Lxx1;->h1:Lwx1;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Lwx1;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Ljava/lang/String;

    .line 32
    .line 33
    invoke-static {v0, p1}, Lcb2;->N(Ljava/lang/String;Ljava/lang/String;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-nez v0, :cond_1

    .line 38
    .line 39
    sget-object v0, Lxx1;->i1:Lwx1;

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Lwx1;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    check-cast v0, Ljava/lang/String;

    .line 46
    .line 47
    invoke-static {v0, p1}, Lcb2;->N(Ljava/lang/String;Ljava/lang/String;)Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_0

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_0
    iget-object p0, p0, Lmt1;->m:Llt1;

    .line 55
    .line 56
    const-string v0, "gaia_collection_enabled"

    .line 57
    .line 58
    invoke-interface {p0, p1, v0}, Llt1;->e(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    const-string p1, "1"

    .line 63
    .line 64
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    return p0

    .line 69
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 70
    return p0
.end method

.method public final n(Ljava/lang/String;)Z
    .locals 1

    .line 1
    const-string v0, "measurement.event_sampling_enabled"

    .line 2
    .line 3
    iget-object p0, p0, Lmt1;->m:Llt1;

    .line 4
    .line 5
    invoke-interface {p0, p1, v0}, Llt1;->e(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string p1, "1"

    .line 10
    .line 11
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public final o()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lmt1;->k:Ljava/lang/Boolean;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string v0, "app_measurement_lite"

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Lmt1;->y(Ljava/lang/String;)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Lmt1;->k:Ljava/lang/Boolean;

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 16
    .line 17
    iput-object v0, p0, Lmt1;->k:Ljava/lang/Boolean;

    .line 18
    .line 19
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_2

    .line 24
    .line 25
    iget-object p0, p0, Let;->j:Ljava/lang/Object;

    .line 26
    .line 27
    check-cast p0, Ly02;

    .line 28
    .line 29
    iget-boolean p0, p0, Ly02;->k:Z

    .line 30
    .line 31
    if-nez p0, :cond_1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    const/4 p0, 0x0

    .line 35
    return p0

    .line 36
    :cond_2
    :goto_0
    const/4 p0, 0x1

    .line 37
    return p0
.end method

.method public final p(Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    .line 1
    iget-object p0, p0, Let;->j:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Ly02;

    .line 4
    .line 5
    const-string v0, ""

    .line 6
    .line 7
    :try_start_0
    const-string v1, "android.os.SystemProperties"

    .line 8
    .line 9
    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const-string v2, "get"

    .line 14
    .line 15
    const-class v3, Ljava/lang/String;

    .line 16
    .line 17
    filled-new-array {v3, v3}, [Ljava/lang/Class;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    filled-new-array {p1, v0}, [Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    const/4 v2, 0x0

    .line 30
    invoke-virtual {v1, v2, p1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    check-cast p1, Ljava/lang/String;

    .line 35
    .line 36
    invoke-static {p1}, Lbh;->h(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    .line 37
    .line 38
    .line 39
    return-object p1

    .line 40
    :catch_0
    move-exception p1

    .line 41
    goto :goto_0

    .line 42
    :catch_1
    move-exception p1

    .line 43
    goto :goto_1

    .line 44
    :catch_2
    move-exception p1

    .line 45
    goto :goto_2

    .line 46
    :catch_3
    move-exception p1

    .line 47
    goto :goto_3

    .line 48
    :goto_0
    iget-object p0, p0, Ly02;->o:Lzy1;

    .line 49
    .line 50
    invoke-static {p0}, Ly02;->l(Lm22;)V

    .line 51
    .line 52
    .line 53
    iget-object p0, p0, Lzy1;->o:Lso;

    .line 54
    .line 55
    const-string v1, "SystemProperties.get() threw an exception"

    .line 56
    .line 57
    invoke-virtual {p0, p1, v1}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    goto :goto_4

    .line 61
    :goto_1
    iget-object p0, p0, Ly02;->o:Lzy1;

    .line 62
    .line 63
    invoke-static {p0}, Ly02;->l(Lm22;)V

    .line 64
    .line 65
    .line 66
    iget-object p0, p0, Lzy1;->o:Lso;

    .line 67
    .line 68
    const-string v1, "Could not access SystemProperties.get()"

    .line 69
    .line 70
    invoke-virtual {p0, p1, v1}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    goto :goto_4

    .line 74
    :goto_2
    iget-object p0, p0, Ly02;->o:Lzy1;

    .line 75
    .line 76
    invoke-static {p0}, Ly02;->l(Lm22;)V

    .line 77
    .line 78
    .line 79
    iget-object p0, p0, Lzy1;->o:Lso;

    .line 80
    .line 81
    const-string v1, "Could not find SystemProperties.get() method"

    .line 82
    .line 83
    invoke-virtual {p0, p1, v1}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    goto :goto_4

    .line 87
    :goto_3
    iget-object p0, p0, Ly02;->o:Lzy1;

    .line 88
    .line 89
    invoke-static {p0}, Ly02;->l(Lm22;)V

    .line 90
    .line 91
    .line 92
    iget-object p0, p0, Lzy1;->o:Lso;

    .line 93
    .line 94
    const-string v1, "Could not find SystemProperties class"

    .line 95
    .line 96
    invoke-virtual {p0, p1, v1}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    :goto_4
    return-object v0
.end method

.method public final q(Ljava/lang/String;Z)I
    .locals 1

    .line 1
    const/16 v0, 0x1f4

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    sget-object p2, Lxx1;->g0:Lwx1;

    .line 6
    .line 7
    invoke-virtual {p0, p1, p2}, Lmt1;->u(Ljava/lang/String;Lwx1;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-static {p0, v0}, Ljava/lang/Math;->min(II)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    const/16 p1, 0x64

    .line 16
    .line 17
    invoke-static {p0, p1}, Ljava/lang/Math;->max(II)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    :cond_0
    const/16 p0, 0x100

    .line 22
    .line 23
    invoke-static {v0, p0}, Ljava/lang/Math;->max(II)I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    return p0
.end method

.method public final r()V
    .locals 0

    .line 1
    iget-object p0, p0, Let;->j:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Ly02;

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final s(Ljava/lang/String;Lwx1;)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    invoke-virtual {p2, p0}, Lwx1;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/String;

    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_0
    iget-object p0, p0, Lmt1;->m:Llt1;

    .line 16
    .line 17
    iget-object v0, p2, Lwx1;->a:Ljava/lang/String;

    .line 18
    .line 19
    invoke-interface {p0, p1, v0}, Llt1;->e(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p2, p0}, Lwx1;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    check-cast p0, Ljava/lang/String;

    .line 28
    .line 29
    return-object p0
.end method

.method public final t(Ljava/lang/String;Lwx1;)J
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p2, v1}, Lwx1;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Long;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 15
    .line 16
    .line 17
    move-result-wide p0

    .line 18
    return-wide p0

    .line 19
    :cond_0
    iget-object p0, p0, Lmt1;->m:Llt1;

    .line 20
    .line 21
    iget-object v0, p2, Lwx1;->a:Ljava/lang/String;

    .line 22
    .line 23
    invoke-interface {p0, p1, v0}, Llt1;->e(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-eqz p1, :cond_1

    .line 32
    .line 33
    invoke-virtual {p2, v1}, Lwx1;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    check-cast p0, Ljava/lang/Long;

    .line 38
    .line 39
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 40
    .line 41
    .line 42
    move-result-wide p0

    .line 43
    return-wide p0

    .line 44
    :cond_1
    :try_start_0
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 45
    .line 46
    .line 47
    move-result-wide p0

    .line 48
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {p2, p0}, Lwx1;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    check-cast p0, Ljava/lang/Long;

    .line 57
    .line 58
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 59
    .line 60
    .line 61
    move-result-wide p0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 62
    return-wide p0

    .line 63
    :catch_0
    invoke-virtual {p2, v1}, Lwx1;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    check-cast p0, Ljava/lang/Long;

    .line 68
    .line 69
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 70
    .line 71
    .line 72
    move-result-wide p0

    .line 73
    return-wide p0
.end method

.method public final u(Ljava/lang/String;Lwx1;)I
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p2, v1}, Lwx1;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Integer;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0

    .line 19
    :cond_0
    iget-object p0, p0, Lmt1;->m:Llt1;

    .line 20
    .line 21
    iget-object v0, p2, Lwx1;->a:Ljava/lang/String;

    .line 22
    .line 23
    invoke-interface {p0, p1, v0}, Llt1;->e(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-eqz p1, :cond_1

    .line 32
    .line 33
    invoke-virtual {p2, v1}, Lwx1;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    check-cast p0, Ljava/lang/Integer;

    .line 38
    .line 39
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    return p0

    .line 44
    :cond_1
    :try_start_0
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {p2, p0}, Lwx1;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    check-cast p0, Ljava/lang/Integer;

    .line 57
    .line 58
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 59
    .line 60
    .line 61
    move-result p0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 62
    return p0

    .line 63
    :catch_0
    invoke-virtual {p2, v1}, Lwx1;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    check-cast p0, Ljava/lang/Integer;

    .line 68
    .line 69
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 70
    .line 71
    .line 72
    move-result p0

    .line 73
    return p0
.end method

.method public final v(Ljava/lang/String;Lwx1;)D
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p2, v1}, Lwx1;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Double;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    .line 15
    .line 16
    .line 17
    move-result-wide p0

    .line 18
    return-wide p0

    .line 19
    :cond_0
    iget-object p0, p0, Lmt1;->m:Llt1;

    .line 20
    .line 21
    iget-object v0, p2, Lwx1;->a:Ljava/lang/String;

    .line 22
    .line 23
    invoke-interface {p0, p1, v0}, Llt1;->e(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-eqz p1, :cond_1

    .line 32
    .line 33
    invoke-virtual {p2, v1}, Lwx1;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    check-cast p0, Ljava/lang/Double;

    .line 38
    .line 39
    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    .line 40
    .line 41
    .line 42
    move-result-wide p0

    .line 43
    return-wide p0

    .line 44
    :cond_1
    :try_start_0
    invoke-static {p0}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    .line 45
    .line 46
    .line 47
    move-result-wide p0

    .line 48
    invoke-static {p0, p1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {p2, p0}, Lwx1;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    check-cast p0, Ljava/lang/Double;

    .line 57
    .line 58
    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    .line 59
    .line 60
    .line 61
    move-result-wide p0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 62
    return-wide p0

    .line 63
    :catch_0
    invoke-virtual {p2, v1}, Lwx1;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    check-cast p0, Ljava/lang/Double;

    .line 68
    .line 69
    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    .line 70
    .line 71
    .line 72
    move-result-wide p0

    .line 73
    return-wide p0
.end method

.method public final w(Ljava/lang/String;Lwx1;)Z
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p2, v1}, Lwx1;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0

    .line 19
    :cond_0
    iget-object p0, p0, Lmt1;->m:Llt1;

    .line 20
    .line 21
    iget-object v0, p2, Lwx1;->a:Ljava/lang/String;

    .line 22
    .line 23
    invoke-interface {p0, p1, v0}, Llt1;->e(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-eqz p1, :cond_1

    .line 32
    .line 33
    invoke-virtual {p2, v1}, Lwx1;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    check-cast p0, Ljava/lang/Boolean;

    .line 38
    .line 39
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    return p0

    .line 44
    :cond_1
    const-string p1, "1"

    .line 45
    .line 46
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {p2, p0}, Lwx1;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    check-cast p0, Ljava/lang/Boolean;

    .line 59
    .line 60
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    return p0
.end method

.method public final x()Landroid/os/Bundle;
    .locals 5

    .line 1
    iget-object p0, p0, Let;->j:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Ly02;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    :try_start_0
    iget-object v1, p0, Ly02;->j:Landroid/content/Context;

    .line 7
    .line 8
    iget-object v2, p0, Ly02;->o:Lzy1;

    .line 9
    .line 10
    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 11
    .line 12
    .line 13
    move-result-object v3

    .line 14
    if-nez v3, :cond_0

    .line 15
    .line 16
    invoke-static {v2}, Ly02;->l(Lm22;)V

    .line 17
    .line 18
    .line 19
    iget-object v1, v2, Lzy1;->o:Lso;

    .line 20
    .line 21
    const-string v2, "Failed to load metadata: PackageManager is null"

    .line 22
    .line 23
    invoke-virtual {v1, v2}, Lso;->b(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    return-object v0

    .line 27
    :catch_0
    move-exception v1

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    invoke-static {v1}, Lal1;->a(Landroid/content/Context;)Lb00;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    iget-object v3, v3, Lb00;->a:Landroid/content/Context;

    .line 38
    .line 39
    invoke-virtual {v3}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    const/16 v4, 0x80

    .line 44
    .line 45
    invoke-virtual {v3, v1, v4}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    if-nez v1, :cond_1

    .line 50
    .line 51
    invoke-static {v2}, Ly02;->l(Lm22;)V

    .line 52
    .line 53
    .line 54
    iget-object v1, v2, Lzy1;->o:Lso;

    .line 55
    .line 56
    const-string v2, "Failed to load metadata: ApplicationInfo is null"

    .line 57
    .line 58
    invoke-virtual {v1, v2}, Lso;->b(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    return-object v0

    .line 62
    :cond_1
    iget-object p0, v1, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 63
    .line 64
    return-object p0

    .line 65
    :goto_0
    iget-object p0, p0, Ly02;->o:Lzy1;

    .line 66
    .line 67
    invoke-static {p0}, Ly02;->l(Lm22;)V

    .line 68
    .line 69
    .line 70
    iget-object p0, p0, Lzy1;->o:Lso;

    .line 71
    .line 72
    const-string v2, "Failed to load metadata: Package name not found"

    .line 73
    .line 74
    invoke-virtual {p0, v1, v2}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    return-object v0
.end method

.method public final y(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    invoke-static {p1}, Lbh;->e(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lmt1;->x()Landroid/os/Bundle;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const/4 v1, 0x0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Let;->j:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast p0, Ly02;

    .line 14
    .line 15
    iget-object p0, p0, Ly02;->o:Lzy1;

    .line 16
    .line 17
    invoke-static {p0}, Ly02;->l(Lm22;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lzy1;->o:Lso;

    .line 21
    .line 22
    const-string p1, "Failed to load metadata: Metadata bundle is null"

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Lso;->b(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-object v1

    .line 28
    :cond_0
    invoke-virtual {v0, p1}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    if-nez p0, :cond_1

    .line 33
    .line 34
    return-object v1

    .line 35
    :cond_1
    invoke-virtual {v0, p1}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0
.end method

.method public final z()Z
    .locals 1

    .line 1
    iget-object v0, p0, Let;->j:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ly02;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    const-string v0, "firebase_analytics_collection_deactivated"

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Lmt1;->y(Ljava/lang/String;)Ljava/lang/Boolean;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-eqz p0, :cond_0

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
