.class public Lcom/google/android/material/theme/MaterialComponentsViewInflater;
.super Lb9;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lb9;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;Landroid/util/AttributeSet;)Lf6;
    .locals 0

    .line 1
    new-instance p0, Lvl0;

    .line 2
    .line 3
    invoke-direct {p0, p1, p2}, Lvl0;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public final b(Landroid/content/Context;Landroid/util/AttributeSet;)Lg6;
    .locals 0

    .line 1
    new-instance p0, Lyl0;

    .line 2
    .line 3
    invoke-direct {p0, p1, p2}, Lyl0;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public final c(Landroid/content/Context;Landroid/util/AttributeSet;)Li6;
    .locals 0

    .line 1
    new-instance p0, Lcm0;

    .line 2
    .line 3
    invoke-direct {p0, p1, p2}, Lcm0;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public final d(Landroid/content/Context;Landroid/util/AttributeSet;)Lt7;
    .locals 7

    .line 1
    new-instance p0, Ldm0;

    .line 2
    .line 3
    const v0, 0x7f120433

    .line 4
    .line 5
    .line 6
    const v4, 0x7f04038b

    .line 7
    .line 8
    .line 9
    invoke-static {p1, p2, v4, v0}, Las;->w(Landroid/content/Context;Landroid/util/AttributeSet;II)Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-direct {p0, p1, p2}, Lt7;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    const/4 p1, 0x0

    .line 21
    new-array v6, p1, [I

    .line 22
    .line 23
    const v5, 0x7f120433

    .line 24
    .line 25
    .line 26
    invoke-static {v1, p2, v4, v5}, Lxg;->d(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 27
    .line 28
    .line 29
    sget-object v3, Lfx0;->g:[I

    .line 30
    .line 31
    move-object v2, p2

    .line 32
    invoke-static/range {v1 .. v6}, Lxg;->e(Landroid/content/Context;Landroid/util/AttributeSet;[III[I)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v1, v2, v3, v4, v5}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    invoke-virtual {p2, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_0

    .line 44
    .line 45
    invoke-static {v1, p2, p1}, Lbv;->i(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/content/res/ColorStateList;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-static {p0, v0}, Lom;->c(Landroid/widget/CompoundButton;Landroid/content/res/ColorStateList;)V

    .line 50
    .line 51
    .line 52
    :cond_0
    const/4 v0, 0x1

    .line 53
    invoke-virtual {p2, v0, p1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    iput-boolean p1, p0, Ldm0;->o:Z

    .line 58
    .line 59
    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    .line 60
    .line 61
    .line 62
    return-object p0
.end method

.method public final e(Landroid/content/Context;Landroid/util/AttributeSet;)Lt8;
    .locals 8

    .line 1
    new-instance p0, Lgm0;

    .line 2
    .line 3
    const v0, 0x1010084

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-static {p1, p2, v0, v1}, Las;->w(Landroid/content/Context;Landroid/util/AttributeSet;II)Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-direct {p0, p1, p2, v0}, Lt8;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    const v2, 0x7f040449

    .line 19
    .line 20
    .line 21
    const/4 v3, 0x1

    .line 22
    invoke-static {p1, v2, v3}, Las;->t(Landroid/content/Context;IZ)Z

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    if-eqz v2, :cond_1

    .line 27
    .line 28
    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    sget-object v4, Lfx0;->j:[I

    .line 33
    .line 34
    invoke-virtual {v2, p2, v4, v0, v1}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    .line 35
    .line 36
    .line 37
    move-result-object v5

    .line 38
    const/4 v6, 0x2

    .line 39
    filled-new-array {v3, v6}, [I

    .line 40
    .line 41
    .line 42
    move-result-object v7

    .line 43
    invoke-static {p1, v5, v7}, Lgm0;->g(Landroid/content/Context;Landroid/content/res/TypedArray;[I)I

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    invoke-virtual {v5}, Landroid/content/res/TypedArray;->recycle()V

    .line 48
    .line 49
    .line 50
    const/4 v5, -0x1

    .line 51
    if-eq p1, v5, :cond_0

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_0
    invoke-virtual {v2, p2, v4, v0, v1}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-virtual {p1, v1, v5}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 59
    .line 60
    .line 61
    move-result p2

    .line 62
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 63
    .line 64
    .line 65
    if-eq p2, v5, :cond_1

    .line 66
    .line 67
    sget-object p1, Lfx0;->i:[I

    .line 68
    .line 69
    invoke-virtual {v2, p2, p1}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 74
    .line 75
    .line 76
    move-result-object p2

    .line 77
    filled-new-array {v3, v6}, [I

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-static {p2, p1, v0}, Lgm0;->g(Landroid/content/Context;Landroid/content/res/TypedArray;[I)I

    .line 82
    .line 83
    .line 84
    move-result p2

    .line 85
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 86
    .line 87
    .line 88
    if-ltz p2, :cond_1

    .line 89
    .line 90
    invoke-virtual {p0, p2}, Lt8;->setLineHeight(I)V

    .line 91
    .line 92
    .line 93
    :cond_1
    :goto_0
    return-object p0
.end method
