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
    .line 69
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
    .locals 8
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 71
    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerMode$3;->val$g:J

    iget-object v6, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v6}, Lcom/melodix/music/PreviewPlayerMode;->access$4(Lcom/melodix/music/PreviewPlayerMode;)J

    move-result-wide v6

    cmp-long v4, v4, v6

    if-nez v4, :cond_0

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerMode$3;->val$serial:J

    iget-object v6, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v6}, Lcom/melodix/music/PreviewPlayerMode;->access$5(Lcom/melodix/music/PreviewPlayerMode;)J

    move-result-wide v6

    cmp-long v4, v4, v6

    if-nez v4, :cond_0

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v4}, Lcom/melodix/music/PreviewPlayerMode;->access$0(Lcom/melodix/music/PreviewPlayerMode;)Z

    move-result v4

    if-eqz v4, :cond_0

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-virtual {v4}, Lcom/melodix/music/PreviewPlayerMode;->isShown()Z

    move-result v4

    if-nez v4, :cond_1

    .line 79
    :cond_0
    :goto_0
    return-void

    .line 72
    :cond_1
    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v4, p1}, Lcom/melodix/music/PreviewPlayerMode;->access$6(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    .local v3, "o":Lorg/json/JSONObject;
    if-nez v3, :cond_8

    const-string v0, "unknown"

    .line 73
    .local v0, "next":Ljava/lang/String;
    :goto_1
    if-nez v3, :cond_9

    const-string v2, ""

    .local v2, "nextTrack":Ljava/lang/String;
    :goto_2
    if-nez v3, :cond_a

    const-string v1, ""

    .line 74
    .local v1, "nextTitle":Ljava/lang/String;
    :goto_3
    const-string v4, "true"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2

    const-string v4, "false"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2

    const-string v4, "mixed"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2

    const-string v0, "unknown"

    .line 75
    :cond_2
    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v4}, Lcom/melodix/music/PreviewPlayerMode;->access$7(Lcom/melodix/music/PreviewPlayerMode;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "like"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v4, v1}, Lcom/melodix/music/PreviewPlayerMode;->access$8(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_3

    const-string v4, "mixed"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    :cond_3
    const-string v0, "unknown"

    .line 76
    :cond_4
    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v4}, Lcom/melodix/music/PreviewPlayerMode;->access$9(Lcom/melodix/music/PreviewPlayerMode;)Z

    move-result v4

    if-eqz v4, :cond_7

    const-string v4, "unknown"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_5

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v4}, Lcom/melodix/music/PreviewPlayerMode;->access$10(Lcom/melodix/music/PreviewPlayerMode;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 77
    :cond_5
    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v4}, Lcom/melodix/music/PreviewPlayerMode;->access$7(Lcom/melodix/music/PreviewPlayerMode;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "like"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_7

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_7

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v4}, Lcom/melodix/music/PreviewPlayerMode;->access$11(Lcom/melodix/music/PreviewPlayerMode;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_7

    :cond_6
    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    const/4 v5, 0x0

    invoke-static {v4, v5}, Lcom/melodix/music/PreviewPlayerMode;->access$12(Lcom/melodix/music/PreviewPlayerMode;Z)V

    .line 78
    :cond_7
    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v4, v0}, Lcom/melodix/music/PreviewPlayerMode;->access$13(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)V

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v4, v2}, Lcom/melodix/music/PreviewPlayerMode;->access$14(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)V

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v4, v1}, Lcom/melodix/music/PreviewPlayerMode;->access$15(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)V

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v4}, Lcom/melodix/music/PreviewPlayerMode;->access$16(Lcom/melodix/music/PreviewPlayerMode;)V

    goto/16 :goto_0

    .line 72
    .end local v0    # "next":Ljava/lang/String;
    .end local v1    # "nextTitle":Ljava/lang/String;
    .end local v2    # "nextTrack":Ljava/lang/String;
    :cond_8
    const-string v4, "state"

    const-string v5, "unknown"

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_1

    .line 73
    .restart local v0    # "next":Ljava/lang/String;
    :cond_9
    const-string v4, "track"

    const-string v5, ""

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_2

    .restart local v2    # "nextTrack":Ljava/lang/String;
    :cond_a
    const-string v4, "title"

    const-string v5, ""

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_3
.end method
