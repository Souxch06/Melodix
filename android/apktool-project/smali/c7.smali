.class public final Lc7;
.super Landroid/content/BroadcastReceiver;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final synthetic a:I

.field public final b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;)V
    .locals 0

    .line 10
    iput p1, p0, Lc7;->a:I

    iput-object p2, p0, Lc7;->b:Ljava/lang/Object;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method public constructor <init>(Ly02;)V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    iput v0, p0, Lc7;->a:I

    .line 3
    .line 4
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Lc7;->b:Ljava/lang/Object;

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 4

    .line 1
    iget p1, p0, Lc7;->a:I

    .line 2
    .line 3
    iget-object v0, p0, Lc7;->b:Ljava/lang/Object;

    .line 4
    .line 5
    packed-switch p1, :pswitch_data_0

    .line 6
    .line 7
    .line 8
    check-cast v0, Ly02;

    .line 9
    .line 10
    if-nez p2, :cond_0

    .line 11
    .line 12
    iget-object p0, v0, Ly02;->o:Lzy1;

    .line 13
    .line 14
    invoke-static {p0}, Ly02;->l(Lm22;)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lzy1;->r:Lso;

    .line 18
    .line 19
    const-string p1, "App receiver called with null intent"

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Lso;->b(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    goto/16 :goto_1

    .line 25
    .line 26
    :cond_0
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    if-nez p1, :cond_1

    .line 31
    .line 32
    iget-object p0, v0, Ly02;->o:Lzy1;

    .line 33
    .line 34
    invoke-static {p0}, Ly02;->l(Lm22;)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Lzy1;->r:Lso;

    .line 38
    .line 39
    const-string p1, "App receiver called with null action"

    .line 40
    .line 41
    invoke-virtual {p0, p1}, Lso;->b(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 46
    .line 47
    .line 48
    move-result p2

    .line 49
    const v1, -0x72ee9a21

    .line 50
    .line 51
    .line 52
    if-eq p2, v1, :cond_3

    .line 53
    .line 54
    const v1, 0x4c497878    # 5.2814304E7f

    .line 55
    .line 56
    .line 57
    if-eq p2, v1, :cond_2

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_2
    const-string p2, "com.google.android.gms.measurement.BATCHES_AVAILABLE"

    .line 61
    .line 62
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    if-eqz p1, :cond_5

    .line 67
    .line 68
    iget-object p1, v0, Ly02;->o:Lzy1;

    .line 69
    .line 70
    invoke-static {p1}, Ly02;->l(Lm22;)V

    .line 71
    .line 72
    .line 73
    iget-object p1, p1, Lzy1;->w:Lso;

    .line 74
    .line 75
    const-string p2, "[sgtm] App Receiver notified batches are available"

    .line 76
    .line 77
    invoke-virtual {p1, p2}, Lso;->b(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    iget-object p1, v0, Ly02;->p:Ls02;

    .line 81
    .line 82
    invoke-static {p1}, Ly02;->l(Lm22;)V

    .line 83
    .line 84
    .line 85
    new-instance p2, Lad2;

    .line 86
    .line 87
    invoke-direct {p2, p0}, Lad2;-><init>(Lc7;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {p1, p2}, Ls02;->u(Ljava/lang/Runnable;)V

    .line 91
    .line 92
    .line 93
    goto :goto_1

    .line 94
    :cond_3
    const-string p0, "com.google.android.gms.measurement.TRIGGERS_AVAILABLE"

    .line 95
    .line 96
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 97
    .line 98
    .line 99
    move-result p0

    .line 100
    if-eqz p0, :cond_5

    .line 101
    .line 102
    invoke-static {}, Lqs1;->a()V

    .line 103
    .line 104
    .line 105
    iget-object p0, v0, Ly02;->m:Lmt1;

    .line 106
    .line 107
    const/4 p1, 0x0

    .line 108
    sget-object p2, Lxx1;->P0:Lwx1;

    .line 109
    .line 110
    invoke-virtual {p0, p1, p2}, Lmt1;->w(Ljava/lang/String;Lwx1;)Z

    .line 111
    .line 112
    .line 113
    move-result p0

    .line 114
    if-nez p0, :cond_4

    .line 115
    .line 116
    goto :goto_1

    .line 117
    :cond_4
    iget-object p0, v0, Ly02;->o:Lzy1;

    .line 118
    .line 119
    invoke-static {p0}, Ly02;->l(Lm22;)V

    .line 120
    .line 121
    .line 122
    iget-object p0, p0, Lzy1;->w:Lso;

    .line 123
    .line 124
    const-string p1, "App receiver notified triggers are available"

    .line 125
    .line 126
    invoke-virtual {p0, p1}, Lso;->b(Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    iget-object p0, v0, Ly02;->p:Ls02;

    .line 130
    .line 131
    invoke-static {p0}, Ly02;->l(Lm22;)V

    .line 132
    .line 133
    .line 134
    new-instance p1, Lcd2;

    .line 135
    .line 136
    invoke-direct {p1, v0}, Lcd2;-><init>(Ly02;)V

    .line 137
    .line 138
    .line 139
    invoke-virtual {p0, p1}, Ls02;->u(Ljava/lang/Runnable;)V

    .line 140
    .line 141
    .line 142
    goto :goto_1

    .line 143
    :cond_5
    :goto_0
    iget-object p0, v0, Ly02;->o:Lzy1;

    .line 144
    .line 145
    invoke-static {p0}, Ly02;->l(Lm22;)V

    .line 146
    .line 147
    .line 148
    iget-object p0, p0, Lzy1;->r:Lso;

    .line 149
    .line 150
    const-string p1, "App receiver called with unknown action"

    .line 151
    .line 152
    invoke-virtual {p0, p1}, Lso;->b(Ljava/lang/String;)V

    .line 153
    .line 154
    .line 155
    :goto_1
    return-void

    .line 156
    :pswitch_0
    check-cast v0, Lcom/melodix/music/WebService;

    .line 157
    .line 158
    sget-boolean p0, Lcom/melodix/music/WebService;->r:Z

    .line 159
    .line 160
    if-eqz p0, :cond_13

    .line 161
    .line 162
    sget-boolean p0, Lcom/melodix/music/AppSingleton;->l:Z

    .line 163
    .line 164
    if-eqz p0, :cond_13

    .line 165
    .line 166
    iget-object p0, v0, Lcom/melodix/music/WebService;->j:Landroid/support/v4/media/session/MediaSessionCompat;

    .line 167
    .line 168
    if-nez p0, :cond_6

    .line 169
    .line 170
    goto/16 :goto_2

    .line 171
    .line 172
    :cond_6
    if-eqz p2, :cond_13

    .line 173
    .line 174
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object p0

    .line 178
    if-nez p0, :cond_7

    .line 179
    .line 180
    goto/16 :goto_2

    .line 181
    .line 182
    :cond_7
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    .line 183
    .line 184
    .line 185
    move-result p1

    .line 186
    const/4 v1, -0x1

    .line 187
    const/4 v2, 0x1

    .line 188
    const/4 v3, 0x0

    .line 189
    sparse-switch p1, :sswitch_data_0

    .line 190
    .line 191
    .line 192
    goto/16 :goto_2

    .line 193
    .line 194
    :sswitch_0
    const-string p1, "android.bluetooth.a2dp.profile.action.CONNECTION_STATE_CHANGED"

    .line 195
    .line 196
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 197
    .line 198
    .line 199
    move-result p0

    .line 200
    if-nez p0, :cond_8

    .line 201
    .line 202
    goto/16 :goto_2

    .line 203
    .line 204
    :sswitch_1
    const-string p1, "android.bluetooth.headset.profile.action.CONNECTION_STATE_CHANGED"

    .line 205
    .line 206
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 207
    .line 208
    .line 209
    move-result p0

    .line 210
    if-nez p0, :cond_8

    .line 211
    .line 212
    goto :goto_2

    .line 213
    :cond_8
    const-string p0, "android.bluetooth.profile.extra.STATE"

    .line 214
    .line 215
    invoke-virtual {p2, p0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 216
    .line 217
    .line 218
    move-result p0

    .line 219
    if-eqz p0, :cond_a

    .line 220
    .line 221
    const/4 p1, 0x2

    .line 222
    if-eq p0, p1, :cond_9

    .line 223
    .line 224
    goto :goto_2

    .line 225
    :cond_9
    invoke-virtual {v0, v2}, Lcom/melodix/music/WebService;->g(Z)V

    .line 226
    .line 227
    .line 228
    goto :goto_2

    .line 229
    :cond_a
    sget-boolean p0, Lcom/melodix/music/WebService;->s:Z

    .line 230
    .line 231
    if-nez p0, :cond_b

    .line 232
    .line 233
    goto :goto_2

    .line 234
    :cond_b
    invoke-virtual {v0}, Lcom/melodix/music/WebService;->h()Z

    .line 235
    .line 236
    .line 237
    move-result p0

    .line 238
    if-eqz p0, :cond_c

    .line 239
    .line 240
    goto :goto_2

    .line 241
    :cond_c
    invoke-virtual {v0, v2, v3}, Lcom/melodix/music/WebService;->f(ZZ)V

    .line 242
    .line 243
    .line 244
    goto :goto_2

    .line 245
    :sswitch_2
    const-string p1, "android.media.AUDIO_BECOMING_NOISY"

    .line 246
    .line 247
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 248
    .line 249
    .line 250
    move-result p0

    .line 251
    if-nez p0, :cond_d

    .line 252
    .line 253
    goto :goto_2

    .line 254
    :cond_d
    invoke-virtual {v0, v3, v2}, Lcom/melodix/music/WebService;->f(ZZ)V

    .line 255
    .line 256
    .line 257
    goto :goto_2

    .line 258
    :sswitch_3
    const-string p1, "android.intent.action.HEADSET_PLUG"

    .line 259
    .line 260
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 261
    .line 262
    .line 263
    move-result p0

    .line 264
    if-nez p0, :cond_e

    .line 265
    .line 266
    goto :goto_2

    .line 267
    :cond_e
    const-string p0, "state"

    .line 268
    .line 269
    invoke-virtual {p2, p0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 270
    .line 271
    .line 272
    move-result p0

    .line 273
    if-eqz p0, :cond_10

    .line 274
    .line 275
    if-eq p0, v2, :cond_f

    .line 276
    .line 277
    goto :goto_2

    .line 278
    :cond_f
    invoke-virtual {v0, v3}, Lcom/melodix/music/WebService;->g(Z)V

    .line 279
    .line 280
    .line 281
    goto :goto_2

    .line 282
    :cond_10
    sget-boolean p0, Lcom/melodix/music/WebService;->s:Z

    .line 283
    .line 284
    if-nez p0, :cond_11

    .line 285
    .line 286
    goto :goto_2

    .line 287
    :cond_11
    invoke-virtual {v0}, Lcom/melodix/music/WebService;->h()Z

    .line 288
    .line 289
    .line 290
    move-result p0

    .line 291
    if-eqz p0, :cond_12

    .line 292
    .line 293
    goto :goto_2

    .line 294
    :cond_12
    invoke-virtual {v0, v3, v3}, Lcom/melodix/music/WebService;->f(ZZ)V

    .line 295
    .line 296
    .line 297
    :cond_13
    :goto_2
    return-void

    .line 298
    :pswitch_1
    check-cast v0, Ld7;

    .line 299
    .line 300
    invoke-virtual {v0}, Ld7;->h()V

    .line 301
    .line 302
    .line 303
    return-void

    .line 304
    nop

    .line 305
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch

    .line 306
    .line 307
    .line 308
    .line 309
    .line 310
    .line 311
    .line 312
    .line 313
    :sswitch_data_0
    .sparse-switch
        -0x63ecb970 -> :sswitch_3
        -0x20bccddb -> :sswitch_2
        0x2083ec2d -> :sswitch_1
        0x4a286686 -> :sswitch_0
    .end sparse-switch
.end method
