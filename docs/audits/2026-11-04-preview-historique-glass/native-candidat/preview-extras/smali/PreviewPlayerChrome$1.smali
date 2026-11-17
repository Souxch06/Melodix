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
    .line 44
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerChrome$1;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    const/4 v2, 0x0

    .line 45
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome$1;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerChrome;->access$0(Lcom/melodix/music/PreviewPlayerChrome;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome$1;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v0, v2}, Lcom/melodix/music/PreviewPlayerChrome;->access$1(Lcom/melodix/music/PreviewPlayerChrome;Z)V

    .line 63
    :goto_0
    return-void

    .line 46
    :cond_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome$1;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerChrome;->access$2(Lcom/melodix/music/PreviewPlayerChrome;)Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome$1;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v1, v0}, Lcom/melodix/music/PreviewPlayerChrome;->access$3(Lcom/melodix/music/PreviewPlayerChrome;Landroid/app/Activity;)V

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome$1;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v1, v0}, Lcom/melodix/music/PreviewPlayerChrome;->access$4(Lcom/melodix/music/PreviewPlayerChrome;Landroid/app/Activity;)V

    .line 47
    :cond_1
    invoke-static {}, Lcom/melodix/music/PreviewPlayerChrome;->report()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/melodix/music/PreviewPlayerTiles;->displayReport:Ljava/lang/String;

    .line 48
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome$1;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerChrome;->access$5(Lcom/melodix/music/PreviewPlayerChrome;)Lcom/melodix/music/PreviewPlayerDecoration;

    move-result-object v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome$1;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerChrome;->access$6(Lcom/melodix/music/PreviewPlayerChrome;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 49
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome$1;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerChrome;->access$5(Lcom/melodix/music/PreviewPlayerChrome;)Lcom/melodix/music/PreviewPlayerDecoration;

    move-result-object v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome$1;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerChrome;->access$6(Lcom/melodix/music/PreviewPlayerChrome;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v1

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerChrome$1;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v3}, Lcom/melodix/music/PreviewPlayerChrome;->access$6(Lcom/melodix/music/PreviewPlayerChrome;)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    move-result v3

    invoke-virtual {v0, v2, v2, v1, v3}, Lcom/melodix/music/PreviewPlayerDecoration;->setBounds(IIII)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome$1;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerChrome;->access$5(Lcom/melodix/music/PreviewPlayerChrome;)Lcom/melodix/music/PreviewPlayerDecoration;

    move-result-object v0

    invoke-virtual {v0}, Lcom/melodix/music/PreviewPlayerDecoration;->invalidateSelf()V

    .line 51
    :cond_2
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome$1;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerChrome;->access$7(Lcom/melodix/music/PreviewPlayerChrome;)Lcom/melodix/music/PreviewPlayerLikeArt;

    move-result-object v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome$1;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerChrome;->access$8(Lcom/melodix/music/PreviewPlayerChrome;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 52
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome$1;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerChrome;->access$7(Lcom/melodix/music/PreviewPlayerChrome;)Lcom/melodix/music/PreviewPlayerLikeArt;

    move-result-object v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome$1;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerChrome;->access$8(Lcom/melodix/music/PreviewPlayerChrome;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v1

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerChrome$1;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v3}, Lcom/melodix/music/PreviewPlayerChrome;->access$8(Lcom/melodix/music/PreviewPlayerChrome;)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    move-result v3

    invoke-virtual {v0, v2, v2, v1, v3}, Lcom/melodix/music/PreviewPlayerLikeArt;->setBounds(IIII)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome$1;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerChrome;->access$7(Lcom/melodix/music/PreviewPlayerChrome;)Lcom/melodix/music/PreviewPlayerLikeArt;

    move-result-object v0

    invoke-virtual {v0}, Lcom/melodix/music/PreviewPlayerLikeArt;->invalidateSelf()V

    .line 54
    :cond_3
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome$1;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerChrome;->access$9(Lcom/melodix/music/PreviewPlayerChrome;)Lcom/melodix/music/PreviewPlayerDecoration;

    move-result-object v0

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome$1;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerChrome;->access$10(Lcom/melodix/music/PreviewPlayerChrome;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_5

    .line 55
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome$1;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerChrome;->access$10(Lcom/melodix/music/PreviewPlayerChrome;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v0

    .line 56
    if-eqz v0, :cond_6

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Lecture al\u00e9atoire activ\u00e9e"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    move v1, v0

    .line 57
    :goto_1
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome$1;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerChrome;->access$10(Lcom/melodix/music/PreviewPlayerChrome;)Landroid/view/View;

    move-result-object v0

    instance-of v0, v0, Landroid/widget/ImageView;

    if-eqz v0, :cond_4

    .line 58
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome$1;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerChrome;->access$10(Lcom/melodix/music/PreviewPlayerChrome;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    if-eqz v1, :cond_7

    const v3, -0x1fb762

    :goto_2
    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setColorFilter(I)V

    if-eqz v1, :cond_8

    const/16 v1, 0xff

    :goto_3
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageAlpha(I)V

    .line 60
    :cond_4
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome$1;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerChrome;->access$9(Lcom/melodix/music/PreviewPlayerChrome;)Lcom/melodix/music/PreviewPlayerDecoration;

    move-result-object v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome$1;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerChrome;->access$10(Lcom/melodix/music/PreviewPlayerChrome;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v1

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerChrome$1;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v3}, Lcom/melodix/music/PreviewPlayerChrome;->access$10(Lcom/melodix/music/PreviewPlayerChrome;)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    move-result v3

    invoke-virtual {v0, v2, v2, v1, v3}, Lcom/melodix/music/PreviewPlayerDecoration;->setBounds(IIII)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome$1;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerChrome;->access$9(Lcom/melodix/music/PreviewPlayerChrome;)Lcom/melodix/music/PreviewPlayerDecoration;

    move-result-object v0

    invoke-virtual {v0}, Lcom/melodix/music/PreviewPlayerDecoration;->invalidateSelf()V

    .line 62
    :cond_5
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome$1;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    const-wide/16 v2, 0xfa

    invoke-virtual {v0, p0, v2, v3}, Lcom/melodix/music/PreviewPlayerChrome;->postDelayed(Ljava/lang/Runnable;J)Z

    goto/16 :goto_0

    :cond_6
    move v1, v2

    .line 56
    goto :goto_1

    .line 58
    :cond_7
    const v3, -0x363f16

    goto :goto_2

    :cond_8
    const/16 v1, 0xb3

    goto :goto_3
.end method
