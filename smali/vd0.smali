.class public final Lvd0;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public a:[Ljava/lang/Object;

.field public b:I

.field public c:Z


# direct methods
.method public constructor <init>(I)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "initialCapacity"

    .line 5
    .line 6
    invoke-static {p1, v0}, Lkp1;->a(ILjava/lang/String;)V

    .line 7
    .line 8
    .line 9
    new-array p1, p1, [Ljava/lang/Object;

    .line 10
    .line 11
    iput-object p1, p0, Lvd0;->a:[Ljava/lang/Object;

    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    iput p1, p0, Lvd0;->b:I

    .line 15
    .line 16
    return-void
.end method

.method public static d(II)I
    .locals 1

    .line 1
    if-ltz p1, :cond_2

    .line 2
    .line 3
    shr-int/lit8 v0, p0, 0x1

    .line 4
    .line 5
    add-int/2addr p0, v0

    .line 6
    add-int/lit8 p0, p0, 0x1

    .line 7
    .line 8
    if-ge p0, p1, :cond_0

    .line 9
    .line 10
    add-int/lit8 p1, p1, -0x1

    .line 11
    .line 12
    invoke-static {p1}, Ljava/lang/Integer;->highestOneBit(I)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    shl-int/lit8 p0, p0, 0x1

    .line 17
    .line 18
    :cond_0
    if-gez p0, :cond_1

    .line 19
    .line 20
    const p0, 0x7fffffff

    .line 21
    .line 22
    .line 23
    :cond_1
    return p0

    .line 24
    :cond_2
    new-instance p0, Ljava/lang/AssertionError;

    .line 25
    .line 26
    const-string p1, "cannot store more than MAX_VALUE elements"

    .line 27
    .line 28
    invoke-direct {p0, p1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    throw p0
.end method


# virtual methods
.method public final a(Ljava/lang/Object;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lvd0;->b:I

    .line 5
    .line 6
    add-int/lit8 v0, v0, 0x1

    .line 7
    .line 8
    iget-object v1, p0, Lvd0;->a:[Ljava/lang/Object;

    .line 9
    .line 10
    array-length v2, v1

    .line 11
    const/4 v3, 0x0

    .line 12
    if-ge v2, v0, :cond_0

    .line 13
    .line 14
    array-length v2, v1

    .line 15
    invoke-static {v2, v0}, Lvd0;->d(II)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    invoke-static {v1, v0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iput-object v0, p0, Lvd0;->a:[Ljava/lang/Object;

    .line 24
    .line 25
    iput-boolean v3, p0, Lvd0;->c:Z

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    iget-boolean v0, p0, Lvd0;->c:Z

    .line 29
    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    invoke-virtual {v1}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    check-cast v0, [Ljava/lang/Object;

    .line 37
    .line 38
    iput-object v0, p0, Lvd0;->a:[Ljava/lang/Object;

    .line 39
    .line 40
    iput-boolean v3, p0, Lvd0;->c:Z

    .line 41
    .line 42
    :cond_1
    :goto_0
    iget-object v0, p0, Lvd0;->a:[Ljava/lang/Object;

    .line 43
    .line 44
    iget v1, p0, Lvd0;->b:I

    .line 45
    .line 46
    add-int/lit8 v2, v1, 0x1

    .line 47
    .line 48
    iput v2, p0, Lvd0;->b:I

    .line 49
    .line 50
    aput-object p1, v0, v1

    .line 51
    .line 52
    return-void
.end method

.method public b()Lmz0;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lvd0;->c:Z

    .line 3
    .line 4
    iget-object v0, p0, Lvd0;->a:[Ljava/lang/Object;

    .line 5
    .line 6
    iget p0, p0, Lvd0;->b:I

    .line 7
    .line 8
    invoke-static {p0, v0}, Lzd0;->k(I[Ljava/lang/Object;)Lmz0;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public c()Ltz0;
    .locals 8

    .line 1
    iget-object v0, p0, Lvd0;->a:[Ljava/lang/Object;

    .line 2
    .line 3
    iget v1, p0, Lvd0;->b:I

    .line 4
    .line 5
    sget-object v2, Lbp0;->j:Lbp0;

    .line 6
    .line 7
    const/4 v3, 0x1

    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    invoke-static {v2}, Lce0;->q(Ljava/util/Comparator;)Ltz0;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    goto :goto_1

    .line 15
    :cond_0
    invoke-static {v1, v0}, Lea1;->c(I[Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    const/4 v4, 0x0

    .line 19
    invoke-static {v0, v4, v1, v2}, Ljava/util/Arrays;->sort([Ljava/lang/Object;IILjava/util/Comparator;)V

    .line 20
    .line 21
    .line 22
    move v4, v3

    .line 23
    move v5, v4

    .line 24
    :goto_0
    if-ge v4, v1, :cond_2

    .line 25
    .line 26
    aget-object v6, v0, v4

    .line 27
    .line 28
    add-int/lit8 v7, v5, -0x1

    .line 29
    .line 30
    aget-object v7, v0, v7

    .line 31
    .line 32
    invoke-virtual {v2, v6, v7}, Lbp0;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    .line 33
    .line 34
    .line 35
    move-result v7

    .line 36
    if-eqz v7, :cond_1

    .line 37
    .line 38
    add-int/lit8 v7, v5, 0x1

    .line 39
    .line 40
    aput-object v6, v0, v5

    .line 41
    .line 42
    move v5, v7

    .line 43
    :cond_1
    add-int/lit8 v4, v4, 0x1

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_2
    const/4 v4, 0x0

    .line 47
    invoke-static {v0, v5, v1, v4}, Ljava/util/Arrays;->fill([Ljava/lang/Object;IILjava/lang/Object;)V

    .line 48
    .line 49
    .line 50
    array-length v1, v0

    .line 51
    div-int/lit8 v1, v1, 0x2

    .line 52
    .line 53
    if-ge v5, v1, :cond_3

    .line 54
    .line 55
    invoke-static {v0, v5}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    :cond_3
    new-instance v1, Ltz0;

    .line 60
    .line 61
    invoke-static {v5, v0}, Lzd0;->k(I[Ljava/lang/Object;)Lmz0;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-direct {v1, v0, v2}, Ltz0;-><init>(Lzd0;Ljava/util/Comparator;)V

    .line 66
    .line 67
    .line 68
    move-object v0, v1

    .line 69
    :goto_1
    iget-object v1, v0, Ltz0;->p:Lzd0;

    .line 70
    .line 71
    invoke-virtual {v1}, Ljava/util/AbstractCollection;->size()I

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    iput v1, p0, Lvd0;->b:I

    .line 76
    .line 77
    iput-boolean v3, p0, Lvd0;->c:Z

    .line 78
    .line 79
    return-object v0
.end method
