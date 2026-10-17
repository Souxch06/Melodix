.class public final Lwo1;
.super Lvo1;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final l:[B


# direct methods
.method public constructor <init>([B)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lxo1;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Lwo1;->l:[B

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final b(I)B
    .locals 0

    .line 1
    iget-object p0, p0, Lwo1;->l:[B

    .line 2
    .line 3
    aget-byte p0, p0, p1

    .line 4
    .line 5
    return p0
.end method

.method public final c()I
    .locals 0

    .line 1
    iget-object p0, p0, Lwo1;->l:[B

    .line 2
    .line 3
    array-length p0, p0

    .line 4
    return p0
.end method

.method public final d(II)Lvo1;
    .locals 1

    .line 1
    iget-object p0, p0, Lwo1;->l:[B

    .line 2
    .line 3
    array-length p1, p0

    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-static {v0, p2, p1}, Lxo1;->q(III)I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    sget-object p0, Lxo1;->k:Lwo1;

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    new-instance p2, Luo1;

    .line 15
    .line 16
    invoke-direct {p2, p0, v0, p1}, Luo1;-><init>([BII)V

    .line 17
    .line 18
    .line 19
    return-object p2
.end method

.method public final e(I[B)V
    .locals 1

    .line 1
    iget-object p0, p0, Lwo1;->l:[B

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, v0, p2, v0, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final f(Lfp1;)V
    .locals 2

    .line 1
    iget-object p0, p0, Lwo1;->l:[B

    .line 2
    .line 3
    array-length v0, p0

    .line 4
    const/4 v1, 0x0

    .line 5
    invoke-virtual {p1, p0, v1, v0}, Lfp1;->c([BII)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final h(Lxo1;)Z
    .locals 6

    .line 1
    instance-of v0, p1, Lwo1;

    .line 2
    .line 3
    iget-object v1, p0, Lwo1;->l:[B

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    check-cast p1, Lwo1;

    .line 8
    .line 9
    iget-object p0, p1, Lwo1;->l:[B

    .line 10
    .line 11
    invoke-static {v1, p0}, Ljava/util/Arrays;->equals([B[B)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_0
    instance-of v2, p1, Luo1;

    .line 17
    .line 18
    if-eqz v2, :cond_5

    .line 19
    .line 20
    move-object v3, p1

    .line 21
    check-cast v3, Luo1;

    .line 22
    .line 23
    iget v4, v3, Luo1;->n:I

    .line 24
    .line 25
    array-length v5, v1

    .line 26
    if-gt v5, v4, :cond_4

    .line 27
    .line 28
    if-gt v5, v4, :cond_3

    .line 29
    .line 30
    const/4 v4, 0x0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    check-cast p1, Lwo1;

    .line 34
    .line 35
    iget-object p0, p1, Lwo1;->l:[B

    .line 36
    .line 37
    invoke-static {v4, v4, v5, v1, p0}, Lxo1;->r(III[B[B)Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    return p0

    .line 42
    :cond_1
    if-eqz v2, :cond_2

    .line 43
    .line 44
    iget-object p0, v3, Luo1;->l:[B

    .line 45
    .line 46
    iget p1, v3, Luo1;->m:I

    .line 47
    .line 48
    invoke-static {v4, p1, v5, v1, p0}, Lxo1;->r(III[B[B)Z

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    return p0

    .line 53
    :cond_2
    invoke-virtual {p1, v4, v5}, Lxo1;->d(II)Lvo1;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-virtual {p0, v4, v5}, Lwo1;->d(II)Lvo1;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {p1, p0}, Lxo1;->equals(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result p0

    .line 65
    return p0

    .line 66
    :cond_3
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 67
    .line 68
    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 73
    .line 74
    .line 75
    move-result p1

    .line 76
    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    add-int/lit8 p1, p1, 0x1b

    .line 81
    .line 82
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    add-int/2addr p1, v0

    .line 87
    new-instance v0, Ljava/lang/StringBuilder;

    .line 88
    .line 89
    invoke-direct {v0, p1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 90
    .line 91
    .line 92
    const-string p1, "Ran off end of other: 0, "

    .line 93
    .line 94
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    const-string p1, ", "

    .line 101
    .line 102
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    throw p0

    .line 116
    :cond_4
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 117
    .line 118
    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 123
    .line 124
    .line 125
    move-result p1

    .line 126
    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    add-int/lit8 p1, p1, 0x12

    .line 131
    .line 132
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 133
    .line 134
    .line 135
    move-result v0

    .line 136
    add-int/2addr p1, v0

    .line 137
    new-instance v0, Ljava/lang/StringBuilder;

    .line 138
    .line 139
    invoke-direct {v0, p1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 140
    .line 141
    .line 142
    const-string p1, "Length too large: "

    .line 143
    .line 144
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 148
    .line 149
    .line 150
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object p1

    .line 157
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 158
    .line 159
    .line 160
    throw p0

    .line 161
    :cond_5
    invoke-virtual {p1, p0}, Lxo1;->h(Lxo1;)Z

    .line 162
    .line 163
    .line 164
    move-result p0

    .line 165
    return p0
.end method

.method public final j(II)I
    .locals 1

    .line 1
    iget-object p0, p0, Lwo1;->l:[B

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p1, p0, v0, p2}, Lwp1;->a(I[BII)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    return p0
.end method
