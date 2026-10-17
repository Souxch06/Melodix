.class public final Lj70;
.super Lju1;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lii1;
.implements Lci0;
.implements Lz21;
.implements Lc80;


# instance fields
.field public final A:Lz70;

.field public final synthetic B:Le6;

.field public final x:Le6;

.field public final y:Le6;

.field public final z:Landroid/os/Handler;


# direct methods
.method public constructor <init>(Le6;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lj70;->B:Le6;

    .line 5
    .line 6
    new-instance v0, Landroid/os/Handler;

    .line 7
    .line 8
    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    .line 9
    .line 10
    .line 11
    new-instance v1, Lz70;

    .line 12
    .line 13
    invoke-direct {v1}, Lz70;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v1, p0, Lj70;->A:Lz70;

    .line 17
    .line 18
    iput-object p1, p0, Lj70;->x:Le6;

    .line 19
    .line 20
    iput-object p1, p0, Lj70;->y:Le6;

    .line 21
    .line 22
    iput-object v0, p0, Lj70;->z:Landroid/os/Handler;

    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public final a()Lk6;
    .locals 0

    .line 1
    iget-object p0, p0, Lj70;->B:Le6;

    .line 2
    .line 3
    iget-object p0, p0, Landroidx/activity/a;->n:Lo80;

    .line 4
    .line 5
    iget-object p0, p0, Lo80;->c:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p0, Lk6;

    .line 8
    .line 9
    return-object p0
.end method

.method public final b()V
    .locals 0

    .line 1
    return-void
.end method

.method public final d()Lhi1;
    .locals 0

    .line 1
    iget-object p0, p0, Lj70;->B:Le6;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/activity/a;->d()Lhi1;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final e()Landroidx/lifecycle/a;
    .locals 0

    .line 1
    iget-object p0, p0, Lj70;->B:Le6;

    .line 2
    .line 3
    iget-object p0, p0, Le6;->B:Landroidx/lifecycle/a;

    .line 4
    .line 5
    return-object p0
.end method

.method public final r(I)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lj70;->B:Le6;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Le6;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final s()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lj70;->B:Le6;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/Window;->peekDecorView()Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method
