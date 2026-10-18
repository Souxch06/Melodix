.class public final Lv40;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final a:Lq30;

.field public final b:Ljava/util/concurrent/Executor;

.field public final c:Lxm;

.field public final d:Lxm;

.field public final e:Ldn;

.field public final f:Lfn;

.field public final g:Lmn;

.field public final h:Ls7;

.field public final i:Ler0;


# direct methods
.method public constructor <init>(Lq30;Ljava/util/concurrent/Executor;Lxm;Lxm;Lxm;Ldn;Lfn;Lmn;Ls7;Ler0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lv40;->a:Lq30;

    .line 5
    .line 6
    iput-object p2, p0, Lv40;->b:Ljava/util/concurrent/Executor;

    .line 7
    .line 8
    iput-object p3, p0, Lv40;->c:Lxm;

    .line 9
    .line 10
    iput-object p4, p0, Lv40;->d:Lxm;

    .line 11
    .line 12
    iput-object p6, p0, Lv40;->e:Ldn;

    .line 13
    .line 14
    iput-object p7, p0, Lv40;->f:Lfn;

    .line 15
    .line 16
    iput-object p8, p0, Lv40;->g:Lmn;

    .line 17
    .line 18
    iput-object p9, p0, Lv40;->h:Ls7;

    .line 19
    .line 20
    iput-object p10, p0, Lv40;->i:Ler0;

    .line 21
    .line 22
    return-void
.end method

.method public static e(Lorg/json/JSONArray;)Ljava/util/ArrayList;
    .locals 7

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    :goto_0
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    if-ge v1, v2, :cond_1

    .line 12
    .line 13
    new-instance v2, Ljava/util/HashMap;

    .line 14
    .line 15
    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    invoke-virtual {v3}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    .line 23
    .line 24
    .line 25
    move-result-object v4

    .line 26
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 27
    .line 28
    .line 29
    move-result v5

    .line 30
    if-eqz v5, :cond_0

    .line 31
    .line 32
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v5

    .line 36
    check-cast v5, Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v6

    .line 42
    invoke-virtual {v2, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    goto :goto_1

    .line 46
    :cond_0
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    add-int/lit8 v1, v1, 0x1

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_1
    return-object v0
.end method


# virtual methods
.method public final a()Ljd2;
    .locals 7

    .line 1
    iget-object v0, p0, Lv40;->e:Ldn;

    .line 2
    .line 3
    iget-object v1, v0, Ldn;->g:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v1, Lmn;

    .line 6
    .line 7
    iget-object v1, v1, Lmn;->a:Landroid/content/SharedPreferences;

    .line 8
    .line 9
    const-string v2, "minimum_fetch_interval_in_seconds"

    .line 10
    .line 11
    const-wide/32 v3, 0xa8c0

    .line 12
    .line 13
    .line 14
    invoke-interface {v1, v2, v3, v4}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    .line 15
    .line 16
    .line 17
    move-result-wide v1

    .line 18
    new-instance v3, Ljava/util/HashMap;

    .line 19
    .line 20
    iget-object v4, v0, Ldn;->h:Ljava/lang/Object;

    .line 21
    .line 22
    check-cast v4, Ljava/util/Map;

    .line 23
    .line 24
    invoke-direct {v3, v4}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 25
    .line 26
    .line 27
    const-string v4, "X-Firebase-RC-Fetch-Type"

    .line 28
    .line 29
    const-string v5, "BASE/1"

    .line 30
    .line 31
    invoke-virtual {v3, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    iget-object v4, v0, Ldn;->e:Ljava/lang/Object;

    .line 35
    .line 36
    check-cast v4, Lxm;

    .line 37
    .line 38
    invoke-virtual {v4}, Lxm;->b()Ljd2;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    iget-object v5, v0, Ldn;->c:Ljava/lang/Object;

    .line 43
    .line 44
    check-cast v5, Ljava/util/concurrent/Executor;

    .line 45
    .line 46
    new-instance v6, Lan;

    .line 47
    .line 48
    invoke-direct {v6, v0, v1, v2, v3}, Lan;-><init>(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v4, v5, v6}, Ljd2;->f(Ljava/util/concurrent/Executor;Ljq;)Ljd2;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    new-instance v1, Lo40;

    .line 56
    .line 57
    const/4 v2, 0x1

    .line 58
    invoke-direct {v1, v2}, Lo40;-><init>(I)V

    .line 59
    .line 60
    .line 61
    sget-object v2, Ly30;->j:Ly30;

    .line 62
    .line 63
    invoke-virtual {v0, v2, v1}, Ljd2;->k(Ljava/util/concurrent/Executor;Lpa1;)Ljd2;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    new-instance v1, Lu40;

    .line 68
    .line 69
    invoke-direct {v1, p0}, Lu40;-><init>(Lv40;)V

    .line 70
    .line 71
    .line 72
    iget-object p0, p0, Lv40;->b:Ljava/util/concurrent/Executor;

    .line 73
    .line 74
    invoke-virtual {v0, p0, v1}, Ljd2;->k(Ljava/util/concurrent/Executor;Lpa1;)Ljd2;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    return-object p0
.end method

.method public final b()Ljava/util/HashMap;
    .locals 8

    .line 1
    new-instance v0, Ljava/util/HashSet;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lv40;->f:Lfn;

    .line 7
    .line 8
    iget-object v1, p0, Lfn;->c:Lxm;

    .line 9
    .line 10
    invoke-static {v1}, Lfn;->b(Lxm;)Ljava/util/HashSet;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-interface {v0, v2}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 15
    .line 16
    .line 17
    iget-object v2, p0, Lfn;->d:Lxm;

    .line 18
    .line 19
    invoke-static {v2}, Lfn;->b(Lxm;)Ljava/util/HashSet;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    invoke-interface {v0, v3}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 24
    .line 25
    .line 26
    new-instance v3, Ljava/util/HashMap;

    .line 27
    .line 28
    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 36
    .line 37
    .line 38
    move-result v4

    .line 39
    if-eqz v4, :cond_2

    .line 40
    .line 41
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v4

    .line 45
    check-cast v4, Ljava/lang/String;

    .line 46
    .line 47
    invoke-static {v1, v4}, Lfn;->c(Lxm;Ljava/lang/String;)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v5

    .line 51
    if-eqz v5, :cond_0

    .line 52
    .line 53
    invoke-virtual {v1}, Lxm;->c()Lzm;

    .line 54
    .line 55
    .line 56
    move-result-object v6

    .line 57
    invoke-virtual {p0, v4, v6}, Lfn;->a(Ljava/lang/String;Lzm;)V

    .line 58
    .line 59
    .line 60
    new-instance v6, Le50;

    .line 61
    .line 62
    const/4 v7, 0x2

    .line 63
    invoke-direct {v6, v5, v7}, Le50;-><init>(Ljava/lang/String;I)V

    .line 64
    .line 65
    .line 66
    goto :goto_1

    .line 67
    :cond_0
    invoke-static {v2, v4}, Lfn;->c(Lxm;Ljava/lang/String;)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v5

    .line 71
    if-eqz v5, :cond_1

    .line 72
    .line 73
    new-instance v6, Le50;

    .line 74
    .line 75
    const/4 v7, 0x1

    .line 76
    invoke-direct {v6, v5, v7}, Le50;-><init>(Ljava/lang/String;I)V

    .line 77
    .line 78
    .line 79
    goto :goto_1

    .line 80
    :cond_1
    new-instance v6, Le50;

    .line 81
    .line 82
    const-string v5, ""

    .line 83
    .line 84
    const/4 v7, 0x0

    .line 85
    invoke-direct {v6, v5, v7}, Le50;-><init>(Ljava/lang/String;I)V

    .line 86
    .line 87
    .line 88
    :goto_1
    invoke-virtual {v3, v4, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_2
    return-object v3
.end method

.method public final c()Lz40;
    .locals 8

    .line 1
    iget-object p0, p0, Lv40;->g:Lmn;

    .line 2
    .line 3
    iget-object v0, p0, Lmn;->b:Ljava/lang/Object;

    .line 4
    .line 5
    monitor-enter v0

    .line 6
    :try_start_0
    iget-object v1, p0, Lmn;->a:Landroid/content/SharedPreferences;

    .line 7
    .line 8
    const-string v2, "last_fetch_time_in_millis"

    .line 9
    .line 10
    const-wide/16 v3, -0x1

    .line 11
    .line 12
    invoke-interface {v1, v2, v3, v4}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    .line 13
    .line 14
    .line 15
    iget-object v1, p0, Lmn;->a:Landroid/content/SharedPreferences;

    .line 16
    .line 17
    const-string v2, "last_fetch_status"

    .line 18
    .line 19
    const/4 v3, 0x0

    .line 20
    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    iget-object v2, p0, Lmn;->a:Landroid/content/SharedPreferences;

    .line 25
    .line 26
    const-string v3, "fetch_timeout_in_seconds"

    .line 27
    .line 28
    const-wide/16 v4, 0x3c

    .line 29
    .line 30
    invoke-interface {v2, v3, v4, v5}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    .line 31
    .line 32
    .line 33
    move-result-wide v2

    .line 34
    const-wide/16 v4, 0x0

    .line 35
    .line 36
    cmp-long v6, v2, v4

    .line 37
    .line 38
    if-ltz v6, :cond_1

    .line 39
    .line 40
    iget-object p0, p0, Lmn;->a:Landroid/content/SharedPreferences;

    .line 41
    .line 42
    const-string v2, "minimum_fetch_interval_in_seconds"

    .line 43
    .line 44
    const-wide/32 v6, 0xa8c0

    .line 45
    .line 46
    .line 47
    invoke-interface {p0, v2, v6, v7}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    .line 48
    .line 49
    .line 50
    move-result-wide v2

    .line 51
    cmp-long p0, v2, v4

    .line 52
    .line 53
    if-ltz p0, :cond_0

    .line 54
    .line 55
    new-instance p0, Lz40;

    .line 56
    .line 57
    invoke-direct {p0, v1}, Lz40;-><init>(I)V

    .line 58
    .line 59
    .line 60
    monitor-exit v0

    .line 61
    return-object p0

    .line 62
    :catchall_0
    move-exception p0

    .line 63
    goto :goto_0

    .line 64
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 65
    .line 66
    new-instance v1, Ljava/lang/StringBuilder;

    .line 67
    .line 68
    const-string v4, "Minimum interval between fetches has to be a non-negative number. "

    .line 69
    .line 70
    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    const-string v2, " is an invalid argument"

    .line 77
    .line 78
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    invoke-direct {p0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    throw p0

    .line 89
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 90
    .line 91
    const-string v1, "Fetch connection timeout has to be a non-negative number. %d is an invalid argument"

    .line 92
    .line 93
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 94
    .line 95
    .line 96
    move-result-object v2

    .line 97
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    move-result-object v2

    .line 101
    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    invoke-direct {p0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    throw p0

    .line 109
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 110
    throw p0
.end method

.method public final d(Z)V
    .locals 4

    .line 1
    iget-object p0, p0, Lv40;->h:Ls7;

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    iget-object v0, p0, Ls7;->l:Ljava/lang/Object;

    .line 5
    .line 6
    check-cast v0, Ljn;

    .line 7
    .line 8
    iget-object v1, v0, Ljn;->p:Ljava/lang/Object;

    .line 9
    .line 10
    monitor-enter v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 11
    :try_start_1
    iput-boolean p1, v0, Ljn;->e:Z

    .line 12
    .line 13
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 14
    .line 15
    const/16 v3, 0x1a

    .line 16
    .line 17
    if-lt v2, v3, :cond_0

    .line 18
    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    iget-object v0, v0, Ljn;->f:Ljava/net/HttpURLConnection;

    .line 22
    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :catchall_0
    move-exception p1

    .line 30
    goto :goto_2

    .line 31
    :cond_0
    :goto_0
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 32
    if-nez p1, :cond_1

    .line 33
    .line 34
    :try_start_2
    invoke-virtual {p0}, Ls7;->e()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 35
    .line 36
    .line 37
    goto :goto_1

    .line 38
    :catchall_1
    move-exception p1

    .line 39
    goto :goto_3

    .line 40
    :cond_1
    :goto_1
    monitor-exit p0

    .line 41
    return-void

    .line 42
    :goto_2
    :try_start_3
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 43
    :try_start_4
    throw p1

    .line 44
    :goto_3
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 45
    throw p1
.end method
