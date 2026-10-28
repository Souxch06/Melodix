.class public final Lcom/melodix/music/NativeDiagLongClickListener;
.super Ljava/lang/Object;
.implements Landroid/view/View$OnLongClickListener;


.field private final activity:Lcom/melodix/music/MainActivity;


.method public constructor <init>(Lcom/melodix/music/MainActivity;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/melodix/music/NativeDiagLongClickListener;->activity:Lcom/melodix/music/MainActivity;

    return-void
.end method

.method public onLongClick(Landroid/view/View;)Z
    .locals 1

    iget-object v0, p0, Lcom/melodix/music/NativeDiagLongClickListener;->activity:Lcom/melodix/music/MainActivity;

    if-eqz v0, :done

    invoke-virtual {v0}, Lcom/melodix/music/MainActivity;->openNativeDiagnostics()V

    :done
    const/4 v0, 0x1

    return v0
.end method
