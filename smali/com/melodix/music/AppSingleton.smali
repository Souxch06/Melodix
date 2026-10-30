.class public final Lcom/melodix/music/AppSingleton;
.super Landroid/app/Application;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static A:Z = false

.field public static B:Z = false

.field public static C:Z = false

.field public static D:Z = false

.field public static E:Z = false

.field public static F:Z = false

.field public static G:Ljava/lang/String; = null

.field public static H:Z = false

.field public static I:Z = false

.field public static J:Z = false

.field public static K:Z = false

.field public static L:Z = false

.field public static M:Z = false

.field public static N:Z = false

.field public static O:Z = false

.field public static P:I = 0x0

.field public static Q:Z = false

.field public static R:Z = false

.field public static S:Z = false

.field public static T:Z = false

.field public static U:I = 0x0

.field public static V:Z = false

.field public static W:Z = false

.field public static X:Ljava/lang/String; = null

.field public static final Y:Ljava/util/concurrent/ConcurrentHashMap$KeySetView;

.field public static Z:Ln3; = null

.field public static a0:Ljava/lang/String; = null

.field public static b0:Ljava/lang/String; = null

.field public static c0:Ljava/lang/String; = null

.field public static d0:Ljava/lang/String; = null

.field public static e0:I = 0x0

.field public static final f0:Ljava/util/concurrent/ConcurrentHashMap;

# Diagnostic source of the current/last WebView factory attempt (null = none).
# Written by the factory paths and read by the diagnostic helper; declaring it
# is what keeps "sput-object ...->g0" from throwing NoSuchFieldError.
.field public static g0:Ljava/lang/String; = null

.field public static j:I = 0x0

.field public static k:I = 0x0

.field public static l:Z = false

.field public static m:Z = false

.field public static n:I = -0x1

.field public static final o:Landroid/os/Handler;

.field public static final p:Landroid/os/Handler;

.field public static q:Lx3;

.field public static r:Lx3;

.field public static s:Landroid/content/Context;

.field public static t:Ljava/lang/ref/WeakReference;

.field public static u:Landroid/content/SharedPreferences;

.field public static v:Landroid/content/SharedPreferences$Editor;

.field public static w:Ll9;

.field public static x:Landroid/content/MutableContextWrapper;

.field public static y:Ljava/lang/String;

.field public static z:Ljava/lang/String;

# P0 startup watchdog: true once the startup is visually resolved (native
# shell takeover or the web reveal). The watchdog thread reports a startup
# still unresolved after 25s with the main-thread stack.
.field public static volatile startupDone:Z = false

# Derniers evenements du pipeline natif (ecrans/payloads), affiches dans le
# visualiseur de diagnostic pour qu'un screenshot tranche tout.
.field public static diagNative:Ljava/lang/String; = null


# direct methods
.method protected attachBaseContext(Landroid/content/Context;)V
    .locals 1

    # P0 diagnostics: earliest app code point. Install the crash recorder
    # before any provider or activity can run, then arm the startup-hang
    # watchdog. A broken diagnostic must never abort the startup.
    invoke-super {p0, p1}, Landroid/app/Application;->attachBaseContext(Landroid/content/Context;)V

    :try_start_0
    invoke-static {p1}, Lcom/melodix/music/NativeCrashGuard;->install(Landroid/content/Context;)V

    const-string v0, "attach"

    invoke-static {v0}, Lcom/melodix/music/NativeCrashGuard;->stage(Ljava/lang/String;)V

    invoke-static {}, Lcom/melodix/music/StartupHangWatchdog;->arm()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method

