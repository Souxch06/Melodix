.class Lcom/melodix/music/PreviewPlayerVolume$8;
.super Ljava/lang/Object;
.source "PreviewPlayerVolume.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


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
    .line 184
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerVolume$8;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 184
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume$8;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerVolume;->access$20(Lcom/melodix/music/PreviewPlayerVolume;)Landroid/widget/SeekBar;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/SeekBar;->getProgress()I

    move-result v0

    if-lez v0, :cond_0

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerVolume$8;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-static {v2, v0}, Lcom/melodix/music/PreviewPlayerVolume;->access$16(Lcom/melodix/music/PreviewPlayerVolume;I)V

    :cond_0
    if-lez v0, :cond_1

    move v0, v1

    :goto_0
    if-gez v0, :cond_2

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume$8;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-virtual {v0}, Lcom/melodix/music/PreviewPlayerVolume;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v2, "Utilisez le curseur pour r\u00e9activer"

    invoke-static {v0, v2, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    :goto_1
    return-void

    :cond_1
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume$8;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerVolume;->access$21(Lcom/melodix/music/PreviewPlayerVolume;)I

    move-result v0

    goto :goto_0

    :cond_2
    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerVolume$8;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerVolume;->access$20(Lcom/melodix/music/PreviewPlayerVolume;)Landroid/widget/SeekBar;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/widget/SeekBar;->setProgress(I)V

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerVolume$8;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-static {v1, v0}, Lcom/melodix/music/PreviewPlayerVolume;->access$22(Lcom/melodix/music/PreviewPlayerVolume;I)V

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerVolume$8;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-static {v1, v0}, Lcom/melodix/music/PreviewPlayerVolume;->access$23(Lcom/melodix/music/PreviewPlayerVolume;I)V

    goto :goto_1
.end method
