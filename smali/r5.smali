.class public abstract Lr5;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Landroid/view/animation/LinearInterpolator;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ln20;

    .line 7
    .line 8
    sget-object v1, Ln20;->d:[F

    .line 9
    .line 10
    invoke-direct {v0, v1}, Ln20;-><init>([F)V

    .line 11
    .line 12
    .line 13
    new-instance v0, Ln20;

    .line 14
    .line 15
    sget-object v1, Ln20;->c:[F

    .line 16
    .line 17
    invoke-direct {v0, v1}, Ln20;-><init>([F)V

    .line 18
    .line 19
    .line 20
    new-instance v0, Ln20;

    .line 21
    .line 22
    sget-object v1, Ln20;->e:[F

    .line 23
    .line 24
    invoke-direct {v0, v1}, Ln20;-><init>([F)V

    .line 25
    .line 26
    .line 27
    new-instance v0, Landroid/view/animation/DecelerateInterpolator;

    .line 28
    .line 29
    invoke-direct {v0}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public static a(FFFFF)F
    .locals 1

    .line 1
    cmpg-float v0, p4, p2

    .line 2
    .line 3
    if-gtz v0, :cond_0

    .line 4
    .line 5
    return p0

    .line 6
    :cond_0
    cmpl-float v0, p4, p3

    .line 7
    .line 8
    if-ltz v0, :cond_1

    .line 9
    .line 10
    return p1

    .line 11
    :cond_1
    sub-float/2addr p4, p2

    .line 12
    sub-float/2addr p3, p2

    .line 13
    div-float/2addr p4, p3

    .line 14
    sub-float/2addr p1, p0

    .line 15
    mul-float/2addr p1, p4

    .line 16
    add-float/2addr p1, p0

    .line 17
    return p1
.end method
