.class public Lhm;
.super Landroid/app/Dialog;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lci0;
.implements Lz21;


# instance fields
.field public j:Landroidx/lifecycle/a;

.field public final k:Lo80;

.field public final l:Landroidx/activity/b;


# direct methods
.method public constructor <init>(Landroid/content/Context;I)V
    .locals 1

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Lo80;

    .line 5
    .line 6
    invoke-direct {p1, p0}, Lo80;-><init>(Lz21;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lhm;->k:Lo80;

    .line 10
    .line 11
    new-instance p1, Landroidx/activity/b;

    .line 12
    .line 13
    new-instance p2, La3;

    .line 14
    .line 15
    const/4 v0, 0x4

    .line 16
    invoke-direct {p2, v0, p0}, La3;-><init>(ILjava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    invoke-direct {p1, p2}, Landroidx/activity/b;-><init>(Ljava/lang/Runnable;)V

    .line 20
    .line 21
    .line 22
    iput-object p1, p0, Lhm;->l:Landroidx/activity/b;

    .line 23
    .line 24
    return-void
.end method

.method public static final c(Lhm;)V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/app/Dialog;->onBackPressed()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a()Lk6;
    .locals 0

    .line 1
    iget-object p0, p0, Lhm;->k:Lo80;

    .line 2
    .line 3
    iget-object p0, p0, Lo80;->c:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast p0, Lk6;

    .line 6
    .line 7
    return-object p0
.end method

.method public addContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lhm;->b()V

    .line 5
    .line 6
    .line 7
    invoke-super {p0, p1, p2}, Landroid/app/Dialog;->addContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final b()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 13
    .line 14
    .line 15
    const v1, 0x7f090221

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1, p0}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 33
    .line 34
    .line 35
    const v1, 0x7f090222

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, v1, p0}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 53
    .line 54
    .line 55
    const v1, 0x7f090223

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0, v1, p0}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public final e()Landroidx/lifecycle/a;
    .locals 1

    .line 1
    iget-object v0, p0, Lhm;->j:Landroidx/lifecycle/a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroidx/lifecycle/a;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Landroidx/lifecycle/a;-><init>(Lci0;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lhm;->j:Landroidx/lifecycle/a;

    .line 11
    .line 12
    :cond_0
    return-object v0
.end method

.method public final onBackPressed()V
    .locals 0

    .line 1
    iget-object p0, p0, Lhm;->l:Landroidx/activity/b;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/activity/b;->b()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroid/app/Dialog;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 5
    .line 6
    const/16 v1, 0x21

    .line 7
    .line 8
    if-lt v0, v1, :cond_0

    .line 9
    .line 10
    invoke-static {p0}, Lh1;->c(Lhm;)Landroid/window/OnBackInvokedDispatcher;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 15
    .line 16
    .line 17
    iget-object v1, p0, Lhm;->l:Landroidx/activity/b;

    .line 18
    .line 19
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    .line 21
    .line 22
    iput-object v0, v1, Landroidx/activity/b;->e:Landroid/window/OnBackInvokedDispatcher;

    .line 23
    .line 24
    iget-boolean v0, v1, Landroidx/activity/b;->g:Z

    .line 25
    .line 26
    invoke-virtual {v1, v0}, Landroidx/activity/b;->c(Z)V

    .line 27
    .line 28
    .line 29
    :cond_0
    iget-object v0, p0, Lhm;->k:Lo80;

    .line 30
    .line 31
    invoke-virtual {v0, p1}, Lo80;->d(Landroid/os/Bundle;)V

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Lhm;->j:Landroidx/lifecycle/a;

    .line 35
    .line 36
    if-nez p1, :cond_1

    .line 37
    .line 38
    new-instance p1, Landroidx/lifecycle/a;

    .line 39
    .line 40
    invoke-direct {p1, p0}, Landroidx/lifecycle/a;-><init>(Lci0;)V

    .line 41
    .line 42
    .line 43
    iput-object p1, p0, Lhm;->j:Landroidx/lifecycle/a;

    .line 44
    .line 45
    :cond_1
    sget-object p0, Lvh0;->ON_CREATE:Lvh0;

    .line 46
    .line 47
    invoke-virtual {p1, p0}, Landroidx/lifecycle/a;->d(Lvh0;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public final onSaveInstanceState()Landroid/os/Bundle;
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/app/Dialog;->onSaveInstanceState()Landroid/os/Bundle;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lhm;->k:Lo80;

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Lo80;->e(Landroid/os/Bundle;)V

    .line 11
    .line 12
    .line 13
    return-object v0
.end method

.method public final onStart()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/app/Dialog;->onStart()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lhm;->j:Landroidx/lifecycle/a;

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    new-instance v0, Landroidx/lifecycle/a;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Landroidx/lifecycle/a;-><init>(Lci0;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lhm;->j:Landroidx/lifecycle/a;

    .line 14
    .line 15
    :cond_0
    sget-object p0, Lvh0;->ON_RESUME:Lvh0;

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Landroidx/lifecycle/a;->d(Lvh0;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public onStop()V
    .locals 2

    .line 1
    iget-object v0, p0, Lhm;->j:Landroidx/lifecycle/a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroidx/lifecycle/a;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Landroidx/lifecycle/a;-><init>(Lci0;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lhm;->j:Landroidx/lifecycle/a;

    .line 11
    .line 12
    :cond_0
    sget-object v1, Lvh0;->ON_DESTROY:Lvh0;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroidx/lifecycle/a;->d(Lvh0;)V

    .line 15
    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    iput-object v0, p0, Lhm;->j:Landroidx/lifecycle/a;

    .line 19
    .line 20
    invoke-super {p0}, Landroid/app/Dialog;->onStop()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public setContentView(I)V
    .locals 0

    .line 11
    invoke-virtual {p0}, Lhm;->b()V

    .line 12
    invoke-super {p0, p1}, Landroid/app/Dialog;->setContentView(I)V

    return-void
.end method

.method public setContentView(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lhm;->b()V

    .line 5
    .line 6
    .line 7
    invoke-super {p0, p1}, Landroid/app/Dialog;->setContentView(Landroid/view/View;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public setContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    .locals 0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 13
    invoke-virtual {p0}, Lhm;->b()V

    .line 14
    invoke-super {p0, p1, p2}, Landroid/app/Dialog;->setContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method
