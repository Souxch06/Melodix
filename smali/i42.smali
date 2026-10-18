.class public final synthetic Li42;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Lm51;

.field public final synthetic k:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public final synthetic l:Landroid/content/Context;

.field public final synthetic m:Lh42;


# direct methods
.method public synthetic constructor <init>(Lm51;Ljava/util/concurrent/atomic/AtomicBoolean;Landroid/content/Context;Lh42;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Li42;->j:Lm51;

    .line 5
    .line 6
    iput-object p2, p0, Li42;->k:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 7
    .line 8
    iput-object p3, p0, Li42;->l:Landroid/content/Context;

    .line 9
    .line 10
    iput-object p4, p0, Li42;->m:Lh42;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Li42;->j:Lm51;

    .line 2
    .line 3
    iget-object v1, p0, Li42;->k:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 4
    .line 5
    iget-object v2, p0, Li42;->l:Landroid/content/Context;

    .line 6
    .line 7
    iget-object p0, p0, Li42;->m:Lh42;

    .line 8
    .line 9
    iget-object v0, v0, Lc0;->j:Ljava/lang/Object;

    .line 10
    .line 11
    instance-of v0, v0, Lq;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    const/4 v3, 0x1

    .line 17
    invoke-virtual {v1, v0, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    :try_start_0
    invoke-virtual {v2, p0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 24
    .line 25
    .line 26
    :catch_0
    :cond_0
    return-void
.end method
