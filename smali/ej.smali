.class public final Lej;
.super Lan0;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Landroid/view/View$OnKeyListener;
.implements Landroid/widget/PopupWindow$OnDismissListener;


# instance fields
.field public A:Z

.field public B:I

.field public C:I

.field public D:Z

.field public E:Z

.field public F:Lhn0;

.field public G:Landroid/view/ViewTreeObserver;

.field public H:Landroid/widget/PopupWindow$OnDismissListener;

.field public I:Z

.field public final k:Landroid/content/Context;

.field public final l:I

.field public final m:I

.field public final n:Z

.field public final o:Landroid/os/Handler;

.field public final p:Ljava/util/ArrayList;

.field public final q:Ljava/util/ArrayList;

.field public final r:Lz7;

.field public final s:Lbj;

.field public final t:Lbv1;

.field public u:I

.field public v:I

.field public w:Landroid/view/View;

.field public x:Landroid/view/View;

.field public y:I

.field public z:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/view/View;IZ)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lej;->p:Ljava/util/ArrayList;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lej;->q:Ljava/util/ArrayList;

    .line 17
    .line 18
    new-instance v0, Lz7;

    .line 19
    .line 20
    const/4 v1, 0x2

    .line 21
    invoke-direct {v0, v1, p0}, Lz7;-><init>(ILjava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Lej;->r:Lz7;

    .line 25
    .line 26
    new-instance v0, Lbj;

    .line 27
    .line 28
    const/4 v2, 0x0

    .line 29
    invoke-direct {v0, v2, p0}, Lbj;-><init>(ILjava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    iput-object v0, p0, Lej;->s:Lbj;

    .line 33
    .line 34
    new-instance v0, Lbv1;

    .line 35
    .line 36
    const/16 v3, 0x9

    .line 37
    .line 38
    invoke-direct {v0, v3, p0}, Lbv1;-><init>(ILjava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    iput-object v0, p0, Lej;->t:Lbv1;

    .line 42
    .line 43
    iput v2, p0, Lej;->u:I

    .line 44
    .line 45
    iput v2, p0, Lej;->v:I

    .line 46
    .line 47
    iput-object p1, p0, Lej;->k:Landroid/content/Context;

    .line 48
    .line 49
    iput-object p2, p0, Lej;->w:Landroid/view/View;

    .line 50
    .line 51
    iput p3, p0, Lej;->m:I

    .line 52
    .line 53
    iput-boolean p4, p0, Lej;->n:Z

    .line 54
    .line 55
    iput-boolean v2, p0, Lej;->D:Z

    .line 56
    .line 57
    invoke-virtual {p2}, Landroid/view/View;->getLayoutDirection()I

    .line 58
    .line 59
    .line 60
    move-result p2

    .line 61
    const/4 p3, 0x1

    .line 62
    if-ne p2, p3, :cond_0

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_0
    move v2, p3

    .line 66
    :goto_0
    iput v2, p0, Lej;->y:I

    .line 67
    .line 68
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 73
    .line 74
    .line 75
    move-result-object p2

    .line 76
    iget p2, p2, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 77
    .line 78
    div-int/2addr p2, v1

    .line 79
    const p3, 0x7f070017

    .line 80
    .line 81
    .line 82
    invoke-virtual {p1, p3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 83
    .line 84
    .line 85
    move-result p1

    .line 86
    invoke-static {p2, p1}, Ljava/lang/Math;->max(II)I

    .line 87
    .line 88
    .line 89
    move-result p1

    .line 90
    iput p1, p0, Lej;->l:I

    .line 91
    .line 92
    new-instance p1, Landroid/os/Handler;

    .line 93
    .line 94
    invoke-direct {p1}, Landroid/os/Handler;-><init>()V

    .line 95
    .line 96
    .line 97
    iput-object p1, p0, Lej;->o:Landroid/os/Handler;

    .line 98
    .line 99
    return-void
.end method


# virtual methods
.method public final a()Z
    .locals 2

    .line 1
    iget-object p0, p0, Lej;->q:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-lez v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    check-cast p0, Ldj;

    .line 15
    .line 16
    iget-object p0, p0, Ldj;->a:Lgn0;

    .line 17
    .line 18
    iget-object p0, p0, Llj0;->I:Lr7;

    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-eqz p0, :cond_0

    .line 25
    .line 26
    const/4 p0, 0x1

    .line 27
    return p0

    .line 28
    :cond_0
    return v1
.end method

.method public final b(Lrm0;Z)V
    .locals 6

    .line 1
    iget-object v0, p0, Lej;->q:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const/4 v2, 0x0

    .line 8
    move v3, v2

    .line 9
    :goto_0
    if-ge v3, v1, :cond_1

    .line 10
    .line 11
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v4

    .line 15
    check-cast v4, Ldj;

    .line 16
    .line 17
    iget-object v4, v4, Ldj;->b:Lrm0;

    .line 18
    .line 19
    if-ne p1, v4, :cond_0

    .line 20
    .line 21
    goto :goto_1

    .line 22
    :cond_0
    add-int/lit8 v3, v3, 0x1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    const/4 v3, -0x1

    .line 26
    :goto_1
    if-gez v3, :cond_2

    .line 27
    .line 28
    goto/16 :goto_4

    .line 29
    .line 30
    :cond_2
    add-int/lit8 v1, v3, 0x1

    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 33
    .line 34
    .line 35
    move-result v4

    .line 36
    if-ge v1, v4, :cond_3

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    check-cast v1, Ldj;

    .line 43
    .line 44
    iget-object v1, v1, Ldj;->b:Lrm0;

    .line 45
    .line 46
    invoke-virtual {v1, v2}, Lrm0;->c(Z)V

    .line 47
    .line 48
    .line 49
    :cond_3
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    check-cast v1, Ldj;

    .line 54
    .line 55
    iget-object v3, v1, Ldj;->b:Lrm0;

    .line 56
    .line 57
    iget-object v1, v1, Ldj;->a:Lgn0;

    .line 58
    .line 59
    iget-object v4, v1, Llj0;->I:Lr7;

    .line 60
    .line 61
    invoke-virtual {v3, p0}, Lrm0;->r(Lin0;)V

    .line 62
    .line 63
    .line 64
    iget-boolean v3, p0, Lej;->I:Z

    .line 65
    .line 66
    const/4 v5, 0x0

    .line 67
    if-eqz v3, :cond_4

    .line 68
    .line 69
    invoke-static {v4, v5}, Ldn0;->b(Landroid/widget/PopupWindow;Landroid/transition/Transition;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v4, v2}, Landroid/widget/PopupWindow;->setAnimationStyle(I)V

    .line 73
    .line 74
    .line 75
    :cond_4
    invoke-virtual {v1}, Llj0;->dismiss()V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    const/4 v3, 0x1

    .line 83
    if-lez v1, :cond_5

    .line 84
    .line 85
    add-int/lit8 v4, v1, -0x1

    .line 86
    .line 87
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    move-result-object v4

    .line 91
    check-cast v4, Ldj;

    .line 92
    .line 93
    iget v4, v4, Ldj;->c:I

    .line 94
    .line 95
    iput v4, p0, Lej;->y:I

    .line 96
    .line 97
    goto :goto_3

    .line 98
    :cond_5
    iget-object v4, p0, Lej;->w:Landroid/view/View;

    .line 99
    .line 100
    invoke-virtual {v4}, Landroid/view/View;->getLayoutDirection()I

    .line 101
    .line 102
    .line 103
    move-result v4

    .line 104
    if-ne v4, v3, :cond_6

    .line 105
    .line 106
    move v4, v2

    .line 107
    goto :goto_2

    .line 108
    :cond_6
    move v4, v3

    .line 109
    :goto_2
    iput v4, p0, Lej;->y:I

    .line 110
    .line 111
    :goto_3
    if-nez v1, :cond_a

    .line 112
    .line 113
    invoke-virtual {p0}, Lej;->dismiss()V

    .line 114
    .line 115
    .line 116
    iget-object p2, p0, Lej;->F:Lhn0;

    .line 117
    .line 118
    if-eqz p2, :cond_7

    .line 119
    .line 120
    invoke-interface {p2, p1, v3}, Lhn0;->b(Lrm0;Z)V

    .line 121
    .line 122
    .line 123
    :cond_7
    iget-object p1, p0, Lej;->G:Landroid/view/ViewTreeObserver;

    .line 124
    .line 125
    if-eqz p1, :cond_9

    .line 126
    .line 127
    invoke-virtual {p1}, Landroid/view/ViewTreeObserver;->isAlive()Z

    .line 128
    .line 129
    .line 130
    move-result p1

    .line 131
    if-eqz p1, :cond_8

    .line 132
    .line 133
    iget-object p1, p0, Lej;->G:Landroid/view/ViewTreeObserver;

    .line 134
    .line 135
    iget-object p2, p0, Lej;->r:Lz7;

    .line 136
    .line 137
    invoke-virtual {p1, p2}, Landroid/view/ViewTreeObserver;->removeGlobalOnLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 138
    .line 139
    .line 140
    :cond_8
    iput-object v5, p0, Lej;->G:Landroid/view/ViewTreeObserver;

    .line 141
    .line 142
    :cond_9
    iget-object p1, p0, Lej;->x:Landroid/view/View;

    .line 143
    .line 144
    iget-object p2, p0, Lej;->s:Lbj;

    .line 145
    .line 146
    invoke-virtual {p1, p2}, Landroid/view/View;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 147
    .line 148
    .line 149
    iget-object p0, p0, Lej;->H:Landroid/widget/PopupWindow$OnDismissListener;

    .line 150
    .line 151
    invoke-interface {p0}, Landroid/widget/PopupWindow$OnDismissListener;->onDismiss()V

    .line 152
    .line 153
    .line 154
    return-void

    .line 155
    :cond_a
    if-eqz p2, :cond_b

    .line 156
    .line 157
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 158
    .line 159
    .line 160
    move-result-object p0

    .line 161
    check-cast p0, Ldj;

    .line 162
    .line 163
    iget-object p0, p0, Ldj;->b:Lrm0;

    .line 164
    .line 165
    invoke-virtual {p0, v2}, Lrm0;->c(Z)V

    .line 166
    .line 167
    .line 168
    :cond_b
    :goto_4
    return-void
.end method

.method public final c()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Lej;->a()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_1

    .line 8
    :cond_0
    iget-object v0, p0, Lej;->p:Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    const/4 v2, 0x0

    .line 15
    move v3, v2

    .line 16
    :goto_0
    if-ge v3, v1, :cond_1

    .line 17
    .line 18
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v4

    .line 22
    add-int/lit8 v3, v3, 0x1

    .line 23
    .line 24
    check-cast v4, Lrm0;

    .line 25
    .line 26
    invoke-virtual {p0, v4}, Lej;->u(Lrm0;)V

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lej;->w:Landroid/view/View;

    .line 34
    .line 35
    iput-object v0, p0, Lej;->x:Landroid/view/View;

    .line 36
    .line 37
    if-eqz v0, :cond_4

    .line 38
    .line 39
    iget-object v1, p0, Lej;->G:Landroid/view/ViewTreeObserver;

    .line 40
    .line 41
    if-nez v1, :cond_2

    .line 42
    .line 43
    const/4 v2, 0x1

    .line 44
    :cond_2
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iput-object v0, p0, Lej;->G:Landroid/view/ViewTreeObserver;

    .line 49
    .line 50
    if-eqz v2, :cond_3

    .line 51
    .line 52
    iget-object v1, p0, Lej;->r:Lz7;

    .line 53
    .line 54
    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 55
    .line 56
    .line 57
    :cond_3
    iget-object v0, p0, Lej;->x:Landroid/view/View;

    .line 58
    .line 59
    iget-object p0, p0, Lej;->s:Lbj;

    .line 60
    .line 61
    invoke-virtual {v0, p0}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 62
    .line 63
    .line 64
    :cond_4
    :goto_1
    return-void
.end method

.method public final dismiss()V
    .locals 3

    .line 1
    iget-object p0, p0, Lej;->q:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_1

    .line 8
    .line 9
    new-array v1, v0, [Ldj;

    .line 10
    .line 11
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, [Ldj;

    .line 16
    .line 17
    add-int/lit8 v0, v0, -0x1

    .line 18
    .line 19
    :goto_0
    if-ltz v0, :cond_1

    .line 20
    .line 21
    aget-object v1, p0, v0

    .line 22
    .line 23
    iget-object v2, v1, Ldj;->a:Lgn0;

    .line 24
    .line 25
    iget-object v2, v2, Llj0;->I:Lr7;

    .line 26
    .line 27
    invoke-virtual {v2}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-eqz v2, :cond_0

    .line 32
    .line 33
    iget-object v1, v1, Ldj;->a:Lgn0;

    .line 34
    .line 35
    invoke-virtual {v1}, Llj0;->dismiss()V

    .line 36
    .line 37
    .line 38
    :cond_0
    add-int/lit8 v0, v0, -0x1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    return-void
.end method

.method public final e(Lhn0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lej;->F:Lhn0;

    .line 2
    .line 3
    return-void
.end method

.method public final g()V
    .locals 4

    .line 1
    iget-object p0, p0, Lej;->q:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    :goto_0
    if-ge v1, v0, :cond_1

    .line 9
    .line 10
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    add-int/lit8 v1, v1, 0x1

    .line 15
    .line 16
    check-cast v2, Ldj;

    .line 17
    .line 18
    iget-object v2, v2, Ldj;->a:Lgn0;

    .line 19
    .line 20
    iget-object v2, v2, Llj0;->l:Lzy;

    .line 21
    .line 22
    invoke-virtual {v2}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    instance-of v3, v2, Landroid/widget/HeaderViewListAdapter;

    .line 27
    .line 28
    if-eqz v3, :cond_0

    .line 29
    .line 30
    check-cast v2, Landroid/widget/HeaderViewListAdapter;

    .line 31
    .line 32
    invoke-virtual {v2}, Landroid/widget/HeaderViewListAdapter;->getWrappedAdapter()Landroid/widget/ListAdapter;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    check-cast v2, Lom0;

    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_0
    check-cast v2, Lom0;

    .line 40
    .line 41
    :goto_1
    invoke-virtual {v2}, Lom0;->notifyDataSetChanged()V

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    return-void
.end method

.method public final h()Lzy;
    .locals 1

    .line 1
    iget-object p0, p0, Lej;->q:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return-object p0

    .line 11
    :cond_0
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    add-int/lit8 v0, v0, -0x1

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Ldj;

    .line 22
    .line 23
    iget-object p0, p0, Ldj;->a:Lgn0;

    .line 24
    .line 25
    iget-object p0, p0, Llj0;->l:Lzy;

    .line 26
    .line 27
    return-object p0
.end method

.method public final j(Lna1;)Z
    .locals 7

    .line 1
    iget-object v0, p0, Lej;->q:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const/4 v2, 0x0

    .line 8
    move v3, v2

    .line 9
    :cond_0
    const/4 v4, 0x1

    .line 10
    if-ge v3, v1, :cond_1

    .line 11
    .line 12
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v5

    .line 16
    add-int/lit8 v3, v3, 0x1

    .line 17
    .line 18
    check-cast v5, Ldj;

    .line 19
    .line 20
    iget-object v6, v5, Ldj;->b:Lrm0;

    .line 21
    .line 22
    if-ne p1, v6, :cond_0

    .line 23
    .line 24
    iget-object p0, v5, Ldj;->a:Lgn0;

    .line 25
    .line 26
    iget-object p0, p0, Llj0;->l:Lzy;

    .line 27
    .line 28
    invoke-virtual {p0}, Landroid/view/View;->requestFocus()Z

    .line 29
    .line 30
    .line 31
    return v4

    .line 32
    :cond_1
    invoke-virtual {p1}, Lrm0;->hasVisibleItems()Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_3

    .line 37
    .line 38
    invoke-virtual {p0, p1}, Lej;->l(Lrm0;)V

    .line 39
    .line 40
    .line 41
    iget-object p0, p0, Lej;->F:Lhn0;

    .line 42
    .line 43
    if-eqz p0, :cond_2

    .line 44
    .line 45
    invoke-interface {p0, p1}, Lhn0;->l(Lrm0;)Z

    .line 46
    .line 47
    .line 48
    :cond_2
    return v4

    .line 49
    :cond_3
    return v2
.end method

.method public final k()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public final l(Lrm0;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lej;->k:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {p1, p0, v0}, Lrm0;->b(Lin0;Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lej;->a()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lej;->u(Lrm0;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    iget-object p0, p0, Lej;->p:Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final n(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lej;->w:Landroid/view/View;

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput-object p1, p0, Lej;->w:Landroid/view/View;

    .line 6
    .line 7
    iget v0, p0, Lej;->u:I

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/view/View;->getLayoutDirection()I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    invoke-static {v0, p1}, Landroid/view/Gravity;->getAbsoluteGravity(II)I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    iput p1, p0, Lej;->v:I

    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public final o(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lej;->D:Z

    .line 2
    .line 3
    return-void
.end method

.method public final onDismiss()V
    .locals 5

    .line 1
    iget-object p0, p0, Lej;->q:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    move v2, v1

    .line 9
    :goto_0
    if-ge v2, v0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    check-cast v3, Ldj;

    .line 16
    .line 17
    iget-object v4, v3, Ldj;->a:Lgn0;

    .line 18
    .line 19
    iget-object v4, v4, Llj0;->I:Lr7;

    .line 20
    .line 21
    invoke-virtual {v4}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 22
    .line 23
    .line 24
    move-result v4

    .line 25
    if-nez v4, :cond_0

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    const/4 v3, 0x0

    .line 32
    :goto_1
    if-eqz v3, :cond_2

    .line 33
    .line 34
    iget-object p0, v3, Ldj;->b:Lrm0;

    .line 35
    .line 36
    invoke-virtual {p0, v1}, Lrm0;->c(Z)V

    .line 37
    .line 38
    .line 39
    :cond_2
    return-void
.end method

.method public final onKey(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 p3, 0x1

    .line 6
    if-ne p1, p3, :cond_0

    .line 7
    .line 8
    const/16 p1, 0x52

    .line 9
    .line 10
    if-ne p2, p1, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Lej;->dismiss()V

    .line 13
    .line 14
    .line 15
    return p3

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method public final p(I)V
    .locals 1

    .line 1
    iget v0, p0, Lej;->u:I

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput p1, p0, Lej;->u:I

    .line 6
    .line 7
    iget-object v0, p0, Lej;->w:Landroid/view/View;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/view/View;->getLayoutDirection()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    invoke-static {p1, v0}, Landroid/view/Gravity;->getAbsoluteGravity(II)I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    iput p1, p0, Lej;->v:I

    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public final q(I)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lej;->z:Z

    .line 3
    .line 4
    iput p1, p0, Lej;->B:I

    .line 5
    .line 6
    return-void
.end method

.method public final r(Landroid/widget/PopupWindow$OnDismissListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lej;->H:Landroid/widget/PopupWindow$OnDismissListener;

    .line 2
    .line 3
    return-void
.end method

.method public final s(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lej;->E:Z

    .line 2
    .line 3
    return-void
.end method

.method public final t(I)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lej;->A:Z

    .line 3
    .line 4
    iput p1, p0, Lej;->C:I

    .line 5
    .line 6
    return-void
.end method

.method public final u(Lrm0;)V
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iget-object v2, v0, Lej;->k:Landroid/content/Context;

    .line 6
    .line 7
    invoke-static {v2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 8
    .line 9
    .line 10
    move-result-object v3

    .line 11
    new-instance v4, Lom0;

    .line 12
    .line 13
    iget-boolean v5, v0, Lej;->n:Z

    .line 14
    .line 15
    const v6, 0x7f0c000b

    .line 16
    .line 17
    .line 18
    invoke-direct {v4, v1, v3, v5, v6}, Lom0;-><init>(Lrm0;Landroid/view/LayoutInflater;ZI)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Lej;->a()Z

    .line 22
    .line 23
    .line 24
    move-result v5

    .line 25
    const/4 v6, 0x1

    .line 26
    const/4 v7, 0x0

    .line 27
    if-nez v5, :cond_0

    .line 28
    .line 29
    iget-boolean v5, v0, Lej;->D:Z

    .line 30
    .line 31
    if-eqz v5, :cond_0

    .line 32
    .line 33
    iput-boolean v6, v4, Lom0;->c:Z

    .line 34
    .line 35
    goto :goto_2

    .line 36
    :cond_0
    invoke-virtual {v0}, Lej;->a()Z

    .line 37
    .line 38
    .line 39
    move-result v5

    .line 40
    if-eqz v5, :cond_3

    .line 41
    .line 42
    iget-object v5, v1, Lrm0;->f:Ljava/util/ArrayList;

    .line 43
    .line 44
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    .line 45
    .line 46
    .line 47
    move-result v5

    .line 48
    move v8, v7

    .line 49
    :goto_0
    if-ge v8, v5, :cond_2

    .line 50
    .line 51
    invoke-virtual {v1, v8}, Lrm0;->getItem(I)Landroid/view/MenuItem;

    .line 52
    .line 53
    .line 54
    move-result-object v9

    .line 55
    invoke-interface {v9}, Landroid/view/MenuItem;->isVisible()Z

    .line 56
    .line 57
    .line 58
    move-result v10

    .line 59
    if-eqz v10, :cond_1

    .line 60
    .line 61
    invoke-interface {v9}, Landroid/view/MenuItem;->getIcon()Landroid/graphics/drawable/Drawable;

    .line 62
    .line 63
    .line 64
    move-result-object v9

    .line 65
    if-eqz v9, :cond_1

    .line 66
    .line 67
    move v5, v6

    .line 68
    goto :goto_1

    .line 69
    :cond_1
    add-int/lit8 v8, v8, 0x1

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_2
    move v5, v7

    .line 73
    :goto_1
    iput-boolean v5, v4, Lom0;->c:Z

    .line 74
    .line 75
    :cond_3
    :goto_2
    iget v5, v0, Lej;->l:I

    .line 76
    .line 77
    invoke-static {v4, v2, v5}, Lan0;->m(Landroid/widget/ListAdapter;Landroid/content/Context;I)I

    .line 78
    .line 79
    .line 80
    move-result v5

    .line 81
    new-instance v8, Lgn0;

    .line 82
    .line 83
    iget v9, v0, Lej;->m:I

    .line 84
    .line 85
    const/4 v10, 0x0

    .line 86
    invoke-direct {v8, v2, v10, v9, v7}, Llj0;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 87
    .line 88
    .line 89
    iget-object v2, v0, Lej;->t:Lbv1;

    .line 90
    .line 91
    iput-object v2, v8, Lgn0;->L:Lbv1;

    .line 92
    .line 93
    iput-object v0, v8, Llj0;->y:Landroid/widget/AdapterView$OnItemClickListener;

    .line 94
    .line 95
    iget-object v2, v8, Llj0;->I:Lr7;

    .line 96
    .line 97
    invoke-virtual {v2, v0}, Landroid/widget/PopupWindow;->setOnDismissListener(Landroid/widget/PopupWindow$OnDismissListener;)V

    .line 98
    .line 99
    .line 100
    iget-object v9, v0, Lej;->w:Landroid/view/View;

    .line 101
    .line 102
    iput-object v9, v8, Llj0;->x:Landroid/view/View;

    .line 103
    .line 104
    iget v9, v0, Lej;->v:I

    .line 105
    .line 106
    iput v9, v8, Llj0;->u:I

    .line 107
    .line 108
    iput-boolean v6, v8, Llj0;->H:Z

    .line 109
    .line 110
    invoke-virtual {v2, v6}, Landroid/widget/PopupWindow;->setFocusable(Z)V

    .line 111
    .line 112
    .line 113
    const/4 v9, 0x2

    .line 114
    invoke-virtual {v2, v9}, Landroid/widget/PopupWindow;->setInputMethodMode(I)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {v8, v4}, Llj0;->p(Landroid/widget/ListAdapter;)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {v8, v5}, Llj0;->r(I)V

    .line 121
    .line 122
    .line 123
    iget v4, v0, Lej;->v:I

    .line 124
    .line 125
    iput v4, v8, Llj0;->u:I

    .line 126
    .line 127
    iget-object v4, v0, Lej;->q:Ljava/util/ArrayList;

    .line 128
    .line 129
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    .line 130
    .line 131
    .line 132
    move-result v11

    .line 133
    if-lez v11, :cond_d

    .line 134
    .line 135
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    .line 136
    .line 137
    .line 138
    move-result v11

    .line 139
    sub-int/2addr v11, v6

    .line 140
    invoke-virtual {v4, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 141
    .line 142
    .line 143
    move-result-object v11

    .line 144
    check-cast v11, Ldj;

    .line 145
    .line 146
    iget-object v12, v11, Ldj;->b:Lrm0;

    .line 147
    .line 148
    iget-object v13, v12, Lrm0;->f:Ljava/util/ArrayList;

    .line 149
    .line 150
    invoke-virtual {v13}, Ljava/util/ArrayList;->size()I

    .line 151
    .line 152
    .line 153
    move-result v13

    .line 154
    move v14, v7

    .line 155
    :goto_3
    if-ge v14, v13, :cond_5

    .line 156
    .line 157
    invoke-virtual {v12, v14}, Lrm0;->getItem(I)Landroid/view/MenuItem;

    .line 158
    .line 159
    .line 160
    move-result-object v15

    .line 161
    invoke-interface {v15}, Landroid/view/MenuItem;->hasSubMenu()Z

    .line 162
    .line 163
    .line 164
    move-result v16

    .line 165
    if-eqz v16, :cond_4

    .line 166
    .line 167
    invoke-interface {v15}, Landroid/view/MenuItem;->getSubMenu()Landroid/view/SubMenu;

    .line 168
    .line 169
    .line 170
    move-result-object v9

    .line 171
    if-ne v1, v9, :cond_4

    .line 172
    .line 173
    goto :goto_4

    .line 174
    :cond_4
    add-int/lit8 v14, v14, 0x1

    .line 175
    .line 176
    const/4 v9, 0x2

    .line 177
    goto :goto_3

    .line 178
    :cond_5
    move-object v15, v10

    .line 179
    :goto_4
    if-nez v15, :cond_6

    .line 180
    .line 181
    move/from16 v17, v7

    .line 182
    .line 183
    move-object v6, v10

    .line 184
    goto :goto_9

    .line 185
    :cond_6
    iget-object v9, v11, Ldj;->a:Lgn0;

    .line 186
    .line 187
    iget-object v9, v9, Llj0;->l:Lzy;

    .line 188
    .line 189
    invoke-virtual {v9}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    .line 190
    .line 191
    .line 192
    move-result-object v12

    .line 193
    instance-of v13, v12, Landroid/widget/HeaderViewListAdapter;

    .line 194
    .line 195
    if-eqz v13, :cond_7

    .line 196
    .line 197
    check-cast v12, Landroid/widget/HeaderViewListAdapter;

    .line 198
    .line 199
    invoke-virtual {v12}, Landroid/widget/HeaderViewListAdapter;->getHeadersCount()I

    .line 200
    .line 201
    .line 202
    move-result v13

    .line 203
    invoke-virtual {v12}, Landroid/widget/HeaderViewListAdapter;->getWrappedAdapter()Landroid/widget/ListAdapter;

    .line 204
    .line 205
    .line 206
    move-result-object v12

    .line 207
    check-cast v12, Lom0;

    .line 208
    .line 209
    goto :goto_5

    .line 210
    :cond_7
    check-cast v12, Lom0;

    .line 211
    .line 212
    move v13, v7

    .line 213
    :goto_5
    invoke-virtual {v12}, Lom0;->getCount()I

    .line 214
    .line 215
    .line 216
    move-result v14

    .line 217
    move v10, v7

    .line 218
    move/from16 v17, v10

    .line 219
    .line 220
    :goto_6
    const/4 v7, -0x1

    .line 221
    if-ge v10, v14, :cond_9

    .line 222
    .line 223
    invoke-virtual {v12, v10}, Lom0;->b(I)Lvm0;

    .line 224
    .line 225
    .line 226
    move-result-object v6

    .line 227
    if-ne v15, v6, :cond_8

    .line 228
    .line 229
    goto :goto_7

    .line 230
    :cond_8
    add-int/lit8 v10, v10, 0x1

    .line 231
    .line 232
    const/4 v6, 0x1

    .line 233
    goto :goto_6

    .line 234
    :cond_9
    move v10, v7

    .line 235
    :goto_7
    if-ne v10, v7, :cond_b

    .line 236
    .line 237
    :cond_a
    :goto_8
    const/4 v6, 0x0

    .line 238
    goto :goto_9

    .line 239
    :cond_b
    add-int/2addr v10, v13

    .line 240
    invoke-virtual {v9}, Landroid/widget/AdapterView;->getFirstVisiblePosition()I

    .line 241
    .line 242
    .line 243
    move-result v6

    .line 244
    sub-int/2addr v10, v6

    .line 245
    if-ltz v10, :cond_a

    .line 246
    .line 247
    invoke-virtual {v9}, Landroid/view/ViewGroup;->getChildCount()I

    .line 248
    .line 249
    .line 250
    move-result v6

    .line 251
    if-lt v10, v6, :cond_c

    .line 252
    .line 253
    goto :goto_8

    .line 254
    :cond_c
    invoke-virtual {v9, v10}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 255
    .line 256
    .line 257
    move-result-object v6

    .line 258
    goto :goto_9

    .line 259
    :cond_d
    move/from16 v17, v7

    .line 260
    .line 261
    const/4 v6, 0x0

    .line 262
    const/4 v11, 0x0

    .line 263
    :goto_9
    if-eqz v6, :cond_19

    .line 264
    .line 265
    sget v7, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 266
    .line 267
    const/16 v9, 0x1c

    .line 268
    .line 269
    if-gt v7, v9, :cond_f

    .line 270
    .line 271
    sget-object v7, Lgn0;->M:Ljava/lang/reflect/Method;

    .line 272
    .line 273
    if-eqz v7, :cond_e

    .line 274
    .line 275
    const/4 v9, 0x1

    .line 276
    :try_start_0
    new-array v10, v9, [Ljava/lang/Object;

    .line 277
    .line 278
    sget-object v9, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 279
    .line 280
    aput-object v9, v10, v17

    .line 281
    .line 282
    invoke-virtual {v7, v2, v10}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 283
    .line 284
    .line 285
    :catch_0
    :cond_e
    :goto_a
    const/4 v7, 0x0

    .line 286
    goto :goto_b

    .line 287
    :cond_f
    move/from16 v7, v17

    .line 288
    .line 289
    invoke-static {v2, v7}, Len0;->a(Landroid/widget/PopupWindow;Z)V

    .line 290
    .line 291
    .line 292
    goto :goto_a

    .line 293
    :goto_b
    invoke-static {v2, v7}, Ldn0;->a(Landroid/widget/PopupWindow;Landroid/transition/Transition;)V

    .line 294
    .line 295
    .line 296
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    .line 297
    .line 298
    .line 299
    move-result v2

    .line 300
    const/16 v18, 0x1

    .line 301
    .line 302
    add-int/lit8 v2, v2, -0x1

    .line 303
    .line 304
    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 305
    .line 306
    .line 307
    move-result-object v2

    .line 308
    check-cast v2, Ldj;

    .line 309
    .line 310
    iget-object v2, v2, Ldj;->a:Lgn0;

    .line 311
    .line 312
    iget-object v2, v2, Llj0;->l:Lzy;

    .line 313
    .line 314
    const/4 v7, 0x2

    .line 315
    new-array v9, v7, [I

    .line 316
    .line 317
    invoke-virtual {v2, v9}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 318
    .line 319
    .line 320
    new-instance v7, Landroid/graphics/Rect;

    .line 321
    .line 322
    invoke-direct {v7}, Landroid/graphics/Rect;-><init>()V

    .line 323
    .line 324
    .line 325
    iget-object v10, v0, Lej;->x:Landroid/view/View;

    .line 326
    .line 327
    invoke-virtual {v10, v7}, Landroid/view/View;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    .line 328
    .line 329
    .line 330
    iget v10, v0, Lej;->y:I

    .line 331
    .line 332
    const/4 v12, 0x1

    .line 333
    if-ne v10, v12, :cond_11

    .line 334
    .line 335
    const/16 v17, 0x0

    .line 336
    .line 337
    aget v9, v9, v17

    .line 338
    .line 339
    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    .line 340
    .line 341
    .line 342
    move-result v2

    .line 343
    add-int/2addr v2, v9

    .line 344
    add-int/2addr v2, v5

    .line 345
    iget v7, v7, Landroid/graphics/Rect;->right:I

    .line 346
    .line 347
    if-le v2, v7, :cond_10

    .line 348
    .line 349
    move/from16 v2, v17

    .line 350
    .line 351
    :goto_c
    const/4 v9, 0x1

    .line 352
    goto :goto_e

    .line 353
    :cond_10
    :goto_d
    const/4 v2, 0x1

    .line 354
    goto :goto_c

    .line 355
    :cond_11
    const/16 v17, 0x0

    .line 356
    .line 357
    aget v2, v9, v17

    .line 358
    .line 359
    sub-int/2addr v2, v5

    .line 360
    if-gez v2, :cond_12

    .line 361
    .line 362
    goto :goto_d

    .line 363
    :cond_12
    const/4 v2, 0x0

    .line 364
    goto :goto_c

    .line 365
    :goto_e
    if-ne v2, v9, :cond_13

    .line 366
    .line 367
    const/4 v9, 0x1

    .line 368
    goto :goto_f

    .line 369
    :cond_13
    const/4 v9, 0x0

    .line 370
    :goto_f
    iput v2, v0, Lej;->y:I

    .line 371
    .line 372
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 373
    .line 374
    const/16 v7, 0x1a

    .line 375
    .line 376
    const/4 v10, 0x5

    .line 377
    if-lt v2, v7, :cond_14

    .line 378
    .line 379
    iput-object v6, v8, Llj0;->x:Landroid/view/View;

    .line 380
    .line 381
    const/4 v2, 0x0

    .line 382
    const/4 v7, 0x0

    .line 383
    goto :goto_10

    .line 384
    :cond_14
    const/4 v7, 0x2

    .line 385
    new-array v2, v7, [I

    .line 386
    .line 387
    iget-object v12, v0, Lej;->w:Landroid/view/View;

    .line 388
    .line 389
    invoke-virtual {v12, v2}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 390
    .line 391
    .line 392
    new-array v7, v7, [I

    .line 393
    .line 394
    invoke-virtual {v6, v7}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 395
    .line 396
    .line 397
    iget v12, v0, Lej;->v:I

    .line 398
    .line 399
    and-int/lit8 v12, v12, 0x7

    .line 400
    .line 401
    const/16 v17, 0x0

    .line 402
    .line 403
    if-ne v12, v10, :cond_15

    .line 404
    .line 405
    aget v12, v2, v17

    .line 406
    .line 407
    iget-object v13, v0, Lej;->w:Landroid/view/View;

    .line 408
    .line 409
    invoke-virtual {v13}, Landroid/view/View;->getWidth()I

    .line 410
    .line 411
    .line 412
    move-result v13

    .line 413
    add-int/2addr v13, v12

    .line 414
    aput v13, v2, v17

    .line 415
    .line 416
    aget v12, v7, v17

    .line 417
    .line 418
    invoke-virtual {v6}, Landroid/view/View;->getWidth()I

    .line 419
    .line 420
    .line 421
    move-result v13

    .line 422
    add-int/2addr v13, v12

    .line 423
    aput v13, v7, v17

    .line 424
    .line 425
    :cond_15
    aget v12, v7, v17

    .line 426
    .line 427
    aget v13, v2, v17

    .line 428
    .line 429
    sub-int/2addr v12, v13

    .line 430
    const/16 v18, 0x1

    .line 431
    .line 432
    aget v7, v7, v18

    .line 433
    .line 434
    aget v2, v2, v18

    .line 435
    .line 436
    sub-int/2addr v7, v2

    .line 437
    move v2, v7

    .line 438
    move v7, v12

    .line 439
    :goto_10
    iget v12, v0, Lej;->v:I

    .line 440
    .line 441
    and-int/2addr v12, v10

    .line 442
    if-ne v12, v10, :cond_18

    .line 443
    .line 444
    if-eqz v9, :cond_16

    .line 445
    .line 446
    add-int/2addr v7, v5

    .line 447
    goto :goto_11

    .line 448
    :cond_16
    invoke-virtual {v6}, Landroid/view/View;->getWidth()I

    .line 449
    .line 450
    .line 451
    move-result v5

    .line 452
    :cond_17
    sub-int/2addr v7, v5

    .line 453
    goto :goto_11

    .line 454
    :cond_18
    if-eqz v9, :cond_17

    .line 455
    .line 456
    invoke-virtual {v6}, Landroid/view/View;->getWidth()I

    .line 457
    .line 458
    .line 459
    move-result v5

    .line 460
    add-int/2addr v7, v5

    .line 461
    :goto_11
    iput v7, v8, Llj0;->o:I

    .line 462
    .line 463
    const/4 v9, 0x1

    .line 464
    iput-boolean v9, v8, Llj0;->t:Z

    .line 465
    .line 466
    iput-boolean v9, v8, Llj0;->s:Z

    .line 467
    .line 468
    invoke-virtual {v8, v2}, Llj0;->j(I)V

    .line 469
    .line 470
    .line 471
    goto :goto_13

    .line 472
    :cond_19
    iget-boolean v2, v0, Lej;->z:Z

    .line 473
    .line 474
    if-eqz v2, :cond_1a

    .line 475
    .line 476
    iget v2, v0, Lej;->B:I

    .line 477
    .line 478
    iput v2, v8, Llj0;->o:I

    .line 479
    .line 480
    :cond_1a
    iget-boolean v2, v0, Lej;->A:Z

    .line 481
    .line 482
    if-eqz v2, :cond_1b

    .line 483
    .line 484
    iget v2, v0, Lej;->C:I

    .line 485
    .line 486
    invoke-virtual {v8, v2}, Llj0;->j(I)V

    .line 487
    .line 488
    .line 489
    :cond_1b
    iget-object v2, v0, Lan0;->j:Landroid/graphics/Rect;

    .line 490
    .line 491
    if-eqz v2, :cond_1c

    .line 492
    .line 493
    new-instance v7, Landroid/graphics/Rect;

    .line 494
    .line 495
    invoke-direct {v7, v2}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    .line 496
    .line 497
    .line 498
    goto :goto_12

    .line 499
    :cond_1c
    const/4 v7, 0x0

    .line 500
    :goto_12
    iput-object v7, v8, Llj0;->G:Landroid/graphics/Rect;

    .line 501
    .line 502
    :goto_13
    new-instance v2, Ldj;

    .line 503
    .line 504
    iget v5, v0, Lej;->y:I

    .line 505
    .line 506
    invoke-direct {v2, v8, v1, v5}, Ldj;-><init>(Lgn0;Lrm0;I)V

    .line 507
    .line 508
    .line 509
    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 510
    .line 511
    .line 512
    invoke-virtual {v8}, Llj0;->c()V

    .line 513
    .line 514
    .line 515
    iget-object v2, v8, Llj0;->l:Lzy;

    .line 516
    .line 517
    invoke-virtual {v2, v0}, Landroid/view/View;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 518
    .line 519
    .line 520
    if-nez v11, :cond_1d

    .line 521
    .line 522
    iget-boolean v0, v0, Lej;->E:Z

    .line 523
    .line 524
    if-eqz v0, :cond_1d

    .line 525
    .line 526
    iget-object v0, v1, Lrm0;->m:Ljava/lang/CharSequence;

    .line 527
    .line 528
    if-eqz v0, :cond_1d

    .line 529
    .line 530
    const v0, 0x7f0c0012

    .line 531
    .line 532
    .line 533
    const/4 v7, 0x0

    .line 534
    invoke-virtual {v3, v0, v2, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 535
    .line 536
    .line 537
    move-result-object v0

    .line 538
    check-cast v0, Landroid/widget/FrameLayout;

    .line 539
    .line 540
    const v3, 0x1020016

    .line 541
    .line 542
    .line 543
    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 544
    .line 545
    .line 546
    move-result-object v3

    .line 547
    check-cast v3, Landroid/widget/TextView;

    .line 548
    .line 549
    invoke-virtual {v0, v7}, Landroid/view/View;->setEnabled(Z)V

    .line 550
    .line 551
    .line 552
    iget-object v1, v1, Lrm0;->m:Ljava/lang/CharSequence;

    .line 553
    .line 554
    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 555
    .line 556
    .line 557
    const/4 v1, 0x0

    .line 558
    invoke-virtual {v2, v0, v1, v7}, Landroid/widget/ListView;->addHeaderView(Landroid/view/View;Ljava/lang/Object;Z)V

    .line 559
    .line 560
    .line 561
    invoke-virtual {v8}, Llj0;->c()V

    .line 562
    .line 563
    .line 564
    :cond_1d
    return-void
.end method
