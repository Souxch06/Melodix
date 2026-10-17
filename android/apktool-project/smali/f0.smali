.class public final Lf0;
.super Lg0;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/util/RandomAccess;


# instance fields
.field public final j:Lg0;

.field public final k:I

.field public final l:I


# direct methods
.method public constructor <init>(Lg0;II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lf0;->j:Lg0;

    .line 5
    .line 6
    iput p2, p0, Lf0;->k:I

    .line 7
    .line 8
    invoke-virtual {p1}, Lg0;->b()I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    invoke-static {p2, p3, p1}, Lbe2;->e(III)V

    .line 13
    .line 14
    .line 15
    sub-int/2addr p3, p2

    .line 16
    iput p3, p0, Lf0;->l:I

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public final b()I
    .locals 0

    .line 1
    iget p0, p0, Lf0;->l:I

    .line 2
    .line 3
    return p0
.end method

.method public final get(I)Ljava/lang/Object;
    .locals 2

    .line 1
    iget v0, p0, Lf0;->l:I

    .line 2
    .line 3
    if-ltz p1, :cond_0

    .line 4
    .line 5
    if-ge p1, v0, :cond_0

    .line 6
    .line 7
    iget v0, p0, Lf0;->k:I

    .line 8
    .line 9
    add-int/2addr v0, p1

    .line 10
    iget-object p0, p0, Lf0;->j:Lg0;

    .line 11
    .line 12
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0

    .line 17
    :cond_0
    const-string p0, "index: "

    .line 18
    .line 19
    const-string v1, ", size: "

    .line 20
    .line 21
    invoke-static {p1, v0, p0, v1}, Loq;->e(IILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-static {p0}, Lz0;->i(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    const/4 p0, 0x0

    .line 29
    return-object p0
.end method

.method public final subList(II)Ljava/util/List;
    .locals 2

    .line 1
    iget v0, p0, Lf0;->l:I

    .line 2
    .line 3
    invoke-static {p1, p2, v0}, Lbe2;->e(III)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Lf0;

    .line 7
    .line 8
    iget v1, p0, Lf0;->k:I

    .line 9
    .line 10
    add-int/2addr p1, v1

    .line 11
    add-int/2addr v1, p2

    .line 12
    iget-object p0, p0, Lf0;->j:Lg0;

    .line 13
    .line 14
    invoke-direct {v0, p0, p1, v1}, Lf0;-><init>(Lg0;II)V

    .line 15
    .line 16
    .line 17
    return-object v0
.end method
