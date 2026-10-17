.class public final Lo80;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public a:Z

.field public b:Ljava/lang/Object;

.field public c:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lz21;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lo80;->b:Ljava/lang/Object;

    .line 5
    .line 6
    new-instance p1, Lk6;

    .line 7
    .line 8
    invoke-direct {p1}, Lk6;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Lo80;->c:Ljava/lang/Object;

    .line 12
    .line 13
    return-void
.end method

.method public static b()Lo80;
    .locals 2

    .line 1
    new-instance v0, Lo80;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    iput-boolean v1, v0, Lo80;->a:Z

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public a()Lo80;
    .locals 3

    .line 1
    iget-object v0, p0, Lo80;->b:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lvz0;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 v0, 0x0

    .line 10
    :goto_0
    const-string v1, "execute parameter required"

    .line 11
    .line 12
    invoke-static {v1, v0}, Lbh;->b(Ljava/lang/String;Z)V

    .line 13
    .line 14
    .line 15
    new-instance v0, Lo80;

    .line 16
    .line 17
    iget-object v1, p0, Lo80;->c:Ljava/lang/Object;

    .line 18
    .line 19
    check-cast v1, [Lu20;

    .line 20
    .line 21
    iget-boolean v2, p0, Lo80;->a:Z

    .line 22
    .line 23
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object p0, v0, Lo80;->c:Ljava/lang/Object;

    .line 27
    .line 28
    iput-object v1, v0, Lo80;->b:Ljava/lang/Object;

    .line 29
    .line 30
    const/4 p0, 0x0

    .line 31
    if-eqz v1, :cond_1

    .line 32
    .line 33
    if-eqz v2, :cond_1

    .line 34
    .line 35
    const/4 p0, 0x1

    .line 36
    :cond_1
    iput-boolean p0, v0, Lo80;->a:Z

    .line 37
    .line 38
    return-object v0
.end method

.method public c()V
    .locals 4

    .line 1
    iget-object v0, p0, Lo80;->b:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lz21;

    .line 4
    .line 5
    invoke-interface {v0}, Lci0;->e()Landroidx/lifecycle/a;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-object v2, v1, Landroidx/lifecycle/a;->b:Lwh0;

    .line 10
    .line 11
    sget-object v3, Lwh0;->k:Lwh0;

    .line 12
    .line 13
    if-ne v2, v3, :cond_1

    .line 14
    .line 15
    new-instance v2, Landroidx/savedstate/Recreator;

    .line 16
    .line 17
    invoke-direct {v2, v0}, Landroidx/savedstate/Recreator;-><init>(Lz21;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1, v2}, Landroidx/lifecycle/a;->a(Lbi0;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lo80;->c:Ljava/lang/Object;

    .line 24
    .line 25
    check-cast v0, Lk6;

    .line 26
    .line 27
    iget-boolean v2, v0, Lk6;->c:Z

    .line 28
    .line 29
    if-nez v2, :cond_0

    .line 30
    .line 31
    new-instance v2, Lw21;

    .line 32
    .line 33
    invoke-direct {v2, v0}, Lw21;-><init>(Lk6;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1, v2}, Landroidx/lifecycle/a;->a(Lbi0;)V

    .line 37
    .line 38
    .line 39
    const/4 v1, 0x1

    .line 40
    iput-boolean v1, v0, Lk6;->c:Z

    .line 41
    .line 42
    iput-boolean v1, p0, Lo80;->a:Z

    .line 43
    .line 44
    return-void

    .line 45
    :cond_0
    const-string p0, "SavedStateRegistry was already attached."

    .line 46
    .line 47
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_1
    const-string p0, "Restarter must be created only during owner\'s initialization stage"

    .line 52
    .line 53
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public d(Landroid/os/Bundle;)V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lo80;->a:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lo80;->c()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Lo80;->b:Ljava/lang/Object;

    .line 9
    .line 10
    check-cast v0, Lz21;

    .line 11
    .line 12
    invoke-interface {v0}, Lci0;->e()Landroidx/lifecycle/a;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object v1, v0, Landroidx/lifecycle/a;->b:Lwh0;

    .line 17
    .line 18
    sget-object v2, Lwh0;->m:Lwh0;

    .line 19
    .line 20
    invoke-virtual {v1, v2}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-gez v1, :cond_4

    .line 25
    .line 26
    iget-object p0, p0, Lo80;->c:Ljava/lang/Object;

    .line 27
    .line 28
    check-cast p0, Lk6;

    .line 29
    .line 30
    iget-boolean v0, p0, Lk6;->c:Z

    .line 31
    .line 32
    if-eqz v0, :cond_3

    .line 33
    .line 34
    iget-boolean v0, p0, Lk6;->d:Z

    .line 35
    .line 36
    if-nez v0, :cond_2

    .line 37
    .line 38
    if-eqz p1, :cond_1

    .line 39
    .line 40
    const-string v0, "androidx.lifecycle.BundlableSavedStateRegistry.key"

    .line 41
    .line 42
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    goto :goto_0

    .line 47
    :cond_1
    const/4 p1, 0x0

    .line 48
    :goto_0
    iput-object p1, p0, Lk6;->a:Landroid/os/Parcelable;

    .line 49
    .line 50
    const/4 p1, 0x1

    .line 51
    iput-boolean p1, p0, Lk6;->d:Z

    .line 52
    .line 53
    return-void

    .line 54
    :cond_2
    const-string p0, "SavedStateRegistry was already restored."

    .line 55
    .line 56
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_3
    const-string p0, "You must call performAttach() before calling performRestore(Bundle)."

    .line 61
    .line 62
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_4
    const-string p0, "performRestore cannot be called when owner is "

    .line 67
    .line 68
    iget-object p1, v0, Landroidx/lifecycle/a;->b:Lwh0;

    .line 69
    .line 70
    invoke-static {p1, p0}, Lo40;->w(Ljava/lang/Object;Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public e(Landroid/os/Bundle;)V
    .locals 3

    .line 1
    iget-object p0, p0, Lo80;->c:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Lk6;

    .line 4
    .line 5
    new-instance v0, Landroid/os/Bundle;

    .line 6
    .line 7
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 8
    .line 9
    .line 10
    iget-object v1, p0, Lk6;->a:Landroid/os/Parcelable;

    .line 11
    .line 12
    check-cast v1, Landroid/os/Bundle;

    .line 13
    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/os/Bundle;->putAll(Landroid/os/Bundle;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object p0, p0, Lk6;->f:Ljava/lang/Object;

    .line 20
    .line 21
    check-cast p0, Lq21;

    .line 22
    .line 23
    new-instance v1, Lo21;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Lo21;-><init>(Lq21;)V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Lq21;->l:Ljava/util/WeakHashMap;

    .line 29
    .line 30
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 31
    .line 32
    invoke-virtual {p0, v1, v2}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    :goto_0
    invoke-virtual {v1}, Lo21;->hasNext()Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    if-eqz p0, :cond_1

    .line 40
    .line 41
    invoke-virtual {v1}, Lo21;->next()Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    check-cast p0, Ljava/util/Map$Entry;

    .line 46
    .line 47
    invoke-interface {p0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    check-cast v2, Ljava/lang/String;

    .line 52
    .line 53
    invoke-interface {p0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    check-cast p0, Ly21;

    .line 58
    .line 59
    invoke-interface {p0}, Ly21;->a()Landroid/os/Bundle;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-virtual {v0, v2, p0}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 64
    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_1
    invoke-virtual {v0}, Landroid/os/BaseBundle;->isEmpty()Z

    .line 68
    .line 69
    .line 70
    move-result p0

    .line 71
    if-nez p0, :cond_2

    .line 72
    .line 73
    const-string p0, "androidx.lifecycle.BundlableSavedStateRegistry.key"

    .line 74
    .line 75
    invoke-virtual {p1, p0, v0}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 76
    .line 77
    .line 78
    :cond_2
    return-void
.end method

.method public f(Llb2;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lo80;->b:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lo80;->c:Ljava/lang/Object;

    .line 5
    .line 6
    check-cast v1, Ljava/util/ArrayDeque;

    .line 7
    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    new-instance v1, Ljava/util/ArrayDeque;

    .line 11
    .line 12
    invoke-direct {v1}, Ljava/util/ArrayDeque;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object v1, p0, Lo80;->c:Ljava/lang/Object;

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    goto :goto_1

    .line 20
    :cond_0
    :goto_0
    invoke-interface {v1, p1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    monitor-exit v0

    .line 24
    return-void

    .line 25
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    throw p0
.end method

.method public g(Ljd2;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lo80;->b:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lo80;->c:Ljava/lang/Object;

    .line 5
    .line 6
    check-cast v1, Ljava/util/ArrayDeque;

    .line 7
    .line 8
    if-eqz v1, :cond_2

    .line 9
    .line 10
    iget-boolean v1, p0, Lo80;->a:Z

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    goto :goto_2

    .line 15
    :cond_0
    const/4 v1, 0x1

    .line 16
    iput-boolean v1, p0, Lo80;->a:Z

    .line 17
    .line 18
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 19
    :goto_0
    iget-object v1, p0, Lo80;->b:Ljava/lang/Object;

    .line 20
    .line 21
    monitor-enter v1

    .line 22
    :try_start_1
    iget-object v0, p0, Lo80;->c:Ljava/lang/Object;

    .line 23
    .line 24
    check-cast v0, Ljava/util/ArrayDeque;

    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/util/ArrayDeque;->poll()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Llb2;

    .line 31
    .line 32
    if-nez v0, :cond_1

    .line 33
    .line 34
    const/4 p1, 0x0

    .line 35
    iput-boolean p1, p0, Lo80;->a:Z

    .line 36
    .line 37
    monitor-exit v1

    .line 38
    return-void

    .line 39
    :catchall_0
    move-exception p0

    .line 40
    goto :goto_1

    .line 41
    :cond_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 42
    invoke-interface {v0, p1}, Llb2;->a(Ljd2;)V

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :goto_1
    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 47
    throw p0

    .line 48
    :catchall_1
    move-exception p0

    .line 49
    goto :goto_3

    .line 50
    :cond_2
    :goto_2
    :try_start_3
    monitor-exit v0

    .line 51
    return-void

    .line 52
    :goto_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 53
    throw p0
.end method
