.class Lcom/melodix/music/PreviewLastTrackStore$1;
.super Ljava/lang/Object;
.source "PreviewLastTrackStore.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewLastTrackStore;->load(Landroid/content/Context;Lcom/melodix/music/PreviewLastTrackStore$Callback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$callback:Lcom/melodix/music/PreviewLastTrackStore$Callback;

.field private final synthetic val$current:J

.field private final synthetic val$path:Ljava/io/File;


# direct methods
.method constructor <init>(Ljava/io/File;JLcom/melodix/music/PreviewLastTrackStore$Callback;)V
    .locals 0

    .prologue
    .line 77
    iput-object p1, p0, Lcom/melodix/music/PreviewLastTrackStore$1;->val$path:Ljava/io/File;

    iput-wide p2, p0, Lcom/melodix/music/PreviewLastTrackStore$1;->val$current:J

    iput-object p4, p0, Lcom/melodix/music/PreviewLastTrackStore$1;->val$callback:Lcom/melodix/music/PreviewLastTrackStore$Callback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .prologue
    const/16 v4, 0x180

    .line 78
    iget-object v0, p0, Lcom/melodix/music/PreviewLastTrackStore$1;->val$path:Ljava/io/File;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {v0, v2, v3}, Lcom/melodix/music/PreviewLastTrackStore;->read(Ljava/io/File;J)Lcom/melodix/music/PreviewLastTrackStore$Record;

    move-result-object v5

    const/4 v6, 0x0

    .line 79
    if-eqz v5, :cond_0

    iget-object v0, v5, Lcom/melodix/music/PreviewLastTrackStore$Record;->image:[B

    array-length v0, v0

    if-lez v0, :cond_0

    .line 81
    :try_start_0
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    const/4 v1, 0x1

    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 82
    iget-object v1, v5, Lcom/melodix/music/PreviewLastTrackStore$Record;->image:[B

    const/4 v2, 0x0

    iget-object v3, v5, Lcom/melodix/music/PreviewLastTrackStore$Record;->image:[B

    array-length v3, v3

    invoke-static {v1, v2, v3, v0}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 83
    iget v1, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    if-lez v1, :cond_0

    iget v1, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    if-gt v1, v4, :cond_0

    iget v1, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    if-lez v1, :cond_0

    iget v0, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    if-gt v0, v4, :cond_0

    .line 84
    iget-object v0, v5, Lcom/melodix/music/PreviewLastTrackStore$Record;->image:[B

    const/4 v1, 0x0

    iget-object v2, v5, Lcom/melodix/music/PreviewLastTrackStore$Record;->image:[B

    array-length v2, v2

    invoke-static {v0, v1, v2}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v6

    .line 88
    :cond_0
    :goto_0
    invoke-static {}, Lcom/melodix/music/PreviewLastTrackStore;->access$0()Landroid/os/Handler;

    move-result-object v7

    new-instance v0, Lcom/melodix/music/PreviewLastTrackStore$1$1;

    iget-wide v2, p0, Lcom/melodix/music/PreviewLastTrackStore$1;->val$current:J

    iget-object v4, p0, Lcom/melodix/music/PreviewLastTrackStore$1;->val$callback:Lcom/melodix/music/PreviewLastTrackStore$Callback;

    move-object v1, p0

    invoke-direct/range {v0 .. v6}, Lcom/melodix/music/PreviewLastTrackStore$1$1;-><init>(Lcom/melodix/music/PreviewLastTrackStore$1;JLcom/melodix/music/PreviewLastTrackStore$Callback;Lcom/melodix/music/PreviewLastTrackStore$Record;Landroid/graphics/Bitmap;)V

    invoke-virtual {v7, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 89
    return-void

    :catch_0
    move-exception v0

    goto :goto_0
.end method
