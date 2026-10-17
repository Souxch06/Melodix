.class public final synthetic Lm;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lr80;


# instance fields
.field public final synthetic j:I

.field public final synthetic k:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;)V
    .locals 0

    .line 10
    iput p1, p0, Lm;->j:I

    iput-object p2, p0, Lm;->k:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lzo0;Lyo0;)V
    .locals 0

    .line 1
    const/4 p2, 0x4

    .line 2
    iput p2, p0, Lm;->j:I

    .line 3
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Lm;->k:Ljava/lang/Object;

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final g(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 12

    .line 1
    iget v0, p0, Lm;->j:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    iget-object p0, p0, Lm;->k:Ljava/lang/Object;

    .line 5
    .line 6
    packed-switch v0, :pswitch_data_0

    .line 7
    .line 8
    .line 9
    check-cast p0, Llt0;

    .line 10
    .line 11
    check-cast p1, Ljava/lang/Integer;

    .line 12
    .line 13
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    new-instance v0, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 20
    .line 21
    .line 22
    iget-object v1, p0, Llt0;->e:[Ljava/lang/String;

    .line 23
    .line 24
    aget-object v1, v1, p1

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string v1, ": "

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, p1}, Llt0;->j(I)Li41;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-interface {p0}, Li41;->b()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    return-object p0

    .line 50
    :pswitch_0
    check-cast p0, Lzo0;

    .line 51
    .line 52
    check-cast p1, Ljava/lang/Throwable;

    .line 53
    .line 54
    invoke-virtual {p0, v1}, Lzo0;->f(Ljava/lang/Object;)V

    .line 55
    .line 56
    .line 57
    sget-object p0, Lwe1;->a:Lwe1;

    .line 58
    .line 59
    return-object p0

    .line 60
    :pswitch_1
    check-cast p0, Lag0;

    .line 61
    .line 62
    move-object v3, p1

    .line 63
    check-cast v3, Landroid/content/Context;

    .line 64
    .line 65
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 66
    .line 67
    .line 68
    iget-object v4, p0, Lag0;->a:Ljava/lang/String;

    .line 69
    .line 70
    sget-object p0, Li71;->a:Ljava/util/LinkedHashSet;

    .line 71
    .line 72
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 73
    .line 74
    .line 75
    new-instance v2, Lg71;

    .line 76
    .line 77
    new-instance v6, Lgu;

    .line 78
    .line 79
    const/4 p1, 0x3

    .line 80
    invoke-direct {v6, p0, v1, p1}, Lgu;-><init>(Ljava/lang/Object;Liq;I)V

    .line 81
    .line 82
    .line 83
    new-instance v7, Lh71;

    .line 84
    .line 85
    invoke-direct {v7, p1, v1}, Lcb1;-><init>(ILiq;)V

    .line 86
    .line 87
    .line 88
    sget-object v5, Lj71;->a:Ljava/util/LinkedHashSet;

    .line 89
    .line 90
    invoke-direct/range {v2 .. v7}, Lg71;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/util/Set;Lgu;Lh71;)V

    .line 91
    .line 92
    .line 93
    invoke-static {v2}, Lk42;->k(Ljava/lang/Object;)Ljava/util/List;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    return-object p0

    .line 98
    :pswitch_2
    check-cast p0, Lyb0;

    .line 99
    .line 100
    check-cast p1, Lxo0;

    .line 101
    .line 102
    sget-object v0, Lyb0;->c:Lnu0;

    .line 103
    .line 104
    invoke-virtual {p1}, Lxo0;->a()Ljava/util/Map;

    .line 105
    .line 106
    .line 107
    move-result-object v2

    .line 108
    iget-object v3, p1, Lxo0;->a:Ljava/util/LinkedHashMap;

    .line 109
    .line 110
    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 111
    .line 112
    .line 113
    move-result-object v2

    .line 114
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 115
    .line 116
    .line 117
    move-result-object v2

    .line 118
    const-wide/16 v4, 0x0

    .line 119
    .line 120
    move-wide v6, v4

    .line 121
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 122
    .line 123
    .line 124
    move-result v8

    .line 125
    if-eqz v8, :cond_3

    .line 126
    .line 127
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 128
    .line 129
    .line 130
    move-result-object v8

    .line 131
    check-cast v8, Ljava/util/Map$Entry;

    .line 132
    .line 133
    invoke-interface {v8}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 134
    .line 135
    .line 136
    move-result-object v9

    .line 137
    instance-of v9, v9, Ljava/util/Set;

    .line 138
    .line 139
    if-eqz v9, :cond_0

    .line 140
    .line 141
    invoke-interface {v8}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 142
    .line 143
    .line 144
    move-result-object v9

    .line 145
    check-cast v9, Lnu0;

    .line 146
    .line 147
    invoke-interface {v8}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 148
    .line 149
    .line 150
    move-result-object v8

    .line 151
    check-cast v8, Ljava/util/Set;

    .line 152
    .line 153
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 154
    .line 155
    .line 156
    move-result-wide v10

    .line 157
    invoke-virtual {p0, v10, v11}, Lyb0;->b(J)Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object v10

    .line 161
    invoke-interface {v8, v10}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 162
    .line 163
    .line 164
    move-result v8

    .line 165
    if-eqz v8, :cond_2

    .line 166
    .line 167
    filled-new-array {v10}, [Ljava/lang/Object;

    .line 168
    .line 169
    .line 170
    move-result-object v8

    .line 171
    new-instance v10, Ljava/util/HashSet;

    .line 172
    .line 173
    const/4 v11, 0x1

    .line 174
    invoke-direct {v10, v11}, Ljava/util/HashSet;-><init>(I)V

    .line 175
    .line 176
    .line 177
    const/4 v11, 0x0

    .line 178
    aget-object v8, v8, v11

    .line 179
    .line 180
    invoke-static {v8}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 181
    .line 182
    .line 183
    invoke-virtual {v10, v8}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 184
    .line 185
    .line 186
    move-result v11

    .line 187
    if-eqz v11, :cond_1

    .line 188
    .line 189
    invoke-static {v10}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    .line 190
    .line 191
    .line 192
    move-result-object v8

    .line 193
    invoke-virtual {p1, v9, v8}, Lxo0;->c(Lnu0;Ljava/lang/Object;)V

    .line 194
    .line 195
    .line 196
    const-wide/16 v8, 0x1

    .line 197
    .line 198
    add-long/2addr v6, v8

    .line 199
    goto :goto_0

    .line 200
    :cond_1
    const-string p0, "duplicate element: "

    .line 201
    .line 202
    invoke-static {v8, p0}, Lo40;->v(Ljava/lang/Object;Ljava/lang/String;)V

    .line 203
    .line 204
    .line 205
    goto :goto_1

    .line 206
    :cond_2
    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 207
    .line 208
    .line 209
    invoke-virtual {p1}, Lxo0;->b()V

    .line 210
    .line 211
    .line 212
    invoke-interface {v3, v9}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 213
    .line 214
    .line 215
    goto :goto_0

    .line 216
    :cond_3
    cmp-long p0, v6, v4

    .line 217
    .line 218
    if-nez p0, :cond_4

    .line 219
    .line 220
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 221
    .line 222
    .line 223
    invoke-virtual {p1}, Lxo0;->b()V

    .line 224
    .line 225
    .line 226
    invoke-interface {v3, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 227
    .line 228
    .line 229
    goto :goto_1

    .line 230
    :cond_4
    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 231
    .line 232
    .line 233
    move-result-object p0

    .line 234
    invoke-virtual {p1, v0, p0}, Lxo0;->c(Lnu0;Ljava/lang/Object;)V

    .line 235
    .line 236
    .line 237
    :goto_1
    return-object v1

    .line 238
    :pswitch_3
    check-cast p0, Lv41;

    .line 239
    .line 240
    check-cast p1, Ler;

    .line 241
    .line 242
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 243
    .line 244
    .line 245
    new-instance p1, Lu41;

    .line 246
    .line 247
    iget-object p0, p0, Lv41;->j:Le51;

    .line 248
    .line 249
    invoke-virtual {p0, v1}, Le51;->a(Ly41;)Ly41;

    .line 250
    .line 251
    .line 252
    move-result-object p0

    .line 253
    invoke-direct {p1, p0, v1, v1}, Lu41;-><init>(Ly41;Ljc1;Ljava/util/Map;)V

    .line 254
    .line 255
    .line 256
    return-object p1

    .line 257
    :pswitch_4
    check-cast p0, Lg0;

    .line 258
    .line 259
    if-ne p1, p0, :cond_5

    .line 260
    .line 261
    const-string p0, "(this Collection)"

    .line 262
    .line 263
    goto :goto_2

    .line 264
    :cond_5
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 265
    .line 266
    .line 267
    move-result-object p0

    .line 268
    :goto_2
    return-object p0

    .line 269
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
