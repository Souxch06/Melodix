.class public Lpx;
.super Lh70;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final d0:Lmx;

.field public final e0:Lnx;

.field public f0:I

.field public g0:I

.field public h0:Z

.field public i0:Z

.field public j0:I

.field public k0:Z

.field public final l0:Lbv1;

.field public m0:Landroid/app/Dialog;

.field public n0:Z

.field public o0:Z

.field public p0:Z

.field public q0:Z


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Lh70;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Llx;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Llx;-><init>(Lpx;)V

    .line 7
    .line 8
    .line 9
    new-instance v0, Lmx;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Lmx;-><init>(Lpx;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lpx;->d0:Lmx;

    .line 15
    .line 16
    new-instance v0, Lnx;

    .line 17
    .line 18
    invoke-direct {v0, p0}, Lnx;-><init>(Lpx;)V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Lpx;->e0:Lnx;

    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    iput v0, p0, Lpx;->f0:I

    .line 25
    .line 26
    iput v0, p0, Lpx;->g0:I

    .line 27
    .line 28
    const/4 v1, 0x1

    .line 29
    iput-boolean v1, p0, Lpx;->h0:Z

    .line 30
    .line 31
    iput-boolean v1, p0, Lpx;->i0:Z

    .line 32
    .line 33
    const/4 v1, -0x1

    .line 34
    iput v1, p0, Lpx;->j0:I

    .line 35
    .line 36
    new-instance v1, Lbv1;

    .line 37
    .line 38
    const/16 v2, 0x11

    .line 39
    .line 40
    invoke-direct {v1, v2, p0}, Lbv1;-><init>(ILjava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    iput-object v1, p0, Lpx;->l0:Lbv1;

    .line 44
    .line 45
    iput-boolean v0, p0, Lpx;->q0:Z

    .line 46
    .line 47
    return-void
.end method


# virtual methods
.method public A(Landroid/os/Bundle;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lpx;->m0:Landroid/app/Dialog;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/app/Dialog;->onSaveInstanceState()Landroid/os/Bundle;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "android:dialogShowing"

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 13
    .line 14
    .line 15
    const-string v1, "android:savedDialogState"

    .line 16
    .line 17
    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget v0, p0, Lpx;->f0:I

    .line 21
    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    const-string v1, "android:style"

    .line 25
    .line 26
    invoke-virtual {p1, v1, v0}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    :cond_1
    iget v0, p0, Lpx;->g0:I

    .line 30
    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    const-string v1, "android:theme"

    .line 34
    .line 35
    invoke-virtual {p1, v1, v0}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 36
    .line 37
    .line 38
    :cond_2
    iget-boolean v0, p0, Lpx;->h0:Z

    .line 39
    .line 40
    if-nez v0, :cond_3

    .line 41
    .line 42
    const-string v1, "android:cancelable"

    .line 43
    .line 44
    invoke-virtual {p1, v1, v0}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 45
    .line 46
    .line 47
    :cond_3
    iget-boolean v0, p0, Lpx;->i0:Z

    .line 48
    .line 49
    if-nez v0, :cond_4

    .line 50
    .line 51
    const-string v1, "android:showsDialog"

    .line 52
    .line 53
    invoke-virtual {p1, v1, v0}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 54
    .line 55
    .line 56
    :cond_4
    iget p0, p0, Lpx;->j0:I

    .line 57
    .line 58
    const/4 v0, -0x1

    .line 59
    if-eq p0, v0, :cond_5

    .line 60
    .line 61
    const-string v0, "android:backStackId"

    .line 62
    .line 63
    invoke-virtual {p1, v0, p0}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 64
    .line 65
    .line 66
    :cond_5
    return-void
.end method

.method public final B()V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lh70;->L:Z

    .line 3
    .line 4
    iget-object v0, p0, Lpx;->m0:Landroid/app/Dialog;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    iput-boolean v1, p0, Lpx;->n0:Z

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lpx;->m0:Landroid/app/Dialog;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 25
    .line 26
    .line 27
    const v1, 0x7f090221

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v1, p0}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 31
    .line 32
    .line 33
    const v1, 0x7f090224

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, v1, p0}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    const v1, 0x7f090223

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0, v1, p0}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 43
    .line 44
    .line 45
    :cond_0
    return-void
