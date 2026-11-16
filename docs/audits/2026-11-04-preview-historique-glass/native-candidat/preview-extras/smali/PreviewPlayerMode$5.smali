.class Lcom/melodix/music/PreviewPlayerMode$5;
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
    .line 97
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerMode$5;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    iput-wide p2, p0, Lcom/melodix/music/PreviewPlayerMode$5;->val$g:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onReceiveValue(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/melodix/music/PreviewPlayerMode$5;->onReceiveValue(Ljava/lang/String;)V

    return-void
.end method

.method public onReceiveValue(Ljava/lang/String;)V
    .locals 6
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 99
    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerMode$5;->val$g:J

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerMode$5;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerMode;->access$5(Lcom/melodix/music/PreviewPlayerMode;)J

    move-result-wide v4

    cmp-long v1, v2, v4

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerMode$5;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerMode;->access$11(Lcom/melodix/music/PreviewPlayerMode;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 101
    :cond_0
    :goto_0
    return-void

    .line 99
    :cond_1
    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerMode$5;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v1, p1}, Lcom/melodix/music/PreviewPlayerMode;->access$8(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 100
    .local v0, "o":Lorg/json/JSONObject;
    if-eqz v0, :cond_2

    const-string v1, "sent"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-nez v1, :cond_0

    :cond_2
    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerMode$5;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerMode;->access$19(Lcom/melodix/music/PreviewPlayerMode;)V

    goto :goto_0
.end method
