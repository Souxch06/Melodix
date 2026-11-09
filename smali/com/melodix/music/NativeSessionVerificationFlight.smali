.class public final Lcom/melodix/music/NativeSessionVerificationFlight;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.field private final expectedGeneration:I
.method public constructor <init>(I)V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput p1, p0, Lcom/melodix/music/NativeSessionVerificationFlight;->expectedGeneration:I
    return-void
.end method
# Admission is UI-thread controlled; volatile fields permit safe readback by the JS bridge.
# Expiration is checked on admission. It does not abort requests or create evidence.
.field private static volatile generation:I = -0x1
.field private static volatile until:J
.method public static start()V
    .locals 4
    sget v0, Lcom/melodix/music/NativeSessionGate;->generation:I
    sput v0, Lcom/melodix/music/NativeSessionVerificationFlight;->generation:I
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J
    move-result-wide v0
    const-wide/16 v2, 0x3a98
    add-long/2addr v0, v2
    sput-wide v0, Lcom/melodix/music/NativeSessionVerificationFlight;->until:J
    # Wake only the button presentation at the bound; never touch gate/evidence.
    new-instance v0, Landroid/os/Handler;
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
    move-result-object v1
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
    new-instance v1, Lcom/melodix/music/NativeSessionVerificationFlight;
    sget v2, Lcom/melodix/music/NativeSessionVerificationFlight;->generation:I
    invoke-direct {v1, v2}, Lcom/melodix/music/NativeSessionVerificationFlight;-><init>(I)V
    const-wide/16 v2, 0x3a98
    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    return-void
.end method
.method public static busy()Z
    .locals 4
    # Returning from interactive login must be allowed to launch verification.
    sget-boolean v0, Lcom/melodix/music/NativeSessionGate;->loginActive:Z
    if-nez v0, :free
    sget v0, Lcom/melodix/music/NativeSessionVerificationFlight;->generation:I
    sget v1, Lcom/melodix/music/NativeSessionGate;->generation:I
    if-ne v0, v1, :free
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J
    move-result-wide v0
    sget-wide v2, Lcom/melodix/music/NativeSessionVerificationFlight;->until:J
    cmp-long v0, v0, v2
    if-gez v0, :free
    const/4 v0, 0x1
    return v0
    :free
    const/4 v0, 0x0
    return v0
.end method
.method public static finish(Ljava/lang/String;)V
    .locals 3
    :try_start
    new-instance v0, Lorg/json/JSONObject;
    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    const-string v1, "completed"
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :done
    const-string v1, "generation"
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I
    move-result v0
    sget v1, Lcom/melodix/music/NativeSessionVerificationFlight;->generation:I
    if-ne v0, v1, :done
    sget v1, Lcom/melodix/music/NativeSessionGate;->generation:I
    if-ne v0, v1, :done
    const-wide/16 v0, 0x0
    sput-wide v0, Lcom/melodix/music/NativeSessionVerificationFlight;->until:J
    invoke-static {}, Lcom/melodix/music/NativeSessionSurfaceExtras;->retryState()V
    :try_end
    .catch Lorg/json/JSONException; {:try_start .. :try_end} :bad
    :done
    return-void
    :bad
    move-exception v0
    return-void
.end method

.method public static fail(I)V
    .locals 2
    sget v0, Lcom/melodix/music/NativeSessionVerificationFlight;->generation:I
    if-ne p0, v0, :done
    sget v0, Lcom/melodix/music/NativeSessionGate;->generation:I
    if-ne p0, v0, :done
    const-wide/16 v0, 0x0
    sput-wide v0, Lcom/melodix/music/NativeSessionVerificationFlight;->until:J
    invoke-static {}, Lcom/melodix/music/NativeSessionSurfaceExtras;->retryState()V
    :done
    return-void
.end method

.method public final run()V
    .locals 2
    iget v0, p0, Lcom/melodix/music/NativeSessionVerificationFlight;->expectedGeneration:I
    sget v1, Lcom/melodix/music/NativeSessionVerificationFlight;->generation:I
    if-ne v0, v1, :done
    sget v1, Lcom/melodix/music/NativeSessionGate;->generation:I
    if-ne v0, v1, :done
    invoke-static {}, Lcom/melodix/music/NativeSessionSurfaceExtras;->retryState()V
    :done
    return-void
.end method
