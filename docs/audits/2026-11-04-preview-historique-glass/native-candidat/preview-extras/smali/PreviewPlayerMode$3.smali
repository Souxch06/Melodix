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
    .line 112
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

    .prologue
    const/4 v7, 0x0

    .line 114
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

    .line 130
    :cond_0
    :goto_0
    return-void

    .line 115
    :cond_1
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v0, v7}, Lcom/melodix/music/PreviewPlayerMode;->access$7(Lcom/melodix/music/PreviewPlayerMode;Z)V

    .line 116
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v0, p1}, Lcom/melodix/music/PreviewPlayerMode;->access$8(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    if-eqz v0, :cond_2

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v1, v0}, Lcom/melodix/music/PreviewPlayerMode;->access$9(Lcom/melodix/music/PreviewPlayerMode;Lorg/json/JSONObject;)V

    :cond_2
    if-nez v0, :cond_d

    const-string v1, "unknown"

    .line 117
    :goto_1
    if-nez v0, :cond_e

    const-string v3, ""

    :goto_2
    if-nez v0, :cond_f

    const-string v2, ""

    .line 118
    :goto_3
    if-nez v0, :cond_10

    const-string v0, "web"

    .line 119
    :goto_4
    const-string v4, "true"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3

    const-string v4, "false"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3

    const-string v4, "mixed"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3

    const-string v1, "unknown"

    .line 120
    :cond_3
    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v4}, Lcom/melodix/music/PreviewPlayerMode;->access$10(Lcom/melodix/music/PreviewPlayerMode;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "like"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    const-string v4, "mixed"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    const-string v1, "unknown"

    const-string v0, "identity"

    .line 121
    :cond_4
    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v4}, Lcom/melodix/music/PreviewPlayerMode;->access$10(Lcom/melodix/music/PreviewPlayerMode;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "like"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6

    const-string v4, "unknown"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_6

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_5

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v4, v2}, Lcom/melodix/music/PreviewPlayerMode;->access$11(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_6

    :cond_5
    const-string v3, ""

    const-string v2, ""

    .line 122
    :cond_6
    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v4}, Lcom/melodix/music/PreviewPlayerMode;->access$12(Lcom/melodix/music/PreviewPlayerMode;)Z

    move-result v4

    if-eqz v4, :cond_7

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    const/4 v5, 0x1

    invoke-static {v4, v5}, Lcom/melodix/music/PreviewPlayerMode;->access$13(Lcom/melodix/music/PreviewPlayerMode;Z)V

    .line 123
    :cond_7
    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v4}, Lcom/melodix/music/PreviewPlayerMode;->access$12(Lcom/melodix/music/PreviewPlayerMode;)Z

    move-result v4

    if-eqz v4, :cond_9

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v4}, Lcom/melodix/music/PreviewPlayerMode;->access$10(Lcom/melodix/music/PreviewPlayerMode;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "like"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_9

    const-string v4, "unknown"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_9

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v4}, Lcom/melodix/music/PreviewPlayerMode;->access$14(Lcom/melodix/music/PreviewPlayerMode;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_9

    .line 124
    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v4}, Lcom/melodix/music/PreviewPlayerMode;->access$15(Lcom/melodix/music/PreviewPlayerMode;)I

    move-result v4

    if-ltz v4, :cond_8

    invoke-static {}, Lcom/melodix/music/PreviewPlayerMode;->access$16()[Ljava/lang/String;

    move-result-object v5

    const-string v6, "changement observ\u00e9"

    aput-object v6, v5, v4

    :cond_8
    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v4, v7}, Lcom/melodix/music/PreviewPlayerMode;->access$17(Lcom/melodix/music/PreviewPlayerMode;Z)V

    .line 126
    :cond_9
    const-string v4, "unknown"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_11

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v4}, Lcom/melodix/music/PreviewPlayerMode;->access$18(Lcom/melodix/music/PreviewPlayerMode;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_11

    const-string v4, "control"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_a

    const-string v4, "absent"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_a

    const-string v4, "ambiguous"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_a

    const-string v4, "state"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_11

    .line 127
    :cond_a
    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v4}, Lcom/melodix/music/PreviewPlayerMode;->access$10(Lcom/melodix/music/PreviewPlayerMode;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "like"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_b

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v4}, Lcom/melodix/music/PreviewPlayerMode;->access$19(Lcom/melodix/music/PreviewPlayerMode;)Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v5}, Lcom/melodix/music/PreviewPlayerMode;->access$20(Lcom/melodix/music/PreviewPlayerMode;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_11

    :cond_b
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerMode;->access$18(Lcom/melodix/music/PreviewPlayerMode;)Ljava/lang/String;

    move-result-object v1

    const-string v0, "remembered"

    .line 129
    :cond_c
    :goto_5
    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v4, v1}, Lcom/melodix/music/PreviewPlayerMode;->access$23(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v1, v3}, Lcom/melodix/music/PreviewPlayerMode;->access$24(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v1, v2}, Lcom/melodix/music/PreviewPlayerMode;->access$25(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v1, v0}, Lcom/melodix/music/PreviewPlayerMode;->access$26(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerMode;->access$1(Lcom/melodix/music/PreviewPlayerMode;)V

    goto/16 :goto_0

    .line 116
    :cond_d
    const-string v1, "state"

    const-string v2, "unknown"

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_1

    .line 117
    :cond_e
    const-string v2, "track"

    const-string v3, ""

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    goto/16 :goto_2

    :cond_f
    const-string v2, "title"

    const-string v4, ""

    invoke-virtual {v0, v2, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_3

    .line 118
    :cond_10
    const-string v4, "reason"

    const-string v5, "state"

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_4

    .line 128
    :cond_11
    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v4}, Lcom/melodix/music/PreviewPlayerMode;->access$10(Lcom/melodix/music/PreviewPlayerMode;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "like"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_c

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v4}, Lcom/melodix/music/PreviewPlayerMode;->access$19(Lcom/melodix/music/PreviewPlayerMode;)Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v5}, Lcom/melodix/music/PreviewPlayerMode;->access$20(Lcom/melodix/music/PreviewPlayerMode;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_c

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    const-string v5, ""

    invoke-static {v4, v5}, Lcom/melodix/music/PreviewPlayerMode;->access$21(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)V

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    const-string v5, ""

    invoke-static {v4, v5}, Lcom/melodix/music/PreviewPlayerMode;->access$22(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)V

    goto :goto_5
.end method
