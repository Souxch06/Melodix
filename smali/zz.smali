.class public final Lzz;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final j:Ljava/lang/Object;

.field public static volatile k:Lzz;


# instance fields
.field public final a:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

.field public final b:Lha;

.field public volatile c:I

.field public final d:Landroid/os/Handler;

.field public final e:Lm4;

.field public final f:Lyz;

.field public final g:Ltb0;

.field public final h:I

.field public final i:Lhv;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/Object;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lzz;->j:Ljava/lang/Object;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Lm60;)V
    .locals 5

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lzz;->a:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 10
    .line 11
    const/4 v1, 0x3

    .line 12
    iput v1, p0, Lzz;->c:I

    .line 13
    .line 14
    iget-object v1, p1, Lvz;->b:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast v1, Lyz;

    .line 17
    .line 18
    iput-object v1, p0, Lzz;->f:Lyz;

    .line 19
    .line 20
    iget v2, p1, Lvz;->a:I

    .line 21
    .line 22
    iput v2, p0, Lzz;->h:I

    .line 23
    .line 24
    iget-object p1, p1, Lvz;->c:Ljava/lang/Object;

    .line 25
    .line 26
    check-cast p1, Lhv;

    .line 27
    .line 28
    iput-object p1, p0, Lzz;->i:Lhv;

    .line 29
    .line 30
    new-instance p1, Landroid/os/Handler;

    .line 31
    .line 32
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    invoke-direct {p1, v3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 37
    .line 38
    .line 39
    iput-object p1, p0, Lzz;->d:Landroid/os/Handler;

    .line 40
    .line 41
    new-instance p1, Lha;

    .line 42
    .line 43
    const/4 v3, 0x0

    .line 44
    invoke-direct {p1, v3}, Lha;-><init>(I)V

    .line 45
    .line 46
    .line 47
    iput-object p1, p0, Lzz;->b:Lha;

    .line 48
    .line 49
    new-instance p1, Ltb0;

    .line 50
    .line 51
    const/16 v4, 0xd

    .line 52
    .line 53
    invoke-direct {p1, v4}, Ltb0;-><init>(I)V

    .line 54
    .line 55
    .line 56
    iput-object p1, p0, Lzz;->g:Ltb0;

    .line 57
    .line 58
    new-instance p1, Lm4;

    .line 59
    .line 60
    invoke-direct {p1, p0}, Lm4;-><init>(Lzz;)V

    .line 61
    .line 62
    .line 63
    iput-object p1, p0, Lzz;->e:Lm4;

    .line 64
    .line 65
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    .line 66
    .line 67
    .line 68
    move-result-object v4

    .line 69
    invoke-interface {v4}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 70
    .line 71
    .line 72
    if-nez v2, :cond_0

    .line 73
    .line 74
    :try_start_0
    iput v3, p0, Lzz;->c:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :catchall_0
    move-exception p1

    .line 78
    iget-object p0, p0, Lzz;->a:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 79
    .line 80
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 85
    .line 86
    .line 87
    throw p1

    .line 88
    :cond_0
    :goto_0
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 93
    .line 94
    .line 95
    invoke-virtual {p0}, Lzz;->b()I

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    if-nez v0, :cond_1

    .line 100
    .line 101
    :try_start_1
    new-instance v0, Luz;

    .line 102
    .line 103
    invoke-direct {v0, p1}, Luz;-><init>(Lm4;)V

    .line 104
    .line 105
    .line 106
    invoke-interface {v1, v0}, Lyz;->a(Lxg;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 107
    .line 108
    .line 109
    return-void

    .line 110
    :catchall_1
    move-exception p1

    .line 111
    invoke-virtual {p0, p1}, Lzz;->d(Ljava/lang/Throwable;)V

    .line 112
    .line 113
    .line 114
    :cond_1
    return-void
.end method

.method public static a()Lzz;
    .locals 4

    .line 1
    sget-object v0, Lzz;->j:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Lzz;->k:Lzz;

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    const/4 v2, 0x1

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 v2, 0x0

    .line 11
    :goto_0
    const-string v3, "EmojiCompat is not initialized.\n\nYou must initialize EmojiCompat prior to referencing the EmojiCompat instance.\n\nThe most likely cause of this error is disabling the EmojiCompatInitializer\neither explicitly in AndroidManifest.xml, or by including\nandroidx.emoji2:emoji2-bundled.\n\nAutomatic initialization is typically performed by EmojiCompatInitializer. If\nyou are not expecting to initialize EmojiCompat manually in your application,\nplease check to ensure it has not been removed from your APK\'s manifest. You can\ndo this in Android Studio using Build > Analyze APK.\n\nIn the APK Analyzer, ensure that the startup entry for\nEmojiCompatInitializer and InitializationProvider is present in\n AndroidManifest.xml. If it is missing or contains tools:node=\"remove\", and you\nintend to use automatic configuration, verify:\n\n  1. Your application does not include emoji2-bundled\n  2. All modules do not contain an exclusion manifest rule for\n     EmojiCompatInitializer or InitializationProvider. For more information\n     about manifest exclusions see the documentation for the androidx startup\n     library.\n\nIf you intend to use emoji2-bundled, please call EmojiCompat.init. You can\nlearn more in the documentation for BundledEmojiCompatConfig.\n\nIf you intended to perform manual configuration, it is recommended that you call\nEmojiCompat.init immediately on application startup.\n\nIf you still cannot resolve this issue, please open a bug with your specific\nconfiguration to help improve error message."

    .line 12
    .line 13
    if-eqz v2, :cond_1

    .line 14
    .line 15
    monitor-exit v0

    .line 16
    return-object v1

    .line 17
    :catchall_0
    move-exception v1

    .line 18
    goto :goto_1

    .line 19
    :cond_1
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 20
    .line 21
    invoke-direct {v1, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    throw v1

    .line 25
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    throw v1
.end method


# virtual methods
.method public final b()I
    .locals 1

    .line 1
    iget-object v0, p0, Lzz;->a:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/Lock;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 8
    .line 9
    .line 10
    :try_start_0
    iget v0, p0, Lzz;->c:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    .line 12
    iget-object p0, p0, Lzz;->a:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/Lock;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 19
    .line 20
    .line 21
    return v0

    .line 22
    :catchall_0
    move-exception v0

    .line 23
    iget-object p0, p0, Lzz;->a:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 24
    .line 25
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/Lock;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 30
    .line 31
    .line 32
    throw v0
.end method

.method public final c()V
    .locals 3

    .line 1
    iget v0, p0, Lzz;->h:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    if-ne v0, v2, :cond_0

    .line 6
    .line 7
    move v0, v2

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    move v0, v1

    .line 10
    :goto_0
    if-eqz v0, :cond_3

    .line 11
    .line 12
    invoke-virtual {p0}, Lzz;->b()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-ne v0, v2, :cond_1

    .line 17
    .line 18
    return-void

    .line 19
    :cond_1
    iget-object v0, p0, Lzz;->a:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 26
    .line 27
    .line 28
    :try_start_0
    iget v0, p0, Lzz;->c:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 29
    .line 30
    if-nez v0, :cond_2

    .line 31
    .line 32
    iget-object p0, p0, Lzz;->a:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 33
    .line 34
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_2
    :try_start_1
    iput v1, p0, Lzz;->c:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 43
    .line 44
    iget-object v0, p0, Lzz;->a:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 45
    .line 46
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 51
    .line 52
    .line 53
    iget-object p0, p0, Lzz;->e:Lm4;

    .line 54
    .line 55
    iget-object v0, p0, Lm4;->a:Ljava/lang/Object;

    .line 56
    .line 57
    check-cast v0, Lzz;

    .line 58
    .line 59
    :try_start_2
    new-instance v1, Luz;

    .line 60
    .line 61
    invoke-direct {v1, p0}, Luz;-><init>(Lm4;)V

    .line 62
    .line 63
    .line 64
    iget-object p0, v0, Lzz;->f:Lyz;

    .line 65
    .line 66
    invoke-interface {p0, v1}, Lyz;->a(Lxg;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :catchall_0
    move-exception p0

    .line 71
    invoke-virtual {v0, p0}, Lzz;->d(Ljava/lang/Throwable;)V

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :catchall_1
    move-exception v0

    .line 76
    iget-object p0, p0, Lzz;->a:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 77
    .line 78
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 83
    .line 84
    .line 85
    throw v0

    .line 86
    :cond_3
    const-string p0, "Set metadataLoadStrategy to LOAD_STRATEGY_MANUAL to execute manual loading"

    .line 87
    .line 88
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    return-void
.end method

.method public final d(Ljava/lang/Throwable;)V
    .locals 3

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lzz;->a:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 7
    .line 8
    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 13
    .line 14
    .line 15
    const/4 v1, 0x2

    .line 16
    :try_start_0
    iput v1, p0, Lzz;->c:I

    .line 17
    .line 18
    iget-object v1, p0, Lzz;->b:Lha;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 21
    .line 22
    .line 23
    iget-object v1, p0, Lzz;->b:Lha;

    .line 24
    .line 25
    invoke-virtual {v1}, Lha;->clear()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Lzz;->a:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 29
    .line 30
    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 35
    .line 36
    .line 37
    iget-object v1, p0, Lzz;->d:Landroid/os/Handler;

    .line 38
    .line 39
    new-instance v2, Lxz;

    .line 40
    .line 41
    iget p0, p0, Lzz;->c:I

    .line 42
    .line 43
    invoke-direct {v2, v0, p0, p1}, Lxz;-><init>(Ljava/util/List;ILjava/lang/Throwable;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :catchall_0
    move-exception p1

    .line 51
    iget-object p0, p0, Lzz;->a:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 52
    .line 53
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 58
    .line 59
    .line 60
    throw p1
.end method

.method public final e(Ljava/lang/CharSequence;II)Ljava/lang/CharSequence;
    .locals 11

    .line 1
    invoke-virtual {p0}, Lzz;->b()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x1

    .line 7
    if-ne v0, v2, :cond_0

    .line 8
    .line 9
    move v0, v2

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    move v0, v1

    .line 12
    :goto_0
    const/4 v3, 0x0

    .line 13
    if-eqz v0, :cond_18

    .line 14
    .line 15
    if-ltz p2, :cond_17

    .line 16
    .line 17
    if-ltz p3, :cond_16

    .line 18
    .line 19
    if-gt p2, p3, :cond_1

    .line 20
    .line 21
    move v0, v2

    .line 22
    goto :goto_1

    .line 23
    :cond_1
    move v0, v1

    .line 24
    :goto_1
    if-eqz v0, :cond_15

    .line 25
    .line 26
    if-nez p1, :cond_2

    .line 27
    .line 28
    return-object v3

    .line 29
    :cond_2
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-gt p2, v0, :cond_3

    .line 34
    .line 35
    move v0, v2

    .line 36
    goto :goto_2

    .line 37
    :cond_3
    move v0, v1

    .line 38
    :goto_2
    if-eqz v0, :cond_14

    .line 39
    .line 40
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-gt p3, v0, :cond_4

    .line 45
    .line 46
    goto :goto_3

    .line 47
    :cond_4
    move v2, v1

    .line 48
    :goto_3
    if-eqz v2, :cond_13

    .line 49
    .line 50
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-eqz v0, :cond_5

    .line 55
    .line 56
    if-ne p2, p3, :cond_6

    .line 57
    .line 58
    :cond_5
    move-object v5, p1

    .line 59
    goto/16 :goto_c

    .line 60
    .line 61
    :cond_6
    iget-object p0, p0, Lzz;->e:Lm4;

    .line 62
    .line 63
    iget-object p0, p0, Lm4;->b:Ljava/lang/Object;

    .line 64
    .line 65
    move-object v4, p0

    .line 66
    check-cast v4, Lc9;

    .line 67
    .line 68
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 69
    .line 70
    .line 71
    instance-of p0, p1, Ls81;

    .line 72
    .line 73
    if-eqz p0, :cond_7

    .line 74
    .line 75
    move-object v0, p1

    .line 76
    check-cast v0, Ls81;

    .line 77
    .line 78
    invoke-virtual {v0}, Ls81;->a()V

    .line 79
    .line 80
    .line 81
    :cond_7
    const-class v0, Lne1;

    .line 82
    .line 83
    if-nez p0, :cond_9

    .line 84
    .line 85
    :try_start_0
    instance-of v2, p1, Landroid/text/Spannable;

    .line 86
    .line 87
    if-eqz v2, :cond_8

    .line 88
    .line 89
    goto :goto_5

    .line 90
    :cond_8
    instance-of v2, p1, Landroid/text/Spanned;

    .line 91
    .line 92
    if-eqz v2, :cond_a

    .line 93
    .line 94
    move-object v2, p1

    .line 95
    check-cast v2, Landroid/text/Spanned;

    .line 96
    .line 97
    add-int/lit8 v5, p2, -0x1

    .line 98
    .line 99
    add-int/lit8 v6, p3, 0x1

    .line 100
    .line 101
    invoke-interface {v2, v5, v6, v0}, Landroid/text/Spanned;->nextSpanTransition(IILjava/lang/Class;)I

    .line 102
    .line 103
    .line 104
    move-result v2

    .line 105
    if-gt v2, p3, :cond_a

    .line 106
    .line 107
    new-instance v3, Lif1;

    .line 108
    .line 109
    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    .line 110
    .line 111
    .line 112
    iput-boolean v1, v3, Lif1;->j:Z

    .line 113
    .line 114
    new-instance v2, Landroid/text/SpannableString;

    .line 115
    .line 116
    invoke-direct {v2, p1}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 117
    .line 118
    .line 119
    iput-object v2, v3, Lif1;->k:Landroid/text/Spannable;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 120
    .line 121
    goto :goto_6

    .line 122
    :goto_4
    move-object v5, p1

    .line 123
    goto/16 :goto_b

    .line 124
    .line 125
    :catchall_0
    move-exception v0

    .line 126
    move-object p2, v0

    .line 127
    goto :goto_4

    .line 128
    :cond_9
    :goto_5
    :try_start_1
    new-instance v3, Lif1;

    .line 129
    .line 130
    move-object v2, p1

    .line 131
    check-cast v2, Landroid/text/Spannable;

    .line 132
    .line 133
    invoke-direct {v3, v2}, Lif1;-><init>(Landroid/text/Spannable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 134
    .line 135
    .line 136
    :cond_a
    :goto_6
    if-eqz v3, :cond_c

    .line 137
    .line 138
    :try_start_2
    iget-object v2, v3, Lif1;->k:Landroid/text/Spannable;

    .line 139
    .line 140
    invoke-interface {v2, p2, p3, v0}, Landroid/text/Spanned;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    check-cast v0, [Lne1;

    .line 145
    .line 146
    if-eqz v0, :cond_c

    .line 147
    .line 148
    array-length v2, v0

    .line 149
    if-lez v2, :cond_c

    .line 150
    .line 151
    array-length v2, v0

    .line 152
    move v5, v1

    .line 153
    :goto_7
    if-ge v5, v2, :cond_c

    .line 154
    .line 155
    aget-object v6, v0, v5

    .line 156
    .line 157
    iget-object v7, v3, Lif1;->k:Landroid/text/Spannable;

    .line 158
    .line 159
    invoke-interface {v7, v6}, Landroid/text/Spanned;->getSpanStart(Ljava/lang/Object;)I

    .line 160
    .line 161
    .line 162
    move-result v7

    .line 163
    iget-object v8, v3, Lif1;->k:Landroid/text/Spannable;

    .line 164
    .line 165
    invoke-interface {v8, v6}, Landroid/text/Spanned;->getSpanEnd(Ljava/lang/Object;)I

    .line 166
    .line 167
    .line 168
    move-result v8

    .line 169
    if-eq v7, p3, :cond_b

    .line 170
    .line 171
    invoke-virtual {v3, v6}, Lif1;->removeSpan(Ljava/lang/Object;)V

    .line 172
    .line 173
    .line 174
    :cond_b
    invoke-static {v7, p2}, Ljava/lang/Math;->min(II)I

    .line 175
    .line 176
    .line 177
    move-result p2

    .line 178
    invoke-static {v8, p3}, Ljava/lang/Math;->max(II)I

    .line 179
    .line 180
    .line 181
    move-result p3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 182
    add-int/lit8 v5, v5, 0x1

    .line 183
    .line 184
    goto :goto_7

    .line 185
    :cond_c
    move v6, p2

    .line 186
    move v7, p3

    .line 187
    if-eq v6, v7, :cond_d

    .line 188
    .line 189
    :try_start_3
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 190
    .line 191
    .line 192
    move-result p2

    .line 193
    if-lt v6, p2, :cond_e

    .line 194
    .line 195
    :cond_d
    move-object v5, p1

    .line 196
    goto :goto_a

    .line 197
    :cond_e
    new-instance v10, Ls7;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 198
    .line 199
    :try_start_4
    iget-object p2, v4, Lc9;->k:Ljava/lang/Object;

    .line 200
    .line 201
    check-cast p2, Ltb0;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    .line 202
    .line 203
    const/16 p3, 0x14

    .line 204
    .line 205
    :try_start_5
    invoke-direct {v10, v3, p2, p3, v1}, Ls7;-><init>(Ljava/lang/Object;Ljava/lang/Object;IZ)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 206
    .line 207
    .line 208
    const/4 v9, 0x0

    .line 209
    const v8, 0x7fffffff

    .line 210
    .line 211
    .line 212
    move-object v5, p1

    .line 213
    :try_start_6
    invoke-virtual/range {v4 .. v10}, Lc9;->G(Ljava/lang/CharSequence;IIIZLj00;)Ljava/lang/Object;

    .line 214
    .line 215
    .line 216
    move-result-object p1

    .line 217
    check-cast p1, Lif1;

    .line 218
    .line 219
    if-eqz p1, :cond_10

    .line 220
    .line 221
    iget-object p1, p1, Lif1;->k:Landroid/text/Spannable;
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 222
    .line 223
    if-eqz p0, :cond_f

    .line 224
    .line 225
    move-object p0, v5

    .line 226
    check-cast p0, Ls81;

    .line 227
    .line 228
    invoke-virtual {p0}, Ls81;->b()V

    .line 229
    .line 230
    .line 231
    :cond_f
    return-object p1

    .line 232
    :catchall_1
    move-exception v0

    .line 233
    :goto_8
    move-object p2, v0

    .line 234
    goto :goto_b

    .line 235
    :cond_10
    if-eqz p0, :cond_12

    .line 236
    .line 237
    :goto_9
    move-object p1, v5

    .line 238
    check-cast p1, Ls81;

    .line 239
    .line 240
    invoke-virtual {p1}, Ls81;->b()V

    .line 241
    .line 242
    .line 243
    return-object v5

    .line 244
    :catchall_2
    move-exception v0

    .line 245
    move-object v5, p1

    .line 246
    goto :goto_8

    .line 247
    :catchall_3
    move-exception v0

    .line 248
    move-object v5, p1

    .line 249
    move-object p1, v0

    .line 250
    move-object p2, p1

    .line 251
    goto :goto_b

    .line 252
    :goto_a
    if-eqz p0, :cond_12

    .line 253
    .line 254
    goto :goto_9

    .line 255
    :goto_b
    if-eqz p0, :cond_11

    .line 256
    .line 257
    move-object p1, v5

    .line 258
    check-cast p1, Ls81;

    .line 259
    .line 260
    invoke-virtual {p1}, Ls81;->b()V

    .line 261
    .line 262
    .line 263
    :cond_11
    throw p2

    .line 264
    :cond_12
    :goto_c
    return-object v5

    .line 265
    :cond_13
    const-string p0, "end should be < than charSequence length"

    .line 266
    .line 267
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 268
    .line 269
    .line 270
    return-object v3

    .line 271
    :cond_14
    const-string p0, "start should be < than charSequence length"

    .line 272
    .line 273
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 274
    .line 275
    .line 276
    return-object v3

    .line 277
    :cond_15
    const-string p0, "start should be <= than end"

    .line 278
    .line 279
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 280
    .line 281
    .line 282
    return-object v3

    .line 283
    :cond_16
    const-string p0, "end cannot be negative"

    .line 284
    .line 285
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 286
    .line 287
    .line 288
    return-object v3

    .line 289
    :cond_17
    const-string p0, "start cannot be negative"

    .line 290
    .line 291
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 292
    .line 293
    .line 294
    return-object v3

    .line 295
    :cond_18
    const-string p0, "Not initialized yet"

    .line 296
    .line 297
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 298
    .line 299
    .line 300
    return-object v3
.end method

.method public final f(Lwz;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lzz;->a:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 8
    .line 9
    .line 10
    :try_start_0
    iget v0, p0, Lzz;->c:I

    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    if-eq v0, v1, :cond_1

    .line 14
    .line 15
    iget v0, p0, Lzz;->c:I

    .line 16
    .line 17
    const/4 v1, 0x2

    .line 18
    if-ne v0, v1, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    iget-object v0, p0, Lzz;->b:Lha;

    .line 22
    .line 23
    invoke-virtual {v0, p1}, Lha;->add(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    goto :goto_1

    .line 27
    :catchall_0
    move-exception p1

    .line 28
    goto :goto_2

    .line 29
    :cond_1
    :goto_0
    iget-object v0, p0, Lzz;->d:Landroid/os/Handler;

    .line 30
    .line 31
    new-instance v1, Lxz;

    .line 32
    .line 33
    iget v2, p0, Lzz;->c:I

    .line 34
    .line 35
    filled-new-array {p1}, [Lwz;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    const/4 v3, 0x0

    .line 44
    invoke-direct {v1, p1, v2, v3}, Lxz;-><init>(Ljava/util/List;ILjava/lang/Throwable;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 48
    .line 49
    .line 50
    :goto_1
    iget-object p0, p0, Lzz;->a:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 51
    .line 52
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :goto_2
    iget-object p0, p0, Lzz;->a:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 61
    .line 62
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 67
    .line 68
    .line 69
    throw p1
.end method
