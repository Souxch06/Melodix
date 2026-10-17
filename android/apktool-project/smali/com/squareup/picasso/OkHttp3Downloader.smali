.class public final Lcom/squareup/picasso/OkHttp3Downloader;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lcom/squareup/picasso/Downloader;


# instance fields
.field private final cache:Lbi;

.field final client:Lgi;

.field private sharedClient:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 86
    invoke-static {p1}, Lcom/squareup/picasso/Utils;->createDefaultCacheDir(Landroid/content/Context;)Ljava/io/File;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/squareup/picasso/OkHttp3Downloader;-><init>(Ljava/io/File;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;J)V
    .locals 0

    .line 85
    invoke-static {p1}, Lcom/squareup/picasso/Utils;->createDefaultCacheDir(Landroid/content/Context;)Ljava/io/File;

    move-result-object p1

    invoke-direct {p0, p1, p2, p3}, Lcom/squareup/picasso/OkHttp3Downloader;-><init>(Ljava/io/File;J)V

    return-void
.end method

.method public constructor <init>(Lgi;)V
    .locals 1

    .line 92
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 93
    iput-boolean v0, p0, Lcom/squareup/picasso/OkHttp3Downloader;->sharedClient:Z

    .line 94
    iput-object p1, p0, Lcom/squareup/picasso/OkHttp3Downloader;->client:Lgi;

    const/4 p1, 0x0

    .line 95
    iput-object p1, p0, Lcom/squareup/picasso/OkHttp3Downloader;->cache:Lbi;

    return-void
.end method

.method public constructor <init>(Ljava/io/File;)V
    .locals 2

    .line 84
    invoke-static {p1}, Lcom/squareup/picasso/Utils;->calculateDiskCacheSize(Ljava/io/File;)J

    move-result-wide v0

    invoke-direct {p0, p1, v0, v1}, Lcom/squareup/picasso/OkHttp3Downloader;-><init>(Ljava/io/File;J)V

    return-void
.end method

.method public constructor <init>(Ljava/io/File;J)V
    .locals 3

    .line 1
    new-instance v0, Lke;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ler0;

    .line 7
    .line 8
    const/4 v2, 0x5

    .line 9
    invoke-direct {v1, v2}, Ler0;-><init>(I)V

    .line 10
    .line 11
    .line 12
    iput-object v1, v0, Lke;->a:Ljava/lang/Object;

    .line 13
    .line 14
    new-instance v1, Lbv1;

    .line 15
    .line 16
    const/16 v2, 0xb

    .line 17
    .line 18
    invoke-direct {v1, v2}, Lbv1;-><init>(I)V

    .line 19
    .line 20
    .line 21
    iput-object v1, v0, Lke;->b:Ljava/lang/Object;

    .line 22
    .line 23
    new-instance v1, Ljava/util/ArrayList;

    .line 24
    .line 25
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 26
    .line 27
    .line 28
    iput-object v1, v0, Lke;->c:Ljava/io/Serializable;

    .line 29
    .line 30
    new-instance v1, Ljava/util/ArrayList;

    .line 31
    .line 32
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 33
    .line 34
    .line 35
    iput-object v1, v0, Lke;->d:Ljava/io/Serializable;

    .line 36
    .line 37
    new-instance v1, Lwd1;

    .line 38
    .line 39
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 40
    .line 41
    .line 42
    iput-object v1, v0, Lke;->e:Ljava/lang/Object;

    .line 43
    .line 44
    invoke-static {}, Ljavax/net/SocketFactory;->getDefault()Ljavax/net/SocketFactory;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 49
    .line 50
    .line 51
    iput-object v1, v0, Lke;->g:Ljava/lang/Object;

    .line 52
    .line 53
    sget-object v1, Lmr0;->w:Ljava/util/List;

    .line 54
    .line 55
    iput-object v1, v0, Lke;->h:Ljava/lang/Object;

    .line 56
    .line 57
    sget-object v1, Lmr0;->v:Ljava/util/List;

    .line 58
    .line 59
    iput-object v1, v0, Lke;->i:Ljava/lang/Object;

    .line 60
    .line 61
    sget-object v1, Lij;->c:Lij;

    .line 62
    .line 63
    iput-object v1, v0, Lke;->j:Ljava/lang/Object;

    .line 64
    .line 65
    new-instance v1, Lbi;

    .line 66
    .line 67
    invoke-direct {v1, p1, p2, p3}, Lbi;-><init>(Ljava/io/File;J)V

    .line 68
    .line 69
    .line 70
    iput-object v1, v0, Lke;->f:Ljava/lang/Object;

    .line 71
    .line 72
    new-instance p1, Lmr0;

    .line 73
    .line 74
    invoke-direct {p1, v0}, Lmr0;-><init>(Lke;)V

    .line 75
    .line 76
    .line 77
    invoke-direct {p0, p1}, Lcom/squareup/picasso/OkHttp3Downloader;-><init>(Lmr0;)V

    .line 78
    .line 79
    .line 80
    const/4 p1, 0x0

    .line 81
    iput-boolean p1, p0, Lcom/squareup/picasso/OkHttp3Downloader;->sharedClient:Z

    .line 82
    .line 83
    return-void
.end method

.method public constructor <init>(Lmr0;)V
    .locals 1

    .line 87
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 88
    iput-boolean v0, p0, Lcom/squareup/picasso/OkHttp3Downloader;->sharedClient:Z

    .line 89
    iput-object p1, p0, Lcom/squareup/picasso/OkHttp3Downloader;->client:Lgi;

    .line 90
    iget-object p1, p1, Lmr0;->n:Lbi;

    .line 91
    iput-object p1, p0, Lcom/squareup/picasso/OkHttp3Downloader;->cache:Lbi;

    return-void
.end method


# virtual methods
.method public load(Lm01;)Lf11;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/squareup/picasso/OkHttp3Downloader;->client:Lgi;

    .line 2
    .line 3
    check-cast p0, Lmr0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    new-instance v0, Lwx0;

    .line 12
    .line 13
    invoke-direct {v0, p0, p1}, Lwx0;-><init>(Lmr0;Lm01;)V

    .line 14
    .line 15
    .line 16
    invoke-static {v0}, Lcom/google/firebase/perf/network/FirebasePerfOkHttpClient;->execute(Lhi;)Lf11;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public shutdown()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/squareup/picasso/OkHttp3Downloader;->sharedClient:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/squareup/picasso/OkHttp3Downloader;->cache:Lbi;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    :try_start_0
    invoke-virtual {p0}, Lbi;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 10
    .line 11
    .line 12
    :catch_0
    :cond_0
    return-void
.end method
