.class public final Lm91;
.super Ly2;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lpm0;


# instance fields
.field public l:Landroid/content/Context;

.field public m:Landroidx/appcompat/widget/ActionBarContextView;

.field public n:Ls7;

.field public o:Ljava/lang/ref/WeakReference;

.field public p:Z

.field public q:Lrm0;


# virtual methods
.method public final a()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lm91;->p:Z

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
    iput-boolean v0, p0, Lm91;->p:Z

    .line 8
    .line 9
    iget-object v0, p0, Lm91;->n:Ls7;

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ls7;->B(Ly2;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final b()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lm91;->o:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Landroid/view/View;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return-object p0
.end method

.method public final c()Lrm0;
    .locals 0

    .line 1
    iget-object p0, p0, Lm91;->q:Lrm0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final d()Landroid/view/MenuInflater;
    .locals 1

    .line 1
    new-instance v0, Lab1;

    .line 2
    .line 3
    iget-object p0, p0, Lm91;->m:Landroidx/appcompat/widget/ActionBarContextView;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-direct {v0, p0}, Lab1;-><init>(Landroid/content/Context;)V

    .line 10
    .line 11
    .line 12
    return-object v0
.end method

.method public final e(Lrm0;Landroid/view/MenuItem;)Z
    .locals 0

    .line 1
    iget-object p1, p0, Lm91;->n:Ls7;

    .line 2
    .line 3
    iget-object p1, p1, Ls7;->k:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast p1, Ler0;

    .line 6
    .line 7
    invoke-virtual {p1, p0, p2}, Ler0;->p(Ly2;Landroid/view/MenuItem;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public final f()Ljava/lang/CharSequence;
    .locals 0

    .line 1
    iget-object p0, p0, Lm91;->m:Landroidx/appcompat/widget/ActionBarContextView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/appcompat/widget/ActionBarContextView;->getSubtitle()Ljava/lang/CharSequence;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final g()Ljava/lang/CharSequence;
    .locals 0

    .line 1
    iget-object p0, p0, Lm91;->m:Landroidx/appcompat/widget/ActionBarContextView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/appcompat/widget/ActionBarContextView;->getTitle()Ljava/lang/CharSequence;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final h()V
    .locals 2

    .line 1
    iget-object v0, p0, Lm91;->n:Ls7;

    .line 2
    .line 3
    iget-object v1, p0, Lm91;->q:Lrm0;

    .line 4
    .line 5
    invoke-virtual {v0, p0, v1}, Ls7;->D(Ly2;Landroid/view/Menu;)Z

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final i()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lm91;->m:Landroidx/appcompat/widget/ActionBarContextView;

    .line 2
    .line 3
    iget-boolean p0, p0, Landroidx/appcompat/widget/ActionBarContextView;->B:Z

    .line 4
    .line 5
    return p0
.end method

.method public final j(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lm91;->m:Landroidx/appcompat/widget/ActionBarContextView;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/ActionBarContextView;->setCustomView(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 9
    .line 10
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 v0, 0x0

    .line 15
    :goto_0
    iput-object v0, p0, Lm91;->o:Ljava/lang/ref/WeakReference;

    .line 16
    .line 17
    return-void
.end method

.method public final k(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lm91;->l:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Lm91;->m(Ljava/lang/CharSequence;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final l(Lrm0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lm91;->h()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lm91;->m:Landroidx/appcompat/widget/ActionBarContextView;

    .line 5
    .line 6
    iget-object p0, p0, Landroidx/appcompat/widget/ActionBarContextView;->m:Lu2;

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Lu2;->l()Z

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public final m(Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lm91;->m:Landroidx/appcompat/widget/ActionBarContextView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/ActionBarContextView;->setSubtitle(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final n(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lm91;->l:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Lm91;->o(Ljava/lang/CharSequence;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final o(Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lm91;->m:Landroidx/appcompat/widget/ActionBarContextView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/ActionBarContextView;->setTitle(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final p(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ly2;->k:Z

    .line 2
    .line 3
    iget-object p0, p0, Lm91;->m:Landroidx/appcompat/widget/ActionBarContextView;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/ActionBarContextView;->setTitleOptional(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
