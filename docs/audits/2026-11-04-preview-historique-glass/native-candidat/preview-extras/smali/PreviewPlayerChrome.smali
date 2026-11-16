.class public final Lcom/melodix/music/PreviewPlayerChrome;
.super Landroid/view/View;
.source "PreviewPlayerChrome.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/melodix/music/PreviewPlayerChrome$PressEffect;
    }
.end annotation


# instance fields
.field private appliedBackground:Landroid/graphics/drawable/Drawable;

.field private artPlaying:Ljava/lang/Boolean;

.field private chromeApplied:Z

.field private header:Landroid/view/View;

.field private headerHidden:Z

.field private likeArt:Lcom/melodix/music/PreviewPlayerLikeArt;

.field private likeControl:Landroid/view/View;

.field private observer:Landroid/view/ViewTreeObserver;

.field private panel:Landroid/view/View;

.field private panelBackground:Landroid/graphics/drawable/Drawable;

.field private playStyled:Z

.field private previousHeaderVisibility:I

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
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 63
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 43
    new-instance p1, Lcom/melodix/music/PreviewPlayerChrome$1;

    invoke-direct {p1, p0}, Lcom/melodix/music/PreviewPlayerChrome$1;-><init>(Lcom/melodix/music/PreviewPlayerChrome;)V

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerChrome;->visualTick:Ljava/lang/Runnable;

    .line 62
    new-instance p1, Lcom/melodix/music/PreviewPlayerChrome$2;

    invoke-direct {p1, p0}, Lcom/melodix/music/PreviewPlayerChrome$2;-><init>(Lcom/melodix/music/PreviewPlayerChrome;)V

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerChrome;->syncTask:Ljava/lang/Runnable;

    .line 63
    return-void
.end method

.method static synthetic access$000(Lcom/melodix/music/PreviewPlayerChrome;)Z
    .locals 0

    .line 32
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerChrome;->playerVisible()Z

    move-result p0

    return p0
.end method

.method static synthetic access$1000(Lcom/melodix/music/PreviewPlayerChrome;)Landroid/view/View;
    .locals 0

    .line 32
    iget-object p0, p0, Lcom/melodix/music/PreviewPlayerChrome;->shuffleControl:Landroid/view/View;

    return-object p0
.end method

.method static synthetic access$102(Lcom/melodix/music/PreviewPlayerChrome;Z)Z
    .locals 0

    .line 32
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerChrome;->ticking:Z

    return p1
.end method

.method static synthetic access$1100(Lcom/melodix/music/PreviewPlayerChrome;)V
    .locals 0

    .line 32
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerChrome;->sync()V

    return-void
.end method

.method static synthetic access$200(Lcom/melodix/music/PreviewPlayerChrome;)Landroid/app/Activity;
    .locals 0

    .line 32
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerChrome;->activity()Landroid/app/Activity;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$300(Lcom/melodix/music/PreviewPlayerChrome;Landroid/app/Activity;)V
    .locals 0

    .line 32
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerChrome;->updateTint(Landroid/app/Activity;)V

    return-void
.end method

.method static synthetic access$400(Lcom/melodix/music/PreviewPlayerChrome;Landroid/app/Activity;)V
    .locals 0

    .line 32
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerChrome;->breathe(Landroid/app/Activity;)V

    return-void
.end method

.method static synthetic access$500(Lcom/melodix/music/PreviewPlayerChrome;)Lcom/melodix/music/PreviewPlayerDecoration;
    .locals 0

    .line 32
    iget-object p0, p0, Lcom/melodix/music/PreviewPlayerChrome;->repeatArt:Lcom/melodix/music/PreviewPlayerDecoration;

    return-object p0
.end method

.method static synthetic access$600(Lcom/melodix/music/PreviewPlayerChrome;)Landroid/view/View;
    .locals 0

    .line 32
    iget-object p0, p0, Lcom/melodix/music/PreviewPlayerChrome;->repeatControl:Landroid/view/View;

    return-object p0
.end method

.method static synthetic access$700(Lcom/melodix/music/PreviewPlayerChrome;)Lcom/melodix/music/PreviewPlayerLikeArt;
    .locals 0

    .line 32
    iget-object p0, p0, Lcom/melodix/music/PreviewPlayerChrome;->likeArt:Lcom/melodix/music/PreviewPlayerLikeArt;

    return-object p0
.end method

.method static synthetic access$800(Lcom/melodix/music/PreviewPlayerChrome;)Landroid/view/View;
    .locals 0

    .line 32
    iget-object p0, p0, Lcom/melodix/music/PreviewPlayerChrome;->likeControl:Landroid/view/View;

    return-object p0
.end method

.method static synthetic access$900(Lcom/melodix/music/PreviewPlayerChrome;)Lcom/melodix/music/PreviewPlayerDecoration;
    .locals 0

    .line 32
    iget-object p0, p0, Lcom/melodix/music/PreviewPlayerChrome;->shuffleDot:Lcom/melodix/music/PreviewPlayerDecoration;

    return-object p0
.end method

