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
    .line 79
    iput-object p1, p0, Lcom/melodix/music/PreviewLastTrackStore$1;->val$path:Ljava/io/File;

    iput-wide p2, p0, Lcom/melodix/music/PreviewLastTrackStore$1;->val$current:J

    iput-object p4, p0, Lcom/melodix/music/PreviewLastTrackStore$1;->val$callback:Lcom/melodix/music/PreviewLastTrackStore$Callback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    .prologue
    const/16 v4, 0x180

    .line 80
    iget-object v0, p0, Lcom/melodix/music/PreviewLastTrackStore$1;->val$path:Ljava/io/File;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {v0, v2, v3}, Lcom/melodix/music/PreviewLastTrackStore;->read(Ljava/io/File;J)Lcom/melodix/music/PreviewLastTrackStore$Record;

    move-result-object v5

    .line 81
    if-eqz v5, :cond_1

    const-string v7, "valide"

    .line 83
    :goto_0
    const/4 v6, 0x0

    .line 84
    if-eqz v5, :cond_0

    iget-object v0, v5, Lcom/melodix/music/PreviewLastTrackStore$Record;->image:[B

    array-length v0, v0

    if-lez v0, :cond_0

    .line 86
    :try_start_0
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    const/4 v1, 0x1

    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 87
    iget-object v1, v5, Lcom/melodix/music/PreviewLastTrackStore$Record;->image:[B

    const/4 v2, 0x0

    iget-object v3, v5, Lcom/melodix/music/PreviewLastTrackStore$Record;->image:[B

    array-length v3, v3

    invoke-static {v1, v2, v3, v0}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 88
    iget v1, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    if-lez v1, :cond_0

    iget v1, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    if-gt v1, v4, :cond_0

    iget v1, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    if-lez v1, :cond_0

    iget v0, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    if-gt v0, v4, :cond_0

    .line 89
    iget-object v0, v5, Lcom/melodix/music/PreviewLastTrackStore$Record;->image:[B

    const/4 v1, 0x0

    iget-object v2, v5, Lcom/melodix/music/PreviewLastTrackStore$Record;->image:[B

    array-length v2, v2

    invoke-static {v0, v1, v2}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v6

    .line 93
    :cond_0
    :goto_1
    invoke-static {}, Lcom/melodix/music/PreviewLastTrackStore;->access$0()Landroid/os/Handler;

    move-result-object v8

    new-instance v0, Lcom/melodix/music/PreviewLastTrackStore$1$1;

    iget-wide v2, p0, Lcom/melodix/music/PreviewLastTrackStore$1;->val$current:J

    iget-object v4, p0, Lcom/melodix/music/PreviewLastTrackStore$1;->val$callback:Lcom/melodix/music/PreviewLastTrackStore$Callback;

    move-object v1, p0

    invoke-direct/range {v0 .. v7}, Lcom/melodix/music/PreviewLastTrackStore$1$1;-><init>(Lcom/melodix/music/PreviewLastTrackStore$1;JLcom/melodix/music/PreviewLastTrackStore$Callback;Lcom/melodix/music/PreviewLastTrackStore$Record;Landroid/graphics/Bitmap;Ljava/lang/String;)V

    invoke-virtual {v8, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 94
    return-void

    .line 81
    :cond_1
    iget-object v0, p0, Lcom/melodix/music/PreviewLastTrackStore$1;->val$path:Ljava/io/File;

    if-nez v0, :cond_2

    const-string v7, "stockage indisponible"

    goto :goto_0

    .line 82
    :cond_2
    iget-object v0, p0, Lcom/melodix/music/PreviewLastTrackStore$1;->val$path:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_3

    new-instance v0, Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/melodix/music/PreviewLastTrackStore$1;->val$path:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, ".bak"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_3

    const-string v7, "absent ou inaccessible"

    goto :goto_0

    :cond_3
    const-string v7, "invalide, obsol\u00e8te ou illisible"

    goto :goto_0

    :catch_0
    move-exception v0

    goto :goto_1
.end method
