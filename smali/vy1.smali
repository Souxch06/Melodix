.class public final Lvy1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:I

.field public final synthetic k:Ljava/lang/String;

.field public final synthetic l:Ljava/lang/Object;

.field public final synthetic m:Ljava/lang/Object;

.field public final synthetic n:Ljava/lang/Object;

.field public final synthetic o:Lzy1;


# direct methods
.method public constructor <init>(Lzy1;ILjava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p2, p0, Lvy1;->j:I

    .line 5
    .line 6
    iput-object p3, p0, Lvy1;->k:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p4, p0, Lvy1;->l:Ljava/lang/Object;

    .line 9
    .line 10
    iput-object p5, p0, Lvy1;->m:Ljava/lang/Object;

    .line 11
    .line 12
    iput-object p6, p0, Lvy1;->n:Ljava/lang/Object;

    .line 13
    .line 14
    iput-object p1, p0, Lvy1;->o:Lzy1;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 13

    .line 1
    iget-object v0, p0, Lvy1;->o:Lzy1;

    .line 2
    .line 3
    iget-object v1, v0, Let;->j:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v1, Ly02;

    .line 6
    .line 7
    iget-object v1, v1, Ly02;->n:Lvz1;

    .line 8
    .line 9
    invoke-static {v1}, Ly02;->j(Let;)V

    .line 10
    .line 11
    .line 12
    iget-boolean v2, v1, Lm22;->k:Z

    .line 13
    .line 14
    if-eqz v2, :cond_c

    .line 15
    .line 16
    iget-char v2, v0, Lzy1;->l:C

    .line 17
    .line 18
    const/4 v3, 0x0

    .line 19
    const/4 v4, 0x1

    .line 20
    if-nez v2, :cond_5

    .line 21
    .line 22
    iget-object v2, v0, Let;->j:Ljava/lang/Object;

    .line 23
    .line 24
    check-cast v2, Ly02;

    .line 25
    .line 26
    iget-object v2, v2, Ly02;->m:Lmt1;

    .line 27
    .line 28
    iget-object v5, v2, Lmt1;->n:Ljava/lang/Boolean;

    .line 29
    .line 30
    if-nez v5, :cond_3

    .line 31
    .line 32
    monitor-enter v2

    .line 33
    :try_start_0
    iget-object v5, v2, Lmt1;->n:Ljava/lang/Boolean;

    .line 34
    .line 35
    if-nez v5, :cond_2

    .line 36
    .line 37
    iget-object v5, v2, Let;->j:Ljava/lang/Object;

    .line 38
    .line 39
    check-cast v5, Ly02;

    .line 40
    .line 41
    iget-object v6, v5, Ly02;->j:Landroid/content/Context;

    .line 42
    .line 43
    invoke-virtual {v6}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    .line 44
    .line 45
    .line 46
    move-result-object v6

    .line 47
    invoke-static {}, Les0;->e()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v7

    .line 51
    if-eqz v6, :cond_1

    .line 52
    .line 53
    iget-object v6, v6, Landroid/content/pm/ApplicationInfo;->processName:Ljava/lang/String;

    .line 54
    .line 55
    if-eqz v6, :cond_0

    .line 56
    .line 57
    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v6

    .line 61
    if-eqz v6, :cond_0

    .line 62
    .line 63
    move v6, v4

    .line 64
    goto :goto_0

    .line 65
    :cond_0
    move v6, v3

    .line 66
    goto :goto_0

    .line 67
    :catchall_0
    move-exception p0

    .line 68
    goto :goto_1

    .line 69
    :goto_0
    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 70
    .line 71
    .line 72
    move-result-object v6

    .line 73
    iput-object v6, v2, Lmt1;->n:Ljava/lang/Boolean;

    .line 74
    .line 75
    :cond_1
    iget-object v6, v2, Lmt1;->n:Ljava/lang/Boolean;

    .line 76
    .line 77
    if-nez v6, :cond_2

    .line 78
    .line 79
    sget-object v6, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 80
    .line 81
    iput-object v6, v2, Lmt1;->n:Ljava/lang/Boolean;

    .line 82
    .line 83
    iget-object v5, v5, Ly02;->o:Lzy1;

    .line 84
    .line 85
    invoke-static {v5}, Ly02;->l(Lm22;)V

    .line 86
    .line 87
    .line 88
    iget-object v5, v5, Lzy1;->o:Lso;

    .line 89
    .line 90
    const-string v6, "My process not in the list of running processes"

    .line 91
    .line 92
    invoke-virtual {v5, v6}, Lso;->b(Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    :cond_2
    monitor-exit v2

    .line 96
    goto :goto_2

    .line 97
    :goto_1
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 98
    throw p0

    .line 99
    :cond_3
    :goto_2
    iget-object v2, v2, Lmt1;->n:Ljava/lang/Boolean;

    .line 100
    .line 101
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 102
    .line 103
    .line 104
    move-result v2

    .line 105
    if-eqz v2, :cond_4

    .line 106
    .line 107
    const/16 v2, 0x43

    .line 108
    .line 109
    iput-char v2, v0, Lzy1;->l:C

    .line 110
    .line 111
    goto :goto_3

    .line 112
    :cond_4
    const/16 v2, 0x63

    .line 113
    .line 114
    iput-char v2, v0, Lzy1;->l:C

    .line 115
    .line 116
    :cond_5
    :goto_3
    iget-wide v5, v0, Lzy1;->m:J

    .line 117
    .line 118
    const-wide/16 v7, 0x0

    .line 119
    .line 120
    cmp-long v2, v5, v7

    .line 121
    .line 122
    if-gez v2, :cond_6

    .line 123
    .line 124
    iget-object v2, v0, Let;->j:Ljava/lang/Object;

    .line 125
    .line 126
    check-cast v2, Ly02;

    .line 127
    .line 128
    iget-object v2, v2, Ly02;->m:Lmt1;

    .line 129
    .line 130
    invoke-virtual {v2}, Lmt1;->r()V

    .line 131
    .line 132
    .line 133
    const-wide/32 v5, 0x274e8

    .line 134
    .line 135
    .line 136
    iput-wide v5, v0, Lzy1;->m:J

    .line 137
    .line 138
    :cond_6
    iget v2, p0, Lvy1;->j:I

    .line 139
    .line 140
    iget-char v0, v0, Lzy1;->l:C

    .line 141
    .line 142
    iget-object v9, p0, Lvy1;->k:Ljava/lang/String;

    .line 143
    .line 144
    iget-object v10, p0, Lvy1;->l:Ljava/lang/Object;

    .line 145
    .line 146
    iget-object v11, p0, Lvy1;->m:Ljava/lang/Object;

    .line 147
    .line 148
    iget-object p0, p0, Lvy1;->n:Ljava/lang/Object;

    .line 149
    .line 150
    const-string v12, "01VDIWEA?"

    .line 151
    .line 152
    invoke-virtual {v12, v2}, Ljava/lang/String;->charAt(I)C

    .line 153
    .line 154
    .line 155
    move-result v2

    .line 156
    invoke-static {v4, v9, v10, v11, p0}, Lzy1;->s(ZLjava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object p0

    .line 160
    invoke-static {v2}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object v10

    .line 164
    invoke-virtual {v10}, Ljava/lang/String;->length()I

    .line 165
    .line 166
    .line 167
    move-result v10

    .line 168
    invoke-static {v0}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object v11

    .line 172
    add-int/2addr v10, v4

    .line 173
    invoke-virtual {v11}, Ljava/lang/String;->length()I

    .line 174
    .line 175
    .line 176
    move-result v11

    .line 177
    invoke-static {v5, v6}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object v12

    .line 181
    invoke-virtual {v12}, Ljava/lang/String;->length()I

    .line 182
    .line 183
    .line 184
    move-result v12

    .line 185
    add-int/2addr v10, v11

    .line 186
    add-int/2addr v10, v12

    .line 187
    add-int/2addr v10, v4

    .line 188
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 189
    .line 190
    .line 191
    move-result v4

    .line 192
    new-instance v11, Ljava/lang/StringBuilder;

    .line 193
    .line 194
    add-int/2addr v10, v4

    .line 195
    invoke-direct {v11, v10}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 196
    .line 197
    .line 198
    const-string v4, "2"

    .line 199
    .line 200
    invoke-virtual {v11, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 201
    .line 202
    .line 203
    invoke-virtual {v11, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 204
    .line 205
    .line 206
    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 207
    .line 208
    .line 209
    invoke-virtual {v11, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 210
    .line 211
    .line 212
    const-string v0, ":"

    .line 213
    .line 214
    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 215
    .line 216
    .line 217
    invoke-virtual {v11, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 218
    .line 219
    .line 220
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 221
    .line 222
    .line 223
    move-result-object p0

    .line 224
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 225
    .line 226
    .line 227
    move-result v0

    .line 228
    const/16 v2, 0x400

    .line 229
    .line 230
    if-le v0, v2, :cond_7

    .line 231
    .line 232
    invoke-virtual {v9, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 233
    .line 234
    .line 235
    move-result-object p0

    .line 236
    :cond_7
    iget-object v0, v1, Lvz1;->n:Ldk;

    .line 237
    .line 238
    if-eqz v0, :cond_b

    .line 239
    .line 240
    const-string v1, "health_monitor:value"

    .line 241
    .line 242
    iget-object v2, v0, Ldk;->l:Ljava/lang/Object;

    .line 243
    .line 244
    check-cast v2, Lvz1;

    .line 245
    .line 246
    invoke-virtual {v2}, Let;->l()V

    .line 247
    .line 248
    .line 249
    iget-object v3, v0, Ldk;->l:Ljava/lang/Object;

    .line 250
    .line 251
    check-cast v3, Lvz1;

    .line 252
    .line 253
    invoke-virtual {v3}, Lvz1;->p()Landroid/content/SharedPreferences;

    .line 254
    .line 255
    .line 256
    move-result-object v3

    .line 257
    const-string v4, "health_monitor:start"

    .line 258
    .line 259
    invoke-interface {v3, v4, v7, v8}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    .line 260
    .line 261
    .line 262
    move-result-wide v3

    .line 263
    cmp-long v3, v3, v7

    .line 264
    .line 265
    if-nez v3, :cond_8

    .line 266
    .line 267
    invoke-virtual {v0}, Ldk;->i()V

    .line 268
    .line 269
    .line 270
    :cond_8
    invoke-virtual {v2}, Lvz1;->p()Landroid/content/SharedPreferences;

    .line 271
    .line 272
    .line 273
    move-result-object v0

    .line 274
    const-string v3, "health_monitor:count"

    .line 275
    .line 276
    invoke-interface {v0, v3, v7, v8}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    .line 277
    .line 278
    .line 279
    move-result-wide v4

    .line 280
    cmp-long v0, v4, v7

    .line 281
    .line 282
    const-wide/16 v6, 0x1

    .line 283
    .line 284
    if-gtz v0, :cond_9

    .line 285
    .line 286
    invoke-virtual {v2}, Lvz1;->p()Landroid/content/SharedPreferences;

    .line 287
    .line 288
    .line 289
    move-result-object v0

    .line 290
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 291
    .line 292
    .line 293
    move-result-object v0

    .line 294
    invoke-interface {v0, v1, p0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 295
    .line 296
    .line 297
    invoke-interface {v0, v3, v6, v7}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 298
    .line 299
    .line 300
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 301
    .line 302
    .line 303
    return-void

    .line 304
    :cond_9
    iget-object v0, v2, Let;->j:Ljava/lang/Object;

    .line 305
    .line 306
    check-cast v0, Ly02;

    .line 307
    .line 308
    iget-object v0, v0, Ly02;->r:Lcb2;

    .line 309
    .line 310
    invoke-static {v0}, Ly02;->j(Let;)V

    .line 311
    .line 312
    .line 313
    invoke-virtual {v0}, Lcb2;->k0()Ljava/security/SecureRandom;

    .line 314
    .line 315
    .line 316
    move-result-object v0

    .line 317
    invoke-virtual {v0}, Ljava/util/Random;->nextLong()J

    .line 318
    .line 319
    .line 320
    move-result-wide v8

    .line 321
    const-wide v10, 0x7fffffffffffffffL

    .line 322
    .line 323
    .line 324
    .line 325
    .line 326
    and-long/2addr v8, v10

    .line 327
    add-long/2addr v4, v6

    .line 328
    div-long/2addr v10, v4

    .line 329
    invoke-virtual {v2}, Lvz1;->p()Landroid/content/SharedPreferences;

    .line 330
    .line 331
    .line 332
    move-result-object v0

    .line 333
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 334
    .line 335
    .line 336
    move-result-object v0

    .line 337
    cmp-long v2, v8, v10

    .line 338
    .line 339
    if-gez v2, :cond_a

    .line 340
    .line 341
    invoke-interface {v0, v1, p0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 342
    .line 343
    .line 344
    :cond_a
    invoke-interface {v0, v3, v4, v5}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 345
    .line 346
    .line 347
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 348
    .line 349
    .line 350
    :cond_b
    return-void

    .line 351
    :cond_c
    invoke-virtual {v0}, Lzy1;->r()Ljava/lang/String;

    .line 352
    .line 353
    .line 354
    move-result-object p0

    .line 355
    const-string v0, "Persisted config not initialized. Not logging error/warn"

    .line 356
    .line 357
    const/4 v1, 0x6

    .line 358
    invoke-static {v1, p0, v0}, Landroid/util/Log;->println(ILjava/lang/String;Ljava/lang/String;)I

    .line 359
    .line 360
    .line 361
    return-void
.end method
