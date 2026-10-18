.class public final synthetic Luw;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Lvw;

.field public final synthetic b:Ljava/util/concurrent/Callable;

.field public final synthetic c:Lbv1;


# direct methods
.method public synthetic constructor <init>(Lvw;Ljava/util/concurrent/Callable;Lbv1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Luw;->a:Lvw;

    .line 5
    .line 6
    iput-object p2, p0, Luw;->b:Ljava/util/concurrent/Callable;

    .line 7
    .line 8
    iput-object p3, p0, Luw;->c:Lbv1;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 4

    .line 1
    iget-object v0, p0, Luw;->a:Lvw;

    .line 2
    .line 3
    iget-object v0, v0, Lvw;->j:Ljava/util/concurrent/ExecutorService;

    .line 4
    .line 5
    new-instance v1, Lo6;

    .line 6
    .line 7
    const/4 v2, 0x7

    .line 8
    iget-object v3, p0, Luw;->b:Ljava/util/concurrent/Callable;

    .line 9
    .line 10
    iget-object p0, p0, Luw;->c:Lbv1;

    .line 11
    .line 12
    invoke-direct {v1, v3, v2, p0}, Lo6;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method
