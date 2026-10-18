.class public final synthetic Lb52;
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
    iput-object p1, p0, Lb52;->j:Lc52;

    .line 5
    .line 6
    iput-object p2, p0, Lb52;->k:Ljava/util/concurrent/atomic/AtomicReference;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Lb52;->j:Lc52;

    .line 2
    .line 3
    iget-object v0, v0, Let;->j:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v0, Ly02;

    .line 6
    .line 7
    invoke-virtual {v0}, Ly02;->n()Li82;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sget-object v1, Ll52;->n:Ll52;

    .line 12
    .line 13
    filled-new-array {v1}, [Ll52;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {v1}, Lv92;->b([Ll52;)Lv92;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0}, Lgx1;->l()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Lay1;->m()V

    .line 25
    .line 26
    .line 27
    const/4 v2, 0x0

    .line 28
    invoke-virtual {v0, v2}, Li82;->B(Z)Lbc2;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    new-instance v3, Ld82;

    .line 33
    .line 34
    iget-object p0, p0, Lb52;->k:Ljava/util/concurrent/atomic/AtomicReference;

    .line 35
    .line 36
    invoke-direct {v3, v0, p0, v2, v1}, Ld82;-><init>(Li82;Ljava/util/concurrent/atomic/AtomicReference;Lbc2;Lv92;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, v3}, Li82;->z(Ljava/lang/Runnable;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method
