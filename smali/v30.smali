.class public final Lv30;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final a:Lsr;


# direct methods
.method public constructor <init>(Lsr;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lv30;->a:Lsr;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 4

    .line 1
    iget-object p0, p0, Lv30;->a:Lsr;

    .line 2
    .line 3
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 4
    .line 5
    iget-object p0, p0, Lsr;->b:Lqt;

    .line 6
    .line 7
    monitor-enter p0

    .line 8
    :try_start_0
    iput-object v0, p0, Lqt;->g:Ljava/lang/Object;

    .line 9
    .line 10
    iget-object v0, p0, Lqt;->b:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast v0, Landroid/content/SharedPreferences;

    .line 13
    .line 14
    const-string v1, "firebase_crashlytics_collection_enabled"

    .line 15
    .line 16
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const/4 v2, 0x0

    .line 21
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 22
    .line 23
    .line 24
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lqt;->d:Ljava/lang/Object;

    .line 28
    .line 29
    monitor-enter v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 30
    :try_start_1
    invoke-virtual {p0}, Lqt;->l()Z

    .line 31
    .line 32
    .line 33
    move-result v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 34
    iget-boolean v3, p0, Lqt;->a:Z

    .line 35
    .line 36
    if-eqz v1, :cond_0

    .line 37
    .line 38
    if-nez v3, :cond_1

    .line 39
    .line 40
    :try_start_2
    iget-object v1, p0, Lqt;->e:Ljava/lang/Object;

    .line 41
    .line 42
    check-cast v1, Llb1;

    .line 43
    .line 44
    const/4 v2, 0x0

    .line 45
    invoke-virtual {v1, v2}, Llb1;->b(Ljava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    const/4 v1, 0x1

    .line 49
    iput-boolean v1, p0, Lqt;->a:Z

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :catchall_0
    move-exception v1

    .line 53
    goto :goto_1

    .line 54
    :cond_0
    if-eqz v3, :cond_1

    .line 55
    .line 56
    new-instance v1, Llb1;

    .line 57
    .line 58
    invoke-direct {v1}, Llb1;-><init>()V

    .line 59
    .line 60
    .line 61
    iput-object v1, p0, Lqt;->e:Ljava/lang/Object;

    .line 62
    .line 63
    iput-boolean v2, p0, Lqt;->a:Z

    .line 64
    .line 65
    :cond_1
    :goto_0
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 66
    monitor-exit p0

    .line 67
    return-void

    .line 68
    :goto_1
    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 69
    :try_start_4
    throw v1

    .line 70
    :catchall_1
    move-exception v0

    .line 71
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 72
    throw v0
.end method
