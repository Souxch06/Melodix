.class public final enum Lar;
.super Ljava/lang/Enum;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final enum j:Lar;

.field public static final synthetic k:[Lar;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    new-instance v0, Lar;

    .line 2
    .line 3
    const-string v1, "COROUTINE_SUSPENDED"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lar;->j:Lar;

    .line 10
    .line 11
    new-instance v1, Lar;

    .line 12
    .line 13
    const-string v2, "UNDECIDED"

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    new-instance v2, Lar;

    .line 20
    .line 21
    const-string v3, "RESUMED"

    .line 22
    .line 23
    const/4 v4, 0x2

    .line 24
    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 25
    .line 26
    .line 27
    filled-new-array {v0, v1, v2}, [Lar;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    sput-object v0, Lar;->k:[Lar;

    .line 32
    .line 33
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lar;
    .locals 1

    .line 1
    const-class v0, Lar;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lar;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lar;
    .locals 1

    .line 1
    sget-object v0, Lar;->k:[Lar;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lar;

    .line 8
    .line 9
    return-object v0
.end method
