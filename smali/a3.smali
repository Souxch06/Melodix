.class public final synthetic La3;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:I

.field public final synthetic k:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;)V
    .locals 0

    .line 1
    iput p1, p0, La3;->j:I

    .line 2
    .line 3
    iput-object p2, p0, La3;->k:Ljava/lang/Object;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private final a()V
    .locals 4

    .line 1
    iget-object p0, p0, La3;->k:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Lvx;

    .line 4
    .line 5
    iget-object v0, p0, Lvx;->c:Ljava/io/Serializable;

    .line 6
    .line 7
    check-cast v0, Ljava/util/concurrent/atomic/AtomicReference;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    monitor-enter p0

    .line 14
    :try_start_0
    iget-object v0, p0, Lvx;->b:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast v0, Ljava/util/concurrent/atomic/AtomicMarkableReference;

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicMarkableReference;->isMarked()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    iget-object v0, p0, Lvx;->b:Ljava/lang/Object;

    .line 25
    .line 26
    check-cast v0, Ljava/util/concurrent/atomic/AtomicMarkableReference;

    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicMarkableReference;->getReference()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Lgh0;

    .line 33
    .line 34
    monitor-enter v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 35
    :try_start_1
    new-instance v1, Ljava/util/HashMap;

    .line 36
    .line 37
    iget-object v2, v0, Lgh0;->a:Ljava/util/HashMap;

    .line 38
    .line 39
    invoke-direct {v1, v2}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 40
    .line 41
    .line 42
    invoke-static {v1}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    .line 43
    .line 44
    .line 45
    move-result-object v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 46
    :try_start_2
    monitor-exit v0

    .line 47
    iget-object v0, p0, Lvx;->b:Ljava/lang/Object;

    .line 48
    .line 49
    check-cast v0, Ljava/util/concurrent/atomic/AtomicMarkableReference;

    .line 50
    .line 51
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicMarkableReference;->getReference()Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    check-cast v2, Lgh0;

    .line 56
    .line 57
    const/4 v3, 0x0

    .line 58
    invoke-virtual {v0, v2, v3}, Ljava/util/concurrent/atomic/AtomicMarkableReference;->set(Ljava/lang/Object;Z)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 59
    .line 60
    .line 61
    goto :goto_0

    .line 62
    :catchall_0
    move-exception v0

    .line 63
    goto :goto_1

    .line 64
    :catchall_1
    move-exception v1

    .line 65
    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 66
    :try_start_4
    throw v1

    .line 67
    :cond_0
    :goto_0
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 68
    if-eqz v1, :cond_1

    .line 69
    .line 70
    iget-object v0, p0, Lvx;->d:Ljava/lang/Object;

    .line 71
    .line 72
    check-cast v0, Lnm;

    .line 73
    .line 74
    iget-object v2, v0, Lnm;->j:Ljava/lang/Object;

    .line 75
    .line 76
    check-cast v2, Lwn0;

    .line 77
    .line 78
    iget-object v0, v0, Lnm;->l:Ljava/lang/Object;

    .line 79
    .line 80
    check-cast v0, Ljava/lang/String;

    .line 81
    .line 82
    iget-boolean p0, p0, Lvx;->a:Z

    .line 83
    .line 84
    invoke-virtual {v2, v0, v1, p0}, Lwn0;->h(Ljava/lang/String;Ljava/util/Map;Z)V

    .line 85
    .line 86
    .line 87
    :cond_1
    return-void

    .line 88
    :goto_1
    :try_start_5
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 89
    throw v0
.end method


