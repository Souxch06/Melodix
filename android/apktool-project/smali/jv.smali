.class public final synthetic Ljv;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Lkv;


# direct methods
.method public synthetic constructor <init>(Lkv;I)V
    .locals 0

    .line 1
    iput p2, p0, Ljv;->a:I

    .line 2
    .line 3
    iput-object p1, p0, Ljv;->b:Lkv;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private final a()Ljava/lang/Object;
    .locals 7

    .line 1
    iget-object p0, p0, Ljv;->b:Lkv;

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    iget-object v0, p0, Lkv;->a:Llh0;

    .line 5
    .line 6
    invoke-virtual {v0}, Llh0;->get()Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lyb0;

    .line 11
    .line 12
    invoke-virtual {v0}, Lyb0;->a()Ljava/util/ArrayList;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    monitor-enter v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    :try_start_1
    iget-object v2, v0, Lyb0;->a:Lag0;

    .line 18
    .line 19
    new-instance v3, Lm;

    .line 20
    .line 21
    const/4 v4, 0x2

    .line 22
    invoke-direct {v3, v4, v0}, Lm;-><init>(ILjava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    new-instance v4, Loj;

    .line 26
    .line 27
    const/4 v5, 0x7

    .line 28
    const/4 v6, 0x0

    .line 29
    invoke-direct {v4, v2, v3, v6, v5}, Loj;-><init>(Ljava/lang/Object;Ljava/lang/Object;Liq;I)V

    .line 30
    .line 31
    .line 32
    invoke-static {v4}, Lkp1;->f(Lf90;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    check-cast v2, Lxo0;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_5

    .line 37
    .line 38
    :try_start_2
    monitor-exit v0

    .line 39
    new-instance v0, Lorg/json/JSONArray;

    .line 40
    .line 41
    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 42
    .line 43
    .line 44
    const/4 v2, 0x0

    .line 45
    :goto_0
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 46
    .line 47
    .line 48
    move-result v3

    .line 49
    if-ge v2, v3, :cond_0

    .line 50
    .line 51
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    check-cast v3, Lqe;

    .line 56
    .line 57
    new-instance v4, Lorg/json/JSONObject;

    .line 58
    .line 59
    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .line 60
    .line 61
    .line 62
    const-string v5, "agent"

    .line 63
    .line 64
    iget-object v6, v3, Lqe;->a:Ljava/lang/String;

    .line 65
    .line 66
    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 67
    .line 68
    .line 69
    const-string v5, "dates"

    .line 70
    .line 71
    new-instance v6, Lorg/json/JSONArray;

    .line 72
    .line 73
    iget-object v3, v3, Lqe;->b:Ljava/util/ArrayList;

    .line 74
    .line 75
    invoke-direct {v6, v3}, Lorg/json/JSONArray;-><init>(Ljava/util/Collection;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 79
    .line 80
    .line 81
    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 82
    .line 83
    .line 84
    add-int/lit8 v2, v2, 0x1

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :catchall_0
    move-exception v0

    .line 88
    goto :goto_4

    .line 89
    :cond_0
    new-instance v1, Lorg/json/JSONObject;

    .line 90
    .line 91
    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 92
    .line 93
    .line 94
    const-string v2, "heartbeats"

    .line 95
    .line 96
    invoke-virtual {v1, v2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 97
    .line 98
    .line 99
    const-string v0, "version"

    .line 100
    .line 101
    const-string v2, "2"

    .line 102
    .line 103
    invoke-virtual {v1, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 104
    .line 105
    .line 106
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    .line 107
    .line 108
    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 109
    .line 110
    .line 111
    new-instance v2, Landroid/util/Base64OutputStream;

    .line 112
    .line 113
    const/16 v3, 0xb

    .line 114
    .line 115
    invoke-direct {v2, v0, v3}, Landroid/util/Base64OutputStream;-><init>(Ljava/io/OutputStream;I)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 116
    .line 117
    .line 118
    :try_start_3
    new-instance v3, Ljava/util/zip/GZIPOutputStream;

    .line 119
    .line 120
    invoke-direct {v3, v2}, Ljava/util/zip/GZIPOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 121
    .line 122
    .line 123
    :try_start_4
    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v1

    .line 127
    const-string v4, "UTF-8"

    .line 128
    .line 129
    invoke-virtual {v1, v4}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    invoke-virtual {v3, v1}, Ljava/io/OutputStream;->write([B)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 134
    .line 135
    .line 136
    :try_start_5
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 137
    .line 138
    .line 139
    :try_start_6
    invoke-virtual {v2}, Landroid/util/Base64OutputStream;->close()V

    .line 140
    .line 141
    .line 142
    const-string v1, "UTF-8"

    .line 143
    .line 144
    invoke-virtual {v0, v1}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    monitor-exit p0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 149
    return-object v0

    .line 150
    :catchall_1
    move-exception v0

    .line 151
    goto :goto_2

    .line 152
    :catchall_2
    move-exception v0

    .line 153
    :try_start_7
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    .line 154
    .line 155
    .line 156
    goto :goto_1

    .line 157
    :catchall_3
    move-exception v1

    .line 158
    :try_start_8
    invoke-virtual {v0, v1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 159
    .line 160
    .line 161
    :goto_1
    throw v0
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    .line 162
    :goto_2
    :try_start_9
    invoke-virtual {v2}, Landroid/util/Base64OutputStream;->close()V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_4

    .line 163
    .line 164
    .line 165
    goto :goto_3

    .line 166
    :catchall_4
    move-exception v1

    .line 167
    :try_start_a
    invoke-virtual {v0, v1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 168
    .line 169
    .line 170
    :goto_3
    throw v0
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    .line 171
    :catchall_5
    move-exception v1

    .line 172
    :try_start_b
    monitor-exit v0
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_5

    .line 173
    :try_start_c
    throw v1

    .line 174
    :goto_4
    monitor-exit p0
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    .line 175
    throw v0
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 8

    .line 1
    iget v0, p0, Ljv;->a:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ljv;->b:Lkv;

    .line 7
    .line 8
    monitor-enter v1

    .line 9
    :try_start_0
    iget-object p0, v1, Lkv;->a:Llh0;

    .line 10
    .line 11
    invoke-virtual {p0}, Llh0;->get()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    move-object v3, p0

    .line 16
    check-cast v3, Lyb0;

    .line 17
    .line 18
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 19
    .line 20
    .line 21
    move-result-wide v4

    .line 22
    iget-object p0, v1, Lkv;->c:Llw0;

    .line 23
    .line 24
    invoke-interface {p0}, Llw0;->get()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    check-cast p0, Lkw;

    .line 29
    .line 30
    iget-object v0, p0, Lkw;->b:Lpa0;

    .line 31
    .line 32
    iget-object v2, v0, Lpa0;->k:Ljava/lang/Object;

    .line 33
    .line 34
    check-cast v2, Ljava/util/HashSet;

    .line 35
    .line 36
    monitor-enter v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 37
    :try_start_1
    iget-object v6, v0, Lpa0;->k:Ljava/lang/Object;

    .line 38
    .line 39
    check-cast v6, Ljava/util/HashSet;

    .line 40
    .line 41
    invoke-static {v6}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    .line 42
    .line 43
    .line 44
    move-result-object v6

    .line 45
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_3

    .line 46
    :try_start_2
    invoke-interface {v6}, Ljava/util/Set;->isEmpty()Z

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    iget-object p0, p0, Lkw;->a:Ljava/lang/String;

    .line 51
    .line 52
    if-eqz v2, :cond_0

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    .line 56
    .line 57
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const/16 p0, 0x20

    .line 64
    .line 65
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    iget-object p0, v0, Lpa0;->k:Ljava/lang/Object;

    .line 69
    .line 70
    check-cast p0, Ljava/util/HashSet;

    .line 71
    .line 72
    monitor-enter p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 73
    :try_start_3
    iget-object v0, v0, Lpa0;->k:Ljava/lang/Object;

    .line 74
    .line 75
    check-cast v0, Ljava/util/HashSet;

    .line 76
    .line 77
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 82
    :try_start_4
    invoke-static {v0}, Lkw;->a(Ljava/util/Set;)Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    :goto_0
    monitor-enter v3
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 94
    :try_start_5
    invoke-virtual {v3, v4, v5}, Lyb0;->b(J)Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v4

    .line 98
    new-instance v6, Lnu0;

    .line 99
    .line 100
    invoke-direct {v6, p0}, Lnu0;-><init>(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    iget-object v0, v3, Lyb0;->a:Lag0;

    .line 104
    .line 105
    new-instance v2, Lwb0;

    .line 106
    .line 107
    const/4 v7, 0x0

    .line 108
    move-object v5, p0

    .line 109
    invoke-direct/range {v2 .. v7}, Lwb0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    .line 110
    .line 111
    .line 112
    new-instance p0, Loj;

    .line 113
    .line 114
    const/4 v4, 0x7

    .line 115
    const/4 v5, 0x0

    .line 116
    invoke-direct {p0, v0, v2, v5, v4}, Loj;-><init>(Ljava/lang/Object;Ljava/lang/Object;Liq;I)V

    .line 117
    .line 118
    .line 119
    invoke-static {p0}, Lkp1;->f(Lf90;)Ljava/lang/Object;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    check-cast p0, Lxo0;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 124
    .line 125
    :try_start_6
    monitor-exit v3

    .line 126
    monitor-exit v1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 127
    return-object v5

    .line 128
    :catchall_0
    move-exception v0

    .line 129
    move-object p0, v0

    .line 130
    goto :goto_1

    .line 131
    :catchall_1
    move-exception v0

    .line 132
    move-object p0, v0

    .line 133
    :try_start_7
    monitor-exit v3
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 134
    :try_start_8
    throw p0
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 135
    :catchall_2
    move-exception v0

    .line 136
    :try_start_9
    monitor-exit p0
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    .line 137
    :try_start_a
    throw v0
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    .line 138
    :catchall_3
    move-exception v0

    .line 139
    move-object p0, v0

    .line 140
    :try_start_b
    monitor-exit v2
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_3

    .line 141
    :try_start_c
    throw p0

    .line 142
    :goto_1
    monitor-exit v1
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    .line 143
    throw p0

    .line 144
    :pswitch_0
    invoke-direct {p0}, Ljv;->a()Ljava/lang/Object;

    .line 145
    .line 146
    .line 147
    move-result-object p0

    .line 148
    return-object p0

    .line 149
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
