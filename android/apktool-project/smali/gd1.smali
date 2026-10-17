.class public final Lgd1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lkw0;


# instance fields
.field public final j:Ljava/lang/Object;

.field public final k:Ljava/lang/Object;

.field public final l:Ljava/lang/Object;

.field public final m:Ljava/lang/Object;

.field public final n:Ljava/lang/Object;

.field public final o:Ljava/lang/Object;

.field public final p:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/view/WindowManager$LayoutParams;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/view/WindowManager$LayoutParams;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lgd1;->m:Ljava/lang/Object;

    .line 10
    .line 11
    new-instance v1, Landroid/graphics/Rect;

    .line 12
    .line 13
    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v1, p0, Lgd1;->n:Ljava/lang/Object;

    .line 17
    .line 18
    const/4 v1, 0x2

    .line 19
    new-array v2, v1, [I

    .line 20
    .line 21
    iput-object v2, p0, Lgd1;->o:Ljava/lang/Object;

    .line 22
    .line 23
    new-array v1, v1, [I

    .line 24
    .line 25
    iput-object v1, p0, Lgd1;->p:Ljava/lang/Object;

    .line 26
    .line 27
    iput-object p1, p0, Lgd1;->j:Ljava/lang/Object;

    .line 28
    .line 29
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    const v2, 0x7f0c001b

    .line 34
    .line 35
    .line 36
    const/4 v3, 0x0

    .line 37
    invoke-virtual {v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    iput-object v1, p0, Lgd1;->k:Ljava/lang/Object;

    .line 42
    .line 43
    const v2, 0x7f090131

    .line 44
    .line 45
    .line 46
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    check-cast v1, Landroid/widget/TextView;

    .line 51
    .line 52
    iput-object v1, p0, Lgd1;->l:Ljava/lang/Object;

    .line 53
    .line 54
    const-class p0, Lgd1;

    .line 55
    .line 56
    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {v0, p0}, Landroid/view/WindowManager$LayoutParams;->setTitle(Ljava/lang/CharSequence;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    iput-object p0, v0, Landroid/view/WindowManager$LayoutParams;->packageName:Ljava/lang/String;

    .line 68
    .line 69
    const/16 p0, 0x3ea

    .line 70
    .line 71
    iput p0, v0, Landroid/view/WindowManager$LayoutParams;->type:I

    .line 72
    .line 73
    const/4 p0, -0x2

    .line 74
    iput p0, v0, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 75
    .line 76
    iput p0, v0, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 77
    .line 78
    const/4 p0, -0x3

    .line 79
    iput p0, v0, Landroid/view/WindowManager$LayoutParams;->format:I

    .line 80
    .line 81
    const p0, 0x7f120004

    .line 82
    .line 83
    .line 84
    iput p0, v0, Landroid/view/WindowManager$LayoutParams;->windowAnimations:I

    .line 85
    .line 86
    const/16 p0, 0x18

    .line 87
    .line 88
    iput p0, v0, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 89
    .line 90
    return-void
.end method

.method public constructor <init>(Lkw0;Lkw0;Lkw0;Lc9;Lkw0;Lkw0;Lkw0;)V
    .locals 0

    .line 91
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 92
    iput-object p1, p0, Lgd1;->j:Ljava/lang/Object;

    .line 93
    iput-object p2, p0, Lgd1;->k:Ljava/lang/Object;

    .line 94
    iput-object p3, p0, Lgd1;->l:Ljava/lang/Object;

    .line 95
    iput-object p4, p0, Lgd1;->m:Ljava/lang/Object;

    .line 96
    iput-object p5, p0, Lgd1;->n:Ljava/lang/Object;

    .line 97
    iput-object p6, p0, Lgd1;->o:Ljava/lang/Object;

    .line 98
    iput-object p7, p0, Lgd1;->p:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public get()Ljava/lang/Object;
    .locals 9

    .line 1
    iget-object v0, p0, Lgd1;->j:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lkw0;

    .line 4
    .line 5
    invoke-interface {v0}, Lkw0;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Landroid/content/Context;

    .line 10
    .line 11
    iget-object v1, p0, Lgd1;->k:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast v1, Lkw0;

    .line 14
    .line 15
    invoke-interface {v1}, Lkw0;->get()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Lyn0;

    .line 20
    .line 21
    iget-object v2, p0, Lgd1;->l:Ljava/lang/Object;

    .line 22
    .line 23
    check-cast v2, Lkw0;

    .line 24
    .line 25
    invoke-interface {v2}, Lkw0;->get()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    check-cast v2, Lh21;

    .line 30
    .line 31
    iget-object v3, p0, Lgd1;->m:Ljava/lang/Object;

    .line 32
    .line 33
    check-cast v3, Lc9;

    .line 34
    .line 35
    invoke-virtual {v3}, Lc9;->get()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    check-cast v3, Lc9;

    .line 40
    .line 41
    iget-object v4, p0, Lgd1;->n:Ljava/lang/Object;

    .line 42
    .line 43
    check-cast v4, Lkw0;

    .line 44
    .line 45
    invoke-interface {v4}, Lkw0;->get()Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v4

    .line 49
    check-cast v4, Ljava/util/concurrent/Executor;

    .line 50
    .line 51
    iget-object v5, p0, Lgd1;->o:Ljava/lang/Object;

    .line 52
    .line 53
    check-cast v5, Lkw0;

    .line 54
    .line 55
    invoke-interface {v5}, Lkw0;->get()Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v5

    .line 59
    check-cast v5, Lh21;

    .line 60
    .line 61
    new-instance v6, Ltb0;

    .line 62
    .line 63
    const/16 v7, 0x17

    .line 64
    .line 65
    invoke-direct {v6, v7}, Ltb0;-><init>(I)V

    .line 66
    .line 67
    .line 68
    new-instance v7, Lt11;

    .line 69
    .line 70
    const/16 v8, 0x16

    .line 71
    .line 72
    invoke-direct {v7, v8}, Lt11;-><init>(I)V

    .line 73
    .line 74
    .line 75
    iget-object p0, p0, Lgd1;->p:Ljava/lang/Object;

    .line 76
    .line 77
    check-cast p0, Lkw0;

    .line 78
    .line 79
    invoke-interface {p0}, Lkw0;->get()Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    check-cast p0, Lh21;

    .line 84
    .line 85
    new-instance v8, Lve;

    .line 86
    .line 87
    invoke-direct {v8}, Ljava/lang/Object;-><init>()V

    .line 88
    .line 89
    .line 90
    iput-object v0, v8, Lve;->a:Ljava/lang/Object;

    .line 91
    .line 92
    iput-object v1, v8, Lve;->b:Ljava/lang/Object;

    .line 93
    .line 94
    iput-object v2, v8, Lve;->c:Ljava/lang/Object;

    .line 95
    .line 96
    iput-object v3, v8, Lve;->d:Ljava/lang/Object;

    .line 97
    .line 98
    iput-object v4, v8, Lve;->e:Ljava/lang/Object;

    .line 99
    .line 100
    iput-object v5, v8, Lve;->f:Ljava/lang/Object;

    .line 101
    .line 102
    iput-object v6, v8, Lve;->g:Ljava/lang/Object;

    .line 103
    .line 104
    iput-object v7, v8, Lve;->h:Ljava/lang/Object;

    .line 105
    .line 106
    iput-object p0, v8, Lve;->i:Ljava/lang/Object;

    .line 107
    .line 108
    return-object v8
.end method
