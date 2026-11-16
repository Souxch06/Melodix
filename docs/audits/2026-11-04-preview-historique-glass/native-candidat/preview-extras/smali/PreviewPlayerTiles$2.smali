.class Lcom/melodix/music/PreviewPlayerTiles$2;
.super Ljava/lang/Object;
.source "PreviewPlayerTiles.java"

# interfaces
.implements Landroid/webkit/ValueCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerTiles;->probe()V
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

.field private final synthetic val$seq:J


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerTiles;JJ)V
    .locals 0

    .prologue
    .line 87
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$2;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iput-wide p2, p0, Lcom/melodix/music/PreviewPlayerTiles$2;->val$g:J

    iput-wide p4, p0, Lcom/melodix/music/PreviewPlayerTiles$2;->val$seq:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onReceiveValue(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/melodix/music/PreviewPlayerTiles$2;->onReceiveValue(Ljava/lang/String;)V

    return-void
.end method

.method public onReceiveValue(Ljava/lang/String;)V
    .locals 6

    .prologue
    const/4 v0, 0x0

    .line 88
    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerTiles$2;->val$g:J

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$2;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerTiles;->access$5(Lcom/melodix/music/PreviewPlayerTiles;)J

    move-result-wide v4

    cmp-long v1, v2, v4

    if-nez v1, :cond_0

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerTiles$2;->val$seq:J

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$2;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerTiles;->access$6(Lcom/melodix/music/PreviewPlayerTiles;)J

    move-result-wide v4

    cmp-long v1, v2, v4

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$2;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerTiles;->access$0(Lcom/melodix/music/PreviewPlayerTiles;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$2;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-virtual {v1}, Lcom/melodix/music/PreviewPlayerTiles;->isShown()Z

    move-result v1

    if-nez v1, :cond_1

    .line 92
    :cond_0
    :goto_0
    return-void

    .line 89
    :cond_1
    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$2;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v1, v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$7(Lcom/melodix/music/PreviewPlayerTiles;Z)V

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$2;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v1, p1}, Lcom/melodix/music/PreviewPlayerTiles;->access$8(Lcom/melodix/music/PreviewPlayerTiles;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    move v1, v0

    .line 90
    :goto_1
    const/4 v0, 0x3

    if-lt v1, v0, :cond_2

    .line 91
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$2;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$3(Lcom/melodix/music/PreviewPlayerTiles;)V

    goto :goto_0

    .line 90
    :cond_2
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$2;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$9(Lcom/melodix/music/PreviewPlayerTiles;)[Ljava/lang/String;

    move-result-object v3

    if-nez v2, :cond_3

    const-string v0, "unknown"

    :goto_2
    aput-object v0, v3, v1

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$2;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$11(Lcom/melodix/music/PreviewPlayerTiles;)[Ljava/lang/String;

    move-result-object v3

    if-nez v2, :cond_4

    const-string v0, "web"

    :goto_3
    aput-object v0, v3, v1

    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_1

    :cond_3
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$2;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$10(Lcom/melodix/music/PreviewPlayerTiles;)[Ljava/lang/String;

    move-result-object v0

    aget-object v0, v0, v1

    const-string v4, "unknown"

    invoke-virtual {v2, v0, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_2

    :cond_4
    new-instance v0, Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerTiles$2;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v4}, Lcom/melodix/music/PreviewPlayerTiles;->access$10(Lcom/melodix/music/PreviewPlayerTiles;)[Ljava/lang/String;

    move-result-object v4

    aget-object v4, v4, v1

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, "Reason"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v4, "control"

    invoke-virtual {v2, v0, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_3
.end method
