.class final Landroidx/activity/OnBackPressedDispatcher$LifecycleOnBackPressedCancellable;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lzh0;
.implements Lsi;


# instance fields
.field public final j:Landroidx/lifecycle/a;

.field public final k:Lr70;

.field public l:Lur0;

.field public final synthetic m:Landroidx/activity/b;


# direct methods
.method public constructor <init>(Landroidx/activity/b;Landroidx/lifecycle/a;Lr70;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Landroidx/activity/OnBackPressedDispatcher$LifecycleOnBackPressedCancellable;->m:Landroidx/activity/b;

    .line 8
    .line 9
    iput-object p2, p0, Landroidx/activity/OnBackPressedDispatcher$LifecycleOnBackPressedCancellable;->j:Landroidx/lifecycle/a;

    .line 10
    .line 11
    iput-object p3, p0, Landroidx/activity/OnBackPressedDispatcher$LifecycleOnBackPressedCancellable;->k:Lr70;

    .line 12
    .line 13
    invoke-virtual {p2, p0}, Landroidx/lifecycle/a;->a(Lbi0;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final c(Lci0;Lvh0;)V
    .locals 8

    .line 1
    sget-object p1, Lvh0;->ON_START:Lvh0;

    .line 2
    .line 3
    if-ne p2, p1, :cond_0

    .line 4
    .line 5
    iget-object v2, p0, Landroidx/activity/OnBackPressedDispatcher$LifecycleOnBackPressedCancellable;->m:Landroidx/activity/b;

    .line 6
    .line 7
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Landroidx/activity/OnBackPressedDispatcher$LifecycleOnBackPressedCancellable;->k:Lr70;

    .line 11
    .line 12
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 13
    .line 14
    .line 15
    iget-object p2, v2, Landroidx/activity/b;->b:Laa;

    .line 16
    .line 17
    invoke-virtual {p2, p1}, Laa;->addLast(Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    new-instance p2, Lur0;

    .line 21
    .line 22
    invoke-direct {p2, v2, p1}, Lur0;-><init>(Landroidx/activity/b;Lr70;)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p1, Lr70;->b:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 26
    .line 27
    invoke-virtual {v0, p2}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    invoke-virtual {v2}, Landroidx/activity/b;->d()V

    .line 31
    .line 32
    .line 33
    new-instance v0, Lat;

    .line 34
    .line 35
    const/4 v6, 0x0

    .line 36
    const/4 v7, 0x3

    .line 37
    const/4 v1, 0x0

    .line 38
    const-class v3, Landroidx/activity/b;

    .line 39
    .line 40
    const-string v4, "updateEnabledCallbacks"

    .line 41
    .line 42
    const-string v5, "updateEnabledCallbacks()V"

    .line 43
    .line 44
    invoke-direct/range {v0 .. v7}, Lat;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;II)V

    .line 45
    .line 46
    .line 47
    iput-object v0, p1, Lr70;->c:Lp80;

    .line 48
    .line 49
    iput-object p2, p0, Landroidx/activity/OnBackPressedDispatcher$LifecycleOnBackPressedCancellable;->l:Lur0;

    .line 50
    .line 51
    return-void

    .line 52
    :cond_0
    sget-object p1, Lvh0;->ON_STOP:Lvh0;

    .line 53
    .line 54
    if-ne p2, p1, :cond_1

    .line 55
    .line 56
    iget-object p0, p0, Landroidx/activity/OnBackPressedDispatcher$LifecycleOnBackPressedCancellable;->l:Lur0;

    .line 57
    .line 58
    if-eqz p0, :cond_2

    .line 59
    .line 60
    invoke-virtual {p0}, Lur0;->cancel()V

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :cond_1
    sget-object p1, Lvh0;->ON_DESTROY:Lvh0;

    .line 65
    .line 66
    if-ne p2, p1, :cond_2

    .line 67
    .line 68
    invoke-virtual {p0}, Landroidx/activity/OnBackPressedDispatcher$LifecycleOnBackPressedCancellable;->cancel()V

    .line 69
    .line 70
    .line 71
    :cond_2
    return-void
.end method

.method public final cancel()V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/activity/OnBackPressedDispatcher$LifecycleOnBackPressedCancellable;->j:Landroidx/lifecycle/a;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Landroidx/lifecycle/a;->f(Lbi0;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Landroidx/activity/OnBackPressedDispatcher$LifecycleOnBackPressedCancellable;->k:Lr70;

    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    iget-object v0, v0, Lr70;->b:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Ljava/util/concurrent/CopyOnWriteArrayList;->remove(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Landroidx/activity/OnBackPressedDispatcher$LifecycleOnBackPressedCancellable;->l:Lur0;

    .line 17
    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    invoke-virtual {v0}, Lur0;->cancel()V

    .line 21
    .line 22
    .line 23
    :cond_0
    const/4 v0, 0x0

    .line 24
    iput-object v0, p0, Landroidx/activity/OnBackPressedDispatcher$LifecycleOnBackPressedCancellable;->l:Lur0;

    .line 25
    .line 26
    return-void
.end method
