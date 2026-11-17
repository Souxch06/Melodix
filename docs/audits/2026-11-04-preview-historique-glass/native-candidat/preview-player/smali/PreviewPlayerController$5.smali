.class Lcom/melodix/music/PreviewPlayerController$5;
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

    .prologue
    .line 755
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController$5;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLongClick(Landroid/view/View;)Z
    .locals 1

    .prologue
    .line 756
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$5;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-virtual {v0}, Lcom/melodix/music/PreviewPlayerController;->showDiagnostics()V

    const/4 v0, 0x1

    return v0
.end method
