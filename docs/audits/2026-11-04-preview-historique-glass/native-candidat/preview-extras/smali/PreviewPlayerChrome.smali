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
.field private static sizeInfo:Ljava/lang/String;

.field static state:Ljava/lang/String;

.field private static tintInfo:Ljava/lang/String;


# instance fields
.field private appliedBackground:Landroid/graphics/drawable/Drawable;

.field private artPlaying:Ljava/lang/Boolean;

.field private artScale:F

.field private backdrop:Landroid/graphics/drawable/Drawable;

.field private bypassClose:Z

.field private chromeApplied:Z

.field private closing:Z

.field private header:Landroid/view/View;

.field private headerHidden:Z

.field private likeArt:Lcom/melodix/music/PreviewPlayerLikeArt;

.field private likeControl:Landroid/view/View;

.field private observer:Landroid/view/ViewTreeObserver;

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

.field private final syncTask:Ljava/lang/Runnable;

.field private ticking:Z

.field private tintLayer:Landroid/graphics/drawable/GradientDrawable;

.field private tintSource:Landroid/graphics/drawable/Drawable;

.field private final visualTick:Ljava/lang/Runnable;

.field private wasVisible:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 134
    const-string v0, "non affich\u00e9"

    sput-object v0, Lcom/melodix/music/PreviewPlayerChrome;->state:Ljava/lang/String;

    .line 135
    const-string v0, "\u2014"

    sput-object v0, Lcom/melodix/music/PreviewPlayerChrome;->tintInfo:Ljava/lang/String;

    const-string v0, "\u2014"

    sput-object v0, Lcom/melodix/music/PreviewPlayerChrome;->sizeInfo:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .prologue
    .line 66
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 45
    new-instance v0, Lcom/melodix/music/PreviewPlayerChrome$1;

    invoke-direct {v0, p0}, Lcom/melodix/music/PreviewPlayerChrome$1;-><init>(Lcom/melodix/music/PreviewPlayerChrome;)V

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->visualTick:Ljava/lang/Runnable;

    .line 65
    new-instance v0, Lcom/melodix/music/PreviewPlayerChrome$2;

    invoke-direct {v0, p0}, Lcom/melodix/music/PreviewPlayerChrome$2;-><init>(Lcom/melodix/music/PreviewPlayerChrome;)V

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->syncTask:Ljava/lang/Runnable;

    .line 137
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->artScale:F

    .line 66
    return-void
.end method

.method static synthetic access$0(Lcom/melodix/music/PreviewPlayerChrome;)Z
    .locals 1

    .prologue
    .line 76
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerChrome;->playerVisible()Z

    move-result v0

    return v0
.end method

.method static synthetic access$1(Lcom/melodix/music/PreviewPlayerChrome;Z)V
    .locals 0

    .prologue
    .line 36
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerChrome;->ticking:Z

    return-void
.end method

.method static synthetic access$10(Lcom/melodix/music/PreviewPlayerChrome;)Landroid/view/View;
    .locals 1

    .prologue
    .line 44
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->shuffleControl:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$11(Lcom/melodix/music/PreviewPlayerChrome;)V
    .locals 0

    .prologue
    .line 433
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerChrome;->sync()V

    return-void
.end method

.method static synthetic access$12(Lcom/melodix/music/PreviewPlayerChrome;)Z
    .locals 1

    .prologue
    .line 38
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->closing:Z

    return v0
.end method

.method static synthetic access$13(Lcom/melodix/music/PreviewPlayerChrome;F)I
    .locals 1

    .prologue
    .line 67
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v0

    return v0
.end method

.method static synthetic access$14(Lcom/melodix/music/PreviewPlayerChrome;)V
    .locals 0

    .prologue
    .line 318
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerChrome;->navigateBack()V

    return-void
.end method

.method static synthetic access$15(Lcom/melodix/music/PreviewPlayerChrome;Z)V
    .locals 0

    .prologue
    .line 38
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerChrome;->closing:Z

    return-void
.end method

.method static synthetic access$16(Lcom/melodix/music/PreviewPlayerChrome;Z)V
    .locals 0

    .prologue
    .line 38
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerChrome;->bypassClose:Z

    return-void
.end method

.method static synthetic access$2(Lcom/melodix/music/PreviewPlayerChrome;)Landroid/app/Activity;
    .locals 1

    .prologue
    .line 68
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerChrome;->activity()Landroid/app/Activity;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$3(Lcom/melodix/music/PreviewPlayerChrome;Landroid/app/Activity;)V
    .locals 0

    .prologue
    .line 163
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerChrome;->updateTint(Landroid/app/Activity;)V

    return-void
.end method

.method static synthetic access$4(Lcom/melodix/music/PreviewPlayerChrome;Landroid/app/Activity;)V
    .locals 0

    .prologue
    .line 181
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerChrome;->breathe(Landroid/app/Activity;)V

    return-void
.end method

.method static synthetic access$5(Lcom/melodix/music/PreviewPlayerChrome;)Lcom/melodix/music/PreviewPlayerDecoration;
    .locals 1

    .prologue
    .line 41
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->repeatArt:Lcom/melodix/music/PreviewPlayerDecoration;

    return-object v0
.end method

.method static synthetic access$6(Lcom/melodix/music/PreviewPlayerChrome;)Landroid/view/View;
    .locals 1

    .prologue
    .line 44
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->repeatControl:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$7(Lcom/melodix/music/PreviewPlayerChrome;)Lcom/melodix/music/PreviewPlayerLikeArt;
    .locals 1

    .prologue
    .line 42
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->likeArt:Lcom/melodix/music/PreviewPlayerLikeArt;

    return-object v0
.end method

