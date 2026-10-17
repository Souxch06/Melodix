.class public final Lvs;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final f:Ljava/util/HashMap;

.field public static final g:Ljava/lang/String;


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lpd0;

.field public final c:Ldn;

.field public final d:Lxn0;

.field public final e:Ldn;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lvs;->f:Ljava/util/HashMap;

    .line 7
    .line 8
    const/4 v1, 0x5

    .line 9
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const-string v2, "armeabi"

    .line 14
    .line 15
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    const/4 v1, 0x6

    .line 19
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    const-string v2, "armeabi-v7a"

    .line 24
    .line 25
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    const/16 v1, 0x9

    .line 29
    .line 30
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    const-string v2, "arm64-v8a"

    .line 35
    .line 36
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    const/4 v1, 0x0

    .line 40
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    const-string v2, "x86"

    .line 45
    .line 46
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    const/4 v1, 0x1

    .line 50
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    const-string v2, "x86_64"

    .line 55
    .line 56
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 60
    .line 61
    const-string v0, "Crashlytics Android SDK/20.0.5"

    .line 62
    .line 63
    sput-object v0, Lvs;->g:Ljava/lang/String;

    .line 64
    .line 65
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lpd0;Ldn;Lxn0;Ldn;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lvs;->a:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p2, p0, Lvs;->b:Lpd0;

    .line 7
    .line 8
    iput-object p3, p0, Lvs;->c:Ldn;

    .line 9
    .line 10
    iput-object p4, p0, Lvs;->d:Lxn0;

    .line 11
    .line 12
    iput-object p5, p0, Lvs;->e:Ldn;

    .line 13
    .line 14
    return-void
.end method

