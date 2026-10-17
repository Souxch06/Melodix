.class Landroidx/fragment/app/FragmentManager$6;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lzh0;


# virtual methods
.method public final c(Lci0;Lvh0;)V
    .locals 0

    .line 1
    sget-object p0, Lvh0;->ON_START:Lvh0;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    if-eq p2, p0, :cond_1

    .line 5
    .line 6
    sget-object p0, Lvh0;->ON_DESTROY:Lvh0;

    .line 7
    .line 8
    if-eq p2, p0, :cond_0

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    throw p1

    .line 12
    :cond_1
    throw p1
.end method
