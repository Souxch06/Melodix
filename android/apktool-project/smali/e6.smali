.class public abstract Le6;
.super Landroidx/activity/a;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lh6;


# instance fields
.field public final A:Lbv1;

.field public final B:Landroidx/lifecycle/a;

.field public C:Z

.field public D:Z

.field public E:Z

.field public F:Lg7;


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Landroidx/activity/a;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lj70;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Lj70;-><init>(Le6;)V

    .line 7
    .line 8
    .line 9
    new-instance v1, Lbv1;

    .line 10
    .line 11
    const/16 v2, 0x15

    .line 12
    .line 13
    invoke-direct {v1, v2, v0}, Lbv1;-><init>(ILjava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    iput-object v1, p0, Le6;->A:Lbv1;

    .line 17
    .line 18
    new-instance v0, Landroidx/lifecycle/a;

    .line 19
    .line 20
    invoke-direct {v0, p0}, Landroidx/lifecycle/a;-><init>(Lci0;)V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Le6;->B:Landroidx/lifecycle/a;

    .line 24
    .line 25
    const/4 v0, 0x1

    .line 26
    iput-boolean v0, p0, Le6;->E:Z

    .line 27
    .line 28
    iget-object v1, p0, Landroidx/activity/a;->n:Lo80;

    .line 29
    .line 30
    iget-object v1, v1, Lo80;->c:Ljava/lang/Object;

    .line 31
    .line 32
    check-cast v1, Lk6;

    .line 33
    .line 34
    new-instance v2, Lyl;

    .line 35
    .line 36
    invoke-direct {v2, v0, p0}, Lyl;-><init>(ILjava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    const-string v3, "android:support:lifecycle"

    .line 40
    .line 41
    invoke-virtual {v1, v3, v2}, Lk6;->e(Ljava/lang/String;Ly21;)V

    .line 42
    .line 43
    .line 44
    new-instance v1, Li70;

    .line 45
    .line 46
    const/4 v2, 0x0

    .line 47
    invoke-direct {v1, p0, v2}, Li70;-><init>(Le6;I)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0, v1}, Landroidx/activity/a;->g(Lsp;)V

    .line 51
    .line 52
    .line 53
    new-instance v1, Li70;

    .line 54
    .line 55
    invoke-direct {v1, p0, v0}, Li70;-><init>(Le6;I)V

    .line 56
    .line 57
    .line 58
    iget-object v2, p0, Landroidx/activity/a;->v:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 59
    .line 60
    invoke-virtual {v2, v1}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    new-instance v1, Lzl;

    .line 64
    .line 65
    invoke-direct {v1, p0, v0}, Lzl;-><init>(Le6;I)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0, v1}, Landroidx/activity/a;->h(Lxr0;)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Landroidx/activity/a;->n:Lo80;

    .line 72
    .line 73
    iget-object v0, v0, Lo80;->c:Ljava/lang/Object;

    .line 74
    .line 75
    check-cast v0, Lk6;

    .line 76
    .line 77
    new-instance v1, Lc6;

    .line 78
    .line 79
    invoke-direct {v1, p0}, Lc6;-><init>(Le6;)V

    .line 80
    .line 81
    .line 82
    const-string v2, "androidx:appcompat"

    .line 83
    .line 84
    invoke-virtual {v0, v2, v1}, Lk6;->e(Ljava/lang/String;Ly21;)V

    .line 85
    .line 86
    .line 87
    new-instance v0, Ld6;

    .line 88
    .line 89
    invoke-direct {v0, p0}, Ld6;-><init>(Le6;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {p0, v0}, Landroidx/activity/a;->h(Lxr0;)V

    .line 93
    .line 94
    .line 95
    return-void
.end method

.method public static m(Lz70;)Z
    .locals 7

    .line 1
    iget-object p0, p0, Lz70;->c:Ler0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ler0;->l()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const/4 v0, 0x0

    .line 12
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_5

    .line 17
    .line 18
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Lh70;

    .line 23
    .line 24
    if-nez v1, :cond_1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    iget-object v2, v1, Lh70;->B:Lj70;

    .line 28
    .line 29
    if-nez v2, :cond_2

    .line 30
    .line 31
    const/4 v2, 0x0

    .line 32
    goto :goto_1

    .line 33
    :cond_2
    iget-object v2, v2, Lj70;->B:Le6;

    .line 34
    .line 35
    :goto_1
    if-eqz v2, :cond_3

    .line 36
    .line 37
    invoke-virtual {v1}, Lh70;->h()Lz70;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-static {v2}, Le6;->m(Lz70;)Z

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    or-int/2addr v0, v2

    .line 46
    :cond_3
    iget-object v2, v1, Lh70;->X:Lj80;

    .line 47
    .line 48
    const-string v3, "setCurrentState"

    .line 49
    .line 50
    sget-object v4, Lwh0;->l:Lwh0;

    .line 51
    .line 52
    const/4 v5, 0x1

    .line 53
    sget-object v6, Lwh0;->m:Lwh0;

    .line 54
    .line 55
    if-eqz v2, :cond_4

    .line 56
    .line 57
    invoke-virtual {v2}, Lj80;->f()V

    .line 58
    .line 59
    .line 60
    iget-object v2, v2, Lj80;->l:Landroidx/lifecycle/a;

    .line 61
    .line 62
    iget-object v2, v2, Landroidx/lifecycle/a;->b:Lwh0;

    .line 63
    .line 64
    invoke-virtual {v2, v6}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    .line 65
    .line 66
    .line 67
    move-result v2

    .line 68
    if-ltz v2, :cond_4

    .line 69
    .line 70
    iget-object v0, v1, Lh70;->X:Lj80;

    .line 71
    .line 72
    iget-object v0, v0, Lj80;->l:Landroidx/lifecycle/a;

    .line 73
    .line 74
    invoke-virtual {v0, v3}, Landroidx/lifecycle/a;->c(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v0, v4}, Landroidx/lifecycle/a;->e(Lwh0;)V

    .line 78
    .line 79
    .line 80
    move v0, v5

    .line 81
    :cond_4
    iget-object v2, v1, Lh70;->W:Landroidx/lifecycle/a;

    .line 82
    .line 83
    iget-object v2, v2, Landroidx/lifecycle/a;->b:Lwh0;

    .line 84
    .line 85
    invoke-virtual {v2, v6}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    .line 86
    .line 87
    .line 88
    move-result v2

    .line 89
    if-ltz v2, :cond_0

    .line 90
    .line 91
    iget-object v0, v1, Lh70;->W:Landroidx/lifecycle/a;

    .line 92
    .line 93
    invoke-virtual {v0, v3}, Landroidx/lifecycle/a;->c(Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {v0, v4}, Landroidx/lifecycle/a;->e(Lwh0;)V

    .line 97
    .line 98
    .line 99
    move v0, v5

    .line 100
    goto :goto_0

    .line 101
    :cond_5
    return v0
.end method


# virtual methods
.method public final addContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroidx/activity/a;->j()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Le6;->k()Lq6;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    check-cast p0, Lg7;

    .line 9
    .line 10
    invoke-virtual {p0}, Lg7;->u()V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lg7;->J:Landroid/view/ViewGroup;

    .line 14
    .line 15
    const v1, 0x1020002

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Landroid/view/ViewGroup;

    .line 23
    .line 24
    invoke-virtual {v0, p1, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Lg7;->v:La7;

    .line 28
    .line 29
    iget-object p0, p0, Lg7;->u:Landroid/view/Window;

    .line 30
    .line 31
    invoke-virtual {p0}, Landroid/view/Window;->getCallback()Landroid/view/Window$Callback;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p1, p0}, La7;->a(Landroid/view/Window$Callback;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final attachBaseContext(Landroid/content/Context;)V
    .locals 9

    .line 1
    invoke-virtual {p0}, Le6;->k()Lq6;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Lg7;

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    iput-boolean v1, v0, Lg7;->X:Z

    .line 9
    .line 10
    iget v2, v0, Lg7;->b0:I

    .line 11
    .line 12
    const/16 v3, -0x64

    .line 13
    .line 14
    if-eq v2, v3, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    sget v2, Lq6;->k:I

    .line 18
    .line 19
    :goto_0
    invoke-virtual {v0, p1, v2}, Lg7;->A(Landroid/content/Context;I)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    invoke-static {p1}, Lq6;->a(Landroid/content/Context;)Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    const/4 v3, 0x0

    .line 28
    if-eqz v2, :cond_7

    .line 29
    .line 30
    invoke-static {p1}, Lq6;->a(Landroid/content/Context;)Z

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    if-nez v2, :cond_1

    .line 35
    .line 36
    goto :goto_4

    .line 37
    :cond_1
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 38
    .line 39
    const/16 v4, 0x21

    .line 40
    .line 41
    if-lt v2, v4, :cond_2

    .line 42
    .line 43
    sget-boolean v2, Lq6;->o:Z

    .line 44
    .line 45
    if-nez v2, :cond_7

    .line 46
    .line 47
    sget-object v2, Lq6;->j:Lp6;

    .line 48
    .line 49
    new-instance v4, Ll6;

    .line 50
    .line 51
    invoke-direct {v4, p1, v3}, Ll6;-><init>(Landroid/content/Context;I)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v2, v4}, Lp6;->execute(Ljava/lang/Runnable;)V

    .line 55
    .line 56
    .line 57
    goto :goto_4

    .line 58
    :cond_2
    sget-object v2, Lq6;->r:Ljava/lang/Object;

    .line 59
    .line 60
    monitor-enter v2

    .line 61
    :try_start_0
    sget-object v4, Lq6;->l:Lbk0;

    .line 62
    .line 63
    if-nez v4, :cond_5

    .line 64
    .line 65
    sget-object v4, Lq6;->m:Lbk0;

    .line 66
    .line 67
    if-nez v4, :cond_3

    .line 68
    .line 69
    invoke-static {p1}, Lbh;->z(Landroid/content/Context;)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v4

    .line 73
    invoke-static {v4}, Lbk0;->a(Ljava/lang/String;)Lbk0;

    .line 74
    .line 75
    .line 76
    move-result-object v4

    .line 77
    sput-object v4, Lq6;->m:Lbk0;

    .line 78
    .line 79
    goto :goto_1

    .line 80
    :catchall_0
    move-exception p0

    .line 81
    goto :goto_3

    .line 82
    :cond_3
    :goto_1
    iget-object v4, v4, Lbk0;->a:Lck0;

    .line 83
    .line 84
    iget-object v4, v4, Lck0;->a:Landroid/os/LocaleList;

    .line 85
    .line 86
    invoke-virtual {v4}, Landroid/os/LocaleList;->isEmpty()Z

    .line 87
    .line 88
    .line 89
    move-result v4

    .line 90
    if-eqz v4, :cond_4

    .line 91
    .line 92
    monitor-exit v2

    .line 93
    goto :goto_4

    .line 94
    :cond_4
    sget-object v4, Lq6;->m:Lbk0;

    .line 95
    .line 96
    sput-object v4, Lq6;->l:Lbk0;

    .line 97
    .line 98
    goto :goto_2

    .line 99
    :cond_5
    sget-object v5, Lq6;->m:Lbk0;

    .line 100
    .line 101
    invoke-virtual {v4, v5}, Lbk0;->equals(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    move-result v4

    .line 105
    if-nez v4, :cond_6

    .line 106
    .line 107
    sget-object v4, Lq6;->l:Lbk0;

    .line 108
    .line 109
    sput-object v4, Lq6;->m:Lbk0;

    .line 110
    .line 111
    iget-object v4, v4, Lbk0;->a:Lck0;

    .line 112
    .line 113
    iget-object v4, v4, Lck0;->a:Landroid/os/LocaleList;

    .line 114
    .line 115
    invoke-virtual {v4}, Landroid/os/LocaleList;->toLanguageTags()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v4

    .line 119
    invoke-static {p1, v4}, Lbh;->y(Landroid/content/Context;Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    :cond_6
    :goto_2
    monitor-exit v2

    .line 123
    goto :goto_4

    .line 124
    :goto_3
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 125
    throw p0

    .line 126
    :cond_7
    :goto_4
    invoke-static {p1}, Lg7;->n(Landroid/content/Context;)Lbk0;

    .line 127
    .line 128
    .line 129
    move-result-object v2

    .line 130
    instance-of v4, p1, Landroid/view/ContextThemeWrapper;

    .line 131
    .line 132
    const/4 v5, 0x0

    .line 133
    if-eqz v4, :cond_8

    .line 134
    .line 135
    invoke-static {p1, v0, v2, v5, v3}, Lg7;->r(Landroid/content/Context;ILbk0;Landroid/content/res/Configuration;Z)Landroid/content/res/Configuration;

    .line 136
    .line 137
    .line 138
    move-result-object v4

    .line 139
    :try_start_1
    move-object v6, p1

    .line 140
    check-cast v6, Landroid/view/ContextThemeWrapper;

    .line 141
    .line 142
    invoke-virtual {v6, v4}, Landroid/view/ContextThemeWrapper;->applyOverrideConfiguration(Landroid/content/res/Configuration;)V
    :try_end_1
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_0

    .line 143
    .line 144
    .line 145
    goto/16 :goto_a

    .line 146
    .line 147
    :catch_0
    :cond_8
    instance-of v4, p1, Lhq;

    .line 148
    .line 149
    if-eqz v4, :cond_9

    .line 150
    .line 151
    invoke-static {p1, v0, v2, v5, v3}, Lg7;->r(Landroid/content/Context;ILbk0;Landroid/content/res/Configuration;Z)Landroid/content/res/Configuration;

    .line 152
    .line 153
    .line 154
    move-result-object v3

    .line 155
    :try_start_2
    move-object v4, p1

    .line 156
    check-cast v4, Lhq;

    .line 157
    .line 158
    invoke-virtual {v4, v3}, Lhq;->a(Landroid/content/res/Configuration;)V
    :try_end_2
    .catch Ljava/lang/IllegalStateException; {:try_start_2 .. :try_end_2} :catch_1

    .line 159
    .line 160
    .line 161
    goto/16 :goto_a

    .line 162
    .line 163
    :catch_1
    :cond_9
    sget-boolean v3, Lg7;->s0:Z

    .line 164
    .line 165
    if-nez v3, :cond_a

    .line 166
    .line 167
    goto/16 :goto_a

    .line 168
    .line 169
    :cond_a
    new-instance v3, Landroid/content/res/Configuration;

    .line 170
    .line 171
    invoke-direct {v3}, Landroid/content/res/Configuration;-><init>()V

    .line 172
    .line 173
    .line 174
    const/4 v4, -0x1

    .line 175
    iput v4, v3, Landroid/content/res/Configuration;->uiMode:I

    .line 176
    .line 177
    const/4 v4, 0x0

    .line 178
    iput v4, v3, Landroid/content/res/Configuration;->fontScale:F

    .line 179
    .line 180
    invoke-virtual {p1, v3}, Landroid/content/Context;->createConfigurationContext(Landroid/content/res/Configuration;)Landroid/content/Context;

    .line 181
    .line 182
    .line 183
    move-result-object v3

    .line 184
    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 185
    .line 186
    .line 187
    move-result-object v3

    .line 188
    invoke-virtual {v3}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 189
    .line 190
    .line 191
    move-result-object v3

    .line 192
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 193
    .line 194
    .line 195
    move-result-object v6

    .line 196
    invoke-virtual {v6}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 197
    .line 198
    .line 199
    move-result-object v6

    .line 200
    iget v7, v6, Landroid/content/res/Configuration;->uiMode:I

    .line 201
    .line 202
    iput v7, v3, Landroid/content/res/Configuration;->uiMode:I

    .line 203
    .line 204
    invoke-virtual {v3, v6}, Landroid/content/res/Configuration;->equals(Landroid/content/res/Configuration;)Z

    .line 205
    .line 206
    .line 207
    move-result v7

    .line 208
    if-nez v7, :cond_20

    .line 209
    .line 210
    new-instance v7, Landroid/content/res/Configuration;

    .line 211
    .line 212
    invoke-direct {v7}, Landroid/content/res/Configuration;-><init>()V

    .line 213
    .line 214
    .line 215
    iput v4, v7, Landroid/content/res/Configuration;->fontScale:F

    .line 216
    .line 217
    invoke-virtual {v3, v6}, Landroid/content/res/Configuration;->diff(Landroid/content/res/Configuration;)I

    .line 218
    .line 219
    .line 220
    move-result v4

    .line 221
    if-nez v4, :cond_b

    .line 222
    .line 223
    goto/16 :goto_5

    .line 224
    .line 225
    :cond_b
    iget v4, v3, Landroid/content/res/Configuration;->fontScale:F

    .line 226
    .line 227
    iget v8, v6, Landroid/content/res/Configuration;->fontScale:F

    .line 228
    .line 229
    cmpl-float v4, v4, v8

    .line 230
    .line 231
    if-eqz v4, :cond_c

    .line 232
    .line 233
    iput v8, v7, Landroid/content/res/Configuration;->fontScale:F

    .line 234
    .line 235
    :cond_c
    iget v4, v3, Landroid/content/res/Configuration;->mcc:I

    .line 236
    .line 237
    iget v8, v6, Landroid/content/res/Configuration;->mcc:I

    .line 238
    .line 239
    if-eq v4, v8, :cond_d

    .line 240
    .line 241
    iput v8, v7, Landroid/content/res/Configuration;->mcc:I

    .line 242
    .line 243
    :cond_d
    iget v4, v3, Landroid/content/res/Configuration;->mnc:I

    .line 244
    .line 245
    iget v8, v6, Landroid/content/res/Configuration;->mnc:I

    .line 246
    .line 247
    if-eq v4, v8, :cond_e

    .line 248
    .line 249
    iput v8, v7, Landroid/content/res/Configuration;->mnc:I

    .line 250
    .line 251
    :cond_e
    invoke-static {v3, v6, v7}, Lx6;->a(Landroid/content/res/Configuration;Landroid/content/res/Configuration;Landroid/content/res/Configuration;)V

    .line 252
    .line 253
    .line 254
    iget v4, v3, Landroid/content/res/Configuration;->touchscreen:I

    .line 255
    .line 256
    iget v8, v6, Landroid/content/res/Configuration;->touchscreen:I

    .line 257
    .line 258
    if-eq v4, v8, :cond_f

    .line 259
    .line 260
    iput v8, v7, Landroid/content/res/Configuration;->touchscreen:I

    .line 261
    .line 262
    :cond_f
    iget v4, v3, Landroid/content/res/Configuration;->keyboard:I

    .line 263
    .line 264
    iget v8, v6, Landroid/content/res/Configuration;->keyboard:I

    .line 265
    .line 266
    if-eq v4, v8, :cond_10

    .line 267
    .line 268
    iput v8, v7, Landroid/content/res/Configuration;->keyboard:I

    .line 269
    .line 270
    :cond_10
    iget v4, v3, Landroid/content/res/Configuration;->keyboardHidden:I

    .line 271
    .line 272
    iget v8, v6, Landroid/content/res/Configuration;->keyboardHidden:I

    .line 273
    .line 274
    if-eq v4, v8, :cond_11

    .line 275
    .line 276
    iput v8, v7, Landroid/content/res/Configuration;->keyboardHidden:I

    .line 277
    .line 278
    :cond_11
    iget v4, v3, Landroid/content/res/Configuration;->navigation:I

    .line 279
    .line 280
    iget v8, v6, Landroid/content/res/Configuration;->navigation:I

    .line 281
    .line 282
    if-eq v4, v8, :cond_12

    .line 283
    .line 284
    iput v8, v7, Landroid/content/res/Configuration;->navigation:I

    .line 285
    .line 286
    :cond_12
    iget v4, v3, Landroid/content/res/Configuration;->navigationHidden:I

    .line 287
    .line 288
    iget v8, v6, Landroid/content/res/Configuration;->navigationHidden:I

    .line 289
    .line 290
    if-eq v4, v8, :cond_13

    .line 291
    .line 292
    iput v8, v7, Landroid/content/res/Configuration;->navigationHidden:I

    .line 293
    .line 294
    :cond_13
    iget v4, v3, Landroid/content/res/Configuration;->orientation:I

    .line 295
    .line 296
    iget v8, v6, Landroid/content/res/Configuration;->orientation:I

    .line 297
    .line 298
    if-eq v4, v8, :cond_14

    .line 299
    .line 300
    iput v8, v7, Landroid/content/res/Configuration;->orientation:I

    .line 301
    .line 302
    :cond_14
    iget v4, v3, Landroid/content/res/Configuration;->screenLayout:I

    .line 303
    .line 304
    and-int/lit8 v4, v4, 0xf

    .line 305
    .line 306
    iget v8, v6, Landroid/content/res/Configuration;->screenLayout:I

    .line 307
    .line 308
    and-int/lit8 v8, v8, 0xf

    .line 309
    .line 310
    if-eq v4, v8, :cond_15

    .line 311
    .line 312
    iget v4, v7, Landroid/content/res/Configuration;->screenLayout:I

    .line 313
    .line 314
    or-int/2addr v4, v8

    .line 315
    iput v4, v7, Landroid/content/res/Configuration;->screenLayout:I

    .line 316
    .line 317
    :cond_15
    iget v4, v3, Landroid/content/res/Configuration;->screenLayout:I

    .line 318
    .line 319
    and-int/lit16 v4, v4, 0xc0

    .line 320
    .line 321
    iget v8, v6, Landroid/content/res/Configuration;->screenLayout:I

    .line 322
    .line 323
    and-int/lit16 v8, v8, 0xc0

    .line 324
    .line 325
    if-eq v4, v8, :cond_16

    .line 326
    .line 327
    iget v4, v7, Landroid/content/res/Configuration;->screenLayout:I

    .line 328
    .line 329
    or-int/2addr v4, v8

    .line 330
    iput v4, v7, Landroid/content/res/Configuration;->screenLayout:I

    .line 331
    .line 332
    :cond_16
    iget v4, v3, Landroid/content/res/Configuration;->screenLayout:I

    .line 333
    .line 334
    and-int/lit8 v4, v4, 0x30

    .line 335
    .line 336
    iget v8, v6, Landroid/content/res/Configuration;->screenLayout:I

    .line 337
    .line 338
    and-int/lit8 v8, v8, 0x30

    .line 339
    .line 340
    if-eq v4, v8, :cond_17

    .line 341
    .line 342
    iget v4, v7, Landroid/content/res/Configuration;->screenLayout:I

    .line 343
    .line 344
    or-int/2addr v4, v8

    .line 345
    iput v4, v7, Landroid/content/res/Configuration;->screenLayout:I

    .line 346
    .line 347
    :cond_17
    iget v4, v3, Landroid/content/res/Configuration;->screenLayout:I

    .line 348
    .line 349
    and-int/lit16 v4, v4, 0x300

    .line 350
    .line 351
    iget v8, v6, Landroid/content/res/Configuration;->screenLayout:I

    .line 352
    .line 353
    and-int/lit16 v8, v8, 0x300

    .line 354
    .line 355
    if-eq v4, v8, :cond_18

    .line 356
    .line 357
    iget v4, v7, Landroid/content/res/Configuration;->screenLayout:I

    .line 358
    .line 359
    or-int/2addr v4, v8

    .line 360
    iput v4, v7, Landroid/content/res/Configuration;->screenLayout:I

    .line 361
    .line 362
    :cond_18
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 363
    .line 364
    const/16 v8, 0x1a

    .line 365
    .line 366
    if-lt v4, v8, :cond_1a

    .line 367
    .line 368
    invoke-static {v3}, Li1;->a(Landroid/content/res/Configuration;)I

    .line 369
    .line 370
    .line 371
    move-result v4

    .line 372
    and-int/lit8 v4, v4, 0x3

    .line 373
    .line 374
    invoke-static {v6}, Li1;->a(Landroid/content/res/Configuration;)I

    .line 375
    .line 376
    .line 377
    move-result v8

    .line 378
    and-int/lit8 v8, v8, 0x3

    .line 379
    .line 380
    if-eq v4, v8, :cond_19

    .line 381
    .line 382
    invoke-static {v7}, Li1;->a(Landroid/content/res/Configuration;)I

    .line 383
    .line 384
    .line 385
    move-result v4

    .line 386
    invoke-static {v6}, Li1;->a(Landroid/content/res/Configuration;)I

    .line 387
    .line 388
    .line 389
    move-result v8

    .line 390
    and-int/lit8 v8, v8, 0x3

    .line 391
    .line 392
    or-int/2addr v4, v8

    .line 393
    invoke-static {v7, v4}, Li1;->p(Landroid/content/res/Configuration;I)V

    .line 394
    .line 395
    .line 396
    :cond_19
    invoke-static {v3}, Li1;->a(Landroid/content/res/Configuration;)I

    .line 397
    .line 398
    .line 399
    move-result v4

    .line 400
    and-int/lit8 v4, v4, 0xc

    .line 401
    .line 402
    invoke-static {v6}, Li1;->a(Landroid/content/res/Configuration;)I

    .line 403
    .line 404
    .line 405
    move-result v8

    .line 406
    and-int/lit8 v8, v8, 0xc

    .line 407
    .line 408
    if-eq v4, v8, :cond_1a

    .line 409
    .line 410
    invoke-static {v7}, Li1;->a(Landroid/content/res/Configuration;)I

    .line 411
    .line 412
    .line 413
    move-result v4

    .line 414
    invoke-static {v6}, Li1;->a(Landroid/content/res/Configuration;)I

    .line 415
    .line 416
    .line 417
    move-result v8

    .line 418
    and-int/lit8 v8, v8, 0xc

    .line 419
    .line 420
    or-int/2addr v4, v8

    .line 421
    invoke-static {v7, v4}, Li1;->p(Landroid/content/res/Configuration;I)V

    .line 422
    .line 423
    .line 424
    :cond_1a
    iget v4, v3, Landroid/content/res/Configuration;->uiMode:I

    .line 425
    .line 426
    and-int/lit8 v4, v4, 0xf

    .line 427
    .line 428
    iget v8, v6, Landroid/content/res/Configuration;->uiMode:I

    .line 429
    .line 430
    and-int/lit8 v8, v8, 0xf

    .line 431
    .line 432
    if-eq v4, v8, :cond_1b

    .line 433
    .line 434
    iget v4, v7, Landroid/content/res/Configuration;->uiMode:I

    .line 435
    .line 436
    or-int/2addr v4, v8

    .line 437
    iput v4, v7, Landroid/content/res/Configuration;->uiMode:I

    .line 438
    .line 439
    :cond_1b
    iget v4, v3, Landroid/content/res/Configuration;->uiMode:I

    .line 440
    .line 441
    and-int/lit8 v4, v4, 0x30

    .line 442
    .line 443
    iget v8, v6, Landroid/content/res/Configuration;->uiMode:I

    .line 444
    .line 445
    and-int/lit8 v8, v8, 0x30

    .line 446
    .line 447
    if-eq v4, v8, :cond_1c

    .line 448
    .line 449
    iget v4, v7, Landroid/content/res/Configuration;->uiMode:I

    .line 450
    .line 451
    or-int/2addr v4, v8

    .line 452
    iput v4, v7, Landroid/content/res/Configuration;->uiMode:I

    .line 453
    .line 454
    :cond_1c
    iget v4, v3, Landroid/content/res/Configuration;->screenWidthDp:I

    .line 455
    .line 456
    iget v8, v6, Landroid/content/res/Configuration;->screenWidthDp:I

    .line 457
    .line 458
    if-eq v4, v8, :cond_1d

    .line 459
    .line 460
    iput v8, v7, Landroid/content/res/Configuration;->screenWidthDp:I

    .line 461
    .line 462
    :cond_1d
    iget v4, v3, Landroid/content/res/Configuration;->screenHeightDp:I

    .line 463
    .line 464
    iget v8, v6, Landroid/content/res/Configuration;->screenHeightDp:I

    .line 465
    .line 466
    if-eq v4, v8, :cond_1e

    .line 467
    .line 468
    iput v8, v7, Landroid/content/res/Configuration;->screenHeightDp:I

    .line 469
    .line 470
    :cond_1e
    iget v4, v3, Landroid/content/res/Configuration;->smallestScreenWidthDp:I

    .line 471
    .line 472
    iget v8, v6, Landroid/content/res/Configuration;->smallestScreenWidthDp:I

    .line 473
    .line 474
    if-eq v4, v8, :cond_1f

    .line 475
    .line 476
    iput v8, v7, Landroid/content/res/Configuration;->smallestScreenWidthDp:I

    .line 477
    .line 478
    :cond_1f
    iget v3, v3, Landroid/content/res/Configuration;->densityDpi:I

    .line 479
    .line 480
    iget v4, v6, Landroid/content/res/Configuration;->densityDpi:I

    .line 481
    .line 482
    if-eq v3, v4, :cond_21

    .line 483
    .line 484
    iput v4, v7, Landroid/content/res/Configuration;->densityDpi:I

    .line 485
    .line 486
    goto :goto_5

    .line 487
    :cond_20
    move-object v7, v5

    .line 488
    :cond_21
    :goto_5
    invoke-static {p1, v0, v2, v7, v1}, Lg7;->r(Landroid/content/Context;ILbk0;Landroid/content/res/Configuration;Z)Landroid/content/res/Configuration;

    .line 489
    .line 490
    .line 491
    move-result-object v0

    .line 492
    new-instance v2, Lhq;

    .line 493
    .line 494
    const v3, 0x7f12023d

    .line 495
    .line 496
    .line 497
    invoke-direct {v2, p1, v3}, Lhq;-><init>(Landroid/content/Context;I)V

    .line 498
    .line 499
    .line 500
    invoke-virtual {v2, v0}, Lhq;->a(Landroid/content/res/Configuration;)V

    .line 501
    .line 502
    .line 503
    :try_start_3
    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    .line 504
    .line 505
    .line 506
    move-result-object p1
    :try_end_3
    .catch Ljava/lang/NullPointerException; {:try_start_3 .. :try_end_3} :catch_4

    .line 507
    if-eqz p1, :cond_25

    .line 508
    .line 509
    invoke-virtual {v2}, Lhq;->getTheme()Landroid/content/res/Resources$Theme;

    .line 510
    .line 511
    .line 512
    move-result-object p1

    .line 513
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 514
    .line 515
    const/16 v3, 0x1d

    .line 516
    .line 517
    if-lt v0, v3, :cond_22

    .line 518
    .line 519
    invoke-static {p1}, Lb11;->a(Landroid/content/res/Resources$Theme;)V

    .line 520
    .line 521
    .line 522
    goto :goto_9

    .line 523
    :cond_22
    sget-object v0, Lkp1;->c:Ljava/lang/Object;

    .line 524
    .line 525
    monitor-enter v0

    .line 526
    :try_start_4
    sget-boolean v3, Lkp1;->e:Z
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 527
    .line 528
    if-nez v3, :cond_23

    .line 529
    .line 530
    :try_start_5
    const-class v3, Landroid/content/res/Resources$Theme;

    .line 531
    .line 532
    const-string v4, "rebase"

    .line 533
    .line 534
    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 535
    .line 536
    .line 537
    move-result-object v3

    .line 538
    sput-object v3, Lkp1;->d:Ljava/lang/reflect/Method;

    .line 539
    .line 540
    invoke-virtual {v3, v1}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V
    :try_end_5
    .catch Ljava/lang/NoSuchMethodException; {:try_start_5 .. :try_end_5} :catch_2
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 541
    .line 542
    .line 543
    goto :goto_6

    .line 544
    :catchall_1
    move-exception p0

    .line 545
    goto :goto_8

    .line 546
    :catch_2
    :goto_6
    :try_start_6
    sput-boolean v1, Lkp1;->e:Z

    .line 547
    .line 548
    :cond_23
    sget-object v1, Lkp1;->d:Ljava/lang/reflect/Method;
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 549
    .line 550
    if-eqz v1, :cond_24

    .line 551
    .line 552
    :try_start_7
    invoke-virtual {v1, p1, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_7
    .catch Ljava/lang/IllegalAccessException; {:try_start_7 .. :try_end_7} :catch_3
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_7 .. :try_end_7} :catch_3
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 553
    .line 554
    .line 555
    goto :goto_7

    .line 556
    :catch_3
    :try_start_8
    sput-object v5, Lkp1;->d:Ljava/lang/reflect/Method;

    .line 557
    .line 558
    :cond_24
    :goto_7
    monitor-exit v0

    .line 559
    goto :goto_9

    .line 560
    :goto_8
    monitor-exit v0
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    .line 561
    throw p0

    .line 562
    :catch_4
    :cond_25
    :goto_9
    move-object p1, v2

    .line 563
    :goto_a
    invoke-super {p0, p1}, Landroid/content/ContextWrapper;->attachBaseContext(Landroid/content/Context;)V

    .line 564
    .line 565
    .line 566
    return-void
.end method

.method public final closeOptionsMenu()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Le6;->k()Lq6;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Lg7;

    .line 6
    .line 7
    invoke-virtual {v0}, Lg7;->y()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-virtual {v0, v1}, Landroid/view/Window;->hasFeature(I)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-super {p0}, Landroid/app/Activity;->closeOptionsMenu()V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public final dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Le6;->k()Lq6;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Lg7;

    .line 9
    .line 10
    invoke-virtual {v0}, Lg7;->y()V

    .line 11
    .line 12
    .line 13
    invoke-super {p0, p1}, Lfm;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public final dump(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .locals 7

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/app/Activity;->dump(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    if-eqz p4, :cond_5

    .line 6
    .line 7
    array-length v1, p4

    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    goto :goto_1

    .line 11
    :cond_0
    aget-object v1, p4, v0

    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    sparse-switch v2, :sswitch_data_0

    .line 18
    .line 19
    .line 20
    goto :goto_1

    .line 21
    :sswitch_0
    const-string v2, "--autofill"

    .line 22
    .line 23
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-nez v1, :cond_1

    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_1
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 31
    .line 32
    const/16 v2, 0x1a

    .line 33
    .line 34
    if-lt v1, v2, :cond_5

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :sswitch_1
    const-string v2, "--contentcapture"

    .line 38
    .line 39
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-nez v1, :cond_2

    .line 44
    .line 45
    goto :goto_1

    .line 46
    :cond_2
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 47
    .line 48
    const/16 v2, 0x1d

    .line 49
    .line 50
    if-lt v1, v2, :cond_5

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :sswitch_2
    const-string v2, "--list-dumpables"

    .line 54
    .line 55
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    if-nez v1, :cond_3

    .line 60
    .line 61
    goto :goto_1

    .line 62
    :sswitch_3
    const-string v2, "--dump-dumpable"

    .line 63
    .line 64
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    if-nez v1, :cond_3

    .line 69
    .line 70
    goto :goto_1

    .line 71
    :cond_3
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 72
    .line 73
    const/16 v2, 0x21

    .line 74
    .line 75
    if-lt v1, v2, :cond_5

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :sswitch_4
    const-string v2, "--translation"

    .line 79
    .line 80
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    if-nez v1, :cond_4

    .line 85
    .line 86
    goto :goto_1

    .line 87
    :cond_4
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 88
    .line 89
    const/16 v2, 0x1f

    .line 90
    .line 91
    if-lt v1, v2, :cond_5

    .line 92
    .line 93
    :goto_0
    return-void

    .line 94
    :cond_5
    :goto_1
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    const-string v1, "Local FragmentActivity "

    .line 98
    .line 99
    invoke-virtual {p3, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 103
    .line 104
    .line 105
    move-result v1

    .line 106
    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    invoke-virtual {p3, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    const-string v1, " State:"

    .line 114
    .line 115
    invoke-virtual {p3, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    new-instance v1, Ljava/lang/StringBuilder;

    .line 119
    .line 120
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 121
    .line 122
    .line 123
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    const-string v2, "  "

    .line 127
    .line 128
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v1

    .line 135
    invoke-virtual {p3, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    const-string v2, "mCreated="

    .line 139
    .line 140
    invoke-virtual {p3, v2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 141
    .line 142
    .line 143
    iget-boolean v2, p0, Le6;->C:Z

    .line 144
    .line 145
    invoke-virtual {p3, v2}, Ljava/io/PrintWriter;->print(Z)V

    .line 146
    .line 147
    .line 148
    const-string v2, " mResumed="

    .line 149
    .line 150
    invoke-virtual {p3, v2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 151
    .line 152
    .line 153
    iget-boolean v2, p0, Le6;->D:Z

    .line 154
    .line 155
    invoke-virtual {p3, v2}, Ljava/io/PrintWriter;->print(Z)V

    .line 156
    .line 157
    .line 158
    const-string v2, " mStopped="

    .line 159
    .line 160
    invoke-virtual {p3, v2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 161
    .line 162
    .line 163
    iget-boolean v2, p0, Le6;->E:Z

    .line 164
    .line 165
    invoke-virtual {p3, v2}, Ljava/io/PrintWriter;->print(Z)V

    .line 166
    .line 167
    .line 168
    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    .line 169
    .line 170
    .line 171
    move-result-object v2

    .line 172
    if-eqz v2, :cond_b

    .line 173
    .line 174
    invoke-interface {p0}, Lii1;->d()Lhi1;

    .line 175
    .line 176
    .line 177
    move-result-object v2

    .line 178
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 179
    .line 180
    .line 181
    sget-object v3, Ldt;->k:Ldt;

    .line 182
    .line 183
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 184
    .line 185
    .line 186
    const-class v4, Lxj0;

    .line 187
    .line 188
    invoke-virtual {v4}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    .line 189
    .line 190
    .line 191
    move-result-object v5

    .line 192
    if-eqz v5, :cond_a

    .line 193
    .line 194
    const-string v6, "androidx.lifecycle.ViewModelProvider.DefaultKey:"

    .line 195
    .line 196
    invoke-virtual {v6, v5}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 197
    .line 198
    .line 199
    move-result-object v5

    .line 200
    iget-object v2, v2, Lhi1;->a:Ljava/util/LinkedHashMap;

    .line 201
    .line 202
    invoke-virtual {v2, v5}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 203
    .line 204
    .line 205
    move-result-object v6

    .line 206
    check-cast v6, Lfi1;

    .line 207
    .line 208
    invoke-virtual {v4, v6}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    .line 209
    .line 210
    .line 211
    move-result v4

    .line 212
    if-eqz v4, :cond_6

    .line 213
    .line 214
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 215
    .line 216
    .line 217
    goto :goto_4

    .line 218
    :cond_6
    new-instance v4, Ljava/util/LinkedHashMap;

    .line 219
    .line 220
    invoke-direct {v4}, Ljava/util/LinkedHashMap;-><init>()V

    .line 221
    .line 222
    .line 223
    iget-object v3, v3, Let;->j:Ljava/lang/Object;

    .line 224
    .line 225
    check-cast v3, Ljava/util/LinkedHashMap;

    .line 226
    .line 227
    invoke-interface {v4, v3}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 228
    .line 229
    .line 230
    sget-object v3, Lt11;->q:Lt11;

    .line 231
    .line 232
    invoke-interface {v4, v3, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 233
    .line 234
    .line 235
    :try_start_0
    new-instance v3, Lxj0;

    .line 236
    .line 237
    invoke-direct {v3}, Lxj0;-><init>()V
    :try_end_0
    .catch Ljava/lang/AbstractMethodError; {:try_start_0 .. :try_end_0} :catch_0

    .line 238
    .line 239
    .line 240
    :goto_2
    move-object v6, v3

    .line 241
    goto :goto_3

    .line 242
    :catch_0
    new-instance v3, Lxj0;

    .line 243
    .line 244
    invoke-direct {v3}, Lxj0;-><init>()V

    .line 245
    .line 246
    .line 247
    goto :goto_2

    .line 248
    :goto_3
    invoke-interface {v2, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 249
    .line 250
    .line 251
    move-result-object v2

    .line 252
    check-cast v2, Lfi1;

    .line 253
    .line 254
    if-eqz v2, :cond_7

    .line 255
    .line 256
    invoke-virtual {v2}, Lfi1;->a()V

    .line 257
    .line 258
    .line 259
    :cond_7
    :goto_4
    check-cast v6, Lxj0;

    .line 260
    .line 261
    iget-object v2, v6, Lxj0;->c:Lt81;

    .line 262
    .line 263
    iget v3, v2, Lt81;->l:I

    .line 264
    .line 265
    if-lez v3, :cond_b

    .line 266
    .line 267
    invoke-virtual {p3, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 268
    .line 269
    .line 270
    const-string v3, "Loaders:"

    .line 271
    .line 272
    invoke-virtual {p3, v3}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 273
    .line 274
    .line 275
    iget v3, v2, Lt81;->l:I

    .line 276
    .line 277
    if-gtz v3, :cond_8

    .line 278
    .line 279
    goto :goto_5

    .line 280
    :cond_8
    iget-object p0, v2, Lt81;->k:[Ljava/lang/Object;

    .line 281
    .line 282
    aget-object p0, p0, v0

    .line 283
    .line 284
    if-eqz p0, :cond_9

    .line 285
    .line 286
    invoke-static {}, Lz0;->a()V

    .line 287
    .line 288
    .line 289
    return-void

    .line 290
    :cond_9
    invoke-virtual {p3, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 291
    .line 292
    .line 293
    const-string p0, "  #"

    .line 294
    .line 295
    invoke-virtual {p3, p0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 296
    .line 297
    .line 298
    iget-object p0, v2, Lt81;->j:[I

    .line 299
    .line 300
    aget p0, p0, v0

    .line 301
    .line 302
    invoke-virtual {p3, p0}, Ljava/io/PrintWriter;->print(I)V

    .line 303
    .line 304
    .line 305
    const-string p0, ": "

    .line 306
    .line 307
    invoke-virtual {p3, p0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 308
    .line 309
    .line 310
    const/4 p0, 0x0

    .line 311
    throw p0

    .line 312
    :cond_a
    const-string p0, "Local and anonymous classes can not be ViewModels"

    .line 313
    .line 314
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 315
    .line 316
    .line 317
    return-void

    .line 318
    :cond_b
    :goto_5
    iget-object p0, p0, Le6;->A:Lbv1;

    .line 319
    .line 320
    iget-object p0, p0, Lbv1;->k:Ljava/lang/Object;

    .line 321
    .line 322
    check-cast p0, Lj70;

    .line 323
    .line 324
    iget-object p0, p0, Lj70;->A:Lz70;

    .line 325
    .line 326
    invoke-virtual {p0, p1, p2, p3, p4}, Lz70;->v(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V

    .line 327
    .line 328
    .line 329
    return-void

    .line 330
    nop

    .line 331
    :sswitch_data_0
    .sparse-switch
        -0x2673d6ef -> :sswitch_4
        0x5fd0f67 -> :sswitch_3
        0x1c2b8816 -> :sswitch_2
        0x4519f64d -> :sswitch_1
        0x56b9c952 -> :sswitch_0
    .end sparse-switch
.end method

.method public final findViewById(I)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0}, Le6;->k()Lq6;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lg7;

    .line 6
    .line 7
    invoke-virtual {p0}, Lg7;->u()V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lg7;->u:Landroid/view/Window;

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public final getMenuInflater()Landroid/view/MenuInflater;
    .locals 2

    .line 1
    invoke-virtual {p0}, Le6;->k()Lq6;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lg7;

    .line 6
    .line 7
    iget-object v0, p0, Lg7;->x:Lab1;

    .line 8
    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p0}, Lg7;->y()V

    .line 12
    .line 13
    .line 14
    new-instance v0, Lab1;

    .line 15
    .line 16
    iget-object v1, p0, Lg7;->w:Lvj1;

    .line 17
    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    invoke-virtual {v1}, Lvj1;->b()Landroid/content/Context;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    iget-object v1, p0, Lg7;->t:Landroid/content/Context;

    .line 26
    .line 27
    :goto_0
    invoke-direct {v0, v1}, Lab1;-><init>(Landroid/content/Context;)V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Lg7;->x:Lab1;

    .line 31
    .line 32
    :cond_1
    return-object v0
.end method

.method public final getResources()Landroid/content/res/Resources;
    .locals 1

    .line 1
    sget v0, Lzg1;->a:I

    .line 2
    .line 3
    invoke-super {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final invalidateOptionsMenu()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Le6;->k()Lq6;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lg7;

    .line 6
    .line 7
    iget-object v0, p0, Lg7;->w:Lvj1;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lg7;->y()V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lg7;->w:Lvj1;

    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    invoke-virtual {p0, v0}, Lg7;->z(I)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public final k()Lq6;
    .locals 2

    .line 1
    iget-object v0, p0, Le6;->F:Lg7;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lq6;->j:Lp6;

    .line 6
    .line 7
    new-instance v0, Lg7;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-direct {v0, p0, v1, p0, p0}, Lg7;-><init>(Landroid/content/Context;Landroid/view/Window;Lh6;Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Le6;->F:Lg7;

    .line 14
    .line 15
    :cond_0
    return-object v0
.end method

.method public final l()Lz70;
    .locals 0

    .line 1
    iget-object p0, p0, Le6;->A:Lbv1;

    .line 2
    .line 3
    iget-object p0, p0, Lbv1;->k:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast p0, Lj70;

    .line 6
    .line 7
    iget-object p0, p0, Lj70;->A:Lz70;

    .line 8
    .line 9
    return-object p0
.end method

.method public final n()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Le6;->A:Lbv1;

    .line 5
    .line 6
    iget-object v0, v0, Lbv1;->k:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast v0, Lj70;

    .line 9
    .line 10
    iget-object v0, v0, Lj70;->A:Lz70;

    .line 11
    .line 12
    invoke-virtual {v0}, Lz70;->k()V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Le6;->B:Landroidx/lifecycle/a;

    .line 16
    .line 17
    sget-object v0, Lvh0;->ON_DESTROY:Lvh0;

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Landroidx/lifecycle/a;->d(Lvh0;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final o(ILandroid/view/MenuItem;)Z
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroidx/activity/a;->onMenuItemSelected(ILandroid/view/MenuItem;)Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p2, 0x6

    .line 10
    if-ne p1, p2, :cond_1

    .line 11
    .line 12
    iget-object p0, p0, Le6;->A:Lbv1;

    .line 13
    .line 14
    iget-object p0, p0, Lbv1;->k:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast p0, Lj70;

    .line 17
    .line 18
    iget-object p0, p0, Lj70;->A:Lz70;

    .line 19
    .line 20
    invoke-virtual {p0}, Lz70;->i()Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    return p0

    .line 25
    :cond_1
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method public final onActivityResult(IILandroid/content/Intent;)V
    .locals 1

    .line 1
    iget-object v0, p0, Le6;->A:Lbv1;

    .line 2
    .line 3
    invoke-virtual {v0}, Lbv1;->p()V

    .line 4
    .line 5
    .line 6
    invoke-super {p0, p1, p2, p3}, Landroidx/activity/a;->onActivityResult(IILandroid/content/Intent;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Landroidx/activity/a;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Le6;->k()Lq6;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    check-cast p0, Lg7;

    .line 9
    .line 10
    iget-boolean p1, p0, Lg7;->O:Z

    .line 11
    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    iget-boolean p1, p0, Lg7;->I:Z

    .line 15
    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0}, Lg7;->y()V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Lg7;->w:Lvj1;

    .line 22
    .line 23
    if-eqz p1, :cond_0

    .line 24
    .line 25
    iget-object v0, p1, Lvj1;->a:Landroid/content/Context;

    .line 26
    .line 27
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const/high16 v1, 0x7f050000

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getBoolean(I)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    invoke-virtual {p1, v0}, Lvj1;->e(Z)V

    .line 38
    .line 39
    .line 40
    :cond_0
    invoke-static {}, Lj7;->a()Lj7;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    iget-object v0, p0, Lg7;->t:Landroid/content/Context;

    .line 45
    .line 46
    monitor-enter p1

    .line 47
    :try_start_0
    iget-object v1, p1, Lj7;->a:Lw01;

    .line 48
    .line 49
    monitor-enter v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 50
    :try_start_1
    iget-object v2, v1, Lw01;->b:Ljava/util/WeakHashMap;

    .line 51
    .line 52
    invoke-virtual {v2, v0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    check-cast v0, Luk0;

    .line 57
    .line 58
    if-eqz v0, :cond_1

    .line 59
    .line 60
    invoke-virtual {v0}, Luk0;->a()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :catchall_0
    move-exception p0

    .line 65
    goto :goto_1

    .line 66
    :cond_1
    :goto_0
    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 67
    monitor-exit p1

    .line 68
    new-instance p1, Landroid/content/res/Configuration;

    .line 69
    .line 70
    iget-object v0, p0, Lg7;->t:Landroid/content/Context;

    .line 71
    .line 72
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-direct {p1, v0}, Landroid/content/res/Configuration;-><init>(Landroid/content/res/Configuration;)V

    .line 81
    .line 82
    .line 83
    iput-object p1, p0, Lg7;->a0:Landroid/content/res/Configuration;

    .line 84
    .line 85
    const/4 p1, 0x0

    .line 86
    invoke-virtual {p0, p1, p1}, Lg7;->k(ZZ)Z

    .line 87
    .line 88
    .line 89
    return-void

    .line 90
    :goto_1
    :try_start_3
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 91
    :try_start_4
    throw p0

    .line 92
    :catchall_1
    move-exception p0

    .line 93
    monitor-exit p1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 94
    throw p0
.end method

.method public final onContentChanged()V
    .locals 0

    .line 1
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroidx/activity/a;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Le6;->B:Landroidx/lifecycle/a;

    .line 5
    .line 6
    sget-object v0, Lvh0;->ON_CREATE:Lvh0;

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Landroidx/lifecycle/a;->d(Lvh0;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Le6;->A:Lbv1;

    .line 12
    .line 13
    iget-object p0, p0, Lbv1;->k:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast p0, Lj70;

    .line 16
    .line 17
    iget-object p0, p0, Lj70;->A:Lz70;

    .line 18
    .line 19
    const/4 p1, 0x0

    .line 20
    iput-boolean p1, p0, Lz70;->E:Z

    .line 21
    .line 22
    iput-boolean p1, p0, Lz70;->F:Z

    .line 23
    .line 24
    iget-object v0, p0, Lz70;->L:Lb80;

    .line 25
    .line 26
    iput-boolean p1, v0, Lb80;->h:Z

    .line 27
    .line 28
    const/4 p1, 0x1

    .line 29
    invoke-virtual {p0, p1}, Lz70;->t(I)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final onCreateView(Landroid/view/View;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;
    .locals 1

    .line 24
    iget-object v0, p0, Le6;->A:Lbv1;

    .line 25
    iget-object v0, v0, Lbv1;->k:Ljava/lang/Object;

    check-cast v0, Lj70;

    .line 26
    iget-object v0, v0, Lj70;->A:Lz70;

    .line 27
    iget-object v0, v0, Lz70;->f:Ln70;

    .line 28
    invoke-virtual {v0, p1, p2, p3, p4}, Ln70;->onCreateView(Landroid/view/View;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;

    move-result-object v0

    if-nez v0, :cond_0

    .line 29
    invoke-super {p0, p1, p2, p3, p4}, Landroid/app/Activity;->onCreateView(Landroid/view/View;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;

    move-result-object p0

    return-object p0

    :cond_0
    return-object v0
.end method

.method public final onCreateView(Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;
    .locals 2

    .line 1
    iget-object v0, p0, Le6;->A:Lbv1;

    .line 2
    .line 3
    iget-object v0, v0, Lbv1;->k:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v0, Lj70;

    .line 6
    .line 7
    iget-object v0, v0, Lj70;->A:Lz70;

    .line 8
    .line 9
    iget-object v0, v0, Lz70;->f:Ln70;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {v0, v1, p1, p2, p3}, Ln70;->onCreateView(Landroid/view/View;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onCreateView(Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0

    .line 23
    :cond_0
    return-object v0
.end method

.method public onDestroy()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Le6;->n()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Le6;->k()Lq6;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0}, Lq6;->c()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 2

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x1a

    .line 4
    .line 5
    if-ge v0, v1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p2}, Landroid/view/KeyEvent;->isCtrlPressed()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getMetaState()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    invoke-static {v0}, Landroid/view/KeyEvent;->metaStateHasNoModifiers(I)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getRepeatCount()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-nez v0, :cond_0

    .line 28
    .line 29
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getKeyCode()I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    invoke-static {v0}, Landroid/view/KeyEvent;->isModifierKey(I)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-nez v0, :cond_0

    .line 38
    .line 39
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    if-eqz v0, :cond_0

    .line 44
    .line 45
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    if-eqz v1, :cond_0

    .line 50
    .line 51
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {v0, p2}, Landroid/view/View;->dispatchKeyShortcutEvent(Landroid/view/KeyEvent;)Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-eqz v0, :cond_0

    .line 60
    .line 61
    const/4 p0, 0x1

    .line 62
    return p0

    .line 63
    :cond_0
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    .line 64
    .line 65
    .line 66
    move-result p0

    .line 67
    return p0
.end method

.method public final onMenuItemSelected(ILandroid/view/MenuItem;)Z
    .locals 4

    .line 1
    invoke-virtual {p0, p1, p2}, Le6;->o(ILandroid/view/MenuItem;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 v0, 0x1

    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    goto/16 :goto_2

    .line 9
    .line 10
    :cond_0
    invoke-virtual {p0}, Le6;->k()Lq6;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    check-cast p1, Lg7;

    .line 15
    .line 16
    invoke-virtual {p1}, Lg7;->y()V

    .line 17
    .line 18
    .line 19
    iget-object p1, p1, Lg7;->w:Lvj1;

    .line 20
    .line 21
    invoke-interface {p2}, Landroid/view/MenuItem;->getItemId()I

    .line 22
    .line 23
    .line 24
    move-result p2

    .line 25
    const v1, 0x102002c

    .line 26
    .line 27
    .line 28
    const/4 v2, 0x0

    .line 29
    if-ne p2, v1, :cond_7

    .line 30
    .line 31
    if-eqz p1, :cond_7

    .line 32
    .line 33
    iget-object p1, p1, Lvj1;->e:Lcv;

    .line 34
    .line 35
    check-cast p1, Lcd1;

    .line 36
    .line 37
    iget p1, p1, Lcd1;->b:I

    .line 38
    .line 39
    and-int/lit8 p1, p1, 0x4

    .line 40
    .line 41
    if-eqz p1, :cond_7

    .line 42
    .line 43
    invoke-static {p0}, Lfe1;->m(Le6;)Landroid/content/Intent;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    if-eqz p1, :cond_7

    .line 48
    .line 49
    invoke-virtual {p0, p1}, Landroid/app/Activity;->shouldUpRecreateTask(Landroid/content/Intent;)Z

    .line 50
    .line 51
    .line 52
    move-result p2

    .line 53
    if-eqz p2, :cond_6

    .line 54
    .line 55
    new-instance p1, Ljava/util/ArrayList;

    .line 56
    .line 57
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 58
    .line 59
    .line 60
    invoke-static {p0}, Lfe1;->m(Le6;)Landroid/content/Intent;

    .line 61
    .line 62
    .line 63
    move-result-object p2

    .line 64
    if-nez p2, :cond_1

    .line 65
    .line 66
    invoke-static {p0}, Lfe1;->m(Le6;)Landroid/content/Intent;

    .line 67
    .line 68
    .line 69
    move-result-object p2

    .line 70
    :cond_1
    if-eqz p2, :cond_4

    .line 71
    .line 72
    invoke-virtual {p2}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    if-nez v1, :cond_2

    .line 77
    .line 78
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    invoke-virtual {p2, v1}, Landroid/content/Intent;->resolveActivity(Landroid/content/pm/PackageManager;)Landroid/content/ComponentName;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    :cond_2
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 87
    .line 88
    .line 89
    move-result v3

    .line 90
    :try_start_0
    invoke-static {p0, v1}, Lfe1;->n(Le6;Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    :goto_0
    if-eqz v1, :cond_3

    .line 95
    .line 96
    invoke-virtual {p1, v3, v1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {v1}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    invoke-static {p0, v1}, Lfe1;->n(Le6;Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 104
    .line 105
    .line 106
    move-result-object v1
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 107
    goto :goto_0

    .line 108
    :cond_3
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    goto :goto_1

    .line 112
    :catch_0
    move-exception p0

    .line 113
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 114
    .line 115
    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/Throwable;)V

    .line 116
    .line 117
    .line 118
    throw p1

    .line 119
    :cond_4
    :goto_1
    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 120
    .line 121
    .line 122
    move-result p2

    .line 123
    if-nez p2, :cond_5

    .line 124
    .line 125
    new-array p2, v2, [Landroid/content/Intent;

    .line 126
    .line 127
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    check-cast p1, [Landroid/content/Intent;

    .line 132
    .line 133
    new-instance p2, Landroid/content/Intent;

    .line 134
    .line 135
    aget-object v1, p1, v2

    .line 136
    .line 137
    invoke-direct {p2, v1}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    .line 138
    .line 139
    .line 140
    const v1, 0x1000c000

    .line 141
    .line 142
    .line 143
    invoke-virtual {p2, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 144
    .line 145
    .line 146
    move-result-object p2

    .line 147
    aput-object p2, p1, v2

    .line 148
    .line 149
    const/4 p2, 0x0

    .line 150
    invoke-virtual {p0, p1, p2}, Landroid/content/Context;->startActivities([Landroid/content/Intent;Landroid/os/Bundle;)V

    .line 151
    .line 152
    .line 153
    :try_start_1
    invoke-virtual {p0}, Landroid/app/Activity;->finishAffinity()V
    :try_end_1
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_1

    .line 154
    .line 155
    .line 156
    goto :goto_2

    .line 157
    :catch_1
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    .line 158
    .line 159
    .line 160
    :goto_2
    return v0

    .line 161
    :cond_5
    const-string p0, "No intents added to TaskStackBuilder; cannot startActivities"

    .line 162
    .line 163
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 164
    .line 165
    .line 166
    return v2

    .line 167
    :cond_6
    invoke-virtual {p0, p1}, Landroid/app/Activity;->navigateUpTo(Landroid/content/Intent;)Z

    .line 168
    .line 169
    .line 170
    return v0

    .line 171
    :cond_7
    return v2
.end method

.method public onPause()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Le6;->D:Z

    .line 6
    .line 7
    iget-object v0, p0, Le6;->A:Lbv1;

    .line 8
    .line 9
    iget-object v0, v0, Lbv1;->k:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast v0, Lj70;

    .line 12
    .line 13
    iget-object v0, v0, Lj70;->A:Lz70;

    .line 14
    .line 15
    const/4 v1, 0x5

    .line 16
    invoke-virtual {v0, v1}, Lz70;->t(I)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Le6;->B:Landroidx/lifecycle/a;

    .line 20
    .line 21
    sget-object v0, Lvh0;->ON_PAUSE:Lvh0;

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Landroidx/lifecycle/a;->d(Lvh0;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final onPostCreate(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/app/Activity;->onPostCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Le6;->k()Lq6;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    check-cast p0, Lg7;

    .line 9
    .line 10
    invoke-virtual {p0}, Lg7;->u()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final onPostResume()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Le6;->p()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Le6;->k()Lq6;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    check-cast p0, Lg7;

    .line 9
    .line 10
    invoke-virtual {p0}, Lg7;->y()V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lg7;->w:Lvj1;

    .line 14
    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    iput-boolean v0, p0, Lvj1;->t:Z

    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public final onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 1

    .line 1
    iget-object v0, p0, Le6;->A:Lbv1;

    .line 2
    .line 3
    invoke-virtual {v0}, Lbv1;->p()V

    .line 4
    .line 5
    .line 6
    invoke-super {p0, p1, p2, p3}, Landroidx/activity/a;->onRequestPermissionsResult(I[Ljava/lang/String;[I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onResume()V
    .locals 2

    .line 1
    iget-object v0, p0, Le6;->A:Lbv1;

    .line 2
    .line 3
    invoke-virtual {v0}, Lbv1;->p()V

    .line 4
    .line 5
    .line 6
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 7
    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    iput-boolean v1, p0, Le6;->D:Z

    .line 11
    .line 12
    iget-object p0, v0, Lbv1;->k:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast p0, Lj70;

    .line 15
    .line 16
    iget-object p0, p0, Lj70;->A:Lz70;

    .line 17
    .line 18
    invoke-virtual {p0, v1}, Lz70;->y(Z)Z

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final onStart()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Le6;->q()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Le6;->k()Lq6;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    check-cast p0, Lg7;

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {p0, v0, v1}, Lg7;->k(ZZ)Z

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final onStateNotSaved()V
    .locals 0

    .line 1
    iget-object p0, p0, Le6;->A:Lbv1;

    .line 2
    .line 3
    invoke-virtual {p0}, Lbv1;->p()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onStop()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Le6;->r()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Le6;->k()Lq6;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    check-cast p0, Lg7;

    .line 9
    .line 10
    invoke-virtual {p0}, Lg7;->y()V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lg7;->w:Lvj1;

    .line 14
    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    iput-boolean v0, p0, Lvj1;->t:Z

    .line 19
    .line 20
    iget-object p0, p0, Lvj1;->s:Lni1;

    .line 21
    .line 22
    if-eqz p0, :cond_0

    .line 23
    .line 24
    invoke-virtual {p0}, Lni1;->a()V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public final onTitleChanged(Ljava/lang/CharSequence;I)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onTitleChanged(Ljava/lang/CharSequence;I)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Le6;->k()Lq6;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0, p1}, Lq6;->j(Ljava/lang/CharSequence;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final openOptionsMenu()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Le6;->k()Lq6;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Lg7;

    .line 6
    .line 7
    invoke-virtual {v0}, Lg7;->y()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-virtual {v0, v1}, Landroid/view/Window;->hasFeature(I)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-super {p0}, Landroid/app/Activity;->openOptionsMenu()V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public final p()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/app/Activity;->onPostResume()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Le6;->B:Landroidx/lifecycle/a;

    .line 5
    .line 6
    sget-object v1, Lvh0;->ON_RESUME:Lvh0;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroidx/lifecycle/a;->d(Lvh0;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Le6;->A:Lbv1;

    .line 12
    .line 13
    iget-object p0, p0, Lbv1;->k:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast p0, Lj70;

    .line 16
    .line 17
    iget-object p0, p0, Lj70;->A:Lz70;

    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    iput-boolean v0, p0, Lz70;->E:Z

    .line 21
    .line 22
    iput-boolean v0, p0, Lz70;->F:Z

    .line 23
    .line 24
    iget-object v1, p0, Lz70;->L:Lb80;

    .line 25
    .line 26
    iput-boolean v0, v1, Lb80;->h:Z

    .line 27
    .line 28
    const/4 v0, 0x7

    .line 29
    invoke-virtual {p0, v0}, Lz70;->t(I)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final q()V
    .locals 5

    .line 1
    iget-object v0, p0, Le6;->A:Lbv1;

    .line 2
    .line 3
    invoke-virtual {v0}, Lbv1;->p()V

    .line 4
    .line 5
    .line 6
    iget-object v0, v0, Lbv1;->k:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast v0, Lj70;

    .line 9
    .line 10
    invoke-super {p0}, Landroid/app/Activity;->onStart()V

    .line 11
    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    iput-boolean v1, p0, Le6;->E:Z

    .line 15
    .line 16
    iget-boolean v2, p0, Le6;->C:Z

    .line 17
    .line 18
    const/4 v3, 0x1

    .line 19
    if-nez v2, :cond_0

    .line 20
    .line 21
    iput-boolean v3, p0, Le6;->C:Z

    .line 22
    .line 23
    iget-object v2, v0, Lj70;->A:Lz70;

    .line 24
    .line 25
    iput-boolean v1, v2, Lz70;->E:Z

    .line 26
    .line 27
    iput-boolean v1, v2, Lz70;->F:Z

    .line 28
    .line 29
    iget-object v4, v2, Lz70;->L:Lb80;

    .line 30
    .line 31
    iput-boolean v1, v4, Lb80;->h:Z

    .line 32
    .line 33
    const/4 v4, 0x4

    .line 34
    invoke-virtual {v2, v4}, Lz70;->t(I)V

    .line 35
    .line 36
    .line 37
    :cond_0
    iget-object v2, v0, Lj70;->A:Lz70;

    .line 38
    .line 39
    invoke-virtual {v2, v3}, Lz70;->y(Z)Z

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Le6;->B:Landroidx/lifecycle/a;

    .line 43
    .line 44
    sget-object v2, Lvh0;->ON_START:Lvh0;

    .line 45
    .line 46
    invoke-virtual {p0, v2}, Landroidx/lifecycle/a;->d(Lvh0;)V

    .line 47
    .line 48
    .line 49
    iget-object p0, v0, Lj70;->A:Lz70;

    .line 50
    .line 51
    iput-boolean v1, p0, Lz70;->E:Z

    .line 52
    .line 53
    iput-boolean v1, p0, Lz70;->F:Z

    .line 54
    .line 55
    iget-object v0, p0, Lz70;->L:Lb80;

    .line 56
    .line 57
    iput-boolean v1, v0, Lb80;->h:Z

    .line 58
    .line 59
    const/4 v0, 0x5

    .line 60
    invoke-virtual {p0, v0}, Lz70;->t(I)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public final r()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/app/Activity;->onStop()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Le6;->E:Z

    .line 6
    .line 7
    :cond_0
    invoke-virtual {p0}, Le6;->l()Lz70;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-static {v1}, Le6;->m(Lz70;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    iget-object v1, p0, Le6;->A:Lbv1;

    .line 18
    .line 19
    iget-object v1, v1, Lbv1;->k:Ljava/lang/Object;

    .line 20
    .line 21
    check-cast v1, Lj70;

    .line 22
    .line 23
    iget-object v1, v1, Lj70;->A:Lz70;

    .line 24
    .line 25
    iput-boolean v0, v1, Lz70;->F:Z

    .line 26
    .line 27
    iget-object v2, v1, Lz70;->L:Lb80;

    .line 28
    .line 29
    iput-boolean v0, v2, Lb80;->h:Z

    .line 30
    .line 31
    const/4 v0, 0x4

    .line 32
    invoke-virtual {v1, v0}, Lz70;->t(I)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Le6;->B:Landroidx/lifecycle/a;

    .line 36
    .line 37
    sget-object v0, Lvh0;->ON_STOP:Lvh0;

    .line 38
    .line 39
    invoke-virtual {p0, v0}, Landroidx/lifecycle/a;->d(Lvh0;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public final setContentView(I)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroidx/activity/a;->j()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Le6;->k()Lq6;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0, p1}, Lq6;->g(I)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setContentView(Landroid/view/View;)V
    .locals 0

    .line 12
    invoke-virtual {p0}, Landroidx/activity/a;->j()V

    .line 13
    invoke-virtual {p0}, Le6;->k()Lq6;

    move-result-object p0

    invoke-virtual {p0, p1}, Lq6;->h(Landroid/view/View;)V

    return-void
.end method

.method public final setContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    .locals 0

    .line 14
    invoke-virtual {p0}, Landroidx/activity/a;->j()V

    .line 15
    invoke-virtual {p0}, Le6;->k()Lq6;

    move-result-object p0

    invoke-virtual {p0, p1, p2}, Lq6;->i(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method public final setTheme(I)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/content/Context;->setTheme(I)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Le6;->k()Lq6;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    check-cast p0, Lg7;

    .line 9
    .line 10
    iput p1, p0, Lg7;->c0:I

    .line 11
    .line 12
    return-void
.end method
