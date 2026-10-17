.class public abstract Lh70;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Landroid/content/ComponentCallbacks;
.implements Landroid/view/View$OnCreateContextMenuListener;
.implements Lci0;
.implements Lii1;
.implements Lob0;
.implements Lz21;


# static fields
.field public static final c0:Ljava/lang/Object;


# instance fields
.field public A:Lz70;

.field public B:Lj70;

.field public C:Lz70;

.field public D:Lh70;

.field public E:I

.field public F:I

.field public G:Ljava/lang/String;

.field public H:Z

.field public I:Z

.field public J:Z

.field public final K:Z

.field public L:Z

.field public M:Landroid/view/ViewGroup;

.field public N:Landroid/view/View;

.field public O:Z

.field public P:Z

.field public Q:Lg70;

.field public R:Z

.field public S:Landroid/view/LayoutInflater;

.field public T:Z

.field public U:Ljava/lang/String;

.field public V:Lwh0;

.field public W:Landroidx/lifecycle/a;

.field public X:Lj80;

.field public final Y:Landroidx/lifecycle/b;

.field public Z:Lo80;

.field public final a0:Ljava/util/ArrayList;

.field public final b0:Le70;

.field public j:I

.field public k:Landroid/os/Bundle;

.field public l:Landroid/util/SparseArray;

.field public m:Landroid/os/Bundle;

.field public n:Ljava/lang/String;

.field public o:Landroid/os/Bundle;

.field public p:Lh70;

.field public q:Ljava/lang/String;

.field public r:I

.field public s:Ljava/lang/Boolean;

.field public t:Z

.field public u:Z

.field public v:Z

.field public w:Z

.field public x:Z

.field public y:Z

.field public z:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/Object;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lh70;->c0:Ljava/lang/Object;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lh70;->j:I

    .line 6
    .line 7
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lh70;->n:Ljava/lang/String;

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    iput-object v0, p0, Lh70;->q:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v0, p0, Lh70;->s:Ljava/lang/Boolean;

    .line 21
    .line 22
    new-instance v0, Lz70;

    .line 23
    .line 24
    invoke-direct {v0}, Lz70;-><init>()V

    .line 25
    .line 26
    .line 27
    iput-object v0, p0, Lh70;->C:Lz70;

    .line 28
    .line 29
    const/4 v0, 0x1

    .line 30
    iput-boolean v0, p0, Lh70;->K:Z

    .line 31
    .line 32
    iput-boolean v0, p0, Lh70;->P:Z

    .line 33
    .line 34
    sget-object v0, Lwh0;->n:Lwh0;

    .line 35
    .line 36
    iput-object v0, p0, Lh70;->V:Lwh0;

    .line 37
    .line 38
    new-instance v0, Landroidx/lifecycle/b;

    .line 39
    .line 40
    invoke-direct {v0}, Landroidx/lifecycle/b;-><init>()V

    .line 41
    .line 42
    .line 43
    iput-object v0, p0, Lh70;->Y:Landroidx/lifecycle/b;

    .line 44
    .line 45
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 46
    .line 47
    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 48
    .line 49
    .line 50
    new-instance v0, Ljava/util/ArrayList;

    .line 51
    .line 52
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 53
    .line 54
    .line 55
    iput-object v0, p0, Lh70;->a0:Ljava/util/ArrayList;

    .line 56
    .line 57
    new-instance v0, Le70;

    .line 58
    .line 59
    invoke-direct {v0, p0}, Le70;-><init>(Lh70;)V

    .line 60
    .line 61
    .line 62
    iput-object v0, p0, Lh70;->b0:Le70;

    .line 63
    .line 64
    invoke-virtual {p0}, Lh70;->o()V

    .line 65
    .line 66
    .line 67
    return-void
.end method


# virtual methods
.method public abstract A(Landroid/os/Bundle;)V
.end method

.method public abstract B()V
.end method

.method public abstract C()V
.end method

