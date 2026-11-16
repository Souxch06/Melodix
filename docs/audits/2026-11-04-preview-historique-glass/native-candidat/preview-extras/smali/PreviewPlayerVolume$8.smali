.class Lcom/melodix/music/PreviewPlayerVolume$8;
.super Ljava/lang/Object;
.source "PreviewPlayerVolume.java"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


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
    .line 123
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerVolume$8;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 1

    .prologue
    .line 123
    if-eqz p3, :cond_1

    if-lez p2, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume$8;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-static {v0, p2}, Lcom/melodix/music/PreviewPlayerVolume;->access$15(Lcom/melodix/music/PreviewPlayerVolume;I)V

    :cond_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume$8;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-static {v0, p2}, Lcom/melodix/music/PreviewPlayerVolume;->access$20(Lcom/melodix/music/PreviewPlayerVolume;I)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume$8;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-static {v0, p2}, Lcom/melodix/music/PreviewPlayerVolume;->access$21(Lcom/melodix/music/PreviewPlayerVolume;I)V

    :cond_1
    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 2

    .prologue
    .line 123
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume$8;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewPlayerVolume;->access$22(Lcom/melodix/music/PreviewPlayerVolume;Z)V

    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 2

    .prologue
    .line 123
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume$8;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewPlayerVolume;->access$22(Lcom/melodix/music/PreviewPlayerVolume;Z)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume$8;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-virtual {p1}, Landroid/widget/SeekBar;->getProgress()I

    move-result v1

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewPlayerVolume;->access$21(Lcom/melodix/music/PreviewPlayerVolume;I)V

    return-void
.end method
