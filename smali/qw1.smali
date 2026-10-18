.class public final Lqw1;
.super Lzw1;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final synthetic n:I

.field public final synthetic o:Ljava/lang/Object;

.field public final synthetic p:Ljava/lang/Object;

.field public final synthetic q:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lcx1;Landroid/app/Activity;Lqv1;)V
    .locals 1

    .line 1
    const/4 v0, 0x3

    .line 2
    iput v0, p0, Lqw1;->n:I

    .line 3
    .line 4
    iput-object p2, p0, Lqw1;->p:Ljava/lang/Object;

    .line 5
    .line 6
    iput-object p3, p0, Lqw1;->q:Ljava/lang/Object;

    .line 7
    .line 8
    iput-object p1, p0, Lqw1;->o:Ljava/lang/Object;

    .line 9
    .line 10
    iget-object p1, p1, Lcx1;->k:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast p1, Ldx1;

    .line 13
    .line 14
    const/4 p2, 0x1

    .line 15
    invoke-direct {p0, p1, p2}, Lzw1;-><init>(Ldx1;Z)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public constructor <init>(Lcx1;Landroid/os/Bundle;Landroid/app/Activity;)V
    .locals 1

    const/4 v0, 0x2

    iput v0, p0, Lqw1;->n:I

    .line 19
    iput-object p2, p0, Lqw1;->q:Ljava/lang/Object;

    iput-object p3, p0, Lqw1;->p:Ljava/lang/Object;

    iput-object p1, p0, Lqw1;->o:Ljava/lang/Object;

    iget-object p1, p1, Lcx1;->k:Ljava/lang/Object;

    check-cast p1, Ldx1;

    const/4 p2, 0x1

    .line 20
    invoke-direct {p0, p1, p2}, Lzw1;-><init>(Ldx1;Z)V

    return-void
.end method

.method public constructor <init>(Ldx1;Landroid/content/Context;Landroid/os/Bundle;)V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lqw1;->n:I

    .line 21
    iput-object p2, p0, Lqw1;->p:Ljava/lang/Object;

    iput-object p3, p0, Lqw1;->q:Ljava/lang/Object;

    iput-object p1, p0, Lqw1;->o:Ljava/lang/Object;

    const/4 p2, 0x1

    .line 22
    invoke-direct {p0, p1, p2}, Lzw1;-><init>(Ldx1;Z)V

    return-void
.end method

.method public constructor <init>(Ldx1;Ljava/lang/String;Lqv1;)V
    .locals 1

    const/4 v0, 0x1

    iput v0, p0, Lqw1;->n:I

    .line 23
    iput-object p2, p0, Lqw1;->p:Ljava/lang/Object;

    iput-object p3, p0, Lqw1;->q:Ljava/lang/Object;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lqw1;->o:Ljava/lang/Object;

    .line 24
    invoke-direct {p0, p1, v0}, Lzw1;-><init>(Ldx1;Z)V

    return-void
.end method


