.class public final Laj1;
.super Landroid/support/v4/media/session/MediaSessionCompat$Callback;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final synthetic a:Lcom/melodix/music/WebService;


# direct methods
.method public constructor <init>(Lcom/melodix/music/WebService;)V
    .locals 0

    .line 1
    iput-object p1, p0, Laj1;->a:Lcom/melodix/music/WebService;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/support/v4/media/session/MediaSessionCompat$Callback;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final onCustomAction(Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_6

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    const v0, -0x586da6a6

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Laj1;->a:Lcom/melodix/music/WebService;

    .line 11
    .line 12
    if-eq p2, v0, :cond_4

    .line 13
    .line 14
    const v0, 0xe974fb6

    .line 15
    .line 16
    .line 17
    if-eq p2, v0, :cond_2

    .line 18
    .line 19
    const v0, 0x7890665c

    .line 20
    .line 21
    .line 22
    if-eq p2, v0, :cond_0

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const-string p2, "SHUFFLE_ACTION"

    .line 26
    .line 27
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-nez p1, :cond_1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    sget-boolean p1, Lcom/melodix/music/WebService;->r:Z

    .line 35
    .line 36
    const-string p1, "actShuffle();"

    .line 37
    .line 38
    invoke-virtual {p0, p1}, Lcom/melodix/music/WebService;->m(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_2
    const-string p2, "ADDTOFAV_ACTION"

    .line 43
    .line 44
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    if-nez p1, :cond_3

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_3
    sget-boolean p1, Lcom/melodix/music/WebService;->r:Z

    .line 52
    .line 53
    const-string p1, "actAddToFav();"

    .line 54
    .line 55
    invoke-virtual {p0, p1}, Lcom/melodix/music/WebService;->m(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_4
    const-string p2, "REPEAT_ACTION"

    .line 60
    .line 61
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    if-nez p1, :cond_5

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_5
    sget-boolean p1, Lcom/melodix/music/WebService;->r:Z

    .line 69
    .line 70
    const-string p1, "actRepeat();"

    .line 71
    .line 72
    invoke-virtual {p0, p1}, Lcom/melodix/music/WebService;->m(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    :cond_6
    :goto_0
    return-void
.end method

.method public final onPause()V
    .locals 1

    .line 1
    sget-boolean v0, Lcom/melodix/music/WebService;->r:Z

    .line 2
    .line 3
    iget-object p0, p0, Laj1;->a:Lcom/melodix/music/WebService;

    .line 4
    .line 5
    const-string v0, "actPlayPause(false);"

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Lcom/melodix/music/WebService;->m(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final onPlay()V
    .locals 1

    .line 1
    sget-boolean v0, Lcom/melodix/music/WebService;->r:Z

    .line 2
    .line 3
    iget-object p0, p0, Laj1;->a:Lcom/melodix/music/WebService;

    .line 4
    .line 5
    const-string v0, "actPlayPause(true);"

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Lcom/melodix/music/WebService;->m(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final onPlayFromMediaId(Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 3

    .line 1
    if-eqz p1, :cond_5

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    if-nez p2, :cond_0

    .line 8
    .line 9
    goto/16 :goto_1

    .line 10
    .line 11
    :cond_0
    const-string p2, "spotify:album:"

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-static {p1, p2, v0}, Lla1;->x(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 15
    .line 16
    .line 17
    move-result p2

    .line 18
    const-string v1, "\');"

    .line 19
    .line 20
    const-string v2, "playFromUri(\'"

    .line 21
    .line 22
    iget-object p0, p0, Laj1;->a:Lcom/melodix/music/WebService;

    .line 23
    .line 24
    if-nez p2, :cond_4

    .line 25
    .line 26
    const-string p2, "spotify:playlist:"

    .line 27
    .line 28
    invoke-static {p1, p2, v0}, Lla1;->x(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 29
    .line 30
    .line 31
    move-result p2

    .line 32
    if-nez p2, :cond_4

    .line 33
    .line 34
    const-string p2, "spotify:artist:"

    .line 35
    .line 36
    invoke-static {p1, p2, v0}, Lla1;->x(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 37
    .line 38
    .line 39
    move-result p2

    .line 40
    if-nez p2, :cond_4

    .line 41
    .line 42
    const-string p2, "spotify:show:"

    .line 43
    .line 44
    invoke-static {p1, p2, v0}, Lla1;->x(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 45
    .line 46
    .line 47
    move-result p2

    .line 48
    if-eqz p2, :cond_1

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_1
    const-string p2, "spotify:track:"

    .line 52
    .line 53
    invoke-static {p1, p2, v0}, Lla1;->x(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 54
    .line 55
    .line 56
    move-result p2

    .line 57
    if-eqz p2, :cond_3

    .line 58
    .line 59
    iget-object p2, p0, Lcom/melodix/music/WebService;->q:Ljava/lang/String;

    .line 60
    .line 61
    if-eqz p2, :cond_2

    .line 62
    .line 63
    invoke-virtual {p2, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-nez v0, :cond_2

    .line 68
    .line 69
    new-instance v0, Ljava/lang/StringBuilder;

    .line 70
    .line 71
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    const-string p1, "\', \'"

    .line 78
    .line 79
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    invoke-virtual {p0, p1}, Lcom/melodix/music/WebService;->m(Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    return-void

    .line 96
    :cond_2
    new-instance p2, Ljava/lang/StringBuilder;

    .line 97
    .line 98
    invoke-direct {p2, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    invoke-virtual {p0, p1}, Lcom/melodix/music/WebService;->m(Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    return-void

    .line 115
    :cond_3
    invoke-static {v2, p1, v1}, Loq;->j(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    sget-boolean p2, Lcom/melodix/music/WebService;->r:Z

    .line 120
    .line 121
    invoke-virtual {p0, p1}, Lcom/melodix/music/WebService;->m(Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    return-void

    .line 125
    :cond_4
    :goto_0
    iput-object p1, p0, Lcom/melodix/music/WebService;->q:Ljava/lang/String;

    .line 126
    .line 127
    new-instance p2, Ljava/lang/StringBuilder;

    .line 128
    .line 129
    invoke-direct {p2, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    invoke-virtual {p0, p1}, Lcom/melodix/music/WebService;->m(Ljava/lang/String;)V

    .line 143
    .line 144
    .line 145
    :cond_5
    :goto_1
    return-void
.end method

.method public final onPlayFromSearch(Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 1

    .line 1
    iget-object p0, p0, Laj1;->a:Lcom/melodix/music/WebService;

    .line 2
    .line 3
    if-eqz p1, :cond_1

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    if-nez p2, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p2, 0x0

    .line 13
    iput-object p2, p0, Lcom/melodix/music/WebService;->q:Ljava/lang/String;

    .line 14
    .line 15
    new-instance p2, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    const-string v0, "if (typeof window.searchAndPlay === \'function\') window.searchAndPlay(\'"

    .line 18
    .line 19
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string p1, "\');"

    .line 26
    .line 27
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {p0, p1}, Lcom/melodix/music/WebService;->m(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_1
    :goto_0
    sget-boolean p1, Lcom/melodix/music/WebService;->r:Z

    .line 39
    .line 40
    const-string p1, "actPlayPause(true);"

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Lcom/melodix/music/WebService;->m(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public final onPlayFromUri(Landroid/net/Uri;Landroid/os/Bundle;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 p1, 0x0

    .line 9
    :goto_0
    if-eqz p1, :cond_2

    .line 10
    .line 11
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    goto :goto_1

    .line 18
    :cond_1
    invoke-virtual {p0, p1, p2}, Laj1;->onPlayFromMediaId(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_2
    :goto_1
    sget-boolean p1, Lcom/melodix/music/WebService;->r:Z

    .line 23
    .line 24
    iget-object p0, p0, Laj1;->a:Lcom/melodix/music/WebService;

    .line 25
    .line 26
    const-string p1, "actPlayPause(true);"

    .line 27
    .line 28
    invoke-virtual {p0, p1}, Lcom/melodix/music/WebService;->m(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final onPrepare()V
    .locals 1

    .line 1
    sget-boolean v0, Lcom/melodix/music/WebService;->r:Z

    .line 2
    .line 3
    iget-object p0, p0, Laj1;->a:Lcom/melodix/music/WebService;

    .line 4
    .line 5
    const-string v0, "actPlayPause(true);"

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Lcom/melodix/music/WebService;->m(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final onPrepareFromMediaId(Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Laj1;->onPlayFromMediaId(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final onPrepareFromSearch(Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Laj1;->onPlayFromSearch(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final onPrepareFromUri(Landroid/net/Uri;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Laj1;->onPlayFromUri(Landroid/net/Uri;Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final onSeekTo(J)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "actSeek("

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string p1, ");"

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    sget-boolean p2, Lcom/melodix/music/WebService;->r:Z

    .line 21
    .line 22
    iget-object p0, p0, Laj1;->a:Lcom/melodix/music/WebService;

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Lcom/melodix/music/WebService;->m(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final onSkipToNext()V
    .locals 1

    .line 1
    sget-boolean v0, Lcom/melodix/music/WebService;->r:Z

    .line 2
    .line 3
    iget-object p0, p0, Laj1;->a:Lcom/melodix/music/WebService;

    .line 4
    .line 5
    const-string v0, "actSkipForward();"

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Lcom/melodix/music/WebService;->m(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final onSkipToPrevious()V
    .locals 1

    .line 1
    sget-boolean v0, Lcom/melodix/music/WebService;->r:Z

    .line 2
    .line 3
    iget-object p0, p0, Laj1;->a:Lcom/melodix/music/WebService;

    .line 4
    .line 5
    const-string v0, "actSkipBack();"

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Lcom/melodix/music/WebService;->m(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
