.class public Landroidx/appcompat/widget/ActionBarOverlayLayout;
.super Landroid/view/ViewGroup;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lhp0;
.implements Lip0;


# static fields
.field public static final L:[I

.field public static final M:Lkk1;

.field public static final N:Landroid/graphics/Rect;


# instance fields
.field public A:Lkk1;

.field public B:Lkk1;

.field public C:Lkk1;

.field public D:Lk2;

.field public E:Landroid/widget/OverScroller;

.field public F:Landroid/view/ViewPropertyAnimator;

.field public final G:Lh2;

.field public final H:Li2;

.field public final I:Lj2;

.field public final J:Ltw0;

.field public final K:Lm2;

.field public j:I

.field public k:I

.field public l:Landroidx/appcompat/widget/ContentFrameLayout;

.field public m:Landroidx/appcompat/widget/ActionBarContainer;

.field public n:Lcv;

.field public o:Landroid/graphics/drawable/Drawable;

.field public p:Z

.field public q:Z

.field public r:Z

.field public s:Z

.field public t:I

.field public u:I

.field public final v:Landroid/graphics/Rect;

.field public final w:Landroid/graphics/Rect;

.field public final x:Landroid/graphics/Rect;

.field public final y:Landroid/graphics/Rect;

.field public z:Lkk1;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    const v0, 0x7f040003

    .line 2
    .line 3
    .line 4
    const v1, 0x1010059

    .line 5
    .line 6
    .line 7
    filled-new-array {v0, v1}, [I

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sput-object v0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->L:[I

    .line 12
    .line 13
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 14
    .line 15
    const/16 v1, 0x1e

    .line 16
    .line 17
    if-lt v0, v1, :cond_0

    .line 18
    .line 19
    new-instance v0, Lak1;

    .line 20
    .line 21
    invoke-direct {v0}, Lak1;-><init>()V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const/16 v1, 0x1d

    .line 26
    .line 27
    if-lt v0, v1, :cond_1

    .line 28
    .line 29
    new-instance v0, Lzj1;

    .line 30
    .line 31
    invoke-direct {v0}, Lzj1;-><init>()V

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    new-instance v0, Lxj1;

    .line 36
    .line 37
    invoke-direct {v0}, Lxj1;-><init>()V

    .line 38
    .line 39
    .line 40
    :goto_0
    const/4 v1, 0x0

    .line 41
    const/4 v2, 0x1

    .line 42
    invoke-static {v1, v2, v1, v2}, Lne0;->a(IIII)Lne0;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {v0, v1}, Lbk1;->d(Lne0;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0}, Lbk1;->b()Lkk1;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    sput-object v0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->M:Lkk1;

    .line 54
    .line 55
    new-instance v0, Landroid/graphics/Rect;

    .line 56
    .line 57
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 58
    .line 59
    .line 60
    sput-object v0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->N:Landroid/graphics/Rect;

    .line 61
    .line 62
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 114
    invoke-direct {p0, p1, v0}, Landroidx/appcompat/widget/ActionBarOverlayLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    const/4 p2, 0x0

    .line 5
    iput p2, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->k:I

    .line 6
    .line 7
    new-instance p2, Landroid/graphics/Rect;

    .line 8
    .line 9
    invoke-direct {p2}, Landroid/graphics/Rect;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object p2, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->v:Landroid/graphics/Rect;

    .line 13
    .line 14
    new-instance p2, Landroid/graphics/Rect;

    .line 15
    .line 16
    invoke-direct {p2}, Landroid/graphics/Rect;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object p2, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->w:Landroid/graphics/Rect;

    .line 20
    .line 21
    new-instance p2, Landroid/graphics/Rect;

    .line 22
    .line 23
    invoke-direct {p2}, Landroid/graphics/Rect;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object p2, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->x:Landroid/graphics/Rect;

    .line 27
    .line 28
    new-instance p2, Landroid/graphics/Rect;

    .line 29
    .line 30
    invoke-direct {p2}, Landroid/graphics/Rect;-><init>()V

    .line 31
    .line 32
    .line 33
    iput-object p2, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->y:Landroid/graphics/Rect;

    .line 34
    .line 35
    new-instance p2, Landroid/graphics/Rect;

    .line 36
    .line 37
    invoke-direct {p2}, Landroid/graphics/Rect;-><init>()V

    .line 38
    .line 39
    .line 40
    new-instance p2, Landroid/graphics/Rect;

    .line 41
    .line 42
    invoke-direct {p2}, Landroid/graphics/Rect;-><init>()V

    .line 43
    .line 44
    .line 45
    new-instance p2, Landroid/graphics/Rect;

    .line 46
    .line 47
    invoke-direct {p2}, Landroid/graphics/Rect;-><init>()V

    .line 48
    .line 49
    .line 50
    new-instance p2, Landroid/graphics/Rect;

    .line 51
    .line 52
    invoke-direct {p2}, Landroid/graphics/Rect;-><init>()V

    .line 53
    .line 54
    .line 55
    sget-object p2, Lkk1;->b:Lkk1;

    .line 56
    .line 57
    iput-object p2, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->z:Lkk1;

    .line 58
    .line 59
    iput-object p2, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->A:Lkk1;

    .line 60
    .line 61
    iput-object p2, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->B:Lkk1;

    .line 62
    .line 63
    iput-object p2, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->C:Lkk1;

    .line 64
    .line 65
    new-instance p2, Lh2;

    .line 66
    .line 67
    const/4 v0, 0x0

    .line 68
    invoke-direct {p2, v0, p0}, Lh2;-><init>(ILjava/lang/Object;)V

    .line 69
    .line 70
    .line 71
    iput-object p2, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->G:Lh2;

    .line 72
    .line 73
    new-instance p2, Li2;

    .line 74
    .line 75
    invoke-direct {p2, p0}, Li2;-><init>(Landroidx/appcompat/widget/ActionBarOverlayLayout;)V

    .line 76
    .line 77
    .line 78
    iput-object p2, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->H:Li2;

    .line 79
    .line 80
    new-instance p2, Lj2;

    .line 81
    .line 82
    invoke-direct {p2, p0}, Lj2;-><init>(Landroidx/appcompat/widget/ActionBarOverlayLayout;)V

    .line 83
    .line 84
    .line 85
    iput-object p2, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->I:Lj2;

    .line 86
    .line 87
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->i(Landroid/content/Context;)V

    .line 88
    .line 89
    .line 90
    new-instance p2, Ltw0;

    .line 91
    .line 92
    const/4 v0, 0x1

    .line 93
    const/4 v1, 0x0

    .line 94
    invoke-direct {p2, v0, v1}, Ltw0;-><init>(IB)V

    .line 95
    .line 96
    .line 97
    iput-object p2, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->J:Ltw0;

    .line 98
    .line 99
    new-instance p2, Lm2;

    .line 100
    .line 101
    invoke-direct {p2, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 102
    .line 103
    .line 104
    const/4 p1, 0x1

    .line 105
    invoke-virtual {p2, p1}, Landroid/view/View;->setWillNotDraw(Z)V

    .line 106
    .line 107
    .line 108
    iput-object p2, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->K:Lm2;

    .line 109
    .line 110
    invoke-virtual {p0, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 111
    .line 112
    .line 113
    return-void
.end method

.method public static g(Landroid/view/View;Landroid/graphics/Rect;Z)Z
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ll2;

    .line 6
    .line 7
    iget v0, p0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 8
    .line 9
    iget v1, p1, Landroid/graphics/Rect;->left:I

    .line 10
    .line 11
    const/4 v2, 0x1

    .line 12
    if-eq v0, v1, :cond_0

    .line 13
    .line 14
    iput v1, p0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 15
    .line 16
    move v0, v2

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 v0, 0x0

    .line 19
    :goto_0
    iget v1, p0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 20
    .line 21
    iget v3, p1, Landroid/graphics/Rect;->top:I

    .line 22
    .line 23
    if-eq v1, v3, :cond_1

    .line 24
    .line 25
    iput v3, p0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 26
    .line 27
    move v0, v2

    .line 28
    :cond_1
    iget v1, p0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 29
    .line 30
    iget v3, p1, Landroid/graphics/Rect;->right:I

    .line 31
    .line 32
    if-eq v1, v3, :cond_2

    .line 33
    .line 34
    iput v3, p0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 35
    .line 36
    move v0, v2

    .line 37
    :cond_2
    if-eqz p2, :cond_3

    .line 38
    .line 39
    iget p2, p0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 40
    .line 41
    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    .line 42
    .line 43
    if-eq p2, p1, :cond_3

    .line 44
    .line 45
    iput p1, p0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 46
    .line 47
    return v2

    .line 48
    :cond_3
    return v0
.end method


# virtual methods
.method public final a(Landroid/view/View;Landroid/view/View;II)V
    .locals 0

    .line 1
    if-nez p4, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->onNestedScrollAccepted(Landroid/view/View;Landroid/view/View;I)V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public final b(Landroid/view/ViewGroup;IIIII)V
    .locals 0

    .line 1
    if-nez p6, :cond_0

    .line 2
    .line 3
    invoke-virtual/range {p0 .. p5}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->onNestedScroll(Landroid/view/View;IIII)V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public final c(Landroid/view/View;I)V
    .locals 0

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->onStopNestedScroll(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public final checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z
    .locals 0

    .line 1
    instance-of p0, p1, Ll2;

    .line 2
    .line 3
    return p0
.end method

.method public final d(II[II)V
    .locals 0

    .line 1
    return-void
.end method

.method public final draw(Landroid/graphics/Canvas;)V
    .locals 5

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->o:Landroid/graphics/drawable/Drawable;

    .line 5
    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    iget-object v0, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->m:Landroidx/appcompat/widget/ActionBarContainer;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const/4 v1, 0x0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->m:Landroidx/appcompat/widget/ActionBarContainer;

    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/view/View;->getBottom()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    int-to-float v0, v0

    .line 24
    iget-object v2, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->m:Landroidx/appcompat/widget/ActionBarContainer;

    .line 25
    .line 26
    invoke-virtual {v2}, Landroid/view/View;->getTranslationY()F

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    add-float/2addr v2, v0

    .line 31
    const/high16 v0, 0x3f000000    # 0.5f

    .line 32
    .line 33
    add-float/2addr v2, v0

    .line 34
    float-to-int v0, v2

    .line 35
    goto :goto_0

    .line 36
    :cond_0
    move v0, v1

    .line 37
    :goto_0
    iget-object v2, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->o:Landroid/graphics/drawable/Drawable;

    .line 38
    .line 39
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    iget-object v4, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->o:Landroid/graphics/drawable/Drawable;

    .line 44
    .line 45
    invoke-virtual {v4}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    .line 46
    .line 47
    .line 48
    move-result v4

    .line 49
    add-int/2addr v4, v0

    .line 50
    invoke-virtual {v2, v1, v0, v3, v4}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 51
    .line 52
    .line 53
    iget-object p0, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->o:Landroid/graphics/drawable/Drawable;

    .line 54
    .line 55
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 56
    .line 57
    .line 58
    :cond_1
    return-void
.end method

.method public final e(Landroid/view/ViewGroup;IIIII[I)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p6}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->b(Landroid/view/ViewGroup;IIIII)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final f(Landroid/view/View;Landroid/view/View;II)Z
    .locals 0

    .line 1
    if-nez p4, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->onStartNestedScroll(Landroid/view/View;Landroid/view/View;I)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public final fitSystemWindows(Landroid/graphics/Rect;)Z
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->fitSystemWindows(Landroid/graphics/Rect;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public final generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    .locals 1

    .line 1
    new-instance p0, Ll2;

    .line 2
    .line 3
    const/4 v0, -0x1

    .line 4
    invoke-direct {p0, v0, v0}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(II)V

    .line 5
    .line 6
    .line 7
    return-object p0
.end method

.method public final generateLayoutParams(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$LayoutParams;
    .locals 1

    .line 1
    new-instance v0, Ll2;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-direct {v0, p0, p1}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method public final generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    .locals 0

    .line 11
    new-instance p0, Ll2;

    .line 12
    invoke-direct {p0, p1}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    return-object p0
.end method

.method public getActionBarHideOffset()I
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->m:Landroidx/appcompat/widget/ActionBarContainer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getTranslationY()F

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    float-to-int p0, p0

    .line 10
    neg-int p0, p0

    .line 11
    return p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0
.end method

.method public getNestedScrollAxes()I
    .locals 1

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->J:Ltw0;

    .line 2
    .line 3
    iget v0, p0, Ltw0;->b:I

    .line 4
    .line 5
    iget p0, p0, Ltw0;->c:I

    .line 6
    .line 7
    or-int/2addr p0, v0

    .line 8
    return p0
.end method

.method public getTitle()Ljava/lang/CharSequence;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->k()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->n:Lcv;

    .line 5
    .line 6
    check-cast p0, Lcd1;

    .line 7
    .line 8
    iget-object p0, p0, Lcd1;->a:Landroidx/appcompat/widget/Toolbar;

    .line 9
    .line 10
    invoke-virtual {p0}, Landroidx/appcompat/widget/Toolbar;->getTitle()Ljava/lang/CharSequence;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public final h()V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->H:Li2;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->I:Lj2;

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->F:Landroid/view/ViewPropertyAnimator;

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public final i(Landroid/content/Context;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget-object v1, Landroidx/appcompat/widget/ActionBarOverlayLayout;->L:[I

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-virtual {v0, v1, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    iput v2, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->j:I

    .line 21
    .line 22
    const/4 v2, 0x1

    .line 23
    invoke-virtual {v0, v2}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    iput-object v3, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->o:Landroid/graphics/drawable/Drawable;

    .line 28
    .line 29
    if-nez v3, :cond_0

    .line 30
    .line 31
    move v1, v2

    .line 32
    :cond_0
    invoke-virtual {p0, v1}, Landroid/view/View;->setWillNotDraw(Z)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 36
    .line 37
    .line 38
    new-instance v0, Landroid/widget/OverScroller;

    .line 39
    .line 40
    invoke-direct {v0, p1}, Landroid/widget/OverScroller;-><init>(Landroid/content/Context;)V

    .line 41
    .line 42
    .line 43
    iput-object v0, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->E:Landroid/widget/OverScroller;

    .line 44
    .line 45
    return-void
.end method

.method public final j(I)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->k()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    if-eq p1, v0, :cond_2

    .line 6
    .line 7
    const/4 v0, 0x5

    .line 8
    if-eq p1, v0, :cond_1

    .line 9
    .line 10
    const/16 v0, 0x6d

    .line 11
    .line 12
    if-eq p1, v0, :cond_0

    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    const/4 p1, 0x1

    .line 16
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->setOverlayMode(Z)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_1
    iget-object p0, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->n:Lcv;

    .line 21
    .line 22
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_2
    iget-object p0, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->n:Lcv;

    .line 27
    .line 28
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final k()V
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->l:Landroidx/appcompat/widget/ContentFrameLayout;

    .line 2
    .line 3
    if-nez v0, :cond_2

    .line 4
    .line 5
    const v0, 0x7f090032

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Landroidx/appcompat/widget/ContentFrameLayout;

    .line 13
    .line 14
    iput-object v0, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->l:Landroidx/appcompat/widget/ContentFrameLayout;

    .line 15
    .line 16
    const v0, 0x7f090033

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Landroidx/appcompat/widget/ActionBarContainer;

    .line 24
    .line 25
    iput-object v0, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->m:Landroidx/appcompat/widget/ActionBarContainer;

    .line 26
    .line 27
    const v0, 0x7f090031

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    instance-of v1, v0, Lcv;

    .line 35
    .line 36
    if-eqz v1, :cond_0

    .line 37
    .line 38
    check-cast v0, Lcv;

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    instance-of v1, v0, Landroidx/appcompat/widget/Toolbar;

    .line 42
    .line 43
    if-eqz v1, :cond_1

    .line 44
    .line 45
    check-cast v0, Landroidx/appcompat/widget/Toolbar;

    .line 46
    .line 47
    invoke-virtual {v0}, Landroidx/appcompat/widget/Toolbar;->getWrapper()Lcv;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    :goto_0
    iput-object v0, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->n:Lcv;

    .line 52
    .line 53
    return-void

    .line 54
    :cond_1
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    const-string v0, "Can\'t make a decor toolbar out of "

    .line 63
    .line 64
    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    :cond_2
    return-void
.end method

.method public final l(Lrm0;Lhn0;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->k()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->n:Lcv;

    .line 5
    .line 6
    check-cast p0, Lcd1;

    .line 7
    .line 8
    iget-object v0, p0, Lcd1;->a:Landroidx/appcompat/widget/Toolbar;

    .line 9
    .line 10
    iget-object v1, p0, Lcd1;->m:Lu2;

    .line 11
    .line 12
    if-nez v1, :cond_0

    .line 13
    .line 14
    new-instance v1, Lu2;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-direct {v1, v2}, Lu2;-><init>(Landroid/content/Context;)V

    .line 21
    .line 22
    .line 23
    iput-object v1, p0, Lcd1;->m:Lu2;

    .line 24
    .line 25
    :cond_0
    iput-object p2, v1, Lu2;->n:Lhn0;

    .line 26
    .line 27
    if-nez p1, :cond_1

    .line 28
    .line 29
    iget-object p0, v0, Landroidx/appcompat/widget/Toolbar;->j:Landroidx/appcompat/widget/ActionMenuView;

    .line 30
    .line 31
    if-nez p0, :cond_1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    invoke-virtual {v0}, Landroidx/appcompat/widget/Toolbar;->f()V

    .line 35
    .line 36
    .line 37
    iget-object p0, v0, Landroidx/appcompat/widget/Toolbar;->j:Landroidx/appcompat/widget/ActionMenuView;

    .line 38
    .line 39
    iget-object p0, p0, Landroidx/appcompat/widget/ActionMenuView;->y:Lrm0;

    .line 40
    .line 41
    if-ne p0, p1, :cond_2

    .line 42
    .line 43
    :goto_0
    return-void

    .line 44
    :cond_2
    if-eqz p0, :cond_3

    .line 45
    .line 46
    iget-object p2, v0, Landroidx/appcompat/widget/Toolbar;->T:Lu2;

    .line 47
    .line 48
    invoke-virtual {p0, p2}, Lrm0;->r(Lin0;)V

    .line 49
    .line 50
    .line 51
    iget-object p2, v0, Landroidx/appcompat/widget/Toolbar;->U:Lwc1;

    .line 52
    .line 53
    invoke-virtual {p0, p2}, Lrm0;->r(Lin0;)V

    .line 54
    .line 55
    .line 56
    :cond_3
    iget-object p0, v0, Landroidx/appcompat/widget/Toolbar;->U:Lwc1;

    .line 57
    .line 58
    if-nez p0, :cond_4

    .line 59
    .line 60
    new-instance p0, Lwc1;

    .line 61
    .line 62
    invoke-direct {p0, v0}, Lwc1;-><init>(Landroidx/appcompat/widget/Toolbar;)V

    .line 63
    .line 64
    .line 65
    iput-object p0, v0, Landroidx/appcompat/widget/Toolbar;->U:Lwc1;

    .line 66
    .line 67
    :cond_4
    const/4 p0, 0x1

    .line 68
    iput-boolean p0, v1, Lu2;->z:Z

    .line 69
    .line 70
    iget-object p0, v0, Landroidx/appcompat/widget/Toolbar;->s:Landroid/content/Context;

    .line 71
    .line 72
    if-eqz p1, :cond_5

    .line 73
    .line 74
    invoke-virtual {p1, v1, p0}, Lrm0;->b(Lin0;Landroid/content/Context;)V

    .line 75
    .line 76
    .line 77
    iget-object p0, v0, Landroidx/appcompat/widget/Toolbar;->U:Lwc1;

    .line 78
    .line 79
    iget-object p2, v0, Landroidx/appcompat/widget/Toolbar;->s:Landroid/content/Context;

    .line 80
    .line 81
    invoke-virtual {p1, p0, p2}, Lrm0;->b(Lin0;Landroid/content/Context;)V

    .line 82
    .line 83
    .line 84
    goto :goto_1

    .line 85
    :cond_5
    const/4 p1, 0x0

    .line 86
    invoke-virtual {v1, p0, p1}, Lu2;->i(Landroid/content/Context;Lrm0;)V

    .line 87
    .line 88
    .line 89
    iget-object p0, v0, Landroidx/appcompat/widget/Toolbar;->U:Lwc1;

    .line 90
    .line 91
    iget-object p2, v0, Landroidx/appcompat/widget/Toolbar;->s:Landroid/content/Context;

    .line 92
    .line 93
    invoke-virtual {p0, p2, p1}, Lwc1;->i(Landroid/content/Context;Lrm0;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {v1}, Lu2;->g()V

    .line 97
    .line 98
    .line 99
    iget-object p0, v0, Landroidx/appcompat/widget/Toolbar;->U:Lwc1;

    .line 100
    .line 101
    invoke-virtual {p0}, Lwc1;->g()V

    .line 102
    .line 103
    .line 104
    :goto_1
    iget-object p0, v0, Landroidx/appcompat/widget/Toolbar;->j:Landroidx/appcompat/widget/ActionMenuView;

    .line 105
    .line 106
    iget p1, v0, Landroidx/appcompat/widget/Toolbar;->t:I

    .line 107
    .line 108
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/ActionMenuView;->setPopupTheme(I)V

    .line 109
    .line 110
    .line 111
    iget-object p0, v0, Landroidx/appcompat/widget/Toolbar;->j:Landroidx/appcompat/widget/ActionMenuView;

    .line 112
    .line 113
    invoke-virtual {p0, v1}, Landroidx/appcompat/widget/ActionMenuView;->setPresenter(Lu2;)V

    .line 114
    .line 115
    .line 116
    iput-object v1, v0, Landroidx/appcompat/widget/Toolbar;->T:Lu2;

    .line 117
    .line 118
    invoke-virtual {v0}, Landroidx/appcompat/widget/Toolbar;->t()V

    .line 119
    .line 120
    .line 121
    return-void
.end method

.method public final onApplyWindowInsets(Landroid/view/WindowInsets;)Landroid/view/WindowInsets;
    .locals 6

    .line 1
    invoke-virtual {p0}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->k()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1, p0}, Lkk1;->c(Landroid/view/WindowInsets;Landroid/view/View;)Lkk1;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    new-instance v0, Landroid/graphics/Rect;

    .line 9
    .line 10
    iget-object v1, p1, Lkk1;->a:Lhk1;

    .line 11
    .line 12
    invoke-virtual {v1}, Lhk1;->j()Lne0;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    iget v2, v2, Lne0;->a:I

    .line 17
    .line 18
    invoke-virtual {v1}, Lhk1;->j()Lne0;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    iget v3, v3, Lne0;->b:I

    .line 23
    .line 24
    invoke-virtual {v1}, Lhk1;->j()Lne0;

    .line 25
    .line 26
    .line 27
    move-result-object v4

    .line 28
    iget v4, v4, Lne0;->c:I

    .line 29
    .line 30
    invoke-virtual {v1}, Lhk1;->j()Lne0;

    .line 31
    .line 32
    .line 33
    move-result-object v5

    .line 34
    iget v5, v5, Lne0;->d:I

    .line 35
    .line 36
    invoke-direct {v0, v2, v3, v4, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 37
    .line 38
    .line 39
    iget-object v2, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->m:Landroidx/appcompat/widget/ActionBarContainer;

    .line 40
    .line 41
    const/4 v3, 0x0

    .line 42
    invoke-static {v2, v0, v3}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->g(Landroid/view/View;Landroid/graphics/Rect;Z)Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    sget-object v2, Lzh1;->a:Ljava/util/WeakHashMap;

    .line 47
    .line 48
    iget-object v2, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->v:Landroid/graphics/Rect;

    .line 49
    .line 50
    invoke-static {p0, p1, v2}, Loh1;->b(Landroid/view/View;Lkk1;Landroid/graphics/Rect;)Lkk1;

    .line 51
    .line 52
    .line 53
    iget p1, v2, Landroid/graphics/Rect;->left:I

    .line 54
    .line 55
    iget v3, v2, Landroid/graphics/Rect;->top:I

    .line 56
    .line 57
    iget v4, v2, Landroid/graphics/Rect;->right:I

    .line 58
    .line 59
    iget v5, v2, Landroid/graphics/Rect;->bottom:I

    .line 60
    .line 61
    invoke-virtual {v1, p1, v3, v4, v5}, Lhk1;->l(IIII)Lkk1;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    iput-object p1, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->z:Lkk1;

    .line 66
    .line 67
    iget-object v3, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->A:Lkk1;

    .line 68
    .line 69
    invoke-virtual {v3, p1}, Lkk1;->equals(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    const/4 v3, 0x1

    .line 74
    if-nez p1, :cond_0

    .line 75
    .line 76
    iget-object p1, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->z:Lkk1;

    .line 77
    .line 78
    iput-object p1, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->A:Lkk1;

    .line 79
    .line 80
    move v0, v3

    .line 81
    :cond_0
    iget-object p1, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->w:Landroid/graphics/Rect;

    .line 82
    .line 83
    invoke-virtual {p1, v2}, Landroid/graphics/Rect;->equals(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    move-result v4

    .line 87
    if-nez v4, :cond_1

    .line 88
    .line 89
    invoke-virtual {p1, v2}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 90
    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_1
    move v3, v0

    .line 94
    :goto_0
    if-eqz v3, :cond_2

    .line 95
    .line 96
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 97
    .line 98
    .line 99
    :cond_2
    invoke-virtual {v1}, Lhk1;->a()Lkk1;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    iget-object p0, p0, Lkk1;->a:Lhk1;

    .line 104
    .line 105
    invoke-virtual {p0}, Lhk1;->c()Lkk1;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    iget-object p0, p0, Lkk1;->a:Lhk1;

    .line 110
    .line 111
    invoke-virtual {p0}, Lhk1;->b()Lkk1;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    invoke-virtual {p0}, Lkk1;->b()Landroid/view/WindowInsets;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    return-object p0
.end method

.method public final onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->i(Landroid/content/Context;)V

    .line 9
    .line 10
    .line 11
    sget-object p1, Lzh1;->a:Ljava/util/WeakHashMap;

    .line 12
    .line 13
    invoke-static {p0}, Lmh1;->c(Landroid/view/View;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/ViewGroup;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->h()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final onLayout(ZIIII)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 10
    .line 11
    .line 12
    move-result p3

    .line 13
    const/4 p4, 0x0

    .line 14
    :goto_0
    if-ge p4, p1, :cond_1

    .line 15
    .line 16
    invoke-virtual {p0, p4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object p5

    .line 20
    invoke-virtual {p5}, Landroid/view/View;->getVisibility()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    const/16 v1, 0x8

    .line 25
    .line 26
    if-eq v0, v1, :cond_0

    .line 27
    .line 28
    invoke-virtual {p5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Ll2;

    .line 33
    .line 34
    invoke-virtual {p5}, Landroid/view/View;->getMeasuredWidth()I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    invoke-virtual {p5}, Landroid/view/View;->getMeasuredHeight()I

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    iget v3, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 43
    .line 44
    add-int/2addr v3, p2

    .line 45
    iget v0, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 46
    .line 47
    add-int/2addr v0, p3

    .line 48
    add-int/2addr v1, v3

    .line 49
    add-int/2addr v2, v0

    .line 50
    invoke-virtual {p5, v3, v0, v1, v2}, Landroid/view/View;->layout(IIII)V

    .line 51
    .line 52
    .line 53
    :cond_0
    add-int/lit8 p4, p4, 0x1

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_1
    return-void
.end method

.method public final onMeasure(II)V
    .locals 12

    .line 1
    invoke-virtual {p0}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->k()V

    .line 2
    .line 3
    .line 4
    iget-object v1, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->m:Landroidx/appcompat/widget/ActionBarContainer;

    .line 5
    .line 6
    const/4 v3, 0x0

    .line 7
    const/4 v5, 0x0

    .line 8
    move-object v0, p0

    .line 9
    move v2, p1

    .line 10
    move v4, p2

    .line 11
    invoke-virtual/range {v0 .. v5}, Landroid/view/ViewGroup;->measureChildWithMargins(Landroid/view/View;IIII)V

    .line 12
    .line 13
    .line 14
    iget-object p0, v0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->m:Landroidx/appcompat/widget/ActionBarContainer;

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Ll2;

    .line 21
    .line 22
    iget-object p1, v0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->m:Landroidx/appcompat/widget/ActionBarContainer;

    .line 23
    .line 24
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    iget p2, p0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 29
    .line 30
    add-int/2addr p1, p2

    .line 31
    iget p2, p0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 32
    .line 33
    add-int/2addr p1, p2

    .line 34
    const/4 p2, 0x0

    .line 35
    invoke-static {p2, p1}, Ljava/lang/Math;->max(II)I

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    iget-object v1, v0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->m:Landroidx/appcompat/widget/ActionBarContainer;

    .line 40
    .line 41
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredHeight()I

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    iget v3, p0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 46
    .line 47
    add-int/2addr v1, v3

    .line 48
    iget p0, p0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 49
    .line 50
    add-int/2addr v1, p0

    .line 51
    invoke-static {p2, v1}, Ljava/lang/Math;->max(II)I

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    iget-object v1, v0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->m:Landroidx/appcompat/widget/ActionBarContainer;

    .line 56
    .line 57
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredState()I

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    invoke-static {p2, v1}, Landroid/view/View;->combineMeasuredStates(II)I

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    sget-object v3, Lzh1;->a:Ljava/util/WeakHashMap;

    .line 66
    .line 67
    invoke-virtual {v0}, Landroid/view/View;->getWindowSystemUiVisibility()I

    .line 68
    .line 69
    .line 70
    move-result v3

    .line 71
    and-int/lit16 v3, v3, 0x100

    .line 72
    .line 73
    const/4 v5, 0x1

    .line 74
    if-eqz v3, :cond_0

    .line 75
    .line 76
    move v3, v5

    .line 77
    goto :goto_0

    .line 78
    :cond_0
    move v3, p2

    .line 79
    :goto_0
    if-eqz v3, :cond_1

    .line 80
    .line 81
    iget v6, v0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->j:I

    .line 82
    .line 83
    iget-boolean v7, v0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->q:Z

    .line 84
    .line 85
    if-eqz v7, :cond_3

    .line 86
    .line 87
    iget-object v7, v0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->m:Landroidx/appcompat/widget/ActionBarContainer;

    .line 88
    .line 89
    invoke-virtual {v7}, Landroidx/appcompat/widget/ActionBarContainer;->getTabContainer()Landroid/view/View;

    .line 90
    .line 91
    .line 92
    move-result-object v7

    .line 93
    if-eqz v7, :cond_3

    .line 94
    .line 95
    iget v7, v0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->j:I

    .line 96
    .line 97
    add-int/2addr v6, v7

    .line 98
    goto :goto_1

    .line 99
    :cond_1
    iget-object v6, v0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->m:Landroidx/appcompat/widget/ActionBarContainer;

    .line 100
    .line 101
    invoke-virtual {v6}, Landroid/view/View;->getVisibility()I

    .line 102
    .line 103
    .line 104
    move-result v6

    .line 105
    const/16 v7, 0x8

    .line 106
    .line 107
    if-eq v6, v7, :cond_2

    .line 108
    .line 109
    iget-object v6, v0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->m:Landroidx/appcompat/widget/ActionBarContainer;

    .line 110
    .line 111
    invoke-virtual {v6}, Landroid/view/View;->getMeasuredHeight()I

    .line 112
    .line 113
    .line 114
    move-result v6

    .line 115
    goto :goto_1

    .line 116
    :cond_2
    move v6, p2

    .line 117
    :cond_3
    :goto_1
    iget-object v7, v0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->v:Landroid/graphics/Rect;

    .line 118
    .line 119
    iget-object v8, v0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->x:Landroid/graphics/Rect;

    .line 120
    .line 121
    invoke-virtual {v8, v7}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 122
    .line 123
    .line 124
    iget-object v7, v0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->z:Lkk1;

    .line 125
    .line 126
    iput-object v7, v0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->B:Lkk1;

    .line 127
    .line 128
    iget-boolean v7, v0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->p:Z

    .line 129
    .line 130
    if-nez v7, :cond_4

    .line 131
    .line 132
    if-nez v3, :cond_4

    .line 133
    .line 134
    iget-object v3, v0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->K:Lm2;

    .line 135
    .line 136
    sget-object v7, Landroidx/appcompat/widget/ActionBarOverlayLayout;->M:Lkk1;

    .line 137
    .line 138
    iget-object v9, v0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->y:Landroid/graphics/Rect;

    .line 139
    .line 140
    invoke-static {v3, v7, v9}, Loh1;->b(Landroid/view/View;Lkk1;Landroid/graphics/Rect;)Lkk1;

    .line 141
    .line 142
    .line 143
    sget-object v3, Landroidx/appcompat/widget/ActionBarOverlayLayout;->N:Landroid/graphics/Rect;

    .line 144
    .line 145
    invoke-virtual {v9, v3}, Landroid/graphics/Rect;->equals(Ljava/lang/Object;)Z

    .line 146
    .line 147
    .line 148
    move-result v3

    .line 149
    if-nez v3, :cond_4

    .line 150
    .line 151
    iget v3, v8, Landroid/graphics/Rect;->top:I

    .line 152
    .line 153
    add-int/2addr v3, v6

    .line 154
    iput v3, v8, Landroid/graphics/Rect;->top:I

    .line 155
    .line 156
    iget v3, v8, Landroid/graphics/Rect;->bottom:I

    .line 157
    .line 158
    iput v3, v8, Landroid/graphics/Rect;->bottom:I

    .line 159
    .line 160
    iget-object v3, v0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->B:Lkk1;

    .line 161
    .line 162
    iget-object v3, v3, Lkk1;->a:Lhk1;

    .line 163
    .line 164
    invoke-virtual {v3, p2, v6, p2, p2}, Lhk1;->l(IIII)Lkk1;

    .line 165
    .line 166
    .line 167
    move-result-object p2

    .line 168
    iput-object p2, v0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->B:Lkk1;

    .line 169
    .line 170
    goto :goto_3

    .line 171
    :cond_4
    iget-object p2, v0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->B:Lkk1;

    .line 172
    .line 173
    iget-object p2, p2, Lkk1;->a:Lhk1;

    .line 174
    .line 175
    invoke-virtual {p2}, Lhk1;->j()Lne0;

    .line 176
    .line 177
    .line 178
    move-result-object p2

    .line 179
    iget p2, p2, Lne0;->a:I

    .line 180
    .line 181
    iget-object v3, v0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->B:Lkk1;

    .line 182
    .line 183
    iget-object v3, v3, Lkk1;->a:Lhk1;

    .line 184
    .line 185
    invoke-virtual {v3}, Lhk1;->j()Lne0;

    .line 186
    .line 187
    .line 188
    move-result-object v3

    .line 189
    iget v3, v3, Lne0;->b:I

    .line 190
    .line 191
    add-int/2addr v3, v6

    .line 192
    iget-object v6, v0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->B:Lkk1;

    .line 193
    .line 194
    iget-object v6, v6, Lkk1;->a:Lhk1;

    .line 195
    .line 196
    invoke-virtual {v6}, Lhk1;->j()Lne0;

    .line 197
    .line 198
    .line 199
    move-result-object v6

    .line 200
    iget v6, v6, Lne0;->c:I

    .line 201
    .line 202
    iget-object v7, v0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->B:Lkk1;

    .line 203
    .line 204
    iget-object v7, v7, Lkk1;->a:Lhk1;

    .line 205
    .line 206
    invoke-virtual {v7}, Lhk1;->j()Lne0;

    .line 207
    .line 208
    .line 209
    move-result-object v7

    .line 210
    iget v7, v7, Lne0;->d:I

    .line 211
    .line 212
    invoke-static {p2, v3, v6, v7}, Lne0;->a(IIII)Lne0;

    .line 213
    .line 214
    .line 215
    move-result-object p2

    .line 216
    iget-object v3, v0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->B:Lkk1;

    .line 217
    .line 218
    sget v6, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 219
    .line 220
    const/16 v7, 0x1e

    .line 221
    .line 222
    if-lt v6, v7, :cond_5

    .line 223
    .line 224
    new-instance v6, Lak1;

    .line 225
    .line 226
    invoke-direct {v6, v3}, Lak1;-><init>(Lkk1;)V

    .line 227
    .line 228
    .line 229
    goto :goto_2

    .line 230
    :cond_5
    const/16 v7, 0x1d

    .line 231
    .line 232
    if-lt v6, v7, :cond_6

    .line 233
    .line 234
    new-instance v6, Lzj1;

    .line 235
    .line 236
    invoke-direct {v6, v3}, Lzj1;-><init>(Lkk1;)V

    .line 237
    .line 238
    .line 239
    goto :goto_2

    .line 240
    :cond_6
    new-instance v6, Lxj1;

    .line 241
    .line 242
    invoke-direct {v6, v3}, Lxj1;-><init>(Lkk1;)V

    .line 243
    .line 244
    .line 245
    :goto_2
    invoke-virtual {v6, p2}, Lbk1;->d(Lne0;)V

    .line 246
    .line 247
    .line 248
    invoke-virtual {v6}, Lbk1;->b()Lkk1;

    .line 249
    .line 250
    .line 251
    move-result-object p2

    .line 252
    iput-object p2, v0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->B:Lkk1;

    .line 253
    .line 254
    :goto_3
    iget-object p2, v0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->l:Landroidx/appcompat/widget/ContentFrameLayout;

    .line 255
    .line 256
    invoke-static {p2, v8, v5}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->g(Landroid/view/View;Landroid/graphics/Rect;Z)Z

    .line 257
    .line 258
    .line 259
    iget-object p2, v0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->C:Lkk1;

    .line 260
    .line 261
    iget-object v3, v0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->B:Lkk1;

    .line 262
    .line 263
    invoke-virtual {p2, v3}, Lkk1;->equals(Ljava/lang/Object;)Z

    .line 264
    .line 265
    .line 266
    move-result p2

    .line 267
    if-nez p2, :cond_7

    .line 268
    .line 269
    iget-object p2, v0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->B:Lkk1;

    .line 270
    .line 271
    iput-object p2, v0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->C:Lkk1;

    .line 272
    .line 273
    iget-object v3, v0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->l:Landroidx/appcompat/widget/ContentFrameLayout;

    .line 274
    .line 275
    invoke-virtual {p2}, Lkk1;->b()Landroid/view/WindowInsets;

    .line 276
    .line 277
    .line 278
    move-result-object p2

    .line 279
    if-eqz p2, :cond_7

    .line 280
    .line 281
    invoke-static {v3, p2}, Lmh1;->a(Landroid/view/View;Landroid/view/WindowInsets;)Landroid/view/WindowInsets;

    .line 282
    .line 283
    .line 284
    move-result-object v5

    .line 285
    invoke-virtual {v5, p2}, Landroid/view/WindowInsets;->equals(Ljava/lang/Object;)Z

    .line 286
    .line 287
    .line 288
    move-result p2

    .line 289
    if-nez p2, :cond_7

    .line 290
    .line 291
    invoke-static {v5, v3}, Lkk1;->c(Landroid/view/WindowInsets;Landroid/view/View;)Lkk1;

    .line 292
    .line 293
    .line 294
    :cond_7
    iget-object v7, v0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->l:Landroidx/appcompat/widget/ContentFrameLayout;

    .line 295
    .line 296
    const/4 v9, 0x0

    .line 297
    const/4 v11, 0x0

    .line 298
    move-object v6, v0

    .line 299
    move v8, v2

    .line 300
    move v10, v4

    .line 301
    invoke-virtual/range {v6 .. v11}, Landroid/view/ViewGroup;->measureChildWithMargins(Landroid/view/View;IIII)V

    .line 302
    .line 303
    .line 304
    iget-object p2, v0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->l:Landroidx/appcompat/widget/ContentFrameLayout;

    .line 305
    .line 306
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 307
    .line 308
    .line 309
    move-result-object p2

    .line 310
    check-cast p2, Ll2;

    .line 311
    .line 312
    iget-object v3, v0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->l:Landroidx/appcompat/widget/ContentFrameLayout;

    .line 313
    .line 314
    invoke-virtual {v3}, Landroid/view/View;->getMeasuredWidth()I

    .line 315
    .line 316
    .line 317
    move-result v3

    .line 318
    iget v5, p2, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 319
    .line 320
    add-int/2addr v3, v5

    .line 321
    iget v5, p2, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 322
    .line 323
    add-int/2addr v3, v5

    .line 324
    invoke-static {p1, v3}, Ljava/lang/Math;->max(II)I

    .line 325
    .line 326
    .line 327
    move-result p1

    .line 328
    iget-object v3, v0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->l:Landroidx/appcompat/widget/ContentFrameLayout;

    .line 329
    .line 330
    invoke-virtual {v3}, Landroid/view/View;->getMeasuredHeight()I

    .line 331
    .line 332
    .line 333
    move-result v3

    .line 334
    iget v5, p2, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 335
    .line 336
    add-int/2addr v3, v5

    .line 337
    iget p2, p2, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 338
    .line 339
    add-int/2addr v3, p2

    .line 340
    invoke-static {p0, v3}, Ljava/lang/Math;->max(II)I

    .line 341
    .line 342
    .line 343
    move-result p0

    .line 344
    iget-object p2, v0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->l:Landroidx/appcompat/widget/ContentFrameLayout;

    .line 345
    .line 346
    invoke-virtual {p2}, Landroid/view/View;->getMeasuredState()I

    .line 347
    .line 348
    .line 349
    move-result p2

    .line 350
    invoke-static {v1, p2}, Landroid/view/View;->combineMeasuredStates(II)I

    .line 351
    .line 352
    .line 353
    move-result p2

    .line 354
    invoke-virtual {v0}, Landroid/view/View;->getPaddingLeft()I

    .line 355
    .line 356
    .line 357
    move-result v1

    .line 358
    invoke-virtual {v0}, Landroid/view/View;->getPaddingRight()I

    .line 359
    .line 360
    .line 361
    move-result v3

    .line 362
    add-int/2addr v3, v1

    .line 363
    add-int/2addr v3, p1

    .line 364
    invoke-virtual {v0}, Landroid/view/View;->getPaddingTop()I

    .line 365
    .line 366
    .line 367
    move-result p1

    .line 368
    invoke-virtual {v0}, Landroid/view/View;->getPaddingBottom()I

    .line 369
    .line 370
    .line 371
    move-result v1

    .line 372
    add-int/2addr v1, p1

    .line 373
    add-int/2addr v1, p0

    .line 374
    invoke-virtual {v0}, Landroid/view/View;->getSuggestedMinimumHeight()I

    .line 375
    .line 376
    .line 377
    move-result p0

    .line 378
    invoke-static {v1, p0}, Ljava/lang/Math;->max(II)I

    .line 379
    .line 380
    .line 381
    move-result p0

    .line 382
    invoke-virtual {v0}, Landroid/view/View;->getSuggestedMinimumWidth()I

    .line 383
    .line 384
    .line 385
    move-result p1

    .line 386
    invoke-static {v3, p1}, Ljava/lang/Math;->max(II)I

    .line 387
    .line 388
    .line 389
    move-result p1

    .line 390
    invoke-static {p1, v2, p2}, Landroid/view/View;->resolveSizeAndState(III)I

    .line 391
    .line 392
    .line 393
    move-result p1

    .line 394
    shl-int/lit8 p2, p2, 0x10

    .line 395
    .line 396
    invoke-static {p0, v4, p2}, Landroid/view/View;->resolveSizeAndState(III)I

    .line 397
    .line 398
    .line 399
    move-result p0

    .line 400
    invoke-virtual {v0, p1, p0}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 401
    .line 402
    .line 403
    return-void
.end method

.method public final onNestedFling(Landroid/view/View;FFZ)Z
    .locals 9

    .line 1
    iget-boolean p1, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->r:Z

    .line 2
    .line 3
    if-eqz p1, :cond_2

    .line 4
    .line 5
    if-nez p4, :cond_0

    .line 6
    .line 7
    goto :goto_1

    .line 8
    :cond_0
    iget-object v0, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->E:Landroid/widget/OverScroller;

    .line 9
    .line 10
    float-to-int v4, p3

    .line 11
    const/high16 v7, -0x80000000

    .line 12
    .line 13
    const v8, 0x7fffffff

    .line 14
    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    const/4 v2, 0x0

    .line 18
    const/4 v3, 0x0

    .line 19
    const/4 v5, 0x0

    .line 20
    const/4 v6, 0x0

    .line 21
    invoke-virtual/range {v0 .. v8}, Landroid/widget/OverScroller;->fling(IIIIIIII)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->E:Landroid/widget/OverScroller;

    .line 25
    .line 26
    invoke-virtual {p1}, Landroid/widget/OverScroller;->getFinalY()I

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    iget-object p2, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->m:Landroidx/appcompat/widget/ActionBarContainer;

    .line 31
    .line 32
    invoke-virtual {p2}, Landroid/view/View;->getHeight()I

    .line 33
    .line 34
    .line 35
    move-result p2

    .line 36
    if-le p1, p2, :cond_1

    .line 37
    .line 38
    invoke-virtual {p0}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->h()V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->I:Lj2;

    .line 42
    .line 43
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    invoke-virtual {p0}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->h()V

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->H:Li2;

    .line 51
    .line 52
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 53
    .line 54
    .line 55
    :goto_0
    const/4 p1, 0x1

    .line 56
    iput-boolean p1, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->s:Z

    .line 57
    .line 58
    return p1

    .line 59
    :cond_2
    :goto_1
    const/4 p0, 0x0

    .line 60
    return p0
.end method

.method public final onNestedPreFling(Landroid/view/View;FF)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public final onNestedPreScroll(Landroid/view/View;II[I)V
    .locals 0

    .line 1
    return-void
.end method

.method public final onNestedScroll(Landroid/view/View;IIII)V
    .locals 0

    .line 1
    iget p1, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->t:I

    .line 2
    .line 3
    add-int/2addr p1, p3

    .line 4
    iput p1, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->t:I

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->setActionBarHideOffset(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final onNestedScrollAccepted(Landroid/view/View;Landroid/view/View;I)V
    .locals 0

    .line 1
    iget-object p1, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->J:Ltw0;

    .line 2
    .line 3
    iput p3, p1, Ltw0;->b:I

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->getActionBarHideOffset()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    iput p1, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->t:I

    .line 10
    .line 11
    invoke-virtual {p0}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->h()V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->D:Lk2;

    .line 15
    .line 16
    if-eqz p0, :cond_0

    .line 17
    .line 18
    check-cast p0, Lvj1;

    .line 19
    .line 20
    iget-object p1, p0, Lvj1;->s:Lni1;

    .line 21
    .line 22
    if-eqz p1, :cond_0

    .line 23
    .line 24
    invoke-virtual {p1}, Lni1;->a()V

    .line 25
    .line 26
    .line 27
    const/4 p1, 0x0

    .line 28
    iput-object p1, p0, Lvj1;->s:Lni1;

    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public final onStartNestedScroll(Landroid/view/View;Landroid/view/View;I)Z
    .locals 0

    .line 1
    and-int/lit8 p1, p3, 0x2

    .line 2
    .line 3
    if-eqz p1, :cond_1

    .line 4
    .line 5
    iget-object p1, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->m:Landroidx/appcompat/widget/ActionBarContainer;

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-boolean p0, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->r:Z

    .line 15
    .line 16
    return p0

    .line 17
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public final onStopNestedScroll(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-boolean p1, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->r:Z

    .line 2
    .line 3
    if-eqz p1, :cond_1

    .line 4
    .line 5
    iget-boolean p1, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->s:Z

    .line 6
    .line 7
    if-nez p1, :cond_1

    .line 8
    .line 9
    iget p1, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->t:I

    .line 10
    .line 11
    iget-object v0, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->m:Landroidx/appcompat/widget/ActionBarContainer;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const-wide/16 v1, 0x258

    .line 18
    .line 19
    if-gt p1, v0, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->h()V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->H:Li2;

    .line 25
    .line 26
    invoke-virtual {p0, p1, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    invoke-virtual {p0}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->h()V

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->I:Lj2;

    .line 34
    .line 35
    invoke-virtual {p0, p1, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 36
    .line 37
    .line 38
    :cond_1
    :goto_0
    return-void
.end method

.method public final onWindowSystemUiVisibilityChanged(I)V
    .locals 6

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onWindowSystemUiVisibilityChanged(I)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->k()V

    .line 5
    .line 6
    .line 7
    iget v0, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->u:I

    .line 8
    .line 9
    xor-int/2addr v0, p1

    .line 10
    iput p1, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->u:I

    .line 11
    .line 12
    and-int/lit8 v1, p1, 0x4

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    const/4 v3, 0x1

    .line 16
    if-nez v1, :cond_0

    .line 17
    .line 18
    move v1, v3

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    move v1, v2

    .line 21
    :goto_0
    and-int/lit16 p1, p1, 0x100

    .line 22
    .line 23
    if-eqz p1, :cond_1

    .line 24
    .line 25
    move p1, v3

    .line 26
    goto :goto_1

    .line 27
    :cond_1
    move p1, v2

    .line 28
    :goto_1
    iget-object v4, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->D:Lk2;

    .line 29
    .line 30
    if-eqz v4, :cond_4

    .line 31
    .line 32
    xor-int/lit8 v5, p1, 0x1

    .line 33
    .line 34
    check-cast v4, Lvj1;

    .line 35
    .line 36
    iput-boolean v5, v4, Lvj1;->o:Z

    .line 37
    .line 38
    if-nez v1, :cond_3

    .line 39
    .line 40
    if-nez p1, :cond_2

    .line 41
    .line 42
    goto :goto_2

    .line 43
    :cond_2
    iget-boolean p1, v4, Lvj1;->p:Z

    .line 44
    .line 45
    if-nez p1, :cond_4

    .line 46
    .line 47
    iput-boolean v3, v4, Lvj1;->p:Z

    .line 48
    .line 49
    invoke-virtual {v4, v3}, Lvj1;->f(Z)V

    .line 50
    .line 51
    .line 52
    goto :goto_3

    .line 53
    :cond_3
    :goto_2
    iget-boolean p1, v4, Lvj1;->p:Z

    .line 54
    .line 55
    if-eqz p1, :cond_4

    .line 56
    .line 57
    iput-boolean v2, v4, Lvj1;->p:Z

    .line 58
    .line 59
    invoke-virtual {v4, v3}, Lvj1;->f(Z)V

    .line 60
    .line 61
    .line 62
    :cond_4
    :goto_3
    and-int/lit16 p1, v0, 0x100

    .line 63
    .line 64
    if-eqz p1, :cond_5

    .line 65
    .line 66
    iget-object p1, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->D:Lk2;

    .line 67
    .line 68
    if-eqz p1, :cond_5

    .line 69
    .line 70
    sget-object p1, Lzh1;->a:Ljava/util/WeakHashMap;

    .line 71
    .line 72
    invoke-static {p0}, Lmh1;->c(Landroid/view/View;)V

    .line 73
    .line 74
    .line 75
    :cond_5
    return-void
.end method

.method public final onWindowVisibilityChanged(I)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onWindowVisibilityChanged(I)V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->k:I

    .line 5
    .line 6
    iget-object p0, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->D:Lk2;

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    check-cast p0, Lvj1;

    .line 11
    .line 12
    iput p1, p0, Lvj1;->n:I

    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public setActionBarHideOffset(I)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->h()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->m:Landroidx/appcompat/widget/ActionBarContainer;

    .line 5
    .line 6
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    invoke-static {v1, p1}, Ljava/lang/Math;->max(II)I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    iget-object p0, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->m:Landroidx/appcompat/widget/ActionBarContainer;

    .line 20
    .line 21
    neg-int p1, p1

    .line 22
    int-to-float p1, p1

    .line 23
    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationY(F)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public setActionBarVisibilityCallback(Lk2;)V
    .locals 1

    .line 1
    iput-object p1, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->D:Lk2;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->D:Lk2;

    .line 10
    .line 11
    iget v0, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->k:I

    .line 12
    .line 13
    check-cast p1, Lvj1;

    .line 14
    .line 15
    iput v0, p1, Lvj1;->n:I

    .line 16
    .line 17
    iget p1, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->u:I

    .line 18
    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->onWindowSystemUiVisibilityChanged(I)V

    .line 22
    .line 23
    .line 24
    sget-object p1, Lzh1;->a:Ljava/util/WeakHashMap;

    .line 25
    .line 26
    invoke-static {p0}, Lmh1;->c(Landroid/view/View;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public setHasNonEmbeddedTabs(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->q:Z

    .line 2
    .line 3
    return-void
.end method

.method public setHideOnContentScrollEnabled(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->r:Z

    .line 2
    .line 3
    if-eq p1, v0, :cond_0

    .line 4
    .line 5
    iput-boolean p1, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->r:Z

    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->h()V

    .line 10
    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->setActionBarHideOffset(I)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public setIcon(I)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->k()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->n:Lcv;

    .line 5
    .line 6
    check-cast p0, Lcd1;

    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Lcd1;->a:Landroidx/appcompat/widget/Toolbar;

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {v0, p1}, Lrs0;->g(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const/4 p1, 0x0

    .line 22
    :goto_0
    iput-object p1, p0, Lcd1;->d:Landroid/graphics/drawable/Drawable;

    .line 23
    .line 24
    invoke-virtual {p0}, Lcd1;->c()V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public setIcon(Landroid/graphics/drawable/Drawable;)V
    .locals 0

    .line 28
    invoke-virtual {p0}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->k()V

    .line 29
    iget-object p0, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->n:Lcv;

    check-cast p0, Lcd1;

    .line 30
    iput-object p1, p0, Lcd1;->d:Landroid/graphics/drawable/Drawable;

    .line 31
    invoke-virtual {p0}, Lcd1;->c()V

    return-void
.end method

.method public setLogo(I)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->k()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->n:Lcv;

    .line 5
    .line 6
    check-cast p0, Lcd1;

    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Lcd1;->a:Landroidx/appcompat/widget/Toolbar;

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {v0, p1}, Lrs0;->g(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const/4 p1, 0x0

    .line 22
    :goto_0
    iput-object p1, p0, Lcd1;->e:Landroid/graphics/drawable/Drawable;

    .line 23
    .line 24
    invoke-virtual {p0}, Lcd1;->c()V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public setOverlayMode(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->p:Z

    .line 2
    .line 3
    return-void
.end method

.method public setShowingForActionMode(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public setUiOptions(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public setWindowCallback(Landroid/view/Window$Callback;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->k()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->n:Lcv;

    .line 5
    .line 6
    check-cast p0, Lcd1;

    .line 7
    .line 8
    iput-object p1, p0, Lcd1;->k:Landroid/view/Window$Callback;

    .line 9
    .line 10
    return-void
.end method

.method public setWindowTitle(Ljava/lang/CharSequence;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->k()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->n:Lcv;

    .line 5
    .line 6
    check-cast p0, Lcd1;

    .line 7
    .line 8
    iget-boolean v0, p0, Lcd1;->g:Z

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcd1;->a:Landroidx/appcompat/widget/Toolbar;

    .line 13
    .line 14
    iput-object p1, p0, Lcd1;->h:Ljava/lang/CharSequence;

    .line 15
    .line 16
    iget v1, p0, Lcd1;->b:I

    .line 17
    .line 18
    and-int/lit8 v1, v1, 0x8

    .line 19
    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/Toolbar;->setTitle(Ljava/lang/CharSequence;)V

    .line 23
    .line 24
    .line 25
    iget-boolean p0, p0, Lcd1;->g:Z

    .line 26
    .line 27
    if-eqz p0, :cond_0

    .line 28
    .line 29
    invoke-virtual {v0}, Landroid/view/View;->getRootView()Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-static {p0, p1}, Lzh1;->j(Landroid/view/View;Ljava/lang/CharSequence;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method

.method public final shouldDelayChildPressedState()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method
