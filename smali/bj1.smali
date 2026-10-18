.class public final Lbj1;
.super Landroid/media/AudioDeviceCallback;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final synthetic a:Lcom/melodix/music/WebService;


# direct methods
.method public constructor <init>(Lcom/melodix/music/WebService;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lbj1;->a:Lcom/melodix/music/WebService;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/media/AudioDeviceCallback;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final onAudioDevicesAdded([Landroid/media/AudioDeviceInfo;)V
    .locals 8

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lbj1;->a:Lcom/melodix/music/WebService;

    .line 5
    .line 6
    iget-boolean v0, p0, Lcom/melodix/music/WebService;->p:Z

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iput-boolean v1, p0, Lcom/melodix/music/WebService;->p:Z

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    sget-boolean v0, Lcom/melodix/music/WebService;->r:Z

    .line 15
    .line 16
    if-eqz v0, :cond_8

    .line 17
    .line 18
    sget-boolean v0, Lcom/melodix/music/AppSingleton;->l:Z

    .line 19
    .line 20
    if-eqz v0, :cond_8

    .line 21
    .line 22
    iget-object v0, p0, Lcom/melodix/music/WebService;->j:Landroid/support/v4/media/session/MediaSessionCompat;

    .line 23
    .line 24
    if-eqz v0, :cond_8

    .line 25
    .line 26
    array-length v0, p1

    .line 27
    move v2, v1

    .line 28
    :goto_0
    if-ge v2, v0, :cond_8

    .line 29
    .line 30
    aget-object v3, p1, v2

    .line 31
    .line 32
    invoke-virtual {v3}, Landroid/media/AudioDeviceInfo;->getType()I

    .line 33
    .line 34
    .line 35
    move-result v3

    .line 36
    const/4 v4, 0x3

    .line 37
    const/4 v5, 0x1

    .line 38
    if-eq v3, v4, :cond_2

    .line 39
    .line 40
    const/4 v4, 0x4

    .line 41
    if-eq v3, v4, :cond_2

    .line 42
    .line 43
    const/16 v4, 0x16

    .line 44
    .line 45
    if-eq v3, v4, :cond_2

    .line 46
    .line 47
    const/16 v4, 0xb

    .line 48
    .line 49
    if-eq v3, v4, :cond_2

    .line 50
    .line 51
    const/16 v4, 0xc

    .line 52
    .line 53
    if-ne v3, v4, :cond_1

    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_1
    move v4, v1

    .line 57
    goto :goto_2

    .line 58
    :cond_2
    :goto_1
    move v4, v5

    .line 59
    :goto_2
    const/16 v6, 0x8

    .line 60
    .line 61
    if-eq v3, v6, :cond_5

    .line 62
    .line 63
    const/4 v6, 0x7

    .line 64
    if-eq v3, v6, :cond_5

    .line 65
    .line 66
    sget v6, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 67
    .line 68
    const/16 v7, 0x1f

    .line 69
    .line 70
    if-lt v6, v7, :cond_3

    .line 71
    .line 72
    const/16 v7, 0x1a

    .line 73
    .line 74
    if-eq v3, v7, :cond_5

    .line 75
    .line 76
    const/16 v7, 0x1b

    .line 77
    .line 78
    if-eq v3, v7, :cond_5

    .line 79
    .line 80
    :cond_3
    const/16 v7, 0x1c

    .line 81
    .line 82
    if-lt v6, v7, :cond_4

    .line 83
    .line 84
    const/16 v6, 0x17

    .line 85
    .line 86
    if-ne v3, v6, :cond_4

    .line 87
    .line 88
    goto :goto_3

    .line 89
    :cond_4
    move v3, v1

    .line 90
    goto :goto_4

    .line 91
    :cond_5
    :goto_3
    move v3, v5

    .line 92
    :goto_4
    if-eqz v4, :cond_6

    .line 93
    .line 94
    invoke-virtual {p0, v1}, Lcom/melodix/music/WebService;->g(Z)V

    .line 95
    .line 96
    .line 97
    goto :goto_5

    .line 98
    :cond_6
    if-eqz v3, :cond_7

    .line 99
    .line 100
    invoke-virtual {p0, v5}, Lcom/melodix/music/WebService;->g(Z)V

    .line 101
    .line 102
    .line 103
    :cond_7
    :goto_5
    add-int/lit8 v2, v2, 0x1

    .line 104
    .line 105
    goto :goto_0

    .line 106
    :cond_8
    return-void
.end method

.method public final onAudioDevicesRemoved([Landroid/media/AudioDeviceInfo;)V
    .locals 8

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget-boolean v0, Lcom/melodix/music/WebService;->s:Z

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    goto/16 :goto_6

    .line 9
    .line 10
    :cond_0
    sget-boolean v0, Lcom/melodix/music/WebService;->r:Z

    .line 11
    .line 12
    if-eqz v0, :cond_a

    .line 13
    .line 14
    sget-boolean v0, Lcom/melodix/music/AppSingleton;->l:Z

    .line 15
    .line 16
    if-eqz v0, :cond_a

    .line 17
    .line 18
    iget-object p0, p0, Lbj1;->a:Lcom/melodix/music/WebService;

    .line 19
    .line 20
    iget-object v0, p0, Lcom/melodix/music/WebService;->j:Landroid/support/v4/media/session/MediaSessionCompat;

    .line 21
    .line 22
    if-eqz v0, :cond_a

    .line 23
    .line 24
    array-length v0, p1

    .line 25
    const/4 v1, 0x0

    .line 26
    move v2, v1

    .line 27
    :goto_0
    if-ge v2, v0, :cond_a

    .line 28
    .line 29
    aget-object v3, p1, v2

    .line 30
    .line 31
    invoke-virtual {v3}, Landroid/media/AudioDeviceInfo;->getType()I

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    invoke-static {v3}, Lcom/melodix/music/WebService;->i(I)Z

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    if-eqz v3, :cond_9

    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/melodix/music/WebService;->h()Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_1

    .line 46
    .line 47
    goto :goto_6

    .line 48
    :cond_1
    array-length v0, p1

    .line 49
    move v2, v1

    .line 50
    :goto_1
    if-ge v2, v0, :cond_a

    .line 51
    .line 52
    aget-object v3, p1, v2

    .line 53
    .line 54
    invoke-virtual {v3}, Landroid/media/AudioDeviceInfo;->getType()I

    .line 55
    .line 56
    .line 57
    move-result v3

    .line 58
    const/4 v4, 0x3

    .line 59
    const/4 v5, 0x1

    .line 60
    if-eq v3, v4, :cond_3

    .line 61
    .line 62
    const/4 v4, 0x4

    .line 63
    if-eq v3, v4, :cond_3

    .line 64
    .line 65
    const/16 v4, 0x16

    .line 66
    .line 67
    if-eq v3, v4, :cond_3

    .line 68
    .line 69
    const/16 v4, 0xb

    .line 70
    .line 71
    if-eq v3, v4, :cond_3

    .line 72
    .line 73
    const/16 v4, 0xc

    .line 74
    .line 75
    if-ne v3, v4, :cond_2

    .line 76
    .line 77
    goto :goto_2

    .line 78
    :cond_2
    move v4, v1

    .line 79
    goto :goto_3

    .line 80
    :cond_3
    :goto_2
    move v4, v5

    .line 81
    :goto_3
    const/16 v6, 0x8

    .line 82
    .line 83
    if-eq v3, v6, :cond_6

    .line 84
    .line 85
    const/4 v6, 0x7

    .line 86
    if-eq v3, v6, :cond_6

    .line 87
    .line 88
    sget v6, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 89
    .line 90
    const/16 v7, 0x1f

    .line 91
    .line 92
    if-lt v6, v7, :cond_4

    .line 93
    .line 94
    const/16 v7, 0x1a

    .line 95
    .line 96
    if-eq v3, v7, :cond_6

    .line 97
    .line 98
    const/16 v7, 0x1b

    .line 99
    .line 100
    if-eq v3, v7, :cond_6

    .line 101
    .line 102
    :cond_4
    const/16 v7, 0x1c

    .line 103
    .line 104
    if-lt v6, v7, :cond_5

    .line 105
    .line 106
    const/16 v6, 0x17

    .line 107
    .line 108
    if-ne v3, v6, :cond_5

    .line 109
    .line 110
    goto :goto_4

    .line 111
    :cond_5
    move v3, v1

    .line 112
    goto :goto_5

    .line 113
    :cond_6
    :goto_4
    move v3, v5

    .line 114
    :goto_5
    if-eqz v4, :cond_7

    .line 115
    .line 116
    invoke-virtual {p0, v1, v1}, Lcom/melodix/music/WebService;->f(ZZ)V

    .line 117
    .line 118
    .line 119
    return-void

    .line 120
    :cond_7
    if-eqz v3, :cond_8

    .line 121
    .line 122
    invoke-virtual {p0, v5, v1}, Lcom/melodix/music/WebService;->f(ZZ)V

    .line 123
    .line 124
    .line 125
    return-void

    .line 126
    :cond_8
    add-int/lit8 v2, v2, 0x1

    .line 127
    .line 128
    goto :goto_1

    .line 129
    :cond_9
    add-int/lit8 v2, v2, 0x1

    .line 130
    .line 131
    goto :goto_0

    .line 132
    :cond_a
    :goto_6
    return-void
.end method
