.class public final Lzi1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# direct methods
.method public static a(Landroid/support/v4/media/session/PlaybackStateCompat$Builder;)V
    .locals 9

    .line 1
    sget-object v0, Lcom/melodix/music/AppSingleton;->G:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ","

    .line 4
    .line 5
    filled-new-array {v1}, [Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-static {v0, v1}, Lda1;->M(Ljava/lang/CharSequence;[Ljava/lang/String;)Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ljava/util/ArrayList;

    .line 14
    .line 15
    const/16 v2, 0xa

    .line 16
    .line 17
    invoke-static {v0, v2}, Ldl;->w(Ljava/lang/Iterable;I)I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 22
    .line 23
    .line 24
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    if-eqz v2, :cond_0

    .line 33
    .line 34
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    check-cast v2, Ljava/lang/String;

    .line 39
    .line 40
    invoke-static {v2}, Lda1;->Q(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_0
    new-instance v0, Ljava/util/LinkedHashSet;

    .line 53
    .line 54
    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 58
    .line 59
    .line 60
    move-result v2

    .line 61
    const/4 v3, 0x0

    .line 62
    :cond_1
    :goto_1
    if-ge v3, v2, :cond_9

    .line 63
    .line 64
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v4

    .line 68
    add-int/lit8 v3, v3, 0x1

    .line 69
    .line 70
    check-cast v4, Ljava/lang/String;

    .line 71
    .line 72
    invoke-interface {v0, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    move-result v5

    .line 76
    if-eqz v5, :cond_2

    .line 77
    .line 78
    goto :goto_1

    .line 79
    :cond_2
    invoke-virtual {v4}, Ljava/lang/String;->hashCode()I

    .line 80
    .line 81
    .line 82
    move-result v5

    .line 83
    const v6, -0x7020de65

    .line 84
    .line 85
    .line 86
    if-eq v5, v6, :cond_7

    .line 87
    .line 88
    const v6, -0x59af2d27

    .line 89
    .line 90
    .line 91
    if-eq v5, v6, :cond_5

    .line 92
    .line 93
    const v6, 0x10efb

    .line 94
    .line 95
    .line 96
    if-eq v5, v6, :cond_3

    .line 97
    .line 98
    goto :goto_1

    .line 99
    :cond_3
    const-string v5, "FAV"

    .line 100
    .line 101
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    move-result v4

    .line 105
    if-eqz v4, :cond_1

    .line 106
    .line 107
    sget-boolean v4, Lcom/melodix/music/WebService;->t:Z

    .line 108
    .line 109
    if-eqz v4, :cond_4

    .line 110
    .line 111
    const v4, 0x7f0800aa

    .line 112
    .line 113
    .line 114
    goto :goto_2

    .line 115
    :cond_4
    const v4, 0x7f0800a9

    .line 116
    .line 117
    .line 118
    :goto_2
    new-instance v6, Landroid/support/v4/media/session/PlaybackStateCompat$CustomAction$Builder;

    .line 119
    .line 120
    const-string v7, "ADDTOFAV_ACTION"

    .line 121
    .line 122
    const-string v8, "Favorite"

    .line 123
    .line 124
    invoke-direct {v6, v7, v8, v4}, Landroid/support/v4/media/session/PlaybackStateCompat$CustomAction$Builder;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;I)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {v6}, Landroid/support/v4/media/session/PlaybackStateCompat$CustomAction$Builder;->build()Landroid/support/v4/media/session/PlaybackStateCompat$CustomAction;

    .line 128
    .line 129
    .line 130
    move-result-object v4

    .line 131
    invoke-virtual {p0, v4}, Landroid/support/v4/media/session/PlaybackStateCompat$Builder;->addCustomAction(Landroid/support/v4/media/session/PlaybackStateCompat$CustomAction;)Landroid/support/v4/media/session/PlaybackStateCompat$Builder;

    .line 132
    .line 133
    .line 134
    invoke-interface {v0, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 135
    .line 136
    .line 137
    goto :goto_1

    .line 138
    :cond_5
    const-string v5, "SHUFFLE"

    .line 139
    .line 140
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 141
    .line 142
    .line 143
    move-result v4

    .line 144
    if-nez v4, :cond_6

    .line 145
    .line 146
    goto :goto_1

    .line 147
    :cond_6
    new-instance v4, Landroid/support/v4/media/session/PlaybackStateCompat$CustomAction$Builder;

    .line 148
    .line 149
    const-string v6, "Shuffle"

    .line 150
    .line 151
    sget v7, Lcom/melodix/music/WebService;->D:I

    .line 152
    .line 153
    const-string v8, "SHUFFLE_ACTION"

    .line 154
    .line 155
    invoke-direct {v4, v8, v6, v7}, Landroid/support/v4/media/session/PlaybackStateCompat$CustomAction$Builder;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;I)V

    .line 156
    .line 157
    .line 158
    invoke-virtual {v4}, Landroid/support/v4/media/session/PlaybackStateCompat$CustomAction$Builder;->build()Landroid/support/v4/media/session/PlaybackStateCompat$CustomAction;

    .line 159
    .line 160
    .line 161
    move-result-object v4

    .line 162
    invoke-virtual {p0, v4}, Landroid/support/v4/media/session/PlaybackStateCompat$Builder;->addCustomAction(Landroid/support/v4/media/session/PlaybackStateCompat$CustomAction;)Landroid/support/v4/media/session/PlaybackStateCompat$Builder;

    .line 163
    .line 164
    .line 165
    invoke-interface {v0, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 166
    .line 167
    .line 168
    goto :goto_1

    .line 169
    :cond_7
    const-string v5, "REPEAT"

    .line 170
    .line 171
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 172
    .line 173
    .line 174
    move-result v4

    .line 175
    if-nez v4, :cond_8

    .line 176
    .line 177
    goto :goto_1

    .line 178
    :cond_8
    new-instance v4, Landroid/support/v4/media/session/PlaybackStateCompat$CustomAction$Builder;

    .line 179
    .line 180
    const-string v6, "Repeat"

    .line 181
    .line 182
    sget v7, Lcom/melodix/music/WebService;->C:I

    .line 183
    .line 184
    const-string v8, "REPEAT_ACTION"

    .line 185
    .line 186
    invoke-direct {v4, v8, v6, v7}, Landroid/support/v4/media/session/PlaybackStateCompat$CustomAction$Builder;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;I)V

    .line 187
    .line 188
    .line 189
    invoke-virtual {v4}, Landroid/support/v4/media/session/PlaybackStateCompat$CustomAction$Builder;->build()Landroid/support/v4/media/session/PlaybackStateCompat$CustomAction;

    .line 190
    .line 191
    .line 192
    move-result-object v4

    .line 193
    invoke-virtual {p0, v4}, Landroid/support/v4/media/session/PlaybackStateCompat$Builder;->addCustomAction(Landroid/support/v4/media/session/PlaybackStateCompat$CustomAction;)Landroid/support/v4/media/session/PlaybackStateCompat$Builder;

    .line 194
    .line 195
    .line 196
    invoke-interface {v0, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 197
    .line 198
    .line 199
    goto/16 :goto_1

    .line 200
    .line 201
    :cond_9
    return-void
.end method

.method public static b(Z)V
    .locals 12

    .line 1
    const-string v0, "true"

    .line 2
    .line 3
    sget-object v1, Lcom/melodix/music/WebService;->G:Lcom/melodix/music/WebService;

    .line 4
    .line 5
    if-eqz v1, :cond_d

    .line 6
    .line 7
    :try_start_0
    sget-boolean v2, Lcom/melodix/music/WebService;->s:Z

    .line 8
    .line 9
    if-eqz v2, :cond_0

    .line 10
    .line 11
    invoke-virtual {v1}, Lcom/melodix/music/WebService;->a()V

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    invoke-virtual {v1}, Lcom/melodix/music/WebService;->j()V

    .line 16
    .line 17
    .line 18
    :goto_0
    iget-object v2, v1, Lcom/melodix/music/WebService;->j:Landroid/support/v4/media/session/MediaSessionCompat;

    .line 19
    .line 20
    const/4 v3, 0x0

    .line 21
    if-eqz v2, :cond_7

    .line 22
    .line 23
    invoke-virtual {v2}, Landroid/support/v4/media/session/MediaSessionCompat;->isActive()Z

    .line 24
    .line 25
    .line 26
    move-result v4

    .line 27
    if-eqz v4, :cond_7

    .line 28
    .line 29
    sget-boolean v4, Lcom/melodix/music/WebService;->s:Z

    .line 30
    .line 31
    if-eqz v4, :cond_1

    .line 32
    .line 33
    const/4 v4, 0x3

    .line 34
    :goto_1
    move v6, v4

    .line 35
    goto :goto_2

    .line 36
    :cond_1
    const/4 v4, 0x2

    .line 37
    goto :goto_1

    .line 38
    :goto_2
    new-instance v4, Landroid/support/v4/media/session/PlaybackStateCompat$Builder;

    .line 39
    .line 40
    invoke-direct {v4}, Landroid/support/v4/media/session/PlaybackStateCompat$Builder;-><init>()V

    .line 41
    .line 42
    .line 43
    const-wide/16 v7, 0x4337

    .line 44
    .line 45
    invoke-virtual {v4, v7, v8}, Landroid/support/v4/media/session/PlaybackStateCompat$Builder;->setActions(J)Landroid/support/v4/media/session/PlaybackStateCompat$Builder;

    .line 46
    .line 47
    .line 48
    move-result-object v5

    .line 49
    sget-wide v7, Lcom/melodix/music/WebService;->z:J

    .line 50
    .line 51
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 52
    .line 53
    .line 54
    move-result-wide v10

    .line 55
    const/high16 v9, 0x3f800000    # 1.0f

    .line 56
    .line 57
    invoke-virtual/range {v5 .. v11}, Landroid/support/v4/media/session/PlaybackStateCompat$Builder;->setState(IJFJ)Landroid/support/v4/media/session/PlaybackStateCompat$Builder;

    .line 58
    .line 59
    .line 60
    sget-object v4, Lcom/melodix/music/WebService;->w:Ljava/lang/String;

    .line 61
    .line 62
    invoke-virtual {v4, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    .line 66
    const-string v7, "mixed"

    .line 67
    .line 68
    if-eqz v6, :cond_2

    .line 69
    .line 70
    const v4, 0x7f080126

    .line 71
    .line 72
    .line 73
    goto :goto_3

    .line 74
    :cond_2
    :try_start_1
    invoke-virtual {v4, v7}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move-result v4

    .line 78
    if-eqz v4, :cond_3

    .line 79
    .line 80
    const v4, 0x7f080127

    .line 81
    .line 82
    .line 83
    goto :goto_3

    .line 84
    :cond_3
    const v4, 0x7f080125

    .line 85
    .line 86
    .line 87
    :goto_3
    sput v4, Lcom/melodix/music/WebService;->C:I

    .line 88
    .line 89
    sget-object v4, Lcom/melodix/music/WebService;->x:Ljava/lang/String;

    .line 90
    .line 91
    invoke-virtual {v4, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    if-eqz v0, :cond_4

    .line 96
    .line 97
    const v0, 0x7f080129

    .line 98
    .line 99
    .line 100
    goto :goto_4

    .line 101
    :cond_4
    invoke-virtual {v4, v7}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    if-eqz v0, :cond_5

    .line 106
    .line 107
    const v0, 0x7f08012b

    .line 108
    .line 109
    .line 110
    goto :goto_4

    .line 111
    :cond_5
    const v0, 0x7f08012a

    .line 112
    .line 113
    .line 114
    :goto_4
    sput v0, Lcom/melodix/music/WebService;->D:I

    .line 115
    .line 116
    sget-boolean v0, Lcom/melodix/music/WebService;->r:Z

    .line 117
    .line 118
    invoke-static {v5}, Lzi1;->a(Landroid/support/v4/media/session/PlaybackStateCompat$Builder;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_3

    .line 119
    .line 120
    .line 121
    :try_start_2
    invoke-virtual {v5}, Landroid/support/v4/media/session/PlaybackStateCompat$Builder;->build()Landroid/support/v4/media/session/PlaybackStateCompat;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    invoke-virtual {v2, v0}, Landroid/support/v4/media/session/MediaSessionCompat;->setPlaybackState(Landroid/support/v4/media/session/PlaybackStateCompat;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 126
    .line 127
    .line 128
    :catchall_0
    if-nez p0, :cond_7

    .line 129
    .line 130
    :try_start_3
    new-instance p0, Landroid/support/v4/media/MediaMetadataCompat$Builder;

    .line 131
    .line 132
    invoke-direct {p0}, Landroid/support/v4/media/MediaMetadataCompat$Builder;-><init>()V

    .line 133
    .line 134
    .line 135
    const-string v0, "android.media.metadata.TITLE"

    .line 136
    .line 137
    sget-object v4, Lcom/melodix/music/WebService;->v:Ljava/lang/String;

    .line 138
    .line 139
    invoke-virtual {p0, v0, v4}, Landroid/support/v4/media/MediaMetadataCompat$Builder;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/support/v4/media/MediaMetadataCompat$Builder;

    .line 140
    .line 141
    .line 142
    move-result-object p0

    .line 143
    const-string v0, "android.media.metadata.ARTIST"

    .line 144
    .line 145
    sget-object v4, Lcom/melodix/music/WebService;->u:Ljava/lang/String;

    .line 146
    .line 147
    invoke-virtual {p0, v0, v4}, Landroid/support/v4/media/MediaMetadataCompat$Builder;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/support/v4/media/MediaMetadataCompat$Builder;

    .line 148
    .line 149
    .line 150
    move-result-object p0

    .line 151
    const-string v0, "android.media.metadata.DURATION"

    .line 152
    .line 153
    sget-wide v4, Lcom/melodix/music/WebService;->y:J

    .line 154
    .line 155
    invoke-virtual {p0, v0, v4, v5}, Landroid/support/v4/media/MediaMetadataCompat$Builder;->putLong(Ljava/lang/String;J)Landroid/support/v4/media/MediaMetadataCompat$Builder;

    .line 156
    .line 157
    .line 158
    move-result-object p0

    .line 159
    const-string v0, "android.media.metadata.ALBUM_ART"

    .line 160
    .line 161
    sget-object v4, Lcom/melodix/music/WebService;->B:Landroid/graphics/Bitmap;

    .line 162
    .line 163
    invoke-virtual {p0, v0, v4}, Landroid/support/v4/media/MediaMetadataCompat$Builder;->putBitmap(Ljava/lang/String;Landroid/graphics/Bitmap;)Landroid/support/v4/media/MediaMetadataCompat$Builder;

    .line 164
    .line 165
    .line 166
    move-result-object p0

    .line 167
    invoke-virtual {p0}, Landroid/support/v4/media/MediaMetadataCompat$Builder;->build()Landroid/support/v4/media/MediaMetadataCompat;

    .line 168
    .line 169
    .line 170
    move-result-object p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    .line 171
    :try_start_4
    invoke-virtual {v2, p0}, Landroid/support/v4/media/session/MediaSessionCompat;->setMetadata(Landroid/support/v4/media/MediaMetadataCompat;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 172
    .line 173
    .line 174
    :catchall_1
    :try_start_5
    const-string p0, "notification"

    .line 175
    .line 176
    invoke-virtual {v1, p0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 177
    .line 178
    .line 179
    move-result-object p0

    .line 180
    instance-of v0, p0, Landroid/app/NotificationManager;

    .line 181
    .line 182
    if-eqz v0, :cond_6

    .line 183
    .line 184
    check-cast p0, Landroid/app/NotificationManager;

    .line 185
    .line 186
    goto :goto_5

    .line 187
    :cond_6
    move-object p0, v3

    .line 188
    :goto_5
    if-eqz p0, :cond_7

    .line 189
    .line 190
    invoke-virtual {v1}, Lcom/melodix/music/WebService;->b()Landroid/app/Notification;

    .line 191
    .line 192
    .line 193
    move-result-object v0

    .line 194
    const/16 v2, 0x539

    .line 195
    .line 196
    invoke-virtual {p0, v2, v0}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 197
    .line 198
    .line 199
    :catchall_2
    :cond_7
    :try_start_6
    sget-object p0, Lcom/melodix/music/HomeWidget;->a:Landroid/os/Handler;

    .line 200
    .line 201
    invoke-static {v1}, Lcom/melodix/music/a;->c(Landroid/content/Context;)V

    .line 202
    .line 203
    .line 204
    sget-boolean p0, Lcom/melodix/music/WebService;->s:Z
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    .line 205
    .line 206
    const-string v0, "mWakeLock"

    .line 207
    .line 208
    if-eqz p0, :cond_a

    .line 209
    .line 210
    :try_start_7
    iget-object p0, v1, Lcom/melodix/music/WebService;->k:Landroid/os/PowerManager$WakeLock;

    .line 211
    .line 212
    if-eqz p0, :cond_9

    .line 213
    .line 214
    invoke-virtual {p0}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    .line 215
    .line 216
    .line 217
    move-result p0

    .line 218
    if-nez p0, :cond_a

    .line 219
    .line 220
    iget-object p0, v1, Lcom/melodix/music/WebService;->k:Landroid/os/PowerManager$WakeLock;

    .line 221
    .line 222
    if-eqz p0, :cond_8

    .line 223
    .line 224
    const-wide/32 v0, 0x927c0

    .line 225
    .line 226
    .line 227
    invoke-virtual {p0, v0, v1}, Landroid/os/PowerManager$WakeLock;->acquire(J)V

    .line 228
    .line 229
    .line 230
    goto :goto_6

    .line 231
    :cond_8
    invoke-static {v0}, Ldl1;->p(Ljava/lang/String;)V

    .line 232
    .line 233
    .line 234
    throw v3

    .line 235
    :cond_9
    invoke-static {v0}, Ldl1;->p(Ljava/lang/String;)V

    .line 236
    .line 237
    .line 238
    throw v3

    .line 239
    :cond_a
    sget-boolean p0, Lcom/melodix/music/WebService;->s:Z

    .line 240
    .line 241
    if-nez p0, :cond_d

    .line 242
    .line 243
    iget-object p0, v1, Lcom/melodix/music/WebService;->k:Landroid/os/PowerManager$WakeLock;

    .line 244
    .line 245
    if-eqz p0, :cond_c

    .line 246
    .line 247
    invoke-virtual {p0}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    .line 248
    .line 249
    .line 250
    move-result p0

    .line 251
    if-eqz p0, :cond_d

    .line 252
    .line 253
    iget-object p0, v1, Lcom/melodix/music/WebService;->k:Landroid/os/PowerManager$WakeLock;

    .line 254
    .line 255
    if-eqz p0, :cond_b

    .line 256
    .line 257
    invoke-virtual {p0}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 258
    .line 259
    .line 260
    goto :goto_6

    .line 261
    :cond_b
    invoke-static {v0}, Ldl1;->p(Ljava/lang/String;)V

    .line 262
    .line 263
    .line 264
    throw v3

    .line 265
    :cond_c
    invoke-static {v0}, Ldl1;->p(Ljava/lang/String;)V

    .line 266
    .line 267
    .line 268
    throw v3
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    .line 269
    :catchall_3
    :cond_d
    :goto_6
    return-void
.end method
