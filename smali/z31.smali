.class public final Lz31;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ls50;


# instance fields
.field public final j:Ly31;


# direct methods
.method public constructor <init>(Lpv0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lz31;->j:Ly31;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final h(Ljava/lang/Object;Liq;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lz31;->j:Ly31;

    .line 2
    .line 3
    invoke-interface {p0, p2, p1}, Ly31;->b(Liq;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget-object p1, Lar;->j:Lar;

    .line 8
    .line 9
    if-ne p0, p1, :cond_0

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    sget-object p0, Lwe1;->a:Lwe1;

    .line 13
    .line 14
    return-object p0
.end method
