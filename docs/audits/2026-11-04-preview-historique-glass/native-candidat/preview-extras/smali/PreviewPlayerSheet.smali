.class public final Lcom/melodix/music/PreviewPlayerSheet;
.super Landroid/app/Dialog;
.source "PreviewPlayerSheet.java"


# instance fields
.field private final activity:Landroid/app/Activity;

.field private closing:Z

.field private panel:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/app/Activity;)V
    .locals 0

    .prologue
    .line 21
    invoke-direct {p0, p1}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerSheet;->activity:Landroid/app/Activity;

    return-void
.end method

.method static synthetic access$0(Lcom/melodix/music/PreviewPlayerSheet;)Z
    .locals 1

    .prologue
    .line 19
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerSheet;->closing:Z

    return v0
.end method

.method static synthetic access$1(Lcom/melodix/music/PreviewPlayerSheet;)Landroid/view/View;
    .locals 1

    .prologue
    .line 18
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerSheet;->panel:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$2(Lcom/melodix/music/PreviewPlayerSheet;)F
    .locals 1

    .prologue
    .line 24
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerSheet;->travel()F

    move-result v0

    return v0
.end method

.method static synthetic access$3(Lcom/melodix/music/PreviewPlayerSheet;F)I
    .locals 1

    .prologue
    .line 22
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerSheet;->dp(F)I

    move-result v0

    return v0
.end method

.method static synthetic access$4(Lcom/melodix/music/PreviewPlayerSheet;)Landroid/app/Activity;
    .locals 1

    .prologue
    .line 17
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerSheet;->activity:Landroid/app/Activity;

    return-object v0
.end method

.method static synthetic access$5(Lcom/melodix/music/PreviewPlayerSheet;)Z
    .locals 1

    .prologue
    .line 23
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerSheet;->motionOff()Z

    move-result v0

    return v0
.end method

.method private dp(F)I
    .locals 2

    .prologue
    .line 22
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerSheet;->activity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr v0, p1

    const/high16 v1, 0x3f000000    # 0.5f

    add-float/2addr v0, v1

    float-to-int v0, v0

    return v0
.end method

.method private motionOff()Z
    .locals 2

    .prologue
    .line 23
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-lt v0, v1, :cond_0

    invoke-static {}, Landroid/animation/ValueAnimator;->areAnimatorsEnabled()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private travel()F
    .locals 2

    .prologue
    .line 24
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerSheet;->panel:Landroid/view/View;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    const/high16 v1, 0x43960000    # 300.0f

    invoke-direct {p0, v1}, Lcom/melodix/music/PreviewPlayerSheet;->dp(F)I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    int-to-float v0, v0

    return v0

    :cond_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerSheet;->panel:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v0

    goto :goto_0
.end method


# virtual methods
.method public dismiss()V
    .locals 4

    .prologue
    .line 42
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerSheet;->closing:Z

    if-eqz v0, :cond_0

    .line 50
    :goto_0
    return-void

    .line 43
    :cond_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerSheet;->panel:Landroid/view/View;

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerSheet;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerSheet;->activity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerSheet;->activity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerSheet;->motionOff()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 44
    :cond_1
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerSheet;->dismissImmediately()V

    goto :goto_0

    .line 46
    :cond_2
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerSheet;->closing:Z

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerSheet;->panel:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 47
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerSheet;->panel:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerSheet;->travel()F

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const-wide/16 v2, 0x118

    invoke-virtual {v0, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    new-instance v1, Landroid/view/animation/DecelerateInterpolator;

    const v2, 0x3fa66666    # 1.3f

    invoke-direct {v1, v2}, Landroid/view/animation/DecelerateInterpolator;-><init>(F)V

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    new-instance v1, Lcom/melodix/music/PreviewPlayerSheet$2;

    invoke-direct {v1, p0}, Lcom/melodix/music/PreviewPlayerSheet$2;-><init>(Lcom/melodix/music/PreviewPlayerSheet;)V

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    .line 49
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    goto :goto_0
.end method

.method public dismissImmediately()V
    .locals 1

    .prologue
    .line 53
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerSheet;->closing:Z

    .line 54
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerSheet;->panel:Landroid/view/View;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerSheet;->panel:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 55
    :cond_0
    invoke-super {p0}, Landroid/app/Dialog;->dismiss()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerSheet;->panel:Landroid/view/View;

    .line 56
    return-void
.end method

.method public dragListener()Landroid/view/View$OnTouchListener;
    .locals 1

    .prologue
    .line 59
    new-instance v0, Lcom/melodix/music/PreviewPlayerSheet$3;

    invoke-direct {v0, p0}, Lcom/melodix/music/PreviewPlayerSheet$3;-><init>(Lcom/melodix/music/PreviewPlayerSheet;)V

    return-object v0
.end method

.method public showSheet(Landroid/view/View;)V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 27
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerSheet;->panel:Landroid/view/View;

    iput-boolean v2, p0, Lcom/melodix/music/PreviewPlayerSheet;->closing:Z

    invoke-virtual {p0, p1}, Lcom/melodix/music/PreviewPlayerSheet;->setContentView(Landroid/view/View;)V

    .line 28
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerSheet;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0, v2}, Landroid/view/Window;->setWindowAnimations(I)V

    .line 29
    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 30
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerSheet;->motionOff()Z

    move-result v0

    if-nez v0, :cond_1

    const/high16 v0, 0x43960000    # 300.0f

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerSheet;->dp(F)I

    move-result v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerSheet;->activity:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->heightPixels:I

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p1, v0}, Landroid/view/View;->setTranslationY(F)V

    .line 31
    :cond_1
    invoke-super {p0}, Landroid/app/Dialog;->show()V

    .line 32
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerSheet;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-nez v0, :cond_2

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerSheet;->dismissImmediately()V

    .line 40
    :goto_0
    return-void

    .line 33
    :cond_2
    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v1, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v0, v1}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    const/16 v1, 0x50

    invoke-virtual {v0, v1}, Landroid/view/Window;->setGravity(I)V

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-virtual {v0, v1, v2}, Landroid/view/Window;->setLayout(II)V

    .line 34
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerSheet;->motionOff()Z

    move-result v0

    if-nez v0, :cond_3

    new-instance v0, Lcom/melodix/music/PreviewPlayerSheet$1;

    invoke-direct {v0, p0, p1}, Lcom/melodix/music/PreviewPlayerSheet$1;-><init>(Lcom/melodix/music/PreviewPlayerSheet;Landroid/view/View;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    .line 39
    :cond_3
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setTranslationY(F)V

    goto :goto_0
.end method
