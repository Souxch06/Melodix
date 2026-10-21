.class final Lcom/melodix/music/NativeListPaintRunnable;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;

.field private final activity:Lcom/melodix/music/MainActivity;
.field private final text:Ljava/lang/String;

.method public constructor <init>(Lcom/melodix/music/MainActivity;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/melodix/music/NativeListPaintRunnable;->activity:Lcom/melodix/music/MainActivity;
    iput-object p2, p0, Lcom/melodix/music/NativeListPaintRunnable;->text:Ljava/lang/String;
    return-void
.end method

.method public final run()V
    .locals 4

    :try_start_0
    iget-object v0, p0, Lcom/melodix/music/NativeListPaintRunnable;->activity:Lcom/melodix/music/MainActivity;
    if-eqz v0, :done
    iget-object v1, p0, Lcom/melodix/music/NativeListPaintRunnable;->text:Ljava/lang/String;
    invoke-virtual {v0, v1}, Lcom/melodix/music/MainActivity;->applyNativeListText(Ljava/lang/String;)V

    const v2, 0x7f090235
    invoke-virtual {v0, v2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v3
    if-eqz v3, :done
    instance-of v2, v3, Landroid/view/ViewGroup;
    if-eqz v2, :done
    check-cast v3, Landroid/view/ViewGroup;
    invoke-static {v0, v3, v1}, Lcom/melodix/music/NativeRowList;->fillPlain(Landroid/content/Context;Landroid/view/ViewGroup;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :done

    :done
    return-void
.end method
