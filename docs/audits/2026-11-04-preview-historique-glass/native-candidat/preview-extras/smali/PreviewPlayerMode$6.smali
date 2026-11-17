.class Lcom/melodix/music/PreviewPlayerMode$6;
.super Ljava/lang/Object;
.source "PreviewPlayerMode.java"

# interfaces
.implements Landroid/webkit/ValueCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerMode;->invoke()V
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


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerMode;J)V
    .locals 0

    .prologue
    .line 182
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerMode$6;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    iput-wide p2, p0, Lcom/melodix/music/PreviewPlayerMode$6;->val$g:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onReceiveValue(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/melodix/music/PreviewPlayerMode$6;->onReceiveValue(Ljava/lang/String;)V

    return-void
.end method

.method public onReceiveValue(Ljava/lang/String;)V
    .locals 4

    .prologue
    .line 184
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode$6;->val$g:J

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerMode$6;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerMode;->access$5(Lcom/melodix/music/PreviewPlayerMode;)J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode$6;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerMode;->access$12(Lcom/melodix/music/PreviewPlayerMode;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 187
    :cond_0
    :goto_0
    return-void

    .line 184
    :cond_1
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode$6;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v0, p1}, Lcom/melodix/music/PreviewPlayerMode;->access$8(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 185
    if-nez v0, :cond_3

    const-string v0, ""

    .line 186
    :goto_1
    const-string v1, "started"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    const-string v1, "busy"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    :cond_2
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode$6;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerMode$6;->val$g:J

    const/4 v1, 0x0

    invoke-static {v0, v2, v3, v1}, Lcom/melodix/music/PreviewPlayerMode;->access$28(Lcom/melodix/music/PreviewPlayerMode;JI)V

    goto :goto_0

    .line 185
    :cond_3
    const-string v1, "status"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    .line 186
    :cond_4
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode$6;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerMode;->access$27(Lcom/melodix/music/PreviewPlayerMode;)V

    goto :goto_0
.end method