.method public static c(Ler0;I)Lrd;
    .locals 7

    .line 1
    iget-object v0, p0, Ler0;->l:Ljava/lang/Object;

    .line 2
    .line 3
    move-object v2, v0

    .line 4
    check-cast v2, Ljava/lang/String;

    .line 5
    .line 6
    iget-object v0, p0, Ler0;->k:Ljava/lang/Object;

    .line 7
    .line 8
    move-object v3, v0

    .line 9
    check-cast v3, Ljava/lang/String;

    .line 10
    .line 11
    iget-object v0, p0, Ler0;->m:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast v0, [Ljava/lang/StackTraceElement;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    new-array v0, v1, [Ljava/lang/StackTraceElement;

    .line 20
    .line 21
    :goto_0
    iget-object p0, p0, Ler0;->n:Ljava/lang/Object;

    .line 22
    .line 23
    check-cast p0, Ler0;

    .line 24
    .line 25
    const/16 v4, 0x8

    .line 26
    .line 27
    if-lt p1, v4, :cond_1

    .line 28
    .line 29
    move-object v4, p0

    .line 30
    :goto_1
    if-eqz v4, :cond_1

    .line 31
    .line 32
    iget-object v4, v4, Ler0;->n:Ljava/lang/Object;

    .line 33
    .line 34
    check-cast v4, Ler0;

    .line 35
    .line 36
    add-int/lit8 v1, v1, 0x1

    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_1
    move v6, v1

    .line 40
    const/4 v1, 0x4

    .line 41
    invoke-static {v0, v1}, Lvs;->d([Ljava/lang/StackTraceElement;I)Ljava/util/List;

    .line 42
    .line 43
    .line 44
    move-result-object v4

    .line 45
    const/4 v0, 0x0

    .line 46
    if-eqz v4, :cond_5

    .line 47
    .line 48
    const/4 v1, 0x0

    .line 49
    const/4 v5, 0x1

    .line 50
    or-int/2addr v1, v5

    .line 51
    int-to-byte v1, v1

    .line 52
    if-eqz p0, :cond_2

    .line 53
    .line 54
    if-nez v6, :cond_2

    .line 55
    .line 56
    add-int/2addr p1, v5

    .line 57
    invoke-static {p0, p1}, Lvs;->c(Ler0;I)Lrd;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    goto :goto_2

    .line 62
    :cond_2
    move-object p0, v0

    .line 63
    :goto_2
    if-ne v1, v5, :cond_3

    .line 64
    .line 65
    new-instance v1, Lrd;

    .line 66
    .line 67
    move-object v5, p0

    .line 68
    invoke-direct/range {v1 .. v6}, Lrd;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Les;I)V

    .line 69
    .line 70
    .line 71
    return-object v1

    .line 72
    :cond_3
    new-instance p0, Ljava/lang/StringBuilder;

    .line 73
    .line 74
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 75
    .line 76
    .line 77
    and-int/lit8 p1, v1, 0x1

    .line 78
    .line 79
    if-nez p1, :cond_4

    .line 80
    .line 81
    const-string p1, " overflowCount"

    .line 82
    .line 83
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    :cond_4
    const-string p1, "Missing required properties:"

    .line 87
    .line 88
    invoke-static {p1, p0}, Loq;->k(Ljava/lang/String;Ljava/lang/StringBuilder;)Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    return-object v0

    .line 96
    :cond_5
    const-string p0, "Null frames"

    .line 97
    .line 98
    invoke-static {p0}, Lwd1;->d(Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    return-object v0
.end method

.method public static d([Ljava/lang/StackTraceElement;I)Ljava/util/List;
    .locals 12

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    array-length v1, p0

    .line 7
    const/4 v2, 0x0

    .line 8
    :goto_0
    if-ge v2, v1, :cond_2

    .line 9
    .line 10
    aget-object v3, p0, v2

    .line 11
    .line 12
    new-instance v4, Lud;

    .line 13
    .line 14
    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    .line 15
    .line 16
    .line 17
    iput p1, v4, Lud;->e:I

    .line 18
    .line 19
    iget-byte v5, v4, Lud;->f:B

    .line 20
    .line 21
    or-int/lit8 v5, v5, 0x4

    .line 22
    .line 23
    int-to-byte v5, v5

    .line 24
    iput-byte v5, v4, Lud;->f:B

    .line 25
    .line 26
    invoke-virtual {v3}, Ljava/lang/StackTraceElement;->isNativeMethod()Z

    .line 27
    .line 28
    .line 29
    move-result v5

    .line 30
    const-wide/16 v6, 0x0

    .line 31
    .line 32
    if-eqz v5, :cond_0

    .line 33
    .line 34
    invoke-virtual {v3}, Ljava/lang/StackTraceElement;->getLineNumber()I

    .line 35
    .line 36
    .line 37
    move-result v5

    .line 38
    int-to-long v8, v5

    .line 39
    invoke-static {v8, v9, v6, v7}, Ljava/lang/Math;->max(JJ)J

    .line 40
    .line 41
    .line 42
    move-result-wide v8

    .line 43
    goto :goto_1

    .line 44
    :cond_0
    move-wide v8, v6

    .line 45
    :goto_1
    new-instance v5, Ljava/lang/StringBuilder;

    .line 46
    .line 47
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v3}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v10

    .line 54
    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    const-string v10, "."

    .line 58
    .line 59
    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v3}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v10

    .line 66
    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v5

    .line 73
    invoke-virtual {v3}, Ljava/lang/StackTraceElement;->getFileName()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v10

    .line 77
    invoke-virtual {v3}, Ljava/lang/StackTraceElement;->isNativeMethod()Z

    .line 78
    .line 79
    .line 80
    move-result v11

    .line 81
    if-nez v11, :cond_1

    .line 82
    .line 83
    invoke-virtual {v3}, Ljava/lang/StackTraceElement;->getLineNumber()I

    .line 84
    .line 85
    .line 86
    move-result v11

    .line 87
    if-lez v11, :cond_1

    .line 88
    .line 89
    invoke-virtual {v3}, Ljava/lang/StackTraceElement;->getLineNumber()I

    .line 90
    .line 91
    .line 92
    move-result v3

    .line 93
    int-to-long v6, v3

    .line 94
    :cond_1
    iput-wide v8, v4, Lud;->a:J

    .line 95
    .line 96
    iget-byte v3, v4, Lud;->f:B

    .line 97
    .line 98
    or-int/lit8 v3, v3, 0x1

    .line 99
    .line 100
    int-to-byte v3, v3

    .line 101
    iput-object v5, v4, Lud;->b:Ljava/lang/String;

    .line 102
    .line 103
    iput-object v10, v4, Lud;->c:Ljava/lang/String;

    .line 104
    .line 105
    iput-wide v6, v4, Lud;->d:J

    .line 106
    .line 107
    or-int/lit8 v3, v3, 0x2

    .line 108
    .line 109
    int-to-byte v3, v3

    .line 110
    iput-byte v3, v4, Lud;->f:B

    .line 111
    .line 112
    invoke-virtual {v4}, Lud;->a()Lvd;

    .line 113
    .line 114
    .line 115
    move-result-object v3

    .line 116
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 117
    .line 118
    .line 119
    add-int/lit8 v2, v2, 0x1

    .line 120
    .line 121
    goto :goto_0

    .line 122
    :cond_2
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    return-object p0
.end method

.method public static e()Lsd;
    .locals 4

    .line 1
    new-instance v0, Lsd;

    .line 2
    .line 3
    const-string v1, "0"

    .line 4
    .line 5
    const-wide/16 v2, 0x0

    .line 6
    .line 7
    invoke-direct {v0, v1, v1, v2, v3}, Lsd;-><init>(Ljava/lang/String;Ljava/lang/String;J)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method


# virtual methods
.method public final a()Ljava/util/List;
    .locals 9

    .line 1
    const/4 v0, 0x0

    .line 2
    or-int/lit8 v0, v0, 0x1

    .line 3
    .line 4
    int-to-byte v0, v0

    .line 5
    or-int/lit8 v0, v0, 0x2

    .line 6
    .line 7
    int-to-byte v0, v0

    .line 8
    iget-object p0, p0, Lvs;->c:Ldn;

    .line 9
    .line 10
    iget-object v1, p0, Ldn;->e:Ljava/lang/Object;

    .line 11
    .line 12
    move-object v7, v1

    .line 13
    check-cast v7, Ljava/lang/String;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    if-eqz v7, :cond_3

    .line 17
    .line 18
    iget-object p0, p0, Ldn;->b:Ljava/lang/Object;

    .line 19
    .line 20
    move-object v8, p0

    .line 21
    check-cast v8, Ljava/lang/String;

    .line 22
    .line 23
    const/4 p0, 0x3

    .line 24
    if-ne v0, p0, :cond_0

    .line 25
    .line 26
    new-instance v2, Lqd;

    .line 27
    .line 28
    const-wide/16 v3, 0x0

    .line 29
    .line 30
    move-wide v5, v3

    .line 31
    invoke-direct/range {v2 .. v8}, Lqd;-><init>(JJLjava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-static {v2}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0

    .line 39
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 42
    .line 43
    .line 44
    and-int/lit8 v2, v0, 0x1

    .line 45
    .line 46
    if-nez v2, :cond_1

    .line 47
    .line 48
    const-string v2, " baseAddress"

    .line 49
    .line 50
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    :cond_1
    and-int/lit8 v0, v0, 0x2

    .line 54
    .line 55
    if-nez v0, :cond_2

    .line 56
    .line 57
    const-string v0, " size"

    .line 58
    .line 59
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    :cond_2
    const-string v0, "Missing required properties:"

    .line 63
    .line 64
    invoke-static {v0, p0}, Loq;->k(Ljava/lang/String;Ljava/lang/StringBuilder;)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    return-object v1

    .line 72
    :cond_3
    const-string p0, "Null name"

    .line 73
    .line 74
    invoke-static {p0}, Lwd1;->d(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    return-object v1
.end method

.method public final b(I)Lzd;
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v0, v0, Lvs;->a:Landroid/content/Context;

    .line 4
    .line 5
    const/4 v1, 0x2

    .line 6
    const/4 v2, 0x1

    .line 7
    const/4 v3, 0x0

    .line 8
    const/4 v4, 0x0

    .line 9
    :try_start_0
    new-instance v5, Landroid/content/IntentFilter;

    .line 10
    .line 11
    const-string v6, "android.intent.action.BATTERY_CHANGED"

    .line 12
    .line 13
    invoke-direct {v5, v6}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v4, v5}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 17
    .line 18
    .line 19
    move-result-object v5

    .line 20
    if-eqz v5, :cond_4

    .line 21
    .line 22
    const-string v6, "status"

    .line 23
    .line 24
    const/4 v7, -0x1

    .line 25
    invoke-virtual {v5, v6, v7}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 26
    .line 27
    .line 28
    move-result v6
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 29
    if-ne v6, v7, :cond_1

    .line 30
    .line 31
    :cond_0
    move v6, v3

    .line 32
    goto :goto_0

    .line 33
    :cond_1
    if-eq v6, v1, :cond_2

    .line 34
    .line 35
    const/4 v8, 0x5

    .line 36
    if-ne v6, v8, :cond_0

    .line 37
    .line 38
    :cond_2
    move v6, v2

    .line 39
    :goto_0
    :try_start_1
    const-string v8, "level"

    .line 40
    .line 41
    invoke-virtual {v5, v8, v7}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 42
    .line 43
    .line 44
    move-result v8

    .line 45
    const-string v9, "scale"

    .line 46
    .line 47
    invoke-virtual {v5, v9, v7}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 48
    .line 49
    .line 50
    move-result v5

    .line 51
    if-eq v8, v7, :cond_5

    .line 52
    .line 53
    if-ne v5, v7, :cond_3

    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_3
    int-to-float v7, v8

    .line 57
    int-to-float v5, v5

    .line 58
    div-float/2addr v7, v5

    .line 59
    invoke-static {v7}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 60
    .line 61
    .line 62
    move-result-object v5
    :try_end_1
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_1

    .line 63
    goto :goto_2

    .line 64
    :catch_0
    :cond_4
    move v6, v3

    .line 65
    :catch_1
    :cond_5
    :goto_1
    move-object v5, v4

    .line 66
    :goto_2
    if-eqz v5, :cond_6

    .line 67
    .line 68
    invoke-virtual {v5}, Ljava/lang/Float;->doubleValue()D

    .line 69
    .line 70
    .line 71
    move-result-wide v7

    .line 72
    invoke-static {v7, v8}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 73
    .line 74
    .line 75
    move-result-object v4

    .line 76
    :cond_6
    if-eqz v6, :cond_9

    .line 77
    .line 78
    if-nez v5, :cond_7

    .line 79
    .line 80
    goto :goto_3

    .line 81
    :cond_7
    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    .line 82
    .line 83
    .line 84
    move-result v5

    .line 85
    float-to-double v5, v5

    .line 86
    const-wide v7, 0x3fefae147ae147aeL    # 0.99

    .line 87
    .line 88
    .line 89
    .line 90
    .line 91
    cmpg-double v5, v5, v7

    .line 92
    .line 93
    if-gez v5, :cond_8

    .line 94
    .line 95
    move v5, v1

    .line 96
    goto :goto_4

    .line 97
    :cond_8
    const/4 v5, 0x3

    .line 98
    goto :goto_4

    .line 99
    :cond_9
    :goto_3
    move v5, v2

    .line 100
    :goto_4
    invoke-static {}, Lml;->t()Z

    .line 101
    .line 102
    .line 103
    move-result v6

    .line 104
    const/16 v7, 0x8

    .line 105
    .line 106
    if-eqz v6, :cond_a

    .line 107
    .line 108
    goto :goto_5

    .line 109
    :cond_a
    const-string v6, "sensor"

    .line 110
    .line 111
    invoke-virtual {v0, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    move-result-object v6

    .line 115
    check-cast v6, Landroid/hardware/SensorManager;

    .line 116
    .line 117
    invoke-virtual {v6, v7}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    .line 118
    .line 119
    .line 120
    move-result-object v6

    .line 121
    if-eqz v6, :cond_b

    .line 122
    .line 123
    move v3, v2

    .line 124
    :cond_b
    :goto_5
    invoke-static {v0}, Lml;->c(Landroid/content/Context;)J

    .line 125
    .line 126
    .line 127
    move-result-wide v8

    .line 128
    new-instance v6, Landroid/app/ActivityManager$MemoryInfo;

    .line 129
    .line 130
    invoke-direct {v6}, Landroid/app/ActivityManager$MemoryInfo;-><init>()V

    .line 131
    .line 132
    .line 133
    const-string v10, "activity"

    .line 134
    .line 135
    invoke-virtual {v0, v10}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    check-cast v0, Landroid/app/ActivityManager;

    .line 140
    .line 141
    invoke-virtual {v0, v6}, Landroid/app/ActivityManager;->getMemoryInfo(Landroid/app/ActivityManager$MemoryInfo;)V

    .line 142
    .line 143
    .line 144
    iget-wide v10, v6, Landroid/app/ActivityManager$MemoryInfo;->availMem:J

    .line 145
    .line 146
    sub-long/2addr v8, v10

    .line 147
    const-wide/16 v10, 0x0

    .line 148
    .line 149
    cmp-long v0, v8, v10

    .line 150
    .line 151
    if-lez v0, :cond_c

    .line 152
    .line 153
    goto :goto_6

    .line 154
    :cond_c
    move-wide v8, v10

    .line 155
    :goto_6
    invoke-static {}, Landroid/os/Environment;->getDataDirectory()Ljava/io/File;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    new-instance v6, Landroid/os/StatFs;

    .line 164
    .line 165
    invoke-direct {v6, v0}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    .line 166
    .line 167
    .line 168
    invoke-virtual {v6}, Landroid/os/StatFs;->getBlockSize()I

    .line 169
    .line 170
    .line 171
    move-result v0

    .line 172
    int-to-long v10, v0

    .line 173
    invoke-virtual {v6}, Landroid/os/StatFs;->getBlockCount()I

    .line 174
    .line 175
    .line 176
    move-result v0

    .line 177
    int-to-long v12, v0

    .line 178
    mul-long/2addr v12, v10

    .line 179
    invoke-virtual {v6}, Landroid/os/StatFs;->getAvailableBlocks()I

    .line 180
    .line 181
    .line 182
    move-result v0

    .line 183
    int-to-long v14, v0

    .line 184
    mul-long/2addr v10, v14

    .line 185
    sub-long/2addr v12, v10

    .line 186
    new-instance v0, Lyd;

    .line 187
    .line 188
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 189
    .line 190
    .line 191
    iput-object v4, v0, Lyd;->a:Ljava/lang/Double;

    .line 192
    .line 193
    iput v5, v0, Lyd;->b:I

    .line 194
    .line 195
    iget-byte v4, v0, Lyd;->g:B

    .line 196
    .line 197
    or-int/2addr v2, v4

    .line 198
    int-to-byte v2, v2

    .line 199
    iput-boolean v3, v0, Lyd;->c:Z

    .line 200
    .line 201
    or-int/2addr v1, v2

    .line 202
    int-to-byte v1, v1

    .line 203
    move/from16 v2, p1

    .line 204
    .line 205
    iput v2, v0, Lyd;->d:I

    .line 206
    .line 207
    or-int/lit8 v1, v1, 0x4

    .line 208
    .line 209
    int-to-byte v1, v1

    .line 210
    iput-wide v8, v0, Lyd;->e:J

    .line 211
    .line 212
    or-int/2addr v1, v7

    .line 213
    int-to-byte v1, v1

    .line 214
    iput-wide v12, v0, Lyd;->f:J

    .line 215
    .line 216
    or-int/lit8 v1, v1, 0x10

    .line 217
    .line 218
    int-to-byte v1, v1

    .line 219
    iput-byte v1, v0, Lyd;->g:B

    .line 220
    .line 221
    invoke-virtual {v0}, Lyd;->a()Lzd;

    .line 222
    .line 223
    .line 224
    move-result-object v0

    .line 225
    return-object v0
.end method
