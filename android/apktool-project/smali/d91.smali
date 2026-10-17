.class public final Ld91;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Liq;
.implements Lbr;


# instance fields
.field public final j:Liq;

.field public final k:Lsq;


# direct methods
.method public constructor <init>(Liq;Lsq;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ld91;->j:Liq;

    .line 5
    .line 6
    iput-object p2, p0, Ld91;->k:Lsq;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final c()Lbr;
    .locals 1

    .line 1
    iget-object p0, p0, Ld91;->j:Liq;

    .line 2
    .line 3
    instance-of v0, p0, Lbr;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    check-cast p0, Lbr;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public final d(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ld91;->j:Liq;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Liq;->d(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final getContext()Lsq;
    .locals 0

    .line 1
    iget-object p0, p0, Ld91;->k:Lsq;

    .line 2
    .line 3
    return-object p0
.end method
