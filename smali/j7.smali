.class public final Lj7;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final b:Landroid/graphics/PorterDuff$Mode;

.field public static c:Lj7;


# instance fields
.field public a:Lw01;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget-object v0, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    .line 2
    .line 3
    sput-object v0, Lj7;->b:Landroid/graphics/PorterDuff$Mode;

    .line 4
    .line 5
    return-void
.end method

.method public static declared-synchronized a()Lj7;
    .locals 2

    .line 1
    const-class v0, Lj7;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Lj7;->c:Lj7;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    invoke-static {}, Lj7;->c()V

    .line 9
    .line 10
    .line 11
    goto :goto_0

    .line 12
    :catchall_0
    move-exception v1

    .line 13
    goto :goto_1

    .line 14
    :cond_0
    :goto_0
    sget-object v1, Lj7;->c:Lj7;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    .line 16
    monitor-exit v0

    .line 17
    return-object v1

    .line 18
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 19
    throw v1
.end method

.method public static declared-synchronized c()V
    .locals 7

    .line 1
    const-class v0, Lj7;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Lj7;->c:Lj7;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    new-instance v1, Lj7;

    .line 9
    .line 10
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v1, Lj7;->c:Lj7;

    .line 14
    .line 15
    invoke-static {}, Lw01;->c()Lw01;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    iput-object v2, v1, Lj7;->a:Lw01;

    .line 20
    .line 21
    sget-object v1, Lj7;->c:Lj7;

    .line 22
    .line 23
    iget-object v1, v1, Lj7;->a:Lw01;

    .line 24
    .line 25
    new-instance v2, Li7;

    .line 26
    .line 27
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 28
    .line 29
    .line 30
    const v3, 0x7f080073

    .line 31
    .line 32
    .line 33
    const v4, 0x7f080029

    .line 34
    .line 35
    .line 36
    const v5, 0x7f080075

    .line 37
    .line 38
    .line 39
    filled-new-array {v5, v3, v4}, [I

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    iput-object v3, v2, Li7;->j:Ljava/lang/Object;

    .line 44
    .line 45
    const/4 v3, 0x7

    .line 46
    new-array v4, v3, [I

    .line 47
    .line 48
    fill-array-data v4, :array_0

    .line 49
    .line 50
    .line 51
    iput-object v4, v2, Li7;->k:Ljava/lang/Object;

    .line 52
    .line 53
    new-array v3, v3, [I

    .line 54
    .line 55
    fill-array-data v3, :array_1

    .line 56
    .line 57
    .line 58
    iput-object v3, v2, Li7;->l:Ljava/lang/Object;

    .line 59
    .line 60
    const v3, 0x7f080038

    .line 61
    .line 62
    .line 63
    const v4, 0x7f080059

    .line 64
    .line 65
    .line 66
    const v5, 0x7f08005a

    .line 67
    .line 68
    .line 69
    filled-new-array {v5, v3, v4}, [I

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    iput-object v3, v2, Li7;->m:Ljava/lang/Object;

    .line 74
    .line 75
    const v3, 0x7f08006c

    .line 76
    .line 77
    .line 78
    const v4, 0x7f080076

    .line 79
    .line 80
    .line 81
    filled-new-array {v3, v4}, [I

    .line 82
    .line 83
    .line 84
    move-result-object v3

    .line 85
    iput-object v3, v2, Li7;->n:Ljava/lang/Object;

    .line 86
    .line 87
    const v3, 0x7f08002d

    .line 88
    .line 89
    .line 90
    const v4, 0x7f080033

    .line 91
    .line 92
    .line 93
    const v5, 0x7f08002c

    .line 94
    .line 95
    .line 96
    const v6, 0x7f080032

    .line 97
    .line 98
    .line 99
    filled-new-array {v5, v6, v3, v4}, [I

    .line 100
    .line 101
    .line 102
    move-result-object v3

    .line 103
    iput-object v3, v2, Li7;->o:Ljava/lang/Object;

    .line 104
    .line 105
    monitor-enter v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 106
    :try_start_1
    iput-object v2, v1, Lw01;->e:Li7;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 107
    .line 108
    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 109
    goto :goto_0

    .line 110
    :catchall_0
    move-exception v2

    .line 111
    :try_start_3
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 112
    :try_start_4
    throw v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 113
    :catchall_1
    move-exception v1

    .line 114
    goto :goto_1

    .line 115
    :cond_0
    :goto_0
    monitor-exit v0

    .line 116
    return-void

    .line 117
    :goto_1
    :try_start_5
    monitor-exit v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 118
    throw v1

    .line 119
    :array_0
    .array-data 4
        0x7f080041
        0x7f080064
        0x7f080048
        0x7f080043
        0x7f080044
        0x7f080047
        0x7f080046
    .end array-data

    .line 120
    .line 121
    .line 122
    .line 123
    .line 124
    .line 125
    .line 126
    .line 127
    .line 128
    .line 129
    .line 130
    .line 131
    .line 132
    .line 133
    .line 134
    .line 135
    .line 136
    .line 137
    :array_1
    .array-data 4
        0x7f080072
        0x7f080074
        0x7f08003a
        0x7f08006e
        0x7f08006f
        0x7f080070
        0x7f080071
    .end array-data
.end method


# virtual methods
.method public final declared-synchronized b(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lj7;->a:Lw01;

    .line 3
    .line 4
    invoke-virtual {v0, p1, p2}, Lw01;->d(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 5
    .line 6
    .line 7
    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    monitor-exit p0

    .line 9
    return-object p1

    .line 10
    :catchall_0
    move-exception p1

    .line 11
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 12
    throw p1
.end method
