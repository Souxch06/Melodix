.class public Lcom/google/android/material/carousel/CarouselLayoutManager;
.super Lpy0;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public o:I

.field public p:Laj;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 22
    invoke-direct {p0}, Lpy0;-><init>()V

    .line 23
    new-instance v0, Lzi;

    invoke-direct {v0}, Lzi;-><init>()V

    .line 24
    invoke-virtual {p0}, Lpy0;->g0()V

    const/4 v0, 0x0

    .line 25
    invoke-virtual {p0, v0}, Lcom/google/android/material/carousel/CarouselLayoutManager;->w0(I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lpy0;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lzi;

    .line 5
    .line 6
    invoke-direct {v0}, Lzi;-><init>()V

    .line 7
    .line 8
    .line 9
    invoke-static {p1, p2, p3, p4}, Lpy0;->E(Landroid/content/Context;Landroid/util/AttributeSet;II)Loy0;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iget p1, p1, Loy0;->a:I

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Lcom/google/android/material/carousel/CarouselLayoutManager;->w0(I)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Lpy0;->g0()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static s0(Ljava/util/List;FZ)Lok0;
    .locals 13

    .line 1
    const/4 v0, -0x1

    .line 2
    const v1, 0x7f7fffff    # Float.MAX_VALUE

    .line 3
    .line 4
    .line 5
    const v2, -0x800001

    .line 6
    .line 7
    .line 8
    const/4 v3, 0x0

    .line 9
    move v6, v0

    .line 10
    move v7, v6

    .line 11
    move v8, v7

    .line 12
    move v9, v8

    .line 13
    move v4, v2

    .line 14
    move v5, v3

    .line 15
    move v2, v1

    .line 16
    move v3, v2

    .line 17
    :goto_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 18
    .line 19
    .line 20
    move-result v10

    .line 21
    if-ge v5, v10, :cond_4

    .line 22
    .line 23
    invoke-interface {p0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v10

    .line 27
    check-cast v10, Lfh0;

    .line 28
    .line 29
    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 30
    .line 31
    .line 32
    const/4 v10, 0x0

    .line 33
    sub-float v11, v10, p1

    .line 34
    .line 35
    invoke-static {v11}, Ljava/lang/Math;->abs(F)F

    .line 36
    .line 37
    .line 38
    move-result v11

    .line 39
    cmpg-float v12, v10, p1

    .line 40
    .line 41
    if-gtz v12, :cond_0

    .line 42
    .line 43
    cmpg-float v12, v11, v1

    .line 44
    .line 45
    if-gtz v12, :cond_0

    .line 46
    .line 47
    move v6, v5

    .line 48
    move v1, v11

    .line 49
    :cond_0
    cmpl-float v12, v10, p1

    .line 50
    .line 51
    if-lez v12, :cond_1

    .line 52
    .line 53
    cmpg-float v12, v11, v2

    .line 54
    .line 55
    if-gtz v12, :cond_1

    .line 56
    .line 57
    move v8, v5

    .line 58
    move v2, v11

    .line 59
    :cond_1
    cmpg-float v11, v10, v3

    .line 60
    .line 61
    if-gtz v11, :cond_2

    .line 62
    .line 63
    move v7, v5

    .line 64
    move v3, v10

    .line 65
    :cond_2
    cmpl-float v11, v10, v4

    .line 66
    .line 67
    if-lez v11, :cond_3

    .line 68
    .line 69
    move v9, v5

    .line 70
    move v4, v10

    .line 71
    :cond_3
    add-int/lit8 v5, v5, 0x1

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_4
    if-ne v6, v0, :cond_5

    .line 75
    .line 76
    move v6, v7

    .line 77
    :cond_5
    if-ne v8, v0, :cond_6

    .line 78
    .line 79
    move v8, v9

    .line 80
    :cond_6
    new-instance p1, Lok0;

    .line 81
    .line 82
    invoke-interface {p0, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object p2

    .line 86
    check-cast p2, Lfh0;

    .line 87
    .line 88
    invoke-interface {p0, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    check-cast p0, Lfh0;

    .line 93
    .line 94
    invoke-direct {p1, p2, p0}, Lok0;-><init>(Lfh0;Lfh0;)V

    .line 95
    .line 96
    .line 97
    return-object p1
.end method


# virtual methods
.method public final O(Landroid/view/accessibility/AccessibilityEvent;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lpy0;->O(Landroid/view/accessibility/AccessibilityEvent;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lpy0;->u()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-lez v0, :cond_0

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    invoke-virtual {p0, v0}, Lpy0;->t(I)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Lpy0;->D(Landroid/view/View;)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityRecord;->setFromIndex(I)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Lpy0;->u()I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    add-int/lit8 v0, v0, -0x1

    .line 27
    .line 28
    invoke-virtual {p0, v0}, Lpy0;->t(I)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-static {p0}, Lpy0;->D(Landroid/view/View;)I

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    invoke-virtual {p1, p0}, Landroid/view/accessibility/AccessibilityRecord;->setToIndex(I)V

    .line 37
    .line 38
    .line 39
    :cond_0
    return-void
.end method

.method public final W(Lvy0;Lzy0;)V
    .locals 2

    .line 1
    invoke-virtual {p2}, Lzy0;->b()I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-gtz p2, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lpy0;->b0(Lvy0;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {p0}, Lcom/google/android/material/carousel/CarouselLayoutManager;->u0()Z

    .line 12
    .line 13
    .line 14
    const-wide v0, 0x7fffffffffffffffL

    .line 15
    .line 16
    .line 17
    .line 18
    .line 19
    const/4 p0, 0x0

    .line 20
    invoke-virtual {p1, p0, v0, v1}, Lvy0;->i(IJ)Lmu0;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    iget-object p0, p0, Lmu0;->a:Landroid/view/View;

    .line 25
    .line 26
    const-string p0, "All children of a RecyclerView using CarouselLayoutManager must use MaskableFrameLayout as their root ViewGroup."

    .line 27
    .line 28
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final X(Lzy0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lpy0;->u()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const/4 p1, 0x0

    .line 9
    invoke-virtual {p0, p1}, Lpy0;->t(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p0}, Lpy0;->D(Landroid/view/View;)I

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final c()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/carousel/CarouselLayoutManager;->t0()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public final d()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/carousel/CarouselLayoutManager;->t0()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    return p0
.end method

.method public final f0(Landroidx/recyclerview/widget/RecyclerView;Landroid/view/View;Landroid/graphics/Rect;ZZ)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public final h0(ILvy0;Lzy0;)I
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/carousel/CarouselLayoutManager;->t0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, p1, p2, p3}, Lcom/google/android/material/carousel/CarouselLayoutManager;->v0(ILvy0;Lzy0;)I

    .line 9
    .line 10
    .line 11
    :cond_0
    return v1
.end method

.method public final i(Lzy0;)I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    throw p0
.end method

.method public final i0(ILvy0;Lzy0;)I
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/carousel/CarouselLayoutManager;->d()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, p1, p2, p3}, Lcom/google/android/material/carousel/CarouselLayoutManager;->v0(ILvy0;Lzy0;)I

    .line 9
    .line 10
    .line 11
    :cond_0
    return v1
.end method

.method public final j(Lzy0;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->o:I

    .line 2
    .line 3
    return p0
.end method

.method public final k(Lzy0;)I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    rsub-int/lit8 p0, p0, 0x0

    .line 3
    .line 4
    return p0
.end method

.method public final l(Lzy0;)I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    throw p0
.end method

.method public final m(Lzy0;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->o:I

    .line 2
    .line 3
    return p0
.end method

.method public final n(Lzy0;)I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    rsub-int/lit8 p0, p0, 0x0

    .line 3
    .line 4
    return p0
.end method

.method public final q()Lqy0;
    .locals 1

    .line 1
    new-instance p0, Lqy0;

    .line 2
    .line 3
    const/4 v0, -0x2

    .line 4
    invoke-direct {p0, v0, v0}, Lqy0;-><init>(II)V

    .line 5
    .line 6
    .line 7
    return-object p0
.end method

.method public final t0()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->p:Laj;

    .line 2
    .line 3
    iget p0, p0, Laj;->a:I

    .line 4
    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public final u0()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/carousel/CarouselLayoutManager;->t0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lpy0;->y()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    const/4 v0, 0x1

    .line 12
    if-ne p0, v0, :cond_0

    .line 13
    .line 14
    return v0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public final v0(ILvy0;Lzy0;)I
    .locals 0

    .line 1
    invoke-virtual {p0}, Lpy0;->u()I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_3

    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget p2, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->o:I

    .line 11
    .line 12
    add-int p3, p2, p1

    .line 13
    .line 14
    if-ltz p3, :cond_1

    .line 15
    .line 16
    if-lez p3, :cond_2

    .line 17
    .line 18
    :cond_1
    rsub-int/lit8 p1, p2, 0x0

    .line 19
    .line 20
    :cond_2
    add-int/2addr p2, p1

    .line 21
    iput p2, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->o:I

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/google/android/material/carousel/CarouselLayoutManager;->u0()Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    const/4 p1, 0x0

    .line 28
    throw p1

    .line 29
    :cond_3
    :goto_0
    const/4 p0, 0x0

    .line 30
    return p0
.end method

.method public final w0(I)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    if-eqz p1, :cond_1

    .line 3
    .line 4
    if-ne p1, v0, :cond_0

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const-string p0, "invalid orientation:"

    .line 8
    .line 9
    invoke-static {p1, p0}, Loq;->f(ILjava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_1
    :goto_0
    const/4 v1, 0x0

    .line 18
    invoke-virtual {p0, v1}, Lpy0;->b(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->p:Laj;

    .line 22
    .line 23
    if-eqz v1, :cond_3

    .line 24
    .line 25
    iget v1, v1, Laj;->a:I

    .line 26
    .line 27
    if-eq p1, v1, :cond_2

    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_2
    return-void

    .line 31
    :cond_3
    :goto_1
    if-eqz p1, :cond_5

    .line 32
    .line 33
    if-ne p1, v0, :cond_4

    .line 34
    .line 35
    new-instance p1, Laj;

    .line 36
    .line 37
    const/4 v0, 0x0

    .line 38
    invoke-direct {p1, p0, v0}, Laj;-><init>(Lcom/google/android/material/carousel/CarouselLayoutManager;I)V

    .line 39
    .line 40
    .line 41
    goto :goto_2

    .line 42
    :cond_4
    const-string p0, "invalid orientation"

    .line 43
    .line 44
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_5
    new-instance p1, Laj;

    .line 49
    .line 50
    invoke-direct {p1, p0, v0}, Laj;-><init>(Lcom/google/android/material/carousel/CarouselLayoutManager;I)V

    .line 51
    .line 52
    .line 53
    :goto_2
    iput-object p1, p0, Lcom/google/android/material/carousel/CarouselLayoutManager;->p:Laj;

    .line 54
    .line 55
    invoke-virtual {p0}, Lpy0;->g0()V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public final x(Landroid/view/View;Landroid/graphics/Rect;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lpy0;->x(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Landroid/graphics/Rect;->centerX()I

    .line 5
    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    throw p0
.end method
