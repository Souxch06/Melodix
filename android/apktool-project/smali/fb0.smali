.class public final Lfb0;
.super Lpp;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public d0:F

.field public e0:I

.field public f0:I

.field public g0:Lbp;

.field public h0:I


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Lpp;-><init>()V

    .line 2
    .line 3
    .line 4
    const/high16 v0, -0x40800000    # -1.0f

    .line 5
    .line 6
    iput v0, p0, Lfb0;->d0:F

    .line 7
    .line 8
    const/4 v0, -0x1

    .line 9
    iput v0, p0, Lfb0;->e0:I

    .line 10
    .line 11
    iput v0, p0, Lfb0;->f0:I

    .line 12
    .line 13
    iget-object v0, p0, Lpp;->y:Lbp;

    .line 14
    .line 15
    iput-object v0, p0, Lfb0;->g0:Lbp;

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    iput v0, p0, Lfb0;->h0:I

    .line 19
    .line 20
    iget-object v1, p0, Lpp;->G:Ljava/util/ArrayList;

    .line 21
    .line 22
    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Lpp;->G:Ljava/util/ArrayList;

    .line 26
    .line 27
    iget-object v2, p0, Lfb0;->g0:Lbp;

    .line 28
    .line 29
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    iget-object v1, p0, Lpp;->F:[Lbp;

    .line 33
    .line 34
    array-length v1, v1

    .line 35
    :goto_0
    if-ge v0, v1, :cond_0

    .line 36
    .line 37
    iget-object v2, p0, Lpp;->F:[Lbp;

    .line 38
    .line 39
    iget-object v3, p0, Lfb0;->g0:Lbp;

    .line 40
    .line 41
    aput-object v3, v2, v0

    .line 42
    .line 43
    add-int/lit8 v0, v0, 0x1

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    return-void
.end method


# virtual methods
.method public final a(Lpi0;)V
    .locals 9

    .line 1
    iget-object v0, p0, Lpp;->I:Lqp;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto/16 :goto_2

    .line 6
    .line 7
    :cond_0
    const/4 v1, 0x2

    .line 8
    invoke-virtual {v0, v1}, Lpp;->e(I)Lbp;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    const/4 v3, 0x4

    .line 13
    invoke-virtual {v0, v3}, Lpp;->e(I)Lbp;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    iget-object v4, p0, Lpp;->I:Lqp;

    .line 18
    .line 19
    const/4 v5, 0x1

    .line 20
    const/4 v6, 0x0

    .line 21
    if-eqz v4, :cond_1

    .line 22
    .line 23
    iget-object v4, v4, Lpp;->c0:[I

    .line 24
    .line 25
    aget v4, v4, v6

    .line 26
    .line 27
    if-ne v4, v1, :cond_1

    .line 28
    .line 29
    move v4, v5

    .line 30
    goto :goto_0

    .line 31
    :cond_1
    move v4, v6

    .line 32
    :goto_0
    iget v7, p0, Lfb0;->h0:I

    .line 33
    .line 34
    const/4 v8, 0x5

    .line 35
    if-nez v7, :cond_3

    .line 36
    .line 37
    const/4 v2, 0x3

    .line 38
    invoke-virtual {v0, v2}, Lpp;->e(I)Lbp;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    invoke-virtual {v0, v8}, Lpp;->e(I)Lbp;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    iget-object v0, p0, Lpp;->I:Lqp;

    .line 47
    .line 48
    if-eqz v0, :cond_2

    .line 49
    .line 50
    iget-object v0, v0, Lpp;->c0:[I

    .line 51
    .line 52
    aget v0, v0, v5

    .line 53
    .line 54
    if-ne v0, v1, :cond_2

    .line 55
    .line 56
    goto :goto_1

    .line 57
    :cond_2
    move v5, v6

    .line 58
    :goto_1
    move v4, v5

    .line 59
    :cond_3
    iget v0, p0, Lfb0;->e0:I

    .line 60
    .line 61
    const/16 v1, 0x8

    .line 62
    .line 63
    const/4 v5, -0x1

    .line 64
    if-eq v0, v5, :cond_4

    .line 65
    .line 66
    iget-object v0, p0, Lfb0;->g0:Lbp;

    .line 67
    .line 68
    invoke-virtual {p1, v0}, Lpi0;->j(Ljava/lang/Object;)Ln81;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {p1, v2}, Lpi0;->j(Ljava/lang/Object;)Ln81;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    iget p0, p0, Lfb0;->e0:I

    .line 77
    .line 78
    invoke-virtual {p1, v0, v2, p0, v1}, Lpi0;->e(Ln81;Ln81;II)V

    .line 79
    .line 80
    .line 81
    if-eqz v4, :cond_6

    .line 82
    .line 83
    invoke-virtual {p1, v3}, Lpi0;->j(Ljava/lang/Object;)Ln81;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-virtual {p1, p0, v0, v6, v8}, Lpi0;->f(Ln81;Ln81;II)V

    .line 88
    .line 89
    .line 90
    return-void

    .line 91
    :cond_4
    iget v0, p0, Lfb0;->f0:I

    .line 92
    .line 93
    if-eq v0, v5, :cond_5

    .line 94
    .line 95
    iget-object v0, p0, Lfb0;->g0:Lbp;

    .line 96
    .line 97
    invoke-virtual {p1, v0}, Lpi0;->j(Ljava/lang/Object;)Ln81;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-virtual {p1, v3}, Lpi0;->j(Ljava/lang/Object;)Ln81;

    .line 102
    .line 103
    .line 104
    move-result-object v3

    .line 105
    iget p0, p0, Lfb0;->f0:I

    .line 106
    .line 107
    neg-int p0, p0

    .line 108
    invoke-virtual {p1, v0, v3, p0, v1}, Lpi0;->e(Ln81;Ln81;II)V

    .line 109
    .line 110
    .line 111
    if-eqz v4, :cond_6

    .line 112
    .line 113
    invoke-virtual {p1, v2}, Lpi0;->j(Ljava/lang/Object;)Ln81;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    invoke-virtual {p1, v0, p0, v6, v8}, Lpi0;->f(Ln81;Ln81;II)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {p1, v3, v0, v6, v8}, Lpi0;->f(Ln81;Ln81;II)V

    .line 121
    .line 122
    .line 123
    return-void

    .line 124
    :cond_5
    iget v0, p0, Lfb0;->d0:F

    .line 125
    .line 126
    const/high16 v1, -0x40800000    # -1.0f

    .line 127
    .line 128
    cmpl-float v0, v0, v1

    .line 129
    .line 130
    if-eqz v0, :cond_6

    .line 131
    .line 132
    iget-object v0, p0, Lfb0;->g0:Lbp;

    .line 133
    .line 134
    invoke-virtual {p1, v0}, Lpi0;->j(Ljava/lang/Object;)Ln81;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    invoke-virtual {p1, v3}, Lpi0;->j(Ljava/lang/Object;)Ln81;

    .line 139
    .line 140
    .line 141
    move-result-object v2

    .line 142
    iget p0, p0, Lfb0;->d0:F

    .line 143
    .line 144
    invoke-virtual {p1}, Lpi0;->k()Lga;

    .line 145
    .line 146
    .line 147
    move-result-object v3

    .line 148
    iget-object v4, v3, Lga;->d:Lfa;

    .line 149
    .line 150
    invoke-interface {v4, v0, v1}, Lfa;->j(Ln81;F)V

    .line 151
    .line 152
    .line 153
    iget-object v0, v3, Lga;->d:Lfa;

    .line 154
    .line 155
    invoke-interface {v0, v2, p0}, Lfa;->j(Ln81;F)V

    .line 156
    .line 157
    .line 158
    invoke-virtual {p1, v3}, Lpi0;->c(Lga;)V

    .line 159
    .line 160
    .line 161
    :cond_6
    :goto_2
    return-void
.end method

.method public final b()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public final e(I)Lbp;
    .locals 2

    .line 1
    invoke-static {p1}, Loq;->t(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    packed-switch v0, :pswitch_data_0

    .line 6
    .line 7
    .line 8
    goto :goto_0

    .line 9
    :pswitch_0
    iget v0, p0, Lfb0;->h0:I

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lfb0;->g0:Lbp;

    .line 14
    .line 15
    return-object p0

    .line 16
    :pswitch_1
    iget v0, p0, Lfb0;->h0:I

    .line 17
    .line 18
    const/4 v1, 0x1

    .line 19
    if-ne v0, v1, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Lfb0;->g0:Lbp;

    .line 22
    .line 23
    return-object p0

    .line 24
    :cond_0
    :goto_0
    new-instance p0, Ljava/lang/AssertionError;

    .line 25
    .line 26
    invoke-static {p1}, Loq;->s(I)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-direct {p0, p1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    .line 31
    .line 32
    .line 33
    throw p0

    .line 34
    :pswitch_2
    const/4 p0, 0x0

    .line 35
    return-object p0

    .line 36
    nop

    .line 37
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
    .end packed-switch
.end method

.method public final x(Lpi0;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lpp;->I:Lqp;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lfb0;->g0:Lbp;

    .line 7
    .line 8
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    invoke-static {v0}, Lpi0;->m(Ljava/lang/Object;)I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    iget v0, p0, Lfb0;->h0:I

    .line 16
    .line 17
    const/4 v1, 0x1

    .line 18
    const/4 v2, 0x0

    .line 19
    if-ne v0, v1, :cond_1

    .line 20
    .line 21
    iput p1, p0, Lpp;->N:I

    .line 22
    .line 23
    iput v2, p0, Lpp;->O:I

    .line 24
    .line 25
    iget-object p1, p0, Lpp;->I:Lqp;

    .line 26
    .line 27
    invoke-virtual {p1}, Lpp;->g()I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    invoke-virtual {p0, p1}, Lpp;->s(I)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, v2}, Lpp;->v(I)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_1
    iput v2, p0, Lpp;->N:I

    .line 39
    .line 40
    iput p1, p0, Lpp;->O:I

    .line 41
    .line 42
    iget-object p1, p0, Lpp;->I:Lqp;

    .line 43
    .line 44
    invoke-virtual {p1}, Lpp;->j()I

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    invoke-virtual {p0, p1}, Lpp;->v(I)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0, v2}, Lpp;->s(I)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public final y(I)V
    .locals 3

    .line 1
    iget v0, p0, Lfb0;->h0:I

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    goto :goto_2

    .line 6
    :cond_0
    iput p1, p0, Lfb0;->h0:I

    .line 7
    .line 8
    iget-object p1, p0, Lpp;->G:Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    .line 11
    .line 12
    .line 13
    iget v0, p0, Lfb0;->h0:I

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    if-ne v0, v1, :cond_1

    .line 17
    .line 18
    iget-object v0, p0, Lpp;->x:Lbp;

    .line 19
    .line 20
    iput-object v0, p0, Lfb0;->g0:Lbp;

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    iget-object v0, p0, Lpp;->y:Lbp;

    .line 24
    .line 25
    iput-object v0, p0, Lfb0;->g0:Lbp;

    .line 26
    .line 27
    :goto_0
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Lpp;->F:[Lbp;

    .line 31
    .line 32
    array-length v0, p1

    .line 33
    const/4 v1, 0x0

    .line 34
    :goto_1
    if-ge v1, v0, :cond_2

    .line 35
    .line 36
    iget-object v2, p0, Lfb0;->g0:Lbp;

    .line 37
    .line 38
    aput-object v2, p1, v1

    .line 39
    .line 40
    add-int/lit8 v1, v1, 0x1

    .line 41
    .line 42
    goto :goto_1

    .line 43
    :cond_2
    :goto_2
    return-void
.end method
