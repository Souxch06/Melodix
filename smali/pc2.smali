.class public final Lpc2;
.super Lms1;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final l:Z

.field public final m:Z

.field public final synthetic n:Li32;


# direct methods
.method public constructor <init>(Li32;ZZ)V
    .locals 0

    .line 1
    iput-object p1, p0, Lpc2;->n:Li32;

    .line 2
    .line 3
    const-string p1, "log"

    .line 4
    .line 5
    invoke-direct {p0, p1}, Lms1;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iput-boolean p2, p0, Lpc2;->l:Z

    .line 9
    .line 10
    iput-boolean p3, p0, Lpc2;->m:Z

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final a(Ler0;Ljava/util/List;)Lst1;
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    const-string v3, "log"

    .line 8
    .line 9
    const/4 v4, 0x1

    .line 10
    invoke-static {v3, v4, v2}, Lbe2;->M(Ljava/lang/String;ILjava/util/List;)V

    .line 11
    .line 12
    .line 13
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    const/4 v5, 0x0

    .line 18
    sget-object v6, Lst1;->b:Lzt1;

    .line 19
    .line 20
    iget-object v7, v0, Lpc2;->n:Li32;

    .line 21
    .line 22
    if-ne v3, v4, :cond_0

    .line 23
    .line 24
    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    check-cast v2, Lst1;

    .line 29
    .line 30
    iget-object v3, v1, Ler0;->l:Ljava/lang/Object;

    .line 31
    .line 32
    check-cast v3, Lxn0;

    .line 33
    .line 34
    invoke-virtual {v3, v1, v2}, Lxn0;->A(Ler0;Lst1;)Lst1;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-interface {v1}, Lst1;->e()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v10

    .line 42
    sget-object v11, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 43
    .line 44
    iget-object v1, v7, Li32;->m:Ljava/lang/Object;

    .line 45
    .line 46
    move-object v8, v1

    .line 47
    check-cast v8, Lny0;

    .line 48
    .line 49
    const/4 v9, 0x3

    .line 50
    iget-boolean v12, v0, Lpc2;->l:Z

    .line 51
    .line 52
    iget-boolean v13, v0, Lpc2;->m:Z

    .line 53
    .line 54
    invoke-virtual/range {v8 .. v13}, Lny0;->w(ILjava/lang/String;Ljava/util/List;ZZ)V

    .line 55
    .line 56
    .line 57
    return-object v6

    .line 58
    :cond_0
    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    check-cast v3, Lst1;

    .line 63
    .line 64
    iget-object v5, v1, Ler0;->l:Ljava/lang/Object;

    .line 65
    .line 66
    check-cast v5, Lxn0;

    .line 67
    .line 68
    iget-object v8, v1, Ler0;->l:Ljava/lang/Object;

    .line 69
    .line 70
    check-cast v8, Lxn0;

    .line 71
    .line 72
    invoke-virtual {v5, v1, v3}, Lxn0;->A(Ler0;Lst1;)Lst1;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    invoke-interface {v3}, Lst1;->f()Ljava/lang/Double;

    .line 77
    .line 78
    .line 79
    move-result-object v3

    .line 80
    invoke-virtual {v3}, Ljava/lang/Double;->doubleValue()D

    .line 81
    .line 82
    .line 83
    move-result-wide v9

    .line 84
    invoke-static {v9, v10}, Lbe2;->S(D)I

    .line 85
    .line 86
    .line 87
    move-result v3

    .line 88
    const/4 v5, 0x5

    .line 89
    const/4 v9, 0x2

    .line 90
    if-eq v3, v9, :cond_4

    .line 91
    .line 92
    const/4 v10, 0x3

    .line 93
    if-eq v3, v10, :cond_3

    .line 94
    .line 95
    if-eq v3, v5, :cond_2

    .line 96
    .line 97
    const/4 v11, 0x6

    .line 98
    if-eq v3, v11, :cond_1

    .line 99
    .line 100
    :goto_0
    move v12, v10

    .line 101
    goto :goto_1

    .line 102
    :cond_1
    move v12, v9

    .line 103
    goto :goto_1

    .line 104
    :cond_2
    move v12, v5

    .line 105
    goto :goto_1

    .line 106
    :cond_3
    move v12, v4

    .line 107
    goto :goto_1

    .line 108
    :cond_4
    const/4 v10, 0x4

    .line 109
    goto :goto_0

    .line 110
    :goto_1
    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    move-result-object v3

    .line 114
    check-cast v3, Lst1;

    .line 115
    .line 116
    invoke-virtual {v8, v1, v3}, Lxn0;->A(Ler0;Lst1;)Lst1;

    .line 117
    .line 118
    .line 119
    move-result-object v3

    .line 120
    invoke-interface {v3}, Lst1;->e()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v13

    .line 124
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 125
    .line 126
    .line 127
    move-result v3

    .line 128
    if-ne v3, v9, :cond_5

    .line 129
    .line 130
    sget-object v14, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 131
    .line 132
    iget-object v1, v7, Li32;->m:Ljava/lang/Object;

    .line 133
    .line 134
    move-object v11, v1

    .line 135
    check-cast v11, Lny0;

    .line 136
    .line 137
    iget-boolean v15, v0, Lpc2;->l:Z

    .line 138
    .line 139
    iget-boolean v0, v0, Lpc2;->m:Z

    .line 140
    .line 141
    move/from16 v16, v0

    .line 142
    .line 143
    invoke-virtual/range {v11 .. v16}, Lny0;->w(ILjava/lang/String;Ljava/util/List;ZZ)V

    .line 144
    .line 145
    .line 146
    return-object v6

    .line 147
    :cond_5
    new-instance v14, Ljava/util/ArrayList;

    .line 148
    .line 149
    invoke-direct {v14}, Ljava/util/ArrayList;-><init>()V

    .line 150
    .line 151
    .line 152
    :goto_2
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 153
    .line 154
    .line 155
    move-result v3

    .line 156
    invoke-static {v3, v5}, Ljava/lang/Math;->min(II)I

    .line 157
    .line 158
    .line 159
    move-result v3

    .line 160
    if-ge v9, v3, :cond_6

    .line 161
    .line 162
    invoke-interface {v2, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 163
    .line 164
    .line 165
    move-result-object v3

    .line 166
    check-cast v3, Lst1;

    .line 167
    .line 168
    invoke-virtual {v8, v1, v3}, Lxn0;->A(Ler0;Lst1;)Lst1;

    .line 169
    .line 170
    .line 171
    move-result-object v3

    .line 172
    invoke-interface {v3}, Lst1;->e()Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object v3

    .line 176
    invoke-virtual {v14, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 177
    .line 178
    .line 179
    add-int/lit8 v9, v9, 0x1

    .line 180
    .line 181
    goto :goto_2

    .line 182
    :cond_6
    iget-object v1, v7, Li32;->m:Ljava/lang/Object;

    .line 183
    .line 184
    move-object v11, v1

    .line 185
    check-cast v11, Lny0;

    .line 186
    .line 187
    iget-boolean v15, v0, Lpc2;->l:Z

    .line 188
    .line 189
    iget-boolean v0, v0, Lpc2;->m:Z

    .line 190
    .line 191
    move/from16 v16, v0

    .line 192
    .line 193
    invoke-virtual/range {v11 .. v16}, Lny0;->w(ILjava/lang/String;Ljava/util/List;ZZ)V

    .line 194
    .line 195
    .line 196
    return-object v6
.end method
