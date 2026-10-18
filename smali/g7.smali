.class public final Lg7;
.super Lq6;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lpm0;
.implements Landroid/view/LayoutInflater$Factory2;


# static fields
.field public static final q0:Lu71;

.field public static final r0:[I

.field public static final s0:Z


# instance fields
.field public A:Ls6;

.field public B:Lt6;

.field public C:Ly2;

.field public D:Landroidx/appcompat/widget/ActionBarContextView;

.field public E:Landroid/widget/PopupWindow;

.field public F:Lv6;

.field public G:Lmi1;

.field public final H:Z

.field public I:Z

.field public J:Landroid/view/ViewGroup;

.field public K:Landroid/widget/TextView;

.field public L:Landroid/view/View;

.field public M:Z

.field public N:Z

.field public O:Z

.field public P:Z

.field public Q:Z

.field public R:Z

.field public S:Z

.field public T:Z

.field public U:[Lf7;

.field public V:Lf7;

.field public W:Z

.field public X:Z

.field public Y:Z

.field public Z:Z

.field public a0:Landroid/content/res/Configuration;

.field public final b0:I

.field public c0:I

.field public d0:I

.field public e0:Z

.field public f0:Lb7;

.field public g0:Lb7;

.field public h0:Z

.field public i0:I

.field public final j0:Lr6;

.field public k0:Z

.field public l0:Landroid/graphics/Rect;

.field public m0:Landroid/graphics/Rect;

.field public n0:Lb9;

.field public o0:Landroid/window/OnBackInvokedDispatcher;

.field public p0:Landroid/window/OnBackInvokedCallback;

.field public final s:Ljava/lang/Object;

.field public final t:Landroid/content/Context;

.field public u:Landroid/view/Window;

.field public v:La7;

.field public w:Lvj1;

.field public x:Lab1;

.field public y:Ljava/lang/CharSequence;

.field public z:Landroidx/appcompat/widget/ActionBarOverlayLayout;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lu71;

    .line 2
    .line 3
    invoke-direct {v0}, Lu71;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lg7;->q0:Lu71;

    .line 7
    .line 8
    const v0, 0x1010054

    .line 9
    .line 10
    .line 11
    filled-new-array {v0}, [I

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sput-object v0, Lg7;->r0:[I

    .line 16
    .line 17
    const-string v0, "robolectric"

    .line 18
    .line 19
    sget-object v1, Landroid/os/Build;->FINGERPRINT:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    xor-int/lit8 v0, v0, 0x1

    .line 26
    .line 27
    sput-boolean v0, Lg7;->s0:Z

    .line 28
    .line 29
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/view/Window;Lh6;Ljava/lang/Object;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 p3, 0x0

    .line 5
    iput-object p3, p0, Lg7;->G:Lmi1;

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    iput-boolean v0, p0, Lg7;->H:Z

    .line 9
    .line 10
    const/16 v0, -0x64

    .line 11
    .line 12
    iput v0, p0, Lg7;->b0:I

    .line 13
    .line 14
    new-instance v1, Lr6;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Lr6;-><init>(Lg7;)V

    .line 17
    .line 18
    .line 19
    iput-object v1, p0, Lg7;->j0:Lr6;

    .line 20
    .line 21
    iput-object p1, p0, Lg7;->t:Landroid/content/Context;

    .line 22
    .line 23
    iput-object p4, p0, Lg7;->s:Ljava/lang/Object;

    .line 24
    .line 25
    instance-of p4, p4, Landroid/app/Dialog;

    .line 26
    .line 27
    if-eqz p4, :cond_2

    .line 28
    .line 29
    :goto_0
    if-eqz p1, :cond_1

    .line 30
    .line 31
    instance-of p4, p1, Le6;

    .line 32
    .line 33
    if-eqz p4, :cond_0

    .line 34
    .line 35
    check-cast p1, Le6;

    .line 36
    .line 37
    goto :goto_1

    .line 38
    :cond_0
    instance-of p4, p1, Landroid/content/ContextWrapper;

    .line 39
    .line 40
    if-eqz p4, :cond_1

    .line 41
    .line 42
    check-cast p1, Landroid/content/ContextWrapper;

    .line 43
    .line 44
    invoke-virtual {p1}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    goto :goto_0

    .line 49
    :cond_1
    move-object p1, p3

    .line 50
    :goto_1
    if-eqz p1, :cond_2

    .line 51
    .line 52
    invoke-virtual {p1}, Le6;->k()Lq6;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    check-cast p1, Lg7;

    .line 57
    .line 58
    iget p1, p1, Lg7;->b0:I

    .line 59
    .line 60
    iput p1, p0, Lg7;->b0:I

    .line 61
    .line 62
    :cond_2
    iget p1, p0, Lg7;->b0:I

    .line 63
    .line 64
    if-ne p1, v0, :cond_3

    .line 65
    .line 66
    iget-object p1, p0, Lg7;->s:Ljava/lang/Object;

    .line 67
    .line 68
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    sget-object p4, Lg7;->q0:Lu71;

    .line 77
    .line 78
    invoke-virtual {p4, p1, p3}, Lu71;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    check-cast p1, Ljava/lang/Integer;

    .line 83
    .line 84
    if-eqz p1, :cond_3

    .line 85
    .line 86
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 87
    .line 88
    .line 89
    move-result p1

    .line 90
    iput p1, p0, Lg7;->b0:I

    .line 91
    .line 92
    iget-object p1, p0, Lg7;->s:Ljava/lang/Object;

    .line 93
    .line 94
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    invoke-virtual {p4, p1}, Lu71;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    :cond_3
    if-eqz p2, :cond_4

    .line 106
    .line 107
    invoke-virtual {p0, p2}, Lg7;->m(Landroid/view/Window;)V

    .line 108
    .line 109
    .line 110
    :cond_4
    invoke-static {}, Lj7;->c()V

    .line 111
    .line 112
    .line 113
    return-void
.end method

.method public static n(Landroid/content/Context;)Lbk0;
    .locals 5

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x21

    .line 4
    .line 5
    if-lt v0, v1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    sget-object v0, Lq6;->l:Lbk0;

    .line 9
    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    :goto_0
    const/4 p0, 0x0

    .line 13
    return-object p0

    .line 14
    :cond_1
    iget-object v0, v0, Lbk0;->a:Lck0;

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-static {p0}, Lx6;->b(Landroid/content/res/Configuration;)Lbk0;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    iget-object v1, v0, Lck0;->a:Landroid/os/LocaleList;

    .line 33
    .line 34
    invoke-virtual {v1}, Landroid/os/LocaleList;->isEmpty()Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-eqz v1, :cond_2

    .line 39
    .line 40
    sget-object v0, Lbk0;->b:Lbk0;

    .line 41
    .line 42
    goto :goto_3

    .line 43
    :cond_2
    new-instance v1, Ljava/util/LinkedHashSet;

    .line 44
    .line 45
    invoke-direct {v1}, Ljava/util/LinkedHashSet;-><init>()V

    .line 46
    .line 47
    .line 48
    const/4 v2, 0x0

    .line 49
    :goto_1
    iget-object v3, v0, Lck0;->a:Landroid/os/LocaleList;

    .line 50
    .line 51
    invoke-virtual {v3}, Landroid/os/LocaleList;->size()I

    .line 52
    .line 53
    .line 54
    move-result v3

    .line 55
    iget-object v4, p0, Lbk0;->a:Lck0;

    .line 56
    .line 57
    iget-object v4, v4, Lck0;->a:Landroid/os/LocaleList;

    .line 58
    .line 59
    invoke-virtual {v4}, Landroid/os/LocaleList;->size()I

    .line 60
    .line 61
    .line 62
    move-result v4

    .line 63
    add-int/2addr v4, v3

    .line 64
    if-ge v2, v4, :cond_5

    .line 65
    .line 66
    iget-object v3, v0, Lck0;->a:Landroid/os/LocaleList;

    .line 67
    .line 68
    invoke-virtual {v3}, Landroid/os/LocaleList;->size()I

    .line 69
    .line 70
    .line 71
    move-result v3

    .line 72
    if-ge v2, v3, :cond_3

    .line 73
    .line 74
    iget-object v3, v0, Lck0;->a:Landroid/os/LocaleList;

    .line 75
    .line 76
    invoke-virtual {v3, v2}, Landroid/os/LocaleList;->get(I)Ljava/util/Locale;

    .line 77
    .line 78
    .line 79
    move-result-object v3

    .line 80
    goto :goto_2

    .line 81
    :cond_3
    iget-object v3, v0, Lck0;->a:Landroid/os/LocaleList;

    .line 82
    .line 83
    invoke-virtual {v3}, Landroid/os/LocaleList;->size()I

    .line 84
    .line 85
    .line 86
    move-result v3

    .line 87
    sub-int v3, v2, v3

    .line 88
    .line 89
    iget-object v4, p0, Lbk0;->a:Lck0;

    .line 90
    .line 91
    iget-object v4, v4, Lck0;->a:Landroid/os/LocaleList;

    .line 92
    .line 93
    invoke-virtual {v4, v3}, Landroid/os/LocaleList;->get(I)Ljava/util/Locale;

    .line 94
    .line 95
    .line 96
    move-result-object v3

    .line 97
    :goto_2
    if-eqz v3, :cond_4

    .line 98
    .line 99
    invoke-interface {v1, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    :cond_4
    add-int/lit8 v2, v2, 0x1

    .line 103
    .line 104
    goto :goto_1

    .line 105
    :cond_5
    invoke-interface {v1}, Ljava/util/Set;->size()I

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    new-array v0, v0, [Ljava/util/Locale;

    .line 110
    .line 111
    invoke-interface {v1, v0}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    check-cast v0, [Ljava/util/Locale;

    .line 116
    .line 117
    invoke-static {v0}, Lak0;->a([Ljava/util/Locale;)Landroid/os/LocaleList;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    new-instance v1, Lbk0;

    .line 122
    .line 123
    new-instance v2, Lck0;

    .line 124
    .line 125
    invoke-direct {v2, v0}, Lck0;-><init>(Landroid/os/LocaleList;)V

    .line 126
    .line 127
    .line 128
    invoke-direct {v1, v2}, Lbk0;-><init>(Lck0;)V

    .line 129
    .line 130
    .line 131
    move-object v0, v1

    .line 132
    :goto_3
    iget-object v1, v0, Lbk0;->a:Lck0;

    .line 133
    .line 134
    iget-object v1, v1, Lck0;->a:Landroid/os/LocaleList;

    .line 135
    .line 136
    invoke-virtual {v1}, Landroid/os/LocaleList;->isEmpty()Z

    .line 137
    .line 138
    .line 139
    move-result v1

    .line 140
    if-eqz v1, :cond_6

    .line 141
    .line 142
    return-object p0

    .line 143
    :cond_6
    return-object v0
.end method

.method public static r(Landroid/content/Context;ILbk0;Landroid/content/res/Configuration;Z)Landroid/content/res/Configuration;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-eq p1, v0, :cond_2

    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    if-eq p1, v0, :cond_1

    .line 6
    .line 7
    if-eqz p4, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    iget p0, p0, Landroid/content/res/Configuration;->uiMode:I

    .line 24
    .line 25
    and-int/lit8 p0, p0, 0x30

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    const/16 p0, 0x20

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_2
    const/16 p0, 0x10

    .line 32
    .line 33
    :goto_0
    new-instance p1, Landroid/content/res/Configuration;

    .line 34
    .line 35
    invoke-direct {p1}, Landroid/content/res/Configuration;-><init>()V

    .line 36
    .line 37
    .line 38
    const/4 p4, 0x0

    .line 39
    iput p4, p1, Landroid/content/res/Configuration;->fontScale:F

    .line 40
    .line 41
    if-eqz p3, :cond_3

    .line 42
    .line 43
    invoke-virtual {p1, p3}, Landroid/content/res/Configuration;->setTo(Landroid/content/res/Configuration;)V

    .line 44
    .line 45
    .line 46
    :cond_3
    iget p3, p1, Landroid/content/res/Configuration;->uiMode:I

    .line 47
    .line 48
    and-int/lit8 p3, p3, -0x31

    .line 49
    .line 50
    or-int/2addr p0, p3

    .line 51
    iput p0, p1, Landroid/content/res/Configuration;->uiMode:I

    .line 52
    .line 53
    if-eqz p2, :cond_4

    .line 54
    .line 55
    invoke-static {p1, p2}, Lx6;->d(Landroid/content/res/Configuration;Lbk0;)V

    .line 56
    .line 57
    .line 58
    :cond_4
    return-object p1
.end method


# virtual methods
.method public final A(Landroid/content/Context;I)I
    .locals 2

    .line 1
    const/16 v0, -0x64

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-eq p2, v0, :cond_5

    .line 5
    .line 6
    if-eq p2, v1, :cond_4

    .line 7
    .line 8
    if-eqz p2, :cond_2

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    if-eq p2, v0, :cond_4

    .line 12
    .line 13
    const/4 v0, 0x2

    .line 14
    if-eq p2, v0, :cond_4

    .line 15
    .line 16
    const/4 v0, 0x3

    .line 17
    if-ne p2, v0, :cond_1

    .line 18
    .line 19
    iget-object p2, p0, Lg7;->g0:Lb7;

    .line 20
    .line 21
    if-nez p2, :cond_0

    .line 22
    .line 23
    new-instance p2, Lb7;

    .line 24
    .line 25
    invoke-direct {p2, p0, p1}, Lb7;-><init>(Lg7;Landroid/content/Context;)V

    .line 26
    .line 27
    .line 28
    iput-object p2, p0, Lg7;->g0:Lb7;

    .line 29
    .line 30
    :cond_0
    invoke-virtual {p2}, Lb7;->f()I

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    return p0

    .line 35
    :cond_1
    const-string p0, "Unknown value set for night mode. Please use one of the MODE_NIGHT values from AppCompatDelegate."

    .line 36
    .line 37
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    const/4 p0, 0x0

    .line 41
    return p0

    .line 42
    :cond_2
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 43
    .line 44
    .line 45
    move-result-object p2

    .line 46
    const-string v0, "uimode"

    .line 47
    .line 48
    invoke-virtual {p2, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object p2

    .line 52
    check-cast p2, Landroid/app/UiModeManager;

    .line 53
    .line 54
    invoke-virtual {p2}, Landroid/app/UiModeManager;->getNightMode()I

    .line 55
    .line 56
    .line 57
    move-result p2

    .line 58
    if-nez p2, :cond_3

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_3
    invoke-virtual {p0, p1}, Lg7;->w(Landroid/content/Context;)Ld7;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {p0}, Ld7;->f()I

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    return p0

    .line 70
    :cond_4
    return p2

    .line 71
    :cond_5
    :goto_0
    return v1
.end method

.method public final B()Z
    .locals 5

    .line 1
    iget-boolean v0, p0, Lg7;->W:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    iput-boolean v1, p0, Lg7;->W:Z

    .line 5
    .line 6
    invoke-virtual {p0, v1}, Lg7;->x(I)Lf7;

    .line 7
    .line 8
    .line 9
    move-result-object v2

    .line 10
    iget-boolean v3, v2, Lf7;->m:Z

    .line 11
    .line 12
    const/4 v4, 0x1

    .line 13
    if-eqz v3, :cond_0

    .line 14
    .line 15
    if-nez v0, :cond_3

    .line 16
    .line 17
    invoke-virtual {p0, v2, v4}, Lg7;->q(Lf7;Z)V

    .line 18
    .line 19
    .line 20
    return v4

    .line 21
    :cond_0
    iget-object v0, p0, Lg7;->C:Ly2;

    .line 22
    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    invoke-virtual {v0}, Ly2;->a()V

    .line 26
    .line 27
    .line 28
    return v4

    .line 29
    :cond_1
    invoke-virtual {p0}, Lg7;->y()V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Lg7;->w:Lvj1;

    .line 33
    .line 34
    if-eqz p0, :cond_4

    .line 35
    .line 36
    iget-object p0, p0, Lvj1;->e:Lcv;

    .line 37
    .line 38
    if-eqz p0, :cond_4

    .line 39
    .line 40
    move-object v0, p0

    .line 41
    check-cast v0, Lcd1;

    .line 42
    .line 43
    iget-object v0, v0, Lcd1;->a:Landroidx/appcompat/widget/Toolbar;

    .line 44
    .line 45
    iget-object v0, v0, Landroidx/appcompat/widget/Toolbar;->U:Lwc1;

    .line 46
    .line 47
    if-eqz v0, :cond_4

    .line 48
    .line 49
    iget-object v0, v0, Lwc1;->k:Lvm0;

    .line 50
    .line 51
    if-eqz v0, :cond_4

    .line 52
    .line 53
    check-cast p0, Lcd1;

    .line 54
    .line 55
    iget-object p0, p0, Lcd1;->a:Landroidx/appcompat/widget/Toolbar;

    .line 56
    .line 57
    iget-object p0, p0, Landroidx/appcompat/widget/Toolbar;->U:Lwc1;

    .line 58
    .line 59
    if-nez p0, :cond_2

    .line 60
    .line 61
    const/4 p0, 0x0

    .line 62
    goto :goto_0

    .line 63
    :cond_2
    iget-object p0, p0, Lwc1;->k:Lvm0;

    .line 64
    .line 65
    :goto_0
    if-eqz p0, :cond_3

    .line 66
    .line 67
    invoke-virtual {p0}, Lvm0;->collapseActionView()Z

    .line 68
    .line 69
    .line 70
    :cond_3
    return v4

    .line 71
    :cond_4
    return v1
.end method

.method public final C(Lf7;Landroid/view/KeyEvent;)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iget-boolean v2, v1, Lf7;->m:Z

    .line 6
    .line 7
    iget v3, v1, Lf7;->a:I

    .line 8
    .line 9
    if-nez v2, :cond_1a

    .line 10
    .line 11
    iget-boolean v2, v0, Lg7;->Z:Z

    .line 12
    .line 13
    if-eqz v2, :cond_0

    .line 14
    .line 15
    goto/16 :goto_9

    .line 16
    .line 17
    :cond_0
    iget-object v2, v0, Lg7;->t:Landroid/content/Context;

    .line 18
    .line 19
    if-nez v3, :cond_1

    .line 20
    .line 21
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 22
    .line 23
    .line 24
    move-result-object v4

    .line 25
    invoke-virtual {v4}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 26
    .line 27
    .line 28
    move-result-object v4

    .line 29
    iget v4, v4, Landroid/content/res/Configuration;->screenLayout:I

    .line 30
    .line 31
    and-int/lit8 v4, v4, 0xf

    .line 32
    .line 33
    const/4 v5, 0x4

    .line 34
    if-ne v4, v5, :cond_1

    .line 35
    .line 36
    goto/16 :goto_9

    .line 37
    .line 38
    :cond_1
    iget-object v4, v0, Lg7;->u:Landroid/view/Window;

    .line 39
    .line 40
    invoke-virtual {v4}, Landroid/view/Window;->getCallback()Landroid/view/Window$Callback;

    .line 41
    .line 42
    .line 43
    move-result-object v4

    .line 44
    const/4 v5, 0x1

    .line 45
    if-eqz v4, :cond_2

    .line 46
    .line 47
    iget-object v6, v1, Lf7;->h:Lrm0;

    .line 48
    .line 49
    invoke-interface {v4, v3, v6}, Landroid/view/Window$Callback;->onMenuOpened(ILandroid/view/Menu;)Z

    .line 50
    .line 51
    .line 52
    move-result v4

    .line 53
    if-nez v4, :cond_2

    .line 54
    .line 55
    invoke-virtual {v0, v1, v5}, Lg7;->q(Lf7;Z)V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_2
    const-string v4, "window"

    .line 60
    .line 61
    invoke-virtual {v2, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v4

    .line 65
    check-cast v4, Landroid/view/WindowManager;

    .line 66
    .line 67
    if-nez v4, :cond_3

    .line 68
    .line 69
    goto/16 :goto_9

    .line 70
    .line 71
    :cond_3
    invoke-virtual/range {p0 .. p2}, Lg7;->E(Lf7;Landroid/view/KeyEvent;)Z

    .line 72
    .line 73
    .line 74
    move-result v6

    .line 75
    if-nez v6, :cond_4

    .line 76
    .line 77
    goto/16 :goto_9

    .line 78
    .line 79
    :cond_4
    iget-object v6, v1, Lf7;->e:Le7;

    .line 80
    .line 81
    const/4 v7, 0x0

    .line 82
    const/4 v8, -0x2

    .line 83
    if-eqz v6, :cond_6

    .line 84
    .line 85
    iget-boolean v9, v1, Lf7;->n:Z

    .line 86
    .line 87
    if-eqz v9, :cond_5

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_5
    iget-object v2, v1, Lf7;->g:Landroid/view/View;

    .line 91
    .line 92
    if-eqz v2, :cond_18

    .line 93
    .line 94
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    if-eqz v2, :cond_18

    .line 99
    .line 100
    iget v2, v2, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 101
    .line 102
    const/4 v6, -0x1

    .line 103
    if-ne v2, v6, :cond_18

    .line 104
    .line 105
    move v10, v6

    .line 106
    goto/16 :goto_7

    .line 107
    .line 108
    :cond_6
    :goto_0
    if-nez v6, :cond_b

    .line 109
    .line 110
    invoke-virtual {v0}, Lg7;->y()V

    .line 111
    .line 112
    .line 113
    iget-object v6, v0, Lg7;->w:Lvj1;

    .line 114
    .line 115
    if-eqz v6, :cond_7

    .line 116
    .line 117
    invoke-virtual {v6}, Lvj1;->b()Landroid/content/Context;

    .line 118
    .line 119
    .line 120
    move-result-object v6

    .line 121
    goto :goto_1

    .line 122
    :cond_7
    const/4 v6, 0x0

    .line 123
    :goto_1
    if-nez v6, :cond_8

    .line 124
    .line 125
    goto :goto_2

    .line 126
    :cond_8
    move-object v2, v6

    .line 127
    :goto_2
    new-instance v6, Landroid/util/TypedValue;

    .line 128
    .line 129
    invoke-direct {v6}, Landroid/util/TypedValue;-><init>()V

    .line 130
    .line 131
    .line 132
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 133
    .line 134
    .line 135
    move-result-object v9

    .line 136
    invoke-virtual {v9}, Landroid/content/res/Resources;->newTheme()Landroid/content/res/Resources$Theme;

    .line 137
    .line 138
    .line 139
    move-result-object v9

    .line 140
    invoke-virtual {v2}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    .line 141
    .line 142
    .line 143
    move-result-object v10

    .line 144
    invoke-virtual {v9, v10}, Landroid/content/res/Resources$Theme;->setTo(Landroid/content/res/Resources$Theme;)V

    .line 145
    .line 146
    .line 147
    const v10, 0x7f040002

    .line 148
    .line 149
    .line 150
    invoke-virtual {v9, v10, v6, v5}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 151
    .line 152
    .line 153
    iget v10, v6, Landroid/util/TypedValue;->resourceId:I

    .line 154
    .line 155
    if-eqz v10, :cond_9

    .line 156
    .line 157
    invoke-virtual {v9, v10, v5}, Landroid/content/res/Resources$Theme;->applyStyle(IZ)V

    .line 158
    .line 159
    .line 160
    :cond_9
    const v10, 0x7f04035c

    .line 161
    .line 162
    .line 163
    invoke-virtual {v9, v10, v6, v5}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 164
    .line 165
    .line 166
    iget v6, v6, Landroid/util/TypedValue;->resourceId:I

    .line 167
    .line 168
    if-eqz v6, :cond_a

    .line 169
    .line 170
    invoke-virtual {v9, v6, v5}, Landroid/content/res/Resources$Theme;->applyStyle(IZ)V

    .line 171
    .line 172
    .line 173
    goto :goto_3

    .line 174
    :cond_a
    const v6, 0x7f120231

    .line 175
    .line 176
    .line 177
    invoke-virtual {v9, v6, v5}, Landroid/content/res/Resources$Theme;->applyStyle(IZ)V

    .line 178
    .line 179
    .line 180
    :goto_3
    new-instance v6, Lhq;

    .line 181
    .line 182
    invoke-direct {v6, v2, v7}, Lhq;-><init>(Landroid/content/Context;I)V

    .line 183
    .line 184
    .line 185
    invoke-virtual {v6}, Lhq;->getTheme()Landroid/content/res/Resources$Theme;

    .line 186
    .line 187
    .line 188
    move-result-object v2

    .line 189
    invoke-virtual {v2, v9}, Landroid/content/res/Resources$Theme;->setTo(Landroid/content/res/Resources$Theme;)V

    .line 190
    .line 191
    .line 192
    iput-object v6, v1, Lf7;->j:Lhq;

    .line 193
    .line 194
    sget-object v2, Lgx0;->j:[I

    .line 195
    .line 196
    invoke-virtual {v6, v2}, Landroid/content/Context;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    .line 197
    .line 198
    .line 199
    move-result-object v2

    .line 200
    const/16 v6, 0x56

    .line 201
    .line 202
    invoke-virtual {v2, v6, v7}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 203
    .line 204
    .line 205
    move-result v6

    .line 206
    iput v6, v1, Lf7;->b:I

    .line 207
    .line 208
    invoke-virtual {v2, v5, v7}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 209
    .line 210
    .line 211
    move-result v6

    .line 212
    iput v6, v1, Lf7;->d:I

    .line 213
    .line 214
    invoke-virtual {v2}, Landroid/content/res/TypedArray;->recycle()V

    .line 215
    .line 216
    .line 217
    new-instance v2, Le7;

    .line 218
    .line 219
    iget-object v6, v1, Lf7;->j:Lhq;

    .line 220
    .line 221
    invoke-direct {v2, v0, v6}, Le7;-><init>(Lg7;Lhq;)V

    .line 222
    .line 223
    .line 224
    iput-object v2, v1, Lf7;->e:Le7;

    .line 225
    .line 226
    const/16 v2, 0x51

    .line 227
    .line 228
    iput v2, v1, Lf7;->c:I

    .line 229
    .line 230
    goto :goto_4

    .line 231
    :cond_b
    iget-boolean v2, v1, Lf7;->n:Z

    .line 232
    .line 233
    if-eqz v2, :cond_c

    .line 234
    .line 235
    invoke-virtual {v6}, Landroid/view/ViewGroup;->getChildCount()I

    .line 236
    .line 237
    .line 238
    move-result v2

    .line 239
    if-lez v2, :cond_c

    .line 240
    .line 241
    iget-object v2, v1, Lf7;->e:Le7;

    .line 242
    .line 243
    invoke-virtual {v2}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 244
    .line 245
    .line 246
    :cond_c
    :goto_4
    iget-object v2, v1, Lf7;->g:Landroid/view/View;

    .line 247
    .line 248
    if-eqz v2, :cond_d

    .line 249
    .line 250
    iput-object v2, v1, Lf7;->f:Landroid/view/View;

    .line 251
    .line 252
    goto :goto_5

    .line 253
    :cond_d
    iget-object v2, v1, Lf7;->h:Lrm0;

    .line 254
    .line 255
    if-nez v2, :cond_e

    .line 256
    .line 257
    goto/16 :goto_8

    .line 258
    .line 259
    :cond_e
    iget-object v2, v0, Lg7;->B:Lt6;

    .line 260
    .line 261
    if-nez v2, :cond_f

    .line 262
    .line 263
    new-instance v2, Lt6;

    .line 264
    .line 265
    invoke-direct {v2, v0}, Lt6;-><init>(Lg7;)V

    .line 266
    .line 267
    .line 268
    iput-object v2, v0, Lg7;->B:Lt6;

    .line 269
    .line 270
    :cond_f
    iget-object v6, v1, Lf7;->i:Ldj0;

    .line 271
    .line 272
    if-nez v6, :cond_10

    .line 273
    .line 274
    new-instance v6, Ldj0;

    .line 275
    .line 276
    iget-object v9, v1, Lf7;->j:Lhq;

    .line 277
    .line 278
    invoke-direct {v6, v9}, Ldj0;-><init>(Landroid/content/ContextWrapper;)V

    .line 279
    .line 280
    .line 281
    iput-object v6, v1, Lf7;->i:Ldj0;

    .line 282
    .line 283
    iput-object v2, v6, Ldj0;->n:Lhn0;

    .line 284
    .line 285
    iget-object v2, v1, Lf7;->h:Lrm0;

    .line 286
    .line 287
    iget-object v9, v2, Lrm0;->a:Landroid/content/Context;

    .line 288
    .line 289
    invoke-virtual {v2, v6, v9}, Lrm0;->b(Lin0;Landroid/content/Context;)V

    .line 290
    .line 291
    .line 292
    :cond_10
    iget-object v2, v1, Lf7;->i:Ldj0;

    .line 293
    .line 294
    iget-object v6, v1, Lf7;->e:Le7;

    .line 295
    .line 296
    iget-object v9, v2, Ldj0;->m:Landroidx/appcompat/view/menu/ExpandedMenuView;

    .line 297
    .line 298
    if-nez v9, :cond_12

    .line 299
    .line 300
    iget-object v9, v2, Ldj0;->k:Landroid/view/LayoutInflater;

    .line 301
    .line 302
    const v10, 0x7f0c000d

    .line 303
    .line 304
    .line 305
    invoke-virtual {v9, v10, v6, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 306
    .line 307
    .line 308
    move-result-object v6

    .line 309
    check-cast v6, Landroidx/appcompat/view/menu/ExpandedMenuView;

    .line 310
    .line 311
    iput-object v6, v2, Ldj0;->m:Landroidx/appcompat/view/menu/ExpandedMenuView;

    .line 312
    .line 313
    iget-object v6, v2, Ldj0;->o:Lcj0;

    .line 314
    .line 315
    if-nez v6, :cond_11

    .line 316
    .line 317
    new-instance v6, Lcj0;

    .line 318
    .line 319
    invoke-direct {v6, v2}, Lcj0;-><init>(Ldj0;)V

    .line 320
    .line 321
    .line 322
    iput-object v6, v2, Ldj0;->o:Lcj0;

    .line 323
    .line 324
    :cond_11
    iget-object v9, v2, Ldj0;->m:Landroidx/appcompat/view/menu/ExpandedMenuView;

    .line 325
    .line 326
    invoke-virtual {v9, v6}, Landroid/widget/AbsListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 327
    .line 328
    .line 329
    iget-object v6, v2, Ldj0;->m:Landroidx/appcompat/view/menu/ExpandedMenuView;

    .line 330
    .line 331
    invoke-virtual {v6, v2}, Landroid/widget/AdapterView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 332
    .line 333
    .line 334
    :cond_12
    iget-object v2, v2, Ldj0;->m:Landroidx/appcompat/view/menu/ExpandedMenuView;

    .line 335
    .line 336
    iput-object v2, v1, Lf7;->f:Landroid/view/View;

    .line 337
    .line 338
    if-eqz v2, :cond_19

    .line 339
    .line 340
    :goto_5
    iget-object v2, v1, Lf7;->f:Landroid/view/View;

    .line 341
    .line 342
    if-nez v2, :cond_13

    .line 343
    .line 344
    goto/16 :goto_8

    .line 345
    .line 346
    :cond_13
    iget-object v2, v1, Lf7;->g:Landroid/view/View;

    .line 347
    .line 348
    if-eqz v2, :cond_14

    .line 349
    .line 350
    goto :goto_6

    .line 351
    :cond_14
    iget-object v2, v1, Lf7;->i:Ldj0;

    .line 352
    .line 353
    iget-object v6, v2, Ldj0;->o:Lcj0;

    .line 354
    .line 355
    if-nez v6, :cond_15

    .line 356
    .line 357
    new-instance v6, Lcj0;

    .line 358
    .line 359
    invoke-direct {v6, v2}, Lcj0;-><init>(Ldj0;)V

    .line 360
    .line 361
    .line 362
    iput-object v6, v2, Ldj0;->o:Lcj0;

    .line 363
    .line 364
    :cond_15
    invoke-virtual {v6}, Lcj0;->getCount()I

    .line 365
    .line 366
    .line 367
    move-result v2

    .line 368
    if-lez v2, :cond_19

    .line 369
    .line 370
    :goto_6
    iget-object v2, v1, Lf7;->f:Landroid/view/View;

    .line 371
    .line 372
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 373
    .line 374
    .line 375
    move-result-object v2

    .line 376
    if-nez v2, :cond_16

    .line 377
    .line 378
    new-instance v2, Landroid/view/ViewGroup$LayoutParams;

    .line 379
    .line 380
    invoke-direct {v2, v8, v8}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 381
    .line 382
    .line 383
    :cond_16
    iget v6, v1, Lf7;->b:I

    .line 384
    .line 385
    iget-object v9, v1, Lf7;->e:Le7;

    .line 386
    .line 387
    invoke-virtual {v9, v6}, Le7;->setBackgroundResource(I)V

    .line 388
    .line 389
    .line 390
    iget-object v6, v1, Lf7;->f:Landroid/view/View;

    .line 391
    .line 392
    invoke-virtual {v6}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 393
    .line 394
    .line 395
    move-result-object v6

    .line 396
    instance-of v9, v6, Landroid/view/ViewGroup;

    .line 397
    .line 398
    if-eqz v9, :cond_17

    .line 399
    .line 400
    check-cast v6, Landroid/view/ViewGroup;

    .line 401
    .line 402
    iget-object v9, v1, Lf7;->f:Landroid/view/View;

    .line 403
    .line 404
    invoke-virtual {v6, v9}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 405
    .line 406
    .line 407
    :cond_17
    iget-object v6, v1, Lf7;->e:Le7;

    .line 408
    .line 409
    iget-object v9, v1, Lf7;->f:Landroid/view/View;

    .line 410
    .line 411
    invoke-virtual {v6, v9, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 412
    .line 413
    .line 414
    iget-object v2, v1, Lf7;->f:Landroid/view/View;

    .line 415
    .line 416
    invoke-virtual {v2}, Landroid/view/View;->hasFocus()Z

    .line 417
    .line 418
    .line 419
    move-result v2

    .line 420
    if-nez v2, :cond_18

    .line 421
    .line 422
    iget-object v2, v1, Lf7;->f:Landroid/view/View;

    .line 423
    .line 424
    invoke-virtual {v2}, Landroid/view/View;->requestFocus()Z

    .line 425
    .line 426
    .line 427
    :cond_18
    move v10, v8

    .line 428
    :goto_7
    iput-boolean v7, v1, Lf7;->l:Z

    .line 429
    .line 430
    new-instance v9, Landroid/view/WindowManager$LayoutParams;

    .line 431
    .line 432
    const/high16 v15, 0x820000

    .line 433
    .line 434
    const/16 v16, -0x3

    .line 435
    .line 436
    const/4 v11, -0x2

    .line 437
    const/4 v12, 0x0

    .line 438
    const/4 v13, 0x0

    .line 439
    const/16 v14, 0x3ea

    .line 440
    .line 441
    invoke-direct/range {v9 .. v16}, Landroid/view/WindowManager$LayoutParams;-><init>(IIIIIII)V

    .line 442
    .line 443
    .line 444
    iget v2, v1, Lf7;->c:I

    .line 445
    .line 446
    iput v2, v9, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 447
    .line 448
    iget v2, v1, Lf7;->d:I

    .line 449
    .line 450
    iput v2, v9, Landroid/view/WindowManager$LayoutParams;->windowAnimations:I

    .line 451
    .line 452
    iget-object v2, v1, Lf7;->e:Le7;

    .line 453
    .line 454
    invoke-interface {v4, v2, v9}, Landroid/view/ViewManager;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 455
    .line 456
    .line 457
    iput-boolean v5, v1, Lf7;->m:Z

    .line 458
    .line 459
    if-nez v3, :cond_1a

    .line 460
    .line 461
    invoke-virtual {v0}, Lg7;->G()V

    .line 462
    .line 463
    .line 464
    return-void

    .line 465
    :cond_19
    :goto_8
    iput-boolean v5, v1, Lf7;->n:Z

    .line 466
    .line 467
    :cond_1a
    :goto_9
    return-void
.end method

.method public final D(Lf7;ILandroid/view/KeyEvent;)Z
    .locals 2

    .line 1
    invoke-virtual {p3}, Landroid/view/KeyEvent;->isSystem()Z

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
    return v1

    .line 9
    :cond_0
    iget-boolean v0, p1, Lf7;->k:Z

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0, p1, p3}, Lg7;->E(Lf7;Landroid/view/KeyEvent;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_2

    .line 18
    .line 19
    :cond_1
    iget-object p0, p1, Lf7;->h:Lrm0;

    .line 20
    .line 21
    if-eqz p0, :cond_2

    .line 22
    .line 23
    const/4 p1, 0x1

    .line 24
    invoke-virtual {p0, p2, p3, p1}, Lrm0;->performShortcut(ILandroid/view/KeyEvent;I)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    :cond_2
    return v1
.end method

.method public final E(Lf7;Landroid/view/KeyEvent;)Z
    .locals 12

    .line 1
    iget-boolean v0, p0, Lg7;->Z:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    goto/16 :goto_5

    .line 7
    .line 8
    :cond_0
    iget-boolean v0, p1, Lf7;->k:Z

    .line 9
    .line 10
    iget v2, p1, Lf7;->a:I

    .line 11
    .line 12
    const/4 v3, 0x1

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    return v3

    .line 16
    :cond_1
    iget-object v0, p0, Lg7;->V:Lf7;

    .line 17
    .line 18
    if-eqz v0, :cond_2

    .line 19
    .line 20
    if-eq v0, p1, :cond_2

    .line 21
    .line 22
    invoke-virtual {p0, v0, v1}, Lg7;->q(Lf7;Z)V

    .line 23
    .line 24
    .line 25
    :cond_2
    iget-object v0, p0, Lg7;->u:Landroid/view/Window;

    .line 26
    .line 27
    invoke-virtual {v0}, Landroid/view/Window;->getCallback()Landroid/view/Window$Callback;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    if-eqz v0, :cond_3

    .line 32
    .line 33
    invoke-interface {v0, v2}, Landroid/view/Window$Callback;->onCreatePanelView(I)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object v4

    .line 37
    iput-object v4, p1, Lf7;->g:Landroid/view/View;

    .line 38
    .line 39
    :cond_3
    const/16 v4, 0x6c

    .line 40
    .line 41
    if-eqz v2, :cond_5

    .line 42
    .line 43
    if-ne v2, v4, :cond_4

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_4
    move v5, v1

    .line 47
    goto :goto_1

    .line 48
    :cond_5
    :goto_0
    move v5, v3

    .line 49
    :goto_1
    if-eqz v5, :cond_6

    .line 50
    .line 51
    iget-object v6, p0, Lg7;->z:Landroidx/appcompat/widget/ActionBarOverlayLayout;

    .line 52
    .line 53
    if-eqz v6, :cond_6

    .line 54
    .line 55
    invoke-virtual {v6}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->k()V

    .line 56
    .line 57
    .line 58
    iget-object v6, v6, Landroidx/appcompat/widget/ActionBarOverlayLayout;->n:Lcv;

    .line 59
    .line 60
    check-cast v6, Lcd1;

    .line 61
    .line 62
    iput-boolean v3, v6, Lcd1;->l:Z

    .line 63
    .line 64
    :cond_6
    iget-object v6, p1, Lf7;->g:Landroid/view/View;

    .line 65
    .line 66
    if-nez v6, :cond_1d

    .line 67
    .line 68
    iget-object v6, p1, Lf7;->h:Lrm0;

    .line 69
    .line 70
    const/4 v7, 0x0

    .line 71
    if-eqz v6, :cond_7

    .line 72
    .line 73
    iget-boolean v8, p1, Lf7;->o:Z

    .line 74
    .line 75
    if-eqz v8, :cond_17

    .line 76
    .line 77
    :cond_7
    if-nez v6, :cond_10

    .line 78
    .line 79
    iget-object v6, p0, Lg7;->t:Landroid/content/Context;

    .line 80
    .line 81
    if-eqz v2, :cond_8

    .line 82
    .line 83
    if-ne v2, v4, :cond_c

    .line 84
    .line 85
    :cond_8
    iget-object v4, p0, Lg7;->z:Landroidx/appcompat/widget/ActionBarOverlayLayout;

    .line 86
    .line 87
    if-eqz v4, :cond_c

    .line 88
    .line 89
    new-instance v4, Landroid/util/TypedValue;

    .line 90
    .line 91
    invoke-direct {v4}, Landroid/util/TypedValue;-><init>()V

    .line 92
    .line 93
    .line 94
    invoke-virtual {v6}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    .line 95
    .line 96
    .line 97
    move-result-object v8

    .line 98
    const v9, 0x7f040009

    .line 99
    .line 100
    .line 101
    invoke-virtual {v8, v9, v4, v3}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 102
    .line 103
    .line 104
    iget v9, v4, Landroid/util/TypedValue;->resourceId:I

    .line 105
    .line 106
    const v10, 0x7f04000a

    .line 107
    .line 108
    .line 109
    if-eqz v9, :cond_9

    .line 110
    .line 111
    invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 112
    .line 113
    .line 114
    move-result-object v9

    .line 115
    invoke-virtual {v9}, Landroid/content/res/Resources;->newTheme()Landroid/content/res/Resources$Theme;

    .line 116
    .line 117
    .line 118
    move-result-object v9

    .line 119
    invoke-virtual {v9, v8}, Landroid/content/res/Resources$Theme;->setTo(Landroid/content/res/Resources$Theme;)V

    .line 120
    .line 121
    .line 122
    iget v11, v4, Landroid/util/TypedValue;->resourceId:I

    .line 123
    .line 124
    invoke-virtual {v9, v11, v3}, Landroid/content/res/Resources$Theme;->applyStyle(IZ)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {v9, v10, v4, v3}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 128
    .line 129
    .line 130
    goto :goto_2

    .line 131
    :cond_9
    invoke-virtual {v8, v10, v4, v3}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 132
    .line 133
    .line 134
    move-object v9, v7

    .line 135
    :goto_2
    iget v10, v4, Landroid/util/TypedValue;->resourceId:I

    .line 136
    .line 137
    if-eqz v10, :cond_b

    .line 138
    .line 139
    if-nez v9, :cond_a

    .line 140
    .line 141
    invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 142
    .line 143
    .line 144
    move-result-object v9

    .line 145
    invoke-virtual {v9}, Landroid/content/res/Resources;->newTheme()Landroid/content/res/Resources$Theme;

    .line 146
    .line 147
    .line 148
    move-result-object v9

    .line 149
    invoke-virtual {v9, v8}, Landroid/content/res/Resources$Theme;->setTo(Landroid/content/res/Resources$Theme;)V

    .line 150
    .line 151
    .line 152
    :cond_a
    iget v4, v4, Landroid/util/TypedValue;->resourceId:I

    .line 153
    .line 154
    invoke-virtual {v9, v4, v3}, Landroid/content/res/Resources$Theme;->applyStyle(IZ)V

    .line 155
    .line 156
    .line 157
    :cond_b
    if-eqz v9, :cond_c

    .line 158
    .line 159
    new-instance v4, Lhq;

    .line 160
    .line 161
    invoke-direct {v4, v6, v1}, Lhq;-><init>(Landroid/content/Context;I)V

    .line 162
    .line 163
    .line 164
    invoke-virtual {v4}, Lhq;->getTheme()Landroid/content/res/Resources$Theme;

    .line 165
    .line 166
    .line 167
    move-result-object v6

    .line 168
    invoke-virtual {v6, v9}, Landroid/content/res/Resources$Theme;->setTo(Landroid/content/res/Resources$Theme;)V

    .line 169
    .line 170
    .line 171
    move-object v6, v4

    .line 172
    :cond_c
    new-instance v4, Lrm0;

    .line 173
    .line 174
    invoke-direct {v4, v6}, Lrm0;-><init>(Landroid/content/Context;)V

    .line 175
    .line 176
    .line 177
    iput-object p0, v4, Lrm0;->e:Lpm0;

    .line 178
    .line 179
    iget-object v6, p1, Lf7;->h:Lrm0;

    .line 180
    .line 181
    if-ne v4, v6, :cond_d

    .line 182
    .line 183
    goto :goto_3

    .line 184
    :cond_d
    if-eqz v6, :cond_e

    .line 185
    .line 186
    iget-object v8, p1, Lf7;->i:Ldj0;

    .line 187
    .line 188
    invoke-virtual {v6, v8}, Lrm0;->r(Lin0;)V

    .line 189
    .line 190
    .line 191
    :cond_e
    iput-object v4, p1, Lf7;->h:Lrm0;

    .line 192
    .line 193
    iget-object v6, p1, Lf7;->i:Ldj0;

    .line 194
    .line 195
    if-eqz v6, :cond_f

    .line 196
    .line 197
    iget-object v8, v4, Lrm0;->a:Landroid/content/Context;

    .line 198
    .line 199
    invoke-virtual {v4, v6, v8}, Lrm0;->b(Lin0;Landroid/content/Context;)V

    .line 200
    .line 201
    .line 202
    :cond_f
    :goto_3
    iget-object v6, p1, Lf7;->h:Lrm0;

    .line 203
    .line 204
    if-nez v6, :cond_10

    .line 205
    .line 206
    goto :goto_5

    .line 207
    :cond_10
    if-eqz v5, :cond_12

    .line 208
    .line 209
    iget-object v4, p0, Lg7;->z:Landroidx/appcompat/widget/ActionBarOverlayLayout;

    .line 210
    .line 211
    if-eqz v4, :cond_12

    .line 212
    .line 213
    iget-object v8, p0, Lg7;->A:Ls6;

    .line 214
    .line 215
    if-nez v8, :cond_11

    .line 216
    .line 217
    new-instance v8, Ls6;

    .line 218
    .line 219
    invoke-direct {v8, p0}, Ls6;-><init>(Lg7;)V

    .line 220
    .line 221
    .line 222
    iput-object v8, p0, Lg7;->A:Ls6;

    .line 223
    .line 224
    :cond_11
    invoke-virtual {v4, v6, v8}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->l(Lrm0;Lhn0;)V

    .line 225
    .line 226
    .line 227
    :cond_12
    iget-object v4, p1, Lf7;->h:Lrm0;

    .line 228
    .line 229
    invoke-virtual {v4}, Lrm0;->w()V

    .line 230
    .line 231
    .line 232
    iget-object v4, p1, Lf7;->h:Lrm0;

    .line 233
    .line 234
    invoke-interface {v0, v2, v4}, Landroid/view/Window$Callback;->onCreatePanelMenu(ILandroid/view/Menu;)Z

    .line 235
    .line 236
    .line 237
    move-result v2

    .line 238
    if-nez v2, :cond_16

    .line 239
    .line 240
    iget-object p2, p1, Lf7;->h:Lrm0;

    .line 241
    .line 242
    if-nez p2, :cond_13

    .line 243
    .line 244
    goto :goto_4

    .line 245
    :cond_13
    if-eqz p2, :cond_14

    .line 246
    .line 247
    iget-object v0, p1, Lf7;->i:Ldj0;

    .line 248
    .line 249
    invoke-virtual {p2, v0}, Lrm0;->r(Lin0;)V

    .line 250
    .line 251
    .line 252
    :cond_14
    iput-object v7, p1, Lf7;->h:Lrm0;

    .line 253
    .line 254
    :goto_4
    if-eqz v5, :cond_15

    .line 255
    .line 256
    iget-object p1, p0, Lg7;->z:Landroidx/appcompat/widget/ActionBarOverlayLayout;

    .line 257
    .line 258
    if-eqz p1, :cond_15

    .line 259
    .line 260
    iget-object p0, p0, Lg7;->A:Ls6;

    .line 261
    .line 262
    invoke-virtual {p1, v7, p0}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->l(Lrm0;Lhn0;)V

    .line 263
    .line 264
    .line 265
    :cond_15
    :goto_5
    return v1

    .line 266
    :cond_16
    iput-boolean v1, p1, Lf7;->o:Z

    .line 267
    .line 268
    :cond_17
    iget-object v2, p1, Lf7;->h:Lrm0;

    .line 269
    .line 270
    invoke-virtual {v2}, Lrm0;->w()V

    .line 271
    .line 272
    .line 273
    iget-object v2, p1, Lf7;->p:Landroid/os/Bundle;

    .line 274
    .line 275
    if-eqz v2, :cond_18

    .line 276
    .line 277
    iget-object v4, p1, Lf7;->h:Lrm0;

    .line 278
    .line 279
    invoke-virtual {v4, v2}, Lrm0;->s(Landroid/os/Bundle;)V

    .line 280
    .line 281
    .line 282
    iput-object v7, p1, Lf7;->p:Landroid/os/Bundle;

    .line 283
    .line 284
    :cond_18
    iget-object v2, p1, Lf7;->g:Landroid/view/View;

    .line 285
    .line 286
    iget-object v4, p1, Lf7;->h:Lrm0;

    .line 287
    .line 288
    invoke-interface {v0, v1, v2, v4}, Landroid/view/Window$Callback;->onPreparePanel(ILandroid/view/View;Landroid/view/Menu;)Z

    .line 289
    .line 290
    .line 291
    move-result v0

    .line 292
    if-nez v0, :cond_1a

    .line 293
    .line 294
    if-eqz v5, :cond_19

    .line 295
    .line 296
    iget-object p2, p0, Lg7;->z:Landroidx/appcompat/widget/ActionBarOverlayLayout;

    .line 297
    .line 298
    if-eqz p2, :cond_19

    .line 299
    .line 300
    iget-object p0, p0, Lg7;->A:Ls6;

    .line 301
    .line 302
    invoke-virtual {p2, v7, p0}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->l(Lrm0;Lhn0;)V

    .line 303
    .line 304
    .line 305
    :cond_19
    iget-object p0, p1, Lf7;->h:Lrm0;

    .line 306
    .line 307
    invoke-virtual {p0}, Lrm0;->v()V

    .line 308
    .line 309
    .line 310
    return v1

    .line 311
    :cond_1a
    if-eqz p2, :cond_1b

    .line 312
    .line 313
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getDeviceId()I

    .line 314
    .line 315
    .line 316
    move-result p2

    .line 317
    goto :goto_6

    .line 318
    :cond_1b
    const/4 p2, -0x1

    .line 319
    :goto_6
    invoke-static {p2}, Landroid/view/KeyCharacterMap;->load(I)Landroid/view/KeyCharacterMap;

    .line 320
    .line 321
    .line 322
    move-result-object p2

    .line 323
    invoke-virtual {p2}, Landroid/view/KeyCharacterMap;->getKeyboardType()I

    .line 324
    .line 325
    .line 326
    move-result p2

    .line 327
    if-eq p2, v3, :cond_1c

    .line 328
    .line 329
    move p2, v3

    .line 330
    goto :goto_7

    .line 331
    :cond_1c
    move p2, v1

    .line 332
    :goto_7
    iget-object v0, p1, Lf7;->h:Lrm0;

    .line 333
    .line 334
    invoke-virtual {v0, p2}, Lrm0;->setQwertyMode(Z)V

    .line 335
    .line 336
    .line 337
    iget-object p2, p1, Lf7;->h:Lrm0;

    .line 338
    .line 339
    invoke-virtual {p2}, Lrm0;->v()V

    .line 340
    .line 341
    .line 342
    :cond_1d
    iput-boolean v3, p1, Lf7;->k:Z

    .line 343
    .line 344
    iput-boolean v1, p1, Lf7;->l:Z

    .line 345
    .line 346
    iput-object p1, p0, Lg7;->V:Lf7;

    .line 347
    .line 348
    return v3
.end method

.method public final F()V
    .locals 1

    .line 1
    iget-boolean p0, p0, Lg7;->I:Z

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance p0, Landroid/util/AndroidRuntimeException;

    .line 7
    .line 8
    const-string v0, "Window feature must be requested before adding content"

    .line 9
    .line 10
    invoke-direct {p0, v0}, Landroid/util/AndroidRuntimeException;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    throw p0
.end method

.method public final G()V
    .locals 3

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x21

    .line 4
    .line 5
    if-lt v0, v1, :cond_4

    .line 6
    .line 7
    iget-object v0, p0, Lg7;->o0:Landroid/window/OnBackInvokedDispatcher;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    goto :goto_1

    .line 13
    :cond_0
    invoke-virtual {p0, v1}, Lg7;->x(I)Lf7;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-boolean v0, v0, Lf7;->m:Z

    .line 18
    .line 19
    const/4 v2, 0x1

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    :goto_0
    move v1, v2

    .line 23
    goto :goto_1

    .line 24
    :cond_1
    iget-object v0, p0, Lg7;->C:Ly2;

    .line 25
    .line 26
    if-eqz v0, :cond_2

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_2
    :goto_1
    if-eqz v1, :cond_3

    .line 30
    .line 31
    iget-object v0, p0, Lg7;->p0:Landroid/window/OnBackInvokedCallback;

    .line 32
    .line 33
    if-nez v0, :cond_3

    .line 34
    .line 35
    iget-object v0, p0, Lg7;->o0:Landroid/window/OnBackInvokedDispatcher;

    .line 36
    .line 37
    invoke-static {v0, p0}, Lz6;->b(Ljava/lang/Object;Lg7;)Landroid/window/OnBackInvokedCallback;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iput-object v0, p0, Lg7;->p0:Landroid/window/OnBackInvokedCallback;

    .line 42
    .line 43
    return-void

    .line 44
    :cond_3
    if-nez v1, :cond_4

    .line 45
    .line 46
    iget-object v0, p0, Lg7;->p0:Landroid/window/OnBackInvokedCallback;

    .line 47
    .line 48
    if-eqz v0, :cond_4

    .line 49
    .line 50
    iget-object v1, p0, Lg7;->o0:Landroid/window/OnBackInvokedDispatcher;

    .line 51
    .line 52
    invoke-static {v1, v0}, Lz6;->c(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    const/4 v0, 0x0

    .line 56
    iput-object v0, p0, Lg7;->p0:Landroid/window/OnBackInvokedCallback;

    .line 57
    .line 58
    :cond_4
    return-void
.end method

.method public final b()V
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lg7;->X:Z

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    invoke-virtual {p0, v1, v0}, Lg7;->k(ZZ)Z

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lg7;->v()V

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lg7;->s:Ljava/lang/Object;

    .line 12
    .line 13
    instance-of v2, v1, Landroid/app/Activity;

    .line 14
    .line 15
    if-eqz v2, :cond_2

    .line 16
    .line 17
    :try_start_0
    check-cast v1, Landroid/app/Activity;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_1

    .line 18
    .line 19
    :try_start_1
    invoke-virtual {v1}, Landroid/app/Activity;->getComponentName()Landroid/content/ComponentName;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-static {v1, v2}, Lfe1;->o(Landroid/content/Context;Landroid/content/ComponentName;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1
    :try_end_1
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_1

    .line 27
    goto :goto_0

    .line 28
    :catch_0
    move-exception v1

    .line 29
    :try_start_2
    new-instance v2, Ljava/lang/IllegalArgumentException;

    .line 30
    .line 31
    invoke-direct {v2, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/Throwable;)V

    .line 32
    .line 33
    .line 34
    throw v2
    :try_end_2
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2 .. :try_end_2} :catch_1

    .line 35
    :catch_1
    const/4 v1, 0x0

    .line 36
    :goto_0
    if-eqz v1, :cond_1

    .line 37
    .line 38
    iget-object v1, p0, Lg7;->w:Lvj1;

    .line 39
    .line 40
    if-nez v1, :cond_0

    .line 41
    .line 42
    iput-boolean v0, p0, Lg7;->k0:Z

    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_0
    invoke-virtual {v1, v0}, Lvj1;->d(Z)V

    .line 46
    .line 47
    .line 48
    :cond_1
    :goto_1
    sget-object v1, Lq6;->q:Ljava/lang/Object;

    .line 49
    .line 50
    monitor-enter v1

    .line 51
    :try_start_3
    invoke-static {p0}, Lq6;->d(Lg7;)V

    .line 52
    .line 53
    .line 54
    sget-object v2, Lq6;->p:Lha;

    .line 55
    .line 56
    new-instance v3, Ljava/lang/ref/WeakReference;

    .line 57
    .line 58
    invoke-direct {v3, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v2, v3}, Lha;->add(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    monitor-exit v1

    .line 65
    goto :goto_2

    .line 66
    :catchall_0
    move-exception p0

    .line 67
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 68
    throw p0

    .line 69
    :cond_2
    :goto_2
    new-instance v1, Landroid/content/res/Configuration;

    .line 70
    .line 71
    iget-object v2, p0, Lg7;->t:Landroid/content/Context;

    .line 72
    .line 73
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    invoke-virtual {v2}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    invoke-direct {v1, v2}, Landroid/content/res/Configuration;-><init>(Landroid/content/res/Configuration;)V

    .line 82
    .line 83
    .line 84
    iput-object v1, p0, Lg7;->a0:Landroid/content/res/Configuration;

    .line 85
    .line 86
    iput-boolean v0, p0, Lg7;->Y:Z

    .line 87
    .line 88
    return-void
.end method

.method public final c()V
    .locals 3

    .line 1
    iget-object v0, p0, Lg7;->s:Ljava/lang/Object;

    .line 2
    .line 3
    instance-of v0, v0, Landroid/app/Activity;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Lq6;->q:Ljava/lang/Object;

    .line 8
    .line 9
    monitor-enter v0

    .line 10
    :try_start_0
    invoke-static {p0}, Lq6;->d(Lg7;)V

    .line 11
    .line 12
    .line 13
    monitor-exit v0

    .line 14
    goto :goto_0

    .line 15
    :catchall_0
    move-exception p0

    .line 16
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    throw p0

    .line 18
    :cond_0
    :goto_0
    iget-boolean v0, p0, Lg7;->h0:Z

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    iget-object v0, p0, Lg7;->u:Landroid/view/Window;

    .line 23
    .line 24
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iget-object v1, p0, Lg7;->j0:Lr6;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 31
    .line 32
    .line 33
    :cond_1
    const/4 v0, 0x1

    .line 34
    iput-boolean v0, p0, Lg7;->Z:Z

    .line 35
    .line 36
    iget v0, p0, Lg7;->b0:I

    .line 37
    .line 38
    const/16 v1, -0x64

    .line 39
    .line 40
    if-eq v0, v1, :cond_2

    .line 41
    .line 42
    iget-object v0, p0, Lg7;->s:Ljava/lang/Object;

    .line 43
    .line 44
    instance-of v1, v0, Landroid/app/Activity;

    .line 45
    .line 46
    if-eqz v1, :cond_2

    .line 47
    .line 48
    check-cast v0, Landroid/app/Activity;

    .line 49
    .line 50
    invoke-virtual {v0}, Landroid/app/Activity;->isChangingConfigurations()Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-eqz v0, :cond_2

    .line 55
    .line 56
    sget-object v0, Lg7;->q0:Lu71;

    .line 57
    .line 58
    iget-object v1, p0, Lg7;->s:Ljava/lang/Object;

    .line 59
    .line 60
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    iget v2, p0, Lg7;->b0:I

    .line 69
    .line 70
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    invoke-virtual {v0, v1, v2}, Lu71;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    goto :goto_1

    .line 78
    :cond_2
    sget-object v0, Lg7;->q0:Lu71;

    .line 79
    .line 80
    iget-object v1, p0, Lg7;->s:Ljava/lang/Object;

    .line 81
    .line 82
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    invoke-virtual {v0, v1}, Lu71;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    :goto_1
    iget-object v0, p0, Lg7;->f0:Lb7;

    .line 94
    .line 95
    if-eqz v0, :cond_3

    .line 96
    .line 97
    invoke-virtual {v0}, Ld7;->c()V

    .line 98
    .line 99
    .line 100
    :cond_3
    iget-object p0, p0, Lg7;->g0:Lb7;

    .line 101
    .line 102
    if-eqz p0, :cond_4

    .line 103
    .line 104
    invoke-virtual {p0}, Ld7;->c()V

    .line 105
    .line 106
    .line 107
    :cond_4
    return-void
.end method

.method public final e(Lrm0;Landroid/view/MenuItem;)Z
    .locals 6

    .line 1
    iget-object v0, p0, Lg7;->u:Landroid/view/Window;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/Window;->getCallback()Landroid/view/Window$Callback;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_3

    .line 9
    .line 10
    iget-boolean v2, p0, Lg7;->Z:Z

    .line 11
    .line 12
    if-nez v2, :cond_3

    .line 13
    .line 14
    invoke-virtual {p1}, Lrm0;->k()Lrm0;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iget-object p0, p0, Lg7;->U:[Lf7;

    .line 19
    .line 20
    if-eqz p0, :cond_0

    .line 21
    .line 22
    array-length v2, p0

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    move v2, v1

    .line 25
    :goto_0
    move v3, v1

    .line 26
    :goto_1
    if-ge v3, v2, :cond_2

    .line 27
    .line 28
    aget-object v4, p0, v3

    .line 29
    .line 30
    if-eqz v4, :cond_1

    .line 31
    .line 32
    iget-object v5, v4, Lf7;->h:Lrm0;

    .line 33
    .line 34
    if-ne v5, p1, :cond_1

    .line 35
    .line 36
    goto :goto_2

    .line 37
    :cond_1
    add-int/lit8 v3, v3, 0x1

    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_2
    const/4 v4, 0x0

    .line 41
    :goto_2
    if-eqz v4, :cond_3

    .line 42
    .line 43
    iget p0, v4, Lf7;->a:I

    .line 44
    .line 45
    invoke-interface {v0, p0, p2}, Landroid/view/Window$Callback;->onMenuItemSelected(ILandroid/view/MenuItem;)Z

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    return p0

    .line 50
    :cond_3
    return v1
.end method

.method public final f(I)Z
    .locals 5

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    const/16 v1, 0x6d

    .line 4
    .line 5
    const/16 v2, 0x6c

    .line 6
    .line 7
    if-ne p1, v0, :cond_0

    .line 8
    .line 9
    move p1, v2

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/16 v0, 0x9

    .line 12
    .line 13
    if-ne p1, v0, :cond_1

    .line 14
    .line 15
    move p1, v1

    .line 16
    :cond_1
    :goto_0
    iget-boolean v0, p0, Lg7;->S:Z

    .line 17
    .line 18
    const/4 v3, 0x0

    .line 19
    if-eqz v0, :cond_2

    .line 20
    .line 21
    if-ne p1, v2, :cond_2

    .line 22
    .line 23
    return v3

    .line 24
    :cond_2
    iget-boolean v0, p0, Lg7;->O:Z

    .line 25
    .line 26
    const/4 v4, 0x1

    .line 27
    if-eqz v0, :cond_3

    .line 28
    .line 29
    if-ne p1, v4, :cond_3

    .line 30
    .line 31
    iput-boolean v3, p0, Lg7;->O:Z

    .line 32
    .line 33
    :cond_3
    if-eq p1, v4, :cond_9

    .line 34
    .line 35
    const/4 v0, 0x2

    .line 36
    if-eq p1, v0, :cond_8

    .line 37
    .line 38
    const/4 v0, 0x5

    .line 39
    if-eq p1, v0, :cond_7

    .line 40
    .line 41
    const/16 v0, 0xa

    .line 42
    .line 43
    if-eq p1, v0, :cond_6

    .line 44
    .line 45
    if-eq p1, v2, :cond_5

    .line 46
    .line 47
    if-eq p1, v1, :cond_4

    .line 48
    .line 49
    iget-object p0, p0, Lg7;->u:Landroid/view/Window;

    .line 50
    .line 51
    invoke-virtual {p0, p1}, Landroid/view/Window;->requestFeature(I)Z

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    return p0

    .line 56
    :cond_4
    invoke-virtual {p0}, Lg7;->F()V

    .line 57
    .line 58
    .line 59
    iput-boolean v4, p0, Lg7;->P:Z

    .line 60
    .line 61
    return v4

    .line 62
    :cond_5
    invoke-virtual {p0}, Lg7;->F()V

    .line 63
    .line 64
    .line 65
    iput-boolean v4, p0, Lg7;->O:Z

    .line 66
    .line 67
    return v4

    .line 68
    :cond_6
    invoke-virtual {p0}, Lg7;->F()V

    .line 69
    .line 70
    .line 71
    iput-boolean v4, p0, Lg7;->Q:Z

    .line 72
    .line 73
    return v4

    .line 74
    :cond_7
    invoke-virtual {p0}, Lg7;->F()V

    .line 75
    .line 76
    .line 77
    iput-boolean v4, p0, Lg7;->N:Z

    .line 78
    .line 79
    return v4

    .line 80
    :cond_8
    invoke-virtual {p0}, Lg7;->F()V

    .line 81
    .line 82
    .line 83
    iput-boolean v4, p0, Lg7;->M:Z

    .line 84
    .line 85
    return v4

    .line 86
    :cond_9
    invoke-virtual {p0}, Lg7;->F()V

    .line 87
    .line 88
    .line 89
    iput-boolean v4, p0, Lg7;->S:Z

    .line 90
    .line 91
    return v4
.end method

.method public final g(I)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lg7;->u()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lg7;->J:Landroid/view/ViewGroup;

    .line 5
    .line 6
    const v1, 0x1020002

    .line 7
    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Landroid/view/ViewGroup;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lg7;->t:Landroid/content/Context;

    .line 19
    .line 20
    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v1, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Lg7;->v:La7;

    .line 28
    .line 29
    iget-object p0, p0, Lg7;->u:Landroid/view/Window;

    .line 30
    .line 31
    invoke-virtual {p0}, Landroid/view/Window;->getCallback()Landroid/view/Window$Callback;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p1, p0}, La7;->a(Landroid/view/Window$Callback;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final h(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lg7;->u()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lg7;->J:Landroid/view/ViewGroup;

    .line 5
    .line 6
    const v1, 0x1020002

    .line 7
    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Landroid/view/ViewGroup;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Lg7;->v:La7;

    .line 22
    .line 23
    iget-object p0, p0, Lg7;->u:Landroid/view/Window;

    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/view/Window;->getCallback()Landroid/view/Window$Callback;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p1, p0}, La7;->a(Landroid/view/Window$Callback;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final i(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lg7;->u()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lg7;->J:Landroid/view/ViewGroup;

    .line 5
    .line 6
    const v1, 0x1020002

    .line 7
    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Landroid/view/ViewGroup;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p1, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Lg7;->v:La7;

    .line 22
    .line 23
    iget-object p0, p0, Lg7;->u:Landroid/view/Window;

    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/view/Window;->getCallback()Landroid/view/Window$Callback;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p1, p0}, La7;->a(Landroid/view/Window$Callback;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final j(Ljava/lang/CharSequence;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lg7;->y:Ljava/lang/CharSequence;

    .line 2
    .line 3
    iget-object v0, p0, Lg7;->z:Landroidx/appcompat/widget/ActionBarOverlayLayout;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->setWindowTitle(Ljava/lang/CharSequence;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget-object v0, p0, Lg7;->w:Lvj1;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    iget-object p0, v0, Lvj1;->e:Lcv;

    .line 16
    .line 17
    check-cast p0, Lcd1;

    .line 18
    .line 19
    iget-boolean v0, p0, Lcd1;->g:Z

    .line 20
    .line 21
    if-nez v0, :cond_2

    .line 22
    .line 23
    iget-object v0, p0, Lcd1;->a:Landroidx/appcompat/widget/Toolbar;

    .line 24
    .line 25
    iput-object p1, p0, Lcd1;->h:Ljava/lang/CharSequence;

    .line 26
    .line 27
    iget v1, p0, Lcd1;->b:I

    .line 28
    .line 29
    and-int/lit8 v1, v1, 0x8

    .line 30
    .line 31
    if-eqz v1, :cond_2

    .line 32
    .line 33
    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/Toolbar;->setTitle(Ljava/lang/CharSequence;)V

    .line 34
    .line 35
    .line 36
    iget-boolean p0, p0, Lcd1;->g:Z

    .line 37
    .line 38
    if-eqz p0, :cond_2

    .line 39
    .line 40
    invoke-virtual {v0}, Landroid/view/View;->getRootView()Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-static {p0, p1}, Lzh1;->j(Landroid/view/View;Ljava/lang/CharSequence;)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_1
    iget-object p0, p0, Lg7;->K:Landroid/widget/TextView;

    .line 49
    .line 50
    if-eqz p0, :cond_2

    .line 51
    .line 52
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 53
    .line 54
    .line 55
    :cond_2
    return-void
.end method

.method public final k(ZZ)Z
    .locals 13

    .line 1
    iget-boolean v0, p0, Lg7;->Z:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    const/16 v0, -0x64

    .line 8
    .line 9
    iget v2, p0, Lg7;->b0:I

    .line 10
    .line 11
    if-eq v2, v0, :cond_1

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_1
    sget v2, Lq6;->k:I

    .line 15
    .line 16
    :goto_0
    iget-object v0, p0, Lg7;->t:Landroid/content/Context;

    .line 17
    .line 18
    invoke-virtual {p0, v0, v2}, Lg7;->A(Landroid/content/Context;I)I

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 23
    .line 24
    const/16 v5, 0x21

    .line 25
    .line 26
    const/4 v6, 0x0

    .line 27
    if-ge v4, v5, :cond_2

    .line 28
    .line 29
    invoke-static {v0}, Lg7;->n(Landroid/content/Context;)Lbk0;

    .line 30
    .line 31
    .line 32
    move-result-object v5

    .line 33
    goto :goto_1

    .line 34
    :cond_2
    move-object v5, v6

    .line 35
    :goto_1
    if-nez p2, :cond_3

    .line 36
    .line 37
    if-eqz v5, :cond_3

    .line 38
    .line 39
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    invoke-virtual {p2}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    invoke-static {p2}, Lx6;->b(Landroid/content/res/Configuration;)Lbk0;

    .line 48
    .line 49
    .line 50
    move-result-object v5

    .line 51
    :cond_3
    invoke-static {v0, v3, v5, v6, v1}, Lg7;->r(Landroid/content/Context;ILbk0;Landroid/content/res/Configuration;Z)Landroid/content/res/Configuration;

    .line 52
    .line 53
    .line 54
    move-result-object p2

    .line 55
    iget-boolean v3, p0, Lg7;->e0:Z

    .line 56
    .line 57
    const/4 v7, 0x1

    .line 58
    iget-object v8, p0, Lg7;->s:Ljava/lang/Object;

    .line 59
    .line 60
    if-nez v3, :cond_6

    .line 61
    .line 62
    instance-of v3, v8, Landroid/app/Activity;

    .line 63
    .line 64
    if-eqz v3, :cond_6

    .line 65
    .line 66
    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 67
    .line 68
    .line 69
    move-result-object v3

    .line 70
    if-nez v3, :cond_4

    .line 71
    .line 72
    move v3, v1

    .line 73
    goto :goto_4

    .line 74
    :cond_4
    const/16 v9, 0x1d

    .line 75
    .line 76
    if-lt v4, v9, :cond_5

    .line 77
    .line 78
    const/high16 v4, 0x100c0000

    .line 79
    .line 80
    goto :goto_2

    .line 81
    :cond_5
    const/high16 v4, 0xc0000

    .line 82
    .line 83
    :goto_2
    :try_start_0
    new-instance v9, Landroid/content/ComponentName;

    .line 84
    .line 85
    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 86
    .line 87
    .line 88
    move-result-object v10

    .line 89
    invoke-direct {v9, v0, v10}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {v3, v9, v4}, Landroid/content/pm/PackageManager;->getActivityInfo(Landroid/content/ComponentName;I)Landroid/content/pm/ActivityInfo;

    .line 93
    .line 94
    .line 95
    move-result-object v3

    .line 96
    if-eqz v3, :cond_6

    .line 97
    .line 98
    iget v3, v3, Landroid/content/pm/ActivityInfo;->configChanges:I

    .line 99
    .line 100
    iput v3, p0, Lg7;->d0:I
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 101
    .line 102
    goto :goto_3

    .line 103
    :catch_0
    iput v1, p0, Lg7;->d0:I

    .line 104
    .line 105
    :cond_6
    :goto_3
    iput-boolean v7, p0, Lg7;->e0:Z

    .line 106
    .line 107
    iget v3, p0, Lg7;->d0:I

    .line 108
    .line 109
    :goto_4
    iget-object v4, p0, Lg7;->a0:Landroid/content/res/Configuration;

    .line 110
    .line 111
    if-nez v4, :cond_7

    .line 112
    .line 113
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 114
    .line 115
    .line 116
    move-result-object v4

    .line 117
    invoke-virtual {v4}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 118
    .line 119
    .line 120
    move-result-object v4

    .line 121
    :cond_7
    iget v9, v4, Landroid/content/res/Configuration;->uiMode:I

    .line 122
    .line 123
    and-int/lit8 v9, v9, 0x30

    .line 124
    .line 125
    iget v10, p2, Landroid/content/res/Configuration;->uiMode:I

    .line 126
    .line 127
    and-int/lit8 v10, v10, 0x30

    .line 128
    .line 129
    invoke-static {v4}, Lx6;->b(Landroid/content/res/Configuration;)Lbk0;

    .line 130
    .line 131
    .line 132
    move-result-object v4

    .line 133
    if-nez v5, :cond_8

    .line 134
    .line 135
    move-object v5, v6

    .line 136
    goto :goto_5

    .line 137
    :cond_8
    invoke-static {p2}, Lx6;->b(Landroid/content/res/Configuration;)Lbk0;

    .line 138
    .line 139
    .line 140
    move-result-object v5

    .line 141
    :goto_5
    if-eq v9, v10, :cond_9

    .line 142
    .line 143
    const/16 v9, 0x200

    .line 144
    .line 145
    goto :goto_6

    .line 146
    :cond_9
    move v9, v1

    .line 147
    :goto_6
    if-eqz v5, :cond_a

    .line 148
    .line 149
    invoke-virtual {v4, v5}, Lbk0;->equals(Ljava/lang/Object;)Z

    .line 150
    .line 151
    .line 152
    move-result v4

    .line 153
    if-nez v4, :cond_a

    .line 154
    .line 155
    or-int/lit16 v9, v9, 0x2004

    .line 156
    .line 157
    :cond_a
    not-int v4, v3

    .line 158
    and-int/2addr v4, v9

    .line 159
    const/16 v11, 0x1c

    .line 160
    .line 161
    if-eqz v4, :cond_e

    .line 162
    .line 163
    if-eqz p1, :cond_e

    .line 164
    .line 165
    iget-boolean p1, p0, Lg7;->X:Z

    .line 166
    .line 167
    if-eqz p1, :cond_e

    .line 168
    .line 169
    sget-boolean p1, Lg7;->s0:Z

    .line 170
    .line 171
    if-nez p1, :cond_b

    .line 172
    .line 173
    iget-boolean p1, p0, Lg7;->Y:Z

    .line 174
    .line 175
    if-eqz p1, :cond_e

    .line 176
    .line 177
    :cond_b
    instance-of p1, v8, Landroid/app/Activity;

    .line 178
    .line 179
    if-eqz p1, :cond_e

    .line 180
    .line 181
    move-object p1, v8

    .line 182
    check-cast p1, Landroid/app/Activity;

    .line 183
    .line 184
    invoke-virtual {p1}, Landroid/app/Activity;->isChild()Z

    .line 185
    .line 186
    .line 187
    move-result v4

    .line 188
    if-nez v4, :cond_e

    .line 189
    .line 190
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 191
    .line 192
    const/16 v12, 0x1f

    .line 193
    .line 194
    if-lt v4, v12, :cond_c

    .line 195
    .line 196
    and-int/lit16 v12, v9, 0x2000

    .line 197
    .line 198
    if-eqz v12, :cond_c

    .line 199
    .line 200
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 201
    .line 202
    .line 203
    move-result-object v12

    .line 204
    invoke-virtual {v12}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 205
    .line 206
    .line 207
    move-result-object v12

    .line 208
    invoke-virtual {p2}, Landroid/content/res/Configuration;->getLayoutDirection()I

    .line 209
    .line 210
    .line 211
    move-result p2

    .line 212
    invoke-virtual {v12, p2}, Landroid/view/View;->setLayoutDirection(I)V

    .line 213
    .line 214
    .line 215
    :cond_c
    if-lt v4, v11, :cond_d

    .line 216
    .line 217
    invoke-virtual {p1}, Landroid/app/Activity;->recreate()V

    .line 218
    .line 219
    .line 220
    goto :goto_7

    .line 221
    :cond_d
    new-instance p2, Landroid/os/Handler;

    .line 222
    .line 223
    invoke-virtual {p1}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    .line 224
    .line 225
    .line 226
    move-result-object v4

    .line 227
    invoke-direct {p2, v4}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 228
    .line 229
    .line 230
    new-instance v4, La3;

    .line 231
    .line 232
    invoke-direct {v4, v1, p1}, La3;-><init>(ILjava/lang/Object;)V

    .line 233
    .line 234
    .line 235
    invoke-virtual {p2, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 236
    .line 237
    .line 238
    :goto_7
    move p1, v7

    .line 239
    goto :goto_8

    .line 240
    :cond_e
    move p1, v1

    .line 241
    :goto_8
    if-nez p1, :cond_1e

    .line 242
    .line 243
    if-eqz v9, :cond_1e

    .line 244
    .line 245
    and-int p1, v9, v3

    .line 246
    .line 247
    if-ne p1, v9, :cond_f

    .line 248
    .line 249
    move v1, v7

    .line 250
    :cond_f
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 251
    .line 252
    .line 253
    move-result-object p1

    .line 254
    new-instance p2, Landroid/content/res/Configuration;

    .line 255
    .line 256
    invoke-virtual {p1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 257
    .line 258
    .line 259
    move-result-object v3

    .line 260
    invoke-direct {p2, v3}, Landroid/content/res/Configuration;-><init>(Landroid/content/res/Configuration;)V

    .line 261
    .line 262
    .line 263
    invoke-virtual {p1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 264
    .line 265
    .line 266
    move-result-object v3

    .line 267
    iget v3, v3, Landroid/content/res/Configuration;->uiMode:I

    .line 268
    .line 269
    and-int/lit8 v3, v3, -0x31

    .line 270
    .line 271
    or-int/2addr v3, v10

    .line 272
    iput v3, p2, Landroid/content/res/Configuration;->uiMode:I

    .line 273
    .line 274
    if-eqz v5, :cond_10

    .line 275
    .line 276
    invoke-static {p2, v5}, Lx6;->d(Landroid/content/res/Configuration;Lbk0;)V

    .line 277
    .line 278
    .line 279
    :cond_10
    invoke-virtual {p1, p2, v6}, Landroid/content/res/Resources;->updateConfiguration(Landroid/content/res/Configuration;Landroid/util/DisplayMetrics;)V

    .line 280
    .line 281
    .line 282
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 283
    .line 284
    const/16 v4, 0x1a

    .line 285
    .line 286
    if-ge v3, v4, :cond_1b

    .line 287
    .line 288
    if-lt v3, v11, :cond_11

    .line 289
    .line 290
    goto/16 :goto_b

    .line 291
    .line 292
    :cond_11
    sget-boolean v3, Lju1;->u:Z

    .line 293
    .line 294
    if-nez v3, :cond_12

    .line 295
    .line 296
    :try_start_1
    const-class v3, Landroid/content/res/Resources;

    .line 297
    .line 298
    const-string v4, "mResourcesImpl"

    .line 299
    .line 300
    invoke-virtual {v3, v4}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 301
    .line 302
    .line 303
    move-result-object v3

    .line 304
    sput-object v3, Lju1;->t:Ljava/lang/reflect/Field;

    .line 305
    .line 306
    invoke-virtual {v3, v7}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V
    :try_end_1
    .catch Ljava/lang/NoSuchFieldException; {:try_start_1 .. :try_end_1} :catch_1

    .line 307
    .line 308
    .line 309
    :catch_1
    sput-boolean v7, Lju1;->u:Z

    .line 310
    .line 311
    :cond_12
    sget-object v3, Lju1;->t:Ljava/lang/reflect/Field;

    .line 312
    .line 313
    if-nez v3, :cond_13

    .line 314
    .line 315
    goto :goto_b

    .line 316
    :cond_13
    :try_start_2
    invoke-virtual {v3, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 317
    .line 318
    .line 319
    move-result-object p1
    :try_end_2
    .catch Ljava/lang/IllegalAccessException; {:try_start_2 .. :try_end_2} :catch_2

    .line 320
    goto :goto_9

    .line 321
    :catch_2
    move-object p1, v6

    .line 322
    :goto_9
    if-nez p1, :cond_14

    .line 323
    .line 324
    goto :goto_b

    .line 325
    :cond_14
    sget-boolean v3, Lju1;->o:Z

    .line 326
    .line 327
    if-nez v3, :cond_15

    .line 328
    .line 329
    :try_start_3
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 330
    .line 331
    .line 332
    move-result-object v3

    .line 333
    const-string v4, "mDrawableCache"

    .line 334
    .line 335
    invoke-virtual {v3, v4}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 336
    .line 337
    .line 338
    move-result-object v3

    .line 339
    sput-object v3, Lju1;->n:Ljava/lang/reflect/Field;

    .line 340
    .line 341
    invoke-virtual {v3, v7}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V
    :try_end_3
    .catch Ljava/lang/NoSuchFieldException; {:try_start_3 .. :try_end_3} :catch_3

    .line 342
    .line 343
    .line 344
    :catch_3
    sput-boolean v7, Lju1;->o:Z

    .line 345
    .line 346
    :cond_15
    sget-object v3, Lju1;->n:Ljava/lang/reflect/Field;

    .line 347
    .line 348
    if-eqz v3, :cond_16

    .line 349
    .line 350
    :try_start_4
    invoke-virtual {v3, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 351
    .line 352
    .line 353
    move-result-object p1
    :try_end_4
    .catch Ljava/lang/IllegalAccessException; {:try_start_4 .. :try_end_4} :catch_4

    .line 354
    goto :goto_a

    .line 355
    :catch_4
    :cond_16
    move-object p1, v6

    .line 356
    :goto_a
    if-eqz p1, :cond_1b

    .line 357
    .line 358
    sget-boolean v3, Lju1;->q:Z

    .line 359
    .line 360
    if-nez v3, :cond_17

    .line 361
    .line 362
    :try_start_5
    const-string v3, "android.content.res.ThemedResourceCache"

    .line 363
    .line 364
    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 365
    .line 366
    .line 367
    move-result-object v3

    .line 368
    sput-object v3, Lju1;->p:Ljava/lang/Class;
    :try_end_5
    .catch Ljava/lang/ClassNotFoundException; {:try_start_5 .. :try_end_5} :catch_5

    .line 369
    .line 370
    :catch_5
    sput-boolean v7, Lju1;->q:Z

    .line 371
    .line 372
    :cond_17
    sget-object v3, Lju1;->p:Ljava/lang/Class;

    .line 373
    .line 374
    if-nez v3, :cond_18

    .line 375
    .line 376
    goto :goto_b

    .line 377
    :cond_18
    sget-boolean v4, Lju1;->s:Z

    .line 378
    .line 379
    if-nez v4, :cond_19

    .line 380
    .line 381
    :try_start_6
    const-string v4, "mUnthemedEntries"

    .line 382
    .line 383
    invoke-virtual {v3, v4}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 384
    .line 385
    .line 386
    move-result-object v3

    .line 387
    sput-object v3, Lju1;->r:Ljava/lang/reflect/Field;

    .line 388
    .line 389
    invoke-virtual {v3, v7}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V
    :try_end_6
    .catch Ljava/lang/NoSuchFieldException; {:try_start_6 .. :try_end_6} :catch_6

    .line 390
    .line 391
    .line 392
    :catch_6
    sput-boolean v7, Lju1;->s:Z

    .line 393
    .line 394
    :cond_19
    sget-object v3, Lju1;->r:Ljava/lang/reflect/Field;

    .line 395
    .line 396
    if-nez v3, :cond_1a

    .line 397
    .line 398
    goto :goto_b

    .line 399
    :cond_1a
    :try_start_7
    invoke-virtual {v3, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 400
    .line 401
    .line 402
    move-result-object p1

    .line 403
    check-cast p1, Landroid/util/LongSparseArray;
    :try_end_7
    .catch Ljava/lang/IllegalAccessException; {:try_start_7 .. :try_end_7} :catch_7

    .line 404
    .line 405
    move-object v6, p1

    .line 406
    :catch_7
    if-eqz v6, :cond_1b

    .line 407
    .line 408
    invoke-virtual {v6}, Landroid/util/LongSparseArray;->clear()V

    .line 409
    .line 410
    .line 411
    :cond_1b
    :goto_b
    iget p1, p0, Lg7;->c0:I

    .line 412
    .line 413
    if-eqz p1, :cond_1c

    .line 414
    .line 415
    invoke-virtual {v0, p1}, Landroid/content/Context;->setTheme(I)V

    .line 416
    .line 417
    .line 418
    invoke-virtual {v0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    .line 419
    .line 420
    .line 421
    move-result-object p1

    .line 422
    iget v3, p0, Lg7;->c0:I

    .line 423
    .line 424
    invoke-virtual {p1, v3, v7}, Landroid/content/res/Resources$Theme;->applyStyle(IZ)V

    .line 425
    .line 426
    .line 427
    :cond_1c
    if-eqz v1, :cond_1f

    .line 428
    .line 429
    instance-of p1, v8, Landroid/app/Activity;

    .line 430
    .line 431
    if-eqz p1, :cond_1f

    .line 432
    .line 433
    check-cast v8, Landroid/app/Activity;

    .line 434
    .line 435
    instance-of p1, v8, Lci0;

    .line 436
    .line 437
    if-eqz p1, :cond_1d

    .line 438
    .line 439
    move-object p1, v8

    .line 440
    check-cast p1, Lci0;

    .line 441
    .line 442
    invoke-interface {p1}, Lci0;->e()Landroidx/lifecycle/a;

    .line 443
    .line 444
    .line 445
    move-result-object p1

    .line 446
    iget-object p1, p1, Landroidx/lifecycle/a;->b:Lwh0;

    .line 447
    .line 448
    sget-object v1, Lwh0;->l:Lwh0;

    .line 449
    .line 450
    invoke-virtual {p1, v1}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    .line 451
    .line 452
    .line 453
    move-result p1

    .line 454
    if-ltz p1, :cond_1f

    .line 455
    .line 456
    invoke-virtual {v8, p2}, Landroid/app/Activity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 457
    .line 458
    .line 459
    goto :goto_c

    .line 460
    :cond_1d
    iget-boolean p1, p0, Lg7;->Y:Z

    .line 461
    .line 462
    if-eqz p1, :cond_1f

    .line 463
    .line 464
    iget-boolean p1, p0, Lg7;->Z:Z

    .line 465
    .line 466
    if-nez p1, :cond_1f

    .line 467
    .line 468
    invoke-virtual {v8, p2}, Landroid/app/Activity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 469
    .line 470
    .line 471
    goto :goto_c

    .line 472
    :cond_1e
    move v7, p1

    .line 473
    :cond_1f
    :goto_c
    if-eqz v5, :cond_20

    .line 474
    .line 475
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 476
    .line 477
    .line 478
    move-result-object p1

    .line 479
    invoke-virtual {p1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 480
    .line 481
    .line 482
    move-result-object p1

    .line 483
    invoke-static {p1}, Lx6;->b(Landroid/content/res/Configuration;)Lbk0;

    .line 484
    .line 485
    .line 486
    move-result-object p1

    .line 487
    invoke-static {p1}, Lx6;->c(Lbk0;)V

    .line 488
    .line 489
    .line 490
    :cond_20
    if-nez v2, :cond_21

    .line 491
    .line 492
    invoke-virtual {p0, v0}, Lg7;->w(Landroid/content/Context;)Ld7;

    .line 493
    .line 494
    .line 495
    move-result-object p1

    .line 496
    invoke-virtual {p1}, Ld7;->i()V

    .line 497
    .line 498
    .line 499
    goto :goto_d

    .line 500
    :cond_21
    iget-object p1, p0, Lg7;->f0:Lb7;

    .line 501
    .line 502
    if-eqz p1, :cond_22

    .line 503
    .line 504
    invoke-virtual {p1}, Ld7;->c()V

    .line 505
    .line 506
    .line 507
    :cond_22
    :goto_d
    iget-object p1, p0, Lg7;->g0:Lb7;

    .line 508
    .line 509
    const/4 p2, 0x3

    .line 510
    if-ne v2, p2, :cond_24

    .line 511
    .line 512
    if-nez p1, :cond_23

    .line 513
    .line 514
    new-instance p1, Lb7;

    .line 515
    .line 516
    invoke-direct {p1, p0, v0}, Lb7;-><init>(Lg7;Landroid/content/Context;)V

    .line 517
    .line 518
    .line 519
    iput-object p1, p0, Lg7;->g0:Lb7;

    .line 520
    .line 521
    :cond_23
    invoke-virtual {p1}, Ld7;->i()V

    .line 522
    .line 523
    .line 524
    goto :goto_e

    .line 525
    :cond_24
    if-eqz p1, :cond_25

    .line 526
    .line 527
    invoke-virtual {p1}, Ld7;->c()V

    .line 528
    .line 529
    .line 530
    :cond_25
    :goto_e
    return v7
.end method

.method public final l(Lrm0;)V
    .locals 5

    .line 1
    iget-object p1, p0, Lg7;->z:Landroidx/appcompat/widget/ActionBarOverlayLayout;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    const/4 v1, 0x0

    .line 5
    if-eqz p1, :cond_5

    .line 6
    .line 7
    invoke-virtual {p1}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->k()V

    .line 8
    .line 9
    .line 10
    iget-object p1, p1, Landroidx/appcompat/widget/ActionBarOverlayLayout;->n:Lcv;

    .line 11
    .line 12
    check-cast p1, Lcd1;

    .line 13
    .line 14
    iget-object p1, p1, Lcd1;->a:Landroidx/appcompat/widget/Toolbar;

    .line 15
    .line 16
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    if-nez v2, :cond_5

    .line 21
    .line 22
    iget-object p1, p1, Landroidx/appcompat/widget/Toolbar;->j:Landroidx/appcompat/widget/ActionMenuView;

    .line 23
    .line 24
    if-eqz p1, :cond_5

    .line 25
    .line 26
    iget-boolean p1, p1, Landroidx/appcompat/widget/ActionMenuView;->B:Z

    .line 27
    .line 28
    if-eqz p1, :cond_5

    .line 29
    .line 30
    iget-object p1, p0, Lg7;->t:Landroid/content/Context;

    .line 31
    .line 32
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->hasPermanentMenuKey()Z

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    if-eqz p1, :cond_0

    .line 41
    .line 42
    iget-object p1, p0, Lg7;->z:Landroidx/appcompat/widget/ActionBarOverlayLayout;

    .line 43
    .line 44
    invoke-virtual {p1}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->k()V

    .line 45
    .line 46
    .line 47
    iget-object p1, p1, Landroidx/appcompat/widget/ActionBarOverlayLayout;->n:Lcv;

    .line 48
    .line 49
    check-cast p1, Lcd1;

    .line 50
    .line 51
    iget-object p1, p1, Lcd1;->a:Landroidx/appcompat/widget/Toolbar;

    .line 52
    .line 53
    iget-object p1, p1, Landroidx/appcompat/widget/Toolbar;->j:Landroidx/appcompat/widget/ActionMenuView;

    .line 54
    .line 55
    if-eqz p1, :cond_5

    .line 56
    .line 57
    iget-object p1, p1, Landroidx/appcompat/widget/ActionMenuView;->C:Lu2;

    .line 58
    .line 59
    if-eqz p1, :cond_5

    .line 60
    .line 61
    iget-object v2, p1, Lu2;->D:Ls2;

    .line 62
    .line 63
    if-nez v2, :cond_0

    .line 64
    .line 65
    invoke-virtual {p1}, Lu2;->h()Z

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    if-eqz p1, :cond_5

    .line 70
    .line 71
    :cond_0
    iget-object p1, p0, Lg7;->u:Landroid/view/Window;

    .line 72
    .line 73
    invoke-virtual {p1}, Landroid/view/Window;->getCallback()Landroid/view/Window$Callback;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    iget-object v2, p0, Lg7;->z:Landroidx/appcompat/widget/ActionBarOverlayLayout;

    .line 78
    .line 79
    invoke-virtual {v2}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->k()V

    .line 80
    .line 81
    .line 82
    iget-object v2, v2, Landroidx/appcompat/widget/ActionBarOverlayLayout;->n:Lcv;

    .line 83
    .line 84
    check-cast v2, Lcd1;

    .line 85
    .line 86
    iget-object v2, v2, Lcd1;->a:Landroidx/appcompat/widget/Toolbar;

    .line 87
    .line 88
    iget-object v2, v2, Landroidx/appcompat/widget/Toolbar;->j:Landroidx/appcompat/widget/ActionMenuView;

    .line 89
    .line 90
    const/16 v3, 0x6c

    .line 91
    .line 92
    if-eqz v2, :cond_2

    .line 93
    .line 94
    iget-object v2, v2, Landroidx/appcompat/widget/ActionMenuView;->C:Lu2;

    .line 95
    .line 96
    if-eqz v2, :cond_2

    .line 97
    .line 98
    invoke-virtual {v2}, Lu2;->h()Z

    .line 99
    .line 100
    .line 101
    move-result v2

    .line 102
    if-eqz v2, :cond_2

    .line 103
    .line 104
    iget-object v0, p0, Lg7;->z:Landroidx/appcompat/widget/ActionBarOverlayLayout;

    .line 105
    .line 106
    invoke-virtual {v0}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->k()V

    .line 107
    .line 108
    .line 109
    iget-object v0, v0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->n:Lcv;

    .line 110
    .line 111
    check-cast v0, Lcd1;

    .line 112
    .line 113
    iget-object v0, v0, Lcd1;->a:Landroidx/appcompat/widget/Toolbar;

    .line 114
    .line 115
    iget-object v0, v0, Landroidx/appcompat/widget/Toolbar;->j:Landroidx/appcompat/widget/ActionMenuView;

    .line 116
    .line 117
    if-eqz v0, :cond_1

    .line 118
    .line 119
    iget-object v0, v0, Landroidx/appcompat/widget/ActionMenuView;->C:Lu2;

    .line 120
    .line 121
    if-eqz v0, :cond_1

    .line 122
    .line 123
    invoke-virtual {v0}, Lu2;->c()Z

    .line 124
    .line 125
    .line 126
    move-result v0

    .line 127
    :cond_1
    iget-boolean v0, p0, Lg7;->Z:Z

    .line 128
    .line 129
    if-nez v0, :cond_4

    .line 130
    .line 131
    invoke-virtual {p0, v1}, Lg7;->x(I)Lf7;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    iget-object p0, p0, Lf7;->h:Lrm0;

    .line 136
    .line 137
    invoke-interface {p1, v3, p0}, Landroid/view/Window$Callback;->onPanelClosed(ILandroid/view/Menu;)V

    .line 138
    .line 139
    .line 140
    return-void

    .line 141
    :cond_2
    if-eqz p1, :cond_4

    .line 142
    .line 143
    iget-boolean v2, p0, Lg7;->Z:Z

    .line 144
    .line 145
    if-nez v2, :cond_4

    .line 146
    .line 147
    iget-boolean v2, p0, Lg7;->h0:Z

    .line 148
    .line 149
    if-eqz v2, :cond_3

    .line 150
    .line 151
    iget v2, p0, Lg7;->i0:I

    .line 152
    .line 153
    and-int/2addr v0, v2

    .line 154
    if-eqz v0, :cond_3

    .line 155
    .line 156
    iget-object v0, p0, Lg7;->u:Landroid/view/Window;

    .line 157
    .line 158
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    iget-object v2, p0, Lg7;->j0:Lr6;

    .line 163
    .line 164
    invoke-virtual {v0, v2}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 165
    .line 166
    .line 167
    invoke-interface {v2}, Ljava/lang/Runnable;->run()V

    .line 168
    .line 169
    .line 170
    :cond_3
    invoke-virtual {p0, v1}, Lg7;->x(I)Lf7;

    .line 171
    .line 172
    .line 173
    move-result-object v0

    .line 174
    iget-object v2, v0, Lf7;->h:Lrm0;

    .line 175
    .line 176
    if-eqz v2, :cond_4

    .line 177
    .line 178
    iget-boolean v4, v0, Lf7;->o:Z

    .line 179
    .line 180
    if-nez v4, :cond_4

    .line 181
    .line 182
    iget-object v4, v0, Lf7;->g:Landroid/view/View;

    .line 183
    .line 184
    invoke-interface {p1, v1, v4, v2}, Landroid/view/Window$Callback;->onPreparePanel(ILandroid/view/View;Landroid/view/Menu;)Z

    .line 185
    .line 186
    .line 187
    move-result v1

    .line 188
    if-eqz v1, :cond_4

    .line 189
    .line 190
    iget-object v0, v0, Lf7;->h:Lrm0;

    .line 191
    .line 192
    invoke-interface {p1, v3, v0}, Landroid/view/Window$Callback;->onMenuOpened(ILandroid/view/Menu;)Z

    .line 193
    .line 194
    .line 195
    iget-object p0, p0, Lg7;->z:Landroidx/appcompat/widget/ActionBarOverlayLayout;

    .line 196
    .line 197
    invoke-virtual {p0}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->k()V

    .line 198
    .line 199
    .line 200
    iget-object p0, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->n:Lcv;

    .line 201
    .line 202
    check-cast p0, Lcd1;

    .line 203
    .line 204
    iget-object p0, p0, Lcd1;->a:Landroidx/appcompat/widget/Toolbar;

    .line 205
    .line 206
    iget-object p0, p0, Landroidx/appcompat/widget/Toolbar;->j:Landroidx/appcompat/widget/ActionMenuView;

    .line 207
    .line 208
    if-eqz p0, :cond_4

    .line 209
    .line 210
    iget-object p0, p0, Landroidx/appcompat/widget/ActionMenuView;->C:Lu2;

    .line 211
    .line 212
    if-eqz p0, :cond_4

    .line 213
    .line 214
    invoke-virtual {p0}, Lu2;->l()Z

    .line 215
    .line 216
    .line 217
    :cond_4
    return-void

    .line 218
    :cond_5
    invoke-virtual {p0, v1}, Lg7;->x(I)Lf7;

    .line 219
    .line 220
    .line 221
    move-result-object p1

    .line 222
    iput-boolean v0, p1, Lf7;->n:Z

    .line 223
    .line 224
    invoke-virtual {p0, p1, v1}, Lg7;->q(Lf7;Z)V

    .line 225
    .line 226
    .line 227
    const/4 v0, 0x0

    .line 228
    invoke-virtual {p0, p1, v0}, Lg7;->C(Lf7;Landroid/view/KeyEvent;)V

    .line 229
    .line 230
    .line 231
    return-void
.end method

.method public final m(Landroid/view/Window;)V
    .locals 7

    .line 1
    const-string v0, "AppCompat has already installed itself into the Window"

    .line 2
    .line 3
    iget-object v1, p0, Lg7;->u:Landroid/view/Window;

    .line 4
    .line 5
    if-nez v1, :cond_6

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/view/Window;->getCallback()Landroid/view/Window$Callback;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    instance-of v2, v1, La7;

    .line 12
    .line 13
    if-nez v2, :cond_5

    .line 14
    .line 15
    new-instance v0, La7;

    .line 16
    .line 17
    invoke-direct {v0, p0, v1}, La7;-><init>(Lg7;Landroid/view/Window$Callback;)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Lg7;->v:La7;

    .line 21
    .line 22
    invoke-virtual {p1, v0}, Landroid/view/Window;->setCallback(Landroid/view/Window$Callback;)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lg7;->t:Landroid/content/Context;

    .line 26
    .line 27
    sget-object v1, Lg7;->r0:[I

    .line 28
    .line 29
    const/4 v2, 0x0

    .line 30
    invoke-virtual {v0, v2, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    const/4 v3, 0x0

    .line 35
    invoke-virtual {v1, v3}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 36
    .line 37
    .line 38
    move-result v4

    .line 39
    if-eqz v4, :cond_0

    .line 40
    .line 41
    invoke-virtual {v1, v3, v3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    if-eqz v3, :cond_0

    .line 46
    .line 47
    invoke-static {}, Lj7;->a()Lj7;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    monitor-enter v4

    .line 52
    :try_start_0
    iget-object v5, v4, Lj7;->a:Lw01;

    .line 53
    .line 54
    const/4 v6, 0x1

    .line 55
    invoke-virtual {v5, v0, v3, v6}, Lw01;->e(Landroid/content/Context;IZ)Landroid/graphics/drawable/Drawable;

    .line 56
    .line 57
    .line 58
    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 59
    monitor-exit v4

    .line 60
    goto :goto_0

    .line 61
    :catchall_0
    move-exception p0

    .line 62
    :try_start_1
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 63
    throw p0

    .line 64
    :cond_0
    move-object v0, v2

    .line 65
    :goto_0
    if-eqz v0, :cond_1

    .line 66
    .line 67
    invoke-virtual {p1, v0}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 68
    .line 69
    .line 70
    :cond_1
    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    .line 71
    .line 72
    .line 73
    iput-object p1, p0, Lg7;->u:Landroid/view/Window;

    .line 74
    .line 75
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 76
    .line 77
    const/16 v0, 0x21

    .line 78
    .line 79
    if-lt p1, v0, :cond_4

    .line 80
    .line 81
    iget-object p1, p0, Lg7;->o0:Landroid/window/OnBackInvokedDispatcher;

    .line 82
    .line 83
    if-nez p1, :cond_4

    .line 84
    .line 85
    iget-object v0, p0, Lg7;->s:Ljava/lang/Object;

    .line 86
    .line 87
    if-eqz p1, :cond_2

    .line 88
    .line 89
    iget-object v1, p0, Lg7;->p0:Landroid/window/OnBackInvokedCallback;

    .line 90
    .line 91
    if-eqz v1, :cond_2

    .line 92
    .line 93
    invoke-static {p1, v1}, Lz6;->c(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 94
    .line 95
    .line 96
    iput-object v2, p0, Lg7;->p0:Landroid/window/OnBackInvokedCallback;

    .line 97
    .line 98
    :cond_2
    instance-of p1, v0, Landroid/app/Activity;

    .line 99
    .line 100
    if-eqz p1, :cond_3

    .line 101
    .line 102
    check-cast v0, Landroid/app/Activity;

    .line 103
    .line 104
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    if-eqz p1, :cond_3

    .line 109
    .line 110
    invoke-static {v0}, Lz6;->a(Landroid/app/Activity;)Landroid/window/OnBackInvokedDispatcher;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    iput-object p1, p0, Lg7;->o0:Landroid/window/OnBackInvokedDispatcher;

    .line 115
    .line 116
    goto :goto_1

    .line 117
    :cond_3
    iput-object v2, p0, Lg7;->o0:Landroid/window/OnBackInvokedDispatcher;

    .line 118
    .line 119
    :goto_1
    invoke-virtual {p0}, Lg7;->G()V

    .line 120
    .line 121
    .line 122
    :cond_4
    return-void

    .line 123
    :cond_5
    invoke-static {v0}, Lz0;->g(Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    return-void

    .line 127
    :cond_6
    invoke-static {v0}, Lz0;->g(Ljava/lang/String;)V

    .line 128
    .line 129
    .line 130
    return-void
.end method

.method public final o(ILf7;Lrm0;)V
    .locals 2

    .line 1
    if-nez p3, :cond_1

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    if-ltz p1, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lg7;->U:[Lf7;

    .line 8
    .line 9
    array-length v1, v0

    .line 10
    if-ge p1, v1, :cond_0

    .line 11
    .line 12
    aget-object p2, v0, p1

    .line 13
    .line 14
    :cond_0
    if-eqz p2, :cond_1

    .line 15
    .line 16
    iget-object p3, p2, Lf7;->h:Lrm0;

    .line 17
    .line 18
    :cond_1
    if-eqz p2, :cond_2

    .line 19
    .line 20
    iget-boolean p2, p2, Lf7;->m:Z

    .line 21
    .line 22
    if-nez p2, :cond_2

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_2
    iget-boolean p2, p0, Lg7;->Z:Z

    .line 26
    .line 27
    if-nez p2, :cond_3

    .line 28
    .line 29
    iget-object p2, p0, Lg7;->v:La7;

    .line 30
    .line 31
    iget-object p0, p0, Lg7;->u:Landroid/view/Window;

    .line 32
    .line 33
    invoke-virtual {p0}, Landroid/view/Window;->getCallback()Landroid/view/Window$Callback;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 38
    .line 39
    .line 40
    const/4 v0, 0x1

    .line 41
    const/4 v1, 0x0

    .line 42
    :try_start_0
    iput-boolean v0, p2, La7;->m:Z

    .line 43
    .line 44
    invoke-interface {p0, p1, p3}, Landroid/view/Window$Callback;->onPanelClosed(ILandroid/view/Menu;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 45
    .line 46
    .line 47
    iput-boolean v1, p2, La7;->m:Z

    .line 48
    .line 49
    return-void

    .line 50
    :catchall_0
    move-exception p0

    .line 51
    iput-boolean v1, p2, La7;->m:Z

    .line 52
    .line 53
    throw p0

    .line 54
    :cond_3
    :goto_0
    return-void
.end method

.method public final onCreateView(Landroid/view/View;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;
    .locals 8

    .line 1
    iget-object p1, p0, Lg7;->n0:Lb9;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez p1, :cond_1

    .line 5
    .line 6
    sget-object p1, Lgx0;->j:[I

    .line 7
    .line 8
    iget-object v0, p0, Lg7;->t:Landroid/content/Context;

    .line 9
    .line 10
    invoke-virtual {v0, p1}, Landroid/content/Context;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    const/16 v2, 0x74

    .line 15
    .line 16
    invoke-virtual {p1, v2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 21
    .line 22
    .line 23
    if-nez v2, :cond_0

    .line 24
    .line 25
    new-instance p1, Lb9;

    .line 26
    .line 27
    invoke-direct {p1}, Lb9;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object p1, p0, Lg7;->n0:Lb9;

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    :try_start_0
    invoke-virtual {v0}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p1, v2}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {p1, v1}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-virtual {p1, v1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    check-cast p1, Lb9;

    .line 50
    .line 51
    iput-object p1, p0, Lg7;->n0:Lb9;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :catchall_0
    new-instance p1, Lb9;

    .line 55
    .line 56
    invoke-direct {p1}, Lb9;-><init>()V

    .line 57
    .line 58
    .line 59
    iput-object p1, p0, Lg7;->n0:Lb9;

    .line 60
    .line 61
    :cond_1
    :goto_0
    sget p0, Lzg1;->a:I

    .line 62
    .line 63
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 64
    .line 65
    .line 66
    sget-object p0, Lgx0;->y:[I

    .line 67
    .line 68
    const/4 v5, 0x0

    .line 69
    invoke-virtual {p3, p4, p0, v5, v5}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    const/4 v0, 0x4

    .line 74
    invoke-virtual {p0, v0, v5}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 75
    .line 76
    .line 77
    move-result v2

    .line 78
    invoke-virtual {p0}, Landroid/content/res/TypedArray;->recycle()V

    .line 79
    .line 80
    .line 81
    if-eqz v2, :cond_3

    .line 82
    .line 83
    instance-of p0, p3, Lhq;

    .line 84
    .line 85
    if-eqz p0, :cond_2

    .line 86
    .line 87
    move-object p0, p3

    .line 88
    check-cast p0, Lhq;

    .line 89
    .line 90
    iget p0, p0, Lhq;->a:I

    .line 91
    .line 92
    if-eq p0, v2, :cond_3

    .line 93
    .line 94
    :cond_2
    new-instance p0, Lhq;

    .line 95
    .line 96
    invoke-direct {p0, p3, v2}, Lhq;-><init>(Landroid/content/Context;I)V

    .line 97
    .line 98
    .line 99
    goto :goto_1

    .line 100
    :cond_3
    move-object p0, p3

    .line 101
    :goto_1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 102
    .line 103
    .line 104
    invoke-virtual {p2}, Ljava/lang/String;->hashCode()I

    .line 105
    .line 106
    .line 107
    move-result v2

    .line 108
    const/4 v3, 0x3

    .line 109
    const/4 v4, 0x1

    .line 110
    const/4 v6, -0x1

    .line 111
    sparse-switch v2, :sswitch_data_0

    .line 112
    .line 113
    .line 114
    :goto_2
    move v0, v6

    .line 115
    goto/16 :goto_3

    .line 116
    .line 117
    :sswitch_0
    const-string v0, "Button"

    .line 118
    .line 119
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 120
    .line 121
    .line 122
    move-result v0

    .line 123
    if-nez v0, :cond_4

    .line 124
    .line 125
    goto :goto_2

    .line 126
    :cond_4
    const/16 v0, 0xd

    .line 127
    .line 128
    goto/16 :goto_3

    .line 129
    .line 130
    :sswitch_1
    const-string v0, "EditText"

    .line 131
    .line 132
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 133
    .line 134
    .line 135
    move-result v0

    .line 136
    if-nez v0, :cond_5

    .line 137
    .line 138
    goto :goto_2

    .line 139
    :cond_5
    const/16 v0, 0xc

    .line 140
    .line 141
    goto/16 :goto_3

    .line 142
    .line 143
    :sswitch_2
    const-string v0, "CheckBox"

    .line 144
    .line 145
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 146
    .line 147
    .line 148
    move-result v0

    .line 149
    if-nez v0, :cond_6

    .line 150
    .line 151
    goto :goto_2

    .line 152
    :cond_6
    const/16 v0, 0xb

    .line 153
    .line 154
    goto/16 :goto_3

    .line 155
    .line 156
    :sswitch_3
    const-string v0, "AutoCompleteTextView"

    .line 157
    .line 158
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 159
    .line 160
    .line 161
    move-result v0

    .line 162
    if-nez v0, :cond_7

    .line 163
    .line 164
    goto :goto_2

    .line 165
    :cond_7
    const/16 v0, 0xa

    .line 166
    .line 167
    goto/16 :goto_3

    .line 168
    .line 169
    :sswitch_4
    const-string v0, "ImageView"

    .line 170
    .line 171
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 172
    .line 173
    .line 174
    move-result v0

    .line 175
    if-nez v0, :cond_8

    .line 176
    .line 177
    goto :goto_2

    .line 178
    :cond_8
    const/16 v0, 0x9

    .line 179
    .line 180
    goto/16 :goto_3

    .line 181
    .line 182
    :sswitch_5
    const-string v0, "ToggleButton"

    .line 183
    .line 184
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 185
    .line 186
    .line 187
    move-result v0

    .line 188
    if-nez v0, :cond_9

    .line 189
    .line 190
    goto :goto_2

    .line 191
    :cond_9
    const/16 v0, 0x8

    .line 192
    .line 193
    goto/16 :goto_3

    .line 194
    .line 195
    :sswitch_6
    const-string v0, "RadioButton"

    .line 196
    .line 197
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 198
    .line 199
    .line 200
    move-result v0

    .line 201
    if-nez v0, :cond_a

    .line 202
    .line 203
    goto :goto_2

    .line 204
    :cond_a
    const/4 v0, 0x7

    .line 205
    goto :goto_3

    .line 206
    :sswitch_7
    const-string v0, "Spinner"

    .line 207
    .line 208
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 209
    .line 210
    .line 211
    move-result v0

    .line 212
    if-nez v0, :cond_b

    .line 213
    .line 214
    goto :goto_2

    .line 215
    :cond_b
    const/4 v0, 0x6

    .line 216
    goto :goto_3

    .line 217
    :sswitch_8
    const-string v0, "SeekBar"

    .line 218
    .line 219
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 220
    .line 221
    .line 222
    move-result v0

    .line 223
    if-nez v0, :cond_c

    .line 224
    .line 225
    goto :goto_2

    .line 226
    :cond_c
    const/4 v0, 0x5

    .line 227
    goto :goto_3

    .line 228
    :sswitch_9
    const-string v2, "ImageButton"

    .line 229
    .line 230
    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 231
    .line 232
    .line 233
    move-result v2

    .line 234
    if-nez v2, :cond_11

    .line 235
    .line 236
    goto :goto_2

    .line 237
    :sswitch_a
    const-string v0, "TextView"

    .line 238
    .line 239
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 240
    .line 241
    .line 242
    move-result v0

    .line 243
    if-nez v0, :cond_d

    .line 244
    .line 245
    goto/16 :goto_2

    .line 246
    .line 247
    :cond_d
    move v0, v3

    .line 248
    goto :goto_3

    .line 249
    :sswitch_b
    const-string v0, "MultiAutoCompleteTextView"

    .line 250
    .line 251
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 252
    .line 253
    .line 254
    move-result v0

    .line 255
    if-nez v0, :cond_e

    .line 256
    .line 257
    goto/16 :goto_2

    .line 258
    .line 259
    :cond_e
    const/4 v0, 0x2

    .line 260
    goto :goto_3

    .line 261
    :sswitch_c
    const-string v0, "CheckedTextView"

    .line 262
    .line 263
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 264
    .line 265
    .line 266
    move-result v0

    .line 267
    if-nez v0, :cond_f

    .line 268
    .line 269
    goto/16 :goto_2

    .line 270
    .line 271
    :cond_f
    move v0, v4

    .line 272
    goto :goto_3

    .line 273
    :sswitch_d
    const-string v0, "RatingBar"

    .line 274
    .line 275
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 276
    .line 277
    .line 278
    move-result v0

    .line 279
    if-nez v0, :cond_10

    .line 280
    .line 281
    goto/16 :goto_2

    .line 282
    .line 283
    :cond_10
    const/4 v0, 0x0

    .line 284
    :cond_11
    :goto_3
    packed-switch v0, :pswitch_data_0

    .line 285
    .line 286
    .line 287
    move-object v0, v1

    .line 288
    goto :goto_4

    .line 289
    :pswitch_0
    invoke-virtual {p1, p0, p4}, Lb9;->b(Landroid/content/Context;Landroid/util/AttributeSet;)Lg6;

    .line 290
    .line 291
    .line 292
    move-result-object v0

    .line 293
    goto :goto_4

    .line 294
    :pswitch_1
    new-instance v0, Ll7;

    .line 295
    .line 296
    invoke-direct {v0, p0, p4}, Ll7;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 297
    .line 298
    .line 299
    goto :goto_4

    .line 300
    :pswitch_2
    invoke-virtual {p1, p0, p4}, Lb9;->c(Landroid/content/Context;Landroid/util/AttributeSet;)Li6;

    .line 301
    .line 302
    .line 303
    move-result-object v0

    .line 304
    goto :goto_4

    .line 305
    :pswitch_3
    invoke-virtual {p1, p0, p4}, Lb9;->a(Landroid/content/Context;Landroid/util/AttributeSet;)Lf6;

    .line 306
    .line 307
    .line 308
    move-result-object v0

    .line 309
    goto :goto_4

    .line 310
    :pswitch_4
    new-instance v0, Lp7;

    .line 311
    .line 312
    invoke-direct {v0, p0, p4, v5}, Lp7;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 313
    .line 314
    .line 315
    goto :goto_4

    .line 316
    :pswitch_5
    new-instance v0, Lz8;

    .line 317
    .line 318
    invoke-direct {v0, p0, p4}, Lz8;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 319
    .line 320
    .line 321
    goto :goto_4

    .line 322
    :pswitch_6
    invoke-virtual {p1, p0, p4}, Lb9;->d(Landroid/content/Context;Landroid/util/AttributeSet;)Lt7;

    .line 323
    .line 324
    .line 325
    move-result-object v0

    .line 326
    goto :goto_4

    .line 327
    :pswitch_7
    new-instance v0, Li8;

    .line 328
    .line 329
    invoke-direct {v0, p0, p4}, Li8;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 330
    .line 331
    .line 332
    goto :goto_4

    .line 333
    :pswitch_8
    new-instance v0, Lw7;

    .line 334
    .line 335
    invoke-direct {v0, p0, p4}, Lw7;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 336
    .line 337
    .line 338
    goto :goto_4

    .line 339
    :pswitch_9
    new-instance v0, Ln7;

    .line 340
    .line 341
    const v2, 0x7f040232

    .line 342
    .line 343
    .line 344
    invoke-direct {v0, p0, p4, v2}, Ln7;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 345
    .line 346
    .line 347
    goto :goto_4

    .line 348
    :pswitch_a
    invoke-virtual {p1, p0, p4}, Lb9;->e(Landroid/content/Context;Landroid/util/AttributeSet;)Lt8;

    .line 349
    .line 350
    .line 351
    move-result-object v0

    .line 352
    goto :goto_4

    .line 353
    :pswitch_b
    new-instance v0, Lq7;

    .line 354
    .line 355
    invoke-direct {v0, p0, p4}, Lq7;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 356
    .line 357
    .line 358
    goto :goto_4

    .line 359
    :pswitch_c
    new-instance v0, Lj6;

    .line 360
    .line 361
    invoke-direct {v0, p0, p4}, Lj6;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 362
    .line 363
    .line 364
    goto :goto_4

    .line 365
    :pswitch_d
    new-instance v0, Lu7;

    .line 366
    .line 367
    invoke-direct {v0, p0, p4}, Lu7;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 368
    .line 369
    .line 370
    :goto_4
    if-nez v0, :cond_16

    .line 371
    .line 372
    if-eq p3, p0, :cond_16

    .line 373
    .line 374
    iget-object p3, p1, Lb9;->a:[Ljava/lang/Object;

    .line 375
    .line 376
    const-string v0, "view"

    .line 377
    .line 378
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 379
    .line 380
    .line 381
    move-result v0

    .line 382
    if-eqz v0, :cond_12

    .line 383
    .line 384
    const-string p2, "class"

    .line 385
    .line 386
    invoke-interface {p4, v1, p2}, Landroid/util/AttributeSet;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 387
    .line 388
    .line 389
    move-result-object p2

    .line 390
    :cond_12
    :try_start_1
    aput-object p0, p3, v5

    .line 391
    .line 392
    aput-object p4, p3, v4

    .line 393
    .line 394
    const/16 v0, 0x2e

    .line 395
    .line 396
    invoke-virtual {p2, v0}, Ljava/lang/String;->indexOf(I)I

    .line 397
    .line 398
    .line 399
    move-result v0

    .line 400
    if-ne v6, v0, :cond_15

    .line 401
    .line 402
    move v0, v5

    .line 403
    :goto_5
    sget-object v2, Lb9;->g:[Ljava/lang/String;

    .line 404
    .line 405
    if-ge v0, v3, :cond_14

    .line 406
    .line 407
    aget-object v2, v2, v0

    .line 408
    .line 409
    invoke-virtual {p1, p0, p2, v2}, Lb9;->f(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/view/View;

    .line 410
    .line 411
    .line 412
    move-result-object v2
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 413
    if-eqz v2, :cond_13

    .line 414
    .line 415
    aput-object v1, p3, v5

    .line 416
    .line 417
    aput-object v1, p3, v4

    .line 418
    .line 419
    move-object v1, v2

    .line 420
    goto :goto_7

    .line 421
    :cond_13
    add-int/lit8 v0, v0, 0x1

    .line 422
    .line 423
    goto :goto_5

    .line 424
    :catchall_1
    move-exception v0

    .line 425
    move-object p0, v0

    .line 426
    goto :goto_6

    .line 427
    :cond_14
    aput-object v1, p3, v5

    .line 428
    .line 429
    aput-object v1, p3, v4

    .line 430
    .line 431
    goto :goto_7

    .line 432
    :cond_15
    :try_start_2
    invoke-virtual {p1, p0, p2, v1}, Lb9;->f(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/view/View;

    .line 433
    .line 434
    .line 435
    move-result-object p1
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 436
    aput-object v1, p3, v5

    .line 437
    .line 438
    aput-object v1, p3, v4

    .line 439
    .line 440
    move-object v1, p1

    .line 441
    goto :goto_7

    .line 442
    :goto_6
    aput-object v1, p3, v5

    .line 443
    .line 444
    aput-object v1, p3, v4

    .line 445
    .line 446
    throw p0

    .line 447
    :catch_0
    aput-object v1, p3, v5

    .line 448
    .line 449
    aput-object v1, p3, v4

    .line 450
    .line 451
    :goto_7
    move-object v0, v1

    .line 452
    :cond_16
    if-eqz v0, :cond_1e

    .line 453
    .line 454
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 455
    .line 456
    .line 457
    move-result-object p1

    .line 458
    instance-of p2, p1, Landroid/content/ContextWrapper;

    .line 459
    .line 460
    if-eqz p2, :cond_19

    .line 461
    .line 462
    invoke-virtual {v0}, Landroid/view/View;->hasOnClickListeners()Z

    .line 463
    .line 464
    .line 465
    move-result p2

    .line 466
    if-nez p2, :cond_17

    .line 467
    .line 468
    goto :goto_8

    .line 469
    :cond_17
    sget-object p2, Lb9;->c:[I

    .line 470
    .line 471
    invoke-virtual {p1, p4, p2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 472
    .line 473
    .line 474
    move-result-object p1

    .line 475
    invoke-virtual {p1, v5}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 476
    .line 477
    .line 478
    move-result-object p2

    .line 479
    if-eqz p2, :cond_18

    .line 480
    .line 481
    new-instance p3, La9;

    .line 482
    .line 483
    invoke-direct {p3, v0, p2}, La9;-><init>(Landroid/view/View;Ljava/lang/String;)V

    .line 484
    .line 485
    .line 486
    invoke-virtual {v0, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 487
    .line 488
    .line 489
    :cond_18
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 490
    .line 491
    .line 492
    :cond_19
    :goto_8
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 493
    .line 494
    const/16 v6, 0x1c

    .line 495
    .line 496
    if-le p1, v6, :cond_1a

    .line 497
    .line 498
    goto :goto_9

    .line 499
    :cond_1a
    sget-object p1, Lb9;->d:[I

    .line 500
    .line 501
    invoke-virtual {p0, p4, p1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 502
    .line 503
    .line 504
    move-result-object p1

    .line 505
    invoke-virtual {p1, v5}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 506
    .line 507
    .line 508
    move-result p2

    .line 509
    const-class v4, Ljava/lang/Boolean;

    .line 510
    .line 511
    if-eqz p2, :cond_1b

    .line 512
    .line 513
    invoke-virtual {p1, v5, v5}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 514
    .line 515
    .line 516
    move-result p2

    .line 517
    sget-object p3, Lzh1;->a:Ljava/util/WeakHashMap;

    .line 518
    .line 519
    new-instance v2, Lkh1;

    .line 520
    .line 521
    const v3, 0x7f0901e2

    .line 522
    .line 523
    .line 524
    const/4 v7, 0x3

    .line 525
    invoke-direct/range {v2 .. v7}, Lkh1;-><init>(ILjava/lang/Class;III)V

    .line 526
    .line 527
    .line 528
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 529
    .line 530
    .line 531
    move-result-object p2

    .line 532
    invoke-virtual {v2, v0, p2}, Lib1;->d(Landroid/view/View;Ljava/lang/Object;)V

    .line 533
    .line 534
    .line 535
    :cond_1b
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 536
    .line 537
    .line 538
    sget-object p1, Lb9;->e:[I

    .line 539
    .line 540
    invoke-virtual {p0, p4, p1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 541
    .line 542
    .line 543
    move-result-object p1

    .line 544
    invoke-virtual {p1, v5}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 545
    .line 546
    .line 547
    move-result p2

    .line 548
    if-eqz p2, :cond_1c

    .line 549
    .line 550
    invoke-virtual {p1, v5}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 551
    .line 552
    .line 553
    move-result-object p2

    .line 554
    invoke-static {v0, p2}, Lzh1;->j(Landroid/view/View;Ljava/lang/CharSequence;)V

    .line 555
    .line 556
    .line 557
    :cond_1c
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 558
    .line 559
    .line 560
    sget-object p1, Lb9;->f:[I

    .line 561
    .line 562
    invoke-virtual {p0, p4, p1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 563
    .line 564
    .line 565
    move-result-object p0

    .line 566
    invoke-virtual {p0, v5}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 567
    .line 568
    .line 569
    move-result p1

    .line 570
    if-eqz p1, :cond_1d

    .line 571
    .line 572
    invoke-virtual {p0, v5, v5}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 573
    .line 574
    .line 575
    move-result p1

    .line 576
    sget-object p2, Lzh1;->a:Ljava/util/WeakHashMap;

    .line 577
    .line 578
    new-instance v2, Lkh1;

    .line 579
    .line 580
    const v3, 0x7f0901e7

    .line 581
    .line 582
    .line 583
    const/4 v7, 0x0

    .line 584
    invoke-direct/range {v2 .. v7}, Lkh1;-><init>(ILjava/lang/Class;III)V

    .line 585
    .line 586
    .line 587
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 588
    .line 589
    .line 590
    move-result-object p1

    .line 591
    invoke-virtual {v2, v0, p1}, Lib1;->d(Landroid/view/View;Ljava/lang/Object;)V

    .line 592
    .line 593
    .line 594
    :cond_1d
    invoke-virtual {p0}, Landroid/content/res/TypedArray;->recycle()V

    .line 595
    .line 596
    .line 597
    :cond_1e
    :goto_9
    return-object v0

    .line 598
    nop

    .line 599
    :sswitch_data_0
    .sparse-switch
        -0x7404ceea -> :sswitch_d
        -0x56c015e7 -> :sswitch_c
        -0x503aa7ad -> :sswitch_b
        -0x37f7066e -> :sswitch_a
        -0x37e04bb3 -> :sswitch_9
        -0x274065a5 -> :sswitch_8
        -0x1440b607 -> :sswitch_7
        0x2e46a6ed -> :sswitch_6
        0x2fa453c6 -> :sswitch_5
        0x431b5280 -> :sswitch_4
        0x5445f9ba -> :sswitch_3
        0x5f7507c3 -> :sswitch_2
        0x63577677 -> :sswitch_1
        0x77471352 -> :sswitch_0
    .end sparse-switch

    .line 600
    .line 601
    .line 602
    .line 603
    .line 604
    .line 605
    .line 606
    .line 607
    .line 608
    .line 609
    .line 610
    .line 611
    .line 612
    .line 613
    .line 614
    .line 615
    .line 616
    .line 617
    .line 618
    .line 619
    .line 620
    .line 621
    .line 622
    .line 623
    .line 624
    .line 625
    .line 626
    .line 627
    .line 628
    .line 629
    .line 630
    .line 631
    .line 632
    .line 633
    .line 634
    .line 635
    .line 636
    .line 637
    .line 638
    .line 639
    .line 640
    .line 641
    .line 642
    .line 643
    .line 644
    .line 645
    .line 646
    .line 647
    .line 648
    .line 649
    .line 650
    .line 651
    .line 652
    .line 653
    .line 654
    .line 655
    .line 656
    .line 657
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final onCreateView(Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;
    .locals 1

    const/4 v0, 0x0

    .line 599
    invoke-virtual {p0, v0, p1, p2, p3}, Lg7;->onCreateView(Landroid/view/View;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method public final p(Lrm0;)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lg7;->T:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Lg7;->T:Z

    .line 8
    .line 9
    iget-object v0, p0, Lg7;->z:Landroidx/appcompat/widget/ActionBarOverlayLayout;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->k()V

    .line 12
    .line 13
    .line 14
    iget-object v0, v0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->n:Lcv;

    .line 15
    .line 16
    check-cast v0, Lcd1;

    .line 17
    .line 18
    iget-object v0, v0, Lcd1;->a:Landroidx/appcompat/widget/Toolbar;

    .line 19
    .line 20
    iget-object v0, v0, Landroidx/appcompat/widget/Toolbar;->j:Landroidx/appcompat/widget/ActionMenuView;

    .line 21
    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    iget-object v0, v0, Landroidx/appcompat/widget/ActionMenuView;->C:Lu2;

    .line 25
    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    invoke-virtual {v0}, Lu2;->c()Z

    .line 29
    .line 30
    .line 31
    iget-object v0, v0, Lu2;->C:Lq2;

    .line 32
    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    invoke-virtual {v0}, Lcn0;->b()Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-eqz v1, :cond_1

    .line 40
    .line 41
    iget-object v0, v0, Lcn0;->i:Lan0;

    .line 42
    .line 43
    invoke-interface {v0}, Lr71;->dismiss()V

    .line 44
    .line 45
    .line 46
    :cond_1
    iget-object v0, p0, Lg7;->u:Landroid/view/Window;

    .line 47
    .line 48
    invoke-virtual {v0}, Landroid/view/Window;->getCallback()Landroid/view/Window$Callback;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    if-eqz v0, :cond_2

    .line 53
    .line 54
    iget-boolean v1, p0, Lg7;->Z:Z

    .line 55
    .line 56
    if-nez v1, :cond_2

    .line 57
    .line 58
    const/16 v1, 0x6c

    .line 59
    .line 60
    invoke-interface {v0, v1, p1}, Landroid/view/Window$Callback;->onPanelClosed(ILandroid/view/Menu;)V

    .line 61
    .line 62
    .line 63
    :cond_2
    const/4 p1, 0x0

    .line 64
    iput-boolean p1, p0, Lg7;->T:Z

    .line 65
    .line 66
    return-void
.end method

.method public final q(Lf7;Z)V
    .locals 3

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    iget v0, p1, Lf7;->a:I

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lg7;->z:Landroidx/appcompat/widget/ActionBarOverlayLayout;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->k()V

    .line 12
    .line 13
    .line 14
    iget-object v0, v0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->n:Lcv;

    .line 15
    .line 16
    check-cast v0, Lcd1;

    .line 17
    .line 18
    iget-object v0, v0, Lcd1;->a:Landroidx/appcompat/widget/Toolbar;

    .line 19
    .line 20
    iget-object v0, v0, Landroidx/appcompat/widget/Toolbar;->j:Landroidx/appcompat/widget/ActionMenuView;

    .line 21
    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    iget-object v0, v0, Landroidx/appcompat/widget/ActionMenuView;->C:Lu2;

    .line 25
    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    invoke-virtual {v0}, Lu2;->h()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_0

    .line 33
    .line 34
    iget-object p1, p1, Lf7;->h:Lrm0;

    .line 35
    .line 36
    invoke-virtual {p0, p1}, Lg7;->p(Lrm0;)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_0
    iget-object v0, p0, Lg7;->t:Landroid/content/Context;

    .line 41
    .line 42
    const-string v1, "window"

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    check-cast v0, Landroid/view/WindowManager;

    .line 49
    .line 50
    const/4 v1, 0x0

    .line 51
    if-eqz v0, :cond_1

    .line 52
    .line 53
    iget-boolean v2, p1, Lf7;->m:Z

    .line 54
    .line 55
    if-eqz v2, :cond_1

    .line 56
    .line 57
    iget-object v2, p1, Lf7;->e:Le7;

    .line 58
    .line 59
    if-eqz v2, :cond_1

    .line 60
    .line 61
    invoke-interface {v0, v2}, Landroid/view/ViewManager;->removeView(Landroid/view/View;)V

    .line 62
    .line 63
    .line 64
    if-eqz p2, :cond_1

    .line 65
    .line 66
    iget p2, p1, Lf7;->a:I

    .line 67
    .line 68
    invoke-virtual {p0, p2, p1, v1}, Lg7;->o(ILf7;Lrm0;)V

    .line 69
    .line 70
    .line 71
    :cond_1
    const/4 p2, 0x0

    .line 72
    iput-boolean p2, p1, Lf7;->k:Z

    .line 73
    .line 74
    iput-boolean p2, p1, Lf7;->l:Z

    .line 75
    .line 76
    iput-boolean p2, p1, Lf7;->m:Z

    .line 77
    .line 78
    iput-object v1, p1, Lf7;->f:Landroid/view/View;

    .line 79
    .line 80
    const/4 p2, 0x1

    .line 81
    iput-boolean p2, p1, Lf7;->n:Z

    .line 82
    .line 83
    iget-object p2, p0, Lg7;->V:Lf7;

    .line 84
    .line 85
    if-ne p2, p1, :cond_2

    .line 86
    .line 87
    iput-object v1, p0, Lg7;->V:Lf7;

    .line 88
    .line 89
    :cond_2
    iget p1, p1, Lf7;->a:I

    .line 90
    .line 91
    if-nez p1, :cond_3

    .line 92
    .line 93
    invoke-virtual {p0}, Lg7;->G()V

    .line 94
    .line 95
    .line 96
    :cond_3
    return-void
.end method

.method public final s(Landroid/view/KeyEvent;)Z
    .locals 6

    .line 1
    iget-object v0, p0, Lg7;->s:Ljava/lang/Object;

    .line 2
    .line 3
    instance-of v1, v0, Leh0;

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    instance-of v0, v0, Lg4;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Lg7;->u:Landroid/view/Window;

    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-static {v0, p1}, Lzh1;->c(Landroid/view/View;Landroid/view/KeyEvent;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    goto/16 :goto_6

    .line 27
    .line 28
    :cond_1
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    const/4 v1, 0x0

    .line 33
    const/16 v3, 0x52

    .line 34
    .line 35
    if-ne v0, v3, :cond_2

    .line 36
    .line 37
    iget-object v0, p0, Lg7;->v:La7;

    .line 38
    .line 39
    iget-object v4, p0, Lg7;->u:Landroid/view/Window;

    .line 40
    .line 41
    invoke-virtual {v4}, Landroid/view/Window;->getCallback()Landroid/view/Window$Callback;

    .line 42
    .line 43
    .line 44
    move-result-object v4

    .line 45
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 46
    .line 47
    .line 48
    :try_start_0
    iput-boolean v2, v0, La7;->l:Z

    .line 49
    .line 50
    invoke-interface {v4, p1}, Landroid/view/Window$Callback;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    .line 51
    .line 52
    .line 53
    move-result v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 54
    iput-boolean v1, v0, La7;->l:Z

    .line 55
    .line 56
    if-eqz v4, :cond_2

    .line 57
    .line 58
    goto/16 :goto_6

    .line 59
    .line 60
    :catchall_0
    move-exception p0

    .line 61
    iput-boolean v1, v0, La7;->l:Z

    .line 62
    .line 63
    throw p0

    .line 64
    :cond_2
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    .line 69
    .line 70
    .line 71
    move-result v4

    .line 72
    const/4 v5, 0x4

    .line 73
    if-nez v4, :cond_6

    .line 74
    .line 75
    if-eq v0, v5, :cond_4

    .line 76
    .line 77
    if-eq v0, v3, :cond_3

    .line 78
    .line 79
    goto/16 :goto_7

    .line 80
    .line 81
    :cond_3
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getRepeatCount()I

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    if-nez v0, :cond_10

    .line 86
    .line 87
    invoke-virtual {p0, v1}, Lg7;->x(I)Lf7;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    iget-boolean v1, v0, Lf7;->m:Z

    .line 92
    .line 93
    if-nez v1, :cond_10

    .line 94
    .line 95
    invoke-virtual {p0, v0, p1}, Lg7;->E(Lf7;Landroid/view/KeyEvent;)Z

    .line 96
    .line 97
    .line 98
    return v2

    .line 99
    :cond_4
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getFlags()I

    .line 100
    .line 101
    .line 102
    move-result p1

    .line 103
    and-int/lit16 p1, p1, 0x80

    .line 104
    .line 105
    if-eqz p1, :cond_5

    .line 106
    .line 107
    goto :goto_0

    .line 108
    :cond_5
    move v2, v1

    .line 109
    :goto_0
    iput-boolean v2, p0, Lg7;->W:Z

    .line 110
    .line 111
    return v1

    .line 112
    :cond_6
    if-eq v0, v5, :cond_f

    .line 113
    .line 114
    if-eq v0, v3, :cond_7

    .line 115
    .line 116
    goto/16 :goto_7

    .line 117
    .line 118
    :cond_7
    iget-object v0, p0, Lg7;->C:Ly2;

    .line 119
    .line 120
    if-eqz v0, :cond_8

    .line 121
    .line 122
    goto/16 :goto_6

    .line 123
    .line 124
    :cond_8
    invoke-virtual {p0, v1}, Lg7;->x(I)Lf7;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    iget-object v3, p0, Lg7;->z:Landroidx/appcompat/widget/ActionBarOverlayLayout;

    .line 129
    .line 130
    iget-object v4, p0, Lg7;->t:Landroid/content/Context;

    .line 131
    .line 132
    if-eqz v3, :cond_a

    .line 133
    .line 134
    invoke-virtual {v3}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->k()V

    .line 135
    .line 136
    .line 137
    iget-object v3, v3, Landroidx/appcompat/widget/ActionBarOverlayLayout;->n:Lcv;

    .line 138
    .line 139
    check-cast v3, Lcd1;

    .line 140
    .line 141
    iget-object v3, v3, Lcd1;->a:Landroidx/appcompat/widget/Toolbar;

    .line 142
    .line 143
    invoke-virtual {v3}, Landroid/view/View;->getVisibility()I

    .line 144
    .line 145
    .line 146
    move-result v5

    .line 147
    if-nez v5, :cond_a

    .line 148
    .line 149
    iget-object v3, v3, Landroidx/appcompat/widget/Toolbar;->j:Landroidx/appcompat/widget/ActionMenuView;

    .line 150
    .line 151
    if-eqz v3, :cond_a

    .line 152
    .line 153
    iget-boolean v3, v3, Landroidx/appcompat/widget/ActionMenuView;->B:Z

    .line 154
    .line 155
    if-eqz v3, :cond_a

    .line 156
    .line 157
    invoke-static {v4}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 158
    .line 159
    .line 160
    move-result-object v3

    .line 161
    invoke-virtual {v3}, Landroid/view/ViewConfiguration;->hasPermanentMenuKey()Z

    .line 162
    .line 163
    .line 164
    move-result v3

    .line 165
    if-nez v3, :cond_a

    .line 166
    .line 167
    iget-object v3, p0, Lg7;->z:Landroidx/appcompat/widget/ActionBarOverlayLayout;

    .line 168
    .line 169
    invoke-virtual {v3}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->k()V

    .line 170
    .line 171
    .line 172
    iget-object v3, v3, Landroidx/appcompat/widget/ActionBarOverlayLayout;->n:Lcv;

    .line 173
    .line 174
    check-cast v3, Lcd1;

    .line 175
    .line 176
    iget-object v3, v3, Lcd1;->a:Landroidx/appcompat/widget/Toolbar;

    .line 177
    .line 178
    iget-object v3, v3, Landroidx/appcompat/widget/Toolbar;->j:Landroidx/appcompat/widget/ActionMenuView;

    .line 179
    .line 180
    if-eqz v3, :cond_9

    .line 181
    .line 182
    iget-object v3, v3, Landroidx/appcompat/widget/ActionMenuView;->C:Lu2;

    .line 183
    .line 184
    if-eqz v3, :cond_9

    .line 185
    .line 186
    invoke-virtual {v3}, Lu2;->h()Z

    .line 187
    .line 188
    .line 189
    move-result v3

    .line 190
    if-eqz v3, :cond_9

    .line 191
    .line 192
    iget-object p0, p0, Lg7;->z:Landroidx/appcompat/widget/ActionBarOverlayLayout;

    .line 193
    .line 194
    invoke-virtual {p0}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->k()V

    .line 195
    .line 196
    .line 197
    iget-object p0, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->n:Lcv;

    .line 198
    .line 199
    check-cast p0, Lcd1;

    .line 200
    .line 201
    iget-object p0, p0, Lcd1;->a:Landroidx/appcompat/widget/Toolbar;

    .line 202
    .line 203
    iget-object p0, p0, Landroidx/appcompat/widget/Toolbar;->j:Landroidx/appcompat/widget/ActionMenuView;

    .line 204
    .line 205
    if-eqz p0, :cond_d

    .line 206
    .line 207
    iget-object p0, p0, Landroidx/appcompat/widget/ActionMenuView;->C:Lu2;

    .line 208
    .line 209
    if-eqz p0, :cond_d

    .line 210
    .line 211
    invoke-virtual {p0}, Lu2;->c()Z

    .line 212
    .line 213
    .line 214
    move-result p0

    .line 215
    if-eqz p0, :cond_d

    .line 216
    .line 217
    :goto_1
    goto :goto_3

    .line 218
    :cond_9
    iget-boolean v3, p0, Lg7;->Z:Z

    .line 219
    .line 220
    if-nez v3, :cond_d

    .line 221
    .line 222
    invoke-virtual {p0, v0, p1}, Lg7;->E(Lf7;Landroid/view/KeyEvent;)Z

    .line 223
    .line 224
    .line 225
    move-result p1

    .line 226
    if-eqz p1, :cond_d

    .line 227
    .line 228
    iget-object p0, p0, Lg7;->z:Landroidx/appcompat/widget/ActionBarOverlayLayout;

    .line 229
    .line 230
    invoke-virtual {p0}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->k()V

    .line 231
    .line 232
    .line 233
    iget-object p0, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->n:Lcv;

    .line 234
    .line 235
    check-cast p0, Lcd1;

    .line 236
    .line 237
    iget-object p0, p0, Lcd1;->a:Landroidx/appcompat/widget/Toolbar;

    .line 238
    .line 239
    iget-object p0, p0, Landroidx/appcompat/widget/Toolbar;->j:Landroidx/appcompat/widget/ActionMenuView;

    .line 240
    .line 241
    if-eqz p0, :cond_d

    .line 242
    .line 243
    iget-object p0, p0, Landroidx/appcompat/widget/ActionMenuView;->C:Lu2;

    .line 244
    .line 245
    if-eqz p0, :cond_d

    .line 246
    .line 247
    invoke-virtual {p0}, Lu2;->l()Z

    .line 248
    .line 249
    .line 250
    move-result p0

    .line 251
    if-eqz p0, :cond_d

    .line 252
    .line 253
    goto :goto_1

    .line 254
    :cond_a
    iget-boolean v3, v0, Lf7;->m:Z

    .line 255
    .line 256
    if-nez v3, :cond_e

    .line 257
    .line 258
    iget-boolean v5, v0, Lf7;->l:Z

    .line 259
    .line 260
    if-eqz v5, :cond_b

    .line 261
    .line 262
    goto :goto_4

    .line 263
    :cond_b
    iget-boolean v3, v0, Lf7;->k:Z

    .line 264
    .line 265
    if-eqz v3, :cond_d

    .line 266
    .line 267
    iget-boolean v3, v0, Lf7;->o:Z

    .line 268
    .line 269
    if-eqz v3, :cond_c

    .line 270
    .line 271
    iput-boolean v1, v0, Lf7;->k:Z

    .line 272
    .line 273
    invoke-virtual {p0, v0, p1}, Lg7;->E(Lf7;Landroid/view/KeyEvent;)Z

    .line 274
    .line 275
    .line 276
    move-result v3

    .line 277
    goto :goto_2

    .line 278
    :cond_c
    move v3, v2

    .line 279
    :goto_2
    if-eqz v3, :cond_d

    .line 280
    .line 281
    invoke-virtual {p0, v0, p1}, Lg7;->C(Lf7;Landroid/view/KeyEvent;)V

    .line 282
    .line 283
    .line 284
    :goto_3
    move p0, v2

    .line 285
    goto :goto_5

    .line 286
    :cond_d
    move p0, v1

    .line 287
    goto :goto_5

    .line 288
    :cond_e
    :goto_4
    invoke-virtual {p0, v0, v2}, Lg7;->q(Lf7;Z)V

    .line 289
    .line 290
    .line 291
    move p0, v3

    .line 292
    :goto_5
    if-eqz p0, :cond_10

    .line 293
    .line 294
    invoke-virtual {v4}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 295
    .line 296
    .line 297
    move-result-object p0

    .line 298
    const-string p1, "audio"

    .line 299
    .line 300
    invoke-virtual {p0, p1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 301
    .line 302
    .line 303
    move-result-object p0

    .line 304
    check-cast p0, Landroid/media/AudioManager;

    .line 305
    .line 306
    if-eqz p0, :cond_10

    .line 307
    .line 308
    invoke-virtual {p0, v1}, Landroid/media/AudioManager;->playSoundEffect(I)V

    .line 309
    .line 310
    .line 311
    return v2

    .line 312
    :cond_f
    invoke-virtual {p0}, Lg7;->B()Z

    .line 313
    .line 314
    .line 315
    move-result p0

    .line 316
    if-eqz p0, :cond_11

    .line 317
    .line 318
    :cond_10
    :goto_6
    return v2

    .line 319
    :cond_11
    :goto_7
    return v1
.end method

.method public final t(I)V
    .locals 3

    .line 1
    invoke-virtual {p0, p1}, Lg7;->x(I)Lf7;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, v0, Lf7;->h:Lrm0;

    .line 6
    .line 7
    if-eqz v1, :cond_1

    .line 8
    .line 9
    new-instance v1, Landroid/os/Bundle;

    .line 10
    .line 11
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 12
    .line 13
    .line 14
    iget-object v2, v0, Lf7;->h:Lrm0;

    .line 15
    .line 16
    invoke-virtual {v2, v1}, Lrm0;->t(Landroid/os/Bundle;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v1}, Landroid/os/BaseBundle;->size()I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-lez v2, :cond_0

    .line 24
    .line 25
    iput-object v1, v0, Lf7;->p:Landroid/os/Bundle;

    .line 26
    .line 27
    :cond_0
    iget-object v1, v0, Lf7;->h:Lrm0;

    .line 28
    .line 29
    invoke-virtual {v1}, Lrm0;->w()V

    .line 30
    .line 31
    .line 32
    iget-object v1, v0, Lf7;->h:Lrm0;

    .line 33
    .line 34
    invoke-virtual {v1}, Lrm0;->clear()V

    .line 35
    .line 36
    .line 37
    :cond_1
    const/4 v1, 0x1

    .line 38
    iput-boolean v1, v0, Lf7;->o:Z

    .line 39
    .line 40
    iput-boolean v1, v0, Lf7;->n:Z

    .line 41
    .line 42
    const/16 v0, 0x6c

    .line 43
    .line 44
    if-eq p1, v0, :cond_2

    .line 45
    .line 46
    if-nez p1, :cond_3

    .line 47
    .line 48
    :cond_2
    iget-object p1, p0, Lg7;->z:Landroidx/appcompat/widget/ActionBarOverlayLayout;

    .line 49
    .line 50
    if-eqz p1, :cond_3

    .line 51
    .line 52
    const/4 p1, 0x0

    .line 53
    invoke-virtual {p0, p1}, Lg7;->x(I)Lf7;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    iput-boolean p1, v0, Lf7;->k:Z

    .line 58
    .line 59
    const/4 p1, 0x0

    .line 60
    invoke-virtual {p0, v0, p1}, Lg7;->E(Lf7;Landroid/view/KeyEvent;)Z

    .line 61
    .line 62
    .line 63
    :cond_3
    return-void
.end method

.method public final u()V
    .locals 11

    .line 1
    iget-boolean v0, p0, Lg7;->I:Z

    .line 2
    .line 3
    if-nez v0, :cond_1b

    .line 4
    .line 5
    iget-object v0, p0, Lg7;->t:Landroid/content/Context;

    .line 6
    .line 7
    sget-object v1, Lgx0;->j:[I

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/content/Context;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    const/16 v3, 0x75

    .line 14
    .line 15
    invoke-virtual {v2, v3}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 16
    .line 17
    .line 18
    move-result v4

    .line 19
    if-eqz v4, :cond_1a

    .line 20
    .line 21
    const/16 v4, 0x7e

    .line 22
    .line 23
    const/4 v5, 0x0

    .line 24
    invoke-virtual {v2, v4, v5}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 25
    .line 26
    .line 27
    move-result v4

    .line 28
    const/16 v6, 0x6c

    .line 29
    .line 30
    const/4 v7, 0x1

    .line 31
    if-eqz v4, :cond_0

    .line 32
    .line 33
    invoke-virtual {p0, v7}, Lg7;->f(I)Z

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    invoke-virtual {v2, v3, v5}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    if-eqz v3, :cond_1

    .line 42
    .line 43
    invoke-virtual {p0, v6}, Lg7;->f(I)Z

    .line 44
    .line 45
    .line 46
    :cond_1
    :goto_0
    const/16 v3, 0x76

    .line 47
    .line 48
    invoke-virtual {v2, v3, v5}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 49
    .line 50
    .line 51
    move-result v3

    .line 52
    const/16 v4, 0x6d

    .line 53
    .line 54
    if-eqz v3, :cond_2

    .line 55
    .line 56
    invoke-virtual {p0, v4}, Lg7;->f(I)Z

    .line 57
    .line 58
    .line 59
    :cond_2
    const/16 v3, 0x77

    .line 60
    .line 61
    invoke-virtual {v2, v3, v5}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 62
    .line 63
    .line 64
    move-result v3

    .line 65
    if-eqz v3, :cond_3

    .line 66
    .line 67
    const/16 v3, 0xa

    .line 68
    .line 69
    invoke-virtual {p0, v3}, Lg7;->f(I)Z

    .line 70
    .line 71
    .line 72
    :cond_3
    invoke-virtual {v2, v5, v5}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 73
    .line 74
    .line 75
    move-result v3

    .line 76
    iput-boolean v3, p0, Lg7;->R:Z

    .line 77
    .line 78
    invoke-virtual {v2}, Landroid/content/res/TypedArray;->recycle()V

    .line 79
    .line 80
    .line 81
    invoke-virtual {p0}, Lg7;->v()V

    .line 82
    .line 83
    .line 84
    iget-object v2, p0, Lg7;->u:Landroid/view/Window;

    .line 85
    .line 86
    invoke-virtual {v2}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 87
    .line 88
    .line 89
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    iget-boolean v3, p0, Lg7;->S:Z

    .line 94
    .line 95
    const/4 v8, 0x0

    .line 96
    if-nez v3, :cond_9

    .line 97
    .line 98
    iget-boolean v3, p0, Lg7;->R:Z

    .line 99
    .line 100
    if-eqz v3, :cond_4

    .line 101
    .line 102
    const v3, 0x7f0c000c

    .line 103
    .line 104
    .line 105
    invoke-virtual {v2, v3, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 106
    .line 107
    .line 108
    move-result-object v2

    .line 109
    check-cast v2, Landroid/view/ViewGroup;

    .line 110
    .line 111
    iput-boolean v5, p0, Lg7;->P:Z

    .line 112
    .line 113
    iput-boolean v5, p0, Lg7;->O:Z

    .line 114
    .line 115
    goto/16 :goto_2

    .line 116
    .line 117
    :cond_4
    iget-boolean v2, p0, Lg7;->O:Z

    .line 118
    .line 119
    if-eqz v2, :cond_8

    .line 120
    .line 121
    new-instance v2, Landroid/util/TypedValue;

    .line 122
    .line 123
    invoke-direct {v2}, Landroid/util/TypedValue;-><init>()V

    .line 124
    .line 125
    .line 126
    invoke-virtual {v0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    .line 127
    .line 128
    .line 129
    move-result-object v3

    .line 130
    const v9, 0x7f040009

    .line 131
    .line 132
    .line 133
    invoke-virtual {v3, v9, v2, v7}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 134
    .line 135
    .line 136
    iget v3, v2, Landroid/util/TypedValue;->resourceId:I

    .line 137
    .line 138
    if-eqz v3, :cond_5

    .line 139
    .line 140
    new-instance v3, Lhq;

    .line 141
    .line 142
    iget v2, v2, Landroid/util/TypedValue;->resourceId:I

    .line 143
    .line 144
    invoke-direct {v3, v0, v2}, Lhq;-><init>(Landroid/content/Context;I)V

    .line 145
    .line 146
    .line 147
    goto :goto_1

    .line 148
    :cond_5
    move-object v3, v0

    .line 149
    :goto_1
    invoke-static {v3}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 150
    .line 151
    .line 152
    move-result-object v2

    .line 153
    const v3, 0x7f0c0017

    .line 154
    .line 155
    .line 156
    invoke-virtual {v2, v3, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 157
    .line 158
    .line 159
    move-result-object v2

    .line 160
    check-cast v2, Landroid/view/ViewGroup;

    .line 161
    .line 162
    const v3, 0x7f09009d

    .line 163
    .line 164
    .line 165
    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 166
    .line 167
    .line 168
    move-result-object v3

    .line 169
    check-cast v3, Landroidx/appcompat/widget/ActionBarOverlayLayout;

    .line 170
    .line 171
    iput-object v3, p0, Lg7;->z:Landroidx/appcompat/widget/ActionBarOverlayLayout;

    .line 172
    .line 173
    iget-object v9, p0, Lg7;->u:Landroid/view/Window;

    .line 174
    .line 175
    invoke-virtual {v9}, Landroid/view/Window;->getCallback()Landroid/view/Window$Callback;

    .line 176
    .line 177
    .line 178
    move-result-object v9

    .line 179
    invoke-virtual {v3, v9}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->setWindowCallback(Landroid/view/Window$Callback;)V

    .line 180
    .line 181
    .line 182
    iget-boolean v3, p0, Lg7;->P:Z

    .line 183
    .line 184
    if-eqz v3, :cond_6

    .line 185
    .line 186
    iget-object v3, p0, Lg7;->z:Landroidx/appcompat/widget/ActionBarOverlayLayout;

    .line 187
    .line 188
    invoke-virtual {v3, v4}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->j(I)V

    .line 189
    .line 190
    .line 191
    :cond_6
    iget-boolean v3, p0, Lg7;->M:Z

    .line 192
    .line 193
    if-eqz v3, :cond_7

    .line 194
    .line 195
    iget-object v3, p0, Lg7;->z:Landroidx/appcompat/widget/ActionBarOverlayLayout;

    .line 196
    .line 197
    const/4 v4, 0x2

    .line 198
    invoke-virtual {v3, v4}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->j(I)V

    .line 199
    .line 200
    .line 201
    :cond_7
    iget-boolean v3, p0, Lg7;->N:Z

    .line 202
    .line 203
    if-eqz v3, :cond_b

    .line 204
    .line 205
    iget-object v3, p0, Lg7;->z:Landroidx/appcompat/widget/ActionBarOverlayLayout;

    .line 206
    .line 207
    const/4 v4, 0x5

    .line 208
    invoke-virtual {v3, v4}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->j(I)V

    .line 209
    .line 210
    .line 211
    goto :goto_2

    .line 212
    :cond_8
    move-object v2, v8

    .line 213
    goto :goto_2

    .line 214
    :cond_9
    iget-boolean v3, p0, Lg7;->Q:Z

    .line 215
    .line 216
    if-eqz v3, :cond_a

    .line 217
    .line 218
    const v3, 0x7f0c0016

    .line 219
    .line 220
    .line 221
    invoke-virtual {v2, v3, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 222
    .line 223
    .line 224
    move-result-object v2

    .line 225
    check-cast v2, Landroid/view/ViewGroup;

    .line 226
    .line 227
    goto :goto_2

    .line 228
    :cond_a
    const v3, 0x7f0c0015

    .line 229
    .line 230
    .line 231
    invoke-virtual {v2, v3, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 232
    .line 233
    .line 234
    move-result-object v2

    .line 235
    check-cast v2, Landroid/view/ViewGroup;

    .line 236
    .line 237
    :cond_b
    :goto_2
    if-eqz v2, :cond_19

    .line 238
    .line 239
    new-instance v3, Ls6;

    .line 240
    .line 241
    invoke-direct {v3, p0}, Ls6;-><init>(Lg7;)V

    .line 242
    .line 243
    .line 244
    sget-object v4, Lzh1;->a:Ljava/util/WeakHashMap;

    .line 245
    .line 246
    invoke-static {v2, v3}, Loh1;->u(Landroid/view/View;Lor0;)V

    .line 247
    .line 248
    .line 249
    iget-object v3, p0, Lg7;->z:Landroidx/appcompat/widget/ActionBarOverlayLayout;

    .line 250
    .line 251
    if-nez v3, :cond_c

    .line 252
    .line 253
    const v3, 0x7f0901fe

    .line 254
    .line 255
    .line 256
    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 257
    .line 258
    .line 259
    move-result-object v3

    .line 260
    check-cast v3, Landroid/widget/TextView;

    .line 261
    .line 262
    iput-object v3, p0, Lg7;->K:Landroid/widget/TextView;

    .line 263
    .line 264
    :cond_c
    sget-boolean v3, Lri1;->a:Z

    .line 265
    .line 266
    :try_start_0
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 267
    .line 268
    .line 269
    move-result-object v3

    .line 270
    const-string v4, "makeOptionalFitsSystemWindows"

    .line 271
    .line 272
    invoke-virtual {v3, v4, v8}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 273
    .line 274
    .line 275
    move-result-object v3

    .line 276
    invoke-virtual {v3}, Ljava/lang/reflect/AccessibleObject;->isAccessible()Z

    .line 277
    .line 278
    .line 279
    move-result v4

    .line 280
    if-nez v4, :cond_d

    .line 281
    .line 282
    invoke-virtual {v3, v7}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    .line 283
    .line 284
    .line 285
    :cond_d
    invoke-virtual {v3, v2, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 286
    .line 287
    .line 288
    :catch_0
    const v3, 0x7f090032

    .line 289
    .line 290
    .line 291
    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 292
    .line 293
    .line 294
    move-result-object v3

    .line 295
    check-cast v3, Landroidx/appcompat/widget/ContentFrameLayout;

    .line 296
    .line 297
    iget-object v4, p0, Lg7;->u:Landroid/view/Window;

    .line 298
    .line 299
    const v9, 0x1020002

    .line 300
    .line 301
    .line 302
    invoke-virtual {v4, v9}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 303
    .line 304
    .line 305
    move-result-object v4

    .line 306
    check-cast v4, Landroid/view/ViewGroup;

    .line 307
    .line 308
    if-eqz v4, :cond_f

    .line 309
    .line 310
    :goto_3
    invoke-virtual {v4}, Landroid/view/ViewGroup;->getChildCount()I

    .line 311
    .line 312
    .line 313
    move-result v10

    .line 314
    if-lez v10, :cond_e

    .line 315
    .line 316
    invoke-virtual {v4, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 317
    .line 318
    .line 319
    move-result-object v10

    .line 320
    invoke-virtual {v4, v5}, Landroid/view/ViewGroup;->removeViewAt(I)V

    .line 321
    .line 322
    .line 323
    invoke-virtual {v3, v10}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 324
    .line 325
    .line 326
    goto :goto_3

    .line 327
    :cond_e
    const/4 v10, -0x1

    .line 328
    invoke-virtual {v4, v10}, Landroid/view/View;->setId(I)V

    .line 329
    .line 330
    .line 331
    invoke-virtual {v3, v9}, Landroid/view/View;->setId(I)V

    .line 332
    .line 333
    .line 334
    instance-of v10, v4, Landroid/widget/FrameLayout;

    .line 335
    .line 336
    if-eqz v10, :cond_f

    .line 337
    .line 338
    check-cast v4, Landroid/widget/FrameLayout;

    .line 339
    .line 340
    invoke-virtual {v4, v8}, Landroid/view/View;->setForeground(Landroid/graphics/drawable/Drawable;)V

    .line 341
    .line 342
    .line 343
    :cond_f
    iget-object v4, p0, Lg7;->u:Landroid/view/Window;

    .line 344
    .line 345
    invoke-virtual {v4, v2}, Landroid/view/Window;->setContentView(Landroid/view/View;)V

    .line 346
    .line 347
    .line 348
    new-instance v4, Lt6;

    .line 349
    .line 350
    invoke-direct {v4, p0}, Lt6;-><init>(Lg7;)V

    .line 351
    .line 352
    .line 353
    invoke-virtual {v3, v4}, Landroidx/appcompat/widget/ContentFrameLayout;->setAttachListener(Lup;)V

    .line 354
    .line 355
    .line 356
    iput-object v2, p0, Lg7;->J:Landroid/view/ViewGroup;

    .line 357
    .line 358
    iget-object v2, p0, Lg7;->s:Ljava/lang/Object;

    .line 359
    .line 360
    instance-of v3, v2, Landroid/app/Activity;

    .line 361
    .line 362
    if-eqz v3, :cond_10

    .line 363
    .line 364
    check-cast v2, Landroid/app/Activity;

    .line 365
    .line 366
    invoke-virtual {v2}, Landroid/app/Activity;->getTitle()Ljava/lang/CharSequence;

    .line 367
    .line 368
    .line 369
    move-result-object v2

    .line 370
    goto :goto_4

    .line 371
    :cond_10
    iget-object v2, p0, Lg7;->y:Ljava/lang/CharSequence;

    .line 372
    .line 373
    :goto_4
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 374
    .line 375
    .line 376
    move-result v3

    .line 377
    if-nez v3, :cond_13

    .line 378
    .line 379
    iget-object v3, p0, Lg7;->z:Landroidx/appcompat/widget/ActionBarOverlayLayout;

    .line 380
    .line 381
    if-eqz v3, :cond_11

    .line 382
    .line 383
    invoke-virtual {v3, v2}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->setWindowTitle(Ljava/lang/CharSequence;)V

    .line 384
    .line 385
    .line 386
    goto :goto_5

    .line 387
    :cond_11
    iget-object v3, p0, Lg7;->w:Lvj1;

    .line 388
    .line 389
    if-eqz v3, :cond_12

    .line 390
    .line 391
    iget-object v3, v3, Lvj1;->e:Lcv;

    .line 392
    .line 393
    check-cast v3, Lcd1;

    .line 394
    .line 395
    iget-boolean v4, v3, Lcd1;->g:Z

    .line 396
    .line 397
    if-nez v4, :cond_13

    .line 398
    .line 399
    iget-object v4, v3, Lcd1;->a:Landroidx/appcompat/widget/Toolbar;

    .line 400
    .line 401
    iput-object v2, v3, Lcd1;->h:Ljava/lang/CharSequence;

    .line 402
    .line 403
    iget v8, v3, Lcd1;->b:I

    .line 404
    .line 405
    and-int/lit8 v8, v8, 0x8

    .line 406
    .line 407
    if-eqz v8, :cond_13

    .line 408
    .line 409
    invoke-virtual {v4, v2}, Landroidx/appcompat/widget/Toolbar;->setTitle(Ljava/lang/CharSequence;)V

    .line 410
    .line 411
    .line 412
    iget-boolean v3, v3, Lcd1;->g:Z

    .line 413
    .line 414
    if-eqz v3, :cond_13

    .line 415
    .line 416
    invoke-virtual {v4}, Landroid/view/View;->getRootView()Landroid/view/View;

    .line 417
    .line 418
    .line 419
    move-result-object v3

    .line 420
    invoke-static {v3, v2}, Lzh1;->j(Landroid/view/View;Ljava/lang/CharSequence;)V

    .line 421
    .line 422
    .line 423
    goto :goto_5

    .line 424
    :cond_12
    iget-object v3, p0, Lg7;->K:Landroid/widget/TextView;

    .line 425
    .line 426
    if-eqz v3, :cond_13

    .line 427
    .line 428
    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 429
    .line 430
    .line 431
    :cond_13
    :goto_5
    iget-object v2, p0, Lg7;->J:Landroid/view/ViewGroup;

    .line 432
    .line 433
    invoke-virtual {v2, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 434
    .line 435
    .line 436
    move-result-object v2

    .line 437
    check-cast v2, Landroidx/appcompat/widget/ContentFrameLayout;

    .line 438
    .line 439
    iget-object v3, p0, Lg7;->u:Landroid/view/Window;

    .line 440
    .line 441
    invoke-virtual {v3}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 442
    .line 443
    .line 444
    move-result-object v3

    .line 445
    invoke-virtual {v3}, Landroid/view/View;->getPaddingLeft()I

    .line 446
    .line 447
    .line 448
    move-result v4

    .line 449
    invoke-virtual {v3}, Landroid/view/View;->getPaddingTop()I

    .line 450
    .line 451
    .line 452
    move-result v8

    .line 453
    invoke-virtual {v3}, Landroid/view/View;->getPaddingRight()I

    .line 454
    .line 455
    .line 456
    move-result v9

    .line 457
    invoke-virtual {v3}, Landroid/view/View;->getPaddingBottom()I

    .line 458
    .line 459
    .line 460
    move-result v3

    .line 461
    iget-object v10, v2, Landroidx/appcompat/widget/ContentFrameLayout;->p:Landroid/graphics/Rect;

    .line 462
    .line 463
    invoke-virtual {v10, v4, v8, v9, v3}, Landroid/graphics/Rect;->set(IIII)V

    .line 464
    .line 465
    .line 466
    invoke-virtual {v2}, Landroid/view/View;->isLaidOut()Z

    .line 467
    .line 468
    .line 469
    move-result v3

    .line 470
    if-eqz v3, :cond_14

    .line 471
    .line 472
    invoke-virtual {v2}, Landroid/view/View;->requestLayout()V

    .line 473
    .line 474
    .line 475
    :cond_14
    invoke-virtual {v0, v1}, Landroid/content/Context;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    .line 476
    .line 477
    .line 478
    move-result-object v0

    .line 479
    const/16 v1, 0x7c

    .line 480
    .line 481
    invoke-virtual {v2}, Landroidx/appcompat/widget/ContentFrameLayout;->getMinWidthMajor()Landroid/util/TypedValue;

    .line 482
    .line 483
    .line 484
    move-result-object v3

    .line 485
    invoke-virtual {v0, v1, v3}, Landroid/content/res/TypedArray;->getValue(ILandroid/util/TypedValue;)Z

    .line 486
    .line 487
    .line 488
    const/16 v1, 0x7d

    .line 489
    .line 490
    invoke-virtual {v2}, Landroidx/appcompat/widget/ContentFrameLayout;->getMinWidthMinor()Landroid/util/TypedValue;

    .line 491
    .line 492
    .line 493
    move-result-object v3

    .line 494
    invoke-virtual {v0, v1, v3}, Landroid/content/res/TypedArray;->getValue(ILandroid/util/TypedValue;)Z

    .line 495
    .line 496
    .line 497
    const/16 v1, 0x7a

    .line 498
    .line 499
    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 500
    .line 501
    .line 502
    move-result v3

    .line 503
    if-eqz v3, :cond_15

    .line 504
    .line 505
    invoke-virtual {v2}, Landroidx/appcompat/widget/ContentFrameLayout;->getFixedWidthMajor()Landroid/util/TypedValue;

    .line 506
    .line 507
    .line 508
    move-result-object v3

    .line 509
    invoke-virtual {v0, v1, v3}, Landroid/content/res/TypedArray;->getValue(ILandroid/util/TypedValue;)Z

    .line 510
    .line 511
    .line 512
    :cond_15
    const/16 v1, 0x7b

    .line 513
    .line 514
    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 515
    .line 516
    .line 517
    move-result v3

    .line 518
    if-eqz v3, :cond_16

    .line 519
    .line 520
    invoke-virtual {v2}, Landroidx/appcompat/widget/ContentFrameLayout;->getFixedWidthMinor()Landroid/util/TypedValue;

    .line 521
    .line 522
    .line 523
    move-result-object v3

    .line 524
    invoke-virtual {v0, v1, v3}, Landroid/content/res/TypedArray;->getValue(ILandroid/util/TypedValue;)Z

    .line 525
    .line 526
    .line 527
    :cond_16
    const/16 v1, 0x78

    .line 528
    .line 529
    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 530
    .line 531
    .line 532
    move-result v3

    .line 533
    if-eqz v3, :cond_17

    .line 534
    .line 535
    invoke-virtual {v2}, Landroidx/appcompat/widget/ContentFrameLayout;->getFixedHeightMajor()Landroid/util/TypedValue;

    .line 536
    .line 537
    .line 538
    move-result-object v3

    .line 539
    invoke-virtual {v0, v1, v3}, Landroid/content/res/TypedArray;->getValue(ILandroid/util/TypedValue;)Z

    .line 540
    .line 541
    .line 542
    :cond_17
    const/16 v1, 0x79

    .line 543
    .line 544
    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 545
    .line 546
    .line 547
    move-result v3

    .line 548
    if-eqz v3, :cond_18

    .line 549
    .line 550
    invoke-virtual {v2}, Landroidx/appcompat/widget/ContentFrameLayout;->getFixedHeightMinor()Landroid/util/TypedValue;

    .line 551
    .line 552
    .line 553
    move-result-object v3

    .line 554
    invoke-virtual {v0, v1, v3}, Landroid/content/res/TypedArray;->getValue(ILandroid/util/TypedValue;)Z

    .line 555
    .line 556
    .line 557
    :cond_18
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 558
    .line 559
    .line 560
    invoke-virtual {v2}, Landroid/view/View;->requestLayout()V

    .line 561
    .line 562
    .line 563
    iput-boolean v7, p0, Lg7;->I:Z

    .line 564
    .line 565
    invoke-virtual {p0, v5}, Lg7;->x(I)Lf7;

    .line 566
    .line 567
    .line 568
    move-result-object v0

    .line 569
    iget-boolean v1, p0, Lg7;->Z:Z

    .line 570
    .line 571
    if-nez v1, :cond_1b

    .line 572
    .line 573
    iget-object v0, v0, Lf7;->h:Lrm0;

    .line 574
    .line 575
    if-nez v0, :cond_1b

    .line 576
    .line 577
    invoke-virtual {p0, v6}, Lg7;->z(I)V

    .line 578
    .line 579
    .line 580
    goto :goto_6

    .line 581
    :cond_19
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 582
    .line 583
    iget-boolean v1, p0, Lg7;->O:Z

    .line 584
    .line 585
    iget-boolean v2, p0, Lg7;->P:Z

    .line 586
    .line 587
    iget-boolean v3, p0, Lg7;->R:Z

    .line 588
    .line 589
    iget-boolean v4, p0, Lg7;->Q:Z

    .line 590
    .line 591
    iget-boolean p0, p0, Lg7;->S:Z

    .line 592
    .line 593
    new-instance v5, Ljava/lang/StringBuilder;

    .line 594
    .line 595
    const-string v6, "AppCompat does not support the current theme features: { windowActionBar: "

    .line 596
    .line 597
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 598
    .line 599
    .line 600
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 601
    .line 602
    .line 603
    const-string v1, ", windowActionBarOverlay: "

    .line 604
    .line 605
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 606
    .line 607
    .line 608
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 609
    .line 610
    .line 611
    const-string v1, ", android:windowIsFloating: "

    .line 612
    .line 613
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 614
    .line 615
    .line 616
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 617
    .line 618
    .line 619
    const-string v1, ", windowActionModeOverlay: "

    .line 620
    .line 621
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 622
    .line 623
    .line 624
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 625
    .line 626
    .line 627
    const-string v1, ", windowNoTitle: "

    .line 628
    .line 629
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 630
    .line 631
    .line 632
    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 633
    .line 634
    .line 635
    const-string p0, " }"

    .line 636
    .line 637
    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 638
    .line 639
    .line 640
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 641
    .line 642
    .line 643
    move-result-object p0

    .line 644
    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 645
    .line 646
    .line 647
    throw v0

    .line 648
    :cond_1a
    invoke-virtual {v2}, Landroid/content/res/TypedArray;->recycle()V

    .line 649
    .line 650
    .line 651
    const-string p0, "You need to use a Theme.AppCompat theme (or descendant) with this activity."

    .line 652
    .line 653
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 654
    .line 655
    .line 656
    :cond_1b
    :goto_6
    return-void
.end method

.method public final v()V
    .locals 2

    .line 1
    iget-object v0, p0, Lg7;->u:Landroid/view/Window;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lg7;->s:Ljava/lang/Object;

    .line 6
    .line 7
    instance-of v1, v0, Landroid/app/Activity;

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    check-cast v0, Landroid/app/Activity;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p0, v0}, Lg7;->m(Landroid/view/Window;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object p0, p0, Lg7;->u:Landroid/view/Window;

    .line 21
    .line 22
    if-eqz p0, :cond_1

    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    const-string p0, "We have not been given a Window"

    .line 26
    .line 27
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final w(Landroid/content/Context;)Ld7;
    .locals 3

    .line 1
    iget-object v0, p0, Lg7;->f0:Lb7;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    new-instance v0, Lb7;

    .line 6
    .line 7
    sget-object v1, Lc9;->s:Lc9;

    .line 8
    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    new-instance v1, Lc9;

    .line 16
    .line 17
    const-string v2, "location"

    .line 18
    .line 19
    invoke-virtual {p1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    check-cast v2, Landroid/location/LocationManager;

    .line 24
    .line 25
    invoke-direct {v1, p1, v2}, Lc9;-><init>(Landroid/content/Context;Landroid/location/LocationManager;)V

    .line 26
    .line 27
    .line 28
    sput-object v1, Lc9;->s:Lc9;

    .line 29
    .line 30
    :cond_0
    invoke-direct {v0, p0, v1}, Lb7;-><init>(Lg7;Lc9;)V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, Lg7;->f0:Lb7;

    .line 34
    .line 35
    :cond_1
    return-object v0
.end method

.method public final x(I)Lf7;
    .locals 4

    .line 1
    iget-object v0, p0, Lg7;->U:[Lf7;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    array-length v2, v0

    .line 7
    if-gt v2, p1, :cond_2

    .line 8
    .line 9
    :cond_0
    add-int/lit8 v2, p1, 0x1

    .line 10
    .line 11
    new-array v2, v2, [Lf7;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    array-length v3, v0

    .line 16
    invoke-static {v0, v1, v2, v1, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 17
    .line 18
    .line 19
    :cond_1
    iput-object v2, p0, Lg7;->U:[Lf7;

    .line 20
    .line 21
    move-object v0, v2

    .line 22
    :cond_2
    aget-object p0, v0, p1

    .line 23
    .line 24
    if-nez p0, :cond_3

    .line 25
    .line 26
    new-instance p0, Lf7;

    .line 27
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    .line 30
    .line 31
    iput p1, p0, Lf7;->a:I

    .line 32
    .line 33
    iput-boolean v1, p0, Lf7;->n:Z

    .line 34
    .line 35
    aput-object p0, v0, p1

    .line 36
    .line 37
    :cond_3
    return-object p0
.end method

.method public final y()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lg7;->u()V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lg7;->O:Z

    .line 5
    .line 6
    if-eqz v0, :cond_3

    .line 7
    .line 8
    iget-object v0, p0, Lg7;->w:Lvj1;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    goto :goto_1

    .line 13
    :cond_0
    iget-object v1, p0, Lg7;->s:Ljava/lang/Object;

    .line 14
    .line 15
    instance-of v2, v1, Landroid/app/Activity;

    .line 16
    .line 17
    if-eqz v2, :cond_1

    .line 18
    .line 19
    new-instance v0, Lvj1;

    .line 20
    .line 21
    check-cast v1, Landroid/app/Activity;

    .line 22
    .line 23
    iget-boolean v2, p0, Lg7;->P:Z

    .line 24
    .line 25
    invoke-direct {v0, v1, v2}, Lvj1;-><init>(Landroid/app/Activity;Z)V

    .line 26
    .line 27
    .line 28
    iput-object v0, p0, Lg7;->w:Lvj1;

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    instance-of v2, v1, Landroid/app/Dialog;

    .line 32
    .line 33
    if-eqz v2, :cond_2

    .line 34
    .line 35
    new-instance v0, Lvj1;

    .line 36
    .line 37
    check-cast v1, Landroid/app/Dialog;

    .line 38
    .line 39
    invoke-direct {v0, v1}, Lvj1;-><init>(Landroid/app/Dialog;)V

    .line 40
    .line 41
    .line 42
    iput-object v0, p0, Lg7;->w:Lvj1;

    .line 43
    .line 44
    :cond_2
    :goto_0
    if-eqz v0, :cond_3

    .line 45
    .line 46
    iget-boolean p0, p0, Lg7;->k0:Z

    .line 47
    .line 48
    invoke-virtual {v0, p0}, Lvj1;->d(Z)V

    .line 49
    .line 50
    .line 51
    :cond_3
    :goto_1
    return-void
.end method

.method public final z(I)V
    .locals 2

    .line 1
    iget v0, p0, Lg7;->i0:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    shl-int p1, v1, p1

    .line 5
    .line 6
    or-int/2addr p1, v0

    .line 7
    iput p1, p0, Lg7;->i0:I

    .line 8
    .line 9
    iget-boolean p1, p0, Lg7;->h0:Z

    .line 10
    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    iget-object p1, p0, Lg7;->u:Landroid/view/Window;

    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    sget-object v0, Lzh1;->a:Ljava/util/WeakHashMap;

    .line 20
    .line 21
    iget-object v0, p0, Lg7;->j0:Lr6;

    .line 22
    .line 23
    invoke-virtual {p1, v0}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    .line 24
    .line 25
    .line 26
    iput-boolean v1, p0, Lg7;->h0:Z

    .line 27
    .line 28
    :cond_0
    return-void
.end method
