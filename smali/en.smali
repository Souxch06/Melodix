.class public final synthetic Len;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:I

.field public final synthetic k:Ljava/lang/Object;

.field public final synthetic l:Ljava/lang/Object;

.field public final synthetic m:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V
    .locals 0

    .line 1
    iput p4, p0, Len;->j:I

    .line 2
    .line 3
    iput-object p1, p0, Len;->k:Ljava/lang/Object;

    .line 4
    .line 5
    iput-object p2, p0, Len;->l:Ljava/lang/Object;

    .line 6
    .line 7
    iput-object p3, p0, Len;->m:Ljava/lang/Object;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 7

    .line 1
    iget v0, p0, Len;->j:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Len;->k:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast v0, Lvd1;

    .line 9
    .line 10
    iget-object v1, p0, Len;->l:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast v1, Lop0;

    .line 13
    .line 14
    iget-object p0, p0, Len;->m:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast p0, Lx9;

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 19
    .line 20
    .line 21
    invoke-static {}, Lxs0;->t()Lws0;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-virtual {v2}, Lea0;->i()V

    .line 26
    .line 27
    .line 28
    iget-object v3, v2, Lea0;->k:Lia0;

    .line 29
    .line 30
    check-cast v3, Lxs0;

    .line 31
    .line 32
    invoke-virtual {v3, v1}, Lxs0;->w(Lop0;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v2, p0}, Lvd1;->d(Lws0;Lx9;)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :pswitch_0
    iget-object v0, p0, Len;->k:Ljava/lang/Object;

    .line 40
    .line 41
    check-cast v0, Lvd1;

    .line 42
    .line 43
    iget-object v1, p0, Len;->l:Ljava/lang/Object;

    .line 44
    .line 45
    check-cast v1, Lld1;

    .line 46
    .line 47
    iget-object p0, p0, Len;->m:Ljava/lang/Object;

    .line 48
    .line 49
    check-cast p0, Lx9;

    .line 50
    .line 51
    invoke-static {}, Lxs0;->t()Lws0;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    invoke-virtual {v2}, Lea0;->i()V

    .line 56
    .line 57
    .line 58
    iget-object v3, v2, Lea0;->k:Lia0;

    .line 59
    .line 60
    check-cast v3, Lxs0;

    .line 61
    .line 62
    invoke-virtual {v3, v1}, Lxs0;->x(Lld1;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v0, v2, p0}, Lvd1;->d(Lws0;Lx9;)V

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :pswitch_1
    iget-object v0, p0, Len;->k:Ljava/lang/Object;

    .line 70
    .line 71
    check-cast v0, Lvd1;

    .line 72
    .line 73
    iget-object v1, p0, Len;->l:Ljava/lang/Object;

    .line 74
    .line 75
    check-cast v1, Laa0;

    .line 76
    .line 77
    iget-object p0, p0, Len;->m:Ljava/lang/Object;

    .line 78
    .line 79
    check-cast p0, Lx9;

    .line 80
    .line 81
    invoke-static {}, Lxs0;->t()Lws0;

    .line 82
    .line 83
    .line 84
    move-result-object v2

    .line 85
    invoke-virtual {v2}, Lea0;->i()V

    .line 86
    .line 87
    .line 88
    iget-object v3, v2, Lea0;->k:Lia0;

    .line 89
    .line 90
    check-cast v3, Lxs0;

    .line 91
    .line 92
    invoke-virtual {v3, v1}, Lxs0;->v(Laa0;)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {v0, v2, p0}, Lvd1;->d(Lws0;Lx9;)V

    .line 96
    .line 97
    .line 98
    return-void

    .line 99
    :pswitch_2
    iget-object v0, p0, Len;->k:Ljava/lang/Object;

    .line 100
    .line 101
    check-cast v0, Lcom/google/firebase/perf/session/SessionManager;

    .line 102
    .line 103
    iget-object v1, p0, Len;->l:Ljava/lang/Object;

    .line 104
    .line 105
    check-cast v1, Landroid/content/Context;

    .line 106
    .line 107
    iget-object p0, p0, Len;->m:Ljava/lang/Object;

    .line 108
    .line 109
    check-cast p0, Lct0;

    .line 110
    .line 111
    invoke-static {v0, v1, p0}, Lcom/google/firebase/perf/session/SessionManager;->b(Lcom/google/firebase/perf/session/SessionManager;Landroid/content/Context;Lct0;)V

    .line 112
    .line 113
    .line 114
    return-void

    .line 115
    :pswitch_3
    iget-object v0, p0, Len;->k:Ljava/lang/Object;

    .line 116
    .line 117
    check-cast v0, Lb00;

    .line 118
    .line 119
    iget-object v1, p0, Len;->l:Ljava/lang/Object;

    .line 120
    .line 121
    check-cast v1, Lxg;

    .line 122
    .line 123
    iget-object p0, p0, Len;->m:Ljava/lang/Object;

    .line 124
    .line 125
    check-cast p0, Ljava/util/concurrent/ThreadPoolExecutor;

    .line 126
    .line 127
    :try_start_0
    iget-object v0, v0, Lb00;->a:Landroid/content/Context;

    .line 128
    .line 129
    invoke-static {v0}, Lju1;->k(Landroid/content/Context;)Lm60;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    if-eqz v0, :cond_0

    .line 134
    .line 135
    iget-object v2, v0, Lvz;->b:Ljava/lang/Object;

    .line 136
    .line 137
    check-cast v2, Lyz;

    .line 138
    .line 139
    check-cast v2, Ll60;

    .line 140
    .line 141
    iget-object v3, v2, Ll60;->c:Ljava/lang/Object;

    .line 142
    .line 143
    monitor-enter v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 144
    :try_start_1
    iput-object p0, v2, Ll60;->e:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 145
    .line 146
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 147
    :try_start_2
    iget-object v0, v0, Lvz;->b:Ljava/lang/Object;

    .line 148
    .line 149
    check-cast v0, Lyz;

    .line 150
    .line 151
    new-instance v2, La00;

    .line 152
    .line 153
    invoke-direct {v2, v1, p0}, La00;-><init>(Lxg;Ljava/util/concurrent/ThreadPoolExecutor;)V

    .line 154
    .line 155
    .line 156
    invoke-interface {v0, v2}, Lyz;->a(Lxg;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 157
    .line 158
    .line 159
    goto :goto_1

    .line 160
    :catchall_0
    move-exception v0

    .line 161
    goto :goto_0

    .line 162
    :catchall_1
    move-exception v0

    .line 163
    :try_start_3
    monitor-exit v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 164
    :try_start_4
    throw v0

    .line 165
    :cond_0
    new-instance v0, Ljava/lang/RuntimeException;

    .line 166
    .line 167
    const-string v2, "EmojiCompat font provider not available on this device."

    .line 168
    .line 169
    invoke-direct {v0, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 170
    .line 171
    .line 172
    throw v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 173
    :goto_0
    invoke-virtual {v1, v0}, Lxg;->n(Ljava/lang/Throwable;)V

    .line 174
    .line 175
    .line 176
    invoke-virtual {p0}, Ljava/util/concurrent/ThreadPoolExecutor;->shutdown()V

    .line 177
    .line 178
    .line 179
    :goto_1
    return-void

    .line 180
    :pswitch_4
    iget-object v0, p0, Len;->k:Ljava/lang/Object;

    .line 181
    .line 182
    check-cast v0, Lwz0;

    .line 183
    .line 184
    iget-object v1, p0, Len;->l:Ljava/lang/Object;

    .line 185
    .line 186
    check-cast v1, Ljava/lang/String;

    .line 187
    .line 188
    iget-object p0, p0, Len;->m:Ljava/lang/Object;

    .line 189
    .line 190
    check-cast p0, Lzm;

    .line 191
    .line 192
    iget-object v0, v0, Lwz0;->a:Lxn0;

    .line 193
    .line 194
    iget-object v2, v0, Lxn0;->k:Ljava/lang/Object;

    .line 195
    .line 196
    check-cast v2, Llw0;

    .line 197
    .line 198
    invoke-interface {v2}, Llw0;->get()Ljava/lang/Object;

    .line 199
    .line 200
    .line 201
    move-result-object v2

    .line 202
    check-cast v2, Lj4;

    .line 203
    .line 204
    if-nez v2, :cond_1

    .line 205
    .line 206
    goto/16 :goto_2

    .line 207
    .line 208
    :cond_1
    iget-object v3, p0, Lzm;->e:Lorg/json/JSONObject;

    .line 209
    .line 210
    invoke-virtual {v3}, Lorg/json/JSONObject;->length()I

    .line 211
    .line 212
    .line 213
    move-result v4

    .line 214
    const/4 v5, 0x1

    .line 215
    if-ge v4, v5, :cond_2

    .line 216
    .line 217
    goto/16 :goto_2

    .line 218
    .line 219
    :cond_2
    iget-object p0, p0, Lzm;->b:Lorg/json/JSONObject;

    .line 220
    .line 221
    invoke-virtual {p0}, Lorg/json/JSONObject;->length()I

    .line 222
    .line 223
    .line 224
    move-result v4

    .line 225
    if-ge v4, v5, :cond_3

    .line 226
    .line 227
    goto/16 :goto_2

    .line 228
    .line 229
    :cond_3
    invoke-virtual {v3, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 230
    .line 231
    .line 232
    move-result-object v3

    .line 233
    if-nez v3, :cond_4

    .line 234
    .line 235
    goto/16 :goto_2

    .line 236
    .line 237
    :cond_4
    const-string v4, "choiceId"

    .line 238
    .line 239
    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 240
    .line 241
    .line 242
    move-result-object v4

    .line 243
    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    .line 244
    .line 245
    .line 246
    move-result v5

    .line 247
    if-eqz v5, :cond_5

    .line 248
    .line 249
    goto :goto_2

    .line 250
    :cond_5
    iget-object v5, v0, Lxn0;->l:Ljava/lang/Object;

    .line 251
    .line 252
    check-cast v5, Ljava/util/Map;

    .line 253
    .line 254
    monitor-enter v5

    .line 255
    :try_start_5
    iget-object v6, v0, Lxn0;->l:Ljava/lang/Object;

    .line 256
    .line 257
    check-cast v6, Ljava/util/Map;

    .line 258
    .line 259
    invoke-interface {v6, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 260
    .line 261
    .line 262
    move-result-object v6

    .line 263
    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 264
    .line 265
    .line 266
    move-result v6

    .line 267
    if-eqz v6, :cond_6

    .line 268
    .line 269
    monitor-exit v5

    .line 270
    goto :goto_2

    .line 271
    :catchall_2
    move-exception p0

    .line 272
    goto :goto_3

    .line 273
    :cond_6
    iget-object v0, v0, Lxn0;->l:Ljava/lang/Object;

    .line 274
    .line 275
    check-cast v0, Ljava/util/Map;

    .line 276
    .line 277
    invoke-interface {v0, v1, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 278
    .line 279
    .line 280
    monitor-exit v5
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 281
    new-instance v0, Landroid/os/Bundle;

    .line 282
    .line 283
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 284
    .line 285
    .line 286
    const-string v5, "arm_key"

    .line 287
    .line 288
    invoke-virtual {v0, v5, v1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 289
    .line 290
    .line 291
    const-string v5, "arm_value"

    .line 292
    .line 293
    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 294
    .line 295
    .line 296
    move-result-object p0

    .line 297
    invoke-virtual {v0, v5, p0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 298
    .line 299
    .line 300
    const-string p0, "personalization_id"

    .line 301
    .line 302
    const-string v1, "personalizationId"

    .line 303
    .line 304
    invoke-virtual {v3, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 305
    .line 306
    .line 307
    move-result-object v1

    .line 308
    invoke-virtual {v0, p0, v1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 309
    .line 310
    .line 311
    const-string p0, "arm_index"

    .line 312
    .line 313
    const-string v1, "armIndex"

    .line 314
    .line 315
    const/4 v5, -0x1

    .line 316
    invoke-virtual {v3, v1, v5}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 317
    .line 318
    .line 319
    move-result v1

    .line 320
    invoke-virtual {v0, p0, v1}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 321
    .line 322
    .line 323
    const-string p0, "group"

    .line 324
    .line 325
    const-string v1, "group"

    .line 326
    .line 327
    invoke-virtual {v3, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 328
    .line 329
    .line 330
    move-result-object v1

    .line 331
    invoke-virtual {v0, p0, v1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 332
    .line 333
    .line 334
    const-string p0, "fp"

    .line 335
    .line 336
    const-string v1, "personalization_assignment"

    .line 337
    .line 338
    check-cast v2, Lk4;

    .line 339
    .line 340
    invoke-virtual {v2, p0, v1, v0}, Lk4;->a(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)V

    .line 341
    .line 342
    .line 343
    new-instance p0, Landroid/os/Bundle;

    .line 344
    .line 345
    invoke-direct {p0}, Landroid/os/Bundle;-><init>()V

    .line 346
    .line 347
    .line 348
    const-string v0, "_fpid"

    .line 349
    .line 350
    invoke-virtual {p0, v0, v4}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 351
    .line 352
    .line 353
    const-string v0, "fp"

    .line 354
    .line 355
    const-string v1, "_fpc"

    .line 356
    .line 357
    invoke-virtual {v2, v0, v1, p0}, Lk4;->a(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)V

    .line 358
    .line 359
    .line 360
    :goto_2
    return-void

    .line 361
    :goto_3
    :try_start_6
    monitor-exit v5
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 362
    throw p0

    .line 363
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
