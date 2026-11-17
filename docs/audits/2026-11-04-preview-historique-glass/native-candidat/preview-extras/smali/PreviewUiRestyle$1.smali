.class Lcom/melodix/music/PreviewUiRestyle$1;
.super Ljava/lang/Object;
.source "PreviewUiRestyle.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/melodix/music/PreviewUiRestyle;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/melodix/music/PreviewUiRestyle;


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewUiRestyle;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 35
    iput-object p1, p0, Lcom/melodix/music/PreviewUiRestyle$1;->this$0:Lcom/melodix/music/PreviewUiRestyle;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 35
    iget-object v0, p0, Lcom/melodix/music/PreviewUiRestyle$1;->this$0:Lcom/melodix/music/PreviewUiRestyle;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewUiRestyle;->access$002(Lcom/melodix/music/PreviewUiRestyle;Z)Z

    iget-object v0, p0, Lcom/melodix/music/PreviewUiRestyle$1;->this$0:Lcom/melodix/music/PreviewUiRestyle;

    invoke-static {v0}, Lcom/melodix/music/PreviewUiRestyle;->access$100(Lcom/melodix/music/PreviewUiRestyle;)V

    return-void
.end method
