.class public final Lcom/melodix/music/DiagCounters;
.super Ljava/lang/Object;

# Lightweight runtime counters for the "Diagnostic Melodix" screen. They record
# what the native pipeline really does with media payloads (admission, gate,
# dispatch) so a report can show WHERE rows disappear. Never stores personal
# content or tokens: counts and bounded event lines only.

.field public static paintIn:I
.field public static paintAccepted:I
.field public static paintEmpty:I
.field public static dispatchIn:I
.field public static dispatchDropped:I
.field public static mediaRendered:I
.field public static mediaDropped:I

# Renderer/JS-channel diagnosis: rendererGone is set when onRenderProcessGone
# fires and cleared when a page finishes loading; probeAnswered tracks whether
# the last evaluateJavascript ValueCallback probe answered.
.field public static volatile rendererGone:Z
.field public static volatile probeAnswered:Z
.field public static probeSeq:I

# The WebView that is actually loading pages (registered by c91 on every
# onPageStarted/onPageFinished). Native->JS traffic must target THIS instance:
# activity.G / AppSingleton.w can lag behind after recoveries.
.field public static volatile pageView:Ljava/lang/ref/WeakReference;

# Bounded library-state snapshots pushed by the page (AndBridge.onLibDiagState)
# and the page-alive / touch-probe throttles for the dead native->JS channel
# investigation.
.field private static libStateText:Ljava/lang/String;
.field private static libStateLast:Ljava/lang/String;
.field private static volatile pageProbeSentAt:J
.field private static volatile lastTouchProbeMs:J
.field private static volatile deviceLogged:Z

.field private static logText:Ljava/lang/String;
.field private static logLines:I

.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    sput v0, Lcom/melodix/music/DiagCounters;->paintIn:I

    sput v0, Lcom/melodix/music/DiagCounters;->paintAccepted:I

    sput v0, Lcom/melodix/music/DiagCounters;->paintEmpty:I

    sput v0, Lcom/melodix/music/DiagCounters;->dispatchIn:I

    sput v0, Lcom/melodix/music/DiagCounters;->dispatchDropped:I

    sput v0, Lcom/melodix/music/DiagCounters;->mediaRendered:I

    sput v0, Lcom/melodix/music/DiagCounters;->mediaDropped:I

    sput v0, Lcom/melodix/music/DiagCounters;->logLines:I

    const-string v0, ""

    sput-object v0, Lcom/melodix/music/DiagCounters;->logText:Ljava/lang/String;

    return-void
.end method

.method public static declared-synchronized event(Ljava/lang/String;)V
    .locals 4

    sget v0, Lcom/melodix/music/DiagCounters;->logLines:I

    const/16 v1, 0xc8

    if-gt v0, v1, :event_done

    sget-object v0, Lcom/melodix/music/DiagCounters;->logText:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x1770

    if-le v0, v1, :event_append

    :event_done
    return-void

    :event_append
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/melodix/music/DiagCounters;->logText:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz p0, :event_tail

    const-string v1, "\\s+"

    const-string v2, " "

    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x80

    invoke-static {v1, v2}, Lcom/melodix/music/DiagCounters;->clip(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :event_tail
    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/melodix/music/DiagCounters;->logText:Ljava/lang/String;

    sget v0, Lcom/melodix/music/DiagCounters;->logLines:I

    add-int/lit8 v0, v0, 0x1

    sput v0, Lcom/melodix/music/DiagCounters;->logLines:I

    return-void
.end method

.method private static clip(Ljava/lang/String;I)Ljava/lang/String;
    .locals 1

    if-nez p0, :clip_ok

    const-string v0, ""

    return-object v0

    :clip_ok
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-gt v0, p1, :clip_cut

    return-object p0

    :clip_cut
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static paintIn(I)V
    .locals 1

    sget v0, Lcom/melodix/music/DiagCounters;->paintIn:I

    add-int/2addr v0, p0

    sput v0, Lcom/melodix/music/DiagCounters;->paintIn:I

    return-void
.end method

.method public static paintAccepted(I)V
    .locals 2

    sget v0, Lcom/melodix/music/DiagCounters;->paintAccepted:I

    add-int/2addr v0, p0

    sput v0, Lcom/melodix/music/DiagCounters;->paintAccepted:I

    if-gtz p0, :paint_done

    sget v0, Lcom/melodix/music/DiagCounters;->paintEmpty:I

    const/4 v1, 0x1

    add-int/2addr v0, v1

    sput v0, Lcom/melodix/music/DiagCounters;->paintEmpty:I

    :paint_done
    return-void
.end method

.method public static paintEmpty()V
    .locals 2

    sget v0, Lcom/melodix/music/DiagCounters;->paintEmpty:I

    const/4 v1, 0x1

    add-int/2addr v0, v1

    sput v0, Lcom/melodix/music/DiagCounters;->paintEmpty:I

    return-void
.end method

.method public static dispatchIn()V
    .locals 2

    sget v0, Lcom/melodix/music/DiagCounters;->dispatchIn:I

    const/4 v1, 0x1

    add-int/2addr v0, v1

    sput v0, Lcom/melodix/music/DiagCounters;->dispatchIn:I

    return-void
.end method

.method public static dispatchDropped()V
    .locals 2

    sget v0, Lcom/melodix/music/DiagCounters;->dispatchDropped:I

    const/4 v1, 0x1

    add-int/2addr v0, v1

    sput v0, Lcom/melodix/music/DiagCounters;->dispatchDropped:I

    return-void
.end method

.method public static mediaRendered()V
    .locals 2

    sget v0, Lcom/melodix/music/DiagCounters;->mediaRendered:I

    const/4 v1, 0x1

    add-int/2addr v0, v1

    sput v0, Lcom/melodix/music/DiagCounters;->mediaRendered:I

    return-void
.end method

.method public static mediaDropped()V
    .locals 2

    sget v0, Lcom/melodix/music/DiagCounters;->mediaDropped:I

    const/4 v1, 0x1

    add-int/2addr v0, v1

    sput v0, Lcom/melodix/music/DiagCounters;->mediaDropped:I

    return-void
.end method

.method public static declared-synchronized readJson()Ljava/lang/String;
    .locals 3

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "{\"paintIn\":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v2, Lcom/melodix/music/DiagCounters;->paintIn:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ",\"paintAccepted\":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v2, Lcom/melodix/music/DiagCounters;->paintAccepted:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ",\"paintEmpty\":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v2, Lcom/melodix/music/DiagCounters;->paintEmpty:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ",\"dispatchIn\":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v2, Lcom/melodix/music/DiagCounters;->dispatchIn:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ",\"dispatchDropped\":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v2, Lcom/melodix/music/DiagCounters;->dispatchDropped:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ",\"mediaRendered\":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v2, Lcom/melodix/music/DiagCounters;->mediaRendered:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ",\"mediaDropped\":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v2, Lcom/melodix/music/DiagCounters;->mediaDropped:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "}"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method


