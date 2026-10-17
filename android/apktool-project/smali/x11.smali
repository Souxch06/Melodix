.class public final Lx11;
.super Lst;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# virtual methods
.method public final d(Lb71;FF)V
    .locals 4

    .line 1
    mul-float p0, p3, p2

    .line 2
    .line 3
    const/high16 v0, 0x43340000    # 180.0f

    .line 4
    .line 5
    const/high16 v1, 0x42b40000    # 90.0f

    .line 6
    .line 7
    invoke-virtual {p1, p0, v0, v1}, Lb71;->d(FFF)V

    .line 8
    .line 9
    .line 10
    const/high16 p0, 0x40000000    # 2.0f

    .line 11
    .line 12
    mul-float/2addr p3, p0

    .line 13
    mul-float/2addr p3, p2

    .line 14
    new-instance p2, Lx61;

    .line 15
    .line 16
    const/4 v2, 0x0

    .line 17
    invoke-direct {p2, v2, v2, p3, p3}, Lx61;-><init>(FFFF)V

    .line 18
    .line 19
    .line 20
    iput v0, p2, Lx61;->f:F

    .line 21
    .line 22
    iput v1, p2, Lx61;->g:F

    .line 23
    .line 24
    iget-object v1, p1, Lb71;->f:Ljava/util/ArrayList;

    .line 25
    .line 26
    invoke-virtual {v1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    new-instance v1, Lv61;

    .line 30
    .line 31
    invoke-direct {v1, p2}, Lv61;-><init>(Lx61;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1, v0}, Lb71;->a(F)V

    .line 35
    .line 36
    .line 37
    iget-object p2, p1, Lb71;->g:Ljava/util/ArrayList;

    .line 38
    .line 39
    invoke-virtual {p2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    const/high16 p2, 0x43870000    # 270.0f

    .line 43
    .line 44
    iput p2, p1, Lb71;->d:F

    .line 45
    .line 46
    add-float p2, v2, p3

    .line 47
    .line 48
    const/high16 v0, 0x3f000000    # 0.5f

    .line 49
    .line 50
    mul-float/2addr p2, v0

    .line 51
    sub-float/2addr p3, v2

    .line 52
    div-float/2addr p3, p0

    .line 53
    const-wide v0, 0x4070e00000000000L    # 270.0

    .line 54
    .line 55
    .line 56
    .line 57
    .line 58
    invoke-static {v0, v1}, Ljava/lang/Math;->toRadians(D)D

    .line 59
    .line 60
    .line 61
    move-result-wide v2

    .line 62
    invoke-static {v2, v3}, Ljava/lang/Math;->cos(D)D

    .line 63
    .line 64
    .line 65
    move-result-wide v2

    .line 66
    double-to-float p0, v2

    .line 67
    mul-float/2addr p0, p3

    .line 68
    add-float/2addr p0, p2

    .line 69
    iput p0, p1, Lb71;->b:F

    .line 70
    .line 71
    invoke-static {v0, v1}, Ljava/lang/Math;->toRadians(D)D

    .line 72
    .line 73
    .line 74
    move-result-wide v0

    .line 75
    invoke-static {v0, v1}, Ljava/lang/Math;->sin(D)D

    .line 76
    .line 77
    .line 78
    move-result-wide v0

    .line 79
    double-to-float p0, v0

    .line 80
    mul-float/2addr p3, p0

    .line 81
    add-float/2addr p3, p2

    .line 82
    iput p3, p1, Lb71;->c:F

    .line 83
    .line 84
    return-void
.end method