.method private activity()Landroid/app/Activity;
    .locals 3

    .line 66
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerChrome;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 67
    const/4 v1, 0x0

    :goto_0
    const/16 v2, 0x8

    if-ge v1, v2, :cond_2

    instance-of v2, v0, Landroid/content/ContextWrapper;

    if-eqz v2, :cond_2

    .line 68
    instance-of v2, v0, Landroid/app/Activity;

    if-eqz v2, :cond_0

    check-cast v0, Landroid/app/Activity;

    return-object v0

    .line 69
    :cond_0
    move-object v2, v0

    check-cast v2, Landroid/content/ContextWrapper;

    invoke-virtual {v2}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object v2

    if-ne v2, v0, :cond_1

    goto :goto_1

    .line 67
    :cond_1
    add-int/lit8 v1, v1, 0x1

    move-object v0, v2

    goto :goto_0

    .line 71
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

    .line 88
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->chromeApplied:Z

    if-eqz v0, :cond_0

    return-void

    .line 89
    :cond_0
    const v0, 0x7f09022f

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->root:Landroid/view/View;

    const v0, 0x7f09023a

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerChrome;->panel:Landroid/view/View;

    .line 90
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerChrome;->root:Landroid/view/View;

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerChrome;->panel:Landroid/view/View;

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerChrome;->panel:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    if-nez p1, :cond_1

    goto/16 :goto_0

    .line 91
    :cond_1
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerChrome;->root:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerChrome;->rootBackground:Landroid/graphics/drawable/Drawable;

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerChrome;->panel:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerChrome;->panelBackground:Landroid/graphics/drawable/Drawable;

    .line 92
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

    .line 93
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

    .line 94
    new-instance v3, Landroid/graphics/drawable/GradientDrawable;

    sget-object v4, Landroid/graphics/drawable/GradientDrawable$Orientation;->TOP_BOTTOM:Landroid/graphics/drawable/GradientDrawable$Orientation;

    const/4 v5, 0x0

    filled-new-array {v5, v5}, [I

    move-result-object v6

    invoke-direct {v3, v4, v6}, Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable$Orientation;[I)V

    iput-object v3, p0, Lcom/melodix/music/PreviewPlayerChrome;->tintLayer:Landroid/graphics/drawable/GradientDrawable;

    .line 96
    new-instance v3, Landroid/graphics/drawable/GradientDrawable;

    sget-object v4, Landroid/graphics/drawable/GradientDrawable$Orientation;->TOP_BOTTOM:Landroid/graphics/drawable/GradientDrawable$Orientation;

    const v6, -0x4cf5f9ec

    const v7, -0xdf5f9ec

    const v8, 0x400a0614

    filled-new-array {v8, v6, v7}, [I

    move-result-object v6

    invoke-direct {v3, v4, v6}, Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable$Orientation;[I)V

    iput-object v3, p0, Lcom/melodix/music/PreviewPlayerChrome;->scrim:Landroid/graphics/drawable/GradientDrawable;

    .line 97
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

    .line 98
    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerChrome;->root:Landroid/view/View;

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerChrome;->appliedBackground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v3, v4}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerChrome;->root:Landroid/view/View;

    invoke-virtual {v3, p1, v0, v1, v2}, Landroid/view/View;->setPadding(IIII)V

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerChrome;->panel:Landroid/view/View;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->tintSource:Landroid/graphics/drawable/Drawable;

    .line 99
    iput-boolean v5, p0, Lcom/melodix/music/PreviewPlayerChrome;->chromeApplied:Z

    .line 100
    return-void

    .line 90
    :cond_2
    :goto_0
    return-void
.end method

.method private breathe(Landroid/app/Activity;)V
    .locals 4

    .line 153
    const v0, 0x7f09023e

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const v1, 0x7f09023a

    invoke-virtual {p1, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    .line 154
    if-nez p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    const-string v1, "previewPlayerArtCard"

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object p1

    .line 155
    :goto_0
    if-eqz v0, :cond_a

    if-nez p1, :cond_1

    goto/16 :goto_7

    .line 156
    :cond_1
    invoke-virtual {v0}, Landroid/view/View;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v0

    if-nez v0, :cond_2

    const-string v0, ""

    goto :goto_1

    :cond_2
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 157
    :goto_1
    const-string v1, "Mettre en pause"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-nez v1, :cond_4

    const-string v1, "Lecture demand\u00e9e"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    goto :goto_2

    :cond_3
    move v0, v2

    goto :goto_3

    :cond_4
    :goto_2
    move v0, v3

    .line 158
    :goto_3
    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->artPlaying:Ljava/lang/Boolean;

    if-eqz v1, :cond_5

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->artPlaying:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-ne v1, v0, :cond_5

    return-void

    .line 159
    :cond_5
    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->artPlaying:Ljava/lang/Boolean;

    if-nez v1, :cond_6

    move v2, v3

    :cond_6
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->artPlaying:Ljava/lang/Boolean;

    if-eqz v0, :cond_7

    const/high16 v0, 0x3f800000    # 1.0f

    goto :goto_4

    :cond_7
    const v0, 0x3f666666    # 0.9f

    .line 160
    :goto_4
    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 161
    if-nez v2, :cond_9

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1a

    if-lt v1, v2, :cond_8

    invoke-static {}, Landroid/animation/ValueAnimator;->areAnimatorsEnabled()Z

    move-result v1

    if-nez v1, :cond_8

    goto :goto_5

    .line 162
    :cond_8
    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    const-wide/16 v0, 0x1a4

    invoke-virtual {p1, v0, v1}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    new-instance v0, Landroid/view/animation/OvershootInterpolator;

    const v1, 0x3f99999a    # 1.2f

    invoke-direct {v0, v1}, Landroid/view/animation/OvershootInterpolator;-><init>(F)V

    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->start()V

    goto :goto_6

    .line 161
    :cond_9
    :goto_5
    invoke-virtual {p1, v0}, Landroid/view/View;->setScaleX(F)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setScaleY(F)V

    .line 163
    :goto_6
    return-void

    .line 155
    :cond_a
    :goto_7
    return-void
.end method

.method private static clearConstraintLimits(Landroid/view/View;)V
    .locals 6

    .line 166
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p0

    .line 167
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

    .line 168
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

    .line 167
    :cond_0
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 170
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

    .line 171
    :cond_2
    :goto_2
    return-void
.end method

.method static dominant(Landroid/graphics/Bitmap;)I
    .locals 16

    .line 115
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

    .line 116
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

    .line 117
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

    .line 118
    invoke-virtual {v0, v15, v6}, Landroid/graphics/Bitmap;->getPixel(II)I

    move-result v1

    invoke-static {v1}, Landroid/graphics/Color;->alpha(I)I

    move-result v4

    const/16 v5, 0x80

    if-ge v4, v5, :cond_1

    move v0, v3

    goto :goto_2

    .line 119
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

    .line 120
    sub-int/2addr v3, v0

    div-int/lit8 v3, v3, 0x20

    const/4 v0, 0x1

    add-int/2addr v3, v0

    .line 121
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

    .line 117
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

    .line 123
    :cond_3
    const-wide/16 v0, 0x0

    cmp-long v0, v7, v0

    if-nez v0, :cond_4

    const/4 v0, 0x0

    return v0

    .line 124
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

    .line 115
    :cond_5
    :goto_3
    const/4 v0, 0x0

    return v0
.end method

.method private dp(F)I
    .locals 1

    .line 64
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

.method private findCollapse(Landroid/view/View;)Landroid/view/View;
    .locals 2

    .line 218
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

    .line 219
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

    .line 220
    :cond_3
    const/4 p1, 0x0

    return-object p1
.end method

.method private hideHeader(Landroid/app/Activity;)V
    .locals 2

    .line 75
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->headerHidden:Z

    if-eqz v0, :cond_0

    return-void

    .line 76
    :cond_0
    const v0, 0x7f090230

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const v1, 0x7f09022f

    invoke-virtual {p1, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    .line 77
    if-eqz v0, :cond_3

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    instance-of v1, v1, Landroid/view/View;

    if-nez v1, :cond_1

    goto :goto_0

    .line 78
    :cond_1
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 79
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    if-eq v1, p1, :cond_2

    return-void

    .line 80
    :cond_2
    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->header:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result p1

    iput p1, p0, Lcom/melodix/music/PreviewPlayerChrome;->previousHeaderVisibility:I

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerChrome;->headerHidden:Z

    .line 81
    const/16 p1, 0x8

    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 82
    return-void

    .line 77
    :cond_3
    :goto_0
    return-void
.end method

.method private landscape(Landroid/app/Activity;)V
    .locals 7

    .line 182
    const v0, 0x7f09023a

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    instance-of v0, p1, Landroid/widget/ScrollView;

    if-nez v0, :cond_0

    return-void

    .line 183
    :cond_0
    const-string v0, "previewPlayerArtFrame"

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v0

    const-string v1, "previewPlayerArtCard"

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v1

    .line 184
    if-eqz v0, :cond_d

    if-eqz v1, :cond_d

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    instance-of v2, v2, Landroid/widget/LinearLayout;

    if-nez v2, :cond_1

    goto/16 :goto_2

    .line 185
    :cond_1
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    check-cast v2, Landroid/widget/LinearLayout;

    .line 186
    invoke-virtual {v2}, Landroid/widget/LinearLayout;->getOrientation()I

    move-result v3

    if-nez v3, :cond_c

    invoke-virtual {v2}, Landroid/widget/LinearLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    instance-of v3, v3, Landroid/widget/LinearLayout;

    if-nez v3, :cond_2

    goto/16 :goto_1

    .line 187
    :cond_2
    move-object v3, p1

    check-cast v3, Landroid/widget/ScrollView;

    invoke-virtual {v3}, Landroid/widget/ScrollView;->isFillViewport()Z

    move-result v4

    if-nez v4, :cond_3

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Landroid/widget/ScrollView;->setFillViewport(Z)V

    .line 188
    :cond_3
    invoke-virtual {v2}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    .line 189
    instance-of v4, v3, Landroid/widget/LinearLayout$LayoutParams;

    if-eqz v4, :cond_4

    check-cast v3, Landroid/widget/LinearLayout$LayoutParams;

    iget v4, v3, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    const/high16 v5, 0x3f800000    # 1.0f

    cmpl-float v4, v4, v5

    if-eqz v4, :cond_4

    .line 190
    const/4 v4, 0x0

    iput v4, v3, Landroid/widget/LinearLayout$LayoutParams;->height:I

    iput v5, v3, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    const/16 v3, 0x10

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 192
    :cond_4
    invoke-virtual {p1}, Landroid/view/View;->getPaddingLeft()I

    move-result v3

    const/high16 v4, 0x42600000    # 56.0f

    invoke-direct {p0, v4}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v5

    if-eq v3, v5, :cond_5

    invoke-direct {p0, v4}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v3

    invoke-virtual {p1}, Landroid/view/View;->getPaddingTop()I

    move-result v5

    invoke-direct {p0, v4}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v4

    invoke-virtual {p1}, Landroid/view/View;->getPaddingBottom()I

    move-result v6

    invoke-virtual {p1, v3, v5, v4, v6}, Landroid/view/View;->setPadding(IIII)V

    .line 193
    :cond_5
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    .line 194
    instance-of v3, p1, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v3, :cond_6

    move-object v3, p1

    check-cast v3, Landroid/view/ViewGroup$MarginLayoutParams;

    iget v4, v3, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    const/high16 v5, 0x42400000    # 48.0f

    invoke-direct {p0, v5}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v6

    if-eq v4, v6, :cond_6

    invoke-direct {p0, v5}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v4

    iput v4, v3, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    invoke-virtual {v0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 195
    :cond_6
    invoke-virtual {v2}, Landroid/widget/LinearLayout;->getHeight()I

    move-result p1

    const/high16 v2, 0x42800000    # 64.0f

    invoke-direct {p0, v2}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v2

    sub-int/2addr p1, v2

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v2

    .line 196
    if-lez p1, :cond_b

    if-gtz v2, :cond_7

    goto :goto_0

    .line 197
    :cond_7
    const/high16 v3, 0x42f00000    # 120.0f

    invoke-direct {p0, v3}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v3

    const/high16 v4, 0x44020000    # 520.0f

    invoke-direct {p0, v4}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v4

    invoke-static {p1, v4}, Ljava/lang/Math;->min(II)I

    move-result p1

    invoke-static {v2, p1}, Ljava/lang/Math;->min(II)I

    move-result p1

    invoke-static {v3, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    .line 198
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    .line 199
    iget v4, v2, Landroid/view/ViewGroup$LayoutParams;->width:I

    if-ne v4, p1, :cond_8

    iget v4, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-eq v4, p1, :cond_9

    :cond_8
    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerChrome;->clearConstraintLimits(Landroid/view/View;)V

    iput p1, v2, Landroid/view/ViewGroup$LayoutParams;->width:I

    iput p1, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {v1, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 200
    :cond_9
    iget v1, v3, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-eq v1, p1, :cond_a

    iput p1, v3, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {v0, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 201
    :cond_a
    return-void

    .line 196
    :cond_b
    :goto_0
    return-void

    .line 186
    :cond_c
    :goto_1
    return-void

    .line 184
    :cond_d
    :goto_2
    return-void
.end method

.method private playerVisible()Z
    .locals 1

    .line 73
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

.method private restoreBackground()V
    .locals 6

    .line 102
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->chromeApplied:Z

    if-nez v0, :cond_0

    return-void

    .line 103
    :cond_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->root:Landroid/view/View;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->root:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->appliedBackground:Landroid/graphics/drawable/Drawable;

    if-ne v0, v1, :cond_1

    .line 104
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

    .line 105
    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerChrome;->root:Landroid/view/View;

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerChrome;->rootBackground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v4, v5}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerChrome;->root:Landroid/view/View;

    invoke-virtual {v4, v0, v1, v2, v3}, Landroid/view/View;->setPadding(IIII)V

    .line 107
    :cond_1
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->panel:Landroid/view/View;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->panel:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->panel:Landroid/view/View;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->panelBackground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 108
    :cond_2
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->root:Landroid/view/View;

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->panel:Landroid/view/View;

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->rootBackground:Landroid/graphics/drawable/Drawable;

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->panelBackground:Landroid/graphics/drawable/Drawable;

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->appliedBackground:Landroid/graphics/drawable/Drawable;

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->tintLayer:Landroid/graphics/drawable/GradientDrawable;

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->scrim:Landroid/graphics/drawable/GradientDrawable;

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->tintSource:Landroid/graphics/drawable/Drawable;

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->artPlaying:Ljava/lang/Boolean;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->chromeApplied:Z

    .line 109
    return-void
.end method

.method private restoreHeader()V
    .locals 2

    .line 84
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->headerHidden:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->header:Landroid/view/View;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->header:Landroid/view/View;

    iget v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->previousHeaderVisibility:I

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 85
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->header:Landroid/view/View;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->headerHidden:Z

    .line 86
    return-void
.end method

.method private setupCosmetics(Landroid/app/Activity;)V
    .locals 18

    .line 223
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-boolean v2, v0, Lcom/melodix/music/PreviewPlayerChrome;->setupDone:Z

    if-eqz v2, :cond_0

    return-void

    .line 224
    :cond_0
    const v2, 0x7f09023a

    invoke-virtual {v1, v2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    instance-of v3, v2, Landroid/view/ViewGroup;

    if-nez v3, :cond_1

    return-void

    .line 225
    :cond_1
    invoke-direct {v0, v2}, Lcom/melodix/music/PreviewPlayerChrome;->findCollapse(Landroid/view/View;)Landroid/view/View;

    move-result-object v3

    .line 226
    const-string v4, "repeat"

    invoke-virtual {v2, v4}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v4

    iput-object v4, v0, Lcom/melodix/music/PreviewPlayerChrome;->repeatControl:Landroid/view/View;

    const-string v4, "shuffle"

    invoke-virtual {v2, v4}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v4

    iput-object v4, v0, Lcom/melodix/music/PreviewPlayerChrome;->shuffleControl:Landroid/view/View;

    .line 227
    const-string v4, "like"

    invoke-virtual {v2, v4}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v4

    const-string v5, "previewPlayerTiles"

    invoke-virtual {v2, v5}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v5

    .line 228
    const v6, 0x7f09023f

    invoke-virtual {v1, v6}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v6

    const v7, 0x7f090240

    invoke-virtual {v1, v7}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v7

    const v8, 0x7f09023e

    invoke-virtual {v1, v8}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v8

    .line 229
    if-eqz v3, :cond_b

    iget-object v9, v0, Lcom/melodix/music/PreviewPlayerChrome;->repeatControl:Landroid/view/View;

    instance-of v9, v9, Landroid/widget/ImageView;

    if-eqz v9, :cond_b

    iget-object v9, v0, Lcom/melodix/music/PreviewPlayerChrome;->shuffleControl:Landroid/view/View;

    if-eqz v9, :cond_b

    if-eqz v4, :cond_b

    if-eqz v5, :cond_b

    if-eqz v8, :cond_b

    if-eqz v6, :cond_b

    if-nez v7, :cond_2

    goto/16 :goto_3

    .line 230
    :cond_2
    move-object v9, v2

    check-cast v9, Landroid/view/ViewGroup;

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    invoke-virtual {v9, v10}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 231
    invoke-virtual/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerChrome;->getParent()Landroid/view/ViewParent;

    move-result-object v9

    .line 232
    instance-of v11, v9, Landroid/view/ViewGroup;

    if-eqz v11, :cond_3

    check-cast v9, Landroid/view/ViewGroup;

    invoke-virtual {v9, v10}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    invoke-virtual {v9, v10}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 233
    :cond_3
    const-string v9, "previewPlayerArtCard"

    invoke-virtual {v2, v9}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v9

    const-string v11, "previewPlayerArtFrame"

    invoke-virtual {v2, v11}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v2

    .line 234
    instance-of v11, v2, Landroid/view/ViewGroup;

    if-eqz v11, :cond_4

    check-cast v2, Landroid/view/ViewGroup;

    invoke-virtual {v2, v10}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    invoke-virtual {v2, v10}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 235
    :cond_4
    if-eqz v9, :cond_5

    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v11, 0x1c

    if-lt v2, v11, :cond_5

    const v2, -0x1fb762

    invoke-virtual {v9, v2}, Landroid/view/View;->setOutlineSpotShadowColor(I)V

    invoke-virtual {v9, v2}, Landroid/view/View;->setOutlineAmbientShadowColor(I)V

    .line 236
    :cond_5
    instance-of v2, v4, Landroid/widget/ImageView;

    const/4 v9, 0x0

    const/4 v11, 0x1

    if-eqz v2, :cond_6

    .line 237
    iput-object v4, v0, Lcom/melodix/music/PreviewPlayerChrome;->likeControl:Landroid/view/View;

    .line 238
    new-instance v2, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v2}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    invoke-virtual {v2, v11}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    const v12, 0x17ffffff

    invoke-virtual {v2, v12}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    const/high16 v12, 0x3f800000    # 1.0f

    invoke-direct {v0, v12}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v12

    const v13, 0x24ffffff

    invoke-virtual {v2, v12, v13}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 239
    invoke-virtual {v4, v9}, Landroid/view/View;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    new-instance v12, Landroid/graphics/drawable/RippleDrawable;

    const v13, 0x44ffffff    # 2047.9999f

    invoke-static {v13}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v13

    invoke-direct {v12, v13, v2, v9}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v4, v12}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 240
    move-object v2, v4

    check-cast v2, Landroid/widget/ImageView;

    invoke-virtual {v2, v10}, Landroid/widget/ImageView;->setImageAlpha(I)V

    new-instance v2, Lcom/melodix/music/PreviewPlayerLikeArt;

    invoke-direct {v2, v4}, Lcom/melodix/music/PreviewPlayerLikeArt;-><init>(Landroid/view/View;)V

    iput-object v2, v0, Lcom/melodix/music/PreviewPlayerChrome;->likeArt:Lcom/melodix/music/PreviewPlayerLikeArt;

    invoke-virtual {v4}, Landroid/view/View;->getOverlay()Landroid/view/ViewOverlay;

    move-result-object v2

    iget-object v12, v0, Lcom/melodix/music/PreviewPlayerChrome;->likeArt:Lcom/melodix/music/PreviewPlayerLikeArt;

    invoke-virtual {v2, v12}, Landroid/view/ViewOverlay;->add(Landroid/graphics/drawable/Drawable;)V

    .line 242
    :cond_6
    iget-object v2, v0, Lcom/melodix/music/PreviewPlayerChrome;->repeatControl:Landroid/view/View;

    check-cast v2, Landroid/widget/ImageView;

    invoke-virtual {v2, v10}, Landroid/widget/ImageView;->setImageAlpha(I)V

    .line 243
    new-instance v2, Lcom/melodix/music/PreviewPlayerDecoration;

    iget-object v12, v0, Lcom/melodix/music/PreviewPlayerChrome;->repeatControl:Landroid/view/View;

    invoke-direct {v2, v12, v11}, Lcom/melodix/music/PreviewPlayerDecoration;-><init>(Landroid/view/View;Z)V

    iput-object v2, v0, Lcom/melodix/music/PreviewPlayerChrome;->repeatArt:Lcom/melodix/music/PreviewPlayerDecoration;

    iget-object v2, v0, Lcom/melodix/music/PreviewPlayerChrome;->repeatControl:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getOverlay()Landroid/view/ViewOverlay;

    move-result-object v2

    iget-object v12, v0, Lcom/melodix/music/PreviewPlayerChrome;->repeatArt:Lcom/melodix/music/PreviewPlayerDecoration;

    invoke-virtual {v2, v12}, Landroid/view/ViewOverlay;->add(Landroid/graphics/drawable/Drawable;)V

    .line 244
    new-instance v2, Lcom/melodix/music/PreviewPlayerDecoration;

    iget-object v12, v0, Lcom/melodix/music/PreviewPlayerChrome;->shuffleControl:Landroid/view/View;

    invoke-direct {v2, v12, v10}, Lcom/melodix/music/PreviewPlayerDecoration;-><init>(Landroid/view/View;Z)V

    iput-object v2, v0, Lcom/melodix/music/PreviewPlayerChrome;->shuffleDot:Lcom/melodix/music/PreviewPlayerDecoration;

    iget-object v2, v0, Lcom/melodix/music/PreviewPlayerChrome;->shuffleControl:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getOverlay()Landroid/view/ViewOverlay;

    move-result-object v2

    iget-object v12, v0, Lcom/melodix/music/PreviewPlayerChrome;->shuffleDot:Lcom/melodix/music/PreviewPlayerDecoration;

    invoke-virtual {v2, v12}, Landroid/view/ViewOverlay;->add(Landroid/graphics/drawable/Drawable;)V

    .line 245
    const/4 v2, 0x4

    new-array v12, v2, [Landroid/view/View;

    aput-object v3, v12, v10

    aput-object v6, v12, v11

    const/4 v3, 0x2

    aput-object v7, v12, v3

    const/4 v6, 0x3

    aput-object v8, v12, v6

    move v7, v10

    :goto_0
    if-ge v7, v2, :cond_7

    aget-object v8, v12, v7

    new-instance v13, Lcom/melodix/music/PreviewPlayerChrome$PressEffect;

    invoke-direct {v13, v11}, Lcom/melodix/music/PreviewPlayerChrome$PressEffect;-><init>(Z)V

    invoke-virtual {v8, v13}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 246
    :cond_7
    iget-object v2, v0, Lcom/melodix/music/PreviewPlayerChrome;->repeatControl:Landroid/view/View;

    iget-object v7, v0, Lcom/melodix/music/PreviewPlayerChrome;->shuffleControl:Landroid/view/View;

    new-array v8, v6, [Landroid/view/View;

    aput-object v2, v8, v10

    aput-object v7, v8, v11

    aput-object v4, v8, v3

    move v2, v10

    :goto_1
    if-ge v2, v6, :cond_8

    aget-object v4, v8, v2

    new-instance v7, Lcom/melodix/music/PreviewPlayerChrome$PressEffect;

    invoke-direct {v7, v10}, Lcom/melodix/music/PreviewPlayerChrome$PressEffect;-><init>(Z)V

    invoke-virtual {v4, v7}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 247
    :cond_8
    instance-of v2, v5, Landroid/view/ViewGroup;

    if-eqz v2, :cond_9

    check-cast v5, Landroid/view/ViewGroup;

    move v2, v10

    :goto_2
    invoke-virtual {v5}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v4

    if-ge v2, v4, :cond_9

    invoke-virtual {v5, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    new-instance v6, Lcom/melodix/music/PreviewPlayerChrome$PressEffect;

    invoke-direct {v6, v10}, Lcom/melodix/music/PreviewPlayerChrome$PressEffect;-><init>(Z)V

    invoke-virtual {v4, v6}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 248
    :cond_9
    const v2, 0x7f09023d

    invoke-virtual {v1, v2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 249
    instance-of v2, v1, Landroid/widget/SeekBar;

    if-eqz v2, :cond_a

    .line 250
    check-cast v1, Landroid/widget/SeekBar;

    .line 251
    new-instance v2, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v2}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    invoke-virtual {v2, v11}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    const v4, 0x447b3fe4

    invoke-virtual {v2, v4}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    const/high16 v4, 0x41c00000    # 24.0f

    invoke-direct {v0, v4}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v5

    invoke-direct {v0, v4}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v4

    invoke-virtual {v2, v5, v4}, Landroid/graphics/drawable/GradientDrawable;->setSize(II)V

    .line 252
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

    .line 253
    new-instance v5, Landroid/graphics/drawable/LayerDrawable;

    new-array v3, v3, [Landroid/graphics/drawable/Drawable;

    aput-object v2, v3, v10

    aput-object v4, v3, v11

    invoke-direct {v5, v3}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    const/high16 v2, 0x40800000    # 4.0f

    invoke-direct {v0, v2}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v14

    invoke-direct {v0, v2}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v15

    invoke-direct {v0, v2}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v16

    invoke-direct {v0, v2}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v17

    const/4 v13, 0x1

    move-object v12, v5

    invoke-virtual/range {v12 .. v17}, Landroid/graphics/drawable/LayerDrawable;->setLayerInset(IIIII)V

    .line 254
    invoke-virtual {v1, v9}, Landroid/widget/SeekBar;->setThumbTintList(Landroid/content/res/ColorStateList;)V

    invoke-virtual {v1, v5}, Landroid/widget/SeekBar;->setThumb(Landroid/graphics/drawable/Drawable;)V

    const/high16 v2, 0x41400000    # 12.0f

    invoke-direct {v0, v2}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v3

    invoke-virtual {v1, v3}, Landroid/widget/SeekBar;->setThumbOffset(I)V

    .line 255
    invoke-direct {v0, v2}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v3

    invoke-virtual {v1}, Landroid/widget/SeekBar;->getPaddingTop()I

    move-result v4

    invoke-direct {v0, v2}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v2

    invoke-virtual {v1}, Landroid/widget/SeekBar;->getPaddingBottom()I

    move-result v5

    invoke-virtual {v1, v3, v4, v2, v5}, Landroid/widget/SeekBar;->setPadding(IIII)V

    .line 256
    invoke-virtual {v1}, Landroid/widget/SeekBar;->getProgressDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 257
    instance-of v2, v1, Landroid/graphics/drawable/LayerDrawable;

    if-eqz v2, :cond_a

    .line 258
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    check-cast v1, Landroid/graphics/drawable/LayerDrawable;

    .line 259
    const/high16 v2, 0x1020000

    invoke-virtual {v1, v2}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 260
    instance-of v2, v1, Landroid/graphics/drawable/GradientDrawable;

    if-eqz v2, :cond_a

    check-cast v1, Landroid/graphics/drawable/GradientDrawable;

    const v2, 0x55ffffff    # 3.518437E13f

    invoke-virtual {v1, v2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 263
    :cond_a
    iput-boolean v11, v0, Lcom/melodix/music/PreviewPlayerChrome;->setupDone:Z

    .line 264
    return-void

    .line 229
    :cond_b
    :goto_3
    return-void
.end method

.method static shrink(Landroid/graphics/drawable/Drawable;I)Landroid/graphics/Bitmap;
    .locals 4

    .line 128
    const/4 v0, 0x0

    if-nez p0, :cond_0

    return-object v0

    .line 130
    :cond_0
    :try_start_0
    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {p1, p1, v1}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 131
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

    .line 132
    return-object v1

    .line 133
    :catch_0
    move-exception p0

    return-object v0
.end method

.method private sizeArtwork(Landroid/app/Activity;)V
    .locals 8

    .line 275
    const v0, 0x7f09023a

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerChrome;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    .line 276
    if-eqz p1, :cond_d

    instance-of v1, v0, Landroid/view/ViewGroup;

    if-nez v1, :cond_0

    goto/16 :goto_4

    .line 277
    :cond_0
    check-cast v0, Landroid/view/ViewGroup;

    .line 278
    const-string v1, "previewPlayerArtFrame"

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v1

    const-string v2, "previewPlayerArtCard"

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v2

    .line 279
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

    .line 280
    :cond_1
    nop

    .line 281
    const/4 v3, 0x0

    move v4, v3

    :goto_0
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v5

    if-ge v3, v5, :cond_4

    .line 282
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    .line 283
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

    .line 284
    :cond_2
    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    invoke-virtual {v5}, Landroid/view/View;->getMeasuredHeight()I

    move-result v5

    add-int/2addr v4, v5

    .line 285
    instance-of v5, v6, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v5, :cond_3

    check-cast v6, Landroid/view/ViewGroup$MarginLayoutParams;

    iget v5, v6, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    iget v6, v6, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    add-int/2addr v5, v6

    add-int/2addr v4, v5

    .line 281
    :cond_3
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 287
    :cond_4
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    .line 288
    instance-of v3, v0, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v3, :cond_5

    move-object v3, v0

    check-cast v3, Landroid/view/ViewGroup$MarginLayoutParams;

    iget v5, v3, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    iget v3, v3, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    add-int/2addr v5, v3

    add-int/2addr v4, v5

    .line 289
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

    .line 290
    const/high16 p1, 0x439f0000    # 318.0f

    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result p1

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v4

    invoke-static {p1, v4}, Ljava/lang/Math;->min(II)I

    move-result p1

    .line 291
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

    .line 292
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

    .line 293
    :goto_2
    if-gtz p1, :cond_8

    return-void

    .line 294
    :cond_8
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    .line 295
    iget v4, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-eq v4, p1, :cond_9

    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 296
    :cond_9
    iget v0, v3, Landroid/view/ViewGroup$LayoutParams;->width:I

    if-ne v0, p1, :cond_a

    iget v0, v3, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-eq v0, p1, :cond_b

    :cond_a
    iput p1, v3, Landroid/view/ViewGroup$LayoutParams;->width:I

    iput p1, v3, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {v2, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 297
    :cond_b
    return-void

    .line 279
    :cond_c
    :goto_3
    return-void

    .line 276
    :cond_d
    :goto_4
    return-void
.end method

.method private sizeSkips(Landroid/app/Activity;)V
    .locals 7

    .line 174
    const v0, 0x7f09023f

    const v1, 0x7f090240

    filled-new-array {v0, v1}, [I

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    const/4 v2, 0x2

    if-ge v1, v2, :cond_3

    aget v3, v0, v1

    .line 175
    invoke-virtual {p1, v3}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    instance-of v4, v3, Landroid/widget/ImageView;

    if-eqz v4, :cond_2

    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    move-result v4

    if-gtz v4, :cond_0

    goto :goto_1

    .line 176
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

    .line 177
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

    .line 174
    :cond_2
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 179
    :cond_3
    return-void
.end method

.method private stylePlay(Landroid/app/Activity;)V
    .locals 7

    .line 266
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->playStyled:Z

    if-eqz v0, :cond_0

    return-void

    .line 267
    :cond_0
    const v0, 0x7f09023e

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    if-nez p1, :cond_1

    return-void

    .line 268
    :cond_1
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    sget-object v1, Landroid/graphics/drawable/GradientDrawable$Orientation;->BR_TL:Landroid/graphics/drawable/GradientDrawable$Orientation;

    const v2, -0x84c01c

    const v3, -0x1fb762

    filled-new-array {v2, v3}, [I

    move-result-object v4

    invoke-direct {v0, v1, v4}, Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable$Orientation;[I)V

    .line 269
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    .line 270
    new-instance v4, Landroid/graphics/drawable/RippleDrawable;

    const v5, 0x44ffffff    # 2047.9999f

    invoke-static {v5}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v5

    const/4 v6, 0x0

    invoke-direct {v4, v5, v0, v6}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p1, v4}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 271
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x1c

    if-lt v0, v4, :cond_2

    invoke-virtual {p1, v3}, Landroid/view/View;->setOutlineSpotShadowColor(I)V

    invoke-virtual {p1, v2}, Landroid/view/View;->setOutlineAmbientShadowColor(I)V

    .line 272
    :cond_2
    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->playStyled:Z

    .line 273
    return-void
.end method

.method private sync()V
    .locals 6

    .line 299
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerChrome;->playerVisible()Z

    move-result v0

    const/high16 v1, 0x3f800000    # 1.0f

    const/4 v2, 0x0

    if-nez v0, :cond_2

    .line 300
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->wasVisible:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerChrome;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v0, v0, Landroid/view/View;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerChrome;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/ViewPropertyAnimator;->cancel()V

    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    invoke-virtual {v0, v2}, Landroid/view/View;->setTranslationY(F)V

    .line 301
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->wasVisible:Z

    .line 302
    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->ticking:Z

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->visualTick:Ljava/lang/Runnable;

    invoke-virtual {p0, v1}, Lcom/melodix/music/PreviewPlayerChrome;->removeCallbacks(Ljava/lang/Runnable;)Z

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->ticking:Z

    :cond_1
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerChrome;->restoreHeader()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerChrome;->restoreBackground()V

    return-void

    .line 304
    :cond_2
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerChrome;->activity()Landroid/app/Activity;

    move-result-object v0

    if-nez v0, :cond_3

    return-void

    .line 305
    :cond_3
    iget-boolean v3, p0, Lcom/melodix/music/PreviewPlayerChrome;->wasVisible:Z

    const/4 v4, 0x1

    if-nez v3, :cond_5

    .line 306
    iput-boolean v4, p0, Lcom/melodix/music/PreviewPlayerChrome;->wasVisible:Z

    .line 307
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerChrome;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    instance-of v3, v3, Landroid/view/View;

    if-eqz v3, :cond_5

    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x1a

    if-lt v3, v5, :cond_4

    invoke-static {}, Landroid/animation/ValueAnimator;->areAnimatorsEnabled()Z

    move-result v3

    if-eqz v3, :cond_5

    .line 308
    :cond_4
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerChrome;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    invoke-virtual {v3, v2}, Landroid/view/View;->setAlpha(F)V

    const/high16 v5, 0x40c00000    # 6.0f

    invoke-direct {p0, v5}, Lcom/melodix/music/PreviewPlayerChrome;->dp(F)I

    move-result v5

    int-to-float v5, v5

    invoke-virtual {v3, v5}, Landroid/view/View;->setTranslationY(F)V

    .line 309
    invoke-virtual {v3}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v3

    invoke-virtual {v3, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    const-wide/16 v2, 0xfa

    invoke-virtual {v1, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 312
    :cond_5
    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerChrome;->hideHeader(Landroid/app/Activity;)V

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerChrome;->applyBackground(Landroid/app/Activity;)V

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerChrome;->stylePlay(Landroid/app/Activity;)V

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerChrome;->sizeArtwork(Landroid/app/Activity;)V

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerChrome;->landscape(Landroid/app/Activity;)V

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerChrome;->sizeSkips(Landroid/app/Activity;)V

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerChrome;->setupCosmetics(Landroid/app/Activity;)V

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerChrome;->updateTint(Landroid/app/Activity;)V

    .line 313
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->setupDone:Z

    if-eqz v0, :cond_6

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->ticking:Z

    if-nez v0, :cond_6

    iput-boolean v4, p0, Lcom/melodix/music/PreviewPlayerChrome;->ticking:Z

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->visualTick:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerChrome;->post(Ljava/lang/Runnable;)Z

    .line 314
    :cond_6
    return-void
.end method

.method private updateTint(Landroid/app/Activity;)V
    .locals 9

    .line 136
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->tintLayer:Landroid/graphics/drawable/GradientDrawable;

    if-nez v0, :cond_0

    return-void

    .line 137
    :cond_0
    const v0, 0x7f090245

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    instance-of v1, v0, Landroid/widget/ImageView;

    if-nez v1, :cond_1

    return-void

    .line 138
    :cond_1
    check-cast v0, Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome;->tintSource:Landroid/graphics/drawable/Drawable;

    if-ne v0, v1, :cond_2

    return-void

    :cond_2
    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->tintSource:Landroid/graphics/drawable/Drawable;

    .line 139
    const/16 v1, 0xc

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewPlayerChrome;->shrink(Landroid/graphics/drawable/Drawable;I)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 140
    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerChrome;->dominant(Landroid/graphics/Bitmap;)I

    move-result v1

    .line 142
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerChrome;->tintLayer:Landroid/graphics/drawable/GradientDrawable;

    const/4 v3, 0x2

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-nez v1, :cond_3

    new-array v3, v3, [I

    aput v5, v3, v5

    aput v5, v3, v4

    goto :goto_0

    :cond_3
    const/4 v6, 0x3

    new-array v6, v6, [I

    const v7, 0xffffff

    and-int/2addr v7, v1

    const/high16 v8, 0x4d000000    # 1.3421773E8f

    or-int/2addr v8, v7

    aput v8, v6, v5

    const/high16 v8, 0x14000000

    or-int/2addr v7, v8

    aput v7, v6, v4

    aput v5, v6, v3

    move-object v3, v6

    :goto_0
    invoke-virtual {v2, v3}, Landroid/graphics/drawable/GradientDrawable;->setColors([I)V

    .line 144
    new-instance v2, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v2, v5}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 145
    const/4 v3, 0x5

    invoke-static {v0, v3}, Lcom/melodix/music/PreviewPlayerChrome;->shrink(Landroid/graphics/drawable/Drawable;I)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 146
    if-eqz v0, :cond_4

    new-instance v2, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerChrome;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-direct {v2, v3, v0}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    invoke-virtual {v2, v4}, Landroid/graphics/drawable/BitmapDrawable;->setFilterBitmap(Z)V

    const/16 v0, 0xa5

    invoke-virtual {v2, v0}, Landroid/graphics/drawable/BitmapDrawable;->setAlpha(I)V

    .line 147
    :cond_4
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->appliedBackground:Landroid/graphics/drawable/Drawable;

    instance-of v0, v0, Landroid/graphics/drawable/LayerDrawable;

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->appliedBackground:Landroid/graphics/drawable/Drawable;

    check-cast v0, Landroid/graphics/drawable/LayerDrawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/LayerDrawable;->getNumberOfLayers()I

    move-result v0

    const/4 v3, 0x4

    if-ne v0, v3, :cond_5

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->appliedBackground:Landroid/graphics/drawable/Drawable;

    check-cast v0, Landroid/graphics/drawable/LayerDrawable;

    invoke-virtual {v0, v4, v2}, Landroid/graphics/drawable/LayerDrawable;->setDrawable(ILandroid/graphics/drawable/Drawable;)V

    .line 148
    :cond_5
    const v0, 0x7f09023a

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    if-nez p1, :cond_6

    const/4 p1, 0x0

    goto :goto_1

    :cond_6
    const-string v0, "previewPlayerArtCard"

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object p1

    .line 149
    :goto_1
    if-eqz p1, :cond_8

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1c

    if-lt v0, v2, :cond_8

    if-nez v1, :cond_7

    const v0, -0x1fb762

    goto :goto_2

    :cond_7
    const/high16 v0, -0x1000000

    or-int/2addr v0, v1

    :goto_2
    invoke-virtual {p1, v0}, Landroid/view/View;->setOutlineSpotShadowColor(I)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOutlineAmbientShadowColor(I)V

    .line 150
    :cond_8
    return-void
.end method


# virtual methods
.method protected onAttachedToWindow()V
    .locals 1

    .line 316
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
    .locals 1

    .line 317
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->observer:Landroid/view/ViewTreeObserver;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->observer:Landroid/view/ViewTreeObserver;

    invoke-virtual {v0}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->observer:Landroid/view/ViewTreeObserver;

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->observer:Landroid/view/ViewTreeObserver;

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->syncTask:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerChrome;->removeCallbacks(Ljava/lang/Runnable;)Z

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->visualTick:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerChrome;->removeCallbacks(Ljava/lang/Runnable;)Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerChrome;->ticking:Z

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerChrome;->restoreHeader()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerChrome;->restoreBackground()V

    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    return-void
.end method

.method public onGlobalLayout()V
    .locals 0

    .line 315
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerChrome;->sync()V

    return-void
.end method

.method protected onVisibilityChanged(Landroid/view/View;I)V
    .locals 0

    .line 318
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

    .line 319
    invoke-super {p0, p1}, Landroid/view/View;->onWindowVisibilityChanged(I)V

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerChrome;->syncTask:Ljava/lang/Runnable;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerChrome;->syncTask:Ljava/lang/Runnable;

    invoke-virtual {p0, p1}, Lcom/melodix/music/PreviewPlayerChrome;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method
