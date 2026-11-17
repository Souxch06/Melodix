.class Lcom/melodix/music/PreviewPlayerController$4;
.super Ljava/lang/Object;
.source "PreviewPlayerController.java"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerController;->attachAbout(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/melodix/music/PreviewPlayerController;


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerController;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 655
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController$4;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLongClick(Landroid/view/View;)Z
    .locals 0

    .line 656
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerController$4;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-virtual {p1}, Lcom/melodix/music/PreviewPlayerController;->showDiagnostics()V

    const/4 p1, 0x1

    return p1
.end method
