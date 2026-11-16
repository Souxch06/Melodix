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
        "Landroid/webkit/ValueCallback<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/melodix/music/PreviewPlayerTiles;

.field final synthetic val$i:I

.field final synthetic val$serial:J


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerTiles;JI)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010
        }
        names = {
            null,
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 73
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$3;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iput-wide p2, p0, Lcom/melodix/music/PreviewPlayerTiles$3;->val$serial:J

    iput p4, p0, Lcom/melodix/music/PreviewPlayerTiles$3;->val$i:I

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

    .line 73
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/melodix/music/PreviewPlayerTiles$3;->onReceiveValue(Ljava/lang/String;)V

    return-void
.end method

.method public onReceiveValue(Ljava/lang/String;)V
    .locals 7

    .line 75
    const-string v0, "unknown"

    const-string v1, "r\u00e9ponse illisible"

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerTiles$3;->val$serial:J

    invoke-static {}, Lcom/melodix/music/PreviewPlayerTiles;->access$400()[J

    move-result-object v4

    iget v5, p0, Lcom/melodix/music/PreviewPlayerTiles$3;->val$i:I

    aget-wide v5, v4, v5

    cmp-long v2, v2, v5

    if-eqz v2, :cond_0

    return-void

    .line 77
    :cond_0
    :try_start_0
    new-instance v2, Lorg/json/JSONTokener;

    invoke-direct {v2, p1}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Lorg/json/JSONTokener;->nextValue()Ljava/lang/Object;

    move-result-object p1

    .line 78
    instance-of v2, p1, Ljava/lang/String;

    if-nez v2, :cond_1

    invoke-static {}, Lcom/melodix/music/PreviewPlayerTiles;->access$500()[Ljava/lang/String;

    move-result-object p1

    iget v0, p0, Lcom/melodix/music/PreviewPlayerTiles$3;->val$i:I

    aput-object v1, p1, v0

    return-void

    .line 79
    :cond_1
    new-instance v2, Lorg/json/JSONObject;

    check-cast p1, Ljava/lang/String;

    invoke-direct {v2, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string p1, "reason"

    invoke-virtual {v2, p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 80
    const-string v3, "observed"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    const-string v3, "absent"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    goto :goto_0

    .line 81
    :cond_2
    move-object v0, p1

    :goto_0
    invoke-static {}, Lcom/melodix/music/PreviewPlayerTiles;->access$500()[Ljava/lang/String;

    move-result-object p1

    iget v3, p0, Lcom/melodix/music/PreviewPlayerTiles$3;->val$i:I

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "motif="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, ", racines="

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, "roots"

    invoke-static {v2, v4}, Lcom/melodix/music/PreviewPlayerTiles;->access$600(Lorg/json/JSONObject;Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, ", lignes="

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, "rows"

    invoke-static {v2, v4}, Lcom/melodix/music/PreviewPlayerTiles;->access$600(Lorg/json/JSONObject;Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, ", boutons="

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, "buttons"

    .line 82
    invoke-static {v2, v4}, Lcom/melodix/music/PreviewPlayerTiles;->access$600(Lorg/json/JSONObject;Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, ", r\u00f4les="

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, "roles"

    invoke-static {v2, v4}, Lcom/melodix/music/PreviewPlayerTiles;->access$600(Lorg/json/JSONObject;Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, ", testids="

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, "testids"

    invoke-static {v2, v4}, Lcom/melodix/music/PreviewPlayerTiles;->access$600(Lorg/json/JSONObject;Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    aput-object v0, p1, v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 83
    goto :goto_1

    :catch_0
    move-exception p1

    invoke-static {}, Lcom/melodix/music/PreviewPlayerTiles;->access$500()[Ljava/lang/String;

    move-result-object p1

    iget v0, p0, Lcom/melodix/music/PreviewPlayerTiles$3;->val$i:I

    aput-object v1, p1, v0

    .line 84
    :goto_1
    return-void
.end method
