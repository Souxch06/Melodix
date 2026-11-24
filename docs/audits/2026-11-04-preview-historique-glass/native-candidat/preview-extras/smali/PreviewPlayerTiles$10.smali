.class Lcom/melodix/music/PreviewPlayerTiles$10;
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

    .line 276
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$10;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

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

    .line 276
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/melodix/music/PreviewPlayerTiles$10;->onReceiveValue(Ljava/lang/String;)V

    return-void
.end method

.method public onReceiveValue(Ljava/lang/String;)V
    .locals 8

    .line 278
    const/4 v0, 0x1

    const/4 v1, -0x2

    const/4 v2, 0x0

    :try_start_0
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const-string v3, "\""

    const-string v4, ""

    invoke-virtual {p1, v3, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    const-string v3, "\\|"

    invoke-virtual {p1, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    aget-object v3, p1, v2

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1

    :try_start_1
    aget-object p1, p1, v0

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    goto :goto_0

    :catch_1
    move-exception p1

    move v3, v1

    :goto_0
    sget p1, Lcom/melodix/music/PreviewPlayerTiles;->liveErrors:I

    add-int/2addr p1, v0

    sput p1, Lcom/melodix/music/PreviewPlayerTiles;->liveErrors:I

    move p1, v2

    .line 279
    :goto_1
    sget v4, Lcom/melodix/music/PreviewPlayerTiles;->liveReads:I

    add-int/2addr v4, v0

    sput v4, Lcom/melodix/music/PreviewPlayerTiles;->liveReads:I

    sput v3, Lcom/melodix/music/PreviewPlayerTiles;->liveLastIndex:I

    .line 282
    if-lez p1, :cond_0

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerTiles$10;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v4}, Lcom/melodix/music/PreviewPlayerTiles;->access$2500(Lcom/melodix/music/PreviewPlayerTiles;)Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-eq p1, v4, :cond_0

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$10;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerTiles;->access$2600(Lcom/melodix/music/PreviewPlayerTiles;)Ljava/lang/Runnable;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v4

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$10;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerTiles;->access$2700(Lcom/melodix/music/PreviewPlayerTiles;)J

    move-result-wide v6

    sub-long/2addr v4, v6

    const-wide/16 v6, 0xbb8

    cmp-long p1, v4, v6

    if-lez p1, :cond_0

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$10;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    invoke-static {p1, v0, v1}, Lcom/melodix/music/PreviewPlayerTiles;->access$2702(Lcom/melodix/music/PreviewPlayerTiles;J)J

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$10;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$10;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$2600(Lcom/melodix/music/PreviewPlayerTiles;)Ljava/lang/Runnable;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/melodix/music/PreviewPlayerTiles;->post(Ljava/lang/Runnable;)Z

    return-void

    .line 283
    :cond_0
    if-ne v3, v1, :cond_2

    sget p1, Lcom/melodix/music/PreviewPlayerTiles;->liveNoLine:I

    add-int/2addr p1, v0

    sput p1, Lcom/melodix/music/PreviewPlayerTiles;->liveNoLine:I

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$10;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerTiles;->access$2804(Lcom/melodix/music/PreviewPlayerTiles;)I

    move-result p1

    const/4 v0, 0x5

    if-ne p1, v0, :cond_1

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$10;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerTiles;->access$2600(Lcom/melodix/music/PreviewPlayerTiles;)Ljava/lang/Runnable;

    move-result-object p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$10;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {p1, v2}, Lcom/melodix/music/PreviewPlayerTiles;->access$2802(Lcom/melodix/music/PreviewPlayerTiles;I)I

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$10;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$10;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$2600(Lcom/melodix/music/PreviewPlayerTiles;)Ljava/lang/Runnable;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/melodix/music/PreviewPlayerTiles;->post(Ljava/lang/Runnable;)Z

    :cond_1
    return-void

    .line 284
    :cond_2
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$10;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {p1, v2}, Lcom/melodix/music/PreviewPlayerTiles;->access$2802(Lcom/melodix/music/PreviewPlayerTiles;I)I

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$10;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerTiles;->access$2900(Lcom/melodix/music/PreviewPlayerTiles;)I

    move-result p1

    if-eq v3, p1, :cond_7

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$10;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerTiles;->access$2500(Lcom/melodix/music/PreviewPlayerTiles;)Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-lt v3, p1, :cond_3

    goto :goto_4

    :cond_3
    sget p1, Lcom/melodix/music/PreviewPlayerTiles;->liveChanges:I

    add-int/2addr p1, v0

    sput p1, Lcom/melodix/music/PreviewPlayerTiles;->liveChanges:I

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$10;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$10;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$2900(Lcom/melodix/music/PreviewPlayerTiles;)I

    move-result v0

    invoke-static {p1, v0, v3}, Lcom/melodix/music/PreviewPlayerTiles;->access$3000(Lcom/melodix/music/PreviewPlayerTiles;II)V

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$10;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {p1, v3}, Lcom/melodix/music/PreviewPlayerTiles;->access$2902(Lcom/melodix/music/PreviewPlayerTiles;I)I

    .line 285
    move p1, v2

    :goto_2
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$10;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$2500(Lcom/melodix/music/PreviewPlayerTiles;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge p1, v0, :cond_5

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$10;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$2500(Lcom/melodix/music/PreviewPlayerTiles;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    if-ne p1, v3, :cond_4

    const/4 v1, -0x1

    goto :goto_3

    :cond_4
    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$10;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerTiles;->access$3100(Lcom/melodix/music/PreviewPlayerTiles;)I

    move-result v1

    :goto_3
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    add-int/lit8 p1, p1, 0x1

    goto :goto_2

    .line 286
    :cond_5
    if-ltz v3, :cond_6

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$10;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerTiles;->access$3200(Lcom/melodix/music/PreviewPlayerTiles;)Landroid/widget/ScrollView;

    move-result-object p1

    if-eqz p1, :cond_6

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$10;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerTiles;->access$3200(Lcom/melodix/music/PreviewPlayerTiles;)Landroid/widget/ScrollView;

    move-result-object p1

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$10;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$2500(Lcom/melodix/music/PreviewPlayerTiles;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getTop()I

    move-result v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$10;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    const/high16 v3, 0x43200000    # 160.0f

    invoke-static {v1, v3}, Lcom/melodix/music/PreviewPlayerTiles;->access$900(Lcom/melodix/music/PreviewPlayerTiles;F)I

    move-result v1

    sub-int/2addr v0, v1

    invoke-static {v2, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    invoke-virtual {p1, v2, v0}, Landroid/widget/ScrollView;->smoothScrollTo(II)V

    .line 287
    :cond_6
    return-void

    .line 284
    :cond_7
    :goto_4
    return-void
.end method
