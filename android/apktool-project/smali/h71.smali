.class public final Lh71;
.super Lcb1;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lg90;


# instance fields
.field public synthetic n:Lk71;

.field public synthetic o:Lxo0;


# virtual methods
.method public final e(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    check-cast p1, Lk71;

    .line 2
    .line 3
    check-cast p2, Lxo0;

    .line 4
    .line 5
    check-cast p3, Liq;

    .line 6
    .line 7
    new-instance p0, Lh71;

    .line 8
    .line 9
    const/4 v0, 0x3

    .line 10
    invoke-direct {p0, v0, p3}, Lcb1;-><init>(ILiq;)V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Lh71;->n:Lk71;

    .line 14
    .line 15
    iput-object p2, p0, Lh71;->o:Lxo0;

    .line 16
    .line 17
    sget-object p1, Lwe1;->a:Lwe1;

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Lh71;->m(Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public final m(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 7

    .line 1
    invoke-static {p1}, Lk42;->n(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lh71;->n:Lk71;

    .line 5
    .line 6
    iget-object p0, p0, Lh71;->o:Lxo0;

    .line 7
    .line 8
    invoke-virtual {p0}, Lxo0;->a()Ljava/util/Map;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-instance v1, Ljava/util/ArrayList;

    .line 17
    .line 18
    const/16 v2, 0xa

    .line 19
    .line 20
    invoke-static {v0, v2}, Ldl;->w(Ljava/lang/Iterable;I)I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 25
    .line 26
    .line 27
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    if-eqz v2, :cond_0

    .line 36
    .line 37
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    check-cast v2, Lnu0;

    .line 42
    .line 43
    iget-object v2, v2, Lnu0;->a:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_0
    iget-object v0, p1, Lk71;->a:Landroid/content/SharedPreferences;

    .line 50
    .line 51
    invoke-interface {v0}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 56
    .line 57
    .line 58
    new-instance v2, Ljava/util/LinkedHashMap;

    .line 59
    .line 60
    invoke-direct {v2}, Ljava/util/LinkedHashMap;-><init>()V

    .line 61
    .line 62
    .line 63
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    :cond_1
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 72
    .line 73
    .line 74
    move-result v3

    .line 75
    const/4 v4, 0x1

    .line 76
    if-eqz v3, :cond_3

    .line 77
    .line 78
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v3

    .line 82
    check-cast v3, Ljava/util/Map$Entry;

    .line 83
    .line 84
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v5

    .line 88
    check-cast v5, Ljava/lang/String;

    .line 89
    .line 90
    iget-object v6, p1, Lk71;->b:Ljava/util/Set;

    .line 91
    .line 92
    if-eqz v6, :cond_2

    .line 93
    .line 94
    invoke-interface {v6, v5}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    move-result v4

    .line 98
    :cond_2
    if-eqz v4, :cond_1

    .line 99
    .line 100
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object v4

    .line 104
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object v3

    .line 108
    invoke-interface {v2, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    goto :goto_1

    .line 112
    :cond_3
    new-instance p1, Ljava/util/LinkedHashMap;

    .line 113
    .line 114
    invoke-interface {v2}, Ljava/util/Map;->size()I

    .line 115
    .line 116
    .line 117
    move-result v0

    .line 118
    invoke-static {v0}, Lsl0;->I(I)I

    .line 119
    .line 120
    .line 121
    move-result v0

    .line 122
    invoke-direct {p1, v0}, Ljava/util/LinkedHashMap;-><init>(I)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {v2}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 134
    .line 135
    .line 136
    move-result v2

    .line 137
    if-eqz v2, :cond_5

    .line 138
    .line 139
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 140
    .line 141
    .line 142
    move-result-object v2

    .line 143
    check-cast v2, Ljava/util/Map$Entry;

    .line 144
    .line 145
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 146
    .line 147
    .line 148
    move-result-object v3

    .line 149
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 150
    .line 151
    .line 152
    move-result-object v2

    .line 153
    instance-of v5, v2, Ljava/util/Set;

    .line 154
    .line 155
    if-eqz v5, :cond_4

    .line 156
    .line 157
    check-cast v2, Ljava/lang/Iterable;

    .line 158
    .line 159
    invoke-static {v2}, Lbl;->G(Ljava/lang/Iterable;)Ljava/util/Set;

    .line 160
    .line 161
    .line 162
    move-result-object v2

    .line 163
    :cond_4
    invoke-interface {p1, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 164
    .line 165
    .line 166
    goto :goto_2

    .line 167
    :cond_5
    new-instance v0, Ljava/util/LinkedHashMap;

    .line 168
    .line 169
    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 170
    .line 171
    .line 172
    invoke-virtual {p1}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    .line 173
    .line 174
    .line 175
    move-result-object p1

    .line 176
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 177
    .line 178
    .line 179
    move-result-object p1

    .line 180
    :cond_6
    :goto_3
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 181
    .line 182
    .line 183
    move-result v2

    .line 184
    if-eqz v2, :cond_7

    .line 185
    .line 186
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 187
    .line 188
    .line 189
    move-result-object v2

    .line 190
    check-cast v2, Ljava/util/Map$Entry;

    .line 191
    .line 192
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 193
    .line 194
    .line 195
    move-result-object v3

    .line 196
    check-cast v3, Ljava/lang/String;

    .line 197
    .line 198
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 199
    .line 200
    .line 201
    move-result v3

    .line 202
    if-nez v3, :cond_6

    .line 203
    .line 204
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 205
    .line 206
    .line 207
    move-result-object v3

    .line 208
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 209
    .line 210
    .line 211
    move-result-object v2

    .line 212
    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 213
    .line 214
    .line 215
    goto :goto_3

    .line 216
    :cond_7
    new-instance p1, Lxo0;

    .line 217
    .line 218
    invoke-virtual {p0}, Lxo0;->a()Ljava/util/Map;

    .line 219
    .line 220
    .line 221
    move-result-object p0

    .line 222
    new-instance v1, Ljava/util/LinkedHashMap;

    .line 223
    .line 224
    invoke-direct {v1, p0}, Ljava/util/LinkedHashMap;-><init>(Ljava/util/Map;)V

    .line 225
    .line 226
    .line 227
    const/4 p0, 0x0

    .line 228
    invoke-direct {p1, v1, p0}, Lxo0;-><init>(Ljava/util/LinkedHashMap;Z)V

    .line 229
    .line 230
    .line 231
    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    .line 232
    .line 233
    .line 234
    move-result-object p0

    .line 235
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 236
    .line 237
    .line 238
    move-result-object p0

    .line 239
    :cond_8
    :goto_4
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 240
    .line 241
    .line 242
    move-result v0

    .line 243
    if-eqz v0, :cond_e

    .line 244
    .line 245
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 246
    .line 247
    .line 248
    move-result-object v0

    .line 249
    check-cast v0, Ljava/util/Map$Entry;

    .line 250
    .line 251
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 252
    .line 253
    .line 254
    move-result-object v1

    .line 255
    check-cast v1, Ljava/lang/String;

    .line 256
    .line 257
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 258
    .line 259
    .line 260
    move-result-object v0

    .line 261
    instance-of v2, v0, Ljava/lang/Boolean;

    .line 262
    .line 263
    if-eqz v2, :cond_9

    .line 264
    .line 265
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 266
    .line 267
    .line 268
    new-instance v2, Lnu0;

    .line 269
    .line 270
    invoke-direct {v2, v1}, Lnu0;-><init>(Ljava/lang/String;)V

    .line 271
    .line 272
    .line 273
    invoke-virtual {p1, v2, v0}, Lxo0;->d(Lnu0;Ljava/lang/Object;)V

    .line 274
    .line 275
    .line 276
    goto :goto_4

    .line 277
    :cond_9
    instance-of v2, v0, Ljava/lang/Float;

    .line 278
    .line 279
    if-eqz v2, :cond_a

    .line 280
    .line 281
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 282
    .line 283
    .line 284
    new-instance v2, Lnu0;

    .line 285
    .line 286
    invoke-direct {v2, v1}, Lnu0;-><init>(Ljava/lang/String;)V

    .line 287
    .line 288
    .line 289
    invoke-virtual {p1, v2, v0}, Lxo0;->d(Lnu0;Ljava/lang/Object;)V

    .line 290
    .line 291
    .line 292
    goto :goto_4

    .line 293
    :cond_a
    instance-of v2, v0, Ljava/lang/Integer;

    .line 294
    .line 295
    if-eqz v2, :cond_b

    .line 296
    .line 297
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 298
    .line 299
    .line 300
    new-instance v2, Lnu0;

    .line 301
    .line 302
    invoke-direct {v2, v1}, Lnu0;-><init>(Ljava/lang/String;)V

    .line 303
    .line 304
    .line 305
    invoke-virtual {p1, v2, v0}, Lxo0;->d(Lnu0;Ljava/lang/Object;)V

    .line 306
    .line 307
    .line 308
    goto :goto_4

    .line 309
    :cond_b
    instance-of v2, v0, Ljava/lang/Long;

    .line 310
    .line 311
    if-eqz v2, :cond_c

    .line 312
    .line 313
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 314
    .line 315
    .line 316
    new-instance v2, Lnu0;

    .line 317
    .line 318
    invoke-direct {v2, v1}, Lnu0;-><init>(Ljava/lang/String;)V

    .line 319
    .line 320
    .line 321
    invoke-virtual {p1, v2, v0}, Lxo0;->d(Lnu0;Ljava/lang/Object;)V

    .line 322
    .line 323
    .line 324
    goto :goto_4

    .line 325
    :cond_c
    instance-of v2, v0, Ljava/lang/String;

    .line 326
    .line 327
    if-eqz v2, :cond_d

    .line 328
    .line 329
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 330
    .line 331
    .line 332
    new-instance v2, Lnu0;

    .line 333
    .line 334
    invoke-direct {v2, v1}, Lnu0;-><init>(Ljava/lang/String;)V

    .line 335
    .line 336
    .line 337
    invoke-virtual {p1, v2, v0}, Lxo0;->d(Lnu0;Ljava/lang/Object;)V

    .line 338
    .line 339
    .line 340
    goto :goto_4

    .line 341
    :cond_d
    instance-of v2, v0, Ljava/util/Set;

    .line 342
    .line 343
    if-eqz v2, :cond_8

    .line 344
    .line 345
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 346
    .line 347
    .line 348
    new-instance v2, Lnu0;

    .line 349
    .line 350
    invoke-direct {v2, v1}, Lnu0;-><init>(Ljava/lang/String;)V

    .line 351
    .line 352
    .line 353
    check-cast v0, Ljava/util/Set;

    .line 354
    .line 355
    invoke-virtual {p1, v2, v0}, Lxo0;->d(Lnu0;Ljava/lang/Object;)V

    .line 356
    .line 357
    .line 358
    goto :goto_4

    .line 359
    :cond_e
    new-instance p0, Lxo0;

    .line 360
    .line 361
    invoke-virtual {p1}, Lxo0;->a()Ljava/util/Map;

    .line 362
    .line 363
    .line 364
    move-result-object p1

    .line 365
    new-instance v0, Ljava/util/LinkedHashMap;

    .line 366
    .line 367
    invoke-direct {v0, p1}, Ljava/util/LinkedHashMap;-><init>(Ljava/util/Map;)V

    .line 368
    .line 369
    .line 370
    invoke-direct {p0, v0, v4}, Lxo0;-><init>(Ljava/util/LinkedHashMap;Z)V

    .line 371
    .line 372
    .line 373
    return-object p0
.end method
