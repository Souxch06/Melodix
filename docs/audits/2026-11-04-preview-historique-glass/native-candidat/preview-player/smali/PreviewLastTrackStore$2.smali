.class Lcom/melodix/music/PreviewLastTrackStore$2;
.super Ljava/lang/Object;
.source "PreviewLastTrackStore.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewLastTrackStore;->save(Landroid/content/Context;Lcom/melodix/music/PreviewLastTrackStore$Record;Landroid/graphics/Bitmap;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$bitmap:Landroid/graphics/Bitmap;

.field private final synthetic val$current:J

.field private final synthetic val$path:Ljava/io/File;

.field private final synthetic val$record:Lcom/melodix/music/PreviewLastTrackStore$Record;


# direct methods
.method constructor <init>(JLandroid/graphics/Bitmap;Lcom/melodix/music/PreviewLastTrackStore$Record;Ljava/io/File;)V
    .locals 1

    .prologue
    .line 100
    iput-wide p1, p0, Lcom/melodix/music/PreviewLastTrackStore$2;->val$current:J

    iput-object p3, p0, Lcom/melodix/music/PreviewLastTrackStore$2;->val$bitmap:Landroid/graphics/Bitmap;

    iput-object p4, p0, Lcom/melodix/music/PreviewLastTrackStore$2;->val$record:Lcom/melodix/music/PreviewLastTrackStore$Record;

    iput-object p5, p0, Lcom/melodix/music/PreviewLastTrackStore$2;->val$path:Ljava/io/File;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 101
    iget-wide v0, p0, Lcom/melodix/music/PreviewLastTrackStore$2;->val$current:J

    invoke-static {}, Lcom/melodix/music/PreviewLastTrackStore;->access$1()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    const-string v0, "annul\u00e9e"

    invoke-static {v0}, Lcom/melodix/music/PreviewLastTrackStore;->access$2(Ljava/lang/String;)V

    .line 117
    :goto_0
    return-void

    .line 102
    :cond_0
    iget-object v0, p0, Lcom/melodix/music/PreviewLastTrackStore$2;->val$bitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/melodix/music/PreviewLastTrackStore$2;->val$bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v0

    if-nez v0, :cond_2

    .line 103
    :try_start_0
    iget-object v0, p0, Lcom/melodix/music/PreviewLastTrackStore$2;->val$bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    iget-object v1, p0, Lcom/melodix/music/PreviewLastTrackStore$2;->val$bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    .line 104
    const/high16 v2, 0x3f800000    # 1.0f

    const/high16 v3, 0x43c00000    # 384.0f

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v4

    int-to-float v4, v4

    div-float/2addr v3, v4

    invoke-static {v2, v3}, Ljava/lang/Math;->min(FF)F

    move-result v2

    .line 105
    iget-object v3, p0, Lcom/melodix/music/PreviewLastTrackStore$2;->val$bitmap:Landroid/graphics/Bitmap;

    const/4 v4, 0x1

    int-to-float v0, v0

    mul-float/2addr v0, v2

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    invoke-static {v4, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    const/4 v4, 0x1

    int-to-float v1, v1

    mul-float/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    invoke-static {v4, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    const/4 v2, 0x1

    invoke-static {v3, v0, v1, v2}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 106
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 107
    sget-object v2, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v3, 0x55

    invoke-virtual {v0, v2, v3, v1}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v2

    const/high16 v3, 0x80000

    if-gt v2, v3, :cond_1

    iget-object v2, p0, Lcom/melodix/music/PreviewLastTrackStore$2;->val$record:Lcom/melodix/music/PreviewLastTrackStore$Record;

    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    iput-object v1, v2, Lcom/melodix/music/PreviewLastTrackStore$Record;->image:[B

    .line 108
    :cond_1
    iget-object v1, p0, Lcom/melodix/music/PreviewLastTrackStore$2;->val$bitmap:Landroid/graphics/Bitmap;

    if-eq v0, v1, :cond_2

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 110
    :cond_2
    :goto_1
    iget-object v0, p0, Lcom/melodix/music/PreviewLastTrackStore$2;->val$record:Lcom/melodix/music/PreviewLastTrackStore$Record;

    iget-object v0, v0, Lcom/melodix/music/PreviewLastTrackStore$Record;->image:[B

    if-nez v0, :cond_3

    .line 111
    iget-object v0, p0, Lcom/melodix/music/PreviewLastTrackStore$2;->val$path:Ljava/io/File;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {v0, v2, v3}, Lcom/melodix/music/PreviewLastTrackStore;->read(Ljava/io/File;J)Lcom/melodix/music/PreviewLastTrackStore$Record;

    move-result-object v0

    .line 112
    if-eqz v0, :cond_3

    iget-object v1, v0, Lcom/melodix/music/PreviewLastTrackStore$Record;->title:Ljava/lang/String;

    iget-object v2, p0, Lcom/melodix/music/PreviewLastTrackStore$2;->val$record:Lcom/melodix/music/PreviewLastTrackStore$Record;

    iget-object v2, v2, Lcom/melodix/music/PreviewLastTrackStore$Record;->title:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    iget-object v1, v0, Lcom/melodix/music/PreviewLastTrackStore$Record;->artist:Ljava/lang/String;

    iget-object v2, p0, Lcom/melodix/music/PreviewLastTrackStore$2;->val$record:Lcom/melodix/music/PreviewLastTrackStore$Record;

    iget-object v2, v2, Lcom/melodix/music/PreviewLastTrackStore$Record;->artist:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    iget-wide v2, v0, Lcom/melodix/music/PreviewLastTrackStore$Record;->duration:J

    iget-object v1, p0, Lcom/melodix/music/PreviewLastTrackStore$2;->val$record:Lcom/melodix/music/PreviewLastTrackStore$Record;

    iget-wide v4, v1, Lcom/melodix/music/PreviewLastTrackStore$Record;->duration:J

    cmp-long v1, v2, v4

    if-nez v1, :cond_3

    .line 113
    iget-object v1, p0, Lcom/melodix/music/PreviewLastTrackStore$2;->val$record:Lcom/melodix/music/PreviewLastTrackStore$Record;

    iget-object v0, v0, Lcom/melodix/music/PreviewLastTrackStore$Record;->image:[B

    iput-object v0, v1, Lcom/melodix/music/PreviewLastTrackStore$Record;->image:[B

    .line 115
    :cond_3
    iget-wide v0, p0, Lcom/melodix/music/PreviewLastTrackStore$2;->val$current:J

    invoke-static {}, Lcom/melodix/music/PreviewLastTrackStore;->access$1()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_5

    iget-object v0, p0, Lcom/melodix/music/PreviewLastTrackStore$2;->val$path:Ljava/io/File;

    iget-object v1, p0, Lcom/melodix/music/PreviewLastTrackStore$2;->val$record:Lcom/melodix/music/PreviewLastTrackStore$Record;

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewLastTrackStore;->write(Ljava/io/File;Lcom/melodix/music/PreviewLastTrackStore$Record;)Z

    move-result v0

    if-eqz v0, :cond_4

    const-string v0, "r\u00e9ussie"

    :goto_2
    invoke-static {v0}, Lcom/melodix/music/PreviewLastTrackStore;->access$2(Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_4
    const-string v0, "\u00e9chou\u00e9e"

    goto :goto_2

    .line 116
    :cond_5
    const-string v0, "annul\u00e9e"

    invoke-static {v0}, Lcom/melodix/music/PreviewLastTrackStore;->access$2(Ljava/lang/String;)V

    goto/16 :goto_0

    :catch_0
    move-exception v0

    goto :goto_1
.end method
