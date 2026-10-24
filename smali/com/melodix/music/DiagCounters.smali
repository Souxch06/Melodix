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
