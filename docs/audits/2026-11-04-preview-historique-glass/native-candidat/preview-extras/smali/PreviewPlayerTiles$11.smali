.class Lcom/melodix/music/PreviewPlayerTiles$11;
.super Ljava/lang/Object;
.source "PreviewPlayerTiles.java"

# interfaces
.implements Landroid/webkit/ValueCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerTiles;->lyricsTick(Landroid/app/Activity;Landroid/app/Dialog;Landroid/view/View;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/webkit/ValueCallback<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/melodix/music/PreviewPlayerTiles;


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerTiles;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 291
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$11;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onReceiveValue(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            null
        }
    .end annotation

    .line 291
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/melodix/music/PreviewPlayerTiles$11;->onReceiveValue(Ljava/lang/String;)V

    return-void
.end method

.method public onReceiveValue(Ljava/lang/String;)V
    .locals 4

    .line 292
    const/4 v0, -0x2

    :try_start_0
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    move p1, v0

    .line 293
    :goto_0
    const/4 v1, 0x0

    if-ne p1, v0, :cond_1

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$11;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerTiles;->access$2604(Lcom/melodix/music/PreviewPlayerTiles;)I

    move-result p1

    const/4 v0, 0x5

    if-ne p1, v0, :cond_0

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$11;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerTiles;->access$2700(Lcom/melodix/music/PreviewPlayerTiles;)Ljava/lang/Runnable;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$11;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {p1, v1}, Lcom/melodix/music/PreviewPlayerTiles;->access$2602(Lcom/melodix/music/PreviewPlayerTiles;I)I

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$11;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$11;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$2700(Lcom/melodix/music/PreviewPlayerTiles;)Ljava/lang/Runnable;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/melodix/music/PreviewPlayerTiles;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void

    .line 294
    :cond_1
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$11;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewPlayerTiles;->access$2602(Lcom/melodix/music/PreviewPlayerTiles;I)I

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$11;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$2800(Lcom/melodix/music/PreviewPlayerTiles;)I

    move-result v0

    if-eq p1, v0, :cond_5

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$11;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$2900(Lcom/melodix/music/PreviewPlayerTiles;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lt p1, v0, :cond_2

    goto :goto_2

    :cond_2
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$11;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$11;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerTiles;->access$2800(Lcom/melodix/music/PreviewPlayerTiles;)I

    move-result v2

    invoke-static {v0, v2, p1}, Lcom/melodix/music/PreviewPlayerTiles;->access$3000(Lcom/melodix/music/PreviewPlayerTiles;II)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$11;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v0, p1}, Lcom/melodix/music/PreviewPlayerTiles;->access$2802(Lcom/melodix/music/PreviewPlayerTiles;I)I

    .line 295
    move v0, v1

    :goto_1
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$11;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerTiles;->access$2900(Lcom/melodix/music/PreviewPlayerTiles;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_3

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$11;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerTiles;->access$2900(Lcom/melodix/music/PreviewPlayerTiles;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerTiles$11;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v3}, Lcom/melodix/music/PreviewPlayerTiles;->access$3100(Lcom/melodix/music/PreviewPlayerTiles;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 296
    :cond_3
    if-ltz p1, :cond_4

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$11;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$3200(Lcom/melodix/music/PreviewPlayerTiles;)Landroid/widget/ScrollView;

    move-result-object v0

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$11;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$3200(Lcom/melodix/music/PreviewPlayerTiles;)Landroid/widget/ScrollView;

    move-result-object v0

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$11;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerTiles;->access$2900(Lcom/melodix/music/PreviewPlayerTiles;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/widget/TextView;->getTop()I

    move-result p1

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$11;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    const/high16 v3, 0x43200000    # 160.0f

    invoke-static {v2, v3}, Lcom/melodix/music/PreviewPlayerTiles;->access$900(Lcom/melodix/music/PreviewPlayerTiles;F)I

    move-result v2

    sub-int/2addr p1, v2

    invoke-static {v1, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    invoke-virtual {v0, v1, p1}, Landroid/widget/ScrollView;->smoothScrollTo(II)V

    .line 297
    :cond_4
    return-void

    .line 294
    :cond_5
    :goto_2
    return-void
.end method
