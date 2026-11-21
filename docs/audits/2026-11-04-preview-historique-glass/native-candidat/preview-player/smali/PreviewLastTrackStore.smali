.class final Lcom/melodix/music/PreviewLastTrackStore;
.super Ljava/lang/Object;
.source "PreviewLastTrackStore.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/melodix/music/PreviewLastTrackStore$Callback;,
        Lcom/melodix/music/PreviewLastTrackStore$Record;
    }
.end annotation


# static fields
.field private static final IO:Ljava/util/concurrent/ExecutorService;

.field private static final MAGIC:I = 0x4d445831

.field private static final MAIN:Landroid/os/Handler;

.field static final MAX_AGE:J = 0x9a7ec800L

.field private static final MAX_IMAGE:I = 0x80000

.field private static volatile generation:J

.field private static volatile lastWriteStatus:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 21
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lcom/melodix/music/PreviewLastTrackStore;->IO:Ljava/util/concurrent/ExecutorService;

    .line 22
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lcom/melodix/music/PreviewLastTrackStore;->MAIN:Landroid/os/Handler;

    .line 24
    const-string v0, "aucune \u00e9criture dans ce processus"

    sput-object v0, Lcom/melodix/music/PreviewLastTrackStore;->lastWriteStatus:Ljava/lang/String;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0()Landroid/os/Handler;
    .locals 1

    .prologue
    .line 22
    sget-object v0, Lcom/melodix/music/PreviewLastTrackStore;->MAIN:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$1()J
    .locals 2

    .prologue
    .line 23
    sget-wide v0, Lcom/melodix/music/PreviewLastTrackStore;->generation:J

    return-wide v0
.end method