.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Landroid/os/Handler;

    .line 2
    .line 3
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/melodix/music/AppSingleton;->o:Landroid/os/Handler;

    .line 11
    .line 12
    new-instance v0, Landroid/os/Handler;

    .line 13
    .line 14
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 19
    .line 20
    .line 21
    sput-object v0, Lcom/melodix/music/AppSingleton;->p:Landroid/os/Handler;

    .line 22
    .line 23
    const-string v0, "PLAY,PREV,NEXT,FAV,REPEAT,SHUFFLE"

    .line 24
    .line 25
    sput-object v0, Lcom/melodix/music/AppSingleton;->G:Ljava/lang/String;

    .line 26
    .line 27
    const/4 v0, 0x1

    .line 28
    sput-boolean v0, Lcom/melodix/music/AppSingleton;->W:Z

    .line 29
    .line 30
    const-string v0, "legacy"

    .line 31
    .line 32
    sput-object v0, Lcom/melodix/music/AppSingleton;->X:Ljava/lang/String;

    .line 33
    .line 34
    invoke-static {}, Ljava/util/concurrent/ConcurrentHashMap;->newKeySet()Ljava/util/concurrent/ConcurrentHashMap$KeySetView;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    sput-object v0, Lcom/melodix/music/AppSingleton;->Y:Ljava/util/concurrent/ConcurrentHashMap$KeySetView;

    .line 39
    .line 40
    const-string v0, "https://raw.githubusercontent.com/Souxch06/Melodix/main/Melodix-v1.2.2-3d2c473/assets/adblock_hosts.txt"

    .line 41
    .line 42
    sput-object v0, Lcom/melodix/music/AppSingleton;->a0:Ljava/lang/String;

    .line 43
    .line 44
    const-string v0, ""

    .line 45
    .line 46
    sput-object v0, Lcom/melodix/music/AppSingleton;->b0:Ljava/lang/String;

    .line 47
    .line 48
    const-string v1, "none"

    .line 49
    .line 50
    sput-object v1, Lcom/melodix/music/AppSingleton;->c0:Ljava/lang/String;

    .line 51
    .line 52
    sput-object v0, Lcom/melodix/music/AppSingleton;->d0:Ljava/lang/String;

    .line 53
    .line 54
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    .line 55
    .line 56
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 57
    .line 58
    .line 59
    sput-object v0, Lcom/melodix/music/AppSingleton;->f0:Ljava/util/concurrent/ConcurrentHashMap;

    .line 60
    .line 61
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/app/Application;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final onCreate()V
    .locals 13

    .line 1
    invoke-super {p0}, Landroid/app/Application;->onCreate()V

    # Install the crash recorder as early as possible: a failure while the
    # application itself starts up must be readable on the next launch too.
    # Wrapped so a broken diagnostic class can never be the reason the app dies.
    :try_start_guard
    invoke-static/range {p0 .. p0}, Lcom/melodix/music/NativeCrashGuard;->install(Landroid/content/Context;)V

    const-string v1, "application"

    invoke-static/range {v1 .. v1}, Lcom/melodix/music/NativeCrashGuard;->stage(Ljava/lang/String;)V
    :try_end_guard
    .catch Ljava/lang/Throwable; {:try_start_guard .. :try_end_guard} :catch_guard

    goto :guard_done

    :catch_guard
    move-exception v0

    :guard_done

    # Auto-mise a jour : verification silencieuse en arriere-plan, jamais
    # sur le chemin critique du demarrage.
    :try_start_updater
    invoke-static {p0}, Lcom/melodix/music/SelfUpdater;->check(Landroid/content/Context;)V
    :try_end_updater
    .catch Ljava/lang/Throwable; {:try_start_updater .. :try_end_updater} :catch_updater

    goto :updater_done

    :catch_updater
    move-exception v0

    :updater_done

    .line 2
    .line 3
    .line 4
    const-string v0, "java.net.preferIPv4Stack"

    .line 5
    .line 6
    const-string v1, "true"

    .line 7
    .line 8
    invoke-static {v0, v1}, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    const-string v0, "java.net.preferIPv6Addresses"

    .line 12
    .line 13
    const-string v1, "false"

    .line 14
    .line 15
    invoke-static {v0, v1}, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 23
    .line 24
    .line 25
    sput-object v0, Lcom/melodix/music/AppSingleton;->s:Landroid/content/Context;

    .line 26
    .line 27
    :try_start_0
    new-instance v0, Lcom/melodix/music/AndBridge;

    .line 28
    .line 29
    invoke-direct {v0, p0}, Lcom/melodix/music/AndBridge;-><init>(Landroid/content/Context;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0}, Lcom/melodix/music/AndBridge;->isSignatureValid()Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    sget-object v1, Lu30;->k:Ljava/lang/Object;

    .line 39
    .line 40
    monitor-enter v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 41
    :try_start_1
    new-instance v0, Ljava/util/ArrayList;

    .line 42
    .line 43
    sget-object v2, Lu30;->l:Lda;

    .line 44
    .line 45
    invoke-virtual {v2}, Lda;->values()Ljava/util/Collection;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 50
    .line 51
    .line 52
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 53
    :try_start_2
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-eqz v0, :cond_1

    .line 58
    .line 59
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 64
    .line 65
    .line 66
    const-string v1, ".debug"

    .line 67
    .line 68
    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-eqz v0, :cond_0

    .line 73
    .line 74
    const-string v0, "1:886827622378:android:5511f709b8f9ce1946dc93"

    .line 75
    .line 76
    :goto_0
    move-object v2, v0

    .line 77
    goto :goto_1

    .line 78
    :cond_0
    const-string v0, "1:886827622378:android:aad4b0c3f3487f0246dc93"

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :goto_1
    const-string v0, "ApplicationId must be set."

    .line 82
    .line 83
    invoke-static {v2, v0}, Lbh;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    const-string v3, "AIzaSyB4MzXEgzrPrRttOCM_WaEJ0Pb68uAE9us"

    .line 87
    .line 88
    const-string v0, "ApiKey must be set."

    .line 89
    .line 90
    invoke-static {v3, v0}, Lbh;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    const-string v8, "spotiduck-889fb"

    .line 94
    .line 95
    const-string v7, "spotiduck-889fb.firebasestorage.app"

    .line 96
    .line 97
    new-instance v1, Lj40;

    .line 98
    .line 99
    const/4 v5, 0x0

    .line 100
    const/4 v6, 0x0

    .line 101
    const/4 v4, 0x0

    .line 102
    invoke-direct/range {v1 .. v8}, Lj40;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    invoke-static {p0, v1}, Lu30;->f(Landroid/content/Context;Lj40;)Lu30;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 106
    .line 107
    .line 108
    goto :goto_2

    .line 109
    :catchall_0
    move-exception v0

    .line 110
    :try_start_3
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 111
    :try_start_4
    throw v0
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 112
    :catch_0
    :cond_1
    :goto_2
    invoke-static {p0}, Lbh;->n(Landroid/content/Context;)Le2;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    const/4 v1, 0x1

    .line 117
    if-nez v0, :cond_2

    .line 118
    .line 119
    goto :goto_4

    .line 120
    :cond_2
    goto :goto_4
    :goto_4
    invoke-static {p0}, Lju0;->a(Landroid/content/Context;)Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object v0

    .line 212
    const/4 v2, 0x0

    .line 213
    invoke-virtual {p0, v0, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 214
    .line 215
    .line 216
    move-result-object v0

    .line 217
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 218
    .line 219
    .line 220
    sput-object v0, Lcom/melodix/music/AppSingleton;->u:Landroid/content/SharedPreferences;

    .line 221
    .line 222
    invoke-static {}, Lm9;->e()Landroid/content/SharedPreferences;

    .line 223
    .line 224
    .line 225
    move-result-object v0

    .line 226
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 227
    .line 228
    .line 229
    move-result-object v0

    .line 230
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 231
    .line 232
    .line 233
    sput-object v0, Lcom/melodix/music/AppSingleton;->v:Landroid/content/SharedPreferences$Editor;

    .line 234
    .line 235
    invoke-static {}, Lm9;->e()Landroid/content/SharedPreferences;

    .line 236
    .line 237
    .line 238
    move-result-object v0

    .line 239
    const-string v3, "ServiceOn"

    .line 240
    .line 241
    invoke-interface {v0, v3, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 242
    .line 243
    .line 244
    move-result v0

    .line 245
    sput-boolean v0, Lcom/melodix/music/AppSingleton;->A:Z

    .line 246
    .line 247
    # Startup never trusts a persisted login marker: auth always starts
    # unconfirmed and is confirmed later by the account and player UI.
    const/4 v0, 0x0

    sput-boolean v0, Lcom/melodix/music/AppSingleton;->B:Z

    .line 258
    .line 259
    invoke-static {}, Lm9;->e()Landroid/content/SharedPreferences;

    .line 260
    .line 261
    .line 262
    move-result-object v0

    .line 263
    const-string v3, "APlayMode"

    .line 264
    .line 265
    const-string v4, "disabled"

    .line 266
    .line 267
    invoke-interface {v0, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 268
    .line 269
    .line 270
    move-result-object v0

    .line 271
    sput-object v0, Lcom/melodix/music/AppSingleton;->y:Ljava/lang/String;

    .line 272
    .line 273
    invoke-static {}, Lm9;->e()Landroid/content/SharedPreferences;

    .line 274
    .line 275
    .line 276
    move-result-object v0

    .line 277
    const-string v3, "CloseNowPlay"

    .line 278
    .line 279
    invoke-interface {v0, v3, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 280
    .line 281
    .line 282
    move-result v0

    .line 283
    sput-boolean v0, Lcom/melodix/music/AppSingleton;->D:Z

    .line 284
    .line 285
    invoke-static {}, Lm9;->e()Landroid/content/SharedPreferences;

    .line 286
    .line 287
    .line 288
    move-result-object v0

    .line 289
    const-string v3, "TakeControl"

    .line 290
    .line 291
    invoke-interface {v0, v3, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 292
    .line 293
    .line 294
    move-result v0

    .line 295
    sput-boolean v0, Lcom/melodix/music/AppSingleton;->C:Z

    .line 296
    .line 297
    invoke-static {}, Lm9;->e()Landroid/content/SharedPreferences;

    .line 298
    .line 299
    .line 300
    move-result-object v0

    .line 301
    const-string v3, "GuiMode"

    .line 302
    .line 303
    const-string v4, "csshack"

    .line 304
    .line 305
    invoke-interface {v0, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 306
    .line 307
    .line 308
    move-result-object v0

    .line 309
    sput-object v0, Lcom/melodix/music/AppSingleton;->z:Ljava/lang/String;

    .line 310
    .line 311
    invoke-static {}, Lm9;->e()Landroid/content/SharedPreferences;

    .line 312
    .line 313
    .line 314
    move-result-object v0

    .line 315
    const-string v3, "Amoled"

    .line 316
    .line 317
    invoke-interface {v0, v3, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 318
    .line 319
    .line 320
    move-result v0

    .line 321
    sput-boolean v0, Lcom/melodix/music/AppSingleton;->E:Z

    .line 322
    .line 323
    invoke-static {}, Lm9;->e()Landroid/content/SharedPreferences;

    .line 324
    .line 325
    .line 326
    move-result-object v0

    .line 327
    const-string v3, "AndAuto"

    .line 328
    .line 329
    invoke-interface {v0, v3, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 330
    .line 331
    .line 332
    move-result v0

    .line 333
    sput-boolean v0, Lcom/melodix/music/AppSingleton;->F:Z

    .line 334
    .line 335
    invoke-static {}, Lm9;->e()Landroid/content/SharedPreferences;

    .line 336
    .line 337
    .line 338
    move-result-object v0

    .line 339
    const-string v3, "AaButtonOrder"

    .line 340
    .line 341
    const/4 v4, 0x0

    .line 342
    invoke-interface {v0, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 343
    .line 344
    .line 345
    move-result-object v0

    .line 346
    if-nez v0, :cond_5

    .line 347
    .line 348
    const-string v0, "PLAY,PREV,NEXT,FAV,REPEAT,SHUFFLE"

    .line 349
    .line 350
    sput-object v0, Lcom/melodix/music/AppSingleton;->G:Ljava/lang/String;

    .line 351
    .line 352
    goto/16 :goto_9

    .line 353
    .line 354
    :cond_5
    const-string v3, ","

    .line 355
    .line 356
    filled-new-array {v3}, [Ljava/lang/String;

    .line 357
    .line 358
    .line 359
    move-result-object v3

    .line 360
    invoke-static {v0, v3}, Lda1;->M(Ljava/lang/CharSequence;[Ljava/lang/String;)Ljava/util/List;

    .line 361
    .line 362
    .line 363
    move-result-object v3

    .line 364
    new-instance v5, Ljava/util/ArrayList;

    .line 365
    .line 366
    const/16 v6, 0xa

    .line 367
    .line 368
    invoke-static {v3, v6}, Ldl;->w(Ljava/lang/Iterable;I)I

    .line 369
    .line 370
    .line 371
    move-result v6

    .line 372
    invoke-direct {v5, v6}, Ljava/util/ArrayList;-><init>(I)V

    .line 373
    .line 374
    .line 375
    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 376
    .line 377
    .line 378
    move-result-object v3

    .line 379
    :goto_5
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 380
    .line 381
    .line 382
    move-result v6

    .line 383
    if-eqz v6, :cond_6

    .line 384
    .line 385
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 386
    .line 387
    .line 388
    move-result-object v6

    .line 389
    check-cast v6, Ljava/lang/String;

    .line 390
    .line 391
    invoke-static {v6}, Lda1;->Q(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 392
    .line 393
    .line 394
    move-result-object v6

    .line 395
    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 396
    .line 397
    .line 398
    move-result-object v6

    .line 399
    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 400
    .line 401
    .line 402
    goto :goto_5

    .line 403
    :cond_6
    new-instance v3, Ljava/util/ArrayList;

    .line 404
    .line 405
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 406
    .line 407
    .line 408
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    .line 409
    .line 410
    .line 411
    move-result v6

    .line 412
    move v7, v2

    .line 413
    :cond_7
    :goto_6
    if-ge v7, v6, :cond_8

    .line 414
    .line 415
    invoke-virtual {v5, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 416
    .line 417
    .line 418
    move-result-object v8

    .line 419
    add-int/lit8 v7, v7, 0x1

    .line 420
    .line 421
    move-object v9, v8

    .line 422
    check-cast v9, Ljava/lang/String;

    .line 423
    .line 424
    invoke-virtual {v9}, Ljava/lang/String;->length()I

    .line 425
    .line 426
    .line 427
    move-result v9

    .line 428
    if-lez v9, :cond_7

    .line 429
    .line 430
    invoke-virtual {v3, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 431
    .line 432
    .line 433
    goto :goto_6

    .line 434
    :cond_8
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 435
    .line 436
    .line 437
    move-result v5

    .line 438
    const/4 v6, 0x6

    .line 439
    if-ge v5, v6, :cond_d

    .line 440
    .line 441
    const-string v0, "NONE"

    .line 442
    .line 443
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 444
    .line 445
    .line 446
    move-result v0

    .line 447
    if-eqz v0, :cond_a

    .line 448
    .line 449
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 450
    .line 451
    .line 452
    move-result v0

    .line 453
    sub-int/2addr v6, v0

    .line 454
    new-instance v0, Ljava/util/ArrayList;

    .line 455
    .line 456
    invoke-direct {v0, v6}, Ljava/util/ArrayList;-><init>(I)V

    .line 457
    .line 458
    .line 459
    move v5, v2

    .line 460
    :goto_7
    if-ge v5, v6, :cond_9

    .line 461
    .line 462
    const-string v7, "NONE"

    .line 463
    .line 464
    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 465
    .line 466
    .line 467
    add-int/lit8 v5, v5, 0x1

    .line 468
    .line 469
    goto :goto_7

    .line 470
    :cond_9
    invoke-static {v3, v0}, Lbl;->C(Ljava/util/Collection;Ljava/util/List;)Ljava/util/ArrayList;

    .line 471
    .line 472
    .line 473
    move-result-object v7

    .line 474
    const-string v8, ","

    .line 475
    .line 476
    const/4 v11, 0x0

    .line 477
    const/16 v12, 0x3e

    .line 478
    .line 479
    const/4 v9, 0x0

    .line 480
    const/4 v10, 0x0

    .line 481
    invoke-static/range {v7 .. v12}, Lbl;->B(Ljava/lang/Iterable;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lr80;I)Ljava/lang/String;

    .line 482
    .line 483
    .line 484
    move-result-object v0

    .line 485
    sput-object v0, Lcom/melodix/music/AppSingleton;->G:Ljava/lang/String;

    .line 486
    .line 487
    invoke-static {}, Lm9;->f()Landroid/content/SharedPreferences$Editor;

    .line 488
    .line 489
    .line 490
    move-result-object v3

    .line 491
    const-string v5, "AaButtonOrder"

    .line 492
    .line 493
    invoke-interface {v3, v5, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 494
    .line 495
    .line 496
    move-result-object v0

    .line 497
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 498
    .line 499
    .line 500
    goto :goto_9

    .line 501
    :cond_a
    const-string v7, "PLAY"

    .line 502
    .line 503
    const-string v8, "PREV"

    .line 504
    .line 505
    const-string v9, "NEXT"

    .line 506
    .line 507
    const-string v10, "FAV"

    .line 508
    .line 509
    const-string v11, "REPEAT"

    .line 510
    .line 511
    const-string v12, "SHUFFLE"

    .line 512
    .line 513
    filled-new-array/range {v7 .. v12}, [Ljava/lang/String;

    .line 514
    .line 515
    .line 516
    move-result-object v0

    .line 517
    invoke-static {v0}, Lcl;->u([Ljava/lang/Object;)Ljava/util/List;

    .line 518
    .line 519
    .line 520
    move-result-object v0

    .line 521
    new-instance v5, Ljava/util/ArrayList;

    .line 522
    .line 523
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 524
    .line 525
    .line 526
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 527
    .line 528
    .line 529
    move-result-object v0

    .line 530
    :cond_b
    :goto_8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 531
    .line 532
    .line 533
    move-result v7

    .line 534
    if-eqz v7, :cond_c

    .line 535
    .line 536
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 537
    .line 538
    .line 539
    move-result-object v7

    .line 540
    move-object v8, v7

    .line 541
    check-cast v8, Ljava/lang/String;

    .line 542
    .line 543
    invoke-virtual {v3, v8}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 544
    .line 545
    .line 546
    move-result v8

    .line 547
    if-nez v8, :cond_b

    .line 548
    .line 549
    invoke-virtual {v5, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 550
    .line 551
    .line 552
    goto :goto_8

    .line 553
    :cond_c
    invoke-static {v3, v5}, Lbl;->C(Ljava/util/Collection;Ljava/util/List;)Ljava/util/ArrayList;

    .line 554
    .line 555
    .line 556
    move-result-object v0

    .line 557
    invoke-static {v6, v0}, Lbl;->D(ILjava/util/List;)Ljava/util/List;

    .line 558
    .line 559
    .line 560
    move-result-object v7

    .line 561
    const-string v8, ","

    .line 562
    .line 563
    const/4 v11, 0x0

    .line 564
    const/16 v12, 0x3e

    .line 565
    .line 566
    const/4 v9, 0x0

    .line 567
    const/4 v10, 0x0

    .line 568
    invoke-static/range {v7 .. v12}, Lbl;->B(Ljava/lang/Iterable;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lr80;I)Ljava/lang/String;

    .line 569
    .line 570
    .line 571
    move-result-object v0

    .line 572
    sput-object v0, Lcom/melodix/music/AppSingleton;->G:Ljava/lang/String;

    .line 573
    .line 574
    invoke-static {}, Lm9;->f()Landroid/content/SharedPreferences$Editor;

    .line 575
    .line 576
    .line 577
    move-result-object v3

    .line 578
    const-string v5, "AaButtonOrder"

    .line 579
    .line 580
    invoke-interface {v3, v5, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 581
    .line 582
    .line 583
    move-result-object v0

    .line 584
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 585
    .line 586
    .line 587
    goto :goto_9

    .line 588
    :cond_d
    sput-object v0, Lcom/melodix/music/AppSingleton;->G:Ljava/lang/String;

    .line 589
    .line 590
    :goto_9
    invoke-static {}, Lm9;->e()Landroid/content/SharedPreferences;

    .line 591
    .line 592
    .line 593
    move-result-object v0

    .line 594
    const-string v3, "SwipeStop"

    .line 595
    .line 596
    invoke-interface {v0, v3, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 597
    .line 598
    .line 599
    move-result v0

    .line 600
    sput-boolean v0, Lcom/melodix/music/AppSingleton;->H:Z

    .line 601
    .line 602
    invoke-static {}, Lm9;->e()Landroid/content/SharedPreferences;

    .line 603
    .line 604
    .line 605
    move-result-object v0

    .line 606
    const-string v3, "ExpandedFullScreen"

    .line 607
    .line 608
    invoke-interface {v0, v3, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 609
    .line 610
    .line 611
    move-result v0

    .line 612
    sput-boolean v0, Lcom/melodix/music/AppSingleton;->R:Z

    .line 613
    .line 614
    invoke-static {}, Lm9;->e()Landroid/content/SharedPreferences;

    .line 615
    .line 616
    .line 617
    move-result-object v0

    .line 618
    const-string v3, "DockLeftSidebar"

    .line 619
    .line 620
    invoke-interface {v0, v3, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 621
    .line 622
    .line 623
    move-result v0

    .line 624
    sput-boolean v0, Lcom/melodix/music/AppSingleton;->S:Z

    .line 625
    .line 626
    invoke-static {}, Lm9;->e()Landroid/content/SharedPreferences;

    .line 627
    .line 628
    .line 629
    move-result-object v0

    .line 630
    const-string v3, "HideStatusBar"

    .line 631
    .line 632
    invoke-interface {v0, v3, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 633
    .line 634
    .line 635
    move-result v0

    .line 636
    sput-boolean v0, Lcom/melodix/music/AppSingleton;->T:Z

    .line 637
    .line 638
    :try_start_5
    invoke-static {}, Lm9;->e()Landroid/content/SharedPreferences;

    .line 639
    .line 640
    .line 641
    move-result-object v0

    .line 642
    const-string v3, "AutoShut"

    .line 643
    .line 644
    const-string v5, "0"

    .line 645
    .line 646
    invoke-interface {v0, v3, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 647
    .line 648
    .line 649
    move-result-object v0

    .line 650
    if-eqz v0, :cond_e

    .line 651
    .line 652
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 653
    .line 654
    .line 655
    move-result v0
    :try_end_5
    .catch Ljava/lang/NumberFormatException; {:try_start_5 .. :try_end_5} :catch_1

    .line 656
    goto :goto_a

    .line 657
    :catch_1
    :cond_e
    move v0, v2

    .line 658
    :goto_a
    sput v0, Lcom/melodix/music/AppSingleton;->P:I

    .line 659
    .line 660
    sput v2, Lcom/melodix/music/AppSingleton;->j:I

    .line 661
    .line 662
    invoke-static {}, Lm9;->f()Landroid/content/SharedPreferences$Editor;

    .line 663
    .line 664
    .line 665
    move-result-object v0

    .line 666
    const-string v3, "AutoSleep"

    .line 667
    .line 668
    const-string v5, "0"

    .line 669
    .line 670
    invoke-interface {v0, v3, v5}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 671
    .line 672
    .line 673
    move-result-object v0

    .line 674
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 675
    .line 676
    .line 677
    invoke-static {}, Lm9;->e()Landroid/content/SharedPreferences;

    .line 678
    .line 679
    .line 680
    move-result-object v0

    .line 681
    const-string v3, "ForcePortrait"

    .line 682
    .line 683
    invoke-interface {v0, v3, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 684
    .line 685
    .line 686
    move-result v0

    .line 687
    sput-boolean v0, Lcom/melodix/music/AppSingleton;->I:Z

    .line 688
    .line 689
    invoke-static {}, Lm9;->e()Landroid/content/SharedPreferences;

    .line 690
    .line 691
    .line 692
    move-result-object v0

    .line 693
    const-string v3, "KeepScreenOn"

    .line 694
    .line 695
    invoke-interface {v0, v3, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 696
    .line 697
    .line 698
    move-result v0

    .line 699
    sput-boolean v0, Lcom/melodix/music/AppSingleton;->J:Z

    .line 700
    .line 701
    invoke-static {}, Lm9;->e()Landroid/content/SharedPreferences;

    .line 702
    .line 703
    .line 704
    move-result-object v0

    .line 705
    const-string v3, "ForceEn"

    .line 706
    .line 707
    invoke-interface {v0, v3, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 708
    .line 709
    .line 710
    move-result v0

    .line 711
    sput-boolean v0, Lcom/melodix/music/AppSingleton;->K:Z

    .line 712
    .line 713
    invoke-static {}, Lm9;->e()Landroid/content/SharedPreferences;

    .line 714
    .line 715
    .line 716
    move-result-object v0

    .line 717
    const-string v3, "HPAP"

    .line 718
    .line 719
    invoke-interface {v0, v3, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 720
    .line 721
    .line 722
    move-result v0

    .line 723
    sput-boolean v0, Lcom/melodix/music/AppSingleton;->L:Z

    .line 724
    .line 725
    invoke-static {}, Lm9;->e()Landroid/content/SharedPreferences;

    .line 726
    .line 727
    .line 728
    move-result-object v0

    .line 729
    const-string v3, "HPAS"

    .line 730
    .line 731
    invoke-interface {v0, v3, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 732
    .line 733
    .line 734
    move-result v0

    .line 735
    sput-boolean v0, Lcom/melodix/music/AppSingleton;->M:Z

    .line 736
    .line 737
    invoke-static {}, Lm9;->e()Landroid/content/SharedPreferences;

    .line 738
    .line 739
    .line 740
    move-result-object v0

    .line 741
    const-string v3, "BTAP"

    .line 742
    .line 743
    invoke-interface {v0, v3, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 744
    .line 745
    .line 746
    move-result v0

    .line 747
    sput-boolean v0, Lcom/melodix/music/AppSingleton;->N:Z

    .line 748
    .line 749
    invoke-static {}, Lm9;->e()Landroid/content/SharedPreferences;

    .line 750
    .line 751
    .line 752
    move-result-object v0

    .line 753
    const-string v3, "BTAS"

    .line 754
    .line 755
    invoke-interface {v0, v3, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 756
    .line 757
    .line 758
    move-result v0

    .line 759
    sput-boolean v0, Lcom/melodix/music/AppSingleton;->O:Z

    .line 760
    .line 761
    invoke-static {}, Lm9;->e()Landroid/content/SharedPreferences;

    .line 762
    .line 763
    .line 764
    move-result-object v0

    .line 765
    const-string v3, "DisableCanvas"

    .line 766
    .line 767
    invoke-interface {v0, v3, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 768
    .line 769
    .line 770
    move-result v0

    .line 771
    sput-boolean v0, Lcom/melodix/music/AppSingleton;->Q:Z

    .line 772
    .line 773
    invoke-static {}, Lm9;->e()Landroid/content/SharedPreferences;

    .line 774
    .line 775
    .line 776
    move-result-object v0

    .line 777
    const-string v3, "PrioritizeLocalAssets"

    .line 778
    .line 779
    invoke-interface {v0, v3, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 780
    .line 781
    .line 782
    move-result v0

    .line 783
    sput-boolean v0, Lcom/melodix/music/AppSingleton;->W:Z

    .line 784
    .line 785
    invoke-static {}, Lm9;->e()Landroid/content/SharedPreferences;

    .line 786
    .line 787
    .line 788
    move-result-object v0

    .line 789
    const-string v3, "AdBlockMode"

    .line 790
    .line 791
    const-string v5, "legacy"

    .line 792
    .line 793
    invoke-interface {v0, v3, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 794
    .line 795
    .line 796
    move-result-object v0

    .line 797
    if-nez v0, :cond_f

    .line 798
    .line 799
    const-string v0, "legacy"

    .line 800
    .line 801
    :cond_f
    sput-object v0, Lcom/melodix/music/AppSingleton;->X:Ljava/lang/String;

    .line 802
    .line 803
    const-string v0, "https://raw.githubusercontent.com/Souxch06/Melodix/main/Melodix-v1.2.2-3d2c473/assets/adblock_hosts.txt"

    .line 804
    .line 805
    invoke-static {}, Lm9;->e()Landroid/content/SharedPreferences;

    .line 806
    .line 807
    .line 808
    move-result-object v3

    .line 809
    const-string v5, "adblock_config_version"

    .line 810
    .line 811
    invoke-interface {v3, v5, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 812
    .line 813
    .line 814
    move-result v3

    .line 815
    const/4 v5, 0x2

    .line 816
    if-ge v3, v5, :cond_10

    .line 817
    .line 818
    invoke-static {}, Lm9;->f()Landroid/content/SharedPreferences$Editor;

    .line 819
    .line 820
    .line 821
    move-result-object v3

    .line 822
    const-string v6, "AdBlockListUrl"

    .line 823
    .line 824
    invoke-interface {v3, v6, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 825
    .line 826
    .line 827
    move-result-object v3

    .line 828
    const-string v6, "adblock_config_version"

    .line 829
    .line 830
    invoke-interface {v3, v6, v5}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 831
    .line 832
    .line 833
    move-result-object v3

    .line 834
    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 835
    .line 836
    .line 837
    :cond_10
    invoke-static {}, Lm9;->e()Landroid/content/SharedPreferences;

    .line 838
    .line 839
    .line 840
    move-result-object v3

    .line 841
    const-string v6, "AdBlockListUrl"

    .line 842
    .line 843
    invoke-interface {v3, v6, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 844
    .line 845
    .line 846
    move-result-object v3

    .line 847
    if-nez v3, :cond_11

    .line 848
    .line 849
    goto :goto_b

    .line 850
    :cond_11
    move-object v0, v3

    .line 851
    :goto_b
    sput-object v0, Lcom/melodix/music/AppSingleton;->a0:Ljava/lang/String;

    .line 852
    .line 853
    invoke-static {}, Lm9;->e()Landroid/content/SharedPreferences;

    .line 854
    .line 855
    .line 856
    move-result-object v0

    .line 857
    const-string v3, "key_custom_css"

    .line 858
    .line 859
    const-string v6, ""

    .line 860
    .line 861
    invoke-interface {v0, v3, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 862
    .line 863
    .line 864
    move-result-object v0

    .line 865
    if-nez v0, :cond_12

    .line 866
    .line 867
    const-string v0, ""

    .line 868
    .line 869
    :cond_12
    sput-object v0, Lcom/melodix/music/AppSingleton;->b0:Ljava/lang/String;

    .line 870
    .line 871
    invoke-static {}, Lm9;->e()Landroid/content/SharedPreferences;

    .line 872
    .line 873
    .line 874
    move-result-object v0

    .line 875
    const-string v3, "ProxyType"

    .line 876
    .line 877
    const-string v6, "none"

    .line 878
    .line 879
    invoke-interface {v0, v3, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 880
    .line 881
    .line 882
    move-result-object v0

    .line 883
    if-nez v0, :cond_13

    .line 884
    .line 885
    const-string v0, "none"

    .line 886
    .line 887
    :cond_13
    sput-object v0, Lcom/melodix/music/AppSingleton;->c0:Ljava/lang/String;

    .line 888
    .line 889
    invoke-static {}, Lm9;->e()Landroid/content/SharedPreferences;

    .line 890
    .line 891
    .line 892
    move-result-object v0

    .line 893
    const-string v3, "ProxyHost"

    .line 894
    .line 895
    const-string v6, ""

    .line 896
    .line 897
    invoke-interface {v0, v3, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 898
    .line 899
    .line 900
    move-result-object v0

    .line 901
    if-nez v0, :cond_14

    .line 902
    .line 903
    const-string v0, ""

    .line 904
    .line 905
    :cond_14
    sput-object v0, Lcom/melodix/music/AppSingleton;->d0:Ljava/lang/String;

    .line 906
    .line 907
    invoke-static {}, Lm9;->e()Landroid/content/SharedPreferences;

    .line 908
    .line 909
    .line 910
    move-result-object v0

    .line 911
    const-string v3, "ProxyPort"

    .line 912
    .line 913
    const-string v6, "0"

    .line 914
    .line 915
    invoke-interface {v0, v3, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 916
    .line 917
    .line 918
    move-result-object v0

    .line 919
    if-eqz v0, :cond_15

    .line 920
    .line 921
    invoke-static {v0}, Lka1;->r(Ljava/lang/String;)Ljava/lang/Integer;

    .line 922
    .line 923
    .line 924
    move-result-object v0

    .line 925
    if-eqz v0, :cond_15

    .line 926
    .line 927
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 928
    .line 929
    .line 930
    move-result v2

    .line 931
    :cond_15
    sput v2, Lcom/melodix/music/AppSingleton;->e0:I

    .line 932
    .line 933
    invoke-static {}, Lm9;->j()V

    .line 934
    .line 935
    .line 936
    invoke-static {}, Lm9;->i()Z

    .line 937
    .line 938
    .line 939
    move-result v0

    .line 940
    if-eqz v0, :cond_16

    .line 941
    .line 942
    new-instance v0, Ljava/lang/Thread;

    .line 943
    .line 944
    new-instance v2, Lo6;

    .line 945
    .line 946
    invoke-direct {v2, v4, v1, p0}, Lo6;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 947
    .line 948
    .line 949
    invoke-direct {v0, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 950
    .line 951
    .line 952
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 953
    .line 954
    .line 955
    :cond_16
    invoke-static {p0}, Lc40;->b(Landroid/content/ContextWrapper;)V

    .line 956
    .line 957
    .line 958
    new-instance p0, Landroid/os/Handler;

    .line 959
    .line 960
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 961
    .line 962
    .line 963
    move-result-object v0

    .line 964
    invoke-direct {p0, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 965
    .line 966
    .line 967
    new-instance v0, Lx3;

    .line 968
    .line 969
    invoke-direct {v0, v5}, Lx3;-><init>(I)V

    .line 970
    .line 971
    .line 972
    const-wide/16 v1, 0x96

    .line 973
    .line 974
    invoke-virtual {p0, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 975
    .line 976
    .line 977
    return-void
.end method

.method public static noteDiag(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    # Journal natif borne (600 chars) : data/render/route + ecran courant.
    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/melodix/music/AppSingleton;->diagNative:Ljava/lang/String;

    if-eqz v1, :skip_old

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " | "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :skip_old
    if-eqz p0, :d1

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :d1
    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz p1, :d2

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :d2
    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz p2, :d3

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :d3
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    const/16 v0, 0x258

    if-le v2, v0, :keep

    sub-int/2addr v2, v0

    invoke-virtual {v1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    :keep
    sput-object v1, Lcom/melodix/music/AppSingleton;->diagNative:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :done

    :catch_0
    move-exception v0

    :done
    return-void
.end method

.method public final onLowMemory()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/app/Application;->onLowMemory()V

    .line 2
    .line 3
    .line 4
    sget-object p0, Lcom/melodix/music/AppSingleton;->f0:Ljava/util/concurrent/ConcurrentHashMap;

    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/util/concurrent/ConcurrentHashMap;->clear()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final onTrimMemory(I)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/app/Application;->onTrimMemory(I)V

    .line 2
    .line 3
    .line 4
    const/16 p0, 0x3c

    .line 5
    .line 6
    if-lt p1, p0, :cond_0

    .line 7
    .line 8
    sget-object p0, Lcom/melodix/music/AppSingleton;->f0:Ljava/util/concurrent/ConcurrentHashMap;

    .line 9
    .line 10
    invoke-virtual {p0}, Ljava/util/concurrent/ConcurrentHashMap;->clear()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method
