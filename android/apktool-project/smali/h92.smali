.class public final Lh92;
.super Lay1;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public l:Lum1;

.field public m:Z

.field public final n:Lny0;

.field public final o:Lf92;

.field public final p:Lxn0;


# direct methods
.method public constructor <init>(Ly02;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lay1;-><init>(Ly02;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    iput-boolean p1, p0, Lh92;->m:Z

    .line 6
    .line 7
    new-instance p1, Lny0;

    .line 8
    .line 9
    const/16 v0, 0x1a

    .line 10
    .line 11
    invoke-direct {p1, v0, p0}, Lny0;-><init>(ILjava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, Lh92;->n:Lny0;

    .line 15
    .line 16
    new-instance p1, Lf92;

    .line 17
    .line 18
    invoke-direct {p1, p0}, Lf92;-><init>(Lh92;)V

    .line 19
    .line 20
    .line 21
    iput-object p1, p0, Lh92;->o:Lf92;

    .line 22
    .line 23
    new-instance p1, Lxn0;

    .line 24
    .line 25
    const/16 v0, 0x1d

    .line 26
    .line 27
    invoke-direct {p1, v0, p0}, Lxn0;-><init>(ILjava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    iput-object p1, p0, Lh92;->p:Lxn0;

    .line 31
    .line 32
    return-void
.end method


# virtual methods
.method public final o()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public final p()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lgx1;->l()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lh92;->l:Lum1;

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    new-instance v0, Lum1;

    .line 9
    .line 10
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    const/4 v2, 0x2

    .line 15
    invoke-direct {v0, v1, v2}, Lum1;-><init>(Landroid/os/Looper;I)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lh92;->l:Lum1;

    .line 19
    .line 20
    :cond_0
    return-void
.end method
