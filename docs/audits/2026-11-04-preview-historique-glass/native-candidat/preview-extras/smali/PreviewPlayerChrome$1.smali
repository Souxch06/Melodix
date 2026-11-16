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
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 41
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerChrome$1;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 42
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome$1;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerChrome;->access$000(Lcom/melodix/music/PreviewPlayerChrome;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome$1;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewPlayerChrome;->access$102(Lcom/melodix/music/PreviewPlayerChrome;Z)Z

    return-void

    .line 43
    :cond_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome$1;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerChrome;->access$200(Lcom/melodix/music/PreviewPlayerChrome;)Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerChrome$1;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v2, v0}, Lcom/melodix/music/PreviewPlayerChrome;->access$300(Lcom/melodix/music/PreviewPlayerChrome;Landroid/app/Activity;)V

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerChrome$1;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v2, v0}, Lcom/melodix/music/PreviewPlayerChrome;->access$400(Lcom/melodix/music/PreviewPlayerChrome;Landroid/app/Activity;)V

    .line 44
    :cond_1
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome$1;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerChrome;->access$500(Lcom/melodix/music/PreviewPlayerChrome;)Lcom/melodix/music/PreviewPlayerDecoration;

    move-result-object v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome$1;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerChrome;->access$600(Lcom/melodix/music/PreviewPlayerChrome;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 45
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome$1;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerChrome;->access$500(Lcom/melodix/music/PreviewPlayerChrome;)Lcom/melodix/music/PreviewPlayerDecoration;

    move-result-object v0

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerChrome$1;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerChrome;->access$600(Lcom/melodix/music/PreviewPlayerChrome;)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    move-result v2

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerChrome$1;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v3}, Lcom/melodix/music/PreviewPlayerChrome;->access$600(Lcom/melodix/music/PreviewPlayerChrome;)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    move-result v3

    invoke-virtual {v0, v1, v1, v2, v3}, Lcom/melodix/music/PreviewPlayerDecoration;->setBounds(IIII)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome$1;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerChrome;->access$500(Lcom/melodix/music/PreviewPlayerChrome;)Lcom/melodix/music/PreviewPlayerDecoration;

    move-result-object v0

    invoke-virtual {v0}, Lcom/melodix/music/PreviewPlayerDecoration;->invalidateSelf()V

    .line 47
    :cond_2
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome$1;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerChrome;->access$700(Lcom/melodix/music/PreviewPlayerChrome;)Lcom/melodix/music/PreviewPlayerLikeArt;

    move-result-object v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome$1;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerChrome;->access$800(Lcom/melodix/music/PreviewPlayerChrome;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 48
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome$1;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerChrome;->access$700(Lcom/melodix/music/PreviewPlayerChrome;)Lcom/melodix/music/PreviewPlayerLikeArt;

    move-result-object v0

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerChrome$1;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerChrome;->access$800(Lcom/melodix/music/PreviewPlayerChrome;)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    move-result v2

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerChrome$1;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v3}, Lcom/melodix/music/PreviewPlayerChrome;->access$800(Lcom/melodix/music/PreviewPlayerChrome;)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    move-result v3

    invoke-virtual {v0, v1, v1, v2, v3}, Lcom/melodix/music/PreviewPlayerLikeArt;->setBounds(IIII)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome$1;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerChrome;->access$700(Lcom/melodix/music/PreviewPlayerChrome;)Lcom/melodix/music/PreviewPlayerLikeArt;

    move-result-object v0

    invoke-virtual {v0}, Lcom/melodix/music/PreviewPlayerLikeArt;->invalidateSelf()V

    .line 50
    :cond_3
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome$1;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerChrome;->access$900(Lcom/melodix/music/PreviewPlayerChrome;)Lcom/melodix/music/PreviewPlayerDecoration;

    move-result-object v0

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome$1;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerChrome;->access$1000(Lcom/melodix/music/PreviewPlayerChrome;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_8

    .line 51
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome$1;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerChrome;->access$1000(Lcom/melodix/music/PreviewPlayerChrome;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v0

    .line 52
    if-eqz v0, :cond_4

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v2, "Lecture al\u00e9atoire activ\u00e9e"

    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    const/4 v0, 0x1

    goto :goto_0

    :cond_4
    move v0, v1

    .line 53
    :goto_0
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerChrome$1;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerChrome;->access$1000(Lcom/melodix/music/PreviewPlayerChrome;)Landroid/view/View;

    move-result-object v2

    instance-of v2, v2, Landroid/widget/ImageView;

    if-eqz v2, :cond_7

    .line 54
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerChrome$1;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerChrome;->access$1000(Lcom/melodix/music/PreviewPlayerChrome;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    if-eqz v0, :cond_5

    const v3, -0x1fb762

    goto :goto_1

    :cond_5
    const v3, -0x363f16

    :goto_1
    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setColorFilter(I)V

    if-eqz v0, :cond_6

    const/16 v0, 0xff

    goto :goto_2

    :cond_6
    const/16 v0, 0xb3

    :goto_2
    invoke-virtual {v2, v0}, Landroid/widget/ImageView;->setImageAlpha(I)V

    .line 56
    :cond_7
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome$1;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerChrome;->access$900(Lcom/melodix/music/PreviewPlayerChrome;)Lcom/melodix/music/PreviewPlayerDecoration;

    move-result-object v0

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerChrome$1;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerChrome;->access$1000(Lcom/melodix/music/PreviewPlayerChrome;)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    move-result v2

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerChrome$1;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v3}, Lcom/melodix/music/PreviewPlayerChrome;->access$1000(Lcom/melodix/music/PreviewPlayerChrome;)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    move-result v3

    invoke-virtual {v0, v1, v1, v2, v3}, Lcom/melodix/music/PreviewPlayerDecoration;->setBounds(IIII)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome$1;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerChrome;->access$900(Lcom/melodix/music/PreviewPlayerChrome;)Lcom/melodix/music/PreviewPlayerDecoration;

    move-result-object v0

    invoke-virtual {v0}, Lcom/melodix/music/PreviewPlayerDecoration;->invalidateSelf()V

    .line 58
    :cond_8
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome$1;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    const-wide/16 v1, 0xfa

    invoke-virtual {v0, p0, v1, v2}, Lcom/melodix/music/PreviewPlayerChrome;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 59
    return-void
.end method
