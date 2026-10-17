.class public final synthetic Lt52;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Ljava/util/logging/Level;

.field public final synthetic k:Ljava/lang/Throwable;

.field public final synthetic l:Ljava/lang/String;

.field public final synthetic m:[Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/util/logging/Level;Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lt52;->j:Ljava/util/logging/Level;

    .line 5
    .line 6
    iput-object p2, p0, Lt52;->k:Ljava/lang/Throwable;

    .line 7
    .line 8
    iput-object p3, p0, Lt52;->l:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p4, p0, Lt52;->m:[Ljava/lang/Object;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 5

    .line 1
    sget-object v0, Lr52;->a:Lbv1;

    .line 2
    .line 3
    iget-object v1, v0, Lbv1;->k:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v1, Let;

    .line 6
    .line 7
    iget-object v2, p0, Lt52;->j:Ljava/util/logging/Level;

    .line 8
    .line 9
    invoke-virtual {v1, v2}, Let;->i(Ljava/util/logging/Level;)Z

    .line 10
    .line 11
    .line 12
    move-result v3

    .line 13
    iget-object v1, v1, Let;->j:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast v1, Ljava/lang/String;

    .line 16
    .line 17
    sget-object v4, Lgn1;->a:Lhn1;

    .line 18
    .line 19
    check-cast v4, Lln1;

    .line 20
    .line 21
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 22
    .line 23
    .line 24
    sget-object v4, Lqn1;->b:Lqn1;

    .line 25
    .line 26
    invoke-virtual {v4, v1, v2, v3}, Lqn1;->a(Ljava/lang/String;Ljava/util/logging/Level;Z)V

    .line 27
    .line 28
    .line 29
    if-nez v3, :cond_0

    .line 30
    .line 31
    sget-object v0, Lbv1;->o:Lfe2;

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    new-instance v1, Lee2;

    .line 35
    .line 36
    invoke-direct {v1, v0, v2}, Lee2;-><init>(Lbv1;Ljava/util/logging/Level;)V

    .line 37
    .line 38
    .line 39
    move-object v0, v1

    .line 40
    :goto_0
    iget-object v1, p0, Lt52;->k:Ljava/lang/Throwable;

    .line 41
    .line 42
    invoke-interface {v0, v1}, Lqe2;->a(Ljava/lang/Throwable;)Lqe2;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    check-cast v0, Lde2;

    .line 47
    .line 48
    invoke-interface {v0}, Lqe2;->b()Lqe2;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    check-cast v0, Lde2;

    .line 53
    .line 54
    iget-object v1, p0, Lt52;->l:Ljava/lang/String;

    .line 55
    .line 56
    iget-object p0, p0, Lt52;->m:[Ljava/lang/Object;

    .line 57
    .line 58
    invoke-interface {v0, v1, p0}, Lqe2;->c(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method
