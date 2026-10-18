.class public final Ljp;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public a:I

.field public final b:Lmp;

.field public final c:Llp;

.field public final d:Lkp;

.field public final e:Lnp;

.field public f:Ljava/util/HashMap;


# direct methods
.method public constructor <init>()V
    .locals 7

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lmp;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    iput v1, v0, Lmp;->a:I

    .line 11
    .line 12
    iput v1, v0, Lmp;->b:I

    .line 13
    .line 14
    const/high16 v2, 0x3f800000    # 1.0f

    .line 15
    .line 16
    iput v2, v0, Lmp;->c:F

    .line 17
    .line 18
    const/high16 v3, 0x7fc00000    # Float.NaN

    .line 19
    .line 20
    iput v3, v0, Lmp;->d:F

    .line 21
    .line 22
    iput-object v0, p0, Ljp;->b:Lmp;

    .line 23
    .line 24
    new-instance v0, Llp;

    .line 25
    .line 26
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 27
    .line 28
    .line 29
    const/4 v4, -0x1

    .line 30
    iput v4, v0, Llp;->a:I

    .line 31
    .line 32
    iput v4, v0, Llp;->b:I

    .line 33
    .line 34
    iput v3, v0, Llp;->c:F

    .line 35
    .line 36
    iput v3, v0, Llp;->d:F

    .line 37
    .line 38
    iput-object v0, p0, Ljp;->c:Llp;

    .line 39
    .line 40
    new-instance v0, Lkp;

    .line 41
    .line 42
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 43
    .line 44
    .line 45
    iput-boolean v1, v0, Lkp;->a:Z

    .line 46
    .line 47
    iput v4, v0, Lkp;->d:I

    .line 48
    .line 49
    iput v4, v0, Lkp;->e:I

    .line 50
    .line 51
    const/high16 v5, -0x40800000    # -1.0f

    .line 52
    .line 53
    iput v5, v0, Lkp;->f:F

    .line 54
    .line 55
    iput v4, v0, Lkp;->g:I

    .line 56
    .line 57
    iput v4, v0, Lkp;->h:I

    .line 58
    .line 59
    iput v4, v0, Lkp;->i:I

    .line 60
    .line 61
    iput v4, v0, Lkp;->j:I

    .line 62
    .line 63
    iput v4, v0, Lkp;->k:I

    .line 64
    .line 65
    iput v4, v0, Lkp;->l:I

    .line 66
    .line 67
    iput v4, v0, Lkp;->m:I

    .line 68
    .line 69
    iput v4, v0, Lkp;->n:I

    .line 70
    .line 71
    iput v4, v0, Lkp;->o:I

    .line 72
    .line 73
    iput v4, v0, Lkp;->p:I

    .line 74
    .line 75
    iput v4, v0, Lkp;->q:I

    .line 76
    .line 77
    iput v4, v0, Lkp;->r:I

    .line 78
    .line 79
    iput v4, v0, Lkp;->s:I

    .line 80
    .line 81
    const/high16 v6, 0x3f000000    # 0.5f

    .line 82
    .line 83
    iput v6, v0, Lkp;->t:F

    .line 84
    .line 85
    iput v6, v0, Lkp;->u:F

    .line 86
    .line 87
    const/4 v6, 0x0

    .line 88
    iput-object v6, v0, Lkp;->v:Ljava/lang/String;

    .line 89
    .line 90
    iput v4, v0, Lkp;->w:I

    .line 91
    .line 92
    iput v1, v0, Lkp;->x:I

    .line 93
    .line 94
    const/4 v6, 0x0

    .line 95
    iput v6, v0, Lkp;->y:F

    .line 96
    .line 97
    iput v4, v0, Lkp;->z:I

    .line 98
    .line 99
    iput v4, v0, Lkp;->A:I

    .line 100
    .line 101
    iput v4, v0, Lkp;->B:I

    .line 102
    .line 103
    iput v4, v0, Lkp;->C:I

    .line 104
    .line 105
    iput v4, v0, Lkp;->D:I

    .line 106
    .line 107
    iput v4, v0, Lkp;->E:I

    .line 108
    .line 109
    iput v4, v0, Lkp;->F:I

    .line 110
    .line 111
    iput v4, v0, Lkp;->G:I

    .line 112
    .line 113
    iput v4, v0, Lkp;->H:I

    .line 114
    .line 115
    iput v4, v0, Lkp;->I:I

    .line 116
    .line 117
    iput v4, v0, Lkp;->J:I

    .line 118
    .line 119
    iput v4, v0, Lkp;->K:I

    .line 120
    .line 121
    iput v4, v0, Lkp;->L:I

    .line 122
    .line 123
    iput v4, v0, Lkp;->M:I

    .line 124
    .line 125
    iput v4, v0, Lkp;->N:I

    .line 126
    .line 127
    iput v5, v0, Lkp;->O:F

    .line 128
    .line 129
    iput v5, v0, Lkp;->P:F

    .line 130
    .line 131
    iput v1, v0, Lkp;->Q:I

    .line 132
    .line 133
    iput v1, v0, Lkp;->R:I

    .line 134
    .line 135
    iput v1, v0, Lkp;->S:I

    .line 136
    .line 137
    iput v1, v0, Lkp;->T:I

    .line 138
    .line 139
    iput v4, v0, Lkp;->U:I

    .line 140
    .line 141
    iput v4, v0, Lkp;->V:I

    .line 142
    .line 143
    iput v4, v0, Lkp;->W:I

    .line 144
    .line 145
    iput v4, v0, Lkp;->X:I

    .line 146
    .line 147
    iput v2, v0, Lkp;->Y:F

    .line 148
    .line 149
    iput v2, v0, Lkp;->Z:F

    .line 150
    .line 151
    iput v4, v0, Lkp;->a0:I

    .line 152
    .line 153
    iput v1, v0, Lkp;->b0:I

    .line 154
    .line 155
    iput v4, v0, Lkp;->c0:I

    .line 156
    .line 157
    iput-boolean v1, v0, Lkp;->g0:Z

    .line 158
    .line 159
    iput-boolean v1, v0, Lkp;->h0:Z

    .line 160
    .line 161
    const/4 v4, 0x1

    .line 162
    iput-boolean v4, v0, Lkp;->i0:Z

    .line 163
    .line 164
    iput-object v0, p0, Ljp;->d:Lkp;

    .line 165
    .line 166
    new-instance v0, Lnp;

    .line 167
    .line 168
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 169
    .line 170
    .line 171
    iput v6, v0, Lnp;->a:F

    .line 172
    .line 173
    iput v6, v0, Lnp;->b:F

    .line 174
    .line 175
    iput v6, v0, Lnp;->c:F

    .line 176
    .line 177
    iput v2, v0, Lnp;->d:F

    .line 178
    .line 179
    iput v2, v0, Lnp;->e:F

    .line 180
    .line 181
    iput v3, v0, Lnp;->f:F

    .line 182
    .line 183
    iput v3, v0, Lnp;->g:F

    .line 184
    .line 185
    iput v6, v0, Lnp;->h:F

    .line 186
    .line 187
    iput v6, v0, Lnp;->i:F

    .line 188
    .line 189
    iput v6, v0, Lnp;->j:F

    .line 190
    .line 191
    iput-boolean v1, v0, Lnp;->k:Z

    .line 192
    .line 193
    iput v6, v0, Lnp;->l:F

    .line 194
    .line 195
    iput-object v0, p0, Ljp;->e:Lnp;

    .line 196
    .line 197
    new-instance v0, Ljava/util/HashMap;

    .line 198
    .line 199
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 200
    .line 201
    .line 202
    iput-object v0, p0, Ljp;->f:Ljava/util/HashMap;

    .line 203
    .line 204
    return-void
