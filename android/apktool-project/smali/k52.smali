.class public final enum Lk52;
.super Ljava/lang/Enum;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final enum k:Lk52;

.field public static final enum l:Lk52;

.field public static final enum m:Lk52;

.field public static final enum n:Lk52;

.field public static final synthetic o:[Lk52;


# instance fields
.field public final j:I


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 1
    new-instance v0, Lk52;

    .line 2
    .line 3
    const-string v1, "UNKNOWN"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2, v2}, Lk52;-><init>(Ljava/lang/String;II)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lk52;->k:Lk52;

    .line 10
    .line 11
    new-instance v1, Lk52;

    .line 12
    .line 13
    const-string v2, "SUCCESS"

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    invoke-direct {v1, v2, v3, v3}, Lk52;-><init>(Ljava/lang/String;II)V

    .line 17
    .line 18
    .line 19
    sput-object v1, Lk52;->l:Lk52;

    .line 20
    .line 21
    new-instance v2, Lk52;

    .line 22
    .line 23
    const-string v3, "FAILURE"

    .line 24
    .line 25
    const/4 v4, 0x2

    .line 26
    invoke-direct {v2, v3, v4, v4}, Lk52;-><init>(Ljava/lang/String;II)V

    .line 27
    .line 28
    .line 29
    sput-object v2, Lk52;->m:Lk52;

    .line 30
    .line 31
    new-instance v3, Lk52;

    .line 32
    .line 33
    const-string v4, "BACKOFF"

    .line 34
    .line 35
    const/4 v5, 0x3

    .line 36
    invoke-direct {v3, v4, v5, v5}, Lk52;-><init>(Ljava/lang/String;II)V

    .line 37
    .line 38
    .line 39
    sput-object v3, Lk52;->n:Lk52;

    .line 40
    .line 41
    filled-new-array {v0, v1, v2, v3}, [Lk52;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    sput-object v0, Lk52;->o:[Lk52;

    .line 46
    .line 47
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput p3, p0, Lk52;->j:I

    .line 5
    .line 6
    return-void
.end method

.method public static values()[Lk52;
    .locals 1

    .line 1
    sget-object v0, Lk52;->o:[Lk52;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lk52;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lk52;

    .line 8
    .line 9
    return-object v0
.end method
