.class final Lcom/melodix/music/PreviewPlayerControllerQueue;
.super Ljava/lang/Object;
.source "PreviewPlayerControllerQueue.java"


# static fields
.field private static at:I

.field private static order:[I

.field static random:Ljava/util/Random;

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
    const/4 v0, 0x0

    new-array v0, v0, [I

    sput-object v0, Lcom/melodix/music/PreviewPlayerControllerQueue;->order:[I

    .line 9
    const/4 v0, -0x1

    sput v0, Lcom/melodix/music/PreviewPlayerControllerQueue;->at:I

    .line 11
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

.method private static build(I)V
    .locals 6

    .line 31
    sget-boolean v0, Lcom/melodix/music/PreviewPlayerMode;->shuffleMode:Z

    sput-boolean v0, Lcom/melodix/music/PreviewPlayerControllerQueue;->shuffled:Z

    sget-object v0, Lcom/melodix/music/PreviewPlayerControllerQueue;->uris:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    new-array v1, v0, [I

    sput-object v1, Lcom/melodix/music/PreviewPlayerControllerQueue;->order:[I

    .line 32
    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v2, v0, :cond_0

    sget-object v3, Lcom/melodix/music/PreviewPlayerControllerQueue;->order:[I

    aput v2, v3, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 33
    :cond_0
    sget-boolean v2, Lcom/melodix/music/PreviewPlayerControllerQueue;->shuffled:Z

    if-nez v2, :cond_1

    sput p0, Lcom/melodix/music/PreviewPlayerControllerQueue;->at:I

    return-void

    .line 34
    :cond_1
    sget-object v2, Lcom/melodix/music/PreviewPlayerControllerQueue;->order:[I

    aput p0, v2, v1

    sget-object v2, Lcom/melodix/music/PreviewPlayerControllerQueue;->order:[I

    aput v1, v2, p0

    .line 35
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

    .line 36
    :cond_2
    sput v1, Lcom/melodix/music/PreviewPlayerControllerQueue;->at:I

    .line 37
    return-void
.end method

.method static clear()V
    .locals 1

    .line 14
    sget-object v0, Lcom/melodix/music/PreviewPlayerControllerQueue;->uris:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    const/4 v0, 0x0

    new-array v0, v0, [I

    sput-object v0, Lcom/melodix/music/PreviewPlayerControllerQueue;->order:[I

    const/4 v0, -0x1

    sput v0, Lcom/melodix/music/PreviewPlayerControllerQueue;->at:I

    return-void
.end method

.method static current()Ljava/lang/String;
    .locals 3

    .line 39
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

    .line 13
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

.method static moveTo(Ljava/lang/String;)Z
    .locals 4

    .line 53
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

    .line 54
    :cond_1
    return v0
.end method

.method static start(Lorg/json/JSONArray;Ljava/lang/String;)Z
    .locals 7

    .line 17
    invoke-static {}, Lcom/melodix/music/PreviewPlayerControllerQueue;->clear()V

    .line 18
    const/4 v0, -0x1

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-ge v2, v3, :cond_4

    .line 19
    invoke-virtual {p0, v2}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    if-nez v3, :cond_0

    goto :goto_1

    .line 20
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

    .line 21
    :cond_1
    const-string v3, "spotify:track:"

    invoke-virtual {v4, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_2

    goto :goto_1

    .line 22
    :cond_2
    if-gez v0, :cond_3

    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    sget-object v0, Lcom/melodix/music/PreviewPlayerControllerQueue;->uris:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 23
    :cond_3
    sget-object v3, Lcom/melodix/music/PreviewPlayerControllerQueue;->uris:Ljava/util/ArrayList;

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 18
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 25
    :cond_4
    if-gez v0, :cond_5

    invoke-static {}, Lcom/melodix/music/PreviewPlayerControllerQueue;->clear()V

    return v1

    .line 26
    :cond_5
    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerControllerQueue;->build(I)V

    const/4 p0, 0x1

    return p0
.end method

.method static step(ZZ)Ljava/lang/String;
    .locals 4

    .line 46
    invoke-static {}, Lcom/melodix/music/PreviewPlayerControllerQueue;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return-object v1

    :cond_0
    invoke-static {}, Lcom/melodix/music/PreviewPlayerControllerQueue;->sync()V

    .line 47
    sget v0, Lcom/melodix/music/PreviewPlayerControllerQueue;->at:I

    const/4 v2, 0x1

    if-eqz p0, :cond_1

    move v3, v2

    goto :goto_0

    :cond_1
    const/4 v3, -0x1

    :goto_0
    add-int/2addr v0, v3

    .line 48
    if-ltz v0, :cond_2

    sget-object v3, Lcom/melodix/music/PreviewPlayerControllerQueue;->order:[I

    array-length v3, v3

    if-lt v0, v3, :cond_5

    :cond_2
    if-nez p1, :cond_3

    return-object v1

    :cond_3
    if-eqz p0, :cond_4

    const/4 p0, 0x0

    goto :goto_1

    :cond_4
    sget-object p0, Lcom/melodix/music/PreviewPlayerControllerQueue;->order:[I

    array-length p0, p0

    sub-int/2addr p0, v2

    :goto_1
    move v0, p0

    .line 49
    :cond_5
    sput v0, Lcom/melodix/music/PreviewPlayerControllerQueue;->at:I

    invoke-static {}, Lcom/melodix/music/PreviewPlayerControllerQueue;->current()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static sync()V
    .locals 2

    .line 42
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
