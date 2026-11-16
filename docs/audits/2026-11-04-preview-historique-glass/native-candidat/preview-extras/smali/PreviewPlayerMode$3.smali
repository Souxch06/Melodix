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
    .line 95
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
    .locals 9

    .prologue
    const/4 v8, 0x0

    .line 97
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode$3;->val$g:J

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerMode;->access$5(Lcom/melodix/music/PreviewPlayerMode;)J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode$3;->val$serial:J

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerMode;->access$6(Lcom/melodix/music/PreviewPlayerMode;)J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerMode;->access$0(Lcom/melodix/music/PreviewPlayerMode;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-virtual {v0}, Lcom/melodix/music/PreviewPlayerMode;->isShown()Z

    move-result v0

    if-nez v0, :cond_1

    .line 108
    :cond_0
    :goto_0
    return-void

    .line 98
    :cond_1
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v0, v8}, Lcom/melodix/music/PreviewPlayerMode;->access$7(Lcom/melodix/music/PreviewPlayerMode;Z)V

    .line 99
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v0, p1}, Lcom/melodix/music/PreviewPlayerMode;->access$8(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    if-eqz v2, :cond_2

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v0, v2}, Lcom/melodix/music/PreviewPlayerMode;->access$9(Lcom/melodix/music/PreviewPlayerMode;Lorg/json/JSONObject;)V

    :cond_2
    if-nez v2, :cond_b

    const-string v1, "unknown"

    .line 100
    :goto_1
    if-nez v2, :cond_c

    const-string v0, ""

    move-object v4, v0

    :goto_2
    if-nez v2, :cond_d

    const-string v0, ""

    move-object v3, v0

    .line 101
    :goto_3
    if-nez v2, :cond_e

    const-string v0, "web"

    .line 102
    :goto_4
    const-string v2, "true"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    const-string v2, "false"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    const-string v2, "mixed"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    const-string v1, "unknown"

    .line 103
    :cond_3
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerMode;->access$10(Lcom/melodix/music/PreviewPlayerMode;)Ljava/lang/String;

    move-result-object v2

    const-string v5, "like"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    const-string v2, "unknown"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_5

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v2, v3}, Lcom/melodix/music/PreviewPlayerMode;->access$11(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_4

    const-string v2, "mixed"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    :cond_4
    const-string v1, "unknown"

    const-string v0, "identity"

    .line 104
    :cond_5
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerMode;->access$12(Lcom/melodix/music/PreviewPlayerMode;)Z

    move-result v2

    if-eqz v2, :cond_6

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    const/4 v5, 0x1

    invoke-static {v2, v5}, Lcom/melodix/music/PreviewPlayerMode;->access$13(Lcom/melodix/music/PreviewPlayerMode;Z)V

    .line 105
    :cond_6
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerMode;->access$12(Lcom/melodix/music/PreviewPlayerMode;)Z

    move-result v2

    if-eqz v2, :cond_a

    const-string v2, "unknown"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_7

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerMode;->access$14(Lcom/melodix/music/PreviewPlayerMode;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 106
    :cond_7
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerMode;->access$10(Lcom/melodix/music/PreviewPlayerMode;)Ljava/lang/String;

    move-result-object v2

    const-string v5, "like"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_a

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerMode;->access$15(Lcom/melodix/music/PreviewPlayerMode;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_a

    :cond_8
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerMode;->access$16(Lcom/melodix/music/PreviewPlayerMode;)I

    move-result v5

    if-ltz v5, :cond_9

    invoke-static {}, Lcom/melodix/music/PreviewPlayerMode;->access$17()[Ljava/lang/String;

    move-result-object v6

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerMode;->access$10(Lcom/melodix/music/PreviewPlayerMode;)Ljava/lang/String;

    move-result-object v2

    const-string v7, "like"

    invoke-virtual {v2, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_f

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerMode;->access$15(Lcom/melodix/music/PreviewPlayerMode;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_f

    const-string v2, "piste chang\u00e9e"

    :goto_5
    aput-object v2, v6, v5

    :cond_9
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v2, v8}, Lcom/melodix/music/PreviewPlayerMode;->access$18(Lcom/melodix/music/PreviewPlayerMode;Z)V

    .line 107
    :cond_a
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v2, v1}, Lcom/melodix/music/PreviewPlayerMode;->access$19(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v1, v4}, Lcom/melodix/music/PreviewPlayerMode;->access$20(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v1, v3}, Lcom/melodix/music/PreviewPlayerMode;->access$21(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v1, v0}, Lcom/melodix/music/PreviewPlayerMode;->access$22(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerMode;->access$1(Lcom/melodix/music/PreviewPlayerMode;)V

    goto/16 :goto_0

    .line 99
    :cond_b
    const-string v0, "state"

    const-string v1, "unknown"

    invoke-virtual {v2, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_1

    .line 100
    :cond_c
    const-string v0, "track"

    const-string v3, ""

    invoke-virtual {v2, v0, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    move-object v4, v0

    goto/16 :goto_2

    :cond_d
    const-string v0, "title"

    const-string v3, ""

    invoke-virtual {v2, v0, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    move-object v3, v0

    goto/16 :goto_3

    .line 101
    :cond_e
    const-string v0, "reason"

    const-string v5, "state"

    invoke-virtual {v2, v0, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_4

    .line 106
    :cond_f
    const-string v2, "changement observ\u00e9"

    goto :goto_5
.end method
