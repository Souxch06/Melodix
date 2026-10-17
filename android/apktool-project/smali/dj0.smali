.class public final Ldj0;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lin0;
.implements Landroid/widget/AdapterView$OnItemClickListener;


# instance fields
.field public j:Landroid/content/Context;

.field public k:Landroid/view/LayoutInflater;

.field public l:Lrm0;

.field public m:Landroidx/appcompat/view/menu/ExpandedMenuView;

.field public n:Lhn0;

.field public o:Lcj0;


# direct methods
.method public constructor <init>(Landroid/content/ContextWrapper;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ldj0;->j:Landroid/content/Context;

    .line 5
    .line 6
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, p0, Ldj0;->k:Landroid/view/LayoutInflater;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final b(Lrm0;Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ldj0;->n:Lhn0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Lhn0;->b(Lrm0;Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final d(Lvm0;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public final e(Lhn0;)V
    .locals 0

    const/4 p0, 0x0

    throw p0
.end method

.method public final f(Lvm0;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public final g()V
    .locals 0

    .line 1
    iget-object p0, p0, Ldj0;->o:Lcj0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcj0;->notifyDataSetChanged()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final i(Landroid/content/Context;Lrm0;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ldj0;->j:Landroid/content/Context;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iput-object p1, p0, Ldj0;->j:Landroid/content/Context;

    .line 6
    .line 7
    iget-object v0, p0, Ldj0;->k:Landroid/view/LayoutInflater;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iput-object p1, p0, Ldj0;->k:Landroid/view/LayoutInflater;

    .line 16
    .line 17
    :cond_0
    iput-object p2, p0, Ldj0;->l:Lrm0;

    .line 18
    .line 19
    iget-object p0, p0, Ldj0;->o:Lcj0;

    .line 20
    .line 21
    if-eqz p0, :cond_1

    .line 22
    .line 23
    invoke-virtual {p0}, Lcj0;->notifyDataSetChanged()V

    .line 24
    .line 25
    .line 26
    :cond_1
    return-void
.end method

.method public final j(Lna1;)Z
    .locals 6

    .line 1
    invoke-virtual {p1}, Lrm0;->hasVisibleItems()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p1, Lrm0;->a:Landroid/content/Context;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_0
    new-instance v0, Lsm0;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, v0, Lsm0;->j:Lrm0;

    .line 17
    .line 18
    new-instance v2, Lf4;

    .line 19
    .line 20
    invoke-direct {v2, v1}, Lf4;-><init>(Landroid/content/Context;)V

    .line 21
    .line 22
    .line 23
    iget-object v3, v2, Lf4;->c:Ljava/lang/Object;

    .line 24
    .line 25
    check-cast v3, Lb4;

    .line 26
    .line 27
    new-instance v4, Ldj0;

    .line 28
    .line 29
    iget-object v5, v3, Lb4;->a:Landroid/view/ContextThemeWrapper;

    .line 30
    .line 31
    invoke-direct {v4, v5}, Ldj0;-><init>(Landroid/content/ContextWrapper;)V

    .line 32
    .line 33
    .line 34
    iput-object v4, v0, Lsm0;->l:Ldj0;

    .line 35
    .line 36
    iput-object v0, v4, Ldj0;->n:Lhn0;

    .line 37
    .line 38
    invoke-virtual {p1, v4, v1}, Lrm0;->b(Lin0;Landroid/content/Context;)V

    .line 39
    .line 40
    .line 41
    iget-object v1, v0, Lsm0;->l:Ldj0;

    .line 42
    .line 43
    iget-object v4, v1, Ldj0;->o:Lcj0;

    .line 44
    .line 45
    if-nez v4, :cond_1

    .line 46
    .line 47
    new-instance v4, Lcj0;

    .line 48
    .line 49
    invoke-direct {v4, v1}, Lcj0;-><init>(Ldj0;)V

    .line 50
    .line 51
    .line 52
    iput-object v4, v1, Ldj0;->o:Lcj0;

    .line 53
    .line 54
    :cond_1
    iput-object v4, v3, Lb4;->p:Landroid/widget/ListAdapter;

    .line 55
    .line 56
    iput-object v0, v3, Lb4;->q:Landroid/content/DialogInterface$OnClickListener;

    .line 57
    .line 58
    iget-object v1, p1, Lrm0;->o:Landroid/view/View;

    .line 59
    .line 60
    if-eqz v1, :cond_2

    .line 61
    .line 62
    iput-object v1, v3, Lb4;->e:Landroid/view/View;

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_2
    iget-object v1, p1, Lrm0;->n:Landroid/graphics/drawable/Drawable;

    .line 66
    .line 67
    iput-object v1, v3, Lb4;->c:Landroid/graphics/drawable/Drawable;

    .line 68
    .line 69
    iget-object v1, p1, Lrm0;->m:Ljava/lang/CharSequence;

    .line 70
    .line 71
    iput-object v1, v3, Lb4;->d:Ljava/lang/CharSequence;

    .line 72
    .line 73
    :goto_0
    iput-object v0, v3, Lb4;->n:Lsm0;

    .line 74
    .line 75
    invoke-virtual {v2}, Lf4;->a()Lg4;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    iput-object v1, v0, Lsm0;->k:Lg4;

    .line 80
    .line 81
    invoke-virtual {v1, v0}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 82
    .line 83
    .line 84
    iget-object v1, v0, Lsm0;->k:Lg4;

    .line 85
    .line 86
    invoke-virtual {v1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    invoke-virtual {v1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    const/16 v2, 0x3eb

    .line 95
    .line 96
    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->type:I

    .line 97
    .line 98
    iget v2, v1, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 99
    .line 100
    const/high16 v3, 0x20000

    .line 101
    .line 102
    or-int/2addr v2, v3

    .line 103
    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 104
    .line 105
    iget-object v0, v0, Lsm0;->k:Lg4;

    .line 106
    .line 107
    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    .line 108
    .line 109
    .line 110
    iget-object p0, p0, Ldj0;->n:Lhn0;

    .line 111
    .line 112
    if-eqz p0, :cond_3

    .line 113
    .line 114
    invoke-interface {p0, p1}, Lhn0;->l(Lrm0;)Z

    .line 115
    .line 116
    .line 117
    :cond_3
    const/4 p0, 0x1

    .line 118
    return p0
.end method

.method public final k()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public final onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 0

    .line 1
    iget-object p1, p0, Ldj0;->l:Lrm0;

    .line 2
    .line 3
    iget-object p2, p0, Ldj0;->o:Lcj0;

    .line 4
    .line 5
    invoke-virtual {p2, p3}, Lcj0;->b(I)Lvm0;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    const/4 p3, 0x0

    .line 10
    invoke-virtual {p1, p2, p0, p3}, Lrm0;->q(Landroid/view/MenuItem;Lin0;I)Z

    .line 11
    .line 12
    .line 13
    return-void
.end method
