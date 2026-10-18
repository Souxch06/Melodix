.class public abstract Luq;
.super Lo;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lqq;


# static fields
.field public static final k:Ltq;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Ltq;

    .line 2
    .line 3
    sget-object v1, Lok0;->l:Lok0;

    .line 4
    .line 5
    new-instance v2, Lq4;

    .line 6
    .line 7
    const/4 v3, 0x2

    .line 8
    invoke-direct {v2, v3}, Lq4;-><init>(I)V

    .line 9
    .line 10
    .line 11
    invoke-direct {v0, v1, v2}, Ltq;-><init>(Lrq;Lr80;)V

    .line 12
    .line 13
    .line 14
    sput-object v0, Luq;->k:Ltq;

    .line 15
    .line 16
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    sget-object v0, Lok0;->l:Lok0;

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lo;-><init>(Lrq;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final j(Lrq;)Lqq;
    .locals 3

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    instance-of v0, p1, Ltq;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    check-cast p1, Ltq;

    .line 10
    .line 11
    iget-object v0, p0, Lo;->j:Lrq;

    .line 12
    .line 13
    if-eq v0, p1, :cond_1

    .line 14
    .line 15
    iget-object v2, p1, Ltq;->k:Lrq;

    .line 16
    .line 17
    if-ne v2, v0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    return-object v1

    .line 21
    :cond_1
    :goto_0
    iget-object p1, p1, Ltq;->j:Lr80;

    .line 22
    .line 23
    invoke-interface {p1, p0}, Lr80;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    check-cast p0, Lqq;

    .line 28
    .line 29
    if-eqz p0, :cond_3

    .line 30
    .line 31
    return-object p0

    .line 32
    :cond_2
    sget-object v0, Lok0;->l:Lok0;

    .line 33
    .line 34
    if-ne v0, p1, :cond_3

    .line 35
    .line 36
    return-object p0

    .line 37
    :cond_3
    return-object v1
.end method

.method public final l(Lrq;)Lsq;
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    instance-of v0, p1, Ltq;

    .line 5
    .line 6
    if-eqz v0, :cond_2

    .line 7
    .line 8
    check-cast p1, Ltq;

    .line 9
    .line 10
    iget-object v0, p0, Lo;->j:Lrq;

    .line 11
    .line 12
    if-eq v0, p1, :cond_1

    .line 13
    .line 14
    iget-object v1, p1, Ltq;->k:Lrq;

    .line 15
    .line 16
    if-ne v1, v0, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    return-object p0

    .line 20
    :cond_1
    :goto_0
    iget-object p1, p1, Ltq;->j:Lr80;

    .line 21
    .line 22
    invoke-interface {p1, p0}, Lr80;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    check-cast p1, Lqq;

    .line 27
    .line 28
    if-eqz p1, :cond_3

    .line 29
    .line 30
    goto :goto_1

    .line 31
    :cond_2
    sget-object v0, Lok0;->l:Lok0;

    .line 32
    .line 33
    if-ne v0, p1, :cond_3

    .line 34
    .line 35
    :goto_1
    sget-object p0, Ls00;->j:Ls00;

    .line 36
    .line 37
    :cond_3
    return-object p0
.end method

.method public abstract r(Lsq;Ljava/lang/Runnable;)V
.end method

.method public s(Lsq;)Z
    .locals 0

    .line 1
    instance-of p0, p0, Lse1;

    .line 2
    .line 3
    xor-int/lit8 p0, p0, 0x1

    .line 4
    .line 5
    return p0
.end method

.method public t(I)Luq;
    .locals 1

    .line 1
    invoke-static {p1}, Lk42;->a(I)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lhi0;

    .line 5
    .line 6
    invoke-direct {v0, p0, p1}, Lhi0;-><init>(Luq;I)V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const/16 v1, 0x40

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-static {p0}, Lbv;->j(Ljava/lang/Object;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0
.end method