.end method

.method public final C()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lh70;->L:Z

    .line 3
    .line 4
    iget-object p0, p0, Lpx;->m0:Landroid/app/Dialog;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/app/Dialog;->hide()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public final E(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lh70;->L:Z

    .line 3
    .line 4
    iget-object v0, p0, Lpx;->m0:Landroid/app/Dialog;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    const-string v0, "android:savedDialogState"

    .line 11
    .line 12
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    iget-object p0, p0, Lpx;->m0:Landroid/app/Dialog;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Landroid/app/Dialog;->onRestoreInstanceState(Landroid/os/Bundle;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public final F(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Lh70;->F(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lh70;->N:Landroid/view/View;

    .line 5
    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    iget-object p1, p0, Lpx;->m0:Landroid/app/Dialog;

    .line 9
    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    if-eqz p3, :cond_0

    .line 13
    .line 14
    const-string p1, "android:savedDialogState"

    .line 15
    .line 16
    invoke-virtual {p3, p1}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    iget-object p0, p0, Lpx;->m0:Landroid/app/Dialog;

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Landroid/app/Dialog;->onRestoreInstanceState(Landroid/os/Bundle;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public M()Landroid/app/Dialog;
    .locals 2

    .line 1
    const/4 v0, 0x3

    .line 2
    invoke-static {v0}, Lz70;->F(I)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lh70;->toString()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    :cond_0
    new-instance v0, Lhm;

    .line 12
    .line 13
    invoke-virtual {p0}, Lh70;->H()Landroid/content/Context;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    iget p0, p0, Lpx;->g0:I

    .line 18
    .line 19
    invoke-direct {v0, v1, p0}, Lhm;-><init>(Landroid/content/Context;I)V

    .line 20
    .line 21
    .line 22
    return-object v0
.end method

.method public final b()Lju1;
    .locals 2

    .line 1
    new-instance v0, Lf70;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lf70;-><init>(Lh70;)V

    .line 4
    .line 5
    .line 6
    new-instance v1, Lox;

    .line 7
    .line 8
    invoke-direct {v1, p0, v0}, Lox;-><init>(Lpx;Lf70;)V

    .line 9
    .line 10
    .line 11
    return-object v1
.end method

.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 4

    .line 1
    iget-boolean p1, p0, Lpx;->n0:Z

    .line 2
    .line 3
    if-nez p1, :cond_7

    .line 4
    .line 5
    const/4 p1, 0x3

    .line 6
    invoke-static {p1}, Lz70;->F(I)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Lh70;->toString()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-boolean v0, p0, Lpx;->o0:Z

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    goto :goto_1

    .line 20
    :cond_1
    const/4 v0, 0x1

    .line 21
    iput-boolean v0, p0, Lpx;->o0:Z

    .line 22
    .line 23
    const/4 v1, 0x0

    .line 24
    iput-boolean v1, p0, Lpx;->p0:Z

    .line 25
    .line 26
    iget-object v1, p0, Lpx;->m0:Landroid/app/Dialog;

    .line 27
    .line 28
    if-eqz v1, :cond_2

    .line 29
    .line 30
    const/4 v2, 0x0

    .line 31
    invoke-virtual {v1, v2}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 32
    .line 33
    .line 34
    iget-object v1, p0, Lpx;->m0:Landroid/app/Dialog;

    .line 35
    .line 36
    invoke-virtual {v1}, Landroid/app/Dialog;->dismiss()V

    .line 37
    .line 38
    .line 39
    :cond_2
    iput-boolean v0, p0, Lpx;->n0:Z

    .line 40
    .line 41
    iget v1, p0, Lpx;->j0:I

    .line 42
    .line 43
    if-ltz v1, :cond_4

    .line 44
    .line 45
    invoke-virtual {p0}, Lh70;->k()Lz70;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    iget v1, p0, Lpx;->j0:I

    .line 50
    .line 51
    if-ltz v1, :cond_3

    .line 52
    .line 53
    new-instance v2, Ly70;

    .line 54
    .line 55
    invoke-direct {v2, p1, v1}, Ly70;-><init>(Lz70;I)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p1, v2, v0}, Lz70;->w(Lx70;Z)V

    .line 59
    .line 60
    .line 61
    const/4 p1, -0x1

    .line 62
    iput p1, p0, Lpx;->j0:I

    .line 63
    .line 64
    return-void

    .line 65
    :cond_3
    const-string p0, "Bad id: "

    .line 66
    .line 67
    invoke-static {v1, p0}, Loq;->f(ILjava/lang/String;)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :cond_4
    invoke-virtual {p0}, Lh70;->k()Lz70;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    new-instance v2, Ltf;

    .line 80
    .line 81
    invoke-direct {v2, v1}, Ltf;-><init>(Lz70;)V

    .line 82
    .line 83
    .line 84
    iput-boolean v0, v2, Ltf;->p:Z

    .line 85
    .line 86
    iget-object v1, p0, Lh70;->A:Lz70;

    .line 87
    .line 88
    if-eqz v1, :cond_6

    .line 89
    .line 90
    iget-object v3, v2, Ltf;->q:Lz70;

    .line 91
    .line 92
    if-ne v1, v3, :cond_5

    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_5
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 96
    .line 97
    new-instance v0, Ljava/lang/StringBuilder;

    .line 98
    .line 99
    const-string v1, "Cannot remove Fragment attached to a different FragmentManager. Fragment "

    .line 100
    .line 101
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {p0}, Lh70;->toString()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    const-string p0, " is already attached to a FragmentManager."

    .line 112
    .line 113
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    invoke-direct {p1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    throw p1

    .line 124
    :cond_6
    :goto_0
    new-instance v1, Li80;

    .line 125
    .line 126
    invoke-direct {v1, p1, p0}, Li80;-><init>(ILh70;)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {v2, v1}, Ltf;->b(Li80;)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {v2, v0}, Ltf;->d(Z)I

    .line 133
    .line 134
    .line 135
    :cond_7
    :goto_1
    return-void
.end method

.method public final s()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lh70;->L:Z

    .line 3
    .line 4
    return-void
.end method

.method public final u(Le6;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lh70;->u(Le6;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lh70;->Y:Landroidx/lifecycle/b;

    .line 5
    .line 6
    iget-object v0, p0, Lpx;->l0:Lbv1;

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Landroidx/lifecycle/b;->d(Lbv1;)V

    .line 9
    .line 10
    .line 11
    iget-boolean p1, p0, Lpx;->p0:Z

    .line 12
    .line 13
    if-nez p1, :cond_0

    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    iput-boolean p1, p0, Lpx;->o0:Z

    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public v(Landroid/os/Bundle;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Lh70;->v(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/os/Handler;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    .line 7
    .line 8
    .line 9
    iget v0, p0, Lh70;->F:I

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    const/4 v2, 0x0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    move v0, v1

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    move v0, v2

    .line 18
    :goto_0
    iput-boolean v0, p0, Lpx;->i0:Z

    .line 19
    .line 20
    if-eqz p1, :cond_1

    .line 21
    .line 22
    const-string v0, "android:style"

    .line 23
    .line 24
    invoke-virtual {p1, v0, v2}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    iput v0, p0, Lpx;->f0:I

    .line 29
    .line 30
    const-string v0, "android:theme"

    .line 31
    .line 32
    invoke-virtual {p1, v0, v2}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    iput v0, p0, Lpx;->g0:I

    .line 37
    .line 38
    const-string v0, "android:cancelable"

    .line 39
    .line 40
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    iput-boolean v0, p0, Lpx;->h0:Z

    .line 45
    .line 46
    const-string v0, "android:showsDialog"

    .line 47
    .line 48
    iget-boolean v1, p0, Lpx;->i0:Z

    .line 49
    .line 50
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    iput-boolean v0, p0, Lpx;->i0:Z

    .line 55
    .line 56
    const-string v0, "android:backStackId"

    .line 57
    .line 58
    const/4 v1, -0x1

    .line 59
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    iput p1, p0, Lpx;->j0:I

    .line 64
    .line 65
    :cond_1
    return-void
.end method

.method public final x()V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lh70;->L:Z

    .line 3
    .line 4
    iget-object v1, p0, Lpx;->m0:Landroid/app/Dialog;

    .line 5
    .line 6
    if-eqz v1, :cond_1

    .line 7
    .line 8
    iput-boolean v0, p0, Lpx;->n0:Z

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    invoke-virtual {v1, v0}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 12
    .line 13
    .line 14
    iget-object v1, p0, Lpx;->m0:Landroid/app/Dialog;

    .line 15
    .line 16
    invoke-virtual {v1}, Landroid/app/Dialog;->dismiss()V

    .line 17
    .line 18
    .line 19
    iget-boolean v1, p0, Lpx;->o0:Z

    .line 20
    .line 21
    if-nez v1, :cond_0

    .line 22
    .line 23
    iget-object v1, p0, Lpx;->m0:Landroid/app/Dialog;

    .line 24
    .line 25
    invoke-virtual {p0, v1}, Lpx;->onDismiss(Landroid/content/DialogInterface;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    iput-object v0, p0, Lpx;->m0:Landroid/app/Dialog;

    .line 29
    .line 30
    const/4 v0, 0x0

    .line 31
    iput-boolean v0, p0, Lpx;->q0:Z

    .line 32
    .line 33
    :cond_1
    return-void
.end method

.method public final y()V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lh70;->L:Z

    .line 3
    .line 4
    iget-boolean v1, p0, Lpx;->p0:Z

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    iget-boolean v1, p0, Lpx;->o0:Z

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    iput-boolean v0, p0, Lpx;->o0:Z

    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Lh70;->Y:Landroidx/lifecycle/b;

    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    .line 18
    .line 19
    const-string v1, "removeObserver"

    .line 20
    .line 21
    invoke-static {v1}, Landroidx/lifecycle/b;->a(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, v0, Landroidx/lifecycle/b;->b:Lq21;

    .line 25
    .line 26
    iget-object p0, p0, Lpx;->l0:Lbv1;

    .line 27
    .line 28
    invoke-virtual {v0, p0}, Lq21;->c(Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    check-cast p0, Lwj0;

    .line 33
    .line 34
    if-nez p0, :cond_1

    .line 35
    .line 36
    return-void

    .line 37
    :cond_1
    invoke-virtual {p0}, Lwj0;->d()V

    .line 38
    .line 39
    .line 40
    const/4 v0, 0x0

    .line 41
    invoke-virtual {p0, v0}, Lwj0;->a(Z)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public final z(Landroid/os/Bundle;)Landroid/view/LayoutInflater;
    .locals 6

    .line 1
    invoke-super {p0, p1}, Lh70;->z(Landroid/os/Bundle;)Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-boolean v0, p0, Lpx;->i0:Z

    .line 6
    .line 7
    const/4 v1, 0x2

    .line 8
    if-eqz v0, :cond_8

    .line 9
    .line 10
    iget-boolean v2, p0, Lpx;->k0:Z

    .line 11
    .line 12
    if-eqz v2, :cond_0

    .line 13
    .line 14
    goto/16 :goto_5

    .line 15
    .line 16
    :cond_0
    if-nez v0, :cond_1

    .line 17
    .line 18
    goto :goto_4

    .line 19
    :cond_1
    iget-boolean v0, p0, Lpx;->q0:Z

    .line 20
    .line 21
    if-nez v0, :cond_6

    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    const/4 v2, 0x1

    .line 25
    :try_start_0
    iput-boolean v2, p0, Lpx;->k0:Z

    .line 26
    .line 27
    invoke-virtual {p0}, Lpx;->M()Landroid/app/Dialog;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    iput-object v3, p0, Lpx;->m0:Landroid/app/Dialog;

    .line 32
    .line 33
    iget-boolean v4, p0, Lpx;->i0:Z

    .line 34
    .line 35
    if-eqz v4, :cond_5

    .line 36
    .line 37
    iget v4, p0, Lpx;->f0:I

    .line 38
    .line 39
    if-eq v4, v2, :cond_3

    .line 40
    .line 41
    if-eq v4, v1, :cond_3

    .line 42
    .line 43
    const/4 v5, 0x3

    .line 44
    if-eq v4, v5, :cond_2

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_2
    invoke-virtual {v3}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    if-eqz v4, :cond_3

    .line 52
    .line 53
    const/16 v5, 0x18

    .line 54
    .line 55
    invoke-virtual {v4, v5}, Landroid/view/Window;->addFlags(I)V

    .line 56
    .line 57
    .line 58
    :cond_3
    invoke-virtual {v3, v2}, Landroid/app/Dialog;->requestWindowFeature(I)Z

    .line 59
    .line 60
    .line 61
    :goto_0
    invoke-virtual {p0}, Lh70;->i()Landroid/content/Context;

    .line 62
    .line 63
    .line 64
    move-result-object v3

    .line 65
    if-eqz v3, :cond_4

    .line 66
    .line 67
    iget-object v4, p0, Lpx;->m0:Landroid/app/Dialog;

    .line 68
    .line 69
    check-cast v3, Landroid/app/Activity;

    .line 70
    .line 71
    invoke-virtual {v4, v3}, Landroid/app/Dialog;->setOwnerActivity(Landroid/app/Activity;)V

    .line 72
    .line 73
    .line 74
    goto :goto_1

    .line 75
    :catchall_0
    move-exception p1

    .line 76
    goto :goto_3

    .line 77
    :cond_4
    :goto_1
    iget-object v3, p0, Lpx;->m0:Landroid/app/Dialog;

    .line 78
    .line 79
    iget-boolean v4, p0, Lpx;->h0:Z

    .line 80
    .line 81
    invoke-virtual {v3, v4}, Landroid/app/Dialog;->setCancelable(Z)V

    .line 82
    .line 83
    .line 84
    iget-object v3, p0, Lpx;->m0:Landroid/app/Dialog;

    .line 85
    .line 86
    iget-object v4, p0, Lpx;->d0:Lmx;

    .line 87
    .line 88
    invoke-virtual {v3, v4}, Landroid/app/Dialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 89
    .line 90
    .line 91
    iget-object v3, p0, Lpx;->m0:Landroid/app/Dialog;

    .line 92
    .line 93
    iget-object v4, p0, Lpx;->e0:Lnx;

    .line 94
    .line 95
    invoke-virtual {v3, v4}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 96
    .line 97
    .line 98
    iput-boolean v2, p0, Lpx;->q0:Z

    .line 99
    .line 100
    goto :goto_2

    .line 101
    :cond_5
    const/4 v2, 0x0

    .line 102
    iput-object v2, p0, Lpx;->m0:Landroid/app/Dialog;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 103
    .line 104
    :goto_2
    iput-boolean v0, p0, Lpx;->k0:Z

    .line 105
    .line 106
    goto :goto_4

    .line 107
    :goto_3
    iput-boolean v0, p0, Lpx;->k0:Z

    .line 108
    .line 109
    throw p1

    .line 110
    :cond_6
    :goto_4
    invoke-static {v1}, Lz70;->F(I)Z

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    if-eqz v0, :cond_7

    .line 115
    .line 116
    invoke-virtual {p0}, Lh70;->toString()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    :cond_7
    iget-object p0, p0, Lpx;->m0:Landroid/app/Dialog;

    .line 120
    .line 121
    if-eqz p0, :cond_9

    .line 122
    .line 123
    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    invoke-virtual {p1, p0}, Landroid/view/LayoutInflater;->cloneInContext(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    return-object p0

    .line 132
    :cond_8
    :goto_5
    invoke-static {v1}, Lz70;->F(I)Z

    .line 133
    .line 134
    .line 135
    move-result v0

    .line 136
    if-eqz v0, :cond_9

    .line 137
    .line 138
    invoke-virtual {p0}, Lh70;->toString()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    :cond_9
    return-object p1
.end method
