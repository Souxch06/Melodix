.class public final Lcom/melodix/music/PreviewUiRestyle;
.super Landroid/view/View;
.source "PreviewUiRestyle.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;


# static fields
.field private static final LILAC:I = 0x73ffffff

.field private static final SECONDARY:I = -0x59000001

.field private static final SHADOW:I = -0x1000000

.field private static final WHITE:I = -0x50506


# instance fields
.field private final done:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/view/View;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private entered:I

.field private final glassRows:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/view/View;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private lastScreen:Landroid/view/View;

.field private observer:Landroid/view/ViewTreeObserver;

.field private final pass:Ljava/lang/Runnable;

.field private scheduled:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 37
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 32
    new-instance p1, Ljava/util/WeakHashMap;

    invoke-direct {p1}, Ljava/util/WeakHashMap;-><init>()V

    iput-object p1, p0, Lcom/melodix/music/PreviewUiRestyle;->done:Ljava/util/WeakHashMap;

    .line 35
    new-instance p1, Lcom/melodix/music/PreviewUiRestyle$1;

    invoke-direct {p1, p0}, Lcom/melodix/music/PreviewUiRestyle$1;-><init>(Lcom/melodix/music/PreviewUiRestyle;)V

    iput-object p1, p0, Lcom/melodix/music/PreviewUiRestyle;->pass:Ljava/lang/Runnable;

    .line 185
    new-instance p1, Ljava/util/WeakHashMap;

    invoke-direct {p1}, Ljava/util/WeakHashMap;-><init>()V

    iput-object p1, p0, Lcom/melodix/music/PreviewUiRestyle;->glassRows:Ljava/util/WeakHashMap;

    .line 37
    return-void
.end method

.method static synthetic access$002(Lcom/melodix/music/PreviewUiRestyle;Z)Z
    .locals 0

    .line 30
    iput-boolean p1, p0, Lcom/melodix/music/PreviewUiRestyle;->scheduled:Z

    return p1
.end method

.method static synthetic access$100(Lcom/melodix/music/PreviewUiRestyle;)V
    .locals 0

    .line 30
    invoke-direct {p0}, Lcom/melodix/music/PreviewUiRestyle;->restyle()V

    return-void
.end method

.method private activity()Landroid/app/Activity;
    .locals 3

    .line 40
    invoke-virtual {p0}, Lcom/melodix/music/PreviewUiRestyle;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 41
    const/4 v1, 0x0

    :goto_0
    const/16 v2, 0x8

    if-ge v1, v2, :cond_2

    instance-of v2, v0, Landroid/content/ContextWrapper;

    if-eqz v2, :cond_2

    .line 42
    instance-of v2, v0, Landroid/app/Activity;

    if-eqz v2, :cond_0

    check-cast v0, Landroid/app/Activity;

    return-object v0

    .line 43
    :cond_0
    move-object v2, v0

    check-cast v2, Landroid/content/ContextWrapper;

    invoke-virtual {v2}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object v2

    if-ne v2, v0, :cond_1

    goto :goto_1

    .line 41
    :cond_1
    add-int/lit8 v1, v1, 0x1

    move-object v0, v2

    goto :goto_0

    .line 45
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

.method private dp(F)I
    .locals 1

    .line 38
    invoke-virtual {p0}, Lcom/melodix/music/PreviewUiRestyle;->getResources()Landroid/content/res/Resources;

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

