.class public Lz91;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public a:I

.field public final b:Lo7;

.field public c:Ljava/lang/String;

.field public final d:Ljava/lang/StringBuilder;

.field public final e:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 5

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    .line 6
    .line 7
    new-instance v0, Lo7;

    .line 8
    .line 9
    invoke-direct {v0}, Lo7;-><init>()V

    .line 10
    .line 11
    .line 12
    const/16 v1, 0x8

    .line 13
    .line 14
    new-array v2, v1, [Ljava/lang/Object;

    .line 15
    .line 16
    iput-object v2, v0, Lo7;->c:Ljava/lang/Object;

    .line 17
    .line 18
    new-array v2, v1, [I

    .line 19
    .line 20
    const/4 v3, 0x0

    .line 21
    :goto_0
    const/4 v4, -0x1

    .line 22
    if-ge v3, v1, :cond_0

    .line 23
    .line 24
    aput v4, v2, v3

    .line 25
    .line 26
    add-int/lit8 v3, v3, 0x1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    iput-object v2, v0, Lo7;->d:Ljava/lang/Object;

    .line 30
    .line 31
    iput v4, v0, Lo7;->b:I

    .line 32
    .line 33
    iput-object v0, p0, Lz91;->b:Lo7;

    .line 34
    .line 35
    new-instance v0, Ljava/lang/StringBuilder;

    .line 36
    .line 37
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 38
    .line 39
    .line 40
    iput-object v0, p0, Lz91;->d:Ljava/lang/StringBuilder;

    .line 41
    .line 42
    iput-object p1, p0, Lz91;->e:Ljava/lang/String;

    .line 43
    .line 44
    return-void
.end method

.method public static synthetic j(Lz91;Ljava/lang/String;II)V
    .locals 1

    .line 1
    and-int/lit8 v0, p3, 0x2

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget p2, p0, Lz91;->a:I

    .line 6
    .line 7
    :cond_0
    and-int/lit8 p3, p3, 0x4

    .line 8
    .line 9
    if-eqz p3, :cond_1

    .line 10
    .line 11
    const-string p3, ""

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_1
    const-string p3, "It is possible to deserialize them using \'JsonBuilder.allowSpecialFloatingPointValues = true\'"

    .line 15
    .line 16
    :goto_0
    invoke-virtual {p0, p1, p3, p2}, Lz91;->i(Ljava/lang/String;Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    const/4 p0, 0x0

    .line 20
    throw p0
.end method


# virtual methods
.method public final a(Ljava/lang/CharSequence;I)I
    .locals 3

    .line 1
    add-int/lit8 v0, p2, 0x4

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-lt v0, v1, :cond_1

    .line 8
    .line 9
    iput p2, p0, Lz91;->a:I

    .line 10
    .line 11
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    if-ge v0, p2, :cond_0

    .line 16
    .line 17
    iget p2, p0, Lz91;->a:I

    .line 18
    .line 19
    invoke-virtual {p0, p1, p2}, Lz91;->a(Ljava/lang/CharSequence;I)I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0

    .line 24
    :cond_0
    const/4 p1, 0x0

    .line 25
    const/4 p2, 0x6

    .line 26
    const-string v0, "Unexpected EOF during unicode escape"

    .line 27
    .line 28
    invoke-static {p0, v0, p1, p2}, Lz91;->j(Lz91;Ljava/lang/String;II)V

    .line 29
    .line 30
    .line 31
    const/4 p0, 0x0

    .line 32
    throw p0

    .line 33
    :cond_1
    invoke-virtual {p0, p1, p2}, Lz91;->l(Ljava/lang/CharSequence;I)I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    shl-int/lit8 v1, v1, 0xc

    .line 38
    .line 39
    add-int/lit8 v2, p2, 0x1

    .line 40
    .line 41
    invoke-virtual {p0, p1, v2}, Lz91;->l(Ljava/lang/CharSequence;I)I

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    shl-int/lit8 v2, v2, 0x8

    .line 46
    .line 47
    add-int/2addr v1, v2

    .line 48
    add-int/lit8 v2, p2, 0x2

    .line 49
    .line 50
    invoke-virtual {p0, p1, v2}, Lz91;->l(Ljava/lang/CharSequence;I)I

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    shl-int/lit8 v2, v2, 0x4

    .line 55
    .line 56
    add-int/2addr v1, v2

    .line 57
    add-int/lit8 p2, p2, 0x3

    .line 58
    .line 59
    invoke-virtual {p0, p1, p2}, Lz91;->l(Ljava/lang/CharSequence;I)I

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    add-int/2addr p1, v1

    .line 64
    int-to-char p1, p1

    .line 65
    iget-object p0, p0, Lz91;->d:Ljava/lang/StringBuilder;

    .line 66
    .line 67
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    return v0
.end method

.method public b()Z
    .locals 4

    .line 1
    iget v0, p0, Lz91;->a:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    return v2

    .line 8
    :cond_0
    :goto_0
    iget-object v1, p0, Lz91;->e:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 11
    .line 12
    .line 13
    move-result v3

    .line 14
    if-ge v0, v3, :cond_4

    .line 15
    .line 16
    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    const/16 v3, 0x20

    .line 21
    .line 22
    if-eq v1, v3, :cond_3

    .line 23
    .line 24
    const/16 v3, 0xa

    .line 25
    .line 26
    if-eq v1, v3, :cond_3

    .line 27
    .line 28
    const/16 v3, 0xd

    .line 29
    .line 30
    if-eq v1, v3, :cond_3

    .line 31
    .line 32
    const/16 v3, 0x9

    .line 33
    .line 34
    if-ne v1, v3, :cond_1

    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_1
    iput v0, p0, Lz91;->a:I

    .line 38
    .line 39
    const/16 p0, 0x2c

    .line 40
    .line 41
    if-eq v1, p0, :cond_2

    .line 42
    .line 43
    const/16 p0, 0x3a

    .line 44
    .line 45
    if-eq v1, p0, :cond_2

    .line 46
    .line 47
    const/16 p0, 0x5d

    .line 48
    .line 49
    if-eq v1, p0, :cond_2

    .line 50
    .line 51
    const/16 p0, 0x7d

    .line 52
    .line 53
    if-eq v1, p0, :cond_2

    .line 54
    .line 55
    const/4 p0, 0x1

    .line 56
    return p0

    .line 57
    :cond_2
    return v2

    .line 58
    :cond_3
    :goto_1
    add-int/lit8 v0, v0, 0x1

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_4
    iput v0, p0, Lz91;->a:I

    .line 62
    .line 63
    return v2
.end method

.method public final c(ILjava/lang/String;)V
    .locals 8

    .line 1
    iget-object v0, p0, Lz91;->e:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    sub-int/2addr v1, p1

    .line 8
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    const/4 v3, 0x0

    .line 13
    const/4 v4, 0x6

    .line 14
    const/4 v5, 0x0

    .line 15
    if-lt v1, v2, :cond_2

    .line 16
    .line 17
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    move v2, v5

    .line 22
    :goto_0
    if-ge v2, v1, :cond_1

    .line 23
    .line 24
    invoke-virtual {p2, v2}, Ljava/lang/String;->charAt(I)C

    .line 25
    .line 26
    .line 27
    move-result v6

    .line 28
    add-int v7, p1, v2

    .line 29
    .line 30
    invoke-virtual {v0, v7}, Ljava/lang/String;->charAt(I)C

    .line 31
    .line 32
    .line 33
    move-result v7

    .line 34
    or-int/lit8 v7, v7, 0x20

    .line 35
    .line 36
    if-ne v6, v7, :cond_0

    .line 37
    .line 38
    add-int/lit8 v2, v2, 0x1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 42
    .line 43
    const-string p2, "Expected valid boolean literal prefix, but had \'"

    .line 44
    .line 45
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0}, Lz91;->h()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p2

    .line 52
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    const/16 p2, 0x27

    .line 56
    .line 57
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-static {p0, p1, v5, v4}, Lz91;->j(Lz91;Ljava/lang/String;II)V

    .line 65
    .line 66
    .line 67
    throw v3

    .line 68
    :cond_1
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 69
    .line 70
    .line 71
    move-result p2

    .line 72
    add-int/2addr p2, p1

    .line 73
    iput p2, p0, Lz91;->a:I

    .line 74
    .line 75
    return-void

    .line 76
    :cond_2
    const-string p1, "Unexpected end of boolean literal"

    .line 77
    .line 78
    invoke-static {p0, p1, v5, v4}, Lz91;->j(Lz91;Ljava/lang/String;II)V

    .line 79
    .line 80
    .line 81
    throw v3
.end method

.method public final d()Ljava/lang/String;
    .locals 14

    .line 1
    const/16 v0, 0x22

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lz91;->e(C)V

    .line 4
    .line 5
    .line 6
    iget v1, p0, Lz91;->a:I

    .line 7
    .line 8
    iget-object v2, p0, Lz91;->e:Ljava/lang/String;

    .line 9
    .line 10
    const/4 v3, 0x4

    .line 11
    invoke-static {v2, v0, v1, v3}, Lda1;->C(Ljava/lang/CharSequence;CII)I

    .line 12
    .line 13
    .line 14
    move-result v4

    .line 15
    const/4 v5, 0x0

    .line 16
    const/4 v6, 0x0

    .line 17
    const/4 v7, 0x1

    .line 18
    const/4 v8, -0x1

    .line 19
    if-eq v4, v8, :cond_c

    .line 20
    .line 21
    move v9, v1

    .line 22
    :goto_0
    if-ge v9, v4, :cond_b

    .line 23
    .line 24
    invoke-virtual {v2, v9}, Ljava/lang/String;->charAt(I)C

    .line 25
    .line 26
    .line 27
    move-result v10

    .line 28
    const/16 v11, 0x5c

    .line 29
    .line 30
    if-ne v10, v11, :cond_a

    .line 31
    .line 32
    iget v1, p0, Lz91;->a:I

    .line 33
    .line 34
    invoke-virtual {v2, v9}, Ljava/lang/String;->charAt(I)C

    .line 35
    .line 36
    .line 37
    move-result v4

    .line 38
    move v10, v6

    .line 39
    :goto_1
    iget-object v12, p0, Lz91;->d:Ljava/lang/StringBuilder;

    .line 40
    .line 41
    if-eq v4, v0, :cond_8

    .line 42
    .line 43
    const-string v13, "Unexpected EOF"

    .line 44
    .line 45
    if-ne v4, v11, :cond_5

    .line 46
    .line 47
    invoke-virtual {v12, v2, v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    add-int/lit8 v9, v9, 0x1

    .line 51
    .line 52
    invoke-virtual {p0, v9}, Lz91;->m(I)I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    const/4 v4, 0x6

    .line 57
    if-eq v1, v8, :cond_4

    .line 58
    .line 59
    add-int/lit8 v9, v1, 0x1

    .line 60
    .line 61
    invoke-virtual {v2, v1}, Ljava/lang/String;->charAt(I)C

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    const/16 v10, 0x75

    .line 66
    .line 67
    if-ne v1, v10, :cond_0

    .line 68
    .line 69
    invoke-virtual {p0, v2, v9}, Lz91;->a(Ljava/lang/CharSequence;I)I

    .line 70
    .line 71
    .line 72
    move-result v9

    .line 73
    goto :goto_3

    .line 74
    :cond_0
    if-ge v1, v10, :cond_1

    .line 75
    .line 76
    sget-object v10, Lvj;->a:[C

    .line 77
    .line 78
    aget-char v10, v10, v1

    .line 79
    .line 80
    goto :goto_2

    .line 81
    :cond_1
    move v10, v6

    .line 82
    :goto_2
    if-eqz v10, :cond_3

    .line 83
    .line 84
    invoke-virtual {v12, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    :goto_3
    invoke-virtual {p0, v9}, Lz91;->m(I)I

    .line 88
    .line 89
    .line 90
    move-result v1

    .line 91
    if-eq v1, v8, :cond_2

    .line 92
    .line 93
    :goto_4
    move v9, v1

    .line 94
    move v10, v7

    .line 95
    goto :goto_5

    .line 96
    :cond_2
    invoke-static {p0, v13, v1, v3}, Lz91;->j(Lz91;Ljava/lang/String;II)V

    .line 97
    .line 98
    .line 99
    throw v5

    .line 100
    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 101
    .line 102
    const-string v2, "Invalid escaped char \'"

    .line 103
    .line 104
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    const/16 v1, 0x27

    .line 111
    .line 112
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    invoke-static {p0, v0, v6, v4}, Lz91;->j(Lz91;Ljava/lang/String;II)V

    .line 120
    .line 121
    .line 122
    throw v5

    .line 123
    :cond_4
    const-string v0, "Expected escape sequence to continue, got EOF"

    .line 124
    .line 125
    invoke-static {p0, v0, v6, v4}, Lz91;->j(Lz91;Ljava/lang/String;II)V

    .line 126
    .line 127
    .line 128
    throw v5

    .line 129
    :cond_5
    add-int/lit8 v9, v9, 0x1

    .line 130
    .line 131
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 132
    .line 133
    .line 134
    move-result v4

    .line 135
    if-lt v9, v4, :cond_7

    .line 136
    .line 137
    invoke-virtual {v12, v2, v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    invoke-virtual {p0, v9}, Lz91;->m(I)I

    .line 141
    .line 142
    .line 143
    move-result v1

    .line 144
    if-eq v1, v8, :cond_6

    .line 145
    .line 146
    goto :goto_4

    .line 147
    :cond_6
    invoke-static {p0, v13, v1, v3}, Lz91;->j(Lz91;Ljava/lang/String;II)V

    .line 148
    .line 149
    .line 150
    throw v5

    .line 151
    :cond_7
    :goto_5
    invoke-virtual {v2, v9}, Ljava/lang/String;->charAt(I)C

    .line 152
    .line 153
    .line 154
    move-result v4

    .line 155
    goto :goto_1

    .line 156
    :cond_8
    if-nez v10, :cond_9

    .line 157
    .line 158
    invoke-virtual {v2, v1, v9}, Ljava/lang/String;->subSequence(II)Ljava/lang/CharSequence;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    goto :goto_6

    .line 167
    :cond_9
    invoke-virtual {v12, v2, v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 168
    .line 169
    .line 170
    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object v0

    .line 174
    invoke-virtual {v12, v6}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 175
    .line 176
    .line 177
    :goto_6
    add-int/2addr v9, v7

    .line 178
    iput v9, p0, Lz91;->a:I

    .line 179
    .line 180
    return-object v0

    .line 181
    :cond_a
    add-int/lit8 v9, v9, 0x1

    .line 182
    .line 183
    goto/16 :goto_0

    .line 184
    .line 185
    :cond_b
    add-int/lit8 v0, v4, 0x1

    .line 186
    .line 187
    iput v0, p0, Lz91;->a:I

    .line 188
    .line 189
    invoke-virtual {v2, v1, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 190
    .line 191
    .line 192
    move-result-object p0

    .line 193
    return-object p0

    .line 194
    :cond_c
    invoke-virtual {p0}, Lz91;->h()Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    invoke-virtual {p0, v7, v6}, Lz91;->k(BZ)V

    .line 198
    .line 199
    .line 200
    throw v5
.end method

.method public e(C)V
    .locals 5

    .line 1
    iget v0, p0, Lz91;->a:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, -0x1

    .line 5
    if-eq v0, v2, :cond_4

    .line 6
    .line 7
    :goto_0
    iget-object v3, p0, Lz91;->e:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    .line 10
    .line 11
    .line 12
    move-result v4

    .line 13
    if-ge v0, v4, :cond_3

    .line 14
    .line 15
    add-int/lit8 v4, v0, 0x1

    .line 16
    .line 17
    invoke-virtual {v3, v0}, Ljava/lang/String;->charAt(I)C

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    const/16 v3, 0x20

    .line 22
    .line 23
    if-eq v0, v3, :cond_2

    .line 24
    .line 25
    const/16 v3, 0xa

    .line 26
    .line 27
    if-eq v0, v3, :cond_2

    .line 28
    .line 29
    const/16 v3, 0xd

    .line 30
    .line 31
    if-eq v0, v3, :cond_2

    .line 32
    .line 33
    const/16 v3, 0x9

    .line 34
    .line 35
    if-ne v0, v3, :cond_0

    .line 36
    .line 37
    goto :goto_1

    .line 38
    :cond_0
    iput v4, p0, Lz91;->a:I

    .line 39
    .line 40
    if-ne v0, p1, :cond_1

    .line 41
    .line 42
    return-void

    .line 43
    :cond_1
    invoke-virtual {p0, p1}, Lz91;->p(C)V

    .line 44
    .line 45
    .line 46
    throw v1

    .line 47
    :cond_2
    :goto_1
    move v0, v4

    .line 48
    goto :goto_0

    .line 49
    :cond_3
    iput v2, p0, Lz91;->a:I

    .line 50
    .line 51
    invoke-virtual {p0, p1}, Lz91;->p(C)V

    .line 52
    .line 53
    .line 54
    throw v1

    .line 55
    :cond_4
    invoke-virtual {p0, p1}, Lz91;->p(C)V

    .line 56
    .line 57
    .line 58
    throw v1
.end method

.method public final f()J
    .locals 24

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-virtual {v0}, Lz91;->n()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-virtual {v0, v1}, Lz91;->m(I)I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    iget-object v2, v0, Lz91;->e:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    const-string v4, "EOF"

    .line 18
    .line 19
    const/4 v5, 0x0

    .line 20
    const/4 v6, 0x6

    .line 21
    const/4 v7, 0x0

    .line 22
    if-ge v1, v3, :cond_1c

    .line 23
    .line 24
    const/4 v3, -0x1

    .line 25
    if-eq v1, v3, :cond_1c

    .line 26
    .line 27
    invoke-virtual {v2, v1}, Ljava/lang/String;->charAt(I)C

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    const/16 v8, 0x22

    .line 32
    .line 33
    if-ne v3, v8, :cond_1

    .line 34
    .line 35
    add-int/lit8 v1, v1, 0x1

    .line 36
    .line 37
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    if-eq v1, v3, :cond_0

    .line 42
    .line 43
    const/4 v3, 0x1

    .line 44
    goto :goto_0

    .line 45
    :cond_0
    invoke-static {v0, v4, v7, v6}, Lz91;->j(Lz91;Ljava/lang/String;II)V

    .line 46
    .line 47
    .line 48
    throw v5

    .line 49
    :cond_1
    move v3, v7

    .line 50
    :goto_0
    move v12, v1

    .line 51
    move-object/from16 v19, v5

    .line 52
    .line 53
    move v11, v7

    .line 54
    move v13, v11

    .line 55
    move v14, v13

    .line 56
    const-wide/16 v9, 0x0

    .line 57
    .line 58
    const-wide/16 v15, 0x0

    .line 59
    .line 60
    const-wide/16 v17, 0x0

    .line 61
    .line 62
    :goto_1
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 63
    .line 64
    .line 65
    move-result v5

    .line 66
    move-wide/from16 v20, v15

    .line 67
    .line 68
    const-string v15, "Numeric value overflow"

    .line 69
    .line 70
    if-eq v12, v5, :cond_e

    .line 71
    .line 72
    invoke-virtual {v2, v12}, Ljava/lang/String;->charAt(I)C

    .line 73
    .line 74
    .line 75
    move-result v5

    .line 76
    const/16 v8, 0x65

    .line 77
    .line 78
    if-eq v5, v8, :cond_2

    .line 79
    .line 80
    const/16 v8, 0x45

    .line 81
    .line 82
    if-ne v5, v8, :cond_4

    .line 83
    .line 84
    :cond_2
    if-nez v13, :cond_4

    .line 85
    .line 86
    if-eq v12, v1, :cond_3

    .line 87
    .line 88
    add-int/lit8 v12, v12, 0x1

    .line 89
    .line 90
    move-wide/from16 v15, v20

    .line 91
    .line 92
    const/16 v8, 0x22

    .line 93
    .line 94
    const/4 v11, 0x1

    .line 95
    const/4 v13, 0x1

    .line 96
    goto :goto_1

    .line 97
    :cond_3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 98
    .line 99
    const-string v2, "Unexpected symbol "

    .line 100
    .line 101
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    const-string v2, " in numeric literal"

    .line 108
    .line 109
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    invoke-static {v0, v1, v7, v6}, Lz91;->j(Lz91;Ljava/lang/String;II)V

    .line 117
    .line 118
    .line 119
    throw v19

    .line 120
    :cond_4
    const-string v8, "Unexpected symbol \'-\' in numeric literal"

    .line 121
    .line 122
    const/16 v6, 0x2d

    .line 123
    .line 124
    if-ne v5, v6, :cond_6

    .line 125
    .line 126
    if-eqz v13, :cond_6

    .line 127
    .line 128
    if-eq v12, v1, :cond_5

    .line 129
    .line 130
    add-int/lit8 v12, v12, 0x1

    .line 131
    .line 132
    move v11, v7

    .line 133
    :goto_2
    move-wide/from16 v15, v20

    .line 134
    .line 135
    const/4 v6, 0x6

    .line 136
    const/16 v8, 0x22

    .line 137
    .line 138
    goto :goto_1

    .line 139
    :cond_5
    const/4 v5, 0x6

    .line 140
    invoke-static {v0, v8, v7, v5}, Lz91;->j(Lz91;Ljava/lang/String;II)V

    .line 141
    .line 142
    .line 143
    throw v19

    .line 144
    :cond_6
    const/16 v6, 0x2b

    .line 145
    .line 146
    if-ne v5, v6, :cond_8

    .line 147
    .line 148
    if-eqz v13, :cond_8

    .line 149
    .line 150
    if-eq v12, v1, :cond_7

    .line 151
    .line 152
    add-int/lit8 v12, v12, 0x1

    .line 153
    .line 154
    move-wide/from16 v15, v20

    .line 155
    .line 156
    const/4 v6, 0x6

    .line 157
    const/16 v8, 0x22

    .line 158
    .line 159
    const/4 v11, 0x1

    .line 160
    goto :goto_1

    .line 161
    :cond_7
    const-string v1, "Unexpected symbol \'+\' in numeric literal"

    .line 162
    .line 163
    const/4 v6, 0x6

    .line 164
    invoke-static {v0, v1, v7, v6}, Lz91;->j(Lz91;Ljava/lang/String;II)V

    .line 165
    .line 166
    .line 167
    throw v19

    .line 168
    :cond_8
    const/16 v6, 0x2d

    .line 169
    .line 170
    if-ne v5, v6, :cond_a

    .line 171
    .line 172
    if-ne v12, v1, :cond_9

    .line 173
    .line 174
    add-int/lit8 v12, v12, 0x1

    .line 175
    .line 176
    move-wide/from16 v15, v20

    .line 177
    .line 178
    const/4 v6, 0x6

    .line 179
    const/16 v8, 0x22

    .line 180
    .line 181
    const/4 v14, 0x1

    .line 182
    goto :goto_1

    .line 183
    :cond_9
    const/4 v5, 0x6

    .line 184
    invoke-static {v0, v8, v7, v5}, Lz91;->j(Lz91;Ljava/lang/String;II)V

    .line 185
    .line 186
    .line 187
    throw v19

    .line 188
    :cond_a
    invoke-static {v5}, Lcg1;->a(C)B

    .line 189
    .line 190
    .line 191
    move-result v6

    .line 192
    if-nez v6, :cond_e

    .line 193
    .line 194
    add-int/lit8 v12, v12, 0x1

    .line 195
    .line 196
    add-int/lit8 v6, v5, -0x30

    .line 197
    .line 198
    if-ltz v6, :cond_d

    .line 199
    .line 200
    const/16 v8, 0xa

    .line 201
    .line 202
    if-ge v6, v8, :cond_d

    .line 203
    .line 204
    const-wide/16 v22, 0xa

    .line 205
    .line 206
    if-eqz v13, :cond_b

    .line 207
    .line 208
    mul-long v9, v9, v22

    .line 209
    .line 210
    int-to-long v5, v6

    .line 211
    add-long/2addr v9, v5

    .line 212
    goto :goto_2

    .line 213
    :cond_b
    mul-long v17, v17, v22

    .line 214
    .line 215
    int-to-long v5, v6

    .line 216
    sub-long v17, v17, v5

    .line 217
    .line 218
    cmp-long v5, v17, v20

    .line 219
    .line 220
    if-gtz v5, :cond_c

    .line 221
    .line 222
    goto :goto_2

    .line 223
    :cond_c
    const/4 v6, 0x6

    .line 224
    invoke-static {v0, v15, v7, v6}, Lz91;->j(Lz91;Ljava/lang/String;II)V

    .line 225
    .line 226
    .line 227
    throw v19

    .line 228
    :cond_d
    const/4 v6, 0x6

    .line 229
    new-instance v1, Ljava/lang/StringBuilder;

    .line 230
    .line 231
    const-string v2, "Unexpected symbol \'"

    .line 232
    .line 233
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 234
    .line 235
    .line 236
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 237
    .line 238
    .line 239
    const-string v2, "\' in numeric literal"

    .line 240
    .line 241
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 242
    .line 243
    .line 244
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 245
    .line 246
    .line 247
    move-result-object v1

    .line 248
    invoke-static {v0, v1, v7, v6}, Lz91;->j(Lz91;Ljava/lang/String;II)V

    .line 249
    .line 250
    .line 251
    throw v19

    .line 252
    :cond_e
    if-eq v12, v1, :cond_f

    .line 253
    .line 254
    const/4 v5, 0x1

    .line 255
    goto :goto_3

    .line 256
    :cond_f
    move v5, v7

    .line 257
    :goto_3
    if-eq v1, v12, :cond_10

    .line 258
    .line 259
    if-eqz v14, :cond_11

    .line 260
    .line 261
    add-int/lit8 v6, v12, -0x1

    .line 262
    .line 263
    if-eq v1, v6, :cond_10

    .line 264
    .line 265
    goto :goto_4

    .line 266
    :cond_10
    const/4 v5, 0x6

    .line 267
    goto/16 :goto_8

    .line 268
    .line 269
    :cond_11
    :goto_4
    if-eqz v3, :cond_14

    .line 270
    .line 271
    if-eqz v5, :cond_13

    .line 272
    .line 273
    invoke-virtual {v2, v12}, Ljava/lang/String;->charAt(I)C

    .line 274
    .line 275
    .line 276
    move-result v1

    .line 277
    const/16 v2, 0x22

    .line 278
    .line 279
    if-ne v1, v2, :cond_12

    .line 280
    .line 281
    add-int/lit8 v12, v12, 0x1

    .line 282
    .line 283
    goto :goto_5

    .line 284
    :cond_12
    const-string v1, "Expected closing quotation mark"

    .line 285
    .line 286
    const/4 v5, 0x6

    .line 287
    invoke-static {v0, v1, v7, v5}, Lz91;->j(Lz91;Ljava/lang/String;II)V

    .line 288
    .line 289
    .line 290
    throw v19

    .line 291
    :cond_13
    const/4 v5, 0x6

    .line 292
    invoke-static {v0, v4, v7, v5}, Lz91;->j(Lz91;Ljava/lang/String;II)V

    .line 293
    .line 294
    .line 295
    throw v19

    .line 296
    :cond_14
    :goto_5
    iput v12, v0, Lz91;->a:I

    .line 297
    .line 298
    move-wide/from16 v1, v17

    .line 299
    .line 300
    if-eqz v13, :cond_19

    .line 301
    .line 302
    long-to-double v1, v1

    .line 303
    const-wide/high16 v3, 0x4024000000000000L    # 10.0

    .line 304
    .line 305
    if-nez v11, :cond_15

    .line 306
    .line 307
    long-to-double v5, v9

    .line 308
    neg-double v5, v5

    .line 309
    invoke-static {v3, v4, v5, v6}, Ljava/lang/Math;->pow(DD)D

    .line 310
    .line 311
    .line 312
    move-result-wide v3

    .line 313
    goto :goto_6

    .line 314
    :cond_15
    const/4 v5, 0x1

    .line 315
    if-ne v11, v5, :cond_18

    .line 316
    .line 317
    long-to-double v5, v9

    .line 318
    invoke-static {v3, v4, v5, v6}, Ljava/lang/Math;->pow(DD)D

    .line 319
    .line 320
    .line 321
    move-result-wide v3

    .line 322
    :goto_6
    mul-double/2addr v1, v3

    .line 323
    const-wide/high16 v3, 0x43e0000000000000L    # 9.223372036854776E18

    .line 324
    .line 325
    cmpl-double v3, v1, v3

    .line 326
    .line 327
    if-gtz v3, :cond_17

    .line 328
    .line 329
    const-wide/high16 v3, -0x3c20000000000000L    # -9.223372036854776E18

    .line 330
    .line 331
    cmpg-double v3, v1, v3

    .line 332
    .line 333
    if-ltz v3, :cond_17

    .line 334
    .line 335
    invoke-static {v1, v2}, Ljava/lang/Math;->floor(D)D

    .line 336
    .line 337
    .line 338
    move-result-wide v3

    .line 339
    cmpg-double v3, v3, v1

    .line 340
    .line 341
    if-nez v3, :cond_16

    .line 342
    .line 343
    double-to-long v10, v1

    .line 344
    goto :goto_7

    .line 345
    :cond_16
    new-instance v3, Ljava/lang/StringBuilder;

    .line 346
    .line 347
    const-string v4, "Can\'t convert "

    .line 348
    .line 349
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 350
    .line 351
    .line 352
    invoke-virtual {v3, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 353
    .line 354
    .line 355
    const-string v1, " to Long"

    .line 356
    .line 357
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 358
    .line 359
    .line 360
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 361
    .line 362
    .line 363
    move-result-object v1

    .line 364
    const/4 v5, 0x6

    .line 365
    invoke-static {v0, v1, v7, v5}, Lz91;->j(Lz91;Ljava/lang/String;II)V

    .line 366
    .line 367
    .line 368
    throw v19

    .line 369
    :cond_17
    const/4 v5, 0x6

    .line 370
    invoke-static {v0, v15, v7, v5}, Lz91;->j(Lz91;Ljava/lang/String;II)V

    .line 371
    .line 372
    .line 373
    throw v19

    .line 374
    :cond_18
    new-instance v0, Lrl;

    .line 375
    .line 376
    invoke-direct {v0}, Lrl;-><init>()V

    .line 377
    .line 378
    .line 379
    throw v0

    .line 380
    :cond_19
    move-wide v10, v1

    .line 381
    :goto_7
    if-eqz v14, :cond_1a

    .line 382
    .line 383
    return-wide v10

    .line 384
    :cond_1a
    const-wide/high16 v1, -0x8000000000000000L

    .line 385
    .line 386
    cmp-long v1, v10, v1

    .line 387
    .line 388
    if-eqz v1, :cond_1b

    .line 389
    .line 390
    neg-long v0, v10

    .line 391
    return-wide v0

    .line 392
    :cond_1b
    const/4 v5, 0x6

    .line 393
    invoke-static {v0, v15, v7, v5}, Lz91;->j(Lz91;Ljava/lang/String;II)V

    .line 394
    .line 395
    .line 396
    throw v19

    .line 397
    :goto_8
    const-string v1, "Expected numeric literal"

    .line 398
    .line 399
    invoke-static {v0, v1, v7, v5}, Lz91;->j(Lz91;Ljava/lang/String;II)V

    .line 400
    .line 401
    .line 402
    throw v19

    .line 403
    :cond_1c
    move-object/from16 v19, v5

    .line 404
    .line 405
    move v5, v6

    .line 406
    invoke-static {v0, v4, v7, v5}, Lz91;->j(Lz91;Ljava/lang/String;II)V

    .line 407
    .line 408
    .line 409
    throw v19
.end method

.method public final g()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Lz91;->c:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    iput-object v1, p0, Lz91;->c:Ljava/lang/String;

    .line 10
    .line 11
    return-object v0

    .line 12
    :cond_0
    invoke-virtual {p0}, Lz91;->d()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public final h()Ljava/lang/String;
    .locals 8

    .line 1
    iget-object v0, p0, Lz91;->c:Ljava/lang/String;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 7
    .line 8
    .line 9
    iput-object v1, p0, Lz91;->c:Ljava/lang/String;

    .line 10
    .line 11
    return-object v0

    .line 12
    :cond_0
    invoke-virtual {p0}, Lz91;->n()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    iget-object v2, p0, Lz91;->e:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    if-ge v0, v3, :cond_7

    .line 23
    .line 24
    const/4 v3, -0x1

    .line 25
    if-eq v0, v3, :cond_7

    .line 26
    .line 27
    invoke-virtual {v2, v0}, Ljava/lang/String;->charAt(I)C

    .line 28
    .line 29
    .line 30
    move-result v4

    .line 31
    invoke-static {v4}, Lcg1;->a(C)B

    .line 32
    .line 33
    .line 34
    move-result v4

    .line 35
    const/4 v5, 0x1

    .line 36
    if-ne v4, v5, :cond_1

    .line 37
    .line 38
    invoke-virtual {p0}, Lz91;->g()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    return-object p0

    .line 43
    :cond_1
    const/4 v6, 0x0

    .line 44
    if-nez v4, :cond_6

    .line 45
    .line 46
    move v1, v6

    .line 47
    :cond_2
    :goto_0
    invoke-virtual {v2, v0}, Ljava/lang/String;->charAt(I)C

    .line 48
    .line 49
    .line 50
    move-result v4

    .line 51
    invoke-static {v4}, Lcg1;->a(C)B

    .line 52
    .line 53
    .line 54
    move-result v4

    .line 55
    iget-object v7, p0, Lz91;->d:Ljava/lang/StringBuilder;

    .line 56
    .line 57
    if-nez v4, :cond_4

    .line 58
    .line 59
    add-int/lit8 v0, v0, 0x1

    .line 60
    .line 61
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 62
    .line 63
    .line 64
    move-result v4

    .line 65
    if-lt v0, v4, :cond_2

    .line 66
    .line 67
    iget v1, p0, Lz91;->a:I

    .line 68
    .line 69
    invoke-virtual {v7, v2, v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0, v0}, Lz91;->m(I)I

    .line 73
    .line 74
    .line 75
    move-result v1

    .line 76
    if-ne v1, v3, :cond_3

    .line 77
    .line 78
    iput v0, p0, Lz91;->a:I

    .line 79
    .line 80
    invoke-virtual {v7, v2, v6, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 88
    .line 89
    .line 90
    return-object p0

    .line 91
    :cond_3
    move v0, v1

    .line 92
    move v1, v5

    .line 93
    goto :goto_0

    .line 94
    :cond_4
    iget v3, p0, Lz91;->a:I

    .line 95
    .line 96
    if-nez v1, :cond_5

    .line 97
    .line 98
    invoke-virtual {v2, v3, v0}, Ljava/lang/String;->subSequence(II)Ljava/lang/CharSequence;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    goto :goto_1

    .line 107
    :cond_5
    invoke-virtual {v7, v2, v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v1

    .line 114
    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 115
    .line 116
    .line 117
    :goto_1
    iput v0, p0, Lz91;->a:I

    .line 118
    .line 119
    return-object v1

    .line 120
    :cond_6
    new-instance v3, Ljava/lang/StringBuilder;

    .line 121
    .line 122
    const-string v4, "Expected beginning of the string, but got "

    .line 123
    .line 124
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {v2, v0}, Ljava/lang/String;->charAt(I)C

    .line 128
    .line 129
    .line 130
    move-result v0

    .line 131
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    const/4 v2, 0x6

    .line 139
    invoke-static {p0, v0, v6, v2}, Lz91;->j(Lz91;Ljava/lang/String;II)V

    .line 140
    .line 141
    .line 142
    throw v1

    .line 143
    :cond_7
    const-string v2, "EOF"

    .line 144
    .line 145
    const/4 v3, 0x4

    .line 146
    invoke-static {p0, v2, v0, v3}, Lz91;->j(Lz91;Ljava/lang/String;II)V

    .line 147
    .line 148
    .line 149
    throw v1
.end method

.method public final i(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 1

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    const-string p2, ""

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const-string v0, "\n"

    .line 14
    .line 15
    invoke-virtual {v0, p2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    invoke-direct {v0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    const-string p1, " at path: "

    .line 25
    .line 26
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Lz91;->b:Lo7;

    .line 30
    .line 31
    invoke-virtual {p1}, Lo7;->d()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    iget-object p0, p0, Lz91;->e:Ljava/lang/String;

    .line 46
    .line 47
    invoke-static {p1, p0, p3}, Lfe1;->d(Ljava/lang/String;Ljava/lang/CharSequence;I)Lvg0;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    throw p0
.end method

.method public final k(BZ)V
    .locals 3

    .line 1
    invoke-static {p1}, Lcg1;->z(B)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget v0, p0, Lz91;->a:I

    .line 6
    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    add-int/lit8 p2, v0, -0x1

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    move p2, v0

    .line 13
    :goto_0
    iget-object v1, p0, Lz91;->e:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    if-eq v0, v2, :cond_2

    .line 20
    .line 21
    if-gez p2, :cond_1

    .line 22
    .line 23
    goto :goto_1

    .line 24
    :cond_1
    invoke-virtual {v1, p2}, Ljava/lang/String;->charAt(I)C

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    invoke-static {v0}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    goto :goto_2

    .line 33
    :cond_2
    :goto_1
    const-string v0, "EOF"

    .line 34
    .line 35
    :goto_2
    new-instance v1, Ljava/lang/StringBuilder;

    .line 36
    .line 37
    const-string v2, "Expected "

    .line 38
    .line 39
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    const-string p1, ", but had \'"

    .line 46
    .line 47
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string p1, "\' instead"

    .line 54
    .line 55
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    const/4 v0, 0x4

    .line 63
    invoke-static {p0, p1, p2, v0}, Lz91;->j(Lz91;Ljava/lang/String;II)V

    .line 64
    .line 65
    .line 66
    const/4 p0, 0x0

    .line 67
    throw p0
.end method

.method public final l(Ljava/lang/CharSequence;I)I
    .locals 1

    .line 1
    invoke-interface {p1, p2}, Ljava/lang/CharSequence;->charAt(I)C

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/16 p2, 0x30

    .line 6
    .line 7
    if-gt p2, p1, :cond_0

    .line 8
    .line 9
    const/16 v0, 0x3a

    .line 10
    .line 11
    if-ge p1, v0, :cond_0

    .line 12
    .line 13
    sub-int/2addr p1, p2

    .line 14
    return p1

    .line 15
    :cond_0
    const/16 p2, 0x61

    .line 16
    .line 17
    if-gt p2, p1, :cond_1

    .line 18
    .line 19
    const/16 p2, 0x67

    .line 20
    .line 21
    if-ge p1, p2, :cond_1

    .line 22
    .line 23
    add-int/lit8 p1, p1, -0x57

    .line 24
    .line 25
    return p1

    .line 26
    :cond_1
    const/16 p2, 0x41

    .line 27
    .line 28
    if-gt p2, p1, :cond_2

    .line 29
    .line 30
    const/16 p2, 0x47

    .line 31
    .line 32
    if-ge p1, p2, :cond_2

    .line 33
    .line 34
    add-int/lit8 p1, p1, -0x37

    .line 35
    .line 36
    return p1

    .line 37
    :cond_2
    new-instance p2, Ljava/lang/StringBuilder;

    .line 38
    .line 39
    const-string v0, "Invalid toHexChar char \'"

    .line 40
    .line 41
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    const-string p1, "\' in unicode escape"

    .line 48
    .line 49
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    const/4 p2, 0x0

    .line 57
    const/4 v0, 0x6

    .line 58
    invoke-static {p0, p1, p2, v0}, Lz91;->j(Lz91;Ljava/lang/String;II)V

    .line 59
    .line 60
    .line 61
    const/4 p0, 0x0

    .line 62
    throw p0
.end method

.method public final m(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Lz91;->e:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-ge p1, p0, :cond_0

    .line 8
    .line 9
    return p1

    .line 10
    :cond_0
    const/4 p0, -0x1

    .line 11
    return p0
.end method

.method public n()I
    .locals 3

    .line 1
    iget v0, p0, Lz91;->a:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    :goto_0
    iget-object v1, p0, Lz91;->e:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    if-ge v0, v2, :cond_2

    .line 14
    .line 15
    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    const/16 v2, 0x20

    .line 20
    .line 21
    if-eq v1, v2, :cond_1

    .line 22
    .line 23
    const/16 v2, 0xa

    .line 24
    .line 25
    if-eq v1, v2, :cond_1

    .line 26
    .line 27
    const/16 v2, 0xd

    .line 28
    .line 29
    if-eq v1, v2, :cond_1

    .line 30
    .line 31
    const/16 v2, 0x9

    .line 32
    .line 33
    if-ne v1, v2, :cond_2

    .line 34
    .line 35
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_2
    iput v0, p0, Lz91;->a:I

    .line 39
    .line 40
    return v0
.end method

.method public final o()Z
    .locals 4

    .line 1
    invoke-virtual {p0}, Lz91;->n()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lz91;->e:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    const/4 v3, 0x0

    .line 12
    if-ge v0, v2, :cond_1

    .line 13
    .line 14
    const/4 v2, -0x1

    .line 15
    if-ne v0, v2, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    const/16 v1, 0x2c

    .line 23
    .line 24
    if-ne v0, v1, :cond_1

    .line 25
    .line 26
    iget v0, p0, Lz91;->a:I

    .line 27
    .line 28
    const/4 v1, 0x1

    .line 29
    add-int/2addr v0, v1

    .line 30
    iput v0, p0, Lz91;->a:I

    .line 31
    .line 32
    return v1

    .line 33
    :cond_1
    :goto_0
    return v3
.end method

.method public final p(C)V
    .locals 4

    .line 1
    iget v0, p0, Lz91;->a:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    if-lez v0, :cond_0

    .line 6
    .line 7
    const/16 v3, 0x22

    .line 8
    .line 9
    if-ne p1, v3, :cond_0

    .line 10
    .line 11
    add-int/lit8 v3, v0, -0x1

    .line 12
    .line 13
    :try_start_0
    iput v3, p0, Lz91;->a:I

    .line 14
    .line 15
    invoke-virtual {p0}, Lz91;->h()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    iput v0, p0, Lz91;->a:I

    .line 20
    .line 21
    const-string v0, "null"

    .line 22
    .line 23
    invoke-static {v3, v0}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    iget p1, p0, Lz91;->a:I

    .line 30
    .line 31
    sub-int/2addr p1, v2

    .line 32
    const-string v0, "Use \'coerceInputValues = true\' in \'Json {}\' builder to coerce nulls if property has a default value."

    .line 33
    .line 34
    const-string v2, "Expected string literal but \'null\' literal was found"

    .line 35
    .line 36
    invoke-virtual {p0, v2, v0, p1}, Lz91;->i(Ljava/lang/String;Ljava/lang/String;I)V

    .line 37
    .line 38
    .line 39
    throw v1

    .line 40
    :catchall_0
    move-exception p1

    .line 41
    iput v0, p0, Lz91;->a:I

    .line 42
    .line 43
    throw p1

    .line 44
    :cond_0
    invoke-static {p1}, Lcg1;->a(C)B

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    invoke-virtual {p0, p1, v2}, Lz91;->k(BZ)V

    .line 49
    .line 50
    .line 51
    throw v1
.end method

.method public final toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "JsonReader(source=\'"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lz91;->e:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "\', currentPosition="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget p0, p0, Lz91;->a:I

    .line 19
    .line 20
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const/16 p0, 0x29

    .line 24
    .line 25
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method
