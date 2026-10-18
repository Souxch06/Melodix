.class public final Ll80;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static e:Landroid/os/HandlerThread;

.field public static f:Landroid/os/Handler;


# instance fields
.field public a:I

.field public b:Ljava/lang/Object;

.field public final c:Ljava/io/Serializable;

.field public final d:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x9

    .line 5
    .line 6
    new-array v0, v0, [Landroid/util/SparseIntArray;

    .line 7
    .line 8
    iput-object v0, p0, Ll80;->b:Ljava/lang/Object;

    .line 9
    .line 10
    new-instance v0, Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Ll80;->c:Ljava/io/Serializable;

    .line 16
    .line 17
    new-instance v0, Lk80;

    .line 18
    .line 19
    invoke-direct {v0, p0}, Lk80;-><init>(Ll80;)V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Ll80;->d:Ljava/lang/Object;

    .line 23
    .line 24
    const/4 v0, 0x1

    .line 25
    iput v0, p0, Ll80;->a:I

    .line 26
    .line 27
    return-void
.end method

.method public constructor <init>(Lpg0;Lcl1;Lz91;Li41;)V
    .locals 0

    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    iput-object p1, p0, Ll80;->b:Ljava/lang/Object;

    .line 30
    iput-object p2, p0, Ll80;->c:Ljava/io/Serializable;

    .line 31
    iput-object p3, p0, Ll80;->d:Ljava/lang/Object;

    const/4 p1, -0x1

    .line 32
    iput p1, p0, Ll80;->a:I

    return-void
.end method


# virtual methods
.method public a(Li41;)Ll80;
    .locals 9

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll80;->b:Ljava/lang/Object;

    .line 5
    .line 6
    check-cast v0, Lpg0;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lbv;->n(Lpg0;Li41;)Lcl1;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    iget-object v2, p0, Ll80;->d:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast v2, Lz91;

    .line 15
    .line 16
    iget-object v3, v2, Lz91;->b:Lo7;

    .line 17
    .line 18
    iget v4, v3, Lo7;->b:I

    .line 19
    .line 20
    const/4 v5, 0x1

    .line 21
    add-int/2addr v4, v5

    .line 22
    iput v4, v3, Lo7;->b:I

    .line 23
    .line 24
    iget-object v6, v3, Lo7;->c:Ljava/lang/Object;

    .line 25
    .line 26
    check-cast v6, [Ljava/lang/Object;

    .line 27
    .line 28
    array-length v7, v6

    .line 29
    if-ne v4, v7, :cond_0

    .line 30
    .line 31
    mul-int/lit8 v7, v4, 0x2

    .line 32
    .line 33
    invoke-static {v6, v7}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v6

    .line 37
    iput-object v6, v3, Lo7;->c:Ljava/lang/Object;

    .line 38
    .line 39
    iget-object v6, v3, Lo7;->d:Ljava/lang/Object;

    .line 40
    .line 41
    check-cast v6, [I

    .line 42
    .line 43
    invoke-static {v6, v7}, Ljava/util/Arrays;->copyOf([II)[I

    .line 44
    .line 45
    .line 46
    move-result-object v6

    .line 47
    iput-object v6, v3, Lo7;->d:Ljava/lang/Object;

    .line 48
    .line 49
    :cond_0
    iget-object v3, v3, Lo7;->c:Ljava/lang/Object;

    .line 50
    .line 51
    check-cast v3, [Ljava/lang/Object;

    .line 52
    .line 53
    aput-object p1, v3, v4

    .line 54
    .line 55
    iget-char v3, v1, Lcl1;->j:C

    .line 56
    .line 57
    invoke-virtual {v2, v3}, Lz91;->e(C)V

    .line 58
    .line 59
    .line 60
    iget-object v3, v2, Lz91;->e:Ljava/lang/String;

    .line 61
    .line 62
    iget v4, v2, Lz91;->a:I

    .line 63
    .line 64
    :goto_0
    invoke-virtual {v2, v4}, Lz91;->m(I)I

    .line 65
    .line 66
    .line 67
    move-result v4

    .line 68
    const/4 v6, -0x1

    .line 69
    const/16 v7, 0xa

    .line 70
    .line 71
    if-eq v4, v6, :cond_2

    .line 72
    .line 73
    invoke-virtual {v3, v4}, Ljava/lang/String;->charAt(I)C

    .line 74
    .line 75
    .line 76
    move-result v6

    .line 77
    const/16 v8, 0x9

    .line 78
    .line 79
    if-eq v6, v8, :cond_1

    .line 80
    .line 81
    if-eq v6, v7, :cond_1

    .line 82
    .line 83
    const/16 v7, 0xd

    .line 84
    .line 85
    if-eq v6, v7, :cond_1

    .line 86
    .line 87
    const/16 v7, 0x20

    .line 88
    .line 89
    if-eq v6, v7, :cond_1

    .line 90
    .line 91
    iput v4, v2, Lz91;->a:I

    .line 92
    .line 93
    invoke-static {v6}, Lcg1;->a(C)B

    .line 94
    .line 95
    .line 96
    move-result v7

    .line 97
    goto :goto_1

    .line 98
    :cond_1
    add-int/lit8 v4, v4, 0x1

    .line 99
    .line 100
    goto :goto_0

    .line 101
    :cond_2
    iput v4, v2, Lz91;->a:I

    .line 102
    .line 103
    :goto_1
    const/4 v3, 0x4

    .line 104
    if-eq v7, v3, :cond_5

    .line 105
    .line 106
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 107
    .line 108
    .line 109
    move-result v3

    .line 110
    if-eq v3, v5, :cond_4

    .line 111
    .line 112
    const/4 v4, 0x2

    .line 113
    if-eq v3, v4, :cond_4

    .line 114
    .line 115
    const/4 v4, 0x3

    .line 116
    if-eq v3, v4, :cond_4

    .line 117
    .line 118
    iget-object v3, p0, Ll80;->c:Ljava/io/Serializable;

    .line 119
    .line 120
    check-cast v3, Lcl1;

    .line 121
    .line 122
    if-ne v3, v1, :cond_3

    .line 123
    .line 124
    return-object p0

    .line 125
    :cond_3
    new-instance p0, Ll80;

    .line 126
    .line 127
    invoke-direct {p0, v0, v1, v2, p1}, Ll80;-><init>(Lpg0;Lcl1;Lz91;Li41;)V

    .line 128
    .line 129
    .line 130
    return-object p0

    .line 131
    :cond_4
    new-instance p0, Ll80;

    .line 132
    .line 133
    invoke-direct {p0, v0, v1, v2, p1}, Ll80;-><init>(Lpg0;Lcl1;Lz91;Li41;)V

    .line 134
    .line 135
    .line 136
    return-object p0

    .line 137
    :cond_5
    const/4 p0, 0x0

    .line 138
    const/4 p1, 0x6

    .line 139
    const-string v0, "Unexpected leading comma"

    .line 140
    .line 141
    invoke-static {v2, v0, p0, p1}, Lz91;->j(Lz91;Ljava/lang/String;II)V

    .line 142
    .line 143
    .line 144
    const/4 p0, 0x0

    .line 145
    throw p0
.end method

.method public b(Li41;)I
    .locals 10

    .line 1
    iget-object v0, p0, Ll80;->b:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lpg0;

    .line 4
    .line 5
    iget-object v1, p0, Ll80;->d:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v1, Lz91;

    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    iget-object v2, p0, Ll80;->c:Ljava/io/Serializable;

    .line 13
    .line 14
    check-cast v2, Lcl1;

    .line 15
    .line 16
    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    const-string v4, "object"

    .line 21
    .line 22
    const/4 v5, 0x6

    .line 23
    const/4 v6, 0x0

    .line 24
    const/16 v7, 0x3a

    .line 25
    .line 26
    const/4 v8, 0x0

    .line 27
    const/4 v9, -0x1

    .line 28
    if-eqz v3, :cond_e

    .line 29
    .line 30
    const/4 p1, 0x2

    .line 31
    const/4 v0, 0x1

    .line 32
    if-eq v3, p1, :cond_4

    .line 33
    .line 34
    invoke-virtual {v1}, Lz91;->o()Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    invoke-virtual {v1}, Lz91;->b()Z

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    if-eqz v3, :cond_2

    .line 43
    .line 44
    iget v3, p0, Ll80;->a:I

    .line 45
    .line 46
    if-eq v3, v9, :cond_1

    .line 47
    .line 48
    if-eqz p1, :cond_0

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_0
    const-string p0, "Expected end of the array or comma"

    .line 52
    .line 53
    invoke-static {v1, p0, v8, v5}, Lz91;->j(Lz91;Ljava/lang/String;II)V

    .line 54
    .line 55
    .line 56
    throw v6

    .line 57
    :cond_1
    :goto_0
    add-int/lit8 v9, v3, 0x1

    .line 58
    .line 59
    iput v9, p0, Ll80;->a:I

    .line 60
    .line 61
    goto/16 :goto_4

    .line 62
    .line 63
    :cond_2
    if-nez p1, :cond_3

    .line 64
    .line 65
    goto/16 :goto_4

    .line 66
    .line 67
    :cond_3
    const-string p0, "array"

    .line 68
    .line 69
    invoke-static {v1, p0}, Lfe1;->r(Lz91;Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    throw v6

    .line 73
    :cond_4
    iget p1, p0, Ll80;->a:I

    .line 74
    .line 75
    rem-int/lit8 v3, p1, 0x2

    .line 76
    .line 77
    if-eqz v3, :cond_5

    .line 78
    .line 79
    move v3, v0

    .line 80
    goto :goto_1

    .line 81
    :cond_5
    move v3, v8

    .line 82
    :goto_1
    if-eqz v3, :cond_6

    .line 83
    .line 84
    if-eq p1, v9, :cond_7

    .line 85
    .line 86
    invoke-virtual {v1}, Lz91;->o()Z

    .line 87
    .line 88
    .line 89
    move-result v8

    .line 90
    goto :goto_2

    .line 91
    :cond_6
    invoke-virtual {v1, v7}, Lz91;->e(C)V

    .line 92
    .line 93
    .line 94
    :cond_7
    :goto_2
    invoke-virtual {v1}, Lz91;->b()Z

    .line 95
    .line 96
    .line 97
    move-result p1

    .line 98
    if-eqz p1, :cond_c

    .line 99
    .line 100
    if-eqz v3, :cond_b

    .line 101
    .line 102
    iget p1, p0, Ll80;->a:I

    .line 103
    .line 104
    iget v3, v1, Lz91;->a:I

    .line 105
    .line 106
    const/4 v4, 0x4

    .line 107
    if-ne p1, v9, :cond_9

    .line 108
    .line 109
    if-nez v8, :cond_8

    .line 110
    .line 111
    goto :goto_3

    .line 112
    :cond_8
    const-string p0, "Unexpected leading comma"

    .line 113
    .line 114
    invoke-static {v1, p0, v3, v4}, Lz91;->j(Lz91;Ljava/lang/String;II)V

    .line 115
    .line 116
    .line 117
    throw v6

    .line 118
    :cond_9
    if-eqz v8, :cond_a

    .line 119
    .line 120
    goto :goto_3

    .line 121
    :cond_a
    const-string p0, "Expected comma after the key-value pair"

    .line 122
    .line 123
    invoke-static {v1, p0, v3, v4}, Lz91;->j(Lz91;Ljava/lang/String;II)V

    .line 124
    .line 125
    .line 126
    throw v6

    .line 127
    :cond_b
    :goto_3
    iget p1, p0, Ll80;->a:I

    .line 128
    .line 129
    add-int/lit8 v9, p1, 0x1

    .line 130
    .line 131
    iput v9, p0, Ll80;->a:I

    .line 132
    .line 133
    goto :goto_4

    .line 134
    :cond_c
    if-nez v8, :cond_d

    .line 135
    .line 136
    goto :goto_4

    .line 137
    :cond_d
    invoke-static {v1, v4}, Lfe1;->r(Lz91;Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    throw v6

    .line 141
    :cond_e
    invoke-virtual {v1}, Lz91;->o()Z

    .line 142
    .line 143
    .line 144
    move-result p0

    .line 145
    invoke-virtual {v1}, Lz91;->b()Z

    .line 146
    .line 147
    .line 148
    move-result v3

    .line 149
    if-eqz v3, :cond_10

    .line 150
    .line 151
    invoke-virtual {v1}, Lz91;->d()Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object p0

    .line 155
    invoke-virtual {v1, v7}, Lz91;->e(C)V

    .line 156
    .line 157
    .line 158
    invoke-static {p1, v0, p0}, Lbh;->r(Li41;Lpg0;Ljava/lang/String;)I

    .line 159
    .line 160
    .line 161
    move-result v9

    .line 162
    const/4 p1, -0x3

    .line 163
    if-eq v9, p1, :cond_f

    .line 164
    .line 165
    goto :goto_4

    .line 166
    :cond_f
    iget p1, v1, Lz91;->a:I

    .line 167
    .line 168
    iget-object v0, v1, Lz91;->e:Ljava/lang/String;

    .line 169
    .line 170
    invoke-virtual {v0, v8, p1}, Ljava/lang/String;->subSequence(II)Ljava/lang/CharSequence;

    .line 171
    .line 172
    .line 173
    move-result-object p1

    .line 174
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object p1

    .line 178
    invoke-static {p1, p0, v5}, Lda1;->H(Ljava/lang/String;Ljava/lang/String;I)I

    .line 179
    .line 180
    .line 181
    move-result p1

    .line 182
    new-instance v0, Ljava/lang/StringBuilder;

    .line 183
    .line 184
    const-string v2, "Encountered an unknown key \'"

    .line 185
    .line 186
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 187
    .line 188
    .line 189
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 190
    .line 191
    .line 192
    const/16 p0, 0x27

    .line 193
    .line 194
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 195
    .line 196
    .line 197
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 198
    .line 199
    .line 200
    move-result-object p0

    .line 201
    const-string v0, "Use \'ignoreUnknownKeys = true\' in \'Json {}\' builder to ignore unknown keys."

    .line 202
    .line 203
    invoke-virtual {v1, p0, v0, p1}, Lz91;->i(Ljava/lang/String;Ljava/lang/String;I)V

    .line 204
    .line 205
    .line 206
    throw v6

    .line 207
    :cond_10
    if-nez p0, :cond_12

    .line 208
    .line 209
    :goto_4
    sget-object p0, Lcl1;->n:Lcl1;

    .line 210
    .line 211
    if-eq v2, p0, :cond_11

    .line 212
    .line 213
    iget-object p0, v1, Lz91;->b:Lo7;

    .line 214
    .line 215
    iget-object p1, p0, Lo7;->d:Ljava/lang/Object;

    .line 216
    .line 217
    check-cast p1, [I

    .line 218
    .line 219
    iget p0, p0, Lo7;->b:I

    .line 220
    .line 221
    aput v9, p1, p0

    .line 222
    .line 223
    :cond_11
    return v9

    .line 224
    :cond_12
    invoke-static {v1, v4}, Lfe1;->r(Lz91;Ljava/lang/String;)V

    .line 225
    .line 226
    .line 227
    throw v6
.end method

.method public c()I
    .locals 5

    .line 1
    iget-object p0, p0, Ll80;->d:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Lz91;

    .line 4
    .line 5
    invoke-virtual {p0}, Lz91;->f()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    long-to-int v2, v0

    .line 10
    int-to-long v3, v2

    .line 11
    cmp-long v3, v0, v3

    .line 12
    .line 13
    if-nez v3, :cond_0

    .line 14
    .line 15
    return v2

    .line 16
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    const-string v3, "Failed to parse int for input \'"

    .line 19
    .line 20
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const/16 v0, 0x27

    .line 27
    .line 28
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const/4 v1, 0x0

    .line 36
    const/4 v2, 0x6

    .line 37
    invoke-static {p0, v0, v1, v2}, Lz91;->j(Lz91;Ljava/lang/String;II)V

    .line 38
    .line 39
    .line 40
    const/4 p0, 0x0

    .line 41
    throw p0
.end method

.method public d(Li41;I)I
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll80;->c()I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    return p0
.end method

.method public e()J
    .locals 2

    .line 1
    iget-object p0, p0, Ll80;->d:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Lz91;

    .line 4
    .line 5
    invoke-virtual {p0}, Lz91;->f()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public f(Li41;I)J
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll80;->e()J

    .line 5
    .line 6
    .line 7
    move-result-wide p0

    .line 8
    return-wide p0
.end method

.method public g()Z
    .locals 9

    .line 1
    iget-object p0, p0, Ll80;->d:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Lz91;

    .line 4
    .line 5
    invoke-virtual {p0}, Lz91;->n()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-virtual {p0, v0}, Lz91;->m(I)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iget-object v1, p0, Lz91;->e:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    sub-int/2addr v2, v0

    .line 20
    const/4 v3, 0x1

    .line 21
    const/4 v4, 0x0

    .line 22
    const/4 v5, 0x4

    .line 23
    if-lt v2, v5, :cond_4

    .line 24
    .line 25
    const/4 v6, -0x1

    .line 26
    if-ne v0, v6, :cond_0

    .line 27
    .line 28
    goto :goto_1

    .line 29
    :cond_0
    move v6, v4

    .line 30
    :goto_0
    if-ge v6, v5, :cond_2

    .line 31
    .line 32
    const-string v7, "null"

    .line 33
    .line 34
    invoke-virtual {v7, v6}, Ljava/lang/String;->charAt(I)C

    .line 35
    .line 36
    .line 37
    move-result v7

    .line 38
    add-int v8, v0, v6

    .line 39
    .line 40
    invoke-virtual {v1, v8}, Ljava/lang/String;->charAt(I)C

    .line 41
    .line 42
    .line 43
    move-result v8

    .line 44
    if-eq v7, v8, :cond_1

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_1
    add-int/lit8 v6, v6, 0x1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_2
    if-le v2, v5, :cond_3

    .line 51
    .line 52
    add-int/lit8 v2, v0, 0x4

    .line 53
    .line 54
    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    invoke-static {v1}, Lcg1;->a(C)B

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    if-nez v1, :cond_3

    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_3
    add-int/2addr v0, v5

    .line 66
    iput v0, p0, Lz91;->a:I

    .line 67
    .line 68
    move p0, v3

    .line 69
    goto :goto_2

    .line 70
    :cond_4
    :goto_1
    move p0, v4

    .line 71
    :goto_2
    if-nez p0, :cond_5

    .line 72
    .line 73
    return v3

    .line 74
    :cond_5
    return v4
.end method

.method public h(Li41;ILdh0;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-interface {p3}, Ldh0;->d()Li41;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-interface {p1}, Li41;->h()Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-nez p1, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0}, Ll80;->g()Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/4 p0, 0x0

    .line 25
    return-object p0

    .line 26
    :cond_1
    :goto_0
    invoke-virtual {p0, p3}, Ll80;->j(Ldh0;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0
.end method

.method public i(Li41;ILdh0;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    .line 1
    iget-object p4, p0, Ll80;->d:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p4, Lz91;

    .line 4
    .line 5
    iget-object p4, p4, Lz91;->b:Lo7;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Ll80;->c:Ljava/io/Serializable;

    .line 14
    .line 15
    check-cast p1, Lcl1;

    .line 16
    .line 17
    sget-object v0, Lcl1;->n:Lcl1;

    .line 18
    .line 19
    const/4 v1, 0x1

    .line 20
    if-ne p1, v0, :cond_0

    .line 21
    .line 22
    and-int/lit8 p1, p2, 0x1

    .line 23
    .line 24
    if-nez p1, :cond_0

    .line 25
    .line 26
    move p1, v1

    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const/4 p1, 0x0

    .line 29
    :goto_0
    const/4 p2, -0x2

    .line 30
    if-eqz p1, :cond_1

    .line 31
    .line 32
    iget-object v0, p4, Lo7;->d:Ljava/lang/Object;

    .line 33
    .line 34
    check-cast v0, [I

    .line 35
    .line 36
    iget v2, p4, Lo7;->b:I

    .line 37
    .line 38
    aget v0, v0, v2

    .line 39
    .line 40
    if-ne v0, p2, :cond_1

    .line 41
    .line 42
    iget-object v0, p4, Lo7;->c:Ljava/lang/Object;

    .line 43
    .line 44
    check-cast v0, [Ljava/lang/Object;

    .line 45
    .line 46
    sget-object v3, Lok0;->o:Lok0;

    .line 47
    .line 48
    aput-object v3, v0, v2

    .line 49
    .line 50
    :cond_1
    invoke-virtual {p0, p3}, Ll80;->j(Ldh0;)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    if-eqz p1, :cond_3

    .line 55
    .line 56
    iget-object p1, p4, Lo7;->d:Ljava/lang/Object;

    .line 57
    .line 58
    check-cast p1, [I

    .line 59
    .line 60
    iget p3, p4, Lo7;->b:I

    .line 61
    .line 62
    aget v0, p1, p3

    .line 63
    .line 64
    if-eq v0, p2, :cond_2

    .line 65
    .line 66
    add-int/2addr p3, v1

    .line 67
    iput p3, p4, Lo7;->b:I

    .line 68
    .line 69
    iget-object v0, p4, Lo7;->c:Ljava/lang/Object;

    .line 70
    .line 71
    check-cast v0, [Ljava/lang/Object;

    .line 72
    .line 73
    array-length v1, v0

    .line 74
    if-ne p3, v1, :cond_2

    .line 75
    .line 76
    mul-int/lit8 p3, p3, 0x2

    .line 77
    .line 78
    invoke-static {v0, p3}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    iput-object p1, p4, Lo7;->c:Ljava/lang/Object;

    .line 83
    .line 84
    iget-object p1, p4, Lo7;->d:Ljava/lang/Object;

    .line 85
    .line 86
    check-cast p1, [I

    .line 87
    .line 88
    invoke-static {p1, p3}, Ljava/util/Arrays;->copyOf([II)[I

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    iput-object p1, p4, Lo7;->d:Ljava/lang/Object;

    .line 93
    .line 94
    :cond_2
    iget-object p3, p4, Lo7;->c:Ljava/lang/Object;

    .line 95
    .line 96
    check-cast p3, [Ljava/lang/Object;

    .line 97
    .line 98
    iget p4, p4, Lo7;->b:I

    .line 99
    .line 100
    aput-object p0, p3, p4

    .line 101
    .line 102
    aput p2, p1, p4

    .line 103
    .line 104
    :cond_3
    return-object p0
.end method

.method public j(Ldh0;)Ljava/lang/Object;
    .locals 3

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    :try_start_0
    invoke-interface {p1, p0}, Ldh0;->b(Ll80;)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p0
    :try_end_0
    .catch Ldo0; {:try_start_0 .. :try_end_0} :catch_0

    .line 8
    return-object p0

    .line 9
    :catch_0
    move-exception p1

    .line 10
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 15
    .line 16
    .line 17
    const-string v1, "at path"

    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    invoke-static {v0, v1, v2}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    throw p1

    .line 27
    :cond_0
    new-instance v0, Ldo0;

    .line 28
    .line 29
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    iget-object p0, p0, Ll80;->d:Ljava/lang/Object;

    .line 34
    .line 35
    check-cast p0, Lz91;

    .line 36
    .line 37
    iget-object p0, p0, Lz91;->b:Lo7;

    .line 38
    .line 39
    invoke-virtual {p0}, Lo7;->d()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    new-instance v2, Ljava/lang/StringBuilder;

    .line 44
    .line 45
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    const-string v1, " at path: "

    .line 52
    .line 53
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    iget-object v1, p1, Ldo0;->j:Ljava/util/ArrayList;

    .line 64
    .line 65
    invoke-direct {v0, v1, p0, p1}, Ldo0;-><init>(Ljava/util/ArrayList;Ljava/lang/String;Ldo0;)V

    .line 66
    .line 67
    .line 68
    throw v0
.end method

.method public k()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll80;->d:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Lz91;

    .line 4
    .line 5
    invoke-virtual {p0}, Lz91;->g()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public l(Li41;I)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll80;->k()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method public m(Li41;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll80;->d:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lz91;

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0}, Lz91;->o()Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-nez p1, :cond_2

    .line 13
    .line 14
    iget-object p0, p0, Ll80;->c:Ljava/io/Serializable;

    .line 15
    .line 16
    check-cast p0, Lcl1;

    .line 17
    .line 18
    iget-char p0, p0, Lcl1;->k:C

    .line 19
    .line 20
    invoke-virtual {v0, p0}, Lz91;->e(C)V

    .line 21
    .line 22
    .line 23
    iget-object p0, v0, Lz91;->b:Lo7;

    .line 24
    .line 25
    iget p1, p0, Lo7;->b:I

    .line 26
    .line 27
    iget-object v0, p0, Lo7;->d:Ljava/lang/Object;

    .line 28
    .line 29
    check-cast v0, [I

    .line 30
    .line 31
    aget v1, v0, p1

    .line 32
    .line 33
    const/4 v2, -0x2

    .line 34
    const/4 v3, -0x1

    .line 35
    if-ne v1, v2, :cond_0

    .line 36
    .line 37
    aput v3, v0, p1

    .line 38
    .line 39
    add-int/lit8 p1, p1, -0x1

    .line 40
    .line 41
    iput p1, p0, Lo7;->b:I

    .line 42
    .line 43
    :cond_0
    if-eq p1, v3, :cond_1

    .line 44
    .line 45
    add-int/2addr p1, v3

    .line 46
    iput p1, p0, Lo7;->b:I

    .line 47
    .line 48
    :cond_1
    return-void

    .line 49
    :cond_2
    const-string p0, ""

    .line 50
    .line 51
    invoke-static {v0, p0}, Lfe1;->r(Lz91;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    const/4 p0, 0x0

    .line 55
    throw p0
.end method
