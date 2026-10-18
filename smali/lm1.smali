.class public final Llm1;
.super Lul1;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final b:Lo80;

.field public final c:Llb1;

.field public final d:Lok0;


# direct methods
.method public constructor <init>(ILo80;Llb1;Lok0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lul1;-><init>(I)V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Llm1;->c:Llb1;

    .line 5
    .line 6
    iput-object p2, p0, Llm1;->b:Lo80;

    .line 7
    .line 8
    iput-object p4, p0, Llm1;->d:Lok0;

    .line 9
    .line 10
    const/4 p0, 0x2

    .line 11
    if-ne p1, p0, :cond_1

    .line 12
    .line 13
    iget-boolean p0, p2, Lo80;->a:Z

    .line 14
    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const-string p0, "Best-effort write calls cannot pass methods that should auto-resolve missing features."

    .line 19
    .line 20
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    const/4 p0, 0x0

    .line 24
    throw p0

    .line 25
    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method public final a(Lml1;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Llm1;->b:Lo80;

    .line 2
    .line 3
    iget-boolean p0, p0, Lo80;->a:Z

    .line 4
    .line 5
    return p0
.end method

.method public final b(Lml1;)[Lu20;
    .locals 0

    .line 1
    iget-object p0, p0, Llm1;->b:Lo80;

    .line 2
    .line 3
    iget-object p0, p0, Lo80;->b:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast p0, [Lu20;

    .line 6
    .line 7
    return-object p0
.end method

.method public final c(Lcom/google/android/gms/common/api/Status;)V
    .locals 1

    .line 1
    iget-object v0, p0, Llm1;->d:Lok0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    iget-object v0, p1, Lcom/google/android/gms/common/api/Status;->l:Landroid/app/PendingIntent;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    new-instance v0, Lt01;

    .line 11
    .line 12
    invoke-direct {v0, p1}, Lx5;-><init>(Lcom/google/android/gms/common/api/Status;)V

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    new-instance v0, Lx5;

    .line 17
    .line 18
    invoke-direct {v0, p1}, Lx5;-><init>(Lcom/google/android/gms/common/api/Status;)V

    .line 19
    .line 20
    .line 21
    :goto_0
    iget-object p0, p0, Llm1;->c:Llb1;

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Llb1;->a(Ljava/lang/Exception;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final d(Ljava/lang/Exception;)V
    .locals 0

    .line 1
    iget-object p0, p0, Llm1;->c:Llb1;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Llb1;->a(Ljava/lang/Exception;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final e(Lml1;)V
    .locals 2

    .line 1
    iget-object v0, p0, Llm1;->c:Llb1;

    .line 2
    .line 3
    :try_start_0
    iget-object v1, p0, Llm1;->b:Lo80;

    .line 4
    .line 5
    iget-object p1, p1, Lml1;->c:Lu5;

    .line 6
    .line 7
    iget-object v1, v1, Lo80;->c:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v1, Lo80;

    .line 10
    .line 11
    iget-object v1, v1, Lo80;->b:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast v1, Lvz0;

    .line 14
    .line 15
    invoke-interface {v1, p1, v0}, Lvz0;->accept(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catch Landroid/os/DeadObjectException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :catch_0
    move-exception p0

    .line 20
    goto :goto_0

    .line 21
    :catch_1
    move-exception p1

    .line 22
    goto :goto_1

    .line 23
    :goto_0
    invoke-virtual {v0, p0}, Llb1;->a(Ljava/lang/Exception;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :goto_1
    invoke-static {p1}, Lul1;->g(Landroid/os/RemoteException;)Lcom/google/android/gms/common/api/Status;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p0, p1}, Llm1;->c(Lcom/google/android/gms/common/api/Status;)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :catch_2
    move-exception p0

    .line 36
    throw p0
.end method

.method public final f(Lxn0;Z)V
    .locals 3

    .line 1
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    iget-object v0, p1, Lxn0;->k:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v0, Ljava/util/Map;

    .line 8
    .line 9
    iget-object p0, p0, Llm1;->c:Llb1;

    .line 10
    .line 11
    invoke-interface {v0, p0, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    iget-object p2, p0, Llb1;->a:Ljd2;

    .line 15
    .line 16
    new-instance v0, Lxn0;

    .line 17
    .line 18
    const/16 v1, 0x12

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    invoke-direct {v0, p1, p0, v1, v2}, Lxn0;-><init>(Ljava/lang/Object;Ljava/lang/Object;IZ)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p2, v0}, Ljd2;->b(Lwr0;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method
