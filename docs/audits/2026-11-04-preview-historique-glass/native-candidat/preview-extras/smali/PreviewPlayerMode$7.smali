.class Lcom/melodix/music/PreviewPlayerMode$7;
.super Ljava/lang/Object;
.source "PreviewPlayerMode.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerMode;->poll(JI)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/melodix/music/PreviewPlayerMode;

.field final synthetic val$g:J

.field final synthetic val$n:I


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerMode;JI)V
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

    .line 200
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerMode$7;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    iput-wide p2, p0, Lcom/melodix/music/PreviewPlayerMode$7;->val$g:J

    iput p4, p0, Lcom/melodix/music/PreviewPlayerMode$7;->val$n:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 201
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode$7;->val$g:J

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerMode$7;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerMode;->access$500(Lcom/melodix/music/PreviewPlayerMode;)J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode$7;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerMode;->access$1200(Lcom/melodix/music/PreviewPlayerMode;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_1

    .line 202
    :cond_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode$7;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerMode;->access$2600(Lcom/melodix/music/PreviewPlayerMode;)Landroid/webkit/WebView;

    move-result-object v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode$7;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerMode;->access$2400(Lcom/melodix/music/PreviewPlayerMode;)V

    return-void

    .line 203
    :cond_1
    :try_start_0
    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerMode$7;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    const-string v2, "poll"

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerMode$7;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v3}, Lcom/melodix/music/PreviewPlayerMode;->access$1400(Lcom/melodix/music/PreviewPlayerMode;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/melodix/music/PreviewPlayerMode;->access$2700(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/melodix/music/PreviewPlayerMode$7$1;

    invoke-direct {v2, p0}, Lcom/melodix/music/PreviewPlayerMode$7$1;-><init>(Lcom/melodix/music/PreviewPlayerMode$7;)V

    invoke-virtual {v0, v1, v2}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 209
    goto :goto_0

    :catch_0
    move-exception v0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode$7;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerMode;->access$2400(Lcom/melodix/music/PreviewPlayerMode;)V

    .line 210
    :goto_0
    return-void

    .line 201
    :cond_2
    :goto_1
    return-void
.end method
