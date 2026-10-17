.class public Lcom/google/firebase/perf/network/FirebasePerfHttpClient;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# direct methods
.method public static execute(Lorg/apache/http/client/HttpClient;Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/client/ResponseHandler;)Ljava/lang/Object;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/apache/http/client/HttpClient;",
            "Lorg/apache/http/HttpHost;",
            "Lorg/apache/http/HttpRequest;",
            "Lorg/apache/http/client/ResponseHandler<",
            "+TT;>;)TT;"
        }
    .end annotation

    .line 242
    new-instance v0, Loc1;

    invoke-direct {v0}, Loc1;-><init>()V

    .line 243
    sget-object v1, Lvd1;->B:Lvd1;

    .line 244
    new-instance v2, Lpp0;

    invoke-direct {v2, v1}, Lpp0;-><init>(Lvd1;)V

    .line 245
    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 246
    invoke-virtual {p1}, Lorg/apache/http/HttpHost;->toURI()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {p2}, Lorg/apache/http/HttpRequest;->getRequestLine()Lorg/apache/http/RequestLine;

    move-result-object v3

    invoke-interface {v3}, Lorg/apache/http/RequestLine;->getUri()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Lpp0;->j(Ljava/lang/String;)V

    .line 247
    invoke-interface {p2}, Lorg/apache/http/HttpRequest;->getRequestLine()Lorg/apache/http/RequestLine;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/http/RequestLine;->getMethod()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Lpp0;->c(Ljava/lang/String;)V

    .line 248
    invoke-static {p2}, Lqp0;->a(Lorg/apache/http/HttpMessage;)Ljava/lang/Long;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 249
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Lpp0;->e(J)V

    goto :goto_0

    :catch_0
    move-exception p0

    goto :goto_1

    .line 250
    :cond_0
    :goto_0
    invoke-virtual {v0}, Loc1;->d()V

    .line 251
    iget-wide v3, v0, Loc1;->j:J

    .line 252
    invoke-virtual {v2, v3, v4}, Lpp0;->f(J)V

    .line 253
    new-instance v1, Lwe0;

    invoke-direct {v1, p3, v0, v2}, Lwe0;-><init>(Lorg/apache/http/client/ResponseHandler;Loc1;Lpp0;)V

    invoke-interface {p0, p1, p2, v1}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/client/ResponseHandler;)Ljava/lang/Object;

    move-result-object p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    .line 254
    :goto_1
    invoke-static {v0, v2, v2}, Loq;->p(Loc1;Lpp0;Lpp0;)V

    .line 255
    throw p0
.end method

.method public static execute(Lorg/apache/http/client/HttpClient;Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/client/ResponseHandler;Lorg/apache/http/protocol/HttpContext;)Ljava/lang/Object;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/apache/http/client/HttpClient;",
            "Lorg/apache/http/HttpHost;",
            "Lorg/apache/http/HttpRequest;",
            "Lorg/apache/http/client/ResponseHandler<",
            "+TT;>;",
            "Lorg/apache/http/protocol/HttpContext;",
            ")TT;"
        }
    .end annotation

    .line 256
    new-instance v0, Loc1;

    invoke-direct {v0}, Loc1;-><init>()V

    .line 257
    sget-object v1, Lvd1;->B:Lvd1;

    .line 258
    new-instance v2, Lpp0;

    invoke-direct {v2, v1}, Lpp0;-><init>(Lvd1;)V

    .line 259
    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 260
    invoke-virtual {p1}, Lorg/apache/http/HttpHost;->toURI()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {p2}, Lorg/apache/http/HttpRequest;->getRequestLine()Lorg/apache/http/RequestLine;

    move-result-object v3

    invoke-interface {v3}, Lorg/apache/http/RequestLine;->getUri()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Lpp0;->j(Ljava/lang/String;)V

    .line 261
    invoke-interface {p2}, Lorg/apache/http/HttpRequest;->getRequestLine()Lorg/apache/http/RequestLine;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/http/RequestLine;->getMethod()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Lpp0;->c(Ljava/lang/String;)V

    .line 262
    invoke-static {p2}, Lqp0;->a(Lorg/apache/http/HttpMessage;)Ljava/lang/Long;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 263
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Lpp0;->e(J)V

    goto :goto_0

    :catch_0
    move-exception p0

    goto :goto_1

    .line 264
    :cond_0
    :goto_0
    invoke-virtual {v0}, Loc1;->d()V

    .line 265
    iget-wide v3, v0, Loc1;->j:J

    .line 266
    invoke-virtual {v2, v3, v4}, Lpp0;->f(J)V

    .line 267
    new-instance v1, Lwe0;

    invoke-direct {v1, p3, v0, v2}, Lwe0;-><init>(Lorg/apache/http/client/ResponseHandler;Loc1;Lpp0;)V

    invoke-interface {p0, p1, p2, v1, p4}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/client/ResponseHandler;Lorg/apache/http/protocol/HttpContext;)Ljava/lang/Object;

    move-result-object p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    .line 268
    :goto_1
    invoke-static {v0, v2, v2}, Loq;->p(Loc1;Lpp0;Lpp0;)V

    .line 269
    throw p0
