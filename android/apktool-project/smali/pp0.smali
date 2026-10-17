.class public final Lpp0;
.super Ls9;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lo41;


# static fields
.field public static final q:Lg5;


# instance fields
.field public final j:Ljava/util/List;

.field public final k:Lcom/google/firebase/perf/session/gauges/GaugeManager;

.field public final l:Lvd1;

.field public final m:Lmp0;

.field public final n:Ljava/lang/ref/WeakReference;

.field public o:Ljava/lang/String;

.field public p:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Lg5;->c()Lg5;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, Lpp0;->q:Lg5;

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Lvd1;)V
    .locals 2

    .line 1
    invoke-static {}, Lr9;->a()Lr9;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Lcom/google/firebase/perf/session/gauges/GaugeManager;->getInstance()Lcom/google/firebase/perf/session/gauges/GaugeManager;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-direct {p0, v0}, Ls9;-><init>(Lr9;)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Lop0;->M()Lmp0;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iput-object v0, p0, Lpp0;->m:Lmp0;

    .line 17
    .line 18
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 19
    .line 20
    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lpp0;->n:Ljava/lang/ref/WeakReference;

    .line 24
    .line 25
    iput-object p1, p0, Lpp0;->l:Lvd1;

    .line 26
    .line 27
    iput-object v1, p0, Lpp0;->k:Lcom/google/firebase/perf/session/gauges/GaugeManager;

    .line 28
    .line 29
    new-instance p1, Ljava/util/ArrayList;

    .line 30
    .line 31
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-static {p1}, Ljava/util/Collections;->synchronizedList(Ljava/util/List;)Ljava/util/List;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    iput-object p1, p0, Lpp0;->j:Ljava/util/List;

    .line 39
    .line 40
    invoke-virtual {p0}, Ls9;->registerForAppState()V

    .line 41
    .line 42
    .line 43
    return-void
.end method


# virtual methods
.method public final a(Lct0;)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    sget-object p0, Lpp0;->q:Lg5;

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object v0, p0, Lpp0;->m:Lmp0;

    .line 10
    .line 11
    iget-object v1, v0, Lea0;->k:Lia0;

    .line 12
    .line 13
    check-cast v1, Lop0;

    .line 14
    .line 15
    invoke-virtual {v1}, Lop0;->E()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_1

    .line 20
    .line 21
    iget-object v0, v0, Lea0;->k:Lia0;

    .line 22
    .line 23
    check-cast v0, Lop0;

    .line 24
    .line 25
    invoke-virtual {v0}, Lop0;->K()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_1

    .line 30
    .line 31
    iget-object p0, p0, Lpp0;->j:Ljava/util/List;

    .line 32
    .line 33
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    :cond_1
    return-void
.end method

