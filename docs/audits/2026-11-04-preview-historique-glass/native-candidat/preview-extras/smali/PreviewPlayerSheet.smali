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

    .line 35
    invoke-direct {p0, p1}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerSheet;->activity:Landroid/app/Activity;

    return-void
.end method

.method static synthetic access$000(Lcom/melodix/music/PreviewPlayerSheet;)Z
    .locals 0

    .line 20
    iget-boolean p0, p0, Lcom/melodix/music/PreviewPlayerSheet;->closing:Z

    return p0
.end method

.method static synthetic access$100(Lcom/melodix/music/PreviewPlayerSheet;)Landroid/view/View;
    .locals 0

    .line 20
    iget-object p0, p0, Lcom/melodix/music/PreviewPlayerSheet;->panel:Landroid/view/View;

    return-object p0
.end method

.method static synthetic access$200(Lcom/melodix/music/PreviewPlayerSheet;)F
    .locals 0

    .line 20
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerSheet;->travel()F

    move-result p0

    return p0
.end method

.method static synthetic access$300(Lcom/melodix/music/PreviewPlayerSheet;F)I
    .locals 0

    .line 20
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerSheet;->dp(F)I

    move-result p0

    return p0
.end method

.method static synthetic access$400(Lcom/melodix/music/PreviewPlayerSheet;)Landroid/app/Activity;
    .locals 0

    .line 20
    iget-object p0, p0, Lcom/melodix/music/PreviewPlayerSheet;->activity:Landroid/app/Activity;

    return-object p0
.end method

.method static synthetic access$500(Lcom/melodix/music/PreviewPlayerSheet;)Z
    .locals 0

    .line 20
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerSheet;->motionOff()Z

    move-result p0

    return p0
.end method

.method public static actionBackground(Landroid/content/Context;Z)Landroid/graphics/drawable/GradientDrawable;
    .locals 2

    .line 33
    if-eqz p1, :cond_0

    const v0, -0xa8be84

    goto :goto_0

    :cond_0
    const v0, 0xcffffff

    :goto_0
    if-eqz p1, :cond_1

    const p1, 0x45bca2ed

    goto :goto_1

    :cond_1
    const p1, 0x20ffffff

    :goto_1
    const v1, 0x4479c000    # 999.0f

    invoke-static {p0, v0, p1, v1}, Lcom/melodix/music/PreviewPlayerSheet;->surface(Landroid/content/Context;IIF)Landroid/graphics/drawable/GradientDrawable;

    move-result-object p0

    return-object p0
.end method