.end method

.method public static execute(Lorg/apache/http/client/HttpClient;Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/client/ResponseHandler;)Ljava/lang/Object;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/apache/http/client/HttpClient;",
            "Lorg/apache/http/client/methods/HttpUriRequest;",
            "Lorg/apache/http/client/ResponseHandler<",
            "TT;>;)TT;"
        }
    .end annotation

    .line 150
    new-instance v0, Loc1;

    invoke-direct {v0}, Loc1;-><init>()V

    .line 151
    sget-object v1, Lvd1;->B:Lvd1;

    .line 152
    new-instance v2, Lpp0;

    invoke-direct {v2, v1}, Lpp0;-><init>(Lvd1;)V

    .line 153
    :try_start_0
    invoke-interface {p1}, Lorg/apache/http/client/methods/HttpUriRequest;->getURI()Ljava/net/URI;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Lpp0;->j(Ljava/lang/String;)V

    invoke-interface {p1}, Lorg/apache/http/client/methods/HttpUriRequest;->getMethod()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Lpp0;->c(Ljava/lang/String;)V

    .line 154
    invoke-static {p1}, Lqp0;->a(Lorg/apache/http/HttpMessage;)Ljava/lang/Long;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 155
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Lpp0;->e(J)V

    goto :goto_0

    :catch_0
    move-exception p0

    goto :goto_1

    .line 156
    :cond_0
    :goto_0
    invoke-virtual {v0}, Loc1;->d()V

    .line 157
    iget-wide v3, v0, Loc1;->j:J

    .line 158
    invoke-virtual {v2, v3, v4}, Lpp0;->f(J)V

    .line 159
    new-instance v1, Lwe0;

    invoke-direct {v1, p2, v0, v2}, Lwe0;-><init>(Lorg/apache/http/client/ResponseHandler;Loc1;Lpp0;)V

    invoke-interface {p0, p1, v1}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/client/ResponseHandler;)Ljava/lang/Object;

    move-result-object p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    .line 160
    :goto_1
    invoke-static {v0, v2, v2}, Loq;->p(Loc1;Lpp0;Lpp0;)V

    .line 161
    throw p0
.end method

