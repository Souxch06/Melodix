.class public abstract Loj1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lcx;


# instance fields
.field public a:I

.field public b:Lpp;

.field public c:Lb21;

.field public d:I

.field public final e:Lrx;

.field public f:I

.field public g:Z

.field public final h:Lfx;

.field public final i:Lfx;

.field public j:I


# direct methods
.method public constructor <init>(Lpp;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lrx;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Lrx;-><init>(Loj1;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Loj1;->e:Lrx;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput v0, p0, Loj1;->f:I

    .line 13
    .line 14
    iput-boolean v0, p0, Loj1;->g:Z

    .line 15
    .line 16
    new-instance v0, Lfx;

    .line 17
    .line 18
    invoke-direct {v0, p0}, Lfx;-><init>(Loj1;)V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Loj1;->h:Lfx;

    .line 22
    .line 23
    new-instance v0, Lfx;

    .line 24
    .line 25
    invoke-direct {v0, p0}, Lfx;-><init>(Loj1;)V

    .line 26
    .line 27
    .line 28
    iput-object v0, p0, Loj1;->i:Lfx;

    .line 29
    .line 30
    const/4 v0, 0x1

    .line 31
    iput v0, p0, Loj1;->j:I

    .line 32
    .line 33
    iput-object p1, p0, Loj1;->b:Lpp;

    .line 34
    .line 35
    return-void
.end method

.method public static b(Lfx;Lfx;I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lfx;->l:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    iput p2, p0, Lfx;->f:I

    .line 7
    .line 8
    iget-object p1, p1, Lfx;->k:Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static h(Lbp;)Lfx;
    .locals 3

    .line 1
    iget-object p0, p0, Lbp;->d:Lbp;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object v0, p0, Lbp;->b:Lpp;

    .line 7
    .line 8
    iget-object v1, v0, Lpp;->d:Lbc0;

    .line 9
    .line 10
    iget-object v0, v0, Lpp;->e:Lgh1;

    .line 11
    .line 12
    iget p0, p0, Lbp;->c:I

    .line 13
    .line 14
    invoke-static {p0}, Loq;->t(I)I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    const/4 v2, 0x1

    .line 19
    if-eq p0, v2, :cond_5

    .line 20
    .line 21
    const/4 v2, 0x2

    .line 22
    if-eq p0, v2, :cond_4

    .line 23
    .line 24
    const/4 v2, 0x3

    .line 25
    if-eq p0, v2, :cond_3

    .line 26
    .line 27
    const/4 v1, 0x4

    .line 28
    if-eq p0, v1, :cond_2

    .line 29
    .line 30
    const/4 v1, 0x5

    .line 31
    if-eq p0, v1, :cond_1

    .line 32
    .line 33
    :goto_0
    const/4 p0, 0x0

    .line 34
    return-object p0

    .line 35
    :cond_1
    iget-object p0, v0, Lgh1;->k:Lfx;

    .line 36
    .line 37
    return-object p0

    .line 38
    :cond_2
    iget-object p0, v0, Loj1;->i:Lfx;

    .line 39
    .line 40
    return-object p0

    .line 41
    :cond_3
    iget-object p0, v1, Loj1;->i:Lfx;

    .line 42
    .line 43
    return-object p0

    .line 44
    :cond_4
    iget-object p0, v0, Loj1;->h:Lfx;

    .line 45
    .line 46
    return-object p0

    .line 47
    :cond_5
    iget-object p0, v1, Loj1;->h:Lfx;

    .line 48
    .line 49
    return-object p0
.end method

.method public static i(Lbp;I)Lfx;
    .locals 1

    .line 1
    iget-object p0, p0, Lbp;->d:Lbp;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    iget-object v0, p0, Lbp;->b:Lpp;

    .line 7
    .line 8
    if-nez p1, :cond_1

    .line 9
    .line 10
    iget-object p1, v0, Lpp;->d:Lbc0;

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_1
    iget-object p1, v0, Lpp;->e:Lgh1;

    .line 14
    .line 15
    :goto_0
    iget p0, p0, Lbp;->c:I

    .line 16
    .line 17
    invoke-static {p0}, Loq;->t(I)I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    const/4 v0, 0x1

    .line 22
    if-eq p0, v0, :cond_3

    .line 23
    .line 24
    const/4 v0, 0x2

    .line 25
    if-eq p0, v0, :cond_3

    .line 26
    .line 27
    const/4 v0, 0x3

    .line 28
    if-eq p0, v0, :cond_2

    .line 29
    .line 30
    const/4 v0, 0x4

    .line 31
    if-eq p0, v0, :cond_2

    .line 32
    .line 33
    :goto_1
    const/4 p0, 0x0

    .line 34
    return-object p0

    .line 35
    :cond_2
    iget-object p0, p1, Loj1;->i:Lfx;

    .line 36
    .line 37
    return-object p0

    .line 38
    :cond_3
    iget-object p0, p1, Loj1;->h:Lfx;

    .line 39
    .line 40
    return-object p0
.end method


# virtual methods
.method public final c(Lfx;Lfx;ILrx;)V
    .locals 1

    .line 1
    iget-object v0, p1, Lfx;->l:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    iget-object v0, p1, Lfx;->l:Ljava/util/ArrayList;

    .line 7
    .line 8
    iget-object p0, p0, Loj1;->e:Lrx;

    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    iput p3, p1, Lfx;->h:I

    .line 14
    .line 15
    iput-object p4, p1, Lfx;->i:Lrx;

    .line 16
    .line 17
    iget-object p0, p2, Lfx;->k:Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    iget-object p0, p4, Lfx;->k:Ljava/util/ArrayList;

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public abstract d()V
.end method

.method public abstract e()V
.end method

.method public abstract f()V
.end method

.method public final g(II)I
    .locals 0

    .line 1
    iget-object p0, p0, Loj1;->b:Lpp;

    .line 2
    .line 3
    if-nez p2, :cond_1

    .line 4
    .line 5
    iget p2, p0, Lpp;->n:I

    .line 6
    .line 7
    iget p0, p0, Lpp;->m:I

    .line 8
    .line 9
    invoke-static {p0, p1}, Ljava/lang/Math;->max(II)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-lez p2, :cond_0

    .line 14
    .line 15
    invoke-static {p2, p1}, Ljava/lang/Math;->min(II)I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    :cond_0
    if-eq p0, p1, :cond_3

    .line 20
    .line 21
    return p0

    .line 22
    :cond_1
    iget p2, p0, Lpp;->q:I

    .line 23
    .line 24
    iget p0, p0, Lpp;->p:I

    .line 25
    .line 26
    invoke-static {p0, p1}, Ljava/lang/Math;->max(II)I

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    if-lez p2, :cond_2

    .line 31
    .line 32
    invoke-static {p2, p1}, Ljava/lang/Math;->min(II)I

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    :cond_2
    if-eq p0, p1, :cond_3

    .line 37
    .line 38
    return p0

    .line 39
    :cond_3
    return p1
.end method

.method public j()J
    .locals 2

    .line 1
    iget-object p0, p0, Loj1;->e:Lrx;

    .line 2
    .line 3
    iget-boolean v0, p0, Lfx;->j:Z

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget p0, p0, Lfx;->g:I

    .line 8
    .line 9
    int-to-long v0, p0

    .line 10
    return-wide v0

    .line 11
    :cond_0
    const-wide/16 v0, 0x0

    .line 12
    .line 13
    return-wide v0
.end method

.method public abstract k()Z
.end method

.method public final l(Lbp;Lbp;I)V
    .locals 11

    .line 1
    invoke-static {p1}, Loj1;->h(Lbp;)Lfx;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p2}, Loj1;->h(Lbp;)Lfx;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-boolean v2, v0, Lfx;->j:Z

    .line 10
    .line 11
    if-eqz v2, :cond_f

    .line 12
    .line 13
    iget-boolean v2, v1, Lfx;->j:Z

    .line 14
    .line 15
    if-nez v2, :cond_0

    .line 16
    .line 17
    goto/16 :goto_5

    .line 18
    .line 19
    :cond_0
    iget v2, v0, Lfx;->g:I

    .line 20
    .line 21
    invoke-virtual {p1}, Lbp;->b()I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    add-int/2addr p1, v2

    .line 26
    iget v2, v1, Lfx;->g:I

    .line 27
    .line 28
    invoke-virtual {p2}, Lbp;->b()I

    .line 29
    .line 30
    .line 31
    move-result p2

    .line 32
    sub-int/2addr v2, p2

    .line 33
    sub-int p2, v2, p1

    .line 34
    .line 35
    iget-object v3, p0, Loj1;->e:Lrx;

    .line 36
    .line 37
    iget-boolean v4, v3, Lfx;->j:Z

    .line 38
    .line 39
    const/high16 v5, 0x3f000000    # 0.5f

    .line 40
    .line 41
    if-nez v4, :cond_a

    .line 42
    .line 43
    iget v4, p0, Loj1;->d:I

    .line 44
    .line 45
    const/4 v6, 0x3

    .line 46
    if-ne v4, v6, :cond_a

    .line 47
    .line 48
    iget v4, p0, Loj1;->a:I

    .line 49
    .line 50
    if-eqz v4, :cond_9

    .line 51
    .line 52
    const/4 v7, 0x1

    .line 53
    if-eq v4, v7, :cond_8

    .line 54
    .line 55
    const/4 v8, 0x2

    .line 56
    if-eq v4, v8, :cond_5

    .line 57
    .line 58
    if-eq v4, v6, :cond_1

    .line 59
    .line 60
    goto/16 :goto_3

    .line 61
    .line 62
    :cond_1
    iget-object v4, p0, Loj1;->b:Lpp;

    .line 63
    .line 64
    iget-object v8, v4, Lpp;->d:Lbc0;

    .line 65
    .line 66
    iget-object v9, v4, Lpp;->e:Lgh1;

    .line 67
    .line 68
    iget v10, v8, Loj1;->d:I

    .line 69
    .line 70
    if-ne v10, v6, :cond_2

    .line 71
    .line 72
    iget v10, v8, Loj1;->a:I

    .line 73
    .line 74
    if-ne v10, v6, :cond_2

    .line 75
    .line 76
    iget v10, v9, Loj1;->d:I

    .line 77
    .line 78
    if-ne v10, v6, :cond_2

    .line 79
    .line 80
    iget v10, v9, Loj1;->a:I

    .line 81
    .line 82
    if-ne v10, v6, :cond_2

    .line 83
    .line 84
    goto :goto_3

    .line 85
    :cond_2
    if-nez p3, :cond_3

    .line 86
    .line 87
    move-object v8, v9

    .line 88
    :cond_3
    iget-object v6, v8, Loj1;->e:Lrx;

    .line 89
    .line 90
    iget-boolean v8, v6, Lfx;->j:Z

    .line 91
    .line 92
    if-eqz v8, :cond_a

    .line 93
    .line 94
    iget v4, v4, Lpp;->L:F

    .line 95
    .line 96
    iget v6, v6, Lfx;->g:I

    .line 97
    .line 98
    if-ne p3, v7, :cond_4

    .line 99
    .line 100
    int-to-float v6, v6

    .line 101
    div-float/2addr v6, v4

    .line 102
    add-float/2addr v6, v5

    .line 103
    float-to-int v4, v6

    .line 104
    goto :goto_0

    .line 105
    :cond_4
    int-to-float v6, v6

    .line 106
    mul-float/2addr v4, v6

    .line 107
    add-float/2addr v4, v5

    .line 108
    float-to-int v4, v4

    .line 109
    :goto_0
    invoke-virtual {v3, v4}, Lrx;->d(I)V

    .line 110
    .line 111
    .line 112
    goto :goto_3

    .line 113
    :cond_5
    iget-object v4, p0, Loj1;->b:Lpp;

    .line 114
    .line 115
    iget-object v6, v4, Lpp;->I:Lqp;

    .line 116
    .line 117
    if-eqz v6, :cond_a

    .line 118
    .line 119
    if-nez p3, :cond_6

    .line 120
    .line 121
    iget-object v6, v6, Lpp;->d:Lbc0;

    .line 122
    .line 123
    goto :goto_1

    .line 124
    :cond_6
    iget-object v6, v6, Lpp;->e:Lgh1;

    .line 125
    .line 126
    :goto_1
    iget-object v6, v6, Loj1;->e:Lrx;

    .line 127
    .line 128
    iget-boolean v7, v6, Lfx;->j:Z

    .line 129
    .line 130
    if-eqz v7, :cond_a

    .line 131
    .line 132
    if-nez p3, :cond_7

    .line 133
    .line 134
    iget v4, v4, Lpp;->o:F

    .line 135
    .line 136
    goto :goto_2

    .line 137
    :cond_7
    iget v4, v4, Lpp;->r:F

    .line 138
    .line 139
    :goto_2
    iget v6, v6, Lfx;->g:I

    .line 140
    .line 141
    int-to-float v6, v6

    .line 142
    mul-float/2addr v6, v4

    .line 143
    add-float/2addr v6, v5

    .line 144
    float-to-int v4, v6

    .line 145
    invoke-virtual {p0, v4, p3}, Loj1;->g(II)I

    .line 146
    .line 147
    .line 148
    move-result v4

    .line 149
    invoke-virtual {v3, v4}, Lrx;->d(I)V

    .line 150
    .line 151
    .line 152
    goto :goto_3

    .line 153
    :cond_8
    iget v4, v3, Lrx;->m:I

    .line 154
    .line 155
    invoke-virtual {p0, v4, p3}, Loj1;->g(II)I

    .line 156
    .line 157
    .line 158
    move-result v4

    .line 159
    invoke-static {v4, p2}, Ljava/lang/Math;->min(II)I

    .line 160
    .line 161
    .line 162
    move-result v4

    .line 163
    invoke-virtual {v3, v4}, Lrx;->d(I)V

    .line 164
    .line 165
    .line 166
    goto :goto_3

    .line 167
    :cond_9
    invoke-virtual {p0, p2, p3}, Loj1;->g(II)I

    .line 168
    .line 169
    .line 170
    move-result v4

    .line 171
    invoke-virtual {v3, v4}, Lrx;->d(I)V

    .line 172
    .line 173
    .line 174
    :cond_a
    :goto_3
    iget-boolean v4, v3, Lfx;->j:Z

    .line 175
    .line 176
    if-nez v4, :cond_b

    .line 177
    .line 178
    goto :goto_5

    .line 179
    :cond_b
    iget v4, v3, Lfx;->g:I

    .line 180
    .line 181
    iget-object v6, p0, Loj1;->i:Lfx;

    .line 182
    .line 183
    iget-object v7, p0, Loj1;->h:Lfx;

    .line 184
    .line 185
    if-ne v4, p2, :cond_c

    .line 186
    .line 187
    invoke-virtual {v7, p1}, Lfx;->d(I)V

    .line 188
    .line 189
    .line 190
    invoke-virtual {v6, v2}, Lfx;->d(I)V

    .line 191
    .line 192
    .line 193
    return-void

    .line 194
    :cond_c
    iget-object p0, p0, Loj1;->b:Lpp;

    .line 195
    .line 196
    if-nez p3, :cond_d

    .line 197
    .line 198
    iget p0, p0, Lpp;->S:F

    .line 199
    .line 200
    goto :goto_4

    .line 201
    :cond_d
    iget p0, p0, Lpp;->T:F

    .line 202
    .line 203
    :goto_4
    if-ne v0, v1, :cond_e

    .line 204
    .line 205
    iget p1, v0, Lfx;->g:I

    .line 206
    .line 207
    iget v2, v1, Lfx;->g:I

    .line 208
    .line 209
    move p0, v5

    .line 210
    :cond_e
    sub-int/2addr v2, p1

    .line 211
    sub-int/2addr v2, v4

    .line 212
    int-to-float p1, p1

    .line 213
    add-float/2addr p1, v5

    .line 214
    int-to-float p2, v2

    .line 215
    mul-float/2addr p2, p0

    .line 216
    add-float/2addr p2, p1

    .line 217
    float-to-int p0, p2

    .line 218
    invoke-virtual {v7, p0}, Lfx;->d(I)V

    .line 219
    .line 220
    .line 221
    iget p0, v7, Lfx;->g:I

    .line 222
    .line 223
    iget p1, v3, Lfx;->g:I

    .line 224
    .line 225
    add-int/2addr p0, p1

    .line 226
    invoke-virtual {v6, p0}, Lfx;->d(I)V

    .line 227
    .line 228
    .line 229
    :cond_f
    :goto_5
    return-void
.end method
