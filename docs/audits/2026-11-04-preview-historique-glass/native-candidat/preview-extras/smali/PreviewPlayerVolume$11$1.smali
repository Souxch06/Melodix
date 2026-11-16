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

    .prologue
    .line 126
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerVolume$11$1;->this$1:Lcom/melodix/music/PreviewPlayerVolume$11;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 126
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume$11$1;->this$1:Lcom/melodix/music/PreviewPlayerVolume$11;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerVolume$11;->access$0(Lcom/melodix/music/PreviewPlayerVolume$11;)Lcom/melodix/music/PreviewPlayerVolume;

    move-result-object v0

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerVolume;->access$1(Lcom/melodix/music/PreviewPlayerVolume;)V

    return-void
.end method
