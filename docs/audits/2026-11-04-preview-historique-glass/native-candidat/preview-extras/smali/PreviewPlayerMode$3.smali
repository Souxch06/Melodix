.class Lcom/melodix/music/PreviewPlayerMode$3;
.super Ljava/lang/Object;
.source "PreviewPlayerMode.java"

# interfaces
.implements Landroid/webkit/ValueCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerMode;->observe()V
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
.field final synthetic this$0:Lcom/melodix/music/PreviewPlayerMode;

.field private final synthetic val$g:J

.field private final synthetic val$serial:J


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerMode;JJ)V
    .locals 0

    .prologue
    .line 72
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    iput-wide p2, p0, Lcom/melodix/music/PreviewPlayerMode$3;->val$g:J

    iput-wide p4, p0, Lcom/melodix/music/PreviewPlayerMode$3;->val$serial:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onReceiveValue(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/melodix/music/PreviewPlayerMode$3;->onReceiveValue(Ljava/lang/String;)V

    return-void
.end method

.method public onReceiveValue(Ljava/lang/String;)V
    .locals 11
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    const/4 v10, 0x0

    .line 74
    iget-wide v6, p0, Lcom/melodix/music/PreviewPlayerMode$3;->val$g:J

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v5}, Lcom/melodix/music/PreviewPlayerMode;->access$5(Lcom/melodix/music/PreviewPlayerMode;)J

    move-result-wide v8

    cmp-long v5, v6, v8

    if-nez v5, :cond_0

    iget-wide v6, p0, Lcom/melodix/music/PreviewPlayerMode$3;->val$serial:J

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v5}, Lcom/melodix/music/PreviewPlayerMode;->access$6(Lcom/melodix/music/PreviewPlayerMode;)J

    move-result-wide v8

    cmp-long v5, v6, v8

    if-nez v5, :cond_0

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v5}, Lcom/melodix/music/PreviewPlayerMode;->access$0(Lcom/melodix/music/PreviewPlayerMode;)Z

    move-result v5

    if-eqz v5, :cond_0

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-virtual {v5}, Lcom/melodix/music/PreviewPlayerMode;->isShown()Z

    move-result v5

    if-nez v5, :cond_1

    .line 84
    :cond_0
    :goto_0
    return-void

    .line 75
    :cond_1
    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v5, v10}, Lcom/melodix/music/PreviewPlayerMode;->access$7(Lcom/melodix/music/PreviewPlayerMode;Z)V

    .line 76
    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v5, p1}, Lcom/melodix/music/PreviewPlayerMode;->access$8(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    .local v4, "o":Lorg/json/JSONObject;
    if-nez v4, :cond_8

    const-string v0, "unknown"

    .line 77
    .local v0, "next":Ljava/lang/String;
    :goto_1
    if-nez v4, :cond_9

    const-string v3, ""

    .local v3, "nextTrack":Ljava/lang/String;
    :goto_2
    if-nez v4, :cond_a

    const-string v2, ""

    .line 78
    .local v2, "nextTitle":Ljava/lang/String;
    :goto_3
    if-nez v4, :cond_b

    const-string v1, "web"

    .line 79
    .local v1, "nextReason":Ljava/lang/String;
    :goto_4
    const-string v5, "true"

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2

    const-string v5, "false"

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2

    const-string v5, "mixed"

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2

    const-string v0, "unknown"

    .line 80
    :cond_2
    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v5}, Lcom/melodix/music/PreviewPlayerMode;->access$9(Lcom/melodix/music/PreviewPlayerMode;)Ljava/lang/String;

    move-result-object v5

    const-string v6, "like"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    const-string v5, "unknown"

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_4

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v5, v2}, Lcom/melodix/music/PreviewPlayerMode;->access$10(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_3

    const-string v5, "mixed"

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    :cond_3
    const-string v0, "unknown"

    const-string v1, "identity"

    .line 81
    :cond_4
    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v5}, Lcom/melodix/music/PreviewPlayerMode;->access$11(Lcom/melodix/music/PreviewPlayerMode;)Z

    move-result v5

    if-eqz v5, :cond_7

    const-string v5, "unknown"

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_5

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v5}, Lcom/melodix/music/PreviewPlayerMode;->access$12(Lcom/melodix/music/PreviewPlayerMode;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 82
    :cond_5
    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v5}, Lcom/melodix/music/PreviewPlayerMode;->access$9(Lcom/melodix/music/PreviewPlayerMode;)Ljava/lang/String;

    move-result-object v5

    const-string v6, "like"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_7

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_7

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v5}, Lcom/melodix/music/PreviewPlayerMode;->access$13(Lcom/melodix/music/PreviewPlayerMode;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_7

    :cond_6
    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v5, v10}, Lcom/melodix/music/PreviewPlayerMode;->access$14(Lcom/melodix/music/PreviewPlayerMode;Z)V

    .line 83
    :cond_7
    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v5, v0}, Lcom/melodix/music/PreviewPlayerMode;->access$15(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)V

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v5, v3}, Lcom/melodix/music/PreviewPlayerMode;->access$16(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)V

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v5, v2}, Lcom/melodix/music/PreviewPlayerMode;->access$17(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)V

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v5, v1}, Lcom/melodix/music/PreviewPlayerMode;->access$18(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)V

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v5}, Lcom/melodix/music/PreviewPlayerMode;->access$1(Lcom/melodix/music/PreviewPlayerMode;)V

    goto/16 :goto_0

    .line 76
    .end local v0    # "next":Ljava/lang/String;
    .end local v1    # "nextReason":Ljava/lang/String;
    .end local v2    # "nextTitle":Ljava/lang/String;
    .end local v3    # "nextTrack":Ljava/lang/String;
    :cond_8
    const-string v5, "state"

    const-string v6, "unknown"

    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_1

    .line 77
    .restart local v0    # "next":Ljava/lang/String;
    :cond_9
    const-string v5, "track"

    const-string v6, ""

    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    goto/16 :goto_2

    .restart local v3    # "nextTrack":Ljava/lang/String;
    :cond_a
    const-string v5, "title"

    const-string v6, ""

    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_3

    .line 78
    .restart local v2    # "nextTitle":Ljava/lang/String;
    :cond_b
    const-string v5, "reason"

    const-string v6, "state"

    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_4
.end method