.method public static declared-synchronized readReport()Ljava/lang/String;
    .locals 4

    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Compteurs pipeline (depuis ce démarrage):\n"
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "- affichage: entré="
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    sget v2, Lcom/melodix/music/DiagCounters;->paintIn:I
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v1, " accepté="
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    sget v2, Lcom/melodix/music/DiagCounters;->paintAccepted:I
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v1, " vide="
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    sget v2, Lcom/melodix/music/DiagCounters;->paintEmpty:I
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v1, "\n"
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "- transmission: entré="
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    sget v2, Lcom/melodix/music/DiagCounters;->dispatchIn:I
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v1, " rejeté="
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    sget v2, Lcom/melodix/music/DiagCounters;->dispatchDropped:I
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v1, "\n"
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "- canal media: affiché="
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    sget v2, Lcom/melodix/music/DiagCounters;->mediaRendered:I
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v1, " rejeté="
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    sget v2, Lcom/melodix/music/DiagCounters;->mediaDropped:I
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v1, "\n"
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "Journal (extrait borné):\n"
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Lcom/melodix/music/DiagCounters;->readLog()Ljava/lang/String;
    move-result-object v2
    if-eqz v2, :report_no_log
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z
    move-result v3
    if-nez v3, :report_no_log
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    goto :report_done

    :report_no_log
    const-string v1, "aucun événement"
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :report_done
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    return-object v1
.end method

.method public static declared-synchronized readLog()Ljava/lang/String;
    .locals 3

    sget-object v1, Lcom/melodix/music/DiagCounters;->logText:Ljava/lang/String;

    if-nez v1, :log_ready

    const-string v1, ""

    :log_ready
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "["

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v1}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "]"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static markRendererGone()V
    .locals 1

    const/4 v0, 0x1
    sput-boolean v0, Lcom/melodix/music/DiagCounters;->rendererGone:Z
    return-void
.end method

.method public static markWebviewReady()V
    .locals 1

    const/4 v0, 0x0
    sput-boolean v0, Lcom/melodix/music/DiagCounters;->rendererGone:Z
    return-void
.end method

.method public static nextProbeId()I
    .locals 2

    sget v0, Lcom/melodix/music/DiagCounters;->probeSeq:I
    add-int/lit8 v0, v0, 0x1
    sput v0, Lcom/melodix/music/DiagCounters;->probeSeq:I
    const/4 v1, 0x0
    sput-boolean v1, Lcom/melodix/music/DiagCounters;->probeAnswered:Z
    return v0
.end method

.method public static answerProbe()V
    .locals 1

    const/4 v0, 0x1
    sput-boolean v0, Lcom/melodix/music/DiagCounters;->probeAnswered:Z
    return-void
.end method

.method public static probePending()Z
    .locals 1

    sget-boolean v0, Lcom/melodix/music/DiagCounters;->probeAnswered:Z
    if-eqz v0, :pending_no
    const/4 v0, 0x0
    return v0

    :pending_no
    const/4 v0, 0x1
    return v0
