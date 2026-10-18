.class public final Lcom/melodix/music/SettingsActivity;
.super Le6;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/melodix/music/SettingsActivity$a;
    }
.end annotation


# static fields
.field public static final synthetic G:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Le6;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final onCreate(Landroid/os/Bundle;)V
    .locals 3

    .line 1
    sget-boolean v0, Lcom/melodix/music/AppSingleton;->E:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const v0, 0x7f120298

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Le6;->setTheme(I)V

    .line 9
    .line 10
    .line 11
    :cond_0
    invoke-super {p0, p1}, Landroidx/activity/a;->onCreate(Landroid/os/Bundle;)V

    .line 12
    .line 13
    .line 14
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 15
    .line 16
    const/16 v1, 0x1d

    .line 17
    .line 18
    if-lt v0, v1, :cond_1

    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-static {v0}, Le1;->k(Landroid/view/Window;)V

    .line 25
    .line 26
    .line 27
    :cond_1
    const v0, 0x7f0c0090

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, v0}, Le6;->setContentView(I)V

    .line 31
    .line 32
    .line 33
    if-nez p1, :cond_2

    .line 34
    .line 35
    invoke-virtual {p0}, Le6;->l()Lz70;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    new-instance p1, Ltf;

    .line 40
    .line 41
    invoke-direct {p1, p0}, Ltf;-><init>(Lz70;)V

    .line 42
    .line 43
    .line 44
    new-instance p0, Lcom/melodix/music/SettingsActivity$a;

    .line 45
    .line 46
    invoke-direct {p0}, Lcom/melodix/music/SettingsActivity$a;-><init>()V

    .line 47
    .line 48
    .line 49
    const v0, 0x7f0901b5

    .line 50
    .line 51
    .line 52
    const/4 v1, 0x2

    .line 53
    const/4 v2, 0x0

    .line 54
    invoke-virtual {p1, v0, p0, v2, v1}, Ltf;->e(ILh70;Ljava/lang/String;I)V

    .line 55
    .line 56
    .line 57
    const/4 p0, 0x0

    .line 58
    invoke-virtual {p1, p0}, Ltf;->d(Z)I

    .line 59
    .line 60
    .line 61
    :cond_2
    return-void
.end method

