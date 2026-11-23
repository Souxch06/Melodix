.class final Lcom/melodix/music/PreviewPlayerControllerQueue;
.super Ljava/lang/Object;
.source "PreviewPlayerControllerQueue.java"


# static fields
.field private static added:I

.field private static at:I

.field private static order:[I

.field static random:Ljava/util/Random;

.field private static final rowsKept:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lorg/json/JSONObject;",
            ">;"
        }
    .end annotation
.end field

.field private static shuffled:Z

.field private static final uris:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 7
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/melodix/music/PreviewPlayerControllerQueue;->uris:Ljava/util/ArrayList;

    .line 8
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/melodix/music/PreviewPlayerControllerQueue;->rowsKept:Ljava/util/ArrayList;

    .line 9
    const/4 v0, 0x0

    new-array v0, v0, [I

    sput-object v0, Lcom/melodix/music/PreviewPlayerControllerQueue;->order:[I

    .line 10
    const/4 v0, -0x1

    sput v0, Lcom/melodix/music/PreviewPlayerControllerQueue;->at:I

    .line 13
    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    sput-object v0, Lcom/melodix/music/PreviewPlayerControllerQueue;->random:Ljava/util/Random;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static addNext(Ljava/lang/String;Lorg/json/JSONObject;)Z
    .locals 6

    .line 61
    invoke-static {}, Lcom/melodix/music/PreviewPlayerControllerQueue;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_3

    if-eqz p0, :cond_3

    const-string v0, "spotify:track:"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_2

    .line 62
    :cond_0
    sget-object v0, Lcom/melodix/music/PreviewPlayerControllerQueue;->uris:Ljava/util/ArrayList;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object p0, Lcom/melodix/music/PreviewPlayerControllerQueue;->rowsKept:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 63
    sget-object p0, Lcom/melodix/music/PreviewPlayerControllerQueue;->order:[I

    array-length p0, p0

    sget p1, Lcom/melodix/music/PreviewPlayerControllerQueue;->at:I

    const/4 v0, 0x1

    add-int/2addr p1, v0

    sget v2, Lcom/melodix/music/PreviewPlayerControllerQueue;->added:I

    add-int/2addr p1, v2

    invoke-static {p0, p1}, Ljava/lang/Math;->min(II)I

    move-result p0

    sget-object p1, Lcom/melodix/music/PreviewPlayerControllerQueue;->order:[I

    array-length p1, p1

    .line 64
    add-int/lit8 v2, p1, 0x1

    new-array v2, v2, [I

    .line 65
    move v3, v1

    :goto_0
    if-gt v1, p1, :cond_2

    if-ne v1, p0, :cond_1

    sget-object v4, Lcom/melodix/music/PreviewPlayerControllerQueue;->uris:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    sub-int/2addr v4, v0

    goto :goto_1

    :cond_1
    sget-object v4, Lcom/melodix/music/PreviewPlayerControllerQueue;->order:[I

    add-int/lit8 v5, v3, 0x1

    aget v4, v4, v3

    move v3, v5

    :goto_1
    aput v4, v2, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 66
    :cond_2
    sput-object v2, Lcom/melodix/music/PreviewPlayerControllerQueue;->order:[I

    sget p0, Lcom/melodix/music/PreviewPlayerControllerQueue;->added:I

    add-int/2addr p0, v0

    sput p0, Lcom/melodix/music/PreviewPlayerControllerQueue;->added:I

    return v0

    .line 61
    :cond_3
    :goto_2
    return v1
.end method

.method private static build(I)V
    .locals 6

    .line 33
    sget-boolean v0, Lcom/melodix/music/PreviewPlayerMode;->shuffleMode:Z

    sput-boolean v0, Lcom/melodix/music/PreviewPlayerControllerQueue;->shuffled:Z

    sget-object v0, Lcom/melodix/music/PreviewPlayerControllerQueue;->uris:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    new-array v1, v0, [I

    sput-object v1, Lcom/melodix/music/PreviewPlayerControllerQueue;->order:[I

    .line 34
    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v2, v0, :cond_0

    sget-object v3, Lcom/melodix/music/PreviewPlayerControllerQueue;->order:[I

    aput v2, v3, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 35
    :cond_0
    sput v1, Lcom/melodix/music/PreviewPlayerControllerQueue;->added:I

    .line 36
    sget-boolean v2, Lcom/melodix/music/PreviewPlayerControllerQueue;->shuffled:Z

    if-nez v2, :cond_1

    sput p0, Lcom/melodix/music/PreviewPlayerControllerQueue;->at:I

    return-void

    .line 37
    :cond_1
    sget-object v2, Lcom/melodix/music/PreviewPlayerControllerQueue;->order:[I

    aput p0, v2, v1

    sget-object v2, Lcom/melodix/music/PreviewPlayerControllerQueue;->order:[I

    aput v1, v2, p0

    .line 38
    const/4 p0, 0x1

    sub-int/2addr v0, p0

    :goto_1
    if-le v0, p0, :cond_2

    sget-object v2, Lcom/melodix/music/PreviewPlayerControllerQueue;->random:Ljava/util/Random;

    invoke-virtual {v2, v0}, Ljava/util/Random;->nextInt(I)I

    move-result v2

    add-int/2addr v2, p0

    sget-object v3, Lcom/melodix/music/PreviewPlayerControllerQueue;->order:[I

    aget v3, v3, v0

    sget-object v4, Lcom/melodix/music/PreviewPlayerControllerQueue;->order:[I

    sget-object v5, Lcom/melodix/music/PreviewPlayerControllerQueue;->order:[I

    aget v5, v5, v2

    aput v5, v4, v0

    sget-object v4, Lcom/melodix/music/PreviewPlayerControllerQueue;->order:[I

    aput v3, v4, v2

    add-int/lit8 v0, v0, -0x1

    goto :goto_1

    .line 39
    :cond_2
    sput v1, Lcom/melodix/music/PreviewPlayerControllerQueue;->at:I

    .line 40
    return-void
.end method

.method static clear()V
    .locals 2

    .line 16
    sget-object v0, Lcom/melodix/music/PreviewPlayerControllerQueue;->uris:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    sget-object v0, Lcom/melodix/music/PreviewPlayerControllerQueue;->rowsKept:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    const/4 v0, 0x0

    new-array v1, v0, [I

    sput-object v1, Lcom/melodix/music/PreviewPlayerControllerQueue;->order:[I

    const/4 v1, -0x1

    sput v1, Lcom/melodix/music/PreviewPlayerControllerQueue;->at:I

    sput v0, Lcom/melodix/music/PreviewPlayerControllerQueue;->added:I

    return-void
.end method

.method static current()Ljava/lang/String;
    .locals 3

    .line 45
    invoke-static {}, Lcom/melodix/music/PreviewPlayerControllerQueue;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, ""

    goto :goto_0

    :cond_0
    sget-object v0, Lcom/melodix/music/PreviewPlayerControllerQueue;->uris:Ljava/util/ArrayList;

    sget-object v1, Lcom/melodix/music/PreviewPlayerControllerQueue;->order:[I

    sget v2, Lcom/melodix/music/PreviewPlayerControllerQueue;->at:I

    aget v1, v1, v2

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    :goto_0
    return-object v0
.end method

.method static isEmpty()Z
    .locals 1

    .line 15
    sget v0, Lcom/melodix/music/PreviewPlayerControllerQueue;->at:I

    if-ltz v0, :cond_1

    sget-object v0, Lcom/melodix/music/PreviewPlayerControllerQueue;->order:[I

    array-length v0, v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method private static line(I)Ljava/lang/String;
    .locals 5

    .line 79
    sget-object v0, Lcom/melodix/music/PreviewPlayerControllerQueue;->rowsKept:Ljava/util/ArrayList;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lorg/json/JSONObject;

    .line 80
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->title(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x9

    const/16 v3, 0x20

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v1

    const/16 v4, 0xa

    invoke-virtual {v1, v4, v3}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\t"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->artist(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0, v2, v3}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0, v4, v3}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static moveTo(Ljava/lang/String;)Z
    .locals 4

    .line 99
    const/4 v0, 0x0

    move v1, v0

    :goto_0
    sget-object v2, Lcom/melodix/music/PreviewPlayerControllerQueue;->order:[I

    array-length v2, v2

    if-ge v1, v2, :cond_1

    sget-object v2, Lcom/melodix/music/PreviewPlayerControllerQueue;->uris:Ljava/util/ArrayList;

    sget-object v3, Lcom/melodix/music/PreviewPlayerControllerQueue;->order:[I

    aget v3, v3, v1

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    sput v1, Lcom/melodix/music/PreviewPlayerControllerQueue;->at:I

    const/4 p0, 0x1

    return p0

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 100
    :cond_1
    return v0
.end method

.method static playNext(I)Z
    .locals 5

    .line 94
    sget v0, Lcom/melodix/music/PreviewPlayerControllerQueue;->at:I

    const/4 v1, 0x1

    add-int/2addr v0, v1

    add-int/2addr v0, p0

    invoke-static {}, Lcom/melodix/music/PreviewPlayerControllerQueue;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_2

    if-lez p0, :cond_2

    sget-object p0, Lcom/melodix/music/PreviewPlayerControllerQueue;->order:[I

    array-length p0, p0

    if-lt v0, p0, :cond_0

    goto :goto_1

    .line 95
    :cond_0
    sget-object p0, Lcom/melodix/music/PreviewPlayerControllerQueue;->order:[I

    aget p0, p0, v0

    :goto_0
    sget v2, Lcom/melodix/music/PreviewPlayerControllerQueue;->at:I

    add-int/2addr v2, v1

    if-le v0, v2, :cond_1

    sget-object v2, Lcom/melodix/music/PreviewPlayerControllerQueue;->order:[I

    sget-object v3, Lcom/melodix/music/PreviewPlayerControllerQueue;->order:[I

    add-int/lit8 v4, v0, -0x1

    aget v3, v3, v4

    aput v3, v2, v0

    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_1
    sget-object v0, Lcom/melodix/music/PreviewPlayerControllerQueue;->order:[I

    sget v2, Lcom/melodix/music/PreviewPlayerControllerQueue;->at:I

    add-int/2addr v2, v1

    aput p0, v0, v2

    return v1

    .line 94
    :cond_2
    :goto_1
    const/4 p0, 0x0

    return p0
.end method

.method static removeUpcoming(I)Z
    .locals 7

    .line 85
    sget v0, Lcom/melodix/music/PreviewPlayerControllerQueue;->at:I

    const/4 v1, 0x1

    add-int/2addr v0, v1

    add-int/2addr v0, p0

    invoke-static {}, Lcom/melodix/music/PreviewPlayerControllerQueue;->isEmpty()Z

    move-result v2

    const/4 v3, 0x0

    if-nez v2, :cond_4

    if-ltz p0, :cond_4

    sget-object v2, Lcom/melodix/music/PreviewPlayerControllerQueue;->order:[I

    array-length v2, v2

    if-lt v0, v2, :cond_0

    goto :goto_1

    .line 86
    :cond_0
    sget-object v2, Lcom/melodix/music/PreviewPlayerControllerQueue;->order:[I

    array-length v2, v2

    sub-int/2addr v2, v1

    new-array v2, v2, [I

    .line 87
    move v4, v3

    :goto_0
    sget-object v5, Lcom/melodix/music/PreviewPlayerControllerQueue;->order:[I

    array-length v5, v5

    if-ge v3, v5, :cond_2

    if-eq v3, v0, :cond_1

    add-int/lit8 v5, v4, 0x1

    sget-object v6, Lcom/melodix/music/PreviewPlayerControllerQueue;->order:[I

    aget v6, v6, v3

    aput v6, v2, v4

    move v4, v5

    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 88
    :cond_2
    sget v0, Lcom/melodix/music/PreviewPlayerControllerQueue;->added:I

    if-ge p0, v0, :cond_3

    sget p0, Lcom/melodix/music/PreviewPlayerControllerQueue;->added:I

    sub-int/2addr p0, v1

    sput p0, Lcom/melodix/music/PreviewPlayerControllerQueue;->added:I

    .line 89
    :cond_3
    sput-object v2, Lcom/melodix/music/PreviewPlayerControllerQueue;->order:[I

    return v1

    .line 85
    :cond_4
    :goto_1
    return v3
.end method

.method static row(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 1

    .line 43
    sget-object v0, Lcom/melodix/music/PreviewPlayerControllerQueue;->uris:Ljava/util/ArrayList;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result p0

    if-gez p0, :cond_0

    const/4 p0, 0x0

    goto :goto_0

    :cond_0
    sget-object v0, Lcom/melodix/music/PreviewPlayerControllerQueue;->rowsKept:Ljava/util/ArrayList;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lorg/json/JSONObject;

    :goto_0
    return-object p0
.end method

.method static snapshot()Ljava/lang/String;
    .locals 7

    .line 71
    invoke-static {}, Lcom/melodix/music/PreviewPlayerControllerQueue;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return-object v1

    .line 73
    :cond_0
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 74
    sget v3, Lcom/melodix/music/PreviewPlayerControllerQueue;->at:I

    const/4 v4, 0x1

    add-int/2addr v3, v4

    :goto_0
    sget-object v5, Lcom/melodix/music/PreviewPlayerControllerQueue;->order:[I

    array-length v5, v5

    if-ge v3, v5, :cond_2

    sget v5, Lcom/melodix/music/PreviewPlayerControllerQueue;->at:I

    add-int/lit8 v5, v5, 0x32

    if-gt v3, v5, :cond_2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    if-nez v5, :cond_1

    const-string v5, ""

    goto :goto_1

    :cond_1
    const-string v5, "\n"

    :goto_1
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    sget-object v6, Lcom/melodix/music/PreviewPlayerControllerQueue;->order:[I

    aget v6, v6, v3

    invoke-static {v6}, Lcom/melodix/music/PreviewPlayerControllerQueue;->line(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 75
    :cond_2
    const-string v3, "ok"

    invoke-virtual {v0, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    const-string v3, "now"

    sget-object v4, Lcom/melodix/music/PreviewPlayerControllerQueue;->order:[I

    sget v5, Lcom/melodix/music/PreviewPlayerControllerQueue;->at:I

    aget v4, v4, v5

    invoke-static {v4}, Lcom/melodix/music/PreviewPlayerControllerQueue;->line(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v3, "next"

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 76
    :catch_0
    move-exception v0

    return-object v1
.end method

.method static start(Lorg/json/JSONArray;Ljava/lang/String;)Z
    .locals 7

    .line 19
    invoke-static {}, Lcom/melodix/music/PreviewPlayerControllerQueue;->clear()V

    .line 20
    const/4 v0, -0x1

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-ge v2, v3, :cond_4

    .line 21
    invoke-virtual {p0, v2}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    if-nez v3, :cond_0

    goto :goto_1

    .line 22
    :cond_0
    const-string v4, "uri"

    const-string v5, ""

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_1

    const-string v4, "id"

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 23
    :cond_1
    const-string v5, "spotify:track:"

    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_2

    goto :goto_1

    .line 24
    :cond_2
    if-gez v0, :cond_3

    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    sget-object v0, Lcom/melodix/music/PreviewPlayerControllerQueue;->uris:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 25
    :cond_3
    sget-object v5, Lcom/melodix/music/PreviewPlayerControllerQueue;->uris:Ljava/util/ArrayList;

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v4, Lcom/melodix/music/PreviewPlayerControllerQueue;->rowsKept:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 20
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 27
    :cond_4
    if-gez v0, :cond_5

    invoke-static {}, Lcom/melodix/music/PreviewPlayerControllerQueue;->clear()V

    return v1

    .line 28
    :cond_5
    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerControllerQueue;->build(I)V

    const/4 p0, 0x1

    return p0
.end method

.method static step(ZZ)Ljava/lang/String;
    .locals 4

    .line 52
    invoke-static {}, Lcom/melodix/music/PreviewPlayerControllerQueue;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return-object v1

    :cond_0
    invoke-static {}, Lcom/melodix/music/PreviewPlayerControllerQueue;->sync()V

    .line 53
    sget v0, Lcom/melodix/music/PreviewPlayerControllerQueue;->at:I

    const/4 v2, 0x1

    if-eqz p0, :cond_1

    move v3, v2

    goto :goto_0

    :cond_1
    const/4 v3, -0x1

    :goto_0
    add-int/2addr v0, v3

    .line 54
    if-ltz v0, :cond_2

    sget-object v3, Lcom/melodix/music/PreviewPlayerControllerQueue;->order:[I

    array-length v3, v3

    if-lt v0, v3, :cond_5

    :cond_2
    if-nez p1, :cond_3

    return-object v1

    :cond_3
    if-eqz p0, :cond_4

    const/4 p1, 0x0

    goto :goto_1

    :cond_4
    sget-object p1, Lcom/melodix/music/PreviewPlayerControllerQueue;->order:[I

    array-length p1, p1

    sub-int/2addr p1, v2

    :goto_1
    move v0, p1

    .line 55
    :cond_5
    if-eqz p0, :cond_6

    sget p0, Lcom/melodix/music/PreviewPlayerControllerQueue;->added:I

    if-lez p0, :cond_6

    sget p0, Lcom/melodix/music/PreviewPlayerControllerQueue;->at:I

    add-int/2addr p0, v2

    if-ne v0, p0, :cond_6

    sget p0, Lcom/melodix/music/PreviewPlayerControllerQueue;->added:I

    sub-int/2addr p0, v2

    sput p0, Lcom/melodix/music/PreviewPlayerControllerQueue;->added:I

    .line 56
    :cond_6
    sput v0, Lcom/melodix/music/PreviewPlayerControllerQueue;->at:I

    invoke-static {}, Lcom/melodix/music/PreviewPlayerControllerQueue;->current()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static sync()V
    .locals 2

    .line 48
    invoke-static {}, Lcom/melodix/music/PreviewPlayerControllerQueue;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/melodix/music/PreviewPlayerControllerQueue;->shuffled:Z

    sget-boolean v1, Lcom/melodix/music/PreviewPlayerMode;->shuffleMode:Z

    if-eq v0, v1, :cond_0

    sget-object v0, Lcom/melodix/music/PreviewPlayerControllerQueue;->order:[I

    sget v1, Lcom/melodix/music/PreviewPlayerControllerQueue;->at:I

    aget v0, v0, v1

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerControllerQueue;->build(I)V

    :cond_0
    return-void
.end method
