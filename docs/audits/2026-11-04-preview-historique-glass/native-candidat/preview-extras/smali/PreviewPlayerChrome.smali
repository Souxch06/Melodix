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

    .prologue
    .line 254
    const-string v0, "non affich\u00e9"

    sput-object v0, Lcom/melodix/music/PreviewPlayerChrome;->state:Ljava/lang/String;

    .line 255
    const-string v0, "\u2014"

    sput-object v0, Lcom/melodix/music/PreviewPlayerChrome;->tintInfo:Ljava/lang/String;

    const-string v0, "\u2014"

    sput-object v0, Lcom/melodix/music/PreviewPlayerChrome;->sizeInfo:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    .prologue
    const/4 v1, 0x3

    .line 77
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 50
    new-array v0, v1, [I

    fill-array-data v0, :array_0

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->topColors:[I

    new-array v0, v1, [I

    fill-array-data v0, :array_1

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->bottomColors:[I

    .line 56
    new-instance v0, Lcom/melodix/music/PreviewPlayerChrome$1;

    invoke-direct {v0, p0}, Lcom/melodix/music/PreviewPlayerChrome$1;-><init>(Lcom/melodix/music/PreviewPlayerChrome;)V

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->visualTick:Ljava/lang/Runnable;

    .line 76
    new-instance v0, Lcom/melodix/music/PreviewPlayerChrome$2;

    invoke-direct {v0, p0}, Lcom/melodix/music/PreviewPlayerChrome$2;-><init>(Lcom/melodix/music/PreviewPlayerChrome;)V

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->syncTask:Ljava/lang/Runnable;

    .line 257
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->artScale:F

    .line 77
    return-void

    .line 50
    nop

    :array_0
    .array-data 4
        -0xedf2e2
        -0xedf2e2
        -0xedf2e2
    .end array-data

    :array_1
    .array-data 4
        -0xf6f9ed
        -0xf6f9ed
        -0xf6f9ed
    .end array-data
.end method

.method static synthetic access$0(Lcom/melodix/music/PreviewPlayerChrome;)Z
    .locals 1

    .prologue
    .line 87
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerChrome;->playerVisible()Z

    move-result v0

    return v0
.end method

.method static synthetic access$1(Lcom/melodix/music/PreviewPlayerChrome;Z)V
    .locals 0

    .prologue
    .line 40
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerChrome;->ticking:Z

    return-void
.end method

.method static synthetic access$10(Lcom/melodix/music/PreviewPlayerChrome;)Landroid/view/View;
    .locals 1

    .prologue
    .line 55
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->shuffleControl:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$11(Lcom/melodix/music/PreviewPlayerChrome;)V
    .locals 0

    .prologue
    .line 561
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerChrome;->sync()V

    return-void
.end method

.method static synthetic access$12(Lcom/melodix/music/PreviewPlayerChrome;)Z
    .locals 1

    .prologue
    .line 42
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->closing:Z

    return v0
.end method

.method static synthetic access$13(Lcom/melodix/music/PreviewPlayerChrome;F)V
    .locals 0

    .prologue
    .line 199
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerChrome;->updateStatusForTranslation(F)V

    return-void
.end method

.method static synthetic access$14(Lcom/melodix/music/PreviewPlayerChrome;F)I
    .locals 1

    .prologue
    .line 78
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v0

    return v0
.end method

.method static synthetic access$15(Lcom/melodix/music/PreviewPlayerChrome;)V
    .locals 0

    .prologue
    .line 446
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerChrome;->navigateBack()V

    return-void
.end method

.method static synthetic access$16(Lcom/melodix/music/PreviewPlayerChrome;Landroid/view/View;)Landroid/animation/ValueAnimator$AnimatorUpdateListener;
    .locals 1

    .prologue
    .line 210
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerChrome;->followStatus(Landroid/view/View;)Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$17(Lcom/melodix/music/PreviewPlayerChrome;Z)V
    .locals 0

    .prologue
    .line 42
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerChrome;->closing:Z

    return-void
.end method

.method static synthetic access$18(Lcom/melodix/music/PreviewPlayerChrome;Z)V
    .locals 0

    .prologue
    .line 42
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerChrome;->bypassClose:Z

    return-void
.end method

.method static synthetic access$2(Lcom/melodix/music/PreviewPlayerChrome;)Landroid/app/Activity;
    .locals 1

    .prologue
    .line 79
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerChrome;->activity()Landroid/app/Activity;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$3(Lcom/melodix/music/PreviewPlayerChrome;Landroid/app/Activity;)V
    .locals 0

    .prologue
    .line 283
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerChrome;->updateTint(Landroid/app/Activity;)V

    return-void
.end method

.method static synthetic access$4(Lcom/melodix/music/PreviewPlayerChrome;Landroid/app/Activity;)V
    .locals 0

    .prologue
    .line 302
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerChrome;->breathe(Landroid/app/Activity;)V

    return-void
.end method

.method static synthetic access$5(Lcom/melodix/music/PreviewPlayerChrome;)Lcom/melodix/music/PreviewPlayerDecoration;
    .locals 1

    .prologue
    .line 52
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->repeatArt:Lcom/melodix/music/PreviewPlayerDecoration;

    return-object v0
.end method

.method static synthetic access$6(Lcom/melodix/music/PreviewPlayerChrome;)Landroid/view/View;
    .locals 1

    .prologue
    .line 55
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->repeatControl:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$7(Lcom/melodix/music/PreviewPlayerChrome;)Lcom/melodix/music/PreviewPlayerLikeArt;
    .locals 1

    .prologue
    .line 53
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->likeArt:Lcom/melodix/music/PreviewPlayerLikeArt;

    return-object v0
.end method

.method static synthetic access$8(Lcom/melodix/music/PreviewPlayerChrome;)Landroid/view/View;
    .locals 1

    .prologue
    .line 54
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->likeControl:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$9(Lcom/melodix/music/PreviewPlayerChrome;)Lcom/melodix/music/PreviewPlayerDecoration;
    .locals 1

    .prologue
    .line 52
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->shuffleDot:Lcom/melodix/music/PreviewPlayerDecoration;

    return-object v0
.end method

.method private activity()Landroid/app/Activity;
    .locals 4

    .prologue
    .line 80
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerChrome;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 81
    const/4 v1, 0x0

    move v2, v1

    :goto_0
    const/16 v1, 0x8

    if-ge v2, v1, :cond_0

    instance-of v1, v0, Landroid/content/ContextWrapper;

    if-nez v1, :cond_1

    .line 85
    :cond_0
    instance-of v1, v0, Landroid/app/Activity;

    if-eqz v1, :cond_3

    check-cast v0, Landroid/app/Activity;

    :goto_1
    return-object v0

    .line 82
    :cond_1
    instance-of v1, v0, Landroid/app/Activity;

    if-eqz v1, :cond_2

    check-cast v0, Landroid/app/Activity;

    goto :goto_1

    :cond_2
    move-object v1, v0

    .line 83
    check-cast v1, Landroid/content/ContextWrapper;

    invoke-virtual {v1}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object v3

    if-eq v3, v0, :cond_0

    .line 81
    add-int/lit8 v1, v2, 0x1

    move v2, v1

    move-object v0, v3

    goto :goto_0

    .line 85
    :cond_3
    const/4 v0, 0x0

    goto :goto_1
.end method

.method private applyBackground(Landroid/app/Activity;)V
    .locals 11

    .prologue
    const/4 v10, 0x3

    const/4 v9, 0x2

    const/4 v8, 0x0

    const/4 v7, 0x1

    .line 228
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->chromeApplied:Z

    if-eqz v0, :cond_1

    .line 244
    :cond_0
    :goto_0
    return-void

    .line 229
    :cond_1
    const v0, 0x7f09022f

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->root:Landroid/view/View;

    const v0, 0x7f09023a

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->panel:Landroid/view/View;

    .line 230
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->root:Landroid/view/View;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->panel:Landroid/view/View;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->panel:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 231
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->root:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->rootBackground:Landroid/graphics/drawable/Drawable;

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->panel:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->panelBackground:Landroid/graphics/drawable/Drawable;

    .line 232
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerChrome;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f08013c

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerChrome;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/res/Resources;->getDrawable(ILandroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->appliedBackground:Landroid/graphics/drawable/Drawable;

    .line 233
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->root:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getPaddingLeft()I

    move-result v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->root:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getPaddingTop()I

    move-result v1

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerChrome;->root:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getPaddingRight()I

    move-result v2

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerChrome;->root:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getPaddingBottom()I

    move-result v3

    .line 234
    new-instance v4, Landroid/graphics/drawable/GradientDrawable;

    sget-object v5, Landroid/graphics/drawable/GradientDrawable$Orientation;->TOP_BOTTOM:Landroid/graphics/drawable/GradientDrawable$Orientation;

    new-array v6, v9, [I

    invoke-direct {v4, v5, v6}, Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable$Orientation;[I)V

    iput-object v4, p0, Lcom/melodix/music/PreviewPlayerChrome;->tintLayer:Landroid/graphics/drawable/GradientDrawable;

    .line 236
    new-instance v4, Landroid/graphics/drawable/GradientDrawable;

    sget-object v5, Landroid/graphics/drawable/GradientDrawable$Orientation;->TOP_BOTTOM:Landroid/graphics/drawable/GradientDrawable$Orientation;

    new-array v6, v10, [I

    fill-array-data v6, :array_0

    invoke-direct {v4, v5, v6}, Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable$Orientation;[I)V

    iput-object v4, p0, Lcom/melodix/music/PreviewPlayerChrome;->scrim:Landroid/graphics/drawable/GradientDrawable;

    .line 237
    new-instance v4, Landroid/graphics/drawable/LayerDrawable;

    const/4 v5, 0x4

    new-array v5, v5, [Landroid/graphics/drawable/Drawable;

    iget-object v6, p0, Lcom/melodix/music/PreviewPlayerChrome;->appliedBackground:Landroid/graphics/drawable/Drawable;

    aput-object v6, v5, v8

    new-instance v6, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v6, v8}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    aput-object v6, v5, v7

    iget-object v6, p0, Lcom/melodix/music/PreviewPlayerChrome;->scrim:Landroid/graphics/drawable/GradientDrawable;

    aput-object v6, v5, v9

    iget-object v6, p0, Lcom/melodix/music/PreviewPlayerChrome;->tintLayer:Landroid/graphics/drawable/GradientDrawable;

    aput-object v6, v5, v10

    invoke-direct {v4, v5}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    iput-object v4, p0, Lcom/melodix/music/PreviewPlayerChrome;->appliedBackground:Landroid/graphics/drawable/Drawable;

    .line 240
    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerChrome;->rootBackground:Landroid/graphics/drawable/Drawable;

    iput-object v4, p0, Lcom/melodix/music/PreviewPlayerChrome;->backdrop:Landroid/graphics/drawable/Drawable;

    .line 241
    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerChrome;->previousScreen:Landroid/graphics/Bitmap;

    if-eqz v4, :cond_2

    new-instance v4, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerChrome;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    iget-object v6, p0, Lcom/melodix/music/PreviewPlayerChrome;->previousScreen:Landroid/graphics/Bitmap;

    invoke-direct {v4, v5, v6}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    const/16 v5, 0x77

    invoke-virtual {v4, v5}, Landroid/graphics/drawable/BitmapDrawable;->setGravity(I)V

    invoke-virtual {v4, v7}, Landroid/graphics/drawable/BitmapDrawable;->setFilterBitmap(Z)V

    iput-object v4, p0, Lcom/melodix/music/PreviewPlayerChrome;->backdrop:Landroid/graphics/drawable/Drawable;

    .line 242
    :cond_2
    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerChrome;->root:Landroid/view/View;

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerChrome;->backdrop:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v4, v5}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerChrome;->root:Landroid/view/View;

    invoke-virtual {v4, v0, v1, v2, v3}, Landroid/view/View;->setPadding(IIII)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->panel:Landroid/view/View;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->appliedBackground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->tintSource:Landroid/graphics/drawable/Drawable;

    .line 243
    iput-boolean v7, p0, Lcom/melodix/music/PreviewPlayerChrome;->chromeApplied:Z

    goto/16 :goto_0

    .line 236
    nop

    :array_0
    .array-data 4
        0x400a0614
        -0x4cf5f9ec
        -0xdf5f9ec
    .end array-data
.end method

.method private applyStatusBar(Landroid/app/Activity;)V
    .locals 7

    .prologue
    const/4 v1, 0x0

    .line 165
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-nez v0, :cond_1

    .line 190
    :cond_0
    :goto_0
    return-void

    .line 166
    :cond_1
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 167
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerChrome;->statusWindow:Landroid/view/Window;

    if-nez v2, :cond_3

    .line 168
    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->statusWindow:Landroid/view/Window;

    iput-object v3, p0, Lcom/melodix/music/PreviewPlayerChrome;->statusDecor:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/Window;->getStatusBarColor()I

    move-result v2

    iput v2, p0, Lcom/melodix/music/PreviewPlayerChrome;->originalStatusColor:I

    invoke-virtual {v0}, Landroid/view/Window;->getNavigationBarColor()I

    move-result v2

    iput v2, p0, Lcom/melodix/music/PreviewPlayerChrome;->originalNavColor:I

    .line 169
    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v2

    iget v2, v2, Landroid/view/WindowManager$LayoutParams;->flags:I

    iput v2, p0, Lcom/melodix/music/PreviewPlayerChrome;->originalStatusFlags:I

    invoke-virtual {v3}, Landroid/view/View;->getSystemUiVisibility()I

    move-result v2

    iput v2, p0, Lcom/melodix/music/PreviewPlayerChrome;->originalStatusUi:I

    .line 170
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x1d

    if-lt v2, v4, :cond_2

    invoke-virtual {v0}, Landroid/view/Window;->isNavigationBarContrastEnforced()Z

    move-result v2

    iput-boolean v2, p0, Lcom/melodix/music/PreviewPlayerChrome;->originalNavContrast:Z

    invoke-virtual {v0, v1}, Landroid/view/Window;->setNavigationBarContrastEnforced(Z)V

    .line 171
    :cond_2
    const/high16 v2, 0xc000000

    invoke-virtual {v0, v2}, Landroid/view/Window;->clearFlags(I)V

    .line 172
    const/high16 v2, -0x80000000

    invoke-virtual {v0, v2}, Landroid/view/Window;->addFlags(I)V

    .line 173
    invoke-virtual {v3}, Landroid/view/View;->getSystemUiVisibility()I

    move-result v0

    and-int/lit16 v0, v0, -0x2011

    invoke-virtual {v3, v0}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 174
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerChrome;->refreshSystemBarColors()V

    .line 178
    :cond_3
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x23

    if-lt v0, v2, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->statusDecor:Landroid/view/View;

    if-ne v0, v3, :cond_0

    .line 179
    invoke-virtual {v3}, Landroid/view/View;->getRootWindowInsets()Landroid/view/WindowInsets;

    move-result-object v4

    if-nez v4, :cond_8

    move v2, v1

    :goto_1
    if-nez v4, :cond_9

    move v0, v1

    .line 180
    :goto_2
    if-lez v2, :cond_5

    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    move-result v4

    if-lez v4, :cond_5

    .line 181
    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerChrome;->statusOverlay:Landroid/graphics/drawable/GradientDrawable;

    if-nez v4, :cond_4

    new-instance v4, Landroid/graphics/drawable/GradientDrawable;

    sget-object v5, Landroid/graphics/drawable/GradientDrawable$Orientation;->LEFT_RIGHT:Landroid/graphics/drawable/GradientDrawable$Orientation;

    iget-object v6, p0, Lcom/melodix/music/PreviewPlayerChrome;->topColors:[I

    invoke-direct {v4, v5, v6}, Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable$Orientation;[I)V

    iput-object v4, p0, Lcom/melodix/music/PreviewPlayerChrome;->statusOverlay:Landroid/graphics/drawable/GradientDrawable;

    invoke-virtual {v3}, Landroid/view/View;->getOverlay()Landroid/view/ViewOverlay;

    move-result-object v4

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerChrome;->statusOverlay:Landroid/graphics/drawable/GradientDrawable;

    invoke-virtual {v4, v5}, Landroid/view/ViewOverlay;->add(Landroid/graphics/drawable/Drawable;)V

    .line 182
    :cond_4
    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerChrome;->statusOverlay:Landroid/graphics/drawable/GradientDrawable;

    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    move-result v5

    invoke-virtual {v4, v1, v1, v5, v2}, Landroid/graphics/drawable/GradientDrawable;->setBounds(IIII)V

    .line 184
    :cond_5
    if-lez v0, :cond_7

    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    move-result v2

    if-lez v2, :cond_7

    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    move-result v2

    if-lez v2, :cond_7

    .line 185
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerChrome;->navOverlay:Landroid/graphics/drawable/GradientDrawable;

    if-nez v2, :cond_6

    new-instance v2, Landroid/graphics/drawable/GradientDrawable;

    sget-object v4, Landroid/graphics/drawable/GradientDrawable$Orientation;->LEFT_RIGHT:Landroid/graphics/drawable/GradientDrawable$Orientation;

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerChrome;->bottomColors:[I

    invoke-direct {v2, v4, v5}, Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable$Orientation;[I)V

    iput-object v2, p0, Lcom/melodix/music/PreviewPlayerChrome;->navOverlay:Landroid/graphics/drawable/GradientDrawable;

    invoke-virtual {v3}, Landroid/view/View;->getOverlay()Landroid/view/ViewOverlay;

    move-result-object v2

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerChrome;->navOverlay:Landroid/graphics/drawable/GradientDrawable;

    invoke-virtual {v2, v4}, Landroid/view/ViewOverlay;->add(Landroid/graphics/drawable/Drawable;)V

    .line 186
    :cond_6
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerChrome;->navOverlay:Landroid/graphics/drawable/GradientDrawable;

    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    move-result v4

    sub-int v0, v4, v0

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    move-result v4

    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    move-result v3

    invoke-virtual {v2, v1, v0, v4, v3}, Landroid/graphics/drawable/GradientDrawable;->setBounds(IIII)V

    .line 188
    :cond_7
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->panel:Landroid/view/View;

    if-nez v0, :cond_a

    const/4 v0, 0x0

    :goto_3
    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerChrome;->updateStatusForTranslation(F)V

    goto/16 :goto_0

    .line 179
    :cond_8
    invoke-virtual {v4}, Landroid/view/WindowInsets;->getSystemWindowInsetTop()I

    move-result v0

    move v2, v0

    goto :goto_1

    :cond_9
    invoke-virtual {v4}, Landroid/view/WindowInsets;->getSystemWindowInsetBottom()I

    move-result v0

    goto :goto_2

    .line 188
    :cond_a
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->panel:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getTranslationY()F

    move-result v0

    goto :goto_3
.end method

.method private static blend(IIF)I
    .locals 6

    .prologue
    .line 192
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

    .line 193
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

    .line 194
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

    .line 195
    invoke-static {p0}, Landroid/graphics/Color;->blue(I)I

    move-result v3

    int-to-float v3, v3

    invoke-static {p1}, Landroid/graphics/Color;->blue(I)I

    move-result v4

    invoke-static {p0}, Landroid/graphics/Color;->blue(I)I

    move-result v5

    sub-int/2addr v4, v5

    int-to-float v4, v4

    mul-float/2addr v4, p2

    add-float/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    .line 196
    invoke-static {v0, v1, v2, v3}, Landroid/graphics/Color;->argb(IIII)I

    move-result v0

    return v0
.end method

.method private breathe(Landroid/app/Activity;)V
    .locals 3

    .prologue
    .line 303
    const v0, 0x7f09023e

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    const v0, 0x7f09023a

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 304
    if-nez v0, :cond_1

    const/4 v0, 0x0

    move-object v1, v0

    .line 305
    :goto_0
    if-eqz v2, :cond_0

    if-nez v1, :cond_2

    .line 313
    :cond_0
    :goto_1
    return-void

    .line 304
    :cond_1
    const-string v1, "previewPlayerArtCard"

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v0

    move-object v1, v0

    goto :goto_0

    .line 306
    :cond_2
    invoke-virtual {v2}, Landroid/view/View;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v0

    if-nez v0, :cond_4

    const-string v0, ""

    .line 307
    :goto_2
    const-string v2, "Mettre en pause"

    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_5

    const-string v2, "Lecture demand\u00e9e"

    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_5

    const/4 v0, 0x0

    .line 308
    :goto_3
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerChrome;->artPlaying:Ljava/lang/Boolean;

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerChrome;->artPlaying:Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eq v2, v0, :cond_0

    .line 309
    :cond_3
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->artPlaying:Ljava/lang/Boolean;

    iget v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->artScale:F

    .line 310
    invoke-virtual {v1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 311
    invoke-virtual {v1, v0}, Landroid/view/View;->setScaleX(F)V

    invoke-virtual {v1, v0}, Landroid/view/View;->setScaleY(F)V

    goto :goto_1

    .line 306
    :cond_4
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_2

    .line 307
    :cond_5
    const/4 v0, 0x1

    goto :goto_3
.end method

.method public static captureBeforeExpand(Landroid/app/Activity;)V
    .locals 12

    .prologue
    const/4 v1, 0x0

    .line 128
    const v0, 0x7f09023a

    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const v2, 0x7f09022f

    invoke-virtual {p0, v2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    .line 129
    if-nez v0, :cond_1

    move-object v0, v1

    .line 130
    :goto_0
    instance-of v3, v0, Lcom/melodix/music/PreviewPlayerChrome;

    if-eqz v3, :cond_0

    if-nez v2, :cond_2

    .line 142
    :cond_0
    :goto_1
    return-void

    .line 129
    :cond_1
    const-string v3, "previewPlayerChrome"

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v0

    goto :goto_0

    .line 131
    :cond_2
    check-cast v0, Lcom/melodix/music/PreviewPlayerChrome;

    .line 132
    iput-object v1, v0, Lcom/melodix/music/PreviewPlayerChrome;->previousScreen:Landroid/graphics/Bitmap;

    .line 133
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x1a

    if-lt v3, v4, :cond_3

    invoke-static {}, Landroid/animation/ValueAnimator;->areAnimatorsEnabled()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 134
    :cond_3
    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    move-result v3

    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    move-result v4

    .line 135
    if-lez v3, :cond_0

    if-lez v4, :cond_0

    .line 138
    const/high16 v5, 0x3f800000    # 1.0f

    const-wide v6, 0x41324f8000000000L    # 1200000.0

    int-to-double v8, v3

    int-to-double v10, v4

    mul-double/2addr v8, v10

    div-double/2addr v6, v8

    :try_start_0
    invoke-static {v6, v7}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v6

    double-to-float v6, v6

    invoke-static {v5, v6}, Ljava/lang/Math;->min(FF)F

    move-result v5

    .line 139
    const/4 v6, 0x1

    int-to-float v3, v3

    mul-float/2addr v3, v5

    float-to-int v3, v3

    invoke-static {v6, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    const/4 v6, 0x1

    int-to-float v4, v4

    mul-float/2addr v4, v5

    float-to-int v4, v4

    invoke-static {v6, v4}, Ljava/lang/Math;->max(II)I

    move-result v4

    sget-object v6, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v3, v4, v6}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v3

    .line 140
    new-instance v4, Landroid/graphics/Canvas;

    invoke-direct {v4, v3}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    invoke-virtual {v4, v5, v5}, Landroid/graphics/Canvas;->scale(FF)V

    invoke-static {p0, v2, v4}, Lcom/melodix/music/PreviewPlayerChrome;->drawNativeSnapshot(Landroid/app/Activity;Landroid/view/View;Landroid/graphics/Canvas;)V

    iput-object v3, v0, Lcom/melodix/music/PreviewPlayerChrome;->previousScreen:Landroid/graphics/Bitmap;
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_1

    .line 141
    :catch_0
    move-exception v2

    iput-object v1, v0, Lcom/melodix/music/PreviewPlayerChrome;->previousScreen:Landroid/graphics/Bitmap;

    goto :goto_1

    :catch_1
    move-exception v2

    iput-object v1, v0, Lcom/melodix/music/PreviewPlayerChrome;->previousScreen:Landroid/graphics/Bitmap;

    goto :goto_1
.end method

.method private static clearConstraintLimits(Landroid/view/View;)V
    .locals 6

    .prologue
    const/4 v0, 0x0

    .line 316
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    .line 317
    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "matchConstraintMaxWidth"

    aput-object v3, v2, v0

    const/4 v3, 0x1

    const-string v4, "matchConstraintMaxHeight"

    aput-object v4, v2, v3

    array-length v3, v2

    :goto_0
    if-lt v0, v3, :cond_1

    .line 320
    :try_start_0
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v2, "dimensionRatio"

    invoke-virtual {v0, v2}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_0

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 321
    :cond_0
    :goto_1
    return-void

    .line 317
    :cond_1
    aget-object v4, v2, v0

    .line 318
    :try_start_1
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v5

    if-eqz v5, :cond_2

    const/4 v5, 0x0

    invoke-virtual {v4, v1, v5}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 317
    :cond_2
    :goto_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :catch_0
    move-exception v0

    goto :goto_1

    :catch_1
    move-exception v4

    goto :goto_2
.end method

.method private closeAnimated(Landroid/app/Activity;Landroid/view/View;)V
    .locals 4

    .prologue
    .line 428
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->closing:Z

    .line 429
    invoke-virtual {p2}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 430
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

    const-wide/16 v2, 0x118

    invoke-virtual {v0, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    .line 431
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

    invoke-direct {v1, p0, p2, p1}, Lcom/melodix/music/PreviewPlayerChrome$4;-><init>(Lcom/melodix/music/PreviewPlayerChrome;Landroid/view/View;Landroid/app/Activity;)V

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    .line 444
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 445
    return-void
.end method

.method private static contentHeight(Landroid/view/View;)I
    .locals 5

    .prologue
    const/4 v1, 0x0

    .line 333
    const-string v0, "previewPlayerSpacer"

    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 338
    :goto_0
    return v1

    .line 334
    :cond_0
    instance-of v0, p0, Landroid/widget/LinearLayout;

    if-eqz v0, :cond_1

    move-object v0, p0

    check-cast v0, Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getOrientation()I

    move-result v0

    const/4 v2, 0x1

    if-eq v0, v2, :cond_2

    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v1

    goto :goto_0

    .line 335
    :cond_2
    check-cast p0, Landroid/widget/LinearLayout;

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getPaddingTop()I

    move-result v0

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getPaddingBottom()I

    move-result v2

    add-int/2addr v0, v2

    move v2, v1

    move v3, v0

    .line 336
    :goto_1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    if-lt v2, v0, :cond_3

    move v1, v3

    .line 338
    goto :goto_0

    .line 336
    :cond_3
    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v1

    const/16 v4, 0x8

    if-ne v1, v4, :cond_4

    move v1, v3

    :goto_2
    add-int/lit8 v0, v2, 0x1

    move v2, v0

    move v3, v1

    goto :goto_1

    :cond_4
    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerChrome;->contentHeight(Landroid/view/View;)I

    move-result v1

    add-int/2addr v3, v1

    .line 337
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    instance-of v0, v1, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v0, :cond_5

    move-object v0, v1

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    iget v0, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;

    iget v1, v1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    add-int/2addr v0, v1

    add-int v1, v3, v0

    goto :goto_2

    :cond_5
    move v1, v3

    goto :goto_2
.end method

.method static dominant(Landroid/graphics/Bitmap;)I
    .locals 18

    .prologue
    .line 263
    if-eqz p0, :cond_0

    invoke-virtual/range {p0 .. p0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v2

    if-nez v2, :cond_0

    invoke-virtual/range {p0 .. p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    if-lez v2, :cond_0

    invoke-virtual/range {p0 .. p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    if-gtz v2, :cond_1

    :cond_0
    const/4 v2, 0x0

    .line 272
    :goto_0
    return v2

    .line 264
    :cond_1
    const-wide/16 v10, 0x0

    const-wide/16 v8, 0x0

    const-wide/16 v6, 0x0

    const-wide/16 v4, 0x0

    const/4 v2, 0x1

    invoke-virtual/range {p0 .. p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    invoke-virtual/range {p0 .. p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v12

    invoke-static {v3, v12}, Ljava/lang/Math;->min(II)I

    move-result v3

    div-int/lit8 v3, v3, 0x18

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v12

    .line 265
    const/4 v2, 0x0

    :goto_1
    invoke-virtual/range {p0 .. p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    if-lt v2, v3, :cond_2

    .line 271
    const-wide/16 v2, 0x0

    cmp-long v2, v4, v2

    if-nez v2, :cond_5

    const/4 v2, 0x0

    goto :goto_0

    .line 265
    :cond_2
    const/4 v3, 0x0

    :goto_2
    invoke-virtual/range {p0 .. p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v13

    if-lt v3, v13, :cond_3

    add-int/2addr v2, v12

    goto :goto_1

    .line 266
    :cond_3
    move-object/from16 v0, p0

    invoke-virtual {v0, v3, v2}, Landroid/graphics/Bitmap;->getPixel(II)I

    move-result v13

    invoke-static {v13}, Landroid/graphics/Color;->alpha(I)I

    move-result v14

    const/16 v15, 0x80

    if-ge v14, v15, :cond_4

    .line 265
    :goto_3
    add-int/2addr v3, v12

    goto :goto_2

    .line 267
    :cond_4
    invoke-static {v13}, Landroid/graphics/Color;->red(I)I

    move-result v14

    invoke-static {v13}, Landroid/graphics/Color;->green(I)I

    move-result v15

    invoke-static {v13}, Landroid/graphics/Color;->blue(I)I

    move-result v16

    invoke-static/range {v15 .. v16}, Ljava/lang/Math;->max(II)I

    move-result v15

    invoke-static {v14, v15}, Ljava/lang/Math;->max(II)I

    move-result v14

    invoke-static {v13}, Landroid/graphics/Color;->red(I)I

    move-result v15

    invoke-static {v13}, Landroid/graphics/Color;->green(I)I

    move-result v16

    invoke-static {v13}, Landroid/graphics/Color;->blue(I)I

    move-result v17

    invoke-static/range {v16 .. v17}, Ljava/lang/Math;->min(II)I

    move-result v16

    invoke-static/range {v15 .. v16}, Ljava/lang/Math;->min(II)I

    move-result v15

    .line 268
    sub-int/2addr v14, v15

    div-int/lit8 v14, v14, 0x20

    add-int/lit8 v14, v14, 0x1

    .line 269
    invoke-static {v13}, Landroid/graphics/Color;->red(I)I

    move-result v15

    mul-int/2addr v15, v14

    int-to-long v0, v15

    move-wide/from16 v16, v0

    add-long v10, v10, v16

    invoke-static {v13}, Landroid/graphics/Color;->green(I)I

    move-result v15

    mul-int/2addr v15, v14

    int-to-long v0, v15

    move-wide/from16 v16, v0

    add-long v8, v8, v16

    invoke-static {v13}, Landroid/graphics/Color;->blue(I)I

    move-result v13

    mul-int/2addr v13, v14

    int-to-long v0, v13

    move-wide/from16 v16, v0

    add-long v6, v6, v16

    int-to-long v14, v14

    add-long/2addr v4, v14

    goto :goto_3

    .line 272
    :cond_5
    div-long v2, v10, v4

    long-to-int v2, v2

    div-long/2addr v8, v4

    long-to-int v3, v8

    div-long v4, v6, v4

    long-to-int v4, v4

    invoke-static {v2, v3, v4}, Landroid/graphics/Color;->rgb(III)I

    move-result v2

    goto/16 :goto_0
.end method

.method private dp(F)I
    .locals 2

    .prologue
    .line 78
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerChrome;->getResources()Landroid/content/res/Resources;

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

.method private static drawNativeSnapshot(Landroid/app/Activity;Landroid/view/View;Landroid/graphics/Canvas;)V
    .locals 0
    invoke-static {p0, p1, p2}, Lcom/melodix/music/PreviewSnapshotRenderer;->draw(Landroid/app/Activity;Landroid/view/View;Landroid/graphics/Canvas;)V
    return-void
.end method

.method private findCollapse(Landroid/view/View;)Landroid/view/View;
    .locals 2

    .prologue
    .line 410
    const-string v1, "R\u00e9duire le lecteur"

    invoke-virtual {p1}, Landroid/view/View;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v0

    if-nez v0, :cond_0

    const-string v0, ""

    :goto_0
    invoke-virtual {v1, v0}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 412
    :goto_1
    return-object p1

    .line 410
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v0

    goto :goto_0

    .line 411
    :cond_1
    instance-of v0, p1, Landroid/view/ViewGroup;

    if-eqz v0, :cond_2

    check-cast p1, Landroid/view/ViewGroup;

    const/4 v0, 0x0

    :goto_2
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-lt v0, v1, :cond_3

    .line 412
    :cond_2
    const/4 p1, 0x0

    goto :goto_1

    .line 411
    :cond_3
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/melodix/music/PreviewPlayerChrome;->findCollapse(Landroid/view/View;)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_4

    move-object p1, v1

    goto :goto_1

    :cond_4
    add-int/lit8 v0, v0, 0x1

    goto :goto_2
.end method

.method private followStatus(Landroid/view/View;)Landroid/animation/ValueAnimator$AnimatorUpdateListener;
    .locals 1

    .prologue
    .line 211
    new-instance v0, Lcom/melodix/music/PreviewPlayerChrome$3;

    invoke-direct {v0, p0, p1}, Lcom/melodix/music/PreviewPlayerChrome$3;-><init>(Lcom/melodix/music/PreviewPlayerChrome;Landroid/view/View;)V

    return-object v0
.end method

.method private hideHeader(Landroid/app/Activity;)V
    .locals 3

    .prologue
    .line 89
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->headerHidden:Z

    if-eqz v0, :cond_1

    .line 96
    :cond_0
    :goto_0
    return-void

    .line 90
    :cond_1
    const v0, 0x7f090230

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const v1, 0x7f09022f

    invoke-virtual {p1, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 91
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    instance-of v2, v2, Landroid/view/View;

    if-eqz v2, :cond_0

    .line 92
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 93
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    if-ne v2, v1, :cond_0

    .line 94
    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->header:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v1

    iput v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->previousHeaderVisibility:I

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->headerHidden:Z

    .line 95
    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0
.end method

.method public static interceptBack(Landroid/app/Activity;)Z
    .locals 6

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 416
    const v0, 0x7f09023a

    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    .line 417
    if-eqz v3, :cond_0

    invoke-virtual {v3}, Landroid/view/View;->isShown()Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    move v0, v1

    .line 425
    :goto_0
    return v0

    .line 418
    :cond_1
    const-string v0, "previewPlayerChrome"

    invoke-virtual {v3, v0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v0

    .line 419
    instance-of v4, v0, Lcom/melodix/music/PreviewPlayerChrome;

    if-nez v4, :cond_2

    move v0, v1

    goto :goto_0

    .line 420
    :cond_2
    check-cast v0, Lcom/melodix/music/PreviewPlayerChrome;

    .line 421
    iget-boolean v4, v0, Lcom/melodix/music/PreviewPlayerChrome;->bypassClose:Z

    if-eqz v4, :cond_3

    move v0, v1

    goto :goto_0

    .line 422
    :cond_3
    iget-boolean v4, v0, Lcom/melodix/music/PreviewPlayerChrome;->closing:Z

    if-eqz v4, :cond_4

    move v0, v2

    goto :goto_0

    .line 423
    :cond_4
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x1a

    if-lt v4, v5, :cond_5

    invoke-static {}, Landroid/animation/ValueAnimator;->areAnimatorsEnabled()Z

    move-result v4

    if-nez v4, :cond_5

    move v0, v1

    goto :goto_0

    .line 424
    :cond_5
    invoke-direct {v0, p0, v3}, Lcom/melodix/music/PreviewPlayerChrome;->closeAnimated(Landroid/app/Activity;Landroid/view/View;)V

    move v0, v2

    .line 425
    goto :goto_0
.end method

.method private landscape(Landroid/app/Activity;)V
    .locals 13

    .prologue
    const/high16 v12, 0x42600000    # 56.0f

    const/high16 v11, 0x42000000    # 32.0f

    const/high16 v7, 0x3f800000    # 1.0f

    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 341
    const v0, 0x7f09023a

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    instance-of v0, v2, Landroid/widget/ScrollView;

    if-nez v0, :cond_1

    .line 393
    :cond_0
    :goto_0
    return-void

    .line 342
    :cond_1
    const-string v0, "previewPlayerArtFrame"

    invoke-virtual {v2, v0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v8

    const-string v0, "previewPlayerArtCard"

    invoke-virtual {v2, v0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v9

    .line 343
    if-eqz v8, :cond_0

    if-eqz v9, :cond_0

    invoke-virtual {v8}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v0, v0, Landroid/widget/LinearLayout;

    if-eqz v0, :cond_0

    .line 344
    invoke-virtual {v8}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    .line 346
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerChrome;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    if-eq v0, v1, :cond_0

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    instance-of v1, v1, Landroid/widget/LinearLayout;

    if-eqz v1, :cond_0

    .line 347
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerChrome;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v1

    iget v1, v1, Landroid/content/res/Configuration;->orientation:I

    if-ne v1, v5, :cond_d

    move v4, v5

    :goto_1
    move-object v1, v2

    .line 348
    check-cast v1, Landroid/widget/ScrollView;

    invoke-virtual {v1}, Landroid/widget/ScrollView;->isFillViewport()Z

    move-result v3

    if-nez v3, :cond_2

    invoke-virtual {v1, v5}, Landroid/widget/ScrollView;->setFillViewport(Z)V

    .line 349
    :cond_2
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    .line 350
    instance-of v1, v3, Landroid/widget/LinearLayout$LayoutParams;

    if-eqz v1, :cond_3

    move-object v1, v3

    check-cast v1, Landroid/widget/LinearLayout$LayoutParams;

    iget v1, v1, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    cmpl-float v1, v1, v7

    if-eqz v1, :cond_3

    .line 351
    check-cast v3, Landroid/widget/LinearLayout$LayoutParams;

    iput v6, v3, Landroid/widget/LinearLayout$LayoutParams;->height:I

    iput v7, v3, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 354
    :cond_3
    if-eqz v4, :cond_e

    move v1, v5

    .line 355
    :goto_2
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getOrientation()I

    move-result v3

    if-eq v3, v1, :cond_13

    .line 356
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 357
    if-eqz v4, :cond_f

    const/16 v1, 0x11

    :goto_3
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    move v3, v6

    .line 358
    :goto_4
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v1

    if-lt v3, v1, :cond_10

    .line 366
    :cond_4
    :goto_5
    if-eqz v4, :cond_14

    invoke-direct {p0, v11}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v1

    .line 367
    :goto_6
    invoke-virtual {v2}, Landroid/view/View;->getPaddingLeft()I

    move-result v3

    if-eq v3, v1, :cond_5

    invoke-virtual {v2}, Landroid/view/View;->getPaddingTop()I

    move-result v3

    invoke-virtual {v2}, Landroid/view/View;->getPaddingBottom()I

    move-result v7

    invoke-virtual {v2, v1, v3, v1, v7}, Landroid/view/View;->setPadding(IIII)V

    .line 368
    :cond_5
    invoke-virtual {v8}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    .line 369
    instance-of v3, v1, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v3, :cond_7

    .line 370
    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 371
    if-eqz v4, :cond_15

    move v7, v6

    :goto_7
    if-eqz v4, :cond_16

    invoke-direct {p0, v11}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v3

    .line 372
    :goto_8
    iget v10, v1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    if-ne v10, v7, :cond_6

    iget v10, v1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    if-eq v10, v3, :cond_7

    :cond_6
    iput v7, v1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    iput v3, v1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    invoke-virtual {v8, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 375
    :cond_7
    const v1, 0x7f09023d

    invoke-virtual {p1, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    if-nez v1, :cond_17

    const/4 v1, 0x0

    :goto_9
    move-object v3, v1

    :goto_a
    nop

    instance-of v1, v3, Landroid/view/ViewGroup;

    if-eqz v1, :cond_8

    invoke-virtual {v2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    if-ne v3, v1, :cond_18

    .line 380
    :cond_8
    if-eqz v4, :cond_1e

    move v1, v6

    move v2, v6

    :goto_b
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v3

    if-lt v1, v3, :cond_19

    .line 381
    :goto_c
    invoke-virtual {v8}, Landroid/view/View;->getWidth()I

    move-result v3

    if-eqz v4, :cond_1b

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getHeight()I

    move-result v0

    sub-int/2addr v0, v2

    invoke-direct {p0, v12}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v1

    sub-int/2addr v0, v1

    move v1, v0

    .line 382
    :goto_d
    if-lez v1, :cond_0

    if-lez v3, :cond_0

    .line 383
    const/high16 v0, 0x42f00000    # 120.0f

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v2

    if-eqz v4, :cond_1c

    const/16 v0, 0x280

    :goto_e
    int-to-float v0, v0

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v0

    invoke-static {v1, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    invoke-static {v3, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    invoke-static {v2, v0}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 384
    invoke-virtual {v9}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    invoke-virtual {v8}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    .line 387
    const/high16 v3, 0x439f0000    # 318.0f

    invoke-direct {p0, v3}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v3

    invoke-static {v1, v3}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 388
    iget v7, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    if-ne v7, v3, :cond_9

    iget v7, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-eq v7, v3, :cond_a

    :cond_9
    iput v3, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    iput v3, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {v9, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 389
    :cond_a
    iget v0, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-eq v0, v1, :cond_b

    iput v1, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {v8, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 390
    :cond_b
    int-to-float v0, v1

    int-to-float v2, v3

    div-float/2addr v0, v2

    sub-int v2, v1, v3

    int-to-float v2, v2

    const/high16 v3, 0x40000000    # 2.0f

    div-float/2addr v2, v3

    invoke-virtual {v9, v2}, Landroid/view/View;->setTranslationY(F)V

    .line 391
    iget v2, p0, Lcom/melodix/music/PreviewPlayerChrome;->artScale:F

    sub-float v2, v0, v2

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v2

    const v3, 0x3c23d70a    # 0.01f

    cmpl-float v2, v2, v3

    if-lez v2, :cond_c

    iput v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->artScale:F

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->artPlaying:Ljava/lang/Boolean;

    .line 392
    :cond_c
    new-instance v2, Ljava/lang/StringBuilder;

    if-eqz v4, :cond_1d

    const-string v0, "portrait"

    :goto_f
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v0, ", carr\u00e9 "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    int-to-float v1, v1

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerChrome;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->density:F

    div-float/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " dp, mesur\u00e9 "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v9}, Landroid/view/View;->getWidth()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\u00d7"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v9}, Landroid/view/View;->getHeight()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " px, \u00e9chelle "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "%.2f"

    new-array v2, v5, [Ljava/lang/Object;

    iget v3, p0, Lcom/melodix/music/PreviewPlayerChrome;->artScale:F

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    aput-object v3, v2, v6

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/melodix/music/PreviewPlayerChrome;->sizeInfo:Ljava/lang/String;

    goto/16 :goto_0

    :cond_d
    move v4, v6

    .line 347
    goto/16 :goto_1

    :cond_e
    move v1, v6

    .line 354
    goto/16 :goto_2

    .line 357
    :cond_f
    const/16 v1, 0x10

    goto/16 :goto_3

    .line 359
    :cond_10
    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v7

    invoke-virtual {v7}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    .line 360
    instance-of v10, v1, Landroid/widget/LinearLayout$LayoutParams;

    if-nez v10, :cond_11

    .line 358
    :goto_10
    add-int/lit8 v1, v3, 0x1

    move v3, v1

    goto/16 :goto_4

    .line 361
    :cond_11
    check-cast v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 362
    if-eqz v4, :cond_12

    const/4 v10, -0x1

    iput v10, v1, Landroid/widget/LinearLayout$LayoutParams;->width:I

    const/4 v10, 0x0

    iput v10, v1, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    .line 363
    :cond_12
    invoke-virtual {v7, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_10

    .line 365
    :cond_13
    if-nez v4, :cond_4

    const/16 v1, 0x10

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    goto/16 :goto_5

    .line 366
    :cond_14
    invoke-direct {p0, v12}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v1

    goto/16 :goto_6

    .line 371
    :cond_15
    const/high16 v3, 0x42400000    # 48.0f

    invoke-direct {p0, v3}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v3

    move v7, v3

    goto/16 :goto_7

    :cond_16
    const/high16 v3, 0x41400000    # 12.0f

    invoke-direct {p0, v3}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v3

    goto/16 :goto_8

    .line 375
    :cond_17
    const v1, 0x7f09023d

    invoke-virtual {p1, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    goto/16 :goto_9

    :cond_18
    move-object v1, v3

    .line 376
    check-cast v1, Landroid/view/ViewGroup;

    invoke-virtual {v1, v6}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    move-object v1, v3

    check-cast v1, Landroid/view/ViewGroup;

    invoke-virtual {v1, v6}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 375
    invoke-interface {v3}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    goto/16 :goto_a

    .line 380
    :cond_19
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    if-eq v3, v8, :cond_1a

    invoke-virtual {v3}, Landroid/view/View;->getVisibility()I

    move-result v7

    const/16 v10, 0x8

    if-eq v7, v10, :cond_1a

    invoke-static {v3}, Lcom/melodix/music/PreviewPlayerChrome;->contentHeight(Landroid/view/View;)I

    move-result v3

    add-int/2addr v2, v3

    :cond_1a
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_b

    .line 381
    :cond_1b
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getHeight()I

    move-result v0

    const/high16 v1, 0x42800000    # 64.0f

    invoke-direct {p0, v1}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v1

    sub-int/2addr v0, v1

    move v1, v0

    goto/16 :goto_d

    .line 383
    :cond_1c
    const/16 v0, 0x230

    goto/16 :goto_e

    .line 392
    :cond_1d
    const-string v0, "paysage"

    goto/16 :goto_f

    :cond_1e
    move v2, v6

    goto/16 :goto_c
.end method

.method private navigateBack()V
    .locals 7

    .prologue
    const/4 v6, 0x0

    .line 447
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerChrome;->activity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->closing:Z

    if-eqz v1, :cond_1

    .line 451
    :cond_0
    :goto_0
    return-void

    .line 448
    :cond_1
    :try_start_0
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "onNativeBackClick"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Class;

    const/4 v4, 0x0

    const-class v5, Landroid/view/View;

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v1, v0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 450
    :goto_1
    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->closing:Z

    if-nez v1, :cond_0

    const v1, 0x7f09023a

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0, v6}, Landroid/view/View;->setTranslationY(F)V

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    invoke-direct {p0, v6}, Lcom/melodix/music/PreviewPlayerChrome;->updateStatusForTranslation(F)V

    goto :goto_0

    :catch_0
    move-exception v1

    goto :goto_1
.end method

.method private playerVisible()Z
    .locals 1

    .prologue
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

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private refreshSystemBarColors()V
    .locals 2

    .prologue
    .line 157
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerChrome;->sampleEdge(Z)[I

    move-result-object v0

    const/4 v1, 0x1

    invoke-direct {p0, v1}, Lcom/melodix/music/PreviewPlayerChrome;->sampleEdge(Z)[I

    move-result-object v1

    .line 158
    if-eqz v0, :cond_0

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->topColors:[I

    :cond_0
    if-eqz v1, :cond_1

    iput-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->bottomColors:[I

    .line 159
    :cond_1
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->statusOverlay:Landroid/graphics/drawable/GradientDrawable;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->statusOverlay:Landroid/graphics/drawable/GradientDrawable;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->topColors:[I

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setColors([I)V

    .line 160
    :cond_2
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->navOverlay:Landroid/graphics/drawable/GradientDrawable;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->navOverlay:Landroid/graphics/drawable/GradientDrawable;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->bottomColors:[I

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setColors([I)V

    .line 161
    :cond_3
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->panel:Landroid/view/View;

    if-nez v0, :cond_4

    const/4 v0, 0x0

    :goto_0
    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerChrome;->updateStatusForTranslation(F)V

    .line 162
    return-void

    .line 161
    :cond_4
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->panel:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getTranslationY()F

    move-result v0

    goto :goto_0
.end method

.method public static report()Ljava/lang/String;
    .locals 2

    .prologue
    .line 256
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "\nAffichage lecteur : "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

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

    .prologue
    const/4 v6, 0x0

    .line 246
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->chromeApplied:Z

    if-nez v0, :cond_0

    iput-object v6, p0, Lcom/melodix/music/PreviewPlayerChrome;->previousScreen:Landroid/graphics/Bitmap;

    .line 253
    :goto_0
    return-void

    .line 247
    :cond_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->root:Landroid/view/View;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->root:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->backdrop:Landroid/graphics/drawable/Drawable;

    if-ne v0, v1, :cond_1

    .line 248
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->root:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getPaddingLeft()I

    move-result v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->root:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getPaddingTop()I

    move-result v1

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerChrome;->root:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getPaddingRight()I

    move-result v2

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerChrome;->root:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getPaddingBottom()I

    move-result v3

    .line 249
    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerChrome;->root:Landroid/view/View;

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerChrome;->rootBackground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v4, v5}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerChrome;->root:Landroid/view/View;

    invoke-virtual {v4, v0, v1, v2, v3}, Landroid/view/View;->setPadding(IIII)V

    .line 251
    :cond_1
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->panel:Landroid/view/View;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->panel:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->appliedBackground:Landroid/graphics/drawable/Drawable;

    if-ne v0, v1, :cond_2

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->panel:Landroid/view/View;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->panelBackground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 252
    :cond_2
    iput-object v6, p0, Lcom/melodix/music/PreviewPlayerChrome;->root:Landroid/view/View;

    iput-object v6, p0, Lcom/melodix/music/PreviewPlayerChrome;->panel:Landroid/view/View;

    iput-object v6, p0, Lcom/melodix/music/PreviewPlayerChrome;->rootBackground:Landroid/graphics/drawable/Drawable;

    iput-object v6, p0, Lcom/melodix/music/PreviewPlayerChrome;->panelBackground:Landroid/graphics/drawable/Drawable;

    iput-object v6, p0, Lcom/melodix/music/PreviewPlayerChrome;->appliedBackground:Landroid/graphics/drawable/Drawable;

    iput-object v6, p0, Lcom/melodix/music/PreviewPlayerChrome;->backdrop:Landroid/graphics/drawable/Drawable;

    iput-object v6, p0, Lcom/melodix/music/PreviewPlayerChrome;->previousScreen:Landroid/graphics/Bitmap;

    iput-object v6, p0, Lcom/melodix/music/PreviewPlayerChrome;->tintLayer:Landroid/graphics/drawable/GradientDrawable;

    iput-object v6, p0, Lcom/melodix/music/PreviewPlayerChrome;->scrim:Landroid/graphics/drawable/GradientDrawable;

    iput-object v6, p0, Lcom/melodix/music/PreviewPlayerChrome;->tintSource:Landroid/graphics/drawable/Drawable;

    iput-object v6, p0, Lcom/melodix/music/PreviewPlayerChrome;->artPlaying:Ljava/lang/Boolean;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->chromeApplied:Z

    goto :goto_0
.end method

.method private restoreHeader()V
    .locals 2

    .prologue
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
    .locals 6

    .prologue
    const/high16 v5, 0x8000000

    const/high16 v3, 0x4000000

    const/high16 v2, -0x80000000

    const/4 v4, 0x0

    .line 214
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->statusDecor:Landroid/view/View;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->statusOverlay:Landroid/graphics/drawable/GradientDrawable;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->statusDecor:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getOverlay()Landroid/view/ViewOverlay;

    move-result-object v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->statusOverlay:Landroid/graphics/drawable/GradientDrawable;

    invoke-virtual {v0, v1}, Landroid/view/ViewOverlay;->remove(Landroid/graphics/drawable/Drawable;)V

    .line 215
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

    .line 216
    :cond_1
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->statusWindow:Landroid/view/Window;

    if-eqz v0, :cond_5

    .line 217
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->statusWindow:Landroid/view/Window;

    invoke-virtual {v0}, Landroid/view/Window;->getStatusBarColor()I

    move-result v0

    iget v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->lastStatusColor:I

    if-ne v0, v1, :cond_2

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->statusWindow:Landroid/view/Window;

    iget v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->originalStatusColor:I

    invoke-virtual {v0, v1}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 218
    :cond_2
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->statusWindow:Landroid/view/Window;

    invoke-virtual {v0}, Landroid/view/Window;->getNavigationBarColor()I

    move-result v0

    iget v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->lastNavColor:I

    if-ne v0, v1, :cond_3

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->statusWindow:Landroid/view/Window;

    iget v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->originalNavColor:I

    invoke-virtual {v0, v1}, Landroid/view/Window;->setNavigationBarColor(I)V

    .line 219
    :cond_3
    iget v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->originalStatusFlags:I

    and-int/2addr v0, v3

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->statusWindow:Landroid/view/Window;

    invoke-virtual {v0, v3}, Landroid/view/Window;->addFlags(I)V

    .line 220
    :goto_0
    iget v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->originalStatusFlags:I

    and-int/2addr v0, v5

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->statusWindow:Landroid/view/Window;

    invoke-virtual {v0, v5}, Landroid/view/Window;->addFlags(I)V

    .line 221
    :goto_1
    iget v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->originalStatusFlags:I

    and-int/2addr v0, v2

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->statusWindow:Landroid/view/Window;

    invoke-virtual {v0, v2}, Landroid/view/Window;->addFlags(I)V

    .line 222
    :goto_2
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1d

    if-lt v0, v1, :cond_4

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->statusWindow:Landroid/view/Window;

    invoke-virtual {v0}, Landroid/view/Window;->isNavigationBarContrastEnforced()Z

    move-result v0

    if-nez v0, :cond_4

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->statusWindow:Landroid/view/Window;

    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->originalNavContrast:Z

    invoke-virtual {v0, v1}, Landroid/view/Window;->setNavigationBarContrastEnforced(Z)V

    .line 223
    :cond_4
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->statusDecor:Landroid/view/View;

    if-eqz v0, :cond_5

    const/16 v0, 0x2010

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->statusDecor:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getSystemUiVisibility()I

    move-result v1

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerChrome;->statusDecor:Landroid/view/View;

    and-int/lit16 v1, v1, -0x2011

    iget v3, p0, Lcom/melodix/music/PreviewPlayerChrome;->originalStatusUi:I

    and-int/2addr v0, v3

    or-int/2addr v0, v1

    invoke-virtual {v2, v0}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 225
    :cond_5
    iput-object v4, p0, Lcom/melodix/music/PreviewPlayerChrome;->statusWindow:Landroid/view/Window;

    iput-object v4, p0, Lcom/melodix/music/PreviewPlayerChrome;->statusDecor:Landroid/view/View;

    iput-object v4, p0, Lcom/melodix/music/PreviewPlayerChrome;->statusOverlay:Landroid/graphics/drawable/GradientDrawable;

    iput-object v4, p0, Lcom/melodix/music/PreviewPlayerChrome;->navOverlay:Landroid/graphics/drawable/GradientDrawable;

    .line 226
    return-void

    .line 219
    :cond_6
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->statusWindow:Landroid/view/Window;

    invoke-virtual {v0, v3}, Landroid/view/Window;->clearFlags(I)V

    goto :goto_0

    .line 220
    :cond_7
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->statusWindow:Landroid/view/Window;

    invoke-virtual {v0, v5}, Landroid/view/Window;->clearFlags(I)V

    goto :goto_1

    .line 221
    :cond_8
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->statusWindow:Landroid/view/Window;

    invoke-virtual {v0, v2}, Landroid/view/Window;->clearFlags(I)V

    goto :goto_2
.end method

.method private sampleEdge(Z)[I
    .locals 9

    .prologue
    const/4 v1, 0x0

    .line 145
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->appliedBackground:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->panel:Landroid/view/View;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->panel:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->panel:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v0

    if-gtz v0, :cond_1

    :cond_0
    move-object v0, v1

    .line 154
    :goto_0
    return-object v0

    .line 146
    :cond_1
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

    .line 148
    const/16 v4, 0x19

    const/4 v5, 0x1

    :try_start_0
    sget-object v6, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v4, v5, v6}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v4

    .line 149
    new-instance v5, Landroid/graphics/Canvas;

    invoke-direct {v5, v4}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    const/high16 v6, 0x41c80000    # 25.0f

    int-to-float v7, v0

    div-float/2addr v6, v7

    const/high16 v7, 0x3f800000    # 1.0f

    invoke-virtual {v5, v6, v7}, Landroid/graphics/Canvas;->scale(FF)V

    if-eqz p1, :cond_2

    const/4 v6, 0x0

    rsub-int/lit8 v7, v2, 0x1

    int-to-float v7, v7

    invoke-virtual {v5, v6, v7}, Landroid/graphics/Canvas;->translate(FF)V

    .line 150
    :cond_2
    iget-object v6, p0, Lcom/melodix/music/PreviewPlayerChrome;->appliedBackground:Landroid/graphics/drawable/Drawable;

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-virtual {v6, v7, v8, v0, v2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->appliedBackground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v5}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 151
    const/4 v0, 0x5

    new-array v0, v0, [I

    const/4 v2, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6}, Landroid/graphics/Bitmap;->getPixel(II)I

    move-result v5

    aput v5, v0, v2

    const/4 v2, 0x1

    const/4 v5, 0x6

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6}, Landroid/graphics/Bitmap;->getPixel(II)I

    move-result v5

    aput v5, v0, v2

    const/4 v2, 0x2

    const/16 v5, 0xc

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6}, Landroid/graphics/Bitmap;->getPixel(II)I

    move-result v5

    aput v5, v0, v2

    const/4 v2, 0x3

    const/16 v5, 0x12

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6}, Landroid/graphics/Bitmap;->getPixel(II)I

    move-result v5

    aput v5, v0, v2

    const/4 v2, 0x4

    const/16 v5, 0x18

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6}, Landroid/graphics/Bitmap;->getPixel(II)I

    move-result v5

    aput v5, v0, v2

    .line 152
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->recycle()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 154
    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->appliedBackground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, v3}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    goto :goto_0

    :catch_0
    move-exception v0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->appliedBackground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v3}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    move-object v0, v1

    .line 153
    goto/16 :goto_0

    :catch_1
    move-exception v0

    .line 154
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->appliedBackground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v3}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    move-object v0, v1

    .line 153
    goto/16 :goto_0

    .line 154
    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->appliedBackground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, v3}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    throw v0
.end method

.method private setupCosmetics(Landroid/app/Activity;)V
    .locals 11

    .prologue
    .line 483
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->setupDone:Z

    if-eqz v0, :cond_1

    .line 527
    :cond_0
    :goto_0
    return-void

    .line 484
    :cond_1
    const v0, 0x7f09023a

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    instance-of v0, v1, Landroid/view/ViewGroup;

    if-eqz v0, :cond_0

    .line 485
    invoke-direct {p0, v1}, Lcom/melodix/music/PreviewPlayerChrome;->findCollapse(Landroid/view/View;)Landroid/view/View;

    move-result-object v5

    .line 486
    const-string v0, "repeat"

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->repeatControl:Landroid/view/View;

    const-string v0, "shuffle"

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->shuffleControl:Landroid/view/View;

    .line 487
    const-string v0, "like"

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v3

    const-string v0, "previewPlayerTiles"

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v4

    .line 488
    const v0, 0x7f09023f

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v6

    const v0, 0x7f090240

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v7

    const v0, 0x7f09023e

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v8

    .line 489
    if-eqz v5, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->repeatControl:Landroid/view/View;

    instance-of v0, v0, Landroid/widget/ImageView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->shuffleControl:Landroid/view/View;

    if-eqz v0, :cond_0

    if-eqz v3, :cond_0

    if-eqz v4, :cond_0

    if-eqz v8, :cond_0

    if-eqz v6, :cond_0

    if-eqz v7, :cond_0

    move-object v0, v1

    .line 490
    check-cast v0, Landroid/view/ViewGroup;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    move-object v0, v1

    check-cast v0, Landroid/view/ViewGroup;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 491
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerChrome;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    .line 492
    instance-of v0, v2, Landroid/view/ViewGroup;

    if-eqz v0, :cond_2

    move-object v0, v2

    check-cast v0, Landroid/view/ViewGroup;

    const/4 v9, 0x0

    invoke-virtual {v0, v9}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    check-cast v2, Landroid/view/ViewGroup;

    const/4 v0, 0x0

    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 493
    :cond_2
    const-string v0, "previewPlayerArtCard"

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v9

    const-string v0, "previewPlayerArtFrame"

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v2

    .line 494
    const-string v0, "previewPlayerDragHandle"

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v0

    .line 495
    if-eqz v0, :cond_3

    new-instance v1, Lcom/melodix/music/PreviewPlayerChrome$DismissGesture;

    const/4 v10, 0x0

    invoke-direct {v1, p0, v10}, Lcom/melodix/music/PreviewPlayerChrome$DismissGesture;-><init>(Lcom/melodix/music/PreviewPlayerChrome;Lcom/melodix/music/PreviewPlayerChrome$DismissGesture;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 496
    :cond_3
    if-eqz v9, :cond_4

    new-instance v0, Lcom/melodix/music/PreviewPlayerChrome$DismissGesture;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/melodix/music/PreviewPlayerChrome$DismissGesture;-><init>(Lcom/melodix/music/PreviewPlayerChrome;Lcom/melodix/music/PreviewPlayerChrome$DismissGesture;)V

    invoke-virtual {v9, v0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 497
    :cond_4
    instance-of v0, v2, Landroid/view/ViewGroup;

    if-eqz v0, :cond_5

    move-object v0, v2

    check-cast v0, Landroid/view/ViewGroup;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    check-cast v2, Landroid/view/ViewGroup;

    const/4 v0, 0x0

    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 498
    :cond_5
    if-eqz v9, :cond_6

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1c

    if-lt v0, v1, :cond_6

    const v0, -0x1fb762

    invoke-virtual {v9, v0}, Landroid/view/View;->setOutlineSpotShadowColor(I)V

    const v0, -0x1fb762

    invoke-virtual {v9, v0}, Landroid/view/View;->setOutlineAmbientShadowColor(I)V

    .line 499
    :cond_6
    instance-of v0, v3, Landroid/widget/ImageView;

    if-eqz v0, :cond_7

    .line 500
    iput-object v3, p0, Lcom/melodix/music/PreviewPlayerChrome;->likeControl:Landroid/view/View;

    .line 501
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    const v1, 0x17ffffff

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-direct {p0, v1}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v1

    const v2, 0x24ffffff

    invoke-virtual {v0, v1, v2}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 502
    const/4 v1, 0x0

    invoke-virtual {v3, v1}, Landroid/view/View;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    new-instance v1, Landroid/graphics/drawable/RippleDrawable;

    const v2, 0x44ffffff    # 2047.9999f

    invoke-static {v2}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v2

    const/4 v9, 0x0

    invoke-direct {v1, v2, v0, v9}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v3, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    move-object v0, v3

    .line 503
    check-cast v0, Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageAlpha(I)V

    new-instance v0, Lcom/melodix/music/PreviewPlayerLikeArt;

    invoke-direct {v0, v3}, Lcom/melodix/music/PreviewPlayerLikeArt;-><init>(Landroid/view/View;)V

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->likeArt:Lcom/melodix/music/PreviewPlayerLikeArt;

    invoke-virtual {v3}, Landroid/view/View;->getOverlay()Landroid/view/ViewOverlay;

    move-result-object v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->likeArt:Lcom/melodix/music/PreviewPlayerLikeArt;

    invoke-virtual {v0, v1}, Landroid/view/ViewOverlay;->add(Landroid/graphics/drawable/Drawable;)V

    .line 505
    :cond_7
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->repeatControl:Landroid/view/View;

    check-cast v0, Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageAlpha(I)V

    .line 506
    new-instance v0, Lcom/melodix/music/PreviewPlayerDecoration;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->repeatControl:Landroid/view/View;

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/melodix/music/PreviewPlayerDecoration;-><init>(Landroid/view/View;Z)V

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->repeatArt:Lcom/melodix/music/PreviewPlayerDecoration;

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->repeatControl:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getOverlay()Landroid/view/ViewOverlay;

    move-result-object v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->repeatArt:Lcom/melodix/music/PreviewPlayerDecoration;

    invoke-virtual {v0, v1}, Landroid/view/ViewOverlay;->add(Landroid/graphics/drawable/Drawable;)V

    .line 507
    new-instance v0, Lcom/melodix/music/PreviewPlayerDecoration;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->shuffleControl:Landroid/view/View;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/melodix/music/PreviewPlayerDecoration;-><init>(Landroid/view/View;Z)V

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->shuffleDot:Lcom/melodix/music/PreviewPlayerDecoration;

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->shuffleControl:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getOverlay()Landroid/view/ViewOverlay;

    move-result-object v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->shuffleDot:Lcom/melodix/music/PreviewPlayerDecoration;

    invoke-virtual {v0, v1}, Landroid/view/ViewOverlay;->add(Landroid/graphics/drawable/Drawable;)V

    .line 508
    const/4 v0, 0x4

    new-array v1, v0, [Landroid/view/View;

    const/4 v0, 0x0

    aput-object v5, v1, v0

    const/4 v0, 0x1

    aput-object v6, v1, v0

    const/4 v0, 0x2

    aput-object v7, v1, v0

    const/4 v0, 0x3

    aput-object v8, v1, v0

    array-length v2, v1

    const/4 v0, 0x0

    :goto_1
    if-lt v0, v2, :cond_a

    .line 509
    const/4 v0, 0x3

    new-array v1, v0, [Landroid/view/View;

    const/4 v0, 0x0

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerChrome;->repeatControl:Landroid/view/View;

    aput-object v2, v1, v0

    const/4 v0, 0x1

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerChrome;->shuffleControl:Landroid/view/View;

    aput-object v2, v1, v0

    const/4 v0, 0x2

    aput-object v3, v1, v0

    array-length v2, v1

    const/4 v0, 0x0

    :goto_2
    if-lt v0, v2, :cond_b

    .line 510
    instance-of v0, v4, Landroid/view/ViewGroup;

    if-eqz v0, :cond_8

    move-object v0, v4

    check-cast v0, Landroid/view/ViewGroup;

    const/4 v1, 0x0

    :goto_3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    if-lt v1, v2, :cond_c

    .line 511
    :cond_8
    const v0, 0x7f09023d

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 512
    instance-of v1, v0, Landroid/widget/SeekBar;

    if-eqz v1, :cond_9

    move-object v6, v0

    .line 513
    check-cast v6, Landroid/widget/SeekBar;

    .line 514
    new-instance v1, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v1}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const/4 v0, 0x1

    invoke-virtual {v1, v0}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    const v0, 0x447b3fe4

    invoke-virtual {v1, v0}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    const/high16 v0, 0x41c00000    # 24.0f

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v0

    const/high16 v2, 0x41c00000    # 24.0f

    invoke-direct {p0, v2}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v2

    invoke-virtual {v1, v0, v2}, Landroid/graphics/drawable/GradientDrawable;->setSize(II)V

    .line 515
    new-instance v2, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v2}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const/4 v0, 0x1

    invoke-virtual {v2, v0}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    const/4 v0, -0x1

    invoke-virtual {v2, v0}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    const/high16 v0, 0x41800000    # 16.0f

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v0

    const/high16 v3, 0x41800000    # 16.0f

    invoke-direct {p0, v3}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v3

    invoke-virtual {v2, v0, v3}, Landroid/graphics/drawable/GradientDrawable;->setSize(II)V

    .line 516
    new-instance v0, Landroid/graphics/drawable/LayerDrawable;

    const/4 v3, 0x2

    new-array v3, v3, [Landroid/graphics/drawable/Drawable;

    const/4 v4, 0x0

    aput-object v1, v3, v4

    const/4 v1, 0x1

    aput-object v2, v3, v1

    invoke-direct {v0, v3}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    const/4 v1, 0x1

    const/high16 v2, 0x40800000    # 4.0f

    invoke-direct {p0, v2}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v2

    const/high16 v3, 0x40800000    # 4.0f

    invoke-direct {p0, v3}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v3

    const/high16 v4, 0x40800000    # 4.0f

    invoke-direct {p0, v4}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v4

    const/high16 v5, 0x40800000    # 4.0f

    invoke-direct {p0, v5}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v5

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/drawable/LayerDrawable;->setLayerInset(IIIII)V

    .line 517
    const/4 v1, 0x0

    invoke-virtual {v6, v1}, Landroid/widget/SeekBar;->setThumbTintList(Landroid/content/res/ColorStateList;)V

    invoke-virtual {v6, v0}, Landroid/widget/SeekBar;->setThumb(Landroid/graphics/drawable/Drawable;)V

    const/high16 v0, 0x41400000    # 12.0f

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v0

    invoke-virtual {v6, v0}, Landroid/widget/SeekBar;->setThumbOffset(I)V

    .line 518
    const/high16 v0, 0x41400000    # 12.0f

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v0

    invoke-virtual {v6}, Landroid/widget/SeekBar;->getPaddingTop()I

    move-result v1

    const/high16 v2, 0x41400000    # 12.0f

    invoke-direct {p0, v2}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v2

    invoke-virtual {v6}, Landroid/widget/SeekBar;->getPaddingBottom()I

    move-result v3

    invoke-virtual {v6, v0, v1, v2, v3}, Landroid/widget/SeekBar;->setPadding(IIII)V

    .line 519
    invoke-virtual {v6}, Landroid/widget/SeekBar;->getProgressDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 520
    instance-of v1, v0, Landroid/graphics/drawable/LayerDrawable;

    if-eqz v1, :cond_9

    .line 521
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/LayerDrawable;

    .line 522
    const/high16 v1, 0x1020000

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 523
    instance-of v1, v0, Landroid/graphics/drawable/GradientDrawable;

    if-eqz v1, :cond_9

    check-cast v0, Landroid/graphics/drawable/GradientDrawable;

    const v1, 0x55ffffff    # 3.518437E13f

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 526
    :cond_9
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->setupDone:Z

    goto/16 :goto_0

    .line 508
    :cond_a
    aget-object v5, v1, v0

    new-instance v6, Lcom/melodix/music/PreviewPlayerChrome$PressEffect;

    const/4 v7, 0x1

    invoke-direct {v6, v7}, Lcom/melodix/music/PreviewPlayerChrome$PressEffect;-><init>(Z)V

    invoke-virtual {v5, v6}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_1

    .line 509
    :cond_b
    aget-object v3, v1, v0

    new-instance v5, Lcom/melodix/music/PreviewPlayerChrome$PressEffect;

    const/4 v6, 0x0

    invoke-direct {v5, v6}, Lcom/melodix/music/PreviewPlayerChrome$PressEffect;-><init>(Z)V

    invoke-virtual {v3, v5}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_2

    .line 510
    :cond_c
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    new-instance v3, Lcom/melodix/music/PreviewPlayerChrome$PressEffect;

    const/4 v4, 0x0

    invoke-direct {v3, v4}, Lcom/melodix/music/PreviewPlayerChrome$PressEffect;-><init>(Z)V

    invoke-virtual {v2, v3}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_3
.end method

.method static shrink(Landroid/graphics/drawable/Drawable;I)Landroid/graphics/Bitmap;
    .locals 5

    .prologue
    const/4 v0, 0x0

    .line 276
    if-nez p0, :cond_0

    .line 281
    :goto_0
    return-object v0

    .line 278
    :cond_0
    :try_start_0
    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {p1, p1, v1}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 279
    new-instance v2, Landroid/graphics/Rect;

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-virtual {p0, v3, v4, p1, p1}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    new-instance v3, Landroid/graphics/Canvas;

    invoke-direct {v3, v1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    invoke-virtual {p0, v3}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    invoke-virtual {p0, v2}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v1

    .line 280
    goto :goto_0

    .line 281
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method private sizeArtwork(Landroid/app/Activity;)V
    .locals 10

    .prologue
    const/4 v1, 0x0

    const v9, 0x3fa66666    # 1.3f

    .line 538
    const v0, 0x7f09023a

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerChrome;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    .line 539
    if-eqz v4, :cond_0

    instance-of v2, v0, Landroid/view/ViewGroup;

    if-nez v2, :cond_1

    .line 560
    :cond_0
    :goto_0
    return-void

    .line 540
    :cond_1
    check-cast v0, Landroid/view/ViewGroup;

    .line 541
    const-string v2, "previewPlayerArtFrame"

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v5

    const-string v2, "previewPlayerArtCard"

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v6

    .line 542
    if-eqz v5, :cond_0

    if-eqz v6, :cond_0

    invoke-virtual {v5}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    if-ne v2, v0, :cond_0

    invoke-virtual {v4}, Landroid/view/View;->getHeight()I

    move-result v2

    if-lez v2, :cond_0

    invoke-virtual {v5}, Landroid/view/View;->getWidth()I

    move-result v2

    if-lez v2, :cond_0

    move v2, v1

    move v3, v1

    .line 544
    :goto_1
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-lt v2, v1, :cond_6

    .line 550
    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    .line 551
    instance-of v0, v1, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v0, :cond_2

    move-object v0, v1

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    iget v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    iget v0, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    add-int/2addr v0, v2

    add-int/2addr v3, v0

    .line 552
    :cond_2
    invoke-virtual {v4}, Landroid/view/View;->getHeight()I

    move-result v0

    invoke-virtual {v4}, Landroid/view/View;->getPaddingTop()I

    move-result v2

    sub-int/2addr v0, v2

    invoke-virtual {v4}, Landroid/view/View;->getPaddingBottom()I

    move-result v2

    sub-int/2addr v0, v2

    sub-int v2, v0, v3

    .line 553
    const/high16 v0, 0x439f0000    # 318.0f

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v0

    invoke-virtual {v5}, Landroid/view/View;->getWidth()I

    move-result v3

    invoke-static {v0, v3}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 554
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerChrome;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v3

    iget v3, v3, Landroid/content/res/Configuration;->fontScale:F

    cmpg-float v3, v3, v9

    if-gtz v3, :cond_3

    if-lt v2, v0, :cond_3

    const/high16 v0, 0x43ab0000    # 342.0f

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v0

    invoke-virtual {v5}, Landroid/view/View;->getWidth()I

    move-result v3

    invoke-static {v0, v3}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 555
    :cond_3
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerChrome;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v3

    iget v3, v3, Landroid/content/res/Configuration;->fontScale:F

    cmpl-float v3, v3, v9

    if-lez v3, :cond_9

    .line 556
    :goto_2
    if-lez v0, :cond_0

    .line 557
    invoke-virtual {v6}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    .line 558
    iget v3, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-eq v3, v0, :cond_4

    iput v0, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {v5, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 559
    :cond_4
    iget v1, v2, Landroid/view/ViewGroup$LayoutParams;->width:I

    if-ne v1, v0, :cond_5

    iget v1, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-eq v1, v0, :cond_0

    :cond_5
    iput v0, v2, Landroid/view/ViewGroup$LayoutParams;->width:I

    iput v0, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {v6, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto/16 :goto_0

    .line 545
    :cond_6
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v7

    .line 546
    if-eq v7, p0, :cond_7

    if-eq v7, v5, :cond_7

    invoke-virtual {v7}, Landroid/view/View;->getVisibility()I

    move-result v1

    const/16 v8, 0x8

    if-eq v1, v8, :cond_7

    const-string v1, "previewPlayerSpacer"

    invoke-virtual {v7}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v1, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 544
    :cond_7
    :goto_3
    add-int/lit8 v1, v2, 0x1

    move v2, v1

    goto/16 :goto_1

    .line 547
    :cond_8
    invoke-virtual {v7}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    invoke-virtual {v7}, Landroid/view/View;->getMeasuredHeight()I

    move-result v7

    add-int/2addr v3, v7

    .line 548
    instance-of v7, v1, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v7, :cond_7

    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;

    iget v7, v1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    iget v1, v1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    add-int/2addr v1, v7

    add-int/2addr v3, v1

    goto :goto_3

    .line 555
    :cond_9
    const/high16 v3, 0x42a00000    # 80.0f

    invoke-direct {p0, v3}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v3

    invoke-static {v3, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    move-result v0

    goto :goto_2
.end method

.method private sizeSkips(Landroid/app/Activity;)V
    .locals 7

    .prologue
    .line 324
    const/4 v0, 0x2

    new-array v3, v0, [I

    fill-array-data v3, :array_0

    array-length v4, v3

    const/4 v0, 0x0

    move v2, v0

    :goto_0
    if-lt v2, v4, :cond_0

    .line 329
    return-void

    .line 324
    :cond_0
    aget v0, v3, v2

    .line 325
    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    instance-of v0, v1, Landroid/widget/ImageView;

    if-eqz v0, :cond_1

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v0

    if-gtz v0, :cond_2

    .line 324
    :cond_1
    :goto_1
    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto :goto_0

    .line 326
    :cond_2
    const/high16 v0, 0x40800000    # 4.0f

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v0

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v5

    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v6

    invoke-static {v5, v6}, Ljava/lang/Math;->min(II)I

    move-result v5

    const/high16 v6, 0x41e00000    # 28.0f

    invoke-direct {p0, v6}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v6

    sub-int/2addr v5, v6

    div-int/lit8 v5, v5, 0x2

    invoke-static {v0, v5}, Ljava/lang/Math;->max(II)I

    move-result v5

    .line 327
    invoke-virtual {v1}, Landroid/view/View;->getPaddingLeft()I

    move-result v0

    if-ne v0, v5, :cond_3

    invoke-virtual {v1}, Landroid/view/View;->getPaddingTop()I

    move-result v0

    if-eq v0, v5, :cond_1

    :cond_3
    move-object v0, v1

    check-cast v0, Landroid/widget/ImageView;

    sget-object v6, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v0, v6}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    invoke-virtual {v1, v5, v5, v5, v5}, Landroid/view/View;->setPadding(IIII)V

    goto :goto_1

    .line 324
    nop

    :array_0
    .array-data 4
        0x7f09023f
        0x7f090240
    .end array-data
.end method

.method private stylePlay(Landroid/app/Activity;)V
    .locals 6

    .prologue
    const/4 v5, 0x1

    .line 529
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->playStyled:Z

    if-eqz v0, :cond_1

    .line 536
    :cond_0
    :goto_0
    return-void

    .line 530
    :cond_1
    const v0, 0x7f09023e

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 531
    new-instance v1, Landroid/graphics/drawable/GradientDrawable;

    sget-object v2, Landroid/graphics/drawable/GradientDrawable$Orientation;->BR_TL:Landroid/graphics/drawable/GradientDrawable$Orientation;

    const/4 v3, 0x2

    new-array v3, v3, [I

    fill-array-data v3, :array_0

    invoke-direct {v1, v2, v3}, Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable$Orientation;[I)V

    .line 532
    invoke-virtual {v1, v5}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    .line 533
    new-instance v2, Landroid/graphics/drawable/RippleDrawable;

    const v3, 0x44ffffff    # 2047.9999f

    invoke-static {v3}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v3

    const/4 v4, 0x0

    invoke-direct {v2, v3, v1, v4}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v0, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 534
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1c

    if-lt v1, v2, :cond_2

    const v1, -0x1fb762

    invoke-virtual {v0, v1}, Landroid/view/View;->setOutlineSpotShadowColor(I)V

    const v1, -0x84c01c

    invoke-virtual {v0, v1}, Landroid/view/View;->setOutlineAmbientShadowColor(I)V

    .line 535
    :cond_2
    iput-boolean v5, p0, Lcom/melodix/music/PreviewPlayerChrome;->playStyled:Z

    goto :goto_0

    .line 531
    :array_0
    .array-data 4
        -0x84c01c
        -0x1fb762
    .end array-data
.end method

.method private sync()V
    .locals 9

    .prologue
    const v8, 0x7f09023a

    const/4 v2, 0x1

    const/high16 v7, 0x3f800000    # 1.0f

    const/4 v6, 0x0

    const/4 v1, 0x0

    .line 562
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerChrome;->playerVisible()Z

    move-result v0

    if-nez v0, :cond_5

    const-string v0, "non affich\u00e9"

    sput-object v0, Lcom/melodix/music/PreviewPlayerChrome;->state:Ljava/lang/String;

    .line 563
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->closing:Z

    if-eqz v0, :cond_0

    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->closing:Z

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerChrome;->activity()Landroid/app/Activity;

    move-result-object v0

    if-nez v0, :cond_4

    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/ViewPropertyAnimator;->cancel()V

    invoke-virtual {v0, v6}, Landroid/view/View;->setTranslationY(F)V

    invoke-virtual {v0, v7}, Landroid/view/View;->setAlpha(F)V

    .line 564
    :cond_0
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->wasVisible:Z

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerChrome;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v0, v0, Landroid/view/View;

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerChrome;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/ViewPropertyAnimator;->cancel()V

    invoke-virtual {v0, v7}, Landroid/view/View;->setAlpha(F)V

    invoke-virtual {v0, v6}, Landroid/view/View;->setTranslationY(F)V

    .line 565
    :cond_1
    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->wasVisible:Z

    .line 566
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->ticking:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->visualTick:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerChrome;->removeCallbacks(Ljava/lang/Runnable;)Z

    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->ticking:Z

    :cond_2
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerChrome;->restoreHeader()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerChrome;->restoreBackground()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerChrome;->restoreStatusBar()V

    .line 581
    :cond_3
    :goto_1
    return-void

    .line 563
    :cond_4
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerChrome;->activity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0, v8}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    goto :goto_0

    .line 568
    :cond_5
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerChrome;->activity()Landroid/app/Activity;

    move-result-object v3

    if-eqz v3, :cond_3

    .line 569
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->wasVisible:Z

    if-eqz v0, :cond_9

    move v0, v1

    :goto_2
    iput-boolean v2, p0, Lcom/melodix/music/PreviewPlayerChrome;->wasVisible:Z

    .line 570
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v1, "affich\u00e9, "

    invoke-direct {v4, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerChrome;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v1

    iget v1, v1, Landroid/content/res/Configuration;->orientation:I

    const/4 v5, 0x2

    if-ne v1, v5, :cond_a

    const-string v1, "paysage"

    :goto_3
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/melodix/music/PreviewPlayerChrome;->state:Ljava/lang/String;

    .line 571
    invoke-direct {p0, v3}, Lcom/melodix/music/PreviewPlayerChrome;->hideHeader(Landroid/app/Activity;)V

    invoke-direct {p0, v3}, Lcom/melodix/music/PreviewPlayerChrome;->applyBackground(Landroid/app/Activity;)V

    invoke-direct {p0, v3}, Lcom/melodix/music/PreviewPlayerChrome;->applyStatusBar(Landroid/app/Activity;)V

    invoke-direct {p0, v3}, Lcom/melodix/music/PreviewPlayerChrome;->stylePlay(Landroid/app/Activity;)V

    invoke-direct {p0, v3}, Lcom/melodix/music/PreviewPlayerChrome;->sizeArtwork(Landroid/app/Activity;)V

    invoke-direct {p0, v3}, Lcom/melodix/music/PreviewPlayerChrome;->landscape(Landroid/app/Activity;)V

    invoke-direct {p0, v3}, Lcom/melodix/music/PreviewPlayerChrome;->sizeSkips(Landroid/app/Activity;)V

    invoke-direct {p0, v3}, Lcom/melodix/music/PreviewPlayerChrome;->setupCosmetics(Landroid/app/Activity;)V

    invoke-direct {p0, v3}, Lcom/melodix/music/PreviewPlayerChrome;->updateTint(Landroid/app/Activity;)V

    .line 572
    if-eqz v0, :cond_7

    .line 573
    invoke-virtual {v3, v8}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 574
    if-eqz v0, :cond_7

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x1a

    if-lt v1, v3, :cond_6

    invoke-static {}, Landroid/animation/ValueAnimator;->areAnimatorsEnabled()Z

    move-result v1

    if-eqz v1, :cond_7

    .line 575
    :cond_6
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/ViewPropertyAnimator;->cancel()V

    invoke-virtual {v0, v7}, Landroid/view/View;->setAlpha(F)V

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

    .line 576
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1, v6}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    const-wide/16 v4, 0x154

    invoke-virtual {v1, v4, v5}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerChrome;->followStatus(Landroid/view/View;)Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/view/ViewPropertyAnimator;->setUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    new-instance v3, Landroid/view/animation/DecelerateInterpolator;

    const v4, 0x3fcccccd    # 1.6f

    invoke-direct {v3, v4}, Landroid/view/animation/DecelerateInterpolator;-><init>(F)V

    invoke-virtual {v1, v3}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    new-instance v3, Lcom/melodix/music/PreviewPlayerChrome$5;

    invoke-direct {v3, p0, v0}, Lcom/melodix/music/PreviewPlayerChrome$5;-><init>(Lcom/melodix/music/PreviewPlayerChrome;Landroid/view/View;)V

    invoke-virtual {v1, v3}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 579
    :cond_7
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->setupDone:Z

    if-eqz v0, :cond_8

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->ticking:Z

    if-nez v0, :cond_8

    iput-boolean v2, p0, Lcom/melodix/music/PreviewPlayerChrome;->ticking:Z

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->visualTick:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerChrome;->post(Ljava/lang/Runnable;)Z

    .line 580
    :cond_8
    invoke-static {}, Lcom/melodix/music/PreviewPlayerChrome;->report()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/melodix/music/PreviewPlayerTiles;->displayReport:Ljava/lang/String;

    goto/16 :goto_1

    :cond_9
    move v0, v2

    .line 569
    goto/16 :goto_2

    .line 570
    :cond_a
    const-string v1, "portrait"

    goto/16 :goto_3
.end method

.method private updateStatusForTranslation(F)V
    .locals 8

    .prologue
    const/high16 v7, 0x43960000    # 300.0f

    const/high16 v6, 0x437f0000    # 255.0f

    const/high16 v3, 0x42900000    # 72.0f

    const/high16 v5, 0x3f800000    # 1.0f

    const/4 v4, 0x0

    .line 200
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->statusWindow:Landroid/view/Window;

    if-nez v0, :cond_0

    .line 209
    :goto_0
    return-void

    .line 201
    :cond_0
    invoke-static {v4, p1}, Ljava/lang/Math;->max(FF)F

    move-result v0

    const/4 v1, 0x1

    invoke-direct {p0, v3}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v0, v1

    invoke-static {v5, v0}, Ljava/lang/Math;->min(FF)F

    move-result v0

    sub-float v1, v5, v0

    .line 202
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->panel:Landroid/view/View;

    if-nez v0, :cond_3

    invoke-direct {p0, v7}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v0

    :goto_1
    int-to-float v0, v0

    .line 203
    invoke-static {v4, p1}, Ljava/lang/Math;->max(FF)F

    move-result v2

    sub-float/2addr v0, v2

    const/4 v2, 0x1

    invoke-direct {p0, v3}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v2

    int-to-float v2, v2

    div-float/2addr v0, v2

    invoke-static {v4, v0}, Ljava/lang/Math;->max(FF)F

    move-result v0

    invoke-static {v5, v0}, Ljava/lang/Math;->min(FF)F

    move-result v0

    .line 204
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerChrome;->statusOverlay:Landroid/graphics/drawable/GradientDrawable;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerChrome;->statusOverlay:Landroid/graphics/drawable/GradientDrawable;

    mul-float v3, v1, v6

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/GradientDrawable;->setAlpha(I)V

    .line 205
    :cond_1
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerChrome;->navOverlay:Landroid/graphics/drawable/GradientDrawable;

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerChrome;->navOverlay:Landroid/graphics/drawable/GradientDrawable;

    mul-float v3, v0, v6

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/GradientDrawable;->setAlpha(I)V

    .line 206
    :cond_2
    iget v2, p0, Lcom/melodix/music/PreviewPlayerChrome;->originalStatusColor:I

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerChrome;->topColors:[I

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerChrome;->topColors:[I

    array-length v4, v4

    div-int/lit8 v4, v4, 0x2

    aget v3, v3, v4

    invoke-static {v2, v3, v1}, Lcom/melodix/music/PreviewPlayerChrome;->blend(IIF)I

    move-result v1

    iput v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->lastStatusColor:I

    .line 207
    iget v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->originalNavColor:I

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerChrome;->bottomColors:[I

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerChrome;->bottomColors:[I

    array-length v3, v3

    div-int/lit8 v3, v3, 0x2

    aget v2, v2, v3

    invoke-static {v1, v2, v0}, Lcom/melodix/music/PreviewPlayerChrome;->blend(IIF)I

    move-result v0

    iput v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->lastNavColor:I

    .line 208
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->statusWindow:Landroid/view/Window;

    iget v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->lastStatusColor:I

    invoke-virtual {v0, v1}, Landroid/view/Window;->setStatusBarColor(I)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->statusWindow:Landroid/view/Window;

    iget v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->lastNavColor:I

    invoke-virtual {v0, v1}, Landroid/view/Window;->setNavigationBarColor(I)V

    goto/16 :goto_0

    .line 202
    :cond_3
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->panel:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v0

    invoke-direct {p0, v7}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v2

    invoke-static {v0, v2}, Ljava/lang/Math;->max(II)I

    move-result v0

    goto :goto_1
.end method

.method private updateTint(Landroid/app/Activity;)V
    .locals 9

    .prologue
    const v8, 0xffffff

    const/4 v7, 0x0

    const/4 v6, 0x1

    .line 284
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->tintLayer:Landroid/graphics/drawable/GradientDrawable;

    if-nez v0, :cond_1

    const-string v0, "fond non appliqu\u00e9"

    sput-object v0, Lcom/melodix/music/PreviewPlayerChrome;->tintInfo:Ljava/lang/String;

    .line 300
    :cond_0
    :goto_0
    return-void

    .line 285
    :cond_1
    const v0, 0x7f090245

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    instance-of v1, v0, Landroid/widget/ImageView;

    if-eqz v1, :cond_0

    .line 286
    check-cast v0, Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->tintSource:Landroid/graphics/drawable/Drawable;

    if-eq v1, v0, :cond_0

    iput-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->tintSource:Landroid/graphics/drawable/Drawable;

    .line 287
    const/16 v0, 0xc

    invoke-static {v1, v0}, Lcom/melodix/music/PreviewPlayerChrome;->shrink(Landroid/graphics/drawable/Drawable;I)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 288
    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerChrome;->dominant(Landroid/graphics/Bitmap;)I

    move-result v3

    .line 289
    new-instance v4, Ljava/lang/StringBuilder;

    if-nez v1, :cond_3

    const-string v0, "aucune image"

    :goto_1
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    if-nez v2, :cond_4

    const-string v0, ", \u00e9chantillon impossible"

    :goto_2
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/melodix/music/PreviewPlayerChrome;->tintInfo:Ljava/lang/String;

    .line 291
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerChrome;->tintLayer:Landroid/graphics/drawable/GradientDrawable;

    if-nez v3, :cond_6

    const/4 v0, 0x2

    new-array v0, v0, [I

    :goto_3
    invoke-virtual {v2, v0}, Landroid/graphics/drawable/GradientDrawable;->setColors([I)V

    .line 293
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v0, v7}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 294
    const/4 v2, 0x5

    invoke-static {v1, v2}, Lcom/melodix/music/PreviewPlayerChrome;->shrink(Landroid/graphics/drawable/Drawable;I)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 295
    if-eqz v1, :cond_9

    new-instance v0, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerChrome;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-direct {v0, v2, v1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    invoke-virtual {v0, v6}, Landroid/graphics/drawable/BitmapDrawable;->setFilterBitmap(Z)V

    const/16 v1, 0xa5

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/BitmapDrawable;->setAlpha(I)V

    move-object v1, v0

    .line 296
    :goto_4
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->appliedBackground:Landroid/graphics/drawable/Drawable;

    instance-of v0, v0, Landroid/graphics/drawable/LayerDrawable;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->appliedBackground:Landroid/graphics/drawable/Drawable;

    check-cast v0, Landroid/graphics/drawable/LayerDrawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/LayerDrawable;->getNumberOfLayers()I

    move-result v0

    const/4 v2, 0x4

    if-ne v0, v2, :cond_2

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->appliedBackground:Landroid/graphics/drawable/Drawable;

    check-cast v0, Landroid/graphics/drawable/LayerDrawable;

    invoke-virtual {v0, v6, v1}, Landroid/graphics/drawable/LayerDrawable;->setDrawable(ILandroid/graphics/drawable/Drawable;)V

    .line 297
    :cond_2
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerChrome;->refreshSystemBarColors()V

    .line 298
    const v0, 0x7f09023a

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-nez v0, :cond_7

    const/4 v0, 0x0

    move-object v1, v0

    .line 299
    :goto_5
    if-eqz v1, :cond_0

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1c

    if-lt v0, v2, :cond_0

    if-nez v3, :cond_8

    const v0, -0x1fb762

    :goto_6
    invoke-virtual {v1, v0}, Landroid/view/View;->setOutlineSpotShadowColor(I)V

    invoke-virtual {v1, v0}, Landroid/view/View;->setOutlineAmbientShadowColor(I)V

    goto/16 :goto_0

    .line 289
    :cond_3
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    :cond_4
    if-nez v3, :cond_5

    const-string v0, ", couleur nulle"

    goto :goto_2

    :cond_5
    const-string v0, ", teinte #%06x"

    new-array v2, v6, [Ljava/lang/Object;

    and-int v5, v3, v8

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v2, v7

    invoke-static {v0, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_2

    .line 291
    :cond_6
    const/4 v0, 0x3

    new-array v0, v0, [I

    const/high16 v4, 0x4d000000    # 1.34217728E8f

    and-int v5, v3, v8

    or-int/2addr v4, v5

    aput v4, v0, v7

    const/high16 v4, 0x14000000

    and-int v5, v3, v8

    or-int/2addr v4, v5

    aput v4, v0, v6

    goto/16 :goto_3

    .line 298
    :cond_7
    const-string v1, "previewPlayerArtCard"

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v0

    move-object v1, v0

    goto :goto_5

    .line 299
    :cond_8
    const/high16 v0, -0x1000000

    or-int/2addr v0, v3

    goto :goto_6

    :cond_9
    move-object v1, v0

    goto :goto_4
.end method


# virtual methods
.method protected onAttachedToWindow()V
    .locals 1

    .prologue
    .line 583
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

    .prologue
    const/4 v3, 0x0

    const/4 v1, 0x0

    .line 584
    iput-boolean v3, p0, Lcom/melodix/music/PreviewPlayerChrome;->closing:Z

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerChrome;->activity()Landroid/app/Activity;

    move-result-object v0

    if-nez v0, :cond_2

    move-object v0, v1

    :goto_0
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/ViewPropertyAnimator;->cancel()V

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/view/ViewPropertyAnimator;->setUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)Landroid/view/ViewPropertyAnimator;

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {v0, v2}, Landroid/view/View;->setAlpha(F)V

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/view/View;->setTranslationY(F)V

    :cond_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->observer:Landroid/view/ViewTreeObserver;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->observer:Landroid/view/ViewTreeObserver;

    invoke-virtual {v0}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->observer:Landroid/view/ViewTreeObserver;

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    :cond_1
    iput-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->observer:Landroid/view/ViewTreeObserver;

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->syncTask:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerChrome;->removeCallbacks(Ljava/lang/Runnable;)Z

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->visualTick:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerChrome;->removeCallbacks(Ljava/lang/Runnable;)Z

    iput-boolean v3, p0, Lcom/melodix/music/PreviewPlayerChrome;->ticking:Z

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerChrome;->restoreHeader()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerChrome;->restoreBackground()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerChrome;->restoreStatusBar()V

    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    return-void

    :cond_2
    const v2, 0x7f09023a

    invoke-virtual {v0, v2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    goto :goto_0
.end method

.method public onGlobalLayout()V
    .locals 0

    .prologue
    .line 582
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerChrome;->sync()V

    return-void
.end method

.method protected onVisibilityChanged(Landroid/view/View;I)V
    .locals 1

    .prologue
    .line 585
    invoke-super {p0, p1, p2}, Landroid/view/View;->onVisibilityChanged(Landroid/view/View;I)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->syncTask:Ljava/lang/Runnable;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->syncTask:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerChrome;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method

.method protected onWindowVisibilityChanged(I)V
    .locals 1

    .prologue
    .line 586
    invoke-super {p0, p1}, Landroid/view/View;->onWindowVisibilityChanged(I)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->syncTask:Ljava/lang/Runnable;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->syncTask:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerChrome;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method
