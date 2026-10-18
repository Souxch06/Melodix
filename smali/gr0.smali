.class public final Lgr0;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ldh0;


# instance fields
.field public final a:Ldh0;

.field public final b:Lj41;


# direct methods
.method public constructor <init>(Ldh0;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Lgr0;->a:Ldh0;

    .line 8
    .line 9
    new-instance v0, Lj41;

    .line 10
    .line 11
    invoke-interface {p1}, Ldh0;->d()Li41;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-direct {v0, p1}, Lj41;-><init>(Li41;)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lgr0;->b:Lj41;

    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public final b(Ll80;)Ljava/lang/Object;
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll80;->g()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lgr0;->a:Ldh0;

    .line 8
    .line 9
    invoke-virtual {p1, p0}, Ll80;->j(Ldh0;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return-object p0
.end method

.method public final c(Lqt;Ljava/lang/Object;)V
    .locals 0

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lgr0;->a:Ldh0;

    .line 4
    .line 5
    invoke-virtual {p1, p0, p2}, Lqt;->i(Ldh0;Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    invoke-virtual {p1}, Lqt;->f()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final d()Li41;
    .locals 0

    .line 1
    iget-object p0, p0, Lgr0;->b:Lj41;

    .line 2
    .line 3
    return-object p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    const/4 v1, 0x0

    .line 6
    if-eqz p1, :cond_3

    .line 7
    .line 8
    const-class v2, Lgr0;

    .line 9
    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    move-result-object v3

    .line 14
    if-eq v2, v3, :cond_1

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    check-cast p1, Lgr0;

    .line 18
    .line 19
    iget-object p0, p0, Lgr0;->a:Ldh0;

    .line 20
    .line 21
    iget-object p1, p1, Lgr0;->a:Ldh0;

    .line 22
    .line 23
    invoke-static {p0, p1}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-nez p0, :cond_2

    .line 28
    .line 29
    return v1

    .line 30
    :cond_2
    return v0

    .line 31
    :cond_3
    :goto_0
    return v1
.end method

.method public final hashCode()I
    .locals 0

    .line 1
    iget-object p0, p0, Lgr0;->a:Ldh0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
