.class public final Lcom/melodix/music/StartupSplashFallback;
.super Ljava/lang/Object;
.source "StartupSplashFallback.java"

# interfaces
.implements Ljava/lang/Runnable;


# static fields
# P0 diagnostic: launch telemetry readable from the on-screen diag view.
.field public static armed:Z

.field public static fired:Z

.field private static final RESCUE_DELAY_MS:J = 0x4e20L

# P0 fix: each arm() increments this; a pending rescue from a previous arm
# (e.g. before a retry tap re-arms the rescue) sees a different generation and
# exits without acting, so at most one rescue can ever fire per arm cycle.
.field private static generation:I


# instance fields
.field private final activity:Ljava/lang/ref/WeakReference;

.field private final generationAtArm:I


# direct methods
.method private constructor <init>(Lcom/melodix/music/MainActivity;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/melodix/music/StartupSplashFallback;->activity:Ljava/lang/ref/WeakReference;

    sget v0, Lcom/melodix/music/StartupSplashFallback;->generation:I

    add-int/lit8 v0, v0, 0x1

    sput v0, Lcom/melodix/music/StartupSplashFallback;->generation:I

    iput v0, p0, Lcom/melodix/music/StartupSplashFallback;->generationAtArm:I

    return-void
.end method

.method public static arm(Lcom/melodix/music/MainActivity;)V
    .locals 6

    if-eqz p0, :return

    iget-object v0, p0, Lcom/melodix/music/MainActivity;->H:Landroidx/constraintlayout/widget/ConstraintLayout;

    if-eqz v0, :return

    new-instance v1, Lcom/melodix/music/StartupSplashFallback;

    invoke-direct {v1, p0}, Lcom/melodix/music/StartupSplashFallback;-><init>(Lcom/melodix/music/MainActivity;)V

    # P0 fix: schedule the rescue on the MAIN-LOOPER HANDLER, not on the splash
    # view. A View.postDelayed is queued on the view's attach: if the window
    # never attaches (or the view is detached) the callback silently never runs,
    # which leaves the logo blocked with no rescue. The handler always fires;
    # run() re-checks the activity, the splash state and the generation, so a
    # callback from a superseded arm is ignored and a destroyed activity is a
    # no-op (weak reference + isFinishing/isDestroyed guards).
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    new-instance v3, Landroid/os/Handler;

    invoke-direct {v3, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    const-wide/16 v4, 0x4e20

    invoke-virtual {v3, v1, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    move-result v2

    const/4 v1, 0x1

    sput-boolean v1, Lcom/melodix/music/StartupSplashFallback;->armed:Z

    const-string v1, "MDXSTART"

    const-string v3, "startup-splash-fallback armed (20s rescue window)"

    invoke-static {v1, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    # The arm is only real if the handler accepted the callback: a failed
    # schedule must be visible in the log instead of masquerading as an arm.
    # postDelayed == 0 (false) means the callback was NOT scheduled.
    if-nez v2, :arm_scheduled

    const-string v3, "startup-splash-fallback SCHEDULE FAILED (handler refused)"

    invoke-static {v1, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :arm_scheduled
    return-void

    :return
    const-string v1, "MDXSTART"

    const-string v2, "startup-splash-fallback NOT armed (activity or splash view missing)"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

# P0 instrumentation: one-line diagnostic note on the launch tag. Never logs
# URLs, tokens or private data - callers pass short static labels only.
.method public static note(Ljava/lang/String;)V
    .locals 1

    const-string v0, "MDXSTART"

    invoke-static {v0, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

# P0 instrumentation: dump the splash state machine at a critical point.
# Shows l/m/n, splash visibility, alpha and tag. No personal data.
.method public static traceState(Lcom/melodix/music/MainActivity;Ljava/lang/String;)V
    .locals 4

    :try_start_state
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " l="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-boolean v1, Lcom/melodix/music/AppSingleton;->l:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, " m="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-boolean v1, Lcom/melodix/music/AppSingleton;->m:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, " n="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v1, Lcom/melodix/music/AppSingleton;->n:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    if-eqz p0, :state_no_activity

    iget-object v2, p0, Lcom/melodix/music/MainActivity;->H:Landroidx/constraintlayout/widget/ConstraintLayout;

    if-eqz v2, :state_no_view

    const-string v1, " H.vis="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    move-result v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " H.alpha="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Landroid/view/View;->getAlpha()F

    move-result v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v1, " H.tag="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    goto :state_log

    :state_no_view
    const-string v1, " H=null"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :state_log

    :state_no_activity
    const-string v1, " activity=null"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :state_log
    const-string v1, "MDXSTART"

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :try_end_state
    .catch Ljava/lang/Throwable; {:try_start_state .. :try_end_state} :catch_state

    :catch_state
    return-void
.end method

# P0 instrumentation: log a loadUrl target with query and fragment stripped,
# so no token or sensitive parameter can ever reach the log.
.method public static traceLoadUrl(Ljava/lang/String;)V
    .locals 3

    :try_start_url
    if-eqz p0, :url_return

    const/16 v0, 0x3f

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    const/16 v1, 0x23

    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-gez v0, :url_have_q

    move v0, v1

    goto :url_have_cut

    :url_have_q
    if-gez v1, :url_have_cut

    if-lt v1, v0, :url_have_cut

    move v0, v1

    :url_have_cut
    if-lez v0, :url_no_cut

    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    :url_no_cut
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "loadUrl: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "MDXSTART"

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :try_end_url
    .catch Ljava/lang/Throwable; {:try_start_url .. :try_end_url} :catch_url

    :catch_url
    :url_return
    return-void
.end method

# P0: build and show the on-screen diagnostic line (no tokens, no private
# data): last stage, fallback armed/fired, watchdog armed, network error.
# Added as a small text view on the splash surface so a phone stuck at the
# logo can tell whether the rescue actually ran.
.method public static showDiag(Lcom/melodix/music/MainActivity;)V
    .locals 6

    :try_start_diag
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "diag: stage="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "melodix_native"

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v2, "last_stage"

    const-string v3, "?"

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " | fallback armed="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-boolean v1, Lcom/melodix/music/StartupSplashFallback;->armed:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, " fired="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-boolean v1, Lcom/melodix/music/StartupSplashFallback;->fired:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, " | watchdog="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-boolean v1, Lcom/melodix/music/StartupLoadWatchdog;->armed:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, " | neterr="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-boolean v1, Lcom/melodix/music/AppSingleton;->m:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 v0, -0x1

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    const/high16 v0, 0x41200000    # 10.0f

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTextSize(F)V

    const/16 v0, 0x8

    const/4 v2, 0x4

    invoke-virtual {v1, v0, v2, v0, v2}, Landroid/widget/TextView;->setPadding(IIII)V

    iget-object v0, p0, Lcom/melodix/music/MainActivity;->H:Landroidx/constraintlayout/widget/ConstraintLayout;

    if-eqz v0, :diag_done

    new-instance v2, Landroid/view/ViewGroup$LayoutParams;

    const/4 v3, -0x2

    invoke-direct {v2, v3, v3}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {p0}, Le6;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->heightPixels:I

    int-to-float v2, v2

    const/high16 v3, 0x42c80000    # 100.0f

    sub-float/2addr v2, v3

    invoke-virtual {v1, v2}, Landroid/view/View;->setTranslationY(F)V

    :diag_done
    :try_end_diag
    .catch Ljava/lang/Throwable; {:try_start_diag .. :try_end_diag} :catch_diag

    goto :diag_return

    :catch_diag
    move-exception v0

    :diag_return
    return-void
.end method

# P0: the recoverable network error screen, shown DIRECTLY by the rescue.
# Does not rely on the D()/zk0 state machine (whose restore path keeps the
# splash and skips the tap-to-retry listener): icon + "Network Error - Tap to
# retry" + tap-to-retry + diag line, with the splash kept only as backdrop.
.method public static showErrorScreen(Lcom/melodix/music/MainActivity;)V
    .locals 3

    iget-object v0, p0, Lcom/melodix/music/MainActivity;->H:Landroidx/constraintlayout/widget/ConstraintLayout;

    if-eqz v0, :e1

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {v0, v2}, Landroid/view/View;->setAlpha(F)V

    :e1
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->N:Landroid/widget/FrameLayout;

    if-eqz v0, :e2

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    :e2
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->J:Landroid/widget/ImageView;

    if-eqz v0, :e3

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {v0, v2}, Landroid/view/View;->setAlpha(F)V

    :e3
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->K:Landroid/widget/TextView;

    if-eqz v0, :e4

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {v0, v2}, Landroid/view/View;->setAlpha(F)V

    const-string v2, "Network Error\nTap to retry"

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :e4
    invoke-static {p0}, Lcom/melodix/music/SplashRetryListener;->install(Lcom/melodix/music/MainActivity;)V

    invoke-static {p0}, Lcom/melodix/music/StartupSplashFallback;->showDiag(Lcom/melodix/music/MainActivity;)V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 5

    # P0 fix: a rescue from a superseded arm (a retry tap re-armed the rescue
    # window) must not act on the new startup cycle. Equal generation (if-eq)
    # continues; a differing generation falls through to the ignored note.
    sget v0, Lcom/melodix/music/StartupSplashFallback;->generation:I

    iget v1, p0, Lcom/melodix/music/StartupSplashFallback;->generationAtArm:I

    if-eq v0, v1, :gen_ok

    const-string v0, "startup-splash-fallback ignored (superseded by a newer arm)"

    invoke-static {v0}, Lcom/melodix/music/StartupSplashFallback;->note(Ljava/lang/String;)V

    return-void

    :gen_ok
    iget-object v0, p0, Lcom/melodix/music/StartupSplashFallback;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/melodix/music/MainActivity;

    if-eqz v0, :ret_act_gone

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v1

    # Guard: if the activity IS finishing (isFinishing() == true, v1 != 0),
    # leave without doing anything. The active case (v1 == 0) must fall
    # through to the rescue - not return early.
    if-nez v1, :ret_finishing

    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v1

    if-nez v1, :ret_destroyed

    iget-object v1, v0, Lcom/melodix/music/MainActivity;->H:Landroidx/constraintlayout/widget/ConstraintLayout;

    if-eqz v1, :ret_no_view

    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    move-result v1

    # Guard: if the splash is NOT visible (visibility != View.VISIBLE, v1 != 0),
    # the normal path already dismissed it - leave without doing anything.
    # Only the still-visible case (v1 == 0) falls through to the rescue.
    if-nez v1, :ret_not_visible

    const-string v1, "MDXSTART"

    const-string v2, "startup-splash-fallback FIRED: splash still visible, launch chain blocked"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    # P0 startup watchdog: the rescue acted - the startup is resolved (error
    # screen or web reveal), the hang watchdog must not report.
    const/4 v1, 0x1

    sput-boolean v1, Lcom/melodix/music/AppSingleton;->startupDone:Z

    const-string v2, "fallback-fired"

    invoke-static {v0, v2}, Lcom/melodix/music/StartupSplashFallback;->traceState(Lcom/melodix/music/MainActivity;Ljava/lang/String;)V

    const/4 v1, 0x1

    sput-boolean v1, Lcom/melodix/music/StartupSplashFallback;->fired:Z

    const-string v1, "splash-fallback"

    invoke-static {v1}, Lcom/melodix/music/NativeCrashGuard;->stage(Ljava/lang/String;)V

    iget-object v1, v0, Lcom/melodix/music/MainActivity;->H:Landroidx/constraintlayout/widget/ConstraintLayout;

    if-eqz v1, :try_block

    const-string v2, "startup-fallback"

    invoke-virtual {v1, v2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    # Everything below can fail (animators, state machine, webview). A rescue
    # that throws must never leave the splash stuck: the catch forces the
    # splash away as the last resort.
    :try_block
    :try_start_0
    sget-boolean v1, Lcom/melodix/music/AppSingleton;->m:Z

    if-eqz v1, :check_page

    goto :error_mode

    :check_page
    iget-object v1, v0, Lcom/melodix/music/MainActivity;->G:Landroid/webkit/WebView;

    if-eqz v1, :web_mode

    invoke-virtual {v1}, Landroid/webkit/WebView;->getProgress()I

    move-result v1

    const/16 v2, 0x64

    if-ge v1, v2, :web_mode

    :error_mode
    const-string v1, "MDXSTART"

    const-string v2, "startup-splash-fallback -> network error screen (tap to retry)"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    const-string v1, "fallback-error"

    invoke-static {v1}, Lcom/melodix/music/NativeCrashGuard;->stage(Ljava/lang/String;)V

    invoke-static {v0}, Lcom/melodix/music/StartupSplashFallback;->showErrorScreen(Lcom/melodix/music/MainActivity;)V

    goto :try_end_0

    :web_mode
    const-string v1, "MDXSTART"

    const-string v2, "startup-splash-fallback -> revealing web page (explicit fallback)"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    const-string v1, "fallback-web"

    invoke-static {v1}, Lcom/melodix/music/NativeCrashGuard;->stage(Ljava/lang/String;)V

    invoke-static {v0}, Lcom/melodix/music/StartupSplashFallback;->showDiag(Lcom/melodix/music/MainActivity;)V

    new-instance v1, Lzk0;

    const/4 v2, 0x1

    invoke-direct {v1, v0, v2, v2}, Lzk0;-><init>(Lcom/melodix/music/MainActivity;ZI)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :return

    :catch_0
    move-exception v1

    # Last resort: the rescue itself failed. Never leave the splash stuck -
    # force it away and trace why.
    const-string v2, "fallback-forced"

    invoke-static {v2}, Lcom/melodix/music/NativeCrashGuard;->stage(Ljava/lang/String;)V

    const-string v2, "MDXSTART"

    const-string v3, "startup-splash-fallback FAILED, forcing splash away"

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v2, v0, Lcom/melodix/music/MainActivity;->H:Landroidx/constraintlayout/widget/ConstraintLayout;

    if-eqz v2, :forced_done

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    :forced_done
    invoke-static {v0}, Lcom/melodix/music/StartupSplashFallback;->showDiag(Lcom/melodix/music/MainActivity;)V

    :return
    return-void

    # P0 instrumentation: every early exit is traced distinctly, so a phone
    # log can tell WHY the rescue did not act ("ignoré" is as important as
    # "déclenché" - an arm without a run is invisible otherwise).
    :ret_act_gone
    const-string v0, "startup-splash-fallback ignored (activity gone)"

    invoke-static {v0}, Lcom/melodix/music/StartupSplashFallback;->note(Ljava/lang/String;)V

    return-void

    :ret_finishing
    const-string v0, "startup-splash-fallback ignored (activity finishing)"

    invoke-static {v0}, Lcom/melodix/music/StartupSplashFallback;->note(Ljava/lang/String;)V

    return-void

    :ret_destroyed
    const-string v0, "startup-splash-fallback ignored (activity destroyed)"

    invoke-static {v0}, Lcom/melodix/music/StartupSplashFallback;->note(Ljava/lang/String;)V

    return-void

    :ret_no_view
    const-string v0, "startup-splash-fallback ignored (splash view missing)"

    invoke-static {v0}, Lcom/melodix/music/StartupSplashFallback;->note(Ljava/lang/String;)V

    return-void

    :ret_not_visible
    const-string v0, "startup-splash-fallback ignored (splash already dismissed)"

    invoke-static {v0}, Lcom/melodix/music/StartupSplashFallback;->note(Ljava/lang/String;)V

    return-void
.end method
