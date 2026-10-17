.class public final Lku0;
.super Lc1;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final synthetic d:Llu0;


# direct methods
.method public constructor <init>(Llu0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lku0;->d:Llu0;

    .line 2
    .line 3
    invoke-direct {p0}, Lc1;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final d(Landroid/view/View;Lo1;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lku0;->d:Llu0;

    .line 2
    .line 3
    iget-object v0, p0, Llu0;->g:Lcz0;

    .line 4
    .line 5
    invoke-virtual {v0, p1, p2}, Lcz0;->d(Landroid/view/View;Lo1;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Llu0;->f:Landroidx/recyclerview/widget/RecyclerView;

    .line 9
    .line 10
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    invoke-static {p1}, Landroidx/recyclerview/widget/RecyclerView;->G(Landroid/view/View;)Lmu0;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    const/4 p2, -0x1

    .line 18
    if-eqz p1, :cond_1

    .line 19
    .line 20
    iget-object v0, p1, Lmu0;->r:Landroidx/recyclerview/widget/RecyclerView;

    .line 21
    .line 22
    if-nez v0, :cond_0

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView;->D(Lmu0;)I

    .line 26
    .line 27
    .line 28
    move-result p2

    .line 29
    :cond_1
    :goto_0
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Lhy0;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    instance-of p1, p0, Lhu0;

    .line 34
    .line 35
    if-nez p1, :cond_2

    .line 36
    .line 37
    return-void

    .line 38
    :cond_2
    check-cast p0, Lhu0;

    .line 39
    .line 40
    invoke-virtual {p0, p2}, Lhu0;->e(I)Landroidx/preference/Preference;

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public final g(Landroid/view/View;ILandroid/os/Bundle;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lku0;->d:Llu0;

    .line 2
    .line 3
    iget-object p0, p0, Llu0;->g:Lcz0;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3}, Lcz0;->g(Landroid/view/View;ILandroid/os/Bundle;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
