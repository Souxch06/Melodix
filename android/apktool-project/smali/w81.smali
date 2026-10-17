.class public final Lw81;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public a:I

.field public b:I

.field public final c:Lh70;

.field public final d:Ljava/util/ArrayList;

.field public final e:Ljava/util/HashSet;

.field public f:Z

.field public g:Z

.field public final h:Landroidx/fragment/app/a;


# direct methods
.method public constructor <init>(IILandroidx/fragment/app/a;Lxi;)V
    .locals 2

    .line 1
    iget-object v0, p3, Landroidx/fragment/app/a;->c:Lh70;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object v1, p0, Lw81;->d:Ljava/util/ArrayList;

    .line 12
    .line 13
    new-instance v1, Ljava/util/HashSet;

    .line 14
    .line 15
    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object v1, p0, Lw81;->e:Ljava/util/HashSet;

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    iput-boolean v1, p0, Lw81;->f:Z

    .line 22
    .line 23
    iput-boolean v1, p0, Lw81;->g:Z

    .line 24
    .line 25
    iput p1, p0, Lw81;->a:I

    .line 26
    .line 27
    iput p2, p0, Lw81;->b:I

    .line 28
    .line 29
    iput-object v0, p0, Lw81;->c:Lh70;

    .line 30
    .line 31
    new-instance p1, Lny0;

    .line 32
    .line 33
    const/4 p2, 0x7

    .line 34
    invoke-direct {p1, p2, p0}, Lny0;-><init>(ILjava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p4, p1}, Lxi;->a(Lwi;)V

    .line 38
    .line 39
    .line 40
    iput-object p3, p0, Lw81;->h:Landroidx/fragment/app/a;

    .line 41
    .line 42
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 6

    .line 1
    iget-object v0, p0, Lw81;->e:Ljava/util/HashSet;

    .line 2
    .line 3
    iget-boolean v1, p0, Lw81;->f:Z

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    goto :goto_3

    .line 8
    :cond_0
    const/4 v1, 0x1

    .line 9
    iput-boolean v1, p0, Lw81;->f:Z

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/util/HashSet;->isEmpty()Z

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    if-eqz v2, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0}, Lw81;->b()V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_1
    new-instance p0, Ljava/util/ArrayList;

    .line 22
    .line 23
    invoke-direct {p0, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    const/4 v2, 0x0

    .line 31
    move v3, v2

    .line 32
    :goto_0
    if-ge v3, v0, :cond_4

    .line 33
    .line 34
    invoke-virtual {p0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v4

    .line 38
    add-int/lit8 v3, v3, 0x1

    .line 39
    .line 40
    check-cast v4, Lxi;

    .line 41
    .line 42
    monitor-enter v4

    .line 43
    :try_start_0
    iget-boolean v5, v4, Lxi;->a:Z

    .line 44
    .line 45
    if-eqz v5, :cond_2

    .line 46
    .line 47
    monitor-exit v4

    .line 48
    goto :goto_0

    .line 49
    :catchall_0
    move-exception p0

    .line 50
    goto :goto_2

    .line 51
    :cond_2
    iput-boolean v1, v4, Lxi;->a:Z

    .line 52
    .line 53
    iput-boolean v1, v4, Lxi;->c:Z

    .line 54
    .line 55
    iget-object v5, v4, Lxi;->b:Lwi;

    .line 56
    .line 57
    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 58
    if-eqz v5, :cond_3

    .line 59
    .line 60
    :try_start_1
    invoke-interface {v5}, Lwi;->onCancel()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 61
    .line 62
    .line 63
    goto :goto_1

    .line 64
    :catchall_1
    move-exception p0

    .line 65
    monitor-enter v4

    .line 66
    :try_start_2
    iput-boolean v2, v4, Lxi;->c:Z

    .line 67
    .line 68
    invoke-virtual {v4}, Ljava/lang/Object;->notifyAll()V

    .line 69
    .line 70
    .line 71
    monitor-exit v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 72
    throw p0

    .line 73
    :catchall_2
    move-exception p0

    .line 74
    :try_start_3
    monitor-exit v4
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 75
    throw p0

    .line 76
    :cond_3
    :goto_1
    monitor-enter v4

    .line 77
    :try_start_4
    iput-boolean v2, v4, Lxi;->c:Z

    .line 78
    .line 79
    invoke-virtual {v4}, Ljava/lang/Object;->notifyAll()V

    .line 80
    .line 81
    .line 82
    monitor-exit v4

    .line 83
    goto :goto_0

    .line 84
    :catchall_3
    move-exception p0

    .line 85
    monitor-exit v4
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    .line 86
    throw p0

    .line 87
    :goto_2
    :try_start_5
    monitor-exit v4
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 88
    throw p0

    .line 89
    :cond_4
    :goto_3
    return-void
.end method

.method public final b()V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lw81;->g:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    const/4 v0, 0x2

    .line 7
    invoke-static {v0}, Lz70;->F(I)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0}, Lw81;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    :cond_1
    const/4 v0, 0x1

    .line 17
    iput-boolean v0, p0, Lw81;->g:Z

    .line 18
    .line 19
    iget-object v0, p0, Lw81;->d:Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    const/4 v2, 0x0

    .line 26
    :goto_0
    if-ge v2, v1, :cond_2

    .line 27
    .line 28
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    add-int/lit8 v2, v2, 0x1

    .line 33
    .line 34
    check-cast v3, Ljava/lang/Runnable;

    .line 35
    .line 36
    invoke-interface {v3}, Ljava/lang/Runnable;->run()V

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_2
    :goto_1
    iget-object p0, p0, Lw81;->h:Landroidx/fragment/app/a;

    .line 41
    .line 42
    invoke-virtual {p0}, Landroidx/fragment/app/a;->k()V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public final c(II)V
    .locals 3

    .line 1
    invoke-static {p2}, Loq;->t(I)I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    iget-object v0, p0, Lw81;->c:Lh70;

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    const/4 v2, 0x2

    .line 9
    if-eqz p2, :cond_4

    .line 10
    .line 11
    if-eq p2, v1, :cond_2

    .line 12
    .line 13
    if-eq p2, v2, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-static {v2}, Lz70;->F(I)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eqz p1, :cond_1

    .line 21
    .line 22
    invoke-static {v0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    :cond_1
    iput v1, p0, Lw81;->a:I

    .line 26
    .line 27
    const/4 p1, 0x3

    .line 28
    iput p1, p0, Lw81;->b:I

    .line 29
    .line 30
    return-void

    .line 31
    :cond_2
    iget p1, p0, Lw81;->a:I

    .line 32
    .line 33
    if-ne p1, v1, :cond_6

    .line 34
    .line 35
    invoke-static {v2}, Lz70;->F(I)Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-eqz p1, :cond_3

    .line 40
    .line 41
    invoke-static {v0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    :cond_3
    iput v2, p0, Lw81;->a:I

    .line 45
    .line 46
    iput v2, p0, Lw81;->b:I

    .line 47
    .line 48
    return-void

    .line 49
    :cond_4
    iget p2, p0, Lw81;->a:I

    .line 50
    .line 51
    if-eq p2, v1, :cond_6

    .line 52
    .line 53
    invoke-static {v2}, Lz70;->F(I)Z

    .line 54
    .line 55
    .line 56
    move-result p2

    .line 57
    if-eqz p2, :cond_5

    .line 58
    .line 59
    invoke-static {v0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    :cond_5
    iput p1, p0, Lw81;->a:I

    .line 63
    .line 64
    :cond_6
    :goto_0
    return-void
.end method

.method public final d()V
    .locals 5

    .line 1
    iget v0, p0, Lw81;->b:I

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    iget-object v2, p0, Lw81;->h:Landroidx/fragment/app/a;

    .line 5
    .line 6
    if-ne v0, v1, :cond_4

    .line 7
    .line 8
    iget-object v0, v2, Landroidx/fragment/app/a;->c:Lh70;

    .line 9
    .line 10
    iget-object v3, v0, Lh70;->N:Landroid/view/View;

    .line 11
    .line 12
    invoke-virtual {v3}, Landroid/view/View;->findFocus()Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    if-eqz v3, :cond_0

    .line 17
    .line 18
    invoke-virtual {v0}, Lh70;->f()Lg70;

    .line 19
    .line 20
    .line 21
    move-result-object v4

    .line 22
    iput-object v3, v4, Lg70;->k:Landroid/view/View;

    .line 23
    .line 24
    invoke-static {v1}, Lz70;->F(I)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-eqz v1, :cond_0

    .line 29
    .line 30
    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0}, Lh70;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    :cond_0
    iget-object p0, p0, Lw81;->c:Lh70;

    .line 37
    .line 38
    invoke-virtual {p0}, Lh70;->I()Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    const/4 v3, 0x0

    .line 47
    if-nez v1, :cond_1

    .line 48
    .line 49
    invoke-virtual {v2}, Landroidx/fragment/app/a;->b()V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0, v3}, Landroid/view/View;->setAlpha(F)V

    .line 53
    .line 54
    .line 55
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->getAlpha()F

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    cmpl-float v1, v1, v3

    .line 60
    .line 61
    if-nez v1, :cond_2

    .line 62
    .line 63
    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    if-nez v1, :cond_2

    .line 68
    .line 69
    const/4 v1, 0x4

    .line 70
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 71
    .line 72
    .line 73
    :cond_2
    iget-object v0, v0, Lh70;->Q:Lg70;

    .line 74
    .line 75
    if-nez v0, :cond_3

    .line 76
    .line 77
    const/high16 v0, 0x3f800000    # 1.0f

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_3
    iget v0, v0, Lg70;->j:F

    .line 81
    .line 82
    :goto_0
    invoke-virtual {p0, v0}, Landroid/view/View;->setAlpha(F)V

    .line 83
    .line 84
    .line 85
    return-void

    .line 86
    :cond_4
    const/4 p0, 0x3

    .line 87
    if-ne v0, p0, :cond_6

    .line 88
    .line 89
    iget-object p0, v2, Landroidx/fragment/app/a;->c:Lh70;

    .line 90
    .line 91
    invoke-virtual {p0}, Lh70;->I()Landroid/view/View;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    invoke-static {v1}, Lz70;->F(I)Z

    .line 96
    .line 97
    .line 98
    move-result v1

    .line 99
    if-eqz v1, :cond_5

    .line 100
    .line 101
    invoke-virtual {v0}, Landroid/view/View;->findFocus()Landroid/view/View;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    invoke-static {v1}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    invoke-virtual {p0}, Lh70;->toString()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    :cond_5
    invoke-virtual {v0}, Landroid/view/View;->clearFocus()V

    .line 115
    .line 116
    .line 117
    :cond_6
    return-void
.end method

.method public final toString()Ljava/lang/String;
    .locals 7

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "Operation {"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v1, "} {mFinalState = "

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    iget v1, p0, Lw81;->a:I

    .line 25
    .line 26
    const-string v2, "null"

    .line 27
    .line 28
    const/4 v3, 0x3

    .line 29
    const/4 v4, 0x2

    .line 30
    const/4 v5, 0x1

    .line 31
    if-eq v1, v5, :cond_3

    .line 32
    .line 33
    if-eq v1, v4, :cond_2

    .line 34
    .line 35
    if-eq v1, v3, :cond_1

    .line 36
    .line 37
    const/4 v6, 0x4

    .line 38
    if-eq v1, v6, :cond_0

    .line 39
    .line 40
    move-object v1, v2

    .line 41
    goto :goto_0

    .line 42
    :cond_0
    const-string v1, "INVISIBLE"

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    const-string v1, "GONE"

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_2
    const-string v1, "VISIBLE"

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_3
    const-string v1, "REMOVED"

    .line 52
    .line 53
    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    const-string v1, "} {mLifecycleImpact = "

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    iget v1, p0, Lw81;->b:I

    .line 62
    .line 63
    if-eq v1, v5, :cond_6

    .line 64
    .line 65
    if-eq v1, v4, :cond_5

    .line 66
    .line 67
    if-eq v1, v3, :cond_4

    .line 68
    .line 69
    goto :goto_1

    .line 70
    :cond_4
    const-string v2, "REMOVING"

    .line 71
    .line 72
    goto :goto_1

    .line 73
    :cond_5
    const-string v2, "ADDING"

    .line 74
    .line 75
    goto :goto_1

    .line 76
    :cond_6
    const-string v2, "NONE"

    .line 77
    .line 78
    :goto_1
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    const-string v1, "} {mFragment = "

    .line 82
    .line 83
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    iget-object p0, p0, Lw81;->c:Lh70;

    .line 87
    .line 88
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    const-string p0, "}"

    .line 92
    .line 93
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    return-object p0
.end method
