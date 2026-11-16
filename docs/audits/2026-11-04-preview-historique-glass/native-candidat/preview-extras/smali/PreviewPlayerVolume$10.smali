.class Lcom/melodix/music/PreviewPlayerVolume$10;
.super Ljava/lang/Object;
.source "PreviewPlayerVolume.java"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerVolume;->open()V
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
    .line 74
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerVolume$10;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/melodix/music/PreviewPlayerVolume$10;)Lcom/melodix/music/PreviewPlayerVolume;
    .locals 1

    .prologue
    .line 74
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume$10;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    return-object v0
.end method


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 4

    .prologue
    const/4 v2, 0x0

    .line 74
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume$10;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-static {v0, v2}, Lcom/melodix/music/PreviewPlayerVolume;->access$20(Lcom/melodix/music/PreviewPlayerVolume;Landroid/app/Dialog;)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume$10;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewPlayerVolume;->access$19(Lcom/melodix/music/PreviewPlayerVolume;Z)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume$10;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-static {v0, v2}, Lcom/melodix/music/PreviewPlayerVolume;->access$21(Lcom/melodix/music/PreviewPlayerVolume;Landroid/widget/SeekBar;)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume$10;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-static {v0, v2}, Lcom/melodix/music/PreviewPlayerVolume;->access$22(Lcom/melodix/music/PreviewPlayerVolume;Landroid/widget/TextView;)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume$10;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-static {v0, v2}, Lcom/melodix/music/PreviewPlayerVolume;->access$23(Lcom/melodix/music/PreviewPlayerVolume;Landroid/widget/Button;)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume$10;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerVolume;->access$0(Lcom/melodix/music/PreviewPlayerVolume;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume$10;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerVolume;->access$2(Lcom/melodix/music/PreviewPlayerVolume;)Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/melodix/music/PreviewPlayerVolume$10$1;

    invoke-direct {v1, p0}, Lcom/melodix/music/PreviewPlayerVolume$10$1;-><init>(Lcom/melodix/music/PreviewPlayerVolume$10;)V

    const-wide/16 v2, 0x15e

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_0
    return-void
.end method
