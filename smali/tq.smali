.class public final Ltq;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lrq;


# instance fields
.field public final j:Lr80;

.field public final k:Lrq;


# direct methods
.method public constructor <init>(Lrq;Lr80;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    .line 6
    .line 7
    iput-object p2, p0, Ltq;->j:Lr80;

    .line 8
    .line 9
    instance-of p2, p1, Ltq;

    .line 10
    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    check-cast p1, Ltq;

    .line 14
    .line 15
    iget-object p1, p1, Ltq;->k:Lrq;

    .line 16
    .line 17
    :cond_0
    iput-object p1, p0, Ltq;->k:Lrq;

    .line 18
    .line 19
    return-void
.end method
