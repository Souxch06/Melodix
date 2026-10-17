.class public final Lzx0;
.super Lmc0;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final b:Ly11;

.field public c:Ljava/net/Socket;

.field public d:Ljava/net/Socket;

.field public e:Lnb0;

.field public f:Liw0;

.field public g:Ltc0;

.field public h:Lsx0;

.field public i:Lrx0;

.field public j:Z

.field public k:Z

.field public l:I

.field public m:I

.field public n:I

.field public o:I

.field public final p:Ljava/util/ArrayList;

.field public q:J


# direct methods
.method public constructor <init>(Lxe0;Ly11;)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    .line 6
    .line 7
    iput-object p2, p0, Lzx0;->b:Ly11;

    .line 8
    .line 9
    const/4 p1, 0x1

    .line 10
    iput p1, p0, Lzx0;->o:I

    .line 11
    .line 12
    new-instance p1, Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object p1, p0, Lzx0;->p:Ljava/util/ArrayList;

    .line 18
    .line 19
    const-wide p1, 0x7fffffffffffffffL

    .line 20
    .line 21
    .line 22
    .line 23
    .line 24
    iput-wide p1, p0, Lzx0;->q:J

    .line 25
    .line 26
    return-void
.end method

.method public static d(Lmr0;Ly11;Ljava/io/IOException;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    iget-object v0, p1, Ly11;->b:Ljava/net/Proxy;

    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    sget-object v1, Ljava/net/Proxy$Type;->DIRECT:Ljava/net/Proxy$Type;

    .line 17
    .line 18
    if-eq v0, v1, :cond_0

    .line 19
    .line 20
    iget-object v0, p1, Ly11;->a:Lt3;

    .line 21
    .line 22
    iget-object v1, v0, Lt3;->e:Ljava/net/ProxySelector;

    .line 23
    .line 24
    iget-object v0, v0, Lt3;->f:Led0;

    .line 25
    .line 26
    invoke-virtual {v0}, Led0;->g()Ljava/net/URI;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget-object v2, p1, Ly11;->b:Ljava/net/Proxy;

    .line 31
    .line 32
    invoke-virtual {v2}, Ljava/net/Proxy;->address()Ljava/net/SocketAddress;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-virtual {v1, v0, v2, p2}, Ljava/net/ProxySelector;->connectFailed(Ljava/net/URI;Ljava/net/SocketAddress;Ljava/io/IOException;)V

    .line 37
    .line 38
    .line 39
    :cond_0
    iget-object p0, p0, Lmr0;->u:Lpa0;

    .line 40
    .line 41
    monitor-enter p0

    .line 42
    :try_start_0
    iget-object p2, p0, Lpa0;->k:Ljava/lang/Object;

    .line 43
    .line 44
    check-cast p2, Ljava/util/LinkedHashSet;

    .line 45
    .line 46
    invoke-interface {p2, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 47
    .line 48
    .line 49
    monitor-exit p0

    .line 50
    return-void

    .line 51
    :catchall_0
    move-exception p1

    .line 52
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 53
    throw p1
.end method


# virtual methods
.method public final declared-synchronized a(Ltc0;Lo51;)V
    .locals 0

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 3
    .line 4
    .line 5
    iget p1, p2, Lo51;->a:I

    .line 6
    .line 7
    and-int/lit8 p1, p1, 0x10

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p1, p2, Lo51;->b:[I

    .line 12
    .line 13
    const/4 p2, 0x4

    .line 14
    aget p1, p1, p2

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const p1, 0x7fffffff

    .line 18
    .line 19
    .line 20
    :goto_0
    iput p1, p0, Lzx0;->o:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 21
    .line 22
    monitor-exit p0

    .line 23
    return-void

    .line 24
    :catchall_0
    move-exception p1

    .line 25
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 26
    throw p1
.end method

.method public final b(Lad0;)V
    .locals 1

    .line 1
    const/16 p0, 0x8

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p1, p0, v0}, Lad0;->c(ILjava/io/IOException;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final c(Lhi;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lzx0;->f:Liw0;

    .line 2
    .line 3
    if-nez v0, :cond_e

    .line 4
    .line 5
    iget-object v0, p0, Lzx0;->b:Ly11;

    .line 6
    .line 7
    iget-object v0, v0, Ly11;->a:Lt3;

    .line 8
    .line 9
    iget-object v1, v0, Lt3;->h:Ljava/util/List;

    .line 10
    .line 11
    new-instance v2, Lso;

    .line 12
    .line 13
    invoke-direct {v2, v1}, Lso;-><init>(Ljava/util/List;)V

    .line 14
    .line 15
    .line 16
    iget-object v3, v0, Lt3;->b:Ljavax/net/ssl/SSLSocketFactory;

    .line 17
    .line 18
    if-nez v3, :cond_2

    .line 19
    .line 20
    sget-object v0, Lro;->f:Lro;

    .line 21
    .line 22
    invoke-interface {v1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    iget-object v0, p0, Lzx0;->b:Ly11;

    .line 29
    .line 30
    iget-object v0, v0, Ly11;->a:Lt3;

    .line 31
    .line 32
    iget-object v0, v0, Lt3;->f:Led0;

    .line 33
    .line 34
    iget-object v0, v0, Led0;->d:Ljava/lang/String;

    .line 35
    .line 36
    sget-object v1, Lgt0;->a:Lgt0;

    .line 37
    .line 38
    sget-object v1, Lgt0;->a:Lgt0;

    .line 39
    .line 40
    invoke-virtual {v1, v0}, Lgt0;->h(Ljava/lang/String;)Z

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    if-eqz v1, :cond_0

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    new-instance p0, Lz11;

    .line 48
    .line 49
    new-instance p1, Ljava/net/UnknownServiceException;

    .line 50
    .line 51
    const-string v1, "CLEARTEXT communication to "

    .line 52
    .line 53
    const-string v2, " not permitted by network security policy"

    .line 54
    .line 55
    invoke-static {v1, v0, v2}, Loq;->j(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-direct {p1, v0}, Ljava/net/UnknownServiceException;-><init>(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    invoke-direct {p0, p1}, Lz11;-><init>(Ljava/io/IOException;)V

    .line 63
    .line 64
    .line 65
    throw p0

    .line 66
    :cond_1
    new-instance p0, Lz11;

    .line 67
    .line 68
    new-instance p1, Ljava/net/UnknownServiceException;

    .line 69
    .line 70
    const-string v0, "CLEARTEXT communication not enabled for client"

    .line 71
    .line 72
    invoke-direct {p1, v0}, Ljava/net/UnknownServiceException;-><init>(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    invoke-direct {p0, p1}, Lz11;-><init>(Ljava/io/IOException;)V

    .line 76
    .line 77
    .line 78
    throw p0

    .line 79
    :cond_2
    iget-object v0, v0, Lt3;->g:Ljava/util/List;

    .line 80
    .line 81
    sget-object v1, Liw0;->o:Liw0;

    .line 82
    .line 83
    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    if-nez v0, :cond_d

    .line 88
    .line 89
    :goto_0
    const/4 v0, 0x0

    .line 90
    move-object v1, v0

    .line 91
    :goto_1
    const/4 v3, 0x1

    .line 92
    :try_start_0
    iget-object v4, p0, Lzx0;->b:Ly11;

    .line 93
    .line 94
    iget-object v5, v4, Ly11;->a:Lt3;

    .line 95
    .line 96
    iget-object v5, v5, Lt3;->b:Ljavax/net/ssl/SSLSocketFactory;

    .line 97
    .line 98
    if-eqz v5, :cond_3

    .line 99
    .line 100
    iget-object v4, v4, Ly11;->b:Ljava/net/Proxy;

    .line 101
    .line 102
    invoke-virtual {v4}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    .line 103
    .line 104
    .line 105
    move-result-object v4

    .line 106
    sget-object v5, Ljava/net/Proxy$Type;->HTTP:Ljava/net/Proxy$Type;

    .line 107
    .line 108
    if-ne v4, v5, :cond_3

    .line 109
    .line 110
    move v4, v3

    .line 111
    goto :goto_2

    .line 112
    :cond_3
    const/4 v4, 0x0

    .line 113
    :goto_2
    if-eqz v4, :cond_4

    .line 114
    .line 115
    invoke-virtual {p0, p1}, Lzx0;->f(Lhi;)V

    .line 116
    .line 117
    .line 118
    iget-object v4, p0, Lzx0;->c:Ljava/net/Socket;

    .line 119
    .line 120
    if-nez v4, :cond_5

    .line 121
    .line 122
    goto :goto_3

    .line 123
    :catch_0
    move-exception v4

    .line 124
    goto :goto_5

    .line 125
    :cond_4
    invoke-virtual {p0, p1}, Lzx0;->e(Lhi;)V

    .line 126
    .line 127
    .line 128
    :cond_5
    invoke-virtual {p0, v2, p1}, Lzx0;->g(Lso;Lhi;)V

    .line 129
    .line 130
    .line 131
    iget-object v4, p0, Lzx0;->b:Ly11;

    .line 132
    .line 133
    iget-object v4, v4, Ly11;->c:Ljava/net/InetSocketAddress;

    .line 134
    .line 135
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 136
    .line 137
    .line 138
    :goto_3
    iget-object p1, p0, Lzx0;->b:Ly11;

    .line 139
    .line 140
    iget-object v0, p1, Ly11;->a:Lt3;

    .line 141
    .line 142
    iget-object v0, v0, Lt3;->b:Ljavax/net/ssl/SSLSocketFactory;

    .line 143
    .line 144
    if-eqz v0, :cond_7

    .line 145
    .line 146
    iget-object p1, p1, Ly11;->b:Ljava/net/Proxy;

    .line 147
    .line 148
    invoke-virtual {p1}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    sget-object v0, Ljava/net/Proxy$Type;->HTTP:Ljava/net/Proxy$Type;

    .line 153
    .line 154
    if-ne p1, v0, :cond_7

    .line 155
    .line 156
    iget-object p1, p0, Lzx0;->c:Ljava/net/Socket;

    .line 157
    .line 158
    if-eqz p1, :cond_6

    .line 159
    .line 160
    goto :goto_4

    .line 161
    :cond_6
    new-instance p0, Lz11;

    .line 162
    .line 163
    new-instance p1, Ljava/net/ProtocolException;

    .line 164
    .line 165
    const-string v0, "Too many tunnel connections attempted: 21"

    .line 166
    .line 167
    invoke-direct {p1, v0}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    .line 168
    .line 169
    .line 170
    invoke-direct {p0, p1}, Lz11;-><init>(Ljava/io/IOException;)V

    .line 171
    .line 172
    .line 173
    throw p0

    .line 174
    :cond_7
    :goto_4
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 175
    .line 176
    .line 177
    move-result-wide v0

    .line 178
    iput-wide v0, p0, Lzx0;->q:J

    .line 179
    .line 180
    return-void

    .line 181
    :goto_5
    iget-object v5, p0, Lzx0;->d:Ljava/net/Socket;

    .line 182
    .line 183
    if-eqz v5, :cond_8

    .line 184
    .line 185
    invoke-static {v5}, Ljg1;->c(Ljava/net/Socket;)V

    .line 186
    .line 187
    .line 188
    :cond_8
    iget-object v5, p0, Lzx0;->c:Ljava/net/Socket;

    .line 189
    .line 190
    if-eqz v5, :cond_9

    .line 191
    .line 192
    invoke-static {v5}, Ljg1;->c(Ljava/net/Socket;)V

    .line 193
    .line 194
    .line 195
    :cond_9
    iput-object v0, p0, Lzx0;->d:Ljava/net/Socket;

    .line 196
    .line 197
    iput-object v0, p0, Lzx0;->c:Ljava/net/Socket;

    .line 198
    .line 199
    iput-object v0, p0, Lzx0;->h:Lsx0;

    .line 200
    .line 201
    iput-object v0, p0, Lzx0;->i:Lrx0;

    .line 202
    .line 203
    iput-object v0, p0, Lzx0;->e:Lnb0;

    .line 204
    .line 205
    iput-object v0, p0, Lzx0;->f:Liw0;

    .line 206
    .line 207
    iput-object v0, p0, Lzx0;->g:Ltc0;

    .line 208
    .line 209
    iput v3, p0, Lzx0;->o:I

    .line 210
    .line 211
    iget-object v5, p0, Lzx0;->b:Ly11;

    .line 212
    .line 213
    iget-object v5, v5, Ly11;->c:Ljava/net/InetSocketAddress;

    .line 214
    .line 215
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 216
    .line 217
    .line 218
    if-nez v1, :cond_a

    .line 219
    .line 220
    new-instance v1, Lz11;

    .line 221
    .line 222
    invoke-direct {v1, v4}, Lz11;-><init>(Ljava/io/IOException;)V

    .line 223
    .line 224
    .line 225
    goto :goto_6

    .line 226
    :cond_a
    iget-object v5, v1, Lz11;->j:Ljava/io/IOException;

    .line 227
    .line 228
    invoke-static {v5, v4}, Lbv;->b(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    .line 229
    .line 230
    .line 231
    iput-object v4, v1, Lz11;->k:Ljava/io/IOException;

    .line 232
    .line 233
    :goto_6
    iput-boolean v3, v2, Lso;->c:Z

    .line 234
    .line 235
    iget-boolean v3, v2, Lso;->b:Z

    .line 236
    .line 237
    if-eqz v3, :cond_c

    .line 238
    .line 239
    instance-of v3, v4, Ljava/net/ProtocolException;

    .line 240
    .line 241
    if-nez v3, :cond_c

    .line 242
    .line 243
    instance-of v3, v4, Ljava/io/InterruptedIOException;

    .line 244
    .line 245
    if-nez v3, :cond_c

    .line 246
    .line 247
    instance-of v3, v4, Ljavax/net/ssl/SSLHandshakeException;

    .line 248
    .line 249
    if-eqz v3, :cond_b

    .line 250
    .line 251
    invoke-virtual {v4}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 252
    .line 253
    .line 254
    move-result-object v3

    .line 255
    instance-of v3, v3, Ljava/security/cert/CertificateException;

    .line 256
    .line 257
    if-nez v3, :cond_c

    .line 258
    .line 259
    :cond_b
    instance-of v3, v4, Ljavax/net/ssl/SSLPeerUnverifiedException;

    .line 260
    .line 261
    if-nez v3, :cond_c

    .line 262
    .line 263
    instance-of v3, v4, Ljavax/net/ssl/SSLException;

    .line 264
    .line 265
    if-eqz v3, :cond_c

    .line 266
    .line 267
    goto/16 :goto_1

    .line 268
    .line 269
    :cond_c
    throw v1

    .line 270
    :cond_d
    new-instance p0, Lz11;

    .line 271
    .line 272
    new-instance p1, Ljava/net/UnknownServiceException;

    .line 273
    .line 274
    const-string v0, "H2_PRIOR_KNOWLEDGE cannot be used with HTTPS"

    .line 275
    .line 276
    invoke-direct {p1, v0}, Ljava/net/UnknownServiceException;-><init>(Ljava/lang/String;)V

    .line 277
    .line 278
    .line 279
    invoke-direct {p0, p1}, Lz11;-><init>(Ljava/io/IOException;)V

    .line 280
    .line 281
    .line 282
    throw p0

    .line 283
    :cond_e
    const-string p0, "already connected"

    .line 284
    .line 285
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 286
    .line 287
    .line 288
    return-void
.end method

.method public final e(Lhi;)V
    .locals 4

    .line 1
    iget-object p1, p0, Lzx0;->b:Ly11;

    .line 2
    .line 3
    iget-object v0, p1, Ly11;->b:Ljava/net/Proxy;

    .line 4
    .line 5
    iget-object p1, p1, Ly11;->a:Lt3;

    .line 6
    .line 7
    invoke-virtual {v0}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    const/4 v1, -0x1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    sget-object v2, Lxx0;->a:[I

    .line 16
    .line 17
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    aget v1, v2, v1

    .line 22
    .line 23
    :goto_0
    const/4 v2, 0x1

    .line 24
    if-eq v1, v2, :cond_1

    .line 25
    .line 26
    const/4 v3, 0x2

    .line 27
    if-eq v1, v3, :cond_1

    .line 28
    .line 29
    new-instance p1, Ljava/net/Socket;

    .line 30
    .line 31
    invoke-direct {p1, v0}, Ljava/net/Socket;-><init>(Ljava/net/Proxy;)V

    .line 32
    .line 33
    .line 34
    goto :goto_1

    .line 35
    :cond_1
    iget-object p1, p1, Lt3;->a:Ljavax/net/SocketFactory;

    .line 36
    .line 37
    invoke-virtual {p1}, Ljavax/net/SocketFactory;->createSocket()Ljava/net/Socket;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 42
    .line 43
    .line 44
    :goto_1
    iput-object p1, p0, Lzx0;->c:Ljava/net/Socket;

    .line 45
    .line 46
    iget-object v0, p0, Lzx0;->b:Ly11;

    .line 47
    .line 48
    iget-object v0, v0, Ly11;->c:Ljava/net/InetSocketAddress;

    .line 49
    .line 50
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 51
    .line 52
    .line 53
    const/16 v0, 0x2710

    .line 54
    .line 55
    invoke-virtual {p1, v0}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 56
    .line 57
    .line 58
    :try_start_0
    sget-object v0, Lgt0;->a:Lgt0;

    .line 59
    .line 60
    sget-object v0, Lgt0;->a:Lgt0;

    .line 61
    .line 62
    iget-object v1, p0, Lzx0;->b:Ly11;

    .line 63
    .line 64
    iget-object v1, v1, Ly11;->c:Ljava/net/InetSocketAddress;

    .line 65
    .line 66
    invoke-virtual {v0, p1, v1}, Lgt0;->e(Ljava/net/Socket;Ljava/net/InetSocketAddress;)V
    :try_end_0
    .catch Ljava/net/ConnectException; {:try_start_0 .. :try_end_0} :catch_1

    .line 67
    .line 68
    .line 69
    :try_start_1
    sget-object v0, Lnr0;->a:Ljava/util/logging/Logger;

    .line 70
    .line 71
    new-instance v0, Lk81;

    .line 72
    .line 73
    invoke-direct {v0, p1}, Lk81;-><init>(Ljava/net/Socket;)V

    .line 74
    .line 75
    .line 76
    new-instance v1, Lna;

    .line 77
    .line 78
    invoke-virtual {p1}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    .line 79
    .line 80
    .line 81
    move-result-object v3

    .line 82
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 83
    .line 84
    .line 85
    invoke-direct {v1, v3, v0}, Lna;-><init>(Ljava/io/InputStream;Lnc1;)V

    .line 86
    .line 87
    .line 88
    new-instance v3, Lna;

    .line 89
    .line 90
    invoke-direct {v3, v0, v1}, Lna;-><init>(Lk81;Lna;)V

    .line 91
    .line 92
    .line 93
    new-instance v0, Lsx0;

    .line 94
    .line 95
    invoke-direct {v0, v3}, Lsx0;-><init>(Lp81;)V

    .line 96
    .line 97
    .line 98
    iput-object v0, p0, Lzx0;->h:Lsx0;

    .line 99
    .line 100
    new-instance v0, Lk81;

    .line 101
    .line 102
    invoke-direct {v0, p1}, Lk81;-><init>(Ljava/net/Socket;)V

    .line 103
    .line 104
    .line 105
    new-instance v1, Lma;

    .line 106
    .line 107
    invoke-virtual {p1}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 112
    .line 113
    .line 114
    invoke-direct {v1, p1, v2, v0}, Lma;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 115
    .line 116
    .line 117
    new-instance p1, Lma;

    .line 118
    .line 119
    const/4 v2, 0x0

    .line 120
    invoke-direct {p1, v0, v2, v1}, Lma;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 121
    .line 122
    .line 123
    new-instance v0, Lrx0;

    .line 124
    .line 125
    invoke-direct {v0, p1}, Lrx0;-><init>(La81;)V

    .line 126
    .line 127
    .line 128
    iput-object v0, p0, Lzx0;->i:Lrx0;
    :try_end_1
    .catch Ljava/lang/NullPointerException; {:try_start_1 .. :try_end_1} :catch_0

    .line 129
    .line 130
    return-void

    .line 131
    :catch_0
    move-exception p0

    .line 132
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object p1

    .line 136
    const-string v0, "throw with null exception"

    .line 137
    .line 138
    invoke-static {p1, v0}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 139
    .line 140
    .line 141
    move-result p1

    .line 142
    if-nez p1, :cond_2

    .line 143
    .line 144
    return-void

    .line 145
    :cond_2
    new-instance p1, Ljava/io/IOException;

    .line 146
    .line 147
    invoke-direct {p1, p0}, Ljava/io/IOException;-><init>(Ljava/lang/Throwable;)V

    .line 148
    .line 149
    .line 150
    throw p1

    .line 151
    :catch_1
    move-exception p1

    .line 152
    new-instance v0, Ljava/net/ConnectException;

    .line 153
    .line 154
    new-instance v1, Ljava/lang/StringBuilder;

    .line 155
    .line 156
    const-string v2, "Failed to connect to "

    .line 157
    .line 158
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 159
    .line 160
    .line 161
    iget-object p0, p0, Lzx0;->b:Ly11;

    .line 162
    .line 163
    iget-object p0, p0, Ly11;->c:Ljava/net/InetSocketAddress;

    .line 164
    .line 165
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object p0

    .line 172
    invoke-direct {v0, p0}, Ljava/net/ConnectException;-><init>(Ljava/lang/String;)V

    .line 173
    .line 174
    .line 175
    invoke-virtual {v0, p1}, Ljava/lang/Throwable;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 176
    .line 177
    .line 178
    throw v0
.end method

.method public final f(Lhi;)V
    .locals 9

    .line 1
    new-instance v0, Ler0;

    .line 2
    .line 3
    const/16 v1, 0xa

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ler0;-><init>(I)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lzx0;->b:Ly11;

    .line 9
    .line 10
    iget-object v2, v1, Ly11;->a:Lt3;

    .line 11
    .line 12
    iget-object v2, v2, Lt3;->f:Led0;

    .line 13
    .line 14
    iput-object v2, v0, Ler0;->k:Ljava/lang/Object;

    .line 15
    .line 16
    const-string v2, "CONNECT"

    .line 17
    .line 18
    const/4 v3, 0x0

    .line 19
    invoke-virtual {v0, v2, v3}, Ler0;->o(Ljava/lang/String;Lkp1;)V

    .line 20
    .line 21
    .line 22
    iget-object v1, v1, Ly11;->a:Lt3;

    .line 23
    .line 24
    iget-object v1, v1, Lt3;->f:Led0;

    .line 25
    .line 26
    const/4 v2, 0x1

    .line 27
    invoke-static {v1, v2}, Ljg1;->p(Led0;Z)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    iget-object v4, v0, Ler0;->m:Ljava/lang/Object;

    .line 32
    .line 33
    check-cast v4, Lrb0;

    .line 34
    .line 35
    const-string v5, "Host"

    .line 36
    .line 37
    invoke-virtual {v4, v5, v1}, Lrb0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    iget-object v1, v0, Ler0;->m:Ljava/lang/Object;

    .line 41
    .line 42
    check-cast v1, Lrb0;

    .line 43
    .line 44
    const-string v4, "Proxy-Connection"

    .line 45
    .line 46
    const-string v5, "Keep-Alive"

    .line 47
    .line 48
    invoke-virtual {v1, v4, v5}, Lrb0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    iget-object v1, v0, Ler0;->m:Ljava/lang/Object;

    .line 52
    .line 53
    check-cast v1, Lrb0;

    .line 54
    .line 55
    const-string v4, "User-Agent"

    .line 56
    .line 57
    const-string v5, "okhttp/4.12.0"

    .line 58
    .line 59
    invoke-virtual {v1, v4, v5}, Lrb0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0}, Ler0;->c()Lm01;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    new-instance v1, Lrb0;

    .line 67
    .line 68
    invoke-direct {v1}, Lrb0;-><init>()V

    .line 69
    .line 70
    .line 71
    const-string v4, "Proxy-Authenticate"

    .line 72
    .line 73
    const-string v5, "OkHttp-Preemptive"

    .line 74
    .line 75
    invoke-virtual {v1, v4, v5}, Lrb0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v1}, Lrb0;->c()Lsb0;

    .line 79
    .line 80
    .line 81
    iget-object v1, v0, Lm01;->a:Led0;

    .line 82
    .line 83
    invoke-virtual {p0, p1}, Lzx0;->e(Lhi;)V

    .line 84
    .line 85
    .line 86
    new-instance p1, Ljava/lang/StringBuilder;

    .line 87
    .line 88
    const-string v4, "CONNECT "

    .line 89
    .line 90
    invoke-direct {p1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    invoke-static {v1, v2}, Ljg1;->p(Led0;Z)Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    const-string v1, " HTTP/1.1"

    .line 101
    .line 102
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    iget-object v1, p0, Lzx0;->h:Lsx0;

    .line 110
    .line 111
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 112
    .line 113
    .line 114
    iget-object v2, p0, Lzx0;->i:Lrx0;

    .line 115
    .line 116
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 117
    .line 118
    .line 119
    new-instance v4, Ljc0;

    .line 120
    .line 121
    invoke-direct {v4, v3, p0, v1, v2}, Ljc0;-><init>(Lmr0;Lzx0;Lsx0;Lrx0;)V

    .line 122
    .line 123
    .line 124
    iget-object p0, v1, Lsx0;->j:Lp81;

    .line 125
    .line 126
    invoke-interface {p0}, Lp81;->b()Lnc1;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    const-wide/16 v5, 0x2710

    .line 131
    .line 132
    invoke-virtual {p0, v5, v6}, Lnc1;->g(J)Lnc1;

    .line 133
    .line 134
    .line 135
    iget-object p0, v2, Lrx0;->j:La81;

    .line 136
    .line 137
    invoke-interface {p0}, La81;->b()Lnc1;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    invoke-virtual {p0, v5, v6}, Lnc1;->g(J)Lnc1;

    .line 142
    .line 143
    .line 144
    iget-object p0, v0, Lm01;->c:Lsb0;

    .line 145
    .line 146
    invoke-virtual {v4, p0, p1}, Ljc0;->i(Lsb0;Ljava/lang/String;)V

    .line 147
    .line 148
    .line 149
    invoke-virtual {v4}, Ljc0;->c()V

    .line 150
    .line 151
    .line 152
    const/4 p0, 0x0

    .line 153
    invoke-virtual {v4, p0}, Ljc0;->f(Z)Le11;

    .line 154
    .line 155
    .line 156
    move-result-object p0

    .line 157
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 158
    .line 159
    .line 160
    iput-object v0, p0, Le11;->a:Lm01;

    .line 161
    .line 162
    invoke-virtual {p0}, Le11;->a()Lf11;

    .line 163
    .line 164
    .line 165
    move-result-object p0

    .line 166
    iget p1, p0, Lf11;->m:I

    .line 167
    .line 168
    invoke-static {p0}, Ljg1;->h(Lf11;)J

    .line 169
    .line 170
    .line 171
    move-result-wide v5

    .line 172
    const-wide/16 v7, -0x1

    .line 173
    .line 174
    cmp-long p0, v5, v7

    .line 175
    .line 176
    if-nez p0, :cond_0

    .line 177
    .line 178
    goto :goto_0

    .line 179
    :cond_0
    invoke-virtual {v4, v5, v6}, Ljc0;->h(J)Lhc0;

    .line 180
    .line 181
    .line 182
    move-result-object p0

    .line 183
    const v0, 0x7fffffff

    .line 184
    .line 185
    .line 186
    invoke-static {p0, v0}, Ljg1;->n(Lp81;I)Z

    .line 187
    .line 188
    .line 189
    invoke-virtual {p0}, Lhc0;->close()V

    .line 190
    .line 191
    .line 192
    :goto_0
    const/16 p0, 0xc8

    .line 193
    .line 194
    if-eq p1, p0, :cond_2

    .line 195
    .line 196
    const/16 p0, 0x197

    .line 197
    .line 198
    if-ne p1, p0, :cond_1

    .line 199
    .line 200
    const-string p0, "Failed to authenticate with proxy"

    .line 201
    .line 202
    invoke-static {p0}, Lo40;->k(Ljava/lang/String;)V

    .line 203
    .line 204
    .line 205
    return-void

    .line 206
    :cond_1
    const-string p0, "Unexpected response code for CONNECT: "

    .line 207
    .line 208
    invoke-static {p1, p0}, Loq;->f(ILjava/lang/String;)Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object p0

    .line 212
    invoke-static {p0}, Lo40;->k(Ljava/lang/String;)V

    .line 213
    .line 214
    .line 215
    return-void

    .line 216
    :cond_2
    iget-object p0, v1, Lsx0;->k:Leh;

    .line 217
    .line 218
    invoke-virtual {p0}, Leh;->g()Z

    .line 219
    .line 220
    .line 221
    move-result p0

    .line 222
    if-eqz p0, :cond_3

    .line 223
    .line 224
    iget-object p0, v2, Lrx0;->k:Leh;

    .line 225
    .line 226
    invoke-virtual {p0}, Leh;->g()Z

    .line 227
    .line 228
    .line 229
    move-result p0

    .line 230
    if-eqz p0, :cond_3

    .line 231
    .line 232
    return-void

    .line 233
    :cond_3
    const-string p0, "TLS tunnel buffered too many bytes!"

    .line 234
    .line 235
    invoke-static {p0}, Lo40;->k(Ljava/lang/String;)V

    .line 236
    .line 237
    .line 238
    return-void
.end method

.method public final g(Lso;Lhi;)V
    .locals 12

    .line 1
    sget-object p2, Liw0;->l:Liw0;

    .line 2
    .line 3
    iget-object v0, p0, Lzx0;->b:Ly11;

    .line 4
    .line 5
    iget-object v0, v0, Ly11;->a:Lt3;

    .line 6
    .line 7
    iget-object v1, v0, Lt3;->b:Ljavax/net/ssl/SSLSocketFactory;

    .line 8
    .line 9
    if-nez v1, :cond_1

    .line 10
    .line 11
    iget-object p1, v0, Lt3;->g:Ljava/util/List;

    .line 12
    .line 13
    sget-object v0, Liw0;->o:Liw0;

    .line 14
    .line 15
    invoke-interface {p1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    iget-object v1, p0, Lzx0;->c:Ljava/net/Socket;

    .line 20
    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    iput-object v1, p0, Lzx0;->d:Ljava/net/Socket;

    .line 24
    .line 25
    iput-object v0, p0, Lzx0;->f:Liw0;

    .line 26
    .line 27
    invoke-virtual {p0}, Lzx0;->l()V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    iput-object v1, p0, Lzx0;->d:Ljava/net/Socket;

    .line 32
    .line 33
    iput-object p2, p0, Lzx0;->f:Liw0;

    .line 34
    .line 35
    return-void

    .line 36
    :cond_1
    const-string v2, "Hostname "

    .line 37
    .line 38
    const-string v3, "\n              |Hostname "

    .line 39
    .line 40
    const/4 v4, 0x0

    .line 41
    :try_start_0
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 42
    .line 43
    .line 44
    iget-object v5, p0, Lzx0;->c:Ljava/net/Socket;

    .line 45
    .line 46
    iget-object v6, v0, Lt3;->f:Led0;

    .line 47
    .line 48
    iget-object v7, v6, Led0;->d:Ljava/lang/String;

    .line 49
    .line 50
    iget v6, v6, Led0;->e:I

    .line 51
    .line 52
    const/4 v8, 0x1

    .line 53
    invoke-virtual {v1, v5, v7, v6, v8}, Ljavax/net/ssl/SSLSocketFactory;->createSocket(Ljava/net/Socket;Ljava/lang/String;IZ)Ljava/net/Socket;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 58
    .line 59
    .line 60
    check-cast v1, Ljavax/net/ssl/SSLSocket;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 61
    .line 62
    :try_start_1
    invoke-virtual {p1, v1}, Lso;->a(Ljavax/net/ssl/SSLSocket;)Lro;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    iget-boolean v5, p1, Lro;->b:Z

    .line 67
    .line 68
    if-eqz v5, :cond_2

    .line 69
    .line 70
    sget-object v5, Lgt0;->a:Lgt0;

    .line 71
    .line 72
    sget-object v5, Lgt0;->a:Lgt0;

    .line 73
    .line 74
    iget-object v6, v0, Lt3;->f:Led0;

    .line 75
    .line 76
    iget-object v6, v6, Led0;->d:Ljava/lang/String;

    .line 77
    .line 78
    iget-object v7, v0, Lt3;->g:Ljava/util/List;

    .line 79
    .line 80
    invoke-virtual {v5, v1, v6, v7}, Lgt0;->d(Ljavax/net/ssl/SSLSocket;Ljava/lang/String;Ljava/util/List;)V

    .line 81
    .line 82
    .line 83
    goto :goto_0

    .line 84
    :catchall_0
    move-exception p0

    .line 85
    move-object v4, v1

    .line 86
    goto/16 :goto_1

    .line 87
    .line 88
    :cond_2
    :goto_0
    invoke-virtual {v1}, Ljavax/net/ssl/SSLSocket;->startHandshake()V

    .line 89
    .line 90
    .line 91
    invoke-virtual {v1}, Ljavax/net/ssl/SSLSocket;->getSession()Ljavax/net/ssl/SSLSession;

    .line 92
    .line 93
    .line 94
    move-result-object v5

    .line 95
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 96
    .line 97
    .line 98
    invoke-static {v5}, Lcg1;->m(Ljavax/net/ssl/SSLSession;)Lnb0;

    .line 99
    .line 100
    .line 101
    move-result-object v6

    .line 102
    iget-object v7, v0, Lt3;->c:Ljavax/net/ssl/HostnameVerifier;

    .line 103
    .line 104
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 105
    .line 106
    .line 107
    iget-object v9, v0, Lt3;->f:Led0;

    .line 108
    .line 109
    iget-object v9, v9, Led0;->d:Ljava/lang/String;

    .line 110
    .line 111
    invoke-interface {v7, v9, v5}, Ljavax/net/ssl/HostnameVerifier;->verify(Ljava/lang/String;Ljavax/net/ssl/SSLSession;)Z

    .line 112
    .line 113
    .line 114
    move-result v5

    .line 115
    const/4 v7, 0x0

    .line 116
    if-nez v5, :cond_4

    .line 117
    .line 118
    invoke-virtual {v6}, Lnb0;->a()Ljava/util/List;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    invoke-interface {p0}, Ljava/util/Collection;->isEmpty()Z

    .line 123
    .line 124
    .line 125
    move-result p1

    .line 126
    if-nez p1, :cond_3

    .line 127
    .line 128
    invoke-interface {p0, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 133
    .line 134
    .line 135
    check-cast p0, Ljava/security/cert/X509Certificate;

    .line 136
    .line 137
    new-instance p1, Ljavax/net/ssl/SSLPeerUnverifiedException;

    .line 138
    .line 139
    new-instance p2, Ljava/lang/StringBuilder;

    .line 140
    .line 141
    invoke-direct {p2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 142
    .line 143
    .line 144
    iget-object v0, v0, Lt3;->f:Led0;

    .line 145
    .line 146
    iget-object v0, v0, Led0;->d:Ljava/lang/String;

    .line 147
    .line 148
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 149
    .line 150
    .line 151
    const-string v0, " not verified:\n              |    certificate: "

    .line 152
    .line 153
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    sget-object v0, Lij;->c:Lij;

    .line 157
    .line 158
    new-instance v0, Ljava/lang/StringBuilder;

    .line 159
    .line 160
    const-string v2, "sha256/"

    .line 161
    .line 162
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 163
    .line 164
    .line 165
    sget-object v2, Lth;->m:Lth;

    .line 166
    .line 167
    invoke-virtual {p0}, Ljava/security/cert/Certificate;->getPublicKey()Ljava/security/PublicKey;

    .line 168
    .line 169
    .line 170
    move-result-object v2

    .line 171
    invoke-interface {v2}, Ljava/security/Key;->getEncoded()[B

    .line 172
    .line 173
    .line 174
    move-result-object v2

    .line 175
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 176
    .line 177
    .line 178
    invoke-static {v2}, Lmz;->l([B)Lth;

    .line 179
    .line 180
    .line 181
    move-result-object v2

    .line 182
    const-string v3, "SHA-256"

    .line 183
    .line 184
    invoke-virtual {v2, v3}, Lth;->b(Ljava/lang/String;)Lth;

    .line 185
    .line 186
    .line 187
    move-result-object v2

    .line 188
    invoke-virtual {v2}, Lth;->a()Ljava/lang/String;

    .line 189
    .line 190
    .line 191
    move-result-object v2

    .line 192
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 193
    .line 194
    .line 195
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 196
    .line 197
    .line 198
    move-result-object v0

    .line 199
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 200
    .line 201
    .line 202
    const-string v0, "\n              |    DN: "

    .line 203
    .line 204
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 205
    .line 206
    .line 207
    invoke-virtual {p0}, Ljava/security/cert/X509Certificate;->getSubjectDN()Ljava/security/Principal;

    .line 208
    .line 209
    .line 210
    move-result-object v0

    .line 211
    invoke-interface {v0}, Ljava/security/Principal;->getName()Ljava/lang/String;

    .line 212
    .line 213
    .line 214
    move-result-object v0

    .line 215
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 216
    .line 217
    .line 218
    const-string v0, "\n              |    subjectAltNames: "

    .line 219
    .line 220
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 221
    .line 222
    .line 223
    const/4 v0, 0x7

    .line 224
    invoke-static {p0, v0}, Llr0;->a(Ljava/security/cert/X509Certificate;I)Ljava/util/List;

    .line 225
    .line 226
    .line 227
    move-result-object v0

    .line 228
    const/4 v2, 0x2

    .line 229
    invoke-static {p0, v2}, Llr0;->a(Ljava/security/cert/X509Certificate;I)Ljava/util/List;

    .line 230
    .line 231
    .line 232
    move-result-object p0

    .line 233
    invoke-static {v0, p0}, Lbl;->C(Ljava/util/Collection;Ljava/util/List;)Ljava/util/ArrayList;

    .line 234
    .line 235
    .line 236
    move-result-object p0

    .line 237
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 238
    .line 239
    .line 240
    const-string p0, "\n              "

    .line 241
    .line 242
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 243
    .line 244
    .line 245
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 246
    .line 247
    .line 248
    move-result-object p0

    .line 249
    invoke-static {p0}, Lea1;->k(Ljava/lang/String;)Ljava/lang/String;

    .line 250
    .line 251
    .line 252
    move-result-object p0

    .line 253
    invoke-direct {p1, p0}, Ljavax/net/ssl/SSLPeerUnverifiedException;-><init>(Ljava/lang/String;)V

    .line 254
    .line 255
    .line 256
    throw p1

    .line 257
    :cond_3
    new-instance p0, Ljavax/net/ssl/SSLPeerUnverifiedException;

    .line 258
    .line 259
    new-instance p1, Ljava/lang/StringBuilder;

    .line 260
    .line 261
    invoke-direct {p1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 262
    .line 263
    .line 264
    iget-object p2, v0, Lt3;->f:Led0;

    .line 265
    .line 266
    iget-object p2, p2, Led0;->d:Ljava/lang/String;

    .line 267
    .line 268
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 269
    .line 270
    .line 271
    const-string p2, " not verified (no certificates)"

    .line 272
    .line 273
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 274
    .line 275
    .line 276
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 277
    .line 278
    .line 279
    move-result-object p1

    .line 280
    invoke-direct {p0, p1}, Ljavax/net/ssl/SSLPeerUnverifiedException;-><init>(Ljava/lang/String;)V

    .line 281
    .line 282
    .line 283
    throw p0

    .line 284
    :cond_4
    iget-object v2, v0, Lt3;->d:Lij;

    .line 285
    .line 286
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 287
    .line 288
    .line 289
    new-instance v3, Lnb0;

    .line 290
    .line 291
    iget-object v5, v6, Lnb0;->a:Lsc1;

    .line 292
    .line 293
    iget-object v9, v6, Lnb0;->b:Lek;

    .line 294
    .line 295
    iget-object v10, v6, Lnb0;->c:Ljava/util/List;

    .line 296
    .line 297
    new-instance v11, Lyx0;

    .line 298
    .line 299
    invoke-direct {v11, v2, v6, v0}, Lyx0;-><init>(Lij;Lnb0;Lt3;)V

    .line 300
    .line 301
    .line 302
    invoke-direct {v3, v5, v9, v10, v11}, Lnb0;-><init>(Lsc1;Lek;Ljava/util/List;Lp80;)V

    .line 303
    .line 304
    .line 305
    iput-object v3, p0, Lzx0;->e:Lnb0;

    .line 306
    .line 307
    iget-object v0, v0, Lt3;->f:Led0;

    .line 308
    .line 309
    iget-object v0, v0, Led0;->d:Ljava/lang/String;

    .line 310
    .line 311
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 312
    .line 313
    .line 314
    iget-object v0, v2, Lij;->a:Ljava/util/Set;

    .line 315
    .line 316
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 317
    .line 318
    .line 319
    move-result-object v0

    .line 320
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 321
    .line 322
    .line 323
    move-result v2

    .line 324
    if-nez v2, :cond_8

    .line 325
    .line 326
    iget-boolean p1, p1, Lro;->b:Z

    .line 327
    .line 328
    if-eqz p1, :cond_5

    .line 329
    .line 330
    sget-object p1, Lgt0;->a:Lgt0;

    .line 331
    .line 332
    sget-object p1, Lgt0;->a:Lgt0;

    .line 333
    .line 334
    invoke-virtual {p1, v1}, Lgt0;->f(Ljavax/net/ssl/SSLSocket;)Ljava/lang/String;

    .line 335
    .line 336
    .line 337
    move-result-object v4

    .line 338
    :cond_5
    iput-object v1, p0, Lzx0;->d:Ljava/net/Socket;

    .line 339
    .line 340
    sget-object p1, Lnr0;->a:Ljava/util/logging/Logger;

    .line 341
    .line 342
    new-instance p1, Lk81;

    .line 343
    .line 344
    invoke-direct {p1, v1}, Lk81;-><init>(Ljava/net/Socket;)V

    .line 345
    .line 346
    .line 347
    new-instance v0, Lna;

    .line 348
    .line 349
    invoke-virtual {v1}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    .line 350
    .line 351
    .line 352
    move-result-object v2

    .line 353
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 354
    .line 355
    .line 356
    invoke-direct {v0, v2, p1}, Lna;-><init>(Ljava/io/InputStream;Lnc1;)V

    .line 357
    .line 358
    .line 359
    new-instance v2, Lna;

    .line 360
    .line 361
    invoke-direct {v2, p1, v0}, Lna;-><init>(Lk81;Lna;)V

    .line 362
    .line 363
    .line 364
    new-instance p1, Lsx0;

    .line 365
    .line 366
    invoke-direct {p1, v2}, Lsx0;-><init>(Lp81;)V

    .line 367
    .line 368
    .line 369
    iput-object p1, p0, Lzx0;->h:Lsx0;

    .line 370
    .line 371
    new-instance p1, Lk81;

    .line 372
    .line 373
    invoke-direct {p1, v1}, Lk81;-><init>(Ljava/net/Socket;)V

    .line 374
    .line 375
    .line 376
    new-instance v0, Lma;

    .line 377
    .line 378
    invoke-virtual {v1}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    .line 379
    .line 380
    .line 381
    move-result-object v2

    .line 382
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 383
    .line 384
    .line 385
    invoke-direct {v0, v2, v8, p1}, Lma;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 386
    .line 387
    .line 388
    new-instance v2, Lma;

    .line 389
    .line 390
    invoke-direct {v2, p1, v7, v0}, Lma;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 391
    .line 392
    .line 393
    new-instance p1, Lrx0;

    .line 394
    .line 395
    invoke-direct {p1, v2}, Lrx0;-><init>(La81;)V

    .line 396
    .line 397
    .line 398
    iput-object p1, p0, Lzx0;->i:Lrx0;

    .line 399
    .line 400
    if-eqz v4, :cond_6

    .line 401
    .line 402
    invoke-static {v4}, Lea1;->f(Ljava/lang/String;)Liw0;

    .line 403
    .line 404
    .line 405
    move-result-object p2

    .line 406
    :cond_6
    iput-object p2, p0, Lzx0;->f:Liw0;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 407
    .line 408
    sget-object p1, Lgt0;->a:Lgt0;

    .line 409
    .line 410
    sget-object p1, Lgt0;->a:Lgt0;

    .line 411
    .line 412
    invoke-virtual {p1, v1}, Lgt0;->a(Ljavax/net/ssl/SSLSocket;)V

    .line 413
    .line 414
    .line 415
    iget-object p1, p0, Lzx0;->f:Liw0;

    .line 416
    .line 417
    sget-object p2, Liw0;->n:Liw0;

    .line 418
    .line 419
    if-ne p1, p2, :cond_7

    .line 420
    .line 421
    invoke-virtual {p0}, Lzx0;->l()V

    .line 422
    .line 423
    .line 424
    :cond_7
    return-void

    .line 425
    :cond_8
    :try_start_2
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 426
    .line 427
    .line 428
    move-result-object p0

    .line 429
    invoke-static {p0}, Loq;->q(Ljava/lang/Object;)V

    .line 430
    .line 431
    .line 432
    throw v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 433
    :catchall_1
    move-exception p0

    .line 434
    :goto_1
    if-eqz v4, :cond_9

    .line 435
    .line 436
    sget-object p1, Lgt0;->a:Lgt0;

    .line 437
    .line 438
    sget-object p1, Lgt0;->a:Lgt0;

    .line 439
    .line 440
    invoke-virtual {p1, v4}, Lgt0;->a(Ljavax/net/ssl/SSLSocket;)V

    .line 441
    .line 442
    .line 443
    :cond_9
    if-eqz v4, :cond_a

    .line 444
    .line 445
    invoke-static {v4}, Ljg1;->c(Ljava/net/Socket;)V

    .line 446
    .line 447
    .line 448
    :cond_a
    throw p0
.end method

.method public final h(Lt3;Ljava/util/List;)Z
    .locals 8

    .line 1
    iget-object v0, p1, Lt3;->f:Led0;

    .line 2
    .line 3
    iget-object v1, v0, Led0;->d:Ljava/lang/String;

    .line 4
    .line 5
    sget-object v2, Ljg1;->a:[B

    .line 6
    .line 7
    iget-object v2, p0, Lzx0;->p:Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    iget v3, p0, Lzx0;->o:I

    .line 14
    .line 15
    const/4 v4, 0x0

    .line 16
    if-ge v2, v3, :cond_a

    .line 17
    .line 18
    iget-boolean v2, p0, Lzx0;->j:Z

    .line 19
    .line 20
    if-eqz v2, :cond_0

    .line 21
    .line 22
    goto/16 :goto_2

    .line 23
    .line 24
    :cond_0
    iget-object v2, p0, Lzx0;->b:Ly11;

    .line 25
    .line 26
    iget-object v3, v2, Ly11;->a:Lt3;

    .line 27
    .line 28
    iget-object v5, v2, Ly11;->a:Lt3;

    .line 29
    .line 30
    invoke-virtual {v3, p1}, Lt3;->a(Lt3;)Z

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    if-nez v3, :cond_1

    .line 35
    .line 36
    goto/16 :goto_2

    .line 37
    .line 38
    :cond_1
    iget-object v3, v5, Lt3;->f:Led0;

    .line 39
    .line 40
    iget-object v3, v3, Led0;->d:Ljava/lang/String;

    .line 41
    .line 42
    invoke-static {v1, v3}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    if-eqz v3, :cond_2

    .line 47
    .line 48
    goto/16 :goto_1

    .line 49
    .line 50
    :cond_2
    iget-object v3, p0, Lzx0;->g:Ltc0;

    .line 51
    .line 52
    if-nez v3, :cond_3

    .line 53
    .line 54
    goto/16 :goto_2

    .line 55
    .line 56
    :cond_3
    if-eqz p2, :cond_a

    .line 57
    .line 58
    invoke-interface {p2}, Ljava/util/Collection;->isEmpty()Z

    .line 59
    .line 60
    .line 61
    move-result v3

    .line 62
    if-eqz v3, :cond_4

    .line 63
    .line 64
    goto/16 :goto_2

    .line 65
    .line 66
    :cond_4
    invoke-interface {p2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 67
    .line 68
    .line 69
    move-result-object p2

    .line 70
    :cond_5
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 71
    .line 72
    .line 73
    move-result v3

    .line 74
    if-eqz v3, :cond_a

    .line 75
    .line 76
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v3

    .line 80
    check-cast v3, Ly11;

    .line 81
    .line 82
    iget-object v6, v3, Ly11;->b:Ljava/net/Proxy;

    .line 83
    .line 84
    invoke-virtual {v6}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    .line 85
    .line 86
    .line 87
    move-result-object v6

    .line 88
    sget-object v7, Ljava/net/Proxy$Type;->DIRECT:Ljava/net/Proxy$Type;

    .line 89
    .line 90
    if-ne v6, v7, :cond_5

    .line 91
    .line 92
    iget-object v6, v2, Ly11;->b:Ljava/net/Proxy;

    .line 93
    .line 94
    invoke-virtual {v6}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    .line 95
    .line 96
    .line 97
    move-result-object v6

    .line 98
    if-ne v6, v7, :cond_5

    .line 99
    .line 100
    iget-object v6, v2, Ly11;->c:Ljava/net/InetSocketAddress;

    .line 101
    .line 102
    iget-object v3, v3, Ly11;->c:Ljava/net/InetSocketAddress;

    .line 103
    .line 104
    invoke-static {v6, v3}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    move-result v3

    .line 108
    if-eqz v3, :cond_5

    .line 109
    .line 110
    iget-object p2, p1, Lt3;->c:Ljavax/net/ssl/HostnameVerifier;

    .line 111
    .line 112
    sget-object v2, Llr0;->a:Llr0;

    .line 113
    .line 114
    if-eq p2, v2, :cond_6

    .line 115
    .line 116
    goto :goto_2

    .line 117
    :cond_6
    sget-object p2, Ljg1;->a:[B

    .line 118
    .line 119
    iget-object p2, v5, Lt3;->f:Led0;

    .line 120
    .line 121
    iget v0, v0, Led0;->e:I

    .line 122
    .line 123
    iget v2, p2, Led0;->e:I

    .line 124
    .line 125
    if-eq v0, v2, :cond_7

    .line 126
    .line 127
    goto :goto_2

    .line 128
    :cond_7
    iget-object p2, p2, Led0;->d:Ljava/lang/String;

    .line 129
    .line 130
    invoke-static {v1, p2}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 131
    .line 132
    .line 133
    move-result p2

    .line 134
    if-eqz p2, :cond_8

    .line 135
    .line 136
    goto :goto_0

    .line 137
    :cond_8
    iget-boolean p2, p0, Lzx0;->k:Z

    .line 138
    .line 139
    if-nez p2, :cond_a

    .line 140
    .line 141
    iget-object p2, p0, Lzx0;->e:Lnb0;

    .line 142
    .line 143
    if-eqz p2, :cond_a

    .line 144
    .line 145
    invoke-virtual {p2}, Lnb0;->a()Ljava/util/List;

    .line 146
    .line 147
    .line 148
    move-result-object p2

    .line 149
    invoke-interface {p2}, Ljava/util/Collection;->isEmpty()Z

    .line 150
    .line 151
    .line 152
    move-result v0

    .line 153
    if-nez v0, :cond_a

    .line 154
    .line 155
    invoke-interface {p2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 156
    .line 157
    .line 158
    move-result-object p2

    .line 159
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 160
    .line 161
    .line 162
    check-cast p2, Ljava/security/cert/X509Certificate;

    .line 163
    .line 164
    invoke-static {v1, p2}, Llr0;->c(Ljava/lang/String;Ljava/security/cert/X509Certificate;)Z

    .line 165
    .line 166
    .line 167
    move-result p2

    .line 168
    if-eqz p2, :cond_a

    .line 169
    .line 170
    :goto_0
    :try_start_0
    iget-object p1, p1, Lt3;->d:Lij;

    .line 171
    .line 172
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 173
    .line 174
    .line 175
    iget-object p0, p0, Lzx0;->e:Lnb0;

    .line 176
    .line 177
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 178
    .line 179
    .line 180
    invoke-virtual {p0}, Lnb0;->a()Ljava/util/List;

    .line 181
    .line 182
    .line 183
    move-result-object p0

    .line 184
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 185
    .line 186
    .line 187
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 188
    .line 189
    .line 190
    iget-object p0, p1, Lij;->a:Ljava/util/Set;

    .line 191
    .line 192
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 193
    .line 194
    .line 195
    move-result-object p0

    .line 196
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 197
    .line 198
    .line 199
    move-result p1

    .line 200
    if-nez p1, :cond_9

    .line 201
    .line 202
    :goto_1
    const/4 p0, 0x1

    .line 203
    return p0

    .line 204
    :cond_9
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 205
    .line 206
    .line 207
    move-result-object p0

    .line 208
    invoke-static {p0}, Loq;->q(Ljava/lang/Object;)V

    .line 209
    .line 210
    .line 211
    const/4 p0, 0x0

    .line 212
    throw p0
    :try_end_0
    .catch Ljavax/net/ssl/SSLPeerUnverifiedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 213
    :catch_0
    :cond_a
    :goto_2
    return v4
.end method

.method public final i(Z)Z
    .locals 9

    .line 1
    sget-object v0, Ljg1;->a:[B

    .line 2
    .line 3
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    iget-object v2, p0, Lzx0;->c:Ljava/net/Socket;

    .line 8
    .line 9
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    iget-object v3, p0, Lzx0;->d:Ljava/net/Socket;

    .line 13
    .line 14
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 15
    .line 16
    .line 17
    iget-object v4, p0, Lzx0;->h:Lsx0;

    .line 18
    .line 19
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v2}, Ljava/net/Socket;->isClosed()Z

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    const/4 v5, 0x0

    .line 27
    if-nez v2, :cond_5

    .line 28
    .line 29
    invoke-virtual {v3}, Ljava/net/Socket;->isClosed()Z

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    if-nez v2, :cond_5

    .line 34
    .line 35
    invoke-virtual {v3}, Ljava/net/Socket;->isInputShutdown()Z

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-nez v2, :cond_5

    .line 40
    .line 41
    invoke-virtual {v3}, Ljava/net/Socket;->isOutputShutdown()Z

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    if-eqz v2, :cond_0

    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_0
    iget-object v2, p0, Lzx0;->g:Ltc0;

    .line 49
    .line 50
    const/4 v6, 0x1

    .line 51
    if-eqz v2, :cond_3

    .line 52
    .line 53
    monitor-enter v2

    .line 54
    :try_start_0
    iget-boolean p0, v2, Ltc0;->o:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 55
    .line 56
    if-eqz p0, :cond_1

    .line 57
    .line 58
    monitor-exit v2

    .line 59
    return v5

    .line 60
    :cond_1
    :try_start_1
    iget-wide p0, v2, Ltc0;->w:J

    .line 61
    .line 62
    iget-wide v3, v2, Ltc0;->v:J

    .line 63
    .line 64
    cmp-long p0, p0, v3

    .line 65
    .line 66
    if-gez p0, :cond_2

    .line 67
    .line 68
    iget-wide p0, v2, Ltc0;->x:J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 69
    .line 70
    cmp-long p0, v0, p0

    .line 71
    .line 72
    if-ltz p0, :cond_2

    .line 73
    .line 74
    monitor-exit v2

    .line 75
    return v5

    .line 76
    :catchall_0
    move-exception p0

    .line 77
    goto :goto_0

    .line 78
    :cond_2
    monitor-exit v2

    .line 79
    return v6

    .line 80
    :goto_0
    :try_start_2
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 81
    throw p0

    .line 82
    :cond_3
    monitor-enter p0

    .line 83
    :try_start_3
    iget-wide v7, p0, Lzx0;->q:J
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 84
    .line 85
    sub-long/2addr v0, v7

    .line 86
    monitor-exit p0

    .line 87
    const-wide v7, 0x2540be400L

    .line 88
    .line 89
    .line 90
    .line 91
    .line 92
    cmp-long p0, v0, v7

    .line 93
    .line 94
    if-ltz p0, :cond_4

    .line 95
    .line 96
    if-eqz p1, :cond_4

    .line 97
    .line 98
    :try_start_4
    invoke-virtual {v3}, Ljava/net/Socket;->getSoTimeout()I

    .line 99
    .line 100
    .line 101
    move-result p0
    :try_end_4
    .catch Ljava/net/SocketTimeoutException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1

    .line 102
    :try_start_5
    invoke-virtual {v3, v6}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {v4}, Lsx0;->a()Z

    .line 106
    .line 107
    .line 108
    move-result p1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 109
    xor-int/2addr p1, v6

    .line 110
    :try_start_6
    invoke-virtual {v3, p0}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 111
    .line 112
    .line 113
    return p1

    .line 114
    :catchall_1
    move-exception p1

    .line 115
    invoke-virtual {v3, p0}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 116
    .line 117
    .line 118
    throw p1
    :try_end_6
    .catch Ljava/net/SocketTimeoutException; {:try_start_6 .. :try_end_6} :catch_0
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_1

    .line 119
    :catch_0
    move v5, v6

    .line 120
    :catch_1
    return v5

    .line 121
    :cond_4
    return v6

    .line 122
    :catchall_2
    move-exception p1

    .line 123
    monitor-exit p0

    .line 124
    throw p1

    .line 125
    :cond_5
    :goto_1
    return v5
.end method

.method public final j(Lmr0;Lay0;)Lo10;
    .locals 5

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lzx0;->d:Ljava/net/Socket;

    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 7
    .line 8
    .line 9
    iget-object v1, p0, Lzx0;->h:Lsx0;

    .line 10
    .line 11
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    iget-object v2, p0, Lzx0;->i:Lrx0;

    .line 15
    .line 16
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    .line 18
    .line 19
    iget-object v3, p0, Lzx0;->g:Ltc0;

    .line 20
    .line 21
    if-eqz v3, :cond_0

    .line 22
    .line 23
    new-instance v0, Luc0;

    .line 24
    .line 25
    invoke-direct {v0, p1, p0, p2, v3}, Luc0;-><init>(Lmr0;Lzx0;Lay0;Ltc0;)V

    .line 26
    .line 27
    .line 28
    return-object v0

    .line 29
    :cond_0
    const/16 p2, 0x2710

    .line 30
    .line 31
    invoke-virtual {v0, p2}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 32
    .line 33
    .line 34
    iget-object p2, v1, Lsx0;->j:Lp81;

    .line 35
    .line 36
    invoke-interface {p2}, Lp81;->b()Lnc1;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    const-wide/16 v3, 0x2710

    .line 41
    .line 42
    invoke-virtual {p2, v3, v4}, Lnc1;->g(J)Lnc1;

    .line 43
    .line 44
    .line 45
    iget-object p2, v2, Lrx0;->j:La81;

    .line 46
    .line 47
    invoke-interface {p2}, La81;->b()Lnc1;

    .line 48
    .line 49
    .line 50
    move-result-object p2

    .line 51
    invoke-virtual {p2, v3, v4}, Lnc1;->g(J)Lnc1;

    .line 52
    .line 53
    .line 54
    new-instance p2, Ljc0;

    .line 55
    .line 56
    invoke-direct {p2, p1, p0, v1, v2}, Ljc0;-><init>(Lmr0;Lzx0;Lsx0;Lrx0;)V

    .line 57
    .line 58
    .line 59
    return-object p2
.end method

.method public final declared-synchronized k()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    const/4 v0, 0x1

    .line 3
    :try_start_0
    iput-boolean v0, p0, Lzx0;->j:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 4
    .line 5
    monitor-exit p0

    .line 6
    return-void

    .line 7
    :catchall_0
    move-exception v0

    .line 8
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 9
    throw v0
.end method

.method public final l()V
    .locals 10

    .line 1
    iget-object v0, p0, Lzx0;->d:Ljava/net/Socket;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lzx0;->h:Lsx0;

    .line 7
    .line 8
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    iget-object v2, p0, Lzx0;->i:Lrx0;

    .line 12
    .line 13
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 14
    .line 15
    .line 16
    const/4 v3, 0x0

    .line 17
    invoke-virtual {v0, v3}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 18
    .line 19
    .line 20
    new-instance v4, Li7;

    .line 21
    .line 22
    sget-object v5, Lqb1;->h:Lqb1;

    .line 23
    .line 24
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 25
    .line 26
    .line 27
    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object v5, v4, Li7;->j:Ljava/lang/Object;

    .line 31
    .line 32
    sget-object v6, Lmc0;->a:Llc0;

    .line 33
    .line 34
    iput-object v6, v4, Li7;->o:Ljava/lang/Object;

    .line 35
    .line 36
    iget-object v6, p0, Lzx0;->b:Ly11;

    .line 37
    .line 38
    iget-object v6, v6, Ly11;->a:Lt3;

    .line 39
    .line 40
    iget-object v6, v6, Lt3;->f:Led0;

    .line 41
    .line 42
    iget-object v6, v6, Led0;->d:Ljava/lang/String;

    .line 43
    .line 44
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 45
    .line 46
    .line 47
    iput-object v0, v4, Li7;->k:Ljava/lang/Object;

    .line 48
    .line 49
    new-instance v0, Ljava/lang/StringBuilder;

    .line 50
    .line 51
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 52
    .line 53
    .line 54
    sget-object v7, Ljg1;->f:Ljava/lang/String;

    .line 55
    .line 56
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    const/16 v7, 0x20

    .line 60
    .line 61
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    iput-object v0, v4, Li7;->l:Ljava/lang/Object;

    .line 72
    .line 73
    iput-object v1, v4, Li7;->m:Ljava/lang/Object;

    .line 74
    .line 75
    iput-object v2, v4, Li7;->n:Ljava/lang/Object;

    .line 76
    .line 77
    iput-object p0, v4, Li7;->o:Ljava/lang/Object;

    .line 78
    .line 79
    new-instance v0, Ltc0;

    .line 80
    .line 81
    invoke-direct {v0, v4}, Ltc0;-><init>(Li7;)V

    .line 82
    .line 83
    .line 84
    iput-object v0, p0, Lzx0;->g:Ltc0;

    .line 85
    .line 86
    sget-object v1, Ltc0;->I:Lo51;

    .line 87
    .line 88
    iget v2, v1, Lo51;->a:I

    .line 89
    .line 90
    and-int/lit8 v2, v2, 0x10

    .line 91
    .line 92
    const/4 v4, 0x4

    .line 93
    if-eqz v2, :cond_0

    .line 94
    .line 95
    iget-object v1, v1, Lo51;->b:[I

    .line 96
    .line 97
    aget v1, v1, v4

    .line 98
    .line 99
    goto :goto_0

    .line 100
    :cond_0
    const v1, 0x7fffffff

    .line 101
    .line 102
    .line 103
    :goto_0
    iput v1, p0, Lzx0;->o:I

    .line 104
    .line 105
    iget-object p0, v0, Ltc0;->F:Lbd0;

    .line 106
    .line 107
    const-string v1, ">> CONNECTION "

    .line 108
    .line 109
    monitor-enter p0

    .line 110
    :try_start_0
    iget-boolean v2, p0, Lbd0;->m:Z

    .line 111
    .line 112
    if-nez v2, :cond_9

    .line 113
    .line 114
    sget-object v2, Lbd0;->o:Ljava/util/logging/Logger;

    .line 115
    .line 116
    sget-object v6, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    .line 117
    .line 118
    invoke-virtual {v2, v6}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    .line 119
    .line 120
    .line 121
    move-result v6

    .line 122
    if-eqz v6, :cond_1

    .line 123
    .line 124
    new-instance v6, Ljava/lang/StringBuilder;

    .line 125
    .line 126
    invoke-direct {v6, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    sget-object v1, Lkc0;->a:Lth;

    .line 130
    .line 131
    invoke-virtual {v1}, Lth;->d()Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v1

    .line 135
    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object v1

    .line 142
    new-array v6, v3, [Ljava/lang/Object;

    .line 143
    .line 144
    invoke-static {v1, v6}, Ljg1;->f(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object v1

    .line 148
    invoke-virtual {v2, v1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 149
    .line 150
    .line 151
    goto :goto_1

    .line 152
    :catchall_0
    move-exception v0

    .line 153
    goto/16 :goto_7

    .line 154
    .line 155
    :cond_1
    :goto_1
    iget-object v1, p0, Lbd0;->j:Lkh;

    .line 156
    .line 157
    sget-object v2, Lkc0;->a:Lth;

    .line 158
    .line 159
    invoke-interface {v1, v2}, Lkh;->m(Lth;)Lkh;

    .line 160
    .line 161
    .line 162
    iget-object v1, p0, Lbd0;->j:Lkh;

    .line 163
    .line 164
    invoke-interface {v1}, Lkh;->flush()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 165
    .line 166
    .line 167
    monitor-exit p0

    .line 168
    iget-object v1, v0, Ltc0;->F:Lbd0;

    .line 169
    .line 170
    iget-object p0, v0, Ltc0;->y:Lo51;

    .line 171
    .line 172
    monitor-enter v1

    .line 173
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 174
    .line 175
    .line 176
    iget-boolean v2, v1, Lbd0;->m:Z

    .line 177
    .line 178
    if-nez v2, :cond_8

    .line 179
    .line 180
    iget v2, p0, Lo51;->a:I

    .line 181
    .line 182
    invoke-static {v2}, Ljava/lang/Integer;->bitCount(I)I

    .line 183
    .line 184
    .line 185
    move-result v2

    .line 186
    mul-int/lit8 v2, v2, 0x6

    .line 187
    .line 188
    invoke-virtual {v1, v3, v2, v4, v3}, Lbd0;->h(IIII)V

    .line 189
    .line 190
    .line 191
    move v2, v3

    .line 192
    :goto_2
    const/16 v6, 0xa

    .line 193
    .line 194
    const/4 v7, 0x3

    .line 195
    if-ge v2, v6, :cond_6

    .line 196
    .line 197
    const/4 v6, 0x1

    .line 198
    shl-int v8, v6, v2

    .line 199
    .line 200
    iget v9, p0, Lo51;->a:I

    .line 201
    .line 202
    and-int/2addr v8, v9

    .line 203
    if-eqz v8, :cond_2

    .line 204
    .line 205
    goto :goto_3

    .line 206
    :cond_2
    move v6, v3

    .line 207
    :goto_3
    if-eqz v6, :cond_5

    .line 208
    .line 209
    if-eq v2, v4, :cond_4

    .line 210
    .line 211
    const/4 v6, 0x7

    .line 212
    if-eq v2, v6, :cond_3

    .line 213
    .line 214
    move v7, v2

    .line 215
    goto :goto_4

    .line 216
    :cond_3
    move v7, v4

    .line 217
    :cond_4
    :goto_4
    iget-object v6, v1, Lbd0;->j:Lkh;

    .line 218
    .line 219
    invoke-interface {v6, v7}, Lkh;->writeShort(I)Lkh;

    .line 220
    .line 221
    .line 222
    iget-object v6, v1, Lbd0;->j:Lkh;

    .line 223
    .line 224
    iget-object v7, p0, Lo51;->b:[I

    .line 225
    .line 226
    aget v7, v7, v2

    .line 227
    .line 228
    invoke-interface {v6, v7}, Lkh;->writeInt(I)Lkh;

    .line 229
    .line 230
    .line 231
    goto :goto_5

    .line 232
    :catchall_1
    move-exception p0

    .line 233
    goto :goto_6

    .line 234
    :cond_5
    :goto_5
    add-int/lit8 v2, v2, 0x1

    .line 235
    .line 236
    goto :goto_2

    .line 237
    :cond_6
    iget-object p0, v1, Lbd0;->j:Lkh;

    .line 238
    .line 239
    invoke-interface {p0}, Lkh;->flush()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 240
    .line 241
    .line 242
    monitor-exit v1

    .line 243
    iget-object p0, v0, Ltc0;->y:Lo51;

    .line 244
    .line 245
    invoke-virtual {p0}, Lo51;->a()I

    .line 246
    .line 247
    .line 248
    move-result p0

    .line 249
    const v1, 0xffff

    .line 250
    .line 251
    .line 252
    if-eq p0, v1, :cond_7

    .line 253
    .line 254
    iget-object v2, v0, Ltc0;->F:Lbd0;

    .line 255
    .line 256
    sub-int/2addr p0, v1

    .line 257
    int-to-long v8, p0

    .line 258
    invoke-virtual {v2, v3, v8, v9}, Lbd0;->t(IJ)V

    .line 259
    .line 260
    .line 261
    :cond_7
    invoke-virtual {v5}, Lqb1;->d()Lob1;

    .line 262
    .line 263
    .line 264
    move-result-object p0

    .line 265
    iget-object v1, v0, Ltc0;->l:Ljava/lang/String;

    .line 266
    .line 267
    iget-object v0, v0, Ltc0;->G:Lpc0;

    .line 268
    .line 269
    new-instance v2, Lzx;

    .line 270
    .line 271
    invoke-direct {v2, v1, v0, v7}, Lzx;-><init>(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 272
    .line 273
    .line 274
    const-wide/16 v0, 0x0

    .line 275
    .line 276
    invoke-virtual {p0, v2, v0, v1}, Lob1;->c(Ljb1;J)V

    .line 277
    .line 278
    .line 279
    return-void

    .line 280
    :cond_8
    :try_start_2
    new-instance p0, Ljava/io/IOException;

    .line 281
    .line 282
    const-string v0, "closed"

    .line 283
    .line 284
    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 285
    .line 286
    .line 287
    throw p0

    .line 288
    :goto_6
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 289
    throw p0

    .line 290
    :cond_9
    :try_start_3
    new-instance v0, Ljava/io/IOException;

    .line 291
    .line 292
    const-string v1, "closed"

    .line 293
    .line 294
    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 295
    .line 296
    .line 297
    throw v0

    .line 298
    :goto_7
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 299
    throw v0
.end method

.method public final toString()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "Connection{"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lzx0;->b:Ly11;

    .line 9
    .line 10
    iget-object v2, v1, Ly11;->a:Lt3;

    .line 11
    .line 12
    iget-object v2, v2, Lt3;->f:Led0;

    .line 13
    .line 14
    iget-object v2, v2, Led0;->d:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const/16 v2, 0x3a

    .line 20
    .line 21
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    iget-object v2, v1, Ly11;->a:Lt3;

    .line 25
    .line 26
    iget-object v2, v2, Lt3;->f:Led0;

    .line 27
    .line 28
    iget v2, v2, Led0;->e:I

    .line 29
    .line 30
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v2, ", proxy="

    .line 34
    .line 35
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget-object v2, v1, Ly11;->b:Ljava/net/Proxy;

    .line 39
    .line 40
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v2, " hostAddress="

    .line 44
    .line 45
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget-object v1, v1, Ly11;->c:Ljava/net/InetSocketAddress;

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v1, " cipherSuite="

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget-object v1, p0, Lzx0;->e:Lnb0;

    .line 59
    .line 60
    if-eqz v1, :cond_0

    .line 61
    .line 62
    iget-object v1, v1, Lnb0;->b:Lek;

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_0
    const-string v1, "none"

    .line 66
    .line 67
    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    const-string v1, " protocol="

    .line 71
    .line 72
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    iget-object p0, p0, Lzx0;->f:Liw0;

    .line 76
    .line 77
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    const/16 p0, 0x7d

    .line 81
    .line 82
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    return-object p0
.end method
