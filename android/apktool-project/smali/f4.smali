.class public final Lf4;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final synthetic a:I

.field public b:I

.field public c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>()V
    .locals 1

    .line 33
    const/4 v0, 0x3

    iput v0, p0, Lf4;->a:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(ILjava/io/Serializable;I)V
    .locals 0

    .line 26
    iput p3, p0, Lf4;->a:I

    iput p1, p0, Lf4;->b:I

    iput-object p2, p0, Lf4;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(I[B)V
    .locals 1

    const/4 v0, 0x4

    iput v0, p0, Lf4;->a:I

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    iput-object p2, p0, Lf4;->c:Ljava/lang/Object;

    .line 30
    iput p1, p0, Lf4;->b:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lf4;->a:I

    .line 32
    invoke-static {p1, v0}, Lg4;->h(Landroid/content/Context;I)I

    move-result v0

    invoke-direct {p0, p1, v0}, Lf4;-><init>(Landroid/content/Context;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;I)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lf4;->a:I

    .line 3
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    .line 6
    .line 7
    new-instance v0, Lb4;

    .line 8
    .line 9
    new-instance v1, Landroid/view/ContextThemeWrapper;

    .line 10
    .line 11
    invoke-static {p1, p2}, Lg4;->h(Landroid/content/Context;I)I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    invoke-direct {v1, p1, v2}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    .line 16
    .line 17
    .line 18
    invoke-direct {v0, v1}, Lb4;-><init>(Landroid/view/ContextThemeWrapper;)V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Lf4;->c:Ljava/lang/Object;

    .line 22
    .line 23
    iput p2, p0, Lf4;->b:I

    .line 24
    .line 25
    return-void
.end method

.method public constructor <init>(Ljava/util/ArrayList;)V
    .locals 1

    const/4 v0, 0x5

    iput v0, p0, Lf4;->a:I

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lf4;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Loo;I)V
    .locals 1

    const/4 v0, 0x6

    iput v0, p0, Lf4;->a:I

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Lbh;->h(Ljava/lang/Object;)V

    iput-object p1, p0, Lf4;->c:Ljava/lang/Object;

    iput p2, p0, Lf4;->b:I

    return-void
.end method


