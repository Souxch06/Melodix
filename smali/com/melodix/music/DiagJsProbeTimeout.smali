.class public final Lcom/melodix/music/DiagJsProbeTimeout;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;

# Always-journaling terminal marker for the evaluateJavascript delivery probes:
# "js-cb tmo <id> <tag> ans <0|1>" is written NO MATTER WHAT (ans=1 when a
# probe callback already answered). Silence is impossible: if this line is
# missing from a report, the runnable itself never ran. Never gates on shared
# state.

.field private final id:I
.field private final tag:Ljava/lang/String;

.method public constructor <init>(I)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/melodix/music/DiagJsProbeTimeout;->id:I

    const-string v0, "-"
    iput-object v0, p0, Lcom/melodix/music/DiagJsProbeTimeout;->tag:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(ILjava/lang/String;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/melodix/music/DiagJsProbeTimeout;->id:I

    if-eqz p2, :tag_default
    iput-object p2, p0, Lcom/melodix/music/DiagJsProbeTimeout;->tag:Ljava/lang/String;
    goto :tag_ready

    :tag_default
    const-string v0, "-"
    iput-object v0, p0, Lcom/melodix/music/DiagJsProbeTimeout;->tag:Ljava/lang/String;

    :tag_ready
    return-void
.end method

.method public final run()V
    .locals 3

    :try_start_tmo
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "js-cb tmo "
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/melodix/music/DiagJsProbeTimeout;->id:I
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " "
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/melodix/music/DiagJsProbeTimeout;->tag:Ljava/lang/String;
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " ans "
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-boolean v2, Lcom/melodix/music/DiagCounters;->probeAnswered:Z
    if-eqz v2, :tmo_ans0
    const-string v1, "1"
    goto :tmo_ans_done

    :tmo_ans0
    const-string v1, "0"

    :tmo_ans_done
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    invoke-static {v1}, Lcom/melodix/music/DiagCounters;->event(Ljava/lang/String;)V
    :try_end_tmo
    .catch Ljava/lang/Throwable; {:try_start_tmo .. :try_end_tmo} :catch_tmo

    return-void

    :catch_tmo
    move-exception v0
    invoke-static {v0}, Lcom/melodix/music/NativeCrashGuard;->record(Ljava/lang/Throwable;)V
    return-void
.end method
