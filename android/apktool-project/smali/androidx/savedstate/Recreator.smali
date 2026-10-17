.class public final Landroidx/savedstate/Recreator;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lzh0;


# instance fields
.field public final j:Lz21;


# direct methods
.method public constructor <init>(Lz21;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Landroidx/savedstate/Recreator;->j:Lz21;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final c(Lci0;Lvh0;)V
    .locals 12

    .line 1
    sget-object v0, Lvh0;->ON_CREATE:Lvh0;

    .line 2
    .line 3
    if-ne p2, v0, :cond_a

    .line 4
    .line 5
    invoke-interface {p1}, Lci0;->e()Landroidx/lifecycle/a;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p1, p0}, Landroidx/lifecycle/a;->f(Lbi0;)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Landroidx/savedstate/Recreator;->j:Lz21;

    .line 13
    .line 14
    invoke-interface {p1}, Lz21;->a()Lk6;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    const-string p2, "androidx.savedstate.Restarter"

    .line 19
    .line 20
    invoke-virtual {p1, p2}, Lk6;->c(Ljava/lang/String;)Landroid/os/Bundle;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    if-nez p1, :cond_0

    .line 25
    .line 26
    goto/16 :goto_1

    .line 27
    .line 28
    :cond_0
    const-string p2, "classes_to_restore"

    .line 29
    .line 30
    invoke-virtual {p1, p2}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    if-eqz p1, :cond_9

    .line 35
    .line 36
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 37
    .line 38
    .line 39
    move-result p2

    .line 40
    const/4 v0, 0x0

    .line 41
    move v1, v0

    .line 42
    :cond_1
    :goto_0
    if-ge v1, p2, :cond_8

    .line 43
    .line 44
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    add-int/lit8 v1, v1, 0x1

    .line 49
    .line 50
    check-cast v2, Ljava/lang/String;

    .line 51
    .line 52
    :try_start_0
    const-class v3, Landroidx/savedstate/Recreator;

    .line 53
    .line 54
    invoke-virtual {v3}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    invoke-static {v2, v0, v3}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    const-class v4, Lx21;

    .line 63
    .line 64
    invoke-virtual {v3, v4}, Ljava/lang/Class;->asSubclass(Ljava/lang/Class;)Ljava/lang/Class;

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_3

    .line 69
    .line 70
    .line 71
    const/4 v4, 0x0

    .line 72
    :try_start_1
    invoke-virtual {v3, v4}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    .line 73
    .line 74
    .line 75
    move-result-object v3
    :try_end_1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1 .. :try_end_1} :catch_2

    .line 76
    const/4 v5, 0x1

    .line 77
    invoke-virtual {v3, v5}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    .line 78
    .line 79
    .line 80
    :try_start_2
    invoke-virtual {v3, v4}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object v3

    .line 84
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 85
    .line 86
    .line 87
    check-cast v3, Lx21;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 88
    .line 89
    iget-object v2, p0, Landroidx/savedstate/Recreator;->j:Lz21;

    .line 90
    .line 91
    instance-of v3, v2, Lii1;

    .line 92
    .line 93
    if-eqz v3, :cond_7

    .line 94
    .line 95
    move-object v3, v2

    .line 96
    check-cast v3, Lii1;

    .line 97
    .line 98
    invoke-interface {v3}, Lii1;->d()Lhi1;

    .line 99
    .line 100
    .line 101
    move-result-object v3

    .line 102
    invoke-interface {v2}, Lz21;->a()Lk6;

    .line 103
    .line 104
    .line 105
    move-result-object v6

    .line 106
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 107
    .line 108
    .line 109
    new-instance v7, Ljava/util/HashSet;

    .line 110
    .line 111
    iget-object v8, v3, Lhi1;->a:Ljava/util/LinkedHashMap;

    .line 112
    .line 113
    invoke-virtual {v8}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    .line 114
    .line 115
    .line 116
    move-result-object v8

    .line 117
    invoke-direct {v7, v8}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {v7}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    .line 121
    .line 122
    .line 123
    move-result-object v7

    .line 124
    :cond_2
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    .line 125
    .line 126
    .line 127
    move-result v8

    .line 128
    if-eqz v8, :cond_4

    .line 129
    .line 130
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 131
    .line 132
    .line 133
    move-result-object v8

    .line 134
    check-cast v8, Ljava/lang/String;

    .line 135
    .line 136
    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 137
    .line 138
    .line 139
    iget-object v9, v3, Lhi1;->a:Ljava/util/LinkedHashMap;

    .line 140
    .line 141
    invoke-virtual {v9, v8}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 142
    .line 143
    .line 144
    move-result-object v8

    .line 145
    check-cast v8, Lfi1;

    .line 146
    .line 147
    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 148
    .line 149
    .line 150
    invoke-interface {v2}, Lci0;->e()Landroidx/lifecycle/a;

    .line 151
    .line 152
    .line 153
    move-result-object v9

    .line 154
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 155
    .line 156
    .line 157
    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 158
    .line 159
    .line 160
    const-string v10, "androidx.lifecycle.savedstate.vm.tag"

    .line 161
    .line 162
    iget-object v11, v8, Lfi1;->a:Ljava/util/HashMap;

    .line 163
    .line 164
    monitor-enter v11

    .line 165
    :try_start_3
    iget-object v8, v8, Lfi1;->a:Ljava/util/HashMap;

    .line 166
    .line 167
    invoke-virtual {v8, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 168
    .line 169
    .line 170
    move-result-object v8

    .line 171
    monitor-exit v11
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 172
    check-cast v8, Landroidx/lifecycle/SavedStateHandleController;

    .line 173
    .line 174
    if-eqz v8, :cond_2

    .line 175
    .line 176
    iget-boolean v10, v8, Landroidx/lifecycle/SavedStateHandleController;->j:Z

    .line 177
    .line 178
    if-nez v10, :cond_2

    .line 179
    .line 180
    if-eqz v10, :cond_3

    .line 181
    .line 182
    const-string p0, "Already attached to lifecycleOwner"

    .line 183
    .line 184
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 185
    .line 186
    .line 187
    return-void

    .line 188
    :cond_3
    iput-boolean v5, v8, Landroidx/lifecycle/SavedStateHandleController;->j:Z

    .line 189
    .line 190
    invoke-virtual {v9, v8}, Landroidx/lifecycle/a;->a(Lbi0;)V

    .line 191
    .line 192
    .line 193
    throw v4

    .line 194
    :catchall_0
    move-exception p0

    .line 195
    :try_start_4
    monitor-exit v11
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 196
    throw p0

    .line 197
    :cond_4
    new-instance v2, Ljava/util/HashSet;

    .line 198
    .line 199
    iget-object v3, v3, Lhi1;->a:Ljava/util/LinkedHashMap;

    .line 200
    .line 201
    invoke-virtual {v3}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    .line 202
    .line 203
    .line 204
    move-result-object v3

    .line 205
    invoke-direct {v2, v3}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 206
    .line 207
    .line 208
    invoke-virtual {v2}, Ljava/util/HashSet;->isEmpty()Z

    .line 209
    .line 210
    .line 211
    move-result v2

    .line 212
    if-nez v2, :cond_1

    .line 213
    .line 214
    const-class v2, Lqh0;

    .line 215
    .line 216
    iget-boolean v3, v6, Lk6;->e:Z

    .line 217
    .line 218
    if-eqz v3, :cond_6

    .line 219
    .line 220
    iget-object v3, v6, Lk6;->b:Ljava/lang/Object;

    .line 221
    .line 222
    check-cast v3, Lc6;

    .line 223
    .line 224
    if-nez v3, :cond_5

    .line 225
    .line 226
    new-instance v3, Lc6;

    .line 227
    .line 228
    invoke-direct {v3, v6}, Lc6;-><init>(Lk6;)V

    .line 229
    .line 230
    .line 231
    :cond_5
    iput-object v3, v6, Lk6;->b:Ljava/lang/Object;

    .line 232
    .line 233
    :try_start_5
    invoke-virtual {v2, v4}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;
    :try_end_5
    .catch Ljava/lang/NoSuchMethodException; {:try_start_5 .. :try_end_5} :catch_0

    .line 234
    .line 235
    .line 236
    iget-object v3, v6, Lk6;->b:Ljava/lang/Object;

    .line 237
    .line 238
    check-cast v3, Lc6;

    .line 239
    .line 240
    if-eqz v3, :cond_1

    .line 241
    .line 242
    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 243
    .line 244
    .line 245
    move-result-object v2

    .line 246
    iget-object v3, v3, Lc6;->b:Ljava/lang/Object;

    .line 247
    .line 248
    check-cast v3, Ljava/util/LinkedHashSet;

    .line 249
    .line 250
    invoke-interface {v3, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 251
    .line 252
    .line 253
    goto/16 :goto_0

    .line 254
    .line 255
    :catch_0
    move-exception p0

    .line 256
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 257
    .line 258
    const-string p2, "Class "

    .line 259
    .line 260
    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 261
    .line 262
    .line 263
    move-result-object v0

    .line 264
    new-instance v1, Ljava/lang/StringBuilder;

    .line 265
    .line 266
    invoke-direct {v1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 267
    .line 268
    .line 269
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 270
    .line 271
    .line 272
    const-string p2, " must have default constructor in order to be automatically recreated"

    .line 273
    .line 274
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 275
    .line 276
    .line 277
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 278
    .line 279
    .line 280
    move-result-object p2

    .line 281
    invoke-direct {p1, p2, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 282
    .line 283
    .line 284
    throw p1

    .line 285
    :cond_6
    const-string p0, "Can not perform this action after onSaveInstanceState"

    .line 286
    .line 287
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 288
    .line 289
    .line 290
    return-void

    .line 291
    :cond_7
    const-string p0, "Internal error: OnRecreation should be registered only on components that implement ViewModelStoreOwner"

    .line 292
    .line 293
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 294
    .line 295
    .line 296
    return-void

    .line 297
    :catch_1
    move-exception p0

    .line 298
    const-string p1, "Failed to instantiate "

    .line 299
    .line 300
    invoke-static {p1, v2}, Loq;->h(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 301
    .line 302
    .line 303
    move-result-object p1

    .line 304
    invoke-static {p1, p0}, Lo40;->p(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 305
    .line 306
    .line 307
    return-void

    .line 308
    :catch_2
    move-exception p0

    .line 309
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 310
    .line 311
    const-string p2, "Class "

    .line 312
    .line 313
    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 314
    .line 315
    .line 316
    move-result-object v0

    .line 317
    new-instance v1, Ljava/lang/StringBuilder;

    .line 318
    .line 319
    invoke-direct {v1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 320
    .line 321
    .line 322
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 323
    .line 324
    .line 325
    const-string p2, " must have default constructor in order to be automatically recreated"

    .line 326
    .line 327
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 328
    .line 329
    .line 330
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 331
    .line 332
    .line 333
    move-result-object p2

    .line 334
    invoke-direct {p1, p2, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 335
    .line 336
    .line 337
    throw p1

    .line 338
    :catch_3
    move-exception p0

    .line 339
    const-string p1, "Class "

    .line 340
    .line 341
    const-string p2, " wasn\'t found"

    .line 342
    .line 343
    invoke-static {p1, v2, p2}, Loq;->j(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 344
    .line 345
    .line 346
    move-result-object p1

    .line 347
    invoke-static {p1, p0}, Lo40;->p(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 348
    .line 349
    .line 350
    :cond_8
    :goto_1
    return-void

    .line 351
    :cond_9
    const-string p0, "Bundle with restored state for the component \"androidx.savedstate.Restarter\" must contain list of strings by the key \"classes_to_restore\""

    .line 352
    .line 353
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 354
    .line 355
    .line 356
    return-void

    .line 357
    :cond_a
    new-instance p0, Ljava/lang/AssertionError;

    .line 358
    .line 359
    const-string p1, "Next event must be ON_CREATE"

    .line 360
    .line 361
    invoke-direct {p0, p1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    .line 362
    .line 363
    .line 364
    throw p0
.end method
