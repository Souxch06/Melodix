.class public final Lpj;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lq90;


# instance fields
.field public final j:Lsq;

.field public final k:I

.field public final l:Lfh;

.field public final synthetic m:I

.field public final n:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/lang/Object;Lsq;ILfh;I)V
    .locals 0

    .line 1
    iput p5, p0, Lpj;->m:I

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Lpj;->j:Lsq;

    .line 7
    .line 8
    iput p3, p0, Lpj;->k:I

    .line 9
    .line 10
    iput-object p4, p0, Lpj;->l:Lfh;

    .line 11
    .line 12
    iput-object p1, p0, Lpj;->n:Ljava/lang/Object;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final a(Ls50;Lkq;)Ljava/lang/Object;
    .locals 3

    .line 1
    new-instance v0, Lnj;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x0

    .line 5
    invoke-direct {v0, p1, p0, v1, v2}, Lnj;-><init>(Ljava/lang/Object;Ljava/lang/Object;Liq;I)V

    .line 6
    .line 7
    .line 8
    new-instance p0, Lh31;

    .line 9
    .line 10
    invoke-interface {p2}, Liq;->getContext()Lsq;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-direct {p0, p2, p1}, Lh31;-><init>(Liq;Lsq;)V

    .line 15
    .line 16
    .line 17
    invoke-static {p0, p0, v0}, Lkp1;->g(Lh31;Lh31;Lf90;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    sget-object p1, Lar;->j:Lar;

    .line 22
    .line 23
    if-ne p0, p1, :cond_0

    .line 24
    .line 25
    return-object p0

    .line 26
    :cond_0
    sget-object p0, Lwe1;->a:Lwe1;

    .line 27
    .line 28
    return-object p0
.end method

.method public final b()Ljava/lang/String;
    .locals 7

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    const/4 v1, 0x4

    .line 4
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 5
    .line 6
    .line 7
    sget-object v1, Ls00;->j:Ls00;

    .line 8
    .line 9
    iget-object v2, p0, Lpj;->j:Lsq;

    .line 10
    .line 11
    if-eq v2, v1, :cond_0

    .line 12
    .line 13
    new-instance v1, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    const-string v3, "context="

    .line 16
    .line 17
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    :cond_0
    const/4 v1, -0x3

    .line 31
    iget v2, p0, Lpj;->k:I

    .line 32
    .line 33
    if-eq v2, v1, :cond_1

    .line 34
    .line 35
    new-instance v1, Ljava/lang/StringBuilder;

    .line 36
    .line 37
    const-string v3, "capacity="

    .line 38
    .line 39
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    :cond_1
    sget-object v1, Lfh;->j:Lfh;

    .line 53
    .line 54
    iget-object v2, p0, Lpj;->l:Lfh;

    .line 55
    .line 56
    if-eq v2, v1, :cond_2

    .line 57
    .line 58
    new-instance v1, Ljava/lang/StringBuilder;

    .line 59
    .line 60
    const-string v3, "onBufferOverflow="

    .line 61
    .line 62
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    :cond_2
    new-instance v6, Ljava/lang/StringBuilder;

    .line 76
    .line 77
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    invoke-direct {v6, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    const/16 p0, 0x5b

    .line 89
    .line 90
    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    const/4 v4, 0x0

    .line 94
    const/16 v5, 0x3e

    .line 95
    .line 96
    const-string v1, ", "

    .line 97
    .line 98
    const/4 v2, 0x0

    .line 99
    const/4 v3, 0x0

    .line 100
    invoke-static/range {v0 .. v5}, Lbl;->B(Ljava/lang/Iterable;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lr80;I)Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    const/16 p0, 0x5d

    .line 108
    .line 109
    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    return-object p0
.end method

.method public final d(Lsq;ILfh;)Lr50;
    .locals 7

    .line 1
    iget-object v0, p0, Lpj;->j:Lsq;

    .line 2
    .line 3
    invoke-interface {p1, v0}, Lsq;->h(Lsq;)Lsq;

    .line 4
    .line 5
    .line 6
    move-result-object v3

    .line 7
    sget-object p1, Lfh;->j:Lfh;

    .line 8
    .line 9
    iget-object v1, p0, Lpj;->l:Lfh;

    .line 10
    .line 11
    iget v2, p0, Lpj;->k:I

    .line 12
    .line 13
    if-eq p3, p1, :cond_0

    .line 14
    .line 15
    move-object v5, p3

    .line 16
    :goto_0
    move v4, p2

    .line 17
    goto :goto_3

    .line 18
    :cond_0
    const/4 p1, -0x3

    .line 19
    if-ne v2, p1, :cond_1

    .line 20
    .line 21
    goto :goto_2

    .line 22
    :cond_1
    if-ne p2, p1, :cond_2

    .line 23
    .line 24
    :goto_1
    move p2, v2

    .line 25
    goto :goto_2

    .line 26
    :cond_2
    const/4 p1, -0x2

    .line 27
    if-ne v2, p1, :cond_3

    .line 28
    .line 29
    goto :goto_2

    .line 30
    :cond_3
    if-ne p2, p1, :cond_4

    .line 31
    .line 32
    goto :goto_1

    .line 33
    :cond_4
    add-int/2addr p2, v2

    .line 34
    if-ltz p2, :cond_5

    .line 35
    .line 36
    goto :goto_2

    .line 37
    :cond_5
    const p2, 0x7fffffff

    .line 38
    .line 39
    .line 40
    :goto_2
    move-object v5, v1

    .line 41
    goto :goto_0

    .line 42
    :goto_3
    invoke-static {v3, v0}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    if-eqz p1, :cond_6

    .line 47
    .line 48
    if-ne v4, v2, :cond_6

    .line 49
    .line 50
    if-ne v5, v1, :cond_6

    .line 51
    .line 52
    return-object p0

    .line 53
    :cond_6
    iget p1, p0, Lpj;->m:I

    .line 54
    .line 55
    iget-object p0, p0, Lpj;->n:Ljava/lang/Object;

    .line 56
    .line 57
    packed-switch p1, :pswitch_data_0

    .line 58
    .line 59
    .line 60
    new-instance v1, Lpj;

    .line 61
    .line 62
    move-object v2, p0

    .line 63
    check-cast v2, Lr50;

    .line 64
    .line 65
    const/4 v6, 0x1

    .line 66
    invoke-direct/range {v1 .. v6}, Lpj;-><init>(Ljava/lang/Object;Lsq;ILfh;I)V

    .line 67
    .line 68
    .line 69
    goto :goto_4

    .line 70
    :pswitch_0
    new-instance v1, Lpj;

    .line 71
    .line 72
    move-object v2, p0

    .line 73
    check-cast v2, Lnj;

    .line 74
    .line 75
    const/4 v6, 0x0

    .line 76
    invoke-direct/range {v1 .. v6}, Lpj;-><init>(Ljava/lang/Object;Lsq;ILfh;I)V

    .line 77
    .line 78
    .line 79
    :goto_4
    return-object v1

    .line 80
    nop

    .line 81
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public q(Ls50;Lkq;)Ljava/lang/Object;
    .locals 6

    .line 1
    iget v0, p0, Lpj;->m:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1, p2}, Lpj;->a(Ls50;Lkq;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0

    .line 11
    :pswitch_0
    iget v0, p0, Lpj;->k:I

    .line 12
    .line 13
    const/4 v1, -0x3

    .line 14
    sget-object v2, Lar;->j:Lar;

    .line 15
    .line 16
    sget-object v3, Lwe1;->a:Lwe1;

    .line 17
    .line 18
    if-ne v0, v1, :cond_4

    .line 19
    .line 20
    invoke-interface {p2}, Liq;->getContext()Lsq;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 25
    .line 26
    new-instance v4, Li9;

    .line 27
    .line 28
    const/4 v5, 0x3

    .line 29
    invoke-direct {v4, v5}, Li9;-><init>(I)V

    .line 30
    .line 31
    .line 32
    iget-object v5, p0, Lpj;->j:Lsq;

    .line 33
    .line 34
    invoke-interface {v5, v1, v4}, Lsq;->g(Ljava/lang/Object;Lf90;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    check-cast v1, Ljava/lang/Boolean;

    .line 39
    .line 40
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    if-nez v1, :cond_0

    .line 45
    .line 46
    invoke-interface {v0, v5}, Lsq;->h(Lsq;)Lsq;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    goto :goto_0

    .line 51
    :cond_0
    const/4 v1, 0x0

    .line 52
    invoke-static {v0, v5, v1}, Ldl1;->f(Lsq;Lsq;Z)Lsq;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    :goto_0
    invoke-static {v1, v0}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result v4

    .line 60
    if-eqz v4, :cond_2

    .line 61
    .line 62
    iget-object p0, p0, Lpj;->n:Ljava/lang/Object;

    .line 63
    .line 64
    check-cast p0, Lr50;

    .line 65
    .line 66
    invoke-interface {p0, p1, p2}, Lr50;->q(Ls50;Lkq;)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    if-ne p0, v2, :cond_1

    .line 71
    .line 72
    goto :goto_1

    .line 73
    :cond_1
    move-object p0, v3

    .line 74
    :goto_1
    if-ne p0, v2, :cond_5

    .line 75
    .line 76
    :goto_2
    move-object v3, p0

    .line 77
    goto :goto_3

    .line 78
    :cond_2
    sget-object v4, Lok0;->l:Lok0;

    .line 79
    .line 80
    invoke-interface {v1, v4}, Lsq;->j(Lrq;)Lqq;

    .line 81
    .line 82
    .line 83
    move-result-object v5

    .line 84
    invoke-interface {v0, v4}, Lsq;->j(Lrq;)Lqq;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-static {v5, v0}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    if-eqz v0, :cond_4

    .line 93
    .line 94
    invoke-interface {p2}, Liq;->getContext()Lsq;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    instance-of v4, p1, Lz31;

    .line 99
    .line 100
    if-nez v4, :cond_3

    .line 101
    .line 102
    new-instance v4, Ld60;

    .line 103
    .line 104
    invoke-direct {v4, p1, v0}, Ld60;-><init>(Ls50;Lsq;)V

    .line 105
    .line 106
    .line 107
    move-object p1, v4

    .line 108
    :cond_3
    new-instance v0, Loj;

    .line 109
    .line 110
    const/4 v4, 0x0

    .line 111
    const/4 v5, 0x1

    .line 112
    invoke-direct {v0, p0, v4, v5}, Loj;-><init>(Ljava/lang/Object;Liq;I)V

    .line 113
    .line 114
    .line 115
    invoke-static {v1}, Lbh;->D(Lsq;)Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    invoke-static {v1, p1, p0, v0, p2}, Ldl1;->r(Lsq;Ljava/lang/Object;Ljava/lang/Object;Lf90;Liq;)Ljava/lang/Object;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    if-ne p0, v2, :cond_5

    .line 124
    .line 125
    goto :goto_2

    .line 126
    :cond_4
    invoke-virtual {p0, p1, p2}, Lpj;->a(Ls50;Lkq;)Ljava/lang/Object;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    if-ne p0, v2, :cond_5

    .line 131
    .line 132
    goto :goto_2

    .line 133
    :cond_5
    :goto_3
    return-object v3

    .line 134
    nop

    .line 135
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method public final toString()Ljava/lang/String;
    .locals 3

    .line 1
    iget v0, p0, Lpj;->m:I

    .line 2
    .line 3
    iget-object v1, p0, Lpj;->n:Ljava/lang/Object;

    .line 4
    .line 5
    packed-switch v0, :pswitch_data_0

    .line 6
    .line 7
    .line 8
    new-instance v0, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 11
    .line 12
    .line 13
    check-cast v1, Lr50;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const-string v1, " -> "

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Lpj;->b()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0

    .line 35
    :pswitch_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 36
    .line 37
    const-string v2, "block["

    .line 38
    .line 39
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    check-cast v1, Lnj;

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    const-string v1, "] -> "

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0}, Lpj;->b()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    return-object p0

    .line 64
    nop

    .line 65
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