.method public D(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    return-void
.end method

.method public E(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Lh70;->L:Z

    .line 3
    .line 4
    return-void
.end method

.method public F(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)V
    .locals 2

    .line 1
    iget-object p3, p0, Lh70;->C:Lz70;

    .line 2
    .line 3
    invoke-virtual {p3}, Lz70;->L()V

    .line 4
    .line 5
    .line 6
    const/4 p3, 0x1

    .line 7
    iput-boolean p3, p0, Lh70;->y:Z

    .line 8
    .line 9
    new-instance v0, Lj80;

    .line 10
    .line 11
    invoke-virtual {p0}, Lh70;->d()Lhi1;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-direct {v0, p0, v1}, Lj80;-><init>(Lh70;Lhi1;)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lh70;->X:Lj80;

    .line 19
    .line 20
    invoke-virtual {p0, p1, p2}, Lh70;->w(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iput-object p1, p0, Lh70;->N:Landroid/view/View;

    .line 25
    .line 26
    iget-object p2, p0, Lh70;->X:Lj80;

    .line 27
    .line 28
    const/4 v0, 0x0

    .line 29
    if-eqz p1, :cond_0

    .line 30
    .line 31
    invoke-virtual {p2}, Lj80;->f()V

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Lh70;->N:Landroid/view/View;

    .line 35
    .line 36
    iget-object p2, p0, Lh70;->X:Lj80;

    .line 37
    .line 38
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 39
    .line 40
    .line 41
    const v1, 0x7f090221

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1, v1, p2}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Lh70;->N:Landroid/view/View;

    .line 48
    .line 49
    iget-object p2, p0, Lh70;->X:Lj80;

    .line 50
    .line 51
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 52
    .line 53
    .line 54
    const v1, 0x7f090224

    .line 55
    .line 56
    .line 57
    invoke-virtual {p1, v1, p2}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 58
    .line 59
    .line 60
    iget-object p1, p0, Lh70;->N:Landroid/view/View;

    .line 61
    .line 62
    iget-object p2, p0, Lh70;->X:Lj80;

    .line 63
    .line 64
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 65
    .line 66
    .line 67
    const v1, 0x7f090223

    .line 68
    .line 69
    .line 70
    invoke-virtual {p1, v1, p2}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 71
    .line 72
    .line 73
    iget-object p1, p0, Lh70;->Y:Landroidx/lifecycle/b;

    .line 74
    .line 75
    iget-object p0, p0, Lh70;->X:Lj80;

    .line 76
    .line 77
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 78
    .line 79
    .line 80
    const-string p2, "setValue"

    .line 81
    .line 82
    invoke-static {p2}, Landroidx/lifecycle/b;->a(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    iget p2, p1, Landroidx/lifecycle/b;->g:I

    .line 86
    .line 87
    add-int/2addr p2, p3

    .line 88
    iput p2, p1, Landroidx/lifecycle/b;->g:I

    .line 89
    .line 90
    iput-object p0, p1, Landroidx/lifecycle/b;->e:Ljava/lang/Object;

    .line 91
    .line 92
    invoke-virtual {p1, v0}, Landroidx/lifecycle/b;->c(Lwj0;)V

    .line 93
    .line 94
    .line 95
    return-void

    .line 96
    :cond_0
    iget-object p1, p2, Lj80;->l:Landroidx/lifecycle/a;

    .line 97
    .line 98
    if-nez p1, :cond_1

    .line 99
    .line 100
    iput-object v0, p0, Lh70;->X:Lj80;

    .line 101
    .line 102
    return-void

    .line 103
    :cond_1
    const-string p0, "Called getViewLifecycleOwner() but onCreateView() returned null"

    .line 104
    .line 105
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    return-void
.end method

.method public final G()Le6;
    .locals 2

    .line 1
    invoke-virtual {p0}, Lh70;->g()Le6;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-object v0

    .line 8
    :cond_0
    const-string v0, "Fragment "

    .line 9
    .line 10
    const-string v1, " not attached to an activity."

    .line 11
    .line 12
    invoke-static {v0, p0, v1}, Loq;->g(Ljava/lang/String;Lh70;Ljava/lang/String;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    const/4 p0, 0x0

    .line 20
    return-object p0
.end method

.method public final H()Landroid/content/Context;
    .locals 2

    .line 1
    invoke-virtual {p0}, Lh70;->i()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-object v0

    .line 8
    :cond_0
    const-string v0, "Fragment "

    .line 9
    .line 10
    const-string v1, " not attached to a context."

    .line 11
    .line 12
    invoke-static {v0, p0, v1}, Loq;->g(Ljava/lang/String;Lh70;Ljava/lang/String;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    const/4 p0, 0x0

    .line 20
    return-object p0
.end method

.method public final I()Landroid/view/View;
    .locals 2

    .line 1
    iget-object v0, p0, Lh70;->N:Landroid/view/View;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-object v0

    .line 6
    :cond_0
    const-string v0, "Fragment "

    .line 7
    .line 8
    const-string v1, " did not return a View from onCreateView() or this was called before onCreateView()."

    .line 9
    .line 10
    invoke-static {v0, p0, v1}, Loq;->g(Ljava/lang/String;Lh70;Ljava/lang/String;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    const/4 p0, 0x0

    .line 18
    return-object p0
.end method

.method public final J(IIII)V
    .locals 1

    .line 1
    iget-object v0, p0, Lh70;->Q:Lg70;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    if-nez p2, :cond_0

    .line 8
    .line 9
    if-nez p3, :cond_0

    .line 10
    .line 11
    if-nez p4, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-virtual {p0}, Lh70;->f()Lg70;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iput p1, v0, Lg70;->b:I

    .line 19
    .line 20
    invoke-virtual {p0}, Lh70;->f()Lg70;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iput p2, p1, Lg70;->c:I

    .line 25
    .line 26
    invoke-virtual {p0}, Lh70;->f()Lg70;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    iput p3, p1, Lg70;->d:I

    .line 31
    .line 32
    invoke-virtual {p0}, Lh70;->f()Lg70;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    iput p4, p0, Lg70;->e:I

    .line 37
    .line 38
    return-void
.end method

.method public final K(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lh70;->A:Lz70;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-boolean v1, v0, Lz70;->E:Z

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    iget-boolean v0, v0, Lz70;->F:Z

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const-string p0, "Fragment already added and state has been saved"

    .line 15
    .line 16
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_1
    :goto_0
    iput-object p1, p0, Lh70;->o:Landroid/os/Bundle;

    .line 21
    .line 22
    return-void
.end method

.method public final L(Lh70;)V
    .locals 3

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    sget-object v0, Lh80;->a:Lg80;

    .line 4
    .line 5
    new-instance v0, Loa0;

    .line 6
    .line 7
    new-instance v1, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v2, "Attempting to set target fragment "

    .line 10
    .line 11
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string v2, " with request code 0 for fragment "

    .line 18
    .line 19
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-direct {v0, p0, v1}, Lti1;-><init>(Lh70;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-static {v0}, Lh80;->b(Lti1;)V

    .line 33
    .line 34
    .line 35
    invoke-static {p0}, Lh80;->a(Lh70;)Lg80;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 40
    .line 41
    .line 42
    :cond_0
    iget-object v0, p0, Lh70;->A:Lz70;

    .line 43
    .line 44
    const/4 v1, 0x0

    .line 45
    if-eqz p1, :cond_1

    .line 46
    .line 47
    iget-object v2, p1, Lh70;->A:Lz70;

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    move-object v2, v1

    .line 51
    :goto_0
    if-eqz v0, :cond_3

    .line 52
    .line 53
    if-eqz v2, :cond_3

    .line 54
    .line 55
    if-ne v0, v2, :cond_2

    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_2
    const-string p0, "Fragment "

    .line 59
    .line 60
    const-string v0, " must share the same FragmentManager to be set as a target fragment"

    .line 61
    .line 62
    invoke-static {p0, p1, v0}, Loq;->g(Ljava/lang/String;Lh70;Ljava/lang/String;)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :cond_3
    :goto_1
    move-object v0, p1

    .line 71
    :goto_2
    const/4 v2, 0x0

    .line 72
    if-eqz v0, :cond_5

    .line 73
    .line 74
    if-eq v0, p0, :cond_4

    .line 75
    .line 76
    invoke-virtual {v0, v2}, Lh70;->n(Z)Lh70;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    goto :goto_2

    .line 81
    :cond_4
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 82
    .line 83
    new-instance v1, Ljava/lang/StringBuilder;

    .line 84
    .line 85
    const-string v2, "Setting "

    .line 86
    .line 87
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    const-string p1, " as the target of "

    .line 94
    .line 95
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    const-string p0, " would create a target cycle"

    .line 102
    .line 103
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    throw v0

    .line 114
    :cond_5
    if-nez p1, :cond_6

    .line 115
    .line 116
    iput-object v1, p0, Lh70;->q:Ljava/lang/String;

    .line 117
    .line 118
    iput-object v1, p0, Lh70;->p:Lh70;

    .line 119
    .line 120
    goto :goto_3

    .line 121
    :cond_6
    iget-object v0, p0, Lh70;->A:Lz70;

    .line 122
    .line 123
    if-eqz v0, :cond_7

    .line 124
    .line 125
    iget-object v0, p1, Lh70;->A:Lz70;

    .line 126
    .line 127
    if-eqz v0, :cond_7

    .line 128
    .line 129
    iget-object p1, p1, Lh70;->n:Ljava/lang/String;

    .line 130
    .line 131
    iput-object p1, p0, Lh70;->q:Ljava/lang/String;

    .line 132
    .line 133
    iput-object v1, p0, Lh70;->p:Lh70;

    .line 134
    .line 135
    goto :goto_3

    .line 136
    :cond_7
    iput-object v1, p0, Lh70;->q:Ljava/lang/String;

    .line 137
    .line 138
    iput-object p1, p0, Lh70;->p:Lh70;

    .line 139
    .line 140
    :goto_3
    iput v2, p0, Lh70;->r:I

    .line 141
    .line 142
    return-void
.end method

.method public final a()Lk6;
    .locals 0

    .line 1
    iget-object p0, p0, Lh70;->Z:Lo80;

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

.method public b()Lju1;
    .locals 1

    .line 1
    new-instance v0, Lf70;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lf70;-><init>(Lh70;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public final c()Lwo0;
    .locals 4

    .line 1
    invoke-virtual {p0}, Lh70;->H()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    :goto_0
    instance-of v1, v0, Landroid/content/ContextWrapper;

    .line 10
    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    instance-of v1, v0, Landroid/app/Application;

    .line 14
    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    check-cast v0, Landroid/app/Application;

    .line 18
    .line 19
    goto :goto_1

    .line 20
    :cond_0
    check-cast v0, Landroid/content/ContextWrapper;

    .line 21
    .line 22
    invoke-virtual {v0}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    goto :goto_0

    .line 27
    :cond_1
    const/4 v0, 0x0

    .line 28
    :goto_1
    if-nez v0, :cond_2

    .line 29
    .line 30
    const/4 v1, 0x3

    .line 31
    invoke-static {v1}, Lz70;->F(I)Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-eqz v1, :cond_2

    .line 36
    .line 37
    invoke-virtual {p0}, Lh70;->H()Landroid/content/Context;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-static {v1}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    :cond_2
    new-instance v1, Lwo0;

    .line 49
    .line 50
    invoke-direct {v1}, Lwo0;-><init>()V

    .line 51
    .line 52
    .line 53
    iget-object v2, v1, Let;->j:Ljava/lang/Object;

    .line 54
    .line 55
    check-cast v2, Ljava/util/LinkedHashMap;

    .line 56
    .line 57
    if-eqz v0, :cond_3

    .line 58
    .line 59
    sget-object v3, Lok0;->r:Lok0;

    .line 60
    .line 61
    invoke-interface {v2, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    :cond_3
    sget-object v0, Lk42;->m:Lok0;

    .line 65
    .line 66
    invoke-interface {v2, v0, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    sget-object v0, Lk42;->n:Lt11;

    .line 70
    .line 71
    invoke-interface {v2, v0, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    iget-object p0, p0, Lh70;->o:Landroid/os/Bundle;

    .line 75
    .line 76
    if-eqz p0, :cond_4

    .line 77
    .line 78
    sget-object v0, Lk42;->o:Ltb0;

    .line 79
    .line 80
    invoke-interface {v2, v0, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    :cond_4
    return-object v1
.end method

.method public final d()Lhi1;
    .locals 3

    .line 1
    iget-object v0, p0, Lh70;->A:Lz70;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_2

    .line 5
    .line 6
    invoke-virtual {p0}, Lh70;->j()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v2, 0x1

    .line 11
    if-eq v0, v2, :cond_1

    .line 12
    .line 13
    iget-object v0, p0, Lh70;->A:Lz70;

    .line 14
    .line 15
    iget-object v0, v0, Lz70;->L:Lb80;

    .line 16
    .line 17
    iget-object v0, v0, Lb80;->e:Ljava/util/HashMap;

    .line 18
    .line 19
    iget-object v1, p0, Lh70;->n:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    check-cast v1, Lhi1;

    .line 26
    .line 27
    if-nez v1, :cond_0

    .line 28
    .line 29
    new-instance v1, Lhi1;

    .line 30
    .line 31
    invoke-direct {v1}, Lhi1;-><init>()V

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Lh70;->n:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {v0, p0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    :cond_0
    return-object v1

    .line 40
    :cond_1
    const-string p0, "Calling getViewModelStore() before a Fragment reaches onCreate() when using setMaxLifecycle(INITIALIZED) is not supported"

    .line 41
    .line 42
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    return-object v1

    .line 46
    :cond_2
    const-string p0, "Can\'t access ViewModels from detached fragment"

    .line 47
    .line 48
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    return-object v1
.end method

.method public final e()Landroidx/lifecycle/a;
    .locals 0

    .line 1
    iget-object p0, p0, Lh70;->W:Landroidx/lifecycle/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .locals 0

    .line 1
    if-eq p0, p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return p0

    .line 5
    :cond_0
    const/4 p0, 0x1

    .line 6
    return p0
.end method

.method public final f()Lg70;
    .locals 2

    .line 1
    iget-object v0, p0, Lh70;->Q:Lg70;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lg70;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    sget-object v1, Lh70;->c0:Ljava/lang/Object;

    .line 11
    .line 12
    iput-object v1, v0, Lg70;->g:Ljava/lang/Object;

    .line 13
    .line 14
    iput-object v1, v0, Lg70;->h:Ljava/lang/Object;

    .line 15
    .line 16
    iput-object v1, v0, Lg70;->i:Ljava/lang/Object;

    .line 17
    .line 18
    const/high16 v1, 0x3f800000    # 1.0f

    .line 19
    .line 20
    iput v1, v0, Lg70;->j:F

    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    iput-object v1, v0, Lg70;->k:Landroid/view/View;

    .line 24
    .line 25
    iput-object v0, p0, Lh70;->Q:Lg70;

    .line 26
    .line 27
    :cond_0
    return-object v0
.end method

.method public final g()Le6;
    .locals 0

    .line 1
    iget-object p0, p0, Lh70;->B:Lj70;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    iget-object p0, p0, Lj70;->x:Le6;

    .line 8
    .line 9
    return-object p0
.end method

.method public final h()Lz70;
    .locals 2

    .line 1
    iget-object v0, p0, Lh70;->B:Lj70;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lh70;->C:Lz70;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    const-string v0, "Fragment "

    .line 9
    .line 10
    const-string v1, " has not been attached yet."

    .line 11
    .line 12
    invoke-static {v0, p0, v1}, Loq;->g(Ljava/lang/String;Lh70;Ljava/lang/String;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    const/4 p0, 0x0

    .line 20
    return-object p0
.end method

.method public final i()Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Lh70;->B:Lj70;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    iget-object p0, p0, Lj70;->y:Le6;

    .line 8
    .line 9
    return-object p0
.end method

.method public final j()I
    .locals 2

    .line 1
    iget-object v0, p0, Lh70;->V:Lwh0;

    .line 2
    .line 3
    sget-object v1, Lwh0;->k:Lwh0;

    .line 4
    .line 5
    if-eq v0, v1, :cond_1

    .line 6
    .line 7
    iget-object v1, p0, Lh70;->D:Lh70;

    .line 8
    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    iget-object p0, p0, Lh70;->D:Lh70;

    .line 17
    .line 18
    invoke-virtual {p0}, Lh70;->j()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    invoke-static {v0, p0}, Ljava/lang/Math;->min(II)I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    return p0

    .line 27
    :cond_1
    :goto_0
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    return p0
.end method

.method public final k()Lz70;
    .locals 2

    .line 1
    iget-object v0, p0, Lh70;->A:Lz70;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-object v0

    .line 6
    :cond_0
    const-string v0, "Fragment "

    .line 7
    .line 8
    const-string v1, " not associated with a fragment manager."

    .line 9
    .line 10
    invoke-static {v0, p0, v1}, Loq;->g(Ljava/lang/String;Lh70;Ljava/lang/String;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    const/4 p0, 0x0

    .line 18
    return-object p0
.end method

.method public final l()Landroid/content/res/Resources;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lh70;->H()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final m(I)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lh70;->l()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final n(Z)Lh70;
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    sget-object p1, Lh80;->a:Lg80;

    .line 4
    .line 5
    new-instance p1, Loa0;

    .line 6
    .line 7
    new-instance v0, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v1, "Attempting to get target fragment from fragment "

    .line 10
    .line 11
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-direct {p1, p0, v0}, Lti1;-><init>(Lh70;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-static {p1}, Lh80;->b(Lti1;)V

    .line 25
    .line 26
    .line 27
    invoke-static {p0}, Lh80;->a(Lh70;)Lg80;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 32
    .line 33
    .line 34
    :cond_0
    iget-object p1, p0, Lh70;->p:Lh70;

    .line 35
    .line 36
    if-eqz p1, :cond_1

    .line 37
    .line 38
    return-object p1

    .line 39
    :cond_1
    iget-object p1, p0, Lh70;->A:Lz70;

    .line 40
    .line 41
    if-eqz p1, :cond_2

    .line 42
    .line 43
    iget-object p0, p0, Lh70;->q:Ljava/lang/String;

    .line 44
    .line 45
    if-eqz p0, :cond_2

    .line 46
    .line 47
    iget-object p1, p1, Lz70;->c:Ler0;

    .line 48
    .line 49
    invoke-virtual {p1, p0}, Ler0;->e(Ljava/lang/String;)Lh70;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    return-object p0

    .line 54
    :cond_2
    const/4 p0, 0x0

    .line 55
    return-object p0
.end method

.method public final o()V
    .locals 3

    .line 1
    new-instance v0, Landroidx/lifecycle/a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Landroidx/lifecycle/a;-><init>(Lci0;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lh70;->W:Landroidx/lifecycle/a;

    .line 7
    .line 8
    new-instance v0, Lo80;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Lo80;-><init>(Lz21;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lh70;->Z:Lo80;

    .line 14
    .line 15
    iget-object v0, p0, Lh70;->a0:Ljava/util/ArrayList;

    .line 16
    .line 17
    iget-object v1, p0, Lh70;->b0:Le70;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-nez v2, :cond_1

    .line 24
    .line 25
    iget p0, p0, Lh70;->j:I

    .line 26
    .line 27
    if-ltz p0, :cond_0

    .line 28
    .line 29
    iget-object p0, v1, Le70;->a:Lh70;

    .line 30
    .line 31
    iget-object v0, p0, Lh70;->Z:Lo80;

    .line 32
    .line 33
    invoke-virtual {v0}, Lo80;->c()V

    .line 34
    .line 35
    .line 36
    invoke-static {p0}, Lk42;->e(Lz21;)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_0
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    :cond_1
    return-void
.end method

.method public final onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Lh70;->L:Z

    .line 3
    .line 4
    return-void
.end method

.method public final onCreateContextMenu(Landroid/view/ContextMenu;Landroid/view/View;Landroid/view/ContextMenu$ContextMenuInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lh70;->G()Le6;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1, p2, p3}, Landroid/app/Activity;->onCreateContextMenu(Landroid/view/ContextMenu;Landroid/view/View;Landroid/view/ContextMenu$ContextMenuInfo;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final onLowMemory()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lh70;->L:Z

    .line 3
    .line 4
    return-void
.end method

.method public final p()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lh70;->o()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lh70;->n:Ljava/lang/String;

    .line 5
    .line 6
    iput-object v0, p0, Lh70;->U:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iput-object v0, p0, Lh70;->n:Ljava/lang/String;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput-boolean v0, p0, Lh70;->t:Z

    .line 20
    .line 21
    iput-boolean v0, p0, Lh70;->u:Z

    .line 22
    .line 23
    iput-boolean v0, p0, Lh70;->v:Z

    .line 24
    .line 25
    iput-boolean v0, p0, Lh70;->w:Z

    .line 26
    .line 27
    iput-boolean v0, p0, Lh70;->x:Z

    .line 28
    .line 29
    iput v0, p0, Lh70;->z:I

    .line 30
    .line 31
    const/4 v1, 0x0

    .line 32
    iput-object v1, p0, Lh70;->A:Lz70;

    .line 33
    .line 34
    new-instance v2, Lz70;

    .line 35
    .line 36
    invoke-direct {v2}, Lz70;-><init>()V

    .line 37
    .line 38
    .line 39
    iput-object v2, p0, Lh70;->C:Lz70;

    .line 40
    .line 41
    iput-object v1, p0, Lh70;->B:Lj70;

    .line 42
    .line 43
    iput v0, p0, Lh70;->E:I

    .line 44
    .line 45
    iput v0, p0, Lh70;->F:I

    .line 46
    .line 47
    iput-object v1, p0, Lh70;->G:Ljava/lang/String;

    .line 48
    .line 49
    iput-boolean v0, p0, Lh70;->H:Z

    .line 50
    .line 51
    iput-boolean v0, p0, Lh70;->I:Z

    .line 52
    .line 53
    return-void
.end method

.method public final q()Z
    .locals 2

    .line 1
    iget-boolean v0, p0, Lh70;->H:Z

    .line 2
    .line 3
    if-nez v0, :cond_2

    .line 4
    .line 5
    iget-object v0, p0, Lh70;->A:Lz70;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    iget-object p0, p0, Lh70;->D:Lh70;

    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 13
    .line 14
    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    move p0, v1

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    invoke-virtual {p0}, Lh70;->q()Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    :goto_0
    if-eqz p0, :cond_1

    .line 24
    .line 25
    goto :goto_1

    .line 26
    :cond_1
    return v1

    .line 27
    :cond_2
    :goto_1
    const/4 p0, 0x1

    .line 28
    return p0
.end method

.method public final r()Z
    .locals 0

    .line 1
    iget p0, p0, Lh70;->z:I

    .line 2
    .line 3
    if-lez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public s()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lh70;->L:Z

    .line 3
    .line 4
    return-void
.end method

.method public t(IILandroid/content/Intent;)V
    .locals 0

    .line 1
    const/4 p1, 0x2

    .line 2
    invoke-static {p1}, Lz70;->F(I)Z

    .line 3
    .line 4
    .line 5
    move-result p1

    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lh70;->toString()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    invoke-static {p3}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const/16 v1, 0x80

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v1, "{"

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    const-string v1, "} ("

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    iget-object v1, p0, Lh70;->n:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    iget v1, p0, Lh70;->E:I

    .line 46
    .line 47
    if-eqz v1, :cond_0

    .line 48
    .line 49
    const-string v1, " id=0x"

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    iget v1, p0, Lh70;->E:I

    .line 55
    .line 56
    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    :cond_0
    iget-object v1, p0, Lh70;->G:Ljava/lang/String;

    .line 64
    .line 65
    if-eqz v1, :cond_1

    .line 66
    .line 67
    const-string v1, " tag="

    .line 68
    .line 69
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    iget-object p0, p0, Lh70;->G:Ljava/lang/String;

    .line 73
    .line 74
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    :cond_1
    const-string p0, ")"

    .line 78
    .line 79
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    return-object p0
.end method

.method public u(Le6;)V
    .locals 1

    .line 1
    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Lh70;->L:Z

    .line 3
    .line 4
    iget-object v0, p0, Lh70;->B:Lj70;

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, v0, Lj70;->x:Le6;

    .line 11
    .line 12
    :goto_0
    if-eqz v0, :cond_1

    .line 13
    .line 14
    iput-boolean p1, p0, Lh70;->L:Z

    .line 15
    .line 16
    :cond_1
    return-void
.end method

.method public v(Landroid/os/Bundle;)V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lh70;->L:Z

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    const-string v2, "android:support:fragments"

    .line 8
    .line 9
    invoke-virtual {p1, v2}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    iget-object v2, p0, Lh70;->C:Lz70;

    .line 16
    .line 17
    invoke-virtual {v2, p1}, Lz70;->Q(Landroid/os/Parcelable;)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Lh70;->C:Lz70;

    .line 21
    .line 22
    iput-boolean v1, p1, Lz70;->E:Z

    .line 23
    .line 24
    iput-boolean v1, p1, Lz70;->F:Z

    .line 25
    .line 26
    iget-object v2, p1, Lz70;->L:Lb80;

    .line 27
    .line 28
    iput-boolean v1, v2, Lb80;->h:Z

    .line 29
    .line 30
    invoke-virtual {p1, v0}, Lz70;->t(I)V

    .line 31
    .line 32
    .line 33
    :cond_0
    iget-object p0, p0, Lh70;->C:Lz70;

    .line 34
    .line 35
    iget p1, p0, Lz70;->s:I

    .line 36
    .line 37
    if-lt p1, v0, :cond_1

    .line 38
    .line 39
    return-void

    .line 40
    :cond_1
    iput-boolean v1, p0, Lz70;->E:Z

    .line 41
    .line 42
    iput-boolean v1, p0, Lz70;->F:Z

    .line 43
    .line 44
    iget-object p1, p0, Lz70;->L:Lb80;

    .line 45
    .line 46
    iput-boolean v1, p1, Lb80;->h:Z

    .line 47
    .line 48
    invoke-virtual {p0, v0}, Lz70;->t(I)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public w(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public abstract x()V
.end method

.method public y()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lh70;->L:Z

    .line 3
    .line 4
    return-void
.end method

.method public z(Landroid/os/Bundle;)Landroid/view/LayoutInflater;
    .locals 1

    .line 1
    iget-object p1, p0, Lh70;->B:Lj70;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p1, p1, Lj70;->B:Le6;

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0, p1}, Landroid/view/LayoutInflater;->cloneInContext(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iget-object p0, p0, Lh70;->C:Lz70;

    .line 16
    .line 17
    iget-object p0, p0, Lz70;->f:Ln70;

    .line 18
    .line 19
    invoke-virtual {p1, p0}, Landroid/view/LayoutInflater;->setFactory2(Landroid/view/LayoutInflater$Factory2;)V

    .line 20
    .line 21
    .line 22
    return-object p1

    .line 23
    :cond_0
    const-string p0, "onGetLayoutInflater() cannot be executed until the Fragment is attached to the FragmentManager."

    .line 24
    .line 25
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    const/4 p0, 0x0

    .line 29
    return-object p0
.end method
