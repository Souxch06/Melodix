.class final Lcom/squareup/picasso/MarkableInputStream;
.super Ljava/io/InputStream;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field private static final DEFAULT_BUFFER_SIZE:I = 0x1000

.field private static final DEFAULT_LIMIT_INCREMENT:I = 0x400


# instance fields
.field private allowExpire:Z

.field private defaultMark:J

.field private final in:Ljava/io/InputStream;

.field private limit:J

.field private limitIncrement:I

.field private offset:J

.field private reset:J


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 1

    const/16 v0, 0x1000

    .line 32
    invoke-direct {p0, p1, v0}, Lcom/squareup/picasso/MarkableInputStream;-><init>(Ljava/io/InputStream;I)V

    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;I)V
    .locals 1

    const/16 v0, 0x400

    .line 31
    invoke-direct {p0, p1, p2, v0}, Lcom/squareup/picasso/MarkableInputStream;-><init>(Ljava/io/InputStream;II)V

    return-void
.end method

.method private constructor <init>(Ljava/io/InputStream;II)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, -0x1

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/squareup/picasso/MarkableInputStream;->defaultMark:J

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    iput-boolean v0, p0, Lcom/squareup/picasso/MarkableInputStream;->allowExpire:Z

    .line 10
    .line 11
    const/4 v0, -0x1

    .line 12
    iput v0, p0, Lcom/squareup/picasso/MarkableInputStream;->limitIncrement:I

    .line 13
    .line 14
    invoke-virtual {p1}, Ljava/io/InputStream;->markSupported()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    new-instance v0, Ljava/io/BufferedInputStream;

    .line 21
    .line 22
    invoke-direct {v0, p1, p2}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;I)V

    .line 23
    .line 24
    .line 25
    move-object p1, v0

    .line 26
    :cond_0
    iput-object p1, p0, Lcom/squareup/picasso/MarkableInputStream;->in:Ljava/io/InputStream;

    .line 27
    .line 28
    iput p3, p0, Lcom/squareup/picasso/MarkableInputStream;->limitIncrement:I

    .line 29
    .line 30
    return-void
.end method

.method private setLimit(J)V
    .locals 4

    .line 1
    :try_start_0
    iget-wide v0, p0, Lcom/squareup/picasso/MarkableInputStream;->reset:J

    .line 2
    .line 3
    iget-wide v2, p0, Lcom/squareup/picasso/MarkableInputStream;->offset:J

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    if-gez v0, :cond_0

    .line 8
    .line 9
    iget-wide v0, p0, Lcom/squareup/picasso/MarkableInputStream;->limit:J

    .line 10
    .line 11
    cmp-long v0, v2, v0

    .line 12
    .line 13
    if-gtz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/squareup/picasso/MarkableInputStream;->in:Ljava/io/InputStream;

    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/io/InputStream;->reset()V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/squareup/picasso/MarkableInputStream;->in:Ljava/io/InputStream;

    .line 21
    .line 22
    iget-wide v1, p0, Lcom/squareup/picasso/MarkableInputStream;->reset:J

    .line 23
    .line 24
    sub-long v1, p1, v1

    .line 25
    .line 26
    long-to-int v1, v1

    .line 27
    invoke-virtual {v0, v1}, Ljava/io/InputStream;->mark(I)V

    .line 28
    .line 29
    .line 30
    iget-wide v0, p0, Lcom/squareup/picasso/MarkableInputStream;->reset:J

    .line 31
    .line 32
    iget-wide v2, p0, Lcom/squareup/picasso/MarkableInputStream;->offset:J

    .line 33
    .line 34
    invoke-direct {p0, v0, v1, v2, v3}, Lcom/squareup/picasso/MarkableInputStream;->skip(JJ)V

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    iput-wide v2, p0, Lcom/squareup/picasso/MarkableInputStream;->reset:J

    .line 39
    .line 40
    iget-object v0, p0, Lcom/squareup/picasso/MarkableInputStream;->in:Ljava/io/InputStream;

    .line 41
    .line 42
    sub-long v1, p1, v2

    .line 43
    .line 44
    long-to-int v1, v1

    .line 45
    invoke-virtual {v0, v1}, Ljava/io/InputStream;->mark(I)V

    .line 46
    .line 47
    .line 48
    :goto_0
    iput-wide p1, p0, Lcom/squareup/picasso/MarkableInputStream;->limit:J
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 49
    .line 50
    return-void

    .line 51
    :catch_0
    move-exception p0

    .line 52
    const-string p1, "Unable to mark: "

    .line 53
    .line 54
    invoke-static {p0, p1}, Lwd1;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method private skip(JJ)V
    .locals 4

    :goto_0
    cmp-long v0, p1, p3

    if-gez v0, :cond_2

    .line 35
    iget-object v0, p0, Lcom/squareup/picasso/MarkableInputStream;->in:Ljava/io/InputStream;

    sub-long v1, p3, p1

    invoke-virtual {v0, v1, v2}, Ljava/io/InputStream;->skip(J)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-nez v2, :cond_1

    .line 36
    invoke-virtual {p0}, Lcom/squareup/picasso/MarkableInputStream;->read()I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    goto :goto_1

    :cond_0
    const-wide/16 v0, 0x1

    :cond_1
    add-long/2addr p1, v0

    goto :goto_0

    :cond_2
    :goto_1
    return-void
