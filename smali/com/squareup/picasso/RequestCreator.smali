.class public Lcom/squareup/picasso/RequestCreator;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field private static final nextId:Ljava/util/concurrent/atomic/AtomicInteger;


# instance fields
.field private final data:Lcom/squareup/picasso/Request$Builder;

.field private deferred:Z

.field private errorDrawable:Landroid/graphics/drawable/Drawable;

.field private errorResId:I

.field private memoryPolicy:I

.field private networkPolicy:I

.field private noFade:Z

.field private final picasso:Lcom/squareup/picasso/Picasso;

.field private placeholderDrawable:Landroid/graphics/drawable/Drawable;

.field private placeholderResId:I

.field private setPlaceholder:Z

.field private tag:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/squareup/picasso/RequestCreator;->nextId:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 31
    iput-boolean v0, p0, Lcom/squareup/picasso/RequestCreator;->setPlaceholder:Z

    const/4 v0, 0x0

    .line 32
    iput-object v0, p0, Lcom/squareup/picasso/RequestCreator;->picasso:Lcom/squareup/picasso/Picasso;

    .line 33
    new-instance v1, Lcom/squareup/picasso/Request$Builder;

    const/4 v2, 0x0

    invoke-direct {v1, v0, v2, v0}, Lcom/squareup/picasso/Request$Builder;-><init>(Landroid/net/Uri;ILandroid/graphics/Bitmap$Config;)V

    iput-object v1, p0, Lcom/squareup/picasso/RequestCreator;->data:Lcom/squareup/picasso/Request$Builder;

    return-void
.end method

.method public constructor <init>(Lcom/squareup/picasso/Picasso;Landroid/net/Uri;I)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/squareup/picasso/RequestCreator;->setPlaceholder:Z

    .line 6
    .line 7
    iget-boolean v0, p1, Lcom/squareup/picasso/Picasso;->shutdown:Z

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iput-object p1, p0, Lcom/squareup/picasso/RequestCreator;->picasso:Lcom/squareup/picasso/Picasso;

    .line 12
    .line 13
    new-instance v0, Lcom/squareup/picasso/Request$Builder;

    .line 14
    .line 15
    iget-object p1, p1, Lcom/squareup/picasso/Picasso;->defaultBitmapConfig:Landroid/graphics/Bitmap$Config;

    .line 16
    .line 17
    invoke-direct {v0, p2, p3, p1}, Lcom/squareup/picasso/Request$Builder;-><init>(Landroid/net/Uri;ILandroid/graphics/Bitmap$Config;)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Lcom/squareup/picasso/RequestCreator;->data:Lcom/squareup/picasso/Request$Builder;

    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    const-string p0, "Picasso instance already shut down. Cannot submit new requests."

    .line 24
    .line 25
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    const/4 p0, 0x0

    .line 29
    throw p0
.end method

.method private createRequest(J)Lcom/squareup/picasso/Request;
    .locals 7

    .line 1
    sget-object v0, Lcom/squareup/picasso/RequestCreator;->nextId:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/squareup/picasso/RequestCreator;->data:Lcom/squareup/picasso/Request$Builder;

    .line 8
    .line 9
    invoke-virtual {v1}, Lcom/squareup/picasso/Request$Builder;->build()Lcom/squareup/picasso/Request;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iput v0, v1, Lcom/squareup/picasso/Request;->id:I

    .line 14
    .line 15
    iput-wide p1, v1, Lcom/squareup/picasso/Request;->started:J

    .line 16
    .line 17
    iget-object v2, p0, Lcom/squareup/picasso/RequestCreator;->picasso:Lcom/squareup/picasso/Picasso;

    .line 18
    .line 19
    iget-boolean v2, v2, Lcom/squareup/picasso/Picasso;->loggingEnabled:Z

    .line 20
    .line 21
    const-string v3, "Main"

    .line 22
    .line 23
    if-eqz v2, :cond_0

    .line 24
    .line 25
    invoke-virtual {v1}, Lcom/squareup/picasso/Request;->plainId()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v4

    .line 29
    invoke-virtual {v1}, Lcom/squareup/picasso/Request;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v5

    .line 33
    const-string v6, "created"

    .line 34
    .line 35
    invoke-static {v3, v6, v4, v5}, Lcom/squareup/picasso/Utils;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    iget-object p0, p0, Lcom/squareup/picasso/RequestCreator;->picasso:Lcom/squareup/picasso/Picasso;

    .line 39
    .line 40
    invoke-virtual {p0, v1}, Lcom/squareup/picasso/Picasso;->transformRequest(Lcom/squareup/picasso/Request;)Lcom/squareup/picasso/Request;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    if-eq p0, v1, :cond_1

    .line 45
    .line 46
    iput v0, p0, Lcom/squareup/picasso/Request;->id:I

    .line 47
    .line 48
    iput-wide p1, p0, Lcom/squareup/picasso/Request;->started:J

    .line 49
    .line 50
    if-eqz v2, :cond_1

    .line 51
    .line 52
    invoke-virtual {p0}, Lcom/squareup/picasso/Request;->logId()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    new-instance p2, Ljava/lang/StringBuilder;

    .line 57
    .line 58
    const-string v0, "into "

    .line 59
    .line 60
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p2

    .line 70
    const-string v0, "changed"

    .line 71
    .line 72
    invoke-static {v3, v0, p1, p2}, Lcom/squareup/picasso/Utils;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    :cond_1
    return-object p0
.end method

.method private getPlaceholderDrawable()Landroid/graphics/drawable/Drawable;
    .locals 1

    .line 1
    iget v0, p0, Lcom/squareup/picasso/RequestCreator;->placeholderResId:I

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/squareup/picasso/RequestCreator;->picasso:Lcom/squareup/picasso/Picasso;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/squareup/picasso/Picasso;->context:Landroid/content/Context;

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_0
    iget-object p0, p0, Lcom/squareup/picasso/RequestCreator;->placeholderDrawable:Landroid/graphics/drawable/Drawable;

    .line 15
    .line 16
    return-object p0
.end method

