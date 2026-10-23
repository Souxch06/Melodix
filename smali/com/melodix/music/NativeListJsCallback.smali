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
    .locals 2

    check-cast p1, Ljava/lang/String;
    if-eqz p1, :done

    const-string v1, "null"
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-nez v1, :done
    const-string v1, "\"\""
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-nez v1, :done

    :try_start_0
    new-instance v0, Lorg/json/JSONTokener;
    invoke-direct {v0, p1}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V
    invoke-virtual {v0}, Lorg/json/JSONTokener;->nextValue()Ljava/lang/Object;
    move-result-object v0
    if-eqz v0, :done
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z
    move-result v1
    if-nez v1, :done

    iget-object v1, p0, Lcom/melodix/music/NativeListJsCallback;->activity:Lcom/melodix/music/MainActivity;
    if-eqz v1, :done
    invoke-virtual {v1, v0}, Lcom/melodix/music/MainActivity;->applyNativeListText(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    :done
    return-void

    :catch_0
    move-exception v0
    return-void
.end method
