.class final Lcom/melodix/music/NativeListJsCallback;
.super Ljava/lang/Object;
.implements Landroid/webkit/ValueCallback;

.field private final activity:Lcom/melodix/music/MainActivity;

.method public constructor <init>(Lcom/melodix/music/MainActivity;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/melodix/music/NativeListJsCallback;->activity:Lcom/melodix/music/MainActivity;
    return-void
.end method

.method public final onReceiveValue(Ljava/lang/Object;)V
    .locals 3

    :try_start_0
    if-eqz p1, :done
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;
    move-result-object v0
    if-eqz v0, :done
    const-string v1, "null"
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :done
    const-string v1, "\"\""
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :done

    new-instance v1, Lorg/json/JSONTokener;
    invoke-direct {v1, v0}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V
    invoke-virtual {v1}, Lorg/json/JSONTokener;->nextValue()Ljava/lang/Object;
    move-result-object v1
    if-eqz v1, :done
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z
    move-result v1
    if-eqz v1, :done

    iget-object v2, p0, Lcom/melodix/music/NativeListJsCallback;->activity:Lcom/melodix/music/MainActivity;
    if-eqz v2, :done
    invoke-virtual {v2, v0}, Lcom/melodix/music/MainActivity;->applyNativeListText(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :done

    :done
    return-void
.end method