.method public final onPause()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroidx/activity/a;->onPause()V

    .line 2
    .line 3
    .line 4
    invoke-static {p0}, Lju0;->a(Landroid/content/Context;)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-interface {v0, p0}, Landroid/content/SharedPreferences;->unregisterOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final onResume()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroidx/activity/a;->onResume()V

    .line 2
    .line 3
    .line 4
    invoke-static {p0}, Lju0;->a(Landroid/content/Context;)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-interface {v0, p0}, Landroid/content/SharedPreferences;->registerOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final onSharedPreferenceChanged(Landroid/content/SharedPreferences;Ljava/lang/String;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    if-nez p2, :cond_0

    .line 5
    .line 6
    goto/16 :goto_9

    .line 7
    .line 8
    :cond_0
    invoke-virtual {p2}, Ljava/lang/String;->hashCode()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const-string v1, "0"

    .line 13
    .line 14
    const/4 v2, 0x1

    .line 15
    const/4 v3, 0x0

    .line 16
    sparse-switch v0, :sswitch_data_0

    .line 17
    .line 18
    .line 19
    goto/16 :goto_9

    .line 20
    .line 21
    :sswitch_0
    const-string p0, "GuiMode"

    .line 22
    .line 23
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-nez p0, :cond_1

    .line 28
    .line 29
    goto/16 :goto_9

    .line 30
    .line 31
    :cond_1
    sget p0, Lcom/melodix/music/AppSingleton;->j:I

    .line 32
    .line 33
    const-string p0, "csshack"

    .line 34
    .line 35
    invoke-interface {p1, p2, p0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    sput-object p0, Lcom/melodix/music/AppSingleton;->z:Ljava/lang/String;

    .line 40
    .line 41
    sput-boolean v2, Lcom/melodix/music/MainActivity;->k0:Z

    .line 42
    .line 43
    return-void

    .line 44
    :sswitch_1
    const-string v0, "Amoled"

    .line 45
    .line 46
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-nez v0, :cond_2

    .line 51
    .line 52
    goto/16 :goto_9

    .line 53
    .line 54
    :cond_2
    sget v0, Lcom/melodix/music/AppSingleton;->j:I

    .line 55
    .line 56
    invoke-interface {p1, p2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    sput-boolean p1, Lcom/melodix/music/AppSingleton;->E:Z

    .line 61
    .line 62
    sget p1, Lcom/melodix/music/AppSingleton;->j:I

    .line 63
    .line 64
    invoke-static {}, Lm9;->l()V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0}, Landroid/app/Activity;->recreate()V

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :sswitch_2
    const-string p0, "AaButtonOrder"

    .line 72
    .line 73
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    move-result p0

    .line 77
    if-nez p0, :cond_3

    .line 78
    .line 79
    goto/16 :goto_9

    .line 80
    .line 81
    :cond_3
    sget p0, Lcom/melodix/music/AppSingleton;->j:I

    .line 82
    .line 83
    const-string p0, "PLAY,PREV,NEXT,FAV,REPEAT,SHUFFLE"

    .line 84
    .line 85
    invoke-interface {p1, p2, p0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    if-nez p1, :cond_4

    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_4
    move-object p0, p1

    .line 93
    :goto_0
    sput-object p0, Lcom/melodix/music/AppSingleton;->G:Ljava/lang/String;

    .line 94
    .line 95
    sget-boolean p0, Lcom/melodix/music/WebService;->r:Z

    .line 96
    .line 97
    invoke-static {v3}, Lzi1;->b(Z)V

    .line 98
    .line 99
    .line 100
    return-void

    .line 101
    :sswitch_3
    const-string p0, "AdBlockListUrl"

    .line 102
    .line 103
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    move-result p0

    .line 107
    if-nez p0, :cond_5

    .line 108
    .line 109
    goto/16 :goto_9

    .line 110
    .line 111
    :cond_5
    sget p0, Lcom/melodix/music/AppSingleton;->j:I

    .line 112
    .line 113
    const-string p0, "https://raw.githubusercontent.com/Souxch06/Melodix/main/Melodix-v1.2.2-3d2c473/assets/adblock_hosts.txt"

    .line 114
    .line 115
    invoke-interface {p1, p2, p0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    if-nez p1, :cond_6

    .line 120
    .line 121
    goto :goto_1

    .line 122
    :cond_6
    move-object p0, p1

    .line 123
    :goto_1
    sput-object p0, Lcom/melodix/music/AppSingleton;->a0:Ljava/lang/String;

    .line 124
    .line 125
    return-void

    .line 126
    :sswitch_4
    const-string v0, "ServiceOn"

    .line 127
    .line 128
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 129
    .line 130
    .line 131
    move-result v0

    .line 132
    if-nez v0, :cond_7

    .line 133
    .line 134
    goto/16 :goto_9

    .line 135
    .line 136
    :cond_7
    sget v0, Lcom/melodix/music/AppSingleton;->j:I

    .line 137
    .line 138
    invoke-interface {p1, p2, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 139
    .line 140
    .line 141
    move-result p1

    .line 142
    sput-boolean p1, Lcom/melodix/music/AppSingleton;->A:Z

    .line 143
    .line 144
    new-instance p1, Landroid/content/Intent;

    .line 145
    .line 146
    sget p2, Lcom/melodix/music/AppSingleton;->j:I

    .line 147
    .line 148
    invoke-static {}, Lm9;->c()Landroid/content/Context;

    .line 149
    .line 150
    .line 151
    move-result-object p2

    .line 152
    const-class v0, Lcom/melodix/music/WebService;

    .line 153
    .line 154
    invoke-direct {p1, p2, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 155
    .line 156
    .line 157
    sget-boolean p2, Lcom/melodix/music/AppSingleton;->A:Z

    .line 158
    .line 159
    if-eqz p2, :cond_9

    .line 160
    .line 161
    sget p2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 162
    .line 163
    const/16 v0, 0x1a

    .line 164
    .line 165
    if-lt p2, v0, :cond_8

    .line 166
    .line 167
    invoke-static {p0, p1}, Li1;->v(Lcom/melodix/music/SettingsActivity;Landroid/content/Intent;)V

    .line 168
    .line 169
    .line 170
    goto :goto_2

    .line 171
    :cond_8
    invoke-virtual {p0, p1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 172
    .line 173
    .line 174
    :goto_2
    sget-object p0, Lcom/melodix/music/AppSingleton;->t:Ljava/lang/ref/WeakReference;

    .line 175
    .line 176
    if-eqz p0, :cond_a

    .line 177
    .line 178
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 179
    .line 180
    .line 181
    move-result-object p0

    .line 182
    check-cast p0, Lcom/melodix/music/MainActivity;

    .line 183
    .line 184
    if-eqz p0, :cond_a

    .line 185
    .line 186
    new-instance p1, Ls4;

    .line 187
    .line 188
    const/16 p2, 0xd

    .line 189
    .line 190
    invoke-direct {p1, p0, p2}, Ls4;-><init>(Lcom/melodix/music/MainActivity;I)V

    .line 191
    .line 192
    .line 193
    invoke-virtual {p0, p1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 194
    .line 195
    .line 196
    goto :goto_3

    .line 197
    :cond_9
    invoke-virtual {p0, p1}, Landroid/content/Context;->stopService(Landroid/content/Intent;)Z

    .line 198
    .line 199
    .line 200
    :cond_a
    :goto_3
    invoke-static {}, Lm9;->k()V

    .line 201
    .line 202
    .line 203
    return-void

    .line 204
    :sswitch_5
    const-string p0, "ProxyType"

    .line 205
    .line 206
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 207
    .line 208
    .line 209
    move-result p0

    .line 210
    if-nez p0, :cond_b

    .line 211
    .line 212
    goto/16 :goto_9

    .line 213
    .line 214
    :cond_b
    sget p0, Lcom/melodix/music/AppSingleton;->j:I

    .line 215
    .line 216
    const-string p0, "none"

    .line 217
    .line 218
    invoke-interface {p1, p2, p0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 219
    .line 220
    .line 221
    move-result-object p1

    .line 222
    if-nez p1, :cond_c

    .line 223
    .line 224
    goto :goto_4

    .line 225
    :cond_c
    move-object p0, p1

    .line 226
    :goto_4
    sput-object p0, Lcom/melodix/music/AppSingleton;->c0:Ljava/lang/String;

    .line 227
    .line 228
    return-void

    .line 229
    :sswitch_6
    const-string p0, "ProxyPort"

    .line 230
    .line 231
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 232
    .line 233
    .line 234
    move-result p0

    .line 235
    if-nez p0, :cond_d

    .line 236
    .line 237
    goto/16 :goto_9

    .line 238
    .line 239
    :cond_d
    sget p0, Lcom/melodix/music/AppSingleton;->j:I

    .line 240
    .line 241
    invoke-interface {p1, p2, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 242
    .line 243
    .line 244
    move-result-object p0

    .line 245
    if-eqz p0, :cond_e

    .line 246
    .line 247
    invoke-static {p0}, Lka1;->r(Ljava/lang/String;)Ljava/lang/Integer;

    .line 248
    .line 249
    .line 250
    move-result-object p0

    .line 251
    if-eqz p0, :cond_e

    .line 252
    .line 253
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 254
    .line 255
    .line 256
    move-result v3

    .line 257
    :cond_e
    sput v3, Lcom/melodix/music/AppSingleton;->e0:I

    .line 258
    .line 259
    return-void

    .line 260
    :sswitch_7
    const-string p0, "ProxyHost"

    .line 261
    .line 262
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 263
    .line 264
    .line 265
    move-result p0

    .line 266
    if-nez p0, :cond_f

    .line 267
    .line 268
    goto/16 :goto_9

    .line 269
    .line 270
    :cond_f
    sget p0, Lcom/melodix/music/AppSingleton;->j:I

    .line 271
    .line 272
    const-string p0, ""

    .line 273
    .line 274
    invoke-interface {p1, p2, p0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 275
    .line 276
    .line 277
    move-result-object p1

    .line 278
    if-nez p1, :cond_10

    .line 279
    .line 280
    goto :goto_5

    .line 281
    :cond_10
    move-object p0, p1

    .line 282
    :goto_5
    sput-object p0, Lcom/melodix/music/AppSingleton;->d0:Ljava/lang/String;

    .line 283
    .line 284
    return-void

    .line 285
    :sswitch_8
    const-string p0, "AutoShut"

    .line 286
    .line 287
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 288
    .line 289
    .line 290
    move-result p0

    .line 291
    if-nez p0, :cond_11

    .line 292
    .line 293
    goto/16 :goto_9

    .line 294
    .line 295
    :cond_11
    sget p0, Lcom/melodix/music/AppSingleton;->j:I

    .line 296
    .line 297
    invoke-interface {p1, p2, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 298
    .line 299
    .line 300
    move-result-object p0

    .line 301
    if-eqz p0, :cond_12

    .line 302
    .line 303
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 304
    .line 305
    .line 306
    move-result p0

    .line 307
    goto :goto_6

    .line 308
    :cond_12
    move p0, v3

    .line 309
    :goto_6
    sput p0, Lcom/melodix/music/AppSingleton;->P:I

    .line 310
    .line 311
    sget p0, Lcom/melodix/music/AppSingleton;->j:I

    .line 312
    .line 313
    invoke-static {v2, v3}, Lm9;->m(IZ)V

    .line 314
    .line 315
    .line 316
    return-void

    .line 317
    :sswitch_9
    const-string p0, "ForceEn"

    .line 318
    .line 319
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 320
    .line 321
    .line 322
    move-result p0

    .line 323
    if-nez p0, :cond_13

    .line 324
    .line 325
    goto/16 :goto_9

    .line 326
    .line 327
    :cond_13
    sget p0, Lcom/melodix/music/AppSingleton;->j:I

    .line 328
    .line 329
    invoke-interface {p1, p2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 330
    .line 331
    .line 332
    move-result p0

    .line 333
    sput-boolean p0, Lcom/melodix/music/AppSingleton;->K:Z

    .line 334
    .line 335
    sput-boolean v2, Lcom/melodix/music/MainActivity;->k0:Z

    .line 336
    .line 337
    return-void

    .line 338
    :sswitch_a
    const-string p0, "CloseNowPlay"

    .line 339
    .line 340
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 341
    .line 342
    .line 343
    move-result p0

    .line 344
    if-nez p0, :cond_14

    .line 345
    .line 346
    goto/16 :goto_9

    .line 347
    .line 348
    :cond_14
    sget p0, Lcom/melodix/music/AppSingleton;->j:I

    .line 349
    .line 350
    invoke-interface {p1, p2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 351
    .line 352
    .line 353
    move-result p0

    .line 354
    sput-boolean p0, Lcom/melodix/music/AppSingleton;->D:Z

    .line 355
    .line 356
    sget p0, Lcom/melodix/music/AppSingleton;->j:I

    .line 357
    .line 358
    invoke-static {}, Lm9;->l()V

    .line 359
    .line 360
    .line 361
    return-void

    .line 362
    :sswitch_b
    const-string p0, "ExpandedFullScreen"

    .line 363
    .line 364
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 365
    .line 366
    .line 367
    move-result p0

    .line 368
    if-nez p0, :cond_15

    .line 369
    .line 370
    goto/16 :goto_9

    .line 371
    .line 372
    :cond_15
    sget p0, Lcom/melodix/music/AppSingleton;->j:I

    .line 373
    .line 374
    invoke-interface {p1, p2, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 375
    .line 376
    .line 377
    move-result p0

    .line 378
    sput-boolean p0, Lcom/melodix/music/AppSingleton;->R:Z

    .line 379
    .line 380
    sget p0, Lcom/melodix/music/AppSingleton;->j:I

    .line 381
    .line 382
    invoke-static {}, Lm9;->l()V

    .line 383
    .line 384
    .line 385
    return-void

    .line 386
    :sswitch_c
    const-string p0, "AndAuto"

    .line 387
    .line 388
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 389
    .line 390
    .line 391
    move-result p0

    .line 392
    if-nez p0, :cond_16

    .line 393
    .line 394
    goto/16 :goto_9

    .line 395
    .line 396
    :cond_16
    sget p0, Lcom/melodix/music/AppSingleton;->j:I

    .line 397
    .line 398
    invoke-interface {p1, p2, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 399
    .line 400
    .line 401
    move-result p0

    .line 402
    sput-boolean p0, Lcom/melodix/music/AppSingleton;->F:Z

    .line 403
    .line 404
    return-void

    .line 405
    :sswitch_d
    const-string p0, "KeepScreenOn"

    .line 406
    .line 407
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 408
    .line 409
    .line 410
    move-result p0

    .line 411
    if-nez p0, :cond_17

    .line 412
    .line 413
    goto/16 :goto_9

    .line 414
    .line 415
    :cond_17
    sget p0, Lcom/melodix/music/AppSingleton;->j:I

    .line 416
    .line 417
    invoke-interface {p1, p2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 418
    .line 419
    .line 420
    move-result p0

    .line 421
    sput-boolean p0, Lcom/melodix/music/AppSingleton;->J:Z

    .line 422
    .line 423
    sget-object p0, Lcom/melodix/music/AppSingleton;->t:Ljava/lang/ref/WeakReference;

    .line 424
    .line 425
    if-eqz p0, :cond_28

    .line 426
    .line 427
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 428
    .line 429
    .line 430
    move-result-object p0

    .line 431
    check-cast p0, Lcom/melodix/music/MainActivity;

    .line 432
    .line 433
    if-eqz p0, :cond_28

    .line 434
    .line 435
    new-instance p1, Ls4;

    .line 436
    .line 437
    const/4 p2, 0x7

    .line 438
    invoke-direct {p1, p0, p2}, Ls4;-><init>(Lcom/melodix/music/MainActivity;I)V

    .line 439
    .line 440
    .line 441
    invoke-virtual {p0, p1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 442
    .line 443
    .line 444
    return-void

    .line 445
    :sswitch_e
    const-string p0, "APlayMode"

    .line 446
    .line 447
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 448
    .line 449
    .line 450
    move-result p0

    .line 451
    if-nez p0, :cond_18

    .line 452
    .line 453
    goto/16 :goto_9

    .line 454
    .line 455
    :cond_18
    sget p0, Lcom/melodix/music/AppSingleton;->j:I

    .line 456
    .line 457
    const-string p0, "disabled"

    .line 458
    .line 459
    invoke-interface {p1, p2, p0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 460
    .line 461
    .line 462
    move-result-object p0

    .line 463
    sput-object p0, Lcom/melodix/music/AppSingleton;->y:Ljava/lang/String;

    .line 464
    .line 465
    sget p0, Lcom/melodix/music/AppSingleton;->j:I

    .line 466
    .line 467
    invoke-static {}, Lm9;->l()V

    .line 468
    .line 469
    .line 470
    return-void

    .line 471
    :sswitch_f
    const-string p0, "ForcePortrait"

    .line 472
    .line 473
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 474
    .line 475
    .line 476
    move-result p0

    .line 477
    if-nez p0, :cond_19

    .line 478
    .line 479
    goto/16 :goto_9

    .line 480
    .line 481
    :cond_19
    sget p0, Lcom/melodix/music/AppSingleton;->j:I

    .line 482
    .line 483
    invoke-interface {p1, p2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 484
    .line 485
    .line 486
    move-result p0

    .line 487
    sput-boolean p0, Lcom/melodix/music/AppSingleton;->I:Z

    .line 488
    .line 489
    return-void

    .line 490
    :sswitch_10
    const-string p0, "HPAS"

    .line 491
    .line 492
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 493
    .line 494
    .line 495
    move-result p0

    .line 496
    if-nez p0, :cond_1a

    .line 497
    .line 498
    goto/16 :goto_9

    .line 499
    .line 500
    :cond_1a
    sget p0, Lcom/melodix/music/AppSingleton;->j:I

    .line 501
    .line 502
    invoke-interface {p1, p2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 503
    .line 504
    .line 505
    move-result p0

    .line 506
    sput-boolean p0, Lcom/melodix/music/AppSingleton;->M:Z

    .line 507
    .line 508
    return-void

    .line 509
    :sswitch_11
    const-string p0, "HPAP"

    .line 510
    .line 511
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 512
    .line 513
    .line 514
    move-result p0

    .line 515
    if-nez p0, :cond_1b

    .line 516
    .line 517
    goto/16 :goto_9

    .line 518
    .line 519
    :cond_1b
    sget p0, Lcom/melodix/music/AppSingleton;->j:I

    .line 520
    .line 521
    invoke-interface {p1, p2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 522
    .line 523
    .line 524
    move-result p0

    .line 525
    sput-boolean p0, Lcom/melodix/music/AppSingleton;->L:Z

    .line 526
    .line 527
    return-void

    .line 528
    :sswitch_12
    const-string p0, "BTAS"

    .line 529
    .line 530
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 531
    .line 532
    .line 533
    move-result p0

    .line 534
    if-nez p0, :cond_1c

    .line 535
    .line 536
    goto/16 :goto_9

    .line 537
    .line 538
    :cond_1c
    sget p0, Lcom/melodix/music/AppSingleton;->j:I

    .line 539
    .line 540
    invoke-interface {p1, p2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 541
    .line 542
    .line 543
    move-result p0

    .line 544
    sput-boolean p0, Lcom/melodix/music/AppSingleton;->O:Z

    .line 545
    .line 546
    return-void

    .line 547
    :sswitch_13
    const-string p0, "BTAP"

    .line 548
    .line 549
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 550
    .line 551
    .line 552
    move-result p0

    .line 553
    if-nez p0, :cond_1d

    .line 554
    .line 555
    goto/16 :goto_9

    .line 556
    .line 557
    :cond_1d
    sget p0, Lcom/melodix/music/AppSingleton;->j:I

    .line 558
    .line 559
    invoke-interface {p1, p2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 560
    .line 561
    .line 562
    move-result p0

    .line 563
    sput-boolean p0, Lcom/melodix/music/AppSingleton;->N:Z

    .line 564
    .line 565
    return-void

    .line 566
    :sswitch_14
    const-string p0, "TakeControl"

    .line 567
    .line 568
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 569
    .line 570
    .line 571
    move-result p0

    .line 572
    if-nez p0, :cond_1e

    .line 573
    .line 574
    goto/16 :goto_9

    .line 575
    .line 576
    :cond_1e
    sget p0, Lcom/melodix/music/AppSingleton;->j:I

    .line 577
    .line 578
    invoke-interface {p1, p2, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 579
    .line 580
    .line 581
    move-result p0

    .line 582
    sput-boolean p0, Lcom/melodix/music/AppSingleton;->C:Z

    .line 583
    .line 584
    sget p0, Lcom/melodix/music/AppSingleton;->j:I

    .line 585
    .line 586
    invoke-static {}, Lm9;->l()V

    .line 587
    .line 588
    .line 589
    return-void

    .line 590
    :sswitch_15
    const-string p0, "AdBlockMode"

    .line 591
    .line 592
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 593
    .line 594
    .line 595
    move-result p0

    .line 596
    if-nez p0, :cond_1f

    .line 597
    .line 598
    goto/16 :goto_9

    .line 599
    .line 600
    :cond_1f
    sget p0, Lcom/melodix/music/AppSingleton;->j:I

    .line 601
    .line 602
    const-string p0, "legacy"

    .line 603
    .line 604
    invoke-interface {p1, p2, p0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 605
    .line 606
    .line 607
    move-result-object p1

    .line 608
    if-nez p1, :cond_20

    .line 609
    .line 610
    goto :goto_7

    .line 611
    :cond_20
    move-object p0, p1

    .line 612
    :goto_7
    sput-object p0, Lcom/melodix/music/AppSingleton;->X:Ljava/lang/String;

    .line 613
    .line 614
    sput-boolean v2, Lcom/melodix/music/MainActivity;->k0:Z

    .line 615
    .line 616
    return-void

    .line 617
    :sswitch_16
    const-string p0, "DisableCanvas"

    .line 618
    .line 619
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 620
    .line 621
    .line 622
    move-result p0

    .line 623
    if-nez p0, :cond_21

    .line 624
    .line 625
    goto/16 :goto_9

    .line 626
    .line 627
    :cond_21
    sget p0, Lcom/melodix/music/AppSingleton;->j:I

    .line 628
    .line 629
    invoke-interface {p1, p2, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 630
    .line 631
    .line 632
    move-result p0

    .line 633
    sput-boolean p0, Lcom/melodix/music/AppSingleton;->Q:Z

    .line 634
    .line 635
    sget p0, Lcom/melodix/music/AppSingleton;->j:I

    .line 636
    .line 637
    invoke-static {}, Lm9;->l()V

    .line 638
    .line 639
    .line 640
    return-void

    .line 641
    :sswitch_17
    const-string p0, "DockLeftSidebar"

    .line 642
    .line 643
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 644
    .line 645
    .line 646
    move-result p0

    .line 647
    if-nez p0, :cond_22

    .line 648
    .line 649
    goto/16 :goto_9

    .line 650
    .line 651
    :cond_22
    sget p0, Lcom/melodix/music/AppSingleton;->j:I

    .line 652
    .line 653
    invoke-interface {p1, p2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 654
    .line 655
    .line 656
    move-result p0

    .line 657
    sput-boolean p0, Lcom/melodix/music/AppSingleton;->S:Z

    .line 658
    .line 659
    sget p0, Lcom/melodix/music/AppSingleton;->j:I

    .line 660
    .line 661
    invoke-static {}, Lm9;->l()V

    .line 662
    .line 663
    .line 664
    return-void

    .line 665
    :sswitch_18
    const-string p0, "AutoSleep"

    .line 666
    .line 667
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 668
    .line 669
    .line 670
    move-result p0

    .line 671
    if-nez p0, :cond_23

    .line 672
    .line 673
    goto :goto_9

    .line 674
    :cond_23
    sget p0, Lcom/melodix/music/AppSingleton;->j:I

    .line 675
    .line 676
    invoke-interface {p1, p2, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 677
    .line 678
    .line 679
    move-result-object p0

    .line 680
    if-eqz p0, :cond_24

    .line 681
    .line 682
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 683
    .line 684
    .line 685
    move-result p0

    .line 686
    goto :goto_8

    .line 687
    :cond_24
    move p0, v3

    .line 688
    :goto_8
    sput p0, Lcom/melodix/music/AppSingleton;->j:I

    .line 689
    .line 690
    sget p0, Lcom/melodix/music/AppSingleton;->j:I

    .line 691
    .line 692
    invoke-static {v2, v3}, Lm9;->m(IZ)V

    .line 693
    .line 694
    .line 695
    return-void

    .line 696
    :sswitch_19
    const-string p0, "SwipeStop"

    .line 697
    .line 698
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 699
    .line 700
    .line 701
    move-result p0

    .line 702
    if-nez p0, :cond_25

    .line 703
    .line 704
    goto :goto_9

    .line 705
    :cond_25
    sget p0, Lcom/melodix/music/AppSingleton;->j:I

    .line 706
    .line 707
    invoke-interface {p1, p2, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 708
    .line 709
    .line 710
    move-result p0

    .line 711
    sput-boolean p0, Lcom/melodix/music/AppSingleton;->H:Z

    .line 712
    .line 713
    return-void

    .line 714
    :sswitch_1a
    const-string p0, "PrioritizeLocalAssets"

    .line 715
    .line 716
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 717
    .line 718
    .line 719
    move-result p0

    .line 720
    if-nez p0, :cond_26

    .line 721
    .line 722
    goto :goto_9

    .line 723
    :cond_26
    sget p0, Lcom/melodix/music/AppSingleton;->j:I

    .line 724
    .line 725
    invoke-interface {p1, p2, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 726
    .line 727
    .line 728
    move-result p0

    .line 729
    sput-boolean p0, Lcom/melodix/music/AppSingleton;->W:Z

    .line 730
    .line 731
    sput-boolean v2, Lcom/melodix/music/MainActivity;->k0:Z

    .line 732
    .line 733
    return-void

    .line 734
    :sswitch_1b
    const-string p0, "HideStatusBar"

    .line 735
    .line 736
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 737
    .line 738
    .line 739
    move-result p0

    .line 740
    if-nez p0, :cond_27

    .line 741
    .line 742
    goto :goto_9

    .line 743
    :cond_27
    sget p0, Lcom/melodix/music/AppSingleton;->j:I

    .line 744
    .line 745
    invoke-interface {p1, p2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 746
    .line 747
    .line 748
    move-result p0

    .line 749
    sput-boolean p0, Lcom/melodix/music/AppSingleton;->T:Z

    .line 750
    .line 751
    sget-object p0, Lcom/melodix/music/AppSingleton;->t:Ljava/lang/ref/WeakReference;

    .line 752
    .line 753
    if-eqz p0, :cond_28

    .line 754
    .line 755
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 756
    .line 757
    .line 758
    move-result-object p0

    .line 759
    check-cast p0, Lcom/melodix/music/MainActivity;

    .line 760
    .line 761
    if-eqz p0, :cond_28

    .line 762
    .line 763
    new-instance p1, Ls4;

    .line 764
    .line 765
    const/16 p2, 0xe

    .line 766
    .line 767
    invoke-direct {p1, p0, p2}, Ls4;-><init>(Lcom/melodix/music/MainActivity;I)V

    .line 768
    .line 769
    .line 770
    invoke-virtual {p0, p1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 771
    .line 772
    .line 773
    :cond_28
    :goto_9
    return-void

    .line 774
    nop

    .line 775
    :sswitch_data_0
    .sparse-switch
        -0x3cecec81 -> :sswitch_1b
        -0x3b7e3691 -> :sswitch_1a
        -0x2ce051c4 -> :sswitch_19
        -0x263549b8 -> :sswitch_18
        -0x24f3d2fe -> :sswitch_17
        -0x1edf19c0 -> :sswitch_16
        -0x19cee933 -> :sswitch_15
        -0x4c0654a -> :sswitch_14
        0x1f4401 -> :sswitch_13
        0x1f4404 -> :sswitch_12
        0x21ef37 -> :sswitch_11
        0x21ef3a -> :sswitch_10
        0x26abf86 -> :sswitch_f
        0x19331258 -> :sswitch_e
        0x2981ee30 -> :sswitch_d
        0x2fcaa006 -> :sswitch_c
        0x3893d994 -> :sswitch_b
        0x38a93632 -> :sswitch_a
        0x3ad31cd4 -> :sswitch_9
        0x599b2223 -> :sswitch_8
        0x5b0d6d16 -> :sswitch_7
        0x5b110fef -> :sswitch_6
        0x5b1306a8 -> :sswitch_5
        0x6bdf1754 -> :sswitch_4
        0x6c448a87 -> :sswitch_3
        0x733d16dc -> :sswitch_2
        0x751f1988 -> :sswitch_1
        0x796dc15e -> :sswitch_0
    .end sparse-switch
.end method
