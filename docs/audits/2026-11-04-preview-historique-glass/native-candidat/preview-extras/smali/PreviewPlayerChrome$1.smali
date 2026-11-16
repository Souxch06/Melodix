.class Lcom/melodix/music/PreviewPlayerChrome$1;
.super Ljava/lang/Object;
.source "PreviewPlayerChrome.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/melodix/music/PreviewPlayerChrome;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/melodix/music/PreviewPlayerChrome;


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerChrome;)V
    .locals 0

    .prologue
    .line 33
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerChrome$1;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 34
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome$1;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerChrome;->access$0(Lcom/melodix/music/PreviewPlayerChrome;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome$1;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v0, v3}, Lcom/melodix/music/PreviewPlayerChrome;->access$1(Lcom/melodix/music/PreviewPlayerChrome;Z)V

    .line 42
    :goto_0
    return-void

    .line 35
    :cond_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome$1;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerChrome;->access$2(Lcom/melodix/music/PreviewPlayerChrome;)Lcom/melodix/music/PreviewPlayerDecoration;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome$1;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerChrome;->access$3(Lcom/melodix/music/PreviewPlayerChrome;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 36
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome$1;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerChrome;->access$2(Lcom/melodix/music/PreviewPlayerChrome;)Lcom/melodix/music/PreviewPlayerDecoration;

    move-result-object v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome$1;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerChrome;->access$3(Lcom/melodix/music/PreviewPlayerChrome;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v1

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerChrome$1;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerChrome;->access$3(Lcom/melodix/music/PreviewPlayerChrome;)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    move-result v2

    invoke-virtual {v0, v3, v3, v1, v2}, Lcom/melodix/music/PreviewPlayerDecoration;->setBounds(IIII)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome$1;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerChrome;->access$2(Lcom/melodix/music/PreviewPlayerChrome;)Lcom/melodix/music/PreviewPlayerDecoration;

    move-result-object v0

    invoke-virtual {v0}, Lcom/melodix/music/PreviewPlayerDecoration;->invalidateSelf()V

    .line 38
    :cond_1
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome$1;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerChrome;->access$4(Lcom/melodix/music/PreviewPlayerChrome;)Lcom/melodix/music/PreviewPlayerDecoration;

    move-result-object v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome$1;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerChrome;->access$5(Lcom/melodix/music/PreviewPlayerChrome;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 39
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome$1;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerChrome;->access$4(Lcom/melodix/music/PreviewPlayerChrome;)Lcom/melodix/music/PreviewPlayerDecoration;

    move-result-object v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome$1;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerChrome;->access$5(Lcom/melodix/music/PreviewPlayerChrome;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v1

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerChrome$1;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerChrome;->access$5(Lcom/melodix/music/PreviewPlayerChrome;)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    move-result v2

    invoke-virtual {v0, v3, v3, v1, v2}, Lcom/melodix/music/PreviewPlayerDecoration;->setBounds(IIII)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome$1;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerChrome;->access$4(Lcom/melodix/music/PreviewPlayerChrome;)Lcom/melodix/music/PreviewPlayerDecoration;

    move-result-object v0

    invoke-virtual {v0}, Lcom/melodix/music/PreviewPlayerDecoration;->invalidateSelf()V

    .line 41
    :cond_2
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome$1;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    const-wide/16 v2, 0xfa

    invoke-virtual {v0, p0, v2, v3}, Lcom/melodix/music/PreviewPlayerChrome;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0
.end method
