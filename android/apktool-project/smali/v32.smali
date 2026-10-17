.class public final Lv32;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Ljava/util/concurrent/atomic/AtomicReference;

.field public final synthetic k:Ljava/lang/String;

.field public final synthetic l:Ljava/lang/String;

.field public final synthetic m:Z

.field public final synthetic n:Lc52;


# direct methods
.method public constructor <init>(Lc52;Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lv32;->j:Ljava/util/concurrent/atomic/AtomicReference;

    .line 5
    .line 6
    iput-object p3, p0, Lv32;->k:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p4, p0, Lv32;->l:Ljava/lang/String;

    .line 9
    .line 10
    iput-boolean p5, p0, Lv32;->m:Z

    .line 11
    .line 12
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    iput-object p1, p0, Lv32;->n:Lc52;

    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 8

    .line 1
    iget-object v0, p0, Lv32;->n:Lc52;

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
    move-result-object v2

    .line 11
    invoke-virtual {v2}, Lgx1;->l()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v2}, Lay1;->m()V

    .line 15
    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    invoke-virtual {v2, v0}, Li82;->B(Z)Lbc2;

    .line 19
    .line 20
    .line 21
    move-result-object v6

    .line 22
    new-instance v1, Lj72;

    .line 23
    .line 24
    iget-object v3, p0, Lv32;->j:Ljava/util/concurrent/atomic/AtomicReference;

    .line 25
    .line 26
    iget-object v4, p0, Lv32;->k:Ljava/lang/String;

    .line 27
    .line 28
    iget-object v5, p0, Lv32;->l:Ljava/lang/String;

    .line 29
    .line 30
    iget-boolean v7, p0, Lv32;->m:Z

    .line 31
    .line 32
    invoke-direct/range {v1 .. v7}, Lj72;-><init>(Li82;Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/String;Ljava/lang/String;Lbc2;Z)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v2, v1}, Li82;->z(Ljava/lang/Runnable;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method