.end method

.method public static setPageView(Landroid/webkit/WebView;)V
    .locals 1

    if-eqz p0, :spv_clear
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v0, Lcom/melodix/music/DiagCounters;->pageView:Ljava/lang/ref/WeakReference;
    return-void

    :spv_clear
    const/4 v0, 0x0
    sput-object v0, Lcom/melodix/music/DiagCounters;->pageView:Ljava/lang/ref/WeakReference;
    return-void
.end method

.method public static getPageView()Landroid/webkit/WebView;
    .locals 1

    sget-object v0, Lcom/melodix/music/DiagCounters;->pageView:Ljava/lang/ref/WeakReference;
    if-eqz v0, :gpv_none
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroid/webkit/WebView;
    return-object v0

    :gpv_none
    const/4 v0, 0x0
    return-object v0
.end method

.method public static libState(Ljava/lang/String;)V
    .locals 4

    # The page is alive when it pushes: keep the probe honest.
    invoke-static {}, Lcom/melodix/music/DiagCounters;->notePageEvent()V

    if-eqz p0, :ls_done

    const-string v0, "\\s+"
    const-string v1, " "
    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0

    const-string v1, "[^A-Za-z0-9 {}\\[\\]\",.:=+()/_-]"
    const-string v2, ""
    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0

    const/16 v1, 0x190
    invoke-static {v0, v1}, Lcom/melodix/music/DiagCounters;->clip(Ljava/lang/String;I)Ljava/lang/String;
    move-result-object v0

    # Identical consecutive snapshots are skipped entirely so a long session
    # cannot fill the bounded journal/store with repeats.
    sget-object v1, Lcom/melodix/music/DiagCounters;->libStateLast:Ljava/lang/String;
    if-eqz v1, :ls_keep
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-nez v1, :ls_done
    :ls_keep
    sput-object v0, Lcom/melodix/music/DiagCounters;->libStateLast:Ljava/lang/String;

    sget-object v1, Lcom/melodix/music/DiagCounters;->libStateText:Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V
    if-eqz v1, :ls_tail
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v3, "\n"
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :ls_tail
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1

    # Bounded store: keep the tail once the cap is reached (journal of states).
    invoke-virtual {v1}, Ljava/lang/String;->length()I
    move-result v2
    const/16 v3, 0x7d0
    if-gt v2, v3, :ls_store
    const/16 v3, 0x640
    sub-int v3, v2, v3
    invoke-virtual {v1, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v1
    :ls_store
    sput-object v1, Lcom/melodix/music/DiagCounters;->libStateText:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V
    const-string v2, "lib-state "
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-static {v0}, Lcom/melodix/music/DiagCounters;->event(Ljava/lang/String;)V

    :ls_done
    return-void
.end method

.method public static readLibState()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/melodix/music/DiagCounters;->libStateText:Ljava/lang/String;
    if-eqz v0, :rls_none
    return-object v0

    :rls_none
    const-string v0, ""
    return-object v0
.end method

.method public static armPageAlive()V
    .locals 4

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J
    move-result-wide v0
    sput-wide v0, Lcom/melodix/music/DiagCounters;->pageProbeSentAt:J
    return-void
.end method

.method public static notePageEvent()V
    .locals 5

    sget-wide v0, Lcom/melodix/music/DiagCounters;->pageProbeSentAt:J
    const-wide/16 v2, 0x0
    cmp-long v4, v0, v2
    if-eqz v4, :np_done

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J
    move-result-wide v2
    sub-long/2addr v2, v0
    const-wide/16 v0, 0x0
    sput-wide v0, Lcom/melodix/music/DiagCounters;->pageProbeSentAt:J

    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V
    const-string v1, "page-alive +"
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    const-string v1, "ms"
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-static {v0}, Lcom/melodix/music/DiagCounters;->event(Ljava/lang/String;)V

    :np_done
    return-void
.end method

.method public static allowTouchProbe()Z
    .locals 8

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J
    move-result-wide v0
    sget-wide v2, Lcom/melodix/music/DiagCounters;->lastTouchProbeMs:J
    sub-long v4, v0, v2
    const-wide/16 v6, 0x2710
    cmp-long v2, v4, v6
    if-gez v2, :atp_no

    sput-wide v0, Lcom/melodix/music/DiagCounters;->lastTouchProbeMs:J
    const/4 v2, 0x1
    return v2

    :atp_no
    const/4 v2, 0x0
    return v2
.end method

.method public static deviceLogged()Z
    .locals 1

    sget-boolean v0, Lcom/melodix/music/DiagCounters;->deviceLogged:Z
    return v0
.end method

.method public static markDeviceLogged()V
    .locals 1

    const/4 v0, 0x1
    sput-boolean v0, Lcom/melodix/music/DiagCounters;->deviceLogged:Z
    return-void
.end method
