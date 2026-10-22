.class final Lcom/melodix/music/NativeHomeJsonCallback;
.super Ljava/lang/Object;
.implements Landroid/webkit/ValueCallback;

.field private final activity:Lcom/melodix/music/MainActivity;

.method public constructor <init>(Lcom/melodix/music/MainActivity;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/melodix/music/NativeHomeJsonCallback;->activity:Lcom/melodix/music/MainActivity;
    return-void
.end method

.method public final onReceiveValue(Ljava/lang/Object;)V
    .locals 4

    if-eqz p1, :done
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;
    move-result-object v0
    if-eqz v0, :done
    const-string v1, "null"
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :done

    :try_start_0
    new-instance v1, Lorg/json/JSONTokener;
    invoke-direct {v1, v0}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V
    invoke-virtual {v1}, Lorg/json/JSONTokener;->nextValue()Ljava/lang/Object;
    move-result-object v1
    if-eqz v1, :try_ok

    instance-of v2, v1, Lorg/json/JSONArray;
    if-eqz v2, :as_string
    check-cast v1, Lorg/json/JSONArray;
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I
    move-result v2
    if-lez v2, :try_ok
    invoke-virtual {v1}, Lorg/json/JSONArray;->toString()Ljava/lang/String;
    move-result-object v0
    goto :apply

    :as_string
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-virtual {v0}, Ljava/lang/String;->length()I
    move-result v2
    const/4 v3, 0x2
    if-le v2, v3, :try_ok

    :apply
    iget-object v2, p0, Lcom/melodix/music/NativeHomeJsonCallback;->activity:Lcom/melodix/music/MainActivity;
    if-eqz v2, :try_ok
    const-string v3, "home"
    invoke-virtual {v2, v3, v0}, Lcom/melodix/music/MainActivity;->postNativeUiData(Ljava/lang/String;Ljava/lang/String;)V

    :try_ok
    nop
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
    goto :done

    :catch_0
    move-exception v0

    :done
    return-void
.end method
