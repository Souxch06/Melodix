.class public final Lcom/melodix/music/WebService;
.super Landroidx/media/MediaBrowserServiceCompat;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/melodix/music/WebService$MediaActionReceiver;
    }
.end annotation


# static fields
.field public static A:J = 0x0L

.field public static B:Landroid/graphics/Bitmap; = null

.field public static C:I = 0x7f080125

.field public static D:I = 0x7f08012a

.field public static final E:Ljava/util/concurrent/ConcurrentHashMap;

.field public static final F:Ljava/util/concurrent/ConcurrentHashMap;

.field public static G:Lcom/melodix/music/WebService; = null

.field public static r:Z = false

.field public static resumePlaybackOnRecovery:Z = false

.field public static s:Z = false

.field public static t:Z = true

.field public static u:Ljava/lang/String; = "No Artist"

.field public static v:Ljava/lang/String; = "No Track"

.field public static w:Ljava/lang/String; = "false"

.field public static x:Ljava/lang/String; = "false"

.field public static y:J

.field public static z:J


# instance fields
.field public j:Landroid/support/v4/media/session/MediaSessionCompat;

.field public k:Landroid/os/PowerManager$WakeLock;

.field public l:Landroid/media/AudioManager;

.field public m:Lbj1;

.field public n:Landroid/os/HandlerThread;

.field public o:Lc7;

.field public p:Z

.field public q:Ljava/lang/String;

.field private cleanedUp:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/melodix/music/WebService;->E:Ljava/util/concurrent/ConcurrentHashMap;

    .line 7
    .line 8
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/melodix/music/WebService;->F:Ljava/util/concurrent/ConcurrentHashMap;

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroidx/media/MediaBrowserServiceCompat;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/melodix/music/WebService;->p:Z

    .line 6
    .line 7
    return-void
.end method

.method public static c(Ljava/lang/String;Ljava/lang/String;)Landroid/support/v4/media/MediaBrowserCompat$MediaItem;
    .locals 3

    .line 1
    new-instance v0, Landroid/os/Bundle;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "android.media.browse.CONTENT_STYLE_BROWSABLE_HINT"

    .line 7
    .line 8
    const/4 v2, 0x2

    .line 9
    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 10
    .line 11
    .line 12
    const-string v1, "android.media.browse.CONTENT_STYLE_PLAYABLE_HINT"

    .line 13
    .line 14
    const/4 v2, 0x1

    .line 15
    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 16
    .line 17
    .line 18
    new-instance v1, Landroid/support/v4/media/MediaDescriptionCompat$Builder;

    .line 19
    .line 20
    invoke-direct {v1}, Landroid/support/v4/media/MediaDescriptionCompat$Builder;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1, p0}, Landroid/support/v4/media/MediaDescriptionCompat$Builder;->setMediaId(Ljava/lang/String;)Landroid/support/v4/media/MediaDescriptionCompat$Builder;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0, p1}, Landroid/support/v4/media/MediaDescriptionCompat$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/support/v4/media/MediaDescriptionCompat$Builder;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0, v0}, Landroid/support/v4/media/MediaDescriptionCompat$Builder;->setExtras(Landroid/os/Bundle;)Landroid/support/v4/media/MediaDescriptionCompat$Builder;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p0}, Landroid/support/v4/media/MediaDescriptionCompat$Builder;->build()Landroid/support/v4/media/MediaDescriptionCompat;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    new-instance p1, Landroid/support/v4/media/MediaBrowserCompat$MediaItem;

    .line 40
    .line 41
    invoke-direct {p1, p0, v2}, Landroid/support/v4/media/MediaBrowserCompat$MediaItem;-><init>(Landroid/support/v4/media/MediaDescriptionCompat;I)V

    .line 42
    .line 43
    .line 44
    return-object p1
.end method

