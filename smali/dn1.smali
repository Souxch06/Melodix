.class public final Ldn1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:I

.field public c:Ljava/lang/Boolean;

.field public d:Ljava/lang/Boolean;

.field public e:Ljava/lang/Long;

.field public f:Ljava/lang/Long;

.field public final synthetic g:I

.field public final synthetic h:Ldp1;

.field public final i:Lnp1;


# direct methods
.method public constructor <init>(Ldp1;Ljava/lang/String;ILnp1;I)V
    .locals 0

    .line 1
    iput p5, p0, Ldn1;->g:I

    .line 2
    .line 3
    iput-object p1, p0, Ldn1;->h:Ldp1;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    iput-object p2, p0, Ldn1;->a:Ljava/lang/String;

    .line 9
    .line 10
    iput p3, p0, Ldn1;->b:I

    .line 11
    .line 12
    iput-object p4, p0, Ldn1;->i:Lnp1;

    .line 13
    .line 14
    return-void
.end method

.method public static c(Ljava/lang/Boolean;Z)Ljava/lang/Boolean;
    .locals 0

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return-object p0

    .line 5
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eq p0, p1, :cond_1

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    goto :goto_0

    .line 13
    :cond_1
    const/4 p0, 0x0

    .line 14
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public static d(Ljava/lang/String;Ltx1;Lzy1;)Ljava/lang/Boolean;
    .locals 10

    .line 1
    invoke-static {p1}, Lbh;->h(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    goto/16 :goto_7

    .line 8
    .line 9
    :cond_0
    invoke-virtual {p1}, Ltx1;->r()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_f

    .line 14
    .line 15
    invoke-virtual {p1}, Ltx1;->z()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    const/4 v2, 0x1

    .line 20
    if-eq v1, v2, :cond_f

    .line 21
    .line 22
    invoke-virtual {p1}, Ltx1;->z()I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    const/4 v3, 0x7

    .line 27
    if-ne v1, v3, :cond_1

    .line 28
    .line 29
    invoke-virtual {p1}, Ltx1;->x()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_f

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    invoke-virtual {p1}, Ltx1;->s()Z

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-nez v1, :cond_2

    .line 41
    .line 42
    goto/16 :goto_7

    .line 43
    .line 44
    :cond_2
    :goto_0
    invoke-virtual {p1}, Ltx1;->z()I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    invoke-virtual {p1}, Ltx1;->v()Z

    .line 49
    .line 50
    .line 51
    move-result v4

    .line 52
    const/4 v5, 0x2

    .line 53
    if-nez v4, :cond_4

    .line 54
    .line 55
    if-eq v1, v5, :cond_4

    .line 56
    .line 57
    if-ne v1, v3, :cond_3

    .line 58
    .line 59
    goto :goto_1

    .line 60
    :cond_3
    invoke-virtual {p1}, Ltx1;->t()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v6

    .line 64
    sget-object v7, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 65
    .line 66
    invoke-virtual {v6, v7}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v6

    .line 70
    goto :goto_2

    .line 71
    :cond_4
    :goto_1
    invoke-virtual {p1}, Ltx1;->t()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v6

    .line 75
    :goto_2
    invoke-virtual {p1}, Ltx1;->x()I

    .line 76
    .line 77
    .line 78
    move-result v7

    .line 79
    if-nez v7, :cond_5

    .line 80
    .line 81
    move-object p1, v0

    .line 82
    goto :goto_4

    .line 83
    :cond_5
    invoke-virtual {p1}, Ltx1;->w()Lyp1;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    if-nez v4, :cond_7

    .line 88
    .line 89
    new-instance v7, Ljava/util/ArrayList;

    .line 90
    .line 91
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 92
    .line 93
    .line 94
    move-result v8

    .line 95
    invoke-direct {v7, v8}, Ljava/util/ArrayList;-><init>(I)V

    .line 96
    .line 97
    .line 98
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    :goto_3
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 103
    .line 104
    .line 105
    move-result v8

    .line 106
    if-eqz v8, :cond_6

    .line 107
    .line 108
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    move-result-object v8

    .line 112
    check-cast v8, Ljava/lang/String;

    .line 113
    .line 114
    sget-object v9, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 115
    .line 116
    invoke-virtual {v8, v9}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v8

    .line 120
    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 121
    .line 122
    .line 123
    goto :goto_3

    .line 124
    :cond_6
    invoke-static {v7}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    :cond_7
    :goto_4
    if-ne v1, v5, :cond_8

    .line 129
    .line 130
    move-object v7, v6

    .line 131
    goto :goto_5

    .line 132
    :cond_8
    move-object v7, v0

    .line 133
    :goto_5
    if-ne v1, v3, :cond_9

    .line 134
    .line 135
    if-eqz p1, :cond_f

    .line 136
    .line 137
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 138
    .line 139
    .line 140
    move-result v3

    .line 141
    if-eqz v3, :cond_a

    .line 142
    .line 143
    goto :goto_7

    .line 144
    :cond_9
    if-nez v6, :cond_a

    .line 145
    .line 146
    goto :goto_7

    .line 147
    :cond_a
    if-nez v4, :cond_b

    .line 148
    .line 149
    if-eq v1, v5, :cond_b

    .line 150
    .line 151
    sget-object v3, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 152
    .line 153
    invoke-virtual {p0, v3}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object p0

    .line 157
    :cond_b
    add-int/lit8 v1, v1, -0x1

    .line 158
    .line 159
    packed-switch v1, :pswitch_data_0

    .line 160
    .line 161
    .line 162
    goto :goto_7

    .line 163
    :pswitch_0
    if-nez p1, :cond_c

    .line 164
    .line 165
    goto :goto_7

    .line 166
    :cond_c
    invoke-interface {p1, p0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 167
    .line 168
    .line 169
    move-result p0

    .line 170
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 171
    .line 172
    .line 173
    move-result-object p0

    .line 174
    return-object p0

    .line 175
    :pswitch_1
    invoke-virtual {p0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 176
    .line 177
    .line 178
    move-result p0

    .line 179
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 180
    .line 181
    .line 182
    move-result-object p0

    .line 183
    return-object p0

    .line 184
    :pswitch_2
    invoke-virtual {p0, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 185
    .line 186
    .line 187
    move-result p0

    .line 188
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 189
    .line 190
    .line 191
    move-result-object p0

    .line 192
    return-object p0

    .line 193
    :pswitch_3
    invoke-virtual {p0, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 194
    .line 195
    .line 196
    move-result p0

    .line 197
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 198
    .line 199
    .line 200
    move-result-object p0

    .line 201
    return-object p0

    .line 202
    :pswitch_4
    invoke-virtual {p0, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 203
    .line 204
    .line 205
    move-result p0

    .line 206
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 207
    .line 208
    .line 209
    move-result-object p0

    .line 210
    return-object p0

    .line 211
    :pswitch_5
    if-nez v7, :cond_d

    .line 212
    .line 213
    goto :goto_7

    .line 214
    :cond_d
    if-eq v2, v4, :cond_e

    .line 215
    .line 216
    const/16 p1, 0x42

    .line 217
    .line 218
    goto :goto_6

    .line 219
    :cond_e
    const/4 p1, 0x0

    .line 220
    :goto_6
    :try_start_0
    invoke-static {v7, p1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    .line 221
    .line 222
    .line 223
    move-result-object p1

    .line 224
    invoke-virtual {p1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 225
    .line 226
    .line 227
    move-result-object p0

    .line 228
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->matches()Z

    .line 229
    .line 230
    .line 231
    move-result p0

    .line 232
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 233
    .line 234
    .line 235
    move-result-object p0
    :try_end_0
    .catch Ljava/util/regex/PatternSyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    .line 236
    return-object p0

    .line 237
    :catch_0
    if-eqz p2, :cond_f

    .line 238
    .line 239
    iget-object p0, p2, Lzy1;->r:Lso;

    .line 240
    .line 241
    const-string p1, "Invalid regular expression in REGEXP audience filter. expression"

    .line 242
    .line 243
    invoke-virtual {p0, v7, p1}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 244
    .line 245
    .line 246
    :cond_f
    :goto_7
    return-object v0

    .line 247
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static e(Ljava/math/BigDecimal;Lqx1;D)Ljava/lang/Boolean;
    .locals 8

    .line 1
    invoke-static {p1}, Lbh;->h(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lqx1;->r()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/4 v1, 0x0

    .line 9
    if-eqz v0, :cond_15

    .line 10
    .line 11
    invoke-virtual {p1}, Lqx1;->B()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v2, 0x1

    .line 16
    if-ne v0, v2, :cond_0

    .line 17
    .line 18
    goto/16 :goto_7

    .line 19
    .line 20
    :cond_0
    invoke-virtual {p1}, Lqx1;->B()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    const/4 v3, 0x5

    .line 25
    if-ne v0, v3, :cond_1

    .line 26
    .line 27
    invoke-virtual {p1}, Lqx1;->w()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_15

    .line 32
    .line 33
    invoke-virtual {p1}, Lqx1;->y()Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-nez v0, :cond_2

    .line 38
    .line 39
    goto/16 :goto_7

    .line 40
    .line 41
    :cond_1
    invoke-virtual {p1}, Lqx1;->u()Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-nez v0, :cond_2

    .line 46
    .line 47
    goto/16 :goto_7

    .line 48
    .line 49
    :cond_2
    invoke-virtual {p1}, Lqx1;->B()I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    invoke-virtual {p1}, Lqx1;->B()I

    .line 54
    .line 55
    .line 56
    move-result v4

    .line 57
    if-ne v4, v3, :cond_4

    .line 58
    .line 59
    invoke-virtual {p1}, Lqx1;->x()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v4

    .line 63
    invoke-static {v4}, Lva2;->P(Ljava/lang/String;)Z

    .line 64
    .line 65
    .line 66
    move-result v4

    .line 67
    if-eqz v4, :cond_15

    .line 68
    .line 69
    invoke-virtual {p1}, Lqx1;->z()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v4

    .line 73
    invoke-static {v4}, Lva2;->P(Ljava/lang/String;)Z

    .line 74
    .line 75
    .line 76
    move-result v4

    .line 77
    if-nez v4, :cond_3

    .line 78
    .line 79
    goto/16 :goto_7

    .line 80
    .line 81
    :cond_3
    :try_start_0
    new-instance v4, Ljava/math/BigDecimal;

    .line 82
    .line 83
    invoke-virtual {p1}, Lqx1;->x()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v5

    .line 87
    invoke-direct {v4, v5}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    new-instance v5, Ljava/math/BigDecimal;

    .line 91
    .line 92
    invoke-virtual {p1}, Lqx1;->z()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    invoke-direct {v5, p1}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 97
    .line 98
    .line 99
    move-object p1, v4

    .line 100
    move-object v4, v1

    .line 101
    goto :goto_0

    .line 102
    :cond_4
    invoke-virtual {p1}, Lqx1;->v()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v4

    .line 106
    invoke-static {v4}, Lva2;->P(Ljava/lang/String;)Z

    .line 107
    .line 108
    .line 109
    move-result v4

    .line 110
    if-nez v4, :cond_5

    .line 111
    .line 112
    goto/16 :goto_7

    .line 113
    .line 114
    :cond_5
    :try_start_1
    new-instance v4, Ljava/math/BigDecimal;

    .line 115
    .line 116
    invoke-virtual {p1}, Lqx1;->v()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    invoke-direct {v4, p1}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_0

    .line 121
    .line 122
    .line 123
    move-object p1, v1

    .line 124
    move-object v5, p1

    .line 125
    :goto_0
    if-ne v0, v3, :cond_6

    .line 126
    .line 127
    if-eqz p1, :cond_15

    .line 128
    .line 129
    goto :goto_1

    .line 130
    :cond_6
    if-nez v4, :cond_7

    .line 131
    .line 132
    goto/16 :goto_7

    .line 133
    .line 134
    :cond_7
    :goto_1
    add-int/lit8 v0, v0, -0x1

    .line 135
    .line 136
    const/4 v3, 0x0

    .line 137
    if-eq v0, v2, :cond_12

    .line 138
    .line 139
    const/4 v6, 0x2

    .line 140
    if-eq v0, v6, :cond_f

    .line 141
    .line 142
    const/4 v7, 0x3

    .line 143
    if-eq v0, v7, :cond_a

    .line 144
    .line 145
    const/4 p2, 0x4

    .line 146
    if-eq v0, p2, :cond_8

    .line 147
    .line 148
    goto/16 :goto_7

    .line 149
    .line 150
    :cond_8
    if-eqz p1, :cond_15

    .line 151
    .line 152
    invoke-virtual {p0, p1}, Ljava/math/BigDecimal;->compareTo(Ljava/math/BigDecimal;)I

    .line 153
    .line 154
    .line 155
    move-result p1

    .line 156
    if-ltz p1, :cond_9

    .line 157
    .line 158
    invoke-virtual {p0, v5}, Ljava/math/BigDecimal;->compareTo(Ljava/math/BigDecimal;)I

    .line 159
    .line 160
    .line 161
    move-result p0

    .line 162
    if-gtz p0, :cond_9

    .line 163
    .line 164
    goto :goto_2

    .line 165
    :cond_9
    move v2, v3

    .line 166
    :goto_2
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 167
    .line 168
    .line 169
    move-result-object p0

    .line 170
    return-object p0

    .line 171
    :cond_a
    if-nez v4, :cond_b

    .line 172
    .line 173
    goto/16 :goto_7

    .line 174
    .line 175
    :cond_b
    const-wide/16 v0, 0x0

    .line 176
    .line 177
    cmpl-double p1, p2, v0

    .line 178
    .line 179
    if-eqz p1, :cond_d

    .line 180
    .line 181
    new-instance p1, Ljava/math/BigDecimal;

    .line 182
    .line 183
    invoke-direct {p1, p2, p3}, Ljava/math/BigDecimal;-><init>(D)V

    .line 184
    .line 185
    .line 186
    new-instance v0, Ljava/math/BigDecimal;

    .line 187
    .line 188
    invoke-direct {v0, v6}, Ljava/math/BigDecimal;-><init>(I)V

    .line 189
    .line 190
    .line 191
    invoke-virtual {p1, v0}, Ljava/math/BigDecimal;->multiply(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    .line 192
    .line 193
    .line 194
    move-result-object p1

    .line 195
    invoke-virtual {v4, p1}, Ljava/math/BigDecimal;->subtract(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    .line 196
    .line 197
    .line 198
    move-result-object p1

    .line 199
    invoke-virtual {p0, p1}, Ljava/math/BigDecimal;->compareTo(Ljava/math/BigDecimal;)I

    .line 200
    .line 201
    .line 202
    move-result p1

    .line 203
    if-lez p1, :cond_c

    .line 204
    .line 205
    new-instance p1, Ljava/math/BigDecimal;

    .line 206
    .line 207
    invoke-direct {p1, p2, p3}, Ljava/math/BigDecimal;-><init>(D)V

    .line 208
    .line 209
    .line 210
    new-instance p2, Ljava/math/BigDecimal;

    .line 211
    .line 212
    invoke-direct {p2, v6}, Ljava/math/BigDecimal;-><init>(I)V

    .line 213
    .line 214
    .line 215
    invoke-virtual {p1, p2}, Ljava/math/BigDecimal;->multiply(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    .line 216
    .line 217
    .line 218
    move-result-object p1

    .line 219
    invoke-virtual {v4, p1}, Ljava/math/BigDecimal;->add(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    .line 220
    .line 221
    .line 222
    move-result-object p1

    .line 223
    invoke-virtual {p0, p1}, Ljava/math/BigDecimal;->compareTo(Ljava/math/BigDecimal;)I

    .line 224
    .line 225
    .line 226
    move-result p0

    .line 227
    if-gez p0, :cond_c

    .line 228
    .line 229
    goto :goto_3

    .line 230
    :cond_c
    move v2, v3

    .line 231
    :goto_3
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 232
    .line 233
    .line 234
    move-result-object p0

    .line 235
    return-object p0

    .line 236
    :cond_d
    invoke-virtual {p0, v4}, Ljava/math/BigDecimal;->compareTo(Ljava/math/BigDecimal;)I

    .line 237
    .line 238
    .line 239
    move-result p0

    .line 240
    if-nez p0, :cond_e

    .line 241
    .line 242
    goto :goto_4

    .line 243
    :cond_e
    move v2, v3

    .line 244
    :goto_4
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 245
    .line 246
    .line 247
    move-result-object p0

    .line 248
    return-object p0

    .line 249
    :cond_f
    if-nez v4, :cond_10

    .line 250
    .line 251
    goto :goto_7

    .line 252
    :cond_10
    invoke-virtual {p0, v4}, Ljava/math/BigDecimal;->compareTo(Ljava/math/BigDecimal;)I

    .line 253
    .line 254
    .line 255
    move-result p0

    .line 256
    if-lez p0, :cond_11

    .line 257
    .line 258
    goto :goto_5

    .line 259
    :cond_11
    move v2, v3

    .line 260
    :goto_5
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 261
    .line 262
    .line 263
    move-result-object p0

    .line 264
    return-object p0

    .line 265
    :cond_12
    if-nez v4, :cond_13

    .line 266
    .line 267
    goto :goto_7

    .line 268
    :cond_13
    invoke-virtual {p0, v4}, Ljava/math/BigDecimal;->compareTo(Ljava/math/BigDecimal;)I

    .line 269
    .line 270
    .line 271
    move-result p0

    .line 272
    if-gez p0, :cond_14

    .line 273
    .line 274
    goto :goto_6

    .line 275
    :cond_14
    move v2, v3

    .line 276
    :goto_6
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 277
    .line 278
    .line 279
    move-result-object p0

    .line 280
    return-object p0

    .line 281
    :catch_0
    :cond_15
    :goto_7
    return-object v1
.end method


# virtual methods
.method public a(Ljava/lang/Long;Ljava/lang/Long;Lj02;JLru1;Z)Z
    .locals 21

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-static {}, Lds1;->a()V

    .line 4
    .line 5
    .line 6
    iget-object v1, v0, Ldn1;->h:Ldp1;

    .line 7
    .line 8
    iget-object v2, v1, Let;->j:Ljava/lang/Object;

    .line 9
    .line 10
    check-cast v2, Ly02;

    .line 11
    .line 12
    iget-object v3, v2, Ly02;->m:Lmt1;

    .line 13
    .line 14
    iget-object v4, v2, Ly02;->o:Lzy1;

    .line 15
    .line 16
    iget-object v2, v2, Ly02;->s:Lry1;

    .line 17
    .line 18
    sget-object v5, Lxx1;->F0:Lwx1;

    .line 19
    .line 20
    iget-object v6, v0, Ldn1;->a:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {v3, v6, v5}, Lmt1;->w(Ljava/lang/String;Lwx1;)Z

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    iget-object v5, v0, Ldn1;->i:Lnp1;

    .line 27
    .line 28
    check-cast v5, Lmx1;

    .line 29
    .line 30
    invoke-virtual {v5}, Lmx1;->C()Z

    .line 31
    .line 32
    .line 33
    move-result v7

    .line 34
    if-eqz v7, :cond_0

    .line 35
    .line 36
    move-object/from16 v7, p6

    .line 37
    .line 38
    iget-wide v7, v7, Lru1;->e:J

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    move-wide/from16 v7, p4

    .line 42
    .line 43
    :goto_0
    invoke-static {v4}, Ly02;->l(Lm22;)V

    .line 44
    .line 45
    .line 46
    iget-object v9, v4, Lzy1;->w:Lso;

    .line 47
    .line 48
    iget-object v10, v4, Lzy1;->r:Lso;

    .line 49
    .line 50
    invoke-virtual {v4}, Lzy1;->r()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v11

    .line 54
    const/4 v12, 0x2

    .line 55
    invoke-static {v11, v12}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    .line 56
    .line 57
    .line 58
    move-result v11

    .line 59
    iget v13, v0, Ldn1;->b:I

    .line 60
    .line 61
    if-eqz v11, :cond_6

    .line 62
    .line 63
    invoke-static {v4}, Ly02;->l(Lm22;)V

    .line 64
    .line 65
    .line 66
    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 67
    .line 68
    .line 69
    move-result-object v11

    .line 70
    invoke-virtual {v5}, Lmx1;->r()Z

    .line 71
    .line 72
    .line 73
    move-result v16

    .line 74
    if-eqz v16, :cond_1

    .line 75
    .line 76
    invoke-virtual {v5}, Lmx1;->s()I

    .line 77
    .line 78
    .line 79
    move-result v16

    .line 80
    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 81
    .line 82
    .line 83
    move-result-object v16

    .line 84
    move-object/from16 v12, v16

    .line 85
    .line 86
    goto :goto_1

    .line 87
    :cond_1
    const/4 v12, 0x0

    .line 88
    :goto_1
    invoke-virtual {v5}, Lmx1;->t()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v15

    .line 92
    invoke-virtual {v2, v15}, Lry1;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v15

    .line 96
    const-string v14, "Evaluating filter. audience, filter, event"

    .line 97
    .line 98
    invoke-virtual {v9, v14, v11, v12, v15}, Lso;->e(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 99
    .line 100
    .line 101
    invoke-static {v4}, Ly02;->l(Lm22;)V

    .line 102
    .line 103
    .line 104
    iget-object v1, v1, Ls92;->k:Lsa2;

    .line 105
    .line 106
    iget-object v1, v1, Lsa2;->p:Lva2;

    .line 107
    .line 108
    invoke-static {v1}, Lsa2;->T(Laa2;)V

    .line 109
    .line 110
    .line 111
    new-instance v11, Ljava/lang/StringBuilder;

    .line 112
    .line 113
    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    .line 114
    .line 115
    .line 116
    const-string v12, "\nevent_filter {\n"

    .line 117
    .line 118
    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    invoke-virtual {v5}, Lmx1;->r()Z

    .line 122
    .line 123
    .line 124
    move-result v12

    .line 125
    if-eqz v12, :cond_2

    .line 126
    .line 127
    invoke-virtual {v5}, Lmx1;->s()I

    .line 128
    .line 129
    .line 130
    move-result v12

    .line 131
    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 132
    .line 133
    .line 134
    move-result-object v12

    .line 135
    const-string v14, "filter_id"

    .line 136
    .line 137
    const/4 v15, 0x0

    .line 138
    invoke-static {v11, v15, v14, v12}, Lva2;->G(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    .line 139
    .line 140
    .line 141
    goto :goto_2

    .line 142
    :cond_2
    const/4 v15, 0x0

    .line 143
    :goto_2
    iget-object v12, v1, Let;->j:Ljava/lang/Object;

    .line 144
    .line 145
    check-cast v12, Ly02;

    .line 146
    .line 147
    iget-object v12, v12, Ly02;->s:Lry1;

    .line 148
    .line 149
    invoke-virtual {v5}, Lmx1;->t()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v14

    .line 153
    invoke-virtual {v12, v14}, Lry1;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object v12

    .line 157
    const-string v14, "event_name"

    .line 158
    .line 159
    invoke-static {v11, v15, v14, v12}, Lva2;->G(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    .line 160
    .line 161
    .line 162
    invoke-virtual {v5}, Lmx1;->z()Z

    .line 163
    .line 164
    .line 165
    move-result v12

    .line 166
    invoke-virtual {v5}, Lmx1;->A()Z

    .line 167
    .line 168
    .line 169
    move-result v14

    .line 170
    invoke-virtual {v5}, Lmx1;->C()Z

    .line 171
    .line 172
    .line 173
    move-result v15

    .line 174
    invoke-static {v12, v14, v15}, Lva2;->C(ZZZ)Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object v12

    .line 178
    invoke-virtual {v12}, Ljava/lang/String;->isEmpty()Z

    .line 179
    .line 180
    .line 181
    move-result v14

    .line 182
    if-nez v14, :cond_3

    .line 183
    .line 184
    const-string v14, "filter_type"

    .line 185
    .line 186
    const/4 v15, 0x0

    .line 187
    invoke-static {v11, v15, v14, v12}, Lva2;->G(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    .line 188
    .line 189
    .line 190
    :cond_3
    invoke-virtual {v5}, Lmx1;->x()Z

    .line 191
    .line 192
    .line 193
    move-result v12

    .line 194
    if-eqz v12, :cond_4

    .line 195
    .line 196
    invoke-virtual {v5}, Lmx1;->y()Lqx1;

    .line 197
    .line 198
    .line 199
    move-result-object v12

    .line 200
    const-string v14, "event_count_filter"

    .line 201
    .line 202
    const/4 v15, 0x1

    .line 203
    invoke-static {v11, v15, v14, v12}, Lva2;->H(Ljava/lang/StringBuilder;ILjava/lang/String;Lqx1;)V

    .line 204
    .line 205
    .line 206
    :cond_4
    invoke-virtual {v5}, Lmx1;->v()I

    .line 207
    .line 208
    .line 209
    move-result v12

    .line 210
    if-lez v12, :cond_5

    .line 211
    .line 212
    const-string v12, "  filters {\n"

    .line 213
    .line 214
    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 215
    .line 216
    .line 217
    invoke-virtual {v5}, Lmx1;->u()Ljava/util/List;

    .line 218
    .line 219
    .line 220
    move-result-object v12

    .line 221
    invoke-interface {v12}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 222
    .line 223
    .line 224
    move-result-object v12

    .line 225
    :goto_3
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    .line 226
    .line 227
    .line 228
    move-result v14

    .line 229
    if-eqz v14, :cond_5

    .line 230
    .line 231
    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 232
    .line 233
    .line 234
    move-result-object v14

    .line 235
    check-cast v14, Lox1;

    .line 236
    .line 237
    const/4 v15, 0x2

    .line 238
    invoke-virtual {v1, v11, v15, v14}, Lva2;->z(Ljava/lang/StringBuilder;ILox1;)V

    .line 239
    .line 240
    .line 241
    goto :goto_3

    .line 242
    :cond_5
    const/4 v15, 0x1

    .line 243
    invoke-static {v15, v11}, Lva2;->A(ILjava/lang/StringBuilder;)V

    .line 244
    .line 245
    .line 246
    const-string v1, "}\n}\n"

    .line 247
    .line 248
    invoke-virtual {v11, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 249
    .line 250
    .line 251
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 252
    .line 253
    .line 254
    move-result-object v1

    .line 255
    const-string v11, "Filter definition"

    .line 256
    .line 257
    invoke-virtual {v9, v1, v11}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 258
    .line 259
    .line 260
    :cond_6
    invoke-virtual {v5}, Lmx1;->r()Z

    .line 261
    .line 262
    .line 263
    move-result v1

    .line 264
    if-eqz v1, :cond_7

    .line 265
    .line 266
    invoke-virtual {v5}, Lmx1;->s()I

    .line 267
    .line 268
    .line 269
    move-result v1

    .line 270
    const/16 v11, 0x100

    .line 271
    .line 272
    if-le v1, v11, :cond_8

    .line 273
    .line 274
    :cond_7
    move-object/from16 v19, v4

    .line 275
    .line 276
    goto/16 :goto_19

    .line 277
    .line 278
    :cond_8
    invoke-virtual {v5}, Lmx1;->z()Z

    .line 279
    .line 280
    .line 281
    move-result v1

    .line 282
    invoke-virtual {v5}, Lmx1;->A()Z

    .line 283
    .line 284
    .line 285
    move-result v6

    .line 286
    invoke-virtual {v5}, Lmx1;->C()Z

    .line 287
    .line 288
    .line 289
    move-result v11

    .line 290
    if-nez v1, :cond_9

    .line 291
    .line 292
    if-nez v6, :cond_9

    .line 293
    .line 294
    if-eqz v11, :cond_a

    .line 295
    .line 296
    :cond_9
    const/4 v1, 0x1

    .line 297
    goto :goto_4

    .line 298
    :cond_a
    const/4 v1, 0x0

    .line 299
    :goto_4
    if-eqz p7, :cond_c

    .line 300
    .line 301
    if-nez v1, :cond_c

    .line 302
    .line 303
    invoke-static {v4}, Ly02;->l(Lm22;)V

    .line 304
    .line 305
    .line 306
    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 307
    .line 308
    .line 309
    move-result-object v0

    .line 310
    invoke-virtual {v5}, Lmx1;->r()Z

    .line 311
    .line 312
    .line 313
    move-result v1

    .line 314
    if-eqz v1, :cond_b

    .line 315
    .line 316
    invoke-virtual {v5}, Lmx1;->s()I

    .line 317
    .line 318
    .line 319
    move-result v1

    .line 320
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 321
    .line 322
    .line 323
    move-result-object v12

    .line 324
    goto :goto_5

    .line 325
    :cond_b
    const/4 v12, 0x0

    .line 326
    :goto_5
    const-string v1, "Event filter already evaluated true and it is not associated with an enhanced audience. audience ID, filter ID"

    .line 327
    .line 328
    invoke-virtual {v9, v1, v0, v12}, Lso;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 329
    .line 330
    .line 331
    const/4 v15, 0x1

    .line 332
    return v15

    .line 333
    :cond_c
    invoke-virtual/range {p3 .. p3}, Lj02;->w()Ljava/lang/String;

    .line 334
    .line 335
    .line 336
    move-result-object v6

    .line 337
    invoke-virtual {v5}, Lmx1;->x()Z

    .line 338
    .line 339
    .line 340
    move-result v11

    .line 341
    const-wide/16 v12, 0x0

    .line 342
    .line 343
    if-eqz v11, :cond_e

    .line 344
    .line 345
    invoke-virtual {v5}, Lmx1;->y()Lqx1;

    .line 346
    .line 347
    .line 348
    move-result-object v11

    .line 349
    :try_start_0
    new-instance v14, Ljava/math/BigDecimal;

    .line 350
    .line 351
    invoke-direct {v14, v7, v8}, Ljava/math/BigDecimal;-><init>(J)V

    .line 352
    .line 353
    .line 354
    invoke-static {v14, v11, v12, v13}, Ldn1;->e(Ljava/math/BigDecimal;Lqx1;D)Ljava/lang/Boolean;

    .line 355
    .line 356
    .line 357
    move-result-object v7
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 358
    goto :goto_6

    .line 359
    :catch_0
    const/4 v7, 0x0

    .line 360
    :goto_6
    if-nez v7, :cond_d

    .line 361
    .line 362
    :goto_7
    move/from16 v20, v3

    .line 363
    .line 364
    move-object/from16 v19, v4

    .line 365
    .line 366
    :goto_8
    const/4 v12, 0x0

    .line 367
    goto/16 :goto_13

    .line 368
    .line 369
    :cond_d
    invoke-virtual {v7}, Ljava/lang/Boolean;->booleanValue()Z

    .line 370
    .line 371
    .line 372
    move-result v7

    .line 373
    if-nez v7, :cond_e

    .line 374
    .line 375
    sget-object v12, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 376
    .line 377
    :goto_9
    move/from16 v20, v3

    .line 378
    .line 379
    move-object/from16 v19, v4

    .line 380
    .line 381
    goto/16 :goto_13

    .line 382
    .line 383
    :cond_e
    new-instance v7, Ljava/util/HashSet;

    .line 384
    .line 385
    invoke-direct {v7}, Ljava/util/HashSet;-><init>()V

    .line 386
    .line 387
    .line 388
    invoke-virtual {v5}, Lmx1;->u()Ljava/util/List;

    .line 389
    .line 390
    .line 391
    move-result-object v8

    .line 392
    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 393
    .line 394
    .line 395
    move-result-object v8

    .line 396
    :goto_a
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    .line 397
    .line 398
    .line 399
    move-result v11

    .line 400
    if-eqz v11, :cond_10

    .line 401
    .line 402
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 403
    .line 404
    .line 405
    move-result-object v11

    .line 406
    check-cast v11, Lox1;

    .line 407
    .line 408
    invoke-virtual {v11}, Lox1;->y()Ljava/lang/String;

    .line 409
    .line 410
    .line 411
    move-result-object v14

    .line 412
    invoke-virtual {v14}, Ljava/lang/String;->isEmpty()Z

    .line 413
    .line 414
    .line 415
    move-result v14

    .line 416
    if-eqz v14, :cond_f

    .line 417
    .line 418
    invoke-static {v4}, Ly02;->l(Lm22;)V

    .line 419
    .line 420
    .line 421
    invoke-virtual {v2, v6}, Lry1;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 422
    .line 423
    .line 424
    move-result-object v2

    .line 425
    const-string v6, "null or empty param name in filter. event"

    .line 426
    .line 427
    invoke-virtual {v10, v2, v6}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 428
    .line 429
    .line 430
    goto :goto_7

    .line 431
    :cond_f
    invoke-virtual {v11}, Lox1;->y()Ljava/lang/String;

    .line 432
    .line 433
    .line 434
    move-result-object v11

    .line 435
    invoke-virtual {v7, v11}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 436
    .line 437
    .line 438
    goto :goto_a

    .line 439
    :cond_10
    new-instance v8, Lda;

    .line 440
    .line 441
    invoke-direct {v8}, Lu71;-><init>()V

    .line 442
    .line 443
    .line 444
    invoke-virtual/range {p3 .. p3}, Lj02;->t()Ljava/util/List;

    .line 445
    .line 446
    .line 447
    move-result-object v11

    .line 448
    invoke-interface {v11}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 449
    .line 450
    .line 451
    move-result-object v11

    .line 452
    :cond_11
    :goto_b
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    .line 453
    .line 454
    .line 455
    move-result v14

    .line 456
    if-eqz v14, :cond_17

    .line 457
    .line 458
    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 459
    .line 460
    .line 461
    move-result-object v14

    .line 462
    check-cast v14, Lo02;

    .line 463
    .line 464
    invoke-virtual {v14}, Lo02;->s()Ljava/lang/String;

    .line 465
    .line 466
    .line 467
    move-result-object v15

    .line 468
    invoke-virtual {v7, v15}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 469
    .line 470
    .line 471
    move-result v15

    .line 472
    if-eqz v15, :cond_11

    .line 473
    .line 474
    invoke-virtual {v14}, Lo02;->v()Z

    .line 475
    .line 476
    .line 477
    move-result v15

    .line 478
    if-eqz v15, :cond_13

    .line 479
    .line 480
    invoke-virtual {v14}, Lo02;->s()Ljava/lang/String;

    .line 481
    .line 482
    .line 483
    move-result-object v15

    .line 484
    invoke-virtual {v14}, Lo02;->v()Z

    .line 485
    .line 486
    .line 487
    move-result v17

    .line 488
    if-eqz v17, :cond_12

    .line 489
    .line 490
    invoke-virtual {v14}, Lo02;->w()J

    .line 491
    .line 492
    .line 493
    move-result-wide v17

    .line 494
    invoke-static/range {v17 .. v18}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 495
    .line 496
    .line 497
    move-result-object v14

    .line 498
    goto :goto_c

    .line 499
    :cond_12
    const/4 v14, 0x0

    .line 500
    :goto_c
    invoke-virtual {v8, v15, v14}, Lu71;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 501
    .line 502
    .line 503
    goto :goto_b

    .line 504
    :cond_13
    invoke-virtual {v14}, Lo02;->z()Z

    .line 505
    .line 506
    .line 507
    move-result v15

    .line 508
    if-eqz v15, :cond_15

    .line 509
    .line 510
    invoke-virtual {v14}, Lo02;->s()Ljava/lang/String;

    .line 511
    .line 512
    .line 513
    move-result-object v15

    .line 514
    invoke-virtual {v14}, Lo02;->z()Z

    .line 515
    .line 516
    .line 517
    move-result v17

    .line 518
    if-eqz v17, :cond_14

    .line 519
    .line 520
    invoke-virtual {v14}, Lo02;->A()D

    .line 521
    .line 522
    .line 523
    move-result-wide v17

    .line 524
    invoke-static/range {v17 .. v18}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 525
    .line 526
    .line 527
    move-result-object v14

    .line 528
    goto :goto_d

    .line 529
    :cond_14
    const/4 v14, 0x0

    .line 530
    :goto_d
    invoke-virtual {v8, v15, v14}, Lu71;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 531
    .line 532
    .line 533
    goto :goto_b

    .line 534
    :cond_15
    invoke-virtual {v14}, Lo02;->t()Z

    .line 535
    .line 536
    .line 537
    move-result v15

    .line 538
    if-eqz v15, :cond_16

    .line 539
    .line 540
    invoke-virtual {v14}, Lo02;->s()Ljava/lang/String;

    .line 541
    .line 542
    .line 543
    move-result-object v15

    .line 544
    invoke-virtual {v14}, Lo02;->u()Ljava/lang/String;

    .line 545
    .line 546
    .line 547
    move-result-object v14

    .line 548
    invoke-virtual {v8, v15, v14}, Lu71;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 549
    .line 550
    .line 551
    goto :goto_b

    .line 552
    :cond_16
    invoke-static {v4}, Ly02;->l(Lm22;)V

    .line 553
    .line 554
    .line 555
    invoke-virtual {v2, v6}, Lry1;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 556
    .line 557
    .line 558
    move-result-object v6

    .line 559
    invoke-virtual {v14}, Lo02;->s()Ljava/lang/String;

    .line 560
    .line 561
    .line 562
    move-result-object v7

    .line 563
    invoke-virtual {v2, v7}, Lry1;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 564
    .line 565
    .line 566
    move-result-object v2

    .line 567
    const-string v7, "Unknown value for param. event, param"

    .line 568
    .line 569
    invoke-virtual {v10, v7, v6, v2}, Lso;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 570
    .line 571
    .line 572
    goto/16 :goto_7

    .line 573
    .line 574
    :cond_17
    invoke-virtual {v5}, Lmx1;->u()Ljava/util/List;

    .line 575
    .line 576
    .line 577
    move-result-object v7

    .line 578
    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 579
    .line 580
    .line 581
    move-result-object v7

    .line 582
    :goto_e
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    .line 583
    .line 584
    .line 585
    move-result v11

    .line 586
    if-eqz v11, :cond_29

    .line 587
    .line 588
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 589
    .line 590
    .line 591
    move-result-object v11

    .line 592
    check-cast v11, Lox1;

    .line 593
    .line 594
    invoke-virtual {v11}, Lox1;->v()Z

    .line 595
    .line 596
    .line 597
    move-result v14

    .line 598
    if-eqz v14, :cond_18

    .line 599
    .line 600
    invoke-virtual {v11}, Lox1;->w()Z

    .line 601
    .line 602
    .line 603
    move-result v14

    .line 604
    if-eqz v14, :cond_18

    .line 605
    .line 606
    const/4 v14, 0x1

    .line 607
    goto :goto_f

    .line 608
    :cond_18
    const/4 v14, 0x0

    .line 609
    :goto_f
    invoke-virtual {v11}, Lox1;->y()Ljava/lang/String;

    .line 610
    .line 611
    .line 612
    move-result-object v15

    .line 613
    invoke-virtual {v15}, Ljava/lang/String;->isEmpty()Z

    .line 614
    .line 615
    .line 616
    move-result v17

    .line 617
    if-eqz v17, :cond_19

    .line 618
    .line 619
    invoke-static {v4}, Ly02;->l(Lm22;)V

    .line 620
    .line 621
    .line 622
    invoke-virtual {v2, v6}, Lry1;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 623
    .line 624
    .line 625
    move-result-object v2

    .line 626
    const-string v6, "Event has empty param name. event"

    .line 627
    .line 628
    invoke-virtual {v10, v2, v6}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 629
    .line 630
    .line 631
    goto/16 :goto_7

    .line 632
    .line 633
    :cond_19
    const/4 v12, 0x0

    .line 634
    invoke-virtual {v8, v15, v12}, Lu71;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 635
    .line 636
    .line 637
    move-result-object v13

    .line 638
    instance-of v12, v13, Ljava/lang/Long;

    .line 639
    .line 640
    if-eqz v12, :cond_1d

    .line 641
    .line 642
    invoke-virtual {v11}, Lox1;->t()Z

    .line 643
    .line 644
    .line 645
    move-result v12

    .line 646
    if-nez v12, :cond_1a

    .line 647
    .line 648
    invoke-static {v4}, Ly02;->l(Lm22;)V

    .line 649
    .line 650
    .line 651
    invoke-virtual {v2, v6}, Lry1;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 652
    .line 653
    .line 654
    move-result-object v6

    .line 655
    invoke-virtual {v2, v15}, Lry1;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 656
    .line 657
    .line 658
    move-result-object v2

    .line 659
    const-string v7, "No number filter for long param. event, param"

    .line 660
    .line 661
    invoke-virtual {v10, v7, v6, v2}, Lso;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 662
    .line 663
    .line 664
    goto/16 :goto_7

    .line 665
    .line 666
    :cond_1a
    check-cast v13, Ljava/lang/Long;

    .line 667
    .line 668
    invoke-virtual {v13}, Ljava/lang/Long;->longValue()J

    .line 669
    .line 670
    .line 671
    move-result-wide v12

    .line 672
    invoke-virtual {v11}, Lox1;->u()Lqx1;

    .line 673
    .line 674
    .line 675
    move-result-object v11

    .line 676
    :try_start_1
    new-instance v15, Ljava/math/BigDecimal;

    .line 677
    .line 678
    invoke-direct {v15, v12, v13}, Ljava/math/BigDecimal;-><init>(J)V

    .line 679
    .line 680
    .line 681
    const-wide/16 v12, 0x0

    .line 682
    .line 683
    invoke-static {v15, v11, v12, v13}, Ldn1;->e(Ljava/math/BigDecimal;Lqx1;D)Ljava/lang/Boolean;

    .line 684
    .line 685
    .line 686
    move-result-object v11
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1

    .line 687
    goto :goto_10

    .line 688
    :catch_1
    const/4 v11, 0x0

    .line 689
    :goto_10
    if-nez v11, :cond_1b

    .line 690
    .line 691
    goto/16 :goto_7

    .line 692
    .line 693
    :cond_1b
    invoke-virtual {v11}, Ljava/lang/Boolean;->booleanValue()Z

    .line 694
    .line 695
    .line 696
    move-result v11

    .line 697
    if-ne v11, v14, :cond_1c

    .line 698
    .line 699
    sget-object v12, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 700
    .line 701
    goto/16 :goto_9

    .line 702
    .line 703
    :cond_1c
    const-wide/16 v12, 0x0

    .line 704
    .line 705
    goto :goto_e

    .line 706
    :cond_1d
    instance-of v12, v13, Ljava/lang/Double;

    .line 707
    .line 708
    if-eqz v12, :cond_20

    .line 709
    .line 710
    invoke-virtual {v11}, Lox1;->t()Z

    .line 711
    .line 712
    .line 713
    move-result v12

    .line 714
    if-nez v12, :cond_1e

    .line 715
    .line 716
    invoke-static {v4}, Ly02;->l(Lm22;)V

    .line 717
    .line 718
    .line 719
    invoke-virtual {v2, v6}, Lry1;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 720
    .line 721
    .line 722
    move-result-object v6

    .line 723
    invoke-virtual {v2, v15}, Lry1;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 724
    .line 725
    .line 726
    move-result-object v2

    .line 727
    const-string v7, "No number filter for double param. event, param"

    .line 728
    .line 729
    invoke-virtual {v10, v7, v6, v2}, Lso;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 730
    .line 731
    .line 732
    goto/16 :goto_7

    .line 733
    .line 734
    :cond_1e
    check-cast v13, Ljava/lang/Double;

    .line 735
    .line 736
    invoke-virtual {v13}, Ljava/lang/Double;->doubleValue()D

    .line 737
    .line 738
    .line 739
    move-result-wide v12

    .line 740
    invoke-virtual {v11}, Lox1;->u()Lqx1;

    .line 741
    .line 742
    .line 743
    move-result-object v11

    .line 744
    :try_start_2
    new-instance v15, Ljava/math/BigDecimal;

    .line 745
    .line 746
    invoke-direct {v15, v12, v13}, Ljava/math/BigDecimal;-><init>(D)V

    .line 747
    .line 748
    .line 749
    invoke-static {v12, v13}, Ljava/lang/Math;->ulp(D)D

    .line 750
    .line 751
    .line 752
    move-result-wide v12

    .line 753
    invoke-static {v15, v11, v12, v13}, Ldn1;->e(Ljava/math/BigDecimal;Lqx1;D)Ljava/lang/Boolean;

    .line 754
    .line 755
    .line 756
    move-result-object v11
    :try_end_2
    .catch Ljava/lang/NumberFormatException; {:try_start_2 .. :try_end_2} :catch_2

    .line 757
    goto :goto_11

    .line 758
    :catch_2
    const/4 v11, 0x0

    .line 759
    :goto_11
    if-nez v11, :cond_1f

    .line 760
    .line 761
    goto/16 :goto_7

    .line 762
    .line 763
    :cond_1f
    invoke-virtual {v11}, Ljava/lang/Boolean;->booleanValue()Z

    .line 764
    .line 765
    .line 766
    move-result v11

    .line 767
    if-ne v11, v14, :cond_1c

    .line 768
    .line 769
    sget-object v12, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 770
    .line 771
    goto/16 :goto_9

    .line 772
    .line 773
    :cond_20
    instance-of v12, v13, Ljava/lang/String;

    .line 774
    .line 775
    if-eqz v12, :cond_27

    .line 776
    .line 777
    invoke-virtual {v11}, Lox1;->r()Z

    .line 778
    .line 779
    .line 780
    move-result v12

    .line 781
    if-eqz v12, :cond_21

    .line 782
    .line 783
    check-cast v13, Ljava/lang/String;

    .line 784
    .line 785
    invoke-virtual {v11}, Lox1;->s()Ltx1;

    .line 786
    .line 787
    .line 788
    move-result-object v11

    .line 789
    invoke-static {v4}, Ly02;->l(Lm22;)V

    .line 790
    .line 791
    .line 792
    invoke-static {v13, v11, v4}, Ldn1;->d(Ljava/lang/String;Ltx1;Lzy1;)Ljava/lang/Boolean;

    .line 793
    .line 794
    .line 795
    move-result-object v11

    .line 796
    move/from16 v20, v3

    .line 797
    .line 798
    move-object/from16 v19, v4

    .line 799
    .line 800
    const-wide/16 v3, 0x0

    .line 801
    .line 802
    goto :goto_12

    .line 803
    :cond_21
    invoke-virtual {v11}, Lox1;->t()Z

    .line 804
    .line 805
    .line 806
    move-result v12

    .line 807
    if-eqz v12, :cond_26

    .line 808
    .line 809
    check-cast v13, Ljava/lang/String;

    .line 810
    .line 811
    invoke-static {v13}, Lva2;->P(Ljava/lang/String;)Z

    .line 812
    .line 813
    .line 814
    move-result v12

    .line 815
    if-eqz v12, :cond_25

    .line 816
    .line 817
    invoke-virtual {v11}, Lox1;->u()Lqx1;

    .line 818
    .line 819
    .line 820
    move-result-object v11

    .line 821
    invoke-static {v13}, Lva2;->P(Ljava/lang/String;)Z

    .line 822
    .line 823
    .line 824
    move-result v12

    .line 825
    if-nez v12, :cond_22

    .line 826
    .line 827
    :catch_3
    move/from16 v20, v3

    .line 828
    .line 829
    move-object/from16 v19, v4

    .line 830
    .line 831
    const-wide/16 v3, 0x0

    .line 832
    .line 833
    :catch_4
    const/4 v11, 0x0

    .line 834
    goto :goto_12

    .line 835
    :cond_22
    :try_start_3
    new-instance v12, Ljava/math/BigDecimal;

    .line 836
    .line 837
    invoke-direct {v12, v13}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/NumberFormatException; {:try_start_3 .. :try_end_3} :catch_3

    .line 838
    .line 839
    .line 840
    move/from16 v20, v3

    .line 841
    .line 842
    move-object/from16 v19, v4

    .line 843
    .line 844
    const-wide/16 v3, 0x0

    .line 845
    .line 846
    :try_start_4
    invoke-static {v12, v11, v3, v4}, Ldn1;->e(Ljava/math/BigDecimal;Lqx1;D)Ljava/lang/Boolean;

    .line 847
    .line 848
    .line 849
    move-result-object v11
    :try_end_4
    .catch Ljava/lang/NumberFormatException; {:try_start_4 .. :try_end_4} :catch_4

    .line 850
    :goto_12
    if-nez v11, :cond_23

    .line 851
    .line 852
    goto/16 :goto_8

    .line 853
    .line 854
    :cond_23
    invoke-virtual {v11}, Ljava/lang/Boolean;->booleanValue()Z

    .line 855
    .line 856
    .line 857
    move-result v11

    .line 858
    if-ne v11, v14, :cond_24

    .line 859
    .line 860
    sget-object v12, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 861
    .line 862
    goto :goto_13

    .line 863
    :cond_24
    move-wide v12, v3

    .line 864
    move-object/from16 v4, v19

    .line 865
    .line 866
    move/from16 v3, v20

    .line 867
    .line 868
    goto/16 :goto_e

    .line 869
    .line 870
    :cond_25
    move/from16 v20, v3

    .line 871
    .line 872
    move-object/from16 v19, v4

    .line 873
    .line 874
    invoke-static/range {v19 .. v19}, Ly02;->l(Lm22;)V

    .line 875
    .line 876
    .line 877
    invoke-virtual {v2, v6}, Lry1;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 878
    .line 879
    .line 880
    move-result-object v3

    .line 881
    invoke-virtual {v2, v15}, Lry1;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 882
    .line 883
    .line 884
    move-result-object v2

    .line 885
    const-string v4, "Invalid param value for number filter. event, param"

    .line 886
    .line 887
    invoke-virtual {v10, v4, v3, v2}, Lso;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 888
    .line 889
    .line 890
    goto/16 :goto_8

    .line 891
    .line 892
    :cond_26
    move/from16 v20, v3

    .line 893
    .line 894
    move-object/from16 v19, v4

    .line 895
    .line 896
    invoke-static/range {v19 .. v19}, Ly02;->l(Lm22;)V

    .line 897
    .line 898
    .line 899
    invoke-virtual {v2, v6}, Lry1;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 900
    .line 901
    .line 902
    move-result-object v3

    .line 903
    invoke-virtual {v2, v15}, Lry1;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 904
    .line 905
    .line 906
    move-result-object v2

    .line 907
    const-string v4, "No filter for String param. event, param"

    .line 908
    .line 909
    invoke-virtual {v10, v4, v3, v2}, Lso;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 910
    .line 911
    .line 912
    goto/16 :goto_8

    .line 913
    .line 914
    :cond_27
    move/from16 v20, v3

    .line 915
    .line 916
    move-object/from16 v19, v4

    .line 917
    .line 918
    if-nez v13, :cond_28

    .line 919
    .line 920
    invoke-static/range {v19 .. v19}, Ly02;->l(Lm22;)V

    .line 921
    .line 922
    .line 923
    invoke-virtual {v2, v6}, Lry1;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 924
    .line 925
    .line 926
    move-result-object v3

    .line 927
    invoke-virtual {v2, v15}, Lry1;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 928
    .line 929
    .line 930
    move-result-object v2

    .line 931
    const-string v4, "Missing param for filter. event, param"

    .line 932
    .line 933
    invoke-virtual {v9, v4, v3, v2}, Lso;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 934
    .line 935
    .line 936
    sget-object v12, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 937
    .line 938
    goto :goto_13

    .line 939
    :cond_28
    invoke-static/range {v19 .. v19}, Ly02;->l(Lm22;)V

    .line 940
    .line 941
    .line 942
    invoke-virtual {v2, v6}, Lry1;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 943
    .line 944
    .line 945
    move-result-object v3

    .line 946
    invoke-virtual {v2, v15}, Lry1;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 947
    .line 948
    .line 949
    move-result-object v2

    .line 950
    const-string v4, "Unknown param type. event, param"

    .line 951
    .line 952
    invoke-virtual {v10, v4, v3, v2}, Lso;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 953
    .line 954
    .line 955
    goto/16 :goto_8

    .line 956
    .line 957
    :cond_29
    move/from16 v20, v3

    .line 958
    .line 959
    move-object/from16 v19, v4

    .line 960
    .line 961
    sget-object v12, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 962
    .line 963
    :goto_13
    invoke-static/range {v19 .. v19}, Ly02;->l(Lm22;)V

    .line 964
    .line 965
    .line 966
    if-nez v12, :cond_2a

    .line 967
    .line 968
    const-string v2, "null"

    .line 969
    .line 970
    goto :goto_14

    .line 971
    :cond_2a
    move-object v2, v12

    .line 972
    :goto_14
    const-string v3, "Event filter result"

    .line 973
    .line 974
    invoke-virtual {v9, v2, v3}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 975
    .line 976
    .line 977
    if-nez v12, :cond_2b

    .line 978
    .line 979
    const/16 v16, 0x0

    .line 980
    .line 981
    return v16

    .line 982
    :cond_2b
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 983
    .line 984
    iput-object v2, v0, Ldn1;->c:Ljava/lang/Boolean;

    .line 985
    .line 986
    invoke-virtual {v12}, Ljava/lang/Boolean;->booleanValue()Z

    .line 987
    .line 988
    .line 989
    move-result v3

    .line 990
    if-nez v3, :cond_2d

    .line 991
    .line 992
    :cond_2c
    :goto_15
    const/4 v15, 0x1

    .line 993
    goto :goto_18

    .line 994
    :cond_2d
    iput-object v2, v0, Ldn1;->d:Ljava/lang/Boolean;

    .line 995
    .line 996
    if-eqz v1, :cond_2c

    .line 997
    .line 998
    invoke-virtual/range {p3 .. p3}, Lj02;->x()Z

    .line 999
    .line 1000
    .line 1001
    move-result v1

    .line 1002
    if-eqz v1, :cond_2c

    .line 1003
    .line 1004
    invoke-virtual/range {p3 .. p3}, Lj02;->y()J

    .line 1005
    .line 1006
    .line 1007
    move-result-wide v1

    .line 1008
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 1009
    .line 1010
    .line 1011
    move-result-object v1

    .line 1012
    invoke-virtual {v5}, Lmx1;->A()Z

    .line 1013
    .line 1014
    .line 1015
    move-result v2

    .line 1016
    if-eqz v2, :cond_30

    .line 1017
    .line 1018
    if-eqz v20, :cond_2f

    .line 1019
    .line 1020
    invoke-virtual {v5}, Lmx1;->x()Z

    .line 1021
    .line 1022
    .line 1023
    move-result v2

    .line 1024
    if-nez v2, :cond_2e

    .line 1025
    .line 1026
    goto :goto_16

    .line 1027
    :cond_2e
    move-object/from16 v1, p1

    .line 1028
    .line 1029
    :cond_2f
    :goto_16
    iput-object v1, v0, Ldn1;->f:Ljava/lang/Long;

    .line 1030
    .line 1031
    goto :goto_15

    .line 1032
    :cond_30
    if-eqz v20, :cond_32

    .line 1033
    .line 1034
    invoke-virtual {v5}, Lmx1;->x()Z

    .line 1035
    .line 1036
    .line 1037
    move-result v2

    .line 1038
    if-nez v2, :cond_31

    .line 1039
    .line 1040
    goto :goto_17

    .line 1041
    :cond_31
    move-object/from16 v1, p2

    .line 1042
    .line 1043
    :cond_32
    :goto_17
    iput-object v1, v0, Ldn1;->e:Ljava/lang/Long;

    .line 1044
    .line 1045
    goto :goto_15

    .line 1046
    :goto_18
    return v15

    .line 1047
    :goto_19
    invoke-static/range {v19 .. v19}, Ly02;->l(Lm22;)V

    .line 1048
    .line 1049
    .line 1050
    invoke-static {v6}, Lzy1;->p(Ljava/lang/String;)Lxy1;

    .line 1051
    .line 1052
    .line 1053
    move-result-object v0

    .line 1054
    invoke-virtual {v5}, Lmx1;->r()Z

    .line 1055
    .line 1056
    .line 1057
    move-result v1

    .line 1058
    if-eqz v1, :cond_33

    .line 1059
    .line 1060
    invoke-virtual {v5}, Lmx1;->s()I

    .line 1061
    .line 1062
    .line 1063
    move-result v1

    .line 1064
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 1065
    .line 1066
    .line 1067
    move-result-object v12

    .line 1068
    goto :goto_1a

    .line 1069
    :cond_33
    const/4 v12, 0x0

    .line 1070
    :goto_1a
    invoke-static {v12}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 1071
    .line 1072
    .line 1073
    move-result-object v1

    .line 1074
    const-string v2, "Invalid event filter ID. appId, id"

    .line 1075
    .line 1076
    invoke-virtual {v10, v2, v0, v1}, Lso;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1077
    .line 1078
    .line 1079
    const/16 v16, 0x0

    .line 1080
    .line 1081
    return v16
.end method

.method public b(Ljava/lang/Long;Ljava/lang/Long;Lw12;Z)Z
    .locals 15

    .line 1
    invoke-static {}, Lds1;->a()V

    .line 2
    .line 3
    .line 4
    iget-object v1, p0, Ldn1;->h:Ldp1;

    .line 5
    .line 6
    iget-object v1, v1, Let;->j:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast v1, Ly02;

    .line 9
    .line 10
    iget-object v2, v1, Ly02;->m:Lmt1;

    .line 11
    .line 12
    iget-object v3, v1, Ly02;->s:Lry1;

    .line 13
    .line 14
    iget-object v1, v1, Ly02;->o:Lzy1;

    .line 15
    .line 16
    iget-object v4, p0, Ldn1;->a:Ljava/lang/String;

    .line 17
    .line 18
    sget-object v5, Lxx1;->D0:Lwx1;

    .line 19
    .line 20
    invoke-virtual {v2, v4, v5}, Lmt1;->w(Ljava/lang/String;Lwx1;)Z

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    iget-object v4, p0, Ldn1;->i:Lnp1;

    .line 25
    .line 26
    check-cast v4, Lsx1;

    .line 27
    .line 28
    invoke-virtual {v4}, Lsx1;->v()Z

    .line 29
    .line 30
    .line 31
    move-result v5

    .line 32
    invoke-virtual {v4}, Lsx1;->w()Z

    .line 33
    .line 34
    .line 35
    move-result v6

    .line 36
    invoke-virtual {v4}, Lsx1;->y()Z

    .line 37
    .line 38
    .line 39
    move-result v7

    .line 40
    const/4 v8, 0x0

    .line 41
    const/4 v9, 0x1

    .line 42
    if-nez v5, :cond_0

    .line 43
    .line 44
    if-nez v6, :cond_0

    .line 45
    .line 46
    if-eqz v7, :cond_1

    .line 47
    .line 48
    :cond_0
    move v5, v9

    .line 49
    goto :goto_0

    .line 50
    :cond_1
    move v5, v8

    .line 51
    :goto_0
    if-eqz p4, :cond_3

    .line 52
    .line 53
    if-nez v5, :cond_3

    .line 54
    .line 55
    invoke-static {v1}, Ly02;->l(Lm22;)V

    .line 56
    .line 57
    .line 58
    iget-object v1, v1, Lzy1;->w:Lso;

    .line 59
    .line 60
    iget v0, p0, Ldn1;->b:I

    .line 61
    .line 62
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {v4}, Lsx1;->r()Z

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    if-eqz v2, :cond_2

    .line 71
    .line 72
    invoke-virtual {v4}, Lsx1;->s()I

    .line 73
    .line 74
    .line 75
    move-result v2

    .line 76
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 77
    .line 78
    .line 79
    move-result-object v6

    .line 80
    goto :goto_1

    .line 81
    :cond_2
    const/4 v6, 0x0

    .line 82
    :goto_1
    const-string v2, "Property filter already evaluated true and it is not associated with an enhanced audience. audience ID, filter ID"

    .line 83
    .line 84
    invoke-virtual {v1, v2, v0, v6}, Lso;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 85
    .line 86
    .line 87
    return v9

    .line 88
    :cond_3
    invoke-virtual {v4}, Lsx1;->u()Lox1;

    .line 89
    .line 90
    .line 91
    move-result-object v10

    .line 92
    invoke-virtual {v10}, Lox1;->w()Z

    .line 93
    .line 94
    .line 95
    move-result v11

    .line 96
    invoke-virtual/range {p3 .. p3}, Lw12;->w()Z

    .line 97
    .line 98
    .line 99
    move-result v12

    .line 100
    const-wide/16 v13, 0x0

    .line 101
    .line 102
    if-eqz v12, :cond_5

    .line 103
    .line 104
    invoke-virtual {v10}, Lox1;->t()Z

    .line 105
    .line 106
    .line 107
    move-result v12

    .line 108
    if-nez v12, :cond_4

    .line 109
    .line 110
    invoke-static {v1}, Ly02;->l(Lm22;)V

    .line 111
    .line 112
    .line 113
    iget-object v10, v1, Lzy1;->r:Lso;

    .line 114
    .line 115
    invoke-virtual/range {p3 .. p3}, Lw12;->t()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v11

    .line 119
    invoke-virtual {v3, v11}, Lry1;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v3

    .line 123
    const-string v11, "No number filter for long property. property"

    .line 124
    .line 125
    invoke-virtual {v10, v3, v11}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    move v12, v7

    .line 129
    :goto_2
    const/4 v6, 0x0

    .line 130
    goto/16 :goto_6

    .line 131
    .line 132
    :cond_4
    move v12, v7

    .line 133
    invoke-virtual/range {p3 .. p3}, Lw12;->x()J

    .line 134
    .line 135
    .line 136
    move-result-wide v6

    .line 137
    invoke-virtual {v10}, Lox1;->u()Lqx1;

    .line 138
    .line 139
    .line 140
    move-result-object v3

    .line 141
    :try_start_0
    new-instance v10, Ljava/math/BigDecimal;

    .line 142
    .line 143
    invoke-direct {v10, v6, v7}, Ljava/math/BigDecimal;-><init>(J)V

    .line 144
    .line 145
    .line 146
    invoke-static {v10, v3, v13, v14}, Ldn1;->e(Ljava/math/BigDecimal;Lqx1;D)Ljava/lang/Boolean;

    .line 147
    .line 148
    .line 149
    move-result-object v6
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 150
    goto :goto_3

    .line 151
    :catch_0
    const/4 v6, 0x0

    .line 152
    :goto_3
    invoke-static {v6, v11}, Ldn1;->c(Ljava/lang/Boolean;Z)Ljava/lang/Boolean;

    .line 153
    .line 154
    .line 155
    move-result-object v6

    .line 156
    goto/16 :goto_6

    .line 157
    .line 158
    :cond_5
    move v12, v7

    .line 159
    invoke-virtual/range {p3 .. p3}, Lw12;->A()Z

    .line 160
    .line 161
    .line 162
    move-result v6

    .line 163
    if-eqz v6, :cond_7

    .line 164
    .line 165
    invoke-virtual {v10}, Lox1;->t()Z

    .line 166
    .line 167
    .line 168
    move-result v6

    .line 169
    if-nez v6, :cond_6

    .line 170
    .line 171
    invoke-static {v1}, Ly02;->l(Lm22;)V

    .line 172
    .line 173
    .line 174
    iget-object v6, v1, Lzy1;->r:Lso;

    .line 175
    .line 176
    invoke-virtual/range {p3 .. p3}, Lw12;->t()Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object v7

    .line 180
    invoke-virtual {v3, v7}, Lry1;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object v3

    .line 184
    const-string v7, "No number filter for double property. property"

    .line 185
    .line 186
    invoke-virtual {v6, v3, v7}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 187
    .line 188
    .line 189
    goto :goto_2

    .line 190
    :cond_6
    invoke-virtual/range {p3 .. p3}, Lw12;->B()D

    .line 191
    .line 192
    .line 193
    move-result-wide v6

    .line 194
    invoke-virtual {v10}, Lox1;->u()Lqx1;

    .line 195
    .line 196
    .line 197
    move-result-object v3

    .line 198
    :try_start_1
    new-instance v10, Ljava/math/BigDecimal;

    .line 199
    .line 200
    invoke-direct {v10, v6, v7}, Ljava/math/BigDecimal;-><init>(D)V

    .line 201
    .line 202
    .line 203
    invoke-static {v6, v7}, Ljava/lang/Math;->ulp(D)D

    .line 204
    .line 205
    .line 206
    move-result-wide v6

    .line 207
    invoke-static {v10, v3, v6, v7}, Ldn1;->e(Ljava/math/BigDecimal;Lqx1;D)Ljava/lang/Boolean;

    .line 208
    .line 209
    .line 210
    move-result-object v6
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1

    .line 211
    goto :goto_4

    .line 212
    :catch_1
    const/4 v6, 0x0

    .line 213
    :goto_4
    invoke-static {v6, v11}, Ldn1;->c(Ljava/lang/Boolean;Z)Ljava/lang/Boolean;

    .line 214
    .line 215
    .line 216
    move-result-object v6

    .line 217
    goto/16 :goto_6

    .line 218
    .line 219
    :cond_7
    invoke-virtual/range {p3 .. p3}, Lw12;->u()Z

    .line 220
    .line 221
    .line 222
    move-result v6

    .line 223
    if-eqz v6, :cond_c

    .line 224
    .line 225
    invoke-virtual {v10}, Lox1;->r()Z

    .line 226
    .line 227
    .line 228
    move-result v6

    .line 229
    if-nez v6, :cond_b

    .line 230
    .line 231
    invoke-virtual {v10}, Lox1;->t()Z

    .line 232
    .line 233
    .line 234
    move-result v6

    .line 235
    if-nez v6, :cond_8

    .line 236
    .line 237
    invoke-static {v1}, Ly02;->l(Lm22;)V

    .line 238
    .line 239
    .line 240
    iget-object v6, v1, Lzy1;->r:Lso;

    .line 241
    .line 242
    invoke-virtual/range {p3 .. p3}, Lw12;->t()Ljava/lang/String;

    .line 243
    .line 244
    .line 245
    move-result-object v7

    .line 246
    invoke-virtual {v3, v7}, Lry1;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 247
    .line 248
    .line 249
    move-result-object v3

    .line 250
    const-string v7, "No string or number filter defined. property"

    .line 251
    .line 252
    invoke-virtual {v6, v3, v7}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 253
    .line 254
    .line 255
    goto :goto_2

    .line 256
    :cond_8
    invoke-virtual/range {p3 .. p3}, Lw12;->v()Ljava/lang/String;

    .line 257
    .line 258
    .line 259
    move-result-object v6

    .line 260
    invoke-static {v6}, Lva2;->P(Ljava/lang/String;)Z

    .line 261
    .line 262
    .line 263
    move-result v6

    .line 264
    if-eqz v6, :cond_a

    .line 265
    .line 266
    invoke-virtual/range {p3 .. p3}, Lw12;->v()Ljava/lang/String;

    .line 267
    .line 268
    .line 269
    move-result-object v3

    .line 270
    invoke-virtual {v10}, Lox1;->u()Lqx1;

    .line 271
    .line 272
    .line 273
    move-result-object v6

    .line 274
    invoke-static {v3}, Lva2;->P(Ljava/lang/String;)Z

    .line 275
    .line 276
    .line 277
    move-result v7

    .line 278
    if-nez v7, :cond_9

    .line 279
    .line 280
    :catch_2
    const/4 v6, 0x0

    .line 281
    goto :goto_5

    .line 282
    :cond_9
    :try_start_2
    new-instance v7, Ljava/math/BigDecimal;

    .line 283
    .line 284
    invoke-direct {v7, v3}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    .line 285
    .line 286
    .line 287
    invoke-static {v7, v6, v13, v14}, Ldn1;->e(Ljava/math/BigDecimal;Lqx1;D)Ljava/lang/Boolean;

    .line 288
    .line 289
    .line 290
    move-result-object v6
    :try_end_2
    .catch Ljava/lang/NumberFormatException; {:try_start_2 .. :try_end_2} :catch_2

    .line 291
    :goto_5
    invoke-static {v6, v11}, Ldn1;->c(Ljava/lang/Boolean;Z)Ljava/lang/Boolean;

    .line 292
    .line 293
    .line 294
    move-result-object v6

    .line 295
    goto :goto_6

    .line 296
    :cond_a
    invoke-static {v1}, Ly02;->l(Lm22;)V

    .line 297
    .line 298
    .line 299
    iget-object v6, v1, Lzy1;->r:Lso;

    .line 300
    .line 301
    invoke-virtual/range {p3 .. p3}, Lw12;->t()Ljava/lang/String;

    .line 302
    .line 303
    .line 304
    move-result-object v7

    .line 305
    invoke-virtual {v3, v7}, Lry1;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 306
    .line 307
    .line 308
    move-result-object v3

    .line 309
    invoke-virtual/range {p3 .. p3}, Lw12;->v()Ljava/lang/String;

    .line 310
    .line 311
    .line 312
    move-result-object v7

    .line 313
    const-string v10, "Invalid user property value for Numeric number filter. property, value"

    .line 314
    .line 315
    invoke-virtual {v6, v10, v3, v7}, Lso;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 316
    .line 317
    .line 318
    goto/16 :goto_2

    .line 319
    .line 320
    :cond_b
    invoke-virtual/range {p3 .. p3}, Lw12;->v()Ljava/lang/String;

    .line 321
    .line 322
    .line 323
    move-result-object v3

    .line 324
    invoke-virtual {v10}, Lox1;->s()Ltx1;

    .line 325
    .line 326
    .line 327
    move-result-object v6

    .line 328
    invoke-static {v1}, Ly02;->l(Lm22;)V

    .line 329
    .line 330
    .line 331
    invoke-static {v3, v6, v1}, Ldn1;->d(Ljava/lang/String;Ltx1;Lzy1;)Ljava/lang/Boolean;

    .line 332
    .line 333
    .line 334
    move-result-object v3

    .line 335
    invoke-static {v3, v11}, Ldn1;->c(Ljava/lang/Boolean;Z)Ljava/lang/Boolean;

    .line 336
    .line 337
    .line 338
    move-result-object v6

    .line 339
    goto :goto_6

    .line 340
    :cond_c
    invoke-static {v1}, Ly02;->l(Lm22;)V

    .line 341
    .line 342
    .line 343
    iget-object v6, v1, Lzy1;->r:Lso;

    .line 344
    .line 345
    invoke-virtual/range {p3 .. p3}, Lw12;->t()Ljava/lang/String;

    .line 346
    .line 347
    .line 348
    move-result-object v7

    .line 349
    invoke-virtual {v3, v7}, Lry1;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 350
    .line 351
    .line 352
    move-result-object v3

    .line 353
    const-string v7, "User property has no value, property"

    .line 354
    .line 355
    invoke-virtual {v6, v3, v7}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 356
    .line 357
    .line 358
    goto/16 :goto_2

    .line 359
    .line 360
    :goto_6
    invoke-static {v1}, Ly02;->l(Lm22;)V

    .line 361
    .line 362
    .line 363
    iget-object v1, v1, Lzy1;->w:Lso;

    .line 364
    .line 365
    if-nez v6, :cond_d

    .line 366
    .line 367
    const-string v3, "null"

    .line 368
    .line 369
    goto :goto_7

    .line 370
    :cond_d
    move-object v3, v6

    .line 371
    :goto_7
    const-string v7, "Property filter result"

    .line 372
    .line 373
    invoke-virtual {v1, v3, v7}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 374
    .line 375
    .line 376
    if-nez v6, :cond_e

    .line 377
    .line 378
    return v8

    .line 379
    :cond_e
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 380
    .line 381
    iput-object v1, p0, Ldn1;->c:Ljava/lang/Boolean;

    .line 382
    .line 383
    if-eqz v12, :cond_f

    .line 384
    .line 385
    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    .line 386
    .line 387
    .line 388
    move-result v1

    .line 389
    if-nez v1, :cond_f

    .line 390
    .line 391
    goto :goto_8

    .line 392
    :cond_f
    if-eqz p4, :cond_10

    .line 393
    .line 394
    invoke-virtual {v4}, Lsx1;->v()Z

    .line 395
    .line 396
    .line 397
    move-result v1

    .line 398
    if-eqz v1, :cond_11

    .line 399
    .line 400
    :cond_10
    iput-object v6, p0, Ldn1;->d:Ljava/lang/Boolean;

    .line 401
    .line 402
    :cond_11
    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    .line 403
    .line 404
    .line 405
    move-result v1

    .line 406
    if-eqz v1, :cond_15

    .line 407
    .line 408
    if-eqz v5, :cond_15

    .line 409
    .line 410
    invoke-virtual/range {p3 .. p3}, Lw12;->r()Z

    .line 411
    .line 412
    .line 413
    move-result v1

    .line 414
    if-eqz v1, :cond_15

    .line 415
    .line 416
    invoke-virtual/range {p3 .. p3}, Lw12;->s()J

    .line 417
    .line 418
    .line 419
    move-result-wide v5

    .line 420
    if-eqz p1, :cond_12

    .line 421
    .line 422
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Long;->longValue()J

    .line 423
    .line 424
    .line 425
    move-result-wide v5

    .line 426
    :cond_12
    if-eqz v2, :cond_13

    .line 427
    .line 428
    invoke-virtual {v4}, Lsx1;->v()Z

    .line 429
    .line 430
    .line 431
    move-result v1

    .line 432
    if-eqz v1, :cond_13

    .line 433
    .line 434
    invoke-virtual {v4}, Lsx1;->w()Z

    .line 435
    .line 436
    .line 437
    move-result v1

    .line 438
    if-nez v1, :cond_13

    .line 439
    .line 440
    if-eqz p2, :cond_13

    .line 441
    .line 442
    invoke-virtual/range {p2 .. p2}, Ljava/lang/Long;->longValue()J

    .line 443
    .line 444
    .line 445
    move-result-wide v5

    .line 446
    :cond_13
    invoke-virtual {v4}, Lsx1;->w()Z

    .line 447
    .line 448
    .line 449
    move-result v1

    .line 450
    if-eqz v1, :cond_14

    .line 451
    .line 452
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 453
    .line 454
    .line 455
    move-result-object v1

    .line 456
    iput-object v1, p0, Ldn1;->f:Ljava/lang/Long;

    .line 457
    .line 458
    goto :goto_8

    .line 459
    :cond_14
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 460
    .line 461
    .line 462
    move-result-object v1

    .line 463
    iput-object v1, p0, Ldn1;->e:Ljava/lang/Long;

    .line 464
    .line 465
    :cond_15
    :goto_8
    return v9
.end method
