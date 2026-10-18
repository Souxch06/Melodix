.class public final Landroidx/lifecycle/DefaultLifecycleObserverAdapter;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lzh0;


# instance fields
.field public final j:Lvv;

.field public final k:Lzh0;


# direct methods
.method public constructor <init>(Lvv;Lzh0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Landroidx/lifecycle/DefaultLifecycleObserverAdapter;->j:Lvv;

    .line 5
    .line 6
    iput-object p2, p0, Landroidx/lifecycle/DefaultLifecycleObserverAdapter;->k:Lzh0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final c(Lci0;Lvh0;)V
    .locals 2

    .line 1
    sget-object v0, Lwv;->a:[I

    .line 2
    .line 3
    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    aget v0, v0, v1

    .line 8
    .line 9
    const/4 v1, 0x3

    .line 10
    if-eq v0, v1, :cond_1

    .line 11
    .line 12
    const/4 v1, 0x7

    .line 13
    if-eq v0, v1, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const-string p0, "ON_ANY must not been send by anybody"

    .line 17
    .line 18
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_1
    iget-object v0, p0, Landroidx/lifecycle/DefaultLifecycleObserverAdapter;->j:Lvv;

    .line 23
    .line 24
    invoke-interface {v0}, Lvv;->b()V

    .line 25
    .line 26
    .line 27
    :goto_0
    iget-object p0, p0, Landroidx/lifecycle/DefaultLifecycleObserverAdapter;->k:Lzh0;

    .line 28
    .line 29
    if-eqz p0, :cond_2

    .line 30
    .line 31
    invoke-interface {p0, p1, p2}, Lzh0;->c(Lci0;Lvh0;)V

    .line 32
    .line 33
    .line 34
    :cond_2
    return-void
.end method
