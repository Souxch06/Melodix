.class public final Lo11;
.super Ljg0;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final n:Lkg0;


# direct methods
.method public constructor <init>(Lkg0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lek0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lo11;->n:Lkg0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final l()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public final m(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ljg0;->k()Lng0;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Lng0;->A()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    instance-of v0, p1, Lql;

    .line 10
    .line 11
    iget-object p0, p0, Lo11;->n:Lkg0;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    check-cast p1, Lql;

    .line 16
    .line 17
    iget-object p1, p1, Lql;->a:Ljava/lang/Throwable;

    .line 18
    .line 19
    invoke-static {p1}, Lk42;->c(Ljava/lang/Throwable;)Lj11;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p0, p1}, Lvi;->d(Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    invoke-static {p1}, Lxg;->s(Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p0, p1}, Lvi;->d(Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method