.method private field(Landroid/widget/EditText;)V
    .locals 4

    .line 144
    const/high16 v0, 0x41c00000    # 24.0f

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewUiRestyle;->dp(F)I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-direct {p0, v1}, Lcom/melodix/music/PreviewUiRestyle;->dp(F)I

    move-result v1

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewUiRestyle;->glass(FI)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 145
    invoke-virtual {p1}, Landroid/widget/EditText;->getPaddingLeft()I

    move-result v0

    const/high16 v1, 0x41800000    # 16.0f

    invoke-direct {p0, v1}, Lcom/melodix/music/PreviewUiRestyle;->dp(F)I

    move-result v2

    invoke-static {v0, v2}, Ljava/lang/Math;->max(II)I

    move-result v0

    invoke-virtual {p1}, Landroid/widget/EditText;->getPaddingTop()I

    move-result v2

    invoke-virtual {p1}, Landroid/widget/EditText;->getPaddingRight()I

    move-result v3

    invoke-direct {p0, v1}, Lcom/melodix/music/PreviewUiRestyle;->dp(F)I

    move-result v1

    invoke-static {v3, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    invoke-virtual {p1}, Landroid/widget/EditText;->getPaddingBottom()I

    move-result v3

    invoke-virtual {p1, v0, v2, v1, v3}, Landroid/widget/EditText;->setPadding(IIII)V

    .line 146
    const v0, -0x50506

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setTextColor(I)V

    const v0, 0x73ffffff

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setHintTextColor(I)V

    .line 147
    return-void
.end method

.method static flat(F)Landroid/graphics/drawable/Drawable;
    .locals 3

    .line 83
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    invoke-virtual {v0, p0}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    const/4 p0, -0x1

    invoke-virtual {v0, p0}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 84
    new-instance p0, Landroid/graphics/drawable/RippleDrawable;

    const v1, 0x1affffff

    invoke-static {v1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {p0, v1, v2, v0}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    return-object p0
.end method

.method static glass(FI)Landroid/graphics/drawable/Drawable;
    .locals 11

    .line 55
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    sget-object v1, Landroid/graphics/drawable/GradientDrawable$Orientation;->TOP_BOTTOM:Landroid/graphics/drawable/GradientDrawable$Orientation;

    const v2, 0x1affffff

    const v3, 0xfffffff

    filled-new-array {v2, v3}, [I

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable$Orientation;[I)V

    .line 56
    invoke-virtual {v0, p0}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    const/4 v1, 0x1

    invoke-static {v1, p1}, Ljava/lang/Math;->max(II)I

    move-result v2

    const v3, 0x1fffffff

    invoke-virtual {v0, v2, v3}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 57
    new-instance v2, Landroid/graphics/drawable/GradientDrawable;

    sget-object v4, Landroid/graphics/drawable/GradientDrawable$Orientation;->TOP_BOTTOM:Landroid/graphics/drawable/GradientDrawable$Orientation;

    const v5, 0x14ffffff

    const v6, 0xffffff

    filled-new-array {v5, v6, v6}, [I

    move-result-object v5

    invoke-direct {v2, v4, v5}, Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable$Orientation;[I)V

    invoke-virtual {v2, p0}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 58
    new-instance v4, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v4}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    invoke-virtual {v4, p0}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    const/4 p0, -0x1

    invoke-virtual {v4, p0}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 59
    new-instance p0, Landroid/graphics/drawable/LayerDrawable;

    const/4 v5, 0x2

    new-array v5, v5, [Landroid/graphics/drawable/Drawable;

    const/4 v6, 0x0

    aput-object v0, v5, v6

    aput-object v2, v5, v1

    invoke-direct {p0, v5}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    .line 60
    const/4 v6, 0x1

    const/4 v10, 0x0

    move-object v5, p0

    move v7, p1

    move v8, p1

    move v9, p1

    invoke-virtual/range {v5 .. v10}, Landroid/graphics/drawable/LayerDrawable;->setLayerInset(IIIII)V

    .line 61
    new-instance p1, Landroid/graphics/drawable/RippleDrawable;

    invoke-static {v3}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-direct {p1, v0, p0, v4}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    return-object p1
.end method

.method static grey(I)Z
    .locals 4

    .line 49
    invoke-static {p0}, Landroid/graphics/Color;->red(I)I

    move-result v0

    invoke-static {p0}, Landroid/graphics/Color;->green(I)I

    move-result v1

    invoke-static {p0}, Landroid/graphics/Color;->blue(I)I

    move-result p0

    .line 50
    invoke-static {v1, p0}, Ljava/lang/Math;->max(II)I

    move-result v2

    invoke-static {v0, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    invoke-static {v1, p0}, Ljava/lang/Math;->min(II)I

    move-result v3

    invoke-static {v0, v3}, Ljava/lang/Math;->min(II)I

    move-result v3

    sub-int/2addr v2, v3

    const/16 v3, 0x1c

    if-ge v2, v3, :cond_0

    invoke-static {v1, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    invoke-static {v0, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    const/16 v0, 0xe0

    if-ge p0, v0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method private insideGlass(Landroid/view/View;)Z
    .locals 1

    .line 187
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    :goto_0
    instance-of v0, p1, Landroid/view/View;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/melodix/music/PreviewUiRestyle;->glassRows:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    invoke-interface {p1}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    goto :goto_0

    .line 188
    :cond_1
    const/4 p1, 0x0

    return p1
.end method

.method public static likedTile(Landroid/widget/ImageView;)V
    .locals 6

    .line 65
    new-instance v0, Landroid/graphics/drawable/LayerDrawable;

    const/4 v1, 0x2

    new-array v1, v1, [Landroid/graphics/drawable/Drawable;

    new-instance v2, Landroid/graphics/drawable/GradientDrawable;

    sget-object v3, Landroid/graphics/drawable/GradientDrawable$Orientation;->TOP_BOTTOM:Landroid/graphics/drawable/GradientDrawable$Orientation;

    const v4, -0xd5d5d2

    const v5, -0xebebea

    filled-new-array {v4, v5}, [I

    move-result-object v4

    invoke-direct {v2, v3, v4}, Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable$Orientation;[I)V

    const/4 v3, 0x0

    aput-object v2, v1, v3

    new-instance v2, Lcom/melodix/music/PreviewUiRestyle$2;

    invoke-direct {v2}, Lcom/melodix/music/PreviewUiRestyle$2;-><init>()V

    const/4 v3, 0x1

    aput-object v2, v1, v3

    invoke-direct {v0, v1}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 80
    return-void
.end method

.method private static motionOff()Z
    .locals 2

    .line 163
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

.method private static plainBackground(Landroid/view/View;)Z
    .locals 2

    .line 87
    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object p0

    .line 88
    const/4 v0, 0x1

    if-nez p0, :cond_0

    return v0

    .line 90
    :cond_0
    instance-of v1, p0, Landroid/graphics/drawable/RippleDrawable;

    if-eqz v1, :cond_1

    check-cast p0, Landroid/graphics/drawable/RippleDrawable;

    invoke-virtual {p0}, Landroid/graphics/drawable/RippleDrawable;->getNumberOfLayers()I

    move-result p0

    if-gt p0, v0, :cond_1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method static press(Landroid/view/View;)V
    .locals 6

    .line 151
    invoke-static {}, Lcom/melodix/music/PreviewUiRestyle;->motionOff()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Landroid/view/View;->getStateListAnimator()Landroid/animation/StateListAnimator;

    move-result-object v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 152
    :cond_0
    new-instance v0, Landroid/animation/StateListAnimator;

    invoke-direct {v0}, Landroid/animation/StateListAnimator;-><init>()V

    .line 153
    const v1, 0x10100a7

    filled-new-array {v1}, [I

    move-result-object v1

    const-wide/16 v2, 0x5a

    const/4 v4, 0x0

    const v5, 0x3f770a3d    # 0.965f

    invoke-static {p0, v5, v2, v3, v4}, Lcom/melodix/music/PreviewUiRestyle;->scale(Landroid/view/View;FJLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/animation/StateListAnimator;->addState([ILandroid/animation/Animator;)V

    .line 154
    const/4 v1, 0x0

    new-array v1, v1, [I

    new-instance v2, Landroid/view/animation/OvershootInterpolator;

    const v3, 0x400ccccd    # 2.2f

    invoke-direct {v2, v3}, Landroid/view/animation/OvershootInterpolator;-><init>(F)V

    const/high16 v3, 0x3f800000    # 1.0f

    const-wide/16 v4, 0xdc

    invoke-static {p0, v3, v4, v5, v2}, Lcom/melodix/music/PreviewUiRestyle;->scale(Landroid/view/View;FJLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/animation/StateListAnimator;->addState([ILandroid/animation/Animator;)V

    .line 155
    invoke-virtual {p0, v0}, Landroid/view/View;->setStateListAnimator(Landroid/animation/StateListAnimator;)V

    .line 156
    return-void

    .line 151
    :cond_1
    :goto_0
    return-void
.end method

.method private restyle()V
    .locals 7

    .line 191
    invoke-direct {p0}, Lcom/melodix/music/PreviewUiRestyle;->activity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_6

    invoke-virtual {p0}, Lcom/melodix/music/PreviewUiRestyle;->isShown()Z

    move-result v1

    if-nez v1, :cond_0

    goto/16 :goto_0

    .line 192
    :cond_0
    const v1, 0x7f090230

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 193
    instance-of v2, v1, Landroid/widget/TextView;

    const/high16 v3, 0x41600000    # 14.0f

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/melodix/music/PreviewUiRestyle;->done:Ljava/util/WeakHashMap;

    invoke-virtual {v2, v1}, Ljava/util/WeakHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 194
    iget-object v2, p0, Lcom/melodix/music/PreviewUiRestyle;->done:Ljava/util/WeakHashMap;

    sget-object v4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v2, v1, v4}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    check-cast v1, Landroid/widget/TextView;

    .line 195
    const/4 v2, 0x2

    const/high16 v4, 0x41f00000    # 30.0f

    invoke-virtual {v1, v2, v4}, Landroid/widget/TextView;->setTextSize(IF)V

    const-string v2, "sans-serif"

    const/4 v4, 0x1

    invoke-static {v2, v4}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    const v2, -0x50506

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 196
    const v2, -0x435c28f6    # -0.02f

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setLetterSpacing(F)V

    .line 197
    invoke-direct {p0, v3}, Lcom/melodix/music/PreviewUiRestyle;->dp(F)I

    move-result v2

    int-to-float v2, v2

    const/high16 v4, 0x40000000    # 2.0f

    invoke-direct {p0, v4}, Lcom/melodix/music/PreviewUiRestyle;->dp(F)I

    move-result v4

    int-to-float v4, v4

    const/high16 v5, -0x80000000

    const/4 v6, 0x0

    invoke-virtual {v1, v2, v6, v4, v5}, Landroid/widget/TextView;->setShadowLayer(FFFI)V

    .line 199
    :cond_1
    const v1, 0x7f09024c

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 200
    if-eqz v1, :cond_3

    iget-object v2, p0, Lcom/melodix/music/PreviewUiRestyle;->done:Ljava/util/WeakHashMap;

    invoke-virtual {v2, v1}, Ljava/util/WeakHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x1c

    if-lt v2, v4, :cond_3

    .line 201
    iget-object v2, p0, Lcom/melodix/music/PreviewUiRestyle;->done:Ljava/util/WeakHashMap;

    sget-object v4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v2, v1, v4}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-direct {p0, v3}, Lcom/melodix/music/PreviewUiRestyle;->dp(F)I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {v1, v2}, Landroid/view/View;->setElevation(F)V

    const/high16 v2, -0x1000000

    invoke-virtual {v1, v2}, Landroid/view/View;->setOutlineSpotShadowColor(I)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOutlineAmbientShadowColor(I)V

    .line 202
    invoke-static {v1}, Lcom/melodix/music/PreviewUiRestyle;->plainBackground(Landroid/view/View;)Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-direct {p0, v3}, Lcom/melodix/music/PreviewUiRestyle;->dp(F)I

    move-result v2

    int-to-float v2, v2

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-direct {p0, v3}, Lcom/melodix/music/PreviewUiRestyle;->dp(F)I

    move-result v3

    invoke-static {v2, v3}, Lcom/melodix/music/PreviewUiRestyle;->glass(FI)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 203
    :cond_2
    invoke-static {v1}, Lcom/melodix/music/PreviewUiRestyle;->press(Landroid/view/View;)V

    .line 205
    :cond_3
    const v1, 0x7f090235

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 206
    instance-of v1, v0, Landroid/view/ViewGroup;

    const/4 v2, 0x0

    if-eqz v1, :cond_4

    move-object v1, v0

    check-cast v1, Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v3

    if-lez v3, :cond_4

    .line 207
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 208
    iget-object v3, p0, Lcom/melodix/music/PreviewUiRestyle;->lastScreen:Landroid/view/View;

    if-eq v1, v3, :cond_4

    .line 209
    iput-object v1, p0, Lcom/melodix/music/PreviewUiRestyle;->lastScreen:Landroid/view/View;

    iput v2, p0, Lcom/melodix/music/PreviewUiRestyle;->entered:I

    .line 214
    :cond_4
    if-eqz v0, :cond_5

    invoke-direct {p0, v0, v2}, Lcom/melodix/music/PreviewUiRestyle;->visit(Landroid/view/View;I)V

    .line 215
    :cond_5
    return-void

    .line 191
    :cond_6
    :goto_0
    return-void
.end method

.method static rise(Landroid/view/View;I)V
    .locals 4

    .line 167
    invoke-static {}, Lcom/melodix/music/PreviewUiRestyle;->motionOff()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 168
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    .line 169
    new-instance v1, Lcom/melodix/music/PreviewUiRestyle$4;

    invoke-direct {v1}, Lcom/melodix/music/PreviewUiRestyle$4;-><init>()V

    invoke-virtual {p0, v1}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 173
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Landroid/view/View;->setAlpha(F)V

    const/high16 v2, 0x41600000    # 14.0f

    mul-float/2addr v0, v2

    invoke-virtual {p0, v0}, Landroid/view/View;->setTranslationY(F)V

    .line 174
    invoke-virtual {p0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p0, v0}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0, v1}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    const/16 v0, 0x12

    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    move-result p1

    int-to-long v0, p1

    const-wide/16 v2, 0x20

    mul-long/2addr v0, v2

    invoke-virtual {p0, v0, v1}, Landroid/view/ViewPropertyAnimator;->setStartDelay(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    const-wide/16 v0, 0x12c

    invoke-virtual {p0, v0, v1}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    new-instance p1, Landroid/view/animation/DecelerateInterpolator;

    const v0, 0x3fcccccd    # 1.6f

    invoke-direct {p1, v0}, Landroid/view/animation/DecelerateInterpolator;-><init>(F)V

    .line 175
    invoke-virtual {p0, p1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 176
    return-void
.end method

.method private round(Landroid/view/View;F)V
    .locals 1

    .line 93
    new-instance v0, Lcom/melodix/music/PreviewUiRestyle$3;

    invoke-direct {v0, p0, p2}, Lcom/melodix/music/PreviewUiRestyle$3;-><init>(Lcom/melodix/music/PreviewUiRestyle;F)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 96
    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Landroid/view/View;->setClipToOutline(Z)V

    .line 97
    return-void
.end method

.method private static scale(Landroid/view/View;FJLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;
    .locals 6

    .line 158
    new-instance v0, Landroid/animation/AnimatorSet;

    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 159
    const/4 v1, 0x2

    new-array v1, v1, [Landroid/animation/Animator;

    const/4 v2, 0x1

    new-array v3, v2, [F

    const/4 v4, 0x0

    aput p1, v3, v4

    const-string v5, "scaleX"

    invoke-static {p0, v5, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v3

    aput-object v3, v1, v4

    new-array v3, v2, [F

    aput p1, v3, v4

    const-string p1, "scaleY"

    invoke-static {p0, p1, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object p0

    aput-object p0, v1, v2

    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 160
    invoke-virtual {v0, p2, p3}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    if-eqz p4, :cond_0

    invoke-virtual {v0, p4}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    :cond_0
    return-object v0
.end method

.method static sheet(Landroid/view/View;)V
    .locals 3

    .line 179
    invoke-static {}, Lcom/melodix/music/PreviewUiRestyle;->motionOff()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 180
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    .line 181
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Landroid/view/View;->setAlpha(F)V

    const/high16 v2, 0x43a00000    # 320.0f

    mul-float/2addr v0, v2

    invoke-virtual {p0, v0}, Landroid/view/View;->setTranslationY(F)V

    .line 182
    invoke-virtual {p0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p0, v0}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0, v1}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    const-wide/16 v0, 0x154

    invoke-virtual {p0, v0, v1}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    new-instance v0, Landroid/view/animation/DecelerateInterpolator;

    const/high16 v1, 0x40000000    # 2.0f

    invoke-direct {v0, v1}, Landroid/view/animation/DecelerateInterpolator;-><init>(F)V

    invoke-virtual {p0, v0}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 183
    return-void
.end method

.method private styleText(Landroid/widget/TextView;)V
    .locals 5

    .line 99
    invoke-virtual {p1}, Landroid/widget/TextView;->getTextSize()F

    move-result v0

    invoke-virtual {p0}, Lcom/melodix/music/PreviewUiRestyle;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->scaledDensity:F

    div-float/2addr v0, v1

    .line 100
    invoke-virtual {p1}, Landroid/widget/TextView;->getCurrentTextColor()I

    move-result v1

    .line 101
    invoke-virtual {p1}, Landroid/widget/TextView;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v2

    const/4 v3, 0x0

    if-eqz v2, :cond_0

    invoke-virtual {p1}, Landroid/widget/TextView;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v2

    invoke-virtual {v2}, Landroid/graphics/Typeface;->isBold()Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    move v2, v3

    .line 102
    :goto_0
    const/high16 v4, 0x41980000    # 19.0f

    cmpl-float v4, v0, v4

    if-ltz v4, :cond_1

    .line 104
    const-string v0, "sans-serif-medium"

    invoke-static {v0, v3}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    const v0, -0x50506

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 105
    const v0, -0x43dc28f6    # -0.01f

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setLetterSpacing(F)V

    .line 106
    const/4 v0, 0x0

    invoke-virtual {p1, v0, v0, v0, v3}, Landroid/widget/TextView;->setShadowLayer(FFFI)V

    goto :goto_1

    .line 107
    :cond_1
    if-eqz v2, :cond_2

    const/high16 v3, 0x41680000    # 14.5f

    cmpg-float v0, v0, v3

    if-gtz v0, :cond_2

    invoke-static {v1}, Lcom/melodix/music/PreviewUiRestyle;->grey(I)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 108
    const v0, 0x73ffffff

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    const v0, 0x3d23d70a    # 0.04f

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setLetterSpacing(F)V

    goto :goto_1

    .line 109
    :cond_2
    if-nez v2, :cond_3

    invoke-static {v1}, Lcom/melodix/music/PreviewUiRestyle;->grey(I)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 110
    const v0, -0x59000001

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 112
    :cond_3
    :goto_1
    return-void
.end method

.method private visit(Landroid/view/View;I)V
    .locals 7

    .line 114
    const/16 v0, 0x28

    if-gt p2, v0, :cond_9

    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_3

    .line 115
    :cond_0
    iget-object v0, p0, Lcom/melodix/music/PreviewUiRestyle;->done:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_7

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v0

    if-lez v0, :cond_7

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v0

    if-lez v0, :cond_7

    .line 116
    iget-object v0, p0, Lcom/melodix/music/PreviewUiRestyle;->done:Ljava/util/WeakHashMap;

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v0, p1, v1}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 117
    instance-of v0, p1, Landroid/widget/EditText;

    if-eqz v0, :cond_1

    move-object v0, p1

    check-cast v0, Landroid/widget/EditText;

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewUiRestyle;->field(Landroid/widget/EditText;)V

    goto/16 :goto_1

    .line 118
    :cond_1
    instance-of v0, p1, Landroid/widget/TextView;

    const/high16 v1, 0x40000000    # 2.0f

    const/high16 v2, 0x41600000    # 14.0f

    if-eqz v0, :cond_2

    instance-of v0, p1, Landroid/widget/Button;

    if-nez v0, :cond_2

    .line 119
    move-object v0, p1

    check-cast v0, Landroid/widget/TextView;

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewUiRestyle;->styleText(Landroid/widget/TextView;)V

    .line 121
    invoke-virtual {p1}, Landroid/view/View;->isClickable()Z

    move-result v0

    if-eqz v0, :cond_7

    invoke-static {p1}, Lcom/melodix/music/PreviewUiRestyle;->plainBackground(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_7

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v0

    const/high16 v3, 0x41e00000    # 28.0f

    invoke-direct {p0, v3}, Lcom/melodix/music/PreviewUiRestyle;->dp(F)I

    move-result v3

    if-lt v0, v3, :cond_7

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v0

    const/high16 v3, 0x42300000    # 44.0f

    invoke-direct {p0, v3}, Lcom/melodix/music/PreviewUiRestyle;->dp(F)I

    move-result v3

    if-gt v0, v3, :cond_7

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v0

    const/high16 v3, 0x43340000    # 180.0f

    invoke-direct {p0, v3}, Lcom/melodix/music/PreviewUiRestyle;->dp(F)I

    move-result v3

    if-gt v0, v3, :cond_7

    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewUiRestyle;->insideGlass(Landroid/view/View;)Z

    move-result v0

    if-nez v0, :cond_7

    .line 122
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v0

    int-to-float v0, v0

    div-float/2addr v0, v1

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-direct {p0, v1}, Lcom/melodix/music/PreviewUiRestyle;->dp(F)I

    move-result v1

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewUiRestyle;->glass(FI)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 123
    invoke-virtual {p1}, Landroid/view/View;->getPaddingLeft()I

    move-result v0

    invoke-direct {p0, v2}, Lcom/melodix/music/PreviewUiRestyle;->dp(F)I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    invoke-virtual {p1}, Landroid/view/View;->getPaddingTop()I

    move-result v1

    invoke-virtual {p1}, Landroid/view/View;->getPaddingRight()I

    move-result v3

    invoke-direct {p0, v2}, Lcom/melodix/music/PreviewUiRestyle;->dp(F)I

    move-result v2

    invoke-static {v3, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    invoke-virtual {p1}, Landroid/view/View;->getPaddingBottom()I

    move-result v3

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/view/View;->setPadding(IIII)V

    .line 124
    invoke-static {p1}, Lcom/melodix/music/PreviewUiRestyle;->press(Landroid/view/View;)V

    goto/16 :goto_1

    .line 127
    :cond_2
    instance-of v0, p1, Landroid/view/ViewGroup;

    const/high16 v3, 0x42400000    # 48.0f

    if-nez v0, :cond_3

    instance-of v4, p1, Landroid/widget/ImageView;

    if-nez v4, :cond_3

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v4

    invoke-direct {p0, v1}, Lcom/melodix/music/PreviewUiRestyle;->dp(F)I

    move-result v1

    if-gt v4, v1, :cond_3

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v1

    invoke-direct {p0, v3}, Lcom/melodix/music/PreviewUiRestyle;->dp(F)I

    move-result v4

    if-lt v1, v4, :cond_3

    .line 128
    invoke-virtual {p1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    instance-of v1, v1, Landroid/graphics/drawable/ColorDrawable;

    if-eqz v1, :cond_3

    const v0, 0x14ffffff

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundColor(I)V

    goto/16 :goto_1

    .line 129
    :cond_3
    instance-of v1, p1, Landroid/widget/ImageView;

    const/high16 v4, 0x41200000    # 10.0f

    if-eqz v1, :cond_5

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v1

    const/high16 v5, 0x42200000    # 40.0f

    invoke-direct {p0, v5}, Lcom/melodix/music/PreviewUiRestyle;->dp(F)I

    move-result v6

    if-lt v1, v6, :cond_5

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v1

    invoke-direct {p0, v5}, Lcom/melodix/music/PreviewUiRestyle;->dp(F)I

    move-result v5

    if-lt v1, v5, :cond_5

    .line 130
    invoke-direct {p0, v4}, Lcom/melodix/music/PreviewUiRestyle;->dp(F)I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v1

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    int-to-float v1, v1

    const v2, 0x3dcccccd    # 0.1f

    mul-float/2addr v1, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result v0

    invoke-direct {p0, p1, v0}, Lcom/melodix/music/PreviewUiRestyle;->round(Landroid/view/View;F)V

    .line 131
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v0

    const/high16 v1, 0x42c00000    # 96.0f

    invoke-direct {p0, v1}, Lcom/melodix/music/PreviewUiRestyle;->dp(F)I

    move-result v1

    if-lt v0, v1, :cond_4

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1c

    if-lt v0, v1, :cond_4

    invoke-direct {p0, v4}, Lcom/melodix/music/PreviewUiRestyle;->dp(F)I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p1, v0}, Landroid/view/View;->setElevation(F)V

    const/high16 v0, -0x1000000

    invoke-virtual {p1, v0}, Landroid/view/View;->setOutlineSpotShadowColor(I)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOutlineAmbientShadowColor(I)V

    .line 132
    :cond_4
    invoke-virtual {p1}, Landroid/view/View;->isClickable()Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-static {p1}, Lcom/melodix/music/PreviewUiRestyle;->press(Landroid/view/View;)V

    goto :goto_0

    .line 133
    :cond_5
    if-eqz v0, :cond_6

    invoke-virtual {p1}, Landroid/view/View;->isClickable()Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-static {p1}, Lcom/melodix/music/PreviewUiRestyle;->plainBackground(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 134
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v0

    const/high16 v1, 0x42f00000    # 120.0f

    invoke-direct {p0, v1}, Lcom/melodix/music/PreviewUiRestyle;->dp(F)I

    move-result v1

    if-lt v0, v1, :cond_7

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v0

    invoke-direct {p0, v3}, Lcom/melodix/music/PreviewUiRestyle;->dp(F)I

    move-result v1

    if-lt v0, v1, :cond_7

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v0

    const/high16 v1, 0x430c0000    # 140.0f

    invoke-direct {p0, v1}, Lcom/melodix/music/PreviewUiRestyle;->dp(F)I

    move-result v1

    if-gt v0, v1, :cond_7

    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewUiRestyle;->insideGlass(Landroid/view/View;)Z

    move-result v0

    if-nez v0, :cond_7

    .line 135
    invoke-virtual {p1}, Landroid/view/View;->getPaddingLeft()I

    move-result v0

    invoke-virtual {p1}, Landroid/view/View;->getPaddingTop()I

    move-result v1

    invoke-virtual {p1}, Landroid/view/View;->getPaddingRight()I

    move-result v3

    invoke-virtual {p1}, Landroid/view/View;->getPaddingBottom()I

    move-result v5

    .line 136
    invoke-direct {p0, v4}, Lcom/melodix/music/PreviewUiRestyle;->dp(F)I

    move-result v4

    int-to-float v4, v4

    invoke-static {v4}, Lcom/melodix/music/PreviewUiRestyle;->flat(F)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-virtual {p1, v4}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    invoke-direct {p0, v2}, Lcom/melodix/music/PreviewUiRestyle;->dp(F)I

    move-result v4

    invoke-static {v0, v4}, Ljava/lang/Math;->max(II)I

    move-result v0

    invoke-direct {p0, v2}, Lcom/melodix/music/PreviewUiRestyle;->dp(F)I

    move-result v2

    invoke-static {v3, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    invoke-virtual {p1, v0, v1, v2, v5}, Landroid/view/View;->setPadding(IIII)V

    .line 137
    iget-object v0, p0, Lcom/melodix/music/PreviewUiRestyle;->glassRows:Ljava/util/WeakHashMap;

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v0, p1, v1}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {p1}, Lcom/melodix/music/PreviewUiRestyle;->press(Landroid/view/View;)V

    goto :goto_1

    .line 133
    :cond_6
    :goto_0
    nop

    .line 140
    :cond_7
    :goto_1
    instance-of v0, p1, Landroid/view/ViewGroup;

    if-eqz v0, :cond_8

    check-cast p1, Landroid/view/ViewGroup;

    const/4 v0, 0x0

    :goto_2
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_8

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    add-int/lit8 v2, p2, 0x1

    invoke-direct {p0, v1, v2}, Lcom/melodix/music/PreviewUiRestyle;->visit(Landroid/view/View;I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 141
    :cond_8
    return-void

    .line 114
    :cond_9
    :goto_3
    return-void
.end method


# virtual methods
.method protected onAttachedToWindow()V
    .locals 1

    .line 219
    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    invoke-virtual {p0}, Lcom/melodix/music/PreviewUiRestyle;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    iput-object v0, p0, Lcom/melodix/music/PreviewUiRestyle;->observer:Landroid/view/ViewTreeObserver;

    iget-object v0, p0, Lcom/melodix/music/PreviewUiRestyle;->observer:Landroid/view/ViewTreeObserver;

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    iget-object v0, p0, Lcom/melodix/music/PreviewUiRestyle;->observer:Landroid/view/ViewTreeObserver;

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    iget-object v0, p0, Lcom/melodix/music/PreviewUiRestyle;->pass:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewUiRestyle;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 1

    .line 221
    iget-object v0, p0, Lcom/melodix/music/PreviewUiRestyle;->observer:Landroid/view/ViewTreeObserver;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewUiRestyle;->observer:Landroid/view/ViewTreeObserver;

    invoke-virtual {v0}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewUiRestyle;->observer:Landroid/view/ViewTreeObserver;

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    iget-object v0, p0, Lcom/melodix/music/PreviewUiRestyle;->observer:Landroid/view/ViewTreeObserver;

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 222
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/melodix/music/PreviewUiRestyle;->observer:Landroid/view/ViewTreeObserver;

    iget-object v0, p0, Lcom/melodix/music/PreviewUiRestyle;->pass:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewUiRestyle;->removeCallbacks(Ljava/lang/Runnable;)Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/melodix/music/PreviewUiRestyle;->scheduled:Z

    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 223
    return-void
.end method

.method public onGlobalLayout()V
    .locals 1

    .line 217
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/melodix/music/PreviewUiRestyle;->scheduled:Z

    return-void
.end method

.method public onPreDraw()Z
    .locals 1

    .line 218
    iget-boolean v0, p0, Lcom/melodix/music/PreviewUiRestyle;->scheduled:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewUiRestyle;->pass:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    :cond_0
    const/4 v0, 0x1

    return v0
.end method