.method public final b()V
    .locals 6

    .line 1
    invoke-static {}, Lcom/google/firebase/perf/session/SessionManager;->getInstance()Lcom/google/firebase/perf/session/SessionManager;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lpp0;->n:Ljava/lang/ref/WeakReference;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/google/firebase/perf/session/SessionManager;->unregisterForSessionUpdates(Ljava/lang/ref/WeakReference;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ls9;->unregisterForAppState()V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lpp0;->j:Ljava/util/List;

    .line 14
    .line 15
    monitor-enter v0

    .line 16
    :try_start_0
    new-instance v1, Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 19
    .line 20
    .line 21
    iget-object v2, p0, Lpp0;->j:Ljava/util/List;

    .line 22
    .line 23
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    if-eqz v3, :cond_1

    .line 32
    .line 33
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    check-cast v3, Lct0;

    .line 38
    .line 39
    if-eqz v3, :cond_0

    .line 40
    .line 41
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :catchall_0
    move-exception p0

    .line 46
    goto :goto_2

    .line 47
    :cond_1
    invoke-static {v1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 52
    invoke-static {v1}, Lct0;->b(Ljava/util/List;)[Lbt0;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    if-eqz v0, :cond_2

    .line 57
    .line 58
    iget-object v1, p0, Lpp0;->m:Lmp0;

    .line 59
    .line 60
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {v1}, Lea0;->i()V

    .line 65
    .line 66
    .line 67
    iget-object v1, v1, Lea0;->k:Lia0;

    .line 68
    .line 69
    check-cast v1, Lop0;

    .line 70
    .line 71
    invoke-virtual {v1, v0}, Lop0;->r(Ljava/util/List;)V

    .line 72
    .line 73
    .line 74
    :cond_2
    iget-object v0, p0, Lpp0;->m:Lmp0;

    .line 75
    .line 76
    invoke-virtual {v0}, Lea0;->h()Lia0;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    check-cast v0, Lop0;

    .line 81
    .line 82
    iget-object v1, p0, Lpp0;->o:Ljava/lang/String;

    .line 83
    .line 84
    if-eqz v1, :cond_4

    .line 85
    .line 86
    sget-object v2, Lqp0;->a:Ljava/util/regex/Pattern;

    .line 87
    .line 88
    invoke-virtual {v2, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->matches()Z

    .line 93
    .line 94
    .line 95
    move-result v1

    .line 96
    if-nez v1, :cond_3

    .line 97
    .line 98
    goto :goto_1

    .line 99
    :cond_3
    sget-object p0, Lpp0;->q:Lg5;

    .line 100
    .line 101
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 102
    .line 103
    .line 104
    return-void

    .line 105
    :cond_4
    sget-object v1, Lqp0;->a:Ljava/util/regex/Pattern;

    .line 106
    .line 107
    :goto_1
    iget-boolean v1, p0, Lpp0;->p:Z

    .line 108
    .line 109
    if-nez v1, :cond_5

    .line 110
    .line 111
    iget-object v1, p0, Lpp0;->l:Lvd1;

    .line 112
    .line 113
    invoke-virtual {p0}, Ls9;->getAppState()Lx9;

    .line 114
    .line 115
    .line 116
    move-result-object v2

    .line 117
    iget-object v3, v1, Lvd1;->r:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 118
    .line 119
    new-instance v4, Len;

    .line 120
    .line 121
    const/4 v5, 0x5

    .line 122
    invoke-direct {v4, v1, v0, v2, v5}, Len;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {v3, v4}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 126
    .line 127
    .line 128
    const/4 v0, 0x1

    .line 129
    iput-boolean v0, p0, Lpp0;->p:Z

    .line 130
    .line 131
    :cond_5
    return-void

    .line 132
    :goto_2
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 133
    throw p0
.end method

.method public final c(Ljava/lang/String;)V
    .locals 10

    .line 1
    if-eqz p1, :cond_9

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const/16 v1, 0x8

    .line 15
    .line 16
    const/4 v2, 0x7

    .line 17
    const/4 v3, 0x6

    .line 18
    const/4 v4, 0x5

    .line 19
    const/4 v5, 0x4

    .line 20
    const/4 v6, 0x3

    .line 21
    const/4 v7, 0x2

    .line 22
    const/4 v8, 0x1

    .line 23
    const/4 v9, -0x1

    .line 24
    sparse-switch v0, :sswitch_data_0

    .line 25
    .line 26
    .line 27
    goto/16 :goto_0

    .line 28
    .line 29
    :sswitch_0
    const-string v0, "DELETE"

    .line 30
    .line 31
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-nez p1, :cond_0

    .line 36
    .line 37
    goto/16 :goto_0

    .line 38
    .line 39
    :cond_0
    move v9, v1

    .line 40
    goto/16 :goto_0

    .line 41
    .line 42
    :sswitch_1
    const-string v0, "CONNECT"

    .line 43
    .line 44
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    if-nez p1, :cond_1

    .line 49
    .line 50
    goto/16 :goto_0

    .line 51
    .line 52
    :cond_1
    move v9, v2

    .line 53
    goto :goto_0

    .line 54
    :sswitch_2
    const-string v0, "TRACE"

    .line 55
    .line 56
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    if-nez p1, :cond_2

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_2
    move v9, v3

    .line 64
    goto :goto_0

    .line 65
    :sswitch_3
    const-string v0, "PATCH"

    .line 66
    .line 67
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    if-nez p1, :cond_3

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_3
    move v9, v4

    .line 75
    goto :goto_0

    .line 76
    :sswitch_4
    const-string v0, "POST"

    .line 77
    .line 78
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    move-result p1

    .line 82
    if-nez p1, :cond_4

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_4
    move v9, v5

    .line 86
    goto :goto_0

    .line 87
    :sswitch_5
    const-string v0, "HEAD"

    .line 88
    .line 89
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    move-result p1

    .line 93
    if-nez p1, :cond_5

    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_5
    move v9, v6

    .line 97
    goto :goto_0

    .line 98
    :sswitch_6
    const-string v0, "PUT"

    .line 99
    .line 100
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    move-result p1

    .line 104
    if-nez p1, :cond_6

    .line 105
    .line 106
    goto :goto_0

    .line 107
    :cond_6
    move v9, v7

    .line 108
    goto :goto_0

    .line 109
    :sswitch_7
    const-string v0, "GET"

    .line 110
    .line 111
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    move-result p1

    .line 115
    if-nez p1, :cond_7

    .line 116
    .line 117
    goto :goto_0

    .line 118
    :cond_7
    move v9, v8

    .line 119
    goto :goto_0

    .line 120
    :sswitch_8
    const-string v0, "OPTIONS"

    .line 121
    .line 122
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 123
    .line 124
    .line 125
    move-result p1

    .line 126
    if-nez p1, :cond_8

    .line 127
    .line 128
    goto :goto_0

    .line 129
    :cond_8
    const/4 v9, 0x0

    .line 130
    :goto_0
    packed-switch v9, :pswitch_data_0

    .line 131
    .line 132
    .line 133
    move v1, v8

    .line 134
    goto :goto_1

    .line 135
    :pswitch_0
    move v1, v4

    .line 136
    goto :goto_1

    .line 137
    :pswitch_1
    const/16 v1, 0xa

    .line 138
    .line 139
    goto :goto_1

    .line 140
    :pswitch_2
    const/16 v1, 0x9

    .line 141
    .line 142
    goto :goto_1

    .line 143
    :pswitch_3
    move v1, v2

    .line 144
    goto :goto_1

    .line 145
    :pswitch_4
    move v1, v5

    .line 146
    goto :goto_1

    .line 147
    :pswitch_5
    move v1, v3

    .line 148
    goto :goto_1

    .line 149
    :pswitch_6
    move v1, v6

    .line 150
    goto :goto_1

    .line 151
    :pswitch_7
    move v1, v7

    .line 152
    :goto_1
    :pswitch_8
    iget-object p0, p0, Lpp0;->m:Lmp0;

    .line 153
    .line 154
    invoke-virtual {p0}, Lea0;->i()V

    .line 155
    .line 156
    .line 157
    iget-object p0, p0, Lea0;->k:Lia0;

    .line 158
    .line 159
    check-cast p0, Lop0;

    .line 160
    .line 161
    invoke-virtual {p0, v1}, Lop0;->O(I)V

    .line 162
    .line 163
    .line 164
    :cond_9
    return-void

    .line 165
    :sswitch_data_0
    .sparse-switch
        -0x1faded82 -> :sswitch_8
        0x11336 -> :sswitch_7
        0x136ef -> :sswitch_6
        0x21c5e0 -> :sswitch_5
        0x2590a0 -> :sswitch_4
        0x4862828 -> :sswitch_3
        0x4c5f925 -> :sswitch_2
        0x638004ca -> :sswitch_1
        0x77f979ab -> :sswitch_0
    .end sparse-switch

    .line 166
    .line 167
    .line 168
    .line 169
    .line 170
    .line 171
    .line 172
    .line 173
    .line 174
    .line 175
    .line 176
    .line 177
    .line 178
    .line 179
    .line 180
    .line 181
    .line 182
    .line 183
    .line 184
    .line 185
    .line 186
    .line 187
    .line 188
    .line 189
    .line 190
    .line 191
    .line 192
    .line 193
    .line 194
    .line 195
    .line 196
    .line 197
    .line 198
    .line 199
    .line 200
    .line 201
    .line 202
    .line 203
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final d(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lpp0;->m:Lmp0;

    .line 2
    .line 3
    invoke-virtual {p0}, Lea0;->i()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lea0;->k:Lia0;

    .line 7
    .line 8
    check-cast p0, Lop0;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Lop0;->P(I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final e(J)V
    .locals 0

    .line 1
    iget-object p0, p0, Lpp0;->m:Lmp0;

    .line 2
    .line 3
    invoke-virtual {p0}, Lea0;->i()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lea0;->k:Lia0;

    .line 7
    .line 8
    check-cast p0, Lop0;

    .line 9
    .line 10
    invoke-virtual {p0, p1, p2}, Lop0;->R(J)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final f(J)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/google/firebase/perf/session/SessionManager;->getInstance()Lcom/google/firebase/perf/session/SessionManager;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/google/firebase/perf/session/SessionManager;->perfSession()Lct0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {}, Lcom/google/firebase/perf/session/SessionManager;->getInstance()Lcom/google/firebase/perf/session/SessionManager;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget-object v2, p0, Lpp0;->n:Ljava/lang/ref/WeakReference;

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Lcom/google/firebase/perf/session/SessionManager;->registerForSessionUpdates(Ljava/lang/ref/WeakReference;)V

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lpp0;->m:Lmp0;

    .line 19
    .line 20
    invoke-virtual {v1}, Lea0;->i()V

    .line 21
    .line 22
    .line 23
    iget-object v1, v1, Lea0;->k:Lia0;

    .line 24
    .line 25
    check-cast v1, Lop0;

    .line 26
    .line 27
    invoke-virtual {v1, p1, p2}, Lop0;->N(J)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, v0}, Lpp0;->a(Lct0;)V

    .line 31
    .line 32
    .line 33
    iget-boolean p1, v0, Lct0;->l:Z

    .line 34
    .line 35
    if-eqz p1, :cond_0

    .line 36
    .line 37
    iget-object p0, p0, Lpp0;->k:Lcom/google/firebase/perf/session/gauges/GaugeManager;

    .line 38
    .line 39
    iget-object p1, v0, Lct0;->k:Loc1;

    .line 40
    .line 41
    invoke-virtual {p0, p1}, Lcom/google/firebase/perf/session/gauges/GaugeManager;->collectGaugeMetricOnce(Loc1;)V

    .line 42
    .line 43
    .line 44
    :cond_0
    return-void
.end method

.method public final g(Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object p0, p0, Lpp0;->m:Lmp0;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lea0;->i()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lea0;->k:Lia0;

    .line 9
    .line 10
    check-cast p0, Lop0;

    .line 11
    .line 12
    invoke-virtual {p0}, Lop0;->s()V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    const/16 v1, 0x80

    .line 21
    .line 22
    if-le v0, v1, :cond_1

    .line 23
    .line 24
    goto :goto_1

    .line 25
    :cond_1
    const/4 v0, 0x0

    .line 26
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-ge v0, v1, :cond_4

    .line 31
    .line 32
    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    const/16 v2, 0x1f

    .line 37
    .line 38
    if-le v1, v2, :cond_3

    .line 39
    .line 40
    const/16 v2, 0x7f

    .line 41
    .line 42
    if-le v1, v2, :cond_2

    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_2
    add-int/lit8 v0, v0, 0x1

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_3
    :goto_1
    const-string p0, "The content type of the response is not a valid content-type:"

    .line 49
    .line 50
    invoke-virtual {p0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    sget-object p0, Lpp0;->q:Lg5;

    .line 54
    .line 55
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_4
    invoke-virtual {p0}, Lea0;->i()V

    .line 60
    .line 61
    .line 62
    iget-object p0, p0, Lea0;->k:Lia0;

    .line 63
    .line 64
    check-cast p0, Lop0;

    .line 65
    .line 66
    invoke-virtual {p0, p1}, Lop0;->S(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public final h(J)V
    .locals 0

    .line 1
    iget-object p0, p0, Lpp0;->m:Lmp0;

    .line 2
    .line 3
    invoke-virtual {p0}, Lea0;->i()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lea0;->k:Lia0;

    .line 7
    .line 8
    check-cast p0, Lop0;

    .line 9
    .line 10
    invoke-virtual {p0, p1, p2}, Lop0;->T(J)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final i(J)V
    .locals 1

    .line 1
    iget-object v0, p0, Lpp0;->m:Lmp0;

    .line 2
    .line 3
    invoke-virtual {v0}, Lea0;->i()V

    .line 4
    .line 5
    .line 6
    iget-object v0, v0, Lea0;->k:Lia0;

    .line 7
    .line 8
    check-cast v0, Lop0;

    .line 9
    .line 10
    invoke-virtual {v0, p1, p2}, Lop0;->V(J)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Lcom/google/firebase/perf/session/SessionManager;->getInstance()Lcom/google/firebase/perf/session/SessionManager;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p1}, Lcom/google/firebase/perf/session/SessionManager;->perfSession()Lct0;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iget-boolean p1, p1, Lct0;->l:Z

    .line 22
    .line 23
    if-eqz p1, :cond_0

    .line 24
    .line 25
    invoke-static {}, Lcom/google/firebase/perf/session/SessionManager;->getInstance()Lcom/google/firebase/perf/session/SessionManager;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p1}, Lcom/google/firebase/perf/session/SessionManager;->perfSession()Lct0;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    iget-object p1, p1, Lct0;->k:Loc1;

    .line 34
    .line 35
    iget-object p0, p0, Lpp0;->k:Lcom/google/firebase/perf/session/gauges/GaugeManager;

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Lcom/google/firebase/perf/session/gauges/GaugeManager;->collectGaugeMetricOnce(Loc1;)V

    .line 38
    .line 39
    .line 40
    :cond_0
    return-void
.end method

.method public final j(Ljava/lang/String;)V
    .locals 6

    .line 1
    if-eqz p1, :cond_5

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    :try_start_0
    new-instance v1, Ldd0;

    .line 5
    .line 6
    invoke-direct {v1}, Ldd0;-><init>()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {v1, v0, p1}, Ldd0;->c(Led0;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v1}, Ldd0;->a()Led0;

    .line 13
    .line 14
    .line 15
    move-result-object v1
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 16
    goto :goto_0

    .line 17
    :catch_0
    move-object v1, v0

    .line 18
    :goto_0
    const/4 v2, 0x0

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    invoke-virtual {v1}, Led0;->f()Ldd0;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    const-string v1, ""

    .line 26
    .line 27
    const-string v3, " \"\':;<=>@[]^`{}|/\\?#"

    .line 28
    .line 29
    const/16 v4, 0xfb

    .line 30
    .line 31
    invoke-static {v1, v2, v2, v3, v4}, Lok0;->m(Ljava/lang/String;IILjava/lang/String;I)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v5

    .line 35
    iput-object v5, p1, Ldd0;->b:Ljava/lang/String;

    .line 36
    .line 37
    invoke-static {v1, v2, v2, v3, v4}, Lok0;->m(Ljava/lang/String;IILjava/lang/String;I)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    iput-object v1, p1, Ldd0;->c:Ljava/lang/String;

    .line 42
    .line 43
    iput-object v0, p1, Ldd0;->g:Ljava/util/ArrayList;

    .line 44
    .line 45
    iput-object v0, p1, Ldd0;->h:Ljava/lang/String;

    .line 46
    .line 47
    invoke-virtual {p1}, Ldd0;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    const/16 v3, 0x7d0

    .line 56
    .line 57
    if-gt v1, v3, :cond_1

    .line 58
    .line 59
    goto :goto_1

    .line 60
    :cond_1
    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    const/16 v4, 0x2f

    .line 65
    .line 66
    if-ne v1, v4, :cond_2

    .line 67
    .line 68
    invoke-virtual {p1, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    goto :goto_1

    .line 73
    :cond_2
    :try_start_1
    new-instance v1, Ldd0;

    .line 74
    .line 75
    invoke-direct {v1}, Ldd0;-><init>()V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v1, v0, p1}, Ldd0;->c(Led0;Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v1}, Ldd0;->a()Led0;

    .line 82
    .line 83
    .line 84
    move-result-object v0
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_1

    .line 85
    :catch_1
    if-nez v0, :cond_3

    .line 86
    .line 87
    invoke-virtual {p1, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    goto :goto_1

    .line 92
    :cond_3
    invoke-virtual {v0}, Led0;->b()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-virtual {v0, v4}, Ljava/lang/String;->lastIndexOf(I)I

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    if-ltz v0, :cond_4

    .line 101
    .line 102
    const/16 v0, 0x7cf

    .line 103
    .line 104
    invoke-virtual {p1, v4, v0}, Ljava/lang/String;->lastIndexOf(II)I

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    if-ltz v0, :cond_4

    .line 109
    .line 110
    invoke-virtual {p1, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    goto :goto_1

    .line 115
    :cond_4
    invoke-virtual {p1, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    :goto_1
    iget-object p0, p0, Lpp0;->m:Lmp0;

    .line 120
    .line 121
    invoke-virtual {p0}, Lea0;->i()V

    .line 122
    .line 123
    .line 124
    iget-object p0, p0, Lea0;->k:Lia0;

    .line 125
    .line 126
    check-cast p0, Lop0;

    .line 127
    .line 128
    invoke-virtual {p0, p1}, Lop0;->X(Ljava/lang/String;)V

    .line 129
    .line 130
    .line 131
    :cond_5
    return-void
.end method
