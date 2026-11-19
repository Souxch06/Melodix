.class public final Lcom/melodix/music/PreviewPlayerChrome;
.super Landroid/view/View;
.source "PreviewPlayerChrome.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/melodix/music/PreviewPlayerChrome$DismissGesture;,
        Lcom/melodix/music/PreviewPlayerChrome$PressEffect;
    }
.end annotation


# static fields
.field private static final PLAYER_STATUS_COLOR:I = -0xf5f9ec

.field private static sizeInfo:Ljava/lang/String;

.field static state:Ljava/lang/String;

.field private static tintInfo:Ljava/lang/String;


# instance fields
.field private appliedBackground:Landroid/graphics/drawable/Drawable;

.field private artPlaying:Ljava/lang/Boolean;

.field private artScale:F

.field private backdrop:Landroid/graphics/drawable/Drawable;

.field private bottomColors:[I

.field private bypassClose:Z

.field private chromeApplied:Z

.field private closing:Z

.field private header:Landroid/view/View;

.field private headerHidden:Z

.field private lastNavColor:I

.field private lastStatusColor:I

.field private likeArt:Lcom/melodix/music/PreviewPlayerLikeArt;

.field private likeControl:Landroid/view/View;

.field private navOverlay:Landroid/graphics/drawable/GradientDrawable;

.field private observer:Landroid/view/ViewTreeObserver;

.field private originalNavColor:I

.field private originalNavContrast:Z

.field private originalStatusColor:I

.field private originalStatusFlags:I

.field private originalStatusUi:I

.field private panel:Landroid/view/View;

.field private panelBackground:Landroid/graphics/drawable/Drawable;

.field private playStyled:Z

.field private previousHeaderVisibility:I

.field private previousScreen:Landroid/graphics/Bitmap;

.field private repeatArt:Lcom/melodix/music/PreviewPlayerDecoration;

.field private repeatControl:Landroid/view/View;

.field private root:Landroid/view/View;

.field private rootBackground:Landroid/graphics/drawable/Drawable;

.field private scrim:Landroid/graphics/drawable/GradientDrawable;

.field private setupDone:Z

.field private shuffleControl:Landroid/view/View;

.field private shuffleDot:Lcom/melodix/music/PreviewPlayerDecoration;

.field private statusDecor:Landroid/view/View;

.field private statusOverlay:Landroid/graphics/drawable/GradientDrawable;

.field private statusWindow:Landroid/view/Window;

.field private final syncTask:Ljava/lang/Runnable;

.field private ticking:Z

.field private tintLayer:Landroid/graphics/drawable/GradientDrawable;

.field private tintSource:Landroid/graphics/drawable/Drawable;

.field private topColors:[I

.field private final visualTick:Ljava/lang/Runnable;

.field private wasVisible:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 235
    const-string v0, "non affich\u00e9"

    sput-object v0, Lcom/melodix/music/PreviewPlayerChrome;->state:Ljava/lang/String;

    .line 236
    const-string v0, "\u2014"

    sput-object v0, Lcom/melodix/music/PreviewPlayerChrome;->tintInfo:Ljava/lang/String;

    sput-object v0, Lcom/melodix/music/PreviewPlayerChrome;->sizeInfo:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 77
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 50
    const p1, -0xedf2e2

    filled-new-array {p1, p1, p1}, [I

    move-result-object p1

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerChrome;->topColors:[I

    const p1, -0xf6f9ed

    filled-new-array {p1, p1, p1}, [I

    move-result-object p1

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerChrome;->bottomColors:[I

    .line 56
    new-instance p1, Lcom/melodix/music/PreviewPlayerChrome$1;

    invoke-direct {p1, p0}, Lcom/melodix/music/PreviewPlayerChrome$1;-><init>(Lcom/melodix/music/PreviewPlayerChrome;)V

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerChrome;->visualTick:Ljava/lang/Runnable;

    .line 76
    new-instance p1, Lcom/melodix/music/PreviewPlayerChrome$2;

    invoke-direct {p1, p0}, Lcom/melodix/music/PreviewPlayerChrome$2;-><init>(Lcom/melodix/music/PreviewPlayerChrome;)V

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerChrome;->syncTask:Ljava/lang/Runnable;

    .line 238
    const/high16 p1, 0x3f800000    # 1.0f

    iput p1, p0, Lcom/melodix/music/PreviewPlayerChrome;->artScale:F

    .line 77
    return-void
.end method

.method static synthetic access$000(Lcom/melodix/music/PreviewPlayerChrome;)Z
    .locals 0

    .line 36
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerChrome;->playerVisible()Z

    move-result p0

    return p0
.end method

.method static synthetic access$1000(Lcom/melodix/music/PreviewPlayerChrome;)Landroid/view/View;
    .locals 0

    .line 36
    iget-object p0, p0, Lcom/melodix/music/PreviewPlayerChrome;->shuffleControl:Landroid/view/View;

    return-object p0
.end method

.method static synthetic access$102(Lcom/melodix/music/PreviewPlayerChrome;Z)Z
    .locals 0

    .line 36
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerChrome;->ticking:Z

    return p1
.end method

.method static synthetic access$1100(Lcom/melodix/music/PreviewPlayerChrome;)V
    .locals 0

    .line 36
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerChrome;->sync()V

    return-void
.end method

.method static synthetic access$1200(Lcom/melodix/music/PreviewPlayerChrome;F)V
    .locals 0

    .line 36
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerChrome;->updateStatusForTranslation(F)V

    return-void
.end method

.method static synthetic access$1300(Lcom/melodix/music/PreviewPlayerChrome;)Z
    .locals 0

    .line 36
    iget-boolean p0, p0, Lcom/melodix/music/PreviewPlayerChrome;->closing:Z

    return p0
.end method

.method static synthetic access$1302(Lcom/melodix/music/PreviewPlayerChrome;Z)Z
    .locals 0

    .line 36
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerChrome;->closing:Z

    return p1
.end method

.method static synthetic access$1402(Lcom/melodix/music/PreviewPlayerChrome;Z)Z
    .locals 0

    .line 36
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerChrome;->bypassClose:Z

    return p1
.end method

.method static synthetic access$1500(Lcom/melodix/music/PreviewPlayerChrome;F)I
    .locals 0

    .line 36
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result p0

    return p0
.end method

.method static synthetic access$1600(Lcom/melodix/music/PreviewPlayerChrome;)V
    .locals 0

    .line 36
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerChrome;->navigateBack()V

    return-void
.end method

.method static synthetic access$1700(Lcom/melodix/music/PreviewPlayerChrome;Landroid/view/View;)Landroid/animation/ValueAnimator$AnimatorUpdateListener;
    .locals 0

    .line 36
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerChrome;->followStatus(Landroid/view/View;)Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$200(Lcom/melodix/music/PreviewPlayerChrome;)Landroid/app/Activity;
    .locals 0

    .line 36
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerChrome;->activity()Landroid/app/Activity;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$300(Lcom/melodix/music/PreviewPlayerChrome;Landroid/app/Activity;)V
    .locals 0

    .line 36
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerChrome;->updateTint(Landroid/app/Activity;)V

    return-void
.end method

.method static synthetic access$400(Lcom/melodix/music/PreviewPlayerChrome;Landroid/app/Activity;)V
    .locals 0

    .line 36
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerChrome;->breathe(Landroid/app/Activity;)V

    return-void
.end method

.method static synthetic access$500(Lcom/melodix/music/PreviewPlayerChrome;)Lcom/melodix/music/PreviewPlayerDecoration;
    .locals 0

    .line 36
    iget-object p0, p0, Lcom/melodix/music/PreviewPlayerChrome;->repeatArt:Lcom/melodix/music/PreviewPlayerDecoration;

    return-object p0
.end method

.method static synthetic access$600(Lcom/melodix/music/PreviewPlayerChrome;)Landroid/view/View;
    .locals 0

    .line 36
    iget-object p0, p0, Lcom/melodix/music/PreviewPlayerChrome;->repeatControl:Landroid/view/View;

    return-object p0
.end method

.method static synthetic access$700(Lcom/melodix/music/PreviewPlayerChrome;)Lcom/melodix/music/PreviewPlayerLikeArt;
    .locals 0

    .line 36
    iget-object p0, p0, Lcom/melodix/music/PreviewPlayerChrome;->likeArt:Lcom/melodix/music/PreviewPlayerLikeArt;

    return-object p0
.end method

.method static synthetic access$800(Lcom/melodix/music/PreviewPlayerChrome;)Landroid/view/View;
    .locals 0

    .line 36
    iget-object p0, p0, Lcom/melodix/music/PreviewPlayerChrome;->likeControl:Landroid/view/View;

    return-object p0
.end method

.method static synthetic access$900(Lcom/melodix/music/PreviewPlayerChrome;)Lcom/melodix/music/PreviewPlayerDecoration;
    .locals 0

    .line 36
    iget-object p0, p0, Lcom/melodix/music/PreviewPlayerChrome;->shuffleDot:Lcom/melodix/music/PreviewPlayerDecoration;

    return-object p0
.end method

.method private activity()Landroid/app/Activity;
    .locals 3

    .line 80
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerChrome;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 81
    const/4 v1, 0x0

    :goto_0
    const/16 v2, 0x8

    if-ge v1, v2, :cond_2

    instance-of v2, v0, Landroid/content/ContextWrapper;

    if-eqz v2, :cond_2

    .line 82
    instance-of v2, v0, Landroid/app/Activity;

    if-eqz v2, :cond_0

    check-cast v0, Landroid/app/Activity;

    return-object v0

    .line 83
    :cond_0
    move-object v2, v0

    check-cast v2, Landroid/content/ContextWrapper;

    invoke-virtual {v2}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object v2

    if-ne v2, v0, :cond_1

    goto :goto_1

    .line 81
    :cond_1
    add-int/lit8 v1, v1, 0x1

    move-object v0, v2

    goto :goto_0

    .line 85
    :cond_2
    :goto_1
    instance-of v1, v0, Landroid/app/Activity;

    if-eqz v1, :cond_3

    check-cast v0, Landroid/app/Activity;

    goto :goto_2

    :cond_3
    const/4 v0, 0x0

    :goto_2
    return-object v0
.end method

.method private applyBackground(Landroid/app/Activity;)V
    .locals 9

    .line 209
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->chromeApplied:Z

    if-eqz v0, :cond_0

    return-void

    .line 210
    :cond_0
    const v0, 0x7f09022f

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->root:Landroid/view/View;

    const v0, 0x7f09023a

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerChrome;->panel:Landroid/view/View;

    .line 211
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerChrome;->root:Landroid/view/View;

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerChrome;->panel:Landroid/view/View;

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerChrome;->panel:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    if-nez p1, :cond_1

    goto/16 :goto_0

    .line 212
    :cond_1
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerChrome;->root:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerChrome;->rootBackground:Landroid/graphics/drawable/Drawable;

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerChrome;->panel:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerChrome;->panelBackground:Landroid/graphics/drawable/Drawable;

    .line 213
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerChrome;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerChrome;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v0

    const v1, 0x7f08013c

    invoke-virtual {p1, v1, v0}, Landroid/content/res/Resources;->getDrawable(ILandroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerChrome;->appliedBackground:Landroid/graphics/drawable/Drawable;

    .line 214
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerChrome;->root:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getPaddingLeft()I

    move-result p1

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->root:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getPaddingTop()I

    move-result v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->root:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getPaddingRight()I

    move-result v1

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerChrome;->root:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getPaddingBottom()I

    move-result v2

    .line 215
    new-instance v3, Landroid/graphics/drawable/GradientDrawable;

    sget-object v4, Landroid/graphics/drawable/GradientDrawable$Orientation;->TOP_BOTTOM:Landroid/graphics/drawable/GradientDrawable$Orientation;

    const/4 v5, 0x0

    filled-new-array {v5, v5}, [I

    move-result-object v6

    invoke-direct {v3, v4, v6}, Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable$Orientation;[I)V

    iput-object v3, p0, Lcom/melodix/music/PreviewPlayerChrome;->tintLayer:Landroid/graphics/drawable/GradientDrawable;

    .line 217
    new-instance v3, Landroid/graphics/drawable/GradientDrawable;

    sget-object v4, Landroid/graphics/drawable/GradientDrawable$Orientation;->TOP_BOTTOM:Landroid/graphics/drawable/GradientDrawable$Orientation;

    const v6, -0x4cf5f9ec

    const v7, -0xdf5f9ec

    const v8, 0x400a0614

    filled-new-array {v8, v6, v7}, [I

    move-result-object v6

    invoke-direct {v3, v4, v6}, Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable$Orientation;[I)V

    iput-object v3, p0, Lcom/melodix/music/PreviewPlayerChrome;->scrim:Landroid/graphics/drawable/GradientDrawable;

    .line 218
    new-instance v3, Landroid/graphics/drawable/LayerDrawable;

    const/4 v4, 0x4

    new-array v4, v4, [Landroid/graphics/drawable/Drawable;

    iget-object v6, p0, Lcom/melodix/music/PreviewPlayerChrome;->appliedBackground:Landroid/graphics/drawable/Drawable;

    aput-object v6, v4, v5

    new-instance v6, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v6, v5}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    const/4 v5, 0x1

    aput-object v6, v4, v5

    const/4 v6, 0x2

    iget-object v7, p0, Lcom/melodix/music/PreviewPlayerChrome;->scrim:Landroid/graphics/drawable/GradientDrawable;

    aput-object v7, v4, v6

    const/4 v6, 0x3

    iget-object v7, p0, Lcom/melodix/music/PreviewPlayerChrome;->tintLayer:Landroid/graphics/drawable/GradientDrawable;

    aput-object v7, v4, v6

    invoke-direct {v3, v4}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    iput-object v3, p0, Lcom/melodix/music/PreviewPlayerChrome;->appliedBackground:Landroid/graphics/drawable/Drawable;

    .line 221
    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerChrome;->rootBackground:Landroid/graphics/drawable/Drawable;

    iput-object v3, p0, Lcom/melodix/music/PreviewPlayerChrome;->backdrop:Landroid/graphics/drawable/Drawable;

    .line 222
    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerChrome;->previousScreen:Landroid/graphics/Bitmap;

    if-eqz v3, :cond_2

    new-instance v3, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerChrome;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    iget-object v6, p0, Lcom/melodix/music/PreviewPlayerChrome;->previousScreen:Landroid/graphics/Bitmap;

    invoke-direct {v3, v4, v6}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    const/16 v4, 0x77

    invoke-virtual {v3, v4}, Landroid/graphics/drawable/BitmapDrawable;->setGravity(I)V

    invoke-virtual {v3, v5}, Landroid/graphics/drawable/BitmapDrawable;->setFilterBitmap(Z)V

    iput-object v3, p0, Lcom/melodix/music/PreviewPlayerChrome;->backdrop:Landroid/graphics/drawable/Drawable;

    .line 223
    :cond_2
    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerChrome;->root:Landroid/view/View;

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerChrome;->backdrop:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v3, v4}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerChrome;->root:Landroid/view/View;

    invoke-virtual {v3, p1, v0, v1, v2}, Landroid/view/View;->setPadding(IIII)V

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerChrome;->panel:Landroid/view/View;

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->appliedBackground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerChrome;->tintSource:Landroid/graphics/drawable/Drawable;

    .line 224
    iput-boolean v5, p0, Lcom/melodix/music/PreviewPlayerChrome;->chromeApplied:Z

    .line 225
    return-void

    .line 211
    :cond_3
    :goto_0
    return-void
.end method

.method private applyStatusBar(Landroid/app/Activity;)V
    .locals 6

    .line 146
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p1

    if-nez p1, :cond_0

    return-void

    .line 147
    :cond_0
    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    if-nez v0, :cond_1

    return-void

    .line 148
    :cond_1
    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->statusWindow:Landroid/view/Window;

    const/4 v2, 0x0

    if-nez v1, :cond_3

    .line 149
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerChrome;->statusWindow:Landroid/view/Window;

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->statusDecor:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/Window;->getStatusBarColor()I

    move-result v1

    iput v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->originalStatusColor:I

    invoke-virtual {p1}, Landroid/view/Window;->getNavigationBarColor()I

    move-result v1

    iput v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->originalNavColor:I

    .line 150
    invoke-virtual {p1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v1

    iget v1, v1, Landroid/view/WindowManager$LayoutParams;->flags:I

    iput v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->originalStatusFlags:I

    invoke-virtual {v0}, Landroid/view/View;->getSystemUiVisibility()I

    move-result v1

    iput v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->originalStatusUi:I

    .line 151
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x1d

    if-lt v1, v3, :cond_2

    invoke-virtual {p1}, Landroid/view/Window;->isNavigationBarContrastEnforced()Z

    move-result v1

    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->originalNavContrast:Z

    invoke-virtual {p1, v2}, Landroid/view/Window;->setNavigationBarContrastEnforced(Z)V

    .line 152
    :cond_2
    const/high16 v1, 0xc000000

    invoke-virtual {p1, v1}, Landroid/view/Window;->clearFlags(I)V

    .line 153
    const/high16 v1, -0x80000000

    invoke-virtual {p1, v1}, Landroid/view/Window;->addFlags(I)V

    .line 154
    invoke-virtual {v0}, Landroid/view/View;->getSystemUiVisibility()I

    move-result p1

    and-int/lit16 p1, p1, -0x2011

    invoke-virtual {v0, p1}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 155
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerChrome;->refreshSystemBarColors()V

    .line 159
    :cond_3
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x23

    if-lt p1, v1, :cond_b

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerChrome;->statusDecor:Landroid/view/View;

    if-ne p1, v0, :cond_b

    .line 160
    invoke-virtual {v0}, Landroid/view/View;->getRootWindowInsets()Landroid/view/WindowInsets;

    move-result-object p1

    if-nez p1, :cond_4

    move v1, v2

    goto :goto_0

    :cond_4
    invoke-virtual {p1}, Landroid/view/WindowInsets;->getSystemWindowInsetTop()I

    move-result v1

    :goto_0
    if-nez p1, :cond_5

    move p1, v2

    goto :goto_1

    :cond_5
    invoke-virtual {p1}, Landroid/view/WindowInsets;->getSystemWindowInsetBottom()I

    move-result p1

    .line 161
    :goto_1
    if-lez v1, :cond_7

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v3

    if-lez v3, :cond_7

    .line 162
    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerChrome;->statusOverlay:Landroid/graphics/drawable/GradientDrawable;

    if-nez v3, :cond_6

    new-instance v3, Landroid/graphics/drawable/GradientDrawable;

    sget-object v4, Landroid/graphics/drawable/GradientDrawable$Orientation;->LEFT_RIGHT:Landroid/graphics/drawable/GradientDrawable$Orientation;

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerChrome;->topColors:[I

    invoke-direct {v3, v4, v5}, Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable$Orientation;[I)V

    iput-object v3, p0, Lcom/melodix/music/PreviewPlayerChrome;->statusOverlay:Landroid/graphics/drawable/GradientDrawable;

    invoke-virtual {v0}, Landroid/view/View;->getOverlay()Landroid/view/ViewOverlay;

    move-result-object v3

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerChrome;->statusOverlay:Landroid/graphics/drawable/GradientDrawable;

    invoke-virtual {v3, v4}, Landroid/view/ViewOverlay;->add(Landroid/graphics/drawable/Drawable;)V

    .line 163
    :cond_6
    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerChrome;->statusOverlay:Landroid/graphics/drawable/GradientDrawable;

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v4

    invoke-virtual {v3, v2, v2, v4, v1}, Landroid/graphics/drawable/GradientDrawable;->setBounds(IIII)V

    .line 165
    :cond_7
    if-lez p1, :cond_9

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v1

    if-lez v1, :cond_9

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v1

    if-lez v1, :cond_9

    .line 166
    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->navOverlay:Landroid/graphics/drawable/GradientDrawable;

    if-nez v1, :cond_8

    new-instance v1, Landroid/graphics/drawable/GradientDrawable;

    sget-object v3, Landroid/graphics/drawable/GradientDrawable$Orientation;->LEFT_RIGHT:Landroid/graphics/drawable/GradientDrawable$Orientation;

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerChrome;->bottomColors:[I

    invoke-direct {v1, v3, v4}, Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable$Orientation;[I)V

    iput-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->navOverlay:Landroid/graphics/drawable/GradientDrawable;

    invoke-virtual {v0}, Landroid/view/View;->getOverlay()Landroid/view/ViewOverlay;

    move-result-object v1

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerChrome;->navOverlay:Landroid/graphics/drawable/GradientDrawable;

    invoke-virtual {v1, v3}, Landroid/view/ViewOverlay;->add(Landroid/graphics/drawable/Drawable;)V

    .line 167
    :cond_8
    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->navOverlay:Landroid/graphics/drawable/GradientDrawable;

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v3

    sub-int/2addr v3, p1

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result p1

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v3

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v0

    invoke-virtual {v1, v2, p1, v3, v0}, Landroid/graphics/drawable/GradientDrawable;->setBounds(IIII)V

    .line 169
    :cond_9
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerChrome;->panel:Landroid/view/View;

    if-nez p1, :cond_a

    const/4 p1, 0x0

    goto :goto_2

    :cond_a
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerChrome;->panel:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getTranslationY()F

    move-result p1

    :goto_2
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerChrome;->updateStatusForTranslation(F)V

    .line 171
    :cond_b
    return-void
.end method

.method private static blend(IIF)I
    .locals 5

    .line 173
    invoke-static {p0}, Landroid/graphics/Color;->alpha(I)I

    move-result v0

    int-to-float v0, v0

    invoke-static {p1}, Landroid/graphics/Color;->alpha(I)I

    move-result v1

    invoke-static {p0}, Landroid/graphics/Color;->alpha(I)I

    move-result v2

    sub-int/2addr v1, v2

    int-to-float v1, v1

    mul-float/2addr v1, p2

    add-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    .line 174
    invoke-static {p0}, Landroid/graphics/Color;->red(I)I

    move-result v1

    int-to-float v1, v1

    invoke-static {p1}, Landroid/graphics/Color;->red(I)I

    move-result v2

    invoke-static {p0}, Landroid/graphics/Color;->red(I)I

    move-result v3

    sub-int/2addr v2, v3

    int-to-float v2, v2

    mul-float/2addr v2, p2

    add-float/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    .line 175
    invoke-static {p0}, Landroid/graphics/Color;->green(I)I

    move-result v2

    int-to-float v2, v2

    invoke-static {p1}, Landroid/graphics/Color;->green(I)I

    move-result v3

    invoke-static {p0}, Landroid/graphics/Color;->green(I)I

    move-result v4

    sub-int/2addr v3, v4

    int-to-float v3, v3

    mul-float/2addr v3, p2

    add-float/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    .line 176
    invoke-static {p0}, Landroid/graphics/Color;->blue(I)I

    move-result v3

    int-to-float v3, v3

    invoke-static {p1}, Landroid/graphics/Color;->blue(I)I

    move-result p1

    invoke-static {p0}, Landroid/graphics/Color;->blue(I)I

    move-result p0

    sub-int/2addr p1, p0

    int-to-float p0, p1

    mul-float/2addr p0, p2

    add-float/2addr v3, p0

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result p0

    .line 177
    invoke-static {v0, v1, v2, p0}, Landroid/graphics/Color;->argb(IIII)I

    move-result p0

    return p0
.end method

.method private breathe(Landroid/app/Activity;)V
    .locals 2

    .line 284
    const v0, 0x7f09023e

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const v1, 0x7f09023a

    invoke-virtual {p1, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    .line 285
    if-nez p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    const-string v1, "previewPlayerArtCard"

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object p1

    .line 286
    :goto_0
    if-eqz v0, :cond_6

    if-nez p1, :cond_1

    goto :goto_4

    .line 287
    :cond_1
    invoke-virtual {v0}, Landroid/view/View;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v0

    if-nez v0, :cond_2

    const-string v0, ""

    goto :goto_1

    :cond_2
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 288
    :goto_1
    const-string v1, "Mettre en pause"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_4

    const-string v1, "Lecture demand\u00e9e"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    goto :goto_2

    :cond_3
    const/4 v0, 0x0

    goto :goto_3

    :cond_4
    :goto_2
    const/4 v0, 0x1

    .line 289
    :goto_3
    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->artPlaying:Ljava/lang/Boolean;

    if-eqz v1, :cond_5

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->artPlaying:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-ne v1, v0, :cond_5

    return-void

    .line 290
    :cond_5
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->artPlaying:Ljava/lang/Boolean;

    iget v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->artScale:F

    .line 291
    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 292
    invoke-virtual {p1, v0}, Landroid/view/View;->setScaleX(F)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setScaleY(F)V

    .line 294
    return-void

    .line 286
    :cond_6
    :goto_4
    return-void
.end method

.method public static captureBeforeExpand(Landroid/app/Activity;)V
    .locals 9

    .line 109
    const v0, 0x7f09023a

    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const v1, 0x7f09022f

    invoke-virtual {p0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 110
    const/4 v2, 0x0

    if-nez v0, :cond_0

    move-object v0, v2

    goto :goto_0

    :cond_0
    const-string v3, "previewPlayerChrome"

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v0

    .line 111
    :goto_0
    instance-of v3, v0, Lcom/melodix/music/PreviewPlayerChrome;

    if-eqz v3, :cond_5

    if-nez v1, :cond_1

    goto :goto_4

    .line 112
    :cond_1
    check-cast v0, Lcom/melodix/music/PreviewPlayerChrome;

    .line 113
    iput-object v2, v0, Lcom/melodix/music/PreviewPlayerChrome;->previousScreen:Landroid/graphics/Bitmap;

    .line 114
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x1a

    if-lt v3, v4, :cond_2

    invoke-static {}, Landroid/animation/ValueAnimator;->areAnimatorsEnabled()Z

    move-result v3

    if-nez v3, :cond_2

    return-void

    .line 115
    :cond_2
    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v3

    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v4

    .line 116
    if-lez v3, :cond_4

    if-gtz v4, :cond_3

    goto :goto_3

    .line 119
    :cond_3
    int-to-double v5, v3

    int-to-double v7, v4

    mul-double/2addr v5, v7

    const-wide v7, 0x41324f8000000000L    # 1200000.0

    div-double/2addr v7, v5

    :try_start_0
    invoke-static {v7, v8}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v5

    double-to-float v5, v5

    const/high16 v6, 0x3f800000    # 1.0f

    invoke-static {v6, v5}, Ljava/lang/Math;->min(FF)F

    move-result v5

    .line 120
    int-to-float v3, v3

    mul-float/2addr v3, v5

    float-to-int v3, v3

    const/4 v6, 0x1

    invoke-static {v6, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    int-to-float v4, v4

    mul-float/2addr v4, v5

    float-to-int v4, v4

    invoke-static {v6, v4}, Ljava/lang/Math;->max(II)I

    move-result v4

    sget-object v6, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v3, v4, v6}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v3

    .line 121
    new-instance v4, Landroid/graphics/Canvas;

    invoke-direct {v4, v3}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    invoke-virtual {v4, v5, v5}, Landroid/graphics/Canvas;->scale(FF)V

    invoke-static {p0, v1, v4}, Lcom/melodix/music/PreviewPlayerChrome;->drawNativeSnapshot(Landroid/app/Activity;Landroid/view/View;Landroid/graphics/Canvas;)V

    iput-object v3, v0, Lcom/melodix/music/PreviewPlayerChrome;->previousScreen:Landroid/graphics/Bitmap;
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_0

    .line 122
    goto :goto_2

    :catch_0
    move-exception p0

    goto :goto_1

    :catch_1
    move-exception p0

    :goto_1
    iput-object v2, v0, Lcom/melodix/music/PreviewPlayerChrome;->previousScreen:Landroid/graphics/Bitmap;

    .line 123
    :goto_2
    return-void

    .line 116
    :cond_4
    :goto_3
    return-void

    .line 111
    :cond_5
    :goto_4
    return-void
.end method

.method private static clearConstraintLimits(Landroid/view/View;)V
    .locals 6

    .line 297
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p0

    .line 298
    const/4 v0, 0x2

    new-array v1, v0, [Ljava/lang/String;

    const-string v2, "matchConstraintMaxWidth"

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const/4 v2, 0x1

    const-string v4, "matchConstraintMaxHeight"

    aput-object v4, v1, v2

    move v2, v3

    :goto_0
    if-ge v2, v0, :cond_1

    aget-object v4, v1, v2

    .line 299
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v5

    if-eqz v5, :cond_0

    invoke-virtual {v4, p0, v3}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v4

    .line 298
    :cond_0
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 301
    :cond_1
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "dimensionRatio"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_2

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_2

    :catch_1
    move-exception p0

    .line 302
    :cond_2
    :goto_2
    return-void
.end method

.method private closeAnimated(Landroid/app/Activity;Landroid/view/View;)V
    .locals 3

    .line 409
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->closing:Z

    .line 410
    invoke-virtual {p2}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 411
    invoke-virtual {p2}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {p2}, Landroid/view/View;->getHeight()I

    move-result v1

    const/high16 v2, 0x43960000    # 300.0f

    invoke-direct {p0, v2}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const-wide/16 v1, 0x118

    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    .line 412
    invoke-direct {p0, p2}, Lcom/melodix/music/PreviewPlayerChrome;->followStatus(Landroid/view/View;)Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    new-instance v1, Landroid/view/animation/DecelerateInterpolator;

    const v2, 0x3fa66666    # 1.3f

    invoke-direct {v1, v2}, Landroid/view/animation/DecelerateInterpolator;-><init>(F)V

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    new-instance v1, Lcom/melodix/music/PreviewPlayerChrome$4;

    invoke-direct {v1, p0, p1, p2}, Lcom/melodix/music/PreviewPlayerChrome$4;-><init>(Lcom/melodix/music/PreviewPlayerChrome;Landroid/app/Activity;Landroid/view/View;)V

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    .line 425
    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 426
    return-void
.end method

.method private static contentHeight(Landroid/view/View;)I
    .locals 5

    .line 314
    const-string v0, "previewPlayerSpacer"

    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    .line 315
    :cond_0
    instance-of v0, p0, Landroid/widget/LinearLayout;

    if-eqz v0, :cond_5

    move-object v0, p0

    check-cast v0, Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getOrientation()I

    move-result v2

    const/4 v3, 0x1

    if-eq v2, v3, :cond_1

    goto :goto_2

    .line 316
    :cond_1
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getPaddingTop()I

    move-result p0

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getPaddingBottom()I

    move-result v2

    add-int/2addr p0, v2

    .line 317
    nop

    :goto_0
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v2

    if-ge v1, v2, :cond_4

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    move-result v3

    const/16 v4, 0x8

    if-ne v3, v4, :cond_2

    goto :goto_1

    :cond_2
    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerChrome;->contentHeight(Landroid/view/View;)I

    move-result v3

    add-int/2addr p0, v3

    .line 318
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    instance-of v3, v2, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v3, :cond_3

    check-cast v2, Landroid/view/ViewGroup$MarginLayoutParams;

    iget v3, v2, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    iget v2, v2, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    add-int/2addr v3, v2

    add-int/2addr p0, v3

    .line 317
    :cond_3
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 319
    :cond_4
    return p0

    .line 315
    :cond_5
    :goto_2
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    move-result p0

    return p0
.end method

.method static dominant(Landroid/graphics/Bitmap;)I
    .locals 16

    .line 244
    move-object/from16 v0, p0

    if-eqz v0, :cond_5

    invoke-virtual/range {p0 .. p0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v2

    if-nez v2, :cond_5

    invoke-virtual/range {p0 .. p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    if-lez v2, :cond_5

    invoke-virtual/range {p0 .. p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    if-gtz v2, :cond_0

    goto/16 :goto_3

    .line 245
    :cond_0
    invoke-virtual/range {p0 .. p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    invoke-virtual/range {p0 .. p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    div-int/lit8 v2, v2, 0x18

    const/4 v3, 0x1

    invoke-static {v3, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 246
    const/4 v6, 0x0

    const-wide/16 v7, 0x0

    const-wide/16 v9, 0x0

    const-wide/16 v11, 0x0

    const-wide/16 v13, 0x0

    :goto_0
    invoke-virtual/range {p0 .. p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v15

    if-ge v6, v15, :cond_3

    const/4 v15, 0x0

    :goto_1
    invoke-virtual/range {p0 .. p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    if-ge v15, v1, :cond_2

    .line 247
    invoke-virtual {v0, v15, v6}, Landroid/graphics/Bitmap;->getPixel(II)I

    move-result v1

    invoke-static {v1}, Landroid/graphics/Color;->alpha(I)I

    move-result v4

    const/16 v5, 0x80

    if-ge v4, v5, :cond_1

    move v0, v3

    goto :goto_2

    .line 248
    :cond_1
    invoke-static {v1}, Landroid/graphics/Color;->red(I)I

    move-result v4

    invoke-static {v1}, Landroid/graphics/Color;->green(I)I

    move-result v5

    invoke-static {v1}, Landroid/graphics/Color;->blue(I)I

    move-result v3

    invoke-static {v5, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    invoke-static {v4, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    invoke-static {v1}, Landroid/graphics/Color;->red(I)I

    move-result v4

    invoke-static {v1}, Landroid/graphics/Color;->green(I)I

    move-result v5

    invoke-static {v1}, Landroid/graphics/Color;->blue(I)I

    move-result v0

    invoke-static {v5, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    invoke-static {v4, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 249
    sub-int/2addr v3, v0

    div-int/lit8 v3, v3, 0x20

    const/4 v0, 0x1

    add-int/2addr v3, v0

    .line 250
    invoke-static {v1}, Landroid/graphics/Color;->red(I)I

    move-result v4

    mul-int/2addr v4, v3

    int-to-long v4, v4

    add-long/2addr v9, v4

    invoke-static {v1}, Landroid/graphics/Color;->green(I)I

    move-result v4

    mul-int/2addr v4, v3

    int-to-long v4, v4

    add-long/2addr v11, v4

    invoke-static {v1}, Landroid/graphics/Color;->blue(I)I

    move-result v1

    mul-int/2addr v1, v3

    int-to-long v4, v1

    add-long/2addr v13, v4

    int-to-long v3, v3

    add-long/2addr v7, v3

    .line 246
    :goto_2
    add-int/2addr v15, v2

    move v3, v0

    move-object/from16 v0, p0

    goto :goto_1

    :cond_2
    move v0, v3

    add-int/2addr v6, v2

    move-object/from16 v0, p0

    goto :goto_0

    .line 252
    :cond_3
    const-wide/16 v0, 0x0

    cmp-long v0, v7, v0

    if-nez v0, :cond_4

    const/4 v0, 0x0

    return v0

    .line 253
    :cond_4
    div-long/2addr v9, v7

    long-to-int v0, v9

    div-long/2addr v11, v7

    long-to-int v1, v11

    div-long/2addr v13, v7

    long-to-int v2, v13

    invoke-static {v0, v1, v2}, Landroid/graphics/Color;->rgb(III)I

    move-result v0

    return v0

    .line 244
    :cond_5
    :goto_3
    const/4 v0, 0x0

    return v0
.end method

.method private dp(F)I
    .locals 1

    .line 78
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerChrome;->getResources()Landroid/content/res/Resources;

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

.method private static drawNativeSnapshot(Landroid/app/Activity;Landroid/view/View;Landroid/graphics/Canvas;)V
    .locals 0

    .line 105
    invoke-static {p0, p1, p2}, Lcom/melodix/music/PreviewSnapshotRenderer;->draw(Landroid/app/Activity;Landroid/view/View;Landroid/graphics/Canvas;)V

    .line 106
    return-void
.end method

.method private findCollapse(Landroid/view/View;)Landroid/view/View;
    .locals 2

    .line 391
    invoke-virtual {p1}, Landroid/view/View;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v0

    if-nez v0, :cond_0

    const-string v0, ""

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v0

    :goto_0
    const-string v1, "R\u00e9duire le lecteur"

    invoke-virtual {v1, v0}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    return-object p1

    .line 392
    :cond_1
    instance-of v0, p1, Landroid/view/ViewGroup;

    if-eqz v0, :cond_3

    check-cast p1, Landroid/view/ViewGroup;

    const/4 v0, 0x0

    :goto_1
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_3

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/melodix/music/PreviewPlayerChrome;->findCollapse(Landroid/view/View;)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_2

    return-object v1

    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 393
    :cond_3
    const/4 p1, 0x0

    return-object p1
.end method

.method private followStatus(Landroid/view/View;)Landroid/animation/ValueAnimator$AnimatorUpdateListener;
    .locals 1

    .line 192
    new-instance v0, Lcom/melodix/music/PreviewPlayerChrome$3;

    invoke-direct {v0, p0, p1}, Lcom/melodix/music/PreviewPlayerChrome$3;-><init>(Lcom/melodix/music/PreviewPlayerChrome;Landroid/view/View;)V

    return-object v0
.end method

.method private hideHeader(Landroid/app/Activity;)V
    .locals 2

    .line 89
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->headerHidden:Z

    if-eqz v0, :cond_0

    return-void

    .line 90
    :cond_0
    const v0, 0x7f090230

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const v1, 0x7f09022f

    invoke-virtual {p1, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    .line 91
    if-eqz v0, :cond_3

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    instance-of v1, v1, Landroid/view/View;

    if-nez v1, :cond_1

    goto :goto_0

    .line 92
    :cond_1
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 93
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    if-eq v1, p1, :cond_2

    return-void

    .line 94
    :cond_2
    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->header:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result p1

    iput p1, p0, Lcom/melodix/music/PreviewPlayerChrome;->previousHeaderVisibility:I

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerChrome;->headerHidden:Z

    .line 95
    const/16 p1, 0x8

    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 96
    return-void

    .line 91
    :cond_3
    :goto_0
    return-void
.end method

.method public static interceptBack(Landroid/app/Activity;)Z
    .locals 6

    .line 397
    const v0, 0x7f09023a

    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 398
    const/4 v1, 0x0

    if-eqz v0, :cond_5

    invoke-virtual {v0}, Landroid/view/View;->isShown()Z

    move-result v2

    if-nez v2, :cond_0

    goto :goto_0

    .line 399
    :cond_0
    const-string v2, "previewPlayerChrome"

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v2

    .line 400
    instance-of v3, v2, Lcom/melodix/music/PreviewPlayerChrome;

    if-nez v3, :cond_1

    return v1

    .line 401
    :cond_1
    check-cast v2, Lcom/melodix/music/PreviewPlayerChrome;

    .line 402
    iget-boolean v3, v2, Lcom/melodix/music/PreviewPlayerChrome;->bypassClose:Z

    if-eqz v3, :cond_2

    return v1

    .line 403
    :cond_2
    iget-boolean v3, v2, Lcom/melodix/music/PreviewPlayerChrome;->closing:Z

    const/4 v4, 0x1

    if-eqz v3, :cond_3

    return v4

    .line 404
    :cond_3
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x1a

    if-lt v3, v5, :cond_4

    invoke-static {}, Landroid/animation/ValueAnimator;->areAnimatorsEnabled()Z

    move-result v3

    if-nez v3, :cond_4

    return v1

    .line 405
    :cond_4
    invoke-direct {v2, p0, v0}, Lcom/melodix/music/PreviewPlayerChrome;->closeAnimated(Landroid/app/Activity;Landroid/view/View;)V

    .line 406
    return v4

    .line 398
    :cond_5
    :goto_0
    return v1
.end method

.method private landscape(Landroid/app/Activity;)V
    .locals 11

    .line 322
    const v0, 0x7f09023a

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    instance-of v1, v0, Landroid/widget/ScrollView;

    if-nez v1, :cond_0

    return-void

    .line 323
    :cond_0
    const-string v1, "previewPlayerArtFrame"

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v1

    const-string v2, "previewPlayerArtCard"

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v2

    .line 324
    if-eqz v1, :cond_20

    if-eqz v2, :cond_20

    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    instance-of v3, v3, Landroid/widget/LinearLayout;

    if-nez v3, :cond_1

    goto/16 :goto_d

    .line 325
    :cond_1
    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    check-cast v3, Landroid/widget/LinearLayout;

    .line 327
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerChrome;->getParent()Landroid/view/ViewParent;

    move-result-object v4

    if-eq v3, v4, :cond_1f

    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v4

    instance-of v4, v4, Landroid/widget/LinearLayout;

    if-nez v4, :cond_2

    goto/16 :goto_c

    .line 328
    :cond_2
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerChrome;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v4

    iget v4, v4, Landroid/content/res/Configuration;->orientation:I

    const/4 v5, 0x1

    const/4 v6, 0x0

    if-ne v4, v5, :cond_3

    move v4, v5

    goto :goto_0

    :cond_3
    move v4, v6

    .line 329
    :goto_0
    move-object v7, v0

    check-cast v7, Landroid/widget/ScrollView;

    invoke-virtual {v7}, Landroid/widget/ScrollView;->isFillViewport()Z

    move-result v8

    if-nez v8, :cond_4

    invoke-virtual {v7, v5}, Landroid/widget/ScrollView;->setFillViewport(Z)V

    .line 330
    :cond_4
    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    .line 331
    instance-of v7, v5, Landroid/widget/LinearLayout$LayoutParams;

    if-eqz v7, :cond_5

    check-cast v5, Landroid/widget/LinearLayout$LayoutParams;

    iget v7, v5, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    const/high16 v8, 0x3f800000    # 1.0f

    cmpl-float v7, v7, v8

    if-eqz v7, :cond_5

    .line 332
    iput v6, v5, Landroid/widget/LinearLayout$LayoutParams;->height:I

    iput v8, v5, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    invoke-virtual {v3, v5}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 335
    :cond_5
    nop

    .line 336
    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getOrientation()I

    move-result v5

    const/16 v7, 0x10

    if-eq v5, v4, :cond_9

    .line 337
    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 338
    if-eqz v4, :cond_6

    const/16 v7, 0x11

    :cond_6
    invoke-virtual {v3, v7}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 339
    move v5, v6

    :goto_1
    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v7

    if-ge v5, v7, :cond_a

    .line 340
    invoke-virtual {v3, v5}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v7

    invoke-virtual {v7}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v8

    .line 341
    instance-of v9, v8, Landroid/widget/LinearLayout$LayoutParams;

    if-nez v9, :cond_7

    goto :goto_2

    .line 342
    :cond_7
    check-cast v8, Landroid/widget/LinearLayout$LayoutParams;

    .line 343
    if-eqz v4, :cond_8

    const/4 v9, -0x1

    iput v9, v8, Landroid/widget/LinearLayout$LayoutParams;->width:I

    const/4 v9, 0x0

    iput v9, v8, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    .line 344
    :cond_8
    invoke-virtual {v7, v8}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 339
    :goto_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 346
    :cond_9
    if-nez v4, :cond_a

    invoke-virtual {v3, v7}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 347
    :cond_a
    const/high16 v5, 0x42000000    # 32.0f

    const/high16 v7, 0x42600000    # 56.0f

    if-eqz v4, :cond_b

    invoke-direct {p0, v5}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v8

    goto :goto_3

    :cond_b
    invoke-direct {p0, v7}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v8

    .line 348
    :goto_3
    invoke-virtual {v0}, Landroid/view/View;->getPaddingLeft()I

    move-result v9

    if-eq v9, v8, :cond_c

    invoke-virtual {v0}, Landroid/view/View;->getPaddingTop()I

    move-result v9

    invoke-virtual {v0}, Landroid/view/View;->getPaddingBottom()I

    move-result v10

    invoke-virtual {v0, v8, v9, v8, v10}, Landroid/view/View;->setPadding(IIII)V

    .line 349
    :cond_c
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v8

    .line 350
    instance-of v9, v8, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v9, :cond_10

    .line 351
    check-cast v8, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 352
    if-eqz v4, :cond_d

    move v9, v6

    goto :goto_4

    :cond_d
    const/high16 v9, 0x42400000    # 48.0f

    invoke-direct {p0, v9}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v9

    :goto_4
    if-eqz v4, :cond_e

    goto :goto_5

    :cond_e
    const/high16 v5, 0x41400000    # 12.0f

    :goto_5
    invoke-direct {p0, v5}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v5

    .line 353
    iget v10, v8, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    if-ne v10, v9, :cond_f

    iget v10, v8, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    if-eq v10, v5, :cond_10

    :cond_f
    iput v9, v8, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    iput v5, v8, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    invoke-virtual {v1, v8}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 356
    :cond_10
    const v5, 0x7f09023d

    invoke-virtual {p1, v5}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v8

    const/4 v9, 0x0

    if-nez v8, :cond_11

    move-object p1, v9

    goto :goto_6

    :cond_11
    invoke-virtual {p1, v5}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    :goto_6
    instance-of v5, p1, Landroid/view/ViewGroup;

    if-eqz v5, :cond_12

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v5

    if-eq p1, v5, :cond_12

    .line 357
    move-object v5, p1

    check-cast v5, Landroid/view/ViewGroup;

    invoke-virtual {v5, v6}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    invoke-virtual {v5, v6}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 356
    invoke-interface {p1}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    goto :goto_6

    .line 360
    :cond_12
    nop

    .line 361
    if-eqz v4, :cond_15

    move p1, v6

    :goto_7
    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    if-ge v6, v0, :cond_14

    invoke-virtual {v3, v6}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    if-eq v0, v1, :cond_13

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v5

    const/16 v8, 0x8

    if-eq v5, v8, :cond_13

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerChrome;->contentHeight(Landroid/view/View;)I

    move-result v0

    add-int/2addr p1, v0

    :cond_13
    add-int/lit8 v6, v6, 0x1

    goto :goto_7

    :cond_14
    move v6, p1

    .line 362
    :cond_15
    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result p1

    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getHeight()I

    move-result v0

    if-eqz v4, :cond_16

    sub-int/2addr v0, v6

    invoke-direct {p0, v7}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v3

    goto :goto_8

    :cond_16
    const/high16 v3, 0x42800000    # 64.0f

    invoke-direct {p0, v3}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v3

    :goto_8
    sub-int/2addr v0, v3

    .line 363
    if-lez v0, :cond_1e

    if-gtz p1, :cond_17

    goto/16 :goto_b

    .line 364
    :cond_17
    const/high16 v3, 0x42f00000    # 120.0f

    invoke-direct {p0, v3}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v3

    if-eqz v4, :cond_18

    const/high16 v5, 0x44200000    # 640.0f

    goto :goto_9

    :cond_18
    const/high16 v5, 0x440c0000    # 560.0f

    :goto_9
    invoke-direct {p0, v5}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v5

    invoke-static {v0, v5}, Ljava/lang/Math;->min(II)I

    move-result v0

    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    move-result p1

    invoke-static {v3, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    .line 365
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    .line 368
    const/high16 v5, 0x439f0000    # 318.0f

    invoke-direct {p0, v5}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v5

    invoke-static {p1, v5}, Ljava/lang/Math;->min(II)I

    move-result v5

    .line 369
    iget v6, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    if-ne v6, v5, :cond_19

    iget v6, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-eq v6, v5, :cond_1a

    :cond_19
    iput v5, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    iput v5, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {v2, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 370
    :cond_1a
    iget v0, v3, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-eq v0, p1, :cond_1b

    iput p1, v3, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {v1, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 371
    :cond_1b
    int-to-float v0, p1

    int-to-float v1, v5

    div-float v1, v0, v1

    sub-int/2addr p1, v5

    int-to-float p1, p1

    const/high16 v3, 0x40000000    # 2.0f

    div-float/2addr p1, v3

    invoke-virtual {v2, p1}, Landroid/view/View;->setTranslationY(F)V

    .line 372
    iget p1, p0, Lcom/melodix/music/PreviewPlayerChrome;->artScale:F

    sub-float p1, v1, p1

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    const v3, 0x3c23d70a    # 0.01f

    cmpl-float p1, p1, v3

    if-lez p1, :cond_1c

    iput v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->artScale:F

    iput-object v9, p0, Lcom/melodix/music/PreviewPlayerChrome;->artPlaying:Ljava/lang/Boolean;

    .line 373
    :cond_1c
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    if-eqz v4, :cond_1d

    const-string v1, "portrait"

    goto :goto_a

    :cond_1d
    const-string v1, "paysage"

    :goto_a
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v1, ", carr\u00e9 "

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerChrome;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    div-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " dp, mesur\u00e9 "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, "\u00d7"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " px, \u00e9chelle "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->artScale:F

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    const-string v1, "%.2f"

    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    sput-object p1, Lcom/melodix/music/PreviewPlayerChrome;->sizeInfo:Ljava/lang/String;

    .line 374
    return-void

    .line 363
    :cond_1e
    :goto_b
    return-void

    .line 327
    :cond_1f
    :goto_c
    return-void

    .line 324
    :cond_20
    :goto_d
    return-void
.end method

.method private navigateBack()V
    .locals 6

    .line 428
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerChrome;->activity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_2

    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->closing:Z

    if-eqz v1, :cond_0

    goto :goto_1

    .line 429
    :cond_0
    :try_start_0
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "onNativeBackClick"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Class;

    const-class v4, Landroid/view/View;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    const/4 v2, 0x0

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 430
    :catch_0
    move-exception v1

    :goto_0
    nop

    .line 431
    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->closing:Z

    if-nez v1, :cond_1

    const v1, 0x7f09023a

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_1

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {v0, v2}, Landroid/view/View;->setAlpha(F)V

    invoke-direct {p0, v1}, Lcom/melodix/music/PreviewPlayerChrome;->updateStatusForTranslation(F)V

    .line 432
    :cond_1
    return-void

    .line 428
    :cond_2
    :goto_1
    return-void
.end method

.method private playerVisible()Z
    .locals 1

    .line 87
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerChrome;->isAttachedToWindow()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerChrome;->isShown()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerChrome;->getWindowVisibility()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private refreshSystemBarColors()V
    .locals 2

    .line 138
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerChrome;->sampleEdge(Z)[I

    move-result-object v0

    const/4 v1, 0x1

    invoke-direct {p0, v1}, Lcom/melodix/music/PreviewPlayerChrome;->sampleEdge(Z)[I

    move-result-object v1

    .line 139
    if-eqz v0, :cond_0

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->topColors:[I

    :cond_0
    if-eqz v1, :cond_1

    iput-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->bottomColors:[I

    .line 140
    :cond_1
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->statusOverlay:Landroid/graphics/drawable/GradientDrawable;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->statusOverlay:Landroid/graphics/drawable/GradientDrawable;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->topColors:[I

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setColors([I)V

    .line 141
    :cond_2
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->navOverlay:Landroid/graphics/drawable/GradientDrawable;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->navOverlay:Landroid/graphics/drawable/GradientDrawable;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->bottomColors:[I

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setColors([I)V

    .line 142
    :cond_3
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->panel:Landroid/view/View;

    if-nez v0, :cond_4

    const/4 v0, 0x0

    goto :goto_0

    :cond_4
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->panel:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getTranslationY()F

    move-result v0

    :goto_0
    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerChrome;->updateStatusForTranslation(F)V

    .line 143
    return-void
.end method

.method public static report()Ljava/lang/String;
    .locals 2

    .line 237
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\nAffichage lecteur : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/melodix/music/PreviewPlayerChrome;->state:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " ; fond : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/melodix/music/PreviewPlayerChrome;->tintInfo:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " ; pochette : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/melodix/music/PreviewPlayerChrome;->sizeInfo:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private restoreBackground()V
    .locals 7

    .line 227
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->chromeApplied:Z

    const/4 v1, 0x0

    if-nez v0, :cond_0

    iput-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->previousScreen:Landroid/graphics/Bitmap;

    return-void

    .line 228
    :cond_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->root:Landroid/view/View;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->root:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerChrome;->backdrop:Landroid/graphics/drawable/Drawable;

    if-ne v0, v2, :cond_1

    .line 229
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->root:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getPaddingLeft()I

    move-result v0

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerChrome;->root:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getPaddingTop()I

    move-result v2

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerChrome;->root:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getPaddingRight()I

    move-result v3

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerChrome;->root:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getPaddingBottom()I

    move-result v4

    .line 230
    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerChrome;->root:Landroid/view/View;

    iget-object v6, p0, Lcom/melodix/music/PreviewPlayerChrome;->rootBackground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v5, v6}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerChrome;->root:Landroid/view/View;

    invoke-virtual {v5, v0, v2, v3, v4}, Landroid/view/View;->setPadding(IIII)V

    .line 232
    :cond_1
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->panel:Landroid/view/View;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->panel:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerChrome;->appliedBackground:Landroid/graphics/drawable/Drawable;

    if-ne v0, v2, :cond_2

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->panel:Landroid/view/View;

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerChrome;->panelBackground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 233
    :cond_2
    iput-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->root:Landroid/view/View;

    iput-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->panel:Landroid/view/View;

    iput-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->rootBackground:Landroid/graphics/drawable/Drawable;

    iput-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->panelBackground:Landroid/graphics/drawable/Drawable;

    iput-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->appliedBackground:Landroid/graphics/drawable/Drawable;

    iput-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->backdrop:Landroid/graphics/drawable/Drawable;

    iput-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->previousScreen:Landroid/graphics/Bitmap;

    iput-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->tintLayer:Landroid/graphics/drawable/GradientDrawable;

    iput-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->scrim:Landroid/graphics/drawable/GradientDrawable;

    iput-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->tintSource:Landroid/graphics/drawable/Drawable;

    iput-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->artPlaying:Ljava/lang/Boolean;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->chromeApplied:Z

    .line 234
    return-void
.end method

.method private restoreHeader()V
    .locals 2

    .line 98
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->headerHidden:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->header:Landroid/view/View;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->header:Landroid/view/View;

    iget v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->previousHeaderVisibility:I

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 99
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->header:Landroid/view/View;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->headerHidden:Z

    .line 100
    return-void
.end method

.method private restoreStatusBar()V
    .locals 3

    .line 195
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->statusDecor:Landroid/view/View;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->statusOverlay:Landroid/graphics/drawable/GradientDrawable;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->statusDecor:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getOverlay()Landroid/view/ViewOverlay;

    move-result-object v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->statusOverlay:Landroid/graphics/drawable/GradientDrawable;

    invoke-virtual {v0, v1}, Landroid/view/ViewOverlay;->remove(Landroid/graphics/drawable/Drawable;)V

    .line 196
    :cond_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->statusDecor:Landroid/view/View;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->navOverlay:Landroid/graphics/drawable/GradientDrawable;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->statusDecor:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getOverlay()Landroid/view/ViewOverlay;

    move-result-object v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->navOverlay:Landroid/graphics/drawable/GradientDrawable;

    invoke-virtual {v0, v1}, Landroid/view/ViewOverlay;->remove(Landroid/graphics/drawable/Drawable;)V

    .line 197
    :cond_1
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->statusWindow:Landroid/view/Window;

    if-eqz v0, :cond_8

    .line 198
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->statusWindow:Landroid/view/Window;

    invoke-virtual {v0}, Landroid/view/Window;->getStatusBarColor()I

    move-result v0

    iget v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->lastStatusColor:I

    if-ne v0, v1, :cond_2

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->statusWindow:Landroid/view/Window;

    iget v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->originalStatusColor:I

    invoke-virtual {v0, v1}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 199
    :cond_2
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->statusWindow:Landroid/view/Window;

    invoke-virtual {v0}, Landroid/view/Window;->getNavigationBarColor()I

    move-result v0

    iget v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->lastNavColor:I

    if-ne v0, v1, :cond_3

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->statusWindow:Landroid/view/Window;

    iget v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->originalNavColor:I

    invoke-virtual {v0, v1}, Landroid/view/Window;->setNavigationBarColor(I)V

    .line 200
    :cond_3
    iget v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->originalStatusFlags:I

    const/high16 v1, 0x4000000

    and-int/2addr v0, v1

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->statusWindow:Landroid/view/Window;

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    goto :goto_0

    :cond_4
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->statusWindow:Landroid/view/Window;

    invoke-virtual {v0, v1}, Landroid/view/Window;->clearFlags(I)V

    .line 201
    :goto_0
    iget v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->originalStatusFlags:I

    const/high16 v1, 0x8000000

    and-int/2addr v0, v1

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->statusWindow:Landroid/view/Window;

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    goto :goto_1

    :cond_5
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->statusWindow:Landroid/view/Window;

    invoke-virtual {v0, v1}, Landroid/view/Window;->clearFlags(I)V

    .line 202
    :goto_1
    iget v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->originalStatusFlags:I

    const/high16 v1, -0x80000000

    and-int/2addr v0, v1

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->statusWindow:Landroid/view/Window;

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    goto :goto_2

    :cond_6
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->statusWindow:Landroid/view/Window;

    invoke-virtual {v0, v1}, Landroid/view/Window;->clearFlags(I)V

    .line 203
    :goto_2
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1d

    if-lt v0, v1, :cond_7

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->statusWindow:Landroid/view/Window;

    invoke-virtual {v0}, Landroid/view/Window;->isNavigationBarContrastEnforced()Z

    move-result v0

    if-nez v0, :cond_7

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->statusWindow:Landroid/view/Window;

    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->originalNavContrast:Z

    invoke-virtual {v0, v1}, Landroid/view/Window;->setNavigationBarContrastEnforced(Z)V

    .line 204
    :cond_7
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->statusDecor:Landroid/view/View;

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->statusDecor:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getSystemUiVisibility()I

    move-result v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->statusDecor:Landroid/view/View;

    and-int/lit16 v0, v0, -0x2011

    iget v2, p0, Lcom/melodix/music/PreviewPlayerChrome;->originalStatusUi:I

    and-int/lit16 v2, v2, 0x2010

    or-int/2addr v0, v2

    invoke-virtual {v1, v0}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 206
    :cond_8
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->statusWindow:Landroid/view/Window;

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->statusDecor:Landroid/view/View;

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->statusOverlay:Landroid/graphics/drawable/GradientDrawable;

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->navOverlay:Landroid/graphics/drawable/GradientDrawable;

    .line 207
    return-void
.end method

.method private sampleEdge(Z)[I
    .locals 8

    .line 126
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->appliedBackground:Landroid/graphics/drawable/Drawable;

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->panel:Landroid/view/View;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->panel:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v0

    if-lez v0, :cond_2

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->panel:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v0

    if-gtz v0, :cond_0

    goto/16 :goto_1

    .line 127
    :cond_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->panel:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v0

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerChrome;->panel:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    move-result v2

    new-instance v3, Landroid/graphics/Rect;

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerChrome;->appliedBackground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v4}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v4

    invoke-direct {v3, v4}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    .line 129
    :try_start_0
    sget-object v4, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    const/4 v5, 0x1

    const/16 v6, 0x19

    invoke-static {v6, v5, v4}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v4

    .line 130
    new-instance v5, Landroid/graphics/Canvas;

    invoke-direct {v5, v4}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    const/high16 v6, 0x41c80000    # 25.0f

    int-to-float v7, v0

    div-float/2addr v6, v7

    const/high16 v7, 0x3f800000    # 1.0f

    invoke-virtual {v5, v6, v7}, Landroid/graphics/Canvas;->scale(FF)V

    if-eqz p1, :cond_1

    rsub-int/lit8 p1, v2, 0x1

    int-to-float p1, p1

    const/4 v6, 0x0

    invoke-virtual {v5, v6, p1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 131
    :cond_1
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerChrome;->appliedBackground:Landroid/graphics/drawable/Drawable;

    const/4 v6, 0x0

    invoke-virtual {p1, v6, v6, v0, v2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerChrome;->appliedBackground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p1, v5}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 132
    invoke-virtual {v4, v6, v6}, Landroid/graphics/Bitmap;->getPixel(II)I

    move-result p1

    const/4 v0, 0x6

    invoke-virtual {v4, v0, v6}, Landroid/graphics/Bitmap;->getPixel(II)I

    move-result v0

    const/16 v2, 0xc

    invoke-virtual {v4, v2, v6}, Landroid/graphics/Bitmap;->getPixel(II)I

    move-result v2

    const/16 v5, 0x12

    invoke-virtual {v4, v5, v6}, Landroid/graphics/Bitmap;->getPixel(II)I

    move-result v5

    const/16 v7, 0x18

    invoke-virtual {v4, v7, v6}, Landroid/graphics/Bitmap;->getPixel(II)I

    move-result v6

    filled-new-array {p1, v0, v2, v5, v6}, [I

    move-result-object p1

    .line 133
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->recycle()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 135
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->appliedBackground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v3}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 133
    return-object p1

    .line 135
    :catchall_0
    move-exception p1

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->appliedBackground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v3}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    throw p1

    .line 134
    :catch_0
    move-exception p1

    .line 135
    :goto_0
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerChrome;->appliedBackground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p1, v3}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 134
    return-object v1

    :catch_1
    move-exception p1

    goto :goto_0

    .line 126
    :cond_2
    :goto_1
    return-object v1
.end method

.method private setupCosmetics(Landroid/app/Activity;)V
    .locals 19

    .line 464
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-boolean v2, v0, Lcom/melodix/music/PreviewPlayerChrome;->setupDone:Z

    if-eqz v2, :cond_0

    return-void

    .line 465
    :cond_0
    const v2, 0x7f09023a

    invoke-virtual {v1, v2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    instance-of v3, v2, Landroid/view/ViewGroup;

    if-nez v3, :cond_1

    return-void

    .line 466
    :cond_1
    invoke-direct {v0, v2}, Lcom/melodix/music/PreviewPlayerChrome;->findCollapse(Landroid/view/View;)Landroid/view/View;

    move-result-object v3

    .line 467
    const-string v4, "repeat"

    invoke-virtual {v2, v4}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v4

    iput-object v4, v0, Lcom/melodix/music/PreviewPlayerChrome;->repeatControl:Landroid/view/View;

    const-string v4, "shuffle"

    invoke-virtual {v2, v4}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v4

    iput-object v4, v0, Lcom/melodix/music/PreviewPlayerChrome;->shuffleControl:Landroid/view/View;

    .line 468
    const-string v4, "like"

    invoke-virtual {v2, v4}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v4

    const-string v5, "previewPlayerTiles"

    invoke-virtual {v2, v5}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v5

    .line 469
    const v6, 0x7f09023f

    invoke-virtual {v1, v6}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v6

    const v7, 0x7f090240

    invoke-virtual {v1, v7}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v7

    const v8, 0x7f09023e

    invoke-virtual {v1, v8}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v8

    .line 470
    if-eqz v3, :cond_d

    iget-object v9, v0, Lcom/melodix/music/PreviewPlayerChrome;->repeatControl:Landroid/view/View;

    instance-of v9, v9, Landroid/widget/ImageView;

    if-eqz v9, :cond_d

    iget-object v9, v0, Lcom/melodix/music/PreviewPlayerChrome;->shuffleControl:Landroid/view/View;

    if-eqz v9, :cond_d

    if-eqz v4, :cond_d

    if-eqz v5, :cond_d

    if-eqz v8, :cond_d

    if-eqz v6, :cond_d

    if-nez v7, :cond_2

    goto/16 :goto_3

    .line 471
    :cond_2
    move-object v9, v2

    check-cast v9, Landroid/view/ViewGroup;

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    invoke-virtual {v9, v10}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 472
    invoke-virtual/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerChrome;->getParent()Landroid/view/ViewParent;

    move-result-object v9

    .line 473
    instance-of v11, v9, Landroid/view/ViewGroup;

    if-eqz v11, :cond_3

    check-cast v9, Landroid/view/ViewGroup;

    invoke-virtual {v9, v10}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    invoke-virtual {v9, v10}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 474
    :cond_3
    const-string v9, "previewPlayerArtCard"

    invoke-virtual {v2, v9}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v9

    const-string v11, "previewPlayerArtFrame"

    invoke-virtual {v2, v11}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v11

    .line 475
    const-string v12, "previewPlayerDragHandle"

    invoke-virtual {v2, v12}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v2

    .line 476
    const/4 v12, 0x0

    if-eqz v2, :cond_4

    new-instance v13, Lcom/melodix/music/PreviewPlayerChrome$DismissGesture;

    invoke-direct {v13, v0, v12}, Lcom/melodix/music/PreviewPlayerChrome$DismissGesture;-><init>(Lcom/melodix/music/PreviewPlayerChrome;Lcom/melodix/music/PreviewPlayerChrome$1;)V

    invoke-virtual {v2, v13}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 477
    :cond_4
    if-eqz v9, :cond_5

    new-instance v2, Lcom/melodix/music/PreviewPlayerChrome$DismissGesture;

    invoke-direct {v2, v0, v12}, Lcom/melodix/music/PreviewPlayerChrome$DismissGesture;-><init>(Lcom/melodix/music/PreviewPlayerChrome;Lcom/melodix/music/PreviewPlayerChrome$1;)V

    invoke-virtual {v9, v2}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 478
    :cond_5
    instance-of v2, v11, Landroid/view/ViewGroup;

    if-eqz v2, :cond_6

    check-cast v11, Landroid/view/ViewGroup;

    invoke-virtual {v11, v10}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    invoke-virtual {v11, v10}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 479
    :cond_6
    if-eqz v9, :cond_7

    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v11, 0x1c

    if-lt v2, v11, :cond_7

    const/high16 v2, -0x1000000

    invoke-virtual {v9, v2}, Landroid/view/View;->setOutlineSpotShadowColor(I)V

    invoke-virtual {v9, v2}, Landroid/view/View;->setOutlineAmbientShadowColor(I)V

    .line 480
    :cond_7
    instance-of v2, v4, Landroid/widget/ImageView;

    if-eqz v2, :cond_8

    .line 481
    iput-object v4, v0, Lcom/melodix/music/PreviewPlayerChrome;->likeControl:Landroid/view/View;

    .line 482
    new-instance v2, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v2}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const/high16 v9, 0x41600000    # 14.0f

    invoke-direct {v0, v9}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v9

    int-to-float v9, v9

    invoke-virtual {v2, v9}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    const v9, 0x17ffffff

    invoke-virtual {v2, v9}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    const/high16 v9, 0x3f800000    # 1.0f

    invoke-direct {v0, v9}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v9

    const v11, 0x24ffffff

    invoke-virtual {v2, v9, v11}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 483
    invoke-virtual {v4, v12}, Landroid/view/View;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    new-instance v9, Landroid/graphics/drawable/RippleDrawable;

    const v11, 0x44ffffff    # 2047.9999f

    invoke-static {v11}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v11

    invoke-direct {v9, v11, v2, v12}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v4, v9}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 484
    move-object v2, v4

    check-cast v2, Landroid/widget/ImageView;

    invoke-virtual {v2, v10}, Landroid/widget/ImageView;->setImageAlpha(I)V

    new-instance v2, Lcom/melodix/music/PreviewPlayerLikeArt;

    invoke-direct {v2, v4}, Lcom/melodix/music/PreviewPlayerLikeArt;-><init>(Landroid/view/View;)V

    iput-object v2, v0, Lcom/melodix/music/PreviewPlayerChrome;->likeArt:Lcom/melodix/music/PreviewPlayerLikeArt;

    invoke-virtual {v4}, Landroid/view/View;->getOverlay()Landroid/view/ViewOverlay;

    move-result-object v2

    iget-object v9, v0, Lcom/melodix/music/PreviewPlayerChrome;->likeArt:Lcom/melodix/music/PreviewPlayerLikeArt;

    invoke-virtual {v2, v9}, Landroid/view/ViewOverlay;->add(Landroid/graphics/drawable/Drawable;)V

    .line 486
    :cond_8
    iget-object v2, v0, Lcom/melodix/music/PreviewPlayerChrome;->repeatControl:Landroid/view/View;

    check-cast v2, Landroid/widget/ImageView;

    invoke-virtual {v2, v10}, Landroid/widget/ImageView;->setImageAlpha(I)V

    .line 487
    new-instance v2, Lcom/melodix/music/PreviewPlayerDecoration;

    iget-object v9, v0, Lcom/melodix/music/PreviewPlayerChrome;->repeatControl:Landroid/view/View;

    const/4 v11, 0x1

    invoke-direct {v2, v9, v11}, Lcom/melodix/music/PreviewPlayerDecoration;-><init>(Landroid/view/View;Z)V

    iput-object v2, v0, Lcom/melodix/music/PreviewPlayerChrome;->repeatArt:Lcom/melodix/music/PreviewPlayerDecoration;

    iget-object v2, v0, Lcom/melodix/music/PreviewPlayerChrome;->repeatControl:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getOverlay()Landroid/view/ViewOverlay;

    move-result-object v2

    iget-object v9, v0, Lcom/melodix/music/PreviewPlayerChrome;->repeatArt:Lcom/melodix/music/PreviewPlayerDecoration;

    invoke-virtual {v2, v9}, Landroid/view/ViewOverlay;->add(Landroid/graphics/drawable/Drawable;)V

    .line 488
    new-instance v2, Lcom/melodix/music/PreviewPlayerDecoration;

    iget-object v9, v0, Lcom/melodix/music/PreviewPlayerChrome;->shuffleControl:Landroid/view/View;

    invoke-direct {v2, v9, v10}, Lcom/melodix/music/PreviewPlayerDecoration;-><init>(Landroid/view/View;Z)V

    iput-object v2, v0, Lcom/melodix/music/PreviewPlayerChrome;->shuffleDot:Lcom/melodix/music/PreviewPlayerDecoration;

    iget-object v2, v0, Lcom/melodix/music/PreviewPlayerChrome;->shuffleControl:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getOverlay()Landroid/view/ViewOverlay;

    move-result-object v2

    iget-object v9, v0, Lcom/melodix/music/PreviewPlayerChrome;->shuffleDot:Lcom/melodix/music/PreviewPlayerDecoration;

    invoke-virtual {v2, v9}, Landroid/view/ViewOverlay;->add(Landroid/graphics/drawable/Drawable;)V

    .line 489
    const/4 v2, 0x4

    new-array v9, v2, [Landroid/view/View;

    aput-object v3, v9, v10

    aput-object v6, v9, v11

    const/4 v3, 0x2

    aput-object v7, v9, v3

    const/4 v6, 0x3

    aput-object v8, v9, v6

    move v7, v10

    :goto_0
    if-ge v7, v2, :cond_9

    aget-object v8, v9, v7

    new-instance v13, Lcom/melodix/music/PreviewPlayerChrome$PressEffect;

    invoke-direct {v13, v11}, Lcom/melodix/music/PreviewPlayerChrome$PressEffect;-><init>(Z)V

    invoke-virtual {v8, v13}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 490
    :cond_9
    iget-object v2, v0, Lcom/melodix/music/PreviewPlayerChrome;->repeatControl:Landroid/view/View;

    iget-object v7, v0, Lcom/melodix/music/PreviewPlayerChrome;->shuffleControl:Landroid/view/View;

    new-array v8, v6, [Landroid/view/View;

    aput-object v2, v8, v10

    aput-object v7, v8, v11

    aput-object v4, v8, v3

    move v2, v10

    :goto_1
    if-ge v2, v6, :cond_a

    aget-object v4, v8, v2

    new-instance v7, Lcom/melodix/music/PreviewPlayerChrome$PressEffect;

    invoke-direct {v7, v10}, Lcom/melodix/music/PreviewPlayerChrome$PressEffect;-><init>(Z)V

    invoke-virtual {v4, v7}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 491
    :cond_a
    instance-of v2, v5, Landroid/view/ViewGroup;

    if-eqz v2, :cond_b

    check-cast v5, Landroid/view/ViewGroup;

    move v2, v10

    :goto_2
    invoke-virtual {v5}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v4

    if-ge v2, v4, :cond_b

    invoke-virtual {v5, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    new-instance v6, Lcom/melodix/music/PreviewPlayerChrome$PressEffect;

    invoke-direct {v6, v10}, Lcom/melodix/music/PreviewPlayerChrome$PressEffect;-><init>(Z)V

    invoke-virtual {v4, v6}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 492
    :cond_b
    const v2, 0x7f09023d

    invoke-virtual {v1, v2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 493
    instance-of v2, v1, Landroid/widget/SeekBar;

    if-eqz v2, :cond_c

    .line 494
    check-cast v1, Landroid/widget/SeekBar;

    .line 495
    new-instance v2, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v2}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    invoke-virtual {v2, v11}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    const v4, 0x33ffffff

    invoke-virtual {v2, v4}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    const/high16 v4, 0x41c00000    # 24.0f

    invoke-direct {v0, v4}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v5

    invoke-direct {v0, v4}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v4

    invoke-virtual {v2, v5, v4}, Landroid/graphics/drawable/GradientDrawable;->setSize(II)V

    .line 496
    new-instance v4, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v4}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    invoke-virtual {v4, v11}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    const/4 v5, -0x1

    invoke-virtual {v4, v5}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    const/high16 v5, 0x41800000    # 16.0f

    invoke-direct {v0, v5}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v6

    invoke-direct {v0, v5}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v5

    invoke-virtual {v4, v6, v5}, Landroid/graphics/drawable/GradientDrawable;->setSize(II)V

    .line 497
    new-instance v5, Landroid/graphics/drawable/LayerDrawable;

    new-array v3, v3, [Landroid/graphics/drawable/Drawable;

    aput-object v2, v3, v10

    aput-object v4, v3, v11

    invoke-direct {v5, v3}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    const/high16 v2, 0x40800000    # 4.0f

    invoke-direct {v0, v2}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v15

    invoke-direct {v0, v2}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v16

    invoke-direct {v0, v2}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v17

    invoke-direct {v0, v2}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v18

    const/4 v14, 0x1

    move-object v13, v5

    invoke-virtual/range {v13 .. v18}, Landroid/graphics/drawable/LayerDrawable;->setLayerInset(IIIII)V

    .line 498
    invoke-virtual {v1, v12}, Landroid/widget/SeekBar;->setThumbTintList(Landroid/content/res/ColorStateList;)V

    invoke-virtual {v1, v5}, Landroid/widget/SeekBar;->setThumb(Landroid/graphics/drawable/Drawable;)V

    const/high16 v2, 0x41400000    # 12.0f

    invoke-direct {v0, v2}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v3

    invoke-virtual {v1, v3}, Landroid/widget/SeekBar;->setThumbOffset(I)V

    .line 499
    invoke-direct {v0, v2}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v3

    invoke-virtual {v1}, Landroid/widget/SeekBar;->getPaddingTop()I

    move-result v4

    invoke-direct {v0, v2}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v2

    invoke-virtual {v1}, Landroid/widget/SeekBar;->getPaddingBottom()I

    move-result v5

    invoke-virtual {v1, v3, v4, v2, v5}, Landroid/widget/SeekBar;->setPadding(IIII)V

    .line 500
    invoke-virtual {v1}, Landroid/widget/SeekBar;->getProgressDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 501
    instance-of v2, v1, Landroid/graphics/drawable/LayerDrawable;

    if-eqz v2, :cond_c

    .line 502
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    check-cast v1, Landroid/graphics/drawable/LayerDrawable;

    .line 503
    const/high16 v2, 0x1020000

    invoke-virtual {v1, v2}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 504
    instance-of v2, v1, Landroid/graphics/drawable/GradientDrawable;

    if-eqz v2, :cond_c

    check-cast v1, Landroid/graphics/drawable/GradientDrawable;

    const v2, 0x55ffffff    # 3.518437E13f

    invoke-virtual {v1, v2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 507
    :cond_c
    iput-boolean v11, v0, Lcom/melodix/music/PreviewPlayerChrome;->setupDone:Z

    .line 508
    return-void

    .line 470
    :cond_d
    :goto_3
    return-void
.end method

.method static shrink(Landroid/graphics/drawable/Drawable;I)Landroid/graphics/Bitmap;
    .locals 4

    .line 257
    const/4 v0, 0x0

    if-nez p0, :cond_0

    return-object v0

    .line 259
    :cond_0
    :try_start_0
    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {p1, p1, v1}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 260
    new-instance v2, Landroid/graphics/Rect;

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    const/4 v3, 0x0

    invoke-virtual {p0, v3, v3, p1, p1}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    new-instance p1, Landroid/graphics/Canvas;

    invoke-direct {p1, v1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    invoke-virtual {p0, v2}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 261
    return-object v1

    .line 262
    :catch_0
    move-exception p0

    return-object v0
.end method

.method private sizeArtwork(Landroid/app/Activity;)V
    .locals 8

    .line 520
    const v0, 0x7f09023a

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerChrome;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    .line 521
    if-eqz p1, :cond_d

    instance-of v1, v0, Landroid/view/ViewGroup;

    if-nez v1, :cond_0

    goto/16 :goto_4

    .line 522
    :cond_0
    check-cast v0, Landroid/view/ViewGroup;

    .line 523
    const-string v1, "previewPlayerArtFrame"

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v1

    const-string v2, "previewPlayerArtCard"

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v2

    .line 524
    if-eqz v1, :cond_c

    if-eqz v2, :cond_c

    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    if-ne v3, v0, :cond_c

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v3

    if-lez v3, :cond_c

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v3

    if-gtz v3, :cond_1

    goto/16 :goto_3

    .line 525
    :cond_1
    nop

    .line 526
    const/4 v3, 0x0

    move v4, v3

    :goto_0
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v5

    if-ge v3, v5, :cond_4

    .line 527
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    .line 528
    if-eq v5, p0, :cond_3

    if-eq v5, v1, :cond_3

    invoke-virtual {v5}, Landroid/view/View;->getVisibility()I

    move-result v6

    const/16 v7, 0x8

    if-eq v6, v7, :cond_3

    const-string v6, "previewPlayerSpacer"

    invoke-virtual {v5}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    goto :goto_1

    .line 529
    :cond_2
    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    invoke-virtual {v5}, Landroid/view/View;->getMeasuredHeight()I

    move-result v5

    add-int/2addr v4, v5

    .line 530
    instance-of v5, v6, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v5, :cond_3

    check-cast v6, Landroid/view/ViewGroup$MarginLayoutParams;

    iget v5, v6, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    iget v6, v6, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    add-int/2addr v5, v6

    add-int/2addr v4, v5

    .line 526
    :cond_3
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 532
    :cond_4
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    .line 533
    instance-of v3, v0, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v3, :cond_5

    move-object v3, v0

    check-cast v3, Landroid/view/ViewGroup$MarginLayoutParams;

    iget v5, v3, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    iget v3, v3, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    add-int/2addr v5, v3

    add-int/2addr v4, v5

    .line 534
    :cond_5
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v3

    invoke-virtual {p1}, Landroid/view/View;->getPaddingTop()I

    move-result v5

    sub-int/2addr v3, v5

    invoke-virtual {p1}, Landroid/view/View;->getPaddingBottom()I

    move-result p1

    sub-int/2addr v3, p1

    sub-int/2addr v3, v4

    .line 535
    const/high16 p1, 0x439f0000    # 318.0f

    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result p1

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v4

    invoke-static {p1, v4}, Ljava/lang/Math;->min(II)I

    move-result p1

    .line 536
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerChrome;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v4

    iget v4, v4, Landroid/content/res/Configuration;->fontScale:F

    const v5, 0x3fa66666    # 1.3f

    cmpg-float v4, v4, v5

    if-gtz v4, :cond_6

    if-lt v3, p1, :cond_6

    const/high16 p1, 0x43ab0000    # 342.0f

    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result p1

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v4

    invoke-static {p1, v4}, Ljava/lang/Math;->min(II)I

    move-result p1

    .line 537
    :cond_6
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerChrome;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v4

    iget v4, v4, Landroid/content/res/Configuration;->fontScale:F

    cmpl-float v4, v4, v5

    if-lez v4, :cond_7

    goto :goto_2

    :cond_7
    const/high16 v4, 0x42a00000    # 80.0f

    invoke-direct {p0, v4}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v4

    invoke-static {v4, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    invoke-static {p1, v3}, Ljava/lang/Math;->min(II)I

    move-result p1

    .line 538
    :goto_2
    if-gtz p1, :cond_8

    return-void

    .line 539
    :cond_8
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    .line 540
    iget v4, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-eq v4, p1, :cond_9

    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 541
    :cond_9
    iget v0, v3, Landroid/view/ViewGroup$LayoutParams;->width:I

    if-ne v0, p1, :cond_a

    iget v0, v3, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-eq v0, p1, :cond_b

    :cond_a
    iput p1, v3, Landroid/view/ViewGroup$LayoutParams;->width:I

    iput p1, v3, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {v2, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 542
    :cond_b
    return-void

    .line 524
    :cond_c
    :goto_3
    return-void

    .line 521
    :cond_d
    :goto_4
    return-void
.end method

.method private sizeSkips(Landroid/app/Activity;)V
    .locals 7

    .line 305
    const v0, 0x7f09023f

    const v1, 0x7f090240

    filled-new-array {v0, v1}, [I

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    const/4 v2, 0x2

    if-ge v1, v2, :cond_3

    aget v3, v0, v1

    .line 306
    invoke-virtual {p1, v3}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    instance-of v4, v3, Landroid/widget/ImageView;

    if-eqz v4, :cond_2

    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    move-result v4

    if-gtz v4, :cond_0

    goto :goto_1

    .line 307
    :cond_0
    const/high16 v4, 0x40800000    # 4.0f

    invoke-direct {p0, v4}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v4

    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    move-result v5

    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    move-result v6

    invoke-static {v5, v6}, Ljava/lang/Math;->min(II)I

    move-result v5

    const/high16 v6, 0x41e00000    # 28.0f

    invoke-direct {p0, v6}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v6

    sub-int/2addr v5, v6

    div-int/2addr v5, v2

    invoke-static {v4, v5}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 308
    invoke-virtual {v3}, Landroid/view/View;->getPaddingLeft()I

    move-result v4

    if-ne v4, v2, :cond_1

    invoke-virtual {v3}, Landroid/view/View;->getPaddingTop()I

    move-result v4

    if-eq v4, v2, :cond_2

    :cond_1
    move-object v4, v3

    check-cast v4, Landroid/widget/ImageView;

    sget-object v5, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    invoke-virtual {v3, v2, v2, v2, v2}, Landroid/view/View;->setPadding(IIII)V

    .line 305
    :cond_2
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 310
    :cond_3
    return-void
.end method

.method private stylePlay(Landroid/app/Activity;)V
    .locals 5

    .line 510
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->playStyled:Z

    if-eqz v0, :cond_0

    return-void

    .line 511
    :cond_0
    const v0, 0x7f09023e

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    if-nez p1, :cond_1

    return-void

    .line 513
    :cond_1
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const v1, -0xa0a09

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 514
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    .line 515
    new-instance v2, Landroid/graphics/drawable/RippleDrawable;

    const/high16 v3, 0x1f000000

    invoke-static {v3}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v3

    const/4 v4, 0x0

    invoke-direct {v2, v3, v0, v4}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p1, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 516
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1c

    if-lt v0, v2, :cond_2

    const/high16 v0, -0x1000000

    invoke-virtual {p1, v0}, Landroid/view/View;->setOutlineSpotShadowColor(I)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOutlineAmbientShadowColor(I)V

    .line 517
    :cond_2
    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->playStyled:Z

    .line 518
    return-void
.end method

.method private sync()V
    .locals 9

    .line 544
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerChrome;->playerVisible()Z

    move-result v0

    const v1, 0x7f09023a

    const/4 v2, 0x0

    const/high16 v3, 0x3f800000    # 1.0f

    if-nez v0, :cond_4

    const-string v0, "non affich\u00e9"

    sput-object v0, Lcom/melodix/music/PreviewPlayerChrome;->state:Ljava/lang/String;

    .line 545
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->closing:Z

    const/4 v4, 0x0

    if-eqz v0, :cond_1

    iput-boolean v4, p0, Lcom/melodix/music/PreviewPlayerChrome;->closing:Z

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerChrome;->activity()Landroid/app/Activity;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerChrome;->activity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    :goto_0
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/ViewPropertyAnimator;->cancel()V

    invoke-virtual {v0, v2}, Landroid/view/View;->setTranslationY(F)V

    invoke-virtual {v0, v3}, Landroid/view/View;->setAlpha(F)V

    .line 546
    :cond_1
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->wasVisible:Z

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerChrome;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v0, v0, Landroid/view/View;

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerChrome;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/ViewPropertyAnimator;->cancel()V

    invoke-virtual {v0, v3}, Landroid/view/View;->setAlpha(F)V

    invoke-virtual {v0, v2}, Landroid/view/View;->setTranslationY(F)V

    .line 547
    :cond_2
    iput-boolean v4, p0, Lcom/melodix/music/PreviewPlayerChrome;->wasVisible:Z

    .line 548
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->ticking:Z

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->visualTick:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerChrome;->removeCallbacks(Ljava/lang/Runnable;)Z

    iput-boolean v4, p0, Lcom/melodix/music/PreviewPlayerChrome;->ticking:Z

    :cond_3
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerChrome;->restoreHeader()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerChrome;->restoreBackground()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerChrome;->restoreStatusBar()V

    return-void

    .line 550
    :cond_4
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerChrome;->activity()Landroid/app/Activity;

    move-result-object v0

    if-nez v0, :cond_5

    return-void

    .line 551
    :cond_5
    iget-boolean v4, p0, Lcom/melodix/music/PreviewPlayerChrome;->wasVisible:Z

    const/4 v5, 0x1

    xor-int/2addr v4, v5

    iput-boolean v5, p0, Lcom/melodix/music/PreviewPlayerChrome;->wasVisible:Z

    .line 552
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "affich\u00e9, "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerChrome;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    invoke-virtual {v7}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v7

    iget v7, v7, Landroid/content/res/Configuration;->orientation:I

    const/4 v8, 0x2

    if-ne v7, v8, :cond_6

    const-string v7, "paysage"

    goto :goto_1

    :cond_6
    const-string v7, "portrait"

    :goto_1
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    sput-object v6, Lcom/melodix/music/PreviewPlayerChrome;->state:Ljava/lang/String;

    .line 553
    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerChrome;->hideHeader(Landroid/app/Activity;)V

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerChrome;->applyBackground(Landroid/app/Activity;)V

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerChrome;->applyStatusBar(Landroid/app/Activity;)V

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerChrome;->stylePlay(Landroid/app/Activity;)V

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerChrome;->sizeArtwork(Landroid/app/Activity;)V

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerChrome;->landscape(Landroid/app/Activity;)V

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerChrome;->sizeSkips(Landroid/app/Activity;)V

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerChrome;->setupCosmetics(Landroid/app/Activity;)V

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerChrome;->updateTint(Landroid/app/Activity;)V

    .line 554
    if-eqz v4, :cond_8

    .line 555
    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 556
    if-eqz v0, :cond_8

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x1a

    if-lt v1, v4, :cond_7

    invoke-static {}, Landroid/animation/ValueAnimator;->areAnimatorsEnabled()Z

    move-result v1

    if-eqz v1, :cond_8

    .line 557
    :cond_7
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/ViewPropertyAnimator;->cancel()V

    invoke-virtual {v0, v3}, Landroid/view/View;->setAlpha(F)V

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v1

    const/high16 v3, 0x43960000    # 300.0f

    invoke-direct {p0, v3}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v3

    invoke-static {v1, v3}, Ljava/lang/Math;->max(II)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    invoke-virtual {v0}, Landroid/view/View;->getTranslationY()F

    move-result v1

    invoke-direct {p0, v1}, Lcom/melodix/music/PreviewPlayerChrome;->updateStatusForTranslation(F)V

    .line 558
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    const-wide/16 v2, 0x154

    invoke-virtual {v1, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerChrome;->followStatus(Landroid/view/View;)Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/view/ViewPropertyAnimator;->setUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    new-instance v2, Landroid/view/animation/DecelerateInterpolator;

    const v3, 0x3fcccccd    # 1.6f

    invoke-direct {v2, v3}, Landroid/view/animation/DecelerateInterpolator;-><init>(F)V

    invoke-virtual {v1, v2}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    new-instance v2, Lcom/melodix/music/PreviewPlayerChrome$5;

    invoke-direct {v2, p0, v0}, Lcom/melodix/music/PreviewPlayerChrome$5;-><init>(Lcom/melodix/music/PreviewPlayerChrome;Landroid/view/View;)V

    invoke-virtual {v1, v2}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 561
    :cond_8
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->setupDone:Z

    if-eqz v0, :cond_9

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->ticking:Z

    if-nez v0, :cond_9

    iput-boolean v5, p0, Lcom/melodix/music/PreviewPlayerChrome;->ticking:Z

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->visualTick:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerChrome;->post(Ljava/lang/Runnable;)Z

    .line 562
    :cond_9
    invoke-static {}, Lcom/melodix/music/PreviewPlayerChrome;->report()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/melodix/music/PreviewPlayerTiles;->displayReport:Ljava/lang/String;

    .line 563
    return-void
.end method

.method private updateStatusForTranslation(F)V
    .locals 7

    .line 181
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->statusWindow:Landroid/view/Window;

    if-nez v0, :cond_0

    return-void

    .line 182
    :cond_0
    const/4 v0, 0x0

    invoke-static {v0, p1}, Ljava/lang/Math;->max(FF)F

    move-result v1

    const/high16 v2, 0x42900000    # 72.0f

    invoke-direct {p0, v2}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v3

    const/4 v4, 0x1

    invoke-static {v4, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    int-to-float v3, v3

    div-float/2addr v1, v3

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-static {v3, v1}, Ljava/lang/Math;->min(FF)F

    move-result v1

    sub-float v1, v3, v1

    .line 183
    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerChrome;->panel:Landroid/view/View;

    const/high16 v6, 0x43960000    # 300.0f

    if-nez v5, :cond_1

    invoke-direct {p0, v6}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v5

    goto :goto_0

    :cond_1
    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerChrome;->panel:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getHeight()I

    move-result v5

    invoke-direct {p0, v6}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v6

    invoke-static {v5, v6}, Ljava/lang/Math;->max(II)I

    move-result v5

    :goto_0
    int-to-float v5, v5

    .line 184
    invoke-static {v0, p1}, Ljava/lang/Math;->max(FF)F

    move-result p1

    sub-float/2addr v5, p1

    invoke-direct {p0, v2}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result p1

    invoke-static {v4, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    int-to-float p1, p1

    div-float/2addr v5, p1

    invoke-static {v0, v5}, Ljava/lang/Math;->max(FF)F

    move-result p1

    invoke-static {v3, p1}, Ljava/lang/Math;->min(FF)F

    move-result p1

    .line 185
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->statusOverlay:Landroid/graphics/drawable/GradientDrawable;

    const/high16 v2, 0x437f0000    # 255.0f

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->statusOverlay:Landroid/graphics/drawable/GradientDrawable;

    mul-float v3, v1, v2

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    invoke-virtual {v0, v3}, Landroid/graphics/drawable/GradientDrawable;->setAlpha(I)V

    .line 186
    :cond_2
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->navOverlay:Landroid/graphics/drawable/GradientDrawable;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->navOverlay:Landroid/graphics/drawable/GradientDrawable;

    mul-float/2addr v2, p1

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/graphics/drawable/GradientDrawable;->setAlpha(I)V

    .line 187
    :cond_3
    iget v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->originalStatusColor:I

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerChrome;->topColors:[I

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerChrome;->topColors:[I

    array-length v3, v3

    div-int/lit8 v3, v3, 0x2

    aget v2, v2, v3

    invoke-static {v0, v2, v1}, Lcom/melodix/music/PreviewPlayerChrome;->blend(IIF)I

    move-result v0

    iput v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->lastStatusColor:I

    .line 188
    iget v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->originalNavColor:I

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->bottomColors:[I

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerChrome;->bottomColors:[I

    array-length v2, v2

    div-int/lit8 v2, v2, 0x2

    aget v1, v1, v2

    invoke-static {v0, v1, p1}, Lcom/melodix/music/PreviewPlayerChrome;->blend(IIF)I

    move-result p1

    iput p1, p0, Lcom/melodix/music/PreviewPlayerChrome;->lastNavColor:I

    .line 189
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerChrome;->statusWindow:Landroid/view/Window;

    iget v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->lastStatusColor:I

    invoke-virtual {p1, v0}, Landroid/view/Window;->setStatusBarColor(I)V

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerChrome;->statusWindow:Landroid/view/Window;

    iget v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->lastNavColor:I

    invoke-virtual {p1, v0}, Landroid/view/Window;->setNavigationBarColor(I)V

    .line 190
    return-void
.end method

.method private updateTint(Landroid/app/Activity;)V
    .locals 9

    .line 265
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->tintLayer:Landroid/graphics/drawable/GradientDrawable;

    if-nez v0, :cond_0

    const-string p1, "fond non appliqu\u00e9"

    sput-object p1, Lcom/melodix/music/PreviewPlayerChrome;->tintInfo:Ljava/lang/String;

    return-void

    .line 266
    :cond_0
    const v0, 0x7f090245

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    instance-of v1, v0, Landroid/widget/ImageView;

    if-nez v1, :cond_1

    return-void

    .line 267
    :cond_1
    check-cast v0, Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->tintSource:Landroid/graphics/drawable/Drawable;

    if-ne v0, v1, :cond_2

    return-void

    :cond_2
    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->tintSource:Landroid/graphics/drawable/Drawable;

    .line 268
    const/16 v1, 0xc

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewPlayerChrome;->shrink(Landroid/graphics/drawable/Drawable;I)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 269
    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerChrome;->dominant(Landroid/graphics/Bitmap;)I

    move-result v2

    .line 270
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    if-nez v0, :cond_3

    const-string v4, "aucune image"

    goto :goto_0

    :cond_3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v4

    :goto_0
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const v4, 0xffffff

    if-nez v1, :cond_4

    const-string v1, ", \u00e9chantillon impossible"

    goto :goto_1

    :cond_4
    if-nez v2, :cond_5

    const-string v1, ", couleur nulle"

    goto :goto_1

    :cond_5
    and-int v1, v2, v4

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    const-string v5, ", teinte #%06x"

    invoke-static {v5, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    :goto_1
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/melodix/music/PreviewPlayerChrome;->tintInfo:Ljava/lang/String;

    .line 272
    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->tintLayer:Landroid/graphics/drawable/GradientDrawable;

    const/4 v3, 0x2

    const/4 v5, 0x1

    const/4 v6, 0x0

    if-nez v2, :cond_6

    new-array v3, v3, [I

    aput v6, v3, v6

    aput v6, v3, v5

    goto :goto_2

    :cond_6
    const/4 v7, 0x3

    new-array v7, v7, [I

    and-int/2addr v4, v2

    const/high16 v8, 0x4d000000    # 1.3421773E8f

    or-int/2addr v8, v4

    aput v8, v7, v6

    const/high16 v8, 0x14000000

    or-int/2addr v4, v8

    aput v4, v7, v5

    aput v6, v7, v3

    move-object v3, v7

    :goto_2
    invoke-virtual {v1, v3}, Landroid/graphics/drawable/GradientDrawable;->setColors([I)V

    .line 274
    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v1, v6}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 275
    const/4 v3, 0x5

    invoke-static {v0, v3}, Lcom/melodix/music/PreviewPlayerChrome;->shrink(Landroid/graphics/drawable/Drawable;I)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 276
    if-eqz v0, :cond_7

    new-instance v1, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerChrome;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-direct {v1, v3, v0}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    invoke-virtual {v1, v5}, Landroid/graphics/drawable/BitmapDrawable;->setFilterBitmap(Z)V

    const/16 v0, 0xa5

    invoke-virtual {v1, v0}, Landroid/graphics/drawable/BitmapDrawable;->setAlpha(I)V

    .line 277
    :cond_7
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->appliedBackground:Landroid/graphics/drawable/Drawable;

    instance-of v0, v0, Landroid/graphics/drawable/LayerDrawable;

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->appliedBackground:Landroid/graphics/drawable/Drawable;

    check-cast v0, Landroid/graphics/drawable/LayerDrawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/LayerDrawable;->getNumberOfLayers()I

    move-result v0

    const/4 v3, 0x4

    if-ne v0, v3, :cond_8

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->appliedBackground:Landroid/graphics/drawable/Drawable;

    check-cast v0, Landroid/graphics/drawable/LayerDrawable;

    invoke-virtual {v0, v5, v1}, Landroid/graphics/drawable/LayerDrawable;->setDrawable(ILandroid/graphics/drawable/Drawable;)V

    .line 278
    :cond_8
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerChrome;->refreshSystemBarColors()V

    .line 279
    const v0, 0x7f09023a

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    if-nez p1, :cond_9

    const/4 p1, 0x0

    goto :goto_3

    :cond_9
    const-string v0, "previewPlayerArtCard"

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object p1

    .line 280
    :goto_3
    if-eqz p1, :cond_b

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1c

    if-lt v0, v1, :cond_b

    if-nez v2, :cond_a

    const v0, -0x1fb762

    goto :goto_4

    :cond_a
    const/high16 v0, -0x1000000

    or-int/2addr v0, v2

    :goto_4
    invoke-virtual {p1, v0}, Landroid/view/View;->setOutlineSpotShadowColor(I)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOutlineAmbientShadowColor(I)V

    .line 281
    :cond_b
    return-void
.end method


# virtual methods
.method protected onAttachedToWindow()V
    .locals 1

    .line 565
    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerChrome;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->observer:Landroid/view/ViewTreeObserver;

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->observer:Landroid/view/ViewTreeObserver;

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->syncTask:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerChrome;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 4

    .line 566
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->closing:Z

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerChrome;->activity()Landroid/app/Activity;

    move-result-object v1

    const/4 v2, 0x0

    if-nez v1, :cond_0

    move-object v1, v2

    goto :goto_0

    :cond_0
    const v3, 0x7f09023a

    invoke-virtual {v1, v3}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    :goto_0
    if-eqz v1, :cond_1

    invoke-virtual {v1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/ViewPropertyAnimator;->cancel()V

    invoke-virtual {v1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/view/ViewPropertyAnimator;->setUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)Landroid/view/ViewPropertyAnimator;

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-virtual {v1, v3}, Landroid/view/View;->setAlpha(F)V

    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Landroid/view/View;->setTranslationY(F)V

    :cond_1
    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->observer:Landroid/view/ViewTreeObserver;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->observer:Landroid/view/ViewTreeObserver;

    invoke-virtual {v1}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->observer:Landroid/view/ViewTreeObserver;

    invoke-virtual {v1, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    :cond_2
    iput-object v2, p0, Lcom/melodix/music/PreviewPlayerChrome;->observer:Landroid/view/ViewTreeObserver;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->syncTask:Ljava/lang/Runnable;

    invoke-virtual {p0, v1}, Lcom/melodix/music/PreviewPlayerChrome;->removeCallbacks(Ljava/lang/Runnable;)Z

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->visualTick:Ljava/lang/Runnable;

    invoke-virtual {p0, v1}, Lcom/melodix/music/PreviewPlayerChrome;->removeCallbacks(Ljava/lang/Runnable;)Z

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->ticking:Z

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerChrome;->restoreHeader()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerChrome;->restoreBackground()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerChrome;->restoreStatusBar()V

    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    return-void
.end method

.method public onGlobalLayout()V
    .locals 0

    .line 564
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerChrome;->sync()V

    return-void
.end method

.method protected onVisibilityChanged(Landroid/view/View;I)V
    .locals 0

    .line 567
    invoke-super {p0, p1, p2}, Landroid/view/View;->onVisibilityChanged(Landroid/view/View;I)V

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerChrome;->syncTask:Ljava/lang/Runnable;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerChrome;->syncTask:Ljava/lang/Runnable;

    invoke-virtual {p0, p1}, Lcom/melodix/music/PreviewPlayerChrome;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method

.method protected onWindowVisibilityChanged(I)V
    .locals 0

    .line 568
    invoke-super {p0, p1}, Landroid/view/View;->onWindowVisibilityChanged(I)V

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerChrome;->syncTask:Ljava/lang/Runnable;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerChrome;->syncTask:Ljava/lang/Runnable;

    invoke-virtual {p0, p1}, Lcom/melodix/music/PreviewPlayerChrome;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method
