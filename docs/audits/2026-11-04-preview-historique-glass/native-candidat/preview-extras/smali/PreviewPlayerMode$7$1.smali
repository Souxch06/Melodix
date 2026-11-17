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
        "Landroid/webkit/ValueCallback",
        "<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/melodix/music/PreviewPlayerMode$7;

.field private final synthetic val$g:J

.field private final synthetic val$n:I


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerMode$7;JI)V
    .locals 0

    .prologue
    .line 194
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerMode$7$1;->this$1:Lcom/melodix/music/PreviewPlayerMode$7;

    iput-wide p2, p0, Lcom/melodix/music/PreviewPlayerMode$7$1;->val$g:J

    iput p4, p0, Lcom/melodix/music/PreviewPlayerMode$7$1;->val$n:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onReceiveValue(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/melodix/music/PreviewPlayerMode$7$1;->onReceiveValue(Ljava/lang/String;)V

    return-void
.end method

.method public onReceiveValue(Ljava/lang/String;)V
    .locals 4

    .prologue
    .line 196
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode$7$1;->val$g:J

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerMode$7$1;->this$1:Lcom/melodix/music/PreviewPlayerMode$7;

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerMode$7;->access$0(Lcom/melodix/music/PreviewPlayerMode$7;)Lcom/melodix/music/PreviewPlayerMode;

    move-result-object v2

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerMode;->access$5(Lcom/melodix/music/PreviewPlayerMode;)J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode$7$1;->this$1:Lcom/melodix/music/PreviewPlayerMode$7;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerMode$7;->access$0(Lcom/melodix/music/PreviewPlayerMode$7;)Lcom/melodix/music/PreviewPlayerMode;

    move-result-object v0

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerMode;->access$12(Lcom/melodix/music/PreviewPlayerMode;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 199
    :cond_0
    :goto_0
    return-void

    .line 196
    :cond_1
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode$7$1;->this$1:Lcom/melodix/music/PreviewPlayerMode$7;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerMode$7;->access$0(Lcom/melodix/music/PreviewPlayerMode$7;)Lcom/melodix/music/PreviewPlayerMode;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/melodix/music/PreviewPlayerMode;->access$8(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 197
    if-eqz v0, :cond_2

    const-string v1, "status"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "done"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    :cond_2
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode$7$1;->this$1:Lcom/melodix/music/PreviewPlayerMode$7;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerMode$7;->access$0(Lcom/melodix/music/PreviewPlayerMode$7;)Lcom/melodix/music/PreviewPlayerMode;

    move-result-object v0

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerMode$7$1;->val$g:J

    iget v1, p0, Lcom/melodix/music/PreviewPlayerMode$7$1;->val$n:I

    add-int/lit8 v1, v1, 0x1

    invoke-static {v0, v2, v3, v1}, Lcom/melodix/music/PreviewPlayerMode;->access$28(Lcom/melodix/music/PreviewPlayerMode;JI)V

    goto :goto_0

    .line 198
    :cond_3
    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerMode$7$1;->this$1:Lcom/melodix/music/PreviewPlayerMode$7;

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerMode$7;->access$0(Lcom/melodix/music/PreviewPlayerMode$7;)Lcom/melodix/music/PreviewPlayerMode;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/melodix/music/PreviewPlayerMode;->access$31(Lcom/melodix/music/PreviewPlayerMode;Lorg/json/JSONObject;)V

    goto :goto_0
.end method
