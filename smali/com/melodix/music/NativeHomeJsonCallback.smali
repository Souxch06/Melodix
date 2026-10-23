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

    move-object v0, p1
    check-cast v0, Ljava/lang/String;
    if-eqz v0, :done

    const-string v1, "null"
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-nez v1, :done

    invoke-virtual {v0}, Ljava/lang/String;->length()I
    move-result v1
    const/4 v2, 0x2
    if-le v1, v2, :done

    const/4 v1, 0x0
    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C
    move-result v1
    const/16 v2, 0x5b
    if-ne v1, v2, :done

    :try_start_0
    new-instance v1, Lorg/json/JSONArray;
    invoke-direct {v1, v0}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I
    move-result v2
    if-lez v2, :done

    iget-object v2, p0, Lcom/melodix/music/NativeHomeJsonCallback;->activity:Lcom/melodix/music/MainActivity;
    if-eqz v2, :done
    const-string v3, "home"
    invoke-virtual {v2, v3, v0}, Lcom/melodix/music/MainActivity;->postNativeUiData(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    :done
    return-void

    :catch_0
    move-exception v0
    return-void
.end method
