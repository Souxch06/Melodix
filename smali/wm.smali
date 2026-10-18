.class public final synthetic Lwm;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;ILjava/lang/Object;)V
    .locals 0

    .line 1
    iput p2, p0, Lwm;->a:I

    .line 2
    .line 3
    iput-object p1, p0, Lwm;->b:Ljava/lang/Object;

    .line 4
    .line 5
    iput-object p3, p0, Lwm;->c:Ljava/lang/Object;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 6

    .line 1
    iget v0, p0, Lwm;->a:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    packed-switch v0, :pswitch_data_0

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lwm;->b:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v0, Lv40;

    .line 10
    .line 11
    iget-object p0, p0, Lwm;->c:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast p0, Lc50;

    .line 14
    .line 15
    iget-object v0, v0, Lv40;->g:Lmn;

    .line 16
    .line 17
    iget-object v2, v0, Lmn;->b:Ljava/lang/Object;

    .line 18
    .line 19
    monitor-enter v2

    .line 20
    :try_start_0
    iget-object v0, v0, Lmn;->a:Landroid/content/SharedPreferences;

    .line 21
    .line 22
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const-string v3, "fetch_timeout_in_seconds"

    .line 27
    .line 28
    iget-wide v4, p0, Lc50;->a:J

    .line 29
    .line 30
    invoke-interface {v0, v3, v4, v5}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const-string v3, "minimum_fetch_interval_in_seconds"

    .line 35
    .line 36
    iget-wide v4, p0, Lc50;->b:J

    .line 37
    .line 38
    invoke-interface {v0, v3, v4, v5}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 43
    .line 44
    .line 45
    monitor-exit v2

    .line 46
    return-object v1

    .line 47
    :catchall_0
    move-exception p0

    .line 48
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 49
    throw p0

    .line 50
    :pswitch_0
    iget-object v0, p0, Lwm;->b:Ljava/lang/Object;

    .line 51
    .line 52
    check-cast v0, Lxm;

    .line 53
    .line 54
    iget-object p0, p0, Lwm;->c:Ljava/lang/Object;

    .line 55
    .line 56
    check-cast p0, Lzm;

    .line 57
    .line 58
    iget-object v0, v0, Lxm;->b:Lnn;

    .line 59
    .line 60
    monitor-enter v0

    .line 61
    :try_start_1
    iget-object v2, v0, Lnn;->a:Landroid/content/Context;

    .line 62
    .line 63
    iget-object v3, v0, Lnn;->b:Ljava/lang/String;

    .line 64
    .line 65
    const/4 v4, 0x0

    .line 66
    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->openFileOutput(Ljava/lang/String;I)Ljava/io/FileOutputStream;

    .line 67
    .line 68
    .line 69
    move-result-object v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 70
    :try_start_2
    iget-object p0, p0, Lzm;->a:Lorg/json/JSONObject;

    .line 71
    .line 72
    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    const-string v3, "UTF-8"

    .line 77
    .line 78
    invoke-virtual {p0, v3}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-virtual {v2, p0}, Ljava/io/FileOutputStream;->write([B)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 83
    .line 84
    .line 85
    :try_start_3
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 86
    .line 87
    .line 88
    monitor-exit v0

    .line 89
    return-object v1

    .line 90
    :catchall_1
    move-exception p0

    .line 91
    goto :goto_0

    .line 92
    :catchall_2
    move-exception p0

    .line 93
    :try_start_4
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V

    .line 94
    .line 95
    .line 96
    throw p0

    .line 97
    :goto_0
    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 98
    throw p0

    .line 99
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