# virtual methods
.method public final a()V
    .locals 22

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    iget v0, v1, Lqw1;->n:I

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    packed-switch v0, :pswitch_data_0

    .line 7
    .line 8
    .line 9
    iget-object v0, v1, Lqw1;->o:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast v0, Lcx1;

    .line 12
    .line 13
    iget-object v0, v0, Lcx1;->k:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast v0, Ldx1;

    .line 16
    .line 17
    iget-object v0, v0, Ldx1;->f:Ltv1;

    .line 18
    .line 19
    invoke-static {v0}, Lbh;->h(Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    iget-object v2, v1, Lqw1;->p:Ljava/lang/Object;

    .line 23
    .line 24
    check-cast v2, Landroid/app/Activity;

    .line 25
    .line 26
    invoke-static {v2}, Lmw1;->b(Landroid/app/Activity;)Lmw1;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    iget-object v3, v1, Lqw1;->q:Ljava/lang/Object;

    .line 31
    .line 32
    check-cast v3, Lqv1;

    .line 33
    .line 34
    iget-wide v4, v1, Lzw1;->k:J

    .line 35
    .line 36
    invoke-interface {v0, v2, v3, v4, v5}, Ltv1;->onActivitySaveInstanceStateByScionActivityInfo(Lmw1;Lvv1;J)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :pswitch_0
    iget-object v0, v1, Lqw1;->q:Ljava/lang/Object;

    .line 41
    .line 42
    check-cast v0, Landroid/os/Bundle;

    .line 43
    .line 44
    if-eqz v0, :cond_0

    .line 45
    .line 46
    new-instance v2, Landroid/os/Bundle;

    .line 47
    .line 48
    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    .line 49
    .line 50
    .line 51
    const-string v3, "com.google.app_measurement.screen_service"

    .line 52
    .line 53
    invoke-virtual {v0, v3}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 54
    .line 55
    .line 56
    move-result v4

    .line 57
    if-eqz v4, :cond_0

    .line 58
    .line 59
    invoke-virtual {v0, v3}, Landroid/os/BaseBundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    instance-of v4, v0, Landroid/os/Bundle;

    .line 64
    .line 65
    if-eqz v4, :cond_0

    .line 66
    .line 67
    check-cast v0, Landroid/os/Bundle;

    .line 68
    .line 69
    invoke-virtual {v2, v3, v0}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 70
    .line 71
    .line 72
    :cond_0
    iget-object v0, v1, Lqw1;->o:Ljava/lang/Object;

    .line 73
    .line 74
    check-cast v0, Lcx1;

    .line 75
    .line 76
    iget-object v0, v0, Lcx1;->k:Ljava/lang/Object;

    .line 77
    .line 78
    check-cast v0, Ldx1;

    .line 79
    .line 80
    iget-object v0, v0, Ldx1;->f:Ltv1;

    .line 81
    .line 82
    invoke-static {v0}, Lbh;->h(Ljava/lang/Object;)V

    .line 83
    .line 84
    .line 85
    iget-object v3, v1, Lqw1;->p:Ljava/lang/Object;

    .line 86
    .line 87
    check-cast v3, Landroid/app/Activity;

    .line 88
    .line 89
    iget-wide v4, v1, Lzw1;->k:J

    .line 90
    .line 91
    invoke-static {v3}, Lmw1;->b(Landroid/app/Activity;)Lmw1;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    invoke-interface {v0, v1, v2, v4, v5}, Ltv1;->onActivityCreatedByScionActivityInfo(Lmw1;Landroid/os/Bundle;J)V

    .line 96
    .line 97
    .line 98
    return-void

    .line 99
    :pswitch_1
    iget-object v0, v1, Lqw1;->o:Ljava/lang/Object;

    .line 100
    .line 101
    check-cast v0, Ldx1;

    .line 102
    .line 103
    iget-object v0, v0, Ldx1;->f:Ltv1;

    .line 104
    .line 105
    invoke-static {v0}, Lbh;->h(Ljava/lang/Object;)V

    .line 106
    .line 107
    .line 108
    iget-object v2, v1, Lqw1;->p:Ljava/lang/Object;

    .line 109
    .line 110
    check-cast v2, Ljava/lang/String;

    .line 111
    .line 112
    iget-object v1, v1, Lqw1;->q:Ljava/lang/Object;

    .line 113
    .line 114
    check-cast v1, Lqv1;

    .line 115
    .line 116
    invoke-interface {v0, v2, v1}, Ltv1;->getMaxUserProperties(Ljava/lang/String;Lvv1;)V

    .line 117
    .line 118
    .line 119
    return-void

    .line 120
    :pswitch_2
    const/4 v3, 0x0

    .line 121
    const/4 v4, 0x1

    .line 122
    :try_start_0
    iget-object v0, v1, Lqw1;->p:Ljava/lang/Object;

    .line 123
    .line 124
    move-object v5, v0

    .line 125
    check-cast v5, Landroid/content/Context;

    .line 126
    .line 127
    invoke-static {v5}, Lbh;->h(Ljava/lang/Object;)V

    .line 128
    .line 129
    .line 130
    invoke-static {v5}, Lml;->G(Landroid/content/Context;)Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 135
    .line 136
    .line 137
    move-result-object v6

    .line 138
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 139
    .line 140
    .line 141
    move-result v7

    .line 142
    if-eqz v7, :cond_1

    .line 143
    .line 144
    invoke-static {v5}, Lml;->G(Landroid/content/Context;)Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    goto :goto_0

    .line 149
    :catch_0
    move-exception v0

    .line 150
    goto/16 :goto_8

    .line 151
    .line 152
    :cond_1
    :goto_0
    const-string v7, "google_analytics_force_disable_updates"

    .line 153
    .line 154
    const-string v8, "bool"

    .line 155
    .line 156
    invoke-virtual {v6, v7, v8, v0}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 157
    .line 158
    .line 159
    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 160
    if-nez v0, :cond_2

    .line 161
    .line 162
    :catch_1
    move-object v6, v2

    .line 163
    goto :goto_1

    .line 164
    :cond_2
    :try_start_1
    invoke-virtual {v6, v0}, Landroid/content/res/Resources;->getBoolean(I)Z

    .line 165
    .line 166
    .line 167
    move-result v0

    .line 168
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 169
    .line 170
    .line 171
    move-result-object v0
    :try_end_1
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 172
    move-object v6, v0

    .line 173
    :goto_1
    :try_start_2
    iget-object v0, v1, Lqw1;->o:Ljava/lang/Object;

    .line 174
    .line 175
    move-object v7, v0

    .line 176
    check-cast v7, Ldx1;

    .line 177
    .line 178
    if-eqz v6, :cond_3

    .line 179
    .line 180
    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    .line 181
    .line 182
    .line 183
    move-result v0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 184
    if-nez v0, :cond_4

    .line 185
    .line 186
    :cond_3
    move v0, v4

    .line 187
    goto :goto_2

    .line 188
    :cond_4
    move v0, v3

    .line 189
    :goto_2
    const-string v8, "com.google.android.gms.measurement.dynamite"

    .line 190
    .line 191
    if-eqz v0, :cond_5

    .line 192
    .line 193
    :try_start_3
    sget-object v0, Ljz;->c:Lnv1;

    .line 194
    .line 195
    goto :goto_3

    .line 196
    :catch_2
    move-exception v0

    .line 197
    goto :goto_4

    .line 198
    :cond_5
    sget-object v0, Ljz;->b:Llv1;

    .line 199
    .line 200
    :goto_3
    invoke-static {v5, v0, v8}, Ljz;->c(Landroid/content/Context;Liz;Ljava/lang/String;)Ljz;

    .line 201
    .line 202
    .line 203
    move-result-object v0

    .line 204
    const-string v9, "com.google.android.gms.measurement.internal.AppMeasurementDynamiteService"

    .line 205
    .line 206
    invoke-virtual {v0, v9}, Ljz;->b(Ljava/lang/String;)Landroid/os/IBinder;

    .line 207
    .line 208
    .line 209
    move-result-object v0

    .line 210
    invoke-static {v0}, Lsv1;->asInterface(Landroid/os/IBinder;)Ltv1;

    .line 211
    .line 212
    .line 213
    move-result-object v2
    :try_end_3
    .catch Lfz; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 214
    goto :goto_5

    .line 215
    :goto_4
    :try_start_4
    invoke-virtual {v7, v0, v4, v3}, Ldx1;->d(Ljava/lang/Exception;ZZ)V

    .line 216
    .line 217
    .line 218
    :goto_5
    iput-object v2, v7, Ldx1;->f:Ltv1;

    .line 219
    .line 220
    iget-object v0, v7, Ldx1;->f:Ltv1;

    .line 221
    .line 222
    if-nez v0, :cond_6

    .line 223
    .line 224
    goto/16 :goto_9

    .line 225
    .line 226
    :cond_6
    invoke-static {v5, v8}, Ljz;->a(Landroid/content/Context;Ljava/lang/String;)I

    .line 227
    .line 228
    .line 229
    move-result v0

    .line 230
    invoke-static {v5, v8, v3}, Ljz;->d(Landroid/content/Context;Ljava/lang/String;Z)I

    .line 231
    .line 232
    .line 233
    move-result v2

    .line 234
    invoke-static {v0, v2}, Ljava/lang/Math;->max(II)I

    .line 235
    .line 236
    .line 237
    move-result v8

    .line 238
    sget-object v9, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 239
    .line 240
    invoke-virtual {v9, v6}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    .line 241
    .line 242
    .line 243
    move-result v6

    .line 244
    if-nez v6, :cond_7

    .line 245
    .line 246
    if-ge v2, v0, :cond_8

    .line 247
    .line 248
    :cond_7
    move v14, v4

    .line 249
    goto :goto_6

    .line 250
    :cond_8
    move v14, v3

    .line 251
    :goto_6
    int-to-long v12, v8

    .line 252
    iput-wide v12, v7, Ldx1;->g:J

    .line 253
    .line 254
    new-instance v17, Llw1;

    .line 255
    .line 256
    iget-object v0, v1, Lqw1;->q:Ljava/lang/Object;

    .line 257
    .line 258
    move-object v15, v0

    .line 259
    check-cast v15, Landroid/os/Bundle;

    .line 260
    .line 261
    invoke-static {v5}, Lml;->G(Landroid/content/Context;)Ljava/lang/String;

    .line 262
    .line 263
    .line 264
    move-result-object v16

    .line 265
    const-wide/32 v10, 0x274e8

    .line 266
    .line 267
    .line 268
    move-object/from16 v9, v17

    .line 269
    .line 270
    invoke-direct/range {v9 .. v16}, Llw1;-><init>(JJZLandroid/os/Bundle;Ljava/lang/String;)V

    .line 271
    .line 272
    .line 273
    iget-wide v8, v7, Ldx1;->g:J
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 274
    .line 275
    const-wide/16 v10, 0xa9

    .line 276
    .line 277
    cmp-long v0, v8, v10

    .line 278
    .line 279
    if-ltz v0, :cond_9

    .line 280
    .line 281
    move v0, v4

    .line 282
    goto :goto_7

    .line 283
    :cond_9
    move v0, v3

    .line 284
    :goto_7
    iget-object v15, v7, Ldx1;->f:Ltv1;

    .line 285
    .line 286
    if-eqz v0, :cond_a

    .line 287
    .line 288
    :try_start_5
    invoke-static {v15}, Lbh;->h(Ljava/lang/Object;)V

    .line 289
    .line 290
    .line 291
    new-instance v0, Lkr0;

    .line 292
    .line 293
    invoke-direct {v0, v5}, Lkr0;-><init>(Ljava/lang/Object;)V

    .line 294
    .line 295
    .line 296
    iget-wide v5, v1, Lzw1;->j:J

    .line 297
    .line 298
    iget-wide v7, v1, Lzw1;->k:J

    .line 299
    .line 300
    move-object/from16 v16, v0

    .line 301
    .line 302
    move-wide/from16 v18, v5

    .line 303
    .line 304
    move-wide/from16 v20, v7

    .line 305
    .line 306
    invoke-interface/range {v15 .. v21}, Ltv1;->initializeWithElapsedTime(Lid0;Llw1;JJ)V

    .line 307
    .line 308
    .line 309
    goto :goto_9

    .line 310
    :cond_a
    move-object/from16 v9, v17

    .line 311
    .line 312
    invoke-static {v15}, Lbh;->h(Ljava/lang/Object;)V

    .line 313
    .line 314
    .line 315
    new-instance v0, Lkr0;

    .line 316
    .line 317
    invoke-direct {v0, v5}, Lkr0;-><init>(Ljava/lang/Object;)V

    .line 318
    .line 319
    .line 320
    iget-wide v5, v1, Lzw1;->j:J

    .line 321
    .line 322
    invoke-interface {v15, v0, v9, v5, v6}, Ltv1;->initialize(Lid0;Llw1;J)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0

    .line 323
    .line 324
    .line 325
    goto :goto_9

    .line 326
    :goto_8
    iget-object v1, v1, Lqw1;->o:Ljava/lang/Object;

    .line 327
    .line 328
    check-cast v1, Ldx1;

    .line 329
    .line 330
    invoke-virtual {v1, v0, v4, v3}, Ldx1;->d(Ljava/lang/Exception;ZZ)V

    .line 331
    .line 332
    .line 333
    :goto_9
    return-void

    .line 334
    nop

    .line 335
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public b()V
    .locals 1

    .line 1
    iget v0, p0, Lqw1;->n:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :pswitch_0
    iget-object p0, p0, Lqw1;->q:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast p0, Lqv1;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p0, v0}, Lqv1;->l(Landroid/os/Bundle;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    nop

    .line 17
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method
