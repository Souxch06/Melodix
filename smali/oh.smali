.class public final Loh;
.super Lrh;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final m:I

.field public final n:I


# direct methods
.method public constructor <init>([BII)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lrh;-><init>([B)V

    .line 2
    .line 3
    .line 4
    add-int v0, p2, p3

    .line 5
    .line 6
    array-length p1, p1

    .line 7
    invoke-static {p2, v0, p1}, Lrh;->c(III)I

    .line 8
    .line 9
    .line 10
    iput p2, p0, Loh;->m:I

    .line 11
    .line 12
    iput p3, p0, Loh;->n:I

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final b(I)B
    .locals 3

    .line 1
    add-int/lit8 v0, p1, 0x1

    .line 2
    .line 3
    iget v1, p0, Loh;->n:I

    .line 4
    .line 5
    sub-int v0, v1, v0

    .line 6
    .line 7
    or-int/2addr v0, p1

    .line 8
    if-gez v0, :cond_1

    .line 9
    .line 10
    if-gez p1, :cond_0

    .line 11
    .line 12
    new-instance p0, Ljava/lang/ArrayIndexOutOfBoundsException;

    .line 13
    .line 14
    const-string v0, "Index < 0: "

    .line 15
    .line 16
    invoke-static {p1, v0}, Loq;->f(ILjava/lang/String;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-direct {p0, p1}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    throw p0

    .line 24
    :cond_0
    new-instance p0, Ljava/lang/ArrayIndexOutOfBoundsException;

    .line 25
    .line 26
    const-string v0, "Index > length: "

    .line 27
    .line 28
    const-string v2, ", "

    .line 29
    .line 30
    invoke-static {p1, v1, v0, v2}, Loq;->e(IILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-direct {p0, p1}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    throw p0

    .line 38
    :cond_1
    iget v0, p0, Loh;->m:I

    .line 39
    .line 40
    add-int/2addr v0, p1

    .line 41
    iget-object p0, p0, Lrh;->k:[B

    .line 42
    .line 43
    aget-byte p0, p0, v0

    .line 44
    .line 45
    return p0
.end method

.method public final d()I
    .locals 0

    .line 1
    iget p0, p0, Loh;->m:I

    .line 2
    .line 3
    return p0
.end method

.method public final e(I)B
    .locals 1

    .line 1
    iget v0, p0, Loh;->m:I

    .line 2
    .line 3
    add-int/2addr v0, p1

    .line 4
    iget-object p0, p0, Lrh;->k:[B

    .line 5
    .line 6
    aget-byte p0, p0, v0

    .line 7
    .line 8
    return p0
.end method

.method public final size()I
    .locals 0

    .line 1
    iget p0, p0, Loh;->n:I

    .line 2
    .line 3
    return p0
.end method
