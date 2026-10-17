.class public final Lvp1;
.super Ljava/util/AbstractList;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final j:Ltp1;

.field public final k:Lup1;


# direct methods
.method public constructor <init>(Ltp1;Lup1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/util/AbstractList;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lvp1;->j:Ltp1;

    .line 5
    .line 6
    iput-object p2, p0, Lvp1;->k:Lup1;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final get(I)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Lvp1;->j:Ltp1;

    .line 2
    .line 3
    check-cast v0, Lop1;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lop1;->d(I)I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    iget-object p0, p0, Lvp1;->k:Lup1;

    .line 10
    .line 11
    check-cast p0, Llv1;

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 14
    .line 15
    .line 16
    invoke-static {p1}, Lmo1;->b(I)Lmo1;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    if-nez p0, :cond_0

    .line 21
    .line 22
    sget-object p0, Lmo1;->k:Lmo1;

    .line 23
    .line 24
    :cond_0
    return-object p0
.end method

.method public final size()I
    .locals 0

    .line 1
    iget-object p0, p0, Lvp1;->j:Ltp1;

    .line 2
    .line 3
    check-cast p0, Lop1;

    .line 4
    .line 5
    iget p0, p0, Lop1;->l:I

    .line 6
    .line 7
    return p0
.end method
