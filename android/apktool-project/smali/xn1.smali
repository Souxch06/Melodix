.class public final Lxn1;
.super Ljava/util/AbstractSet;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final j:I

.field public final synthetic k:Lyn1;


# direct methods
.method public constructor <init>(Lyn1;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lxn1;->k:Lyn1;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/AbstractSet;-><init>()V

    .line 4
    .line 5
    .line 6
    iput p2, p0, Lxn1;->j:I

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final b()I
    .locals 2

    .line 1
    const/4 v0, -0x1

    .line 2
    iget v1, p0, Lxn1;->j:I

    .line 3
    .line 4
    if-ne v1, v0, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    return p0

    .line 8
    :cond_0
    iget-object p0, p0, Lxn1;->k:Lyn1;

    .line 9
    .line 10
    iget-object p0, p0, Lyn1;->k:[I

    .line 11
    .line 12
    aget p0, p0, v1

    .line 13
    .line 14
    return p0
.end method

.method public final c()I
    .locals 1

    .line 1
    iget-object v0, p0, Lxn1;->k:Lyn1;

    .line 2
    .line 3
    iget-object v0, v0, Lyn1;->k:[I

    .line 4
    .line 5
    iget p0, p0, Lxn1;->j:I

    .line 6
    .line 7
    add-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    aget p0, v0, p0

    .line 10
    .line 11
    return p0
.end method

.method public final contains(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    invoke-virtual {p0}, Lxn1;->b()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Lxn1;->c()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, -0x1

    .line 10
    iget v3, p0, Lxn1;->j:I

    .line 11
    .line 12
    if-ne v3, v2, :cond_0

    .line 13
    .line 14
    sget-object v2, Lyn1;->o:Ld2;

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    sget-object v2, Lzn1;->b:Ld2;

    .line 18
    .line 19
    :goto_0
    iget-object p0, p0, Lxn1;->k:Lyn1;

    .line 20
    .line 21
    iget-object p0, p0, Lyn1;->j:[Ljava/lang/Object;

    .line 22
    .line 23
    invoke-static {p0, v0, v1, p1, v2}, Ljava/util/Arrays;->binarySearch([Ljava/lang/Object;IILjava/lang/Object;Ljava/util/Comparator;)I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-ltz p0, :cond_1

    .line 28
    .line 29
    const/4 p0, 0x1

    .line 30
    return p0

    .line 31
    :cond_1
    const/4 p0, 0x0

    .line 32
    return p0
.end method

.method public final iterator()Ljava/util/Iterator;
    .locals 2

    .line 1
    new-instance v0, Ld0;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    invoke-direct {v0, p0, v1}, Ld0;-><init>(Ljava/util/AbstractSet;I)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method

.method public final size()I
    .locals 1

    .line 1
    invoke-virtual {p0}, Lxn1;->c()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Lxn1;->b()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    sub-int/2addr v0, p0

    .line 10
    return v0
.end method
