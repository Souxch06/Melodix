.class public final synthetic Lq42;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Lc52;

.field public final synthetic k:Ljava/util/concurrent/atomic/AtomicReference;


# direct methods
.method public synthetic constructor <init>(Lc52;Ljava/util/concurrent/atomic/AtomicReference;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lq42;->j:Lc52;

    .line 5
    .line 6
    iput-object p2, p0, Lq42;->k:Ljava/util/concurrent/atomic/AtomicReference;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Lq42;->j:Lc52;

    .line 2
    .line 3
    iget-object v1, v0, Let;->j:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v1, Ly02;

    .line 6
    .line 7
    iget-object v1, v1, Ly02;->n:Lvz1;

    .line 8
    .line 9
    invoke-static {v1}, Ly02;->j(Let;)V

    .line 10
    .line 11
    .line 12
    iget-object v1, v1, Lvz1;->w:Ler0;

    .line 13
    .line 14
    invoke-virtual {v1}, Ler0;->t()Landroid/os/Bundle;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iget-object v0, v0, Let;->j:Ljava/lang/Object;

    .line 19
    .line 20
    check-cast v0, Ly02;

    .line 21
    .line 22
    invoke-virtual {v0}, Ly02;->n()Li82;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0}, Lgx1;->l()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Lay1;->m()V

    .line 30
    .line 31
    .line 32
    const/4 v2, 0x0

    .line 33
    invoke-virtual {v0, v2}, Li82;->B(Z)Lbc2;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    new-instance v3, Lb82;

    .line 38
    .line 39
    iget-object p0, p0, Lq42;->k:Ljava/util/concurrent/atomic/AtomicReference;

    .line 40
    .line 41
    invoke-direct {v3, v0, p0, v2, v1}, Lb82;-><init>(Li82;Ljava/util/concurrent/atomic/AtomicReference;Lbc2;Landroid/os/Bundle;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, v3}, Li82;->z(Ljava/lang/Runnable;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method
