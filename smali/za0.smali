.class public final Lza0;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Landroid/os/Handler$Callback;


# static fields
.field public static final o:Lcom/google/android/gms/common/api/Status;

.field public static final p:Lcom/google/android/gms/common/api/Status;

.field public static final q:Ljava/lang/Object;

.field public static r:Lza0;


# instance fields
.field public a:J

.field public b:Z

.field public c:Lsb1;

.field public d:Lpm1;

.field public final e:Landroid/content/Context;

.field public final f:Lva0;

.field public final g:Lmd1;

.field public final h:Ljava/util/concurrent/atomic/AtomicInteger;

.field public final i:Ljava/util/concurrent/atomic/AtomicInteger;

.field public final j:Ljava/util/concurrent/ConcurrentHashMap;

.field public final k:Lha;

.field public final l:Lha;

.field public final m:Lum1;

.field public volatile n:Z


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lcom/google/android/gms/common/api/Status;

    .line 2
    .line 3
    const/4 v1, 0x4

    .line 4
    const-string v2, "Sign-out occurred while this API call was in progress."

    .line 5
    .line 6
    const/4 v3, 0x0

    .line 7
    invoke-direct {v0, v1, v2, v3, v3}, Lcom/google/android/gms/common/api/Status;-><init>(ILjava/lang/String;Landroid/app/PendingIntent;Loo;)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lza0;->o:Lcom/google/android/gms/common/api/Status;

    .line 11
    .line 12
    new-instance v0, Lcom/google/android/gms/common/api/Status;

    .line 13
    .line 14
    const-string v2, "The user must be signed in to make this API call."

    .line 15
    .line 16
    invoke-direct {v0, v1, v2, v3, v3}, Lcom/google/android/gms/common/api/Status;-><init>(ILjava/lang/String;Landroid/app/PendingIntent;Loo;)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Lza0;->p:Lcom/google/android/gms/common/api/Status;

    .line 20
    .line 21
    new-instance v0, Ljava/lang/Object;

    .line 22
    .line 23
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 24
    .line 25
    .line 26
    sput-object v0, Lza0;->q:Ljava/lang/Object;

    .line 27
    .line 28
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/os/Looper;)V
    .locals 6

    .line 1
    sget-object v0, Lva0;->d:Lva0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const-wide/16 v1, 0x2710

    .line 7
    .line 8
    iput-wide v1, p0, Lza0;->a:J

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    iput-boolean v1, p0, Lza0;->b:Z

    .line 12
    .line 13
    new-instance v2, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    invoke-direct {v2, v3}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 17
    .line 18
    .line 19
    iput-object v2, p0, Lza0;->h:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 20
    .line 21
    new-instance v2, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 22
    .line 23
    invoke-direct {v2, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 24
    .line 25
    .line 26
    iput-object v2, p0, Lza0;->i:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 27
    .line 28
    new-instance v2, Ljava/util/concurrent/ConcurrentHashMap;

    .line 29
    .line 30
    const/high16 v4, 0x3f400000    # 0.75f

    .line 31
    .line 32
    const/4 v5, 0x5

    .line 33
    invoke-direct {v2, v5, v4, v3}, Ljava/util/concurrent/ConcurrentHashMap;-><init>(IFI)V

    .line 34
    .line 35
    .line 36
    iput-object v2, p0, Lza0;->j:Ljava/util/concurrent/ConcurrentHashMap;

    .line 37
    .line 38
    new-instance v2, Lha;

    .line 39
    .line 40
    invoke-direct {v2, v1}, Lha;-><init>(I)V

    .line 41
    .line 42
    .line 43
    iput-object v2, p0, Lza0;->k:Lha;

    .line 44
    .line 45
    new-instance v2, Lha;

    .line 46
    .line 47
    invoke-direct {v2, v1}, Lha;-><init>(I)V

    .line 48
    .line 49
    .line 50
    iput-object v2, p0, Lza0;->l:Lha;

    .line 51
    .line 52
    iput-boolean v3, p0, Lza0;->n:Z

    .line 53
    .line 54
    iput-object p1, p0, Lza0;->e:Landroid/content/Context;

    .line 55
    .line 56
    new-instance v2, Lum1;

    .line 57
    .line 58
    invoke-direct {v2, p2, p0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;Landroid/os/Handler$Callback;)V

    .line 59
    .line 60
    .line 61
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 62
    .line 63
    .line 64
    iput-object v2, p0, Lza0;->m:Lum1;

    .line 65
    .line 66
    iput-object v0, p0, Lza0;->f:Lva0;

    .line 67
    .line 68
    new-instance p2, Lmd1;

    .line 69
    .line 70
    invoke-direct {p2, v5}, Lmd1;-><init>(I)V

    .line 71
    .line 72
    .line 73
    iput-object p2, p0, Lza0;->g:Lmd1;

    .line 74
    .line 75
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    sget-object p2, Lk42;->s:Ljava/lang/Boolean;

    .line 80
    .line 81
    if-nez p2, :cond_1

    .line 82
    .line 83
    invoke-static {}, Lbe2;->q()Z

    .line 84
    .line 85
    .line 86
    move-result p2

    .line 87
    if-eqz p2, :cond_0

    .line 88
    .line 89
    const-string p2, "android.hardware.type.automotive"

    .line 90
    .line 91
    invoke-virtual {p1, p2}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    .line 92
    .line 93
    .line 94
    move-result p1

    .line 95
    if-eqz p1, :cond_0

    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_0
    move v3, v1

    .line 99
    :goto_0
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 100
    .line 101
    .line 102
    move-result-object p2

    .line 103
    sput-object p2, Lk42;->s:Ljava/lang/Boolean;

    .line 104
    .line 105
    :cond_1
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 106
    .line 107
    .line 108
    move-result p1

    .line 109
    if-eqz p1, :cond_2

    .line 110
    .line 111
    iput-boolean v1, p0, Lza0;->n:Z

    .line 112
    .line 113
    :cond_2
    const/4 p0, 0x6

    .line 114
    invoke-virtual {v2, p0}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    invoke-virtual {v2, p0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 119
    .line 120
    .line 121
    return-void
.end method

.method public static c(Lb6;Loo;)Lcom/google/android/gms/common/api/Status;
    .locals 4

    .line 1
    new-instance v0, Lcom/google/android/gms/common/api/Status;

    .line 2
    .line 3
    iget-object p0, p0, Lb6;->b:Ls7;

    .line 4
    .line 5
    iget-object p0, p0, Ls7;->l:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p0, Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    new-instance v2, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    const-string v3, "API: "

    .line 16
    .line 17
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string p0, " is not available on this device. Connection failed with: "

    .line 24
    .line 25
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    const/16 v1, 0x11

    .line 36
    .line 37
    iget-object v2, p1, Loo;->l:Landroid/app/PendingIntent;

    .line 38
    .line 39
    invoke-direct {v0, v1, p0, v2, p1}, Lcom/google/android/gms/common/api/Status;-><init>(ILjava/lang/String;Landroid/app/PendingIntent;Loo;)V

    .line 40
    .line 41
    .line 42
    return-object v0
.end method

.method public static e(Landroid/content/Context;)Lza0;
    .locals 5

    .line 1
    sget-object v0, Lza0;->q:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Lza0;->r:Lza0;

    .line 5
    .line 6
    if-nez v1, :cond_1

    .line 7
    .line 8
    sget-object v1, Lmb2;->g:Ljava/lang/Object;

    .line 9
    .line 10
    monitor-enter v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 11
    :try_start_1
    sget-object v2, Lmb2;->i:Landroid/os/HandlerThread;

    .line 12
    .line 13
    if-eqz v2, :cond_0

    .line 14
    .line 15
    monitor-exit v1

    .line 16
    goto :goto_0

    .line 17
    :catchall_0
    move-exception p0

    .line 18
    goto :goto_1

    .line 19
    :cond_0
    new-instance v2, Landroid/os/HandlerThread;

    .line 20
    .line 21
    const-string v3, "GoogleApiHandler"

    .line 22
    .line 23
    const/16 v4, 0x9

    .line 24
    .line 25
    invoke-direct {v2, v3, v4}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;I)V

    .line 26
    .line 27
    .line 28
    sput-object v2, Lmb2;->i:Landroid/os/HandlerThread;

    .line 29
    .line 30
    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    .line 31
    .line 32
    .line 33
    sget-object v2, Lmb2;->i:Landroid/os/HandlerThread;

    .line 34
    .line 35
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 36
    :goto_0
    :try_start_2
    invoke-virtual {v2}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    new-instance v2, Lza0;

    .line 41
    .line 42
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    sget-object v3, Lva0;->c:Ljava/lang/Object;

    .line 47
    .line 48
    invoke-direct {v2, p0, v1}, Lza0;-><init>(Landroid/content/Context;Landroid/os/Looper;)V

    .line 49
    .line 50
    .line 51
    sput-object v2, Lza0;->r:Lza0;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 52
    .line 53
    move-object v1, v2

    .line 54
    goto :goto_2

    .line 55
    :catchall_1
    move-exception p0

    .line 56
    goto :goto_3

    .line 57
    :goto_1
    :try_start_3
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 58
    :try_start_4
    throw p0

    .line 59
    :cond_1
    :goto_2
    monitor-exit v0

    .line 60
    return-object v1

    .line 61
    :goto_3
    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 62
    throw p0
.end method


# virtual methods
.method public final a()Z
    .locals 2

    .line 1
    iget-boolean v0, p0, Lza0;->b:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-static {}, Lt11;->n()Lt11;

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lza0;->g:Lmd1;

    .line 10
    .line 11
    iget-object p0, p0, Lmd1;->k:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast p0, Landroid/util/SparseIntArray;

    .line 14
    .line 15
    const v0, 0xc1fa340

    .line 16
    .line 17
    .line 18
    const/4 v1, -0x1

    .line 19
    invoke-virtual {p0, v0, v1}, Landroid/util/SparseIntArray;->get(II)I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eq p0, v1, :cond_2

    .line 24
    .line 25
    if-nez p0, :cond_1

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 29
    return p0

    .line 30
    :cond_2
    :goto_1
    const/4 p0, 0x1

    .line 31
    return p0
.end method

.method public final b(Loo;I)Z
    .locals 6

    .line 1
    iget-object v0, p0, Lza0;->f:Lva0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lza0;->e:Landroid/content/Context;

    .line 7
    .line 8
    invoke-static {p0}, Lqe0;->j(Landroid/content/Context;)Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    const/4 v2, 0x0

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    goto :goto_2

    .line 16
    :cond_0
    iget v1, p1, Loo;->k:I

    .line 17
    .line 18
    iget-object p1, p1, Loo;->l:Landroid/app/PendingIntent;

    .line 19
    .line 20
    const/4 v3, 0x1

    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    if-eqz p1, :cond_1

    .line 24
    .line 25
    move v4, v3

    .line 26
    goto :goto_0

    .line 27
    :cond_1
    move v4, v2

    .line 28
    :goto_0
    if-eqz v4, :cond_2

    .line 29
    .line 30
    goto :goto_1

    .line 31
    :cond_2
    const/4 p1, 0x0

    .line 32
    invoke-virtual {v0, v1, p0, p1}, Lwa0;->a(ILandroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 33
    .line 34
    .line 35
    move-result-object v4

    .line 36
    if-nez v4, :cond_3

    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_3
    const/high16 p1, 0xc000000

    .line 40
    .line 41
    invoke-static {p0, v2, v4, p1}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    :goto_1
    if-eqz p1, :cond_4

    .line 46
    .line 47
    sget v4, Lcom/google/android/gms/common/api/GoogleApiActivity;->k:I

    .line 48
    .line 49
    new-instance v4, Landroid/content/Intent;

    .line 50
    .line 51
    const-class v5, Lcom/google/android/gms/common/api/GoogleApiActivity;

    .line 52
    .line 53
    invoke-direct {v4, p0, v5}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 54
    .line 55
    .line 56
    const-string v5, "pending_intent"

    .line 57
    .line 58
    invoke-virtual {v4, v5, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 59
    .line 60
    .line 61
    const-string p1, "failing_client_id"

    .line 62
    .line 63
    invoke-virtual {v4, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 64
    .line 65
    .line 66
    const-string p1, "notify_manager"

    .line 67
    .line 68
    invoke-virtual {v4, p1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 69
    .line 70
    .line 71
    sget p1, Lrm1;->a:I

    .line 72
    .line 73
    const/high16 p2, 0x8000000

    .line 74
    .line 75
    or-int/2addr p1, p2

    .line 76
    invoke-static {p0, v2, v4, p1}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    invoke-virtual {v0, p0, v1, p1}, Lva0;->f(Landroid/content/Context;ILandroid/app/PendingIntent;)V

    .line 81
    .line 82
    .line 83
    return v3

    .line 84
    :cond_4
    :goto_2
    return v2
.end method

.method public final d(Lua0;)Lml1;
    .locals 3

    .line 1
    iget-object v0, p1, Lua0;->e:Lb6;

    .line 2
    .line 3
    iget-object v1, p0, Lza0;->j:Ljava/util/concurrent/ConcurrentHashMap;

    .line 4
    .line 5
    invoke-virtual {v1, v0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    check-cast v2, Lml1;

    .line 10
    .line 11
    if-nez v2, :cond_0

    .line 12
    .line 13
    new-instance v2, Lml1;

    .line 14
    .line 15
    invoke-direct {v2, p0, p1}, Lml1;-><init>(Lza0;Lua0;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1, v0, v2}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    :cond_0
    iget-object p1, v2, Lml1;->c:Lu5;

    .line 22
    .line 23
    invoke-interface {p1}, Lu5;->j()Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-eqz p1, :cond_1

    .line 28
    .line 29
    iget-object p0, p0, Lza0;->l:Lha;

    .line 30
    .line 31
    invoke-virtual {p0, v0}, Lha;->add(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    :cond_1
    invoke-virtual {v2}, Lml1;->m()V

    .line 35
    .line 36
    .line 37
    return-object v2
.end method

.method public final f(Loo;I)V
    .locals 2

    .line 1
    invoke-virtual {p0, p1, p2}, Lza0;->b(Loo;I)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x5

    .line 8
    const/4 v1, 0x0

    .line 9
    iget-object p0, p0, Lza0;->m:Lum1;

    .line 10
    .line 11
    invoke-virtual {p0, v0, p2, v1, p1}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public final handleMessage(Landroid/os/Message;)Z
    .locals 12

    .line 1
    iget v0, p1, Landroid/os/Message;->what:I

    .line 2
    .line 3
    sget-object v1, Lpm1;->j:Ls7;

    .line 4
    .line 5
    sget-object v2, Ltb1;->c:Ltb1;

    .line 6
    .line 7
    const-wide/32 v3, 0x493e0

    .line 8
    .line 9
    .line 10
    iget-object v5, p0, Lza0;->e:Landroid/content/Context;

    .line 11
    .line 12
    const/16 v6, 0x11

    .line 13
    .line 14
    iget-object v7, p0, Lza0;->m:Lum1;

    .line 15
    .line 16
    const/4 v8, 0x0

    .line 17
    const/4 v9, 0x0

    .line 18
    const/4 v10, 0x1

    .line 19
    iget-object v11, p0, Lza0;->j:Ljava/util/concurrent/ConcurrentHashMap;

    .line 20
    .line 21
    packed-switch v0, :pswitch_data_0

    .line 22
    .line 23
    .line 24
    return v8

    .line 25
    :pswitch_0
    iput-boolean v8, p0, Lza0;->b:Z

    .line 26
    .line 27
    return v10

    .line 28
    :pswitch_1
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 29
    .line 30
    check-cast p1, Lwl1;

    .line 31
    .line 32
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 33
    .line 34
    .line 35
    const-wide/16 v3, 0x0

    .line 36
    .line 37
    cmp-long p1, v3, v3

    .line 38
    .line 39
    if-nez p1, :cond_1

    .line 40
    .line 41
    new-instance p1, Lsb1;

    .line 42
    .line 43
    filled-new-array {v9}, [Lco0;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-direct {p1, v8, v0}, Lsb1;-><init>(ILjava/util/List;)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Lza0;->d:Lpm1;

    .line 55
    .line 56
    if-nez v0, :cond_0

    .line 57
    .line 58
    new-instance v0, Lpm1;

    .line 59
    .line 60
    sget-object v3, Lta0;->c:Lta0;

    .line 61
    .line 62
    invoke-direct {v0, v5, v1, v2, v3}, Lua0;-><init>(Landroid/content/Context;Ls7;Lt5;Lta0;)V

    .line 63
    .line 64
    .line 65
    iput-object v0, p0, Lza0;->d:Lpm1;

    .line 66
    .line 67
    :cond_0
    invoke-virtual {v0, p1}, Lpm1;->c(Lsb1;)Ljd2;

    .line 68
    .line 69
    .line 70
    return v10

    .line 71
    :cond_1
    iget-object p1, p0, Lza0;->c:Lsb1;

    .line 72
    .line 73
    if-eqz p1, :cond_8

    .line 74
    .line 75
    iget-object v0, p1, Lsb1;->k:Ljava/util/List;

    .line 76
    .line 77
    iget p1, p1, Lsb1;->j:I

    .line 78
    .line 79
    if-nez p1, :cond_4

    .line 80
    .line 81
    if-eqz v0, :cond_2

    .line 82
    .line 83
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 84
    .line 85
    .line 86
    move-result p1

    .line 87
    if-ltz p1, :cond_2

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_2
    iget-object p1, p0, Lza0;->c:Lsb1;

    .line 91
    .line 92
    iget-object v0, p1, Lsb1;->k:Ljava/util/List;

    .line 93
    .line 94
    if-nez v0, :cond_3

    .line 95
    .line 96
    new-instance v0, Ljava/util/ArrayList;

    .line 97
    .line 98
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 99
    .line 100
    .line 101
    iput-object v0, p1, Lsb1;->k:Ljava/util/List;

    .line 102
    .line 103
    :cond_3
    invoke-interface {v0, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    goto :goto_1

    .line 107
    :cond_4
    :goto_0
    invoke-virtual {v7, v6}, Landroid/os/Handler;->removeMessages(I)V

    .line 108
    .line 109
    .line 110
    iget-object p1, p0, Lza0;->c:Lsb1;

    .line 111
    .line 112
    if-eqz p1, :cond_8

    .line 113
    .line 114
    iget v0, p1, Lsb1;->j:I

    .line 115
    .line 116
    if-gtz v0, :cond_5

    .line 117
    .line 118
    invoke-virtual {p0}, Lza0;->a()Z

    .line 119
    .line 120
    .line 121
    move-result v0

    .line 122
    if-eqz v0, :cond_7

    .line 123
    .line 124
    :cond_5
    iget-object v0, p0, Lza0;->d:Lpm1;

    .line 125
    .line 126
    if-nez v0, :cond_6

    .line 127
    .line 128
    new-instance v0, Lpm1;

    .line 129
    .line 130
    sget-object v11, Lta0;->c:Lta0;

    .line 131
    .line 132
    invoke-direct {v0, v5, v1, v2, v11}, Lua0;-><init>(Landroid/content/Context;Ls7;Lt5;Lta0;)V

    .line 133
    .line 134
    .line 135
    iput-object v0, p0, Lza0;->d:Lpm1;

    .line 136
    .line 137
    :cond_6
    invoke-virtual {v0, p1}, Lpm1;->c(Lsb1;)Ljd2;

    .line 138
    .line 139
    .line 140
    :cond_7
    iput-object v9, p0, Lza0;->c:Lsb1;

    .line 141
    .line 142
    :cond_8
    :goto_1
    iget-object p1, p0, Lza0;->c:Lsb1;

    .line 143
    .line 144
    if-nez p1, :cond_24

    .line 145
    .line 146
    new-instance p1, Ljava/util/ArrayList;

    .line 147
    .line 148
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 149
    .line 150
    .line 151
    invoke-virtual {p1, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 152
    .line 153
    .line 154
    new-instance v0, Lsb1;

    .line 155
    .line 156
    invoke-direct {v0, v8, p1}, Lsb1;-><init>(ILjava/util/List;)V

    .line 157
    .line 158
    .line 159
    iput-object v0, p0, Lza0;->c:Lsb1;

    .line 160
    .line 161
    invoke-virtual {v7, v6}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    .line 162
    .line 163
    .line 164
    move-result-object p0

    .line 165
    invoke-virtual {v7, p0, v3, v4}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 166
    .line 167
    .line 168
    return v10

    .line 169
    :pswitch_2
    iget-object p1, p0, Lza0;->c:Lsb1;

    .line 170
    .line 171
    if-eqz p1, :cond_24

    .line 172
    .line 173
    iget v0, p1, Lsb1;->j:I

    .line 174
    .line 175
    if-gtz v0, :cond_9

    .line 176
    .line 177
    invoke-virtual {p0}, Lza0;->a()Z

    .line 178
    .line 179
    .line 180
    move-result v0

    .line 181
    if-eqz v0, :cond_b

    .line 182
    .line 183
    :cond_9
    iget-object v0, p0, Lza0;->d:Lpm1;

    .line 184
    .line 185
    if-nez v0, :cond_a

    .line 186
    .line 187
    new-instance v0, Lpm1;

    .line 188
    .line 189
    sget-object v3, Lta0;->c:Lta0;

    .line 190
    .line 191
    invoke-direct {v0, v5, v1, v2, v3}, Lua0;-><init>(Landroid/content/Context;Ls7;Lt5;Lta0;)V

    .line 192
    .line 193
    .line 194
    iput-object v0, p0, Lza0;->d:Lpm1;

    .line 195
    .line 196
    :cond_a
    invoke-virtual {v0, p1}, Lpm1;->c(Lsb1;)Ljd2;

    .line 197
    .line 198
    .line 199
    :cond_b
    iput-object v9, p0, Lza0;->c:Lsb1;

    .line 200
    .line 201
    return v10

    .line 202
    :pswitch_3
    iget-object p0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 203
    .line 204
    check-cast p0, Lnl1;

    .line 205
    .line 206
    iget-object p1, p0, Lnl1;->a:Lb6;

    .line 207
    .line 208
    invoke-virtual {v11, p1}, Ljava/util/concurrent/ConcurrentHashMap;->containsKey(Ljava/lang/Object;)Z

    .line 209
    .line 210
    .line 211
    move-result p1

    .line 212
    if-eqz p1, :cond_24

    .line 213
    .line 214
    iget-object p1, p0, Lnl1;->a:Lb6;

    .line 215
    .line 216
    invoke-virtual {v11, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 217
    .line 218
    .line 219
    move-result-object p1

    .line 220
    check-cast p1, Lml1;

    .line 221
    .line 222
    iget-object v0, p1, Lml1;->k:Ljava/util/ArrayList;

    .line 223
    .line 224
    iget-object v1, p1, Lml1;->m:Lza0;

    .line 225
    .line 226
    iget-object v1, v1, Lza0;->m:Lum1;

    .line 227
    .line 228
    iget-object v2, p1, Lml1;->b:Ljava/util/LinkedList;

    .line 229
    .line 230
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 231
    .line 232
    .line 233
    move-result v0

    .line 234
    if-eqz v0, :cond_24

    .line 235
    .line 236
    const/16 v0, 0xf

    .line 237
    .line 238
    invoke-virtual {v1, v0, p0}, Landroid/os/Handler;->removeMessages(ILjava/lang/Object;)V

    .line 239
    .line 240
    .line 241
    const/16 v0, 0x10

    .line 242
    .line 243
    invoke-virtual {v1, v0, p0}, Landroid/os/Handler;->removeMessages(ILjava/lang/Object;)V

    .line 244
    .line 245
    .line 246
    iget-object p0, p0, Lnl1;->b:Lu20;

    .line 247
    .line 248
    new-instance v0, Ljava/util/ArrayList;

    .line 249
    .line 250
    invoke-virtual {v2}, Ljava/util/LinkedList;->size()I

    .line 251
    .line 252
    .line 253
    move-result v1

    .line 254
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 255
    .line 256
    .line 257
    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 258
    .line 259
    .line 260
    move-result-object v1

    .line 261
    :cond_c
    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 262
    .line 263
    .line 264
    move-result v3

    .line 265
    if-eqz v3, :cond_e

    .line 266
    .line 267
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 268
    .line 269
    .line 270
    move-result-object v3

    .line 271
    check-cast v3, Lul1;

    .line 272
    .line 273
    if-eqz v3, :cond_c

    .line 274
    .line 275
    invoke-virtual {v3, p1}, Lul1;->b(Lml1;)[Lu20;

    .line 276
    .line 277
    .line 278
    move-result-object v4

    .line 279
    if-eqz v4, :cond_c

    .line 280
    .line 281
    array-length v5, v4

    .line 282
    move v6, v8

    .line 283
    :goto_3
    if-ge v6, v5, :cond_c

    .line 284
    .line 285
    aget-object v7, v4, v6

    .line 286
    .line 287
    invoke-static {v7, p0}, Lkp1;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 288
    .line 289
    .line 290
    move-result v7

    .line 291
    if-eqz v7, :cond_d

    .line 292
    .line 293
    if-ltz v6, :cond_c

    .line 294
    .line 295
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 296
    .line 297
    .line 298
    goto :goto_2

    .line 299
    :cond_d
    add-int/lit8 v6, v6, 0x1

    .line 300
    .line 301
    goto :goto_3

    .line 302
    :cond_e
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 303
    .line 304
    .line 305
    move-result p1

    .line 306
    :goto_4
    if-ge v8, p1, :cond_24

    .line 307
    .line 308
    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 309
    .line 310
    .line 311
    move-result-object v1

    .line 312
    check-cast v1, Lul1;

    .line 313
    .line 314
    invoke-virtual {v2, v1}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    .line 315
    .line 316
    .line 317
    new-instance v3, Lof1;

    .line 318
    .line 319
    invoke-direct {v3, p0}, Lof1;-><init>(Lu20;)V

    .line 320
    .line 321
    .line 322
    invoke-virtual {v1, v3}, Lul1;->d(Ljava/lang/Exception;)V

    .line 323
    .line 324
    .line 325
    add-int/lit8 v8, v8, 0x1

    .line 326
    .line 327
    goto :goto_4

    .line 328
    :pswitch_4
    iget-object p0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 329
    .line 330
    check-cast p0, Lnl1;

    .line 331
    .line 332
    iget-object p1, p0, Lnl1;->a:Lb6;

    .line 333
    .line 334
    invoke-virtual {v11, p1}, Ljava/util/concurrent/ConcurrentHashMap;->containsKey(Ljava/lang/Object;)Z

    .line 335
    .line 336
    .line 337
    move-result p1

    .line 338
    if-eqz p1, :cond_24

    .line 339
    .line 340
    iget-object p1, p0, Lnl1;->a:Lb6;

    .line 341
    .line 342
    invoke-virtual {v11, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 343
    .line 344
    .line 345
    move-result-object p1

    .line 346
    check-cast p1, Lml1;

    .line 347
    .line 348
    iget-object v0, p1, Lml1;->k:Ljava/util/ArrayList;

    .line 349
    .line 350
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 351
    .line 352
    .line 353
    move-result p0

    .line 354
    if-nez p0, :cond_f

    .line 355
    .line 356
    goto/16 :goto_f

    .line 357
    .line 358
    :cond_f
    iget-boolean p0, p1, Lml1;->j:Z

    .line 359
    .line 360
    if-nez p0, :cond_24

    .line 361
    .line 362
    iget-object p0, p1, Lml1;->c:Lu5;

    .line 363
    .line 364
    invoke-interface {p0}, Lu5;->isConnected()Z

    .line 365
    .line 366
    .line 367
    move-result p0

    .line 368
    if-nez p0, :cond_10

    .line 369
    .line 370
    invoke-virtual {p1}, Lml1;->m()V

    .line 371
    .line 372
    .line 373
    return v10

    .line 374
    :cond_10
    invoke-virtual {p1}, Lml1;->g()V

    .line 375
    .line 376
    .line 377
    return v10

    .line 378
    :pswitch_5
    iget-object p0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 379
    .line 380
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 381
    .line 382
    .line 383
    invoke-static {}, Lz0;->a()V

    .line 384
    .line 385
    .line 386
    return v8

    .line 387
    :pswitch_6
    iget-object p0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 388
    .line 389
    invoke-virtual {v11, p0}, Ljava/util/concurrent/ConcurrentHashMap;->containsKey(Ljava/lang/Object;)Z

    .line 390
    .line 391
    .line 392
    move-result p0

    .line 393
    if-eqz p0, :cond_24

    .line 394
    .line 395
    iget-object p0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 396
    .line 397
    invoke-virtual {v11, p0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 398
    .line 399
    .line 400
    move-result-object p0

    .line 401
    check-cast p0, Lml1;

    .line 402
    .line 403
    iget-object p1, p0, Lml1;->m:Lza0;

    .line 404
    .line 405
    iget-object p1, p1, Lza0;->m:Lum1;

    .line 406
    .line 407
    invoke-static {p1}, Lbh;->d(Landroid/os/Handler;)V

    .line 408
    .line 409
    .line 410
    iget-object p1, p0, Lml1;->c:Lu5;

    .line 411
    .line 412
    invoke-interface {p1}, Lu5;->isConnected()Z

    .line 413
    .line 414
    .line 415
    move-result v0

    .line 416
    if-eqz v0, :cond_13

    .line 417
    .line 418
    iget-object v0, p0, Lml1;->g:Ljava/util/HashMap;

    .line 419
    .line 420
    invoke-virtual {v0}, Ljava/util/HashMap;->isEmpty()Z

    .line 421
    .line 422
    .line 423
    move-result v0

    .line 424
    if-eqz v0, :cond_13

    .line 425
    .line 426
    iget-object v0, p0, Lml1;->e:Lxn0;

    .line 427
    .line 428
    iget-object v1, v0, Lxn0;->l:Ljava/lang/Object;

    .line 429
    .line 430
    check-cast v1, Ljava/util/Map;

    .line 431
    .line 432
    invoke-interface {v1}, Ljava/util/Map;->isEmpty()Z

    .line 433
    .line 434
    .line 435
    move-result v1

    .line 436
    if-eqz v1, :cond_12

    .line 437
    .line 438
    iget-object v0, v0, Lxn0;->k:Ljava/lang/Object;

    .line 439
    .line 440
    check-cast v0, Ljava/util/Map;

    .line 441
    .line 442
    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    .line 443
    .line 444
    .line 445
    move-result v0

    .line 446
    if-nez v0, :cond_11

    .line 447
    .line 448
    goto :goto_5

    .line 449
    :cond_11
    const-string p0, "Timing out service connection."

    .line 450
    .line 451
    invoke-interface {p1, p0}, Lu5;->b(Ljava/lang/String;)V

    .line 452
    .line 453
    .line 454
    return v10

    .line 455
    :cond_12
    :goto_5
    invoke-virtual {p0}, Lml1;->j()V

    .line 456
    .line 457
    .line 458
    :cond_13
    return v10

    .line 459
    :pswitch_7
    iget-object p0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 460
    .line 461
    invoke-virtual {v11, p0}, Ljava/util/concurrent/ConcurrentHashMap;->containsKey(Ljava/lang/Object;)Z

    .line 462
    .line 463
    .line 464
    move-result p0

    .line 465
    if-eqz p0, :cond_24

    .line 466
    .line 467
    iget-object p0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 468
    .line 469
    invoke-virtual {v11, p0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 470
    .line 471
    .line 472
    move-result-object p0

    .line 473
    check-cast p0, Lml1;

    .line 474
    .line 475
    iget-object p1, p0, Lml1;->m:Lza0;

    .line 476
    .line 477
    iget-object v0, p1, Lza0;->m:Lum1;

    .line 478
    .line 479
    invoke-static {v0}, Lbh;->d(Landroid/os/Handler;)V

    .line 480
    .line 481
    .line 482
    iget-boolean v0, p0, Lml1;->j:Z

    .line 483
    .line 484
    if-eqz v0, :cond_24

    .line 485
    .line 486
    iget-object v1, p0, Lml1;->d:Lb6;

    .line 487
    .line 488
    iget-object v2, p0, Lml1;->m:Lza0;

    .line 489
    .line 490
    iget-object v2, v2, Lza0;->m:Lum1;

    .line 491
    .line 492
    if-eqz v0, :cond_14

    .line 493
    .line 494
    const/16 v0, 0xb

    .line 495
    .line 496
    invoke-virtual {v2, v0, v1}, Landroid/os/Handler;->removeMessages(ILjava/lang/Object;)V

    .line 497
    .line 498
    .line 499
    const/16 v0, 0x9

    .line 500
    .line 501
    invoke-virtual {v2, v0, v1}, Landroid/os/Handler;->removeMessages(ILjava/lang/Object;)V

    .line 502
    .line 503
    .line 504
    iput-boolean v8, p0, Lml1;->j:Z

    .line 505
    .line 506
    :cond_14
    iget-object v0, p1, Lza0;->f:Lva0;

    .line 507
    .line 508
    iget-object p1, p1, Lza0;->e:Landroid/content/Context;

    .line 509
    .line 510
    sget v1, Lwa0;->a:I

    .line 511
    .line 512
    invoke-virtual {v0, p1, v1}, Lwa0;->b(Landroid/content/Context;I)I

    .line 513
    .line 514
    .line 515
    move-result p1

    .line 516
    const/16 v0, 0x12

    .line 517
    .line 518
    if-ne p1, v0, :cond_15

    .line 519
    .line 520
    new-instance p1, Lcom/google/android/gms/common/api/Status;

    .line 521
    .line 522
    const/16 v0, 0x15

    .line 523
    .line 524
    const-string v1, "Connection timed out waiting for Google Play services update to complete."

    .line 525
    .line 526
    invoke-direct {p1, v0, v1, v9, v9}, Lcom/google/android/gms/common/api/Status;-><init>(ILjava/lang/String;Landroid/app/PendingIntent;Loo;)V

    .line 527
    .line 528
    .line 529
    goto :goto_6

    .line 530
    :cond_15
    new-instance p1, Lcom/google/android/gms/common/api/Status;

    .line 531
    .line 532
    const/16 v0, 0x16

    .line 533
    .line 534
    const-string v1, "API failed to connect while resuming due to an unknown error."

    .line 535
    .line 536
    invoke-direct {p1, v0, v1, v9, v9}, Lcom/google/android/gms/common/api/Status;-><init>(ILjava/lang/String;Landroid/app/PendingIntent;Loo;)V

    .line 537
    .line 538
    .line 539
    :goto_6
    invoke-virtual {p0, p1}, Lml1;->e(Lcom/google/android/gms/common/api/Status;)V

    .line 540
    .line 541
    .line 542
    iget-object p0, p0, Lml1;->c:Lu5;

    .line 543
    .line 544
    const-string p1, "Timing out connection while resuming."

    .line 545
    .line 546
    invoke-interface {p0, p1}, Lu5;->b(Ljava/lang/String;)V

    .line 547
    .line 548
    .line 549
    return v10

    .line 550
    :pswitch_8
    iget-object p0, p0, Lza0;->l:Lha;

    .line 551
    .line 552
    invoke-virtual {p0}, Lha;->iterator()Ljava/util/Iterator;

    .line 553
    .line 554
    .line 555
    move-result-object p1

    .line 556
    :cond_16
    :goto_7
    move-object v0, p1

    .line 557
    check-cast v0, Lgl0;

    .line 558
    .line 559
    invoke-virtual {v0}, Lgl0;->hasNext()Z

    .line 560
    .line 561
    .line 562
    move-result v1

    .line 563
    if-eqz v1, :cond_17

    .line 564
    .line 565
    invoke-virtual {v0}, Lgl0;->next()Ljava/lang/Object;

    .line 566
    .line 567
    .line 568
    move-result-object v0

    .line 569
    check-cast v0, Lb6;

    .line 570
    .line 571
    invoke-virtual {v11, v0}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 572
    .line 573
    .line 574
    move-result-object v0

    .line 575
    check-cast v0, Lml1;

    .line 576
    .line 577
    if-eqz v0, :cond_16

    .line 578
    .line 579
    invoke-virtual {v0}, Lml1;->q()V

    .line 580
    .line 581
    .line 582
    goto :goto_7

    .line 583
    :cond_17
    invoke-virtual {p0}, Lha;->clear()V

    .line 584
    .line 585
    .line 586
    return v10

    .line 587
    :pswitch_9
    iget-object p0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 588
    .line 589
    invoke-virtual {v11, p0}, Ljava/util/concurrent/ConcurrentHashMap;->containsKey(Ljava/lang/Object;)Z

    .line 590
    .line 591
    .line 592
    move-result p0

    .line 593
    if-eqz p0, :cond_24

    .line 594
    .line 595
    iget-object p0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 596
    .line 597
    invoke-virtual {v11, p0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 598
    .line 599
    .line 600
    move-result-object p0

    .line 601
    check-cast p0, Lml1;

    .line 602
    .line 603
    iget-object p1, p0, Lml1;->m:Lza0;

    .line 604
    .line 605
    iget-object p1, p1, Lza0;->m:Lum1;

    .line 606
    .line 607
    invoke-static {p1}, Lbh;->d(Landroid/os/Handler;)V

    .line 608
    .line 609
    .line 610
    iget-boolean p1, p0, Lml1;->j:Z

    .line 611
    .line 612
    if-eqz p1, :cond_24

    .line 613
    .line 614
    invoke-virtual {p0}, Lml1;->m()V

    .line 615
    .line 616
    .line 617
    return v10

    .line 618
    :pswitch_a
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 619
    .line 620
    check-cast p1, Lua0;

    .line 621
    .line 622
    invoke-virtual {p0, p1}, Lza0;->d(Lua0;)Lml1;

    .line 623
    .line 624
    .line 625
    return v10

    .line 626
    :pswitch_b
    invoke-virtual {v5}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 627
    .line 628
    .line 629
    move-result-object p1

    .line 630
    instance-of p1, p1, Landroid/app/Application;

    .line 631
    .line 632
    if-eqz p1, :cond_24

    .line 633
    .line 634
    invoke-virtual {v5}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 635
    .line 636
    .line 637
    move-result-object p1

    .line 638
    check-cast p1, Landroid/app/Application;

    .line 639
    .line 640
    invoke-static {p1}, Lyf;->b(Landroid/app/Application;)V

    .line 641
    .line 642
    .line 643
    sget-object p1, Lyf;->n:Lyf;

    .line 644
    .line 645
    new-instance v0, Lil1;

    .line 646
    .line 647
    invoke-direct {v0, p0}, Lil1;-><init>(Lza0;)V

    .line 648
    .line 649
    .line 650
    invoke-virtual {p1, v0}, Lyf;->a(Lxf;)V

    .line 651
    .line 652
    .line 653
    iget-object v0, p1, Lyf;->j:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 654
    .line 655
    iget-object p1, p1, Lyf;->k:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 656
    .line 657
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 658
    .line 659
    .line 660
    move-result v1

    .line 661
    if-nez v1, :cond_1c

    .line 662
    .line 663
    sget-object v1, Les0;->g:Ljava/lang/Boolean;

    .line 664
    .line 665
    if-nez v1, :cond_1a

    .line 666
    .line 667
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 668
    .line 669
    const/16 v2, 0x1c

    .line 670
    .line 671
    if-lt v1, v2, :cond_18

    .line 672
    .line 673
    invoke-static {}, Ld1;->w()Z

    .line 674
    .line 675
    .line 676
    move-result v1

    .line 677
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 678
    .line 679
    .line 680
    move-result-object v1

    .line 681
    goto :goto_8

    .line 682
    :cond_18
    :try_start_0
    const-class v1, Landroid/os/Process;

    .line 683
    .line 684
    const-string v2, "isIsolated"

    .line 685
    .line 686
    invoke-virtual {v1, v2, v9}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 687
    .line 688
    .line 689
    move-result-object v1

    .line 690
    invoke-virtual {v1, v9, v9}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 691
    .line 692
    .line 693
    move-result-object v1

    .line 694
    new-array v2, v8, [Ljava/lang/Object;

    .line 695
    .line 696
    const-string v5, "expected a non-null reference"

    .line 697
    .line 698
    if-eqz v1, :cond_19

    .line 699
    .line 700
    check-cast v1, Ljava/lang/Boolean;

    .line 701
    .line 702
    goto :goto_8

    .line 703
    :cond_19
    new-instance v1, Lrl;

    .line 704
    .line 705
    invoke-static {v5, v2}, Lkn1;->q(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 706
    .line 707
    .line 708
    move-result-object v2

    .line 709
    const/16 v5, 0x8

    .line 710
    .line 711
    invoke-direct {v1, v2, v5}, Lrl;-><init>(Ljava/lang/String;I)V

    .line 712
    .line 713
    .line 714
    throw v1
    :try_end_0
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_0 .. :try_end_0} :catch_0

    .line 715
    :catch_0
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 716
    .line 717
    :goto_8
    sput-object v1, Les0;->g:Ljava/lang/Boolean;

    .line 718
    .line 719
    :cond_1a
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 720
    .line 721
    .line 722
    move-result v1

    .line 723
    if-nez v1, :cond_1b

    .line 724
    .line 725
    new-instance v1, Landroid/app/ActivityManager$RunningAppProcessInfo;

    .line 726
    .line 727
    invoke-direct {v1}, Landroid/app/ActivityManager$RunningAppProcessInfo;-><init>()V

    .line 728
    .line 729
    .line 730
    invoke-static {v1}, Landroid/app/ActivityManager;->getMyMemoryState(Landroid/app/ActivityManager$RunningAppProcessInfo;)V

    .line 731
    .line 732
    .line 733
    invoke-virtual {p1, v10}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    .line 734
    .line 735
    .line 736
    move-result p1

    .line 737
    if-nez p1, :cond_1c

    .line 738
    .line 739
    iget p1, v1, Landroid/app/ActivityManager$RunningAppProcessInfo;->importance:I

    .line 740
    .line 741
    const/16 v1, 0x64

    .line 742
    .line 743
    if-le p1, v1, :cond_1c

    .line 744
    .line 745
    invoke-virtual {v0, v10}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 746
    .line 747
    .line 748
    goto :goto_9

    .line 749
    :cond_1b
    move p1, v10

    .line 750
    goto :goto_a

    .line 751
    :cond_1c
    :goto_9
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 752
    .line 753
    .line 754
    move-result p1

    .line 755
    :goto_a
    if-nez p1, :cond_24

    .line 756
    .line 757
    iput-wide v3, p0, Lza0;->a:J

    .line 758
    .line 759
    goto/16 :goto_f

    .line 760
    .line 761
    :pswitch_c
    iget v0, p1, Landroid/os/Message;->arg1:I

    .line 762
    .line 763
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 764
    .line 765
    check-cast p1, Loo;

    .line 766
    .line 767
    invoke-virtual {v11}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    .line 768
    .line 769
    .line 770
    move-result-object v1

    .line 771
    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 772
    .line 773
    .line 774
    move-result-object v1

    .line 775
    :cond_1d
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 776
    .line 777
    .line 778
    move-result v2

    .line 779
    if-eqz v2, :cond_1e

    .line 780
    .line 781
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 782
    .line 783
    .line 784
    move-result-object v2

    .line 785
    check-cast v2, Lml1;

    .line 786
    .line 787
    iget v3, v2, Lml1;->h:I

    .line 788
    .line 789
    if-ne v3, v0, :cond_1d

    .line 790
    .line 791
    goto :goto_b

    .line 792
    :cond_1e
    move-object v2, v9

    .line 793
    :goto_b
    if-eqz v2, :cond_20

    .line 794
    .line 795
    iget v0, p1, Loo;->k:I

    .line 796
    .line 797
    const/16 v1, 0xd

    .line 798
    .line 799
    if-ne v0, v1, :cond_1f

    .line 800
    .line 801
    new-instance v1, Lcom/google/android/gms/common/api/Status;

    .line 802
    .line 803
    iget-object p0, p0, Lza0;->f:Lva0;

    .line 804
    .line 805
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 806
    .line 807
    .line 808
    sget p0, Lbb0;->e:I

    .line 809
    .line 810
    invoke-static {v0}, Loo;->b(I)Ljava/lang/String;

    .line 811
    .line 812
    .line 813
    move-result-object p0

    .line 814
    iget-object p1, p1, Loo;->m:Ljava/lang/String;

    .line 815
    .line 816
    new-instance v0, Ljava/lang/StringBuilder;

    .line 817
    .line 818
    const-string v3, "Error resolution was canceled by the user, original error message: "

    .line 819
    .line 820
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 821
    .line 822
    .line 823
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 824
    .line 825
    .line 826
    const-string p0, ": "

    .line 827
    .line 828
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 829
    .line 830
    .line 831
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 832
    .line 833
    .line 834
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 835
    .line 836
    .line 837
    move-result-object p0

    .line 838
    invoke-direct {v1, v6, p0, v9, v9}, Lcom/google/android/gms/common/api/Status;-><init>(ILjava/lang/String;Landroid/app/PendingIntent;Loo;)V

    .line 839
    .line 840
    .line 841
    invoke-virtual {v2, v1}, Lml1;->e(Lcom/google/android/gms/common/api/Status;)V

    .line 842
    .line 843
    .line 844
    return v10

    .line 845
    :cond_1f
    iget-object p0, v2, Lml1;->d:Lb6;

    .line 846
    .line 847
    invoke-static {p0, p1}, Lza0;->c(Lb6;Loo;)Lcom/google/android/gms/common/api/Status;

    .line 848
    .line 849
    .line 850
    move-result-object p0

    .line 851
    invoke-virtual {v2, p0}, Lml1;->e(Lcom/google/android/gms/common/api/Status;)V

    .line 852
    .line 853
    .line 854
    return v10

    .line 855
    :cond_20
    const-string p0, "Could not find API instance "

    .line 856
    .line 857
    const-string p1, " while trying to fail enqueued calls."

    .line 858
    .line 859
    invoke-static {p0, p1, v0}, Loq;->i(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    .line 860
    .line 861
    .line 862
    move-result-object p0

    .line 863
    new-instance p1, Ljava/lang/Exception;

    .line 864
    .line 865
    invoke-direct {p1}, Ljava/lang/Exception;-><init>()V

    .line 866
    .line 867
    .line 868
    const-string v0, "GoogleApiManager"

    .line 869
    .line 870
    invoke-static {v0, p0, p1}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 871
    .line 872
    .line 873
    return v10

    .line 874
    :pswitch_d
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 875
    .line 876
    check-cast p1, Lxl1;

    .line 877
    .line 878
    iget-object v0, p1, Lxl1;->c:Lua0;

    .line 879
    .line 880
    iget-object v1, p1, Lxl1;->a:Lul1;

    .line 881
    .line 882
    iget-object v0, v0, Lua0;->e:Lb6;

    .line 883
    .line 884
    invoke-virtual {v11, v0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 885
    .line 886
    .line 887
    move-result-object v0

    .line 888
    check-cast v0, Lml1;

    .line 889
    .line 890
    if-nez v0, :cond_21

    .line 891
    .line 892
    iget-object v0, p1, Lxl1;->c:Lua0;

    .line 893
    .line 894
    invoke-virtual {p0, v0}, Lza0;->d(Lua0;)Lml1;

    .line 895
    .line 896
    .line 897
    move-result-object v0

    .line 898
    :cond_21
    iget-object v2, v0, Lml1;->c:Lu5;

    .line 899
    .line 900
    invoke-interface {v2}, Lu5;->j()Z

    .line 901
    .line 902
    .line 903
    move-result v2

    .line 904
    if-eqz v2, :cond_22

    .line 905
    .line 906
    iget-object p0, p0, Lza0;->i:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 907
    .line 908
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 909
    .line 910
    .line 911
    move-result p0

    .line 912
    iget p1, p1, Lxl1;->b:I

    .line 913
    .line 914
    if-eq p0, p1, :cond_22

    .line 915
    .line 916
    sget-object p0, Lza0;->o:Lcom/google/android/gms/common/api/Status;

    .line 917
    .line 918
    invoke-virtual {v1, p0}, Lul1;->c(Lcom/google/android/gms/common/api/Status;)V

    .line 919
    .line 920
    .line 921
    invoke-virtual {v0}, Lml1;->q()V

    .line 922
    .line 923
    .line 924
    return v10

    .line 925
    :cond_22
    invoke-virtual {v0, v1}, Lml1;->n(Lul1;)V

    .line 926
    .line 927
    .line 928
    return v10

    .line 929
    :pswitch_e
    invoke-virtual {v11}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    .line 930
    .line 931
    .line 932
    move-result-object p0

    .line 933
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 934
    .line 935
    .line 936
    move-result-object p0

    .line 937
    :goto_c
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 938
    .line 939
    .line 940
    move-result p1

    .line 941
    if-eqz p1, :cond_24

    .line 942
    .line 943
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 944
    .line 945
    .line 946
    move-result-object p1

    .line 947
    check-cast p1, Lml1;

    .line 948
    .line 949
    iget-object v0, p1, Lml1;->m:Lza0;

    .line 950
    .line 951
    iget-object v0, v0, Lza0;->m:Lum1;

    .line 952
    .line 953
    invoke-static {v0}, Lbh;->d(Landroid/os/Handler;)V

    .line 954
    .line 955
    .line 956
    iput-object v9, p1, Lml1;->l:Loo;

    .line 957
    .line 958
    invoke-virtual {p1}, Lml1;->m()V

    .line 959
    .line 960
    .line 961
    goto :goto_c

    .line 962
    :pswitch_f
    iget-object p0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 963
    .line 964
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 965
    .line 966
    .line 967
    invoke-static {}, Lz0;->a()V

    .line 968
    .line 969
    .line 970
    return v8

    .line 971
    :pswitch_10
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 972
    .line 973
    check-cast p1, Ljava/lang/Boolean;

    .line 974
    .line 975
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 976
    .line 977
    .line 978
    move-result p1

    .line 979
    if-eq v10, p1, :cond_23

    .line 980
    .line 981
    goto :goto_d

    .line 982
    :cond_23
    const-wide/16 v3, 0x2710

    .line 983
    .line 984
    :goto_d
    iput-wide v3, p0, Lza0;->a:J

    .line 985
    .line 986
    const/16 p1, 0xc

    .line 987
    .line 988
    invoke-virtual {v7, p1}, Landroid/os/Handler;->removeMessages(I)V

    .line 989
    .line 990
    .line 991
    invoke-virtual {v11}, Ljava/util/concurrent/ConcurrentHashMap;->keySet()Ljava/util/Set;

    .line 992
    .line 993
    .line 994
    move-result-object v0

    .line 995
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 996
    .line 997
    .line 998
    move-result-object v0

    .line 999
    :goto_e
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 1000
    .line 1001
    .line 1002
    move-result v1

    .line 1003
    if-eqz v1, :cond_24

    .line 1004
    .line 1005
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 1006
    .line 1007
    .line 1008
    move-result-object v1

    .line 1009
    check-cast v1, Lb6;

    .line 1010
    .line 1011
    invoke-virtual {v7, p1, v1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 1012
    .line 1013
    .line 1014
    move-result-object v1

    .line 1015
    iget-wide v2, p0, Lza0;->a:J

    .line 1016
    .line 1017
    invoke-virtual {v7, v1, v2, v3}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 1018
    .line 1019
    .line 1020
    goto :goto_e

    .line 1021
    :cond_24
    :goto_f
    return v10

    .line 1022
    nop

    .line 1023
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_d
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_d
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