.method public static execute(Lorg/apache/http/client/HttpClient;Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/client/ResponseHandler;Lorg/apache/http/protocol/HttpContext;)Ljava/lang/Object;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/apache/http/client/HttpClient;",
            "Lorg/apache/http/client/methods/HttpUriRequest;",
            "Lorg/apache/http/client/ResponseHandler<",
            "TT;>;",
            "Lorg/apache/http/protocol/HttpContext;",
            ")TT;"
        }
    .end annotation

    .line 230
    new-instance v0, Loc1;

    invoke-direct {v0}, Loc1;-><init>()V

    .line 231
    sget-object v1, Lvd1;->B:Lvd1;

    .line 232
    new-instance v2, Lpp0;

    invoke-direct {v2, v1}, Lpp0;-><init>(Lvd1;)V

    .line 233
    :try_start_0
    invoke-interface {p1}, Lorg/apache/http/client/methods/HttpUriRequest;->getURI()Ljava/net/URI;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Lpp0;->j(Ljava/lang/String;)V

    invoke-interface {p1}, Lorg/apache/http/client/methods/HttpUriRequest;->getMethod()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Lpp0;->c(Ljava/lang/String;)V

    .line 234
    invoke-static {p1}, Lqp0;->a(Lorg/apache/http/HttpMessage;)Ljava/lang/Long;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 235
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Lpp0;->e(J)V

    goto :goto_0

    :catch_0
    move-exception p0

    goto :goto_1

    .line 236
    :cond_0
    :goto_0
    invoke-virtual {v0}, Loc1;->d()V

    .line 237
    iget-wide v3, v0, Loc1;->j:J

    .line 238
    invoke-virtual {v2, v3, v4}, Lpp0;->f(J)V

    .line 239
    new-instance v1, Lwe0;

    invoke-direct {v1, p2, v0, v2}, Lwe0;-><init>(Lorg/apache/http/client/ResponseHandler;Loc1;Lpp0;)V

    invoke-interface {p0, p1, v1, p3}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/client/ResponseHandler;Lorg/apache/http/protocol/HttpContext;)Ljava/lang/Object;

    move-result-object p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    .line 240
    :goto_1
    invoke-static {v0, v2, v2}, Loq;->p(Loc1;Lpp0;Lpp0;)V

    .line 241
    throw p0
.end method

