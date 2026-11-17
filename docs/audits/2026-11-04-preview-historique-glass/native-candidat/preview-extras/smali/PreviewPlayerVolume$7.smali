.class Lcom/melodix/music/PreviewPlayerVolume$7;
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
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 134
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerVolume$7;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 134
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerVolume$7;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerVolume;->access$1800(Lcom/melodix/music/PreviewPlayerVolume;)Landroid/widget/SeekBar;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/SeekBar;->getProgress()I

    move-result p1

    if-lez p1, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume$7;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-static {v0, p1}, Lcom/melodix/music/PreviewPlayerVolume;->access$1402(Lcom/melodix/music/PreviewPlayerVolume;I)I

    :cond_0
    const/4 v0, 0x0

    if-lez p1, :cond_1

    move p1, v0

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerVolume$7;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerVolume;->access$1400(Lcom/melodix/music/PreviewPlayerVolume;)I

    move-result p1

    :goto_0
    if-gez p1, :cond_2

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerVolume$7;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-virtual {p1}, Lcom/melodix/music/PreviewPlayerVolume;->getContext()Landroid/content/Context;

    move-result-object p1

    const-string v1, "Utilisez le curseur pour r\u00e9activer"

    invoke-static {p1, v1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void

    :cond_2
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume$7;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerVolume;->access$1800(Lcom/melodix/music/PreviewPlayerVolume;)Landroid/widget/SeekBar;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/widget/SeekBar;->setProgress(I)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume$7;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-static {v0, p1}, Lcom/melodix/music/PreviewPlayerVolume;->access$1900(Lcom/melodix/music/PreviewPlayerVolume;I)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume$7;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-static {v0, p1}, Lcom/melodix/music/PreviewPlayerVolume;->access$2000(Lcom/melodix/music/PreviewPlayerVolume;I)V

    return-void
.end method
