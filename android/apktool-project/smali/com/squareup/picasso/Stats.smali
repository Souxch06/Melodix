.class Lcom/squareup/picasso/Stats;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/squareup/picasso/Stats$StatsHandler;
    }
.end annotation


# static fields
.field private static final BITMAP_DECODE_FINISHED:I = 0x2

.field private static final BITMAP_TRANSFORMED_FINISHED:I = 0x3

.field private static final CACHE_HIT:I = 0x0

.field private static final CACHE_MISS:I = 0x1

.field private static final DOWNLOAD_FINISHED:I = 0x4

.field private static final STATS_THREAD_NAME:Ljava/lang/String; = "Picasso-Stats"


# instance fields
.field averageDownloadSize:J

.field averageOriginalBitmapSize:J

.field averageTransformedBitmapSize:J

.field final cache:Lcom/squareup/picasso/Cache;

.field cacheHits:J

.field cacheMisses:J

.field downloadCount:I

.field final handler:Landroid/os/Handler;

.field originalBitmapCount:I

.field final statsThread:Landroid/os/HandlerThread;

.field totalDownloadSize:J

.field totalOriginalBitmapSize:J

.field totalTransformedBitmapSize:J

.field transformedBitmapCount:I


# direct methods
.method public constructor <init>(Lcom/squareup/picasso/Cache;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/squareup/picasso/Stats;->cache:Lcom/squareup/picasso/Cache;

    .line 5
    .line 6
    new-instance p1, Landroid/os/HandlerThread;

    .line 7
    .line 8
    const-string v0, "Picasso-Stats"

    .line 9
    .line 10
    const/16 v1, 0xa

    .line 11
    .line 12
    invoke-direct {p1, v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;I)V

    .line 13
    .line 14
    .line 15
    iput-object p1, p0, Lcom/squareup/picasso/Stats;->statsThread:Landroid/os/HandlerThread;

    .line 16
    .line 17
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-static {v0}, Lcom/squareup/picasso/Utils;->flushStackLocalLeaks(Landroid/os/Looper;)V

    .line 25
    .line 26
    .line 27
    new-instance v0, Lcom/squareup/picasso/Stats$StatsHandler;

    .line 28
    .line 29
    invoke-virtual {p1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-direct {v0, p1, p0}, Lcom/squareup/picasso/Stats$StatsHandler;-><init>(Landroid/os/Looper;Lcom/squareup/picasso/Stats;)V

    .line 34
    .line 35
    .line 36
    iput-object v0, p0, Lcom/squareup/picasso/Stats;->handler:Landroid/os/Handler;

    .line 37
    .line 38
    return-void
.end method

.method private static getAverage(IJ)J
    .locals 2

    .line 1
    int-to-long v0, p0

    .line 2
    div-long/2addr p1, v0

    .line 3
    return-wide p1
.end method

.method private processBitmap(Landroid/graphics/Bitmap;I)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/squareup/picasso/Utils;->getBitmapBytes(Landroid/graphics/Bitmap;)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object p0, p0, Lcom/squareup/picasso/Stats;->handler:Landroid/os/Handler;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p0, p2, p1, v0}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 13
    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public createSnapshot()Lcom/squareup/picasso/StatsSnapshot;
    .locals 26

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    new-instance v1, Lcom/squareup/picasso/StatsSnapshot;

    .line 4
    .line 5
    iget-object v2, v0, Lcom/squareup/picasso/Stats;->cache:Lcom/squareup/picasso/Cache;

    .line 6
    .line 7
    invoke-interface {v2}, Lcom/squareup/picasso/Cache;->maxSize()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    iget-object v3, v0, Lcom/squareup/picasso/Stats;->cache:Lcom/squareup/picasso/Cache;

    .line 12
    .line 13
    invoke-interface {v3}, Lcom/squareup/picasso/Cache;->size()I

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    move-object v5, v1

    .line 18
    move v1, v2

    .line 19
    move v2, v3

    .line 20
    iget-wide v3, v0, Lcom/squareup/picasso/Stats;->cacheHits:J

    .line 21
    .line 22
    move-object v7, v5

    .line 23
    iget-wide v5, v0, Lcom/squareup/picasso/Stats;->cacheMisses:J

    .line 24
    .line 25
    move-object v9, v7

    .line 26
    iget-wide v7, v0, Lcom/squareup/picasso/Stats;->totalDownloadSize:J

    .line 27
    .line 28
    move-object v11, v9

    .line 29
    iget-wide v9, v0, Lcom/squareup/picasso/Stats;->totalOriginalBitmapSize:J

    .line 30
    .line 31
    move-object v13, v11

    .line 32
    iget-wide v11, v0, Lcom/squareup/picasso/Stats;->totalTransformedBitmapSize:J

    .line 33
    .line 34
    move-object v15, v13

    .line 35
    iget-wide v13, v0, Lcom/squareup/picasso/Stats;->averageDownloadSize:J

    .line 36
    .line 37
    move/from16 v17, v1

    .line 38
    .line 39
    move/from16 v16, v2

    .line 40
    .line 41
    iget-wide v1, v0, Lcom/squareup/picasso/Stats;->averageOriginalBitmapSize:J

    .line 42
    .line 43
    move-wide/from16 v18, v1

    .line 44
    .line 45
    iget-wide v1, v0, Lcom/squareup/picasso/Stats;->averageTransformedBitmapSize:J

    .line 46
    .line 47
    move-wide/from16 v20, v1

    .line 48
    .line 49
    iget v1, v0, Lcom/squareup/picasso/Stats;->downloadCount:I

    .line 50
    .line 51
    iget v2, v0, Lcom/squareup/picasso/Stats;->originalBitmapCount:I

    .line 52
    .line 53
    iget v0, v0, Lcom/squareup/picasso/Stats;->transformedBitmapCount:I

    .line 54
    .line 55
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 56
    .line 57
    .line 58
    move-result-wide v22

    .line 59
    move-wide/from16 v24, v20

    .line 60
    .line 61
    move/from16 v21, v0

    .line 62
    .line 63
    move/from16 v20, v2

    .line 64
    .line 65
    move-object v0, v15

    .line 66
    move/from16 v2, v16

    .line 67
    .line 68
    move-wide/from16 v15, v18

    .line 69
    .line 70
    move/from16 v19, v1

    .line 71
    .line 72
    move/from16 v1, v17

    .line 73
    .line 74
    move-wide/from16 v17, v24

    .line 75
    .line 76
    invoke-direct/range {v0 .. v23}, Lcom/squareup/picasso/StatsSnapshot;-><init>(IIJJJJJJJJIIIJ)V

    .line 77
    .line 78
    .line 79
    move-object v15, v0

    .line 80
    return-object v15
.end method

.method public dispatchBitmapDecoded(Landroid/graphics/Bitmap;)V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-direct {p0, p1, v0}, Lcom/squareup/picasso/Stats;->processBitmap(Landroid/graphics/Bitmap;I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public dispatchBitmapTransformed(Landroid/graphics/Bitmap;)V
    .locals 1

    .line 1
    const/4 v0, 0x3

    .line 2
    invoke-direct {p0, p1, v0}, Lcom/squareup/picasso/Stats;->processBitmap(Landroid/graphics/Bitmap;I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public dispatchCacheHit()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/squareup/picasso/Stats;->handler:Landroid/os/Handler;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public dispatchCacheMiss()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/squareup/picasso/Stats;->handler:Landroid/os/Handler;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p0, v0}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public dispatchDownloadFinished(J)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/squareup/picasso/Stats;->handler:Landroid/os/Handler;

    .line 2
    .line 3
    const/4 v0, 0x4

    .line 4
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p0, v0, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public performBitmapDecoded(J)V
    .locals 3

    .line 1
    iget v0, p0, Lcom/squareup/picasso/Stats;->originalBitmapCount:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    iput v0, p0, Lcom/squareup/picasso/Stats;->originalBitmapCount:I

    .line 6
    .line 7
    iget-wide v1, p0, Lcom/squareup/picasso/Stats;->totalOriginalBitmapSize:J

    .line 8
    .line 9
    add-long/2addr v1, p1

    .line 10
    iput-wide v1, p0, Lcom/squareup/picasso/Stats;->totalOriginalBitmapSize:J

    .line 11
    .line 12
    invoke-static {v0, v1, v2}, Lcom/squareup/picasso/Stats;->getAverage(IJ)J

    .line 13
    .line 14
    .line 15
    move-result-wide p1

    .line 16
    iput-wide p1, p0, Lcom/squareup/picasso/Stats;->averageOriginalBitmapSize:J

    .line 17
    .line 18
    return-void
.end method

.method public performBitmapTransformed(J)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/squareup/picasso/Stats;->transformedBitmapCount:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    iput v0, p0, Lcom/squareup/picasso/Stats;->transformedBitmapCount:I

    .line 6
    .line 7
    iget-wide v0, p0, Lcom/squareup/picasso/Stats;->totalTransformedBitmapSize:J

    .line 8
    .line 9
    add-long/2addr v0, p1

    .line 10
    iput-wide v0, p0, Lcom/squareup/picasso/Stats;->totalTransformedBitmapSize:J

    .line 11
    .line 12
    iget p1, p0, Lcom/squareup/picasso/Stats;->originalBitmapCount:I

    .line 13
    .line 14
    invoke-static {p1, v0, v1}, Lcom/squareup/picasso/Stats;->getAverage(IJ)J

    .line 15
    .line 16
    .line 17
    move-result-wide p1

    .line 18
    iput-wide p1, p0, Lcom/squareup/picasso/Stats;->averageTransformedBitmapSize:J

    .line 19
    .line 20
    return-void
.end method

.method public performCacheHit()V
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/squareup/picasso/Stats;->cacheHits:J

    .line 2
    .line 3
    const-wide/16 v2, 0x1

    .line 4
    .line 5
    add-long/2addr v0, v2

    .line 6
    iput-wide v0, p0, Lcom/squareup/picasso/Stats;->cacheHits:J

    .line 7
    .line 8
    return-void
.end method

.method public performCacheMiss()V
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/squareup/picasso/Stats;->cacheMisses:J

    .line 2
    .line 3
    const-wide/16 v2, 0x1

    .line 4
    .line 5
    add-long/2addr v0, v2

    .line 6
    iput-wide v0, p0, Lcom/squareup/picasso/Stats;->cacheMisses:J

    .line 7
    .line 8
    return-void
.end method

.method public performDownloadFinished(Ljava/lang/Long;)V
    .locals 4

    .line 1
    iget v0, p0, Lcom/squareup/picasso/Stats;->downloadCount:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    iput v0, p0, Lcom/squareup/picasso/Stats;->downloadCount:I

    .line 6
    .line 7
    iget-wide v0, p0, Lcom/squareup/picasso/Stats;->totalDownloadSize:J

    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 10
    .line 11
    .line 12
    move-result-wide v2

    .line 13
    add-long/2addr v2, v0

    .line 14
    iput-wide v2, p0, Lcom/squareup/picasso/Stats;->totalDownloadSize:J

    .line 15
    .line 16
    iget p1, p0, Lcom/squareup/picasso/Stats;->downloadCount:I

    .line 17
    .line 18
    invoke-static {p1, v2, v3}, Lcom/squareup/picasso/Stats;->getAverage(IJ)J

    .line 19
    .line 20
    .line 21
    move-result-wide v0

    .line 22
    iput-wide v0, p0, Lcom/squareup/picasso/Stats;->averageDownloadSize:J

    .line 23
    .line 24
    return-void
.end method

.method public shutdown()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/squareup/picasso/Stats;->statsThread:Landroid/os/HandlerThread;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/os/HandlerThread;->quit()Z

    .line 4
    .line 5
    .line 6
    return-void
.end method
