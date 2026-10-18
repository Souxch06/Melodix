.class public final Lcom/melodix/music/RuntimeDiagnostic$CopyListener;
.super Ljava/lang/Object;
.implements Landroid/content/DialogInterface$OnClickListener;


.field private final activity:Landroid/app/Activity;
.field private final json:Ljava/lang/String;


.method public constructor <init>(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/melodix/music/RuntimeDiagnostic$CopyListener;->activity:Landroid/app/Activity;
    iput-object p2, p0, Lcom/melodix/music/RuntimeDiagnostic$CopyListener;->json:Ljava/lang/String;
    return-void
.end method

.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 4

    iget-object v0, p0, Lcom/melodix/music/RuntimeDiagnostic$CopyListener;->activity:Landroid/app/Activity;
    if-eqz v0, :return
    iget-object v1, p0, Lcom/melodix/music/RuntimeDiagnostic$CopyListener;->json:Ljava/lang/String;
    if-eqz v1, :return

    const-string v2, "clipboard"
    invoke-virtual {v0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;
    move-result-object v2
    if-eqz v2, :return
    check-cast v2, Landroid/content/ClipboardManager;
    const-string v3, "Melodix runtime diagnostic"
    invoke-static {v3, v1}, Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;
    move-result-object v3
    invoke-virtual {v2, v3}, Landroid/content/ClipboardManager;->setPrimaryClip(Landroid/content/ClipData;)V

    const-string v2, "JSON copié dans le presse-papiers"
    const/4 v3, 0x0
    invoke-static {v0, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;
    move-result-object v2
    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    :return
    return-void
.end method