.end method


# virtual methods
.method public final a(Lfp;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ljp;->d:Lkp;

    .line 2
    .line 3
    iget v0, p0, Lkp;->g:I

    .line 4
    .line 5
    iput v0, p1, Lfp;->d:I

    .line 6
    .line 7
    iget v0, p0, Lkp;->h:I

    .line 8
    .line 9
    iput v0, p1, Lfp;->e:I

    .line 10
    .line 11
    iget v0, p0, Lkp;->i:I

    .line 12
    .line 13
    iput v0, p1, Lfp;->f:I

    .line 14
    .line 15
    iget v0, p0, Lkp;->j:I

    .line 16
    .line 17
    iput v0, p1, Lfp;->g:I

    .line 18
    .line 19
    iget v0, p0, Lkp;->k:I

    .line 20
    .line 21
    iput v0, p1, Lfp;->h:I

    .line 22
    .line 23
    iget v0, p0, Lkp;->l:I

    .line 24
    .line 25
    iput v0, p1, Lfp;->i:I

    .line 26
    .line 27
    iget v0, p0, Lkp;->m:I

    .line 28
    .line 29
    iput v0, p1, Lfp;->j:I

    .line 30
    .line 31
    iget v0, p0, Lkp;->n:I

    .line 32
    .line 33
    iput v0, p1, Lfp;->k:I

    .line 34
    .line 35
    iget v0, p0, Lkp;->o:I

    .line 36
    .line 37
    iput v0, p1, Lfp;->l:I

    .line 38
    .line 39
    iget v0, p0, Lkp;->p:I

    .line 40
    .line 41
    iput v0, p1, Lfp;->p:I

    .line 42
    .line 43
    iget v0, p0, Lkp;->q:I

    .line 44
    .line 45
    iput v0, p1, Lfp;->q:I

    .line 46
    .line 47
    iget v0, p0, Lkp;->r:I

    .line 48
    .line 49
    iput v0, p1, Lfp;->r:I

    .line 50
    .line 51
    iget v0, p0, Lkp;->s:I

    .line 52
    .line 53
    iput v0, p1, Lfp;->s:I

    .line 54
    .line 55
    iget v0, p0, Lkp;->C:I

    .line 56
    .line 57
    iput v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 58
    .line 59
    iget v0, p0, Lkp;->D:I

    .line 60
    .line 61
    iput v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 62
    .line 63
    iget v0, p0, Lkp;->E:I

    .line 64
    .line 65
    iput v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 66
    .line 67
    iget v0, p0, Lkp;->F:I

    .line 68
    .line 69
    iput v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 70
    .line 71
    iget v0, p0, Lkp;->N:I

    .line 72
    .line 73
    iput v0, p1, Lfp;->x:I

    .line 74
    .line 75
    iget v0, p0, Lkp;->M:I

    .line 76
    .line 77
    iput v0, p1, Lfp;->y:I

    .line 78
    .line 79
    iget v0, p0, Lkp;->J:I

    .line 80
    .line 81
    iput v0, p1, Lfp;->u:I

    .line 82
    .line 83
    iget v0, p0, Lkp;->L:I

    .line 84
    .line 85
    iput v0, p1, Lfp;->w:I

    .line 86
    .line 87
    iget v0, p0, Lkp;->t:F

    .line 88
    .line 89
    iput v0, p1, Lfp;->z:F

    .line 90
    .line 91
    iget v0, p0, Lkp;->u:F

    .line 92
    .line 93
    iput v0, p1, Lfp;->A:F

    .line 94
    .line 95
    iget v0, p0, Lkp;->w:I

    .line 96
    .line 97
    iput v0, p1, Lfp;->m:I

    .line 98
    .line 99
    iget v0, p0, Lkp;->x:I

    .line 100
    .line 101
    iput v0, p1, Lfp;->n:I

    .line 102
    .line 103
    iget v0, p0, Lkp;->y:F

    .line 104
    .line 105
    iput v0, p1, Lfp;->o:F

    .line 106
    .line 107
    iget-object v0, p0, Lkp;->v:Ljava/lang/String;

    .line 108
    .line 109
    iput-object v0, p1, Lfp;->B:Ljava/lang/String;

    .line 110
    .line 111
    iget v0, p0, Lkp;->z:I

    .line 112
    .line 113
    iput v0, p1, Lfp;->O:I

    .line 114
    .line 115
    iget v0, p0, Lkp;->A:I

    .line 116
    .line 117
    iput v0, p1, Lfp;->P:I

    .line 118
    .line 119
    iget v0, p0, Lkp;->O:F

    .line 120
    .line 121
    iput v0, p1, Lfp;->D:F

    .line 122
    .line 123
    iget v0, p0, Lkp;->P:F

    .line 124
    .line 125
    iput v0, p1, Lfp;->C:F

    .line 126
    .line 127
    iget v0, p0, Lkp;->R:I

    .line 128
    .line 129
    iput v0, p1, Lfp;->F:I

    .line 130
    .line 131
    iget v0, p0, Lkp;->Q:I

    .line 132
    .line 133
    iput v0, p1, Lfp;->E:I

    .line 134
    .line 135
    iget-boolean v0, p0, Lkp;->g0:Z

    .line 136
    .line 137
    iput-boolean v0, p1, Lfp;->R:Z

    .line 138
    .line 139
    iget-boolean v0, p0, Lkp;->h0:Z

    .line 140
    .line 141
    iput-boolean v0, p1, Lfp;->S:Z

    .line 142
    .line 143
    iget v0, p0, Lkp;->S:I

    .line 144
    .line 145
    iput v0, p1, Lfp;->G:I

    .line 146
    .line 147
    iget v0, p0, Lkp;->T:I

    .line 148
    .line 149
    iput v0, p1, Lfp;->H:I

    .line 150
    .line 151
    iget v0, p0, Lkp;->U:I

    .line 152
    .line 153
    iput v0, p1, Lfp;->K:I

    .line 154
    .line 155
    iget v0, p0, Lkp;->V:I

    .line 156
    .line 157
    iput v0, p1, Lfp;->L:I

    .line 158
    .line 159
    iget v0, p0, Lkp;->W:I

    .line 160
    .line 161
    iput v0, p1, Lfp;->I:I

    .line 162
    .line 163
    iget v0, p0, Lkp;->X:I

    .line 164
    .line 165
    iput v0, p1, Lfp;->J:I

    .line 166
    .line 167
    iget v0, p0, Lkp;->Y:F

    .line 168
    .line 169
    iput v0, p1, Lfp;->M:F

    .line 170
    .line 171
    iget v0, p0, Lkp;->Z:F

    .line 172
    .line 173
    iput v0, p1, Lfp;->N:F

    .line 174
    .line 175
    iget v0, p0, Lkp;->B:I

    .line 176
    .line 177
    iput v0, p1, Lfp;->Q:I

    .line 178
    .line 179
    iget v0, p0, Lkp;->f:F

    .line 180
    .line 181
    iput v0, p1, Lfp;->c:F

    .line 182
    .line 183
    iget v0, p0, Lkp;->d:I

    .line 184
    .line 185
    iput v0, p1, Lfp;->a:I

    .line 186
    .line 187
    iget v0, p0, Lkp;->e:I

    .line 188
    .line 189
    iput v0, p1, Lfp;->b:I

    .line 190
    .line 191
    iget v0, p0, Lkp;->b:I

    .line 192
    .line 193
    iput v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 194
    .line 195
    iget v0, p0, Lkp;->c:I

    .line 196
    .line 197
    iput v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 198
    .line 199
    iget-object v0, p0, Lkp;->f0:Ljava/lang/String;

    .line 200
    .line 201
    if-eqz v0, :cond_0

    .line 202
    .line 203
    iput-object v0, p1, Lfp;->T:Ljava/lang/String;

    .line 204
    .line 205
    :cond_0
    iget v0, p0, Lkp;->H:I

    .line 206
    .line 207
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginStart(I)V

    .line 208
    .line 209
    .line 210
    iget p0, p0, Lkp;->G:I

    .line 211
    .line 212
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginEnd(I)V

    .line 213
    .line 214
    .line 215
    invoke-virtual {p1}, Lfp;->a()V

    .line 216
    .line 217
    .line 218
    return-void
.end method

.method public final clone()Ljava/lang/Object;
    .locals 5

    .line 1
    new-instance v0, Ljp;

    .line 2
    .line 3
    invoke-direct {v0}, Ljp;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ljp;->d:Lkp;

    .line 7
    .line 8
    iget-boolean v2, v1, Lkp;->a:Z

    .line 9
    .line 10
    iget-object v3, v0, Ljp;->d:Lkp;

    .line 11
    .line 12
    iput-boolean v2, v3, Lkp;->a:Z

    .line 13
    .line 14
    iget v2, v1, Lkp;->b:I

    .line 15
    .line 16
    iput v2, v3, Lkp;->b:I

    .line 17
    .line 18
    iget v2, v1, Lkp;->c:I

    .line 19
    .line 20
    iput v2, v3, Lkp;->c:I

    .line 21
    .line 22
    iget v2, v1, Lkp;->d:I

    .line 23
    .line 24
    iput v2, v3, Lkp;->d:I

    .line 25
    .line 26
    iget v2, v1, Lkp;->e:I

    .line 27
    .line 28
    iput v2, v3, Lkp;->e:I

    .line 29
    .line 30
    iget v2, v1, Lkp;->f:F

    .line 31
    .line 32
    iput v2, v3, Lkp;->f:F

    .line 33
    .line 34
    iget v2, v1, Lkp;->g:I

    .line 35
    .line 36
    iput v2, v3, Lkp;->g:I

    .line 37
    .line 38
    iget v2, v1, Lkp;->h:I

    .line 39
    .line 40
    iput v2, v3, Lkp;->h:I

    .line 41
    .line 42
    iget v2, v1, Lkp;->i:I

    .line 43
    .line 44
    iput v2, v3, Lkp;->i:I

    .line 45
    .line 46
    iget v2, v1, Lkp;->j:I

    .line 47
    .line 48
    iput v2, v3, Lkp;->j:I

    .line 49
    .line 50
    iget v2, v1, Lkp;->k:I

    .line 51
    .line 52
    iput v2, v3, Lkp;->k:I

    .line 53
    .line 54
    iget v2, v1, Lkp;->l:I

    .line 55
    .line 56
    iput v2, v3, Lkp;->l:I

    .line 57
    .line 58
    iget v2, v1, Lkp;->m:I

    .line 59
    .line 60
    iput v2, v3, Lkp;->m:I

    .line 61
    .line 62
    iget v2, v1, Lkp;->n:I

    .line 63
    .line 64
    iput v2, v3, Lkp;->n:I

    .line 65
    .line 66
    iget v2, v1, Lkp;->o:I

    .line 67
    .line 68
    iput v2, v3, Lkp;->o:I

    .line 69
    .line 70
    iget v2, v1, Lkp;->p:I

    .line 71
    .line 72
    iput v2, v3, Lkp;->p:I

    .line 73
    .line 74
    iget v2, v1, Lkp;->q:I

    .line 75
    .line 76
    iput v2, v3, Lkp;->q:I

    .line 77
    .line 78
    iget v2, v1, Lkp;->r:I

    .line 79
    .line 80
    iput v2, v3, Lkp;->r:I

    .line 81
    .line 82
    iget v2, v1, Lkp;->s:I

    .line 83
    .line 84
    iput v2, v3, Lkp;->s:I

    .line 85
    .line 86
    iget v2, v1, Lkp;->t:F

    .line 87
    .line 88
    iput v2, v3, Lkp;->t:F

    .line 89
    .line 90
    iget v2, v1, Lkp;->u:F

    .line 91
    .line 92
    iput v2, v3, Lkp;->u:F

    .line 93
    .line 94
    iget-object v2, v1, Lkp;->v:Ljava/lang/String;

    .line 95
    .line 96
    iput-object v2, v3, Lkp;->v:Ljava/lang/String;

    .line 97
    .line 98
    iget v2, v1, Lkp;->w:I

    .line 99
    .line 100
    iput v2, v3, Lkp;->w:I

    .line 101
    .line 102
    iget v2, v1, Lkp;->x:I

    .line 103
    .line 104
    iput v2, v3, Lkp;->x:I

    .line 105
    .line 106
    iget v2, v1, Lkp;->y:F

    .line 107
    .line 108
    iput v2, v3, Lkp;->y:F

    .line 109
    .line 110
    iget v2, v1, Lkp;->z:I

    .line 111
    .line 112
    iput v2, v3, Lkp;->z:I

    .line 113
    .line 114
    iget v2, v1, Lkp;->A:I

    .line 115
    .line 116
    iput v2, v3, Lkp;->A:I

    .line 117
    .line 118
    iget v2, v1, Lkp;->B:I

    .line 119
    .line 120
    iput v2, v3, Lkp;->B:I

    .line 121
    .line 122
    iget v2, v1, Lkp;->C:I

    .line 123
    .line 124
    iput v2, v3, Lkp;->C:I

    .line 125
    .line 126
    iget v2, v1, Lkp;->D:I

    .line 127
    .line 128
    iput v2, v3, Lkp;->D:I

    .line 129
    .line 130
    iget v2, v1, Lkp;->E:I

    .line 131
    .line 132
    iput v2, v3, Lkp;->E:I

    .line 133
    .line 134
    iget v2, v1, Lkp;->F:I

    .line 135
    .line 136
    iput v2, v3, Lkp;->F:I

    .line 137
    .line 138
    iget v2, v1, Lkp;->G:I

    .line 139
    .line 140
    iput v2, v3, Lkp;->G:I

    .line 141
    .line 142
    iget v2, v1, Lkp;->H:I

    .line 143
    .line 144
    iput v2, v3, Lkp;->H:I

    .line 145
    .line 146
    iget v2, v1, Lkp;->I:I

    .line 147
    .line 148
    iput v2, v3, Lkp;->I:I

    .line 149
    .line 150
    iget v2, v1, Lkp;->J:I

    .line 151
    .line 152
    iput v2, v3, Lkp;->J:I

    .line 153
    .line 154
    iget v2, v1, Lkp;->K:I

    .line 155
    .line 156
    iput v2, v3, Lkp;->K:I

    .line 157
    .line 158
    iget v2, v1, Lkp;->L:I

    .line 159
    .line 160
    iput v2, v3, Lkp;->L:I

    .line 161
    .line 162
    iget v2, v1, Lkp;->M:I

    .line 163
    .line 164
    iput v2, v3, Lkp;->M:I

    .line 165
    .line 166
    iget v2, v1, Lkp;->N:I

    .line 167
    .line 168
    iput v2, v3, Lkp;->N:I

    .line 169
    .line 170
    iget v2, v1, Lkp;->O:F

    .line 171
    .line 172
    iput v2, v3, Lkp;->O:F

    .line 173
    .line 174
    iget v2, v1, Lkp;->P:F

    .line 175
    .line 176
    iput v2, v3, Lkp;->P:F

    .line 177
    .line 178
    iget v2, v1, Lkp;->Q:I

    .line 179
    .line 180
    iput v2, v3, Lkp;->Q:I

    .line 181
    .line 182
    iget v2, v1, Lkp;->R:I

    .line 183
    .line 184
    iput v2, v3, Lkp;->R:I

    .line 185
    .line 186
    iget v2, v1, Lkp;->S:I

    .line 187
    .line 188
    iput v2, v3, Lkp;->S:I

    .line 189
    .line 190
    iget v2, v1, Lkp;->T:I

    .line 191
    .line 192
    iput v2, v3, Lkp;->T:I

    .line 193
    .line 194
    iget v2, v1, Lkp;->U:I

    .line 195
    .line 196
    iput v2, v3, Lkp;->U:I

    .line 197
    .line 198
    iget v2, v1, Lkp;->V:I

    .line 199
    .line 200
    iput v2, v3, Lkp;->V:I

    .line 201
    .line 202
    iget v2, v1, Lkp;->W:I

    .line 203
    .line 204
    iput v2, v3, Lkp;->W:I

    .line 205
    .line 206
    iget v2, v1, Lkp;->X:I

    .line 207
    .line 208
    iput v2, v3, Lkp;->X:I

    .line 209
    .line 210
    iget v2, v1, Lkp;->Y:F

    .line 211
    .line 212
    iput v2, v3, Lkp;->Y:F

    .line 213
    .line 214
    iget v2, v1, Lkp;->Z:F

    .line 215
    .line 216
    iput v2, v3, Lkp;->Z:F

    .line 217
    .line 218
    iget v2, v1, Lkp;->a0:I

    .line 219
    .line 220
    iput v2, v3, Lkp;->a0:I

    .line 221
    .line 222
    iget v2, v1, Lkp;->b0:I

    .line 223
    .line 224
    iput v2, v3, Lkp;->b0:I

    .line 225
    .line 226
    iget v2, v1, Lkp;->c0:I

    .line 227
    .line 228
    iput v2, v3, Lkp;->c0:I

    .line 229
    .line 230
    iget-object v2, v1, Lkp;->f0:Ljava/lang/String;

    .line 231
    .line 232
    iput-object v2, v3, Lkp;->f0:Ljava/lang/String;

    .line 233
    .line 234
    iget-object v2, v1, Lkp;->d0:[I

    .line 235
    .line 236
    if-eqz v2, :cond_0

    .line 237
    .line 238
    array-length v4, v2

    .line 239
    invoke-static {v2, v4}, Ljava/util/Arrays;->copyOf([II)[I

    .line 240
    .line 241
    .line 242
    move-result-object v2

    .line 243
    iput-object v2, v3, Lkp;->d0:[I

    .line 244
    .line 245
    goto :goto_0

    .line 246
    :cond_0
    const/4 v2, 0x0

    .line 247
    iput-object v2, v3, Lkp;->d0:[I

    .line 248
    .line 249
    :goto_0
    iget-object v2, v1, Lkp;->e0:Ljava/lang/String;

    .line 250
    .line 251
    iput-object v2, v3, Lkp;->e0:Ljava/lang/String;

    .line 252
    .line 253
    iget-boolean v2, v1, Lkp;->g0:Z

    .line 254
    .line 255
    iput-boolean v2, v3, Lkp;->g0:Z

    .line 256
    .line 257
    iget-boolean v2, v1, Lkp;->h0:Z

    .line 258
    .line 259
    iput-boolean v2, v3, Lkp;->h0:Z

    .line 260
    .line 261
    iget-boolean v1, v1, Lkp;->i0:Z

    .line 262
    .line 263
    iput-boolean v1, v3, Lkp;->i0:Z

    .line 264
    .line 265
    iget-object v1, p0, Ljp;->c:Llp;

    .line 266
    .line 267
    iget v2, v1, Llp;->a:I

    .line 268
    .line 269
    iget-object v3, v0, Ljp;->c:Llp;

    .line 270
    .line 271
    iput v2, v3, Llp;->a:I

    .line 272
    .line 273
    iget v2, v1, Llp;->b:I

    .line 274
    .line 275
    iput v2, v3, Llp;->b:I

    .line 276
    .line 277
    iget v2, v1, Llp;->d:F

    .line 278
    .line 279
    iput v2, v3, Llp;->d:F

    .line 280
    .line 281
    iget v1, v1, Llp;->c:F

    .line 282
    .line 283
    iput v1, v3, Llp;->c:F

    .line 284
    .line 285
    iget-object v1, p0, Ljp;->b:Lmp;

    .line 286
    .line 287
    iget v2, v1, Lmp;->a:I

    .line 288
    .line 289
    iget-object v3, v0, Ljp;->b:Lmp;

    .line 290
    .line 291
    iput v2, v3, Lmp;->a:I

    .line 292
    .line 293
    iget v2, v1, Lmp;->c:F

    .line 294
    .line 295
    iput v2, v3, Lmp;->c:F

    .line 296
    .line 297
    iget v2, v1, Lmp;->d:F

    .line 298
    .line 299
    iput v2, v3, Lmp;->d:F

    .line 300
    .line 301
    iget v1, v1, Lmp;->b:I

    .line 302
    .line 303
    iput v1, v3, Lmp;->b:I

    .line 304
    .line 305
    iget-object v1, p0, Ljp;->e:Lnp;

    .line 306
    .line 307
    iget v2, v1, Lnp;->a:F

    .line 308
    .line 309
    iget-object v3, v0, Ljp;->e:Lnp;

    .line 310
    .line 311
    iput v2, v3, Lnp;->a:F

    .line 312
    .line 313
    iget v2, v1, Lnp;->b:F

    .line 314
    .line 315
    iput v2, v3, Lnp;->b:F

    .line 316
    .line 317
    iget v2, v1, Lnp;->c:F

    .line 318
    .line 319
    iput v2, v3, Lnp;->c:F

    .line 320
    .line 321
    iget v2, v1, Lnp;->d:F

    .line 322
    .line 323
    iput v2, v3, Lnp;->d:F

    .line 324
    .line 325
    iget v2, v1, Lnp;->e:F

    .line 326
    .line 327
    iput v2, v3, Lnp;->e:F

    .line 328
    .line 329
    iget v2, v1, Lnp;->f:F

    .line 330
    .line 331
    iput v2, v3, Lnp;->f:F

    .line 332
    .line 333
    iget v2, v1, Lnp;->g:F

    .line 334
    .line 335
    iput v2, v3, Lnp;->g:F

    .line 336
    .line 337
    iget v2, v1, Lnp;->h:F

    .line 338
    .line 339
    iput v2, v3, Lnp;->h:F

    .line 340
    .line 341
    iget v2, v1, Lnp;->i:F

    .line 342
    .line 343
    iput v2, v3, Lnp;->i:F

    .line 344
    .line 345
    iget v2, v1, Lnp;->j:F

    .line 346
    .line 347
    iput v2, v3, Lnp;->j:F

    .line 348
    .line 349
    iget-boolean v2, v1, Lnp;->k:Z

    .line 350
    .line 351
    iput-boolean v2, v3, Lnp;->k:Z

    .line 352
    .line 353
    iget v1, v1, Lnp;->l:F

    .line 354
    .line 355
    iput v1, v3, Lnp;->l:F

    .line 356
    .line 357
    iget p0, p0, Ljp;->a:I

    .line 358
    .line 359
    iput p0, v0, Ljp;->a:I

    .line 360
    .line 361
    return-object v0
.end method