.method static synthetic access$8(Lcom/melodix/music/PreviewPlayerChrome;)Landroid/view/View;
    .locals 1

    .prologue
    .line 43
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->likeControl:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$9(Lcom/melodix/music/PreviewPlayerChrome;)Lcom/melodix/music/PreviewPlayerDecoration;
    .locals 1

    .prologue
    .line 41
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->shuffleDot:Lcom/melodix/music/PreviewPlayerDecoration;

    return-object v0
.end method

.method private activity()Landroid/app/Activity;
    .locals 4

    .prologue
    .line 69
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerChrome;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 70
    const/4 v1, 0x0

    move v2, v1

    :goto_0
    const/16 v1, 0x8

    if-ge v2, v1, :cond_0

    instance-of v1, v0, Landroid/content/ContextWrapper;

    if-nez v1, :cond_1

    .line 74
    :cond_0
    instance-of v1, v0, Landroid/app/Activity;

    if-eqz v1, :cond_3

    check-cast v0, Landroid/app/Activity;

    :goto_1
    return-object v0

    .line 71
    :cond_1
    instance-of v1, v0, Landroid/app/Activity;

    if-eqz v1, :cond_2

    check-cast v0, Landroid/app/Activity;

    goto :goto_1

    :cond_2
    move-object v1, v0

    .line 72
    check-cast v1, Landroid/content/ContextWrapper;

    invoke-virtual {v1}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object v3

    if-eq v3, v0, :cond_0

    .line 70
    add-int/lit8 v1, v2, 0x1

    move v2, v1

    move-object v0, v3

    goto :goto_0

    .line 74
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

    .line 108
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->chromeApplied:Z

    if-eqz v0, :cond_1

    .line 124
    :cond_0
    :goto_0
    return-void

    .line 109
    :cond_1
    const v0, 0x7f09022f

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->root:Landroid/view/View;

    const v0, 0x7f09023a

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->panel:Landroid/view/View;

    .line 110
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->root:Landroid/view/View;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->panel:Landroid/view/View;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->panel:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 111
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->root:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->rootBackground:Landroid/graphics/drawable/Drawable;

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->panel:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->panelBackground:Landroid/graphics/drawable/Drawable;

    .line 112
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

    .line 113
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

    .line 114
    new-instance v4, Landroid/graphics/drawable/GradientDrawable;

    sget-object v5, Landroid/graphics/drawable/GradientDrawable$Orientation;->TOP_BOTTOM:Landroid/graphics/drawable/GradientDrawable$Orientation;

    new-array v6, v9, [I

    invoke-direct {v4, v5, v6}, Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable$Orientation;[I)V

    iput-object v4, p0, Lcom/melodix/music/PreviewPlayerChrome;->tintLayer:Landroid/graphics/drawable/GradientDrawable;

    .line 116
    new-instance v4, Landroid/graphics/drawable/GradientDrawable;

    sget-object v5, Landroid/graphics/drawable/GradientDrawable$Orientation;->TOP_BOTTOM:Landroid/graphics/drawable/GradientDrawable$Orientation;

    new-array v6, v10, [I

    fill-array-data v6, :array_0

    invoke-direct {v4, v5, v6}, Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable$Orientation;[I)V

    iput-object v4, p0, Lcom/melodix/music/PreviewPlayerChrome;->scrim:Landroid/graphics/drawable/GradientDrawable;

    .line 117
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

    .line 120
    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerChrome;->rootBackground:Landroid/graphics/drawable/Drawable;

    iput-object v4, p0, Lcom/melodix/music/PreviewPlayerChrome;->backdrop:Landroid/graphics/drawable/Drawable;

    .line 121
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

    .line 122
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

    .line 123
    iput-boolean v7, p0, Lcom/melodix/music/PreviewPlayerChrome;->chromeApplied:Z

    goto/16 :goto_0

    .line 116
    nop

    :array_0
    .array-data 4
        0x400a0614
        -0x4cf5f9ec
        -0xdf5f9ec
    .end array-data
.end method

.method private breathe(Landroid/app/Activity;)V
    .locals 3

    .prologue
    .line 182
    const v0, 0x7f09023e

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    const v0, 0x7f09023a

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 183
    if-nez v0, :cond_1

    const/4 v0, 0x0

    move-object v1, v0

    .line 184
    :goto_0
    if-eqz v2, :cond_0

    if-nez v1, :cond_2

    .line 192
    :cond_0
    :goto_1
    return-void

    .line 183
    :cond_1
    const-string v1, "previewPlayerArtCard"

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v0

    move-object v1, v0

    goto :goto_0

    .line 185
    :cond_2
    invoke-virtual {v2}, Landroid/view/View;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v0

    if-nez v0, :cond_4

    const-string v0, ""

    .line 186
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

    .line 187
    :goto_3
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerChrome;->artPlaying:Ljava/lang/Boolean;

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerChrome;->artPlaying:Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eq v2, v0, :cond_0

    .line 188
    :cond_3
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->artPlaying:Ljava/lang/Boolean;

    iget v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->artScale:F

    .line 189
    invoke-virtual {v1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 190
    invoke-virtual {v1, v0}, Landroid/view/View;->setScaleX(F)V

    invoke-virtual {v1, v0}, Landroid/view/View;->setScaleY(F)V

    goto :goto_1

    .line 185
    :cond_4
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_2

    .line 186
    :cond_5
    const/4 v0, 0x1

    goto :goto_3
.end method

.method public static captureBeforeExpand(Landroid/app/Activity;)V
    .locals 12

    .prologue
    const/4 v1, 0x0

    .line 92
    const v0, 0x7f09023a

    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const v2, 0x7f09022f

    invoke-virtual {p0, v2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    .line 93
    if-nez v0, :cond_1

    move-object v0, v1

    .line 94
    :goto_0
    instance-of v3, v0, Lcom/melodix/music/PreviewPlayerChrome;

    if-eqz v3, :cond_0

    if-nez v2, :cond_2

    .line 106
    :cond_0
    :goto_1
    return-void

    .line 93
    :cond_1
    const-string v3, "previewPlayerChrome"

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v0

    goto :goto_0

    .line 95
    :cond_2
    check-cast v0, Lcom/melodix/music/PreviewPlayerChrome;

    .line 96
    iput-object v1, v0, Lcom/melodix/music/PreviewPlayerChrome;->previousScreen:Landroid/graphics/Bitmap;

    .line 97
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x1a

    if-lt v3, v4, :cond_3

    invoke-static {}, Landroid/animation/ValueAnimator;->areAnimatorsEnabled()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 98
    :cond_3
    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    move-result v3

    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    move-result v4

    .line 99
    if-lez v3, :cond_0

    if-lez v4, :cond_0

    .line 102
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

    .line 103
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

    .line 104
    new-instance v4, Landroid/graphics/Canvas;

    invoke-direct {v4, v3}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    invoke-virtual {v4, v5, v5}, Landroid/graphics/Canvas;->scale(FF)V

    invoke-virtual {v2, v4}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    iput-object v3, v0, Lcom/melodix/music/PreviewPlayerChrome;->previousScreen:Landroid/graphics/Bitmap;
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_1

    .line 105
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

    .line 195
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    .line 196
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

    .line 199
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

    .line 200
    :cond_0
    :goto_1
    return-void

    .line 196
    :cond_1
    aget-object v4, v2, v0

    .line 197
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

    .line 196
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
    .line 307
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->closing:Z

    .line 308
    invoke-virtual {p2}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 309
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

    .line 310
    new-instance v1, Landroid/view/animation/DecelerateInterpolator;

    const v2, 0x3fa66666    # 1.3f

    invoke-direct {v1, v2}, Landroid/view/animation/DecelerateInterpolator;-><init>(F)V

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    new-instance v1, Lcom/melodix/music/PreviewPlayerChrome$3;

    invoke-direct {v1, p0, p2, p1}, Lcom/melodix/music/PreviewPlayerChrome$3;-><init>(Lcom/melodix/music/PreviewPlayerChrome;Landroid/view/View;Landroid/app/Activity;)V

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    .line 316
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 317
    return-void
.end method

.method private static contentHeight(Landroid/view/View;)I
    .locals 5

    .prologue
    const/4 v1, 0x0

    .line 212
    const-string v0, "previewPlayerSpacer"

    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 217
    :goto_0
    return v1

    .line 213
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

    .line 214
    :cond_2
    check-cast p0, Landroid/widget/LinearLayout;

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getPaddingTop()I

    move-result v0

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getPaddingBottom()I

    move-result v2

    add-int/2addr v0, v2

    move v2, v1

    move v3, v0

    .line 215
    :goto_1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    if-lt v2, v0, :cond_3

    move v1, v3

    .line 217
    goto :goto_0

    .line 215
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

    .line 216
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
    .line 143
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

    .line 152
    :goto_0
    return v2

    .line 144
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

    .line 145
    const/4 v2, 0x0

    :goto_1
    invoke-virtual/range {p0 .. p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    if-lt v2, v3, :cond_2

    .line 151
    const-wide/16 v2, 0x0

    cmp-long v2, v4, v2

    if-nez v2, :cond_5

    const/4 v2, 0x0

    goto :goto_0

    .line 145
    :cond_2
    const/4 v3, 0x0

    :goto_2
    invoke-virtual/range {p0 .. p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v13

    if-lt v3, v13, :cond_3

    add-int/2addr v2, v12

    goto :goto_1

    .line 146
    :cond_3
    move-object/from16 v0, p0

    invoke-virtual {v0, v3, v2}, Landroid/graphics/Bitmap;->getPixel(II)I

    move-result v13

    invoke-static {v13}, Landroid/graphics/Color;->alpha(I)I

    move-result v14

    const/16 v15, 0x80

    if-ge v14, v15, :cond_4

    .line 145
    :goto_3
    add-int/2addr v3, v12

    goto :goto_2

    .line 147
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

    .line 148
    sub-int/2addr v14, v15

    div-int/lit8 v14, v14, 0x20

    add-int/lit8 v14, v14, 0x1

    .line 149
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

    .line 152
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
    .line 67
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

.method private findCollapse(Landroid/view/View;)Landroid/view/View;
    .locals 2

    .prologue
    .line 289
    const-string v1, "R\u00e9duire le lecteur"

    invoke-virtual {p1}, Landroid/view/View;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v0

    if-nez v0, :cond_0

    const-string v0, ""

    :goto_0
    invoke-virtual {v1, v0}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 291
    :goto_1
    return-object p1

    .line 289
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v0

    goto :goto_0

    .line 290
    :cond_1
    instance-of v0, p1, Landroid/view/ViewGroup;

    if-eqz v0, :cond_2

    check-cast p1, Landroid/view/ViewGroup;

    const/4 v0, 0x0

    :goto_2
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-lt v0, v1, :cond_3

    .line 291
    :cond_2
    const/4 p1, 0x0

    goto :goto_1

    .line 290
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

.method private hideHeader(Landroid/app/Activity;)V
    .locals 3

    .prologue
    .line 78
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->headerHidden:Z

    if-eqz v0, :cond_1

    .line 85
    :cond_0
    :goto_0
    return-void

    .line 79
    :cond_1
    const v0, 0x7f090230

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const v1, 0x7f09022f

    invoke-virtual {p1, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 80
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    instance-of v2, v2, Landroid/view/View;

    if-eqz v2, :cond_0

    .line 81
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 82
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    if-ne v2, v1, :cond_0

    .line 83
    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->header:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v1

    iput v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->previousHeaderVisibility:I

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->headerHidden:Z

    .line 84
    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0
.end method

.method public static interceptBack(Landroid/app/Activity;)Z
    .locals 6

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 295
    const v0, 0x7f09023a

    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    .line 296
    if-eqz v3, :cond_0

    invoke-virtual {v3}, Landroid/view/View;->isShown()Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    move v0, v1

    .line 304
    :goto_0
    return v0

    .line 297
    :cond_1
    const-string v0, "previewPlayerChrome"

    invoke-virtual {v3, v0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v0

    .line 298
    instance-of v4, v0, Lcom/melodix/music/PreviewPlayerChrome;

    if-nez v4, :cond_2

    move v0, v1

    goto :goto_0

    .line 299
    :cond_2
    check-cast v0, Lcom/melodix/music/PreviewPlayerChrome;

    .line 300
    iget-boolean v4, v0, Lcom/melodix/music/PreviewPlayerChrome;->bypassClose:Z

    if-eqz v4, :cond_3

    move v0, v1

    goto :goto_0

    .line 301
    :cond_3
    iget-boolean v4, v0, Lcom/melodix/music/PreviewPlayerChrome;->closing:Z

    if-eqz v4, :cond_4

    move v0, v2

    goto :goto_0

    .line 302
    :cond_4
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x1a

    if-lt v4, v5, :cond_5

    invoke-static {}, Landroid/animation/ValueAnimator;->areAnimatorsEnabled()Z

    move-result v4

    if-nez v4, :cond_5

    move v0, v1

    goto :goto_0

    .line 303
    :cond_5
    invoke-direct {v0, p0, v3}, Lcom/melodix/music/PreviewPlayerChrome;->closeAnimated(Landroid/app/Activity;Landroid/view/View;)V

    move v0, v2

    .line 304
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

    .line 220
    const v0, 0x7f09023a

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    instance-of v0, v2, Landroid/widget/ScrollView;

    if-nez v0, :cond_1

    .line 272
    :cond_0
    :goto_0
    return-void

    .line 221
    :cond_1
    const-string v0, "previewPlayerArtFrame"

    invoke-virtual {v2, v0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v8

    const-string v0, "previewPlayerArtCard"

    invoke-virtual {v2, v0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v9

    .line 222
    if-eqz v8, :cond_0

    if-eqz v9, :cond_0

    invoke-virtual {v8}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v0, v0, Landroid/widget/LinearLayout;

    if-eqz v0, :cond_0

    .line 223
    invoke-virtual {v8}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    .line 225
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerChrome;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    if-eq v0, v1, :cond_0

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    instance-of v1, v1, Landroid/widget/LinearLayout;

    if-eqz v1, :cond_0

    .line 226
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerChrome;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v1

    iget v1, v1, Landroid/content/res/Configuration;->orientation:I

    if-ne v1, v5, :cond_d

    move v4, v5

    :goto_1
    move-object v1, v2

    .line 227
    check-cast v1, Landroid/widget/ScrollView;

    invoke-virtual {v1}, Landroid/widget/ScrollView;->isFillViewport()Z

    move-result v3

    if-nez v3, :cond_2

    invoke-virtual {v1, v5}, Landroid/widget/ScrollView;->setFillViewport(Z)V

    .line 228
    :cond_2
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    .line 229
    instance-of v1, v3, Landroid/widget/LinearLayout$LayoutParams;

    if-eqz v1, :cond_3

    move-object v1, v3

    check-cast v1, Landroid/widget/LinearLayout$LayoutParams;

    iget v1, v1, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    cmpl-float v1, v1, v7

    if-eqz v1, :cond_3

    .line 230
    check-cast v3, Landroid/widget/LinearLayout$LayoutParams;

    iput v6, v3, Landroid/widget/LinearLayout$LayoutParams;->height:I

    iput v7, v3, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 233
    :cond_3
    if-eqz v4, :cond_e

    move v1, v5

    .line 234
    :goto_2
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getOrientation()I

    move-result v3

    if-eq v3, v1, :cond_13

    .line 235
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 236
    if-eqz v4, :cond_f

    const/16 v1, 0x11

    :goto_3
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    move v3, v6

    .line 237
    :goto_4
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v1

    if-lt v3, v1, :cond_10

    .line 245
    :cond_4
    :goto_5
    if-eqz v4, :cond_14

    invoke-direct {p0, v11}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v1

    .line 246
    :goto_6
    invoke-virtual {v2}, Landroid/view/View;->getPaddingLeft()I

    move-result v3

    if-eq v3, v1, :cond_5

    invoke-virtual {v2}, Landroid/view/View;->getPaddingTop()I

    move-result v3

    invoke-virtual {v2}, Landroid/view/View;->getPaddingBottom()I

    move-result v7

    invoke-virtual {v2, v1, v3, v1, v7}, Landroid/view/View;->setPadding(IIII)V

    .line 247
    :cond_5
    invoke-virtual {v8}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    .line 248
    instance-of v3, v1, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v3, :cond_7

    .line 249
    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 250
    if-eqz v4, :cond_15

    move v7, v6

    :goto_7
    if-eqz v4, :cond_16

    invoke-direct {p0, v11}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v3

    .line 251
    :goto_8
    iget v10, v1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    if-ne v10, v7, :cond_6

    iget v10, v1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    if-eq v10, v3, :cond_7

    :cond_6
    iput v7, v1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    iput v3, v1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    invoke-virtual {v8, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 254
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

    .line 259
    :cond_8
    if-eqz v4, :cond_1e

    move v1, v6

    move v2, v6

    :goto_b
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v3

    if-lt v1, v3, :cond_19

    .line 260
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

    .line 261
    :goto_d
    if-lez v1, :cond_0

    if-lez v3, :cond_0

    .line 262
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

    .line 263
    invoke-virtual {v9}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    invoke-virtual {v8}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    .line 266
    const/high16 v3, 0x439f0000    # 318.0f

    invoke-direct {p0, v3}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v3

    invoke-static {v1, v3}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 267
    iget v7, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    if-ne v7, v3, :cond_9

    iget v7, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-eq v7, v3, :cond_a

    :cond_9
    iput v3, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    iput v3, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {v9, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 268
    :cond_a
    iget v0, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-eq v0, v1, :cond_b

    iput v1, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {v8, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 269
    :cond_b
    int-to-float v0, v1

    int-to-float v2, v3

    div-float/2addr v0, v2

    sub-int v2, v1, v3

    int-to-float v2, v2

    const/high16 v3, 0x40000000    # 2.0f

    div-float/2addr v2, v3

    invoke-virtual {v9, v2}, Landroid/view/View;->setTranslationY(F)V

    .line 270
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

    .line 271
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

    .line 226
    goto/16 :goto_1

    :cond_e
    move v1, v6

    .line 233
    goto/16 :goto_2

    .line 236
    :cond_f
    const/16 v1, 0x10

    goto/16 :goto_3

    .line 238
    :cond_10
    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v7

    invoke-virtual {v7}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    .line 239
    instance-of v10, v1, Landroid/widget/LinearLayout$LayoutParams;

    if-nez v10, :cond_11

    .line 237
    :goto_10
    add-int/lit8 v1, v3, 0x1

    move v3, v1

    goto/16 :goto_4

    .line 240
    :cond_11
    check-cast v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 241
    if-eqz v4, :cond_12

    const/4 v10, -0x1

    iput v10, v1, Landroid/widget/LinearLayout$LayoutParams;->width:I

    const/4 v10, 0x0

    iput v10, v1, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    .line 242
    :cond_12
    invoke-virtual {v7, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_10

    .line 244
    :cond_13
    if-nez v4, :cond_4

    const/16 v1, 0x10

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    goto/16 :goto_5

    .line 245
    :cond_14
    invoke-direct {p0, v12}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v1

    goto/16 :goto_6

    .line 250
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

    .line 254
    :cond_17
    const v1, 0x7f09023d

    invoke-virtual {p1, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    goto/16 :goto_9

    :cond_18
    move-object v1, v3

    .line 255
    check-cast v1, Landroid/view/ViewGroup;

    invoke-virtual {v1, v6}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    move-object v1, v3

    check-cast v1, Landroid/view/ViewGroup;

    invoke-virtual {v1, v6}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 254
    invoke-interface {v3}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    goto/16 :goto_a

    .line 259
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

    .line 260
    :cond_1b
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getHeight()I

    move-result v0

    const/high16 v1, 0x42800000    # 64.0f

    invoke-direct {p0, v1}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v1

    sub-int/2addr v0, v1

    move v1, v0

    goto/16 :goto_d

    .line 262
    :cond_1c
    const/16 v0, 0x230

    goto/16 :goto_e

    .line 271
    :cond_1d
    const-string v0, "paysage"

    goto/16 :goto_f

    :cond_1e
    move v2, v6

    goto/16 :goto_c
.end method

.method private navigateBack()V
    .locals 6

    .prologue
    .line 319
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerChrome;->activity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->closing:Z

    if-eqz v1, :cond_1

    .line 323
    :cond_0
    :goto_0
    return-void

    .line 320
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

    .line 322
    :goto_1
    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->closing:Z

    if-nez v1, :cond_0

    const v1, 0x7f09023a

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    goto :goto_0

    :catch_0
    move-exception v1

    goto :goto_1
.end method

.method private playerVisible()Z
    .locals 1

    .prologue
    .line 76
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

.method public static report()Ljava/lang/String;
    .locals 2

    .prologue
    .line 136
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

    .line 126
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->chromeApplied:Z

    if-nez v0, :cond_0

    iput-object v6, p0, Lcom/melodix/music/PreviewPlayerChrome;->previousScreen:Landroid/graphics/Bitmap;

    .line 133
    :goto_0
    return-void

    .line 127
    :cond_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->root:Landroid/view/View;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->root:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->backdrop:Landroid/graphics/drawable/Drawable;

    if-ne v0, v1, :cond_1

    .line 128
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

    .line 129
    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerChrome;->root:Landroid/view/View;

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerChrome;->rootBackground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v4, v5}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerChrome;->root:Landroid/view/View;

    invoke-virtual {v4, v0, v1, v2, v3}, Landroid/view/View;->setPadding(IIII)V

    .line 131
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

    .line 132
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
    .line 87
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->headerHidden:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->header:Landroid/view/View;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->header:Landroid/view/View;

    iget v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->previousHeaderVisibility:I

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 88
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->header:Landroid/view/View;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->headerHidden:Z

    .line 89
    return-void
.end method

.method private setupCosmetics(Landroid/app/Activity;)V
    .locals 11

    .prologue
    .line 355
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->setupDone:Z

    if-eqz v0, :cond_1

    .line 399
    :cond_0
    :goto_0
    return-void

    .line 356
    :cond_1
    const v0, 0x7f09023a

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    instance-of v0, v1, Landroid/view/ViewGroup;

    if-eqz v0, :cond_0

    .line 357
    invoke-direct {p0, v1}, Lcom/melodix/music/PreviewPlayerChrome;->findCollapse(Landroid/view/View;)Landroid/view/View;

    move-result-object v5

    .line 358
    const-string v0, "repeat"

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->repeatControl:Landroid/view/View;

    const-string v0, "shuffle"

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->shuffleControl:Landroid/view/View;

    .line 359
    const-string v0, "like"

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v3

    const-string v0, "previewPlayerTiles"

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v4

    .line 360
    const v0, 0x7f09023f

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v6

    const v0, 0x7f090240

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v7

    const v0, 0x7f09023e

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v8

    .line 361
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

    .line 362
    check-cast v0, Landroid/view/ViewGroup;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    move-object v0, v1

    check-cast v0, Landroid/view/ViewGroup;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 363
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerChrome;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    .line 364
    instance-of v0, v2, Landroid/view/ViewGroup;

    if-eqz v0, :cond_2

    move-object v0, v2

    check-cast v0, Landroid/view/ViewGroup;

    const/4 v9, 0x0

    invoke-virtual {v0, v9}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    check-cast v2, Landroid/view/ViewGroup;

    const/4 v0, 0x0

    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 365
    :cond_2
    const-string v0, "previewPlayerArtCard"

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v9

    const-string v0, "previewPlayerArtFrame"

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v2

    .line 366
    const-string v0, "previewPlayerDragHandle"

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v0

    .line 367
    if-eqz v0, :cond_3

    new-instance v1, Lcom/melodix/music/PreviewPlayerChrome$DismissGesture;

    const/4 v10, 0x0

    invoke-direct {v1, p0, v10}, Lcom/melodix/music/PreviewPlayerChrome$DismissGesture;-><init>(Lcom/melodix/music/PreviewPlayerChrome;Lcom/melodix/music/PreviewPlayerChrome$DismissGesture;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 368
    :cond_3
    if-eqz v9, :cond_4

    new-instance v0, Lcom/melodix/music/PreviewPlayerChrome$DismissGesture;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/melodix/music/PreviewPlayerChrome$DismissGesture;-><init>(Lcom/melodix/music/PreviewPlayerChrome;Lcom/melodix/music/PreviewPlayerChrome$DismissGesture;)V

    invoke-virtual {v9, v0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 369
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

    .line 370
    :cond_5
    if-eqz v9, :cond_6

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1c

    if-lt v0, v1, :cond_6

    const v0, -0x1fb762

    invoke-virtual {v9, v0}, Landroid/view/View;->setOutlineSpotShadowColor(I)V

    const v0, -0x1fb762

    invoke-virtual {v9, v0}, Landroid/view/View;->setOutlineAmbientShadowColor(I)V

    .line 371
    :cond_6
    instance-of v0, v3, Landroid/widget/ImageView;

    if-eqz v0, :cond_7

    .line 372
    iput-object v3, p0, Lcom/melodix/music/PreviewPlayerChrome;->likeControl:Landroid/view/View;

    .line 373
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

    .line 374
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

    .line 375
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

    .line 377
    :cond_7
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->repeatControl:Landroid/view/View;

    check-cast v0, Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageAlpha(I)V

    .line 378
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

    .line 379
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

    .line 380
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

    .line 381
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

    .line 382
    instance-of v0, v4, Landroid/view/ViewGroup;

    if-eqz v0, :cond_8

    move-object v0, v4

    check-cast v0, Landroid/view/ViewGroup;

    const/4 v1, 0x0

    :goto_3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    if-lt v1, v2, :cond_c

    .line 383
    :cond_8
    const v0, 0x7f09023d

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 384
    instance-of v1, v0, Landroid/widget/SeekBar;

    if-eqz v1, :cond_9

    move-object v6, v0

    .line 385
    check-cast v6, Landroid/widget/SeekBar;

    .line 386
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

    .line 387
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

    .line 388
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

    .line 389
    const/4 v1, 0x0

    invoke-virtual {v6, v1}, Landroid/widget/SeekBar;->setThumbTintList(Landroid/content/res/ColorStateList;)V

    invoke-virtual {v6, v0}, Landroid/widget/SeekBar;->setThumb(Landroid/graphics/drawable/Drawable;)V

    const/high16 v0, 0x41400000    # 12.0f

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v0

    invoke-virtual {v6, v0}, Landroid/widget/SeekBar;->setThumbOffset(I)V

    .line 390
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

    .line 391
    invoke-virtual {v6}, Landroid/widget/SeekBar;->getProgressDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 392
    instance-of v1, v0, Landroid/graphics/drawable/LayerDrawable;

    if-eqz v1, :cond_9

    .line 393
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/LayerDrawable;

    .line 394
    const/high16 v1, 0x1020000

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 395
    instance-of v1, v0, Landroid/graphics/drawable/GradientDrawable;

    if-eqz v1, :cond_9

    check-cast v0, Landroid/graphics/drawable/GradientDrawable;

    const v1, 0x55ffffff    # 3.518437E13f

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 398
    :cond_9
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->setupDone:Z

    goto/16 :goto_0

    .line 380
    :cond_a
    aget-object v5, v1, v0

    new-instance v6, Lcom/melodix/music/PreviewPlayerChrome$PressEffect;

    const/4 v7, 0x1

    invoke-direct {v6, v7}, Lcom/melodix/music/PreviewPlayerChrome$PressEffect;-><init>(Z)V

    invoke-virtual {v5, v6}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_1

    .line 381
    :cond_b
    aget-object v3, v1, v0

    new-instance v5, Lcom/melodix/music/PreviewPlayerChrome$PressEffect;

    const/4 v6, 0x0

    invoke-direct {v5, v6}, Lcom/melodix/music/PreviewPlayerChrome$PressEffect;-><init>(Z)V

    invoke-virtual {v3, v5}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_2

    .line 382
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

    .line 156
    if-nez p0, :cond_0

    .line 161
    :goto_0
    return-object v0

    .line 158
    :cond_0
    :try_start_0
    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {p1, p1, v1}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 159
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

    .line 160
    goto :goto_0

    .line 161
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method private sizeArtwork(Landroid/app/Activity;)V
    .locals 10

    .prologue
    const/4 v1, 0x0

    const v9, 0x3fa66666    # 1.3f

    .line 410
    const v0, 0x7f09023a

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerChrome;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    .line 411
    if-eqz v4, :cond_0

    instance-of v2, v0, Landroid/view/ViewGroup;

    if-nez v2, :cond_1

    .line 432
    :cond_0
    :goto_0
    return-void

    .line 412
    :cond_1
    check-cast v0, Landroid/view/ViewGroup;

    .line 413
    const-string v2, "previewPlayerArtFrame"

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v5

    const-string v2, "previewPlayerArtCard"

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v6

    .line 414
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

    .line 416
    :goto_1
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-lt v2, v1, :cond_6

    .line 422
    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    .line 423
    instance-of v0, v1, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v0, :cond_2

    move-object v0, v1

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    iget v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    iget v0, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    add-int/2addr v0, v2

    add-int/2addr v3, v0

    .line 424
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

    .line 425
    const/high16 v0, 0x439f0000    # 318.0f

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v0

    invoke-virtual {v5}, Landroid/view/View;->getWidth()I

    move-result v3

    invoke-static {v0, v3}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 426
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

    .line 427
    :cond_3
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerChrome;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v3

    iget v3, v3, Landroid/content/res/Configuration;->fontScale:F

    cmpl-float v3, v3, v9

    if-lez v3, :cond_9

    .line 428
    :goto_2
    if-lez v0, :cond_0

    .line 429
    invoke-virtual {v6}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    .line 430
    iget v3, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-eq v3, v0, :cond_4

    iput v0, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {v5, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 431
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

    .line 417
    :cond_6
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v7

    .line 418
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

    .line 416
    :cond_7
    :goto_3
    add-int/lit8 v1, v2, 0x1

    move v2, v1

    goto/16 :goto_1

    .line 419
    :cond_8
    invoke-virtual {v7}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    invoke-virtual {v7}, Landroid/view/View;->getMeasuredHeight()I

    move-result v7

    add-int/2addr v3, v7

    .line 420
    instance-of v7, v1, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v7, :cond_7

    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;

    iget v7, v1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    iget v1, v1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    add-int/2addr v1, v7

    add-int/2addr v3, v1

    goto :goto_3

    .line 427
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
    .line 203
    const/4 v0, 0x2

    new-array v3, v0, [I

    fill-array-data v3, :array_0

    array-length v4, v3

    const/4 v0, 0x0

    move v2, v0

    :goto_0
    if-lt v2, v4, :cond_0

    .line 208
    return-void

    .line 203
    :cond_0
    aget v0, v3, v2

    .line 204
    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    instance-of v0, v1, Landroid/widget/ImageView;

    if-eqz v0, :cond_1

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v0

    if-gtz v0, :cond_2

    .line 203
    :cond_1
    :goto_1
    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto :goto_0

    .line 205
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

    .line 206
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

    .line 203
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

    .line 401
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->playStyled:Z

    if-eqz v0, :cond_1

    .line 408
    :cond_0
    :goto_0
    return-void

    .line 402
    :cond_1
    const v0, 0x7f09023e

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 403
    new-instance v1, Landroid/graphics/drawable/GradientDrawable;

    sget-object v2, Landroid/graphics/drawable/GradientDrawable$Orientation;->BR_TL:Landroid/graphics/drawable/GradientDrawable$Orientation;

    const/4 v3, 0x2

    new-array v3, v3, [I

    fill-array-data v3, :array_0

    invoke-direct {v1, v2, v3}, Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable$Orientation;[I)V

    .line 404
    invoke-virtual {v1, v5}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    .line 405
    new-instance v2, Landroid/graphics/drawable/RippleDrawable;

    const v3, 0x44ffffff    # 2047.9999f

    invoke-static {v3}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v3

    const/4 v4, 0x0

    invoke-direct {v2, v3, v1, v4}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v0, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 406
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1c

    if-lt v1, v2, :cond_2

    const v1, -0x1fb762

    invoke-virtual {v0, v1}, Landroid/view/View;->setOutlineSpotShadowColor(I)V

    const v1, -0x84c01c

    invoke-virtual {v0, v1}, Landroid/view/View;->setOutlineAmbientShadowColor(I)V

    .line 407
    :cond_2
    iput-boolean v5, p0, Lcom/melodix/music/PreviewPlayerChrome;->playStyled:Z

    goto :goto_0

    .line 403
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

    .line 434
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerChrome;->playerVisible()Z

    move-result v0

    if-nez v0, :cond_5

    const-string v0, "non affich\u00e9"

    sput-object v0, Lcom/melodix/music/PreviewPlayerChrome;->state:Ljava/lang/String;

    .line 435
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

    .line 436
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

    .line 437
    :cond_1
    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->wasVisible:Z

    .line 438
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->ticking:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->visualTick:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerChrome;->removeCallbacks(Ljava/lang/Runnable;)Z

    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->ticking:Z

    :cond_2
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerChrome;->restoreHeader()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerChrome;->restoreBackground()V

    .line 453
    :cond_3
    :goto_1
    return-void

    .line 435
    :cond_4
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerChrome;->activity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0, v8}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    goto :goto_0

    .line 440
    :cond_5
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerChrome;->activity()Landroid/app/Activity;

    move-result-object v3

    if-eqz v3, :cond_3

    .line 441
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->wasVisible:Z

    if-eqz v0, :cond_9

    move v0, v1

    :goto_2
    iput-boolean v2, p0, Lcom/melodix/music/PreviewPlayerChrome;->wasVisible:Z

    .line 442
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

    .line 443
    invoke-direct {p0, v3}, Lcom/melodix/music/PreviewPlayerChrome;->hideHeader(Landroid/app/Activity;)V

    invoke-direct {p0, v3}, Lcom/melodix/music/PreviewPlayerChrome;->applyBackground(Landroid/app/Activity;)V

    invoke-direct {p0, v3}, Lcom/melodix/music/PreviewPlayerChrome;->stylePlay(Landroid/app/Activity;)V

    invoke-direct {p0, v3}, Lcom/melodix/music/PreviewPlayerChrome;->sizeArtwork(Landroid/app/Activity;)V

    invoke-direct {p0, v3}, Lcom/melodix/music/PreviewPlayerChrome;->landscape(Landroid/app/Activity;)V

    invoke-direct {p0, v3}, Lcom/melodix/music/PreviewPlayerChrome;->sizeSkips(Landroid/app/Activity;)V

    invoke-direct {p0, v3}, Lcom/melodix/music/PreviewPlayerChrome;->setupCosmetics(Landroid/app/Activity;)V

    invoke-direct {p0, v3}, Lcom/melodix/music/PreviewPlayerChrome;->updateTint(Landroid/app/Activity;)V

    .line 444
    if-eqz v0, :cond_7

    .line 445
    invoke-virtual {v3, v8}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 446
    if-eqz v0, :cond_7

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x1a

    if-lt v1, v3, :cond_6

    invoke-static {}, Landroid/animation/ValueAnimator;->areAnimatorsEnabled()Z

    move-result v1

    if-eqz v1, :cond_7

    .line 447
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

    .line 448
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v6}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const-wide/16 v4, 0x154

    invoke-virtual {v0, v4, v5}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    new-instance v1, Landroid/view/animation/DecelerateInterpolator;

    const v3, 0x3fcccccd    # 1.6f

    invoke-direct {v1, v3}, Landroid/view/animation/DecelerateInterpolator;-><init>(F)V

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 451
    :cond_7
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->setupDone:Z

    if-eqz v0, :cond_8

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->ticking:Z

    if-nez v0, :cond_8

    iput-boolean v2, p0, Lcom/melodix/music/PreviewPlayerChrome;->ticking:Z

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->visualTick:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerChrome;->post(Ljava/lang/Runnable;)Z

    .line 452
    :cond_8
    invoke-static {}, Lcom/melodix/music/PreviewPlayerChrome;->report()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/melodix/music/PreviewPlayerTiles;->displayReport:Ljava/lang/String;

    goto/16 :goto_1

    :cond_9
    move v0, v2

    .line 441
    goto/16 :goto_2

    .line 442
    :cond_a
    const-string v1, "portrait"

    goto/16 :goto_3
.end method

.method private updateTint(Landroid/app/Activity;)V
    .locals 9

    .prologue
    const v8, 0xffffff

    const/4 v7, 0x0

    const/4 v6, 0x1

    .line 164
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->tintLayer:Landroid/graphics/drawable/GradientDrawable;

    if-nez v0, :cond_1

    const-string v0, "fond non appliqu\u00e9"

    sput-object v0, Lcom/melodix/music/PreviewPlayerChrome;->tintInfo:Ljava/lang/String;

    .line 179
    :cond_0
    :goto_0
    return-void

    .line 165
    :cond_1
    const v0, 0x7f090245

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    instance-of v1, v0, Landroid/widget/ImageView;

    if-eqz v1, :cond_0

    .line 166
    check-cast v0, Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->tintSource:Landroid/graphics/drawable/Drawable;

    if-eq v1, v0, :cond_0

    iput-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->tintSource:Landroid/graphics/drawable/Drawable;

    .line 167
    const/16 v0, 0xc

    invoke-static {v1, v0}, Lcom/melodix/music/PreviewPlayerChrome;->shrink(Landroid/graphics/drawable/Drawable;I)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 168
    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerChrome;->dominant(Landroid/graphics/Bitmap;)I

    move-result v3

    .line 169
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

    .line 171
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerChrome;->tintLayer:Landroid/graphics/drawable/GradientDrawable;

    if-nez v3, :cond_6

    const/4 v0, 0x2

    new-array v0, v0, [I

    :goto_3
    invoke-virtual {v2, v0}, Landroid/graphics/drawable/GradientDrawable;->setColors([I)V

    .line 173
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v0, v7}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 174
    const/4 v2, 0x5

    invoke-static {v1, v2}, Lcom/melodix/music/PreviewPlayerChrome;->shrink(Landroid/graphics/drawable/Drawable;I)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 175
    if-eqz v1, :cond_9

    new-instance v0, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerChrome;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-direct {v0, v2, v1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    invoke-virtual {v0, v6}, Landroid/graphics/drawable/BitmapDrawable;->setFilterBitmap(Z)V

    const/16 v1, 0xa5

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/BitmapDrawable;->setAlpha(I)V

    move-object v1, v0

    .line 176
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

    .line 177
    :cond_2
    const v0, 0x7f09023a

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-nez v0, :cond_7

    const/4 v0, 0x0

    move-object v1, v0

    .line 178
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

    .line 169
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

    .line 171
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

    .line 177
    :cond_7
    const-string v1, "previewPlayerArtCard"

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v0

    move-object v1, v0

    goto :goto_5

    .line 178
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
    .line 455
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
    const/4 v1, 0x0

    const/4 v3, 0x0

    .line 456
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
    .line 454
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerChrome;->sync()V

    return-void
.end method

.method protected onVisibilityChanged(Landroid/view/View;I)V
    .locals 1

    .prologue
    .line 457
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
    .line 458
    invoke-super {p0, p1}, Landroid/view/View;->onWindowVisibilityChanged(I)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->syncTask:Ljava/lang/Runnable;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->syncTask:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerChrome;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method
