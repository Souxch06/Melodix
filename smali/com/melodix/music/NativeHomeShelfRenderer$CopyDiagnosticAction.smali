.class public final Lcom/melodix/music/NativeHomeShelfRenderer$CopyDiagnosticAction;
.super Ljava/lang/Object;
.implements Landroid/view/View$OnClickListener;


.field private final activity:Lcom/melodix/music/MainActivity;


.method public constructor <init>(Lcom/melodix/music/MainActivity;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/melodix/music/NativeHomeShelfRenderer$CopyDiagnosticAction;->activity:Lcom/melodix/music/MainActivity;
    return-void
.end method


.method public final onClick(Landroid/view/View;)V
    .locals 1

    # Delegates to the existing header-chip handler so the app keeps exactly
    # one diagnostic-copy path (same text, same toast, same redaction rules).
    iget-object v0, p0, Lcom/melodix/music/NativeHomeShelfRenderer$CopyDiagnosticAction;->activity:Lcom/melodix/music/MainActivity;
    if-eqz v0, :done
    invoke-virtual {v0, p1}, Lcom/melodix/music/MainActivity;->onNativeDiagCopyClick(Landroid/view/View;)V

    :done
    return-void
.end method
