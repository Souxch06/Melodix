.class public final synthetic Lu40;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lpa1;
.implements Ljq;


# instance fields
.field public final synthetic j:Lv40;


# direct methods
.method public synthetic constructor <init>(Lv40;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lu40;->j:Lv40;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public d(Ljd2;)Ljava/lang/Object;
    .locals 5

    .line 1
    iget-object p0, p0, Lu40;->j:Lv40;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljd2;->j()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_2

    .line 9
    .line 10
    iget-object v0, p0, Lv40;->c:Lxm;

    .line 11
    .line 12
    monitor-enter v0

    .line 13
    const/4 v2, 0x0

    .line 14
    :try_start_0
    invoke-static {v2}, Lbe2;->l(Ljava/lang/Object;)Ljd2;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    iput-object v2, v0, Lxm;->c:Ljd2;

    .line 19
    .line 20
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 21
    iget-object v2, v0, Lxm;->b:Lnn;

    .line 22
    .line 23
    monitor-enter v2

    .line 24
    :try_start_1
    iget-object v0, v2, Lnn;->a:Landroid/content/Context;

    .line 25
    .line 26
    iget-object v3, v2, Lnn;->b:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {v0, v3}, Landroid/content/Context;->deleteFile(Ljava/lang/String;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 29
    .line 30
    .line 31
    monitor-exit v2

    .line 32
    invoke-virtual {p1}, Ljd2;->h()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    check-cast p1, Lzm;

    .line 37
    .line 38
    if-eqz p1, :cond_1

    .line 39
    .line 40
    iget-object v0, p1, Lzm;->d:Lorg/json/JSONArray;

    .line 41
    .line 42
    iget-object v2, p0, Lv40;->a:Lq30;

    .line 43
    .line 44
    if-nez v2, :cond_0

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    :try_start_2
    invoke-static {v0}, Lv40;->e(Lorg/json/JSONArray;)Ljava/util/ArrayList;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {v2, v0}, Lq30;->c(Ljava/util/ArrayList;)V
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Lx0; {:try_start_2 .. :try_end_2} :catch_0

    .line 52
    .line 53
    .line 54
    :catch_0
    :goto_0
    iget-object p0, p0, Lv40;->i:Ler0;

    .line 55
    .line 56
    :try_start_3
    iget-object v0, p0, Ler0;->l:Ljava/lang/Object;

    .line 57
    .line 58
    check-cast v0, Lxn0;

    .line 59
    .line 60
    invoke-virtual {v0, p1}, Lxn0;->l(Lzm;)Lgf;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    iget-object v0, p0, Ler0;->n:Ljava/lang/Object;

    .line 65
    .line 66
    check-cast v0, Ljava/util/Set;

    .line 67
    .line 68
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 73
    .line 74
    .line 75
    move-result v2

    .line 76
    if-eqz v2, :cond_1

    .line 77
    .line 78
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    check-cast v2, Lur;

    .line 83
    .line 84
    iget-object v3, p0, Ler0;->m:Ljava/lang/Object;

    .line 85
    .line 86
    check-cast v3, Ljava/util/concurrent/Executor;

    .line 87
    .line 88
    new-instance v4, Ls11;

    .line 89
    .line 90
    invoke-direct {v4, v2, p1, v1}, Ls11;-><init>(Lur;Lgf;I)V

    .line 91
    .line 92
    .line 93
    invoke-interface {v3, v4}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_3
    .catch Lx40; {:try_start_3 .. :try_end_3} :catch_1

    .line 94
    .line 95
    .line 96
    goto :goto_1

    .line 97
    :catch_1
    :cond_1
    const/4 v1, 0x1

    .line 98
    goto :goto_2

    .line 99
    :catchall_0
    move-exception p0

    .line 100
    :try_start_4
    monitor-exit v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 101
    throw p0

    .line 102
    :catchall_1
    move-exception p0

    .line 103
    :try_start_5
    monitor-exit v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 104
    throw p0

    .line 105
    :cond_2
    :goto_2
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    return-object p0
.end method

.method public o(Ljava/lang/Object;)Ljd2;
    .locals 5

    .line 1
    check-cast p1, Ljava/lang/Void;

    .line 2
    .line 3
    iget-object p0, p0, Lu40;->j:Lv40;

    .line 4
    .line 5
    iget-object p1, p0, Lv40;->c:Lxm;

    .line 6
    .line 7
    invoke-virtual {p1}, Lxm;->b()Ljd2;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iget-object v0, p0, Lv40;->d:Lxm;

    .line 12
    .line 13
    invoke-virtual {v0}, Lxm;->b()Ljd2;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    filled-new-array {p1, v0}, [Ljd2;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-static {v1}, Lbe2;->y([Ljd2;)Ljd2;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    iget-object v2, p0, Lv40;->b:Ljava/util/concurrent/Executor;

    .line 26
    .line 27
    new-instance v3, Lgn;

    .line 28
    .line 29
    const/4 v4, 0x3

    .line 30
    invoke-direct {v3, p0, p1, v0, v4}, Lgn;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v1, v2, v3}, Ljd2;->f(Ljava/util/concurrent/Executor;Ljq;)Ljd2;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0
.end method
