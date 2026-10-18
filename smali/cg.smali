.class public final Lcg;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:[C

.field public final c:I

.field public final d:I

.field public final e:I

.field public final f:I

.field public final g:[B


# direct methods
.method public constructor <init>(Ljava/lang/String;[C)V
    .locals 8

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcg;->a:Ljava/lang/String;

    .line 5
    .line 6
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 7
    .line 8
    .line 9
    iput-object p2, p0, Lcg;->b:[C

    .line 10
    .line 11
    :try_start_0
    array-length p1, p2

    .line 12
    sget-object v0, Ljava/math/RoundingMode;->UNNECESSARY:Ljava/math/RoundingMode;

    .line 13
    .line 14
    invoke-static {p1}, Lbv;->k(I)I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    iput p1, p0, Lcg;->d:I
    :try_end_0
    .catch Ljava/lang/ArithmeticException; {:try_start_0 .. :try_end_0} :catch_1

    .line 19
    .line 20
    invoke-static {p1}, Ljava/lang/Integer;->lowestOneBit(I)I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    const/16 v1, 0x8

    .line 25
    .line 26
    invoke-static {v1, v0}, Ljava/lang/Math;->min(II)I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    :try_start_1
    div-int/2addr v1, v0

    .line 31
    iput v1, p0, Lcg;->e:I

    .line 32
    .line 33
    div-int/2addr p1, v0

    .line 34
    iput p1, p0, Lcg;->f:I
    :try_end_1
    .catch Ljava/lang/ArithmeticException; {:try_start_1 .. :try_end_1} :catch_0

    .line 35
    .line 36
    array-length p1, p2

    .line 37
    const/4 v0, 0x1

    .line 38
    sub-int/2addr p1, v0

    .line 39
    iput p1, p0, Lcg;->c:I

    .line 40
    .line 41
    const/16 p1, 0x80

    .line 42
    .line 43
    new-array v1, p1, [B

    .line 44
    .line 45
    const/4 v2, -0x1

    .line 46
    invoke-static {v1, v2}, Ljava/util/Arrays;->fill([BB)V

    .line 47
    .line 48
    .line 49
    const/4 v3, 0x0

    .line 50
    move v4, v3

    .line 51
    :goto_0
    array-length v5, p2

    .line 52
    if-ge v4, v5, :cond_4

    .line 53
    .line 54
    aget-char v5, p2, v4

    .line 55
    .line 56
    if-ge v5, p1, :cond_0

    .line 57
    .line 58
    move v6, v0

    .line 59
    goto :goto_1

    .line 60
    :cond_0
    move v6, v3

    .line 61
    :goto_1
    const/4 v7, 0x0

    .line 62
    if-eqz v6, :cond_3

    .line 63
    .line 64
    aget-byte v6, v1, v5

    .line 65
    .line 66
    if-ne v6, v2, :cond_1

    .line 67
    .line 68
    move v6, v0

    .line 69
    goto :goto_2

    .line 70
    :cond_1
    move v6, v3

    .line 71
    :goto_2
    if-eqz v6, :cond_2

    .line 72
    .line 73
    int-to-byte v6, v4

    .line 74
    aput-byte v6, v1, v5

    .line 75
    .line 76
    add-int/lit8 v4, v4, 0x1

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_2
    invoke-static {v5}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    const-string p1, "Duplicate character: %s"

    .line 88
    .line 89
    invoke-static {p1, p0}, Lfe1;->t(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    throw v7

    .line 97
    :cond_3
    invoke-static {v5}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    const-string p1, "Non-ASCII character: %s"

    .line 106
    .line 107
    invoke-static {p1, p0}, Lfe1;->t(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    throw v7

    .line 115
    :cond_4
    iput-object v1, p0, Lcg;->g:[B

    .line 116
    .line 117
    iget p1, p0, Lcg;->e:I

    .line 118
    .line 119
    new-array p1, p1, [Z

    .line 120
    .line 121
    :goto_3
    iget p2, p0, Lcg;->f:I

    .line 122
    .line 123
    if-ge v3, p2, :cond_5

    .line 124
    .line 125
    mul-int/lit8 p2, v3, 0x8

    .line 126
    .line 127
    iget v1, p0, Lcg;->d:I

    .line 128
    .line 129
    sget-object v2, Ljava/math/RoundingMode;->CEILING:Ljava/math/RoundingMode;

    .line 130
    .line 131
    invoke-static {p2, v1}, Lbv;->g(II)I

    .line 132
    .line 133
    .line 134
    move-result p2

    .line 135
    aput-boolean v0, p1, p2

    .line 136
    .line 137
    add-int/lit8 v3, v3, 0x1

    .line 138
    .line 139
    goto :goto_3

    .line 140
    :cond_5
    return-void

    .line 141
    :catch_0
    move-exception p0

    .line 142
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 143
    .line 144
    new-instance v0, Ljava/lang/String;

    .line 145
    .line 146
    invoke-direct {v0, p2}, Ljava/lang/String;-><init>([C)V

    .line 147
    .line 148
    .line 149
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 150
    .line 151
    .line 152
    move-result p2

    .line 153
    const-string v1, "Illegal alphabet "

    .line 154
    .line 155
    if-eqz p2, :cond_6

    .line 156
    .line 157
    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object p2

    .line 161
    goto :goto_4

    .line 162
    :cond_6
    new-instance p2, Ljava/lang/String;

    .line 163
    .line 164
    invoke-direct {p2, v1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    .line 165
    .line 166
    .line 167
    :goto_4
    invoke-direct {p1, p2, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 168
    .line 169
    .line 170
    throw p1

    .line 171
    :catch_1
    move-exception p0

    .line 172
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 173
    .line 174
    array-length p2, p2

    .line 175
    new-instance v0, Ljava/lang/StringBuilder;

    .line 176
    .line 177
    const/16 v1, 0x23

    .line 178
    .line 179
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 180
    .line 181
    .line 182
    const-string v1, "Illegal alphabet length "

    .line 183
    .line 184
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 185
    .line 186
    .line 187
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 188
    .line 189
    .line 190
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 191
    .line 192
    .line 193
    move-result-object p2

    .line 194
    invoke-direct {p1, p2, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 195
    .line 196
    .line 197
    throw p1
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .locals 1

    .line 1
    instance-of v0, p1, Lcg;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcg;

    .line 6
    .line 7
    iget-object p0, p0, Lcg;->b:[C

    .line 8
    .line 9
    iget-object p1, p1, Lcg;->b:[C

    .line 10
    .line 11
    invoke-static {p0, p1}, Ljava/util/Arrays;->equals([C[C)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method public final hashCode()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcg;->b:[C

    .line 2
    .line 3
    invoke-static {p0}, Ljava/util/Arrays;->hashCode([C)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final toString()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcg;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
