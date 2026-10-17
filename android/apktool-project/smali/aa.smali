.class public final Laa;
.super Ljava/util/AbstractList;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/util/List;


# static fields
.field public static final m:[Ljava/lang/Object;


# instance fields
.field public j:I

.field public k:[Ljava/lang/Object;

.field public l:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v0, v0, [Ljava/lang/Object;

    .line 3
    .line 4
    sput-object v0, Laa;->m:[Ljava/lang/Object;

    .line 5
    .line 6
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/util/AbstractList;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Laa;->m:[Ljava/lang/Object;

    .line 5
    .line 6
    iput-object v0, p0, Laa;->k:[Ljava/lang/Object;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final add(ILjava/lang/Object;)V
    .locals 7

    .line 1
    iget v0, p0, Laa;->l:I

    .line 2
    .line 3
    if-ltz p1, :cond_7

    .line 4
    .line 5
    if-gt p1, v0, :cond_7

    .line 6
    .line 7
    if-ne p1, v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, p2}, Laa;->addLast(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    if-nez p1, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0, p2}, Laa;->addFirst(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_1
    invoke-virtual {p0}, Laa;->j()V

    .line 20
    .line 21
    .line 22
    iget v0, p0, Laa;->l:I

    .line 23
    .line 24
    const/4 v1, 0x1

    .line 25
    add-int/2addr v0, v1

    .line 26
    invoke-virtual {p0, v0}, Laa;->c(I)V

    .line 27
    .line 28
    .line 29
    iget v0, p0, Laa;->j:I

    .line 30
    .line 31
    add-int/2addr v0, p1

    .line 32
    invoke-virtual {p0, v0}, Laa;->h(I)I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    iget v2, p0, Laa;->l:I

    .line 37
    .line 38
    add-int/lit8 v3, v2, 0x1

    .line 39
    .line 40
    shr-int/2addr v3, v1

    .line 41
    const/4 v4, 0x0

    .line 42
    if-ge p1, v3, :cond_5

    .line 43
    .line 44
    if-nez v0, :cond_2

    .line 45
    .line 46
    iget-object p1, p0, Laa;->k:[Ljava/lang/Object;

    .line 47
    .line 48
    array-length p1, p1

    .line 49
    sub-int/2addr p1, v1

    .line 50
    goto :goto_0

    .line 51
    :cond_2
    add-int/lit8 p1, v0, -0x1

    .line 52
    .line 53
    :goto_0
    iget v0, p0, Laa;->j:I

    .line 54
    .line 55
    if-nez v0, :cond_3

    .line 56
    .line 57
    iget-object v2, p0, Laa;->k:[Ljava/lang/Object;

    .line 58
    .line 59
    array-length v2, v2

    .line 60
    sub-int/2addr v2, v1

    .line 61
    goto :goto_1

    .line 62
    :cond_3
    add-int/lit8 v2, v0, -0x1

    .line 63
    .line 64
    :goto_1
    iget-object v3, p0, Laa;->k:[Ljava/lang/Object;

    .line 65
    .line 66
    if-lt p1, v0, :cond_4

    .line 67
    .line 68
    aget-object v4, v3, v0

    .line 69
    .line 70
    aput-object v4, v3, v2

    .line 71
    .line 72
    add-int/lit8 v4, v0, 0x1

    .line 73
    .line 74
    add-int/lit8 v5, p1, 0x1

    .line 75
    .line 76
    invoke-static {v0, v4, v5, v3, v3}, Lia;->N(III[Ljava/lang/Object;[Ljava/lang/Object;)V

    .line 77
    .line 78
    .line 79
    goto :goto_2

    .line 80
    :cond_4
    add-int/lit8 v5, v0, -0x1

    .line 81
    .line 82
    array-length v6, v3

    .line 83
    invoke-static {v5, v0, v6, v3, v3}, Lia;->N(III[Ljava/lang/Object;[Ljava/lang/Object;)V

    .line 84
    .line 85
    .line 86
    iget-object v0, p0, Laa;->k:[Ljava/lang/Object;

    .line 87
    .line 88
    array-length v3, v0

    .line 89
    sub-int/2addr v3, v1

    .line 90
    aget-object v5, v0, v4

    .line 91
    .line 92
    aput-object v5, v0, v3

    .line 93
    .line 94
    add-int/lit8 v3, p1, 0x1

    .line 95
    .line 96
    invoke-static {v4, v1, v3, v0, v0}, Lia;->N(III[Ljava/lang/Object;[Ljava/lang/Object;)V

    .line 97
    .line 98
    .line 99
    :goto_2
    iget-object v0, p0, Laa;->k:[Ljava/lang/Object;

    .line 100
    .line 101
    aput-object p2, v0, p1

    .line 102
    .line 103
    iput v2, p0, Laa;->j:I

    .line 104
    .line 105
    goto :goto_4

    .line 106
    :cond_5
    iget p1, p0, Laa;->j:I

    .line 107
    .line 108
    add-int/2addr p1, v2

    .line 109
    invoke-virtual {p0, p1}, Laa;->h(I)I

    .line 110
    .line 111
    .line 112
    move-result p1

    .line 113
    iget-object v2, p0, Laa;->k:[Ljava/lang/Object;

    .line 114
    .line 115
    if-ge v0, p1, :cond_6

    .line 116
    .line 117
    add-int/lit8 v3, v0, 0x1

    .line 118
    .line 119
    invoke-static {v3, v0, p1, v2, v2}, Lia;->N(III[Ljava/lang/Object;[Ljava/lang/Object;)V

    .line 120
    .line 121
    .line 122
    goto :goto_3

    .line 123
    :cond_6
    invoke-static {v1, v4, p1, v2, v2}, Lia;->N(III[Ljava/lang/Object;[Ljava/lang/Object;)V

    .line 124
    .line 125
    .line 126
    iget-object p1, p0, Laa;->k:[Ljava/lang/Object;

    .line 127
    .line 128
    array-length v2, p1

    .line 129
    sub-int/2addr v2, v1

    .line 130
    aget-object v2, p1, v2

    .line 131
    .line 132
    aput-object v2, p1, v4

    .line 133
    .line 134
    add-int/lit8 v2, v0, 0x1

    .line 135
    .line 136
    array-length v3, p1

    .line 137
    sub-int/2addr v3, v1

    .line 138
    invoke-static {v2, v0, v3, p1, p1}, Lia;->N(III[Ljava/lang/Object;[Ljava/lang/Object;)V

    .line 139
    .line 140
    .line 141
    :goto_3
    iget-object p1, p0, Laa;->k:[Ljava/lang/Object;

    .line 142
    .line 143
    aput-object p2, p1, v0

    .line 144
    .line 145
    :goto_4
    iget p1, p0, Laa;->l:I

    .line 146
    .line 147
    add-int/2addr p1, v1

    .line 148
    iput p1, p0, Laa;->l:I

    .line 149
    .line 150
    return-void

    .line 151
    :cond_7
    const-string p0, "index: "

    .line 152
    .line 153
    const-string p2, ", size: "

    .line 154
    .line 155
    invoke-static {p1, v0, p0, p2}, Loq;->e(IILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object p0

    .line 159
    invoke-static {p0}, Lz0;->i(Ljava/lang/String;)V

    .line 160
    .line 161
    .line 162
    return-void
.end method

.method public final add(Ljava/lang/Object;)Z
    .locals 0

    .line 163
    invoke-virtual {p0, p1}, Laa;->addLast(Ljava/lang/Object;)V

    const/4 p0, 0x1

    return p0
.end method

.method public final addAll(ILjava/util/Collection;)Z
    .locals 8

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget v0, p0, Laa;->l:I

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    if-ltz p1, :cond_b

    .line 8
    .line 9
    if-gt p1, v0, :cond_b

    .line 10
    .line 11
    invoke-interface {p2}, Ljava/util/Collection;->isEmpty()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    return v1

    .line 18
    :cond_0
    iget v0, p0, Laa;->l:I

    .line 19
    .line 20
    if-ne p1, v0, :cond_1

    .line 21
    .line 22
    invoke-virtual {p0, p2}, Laa;->addAll(Ljava/util/Collection;)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    return p0

    .line 27
    :cond_1
    invoke-virtual {p0}, Laa;->j()V

    .line 28
    .line 29
    .line 30
    iget v0, p0, Laa;->l:I

    .line 31
    .line 32
    invoke-interface {p2}, Ljava/util/Collection;->size()I

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    add-int/2addr v2, v0

    .line 37
    invoke-virtual {p0, v2}, Laa;->c(I)V

    .line 38
    .line 39
    .line 40
    iget v0, p0, Laa;->j:I

    .line 41
    .line 42
    iget v2, p0, Laa;->l:I

    .line 43
    .line 44
    add-int/2addr v0, v2

    .line 45
    invoke-virtual {p0, v0}, Laa;->h(I)I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    iget v2, p0, Laa;->j:I

    .line 50
    .line 51
    add-int/2addr v2, p1

    .line 52
    invoke-virtual {p0, v2}, Laa;->h(I)I

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    invoke-interface {p2}, Ljava/util/Collection;->size()I

    .line 57
    .line 58
    .line 59
    move-result v3

    .line 60
    iget v4, p0, Laa;->l:I

    .line 61
    .line 62
    const/4 v5, 0x1

    .line 63
    add-int/2addr v4, v5

    .line 64
    shr-int/2addr v4, v5

    .line 65
    if-ge p1, v4, :cond_6

    .line 66
    .line 67
    iget p1, p0, Laa;->j:I

    .line 68
    .line 69
    sub-int v0, p1, v3

    .line 70
    .line 71
    iget-object v4, p0, Laa;->k:[Ljava/lang/Object;

    .line 72
    .line 73
    if-lt v2, p1, :cond_4

    .line 74
    .line 75
    if-ltz v0, :cond_2

    .line 76
    .line 77
    invoke-static {v0, p1, v2, v4, v4}, Lia;->N(III[Ljava/lang/Object;[Ljava/lang/Object;)V

    .line 78
    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_2
    array-length v6, v4

    .line 82
    add-int/2addr v0, v6

    .line 83
    sub-int v6, v2, p1

    .line 84
    .line 85
    array-length v7, v4

    .line 86
    sub-int/2addr v7, v0

    .line 87
    if-lt v7, v6, :cond_3

    .line 88
    .line 89
    invoke-static {v0, p1, v2, v4, v4}, Lia;->N(III[Ljava/lang/Object;[Ljava/lang/Object;)V

    .line 90
    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_3
    add-int v6, p1, v7

    .line 94
    .line 95
    invoke-static {v0, p1, v6, v4, v4}, Lia;->N(III[Ljava/lang/Object;[Ljava/lang/Object;)V

    .line 96
    .line 97
    .line 98
    iget-object p1, p0, Laa;->k:[Ljava/lang/Object;

    .line 99
    .line 100
    iget v4, p0, Laa;->j:I

    .line 101
    .line 102
    add-int/2addr v4, v7

    .line 103
    invoke-static {v1, v4, v2, p1, p1}, Lia;->N(III[Ljava/lang/Object;[Ljava/lang/Object;)V

    .line 104
    .line 105
    .line 106
    goto :goto_0

    .line 107
    :cond_4
    array-length v6, v4

    .line 108
    invoke-static {v0, p1, v6, v4, v4}, Lia;->N(III[Ljava/lang/Object;[Ljava/lang/Object;)V

    .line 109
    .line 110
    .line 111
    iget-object p1, p0, Laa;->k:[Ljava/lang/Object;

    .line 112
    .line 113
    if-lt v3, v2, :cond_5

    .line 114
    .line 115
    array-length v4, p1

    .line 116
    sub-int/2addr v4, v3

    .line 117
    invoke-static {v4, v1, v2, p1, p1}, Lia;->N(III[Ljava/lang/Object;[Ljava/lang/Object;)V

    .line 118
    .line 119
    .line 120
    goto :goto_0

    .line 121
    :cond_5
    array-length v4, p1

    .line 122
    sub-int/2addr v4, v3

    .line 123
    invoke-static {v4, v1, v3, p1, p1}, Lia;->N(III[Ljava/lang/Object;[Ljava/lang/Object;)V

    .line 124
    .line 125
    .line 126
    iget-object p1, p0, Laa;->k:[Ljava/lang/Object;

    .line 127
    .line 128
    invoke-static {v1, v3, v2, p1, p1}, Lia;->N(III[Ljava/lang/Object;[Ljava/lang/Object;)V

    .line 129
    .line 130
    .line 131
    :goto_0
    iput v0, p0, Laa;->j:I

    .line 132
    .line 133
    sub-int/2addr v2, v3

    .line 134
    invoke-virtual {p0, v2}, Laa;->e(I)I

    .line 135
    .line 136
    .line 137
    move-result p1

    .line 138
    invoke-virtual {p0, p1, p2}, Laa;->b(ILjava/util/Collection;)V

    .line 139
    .line 140
    .line 141
    return v5

    .line 142
    :cond_6
    add-int p1, v2, v3

    .line 143
    .line 144
    iget-object v4, p0, Laa;->k:[Ljava/lang/Object;

    .line 145
    .line 146
    if-ge v2, v0, :cond_9

    .line 147
    .line 148
    add-int/2addr v3, v0

    .line 149
    array-length v6, v4

    .line 150
    if-gt v3, v6, :cond_7

    .line 151
    .line 152
    invoke-static {p1, v2, v0, v4, v4}, Lia;->N(III[Ljava/lang/Object;[Ljava/lang/Object;)V

    .line 153
    .line 154
    .line 155
    goto :goto_1

    .line 156
    :cond_7
    array-length v6, v4

    .line 157
    if-lt p1, v6, :cond_8

    .line 158
    .line 159
    array-length v1, v4

    .line 160
    sub-int/2addr p1, v1

    .line 161
    invoke-static {p1, v2, v0, v4, v4}, Lia;->N(III[Ljava/lang/Object;[Ljava/lang/Object;)V

    .line 162
    .line 163
    .line 164
    goto :goto_1

    .line 165
    :cond_8
    array-length v6, v4

    .line 166
    sub-int/2addr v3, v6

    .line 167
    sub-int v3, v0, v3

    .line 168
    .line 169
    invoke-static {v1, v3, v0, v4, v4}, Lia;->N(III[Ljava/lang/Object;[Ljava/lang/Object;)V

    .line 170
    .line 171
    .line 172
    iget-object v0, p0, Laa;->k:[Ljava/lang/Object;

    .line 173
    .line 174
    invoke-static {p1, v2, v3, v0, v0}, Lia;->N(III[Ljava/lang/Object;[Ljava/lang/Object;)V

    .line 175
    .line 176
    .line 177
    goto :goto_1

    .line 178
    :cond_9
    invoke-static {v3, v1, v0, v4, v4}, Lia;->N(III[Ljava/lang/Object;[Ljava/lang/Object;)V

    .line 179
    .line 180
    .line 181
    iget-object v0, p0, Laa;->k:[Ljava/lang/Object;

    .line 182
    .line 183
    array-length v4, v0

    .line 184
    if-lt p1, v4, :cond_a

    .line 185
    .line 186
    array-length v1, v0

    .line 187
    sub-int/2addr p1, v1

    .line 188
    array-length v1, v0

    .line 189
    invoke-static {p1, v2, v1, v0, v0}, Lia;->N(III[Ljava/lang/Object;[Ljava/lang/Object;)V

    .line 190
    .line 191
    .line 192
    goto :goto_1

    .line 193
    :cond_a
    array-length v4, v0

    .line 194
    sub-int/2addr v4, v3

    .line 195
    array-length v6, v0

    .line 196
    invoke-static {v1, v4, v6, v0, v0}, Lia;->N(III[Ljava/lang/Object;[Ljava/lang/Object;)V

    .line 197
    .line 198
    .line 199
    iget-object v0, p0, Laa;->k:[Ljava/lang/Object;

    .line 200
    .line 201
    array-length v1, v0

    .line 202
    sub-int/2addr v1, v3

    .line 203
    invoke-static {p1, v2, v1, v0, v0}, Lia;->N(III[Ljava/lang/Object;[Ljava/lang/Object;)V

    .line 204
    .line 205
    .line 206
    :goto_1
    invoke-virtual {p0, v2, p2}, Laa;->b(ILjava/util/Collection;)V

    .line 207
    .line 208
    .line 209
    return v5

    .line 210
    :cond_b
    const-string p0, "index: "

    .line 211
    .line 212
    const-string p2, ", size: "

    .line 213
    .line 214
    invoke-static {p1, v0, p0, p2}, Loq;->e(IILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 215
    .line 216
    .line 217
    move-result-object p0

    .line 218
    invoke-static {p0}, Lz0;->i(Ljava/lang/String;)V

    .line 219
    .line 220
    .line 221
    return v1
.end method

.method public final addAll(Ljava/util/Collection;)Z
    .locals 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 222
    invoke-interface {p1}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p0, 0x0

    return p0

    .line 223
    :cond_0
    invoke-virtual {p0}, Laa;->j()V

    .line 224
    iget v0, p0, Laa;->l:I

    .line 225
    invoke-interface {p1}, Ljava/util/Collection;->size()I

    move-result v1

    add-int/2addr v1, v0

    invoke-virtual {p0, v1}, Laa;->c(I)V

    .line 226
    iget v0, p0, Laa;->j:I

    .line 227
    iget v1, p0, Laa;->l:I

    add-int/2addr v0, v1

    .line 228
    invoke-virtual {p0, v0}, Laa;->h(I)I

    move-result v0

    invoke-virtual {p0, v0, p1}, Laa;->b(ILjava/util/Collection;)V

    const/4 p0, 0x1

    return p0
.end method

.method public final addFirst(Ljava/lang/Object;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Laa;->j()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Laa;->l:I

    .line 5
    .line 6
    add-int/lit8 v0, v0, 0x1

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Laa;->c(I)V

    .line 9
    .line 10
    .line 11
    iget v0, p0, Laa;->j:I

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Laa;->k:[Ljava/lang/Object;

    .line 16
    .line 17
    array-length v0, v0

    .line 18
    :cond_0
    add-int/lit8 v0, v0, -0x1

    .line 19
    .line 20
    iput v0, p0, Laa;->j:I

    .line 21
    .line 22
    iget-object v1, p0, Laa;->k:[Ljava/lang/Object;

    .line 23
    .line 24
    aput-object p1, v1, v0

    .line 25
    .line 26
    iget p1, p0, Laa;->l:I

    .line 27
    .line 28
    add-int/lit8 p1, p1, 0x1

    .line 29
    .line 30
    iput p1, p0, Laa;->l:I

    .line 31
    .line 32
    return-void
.end method

.method public final addLast(Ljava/lang/Object;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Laa;->j()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Laa;->l:I

    .line 5
    .line 6
    add-int/lit8 v0, v0, 0x1

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Laa;->c(I)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Laa;->k:[Ljava/lang/Object;

    .line 12
    .line 13
    iget v1, p0, Laa;->j:I

    .line 14
    .line 15
    iget v2, p0, Laa;->l:I

    .line 16
    .line 17
    add-int/2addr v1, v2

    .line 18
    invoke-virtual {p0, v1}, Laa;->h(I)I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    aput-object p1, v0, v1

    .line 23
    .line 24
    iget p1, p0, Laa;->l:I

    .line 25
    .line 26
    add-int/lit8 p1, p1, 0x1

    .line 27
    .line 28
    iput p1, p0, Laa;->l:I

    .line 29
    .line 30
    return-void
.end method

.method public final b(ILjava/util/Collection;)V
    .locals 4

    .line 1
    invoke-interface {p2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Laa;->k:[Ljava/lang/Object;

    .line 6
    .line 7
    array-length v1, v1

    .line 8
    :goto_0
    if-ge p1, v1, :cond_0

    .line 9
    .line 10
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    if-eqz v2, :cond_0

    .line 15
    .line 16
    iget-object v2, p0, Laa;->k:[Ljava/lang/Object;

    .line 17
    .line 18
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    aput-object v3, v2, p1

    .line 23
    .line 24
    add-int/lit8 p1, p1, 0x1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    iget p1, p0, Laa;->j:I

    .line 28
    .line 29
    const/4 v1, 0x0

    .line 30
    :goto_1
    if-ge v1, p1, :cond_1

    .line 31
    .line 32
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    if-eqz v2, :cond_1

    .line 37
    .line 38
    iget-object v2, p0, Laa;->k:[Ljava/lang/Object;

    .line 39
    .line 40
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    aput-object v3, v2, v1

    .line 45
    .line 46
    add-int/lit8 v1, v1, 0x1

    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_1
    iget p1, p0, Laa;->l:I

    .line 50
    .line 51
    invoke-interface {p2}, Ljava/util/Collection;->size()I

    .line 52
    .line 53
    .line 54
    move-result p2

    .line 55
    add-int/2addr p2, p1

    .line 56
    iput p2, p0, Laa;->l:I

    .line 57
    .line 58
    return-void
.end method

.method public final c(I)V
    .locals 4

    .line 1
    if-ltz p1, :cond_6

    .line 2
    .line 3
    iget-object v0, p0, Laa;->k:[Ljava/lang/Object;

    .line 4
    .line 5
    array-length v1, v0

    .line 6
    if-gt p1, v1, :cond_0

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    sget-object v1, Laa;->m:[Ljava/lang/Object;

    .line 10
    .line 11
    if-ne v0, v1, :cond_2

    .line 12
    .line 13
    const/16 v0, 0xa

    .line 14
    .line 15
    if-ge p1, v0, :cond_1

    .line 16
    .line 17
    move p1, v0

    .line 18
    :cond_1
    new-array p1, p1, [Ljava/lang/Object;

    .line 19
    .line 20
    iput-object p1, p0, Laa;->k:[Ljava/lang/Object;

    .line 21
    .line 22
    return-void

    .line 23
    :cond_2
    array-length v1, v0

    .line 24
    shr-int/lit8 v2, v1, 0x1

    .line 25
    .line 26
    add-int/2addr v1, v2

    .line 27
    sub-int v2, v1, p1

    .line 28
    .line 29
    if-gez v2, :cond_3

    .line 30
    .line 31
    move v1, p1

    .line 32
    :cond_3
    const v2, 0x7ffffff7

    .line 33
    .line 34
    .line 35
    sub-int v3, v1, v2

    .line 36
    .line 37
    if-lez v3, :cond_5

    .line 38
    .line 39
    if-le p1, v2, :cond_4

    .line 40
    .line 41
    const v1, 0x7fffffff

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_4
    move v1, v2

    .line 46
    :cond_5
    :goto_0
    new-array p1, v1, [Ljava/lang/Object;

    .line 47
    .line 48
    iget v1, p0, Laa;->j:I

    .line 49
    .line 50
    array-length v2, v0

    .line 51
    const/4 v3, 0x0

    .line 52
    invoke-static {v3, v1, v2, v0, p1}, Lia;->N(III[Ljava/lang/Object;[Ljava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Laa;->k:[Ljava/lang/Object;

    .line 56
    .line 57
    array-length v1, v0

    .line 58
    iget v2, p0, Laa;->j:I

    .line 59
    .line 60
    sub-int/2addr v1, v2

    .line 61
    invoke-static {v1, v3, v2, v0, p1}, Lia;->N(III[Ljava/lang/Object;[Ljava/lang/Object;)V

    .line 62
    .line 63
    .line 64
    iput v3, p0, Laa;->j:I

    .line 65
    .line 66
    iput-object p1, p0, Laa;->k:[Ljava/lang/Object;

    .line 67
    .line 68
    return-void

    .line 69
    :cond_6
    const-string p0, "Deque is too big."

    .line 70
    .line 71
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public final clear()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Laa;->isEmpty()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Laa;->j()V

    .line 8
    .line 9
    .line 10
    iget v0, p0, Laa;->j:I

    .line 11
    .line 12
    iget v1, p0, Laa;->l:I

    .line 13
    .line 14
    add-int/2addr v0, v1

    .line 15
    invoke-virtual {p0, v0}, Laa;->h(I)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iget v1, p0, Laa;->j:I

    .line 20
    .line 21
    invoke-virtual {p0, v1, v0}, Laa;->f(II)V

    .line 22
    .line 23
    .line 24
    :cond_0
    const/4 v0, 0x0

    .line 25
    iput v0, p0, Laa;->j:I

    .line 26
    .line 27
    iput v0, p0, Laa;->l:I

    .line 28
    .line 29
    return-void
.end method

.method public final contains(Ljava/lang/Object;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Laa;->indexOf(Ljava/lang/Object;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 p1, -0x1

    .line 6
    if-eq p0, p1, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public final d(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Laa;->k:[Ljava/lang/Object;

    .line 2
    .line 3
    array-length p0, p0

    .line 4
    add-int/lit8 p0, p0, -0x1

    .line 5
    .line 6
    if-ne p1, p0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    return p0

    .line 10
    :cond_0
    add-int/lit8 p1, p1, 0x1

    .line 11
    .line 12
    return p1
.end method

.method public final e(I)I
    .locals 0

    .line 1
    if-gez p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Laa;->k:[Ljava/lang/Object;

    .line 4
    .line 5
    array-length p0, p0

    .line 6
    add-int/2addr p1, p0

    .line 7
    :cond_0
    return p1
.end method

.method public final f(II)V
    .locals 3

    .line 1
    iget-object v0, p0, Laa;->k:[Ljava/lang/Object;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-ge p1, p2, :cond_0

    .line 5
    .line 6
    invoke-static {v0, p1, p2, v1}, Ljava/util/Arrays;->fill([Ljava/lang/Object;IILjava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    array-length v2, v0

    .line 11
    invoke-static {v0, p1, v2, v1}, Ljava/util/Arrays;->fill([Ljava/lang/Object;IILjava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Laa;->k:[Ljava/lang/Object;

    .line 15
    .line 16
    const/4 p1, 0x0

    .line 17
    invoke-static {p0, p1, p2, v1}, Ljava/util/Arrays;->fill([Ljava/lang/Object;IILjava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final get(I)Ljava/lang/Object;
    .locals 2

    .line 1
    iget v0, p0, Laa;->l:I

    .line 2
    .line 3
    if-ltz p1, :cond_0

    .line 4
    .line 5
    if-ge p1, v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Laa;->k:[Ljava/lang/Object;

    .line 8
    .line 9
    iget v1, p0, Laa;->j:I

    .line 10
    .line 11
    add-int/2addr v1, p1

    .line 12
    invoke-virtual {p0, v1}, Laa;->h(I)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    aget-object p0, v0, p0

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_0
    const-string p0, "index: "

    .line 20
    .line 21
    const-string v1, ", size: "

    .line 22
    .line 23
    invoke-static {p1, v0, p0, v1}, Loq;->e(IILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-static {p0}, Lz0;->i(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    const/4 p0, 0x0

    .line 31
    return-object p0
.end method

.method public final h(I)I
    .locals 1

    .line 1
    iget-object p0, p0, Laa;->k:[Ljava/lang/Object;

    .line 2
    .line 3
    array-length v0, p0

    .line 4
    if-lt p1, v0, :cond_0

    .line 5
    .line 6
    array-length p0, p0

    .line 7
    sub-int/2addr p1, p0

    .line 8
    :cond_0
    return p1
.end method

.method public final indexOf(Ljava/lang/Object;)I
    .locals 4

    .line 1
    iget v0, p0, Laa;->j:I

    .line 2
    .line 3
    iget v1, p0, Laa;->l:I

    .line 4
    .line 5
    add-int/2addr v0, v1

    .line 6
    invoke-virtual {p0, v0}, Laa;->h(I)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    iget v1, p0, Laa;->j:I

    .line 11
    .line 12
    if-ge v1, v0, :cond_1

    .line 13
    .line 14
    :goto_0
    if-ge v1, v0, :cond_5

    .line 15
    .line 16
    iget-object v2, p0, Laa;->k:[Ljava/lang/Object;

    .line 17
    .line 18
    aget-object v2, v2, v1

    .line 19
    .line 20
    invoke-static {p1, v2}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    if-eqz v2, :cond_0

    .line 25
    .line 26
    iget p0, p0, Laa;->j:I

    .line 27
    .line 28
    :goto_1
    sub-int/2addr v1, p0

    .line 29
    return v1

    .line 30
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    if-lt v1, v0, :cond_5

    .line 34
    .line 35
    iget-object v2, p0, Laa;->k:[Ljava/lang/Object;

    .line 36
    .line 37
    array-length v2, v2

    .line 38
    :goto_2
    if-ge v1, v2, :cond_3

    .line 39
    .line 40
    iget-object v3, p0, Laa;->k:[Ljava/lang/Object;

    .line 41
    .line 42
    aget-object v3, v3, v1

    .line 43
    .line 44
    invoke-static {p1, v3}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result v3

    .line 48
    if-eqz v3, :cond_2

    .line 49
    .line 50
    iget p0, p0, Laa;->j:I

    .line 51
    .line 52
    goto :goto_1

    .line 53
    :cond_2
    add-int/lit8 v1, v1, 0x1

    .line 54
    .line 55
    goto :goto_2

    .line 56
    :cond_3
    const/4 v1, 0x0

    .line 57
    :goto_3
    if-ge v1, v0, :cond_5

    .line 58
    .line 59
    iget-object v2, p0, Laa;->k:[Ljava/lang/Object;

    .line 60
    .line 61
    aget-object v2, v2, v1

    .line 62
    .line 63
    invoke-static {p1, v2}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    if-eqz v2, :cond_4

    .line 68
    .line 69
    iget-object p1, p0, Laa;->k:[Ljava/lang/Object;

    .line 70
    .line 71
    array-length p1, p1

    .line 72
    add-int/2addr v1, p1

    .line 73
    iget p0, p0, Laa;->j:I

    .line 74
    .line 75
    goto :goto_1

    .line 76
    :cond_4
    add-int/lit8 v1, v1, 0x1

    .line 77
    .line 78
    goto :goto_3

    .line 79
    :cond_5
    const/4 p0, -0x1

    .line 80
    return p0
.end method

.method public final isEmpty()Z
    .locals 0

    .line 1
    iget p0, p0, Laa;->l:I

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public final j()V
    .locals 1

    .line 1
    iget v0, p0, Ljava/util/AbstractList;->modCount:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    iput v0, p0, Ljava/util/AbstractList;->modCount:I

    .line 6
    .line 7
    return-void
.end method

.method public final k(I)Ljava/lang/Object;
    .locals 9

    .line 1
    iget v0, p0, Laa;->l:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-ltz p1, :cond_5

    .line 5
    .line 6
    if-ge p1, v0, :cond_5

    .line 7
    .line 8
    const/4 v2, 0x1

    .line 9
    sub-int/2addr v0, v2

    .line 10
    if-ne p1, v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Laa;->removeLast()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0

    .line 17
    :cond_0
    if-nez p1, :cond_1

    .line 18
    .line 19
    invoke-virtual {p0}, Laa;->removeFirst()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0

    .line 24
    :cond_1
    invoke-virtual {p0}, Laa;->j()V

    .line 25
    .line 26
    .line 27
    iget v0, p0, Laa;->j:I

    .line 28
    .line 29
    add-int/2addr v0, p1

    .line 30
    invoke-virtual {p0, v0}, Laa;->h(I)I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    iget-object v3, p0, Laa;->k:[Ljava/lang/Object;

    .line 35
    .line 36
    aget-object v4, v3, v0

    .line 37
    .line 38
    iget v5, p0, Laa;->l:I

    .line 39
    .line 40
    shr-int/lit8 v6, v5, 0x1

    .line 41
    .line 42
    iget v7, p0, Laa;->j:I

    .line 43
    .line 44
    const/4 v8, 0x0

    .line 45
    if-ge p1, v6, :cond_3

    .line 46
    .line 47
    if-lt v0, v7, :cond_2

    .line 48
    .line 49
    add-int/lit8 p1, v7, 0x1

    .line 50
    .line 51
    invoke-static {p1, v7, v0, v3, v3}, Lia;->N(III[Ljava/lang/Object;[Ljava/lang/Object;)V

    .line 52
    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_2
    invoke-static {v2, v8, v0, v3, v3}, Lia;->N(III[Ljava/lang/Object;[Ljava/lang/Object;)V

    .line 56
    .line 57
    .line 58
    iget-object p1, p0, Laa;->k:[Ljava/lang/Object;

    .line 59
    .line 60
    array-length v0, p1

    .line 61
    sub-int/2addr v0, v2

    .line 62
    aget-object v0, p1, v0

    .line 63
    .line 64
    aput-object v0, p1, v8

    .line 65
    .line 66
    iget v0, p0, Laa;->j:I

    .line 67
    .line 68
    add-int/lit8 v3, v0, 0x1

    .line 69
    .line 70
    array-length v5, p1

    .line 71
    sub-int/2addr v5, v2

    .line 72
    invoke-static {v3, v0, v5, p1, p1}, Lia;->N(III[Ljava/lang/Object;[Ljava/lang/Object;)V

    .line 73
    .line 74
    .line 75
    :goto_0
    iget-object p1, p0, Laa;->k:[Ljava/lang/Object;

    .line 76
    .line 77
    iget v0, p0, Laa;->j:I

    .line 78
    .line 79
    aput-object v1, p1, v0

    .line 80
    .line 81
    invoke-virtual {p0, v0}, Laa;->d(I)I

    .line 82
    .line 83
    .line 84
    move-result p1

    .line 85
    iput p1, p0, Laa;->j:I

    .line 86
    .line 87
    goto :goto_2

    .line 88
    :cond_3
    sub-int/2addr v5, v2

    .line 89
    add-int/2addr v5, v7

    .line 90
    invoke-virtual {p0, v5}, Laa;->h(I)I

    .line 91
    .line 92
    .line 93
    move-result p1

    .line 94
    iget-object v3, p0, Laa;->k:[Ljava/lang/Object;

    .line 95
    .line 96
    if-gt v0, p1, :cond_4

    .line 97
    .line 98
    add-int/lit8 v5, v0, 0x1

    .line 99
    .line 100
    add-int/lit8 v6, p1, 0x1

    .line 101
    .line 102
    invoke-static {v0, v5, v6, v3, v3}, Lia;->N(III[Ljava/lang/Object;[Ljava/lang/Object;)V

    .line 103
    .line 104
    .line 105
    goto :goto_1

    .line 106
    :cond_4
    add-int/lit8 v5, v0, 0x1

    .line 107
    .line 108
    array-length v6, v3

    .line 109
    invoke-static {v0, v5, v6, v3, v3}, Lia;->N(III[Ljava/lang/Object;[Ljava/lang/Object;)V

    .line 110
    .line 111
    .line 112
    iget-object v0, p0, Laa;->k:[Ljava/lang/Object;

    .line 113
    .line 114
    array-length v3, v0

    .line 115
    sub-int/2addr v3, v2

    .line 116
    aget-object v5, v0, v8

    .line 117
    .line 118
    aput-object v5, v0, v3

    .line 119
    .line 120
    add-int/lit8 v3, p1, 0x1

    .line 121
    .line 122
    invoke-static {v8, v2, v3, v0, v0}, Lia;->N(III[Ljava/lang/Object;[Ljava/lang/Object;)V

    .line 123
    .line 124
    .line 125
    :goto_1
    iget-object v0, p0, Laa;->k:[Ljava/lang/Object;

    .line 126
    .line 127
    aput-object v1, v0, p1

    .line 128
    .line 129
    :goto_2
    iget p1, p0, Laa;->l:I

    .line 130
    .line 131
    sub-int/2addr p1, v2

    .line 132
    iput p1, p0, Laa;->l:I

    .line 133
    .line 134
    return-object v4

    .line 135
    :cond_5
    const-string p0, "index: "

    .line 136
    .line 137
    const-string v2, ", size: "

    .line 138
    .line 139
    invoke-static {p1, v0, p0, v2}, Loq;->e(IILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object p0

    .line 143
    invoke-static {p0}, Lz0;->i(Ljava/lang/String;)V

    .line 144
    .line 145
    .line 146
    return-object v1
.end method

.method public final lastIndexOf(Ljava/lang/Object;)I
    .locals 4

    .line 1
    iget v0, p0, Laa;->j:I

    .line 2
    .line 3
    iget v1, p0, Laa;->l:I

    .line 4
    .line 5
    add-int/2addr v0, v1

    .line 6
    invoke-virtual {p0, v0}, Laa;->h(I)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    iget v1, p0, Laa;->j:I

    .line 11
    .line 12
    const/4 v2, -0x1

    .line 13
    if-ge v1, v0, :cond_1

    .line 14
    .line 15
    add-int/lit8 v0, v0, -0x1

    .line 16
    .line 17
    if-gt v1, v0, :cond_5

    .line 18
    .line 19
    :goto_0
    iget-object v3, p0, Laa;->k:[Ljava/lang/Object;

    .line 20
    .line 21
    aget-object v3, v3, v0

    .line 22
    .line 23
    invoke-static {p1, v3}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    if-eqz v3, :cond_0

    .line 28
    .line 29
    iget p0, p0, Laa;->j:I

    .line 30
    .line 31
    :goto_1
    sub-int/2addr v0, p0

    .line 32
    return v0

    .line 33
    :cond_0
    if-eq v0, v1, :cond_5

    .line 34
    .line 35
    add-int/lit8 v0, v0, -0x1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    if-le v1, v0, :cond_5

    .line 39
    .line 40
    add-int/lit8 v0, v0, -0x1

    .line 41
    .line 42
    :goto_2
    iget-object v1, p0, Laa;->k:[Ljava/lang/Object;

    .line 43
    .line 44
    if-ge v2, v0, :cond_3

    .line 45
    .line 46
    aget-object v1, v1, v0

    .line 47
    .line 48
    invoke-static {p1, v1}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    if-eqz v1, :cond_2

    .line 53
    .line 54
    iget-object p1, p0, Laa;->k:[Ljava/lang/Object;

    .line 55
    .line 56
    array-length p1, p1

    .line 57
    add-int/2addr v0, p1

    .line 58
    iget p0, p0, Laa;->j:I

    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_2
    add-int/lit8 v0, v0, -0x1

    .line 62
    .line 63
    goto :goto_2

    .line 64
    :cond_3
    array-length v0, v1

    .line 65
    add-int/lit8 v0, v0, -0x1

    .line 66
    .line 67
    iget v1, p0, Laa;->j:I

    .line 68
    .line 69
    if-gt v1, v0, :cond_5

    .line 70
    .line 71
    :goto_3
    iget-object v3, p0, Laa;->k:[Ljava/lang/Object;

    .line 72
    .line 73
    aget-object v3, v3, v0

    .line 74
    .line 75
    invoke-static {p1, v3}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result v3

    .line 79
    if-eqz v3, :cond_4

    .line 80
    .line 81
    iget p0, p0, Laa;->j:I

    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_4
    if-eq v0, v1, :cond_5

    .line 85
    .line 86
    add-int/lit8 v0, v0, -0x1

    .line 87
    .line 88
    goto :goto_3

    .line 89
    :cond_5
    return v2
.end method

.method public final bridge remove(I)Ljava/lang/Object;
    .locals 0

    .line 15
    invoke-virtual {p0, p1}, Laa;->k(I)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final remove(Ljava/lang/Object;)Z
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Laa;->indexOf(Ljava/lang/Object;)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 v0, -0x1

    .line 6
    if-ne p1, v0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    return p0

    .line 10
    :cond_0
    invoke-virtual {p0, p1}, Laa;->k(I)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0
.end method

.method public final removeAll(Ljava/util/Collection;)Z
    .locals 11

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Laa;->isEmpty()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/4 v1, 0x0

    .line 9
    if-nez v0, :cond_8

    .line 10
    .line 11
    iget-object v0, p0, Laa;->k:[Ljava/lang/Object;

    .line 12
    .line 13
    array-length v0, v0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    goto/16 :goto_7

    .line 17
    .line 18
    :cond_0
    iget v0, p0, Laa;->j:I

    .line 19
    .line 20
    iget v2, p0, Laa;->l:I

    .line 21
    .line 22
    add-int/2addr v0, v2

    .line 23
    invoke-virtual {p0, v0}, Laa;->h(I)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    iget v2, p0, Laa;->j:I

    .line 28
    .line 29
    const/4 v3, 0x0

    .line 30
    const/4 v4, 0x1

    .line 31
    if-ge v2, v0, :cond_3

    .line 32
    .line 33
    move v5, v2

    .line 34
    :goto_0
    iget-object v6, p0, Laa;->k:[Ljava/lang/Object;

    .line 35
    .line 36
    if-ge v2, v0, :cond_2

    .line 37
    .line 38
    aget-object v6, v6, v2

    .line 39
    .line 40
    invoke-interface {p1, v6}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result v7

    .line 44
    if-nez v7, :cond_1

    .line 45
    .line 46
    iget-object v7, p0, Laa;->k:[Ljava/lang/Object;

    .line 47
    .line 48
    add-int/lit8 v8, v5, 0x1

    .line 49
    .line 50
    aput-object v6, v7, v5

    .line 51
    .line 52
    move v5, v8

    .line 53
    goto :goto_1

    .line 54
    :cond_1
    move v1, v4

    .line 55
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_2
    invoke-static {v6, v5, v0, v3}, Ljava/util/Arrays;->fill([Ljava/lang/Object;IILjava/lang/Object;)V

    .line 59
    .line 60
    .line 61
    goto :goto_6

    .line 62
    :cond_3
    iget-object v5, p0, Laa;->k:[Ljava/lang/Object;

    .line 63
    .line 64
    array-length v5, v5

    .line 65
    move v7, v1

    .line 66
    move v6, v2

    .line 67
    :goto_2
    if-ge v2, v5, :cond_5

    .line 68
    .line 69
    iget-object v8, p0, Laa;->k:[Ljava/lang/Object;

    .line 70
    .line 71
    aget-object v9, v8, v2

    .line 72
    .line 73
    aput-object v3, v8, v2

    .line 74
    .line 75
    invoke-interface {p1, v9}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result v8

    .line 79
    if-nez v8, :cond_4

    .line 80
    .line 81
    iget-object v8, p0, Laa;->k:[Ljava/lang/Object;

    .line 82
    .line 83
    add-int/lit8 v10, v6, 0x1

    .line 84
    .line 85
    aput-object v9, v8, v6

    .line 86
    .line 87
    move v6, v10

    .line 88
    goto :goto_3

    .line 89
    :cond_4
    move v7, v4

    .line 90
    :goto_3
    add-int/lit8 v2, v2, 0x1

    .line 91
    .line 92
    goto :goto_2

    .line 93
    :cond_5
    invoke-virtual {p0, v6}, Laa;->h(I)I

    .line 94
    .line 95
    .line 96
    move-result v2

    .line 97
    move v5, v2

    .line 98
    :goto_4
    if-ge v1, v0, :cond_7

    .line 99
    .line 100
    iget-object v2, p0, Laa;->k:[Ljava/lang/Object;

    .line 101
    .line 102
    aget-object v6, v2, v1

    .line 103
    .line 104
    aput-object v3, v2, v1

    .line 105
    .line 106
    invoke-interface {p1, v6}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    .line 107
    .line 108
    .line 109
    move-result v2

    .line 110
    if-nez v2, :cond_6

    .line 111
    .line 112
    iget-object v2, p0, Laa;->k:[Ljava/lang/Object;

    .line 113
    .line 114
    aput-object v6, v2, v5

    .line 115
    .line 116
    invoke-virtual {p0, v5}, Laa;->d(I)I

    .line 117
    .line 118
    .line 119
    move-result v5

    .line 120
    goto :goto_5

    .line 121
    :cond_6
    move v7, v4

    .line 122
    :goto_5
    add-int/lit8 v1, v1, 0x1

    .line 123
    .line 124
    goto :goto_4

    .line 125
    :cond_7
    move v1, v7

    .line 126
    :goto_6
    if-eqz v1, :cond_8

    .line 127
    .line 128
    invoke-virtual {p0}, Laa;->j()V

    .line 129
    .line 130
    .line 131
    iget p1, p0, Laa;->j:I

    .line 132
    .line 133
    sub-int/2addr v5, p1

    .line 134
    invoke-virtual {p0, v5}, Laa;->e(I)I

    .line 135
    .line 136
    .line 137
    move-result p1

    .line 138
    iput p1, p0, Laa;->l:I

    .line 139
    .line 140
    :cond_8
    :goto_7
    return v1
.end method

.method public final removeFirst()Ljava/lang/Object;
    .locals 4

    .line 1
    invoke-virtual {p0}, Laa;->isEmpty()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Laa;->j()V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Laa;->k:[Ljava/lang/Object;

    .line 11
    .line 12
    iget v1, p0, Laa;->j:I

    .line 13
    .line 14
    aget-object v2, v0, v1

    .line 15
    .line 16
    const/4 v3, 0x0

    .line 17
    aput-object v3, v0, v1

    .line 18
    .line 19
    invoke-virtual {p0, v1}, Laa;->d(I)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    iput v0, p0, Laa;->j:I

    .line 24
    .line 25
    iget v0, p0, Laa;->l:I

    .line 26
    .line 27
    add-int/lit8 v0, v0, -0x1

    .line 28
    .line 29
    iput v0, p0, Laa;->l:I

    .line 30
    .line 31
    return-object v2

    .line 32
    :cond_0
    new-instance p0, Ljava/util/NoSuchElementException;

    .line 33
    .line 34
    const-string v0, "ArrayDeque is empty."

    .line 35
    .line 36
    invoke-direct {p0, v0}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    throw p0
.end method

.method public final removeLast()Ljava/lang/Object;
    .locals 4

    .line 1
    invoke-virtual {p0}, Laa;->isEmpty()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Laa;->j()V

    .line 8
    .line 9
    .line 10
    iget v0, p0, Laa;->j:I

    .line 11
    .line 12
    iget v1, p0, Laa;->l:I

    .line 13
    .line 14
    add-int/lit8 v1, v1, -0x1

    .line 15
    .line 16
    add-int/2addr v1, v0

    .line 17
    invoke-virtual {p0, v1}, Laa;->h(I)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    iget-object v1, p0, Laa;->k:[Ljava/lang/Object;

    .line 22
    .line 23
    aget-object v2, v1, v0

    .line 24
    .line 25
    const/4 v3, 0x0

    .line 26
    aput-object v3, v1, v0

    .line 27
    .line 28
    iget v0, p0, Laa;->l:I

    .line 29
    .line 30
    add-int/lit8 v0, v0, -0x1

    .line 31
    .line 32
    iput v0, p0, Laa;->l:I

    .line 33
    .line 34
    return-object v2

    .line 35
    :cond_0
    new-instance p0, Ljava/util/NoSuchElementException;

    .line 36
    .line 37
    const-string v0, "ArrayDeque is empty."

    .line 38
    .line 39
    invoke-direct {p0, v0}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    throw p0
.end method

.method public final removeRange(II)V
    .locals 7

    .line 1
    iget v0, p0, Laa;->l:I

    .line 2
    .line 3
    invoke-static {p1, p2, v0}, Lbe2;->e(III)V

    .line 4
    .line 5
    .line 6
    sub-int v0, p2, p1

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget v1, p0, Laa;->l:I

    .line 12
    .line 13
    if-ne v0, v1, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0}, Laa;->clear()V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_1
    const/4 v1, 0x1

    .line 20
    if-ne v0, v1, :cond_2

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Laa;->k(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_2
    invoke-virtual {p0}, Laa;->j()V

    .line 27
    .line 28
    .line 29
    iget v2, p0, Laa;->l:I

    .line 30
    .line 31
    sub-int/2addr v2, p2

    .line 32
    iget v3, p0, Laa;->j:I

    .line 33
    .line 34
    iget v4, p0, Laa;->j:I

    .line 35
    .line 36
    if-ge p1, v2, :cond_4

    .line 37
    .line 38
    add-int/lit8 v2, p1, -0x1

    .line 39
    .line 40
    add-int/2addr v2, v3

    .line 41
    invoke-virtual {p0, v2}, Laa;->h(I)I

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    sub-int/2addr p2, v1

    .line 46
    add-int/2addr p2, v4

    .line 47
    invoke-virtual {p0, p2}, Laa;->h(I)I

    .line 48
    .line 49
    .line 50
    move-result p2

    .line 51
    :goto_0
    if-lez p1, :cond_3

    .line 52
    .line 53
    add-int/lit8 v1, v2, 0x1

    .line 54
    .line 55
    add-int/lit8 v3, p2, 0x1

    .line 56
    .line 57
    invoke-static {v1, v3}, Ljava/lang/Math;->min(II)I

    .line 58
    .line 59
    .line 60
    move-result v3

    .line 61
    invoke-static {p1, v3}, Ljava/lang/Math;->min(II)I

    .line 62
    .line 63
    .line 64
    move-result v3

    .line 65
    iget-object v4, p0, Laa;->k:[Ljava/lang/Object;

    .line 66
    .line 67
    sub-int/2addr p2, v3

    .line 68
    add-int/lit8 v5, p2, 0x1

    .line 69
    .line 70
    sub-int/2addr v2, v3

    .line 71
    add-int/lit8 v6, v2, 0x1

    .line 72
    .line 73
    invoke-static {v5, v6, v1, v4, v4}, Lia;->N(III[Ljava/lang/Object;[Ljava/lang/Object;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p0, v2}, Laa;->e(I)I

    .line 77
    .line 78
    .line 79
    move-result v2

    .line 80
    invoke-virtual {p0, p2}, Laa;->e(I)I

    .line 81
    .line 82
    .line 83
    move-result p2

    .line 84
    sub-int/2addr p1, v3

    .line 85
    goto :goto_0

    .line 86
    :cond_3
    iget p1, p0, Laa;->j:I

    .line 87
    .line 88
    add-int/2addr p1, v0

    .line 89
    invoke-virtual {p0, p1}, Laa;->h(I)I

    .line 90
    .line 91
    .line 92
    move-result p1

    .line 93
    iget p2, p0, Laa;->j:I

    .line 94
    .line 95
    invoke-virtual {p0, p2, p1}, Laa;->f(II)V

    .line 96
    .line 97
    .line 98
    iput p1, p0, Laa;->j:I

    .line 99
    .line 100
    goto :goto_2

    .line 101
    :cond_4
    add-int/2addr v3, p2

    .line 102
    invoke-virtual {p0, v3}, Laa;->h(I)I

    .line 103
    .line 104
    .line 105
    move-result v1

    .line 106
    add-int/2addr v4, p1

    .line 107
    invoke-virtual {p0, v4}, Laa;->h(I)I

    .line 108
    .line 109
    .line 110
    move-result p1

    .line 111
    iget v2, p0, Laa;->l:I

    .line 112
    .line 113
    :goto_1
    sub-int/2addr v2, p2

    .line 114
    if-lez v2, :cond_5

    .line 115
    .line 116
    iget-object p2, p0, Laa;->k:[Ljava/lang/Object;

    .line 117
    .line 118
    array-length v3, p2

    .line 119
    sub-int/2addr v3, v1

    .line 120
    array-length p2, p2

    .line 121
    sub-int/2addr p2, p1

    .line 122
    invoke-static {v3, p2}, Ljava/lang/Math;->min(II)I

    .line 123
    .line 124
    .line 125
    move-result p2

    .line 126
    invoke-static {v2, p2}, Ljava/lang/Math;->min(II)I

    .line 127
    .line 128
    .line 129
    move-result p2

    .line 130
    iget-object v3, p0, Laa;->k:[Ljava/lang/Object;

    .line 131
    .line 132
    add-int v4, v1, p2

    .line 133
    .line 134
    invoke-static {p1, v1, v4, v3, v3}, Lia;->N(III[Ljava/lang/Object;[Ljava/lang/Object;)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {p0, v4}, Laa;->h(I)I

    .line 138
    .line 139
    .line 140
    move-result v1

    .line 141
    add-int/2addr p1, p2

    .line 142
    invoke-virtual {p0, p1}, Laa;->h(I)I

    .line 143
    .line 144
    .line 145
    move-result p1

    .line 146
    goto :goto_1

    .line 147
    :cond_5
    iget p1, p0, Laa;->j:I

    .line 148
    .line 149
    iget p2, p0, Laa;->l:I

    .line 150
    .line 151
    add-int/2addr p1, p2

    .line 152
    invoke-virtual {p0, p1}, Laa;->h(I)I

    .line 153
    .line 154
    .line 155
    move-result p1

    .line 156
    sub-int p2, p1, v0

    .line 157
    .line 158
    invoke-virtual {p0, p2}, Laa;->e(I)I

    .line 159
    .line 160
    .line 161
    move-result p2

    .line 162
    invoke-virtual {p0, p2, p1}, Laa;->f(II)V

    .line 163
    .line 164
    .line 165
    :goto_2
    iget p1, p0, Laa;->l:I

    .line 166
    .line 167
    sub-int/2addr p1, v0

    .line 168
    iput p1, p0, Laa;->l:I

    .line 169
    .line 170
    return-void
.end method

.method public final retainAll(Ljava/util/Collection;)Z
    .locals 11

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Laa;->isEmpty()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/4 v1, 0x0

    .line 9
    if-nez v0, :cond_8

    .line 10
    .line 11
    iget-object v0, p0, Laa;->k:[Ljava/lang/Object;

    .line 12
    .line 13
    array-length v0, v0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    goto/16 :goto_7

    .line 17
    .line 18
    :cond_0
    iget v0, p0, Laa;->j:I

    .line 19
    .line 20
    iget v2, p0, Laa;->l:I

    .line 21
    .line 22
    add-int/2addr v0, v2

    .line 23
    invoke-virtual {p0, v0}, Laa;->h(I)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    iget v2, p0, Laa;->j:I

    .line 28
    .line 29
    const/4 v3, 0x0

    .line 30
    const/4 v4, 0x1

    .line 31
    if-ge v2, v0, :cond_3

    .line 32
    .line 33
    move v5, v2

    .line 34
    :goto_0
    iget-object v6, p0, Laa;->k:[Ljava/lang/Object;

    .line 35
    .line 36
    if-ge v2, v0, :cond_2

    .line 37
    .line 38
    aget-object v6, v6, v2

    .line 39
    .line 40
    invoke-interface {p1, v6}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result v7

    .line 44
    if-eqz v7, :cond_1

    .line 45
    .line 46
    iget-object v7, p0, Laa;->k:[Ljava/lang/Object;

    .line 47
    .line 48
    add-int/lit8 v8, v5, 0x1

    .line 49
    .line 50
    aput-object v6, v7, v5

    .line 51
    .line 52
    move v5, v8

    .line 53
    goto :goto_1

    .line 54
    :cond_1
    move v1, v4

    .line 55
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_2
    invoke-static {v6, v5, v0, v3}, Ljava/util/Arrays;->fill([Ljava/lang/Object;IILjava/lang/Object;)V

    .line 59
    .line 60
    .line 61
    goto :goto_6

    .line 62
    :cond_3
    iget-object v5, p0, Laa;->k:[Ljava/lang/Object;

    .line 63
    .line 64
    array-length v5, v5

    .line 65
    move v7, v1

    .line 66
    move v6, v2

    .line 67
    :goto_2
    if-ge v2, v5, :cond_5

    .line 68
    .line 69
    iget-object v8, p0, Laa;->k:[Ljava/lang/Object;

    .line 70
    .line 71
    aget-object v9, v8, v2

    .line 72
    .line 73
    aput-object v3, v8, v2

    .line 74
    .line 75
    invoke-interface {p1, v9}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result v8

    .line 79
    if-eqz v8, :cond_4

    .line 80
    .line 81
    iget-object v8, p0, Laa;->k:[Ljava/lang/Object;

    .line 82
    .line 83
    add-int/lit8 v10, v6, 0x1

    .line 84
    .line 85
    aput-object v9, v8, v6

    .line 86
    .line 87
    move v6, v10

    .line 88
    goto :goto_3

    .line 89
    :cond_4
    move v7, v4

    .line 90
    :goto_3
    add-int/lit8 v2, v2, 0x1

    .line 91
    .line 92
    goto :goto_2

    .line 93
    :cond_5
    invoke-virtual {p0, v6}, Laa;->h(I)I

    .line 94
    .line 95
    .line 96
    move-result v2

    .line 97
    move v5, v2

    .line 98
    :goto_4
    if-ge v1, v0, :cond_7

    .line 99
    .line 100
    iget-object v2, p0, Laa;->k:[Ljava/lang/Object;

    .line 101
    .line 102
    aget-object v6, v2, v1

    .line 103
    .line 104
    aput-object v3, v2, v1

    .line 105
    .line 106
    invoke-interface {p1, v6}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    .line 107
    .line 108
    .line 109
    move-result v2

    .line 110
    if-eqz v2, :cond_6

    .line 111
    .line 112
    iget-object v2, p0, Laa;->k:[Ljava/lang/Object;

    .line 113
    .line 114
    aput-object v6, v2, v5

    .line 115
    .line 116
    invoke-virtual {p0, v5}, Laa;->d(I)I

    .line 117
    .line 118
    .line 119
    move-result v5

    .line 120
    goto :goto_5

    .line 121
    :cond_6
    move v7, v4

    .line 122
    :goto_5
    add-int/lit8 v1, v1, 0x1

    .line 123
    .line 124
    goto :goto_4

    .line 125
    :cond_7
    move v1, v7

    .line 126
    :goto_6
    if-eqz v1, :cond_8

    .line 127
    .line 128
    invoke-virtual {p0}, Laa;->j()V

    .line 129
    .line 130
    .line 131
    iget p1, p0, Laa;->j:I

    .line 132
    .line 133
    sub-int/2addr v5, p1

    .line 134
    invoke-virtual {p0, v5}, Laa;->e(I)I

    .line 135
    .line 136
    .line 137
    move-result p1

    .line 138
    iput p1, p0, Laa;->l:I

    .line 139
    .line 140
    :cond_8
    :goto_7
    return v1
.end method

.method public final set(ILjava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget v0, p0, Laa;->l:I

    .line 2
    .line 3
    if-ltz p1, :cond_0

    .line 4
    .line 5
    if-ge p1, v0, :cond_0

    .line 6
    .line 7
    iget v0, p0, Laa;->j:I

    .line 8
    .line 9
    add-int/2addr v0, p1

    .line 10
    invoke-virtual {p0, v0}, Laa;->h(I)I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    iget-object p0, p0, Laa;->k:[Ljava/lang/Object;

    .line 15
    .line 16
    aget-object v0, p0, p1

    .line 17
    .line 18
    aput-object p2, p0, p1

    .line 19
    .line 20
    return-object v0

    .line 21
    :cond_0
    const-string p0, "index: "

    .line 22
    .line 23
    const-string p2, ", size: "

    .line 24
    .line 25
    invoke-static {p1, v0, p0, p2}, Loq;->e(IILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-static {p0}, Lz0;->i(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    const/4 p0, 0x0

    .line 33
    return-object p0
.end method

.method public final size()I
    .locals 0

    .line 1
    iget p0, p0, Laa;->l:I

    .line 2
    .line 3
    return p0
.end method

.method public final toArray()[Ljava/lang/Object;
    .locals 1

    .line 79
    iget v0, p0, Laa;->l:I

    .line 80
    new-array v0, v0, [Ljava/lang/Object;

    invoke-virtual {p0, v0}, Laa;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final toArray([Ljava/lang/Object;)[Ljava/lang/Object;
    .locals 5

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    array-length v0, p1

    .line 5
    iget v1, p0, Laa;->l:I

    .line 6
    .line 7
    if-lt v0, v1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p1}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-static {p1, v1}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 23
    .line 24
    .line 25
    check-cast p1, [Ljava/lang/Object;

    .line 26
    .line 27
    :goto_0
    iget v0, p0, Laa;->j:I

    .line 28
    .line 29
    iget v1, p0, Laa;->l:I

    .line 30
    .line 31
    add-int/2addr v0, v1

    .line 32
    invoke-virtual {p0, v0}, Laa;->h(I)I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    iget v1, p0, Laa;->j:I

    .line 37
    .line 38
    const/4 v2, 0x0

    .line 39
    if-ge v1, v0, :cond_1

    .line 40
    .line 41
    iget-object v3, p0, Laa;->k:[Ljava/lang/Object;

    .line 42
    .line 43
    invoke-static {v2, v1, v0, v3, p1}, Lia;->N(III[Ljava/lang/Object;[Ljava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_1
    invoke-virtual {p0}, Laa;->isEmpty()Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-nez v1, :cond_2

    .line 52
    .line 53
    iget-object v1, p0, Laa;->k:[Ljava/lang/Object;

    .line 54
    .line 55
    iget v3, p0, Laa;->j:I

    .line 56
    .line 57
    array-length v4, v1

    .line 58
    invoke-static {v2, v3, v4, v1, p1}, Lia;->N(III[Ljava/lang/Object;[Ljava/lang/Object;)V

    .line 59
    .line 60
    .line 61
    iget-object v1, p0, Laa;->k:[Ljava/lang/Object;

    .line 62
    .line 63
    array-length v3, v1

    .line 64
    iget v4, p0, Laa;->j:I

    .line 65
    .line 66
    sub-int/2addr v3, v4

    .line 67
    invoke-static {v3, v2, v0, v1, p1}, Lia;->N(III[Ljava/lang/Object;[Ljava/lang/Object;)V

    .line 68
    .line 69
    .line 70
    :cond_2
    :goto_1
    iget p0, p0, Laa;->l:I

    .line 71
    .line 72
    array-length v0, p1

    .line 73
    if-ge p0, v0, :cond_3

    .line 74
    .line 75
    const/4 v0, 0x0

    .line 76
    aput-object v0, p1, p0

    .line 77
    .line 78
    :cond_3
    return-object p1
.end method
