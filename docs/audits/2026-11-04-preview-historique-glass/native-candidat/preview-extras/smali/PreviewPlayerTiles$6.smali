.class Lcom/melodix/music/PreviewPlayerTiles$6;
.super Ljava/lang/Object;
.source "PreviewPlayerTiles.java"

# interfaces
.implements Landroid/webkit/ValueCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerTiles;->activate(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/webkit/ValueCallback",
        "<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/melodix/music/PreviewPlayerTiles;

.field private final synthetic val$g:J

.field private final synthetic val$i:I


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerTiles;JI)V
    .locals 0

    .prologue
    .line 121
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$6;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iput-wide p2, p0, Lcom/melodix/music/PreviewPlayerTiles$6;->val$g:J

    iput p4, p0, Lcom/melodix/music/PreviewPlayerTiles$6;->val$i:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onReceiveValue(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/melodix/music/PreviewPlayerTiles$6;->onReceiveValue(Ljava/lang/String;)V

    return-void
.end method

.method public onReceiveValue(Ljava/lang/String;)V
    .locals 7
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x0

    .line 122
    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerTiles$6;->val$g:J

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$6;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerTiles;->access$5(Lcom/melodix/music/PreviewPlayerTiles;)J

    move-result-wide v4

    cmp-long v1, v2, v4

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$6;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerTiles;->access$13(Lcom/melodix/music/PreviewPlayerTiles;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$6;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerTiles;->access$0(Lcom/melodix/music/PreviewPlayerTiles;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$6;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-virtual {v1}, Lcom/melodix/music/PreviewPlayerTiles;->isShown()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$6;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-virtual {v1}, Lcom/melodix/music/PreviewPlayerTiles;->getWindowVisibility()I

    move-result v1

    if-eqz v1, :cond_1

    .line 126
    :cond_0
    :goto_0
    return-void

    .line 123
    :cond_1
    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$6;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v1, v6}, Lcom/melodix/music/PreviewPlayerTiles;->access$14(Lcom/melodix/music/PreviewPlayerTiles;Z)V

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$6;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v1, p1}, Lcom/melodix/music/PreviewPlayerTiles;->access$8(Lcom/melodix/music/PreviewPlayerTiles;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 124
    .local v0, "result":Lorg/json/JSONObject;
    if-eqz v0, :cond_2

    const-string v1, "sent"

    invoke-virtual {v0, v1, v6}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$6;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerTiles;->access$17(Lcom/melodix/music/PreviewPlayerTiles;)V

    goto :goto_0

    .line 125
    :cond_2
    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$6;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerTiles;->access$9(Lcom/melodix/music/PreviewPlayerTiles;)[Ljava/lang/String;

    move-result-object v1

    iget v2, p0, Lcom/melodix/music/PreviewPlayerTiles$6;->val$i:I

    const-string v3, "unknown"

    aput-object v3, v1, v2

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$6;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerTiles;->access$11(Lcom/melodix/music/PreviewPlayerTiles;)[Ljava/lang/String;

    move-result-object v2

    iget v3, p0, Lcom/melodix/music/PreviewPlayerTiles$6;->val$i:I

    if-nez v0, :cond_3

    const-string v1, "command"

    :goto_1
    aput-object v1, v2, v3

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$6;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerTiles;->access$3(Lcom/melodix/music/PreviewPlayerTiles;)V

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$6;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    const-string v2, "Ouverture indisponible. R\u00e9essayer"

    invoke-static {v1, v2}, Lcom/melodix/music/PreviewPlayerTiles;->access$16(Lcom/melodix/music/PreviewPlayerTiles;Ljava/lang/String;)V

    goto :goto_0

    :cond_3
    const-string v1, "reason"

    const-string v4, "command"

    invoke-virtual {v0, v1, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_1
.end method
