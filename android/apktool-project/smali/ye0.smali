.class public final Lye0;
.super Lk0;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lgf0;
.implements Ljava/util/RandomAccess;


# static fields
.field public static final m:Lye0;


# instance fields
.field public k:[I

.field public l:I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lye0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    new-array v2, v1, [I

    .line 5
    .line 6
    invoke-direct {v0, v2, v1, v1}, Lye0;-><init>([IIZ)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lye0;->m:Lye0;

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>([IIZ)V
    .locals 0

    .line 1
    invoke-direct {p0, p3}, Lk0;-><init>(Z)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lye0;->k:[I

    .line 5
    .line 6
    iput p2, p0, Lye0;->l:I

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final add(ILjava/lang/Object;)V
    .locals 4

    .line 1
    check-cast p2, Ljava/lang/Integer;

    .line 2
    .line 3
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    invoke-virtual {p0}, Lk0;->b()V

    .line 8
    .line 9
    .line 10
    if-ltz p1, :cond_1

    .line 11
    .line 12
    iget v0, p0, Lye0;->l:I

    .line 13
    .line 14
    if-gt p1, v0, :cond_1

    .line 15
    .line 16
    iget-object v1, p0, Lye0;->k:[I

    .line 17
    .line 18
    array-length v2, v1

    .line 19
    if-ge v0, v2, :cond_0

    .line 20
    .line 21
    add-int/lit8 v2, p1, 0x1

    .line 22
    .line 23
    sub-int/2addr v0, p1

    .line 24
    invoke-static {v1, p1, v1, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    mul-int/lit8 v0, v0, 0x3

    .line 29
    .line 30
    div-int/lit8 v0, v0, 0x2

    .line 31
    .line 32
    add-int/lit8 v0, v0, 0x1

    .line 33
    .line 34
    new-array v0, v0, [I

    .line 35
    .line 36
    const/4 v2, 0x0

    .line 37
    invoke-static {v1, v2, v0, v2, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 38
    .line 39
    .line 40
    iget-object v1, p0, Lye0;->k:[I

    .line 41
    .line 42
    add-int/lit8 v2, p1, 0x1

    .line 43
    .line 44
    iget v3, p0, Lye0;->l:I

    .line 45
    .line 46
    sub-int/2addr v3, p1

    .line 47
    invoke-static {v1, p1, v0, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 48
    .line 49
    .line 50
    iput-object v0, p0, Lye0;->k:[I

    .line 51
    .line 52
    :goto_0
    iget-object v0, p0, Lye0;->k:[I

    .line 53
    .line 54
    aput p2, v0, p1

    .line 55
    .line 56
    iget p1, p0, Lye0;->l:I

    .line 57
    .line 58
    add-int/lit8 p1, p1, 0x1

    .line 59
    .line 60
    iput p1, p0, Lye0;->l:I

    .line 61
    .line 62
    iget p1, p0, Ljava/util/AbstractList;->modCount:I

    .line 63
    .line 64
    add-int/lit8 p1, p1, 0x1

    .line 65
    .line 66
    iput p1, p0, Ljava/util/AbstractList;->modCount:I

    .line 67
    .line 68
    return-void

    .line 69
    :cond_1
    const-string p2, "Index:"

    .line 70
    .line 71
    const-string v0, ", Size:"

    .line 72
    .line 73
    invoke-static {p2, v0, p1}, Loq;->o(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    iget p0, p0, Lye0;->l:I

    .line 78
    .line 79
    invoke-static {p0, p1}, Lo40;->g(ILjava/lang/StringBuilder;)V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public final add(Ljava/lang/Object;)Z
    .locals 0

    .line 83
    check-cast p1, Ljava/lang/Integer;

    .line 84
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-virtual {p0, p1}, Lye0;->c(I)V

    const/4 p0, 0x1

    return p0
.end method

.method public final addAll(Ljava/util/Collection;)Z
    .locals 5

    .line 1
    invoke-virtual {p0}, Lk0;->b()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lkf0;->a:Ljava/nio/charset/Charset;

    .line 5
    .line 6
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 7
    .line 8
    .line 9
    instance-of v0, p1, Lye0;

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-super {p0, p1}, Lk0;->addAll(Ljava/util/Collection;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0

    .line 18
    :cond_0
    check-cast p1, Lye0;

    .line 19
    .line 20
    iget v0, p1, Lye0;->l:I

    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    return v1

    .line 26
    :cond_1
    iget v2, p0, Lye0;->l:I

    .line 27
    .line 28
    const v3, 0x7fffffff

    .line 29
    .line 30
    .line 31
    sub-int/2addr v3, v2

    .line 32
    if-lt v3, v0, :cond_3

    .line 33
    .line 34
    add-int/2addr v2, v0

    .line 35
    iget-object v0, p0, Lye0;->k:[I

    .line 36
    .line 37
    array-length v3, v0

    .line 38
    if-le v2, v3, :cond_2

    .line 39
    .line 40
    invoke-static {v0, v2}, Ljava/util/Arrays;->copyOf([II)[I

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iput-object v0, p0, Lye0;->k:[I

    .line 45
    .line 46
    :cond_2
    iget-object v3, p1, Lye0;->k:[I

    .line 47
    .line 48
    iget v4, p0, Lye0;->l:I

    .line 49
    .line 50
    iget p1, p1, Lye0;->l:I

    .line 51
    .line 52
    invoke-static {v3, v1, v0, v4, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 53
    .line 54
    .line 55
    iput v2, p0, Lye0;->l:I

    .line 56
    .line 57
    iget p1, p0, Ljava/util/AbstractList;->modCount:I

    .line 58
    .line 59
    const/4 v0, 0x1

    .line 60
    add-int/2addr p1, v0

    .line 61
    iput p1, p0, Ljava/util/AbstractList;->modCount:I

    .line 62
    .line 63
    return v0

    .line 64
    :cond_3
    new-instance p0, Ljava/lang/OutOfMemoryError;

    .line 65
    .line 66
    invoke-direct {p0}, Ljava/lang/OutOfMemoryError;-><init>()V

    .line 67
    .line 68
    .line 69
    throw p0
.end method

.method public final c(I)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lk0;->b()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lye0;->l:I

    .line 5
    .line 6
    iget-object v1, p0, Lye0;->k:[I

    .line 7
    .line 8
    array-length v2, v1

    .line 9
    if-ne v0, v2, :cond_0

    .line 10
    .line 11
    mul-int/lit8 v2, v0, 0x3

    .line 12
    .line 13
    div-int/lit8 v2, v2, 0x2

    .line 14
    .line 15
    add-int/lit8 v2, v2, 0x1

    .line 16
    .line 17
    new-array v2, v2, [I

    .line 18
    .line 19
    const/4 v3, 0x0

    .line 20
    invoke-static {v1, v3, v2, v3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 21
    .line 22
    .line 23
    iput-object v2, p0, Lye0;->k:[I

    .line 24
    .line 25
    move-object v1, v2

    .line 26
    :cond_0
    iget v0, p0, Lye0;->l:I

    .line 27
    .line 28
    add-int/lit8 v2, v0, 0x1

    .line 29
    .line 30
    iput v2, p0, Lye0;->l:I

    .line 31
    .line 32
    aput p1, v1, v0

    .line 33
    .line 34
    return-void
.end method

.method public final contains(Ljava/lang/Object;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lye0;->indexOf(Ljava/lang/Object;)I

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

.method public final d(I)V
    .locals 2

    .line 1
    if-ltz p1, :cond_0

    .line 2
    .line 3
    iget v0, p0, Lye0;->l:I

    .line 4
    .line 5
    if-ge p1, v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const-string v0, "Index:"

    .line 9
    .line 10
    const-string v1, ", Size:"

    .line 11
    .line 12
    invoke-static {v0, v1, p1}, Loq;->o(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iget p0, p0, Lye0;->l:I

    .line 17
    .line 18
    invoke-static {p0, p1}, Lo40;->g(ILjava/lang/StringBuilder;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final e(I)I
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lye0;->d(I)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lye0;->k:[I

    .line 5
    .line 6
    aget p0, p0, p1

    .line 7
    .line 8
    return p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    if-ne p0, p1, :cond_0

    .line 2
    .line 3
    goto :goto_2

    .line 4
    :cond_0
    instance-of v0, p1, Lye0;

    .line 5
    .line 6
    if-nez v0, :cond_1

    .line 7
    .line 8
    invoke-super {p0, p1}, Lk0;->equals(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0

    .line 13
    :cond_1
    check-cast p1, Lye0;

    .line 14
    .line 15
    iget v0, p0, Lye0;->l:I

    .line 16
    .line 17
    iget v1, p1, Lye0;->l:I

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
    iget-object p1, p1, Lye0;->k:[I

    .line 24
    .line 25
    move v0, v2

    .line 26
    :goto_0
    iget v1, p0, Lye0;->l:I

    .line 27
    .line 28
    if-ge v0, v1, :cond_4

    .line 29
    .line 30
    iget-object v1, p0, Lye0;->k:[I

    .line 31
    .line 32
    aget v1, v1, v0

    .line 33
    .line 34
    aget v3, p1, v0

    .line 35
    .line 36
    if-eq v1, v3, :cond_3

    .line 37
    .line 38
    :goto_1
    return v2

    .line 39
    :cond_3
    add-int/lit8 v0, v0, 0x1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_4
    :goto_2
    const/4 p0, 0x1

    .line 43
    return p0
.end method

.method public final g(I)Lif0;
    .locals 2

    .line 1
    iget v0, p0, Lye0;->l:I

    .line 2
    .line 3
    if-lt p1, v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lye0;

    .line 6
    .line 7
    iget-object v1, p0, Lye0;->k:[I

    .line 8
    .line 9
    invoke-static {v1, p1}, Ljava/util/Arrays;->copyOf([II)[I

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iget p0, p0, Lye0;->l:I

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    invoke-direct {v0, p1, p0, v1}, Lye0;-><init>([IIZ)V

    .line 17
    .line 18
    .line 19
    return-object v0

    .line 20
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 21
    .line 22
    invoke-direct {p0}, Ljava/lang/IllegalArgumentException;-><init>()V

    .line 23
    .line 24
    .line 25
    throw p0
.end method

.method public final get(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lye0;->e(I)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final hashCode()I
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    :goto_0
    iget v2, p0, Lye0;->l:I

    .line 4
    .line 5
    if-ge v1, v2, :cond_0

    .line 6
    .line 7
    mul-int/lit8 v0, v0, 0x1f

    .line 8
    .line 9
    iget-object v2, p0, Lye0;->k:[I

    .line 10
    .line 11
    aget v2, v2, v1

    .line 12
    .line 13
    add-int/2addr v0, v2

    .line 14
    add-int/lit8 v1, v1, 0x1

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    return v0
.end method

.method public final indexOf(Ljava/lang/Object;)I
    .locals 3

    .line 1
    instance-of v0, p1, Ljava/lang/Integer;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    check-cast p1, Ljava/lang/Integer;

    .line 7
    .line 8
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    iget v0, p0, Lye0;->l:I

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    :goto_0
    if-ge v1, v0, :cond_2

    .line 16
    .line 17
    iget-object v2, p0, Lye0;->k:[I

    .line 18
    .line 19
    aget v2, v2, v1

    .line 20
    .line 21
    if-ne v2, p1, :cond_1

    .line 22
    .line 23
    return v1

    .line 24
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_2
    :goto_1
    const/4 p0, -0x1

    .line 28
    return p0
.end method

.method public final remove(I)Ljava/lang/Object;
    .locals 4

    .line 1
    invoke-virtual {p0}, Lk0;->b()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lye0;->d(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lye0;->k:[I

    .line 8
    .line 9
    aget v1, v0, p1

    .line 10
    .line 11
    iget v2, p0, Lye0;->l:I

    .line 12
    .line 13
    add-int/lit8 v3, v2, -0x1

    .line 14
    .line 15
    if-ge p1, v3, :cond_0

    .line 16
    .line 17
    add-int/lit8 v3, p1, 0x1

    .line 18
    .line 19
    sub-int/2addr v2, p1

    .line 20
    add-int/lit8 v2, v2, -0x1

    .line 21
    .line 22
    invoke-static {v0, v3, v0, p1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 23
    .line 24
    .line 25
    :cond_0
    iget p1, p0, Lye0;->l:I

    .line 26
    .line 27
    add-int/lit8 p1, p1, -0x1

    .line 28
    .line 29
    iput p1, p0, Lye0;->l:I

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
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

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
    invoke-virtual {p0}, Lk0;->b()V

    .line 2
    .line 3
    .line 4
    if-lt p2, p1, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Lye0;->k:[I

    .line 7
    .line 8
    iget v1, p0, Lye0;->l:I

    .line 9
    .line 10
    sub-int/2addr v1, p2

    .line 11
    invoke-static {v0, p2, v0, p1, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 12
    .line 13
    .line 14
    iget v0, p0, Lye0;->l:I

    .line 15
    .line 16
    sub-int/2addr p2, p1

    .line 17
    sub-int/2addr v0, p2

    .line 18
    iput v0, p0, Lye0;->l:I

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

.method public final set(ILjava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    check-cast p2, Ljava/lang/Integer;

    .line 2
    .line 3
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    invoke-virtual {p0}, Lk0;->b()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p1}, Lye0;->d(I)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lye0;->k:[I

    .line 14
    .line 15
    aget v0, p0, p1

    .line 16
    .line 17
    aput p2, p0, p1

    .line 18
    .line 19
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

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
    iget p0, p0, Lye0;->l:I

    .line 2
    .line 3
    return p0
.end method
