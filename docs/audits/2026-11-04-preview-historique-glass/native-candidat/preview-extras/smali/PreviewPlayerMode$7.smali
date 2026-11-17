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

.field private final synthetic val$g:J

.field private final synthetic val$n:I


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerMode;JI)V
    .locals 0

    .prologue
    .line 181
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerMode$7;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    iput-wide p2, p0, Lcom/melodix/music/PreviewPlayerMode$7;->val$g:J

    iput p4, p0, Lcom/melodix/music/PreviewPlayerMode$7;->val$n:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/melodix/music/PreviewPlayerMode$7;)Lcom/melodix/music/PreviewPlayerMode;
    .locals 1

    .prologue
    .line 181
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode$7;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 182
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode$7;->val$g:J

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerMode$7;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerMode;->access$5(Lcom/melodix/music/PreviewPlayerMode;)J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode$7;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerMode;->access$12(Lcom/melodix/music/PreviewPlayerMode;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 191
    :cond_0
    :goto_0
    return-void

    .line 183
    :cond_1
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode$7;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerMode;->access$29(Lcom/melodix/music/PreviewPlayerMode;)Landroid/webkit/WebView;

    move-result-object v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode$7;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerMode;->access$27(Lcom/melodix/music/PreviewPlayerMode;)V

    goto :goto_0

    .line 184
    :cond_2
    :try_start_0
    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerMode$7;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    const-string v2, "poll"

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerMode$7;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v3}, Lcom/melodix/music/PreviewPlayerMode;->access$14(Lcom/melodix/music/PreviewPlayerMode;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/melodix/music/PreviewPlayerMode;->access$30(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/melodix/music/PreviewPlayerMode$7$1;

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerMode$7;->val$g:J

    iget v3, p0, Lcom/melodix/music/PreviewPlayerMode$7;->val$n:I

    invoke-direct {v2, p0, v4, v5, v3}, Lcom/melodix/music/PreviewPlayerMode$7$1;-><init>(Lcom/melodix/music/PreviewPlayerMode$7;JI)V

    invoke-virtual {v0, v1, v2}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 190
    :catch_0
    move-exception v0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode$7;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerMode;->access$27(Lcom/melodix/music/PreviewPlayerMode;)V

    goto :goto_0
.end method
