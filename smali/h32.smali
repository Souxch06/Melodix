.class public final Lh32;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Lc52;


# direct methods
.method public constructor <init>(Lc52;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lh32;->j:Lc52;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 14

    .line 1
    iget-object p0, p0, Lh32;->j:Lc52;

    .line 2
    .line 3
    iget-object p0, p0, Lc52;->z:Lvd2;

    .line 4
    .line 5
    iget-object v0, p0, Lvd2;->a:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v0, Ly02;

    .line 8
    .line 9
    iget-object v1, v0, Ly02;->p:Ls02;

    .line 10
    .line 11
    iget-object v2, v0, Ly02;->v:Lc52;

    .line 12
    .line 13
    iget-object v3, v0, Ly02;->n:Lvz1;

    .line 14
    .line 15
    invoke-static {v1}, Ly02;->l(Lm22;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1}, Ls02;->l()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Lvd2;->c()Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-nez v1, :cond_0

    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    invoke-virtual {p0}, Lvd2;->b()Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    const-string v1, "_cc"

    .line 33
    .line 34
    const/4 v4, 0x0

    .line 35
    if-eqz p0, :cond_1

    .line 36
    .line 37
    invoke-static {v3}, Ly02;->j(Let;)V

    .line 38
    .line 39
    .line 40
    iget-object p0, v3, Lvz1;->F:Lvx;

    .line 41
    .line 42
    invoke-virtual {p0, v4}, Lvx;->f(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    new-instance p0, Landroid/os/Bundle;

    .line 46
    .line 47
    invoke-direct {p0}, Landroid/os/Bundle;-><init>()V

    .line 48
    .line 49
    .line 50
    const-string v0, "source"

    .line 51
    .line 52
    const-string v4, "(not set)"

    .line 53
    .line 54
    invoke-virtual {p0, v0, v4}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    const-string v0, "medium"

    .line 58
    .line 59
    invoke-virtual {p0, v0, v4}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    const-string v0, "_cis"

    .line 63
    .line 64
    const-string v4, "intent"

    .line 65
    .line 66
    invoke-virtual {p0, v0, v4}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    const-wide/16 v4, 0x1

    .line 70
    .line 71
    invoke-virtual {p0, v1, v4, v5}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    .line 72
    .line 73
    .line 74
    invoke-static {v2}, Ly02;->k(Lay1;)V

    .line 75
    .line 76
    .line 77
    const-string v0, "auto"

    .line 78
    .line 79
    const-string v1, "_cmpx"

    .line 80
    .line 81
    invoke-virtual {v2, v0, v1, p0}, Lc52;->s(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)V

    .line 82
    .line 83
    .line 84
    goto/16 :goto_3

    .line 85
    .line 86
    :cond_1
    invoke-static {v3}, Ly02;->j(Let;)V

    .line 87
    .line 88
    .line 89
    iget-object p0, v3, Lvz1;->F:Lvx;

    .line 90
    .line 91
    invoke-virtual {p0}, Lvx;->e()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v5

    .line 95
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 96
    .line 97
    .line 98
    move-result v6

    .line 99
    if-eqz v6, :cond_2

    .line 100
    .line 101
    iget-object v0, v0, Ly02;->o:Lzy1;

    .line 102
    .line 103
    invoke-static {v0}, Ly02;->l(Lm22;)V

    .line 104
    .line 105
    .line 106
    iget-object v0, v0, Lzy1;->p:Lso;

    .line 107
    .line 108
    const-string v1, "Cache still valid but referrer not found"

    .line 109
    .line 110
    invoke-virtual {v0, v1}, Lso;->b(Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    goto :goto_2

    .line 114
    :cond_2
    iget-object v0, v3, Lvz1;->G:Lrz1;

    .line 115
    .line 116
    invoke-virtual {v0}, Lrz1;->a()J

    .line 117
    .line 118
    .line 119
    move-result-wide v6

    .line 120
    const-wide/32 v8, 0x36ee80

    .line 121
    .line 122
    .line 123
    div-long/2addr v6, v8

    .line 124
    invoke-static {v5}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    new-instance v5, Landroid/os/Bundle;

    .line 129
    .line 130
    invoke-direct {v5}, Landroid/os/Bundle;-><init>()V

    .line 131
    .line 132
    .line 133
    new-instance v10, Landroid/util/Pair;

    .line 134
    .line 135
    invoke-virtual {v0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object v11

    .line 139
    invoke-direct {v10, v11, v5}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 140
    .line 141
    .line 142
    invoke-virtual {v0}, Landroid/net/Uri;->getQueryParameterNames()Ljava/util/Set;

    .line 143
    .line 144
    .line 145
    move-result-object v11

    .line 146
    invoke-interface {v11}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 147
    .line 148
    .line 149
    move-result-object v11

    .line 150
    :goto_0
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    .line 151
    .line 152
    .line 153
    move-result v12

    .line 154
    if-eqz v12, :cond_3

    .line 155
    .line 156
    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 157
    .line 158
    .line 159
    move-result-object v12

    .line 160
    check-cast v12, Ljava/lang/String;

    .line 161
    .line 162
    invoke-virtual {v0, v12}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object v13

    .line 166
    invoke-virtual {v5, v12, v13}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 167
    .line 168
    .line 169
    goto :goto_0

    .line 170
    :cond_3
    const-wide/16 v11, -0x1

    .line 171
    .line 172
    add-long/2addr v6, v11

    .line 173
    mul-long/2addr v6, v8

    .line 174
    iget-object v0, v10, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 175
    .line 176
    check-cast v0, Landroid/os/Bundle;

    .line 177
    .line 178
    invoke-virtual {v0, v1, v6, v7}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    .line 179
    .line 180
    .line 181
    iget-object v0, v10, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 182
    .line 183
    if-nez v0, :cond_4

    .line 184
    .line 185
    const-string v0, "app"

    .line 186
    .line 187
    goto :goto_1

    .line 188
    :cond_4
    check-cast v0, Ljava/lang/String;

    .line 189
    .line 190
    :goto_1
    invoke-static {v2}, Ly02;->k(Lay1;)V

    .line 191
    .line 192
    .line 193
    iget-object v1, v10, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 194
    .line 195
    check-cast v1, Landroid/os/Bundle;

    .line 196
    .line 197
    const-string v5, "_cmp"

    .line 198
    .line 199
    invoke-virtual {v2, v0, v5, v1}, Lc52;->s(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)V

    .line 200
    .line 201
    .line 202
    :goto_2
    invoke-virtual {p0, v4}, Lvx;->f(Ljava/lang/String;)V

    .line 203
    .line 204
    .line 205
    :goto_3
    invoke-static {v3}, Ly02;->j(Let;)V

    .line 206
    .line 207
    .line 208
    iget-object p0, v3, Lvz1;->G:Lrz1;

    .line 209
    .line 210
    const-wide/16 v0, 0x0

    .line 211
    .line 212
    invoke-virtual {p0, v0, v1}, Lrz1;->b(J)V

    .line 213
    .line 214
    .line 215
    return-void
.end method
