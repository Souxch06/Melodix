.class Lcom/melodix/music/PreviewPlayerMode$7$1;
.super Ljava/lang/Object;
.source "PreviewPlayerMode.java"

# interfaces
.implements Landroid/webkit/ValueCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerMode$7;->run()V
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
.field final synthetic this$1:Lcom/melodix/music/PreviewPlayerMode$7;


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerMode$7;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 174
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerMode$7$1;->this$1:Lcom/melodix/music/PreviewPlayerMode$7;

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

    .line 174
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/melodix/music/PreviewPlayerMode$7$1;->onReceiveValue(Ljava/lang/String;)V

    return-void
.end method

.method public onReceiveValue(Ljava/lang/String;)V
    .locals 4

    .line 176
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode$7$1;->this$1:Lcom/melodix/music/PreviewPlayerMode$7;

    iget-wide v0, v0, Lcom/melodix/music/PreviewPlayerMode$7;->val$g:J

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerMode$7$1;->this$1:Lcom/melodix/music/PreviewPlayerMode$7;

    iget-object v2, v2, Lcom/melodix/music/PreviewPlayerMode$7;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerMode;->access$500(Lcom/melodix/music/PreviewPlayerMode;)J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode$7$1;->this$1:Lcom/melodix/music/PreviewPlayerMode$7;

    iget-object v0, v0, Lcom/melodix/music/PreviewPlayerMode$7;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerMode;->access$1200(Lcom/melodix/music/PreviewPlayerMode;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_1

    :cond_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode$7$1;->this$1:Lcom/melodix/music/PreviewPlayerMode$7;

    iget-object v0, v0, Lcom/melodix/music/PreviewPlayerMode$7;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v0, p1}, Lcom/melodix/music/PreviewPlayerMode;->access$800(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    .line 177
    if-eqz p1, :cond_2

    const-string v0, "status"

    const-string v1, ""

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "done"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_0

    .line 178
    :cond_1
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode$7$1;->this$1:Lcom/melodix/music/PreviewPlayerMode$7;

    iget-object v0, v0, Lcom/melodix/music/PreviewPlayerMode$7;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v0, p1}, Lcom/melodix/music/PreviewPlayerMode;->access$2900(Lcom/melodix/music/PreviewPlayerMode;Lorg/json/JSONObject;)V

    .line 179
    return-void

    .line 177
    :cond_2
    :goto_0
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerMode$7$1;->this$1:Lcom/melodix/music/PreviewPlayerMode$7;

    iget-object p1, p1, Lcom/melodix/music/PreviewPlayerMode$7;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode$7$1;->this$1:Lcom/melodix/music/PreviewPlayerMode$7;

    iget-wide v0, v0, Lcom/melodix/music/PreviewPlayerMode$7;->val$g:J

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerMode$7$1;->this$1:Lcom/melodix/music/PreviewPlayerMode$7;

    iget v2, v2, Lcom/melodix/music/PreviewPlayerMode$7;->val$n:I

    add-int/lit8 v2, v2, 0x1

    invoke-static {p1, v0, v1, v2}, Lcom/melodix/music/PreviewPlayerMode;->access$2600(Lcom/melodix/music/PreviewPlayerMode;JI)V

    return-void

    .line 176
    :cond_3
    :goto_1
    return-void
.end method