.method private performRemoteViewInto(Lcom/squareup/picasso/RemoteViewsAction;)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/squareup/picasso/RequestCreator;->memoryPolicy:I

    .line 2
    .line 3
    invoke-static {v0}, Lcom/squareup/picasso/MemoryPolicy;->shouldReadFromMemoryCache(I)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/squareup/picasso/RequestCreator;->picasso:Lcom/squareup/picasso/Picasso;

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/squareup/picasso/Action;->getKey()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Lcom/squareup/picasso/Picasso;->quickMemoryCacheCheck(Ljava/lang/String;)Landroid/graphics/Bitmap;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    sget-object p0, Lcom/squareup/picasso/Picasso$LoadedFrom;->MEMORY:Lcom/squareup/picasso/Picasso$LoadedFrom;

    .line 22
    .line 23
    invoke-virtual {p1, v0, p0}, Lcom/squareup/picasso/RemoteViewsAction;->complete(Landroid/graphics/Bitmap;Lcom/squareup/picasso/Picasso$LoadedFrom;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    iget v0, p0, Lcom/squareup/picasso/RequestCreator;->placeholderResId:I

    .line 28
    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    invoke-virtual {p1, v0}, Lcom/squareup/picasso/RemoteViewsAction;->setImageResource(I)V

    .line 32
    .line 33
    .line 34
    :cond_1
    iget-object p0, p0, Lcom/squareup/picasso/RequestCreator;->picasso:Lcom/squareup/picasso/Picasso;

    .line 35
    .line 36
    invoke-virtual {p0, p1}, Lcom/squareup/picasso/Picasso;->enqueueAndSubmit(Lcom/squareup/picasso/Action;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method


# virtual methods
.method public centerCrop()Lcom/squareup/picasso/RequestCreator;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/squareup/picasso/RequestCreator;->data:Lcom/squareup/picasso/Request$Builder;

    .line 2
    .line 3
    const/16 v1, 0x11

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/squareup/picasso/Request$Builder;->centerCrop(I)Lcom/squareup/picasso/Request$Builder;

    .line 6
    .line 7
    .line 8
    return-object p0
.end method

.method public centerCrop(I)Lcom/squareup/picasso/RequestCreator;
    .locals 1

    .line 9
    iget-object v0, p0, Lcom/squareup/picasso/RequestCreator;->data:Lcom/squareup/picasso/Request$Builder;

    invoke-virtual {v0, p1}, Lcom/squareup/picasso/Request$Builder;->centerCrop(I)Lcom/squareup/picasso/Request$Builder;

    return-object p0
.end method

.method public centerInside()Lcom/squareup/picasso/RequestCreator;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/squareup/picasso/RequestCreator;->data:Lcom/squareup/picasso/Request$Builder;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/squareup/picasso/Request$Builder;->centerInside()Lcom/squareup/picasso/Request$Builder;

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public clearTag()Lcom/squareup/picasso/RequestCreator;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/squareup/picasso/RequestCreator;->tag:Ljava/lang/Object;

    .line 3
    .line 4
    return-object p0
.end method

.method public config(Landroid/graphics/Bitmap$Config;)Lcom/squareup/picasso/RequestCreator;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/squareup/picasso/RequestCreator;->data:Lcom/squareup/picasso/Request$Builder;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/squareup/picasso/Request$Builder;->config(Landroid/graphics/Bitmap$Config;)Lcom/squareup/picasso/Request$Builder;

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public error(I)Lcom/squareup/picasso/RequestCreator;
    .locals 1

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object v0, p0, Lcom/squareup/picasso/RequestCreator;->errorDrawable:Landroid/graphics/drawable/Drawable;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput p1, p0, Lcom/squareup/picasso/RequestCreator;->errorResId:I

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    const-string p0, "Error image already set."

    .line 11
    .line 12
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    :goto_0
    const/4 p0, 0x0

    .line 16
    return-object p0

    .line 17
    :cond_1
    const-string p0, "Error image resource invalid."

    .line 18
    .line 19
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    goto :goto_0
.end method

.method public error(Landroid/graphics/drawable/Drawable;)Lcom/squareup/picasso/RequestCreator;
    .locals 2

    const/4 v0, 0x0

    if-eqz p1, :cond_1

    .line 23
    iget v1, p0, Lcom/squareup/picasso/RequestCreator;->errorResId:I

    if-nez v1, :cond_0

    .line 24
    iput-object p1, p0, Lcom/squareup/picasso/RequestCreator;->errorDrawable:Landroid/graphics/drawable/Drawable;

    return-object p0

    .line 25
    :cond_0
    const-string p0, "Error image already set."

    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    return-object v0

    .line 26
    :cond_1
    const-string p0, "Error image may not be null."

    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    return-object v0
.end method

.method public fetch()V
    .locals 1

    const/4 v0, 0x0

    .line 126
    invoke-virtual {p0, v0}, Lcom/squareup/picasso/RequestCreator;->fetch(Lcom/squareup/picasso/Callback;)V

    return-void
.end method

.method public fetch(Lcom/squareup/picasso/Callback;)V
    .locals 12

    .line 1
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-boolean v2, p0, Lcom/squareup/picasso/RequestCreator;->deferred:Z

    .line 6
    .line 7
    if-nez v2, :cond_4

    .line 8
    .line 9
    iget-object v2, p0, Lcom/squareup/picasso/RequestCreator;->data:Lcom/squareup/picasso/Request$Builder;

    .line 10
    .line 11
    invoke-virtual {v2}, Lcom/squareup/picasso/Request$Builder;->hasImage()Z

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    if-eqz v2, :cond_3

    .line 16
    .line 17
    iget-object v2, p0, Lcom/squareup/picasso/RequestCreator;->data:Lcom/squareup/picasso/Request$Builder;

    .line 18
    .line 19
    invoke-virtual {v2}, Lcom/squareup/picasso/Request$Builder;->hasPriority()Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-nez v2, :cond_0

    .line 24
    .line 25
    iget-object v2, p0, Lcom/squareup/picasso/RequestCreator;->data:Lcom/squareup/picasso/Request$Builder;

    .line 26
    .line 27
    sget-object v3, Lcom/squareup/picasso/Picasso$Priority;->LOW:Lcom/squareup/picasso/Picasso$Priority;

    .line 28
    .line 29
    invoke-virtual {v2, v3}, Lcom/squareup/picasso/Request$Builder;->priority(Lcom/squareup/picasso/Picasso$Priority;)Lcom/squareup/picasso/Request$Builder;

    .line 30
    .line 31
    .line 32
    :cond_0
    invoke-direct {p0, v0, v1}, Lcom/squareup/picasso/RequestCreator;->createRequest(J)Lcom/squareup/picasso/Request;

    .line 33
    .line 34
    .line 35
    move-result-object v6

    .line 36
    new-instance v0, Ljava/lang/StringBuilder;

    .line 37
    .line 38
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 39
    .line 40
    .line 41
    invoke-static {v6, v0}, Lcom/squareup/picasso/Utils;->createKey(Lcom/squareup/picasso/Request;Ljava/lang/StringBuilder;)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v10

    .line 45
    iget v0, p0, Lcom/squareup/picasso/RequestCreator;->memoryPolicy:I

    .line 46
    .line 47
    invoke-static {v0}, Lcom/squareup/picasso/MemoryPolicy;->shouldReadFromMemoryCache(I)Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_2

    .line 52
    .line 53
    iget-object v0, p0, Lcom/squareup/picasso/RequestCreator;->picasso:Lcom/squareup/picasso/Picasso;

    .line 54
    .line 55
    invoke-virtual {v0, v10}, Lcom/squareup/picasso/Picasso;->quickMemoryCacheCheck(Ljava/lang/String;)Landroid/graphics/Bitmap;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    if-eqz v0, :cond_2

    .line 60
    .line 61
    iget-object p0, p0, Lcom/squareup/picasso/RequestCreator;->picasso:Lcom/squareup/picasso/Picasso;

    .line 62
    .line 63
    iget-boolean p0, p0, Lcom/squareup/picasso/Picasso;->loggingEnabled:Z

    .line 64
    .line 65
    if-eqz p0, :cond_1

    .line 66
    .line 67
    invoke-virtual {v6}, Lcom/squareup/picasso/Request;->plainId()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    new-instance v0, Ljava/lang/StringBuilder;

    .line 72
    .line 73
    const-string v1, "from "

    .line 74
    .line 75
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    sget-object v1, Lcom/squareup/picasso/Picasso$LoadedFrom;->MEMORY:Lcom/squareup/picasso/Picasso$LoadedFrom;

    .line 79
    .line 80
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    const-string v1, "Main"

    .line 88
    .line 89
    const-string v2, "completed"

    .line 90
    .line 91
    invoke-static {v1, v2, p0, v0}, Lcom/squareup/picasso/Utils;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    :cond_1
    if-eqz p1, :cond_3

    .line 95
    .line 96
    invoke-interface {p1}, Lcom/squareup/picasso/Callback;->onSuccess()V

    .line 97
    .line 98
    .line 99
    return-void

    .line 100
    :cond_2
    new-instance v4, Lcom/squareup/picasso/FetchAction;

    .line 101
    .line 102
    iget-object v5, p0, Lcom/squareup/picasso/RequestCreator;->picasso:Lcom/squareup/picasso/Picasso;

    .line 103
    .line 104
    iget v7, p0, Lcom/squareup/picasso/RequestCreator;->memoryPolicy:I

    .line 105
    .line 106
    iget v8, p0, Lcom/squareup/picasso/RequestCreator;->networkPolicy:I

    .line 107
    .line 108
    iget-object v9, p0, Lcom/squareup/picasso/RequestCreator;->tag:Ljava/lang/Object;

    .line 109
    .line 110
    move-object v11, p1

    .line 111
    invoke-direct/range {v4 .. v11}, Lcom/squareup/picasso/FetchAction;-><init>(Lcom/squareup/picasso/Picasso;Lcom/squareup/picasso/Request;IILjava/lang/Object;Ljava/lang/String;Lcom/squareup/picasso/Callback;)V

    .line 112
    .line 113
    .line 114
    iget-object p0, p0, Lcom/squareup/picasso/RequestCreator;->picasso:Lcom/squareup/picasso/Picasso;

    .line 115
    .line 116
    invoke-virtual {p0, v4}, Lcom/squareup/picasso/Picasso;->submit(Lcom/squareup/picasso/Action;)V

    .line 117
    .line 118
    .line 119
    :cond_3
    return-void

    .line 120
    :cond_4
    const-string p0, "Fit cannot be used with fetch."

    .line 121
    .line 122
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    return-void
.end method

.method public fit()Lcom/squareup/picasso/RequestCreator;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/squareup/picasso/RequestCreator;->deferred:Z

    .line 3
    .line 4
    return-object p0
.end method

.method public get()Landroid/graphics/Bitmap;
    .locals 7

    .line 1
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-static {}, Lcom/squareup/picasso/Utils;->checkNotMain()V

    .line 6
    .line 7
    .line 8
    iget-boolean v2, p0, Lcom/squareup/picasso/RequestCreator;->deferred:Z

    .line 9
    .line 10
    if-nez v2, :cond_1

    .line 11
    .line 12
    iget-object v2, p0, Lcom/squareup/picasso/RequestCreator;->data:Lcom/squareup/picasso/Request$Builder;

    .line 13
    .line 14
    invoke-virtual {v2}, Lcom/squareup/picasso/Request$Builder;->hasImage()Z

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    if-nez v2, :cond_0

    .line 19
    .line 20
    const/4 p0, 0x0

    .line 21
    return-object p0

    .line 22
    :cond_0
    invoke-direct {p0, v0, v1}, Lcom/squareup/picasso/RequestCreator;->createRequest(J)Lcom/squareup/picasso/Request;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    new-instance v0, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-static {v2, v0}, Lcom/squareup/picasso/Utils;->createKey(Lcom/squareup/picasso/Request;Ljava/lang/StringBuilder;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v6

    .line 35
    new-instance v0, Lcom/squareup/picasso/GetAction;

    .line 36
    .line 37
    iget-object v1, p0, Lcom/squareup/picasso/RequestCreator;->picasso:Lcom/squareup/picasso/Picasso;

    .line 38
    .line 39
    iget v3, p0, Lcom/squareup/picasso/RequestCreator;->memoryPolicy:I

    .line 40
    .line 41
    iget v4, p0, Lcom/squareup/picasso/RequestCreator;->networkPolicy:I

    .line 42
    .line 43
    iget-object v5, p0, Lcom/squareup/picasso/RequestCreator;->tag:Ljava/lang/Object;

    .line 44
    .line 45
    invoke-direct/range {v0 .. v6}, Lcom/squareup/picasso/GetAction;-><init>(Lcom/squareup/picasso/Picasso;Lcom/squareup/picasso/Request;IILjava/lang/Object;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Lcom/squareup/picasso/RequestCreator;->picasso:Lcom/squareup/picasso/Picasso;

    .line 49
    .line 50
    iget-object v1, p0, Lcom/squareup/picasso/Picasso;->dispatcher:Lcom/squareup/picasso/Dispatcher;

    .line 51
    .line 52
    iget-object v2, p0, Lcom/squareup/picasso/Picasso;->cache:Lcom/squareup/picasso/Cache;

    .line 53
    .line 54
    iget-object v3, p0, Lcom/squareup/picasso/Picasso;->stats:Lcom/squareup/picasso/Stats;

    .line 55
    .line 56
    invoke-static {p0, v1, v2, v3, v0}, Lcom/squareup/picasso/BitmapHunter;->forRequest(Lcom/squareup/picasso/Picasso;Lcom/squareup/picasso/Dispatcher;Lcom/squareup/picasso/Cache;Lcom/squareup/picasso/Stats;Lcom/squareup/picasso/Action;)Lcom/squareup/picasso/BitmapHunter;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {p0}, Lcom/squareup/picasso/BitmapHunter;->hunt()Landroid/graphics/Bitmap;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    return-object p0

    .line 65
    :cond_1
    const-string p0, "Fit cannot be used with get."

    .line 66
    .line 67
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    const/4 p0, 0x0

    .line 71
    return-object p0
.end method

.method public getTag()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/squareup/picasso/RequestCreator;->tag:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public into(Landroid/widget/ImageView;)V
    .locals 1

    const/4 v0, 0x0

    .line 249
    invoke-virtual {p0, p1, v0}, Lcom/squareup/picasso/RequestCreator;->into(Landroid/widget/ImageView;Lcom/squareup/picasso/Callback;)V

    return-void
.end method

.method public into(Landroid/widget/ImageView;Lcom/squareup/picasso/Callback;)V
    .locals 13

    .line 1
    move-object v11, p2

    .line 2
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 3
    .line 4
    .line 5
    move-result-wide v2

    .line 6
    invoke-static {}, Lcom/squareup/picasso/Utils;->checkMain()V

    .line 7
    .line 8
    .line 9
    if-eqz p1, :cond_a

    .line 10
    .line 11
    iget-object v4, p0, Lcom/squareup/picasso/RequestCreator;->data:Lcom/squareup/picasso/Request$Builder;

    .line 12
    .line 13
    invoke-virtual {v4}, Lcom/squareup/picasso/Request$Builder;->hasImage()Z

    .line 14
    .line 15
    .line 16
    move-result v4

    .line 17
    if-nez v4, :cond_0

    .line 18
    .line 19
    iget-object v2, p0, Lcom/squareup/picasso/RequestCreator;->picasso:Lcom/squareup/picasso/Picasso;

    .line 20
    .line 21
    invoke-virtual {v2, p1}, Lcom/squareup/picasso/Picasso;->cancelRequest(Landroid/widget/ImageView;)V

    .line 22
    .line 23
    .line 24
    iget-boolean v2, p0, Lcom/squareup/picasso/RequestCreator;->setPlaceholder:Z

    .line 25
    .line 26
    if-eqz v2, :cond_7

    .line 27
    .line 28
    invoke-direct {p0}, Lcom/squareup/picasso/RequestCreator;->getPlaceholderDrawable()Landroid/graphics/drawable/Drawable;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-static {p1, v0}, Lcom/squareup/picasso/PicassoDrawable;->setPlaceholder(Landroid/widget/ImageView;Landroid/graphics/drawable/Drawable;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_0
    iget-boolean v4, p0, Lcom/squareup/picasso/RequestCreator;->deferred:Z

    .line 37
    .line 38
    if-eqz v4, :cond_5

    .line 39
    .line 40
    iget-object v4, p0, Lcom/squareup/picasso/RequestCreator;->data:Lcom/squareup/picasso/Request$Builder;

    .line 41
    .line 42
    invoke-virtual {v4}, Lcom/squareup/picasso/Request$Builder;->hasSize()Z

    .line 43
    .line 44
    .line 45
    move-result v4

    .line 46
    if-nez v4, :cond_4

    .line 47
    .line 48
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 49
    .line 50
    .line 51
    move-result v4

    .line 52
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 53
    .line 54
    .line 55
    move-result v5

    .line 56
    if-eqz v4, :cond_2

    .line 57
    .line 58
    if-nez v5, :cond_1

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_1
    iget-object v6, p0, Lcom/squareup/picasso/RequestCreator;->data:Lcom/squareup/picasso/Request$Builder;

    .line 62
    .line 63
    invoke-virtual {v6, v4, v5}, Lcom/squareup/picasso/Request$Builder;->resize(II)Lcom/squareup/picasso/Request$Builder;

    .line 64
    .line 65
    .line 66
    goto :goto_1

    .line 67
    :cond_2
    :goto_0
    iget-boolean v2, p0, Lcom/squareup/picasso/RequestCreator;->setPlaceholder:Z

    .line 68
    .line 69
    if-eqz v2, :cond_3

    .line 70
    .line 71
    invoke-direct {p0}, Lcom/squareup/picasso/RequestCreator;->getPlaceholderDrawable()Landroid/graphics/drawable/Drawable;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    invoke-static {p1, v2}, Lcom/squareup/picasso/PicassoDrawable;->setPlaceholder(Landroid/widget/ImageView;Landroid/graphics/drawable/Drawable;)V

    .line 76
    .line 77
    .line 78
    :cond_3
    iget-object v2, p0, Lcom/squareup/picasso/RequestCreator;->picasso:Lcom/squareup/picasso/Picasso;

    .line 79
    .line 80
    new-instance v3, Lcom/squareup/picasso/DeferredRequestCreator;

    .line 81
    .line 82
    invoke-direct {v3, p0, p1, p2}, Lcom/squareup/picasso/DeferredRequestCreator;-><init>(Lcom/squareup/picasso/RequestCreator;Landroid/widget/ImageView;Lcom/squareup/picasso/Callback;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {v2, p1, v3}, Lcom/squareup/picasso/Picasso;->defer(Landroid/widget/ImageView;Lcom/squareup/picasso/DeferredRequestCreator;)V

    .line 86
    .line 87
    .line 88
    return-void

    .line 89
    :cond_4
    const-string v0, "Fit cannot be used with resize."

    .line 90
    .line 91
    invoke-static {v0}, Lz0;->g(Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    return-void

    .line 95
    :cond_5
    :goto_1
    invoke-direct {p0, v2, v3}, Lcom/squareup/picasso/RequestCreator;->createRequest(J)Lcom/squareup/picasso/Request;

    .line 96
    .line 97
    .line 98
    move-result-object v7

    .line 99
    invoke-static {v7}, Lcom/squareup/picasso/Utils;->createKey(Lcom/squareup/picasso/Request;)Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v9

    .line 103
    iget v2, p0, Lcom/squareup/picasso/RequestCreator;->memoryPolicy:I

    .line 104
    .line 105
    invoke-static {v2}, Lcom/squareup/picasso/MemoryPolicy;->shouldReadFromMemoryCache(I)Z

    .line 106
    .line 107
    .line 108
    move-result v2

    .line 109
    if-eqz v2, :cond_8

    .line 110
    .line 111
    iget-object v2, p0, Lcom/squareup/picasso/RequestCreator;->picasso:Lcom/squareup/picasso/Picasso;

    .line 112
    .line 113
    invoke-virtual {v2, v9}, Lcom/squareup/picasso/Picasso;->quickMemoryCacheCheck(Ljava/lang/String;)Landroid/graphics/Bitmap;

    .line 114
    .line 115
    .line 116
    move-result-object v3

    .line 117
    if-eqz v3, :cond_8

    .line 118
    .line 119
    iget-object v2, p0, Lcom/squareup/picasso/RequestCreator;->picasso:Lcom/squareup/picasso/Picasso;

    .line 120
    .line 121
    invoke-virtual {v2, p1}, Lcom/squareup/picasso/Picasso;->cancelRequest(Landroid/widget/ImageView;)V

    .line 122
    .line 123
    .line 124
    iget-object v2, p0, Lcom/squareup/picasso/RequestCreator;->picasso:Lcom/squareup/picasso/Picasso;

    .line 125
    .line 126
    iget-object v4, v2, Lcom/squareup/picasso/Picasso;->context:Landroid/content/Context;

    .line 127
    .line 128
    move-object v5, v4

    .line 129
    sget-object v4, Lcom/squareup/picasso/Picasso$LoadedFrom;->MEMORY:Lcom/squareup/picasso/Picasso$LoadedFrom;

    .line 130
    .line 131
    move-object v6, v5

    .line 132
    iget-boolean v5, p0, Lcom/squareup/picasso/RequestCreator;->noFade:Z

    .line 133
    .line 134
    iget-boolean v2, v2, Lcom/squareup/picasso/Picasso;->indicatorsEnabled:Z

    .line 135
    .line 136
    move-object v1, v6

    .line 137
    move v6, v2

    .line 138
    move-object v2, v1

    .line 139
    move-object v1, p1

    .line 140
    invoke-static/range {v1 .. v6}, Lcom/squareup/picasso/PicassoDrawable;->setBitmap(Landroid/widget/ImageView;Landroid/content/Context;Landroid/graphics/Bitmap;Lcom/squareup/picasso/Picasso$LoadedFrom;ZZ)V

    .line 141
    .line 142
    .line 143
    iget-object v0, p0, Lcom/squareup/picasso/RequestCreator;->picasso:Lcom/squareup/picasso/Picasso;

    .line 144
    .line 145
    iget-boolean v0, v0, Lcom/squareup/picasso/Picasso;->loggingEnabled:Z

    .line 146
    .line 147
    if-eqz v0, :cond_6

    .line 148
    .line 149
    invoke-virtual {v7}, Lcom/squareup/picasso/Request;->plainId()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    new-instance v1, Ljava/lang/StringBuilder;

    .line 154
    .line 155
    const-string v2, "from "

    .line 156
    .line 157
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 158
    .line 159
    .line 160
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 161
    .line 162
    .line 163
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object v1

    .line 167
    const-string v2, "Main"

    .line 168
    .line 169
    const-string v3, "completed"

    .line 170
    .line 171
    invoke-static {v2, v3, v0, v1}, Lcom/squareup/picasso/Utils;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 172
    .line 173
    .line 174
    :cond_6
    if-eqz v11, :cond_7

    .line 175
    .line 176
    invoke-interface {p2}, Lcom/squareup/picasso/Callback;->onSuccess()V

    .line 177
    .line 178
    .line 179
    :cond_7
    return-void

    .line 180
    :cond_8
    iget-boolean v2, p0, Lcom/squareup/picasso/RequestCreator;->setPlaceholder:Z

    .line 181
    .line 182
    if-eqz v2, :cond_9

    .line 183
    .line 184
    invoke-direct {p0}, Lcom/squareup/picasso/RequestCreator;->getPlaceholderDrawable()Landroid/graphics/drawable/Drawable;

    .line 185
    .line 186
    .line 187
    move-result-object v2

    .line 188
    invoke-static {p1, v2}, Lcom/squareup/picasso/PicassoDrawable;->setPlaceholder(Landroid/widget/ImageView;Landroid/graphics/drawable/Drawable;)V

    .line 189
    .line 190
    .line 191
    :cond_9
    new-instance v1, Lcom/squareup/picasso/ImageViewAction;

    .line 192
    .line 193
    iget-object v2, p0, Lcom/squareup/picasso/RequestCreator;->picasso:Lcom/squareup/picasso/Picasso;

    .line 194
    .line 195
    iget v5, p0, Lcom/squareup/picasso/RequestCreator;->memoryPolicy:I

    .line 196
    .line 197
    iget v6, p0, Lcom/squareup/picasso/RequestCreator;->networkPolicy:I

    .line 198
    .line 199
    move-object v4, v7

    .line 200
    iget v7, p0, Lcom/squareup/picasso/RequestCreator;->errorResId:I

    .line 201
    .line 202
    iget-object v8, p0, Lcom/squareup/picasso/RequestCreator;->errorDrawable:Landroid/graphics/drawable/Drawable;

    .line 203
    .line 204
    iget-object v10, p0, Lcom/squareup/picasso/RequestCreator;->tag:Ljava/lang/Object;

    .line 205
    .line 206
    iget-boolean v12, p0, Lcom/squareup/picasso/RequestCreator;->noFade:Z

    .line 207
    .line 208
    move-object v3, p1

    .line 209
    invoke-direct/range {v1 .. v12}, Lcom/squareup/picasso/ImageViewAction;-><init>(Lcom/squareup/picasso/Picasso;Landroid/widget/ImageView;Lcom/squareup/picasso/Request;IIILandroid/graphics/drawable/Drawable;Ljava/lang/String;Ljava/lang/Object;Lcom/squareup/picasso/Callback;Z)V

    .line 210
    .line 211
    .line 212
    iget-object v0, p0, Lcom/squareup/picasso/RequestCreator;->picasso:Lcom/squareup/picasso/Picasso;

    .line 213
    .line 214
    invoke-virtual {v0, v1}, Lcom/squareup/picasso/Picasso;->enqueueAndSubmit(Lcom/squareup/picasso/Action;)V

    .line 215
    .line 216
    .line 217
    return-void

    .line 218
    :cond_a
    const-string v0, "Target must not be null."

    .line 219
    .line 220
    invoke-static {v0}, Lz0;->d(Ljava/lang/String;)V

    .line 221
    .line 222
    .line 223
    return-void
.end method

.method public into(Landroid/widget/RemoteViews;IILandroid/app/Notification;)V
    .locals 6

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move-object v4, p4

    .line 224
    invoke-virtual/range {v0 .. v5}, Lcom/squareup/picasso/RequestCreator;->into(Landroid/widget/RemoteViews;IILandroid/app/Notification;Ljava/lang/String;)V

    return-void
.end method

.method public into(Landroid/widget/RemoteViews;IILandroid/app/Notification;Ljava/lang/String;)V
    .locals 7

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move-object v4, p4

    move-object v5, p5

    .line 225
    invoke-virtual/range {v0 .. v6}, Lcom/squareup/picasso/RequestCreator;->into(Landroid/widget/RemoteViews;IILandroid/app/Notification;Ljava/lang/String;Lcom/squareup/picasso/Callback;)V

    return-void
.end method

.method public into(Landroid/widget/RemoteViews;IILandroid/app/Notification;Ljava/lang/String;Lcom/squareup/picasso/Callback;)V
    .locals 18

    move-object/from16 v0, p0

    .line 226
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v1

    if-eqz p1, :cond_3

    if-eqz p4, :cond_2

    .line 227
    iget-boolean v3, v0, Lcom/squareup/picasso/RequestCreator;->deferred:Z

    if-nez v3, :cond_1

    .line 228
    iget-object v3, v0, Lcom/squareup/picasso/RequestCreator;->placeholderDrawable:Landroid/graphics/drawable/Drawable;

    if-nez v3, :cond_0

    iget v3, v0, Lcom/squareup/picasso/RequestCreator;->placeholderResId:I

    if-nez v3, :cond_0

    iget-object v3, v0, Lcom/squareup/picasso/RequestCreator;->errorDrawable:Landroid/graphics/drawable/Drawable;

    if-nez v3, :cond_0

    .line 229
    invoke-direct {v0, v1, v2}, Lcom/squareup/picasso/RequestCreator;->createRequest(J)Lcom/squareup/picasso/Request;

    move-result-object v6

    .line 230
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v6, v1}, Lcom/squareup/picasso/Utils;->createKey(Lcom/squareup/picasso/Request;Ljava/lang/StringBuilder;)Ljava/lang/String;

    move-result-object v14

    .line 231
    new-instance v4, Lcom/squareup/picasso/RemoteViewsAction$NotificationAction;

    iget-object v5, v0, Lcom/squareup/picasso/RequestCreator;->picasso:Lcom/squareup/picasso/Picasso;

    iget v12, v0, Lcom/squareup/picasso/RequestCreator;->memoryPolicy:I

    iget v13, v0, Lcom/squareup/picasso/RequestCreator;->networkPolicy:I

    iget-object v15, v0, Lcom/squareup/picasso/RequestCreator;->tag:Ljava/lang/Object;

    iget v1, v0, Lcom/squareup/picasso/RequestCreator;->errorResId:I

    move-object/from16 v7, p1

    move/from16 v8, p2

    move/from16 v9, p3

    move-object/from16 v10, p4

    move-object/from16 v11, p5

    move-object/from16 v17, p6

    move/from16 v16, v1

    invoke-direct/range {v4 .. v17}, Lcom/squareup/picasso/RemoteViewsAction$NotificationAction;-><init>(Lcom/squareup/picasso/Picasso;Lcom/squareup/picasso/Request;Landroid/widget/RemoteViews;IILandroid/app/Notification;Ljava/lang/String;IILjava/lang/String;Ljava/lang/Object;ILcom/squareup/picasso/Callback;)V

    .line 232
    invoke-direct {v0, v4}, Lcom/squareup/picasso/RequestCreator;->performRemoteViewInto(Lcom/squareup/picasso/RemoteViewsAction;)V

    return-void

    .line 233
    :cond_0
    const-string v0, "Cannot use placeholder or error drawables with remote views."

    invoke-static {v0}, Lz0;->d(Ljava/lang/String;)V

    return-void

    .line 234
    :cond_1
    const-string v0, "Fit cannot be used with RemoteViews."

    invoke-static {v0}, Lz0;->g(Ljava/lang/String;)V

    return-void

    .line 235
    :cond_2
    const-string v0, "Notification must not be null."

    invoke-static {v0}, Lz0;->d(Ljava/lang/String;)V

    return-void

    .line 236
    :cond_3
    const-string v0, "RemoteViews must not be null."

    invoke-static {v0}, Lz0;->d(Ljava/lang/String;)V

    return-void
.end method

.method public into(Landroid/widget/RemoteViews;I[I)V
    .locals 1

    const/4 v0, 0x0

    .line 237
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/squareup/picasso/RequestCreator;->into(Landroid/widget/RemoteViews;I[ILcom/squareup/picasso/Callback;)V

    return-void
.end method

.method public into(Landroid/widget/RemoteViews;I[ILcom/squareup/picasso/Callback;)V
    .locals 16

    move-object/from16 v0, p0

    .line 238
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v1

    if-eqz p1, :cond_3

    if-eqz p3, :cond_2

    .line 239
    iget-boolean v3, v0, Lcom/squareup/picasso/RequestCreator;->deferred:Z

    if-nez v3, :cond_1

    .line 240
    iget-object v3, v0, Lcom/squareup/picasso/RequestCreator;->placeholderDrawable:Landroid/graphics/drawable/Drawable;

    if-nez v3, :cond_0

    iget v3, v0, Lcom/squareup/picasso/RequestCreator;->placeholderResId:I

    if-nez v3, :cond_0

    iget-object v3, v0, Lcom/squareup/picasso/RequestCreator;->errorDrawable:Landroid/graphics/drawable/Drawable;

    if-nez v3, :cond_0

    .line 241
    invoke-direct {v0, v1, v2}, Lcom/squareup/picasso/RequestCreator;->createRequest(J)Lcom/squareup/picasso/Request;

    move-result-object v6

    .line 242
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v6, v1}, Lcom/squareup/picasso/Utils;->createKey(Lcom/squareup/picasso/Request;Ljava/lang/StringBuilder;)Ljava/lang/String;

    move-result-object v12

    .line 243
    new-instance v4, Lcom/squareup/picasso/RemoteViewsAction$AppWidgetAction;

    iget-object v5, v0, Lcom/squareup/picasso/RequestCreator;->picasso:Lcom/squareup/picasso/Picasso;

    iget v10, v0, Lcom/squareup/picasso/RequestCreator;->memoryPolicy:I

    iget v11, v0, Lcom/squareup/picasso/RequestCreator;->networkPolicy:I

    iget-object v13, v0, Lcom/squareup/picasso/RequestCreator;->tag:Ljava/lang/Object;

    iget v14, v0, Lcom/squareup/picasso/RequestCreator;->errorResId:I

    move-object/from16 v7, p1

    move/from16 v8, p2

    move-object/from16 v9, p3

    move-object/from16 v15, p4

    invoke-direct/range {v4 .. v15}, Lcom/squareup/picasso/RemoteViewsAction$AppWidgetAction;-><init>(Lcom/squareup/picasso/Picasso;Lcom/squareup/picasso/Request;Landroid/widget/RemoteViews;I[IIILjava/lang/String;Ljava/lang/Object;ILcom/squareup/picasso/Callback;)V

    .line 244
    invoke-direct {v0, v4}, Lcom/squareup/picasso/RequestCreator;->performRemoteViewInto(Lcom/squareup/picasso/RemoteViewsAction;)V

    return-void

    .line 245
    :cond_0
    const-string v0, "Cannot use placeholder or error drawables with remote views."

    invoke-static {v0}, Lz0;->d(Ljava/lang/String;)V

    return-void

    .line 246
    :cond_1
    const-string v0, "Fit cannot be used with remote views."

    invoke-static {v0}, Lz0;->g(Ljava/lang/String;)V

    return-void

    .line 247
    :cond_2
    const-string v0, "appWidgetIds must not be null."

    invoke-static {v0}, Lz0;->d(Ljava/lang/String;)V

    return-void

    .line 248
    :cond_3
    const-string v0, "remoteViews must not be null."

    invoke-static {v0}, Lz0;->d(Ljava/lang/String;)V

    return-void
.end method

.method public into(Lcom/squareup/picasso/Target;)V
    .locals 14

    .line 250
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    .line 251
    invoke-static {}, Lcom/squareup/picasso/Utils;->checkMain()V

    if-eqz p1, :cond_5

    .line 252
    iget-boolean v2, p0, Lcom/squareup/picasso/RequestCreator;->deferred:Z

    if-nez v2, :cond_4

    .line 253
    iget-object v2, p0, Lcom/squareup/picasso/RequestCreator;->data:Lcom/squareup/picasso/Request$Builder;

    invoke-virtual {v2}, Lcom/squareup/picasso/Request$Builder;->hasImage()Z

    move-result v2

    const/4 v3, 0x0

    if-nez v2, :cond_1

    .line 254
    iget-object v0, p0, Lcom/squareup/picasso/RequestCreator;->picasso:Lcom/squareup/picasso/Picasso;

    invoke-virtual {v0, p1}, Lcom/squareup/picasso/Picasso;->cancelRequest(Lcom/squareup/picasso/Target;)V

    .line 255
    iget-boolean v0, p0, Lcom/squareup/picasso/RequestCreator;->setPlaceholder:Z

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/squareup/picasso/RequestCreator;->getPlaceholderDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    :cond_0
    invoke-interface {p1, v3}, Lcom/squareup/picasso/Target;->onPrepareLoad(Landroid/graphics/drawable/Drawable;)V

    return-void

    .line 256
    :cond_1
    invoke-direct {p0, v0, v1}, Lcom/squareup/picasso/RequestCreator;->createRequest(J)Lcom/squareup/picasso/Request;

    move-result-object v7

    .line 257
    invoke-static {v7}, Lcom/squareup/picasso/Utils;->createKey(Lcom/squareup/picasso/Request;)Ljava/lang/String;

    move-result-object v11

    .line 258
    iget v0, p0, Lcom/squareup/picasso/RequestCreator;->memoryPolicy:I

    invoke-static {v0}, Lcom/squareup/picasso/MemoryPolicy;->shouldReadFromMemoryCache(I)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 259
    iget-object v0, p0, Lcom/squareup/picasso/RequestCreator;->picasso:Lcom/squareup/picasso/Picasso;

    invoke-virtual {v0, v11}, Lcom/squareup/picasso/Picasso;->quickMemoryCacheCheck(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 260
    iget-object p0, p0, Lcom/squareup/picasso/RequestCreator;->picasso:Lcom/squareup/picasso/Picasso;

    invoke-virtual {p0, p1}, Lcom/squareup/picasso/Picasso;->cancelRequest(Lcom/squareup/picasso/Target;)V

    .line 261
    sget-object p0, Lcom/squareup/picasso/Picasso$LoadedFrom;->MEMORY:Lcom/squareup/picasso/Picasso$LoadedFrom;

    invoke-interface {p1, v0, p0}, Lcom/squareup/picasso/Target;->onBitmapLoaded(Landroid/graphics/Bitmap;Lcom/squareup/picasso/Picasso$LoadedFrom;)V

    return-void

    .line 262
    :cond_2
    iget-boolean v0, p0, Lcom/squareup/picasso/RequestCreator;->setPlaceholder:Z

    if-eqz v0, :cond_3

    invoke-direct {p0}, Lcom/squareup/picasso/RequestCreator;->getPlaceholderDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    :cond_3
    invoke-interface {p1, v3}, Lcom/squareup/picasso/Target;->onPrepareLoad(Landroid/graphics/drawable/Drawable;)V

    .line 263
    new-instance v4, Lcom/squareup/picasso/TargetAction;

    iget-object v5, p0, Lcom/squareup/picasso/RequestCreator;->picasso:Lcom/squareup/picasso/Picasso;

    iget v8, p0, Lcom/squareup/picasso/RequestCreator;->memoryPolicy:I

    iget v9, p0, Lcom/squareup/picasso/RequestCreator;->networkPolicy:I

    iget-object v10, p0, Lcom/squareup/picasso/RequestCreator;->errorDrawable:Landroid/graphics/drawable/Drawable;

    iget-object v12, p0, Lcom/squareup/picasso/RequestCreator;->tag:Ljava/lang/Object;

    iget v13, p0, Lcom/squareup/picasso/RequestCreator;->errorResId:I

    move-object v6, p1

    invoke-direct/range {v4 .. v13}, Lcom/squareup/picasso/TargetAction;-><init>(Lcom/squareup/picasso/Picasso;Lcom/squareup/picasso/Target;Lcom/squareup/picasso/Request;IILandroid/graphics/drawable/Drawable;Ljava/lang/String;Ljava/lang/Object;I)V

    .line 264
    iget-object p0, p0, Lcom/squareup/picasso/RequestCreator;->picasso:Lcom/squareup/picasso/Picasso;

    invoke-virtual {p0, v4}, Lcom/squareup/picasso/Picasso;->enqueueAndSubmit(Lcom/squareup/picasso/Action;)V

    return-void

    .line 265
    :cond_4
    const-string p0, "Fit cannot be used with a Target."

    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    return-void

    .line 266
    :cond_5
    const-string p0, "Target must not be null."

    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    return-void
.end method

.method public varargs memoryPolicy(Lcom/squareup/picasso/MemoryPolicy;[Lcom/squareup/picasso/MemoryPolicy;)Lcom/squareup/picasso/RequestCreator;
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    const-string v1, "Memory policy cannot be null."

    .line 3
    .line 4
    if-eqz p1, :cond_3

    .line 5
    .line 6
    iget v2, p0, Lcom/squareup/picasso/RequestCreator;->memoryPolicy:I

    .line 7
    .line 8
    iget p1, p1, Lcom/squareup/picasso/MemoryPolicy;->index:I

    .line 9
    .line 10
    or-int/2addr p1, v2

    .line 11
    iput p1, p0, Lcom/squareup/picasso/RequestCreator;->memoryPolicy:I

    .line 12
    .line 13
    if-eqz p2, :cond_2

    .line 14
    .line 15
    array-length p1, p2

    .line 16
    if-lez p1, :cond_1

    .line 17
    .line 18
    array-length p1, p2

    .line 19
    const/4 v2, 0x0

    .line 20
    :goto_0
    if-ge v2, p1, :cond_1

    .line 21
    .line 22
    aget-object v3, p2, v2

    .line 23
    .line 24
    if-eqz v3, :cond_0

    .line 25
    .line 26
    iget v4, p0, Lcom/squareup/picasso/RequestCreator;->memoryPolicy:I

    .line 27
    .line 28
    iget v3, v3, Lcom/squareup/picasso/MemoryPolicy;->index:I

    .line 29
    .line 30
    or-int/2addr v3, v4

    .line 31
    iput v3, p0, Lcom/squareup/picasso/RequestCreator;->memoryPolicy:I

    .line 32
    .line 33
    add-int/lit8 v2, v2, 0x1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    invoke-static {v1}, Lz0;->d(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    return-object v0

    .line 40
    :cond_1
    return-object p0

    .line 41
    :cond_2
    invoke-static {v1}, Lz0;->d(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    return-object v0

    .line 45
    :cond_3
    invoke-static {v1}, Lz0;->d(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    return-object v0
.end method

.method public varargs networkPolicy(Lcom/squareup/picasso/NetworkPolicy;[Lcom/squareup/picasso/NetworkPolicy;)Lcom/squareup/picasso/RequestCreator;
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    const-string v1, "Network policy cannot be null."

    .line 3
    .line 4
    if-eqz p1, :cond_3

    .line 5
    .line 6
    iget v2, p0, Lcom/squareup/picasso/RequestCreator;->networkPolicy:I

    .line 7
    .line 8
    iget p1, p1, Lcom/squareup/picasso/NetworkPolicy;->index:I

    .line 9
    .line 10
    or-int/2addr p1, v2

    .line 11
    iput p1, p0, Lcom/squareup/picasso/RequestCreator;->networkPolicy:I

    .line 12
    .line 13
    if-eqz p2, :cond_2

    .line 14
    .line 15
    array-length p1, p2

    .line 16
    if-lez p1, :cond_1

    .line 17
    .line 18
    array-length p1, p2

    .line 19
    const/4 v2, 0x0

    .line 20
    :goto_0
    if-ge v2, p1, :cond_1

    .line 21
    .line 22
    aget-object v3, p2, v2

    .line 23
    .line 24
    if-eqz v3, :cond_0

    .line 25
    .line 26
    iget v4, p0, Lcom/squareup/picasso/RequestCreator;->networkPolicy:I

    .line 27
    .line 28
    iget v3, v3, Lcom/squareup/picasso/NetworkPolicy;->index:I

    .line 29
    .line 30
    or-int/2addr v3, v4

    .line 31
    iput v3, p0, Lcom/squareup/picasso/RequestCreator;->networkPolicy:I

    .line 32
    .line 33
    add-int/lit8 v2, v2, 0x1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    invoke-static {v1}, Lz0;->d(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    return-object v0

    .line 40
    :cond_1
    return-object p0

    .line 41
    :cond_2
    invoke-static {v1}, Lz0;->d(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    return-object v0

    .line 45
    :cond_3
    invoke-static {v1}, Lz0;->d(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    return-object v0
.end method

.method public noFade()Lcom/squareup/picasso/RequestCreator;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/squareup/picasso/RequestCreator;->noFade:Z

    .line 3
    .line 4
    return-object p0
.end method

.method public noPlaceholder()Lcom/squareup/picasso/RequestCreator;
    .locals 1

    .line 1
    iget v0, p0, Lcom/squareup/picasso/RequestCreator;->placeholderResId:I

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/squareup/picasso/RequestCreator;->placeholderDrawable:Landroid/graphics/drawable/Drawable;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-boolean v0, p0, Lcom/squareup/picasso/RequestCreator;->setPlaceholder:Z

    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_0
    const-string p0, "Placeholder image already set."

    .line 14
    .line 15
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    const/4 p0, 0x0

    .line 19
    return-object p0

    .line 20
    :cond_1
    const-string p0, "Placeholder resource already set."

    .line 21
    .line 22
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    const/4 p0, 0x0

    .line 26
    return-object p0
.end method

.method public onlyScaleDown()Lcom/squareup/picasso/RequestCreator;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/squareup/picasso/RequestCreator;->data:Lcom/squareup/picasso/Request$Builder;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/squareup/picasso/Request$Builder;->onlyScaleDown()Lcom/squareup/picasso/Request$Builder;

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public placeholder(I)Lcom/squareup/picasso/RequestCreator;
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/squareup/picasso/RequestCreator;->setPlaceholder:Z

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    if-eqz p1, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Lcom/squareup/picasso/RequestCreator;->placeholderDrawable:Landroid/graphics/drawable/Drawable;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iput p1, p0, Lcom/squareup/picasso/RequestCreator;->placeholderResId:I

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    const-string p0, "Placeholder image already set."

    .line 15
    .line 16
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    :goto_0
    const/4 p0, 0x0

    .line 20
    return-object p0

    .line 21
    :cond_1
    const-string p0, "Placeholder image resource invalid."

    .line 22
    .line 23
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_2
    const-string p0, "Already explicitly declared as no placeholder."

    .line 28
    .line 29
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    goto :goto_0
.end method

.method public placeholder(Landroid/graphics/drawable/Drawable;)Lcom/squareup/picasso/RequestCreator;
    .locals 1

    .line 33
    iget-boolean v0, p0, Lcom/squareup/picasso/RequestCreator;->setPlaceholder:Z

    if-eqz v0, :cond_1

    .line 34
    iget v0, p0, Lcom/squareup/picasso/RequestCreator;->placeholderResId:I

    if-nez v0, :cond_0

    .line 35
    iput-object p1, p0, Lcom/squareup/picasso/RequestCreator;->placeholderDrawable:Landroid/graphics/drawable/Drawable;

    return-object p0

    .line 36
    :cond_0
    const-string p0, "Placeholder image already set."

    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    :goto_0
    const/4 p0, 0x0

    return-object p0

    .line 37
    :cond_1
    const-string p0, "Already explicitly declared as no placeholder."

    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public priority(Lcom/squareup/picasso/Picasso$Priority;)Lcom/squareup/picasso/RequestCreator;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/squareup/picasso/RequestCreator;->data:Lcom/squareup/picasso/Request$Builder;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/squareup/picasso/Request$Builder;->priority(Lcom/squareup/picasso/Picasso$Priority;)Lcom/squareup/picasso/Request$Builder;

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public purgeable()Lcom/squareup/picasso/RequestCreator;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/squareup/picasso/RequestCreator;->data:Lcom/squareup/picasso/Request$Builder;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/squareup/picasso/Request$Builder;->purgeable()Lcom/squareup/picasso/Request$Builder;

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public resize(II)Lcom/squareup/picasso/RequestCreator;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/squareup/picasso/RequestCreator;->data:Lcom/squareup/picasso/Request$Builder;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Lcom/squareup/picasso/Request$Builder;->resize(II)Lcom/squareup/picasso/Request$Builder;

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public resizeDimen(II)Lcom/squareup/picasso/RequestCreator;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/squareup/picasso/RequestCreator;->picasso:Lcom/squareup/picasso/Picasso;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/squareup/picasso/Picasso;->context:Landroid/content/Context;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    invoke-virtual {v0, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    invoke-virtual {p0, p1, p2}, Lcom/squareup/picasso/RequestCreator;->resize(II)Lcom/squareup/picasso/RequestCreator;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public rotate(F)Lcom/squareup/picasso/RequestCreator;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/squareup/picasso/RequestCreator;->data:Lcom/squareup/picasso/Request$Builder;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/squareup/picasso/Request$Builder;->rotate(F)Lcom/squareup/picasso/Request$Builder;

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public rotate(FFF)Lcom/squareup/picasso/RequestCreator;
    .locals 1

    .line 7
    iget-object v0, p0, Lcom/squareup/picasso/RequestCreator;->data:Lcom/squareup/picasso/Request$Builder;

    invoke-virtual {v0, p1, p2, p3}, Lcom/squareup/picasso/Request$Builder;->rotate(FFF)Lcom/squareup/picasso/Request$Builder;

    return-object p0
.end method

.method public stableKey(Ljava/lang/String;)Lcom/squareup/picasso/RequestCreator;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/squareup/picasso/RequestCreator;->data:Lcom/squareup/picasso/Request$Builder;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/squareup/picasso/Request$Builder;->stableKey(Ljava/lang/String;)Lcom/squareup/picasso/Request$Builder;

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public tag(Ljava/lang/Object;)Lcom/squareup/picasso/RequestCreator;
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_1

    .line 3
    .line 4
    iget-object v1, p0, Lcom/squareup/picasso/RequestCreator;->tag:Ljava/lang/Object;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    iput-object p1, p0, Lcom/squareup/picasso/RequestCreator;->tag:Ljava/lang/Object;

    .line 9
    .line 10
    return-object p0

    .line 11
    :cond_0
    const-string p0, "Tag already set."

    .line 12
    .line 13
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-object v0

    .line 17
    :cond_1
    const-string p0, "Tag invalid."

    .line 18
    .line 19
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-object v0
.end method

.method public transform(Lcom/squareup/picasso/Transformation;)Lcom/squareup/picasso/RequestCreator;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/squareup/picasso/RequestCreator;->data:Lcom/squareup/picasso/Request$Builder;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/squareup/picasso/Request$Builder;->transform(Lcom/squareup/picasso/Transformation;)Lcom/squareup/picasso/Request$Builder;

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public transform(Ljava/util/List;)Lcom/squareup/picasso/RequestCreator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Lcom/squareup/picasso/Transformation;",
            ">;)",
            "Lcom/squareup/picasso/RequestCreator;"
        }
    .end annotation

    .line 7
    iget-object v0, p0, Lcom/squareup/picasso/RequestCreator;->data:Lcom/squareup/picasso/Request$Builder;

    invoke-virtual {v0, p1}, Lcom/squareup/picasso/Request$Builder;->transform(Ljava/util/List;)Lcom/squareup/picasso/Request$Builder;

    return-object p0
.end method

.method public unfit()Lcom/squareup/picasso/RequestCreator;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/squareup/picasso/RequestCreator;->deferred:Z

    .line 3
    .line 4
    return-object p0
.end method
