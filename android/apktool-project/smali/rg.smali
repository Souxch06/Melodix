.class public final Lrg;
.super Ln;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final m:Ljava/lang/Thread;

.field public final n:Lh10;


# direct methods
.method public constructor <init>(Lsq;Ljava/lang/Thread;Lh10;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-direct {p0, p1, v0}, Ln;-><init>(Lsq;Z)V

    .line 3
    .line 4
    .line 5
    iput-object p2, p0, Lrg;->m:Ljava/lang/Thread;

    .line 6
    .line 7
    iput-object p3, p0, Lrg;->n:Lh10;

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final m(Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p0, p0, Lrg;->m:Ljava/lang/Thread;

    .line 6
    .line 7
    invoke-static {p1, p0}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    invoke-static {p0}, Ljava/util/concurrent/locks/LockSupport;->unpark(Ljava/lang/Thread;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method