.end method


# virtual methods
.method public allowMarksToExpire(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/squareup/picasso/MarkableInputStream;->allowExpire:Z

    .line 2
    .line 3
    return-void
.end method

.method public available()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/squareup/picasso/MarkableInputStream;->in:Ljava/io/InputStream;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/io/InputStream;->available()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public close()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/squareup/picasso/MarkableInputStream;->in:Ljava/io/InputStream;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public mark(I)V
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, Lcom/squareup/picasso/MarkableInputStream;->savePosition(I)J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iput-wide v0, p0, Lcom/squareup/picasso/MarkableInputStream;->defaultMark:J

    .line 6
    .line 7
    return-void
.end method

.method public markSupported()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/squareup/picasso/MarkableInputStream;->in:Ljava/io/InputStream;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/io/InputStream;->markSupported()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public read()I
    .locals 7

    .line 42
    iget-boolean v0, p0, Lcom/squareup/picasso/MarkableInputStream;->allowExpire:Z

    const-wide/16 v1, 0x1

    if-nez v0, :cond_0

    iget-wide v3, p0, Lcom/squareup/picasso/MarkableInputStream;->offset:J

    add-long/2addr v3, v1

    iget-wide v5, p0, Lcom/squareup/picasso/MarkableInputStream;->limit:J

    cmp-long v0, v3, v5

    if-lez v0, :cond_0

    .line 43
    iget v0, p0, Lcom/squareup/picasso/MarkableInputStream;->limitIncrement:I

    int-to-long v3, v0

    add-long/2addr v5, v3

    invoke-direct {p0, v5, v6}, Lcom/squareup/picasso/MarkableInputStream;->setLimit(J)V

    .line 44
    :cond_0
    iget-object v0, p0, Lcom/squareup/picasso/MarkableInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    move-result v0

    const/4 v3, -0x1

    if-eq v0, v3, :cond_1

    .line 45
    iget-wide v3, p0, Lcom/squareup/picasso/MarkableInputStream;->offset:J

    add-long/2addr v3, v1

    iput-wide v3, p0, Lcom/squareup/picasso/MarkableInputStream;->offset:J

    :cond_1
    return v0
.end method

.method public read([B)I
    .locals 6

    .line 1
    iget-boolean v0, p0, Lcom/squareup/picasso/MarkableInputStream;->allowExpire:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-wide v0, p0, Lcom/squareup/picasso/MarkableInputStream;->offset:J

    .line 6
    .line 7
    array-length v2, p1

    .line 8
    int-to-long v2, v2

    .line 9
    add-long/2addr v2, v0

    .line 10
    iget-wide v4, p0, Lcom/squareup/picasso/MarkableInputStream;->limit:J

    .line 11
    .line 12
    cmp-long v2, v2, v4

    .line 13
    .line 14
    if-lez v2, :cond_0

    .line 15
    .line 16
    array-length v2, p1

    .line 17
    int-to-long v2, v2

    .line 18
    add-long/2addr v0, v2

    .line 19
    iget v2, p0, Lcom/squareup/picasso/MarkableInputStream;->limitIncrement:I

    .line 20
    .line 21
    int-to-long v2, v2

    .line 22
    add-long/2addr v0, v2

    .line 23
    invoke-direct {p0, v0, v1}, Lcom/squareup/picasso/MarkableInputStream;->setLimit(J)V

    .line 24
    .line 25
    .line 26
    :cond_0
    iget-object v0, p0, Lcom/squareup/picasso/MarkableInputStream;->in:Ljava/io/InputStream;

    .line 27
    .line 28
    invoke-virtual {v0, p1}, Ljava/io/InputStream;->read([B)I

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    const/4 v0, -0x1

    .line 33
    if-eq p1, v0, :cond_1

    .line 34
    .line 35
    iget-wide v0, p0, Lcom/squareup/picasso/MarkableInputStream;->offset:J

    .line 36
    .line 37
    int-to-long v2, p1

    .line 38
    add-long/2addr v0, v2

    .line 39
    iput-wide v0, p0, Lcom/squareup/picasso/MarkableInputStream;->offset:J

    .line 40
    .line 41
    :cond_1
    return p1
.end method

.method public read([BII)I
    .locals 8

    .line 46
    iget-boolean v0, p0, Lcom/squareup/picasso/MarkableInputStream;->allowExpire:Z

    if-nez v0, :cond_0

    iget-wide v0, p0, Lcom/squareup/picasso/MarkableInputStream;->offset:J

    int-to-long v2, p3

    add-long v4, v0, v2

    iget-wide v6, p0, Lcom/squareup/picasso/MarkableInputStream;->limit:J

    cmp-long v4, v4, v6

    if-lez v4, :cond_0

    add-long/2addr v0, v2

    .line 47
    iget v2, p0, Lcom/squareup/picasso/MarkableInputStream;->limitIncrement:I

    int-to-long v2, v2

    add-long/2addr v0, v2

    invoke-direct {p0, v0, v1}, Lcom/squareup/picasso/MarkableInputStream;->setLimit(J)V

    .line 48
    :cond_0
    iget-object v0, p0, Lcom/squareup/picasso/MarkableInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I

    move-result p1

    const/4 p2, -0x1

    if-eq p1, p2, :cond_1

    .line 49
    iget-wide p2, p0, Lcom/squareup/picasso/MarkableInputStream;->offset:J

    int-to-long v0, p1

    add-long/2addr p2, v0

    iput-wide p2, p0, Lcom/squareup/picasso/MarkableInputStream;->offset:J

    :cond_1
    return p1
.end method

.method public reset()V
    .locals 2

    .line 34
    iget-wide v0, p0, Lcom/squareup/picasso/MarkableInputStream;->defaultMark:J

    invoke-virtual {p0, v0, v1}, Lcom/squareup/picasso/MarkableInputStream;->reset(J)V

    return-void
.end method

.method public reset(J)V
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/squareup/picasso/MarkableInputStream;->offset:J

    .line 2
    .line 3
    iget-wide v2, p0, Lcom/squareup/picasso/MarkableInputStream;->limit:J

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    if-gtz v0, :cond_0

    .line 8
    .line 9
    iget-wide v0, p0, Lcom/squareup/picasso/MarkableInputStream;->reset:J

    .line 10
    .line 11
    cmp-long v0, p1, v0

    .line 12
    .line 13
    if-ltz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/squareup/picasso/MarkableInputStream;->in:Ljava/io/InputStream;

    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/io/InputStream;->reset()V

    .line 18
    .line 19
    .line 20
    iget-wide v0, p0, Lcom/squareup/picasso/MarkableInputStream;->reset:J

    .line 21
    .line 22
    invoke-direct {p0, v0, v1, p1, p2}, Lcom/squareup/picasso/MarkableInputStream;->skip(JJ)V

    .line 23
    .line 24
    .line 25
    iput-wide p1, p0, Lcom/squareup/picasso/MarkableInputStream;->offset:J

    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    const-string p0, "Cannot reset"

    .line 29
    .line 30
    invoke-static {p0}, Lo40;->k(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public savePosition(I)J
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/squareup/picasso/MarkableInputStream;->offset:J

    .line 2
    .line 3
    int-to-long v2, p1

    .line 4
    add-long/2addr v0, v2

    .line 5
    iget-wide v2, p0, Lcom/squareup/picasso/MarkableInputStream;->limit:J

    .line 6
    .line 7
    cmp-long p1, v2, v0

    .line 8
    .line 9
    if-gez p1, :cond_0

    .line 10
    .line 11
    invoke-direct {p0, v0, v1}, Lcom/squareup/picasso/MarkableInputStream;->setLimit(J)V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-wide p0, p0, Lcom/squareup/picasso/MarkableInputStream;->offset:J

    .line 15
    .line 16
    return-wide p0
.end method

.method public skip(J)J
    .locals 6

    .line 1
    iget-boolean v0, p0, Lcom/squareup/picasso/MarkableInputStream;->allowExpire:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-wide v0, p0, Lcom/squareup/picasso/MarkableInputStream;->offset:J

    .line 6
    .line 7
    add-long v2, v0, p1

    .line 8
    .line 9
    iget-wide v4, p0, Lcom/squareup/picasso/MarkableInputStream;->limit:J

    .line 10
    .line 11
    cmp-long v2, v2, v4

    .line 12
    .line 13
    if-lez v2, :cond_0

    .line 14
    .line 15
    add-long/2addr v0, p1

    .line 16
    iget v2, p0, Lcom/squareup/picasso/MarkableInputStream;->limitIncrement:I

    .line 17
    .line 18
    int-to-long v2, v2

    .line 19
    add-long/2addr v0, v2

    .line 20
    invoke-direct {p0, v0, v1}, Lcom/squareup/picasso/MarkableInputStream;->setLimit(J)V

    .line 21
    .line 22
    .line 23
    :cond_0
    iget-object v0, p0, Lcom/squareup/picasso/MarkableInputStream;->in:Ljava/io/InputStream;

    .line 24
    .line 25
    invoke-virtual {v0, p1, p2}, Ljava/io/InputStream;->skip(J)J

    .line 26
    .line 27
    .line 28
    move-result-wide p1

    .line 29
    iget-wide v0, p0, Lcom/squareup/picasso/MarkableInputStream;->offset:J

    .line 30
    .line 31
    add-long/2addr v0, p1

    .line 32
    iput-wide v0, p0, Lcom/squareup/picasso/MarkableInputStream;->offset:J

    .line 33
    .line 34
    return-wide p1
.end method