.method public static execute(Lorg/apache/http/client/HttpClient;Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;)Lorg/apache/http/HttpResponse;
    .locals 6

    .line 1
    invoke-static {}, Loc1;->e()J

    .line 2
    .line 3
    .line 4
    invoke-static {}, Loc1;->a()J

    .line 5
    .line 6
    .line 7
    move-result-wide v0

    .line 8
    sget-object v2, Lvd1;->B:Lvd1;

    .line 9
    .line 10
    new-instance v3, Lpp0;

    .line 11
    .line 12
    invoke-direct {v3, v2}, Lpp0;-><init>(Lvd1;)V

    .line 13
    .line 14
    .line 15
    :try_start_0
    new-instance v2, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1}, Lorg/apache/http/HttpHost;->toURI()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v4

    .line 24
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-interface {p2}, Lorg/apache/http/HttpRequest;->getRequestLine()Lorg/apache/http/RequestLine;

    .line 28
    .line 29
    .line 30
    move-result-object v4

    .line 31
    invoke-interface {v4}, Lorg/apache/http/RequestLine;->getUri()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v4

    .line 35
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    invoke-virtual {v3, v2}, Lpp0;->j(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    invoke-interface {p2}, Lorg/apache/http/HttpRequest;->getRequestLine()Lorg/apache/http/RequestLine;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    invoke-interface {v2}, Lorg/apache/http/RequestLine;->getMethod()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    invoke-virtual {v3, v2}, Lpp0;->c(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    invoke-static {p2}, Lqp0;->a(Lorg/apache/http/HttpMessage;)Ljava/lang/Long;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    if-eqz v2, :cond_0

    .line 61
    .line 62
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    .line 63
    .line 64
    .line 65
    move-result-wide v4

    .line 66
    invoke-virtual {v3, v4, v5}, Lpp0;->e(J)V

    .line 67
    .line 68
    .line 69
    goto :goto_0

    .line 70
    :catch_0
    move-exception p0

    .line 71
    goto :goto_1

    .line 72
    :cond_0
    :goto_0
    invoke-static {}, Loc1;->e()J

    .line 73
    .line 74
    .line 75
    move-result-wide v4

    .line 76
    invoke-static {}, Loc1;->a()J

    .line 77
    .line 78
    .line 79
    move-result-wide v0

    .line 80
    invoke-virtual {v3, v4, v5}, Lpp0;->f(J)V

    .line 81
    .line 82
    .line 83
    invoke-interface {p0, p1, p2}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;)Lorg/apache/http/HttpResponse;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-static {}, Loc1;->e()J

    .line 88
    .line 89
    .line 90
    invoke-static {}, Loc1;->a()J

    .line 91
    .line 92
    .line 93
    move-result-wide p1

    .line 94
    sub-long/2addr p1, v0

    .line 95
    invoke-virtual {v3, p1, p2}, Lpp0;->i(J)V

    .line 96
    .line 97
    .line 98
    invoke-interface {p0}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    invoke-interface {p1}, Lorg/apache/http/StatusLine;->getStatusCode()I

    .line 103
    .line 104
    .line 105
    move-result p1

    .line 106
    invoke-virtual {v3, p1}, Lpp0;->d(I)V

    .line 107
    .line 108
    .line 109
    invoke-static {p0}, Lqp0;->a(Lorg/apache/http/HttpMessage;)Ljava/lang/Long;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    if-eqz p1, :cond_1

    .line 114
    .line 115
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 116
    .line 117
    .line 118
    move-result-wide p1

    .line 119
    invoke-virtual {v3, p1, p2}, Lpp0;->h(J)V

    .line 120
    .line 121
    .line 122
    :cond_1
    invoke-static {p0}, Lqp0;->b(Lorg/apache/http/HttpResponse;)Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    if-eqz p1, :cond_2

    .line 127
    .line 128
    invoke-virtual {v3, p1}, Lpp0;->g(Ljava/lang/String;)V

    .line 129
    .line 130
    .line 131
    :cond_2
    invoke-virtual {v3}, Lpp0;->b()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 132
    .line 133
    .line 134
    return-object p0

    .line 135
    :goto_1
    invoke-static {}, Loc1;->e()J

    .line 136
    .line 137
    .line 138
    invoke-static {}, Loc1;->a()J

    .line 139
    .line 140
    .line 141
    move-result-wide p1

    .line 142
    sub-long/2addr p1, v0

    .line 143
    invoke-virtual {v3, p1, p2}, Lpp0;->i(J)V

    .line 144
    .line 145
    .line 146
    invoke-static {v3}, Lqp0;->c(Lpp0;)V

    .line 147
    .line 148
    .line 149
    throw p0
.end method

.method public static execute(Lorg/apache/http/client/HttpClient;Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;
    .locals 6

    .line 162
    invoke-static {}, Loc1;->e()J

    invoke-static {}, Loc1;->a()J

    move-result-wide v0

    .line 163
    sget-object v2, Lvd1;->B:Lvd1;

    .line 164
    new-instance v3, Lpp0;

    invoke-direct {v3, v2}, Lpp0;-><init>(Lvd1;)V

    .line 165
    :try_start_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 166
    invoke-virtual {p1}, Lorg/apache/http/HttpHost;->toURI()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {p2}, Lorg/apache/http/HttpRequest;->getRequestLine()Lorg/apache/http/RequestLine;

    move-result-object v4

    invoke-interface {v4}, Lorg/apache/http/RequestLine;->getUri()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Lpp0;->j(Ljava/lang/String;)V

    .line 167
    invoke-interface {p2}, Lorg/apache/http/HttpRequest;->getRequestLine()Lorg/apache/http/RequestLine;

    move-result-object v2

    invoke-interface {v2}, Lorg/apache/http/RequestLine;->getMethod()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Lpp0;->c(Ljava/lang/String;)V

    .line 168
    invoke-static {p2}, Lqp0;->a(Lorg/apache/http/HttpMessage;)Ljava/lang/Long;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 169
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Lpp0;->e(J)V

    goto :goto_0

    :catch_0
    move-exception p0

    goto :goto_1

    .line 170
    :cond_0
    :goto_0
    invoke-static {}, Loc1;->e()J

    move-result-wide v4

    .line 171
    invoke-static {}, Loc1;->a()J

    move-result-wide v0

    .line 172
    invoke-virtual {v3, v4, v5}, Lpp0;->f(J)V

    .line 173
    invoke-interface {p0, p1, p2, p3}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object p0

    .line 174
    invoke-static {}, Loc1;->e()J

    invoke-static {}, Loc1;->a()J

    move-result-wide p1

    sub-long/2addr p1, v0

    .line 175
    invoke-virtual {v3, p1, p2}, Lpp0;->i(J)V

    .line 176
    invoke-interface {p0}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object p1

    invoke-interface {p1}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result p1

    invoke-virtual {v3, p1}, Lpp0;->d(I)V

    .line 177
    invoke-static {p0}, Lqp0;->a(Lorg/apache/http/HttpMessage;)Ljava/lang/Long;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 178
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide p1

    invoke-virtual {v3, p1, p2}, Lpp0;->h(J)V

    .line 179
    :cond_1
    invoke-static {p0}, Lqp0;->b(Lorg/apache/http/HttpResponse;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_2

    .line 180
    invoke-virtual {v3, p1}, Lpp0;->g(Ljava/lang/String;)V

    .line 181
    :cond_2
    invoke-virtual {v3}, Lpp0;->b()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    .line 182
    :goto_1
    invoke-static {}, Loc1;->e()J

    invoke-static {}, Loc1;->a()J

    move-result-wide p1

    sub-long/2addr p1, v0

    .line 183
    invoke-virtual {v3, p1, p2}, Lpp0;->i(J)V

    .line 184
    invoke-static {v3}, Lqp0;->c(Lpp0;)V

    .line 185
    throw p0
.end method

.method public static execute(Lorg/apache/http/client/HttpClient;Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;
    .locals 6

    .line 186
    invoke-static {}, Loc1;->e()J

    invoke-static {}, Loc1;->a()J

    move-result-wide v0

    .line 187
    sget-object v2, Lvd1;->B:Lvd1;

    .line 188
    new-instance v3, Lpp0;

    invoke-direct {v3, v2}, Lpp0;-><init>(Lvd1;)V

    .line 189
    :try_start_0
    invoke-interface {p1}, Lorg/apache/http/client/methods/HttpUriRequest;->getURI()Ljava/net/URI;

    move-result-object v2

    invoke-virtual {v2}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Lpp0;->j(Ljava/lang/String;)V

    invoke-interface {p1}, Lorg/apache/http/client/methods/HttpUriRequest;->getMethod()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Lpp0;->c(Ljava/lang/String;)V

    .line 190
    invoke-static {p1}, Lqp0;->a(Lorg/apache/http/HttpMessage;)Ljava/lang/Long;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 191
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Lpp0;->e(J)V

    goto :goto_0

    :catch_0
    move-exception p0

    goto :goto_1

    .line 192
    :cond_0
    :goto_0
    invoke-static {}, Loc1;->e()J

    move-result-wide v4

    .line 193
    invoke-static {}, Loc1;->a()J

    move-result-wide v0

    .line 194
    invoke-virtual {v3, v4, v5}, Lpp0;->f(J)V

    .line 195
    invoke-interface {p0, p1}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object p0

    .line 196
    invoke-static {}, Loc1;->e()J

    invoke-static {}, Loc1;->a()J

    move-result-wide v4

    sub-long/2addr v4, v0

    .line 197
    invoke-virtual {v3, v4, v5}, Lpp0;->i(J)V

    .line 198
    invoke-interface {p0}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object p1

    invoke-interface {p1}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result p1

    invoke-virtual {v3, p1}, Lpp0;->d(I)V

    .line 199
    invoke-static {p0}, Lqp0;->a(Lorg/apache/http/HttpMessage;)Ljava/lang/Long;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 200
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Lpp0;->h(J)V

    .line 201
    :cond_1
    invoke-static {p0}, Lqp0;->b(Lorg/apache/http/HttpResponse;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_2

    .line 202
    invoke-virtual {v3, p1}, Lpp0;->g(Ljava/lang/String;)V

    .line 203
    :cond_2
    invoke-virtual {v3}, Lpp0;->b()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    .line 204
    :goto_1
    invoke-static {}, Loc1;->e()J

    invoke-static {}, Loc1;->a()J

    move-result-wide v4

    sub-long/2addr v4, v0

    .line 205
    invoke-virtual {v3, v4, v5}, Lpp0;->i(J)V

    .line 206
    invoke-static {v3}, Lqp0;->c(Lpp0;)V

    .line 207
    throw p0
.end method

.method public static execute(Lorg/apache/http/client/HttpClient;Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;
    .locals 6

    .line 208
    invoke-static {}, Loc1;->e()J

    invoke-static {}, Loc1;->a()J

    move-result-wide v0

    .line 209
    sget-object v2, Lvd1;->B:Lvd1;

    .line 210
    new-instance v3, Lpp0;

    invoke-direct {v3, v2}, Lpp0;-><init>(Lvd1;)V

    .line 211
    :try_start_0
    invoke-interface {p1}, Lorg/apache/http/client/methods/HttpUriRequest;->getURI()Ljava/net/URI;

    move-result-object v2

    invoke-virtual {v2}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Lpp0;->j(Ljava/lang/String;)V

    invoke-interface {p1}, Lorg/apache/http/client/methods/HttpUriRequest;->getMethod()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Lpp0;->c(Ljava/lang/String;)V

    .line 212
    invoke-static {p1}, Lqp0;->a(Lorg/apache/http/HttpMessage;)Ljava/lang/Long;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 213
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Lpp0;->e(J)V

    goto :goto_0

    :catch_0
    move-exception p0

    goto :goto_1

    .line 214
    :cond_0
    :goto_0
    invoke-static {}, Loc1;->e()J

    move-result-wide v4

    .line 215
    invoke-static {}, Loc1;->a()J

    move-result-wide v0

    .line 216
    invoke-virtual {v3, v4, v5}, Lpp0;->f(J)V

    .line 217
    invoke-interface {p0, p1, p2}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object p0

    .line 218
    invoke-static {}, Loc1;->e()J

    invoke-static {}, Loc1;->a()J

    move-result-wide p1

    sub-long/2addr p1, v0

    .line 219
    invoke-virtual {v3, p1, p2}, Lpp0;->i(J)V

    .line 220
    invoke-interface {p0}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object p1

    invoke-interface {p1}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result p1

    invoke-virtual {v3, p1}, Lpp0;->d(I)V

    .line 221
    invoke-static {p0}, Lqp0;->a(Lorg/apache/http/HttpMessage;)Ljava/lang/Long;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 222
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide p1

    invoke-virtual {v3, p1, p2}, Lpp0;->h(J)V

    .line 223
    :cond_1
    invoke-static {p0}, Lqp0;->b(Lorg/apache/http/HttpResponse;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_2

    .line 224
    invoke-virtual {v3, p1}, Lpp0;->g(Ljava/lang/String;)V

    .line 225
    :cond_2
    invoke-virtual {v3}, Lpp0;->b()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    .line 226
    :goto_1
    invoke-static {}, Loc1;->e()J

    invoke-static {}, Loc1;->a()J

    move-result-wide p1

    sub-long/2addr p1, v0

    .line 227
    invoke-virtual {v3, p1, p2}, Lpp0;->i(J)V

    .line 228
    invoke-static {v3}, Lqp0;->c(Lpp0;)V

    .line 229
    throw p0
.end method
