.class public final synthetic Llm;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Llw0;


# instance fields
.field public final synthetic a:I


# direct methods
.method public synthetic constructor <init>(I)V
    .locals 0

    .line 1
    iput p1, p0, Llm;->a:I

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .locals 4

    .line 1
    iget p0, p0, Llm;->a:I

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    const/4 v1, 0x0

    .line 5
    packed-switch p0, :pswitch_data_0

    .line 6
    .line 7
    .line 8
    :pswitch_0
    return-object v1

    .line 9
    :pswitch_1
    invoke-static {}, Lcom/google/firebase/perf/session/gauges/GaugeManager;->b()Lnm0;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :pswitch_2
    invoke-static {}, Lcom/google/firebase/perf/session/gauges/GaugeManager;->c()Lhr;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0

    .line 19
    :pswitch_3
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadScheduledExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0

    .line 24
    :pswitch_4
    sget-object p0, Lcom/google/firebase/concurrent/ExecutorsRegistrar;->a:Llh0;

    .line 25
    .line 26
    new-instance p0, Lht;

    .line 27
    .line 28
    const-string v2, "Firebase Scheduler"

    .line 29
    .line 30
    invoke-direct {p0, v2, v0, v1}, Lht;-><init>(Ljava/lang/String;ILandroid/os/StrictMode$ThreadPolicy;)V

    .line 31
    .line 32
    .line 33
    invoke-static {p0}, Ljava/util/concurrent/Executors;->newSingleThreadScheduledExecutor(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ScheduledExecutorService;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0

    .line 38
    :pswitch_5
    sget-object p0, Lcom/google/firebase/concurrent/ExecutorsRegistrar;->a:Llh0;

    .line 39
    .line 40
    new-instance p0, Lht;

    .line 41
    .line 42
    const-string v0, "Firebase Blocking"

    .line 43
    .line 44
    const/16 v2, 0xb

    .line 45
    .line 46
    invoke-direct {p0, v0, v2, v1}, Lht;-><init>(Ljava/lang/String;ILandroid/os/StrictMode$ThreadPolicy;)V

    .line 47
    .line 48
    .line 49
    invoke-static {p0}, Ljava/util/concurrent/Executors;->newCachedThreadPool(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    new-instance v0, Lvw;

    .line 54
    .line 55
    sget-object v1, Lcom/google/firebase/concurrent/ExecutorsRegistrar;->d:Llh0;

    .line 56
    .line 57
    invoke-virtual {v1}, Llh0;->get()Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    check-cast v1, Ljava/util/concurrent/ScheduledExecutorService;

    .line 62
    .line 63
    invoke-direct {v0, p0, v1}, Lvw;-><init>(Ljava/util/concurrent/ExecutorService;Ljava/util/concurrent/ScheduledExecutorService;)V

    .line 64
    .line 65
    .line 66
    return-object v0

    .line 67
    :pswitch_6
    sget-object p0, Lcom/google/firebase/concurrent/ExecutorsRegistrar;->a:Llh0;

    .line 68
    .line 69
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-virtual {p0}, Ljava/lang/Runtime;->availableProcessors()I

    .line 74
    .line 75
    .line 76
    move-result p0

    .line 77
    const/4 v1, 0x2

    .line 78
    invoke-static {v1, p0}, Ljava/lang/Math;->max(II)I

    .line 79
    .line 80
    .line 81
    move-result p0

    .line 82
    new-instance v1, Landroid/os/StrictMode$ThreadPolicy$Builder;

    .line 83
    .line 84
    invoke-direct {v1}, Landroid/os/StrictMode$ThreadPolicy$Builder;-><init>()V

    .line 85
    .line 86
    .line 87
    invoke-virtual {v1}, Landroid/os/StrictMode$ThreadPolicy$Builder;->detectAll()Landroid/os/StrictMode$ThreadPolicy$Builder;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    invoke-virtual {v1}, Landroid/os/StrictMode$ThreadPolicy$Builder;->penaltyLog()Landroid/os/StrictMode$ThreadPolicy$Builder;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    invoke-virtual {v1}, Landroid/os/StrictMode$ThreadPolicy$Builder;->build()Landroid/os/StrictMode$ThreadPolicy;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    new-instance v2, Lht;

    .line 100
    .line 101
    const-string v3, "Firebase Lite"

    .line 102
    .line 103
    invoke-direct {v2, v3, v0, v1}, Lht;-><init>(Ljava/lang/String;ILandroid/os/StrictMode$ThreadPolicy;)V

    .line 104
    .line 105
    .line 106
    invoke-static {p0, v2}, Ljava/util/concurrent/Executors;->newFixedThreadPool(ILjava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    new-instance v0, Lvw;

    .line 111
    .line 112
    sget-object v1, Lcom/google/firebase/concurrent/ExecutorsRegistrar;->d:Llh0;

    .line 113
    .line 114
    invoke-virtual {v1}, Llh0;->get()Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    check-cast v1, Ljava/util/concurrent/ScheduledExecutorService;

    .line 119
    .line 120
    invoke-direct {v0, p0, v1}, Lvw;-><init>(Ljava/util/concurrent/ExecutorService;Ljava/util/concurrent/ScheduledExecutorService;)V

    .line 121
    .line 122
    .line 123
    return-object v0

    .line 124
    :pswitch_7
    sget-object p0, Lcom/google/firebase/concurrent/ExecutorsRegistrar;->a:Llh0;

    .line 125
    .line 126
    new-instance p0, Landroid/os/StrictMode$ThreadPolicy$Builder;

    .line 127
    .line 128
    invoke-direct {p0}, Landroid/os/StrictMode$ThreadPolicy$Builder;-><init>()V

    .line 129
    .line 130
    .line 131
    invoke-virtual {p0}, Landroid/os/StrictMode$ThreadPolicy$Builder;->detectNetwork()Landroid/os/StrictMode$ThreadPolicy$Builder;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    invoke-virtual {p0}, Landroid/os/StrictMode$ThreadPolicy$Builder;->detectResourceMismatches()Landroid/os/StrictMode$ThreadPolicy$Builder;

    .line 136
    .line 137
    .line 138
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 139
    .line 140
    const/16 v1, 0x1a

    .line 141
    .line 142
    if-lt v0, v1, :cond_0

    .line 143
    .line 144
    invoke-static {p0}, Li1;->q(Landroid/os/StrictMode$ThreadPolicy$Builder;)V

    .line 145
    .line 146
    .line 147
    :cond_0
    invoke-virtual {p0}, Landroid/os/StrictMode$ThreadPolicy$Builder;->penaltyLog()Landroid/os/StrictMode$ThreadPolicy$Builder;

    .line 148
    .line 149
    .line 150
    move-result-object p0

    .line 151
    invoke-virtual {p0}, Landroid/os/StrictMode$ThreadPolicy$Builder;->build()Landroid/os/StrictMode$ThreadPolicy;

    .line 152
    .line 153
    .line 154
    move-result-object p0

    .line 155
    new-instance v0, Lht;

    .line 156
    .line 157
    const-string v1, "Firebase Background"

    .line 158
    .line 159
    const/16 v2, 0xa

    .line 160
    .line 161
    invoke-direct {v0, v1, v2, p0}, Lht;-><init>(Ljava/lang/String;ILandroid/os/StrictMode$ThreadPolicy;)V

    .line 162
    .line 163
    .line 164
    const/4 p0, 0x4

    .line 165
    invoke-static {p0, v0}, Ljava/util/concurrent/Executors;->newFixedThreadPool(ILjava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    .line 166
    .line 167
    .line 168
    move-result-object p0

    .line 169
    new-instance v0, Lvw;

    .line 170
    .line 171
    sget-object v1, Lcom/google/firebase/concurrent/ExecutorsRegistrar;->d:Llh0;

    .line 172
    .line 173
    invoke-virtual {v1}, Llh0;->get()Ljava/lang/Object;

    .line 174
    .line 175
    .line 176
    move-result-object v1

    .line 177
    check-cast v1, Ljava/util/concurrent/ScheduledExecutorService;

    .line 178
    .line 179
    invoke-direct {v0, p0, v1}, Lvw;-><init>(Ljava/util/concurrent/ExecutorService;Ljava/util/concurrent/ScheduledExecutorService;)V

    .line 180
    .line 181
    .line 182
    return-object v0

    .line 183
    :pswitch_8
    sget-object p0, Ljava/util/Collections;->EMPTY_SET:Ljava/util/Set;

    .line 184
    .line 185
    return-object p0

    .line 186
    nop

    .line 187
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
