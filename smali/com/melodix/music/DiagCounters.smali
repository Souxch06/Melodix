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

# Bridge diagnostic channel probe: how many times AndBridge.onLibDiagState
# reached DiagCounters.libState, and the received length (chars) of the last
# payload. Counts only, never content.
.field public static libStateCalls:I
.field public static libStateLastLen:I

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

# Chaine de chargement : compteurs bruts a/b (le shell injecte et ses marqueurs
# js-shell begin/end). Nombres uniquement, jamais de contenu.
.field public static shellInjects:I
.field public static shellInjectLen:I
.field public static shellBegin:I
.field public static shellEnd:I

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

    # Compteurs bruts b : marqueurs "js-shell begin" / "js-shell end" (nombres).
    if-eqz p0, :sh_count_done

    const-string v1, "js-shell begin"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :sh_check_end

    sget v2, Lcom/melodix/music/DiagCounters;->shellBegin:I

    add-int/lit8 v2, v2, 0x1

    sput v2, Lcom/melodix/music/DiagCounters;->shellBegin:I

    goto :sh_count_done

    :sh_check_end

    const-string v1, "js-shell end"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :sh_count_done

    sget v2, Lcom/melodix/music/DiagCounters;->shellEnd:I

    add-int/lit8 v2, v2, 0x1

    sput v2, Lcom/melodix/music/DiagCounters;->shellEnd:I

    :sh_count_done

    # The emulator test engine reads logcat MDXTRACE:I. Mirror every bounded
    # event line there (whitespace-normalized + 128-char clipped, same as the
    # in-app buffer below) so the bridge startup chain is observable outside
    # the diagnostic screen. Callers pass fixed labels and exception class
    # names only - never tokens or page content.
    if-eqz p0, :event_log_skip

    const-string v1, "\\s+"

    const-string v2, " "

    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x80

    invoke-static {v1, v2}, Lcom/melodix/music/DiagCounters;->clip(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    const-string v2, "MDXTRACE"

    invoke-static {v2, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :event_log_skip

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

    # Resume de la chaine de chargement EN TETE : etapes a->h, valeurs brutes,
    # aucune conclusion. Ensuite seulement la section Bridge (temporaire).
    invoke-static {}, Lcom/melodix/music/DiagCounters;->buildChainSummary()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    # Section temporaire : état de chargement du bridge, valeurs brutes,
    # "non reçu" quand la donnée est absente. Aucune conclusion calculée :
    # l'écran ne montre que les valeurs.
    const-string v1, "Bridge (temporaire):\n"
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    # Bridge channel probe line (head of the section): entry count + last
    # received length. Numbers only.
    const-string v1, "lib-state calls="
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    sget v2, Lcom/melodix/music/DiagCounters;->libStateCalls:I
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v1, " lastLen="
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    sget v2, Lcom/melodix/music/DiagCounters;->libStateLastLen:I
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v1, "\n"
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Lcom/melodix/music/DiagCounters;->buildBridgeSection()Ljava/lang/String;
    move-result-object v2
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v1, "\n"
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    # Crash probe : first line of the last NativeCrashGuard record (or
    # "non reçu"). Read-only display, no conclusion.
    invoke-static {}, Lcom/melodix/music/DiagCounters;->buildCrashSection()Ljava/lang/String;
    move-result-object v2
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

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

    # Probe: count every call entry; record the received length (chars) when a
    # payload actually arrived. Clip and storage below are untouched.
    sget v0, Lcom/melodix/music/DiagCounters;->libStateCalls:I
    add-int/lit8 v0, v0, 0x1
    sput v0, Lcom/melodix/music/DiagCounters;->libStateCalls:I

    # Count-only summary to logcat MDXTRACE:I: "lib-state n=<calls> len=<chars>".
    # Never the payload itself (it is sanitized but page-shaped).
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "lib-state n="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " len="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz p0, :ls_log_len0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    goto :ls_log_len

    :ls_log_len0
    const/4 v2, 0x0

    :ls_log_len
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "MDXTRACE"

    invoke-static {v2, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz p0, :ls_done

    invoke-virtual {p0}, Ljava/lang/String;->length()I
    move-result v0
    sput v0, Lcom/melodix/music/DiagCounters;->libStateLastLen:I

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
    if-le v2, v3, :ls_store
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

.method public static readLibStateLast()Ljava/lang/String;
    .locals 3

    sget-object v0, Lcom/melodix/music/DiagCounters;->libStateText:Ljava/lang/String;
    if-eqz v0, :rll_empty

    const/16 v1, 0xa
    invoke-virtual {v0, v1}, Ljava/lang/String;->lastIndexOf(I)I
    move-result v1
    if-ltz v1, :rll_whole
    const/4 v2, 0x1
    add-int/2addr v1, v2
    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object v0
    return-object v0

    :rll_whole
    return-object v0

    :rll_empty
    const-string v0, ""
    return-object v0
.end method

# --- Crash probe (temporary) : last NativeCrashGuard crash, first line only ---
# Shows class + message (truncated to 160 by NativeCrashGuard.lastCrashLine),
# never the full stack trace. Absent -> "non reçu". No interpretation.

.method public static buildCrashSection()Ljava/lang/String;
    .locals 3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Dernier crash (NativeCrashGuard): "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Lcom/melodix/music/NativeCrashGuard;->lastCrashLine()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :absent

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :nl

    :absent
    const-string v1, "non reçu"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :nl
    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

# --- Shell injection probe : length of the injected shell source -------------
# Written by c91 right before evaluateJavascript so the journal proves what
# content length was handed to the WebView ("js-shell inject len=<n>", or
# "null" when the asset read failed).

.method public static logShellInject(Ljava/lang/String;)V
    .locals 3

    sget v0, Lcom/melodix/music/DiagCounters;->shellInjects:I
    add-int/lit8 v0, v0, 0x1
    sput v0, Lcom/melodix/music/DiagCounters;->shellInjects:I

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "js-shell inject len="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz p0, :nil

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    sput v2, Lcom/melodix/music/DiagCounters;->shellInjectLen:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    goto :emit

    :nil
    const/4 v2, -0x1
    sput v2, Lcom/melodix/music/DiagCounters;->shellInjectLen:I

    const-string v1, "null"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :emit
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/melodix/music/DiagCounters;->event(Ljava/lang/String;)V

    return-void
.end method

# --- Bridge load observability (temporary "Bridge (temporaire)" section) ----
# The shell pushes a JSON snapshot of the bridge load state through the
# existing onLibDiagState -> libState channel. readLibStateBridge finds the
# last such snapshot in the journal (it starts with the {"stage" key) and
# buildBridgeSection renders each field raw, or "non reçu" when absent.
# No interpretation: the section only shows values.

.method public static readLibStateBridge()Ljava/lang/String;
    .locals 4

    sget-object v0, Lcom/melodix/music/DiagCounters;->libStateText:Ljava/lang/String;
    if-eqz v0, :rlb_none

    const-string v1, "{\"stage\""
    invoke-virtual {v0, v1}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I
    move-result v2
    if-ltz v2, :rlb_none

    const/16 v1, 0xa
    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->indexOf(II)I
    move-result v3
    if-gez v3, :rlb_tail
    invoke-virtual {v0, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v0
    return-object v0

    :rlb_tail
    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object v0
    return-object v0

    :rlb_none
    const/4 v0, 0x0
    return-object v0
.end method

# --- Resume de la chaine de chargement (etapes a->h, valeurs brutes) --------
# Aucune conclusion calculee : chaque etape affiche sa valeur numerique brute
# ou "non recu" si le canal ne l'a pas transmise. Lecture seule.

.method private static optRaw(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    const-string v0, "non reçu"

    if-eqz p0, :or_out

    :try_start_or
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;
    move-result-object p0
    :try_end_or
    .catch Ljava/lang/Throwable; {:try_start_or .. :try_end_or} :catch_or

    if-eqz p0, :or_out

    sget-object p1, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    if-ne p0, p1, :or_value

    goto :or_out

    :or_value
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;
    move-result-object p0
    return-object p0

    :catch_or
    move-exception p0

    :or_out
    return-object v0
.end method

# i-eme slot du champ compact chain ("a/b/c/d/e/f/g") ou "non recu".
.method private static chainSlot(Ljava/lang/String;I)Ljava/lang/String;
    .locals 2

    const-string v0, "non reçu"

    if-eqz p0, :cs_out

    :try_start_s
    const-string v1, "/"

    invoke-virtual {p0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0
    :try_end_s
    .catch Ljava/lang/Throwable; {:try_start_s .. :try_end_s} :catch_s

    array-length v1, p0

    if-le v1, p1, :cs_out

    aget-object p0, p0, p1

    if-eqz p0, :cs_out

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cs_valued

    goto :cs_out

    :cs_valued
    return-object p0

    :catch_s
    move-exception p0

    :cs_out
    return-object v0
.end method

.method public static buildChainSummary()Ljava/lang/String;
    .locals 7

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    # a. Shell injecte : longueur brute de la source remise a la WebView et
    # nombre d'injections (memoire de logShellInject).
    const-string v1, "a shellInject len="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v2, Lcom/melodix/music/DiagCounters;->shellInjectLen:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " n="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v2, Lcom/melodix/music/DiagCounters;->shellInjects:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    # b. Shell begin/end : compteurs des marqueurs js-shell.
    const-string v1, "b shell begin="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v2, Lcom/melodix/music/DiagCounters;->shellBegin:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " end="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v2, Lcom/melodix/music/DiagCounters;->shellEnd:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    # c..h : instantane compact du pousseur "ticks/pushes/sent/sendErr/
    # loaderCalls/bridgeInjected/bridgeStarted" (canal onLibDiagState).
    const/4 v3, 0x0

    invoke-static {}, Lcom/melodix/music/DiagCounters;->readLibStateBridge()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cs_slots

    :try_start_cs
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_cs
    .catch Lorg/json/JSONException; {:try_start_cs .. :try_end_cs} :catch_cs

    goto :cs_slots

    :catch_cs
    move-exception v2

    const/4 v3, 0x0

    :cs_slots
    const-string v1, "chain"

    invoke-static {v3, v1}, Lcom/melodix/music/DiagCounters;->optRaw(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v1, "c ticks="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v2, 0x0

    invoke-static {v4, v2}, Lcom/melodix/music/DiagCounters;->chainSlot(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "d pushes="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v2, 0x1

    invoke-static {v4, v2}, Lcom/melodix/music/DiagCounters;->chainSlot(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "e sent="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v2, 0x2

    invoke-static {v4, v2}, Lcom/melodix/music/DiagCounters;->chainSlot(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " sendErr="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v2, 0x3

    invoke-static {v4, v2}, Lcom/melodix/music/DiagCounters;->chainSlot(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "f loaderCalls="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v2, 0x4

    invoke-static {v4, v2}, Lcom/melodix/music/DiagCounters;->chainSlot(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "g bridgeInjected="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v2, 0x5

    invoke-static {v4, v2}, Lcom/melodix/music/DiagCounters;->chainSlot(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "h bridgeStarted="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v2, 0x6

    invoke-static {v4, v2}, Lcom/melodix/music/DiagCounters;->chainSlot(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static buildBridgeSection()Ljava/lang/String;
    .locals 8

    # Field order is fixed: the display lists exactly these keys, raw values.
    # chain = compteurs compacts de la chaine (c->h), juste apres stage :
    # il precede les champs elagables et survit au clip 400 du canal.
    const/16 v0, 0xe
    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0
    const-string v2, "stage"
    aput-object v2, v0, v1

    const/4 v1, 0x1
    const-string v2, "chain"
    aput-object v2, v0, v1

    const/4 v1, 0x2
    const-string v2, "started"
    aput-object v2, v0, v1

    const/4 v1, 0x3
    const-string v2, "entered"
    aput-object v2, v0, v1

    const/4 v1, 0x4
    const-string v2, "intercepted"
    aput-object v2, v0, v1

    const/4 v1, 0x5
    const-string v2, "assetServed"
    aput-object v2, v0, v1

    const/4 v1, 0x6
    const-string v2, "prefixExec"
    aput-object v2, v0, v1

    const/4 v1, 0x7
    const-string v2, "bytes"
    aput-object v2, v0, v1

    const/16 v1, 0x8
    const-string v2, "lastError"
    aput-object v2, v0, v1

    const/16 v1, 0x9
    const-string v2, "cspViolation"
    aput-object v2, v0, v1

    const/16 v1, 0xa
    const-string v2, "execMode"
    aput-object v2, v0, v1

    const/16 v1, 0xb
    const-string v2, "recoveryAttempts"
    aput-object v2, v0, v1

    const/16 v1, 0xc
    const-string v2, "watch"
    aput-object v2, v0, v1

    const/16 v1, 0xd
    const-string v2, "tagPresent"
    aput-object v2, v0, v1
    new-instance v4, Ljava/lang/StringBuilder;
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/melodix/music/DiagCounters;->readLibStateBridge()Ljava/lang/String;
    move-result-object v2

    const/4 v3, 0x0
    if-eqz v2, :bb_loop

    :try_start_bb
    new-instance v3, Lorg/json/JSONObject;
    invoke-direct {v3, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_bb
    .catch Lorg/json/JSONException; {:try_start_bb .. :try_end_bb} :catch_bb
    goto :bb_loop

    :catch_bb
    move-exception v6
    const/4 v3, 0x0

    :bb_loop
    const/4 v1, 0x0
    :bb_next
    const/16 v7, 0xe
    if-ge v1, v7, :bb_done

    aget-object v2, v0, v1

    # Absent or JSON null -> "non reçu"; anything else is shown raw.
    const-string v5, "non reçu"
    if-eqz v3, :bb_emit
    invoke-virtual {v3, v2}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;
    move-result-object v6
    if-eqz v6, :bb_emit
    sget-object v7, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;
    if-ne v6, v7, :bb_value
    goto :bb_emit

    :bb_value
    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;
    move-result-object v5

    :bb_emit
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v6, ": "
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v6, "\n"
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v1, v1, 0x1
    goto :bb_next

    :bb_done
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v5
    return-object v5
.end method
