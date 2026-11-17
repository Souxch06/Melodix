.class Lcom/melodix/music/PreviewPlayerTiles$3;
.super Ljava/lang/Object;
.source "PreviewPlayerTiles.java"

# interfaces
.implements Landroid/webkit/ValueCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerTiles;->probe(ILandroid/app/Activity;)V
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

.field private final synthetic val$i:I

.field private final synthetic val$serial:J


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerTiles;JI)V
    .locals 0

    .prologue
    .line 86
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$3;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iput-wide p2, p0, Lcom/melodix/music/PreviewPlayerTiles$3;->val$serial:J

    iput p4, p0, Lcom/melodix/music/PreviewPlayerTiles$3;->val$i:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onReceiveValue(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/melodix/music/PreviewPlayerTiles$3;->onReceiveValue(Ljava/lang/String;)V

    return-void
.end method

.method public onReceiveValue(Ljava/lang/String;)V
    .locals 6

    .prologue
    .line 88
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles$3;->val$serial:J

    invoke-static {}, Lcom/melodix/music/PreviewPlayerTiles;->access$5()[J

    move-result-object v2

    iget v3, p0, Lcom/melodix/music/PreviewPlayerTiles$3;->val$i:I

    aget-wide v2, v2, v3

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 97
    :goto_0
    return-void

    .line 90
    :cond_0
    :try_start_0
    new-instance v0, Lorg/json/JSONTokener;

    invoke-direct {v0, p1}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lorg/json/JSONTokener;->nextValue()Ljava/lang/Object;

    move-result-object v0

    .line 91
    instance-of v1, v0, Ljava/lang/String;

    if-nez v1, :cond_1

    invoke-static {}, Lcom/melodix/music/PreviewPlayerTiles;->access$6()[Ljava/lang/String;

    move-result-object v0

    iget v1, p0, Lcom/melodix/music/PreviewPlayerTiles$3;->val$i:I

    const-string v2, "r\u00e9ponse illisible"

    aput-object v2, v0, v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 96
    :catch_0
    move-exception v0

    invoke-static {}, Lcom/melodix/music/PreviewPlayerTiles;->access$6()[Ljava/lang/String;

    move-result-object v0

    iget v1, p0, Lcom/melodix/music/PreviewPlayerTiles$3;->val$i:I

    const-string v2, "r\u00e9ponse illisible"

    aput-object v2, v0, v1

    goto :goto_0

    .line 92
    :cond_1
    :try_start_1
    new-instance v1, Lorg/json/JSONObject;

    check-cast v0, Ljava/lang/String;

    invoke-direct {v1, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v0, "reason"

    const-string v2, "unknown"

    invoke-virtual {v1, v0, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 93
    const-string v2, "observed"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    const-string v2, "absent"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    const-string v0, "unknown"

    .line 94
    :cond_2
    invoke-static {}, Lcom/melodix/music/PreviewPlayerTiles;->access$6()[Ljava/lang/String;

    move-result-object v2

    iget v3, p0, Lcom/melodix/music/PreviewPlayerTiles$3;->val$i:I

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "motif="

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, ", racines="

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, "roots"

    invoke-static {v1, v4}, Lcom/melodix/music/PreviewPlayerTiles;->access$7(Lorg/json/JSONObject;Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, ", lignes="

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, "rows"

    invoke-static {v1, v4}, Lcom/melodix/music/PreviewPlayerTiles;->access$7(Lorg/json/JSONObject;Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 95
    const-string v4, ", commandes="

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, "controls"

    invoke-static {v1, v4}, Lcom/melodix/music/PreviewPlayerTiles;->access$7(Lorg/json/JSONObject;Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, ", boutons="

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, "buttons"

    invoke-static {v1, v4}, Lcom/melodix/music/PreviewPlayerTiles;->access$7(Lorg/json/JSONObject;Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, ", r\u00f4les="

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, "roles"

    invoke-static {v1, v4}, Lcom/melodix/music/PreviewPlayerTiles;->access$7(Lorg/json/JSONObject;Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, ", testids="

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, "testids"

    invoke-static {v1, v4}, Lcom/melodix/music/PreviewPlayerTiles;->access$7(Lorg/json/JSONObject;Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 94
    aput-object v0, v2, v3
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0
.end method
