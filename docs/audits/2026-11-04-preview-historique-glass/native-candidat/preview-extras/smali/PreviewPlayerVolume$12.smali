.class Lcom/melodix/music/PreviewPlayerVolume$12;
.super Ljava/lang/Object;
.source "PreviewPlayerVolume.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerVolume;->onVisibilityChanged(Landroid/view/View;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/melodix/music/PreviewPlayerVolume;


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerVolume;)V
    .locals 0

    .prologue
    .line 154
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerVolume$12;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 154
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume$12;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerVolume;->access$29(Lcom/melodix/music/PreviewPlayerVolume;)V

    return-void
.end method
