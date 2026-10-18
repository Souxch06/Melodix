.class public final Lpa2;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public a:Lb12;

.field public b:Ljava/util/ArrayList;

.field public c:Ljava/util/ArrayList;

.field public d:J

.field public final synthetic e:Lsa2;


# direct methods
.method public synthetic constructor <init>(Lsa2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lpa2;->e:Lsa2;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a(JLj02;)Z
    .locals 10

    .line 1
    iget-object v0, p0, Lpa2;->c:Ljava/util/ArrayList;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lpa2;->c:Ljava/util/ArrayList;

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Lpa2;->b:Ljava/util/ArrayList;

    .line 13
    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    new-instance v0, Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Lpa2;->b:Ljava/util/ArrayList;

    .line 22
    .line 23
    :cond_1
    iget-object v0, p0, Lpa2;->c:Ljava/util/ArrayList;

    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    const/4 v1, 0x0

    .line 30
    if-nez v0, :cond_2

    .line 31
    .line 32
    iget-object v0, p0, Lpa2;->c:Ljava/util/ArrayList;

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    check-cast v0, Lj02;

    .line 39
    .line 40
    invoke-virtual {v0}, Lj02;->y()J

    .line 41
    .line 42
    .line 43
    move-result-wide v2

    .line 44
    const-wide/16 v4, 0x3e8

    .line 45
    .line 46
    div-long/2addr v2, v4

    .line 47
    const-wide/16 v6, 0x3c

    .line 48
    .line 49
    div-long/2addr v2, v6

    .line 50
    div-long/2addr v2, v6

    .line 51
    invoke-virtual {p3}, Lj02;->y()J

    .line 52
    .line 53
    .line 54
    move-result-wide v8

    .line 55
    div-long/2addr v8, v4

    .line 56
    div-long/2addr v8, v6

    .line 57
    div-long/2addr v8, v6

    .line 58
    cmp-long v0, v2, v8

    .line 59
    .line 60
    if-eqz v0, :cond_2

    .line 61
    .line 62
    goto/16 :goto_2

    .line 63
    .line 64
    :cond_2
    iget-wide v2, p0, Lpa2;->d:J

    .line 65
    .line 66
    invoke-virtual {p3}, Lnp1;->k()I

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    int-to-long v4, v0

    .line 71
    add-long/2addr v2, v4

    .line 72
    iget-object v0, p0, Lpa2;->e:Lsa2;

    .line 73
    .line 74
    invoke-virtual {v0}, Lsa2;->e0()Lmt1;

    .line 75
    .line 76
    .line 77
    move-result-object v4

    .line 78
    sget-object v5, Lxx1;->Y0:Lwx1;

    .line 79
    .line 80
    const/4 v6, 0x0

    .line 81
    invoke-virtual {v4, v6, v5}, Lmt1;->w(Ljava/lang/String;Lwx1;)Z

    .line 82
    .line 83
    .line 84
    move-result v4

    .line 85
    if-eqz v4, :cond_3

    .line 86
    .line 87
    iget-object v4, p0, Lpa2;->c:Ljava/util/ArrayList;

    .line 88
    .line 89
    invoke-virtual {v4}, Ljava/util/ArrayList;->isEmpty()Z

    .line 90
    .line 91
    .line 92
    move-result v4

    .line 93
    if-nez v4, :cond_4

    .line 94
    .line 95
    invoke-virtual {v0}, Lsa2;->e0()Lmt1;

    .line 96
    .line 97
    .line 98
    sget-object v4, Lxx1;->j:Lwx1;

    .line 99
    .line 100
    invoke-virtual {v4, v6}, Lwx1;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object v4

    .line 104
    check-cast v4, Ljava/lang/Integer;

    .line 105
    .line 106
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 107
    .line 108
    .line 109
    move-result v4

    .line 110
    invoke-static {v1, v4}, Ljava/lang/Math;->max(II)I

    .line 111
    .line 112
    .line 113
    move-result v4

    .line 114
    int-to-long v4, v4

    .line 115
    cmp-long v4, v2, v4

    .line 116
    .line 117
    if-gez v4, :cond_6

    .line 118
    .line 119
    goto :goto_0

    .line 120
    :cond_3
    invoke-virtual {v0}, Lsa2;->e0()Lmt1;

    .line 121
    .line 122
    .line 123
    sget-object v4, Lxx1;->j:Lwx1;

    .line 124
    .line 125
    invoke-virtual {v4, v6}, Lwx1;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    move-result-object v4

    .line 129
    check-cast v4, Ljava/lang/Integer;

    .line 130
    .line 131
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 132
    .line 133
    .line 134
    move-result v4

    .line 135
    invoke-static {v1, v4}, Ljava/lang/Math;->max(II)I

    .line 136
    .line 137
    .line 138
    move-result v4

    .line 139
    int-to-long v4, v4

    .line 140
    cmp-long v4, v2, v4

    .line 141
    .line 142
    if-ltz v4, :cond_4

    .line 143
    .line 144
    goto :goto_2

    .line 145
    :cond_4
    :goto_0
    iput-wide v2, p0, Lpa2;->d:J

    .line 146
    .line 147
    iget-object v2, p0, Lpa2;->c:Ljava/util/ArrayList;

    .line 148
    .line 149
    invoke-virtual {v2, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 150
    .line 151
    .line 152
    iget-object p3, p0, Lpa2;->b:Ljava/util/ArrayList;

    .line 153
    .line 154
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 155
    .line 156
    .line 157
    move-result-object p1

    .line 158
    invoke-virtual {p3, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 159
    .line 160
    .line 161
    iget-object p1, p0, Lpa2;->a:Lb12;

    .line 162
    .line 163
    if-nez p1, :cond_5

    .line 164
    .line 165
    goto :goto_1

    .line 166
    :cond_5
    invoke-virtual {p1}, Lb12;->r()Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object v6

    .line 170
    :goto_1
    iget-object p0, p0, Lpa2;->c:Ljava/util/ArrayList;

    .line 171
    .line 172
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 173
    .line 174
    .line 175
    move-result p0

    .line 176
    invoke-virtual {v0}, Lsa2;->e0()Lmt1;

    .line 177
    .line 178
    .line 179
    move-result-object p1

    .line 180
    sget-object p2, Lxx1;->k:Lwx1;

    .line 181
    .line 182
    invoke-virtual {p1, v6, p2}, Lmt1;->u(Ljava/lang/String;Lwx1;)I

    .line 183
    .line 184
    .line 185
    move-result p1

    .line 186
    const/4 p2, 0x1

    .line 187
    invoke-static {p2, p1}, Ljava/lang/Math;->max(II)I

    .line 188
    .line 189
    .line 190
    move-result p1

    .line 191
    if-lt p0, p1, :cond_7

    .line 192
    .line 193
    :cond_6
    :goto_2
    return v1

    .line 194
    :cond_7
    return p2
.end method
