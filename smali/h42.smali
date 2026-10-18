.class public final Lh42;
.super Landroid/content/BroadcastReceiver;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final synthetic a:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public final synthetic b:Landroid/content/Context;

.field public final synthetic c:Lm51;

.field public final synthetic d:Lny0;

.field public final synthetic e:Ljava/util/concurrent/Executor;


# direct methods
.method public constructor <init>(Ljava/util/concurrent/atomic/AtomicBoolean;Landroid/content/Context;Lm51;Lny0;Ljava/util/concurrent/Executor;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lh42;->a:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    iput-object p2, p0, Lh42;->b:Landroid/content/Context;

    .line 4
    .line 5
    iput-object p3, p0, Lh42;->c:Lm51;

    .line 6
    .line 7
    iput-object p4, p0, Lh42;->d:Lny0;

    .line 8
    .line 9
    iput-object p5, p0, Lh42;->e:Ljava/util/concurrent/Executor;

    .line 10
    .line 11
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lh42;->a:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    const/4 p2, 0x0

    .line 4
    const/4 v0, 0x1

    .line 5
    invoke-virtual {p1, p2, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Lh42;->b:Landroid/content/Context;

    .line 12
    .line 13
    :try_start_0
    invoke-virtual {p1, p0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 14
    .line 15
    .line 16
    :catch_0
    iget-object p1, p0, Lh42;->c:Lm51;

    .line 17
    .line 18
    iget-object p2, p0, Lh42;->d:Lny0;

    .line 19
    .line 20
    iget-object p0, p0, Lh42;->e:Ljava/util/concurrent/Executor;

    .line 21
    .line 22
    new-instance v0, Lbe1;

    .line 23
    .line 24
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 25
    .line 26
    .line 27
    new-instance v1, Lae1;

    .line 28
    .line 29
    invoke-direct {v1, v0, p2}, Lae1;-><init>(Lbe1;Lny0;)V

    .line 30
    .line 31
    .line 32
    iput-object v1, v0, Lbe1;->r:Lof0;

    .line 33
    .line 34
    invoke-interface {p0, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1, v0}, Lc0;->n(Lqj0;)Z

    .line 38
    .line 39
    .line 40
    :cond_0
    return-void
.end method
