.class public final Landroidx/lifecycle/a;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public a:Lo20;

.field public b:Lwh0;

.field public final c:Ljava/lang/ref/WeakReference;

.field public d:I

.field public e:Z

.field public f:Z

.field public final g:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>(Lci0;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 7
    .line 8
    .line 9
    new-instance v0, Lo20;

    .line 10
    .line 11
    invoke-direct {v0}, Lo20;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Landroidx/lifecycle/a;->a:Lo20;

    .line 15
    .line 16
    sget-object v0, Lwh0;->k:Lwh0;

    .line 17
    .line 18
    iput-object v0, p0, Landroidx/lifecycle/a;->b:Lwh0;

    .line 19
    .line 20
    new-instance v0, Ljava/util/ArrayList;

    .line 21
    .line 22
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Landroidx/lifecycle/a;->g:Ljava/util/ArrayList;

    .line 26
    .line 27
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 28
    .line 29
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    iput-object v0, p0, Landroidx/lifecycle/a;->c:Ljava/lang/ref/WeakReference;

    .line 33
    .line 34
    return-void
.end method


# virtual methods
.method public final a(Lbi0;)V
    .locals 9

    .line 1
    const-string v0, "addObserver"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroidx/lifecycle/a;->c(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Landroidx/lifecycle/a;->b:Lwh0;

    .line 7
    .line 8
    sget-object v1, Lwh0;->j:Lwh0;

    .line 9
    .line 10
    if-ne v0, v1, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    sget-object v1, Lwh0;->k:Lwh0;

    .line 14
    .line 15
    :goto_0
    new-instance v0, Ldi0;

    .line 16
    .line 17
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 18
    .line 19
    .line 20
    sget-object v2, Lei0;->a:Ljava/util/HashMap;

    .line 21
    .line 22
    instance-of v2, p1, Lzh0;

    .line 23
    .line 24
    instance-of v3, p1, Lvv;

    .line 25
    .line 26
    const/4 v4, 0x2

    .line 27
    const/4 v5, 0x0

    .line 28
    const/4 v6, 0x0

    .line 29
    const/4 v7, 0x1

    .line 30
    if-eqz v2, :cond_1

    .line 31
    .line 32
    if-eqz v3, :cond_1

    .line 33
    .line 34
    new-instance v2, Landroidx/lifecycle/DefaultLifecycleObserverAdapter;

    .line 35
    .line 36
    move-object v3, p1

    .line 37
    check-cast v3, Lvv;

    .line 38
    .line 39
    move-object v8, p1

    .line 40
    check-cast v8, Lzh0;

    .line 41
    .line 42
    invoke-direct {v2, v3, v8}, Landroidx/lifecycle/DefaultLifecycleObserverAdapter;-><init>(Lvv;Lzh0;)V

    .line 43
    .line 44
    .line 45
    goto :goto_1

    .line 46
    :cond_1
    if-eqz v3, :cond_2

    .line 47
    .line 48
    new-instance v2, Landroidx/lifecycle/DefaultLifecycleObserverAdapter;

    .line 49
    .line 50
    move-object v3, p1

    .line 51
    check-cast v3, Lvv;

    .line 52
    .line 53
    invoke-direct {v2, v3, v5}, Landroidx/lifecycle/DefaultLifecycleObserverAdapter;-><init>(Lvv;Lzh0;)V

    .line 54
    .line 55
    .line 56
    goto :goto_1

    .line 57
    :cond_2
    if-eqz v2, :cond_3

    .line 58
    .line 59
    move-object v2, p1

    .line 60
    check-cast v2, Lzh0;

    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_3
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    invoke-static {v2}, Lei0;->b(Ljava/lang/Class;)I

    .line 68
    .line 69
    .line 70
    move-result v3

    .line 71
    if-ne v3, v4, :cond_6

    .line 72
    .line 73
    sget-object v3, Lei0;->b:Ljava/util/HashMap;

    .line 74
    .line 75
    invoke-virtual {v3, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 80
    .line 81
    .line 82
    check-cast v2, Ljava/util/List;

    .line 83
    .line 84
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 85
    .line 86
    .line 87
    move-result v3

    .line 88
    if-eq v3, v7, :cond_5

    .line 89
    .line 90
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 91
    .line 92
    .line 93
    move-result v3

    .line 94
    new-array v8, v3, [Lba0;

    .line 95
    .line 96
    if-gtz v3, :cond_4

    .line 97
    .line 98
    new-instance v2, Landroidx/lifecycle/CompositeGeneratedAdaptersObserver;

    .line 99
    .line 100
    invoke-direct {v2, v8}, Landroidx/lifecycle/CompositeGeneratedAdaptersObserver;-><init>([Lba0;)V

    .line 101
    .line 102
    .line 103
    goto :goto_1

    .line 104
    :cond_4
    invoke-interface {v2, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    check-cast p0, Ljava/lang/reflect/Constructor;

    .line 109
    .line 110
    invoke-static {p0, p1}, Lei0;->a(Ljava/lang/reflect/Constructor;Ljava/lang/Object;)V

    .line 111
    .line 112
    .line 113
    throw v5

    .line 114
    :cond_5
    invoke-interface {v2, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    check-cast p0, Ljava/lang/reflect/Constructor;

    .line 119
    .line 120
    invoke-static {p0, p1}, Lei0;->a(Ljava/lang/reflect/Constructor;Ljava/lang/Object;)V

    .line 121
    .line 122
    .line 123
    throw v5

    .line 124
    :cond_6
    new-instance v2, Landroidx/lifecycle/ReflectiveGenericLifecycleObserver;

    .line 125
    .line 126
    invoke-direct {v2, p1}, Landroidx/lifecycle/ReflectiveGenericLifecycleObserver;-><init>(Ljava/lang/Object;)V

    .line 127
    .line 128
    .line 129
    :goto_1
    iput-object v2, v0, Ldi0;->b:Lzh0;

    .line 130
    .line 131
    iput-object v1, v0, Ldi0;->a:Lwh0;

    .line 132
    .line 133
    iget-object v1, p0, Landroidx/lifecycle/a;->a:Lo20;

    .line 134
    .line 135
    invoke-virtual {v1, p1}, Lo20;->b(Ljava/lang/Object;)Ln21;

    .line 136
    .line 137
    .line 138
    move-result-object v2

    .line 139
    if-eqz v2, :cond_7

    .line 140
    .line 141
    iget-object v1, v2, Ln21;->k:Ljava/lang/Object;

    .line 142
    .line 143
    goto :goto_3

    .line 144
    :cond_7
    iget-object v2, v1, Lo20;->n:Ljava/util/HashMap;

    .line 145
    .line 146
    new-instance v3, Ln21;

    .line 147
    .line 148
    invoke-direct {v3, p1, v0}, Ln21;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 149
    .line 150
    .line 151
    iget v8, v1, Lq21;->m:I

    .line 152
    .line 153
    add-int/2addr v8, v7

    .line 154
    iput v8, v1, Lq21;->m:I

    .line 155
    .line 156
    iget-object v8, v1, Lq21;->k:Ln21;

    .line 157
    .line 158
    if-nez v8, :cond_8

    .line 159
    .line 160
    iput-object v3, v1, Lq21;->j:Ln21;

    .line 161
    .line 162
    iput-object v3, v1, Lq21;->k:Ln21;

    .line 163
    .line 164
    goto :goto_2

    .line 165
    :cond_8
    iput-object v3, v8, Ln21;->l:Ln21;

    .line 166
    .line 167
    iput-object v8, v3, Ln21;->m:Ln21;

    .line 168
    .line 169
    iput-object v3, v1, Lq21;->k:Ln21;

    .line 170
    .line 171
    :goto_2
    invoke-virtual {v2, p1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 172
    .line 173
    .line 174
    move-object v1, v5

    .line 175
    :goto_3
    check-cast v1, Ldi0;

    .line 176
    .line 177
    if-eqz v1, :cond_9

    .line 178
    .line 179
    goto :goto_4

    .line 180
    :cond_9
    iget-object v1, p0, Landroidx/lifecycle/a;->c:Ljava/lang/ref/WeakReference;

    .line 181
    .line 182
    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 183
    .line 184
    .line 185
    move-result-object v1

    .line 186
    check-cast v1, Lci0;

    .line 187
    .line 188
    if-nez v1, :cond_a

    .line 189
    .line 190
    :goto_4
    return-void

    .line 191
    :cond_a
    iget v2, p0, Landroidx/lifecycle/a;->d:I

    .line 192
    .line 193
    if-nez v2, :cond_b

    .line 194
    .line 195
    iget-boolean v2, p0, Landroidx/lifecycle/a;->e:Z

    .line 196
    .line 197
    if-eqz v2, :cond_c

    .line 198
    .line 199
    :cond_b
    move v6, v7

    .line 200
    :cond_c
    invoke-virtual {p0, p1}, Landroidx/lifecycle/a;->b(Lbi0;)Lwh0;

    .line 201
    .line 202
    .line 203
    move-result-object v2

    .line 204
    iget v3, p0, Landroidx/lifecycle/a;->d:I

    .line 205
    .line 206
    add-int/2addr v3, v7

    .line 207
    iput v3, p0, Landroidx/lifecycle/a;->d:I

    .line 208
    .line 209
    :goto_5
    iget-object v3, v0, Ldi0;->a:Lwh0;

    .line 210
    .line 211
    invoke-virtual {v3, v2}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    .line 212
    .line 213
    .line 214
    move-result v2

    .line 215
    if-gez v2, :cond_11

    .line 216
    .line 217
    iget-object v2, p0, Landroidx/lifecycle/a;->a:Lo20;

    .line 218
    .line 219
    iget-object v2, v2, Lo20;->n:Ljava/util/HashMap;

    .line 220
    .line 221
    invoke-virtual {v2, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 222
    .line 223
    .line 224
    move-result v2

    .line 225
    if-eqz v2, :cond_11

    .line 226
    .line 227
    iget-object v2, v0, Ldi0;->a:Lwh0;

    .line 228
    .line 229
    iget-object v3, p0, Landroidx/lifecycle/a;->g:Ljava/util/ArrayList;

    .line 230
    .line 231
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 232
    .line 233
    .line 234
    sget-object v2, Lvh0;->Companion:Lth0;

    .line 235
    .line 236
    iget-object v8, v0, Ldi0;->a:Lwh0;

    .line 237
    .line 238
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 239
    .line 240
    .line 241
    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 242
    .line 243
    .line 244
    invoke-virtual {v8}, Ljava/lang/Enum;->ordinal()I

    .line 245
    .line 246
    .line 247
    move-result v2

    .line 248
    if-eq v2, v7, :cond_f

    .line 249
    .line 250
    if-eq v2, v4, :cond_e

    .line 251
    .line 252
    const/4 v8, 0x3

    .line 253
    if-eq v2, v8, :cond_d

    .line 254
    .line 255
    move-object v2, v5

    .line 256
    goto :goto_6

    .line 257
    :cond_d
    sget-object v2, Lvh0;->ON_RESUME:Lvh0;

    .line 258
    .line 259
    goto :goto_6

    .line 260
    :cond_e
    sget-object v2, Lvh0;->ON_START:Lvh0;

    .line 261
    .line 262
    goto :goto_6

    .line 263
    :cond_f
    sget-object v2, Lvh0;->ON_CREATE:Lvh0;

    .line 264
    .line 265
    :goto_6
    if-eqz v2, :cond_10

    .line 266
    .line 267
    invoke-virtual {v0, v1, v2}, Ldi0;->a(Lci0;Lvh0;)V

    .line 268
    .line 269
    .line 270
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 271
    .line 272
    .line 273
    move-result v2

    .line 274
    sub-int/2addr v2, v7

    .line 275
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 276
    .line 277
    .line 278
    invoke-virtual {p0, p1}, Landroidx/lifecycle/a;->b(Lbi0;)Lwh0;

    .line 279
    .line 280
    .line 281
    move-result-object v2

    .line 282
    goto :goto_5

    .line 283
    :cond_10
    const-string p0, "no event up from "

    .line 284
    .line 285
    iget-object p1, v0, Ldi0;->a:Lwh0;

    .line 286
    .line 287
    invoke-static {p1, p0}, Lo40;->t(Ljava/lang/Object;Ljava/lang/String;)V

    .line 288
    .line 289
    .line 290
    return-void

    .line 291
    :cond_11
    if-nez v6, :cond_12

    .line 292
    .line 293
    invoke-virtual {p0}, Landroidx/lifecycle/a;->g()V

    .line 294
    .line 295
    .line 296
    :cond_12
    iget p1, p0, Landroidx/lifecycle/a;->d:I

    .line 297
    .line 298
    add-int/lit8 p1, p1, -0x1

    .line 299
    .line 300
    iput p1, p0, Landroidx/lifecycle/a;->d:I

    .line 301
    .line 302
    return-void
.end method

.method public final b(Lbi0;)Lwh0;
    .locals 3

    .line 1
    iget-object v0, p0, Landroidx/lifecycle/a;->a:Lo20;

    .line 2
    .line 3
    iget-object v0, v0, Lo20;->n:Ljava/util/HashMap;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    check-cast p1, Ln21;

    .line 17
    .line 18
    iget-object p1, p1, Ln21;->m:Ln21;

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    move-object p1, v2

    .line 22
    :goto_0
    if-eqz p1, :cond_1

    .line 23
    .line 24
    iget-object p1, p1, Ln21;->k:Ljava/lang/Object;

    .line 25
    .line 26
    check-cast p1, Ldi0;

    .line 27
    .line 28
    iget-object p1, p1, Ldi0;->a:Lwh0;

    .line 29
    .line 30
    goto :goto_1

    .line 31
    :cond_1
    move-object p1, v2

    .line 32
    :goto_1
    iget-object v0, p0, Landroidx/lifecycle/a;->g:Ljava/util/ArrayList;

    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-nez v1, :cond_2

    .line 39
    .line 40
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    add-int/lit8 v1, v1, -0x1

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    move-object v2, v0

    .line 51
    check-cast v2, Lwh0;

    .line 52
    .line 53
    :cond_2
    iget-object p0, p0, Landroidx/lifecycle/a;->b:Lwh0;

    .line 54
    .line 55
    if-eqz p1, :cond_3

    .line 56
    .line 57
    invoke-virtual {p1, p0}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-gez v0, :cond_3

    .line 62
    .line 63
    goto :goto_2

    .line 64
    :cond_3
    move-object p1, p0

    .line 65
    :goto_2
    if-eqz v2, :cond_4

    .line 66
    .line 67
    invoke-virtual {v2, p1}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    .line 68
    .line 69
    .line 70
    move-result p0

    .line 71
    if-gez p0, :cond_4

    .line 72
    .line 73
    return-object v2

    .line 74
    :cond_4
    return-object p1
.end method

.method public final c(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {}, Ly9;->B()Ly9;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    if-ne p0, v0, :cond_0

    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    const-string p0, "Method "

    .line 24
    .line 25
    const-string v0, " must be called on the main thread"

    .line 26
    .line 27
    invoke-static {p0, p1, v0}, Loq;->j(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 32
    .line 33
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-direct {p1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    throw p1
.end method

.method public final d(Lvh0;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const-string v0, "handleLifecycleEvent"

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroidx/lifecycle/a;->c(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p1}, Lvh0;->a()Lwh0;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0, p1}, Landroidx/lifecycle/a;->e(Lwh0;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final e(Lwh0;)V
    .locals 3

    .line 1
    iget-object v0, p0, Landroidx/lifecycle/a;->b:Lwh0;

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    sget-object v1, Lwh0;->k:Lwh0;

    .line 7
    .line 8
    sget-object v2, Lwh0;->j:Lwh0;

    .line 9
    .line 10
    if-ne v0, v1, :cond_2

    .line 11
    .line 12
    if-eq p1, v2, :cond_1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    const-string v0, "no event down from "

    .line 18
    .line 19
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Landroidx/lifecycle/a;->b:Lwh0;

    .line 23
    .line 24
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Landroidx/lifecycle/a;->c:Ljava/lang/ref/WeakReference;

    .line 28
    .line 29
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    const-string v0, " in component "

    .line 34
    .line 35
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 46
    .line 47
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-direct {p1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    throw p1

    .line 55
    :cond_2
    :goto_0
    iput-object p1, p0, Landroidx/lifecycle/a;->b:Lwh0;

    .line 56
    .line 57
    iget-boolean p1, p0, Landroidx/lifecycle/a;->e:Z

    .line 58
    .line 59
    const/4 v0, 0x1

    .line 60
    if-nez p1, :cond_5

    .line 61
    .line 62
    iget p1, p0, Landroidx/lifecycle/a;->d:I

    .line 63
    .line 64
    if-eqz p1, :cond_3

    .line 65
    .line 66
    goto :goto_2

    .line 67
    :cond_3
    iput-boolean v0, p0, Landroidx/lifecycle/a;->e:Z

    .line 68
    .line 69
    invoke-virtual {p0}, Landroidx/lifecycle/a;->g()V

    .line 70
    .line 71
    .line 72
    const/4 p1, 0x0

    .line 73
    iput-boolean p1, p0, Landroidx/lifecycle/a;->e:Z

    .line 74
    .line 75
    iget-object p1, p0, Landroidx/lifecycle/a;->b:Lwh0;

    .line 76
    .line 77
    if-ne p1, v2, :cond_4

    .line 78
    .line 79
    new-instance p1, Lo20;

    .line 80
    .line 81
    invoke-direct {p1}, Lo20;-><init>()V

    .line 82
    .line 83
    .line 84
    iput-object p1, p0, Landroidx/lifecycle/a;->a:Lo20;

    .line 85
    .line 86
    :cond_4
    :goto_1
    return-void

    .line 87
    :cond_5
    :goto_2
    iput-boolean v0, p0, Landroidx/lifecycle/a;->f:Z

    .line 88
    .line 89
    return-void
.end method

.method public final f(Lbi0;)V
    .locals 1

    .line 1
    const-string v0, "removeObserver"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroidx/lifecycle/a;->c(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Landroidx/lifecycle/a;->a:Lo20;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lo20;->c(Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final g()V
    .locals 11

    .line 1
    iget-object v0, p0, Landroidx/lifecycle/a;->c:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lci0;

    .line 8
    .line 9
    if-eqz v0, :cond_e

    .line 10
    .line 11
    :cond_0
    iget-object v1, p0, Landroidx/lifecycle/a;->a:Lo20;

    .line 12
    .line 13
    iget v2, v1, Lq21;->m:I

    .line 14
    .line 15
    const/4 v3, 0x0

    .line 16
    if-nez v2, :cond_1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    iget-object v1, v1, Lq21;->j:Ln21;

    .line 20
    .line 21
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 22
    .line 23
    .line 24
    iget-object v1, v1, Ln21;->k:Ljava/lang/Object;

    .line 25
    .line 26
    check-cast v1, Ldi0;

    .line 27
    .line 28
    iget-object v1, v1, Ldi0;->a:Lwh0;

    .line 29
    .line 30
    iget-object v2, p0, Landroidx/lifecycle/a;->a:Lo20;

    .line 31
    .line 32
    iget-object v2, v2, Lq21;->k:Ln21;

    .line 33
    .line 34
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 35
    .line 36
    .line 37
    iget-object v2, v2, Ln21;->k:Ljava/lang/Object;

    .line 38
    .line 39
    check-cast v2, Ldi0;

    .line 40
    .line 41
    iget-object v2, v2, Ldi0;->a:Lwh0;

    .line 42
    .line 43
    if-ne v1, v2, :cond_2

    .line 44
    .line 45
    iget-object v1, p0, Landroidx/lifecycle/a;->b:Lwh0;

    .line 46
    .line 47
    if-ne v1, v2, :cond_2

    .line 48
    .line 49
    :goto_0
    iput-boolean v3, p0, Landroidx/lifecycle/a;->f:Z

    .line 50
    .line 51
    return-void

    .line 52
    :cond_2
    iput-boolean v3, p0, Landroidx/lifecycle/a;->f:Z

    .line 53
    .line 54
    iget-object v1, p0, Landroidx/lifecycle/a;->b:Lwh0;

    .line 55
    .line 56
    iget-object v2, p0, Landroidx/lifecycle/a;->a:Lo20;

    .line 57
    .line 58
    iget-object v2, v2, Lq21;->j:Ln21;

    .line 59
    .line 60
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 61
    .line 62
    .line 63
    iget-object v2, v2, Ln21;->k:Ljava/lang/Object;

    .line 64
    .line 65
    check-cast v2, Ldi0;

    .line 66
    .line 67
    iget-object v2, v2, Ldi0;->a:Lwh0;

    .line 68
    .line 69
    invoke-virtual {v1, v2}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    const/4 v2, 0x0

    .line 74
    const/4 v3, 0x3

    .line 75
    const/4 v4, 0x2

    .line 76
    const/4 v5, 0x1

    .line 77
    iget-object v6, p0, Landroidx/lifecycle/a;->g:Ljava/util/ArrayList;

    .line 78
    .line 79
    if-gez v1, :cond_8

    .line 80
    .line 81
    iget-object v1, p0, Landroidx/lifecycle/a;->a:Lo20;

    .line 82
    .line 83
    new-instance v7, Lm21;

    .line 84
    .line 85
    iget-object v8, v1, Lq21;->k:Ln21;

    .line 86
    .line 87
    iget-object v9, v1, Lq21;->j:Ln21;

    .line 88
    .line 89
    invoke-direct {v7, v8, v9, v5}, Lm21;-><init>(Ln21;Ln21;I)V

    .line 90
    .line 91
    .line 92
    iget-object v1, v1, Lq21;->l:Ljava/util/WeakHashMap;

    .line 93
    .line 94
    sget-object v8, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 95
    .line 96
    invoke-virtual {v1, v7, v8}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    :cond_3
    invoke-virtual {v7}, Lm21;->hasNext()Z

    .line 100
    .line 101
    .line 102
    move-result v1

    .line 103
    if-eqz v1, :cond_8

    .line 104
    .line 105
    iget-boolean v1, p0, Landroidx/lifecycle/a;->f:Z

    .line 106
    .line 107
    if-nez v1, :cond_8

    .line 108
    .line 109
    invoke-virtual {v7}, Lm21;->next()Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    check-cast v1, Ljava/util/Map$Entry;

    .line 114
    .line 115
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 116
    .line 117
    .line 118
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    move-result-object v8

    .line 122
    check-cast v8, Lbi0;

    .line 123
    .line 124
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 125
    .line 126
    .line 127
    move-result-object v1

    .line 128
    check-cast v1, Ldi0;

    .line 129
    .line 130
    :goto_1
    iget-object v9, v1, Ldi0;->a:Lwh0;

    .line 131
    .line 132
    iget-object v10, p0, Landroidx/lifecycle/a;->b:Lwh0;

    .line 133
    .line 134
    invoke-virtual {v9, v10}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    .line 135
    .line 136
    .line 137
    move-result v9

    .line 138
    if-lez v9, :cond_3

    .line 139
    .line 140
    iget-boolean v9, p0, Landroidx/lifecycle/a;->f:Z

    .line 141
    .line 142
    if-nez v9, :cond_3

    .line 143
    .line 144
    iget-object v9, p0, Landroidx/lifecycle/a;->a:Lo20;

    .line 145
    .line 146
    iget-object v9, v9, Lo20;->n:Ljava/util/HashMap;

    .line 147
    .line 148
    invoke-virtual {v9, v8}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 149
    .line 150
    .line 151
    move-result v9

    .line 152
    if-eqz v9, :cond_3

    .line 153
    .line 154
    sget-object v9, Lvh0;->Companion:Lth0;

    .line 155
    .line 156
    iget-object v10, v1, Ldi0;->a:Lwh0;

    .line 157
    .line 158
    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 159
    .line 160
    .line 161
    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 162
    .line 163
    .line 164
    invoke-virtual {v10}, Ljava/lang/Enum;->ordinal()I

    .line 165
    .line 166
    .line 167
    move-result v9

    .line 168
    if-eq v9, v4, :cond_6

    .line 169
    .line 170
    if-eq v9, v3, :cond_5

    .line 171
    .line 172
    const/4 v10, 0x4

    .line 173
    if-eq v9, v10, :cond_4

    .line 174
    .line 175
    move-object v9, v2

    .line 176
    goto :goto_2

    .line 177
    :cond_4
    sget-object v9, Lvh0;->ON_PAUSE:Lvh0;

    .line 178
    .line 179
    goto :goto_2

    .line 180
    :cond_5
    sget-object v9, Lvh0;->ON_STOP:Lvh0;

    .line 181
    .line 182
    goto :goto_2

    .line 183
    :cond_6
    sget-object v9, Lvh0;->ON_DESTROY:Lvh0;

    .line 184
    .line 185
    :goto_2
    if-eqz v9, :cond_7

    .line 186
    .line 187
    invoke-virtual {v9}, Lvh0;->a()Lwh0;

    .line 188
    .line 189
    .line 190
    move-result-object v10

    .line 191
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 192
    .line 193
    .line 194
    invoke-virtual {v1, v0, v9}, Ldi0;->a(Lci0;Lvh0;)V

    .line 195
    .line 196
    .line 197
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    .line 198
    .line 199
    .line 200
    move-result v9

    .line 201
    sub-int/2addr v9, v5

    .line 202
    invoke-virtual {v6, v9}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 203
    .line 204
    .line 205
    goto :goto_1

    .line 206
    :cond_7
    const-string p0, "no event down from "

    .line 207
    .line 208
    iget-object v0, v1, Ldi0;->a:Lwh0;

    .line 209
    .line 210
    invoke-static {v0, p0}, Lo40;->t(Ljava/lang/Object;Ljava/lang/String;)V

    .line 211
    .line 212
    .line 213
    return-void

    .line 214
    :cond_8
    iget-object v1, p0, Landroidx/lifecycle/a;->a:Lo20;

    .line 215
    .line 216
    iget-object v1, v1, Lq21;->k:Ln21;

    .line 217
    .line 218
    iget-boolean v7, p0, Landroidx/lifecycle/a;->f:Z

    .line 219
    .line 220
    if-nez v7, :cond_0

    .line 221
    .line 222
    if-eqz v1, :cond_0

    .line 223
    .line 224
    iget-object v7, p0, Landroidx/lifecycle/a;->b:Lwh0;

    .line 225
    .line 226
    iget-object v1, v1, Ln21;->k:Ljava/lang/Object;

    .line 227
    .line 228
    check-cast v1, Ldi0;

    .line 229
    .line 230
    iget-object v1, v1, Ldi0;->a:Lwh0;

    .line 231
    .line 232
    invoke-virtual {v7, v1}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    .line 233
    .line 234
    .line 235
    move-result v1

    .line 236
    if-lez v1, :cond_0

    .line 237
    .line 238
    iget-object v1, p0, Landroidx/lifecycle/a;->a:Lo20;

    .line 239
    .line 240
    new-instance v7, Lo21;

    .line 241
    .line 242
    invoke-direct {v7, v1}, Lo21;-><init>(Lq21;)V

    .line 243
    .line 244
    .line 245
    iget-object v1, v1, Lq21;->l:Ljava/util/WeakHashMap;

    .line 246
    .line 247
    sget-object v8, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 248
    .line 249
    invoke-virtual {v1, v7, v8}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 250
    .line 251
    .line 252
    :cond_9
    invoke-virtual {v7}, Lo21;->hasNext()Z

    .line 253
    .line 254
    .line 255
    move-result v1

    .line 256
    if-eqz v1, :cond_0

    .line 257
    .line 258
    iget-boolean v1, p0, Landroidx/lifecycle/a;->f:Z

    .line 259
    .line 260
    if-nez v1, :cond_0

    .line 261
    .line 262
    invoke-virtual {v7}, Lo21;->next()Ljava/lang/Object;

    .line 263
    .line 264
    .line 265
    move-result-object v1

    .line 266
    check-cast v1, Ljava/util/Map$Entry;

    .line 267
    .line 268
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 269
    .line 270
    .line 271
    move-result-object v8

    .line 272
    check-cast v8, Lbi0;

    .line 273
    .line 274
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 275
    .line 276
    .line 277
    move-result-object v1

    .line 278
    check-cast v1, Ldi0;

    .line 279
    .line 280
    :goto_3
    iget-object v9, v1, Ldi0;->a:Lwh0;

    .line 281
    .line 282
    iget-object v10, p0, Landroidx/lifecycle/a;->b:Lwh0;

    .line 283
    .line 284
    invoke-virtual {v9, v10}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    .line 285
    .line 286
    .line 287
    move-result v9

    .line 288
    if-gez v9, :cond_9

    .line 289
    .line 290
    iget-boolean v9, p0, Landroidx/lifecycle/a;->f:Z

    .line 291
    .line 292
    if-nez v9, :cond_9

    .line 293
    .line 294
    iget-object v9, p0, Landroidx/lifecycle/a;->a:Lo20;

    .line 295
    .line 296
    iget-object v9, v9, Lo20;->n:Ljava/util/HashMap;

    .line 297
    .line 298
    invoke-virtual {v9, v8}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 299
    .line 300
    .line 301
    move-result v9

    .line 302
    if-eqz v9, :cond_9

    .line 303
    .line 304
    iget-object v9, v1, Ldi0;->a:Lwh0;

    .line 305
    .line 306
    invoke-virtual {v6, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 307
    .line 308
    .line 309
    sget-object v9, Lvh0;->Companion:Lth0;

    .line 310
    .line 311
    iget-object v10, v1, Ldi0;->a:Lwh0;

    .line 312
    .line 313
    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 314
    .line 315
    .line 316
    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 317
    .line 318
    .line 319
    invoke-virtual {v10}, Ljava/lang/Enum;->ordinal()I

    .line 320
    .line 321
    .line 322
    move-result v9

    .line 323
    if-eq v9, v5, :cond_c

    .line 324
    .line 325
    if-eq v9, v4, :cond_b

    .line 326
    .line 327
    if-eq v9, v3, :cond_a

    .line 328
    .line 329
    move-object v9, v2

    .line 330
    goto :goto_4

    .line 331
    :cond_a
    sget-object v9, Lvh0;->ON_RESUME:Lvh0;

    .line 332
    .line 333
    goto :goto_4

    .line 334
    :cond_b
    sget-object v9, Lvh0;->ON_START:Lvh0;

    .line 335
    .line 336
    goto :goto_4

    .line 337
    :cond_c
    sget-object v9, Lvh0;->ON_CREATE:Lvh0;

    .line 338
    .line 339
    :goto_4
    if-eqz v9, :cond_d

    .line 340
    .line 341
    invoke-virtual {v1, v0, v9}, Ldi0;->a(Lci0;Lvh0;)V

    .line 342
    .line 343
    .line 344
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    .line 345
    .line 346
    .line 347
    move-result v9

    .line 348
    sub-int/2addr v9, v5

    .line 349
    invoke-virtual {v6, v9}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 350
    .line 351
    .line 352
    goto :goto_3

    .line 353
    :cond_d
    const-string p0, "no event up from "

    .line 354
    .line 355
    iget-object v0, v1, Ldi0;->a:Lwh0;

    .line 356
    .line 357
    invoke-static {v0, p0}, Lo40;->t(Ljava/lang/Object;Ljava/lang/String;)V

    .line 358
    .line 359
    .line 360
    return-void

    .line 361
    :cond_e
    const-string p0, "LifecycleOwner of this LifecycleRegistry is already garbage collected. It is too late to change lifecycle state."

    .line 362
    .line 363
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 364
    .line 365
    .line 366
    return-void
.end method