.method public static background(Landroid/content/Context;)Landroid/graphics/drawable/GradientDrawable;
    .locals 4

    .line 30
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const/high16 v1, 0x41e00000    # 28.0f

    invoke-static {p0, v1}, Lcom/melodix/music/PreviewPlayerSheet;->pixels(Landroid/content/Context;F)I

    move-result v1

    int-to-float v1, v1

    const/16 v2, 0x8

    new-array v2, v2, [F

    const/4 v3, 0x0

    aput v1, v2, v3

    const/4 v3, 0x1

    aput v1, v2, v3

    const/4 v3, 0x2

    aput v1, v2, v3

    const/4 v3, 0x3

    aput v1, v2, v3

    const/4 v1, 0x4

    const/4 v3, 0x0

    aput v3, v2, v1

    const/4 v1, 0x5

    aput v3, v2, v1

    const/4 v1, 0x6

    aput v3, v2, v1

    const/4 v1, 0x7

    aput v3, v2, v1

    invoke-virtual {v0, v2}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadii([F)V

    const v1, -0xdfe8d1

    const v2, -0xeef1e7

    filled-new-array {v1, v2}, [I

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setColors([I)V

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-static {p0, v1}, Lcom/melodix/music/PreviewPlayerSheet;->pixels(Landroid/content/Context;F)I

    move-result p0

    const v1, 0x24ffffff

    invoke-virtual {v0, p0, v1}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    return-object v0
.end method

.method private dp(F)I
    .locals 1

    .line 36
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerSheet;->activity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr p1, v0

    const/high16 v0, 0x3f000000    # 0.5f

    add-float/2addr p1, v0

    float-to-int p1, p1

    return p1
.end method

.method private motionOff()Z
    .locals 2

    .line 37
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-lt v0, v1, :cond_0

    invoke-static {}, Landroid/animation/ValueAnimator;->areAnimatorsEnabled()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private static pixels(Landroid/content/Context;F)I
    .locals 0

    .line 25
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    iget p0, p0, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr p1, p0

    const/high16 p0, 0x3f000000    # 0.5f

    add-float/2addr p1, p0

    float-to-int p0, p1

    return p0
.end method

.method public static surface(Landroid/content/Context;IIF)Landroid/graphics/drawable/GradientDrawable;
    .locals 1

    .line 27
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    const/high16 p1, 0x3f800000    # 1.0f

    invoke-static {p0, p1}, Lcom/melodix/music/PreviewPlayerSheet;->pixels(Landroid/content/Context;F)I

    move-result p1

    invoke-virtual {v0, p1, p2}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    invoke-static {p0, p3}, Lcom/melodix/music/PreviewPlayerSheet;->pixels(Landroid/content/Context;F)I

    move-result p0

    int-to-float p0, p0

    invoke-virtual {v0, p0}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    return-object v0
.end method

.method private travel()F
    .locals 2

    .line 38
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerSheet;->panel:Landroid/view/View;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerSheet;->panel:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v0

    :goto_0
    const/high16 v1, 0x43960000    # 300.0f

    invoke-direct {p0, v1}, Lcom/melodix/music/PreviewPlayerSheet;->dp(F)I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    int-to-float v0, v0

    return v0
.end method


# virtual methods
.method public dismiss()V
    .locals 3

    .line 57
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerSheet;->closing:Z

    if-eqz v0, :cond_0

    return-void

    .line 58
    :cond_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerSheet;->panel:Landroid/view/View;

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerSheet;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerSheet;->activity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerSheet;->activity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerSheet;->motionOff()Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    .line 61
    :cond_1
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerSheet;->closing:Z

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerSheet;->panel:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 62
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerSheet;->panel:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerSheet;->travel()F

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/high16 v1, 0x3f000000    # 0.5f

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const-wide/16 v1, 0xf0

    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    new-instance v1, Landroid/view/animation/AccelerateInterpolator;

    const v2, 0x3fb33333    # 1.4f

    invoke-direct {v1, v2}, Landroid/view/animation/AccelerateInterpolator;-><init>(F)V

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    new-instance v1, Lcom/melodix/music/PreviewPlayerSheet$2;

    invoke-direct {v1, p0}, Lcom/melodix/music/PreviewPlayerSheet$2;-><init>(Lcom/melodix/music/PreviewPlayerSheet;)V

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    .line 64
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 65
    return-void

    .line 59
    :cond_2
    :goto_0
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerSheet;->dismissImmediately()V

    return-void
.end method

.method public dismissImmediately()V
    .locals 1

    .line 68
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerSheet;->closing:Z

    .line 69
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerSheet;->panel:Landroid/view/View;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerSheet;->panel:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 70
    :cond_0
    invoke-super {p0}, Landroid/app/Dialog;->dismiss()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerSheet;->panel:Landroid/view/View;

    .line 71
    return-void
.end method

.method public dragListener()Landroid/view/View$OnTouchListener;
    .locals 1

    .line 74
    new-instance v0, Lcom/melodix/music/PreviewPlayerSheet$3;

    invoke-direct {v0, p0}, Lcom/melodix/music/PreviewPlayerSheet$3;-><init>(Lcom/melodix/music/PreviewPlayerSheet;)V

    return-object v0
.end method

.method public showSheet(Landroid/view/View;)V
    .locals 3

    .line 41
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerSheet;->panel:Landroid/view/View;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerSheet;->closing:Z

    invoke-virtual {p0, p1}, Lcom/melodix/music/PreviewPlayerSheet;->setContentView(Landroid/view/View;)V

    .line 42
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerSheet;->getWindow()Landroid/view/Window;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v1, v0}, Landroid/view/Window;->setWindowAnimations(I)V

    .line 43
    :cond_0
    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {p1, v1}, Landroid/view/View;->setAlpha(F)V

    .line 44
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerSheet;->motionOff()Z

    move-result v1

    if-nez v1, :cond_1

    const/high16 v1, 0x43960000    # 300.0f

    invoke-direct {p0, v1}, Lcom/melodix/music/PreviewPlayerSheet;->dp(F)I

    move-result v1

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerSheet;->activity:Landroid/app/Activity;

    invoke-virtual {v2}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->heightPixels:I

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {p1, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 45
    :cond_1
    invoke-super {p0}, Landroid/app/Dialog;->show()V

    .line 46
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerSheet;->getWindow()Landroid/view/Window;

    move-result-object v1

    if-nez v1, :cond_2

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerSheet;->dismissImmediately()V

    return-void

    .line 47
    :cond_2
    new-instance v2, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v2, v0}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v1, v2}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    const/16 v0, 0x50

    invoke-virtual {v1, v0}, Landroid/view/Window;->setGravity(I)V

    const/4 v0, -0x1

    const/4 v2, -0x2

    invoke-virtual {v1, v0, v2}, Landroid/view/Window;->setLayout(II)V

    .line 48
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerSheet;->motionOff()Z

    move-result v0

    if-nez v0, :cond_3

    new-instance v0, Lcom/melodix/music/PreviewPlayerSheet$1;

    invoke-direct {v0, p0, p1}, Lcom/melodix/music/PreviewPlayerSheet$1;-><init>(Lcom/melodix/music/PreviewPlayerSheet;Landroid/view/View;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    .line 54
    :cond_3
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setTranslationY(F)V

    .line 55
    :goto_0
    return-void
.end method
