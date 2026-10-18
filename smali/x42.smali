.class public final synthetic Lx42;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Lc52;

.field public final synthetic k:Landroid/os/Bundle;


# direct methods
.method public synthetic constructor <init>(Lc52;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lx42;->j:Lc52;

    .line 5
    .line 6
    iput-object p2, p0, Lx42;->k:Landroid/os/Bundle;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 14

    .line 1
    iget-object v0, p0, Lx42;->j:Lc52;

    .line 2
    .line 3
    iget-object v1, v0, Lc52;->E:Lmd1;

    .line 4
    .line 5
    iget-object v0, v0, Let;->j:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v0, Ly02;

    .line 8
    .line 9
    iget-object p0, p0, Lx42;->k:Landroid/os/Bundle;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/os/BaseBundle;->isEmpty()Z

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    if-nez v2, :cond_a

    .line 16
    .line 17
    new-instance v7, Landroid/os/Bundle;

    .line 18
    .line 19
    iget-object v2, v0, Ly02;->n:Lvz1;

    .line 20
    .line 21
    iget-object v8, v0, Ly02;->r:Lcb2;

    .line 22
    .line 23
    iget-object v9, v0, Ly02;->m:Lmt1;

    .line 24
    .line 25
    iget-object v10, v0, Ly02;->o:Lzy1;

    .line 26
    .line 27
    invoke-static {v2}, Ly02;->j(Let;)V

    .line 28
    .line 29
    .line 30
    iget-object v2, v2, Lvz1;->H:Ler0;

    .line 31
    .line 32
    invoke-virtual {v2}, Ler0;->t()Landroid/os/Bundle;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-direct {v7, v2}, Landroid/os/Bundle;-><init>(Landroid/os/Bundle;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Landroid/os/BaseBundle;->keySet()Ljava/util/Set;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 44
    .line 45
    .line 46
    move-result-object v11

    .line 47
    :cond_0
    :goto_0
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    if-eqz v2, :cond_5

    .line 52
    .line 53
    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    move-object v12, v2

    .line 58
    check-cast v12, Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {p0, v12}, Landroid/os/BaseBundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v13

    .line 64
    if-eqz v13, :cond_2

    .line 65
    .line 66
    instance-of v2, v13, Ljava/lang/String;

    .line 67
    .line 68
    if-nez v2, :cond_2

    .line 69
    .line 70
    instance-of v2, v13, Ljava/lang/Long;

    .line 71
    .line 72
    if-nez v2, :cond_2

    .line 73
    .line 74
    instance-of v2, v13, Ljava/lang/Double;

    .line 75
    .line 76
    if-nez v2, :cond_2

    .line 77
    .line 78
    invoke-static {v8}, Ly02;->j(Let;)V

    .line 79
    .line 80
    .line 81
    invoke-static {v13}, Lcb2;->x0(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result v2

    .line 85
    if-eqz v2, :cond_1

    .line 86
    .line 87
    const/4 v5, 0x0

    .line 88
    const/4 v6, 0x0

    .line 89
    const/4 v2, 0x0

    .line 90
    const/16 v3, 0x1b

    .line 91
    .line 92
    const/4 v4, 0x0

    .line 93
    invoke-static/range {v1 .. v6}, Lcb2;->D(Lbb2;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;I)V

    .line 94
    .line 95
    .line 96
    :cond_1
    invoke-static {v10}, Ly02;->l(Lm22;)V

    .line 97
    .line 98
    .line 99
    iget-object v2, v10, Lzy1;->t:Lso;

    .line 100
    .line 101
    const-string v3, "Invalid default event parameter type. Name, value"

    .line 102
    .line 103
    invoke-virtual {v2, v3, v12, v13}, Lso;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 104
    .line 105
    .line 106
    goto :goto_0

    .line 107
    :cond_2
    invoke-static {v12}, Lcb2;->P(Ljava/lang/String;)Z

    .line 108
    .line 109
    .line 110
    move-result v2

    .line 111
    if-eqz v2, :cond_3

    .line 112
    .line 113
    invoke-static {v10}, Ly02;->l(Lm22;)V

    .line 114
    .line 115
    .line 116
    iget-object v2, v10, Lzy1;->t:Lso;

    .line 117
    .line 118
    const-string v3, "Invalid default event parameter name. Name"

    .line 119
    .line 120
    invoke-virtual {v2, v12, v3}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    goto :goto_0

    .line 124
    :cond_3
    if-nez v13, :cond_4

    .line 125
    .line 126
    invoke-virtual {v7, v12}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    goto :goto_0

    .line 130
    :cond_4
    invoke-static {v8}, Ly02;->j(Let;)V

    .line 131
    .line 132
    .line 133
    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 134
    .line 135
    .line 136
    const/16 v2, 0x1f4

    .line 137
    .line 138
    const-string v3, "param"

    .line 139
    .line 140
    invoke-virtual {v8, v3, v12, v2, v13}, Lcb2;->p(Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Z

    .line 141
    .line 142
    .line 143
    move-result v2

    .line 144
    if-eqz v2, :cond_0

    .line 145
    .line 146
    invoke-virtual {v8, v7, v12, v13}, Lcb2;->C(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/Object;)V

    .line 147
    .line 148
    .line 149
    goto :goto_0

    .line 150
    :cond_5
    invoke-static {v8}, Ly02;->j(Let;)V

    .line 151
    .line 152
    .line 153
    iget-object p0, v9, Let;->j:Ljava/lang/Object;

    .line 154
    .line 155
    check-cast p0, Ly02;

    .line 156
    .line 157
    iget-object p0, p0, Ly02;->r:Lcb2;

    .line 158
    .line 159
    invoke-static {p0}, Ly02;->j(Let;)V

    .line 160
    .line 161
    .line 162
    const v2, 0xc02a560

    .line 163
    .line 164
    .line 165
    invoke-virtual {p0, v2}, Lcb2;->V(I)Z

    .line 166
    .line 167
    .line 168
    move-result p0

    .line 169
    if-eqz p0, :cond_6

    .line 170
    .line 171
    const/16 p0, 0x64

    .line 172
    .line 173
    goto :goto_1

    .line 174
    :cond_6
    const/16 p0, 0x19

    .line 175
    .line 176
    :goto_1
    invoke-virtual {v7}, Landroid/os/BaseBundle;->size()I

    .line 177
    .line 178
    .line 179
    move-result v2

    .line 180
    if-gt v2, p0, :cond_7

    .line 181
    .line 182
    goto :goto_3

    .line 183
    :cond_7
    new-instance v2, Ljava/util/TreeSet;

    .line 184
    .line 185
    invoke-virtual {v7}, Landroid/os/BaseBundle;->keySet()Ljava/util/Set;

    .line 186
    .line 187
    .line 188
    move-result-object v3

    .line 189
    invoke-direct {v2, v3}, Ljava/util/TreeSet;-><init>(Ljava/util/Collection;)V

    .line 190
    .line 191
    .line 192
    invoke-virtual {v2}, Ljava/util/TreeSet;->iterator()Ljava/util/Iterator;

    .line 193
    .line 194
    .line 195
    move-result-object v2

    .line 196
    const/4 v3, 0x0

    .line 197
    :cond_8
    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 198
    .line 199
    .line 200
    move-result v4

    .line 201
    if-eqz v4, :cond_9

    .line 202
    .line 203
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 204
    .line 205
    .line 206
    move-result-object v4

    .line 207
    check-cast v4, Ljava/lang/String;

    .line 208
    .line 209
    add-int/lit8 v3, v3, 0x1

    .line 210
    .line 211
    if-le v3, p0, :cond_8

    .line 212
    .line 213
    invoke-virtual {v7, v4}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    .line 214
    .line 215
    .line 216
    goto :goto_2

    .line 217
    :cond_9
    invoke-static {v8}, Ly02;->j(Let;)V

    .line 218
    .line 219
    .line 220
    const/4 v5, 0x0

    .line 221
    const/4 v6, 0x0

    .line 222
    const/4 v2, 0x0

    .line 223
    const/16 v3, 0x1a

    .line 224
    .line 225
    const/4 v4, 0x0

    .line 226
    invoke-static/range {v1 .. v6}, Lcb2;->D(Lbb2;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;I)V

    .line 227
    .line 228
    .line 229
    invoke-static {v10}, Ly02;->l(Lm22;)V

    .line 230
    .line 231
    .line 232
    iget-object p0, v10, Lzy1;->t:Lso;

    .line 233
    .line 234
    const-string v1, "Too many default event parameters set. Discarding beyond event parameter limit"

    .line 235
    .line 236
    invoke-virtual {p0, v1}, Lso;->b(Ljava/lang/String;)V

    .line 237
    .line 238
    .line 239
    :goto_3
    move-object p0, v7

    .line 240
    :cond_a
    iget-object v1, v0, Ly02;->n:Lvz1;

    .line 241
    .line 242
    invoke-static {v1}, Ly02;->j(Let;)V

    .line 243
    .line 244
    .line 245
    iget-object v1, v1, Lvz1;->H:Ler0;

    .line 246
    .line 247
    invoke-virtual {v1, p0}, Ler0;->x(Landroid/os/Bundle;)V

    .line 248
    .line 249
    .line 250
    invoke-virtual {v0}, Ly02;->n()Li82;

    .line 251
    .line 252
    .line 253
    move-result-object v0

    .line 254
    invoke-virtual {v0, p0}, Li82;->q(Landroid/os/Bundle;)V

    .line 255
    .line 256
    .line 257
    return-void
.end method
