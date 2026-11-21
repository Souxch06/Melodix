.class public final Lcom/melodix/music/NativeSessionGetterProbe;
.super Ljava/lang/Object;
.implements Landroid/webkit/ValueCallback;

# A callback can report missing/broken JS interfaces without using that interface.
.field private final view:Ljava/lang/ref/WeakReference;

.method private constructor <init>(Landroid/webkit/WebView;)V
    .locals 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object v0, p0, Lcom/melodix/music/NativeSessionGetterProbe;->view:Ljava/lang/ref/WeakReference;
    return-void
.end method

# Called on main thread, only as debug observation, never as proof or retry.
.method public static start(Landroid/content/Context;Landroid/webkit/WebView;)V
    .locals 2
    :try_start
    if-eqz p1, :done
    invoke-static {p0}, Lcom/melodix/music/NativeSessionDebug;->enabled(Landroid/content/Context;)Z
    move-result v0
    if-eqz v0, :done
    new-instance v0, Lcom/melodix/music/NativeSessionGetterProbe;
    invoke-direct {v0, p1}, Lcom/melodix/music/NativeSessionGetterProbe;-><init>(Landroid/webkit/WebView;)V
    const-string v1, "(function(){var origin=location.protocol==='https:'&&location.hostname==='open.spotify.com'&&(!location.port||location.port==='443')?'https://open.spotify.com':'other';var p=location.pathname,route=p==='/'?'root':p==='/app'?'app':p==='/search'?'search':'other',load=/^(loading|interactive|complete)$/.test(document.readyState)?document.readyState:'unknown',frame=window.top===window?'top':'child';function typ(n){try{if(origin!=='https://open.spotify.com'||frame!=='top'||!window.AndBridge||typeof window.AndBridge[n]!=='function')return 'absent null=no';var v=window.AndBridge[n]();return typeof v+' null='+(v===null?'yes':'no')}catch(_){return 'exception null=no'}}function line(n,t){return 'getter='+n+' type='+t+' origin='+origin+' route='+route+' load='+load+' frame='+frame}return {a:line('number',typ('getSessionGeneration')),b:line('text',typ('getSessionGenerationText'))}})()"
    invoke-virtual {p1, v1, v0}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    :try_end
    .catch Ljava/lang/Throwable; {:try_start .. :try_end} :error
    :done
    return-void
    :error
    move-exception v0
    return-void
.end method

.method public final onReceiveValue(Ljava/lang/Object;)V
    .locals 4
    :try_start
    instance-of v0, p1, Ljava/lang/String;
    if-eqz v0, :done
    check-cast p1, Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->length()I
    move-result v0
    const/16 v1, 0x200
    if-gt v0, v1, :done
    iget-object v0, p0, Lcom/melodix/music/NativeSessionGetterProbe;->view:Ljava/lang/ref/WeakReference;
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroid/webkit/WebView;
    if-eqz v0, :done
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;
    move-result-object v0
    new-instance v1, Lorg/json/JSONObject;
    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    const-string v2, "a"
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
    invoke-static {v0, v2}, Lcom/melodix/music/NativeSessionDebug;->record(Landroid/content/Context;Ljava/lang/String;)V
    const-string v2, "b"
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
    invoke-static {v0, v2}, Lcom/melodix/music/NativeSessionDebug;->record(Landroid/content/Context;Ljava/lang/String;)V
    :try_end
    .catch Ljava/lang/Throwable; {:try_start .. :try_end} :error
    :done
    return-void
    :error
    move-exception v0
    return-void
.end method
