.class public final Ld2;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/util/Comparator;


# static fields
.field public static final synthetic k:Ld2;


# instance fields
.field public final synthetic j:I


# direct methods
.method public static synthetic constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ld2;

    .line 2
    .line 3
    const/4 v1, 0x6

    .line 4
    invoke-direct {v0, v1}, Ld2;-><init>(I)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ld2;->k:Ld2;

    .line 8
    .line 9
    return-void
.end method

.method public synthetic constructor <init>(I)V
    .locals 0

    .line 1
    iput p1, p0, Ld2;->j:I

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 6

    .line 1
    iget p0, p0, Ld2;->j:I

    .line 2
    .line 3
    const/4 v0, -0x1

    .line 4
    const/4 v1, 0x0

    .line 5
    const/4 v2, 0x1

    .line 6
    packed-switch p0, :pswitch_data_0

    .line 7
    .line 8
    .line 9
    check-cast p2, Ljava/lang/Long;

    .line 10
    .line 11
    check-cast p1, Ljava/lang/Long;

    .line 12
    .line 13
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 14
    .line 15
    .line 16
    move-result-wide p0

    .line 17
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    .line 18
    .line 19
    .line 20
    move-result-wide v0

    .line 21
    invoke-static {p0, p1, v0, v1}, Ljava/lang/Long;->compare(JJ)I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    return p0

    .line 26
    :pswitch_0
    check-cast p1, Ljava/util/Map$Entry;

    .line 27
    .line 28
    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    check-cast p0, Ljava/lang/String;

    .line 33
    .line 34
    check-cast p2, Ljava/util/Map$Entry;

    .line 35
    .line 36
    invoke-interface {p2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    check-cast p1, Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    return p0

    .line 47
    :pswitch_1
    invoke-static {p1}, Lx81;->d(Ljava/lang/Object;)I

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    invoke-static {p2}, Lx81;->d(Ljava/lang/Object;)I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    const/4 v1, 0x0

    .line 56
    if-ne p0, v0, :cond_4

    .line 57
    .line 58
    invoke-static {p0}, Loq;->t(I)I

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    if-eqz p0, :cond_3

    .line 63
    .line 64
    if-eq p0, v2, :cond_2

    .line 65
    .line 66
    const/4 v0, 0x2

    .line 67
    if-eq p0, v0, :cond_1

    .line 68
    .line 69
    const/4 v0, 0x3

    .line 70
    if-ne p0, v0, :cond_0

    .line 71
    .line 72
    check-cast p1, Ljava/lang/Double;

    .line 73
    .line 74
    check-cast p2, Ljava/lang/Double;

    .line 75
    .line 76
    invoke-virtual {p1, p2}, Ljava/lang/Double;->compareTo(Ljava/lang/Double;)I

    .line 77
    .line 78
    .line 79
    move-result p0

    .line 80
    goto :goto_0

    .line 81
    :cond_0
    throw v1

    .line 82
    :cond_1
    check-cast p1, Ljava/lang/Long;

    .line 83
    .line 84
    check-cast p2, Ljava/lang/Long;

    .line 85
    .line 86
    invoke-virtual {p1, p2}, Ljava/lang/Long;->compareTo(Ljava/lang/Long;)I

    .line 87
    .line 88
    .line 89
    move-result p0

    .line 90
    goto :goto_0

    .line 91
    :cond_2
    check-cast p1, Ljava/lang/String;

    .line 92
    .line 93
    check-cast p2, Ljava/lang/String;

    .line 94
    .line 95
    invoke-virtual {p1, p2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    .line 96
    .line 97
    .line 98
    move-result p0

    .line 99
    goto :goto_0

    .line 100
    :cond_3
    check-cast p1, Ljava/lang/Boolean;

    .line 101
    .line 102
    check-cast p2, Ljava/lang/Boolean;

    .line 103
    .line 104
    invoke-virtual {p1, p2}, Ljava/lang/Boolean;->compareTo(Ljava/lang/Boolean;)I

    .line 105
    .line 106
    .line 107
    move-result p0

    .line 108
    goto :goto_0

    .line 109
    :cond_4
    if-eqz p0, :cond_5

    .line 110
    .line 111
    if-eqz v0, :cond_5

    .line 112
    .line 113
    sub-int/2addr p0, v0

    .line 114
    :goto_0
    return p0

    .line 115
    :cond_5
    throw v1

    .line 116
    :pswitch_2
    check-cast p1, Ln81;

    .line 117
    .line 118
    check-cast p2, Ln81;

    .line 119
    .line 120
    iget p0, p1, Ln81;->b:I

    .line 121
    .line 122
    iget p1, p2, Ln81;->b:I

    .line 123
    .line 124
    sub-int/2addr p0, p1

    .line 125
    return p0

    .line 126
    :pswitch_3
    check-cast p1, Lt90;

    .line 127
    .line 128
    check-cast p2, Lt90;

    .line 129
    .line 130
    iget-object p0, p1, Lt90;->d:Landroidx/recyclerview/widget/RecyclerView;

    .line 131
    .line 132
    if-nez p0, :cond_6

    .line 133
    .line 134
    move v3, v2

    .line 135
    goto :goto_1

    .line 136
    :cond_6
    move v3, v1

    .line 137
    :goto_1
    iget-object v4, p2, Lt90;->d:Landroidx/recyclerview/widget/RecyclerView;

    .line 138
    .line 139
    if-nez v4, :cond_7

    .line 140
    .line 141
    move v4, v2

    .line 142
    goto :goto_2

    .line 143
    :cond_7
    move v4, v1

    .line 144
    :goto_2
    if-eq v3, v4, :cond_8

    .line 145
    .line 146
    if-nez p0, :cond_d

    .line 147
    .line 148
    goto :goto_3

    .line 149
    :cond_8
    iget-boolean p0, p1, Lt90;->a:Z

    .line 150
    .line 151
    iget-boolean v3, p2, Lt90;->a:Z

    .line 152
    .line 153
    if-eq p0, v3, :cond_a

    .line 154
    .line 155
    if-eqz p0, :cond_9

    .line 156
    .line 157
    goto :goto_4

    .line 158
    :cond_9
    :goto_3
    move v0, v2

    .line 159
    goto :goto_4

    .line 160
    :cond_a
    iget p0, p2, Lt90;->b:I

    .line 161
    .line 162
    iget v0, p1, Lt90;->b:I

    .line 163
    .line 164
    sub-int v0, p0, v0

    .line 165
    .line 166
    if-eqz v0, :cond_b

    .line 167
    .line 168
    goto :goto_4

    .line 169
    :cond_b
    iget p0, p1, Lt90;->c:I

    .line 170
    .line 171
    iget p1, p2, Lt90;->c:I

    .line 172
    .line 173
    sub-int v0, p0, p1

    .line 174
    .line 175
    if-eqz v0, :cond_c

    .line 176
    .line 177
    goto :goto_4

    .line 178
    :cond_c
    move v0, v1

    .line 179
    :cond_d
    :goto_4
    return v0

    .line 180
    :pswitch_4
    check-cast p1, Ljava/lang/String;

    .line 181
    .line 182
    check-cast p2, Ljava/lang/String;

    .line 183
    .line 184
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 185
    .line 186
    .line 187
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 188
    .line 189
    .line 190
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 191
    .line 192
    .line 193
    move-result p0

    .line 194
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 195
    .line 196
    .line 197
    move-result v3

    .line 198
    invoke-static {p0, v3}, Ljava/lang/Math;->min(II)I

    .line 199
    .line 200
    .line 201
    move-result p0

    .line 202
    const/4 v3, 0x4

    .line 203
    :goto_5
    if-ge v3, p0, :cond_f

    .line 204
    .line 205
    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    .line 206
    .line 207
    .line 208
    move-result v4

    .line 209
    invoke-virtual {p2, v3}, Ljava/lang/String;->charAt(I)C

    .line 210
    .line 211
    .line 212
    move-result v5

    .line 213
    if-eq v4, v5, :cond_e

    .line 214
    .line 215
    invoke-static {v4, v5}, Ldl1;->e(II)I

    .line 216
    .line 217
    .line 218
    move-result p0

    .line 219
    if-gez p0, :cond_10

    .line 220
    .line 221
    goto :goto_6

    .line 222
    :cond_e
    add-int/lit8 v3, v3, 0x1

    .line 223
    .line 224
    goto :goto_5

    .line 225
    :cond_f
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 226
    .line 227
    .line 228
    move-result p0

    .line 229
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 230
    .line 231
    .line 232
    move-result p1

    .line 233
    if-eq p0, p1, :cond_11

    .line 234
    .line 235
    if-ge p0, p1, :cond_10

    .line 236
    .line 237
    goto :goto_6

    .line 238
    :cond_10
    move v0, v2

    .line 239
    goto :goto_6

    .line 240
    :cond_11
    move v0, v1

    .line 241
    :goto_6
    return v0

    .line 242
    :pswitch_5
    check-cast p2, Le2;

    .line 243
    .line 244
    iget-wide v2, p2, Le2;->h:J

    .line 245
    .line 246
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 247
    .line 248
    .line 249
    move-result-object p0

    .line 250
    check-cast p1, Le2;

    .line 251
    .line 252
    iget-wide p1, p1, Le2;->h:J

    .line 253
    .line 254
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 255
    .line 256
    .line 257
    move-result-object p1

    .line 258
    if-ne p0, p1, :cond_12

    .line 259
    .line 260
    goto :goto_7

    .line 261
    :cond_12
    invoke-virtual {p0, p1}, Ljava/lang/Long;->compareTo(Ljava/lang/Object;)I

    .line 262
    .line 263
    .line 264
    move-result v1

    .line 265
    :goto_7
    return v1

    .line 266
    nop

    .line 267
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
