.class public final Lcom/melodix/music/NativeSeekHandler;
.super Ljava/lang/Object;
.implements Landroid/view/View$OnTouchListener;

# Touch handler for the mini and full player progress bars. A tap (or a drag
# that ends) on a bar seeks the REAL playback engine through the shell helper
# window.__sfSeekFraction, which drives Spotify's own progress control. The
# handler never simulates progress: it only relays the requested fraction.

.field private final activity:Lcom/melodix/music/MainActivity;

.method public constructor <init>(Lcom/melodix/music/MainActivity;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/melodix/music/NativeSeekHandler;->activity:Lcom/melodix/music/MainActivity;
    return-void
.end method

.method public static attach(Lcom/melodix/music/MainActivity;)V
    .locals 3

    if-nez p0, :attach_done

    new-instance v0, Lcom/melodix/music/NativeSeekHandler;
    invoke-direct {v0, p0}, Lcom/melodix/music/NativeSeekHandler;-><init>(Lcom/melodix/music/MainActivity;)V

    const v1, 0x7f09023d
    invoke-virtual {p0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v2
    if-eqz v2, :attach_mini
    invoke-virtual {v2, v0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    :attach_mini
    const v1, 0x7f09024d
    invoke-virtual {p0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v2
    if-eqz v2, :attach_done
    invoke-virtual {v2, v0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    :attach_done
    return-void
.end method

.method public final onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 6

    # v1 is the consumed flag: initialized on EVERY path (entry and catch), so
    # the type lattice never merges UNINIT into the return register.
    const/4 v1, 0x1

    :try_start_touch
    if-eqz p1, :touch_unhandled
    if-eqz p2, :touch_unhandled

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I
    move-result v0

    if-ne v0, v1, :touch_consumed

    # ACTION_UP: seek to the touched fraction of the bar.
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F
    move-result v2
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I
    move-result v3
    if-gtz v3, :touch_consumed
    int-to-float v4, v3
    div-float v4, v2, v4

    # Clamp the fraction into [0, 1]; a NaN comparison falls back to 0.
    const/4 v5, 0x0
    cmpl-float v2, v4, v5
    if-gez v2, :clamp_high
    move v4, v5

    :clamp_high
    const/high16 v2, 0x3f800000
    cmpg-float v3, v4, v2
    if-lez v3, :clamp_done
    move v4, v2

    :clamp_done
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V
    const-string v3, "(function(){try{if(window.__sfSeekFraction){window.__sfSeekFraction("
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;
    move-result-object v2
    const-string v3, ");}}catch(e){}})();"
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v2
    iget-object v3, p0, Lcom/melodix/music/NativeSeekHandler;->activity:Lcom/melodix/music/MainActivity;
    if-eqz v3, :touch_consumed
    invoke-virtual {v3, v2}, Lcom/melodix/music/MainActivity;->runNativeJavascript(Ljava/lang/String;)V

    :touch_consumed
    :try_end_touch
    .catch Ljava/lang/Throwable; {:try_start_touch .. :try_end_touch} :catch_touch
    return v1

    :catch_touch
    move-exception v0
    invoke-static {v0}, Lcom/melodix/music/NativeCrashGuard;->record(Ljava/lang/Throwable;)V
    const/4 v1, 0x1
    return v1

    :touch_unhandled
    const/4 v0, 0x0
    return v0
.end method