# virtual methods
.method public a()Lg4;
    .locals 11

    .line 1
    new-instance v0, Lg4;

    .line 2
    .line 3
    iget-object v1, p0, Lf4;->c:Ljava/lang/Object;

    .line 4
    .line 5
    move-object v3, v1

    .line 6
    check-cast v3, Lb4;

    .line 7
    .line 8
    iget-object v1, v3, Lb4;->a:Landroid/view/ContextThemeWrapper;

    .line 9
    .line 10
    iget-object v4, v3, Lb4;->a:Landroid/view/ContextThemeWrapper;

    .line 11
    .line 12
    iget p0, p0, Lf4;->b:I

    .line 13
    .line 14
    invoke-direct {v0, v1, p0}, Lg4;-><init>(Landroid/view/ContextThemeWrapper;I)V

    .line 15
    .line 16
    .line 17
    iget-object p0, v3, Lb4;->e:Landroid/view/View;

    .line 18
    .line 19
    iget-object v1, v0, Lg4;->o:Le4;

    .line 20
    .line 21
    const/4 v8, 0x0

    .line 22
    if-eqz p0, :cond_0

    .line 23
    .line 24
    iput-object p0, v1, Le4;->w:Landroid/view/View;

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    iget-object p0, v3, Lb4;->d:Ljava/lang/CharSequence;

    .line 28
    .line 29
    if-eqz p0, :cond_1

    .line 30
    .line 31
    iput-object p0, v1, Le4;->d:Ljava/lang/CharSequence;

    .line 32
    .line 33
    iget-object v2, v1, Le4;->u:Landroid/widget/TextView;

    .line 34
    .line 35
    if-eqz v2, :cond_1

    .line 36
    .line 37
    invoke-virtual {v2, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 38
    .line 39
    .line 40
    :cond_1
    iget-object p0, v3, Lb4;->c:Landroid/graphics/drawable/Drawable;

    .line 41
    .line 42
    if-eqz p0, :cond_2

    .line 43
    .line 44
    iput-object p0, v1, Le4;->s:Landroid/graphics/drawable/Drawable;

    .line 45
    .line 46
    iget-object v2, v1, Le4;->t:Landroid/widget/ImageView;

    .line 47
    .line 48
    if-eqz v2, :cond_2

    .line 49
    .line 50
    invoke-virtual {v2, v8}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 51
    .line 52
    .line 53
    iget-object v2, v1, Le4;->t:Landroid/widget/ImageView;

    .line 54
    .line 55
    invoke-virtual {v2, p0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 56
    .line 57
    .line 58
    :cond_2
    :goto_0
    iget-object p0, v3, Lb4;->f:Ljava/lang/CharSequence;

    .line 59
    .line 60
    if-eqz p0, :cond_3

    .line 61
    .line 62
    iput-object p0, v1, Le4;->e:Ljava/lang/CharSequence;

    .line 63
    .line 64
    iget-object v2, v1, Le4;->v:Landroid/widget/TextView;

    .line 65
    .line 66
    if-eqz v2, :cond_3

    .line 67
    .line 68
    invoke-virtual {v2, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 69
    .line 70
    .line 71
    :cond_3
    iget-object p0, v3, Lb4;->g:Ljava/lang/CharSequence;

    .line 72
    .line 73
    if-nez p0, :cond_4

    .line 74
    .line 75
    goto :goto_1

    .line 76
    :cond_4
    const/4 v2, -0x1

    .line 77
    iget-object v5, v3, Lb4;->h:Landroid/content/DialogInterface$OnClickListener;

    .line 78
    .line 79
    invoke-virtual {v1, v2, p0, v5}, Le4;->c(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 80
    .line 81
    .line 82
    :goto_1
    iget-object p0, v3, Lb4;->i:Ljava/lang/CharSequence;

    .line 83
    .line 84
    if-nez p0, :cond_5

    .line 85
    .line 86
    goto :goto_2

    .line 87
    :cond_5
    const/4 v2, -0x2

    .line 88
    iget-object v5, v3, Lb4;->j:Landroid/content/DialogInterface$OnClickListener;

    .line 89
    .line 90
    invoke-virtual {v1, v2, p0, v5}, Le4;->c(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 91
    .line 92
    .line 93
    :goto_2
    iget-object p0, v3, Lb4;->k:Ljava/lang/String;

    .line 94
    .line 95
    if-nez p0, :cond_6

    .line 96
    .line 97
    goto :goto_3

    .line 98
    :cond_6
    const/4 v2, -0x3

    .line 99
    iget-object v5, v3, Lb4;->l:Landroid/content/DialogInterface$OnClickListener;

    .line 100
    .line 101
    invoke-virtual {v1, v2, p0, v5}, Le4;->c(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 102
    .line 103
    .line 104
    :goto_3
    iget-object p0, v3, Lb4;->o:[Ljava/lang/CharSequence;

    .line 105
    .line 106
    const/4 v9, 0x1

    .line 107
    const/4 v10, 0x0

    .line 108
    if-nez p0, :cond_7

    .line 109
    .line 110
    iget-object p0, v3, Lb4;->p:Landroid/widget/ListAdapter;

    .line 111
    .line 112
    if-eqz p0, :cond_f

    .line 113
    .line 114
    :cond_7
    iget-object p0, v3, Lb4;->b:Landroid/view/LayoutInflater;

    .line 115
    .line 116
    iget v2, v1, Le4;->A:I

    .line 117
    .line 118
    invoke-virtual {p0, v2, v10}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    move-object v7, p0

    .line 123
    check-cast v7, Landroidx/appcompat/app/AlertController$RecycleListView;

    .line 124
    .line 125
    iget-boolean p0, v3, Lb4;->t:Z

    .line 126
    .line 127
    if-eqz p0, :cond_8

    .line 128
    .line 129
    new-instance v2, Ly3;

    .line 130
    .line 131
    iget v5, v1, Le4;->B:I

    .line 132
    .line 133
    iget-object v6, v3, Lb4;->o:[Ljava/lang/CharSequence;

    .line 134
    .line 135
    invoke-direct/range {v2 .. v7}, Ly3;-><init>(Lb4;Landroid/view/ContextThemeWrapper;I[Ljava/lang/CharSequence;Landroidx/appcompat/app/AlertController$RecycleListView;)V

    .line 136
    .line 137
    .line 138
    goto :goto_5

    .line 139
    :cond_8
    iget-boolean p0, v3, Lb4;->u:Z

    .line 140
    .line 141
    if-eqz p0, :cond_9

    .line 142
    .line 143
    iget p0, v1, Le4;->C:I

    .line 144
    .line 145
    goto :goto_4

    .line 146
    :cond_9
    iget p0, v1, Le4;->D:I

    .line 147
    .line 148
    :goto_4
    iget-object v2, v3, Lb4;->p:Landroid/widget/ListAdapter;

    .line 149
    .line 150
    if-eqz v2, :cond_a

    .line 151
    .line 152
    goto :goto_5

    .line 153
    :cond_a
    new-instance v2, Ld4;

    .line 154
    .line 155
    const v5, 0x1020014

    .line 156
    .line 157
    .line 158
    iget-object v6, v3, Lb4;->o:[Ljava/lang/CharSequence;

    .line 159
    .line 160
    invoke-direct {v2, v4, p0, v5, v6}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;II[Ljava/lang/Object;)V

    .line 161
    .line 162
    .line 163
    :goto_5
    iput-object v2, v1, Le4;->x:Landroid/widget/ListAdapter;

    .line 164
    .line 165
    iget p0, v3, Lb4;->v:I

    .line 166
    .line 167
    iput p0, v1, Le4;->y:I

    .line 168
    .line 169
    iget-object p0, v3, Lb4;->q:Landroid/content/DialogInterface$OnClickListener;

    .line 170
    .line 171
    if-eqz p0, :cond_b

    .line 172
    .line 173
    new-instance p0, Lz3;

    .line 174
    .line 175
    invoke-direct {p0, v3, v1}, Lz3;-><init>(Lb4;Le4;)V

    .line 176
    .line 177
    .line 178
    invoke-virtual {v7, p0}, Landroid/widget/AdapterView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 179
    .line 180
    .line 181
    goto :goto_6

    .line 182
    :cond_b
    iget-object p0, v3, Lb4;->w:Lpo0;

    .line 183
    .line 184
    if-eqz p0, :cond_c

    .line 185
    .line 186
    new-instance p0, La4;

    .line 187
    .line 188
    invoke-direct {p0, v3, v7, v1}, La4;-><init>(Lb4;Landroidx/appcompat/app/AlertController$RecycleListView;Le4;)V

    .line 189
    .line 190
    .line 191
    invoke-virtual {v7, p0}, Landroid/widget/AdapterView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 192
    .line 193
    .line 194
    :cond_c
    :goto_6
    iget-boolean p0, v3, Lb4;->u:Z

    .line 195
    .line 196
    if-eqz p0, :cond_d

    .line 197
    .line 198
    invoke-virtual {v7, v9}, Landroid/widget/AbsListView;->setChoiceMode(I)V

    .line 199
    .line 200
    .line 201
    goto :goto_7

    .line 202
    :cond_d
    iget-boolean p0, v3, Lb4;->t:Z

    .line 203
    .line 204
    if-eqz p0, :cond_e

    .line 205
    .line 206
    const/4 p0, 0x2

    .line 207
    invoke-virtual {v7, p0}, Landroid/widget/AbsListView;->setChoiceMode(I)V

    .line 208
    .line 209
    .line 210
    :cond_e
    :goto_7
    iput-object v7, v1, Le4;->f:Landroidx/appcompat/app/AlertController$RecycleListView;

    .line 211
    .line 212
    :cond_f
    iget-object p0, v3, Lb4;->r:Landroid/view/View;

    .line 213
    .line 214
    if-eqz p0, :cond_10

    .line 215
    .line 216
    iput-object p0, v1, Le4;->g:Landroid/view/View;

    .line 217
    .line 218
    iput-boolean v8, v1, Le4;->h:Z

    .line 219
    .line 220
    :cond_10
    iget-boolean p0, v3, Lb4;->m:Z

    .line 221
    .line 222
    invoke-virtual {v0, p0}, Landroid/app/Dialog;->setCancelable(Z)V

    .line 223
    .line 224
    .line 225
    iget-boolean p0, v3, Lb4;->m:Z

    .line 226
    .line 227
    if-eqz p0, :cond_11

    .line 228
    .line 229
    invoke-virtual {v0, v9}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    .line 230
    .line 231
    .line 232
    :cond_11
    invoke-virtual {v0, v10}, Landroid/app/Dialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 233
    .line 234
    .line 235
    invoke-virtual {v0, v10}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 236
    .line 237
    .line 238
    iget-object p0, v3, Lb4;->n:Lsm0;

    .line 239
    .line 240
    if-eqz p0, :cond_12

    .line 241
    .line 242
    invoke-virtual {v0, p0}, Landroid/app/Dialog;->setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)V

    .line 243
    .line 244
    .line 245
    :cond_12
    return-object v0
.end method

.method public b(II)V
    .locals 2

    .line 1
    add-int/2addr p2, p1

    .line 2
    iget-object v0, p0, Lf4;->c:Ljava/lang/Object;

    .line 3
    .line 4
    check-cast v0, [C

    .line 5
    .line 6
    array-length v1, v0

    .line 7
    if-gt v1, p2, :cond_1

    .line 8
    .line 9
    mul-int/lit8 p1, p1, 0x2

    .line 10
    .line 11
    if-ge p2, p1, :cond_0

    .line 12
    .line 13
    move p2, p1

    .line 14
    :cond_0
    invoke-static {v0, p2}, Ljava/util/Arrays;->copyOf([CI)[C

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iput-object p1, p0, Lf4;->c:Ljava/lang/Object;

    .line 19
    .line 20
    :cond_1
    return-void
.end method

.method public c()Z
    .locals 1

    .line 1
    iget v0, p0, Lf4;->b:I

    .line 2
    .line 3
    iget-object p0, p0, Lf4;->c:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast p0, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-ge v0, p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public d()V
    .locals 4

    .line 1
    sget-object v0, Luj;->c:Luj;

    .line 2
    .line 3
    iget-object p0, p0, Lf4;->c:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast p0, [C

    .line 6
    .line 7
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    monitor-enter v0

    .line 14
    :try_start_0
    iget v1, v0, Luj;->b:I

    .line 15
    .line 16
    array-length v2, p0

    .line 17
    add-int/2addr v2, v1

    .line 18
    sget v3, Lea;->a:I

    .line 19
    .line 20
    if-ge v2, v3, :cond_0

    .line 21
    .line 22
    array-length v2, p0

    .line 23
    add-int/2addr v1, v2

    .line 24
    iput v1, v0, Luj;->b:I

    .line 25
    .line 26
    iget-object v1, v0, Luj;->a:Laa;

    .line 27
    .line 28
    invoke-virtual {v1, p0}, Laa;->addLast(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :catchall_0
    move-exception p0

    .line 33
    goto :goto_1

    .line 34
    :cond_0
    :goto_0
    monitor-exit v0

    .line 35
    return-void

    .line 36
    :goto_1
    monitor-exit v0

    .line 37
    throw p0
.end method

.method public e(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lf4;->c:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Lb4;

    .line 4
    .line 5
    iput-object p1, p0, Lb4;->i:Ljava/lang/CharSequence;

    .line 6
    .line 7
    iput-object p2, p0, Lb4;->j:Landroid/content/DialogInterface$OnClickListener;

    .line 8
    .line 9
    return-void
.end method

.method public f(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lf4;->c:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Lb4;

    .line 4
    .line 5
    iput-object p1, p0, Lb4;->g:Ljava/lang/CharSequence;

    .line 6
    .line 7
    iput-object p2, p0, Lb4;->h:Landroid/content/DialogInterface$OnClickListener;

    .line 8
    .line 9
    return-void
.end method

.method public g()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lf4;->a()Lg4;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/app/Dialog;->show()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public h(Ljava/lang/String;)V
    .locals 5

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget v1, p0, Lf4;->b:I

    .line 12
    .line 13
    invoke-virtual {p0, v1, v0}, Lf4;->b(II)V

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Lf4;->c:Ljava/lang/Object;

    .line 17
    .line 18
    check-cast v1, [C

    .line 19
    .line 20
    iget v2, p0, Lf4;->b:I

    .line 21
    .line 22
    const/4 v3, 0x0

    .line 23
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 24
    .line 25
    .line 26
    move-result v4

    .line 27
    invoke-virtual {p1, v3, v4, v1, v2}, Ljava/lang/String;->getChars(II[CI)V

    .line 28
    .line 29
    .line 30
    iget p1, p0, Lf4;->b:I

    .line 31
    .line 32
    add-int/2addr p1, v0

    .line 33
    iput p1, p0, Lf4;->b:I

    .line 34
    .line 35
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    iget v0, p0, Lf4;->a:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0

    .line 11
    :pswitch_0
    new-instance v0, Ljava/lang/String;

    .line 12
    .line 13
    iget-object v1, p0, Lf4;->c:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast v1, [C

    .line 16
    .line 17
    const/4 v2, 0x0

    .line 18
    iget p0, p0, Lf4;->b:I

    .line 19
    .line 20
    invoke-direct {v0, v1, v2, p0}, Ljava/lang/String;-><init>([CII)V

    .line 21
    .line 22
    .line 23
    return-object v0

    .line 24
    nop

    .line 25
    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_0
    .end packed-switch
.end method
