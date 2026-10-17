.class public final Landroidx/lifecycle/SavedStateHandleController;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lzh0;


# instance fields
.field public j:Z


# virtual methods
.method public final c(Lci0;Lvh0;)V
    .locals 1

    .line 1
    sget-object v0, Lvh0;->ON_DESTROY:Lvh0;

    .line 2
    .line 3
    if-ne p2, v0, :cond_0

    .line 4
    .line 5
    const/4 p2, 0x0

    .line 6
    iput-boolean p2, p0, Landroidx/lifecycle/SavedStateHandleController;->j:Z

    .line 7
    .line 8
    invoke-interface {p1}, Lci0;->e()Landroidx/lifecycle/a;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p1, p0}, Landroidx/lifecycle/a;->f(Lbi0;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method
