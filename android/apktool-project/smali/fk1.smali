.class public Lfk1;
.super Lek1;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public n:Lne0;

.field public o:Lne0;

.field public p:Lne0;


# direct methods
.method public constructor <init>(Lkk1;Landroid/view/WindowInsets;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lek1;-><init>(Lkk1;Landroid/view/WindowInsets;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Lfk1;->n:Lne0;

    .line 6
    .line 7
    iput-object p1, p0, Lfk1;->o:Lne0;

    .line 8
    .line 9
    iput-object p1, p0, Lfk1;->p:Lne0;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public g()Lne0;
    .locals 1

    .line 1
    iget-object v0, p0, Lfk1;->o:Lne0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lck1;->c:Landroid/view/WindowInsets;

    .line 6
    .line 7
    invoke-static {v0}, Lyj1;->g(Landroid/view/WindowInsets;)Landroid/graphics/Insets;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Lne0;->b(Landroid/graphics/Insets;)Lne0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lfk1;->o:Lne0;

    .line 16
    .line 17
    :cond_0
    return-object v0
.end method

.method public i()Lne0;
    .locals 1

    .line 1
    iget-object v0, p0, Lfk1;->n:Lne0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lck1;->c:Landroid/view/WindowInsets;

    .line 6
    .line 7
    invoke-static {v0}, Lyj1;->h(Landroid/view/WindowInsets;)Landroid/graphics/Insets;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Lne0;->b(Landroid/graphics/Insets;)Lne0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lfk1;->n:Lne0;

    .line 16
    .line 17
    :cond_0
    return-object v0
.end method

.method public k()Lne0;
    .locals 1

    .line 1
    iget-object v0, p0, Lfk1;->p:Lne0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lck1;->c:Landroid/view/WindowInsets;

    .line 6
    .line 7
    invoke-static {v0}, Lyj1;->a(Landroid/view/WindowInsets;)Landroid/graphics/Insets;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Lne0;->b(Landroid/graphics/Insets;)Lne0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lfk1;->p:Lne0;

    .line 16
    .line 17
    :cond_0
    return-object v0
.end method

.method public l(IIII)Lkk1;
    .locals 0

    .line 1
    iget-object p0, p0, Lck1;->c:Landroid/view/WindowInsets;

    .line 2
    .line 3
    invoke-static {p0, p1, p2, p3, p4}, Lyj1;->e(Landroid/view/WindowInsets;IIII)Landroid/view/WindowInsets;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/4 p1, 0x0

    .line 8
    invoke-static {p0, p1}, Lkk1;->c(Landroid/view/WindowInsets;Landroid/view/View;)Lkk1;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public q(Lne0;)V
    .locals 0

    .line 1
    return-void
.end method
