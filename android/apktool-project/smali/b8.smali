.class public final Lb8;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lh8;
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public j:Lg4;

.field public k:Lc8;

.field public l:Ljava/lang/CharSequence;

.field public final synthetic m:Li8;


# direct methods
.method public constructor <init>(Li8;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lb8;->m:Li8;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lb8;->j:Lg4;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/app/Dialog;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public final b()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public final d()Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public final dismiss()V
    .locals 1

    .line 1
    iget-object v0, p0, Lb8;->j:Lg4;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lg4;->dismiss()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lb8;->j:Lg4;

    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public final f(Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lb8;->l:Ljava/lang/CharSequence;

    .line 2
    .line 3
    return-void
.end method

.method public final g(Landroid/graphics/drawable/Drawable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final j(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public final k(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public final l(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public final m(II)V
    .locals 4

    .line 1
    iget-object v0, p0, Lb8;->k:Lc8;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance v0, Lf4;

    .line 7
    .line 8
    iget-object v1, p0, Lb8;->m:Li8;

    .line 9
    .line 10
    invoke-virtual {v1}, Li8;->getPopupContext()Landroid/content/Context;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-direct {v0, v2}, Lf4;-><init>(Landroid/content/Context;)V

    .line 15
    .line 16
    .line 17
    iget-object v2, v0, Lf4;->c:Ljava/lang/Object;

    .line 18
    .line 19
    check-cast v2, Lb4;

    .line 20
    .line 21
    iget-object v3, p0, Lb8;->l:Ljava/lang/CharSequence;

    .line 22
    .line 23
    if-eqz v3, :cond_1

    .line 24
    .line 25
    iput-object v3, v2, Lb4;->d:Ljava/lang/CharSequence;

    .line 26
    .line 27
    :cond_1
    iget-object v3, p0, Lb8;->k:Lc8;

    .line 28
    .line 29
    invoke-virtual {v1}, Landroid/widget/AdapterView;->getSelectedItemPosition()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    iput-object v3, v2, Lb4;->p:Landroid/widget/ListAdapter;

    .line 34
    .line 35
    iput-object p0, v2, Lb4;->q:Landroid/content/DialogInterface$OnClickListener;

    .line 36
    .line 37
    iput v1, v2, Lb4;->v:I

    .line 38
    .line 39
    const/4 v1, 0x1

    .line 40
    iput-boolean v1, v2, Lb4;->u:Z

    .line 41
    .line 42
    invoke-virtual {v0}, Lf4;->a()Lg4;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    iput-object v0, p0, Lb8;->j:Lg4;

    .line 47
    .line 48
    iget-object v0, v0, Lg4;->o:Le4;

    .line 49
    .line 50
    iget-object v0, v0, Le4;->f:Landroidx/appcompat/app/AlertController$RecycleListView;

    .line 51
    .line 52
    invoke-virtual {v0, p1}, Landroid/view/View;->setTextDirection(I)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0, p2}, Landroid/view/View;->setTextAlignment(I)V

    .line 56
    .line 57
    .line 58
    iget-object p0, p0, Lb8;->j:Lg4;

    .line 59
    .line 60
    invoke-virtual {p0}, Landroid/app/Dialog;->show()V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public final n()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public final o()Ljava/lang/CharSequence;
    .locals 0

    .line 1
    iget-object p0, p0, Lb8;->l:Ljava/lang/CharSequence;

    .line 2
    .line 3
    return-object p0
.end method

.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 3

    .line 1
    iget-object p1, p0, Lb8;->m:Li8;

    .line 2
    .line 3
    invoke-virtual {p1, p2}, Landroid/widget/AdapterView;->setSelection(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/widget/AdapterView;->getOnItemClickListener()Landroid/widget/AdapterView$OnItemClickListener;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lb8;->k:Lc8;

    .line 13
    .line 14
    invoke-virtual {v0, p2}, Lc8;->getItemId(I)J

    .line 15
    .line 16
    .line 17
    move-result-wide v0

    .line 18
    const/4 v2, 0x0

    .line 19
    invoke-virtual {p1, v2, p2, v0, v1}, Landroid/widget/AdapterView;->performItemClick(Landroid/view/View;IJ)Z

    .line 20
    .line 21
    .line 22
    :cond_0
    invoke-virtual {p0}, Lb8;->dismiss()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final p(Landroid/widget/ListAdapter;)V
    .locals 0

    .line 1
    check-cast p1, Lc8;

    .line 2
    .line 3
    iput-object p1, p0, Lb8;->k:Lc8;

    .line 4
    .line 5
    return-void
.end method
