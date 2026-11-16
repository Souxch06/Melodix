.class Lcom/melodix/music/PreviewPlayerChrome$2;
.super Ljava/lang/Object;
.source "PreviewPlayerChrome.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/melodix/music/PreviewPlayerChrome;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/melodix/music/PreviewPlayerChrome;


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerChrome;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 63
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerChrome$2;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 63
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome$2;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerChrome;->access$1100(Lcom/melodix/music/PreviewPlayerChrome;)V

    return-void
.end method
