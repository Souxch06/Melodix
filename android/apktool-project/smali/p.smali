.class public final Lp;
.super Lkq;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public m:Li21;

.field public synthetic n:Ljava/lang/Object;

.field public final synthetic o:Lny0;

.field public p:I


# direct methods
.method public constructor <init>(Lny0;Lkq;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lp;->o:Lny0;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Lkq;-><init>(Liq;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final m(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iput-object p1, p0, Lp;->n:Ljava/lang/Object;

    .line 2
    .line 3
    iget p1, p0, Lp;->p:I

    .line 4
    .line 5
    const/high16 v0, -0x80000000

    .line 6
    .line 7
    or-int/2addr p1, v0

    .line 8
    iput p1, p0, Lp;->p:I

    .line 9
    .line 10
    iget-object p1, p0, Lp;->o:Lny0;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-virtual {p1, v0, p0}, Lny0;->q(Ls50;Lkq;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method
