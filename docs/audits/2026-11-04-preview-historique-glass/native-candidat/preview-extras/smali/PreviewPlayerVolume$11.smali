.class Lcom/melodix/music/PreviewPlayerVolume$11;
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
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 138
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerVolume$11;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 3

    .line 138
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerVolume$11;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/melodix/music/PreviewPlayerVolume;->access$2202(Lcom/melodix/music/PreviewPlayerVolume;Landroid/app/Dialog;)Landroid/app/Dialog;

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerVolume$11;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    const/4 v1, 0x0

    invoke-static {p1, v1}, Lcom/melodix/music/PreviewPlayerVolume;->access$2102(Lcom/melodix/music/PreviewPlayerVolume;Z)Z

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerVolume$11;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-static {p1, v0}, Lcom/melodix/music/PreviewPlayerVolume;->access$1802(Lcom/melodix/music/PreviewPlayerVolume;Landroid/widget/SeekBar;)Landroid/widget/SeekBar;

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerVolume$11;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-static {p1, v0}, Lcom/melodix/music/PreviewPlayerVolume;->access$2302(Lcom/melodix/music/PreviewPlayerVolume;Landroid/widget/TextView;)Landroid/widget/TextView;

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerVolume$11;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-static {p1, v0}, Lcom/melodix/music/PreviewPlayerVolume;->access$2402(Lcom/melodix/music/PreviewPlayerVolume;Landroid/widget/Button;)Landroid/widget/Button;

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerVolume$11;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerVolume;->access$000(Lcom/melodix/music/PreviewPlayerVolume;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerVolume$11;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerVolume;->access$200(Lcom/melodix/music/PreviewPlayerVolume;)Landroid/os/Handler;

    move-result-object p1

    new-instance v0, Lcom/melodix/music/PreviewPlayerVolume$11$1;

    invoke-direct {v0, p0}, Lcom/melodix/music/PreviewPlayerVolume$11$1;-><init>(Lcom/melodix/music/PreviewPlayerVolume$11;)V

    const-wide/16 v1, 0x15e

    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_0
    return-void
.end method
