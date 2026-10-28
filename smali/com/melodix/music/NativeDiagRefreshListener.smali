.class public final Lcom/melodix/music/NativeDiagRefreshListener;
.super Ljava/lang/Object;
.implements Landroid/content/DialogInterface$OnClickListener;


.field private final activity:Landroid/app/Activity;


.method public constructor <init>(Landroid/app/Activity;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/melodix/music/NativeDiagRefreshListener;->activity:Landroid/app/Activity;

    return-void
.end method

.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    iget-object v0, p0, Lcom/melodix/music/NativeDiagRefreshListener;->activity:Landroid/app/Activity;

    if-eqz v0, :done

    instance-of p2, v0, Lcom/melodix/music/MainActivity;

    if-eqz p2, :done

    check-cast v0, Lcom/melodix/music/MainActivity;

    invoke-virtual {v0}, Lcom/melodix/music/MainActivity;->openNativeDiagnostics()V

    :done
    return-void
.end method
