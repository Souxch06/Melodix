.class public final Ly81;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/util/Iterator;


# instance fields
.field public j:I

.field public k:Ljava/lang/String;

.field public final l:Ljava/lang/String;

.field public final m:Lrs0;

.field public final n:Z

.field public o:I

.field public p:I

.field public final synthetic q:Lpa0;


# direct methods
.method public constructor <init>(Lpa0;La91;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ly81;->q:Lpa0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x2

    .line 7
    iput p1, p0, Ly81;->j:I

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    iput p1, p0, Ly81;->o:I

    .line 11
    .line 12
    iget-object p1, p2, La91;->a:Lrs0;

    .line 13
    .line 14
    iput-object p1, p0, Ly81;->m:Lrs0;

    .line 15
    .line 16
    iget-boolean p1, p2, La91;->b:Z

    .line 17
    .line 18
    iput-boolean p1, p0, Ly81;->n:Z

    .line 19
    .line 20
    iget p1, p2, La91;->d:I

    .line 21
    .line 22
    iput p1, p0, Ly81;->p:I

    .line 23
    .line 24
    iput-object p3, p0, Ly81;->l:Ljava/lang/String;

    .line 25
    .line 26
    return-void
.end method


# virtual methods
.method public final hasNext()Z
    .locals 9

    .line 1
    iget v0, p0, Ly81;->j:I

    .line 2
    .line 3
    const/4 v1, 0x4

    .line 4
    if-eq v0, v1, :cond_d

    .line 5
    .line 6
    invoke-static {v0}, Loq;->t(I)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v2, 0x1

    .line 11
    if-eqz v0, :cond_c

    .line 12
    .line 13
    const/4 v3, 0x2

    .line 14
    if-eq v0, v3, :cond_b

    .line 15
    .line 16
    iput v1, p0, Ly81;->j:I

    .line 17
    .line 18
    iget v0, p0, Ly81;->o:I

    .line 19
    .line 20
    :cond_0
    :goto_0
    iget v1, p0, Ly81;->o:I

    .line 21
    .line 22
    const/4 v3, -0x1

    .line 23
    const/4 v4, 0x3

    .line 24
    if-eq v1, v3, :cond_a

    .line 25
    .line 26
    iget-object v5, p0, Ly81;->q:Lpa0;

    .line 27
    .line 28
    iget-object v5, v5, Lpa0;->k:Ljava/lang/Object;

    .line 29
    .line 30
    check-cast v5, Lwj;

    .line 31
    .line 32
    iget-object v6, p0, Ly81;->l:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    .line 35
    .line 36
    .line 37
    move-result v7

    .line 38
    invoke-static {v1, v7}, Las;->g(II)V

    .line 39
    .line 40
    .line 41
    :goto_1
    if-ge v1, v7, :cond_2

    .line 42
    .line 43
    invoke-virtual {v6, v1}, Ljava/lang/String;->charAt(I)C

    .line 44
    .line 45
    .line 46
    move-result v8

    .line 47
    invoke-virtual {v5, v8}, Lwj;->l(C)Z

    .line 48
    .line 49
    .line 50
    move-result v8

    .line 51
    if-eqz v8, :cond_1

    .line 52
    .line 53
    goto :goto_2

    .line 54
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 55
    .line 56
    goto :goto_1

    .line 57
    :cond_2
    move v1, v3

    .line 58
    :goto_2
    if-ne v1, v3, :cond_3

    .line 59
    .line 60
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    iput v3, p0, Ly81;->o:I

    .line 65
    .line 66
    move v5, v3

    .line 67
    goto :goto_3

    .line 68
    :cond_3
    add-int/lit8 v5, v1, 0x1

    .line 69
    .line 70
    iput v5, p0, Ly81;->o:I

    .line 71
    .line 72
    :goto_3
    if-ne v5, v0, :cond_4

    .line 73
    .line 74
    add-int/lit8 v5, v5, 0x1

    .line 75
    .line 76
    iput v5, p0, Ly81;->o:I

    .line 77
    .line 78
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    if-le v5, v1, :cond_0

    .line 83
    .line 84
    iput v3, p0, Ly81;->o:I

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_4
    :goto_4
    iget-object v5, p0, Ly81;->m:Lrs0;

    .line 88
    .line 89
    if-ge v0, v1, :cond_5

    .line 90
    .line 91
    invoke-virtual {v6, v0}, Ljava/lang/String;->charAt(I)C

    .line 92
    .line 93
    .line 94
    move-result v7

    .line 95
    invoke-virtual {v5, v7}, Lrs0;->l(C)Z

    .line 96
    .line 97
    .line 98
    move-result v7

    .line 99
    if-eqz v7, :cond_5

    .line 100
    .line 101
    add-int/lit8 v0, v0, 0x1

    .line 102
    .line 103
    goto :goto_4

    .line 104
    :cond_5
    :goto_5
    if-le v1, v0, :cond_6

    .line 105
    .line 106
    add-int/lit8 v7, v1, -0x1

    .line 107
    .line 108
    invoke-virtual {v6, v7}, Ljava/lang/String;->charAt(I)C

    .line 109
    .line 110
    .line 111
    move-result v7

    .line 112
    invoke-virtual {v5, v7}, Lrs0;->l(C)Z

    .line 113
    .line 114
    .line 115
    move-result v7

    .line 116
    if-eqz v7, :cond_6

    .line 117
    .line 118
    add-int/lit8 v1, v1, -0x1

    .line 119
    .line 120
    goto :goto_5

    .line 121
    :cond_6
    iget-boolean v7, p0, Ly81;->n:Z

    .line 122
    .line 123
    if-eqz v7, :cond_7

    .line 124
    .line 125
    if-ne v0, v1, :cond_7

    .line 126
    .line 127
    iget v0, p0, Ly81;->o:I

    .line 128
    .line 129
    goto :goto_0

    .line 130
    :cond_7
    iget v7, p0, Ly81;->p:I

    .line 131
    .line 132
    if-ne v7, v2, :cond_8

    .line 133
    .line 134
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    .line 135
    .line 136
    .line 137
    move-result v1

    .line 138
    iput v3, p0, Ly81;->o:I

    .line 139
    .line 140
    :goto_6
    if-le v1, v0, :cond_9

    .line 141
    .line 142
    add-int/lit8 v3, v1, -0x1

    .line 143
    .line 144
    invoke-virtual {v6, v3}, Ljava/lang/String;->charAt(I)C

    .line 145
    .line 146
    .line 147
    move-result v3

    .line 148
    invoke-virtual {v5, v3}, Lrs0;->l(C)Z

    .line 149
    .line 150
    .line 151
    move-result v3

    .line 152
    if-eqz v3, :cond_9

    .line 153
    .line 154
    add-int/lit8 v1, v1, -0x1

    .line 155
    .line 156
    goto :goto_6

    .line 157
    :cond_8
    sub-int/2addr v7, v2

    .line 158
    iput v7, p0, Ly81;->p:I

    .line 159
    .line 160
    :cond_9
    invoke-virtual {v6, v0, v1}, Ljava/lang/String;->subSequence(II)Ljava/lang/CharSequence;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    goto :goto_7

    .line 169
    :cond_a
    iput v4, p0, Ly81;->j:I

    .line 170
    .line 171
    const/4 v0, 0x0

    .line 172
    :goto_7
    iput-object v0, p0, Ly81;->k:Ljava/lang/String;

    .line 173
    .line 174
    iget v0, p0, Ly81;->j:I

    .line 175
    .line 176
    if-eq v0, v4, :cond_b

    .line 177
    .line 178
    iput v2, p0, Ly81;->j:I

    .line 179
    .line 180
    return v2

    .line 181
    :cond_b
    const/4 p0, 0x0

    .line 182
    return p0

    .line 183
    :cond_c
    return v2

    .line 184
    :cond_d
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 185
    .line 186
    invoke-direct {p0}, Ljava/lang/IllegalStateException;-><init>()V

    .line 187
    .line 188
    .line 189
    throw p0
.end method

.method public final next()Ljava/lang/Object;
    .locals 2

    .line 1
    invoke-virtual {p0}, Ly81;->hasNext()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x2

    .line 8
    iput v0, p0, Ly81;->j:I

    .line 9
    .line 10
    iget-object v0, p0, Ly81;->k:Ljava/lang/String;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    iput-object v1, p0, Ly81;->k:Ljava/lang/String;

    .line 14
    .line 15
    return-object v0

    .line 16
    :cond_0
    new-instance p0, Ljava/util/NoSuchElementException;

    .line 17
    .line 18
    invoke-direct {p0}, Ljava/util/NoSuchElementException;-><init>()V

    .line 19
    .line 20
    .line 21
    throw p0
.end method

.method public final remove()V
    .locals 0

    .line 1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    .line 4
    .line 5
    .line 6
    throw p0
.end method
