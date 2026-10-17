.class public final Lpz0;
.super Lbe0;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final transient m:Lrz0;

.field public final transient n:Lqz0;


# direct methods
.method public constructor <init>(Lrz0;Lqz0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/util/AbstractCollection;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lpz0;->m:Lrz0;

    .line 5
    .line 6
    iput-object p2, p0, Lpz0;->n:Lqz0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final b()Lzd0;
    .locals 0

    .line 1
    iget-object p0, p0, Lpz0;->n:Lqz0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final c([Ljava/lang/Object;)I
    .locals 0

    .line 1
    iget-object p0, p0, Lpz0;->n:Lqz0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lzd0;->c([Ljava/lang/Object;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final contains(Ljava/lang/Object;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lpz0;->m:Lrz0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrz0;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
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
    iget-object p0, p0, Lpz0;->n:Lqz0;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Lzd0;->p(I)Lwd0;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method public final size()I
    .locals 0

    .line 1
    iget-object p0, p0, Lpz0;->m:Lrz0;

    .line 2
    .line 3
    iget p0, p0, Lrz0;->o:I

    .line 4
    .line 5
    return p0
.end method
