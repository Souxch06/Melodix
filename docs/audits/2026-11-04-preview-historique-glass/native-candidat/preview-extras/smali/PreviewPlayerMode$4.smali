.class Lcom/melodix/music/PreviewPlayerMode$4;
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
    .line 82
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerMode$4;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    iput-wide p2, p0, Lcom/melodix/music/PreviewPlayerMode$4;->val$g:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onReceiveValue(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/melodix/music/PreviewPlayerMode$4;->onReceiveValue(Ljava/lang/String;)V

    return-void
.end method

.method public onReceiveValue(Ljava/lang/String;)V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 84
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode$4;->val$g:J

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerMode$4;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerMode;->access$4(Lcom/melodix/music/PreviewPlayerMode;)J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-eqz v0, :cond_1

    .line 86
    :cond_0
    :goto_0
    return-void

    .line 84
    :cond_1
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode$4;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v0, p1}, Lcom/melodix/music/PreviewPlayerMode;->access$6(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 85
    if-eqz v0, :cond_2

    const-string v1, "sent"

    invoke-virtual {v0, v1, v4}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_0

    :cond_2
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode$4;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v0, v4}, Lcom/melodix/music/PreviewPlayerMode;->access$13(Lcom/melodix/music/PreviewPlayerMode;Z)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode$4;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    const-string v1, "unknown"

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewPlayerMode;->access$14(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode$4;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerMode;->access$17(Lcom/melodix/music/PreviewPlayerMode;)V

    goto :goto_0
.end method
