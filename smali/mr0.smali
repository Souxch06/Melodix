.class public final Lmr0;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Lgi;


# static fields
.field public static final v:Ljava/util/List;

.field public static final w:Ljava/util/List;


# instance fields
.field public final j:Ler0;

.field public final k:Lbv1;

.field public final l:Ljava/util/List;

.field public final m:Ljava/util/List;

.field public final n:Lbi;

.field public final o:Ljava/net/ProxySelector;

.field public final p:Ljavax/net/SocketFactory;

.field public final q:Ljavax/net/ssl/SSLSocketFactory;

.field public final r:Ljava/util/List;

.field public final s:Ljava/util/List;

.field public final t:Lij;

.field public final u:Lpa0;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    sget-object v0, Liw0;->n:Liw0;

    .line 2
    .line 3
    sget-object v1, Liw0;->l:Liw0;

    .line 4
    .line 5
    filled-new-array {v0, v1}, [Liw0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Ljg1;->i([Ljava/lang/Object;)Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sput-object v0, Lmr0;->v:Ljava/util/List;

    .line 14
    .line 15
    sget-object v0, Lro;->e:Lro;

    .line 16
    .line 17
    sget-object v1, Lro;->f:Lro;

    .line 18
    .line 19
    filled-new-array {v0, v1}, [Lro;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {v0}, Ljg1;->i([Ljava/lang/Object;)Ljava/util/List;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    sput-object v0, Lmr0;->w:Ljava/util/List;

    .line 28
    .line 29
    return-void
.end method

.method public constructor <init>(Lke;)V
    .locals 6

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Lke;->a:Ljava/lang/Object;

    .line 5
    .line 6
    check-cast v0, Ler0;

    .line 7
    .line 8
    iput-object v0, p0, Lmr0;->j:Ler0;

    .line 9
    .line 10
    iget-object v0, p1, Lke;->b:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast v0, Lbv1;

    .line 13
    .line 14
    iput-object v0, p0, Lmr0;->k:Lbv1;

    .line 15
    .line 16
    iget-object v0, p1, Lke;->c:Ljava/io/Serializable;

    .line 17
    .line 18
    check-cast v0, Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-static {v0}, Ljg1;->q(Ljava/util/List;)Ljava/util/List;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iput-object v0, p0, Lmr0;->l:Ljava/util/List;

    .line 25
    .line 26
    iget-object v0, p1, Lke;->d:Ljava/io/Serializable;

    .line 27
    .line 28
    check-cast v0, Ljava/util/ArrayList;

    .line 29
    .line 30
    invoke-static {v0}, Ljg1;->q(Ljava/util/List;)Ljava/util/List;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iput-object v0, p0, Lmr0;->m:Ljava/util/List;

    .line 35
    .line 36
    iget-object v0, p1, Lke;->f:Ljava/lang/Object;

    .line 37
    .line 38
    check-cast v0, Lbi;

    .line 39
    .line 40
    iput-object v0, p0, Lmr0;->n:Lbi;

    .line 41
    .line 42
    invoke-static {}, Ljava/net/ProxySelector;->getDefault()Ljava/net/ProxySelector;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    if-nez v0, :cond_0

    .line 47
    .line 48
    sget-object v0, Lfr0;->a:Lfr0;

    .line 49
    .line 50
    :cond_0
    iput-object v0, p0, Lmr0;->o:Ljava/net/ProxySelector;

    .line 51
    .line 52
    iget-object v0, p1, Lke;->g:Ljava/lang/Object;

    .line 53
    .line 54
    check-cast v0, Ljavax/net/SocketFactory;

    .line 55
    .line 56
    iput-object v0, p0, Lmr0;->p:Ljavax/net/SocketFactory;

    .line 57
    .line 58
    iget-object v0, p1, Lke;->h:Ljava/lang/Object;

    .line 59
    .line 60
    check-cast v0, Ljava/util/List;

    .line 61
    .line 62
    iput-object v0, p0, Lmr0;->r:Ljava/util/List;

    .line 63
    .line 64
    iget-object v1, p1, Lke;->i:Ljava/lang/Object;

    .line 65
    .line 66
    check-cast v1, Ljava/util/List;

    .line 67
    .line 68
    iput-object v1, p0, Lmr0;->s:Ljava/util/List;

    .line 69
    .line 70
    new-instance v1, Lpa0;

    .line 71
    .line 72
    const/16 v2, 0x16

    .line 73
    .line 74
    invoke-direct {v1, v2}, Lpa0;-><init>(I)V

    .line 75
    .line 76
    .line 77
    iput-object v1, p0, Lmr0;->u:Lpa0;

    .line 78
    .line 79
    const/4 v1, 0x0

    .line 80
    if-eqz v0, :cond_1

    .line 81
    .line 82
    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    .line 83
    .line 84
    .line 85
    move-result v2

    .line 86
    if-eqz v2, :cond_1

    .line 87
    .line 88
    goto :goto_1

    .line 89
    :cond_1
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 94
    .line 95
    .line 96
    move-result v2

    .line 97
    if-eqz v2, :cond_4

    .line 98
    .line 99
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    move-result-object v2

    .line 103
    check-cast v2, Lro;

    .line 104
    .line 105
    iget-boolean v2, v2, Lro;->a:Z

    .line 106
    .line 107
    if-eqz v2, :cond_2

    .line 108
    .line 109
    sget-object v0, Lgt0;->a:Lgt0;

    .line 110
    .line 111
    sget-object v0, Lgt0;->a:Lgt0;

    .line 112
    .line 113
    invoke-virtual {v0}, Lgt0;->m()Ljavax/net/ssl/X509TrustManager;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    sget-object v2, Lgt0;->a:Lgt0;

    .line 118
    .line 119
    invoke-virtual {v2, v0}, Lgt0;->l(Ljavax/net/ssl/X509TrustManager;)Ljavax/net/ssl/SSLSocketFactory;

    .line 120
    .line 121
    .line 122
    move-result-object v2

    .line 123
    iput-object v2, p0, Lmr0;->q:Ljavax/net/ssl/SSLSocketFactory;

    .line 124
    .line 125
    sget-object v3, Lgt0;->a:Lgt0;

    .line 126
    .line 127
    invoke-virtual {v3, v0}, Lgt0;->b(Ljavax/net/ssl/X509TrustManager;)Lbv;

    .line 128
    .line 129
    .line 130
    move-result-object v3

    .line 131
    iget-object p1, p1, Lke;->j:Ljava/lang/Object;

    .line 132
    .line 133
    check-cast p1, Lij;

    .line 134
    .line 135
    iget-object v4, p1, Lij;->b:Lbv;

    .line 136
    .line 137
    invoke-static {v4, v3}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 138
    .line 139
    .line 140
    move-result v4

    .line 141
    if-eqz v4, :cond_3

    .line 142
    .line 143
    goto :goto_0

    .line 144
    :cond_3
    new-instance v4, Lij;

    .line 145
    .line 146
    iget-object p1, p1, Lij;->a:Ljava/util/Set;

    .line 147
    .line 148
    invoke-direct {v4, p1, v3}, Lij;-><init>(Ljava/util/Set;Lbv;)V

    .line 149
    .line 150
    .line 151
    move-object p1, v4

    .line 152
    :goto_0
    iput-object p1, p0, Lmr0;->t:Lij;

    .line 153
    .line 154
    goto :goto_2

    .line 155
    :cond_4
    :goto_1
    iput-object v1, p0, Lmr0;->q:Ljavax/net/ssl/SSLSocketFactory;

    .line 156
    .line 157
    sget-object p1, Lij;->c:Lij;

    .line 158
    .line 159
    iput-object p1, p0, Lmr0;->t:Lij;

    .line 160
    .line 161
    move-object v0, v1

    .line 162
    move-object v2, v0

    .line 163
    move-object v3, v2

    .line 164
    :goto_2
    iget-object p1, p0, Lmr0;->m:Ljava/util/List;

    .line 165
    .line 166
    iget-object v4, p0, Lmr0;->l:Ljava/util/List;

    .line 167
    .line 168
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 169
    .line 170
    .line 171
    invoke-interface {v4, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 172
    .line 173
    .line 174
    move-result v5

    .line 175
    if-nez v5, :cond_10

    .line 176
    .line 177
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 178
    .line 179
    .line 180
    invoke-interface {p1, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 181
    .line 182
    .line 183
    move-result v4

    .line 184
    if-nez v4, :cond_f

    .line 185
    .line 186
    iget-object p1, p0, Lmr0;->r:Ljava/util/List;

    .line 187
    .line 188
    if-eqz p1, :cond_5

    .line 189
    .line 190
    invoke-interface {p1}, Ljava/util/Collection;->isEmpty()Z

    .line 191
    .line 192
    .line 193
    move-result v4

    .line 194
    if-eqz v4, :cond_5

    .line 195
    .line 196
    goto :goto_3

    .line 197
    :cond_5
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 198
    .line 199
    .line 200
    move-result-object p1

    .line 201
    :cond_6
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 202
    .line 203
    .line 204
    move-result v4

    .line 205
    if-eqz v4, :cond_a

    .line 206
    .line 207
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 208
    .line 209
    .line 210
    move-result-object v4

    .line 211
    check-cast v4, Lro;

    .line 212
    .line 213
    iget-boolean v4, v4, Lro;->a:Z

    .line 214
    .line 215
    if-eqz v4, :cond_6

    .line 216
    .line 217
    if-eqz v2, :cond_9

    .line 218
    .line 219
    if-eqz v3, :cond_8

    .line 220
    .line 221
    if-eqz v0, :cond_7

    .line 222
    .line 223
    goto :goto_4

    .line 224
    :cond_7
    const-string p0, "x509TrustManager == null"

    .line 225
    .line 226
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 227
    .line 228
    .line 229
    throw v1

    .line 230
    :cond_8
    const-string p0, "certificateChainCleaner == null"

    .line 231
    .line 232
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 233
    .line 234
    .line 235
    throw v1

    .line 236
    :cond_9
    const-string p0, "sslSocketFactory == null"

    .line 237
    .line 238
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 239
    .line 240
    .line 241
    throw v1

    .line 242
    :cond_a
    :goto_3
    const-string p1, "Check failed."

    .line 243
    .line 244
    if-nez v2, :cond_e

    .line 245
    .line 246
    if-nez v3, :cond_d

    .line 247
    .line 248
    if-nez v0, :cond_c

    .line 249
    .line 250
    iget-object p0, p0, Lmr0;->t:Lij;

    .line 251
    .line 252
    sget-object v0, Lij;->c:Lij;

    .line 253
    .line 254
    invoke-static {p0, v0}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 255
    .line 256
    .line 257
    move-result p0

    .line 258
    if-eqz p0, :cond_b

    .line 259
    .line 260
    :goto_4
    return-void

    .line 261
    :cond_b
    invoke-static {p1}, Lz0;->g(Ljava/lang/String;)V

    .line 262
    .line 263
    .line 264
    throw v1

    .line 265
    :cond_c
    invoke-static {p1}, Lz0;->g(Ljava/lang/String;)V

    .line 266
    .line 267
    .line 268
    throw v1

    .line 269
    :cond_d
    invoke-static {p1}, Lz0;->g(Ljava/lang/String;)V

    .line 270
    .line 271
    .line 272
    throw v1

    .line 273
    :cond_e
    invoke-static {p1}, Lz0;->g(Ljava/lang/String;)V

    .line 274
    .line 275
    .line 276
    throw v1

    .line 277
    :cond_f
    const-string p0, "Null network interceptor: "

    .line 278
    .line 279
    invoke-static {p1, p0}, Lo40;->w(Ljava/lang/Object;Ljava/lang/String;)V

    .line 280
    .line 281
    .line 282
    throw v1

    .line 283
    :cond_10
    const-string p0, "Null interceptor: "

    .line 284
    .line 285
    invoke-static {v4, p0}, Lo40;->w(Ljava/lang/Object;Ljava/lang/String;)V

    .line 286
    .line 287
    .line 288
    throw v1
.end method


# virtual methods
.method public final clone()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
