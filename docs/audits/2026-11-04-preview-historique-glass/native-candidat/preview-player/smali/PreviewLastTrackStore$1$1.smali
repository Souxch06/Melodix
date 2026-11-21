.class Lcom/melodix/music/PreviewLastTrackStore$1$1;
.super Ljava/lang/Object;
.source "PreviewLastTrackStore.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewLastTrackStore$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/melodix/music/PreviewLastTrackStore$1;

.field private final synthetic val$callback:Lcom/melodix/music/PreviewLastTrackStore$Callback;

.field private final synthetic val$current:J

.field private final synthetic val$image:Landroid/graphics/Bitmap;

.field private final synthetic val$r:Lcom/melodix/music/PreviewLastTrackStore$Record;

.field private final synthetic val$status:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewLastTrackStore$1;JLcom/melodix/music/PreviewLastTrackStore$Callback;Lcom/melodix/music/PreviewLastTrackStore$Record;Landroid/graphics/Bitmap;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 93
    iput-object p1, p0, Lcom/melodix/music/PreviewLastTrackStore$1$1;->this$1:Lcom/melodix/music/PreviewLastTrackStore$1;

    iput-wide p2, p0, Lcom/melodix/music/PreviewLastTrackStore$1$1;->val$current:J

    iput-object p4, p0, Lcom/melodix/music/PreviewLastTrackStore$1$1;->val$callback:Lcom/melodix/music/PreviewLastTrackStore$Callback;

    iput-object p5, p0, Lcom/melodix/music/PreviewLastTrackStore$1$1;->val$r:Lcom/melodix/music/PreviewLastTrackStore$Record;

    iput-object p6, p0, Lcom/melodix/music/PreviewLastTrackStore$1$1;->val$image:Landroid/graphics/Bitmap;

    iput-object p7, p0, Lcom/melodix/music/PreviewLastTrackStore$1$1;->val$status:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 93
    iget-wide v0, p0, Lcom/melodix/music/PreviewLastTrackStore$1$1;->val$current:J

    invoke-static {}, Lcom/melodix/music/PreviewLastTrackStore;->access$1()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewLastTrackStore$1$1;->val$callback:Lcom/melodix/music/PreviewLastTrackStore$Callback;

    iget-object v1, p0, Lcom/melodix/music/PreviewLastTrackStore$1$1;->val$r:Lcom/melodix/music/PreviewLastTrackStore$Record;

    iget-object v2, p0, Lcom/melodix/music/PreviewLastTrackStore$1$1;->val$image:Landroid/graphics/Bitmap;

    iget-object v3, p0, Lcom/melodix/music/PreviewLastTrackStore$1$1;->val$status:Ljava/lang/String;

    invoke-interface {v0, v1, v2, v3}, Lcom/melodix/music/PreviewLastTrackStore$Callback;->loaded(Lcom/melodix/music/PreviewLastTrackStore$Record;Landroid/graphics/Bitmap;Ljava/lang/String;)V

    :cond_0
    return-void
.end method
