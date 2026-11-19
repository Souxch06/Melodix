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
        "Landroid/webkit/ValueCallback<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/melodix/music/PreviewPlayerMode;

.field final synthetic val$g:J

.field final synthetic val$serial:J


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerMode;JJ)V
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

    .line 115
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    iput-wide p2, p0, Lcom/melodix/music/PreviewPlayerMode$3;->val$g:J

    iput-wide p4, p0, Lcom/melodix/music/PreviewPlayerMode$3;->val$serial:J

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

    .line 115
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/melodix/music/PreviewPlayerMode$3;->onReceiveValue(Ljava/lang/String;)V

    return-void
.end method

.method public onReceiveValue(Ljava/lang/String;)V
    .locals 11

    .line 117
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode$3;->val$g:J

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerMode;->access$500(Lcom/melodix/music/PreviewPlayerMode;)J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_11

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode$3;->val$serial:J

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerMode;->access$600(Lcom/melodix/music/PreviewPlayerMode;)J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_11

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerMode;->access$000(Lcom/melodix/music/PreviewPlayerMode;)Z

    move-result v0

    if-eqz v0, :cond_11

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-virtual {v0}, Lcom/melodix/music/PreviewPlayerMode;->isShown()Z

    move-result v0

    if-nez v0, :cond_0

    goto/16 :goto_6

    .line 118
    :cond_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewPlayerMode;->access$702(Lcom/melodix/music/PreviewPlayerMode;Z)Z

    .line 119
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v0, p1}, Lcom/melodix/music/PreviewPlayerMode;->access$800(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    if-eqz p1, :cond_1

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v0, p1}, Lcom/melodix/music/PreviewPlayerMode;->access$900(Lcom/melodix/music/PreviewPlayerMode;Lorg/json/JSONObject;)V

    :cond_1
    const-string v0, "state"

    const-string v2, "unknown"

    if-nez p1, :cond_2

    move-object v3, v2

    goto :goto_0

    :cond_2
    invoke-virtual {p1, v0, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 120
    :goto_0
    const-string v4, ""

    if-nez p1, :cond_3

    move-object v5, v4

    goto :goto_1

    :cond_3
    const-string v5, "track"

    invoke-virtual {p1, v5, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    :goto_1
    if-nez p1, :cond_4

    move-object v6, v4

    goto :goto_2

    :cond_4
    const-string v6, "title"

    invoke-virtual {p1, v6, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 121
    :goto_2
    if-nez p1, :cond_5

    const-string p1, "web"

    goto :goto_3

    :cond_5
    const-string v7, "reason"

    invoke-virtual {p1, v7, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 122
    :goto_3
    const-string v7, "true"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    const-string v8, "mixed"

    if-nez v7, :cond_6

    const-string v7, "false"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_6

    invoke-virtual {v3, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_6

    move-object v3, v2

    .line 123
    :cond_6
    iget-object v7, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v7}, Lcom/melodix/music/PreviewPlayerMode;->access$1000(Lcom/melodix/music/PreviewPlayerMode;)Ljava/lang/String;

    move-result-object v7

    const-string v9, "like"

    invoke-virtual {v7, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    const-string v10, "identity"

    if-eqz v7, :cond_7

    invoke-virtual {v3, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_7

    move-object v3, v2

    move-object p1, v10

    .line 124
    :cond_7
    iget-object v7, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v7}, Lcom/melodix/music/PreviewPlayerMode;->access$1000(Lcom/melodix/music/PreviewPlayerMode;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_9

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_9

    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_8

    iget-object v7, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v7, v6}, Lcom/melodix/music/PreviewPlayerMode;->access$1100(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_9

    :cond_8
    move-object v3, v2

    move-object v5, v4

    move-object v6, v5

    goto :goto_4

    .line 125
    :cond_9
    move-object v10, p1

    :goto_4
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerMode;->access$1200(Lcom/melodix/music/PreviewPlayerMode;)Z

    move-result p1

    if-eqz p1, :cond_a

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    const/4 v7, 0x1

    invoke-static {p1, v7}, Lcom/melodix/music/PreviewPlayerMode;->access$1302(Lcom/melodix/music/PreviewPlayerMode;Z)Z

    .line 126
    :cond_a
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerMode;->access$1200(Lcom/melodix/music/PreviewPlayerMode;)Z

    move-result p1

    if-eqz p1, :cond_c

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerMode;->access$1000(Lcom/melodix/music/PreviewPlayerMode;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_c

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_c

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerMode;->access$1400(Lcom/melodix/music/PreviewPlayerMode;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_c

    .line 127
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerMode;->access$1500(Lcom/melodix/music/PreviewPlayerMode;)I

    move-result p1

    if-ltz p1, :cond_b

    invoke-static {}, Lcom/melodix/music/PreviewPlayerMode;->access$1600()[Ljava/lang/String;

    move-result-object v7

    const-string v8, "changement observ\u00e9"

    aput-object v8, v7, p1

    :cond_b
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {p1, v1}, Lcom/melodix/music/PreviewPlayerMode;->access$1202(Lcom/melodix/music/PreviewPlayerMode;Z)Z

    .line 129
    :cond_c
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerMode;->access$1000(Lcom/melodix/music/PreviewPlayerMode;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_f

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_f

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerMode;->access$1700(Lcom/melodix/music/PreviewPlayerMode;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_f

    const-string p1, "control"

    invoke-virtual {v10, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_d

    const-string p1, "absent"

    invoke-virtual {v10, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_d

    const-string p1, "ambiguous"

    invoke-virtual {v10, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_d

    invoke-virtual {v10, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_f

    :cond_d
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    .line 130
    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerMode;->access$1000(Lcom/melodix/music/PreviewPlayerMode;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_e

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerMode;->access$1900(Lcom/melodix/music/PreviewPlayerMode;)Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerMode;->access$1800(Lcom/melodix/music/PreviewPlayerMode;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_f

    :cond_e
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerMode;->access$1700(Lcom/melodix/music/PreviewPlayerMode;)Ljava/lang/String;

    move-result-object v3

    const-string v10, "remembered"

    goto :goto_5

    .line 131
    :cond_f
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerMode;->access$1000(Lcom/melodix/music/PreviewPlayerMode;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_10

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerMode;->access$1900(Lcom/melodix/music/PreviewPlayerMode;)Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerMode;->access$1800(Lcom/melodix/music/PreviewPlayerMode;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_10

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {p1, v4}, Lcom/melodix/music/PreviewPlayerMode;->access$1702(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)Ljava/lang/String;

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {p1, v4}, Lcom/melodix/music/PreviewPlayerMode;->access$1902(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)Ljava/lang/String;

    .line 132
    :cond_10
    :goto_5
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {p1, v3}, Lcom/melodix/music/PreviewPlayerMode;->access$2002(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)Ljava/lang/String;

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {p1, v5}, Lcom/melodix/music/PreviewPlayerMode;->access$2102(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)Ljava/lang/String;

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {p1, v6}, Lcom/melodix/music/PreviewPlayerMode;->access$2202(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)Ljava/lang/String;

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {p1, v10}, Lcom/melodix/music/PreviewPlayerMode;->access$2302(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)Ljava/lang/String;

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerMode$3;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerMode;->access$100(Lcom/melodix/music/PreviewPlayerMode;)V

    .line 133
    return-void

    .line 117
    :cond_11
    :goto_6
    return-void
.end method
