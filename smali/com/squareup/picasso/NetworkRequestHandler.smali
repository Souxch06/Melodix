.class Lcom/squareup/picasso/NetworkRequestHandler;
.super Lcom/squareup/picasso/RequestHandler;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/squareup/picasso/NetworkRequestHandler$ResponseException;,
        Lcom/squareup/picasso/NetworkRequestHandler$ContentLengthException;
    }
.end annotation


# static fields
.field private static final SCHEME_HTTP:Ljava/lang/String; = "http"

.field private static final SCHEME_HTTPS:Ljava/lang/String; = "https"


# instance fields
.field private final downloader:Lcom/squareup/picasso/Downloader;

.field private final stats:Lcom/squareup/picasso/Stats;


# direct methods
.method public constructor <init>(Lcom/squareup/picasso/Downloader;Lcom/squareup/picasso/Stats;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/squareup/picasso/RequestHandler;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/squareup/picasso/NetworkRequestHandler;->downloader:Lcom/squareup/picasso/Downloader;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/squareup/picasso/NetworkRequestHandler;->stats:Lcom/squareup/picasso/Stats;

    .line 7
    .line 8
    return-void
.end method

.method private static createRequest(Lcom/squareup/picasso/Request;I)Lm01;
    .locals 17

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    if-eqz p1, :cond_1

    .line 4
    .line 5
    invoke-static/range {p1 .. p1}, Lcom/squareup/picasso/NetworkPolicy;->isOfflineOnly(I)Z

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    if-eqz v2, :cond_0

    .line 10
    .line 11
    sget-object v2, Lci;->n:Lci;

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-static/range {p1 .. p1}, Lcom/squareup/picasso/NetworkPolicy;->shouldReadFromDiskCache(I)Z

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    xor-int/lit8 v4, v2, 0x1

    .line 19
    .line 20
    invoke-static/range {p1 .. p1}, Lcom/squareup/picasso/NetworkPolicy;->shouldWriteToDiskCache(I)Z

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    xor-int/lit8 v5, v2, 0x1

    .line 25
    .line 26
    new-instance v3, Lci;

    .line 27
    .line 28
    const/4 v15, 0x0

    .line 29
    const/16 v16, 0x0

    .line 30
    .line 31
    const/4 v6, -0x1

    .line 32
    const/4 v7, -0x1

    .line 33
    const/4 v8, 0x0

    .line 34
    const/4 v9, 0x0

    .line 35
    const/4 v10, 0x0

    .line 36
    const/4 v11, -0x1

    .line 37
    const/4 v12, -0x1

    .line 38
    const/4 v13, 0x0

    .line 39
    const/4 v14, 0x0

    .line 40
    invoke-direct/range {v3 .. v16}, Lci;-><init>(ZZIIZZZIIZZZLjava/lang/String;)V

    .line 41
    .line 42
    .line 43
    move-object v2, v3

    .line 44
    goto :goto_0

    .line 45
    :cond_1
    move-object v2, v1

    .line 46
    :goto_0
    new-instance v3, Ljava/util/LinkedHashMap;

    .line 47
    .line 48
    invoke-direct {v3}, Ljava/util/LinkedHashMap;-><init>()V

    .line 49
    .line 50
    .line 51
    new-instance v4, Lrb0;

    .line 52
    .line 53
    invoke-direct {v4}, Lrb0;-><init>()V

    .line 54
    .line 55
    .line 56
    move-object/from16 v5, p0

    .line 57
    .line 58
    iget-object v5, v5, Lcom/squareup/picasso/Request;->uri:Landroid/net/Uri;

    .line 59
    .line 60
    invoke-virtual {v5}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v5

    .line 64
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 65
    .line 66
    .line 67
    const-string v6, "ws:"

    .line 68
    .line 69
    invoke-static {v5, v6, v0}, Lla1;->x(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 70
    .line 71
    .line 72
    move-result v6

    .line 73
    if-eqz v6, :cond_2

    .line 74
    .line 75
    const/4 v0, 0x3

    .line 76
    invoke-virtual {v5, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    const-string v5, "http:"

    .line 81
    .line 82
    invoke-virtual {v5, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v5

    .line 86
    goto :goto_1

    .line 87
    :cond_2
    const-string v6, "wss:"

    .line 88
    .line 89
    invoke-static {v5, v6, v0}, Lla1;->x(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    if-eqz v0, :cond_3

    .line 94
    .line 95
    const/4 v0, 0x4

    .line 96
    invoke-virtual {v5, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    const-string v5, "https:"

    .line 101
    .line 102
    invoke-virtual {v5, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v5

    .line 106
    :cond_3
    :goto_1
    new-instance v0, Ldd0;

    .line 107
    .line 108
    invoke-direct {v0}, Ldd0;-><init>()V

    .line 109
    .line 110
    .line 111
    invoke-virtual {v0, v1, v5}, Ldd0;->c(Led0;Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {v0}, Ldd0;->a()Led0;

    .line 115
    .line 116
    .line 117
    move-result-object v7

    .line 118
    if-eqz v2, :cond_5

    .line 119
    .line 120
    invoke-virtual {v2}, Lci;->toString()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 125
    .line 126
    .line 127
    move-result v1

    .line 128
    const-string v2, "Cache-Control"

    .line 129
    .line 130
    if-nez v1, :cond_4

    .line 131
    .line 132
    invoke-virtual {v4, v2}, Lrb0;->e(Ljava/lang/String;)V

    .line 133
    .line 134
    .line 135
    goto :goto_2

    .line 136
    :cond_4
    invoke-virtual {v4, v2, v0}, Lrb0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    :cond_5
    :goto_2
    invoke-virtual {v4}, Lrb0;->c()Lsb0;

    .line 140
    .line 141
    .line 142
    move-result-object v9

    .line 143
    sget-object v0, Ljg1;->a:[B

    .line 144
    .line 145
    invoke-interface {v3}, Ljava/util/Map;->isEmpty()Z

    .line 146
    .line 147
    .line 148
    move-result v0

    .line 149
    if-eqz v0, :cond_6

    .line 150
    .line 151
    sget-object v0, Lv00;->j:Lv00;

    .line 152
    .line 153
    :goto_3
    move-object v11, v0

    .line 154
    goto :goto_4

    .line 155
    :cond_6
    new-instance v0, Ljava/util/LinkedHashMap;

    .line 156
    .line 157
    invoke-direct {v0, v3}, Ljava/util/LinkedHashMap;-><init>(Ljava/util/Map;)V

    .line 158
    .line 159
    .line 160
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 165
    .line 166
    .line 167
    goto :goto_3

    .line 168
    :goto_4
    new-instance v6, Lm01;

    .line 169
    .line 170
    const-string v8, "GET"

    .line 171
    .line 172
    const/4 v10, 0x0

    .line 173
    invoke-direct/range {v6 .. v11}, Lm01;-><init>(Led0;Ljava/lang/String;Lsb0;Lkp1;Ljava/util/Map;)V

    .line 174
    .line 175
    .line 176
    return-object v6
.end method


# virtual methods
.method public canHandleRequest(Lcom/squareup/picasso/Request;)Z
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/squareup/picasso/Request;->uri:Landroid/net/Uri;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string p1, "http"

    .line 8
    .line 9
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-nez p1, :cond_1

    .line 14
    .line 15
    const-string p1, "https"

    .line 16
    .line 17
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/4 p0, 0x0

    .line 25
    return p0

    .line 26
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 27
    return p0
.end method

.method public getRetryCount()I
    .locals 0

    .line 1
    const/4 p0, 0x2

    .line 2
    return p0
.end method

.method public load(Lcom/squareup/picasso/Request;I)Lcom/squareup/picasso/RequestHandler$Result;
    .locals 5

    .line 1
    invoke-static {p1, p2}, Lcom/squareup/picasso/NetworkRequestHandler;->createRequest(Lcom/squareup/picasso/Request;I)Lm01;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    iget-object v0, p0, Lcom/squareup/picasso/NetworkRequestHandler;->downloader:Lcom/squareup/picasso/Downloader;

    .line 6
    .line 7
    invoke-interface {v0, p2}, Lcom/squareup/picasso/Downloader;->load(Lm01;)Lf11;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    iget-object v0, p2, Lf11;->p:Lh11;

    .line 12
    .line 13
    iget v1, p2, Lf11;->m:I

    .line 14
    .line 15
    const/16 v2, 0xc8

    .line 16
    .line 17
    if-gt v2, v1, :cond_4

    .line 18
    .line 19
    const/16 v2, 0x12c

    .line 20
    .line 21
    if-ge v1, v2, :cond_4

    .line 22
    .line 23
    iget-object p1, p2, Lf11;->r:Lf11;

    .line 24
    .line 25
    if-nez p1, :cond_0

    .line 26
    .line 27
    sget-object p1, Lcom/squareup/picasso/Picasso$LoadedFrom;->NETWORK:Lcom/squareup/picasso/Picasso$LoadedFrom;

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    sget-object p1, Lcom/squareup/picasso/Picasso$LoadedFrom;->DISK:Lcom/squareup/picasso/Picasso$LoadedFrom;

    .line 31
    .line 32
    :goto_0
    sget-object p2, Lcom/squareup/picasso/Picasso$LoadedFrom;->DISK:Lcom/squareup/picasso/Picasso$LoadedFrom;

    .line 33
    .line 34
    const-wide/16 v1, 0x0

    .line 35
    .line 36
    if-ne p1, p2, :cond_2

    .line 37
    .line 38
    invoke-virtual {v0}, Lh11;->a()J

    .line 39
    .line 40
    .line 41
    move-result-wide v3

    .line 42
    cmp-long p2, v3, v1

    .line 43
    .line 44
    if-eqz p2, :cond_1

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_1
    invoke-virtual {v0}, Lh11;->close()V

    .line 48
    .line 49
    .line 50
    new-instance p0, Lcom/squareup/picasso/NetworkRequestHandler$ContentLengthException;

    .line 51
    .line 52
    const-string p1, "Received response with 0 content-length header."

    .line 53
    .line 54
    invoke-direct {p0, p1}, Lcom/squareup/picasso/NetworkRequestHandler$ContentLengthException;-><init>(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    throw p0

    .line 58
    :cond_2
    :goto_1
    sget-object p2, Lcom/squareup/picasso/Picasso$LoadedFrom;->NETWORK:Lcom/squareup/picasso/Picasso$LoadedFrom;

    .line 59
    .line 60
    if-ne p1, p2, :cond_3

    .line 61
    .line 62
    invoke-virtual {v0}, Lh11;->a()J

    .line 63
    .line 64
    .line 65
    move-result-wide v3

    .line 66
    cmp-long p2, v3, v1

    .line 67
    .line 68
    if-lez p2, :cond_3

    .line 69
    .line 70
    iget-object p0, p0, Lcom/squareup/picasso/NetworkRequestHandler;->stats:Lcom/squareup/picasso/Stats;

    .line 71
    .line 72
    invoke-virtual {v0}, Lh11;->a()J

    .line 73
    .line 74
    .line 75
    move-result-wide v1

    .line 76
    invoke-virtual {p0, v1, v2}, Lcom/squareup/picasso/Stats;->dispatchDownloadFinished(J)V

    .line 77
    .line 78
    .line 79
    :cond_3
    new-instance p0, Lcom/squareup/picasso/RequestHandler$Result;

    .line 80
    .line 81
    invoke-virtual {v0}, Lh11;->h()Llh;

    .line 82
    .line 83
    .line 84
    move-result-object p2

    .line 85
    invoke-direct {p0, p2, p1}, Lcom/squareup/picasso/RequestHandler$Result;-><init>(Lp81;Lcom/squareup/picasso/Picasso$LoadedFrom;)V

    .line 86
    .line 87
    .line 88
    return-object p0

    .line 89
    :cond_4
    invoke-virtual {v0}, Lh11;->close()V

    .line 90
    .line 91
    .line 92
    new-instance p0, Lcom/squareup/picasso/NetworkRequestHandler$ResponseException;

    .line 93
    .line 94
    iget p1, p1, Lcom/squareup/picasso/Request;->networkPolicy:I

    .line 95
    .line 96
    invoke-direct {p0, v1, p1}, Lcom/squareup/picasso/NetworkRequestHandler$ResponseException;-><init>(II)V

    .line 97
    .line 98
    .line 99
    throw p0
.end method

.method public shouldRetry(ZLandroid/net/NetworkInfo;)Z
    .locals 0

    .line 1
    if-eqz p2, :cond_1

    .line 2
    .line 3
    invoke-virtual {p2}, Landroid/net/NetworkInfo;->isConnected()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0

    .line 12
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 13
    return p0
.end method

.method public supportsReplay()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method
