.class public Lzj1;
.super Lbk1;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final a:Landroid/view/WindowInsets$Builder;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 22
    invoke-direct {p0}, Lbk1;-><init>()V

    .line 23
    invoke-static {}, Lyj1;->b()Landroid/view/WindowInsets$Builder;

    move-result-object v0

    iput-object v0, p0, Lzj1;->a:Landroid/view/WindowInsets$Builder;

    return-void
.end method

.method public constructor <init>(Lkk1;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lbk1;-><init>(Lkk1;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lkk1;->b()Landroid/view/WindowInsets;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    invoke-static {p1}, Lyj1;->c(Landroid/view/WindowInsets;)Landroid/view/WindowInsets$Builder;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    invoke-static {}, Lyj1;->b()Landroid/view/WindowInsets$Builder;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    :goto_0
    iput-object p1, p0, Lzj1;->a:Landroid/view/WindowInsets$Builder;

    .line 20
    .line 21
    return-void
.end method


# virtual methods
.method public b()Lkk1;
    .locals 2

    .line 1
    invoke-virtual {p0}, Lbk1;->a()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lzj1;->a:Landroid/view/WindowInsets$Builder;

    .line 5
    .line 6
    invoke-static {p0}, Lyj1;->d(Landroid/view/WindowInsets$Builder;)Landroid/view/WindowInsets;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    const/4 v0, 0x0

    .line 11
    invoke-static {p0, v0}, Lkk1;->c(Landroid/view/WindowInsets;Landroid/view/View;)Lkk1;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    iget-object v1, p0, Lkk1;->a:Lhk1;

    .line 16
    .line 17
    invoke-virtual {v1, v0}, Lhk1;->o([Lne0;)V

    .line 18
    .line 19
    .line 20
    return-object p0
.end method

.method public c(Lne0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lzj1;->a:Landroid/view/WindowInsets$Builder;

    .line 2
    .line 3
    invoke-virtual {p1}, Lne0;->c()Landroid/graphics/Insets;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p0, p1}, Lyj1;->f(Landroid/view/WindowInsets$Builder;Landroid/graphics/Insets;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public d(Lne0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lzj1;->a:Landroid/view/WindowInsets$Builder;

    .line 2
    .line 3
    invoke-virtual {p1}, Lne0;->c()Landroid/graphics/Insets;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p0, p1}, Le1;->l(Landroid/view/WindowInsets$Builder;Landroid/graphics/Insets;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
