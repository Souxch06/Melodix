.class public final Lhw1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ld52;


# instance fields
.field public final synthetic a:Ldx1;


# direct methods
.method public constructor <init>(Ldx1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lhw1;->a:Ldx1;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final b(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 6

    .line 1
    new-instance v0, Low1;

    .line 2
    .line 3
    const/4 v5, 0x1

    .line 4
    iget-object v1, p0, Lhw1;->a:Ldx1;

    .line 5
    .line 6
    move-object v2, p1

    .line 7
    move-object v3, p2

    .line 8
    move-object v4, p3

    .line 9
    invoke-direct/range {v0 .. v5}, Low1;-><init>(Ldx1;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;I)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v1, v0}, Ldx1;->c(Lzw1;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final c()J
    .locals 2

    .line 1
    iget-object p0, p0, Lhw1;->a:Ldx1;

    .line 2
    .line 3
    invoke-virtual {p0}, Ldx1;->g()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public final d(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 6

    .line 1
    new-instance v0, Low1;

    .line 2
    .line 3
    const/4 v5, 0x0

    .line 4
    iget-object v1, p0, Lhw1;->a:Ldx1;

    .line 5
    .line 6
    move-object v2, p1

    .line 7
    move-object v3, p2

    .line 8
    move-object v4, p3

    .line 9
    invoke-direct/range {v0 .. v5}, Low1;-><init>(Ldx1;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;I)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v1, v0}, Ldx1;->c(Lzw1;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final e()Ljava/lang/String;
    .locals 4

    .line 1
    new-instance v0, Lqv1;

    .line 2
    .line 3
    invoke-direct {v0}, Lqv1;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ltw1;

    .line 7
    .line 8
    const/4 v2, 0x3

    .line 9
    const/4 v3, 0x0

    .line 10
    iget-object p0, p0, Lhw1;->a:Ldx1;

    .line 11
    .line 12
    invoke-direct {v1, p0, v0, v2, v3}, Ltw1;-><init>(Ldx1;Lqv1;IZ)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, v1}, Ldx1;->c(Lzw1;)V

    .line 16
    .line 17
    .line 18
    const-wide/16 v1, 0x1f4

    .line 19
    .line 20
    invoke-virtual {v0, v1, v2}, Lqv1;->b(J)Landroid/os/Bundle;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    const-class v0, Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {p0, v0}, Lqv1;->F(Landroid/os/Bundle;Ljava/lang/Class;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    check-cast p0, Ljava/lang/String;

    .line 31
    .line 32
    return-object p0
.end method

.method public final f()Ljava/lang/String;
    .locals 4

    .line 1
    new-instance v0, Lqv1;

    .line 2
    .line 3
    invoke-direct {v0}, Lqv1;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ltw1;

    .line 7
    .line 8
    const/4 v2, 0x4

    .line 9
    const/4 v3, 0x0

    .line 10
    iget-object p0, p0, Lhw1;->a:Ldx1;

    .line 11
    .line 12
    invoke-direct {v1, p0, v0, v2, v3}, Ltw1;-><init>(Ldx1;Lqv1;IZ)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, v1}, Ldx1;->c(Lzw1;)V

    .line 16
    .line 17
    .line 18
    const-wide/16 v1, 0x1f4

    .line 19
    .line 20
    invoke-virtual {v0, v1, v2}, Lqv1;->b(J)Landroid/os/Bundle;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    const-class v0, Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {p0, v0}, Lqv1;->F(Landroid/os/Bundle;Ljava/lang/Class;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    check-cast p0, Ljava/lang/String;

    .line 31
    .line 32
    return-object p0
.end method

.method public final g(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lhw1;->a:Ldx1;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ldx1;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final h(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    new-instance v0, Lnw1;

    .line 2
    .line 3
    iget-object p0, p0, Lhw1;->a:Ldx1;

    .line 4
    .line 5
    invoke-direct {v0, p0, p1}, Lnw1;-><init>(Ldx1;Landroid/os/Bundle;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ldx1;->c(Lzw1;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final i(Ljava/lang/String;)I
    .locals 0

    .line 1
    iget-object p0, p0, Lhw1;->a:Ldx1;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ldx1;->b(Ljava/lang/String;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final j()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Lqv1;

    .line 2
    .line 3
    invoke-direct {v0}, Lqv1;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ltw1;

    .line 7
    .line 8
    const/4 v2, 0x1

    .line 9
    iget-object p0, p0, Lhw1;->a:Ldx1;

    .line 10
    .line 11
    invoke-direct {v1, p0, v0, v2}, Ltw1;-><init>(Ldx1;Lqv1;I)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v1}, Ldx1;->c(Lzw1;)V

    .line 15
    .line 16
    .line 17
    const-wide/16 v1, 0x32

    .line 18
    .line 19
    invoke-virtual {v0, v1, v2}, Lqv1;->b(J)Landroid/os/Bundle;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const-class v0, Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {p0, v0}, Lqv1;->F(Landroid/os/Bundle;Ljava/lang/Class;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    check-cast p0, Ljava/lang/String;

    .line 30
    .line 31
    return-object p0
.end method

.method public final k(Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Lrw1;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    iget-object p0, p0, Lhw1;->a:Ldx1;

    .line 5
    .line 6
    invoke-direct {v0, p0, p1, v1}, Lrw1;-><init>(Ldx1;Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ldx1;->c(Lzw1;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final l()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Lqv1;

    .line 2
    .line 3
    invoke-direct {v0}, Lqv1;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ltw1;

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    iget-object p0, p0, Lhw1;->a:Ldx1;

    .line 10
    .line 11
    invoke-direct {v1, p0, v0, v2}, Ltw1;-><init>(Ldx1;Lqv1;I)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v1}, Ldx1;->c(Lzw1;)V

    .line 15
    .line 16
    .line 17
    const-wide/16 v1, 0x1f4

    .line 18
    .line 19
    invoke-virtual {v0, v1, v2}, Lqv1;->b(J)Landroid/os/Bundle;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const-class v0, Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {p0, v0}, Lqv1;->F(Landroid/os/Bundle;Ljava/lang/Class;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    check-cast p0, Ljava/lang/String;

    .line 30
    .line 31
    return-object p0
.end method

.method public final m(Ljava/lang/String;Ljava/lang/String;Z)Ljava/util/Map;
    .locals 0

    .line 1
    iget-object p0, p0, Lhw1;->a:Ldx1;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ldx1;->a(Ljava/lang/String;Ljava/lang/String;Z)Ljava/util/Map;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final n(Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Lrw1;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    iget-object p0, p0, Lhw1;->a:Ldx1;

    .line 5
    .line 6
    invoke-direct {v0, p0, p1, v1}, Lrw1;-><init>(Ldx1;Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ldx1;->c(Lzw1;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