.method public static i(I)Z
    .locals 2

    .line 1
    const/16 v0, 0xb

    .line 2
    .line 3
    if-eq p0, v0, :cond_2

    .line 4
    .line 5
    const/16 v0, 0xc

    .line 6
    .line 7
    if-eq p0, v0, :cond_2

    .line 8
    .line 9
    const/16 v0, 0x13

    .line 10
    .line 11
    if-eq p0, v0, :cond_2

    .line 12
    .line 13
    const/16 v0, 0x16

    .line 14
    .line 15
    if-eq p0, v0, :cond_2

    .line 16
    .line 17
    packed-switch p0, :pswitch_data_0

    .line 18
    .line 19
    .line 20
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 21
    .line 22
    const/16 v1, 0x1f

    .line 23
    .line 24
    if-lt v0, v1, :cond_0

    .line 25
    .line 26
    const/16 v1, 0x1a

    .line 27
    .line 28
    if-eq p0, v1, :cond_2

    .line 29
    .line 30
    const/16 v1, 0x1b

    .line 31
    .line 32
    if-eq p0, v1, :cond_2

    .line 33
    .line 34
    const/16 v1, 0x1e

    .line 35
    .line 36
    if-ne p0, v1, :cond_0

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    const/16 v1, 0x1c

    .line 40
    .line 41
    if-lt v0, v1, :cond_1

    .line 42
    .line 43
    const/16 v0, 0x17

    .line 44
    .line 45
    if-ne p0, v0, :cond_1

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_1
    const/4 p0, 0x0

    .line 49
    return p0

    .line 50
    :cond_2
    :goto_0
    :pswitch_0
    const/4 p0, 0x1

    .line 51
    return p0

    .line 52
    nop

    .line 53
    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public final a()V
    .locals 3

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/melodix/music/WebService;->k:Landroid/os/PowerManager$WakeLock;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    const-string v2, "mWakeLock"

    .line 7
    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    :try_start_1
    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_2

    .line 15
    .line 16
    iget-object p0, p0, Lcom/melodix/music/WebService;->k:Landroid/os/PowerManager$WakeLock;

    .line 17
    .line 18
    if-eqz p0, :cond_0

    .line 19
    .line 20
    const-wide/32 v0, 0x36ee80

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, v0, v1}, Landroid/os/PowerManager$WakeLock;->acquire(J)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    invoke-static {v2}, Ldl1;->p(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    throw v1

    .line 31
    :cond_1
    invoke-static {v2}, Ldl1;->p(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    throw v1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 35
    :catch_0
    :cond_2
    return-void
.end method

.method public final b()Landroid/app/Notification;
    .locals 4

    .line 1
    :try_start_0
    invoke-virtual {p0}, Lcom/melodix/music/WebService;->d()Landroid/app/Notification;

    .line 2
    .line 3
    .line 4
    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    return-object p0

    .line 6
    :catchall_0
    new-instance v0, Lgq0;

    .line 7
    .line 8
    const-string v1, "SpotifuckChannel"

    .line 9
    .line 10
    invoke-direct {v0, p0, v1}, Lgq0;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    sget-object v1, Lcom/melodix/music/WebService;->v:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-lez v1, :cond_0

    .line 20
    .line 21
    sget-object v1, Lcom/melodix/music/WebService;->v:Ljava/lang/String;

    .line 22
    .line 23
    const-string v2, "No Track"

    .line 24
    .line 25
    invoke-static {v1, v2}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-nez v1, :cond_0

    .line 30
    .line 31
    sget-object v1, Lcom/melodix/music/WebService;->v:Ljava/lang/String;

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    const v1, 0x7f110112

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 42
    .line 43
    .line 44
    :goto_0
    invoke-static {v1}, Lgq0;->b(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    iput-object v1, v0, Lgq0;->e:Ljava/lang/CharSequence;

    .line 49
    .line 50
    sget-object v1, Lcom/melodix/music/WebService;->u:Ljava/lang/String;

    .line 51
    .line 52
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    if-lez v1, :cond_1

    .line 57
    .line 58
    sget-object v1, Lcom/melodix/music/WebService;->u:Ljava/lang/String;

    .line 59
    .line 60
    const-string v2, "No Artist"

    .line 61
    .line 62
    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    if-nez v1, :cond_1

    .line 67
    .line 68
    sget-object v1, Lcom/melodix/music/WebService;->u:Ljava/lang/String;

    .line 69
    .line 70
    goto :goto_1

    .line 71
    :cond_1
    const v1, 0x7f110111

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 79
    .line 80
    .line 81
    :goto_1
    invoke-static {v1}, Lgq0;->b(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    iput-object v1, v0, Lgq0;->f:Ljava/lang/CharSequence;

    .line 86
    .line 87
    const v1, 0x7f080128

    .line 88
    .line 89
    .line 90
    iget-object v2, v0, Lgq0;->q:Landroid/app/Notification;

    .line 91
    .line 92
    iput v1, v2, Landroid/app/Notification;->icon:I

    .line 93
    .line 94
    new-instance v1, Landroid/content/Intent;

    .line 95
    .line 96
    const-class v2, Lcom/melodix/music/MainActivity;

    .line 97
    .line 98
    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 99
    .line 100
    .line 101
    const/4 v2, 0x0

    .line 102
    const/high16 v3, 0xc000000

    .line 103
    .line 104
    invoke-static {p0, v2, v1, v3}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    iput-object p0, v0, Lgq0;->g:Landroid/app/PendingIntent;

    .line 109
    .line 110
    const/4 p0, 0x2

    .line 111
    invoke-virtual {v0, p0}, Lgq0;->c(I)V

    .line 112
    .line 113
    .line 114
    const/4 p0, -0x1

    .line 115
    iput p0, v0, Lgq0;->i:I

    .line 116
    .line 117
    invoke-virtual {v0}, Lgq0;->a()Landroid/app/Notification;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 122
    .line 123
    .line 124
    return-object p0
.end method

.method public final d()Landroid/app/Notification;
    .locals 12

    .line 1
    new-instance v0, Lgq0;

    .line 2
    .line 3
    const-string v1, "SpotifuckChannel"

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Lgq0;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, v0, Lgq0;->b:Ljava/util/ArrayList;

    .line 9
    .line 10
    const v2, 0x7f080128

    .line 11
    .line 12
    .line 13
    iget-object v3, v0, Lgq0;->q:Landroid/app/Notification;

    .line 14
    .line 15
    iput v2, v3, Landroid/app/Notification;->icon:I

    .line 16
    .line 17
    sget-boolean v2, Lcom/melodix/music/AppSingleton;->F:Z

    .line 18
    .line 19
    if-eqz v2, :cond_0

    .line 20
    .line 21
    sget-object v2, Lcom/melodix/music/WebService;->v:Ljava/lang/String;

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const v2, 0x7f110112

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 32
    .line 33
    .line 34
    :goto_0
    invoke-static {v2}, Lgq0;->b(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    iput-object v2, v0, Lgq0;->e:Ljava/lang/CharSequence;

    .line 39
    .line 40
    sget-boolean v2, Lcom/melodix/music/AppSingleton;->F:Z

    .line 41
    .line 42
    if-eqz v2, :cond_1

    .line 43
    .line 44
    sget-object v2, Lcom/melodix/music/WebService;->u:Ljava/lang/String;

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_1
    const v2, 0x7f110111

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 55
    .line 56
    .line 57
    :goto_1
    invoke-static {v2}, Lgq0;->b(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    iput-object v2, v0, Lgq0;->f:Ljava/lang/CharSequence;

    .line 62
    .line 63
    sget-object v2, Lcom/melodix/music/WebService;->B:Landroid/graphics/Bitmap;

    .line 64
    .line 65
    const/4 v3, 0x1

    .line 66
    if-nez v2, :cond_2

    .line 67
    .line 68
    const/4 v2, 0x0

    .line 69
    goto :goto_3

    .line 70
    :cond_2
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 71
    .line 72
    const/16 v5, 0x1b

    .line 73
    .line 74
    if-lt v4, v5, :cond_3

    .line 75
    .line 76
    goto :goto_2

    .line 77
    :cond_3
    iget-object v4, v0, Lgq0;->a:Landroid/content/Context;

    .line 78
    .line 79
    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 80
    .line 81
    .line 82
    move-result-object v4

    .line 83
    const v5, 0x7f07005c

    .line 84
    .line 85
    .line 86
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 87
    .line 88
    .line 89
    move-result v5

    .line 90
    const v6, 0x7f07005b

    .line 91
    .line 92
    .line 93
    invoke-virtual {v4, v6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 94
    .line 95
    .line 96
    move-result v4

    .line 97
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    .line 98
    .line 99
    .line 100
    move-result v6

    .line 101
    if-gt v6, v5, :cond_4

    .line 102
    .line 103
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    .line 104
    .line 105
    .line 106
    move-result v6

    .line 107
    if-gt v6, v4, :cond_4

    .line 108
    .line 109
    goto :goto_2

    .line 110
    :cond_4
    int-to-double v5, v5

    .line 111
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    .line 112
    .line 113
    .line 114
    move-result v7

    .line 115
    invoke-static {v3, v7}, Ljava/lang/Math;->max(II)I

    .line 116
    .line 117
    .line 118
    move-result v7

    .line 119
    int-to-double v7, v7

    .line 120
    div-double/2addr v5, v7

    .line 121
    int-to-double v7, v4

    .line 122
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    .line 123
    .line 124
    .line 125
    move-result v4

    .line 126
    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    .line 127
    .line 128
    .line 129
    move-result v4

    .line 130
    int-to-double v9, v4

    .line 131
    div-double/2addr v7, v9

    .line 132
    invoke-static {v5, v6, v7, v8}, Ljava/lang/Math;->min(DD)D

    .line 133
    .line 134
    .line 135
    move-result-wide v4

    .line 136
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    .line 137
    .line 138
    .line 139
    move-result v6

    .line 140
    int-to-double v6, v6

    .line 141
    mul-double/2addr v6, v4

    .line 142
    invoke-static {v6, v7}, Ljava/lang/Math;->ceil(D)D

    .line 143
    .line 144
    .line 145
    move-result-wide v6

    .line 146
    double-to-int v6, v6

    .line 147
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    .line 148
    .line 149
    .line 150
    move-result v7

    .line 151
    int-to-double v7, v7

    .line 152
    mul-double/2addr v7, v4

    .line 153
    invoke-static {v7, v8}, Ljava/lang/Math;->ceil(D)D

    .line 154
    .line 155
    .line 156
    move-result-wide v4

    .line 157
    double-to-int v4, v4

    .line 158
    invoke-static {v2, v6, v4, v3}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    .line 159
    .line 160
    .line 161
    move-result-object v2

    .line 162
    :goto_2
    sget-object v4, Landroidx/core/graphics/drawable/IconCompat;->k:Landroid/graphics/PorterDuff$Mode;

    .line 163
    .line 164
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 165
    .line 166
    .line 167
    new-instance v4, Landroidx/core/graphics/drawable/IconCompat;

    .line 168
    .line 169
    invoke-direct {v4, v3}, Landroidx/core/graphics/drawable/IconCompat;-><init>(I)V

    .line 170
    .line 171
    .line 172
    iput-object v2, v4, Landroidx/core/graphics/drawable/IconCompat;->b:Ljava/lang/Object;

    .line 173
    .line 174
    move-object v2, v4

    .line 175
    :goto_3
    iput-object v2, v0, Lgq0;->h:Landroidx/core/graphics/drawable/IconCompat;

    .line 176
    .line 177
    new-instance v2, Landroid/content/Intent;

    .line 178
    .line 179
    const-class v4, Lcom/melodix/music/MainActivity;

    .line 180
    .line 181
    invoke-direct {v2, p0, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 182
    .line 183
    .line 184
    const/4 v4, 0x0

    .line 185
    const/high16 v5, 0xc000000

    .line 186
    .line 187
    invoke-static {p0, v4, v2, v5}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    .line 188
    .line 189
    .line 190
    move-result-object v2

    .line 191
    iput-object v2, v0, Lgq0;->g:Landroid/app/PendingIntent;

    .line 192
    .line 193
    iput v3, v0, Lgq0;->n:I

    .line 194
    .line 195
    const/4 v2, -0x1

    .line 196
    iput v2, v0, Lgq0;->i:I

    .line 197
    .line 198
    const/4 v2, 0x2

    .line 199
    invoke-virtual {v0, v2}, Lgq0;->c(I)V

    .line 200
    .line 201
    .line 202
    sget-boolean v6, Lcom/melodix/music/AppSingleton;->F:Z

    .line 203
    .line 204
    if-eqz v6, :cond_8

    .line 205
    .line 206
    :try_start_0
    new-instance v6, Laq0;

    .line 207
    .line 208
    const-string v7, "Previous"

    .line 209
    .line 210
    const-wide/16 v8, 0x10

    .line 211
    .line 212
    invoke-static {p0, v8, v9}, Landroidx/media/session/MediaButtonReceiver;->buildMediaButtonPendingIntent(Landroid/content/Context;J)Landroid/app/PendingIntent;

    .line 213
    .line 214
    .line 215
    move-result-object v8

    .line 216
    const v9, 0x7f080124

    .line 217
    .line 218
    .line 219
    invoke-direct {v6, v9, v8, v7}, Laq0;-><init>(ILandroid/app/PendingIntent;Ljava/lang/String;)V

    .line 220
    .line 221
    .line 222
    invoke-virtual {v6}, Laq0;->a()Lbq0;

    .line 223
    .line 224
    .line 225
    move-result-object v6

    .line 226
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 227
    .line 228
    .line 229
    new-instance v6, Laq0;

    .line 230
    .line 231
    sget-boolean v7, Lcom/melodix/music/WebService;->s:Z

    .line 232
    .line 233
    if-eqz v7, :cond_5

    .line 234
    .line 235
    const v7, 0x7f080121

    .line 236
    .line 237
    .line 238
    goto :goto_4

    .line 239
    :cond_5
    const v7, 0x7f080122

    .line 240
    .line 241
    .line 242
    :goto_4
    const-string v8, "Play/Pause"

    .line 243
    .line 244
    const-wide/16 v9, 0x200

    .line 245
    .line 246
    invoke-static {p0, v9, v10}, Landroidx/media/session/MediaButtonReceiver;->buildMediaButtonPendingIntent(Landroid/content/Context;J)Landroid/app/PendingIntent;

    .line 247
    .line 248
    .line 249
    move-result-object v9

    .line 250
    invoke-direct {v6, v7, v9, v8}, Laq0;-><init>(ILandroid/app/PendingIntent;Ljava/lang/String;)V

    .line 251
    .line 252
    .line 253
    invoke-virtual {v6}, Laq0;->a()Lbq0;

    .line 254
    .line 255
    .line 256
    move-result-object v6

    .line 257
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 258
    .line 259
    .line 260
    new-instance v6, Laq0;

    .line 261
    .line 262
    const-string v7, "Next"

    .line 263
    .line 264
    const-wide/16 v8, 0x20

    .line 265
    .line 266
    invoke-static {p0, v8, v9}, Landroidx/media/session/MediaButtonReceiver;->buildMediaButtonPendingIntent(Landroid/content/Context;J)Landroid/app/PendingIntent;

    .line 267
    .line 268
    .line 269
    move-result-object v8

    .line 270
    const v9, 0x7f080113

    .line 271
    .line 272
    .line 273
    invoke-direct {v6, v9, v8, v7}, Laq0;-><init>(ILandroid/app/PendingIntent;Ljava/lang/String;)V

    .line 274
    .line 275
    .line 276
    invoke-virtual {v6}, Laq0;->a()Lbq0;

    .line 277
    .line 278
    .line 279
    move-result-object v6

    .line 280
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 281
    .line 282
    .line 283
    new-instance v6, Laq0;

    .line 284
    .line 285
    sget-boolean v7, Lcom/melodix/music/WebService;->t:Z

    .line 286
    .line 287
    if-eqz v7, :cond_6

    .line 288
    .line 289
    const v7, 0x7f0800aa

    .line 290
    .line 291
    .line 292
    goto :goto_5

    .line 293
    :cond_6
    const v7, 0x7f0800a9

    .line 294
    .line 295
    .line 296
    :goto_5
    const-string v8, "Favorite"

    .line 297
    .line 298
    new-instance v9, Landroid/content/Intent;

    .line 299
    .line 300
    const-class v10, Lcom/melodix/music/WebService$MediaActionReceiver;

    .line 301
    .line 302
    invoke-direct {v9, p0, v10}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 303
    .line 304
    .line 305
    const-string v11, "ADDTOFAV_ACTION"

    .line 306
    .line 307
    invoke-virtual {v9, v11}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 308
    .line 309
    .line 310
    move-result-object v9

    .line 311
    invoke-static {p0, v3, v9, v5}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    .line 312
    .line 313
    .line 314
    move-result-object v9

    .line 315
    invoke-direct {v6, v7, v9, v8}, Laq0;-><init>(ILandroid/app/PendingIntent;Ljava/lang/String;)V

    .line 316
    .line 317
    .line 318
    invoke-virtual {v6}, Laq0;->a()Lbq0;

    .line 319
    .line 320
    .line 321
    move-result-object v6

    .line 322
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 323
    .line 324
    .line 325
    new-instance v6, Laq0;

    .line 326
    .line 327
    sget v7, Lcom/melodix/music/WebService;->C:I

    .line 328
    .line 329
    const-string v8, "Repeat"

    .line 330
    .line 331
    new-instance v9, Landroid/content/Intent;

    .line 332
    .line 333
    invoke-direct {v9, p0, v10}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 334
    .line 335
    .line 336
    const-string v10, "REPEAT_ACTION"

    .line 337
    .line 338
    invoke-virtual {v9, v10}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 339
    .line 340
    .line 341
    move-result-object v9

    .line 342
    invoke-static {p0, v3, v9, v5}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    .line 343
    .line 344
    .line 345
    move-result-object v5

    .line 346
    invoke-direct {v6, v7, v5, v8}, Laq0;-><init>(ILandroid/app/PendingIntent;Ljava/lang/String;)V

    .line 347
    .line 348
    .line 349
    invoke-virtual {v6}, Laq0;->a()Lbq0;

    .line 350
    .line 351
    .line 352
    move-result-object v5

    .line 353
    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 354
    .line 355
    .line 356
    new-instance v1, Landroidx/media/app/NotificationCompat$MediaStyle;

    .line 357
    .line 358
    invoke-direct {v1}, Landroidx/media/app/NotificationCompat$MediaStyle;-><init>()V

    .line 359
    .line 360
    .line 361
    filled-new-array {v4, v3, v2}, [I

    .line 362
    .line 363
    .line 364
    move-result-object v2

    .line 365
    invoke-virtual {v1, v2}, Landroidx/media/app/NotificationCompat$MediaStyle;->setShowActionsInCompactView([I)Landroidx/media/app/NotificationCompat$MediaStyle;

    .line 366
    .line 367
    .line 368
    move-result-object v1

    .line 369
    iget-object p0, p0, Lcom/melodix/music/WebService;->j:Landroid/support/v4/media/session/MediaSessionCompat;

    .line 370
    .line 371
    if-eqz p0, :cond_7

    .line 372
    .line 373
    invoke-virtual {p0}, Landroid/support/v4/media/session/MediaSessionCompat;->getSessionToken()Landroid/support/v4/media/session/MediaSessionCompat$Token;

    .line 374
    .line 375
    .line 376
    move-result-object p0

    .line 377
    if-eqz p0, :cond_7

    .line 378
    .line 379
    invoke-virtual {v1, p0}, Landroidx/media/app/NotificationCompat$MediaStyle;->setMediaSession(Landroid/support/v4/media/session/MediaSessionCompat$Token;)Landroidx/media/app/NotificationCompat$MediaStyle;

    .line 380
    .line 381
    .line 382
    :cond_7
    iget-object p0, v0, Lgq0;->k:Lvq0;

    .line 383
    .line 384
    if-eq p0, v1, :cond_8

    .line 385
    .line 386
    iput-object v1, v0, Lgq0;->k:Lvq0;

    .line 387
    .line 388
    if-eqz v1, :cond_8

    .line 389
    .line 390
    invoke-virtual {v1, v0}, Lvq0;->setBuilder(Lgq0;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 391
    .line 392
    .line 393
    :catchall_0
    :cond_8
    invoke-virtual {v0}, Lgq0;->a()Landroid/app/Notification;

    .line 394
    .line 395
    .line 396
    move-result-object p0

    .line 397
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 398
    .line 399
    .line 400
    return-object p0
.end method

.method public final e()V
    .locals 4

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x1a

    .line 4
    .line 5
    if-lt v0, v1, :cond_1

    .line 6
    .line 7
    :try_start_0
    new-instance v0, Landroid/app/NotificationChannel;

    .line 8
    .line 9
    const v0, 0x7f110022

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-instance v1, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    const-string v0, " Background Service"

    .line 25
    .line 26
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const-string v1, "SpotifuckChannel"

    .line 34
    .line 35
    new-instance v2, Landroid/app/NotificationChannel;

    .line 36
    .line 37
    const/4 v3, 0x2

    .line 38
    invoke-direct {v2, v1, v0, v3}, Landroid/app/NotificationChannel;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;I)V

    .line 39
    .line 40
    .line 41
    const-string v0, "Spotifuck media playback controls"

    .line 42
    .line 43
    invoke-virtual {v2, v0}, Landroid/app/NotificationChannel;->setDescription(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    const/4 v0, 0x0

    .line 47
    invoke-virtual {v2, v0}, Landroid/app/NotificationChannel;->setShowBadge(Z)V

    .line 48
    .line 49
    .line 50
    const/4 v0, 0x1

    .line 51
    invoke-virtual {v2, v0}, Landroid/app/NotificationChannel;->setLockscreenVisibility(I)V

    .line 52
    .line 53
    .line 54
    const-string v0, "notification"

    .line 55
    .line 56
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    instance-of v0, p0, Landroid/app/NotificationManager;

    .line 61
    .line 62
    if-eqz v0, :cond_0

    .line 63
    .line 64
    check-cast p0, Landroid/app/NotificationManager;

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_0
    const/4 p0, 0x0

    .line 68
    :goto_0
    if-eqz p0, :cond_1

    .line 69
    .line 70
    invoke-virtual {p0, v2}, Landroid/app/NotificationManager;->createNotificationChannel(Landroid/app/NotificationChannel;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 71
    .line 72
    .line 73
    :catchall_0
    :cond_1
    return-void
.end method

.method public final f(ZZ)V
    .locals 0

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    if-eqz p1, :cond_1

    .line 6
    .line 7
    sget-boolean p1, Lcom/melodix/music/AppSingleton;->O:Z

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_1
    sget-boolean p1, Lcom/melodix/music/AppSingleton;->M:Z

    .line 11
    .line 12
    :goto_0
    if-eqz p1, :cond_2

    .line 13
    .line 14
    sget-boolean p1, Lcom/melodix/music/WebService;->s:Z

    .line 15
    .line 16
    if-eqz p1, :cond_2

    .line 17
    .line 18
    :try_start_0
    iget-object p0, p0, Lcom/melodix/music/WebService;->j:Landroid/support/v4/media/session/MediaSessionCompat;

    .line 19
    .line 20
    if-eqz p0, :cond_2

    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/support/v4/media/session/MediaSessionCompat;->getController()Landroid/support/v4/media/session/MediaControllerCompat;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    if-eqz p0, :cond_2

    .line 27
    .line 28
    invoke-virtual {p0}, Landroid/support/v4/media/session/MediaControllerCompat;->getTransportControls()Landroid/support/v4/media/session/MediaControllerCompat$TransportControls;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    if-eqz p0, :cond_2

    .line 33
    .line 34
    invoke-virtual {p0}, Landroid/support/v4/media/session/MediaControllerCompat$TransportControls;->pause()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 35
    .line 36
    .line 37
    :catchall_0
    :cond_2
    return-void
.end method

.method public final g(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    sget-boolean p1, Lcom/melodix/music/AppSingleton;->N:Z

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    sget-boolean p1, Lcom/melodix/music/AppSingleton;->L:Z

    .line 7
    .line 8
    :goto_0
    if-eqz p1, :cond_1

    .line 9
    .line 10
    sget-boolean p1, Lcom/melodix/music/WebService;->s:Z

    .line 11
    .line 12
    if-nez p1, :cond_1

    .line 13
    .line 14
    :try_start_0
    iget-object p0, p0, Lcom/melodix/music/WebService;->j:Landroid/support/v4/media/session/MediaSessionCompat;

    .line 15
    .line 16
    if-eqz p0, :cond_1

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/support/v4/media/session/MediaSessionCompat;->getController()Landroid/support/v4/media/session/MediaControllerCompat;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    if-eqz p0, :cond_1

    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/support/v4/media/session/MediaControllerCompat;->getTransportControls()Landroid/support/v4/media/session/MediaControllerCompat$TransportControls;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    if-eqz p0, :cond_1

    .line 29
    .line 30
    invoke-virtual {p0}, Landroid/support/v4/media/session/MediaControllerCompat$TransportControls;->play()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    .line 32
    .line 33
    :catchall_0
    :cond_1
    return-void
.end method

.method public final h()Z
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    iget-object p0, p0, Lcom/melodix/music/WebService;->l:Landroid/media/AudioManager;

    .line 3
    .line 4
    if-eqz p0, :cond_1

    .line 5
    .line 6
    const/4 v1, 0x2

    .line 7
    invoke-virtual {p0, v1}, Landroid/media/AudioManager;->getDevices(I)[Landroid/media/AudioDeviceInfo;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    array-length v1, p0

    .line 14
    move v2, v0

    .line 15
    :goto_0
    if-ge v2, v1, :cond_1

    .line 16
    .line 17
    aget-object v3, p0, v2

    .line 18
    .line 19
    invoke-virtual {v3}, Landroid/media/AudioDeviceInfo;->getType()I

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    invoke-static {v3}, Lcom/melodix/music/WebService;->i(I)Z

    .line 24
    .line 25
    .line 26
    move-result v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    if-eqz v3, :cond_0

    .line 28
    .line 29
    const/4 p0, 0x1

    .line 30
    return p0

    .line 31
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :catchall_0
    :cond_1
    return v0
.end method

.method public final j()V
    .locals 3

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/melodix/music/WebService;->k:Landroid/os/PowerManager$WakeLock;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    const-string v2, "mWakeLock"

    .line 7
    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    :try_start_1
    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_2

    .line 15
    .line 16
    iget-object p0, p0, Lcom/melodix/music/WebService;->k:Landroid/os/PowerManager$WakeLock;

    .line 17
    .line 18
    if-eqz p0, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    invoke-static {v2}, Ldl1;->p(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    throw v1

    .line 28
    :cond_1
    invoke-static {v2}, Ldl1;->p(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    throw v1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 32
    :catch_0
    :cond_2
    return-void
.end method

.method public final k()V
    .locals 2

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/melodix/music/WebService;->j:Landroid/support/v4/media/session/MediaSessionCompat;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/support/v4/media/session/MediaSessionCompat;->isActive()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_1

    .line 12
    :cond_0
    new-instance v0, Landroid/support/v4/media/session/MediaSessionCompat;

    .line 13
    .line 14
    const v1, 0x7f110022

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-direct {v0, p0, v1}, Landroid/support/v4/media/session/MediaSessionCompat;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    const/4 v1, 0x3

    .line 25
    invoke-virtual {v0, v1}, Landroid/support/v4/media/session/MediaSessionCompat;->setFlags(I)V

    .line 26
    .line 27
    .line 28
    new-instance v1, Laj1;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Laj1;-><init>(Lcom/melodix/music/WebService;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, v1}, Landroid/support/v4/media/session/MediaSessionCompat;->setCallback(Landroid/support/v4/media/session/MediaSessionCompat$Callback;)V

    .line 34
    .line 35
    .line 36
    const/4 v1, 0x1

    .line 37
    invoke-virtual {v0, v1}, Landroid/support/v4/media/session/MediaSessionCompat;->setActive(Z)V

    .line 38
    .line 39
    .line 40
    iput-object v0, p0, Lcom/melodix/music/WebService;->j:Landroid/support/v4/media/session/MediaSessionCompat;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 41
    .line 42
    :try_start_1
    invoke-virtual {p0}, Landroidx/media/MediaBrowserServiceCompat;->getSessionToken()Landroid/support/v4/media/session/MediaSessionCompat$Token;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    if-nez v0, :cond_2

    .line 47
    .line 48
    iget-object v0, p0, Lcom/melodix/music/WebService;->j:Landroid/support/v4/media/session/MediaSessionCompat;

    .line 49
    .line 50
    if-eqz v0, :cond_1

    .line 51
    .line 52
    invoke-virtual {v0}, Landroid/support/v4/media/session/MediaSessionCompat;->getSessionToken()Landroid/support/v4/media/session/MediaSessionCompat$Token;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    goto :goto_0

    .line 57
    :cond_1
    const/4 v0, 0x0

    .line 58
    :goto_0
    invoke-virtual {p0, v0}, Landroidx/media/MediaBrowserServiceCompat;->setSessionToken(Landroid/support/v4/media/session/MediaSessionCompat$Token;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 59
    .line 60
    .line 61
    :catchall_0
    :cond_2
    const/4 p0, 0x0

    .line 62
    :try_start_2
    invoke-static {p0}, Lzi1;->b(Z)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 63
    .line 64
    .line 65
    :catchall_1
    :goto_1
    return-void
.end method

.method public static completeAndClearPendingResults()V
    .locals 4

    sget-object v0, Lu00;->j:Lu00;
    sget-object v1, Lcom/melodix/music/WebService;->E:Ljava/util/concurrent/ConcurrentHashMap;
    if-eqz v1, :drain_search_map
    invoke-virtual {v1}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;
    move-result-object v2
    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;
    move-result-object v2
    :loop_browse
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z
    move-result v3
    if-eqz v3, :done_browse
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Landroidx/media/MediaBrowserServiceCompat$Result;
    if-eqz v3, :loop_browse
    :try_start_b
    invoke-virtual {v3, v0}, Landroidx/media/MediaBrowserServiceCompat$Result;->sendResult(Ljava/lang/Object;)V
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_b
    goto :loop_browse
    :catch_b
    move-exception v3
    goto :loop_browse
    :done_browse
    invoke-virtual {v1}, Ljava/util/concurrent/ConcurrentHashMap;->clear()V

    :drain_search_map
    sget-object v1, Lcom/melodix/music/WebService;->F:Ljava/util/concurrent/ConcurrentHashMap;
    if-eqz v1, :drain_done
    invoke-virtual {v1}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;
    move-result-object v2
    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;
    move-result-object v2
    :loop_search
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z
    move-result v3
    if-eqz v3, :done_search
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Landroidx/media/MediaBrowserServiceCompat$Result;
    if-eqz v3, :loop_search
    :try_start_s
    invoke-virtual {v3, v0}, Landroidx/media/MediaBrowserServiceCompat$Result;->sendResult(Ljava/lang/Object;)V
    :try_end_s
    .catch Ljava/lang/Exception; {:try_start_s .. :try_end_s} :catch_s
    goto :loop_search
    :catch_s
    move-exception v3
    goto :loop_search
    :done_search
    invoke-virtual {v1}, Ljava/util/concurrent/ConcurrentHashMap;->clear()V

    :drain_done
    return-void
.end method

.method public final l()V
    .locals 5

    iget-boolean v0, p0, Lcom/melodix/music/WebService;->cleanedUp:Z
    if-nez v0, :already_cleaned
    const/4 v0, 0x1
    iput-boolean v0, p0, Lcom/melodix/music/WebService;->cleanedUp:Z

    .line 1
    const/4 v0, 0x0

    .line 2
    sput-boolean v0, Lcom/melodix/music/WebService;->r:Z

    .line 3
    .line 4
    sput-boolean v0, Lcom/melodix/music/WebService;->s:Z

    .line 5
    .line 6
    iget-object v1, p0, Lcom/melodix/music/WebService;->k:Landroid/os/PowerManager$WakeLock;

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    if-eqz v1, :cond_1

    .line 10
    .line 11
    invoke-virtual {v1}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    iget-object v1, p0, Lcom/melodix/music/WebService;->k:Landroid/os/PowerManager$WakeLock;

    .line 18
    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    invoke-virtual {v1}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const-string p0, "mWakeLock"

    .line 26
    .line 27
    invoke-static {p0}, Ldl1;->p(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    throw v2

    .line 31
    :cond_1
    :goto_0
    iput-object v2, p0, Lcom/melodix/music/WebService;->k:Landroid/os/PowerManager$WakeLock;
    iget-object v1, p0, Lcom/melodix/music/WebService;->j:Landroid/support/v4/media/session/MediaSessionCompat;

    .line 32
    .line 33
    if-eqz v1, :cond_2

    .line 34
    .line 35
    invoke-virtual {v1, v2}, Landroid/support/v4/media/session/MediaSessionCompat;->setCallback(Landroid/support/v4/media/session/MediaSessionCompat$Callback;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v1, v0}, Landroid/support/v4/media/session/MediaSessionCompat;->setActive(Z)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v1}, Landroid/support/v4/media/session/MediaSessionCompat;->release()V

    .line 42
    .line 43
    .line 44
    :cond_2
    iput-object v2, p0, Lcom/melodix/music/WebService;->j:Landroid/support/v4/media/session/MediaSessionCompat;

    .line 45
    .line 46
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 47
    .line 48
    const/16 v3, 0x1a

    .line 49
    .line 50
    if-lt v1, v3, :cond_3

    .line 51
    .line 52
    iget-object v1, p0, Lcom/melodix/music/WebService;->l:Landroid/media/AudioManager;

    .line 53
    .line 54
    if-eqz v1, :cond_3

    .line 55
    .line 56
    iget-object v3, p0, Lcom/melodix/music/WebService;->m:Lbj1;

    .line 57
    .line 58
    if-eqz v3, :cond_3

    .line 59
    .line 60
    invoke-virtual {v1, v3}, Landroid/media/AudioManager;->unregisterAudioDeviceCallback(Landroid/media/AudioDeviceCallback;)V

    .line 61
    .line 62
    .line 63
    :cond_3
    iput-object v2, p0, Lcom/melodix/music/WebService;->m:Lbj1;
    iget-object v1, p0, Lcom/melodix/music/WebService;->n:Landroid/os/HandlerThread;

    .line 64
    .line 65
    if-eqz v1, :cond_4

    .line 66
    .line 67
    invoke-virtual {v1}, Landroid/os/HandlerThread;->quitSafely()Z

    .line 68
    .line 69
    .line 70
    :cond_4
    iput-object v2, p0, Lcom/melodix/music/WebService;->n:Landroid/os/HandlerThread;

    .line 71
    .line 72
    iget-object v1, p0, Lcom/melodix/music/WebService;->o:Lc7;

    .line 73
    .line 74
    if-eqz v1, :cond_5

    .line 75
    .line 76
    :try_start_0
    invoke-virtual {p0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 77
    .line 78
    .line 79
    :catch_0
    :cond_5
    iput-object v2, p0, Lcom/melodix/music/WebService;->o:Lc7;

    .line 80
    .line 81
    const/4 v1, 0x1

    .line 82
    invoke-static {p0, v1}, Ln41;->a(Landroid/app/Service;I)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p0}, Landroid/app/Service;->stopSelf()V

    .line 86
    .line 87
    .line 88
    sget-object v1, Lcom/melodix/music/AppSingleton;->t:Ljava/lang/ref/WeakReference;

    .line 89
    .line 90
    if-eqz v1, :cond_6

    .line 91
    .line 92
    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    check-cast v1, Lcom/melodix/music/MainActivity;

    .line 97
    .line 98
    goto :goto_1

    .line 99
    :cond_6
    move-object v1, v2

    .line 100
    :goto_1
    if-eqz v1, :cond_7

    .line 101
    .line 102
    invoke-virtual {v1}, Landroid/app/Activity;->isFinishing()Z

    .line 103
    .line 104
    .line 105
    move-result v3

    .line 106
    if-nez v3, :cond_7

    .line 107
    .line 108
    invoke-virtual {v1}, Landroid/app/Activity;->isDestroyed()Z

    .line 109
    .line 110
    .line 111
    move-result v1

    .line 112
    if-eqz v1, :cond_8

    .line 113
    .line 114
    :cond_7
    new-instance v1, Landroid/os/Handler;

    .line 115
    .line 116
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 117
    .line 118
    .line 119
    move-result-object v3

    .line 120
    invoke-direct {v1, v3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 121
    .line 122
    .line 123
    new-instance v3, Lyi1;

    .line 124
    .line 125
    invoke-direct {v3, p0, v0}, Lyi1;-><init>(Lcom/melodix/music/WebService;I)V

    .line 126
    .line 127
    .line 128
    invoke-virtual {v1, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 129
    .line 130
    .line 131
    :cond_8
    const/4 v0, 0x0
    sput-boolean v0, Lcom/melodix/music/WebService;->resumePlaybackOnRecovery:Z
    invoke-static {}, Lcom/melodix/music/WebService;->completeAndClearPendingResults()V

    sput-object v2, Lcom/melodix/music/WebService;->G:Lcom/melodix/music/WebService;

    sput-object v2, Lcom/melodix/music/WebService;->B:Landroid/graphics/Bitmap;

    const-string v1, "No Track"
    sput-object v1, Lcom/melodix/music/WebService;->v:Ljava/lang/String;
    const-string v1, "No Artist"
    sput-object v1, Lcom/melodix/music/WebService;->u:Ljava/lang/String;
    const-string v1, "false"
    sput-object v1, Lcom/melodix/music/WebService;->w:Ljava/lang/String;
    sput-object v1, Lcom/melodix/music/WebService;->x:Ljava/lang/String;
    const-wide/16 v3, 0x0
    sput-wide v3, Lcom/melodix/music/WebService;->y:J
    sput-wide v3, Lcom/melodix/music/WebService;->z:J
    sput-wide v3, Lcom/melodix/music/WebService;->A:J

    :already_cleaned
    return-void
.end method

.method public final m(Ljava/lang/String;)V
    .locals 3

    .line 1
    new-instance v0, Landroid/os/Handler;

    .line 2
    .line 3
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 8
    .line 9
    .line 10
    new-instance v1, Lo6;

    .line 11
    .line 12
    const/16 v2, 0x13

    .line 13
    .line 14
    invoke-direct {v1, p0, v2, p1}, Lo6;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final onCreate()V
    .locals 5

    .line 1
    invoke-super {p0}, Landroidx/media/MediaBrowserServiceCompat;->onCreate()V

    .line 2
    .line 3
    .line 4
    sput-object p0, Lcom/melodix/music/WebService;->G:Lcom/melodix/music/WebService;

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    sput-boolean v0, Lcom/melodix/music/WebService;->r:Z

    .line 8
    .line 9
    const-string v1, "power"

    .line 10
    .line 11
    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 16
    .line 17
    .line 18
    check-cast v1, Landroid/os/PowerManager;

    .line 19
    .line 20
    const v2, 0x7f110022

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    new-instance v3, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    const-string v2, ":KeepAlive"

    .line 36
    .line 37
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-virtual {v1, v0, v2}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 49
    .line 50
    .line 51
    iput-object v1, p0, Lcom/melodix/music/WebService;->k:Landroid/os/PowerManager$WakeLock;

    .line 52
    .line 53
    const/4 v2, 0x0

    .line 54
    invoke-virtual {v1, v2}, Landroid/os/PowerManager$WakeLock;->setReferenceCounted(Z)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0}, Lcom/melodix/music/WebService;->e()V

    const/4 v1, 0x0
    iput-boolean v1, p0, Lcom/melodix/music/WebService;->cleanedUp:Z

    .line 58
    .line 59
    .line 60
    :try_start_0
    invoke-virtual {p0}, Lcom/melodix/music/WebService;->e()V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0}, Lcom/melodix/music/WebService;->b()Landroid/app/Notification;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 68
    .line 69
    const/16 v3, 0x1d

    .line 70
    .line 71
    if-lt v2, v3, :cond_0

    .line 72
    .line 73
    invoke-static {p0, v1}, Le1;->n(Lcom/melodix/music/WebService;Landroid/app/Notification;)V

    .line 74
    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_0
    const/16 v2, 0x539

    .line 78
    .line 79
    invoke-virtual {p0, v2, v1}, Landroid/app/Service;->startForeground(ILandroid/app/Notification;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 80
    .line 81
    .line 82
    goto :goto_0

    :catchall_0
    move-exception v1
    const-string v3, "WebService"
    const-string v4, "startForeground failed"
    invoke-static {v3, v4, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    invoke-virtual {p0}, Lcom/melodix/music/WebService;->k()V

    .line 83
    .line 84
    .line 85
    new-instance v1, Landroid/os/Handler;

    .line 86
    .line 87
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 88
    .line 89
    .line 90
    move-result-object v2

    .line 91
    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 92
    .line 93
    .line 94
    new-instance v2, Lyi1;

    .line 95
    .line 96
    invoke-direct {v2, p0, v0}, Lyi1;-><init>(Lcom/melodix/music/WebService;I)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 100
    .line 101
    .line 102
    new-instance v1, Lc7;

    .line 103
    .line 104
    invoke-direct {v1, v0, p0}, Lc7;-><init>(ILjava/lang/Object;)V

    .line 105
    .line 106
    .line 107
    iput-object v1, p0, Lcom/melodix/music/WebService;->o:Lc7;

    .line 108
    .line 109
    new-instance v2, Landroid/content/IntentFilter;

    .line 110
    .line 111
    invoke-direct {v2}, Landroid/content/IntentFilter;-><init>()V

    .line 112
    .line 113
    .line 114
    const-string v3, "android.media.AUDIO_BECOMING_NOISY"

    .line 115
    .line 116
    invoke-virtual {v2, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    const-string v3, "android.intent.action.HEADSET_PLUG"

    .line 120
    .line 121
    invoke-virtual {v2, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    const-string v3, "android.bluetooth.a2dp.profile.action.CONNECTION_STATE_CHANGED"

    .line 125
    .line 126
    invoke-virtual {v2, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    const-string v3, "android.bluetooth.headset.profile.action.CONNECTION_STATE_CHANGED"

    .line 130
    .line 131
    invoke-virtual {v2, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    :try_start_1
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 135
    .line 136
    const/16 v4, 0x21

    .line 137
    .line 138
    if-lt v3, v4, :cond_1

    .line 139
    .line 140
    invoke-static {p0, v1, v2}, Li1;->w(Lcom/melodix/music/WebService;Lc7;Landroid/content/IntentFilter;)V

    .line 141
    .line 142
    .line 143
    goto :goto_1

    .line 144
    :cond_1
    invoke-virtual {p0, v1, v2}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 145
    .line 146
    .line 147
    :catchall_1
    :goto_1
    const-string v1, "audio"

    .line 148
    .line 149
    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 150
    .line 151
    .line 152
    move-result-object v1

    .line 153
    instance-of v2, v1, Landroid/media/AudioManager;

    .line 154
    .line 155
    if-eqz v2, :cond_2

    .line 156
    .line 157
    check-cast v1, Landroid/media/AudioManager;

    .line 158
    .line 159
    goto :goto_2

    .line 160
    :cond_2
    const/4 v1, 0x0

    .line 161
    :goto_2
    iput-object v1, p0, Lcom/melodix/music/WebService;->l:Landroid/media/AudioManager;

    .line 162
    .line 163
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 164
    .line 165
    const/16 v2, 0x1a

    .line 166
    .line 167
    if-lt v1, v2, :cond_3

    .line 168
    .line 169
    iput-boolean v0, p0, Lcom/melodix/music/WebService;->p:Z

    .line 170
    .line 171
    new-instance v0, Lbj1;

    .line 172
    .line 173
    invoke-direct {v0, p0}, Lbj1;-><init>(Lcom/melodix/music/WebService;)V

    .line 174
    .line 175
    .line 176
    iput-object v0, p0, Lcom/melodix/music/WebService;->m:Lbj1;

    .line 177
    .line 178
    :try_start_2
    new-instance v0, Landroid/os/HandlerThread;

    .line 179
    .line 180
    const-string v1, "AudioDeviceCallbackThread"

    .line 181
    .line 182
    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 183
    .line 184
    .line 185
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 186
    .line 187
    .line 188
    iput-object v0, p0, Lcom/melodix/music/WebService;->n:Landroid/os/HandlerThread;

    .line 189
    .line 190
    new-instance v1, Landroid/os/Handler;

    .line 191
    .line 192
    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 193
    .line 194
    .line 195
    move-result-object v0

    .line 196
    invoke-direct {v1, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 197
    .line 198
    .line 199
    iget-object v0, p0, Lcom/melodix/music/WebService;->l:Landroid/media/AudioManager;

    .line 200
    .line 201
    if-eqz v0, :cond_3

    .line 202
    .line 203
    iget-object p0, p0, Lcom/melodix/music/WebService;->m:Lbj1;

    .line 204
    .line 205
    invoke-virtual {v0, p0, v1}, Landroid/media/AudioManager;->registerAudioDeviceCallback(Landroid/media/AudioDeviceCallback;Landroid/os/Handler;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 206
    .line 207
    .line 208
    :catchall_2
    :cond_3
    return-void
.end method

.method public final onDestroy()V
    .locals 0

    invoke-super {p0}, Landroid/app/Service;->onDestroy()V
    invoke-virtual {p0}, Lcom/melodix/music/WebService;->l()V
    return-void
.end method

.method public final onGetRoot(Ljava/lang/String;ILandroid/os/Bundle;)Landroidx/media/MediaBrowserServiceCompat$BrowserRoot;
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget-boolean p0, Lcom/melodix/music/AppSingleton;->F:Z

    .line 5
    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    return-object p0

    .line 10
    :cond_0
    new-instance p0, Landroid/os/Bundle;

    .line 11
    .line 12
    invoke-direct {p0}, Landroid/os/Bundle;-><init>()V

    .line 13
    .line 14
    .line 15
    const-string p1, "android.media.browse.SEARCH_SUPPORTED"

    .line 16
    .line 17
    const/4 p2, 0x1

    .line 18
    invoke-virtual {p0, p1, p2}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 19
    .line 20
    .line 21
    const-string p1, "android.media.browse.CONTENT_STYLE_SUPPORTED"

    .line 22
    .line 23
    invoke-virtual {p0, p1, p2}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 24
    .line 25
    .line 26
    const-string p1, "android.media.browse.CONTENT_STYLE_BROWSABLE_HINT"

    .line 27
    .line 28
    const/4 p3, 0x2

    .line 29
    invoke-virtual {p0, p1, p3}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 30
    .line 31
    .line 32
    const-string p1, "android.media.browse.CONTENT_STYLE_PLAYABLE_HINT"

    .line 33
    .line 34
    invoke-virtual {p0, p1, p2}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 35
    .line 36
    .line 37
    new-instance p1, Landroidx/media/MediaBrowserServiceCompat$BrowserRoot;

    .line 38
    .line 39
    const-string p2, "sfroot"

    .line 40
    .line 41
    invoke-direct {p1, p2, p0}, Landroidx/media/MediaBrowserServiceCompat$BrowserRoot;-><init>(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 42
    .line 43
    .line 44
    return-object p1
.end method

.method public final onLoadChildren(Ljava/lang/String;Landroidx/media/MediaBrowserServiceCompat$Result;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    const-string v0, "sfroot"

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const-string v1, "playlists"

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    new-instance p1, Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 20
    .line 21
    .line 22
    const v0, 0x7f110003

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    new-instance v2, Ljava/lang/StringBuilder;

    .line 30
    .line 31
    const-string v3, "\ud83c\udfb5 "

    .line 32
    .line 33
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-static {v1, v0}, Lcom/melodix/music/WebService;->c(Ljava/lang/String;Ljava/lang/String;)Landroid/support/v4/media/MediaBrowserCompat$MediaItem;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    const/high16 v0, 0x7f110000

    .line 51
    .line 52
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    new-instance v1, Ljava/lang/StringBuilder;

    .line 57
    .line 58
    const-string v2, "\ud83d\udcbf "

    .line 59
    .line 60
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    const-string v1, "albums"

    .line 71
    .line 72
    invoke-static {v1, v0}, Lcom/melodix/music/WebService;->c(Ljava/lang/String;Ljava/lang/String;)Landroid/support/v4/media/MediaBrowserCompat$MediaItem;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    const v0, 0x7f110001

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    new-instance v1, Ljava/lang/StringBuilder;

    .line 87
    .line 88
    const-string v2, "\ud83d\udc64 "

    .line 89
    .line 90
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    const-string v1, "artists"

    .line 101
    .line 102
    invoke-static {v1, v0}, Lcom/melodix/music/WebService;->c(Ljava/lang/String;Ljava/lang/String;)Landroid/support/v4/media/MediaBrowserCompat$MediaItem;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 107
    .line 108
    .line 109
    const v0, 0x7f110004

    .line 110
    .line 111
    .line 112
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    new-instance v0, Ljava/lang/StringBuilder;

    .line 117
    .line 118
    const-string v1, "\ud83c\udf99 "

    .line 119
    .line 120
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    const-string v0, "podcasts"

    .line 131
    .line 132
    invoke-static {v0, p0}, Lcom/melodix/music/WebService;->c(Ljava/lang/String;Ljava/lang/String;)Landroid/support/v4/media/MediaBrowserCompat$MediaItem;

    .line 133
    .line 134
    .line 135
    move-result-object p0

    .line 136
    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 137
    .line 138
    .line 139
    invoke-virtual {p2, p1}, Landroidx/media/MediaBrowserServiceCompat$Result;->sendResult(Ljava/lang/Object;)V

    .line 140
    .line 141
    .line 142
    return-void

    .line 143
    :cond_0
    const-string v0, "spotify:"

    .line 144
    .line 145
    const/4 v2, 0x0

    .line 146
    invoke-static {p1, v0, v2}, Lla1;->x(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 147
    .line 148
    .line 149
    move-result v0

    .line 150
    if-nez v0, :cond_1

    .line 151
    .line 152
    const-string v0, "your_library"

    .line 153
    .line 154
    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 155
    .line 156
    .line 157
    move-result v0

    .line 158
    if-nez v0, :cond_1

    .line 159
    .line 160
    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 161
    .line 162
    .line 163
    move-result v0

    .line 164
    if-nez v0, :cond_1

    .line 165
    .line 166
    const-string v0, "collection"

    .line 167
    .line 168
    invoke-static {p1, v0, v2}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 169
    .line 170
    .line 171
    move-result v0

    .line 172
    if-eqz v0, :cond_2

    .line 173
    .line 174
    :cond_1
    iput-object p1, p0, Lcom/melodix/music/WebService;->q:Ljava/lang/String;

    .line 175
    .line 176
    :cond_2
    invoke-virtual {p2}, Landroidx/media/MediaBrowserServiceCompat$Result;->detach()V

    .line 177
    .line 178
    .line 179
    sget-object v0, Lcom/melodix/music/WebService;->E:Ljava/util/concurrent/ConcurrentHashMap;

    .line 180
    .line 181
    invoke-virtual {v0, p1, p2}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 182
    .line 183
    .line 184
    new-instance p2, Ljava/lang/StringBuilder;
    const-string v0, "if (typeof window.fetchMediaItems === \'function\') window.fetchMediaItems("
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    invoke-static {p1}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v0, ");"
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p2

    .line 203
    invoke-virtual {p0, p2}, Lcom/melodix/music/WebService;->m(Ljava/lang/String;)V

    .line 204
    .line 205
    .line 206
    new-instance p0, Landroid/os/Handler;

    .line 207
    .line 208
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 209
    .line 210
    .line 211
    move-result-object p2

    .line 212
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 213
    .line 214
    .line 215
    new-instance p2, Lr4;

    .line 216
    .line 217
    const/4 v0, 0x6

    .line 218
    invoke-direct {p2, p1, v0}, Lr4;-><init>(Ljava/lang/String;I)V

    .line 219
    .line 220
    .line 221
    const-wide/16 v0, 0x1388

    .line 222
    .line 223
    invoke-virtual {p0, p2, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 224
    .line 225
    .line 226
    return-void
.end method

.method public final onSearch(Ljava/lang/String;Landroid/os/Bundle;Landroidx/media/MediaBrowserServiceCompat$Result;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    if-nez p2, :cond_0

    .line 12
    .line 13
    sget-object p0, Lu00;->j:Lu00;

    .line 14
    .line 15
    invoke-virtual {p3, p0}, Landroidx/media/MediaBrowserServiceCompat$Result;->sendResult(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    const/4 p2, 0x0

    .line 20
    iput-object p2, p0, Lcom/melodix/music/WebService;->q:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {p3}, Landroidx/media/MediaBrowserServiceCompat$Result;->detach()V

    .line 23
    .line 24
    .line 25
    sget-object p2, Lcom/melodix/music/WebService;->F:Ljava/util/concurrent/ConcurrentHashMap;

    .line 26
    .line 27
    invoke-virtual {p2, p1, p3}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    new-instance p2, Ljava/lang/StringBuilder;
    const-string p3, "if (typeof window.searchMediaItems === \'function\') window.searchMediaItems("
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    invoke-static {p1}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p3
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string p3, ");"
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p2

    .line 49
    invoke-virtual {p0, p2}, Lcom/melodix/music/WebService;->m(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    new-instance p0, Landroid/os/Handler;

    .line 53
    .line 54
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 55
    .line 56
    .line 57
    move-result-object p2

    .line 58
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 59
    .line 60
    .line 61
    new-instance p2, Lr4;

    .line 62
    .line 63
    const/4 p3, 0x7

    .line 64
    invoke-direct {p2, p1, p3}, Lr4;-><init>(Ljava/lang/String;I)V

    .line 65
    .line 66
    .line 67
    const-wide/16 v0, 0x1770

    .line 68
    .line 69
    invoke-virtual {p0, p2, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public final onStartCommand(Landroid/content/Intent;II)I
    .locals 3

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 p2, 0x0

    .line 9
    :goto_0
    const-string p3, "STOP_SERVICE"

    .line 10
    .line 11
    invoke-static {p2, p3}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    if-eqz p2, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/melodix/music/WebService;->l()V

    .line 18
    .line 19
    .line 20
    const/4 p0, 0x2

    .line 21
    return p0

    .line 22
    :cond_1
    sget-boolean p2, Lcom/melodix/music/WebService;->r:Z

    .line 23
    .line 24
    const/16 p3, 0x1d

    .line 25
    .line 26
    const/16 v0, 0x539

    .line 27
    .line 28
    const/4 v1, 0x1

    .line 29
    if-nez p2, :cond_3

    .line 30
    .line 31
    sput-boolean v1, Lcom/melodix/music/WebService;->r:Z

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/melodix/music/WebService;->e()V

    .line 34
    .line 35
    .line 36
    :try_start_0
    invoke-virtual {p0}, Lcom/melodix/music/WebService;->e()V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/melodix/music/WebService;->b()Landroid/app/Notification;

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 44
    .line 45
    if-lt v2, p3, :cond_2

    .line 46
    .line 47
    invoke-static {p0, p2}, Le1;->n(Lcom/melodix/music/WebService;Landroid/app/Notification;)V

    .line 48
    .line 49
    .line 50
    goto :goto_1

    .line 51
    :cond_2
    invoke-virtual {p0, v0, p2}, Landroid/app/Service;->startForeground(ILandroid/app/Notification;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 52
    .line 53
    .line 54
    :catchall_0
    :goto_1
    invoke-virtual {p0}, Lcom/melodix/music/WebService;->k()V

    .line 55
    .line 56
    .line 57
    goto :goto_2

    .line 58
    :cond_3
    :try_start_1
    invoke-virtual {p0}, Lcom/melodix/music/WebService;->b()Landroid/app/Notification;

    .line 59
    .line 60
    .line 61
    move-result-object p2

    .line 62
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 63
    .line 64
    if-lt v2, p3, :cond_4

    .line 65
    .line 66
    invoke-static {p0, p2}, Le1;->n(Lcom/melodix/music/WebService;Landroid/app/Notification;)V

    .line 67
    .line 68
    .line 69
    goto :goto_2

    .line 70
    :cond_4
    invoke-virtual {p0, v0, p2}, Landroid/app/Service;->startForeground(ILandroid/app/Notification;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 71
    .line 72
    .line 73
    :catchall_1
    :goto_2
    iget-object p0, p0, Lcom/melodix/music/WebService;->j:Landroid/support/v4/media/session/MediaSessionCompat;

    .line 74
    .line 75
    if-eqz p0, :cond_5

    .line 76
    .line 77
    :try_start_2
    invoke-static {p0, p1}, Landroidx/media/session/MediaButtonReceiver;->handleIntent(Landroid/support/v4/media/session/MediaSessionCompat;Landroid/content/Intent;)Landroid/view/KeyEvent;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 78
    .line 79
    .line 80
    :catchall_2
    :cond_5
    return v1
.end method

.method public final onTaskRemoved(Landroid/content/Intent;)V
    .locals 1

    .line 1
    sget-boolean v0, Lcom/melodix/music/AppSingleton;->H:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/melodix/music/WebService;->l()V

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-super {p0, p1}, Landroid/app/Service;->onTaskRemoved(Landroid/content/Intent;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final onTrimMemory(I)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/app/Service;->onTrimMemory(I)V

    .line 2
    .line 3
    .line 4
    const/16 p0, 0xa

    .line 5
    .line 6
    if-ge p1, p0, :cond_1

    .line 7
    .line 8
    const/16 p0, 0x3c

    .line 9
    .line 10
    if-lt p1, p0, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    return-void

    .line 14
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 15
    sput-object p0, Lcom/melodix/music/WebService;->B:Landroid/graphics/Bitmap;

    .line 16
    .line 17
    return-void
.end method
