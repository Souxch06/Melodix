.class public final Lyo0;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lti;
.implements Lui1;


# instance fields
.field public final j:Lvi;

.field public final synthetic k:Lzo0;


# direct methods
.method public constructor <init>(Lzo0;Lvi;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lyo0;->k:Lzo0;

    .line 5
    .line 6
    iput-object p2, p0, Lyo0;->j:Lvi;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a(Lq31;I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lyo0;->j:Lvi;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lvi;->a(Lq31;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final d(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lyo0;->j:Lvi;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lvi;->d(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final getContext()Lsq;
    .locals 0

    .line 1
    iget-object p0, p0, Lyo0;->j:Lvi;

    .line 2
    .line 3
    iget-object p0, p0, Lvi;->n:Lsq;

    .line 4
    .line 5
    return-object p0
.end method

.method public final i(Ljava/lang/Object;Lg90;)Log0;
    .locals 1

    .line 1
    check-cast p1, Lwe1;

    .line 2
    .line 3
    new-instance p2, Lui;

    .line 4
    .line 5
    iget-object v0, p0, Lyo0;->k:Lzo0;

    .line 6
    .line 7
    invoke-direct {p2, v0, p0}, Lui;-><init>(Lzo0;Lyo0;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lyo0;->j:Lvi;

    .line 11
    .line 12
    invoke-virtual {p0, p1, p2}, Lvi;->i(Ljava/lang/Object;Lg90;)Log0;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    if-eqz p0, :cond_0

    .line 17
    .line 18
    sget-object p1, Lzo0;->h:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 19
    .line 20
    const/4 p2, 0x0

    .line 21
    invoke-virtual {p1, v0, p2}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-object p0
.end method

.method public final k(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lyo0;->j:Lvi;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lvi;->k(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
