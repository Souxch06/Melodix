.class public final Lwx;
.super Lc70;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public k:Z

.field public final synthetic l:Lay;

.field public final synthetic m:Lxx;


# direct methods
.method public constructor <init>(Lna;Lay;Lxx;)V
    .locals 0

    .line 1
    iput-object p2, p0, Lwx;->l:Lay;

    .line 2
    .line 3
    iput-object p3, p0, Lwx;->m:Lxx;

    .line 4
    .line 5
    invoke-direct {p0, p1}, Lc70;-><init>(Lp81;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final close()V
    .locals 2

    .line 1
    invoke-super {p0}, Lc70;->close()V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lwx;->k:Z

    .line 5
    .line 6
    if-nez v0, :cond_1

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    iput-boolean v0, p0, Lwx;->k:Z

    .line 10
    .line 11
    iget-object v0, p0, Lwx;->l:Lay;

    .line 12
    .line 13
    iget-object p0, p0, Lwx;->m:Lxx;

    .line 14
    .line 15
    monitor-enter v0

    .line 16
    :try_start_0
    iget v1, p0, Lxx;->h:I

    .line 17
    .line 18
    add-int/lit8 v1, v1, -0x1

    .line 19
    .line 20
    iput v1, p0, Lxx;->h:I

    .line 21
    .line 22
    if-nez v1, :cond_0

    .line 23
    .line 24
    iget-boolean v1, p0, Lxx;->f:Z

    .line 25
    .line 26
    if-eqz v1, :cond_0

    .line 27
    .line 28
    invoke-virtual {v0, p0}, Lay;->x(Lxx;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :catchall_0
    move-exception p0

    .line 33
    goto :goto_1

    .line 34
    :cond_0
    :goto_0
    monitor-exit v0

    .line 35
    return-void

    .line 36
    :goto_1
    monitor-exit v0

    .line 37
    throw p0

    .line 38
    :cond_1
    return-void
.end method
