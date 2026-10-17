.class public final Ll32;
.super Lf22;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final d:[B


# direct methods
.method public constructor <init>([B)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    const/16 v1, 0x19

    .line 3
    .line 4
    invoke-static {p1, v0, v1}, Ljava/util/Arrays;->copyOfRange([BII)[B

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-direct {p0, v0}, Lf22;-><init>([B)V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Ll32;->d:[B

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final G()[B
    .locals 0

    .line 1
    iget-object p0, p0, Ll32;->d:[B

    .line 2
    .line 3
    return-object p0
.end method
