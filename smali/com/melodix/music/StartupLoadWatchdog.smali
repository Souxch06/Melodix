.class public final Lcom/melodix/music/StartupLoadWatchdog;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "StartupLoadWatchdog.java"

.field private static generation:I

.field private final activity:Ljava/lang/ref/WeakReference;

.field private final generationAtArm:I

.method private constructor <init>(Lcom/melodix/music/MainActivity;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object v0, p0, Lcom/melodix/music/StartupLoadWatchdog;->activity:Ljava/lang/ref/WeakReference;

    sget v0, Lcom/melodix/music/StartupLoadWatchdog;->generation:I
    add-int/lit8 v0, v0, 0x1
    sput v0, Lcom/melodix/music/StartupLoadWatchdog;->generation:I
    iput v0, p0, Lcom/melodix/music/StartupLoadWatchdog;->generationAtArm:I

    return-void
.end method

.method public static arm(Landroid/webkit/WebView;)V
    .locals 4

    if-eqz p0, :return

    sget-object v0, Lcom/melodix/music/AppSingleton;->t:Ljava/lang/ref/WeakReference;
    if-eqz v0, :return
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/melodix/music/MainActivity;
    if-eqz v0, :return

    new-instance v1, Lcom/melodix/music/StartupLoadWatchdog;
    invoke-direct {v1, v0}, Lcom/melodix/music/StartupLoadWatchdog;-><init>(Lcom/melodix/music/MainActivity;)V
    const-wide/16 v2, 0x7530
    invoke-virtual {p0, v1, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    :return
    return-void
.end method

.method public final run()V
    .locals 4

    sget v0, Lcom/melodix/music/StartupLoadWatchdog;->generation:I
    iget v1, p0, Lcom/melodix/music/StartupLoadWatchdog;->generationAtArm:I
    if-ne v0, v1, :return

    iget-object v0, p0, Lcom/melodix/music/StartupLoadWatchdog;->activity:Ljava/lang/ref/WeakReference;
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/melodix/music/MainActivity;
    if-eqz v0, :return

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z
    move-result v1
    if-nez v1, :return

    iget-object v1, v0, Lcom/melodix/music/MainActivity;->H:Landroidx/constraintlayout/widget/ConstraintLayout;
    if-eqz v1, :return
    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I
    move-result v1
    if-nez v1, :return

    iget-object v1, v0, Lcom/melodix/music/MainActivity;->R:Landroid/widget/ProgressBar;
    if-eqz v1, :show_error
    const/16 v2, 0x8
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    :show_error
    const/4 v1, 0x0
    sput-boolean v1, Lcom/melodix/music/AppSingleton;->m:Z
    const/4 v1, -0x1
    sput v1, Lcom/melodix/music/AppSingleton;->n:I
    const/4 v1, 0x1
    invoke-virtual {v0, v1}, Lcom/melodix/music/MainActivity;->D(Z)V

    :return
    return-void
.end method
