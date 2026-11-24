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

    .line 299
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

    .line 299
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/melodix/music/PreviewPlayerTiles$11;->onReceiveValue(Ljava/lang/String;)V

    return-void
.end method

.method public onReceiveValue(Ljava/lang/String;)V
    .locals 7

    .line 300
    const-string v0, ""

    :try_start_0
    new-instance v1, Lorg/json/JSONTokener;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, p1}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Lorg/json/JSONTokener;->nextValue()Ljava/lang/Object;

    move-result-object p1

    instance-of v1, p1, Ljava/lang/String;

    if-eqz v1, :cond_0

    check-cast p1, Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, p1

    goto :goto_0

    :catch_0
    move-exception p1

    .line 301
    :cond_0
    :goto_0
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_1

    return-void

    .line 303
    :cond_1
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$11;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerTiles;->access$2600(Lcom/melodix/music/PreviewPlayerTiles;)Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$11;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerTiles;->access$2700(Lcom/melodix/music/PreviewPlayerTiles;)I

    move-result v1

    const/4 v2, 0x0

    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 304
    const/4 v3, -0x1

    move v4, v2

    :goto_1
    if-ge v4, p1, :cond_3

    if-gez v3, :cond_3

    add-int v5, v1, v4

    rem-int/2addr v5, p1

    iget-object v6, p0, Lcom/melodix/music/PreviewPlayerTiles$11;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v6}, Lcom/melodix/music/PreviewPlayerTiles;->access$2600(Lcom/melodix/music/PreviewPlayerTiles;)Ljava/util/ArrayList;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    invoke-virtual {v6}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v6

    invoke-interface {v6}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    move v3, v5

    :cond_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 305
    :cond_3
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$11;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {p1, v2}, Lcom/melodix/music/PreviewPlayerTiles;->access$2802(Lcom/melodix/music/PreviewPlayerTiles;I)I

    if-ltz v3, :cond_7

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$11;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerTiles;->access$2700(Lcom/melodix/music/PreviewPlayerTiles;)I

    move-result p1

    if-ne v3, p1, :cond_4

    goto :goto_3

    :cond_4
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$11;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$11;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$2700(Lcom/melodix/music/PreviewPlayerTiles;)I

    move-result v0

    invoke-static {p1, v0, v3}, Lcom/melodix/music/PreviewPlayerTiles;->access$2900(Lcom/melodix/music/PreviewPlayerTiles;II)V

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$11;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {p1, v3}, Lcom/melodix/music/PreviewPlayerTiles;->access$2702(Lcom/melodix/music/PreviewPlayerTiles;I)I

    .line 306
    move p1, v2

    :goto_2
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$11;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$2600(Lcom/melodix/music/PreviewPlayerTiles;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge p1, v0, :cond_5

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$11;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$2600(Lcom/melodix/music/PreviewPlayerTiles;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$11;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerTiles;->access$3000(Lcom/melodix/music/PreviewPlayerTiles;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    add-int/lit8 p1, p1, 0x1

    goto :goto_2

    .line 307
    :cond_5
    if-ltz v3, :cond_6

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$11;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerTiles;->access$3100(Lcom/melodix/music/PreviewPlayerTiles;)Landroid/widget/ScrollView;

    move-result-object p1

    if-eqz p1, :cond_6

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$11;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerTiles;->access$3100(Lcom/melodix/music/PreviewPlayerTiles;)Landroid/widget/ScrollView;

    move-result-object p1

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$11;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$2600(Lcom/melodix/music/PreviewPlayerTiles;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getTop()I

    move-result v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$11;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    const/high16 v3, 0x43200000    # 160.0f

    invoke-static {v1, v3}, Lcom/melodix/music/PreviewPlayerTiles;->access$900(Lcom/melodix/music/PreviewPlayerTiles;F)I

    move-result v1

    sub-int/2addr v0, v1

    invoke-static {v2, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    invoke-virtual {p1, v2, v0}, Landroid/widget/ScrollView;->smoothScrollTo(II)V

    .line 308
    :cond_6
    return-void

    .line 305
    :cond_7
    :goto_3
    return-void
.end method
