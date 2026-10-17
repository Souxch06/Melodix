.class public final Lbu1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final a:Ljava/util/ArrayList;

.field public final synthetic b:I


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 1
    iput p1, p0, Lbu1;->b:I

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance p1, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Lbu1;->a:Ljava/util/ArrayList;

    .line 12
    .line 13
    return-void
.end method

.method public static c(Ler0;Ljava/util/ArrayList;)Lqt1;
    .locals 5

    .line 1
    sget-object v0, Luu1;->k:Luu1;

    .line 2
    .line 3
    const-string v0, "FN"

    .line 4
    .line 5
    const/4 v1, 0x2

    .line 6
    invoke-static {v0, v1, p1}, Lbe2;->M(Ljava/lang/String;ILjava/util/List;)V

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Lst1;

    .line 15
    .line 16
    iget-object v2, p0, Ler0;->l:Ljava/lang/Object;

    .line 17
    .line 18
    check-cast v2, Lxn0;

    .line 19
    .line 20
    invoke-virtual {v2, p0, v0}, Lxn0;->A(Ler0;Lst1;)Lst1;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const/4 v2, 0x1

    .line 25
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    check-cast v2, Lst1;

    .line 30
    .line 31
    iget-object v3, p0, Ler0;->l:Ljava/lang/Object;

    .line 32
    .line 33
    check-cast v3, Lxn0;

    .line 34
    .line 35
    invoke-virtual {v3, p0, v2}, Lxn0;->A(Ler0;Lst1;)Lst1;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    instance-of v3, v2, Lrp1;

    .line 40
    .line 41
    if-eqz v3, :cond_1

    .line 42
    .line 43
    check-cast v2, Lrp1;

    .line 44
    .line 45
    invoke-virtual {v2}, Lrp1;->q()Ljava/util/List;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    new-instance v3, Ljava/util/ArrayList;

    .line 50
    .line 51
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 55
    .line 56
    .line 57
    move-result v4

    .line 58
    if-le v4, v1, :cond_0

    .line 59
    .line 60
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 61
    .line 62
    .line 63
    move-result v3

    .line 64
    invoke-virtual {p1, v1, v3}, Ljava/util/ArrayList;->subList(II)Ljava/util/List;

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    :cond_0
    new-instance p1, Lqt1;

    .line 69
    .line 70
    invoke-interface {v0}, Lst1;->e()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    check-cast v2, Ljava/util/ArrayList;

    .line 75
    .line 76
    invoke-direct {p1, v0, v2, v3, p0}, Lqt1;-><init>(Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/List;Ler0;)V

    .line 77
    .line 78
    .line 79
    return-object p1

    .line 80
    :cond_1
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    invoke-virtual {p0}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    const-string p1, "FN requires an ArrayValue of parameter names found "

    .line 89
    .line 90
    invoke-static {p1, p0}, Loq;->h(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    const/4 p0, 0x0

    .line 98
    return-object p0
.end method

.method public static d(Lst1;Lst1;)Z
    .locals 8

    .line 1
    instance-of v0, p0, Lkt1;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lxt1;

    .line 6
    .line 7
    invoke-interface {p0}, Lst1;->e()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-direct {v0, p0}, Lxt1;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    move-object p0, v0

    .line 15
    :cond_0
    instance-of v0, p1, Lkt1;

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    new-instance v0, Lxt1;

    .line 20
    .line 21
    invoke-interface {p1}, Lst1;->e()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-direct {v0, p1}, Lxt1;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    move-object p1, v0

    .line 29
    :cond_1
    instance-of v0, p0, Lxt1;

    .line 30
    .line 31
    const/4 v1, 0x1

    .line 32
    const/4 v2, 0x0

    .line 33
    if-eqz v0, :cond_4

    .line 34
    .line 35
    instance-of v0, p1, Lxt1;

    .line 36
    .line 37
    if-nez v0, :cond_2

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_2
    check-cast p0, Lxt1;

    .line 41
    .line 42
    iget-object p0, p0, Lxt1;->j:Ljava/lang/String;

    .line 43
    .line 44
    check-cast p1, Lxt1;

    .line 45
    .line 46
    iget-object p1, p1, Lxt1;->j:Ljava/lang/String;

    .line 47
    .line 48
    invoke-virtual {p0, p1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    if-gez p0, :cond_3

    .line 53
    .line 54
    return v1

    .line 55
    :cond_3
    return v2

    .line 56
    :cond_4
    :goto_0
    invoke-interface {p0}, Lst1;->f()Ljava/lang/Double;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    .line 61
    .line 62
    .line 63
    move-result-wide v3

    .line 64
    invoke-interface {p1}, Lst1;->f()Ljava/lang/Double;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    .line 69
    .line 70
    .line 71
    move-result-wide p0

    .line 72
    invoke-static {v3, v4}, Ljava/lang/Double;->isNaN(D)Z

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-nez v0, :cond_9

    .line 77
    .line 78
    invoke-static {p0, p1}, Ljava/lang/Double;->isNaN(D)Z

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    if-eqz v0, :cond_5

    .line 83
    .line 84
    goto :goto_1

    .line 85
    :cond_5
    const-wide/16 v5, 0x0

    .line 86
    .line 87
    cmpl-double v0, v3, v5

    .line 88
    .line 89
    if-nez v0, :cond_6

    .line 90
    .line 91
    cmpl-double v7, p0, v5

    .line 92
    .line 93
    if-eqz v7, :cond_7

    .line 94
    .line 95
    :cond_6
    if-nez v0, :cond_8

    .line 96
    .line 97
    cmpl-double v0, p0, v5

    .line 98
    .line 99
    if-nez v0, :cond_8

    .line 100
    .line 101
    :cond_7
    return v2

    .line 102
    :cond_8
    invoke-static {v3, v4, p0, p1}, Ljava/lang/Double;->compare(DD)I

    .line 103
    .line 104
    .line 105
    move-result p0

    .line 106
    if-gez p0, :cond_9

    .line 107
    .line 108
    return v1

    .line 109
    :cond_9
    :goto_1
    return v2
.end method

.method public static e(Lqu1;Lst1;Lst1;)Lst1;
    .locals 1

    .line 1
    instance-of v0, p1, Ljava/lang/Iterable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Ljava/lang/Iterable;

    .line 6
    .line 7
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-static {p0, p1, p2}, Lbu1;->g(Lqu1;Ljava/util/Iterator;Lst1;)Lst1;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    const-string p0, "Non-iterable type in for...of loop."

    .line 17
    .line 18
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const/4 p0, 0x0

    .line 22
    return-object p0
.end method

.method public static f(Lst1;Lst1;)Z
    .locals 5

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x0

    .line 14
    const/4 v2, 0x1

    .line 15
    if-eqz v0, :cond_8

    .line 16
    .line 17
    instance-of v0, p0, Lzt1;

    .line 18
    .line 19
    if-nez v0, :cond_7

    .line 20
    .line 21
    instance-of v0, p0, Lpt1;

    .line 22
    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    goto :goto_1

    .line 26
    :cond_0
    instance-of v0, p0, Lrr1;

    .line 27
    .line 28
    if-eqz v0, :cond_3

    .line 29
    .line 30
    invoke-interface {p0}, Lst1;->f()Ljava/lang/Double;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    .line 35
    .line 36
    .line 37
    move-result-wide v3

    .line 38
    invoke-static {v3, v4}, Ljava/lang/Double;->isNaN(D)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-nez v0, :cond_2

    .line 43
    .line 44
    invoke-interface {p1}, Lst1;->f()Ljava/lang/Double;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    .line 49
    .line 50
    .line 51
    move-result-wide v3

    .line 52
    invoke-static {v3, v4}, Ljava/lang/Double;->isNaN(D)Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-eqz v0, :cond_1

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_1
    invoke-interface {p0}, Lst1;->f()Ljava/lang/Double;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    .line 64
    .line 65
    .line 66
    move-result-wide v3

    .line 67
    invoke-interface {p1}, Lst1;->f()Ljava/lang/Double;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    .line 72
    .line 73
    .line 74
    move-result-wide p0

    .line 75
    cmpl-double p0, v3, p0

    .line 76
    .line 77
    if-nez p0, :cond_2

    .line 78
    .line 79
    return v2

    .line 80
    :cond_2
    :goto_0
    return v1

    .line 81
    :cond_3
    instance-of v0, p0, Lxt1;

    .line 82
    .line 83
    if-eqz v0, :cond_4

    .line 84
    .line 85
    invoke-interface {p0}, Lst1;->e()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    invoke-interface {p1}, Lst1;->e()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    move-result p0

    .line 97
    return p0

    .line 98
    :cond_4
    instance-of v0, p0, Liq1;

    .line 99
    .line 100
    if-eqz v0, :cond_5

    .line 101
    .line 102
    invoke-interface {p0}, Lst1;->c()Ljava/lang/Boolean;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    invoke-interface {p1}, Lst1;->c()Ljava/lang/Boolean;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    invoke-virtual {p0, p1}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    .line 111
    .line 112
    .line 113
    move-result p0

    .line 114
    return p0

    .line 115
    :cond_5
    if-ne p0, p1, :cond_6

    .line 116
    .line 117
    return v2

    .line 118
    :cond_6
    return v1

    .line 119
    :cond_7
    :goto_1
    return v2

    .line 120
    :cond_8
    instance-of v0, p0, Lzt1;

    .line 121
    .line 122
    if-nez v0, :cond_9

    .line 123
    .line 124
    instance-of v0, p0, Lpt1;

    .line 125
    .line 126
    if-eqz v0, :cond_a

    .line 127
    .line 128
    :cond_9
    instance-of v0, p1, Lzt1;

    .line 129
    .line 130
    if-nez v0, :cond_13

    .line 131
    .line 132
    instance-of v0, p1, Lpt1;

    .line 133
    .line 134
    if-eqz v0, :cond_a

    .line 135
    .line 136
    goto/16 :goto_2

    .line 137
    .line 138
    :cond_a
    instance-of v0, p0, Lrr1;

    .line 139
    .line 140
    if-eqz v0, :cond_b

    .line 141
    .line 142
    instance-of v2, p1, Lxt1;

    .line 143
    .line 144
    if-eqz v2, :cond_b

    .line 145
    .line 146
    new-instance v0, Lrr1;

    .line 147
    .line 148
    invoke-interface {p1}, Lst1;->f()Ljava/lang/Double;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    invoke-direct {v0, p1}, Lrr1;-><init>(Ljava/lang/Double;)V

    .line 153
    .line 154
    .line 155
    invoke-static {p0, v0}, Lbu1;->f(Lst1;Lst1;)Z

    .line 156
    .line 157
    .line 158
    move-result p0

    .line 159
    return p0

    .line 160
    :cond_b
    instance-of v2, p0, Lxt1;

    .line 161
    .line 162
    if-eqz v2, :cond_c

    .line 163
    .line 164
    instance-of v3, p1, Lrr1;

    .line 165
    .line 166
    if-eqz v3, :cond_c

    .line 167
    .line 168
    new-instance v0, Lrr1;

    .line 169
    .line 170
    invoke-interface {p0}, Lst1;->f()Ljava/lang/Double;

    .line 171
    .line 172
    .line 173
    move-result-object p0

    .line 174
    invoke-direct {v0, p0}, Lrr1;-><init>(Ljava/lang/Double;)V

    .line 175
    .line 176
    .line 177
    invoke-static {v0, p1}, Lbu1;->f(Lst1;Lst1;)Z

    .line 178
    .line 179
    .line 180
    move-result p0

    .line 181
    return p0

    .line 182
    :cond_c
    instance-of v3, p0, Liq1;

    .line 183
    .line 184
    if-eqz v3, :cond_d

    .line 185
    .line 186
    new-instance v0, Lrr1;

    .line 187
    .line 188
    invoke-interface {p0}, Lst1;->f()Ljava/lang/Double;

    .line 189
    .line 190
    .line 191
    move-result-object p0

    .line 192
    invoke-direct {v0, p0}, Lrr1;-><init>(Ljava/lang/Double;)V

    .line 193
    .line 194
    .line 195
    invoke-static {v0, p1}, Lbu1;->f(Lst1;Lst1;)Z

    .line 196
    .line 197
    .line 198
    move-result p0

    .line 199
    return p0

    .line 200
    :cond_d
    instance-of v3, p1, Liq1;

    .line 201
    .line 202
    if-eqz v3, :cond_e

    .line 203
    .line 204
    new-instance v0, Lrr1;

    .line 205
    .line 206
    invoke-interface {p1}, Lst1;->f()Ljava/lang/Double;

    .line 207
    .line 208
    .line 209
    move-result-object p1

    .line 210
    invoke-direct {v0, p1}, Lrr1;-><init>(Ljava/lang/Double;)V

    .line 211
    .line 212
    .line 213
    invoke-static {p0, v0}, Lbu1;->f(Lst1;Lst1;)Z

    .line 214
    .line 215
    .line 216
    move-result p0

    .line 217
    return p0

    .line 218
    :cond_e
    if-nez v2, :cond_f

    .line 219
    .line 220
    if-eqz v0, :cond_10

    .line 221
    .line 222
    :cond_f
    instance-of v0, p1, Lkt1;

    .line 223
    .line 224
    if-eqz v0, :cond_10

    .line 225
    .line 226
    new-instance v0, Lxt1;

    .line 227
    .line 228
    invoke-interface {p1}, Lst1;->e()Ljava/lang/String;

    .line 229
    .line 230
    .line 231
    move-result-object p1

    .line 232
    invoke-direct {v0, p1}, Lxt1;-><init>(Ljava/lang/String;)V

    .line 233
    .line 234
    .line 235
    invoke-static {p0, v0}, Lbu1;->f(Lst1;Lst1;)Z

    .line 236
    .line 237
    .line 238
    move-result p0

    .line 239
    return p0

    .line 240
    :cond_10
    instance-of v0, p0, Lkt1;

    .line 241
    .line 242
    if-eqz v0, :cond_12

    .line 243
    .line 244
    instance-of v0, p1, Lxt1;

    .line 245
    .line 246
    if-nez v0, :cond_11

    .line 247
    .line 248
    instance-of v0, p1, Lrr1;

    .line 249
    .line 250
    if-eqz v0, :cond_12

    .line 251
    .line 252
    :cond_11
    new-instance v0, Lxt1;

    .line 253
    .line 254
    invoke-interface {p0}, Lst1;->e()Ljava/lang/String;

    .line 255
    .line 256
    .line 257
    move-result-object p0

    .line 258
    invoke-direct {v0, p0}, Lxt1;-><init>(Ljava/lang/String;)V

    .line 259
    .line 260
    .line 261
    invoke-static {v0, p1}, Lbu1;->f(Lst1;Lst1;)Z

    .line 262
    .line 263
    .line 264
    move-result p0

    .line 265
    return p0

    .line 266
    :cond_12
    return v1

    .line 267
    :cond_13
    :goto_2
    return v2
.end method

.method public static g(Lqu1;Ljava/util/Iterator;Lst1;)Lst1;
    .locals 4

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Lst1;

    .line 14
    .line 15
    iget v1, p0, Lqu1;->a:I

    .line 16
    .line 17
    packed-switch v1, :pswitch_data_0

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, Lqu1;->b:Ler0;

    .line 21
    .line 22
    iget-object v2, p0, Lqu1;->c:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {v1, v2, v0}, Ler0;->B(Ljava/lang/String;Lst1;)V

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :pswitch_0
    iget-object v1, p0, Lqu1;->b:Ler0;

    .line 29
    .line 30
    invoke-virtual {v1}, Ler0;->y()Ler0;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    iget-object v2, p0, Lqu1;->c:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {v1, v2, v0}, Ler0;->B(Ljava/lang/String;Lst1;)V

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :pswitch_1
    iget-object v1, p0, Lqu1;->b:Ler0;

    .line 41
    .line 42
    invoke-virtual {v1}, Ler0;->y()Ler0;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    iget-object v2, p0, Lqu1;->c:Ljava/lang/String;

    .line 47
    .line 48
    invoke-virtual {v1, v2, v0}, Ler0;->B(Ljava/lang/String;Lst1;)V

    .line 49
    .line 50
    .line 51
    iget-object v0, v1, Ler0;->n:Ljava/lang/Object;

    .line 52
    .line 53
    check-cast v0, Ljava/util/HashMap;

    .line 54
    .line 55
    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 56
    .line 57
    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    :goto_0
    move-object v0, p2

    .line 61
    check-cast v0, Lrp1;

    .line 62
    .line 63
    invoke-virtual {v1, v0}, Ler0;->w(Lrp1;)Lst1;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    instance-of v1, v0, Lbr1;

    .line 68
    .line 69
    if-eqz v1, :cond_0

    .line 70
    .line 71
    check-cast v0, Lbr1;

    .line 72
    .line 73
    iget-object v1, v0, Lbr1;->k:Ljava/lang/String;

    .line 74
    .line 75
    const-string v2, "break"

    .line 76
    .line 77
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    move-result v2

    .line 81
    if-eqz v2, :cond_1

    .line 82
    .line 83
    sget-object p0, Lst1;->b:Lzt1;

    .line 84
    .line 85
    return-object p0

    .line 86
    :cond_1
    const-string v2, "return"

    .line 87
    .line 88
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    move-result v1

    .line 92
    if-eqz v1, :cond_0

    .line 93
    .line 94
    return-object v0

    .line 95
    :cond_2
    sget-object p0, Lst1;->b:Lzt1;

    .line 96
    .line 97
    return-object p0

    .line 98
    nop

    .line 99
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static h(Lst1;Lst1;)Z
    .locals 4

    .line 1
    instance-of v0, p0, Lkt1;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lxt1;

    .line 6
    .line 7
    invoke-interface {p0}, Lst1;->e()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-direct {v0, p0}, Lxt1;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    move-object p0, v0

    .line 15
    :cond_0
    instance-of v0, p1, Lkt1;

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    new-instance v0, Lxt1;

    .line 20
    .line 21
    invoke-interface {p1}, Lst1;->e()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-direct {v0, p1}, Lxt1;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    move-object p1, v0

    .line 29
    :cond_1
    instance-of v0, p0, Lxt1;

    .line 30
    .line 31
    const/4 v1, 0x0

    .line 32
    if-eqz v0, :cond_2

    .line 33
    .line 34
    instance-of v0, p1, Lxt1;

    .line 35
    .line 36
    if-nez v0, :cond_3

    .line 37
    .line 38
    :cond_2
    invoke-interface {p0}, Lst1;->f()Ljava/lang/Double;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    .line 43
    .line 44
    .line 45
    move-result-wide v2

    .line 46
    invoke-static {v2, v3}, Ljava/lang/Double;->isNaN(D)Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-nez v0, :cond_4

    .line 51
    .line 52
    invoke-interface {p1}, Lst1;->f()Ljava/lang/Double;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    .line 57
    .line 58
    .line 59
    move-result-wide v2

    .line 60
    invoke-static {v2, v3}, Ljava/lang/Double;->isNaN(D)Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    if-eqz v0, :cond_3

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_3
    invoke-static {p1, p0}, Lbu1;->d(Lst1;Lst1;)Z

    .line 68
    .line 69
    .line 70
    move-result p0

    .line 71
    if-nez p0, :cond_4

    .line 72
    .line 73
    const/4 p0, 0x1

    .line 74
    return p0

    .line 75
    :cond_4
    :goto_0
    return v1
.end method


# virtual methods
.method public final a(Ljava/lang/String;Ler0;Ljava/util/ArrayList;)Lst1;
    .locals 10

    iget v0, p0, Lbu1;->b:I

    const-string v1, "break"

    const-string v2, "return"

    const/4 v3, 0x3

    const/4 v4, 0x1

    const/4 v5, 0x2

    const/4 v6, 0x0

    const/4 v7, 0x0

    packed-switch v0, :pswitch_data_0

    .line 1
    sget-object v0, Luu1;->k:Luu1;

    invoke-static {p1}, Lbe2;->Q(Ljava/lang/String;)Luu1;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    if-eq v0, v3, :cond_22

    const/16 v1, 0xe

    if-eq v0, v1, :cond_1e

    const/16 v1, 0x18

    if-eq v0, v1, :cond_1c

    const/16 v1, 0x21

    if-eq v0, v1, :cond_1a

    const/16 v1, 0x31

    if-eq v0, v1, :cond_19

    const/16 v1, 0x3a

    if-eq v0, v1, :cond_15

    const/16 v1, 0x11

    if-eq v0, v1, :cond_12

    const/16 v1, 0x12

    if-eq v0, v1, :cond_d

    const/16 v1, 0x23

    if-eq v0, v1, :cond_8

    const/16 v1, 0x24

    if-eq v0, v1, :cond_8

    packed-switch v0, :pswitch_data_1

    .line 2
    invoke-virtual {p0, p1}, Lbu1;->b(Ljava/lang/String;)V

    throw v7

    .line 3
    :pswitch_0
    const-string p0, "VAR"

    invoke-static {p0, v4, p3}, Lbe2;->M(Ljava/lang/String;ILjava/util/List;)V

    .line 4
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result p0

    :goto_0
    if-ge v6, p0, :cond_1

    invoke-virtual {p3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    add-int/lit8 v6, v6, 0x1

    check-cast p1, Lst1;

    .line 5
    iget-object v0, p2, Ler0;->l:Ljava/lang/Object;

    check-cast v0, Lxn0;

    invoke-virtual {v0, p2, p1}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object p1

    .line 6
    instance-of v0, p1, Lxt1;

    if-eqz v0, :cond_0

    .line 7
    check-cast p1, Lxt1;

    .line 8
    iget-object p1, p1, Lxt1;->j:Ljava/lang/String;

    .line 9
    sget-object v0, Lst1;->b:Lzt1;

    invoke-virtual {p2, p1, v0}, Ler0;->B(Ljava/lang/String;Lst1;)V

    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object p0

    .line 11
    const-string p1, "Expected string for var name. got "

    .line 12
    invoke-static {p1, p0}, Loq;->h(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 13
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    goto/16 :goto_7

    .line 14
    :cond_1
    sget-object v7, Lst1;->b:Lzt1;

    goto/16 :goto_7

    .line 15
    :pswitch_1
    const-string p0, "UNDEFINED"

    invoke-static {p0, v6, p3}, Lbe2;->K(Ljava/lang/String;ILjava/util/List;)V

    .line 16
    sget-object v7, Lst1;->b:Lzt1;

    goto/16 :goto_7

    .line 17
    :pswitch_2
    const-string p0, "TYPEOF"

    invoke-static {p0, v4, p3}, Lbe2;->K(Ljava/lang/String;ILjava/util/List;)V

    .line 18
    invoke-virtual {p3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lst1;

    .line 19
    iget-object p1, p2, Ler0;->l:Ljava/lang/Object;

    check-cast p1, Lxn0;

    invoke-virtual {p1, p2, p0}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object p0

    .line 20
    instance-of p1, p0, Lzt1;

    if-eqz p1, :cond_2

    const-string p0, "undefined"

    goto :goto_1

    .line 21
    :cond_2
    instance-of p1, p0, Liq1;

    if-eqz p1, :cond_3

    const-string p0, "boolean"

    goto :goto_1

    :cond_3
    instance-of p1, p0, Lrr1;

    if-eqz p1, :cond_4

    const-string p0, "number"

    goto :goto_1

    :cond_4
    instance-of p1, p0, Lxt1;

    if-eqz p1, :cond_5

    const-string p0, "string"

    goto :goto_1

    :cond_5
    instance-of p1, p0, Lqt1;

    if-eqz p1, :cond_6

    const-string p0, "function"

    goto :goto_1

    :cond_6
    instance-of p1, p0, Ltt1;

    if-nez p1, :cond_7

    instance-of p1, p0, Lbr1;

    if-nez p1, :cond_7

    const-string p0, "object"

    .line 22
    :goto_1
    new-instance v7, Lxt1;

    .line 23
    invoke-direct {v7, p0}, Lxt1;-><init>(Ljava/lang/String;)V

    goto/16 :goto_7

    .line 24
    :cond_7
    new-instance p1, Ljava/lang/IllegalArgumentException;

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    const-string p2, "Unsupported value type %s in typeof"

    .line 25
    invoke-static {p2, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 26
    :cond_8
    const-string p0, "GET_PROPERTY"

    invoke-static {p0, v5, p3}, Lbe2;->K(Ljava/lang/String;ILjava/util/List;)V

    .line 27
    invoke-virtual {p3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lst1;

    .line 28
    iget-object p1, p2, Ler0;->l:Ljava/lang/Object;

    check-cast p1, Lxn0;

    invoke-virtual {p1, p2, p0}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object p0

    .line 29
    invoke-virtual {p3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lst1;

    .line 30
    iget-object p3, p2, Ler0;->l:Ljava/lang/Object;

    check-cast p3, Lxn0;

    invoke-virtual {p3, p2, p1}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object p1

    .line 31
    instance-of p2, p0, Lrp1;

    if-eqz p2, :cond_9

    .line 32
    invoke-static {p1}, Lbe2;->P(Lst1;)Z

    move-result p2

    if-eqz p2, :cond_9

    .line 33
    check-cast p0, Lrp1;

    invoke-interface {p1}, Lst1;->f()Ljava/lang/Double;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Double;->intValue()I

    move-result p1

    invoke-virtual {p0, p1}, Lrp1;->t(I)Lst1;

    move-result-object v7

    goto/16 :goto_7

    :cond_9
    instance-of p2, p0, Lkt1;

    if-eqz p2, :cond_a

    .line 34
    check-cast p0, Lkt1;

    invoke-interface {p1}, Lst1;->e()Ljava/lang/String;

    move-result-object p1

    invoke-interface {p0, p1}, Lkt1;->h(Ljava/lang/String;)Lst1;

    move-result-object v7

    goto/16 :goto_7

    :cond_a
    instance-of p2, p0, Lxt1;

    if-eqz p2, :cond_c

    .line 35
    invoke-interface {p1}, Lst1;->e()Ljava/lang/String;

    move-result-object p2

    const-string p3, "length"

    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_b

    new-instance v7, Lrr1;

    .line 36
    check-cast p0, Lxt1;

    .line 37
    iget-object p0, p0, Lxt1;->j:Ljava/lang/String;

    .line 38
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p0

    int-to-double p0, p0

    invoke-static {p0, p1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p0

    invoke-direct {v7, p0}, Lrr1;-><init>(Ljava/lang/Double;)V

    goto/16 :goto_7

    .line 39
    :cond_b
    invoke-static {p1}, Lbe2;->P(Lst1;)Z

    move-result p2

    if-eqz p2, :cond_c

    .line 40
    invoke-interface {p1}, Lst1;->f()Ljava/lang/Double;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide p2

    check-cast p0, Lxt1;

    iget-object p0, p0, Lxt1;->j:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    int-to-double v0, v0

    cmpg-double p2, p2, v0

    if-gez p2, :cond_c

    new-instance v7, Lxt1;

    .line 41
    invoke-interface {p1}, Lst1;->f()Ljava/lang/Double;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Double;->intValue()I

    move-result p1

    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result p0

    invoke-static {p0}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v7, p0}, Lxt1;-><init>(Ljava/lang/String;)V

    goto/16 :goto_7

    .line 42
    :cond_c
    sget-object v7, Lst1;->b:Lzt1;

    goto/16 :goto_7

    .line 43
    :cond_d
    invoke-virtual {p3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_e

    new-instance v7, Lnt1;

    .line 44
    invoke-direct {v7}, Lnt1;-><init>()V

    goto/16 :goto_7

    .line 45
    :cond_e
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result p0

    rem-int/2addr p0, v5

    if-nez p0, :cond_11

    .line 46
    new-instance p0, Lnt1;

    .line 47
    invoke-direct {p0}, Lnt1;-><init>()V

    .line 48
    :goto_2
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result p1

    add-int/lit8 p1, p1, -0x1

    if-ge v6, p1, :cond_10

    .line 49
    invoke-virtual {p3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lst1;

    .line 50
    iget-object v0, p2, Ler0;->l:Ljava/lang/Object;

    check-cast v0, Lxn0;

    invoke-virtual {v0, p2, p1}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object p1

    add-int/lit8 v0, v6, 0x1

    .line 51
    invoke-virtual {p3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lst1;

    .line 52
    iget-object v1, p2, Ler0;->l:Ljava/lang/Object;

    check-cast v1, Lxn0;

    invoke-virtual {v1, p2, v0}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object v0

    .line 53
    instance-of v1, p1, Lbr1;

    if-nez v1, :cond_f

    instance-of v1, v0, Lbr1;

    if-nez v1, :cond_f

    .line 54
    invoke-interface {p1}, Lst1;->e()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1, v0}, Lnt1;->b(Ljava/lang/String;Lst1;)V

    add-int/lit8 v6, v6, 0x2

    goto :goto_2

    .line 55
    :cond_f
    const-string p0, "Failed to evaluate map entry"

    .line 56
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    goto/16 :goto_7

    :cond_10
    move-object v7, p0

    goto/16 :goto_7

    .line 57
    :cond_11
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result p0

    .line 58
    const-string p1, "CREATE_OBJECT requires an even number of arguments, found "

    .line 59
    invoke-static {p0, p1}, Loq;->f(ILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 60
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    goto/16 :goto_7

    .line 61
    :cond_12
    invoke-virtual {p3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_13

    new-instance v7, Lrp1;

    .line 62
    invoke-direct {v7}, Lrp1;-><init>()V

    goto/16 :goto_7

    :cond_13
    new-instance p0, Lrp1;

    .line 63
    invoke-direct {p0}, Lrp1;-><init>()V

    .line 64
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result p1

    move v0, v6

    :goto_3
    if-ge v0, p1, :cond_10

    invoke-virtual {p3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    add-int/lit8 v0, v0, 0x1

    check-cast v1, Lst1;

    .line 65
    iget-object v2, p2, Ler0;->l:Ljava/lang/Object;

    check-cast v2, Lxn0;

    invoke-virtual {v2, p2, v1}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object v1

    .line 66
    instance-of v2, v1, Lbr1;

    if-nez v2, :cond_14

    add-int/lit8 v2, v6, 0x1

    .line 67
    invoke-virtual {p0, v6, v1}, Lrp1;->u(ILst1;)V

    move v6, v2

    goto :goto_3

    .line 68
    :cond_14
    const-string p0, "Failed to evaluate array element"

    .line 69
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    goto/16 :goto_7

    .line 70
    :cond_15
    const-string p0, "SET_PROPERTY"

    invoke-static {p0, v3, p3}, Lbe2;->K(Ljava/lang/String;ILjava/util/List;)V

    .line 71
    invoke-virtual {p3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lst1;

    .line 72
    iget-object p1, p2, Ler0;->l:Ljava/lang/Object;

    check-cast p1, Lxn0;

    iget-object v0, p2, Ler0;->l:Ljava/lang/Object;

    check-cast v0, Lxn0;

    invoke-virtual {p1, p2, p0}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object p0

    .line 73
    invoke-virtual {p3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lst1;

    .line 74
    invoke-virtual {v0, p2, p1}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object p1

    .line 75
    invoke-virtual {p3, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lst1;

    .line 76
    invoke-virtual {v0, p2, p3}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object p2

    .line 77
    sget-object p3, Lst1;->b:Lzt1;

    if-eq p0, p3, :cond_18

    sget-object p3, Lst1;->c:Lpt1;

    if-eq p0, p3, :cond_18

    .line 78
    instance-of p3, p0, Lrp1;

    if-eqz p3, :cond_16

    instance-of p3, p1, Lrr1;

    if-eqz p3, :cond_16

    .line 79
    check-cast p0, Lrp1;

    .line 80
    check-cast p1, Lrr1;

    .line 81
    iget-object p1, p1, Lrr1;->j:Ljava/lang/Double;

    .line 82
    invoke-virtual {p1}, Ljava/lang/Double;->intValue()I

    move-result p1

    .line 83
    invoke-virtual {p0, p1, p2}, Lrp1;->u(ILst1;)V

    :goto_4
    move-object v7, p2

    goto/16 :goto_7

    :cond_16
    instance-of p3, p0, Lkt1;

    if-nez p3, :cond_17

    goto :goto_4

    .line 84
    :cond_17
    check-cast p0, Lkt1;

    invoke-interface {p1}, Lst1;->e()Ljava/lang/String;

    move-result-object p1

    invoke-interface {p0, p1, p2}, Lkt1;->b(Ljava/lang/String;Lst1;)V

    goto :goto_4

    .line 85
    :cond_18
    invoke-interface {p1}, Lst1;->e()Ljava/lang/String;

    move-result-object p1

    invoke-interface {p0}, Lst1;->e()Ljava/lang/String;

    move-result-object p0

    const-string p2, "Can\'t set property "

    const-string p3, " of "

    invoke-static {p2, p1, p3, p0}, Lo40;->s(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    goto/16 :goto_7

    .line 86
    :cond_19
    const-string p0, "NULL"

    invoke-static {p0, v6, p3}, Lbe2;->K(Ljava/lang/String;ILjava/util/List;)V

    .line 87
    sget-object v7, Lst1;->c:Lpt1;

    goto/16 :goto_7

    .line 88
    :cond_1a
    const-string p0, "GET"

    invoke-static {p0, v4, p3}, Lbe2;->K(Ljava/lang/String;ILjava/util/List;)V

    .line 89
    invoke-virtual {p3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lst1;

    .line 90
    iget-object p1, p2, Ler0;->l:Ljava/lang/Object;

    check-cast p1, Lxn0;

    invoke-virtual {p1, p2, p0}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object p0

    .line 91
    instance-of p1, p0, Lxt1;

    if-eqz p1, :cond_1b

    .line 92
    check-cast p0, Lxt1;

    .line 93
    iget-object p0, p0, Lxt1;->j:Ljava/lang/String;

    .line 94
    invoke-virtual {p2, p0}, Ler0;->C(Ljava/lang/String;)Lst1;

    move-result-object v7

    goto/16 :goto_7

    .line 95
    :cond_1b
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object p0

    .line 96
    const-string p1, "Expected string for get var. got "

    .line 97
    invoke-static {p1, p0}, Loq;->h(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 98
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    goto/16 :goto_7

    .line 99
    :cond_1c
    const-string p0, "EXPRESSION_LIST"

    invoke-static {p0, v4, p3}, Lbe2;->M(Ljava/lang/String;ILjava/util/List;)V

    .line 100
    sget-object p0, Lst1;->b:Lzt1;

    .line 101
    :goto_5
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-ge v6, p1, :cond_10

    .line 102
    invoke-virtual {p3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lst1;

    .line 103
    iget-object p1, p2, Ler0;->l:Ljava/lang/Object;

    check-cast p1, Lxn0;

    invoke-virtual {p1, p2, p0}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object p0

    .line 104
    instance-of p1, p0, Lbr1;

    if-nez p1, :cond_1d

    add-int/lit8 v6, v6, 0x1

    goto :goto_5

    :cond_1d
    const-string p0, "ControlValue cannot be in an expression list"

    .line 105
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    goto/16 :goto_7

    .line 106
    :cond_1e
    const-string p0, "CONST"

    invoke-static {p0, v5, p3}, Lbe2;->M(Ljava/lang/String;ILjava/util/List;)V

    .line 107
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result p0

    rem-int/2addr p0, v5

    if-nez p0, :cond_21

    .line 108
    :goto_6
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result p0

    add-int/lit8 p0, p0, -0x1

    if-ge v6, p0, :cond_20

    .line 109
    invoke-virtual {p3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lst1;

    .line 110
    iget-object p1, p2, Ler0;->l:Ljava/lang/Object;

    check-cast p1, Lxn0;

    invoke-virtual {p1, p2, p0}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object p0

    .line 111
    instance-of p1, p0, Lxt1;

    if-eqz p1, :cond_1f

    .line 112
    check-cast p0, Lxt1;

    .line 113
    iget-object p0, p0, Lxt1;->j:Ljava/lang/String;

    add-int/lit8 p1, v6, 0x1

    .line 114
    invoke-virtual {p3, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lst1;

    .line 115
    iget-object v0, p2, Ler0;->l:Ljava/lang/Object;

    check-cast v0, Lxn0;

    invoke-virtual {v0, p2, p1}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object p1

    .line 116
    invoke-virtual {p2, p0, p1}, Ler0;->B(Ljava/lang/String;Lst1;)V

    iget-object p1, p2, Ler0;->n:Ljava/lang/Object;

    check-cast p1, Ljava/util/HashMap;

    .line 117
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {p1, p0, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v6, v6, 0x2

    goto :goto_6

    .line 118
    :cond_1f
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object p0

    .line 119
    const-string p1, "Expected string for const name. got "

    .line 120
    invoke-static {p1, p0}, Loq;->h(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 121
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    goto :goto_7

    .line 122
    :cond_20
    sget-object v7, Lst1;->b:Lzt1;

    goto :goto_7

    .line 123
    :cond_21
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result p0

    const-string p1, "CONST requires an even number of arguments, found "

    .line 124
    invoke-static {p0, p1}, Loq;->f(ILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 125
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    goto :goto_7

    .line 126
    :cond_22
    const-string p0, "ASSIGN"

    invoke-static {p0, v5, p3}, Lbe2;->K(Ljava/lang/String;ILjava/util/List;)V

    .line 127
    invoke-virtual {p3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lst1;

    .line 128
    iget-object p1, p2, Ler0;->l:Ljava/lang/Object;

    check-cast p1, Lxn0;

    invoke-virtual {p1, p2, p0}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object p0

    .line 129
    instance-of p1, p0, Lxt1;

    if-eqz p1, :cond_24

    .line 130
    check-cast p0, Lxt1;

    iget-object p0, p0, Lxt1;->j:Ljava/lang/String;

    invoke-virtual {p2, p0}, Ler0;->z(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_23

    .line 131
    invoke-virtual {p3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lst1;

    .line 132
    iget-object p3, p2, Ler0;->l:Ljava/lang/Object;

    check-cast p3, Lxn0;

    invoke-virtual {p3, p2, p1}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object v7

    .line 133
    invoke-virtual {p2, p0, v7}, Ler0;->A(Ljava/lang/String;Lst1;)V

    goto :goto_7

    .line 134
    :cond_23
    const-string p1, "Attempting to assign undefined value "

    .line 135
    invoke-static {p1, p0}, Loq;->h(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 136
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    goto :goto_7

    .line 137
    :cond_24
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object p0

    .line 138
    const-string p1, "Expected string for assign var. got "

    .line 139
    invoke-static {p1, p0}, Loq;->h(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 140
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    :goto_7
    return-object v7

    :pswitch_3
    if-eqz p1, :cond_26

    .line 141
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_26

    invoke-virtual {p2, p1}, Ler0;->z(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_26

    .line 142
    invoke-virtual {p2, p1}, Ler0;->C(Ljava/lang/String;)Lst1;

    move-result-object p0

    instance-of v0, p0, Lms1;

    if-eqz v0, :cond_25

    .line 143
    check-cast p0, Lms1;

    invoke-virtual {p0, p2, p3}, Lms1;->a(Ler0;Ljava/util/List;)Lst1;

    move-result-object v7

    goto :goto_8

    .line 144
    :cond_25
    const-string p0, "Function "

    .line 145
    const-string p2, " is not defined"

    .line 146
    invoke-static {p0, p1, p2}, Loq;->j(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 147
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    goto :goto_8

    .line 148
    :cond_26
    const-string p0, "Command not found: "

    .line 149
    invoke-static {p0, p1}, Loq;->h(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 150
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    :goto_8
    return-object v7

    .line 151
    :pswitch_4
    sget-object v0, Luu1;->k:Luu1;

    invoke-static {p1}, Lbe2;->Q(Ljava/lang/String;)Luu1;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    if-eqz v0, :cond_2b

    const/16 v1, 0x15

    if-eq v0, v1, :cond_2a

    const/16 v1, 0x3b

    if-eq v0, v1, :cond_29

    const/16 v1, 0x34

    if-eq v0, v1, :cond_28

    const/16 v1, 0x35

    if-eq v0, v1, :cond_28

    const/16 v1, 0x37

    if-eq v0, v1, :cond_27

    const/16 v1, 0x38

    if-eq v0, v1, :cond_27

    packed-switch v0, :pswitch_data_2

    .line 152
    invoke-virtual {p0, p1}, Lbu1;->b(Ljava/lang/String;)V

    throw v7

    .line 153
    :pswitch_5
    const-string p0, "NEGATE"

    invoke-static {p0, v4, p3}, Lbe2;->K(Ljava/lang/String;ILjava/util/List;)V

    .line 154
    invoke-virtual {p3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lst1;

    .line 155
    iget-object p1, p2, Ler0;->l:Ljava/lang/Object;

    check-cast p1, Lxn0;

    invoke-virtual {p1, p2, p0}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object p0

    .line 156
    new-instance p1, Lrr1;

    .line 157
    invoke-interface {p0}, Lst1;->f()Ljava/lang/Double;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide p2

    neg-double p2, p2

    invoke-static {p2, p3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p0

    invoke-direct {p1, p0}, Lrr1;-><init>(Ljava/lang/Double;)V

    goto/16 :goto_b

    .line 158
    :pswitch_6
    const-string p0, "MULTIPLY"

    invoke-static {p0, v5, p3}, Lbe2;->K(Ljava/lang/String;ILjava/util/List;)V

    .line 159
    invoke-virtual {p3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lst1;

    .line 160
    iget-object p1, p2, Ler0;->l:Ljava/lang/Object;

    check-cast p1, Lxn0;

    invoke-virtual {p1, p2, p0}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object p0

    .line 161
    invoke-interface {p0}, Lst1;->f()Ljava/lang/Double;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide p0

    .line 162
    invoke-virtual {p3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lst1;

    .line 163
    iget-object v0, p2, Ler0;->l:Ljava/lang/Object;

    check-cast v0, Lxn0;

    invoke-virtual {v0, p2, p3}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object p2

    .line 164
    invoke-interface {p2}, Lst1;->f()Ljava/lang/Double;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide p2

    mul-double/2addr p2, p0

    new-instance p1, Lrr1;

    .line 165
    invoke-static {p2, p3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p0

    invoke-direct {p1, p0}, Lrr1;-><init>(Ljava/lang/Double;)V

    goto/16 :goto_b

    .line 166
    :pswitch_7
    const-string p0, "MODULUS"

    invoke-static {p0, v5, p3}, Lbe2;->K(Ljava/lang/String;ILjava/util/List;)V

    .line 167
    invoke-virtual {p3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lst1;

    .line 168
    iget-object p1, p2, Ler0;->l:Ljava/lang/Object;

    check-cast p1, Lxn0;

    invoke-virtual {p1, p2, p0}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object p0

    .line 169
    invoke-interface {p0}, Lst1;->f()Ljava/lang/Double;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide p0

    .line 170
    invoke-virtual {p3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lst1;

    .line 171
    iget-object v0, p2, Ler0;->l:Ljava/lang/Object;

    check-cast v0, Lxn0;

    invoke-virtual {v0, p2, p3}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object p2

    .line 172
    invoke-interface {p2}, Lst1;->f()Ljava/lang/Double;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide p2

    rem-double/2addr p0, p2

    new-instance p2, Lrr1;

    .line 173
    invoke-static {p0, p1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p0

    invoke-direct {p2, p0}, Lrr1;-><init>(Ljava/lang/Double;)V

    :goto_9
    move-object p1, p2

    goto/16 :goto_b

    .line 174
    :cond_27
    invoke-static {p1, v4, p3}, Lbe2;->K(Ljava/lang/String;ILjava/util/List;)V

    .line 175
    invoke-virtual {p3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lst1;

    .line 176
    iget-object p1, p2, Ler0;->l:Ljava/lang/Object;

    check-cast p1, Lxn0;

    invoke-virtual {p1, p2, p0}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object p1

    goto/16 :goto_b

    .line 177
    :cond_28
    invoke-static {p1, v5, p3}, Lbe2;->K(Ljava/lang/String;ILjava/util/List;)V

    .line 178
    invoke-virtual {p3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lst1;

    .line 179
    iget-object p1, p2, Ler0;->l:Ljava/lang/Object;

    check-cast p1, Lxn0;

    invoke-virtual {p1, p2, p0}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object p1

    .line 180
    invoke-virtual {p3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lst1;

    invoke-virtual {p2, p0}, Ler0;->v(Lst1;)Lst1;

    goto/16 :goto_b

    .line 181
    :cond_29
    const-string p0, "SUBTRACT"

    invoke-static {p0, v5, p3}, Lbe2;->K(Ljava/lang/String;ILjava/util/List;)V

    .line 182
    invoke-virtual {p3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lst1;

    .line 183
    iget-object p1, p2, Ler0;->l:Ljava/lang/Object;

    check-cast p1, Lxn0;

    invoke-virtual {p1, p2, p0}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object p0

    .line 184
    invoke-virtual {p3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lst1;

    .line 185
    iget-object p3, p2, Ler0;->l:Ljava/lang/Object;

    check-cast p3, Lxn0;

    invoke-virtual {p3, p2, p1}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object p1

    .line 186
    invoke-interface {p1}, Lst1;->f()Ljava/lang/Double;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide p1

    neg-double p1, p1

    new-instance p3, Lrr1;

    .line 187
    invoke-interface {p0}, Lst1;->f()Ljava/lang/Double;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    add-double/2addr v0, p1

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p0

    invoke-direct {p3, p0}, Lrr1;-><init>(Ljava/lang/Double;)V

    move-object p1, p3

    goto/16 :goto_b

    .line 188
    :cond_2a
    const-string p0, "DIVIDE"

    invoke-static {p0, v5, p3}, Lbe2;->K(Ljava/lang/String;ILjava/util/List;)V

    .line 189
    invoke-virtual {p3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lst1;

    .line 190
    iget-object p1, p2, Ler0;->l:Ljava/lang/Object;

    check-cast p1, Lxn0;

    invoke-virtual {p1, p2, p0}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object p0

    .line 191
    invoke-interface {p0}, Lst1;->f()Ljava/lang/Double;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide p0

    .line 192
    invoke-virtual {p3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lst1;

    .line 193
    iget-object v0, p2, Ler0;->l:Ljava/lang/Object;

    check-cast v0, Lxn0;

    invoke-virtual {v0, p2, p3}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object p2

    .line 194
    invoke-interface {p2}, Lst1;->f()Ljava/lang/Double;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide p2

    div-double/2addr p0, p2

    new-instance p2, Lrr1;

    .line 195
    invoke-static {p0, p1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p0

    invoke-direct {p2, p0}, Lrr1;-><init>(Ljava/lang/Double;)V

    goto/16 :goto_9

    .line 196
    :cond_2b
    const-string p0, "ADD"

    invoke-static {p0, v5, p3}, Lbe2;->K(Ljava/lang/String;ILjava/util/List;)V

    .line 197
    invoke-virtual {p3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lst1;

    .line 198
    iget-object p1, p2, Ler0;->l:Ljava/lang/Object;

    check-cast p1, Lxn0;

    invoke-virtual {p1, p2, p0}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object p0

    .line 199
    invoke-virtual {p3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lst1;

    .line 200
    iget-object p3, p2, Ler0;->l:Ljava/lang/Object;

    check-cast p3, Lxn0;

    invoke-virtual {p3, p2, p1}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object p1

    .line 201
    instance-of p2, p0, Lkt1;

    if-nez p2, :cond_2d

    instance-of p2, p0, Lxt1;

    if-nez p2, :cond_2d

    instance-of p2, p1, Lkt1;

    if-nez p2, :cond_2d

    instance-of p2, p1, Lxt1;

    if-eqz p2, :cond_2c

    goto :goto_a

    .line 202
    :cond_2c
    new-instance p2, Lrr1;

    .line 203
    invoke-interface {p0}, Lst1;->f()Ljava/lang/Double;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    invoke-interface {p1}, Lst1;->f()Ljava/lang/Double;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide p0

    add-double/2addr p0, v0

    invoke-static {p0, p1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p0

    invoke-direct {p2, p0}, Lrr1;-><init>(Ljava/lang/Double;)V

    goto/16 :goto_9

    .line 204
    :cond_2d
    :goto_a
    new-instance p2, Lxt1;

    .line 205
    invoke-interface {p0}, Lst1;->e()Ljava/lang/String;

    move-result-object p0

    invoke-interface {p1}, Lst1;->e()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {p2, p0}, Lxt1;-><init>(Ljava/lang/String;)V

    goto/16 :goto_9

    :goto_b
    return-object p1

    .line 206
    :pswitch_8
    sget-object v0, Luu1;->k:Luu1;

    invoke-static {p1}, Lbe2;->Q(Ljava/lang/String;)Luu1;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    const/16 v8, 0x41

    const/4 v9, 0x4

    if-eq v0, v8, :cond_40

    packed-switch v0, :pswitch_data_3

    .line 207
    invoke-virtual {p0, p1}, Lbu1;->b(Ljava/lang/String;)V

    throw v7

    .line 208
    :pswitch_9
    const-string p0, "FOR_OF_LET"

    invoke-static {p0, v3, p3}, Lbe2;->K(Ljava/lang/String;ILjava/util/List;)V

    .line 209
    invoke-virtual {p3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    instance-of p0, p0, Lxt1;

    if-eqz p0, :cond_2e

    .line 210
    invoke-virtual {p3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lst1;

    invoke-interface {p0}, Lst1;->e()Ljava/lang/String;

    move-result-object p0

    .line 211
    invoke-virtual {p3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lst1;

    .line 212
    iget-object v0, p2, Ler0;->l:Ljava/lang/Object;

    check-cast v0, Lxn0;

    invoke-virtual {v0, p2, p1}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object p1

    .line 213
    invoke-virtual {p3, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lst1;

    .line 214
    iget-object v0, p2, Ler0;->l:Ljava/lang/Object;

    check-cast v0, Lxn0;

    invoke-virtual {v0, p2, p3}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object p3

    .line 215
    new-instance v0, Lqu1;

    invoke-direct {v0, p2, p0, v4}, Lqu1;-><init>(Ler0;Ljava/lang/String;I)V

    .line 216
    invoke-static {v0, p1, p3}, Lbu1;->e(Lqu1;Lst1;Lst1;)Lst1;

    move-result-object v7

    goto/16 :goto_12

    .line 217
    :cond_2e
    const-string p0, "Variable name in FOR_OF_LET must be a string"

    .line 218
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    goto/16 :goto_12

    .line 219
    :pswitch_a
    const-string p0, "FOR_OF_CONST"

    invoke-static {p0, v3, p3}, Lbe2;->K(Ljava/lang/String;ILjava/util/List;)V

    .line 220
    invoke-virtual {p3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    instance-of p0, p0, Lxt1;

    if-eqz p0, :cond_2f

    .line 221
    invoke-virtual {p3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lst1;

    invoke-interface {p0}, Lst1;->e()Ljava/lang/String;

    move-result-object p0

    .line 222
    invoke-virtual {p3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lst1;

    .line 223
    iget-object v0, p2, Ler0;->l:Ljava/lang/Object;

    check-cast v0, Lxn0;

    invoke-virtual {v0, p2, p1}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object p1

    .line 224
    invoke-virtual {p3, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lst1;

    .line 225
    iget-object v0, p2, Ler0;->l:Ljava/lang/Object;

    check-cast v0, Lxn0;

    invoke-virtual {v0, p2, p3}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object p3

    .line 226
    new-instance v0, Lqu1;

    invoke-direct {v0, p2, p0, v6}, Lqu1;-><init>(Ler0;Ljava/lang/String;I)V

    .line 227
    invoke-static {v0, p1, p3}, Lbu1;->e(Lqu1;Lst1;Lst1;)Lst1;

    move-result-object v7

    goto/16 :goto_12

    .line 228
    :cond_2f
    const-string p0, "Variable name in FOR_OF_CONST must be a string"

    .line 229
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    goto/16 :goto_12

    .line 230
    :pswitch_b
    const-string p0, "FOR_OF"

    invoke-static {p0, v3, p3}, Lbe2;->K(Ljava/lang/String;ILjava/util/List;)V

    .line 231
    invoke-virtual {p3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    instance-of p0, p0, Lxt1;

    if-eqz p0, :cond_30

    .line 232
    invoke-virtual {p3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lst1;

    invoke-interface {p0}, Lst1;->e()Ljava/lang/String;

    move-result-object p0

    .line 233
    invoke-virtual {p3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lst1;

    .line 234
    iget-object v0, p2, Ler0;->l:Ljava/lang/Object;

    check-cast v0, Lxn0;

    invoke-virtual {v0, p2, p1}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object p1

    .line 235
    invoke-virtual {p3, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lst1;

    .line 236
    iget-object v0, p2, Ler0;->l:Ljava/lang/Object;

    check-cast v0, Lxn0;

    invoke-virtual {v0, p2, p3}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object p3

    .line 237
    new-instance v0, Lqu1;

    invoke-direct {v0, p2, p0, v5}, Lqu1;-><init>(Ler0;Ljava/lang/String;I)V

    .line 238
    invoke-static {v0, p1, p3}, Lbu1;->e(Lqu1;Lst1;Lst1;)Lst1;

    move-result-object v7

    goto/16 :goto_12

    .line 239
    :cond_30
    const-string p0, "Variable name in FOR_OF must be a string"

    .line 240
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    goto/16 :goto_12

    .line 241
    :pswitch_c
    const-string p0, "FOR_LET"

    invoke-static {p0, v9, p3}, Lbe2;->K(Ljava/lang/String;ILjava/util/List;)V

    .line 242
    invoke-virtual {p3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lst1;

    .line 243
    iget-object p1, p2, Ler0;->l:Ljava/lang/Object;

    check-cast p1, Lxn0;

    iget-object v0, p2, Ler0;->l:Ljava/lang/Object;

    check-cast v0, Lxn0;

    invoke-virtual {p1, p2, p0}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object p0

    .line 244
    instance-of p1, p0, Lrp1;

    if-eqz p1, :cond_36

    .line 245
    check-cast p0, Lrp1;

    .line 246
    invoke-virtual {p3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lst1;

    .line 247
    invoke-virtual {p3, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lst1;

    .line 248
    invoke-virtual {p3, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lst1;

    .line 249
    invoke-virtual {v0, p2, p3}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object p3

    .line 250
    invoke-virtual {p2}, Ler0;->y()Ler0;

    move-result-object v3

    move v5, v6

    .line 251
    :goto_c
    invoke-virtual {p0}, Lrp1;->s()I

    move-result v7

    if-ge v5, v7, :cond_31

    .line 252
    invoke-virtual {p0, v5}, Lrp1;->t(I)Lst1;

    move-result-object v7

    invoke-interface {v7}, Lst1;->e()Ljava/lang/String;

    move-result-object v7

    .line 253
    invoke-virtual {p2, v7}, Ler0;->C(Ljava/lang/String;)Lst1;

    move-result-object v8

    invoke-virtual {v3, v7, v8}, Ler0;->A(Ljava/lang/String;Lst1;)V

    add-int/lit8 v5, v5, 0x1

    goto :goto_c

    .line 254
    :cond_31
    :goto_d
    invoke-virtual {v0, p2, p1}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object v5

    .line 255
    invoke-interface {v5}, Lst1;->c()Ljava/lang/Boolean;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    if-eqz v5, :cond_35

    .line 256
    move-object v5, p3

    check-cast v5, Lrp1;

    invoke-virtual {p2, v5}, Ler0;->w(Lrp1;)Lst1;

    move-result-object v5

    instance-of v7, v5, Lbr1;

    if-eqz v7, :cond_33

    .line 257
    move-object v7, v5

    check-cast v7, Lbr1;

    iget-object v5, v7, Lbr1;->k:Ljava/lang/String;

    .line 258
    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_32

    sget-object v7, Lst1;->b:Lzt1;

    goto/16 :goto_12

    .line 259
    :cond_32
    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_33

    goto/16 :goto_12

    .line 260
    :cond_33
    invoke-virtual {p2}, Ler0;->y()Ler0;

    move-result-object v5

    move v7, v6

    .line 261
    :goto_e
    invoke-virtual {p0}, Lrp1;->s()I

    move-result v8

    if-ge v7, v8, :cond_34

    .line 262
    invoke-virtual {p0, v7}, Lrp1;->t(I)Lst1;

    move-result-object v8

    invoke-interface {v8}, Lst1;->e()Ljava/lang/String;

    move-result-object v8

    .line 263
    invoke-virtual {v3, v8}, Ler0;->C(Ljava/lang/String;)Lst1;

    move-result-object v9

    invoke-virtual {v5, v8, v9}, Ler0;->A(Ljava/lang/String;Lst1;)V

    add-int/lit8 v7, v7, 0x1

    goto :goto_e

    .line 264
    :cond_34
    invoke-virtual {v5, v4}, Ler0;->v(Lst1;)Lst1;

    move-object v3, v5

    goto :goto_d

    :cond_35
    sget-object v7, Lst1;->b:Lzt1;

    goto/16 :goto_12

    .line 265
    :cond_36
    const-string p0, "Initializer variables in FOR_LET must be an ArrayList"

    .line 266
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    goto/16 :goto_12

    .line 267
    :pswitch_d
    const-string p0, "FOR_IN_LET"

    invoke-static {p0, v3, p3}, Lbe2;->K(Ljava/lang/String;ILjava/util/List;)V

    .line 268
    invoke-virtual {p3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    instance-of p0, p0, Lxt1;

    if-eqz p0, :cond_3a

    .line 269
    invoke-virtual {p3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lst1;

    invoke-interface {p0}, Lst1;->e()Ljava/lang/String;

    move-result-object p0

    .line 270
    invoke-virtual {p3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lst1;

    .line 271
    iget-object v0, p2, Ler0;->l:Ljava/lang/Object;

    check-cast v0, Lxn0;

    invoke-virtual {v0, p2, p1}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object p1

    .line 272
    invoke-virtual {p3, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lst1;

    .line 273
    iget-object v0, p2, Ler0;->l:Ljava/lang/Object;

    check-cast v0, Lxn0;

    invoke-virtual {v0, p2, p3}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object p3

    .line 274
    invoke-interface {p1}, Lst1;->d()Ljava/util/Iterator;

    move-result-object p1

    if-eqz p1, :cond_39

    .line 275
    :cond_37
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_39

    .line 276
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lst1;

    .line 277
    invoke-virtual {p2}, Ler0;->y()Ler0;

    move-result-object v3

    .line 278
    invoke-virtual {v3, p0, v0}, Ler0;->B(Ljava/lang/String;Lst1;)V

    .line 279
    move-object v0, p3

    check-cast v0, Lrp1;

    invoke-virtual {v3, v0}, Ler0;->w(Lrp1;)Lst1;

    move-result-object v0

    instance-of v3, v0, Lbr1;

    if-eqz v3, :cond_37

    .line 280
    check-cast v0, Lbr1;

    iget-object v3, v0, Lbr1;->k:Ljava/lang/String;

    .line 281
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_38

    sget-object p0, Lst1;->b:Lzt1;

    :goto_f
    move-object v7, p0

    goto/16 :goto_12

    .line 282
    :cond_38
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_37

    :goto_10
    move-object v7, v0

    goto/16 :goto_12

    .line 283
    :cond_39
    sget-object p0, Lst1;->b:Lzt1;

    goto :goto_f

    .line 284
    :cond_3a
    const-string p0, "Variable name in FOR_IN_LET must be a string"

    .line 285
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    goto/16 :goto_12

    .line 286
    :pswitch_e
    const-string p0, "FOR_IN_CONST"

    invoke-static {p0, v3, p3}, Lbe2;->K(Ljava/lang/String;ILjava/util/List;)V

    .line 287
    invoke-virtual {p3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    instance-of p0, p0, Lxt1;

    if-eqz p0, :cond_3b

    .line 288
    invoke-virtual {p3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lst1;

    invoke-interface {p0}, Lst1;->e()Ljava/lang/String;

    move-result-object p0

    .line 289
    invoke-virtual {p3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lst1;

    .line 290
    iget-object v0, p2, Ler0;->l:Ljava/lang/Object;

    check-cast v0, Lxn0;

    invoke-virtual {v0, p2, p1}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object p1

    .line 291
    invoke-virtual {p3, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lst1;

    .line 292
    iget-object v0, p2, Ler0;->l:Ljava/lang/Object;

    check-cast v0, Lxn0;

    invoke-virtual {v0, p2, p3}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object p3

    .line 293
    new-instance v0, Lqu1;

    invoke-direct {v0, p2, p0, v6}, Lqu1;-><init>(Ler0;Ljava/lang/String;I)V

    .line 294
    invoke-interface {p1}, Lst1;->d()Ljava/util/Iterator;

    move-result-object p0

    .line 295
    invoke-static {v0, p0, p3}, Lbu1;->g(Lqu1;Ljava/util/Iterator;Lst1;)Lst1;

    move-result-object v7

    goto/16 :goto_12

    .line 296
    :cond_3b
    const-string p0, "Variable name in FOR_IN_CONST must be a string"

    .line 297
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    goto/16 :goto_12

    .line 298
    :pswitch_f
    const-string p0, "FOR_IN"

    invoke-static {p0, v3, p3}, Lbe2;->K(Ljava/lang/String;ILjava/util/List;)V

    .line 299
    invoke-virtual {p3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    instance-of p0, p0, Lxt1;

    if-eqz p0, :cond_3f

    .line 300
    invoke-virtual {p3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lst1;

    invoke-interface {p0}, Lst1;->e()Ljava/lang/String;

    move-result-object p0

    .line 301
    invoke-virtual {p3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lst1;

    .line 302
    iget-object v0, p2, Ler0;->l:Ljava/lang/Object;

    check-cast v0, Lxn0;

    invoke-virtual {v0, p2, p1}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object p1

    .line 303
    invoke-virtual {p3, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lst1;

    .line 304
    iget-object v0, p2, Ler0;->l:Ljava/lang/Object;

    check-cast v0, Lxn0;

    invoke-virtual {v0, p2, p3}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object p3

    .line 305
    invoke-interface {p1}, Lst1;->d()Ljava/util/Iterator;

    move-result-object p1

    if-eqz p1, :cond_3e

    .line 306
    :cond_3c
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3e

    .line 307
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lst1;

    .line 308
    invoke-virtual {p2, p0, v0}, Ler0;->B(Ljava/lang/String;Lst1;)V

    .line 309
    move-object v0, p3

    check-cast v0, Lrp1;

    invoke-virtual {p2, v0}, Ler0;->w(Lrp1;)Lst1;

    move-result-object v0

    instance-of v3, v0, Lbr1;

    if-eqz v3, :cond_3c

    .line 310
    check-cast v0, Lbr1;

    iget-object v3, v0, Lbr1;->k:Ljava/lang/String;

    .line 311
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3d

    sget-object p0, Lst1;->b:Lzt1;

    goto/16 :goto_f

    .line 312
    :cond_3d
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3c

    goto/16 :goto_10

    .line 313
    :cond_3e
    sget-object p0, Lst1;->b:Lzt1;

    goto/16 :goto_f

    .line 314
    :cond_3f
    const-string p0, "Variable name in FOR_IN must be a string"

    .line 315
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    goto/16 :goto_12

    .line 316
    :cond_40
    const-string p0, "WHILE"

    invoke-static {p0, v9, p3}, Lbe2;->K(Ljava/lang/String;ILjava/util/List;)V

    .line 317
    invoke-virtual {p3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lst1;

    .line 318
    invoke-virtual {p3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lst1;

    .line 319
    invoke-virtual {p3, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lst1;

    .line 320
    invoke-virtual {p3, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lst1;

    .line 321
    iget-object v3, p2, Ler0;->l:Ljava/lang/Object;

    check-cast v3, Lxn0;

    iget-object v4, p2, Ler0;->l:Ljava/lang/Object;

    check-cast v4, Lxn0;

    invoke-virtual {v3, p2, p3}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object p3

    .line 322
    invoke-virtual {v4, p2, v0}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object v0

    .line 323
    invoke-interface {v0}, Lst1;->c()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_41

    goto :goto_11

    .line 324
    :cond_41
    move-object v0, p3

    check-cast v0, Lrp1;

    invoke-virtual {p2, v0}, Ler0;->w(Lrp1;)Lst1;

    move-result-object v0

    instance-of v3, v0, Lbr1;

    if-eqz v3, :cond_43

    .line 325
    move-object v7, v0

    check-cast v7, Lbr1;

    iget-object v0, v7, Lbr1;->k:Ljava/lang/String;

    .line 326
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_42

    sget-object v7, Lst1;->b:Lzt1;

    goto :goto_12

    .line 327
    :cond_42
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_43

    goto :goto_12

    .line 328
    :cond_43
    :goto_11
    invoke-virtual {v4, p2, p0}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object v0

    .line 329
    invoke-interface {v0}, Lst1;->c()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_46

    .line 330
    move-object v0, p3

    check-cast v0, Lrp1;

    invoke-virtual {p2, v0}, Ler0;->w(Lrp1;)Lst1;

    move-result-object v0

    instance-of v3, v0, Lbr1;

    if-eqz v3, :cond_45

    .line 331
    move-object v7, v0

    check-cast v7, Lbr1;

    iget-object v0, v7, Lbr1;->k:Ljava/lang/String;

    .line 332
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_44

    sget-object v7, Lst1;->b:Lzt1;

    goto :goto_12

    .line 333
    :cond_44
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_45

    goto :goto_12

    .line 334
    :cond_45
    invoke-virtual {p2, p1}, Ler0;->v(Lst1;)Lst1;

    goto :goto_11

    :cond_46
    sget-object v7, Lst1;->b:Lzt1;

    :goto_12
    return-object v7

    .line 335
    :pswitch_10
    sget-object v0, Luu1;->k:Luu1;

    invoke-static {p1}, Lbe2;->Q(Ljava/lang/String;)Luu1;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    if-eq v0, v4, :cond_49

    const/16 v1, 0x2f

    if-eq v0, v1, :cond_48

    const/16 v1, 0x32

    if-ne v0, v1, :cond_47

    .line 336
    const-string p0, "OR"

    invoke-static {p0, v5, p3}, Lbe2;->K(Ljava/lang/String;ILjava/util/List;)V

    .line 337
    invoke-virtual {p3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lst1;

    .line 338
    iget-object p1, p2, Ler0;->l:Ljava/lang/Object;

    check-cast p1, Lxn0;

    invoke-virtual {p1, p2, p0}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object p0

    .line 339
    invoke-interface {p0}, Lst1;->c()Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-nez p1, :cond_4a

    .line 340
    invoke-virtual {p3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lst1;

    .line 341
    iget-object p1, p2, Ler0;->l:Ljava/lang/Object;

    check-cast p1, Lxn0;

    invoke-virtual {p1, p2, p0}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object p0

    goto :goto_13

    .line 342
    :cond_47
    invoke-virtual {p0, p1}, Lbu1;->b(Ljava/lang/String;)V

    throw v7

    .line 343
    :cond_48
    const-string p0, "NOT"

    invoke-static {p0, v4, p3}, Lbe2;->K(Ljava/lang/String;ILjava/util/List;)V

    .line 344
    invoke-virtual {p3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lst1;

    .line 345
    iget-object p1, p2, Ler0;->l:Ljava/lang/Object;

    check-cast p1, Lxn0;

    invoke-virtual {p1, p2, p0}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object p0

    .line 346
    new-instance p1, Liq1;

    .line 347
    invoke-interface {p0}, Lst1;->c()Ljava/lang/Boolean;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    xor-int/2addr p0, v4

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    invoke-direct {p1, p0}, Liq1;-><init>(Ljava/lang/Boolean;)V

    move-object p0, p1

    goto :goto_13

    .line 348
    :cond_49
    const-string p0, "AND"

    invoke-static {p0, v5, p3}, Lbe2;->K(Ljava/lang/String;ILjava/util/List;)V

    .line 349
    invoke-virtual {p3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lst1;

    .line 350
    iget-object p1, p2, Ler0;->l:Ljava/lang/Object;

    check-cast p1, Lxn0;

    invoke-virtual {p1, p2, p0}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object p0

    .line 351
    invoke-interface {p0}, Lst1;->c()Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_4a

    .line 352
    invoke-virtual {p3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lst1;

    .line 353
    iget-object p1, p2, Ler0;->l:Ljava/lang/Object;

    check-cast p1, Lxn0;

    invoke-virtual {p1, p2, p0}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object p0

    :cond_4a
    :goto_13
    return-object p0

    .line 354
    :pswitch_11
    sget-object v0, Luu1;->k:Luu1;

    invoke-static {p1}, Lbe2;->Q(Ljava/lang/String;)Luu1;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    if-eq v0, v5, :cond_63

    const/16 v8, 0xf

    const-string v9, "BREAK"

    if-eq v0, v8, :cond_62

    const/16 v8, 0x19

    if-eq v0, v8, :cond_61

    const/16 v8, 0x29

    if-eq v0, v8, :cond_5d

    const/16 v8, 0x36

    if-eq v0, v8, :cond_5c

    const/16 v8, 0x39

    if-eq v0, v8, :cond_5a

    const/16 v8, 0x13

    if-eq v0, v8, :cond_57

    const/16 v8, 0x14

    if-eq v0, v8, :cond_55

    const/16 v8, 0x3c

    if-eq v0, v8, :cond_4d

    const/16 v1, 0x3d

    if-eq v0, v1, :cond_4b

    packed-switch v0, :pswitch_data_4

    .line 355
    invoke-virtual {p0, p1}, Lbu1;->b(Ljava/lang/String;)V

    throw v7

    .line 356
    :pswitch_12
    invoke-static {v9, v6, p3}, Lbe2;->K(Ljava/lang/String;ILjava/util/List;)V

    .line 357
    sget-object v7, Lst1;->e:Lbr1;

    goto/16 :goto_19

    .line 358
    :pswitch_13
    invoke-virtual {p2}, Ler0;->y()Ler0;

    move-result-object p0

    new-instance p1, Lrp1;

    .line 359
    invoke-direct {p1, p3}, Lrp1;-><init>(Ljava/util/List;)V

    invoke-virtual {p0, p1}, Ler0;->w(Lrp1;)Lst1;

    move-result-object v7

    goto/16 :goto_19

    .line 360
    :cond_4b
    const-string p0, "TERNARY"

    invoke-static {p0, v3, p3}, Lbe2;->K(Ljava/lang/String;ILjava/util/List;)V

    .line 361
    invoke-virtual {p3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lst1;

    .line 362
    iget-object p1, p2, Ler0;->l:Ljava/lang/Object;

    check-cast p1, Lxn0;

    iget-object v0, p2, Ler0;->l:Ljava/lang/Object;

    check-cast v0, Lxn0;

    invoke-virtual {p1, p2, p0}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object p0

    .line 363
    invoke-interface {p0}, Lst1;->c()Ljava/lang/Boolean;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    if-eqz p0, :cond_4c

    .line 364
    invoke-virtual {p3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lst1;

    .line 365
    invoke-virtual {v0, p2, p0}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object v7

    goto/16 :goto_19

    .line 366
    :cond_4c
    invoke-virtual {p3, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lst1;

    .line 367
    invoke-virtual {v0, p2, p0}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object v7

    goto/16 :goto_19

    .line 368
    :cond_4d
    const-string p0, "SWITCH"

    invoke-static {p0, v3, p3}, Lbe2;->K(Ljava/lang/String;ILjava/util/List;)V

    .line 369
    invoke-virtual {p3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lst1;

    .line 370
    iget-object p1, p2, Ler0;->l:Ljava/lang/Object;

    check-cast p1, Lxn0;

    iget-object v0, p2, Ler0;->l:Ljava/lang/Object;

    check-cast v0, Lxn0;

    invoke-virtual {p1, p2, p0}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object p0

    .line 371
    invoke-virtual {p3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lst1;

    .line 372
    invoke-virtual {v0, p2, p1}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object p1

    .line 373
    invoke-virtual {p3, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lst1;

    .line 374
    invoke-virtual {v0, p2, p3}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object p3

    .line 375
    instance-of v3, p1, Lrp1;

    if-eqz v3, :cond_54

    .line 376
    instance-of v3, p3, Lrp1;

    if-eqz v3, :cond_53

    .line 377
    check-cast p1, Lrp1;

    .line 378
    check-cast p3, Lrp1;

    move v3, v6

    move v5, v3

    .line 379
    :goto_14
    invoke-virtual {p1}, Lrp1;->s()I

    move-result v7

    if-ge v3, v7, :cond_51

    if-nez v5, :cond_4f

    .line 380
    invoke-virtual {p1, v3}, Lrp1;->t(I)Lst1;

    move-result-object v5

    .line 381
    invoke-virtual {v0, p2, v5}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object v5

    .line 382
    invoke-virtual {p0, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4e

    goto :goto_15

    :cond_4e
    move v5, v6

    goto :goto_16

    .line 383
    :cond_4f
    :goto_15
    invoke-virtual {p3, v3}, Lrp1;->t(I)Lst1;

    move-result-object v5

    .line 384
    invoke-virtual {v0, p2, v5}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object v7

    .line 385
    instance-of v5, v7, Lbr1;

    if-eqz v5, :cond_50

    .line 386
    move-object p0, v7

    check-cast p0, Lbr1;

    .line 387
    iget-object p0, p0, Lbr1;->k:Ljava/lang/String;

    .line 388
    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_66

    sget-object v7, Lst1;->b:Lzt1;

    goto/16 :goto_19

    :cond_50
    move v5, v4

    :goto_16
    add-int/lit8 v3, v3, 0x1

    goto :goto_14

    .line 389
    :cond_51
    invoke-virtual {p1}, Lrp1;->s()I

    move-result p0

    add-int/2addr p0, v4

    invoke-virtual {p3}, Lrp1;->s()I

    move-result v1

    if-ne p0, v1, :cond_52

    .line 390
    invoke-virtual {p1}, Lrp1;->s()I

    move-result p0

    invoke-virtual {p3, p0}, Lrp1;->t(I)Lst1;

    move-result-object p0

    .line 391
    invoke-virtual {v0, p2, p0}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object v7

    .line 392
    instance-of p0, v7, Lbr1;

    if-eqz p0, :cond_52

    .line 393
    move-object p0, v7

    check-cast p0, Lbr1;

    .line 394
    iget-object p0, p0, Lbr1;->k:Ljava/lang/String;

    .line 395
    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_66

    const-string p1, "continue"

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_66

    :cond_52
    sget-object v7, Lst1;->b:Lzt1;

    goto/16 :goto_19

    .line 396
    :cond_53
    const-string p0, "Malformed SWITCH statement, case statements are not a list"

    .line 397
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    goto/16 :goto_19

    .line 398
    :cond_54
    const-string p0, "Malformed SWITCH statement, cases are not a list"

    .line 399
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    goto/16 :goto_19

    .line 400
    :cond_55
    const-string p0, "DEFINE_FUNCTION"

    invoke-static {p0, v5, p3}, Lbe2;->M(Ljava/lang/String;ILjava/util/List;)V

    .line 401
    invoke-static {p2, p3}, Lbu1;->c(Ler0;Ljava/util/ArrayList;)Lqt1;

    move-result-object v7

    .line 402
    iget-object p0, v7, Lms1;->j:Ljava/lang/String;

    if-nez p0, :cond_56

    .line 403
    const-string p0, ""

    .line 404
    invoke-virtual {p2, p0, v7}, Ler0;->A(Ljava/lang/String;Lst1;)V

    goto/16 :goto_19

    .line 405
    :cond_56
    invoke-virtual {p2, p0, v7}, Ler0;->A(Ljava/lang/String;Lst1;)V

    goto/16 :goto_19

    .line 406
    :cond_57
    :pswitch_14
    invoke-virtual {p3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_58

    .line 407
    sget-object v7, Lst1;->b:Lzt1;

    goto/16 :goto_19

    .line 408
    :cond_58
    invoke-virtual {p3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lst1;

    .line 409
    iget-object p1, p2, Ler0;->l:Ljava/lang/Object;

    check-cast p1, Lxn0;

    invoke-virtual {p1, p2, p0}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object p0

    .line 410
    instance-of p1, p0, Lrp1;

    if-eqz p1, :cond_59

    .line 411
    check-cast p0, Lrp1;

    invoke-virtual {p2, p0}, Ler0;->w(Lrp1;)Lst1;

    move-result-object v7

    goto/16 :goto_19

    .line 412
    :cond_59
    sget-object v7, Lst1;->b:Lzt1;

    goto/16 :goto_19

    .line 413
    :cond_5a
    invoke-virtual {p3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_5b

    .line 414
    sget-object v7, Lst1;->f:Lbr1;

    goto/16 :goto_19

    .line 415
    :cond_5b
    const-string p0, "RETURN"

    invoke-static {p0, v4, p3}, Lbe2;->K(Ljava/lang/String;ILjava/util/List;)V

    .line 416
    invoke-virtual {p3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lst1;

    .line 417
    iget-object p1, p2, Ler0;->l:Ljava/lang/Object;

    check-cast p1, Lxn0;

    invoke-virtual {p1, p2, p0}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object p0

    .line 418
    new-instance v7, Lbr1;

    invoke-direct {v7, v2, p0}, Lbr1;-><init>(Ljava/lang/String;Lst1;)V

    goto/16 :goto_19

    .line 419
    :cond_5c
    new-instance v7, Lrp1;

    .line 420
    invoke-direct {v7, p3}, Lrp1;-><init>(Ljava/util/List;)V

    goto/16 :goto_19

    .line 421
    :cond_5d
    const-string p0, "IF"

    invoke-static {p0, v5, p3}, Lbe2;->M(Ljava/lang/String;ILjava/util/List;)V

    .line 422
    invoke-virtual {p3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lst1;

    .line 423
    iget-object p1, p2, Ler0;->l:Ljava/lang/Object;

    check-cast p1, Lxn0;

    iget-object v0, p2, Ler0;->l:Ljava/lang/Object;

    check-cast v0, Lxn0;

    invoke-virtual {p1, p2, p0}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object p0

    .line 424
    invoke-virtual {p3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lst1;

    .line 425
    invoke-virtual {v0, p2, p1}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object p1

    .line 426
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-le v1, v5, :cond_5e

    .line 427
    invoke-virtual {p3, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lst1;

    .line 428
    invoke-virtual {v0, p2, p3}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object v7

    .line 429
    :cond_5e
    sget-object p3, Lst1;->b:Lzt1;

    .line 430
    invoke-interface {p0}, Lst1;->c()Ljava/lang/Boolean;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    if-eqz p0, :cond_5f

    .line 431
    check-cast p1, Lrp1;

    invoke-virtual {p2, p1}, Ler0;->w(Lrp1;)Lst1;

    move-result-object p0

    :goto_17
    move-object v7, p0

    goto :goto_18

    :cond_5f
    if-eqz v7, :cond_60

    .line 432
    check-cast v7, Lrp1;

    invoke-virtual {p2, v7}, Ler0;->w(Lrp1;)Lst1;

    move-result-object p0

    goto :goto_17

    :cond_60
    move-object v7, p3

    .line 433
    :goto_18
    instance-of p0, v7, Lbr1;

    if-eq v4, p0, :cond_66

    move-object v7, p3

    goto :goto_19

    .line 434
    :cond_61
    invoke-static {p2, p3}, Lbu1;->c(Ler0;Ljava/util/ArrayList;)Lqt1;

    move-result-object v7

    goto :goto_19

    .line 435
    :cond_62
    invoke-static {v9, v6, p3}, Lbe2;->K(Ljava/lang/String;ILjava/util/List;)V

    .line 436
    sget-object v7, Lst1;->d:Lbr1;

    goto :goto_19

    .line 437
    :cond_63
    const-string p0, "APPLY"

    invoke-static {p0, v3, p3}, Lbe2;->K(Ljava/lang/String;ILjava/util/List;)V

    .line 438
    invoke-virtual {p3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lst1;

    .line 439
    iget-object p1, p2, Ler0;->l:Ljava/lang/Object;

    check-cast p1, Lxn0;

    iget-object v0, p2, Ler0;->l:Ljava/lang/Object;

    check-cast v0, Lxn0;

    invoke-virtual {p1, p2, p0}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object p0

    .line 440
    invoke-virtual {p3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lst1;

    .line 441
    invoke-virtual {v0, p2, p1}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object p1

    .line 442
    invoke-interface {p1}, Lst1;->e()Ljava/lang/String;

    move-result-object p1

    .line 443
    invoke-virtual {p3, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lst1;

    .line 444
    invoke-virtual {v0, p2, p3}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object p3

    .line 445
    instance-of v0, p3, Lrp1;

    if-eqz v0, :cond_65

    .line 446
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_64

    .line 447
    check-cast p3, Lrp1;

    invoke-virtual {p3}, Lrp1;->q()Ljava/util/List;

    move-result-object p3

    check-cast p3, Ljava/util/ArrayList;

    invoke-interface {p0, p1, p2, p3}, Lst1;->o(Ljava/lang/String;Ler0;Ljava/util/ArrayList;)Lst1;

    move-result-object v7

    goto :goto_19

    .line 448
    :cond_64
    const-string p0, "Function name for apply is undefined"

    .line 449
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    goto :goto_19

    .line 450
    :cond_65
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object p0

    .line 451
    const-string p1, "Function arguments for Apply are not a list found "

    .line 452
    invoke-static {p1, p0}, Loq;->h(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 453
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    :cond_66
    :goto_19
    return-object v7

    .line 454
    :pswitch_15
    invoke-static {p1}, Lbe2;->Q(Ljava/lang/String;)Luu1;

    move-result-object v0

    .line 455
    invoke-virtual {v0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v5, p3}, Lbe2;->K(Ljava/lang/String;ILjava/util/List;)V

    .line 456
    invoke-virtual {p3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lst1;

    .line 457
    iget-object v1, p2, Ler0;->l:Ljava/lang/Object;

    check-cast v1, Lxn0;

    invoke-virtual {v1, p2, v0}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object v0

    .line 458
    invoke-virtual {p3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lst1;

    .line 459
    iget-object v1, p2, Ler0;->l:Ljava/lang/Object;

    check-cast v1, Lxn0;

    invoke-virtual {v1, p2, p3}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object p2

    .line 460
    invoke-static {p1}, Lbe2;->Q(Ljava/lang/String;)Luu1;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/Enum;->ordinal()I

    move-result p3

    const/16 v1, 0x17

    if-eq p3, v1, :cond_6a

    const/16 v1, 0x30

    if-eq p3, v1, :cond_69

    const/16 v1, 0x2a

    if-eq p3, v1, :cond_68

    const/16 v1, 0x2b

    if-eq p3, v1, :cond_67

    packed-switch p3, :pswitch_data_5

    .line 461
    invoke-virtual {p0, p1}, Lbu1;->b(Ljava/lang/String;)V

    throw v7

    .line 462
    :pswitch_16
    invoke-static {v0, p2}, Lbe2;->R(Lst1;Lst1;)Z

    move-result p0

    :goto_1a
    xor-int/2addr p0, v4

    goto :goto_1b

    .line 463
    :pswitch_17
    invoke-static {v0, p2}, Lbe2;->R(Lst1;Lst1;)Z

    move-result p0

    goto :goto_1b

    .line 464
    :pswitch_18
    invoke-static {p2, v0}, Lbu1;->h(Lst1;Lst1;)Z

    move-result p0

    goto :goto_1b

    .line 465
    :pswitch_19
    invoke-static {p2, v0}, Lbu1;->d(Lst1;Lst1;)Z

    move-result p0

    goto :goto_1b

    .line 466
    :cond_67
    invoke-static {v0, p2}, Lbu1;->h(Lst1;Lst1;)Z

    move-result p0

    goto :goto_1b

    .line 467
    :cond_68
    invoke-static {v0, p2}, Lbu1;->d(Lst1;Lst1;)Z

    move-result p0

    goto :goto_1b

    .line 468
    :cond_69
    invoke-static {v0, p2}, Lbu1;->f(Lst1;Lst1;)Z

    move-result p0

    goto :goto_1a

    .line 469
    :cond_6a
    invoke-static {v0, p2}, Lbu1;->f(Lst1;Lst1;)Z

    move-result p0

    :goto_1b
    if-eqz p0, :cond_6b

    .line 470
    sget-object p0, Lst1;->g:Liq1;

    goto :goto_1c

    :cond_6b
    sget-object p0, Lst1;->h:Liq1;

    :goto_1c
    return-object p0

    .line 471
    :pswitch_1a
    sget-object v0, Luu1;->k:Luu1;

    invoke-static {p1}, Lbe2;->Q(Ljava/lang/String;)Luu1;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    const-wide/16 v1, 0x1f

    packed-switch v0, :pswitch_data_6

    .line 472
    invoke-virtual {p0, p1}, Lbu1;->b(Ljava/lang/String;)V

    throw v7

    .line 473
    :pswitch_1b
    const-string p0, "BITWISE_XOR"

    invoke-static {p0, v5, p3}, Lbe2;->K(Ljava/lang/String;ILjava/util/List;)V

    .line 474
    invoke-virtual {p3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lst1;

    .line 475
    iget-object p1, p2, Ler0;->l:Ljava/lang/Object;

    check-cast p1, Lxn0;

    invoke-virtual {p1, p2, p0}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object p0

    .line 476
    invoke-interface {p0}, Lst1;->f()Ljava/lang/Double;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide p0

    invoke-static {p0, p1}, Lbe2;->S(D)I

    move-result p0

    .line 477
    invoke-virtual {p3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lst1;

    .line 478
    iget-object p3, p2, Ler0;->l:Ljava/lang/Object;

    check-cast p3, Lxn0;

    invoke-virtual {p3, p2, p1}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object p1

    .line 479
    invoke-interface {p1}, Lst1;->f()Ljava/lang/Double;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide p1

    invoke-static {p1, p2}, Lbe2;->S(D)I

    move-result p1

    xor-int/2addr p0, p1

    int-to-double p0, p0

    new-instance p2, Lrr1;

    .line 480
    invoke-static {p0, p1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p0

    invoke-direct {p2, p0}, Lrr1;-><init>(Ljava/lang/Double;)V

    goto/16 :goto_1d

    .line 481
    :pswitch_1c
    const-string p0, "BITWISE_UNSIGNED_RIGHT_SHIFT"

    invoke-static {p0, v5, p3}, Lbe2;->K(Ljava/lang/String;ILjava/util/List;)V

    .line 482
    invoke-virtual {p3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lst1;

    .line 483
    iget-object p1, p2, Ler0;->l:Ljava/lang/Object;

    check-cast p1, Lxn0;

    invoke-virtual {p1, p2, p0}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object p0

    .line 484
    invoke-interface {p0}, Lst1;->f()Ljava/lang/Double;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide p0

    .line 485
    invoke-static {p0, p1}, Lbe2;->S(D)I

    move-result p0

    int-to-long p0, p0

    const-wide v5, 0xffffffffL

    and-long/2addr p0, v5

    .line 486
    invoke-virtual {p3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lst1;

    .line 487
    iget-object v0, p2, Ler0;->l:Ljava/lang/Object;

    check-cast v0, Lxn0;

    invoke-virtual {v0, p2, p3}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object p2

    .line 488
    invoke-interface {p2}, Lst1;->f()Ljava/lang/Double;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide p2

    .line 489
    invoke-static {p2, p3}, Lbe2;->S(D)I

    move-result p2

    int-to-long p2, p2

    and-long/2addr p2, v1

    long-to-int p2, p2

    ushr-long/2addr p0, p2

    long-to-double p0, p0

    .line 490
    new-instance p2, Lrr1;

    .line 491
    invoke-static {p0, p1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p0

    invoke-direct {p2, p0}, Lrr1;-><init>(Ljava/lang/Double;)V

    goto/16 :goto_1d

    .line 492
    :pswitch_1d
    const-string p0, "BITWISE_RIGHT_SHIFT"

    invoke-static {p0, v5, p3}, Lbe2;->K(Ljava/lang/String;ILjava/util/List;)V

    .line 493
    invoke-virtual {p3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lst1;

    .line 494
    iget-object p1, p2, Ler0;->l:Ljava/lang/Object;

    check-cast p1, Lxn0;

    invoke-virtual {p1, p2, p0}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object p0

    .line 495
    invoke-interface {p0}, Lst1;->f()Ljava/lang/Double;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide p0

    invoke-static {p0, p1}, Lbe2;->S(D)I

    move-result p0

    .line 496
    invoke-virtual {p3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lst1;

    .line 497
    iget-object p3, p2, Ler0;->l:Ljava/lang/Object;

    check-cast p3, Lxn0;

    invoke-virtual {p3, p2, p1}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object p1

    .line 498
    invoke-interface {p1}, Lst1;->f()Ljava/lang/Double;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide p1

    .line 499
    invoke-static {p1, p2}, Lbe2;->S(D)I

    move-result p1

    int-to-long p1, p1

    and-long/2addr p1, v1

    long-to-int p1, p1

    shr-int/2addr p0, p1

    int-to-double p0, p0

    .line 500
    new-instance p2, Lrr1;

    .line 501
    invoke-static {p0, p1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p0

    invoke-direct {p2, p0}, Lrr1;-><init>(Ljava/lang/Double;)V

    goto/16 :goto_1d

    .line 502
    :pswitch_1e
    const-string p0, "BITWISE_OR"

    invoke-static {p0, v5, p3}, Lbe2;->K(Ljava/lang/String;ILjava/util/List;)V

    .line 503
    invoke-virtual {p3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lst1;

    .line 504
    iget-object p1, p2, Ler0;->l:Ljava/lang/Object;

    check-cast p1, Lxn0;

    invoke-virtual {p1, p2, p0}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object p0

    .line 505
    invoke-interface {p0}, Lst1;->f()Ljava/lang/Double;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide p0

    invoke-static {p0, p1}, Lbe2;->S(D)I

    move-result p0

    .line 506
    invoke-virtual {p3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lst1;

    .line 507
    iget-object p3, p2, Ler0;->l:Ljava/lang/Object;

    check-cast p3, Lxn0;

    invoke-virtual {p3, p2, p1}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object p1

    .line 508
    invoke-interface {p1}, Lst1;->f()Ljava/lang/Double;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide p1

    invoke-static {p1, p2}, Lbe2;->S(D)I

    move-result p1

    or-int/2addr p0, p1

    int-to-double p0, p0

    new-instance p2, Lrr1;

    .line 509
    invoke-static {p0, p1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p0

    invoke-direct {p2, p0}, Lrr1;-><init>(Ljava/lang/Double;)V

    goto/16 :goto_1d

    .line 510
    :pswitch_1f
    const-string p0, "BITWISE_NOT"

    invoke-static {p0, v4, p3}, Lbe2;->K(Ljava/lang/String;ILjava/util/List;)V

    .line 511
    invoke-virtual {p3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lst1;

    .line 512
    iget-object p1, p2, Ler0;->l:Ljava/lang/Object;

    check-cast p1, Lxn0;

    invoke-virtual {p1, p2, p0}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object p0

    .line 513
    invoke-interface {p0}, Lst1;->f()Ljava/lang/Double;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide p0

    invoke-static {p0, p1}, Lbe2;->S(D)I

    move-result p0

    not-int p0, p0

    int-to-double p0, p0

    new-instance p2, Lrr1;

    .line 514
    invoke-static {p0, p1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p0

    invoke-direct {p2, p0}, Lrr1;-><init>(Ljava/lang/Double;)V

    goto/16 :goto_1d

    .line 515
    :pswitch_20
    const-string p0, "BITWISE_LEFT_SHIFT"

    invoke-static {p0, v5, p3}, Lbe2;->K(Ljava/lang/String;ILjava/util/List;)V

    .line 516
    invoke-virtual {p3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lst1;

    .line 517
    iget-object p1, p2, Ler0;->l:Ljava/lang/Object;

    check-cast p1, Lxn0;

    invoke-virtual {p1, p2, p0}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object p0

    .line 518
    invoke-interface {p0}, Lst1;->f()Ljava/lang/Double;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide p0

    invoke-static {p0, p1}, Lbe2;->S(D)I

    move-result p0

    .line 519
    invoke-virtual {p3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lst1;

    .line 520
    iget-object p3, p2, Ler0;->l:Ljava/lang/Object;

    check-cast p3, Lxn0;

    invoke-virtual {p3, p2, p1}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object p1

    .line 521
    invoke-interface {p1}, Lst1;->f()Ljava/lang/Double;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide p1

    .line 522
    invoke-static {p1, p2}, Lbe2;->S(D)I

    move-result p1

    int-to-long p1, p1

    and-long/2addr p1, v1

    long-to-int p1, p1

    shl-int/2addr p0, p1

    int-to-double p0, p0

    .line 523
    new-instance p2, Lrr1;

    .line 524
    invoke-static {p0, p1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p0

    invoke-direct {p2, p0}, Lrr1;-><init>(Ljava/lang/Double;)V

    goto :goto_1d

    .line 525
    :pswitch_21
    const-string p0, "BITWISE_AND"

    invoke-static {p0, v5, p3}, Lbe2;->K(Ljava/lang/String;ILjava/util/List;)V

    .line 526
    invoke-virtual {p3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lst1;

    .line 527
    iget-object p1, p2, Ler0;->l:Ljava/lang/Object;

    check-cast p1, Lxn0;

    invoke-virtual {p1, p2, p0}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object p0

    .line 528
    invoke-interface {p0}, Lst1;->f()Ljava/lang/Double;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide p0

    invoke-static {p0, p1}, Lbe2;->S(D)I

    move-result p0

    .line 529
    invoke-virtual {p3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lst1;

    .line 530
    iget-object p3, p2, Ler0;->l:Ljava/lang/Object;

    check-cast p3, Lxn0;

    invoke-virtual {p3, p2, p1}, Lxn0;->A(Ler0;Lst1;)Lst1;

    move-result-object p1

    .line 531
    invoke-interface {p1}, Lst1;->f()Ljava/lang/Double;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide p1

    invoke-static {p1, p2}, Lbe2;->S(D)I

    move-result p1

    and-int/2addr p0, p1

    int-to-double p0, p0

    new-instance p2, Lrr1;

    .line 532
    invoke-static {p0, p1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p0

    invoke-direct {p2, p0}, Lrr1;-><init>(Ljava/lang/Double;)V

    :goto_1d
    return-object p2

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1a
        :pswitch_15
        :pswitch_11
        :pswitch_10
        :pswitch_8
        :pswitch_4
        :pswitch_3
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x3e
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x2c
        :pswitch_7
        :pswitch_6
        :pswitch_5
    .end packed-switch

    :pswitch_data_3
    .packed-switch 0x1a
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
    .end packed-switch

    :pswitch_data_4
    .packed-switch 0xb
        :pswitch_13
        :pswitch_12
        :pswitch_14
    .end packed-switch

    :pswitch_data_5
    .packed-switch 0x25
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
    .end packed-switch

    :pswitch_data_6
    .packed-switch 0x4
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
    .end packed-switch
.end method

.method public final b(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lbu1;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-static {p1}, Lbe2;->Q(Ljava/lang/String;)Luu1;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    .line 14
    .line 15
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    const-string v0, "Command not implemented: "

    .line 20
    .line 21
    invoke-virtual {v0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    throw p0

    .line 29
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 30
    .line 31
    const-string p1, "Command not supported"

    .line 32
    .line 33
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    throw p0
.end method
