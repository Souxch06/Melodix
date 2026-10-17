.class public final Ln80;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final e:Lg5;


# instance fields
.field public final a:Landroid/app/Activity;

.field public final b:Lbv1;

.field public final c:Ljava/util/HashMap;

.field public d:Z


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
    sput-object v0, Ln80;->e:Lg5;

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;)V
    .locals 3

    .line 1
    new-instance v0, Lbv1;

    .line 2
    .line 3
    const/16 v1, 0x17

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lbv1;-><init>(I)V

    .line 6
    .line 7
    .line 8
    new-instance v1, Ljava/util/HashMap;

    .line 9
    .line 10
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    .line 15
    .line 16
    const/4 v2, 0x0

    .line 17
    iput-boolean v2, p0, Ln80;->d:Z

    .line 18
    .line 19
    iput-object p1, p0, Ln80;->a:Landroid/app/Activity;

    .line 20
    .line 21
    iput-object v0, p0, Ln80;->b:Lbv1;

    .line 22
    .line 23
    iput-object v1, p0, Ln80;->c:Ljava/util/HashMap;

    .line 24
    .line 25
    return-void
.end method


# virtual methods
.method public final a()Lgs0;
    .locals 7

    .line 1
    iget-boolean v0, p0, Ln80;->d:Z

    .line 2
    .line 3
    sget-object v1, Ln80;->e:Lg5;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    new-instance p0, Lgs0;

    .line 11
    .line 12
    invoke-direct {p0}, Lgs0;-><init>()V

    .line 13
    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_0
    iget-object p0, p0, Ln80;->b:Lbv1;

    .line 17
    .line 18
    iget-object p0, p0, Lbv1;->k:Ljava/lang/Object;

    .line 19
    .line 20
    check-cast p0, Ll80;

    .line 21
    .line 22
    iget-object p0, p0, Ll80;->b:Ljava/lang/Object;

    .line 23
    .line 24
    check-cast p0, [Landroid/util/SparseIntArray;

    .line 25
    .line 26
    if-nez p0, :cond_1

    .line 27
    .line 28
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 29
    .line 30
    .line 31
    new-instance p0, Lgs0;

    .line 32
    .line 33
    invoke-direct {p0}, Lgs0;-><init>()V

    .line 34
    .line 35
    .line 36
    return-object p0

    .line 37
    :cond_1
    const/4 v0, 0x0

    .line 38
    aget-object p0, p0, v0

    .line 39
    .line 40
    if-nez p0, :cond_2

    .line 41
    .line 42
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 43
    .line 44
    .line 45
    new-instance p0, Lgs0;

    .line 46
    .line 47
    invoke-direct {p0}, Lgs0;-><init>()V

    .line 48
    .line 49
    .line 50
    return-object p0

    .line 51
    :cond_2
    move v1, v0

    .line 52
    move v2, v1

    .line 53
    move v3, v2

    .line 54
    :goto_0
    invoke-virtual {p0}, Landroid/util/SparseIntArray;->size()I

    .line 55
    .line 56
    .line 57
    move-result v4

    .line 58
    if-ge v0, v4, :cond_5

    .line 59
    .line 60
    invoke-virtual {p0, v0}, Landroid/util/SparseIntArray;->keyAt(I)I

    .line 61
    .line 62
    .line 63
    move-result v4

    .line 64
    invoke-virtual {p0, v0}, Landroid/util/SparseIntArray;->valueAt(I)I

    .line 65
    .line 66
    .line 67
    move-result v5

    .line 68
    add-int/2addr v1, v5

    .line 69
    const/16 v6, 0x2bc

    .line 70
    .line 71
    if-le v4, v6, :cond_3

    .line 72
    .line 73
    add-int/2addr v3, v5

    .line 74
    :cond_3
    const/16 v6, 0x10

    .line 75
    .line 76
    if-le v4, v6, :cond_4

    .line 77
    .line 78
    add-int/2addr v2, v5

    .line 79
    :cond_4
    add-int/lit8 v0, v0, 0x1

    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_5
    new-instance p0, Lm80;

    .line 83
    .line 84
    invoke-direct {p0, v1, v2, v3}, Lm80;-><init>(III)V

    .line 85
    .line 86
    .line 87
    new-instance v0, Lgs0;

    .line 88
    .line 89
    invoke-direct {v0, p0}, Lgs0;-><init>(Ljava/lang/Object;)V

    .line 90
    .line 91
    .line 92
    return-object v0
.end method

.method public final b()V
    .locals 6

    .line 1
    iget-boolean v0, p0, Ln80;->d:Z

    .line 2
    .line 3
    iget-object v1, p0, Ln80;->a:Landroid/app/Activity;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    sget-object v0, Ln80;->e:Lg5;

    .line 20
    .line 21
    const-string v1, "FrameMetricsAggregator is already recording %s"

    .line 22
    .line 23
    invoke-virtual {v0, v1, p0}, Lg5;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    iget-object v0, p0, Ln80;->b:Lbv1;

    .line 28
    .line 29
    iget-object v0, v0, Lbv1;->k:Ljava/lang/Object;

    .line 30
    .line 31
    check-cast v0, Ll80;

    .line 32
    .line 33
    sget-object v2, Ll80;->e:Landroid/os/HandlerThread;

    .line 34
    .line 35
    if-nez v2, :cond_1

    .line 36
    .line 37
    new-instance v2, Landroid/os/HandlerThread;

    .line 38
    .line 39
    const-string v3, "FrameMetricsAggregator"

    .line 40
    .line 41
    invoke-direct {v2, v3}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    sput-object v2, Ll80;->e:Landroid/os/HandlerThread;

    .line 45
    .line 46
    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    .line 47
    .line 48
    .line 49
    new-instance v2, Landroid/os/Handler;

    .line 50
    .line 51
    sget-object v3, Ll80;->e:Landroid/os/HandlerThread;

    .line 52
    .line 53
    invoke-virtual {v3}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    invoke-direct {v2, v3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 58
    .line 59
    .line 60
    sput-object v2, Ll80;->f:Landroid/os/Handler;

    .line 61
    .line 62
    :cond_1
    const/4 v2, 0x0

    .line 63
    :goto_0
    const/16 v3, 0x8

    .line 64
    .line 65
    const/4 v4, 0x1

    .line 66
    if-gt v2, v3, :cond_3

    .line 67
    .line 68
    iget-object v3, v0, Ll80;->b:Ljava/lang/Object;

    .line 69
    .line 70
    check-cast v3, [Landroid/util/SparseIntArray;

    .line 71
    .line 72
    aget-object v5, v3, v2

    .line 73
    .line 74
    if-nez v5, :cond_2

    .line 75
    .line 76
    iget v5, v0, Ll80;->a:I

    .line 77
    .line 78
    shl-int/2addr v4, v2

    .line 79
    and-int/2addr v4, v5

    .line 80
    if-eqz v4, :cond_2

    .line 81
    .line 82
    new-instance v4, Landroid/util/SparseIntArray;

    .line 83
    .line 84
    invoke-direct {v4}, Landroid/util/SparseIntArray;-><init>()V

    .line 85
    .line 86
    .line 87
    aput-object v4, v3, v2

    .line 88
    .line 89
    :cond_2
    add-int/lit8 v2, v2, 0x1

    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_3
    invoke-virtual {v1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 93
    .line 94
    .line 95
    move-result-object v2

    .line 96
    iget-object v3, v0, Ll80;->d:Ljava/lang/Object;

    .line 97
    .line 98
    check-cast v3, Lk80;

    .line 99
    .line 100
    sget-object v5, Ll80;->f:Landroid/os/Handler;

    .line 101
    .line 102
    invoke-virtual {v2, v3, v5}, Landroid/view/Window;->addOnFrameMetricsAvailableListener(Landroid/view/Window$OnFrameMetricsAvailableListener;Landroid/os/Handler;)V

    .line 103
    .line 104
    .line 105
    iget-object v0, v0, Ll80;->c:Ljava/io/Serializable;

    .line 106
    .line 107
    check-cast v0, Ljava/util/ArrayList;

    .line 108
    .line 109
    new-instance v2, Ljava/lang/ref/WeakReference;

    .line 110
    .line 111
    invoke-direct {v2, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 115
    .line 116
    .line 117
    iput-boolean v4, p0, Ln80;->d:Z

    .line 118
    .line 119
    return-void
.end method
