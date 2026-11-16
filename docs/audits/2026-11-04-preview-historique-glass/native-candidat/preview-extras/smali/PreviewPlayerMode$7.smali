.class Lcom/melodix/music/PreviewPlayerMode$7;
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


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerMode;JLjava/lang/String;)V
    .locals 0

    .prologue
    .line 162
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerMode$7;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    iput-wide p2, p0, Lcom/melodix/music/PreviewPlayerMode$7;->val$g:J

    iput-object p4, p0, Lcom/melodix/music/PreviewPlayerMode$7;->val$request:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 162
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode$7;->val$g:J

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerMode$7;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerMode;->access$5(Lcom/melodix/music/PreviewPlayerMode;)J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode$7;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerMode;->access$23(Lcom/melodix/music/PreviewPlayerMode;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode$7;->val$request:Ljava/lang/String;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerMode$7;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerMode;->access$24(Lcom/melodix/music/PreviewPlayerMode;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode$7;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerMode;->access$30(Lcom/melodix/music/PreviewPlayerMode;)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode$7;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerMode;->access$1(Lcom/melodix/music/PreviewPlayerMode;)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode$7;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-virtual {v0}, Lcom/melodix/music/PreviewPlayerMode;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "Contr\u00f4le introuvable : page sans r\u00e9ponse"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    :cond_0
    return-void
.end method