# virtual methods
.method public final run()V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget v1, v0, La3;->j:I

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x1

    .line 7
    const/4 v4, 0x2

    .line 8
    const/4 v5, 0x0

    .line 9
    packed-switch v1, :pswitch_data_0

    .line 10
    .line 11
    .line 12
    iget-object v0, v0, La3;->k:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast v0, Ler0;

    .line 15
    .line 16
    iget-object v1, v0, Ler0;->n:Ljava/lang/Object;

    .line 17
    .line 18
    check-cast v1, Lh21;

    .line 19
    .line 20
    new-instance v2, Lfj;

    .line 21
    .line 22
    const/16 v3, 0xb

    .line 23
    .line 24
    invoke-direct {v2, v3, v0}, Lfj;-><init>(ILjava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v1, v2}, Lh21;->r(Lfb1;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :pswitch_0
    invoke-direct {v0}, La3;->a()V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :pswitch_1
    iget-object v0, v0, La3;->k:Ljava/lang/Object;

    .line 36
    .line 37
    check-cast v0, Landroid/widget/ProgressBar;

    .line 38
    .line 39
    invoke-virtual {v0, v5}, Landroid/view/View;->setVisibility(I)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0, v5}, Landroid/widget/ProgressBar;->setIndeterminate(Z)V

    .line 43
    .line 44
    .line 45
    const/16 v1, 0x64

    .line 46
    .line 47
    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setMax(I)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0, v5}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 51
    .line 52
    .line 53
    const/high16 v1, 0x3f000000    # 0.5f

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleY(F)V

    .line 56
    .line 57
    .line 58
    const/high16 v1, -0x10000

    .line 59
    .line 60
    invoke-static {v1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setProgressTintList(Landroid/content/res/ColorStateList;)V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :pswitch_2
    iget-object v0, v0, La3;->k:Ljava/lang/Object;

    .line 69
    .line 70
    check-cast v0, Landroid/webkit/PermissionRequest;

    .line 71
    .line 72
    invoke-virtual {v0}, Landroid/webkit/PermissionRequest;->getResources()[Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 77
    .line 78
    .line 79
    const-string v2, "android.webkit.resource.PROTECTED_MEDIA_ID"

    .line 80
    .line 81
    invoke-static {v1, v2}, Lia;->R([Ljava/lang/Object;Ljava/lang/Object;)I

    .line 82
    .line 83
    .line 84
    move-result v1

    .line 85
    if-ltz v1, :cond_0

    .line 86
    .line 87
    invoke-virtual {v0}, Landroid/webkit/PermissionRequest;->getResources()[Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    invoke-virtual {v0, v1}, Landroid/webkit/PermissionRequest;->grant([Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_0
    invoke-virtual {v0}, Landroid/webkit/PermissionRequest;->deny()V

    .line 96
    .line 97
    .line 98
    :goto_0
    return-void

    .line 99
    :pswitch_3
    iget-object v0, v0, La3;->k:Ljava/lang/Object;

    .line 100
    .line 101
    check-cast v0, Landroid/view/View;

    .line 102
    .line 103
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    const-string v2, "input_method"

    .line 108
    .line 109
    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    check-cast v1, Landroid/view/inputmethod/InputMethodManager;

    .line 114
    .line 115
    invoke-virtual {v1, v0, v5}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;I)Z

    .line 116
    .line 117
    .line 118
    return-void

    .line 119
    :pswitch_4
    iget-object v0, v0, La3;->k:Ljava/lang/Object;

    .line 120
    .line 121
    check-cast v0, Lpa0;

    .line 122
    .line 123
    iget-object v0, v0, Lpa0;->k:Ljava/lang/Object;

    .line 124
    .line 125
    check-cast v0, Lcom/google/android/material/sidesheet/SideSheetBehavior;

    .line 126
    .line 127
    iget v1, v0, Lcom/google/android/material/sidesheet/SideSheetBehavior;->m:I

    .line 128
    .line 129
    if-ne v1, v4, :cond_2

    .line 130
    .line 131
    if-nez v1, :cond_1

    .line 132
    .line 133
    goto :goto_1

    .line 134
    :cond_1
    iput v5, v0, Lcom/google/android/material/sidesheet/SideSheetBehavior;->m:I

    .line 135
    .line 136
    :cond_2
    :goto_1
    return-void

    .line 137
    :pswitch_5
    iget-object v0, v0, La3;->k:Ljava/lang/Object;

    .line 138
    .line 139
    check-cast v0, Lmv0;

    .line 140
    .line 141
    iget-object v1, v0, Lmv0;->o:Landroidx/lifecycle/a;

    .line 142
    .line 143
    iget v2, v0, Lmv0;->k:I

    .line 144
    .line 145
    if-nez v2, :cond_3

    .line 146
    .line 147
    iput-boolean v3, v0, Lmv0;->l:Z

    .line 148
    .line 149
    sget-object v2, Lvh0;->ON_PAUSE:Lvh0;

    .line 150
    .line 151
    invoke-virtual {v1, v2}, Landroidx/lifecycle/a;->d(Lvh0;)V

    .line 152
    .line 153
    .line 154
    :cond_3
    iget v2, v0, Lmv0;->j:I

    .line 155
    .line 156
    if-nez v2, :cond_4

    .line 157
    .line 158
    iget-boolean v2, v0, Lmv0;->l:Z

    .line 159
    .line 160
    if-eqz v2, :cond_4

    .line 161
    .line 162
    sget-object v2, Lvh0;->ON_STOP:Lvh0;

    .line 163
    .line 164
    invoke-virtual {v1, v2}, Landroidx/lifecycle/a;->d(Lvh0;)V

    .line 165
    .line 166
    .line 167
    iput-boolean v3, v0, Lmv0;->m:Z

    .line 168
    .line 169
    :cond_4
    return-void

    .line 170
    :pswitch_6
    iget-object v0, v0, La3;->k:Ljava/lang/Object;

    .line 171
    .line 172
    check-cast v0, Lp80;

    .line 173
    .line 174
    invoke-interface {v0}, Lp80;->a()Ljava/lang/Object;

    .line 175
    .line 176
    .line 177
    return-void

    .line 178
    :pswitch_7
    iget-object v0, v0, La3;->k:Ljava/lang/Object;

    .line 179
    .line 180
    move-object v1, v0

    .line 181
    check-cast v1, Ll60;

    .line 182
    .line 183
    const-string v0, "fetchFonts result is not OK. ("

    .line 184
    .line 185
    iget-object v2, v1, Ll60;->c:Ljava/lang/Object;

    .line 186
    .line 187
    monitor-enter v2

    .line 188
    :try_start_0
    iget-object v3, v1, Ll60;->g:Lxg;

    .line 189
    .line 190
    if-nez v3, :cond_5

    .line 191
    .line 192
    monitor-exit v2

    .line 193
    goto/16 :goto_7

    .line 194
    .line 195
    :catchall_0
    move-exception v0

    .line 196
    goto/16 :goto_9

    .line 197
    .line 198
    :cond_5
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 199
    :try_start_1
    invoke-virtual {v1}, Ll60;->c()Lw60;

    .line 200
    .line 201
    .line 202
    move-result-object v2

    .line 203
    iget v3, v2, Lw60;->e:I

    .line 204
    .line 205
    if-ne v3, v4, :cond_6

    .line 206
    .line 207
    iget-object v4, v1, Ll60;->c:Ljava/lang/Object;

    .line 208
    .line 209
    monitor-enter v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 210
    :try_start_2
    monitor-exit v4

    .line 211
    goto :goto_2

    .line 212
    :catchall_1
    move-exception v0

    .line 213
    monitor-exit v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 214
    :try_start_3
    throw v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 215
    :catchall_2
    move-exception v0

    .line 216
    goto/16 :goto_5

    .line 217
    .line 218
    :cond_6
    :goto_2
    if-nez v3, :cond_9

    .line 219
    .line 220
    :try_start_4
    const-string v0, "EmojiCompat.FontRequestEmojiCompatConfig.buildTypeface"

    .line 221
    .line 222
    sget v3, Lhd1;->a:I

    .line 223
    .line 224
    invoke-static {v0}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    .line 225
    .line 226
    .line 227
    iget-object v0, v1, Ll60;->a:Landroid/content/Context;

    .line 228
    .line 229
    filled-new-array {v2}, [Lw60;

    .line 230
    .line 231
    .line 232
    move-result-object v3

    .line 233
    sget-object v4, Lge1;->a:Lrs0;

    .line 234
    .line 235
    invoke-virtual {v4, v0, v3, v5}, Lrs0;->d(Landroid/content/Context;[Lw60;I)Landroid/graphics/Typeface;

    .line 236
    .line 237
    .line 238
    move-result-object v0

    .line 239
    iget-object v3, v1, Ll60;->a:Landroid/content/Context;

    .line 240
    .line 241
    iget-object v2, v2, Lw60;->a:Landroid/net/Uri;

    .line 242
    .line 243
    invoke-static {v3, v2}, Lfe1;->v(Landroid/content/Context;Landroid/net/Uri;)Ljava/nio/MappedByteBuffer;

    .line 244
    .line 245
    .line 246
    move-result-object v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_5

    .line 247
    if-eqz v2, :cond_8

    .line 248
    .line 249
    if-eqz v0, :cond_8

    .line 250
    .line 251
    :try_start_5
    const-string v3, "EmojiCompat.MetadataRepo.create"

    .line 252
    .line 253
    invoke-static {v3}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    .line 254
    .line 255
    .line 256
    new-instance v3, Ler0;

    .line 257
    .line 258
    invoke-static {v2}, Les0;->n(Ljava/nio/MappedByteBuffer;)Lao0;

    .line 259
    .line 260
    .line 261
    move-result-object v2

    .line 262
    invoke-direct {v3, v0, v2}, Ler0;-><init>(Landroid/graphics/Typeface;Lao0;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_4

    .line 263
    .line 264
    .line 265
    :try_start_6
    invoke-static {}, Landroid/os/Trace;->endSection()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_5

    .line 266
    .line 267
    .line 268
    :try_start_7
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 269
    .line 270
    .line 271
    iget-object v2, v1, Ll60;->c:Ljava/lang/Object;

    .line 272
    .line 273
    monitor-enter v2
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    .line 274
    :try_start_8
    iget-object v0, v1, Ll60;->g:Lxg;

    .line 275
    .line 276
    if-eqz v0, :cond_7

    .line 277
    .line 278
    invoke-virtual {v0, v3}, Lxg;->o(Ler0;)V

    .line 279
    .line 280
    .line 281
    goto :goto_3

    .line 282
    :catchall_3
    move-exception v0

    .line 283
    goto :goto_4

    .line 284
    :cond_7
    :goto_3
    monitor-exit v2
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    .line 285
    :try_start_9
    invoke-virtual {v1}, Ll60;->b()V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    .line 286
    .line 287
    .line 288
    goto :goto_7

    .line 289
    :goto_4
    :try_start_a
    monitor-exit v2
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_3

    .line 290
    :try_start_b
    throw v0
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_2

    .line 291
    :catchall_4
    move-exception v0

    .line 292
    :try_start_c
    sget v2, Lhd1;->a:I

    .line 293
    .line 294
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 295
    .line 296
    .line 297
    throw v0

    .line 298
    :cond_8
    new-instance v0, Ljava/lang/RuntimeException;

    .line 299
    .line 300
    const-string v2, "Unable to open file."

    .line 301
    .line 302
    invoke-direct {v0, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 303
    .line 304
    .line 305
    throw v0
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_5

    .line 306
    :catchall_5
    move-exception v0

    .line 307
    :try_start_d
    sget v2, Lhd1;->a:I

    .line 308
    .line 309
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 310
    .line 311
    .line 312
    throw v0

    .line 313
    :cond_9
    new-instance v2, Ljava/lang/RuntimeException;

    .line 314
    .line 315
    new-instance v4, Ljava/lang/StringBuilder;

    .line 316
    .line 317
    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 318
    .line 319
    .line 320
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 321
    .line 322
    .line 323
    const-string v0, ")"

    .line 324
    .line 325
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 326
    .line 327
    .line 328
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 329
    .line 330
    .line 331
    move-result-object v0

    .line 332
    invoke-direct {v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 333
    .line 334
    .line 335
    throw v2
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_2

    .line 336
    :goto_5
    iget-object v3, v1, Ll60;->c:Ljava/lang/Object;

    .line 337
    .line 338
    monitor-enter v3

    .line 339
    :try_start_e
    iget-object v2, v1, Ll60;->g:Lxg;

    .line 340
    .line 341
    if-eqz v2, :cond_a

    .line 342
    .line 343
    invoke-virtual {v2, v0}, Lxg;->n(Ljava/lang/Throwable;)V

    .line 344
    .line 345
    .line 346
    goto :goto_6

    .line 347
    :catchall_6
    move-exception v0

    .line 348
    goto :goto_8

    .line 349
    :cond_a
    :goto_6
    monitor-exit v3
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_6

    .line 350
    invoke-virtual {v1}, Ll60;->b()V

    .line 351
    .line 352
    .line 353
    :goto_7
    return-void

    .line 354
    :goto_8
    :try_start_f
    monitor-exit v3
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_6

    .line 355
    throw v0

    .line 356
    :goto_9
    :try_start_10
    monitor-exit v2
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_0

    .line 357
    throw v0

    .line 358
    :pswitch_8
    iget-object v0, v0, La3;->k:Ljava/lang/Object;

    .line 359
    .line 360
    check-cast v0, Lhm;

    .line 361
    .line 362
    invoke-static {v0}, Lhm;->c(Lhm;)V

    .line 363
    .line 364
    .line 365
    return-void

    .line 366
    :pswitch_9
    iget-object v0, v0, La3;->k:Ljava/lang/Object;

    .line 367
    .line 368
    check-cast v0, Lem;

    .line 369
    .line 370
    iget-object v1, v0, Lem;->k:Ljava/lang/Runnable;

    .line 371
    .line 372
    if-eqz v1, :cond_b

    .line 373
    .line 374
    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    .line 375
    .line 376
    .line 377
    iput-object v2, v0, Lem;->k:Ljava/lang/Runnable;

    .line 378
    .line 379
    :cond_b
    return-void

    .line 380
    :pswitch_a
    iget-object v0, v0, La3;->k:Ljava/lang/Object;

    .line 381
    .line 382
    check-cast v0, Le6;

    .line 383
    .line 384
    invoke-virtual {v0}, Landroid/app/Activity;->invalidateOptionsMenu()V

    .line 385
    .line 386
    .line 387
    return-void

    .line 388
    :pswitch_b
    iget-object v0, v0, La3;->k:Ljava/lang/Object;

    .line 389
    .line 390
    check-cast v0, Landroid/webkit/WebView;

    .line 391
    .line 392
    :try_start_11
    const-string v1, "actPlayPause(false);"

    .line 393
    .line 394
    invoke-virtual {v0, v1, v2}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_11} :catch_0

    .line 395
    .line 396
    .line 397
    :catch_0
    return-void

    .line 398
    :pswitch_c
    iget-object v0, v0, La3;->k:Ljava/lang/Object;

    .line 399
    .line 400
    move-object v1, v0

    .line 401
    check-cast v1, Landroid/app/Activity;

    .line 402
    .line 403
    invoke-virtual {v1}, Landroid/app/Activity;->isFinishing()Z

    .line 404
    .line 405
    .line 406
    move-result v0

    .line 407
    if-nez v0, :cond_15

    .line 408
    .line 409
    sget-object v2, Lf3;->g:Landroid/os/Handler;

    .line 410
    .line 411
    sget-object v0, Lf3;->f:Ljava/lang/reflect/Method;

    .line 412
    .line 413
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 414
    .line 415
    const/16 v6, 0x1c

    .line 416
    .line 417
    if-lt v4, v6, :cond_c

    .line 418
    .line 419
    invoke-virtual {v1}, Landroid/app/Activity;->recreate()V

    .line 420
    .line 421
    .line 422
    goto/16 :goto_e

    .line 423
    .line 424
    :cond_c
    const/16 v6, 0x1b

    .line 425
    .line 426
    const/16 v7, 0x1a

    .line 427
    .line 428
    if-eq v4, v7, :cond_d

    .line 429
    .line 430
    if-ne v4, v6, :cond_e

    .line 431
    .line 432
    :cond_d
    if-nez v0, :cond_e

    .line 433
    .line 434
    goto/16 :goto_d

    .line 435
    .line 436
    :cond_e
    sget-object v8, Lf3;->e:Ljava/lang/reflect/Method;

    .line 437
    .line 438
    if-nez v8, :cond_f

    .line 439
    .line 440
    sget-object v8, Lf3;->d:Ljava/lang/reflect/Method;

    .line 441
    .line 442
    if-nez v8, :cond_f

    .line 443
    .line 444
    goto/16 :goto_d

    .line 445
    .line 446
    :cond_f
    :try_start_12
    sget-object v8, Lf3;->c:Ljava/lang/reflect/Field;

    .line 447
    .line 448
    invoke-virtual {v8, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 449
    .line 450
    .line 451
    move-result-object v9

    .line 452
    if-nez v9, :cond_10

    .line 453
    .line 454
    goto :goto_d

    .line 455
    :cond_10
    sget-object v8, Lf3;->b:Ljava/lang/reflect/Field;

    .line 456
    .line 457
    invoke-virtual {v8, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 458
    .line 459
    .line 460
    move-result-object v8

    .line 461
    if-nez v8, :cond_11

    .line 462
    .line 463
    goto :goto_d

    .line 464
    :cond_11
    invoke-virtual {v1}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    .line 465
    .line 466
    .line 467
    move-result-object v10

    .line 468
    new-instance v11, Le3;

    .line 469
    .line 470
    invoke-direct {v11, v1}, Le3;-><init>(Landroid/app/Activity;)V

    .line 471
    .line 472
    .line 473
    invoke-virtual {v10, v11}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 474
    .line 475
    .line 476
    new-instance v12, Lb3;

    .line 477
    .line 478
    invoke-direct {v12, v11, v9}, Lb3;-><init>(Le3;Ljava/lang/Object;)V

    .line 479
    .line 480
    .line 481
    invoke-virtual {v2, v12}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_9

    .line 482
    .line 483
    .line 484
    if-eq v4, v7, :cond_13

    .line 485
    .line 486
    if-ne v4, v6, :cond_12

    .line 487
    .line 488
    goto :goto_a

    .line 489
    :cond_12
    move v3, v5

    .line 490
    :cond_13
    :goto_a
    if-eqz v3, :cond_14

    .line 491
    .line 492
    :try_start_13
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 493
    .line 494
    .line 495
    move-result-object v12

    .line 496
    sget-object v13, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_8

    .line 497
    .line 498
    const/4 v14, 0x0

    .line 499
    const/4 v15, 0x0

    .line 500
    move-object v3, v10

    .line 501
    const/4 v10, 0x0

    .line 502
    move-object v4, v11

    .line 503
    const/4 v11, 0x0

    .line 504
    move-object/from16 v16, v13

    .line 505
    .line 506
    move-object/from16 v17, v13

    .line 507
    .line 508
    :try_start_14
    filled-new-array/range {v9 .. v17}, [Ljava/lang/Object;

    .line 509
    .line 510
    .line 511
    move-result-object v5

    .line 512
    invoke-virtual {v0, v8, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 513
    .line 514
    .line 515
    goto :goto_b

    .line 516
    :catchall_7
    move-exception v0

    .line 517
    goto :goto_c

    .line 518
    :catchall_8
    move-exception v0

    .line 519
    move-object v3, v10

    .line 520
    move-object v4, v11

    .line 521
    goto :goto_c

    .line 522
    :cond_14
    move-object v3, v10

    .line 523
    move-object v4, v11

    .line 524
    invoke-virtual {v1}, Landroid/app/Activity;->recreate()V
    :try_end_14
    .catchall {:try_start_14 .. :try_end_14} :catchall_7

    .line 525
    .line 526
    .line 527
    :goto_b
    :try_start_15
    new-instance v0, Lc3;

    .line 528
    .line 529
    invoke-direct {v0, v3, v4}, Lc3;-><init>(Landroid/app/Application;Le3;)V

    .line 530
    .line 531
    .line 532
    invoke-virtual {v2, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 533
    .line 534
    .line 535
    goto :goto_e

    .line 536
    :goto_c
    new-instance v5, Lc3;

    .line 537
    .line 538
    invoke-direct {v5, v3, v4}, Lc3;-><init>(Landroid/app/Application;Le3;)V

    .line 539
    .line 540
    .line 541
    invoke-virtual {v2, v5}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 542
    .line 543
    .line 544
    throw v0
    :try_end_15
    .catchall {:try_start_15 .. :try_end_15} :catchall_9

    .line 545
    :catchall_9
    :goto_d
    invoke-virtual {v1}, Landroid/app/Activity;->recreate()V

    .line 546
    .line 547
    .line 548
    :cond_15
    :goto_e
    return-void

    .line 549
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
