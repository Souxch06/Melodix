.class public final Loz0;
.super Lbe0;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final transient m:Lrz0;

.field public final transient n:[Ljava/lang/Object;

.field public final transient o:I


# direct methods
.method public constructor <init>(Lrz0;[Ljava/lang/Object;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/util/AbstractCollection;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Loz0;->m:Lrz0;

    .line 5
    .line 6
    iput-object p2, p0, Loz0;->n:[Ljava/lang/Object;

    .line 7
    .line 8
    iput p3, p0, Loz0;->o:I

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final c([Ljava/lang/Object;)I
    .locals 0

    .line 1
    invoke-virtual {p0}, Lbe0;->b()Lzd0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Lzd0;->c([Ljava/lang/Object;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public final contains(Ljava/lang/Object;)Z
    .locals 2

    .line 1
    instance-of v0, p1, Ljava/util/Map$Entry;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    check-cast p1, Ljava/util/Map$Entry;

    .line 7
    .line 8
    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    iget-object p0, p0, Loz0;->m:Lrz0;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Lrz0;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p1, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    if-eqz p0, :cond_0

    .line 29
    .line 30
    const/4 p0, 0x1

    .line 31
    return p0

    .line 32
    :cond_0
    return v1
.end method

.method public final h()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public final j()Lcf1;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lbe0;->b()Lzd0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, v0}, Lzd0;->p(I)Lwd0;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public final p()Lzd0;
    .locals 1

    .line 1
    new-instance v0, Lnz0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lnz0;-><init>(Loz0;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public final size()I
    .locals 0

    .line 1
    iget p0, p0, Loz0;->o:I

    .line 2
    .line 3
    return p0
.end method
