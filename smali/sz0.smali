.class public final Lsz0;
.super Lbe0;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final r:[Ljava/lang/Object;

.field public static final s:Lsz0;


# instance fields
.field public final transient m:[Ljava/lang/Object;

.field public final transient n:I

.field public final transient o:[Ljava/lang/Object;

.field public final transient p:I

.field public final transient q:I


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v5, v0, [Ljava/lang/Object;

    .line 3
    .line 4
    sput-object v5, Lsz0;->r:[Ljava/lang/Object;

    .line 5
    .line 6
    new-instance v1, Lsz0;

    .line 7
    .line 8
    const/4 v3, 0x0

    .line 9
    const/4 v4, 0x0

    .line 10
    const/4 v2, 0x0

    .line 11
    move-object v6, v5

    .line 12
    invoke-direct/range {v1 .. v6}, Lsz0;-><init>(III[Ljava/lang/Object;[Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    sput-object v1, Lsz0;->s:Lsz0;

    .line 16
    .line 17
    return-void
.end method

.method public constructor <init>(III[Ljava/lang/Object;[Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/util/AbstractCollection;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p4, p0, Lsz0;->m:[Ljava/lang/Object;

    .line 5
    .line 6
    iput p1, p0, Lsz0;->n:I

    .line 7
    .line 8
    iput-object p5, p0, Lsz0;->o:[Ljava/lang/Object;

    .line 9
    .line 10
    iput p2, p0, Lsz0;->p:I

    .line 11
    .line 12
    iput p3, p0, Lsz0;->q:I

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final c([Ljava/lang/Object;)I
    .locals 2

    .line 1
    iget-object v0, p0, Lsz0;->m:[Ljava/lang/Object;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    iget p0, p0, Lsz0;->q:I

    .line 5
    .line 6
    invoke-static {v0, v1, p1, v1, p0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 7
    .line 8
    .line 9
    return p0
.end method

.method public final contains(Ljava/lang/Object;)Z
    .locals 3

    .line 1
    if-eqz p1, :cond_3

    .line 2
    .line 3
    iget-object v0, p0, Lsz0;->o:[Ljava/lang/Object;

    .line 4
    .line 5
    array-length v1, v0

    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    goto :goto_1

    .line 9
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    invoke-static {v1}, Lbe2;->t(I)I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    :goto_0
    iget v2, p0, Lsz0;->p:I

    .line 18
    .line 19
    and-int/2addr v1, v2

    .line 20
    aget-object v2, v0, v1

    .line 21
    .line 22
    if-nez v2, :cond_1

    .line 23
    .line 24
    goto :goto_1

    .line 25
    :cond_1
    invoke-virtual {v2, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-eqz v2, :cond_2

    .line 30
    .line 31
    const/4 p0, 0x1

    .line 32
    return p0

    .line 33
    :cond_2
    add-int/lit8 v1, v1, 0x1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_3
    :goto_1
    const/4 p0, 0x0

    .line 37
    return p0
.end method

.method public final d()[Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lsz0;->m:[Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public final e()I
    .locals 0

    .line 1
    iget p0, p0, Lsz0;->q:I

    .line 2
    .line 3
    return p0
.end method

.method public final f()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public final h()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public final hashCode()I
    .locals 0

    .line 1
    iget p0, p0, Lsz0;->n:I

    .line 2
    .line 3
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
    iget-object v0, p0, Lsz0;->m:[Ljava/lang/Object;

    .line 2
    .line 3
    iget p0, p0, Lsz0;->q:I

    .line 4
    .line 5
    invoke-static {p0, v0}, Lzd0;->k(I[Ljava/lang/Object;)Lmz0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final size()I
    .locals 0

    .line 1
    iget p0, p0, Lsz0;->q:I

    .line 2
    .line 3
    return p0
.end method
