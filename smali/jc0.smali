.class public final Ljc0;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lo10;


# instance fields
.field public final a:Lmr0;

.field public final b:Lzx0;

.field public final c:Llh;

.field public final d:Lkh;

.field public e:I

.field public final f:Ldk;

.field public g:Lsb0;


# direct methods
.method public constructor <init>(Lmr0;Lzx0;Lsx0;Lrx0;)V
    .locals 0

    .line 1
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Ljc0;->a:Lmr0;

    .line 11
    .line 12
    iput-object p2, p0, Ljc0;->b:Lzx0;

    .line 13
    .line 14
    iput-object p3, p0, Ljc0;->c:Llh;

    .line 15
    .line 16
    iput-object p4, p0, Ljc0;->d:Lkh;

    .line 17
    .line 18
    new-instance p1, Ldk;

    .line 19
    .line 20
    invoke-direct {p1, p3}, Ldk;-><init>(Llh;)V

    .line 21
    .line 22
    .line 23
    iput-object p1, p0, Ljc0;->f:Ldk;

    .line 24
    .line 25
    return-void
.end method


# virtual methods
.method public final a(Lm01;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ljc0;->b:Lzx0;

    .line 2
    .line 3
    iget-object v0, v0, Lzx0;->b:Ly11;

    .line 4
    .line 5
    iget-object v0, v0, Ly11;->b:Ljava/net/Proxy;

    .line 6
    .line 7
    invoke-virtual {v0}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    new-instance v1, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 17
    .line 18
    .line 19
    iget-object v2, p1, Lm01;->b:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    const/16 v2, 0x20

    .line 25
    .line 26
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    iget-object v2, p1, Lm01;->a:Led0;

    .line 30
    .line 31
    iget-boolean v3, v2, Led0;->i:Z

    .line 32
    .line 33
    if-nez v3, :cond_0

    .line 34
    .line 35
    sget-object v3, Ljava/net/Proxy$Type;->HTTP:Ljava/net/Proxy$Type;

    .line 36
    .line 37
    if-ne v0, v3, :cond_0

    .line 38
    .line 39
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    invoke-virtual {v2}, Led0;->b()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {v2}, Led0;->d()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    if-eqz v2, :cond_1

    .line 52
    .line 53
    new-instance v3, Ljava/lang/StringBuilder;

    .line 54
    .line 55
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    const/16 v0, 0x3f

    .line 59
    .line 60
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    :cond_1
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    :goto_0
    const-string v0, " HTTP/1.1"

    .line 74
    .line 75
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    iget-object p1, p1, Lm01;->c:Lsb0;

    .line 83
    .line 84
    invoke-virtual {p0, p1, v0}, Ljc0;->i(Lsb0;Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    return-void
.end method

.method public final b(Lf11;)Lp81;
    .locals 9

    .line 1
    invoke-static {p1}, Lcd0;->a(Lf11;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-wide/16 v0, 0x0

    .line 8
    .line 9
    invoke-virtual {p0, v0, v1}, Ljc0;->h(J)Lhc0;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_0
    const-string v0, "Transfer-Encoding"

    .line 15
    .line 16
    invoke-static {p1, v0}, Lf11;->g(Lf11;Ljava/lang/String;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "chunked"

    .line 21
    .line 22
    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    const/4 v1, 0x0

    .line 27
    const-string v2, "state: "

    .line 28
    .line 29
    const/4 v3, 0x5

    .line 30
    const/4 v4, 0x4

    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    iget-object p1, p1, Lf11;->j:Lm01;

    .line 34
    .line 35
    iget-object p1, p1, Lm01;->a:Led0;

    .line 36
    .line 37
    iget v0, p0, Ljc0;->e:I

    .line 38
    .line 39
    if-ne v0, v4, :cond_1

    .line 40
    .line 41
    iput v3, p0, Ljc0;->e:I

    .line 42
    .line 43
    new-instance v0, Lgc0;

    .line 44
    .line 45
    invoke-direct {v0, p0, p1}, Lgc0;-><init>(Ljc0;Led0;)V

    .line 46
    .line 47
    .line 48
    return-object v0

    .line 49
    :cond_1
    iget p0, p0, Ljc0;->e:I

    .line 50
    .line 51
    invoke-static {p0, v2}, Lo40;->f(ILjava/lang/String;)V

    .line 52
    .line 53
    .line 54
    return-object v1

    .line 55
    :cond_2
    invoke-static {p1}, Ljg1;->h(Lf11;)J

    .line 56
    .line 57
    .line 58
    move-result-wide v5

    .line 59
    const-wide/16 v7, -0x1

    .line 60
    .line 61
    cmp-long p1, v5, v7

    .line 62
    .line 63
    if-eqz p1, :cond_3

    .line 64
    .line 65
    invoke-virtual {p0, v5, v6}, Ljc0;->h(J)Lhc0;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    return-object p0

    .line 70
    :cond_3
    iget p1, p0, Ljc0;->e:I

    .line 71
    .line 72
    if-ne p1, v4, :cond_4

    .line 73
    .line 74
    iput v3, p0, Ljc0;->e:I

    .line 75
    .line 76
    iget-object p1, p0, Ljc0;->b:Lzx0;

    .line 77
    .line 78
    invoke-virtual {p1}, Lzx0;->k()V

    .line 79
    .line 80
    .line 81
    new-instance p1, Lic0;

    .line 82
    .line 83
    invoke-direct {p1, p0}, Lfc0;-><init>(Ljc0;)V

    .line 84
    .line 85
    .line 86
    return-object p1

    .line 87
    :cond_4
    iget p0, p0, Ljc0;->e:I

    .line 88
    .line 89
    invoke-static {p0, v2}, Lo40;->f(ILjava/lang/String;)V

    .line 90
    .line 91
    .line 92
    return-object v1
.end method

.method public final c()V
    .locals 0

    .line 1
    iget-object p0, p0, Ljc0;->d:Lkh;

    .line 2
    .line 3
    invoke-interface {p0}, Lkh;->flush()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final cancel()V
    .locals 0

    .line 1
    iget-object p0, p0, Ljc0;->b:Lzx0;

    .line 2
    .line 3
    iget-object p0, p0, Lzx0;->c:Ljava/net/Socket;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-static {p0}, Ljg1;->c(Ljava/net/Socket;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public final d()V
    .locals 0

    .line 1
    iget-object p0, p0, Ljc0;->d:Lkh;

    .line 2
    .line 3
    invoke-interface {p0}, Lkh;->flush()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final e(Lf11;)J
    .locals 1

    .line 1
    invoke-static {p1}, Lcd0;->a(Lf11;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const-wide/16 p0, 0x0

    .line 8
    .line 9
    return-wide p0

    .line 10
    :cond_0
    const-string p0, "Transfer-Encoding"

    .line 11
    .line 12
    invoke-static {p1, p0}, Lf11;->g(Lf11;Ljava/lang/String;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const-string v0, "chunked"

    .line 17
    .line 18
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-eqz p0, :cond_1

    .line 23
    .line 24
    const-wide/16 p0, -0x1

    .line 25
    .line 26
    return-wide p0

    .line 27
    :cond_1
    invoke-static {p1}, Ljg1;->h(Lf11;)J

    .line 28
    .line 29
    .line 30
    move-result-wide p0

    .line 31
    return-wide p0
.end method

.method public final f(Z)Le11;
    .locals 12

    .line 1
    iget-object v0, p0, Ljc0;->f:Ldk;

    .line 2
    .line 3
    iget-object v1, v0, Ldk;->l:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v1, Llh;

    .line 6
    .line 7
    iget v2, p0, Ljc0;->e:I

    .line 8
    .line 9
    const/4 v3, 0x1

    .line 10
    const/4 v4, 0x0

    .line 11
    const/4 v5, 0x3

    .line 12
    if-eq v2, v3, :cond_1

    .line 13
    .line 14
    const/4 v3, 0x2

    .line 15
    if-eq v2, v3, :cond_1

    .line 16
    .line 17
    if-ne v2, v5, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const-string p1, "state: "

    .line 21
    .line 22
    iget p0, p0, Ljc0;->e:I

    .line 23
    .line 24
    invoke-static {p0, p1}, Lo40;->f(ILjava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-object v4

    .line 28
    :cond_1
    :goto_0
    :try_start_0
    iget-wide v2, v0, Ldk;->k:J

    .line 29
    .line 30
    invoke-interface {v1, v2, v3}, Llh;->k(J)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    iget-wide v6, v0, Ldk;->k:J

    .line 35
    .line 36
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    int-to-long v8, v3

    .line 41
    sub-long/2addr v6, v8

    .line 42
    iput-wide v6, v0, Ldk;->k:J

    .line 43
    .line 44
    invoke-static {v2}, Les0;->l(Ljava/lang/String;)Lo7;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    iget v3, v2, Lo7;->b:I

    .line 49
    .line 50
    new-instance v6, Le11;

    .line 51
    .line 52
    invoke-direct {v6}, Le11;-><init>()V

    .line 53
    .line 54
    .line 55
    iget-object v7, v2, Lo7;->c:Ljava/lang/Object;

    .line 56
    .line 57
    check-cast v7, Liw0;

    .line 58
    .line 59
    iput-object v7, v6, Le11;->b:Liw0;

    .line 60
    .line 61
    iput v3, v6, Le11;->c:I

    .line 62
    .line 63
    iget-object v2, v2, Lo7;->d:Ljava/lang/Object;

    .line 64
    .line 65
    check-cast v2, Ljava/lang/String;

    .line 66
    .line 67
    iput-object v2, v6, Le11;->d:Ljava/lang/String;

    .line 68
    .line 69
    new-instance v2, Lrb0;

    .line 70
    .line 71
    invoke-direct {v2}, Lrb0;-><init>()V

    .line 72
    .line 73
    .line 74
    :goto_1
    iget-wide v7, v0, Ldk;->k:J

    .line 75
    .line 76
    invoke-interface {v1, v7, v8}, Llh;->k(J)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v7

    .line 80
    iget-wide v8, v0, Ldk;->k:J

    .line 81
    .line 82
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    .line 83
    .line 84
    .line 85
    move-result v10

    .line 86
    int-to-long v10, v10

    .line 87
    sub-long/2addr v8, v10

    .line 88
    iput-wide v8, v0, Ldk;->k:J

    .line 89
    .line 90
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    .line 91
    .line 92
    .line 93
    move-result v8

    .line 94
    if-nez v8, :cond_5

    .line 95
    .line 96
    invoke-virtual {v2}, Lrb0;->c()Lsb0;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    invoke-virtual {v0}, Lsb0;->d()Lrb0;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    iput-object v0, v6, Le11;->f:Lrb0;

    .line 105
    .line 106
    const/16 v0, 0x64

    .line 107
    .line 108
    if-eqz p1, :cond_2

    .line 109
    .line 110
    if-ne v3, v0, :cond_2

    .line 111
    .line 112
    return-object v4

    .line 113
    :cond_2
    if-ne v3, v0, :cond_3

    .line 114
    .line 115
    iput v5, p0, Ljc0;->e:I

    .line 116
    .line 117
    return-object v6

    .line 118
    :catch_0
    move-exception p1

    .line 119
    goto :goto_2

    .line 120
    :cond_3
    const/16 p1, 0x66

    .line 121
    .line 122
    if-gt p1, v3, :cond_4

    .line 123
    .line 124
    const/16 p1, 0xc8

    .line 125
    .line 126
    if-ge v3, p1, :cond_4

    .line 127
    .line 128
    iput v5, p0, Ljc0;->e:I

    .line 129
    .line 130
    return-object v6

    .line 131
    :cond_4
    const/4 p1, 0x4

    .line 132
    iput p1, p0, Ljc0;->e:I

    .line 133
    .line 134
    return-object v6

    .line 135
    :cond_5
    invoke-virtual {v2, v7}, Lrb0;->a(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_0} :catch_0

    .line 136
    .line 137
    .line 138
    goto :goto_1

    .line 139
    :goto_2
    iget-object p0, p0, Ljc0;->b:Lzx0;

    .line 140
    .line 141
    iget-object p0, p0, Lzx0;->b:Ly11;

    .line 142
    .line 143
    iget-object p0, p0, Ly11;->a:Lt3;

    .line 144
    .line 145
    iget-object p0, p0, Lt3;->f:Led0;

    .line 146
    .line 147
    const-string v0, "/..."

    .line 148
    .line 149
    :try_start_1
    new-instance v1, Ldd0;

    .line 150
    .line 151
    invoke-direct {v1}, Ldd0;-><init>()V

    .line 152
    .line 153
    .line 154
    invoke-virtual {v1, p0, v0}, Ldd0;->c(Led0;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_1

    .line 155
    .line 156
    .line 157
    move-object v4, v1

    .line 158
    :catch_1
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 159
    .line 160
    .line 161
    const-string p0, ""

    .line 162
    .line 163
    const/4 v0, 0x0

    .line 164
    const-string v1, " \"\':;<=>@[]^`{}|/\\?#"

    .line 165
    .line 166
    const/16 v2, 0xfb

    .line 167
    .line 168
    invoke-static {p0, v0, v0, v1, v2}, Lok0;->m(Ljava/lang/String;IILjava/lang/String;I)Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object v3

    .line 172
    iput-object v3, v4, Ldd0;->b:Ljava/lang/String;

    .line 173
    .line 174
    invoke-static {p0, v0, v0, v1, v2}, Lok0;->m(Ljava/lang/String;IILjava/lang/String;I)Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object p0

    .line 178
    iput-object p0, v4, Ldd0;->c:Ljava/lang/String;

    .line 179
    .line 180
    invoke-virtual {v4}, Ldd0;->a()Led0;

    .line 181
    .line 182
    .line 183
    move-result-object p0

    .line 184
    iget-object p0, p0, Led0;->h:Ljava/lang/String;

    .line 185
    .line 186
    new-instance v0, Ljava/io/IOException;

    .line 187
    .line 188
    const-string v1, "unexpected end of stream on "

    .line 189
    .line 190
    invoke-virtual {v1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 191
    .line 192
    .line 193
    move-result-object p0

    .line 194
    invoke-direct {v0, p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 195
    .line 196
    .line 197
    throw v0
.end method

.method public final g()Lzx0;
    .locals 0

    .line 1
    iget-object p0, p0, Ljc0;->b:Lzx0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final h(J)Lhc0;
    .locals 2

    .line 1
    iget v0, p0, Ljc0;->e:I

    .line 2
    .line 3
    const/4 v1, 0x4

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    const/4 v0, 0x5

    .line 7
    iput v0, p0, Ljc0;->e:I

    .line 8
    .line 9
    new-instance v0, Lhc0;

    .line 10
    .line 11
    invoke-direct {v0, p0, p1, p2}, Lhc0;-><init>(Ljc0;J)V

    .line 12
    .line 13
    .line 14
    return-object v0

    .line 15
    :cond_0
    const-string p1, "state: "

    .line 16
    .line 17
    iget p0, p0, Ljc0;->e:I

    .line 18
    .line 19
    invoke-static {p0, p1}, Lo40;->f(ILjava/lang/String;)V

    .line 20
    .line 21
    .line 22
    const/4 p0, 0x0

    .line 23
    return-object p0
.end method

.method public final i(Lsb0;Ljava/lang/String;)V
    .locals 5

    .line 1
    iget v0, p0, Ljc0;->e:I

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Ljc0;->d:Lkh;

    .line 6
    .line 7
    invoke-interface {v0, p2}, Lkh;->o(Ljava/lang/String;)Lkh;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    const-string v1, "\r\n"

    .line 12
    .line 13
    invoke-interface {p2, v1}, Lkh;->o(Ljava/lang/String;)Lkh;

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1}, Lsb0;->size()I

    .line 17
    .line 18
    .line 19
    move-result p2

    .line 20
    const/4 v2, 0x0

    .line 21
    :goto_0
    if-ge v2, p2, :cond_0

    .line 22
    .line 23
    invoke-virtual {p1, v2}, Lsb0;->c(I)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    invoke-interface {v0, v3}, Lkh;->o(Ljava/lang/String;)Lkh;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    const-string v4, ": "

    .line 32
    .line 33
    invoke-interface {v3, v4}, Lkh;->o(Ljava/lang/String;)Lkh;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    invoke-virtual {p1, v2}, Lsb0;->e(I)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    invoke-interface {v3, v4}, Lkh;->o(Ljava/lang/String;)Lkh;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    invoke-interface {v3, v1}, Lkh;->o(Ljava/lang/String;)Lkh;

    .line 46
    .line 47
    .line 48
    add-int/lit8 v2, v2, 0x1

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_0
    invoke-interface {v0, v1}, Lkh;->o(Ljava/lang/String;)Lkh;

    .line 52
    .line 53
    .line 54
    const/4 p1, 0x1

    .line 55
    iput p1, p0, Ljc0;->e:I

    .line 56
    .line 57
    return-void

    .line 58
    :cond_1
    const-string p1, "state: "

    .line 59
    .line 60
    iget p0, p0, Ljc0;->e:I

    .line 61
    .line 62
    invoke-static {p0, p1}, Lo40;->f(ILjava/lang/String;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method
