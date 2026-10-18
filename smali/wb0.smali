.class public final synthetic Lwb0;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lr80;


# instance fields
.field public final synthetic j:I

.field public final synthetic k:Ljava/lang/Object;

.field public final synthetic l:Ljava/lang/Object;

.field public final synthetic m:Ljava/lang/Object;

.field public final synthetic n:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V
    .locals 0

    .line 1
    iput p5, p0, Lwb0;->j:I

    .line 2
    .line 3
    iput-object p1, p0, Lwb0;->k:Ljava/lang/Object;

    .line 4
    .line 5
    iput-object p2, p0, Lwb0;->l:Ljava/lang/Object;

    .line 6
    .line 7
    iput-object p3, p0, Lwb0;->m:Ljava/lang/Object;

    .line 8
    .line 9
    iput-object p4, p0, Lwb0;->n:Ljava/lang/Object;

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final g(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget v1, v0, Lwb0;->j:I

    .line 4
    .line 5
    packed-switch v1, :pswitch_data_0

    .line 6
    .line 7
    .line 8
    iget-object v1, v0, Lwb0;->k:Ljava/lang/Object;

    .line 9
    .line 10
    move-object v6, v1

    .line 11
    check-cast v6, Lcom/melodix/music/SettingsActivity$a;

    .line 12
    .line 13
    iget-object v1, v0, Lwb0;->l:Ljava/lang/Object;

    .line 14
    .line 15
    move-object v4, v1

    .line 16
    check-cast v4, Landroid/content/Context;

    .line 17
    .line 18
    iget-object v1, v0, Lwb0;->m:Ljava/lang/Object;

    .line 19
    .line 20
    move-object v5, v1

    .line 21
    check-cast v5, Le2;

    .line 22
    .line 23
    iget-object v0, v0, Lwb0;->n:Ljava/lang/Object;

    .line 24
    .line 25
    move-object v7, v0

    .line 26
    check-cast v7, Landroidx/preference/Preference;

    .line 27
    .line 28
    move-object/from16 v0, p1

    .line 29
    .line 30
    check-cast v0, Ljava/lang/Boolean;

    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 33
    .line 34
    .line 35
    move-result v3

    .line 36
    invoke-virtual {v6}, Lh70;->g()Le6;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    if-eqz v0, :cond_0

    .line 41
    .line 42
    new-instance v2, Li61;

    .line 43
    .line 44
    invoke-direct/range {v2 .. v7}, Li61;-><init>(ZLandroid/content/Context;Le2;Lcom/melodix/music/SettingsActivity$a;Landroidx/preference/Preference;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, v2}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 48
    .line 49
    .line 50
    :cond_0
    sget-object v0, Lwe1;->a:Lwe1;

    .line 51
    .line 52
    return-object v0

    .line 53
    :pswitch_0
    iget-object v1, v0, Lwb0;->k:Ljava/lang/Object;

    .line 54
    .line 55
    check-cast v1, Lyb0;

    .line 56
    .line 57
    iget-object v2, v0, Lwb0;->l:Ljava/lang/Object;

    .line 58
    .line 59
    check-cast v2, Ljava/lang/String;

    .line 60
    .line 61
    iget-object v3, v0, Lwb0;->m:Ljava/lang/Object;

    .line 62
    .line 63
    check-cast v3, Ljava/lang/String;

    .line 64
    .line 65
    iget-object v0, v0, Lwb0;->n:Ljava/lang/Object;

    .line 66
    .line 67
    check-cast v0, Lnu0;

    .line 68
    .line 69
    move-object/from16 v4, p1

    .line 70
    .line 71
    check-cast v4, Lxo0;

    .line 72
    .line 73
    const-wide/16 v5, 0x0

    .line 74
    .line 75
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 76
    .line 77
    .line 78
    move-result-object v5

    .line 79
    sget-object v6, Lyb0;->d:Lnu0;

    .line 80
    .line 81
    const-string v7, ""

    .line 82
    .line 83
    invoke-static {v4, v6, v7}, Les0;->g(Lxo0;Lnu0;Ljava/io/Serializable;)Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object v6

    .line 87
    check-cast v6, Ljava/lang/String;

    .line 88
    .line 89
    invoke-virtual {v6, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    move-result v6

    .line 93
    if-eqz v6, :cond_3

    .line 94
    .line 95
    invoke-virtual {v1, v4, v2}, Lyb0;->c(Lxo0;Ljava/lang/String;)Lnu0;

    .line 96
    .line 97
    .line 98
    move-result-object v5

    .line 99
    if-nez v5, :cond_1

    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_1
    iget-object v5, v5, Lnu0;->a:Ljava/lang/String;

    .line 103
    .line 104
    invoke-virtual {v5, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    move-result v3

    .line 108
    if-eqz v3, :cond_2

    .line 109
    .line 110
    :goto_0
    const/16 p0, 0x0

    .line 111
    .line 112
    goto/16 :goto_6

    .line 113
    .line 114
    :cond_2
    monitor-enter v1

    .line 115
    :try_start_0
    invoke-virtual {v1, v4, v2}, Lyb0;->d(Lxo0;Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    new-instance v3, Ljava/util/HashSet;

    .line 119
    .line 120
    new-instance v5, Ljava/util/HashSet;

    .line 121
    .line 122
    invoke-direct {v5}, Ljava/util/HashSet;-><init>()V

    .line 123
    .line 124
    .line 125
    invoke-static {v4, v0, v5}, Les0;->g(Lxo0;Lnu0;Ljava/io/Serializable;)Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    move-result-object v5

    .line 129
    check-cast v5, Ljava/util/Collection;

    .line 130
    .line 131
    invoke-direct {v3, v5}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 132
    .line 133
    .line 134
    invoke-virtual {v3, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 135
    .line 136
    .line 137
    invoke-virtual {v4, v0, v3}, Lxo0;->d(Lnu0;Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 138
    .line 139
    .line 140
    monitor-exit v1

    .line 141
    goto :goto_0

    .line 142
    :catchall_0
    move-exception v0

    .line 143
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 144
    throw v0

    .line 145
    :cond_3
    sget-object v3, Lyb0;->c:Lnu0;

    .line 146
    .line 147
    invoke-static {v4, v3, v5}, Les0;->g(Lxo0;Lnu0;Ljava/io/Serializable;)Ljava/lang/Object;

    .line 148
    .line 149
    .line 150
    move-result-object v6

    .line 151
    check-cast v6, Ljava/lang/Long;

    .line 152
    .line 153
    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    .line 154
    .line 155
    .line 156
    move-result-wide v8

    .line 157
    const-wide/16 v10, 0x1

    .line 158
    .line 159
    add-long v12, v8, v10

    .line 160
    .line 161
    const-wide/16 v14, 0x1e

    .line 162
    .line 163
    cmp-long v6, v12, v14

    .line 164
    .line 165
    if-nez v6, :cond_8

    .line 166
    .line 167
    monitor-enter v1

    .line 168
    :try_start_2
    invoke-static {v4, v3, v5}, Les0;->g(Lxo0;Lnu0;Ljava/io/Serializable;)Ljava/lang/Object;

    .line 169
    .line 170
    .line 171
    move-result-object v3

    .line 172
    check-cast v3, Ljava/lang/Long;

    .line 173
    .line 174
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    .line 175
    .line 176
    .line 177
    move-result-wide v5

    .line 178
    const-string v3, ""

    .line 179
    .line 180
    new-instance v8, Ljava/util/HashSet;

    .line 181
    .line 182
    invoke-direct {v8}, Ljava/util/HashSet;-><init>()V

    .line 183
    .line 184
    .line 185
    invoke-virtual {v4}, Lxo0;->a()Ljava/util/Map;

    .line 186
    .line 187
    .line 188
    move-result-object v9

    .line 189
    invoke-interface {v9}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 190
    .line 191
    .line 192
    move-result-object v9

    .line 193
    invoke-interface {v9}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 194
    .line 195
    .line 196
    move-result-object v9

    .line 197
    const/4 v12, 0x0

    .line 198
    :goto_1
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    .line 199
    .line 200
    .line 201
    move-result v13

    .line 202
    if-eqz v13, :cond_7

    .line 203
    .line 204
    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 205
    .line 206
    .line 207
    move-result-object v13

    .line 208
    check-cast v13, Ljava/util/Map$Entry;

    .line 209
    .line 210
    invoke-interface {v13}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 211
    .line 212
    .line 213
    move-result-object v14

    .line 214
    instance-of v14, v14, Ljava/util/Set;

    .line 215
    .line 216
    if-eqz v14, :cond_6

    .line 217
    .line 218
    invoke-interface {v13}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 219
    .line 220
    .line 221
    move-result-object v14

    .line 222
    check-cast v14, Ljava/util/Set;

    .line 223
    .line 224
    invoke-interface {v14}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 225
    .line 226
    .line 227
    move-result-object v15

    .line 228
    :cond_4
    :goto_2
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    .line 229
    .line 230
    .line 231
    move-result v16

    .line 232
    if-eqz v16, :cond_6

    .line 233
    .line 234
    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 235
    .line 236
    .line 237
    move-result-object v16

    .line 238
    const/16 p0, 0x0

    .line 239
    .line 240
    move-object/from16 v7, v16

    .line 241
    .line 242
    check-cast v7, Ljava/lang/String;

    .line 243
    .line 244
    if-eqz v12, :cond_5

    .line 245
    .line 246
    invoke-virtual {v12, v7}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    .line 247
    .line 248
    .line 249
    move-result v16

    .line 250
    if-lez v16, :cond_4

    .line 251
    .line 252
    goto :goto_3

    .line 253
    :catchall_1
    move-exception v0

    .line 254
    goto :goto_4

    .line 255
    :cond_5
    :goto_3
    invoke-interface {v13}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 256
    .line 257
    .line 258
    move-result-object v3

    .line 259
    check-cast v3, Lnu0;

    .line 260
    .line 261
    iget-object v3, v3, Lnu0;->a:Ljava/lang/String;

    .line 262
    .line 263
    move-object v12, v7

    .line 264
    move-object v8, v14

    .line 265
    goto :goto_2

    .line 266
    :cond_6
    const/16 p0, 0x0

    .line 267
    .line 268
    goto :goto_1

    .line 269
    :cond_7
    const/16 p0, 0x0

    .line 270
    .line 271
    new-instance v7, Ljava/util/HashSet;

    .line 272
    .line 273
    invoke-direct {v7, v8}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 274
    .line 275
    .line 276
    invoke-virtual {v7, v12}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    .line 277
    .line 278
    .line 279
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 280
    .line 281
    .line 282
    new-instance v8, Lnu0;

    .line 283
    .line 284
    invoke-direct {v8, v3}, Lnu0;-><init>(Ljava/lang/String;)V

    .line 285
    .line 286
    .line 287
    invoke-virtual {v4, v8, v7}, Lxo0;->d(Lnu0;Ljava/lang/Object;)V

    .line 288
    .line 289
    .line 290
    sget-object v3, Lyb0;->c:Lnu0;

    .line 291
    .line 292
    sub-long v8, v5, v10

    .line 293
    .line 294
    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 295
    .line 296
    .line 297
    move-result-object v5

    .line 298
    invoke-virtual {v4, v3, v5}, Lxo0;->c(Lnu0;Ljava/lang/Object;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 299
    .line 300
    .line 301
    monitor-exit v1

    .line 302
    goto :goto_5

    .line 303
    :goto_4
    :try_start_3
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 304
    throw v0

    .line 305
    :cond_8
    const/16 p0, 0x0

    .line 306
    .line 307
    :goto_5
    new-instance v1, Ljava/util/HashSet;

    .line 308
    .line 309
    new-instance v5, Ljava/util/HashSet;

    .line 310
    .line 311
    invoke-direct {v5}, Ljava/util/HashSet;-><init>()V

    .line 312
    .line 313
    .line 314
    invoke-static {v4, v0, v5}, Les0;->g(Lxo0;Lnu0;Ljava/io/Serializable;)Ljava/lang/Object;

    .line 315
    .line 316
    .line 317
    move-result-object v5

    .line 318
    check-cast v5, Ljava/util/Collection;

    .line 319
    .line 320
    invoke-direct {v1, v5}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 321
    .line 322
    .line 323
    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 324
    .line 325
    .line 326
    add-long/2addr v8, v10

    .line 327
    invoke-virtual {v4, v0, v1}, Lxo0;->d(Lnu0;Ljava/lang/Object;)V

    .line 328
    .line 329
    .line 330
    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 331
    .line 332
    .line 333
    move-result-object v0

    .line 334
    invoke-virtual {v4, v3, v0}, Lxo0;->d(Lnu0;Ljava/lang/Object;)V

    .line 335
    .line 336
    .line 337
    sget-object v0, Lyb0;->d:Lnu0;

    .line 338
    .line 339
    invoke-virtual {v4, v0, v2}, Lxo0;->c(Lnu0;Ljava/lang/Object;)V

    .line 340
    .line 341
    .line 342
    :goto_6
    return-object p0

    .line 343
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
