.class public final Lgc0;
.super Lfc0;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final m:Led0;

.field public n:J

.field public o:Z

.field public final synthetic p:Ljc0;


# direct methods
.method public constructor <init>(Ljc0;Led0;)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lgc0;->p:Ljc0;

    .line 5
    .line 6
    invoke-direct {p0, p1}, Lfc0;-><init>(Ljc0;)V

    .line 7
    .line 8
    .line 9
    iput-object p2, p0, Lgc0;->m:Led0;

    .line 10
    .line 11
    const-wide/16 p1, -0x1

    .line 12
    .line 13
    iput-wide p1, p0, Lgc0;->n:J

    .line 14
    .line 15
    const/4 p1, 0x1

    .line 16
    iput-boolean p1, p0, Lgc0;->o:Z

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public final c(JLeh;)J
    .locals 9

    .line 1
    iget-object p1, p0, Lgc0;->p:Ljc0;

    .line 2
    .line 3
    iget-object p2, p1, Ljc0;->c:Llh;

    .line 4
    .line 5
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    iget-boolean v0, p0, Lfc0;->k:Z

    .line 9
    .line 10
    const-wide/16 v1, 0x0

    .line 11
    .line 12
    if-nez v0, :cond_9

    .line 13
    .line 14
    iget-boolean v0, p0, Lgc0;->o:Z

    .line 15
    .line 16
    const-wide/16 v3, -0x1

    .line 17
    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    goto/16 :goto_2

    .line 21
    .line 22
    :cond_0
    iget-wide v5, p0, Lgc0;->n:J

    .line 23
    .line 24
    cmp-long v0, v5, v1

    .line 25
    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    cmp-long v0, v5, v3

    .line 29
    .line 30
    if-nez v0, :cond_6

    .line 31
    .line 32
    :cond_1
    const-string v0, "expected chunk size and optional extensions but was \""

    .line 33
    .line 34
    cmp-long v5, v5, v3

    .line 35
    .line 36
    if-eqz v5, :cond_2

    .line 37
    .line 38
    invoke-interface {p2}, Llh;->f()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    :cond_2
    :try_start_0
    invoke-interface {p2}, Llh;->q()J

    .line 42
    .line 43
    .line 44
    move-result-wide v5

    .line 45
    iput-wide v5, p0, Lgc0;->n:J

    .line 46
    .line 47
    invoke-interface {p2}, Llh;->f()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p2

    .line 51
    invoke-static {p2}, Lda1;->Q(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 52
    .line 53
    .line 54
    move-result-object p2

    .line 55
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    iget-wide v5, p0, Lgc0;->n:J

    .line 60
    .line 61
    cmp-long v5, v5, v1

    .line 62
    .line 63
    if-ltz v5, :cond_8

    .line 64
    .line 65
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 66
    .line 67
    .line 68
    move-result v5

    .line 69
    const/4 v6, 0x0

    .line 70
    if-lez v5, :cond_3

    .line 71
    .line 72
    const-string v5, ";"

    .line 73
    .line 74
    invoke-static {p2, v5, v6}, Lla1;->x(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 75
    .line 76
    .line 77
    move-result v5
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 78
    if-eqz v5, :cond_8

    .line 79
    .line 80
    :cond_3
    iget-wide v7, p0, Lgc0;->n:J

    .line 81
    .line 82
    cmp-long p2, v7, v1

    .line 83
    .line 84
    if-nez p2, :cond_5

    .line 85
    .line 86
    iput-boolean v6, p0, Lgc0;->o:Z

    .line 87
    .line 88
    iget-object p2, p1, Ljc0;->f:Ldk;

    .line 89
    .line 90
    new-instance v0, Lrb0;

    .line 91
    .line 92
    invoke-direct {v0}, Lrb0;-><init>()V

    .line 93
    .line 94
    .line 95
    :goto_0
    iget-object v1, p2, Ldk;->l:Ljava/lang/Object;

    .line 96
    .line 97
    check-cast v1, Llh;

    .line 98
    .line 99
    iget-wide v5, p2, Ldk;->k:J

    .line 100
    .line 101
    invoke-interface {v1, v5, v6}, Llh;->k(J)Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    iget-wide v5, p2, Ldk;->k:J

    .line 106
    .line 107
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 108
    .line 109
    .line 110
    move-result v2

    .line 111
    int-to-long v7, v2

    .line 112
    sub-long/2addr v5, v7

    .line 113
    iput-wide v5, p2, Ldk;->k:J

    .line 114
    .line 115
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 116
    .line 117
    .line 118
    move-result v2

    .line 119
    if-nez v2, :cond_4

    .line 120
    .line 121
    invoke-virtual {v0}, Lrb0;->c()Lsb0;

    .line 122
    .line 123
    .line 124
    move-result-object p2

    .line 125
    iput-object p2, p1, Ljc0;->g:Lsb0;

    .line 126
    .line 127
    iget-object p2, p1, Ljc0;->a:Lmr0;

    .line 128
    .line 129
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 130
    .line 131
    .line 132
    iget-object p2, p1, Ljc0;->g:Lsb0;

    .line 133
    .line 134
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 135
    .line 136
    .line 137
    iget-object v0, p0, Lgc0;->m:Led0;

    .line 138
    .line 139
    invoke-static {v0, p2}, Lcd0;->b(Led0;Lsb0;)V

    .line 140
    .line 141
    .line 142
    invoke-virtual {p0}, Lfc0;->a()V

    .line 143
    .line 144
    .line 145
    goto :goto_1

    .line 146
    :cond_4
    invoke-virtual {v0, v1}, Lrb0;->a(Ljava/lang/String;)V

    .line 147
    .line 148
    .line 149
    goto :goto_0

    .line 150
    :cond_5
    :goto_1
    iget-boolean p2, p0, Lgc0;->o:Z

    .line 151
    .line 152
    if-nez p2, :cond_6

    .line 153
    .line 154
    :goto_2
    return-wide v3

    .line 155
    :cond_6
    iget-wide v0, p0, Lgc0;->n:J

    .line 156
    .line 157
    const-wide/16 v5, 0x2000

    .line 158
    .line 159
    invoke-static {v5, v6, v0, v1}, Ljava/lang/Math;->min(JJ)J

    .line 160
    .line 161
    .line 162
    move-result-wide v0

    .line 163
    invoke-super {p0, v0, v1, p3}, Lfc0;->c(JLeh;)J

    .line 164
    .line 165
    .line 166
    move-result-wide p2

    .line 167
    cmp-long v0, p2, v3

    .line 168
    .line 169
    if-eqz v0, :cond_7

    .line 170
    .line 171
    iget-wide v0, p0, Lgc0;->n:J

    .line 172
    .line 173
    sub-long/2addr v0, p2

    .line 174
    iput-wide v0, p0, Lgc0;->n:J

    .line 175
    .line 176
    return-wide p2

    .line 177
    :cond_7
    iget-object p1, p1, Ljc0;->b:Lzx0;

    .line 178
    .line 179
    invoke-virtual {p1}, Lzx0;->k()V

    .line 180
    .line 181
    .line 182
    new-instance p1, Ljava/net/ProtocolException;

    .line 183
    .line 184
    const-string p2, "unexpected end of stream"

    .line 185
    .line 186
    invoke-direct {p1, p2}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    .line 187
    .line 188
    .line 189
    invoke-virtual {p0}, Lfc0;->a()V

    .line 190
    .line 191
    .line 192
    throw p1

    .line 193
    :cond_8
    :try_start_1
    new-instance p1, Ljava/net/ProtocolException;

    .line 194
    .line 195
    new-instance p3, Ljava/lang/StringBuilder;

    .line 196
    .line 197
    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 198
    .line 199
    .line 200
    iget-wide v0, p0, Lgc0;->n:J

    .line 201
    .line 202
    invoke-virtual {p3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 203
    .line 204
    .line 205
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 206
    .line 207
    .line 208
    const/16 p0, 0x22

    .line 209
    .line 210
    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 211
    .line 212
    .line 213
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 214
    .line 215
    .line 216
    move-result-object p0

    .line 217
    invoke-direct {p1, p0}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    .line 218
    .line 219
    .line 220
    throw p1
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_0

    .line 221
    :catch_0
    move-exception p0

    .line 222
    new-instance p1, Ljava/net/ProtocolException;

    .line 223
    .line 224
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 225
    .line 226
    .line 227
    move-result-object p0

    .line 228
    invoke-direct {p1, p0}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    .line 229
    .line 230
    .line 231
    throw p1

    .line 232
    :cond_9
    const-string p0, "closed"

    .line 233
    .line 234
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 235
    .line 236
    .line 237
    return-wide v1
.end method

.method public final close()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lfc0;->k:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-boolean v0, p0, Lgc0;->o:Z

    .line 7
    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    sget-object v0, Ljg1;->a:[B

    .line 11
    .line 12
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 15
    .line 16
    .line 17
    const/16 v0, 0x64

    .line 18
    .line 19
    :try_start_0
    invoke-static {p0, v0}, Ljg1;->n(Lp81;I)Z

    .line 20
    .line 21
    .line 22
    move-result v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 23
    goto :goto_0

    .line 24
    :catch_0
    const/4 v0, 0x0

    .line 25
    :goto_0
    if-nez v0, :cond_1

    .line 26
    .line 27
    iget-object v0, p0, Lgc0;->p:Ljc0;

    .line 28
    .line 29
    iget-object v0, v0, Ljc0;->b:Lzx0;

    .line 30
    .line 31
    invoke-virtual {v0}, Lzx0;->k()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Lfc0;->a()V

    .line 35
    .line 36
    .line 37
    :cond_1
    const/4 v0, 0x1

    .line 38
    iput-boolean v0, p0, Lfc0;->k:Z

    .line 39
    .line 40
    return-void
.end method
