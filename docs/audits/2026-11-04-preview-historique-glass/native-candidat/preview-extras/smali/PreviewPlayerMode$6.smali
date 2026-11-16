.class Lcom/melodix/music/PreviewPlayerMode$6;
.super Ljava/lang/Object;
.source "PreviewPlayerMode.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerMode;->tryHiddenView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/melodix/music/PreviewPlayerMode;

.field private final synthetic val$g:J

.field private final synthetic val$request:Ljava/lang/String;

.field private final synthetic val$w:Landroid/webkit/WebView;


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerMode;JLjava/lang/String;Landroid/webkit/WebView;)V
    .locals 0

    .prologue
    .line 152
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerMode$6;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    iput-wide p2, p0, Lcom/melodix/music/PreviewPlayerMode$6;->val$g:J

    iput-object p4, p0, Lcom/melodix/music/PreviewPlayerMode$6;->val$request:Ljava/lang/String;

    iput-object p5, p0, Lcom/melodix/music/PreviewPlayerMode$6;->val$w:Landroid/webkit/WebView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/melodix/music/PreviewPlayerMode$6;)Lcom/melodix/music/PreviewPlayerMode;
    .locals 1

    .prologue
    .line 152
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode$6;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 153
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode$6;->val$g:J

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerMode$6;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerMode;->access$5(Lcom/melodix/music/PreviewPlayerMode;)J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode$6;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerMode;->access$23(Lcom/melodix/music/PreviewPlayerMode;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode$6;->val$request:Ljava/lang/String;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerMode$6;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerMode;->access$24(Lcom/melodix/music/PreviewPlayerMode;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 161
    :cond_0
    :goto_0
    return-void

    .line 154
    :cond_1
    :try_start_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode$6;->val$w:Landroid/webkit/WebView;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerMode$6;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    const/4 v2, 0x1

    invoke-static {v1, v2}, Lcom/melodix/music/PreviewPlayerMode;->access$28(Lcom/melodix/music/PreviewPlayerMode;Z)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/melodix/music/PreviewPlayerMode$6$1;

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerMode$6;->val$g:J

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerMode$6;->val$request:Ljava/lang/String;

    invoke-direct {v2, p0, v4, v5, v3}, Lcom/melodix/music/PreviewPlayerMode$6$1;-><init>(Lcom/melodix/music/PreviewPlayerMode$6;JLjava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 160
    :catch_0
    move-exception v0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode$6;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerMode;->access$30(Lcom/melodix/music/PreviewPlayerMode;)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode$6;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerMode;->access$1(Lcom/melodix/music/PreviewPlayerMode;)V

    goto :goto_0
.end method
