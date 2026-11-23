.class Lcom/melodix/music/PreviewPlayerController$18;
.super Ljava/lang/Object;
.source "PreviewPlayerController.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerController;->showDiagnosticsNow()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/melodix/music/PreviewPlayerController;

.field final synthetic val$a:Landroid/app/Activity;

.field final synthetic val$report:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerController;Landroid/app/Activity;Ljava/lang/String;)V
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

    .line 1411
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController$18;->this$0:Lcom/melodix/music/PreviewPlayerController;

    iput-object p2, p0, Lcom/melodix/music/PreviewPlayerController$18;->val$a:Landroid/app/Activity;

    iput-object p3, p0, Lcom/melodix/music/PreviewPlayerController$18;->val$report:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    .line 1413
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerController$18;->val$a:Landroid/app/Activity;

    const-string p2, "clipboard"

    invoke-virtual {p1, p2}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    .line 1414
    instance-of p2, p1, Landroid/content/ClipboardManager;

    if-eqz p2, :cond_0

    check-cast p1, Landroid/content/ClipboardManager;

    const-string p2, "Diagnostic Preview"

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$18;->val$report:Ljava/lang/String;

    invoke-static {p2, v0}, Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/content/ClipboardManager;->setPrimaryClip(Landroid/content/ClipData;)V

    .line 1415
    :cond_0
    return-void
.end method