.method static synthetic access$2(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 24
    sput-object p0, Lcom/melodix/music/PreviewLastTrackStore;->lastWriteStatus:Ljava/lang/String;

    return-void
.end method

.method static clear(Landroid/content/Context;)V
    .locals 6

    .prologue
    .line 120
    invoke-static {p0}, Lcom/melodix/music/PreviewLastTrackStore;->file(Landroid/content/Context;)Ljava/io/File;

    move-result-object v0

    sget-wide v2, Lcom/melodix/music/PreviewLastTrackStore;->generation:J

    const-wide/16 v4, 0x1

    add-long/2addr v2, v4

    sput-wide v2, Lcom/melodix/music/PreviewLastTrackStore;->generation:J

    const-string v1, "effacement demand\u00e9"

    sput-object v1, Lcom/melodix/music/PreviewLastTrackStore;->lastWriteStatus:Ljava/lang/String;

    .line 121
    if-nez v0, :cond_0

    const-string v0, "stockage indisponible"

    sput-object v0, Lcom/melodix/music/PreviewLastTrackStore;->lastWriteStatus:Ljava/lang/String;

    .line 125
    :goto_0
    return-void

    .line 123
    :cond_0
    :try_start_0
    sget-object v1, Lcom/melodix/music/PreviewLastTrackStore;->IO:Ljava/util/concurrent/ExecutorService;

    new-instance v2, Lcom/melodix/music/PreviewLastTrackStore$3;

    invoke-direct {v2, v0}, Lcom/melodix/music/PreviewLastTrackStore$3;-><init>(Ljava/io/File;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    const-string v0, "effac\u00e9"

    sput-object v0, Lcom/melodix/music/PreviewLastTrackStore;->lastWriteStatus:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 124
    :catch_0
    move-exception v0

    const-string v0, "effacement non confirm\u00e9"

    sput-object v0, Lcom/melodix/music/PreviewLastTrackStore;->lastWriteStatus:Ljava/lang/String;

    goto :goto_0
.end method

.method private static file(Landroid/content/Context;)Ljava/io/File;
    .locals 4

    .prologue
    const/4 v0, 0x0

    .line 34
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getNoBackupFilesDir()Ljava/io/File;

    move-result-object v2

    .line 35
    if-nez v2, :cond_0

    .line 36
    :goto_0
    return-object v0

    .line 35
    :cond_0
    new-instance v1, Ljava/io/File;

    const-string v3, "preview_last_track_v1"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v1

    goto :goto_0

    .line 36
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method static load(Landroid/content/Context;Lcom/melodix/music/PreviewLastTrackStore$Callback;)V
    .locals 5

    .prologue
    .line 78
    invoke-static {p0}, Lcom/melodix/music/PreviewLastTrackStore;->file(Landroid/content/Context;)Ljava/io/File;

    move-result-object v0

    sget-wide v2, Lcom/melodix/music/PreviewLastTrackStore;->generation:J

    .line 79
    sget-object v1, Lcom/melodix/music/PreviewLastTrackStore;->IO:Ljava/util/concurrent/ExecutorService;

    new-instance v4, Lcom/melodix/music/PreviewLastTrackStore$1;

    invoke-direct {v4, v0, v2, v3, p1}, Lcom/melodix/music/PreviewLastTrackStore$1;-><init>(Ljava/io/File;JLcom/melodix/music/PreviewLastTrackStore$Callback;)V

    invoke-interface {v1, v4}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 95
    return-void
.end method

.method static read(Ljava/io/File;J)Lcom/melodix/music/PreviewLastTrackStore$Record;
    .locals 7

    .prologue
    const/4 v0, 0x0

    .line 49
    if-nez p0, :cond_0

    .line 64
    :goto_0
    return-object v0

    .line 51
    :cond_0
    :try_start_0
    new-instance v1, Landroid/util/AtomicFile;

    invoke-direct {v1, p0}, Landroid/util/AtomicFile;-><init>(Ljava/io/File;)V

    .line 52
    new-instance v2, Ljava/io/DataInputStream;

    invoke-virtual {v1}, Landroid/util/AtomicFile;->openRead()Ljava/io/FileInputStream;

    move-result-object v1

    invoke-direct {v2, v1}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 54
    :try_start_1
    invoke-virtual {v2}, Ljava/io/DataInputStream;->readInt()I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v1

    const v3, 0x4d445831    # 2.05882128E8f

    if-eq v1, v3, :cond_1

    .line 63
    :try_start_2
    invoke-virtual {v2}, Ljava/io/DataInputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    .line 64
    :catch_0
    move-exception v1

    goto :goto_0

    .line 55
    :cond_1
    :try_start_3
    new-instance v1, Lcom/melodix/music/PreviewLastTrackStore$Record;

    invoke-direct {v1}, Lcom/melodix/music/PreviewLastTrackStore$Record;-><init>()V

    .line 56
    invoke-virtual {v2}, Ljava/io/DataInputStream;->readUTF()Ljava/lang/String;

    move-result-object v3

    iput-object v3, v1, Lcom/melodix/music/PreviewLastTrackStore$Record;->title:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/io/DataInputStream;->readUTF()Ljava/lang/String;

    move-result-object v3

    iput-object v3, v1, Lcom/melodix/music/PreviewLastTrackStore$Record;->artist:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/io/DataInputStream;->readUTF()Ljava/lang/String;

    move-result-object v3

    iput-object v3, v1, Lcom/melodix/music/PreviewLastTrackStore$Record;->state:Ljava/lang/String;

    .line 57
    invoke-virtual {v2}, Ljava/io/DataInputStream;->readLong()J

    move-result-wide v4

    iput-wide v4, v1, Lcom/melodix/music/PreviewLastTrackStore$Record;->duration:J

    invoke-virtual {v2}, Ljava/io/DataInputStream;->readLong()J

    move-result-wide v4

    iput-wide v4, v1, Lcom/melodix/music/PreviewLastTrackStore$Record;->position:J

    invoke-virtual {v2}, Ljava/io/DataInputStream;->readLong()J

    move-result-wide v4

    iput-wide v4, v1, Lcom/melodix/music/PreviewLastTrackStore$Record;->observed:J

    .line 58
    invoke-virtual {v2}, Ljava/io/DataInputStream;->readInt()I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-result v3

    .line 59
    if-ltz v3, :cond_2

    const/high16 v4, 0x80000

    if-le v3, v4, :cond_3

    .line 63
    :cond_2
    :try_start_4
    invoke-virtual {v2}, Ljava/io/DataInputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    goto :goto_0

    .line 60
    :cond_3
    :try_start_5
    new-array v3, v3, [B

    iput-object v3, v1, Lcom/melodix/music/PreviewLastTrackStore$Record;->image:[B

    iget-object v3, v1, Lcom/melodix/music/PreviewLastTrackStore$Record;->image:[B

    invoke-virtual {v2, v3}, Ljava/io/DataInputStream;->readFully([B)V

    .line 61
    invoke-virtual {v2}, Ljava/io/DataInputStream;->read()I

    move-result v3

    const/4 v4, -0x1

    if-ne v3, v4, :cond_4

    invoke-static {v1, p1, p2}, Lcom/melodix/music/PreviewLastTrackStore;->valid(Lcom/melodix/music/PreviewLastTrackStore$Record;J)Z
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    move-result v3

    if-nez v3, :cond_5

    .line 63
    :cond_4
    :try_start_6
    invoke-virtual {v2}, Ljava/io/DataInputStream;->close()V

    goto :goto_0

    :cond_5
    invoke-virtual {v2}, Ljava/io/DataInputStream;->close()V

    move-object v0, v1

    .line 62
    goto :goto_0

    .line 63
    :catchall_0
    move-exception v1

    invoke-virtual {v2}, Ljava/io/DataInputStream;->close()V

    throw v1
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_0
.end method

.method static save(Landroid/content/Context;Lcom/melodix/music/PreviewLastTrackStore$Record;Landroid/graphics/Bitmap;)V
    .locals 7

    .prologue
    .line 97
    invoke-static {p0}, Lcom/melodix/music/PreviewLastTrackStore;->file(Landroid/content/Context;)Ljava/io/File;

    move-result-object v6

    sget-wide v2, Lcom/melodix/music/PreviewLastTrackStore;->generation:J

    .line 98
    if-nez v6, :cond_0

    const-string v0, "stockage indisponible"

    sput-object v0, Lcom/melodix/music/PreviewLastTrackStore;->lastWriteStatus:Ljava/lang/String;

    .line 118
    :goto_0
    return-void

    .line 99
    :cond_0
    const-string v0, "en attente"

    sput-object v0, Lcom/melodix/music/PreviewLastTrackStore;->lastWriteStatus:Ljava/lang/String;

    .line 100
    sget-object v0, Lcom/melodix/music/PreviewLastTrackStore;->IO:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcom/melodix/music/PreviewLastTrackStore$2;

    move-object v4, p2

    move-object v5, p1

    invoke-direct/range {v1 .. v6}, Lcom/melodix/music/PreviewLastTrackStore$2;-><init>(JLandroid/graphics/Bitmap;Lcom/melodix/music/PreviewLastTrackStore$Record;Ljava/io/File;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method static valid(Lcom/melodix/music/PreviewLastTrackStore$Record;J)Z
    .locals 7

    .prologue
    const/16 v1, 0x78

    const-wide/16 v4, 0x0

    .line 39
    if-eqz p0, :cond_2

    iget-object v0, p0, Lcom/melodix/music/PreviewLastTrackStore$Record;->title:Ljava/lang/String;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/melodix/music/PreviewLastTrackStore$Record;->artist:Ljava/lang/String;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/melodix/music/PreviewLastTrackStore$Record;->state:Ljava/lang/String;

    if-eqz v0, :cond_2

    .line 40
    iget-object v0, p0, Lcom/melodix/music/PreviewLastTrackStore$Record;->title:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/melodix/music/PreviewLastTrackStore$Record;->artist:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    .line 41
    iget-object v0, p0, Lcom/melodix/music/PreviewLastTrackStore$Record;->title:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-gt v0, v1, :cond_2

    iget-object v0, p0, Lcom/melodix/music/PreviewLastTrackStore$Record;->artist:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-gt v0, v1, :cond_2

    .line 42
    iget-object v0, p0, Lcom/melodix/music/PreviewLastTrackStore$Record;->state:Ljava/lang/String;

    const-string v1, "playing"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewLastTrackStore$Record;->state:Ljava/lang/String;

    const-string v1, "paused"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 43
    :cond_0
    iget-wide v0, p0, Lcom/melodix/music/PreviewLastTrackStore$Record;->duration:J

    cmp-long v0, v0, v4

    if-lez v0, :cond_2

    iget-wide v0, p0, Lcom/melodix/music/PreviewLastTrackStore$Record;->duration:J

    const-wide/32 v2, 0x5265c00

    cmp-long v0, v0, v2

    if-gtz v0, :cond_2

    .line 44
    iget-wide v0, p0, Lcom/melodix/music/PreviewLastTrackStore$Record;->position:J

    cmp-long v0, v0, v4

    if-ltz v0, :cond_2

    iget-wide v0, p0, Lcom/melodix/music/PreviewLastTrackStore$Record;->position:J

    iget-wide v2, p0, Lcom/melodix/music/PreviewLastTrackStore$Record;->duration:J

    cmp-long v0, v0, v2

    if-gtz v0, :cond_2

    .line 45
    iget-wide v0, p0, Lcom/melodix/music/PreviewLastTrackStore$Record;->observed:J

    cmp-long v0, v0, v4

    if-lez v0, :cond_2

    iget-wide v0, p0, Lcom/melodix/music/PreviewLastTrackStore$Record;->observed:J

    cmp-long v0, v0, p1

    if-gtz v0, :cond_2

    iget-wide v0, p0, Lcom/melodix/music/PreviewLastTrackStore$Record;->observed:J

    sub-long v0, p1, v0

    const-wide v2, 0x9a7ec800L

    cmp-long v0, v0, v2

    if-gtz v0, :cond_2

    .line 46
    iget-object v0, p0, Lcom/melodix/music/PreviewLastTrackStore$Record;->image:[B

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/melodix/music/PreviewLastTrackStore$Record;->image:[B

    array-length v0, v0

    const/high16 v1, 0x80000

    .line 39
    if-gt v0, v1, :cond_2

    :cond_1
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static write(Ljava/io/File;Lcom/melodix/music/PreviewLastTrackStore$Record;)Z
    .locals 8

    .prologue
    const/4 v0, 0x0

    .line 67
    if-eqz p0, :cond_0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {p1, v2, v3}, Lcom/melodix/music/PreviewLastTrackStore;->valid(Lcom/melodix/music/PreviewLastTrackStore$Record;J)Z

    move-result v1

    if-nez v1, :cond_1

    .line 75
    :cond_0
    :goto_0
    return v0

    .line 68
    :cond_1
    new-instance v3, Landroid/util/AtomicFile;

    invoke-direct {v3, p0}, Landroid/util/AtomicFile;-><init>(Ljava/io/File;)V

    const/4 v1, 0x0

    .line 70
    :try_start_0
    invoke-virtual {v3}, Landroid/util/AtomicFile;->startWrite()Ljava/io/FileOutputStream;

    move-result-object v1

    new-instance v4, Ljava/io/DataOutputStream;

    invoke-direct {v4, v1}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 71
    const v2, 0x4d445831    # 2.05882128E8f

    invoke-virtual {v4, v2}, Ljava/io/DataOutputStream;->writeInt(I)V

    iget-object v2, p1, Lcom/melodix/music/PreviewLastTrackStore$Record;->title:Ljava/lang/String;

    invoke-virtual {v4, v2}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V

    iget-object v2, p1, Lcom/melodix/music/PreviewLastTrackStore$Record;->artist:Ljava/lang/String;

    invoke-virtual {v4, v2}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V

    iget-object v2, p1, Lcom/melodix/music/PreviewLastTrackStore$Record;->state:Ljava/lang/String;

    invoke-virtual {v4, v2}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 72
    iget-wide v6, p1, Lcom/melodix/music/PreviewLastTrackStore$Record;->duration:J

    invoke-virtual {v4, v6, v7}, Ljava/io/DataOutputStream;->writeLong(J)V

    iget-wide v6, p1, Lcom/melodix/music/PreviewLastTrackStore$Record;->position:J

    invoke-virtual {v4, v6, v7}, Ljava/io/DataOutputStream;->writeLong(J)V

    iget-wide v6, p1, Lcom/melodix/music/PreviewLastTrackStore$Record;->observed:J

    invoke-virtual {v4, v6, v7}, Ljava/io/DataOutputStream;->writeLong(J)V

    .line 73
    iget-object v2, p1, Lcom/melodix/music/PreviewLastTrackStore$Record;->image:[B

    if-nez v2, :cond_2

    const/4 v2, 0x0

    new-array v2, v2, [B

    .line 74
    :goto_1
    array-length v5, v2

    invoke-virtual {v4, v5}, Ljava/io/DataOutputStream;->writeInt(I)V

    invoke-virtual {v4, v2}, Ljava/io/DataOutputStream;->write([B)V

    invoke-virtual {v4}, Ljava/io/DataOutputStream;->flush()V

    invoke-virtual {v3, v1}, Landroid/util/AtomicFile;->finishWrite(Ljava/io/FileOutputStream;)V

    const/4 v0, 0x1

    goto :goto_0

    .line 73
    :cond_2
    iget-object v2, p1, Lcom/melodix/music/PreviewLastTrackStore$Record;->image:[B
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 75
    :catch_0
    move-exception v2

    if-eqz v1, :cond_0

    invoke-virtual {v3, v1}, Landroid/util/AtomicFile;->failWrite(Ljava/io/FileOutputStream;)V

    goto :goto_0
.end method

.method static writeStatus()Ljava/lang/String;
    .locals 1

    .prologue
    .line 25
    sget-object v0, Lcom/melodix/music/PreviewLastTrackStore;->lastWriteStatus:Ljava/lang/String;

    return-object v0
.end method
