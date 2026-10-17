.class public final enum Lr22;
.super Ljava/lang/Enum;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final enum k:Lr22;

.field public static final enum l:Lr22;

.field public static final synthetic m:[Lr22;


# instance fields
.field public final j:[Lt22;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    new-instance v0, Lr22;

    .line 2
    .line 3
    sget-object v1, Lt22;->k:Lt22;

    .line 4
    .line 5
    sget-object v2, Lt22;->l:Lt22;

    .line 6
    .line 7
    filled-new-array {v1, v2}, [Lt22;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    const-string v2, "STORAGE"

    .line 12
    .line 13
    const/4 v3, 0x0

    .line 14
    invoke-direct {v0, v2, v3, v1}, Lr22;-><init>(Ljava/lang/String;I[Lt22;)V

    .line 15
    .line 16
    .line 17
    sput-object v0, Lr22;->k:Lr22;

    .line 18
    .line 19
    new-instance v1, Lr22;

    .line 20
    .line 21
    sget-object v2, Lt22;->m:Lt22;

    .line 22
    .line 23
    filled-new-array {v2}, [Lt22;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    const-string v3, "DMA"

    .line 28
    .line 29
    const/4 v4, 0x1

    .line 30
    invoke-direct {v1, v3, v4, v2}, Lr22;-><init>(Ljava/lang/String;I[Lt22;)V

    .line 31
    .line 32
    .line 33
    sput-object v1, Lr22;->l:Lr22;

    .line 34
    .line 35
    filled-new-array {v0, v1}, [Lr22;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    sput-object v0, Lr22;->m:[Lr22;

    .line 40
    .line 41
    return-void
.end method

.method public varargs constructor <init>(Ljava/lang/String;I[Lt22;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Lr22;->j:[Lt22;

    .line 5
    .line 6
    return-void
.end method

.method public static values()[Lr22;
    .locals 1

    .line 1
    sget-object v0, Lr22;->m:[Lr22;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lr22;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lr22;

    .line 8
    .line 9
    return-object v0
.end method
