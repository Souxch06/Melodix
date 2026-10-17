.class public final Lcom/melodix/music/WebService$MediaActionReceiver;
.super Landroid/content/BroadcastReceiver;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/melodix/music/WebService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "MediaActionReceiver"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    const-string p0, "audio"

    .line 8
    .line 9
    invoke-virtual {p1, p0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 14
    .line 15
    .line 16
    check-cast p0, Landroid/media/AudioManager;

    .line 17
    .line 18
    sget-boolean p1, Lcom/melodix/music/WebService;->r:Z

    .line 19
    .line 20
    if-eqz p1, :cond_9

    .line 21
    .line 22
    sget-boolean p1, Lcom/melodix/music/AppSingleton;->l:Z

    .line 23
    .line 24
    if-eqz p1, :cond_9

    .line 25
    .line 26
    sget-object p1, Lcom/melodix/music/WebService;->G:Lcom/melodix/music/WebService;

    .line 27
    .line 28
    if-eqz p1, :cond_9

    .line 29
    .line 30
    iget-object p1, p1, Lcom/melodix/music/WebService;->j:Landroid/support/v4/media/session/MediaSessionCompat;

    .line 31
    .line 32
    if-eqz p1, :cond_9

    .line 33
    .line 34
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    if-nez p1, :cond_0

    .line 39
    .line 40
    goto/16 :goto_0

    .line 41
    .line 42
    :cond_0
    sget-object p2, Lcom/melodix/music/WebService;->G:Lcom/melodix/music/WebService;

    .line 43
    .line 44
    if-eqz p2, :cond_9

    .line 45
    .line 46
    iget-object p2, p2, Lcom/melodix/music/WebService;->j:Landroid/support/v4/media/session/MediaSessionCompat;

    .line 47
    .line 48
    if-eqz p2, :cond_9

    .line 49
    .line 50
    invoke-virtual {p2}, Landroid/support/v4/media/session/MediaSessionCompat;->getController()Landroid/support/v4/media/session/MediaControllerCompat;

    .line 51
    .line 52
    .line 53
    move-result-object p2

    .line 54
    if-eqz p2, :cond_9

    .line 55
    .line 56
    invoke-virtual {p2}, Landroid/support/v4/media/session/MediaControllerCompat;->getTransportControls()Landroid/support/v4/media/session/MediaControllerCompat$TransportControls;

    .line 57
    .line 58
    .line 59
    move-result-object p2

    .line 60
    if-nez p2, :cond_1

    .line 61
    .line 62
    goto/16 :goto_0

    .line 63
    .line 64
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    const/4 v1, 0x3

    .line 69
    const/4 v2, 0x1

    .line 70
    sparse-switch v0, :sswitch_data_0

    .line 71
    .line 72
    .line 73
    goto/16 :goto_0

    .line 74
    .line 75
    :sswitch_0
    const-string p2, "WIDGET_VOL_DOWN"

    .line 76
    .line 77
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    move-result p1

    .line 81
    if-nez p1, :cond_2

    .line 82
    .line 83
    goto/16 :goto_0

    .line 84
    .line 85
    :cond_2
    const/4 p1, -0x1

    .line 86
    invoke-virtual {p0, v1, p1, v2}, Landroid/media/AudioManager;->adjustStreamVolume(III)V

    .line 87
    .line 88
    .line 89
    sget-boolean p0, Lcom/melodix/music/WebService;->r:Z

    .line 90
    .line 91
    invoke-static {v2}, Lzi1;->b(Z)V

    .line 92
    .line 93
    .line 94
    return-void

    .line 95
    :sswitch_1
    const-string p0, "SHUFFLE_ACTION"

    .line 96
    .line 97
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    move-result p0

    .line 101
    if-nez p0, :cond_8

    .line 102
    .line 103
    goto :goto_0

    .line 104
    :sswitch_2
    const-string p0, "WIDGET_PREV"

    .line 105
    .line 106
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 107
    .line 108
    .line 109
    move-result p0

    .line 110
    if-nez p0, :cond_3

    .line 111
    .line 112
    goto :goto_0

    .line 113
    :cond_3
    invoke-virtual {p2}, Landroid/support/v4/media/session/MediaControllerCompat$TransportControls;->skipToPrevious()V

    .line 114
    .line 115
    .line 116
    return-void

    .line 117
    :sswitch_3
    const-string p0, "WIDGET_NEXT"

    .line 118
    .line 119
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 120
    .line 121
    .line 122
    move-result p0

    .line 123
    if-nez p0, :cond_4

    .line 124
    .line 125
    goto :goto_0

    .line 126
    :cond_4
    invoke-virtual {p2}, Landroid/support/v4/media/session/MediaControllerCompat$TransportControls;->skipToNext()V

    .line 127
    .line 128
    .line 129
    return-void

    .line 130
    :sswitch_4
    const-string p0, "WIDGET_PLAYPAUSE"

    .line 131
    .line 132
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 133
    .line 134
    .line 135
    move-result p0

    .line 136
    if-nez p0, :cond_5

    .line 137
    .line 138
    goto :goto_0

    .line 139
    :cond_5
    sget-boolean p0, Lcom/melodix/music/WebService;->s:Z

    .line 140
    .line 141
    if-eqz p0, :cond_6

    .line 142
    .line 143
    invoke-virtual {p2}, Landroid/support/v4/media/session/MediaControllerCompat$TransportControls;->pause()V

    .line 144
    .line 145
    .line 146
    return-void

    .line 147
    :cond_6
    invoke-virtual {p2}, Landroid/support/v4/media/session/MediaControllerCompat$TransportControls;->play()V

    .line 148
    .line 149
    .line 150
    return-void

    .line 151
    :sswitch_5
    const-string p0, "ADDTOFAV_ACTION"

    .line 152
    .line 153
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 154
    .line 155
    .line 156
    move-result p0

    .line 157
    if-nez p0, :cond_8

    .line 158
    .line 159
    goto :goto_0

    .line 160
    :sswitch_6
    const-string p2, "WIDGET_VOL_UP"

    .line 161
    .line 162
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 163
    .line 164
    .line 165
    move-result p1

    .line 166
    if-nez p1, :cond_7

    .line 167
    .line 168
    goto :goto_0

    .line 169
    :cond_7
    invoke-virtual {p0, v1, v2, v2}, Landroid/media/AudioManager;->adjustStreamVolume(III)V

    .line 170
    .line 171
    .line 172
    sget-boolean p0, Lcom/melodix/music/WebService;->r:Z

    .line 173
    .line 174
    invoke-static {v2}, Lzi1;->b(Z)V

    .line 175
    .line 176
    .line 177
    return-void

    .line 178
    :sswitch_7
    const-string p0, "REPEAT_ACTION"

    .line 179
    .line 180
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 181
    .line 182
    .line 183
    move-result p0

    .line 184
    if-nez p0, :cond_8

    .line 185
    .line 186
    goto :goto_0

    .line 187
    :cond_8
    const/4 p0, 0x0

    .line 188
    invoke-virtual {p2, p1, p0}, Landroid/support/v4/media/session/MediaControllerCompat$TransportControls;->sendCustomAction(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 189
    .line 190
    .line 191
    :cond_9
    :goto_0
    return-void

    .line 192
    nop

    .line 193
    :sswitch_data_0
    .sparse-switch
        -0x586da6a6 -> :sswitch_7
        -0x2db023fe -> :sswitch_6
        0xe974fb6 -> :sswitch_5
        0x39a7cee7 -> :sswitch_4
        0x4b0f380e -> :sswitch_3
        0x4b104f4e -> :sswitch_2
        0x7890665c -> :sswitch_1
        0x7dc13049 -> :sswitch_0
    .end sparse-switch
.end method
