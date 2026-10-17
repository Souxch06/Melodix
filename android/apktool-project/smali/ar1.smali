.class public final Lar1;
.super Lqr1;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final transient l:I

.field public final transient m:I

.field public final synthetic n:Lqr1;


# direct methods
.method public constructor <init>(Lqr1;II)V
    .locals 0

    .line 1
    iput-object p1, p0, Lar1;->n:Lqr1;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/AbstractCollection;-><init>()V

    .line 4
    .line 5
    .line 6
    iput p2, p0, Lar1;->l:I

    .line 7
    .line 8
    iput p3, p0, Lar1;->m:I

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final b()[Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lar1;->n:Lqr1;

    .line 2
    .line 3
    invoke-virtual {p0}, Lno1;->b()[Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final c()I
    .locals 1

    .line 1
    iget-object v0, p0, Lar1;->n:Lqr1;

    .line 2
    .line 3
    invoke-virtual {v0}, Lno1;->c()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget p0, p0, Lar1;->l:I

    .line 8
    .line 9
    add-int/2addr v0, p0

    .line 10
    return v0
.end method

.method public final d()I
    .locals 2

    .line 1
    iget-object v0, p0, Lar1;->n:Lqr1;

    .line 2
    .line 3
    invoke-virtual {v0}, Lno1;->c()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget v1, p0, Lar1;->l:I

    .line 8
    .line 9
    add-int/2addr v0, v1

    .line 10
    iget p0, p0, Lar1;->m:I

    .line 11
    .line 12
    add-int/2addr v0, p0

    .line 13
    return v0
.end method

.method public final get(I)Ljava/lang/Object;
    .locals 1

    .line 1
    iget v0, p0, Lar1;->m:I

    .line 2
    .line 3
    invoke-static {p1, v0}, Lqe0;->o(II)V

    .line 4
    .line 5
    .line 6
    iget v0, p0, Lar1;->l:I

    .line 7
    .line 8
    add-int/2addr p1, v0

    .line 9
    iget-object p0, p0, Lar1;->n:Lqr1;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final h(II)Lqr1;
    .locals 1

    .line 1
    iget v0, p0, Lar1;->m:I

    .line 2
    .line 3
    invoke-static {p1, p2, v0}, Lqe0;->p(III)V

    .line 4
    .line 5
    .line 6
    iget v0, p0, Lar1;->l:I

    .line 7
    .line 8
    add-int/2addr p1, v0

    .line 9
    add-int/2addr p2, v0

    .line 10
    iget-object p0, p0, Lar1;->n:Lqr1;

    .line 11
    .line 12
    invoke-virtual {p0, p1, p2}, Lqr1;->h(II)Lqr1;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public final size()I
    .locals 0

    .line 1
    iget p0, p0, Lar1;->m:I

    .line 2
    .line 3
    return p0
.end method

.method public final bridge synthetic subList(II)Ljava/util/List;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lar1;->h(II)Lqr1;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
