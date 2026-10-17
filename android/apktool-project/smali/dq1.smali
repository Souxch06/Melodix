.class public final Ldq1;
.super Lro1;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/util/RandomAccess;
.implements Lxp1;
.implements Lrq1;


# static fields
.field public static final m:[J

.field public static final n:Ldq1;


# instance fields
.field public k:[J

.field public l:I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v1, v0, [J

    .line 3
    .line 4
    sput-object v1, Ldq1;->m:[J

    .line 5
    .line 6
    new-instance v2, Ldq1;

    .line 7
    .line 8
    invoke-direct {v2, v1, v0, v0}, Ldq1;-><init>([JIZ)V

    .line 9
    .line 10
    .line 11
    sput-object v2, Ldq1;->n:Ldq1;

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>([JIZ)V
    .locals 0

    .line 1
    invoke-direct {p0, p3}, Lro1;-><init>(Z)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ldq1;->k:[J

    .line 5
    .line 6
    iput p2, p0, Ldq1;->l:I

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final add(ILjava/lang/Object;)V
    .locals 5

    .line 1
    check-cast p2, Ljava/lang/Long;

    .line 2
    .line 3
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    invoke-virtual {p0}, Lro1;->b()V

    .line 8
    .line 9
    .line 10
    if-ltz p1, :cond_1

    .line 11
    .line 12
    iget p2, p0, Ldq1;->l:I

    .line 13
    .line 14
    if-gt p1, p2, :cond_1

    .line 15
    .line 16
    add-int/lit8 v2, p1, 0x1

    .line 17
    .line 18
    iget-object v3, p0, Ldq1;->k:[J

    .line 19
    .line 20
    array-length v4, v3

    .line 21
    if-ge p2, v4, :cond_0

    .line 22
    .line 23
    sub-int/2addr p2, p1

    .line 24
    invoke-static {v3, p1, v3, v2, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    mul-int/lit8 v4, v4, 0x3

    .line 29
    .line 30
    div-int/lit8 v4, v4, 0x2

    .line 31
    .line 32
    add-int/lit8 v4, v4, 0x1

    .line 33
    .line 34
    const/16 p2, 0xa

    .line 35
    .line 36
    invoke-static {v4, p2}, Ljava/lang/Math;->max(II)I

    .line 37
    .line 38
    .line 39
    move-result p2

    .line 40
    new-array p2, p2, [J

    .line 41
    .line 42
    iget-object v3, p0, Ldq1;->k:[J

    .line 43
    .line 44
    const/4 v4, 0x0

    .line 45
    invoke-static {v3, v4, p2, v4, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 46
    .line 47
    .line 48
    iget-object v3, p0, Ldq1;->k:[J

    .line 49
    .line 50
    iget v4, p0, Ldq1;->l:I

    .line 51
    .line 52
    sub-int/2addr v4, p1

    .line 53
    invoke-static {v3, p1, p2, v2, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 54
    .line 55
    .line 56
    iput-object p2, p0, Ldq1;->k:[J

    .line 57
    .line 58
    :goto_0
    iget-object p2, p0, Ldq1;->k:[J

    .line 59
    .line 60
    aput-wide v0, p2, p1

    .line 61
    .line 62
    iget p1, p0, Ldq1;->l:I

    .line 63
    .line 64
    add-int/lit8 p1, p1, 0x1

    .line 65
    .line 66
    iput p1, p0, Ldq1;->l:I

    .line 67
    .line 68
    iget p1, p0, Ljava/util/AbstractList;->modCount:I

    .line 69
    .line 70
    add-int/lit8 p1, p1, 0x1

    .line 71
    .line 72
    iput p1, p0, Ljava/util/AbstractList;->modCount:I

    .line 73
    .line 74
    return-void

    .line 75
    :cond_1
    iget p0, p0, Ldq1;->l:I

    .line 76
    .line 77
    const/16 p2, 0xd

    .line 78
    .line 79
    const-string v0, "Index:"

    .line 80
    .line 81
    const-string v1, ", Size:"

    .line 82
    .line 83
    invoke-static {p0, p1, p2, v0, v1}, Lto1;->a(IIBLjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-static {p0}, Lz0;->i(Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method public final bridge synthetic add(Ljava/lang/Object;)Z
    .locals 2

    .line 91
    check-cast p1, Ljava/lang/Long;

    .line 92
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Ldq1;->e(J)V

    const/4 p0, 0x1

    return p0
.end method

.method public final addAll(Ljava/util/Collection;)Z
    .locals 5

    .line 1
    invoke-virtual {p0}, Lro1;->b()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    instance-of v0, p1, Ldq1;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-super {p0, p1}, Lro1;->addAll(Ljava/util/Collection;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_0
    check-cast p1, Ldq1;

    .line 17
    .line 18
    iget v0, p1, Ldq1;->l:I

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    return v1

    .line 24
    :cond_1
    iget v2, p0, Ldq1;->l:I

    .line 25
    .line 26
    const v3, 0x7fffffff

    .line 27
    .line 28
    .line 29
    sub-int/2addr v3, v2

    .line 30
    if-lt v3, v0, :cond_3

    .line 31
    .line 32
    add-int/2addr v2, v0

    .line 33
    iget-object v0, p0, Ldq1;->k:[J

    .line 34
    .line 35
    array-length v3, v0

    .line 36
    if-le v2, v3, :cond_2

    .line 37
    .line 38
    invoke-static {v0, v2}, Ljava/util/Arrays;->copyOf([JI)[J

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    iput-object v0, p0, Ldq1;->k:[J

    .line 43
    .line 44
    :cond_2
    iget-object v3, p1, Ldq1;->k:[J

    .line 45
    .line 46
    iget v4, p0, Ldq1;->l:I

    .line 47
    .line 48
    iget p1, p1, Ldq1;->l:I

    .line 49
    .line 50
    invoke-static {v3, v1, v0, v4, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 51
    .line 52
    .line 53
    iput v2, p0, Ldq1;->l:I

    .line 54
    .line 55
    iget p1, p0, Ljava/util/AbstractList;->modCount:I

    .line 56
    .line 57
    const/4 v0, 0x1

    .line 58
    add-int/2addr p1, v0

    .line 59
    iput p1, p0, Ljava/util/AbstractList;->modCount:I

    .line 60
    .line 61
    return v0

    .line 62
    :cond_3
    new-instance p0, Ljava/lang/OutOfMemoryError;

    .line 63
    .line 64
    invoke-direct {p0}, Ljava/lang/OutOfMemoryError;-><init>()V

    .line 65
    .line 66
    .line 67
    throw p0
.end method

.method public final c(I)J
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, Ldq1;->f(I)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ldq1;->k:[J

    .line 5
    .line 6
    aget-wide v0, p0, p1

    .line 7
    .line 8
    return-wide v0
.end method

.method public final contains(Ljava/lang/Object;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ldq1;->indexOf(Ljava/lang/Object;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 p1, -0x1

    .line 6
    if-eq p0, p1, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public final d(I)Ldq1;
    .locals 2

    .line 1
    iget v0, p0, Ldq1;->l:I

    .line 2
    .line 3
    if-lt p1, v0, :cond_1

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    sget-object p1, Ldq1;->m:[J

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, p0, Ldq1;->k:[J

    .line 11
    .line 12
    invoke-static {v0, p1}, Ljava/util/Arrays;->copyOf([JI)[J

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    :goto_0
    new-instance v0, Ldq1;

    .line 17
    .line 18
    iget p0, p0, Ldq1;->l:I

    .line 19
    .line 20
    const/4 v1, 0x1

    .line 21
    invoke-direct {v0, p1, p0, v1}, Ldq1;-><init>([JIZ)V

    .line 22
    .line 23
    .line 24
    return-object v0

    .line 25
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 26
    .line 27
    invoke-direct {p0}, Ljava/lang/IllegalArgumentException;-><init>()V

    .line 28
    .line 29
    .line 30
    throw p0
.end method

.method public final e(J)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lro1;->b()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ldq1;->l:I

    .line 5
    .line 6
    iget-object v1, p0, Ldq1;->k:[J

    .line 7
    .line 8
    array-length v2, v1

    .line 9
    if-ne v0, v2, :cond_0

    .line 10
    .line 11
    mul-int/lit8 v2, v2, 0x3

    .line 12
    .line 13
    div-int/lit8 v2, v2, 0x2

    .line 14
    .line 15
    add-int/lit8 v2, v2, 0x1

    .line 16
    .line 17
    const/16 v0, 0xa

    .line 18
    .line 19
    invoke-static {v2, v0}, Ljava/lang/Math;->max(II)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    new-array v1, v0, [J

    .line 24
    .line 25
    iget-object v0, p0, Ldq1;->k:[J

    .line 26
    .line 27
    iget v2, p0, Ldq1;->l:I

    .line 28
    .line 29
    const/4 v3, 0x0

    .line 30
    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 31
    .line 32
    .line 33
    iput-object v1, p0, Ldq1;->k:[J

    .line 34
    .line 35
    :cond_0
    iget v0, p0, Ldq1;->l:I

    .line 36
    .line 37
    add-int/lit8 v2, v0, 0x1

    .line 38
    .line 39
    iput v2, p0, Ldq1;->l:I

    .line 40
    .line 41
    aput-wide p1, v1, v0

    .line 42
    .line 43
    return-void
.end method

.method public final equals(Ljava/lang/Object;)Z
    .locals 7

    .line 1
    if-ne p0, p1, :cond_0

    .line 2
    .line 3
    goto :goto_2

    .line 4
    :cond_0
    instance-of v0, p1, Ldq1;

    .line 5
    .line 6
    if-nez v0, :cond_1

    .line 7
    .line 8
    invoke-super {p0, p1}, Lro1;->equals(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0

    .line 13
    :cond_1
    check-cast p1, Ldq1;

    .line 14
    .line 15
    iget v0, p0, Ldq1;->l:I

    .line 16
    .line 17
    iget v1, p1, Ldq1;->l:I

    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    if-eq v0, v1, :cond_2

    .line 21
    .line 22
    goto :goto_1

    .line 23
    :cond_2
    iget-object p1, p1, Ldq1;->k:[J

    .line 24
    .line 25
    move v0, v2

    .line 26
    :goto_0
    iget v1, p0, Ldq1;->l:I

    .line 27
    .line 28
    if-ge v0, v1, :cond_4

    .line 29
    .line 30
    iget-object v1, p0, Ldq1;->k:[J

    .line 31
    .line 32
    aget-wide v3, v1, v0

    .line 33
    .line 34
    aget-wide v5, p1, v0

    .line 35
    .line 36
    cmp-long v1, v3, v5

    .line 37
    .line 38
    if-eqz v1, :cond_3

    .line 39
    .line 40
    :goto_1
    return v2

    .line 41
    :cond_3
    add-int/lit8 v0, v0, 0x1

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_4
    :goto_2
    const/4 p0, 0x1

    .line 45
    return p0
.end method

.method public final f(I)V
    .locals 3

    .line 1
    if-ltz p1, :cond_0

    .line 2
    .line 3
    iget v0, p0, Ldq1;->l:I

    .line 4
    .line 5
    if-ge p1, v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget p0, p0, Ldq1;->l:I

    .line 9
    .line 10
    const/16 v0, 0xd

    .line 11
    .line 12
    const-string v1, "Index:"

    .line 13
    .line 14
    const-string v2, ", Size:"

    .line 15
    .line 16
    invoke-static {p0, p1, v0, v1, v2}, Lto1;->a(IIBLjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-static {p0}, Lz0;->i(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final synthetic get(I)Ljava/lang/Object;
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, Ldq1;->f(I)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ldq1;->k:[J

    .line 5
    .line 6
    aget-wide v0, p0, p1

    .line 7
    .line 8
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public final hashCode()I
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    :goto_0
    iget v2, p0, Ldq1;->l:I

    .line 4
    .line 5
    if-ge v0, v2, :cond_0

    .line 6
    .line 7
    mul-int/lit8 v1, v1, 0x1f

    .line 8
    .line 9
    iget-object v2, p0, Ldq1;->k:[J

    .line 10
    .line 11
    aget-wide v3, v2, v0

    .line 12
    .line 13
    sget-object v2, Lwp1;->a:[B

    .line 14
    .line 15
    const/16 v2, 0x20

    .line 16
    .line 17
    ushr-long v5, v3, v2

    .line 18
    .line 19
    xor-long v2, v3, v5

    .line 20
    .line 21
    long-to-int v2, v2

    .line 22
    add-int/2addr v1, v2

    .line 23
    add-int/lit8 v0, v0, 0x1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    return v1
.end method

.method public final indexOf(Ljava/lang/Object;)I
    .locals 6

    .line 1
    instance-of v0, p1, Ljava/lang/Long;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    check-cast p1, Ljava/lang/Long;

    .line 7
    .line 8
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 9
    .line 10
    .line 11
    move-result-wide v0

    .line 12
    iget p1, p0, Ldq1;->l:I

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    :goto_0
    if-ge v2, p1, :cond_2

    .line 16
    .line 17
    iget-object v3, p0, Ldq1;->k:[J

    .line 18
    .line 19
    aget-wide v4, v3, v2

    .line 20
    .line 21
    cmp-long v3, v4, v0

    .line 22
    .line 23
    if-nez v3, :cond_1

    .line 24
    .line 25
    return v2

    .line 26
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_2
    :goto_1
    const/4 p0, -0x1

    .line 30
    return p0
.end method

.method public final bridge synthetic l(I)Lyp1;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ldq1;->d(I)Ldq1;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final bridge synthetic remove(I)Ljava/lang/Object;
    .locals 5

    .line 1
    invoke-virtual {p0}, Lro1;->b()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ldq1;->f(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ldq1;->k:[J

    .line 8
    .line 9
    aget-wide v1, v0, p1

    .line 10
    .line 11
    iget v3, p0, Ldq1;->l:I

    .line 12
    .line 13
    add-int/lit8 v4, v3, -0x1

    .line 14
    .line 15
    if-ge p1, v4, :cond_0

    .line 16
    .line 17
    add-int/lit8 v4, p1, 0x1

    .line 18
    .line 19
    sub-int/2addr v3, p1

    .line 20
    add-int/lit8 v3, v3, -0x1

    .line 21
    .line 22
    invoke-static {v0, v4, v0, p1, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 23
    .line 24
    .line 25
    :cond_0
    iget p1, p0, Ldq1;->l:I

    .line 26
    .line 27
    add-int/lit8 p1, p1, -0x1

    .line 28
    .line 29
    iput p1, p0, Ldq1;->l:I

    .line 30
    .line 31
    iget p1, p0, Ljava/util/AbstractList;->modCount:I

    .line 32
    .line 33
    add-int/lit8 p1, p1, 0x1

    .line 34
    .line 35
    iput p1, p0, Ljava/util/AbstractList;->modCount:I

    .line 36
    .line 37
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0
.end method

.method public final removeRange(II)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lro1;->b()V

    .line 2
    .line 3
    .line 4
    if-lt p2, p1, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Ldq1;->k:[J

    .line 7
    .line 8
    iget v1, p0, Ldq1;->l:I

    .line 9
    .line 10
    sub-int/2addr v1, p2

    .line 11
    invoke-static {v0, p2, v0, p1, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 12
    .line 13
    .line 14
    iget v0, p0, Ldq1;->l:I

    .line 15
    .line 16
    sub-int/2addr p2, p1

    .line 17
    sub-int/2addr v0, p2

    .line 18
    iput v0, p0, Ldq1;->l:I

    .line 19
    .line 20
    iget p1, p0, Ljava/util/AbstractList;->modCount:I

    .line 21
    .line 22
    add-int/lit8 p1, p1, 0x1

    .line 23
    .line 24
    iput p1, p0, Ljava/util/AbstractList;->modCount:I

    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    const-string p0, "toIndex < fromIndex"

    .line 28
    .line 29
    invoke-static {p0}, Lz0;->i(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final bridge synthetic set(ILjava/lang/Object;)Ljava/lang/Object;
    .locals 4

    .line 1
    check-cast p2, Ljava/lang/Long;

    .line 2
    .line 3
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    invoke-virtual {p0}, Lro1;->b()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ldq1;->f(I)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Ldq1;->k:[J

    .line 14
    .line 15
    aget-wide v2, p0, p1

    .line 16
    .line 17
    aput-wide v0, p0, p1

    .line 18
    .line 19
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public final size()I
    .locals 0

    .line 1
    iget p0, p0, Ldq1;->l:I

    .line 2
    .line 3
    return p0
.end method
