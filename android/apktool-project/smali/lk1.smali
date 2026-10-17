.class public Llk1;
.super Lst;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final synthetic g:I

.field public final h:Landroid/view/Window;

.field public final i:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/view/Window;Lpa0;I)V
    .locals 0

    .line 1
    iput p3, p0, Llk1;->g:I

    .line 2
    .line 3
    packed-switch p3, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Llk1;->h:Landroid/view/Window;

    .line 10
    .line 11
    iput-object p2, p0, Llk1;->i:Ljava/lang/Object;

    .line 12
    .line 13
    return-void

    .line 14
    :pswitch_0
    invoke-static {p1}, Lik1;->b(Landroid/view/Window;)Landroid/view/WindowInsetsController;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object p2, p0, Llk1;->i:Ljava/lang/Object;

    .line 22
    .line 23
    iput-object p1, p0, Llk1;->h:Landroid/view/Window;

    .line 24
    .line 25
    return-void

    .line 26
    nop

    .line 27
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public C(I)V
    .locals 1

    .line 1
    iget-object p0, p0, Llk1;->h:Landroid/view/Window;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getSystemUiVisibility()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    or-int/2addr p1, v0

    .line 12
    invoke-virtual {p0, p1}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public D(I)V
    .locals 1

    .line 1
    iget-object p0, p0, Llk1;->h:Landroid/view/Window;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getSystemUiVisibility()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    not-int p1, p1

    .line 12
    and-int/2addr p1, v0

    .line 13
    invoke-virtual {p0, p1}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final g()V
    .locals 4

    .line 1
    iget v0, p0, Llk1;->g:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    iget-object v2, p0, Llk1;->i:Ljava/lang/Object;

    .line 5
    .line 6
    packed-switch v0, :pswitch_data_0

    .line 7
    .line 8
    .line 9
    check-cast v2, Landroid/view/WindowInsetsController;

    .line 10
    .line 11
    invoke-static {v2, v1}, Lik1;->h(Landroid/view/WindowInsetsController;I)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :pswitch_0
    move v0, v1

    .line 16
    :goto_0
    const/16 v3, 0x100

    .line 17
    .line 18
    if-gt v0, v3, :cond_4

    .line 19
    .line 20
    and-int v3, v1, v0

    .line 21
    .line 22
    if-nez v3, :cond_0

    .line 23
    .line 24
    goto :goto_1

    .line 25
    :cond_0
    if-eq v0, v1, :cond_3

    .line 26
    .line 27
    const/4 v3, 0x2

    .line 28
    if-eq v0, v3, :cond_2

    .line 29
    .line 30
    const/16 v3, 0x8

    .line 31
    .line 32
    if-eq v0, v3, :cond_1

    .line 33
    .line 34
    goto :goto_1

    .line 35
    :cond_1
    move-object v3, v2

    .line 36
    check-cast v3, Lpa0;

    .line 37
    .line 38
    iget-object v3, v3, Lpa0;->k:Ljava/lang/Object;

    .line 39
    .line 40
    check-cast v3, Lny0;

    .line 41
    .line 42
    invoke-virtual {v3}, Lny0;->s()V

    .line 43
    .line 44
    .line 45
    goto :goto_1

    .line 46
    :cond_2
    invoke-virtual {p0, v3}, Llk1;->C(I)V

    .line 47
    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_3
    const/4 v3, 0x4

    .line 51
    invoke-virtual {p0, v3}, Llk1;->C(I)V

    .line 52
    .line 53
    .line 54
    :goto_1
    shl-int/lit8 v0, v0, 0x1

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_4
    return-void

    .line 58
    nop

    .line 59
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public o()V
    .locals 2

    .line 1
    iget v0, p0, Llk1;->g:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :pswitch_0
    iget-object v0, p0, Llk1;->h:Landroid/view/Window;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Landroid/view/View;->getSystemUiVisibility()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    and-int/lit8 v1, v1, -0x11

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 22
    .line 23
    .line 24
    :cond_0
    iget-object p0, p0, Llk1;->i:Ljava/lang/Object;

    .line 25
    .line 26
    check-cast p0, Landroid/view/WindowInsetsController;

    .line 27
    .line 28
    invoke-static {p0}, Lik1;->g(Landroid/view/WindowInsetsController;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    nop

    .line 33
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method public final p()V
    .locals 2

    .line 1
    iget v0, p0, Llk1;->g:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Llk1;->h:Landroid/view/Window;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Landroid/view/View;->getSystemUiVisibility()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    and-int/lit16 v1, v1, -0x2001

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 21
    .line 22
    .line 23
    :cond_0
    iget-object p0, p0, Llk1;->i:Ljava/lang/Object;

    .line 24
    .line 25
    check-cast p0, Landroid/view/WindowInsetsController;

    .line 26
    .line 27
    invoke-static {p0}, Lik1;->c(Landroid/view/WindowInsetsController;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :pswitch_0
    const/16 v0, 0x2000

    .line 32
    .line 33
    invoke-virtual {p0, v0}, Llk1;->D(I)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final u()V
    .locals 1

    .line 1
    iget v0, p0, Llk1;->g:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Llk1;->i:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast p0, Landroid/view/WindowInsetsController;

    .line 9
    .line 10
    invoke-static {p0}, Lik1;->j(Landroid/view/WindowInsetsController;)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :pswitch_0
    const/16 v0, 0x800

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Llk1;->D(I)V

    .line 17
    .line 18
    .line 19
    const/16 v0, 0x1000

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Llk1;->C(I)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final v()V
    .locals 5

    .line 1
    iget v0, p0, Llk1;->g:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    iget-object v2, p0, Llk1;->i:Ljava/lang/Object;

    .line 5
    .line 6
    packed-switch v0, :pswitch_data_0

    .line 7
    .line 8
    .line 9
    check-cast v2, Landroid/view/WindowInsetsController;

    .line 10
    .line 11
    invoke-static {v2, v1}, Lik1;->d(Landroid/view/WindowInsetsController;I)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :pswitch_0
    move v0, v1

    .line 16
    :goto_0
    const/16 v3, 0x100

    .line 17
    .line 18
    if-gt v0, v3, :cond_4

    .line 19
    .line 20
    and-int v3, v1, v0

    .line 21
    .line 22
    if-nez v3, :cond_0

    .line 23
    .line 24
    goto :goto_1

    .line 25
    :cond_0
    if-eq v0, v1, :cond_3

    .line 26
    .line 27
    const/4 v3, 0x2

    .line 28
    if-eq v0, v3, :cond_2

    .line 29
    .line 30
    const/16 v3, 0x8

    .line 31
    .line 32
    if-eq v0, v3, :cond_1

    .line 33
    .line 34
    goto :goto_1

    .line 35
    :cond_1
    move-object v3, v2

    .line 36
    check-cast v3, Lpa0;

    .line 37
    .line 38
    iget-object v3, v3, Lpa0;->k:Ljava/lang/Object;

    .line 39
    .line 40
    check-cast v3, Lny0;

    .line 41
    .line 42
    invoke-virtual {v3}, Lny0;->t()V

    .line 43
    .line 44
    .line 45
    goto :goto_1

    .line 46
    :cond_2
    invoke-virtual {p0, v3}, Llk1;->D(I)V

    .line 47
    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_3
    const/4 v3, 0x4

    .line 51
    invoke-virtual {p0, v3}, Llk1;->D(I)V

    .line 52
    .line 53
    .line 54
    const/16 v3, 0x400

    .line 55
    .line 56
    iget-object v4, p0, Llk1;->h:Landroid/view/Window;

    .line 57
    .line 58
    invoke-virtual {v4, v3}, Landroid/view/Window;->clearFlags(I)V

    .line 59
    .line 60
    .line 61
    :goto_1
    shl-int/lit8 v0, v0, 0x1

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_4
    return-void

    .line 65
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
