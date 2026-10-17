.class public Lcom/google/firebase/perf/metrics/Trace;
.super Ls9;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Landroid/os/Parcelable;
.implements Lo41;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/google/firebase/perf/metrics/Trace;",
            ">;"
        }
    .end annotation
.end field

.field public static final v:Lg5;


# instance fields
.field public final j:Ljava/lang/ref/WeakReference;

.field public final k:Lcom/google/firebase/perf/metrics/Trace;

.field public final l:Lcom/google/firebase/perf/session/gauges/GaugeManager;

.field public final m:Ljava/lang/String;

.field public final n:Ljava/util/concurrent/ConcurrentHashMap;

.field public final o:Ljava/util/concurrent/ConcurrentHashMap;

.field public final p:Ljava/util/List;

.field public final q:Ljava/util/ArrayList;

.field public final r:Lvd1;

.field public final s:Lmz;

.field public t:Loc1;

.field public u:Loc1;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    invoke-static {}, Lg5;->c()Lg5;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, Lcom/google/firebase/perf/metrics/Trace;->v:Lg5;

    .line 6
    .line 7
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 10
    .line 11
    .line 12
    new-instance v0, Lg3;

    .line 13
    .line 14
    const/16 v1, 0x17

    .line 15
    .line 16
    invoke-direct {v0, v1}, Lg3;-><init>(I)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Lcom/google/firebase/perf/metrics/Trace;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 20
    .line 21
    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;Z)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p2, :cond_0

    .line 3
    .line 4
    move-object v1, v0

    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-static {}, Lr9;->a()Lr9;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    :goto_0
    invoke-direct {p0, v1}, Ls9;-><init>(Lr9;)V

    .line 11
    .line 12
    .line 13
    new-instance v1, Ljava/lang/ref/WeakReference;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    iput-object v1, p0, Lcom/google/firebase/perf/metrics/Trace;->j:Ljava/lang/ref/WeakReference;

    .line 19
    .line 20
    const-class v1, Lcom/google/firebase/perf/metrics/Trace;

    .line 21
    .line 22
    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-virtual {p1, v2}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    check-cast v2, Lcom/google/firebase/perf/metrics/Trace;

    .line 31
    .line 32
    iput-object v2, p0, Lcom/google/firebase/perf/metrics/Trace;->k:Lcom/google/firebase/perf/metrics/Trace;

    .line 33
    .line 34
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    iput-object v2, p0, Lcom/google/firebase/perf/metrics/Trace;->m:Ljava/lang/String;

    .line 39
    .line 40
    new-instance v2, Ljava/util/ArrayList;

    .line 41
    .line 42
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 43
    .line 44
    .line 45
    iput-object v2, p0, Lcom/google/firebase/perf/metrics/Trace;->q:Ljava/util/ArrayList;

    .line 46
    .line 47
    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {p1, v2, v1}, Landroid/os/Parcel;->readList(Ljava/util/List;Ljava/lang/ClassLoader;)V

    .line 52
    .line 53
    .line 54
    new-instance v1, Ljava/util/concurrent/ConcurrentHashMap;

    .line 55
    .line 56
    invoke-direct {v1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 57
    .line 58
    .line 59
    iput-object v1, p0, Lcom/google/firebase/perf/metrics/Trace;->n:Ljava/util/concurrent/ConcurrentHashMap;

    .line 60
    .line 61
    new-instance v2, Ljava/util/concurrent/ConcurrentHashMap;

    .line 62
    .line 63
    invoke-direct {v2}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 64
    .line 65
    .line 66
    iput-object v2, p0, Lcom/google/firebase/perf/metrics/Trace;->o:Ljava/util/concurrent/ConcurrentHashMap;

    .line 67
    .line 68
    const-class v2, Lfr;

    .line 69
    .line 70
    invoke-virtual {v2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    invoke-virtual {p1, v1, v2}, Landroid/os/Parcel;->readMap(Ljava/util/Map;Ljava/lang/ClassLoader;)V

    .line 75
    .line 76
    .line 77
    const-class v1, Loc1;

    .line 78
    .line 79
    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    invoke-virtual {p1, v2}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    check-cast v2, Loc1;

    .line 88
    .line 89
    iput-object v2, p0, Lcom/google/firebase/perf/metrics/Trace;->t:Loc1;

    .line 90
    .line 91
    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    check-cast v1, Loc1;

    .line 100
    .line 101
    iput-object v1, p0, Lcom/google/firebase/perf/metrics/Trace;->u:Loc1;

    .line 102
    .line 103
    new-instance v1, Ljava/util/ArrayList;

    .line 104
    .line 105
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 106
    .line 107
    .line 108
    invoke-static {v1}, Ljava/util/Collections;->synchronizedList(Ljava/util/List;)Ljava/util/List;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    iput-object v1, p0, Lcom/google/firebase/perf/metrics/Trace;->p:Ljava/util/List;

    .line 113
    .line 114
    const-class v2, Lct0;

    .line 115
    .line 116
    invoke-virtual {v2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 117
    .line 118
    .line 119
    move-result-object v2

    .line 120
    invoke-virtual {p1, v1, v2}, Landroid/os/Parcel;->readList(Ljava/util/List;Ljava/lang/ClassLoader;)V

    .line 121
    .line 122
    .line 123
    if-eqz p2, :cond_1

    .line 124
    .line 125
    iput-object v0, p0, Lcom/google/firebase/perf/metrics/Trace;->r:Lvd1;

    .line 126
    .line 127
    iput-object v0, p0, Lcom/google/firebase/perf/metrics/Trace;->s:Lmz;

    .line 128
    .line 129
    iput-object v0, p0, Lcom/google/firebase/perf/metrics/Trace;->l:Lcom/google/firebase/perf/session/gauges/GaugeManager;

    .line 130
    .line 131
    return-void

    .line 132
    :cond_1
    sget-object p1, Lvd1;->B:Lvd1;

    .line 133
    .line 134
    iput-object p1, p0, Lcom/google/firebase/perf/metrics/Trace;->r:Lvd1;

    .line 135
    .line 136
    new-instance p1, Lmz;

    .line 137
    .line 138
    const/16 p2, 0xb

    .line 139
    .line 140
    invoke-direct {p1, p2}, Lmz;-><init>(I)V

    .line 141
    .line 142
    .line 143
    iput-object p1, p0, Lcom/google/firebase/perf/metrics/Trace;->s:Lmz;

    .line 144
    .line 145
    invoke-static {}, Lcom/google/firebase/perf/session/gauges/GaugeManager;->getInstance()Lcom/google/firebase/perf/session/gauges/GaugeManager;

    .line 146
    .line 147
    .line 148
    move-result-object p1

    .line 149
    iput-object p1, p0, Lcom/google/firebase/perf/metrics/Trace;->l:Lcom/google/firebase/perf/session/gauges/GaugeManager;

    .line 150
    .line 151
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lvd1;Lmz;Lr9;)V
    .locals 1

    .line 152
    invoke-static {}, Lcom/google/firebase/perf/session/gauges/GaugeManager;->getInstance()Lcom/google/firebase/perf/session/gauges/GaugeManager;

    move-result-object v0

    .line 153
    invoke-direct {p0, p4}, Ls9;-><init>(Lr9;)V

    .line 154
    new-instance p4, Ljava/lang/ref/WeakReference;

    invoke-direct {p4, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p4, p0, Lcom/google/firebase/perf/metrics/Trace;->j:Ljava/lang/ref/WeakReference;

    const/4 p4, 0x0

    .line 155
    iput-object p4, p0, Lcom/google/firebase/perf/metrics/Trace;->k:Lcom/google/firebase/perf/metrics/Trace;

    .line 156
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/google/firebase/perf/metrics/Trace;->m:Ljava/lang/String;

    .line 157
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/perf/metrics/Trace;->q:Ljava/util/ArrayList;

    .line 158
    new-instance p1, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {p1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/perf/metrics/Trace;->n:Ljava/util/concurrent/ConcurrentHashMap;

    .line 159
    new-instance p1, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {p1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/perf/metrics/Trace;->o:Ljava/util/concurrent/ConcurrentHashMap;

    .line 160
    iput-object p3, p0, Lcom/google/firebase/perf/metrics/Trace;->s:Lmz;

    .line 161
    iput-object p2, p0, Lcom/google/firebase/perf/metrics/Trace;->r:Lvd1;

    .line 162
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    invoke-static {p1}, Ljava/util/Collections;->synchronizedList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lcom/google/firebase/perf/metrics/Trace;->p:Ljava/util/List;

    .line 163
    iput-object v0, p0, Lcom/google/firebase/perf/metrics/Trace;->l:Lcom/google/firebase/perf/session/gauges/GaugeManager;

    return-void
.end method


# virtual methods
.method public final a(Lct0;)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    sget-object p0, Lcom/google/firebase/perf/metrics/Trace;->v:Lg5;

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object v0, p0, Lcom/google/firebase/perf/metrics/Trace;->t:Loc1;

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/google/firebase/perf/metrics/Trace;->b()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    iget-object p0, p0, Lcom/google/firebase/perf/metrics/Trace;->p:Ljava/util/List;

    .line 20
    .line 21
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    :cond_1
    return-void
.end method

.method public final b()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/firebase/perf/metrics/Trace;->u:Loc1;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public describeContents()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public final finalize()V
    .locals 4

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/google/firebase/perf/metrics/Trace;->t:Loc1;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    move v0, v1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    :goto_0
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/google/firebase/perf/metrics/Trace;->b()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    sget-object v0, Lcom/google/firebase/perf/metrics/Trace;->v:Lg5;

    .line 18
    .line 19
    const-string v2, "Trace \'%s\' is started but not stopped when it is destructed!"

    .line 20
    .line 21
    iget-object v3, p0, Lcom/google/firebase/perf/metrics/Trace;->m:Ljava/lang/String;

    .line 22
    .line 23
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    invoke-virtual {v0, v2, v3}, Lg5;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, v1}, Ls9;->incrementTsnsCount(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    .line 32
    .line 33
    goto :goto_1

    .line 34
    :catchall_0
    move-exception v0

    .line 35
    goto :goto_2

    .line 36
    :cond_1
    :goto_1
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :goto_2
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 41
    .line 42
    .line 43
    throw v0
.end method

.method public getAttribute(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/firebase/perf/metrics/Trace;->o:Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/String;

    .line 8
    .line 9
    return-object p0
.end method

.method public getAttributes()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/google/firebase/perf/metrics/Trace;->o:Ljava/util/concurrent/ConcurrentHashMap;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public getLongMetric(Ljava/lang/String;)J
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lcom/google/firebase/perf/metrics/Trace;->n:Ljava/util/concurrent/ConcurrentHashMap;

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lfr;

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    :goto_0
    if-nez p0, :cond_1

    .line 18
    .line 19
    const-wide/16 p0, 0x0

    .line 20
    .line 21
    return-wide p0

    .line 22
    :cond_1
    iget-object p0, p0, Lfr;->k:Ljava/util/concurrent/atomic/AtomicLong;

    .line 23
    .line 24
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 25
    .line 26
    .line 27
    move-result-wide p0

    .line 28
    return-wide p0
.end method

.method public incrementMetric(Ljava/lang/String;J)V
    .locals 4

    .line 1
    invoke-static {p1}, Lzs0;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/google/firebase/perf/metrics/Trace;->v:Lg5;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const-string p0, "Cannot increment metric \'%s\'. Metric name is invalid.(%s)"

    .line 10
    .line 11
    filled-new-array {p1, v0}, [Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {v1, p0, p1}, Lg5;->b(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    iget-object v0, p0, Lcom/google/firebase/perf/metrics/Trace;->t:Loc1;

    .line 20
    .line 21
    iget-object v2, p0, Lcom/google/firebase/perf/metrics/Trace;->m:Ljava/lang/String;

    .line 22
    .line 23
    if-eqz v0, :cond_3

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/google/firebase/perf/metrics/Trace;->b()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    const-string p0, "Cannot increment metric \'%s\' for trace \'%s\' because it\'s been stopped"

    .line 32
    .line 33
    filled-new-array {p1, v2}, [Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {v1, p0, p1}, Lg5;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iget-object p0, p0, Lcom/google/firebase/perf/metrics/Trace;->n:Ljava/util/concurrent/ConcurrentHashMap;

    .line 46
    .line 47
    invoke-virtual {p0, v0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    check-cast v3, Lfr;

    .line 52
    .line 53
    if-nez v3, :cond_2

    .line 54
    .line 55
    new-instance v3, Lfr;

    .line 56
    .line 57
    invoke-direct {v3, v0}, Lfr;-><init>(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0, v0, v3}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    :cond_2
    iget-object p0, v3, Lfr;->k:Ljava/util/concurrent/atomic/AtomicLong;

    .line 64
    .line 65
    invoke-virtual {p0, p2, p3}, Ljava/util/concurrent/atomic/AtomicLong;->addAndGet(J)J

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 69
    .line 70
    .line 71
    move-result-wide p2

    .line 72
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    filled-new-array {p1, p0, v2}, [Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    const-string p1, "Incrementing metric \'%s\' to %d on trace \'%s\'"

    .line 81
    .line 82
    invoke-virtual {v1, p1, p0}, Lg5;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 83
    .line 84
    .line 85
    return-void

    .line 86
    :cond_3
    const-string p0, "Cannot increment metric \'%s\' for trace \'%s\' because it\'s not started"

    .line 87
    .line 88
    filled-new-array {p1, v2}, [Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    invoke-virtual {v1, p0, p1}, Lg5;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 93
    .line 94
    .line 95
    return-void
.end method

.method public putAttribute(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/google/firebase/perf/metrics/Trace;->o:Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    sget-object v1, Lcom/google/firebase/perf/metrics/Trace;->v:Lg5;

    .line 4
    .line 5
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    invoke-virtual {p0}, Lcom/google/firebase/perf/metrics/Trace;->b()Z

    .line 14
    .line 15
    .line 16
    move-result v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    iget-object p0, p0, Lcom/google/firebase/perf/metrics/Trace;->m:Ljava/lang/String;

    .line 18
    .line 19
    if-nez v2, :cond_2

    .line 20
    .line 21
    :try_start_1
    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->containsKey(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    if-nez v2, :cond_1

    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->size()I

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    const/4 v3, 0x5

    .line 32
    if-ge v2, v3, :cond_0

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    sget-object v2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 36
    .line 37
    const-string v2, "Exceeds max limit of number of attributes - 5"

    .line 38
    .line 39
    invoke-static {v2}, Lz0;->d(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    goto :goto_1

    .line 43
    :cond_1
    :goto_0
    invoke-static {p1, p2}, Lzs0;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_2
    sget-object v2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 48
    .line 49
    const-string v2, "Trace \'"

    .line 50
    .line 51
    const-string v3, "\' has been stopped"

    .line 52
    .line 53
    invoke-static {v2, p0, v3}, Loq;->j(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    invoke-static {v2}, Lz0;->d(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    :goto_1
    const-string v2, "Setting attribute \'%s\' to \'%s\' on trace \'%s\'"

    .line 61
    .line 62
    filled-new-array {p1, p2, p0}, [Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {v1, v2, p0}, Lg5;->a(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 67
    .line 68
    .line 69
    const/4 p0, 0x1

    .line 70
    goto :goto_2

    .line 71
    :catch_0
    move-exception p0

    .line 72
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    filled-new-array {p1, p2, p0}, [Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    const-string v2, "Can not set attribute \'%s\' with value \'%s\' (%s)"

    .line 81
    .line 82
    invoke-virtual {v1, v2, p0}, Lg5;->b(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 83
    .line 84
    .line 85
    const/4 p0, 0x0

    .line 86
    :goto_2
    if-eqz p0, :cond_3

    .line 87
    .line 88
    invoke-virtual {v0, p1, p2}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    :cond_3
    return-void
.end method

.method public putMetric(Ljava/lang/String;J)V
    .locals 4

    .line 1
    invoke-static {p1}, Lzs0;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/google/firebase/perf/metrics/Trace;->v:Lg5;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const-string p0, "Cannot set value for metric \'%s\'. Metric name is invalid.(%s)"

    .line 10
    .line 11
    filled-new-array {p1, v0}, [Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {v1, p0, p1}, Lg5;->b(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    iget-object v0, p0, Lcom/google/firebase/perf/metrics/Trace;->t:Loc1;

    .line 20
    .line 21
    iget-object v2, p0, Lcom/google/firebase/perf/metrics/Trace;->m:Ljava/lang/String;

    .line 22
    .line 23
    if-eqz v0, :cond_3

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/google/firebase/perf/metrics/Trace;->b()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    const-string p0, "Cannot set value for metric \'%s\' for trace \'%s\' because it\'s been stopped"

    .line 32
    .line 33
    filled-new-array {p1, v2}, [Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {v1, p0, p1}, Lg5;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iget-object p0, p0, Lcom/google/firebase/perf/metrics/Trace;->n:Ljava/util/concurrent/ConcurrentHashMap;

    .line 46
    .line 47
    invoke-virtual {p0, v0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    check-cast v3, Lfr;

    .line 52
    .line 53
    if-nez v3, :cond_2

    .line 54
    .line 55
    new-instance v3, Lfr;

    .line 56
    .line 57
    invoke-direct {v3, v0}, Lfr;-><init>(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0, v0, v3}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    :cond_2
    iget-object p0, v3, Lfr;->k:Ljava/util/concurrent/atomic/AtomicLong;

    .line 64
    .line 65
    invoke-virtual {p0, p2, p3}, Ljava/util/concurrent/atomic/AtomicLong;->set(J)V

    .line 66
    .line 67
    .line 68
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    filled-new-array {p1, p0, v2}, [Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    const-string p1, "Setting metric \'%s\' to \'%s\' on trace \'%s\'"

    .line 77
    .line 78
    invoke-virtual {v1, p1, p0}, Lg5;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 79
    .line 80
    .line 81
    return-void

    .line 82
    :cond_3
    const-string p0, "Cannot set value for metric \'%s\' for trace \'%s\' because it\'s not started"

    .line 83
    .line 84
    filled-new-array {p1, v2}, [Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    invoke-virtual {v1, p0, p1}, Lg5;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 89
    .line 90
    .line 91
    return-void
.end method

.method public removeAttribute(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/firebase/perf/metrics/Trace;->b()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object p0, Lcom/google/firebase/perf/metrics/Trace;->v:Lg5;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-object p0, p0, Lcom/google/firebase/perf/metrics/Trace;->o:Ljava/util/concurrent/ConcurrentHashMap;

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public start()V
    .locals 7

    .line 1
    invoke-static {}, Lkn;->e()Lkn;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lkn;->n()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    sget-object v1, Lcom/google/firebase/perf/metrics/Trace;->v:Lg5;

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    sget-object v0, Lzs0;->a:Ljava/util/regex/Pattern;

    .line 18
    .line 19
    iget-object v0, p0, Lcom/google/firebase/perf/metrics/Trace;->m:Ljava/lang/String;

    .line 20
    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    const-string v2, "Trace name must not be null"

    .line 24
    .line 25
    goto :goto_3

    .line 26
    :cond_1
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    const/16 v3, 0x64

    .line 31
    .line 32
    if-le v2, v3, :cond_2

    .line 33
    .line 34
    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 35
    .line 36
    const-string v2, "Trace name must not exceed 100 characters"

    .line 37
    .line 38
    goto :goto_3

    .line 39
    :cond_2
    const-string v2, "_"

    .line 40
    .line 41
    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    const/4 v3, 0x0

    .line 46
    if-eqz v2, :cond_3

    .line 47
    .line 48
    const/4 v2, 0x6

    .line 49
    invoke-static {v2}, Loq;->u(I)[I

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    array-length v4, v2

    .line 54
    const/4 v5, 0x0

    .line 55
    :goto_0
    if-ge v5, v4, :cond_5

    .line 56
    .line 57
    aget v6, v2, v5

    .line 58
    .line 59
    packed-switch v6, :pswitch_data_0

    .line 60
    .line 61
    .line 62
    throw v3

    .line 63
    :pswitch_0
    const-string v6, "_bs"

    .line 64
    .line 65
    goto :goto_1

    .line 66
    :pswitch_1
    const-string v6, "_fs"

    .line 67
    .line 68
    goto :goto_1

    .line 69
    :pswitch_2
    const-string v6, "_asti"

    .line 70
    .line 71
    goto :goto_1

    .line 72
    :pswitch_3
    const-string v6, "_astfd"

    .line 73
    .line 74
    goto :goto_1

    .line 75
    :pswitch_4
    const-string v6, "_astui"

    .line 76
    .line 77
    goto :goto_1

    .line 78
    :pswitch_5
    const-string v6, "_as"

    .line 79
    .line 80
    :goto_1
    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    move-result v6

    .line 84
    if-eqz v6, :cond_4

    .line 85
    .line 86
    :cond_3
    :goto_2
    move-object v2, v3

    .line 87
    goto :goto_3

    .line 88
    :cond_4
    add-int/lit8 v5, v5, 0x1

    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_5
    const-string v2, "_st_"

    .line 92
    .line 93
    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 94
    .line 95
    .line 96
    move-result v2

    .line 97
    if-eqz v2, :cond_6

    .line 98
    .line 99
    goto :goto_2

    .line 100
    :cond_6
    const-string v2, "Trace name must not start with \'_\'"

    .line 101
    .line 102
    :goto_3
    if-eqz v2, :cond_7

    .line 103
    .line 104
    const-string p0, "Cannot start trace \'%s\'. Trace name is invalid.(%s)"

    .line 105
    .line 106
    filled-new-array {v0, v2}, [Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    invoke-virtual {v1, p0, v0}, Lg5;->b(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 111
    .line 112
    .line 113
    return-void

    .line 114
    :cond_7
    iget-object v2, p0, Lcom/google/firebase/perf/metrics/Trace;->t:Loc1;

    .line 115
    .line 116
    if-eqz v2, :cond_8

    .line 117
    .line 118
    const-string p0, "Trace \'%s\' has already started, should not start again!"

    .line 119
    .line 120
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    invoke-virtual {v1, p0, v0}, Lg5;->b(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 125
    .line 126
    .line 127
    return-void

    .line 128
    :cond_8
    iget-object v0, p0, Lcom/google/firebase/perf/metrics/Trace;->s:Lmz;

    .line 129
    .line 130
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 131
    .line 132
    .line 133
    new-instance v0, Loc1;

    .line 134
    .line 135
    invoke-direct {v0}, Loc1;-><init>()V

    .line 136
    .line 137
    .line 138
    iput-object v0, p0, Lcom/google/firebase/perf/metrics/Trace;->t:Loc1;

    .line 139
    .line 140
    invoke-virtual {p0}, Ls9;->registerForAppState()V

    .line 141
    .line 142
    .line 143
    invoke-static {}, Lcom/google/firebase/perf/session/SessionManager;->getInstance()Lcom/google/firebase/perf/session/SessionManager;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    invoke-virtual {v0}, Lcom/google/firebase/perf/session/SessionManager;->perfSession()Lct0;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    invoke-static {}, Lcom/google/firebase/perf/session/SessionManager;->getInstance()Lcom/google/firebase/perf/session/SessionManager;

    .line 152
    .line 153
    .line 154
    move-result-object v1

    .line 155
    iget-object v2, p0, Lcom/google/firebase/perf/metrics/Trace;->j:Ljava/lang/ref/WeakReference;

    .line 156
    .line 157
    invoke-virtual {v1, v2}, Lcom/google/firebase/perf/session/SessionManager;->registerForSessionUpdates(Ljava/lang/ref/WeakReference;)V

    .line 158
    .line 159
    .line 160
    invoke-virtual {p0, v0}, Lcom/google/firebase/perf/metrics/Trace;->a(Lct0;)V

    .line 161
    .line 162
    .line 163
    iget-boolean v1, v0, Lct0;->l:Z

    .line 164
    .line 165
    if-eqz v1, :cond_9

    .line 166
    .line 167
    iget-object p0, p0, Lcom/google/firebase/perf/metrics/Trace;->l:Lcom/google/firebase/perf/session/gauges/GaugeManager;

    .line 168
    .line 169
    iget-object v0, v0, Lct0;->k:Loc1;

    .line 170
    .line 171
    invoke-virtual {p0, v0}, Lcom/google/firebase/perf/session/gauges/GaugeManager;->collectGaugeMetricOnce(Loc1;)V

    .line 172
    .line 173
    .line 174
    :cond_9
    return-void

    .line 175
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public stop()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/google/firebase/perf/metrics/Trace;->t:Loc1;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/google/firebase/perf/metrics/Trace;->m:Ljava/lang/String;

    .line 4
    .line 5
    sget-object v2, Lcom/google/firebase/perf/metrics/Trace;->v:Lg5;

    .line 6
    .line 7
    if-eqz v0, :cond_5

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/google/firebase/perf/metrics/Trace;->b()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    const-string p0, "Trace \'%s\' has already stopped, should not stop again!"

    .line 16
    .line 17
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v2, p0, v0}, Lg5;->b(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    invoke-static {}, Lcom/google/firebase/perf/session/SessionManager;->getInstance()Lcom/google/firebase/perf/session/SessionManager;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object v3, p0, Lcom/google/firebase/perf/metrics/Trace;->j:Ljava/lang/ref/WeakReference;

    .line 30
    .line 31
    invoke-virtual {v0, v3}, Lcom/google/firebase/perf/session/SessionManager;->unregisterForSessionUpdates(Ljava/lang/ref/WeakReference;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Ls9;->unregisterForAppState()V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/google/firebase/perf/metrics/Trace;->s:Lmz;

    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 40
    .line 41
    .line 42
    new-instance v0, Loc1;

    .line 43
    .line 44
    invoke-direct {v0}, Loc1;-><init>()V

    .line 45
    .line 46
    .line 47
    iput-object v0, p0, Lcom/google/firebase/perf/metrics/Trace;->u:Loc1;

    .line 48
    .line 49
    iget-object v3, p0, Lcom/google/firebase/perf/metrics/Trace;->k:Lcom/google/firebase/perf/metrics/Trace;

    .line 50
    .line 51
    if-nez v3, :cond_4

    .line 52
    .line 53
    iget-object v3, p0, Lcom/google/firebase/perf/metrics/Trace;->q:Ljava/util/ArrayList;

    .line 54
    .line 55
    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    .line 56
    .line 57
    .line 58
    move-result v4

    .line 59
    if-eqz v4, :cond_1

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_1
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 63
    .line 64
    .line 65
    move-result v4

    .line 66
    add-int/lit8 v4, v4, -0x1

    .line 67
    .line 68
    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v3

    .line 72
    check-cast v3, Lcom/google/firebase/perf/metrics/Trace;

    .line 73
    .line 74
    iget-object v4, v3, Lcom/google/firebase/perf/metrics/Trace;->u:Loc1;

    .line 75
    .line 76
    if-nez v4, :cond_2

    .line 77
    .line 78
    iput-object v0, v3, Lcom/google/firebase/perf/metrics/Trace;->u:Loc1;

    .line 79
    .line 80
    :cond_2
    :goto_0
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    if-nez v0, :cond_3

    .line 85
    .line 86
    new-instance v0, Lmd1;

    .line 87
    .line 88
    const/4 v1, 0x0

    .line 89
    invoke-direct {v0, v1, p0}, Lmd1;-><init>(ILjava/lang/Object;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {v0}, Lmd1;->c()Lld1;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-virtual {p0}, Ls9;->getAppState()Lx9;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    iget-object v2, p0, Lcom/google/firebase/perf/metrics/Trace;->r:Lvd1;

    .line 101
    .line 102
    invoke-virtual {v2, v0, v1}, Lvd1;->c(Lld1;Lx9;)V

    .line 103
    .line 104
    .line 105
    invoke-static {}, Lcom/google/firebase/perf/session/SessionManager;->getInstance()Lcom/google/firebase/perf/session/SessionManager;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    invoke-virtual {v0}, Lcom/google/firebase/perf/session/SessionManager;->perfSession()Lct0;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    iget-boolean v0, v0, Lct0;->l:Z

    .line 114
    .line 115
    if-eqz v0, :cond_4

    .line 116
    .line 117
    invoke-static {}, Lcom/google/firebase/perf/session/SessionManager;->getInstance()Lcom/google/firebase/perf/session/SessionManager;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    invoke-virtual {v0}, Lcom/google/firebase/perf/session/SessionManager;->perfSession()Lct0;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    iget-object v0, v0, Lct0;->k:Loc1;

    .line 126
    .line 127
    iget-object p0, p0, Lcom/google/firebase/perf/metrics/Trace;->l:Lcom/google/firebase/perf/session/gauges/GaugeManager;

    .line 128
    .line 129
    invoke-virtual {p0, v0}, Lcom/google/firebase/perf/session/gauges/GaugeManager;->collectGaugeMetricOnce(Loc1;)V

    .line 130
    .line 131
    .line 132
    return-void

    .line 133
    :cond_3
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 134
    .line 135
    .line 136
    :cond_4
    return-void

    .line 137
    :cond_5
    const-string p0, "Trace \'%s\' has not been started so unable to stop!"

    .line 138
    .line 139
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    invoke-virtual {v2, p0, v0}, Lg5;->b(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 144
    .line 145
    .line 146
    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1

    .line 1
    iget-object p2, p0, Lcom/google/firebase/perf/metrics/Trace;->k:Lcom/google/firebase/perf/metrics/Trace;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p1, p2, v0}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 5
    .line 6
    .line 7
    iget-object p2, p0, Lcom/google/firebase/perf/metrics/Trace;->m:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object p2, p0, Lcom/google/firebase/perf/metrics/Trace;->q:Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeList(Ljava/util/List;)V

    .line 15
    .line 16
    .line 17
    iget-object p2, p0, Lcom/google/firebase/perf/metrics/Trace;->n:Ljava/util/concurrent/ConcurrentHashMap;

    .line 18
    .line 19
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeMap(Ljava/util/Map;)V

    .line 20
    .line 21
    .line 22
    iget-object p2, p0, Lcom/google/firebase/perf/metrics/Trace;->t:Loc1;

    .line 23
    .line 24
    invoke-virtual {p1, p2, v0}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 25
    .line 26
    .line 27
    iget-object p2, p0, Lcom/google/firebase/perf/metrics/Trace;->u:Loc1;

    .line 28
    .line 29
    invoke-virtual {p1, p2, v0}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 30
    .line 31
    .line 32
    iget-object p2, p0, Lcom/google/firebase/perf/metrics/Trace;->p:Ljava/util/List;

    .line 33
    .line 34
    monitor-enter p2

    .line 35
    :try_start_0
    iget-object p0, p0, Lcom/google/firebase/perf/metrics/Trace;->p:Ljava/util/List;

    .line 36
    .line 37
    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeList(Ljava/util/List;)V

    .line 38
    .line 39
    .line 40
    monitor-exit p2

    .line 41
    return-void

    .line 42
    :catchall_0
    move-exception p0

    .line 43
    monitor-exit p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 44
    throw p0
.end method
