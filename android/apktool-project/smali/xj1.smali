.class public final Lxj1;
.super Lbk1;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static c:Ljava/lang/reflect/Field;

.field public static d:Z

.field public static e:Ljava/lang/reflect/Constructor;

.field public static f:Z


# instance fields
.field public a:Landroid/view/WindowInsets;

.field public b:Lne0;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lbk1;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lxj1;->e()Landroid/view/WindowInsets;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lxj1;->a:Landroid/view/WindowInsets;

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(Lkk1;)V
    .locals 0

    .line 11
    invoke-direct {p0, p1}, Lbk1;-><init>(Lkk1;)V

    .line 12
    invoke-virtual {p1}, Lkk1;->b()Landroid/view/WindowInsets;

    move-result-object p1

    iput-object p1, p0, Lxj1;->a:Landroid/view/WindowInsets;

    return-void
.end method

.method private static e()Landroid/view/WindowInsets;
    .locals 5

    .line 1
    sget-boolean v0, Lxj1;->d:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const-class v2, Landroid/view/WindowInsets;

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    :try_start_0
    const-string v0, "CONSUMED"

    .line 9
    .line 10
    invoke-virtual {v2, v0}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    sput-object v0, Lxj1;->c:Ljava/lang/reflect/Field;
    :try_end_0
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_0 .. :try_end_0} :catch_0

    .line 15
    .line 16
    :catch_0
    sput-boolean v1, Lxj1;->d:Z

    .line 17
    .line 18
    :cond_0
    sget-object v0, Lxj1;->c:Ljava/lang/reflect/Field;

    .line 19
    .line 20
    const/4 v3, 0x0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    :try_start_1
    invoke-virtual {v0, v3}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Landroid/view/WindowInsets;

    .line 28
    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    new-instance v4, Landroid/view/WindowInsets;

    .line 32
    .line 33
    invoke-direct {v4, v0}, Landroid/view/WindowInsets;-><init>(Landroid/view/WindowInsets;)V
    :try_end_1
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_1 .. :try_end_1} :catch_1

    .line 34
    .line 35
    .line 36
    return-object v4

    .line 37
    :catch_1
    :cond_1
    sget-boolean v0, Lxj1;->f:Z

    .line 38
    .line 39
    if-nez v0, :cond_2

    .line 40
    .line 41
    :try_start_2
    const-class v0, Landroid/graphics/Rect;

    .line 42
    .line 43
    filled-new-array {v0}, [Ljava/lang/Class;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {v2, v0}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    sput-object v0, Lxj1;->e:Ljava/lang/reflect/Constructor;
    :try_end_2
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_2 .. :try_end_2} :catch_2

    .line 52
    .line 53
    :catch_2
    sput-boolean v1, Lxj1;->f:Z

    .line 54
    .line 55
    :cond_2
    sget-object v0, Lxj1;->e:Ljava/lang/reflect/Constructor;

    .line 56
    .line 57
    if-eqz v0, :cond_3

    .line 58
    .line 59
    :try_start_3
    new-instance v1, Landroid/graphics/Rect;

    .line 60
    .line 61
    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    .line 62
    .line 63
    .line 64
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    invoke-virtual {v0, v1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    check-cast v0, Landroid/view/WindowInsets;
    :try_end_3
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_3 .. :try_end_3} :catch_3

    .line 73
    .line 74
    return-object v0

    .line 75
    :catch_3
    :cond_3
    return-object v3
.end method


# virtual methods
.method public b()Lkk1;
    .locals 3

    .line 1
    invoke-virtual {p0}, Lbk1;->a()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lxj1;->a:Landroid/view/WindowInsets;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-static {v0, v1}, Lkk1;->c(Landroid/view/WindowInsets;Landroid/view/View;)Lkk1;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v2, v0, Lkk1;->a:Lhk1;

    .line 12
    .line 13
    invoke-virtual {v2, v1}, Lhk1;->o([Lne0;)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lxj1;->b:Lne0;

    .line 17
    .line 18
    invoke-virtual {v2, p0}, Lhk1;->q(Lne0;)V

    .line 19
    .line 20
    .line 21
    return-object v0
.end method

.method public c(Lne0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lxj1;->b:Lne0;

    .line 2
    .line 3
    return-void
.end method

.method public d(Lne0;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lxj1;->a:Landroid/view/WindowInsets;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget v1, p1, Lne0;->a:I

    .line 6
    .line 7
    iget v2, p1, Lne0;->b:I

    .line 8
    .line 9
    iget v3, p1, Lne0;->c:I

    .line 10
    .line 11
    iget p1, p1, Lne0;->d:I

    .line 12
    .line 13
    invoke-virtual {v0, v1, v2, v3, p1}, Landroid/view/WindowInsets;->replaceSystemWindowInsets(IIII)Landroid/view/WindowInsets;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iput-object p1, p0, Lxj1;->a:Landroid/view/WindowInsets;

    .line 18
    .line 19
    :cond_0
    return-void
.end method
