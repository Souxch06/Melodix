.class Lcom/melodix/music/PreviewPlayerVolume$9;
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
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 135
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerVolume$9;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 0

    .line 135
    if-eqz p3, :cond_1

    if-lez p2, :cond_0

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerVolume$9;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-static {p1, p2}, Lcom/melodix/music/PreviewPlayerVolume;->access$1702(Lcom/melodix/music/PreviewPlayerVolume;I)I

    :cond_0
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerVolume$9;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-static {p1, p2}, Lcom/melodix/music/PreviewPlayerVolume;->access$2200(Lcom/melodix/music/PreviewPlayerVolume;I)V

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerVolume$9;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-static {p1, p2}, Lcom/melodix/music/PreviewPlayerVolume;->access$2300(Lcom/melodix/music/PreviewPlayerVolume;I)V

    :cond_1
    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 1

    .line 135
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerVolume$9;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    const/4 v0, 0x1

    invoke-static {p1, v0}, Lcom/melodix/music/PreviewPlayerVolume;->access$2402(Lcom/melodix/music/PreviewPlayerVolume;Z)Z

    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 2

    .line 135
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume$9;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewPlayerVolume;->access$2402(Lcom/melodix/music/PreviewPlayerVolume;Z)Z

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume$9;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-virtual {p1}, Landroid/widget/SeekBar;->getProgress()I

    move-result p1

    invoke-static {v0, p1}, Lcom/melodix/music/PreviewPlayerVolume;->access$2300(Lcom/melodix/music/PreviewPlayerVolume;I)V

    return-void
.end method
