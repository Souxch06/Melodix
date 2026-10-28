.class public final Lcom/melodix/music/StartupSplashFallback;
.super Ljava/lang/Object;
.source "StartupSplashFallback.java"

# interfaces
.implements Ljava/lang/Runnable;


# static fields
# P0: rescue watchdog for the launch splash. Armed once when the splash view
# exists (see arm). If the splash is STILL visible after the rescue window the
# launch chain is blocked (no native shell takeover and no page-finished
# callback), so this fires a traced, recoverable exit: either the network
# error screen (tap to retry) or the web page fallback. This is a bounded
# rescue net, NOT the normal splash dismissal: the splash still goes away as
# soon as the app is ready (showNativeUi / normal fade / StartupLoadWatchdog).
.field private static final RESCUE_DELAY_MS:J = 0x4e20L


# instance fields
.field private final activity:Ljava/lang/ref/WeakReference;


# direct methods
.method private constructor <init>(Lcom/melodix/music/MainActivity;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/melodix/music/StartupSplashFallback;->activity:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method public static arm(Lcom/melodix/music/MainActivity;)V
    .locals 4

    if-eqz p0, :return

    iget-object v0, p0, Lcom/melodix/music/MainActivity;->H:Landroidx/constraintlayout/widget/ConstraintLayout;

    if-eqz v0, :return

    new-instance v1, Lcom/melodix/music/StartupSplashFallback;

    invoke-direct {v1, p0}, Lcom/melodix/music/StartupSplashFallback;-><init>(Lcom/melodix/music/MainActivity;)V

    # Arm on the splash view itself: the rescue dies with the view and cannot
    # be silently skipped because a singleton weakref was not set yet.
    const-wide/16 v2, 0x4e20

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    const-string v0, "MDXSTART"

    const-string v1, "startup-splash-fallback armed (20s rescue window)"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :return
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    iget-object v0, p0, Lcom/melodix/music/StartupSplashFallback;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/melodix/music/MainActivity;

    if-eqz v0, :return

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v1

    if-eqz v1, :return

    iget-object v1, v0, Lcom/melodix/music/MainActivity;->H:Landroidx/constraintlayout/widget/ConstraintLayout;

    if-eqz v1, :return

    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    move-result v1

    if-eqz v1, :return

    # Splash still visible after the rescue window: the startup chain is
    # blocked. Trace the exact step before taking the exit.
    const-string v1, "MDXSTART"

    const-string v2, "startup-splash-fallback FIRED: splash still visible, launch chain blocked"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    const-string v1, "splash-fallback"

    invoke-static {v1}, Lcom/melodix/music/NativeCrashGuard;->stage(Ljava/lang/String;)V

    # Tag the splash so the zk0 splash-hold guard allows the fade: this is an
    # explicit, traced fallback, not an arbitrary splash mask.
    iget-object v1, v0, Lcom/melodix/music/MainActivity;->H:Landroidx/constraintlayout/widget/ConstraintLayout;

    if-eqz v1, :check_error

    const-string v2, "startup-fallback"

    invoke-virtual {v1, v2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    :check_error
    sget-boolean v1, Lcom/melodix/music/AppSingleton;->m:Z

    if-eqz v1, :fallback_web

    # A network error is already known: show the recoverable error screen
    # (logo + "Network Error - Tap to retry") instead of hiding behind a dead
    # splash. D(true) keeps the splash as the error backdrop and installs the
    # tap-to-retry handler.
    const-string v1, "MDXSTART"

    const-string v2, "startup-splash-fallback -> network error screen (tap to retry)"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    const-string v1, "fallback-error"

    invoke-static {v1}, Lcom/melodix/music/NativeCrashGuard;->stage(Ljava/lang/String;)V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/melodix/music/MainActivity;->D(Z)V

    goto :return

    :fallback_web
    # No known network error: reveal the loaded web page as the fallback home,
    # exactly like the StartupLoadWatchdog path (traced, explicit fallback tag
    # already set above).
    const-string v1, "MDXSTART"

    const-string v2, "startup-splash-fallback -> revealing web page (explicit fallback)"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    const-string v1, "fallback-web"

    invoke-static {v1}, Lcom/melodix/music/NativeCrashGuard;->stage(Ljava/lang/String;)V

    new-instance v1, Lzk0;

    const/4 v2, 0x1

    invoke-direct {v1, v0, v2, v2}, Lzk0;-><init>(Lcom/melodix/music/MainActivity;ZI)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    :return
    return-void
.end method
