.class Lcom/melodix/music/PreviewPlayerTiles$18$1;
.super Ljava/lang/Object;
.source "PreviewPlayerTiles.java"

# interfaces
.implements Landroid/webkit/ValueCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerTiles$18;->run()V
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
.field final synthetic this$1:Lcom/melodix/music/PreviewPlayerTiles$18;


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerTiles$18;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 338
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$18$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$18;

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

    .line 338
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/melodix/music/PreviewPlayerTiles$18$1;->onReceiveValue(Ljava/lang/String;)V

    return-void
.end method

.method public onReceiveValue(Ljava/lang/String;)V
    .locals 7

    .line 339
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$18$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$18;

    iget-object v0, v0, Lcom/melodix/music/PreviewPlayerTiles$18;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$800(Lcom/melodix/music/PreviewPlayerTiles;)Lcom/melodix/music/PreviewPlayerSheet;

    move-result-object v0

    if-nez v0, :cond_6

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$18$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$18;

    iget-wide v0, v0, Lcom/melodix/music/PreviewPlayerTiles$18;->val$serial:J

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$18$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$18;

    iget v2, v2, Lcom/melodix/music/PreviewPlayerTiles$18;->val$i:I

    if-nez v2, :cond_0

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$18$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$18;

    iget-object v2, v2, Lcom/melodix/music/PreviewPlayerTiles$18;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerTiles;->access$1200(Lcom/melodix/music/PreviewPlayerTiles;)J

    move-result-wide v2

    goto :goto_0

    :cond_0
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$18$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$18;

    iget-object v2, v2, Lcom/melodix/music/PreviewPlayerTiles$18;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerTiles;->access$2800(Lcom/melodix/music/PreviewPlayerTiles;)J

    move-result-wide v2

    :goto_0
    cmp-long v0, v0, v2

    if-eqz v0, :cond_1

    goto/16 :goto_3

    .line 340
    :cond_1
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$18$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$18;

    iget-object v0, v0, Lcom/melodix/music/PreviewPlayerTiles$18;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v0, p1}, Lcom/melodix/music/PreviewPlayerTiles;->access$1600(Lcom/melodix/music/PreviewPlayerTiles;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    .line 341
    if-eqz p1, :cond_5

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$18$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$18;

    iget-object v0, v0, Lcom/melodix/music/PreviewPlayerTiles$18;->val$id:Ljava/lang/String;

    const-string v1, "id"

    const-string v2, ""

    invoke-virtual {p1, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    goto/16 :goto_2

    .line 342
    :cond_2
    const-string v0, "status"

    invoke-virtual {p1, v0, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "done"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$18$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$18;

    iget-object v0, p1, Lcom/melodix/music/PreviewPlayerTiles$18;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$18$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$18;

    iget v1, p1, Lcom/melodix/music/PreviewPlayerTiles$18;->val$i:I

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$18$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$18;

    iget-object v2, p1, Lcom/melodix/music/PreviewPlayerTiles$18;->val$a:Landroid/app/Activity;

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$18$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$18;

    iget-wide v3, p1, Lcom/melodix/music/PreviewPlayerTiles$18;->val$serial:J

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$18$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$18;

    iget-object v5, p1, Lcom/melodix/music/PreviewPlayerTiles$18;->val$id:Ljava/lang/String;

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$18$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$18;

    iget p1, p1, Lcom/melodix/music/PreviewPlayerTiles$18;->val$attempt:I

    add-int/lit8 v6, p1, 0x1

    invoke-static/range {v0 .. v6}, Lcom/melodix/music/PreviewPlayerTiles;->access$3900(Lcom/melodix/music/PreviewPlayerTiles;ILandroid/app/Activity;JLjava/lang/String;I)V

    return-void

    .line 343
    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "ferme:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerTiles;->access$4000(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "journal"

    invoke-virtual {p1, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerTiles;->access$4100(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, ":rendu=non"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 344
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$18$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$18;

    iget v0, v0, Lcom/melodix/music/PreviewPlayerTiles$18;->val$i:I

    const/4 v1, 0x0

    if-nez v0, :cond_4

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerTiles;->access$1402(Ljava/lang/String;)Ljava/lang/String;

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$18$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$18;

    iget-object p1, p1, Lcom/melodix/music/PreviewPlayerTiles$18;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {p1, v1}, Lcom/melodix/music/PreviewPlayerTiles;->access$1902(Lcom/melodix/music/PreviewPlayerTiles;Z)Z

    goto :goto_1

    :cond_4
    invoke-static {}, Lcom/melodix/music/PreviewPlayerTiles;->access$3000()[Ljava/lang/String;

    move-result-object v0

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$18$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$18;

    iget v2, v2, Lcom/melodix/music/PreviewPlayerTiles$18;->val$i:I

    add-int/lit8 v2, v2, -0x1

    aput-object p1, v0, v2

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$18$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$18;

    iget-object p1, p1, Lcom/melodix/music/PreviewPlayerTiles$18;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {p1, v1}, Lcom/melodix/music/PreviewPlayerTiles;->access$3402(Lcom/melodix/music/PreviewPlayerTiles;Z)Z

    .line 345
    :goto_1
    return-void

    .line 341
    :cond_5
    :goto_2
    return-void

    .line 339
    :cond_6
    :goto_3
    return-void
.end method
