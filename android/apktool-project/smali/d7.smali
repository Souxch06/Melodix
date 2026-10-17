.class public abstract Ld7;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public a:Ljava/lang/Object;

.field public b:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    iput-object p1, p0, Ld7;->a:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lg7;)V
    .locals 0

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ld7;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lw81;Lxi;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ld7;->a:Ljava/lang/Object;

    .line 5
    .line 6
    iput-object p2, p0, Ld7;->b:Ljava/lang/Object;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public c()V
    .locals 2

    .line 1
    iget-object v0, p0, Ld7;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lc7;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    :try_start_0
    iget-object v1, p0, Ld7;->b:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v1, Lg7;

    .line 10
    .line 11
    iget-object v1, v1, Lg7;->t:Landroid/content/Context;

    .line 12
    .line 13
    invoke-virtual {v1, v0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 14
    .line 15
    .line 16
    :catch_0
    const/4 v0, 0x0

    .line 17
    iput-object v0, p0, Ld7;->a:Ljava/lang/Object;

    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public d()V
    .locals 2

    .line 1
    iget-object v0, p0, Ld7;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lw81;

    .line 4
    .line 5
    iget-object p0, p0, Ld7;->b:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p0, Lxi;

    .line 8
    .line 9
    iget-object v1, v0, Lw81;->e:Ljava/util/HashSet;

    .line 10
    .line 11
    invoke-virtual {v1, p0}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    invoke-virtual {v1}, Ljava/util/HashSet;->isEmpty()Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    invoke-virtual {v0}, Lw81;->b()V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public abstract e()Landroid/content/IntentFilter;
.end method

.method public abstract f()I
.end method

.method public g(Landroid/view/MenuItem;)Landroid/view/MenuItem;
    .locals 2

    .line 1
    instance-of v0, p1, Lbb1;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    check-cast p1, Lbb1;

    .line 6
    .line 7
    iget-object v0, p0, Ld7;->b:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v0, Lu71;

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    new-instance v0, Lu71;

    .line 14
    .line 15
    invoke-direct {v0}, Lu71;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Ld7;->b:Ljava/lang/Object;

    .line 19
    .line 20
    :cond_0
    const/4 v1, 0x0

    .line 21
    invoke-virtual {v0, p1, v1}, Lu71;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Landroid/view/MenuItem;

    .line 26
    .line 27
    if-nez v0, :cond_1

    .line 28
    .line 29
    new-instance v0, Lzm0;

    .line 30
    .line 31
    iget-object v1, p0, Ld7;->a:Ljava/lang/Object;

    .line 32
    .line 33
    check-cast v1, Landroid/content/Context;

    .line 34
    .line 35
    invoke-direct {v0, v1, p1}, Lzm0;-><init>(Landroid/content/Context;Lbb1;)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Ld7;->b:Ljava/lang/Object;

    .line 39
    .line 40
    check-cast p0, Lu71;

    .line 41
    .line 42
    invoke-virtual {p0, p1, v0}, Lu71;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    :cond_1
    return-object v0

    .line 46
    :cond_2
    return-object p1
.end method

.method public abstract h()V
.end method

.method public i()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ld7;->c()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ld7;->e()Landroid/content/IntentFilter;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Landroid/content/IntentFilter;->countActions()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-nez v1, :cond_0

    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object v1, p0, Ld7;->a:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast v1, Lc7;

    .line 18
    .line 19
    if-nez v1, :cond_1

    .line 20
    .line 21
    new-instance v1, Lc7;

    .line 22
    .line 23
    const/4 v2, 0x0

    .line 24
    invoke-direct {v1, v2, p0}, Lc7;-><init>(ILjava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    iput-object v1, p0, Ld7;->a:Ljava/lang/Object;

    .line 28
    .line 29
    :cond_1
    iget-object p0, p0, Ld7;->b:Ljava/lang/Object;

    .line 30
    .line 31
    check-cast p0, Lg7;

    .line 32
    .line 33
    iget-object p0, p0, Lg7;->t:Landroid/content/Context;

    .line 34
    .line 35
    invoke-virtual {p0, v1, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 36
    .line 37
    .line 38
    return-void
.end method
