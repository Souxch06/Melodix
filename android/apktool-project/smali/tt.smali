.class public final enum Ltt;
.super Ljava/lang/Enum;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lhr0;


# static fields
.field public static final enum k:Ltt;

.field public static final enum l:Ltt;

.field public static final enum m:Ltt;

.field public static final synthetic n:[Ltt;


# instance fields
.field public final j:I


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .line 1
    new-instance v0, Ltt;

    .line 2
    .line 3
    const-string v1, "COLLECTION_UNKNOWN"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2, v2}, Ltt;-><init>(Ljava/lang/String;II)V

    .line 7
    .line 8
    .line 9
    new-instance v1, Ltt;

    .line 10
    .line 11
    const-string v2, "COLLECTION_SDK_NOT_INSTALLED"

    .line 12
    .line 13
    const/4 v3, 0x1

    .line 14
    invoke-direct {v1, v2, v3, v3}, Ltt;-><init>(Ljava/lang/String;II)V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ltt;->k:Ltt;

    .line 18
    .line 19
    new-instance v2, Ltt;

    .line 20
    .line 21
    const-string v3, "COLLECTION_ENABLED"

    .line 22
    .line 23
    const/4 v4, 0x2

    .line 24
    invoke-direct {v2, v3, v4, v4}, Ltt;-><init>(Ljava/lang/String;II)V

    .line 25
    .line 26
    .line 27
    sput-object v2, Ltt;->l:Ltt;

    .line 28
    .line 29
    new-instance v3, Ltt;

    .line 30
    .line 31
    const-string v4, "COLLECTION_DISABLED"

    .line 32
    .line 33
    const/4 v5, 0x3

    .line 34
    invoke-direct {v3, v4, v5, v5}, Ltt;-><init>(Ljava/lang/String;II)V

    .line 35
    .line 36
    .line 37
    sput-object v3, Ltt;->m:Ltt;

    .line 38
    .line 39
    new-instance v4, Ltt;

    .line 40
    .line 41
    const-string v5, "COLLECTION_DISABLED_REMOTE"

    .line 42
    .line 43
    const/4 v6, 0x4

    .line 44
    invoke-direct {v4, v5, v6, v6}, Ltt;-><init>(Ljava/lang/String;II)V

    .line 45
    .line 46
    .line 47
    new-instance v5, Ltt;

    .line 48
    .line 49
    const-string v6, "COLLECTION_SAMPLED"

    .line 50
    .line 51
    const/4 v7, 0x5

    .line 52
    invoke-direct {v5, v6, v7, v7}, Ltt;-><init>(Ljava/lang/String;II)V

    .line 53
    .line 54
    .line 55
    filled-new-array/range {v0 .. v5}, [Ltt;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    sput-object v0, Ltt;->n:[Ltt;

    .line 60
    .line 61
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput p3, p0, Ltt;->j:I

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Ltt;
    .locals 1

    .line 1
    const-class v0, Ltt;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ltt;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Ltt;
    .locals 1

    .line 1
    sget-object v0, Ltt;->n:[Ltt;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Ltt;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public final a()I
    .locals 0

    .line 1
    iget p0, p0, Ltt;->j:I

    .line 2
    .line 3
    return p0
.end method
