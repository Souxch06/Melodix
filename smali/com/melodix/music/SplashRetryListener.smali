.class public final Lcom/melodix/music/SplashRetryListener;
.super Ljava/lang/Object;
.source "SplashRetryListener.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private final activity:Ljava/lang/ref/WeakReference;


# direct methods
.method private constructor <init>(Lcom/melodix/music/MainActivity;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/melodix/music/SplashRetryListener;->activity:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method public static install(Lcom/melodix/music/MainActivity;)V
    .locals 2

    # P0: the network error screen must be recoverable ("Tap to retry").
    # Install the tap handler on the splash surface and on the error texts so
    # any tap retries the startup instead of leaving the app dead on the logo.
    if-eqz p0, :return

    new-instance v0, Lcom/melodix/music/SplashRetryListener;

    invoke-direct {v0, p0}, Lcom/melodix/music/SplashRetryListener;-><init>(Lcom/melodix/music/MainActivity;)V

    iget-object v1, p0, Lcom/melodix/music/MainActivity;->H:Landroidx/constraintlayout/widget/ConstraintLayout;

    if-eqz v1, :skip_overlay

    invoke-virtual {v1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :skip_overlay
    iget-object v1, p0, Lcom/melodix/music/MainActivity;->K:Landroid/widget/TextView;

    if-eqz v1, :skip_text

    invoke-virtual {v1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :skip_text
    iget-object v1, p0, Lcom/melodix/music/MainActivity;->J:Landroid/widget/ImageView;

    if-eqz v1, :return

    invoke-virtual {v1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :return
    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    iget-object v0, p0, Lcom/melodix/music/SplashRetryListener;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/melodix/music/MainActivity;

    if-eqz v0, :return

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v1

    # Guard: leave only when the activity IS finishing (isFinishing() == true).
    # The active case must fall through and perform the retry.
    if-nez v1, :return

    const-string v1, "MDXSTART"

    const-string v2, "splash-retry tapped: relaunching startup"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    const-string v1, "retry-tapped"

    invoke-static {v1}, Lcom/melodix/music/NativeCrashGuard;->stage(Ljava/lang/String;)V

    # Clear the network-error flags.
    const/4 v1, 0x0

    sput-boolean v1, Lcom/melodix/music/AppSingleton;->m:Z

    const/4 v1, -0x1

    sput v1, Lcom/melodix/music/AppSingleton;->n:I

    # Reset the visuals DIRECTLY (do not go through D(): its restore path
    # re-arms the error state machine and can put the error screen back).
    iget-object v1, v0, Lcom/melodix/music/MainActivity;->K:Landroid/widget/TextView;

    if-eqz v1, :r1

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    :r1
    iget-object v1, v0, Lcom/melodix/music/MainActivity;->J:Landroid/widget/ImageView;

    if-eqz v1, :r2

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    :r2
    iget-object v1, v0, Lcom/melodix/music/MainActivity;->N:Landroid/widget/FrameLayout;

    if-eqz v1, :r3

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    :r3
    # The splash stays visible as the loading screen during the reload, but its
    # explicit fallback tag is removed so the hold guard is armed again.
    iget-object v1, v0, Lcom/melodix/music/MainActivity;->H:Landroidx/constraintlayout/widget/ConstraintLayout;

    if-eqz v1, :r4

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {v1, v2}, Landroid/view/View;->setAlpha(F)V

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    :r4
    iget-object v1, v0, Lcom/melodix/music/MainActivity;->G:Landroid/webkit/WebView;

    if-eqz v1, :return

    invoke-virtual {v1}, Landroid/webkit/WebView;->reload()V

    invoke-static {v1}, Lcom/melodix/music/StartupLoadWatchdog;->arm(Landroid/webkit/WebView;)V

    :return
    return-void
.end method
