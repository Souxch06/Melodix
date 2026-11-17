.class Lcom/melodix/music/PreviewLastTrackStore$3;
.super Ljava/lang/Object;
.source "PreviewLastTrackStore.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewLastTrackStore;->clear(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$path:Ljava/io/File;


# direct methods
.method constructor <init>(Ljava/io/File;)V
    .locals 0

    .prologue
    .line 116
    iput-object p1, p0, Lcom/melodix/music/PreviewLastTrackStore$3;->val$path:Ljava/io/File;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 116
    new-instance v0, Landroid/util/AtomicFile;

    iget-object v1, p0, Lcom/melodix/music/PreviewLastTrackStore$3;->val$path:Ljava/io/File;

    invoke-direct {v0, v1}, Landroid/util/AtomicFile;-><init>(Ljava/io/File;)V

    invoke-virtual {v0}, Landroid/util/AtomicFile;->delete()V

    return-void
.end method
