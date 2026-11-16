.class Lcom/melodix/music/PreviewPlayerVolume$11$1;
.super Ljava/lang/Object;
.source "PreviewPlayerVolume.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerVolume$11;->onDismiss(Landroid/content/DialogInterface;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/melodix/music/PreviewPlayerVolume$11;


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerVolume$11;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 124
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerVolume$11$1;->this$1:Lcom/melodix/music/PreviewPlayerVolume$11;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 124
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume$11$1;->this$1:Lcom/melodix/music/PreviewPlayerVolume$11;

    iget-object v0, v0, Lcom/melodix/music/PreviewPlayerVolume$11;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerVolume;->access$100(Lcom/melodix/music/PreviewPlayerVolume;)V

    return-void
.end method
